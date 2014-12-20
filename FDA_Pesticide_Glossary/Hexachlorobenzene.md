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
-4.785514, 1.144905, -0.7702746, 1, 0, 0, 1,
-3.230139, -0.5032966, 0.08652015, 1, 0.007843138, 0, 1,
-2.470004, -0.8573923, -2.279614, 1, 0.01176471, 0, 1,
-2.381068, -0.3390342, -2.657369, 1, 0.01960784, 0, 1,
-2.34986, 0.3502931, 0.6721269, 1, 0.02352941, 0, 1,
-2.321831, -1.451928, -4.333896, 1, 0.03137255, 0, 1,
-2.201993, -0.000369908, -1.872196, 1, 0.03529412, 0, 1,
-2.192507, 1.09209, 0.07520372, 1, 0.04313726, 0, 1,
-2.181019, 0.3751774, -0.1317619, 1, 0.04705882, 0, 1,
-2.158805, 0.6848089, -0.7027484, 1, 0.05490196, 0, 1,
-2.128179, 1.194954, -1.479226, 1, 0.05882353, 0, 1,
-2.120615, -0.3001063, -1.296332, 1, 0.06666667, 0, 1,
-2.115809, 0.04498797, -0.2489438, 1, 0.07058824, 0, 1,
-2.109524, -0.09156068, -2.609698, 1, 0.07843138, 0, 1,
-2.015422, 0.02793473, -4.066281, 1, 0.08235294, 0, 1,
-2.00745, -0.594196, -1.551751, 1, 0.09019608, 0, 1,
-1.987327, 0.1094534, -1.81306, 1, 0.09411765, 0, 1,
-1.974976, -0.7194058, -0.4507839, 1, 0.1019608, 0, 1,
-1.954319, -0.1302236, -3.686675, 1, 0.1098039, 0, 1,
-1.949813, 0.2274468, -2.174894, 1, 0.1137255, 0, 1,
-1.94605, -0.9474392, -2.604804, 1, 0.1215686, 0, 1,
-1.915795, 1.306118, -1.655597, 1, 0.1254902, 0, 1,
-1.876883, -0.8390154, -1.233338, 1, 0.1333333, 0, 1,
-1.848497, 0.3225113, -1.635149, 1, 0.1372549, 0, 1,
-1.83305, 0.7139764, -1.632995, 1, 0.145098, 0, 1,
-1.827545, 0.8078102, -0.02802533, 1, 0.1490196, 0, 1,
-1.826964, -0.1806839, -2.897876, 1, 0.1568628, 0, 1,
-1.826782, -0.08337098, -1.428722, 1, 0.1607843, 0, 1,
-1.794968, 1.194284, -2.086616, 1, 0.1686275, 0, 1,
-1.788205, 0.6771388, -2.710129, 1, 0.172549, 0, 1,
-1.773524, 0.2781122, -2.207307, 1, 0.1803922, 0, 1,
-1.772647, 0.6610851, 0.49976, 1, 0.1843137, 0, 1,
-1.767214, 1.369332, -0.4770705, 1, 0.1921569, 0, 1,
-1.757629, 1.123227, -1.106359, 1, 0.1960784, 0, 1,
-1.749535, 1.734764, -1.178254, 1, 0.2039216, 0, 1,
-1.748081, -0.7648277, -2.493337, 1, 0.2117647, 0, 1,
-1.736669, -0.8679311, -2.731907, 1, 0.2156863, 0, 1,
-1.735251, -0.6063996, -2.939863, 1, 0.2235294, 0, 1,
-1.719527, 0.9305138, -0.552218, 1, 0.227451, 0, 1,
-1.710754, -0.207987, -1.467644, 1, 0.2352941, 0, 1,
-1.706591, -0.4748992, -1.152303, 1, 0.2392157, 0, 1,
-1.704117, 0.5659091, -1.165422, 1, 0.2470588, 0, 1,
-1.683163, 0.9003037, -2.18183, 1, 0.2509804, 0, 1,
-1.665749, 1.682281, -0.9301675, 1, 0.2588235, 0, 1,
-1.665724, -0.9781699, -1.7907, 1, 0.2627451, 0, 1,
-1.662679, 1.805851, -1.653752, 1, 0.2705882, 0, 1,
-1.645125, 0.757741, -1.88849, 1, 0.2745098, 0, 1,
-1.633129, 0.7504132, -2.106069, 1, 0.282353, 0, 1,
-1.627009, 0.4255278, -0.06244652, 1, 0.2862745, 0, 1,
-1.624032, -0.698193, -3.016682, 1, 0.2941177, 0, 1,
-1.606706, -0.3977045, -2.272346, 1, 0.3019608, 0, 1,
-1.585139, -0.2987954, -2.54826, 1, 0.3058824, 0, 1,
-1.570078, -0.716493, -3.050706, 1, 0.3137255, 0, 1,
-1.566061, -0.9975061, -2.741429, 1, 0.3176471, 0, 1,
-1.562982, -1.060062, -2.406797, 1, 0.3254902, 0, 1,
-1.561496, 1.419474, -2.433514, 1, 0.3294118, 0, 1,
-1.552844, 0.5726355, -1.584374, 1, 0.3372549, 0, 1,
-1.536578, 0.6925605, -0.5399016, 1, 0.3411765, 0, 1,
-1.532013, 0.1617952, -2.479536, 1, 0.3490196, 0, 1,
-1.5272, -0.1818674, -3.51126, 1, 0.3529412, 0, 1,
-1.506982, 0.7713299, -1.273685, 1, 0.3607843, 0, 1,
-1.492727, 0.8967794, 1.109231, 1, 0.3647059, 0, 1,
-1.489802, 0.2782801, 0.5462966, 1, 0.372549, 0, 1,
-1.47409, -0.1524195, -2.932068, 1, 0.3764706, 0, 1,
-1.472661, 0.7620298, 0.5680689, 1, 0.3843137, 0, 1,
-1.471365, 0.4319311, -1.851772, 1, 0.3882353, 0, 1,
-1.469111, 0.5529279, -0.4795648, 1, 0.3960784, 0, 1,
-1.467327, -0.335341, 0.4443264, 1, 0.4039216, 0, 1,
-1.456441, -1.465374, -2.456217, 1, 0.4078431, 0, 1,
-1.453923, -0.2737042, -0.8199485, 1, 0.4156863, 0, 1,
-1.446894, -1.23724, -0.6753315, 1, 0.4196078, 0, 1,
-1.445048, -1.612688, -3.527107, 1, 0.427451, 0, 1,
-1.441141, -0.06686972, -1.220314, 1, 0.4313726, 0, 1,
-1.433636, 0.8943288, -2.079746, 1, 0.4392157, 0, 1,
-1.414341, 0.5650523, -0.791546, 1, 0.4431373, 0, 1,
-1.404173, -0.765587, -0.496496, 1, 0.4509804, 0, 1,
-1.397581, -0.4145426, -2.162617, 1, 0.454902, 0, 1,
-1.394704, -1.425443, -3.97502, 1, 0.4627451, 0, 1,
-1.392044, 1.846733, -2.164291, 1, 0.4666667, 0, 1,
-1.386476, -0.8037408, -1.644332, 1, 0.4745098, 0, 1,
-1.379027, 0.4143683, 1.168414, 1, 0.4784314, 0, 1,
-1.377999, -0.7779112, -1.490546, 1, 0.4862745, 0, 1,
-1.36946, 0.3232277, -1.293244, 1, 0.4901961, 0, 1,
-1.365958, -0.3698976, -2.752479, 1, 0.4980392, 0, 1,
-1.362696, -0.07916824, -0.2225139, 1, 0.5058824, 0, 1,
-1.361598, -1.706248, -1.839689, 1, 0.509804, 0, 1,
-1.350709, 0.1319757, -0.908641, 1, 0.5176471, 0, 1,
-1.341458, 0.3800808, -3.06376, 1, 0.5215687, 0, 1,
-1.341348, 0.3111201, -1.468013, 1, 0.5294118, 0, 1,
-1.335458, -0.9141797, -2.562543, 1, 0.5333334, 0, 1,
-1.327803, -0.5424704, -3.027805, 1, 0.5411765, 0, 1,
-1.327338, -0.03042462, -1.485751, 1, 0.5450981, 0, 1,
-1.316712, -1.001261, -3.466876, 1, 0.5529412, 0, 1,
-1.304267, -0.3928063, -1.179908, 1, 0.5568628, 0, 1,
-1.290919, 0.4904154, 0.2156511, 1, 0.5647059, 0, 1,
-1.288145, -0.7636347, -1.862057, 1, 0.5686275, 0, 1,
-1.2828, 0.7147924, -1.415648, 1, 0.5764706, 0, 1,
-1.276016, 0.8598033, -1.471289, 1, 0.5803922, 0, 1,
-1.274204, 0.9658169, -0.6444209, 1, 0.5882353, 0, 1,
-1.268802, -1.397608, -2.436046, 1, 0.5921569, 0, 1,
-1.261368, -2.098102, -1.587463, 1, 0.6, 0, 1,
-1.249031, -1.341608, -1.702134, 1, 0.6078432, 0, 1,
-1.246832, -0.5283816, -4.568103, 1, 0.6117647, 0, 1,
-1.234583, 1.51288, -2.708226, 1, 0.6196079, 0, 1,
-1.231893, 2.108733, -1.000535, 1, 0.6235294, 0, 1,
-1.226965, -1.453936, -1.814778, 1, 0.6313726, 0, 1,
-1.224786, 0.1667969, -1.358254, 1, 0.6352941, 0, 1,
-1.211568, -0.9891707, -1.826062, 1, 0.6431373, 0, 1,
-1.202906, -0.03309725, -3.332884, 1, 0.6470588, 0, 1,
-1.195338, 0.7599274, 0.6061965, 1, 0.654902, 0, 1,
-1.188285, -0.3306283, 0.2741819, 1, 0.6588235, 0, 1,
-1.179016, -0.04926412, -0.03319175, 1, 0.6666667, 0, 1,
-1.1755, 0.8712853, 0.4170493, 1, 0.6705883, 0, 1,
-1.175234, -0.7672079, -1.968919, 1, 0.6784314, 0, 1,
-1.175137, 2.079627, 0.7956474, 1, 0.682353, 0, 1,
-1.160513, -0.9998147, -0.8059489, 1, 0.6901961, 0, 1,
-1.158358, 0.7771388, -0.9167512, 1, 0.6941177, 0, 1,
-1.15825, -0.5166255, -1.554762, 1, 0.7019608, 0, 1,
-1.156742, -0.4000607, -2.560108, 1, 0.7098039, 0, 1,
-1.152575, 0.8269734, -0.8074259, 1, 0.7137255, 0, 1,
-1.15036, -0.4892778, -1.760548, 1, 0.7215686, 0, 1,
-1.145573, -0.9503167, -3.101509, 1, 0.7254902, 0, 1,
-1.145376, 2.010692, -0.7820833, 1, 0.7333333, 0, 1,
-1.134595, -0.8507904, -2.895271, 1, 0.7372549, 0, 1,
-1.124397, 2.269547, -1.748223, 1, 0.7450981, 0, 1,
-1.123058, -1.383767, -0.753106, 1, 0.7490196, 0, 1,
-1.12134, -2.200832, -2.100174, 1, 0.7568628, 0, 1,
-1.103471, -0.293124, -2.551882, 1, 0.7607843, 0, 1,
-1.098647, 1.378064, -0.909716, 1, 0.7686275, 0, 1,
-1.097922, -1.051527, -1.165933, 1, 0.772549, 0, 1,
-1.090837, -1.234657, -3.736318, 1, 0.7803922, 0, 1,
-1.072711, -1.151261, -1.517803, 1, 0.7843137, 0, 1,
-1.069877, -0.05980582, -2.215999, 1, 0.7921569, 0, 1,
-1.064741, -0.340534, -3.418067, 1, 0.7960784, 0, 1,
-1.064218, -1.408519, -2.998148, 1, 0.8039216, 0, 1,
-1.054746, 0.5907392, -1.687965, 1, 0.8117647, 0, 1,
-1.053518, 0.5881465, -1.223122, 1, 0.8156863, 0, 1,
-1.052231, 0.4336031, -0.207406, 1, 0.8235294, 0, 1,
-1.048233, -0.4923296, -2.420084, 1, 0.827451, 0, 1,
-1.03911, 0.05608134, -1.907293, 1, 0.8352941, 0, 1,
-1.031006, 0.05897776, -3.139915, 1, 0.8392157, 0, 1,
-1.024387, -0.6934001, -1.37883, 1, 0.8470588, 0, 1,
-1.023949, 0.7835225, -0.7418659, 1, 0.8509804, 0, 1,
-1.019274, -0.1047466, -2.849113, 1, 0.8588235, 0, 1,
-1.013867, -1.528067, -2.983497, 1, 0.8627451, 0, 1,
-1.012638, 0.6039845, 0.2704606, 1, 0.8705882, 0, 1,
-1.009965, -0.4126077, -2.229986, 1, 0.8745098, 0, 1,
-1.005565, 1.248138, -1.491701, 1, 0.8823529, 0, 1,
-1.005081, -0.2174505, -2.517351, 1, 0.8862745, 0, 1,
-0.9942204, -0.5764859, -0.2112333, 1, 0.8941177, 0, 1,
-0.9918243, -0.450395, -1.08936, 1, 0.8980392, 0, 1,
-0.9869909, 1.616595, -1.617187, 1, 0.9058824, 0, 1,
-0.9864262, -0.2479337, -0.8623339, 1, 0.9137255, 0, 1,
-0.9833615, -0.05658069, -2.717967, 1, 0.9176471, 0, 1,
-0.9777262, -0.1853592, -2.980715, 1, 0.9254902, 0, 1,
-0.9735476, -1.032742, -3.096086, 1, 0.9294118, 0, 1,
-0.9701824, -0.8782719, -1.39024, 1, 0.9372549, 0, 1,
-0.9626989, 0.3445242, 1.290315, 1, 0.9411765, 0, 1,
-0.9568878, -1.881412, -4.654525, 1, 0.9490196, 0, 1,
-0.9565969, -0.5995752, -1.580235, 1, 0.9529412, 0, 1,
-0.9539901, -0.6308289, -3.059154, 1, 0.9607843, 0, 1,
-0.952321, 0.4208335, 0.01976182, 1, 0.9647059, 0, 1,
-0.9523172, 0.9819166, -1.613901, 1, 0.972549, 0, 1,
-0.944941, 0.794572, -1.130996, 1, 0.9764706, 0, 1,
-0.9347055, 0.4419912, -2.575663, 1, 0.9843137, 0, 1,
-0.930464, -2.057482, -3.673025, 1, 0.9882353, 0, 1,
-0.9292989, 1.330884, -0.3568129, 1, 0.9960784, 0, 1,
-0.9263018, -0.882782, -2.787925, 0.9960784, 1, 0, 1,
-0.9236963, 0.1520082, -1.42927, 0.9921569, 1, 0, 1,
-0.9236716, 0.5264378, -1.53817, 0.9843137, 1, 0, 1,
-0.9152361, -0.3610661, -4.840024, 0.9803922, 1, 0, 1,
-0.9073209, 1.054287, -1.64664, 0.972549, 1, 0, 1,
-0.9027342, 1.5874, -2.556937, 0.9686275, 1, 0, 1,
-0.8939951, -0.4795656, -2.425488, 0.9607843, 1, 0, 1,
-0.8880733, -0.8101155, -2.471054, 0.9568627, 1, 0, 1,
-0.8782761, -2.531632, -2.175429, 0.9490196, 1, 0, 1,
-0.8778155, 0.1524563, -1.504457, 0.945098, 1, 0, 1,
-0.8748642, 0.608102, 0.6920065, 0.9372549, 1, 0, 1,
-0.8684363, -0.7041993, -0.5948679, 0.9333333, 1, 0, 1,
-0.8662719, -0.03684174, -1.392768, 0.9254902, 1, 0, 1,
-0.8494136, 1.092638, -1.609279, 0.9215686, 1, 0, 1,
-0.8383442, 1.482274, -1.536405, 0.9137255, 1, 0, 1,
-0.8375781, -0.5882465, -3.76767, 0.9098039, 1, 0, 1,
-0.8365648, 0.2217423, -1.939373, 0.9019608, 1, 0, 1,
-0.8351784, 0.718226, -1.529108, 0.8941177, 1, 0, 1,
-0.8304462, -1.179382, -2.184425, 0.8901961, 1, 0, 1,
-0.8294626, 1.243932, -0.9264162, 0.8823529, 1, 0, 1,
-0.8192987, -0.09571017, -0.4492972, 0.8784314, 1, 0, 1,
-0.817027, 0.9118972, -1.02613, 0.8705882, 1, 0, 1,
-0.8158175, 1.196828, -0.5589895, 0.8666667, 1, 0, 1,
-0.8108821, -0.9785436, -2.768836, 0.8588235, 1, 0, 1,
-0.8068592, -0.3640632, -1.606687, 0.854902, 1, 0, 1,
-0.7953883, -0.1092504, -1.465051, 0.8470588, 1, 0, 1,
-0.7951705, -0.1818243, -2.706959, 0.8431373, 1, 0, 1,
-0.7883053, 1.944858, -0.1520112, 0.8352941, 1, 0, 1,
-0.786688, 1.606763, -1.193929, 0.8313726, 1, 0, 1,
-0.7847722, -0.06447869, -2.18778, 0.8235294, 1, 0, 1,
-0.7827129, -1.465273, -2.445708, 0.8196079, 1, 0, 1,
-0.7822979, -0.4852089, 0.03785963, 0.8117647, 1, 0, 1,
-0.7714155, -0.04259363, -1.798288, 0.8078431, 1, 0, 1,
-0.7693866, 0.09707372, -2.221558, 0.8, 1, 0, 1,
-0.7688962, 0.2014945, -1.184244, 0.7921569, 1, 0, 1,
-0.7667981, 1.425361, -1.20968, 0.7882353, 1, 0, 1,
-0.7638528, 1.501632, -1.33604, 0.7803922, 1, 0, 1,
-0.7589483, -0.8852243, -2.272607, 0.7764706, 1, 0, 1,
-0.7510383, 0.4517925, 0.549992, 0.7686275, 1, 0, 1,
-0.7510284, 0.7737461, -0.4365209, 0.7647059, 1, 0, 1,
-0.748442, -0.7472305, -1.659073, 0.7568628, 1, 0, 1,
-0.7390733, 0.9649251, -1.442596, 0.7529412, 1, 0, 1,
-0.7360418, 2.395561, 0.1238196, 0.7450981, 1, 0, 1,
-0.7332621, 0.7061679, -2.188573, 0.7411765, 1, 0, 1,
-0.7299212, 1.510489, 0.1000293, 0.7333333, 1, 0, 1,
-0.7280203, 0.1470648, -1.482472, 0.7294118, 1, 0, 1,
-0.7216132, 0.6115971, -1.652399, 0.7215686, 1, 0, 1,
-0.7184222, 1.555546, -2.160849, 0.7176471, 1, 0, 1,
-0.7173744, -0.4653314, -0.9449349, 0.7098039, 1, 0, 1,
-0.716502, 1.032485, -0.03730293, 0.7058824, 1, 0, 1,
-0.7160053, 0.173988, -1.141949, 0.6980392, 1, 0, 1,
-0.7103931, -0.5522564, -2.116346, 0.6901961, 1, 0, 1,
-0.7096536, 1.596615, -0.8284944, 0.6862745, 1, 0, 1,
-0.7082555, 1.034523, -1.086448, 0.6784314, 1, 0, 1,
-0.7042741, -0.5916873, -1.88062, 0.6745098, 1, 0, 1,
-0.6928229, -0.6841966, -1.068547, 0.6666667, 1, 0, 1,
-0.6928073, -0.2426012, -1.377906, 0.6627451, 1, 0, 1,
-0.6860734, -0.4440766, -2.720391, 0.654902, 1, 0, 1,
-0.684295, -1.687155, -5.34512, 0.6509804, 1, 0, 1,
-0.6787617, -0.7764186, -2.696722, 0.6431373, 1, 0, 1,
-0.6721514, 1.019429, -2.326863, 0.6392157, 1, 0, 1,
-0.6718389, 0.8096995, 0.5333638, 0.6313726, 1, 0, 1,
-0.6701373, -1.369838, -2.38876, 0.627451, 1, 0, 1,
-0.6658289, 0.5259165, -1.611556, 0.6196079, 1, 0, 1,
-0.6633093, 0.291565, -0.8313556, 0.6156863, 1, 0, 1,
-0.6605626, 0.05210396, -1.710512, 0.6078432, 1, 0, 1,
-0.6605275, -0.5232143, -1.247577, 0.6039216, 1, 0, 1,
-0.654498, -0.1563756, -2.407165, 0.5960785, 1, 0, 1,
-0.6539677, 0.299805, -0.4071018, 0.5882353, 1, 0, 1,
-0.6534396, 1.388001, -0.856289, 0.5843138, 1, 0, 1,
-0.6466824, -0.3504967, -2.318794, 0.5764706, 1, 0, 1,
-0.6443441, 1.191349, -2.076666, 0.572549, 1, 0, 1,
-0.6426356, -1.205636, -2.837514, 0.5647059, 1, 0, 1,
-0.6366307, 1.375896, -0.04538259, 0.5607843, 1, 0, 1,
-0.6356133, 1.934426, 1.169651, 0.5529412, 1, 0, 1,
-0.635167, -0.07636416, -0.7429346, 0.5490196, 1, 0, 1,
-0.6336908, -0.5922842, -3.964334, 0.5411765, 1, 0, 1,
-0.6282799, -0.1125096, 0.9172876, 0.5372549, 1, 0, 1,
-0.6279569, 0.1712137, -1.007178, 0.5294118, 1, 0, 1,
-0.6256593, -0.1853082, 0.4696586, 0.5254902, 1, 0, 1,
-0.6204676, -0.9512845, -1.282472, 0.5176471, 1, 0, 1,
-0.6109351, 0.7332876, -0.4286623, 0.5137255, 1, 0, 1,
-0.6097938, -0.6785181, -3.760807, 0.5058824, 1, 0, 1,
-0.6081154, -0.2515962, -3.015685, 0.5019608, 1, 0, 1,
-0.6080423, 0.859633, -0.3689829, 0.4941176, 1, 0, 1,
-0.6070782, 0.3621699, -0.4530985, 0.4862745, 1, 0, 1,
-0.60412, -0.8525131, -2.110778, 0.4823529, 1, 0, 1,
-0.6037416, 0.8271079, -1.836549, 0.4745098, 1, 0, 1,
-0.6036429, -0.8764198, -2.901916, 0.4705882, 1, 0, 1,
-0.6033927, -0.5426369, -1.49397, 0.4627451, 1, 0, 1,
-0.599879, 1.673198, -0.2809803, 0.4588235, 1, 0, 1,
-0.598804, -0.2714375, -1.753732, 0.4509804, 1, 0, 1,
-0.5979048, -1.096981, -2.053537, 0.4470588, 1, 0, 1,
-0.5969205, 0.3984409, -1.154252, 0.4392157, 1, 0, 1,
-0.5962927, 0.2583889, 0.5595331, 0.4352941, 1, 0, 1,
-0.5900187, -0.4367404, -2.094871, 0.427451, 1, 0, 1,
-0.5890986, -0.1490125, -0.4170096, 0.4235294, 1, 0, 1,
-0.5875919, -0.5048479, -3.904632, 0.4156863, 1, 0, 1,
-0.5817783, -0.3174753, -2.977686, 0.4117647, 1, 0, 1,
-0.581099, 0.3538674, -0.7641146, 0.4039216, 1, 0, 1,
-0.5784986, 0.8314071, 1.902167, 0.3960784, 1, 0, 1,
-0.5730893, -0.3005034, -1.347576, 0.3921569, 1, 0, 1,
-0.5726725, 1.605862, -1.804861, 0.3843137, 1, 0, 1,
-0.5714515, -1.993338, -2.833884, 0.3803922, 1, 0, 1,
-0.5710199, -1.979562, -3.457288, 0.372549, 1, 0, 1,
-0.5669319, 0.3406559, -0.7735408, 0.3686275, 1, 0, 1,
-0.5589672, 0.35039, -0.07374687, 0.3607843, 1, 0, 1,
-0.5549665, -0.2240557, -3.493347, 0.3568628, 1, 0, 1,
-0.5537453, -0.342368, -1.963183, 0.3490196, 1, 0, 1,
-0.5526298, -0.8903854, -2.131131, 0.345098, 1, 0, 1,
-0.547409, -0.3470062, -1.778304, 0.3372549, 1, 0, 1,
-0.5455179, -0.200547, -1.285831, 0.3333333, 1, 0, 1,
-0.5415756, -0.9326859, -3.19816, 0.3254902, 1, 0, 1,
-0.5403156, 2.056102, 0.8907519, 0.3215686, 1, 0, 1,
-0.5402945, -0.6935154, -0.8208492, 0.3137255, 1, 0, 1,
-0.5370532, -2.459965, -2.204273, 0.3098039, 1, 0, 1,
-0.5369465, 0.1119767, -1.665328, 0.3019608, 1, 0, 1,
-0.5358561, -1.109756, -3.834083, 0.2941177, 1, 0, 1,
-0.5304025, 1.31599, -0.9865835, 0.2901961, 1, 0, 1,
-0.5240247, -0.5301014, -4.93246, 0.282353, 1, 0, 1,
-0.5238884, -1.237258, -2.889681, 0.2784314, 1, 0, 1,
-0.5227758, 0.5583397, -0.7916458, 0.2705882, 1, 0, 1,
-0.5206615, 1.250909, 1.04873, 0.2666667, 1, 0, 1,
-0.5185524, -0.8625567, -2.513114, 0.2588235, 1, 0, 1,
-0.5151969, -1.523473, -3.884036, 0.254902, 1, 0, 1,
-0.5127715, 0.07533953, -1.163556, 0.2470588, 1, 0, 1,
-0.504838, 1.609085, 0.3583104, 0.2431373, 1, 0, 1,
-0.5016423, -0.3546589, -2.269706, 0.2352941, 1, 0, 1,
-0.4960285, -1.255496, -3.747293, 0.2313726, 1, 0, 1,
-0.4949666, 0.2054139, -1.365438, 0.2235294, 1, 0, 1,
-0.4934177, -0.05790892, -0.788518, 0.2196078, 1, 0, 1,
-0.4859998, -0.7941939, -2.174906, 0.2117647, 1, 0, 1,
-0.4854672, -1.52068, -1.734327, 0.2078431, 1, 0, 1,
-0.4639962, -0.9908432, -2.912546, 0.2, 1, 0, 1,
-0.4597633, 0.823795, -1.513468, 0.1921569, 1, 0, 1,
-0.4576527, 0.9481858, -0.8343514, 0.1882353, 1, 0, 1,
-0.4574713, -0.03924485, -3.121512, 0.1803922, 1, 0, 1,
-0.4567241, 0.4080161, -0.6906529, 0.1764706, 1, 0, 1,
-0.4528737, 0.4734139, -0.1637309, 0.1686275, 1, 0, 1,
-0.4514188, -0.3816391, -1.769459, 0.1647059, 1, 0, 1,
-0.4504302, -0.2242674, -1.327601, 0.1568628, 1, 0, 1,
-0.4492521, 0.2465948, 0.4027353, 0.1529412, 1, 0, 1,
-0.4483235, -0.6729512, -2.73277, 0.145098, 1, 0, 1,
-0.4446031, -0.1389296, -0.4664916, 0.1411765, 1, 0, 1,
-0.4413304, -0.5747373, -1.663407, 0.1333333, 1, 0, 1,
-0.4393416, 0.4638705, -0.9907908, 0.1294118, 1, 0, 1,
-0.4357969, -1.383929, -3.685679, 0.1215686, 1, 0, 1,
-0.4337868, -0.5863282, -3.325836, 0.1176471, 1, 0, 1,
-0.428544, -1.815172, -4.353442, 0.1098039, 1, 0, 1,
-0.4267196, -0.6719778, -2.044261, 0.1058824, 1, 0, 1,
-0.4242067, 0.609791, -0.5896358, 0.09803922, 1, 0, 1,
-0.4218918, 0.3397819, 1.236797, 0.09019608, 1, 0, 1,
-0.4169, -0.908742, -1.860736, 0.08627451, 1, 0, 1,
-0.4146754, 1.190598, -1.72918, 0.07843138, 1, 0, 1,
-0.413304, -0.2700841, -2.459088, 0.07450981, 1, 0, 1,
-0.4082162, 1.012462, -0.5243816, 0.06666667, 1, 0, 1,
-0.4031874, 1.181921, 1.954607, 0.0627451, 1, 0, 1,
-0.4007243, 0.1741775, -0.4132881, 0.05490196, 1, 0, 1,
-0.4006423, -1.02295, -3.130874, 0.05098039, 1, 0, 1,
-0.3986127, -0.08821724, -2.188784, 0.04313726, 1, 0, 1,
-0.3985483, 2.444942, -0.924482, 0.03921569, 1, 0, 1,
-0.3955591, -1.298838, -3.305103, 0.03137255, 1, 0, 1,
-0.3947318, -0.1270605, -1.789326, 0.02745098, 1, 0, 1,
-0.3913123, 0.2922291, -1.144894, 0.01960784, 1, 0, 1,
-0.3785194, 1.145133, 1.257475, 0.01568628, 1, 0, 1,
-0.3705501, -1.210572, -2.411239, 0.007843138, 1, 0, 1,
-0.3690073, -1.025108, -4.336372, 0.003921569, 1, 0, 1,
-0.3589485, -1.310057, -4.154788, 0, 1, 0.003921569, 1,
-0.3585432, 0.5407634, -0.9552229, 0, 1, 0.01176471, 1,
-0.3532134, 0.2651068, 0.1670016, 0, 1, 0.01568628, 1,
-0.3514772, 0.01910716, -1.560845, 0, 1, 0.02352941, 1,
-0.3507216, -0.812218, -3.2601, 0, 1, 0.02745098, 1,
-0.3489677, 0.341565, -0.7793486, 0, 1, 0.03529412, 1,
-0.3471666, 0.7182545, -1.847377, 0, 1, 0.03921569, 1,
-0.3412455, -1.411402, -1.638921, 0, 1, 0.04705882, 1,
-0.3381454, -0.2762939, -4.847017, 0, 1, 0.05098039, 1,
-0.3304306, -1.611659, -5.022861, 0, 1, 0.05882353, 1,
-0.3296366, 0.6159109, -1.815596, 0, 1, 0.0627451, 1,
-0.3295969, 0.1230264, -0.9658962, 0, 1, 0.07058824, 1,
-0.3289788, 1.468311, -0.3042003, 0, 1, 0.07450981, 1,
-0.3280951, 1.579602, -0.6755599, 0, 1, 0.08235294, 1,
-0.3217769, 0.6349487, 0.8027568, 0, 1, 0.08627451, 1,
-0.3179473, -2.43611, -2.486601, 0, 1, 0.09411765, 1,
-0.3164462, 1.761442, 0.9613889, 0, 1, 0.1019608, 1,
-0.314321, 0.07348895, -0.3372806, 0, 1, 0.1058824, 1,
-0.3113717, -0.2831576, -2.024455, 0, 1, 0.1137255, 1,
-0.3112034, 0.6295568, -1.090226, 0, 1, 0.1176471, 1,
-0.3096812, -0.8455043, -1.830142, 0, 1, 0.1254902, 1,
-0.3086897, -0.5184874, -2.151145, 0, 1, 0.1294118, 1,
-0.3033367, 0.9780069, -0.1544625, 0, 1, 0.1372549, 1,
-0.3025458, 1.51964, 1.493631, 0, 1, 0.1411765, 1,
-0.3025092, 0.4768549, -1.026661, 0, 1, 0.1490196, 1,
-0.2986826, -1.474234, -2.926236, 0, 1, 0.1529412, 1,
-0.298637, -0.2621645, -1.122871, 0, 1, 0.1607843, 1,
-0.2966617, -0.6208354, -2.361447, 0, 1, 0.1647059, 1,
-0.296404, 0.3782191, -1.178402, 0, 1, 0.172549, 1,
-0.2953168, -0.2287029, -1.455161, 0, 1, 0.1764706, 1,
-0.2899709, 2.064632, -0.1265649, 0, 1, 0.1843137, 1,
-0.2842405, -1.091052, -3.130601, 0, 1, 0.1882353, 1,
-0.2757296, 1.164563, -0.05910616, 0, 1, 0.1960784, 1,
-0.2747462, 0.8061978, -2.270033, 0, 1, 0.2039216, 1,
-0.2735769, -1.056813, -3.589309, 0, 1, 0.2078431, 1,
-0.2721742, -1.095238, -2.389598, 0, 1, 0.2156863, 1,
-0.2719862, -0.5339373, -2.521536, 0, 1, 0.2196078, 1,
-0.2717583, 0.6720033, -1.696332, 0, 1, 0.227451, 1,
-0.2717517, 0.2001292, 1.076189, 0, 1, 0.2313726, 1,
-0.2697093, 0.2248412, -1.181806, 0, 1, 0.2392157, 1,
-0.2689559, 0.8496852, 0.9292377, 0, 1, 0.2431373, 1,
-0.2674355, 0.5083717, -2.2388, 0, 1, 0.2509804, 1,
-0.2651351, 2.227727, -0.2401835, 0, 1, 0.254902, 1,
-0.2570215, 0.1662487, -0.2447195, 0, 1, 0.2627451, 1,
-0.2564543, -0.2010658, -0.9917556, 0, 1, 0.2666667, 1,
-0.2557732, 0.04118222, -0.8683084, 0, 1, 0.2745098, 1,
-0.2546662, 0.3852127, -1.047289, 0, 1, 0.2784314, 1,
-0.2433731, -0.2175171, -2.853498, 0, 1, 0.2862745, 1,
-0.2431217, -0.01961672, 0.257186, 0, 1, 0.2901961, 1,
-0.2390147, 1.579329, 1.696429, 0, 1, 0.2980392, 1,
-0.2386965, -0.5303923, -3.052741, 0, 1, 0.3058824, 1,
-0.2386927, -0.4381156, -3.296298, 0, 1, 0.3098039, 1,
-0.2381437, -0.07647943, -4.112337, 0, 1, 0.3176471, 1,
-0.2368478, 0.432958, -0.003681618, 0, 1, 0.3215686, 1,
-0.2326828, -1.656836, -3.923003, 0, 1, 0.3294118, 1,
-0.2321088, 0.300934, -0.8644527, 0, 1, 0.3333333, 1,
-0.2313914, 1.539041, -1.243509, 0, 1, 0.3411765, 1,
-0.2304447, -0.8750783, -2.893814, 0, 1, 0.345098, 1,
-0.2304008, -0.8767003, -3.191298, 0, 1, 0.3529412, 1,
-0.2296988, -1.459834, -3.041091, 0, 1, 0.3568628, 1,
-0.2295417, 1.953983, -0.5671868, 0, 1, 0.3647059, 1,
-0.2292619, -0.531264, -0.9340717, 0, 1, 0.3686275, 1,
-0.2255268, 1.542868, -1.161411, 0, 1, 0.3764706, 1,
-0.2241655, 0.592058, -0.07821521, 0, 1, 0.3803922, 1,
-0.2215111, -0.2455835, -0.9624766, 0, 1, 0.3882353, 1,
-0.2211885, -1.35562, -2.470308, 0, 1, 0.3921569, 1,
-0.2177775, -0.6499664, -1.792762, 0, 1, 0.4, 1,
-0.2132146, 0.5007831, 0.6655324, 0, 1, 0.4078431, 1,
-0.2091441, 1.264316, 0.009767051, 0, 1, 0.4117647, 1,
-0.2046158, 0.2099048, -0.3096634, 0, 1, 0.4196078, 1,
-0.2045631, -0.4442464, -3.471477, 0, 1, 0.4235294, 1,
-0.195884, 1.849569, -1.161948, 0, 1, 0.4313726, 1,
-0.1948449, -0.3854584, -1.428096, 0, 1, 0.4352941, 1,
-0.1944144, 0.9019995, 1.733449, 0, 1, 0.4431373, 1,
-0.1942083, -0.1585422, -3.608651, 0, 1, 0.4470588, 1,
-0.1939039, -1.113005, -3.9696, 0, 1, 0.454902, 1,
-0.1906684, -1.783128, -3.859521, 0, 1, 0.4588235, 1,
-0.1901464, 2.653436, 0.3978166, 0, 1, 0.4666667, 1,
-0.1874193, -0.1052718, -2.214417, 0, 1, 0.4705882, 1,
-0.1837935, -0.1000336, -1.801651, 0, 1, 0.4784314, 1,
-0.1779122, -1.580927, -3.136095, 0, 1, 0.4823529, 1,
-0.1772809, 2.036954, -0.6592904, 0, 1, 0.4901961, 1,
-0.1747244, -0.8887658, -4.124219, 0, 1, 0.4941176, 1,
-0.1713677, -0.4293352, -2.162286, 0, 1, 0.5019608, 1,
-0.1691535, -0.1660264, -2.861035, 0, 1, 0.509804, 1,
-0.1644475, 0.02907746, -2.236325, 0, 1, 0.5137255, 1,
-0.1625172, -0.7741297, -3.536275, 0, 1, 0.5215687, 1,
-0.1625008, -0.3744811, -3.47392, 0, 1, 0.5254902, 1,
-0.1579434, 0.7075623, -0.1938329, 0, 1, 0.5333334, 1,
-0.1503916, 1.941459, -1.047702, 0, 1, 0.5372549, 1,
-0.1469806, -1.0893, -3.131633, 0, 1, 0.5450981, 1,
-0.1458882, 0.4049724, -0.681825, 0, 1, 0.5490196, 1,
-0.1451506, -1.25934, -2.576861, 0, 1, 0.5568628, 1,
-0.1449289, 1.669807, 1.923971, 0, 1, 0.5607843, 1,
-0.1444769, -0.03975043, -1.057775, 0, 1, 0.5686275, 1,
-0.1435557, -0.2870341, -1.565968, 0, 1, 0.572549, 1,
-0.1419418, -0.04511383, -2.332168, 0, 1, 0.5803922, 1,
-0.1415903, 0.5336026, -1.560438, 0, 1, 0.5843138, 1,
-0.133889, -0.9665178, -2.408821, 0, 1, 0.5921569, 1,
-0.1334557, 0.3186823, -2.37789, 0, 1, 0.5960785, 1,
-0.1310929, 2.283168, 0.6875597, 0, 1, 0.6039216, 1,
-0.1295545, 0.1173894, -3.347538, 0, 1, 0.6117647, 1,
-0.129395, 0.7985986, 0.1671425, 0, 1, 0.6156863, 1,
-0.126733, -0.5707056, -3.078158, 0, 1, 0.6235294, 1,
-0.126717, 0.01365262, 0.3814051, 0, 1, 0.627451, 1,
-0.1254059, -1.046548, -3.476491, 0, 1, 0.6352941, 1,
-0.1200204, -0.5808568, -1.423559, 0, 1, 0.6392157, 1,
-0.115472, -0.08823168, -4.686769, 0, 1, 0.6470588, 1,
-0.1148173, -0.6411099, -1.777767, 0, 1, 0.6509804, 1,
-0.114383, 0.8435579, -0.5283645, 0, 1, 0.6588235, 1,
-0.1114125, 1.010268, -0.1803568, 0, 1, 0.6627451, 1,
-0.110123, -0.7957002, -2.860583, 0, 1, 0.6705883, 1,
-0.1096056, -0.4851795, -2.77783, 0, 1, 0.6745098, 1,
-0.1055836, 2.446446, 0.213458, 0, 1, 0.682353, 1,
-0.0979808, 0.3751287, 0.9252014, 0, 1, 0.6862745, 1,
-0.09279357, 1.063293, 2.137604, 0, 1, 0.6941177, 1,
-0.08772232, -0.6417111, -3.339275, 0, 1, 0.7019608, 1,
-0.08208121, -0.9480378, -3.757506, 0, 1, 0.7058824, 1,
-0.07817371, -0.8425858, -2.347602, 0, 1, 0.7137255, 1,
-0.07428246, 0.4721313, 0.4647581, 0, 1, 0.7176471, 1,
-0.07363678, -0.8483692, -2.252964, 0, 1, 0.7254902, 1,
-0.06878459, 0.2375438, -0.376733, 0, 1, 0.7294118, 1,
-0.067373, -0.2966854, -4.726915, 0, 1, 0.7372549, 1,
-0.0638833, 0.1060053, -0.9754811, 0, 1, 0.7411765, 1,
-0.06133879, 0.9765173, 0.191516, 0, 1, 0.7490196, 1,
-0.0588902, -0.2188917, -4.258276, 0, 1, 0.7529412, 1,
-0.05858355, 0.2063899, 0.8083352, 0, 1, 0.7607843, 1,
-0.05756272, -0.0994286, -2.744298, 0, 1, 0.7647059, 1,
-0.05228027, -1.806169, -3.459018, 0, 1, 0.772549, 1,
-0.05049707, -0.8000644, -3.548998, 0, 1, 0.7764706, 1,
-0.04962026, 1.331825, -0.372002, 0, 1, 0.7843137, 1,
-0.04817867, -1.621081, -2.19918, 0, 1, 0.7882353, 1,
-0.0475319, 0.258294, -0.2850631, 0, 1, 0.7960784, 1,
-0.04664298, 0.3989083, 2.640718, 0, 1, 0.8039216, 1,
-0.04574629, 1.268501, -0.8052663, 0, 1, 0.8078431, 1,
-0.04534316, 1.625474, -0.1134425, 0, 1, 0.8156863, 1,
-0.04532272, -0.7382054, -3.181644, 0, 1, 0.8196079, 1,
-0.04329544, -1.688312, -3.472239, 0, 1, 0.827451, 1,
-0.04311756, 0.7784221, 0.1658624, 0, 1, 0.8313726, 1,
-0.04257527, -0.2823529, -3.16391, 0, 1, 0.8392157, 1,
-0.03263789, -0.8109201, -2.162214, 0, 1, 0.8431373, 1,
-0.02889884, -0.3186317, -3.291791, 0, 1, 0.8509804, 1,
-0.0279141, 0.4523161, -0.0275261, 0, 1, 0.854902, 1,
-0.01834574, -1.225854, -2.253398, 0, 1, 0.8627451, 1,
-0.01797384, 0.9734753, -0.9087996, 0, 1, 0.8666667, 1,
-0.01625312, -0.1878764, -4.544756, 0, 1, 0.8745098, 1,
-0.01507951, -0.5824624, -2.683364, 0, 1, 0.8784314, 1,
-0.01006168, -0.8311808, -3.842559, 0, 1, 0.8862745, 1,
-0.007604551, 1.18901, -0.5559692, 0, 1, 0.8901961, 1,
-0.006894141, -0.115351, -2.401794, 0, 1, 0.8980392, 1,
-0.005143892, -1.835628, -4.349332, 0, 1, 0.9058824, 1,
-0.004171731, 1.68165, 0.1331607, 0, 1, 0.9098039, 1,
0.001531443, -0.4287257, 2.835278, 0, 1, 0.9176471, 1,
0.002056327, 0.07525148, 1.264274, 0, 1, 0.9215686, 1,
0.002606515, 0.01510397, -1.349299, 0, 1, 0.9294118, 1,
0.003328572, -0.7575315, 2.631192, 0, 1, 0.9333333, 1,
0.00478171, -0.5891909, 2.467708, 0, 1, 0.9411765, 1,
0.006346802, -1.379524, 2.407335, 0, 1, 0.945098, 1,
0.01246148, 0.9571821, -0.2500722, 0, 1, 0.9529412, 1,
0.01459376, 0.4811568, -1.089154, 0, 1, 0.9568627, 1,
0.01595863, -0.9131964, 3.457152, 0, 1, 0.9647059, 1,
0.01914606, -0.7614385, 2.775862, 0, 1, 0.9686275, 1,
0.01989275, -0.1190083, 1.892266, 0, 1, 0.9764706, 1,
0.02644557, -0.8811584, 3.219388, 0, 1, 0.9803922, 1,
0.02721114, -1.123123, 4.111749, 0, 1, 0.9882353, 1,
0.03109237, -0.2811625, 3.757025, 0, 1, 0.9921569, 1,
0.03194899, 0.2667722, -0.6357008, 0, 1, 1, 1,
0.04583828, 0.7625998, 1.590113, 0, 0.9921569, 1, 1,
0.04924195, 0.307845, -0.4797597, 0, 0.9882353, 1, 1,
0.04933425, -0.04612727, 2.259165, 0, 0.9803922, 1, 1,
0.0520695, 1.583454, -0.8264313, 0, 0.9764706, 1, 1,
0.05358832, 1.036746, -0.504182, 0, 0.9686275, 1, 1,
0.05441366, 2.675745, 1.78029, 0, 0.9647059, 1, 1,
0.05446706, 0.8663412, -1.778445, 0, 0.9568627, 1, 1,
0.05446858, -0.1997012, 3.029638, 0, 0.9529412, 1, 1,
0.05745846, 1.152429, 0.06677569, 0, 0.945098, 1, 1,
0.06537434, 0.8685263, 0.08054349, 0, 0.9411765, 1, 1,
0.07022868, -0.3478953, 3.641575, 0, 0.9333333, 1, 1,
0.071528, -0.02992827, 1.884855, 0, 0.9294118, 1, 1,
0.07245693, 1.023378, 0.784407, 0, 0.9215686, 1, 1,
0.0750122, -1.418852, 3.122529, 0, 0.9176471, 1, 1,
0.0784137, 0.06510776, 0.8150514, 0, 0.9098039, 1, 1,
0.08251327, -0.8392795, 3.228108, 0, 0.9058824, 1, 1,
0.0834188, -0.06298589, 4.381371, 0, 0.8980392, 1, 1,
0.08495082, -0.04049543, 0.7071773, 0, 0.8901961, 1, 1,
0.08526418, 1.428533, -0.6727089, 0, 0.8862745, 1, 1,
0.08551715, 1.373667, -1.331981, 0, 0.8784314, 1, 1,
0.08772685, -1.231746, 4.582965, 0, 0.8745098, 1, 1,
0.09298445, 1.419921, -0.03285291, 0, 0.8666667, 1, 1,
0.09947488, 0.19874, -0.01464288, 0, 0.8627451, 1, 1,
0.1002129, 0.2233205, 1.133751, 0, 0.854902, 1, 1,
0.1039333, -1.276756, 2.378628, 0, 0.8509804, 1, 1,
0.1072499, 0.08916055, -0.5070873, 0, 0.8431373, 1, 1,
0.1132174, -0.2431486, 2.611844, 0, 0.8392157, 1, 1,
0.1148775, -0.2014631, 3.29495, 0, 0.8313726, 1, 1,
0.1205611, -0.9421118, 3.008338, 0, 0.827451, 1, 1,
0.1209136, -1.637675, 3.879344, 0, 0.8196079, 1, 1,
0.1221689, 1.825673, 0.6258039, 0, 0.8156863, 1, 1,
0.1244149, 0.1598597, 0.08984998, 0, 0.8078431, 1, 1,
0.125096, 0.06756875, 0.3119611, 0, 0.8039216, 1, 1,
0.1344376, -0.05532658, 1.88712, 0, 0.7960784, 1, 1,
0.1364858, 2.010301, 1.101273, 0, 0.7882353, 1, 1,
0.1469121, 0.1530392, 2.125314, 0, 0.7843137, 1, 1,
0.1519284, 0.2154746, 0.2093224, 0, 0.7764706, 1, 1,
0.1532298, -0.4376467, 3.290901, 0, 0.772549, 1, 1,
0.1538814, 1.058916, -0.2698429, 0, 0.7647059, 1, 1,
0.1572032, -0.03469976, 1.006805, 0, 0.7607843, 1, 1,
0.15929, -0.02721205, 2.992013, 0, 0.7529412, 1, 1,
0.1661107, -0.3628166, 2.947581, 0, 0.7490196, 1, 1,
0.1730003, 0.228051, -0.9313411, 0, 0.7411765, 1, 1,
0.1749123, 1.765226, -0.467673, 0, 0.7372549, 1, 1,
0.1749774, 0.5915721, -0.5545288, 0, 0.7294118, 1, 1,
0.1785315, -0.3889393, 1.839479, 0, 0.7254902, 1, 1,
0.1811943, -0.3423082, 3.279643, 0, 0.7176471, 1, 1,
0.1835087, 0.2652251, 1.596618, 0, 0.7137255, 1, 1,
0.1848112, -0.4530537, 2.908692, 0, 0.7058824, 1, 1,
0.1874753, -1.185094, 1.238425, 0, 0.6980392, 1, 1,
0.1878743, -0.4734822, 1.901964, 0, 0.6941177, 1, 1,
0.1903915, -1.226911, 3.458201, 0, 0.6862745, 1, 1,
0.1909067, -0.2148458, 1.62303, 0, 0.682353, 1, 1,
0.2000126, -0.6849041, 2.535631, 0, 0.6745098, 1, 1,
0.2010335, -1.432514, 3.23253, 0, 0.6705883, 1, 1,
0.2025779, 1.287765, -1.205052, 0, 0.6627451, 1, 1,
0.2053992, -0.6293692, 0.1967714, 0, 0.6588235, 1, 1,
0.2098623, -0.5941489, 2.635801, 0, 0.6509804, 1, 1,
0.2099546, -0.8279892, 2.226027, 0, 0.6470588, 1, 1,
0.2170951, 0.254474, -0.2959175, 0, 0.6392157, 1, 1,
0.2183931, -0.2625534, 2.393446, 0, 0.6352941, 1, 1,
0.2201602, -0.9300975, 3.882944, 0, 0.627451, 1, 1,
0.2201978, 0.8913645, 1.92316, 0, 0.6235294, 1, 1,
0.2213987, 1.38803, 0.7436233, 0, 0.6156863, 1, 1,
0.2234714, 0.1249548, 1.109661, 0, 0.6117647, 1, 1,
0.2237092, -0.03472652, 0.05202914, 0, 0.6039216, 1, 1,
0.2291544, 0.02365964, 2.5062, 0, 0.5960785, 1, 1,
0.2299445, -0.9134379, 2.444465, 0, 0.5921569, 1, 1,
0.2324949, 0.3059243, 0.6864471, 0, 0.5843138, 1, 1,
0.2346543, -1.500721, 4.076704, 0, 0.5803922, 1, 1,
0.2364902, -2.25174, 5.286601, 0, 0.572549, 1, 1,
0.237264, -0.4487895, 1.265334, 0, 0.5686275, 1, 1,
0.2396785, 0.4348418, 0.7067305, 0, 0.5607843, 1, 1,
0.2418846, -0.2308613, 3.623839, 0, 0.5568628, 1, 1,
0.2441212, -0.323373, 1.352531, 0, 0.5490196, 1, 1,
0.2464237, 0.6367574, 0.72469, 0, 0.5450981, 1, 1,
0.2486446, 1.142794, -0.8478884, 0, 0.5372549, 1, 1,
0.2505026, 0.5777788, 2.004205, 0, 0.5333334, 1, 1,
0.2514974, 0.402925, 0.6176101, 0, 0.5254902, 1, 1,
0.2514998, 1.779961, 0.6204447, 0, 0.5215687, 1, 1,
0.2533167, -2.782703, 4.203294, 0, 0.5137255, 1, 1,
0.2562696, 0.4823419, 0.6937367, 0, 0.509804, 1, 1,
0.2625408, 0.08199297, 0.6712085, 0, 0.5019608, 1, 1,
0.2638348, 0.3427496, 0.2107732, 0, 0.4941176, 1, 1,
0.2640446, 1.50417, 0.6997231, 0, 0.4901961, 1, 1,
0.2654928, -0.2569512, 1.649405, 0, 0.4823529, 1, 1,
0.2656591, -0.4168623, 3.493115, 0, 0.4784314, 1, 1,
0.2663418, 0.6184884, -0.7056223, 0, 0.4705882, 1, 1,
0.2664219, -2.030075, 2.128968, 0, 0.4666667, 1, 1,
0.2670616, -0.5109976, 1.583458, 0, 0.4588235, 1, 1,
0.2688451, 1.099664, 1.06327, 0, 0.454902, 1, 1,
0.2688978, -0.5577202, 1.512291, 0, 0.4470588, 1, 1,
0.2703001, -0.2123683, 3.502279, 0, 0.4431373, 1, 1,
0.2713849, 0.396126, 1.73658, 0, 0.4352941, 1, 1,
0.2722246, 1.505017, -1.412499, 0, 0.4313726, 1, 1,
0.2735718, 1.728583, 0.9902676, 0, 0.4235294, 1, 1,
0.2809191, -0.6774248, 2.140661, 0, 0.4196078, 1, 1,
0.285182, 0.1072553, 0.02052935, 0, 0.4117647, 1, 1,
0.289016, 1.372093, -0.6656037, 0, 0.4078431, 1, 1,
0.2912549, -0.6001385, 4.95337, 0, 0.4, 1, 1,
0.2915817, -1.185547, 2.818733, 0, 0.3921569, 1, 1,
0.2928414, -0.5090368, 3.968429, 0, 0.3882353, 1, 1,
0.2941988, -0.9541079, 1.46854, 0, 0.3803922, 1, 1,
0.3008913, -1.182768, 3.495716, 0, 0.3764706, 1, 1,
0.3016425, 1.217468, 1.13773, 0, 0.3686275, 1, 1,
0.302841, -0.4355294, 1.319058, 0, 0.3647059, 1, 1,
0.3042665, 0.9051556, 0.2986752, 0, 0.3568628, 1, 1,
0.3066757, 0.208459, 0.2918805, 0, 0.3529412, 1, 1,
0.3136281, -0.5016246, 2.00542, 0, 0.345098, 1, 1,
0.3138677, -1.687119, 4.539126, 0, 0.3411765, 1, 1,
0.3143336, 0.3436746, 1.75146, 0, 0.3333333, 1, 1,
0.3147494, -1.580753, 2.974964, 0, 0.3294118, 1, 1,
0.3221683, 0.7053357, 2.998451, 0, 0.3215686, 1, 1,
0.3288337, 0.1822227, 1.624904, 0, 0.3176471, 1, 1,
0.3317096, -0.6348807, 2.373349, 0, 0.3098039, 1, 1,
0.3320999, 0.7711391, -0.285892, 0, 0.3058824, 1, 1,
0.3332873, -1.09223, 3.402496, 0, 0.2980392, 1, 1,
0.3349806, -3.038411, 3.592589, 0, 0.2901961, 1, 1,
0.3356869, -1.503036, 3.165998, 0, 0.2862745, 1, 1,
0.3374566, -1.713475, 5.288918, 0, 0.2784314, 1, 1,
0.3426518, -0.2009969, 2.511373, 0, 0.2745098, 1, 1,
0.3476993, 0.3312567, 1.027334, 0, 0.2666667, 1, 1,
0.3486406, -0.5282611, 0.4305098, 0, 0.2627451, 1, 1,
0.3557792, -0.1751106, 4.033904, 0, 0.254902, 1, 1,
0.3606345, -0.26413, 3.267435, 0, 0.2509804, 1, 1,
0.3626952, 0.6749866, 1.356752, 0, 0.2431373, 1, 1,
0.3627648, 0.8557897, 2.895213, 0, 0.2392157, 1, 1,
0.3650835, 0.9464736, 2.102113, 0, 0.2313726, 1, 1,
0.3653955, -0.05929681, 1.15209, 0, 0.227451, 1, 1,
0.3675933, 0.5936366, -1.606119, 0, 0.2196078, 1, 1,
0.3698412, -0.9490709, 2.778968, 0, 0.2156863, 1, 1,
0.3713521, -1.230737, 4.081409, 0, 0.2078431, 1, 1,
0.3769733, -1.649972, 0.829811, 0, 0.2039216, 1, 1,
0.3793298, 0.314115, -0.6082297, 0, 0.1960784, 1, 1,
0.3795212, -0.9853579, 1.186464, 0, 0.1882353, 1, 1,
0.3866171, -0.310083, 2.412563, 0, 0.1843137, 1, 1,
0.3896927, -0.9314593, 3.304282, 0, 0.1764706, 1, 1,
0.3901995, -3.248361, 1.877111, 0, 0.172549, 1, 1,
0.3935816, 1.196678, 1.57159, 0, 0.1647059, 1, 1,
0.3965887, -1.704565, 1.465247, 0, 0.1607843, 1, 1,
0.3974274, 1.954679, 0.578139, 0, 0.1529412, 1, 1,
0.4101372, 1.08463, 0.5091359, 0, 0.1490196, 1, 1,
0.4130037, 1.443777, 1.516285, 0, 0.1411765, 1, 1,
0.4136386, 0.4987505, 0.3905473, 0, 0.1372549, 1, 1,
0.4183334, -0.2448481, 0.4768628, 0, 0.1294118, 1, 1,
0.4238636, 1.61904, 3.162134, 0, 0.1254902, 1, 1,
0.42576, -1.530216, 1.309538, 0, 0.1176471, 1, 1,
0.4302254, -0.9237444, 1.336166, 0, 0.1137255, 1, 1,
0.4321527, 1.906888, -0.9770421, 0, 0.1058824, 1, 1,
0.4342048, 0.6353514, 0.2622289, 0, 0.09803922, 1, 1,
0.4382147, 1.703799, 0.948539, 0, 0.09411765, 1, 1,
0.4388259, 0.5299771, 1.801899, 0, 0.08627451, 1, 1,
0.4404492, -2.20437, 2.33154, 0, 0.08235294, 1, 1,
0.4409907, 0.9940838, 0.3290479, 0, 0.07450981, 1, 1,
0.4440208, -0.03505448, 0.9102436, 0, 0.07058824, 1, 1,
0.4447925, 0.04634974, 0.52518, 0, 0.0627451, 1, 1,
0.444954, -1.343304, 2.966959, 0, 0.05882353, 1, 1,
0.4456261, 1.098101, 1.061616, 0, 0.05098039, 1, 1,
0.4463419, 0.1594397, 1.366858, 0, 0.04705882, 1, 1,
0.4476297, -1.371081, 2.575215, 0, 0.03921569, 1, 1,
0.4541736, 1.865791, -0.9811789, 0, 0.03529412, 1, 1,
0.4605111, -0.4294223, 1.961833, 0, 0.02745098, 1, 1,
0.4663244, -0.2370623, 2.014825, 0, 0.02352941, 1, 1,
0.4678596, 0.0706844, 1.972126, 0, 0.01568628, 1, 1,
0.4715084, -0.1161348, 3.705402, 0, 0.01176471, 1, 1,
0.4720032, -1.524061, 3.924117, 0, 0.003921569, 1, 1,
0.4726012, 1.090346, 1.614288, 0.003921569, 0, 1, 1,
0.4742514, 0.03277888, 0.2185656, 0.007843138, 0, 1, 1,
0.4744822, -0.3000055, 2.019888, 0.01568628, 0, 1, 1,
0.4747877, -0.7393221, 2.029149, 0.01960784, 0, 1, 1,
0.4755774, -0.3642945, 1.316344, 0.02745098, 0, 1, 1,
0.4844407, -0.9195349, 3.840586, 0.03137255, 0, 1, 1,
0.4850425, -0.4264278, 3.631943, 0.03921569, 0, 1, 1,
0.4870009, -0.1949103, 0.900763, 0.04313726, 0, 1, 1,
0.4871332, -2.707649, 4.882475, 0.05098039, 0, 1, 1,
0.4930705, 0.930506, -0.4233349, 0.05490196, 0, 1, 1,
0.4942743, 1.818787, 0.08280817, 0.0627451, 0, 1, 1,
0.502388, 0.5492494, 2.009895, 0.06666667, 0, 1, 1,
0.5046936, -0.6430392, 3.151314, 0.07450981, 0, 1, 1,
0.5050785, -0.05932029, 2.237274, 0.07843138, 0, 1, 1,
0.5065482, 0.4028569, -0.47917, 0.08627451, 0, 1, 1,
0.5071185, 0.1871303, 0.8692942, 0.09019608, 0, 1, 1,
0.5071729, -1.225314, 3.53666, 0.09803922, 0, 1, 1,
0.5080819, -1.261036, 2.412549, 0.1058824, 0, 1, 1,
0.5095537, 0.293826, 1.000577, 0.1098039, 0, 1, 1,
0.5115036, -0.4360772, 3.397938, 0.1176471, 0, 1, 1,
0.5124271, -0.3627667, 2.916744, 0.1215686, 0, 1, 1,
0.5167165, -0.5519387, 3.353531, 0.1294118, 0, 1, 1,
0.5177082, 1.007178, 1.355968, 0.1333333, 0, 1, 1,
0.5178372, 0.7999179, -1.011308, 0.1411765, 0, 1, 1,
0.5218148, 1.092575, 1.989994, 0.145098, 0, 1, 1,
0.525655, -0.4383825, 2.827205, 0.1529412, 0, 1, 1,
0.5293757, 0.9942504, 0.02851042, 0.1568628, 0, 1, 1,
0.5363839, -1.482714, 4.441916, 0.1647059, 0, 1, 1,
0.5377995, -0.07453388, 2.188918, 0.1686275, 0, 1, 1,
0.5433491, -1.386804, 2.161198, 0.1764706, 0, 1, 1,
0.5462753, 1.461036, 0.2123378, 0.1803922, 0, 1, 1,
0.5476334, 0.9214319, -1.735061, 0.1882353, 0, 1, 1,
0.5480931, 1.226947, 2.222441, 0.1921569, 0, 1, 1,
0.5490048, -0.544954, 1.349213, 0.2, 0, 1, 1,
0.5556603, -1.373197, 3.173663, 0.2078431, 0, 1, 1,
0.5569255, 0.2743868, -0.1422712, 0.2117647, 0, 1, 1,
0.5599411, 0.3696217, 0.003037223, 0.2196078, 0, 1, 1,
0.5613753, 0.3022532, 0.4409498, 0.2235294, 0, 1, 1,
0.5621341, -0.5567762, 3.333226, 0.2313726, 0, 1, 1,
0.5641621, 2.299541, 0.2350864, 0.2352941, 0, 1, 1,
0.5663422, -0.9169843, 3.173692, 0.2431373, 0, 1, 1,
0.5673651, 0.8537899, 1.451703, 0.2470588, 0, 1, 1,
0.5703186, 0.5285175, 1.222853, 0.254902, 0, 1, 1,
0.5782481, -1.147978, 4.12852, 0.2588235, 0, 1, 1,
0.5823144, 0.759367, 1.035442, 0.2666667, 0, 1, 1,
0.5834661, -1.383004, 1.800214, 0.2705882, 0, 1, 1,
0.5845436, 0.6274813, 2.021682, 0.2784314, 0, 1, 1,
0.5886618, -0.4362349, 2.47286, 0.282353, 0, 1, 1,
0.5950778, 0.5631873, 0.2644721, 0.2901961, 0, 1, 1,
0.5968678, -0.1933652, 1.538119, 0.2941177, 0, 1, 1,
0.5984553, 1.014981, 0.4264315, 0.3019608, 0, 1, 1,
0.603043, 1.053302, -0.8732523, 0.3098039, 0, 1, 1,
0.6030895, -0.8370994, 1.112518, 0.3137255, 0, 1, 1,
0.6070034, -0.7400174, 3.841868, 0.3215686, 0, 1, 1,
0.6073651, -0.2027039, 3.050809, 0.3254902, 0, 1, 1,
0.6110563, -2.37527, 1.813133, 0.3333333, 0, 1, 1,
0.6170194, -0.8803712, 2.414006, 0.3372549, 0, 1, 1,
0.6196406, -1.455336, 4.778753, 0.345098, 0, 1, 1,
0.6223211, 0.07967556, 1.474439, 0.3490196, 0, 1, 1,
0.6234044, -0.9325656, 1.363824, 0.3568628, 0, 1, 1,
0.6257567, -0.2875125, 2.329919, 0.3607843, 0, 1, 1,
0.6279006, 0.8343259, 0.7618764, 0.3686275, 0, 1, 1,
0.6297435, 0.5553725, 1.08269, 0.372549, 0, 1, 1,
0.6299816, -2.052595, 5.105803, 0.3803922, 0, 1, 1,
0.63278, 0.00864359, 2.854765, 0.3843137, 0, 1, 1,
0.6369933, 0.04539862, 3.002059, 0.3921569, 0, 1, 1,
0.6384329, -1.695799, 2.680001, 0.3960784, 0, 1, 1,
0.647597, 0.1496749, 0.4816733, 0.4039216, 0, 1, 1,
0.6506014, 0.7925236, 0.3313764, 0.4117647, 0, 1, 1,
0.6512351, 0.8402284, 0.9261755, 0.4156863, 0, 1, 1,
0.6559178, -0.658139, 3.694422, 0.4235294, 0, 1, 1,
0.6564496, -0.1026632, 2.164121, 0.427451, 0, 1, 1,
0.6631206, 0.1997588, 0.8805528, 0.4352941, 0, 1, 1,
0.6635728, 0.6713732, 0.7342542, 0.4392157, 0, 1, 1,
0.6657417, -1.052212, 0.5509911, 0.4470588, 0, 1, 1,
0.66625, -0.7683224, 3.147669, 0.4509804, 0, 1, 1,
0.6671312, 1.949051, 0.9295936, 0.4588235, 0, 1, 1,
0.6715701, 0.3741091, 1.249411, 0.4627451, 0, 1, 1,
0.6720065, 1.932541, 0.1311302, 0.4705882, 0, 1, 1,
0.6721855, 0.4814663, 0.2796426, 0.4745098, 0, 1, 1,
0.6742112, -1.750443, 4.21469, 0.4823529, 0, 1, 1,
0.6771901, 0.2893303, 2.151478, 0.4862745, 0, 1, 1,
0.68161, 1.493707, 1.412845, 0.4941176, 0, 1, 1,
0.6831505, 0.3047146, 0.4712367, 0.5019608, 0, 1, 1,
0.6858099, 0.6017616, 0.4092216, 0.5058824, 0, 1, 1,
0.6865664, -0.5159615, 1.959728, 0.5137255, 0, 1, 1,
0.6903251, -0.447626, 0.9616678, 0.5176471, 0, 1, 1,
0.6923834, 1.144654, -0.2573808, 0.5254902, 0, 1, 1,
0.6955668, -0.1595672, 1.574669, 0.5294118, 0, 1, 1,
0.6996933, -0.04634231, 3.996708, 0.5372549, 0, 1, 1,
0.7015498, 1.182261, 2.547597, 0.5411765, 0, 1, 1,
0.7066353, -1.224134, 3.529589, 0.5490196, 0, 1, 1,
0.7108061, 0.5357788, -0.5260794, 0.5529412, 0, 1, 1,
0.714355, -1.75963, 1.717289, 0.5607843, 0, 1, 1,
0.7169434, -0.15426, 3.056654, 0.5647059, 0, 1, 1,
0.7221017, -0.2647966, 1.3708, 0.572549, 0, 1, 1,
0.7352736, -1.371911, 2.94052, 0.5764706, 0, 1, 1,
0.7378517, 1.437605, -0.3750251, 0.5843138, 0, 1, 1,
0.7416487, -0.3328058, 1.878115, 0.5882353, 0, 1, 1,
0.7422388, 0.7074611, 0.4144266, 0.5960785, 0, 1, 1,
0.7426714, -1.502526, 2.923179, 0.6039216, 0, 1, 1,
0.7462987, -1.389915, 1.223682, 0.6078432, 0, 1, 1,
0.749505, -0.1687723, 0.938114, 0.6156863, 0, 1, 1,
0.7533457, 0.3303027, -0.2576599, 0.6196079, 0, 1, 1,
0.7615158, -1.320587, 1.855403, 0.627451, 0, 1, 1,
0.7680985, 1.576683, 0.8024258, 0.6313726, 0, 1, 1,
0.7684947, 1.495895, 0.5924787, 0.6392157, 0, 1, 1,
0.7685897, 2.504609, -1.921098, 0.6431373, 0, 1, 1,
0.7917596, 0.531111, 2.976948, 0.6509804, 0, 1, 1,
0.7930162, -0.1191668, 1.393952, 0.654902, 0, 1, 1,
0.7936069, -0.2473124, 1.114532, 0.6627451, 0, 1, 1,
0.7952084, -0.2689641, 3.133587, 0.6666667, 0, 1, 1,
0.796663, -0.937323, 3.783786, 0.6745098, 0, 1, 1,
0.7977003, 0.936658, 0.4038074, 0.6784314, 0, 1, 1,
0.8016463, -0.493644, 2.322834, 0.6862745, 0, 1, 1,
0.8023964, 2.271829, -0.6606067, 0.6901961, 0, 1, 1,
0.8090261, -0.6334459, 2.361002, 0.6980392, 0, 1, 1,
0.8114858, 0.2200028, 1.226778, 0.7058824, 0, 1, 1,
0.8134367, -1.82893, 3.79434, 0.7098039, 0, 1, 1,
0.8156111, -0.6215655, 2.109468, 0.7176471, 0, 1, 1,
0.823706, -1.675069, 2.316075, 0.7215686, 0, 1, 1,
0.8260914, -0.9382426, 3.291258, 0.7294118, 0, 1, 1,
0.828155, -1.10221, 1.752217, 0.7333333, 0, 1, 1,
0.8323144, -0.1281011, 1.966569, 0.7411765, 0, 1, 1,
0.8353099, 0.1051854, 2.12166, 0.7450981, 0, 1, 1,
0.8371987, 1.226107, 1.826308, 0.7529412, 0, 1, 1,
0.8375169, -0.3172887, 1.432814, 0.7568628, 0, 1, 1,
0.8383545, 0.4763666, 1.086611, 0.7647059, 0, 1, 1,
0.8430302, 0.124332, 1.359947, 0.7686275, 0, 1, 1,
0.8449316, 1.297702, -1.103362, 0.7764706, 0, 1, 1,
0.8449585, -0.09993198, 2.892108, 0.7803922, 0, 1, 1,
0.8547133, -0.4643265, 1.832862, 0.7882353, 0, 1, 1,
0.8570027, 0.6586623, 0.3186374, 0.7921569, 0, 1, 1,
0.8607719, -0.4289209, 2.248949, 0.8, 0, 1, 1,
0.8664557, -1.791807, 2.349204, 0.8078431, 0, 1, 1,
0.8712034, 0.900103, 0.5366363, 0.8117647, 0, 1, 1,
0.8723052, 0.9427354, -0.2592218, 0.8196079, 0, 1, 1,
0.8744899, -0.8311281, 3.53383, 0.8235294, 0, 1, 1,
0.8799149, -1.447228, 2.268952, 0.8313726, 0, 1, 1,
0.8808873, -0.5140758, 2.501098, 0.8352941, 0, 1, 1,
0.8810677, -0.1999241, 1.702362, 0.8431373, 0, 1, 1,
0.8842831, -0.3807734, 2.675683, 0.8470588, 0, 1, 1,
0.8857226, 1.251682, 0.2365279, 0.854902, 0, 1, 1,
0.8881873, -2.419171, 3.472293, 0.8588235, 0, 1, 1,
0.8887064, 1.336441, 0.5178708, 0.8666667, 0, 1, 1,
0.892578, -1.438083, 3.195092, 0.8705882, 0, 1, 1,
0.8965178, 0.7068235, 2.36207, 0.8784314, 0, 1, 1,
0.899335, -0.9565495, 2.534975, 0.8823529, 0, 1, 1,
0.9001439, 1.415973, 0.7360371, 0.8901961, 0, 1, 1,
0.9005415, 0.869656, 0.06990679, 0.8941177, 0, 1, 1,
0.9136395, 0.8358453, 0.4953571, 0.9019608, 0, 1, 1,
0.9162601, 0.3144317, 3.794786, 0.9098039, 0, 1, 1,
0.9273865, 0.07173579, 0.6600877, 0.9137255, 0, 1, 1,
0.9330187, -0.5918241, 2.575699, 0.9215686, 0, 1, 1,
0.9352379, 0.9661218, -0.6237001, 0.9254902, 0, 1, 1,
0.9356658, 0.1957648, 2.286934, 0.9333333, 0, 1, 1,
0.9414337, -1.177801, 2.530576, 0.9372549, 0, 1, 1,
0.9414977, 0.06104241, 1.732002, 0.945098, 0, 1, 1,
0.947042, -0.5001433, -0.999137, 0.9490196, 0, 1, 1,
0.9473026, 0.6533168, 0.6985112, 0.9568627, 0, 1, 1,
0.9523506, -0.06012092, -0.3762961, 0.9607843, 0, 1, 1,
0.9590532, -0.2174236, 2.394863, 0.9686275, 0, 1, 1,
0.9685505, 1.872395, 1.199213, 0.972549, 0, 1, 1,
0.9747625, 1.157874, 2.002418, 0.9803922, 0, 1, 1,
0.9768921, 0.02990318, 1.319691, 0.9843137, 0, 1, 1,
1.000156, 0.3161781, 2.012638, 0.9921569, 0, 1, 1,
1.007061, -0.0931371, 0.1453528, 0.9960784, 0, 1, 1,
1.008092, -1.023644, 2.055656, 1, 0, 0.9960784, 1,
1.021903, -1.987357, 1.592312, 1, 0, 0.9882353, 1,
1.023706, 0.6028897, 0.8226379, 1, 0, 0.9843137, 1,
1.02389, -0.406375, 1.551168, 1, 0, 0.9764706, 1,
1.024593, -1.335188, 2.737768, 1, 0, 0.972549, 1,
1.025899, -0.2748402, 0.3444201, 1, 0, 0.9647059, 1,
1.028203, -0.4360136, 3.480867, 1, 0, 0.9607843, 1,
1.028732, -1.139928, 3.020835, 1, 0, 0.9529412, 1,
1.029366, -0.9732022, 1.761254, 1, 0, 0.9490196, 1,
1.031282, 0.3114691, 1.771471, 1, 0, 0.9411765, 1,
1.033305, -0.8474392, 3.159575, 1, 0, 0.9372549, 1,
1.044508, 1.608271, 1.040693, 1, 0, 0.9294118, 1,
1.054365, -0.5926794, 0.7881016, 1, 0, 0.9254902, 1,
1.062773, 1.424068, 2.914053, 1, 0, 0.9176471, 1,
1.070434, 0.6184531, 1.20841, 1, 0, 0.9137255, 1,
1.070489, -0.1273707, 2.43271, 1, 0, 0.9058824, 1,
1.074865, 1.579581, 0.9840372, 1, 0, 0.9019608, 1,
1.077282, -0.4047469, 3.462995, 1, 0, 0.8941177, 1,
1.077854, 1.105202, 3.095599, 1, 0, 0.8862745, 1,
1.080939, 0.08120916, 2.578254, 1, 0, 0.8823529, 1,
1.081279, 1.065056, -0.4940758, 1, 0, 0.8745098, 1,
1.089878, 0.2195023, 2.255681, 1, 0, 0.8705882, 1,
1.090817, 0.7316745, 0.7210265, 1, 0, 0.8627451, 1,
1.105335, 2.272512, -0.8768684, 1, 0, 0.8588235, 1,
1.109609, -0.3894517, 1.100373, 1, 0, 0.8509804, 1,
1.123908, -0.7616159, 0.9543567, 1, 0, 0.8470588, 1,
1.12962, 0.4051714, 1.28898, 1, 0, 0.8392157, 1,
1.137371, 0.8146012, -1.37747, 1, 0, 0.8352941, 1,
1.143212, -1.188835, 2.158396, 1, 0, 0.827451, 1,
1.144114, 0.1687423, 1.290755, 1, 0, 0.8235294, 1,
1.146205, -1.776059, 2.498585, 1, 0, 0.8156863, 1,
1.147397, 0.7662587, -0.4863879, 1, 0, 0.8117647, 1,
1.149133, -1.044538, 0.9648721, 1, 0, 0.8039216, 1,
1.157376, 0.945213, 0.6322588, 1, 0, 0.7960784, 1,
1.161112, 0.9366924, 0.04138901, 1, 0, 0.7921569, 1,
1.16705, 1.223109, -1.249865, 1, 0, 0.7843137, 1,
1.172861, -0.4710472, 1.554056, 1, 0, 0.7803922, 1,
1.176516, -1.662143, 1.869494, 1, 0, 0.772549, 1,
1.181166, -0.006307913, 1.54546, 1, 0, 0.7686275, 1,
1.185093, 0.9976011, 1.265628, 1, 0, 0.7607843, 1,
1.188705, -0.3505092, 1.888013, 1, 0, 0.7568628, 1,
1.189753, 0.2707181, 0.7421104, 1, 0, 0.7490196, 1,
1.197817, 1.019394, 1.221672, 1, 0, 0.7450981, 1,
1.20699, 0.1705862, 1.007321, 1, 0, 0.7372549, 1,
1.208652, 0.7919323, 0.9315335, 1, 0, 0.7333333, 1,
1.213994, 0.6441907, -0.07326326, 1, 0, 0.7254902, 1,
1.216002, -2.207325, 2.057201, 1, 0, 0.7215686, 1,
1.219372, -1.725562, -0.3803314, 1, 0, 0.7137255, 1,
1.220642, -2.328878, 2.347645, 1, 0, 0.7098039, 1,
1.225705, 1.053508, 1.186772, 1, 0, 0.7019608, 1,
1.227059, 0.6142012, 1.133717, 1, 0, 0.6941177, 1,
1.234853, -0.6896011, 0.01998045, 1, 0, 0.6901961, 1,
1.245788, -0.3264638, 0.6964383, 1, 0, 0.682353, 1,
1.247088, 0.1773459, 1.173922, 1, 0, 0.6784314, 1,
1.250231, 2.019868, 0.7508749, 1, 0, 0.6705883, 1,
1.253916, 0.6256853, 0.1015061, 1, 0, 0.6666667, 1,
1.26521, -0.4210194, 0.1543664, 1, 0, 0.6588235, 1,
1.271593, -0.2052134, 2.327543, 1, 0, 0.654902, 1,
1.278119, 0.6472642, 2.057615, 1, 0, 0.6470588, 1,
1.279722, -0.4602945, 2.176045, 1, 0, 0.6431373, 1,
1.282533, -1.036075, 3.612449, 1, 0, 0.6352941, 1,
1.284943, -1.079246, 2.544919, 1, 0, 0.6313726, 1,
1.288025, -0.5719314, 1.967727, 1, 0, 0.6235294, 1,
1.293202, 1.427906, -0.2235877, 1, 0, 0.6196079, 1,
1.293398, 0.7138889, -0.5531673, 1, 0, 0.6117647, 1,
1.296473, 0.4012328, 0.5185989, 1, 0, 0.6078432, 1,
1.325738, 1.93711, 0.6792575, 1, 0, 0.6, 1,
1.330125, -0.01591072, 0.808705, 1, 0, 0.5921569, 1,
1.337494, 0.913276, 1.940298, 1, 0, 0.5882353, 1,
1.337826, -0.2317042, 1.182124, 1, 0, 0.5803922, 1,
1.339186, -1.285375, 1.615095, 1, 0, 0.5764706, 1,
1.347213, -0.184009, 0.8348588, 1, 0, 0.5686275, 1,
1.348441, -0.4824328, 2.462869, 1, 0, 0.5647059, 1,
1.357254, 0.1153379, 2.28416, 1, 0, 0.5568628, 1,
1.358951, 0.308045, 1.825146, 1, 0, 0.5529412, 1,
1.373256, 0.3791199, 0.7217125, 1, 0, 0.5450981, 1,
1.378384, -1.156054, 1.095009, 1, 0, 0.5411765, 1,
1.386447, -1.030271, 2.880312, 1, 0, 0.5333334, 1,
1.389683, -1.314439, 4.058808, 1, 0, 0.5294118, 1,
1.395984, -0.9765629, 1.73278, 1, 0, 0.5215687, 1,
1.405335, 0.1041814, 1.153754, 1, 0, 0.5176471, 1,
1.405663, -0.2978681, 1.493402, 1, 0, 0.509804, 1,
1.406907, -1.926667, 3.349159, 1, 0, 0.5058824, 1,
1.417206, 0.001158176, 0.8643456, 1, 0, 0.4980392, 1,
1.440298, 0.9708166, 0.4195658, 1, 0, 0.4901961, 1,
1.453529, 1.635515, 0.7413302, 1, 0, 0.4862745, 1,
1.464339, 0.4784091, 2.173457, 1, 0, 0.4784314, 1,
1.466792, 0.614931, 2.364401, 1, 0, 0.4745098, 1,
1.482005, -1.305186, 0.9541615, 1, 0, 0.4666667, 1,
1.482812, -1.021182, 2.134559, 1, 0, 0.4627451, 1,
1.487226, 1.70192, 0.6581609, 1, 0, 0.454902, 1,
1.498862, -0.02176683, 2.422955, 1, 0, 0.4509804, 1,
1.505468, -0.4300279, 1.689824, 1, 0, 0.4431373, 1,
1.53082, 1.27968, 1.508525, 1, 0, 0.4392157, 1,
1.536996, -1.403171, 1.705058, 1, 0, 0.4313726, 1,
1.545736, 0.3311296, 1.610666, 1, 0, 0.427451, 1,
1.549299, -1.022338, 4.23705, 1, 0, 0.4196078, 1,
1.553206, -0.7594788, 1.402175, 1, 0, 0.4156863, 1,
1.555723, 0.1257887, 1.329998, 1, 0, 0.4078431, 1,
1.564001, -0.1588316, 2.01471, 1, 0, 0.4039216, 1,
1.565288, -1.568295, 2.881669, 1, 0, 0.3960784, 1,
1.566657, 0.9168971, 1.126408, 1, 0, 0.3882353, 1,
1.578078, 0.8905302, 0.7592548, 1, 0, 0.3843137, 1,
1.580005, 0.5381886, 1.861994, 1, 0, 0.3764706, 1,
1.583598, -0.9692308, 0.8522859, 1, 0, 0.372549, 1,
1.584799, 0.614502, 0.7518096, 1, 0, 0.3647059, 1,
1.592839, -0.2500297, 2.092736, 1, 0, 0.3607843, 1,
1.593519, 1.22562, 1.270447, 1, 0, 0.3529412, 1,
1.595823, -1.822727, 4.058355, 1, 0, 0.3490196, 1,
1.597141, -0.2387443, 3.348387, 1, 0, 0.3411765, 1,
1.604449, 0.9357828, 0.8823758, 1, 0, 0.3372549, 1,
1.611217, 0.6707928, 2.369632, 1, 0, 0.3294118, 1,
1.640989, -1.848859, 3.174542, 1, 0, 0.3254902, 1,
1.644563, -0.3456361, 2.369604, 1, 0, 0.3176471, 1,
1.651697, 2.593848, 1.826088, 1, 0, 0.3137255, 1,
1.659003, 0.616695, 1.652707, 1, 0, 0.3058824, 1,
1.675035, 0.8649516, -0.552445, 1, 0, 0.2980392, 1,
1.678654, -1.149619, 4.210543, 1, 0, 0.2941177, 1,
1.691618, -1.023913, 3.183667, 1, 0, 0.2862745, 1,
1.702886, 0.1681838, 1.955079, 1, 0, 0.282353, 1,
1.704146, -0.7656823, 2.888274, 1, 0, 0.2745098, 1,
1.706949, -0.5701982, 2.431525, 1, 0, 0.2705882, 1,
1.717221, -1.438358, 2.917355, 1, 0, 0.2627451, 1,
1.72836, -0.122523, 0.1681356, 1, 0, 0.2588235, 1,
1.732325, -0.119114, 1.371471, 1, 0, 0.2509804, 1,
1.743788, -1.23627, 2.69906, 1, 0, 0.2470588, 1,
1.743912, -0.4426015, 2.360963, 1, 0, 0.2392157, 1,
1.744704, 0.8958776, 0.7595139, 1, 0, 0.2352941, 1,
1.754898, 0.5385924, -0.03209541, 1, 0, 0.227451, 1,
1.756715, 0.3409852, 2.574553, 1, 0, 0.2235294, 1,
1.769564, -0.2566554, 1.139688, 1, 0, 0.2156863, 1,
1.792887, -1.669625, 3.641032, 1, 0, 0.2117647, 1,
1.797361, -0.6494539, 1.886064, 1, 0, 0.2039216, 1,
1.802492, 1.545394, 2.284559, 1, 0, 0.1960784, 1,
1.854494, -0.2403202, 0.7557074, 1, 0, 0.1921569, 1,
1.878092, -1.139613, 2.077534, 1, 0, 0.1843137, 1,
1.879758, -0.1749747, 0.2807607, 1, 0, 0.1803922, 1,
1.936075, -0.3409454, 1.890672, 1, 0, 0.172549, 1,
1.955537, 0.5747355, 2.129557, 1, 0, 0.1686275, 1,
1.959072, -1.405999, 1.496709, 1, 0, 0.1607843, 1,
1.9603, -0.2148889, 1.888932, 1, 0, 0.1568628, 1,
1.970022, 0.8525381, -0.2717864, 1, 0, 0.1490196, 1,
1.97975, 0.5318259, 2.255777, 1, 0, 0.145098, 1,
1.988683, 0.3853818, 1.644912, 1, 0, 0.1372549, 1,
2.050447, 0.9044327, 1.834778, 1, 0, 0.1333333, 1,
2.065022, 0.8450441, 1.703743, 1, 0, 0.1254902, 1,
2.086876, 0.942956, 0.841673, 1, 0, 0.1215686, 1,
2.09103, -1.351261, 4.786888, 1, 0, 0.1137255, 1,
2.099412, -0.410843, 3.049872, 1, 0, 0.1098039, 1,
2.160117, 0.5426014, 0.6840728, 1, 0, 0.1019608, 1,
2.172946, 0.267417, 0.3723024, 1, 0, 0.09411765, 1,
2.187186, -1.100915, 1.578821, 1, 0, 0.09019608, 1,
2.190026, -2.053177, 2.705189, 1, 0, 0.08235294, 1,
2.260687, -1.138015, 1.348063, 1, 0, 0.07843138, 1,
2.291225, -0.4997165, 2.969107, 1, 0, 0.07058824, 1,
2.309151, -0.1254969, 2.89942, 1, 0, 0.06666667, 1,
2.324625, -0.5639665, 3.574908, 1, 0, 0.05882353, 1,
2.368469, 1.145967, 1.050701, 1, 0, 0.05490196, 1,
2.425033, -0.751936, 2.071126, 1, 0, 0.04705882, 1,
2.503586, 0.566499, -0.3807822, 1, 0, 0.04313726, 1,
2.57154, 0.4025241, 0.2237993, 1, 0, 0.03529412, 1,
2.59306, -0.9053583, 1.926907, 1, 0, 0.03137255, 1,
2.600356, 0.1847189, 1.503343, 1, 0, 0.02352941, 1,
3.154495, -0.8891783, 2.024189, 1, 0, 0.01960784, 1,
3.471966, 1.086804, 0.5986874, 1, 0, 0.01176471, 1,
3.502091, 0.1216304, 2.270559, 1, 0, 0.007843138, 1
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
-0.6417115, -4.252497, -7.14759, 0, -0.5, 0.5, 0.5,
-0.6417115, -4.252497, -7.14759, 1, -0.5, 0.5, 0.5,
-0.6417115, -4.252497, -7.14759, 1, 1.5, 0.5, 0.5,
-0.6417115, -4.252497, -7.14759, 0, 1.5, 0.5, 0.5
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
-6.190263, -0.2863078, -7.14759, 0, -0.5, 0.5, 0.5,
-6.190263, -0.2863078, -7.14759, 1, -0.5, 0.5, 0.5,
-6.190263, -0.2863078, -7.14759, 1, 1.5, 0.5, 0.5,
-6.190263, -0.2863078, -7.14759, 0, 1.5, 0.5, 0.5
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
-6.190263, -4.252497, -0.02810121, 0, -0.5, 0.5, 0.5,
-6.190263, -4.252497, -0.02810121, 1, -0.5, 0.5, 0.5,
-6.190263, -4.252497, -0.02810121, 1, 1.5, 0.5, 0.5,
-6.190263, -4.252497, -0.02810121, 0, 1.5, 0.5, 0.5
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
-4, -3.337223, -5.504631,
2, -3.337223, -5.504631,
-4, -3.337223, -5.504631,
-4, -3.489769, -5.778458,
-2, -3.337223, -5.504631,
-2, -3.489769, -5.778458,
0, -3.337223, -5.504631,
0, -3.489769, -5.778458,
2, -3.337223, -5.504631,
2, -3.489769, -5.778458
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
"-4",
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
-4, -3.79486, -6.32611, 0, -0.5, 0.5, 0.5,
-4, -3.79486, -6.32611, 1, -0.5, 0.5, 0.5,
-4, -3.79486, -6.32611, 1, 1.5, 0.5, 0.5,
-4, -3.79486, -6.32611, 0, 1.5, 0.5, 0.5,
-2, -3.79486, -6.32611, 0, -0.5, 0.5, 0.5,
-2, -3.79486, -6.32611, 1, -0.5, 0.5, 0.5,
-2, -3.79486, -6.32611, 1, 1.5, 0.5, 0.5,
-2, -3.79486, -6.32611, 0, 1.5, 0.5, 0.5,
0, -3.79486, -6.32611, 0, -0.5, 0.5, 0.5,
0, -3.79486, -6.32611, 1, -0.5, 0.5, 0.5,
0, -3.79486, -6.32611, 1, 1.5, 0.5, 0.5,
0, -3.79486, -6.32611, 0, 1.5, 0.5, 0.5,
2, -3.79486, -6.32611, 0, -0.5, 0.5, 0.5,
2, -3.79486, -6.32611, 1, -0.5, 0.5, 0.5,
2, -3.79486, -6.32611, 1, 1.5, 0.5, 0.5,
2, -3.79486, -6.32611, 0, 1.5, 0.5, 0.5
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
-4.909828, -3, -5.504631,
-4.909828, 2, -5.504631,
-4.909828, -3, -5.504631,
-5.123234, -3, -5.778458,
-4.909828, -2, -5.504631,
-5.123234, -2, -5.778458,
-4.909828, -1, -5.504631,
-5.123234, -1, -5.778458,
-4.909828, 0, -5.504631,
-5.123234, 0, -5.778458,
-4.909828, 1, -5.504631,
-5.123234, 1, -5.778458,
-4.909828, 2, -5.504631,
-5.123234, 2, -5.778458
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
-5.550045, -3, -6.32611, 0, -0.5, 0.5, 0.5,
-5.550045, -3, -6.32611, 1, -0.5, 0.5, 0.5,
-5.550045, -3, -6.32611, 1, 1.5, 0.5, 0.5,
-5.550045, -3, -6.32611, 0, 1.5, 0.5, 0.5,
-5.550045, -2, -6.32611, 0, -0.5, 0.5, 0.5,
-5.550045, -2, -6.32611, 1, -0.5, 0.5, 0.5,
-5.550045, -2, -6.32611, 1, 1.5, 0.5, 0.5,
-5.550045, -2, -6.32611, 0, 1.5, 0.5, 0.5,
-5.550045, -1, -6.32611, 0, -0.5, 0.5, 0.5,
-5.550045, -1, -6.32611, 1, -0.5, 0.5, 0.5,
-5.550045, -1, -6.32611, 1, 1.5, 0.5, 0.5,
-5.550045, -1, -6.32611, 0, 1.5, 0.5, 0.5,
-5.550045, 0, -6.32611, 0, -0.5, 0.5, 0.5,
-5.550045, 0, -6.32611, 1, -0.5, 0.5, 0.5,
-5.550045, 0, -6.32611, 1, 1.5, 0.5, 0.5,
-5.550045, 0, -6.32611, 0, 1.5, 0.5, 0.5,
-5.550045, 1, -6.32611, 0, -0.5, 0.5, 0.5,
-5.550045, 1, -6.32611, 1, -0.5, 0.5, 0.5,
-5.550045, 1, -6.32611, 1, 1.5, 0.5, 0.5,
-5.550045, 1, -6.32611, 0, 1.5, 0.5, 0.5,
-5.550045, 2, -6.32611, 0, -0.5, 0.5, 0.5,
-5.550045, 2, -6.32611, 1, -0.5, 0.5, 0.5,
-5.550045, 2, -6.32611, 1, 1.5, 0.5, 0.5,
-5.550045, 2, -6.32611, 0, 1.5, 0.5, 0.5
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
-4.909828, -3.337223, -4,
-4.909828, -3.337223, 4,
-4.909828, -3.337223, -4,
-5.123234, -3.489769, -4,
-4.909828, -3.337223, -2,
-5.123234, -3.489769, -2,
-4.909828, -3.337223, 0,
-5.123234, -3.489769, 0,
-4.909828, -3.337223, 2,
-5.123234, -3.489769, 2,
-4.909828, -3.337223, 4,
-5.123234, -3.489769, 4
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
-5.550045, -3.79486, -4, 0, -0.5, 0.5, 0.5,
-5.550045, -3.79486, -4, 1, -0.5, 0.5, 0.5,
-5.550045, -3.79486, -4, 1, 1.5, 0.5, 0.5,
-5.550045, -3.79486, -4, 0, 1.5, 0.5, 0.5,
-5.550045, -3.79486, -2, 0, -0.5, 0.5, 0.5,
-5.550045, -3.79486, -2, 1, -0.5, 0.5, 0.5,
-5.550045, -3.79486, -2, 1, 1.5, 0.5, 0.5,
-5.550045, -3.79486, -2, 0, 1.5, 0.5, 0.5,
-5.550045, -3.79486, 0, 0, -0.5, 0.5, 0.5,
-5.550045, -3.79486, 0, 1, -0.5, 0.5, 0.5,
-5.550045, -3.79486, 0, 1, 1.5, 0.5, 0.5,
-5.550045, -3.79486, 0, 0, 1.5, 0.5, 0.5,
-5.550045, -3.79486, 2, 0, -0.5, 0.5, 0.5,
-5.550045, -3.79486, 2, 1, -0.5, 0.5, 0.5,
-5.550045, -3.79486, 2, 1, 1.5, 0.5, 0.5,
-5.550045, -3.79486, 2, 0, 1.5, 0.5, 0.5,
-5.550045, -3.79486, 4, 0, -0.5, 0.5, 0.5,
-5.550045, -3.79486, 4, 1, -0.5, 0.5, 0.5,
-5.550045, -3.79486, 4, 1, 1.5, 0.5, 0.5,
-5.550045, -3.79486, 4, 0, 1.5, 0.5, 0.5
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
-4.909828, -3.337223, -5.504631,
-4.909828, 2.764607, -5.504631,
-4.909828, -3.337223, 5.448429,
-4.909828, 2.764607, 5.448429,
-4.909828, -3.337223, -5.504631,
-4.909828, -3.337223, 5.448429,
-4.909828, 2.764607, -5.504631,
-4.909828, 2.764607, 5.448429,
-4.909828, -3.337223, -5.504631,
3.626405, -3.337223, -5.504631,
-4.909828, -3.337223, 5.448429,
3.626405, -3.337223, 5.448429,
-4.909828, 2.764607, -5.504631,
3.626405, 2.764607, -5.504631,
-4.909828, 2.764607, 5.448429,
3.626405, 2.764607, 5.448429,
3.626405, -3.337223, -5.504631,
3.626405, 2.764607, -5.504631,
3.626405, -3.337223, 5.448429,
3.626405, 2.764607, 5.448429,
3.626405, -3.337223, -5.504631,
3.626405, -3.337223, 5.448429,
3.626405, 2.764607, -5.504631,
3.626405, 2.764607, 5.448429
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
var radius = 8.099433;
var distance = 36.03529;
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
mvMatrix.translate( 0.6417115, 0.2863078, 0.02810121 );
mvMatrix.scale( 1.025893, 1.435187, 0.7995269 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.03529);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Hexachlorobenzene<-read.table("Hexachlorobenzene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Hexachlorobenzene$V2
```

```
## Error in eval(expr, envir, enclos): object 'Hexachlorobenzene' not found
```

```r
y<-Hexachlorobenzene$V3
```

```
## Error in eval(expr, envir, enclos): object 'Hexachlorobenzene' not found
```

```r
z<-Hexachlorobenzene$V4
```

```
## Error in eval(expr, envir, enclos): object 'Hexachlorobenzene' not found
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
-4.785514, 1.144905, -0.7702746, 0, 0, 1, 1, 1,
-3.230139, -0.5032966, 0.08652015, 1, 0, 0, 1, 1,
-2.470004, -0.8573923, -2.279614, 1, 0, 0, 1, 1,
-2.381068, -0.3390342, -2.657369, 1, 0, 0, 1, 1,
-2.34986, 0.3502931, 0.6721269, 1, 0, 0, 1, 1,
-2.321831, -1.451928, -4.333896, 1, 0, 0, 1, 1,
-2.201993, -0.000369908, -1.872196, 0, 0, 0, 1, 1,
-2.192507, 1.09209, 0.07520372, 0, 0, 0, 1, 1,
-2.181019, 0.3751774, -0.1317619, 0, 0, 0, 1, 1,
-2.158805, 0.6848089, -0.7027484, 0, 0, 0, 1, 1,
-2.128179, 1.194954, -1.479226, 0, 0, 0, 1, 1,
-2.120615, -0.3001063, -1.296332, 0, 0, 0, 1, 1,
-2.115809, 0.04498797, -0.2489438, 0, 0, 0, 1, 1,
-2.109524, -0.09156068, -2.609698, 1, 1, 1, 1, 1,
-2.015422, 0.02793473, -4.066281, 1, 1, 1, 1, 1,
-2.00745, -0.594196, -1.551751, 1, 1, 1, 1, 1,
-1.987327, 0.1094534, -1.81306, 1, 1, 1, 1, 1,
-1.974976, -0.7194058, -0.4507839, 1, 1, 1, 1, 1,
-1.954319, -0.1302236, -3.686675, 1, 1, 1, 1, 1,
-1.949813, 0.2274468, -2.174894, 1, 1, 1, 1, 1,
-1.94605, -0.9474392, -2.604804, 1, 1, 1, 1, 1,
-1.915795, 1.306118, -1.655597, 1, 1, 1, 1, 1,
-1.876883, -0.8390154, -1.233338, 1, 1, 1, 1, 1,
-1.848497, 0.3225113, -1.635149, 1, 1, 1, 1, 1,
-1.83305, 0.7139764, -1.632995, 1, 1, 1, 1, 1,
-1.827545, 0.8078102, -0.02802533, 1, 1, 1, 1, 1,
-1.826964, -0.1806839, -2.897876, 1, 1, 1, 1, 1,
-1.826782, -0.08337098, -1.428722, 1, 1, 1, 1, 1,
-1.794968, 1.194284, -2.086616, 0, 0, 1, 1, 1,
-1.788205, 0.6771388, -2.710129, 1, 0, 0, 1, 1,
-1.773524, 0.2781122, -2.207307, 1, 0, 0, 1, 1,
-1.772647, 0.6610851, 0.49976, 1, 0, 0, 1, 1,
-1.767214, 1.369332, -0.4770705, 1, 0, 0, 1, 1,
-1.757629, 1.123227, -1.106359, 1, 0, 0, 1, 1,
-1.749535, 1.734764, -1.178254, 0, 0, 0, 1, 1,
-1.748081, -0.7648277, -2.493337, 0, 0, 0, 1, 1,
-1.736669, -0.8679311, -2.731907, 0, 0, 0, 1, 1,
-1.735251, -0.6063996, -2.939863, 0, 0, 0, 1, 1,
-1.719527, 0.9305138, -0.552218, 0, 0, 0, 1, 1,
-1.710754, -0.207987, -1.467644, 0, 0, 0, 1, 1,
-1.706591, -0.4748992, -1.152303, 0, 0, 0, 1, 1,
-1.704117, 0.5659091, -1.165422, 1, 1, 1, 1, 1,
-1.683163, 0.9003037, -2.18183, 1, 1, 1, 1, 1,
-1.665749, 1.682281, -0.9301675, 1, 1, 1, 1, 1,
-1.665724, -0.9781699, -1.7907, 1, 1, 1, 1, 1,
-1.662679, 1.805851, -1.653752, 1, 1, 1, 1, 1,
-1.645125, 0.757741, -1.88849, 1, 1, 1, 1, 1,
-1.633129, 0.7504132, -2.106069, 1, 1, 1, 1, 1,
-1.627009, 0.4255278, -0.06244652, 1, 1, 1, 1, 1,
-1.624032, -0.698193, -3.016682, 1, 1, 1, 1, 1,
-1.606706, -0.3977045, -2.272346, 1, 1, 1, 1, 1,
-1.585139, -0.2987954, -2.54826, 1, 1, 1, 1, 1,
-1.570078, -0.716493, -3.050706, 1, 1, 1, 1, 1,
-1.566061, -0.9975061, -2.741429, 1, 1, 1, 1, 1,
-1.562982, -1.060062, -2.406797, 1, 1, 1, 1, 1,
-1.561496, 1.419474, -2.433514, 1, 1, 1, 1, 1,
-1.552844, 0.5726355, -1.584374, 0, 0, 1, 1, 1,
-1.536578, 0.6925605, -0.5399016, 1, 0, 0, 1, 1,
-1.532013, 0.1617952, -2.479536, 1, 0, 0, 1, 1,
-1.5272, -0.1818674, -3.51126, 1, 0, 0, 1, 1,
-1.506982, 0.7713299, -1.273685, 1, 0, 0, 1, 1,
-1.492727, 0.8967794, 1.109231, 1, 0, 0, 1, 1,
-1.489802, 0.2782801, 0.5462966, 0, 0, 0, 1, 1,
-1.47409, -0.1524195, -2.932068, 0, 0, 0, 1, 1,
-1.472661, 0.7620298, 0.5680689, 0, 0, 0, 1, 1,
-1.471365, 0.4319311, -1.851772, 0, 0, 0, 1, 1,
-1.469111, 0.5529279, -0.4795648, 0, 0, 0, 1, 1,
-1.467327, -0.335341, 0.4443264, 0, 0, 0, 1, 1,
-1.456441, -1.465374, -2.456217, 0, 0, 0, 1, 1,
-1.453923, -0.2737042, -0.8199485, 1, 1, 1, 1, 1,
-1.446894, -1.23724, -0.6753315, 1, 1, 1, 1, 1,
-1.445048, -1.612688, -3.527107, 1, 1, 1, 1, 1,
-1.441141, -0.06686972, -1.220314, 1, 1, 1, 1, 1,
-1.433636, 0.8943288, -2.079746, 1, 1, 1, 1, 1,
-1.414341, 0.5650523, -0.791546, 1, 1, 1, 1, 1,
-1.404173, -0.765587, -0.496496, 1, 1, 1, 1, 1,
-1.397581, -0.4145426, -2.162617, 1, 1, 1, 1, 1,
-1.394704, -1.425443, -3.97502, 1, 1, 1, 1, 1,
-1.392044, 1.846733, -2.164291, 1, 1, 1, 1, 1,
-1.386476, -0.8037408, -1.644332, 1, 1, 1, 1, 1,
-1.379027, 0.4143683, 1.168414, 1, 1, 1, 1, 1,
-1.377999, -0.7779112, -1.490546, 1, 1, 1, 1, 1,
-1.36946, 0.3232277, -1.293244, 1, 1, 1, 1, 1,
-1.365958, -0.3698976, -2.752479, 1, 1, 1, 1, 1,
-1.362696, -0.07916824, -0.2225139, 0, 0, 1, 1, 1,
-1.361598, -1.706248, -1.839689, 1, 0, 0, 1, 1,
-1.350709, 0.1319757, -0.908641, 1, 0, 0, 1, 1,
-1.341458, 0.3800808, -3.06376, 1, 0, 0, 1, 1,
-1.341348, 0.3111201, -1.468013, 1, 0, 0, 1, 1,
-1.335458, -0.9141797, -2.562543, 1, 0, 0, 1, 1,
-1.327803, -0.5424704, -3.027805, 0, 0, 0, 1, 1,
-1.327338, -0.03042462, -1.485751, 0, 0, 0, 1, 1,
-1.316712, -1.001261, -3.466876, 0, 0, 0, 1, 1,
-1.304267, -0.3928063, -1.179908, 0, 0, 0, 1, 1,
-1.290919, 0.4904154, 0.2156511, 0, 0, 0, 1, 1,
-1.288145, -0.7636347, -1.862057, 0, 0, 0, 1, 1,
-1.2828, 0.7147924, -1.415648, 0, 0, 0, 1, 1,
-1.276016, 0.8598033, -1.471289, 1, 1, 1, 1, 1,
-1.274204, 0.9658169, -0.6444209, 1, 1, 1, 1, 1,
-1.268802, -1.397608, -2.436046, 1, 1, 1, 1, 1,
-1.261368, -2.098102, -1.587463, 1, 1, 1, 1, 1,
-1.249031, -1.341608, -1.702134, 1, 1, 1, 1, 1,
-1.246832, -0.5283816, -4.568103, 1, 1, 1, 1, 1,
-1.234583, 1.51288, -2.708226, 1, 1, 1, 1, 1,
-1.231893, 2.108733, -1.000535, 1, 1, 1, 1, 1,
-1.226965, -1.453936, -1.814778, 1, 1, 1, 1, 1,
-1.224786, 0.1667969, -1.358254, 1, 1, 1, 1, 1,
-1.211568, -0.9891707, -1.826062, 1, 1, 1, 1, 1,
-1.202906, -0.03309725, -3.332884, 1, 1, 1, 1, 1,
-1.195338, 0.7599274, 0.6061965, 1, 1, 1, 1, 1,
-1.188285, -0.3306283, 0.2741819, 1, 1, 1, 1, 1,
-1.179016, -0.04926412, -0.03319175, 1, 1, 1, 1, 1,
-1.1755, 0.8712853, 0.4170493, 0, 0, 1, 1, 1,
-1.175234, -0.7672079, -1.968919, 1, 0, 0, 1, 1,
-1.175137, 2.079627, 0.7956474, 1, 0, 0, 1, 1,
-1.160513, -0.9998147, -0.8059489, 1, 0, 0, 1, 1,
-1.158358, 0.7771388, -0.9167512, 1, 0, 0, 1, 1,
-1.15825, -0.5166255, -1.554762, 1, 0, 0, 1, 1,
-1.156742, -0.4000607, -2.560108, 0, 0, 0, 1, 1,
-1.152575, 0.8269734, -0.8074259, 0, 0, 0, 1, 1,
-1.15036, -0.4892778, -1.760548, 0, 0, 0, 1, 1,
-1.145573, -0.9503167, -3.101509, 0, 0, 0, 1, 1,
-1.145376, 2.010692, -0.7820833, 0, 0, 0, 1, 1,
-1.134595, -0.8507904, -2.895271, 0, 0, 0, 1, 1,
-1.124397, 2.269547, -1.748223, 0, 0, 0, 1, 1,
-1.123058, -1.383767, -0.753106, 1, 1, 1, 1, 1,
-1.12134, -2.200832, -2.100174, 1, 1, 1, 1, 1,
-1.103471, -0.293124, -2.551882, 1, 1, 1, 1, 1,
-1.098647, 1.378064, -0.909716, 1, 1, 1, 1, 1,
-1.097922, -1.051527, -1.165933, 1, 1, 1, 1, 1,
-1.090837, -1.234657, -3.736318, 1, 1, 1, 1, 1,
-1.072711, -1.151261, -1.517803, 1, 1, 1, 1, 1,
-1.069877, -0.05980582, -2.215999, 1, 1, 1, 1, 1,
-1.064741, -0.340534, -3.418067, 1, 1, 1, 1, 1,
-1.064218, -1.408519, -2.998148, 1, 1, 1, 1, 1,
-1.054746, 0.5907392, -1.687965, 1, 1, 1, 1, 1,
-1.053518, 0.5881465, -1.223122, 1, 1, 1, 1, 1,
-1.052231, 0.4336031, -0.207406, 1, 1, 1, 1, 1,
-1.048233, -0.4923296, -2.420084, 1, 1, 1, 1, 1,
-1.03911, 0.05608134, -1.907293, 1, 1, 1, 1, 1,
-1.031006, 0.05897776, -3.139915, 0, 0, 1, 1, 1,
-1.024387, -0.6934001, -1.37883, 1, 0, 0, 1, 1,
-1.023949, 0.7835225, -0.7418659, 1, 0, 0, 1, 1,
-1.019274, -0.1047466, -2.849113, 1, 0, 0, 1, 1,
-1.013867, -1.528067, -2.983497, 1, 0, 0, 1, 1,
-1.012638, 0.6039845, 0.2704606, 1, 0, 0, 1, 1,
-1.009965, -0.4126077, -2.229986, 0, 0, 0, 1, 1,
-1.005565, 1.248138, -1.491701, 0, 0, 0, 1, 1,
-1.005081, -0.2174505, -2.517351, 0, 0, 0, 1, 1,
-0.9942204, -0.5764859, -0.2112333, 0, 0, 0, 1, 1,
-0.9918243, -0.450395, -1.08936, 0, 0, 0, 1, 1,
-0.9869909, 1.616595, -1.617187, 0, 0, 0, 1, 1,
-0.9864262, -0.2479337, -0.8623339, 0, 0, 0, 1, 1,
-0.9833615, -0.05658069, -2.717967, 1, 1, 1, 1, 1,
-0.9777262, -0.1853592, -2.980715, 1, 1, 1, 1, 1,
-0.9735476, -1.032742, -3.096086, 1, 1, 1, 1, 1,
-0.9701824, -0.8782719, -1.39024, 1, 1, 1, 1, 1,
-0.9626989, 0.3445242, 1.290315, 1, 1, 1, 1, 1,
-0.9568878, -1.881412, -4.654525, 1, 1, 1, 1, 1,
-0.9565969, -0.5995752, -1.580235, 1, 1, 1, 1, 1,
-0.9539901, -0.6308289, -3.059154, 1, 1, 1, 1, 1,
-0.952321, 0.4208335, 0.01976182, 1, 1, 1, 1, 1,
-0.9523172, 0.9819166, -1.613901, 1, 1, 1, 1, 1,
-0.944941, 0.794572, -1.130996, 1, 1, 1, 1, 1,
-0.9347055, 0.4419912, -2.575663, 1, 1, 1, 1, 1,
-0.930464, -2.057482, -3.673025, 1, 1, 1, 1, 1,
-0.9292989, 1.330884, -0.3568129, 1, 1, 1, 1, 1,
-0.9263018, -0.882782, -2.787925, 1, 1, 1, 1, 1,
-0.9236963, 0.1520082, -1.42927, 0, 0, 1, 1, 1,
-0.9236716, 0.5264378, -1.53817, 1, 0, 0, 1, 1,
-0.9152361, -0.3610661, -4.840024, 1, 0, 0, 1, 1,
-0.9073209, 1.054287, -1.64664, 1, 0, 0, 1, 1,
-0.9027342, 1.5874, -2.556937, 1, 0, 0, 1, 1,
-0.8939951, -0.4795656, -2.425488, 1, 0, 0, 1, 1,
-0.8880733, -0.8101155, -2.471054, 0, 0, 0, 1, 1,
-0.8782761, -2.531632, -2.175429, 0, 0, 0, 1, 1,
-0.8778155, 0.1524563, -1.504457, 0, 0, 0, 1, 1,
-0.8748642, 0.608102, 0.6920065, 0, 0, 0, 1, 1,
-0.8684363, -0.7041993, -0.5948679, 0, 0, 0, 1, 1,
-0.8662719, -0.03684174, -1.392768, 0, 0, 0, 1, 1,
-0.8494136, 1.092638, -1.609279, 0, 0, 0, 1, 1,
-0.8383442, 1.482274, -1.536405, 1, 1, 1, 1, 1,
-0.8375781, -0.5882465, -3.76767, 1, 1, 1, 1, 1,
-0.8365648, 0.2217423, -1.939373, 1, 1, 1, 1, 1,
-0.8351784, 0.718226, -1.529108, 1, 1, 1, 1, 1,
-0.8304462, -1.179382, -2.184425, 1, 1, 1, 1, 1,
-0.8294626, 1.243932, -0.9264162, 1, 1, 1, 1, 1,
-0.8192987, -0.09571017, -0.4492972, 1, 1, 1, 1, 1,
-0.817027, 0.9118972, -1.02613, 1, 1, 1, 1, 1,
-0.8158175, 1.196828, -0.5589895, 1, 1, 1, 1, 1,
-0.8108821, -0.9785436, -2.768836, 1, 1, 1, 1, 1,
-0.8068592, -0.3640632, -1.606687, 1, 1, 1, 1, 1,
-0.7953883, -0.1092504, -1.465051, 1, 1, 1, 1, 1,
-0.7951705, -0.1818243, -2.706959, 1, 1, 1, 1, 1,
-0.7883053, 1.944858, -0.1520112, 1, 1, 1, 1, 1,
-0.786688, 1.606763, -1.193929, 1, 1, 1, 1, 1,
-0.7847722, -0.06447869, -2.18778, 0, 0, 1, 1, 1,
-0.7827129, -1.465273, -2.445708, 1, 0, 0, 1, 1,
-0.7822979, -0.4852089, 0.03785963, 1, 0, 0, 1, 1,
-0.7714155, -0.04259363, -1.798288, 1, 0, 0, 1, 1,
-0.7693866, 0.09707372, -2.221558, 1, 0, 0, 1, 1,
-0.7688962, 0.2014945, -1.184244, 1, 0, 0, 1, 1,
-0.7667981, 1.425361, -1.20968, 0, 0, 0, 1, 1,
-0.7638528, 1.501632, -1.33604, 0, 0, 0, 1, 1,
-0.7589483, -0.8852243, -2.272607, 0, 0, 0, 1, 1,
-0.7510383, 0.4517925, 0.549992, 0, 0, 0, 1, 1,
-0.7510284, 0.7737461, -0.4365209, 0, 0, 0, 1, 1,
-0.748442, -0.7472305, -1.659073, 0, 0, 0, 1, 1,
-0.7390733, 0.9649251, -1.442596, 0, 0, 0, 1, 1,
-0.7360418, 2.395561, 0.1238196, 1, 1, 1, 1, 1,
-0.7332621, 0.7061679, -2.188573, 1, 1, 1, 1, 1,
-0.7299212, 1.510489, 0.1000293, 1, 1, 1, 1, 1,
-0.7280203, 0.1470648, -1.482472, 1, 1, 1, 1, 1,
-0.7216132, 0.6115971, -1.652399, 1, 1, 1, 1, 1,
-0.7184222, 1.555546, -2.160849, 1, 1, 1, 1, 1,
-0.7173744, -0.4653314, -0.9449349, 1, 1, 1, 1, 1,
-0.716502, 1.032485, -0.03730293, 1, 1, 1, 1, 1,
-0.7160053, 0.173988, -1.141949, 1, 1, 1, 1, 1,
-0.7103931, -0.5522564, -2.116346, 1, 1, 1, 1, 1,
-0.7096536, 1.596615, -0.8284944, 1, 1, 1, 1, 1,
-0.7082555, 1.034523, -1.086448, 1, 1, 1, 1, 1,
-0.7042741, -0.5916873, -1.88062, 1, 1, 1, 1, 1,
-0.6928229, -0.6841966, -1.068547, 1, 1, 1, 1, 1,
-0.6928073, -0.2426012, -1.377906, 1, 1, 1, 1, 1,
-0.6860734, -0.4440766, -2.720391, 0, 0, 1, 1, 1,
-0.684295, -1.687155, -5.34512, 1, 0, 0, 1, 1,
-0.6787617, -0.7764186, -2.696722, 1, 0, 0, 1, 1,
-0.6721514, 1.019429, -2.326863, 1, 0, 0, 1, 1,
-0.6718389, 0.8096995, 0.5333638, 1, 0, 0, 1, 1,
-0.6701373, -1.369838, -2.38876, 1, 0, 0, 1, 1,
-0.6658289, 0.5259165, -1.611556, 0, 0, 0, 1, 1,
-0.6633093, 0.291565, -0.8313556, 0, 0, 0, 1, 1,
-0.6605626, 0.05210396, -1.710512, 0, 0, 0, 1, 1,
-0.6605275, -0.5232143, -1.247577, 0, 0, 0, 1, 1,
-0.654498, -0.1563756, -2.407165, 0, 0, 0, 1, 1,
-0.6539677, 0.299805, -0.4071018, 0, 0, 0, 1, 1,
-0.6534396, 1.388001, -0.856289, 0, 0, 0, 1, 1,
-0.6466824, -0.3504967, -2.318794, 1, 1, 1, 1, 1,
-0.6443441, 1.191349, -2.076666, 1, 1, 1, 1, 1,
-0.6426356, -1.205636, -2.837514, 1, 1, 1, 1, 1,
-0.6366307, 1.375896, -0.04538259, 1, 1, 1, 1, 1,
-0.6356133, 1.934426, 1.169651, 1, 1, 1, 1, 1,
-0.635167, -0.07636416, -0.7429346, 1, 1, 1, 1, 1,
-0.6336908, -0.5922842, -3.964334, 1, 1, 1, 1, 1,
-0.6282799, -0.1125096, 0.9172876, 1, 1, 1, 1, 1,
-0.6279569, 0.1712137, -1.007178, 1, 1, 1, 1, 1,
-0.6256593, -0.1853082, 0.4696586, 1, 1, 1, 1, 1,
-0.6204676, -0.9512845, -1.282472, 1, 1, 1, 1, 1,
-0.6109351, 0.7332876, -0.4286623, 1, 1, 1, 1, 1,
-0.6097938, -0.6785181, -3.760807, 1, 1, 1, 1, 1,
-0.6081154, -0.2515962, -3.015685, 1, 1, 1, 1, 1,
-0.6080423, 0.859633, -0.3689829, 1, 1, 1, 1, 1,
-0.6070782, 0.3621699, -0.4530985, 0, 0, 1, 1, 1,
-0.60412, -0.8525131, -2.110778, 1, 0, 0, 1, 1,
-0.6037416, 0.8271079, -1.836549, 1, 0, 0, 1, 1,
-0.6036429, -0.8764198, -2.901916, 1, 0, 0, 1, 1,
-0.6033927, -0.5426369, -1.49397, 1, 0, 0, 1, 1,
-0.599879, 1.673198, -0.2809803, 1, 0, 0, 1, 1,
-0.598804, -0.2714375, -1.753732, 0, 0, 0, 1, 1,
-0.5979048, -1.096981, -2.053537, 0, 0, 0, 1, 1,
-0.5969205, 0.3984409, -1.154252, 0, 0, 0, 1, 1,
-0.5962927, 0.2583889, 0.5595331, 0, 0, 0, 1, 1,
-0.5900187, -0.4367404, -2.094871, 0, 0, 0, 1, 1,
-0.5890986, -0.1490125, -0.4170096, 0, 0, 0, 1, 1,
-0.5875919, -0.5048479, -3.904632, 0, 0, 0, 1, 1,
-0.5817783, -0.3174753, -2.977686, 1, 1, 1, 1, 1,
-0.581099, 0.3538674, -0.7641146, 1, 1, 1, 1, 1,
-0.5784986, 0.8314071, 1.902167, 1, 1, 1, 1, 1,
-0.5730893, -0.3005034, -1.347576, 1, 1, 1, 1, 1,
-0.5726725, 1.605862, -1.804861, 1, 1, 1, 1, 1,
-0.5714515, -1.993338, -2.833884, 1, 1, 1, 1, 1,
-0.5710199, -1.979562, -3.457288, 1, 1, 1, 1, 1,
-0.5669319, 0.3406559, -0.7735408, 1, 1, 1, 1, 1,
-0.5589672, 0.35039, -0.07374687, 1, 1, 1, 1, 1,
-0.5549665, -0.2240557, -3.493347, 1, 1, 1, 1, 1,
-0.5537453, -0.342368, -1.963183, 1, 1, 1, 1, 1,
-0.5526298, -0.8903854, -2.131131, 1, 1, 1, 1, 1,
-0.547409, -0.3470062, -1.778304, 1, 1, 1, 1, 1,
-0.5455179, -0.200547, -1.285831, 1, 1, 1, 1, 1,
-0.5415756, -0.9326859, -3.19816, 1, 1, 1, 1, 1,
-0.5403156, 2.056102, 0.8907519, 0, 0, 1, 1, 1,
-0.5402945, -0.6935154, -0.8208492, 1, 0, 0, 1, 1,
-0.5370532, -2.459965, -2.204273, 1, 0, 0, 1, 1,
-0.5369465, 0.1119767, -1.665328, 1, 0, 0, 1, 1,
-0.5358561, -1.109756, -3.834083, 1, 0, 0, 1, 1,
-0.5304025, 1.31599, -0.9865835, 1, 0, 0, 1, 1,
-0.5240247, -0.5301014, -4.93246, 0, 0, 0, 1, 1,
-0.5238884, -1.237258, -2.889681, 0, 0, 0, 1, 1,
-0.5227758, 0.5583397, -0.7916458, 0, 0, 0, 1, 1,
-0.5206615, 1.250909, 1.04873, 0, 0, 0, 1, 1,
-0.5185524, -0.8625567, -2.513114, 0, 0, 0, 1, 1,
-0.5151969, -1.523473, -3.884036, 0, 0, 0, 1, 1,
-0.5127715, 0.07533953, -1.163556, 0, 0, 0, 1, 1,
-0.504838, 1.609085, 0.3583104, 1, 1, 1, 1, 1,
-0.5016423, -0.3546589, -2.269706, 1, 1, 1, 1, 1,
-0.4960285, -1.255496, -3.747293, 1, 1, 1, 1, 1,
-0.4949666, 0.2054139, -1.365438, 1, 1, 1, 1, 1,
-0.4934177, -0.05790892, -0.788518, 1, 1, 1, 1, 1,
-0.4859998, -0.7941939, -2.174906, 1, 1, 1, 1, 1,
-0.4854672, -1.52068, -1.734327, 1, 1, 1, 1, 1,
-0.4639962, -0.9908432, -2.912546, 1, 1, 1, 1, 1,
-0.4597633, 0.823795, -1.513468, 1, 1, 1, 1, 1,
-0.4576527, 0.9481858, -0.8343514, 1, 1, 1, 1, 1,
-0.4574713, -0.03924485, -3.121512, 1, 1, 1, 1, 1,
-0.4567241, 0.4080161, -0.6906529, 1, 1, 1, 1, 1,
-0.4528737, 0.4734139, -0.1637309, 1, 1, 1, 1, 1,
-0.4514188, -0.3816391, -1.769459, 1, 1, 1, 1, 1,
-0.4504302, -0.2242674, -1.327601, 1, 1, 1, 1, 1,
-0.4492521, 0.2465948, 0.4027353, 0, 0, 1, 1, 1,
-0.4483235, -0.6729512, -2.73277, 1, 0, 0, 1, 1,
-0.4446031, -0.1389296, -0.4664916, 1, 0, 0, 1, 1,
-0.4413304, -0.5747373, -1.663407, 1, 0, 0, 1, 1,
-0.4393416, 0.4638705, -0.9907908, 1, 0, 0, 1, 1,
-0.4357969, -1.383929, -3.685679, 1, 0, 0, 1, 1,
-0.4337868, -0.5863282, -3.325836, 0, 0, 0, 1, 1,
-0.428544, -1.815172, -4.353442, 0, 0, 0, 1, 1,
-0.4267196, -0.6719778, -2.044261, 0, 0, 0, 1, 1,
-0.4242067, 0.609791, -0.5896358, 0, 0, 0, 1, 1,
-0.4218918, 0.3397819, 1.236797, 0, 0, 0, 1, 1,
-0.4169, -0.908742, -1.860736, 0, 0, 0, 1, 1,
-0.4146754, 1.190598, -1.72918, 0, 0, 0, 1, 1,
-0.413304, -0.2700841, -2.459088, 1, 1, 1, 1, 1,
-0.4082162, 1.012462, -0.5243816, 1, 1, 1, 1, 1,
-0.4031874, 1.181921, 1.954607, 1, 1, 1, 1, 1,
-0.4007243, 0.1741775, -0.4132881, 1, 1, 1, 1, 1,
-0.4006423, -1.02295, -3.130874, 1, 1, 1, 1, 1,
-0.3986127, -0.08821724, -2.188784, 1, 1, 1, 1, 1,
-0.3985483, 2.444942, -0.924482, 1, 1, 1, 1, 1,
-0.3955591, -1.298838, -3.305103, 1, 1, 1, 1, 1,
-0.3947318, -0.1270605, -1.789326, 1, 1, 1, 1, 1,
-0.3913123, 0.2922291, -1.144894, 1, 1, 1, 1, 1,
-0.3785194, 1.145133, 1.257475, 1, 1, 1, 1, 1,
-0.3705501, -1.210572, -2.411239, 1, 1, 1, 1, 1,
-0.3690073, -1.025108, -4.336372, 1, 1, 1, 1, 1,
-0.3589485, -1.310057, -4.154788, 1, 1, 1, 1, 1,
-0.3585432, 0.5407634, -0.9552229, 1, 1, 1, 1, 1,
-0.3532134, 0.2651068, 0.1670016, 0, 0, 1, 1, 1,
-0.3514772, 0.01910716, -1.560845, 1, 0, 0, 1, 1,
-0.3507216, -0.812218, -3.2601, 1, 0, 0, 1, 1,
-0.3489677, 0.341565, -0.7793486, 1, 0, 0, 1, 1,
-0.3471666, 0.7182545, -1.847377, 1, 0, 0, 1, 1,
-0.3412455, -1.411402, -1.638921, 1, 0, 0, 1, 1,
-0.3381454, -0.2762939, -4.847017, 0, 0, 0, 1, 1,
-0.3304306, -1.611659, -5.022861, 0, 0, 0, 1, 1,
-0.3296366, 0.6159109, -1.815596, 0, 0, 0, 1, 1,
-0.3295969, 0.1230264, -0.9658962, 0, 0, 0, 1, 1,
-0.3289788, 1.468311, -0.3042003, 0, 0, 0, 1, 1,
-0.3280951, 1.579602, -0.6755599, 0, 0, 0, 1, 1,
-0.3217769, 0.6349487, 0.8027568, 0, 0, 0, 1, 1,
-0.3179473, -2.43611, -2.486601, 1, 1, 1, 1, 1,
-0.3164462, 1.761442, 0.9613889, 1, 1, 1, 1, 1,
-0.314321, 0.07348895, -0.3372806, 1, 1, 1, 1, 1,
-0.3113717, -0.2831576, -2.024455, 1, 1, 1, 1, 1,
-0.3112034, 0.6295568, -1.090226, 1, 1, 1, 1, 1,
-0.3096812, -0.8455043, -1.830142, 1, 1, 1, 1, 1,
-0.3086897, -0.5184874, -2.151145, 1, 1, 1, 1, 1,
-0.3033367, 0.9780069, -0.1544625, 1, 1, 1, 1, 1,
-0.3025458, 1.51964, 1.493631, 1, 1, 1, 1, 1,
-0.3025092, 0.4768549, -1.026661, 1, 1, 1, 1, 1,
-0.2986826, -1.474234, -2.926236, 1, 1, 1, 1, 1,
-0.298637, -0.2621645, -1.122871, 1, 1, 1, 1, 1,
-0.2966617, -0.6208354, -2.361447, 1, 1, 1, 1, 1,
-0.296404, 0.3782191, -1.178402, 1, 1, 1, 1, 1,
-0.2953168, -0.2287029, -1.455161, 1, 1, 1, 1, 1,
-0.2899709, 2.064632, -0.1265649, 0, 0, 1, 1, 1,
-0.2842405, -1.091052, -3.130601, 1, 0, 0, 1, 1,
-0.2757296, 1.164563, -0.05910616, 1, 0, 0, 1, 1,
-0.2747462, 0.8061978, -2.270033, 1, 0, 0, 1, 1,
-0.2735769, -1.056813, -3.589309, 1, 0, 0, 1, 1,
-0.2721742, -1.095238, -2.389598, 1, 0, 0, 1, 1,
-0.2719862, -0.5339373, -2.521536, 0, 0, 0, 1, 1,
-0.2717583, 0.6720033, -1.696332, 0, 0, 0, 1, 1,
-0.2717517, 0.2001292, 1.076189, 0, 0, 0, 1, 1,
-0.2697093, 0.2248412, -1.181806, 0, 0, 0, 1, 1,
-0.2689559, 0.8496852, 0.9292377, 0, 0, 0, 1, 1,
-0.2674355, 0.5083717, -2.2388, 0, 0, 0, 1, 1,
-0.2651351, 2.227727, -0.2401835, 0, 0, 0, 1, 1,
-0.2570215, 0.1662487, -0.2447195, 1, 1, 1, 1, 1,
-0.2564543, -0.2010658, -0.9917556, 1, 1, 1, 1, 1,
-0.2557732, 0.04118222, -0.8683084, 1, 1, 1, 1, 1,
-0.2546662, 0.3852127, -1.047289, 1, 1, 1, 1, 1,
-0.2433731, -0.2175171, -2.853498, 1, 1, 1, 1, 1,
-0.2431217, -0.01961672, 0.257186, 1, 1, 1, 1, 1,
-0.2390147, 1.579329, 1.696429, 1, 1, 1, 1, 1,
-0.2386965, -0.5303923, -3.052741, 1, 1, 1, 1, 1,
-0.2386927, -0.4381156, -3.296298, 1, 1, 1, 1, 1,
-0.2381437, -0.07647943, -4.112337, 1, 1, 1, 1, 1,
-0.2368478, 0.432958, -0.003681618, 1, 1, 1, 1, 1,
-0.2326828, -1.656836, -3.923003, 1, 1, 1, 1, 1,
-0.2321088, 0.300934, -0.8644527, 1, 1, 1, 1, 1,
-0.2313914, 1.539041, -1.243509, 1, 1, 1, 1, 1,
-0.2304447, -0.8750783, -2.893814, 1, 1, 1, 1, 1,
-0.2304008, -0.8767003, -3.191298, 0, 0, 1, 1, 1,
-0.2296988, -1.459834, -3.041091, 1, 0, 0, 1, 1,
-0.2295417, 1.953983, -0.5671868, 1, 0, 0, 1, 1,
-0.2292619, -0.531264, -0.9340717, 1, 0, 0, 1, 1,
-0.2255268, 1.542868, -1.161411, 1, 0, 0, 1, 1,
-0.2241655, 0.592058, -0.07821521, 1, 0, 0, 1, 1,
-0.2215111, -0.2455835, -0.9624766, 0, 0, 0, 1, 1,
-0.2211885, -1.35562, -2.470308, 0, 0, 0, 1, 1,
-0.2177775, -0.6499664, -1.792762, 0, 0, 0, 1, 1,
-0.2132146, 0.5007831, 0.6655324, 0, 0, 0, 1, 1,
-0.2091441, 1.264316, 0.009767051, 0, 0, 0, 1, 1,
-0.2046158, 0.2099048, -0.3096634, 0, 0, 0, 1, 1,
-0.2045631, -0.4442464, -3.471477, 0, 0, 0, 1, 1,
-0.195884, 1.849569, -1.161948, 1, 1, 1, 1, 1,
-0.1948449, -0.3854584, -1.428096, 1, 1, 1, 1, 1,
-0.1944144, 0.9019995, 1.733449, 1, 1, 1, 1, 1,
-0.1942083, -0.1585422, -3.608651, 1, 1, 1, 1, 1,
-0.1939039, -1.113005, -3.9696, 1, 1, 1, 1, 1,
-0.1906684, -1.783128, -3.859521, 1, 1, 1, 1, 1,
-0.1901464, 2.653436, 0.3978166, 1, 1, 1, 1, 1,
-0.1874193, -0.1052718, -2.214417, 1, 1, 1, 1, 1,
-0.1837935, -0.1000336, -1.801651, 1, 1, 1, 1, 1,
-0.1779122, -1.580927, -3.136095, 1, 1, 1, 1, 1,
-0.1772809, 2.036954, -0.6592904, 1, 1, 1, 1, 1,
-0.1747244, -0.8887658, -4.124219, 1, 1, 1, 1, 1,
-0.1713677, -0.4293352, -2.162286, 1, 1, 1, 1, 1,
-0.1691535, -0.1660264, -2.861035, 1, 1, 1, 1, 1,
-0.1644475, 0.02907746, -2.236325, 1, 1, 1, 1, 1,
-0.1625172, -0.7741297, -3.536275, 0, 0, 1, 1, 1,
-0.1625008, -0.3744811, -3.47392, 1, 0, 0, 1, 1,
-0.1579434, 0.7075623, -0.1938329, 1, 0, 0, 1, 1,
-0.1503916, 1.941459, -1.047702, 1, 0, 0, 1, 1,
-0.1469806, -1.0893, -3.131633, 1, 0, 0, 1, 1,
-0.1458882, 0.4049724, -0.681825, 1, 0, 0, 1, 1,
-0.1451506, -1.25934, -2.576861, 0, 0, 0, 1, 1,
-0.1449289, 1.669807, 1.923971, 0, 0, 0, 1, 1,
-0.1444769, -0.03975043, -1.057775, 0, 0, 0, 1, 1,
-0.1435557, -0.2870341, -1.565968, 0, 0, 0, 1, 1,
-0.1419418, -0.04511383, -2.332168, 0, 0, 0, 1, 1,
-0.1415903, 0.5336026, -1.560438, 0, 0, 0, 1, 1,
-0.133889, -0.9665178, -2.408821, 0, 0, 0, 1, 1,
-0.1334557, 0.3186823, -2.37789, 1, 1, 1, 1, 1,
-0.1310929, 2.283168, 0.6875597, 1, 1, 1, 1, 1,
-0.1295545, 0.1173894, -3.347538, 1, 1, 1, 1, 1,
-0.129395, 0.7985986, 0.1671425, 1, 1, 1, 1, 1,
-0.126733, -0.5707056, -3.078158, 1, 1, 1, 1, 1,
-0.126717, 0.01365262, 0.3814051, 1, 1, 1, 1, 1,
-0.1254059, -1.046548, -3.476491, 1, 1, 1, 1, 1,
-0.1200204, -0.5808568, -1.423559, 1, 1, 1, 1, 1,
-0.115472, -0.08823168, -4.686769, 1, 1, 1, 1, 1,
-0.1148173, -0.6411099, -1.777767, 1, 1, 1, 1, 1,
-0.114383, 0.8435579, -0.5283645, 1, 1, 1, 1, 1,
-0.1114125, 1.010268, -0.1803568, 1, 1, 1, 1, 1,
-0.110123, -0.7957002, -2.860583, 1, 1, 1, 1, 1,
-0.1096056, -0.4851795, -2.77783, 1, 1, 1, 1, 1,
-0.1055836, 2.446446, 0.213458, 1, 1, 1, 1, 1,
-0.0979808, 0.3751287, 0.9252014, 0, 0, 1, 1, 1,
-0.09279357, 1.063293, 2.137604, 1, 0, 0, 1, 1,
-0.08772232, -0.6417111, -3.339275, 1, 0, 0, 1, 1,
-0.08208121, -0.9480378, -3.757506, 1, 0, 0, 1, 1,
-0.07817371, -0.8425858, -2.347602, 1, 0, 0, 1, 1,
-0.07428246, 0.4721313, 0.4647581, 1, 0, 0, 1, 1,
-0.07363678, -0.8483692, -2.252964, 0, 0, 0, 1, 1,
-0.06878459, 0.2375438, -0.376733, 0, 0, 0, 1, 1,
-0.067373, -0.2966854, -4.726915, 0, 0, 0, 1, 1,
-0.0638833, 0.1060053, -0.9754811, 0, 0, 0, 1, 1,
-0.06133879, 0.9765173, 0.191516, 0, 0, 0, 1, 1,
-0.0588902, -0.2188917, -4.258276, 0, 0, 0, 1, 1,
-0.05858355, 0.2063899, 0.8083352, 0, 0, 0, 1, 1,
-0.05756272, -0.0994286, -2.744298, 1, 1, 1, 1, 1,
-0.05228027, -1.806169, -3.459018, 1, 1, 1, 1, 1,
-0.05049707, -0.8000644, -3.548998, 1, 1, 1, 1, 1,
-0.04962026, 1.331825, -0.372002, 1, 1, 1, 1, 1,
-0.04817867, -1.621081, -2.19918, 1, 1, 1, 1, 1,
-0.0475319, 0.258294, -0.2850631, 1, 1, 1, 1, 1,
-0.04664298, 0.3989083, 2.640718, 1, 1, 1, 1, 1,
-0.04574629, 1.268501, -0.8052663, 1, 1, 1, 1, 1,
-0.04534316, 1.625474, -0.1134425, 1, 1, 1, 1, 1,
-0.04532272, -0.7382054, -3.181644, 1, 1, 1, 1, 1,
-0.04329544, -1.688312, -3.472239, 1, 1, 1, 1, 1,
-0.04311756, 0.7784221, 0.1658624, 1, 1, 1, 1, 1,
-0.04257527, -0.2823529, -3.16391, 1, 1, 1, 1, 1,
-0.03263789, -0.8109201, -2.162214, 1, 1, 1, 1, 1,
-0.02889884, -0.3186317, -3.291791, 1, 1, 1, 1, 1,
-0.0279141, 0.4523161, -0.0275261, 0, 0, 1, 1, 1,
-0.01834574, -1.225854, -2.253398, 1, 0, 0, 1, 1,
-0.01797384, 0.9734753, -0.9087996, 1, 0, 0, 1, 1,
-0.01625312, -0.1878764, -4.544756, 1, 0, 0, 1, 1,
-0.01507951, -0.5824624, -2.683364, 1, 0, 0, 1, 1,
-0.01006168, -0.8311808, -3.842559, 1, 0, 0, 1, 1,
-0.007604551, 1.18901, -0.5559692, 0, 0, 0, 1, 1,
-0.006894141, -0.115351, -2.401794, 0, 0, 0, 1, 1,
-0.005143892, -1.835628, -4.349332, 0, 0, 0, 1, 1,
-0.004171731, 1.68165, 0.1331607, 0, 0, 0, 1, 1,
0.001531443, -0.4287257, 2.835278, 0, 0, 0, 1, 1,
0.002056327, 0.07525148, 1.264274, 0, 0, 0, 1, 1,
0.002606515, 0.01510397, -1.349299, 0, 0, 0, 1, 1,
0.003328572, -0.7575315, 2.631192, 1, 1, 1, 1, 1,
0.00478171, -0.5891909, 2.467708, 1, 1, 1, 1, 1,
0.006346802, -1.379524, 2.407335, 1, 1, 1, 1, 1,
0.01246148, 0.9571821, -0.2500722, 1, 1, 1, 1, 1,
0.01459376, 0.4811568, -1.089154, 1, 1, 1, 1, 1,
0.01595863, -0.9131964, 3.457152, 1, 1, 1, 1, 1,
0.01914606, -0.7614385, 2.775862, 1, 1, 1, 1, 1,
0.01989275, -0.1190083, 1.892266, 1, 1, 1, 1, 1,
0.02644557, -0.8811584, 3.219388, 1, 1, 1, 1, 1,
0.02721114, -1.123123, 4.111749, 1, 1, 1, 1, 1,
0.03109237, -0.2811625, 3.757025, 1, 1, 1, 1, 1,
0.03194899, 0.2667722, -0.6357008, 1, 1, 1, 1, 1,
0.04583828, 0.7625998, 1.590113, 1, 1, 1, 1, 1,
0.04924195, 0.307845, -0.4797597, 1, 1, 1, 1, 1,
0.04933425, -0.04612727, 2.259165, 1, 1, 1, 1, 1,
0.0520695, 1.583454, -0.8264313, 0, 0, 1, 1, 1,
0.05358832, 1.036746, -0.504182, 1, 0, 0, 1, 1,
0.05441366, 2.675745, 1.78029, 1, 0, 0, 1, 1,
0.05446706, 0.8663412, -1.778445, 1, 0, 0, 1, 1,
0.05446858, -0.1997012, 3.029638, 1, 0, 0, 1, 1,
0.05745846, 1.152429, 0.06677569, 1, 0, 0, 1, 1,
0.06537434, 0.8685263, 0.08054349, 0, 0, 0, 1, 1,
0.07022868, -0.3478953, 3.641575, 0, 0, 0, 1, 1,
0.071528, -0.02992827, 1.884855, 0, 0, 0, 1, 1,
0.07245693, 1.023378, 0.784407, 0, 0, 0, 1, 1,
0.0750122, -1.418852, 3.122529, 0, 0, 0, 1, 1,
0.0784137, 0.06510776, 0.8150514, 0, 0, 0, 1, 1,
0.08251327, -0.8392795, 3.228108, 0, 0, 0, 1, 1,
0.0834188, -0.06298589, 4.381371, 1, 1, 1, 1, 1,
0.08495082, -0.04049543, 0.7071773, 1, 1, 1, 1, 1,
0.08526418, 1.428533, -0.6727089, 1, 1, 1, 1, 1,
0.08551715, 1.373667, -1.331981, 1, 1, 1, 1, 1,
0.08772685, -1.231746, 4.582965, 1, 1, 1, 1, 1,
0.09298445, 1.419921, -0.03285291, 1, 1, 1, 1, 1,
0.09947488, 0.19874, -0.01464288, 1, 1, 1, 1, 1,
0.1002129, 0.2233205, 1.133751, 1, 1, 1, 1, 1,
0.1039333, -1.276756, 2.378628, 1, 1, 1, 1, 1,
0.1072499, 0.08916055, -0.5070873, 1, 1, 1, 1, 1,
0.1132174, -0.2431486, 2.611844, 1, 1, 1, 1, 1,
0.1148775, -0.2014631, 3.29495, 1, 1, 1, 1, 1,
0.1205611, -0.9421118, 3.008338, 1, 1, 1, 1, 1,
0.1209136, -1.637675, 3.879344, 1, 1, 1, 1, 1,
0.1221689, 1.825673, 0.6258039, 1, 1, 1, 1, 1,
0.1244149, 0.1598597, 0.08984998, 0, 0, 1, 1, 1,
0.125096, 0.06756875, 0.3119611, 1, 0, 0, 1, 1,
0.1344376, -0.05532658, 1.88712, 1, 0, 0, 1, 1,
0.1364858, 2.010301, 1.101273, 1, 0, 0, 1, 1,
0.1469121, 0.1530392, 2.125314, 1, 0, 0, 1, 1,
0.1519284, 0.2154746, 0.2093224, 1, 0, 0, 1, 1,
0.1532298, -0.4376467, 3.290901, 0, 0, 0, 1, 1,
0.1538814, 1.058916, -0.2698429, 0, 0, 0, 1, 1,
0.1572032, -0.03469976, 1.006805, 0, 0, 0, 1, 1,
0.15929, -0.02721205, 2.992013, 0, 0, 0, 1, 1,
0.1661107, -0.3628166, 2.947581, 0, 0, 0, 1, 1,
0.1730003, 0.228051, -0.9313411, 0, 0, 0, 1, 1,
0.1749123, 1.765226, -0.467673, 0, 0, 0, 1, 1,
0.1749774, 0.5915721, -0.5545288, 1, 1, 1, 1, 1,
0.1785315, -0.3889393, 1.839479, 1, 1, 1, 1, 1,
0.1811943, -0.3423082, 3.279643, 1, 1, 1, 1, 1,
0.1835087, 0.2652251, 1.596618, 1, 1, 1, 1, 1,
0.1848112, -0.4530537, 2.908692, 1, 1, 1, 1, 1,
0.1874753, -1.185094, 1.238425, 1, 1, 1, 1, 1,
0.1878743, -0.4734822, 1.901964, 1, 1, 1, 1, 1,
0.1903915, -1.226911, 3.458201, 1, 1, 1, 1, 1,
0.1909067, -0.2148458, 1.62303, 1, 1, 1, 1, 1,
0.2000126, -0.6849041, 2.535631, 1, 1, 1, 1, 1,
0.2010335, -1.432514, 3.23253, 1, 1, 1, 1, 1,
0.2025779, 1.287765, -1.205052, 1, 1, 1, 1, 1,
0.2053992, -0.6293692, 0.1967714, 1, 1, 1, 1, 1,
0.2098623, -0.5941489, 2.635801, 1, 1, 1, 1, 1,
0.2099546, -0.8279892, 2.226027, 1, 1, 1, 1, 1,
0.2170951, 0.254474, -0.2959175, 0, 0, 1, 1, 1,
0.2183931, -0.2625534, 2.393446, 1, 0, 0, 1, 1,
0.2201602, -0.9300975, 3.882944, 1, 0, 0, 1, 1,
0.2201978, 0.8913645, 1.92316, 1, 0, 0, 1, 1,
0.2213987, 1.38803, 0.7436233, 1, 0, 0, 1, 1,
0.2234714, 0.1249548, 1.109661, 1, 0, 0, 1, 1,
0.2237092, -0.03472652, 0.05202914, 0, 0, 0, 1, 1,
0.2291544, 0.02365964, 2.5062, 0, 0, 0, 1, 1,
0.2299445, -0.9134379, 2.444465, 0, 0, 0, 1, 1,
0.2324949, 0.3059243, 0.6864471, 0, 0, 0, 1, 1,
0.2346543, -1.500721, 4.076704, 0, 0, 0, 1, 1,
0.2364902, -2.25174, 5.286601, 0, 0, 0, 1, 1,
0.237264, -0.4487895, 1.265334, 0, 0, 0, 1, 1,
0.2396785, 0.4348418, 0.7067305, 1, 1, 1, 1, 1,
0.2418846, -0.2308613, 3.623839, 1, 1, 1, 1, 1,
0.2441212, -0.323373, 1.352531, 1, 1, 1, 1, 1,
0.2464237, 0.6367574, 0.72469, 1, 1, 1, 1, 1,
0.2486446, 1.142794, -0.8478884, 1, 1, 1, 1, 1,
0.2505026, 0.5777788, 2.004205, 1, 1, 1, 1, 1,
0.2514974, 0.402925, 0.6176101, 1, 1, 1, 1, 1,
0.2514998, 1.779961, 0.6204447, 1, 1, 1, 1, 1,
0.2533167, -2.782703, 4.203294, 1, 1, 1, 1, 1,
0.2562696, 0.4823419, 0.6937367, 1, 1, 1, 1, 1,
0.2625408, 0.08199297, 0.6712085, 1, 1, 1, 1, 1,
0.2638348, 0.3427496, 0.2107732, 1, 1, 1, 1, 1,
0.2640446, 1.50417, 0.6997231, 1, 1, 1, 1, 1,
0.2654928, -0.2569512, 1.649405, 1, 1, 1, 1, 1,
0.2656591, -0.4168623, 3.493115, 1, 1, 1, 1, 1,
0.2663418, 0.6184884, -0.7056223, 0, 0, 1, 1, 1,
0.2664219, -2.030075, 2.128968, 1, 0, 0, 1, 1,
0.2670616, -0.5109976, 1.583458, 1, 0, 0, 1, 1,
0.2688451, 1.099664, 1.06327, 1, 0, 0, 1, 1,
0.2688978, -0.5577202, 1.512291, 1, 0, 0, 1, 1,
0.2703001, -0.2123683, 3.502279, 1, 0, 0, 1, 1,
0.2713849, 0.396126, 1.73658, 0, 0, 0, 1, 1,
0.2722246, 1.505017, -1.412499, 0, 0, 0, 1, 1,
0.2735718, 1.728583, 0.9902676, 0, 0, 0, 1, 1,
0.2809191, -0.6774248, 2.140661, 0, 0, 0, 1, 1,
0.285182, 0.1072553, 0.02052935, 0, 0, 0, 1, 1,
0.289016, 1.372093, -0.6656037, 0, 0, 0, 1, 1,
0.2912549, -0.6001385, 4.95337, 0, 0, 0, 1, 1,
0.2915817, -1.185547, 2.818733, 1, 1, 1, 1, 1,
0.2928414, -0.5090368, 3.968429, 1, 1, 1, 1, 1,
0.2941988, -0.9541079, 1.46854, 1, 1, 1, 1, 1,
0.3008913, -1.182768, 3.495716, 1, 1, 1, 1, 1,
0.3016425, 1.217468, 1.13773, 1, 1, 1, 1, 1,
0.302841, -0.4355294, 1.319058, 1, 1, 1, 1, 1,
0.3042665, 0.9051556, 0.2986752, 1, 1, 1, 1, 1,
0.3066757, 0.208459, 0.2918805, 1, 1, 1, 1, 1,
0.3136281, -0.5016246, 2.00542, 1, 1, 1, 1, 1,
0.3138677, -1.687119, 4.539126, 1, 1, 1, 1, 1,
0.3143336, 0.3436746, 1.75146, 1, 1, 1, 1, 1,
0.3147494, -1.580753, 2.974964, 1, 1, 1, 1, 1,
0.3221683, 0.7053357, 2.998451, 1, 1, 1, 1, 1,
0.3288337, 0.1822227, 1.624904, 1, 1, 1, 1, 1,
0.3317096, -0.6348807, 2.373349, 1, 1, 1, 1, 1,
0.3320999, 0.7711391, -0.285892, 0, 0, 1, 1, 1,
0.3332873, -1.09223, 3.402496, 1, 0, 0, 1, 1,
0.3349806, -3.038411, 3.592589, 1, 0, 0, 1, 1,
0.3356869, -1.503036, 3.165998, 1, 0, 0, 1, 1,
0.3374566, -1.713475, 5.288918, 1, 0, 0, 1, 1,
0.3426518, -0.2009969, 2.511373, 1, 0, 0, 1, 1,
0.3476993, 0.3312567, 1.027334, 0, 0, 0, 1, 1,
0.3486406, -0.5282611, 0.4305098, 0, 0, 0, 1, 1,
0.3557792, -0.1751106, 4.033904, 0, 0, 0, 1, 1,
0.3606345, -0.26413, 3.267435, 0, 0, 0, 1, 1,
0.3626952, 0.6749866, 1.356752, 0, 0, 0, 1, 1,
0.3627648, 0.8557897, 2.895213, 0, 0, 0, 1, 1,
0.3650835, 0.9464736, 2.102113, 0, 0, 0, 1, 1,
0.3653955, -0.05929681, 1.15209, 1, 1, 1, 1, 1,
0.3675933, 0.5936366, -1.606119, 1, 1, 1, 1, 1,
0.3698412, -0.9490709, 2.778968, 1, 1, 1, 1, 1,
0.3713521, -1.230737, 4.081409, 1, 1, 1, 1, 1,
0.3769733, -1.649972, 0.829811, 1, 1, 1, 1, 1,
0.3793298, 0.314115, -0.6082297, 1, 1, 1, 1, 1,
0.3795212, -0.9853579, 1.186464, 1, 1, 1, 1, 1,
0.3866171, -0.310083, 2.412563, 1, 1, 1, 1, 1,
0.3896927, -0.9314593, 3.304282, 1, 1, 1, 1, 1,
0.3901995, -3.248361, 1.877111, 1, 1, 1, 1, 1,
0.3935816, 1.196678, 1.57159, 1, 1, 1, 1, 1,
0.3965887, -1.704565, 1.465247, 1, 1, 1, 1, 1,
0.3974274, 1.954679, 0.578139, 1, 1, 1, 1, 1,
0.4101372, 1.08463, 0.5091359, 1, 1, 1, 1, 1,
0.4130037, 1.443777, 1.516285, 1, 1, 1, 1, 1,
0.4136386, 0.4987505, 0.3905473, 0, 0, 1, 1, 1,
0.4183334, -0.2448481, 0.4768628, 1, 0, 0, 1, 1,
0.4238636, 1.61904, 3.162134, 1, 0, 0, 1, 1,
0.42576, -1.530216, 1.309538, 1, 0, 0, 1, 1,
0.4302254, -0.9237444, 1.336166, 1, 0, 0, 1, 1,
0.4321527, 1.906888, -0.9770421, 1, 0, 0, 1, 1,
0.4342048, 0.6353514, 0.2622289, 0, 0, 0, 1, 1,
0.4382147, 1.703799, 0.948539, 0, 0, 0, 1, 1,
0.4388259, 0.5299771, 1.801899, 0, 0, 0, 1, 1,
0.4404492, -2.20437, 2.33154, 0, 0, 0, 1, 1,
0.4409907, 0.9940838, 0.3290479, 0, 0, 0, 1, 1,
0.4440208, -0.03505448, 0.9102436, 0, 0, 0, 1, 1,
0.4447925, 0.04634974, 0.52518, 0, 0, 0, 1, 1,
0.444954, -1.343304, 2.966959, 1, 1, 1, 1, 1,
0.4456261, 1.098101, 1.061616, 1, 1, 1, 1, 1,
0.4463419, 0.1594397, 1.366858, 1, 1, 1, 1, 1,
0.4476297, -1.371081, 2.575215, 1, 1, 1, 1, 1,
0.4541736, 1.865791, -0.9811789, 1, 1, 1, 1, 1,
0.4605111, -0.4294223, 1.961833, 1, 1, 1, 1, 1,
0.4663244, -0.2370623, 2.014825, 1, 1, 1, 1, 1,
0.4678596, 0.0706844, 1.972126, 1, 1, 1, 1, 1,
0.4715084, -0.1161348, 3.705402, 1, 1, 1, 1, 1,
0.4720032, -1.524061, 3.924117, 1, 1, 1, 1, 1,
0.4726012, 1.090346, 1.614288, 1, 1, 1, 1, 1,
0.4742514, 0.03277888, 0.2185656, 1, 1, 1, 1, 1,
0.4744822, -0.3000055, 2.019888, 1, 1, 1, 1, 1,
0.4747877, -0.7393221, 2.029149, 1, 1, 1, 1, 1,
0.4755774, -0.3642945, 1.316344, 1, 1, 1, 1, 1,
0.4844407, -0.9195349, 3.840586, 0, 0, 1, 1, 1,
0.4850425, -0.4264278, 3.631943, 1, 0, 0, 1, 1,
0.4870009, -0.1949103, 0.900763, 1, 0, 0, 1, 1,
0.4871332, -2.707649, 4.882475, 1, 0, 0, 1, 1,
0.4930705, 0.930506, -0.4233349, 1, 0, 0, 1, 1,
0.4942743, 1.818787, 0.08280817, 1, 0, 0, 1, 1,
0.502388, 0.5492494, 2.009895, 0, 0, 0, 1, 1,
0.5046936, -0.6430392, 3.151314, 0, 0, 0, 1, 1,
0.5050785, -0.05932029, 2.237274, 0, 0, 0, 1, 1,
0.5065482, 0.4028569, -0.47917, 0, 0, 0, 1, 1,
0.5071185, 0.1871303, 0.8692942, 0, 0, 0, 1, 1,
0.5071729, -1.225314, 3.53666, 0, 0, 0, 1, 1,
0.5080819, -1.261036, 2.412549, 0, 0, 0, 1, 1,
0.5095537, 0.293826, 1.000577, 1, 1, 1, 1, 1,
0.5115036, -0.4360772, 3.397938, 1, 1, 1, 1, 1,
0.5124271, -0.3627667, 2.916744, 1, 1, 1, 1, 1,
0.5167165, -0.5519387, 3.353531, 1, 1, 1, 1, 1,
0.5177082, 1.007178, 1.355968, 1, 1, 1, 1, 1,
0.5178372, 0.7999179, -1.011308, 1, 1, 1, 1, 1,
0.5218148, 1.092575, 1.989994, 1, 1, 1, 1, 1,
0.525655, -0.4383825, 2.827205, 1, 1, 1, 1, 1,
0.5293757, 0.9942504, 0.02851042, 1, 1, 1, 1, 1,
0.5363839, -1.482714, 4.441916, 1, 1, 1, 1, 1,
0.5377995, -0.07453388, 2.188918, 1, 1, 1, 1, 1,
0.5433491, -1.386804, 2.161198, 1, 1, 1, 1, 1,
0.5462753, 1.461036, 0.2123378, 1, 1, 1, 1, 1,
0.5476334, 0.9214319, -1.735061, 1, 1, 1, 1, 1,
0.5480931, 1.226947, 2.222441, 1, 1, 1, 1, 1,
0.5490048, -0.544954, 1.349213, 0, 0, 1, 1, 1,
0.5556603, -1.373197, 3.173663, 1, 0, 0, 1, 1,
0.5569255, 0.2743868, -0.1422712, 1, 0, 0, 1, 1,
0.5599411, 0.3696217, 0.003037223, 1, 0, 0, 1, 1,
0.5613753, 0.3022532, 0.4409498, 1, 0, 0, 1, 1,
0.5621341, -0.5567762, 3.333226, 1, 0, 0, 1, 1,
0.5641621, 2.299541, 0.2350864, 0, 0, 0, 1, 1,
0.5663422, -0.9169843, 3.173692, 0, 0, 0, 1, 1,
0.5673651, 0.8537899, 1.451703, 0, 0, 0, 1, 1,
0.5703186, 0.5285175, 1.222853, 0, 0, 0, 1, 1,
0.5782481, -1.147978, 4.12852, 0, 0, 0, 1, 1,
0.5823144, 0.759367, 1.035442, 0, 0, 0, 1, 1,
0.5834661, -1.383004, 1.800214, 0, 0, 0, 1, 1,
0.5845436, 0.6274813, 2.021682, 1, 1, 1, 1, 1,
0.5886618, -0.4362349, 2.47286, 1, 1, 1, 1, 1,
0.5950778, 0.5631873, 0.2644721, 1, 1, 1, 1, 1,
0.5968678, -0.1933652, 1.538119, 1, 1, 1, 1, 1,
0.5984553, 1.014981, 0.4264315, 1, 1, 1, 1, 1,
0.603043, 1.053302, -0.8732523, 1, 1, 1, 1, 1,
0.6030895, -0.8370994, 1.112518, 1, 1, 1, 1, 1,
0.6070034, -0.7400174, 3.841868, 1, 1, 1, 1, 1,
0.6073651, -0.2027039, 3.050809, 1, 1, 1, 1, 1,
0.6110563, -2.37527, 1.813133, 1, 1, 1, 1, 1,
0.6170194, -0.8803712, 2.414006, 1, 1, 1, 1, 1,
0.6196406, -1.455336, 4.778753, 1, 1, 1, 1, 1,
0.6223211, 0.07967556, 1.474439, 1, 1, 1, 1, 1,
0.6234044, -0.9325656, 1.363824, 1, 1, 1, 1, 1,
0.6257567, -0.2875125, 2.329919, 1, 1, 1, 1, 1,
0.6279006, 0.8343259, 0.7618764, 0, 0, 1, 1, 1,
0.6297435, 0.5553725, 1.08269, 1, 0, 0, 1, 1,
0.6299816, -2.052595, 5.105803, 1, 0, 0, 1, 1,
0.63278, 0.00864359, 2.854765, 1, 0, 0, 1, 1,
0.6369933, 0.04539862, 3.002059, 1, 0, 0, 1, 1,
0.6384329, -1.695799, 2.680001, 1, 0, 0, 1, 1,
0.647597, 0.1496749, 0.4816733, 0, 0, 0, 1, 1,
0.6506014, 0.7925236, 0.3313764, 0, 0, 0, 1, 1,
0.6512351, 0.8402284, 0.9261755, 0, 0, 0, 1, 1,
0.6559178, -0.658139, 3.694422, 0, 0, 0, 1, 1,
0.6564496, -0.1026632, 2.164121, 0, 0, 0, 1, 1,
0.6631206, 0.1997588, 0.8805528, 0, 0, 0, 1, 1,
0.6635728, 0.6713732, 0.7342542, 0, 0, 0, 1, 1,
0.6657417, -1.052212, 0.5509911, 1, 1, 1, 1, 1,
0.66625, -0.7683224, 3.147669, 1, 1, 1, 1, 1,
0.6671312, 1.949051, 0.9295936, 1, 1, 1, 1, 1,
0.6715701, 0.3741091, 1.249411, 1, 1, 1, 1, 1,
0.6720065, 1.932541, 0.1311302, 1, 1, 1, 1, 1,
0.6721855, 0.4814663, 0.2796426, 1, 1, 1, 1, 1,
0.6742112, -1.750443, 4.21469, 1, 1, 1, 1, 1,
0.6771901, 0.2893303, 2.151478, 1, 1, 1, 1, 1,
0.68161, 1.493707, 1.412845, 1, 1, 1, 1, 1,
0.6831505, 0.3047146, 0.4712367, 1, 1, 1, 1, 1,
0.6858099, 0.6017616, 0.4092216, 1, 1, 1, 1, 1,
0.6865664, -0.5159615, 1.959728, 1, 1, 1, 1, 1,
0.6903251, -0.447626, 0.9616678, 1, 1, 1, 1, 1,
0.6923834, 1.144654, -0.2573808, 1, 1, 1, 1, 1,
0.6955668, -0.1595672, 1.574669, 1, 1, 1, 1, 1,
0.6996933, -0.04634231, 3.996708, 0, 0, 1, 1, 1,
0.7015498, 1.182261, 2.547597, 1, 0, 0, 1, 1,
0.7066353, -1.224134, 3.529589, 1, 0, 0, 1, 1,
0.7108061, 0.5357788, -0.5260794, 1, 0, 0, 1, 1,
0.714355, -1.75963, 1.717289, 1, 0, 0, 1, 1,
0.7169434, -0.15426, 3.056654, 1, 0, 0, 1, 1,
0.7221017, -0.2647966, 1.3708, 0, 0, 0, 1, 1,
0.7352736, -1.371911, 2.94052, 0, 0, 0, 1, 1,
0.7378517, 1.437605, -0.3750251, 0, 0, 0, 1, 1,
0.7416487, -0.3328058, 1.878115, 0, 0, 0, 1, 1,
0.7422388, 0.7074611, 0.4144266, 0, 0, 0, 1, 1,
0.7426714, -1.502526, 2.923179, 0, 0, 0, 1, 1,
0.7462987, -1.389915, 1.223682, 0, 0, 0, 1, 1,
0.749505, -0.1687723, 0.938114, 1, 1, 1, 1, 1,
0.7533457, 0.3303027, -0.2576599, 1, 1, 1, 1, 1,
0.7615158, -1.320587, 1.855403, 1, 1, 1, 1, 1,
0.7680985, 1.576683, 0.8024258, 1, 1, 1, 1, 1,
0.7684947, 1.495895, 0.5924787, 1, 1, 1, 1, 1,
0.7685897, 2.504609, -1.921098, 1, 1, 1, 1, 1,
0.7917596, 0.531111, 2.976948, 1, 1, 1, 1, 1,
0.7930162, -0.1191668, 1.393952, 1, 1, 1, 1, 1,
0.7936069, -0.2473124, 1.114532, 1, 1, 1, 1, 1,
0.7952084, -0.2689641, 3.133587, 1, 1, 1, 1, 1,
0.796663, -0.937323, 3.783786, 1, 1, 1, 1, 1,
0.7977003, 0.936658, 0.4038074, 1, 1, 1, 1, 1,
0.8016463, -0.493644, 2.322834, 1, 1, 1, 1, 1,
0.8023964, 2.271829, -0.6606067, 1, 1, 1, 1, 1,
0.8090261, -0.6334459, 2.361002, 1, 1, 1, 1, 1,
0.8114858, 0.2200028, 1.226778, 0, 0, 1, 1, 1,
0.8134367, -1.82893, 3.79434, 1, 0, 0, 1, 1,
0.8156111, -0.6215655, 2.109468, 1, 0, 0, 1, 1,
0.823706, -1.675069, 2.316075, 1, 0, 0, 1, 1,
0.8260914, -0.9382426, 3.291258, 1, 0, 0, 1, 1,
0.828155, -1.10221, 1.752217, 1, 0, 0, 1, 1,
0.8323144, -0.1281011, 1.966569, 0, 0, 0, 1, 1,
0.8353099, 0.1051854, 2.12166, 0, 0, 0, 1, 1,
0.8371987, 1.226107, 1.826308, 0, 0, 0, 1, 1,
0.8375169, -0.3172887, 1.432814, 0, 0, 0, 1, 1,
0.8383545, 0.4763666, 1.086611, 0, 0, 0, 1, 1,
0.8430302, 0.124332, 1.359947, 0, 0, 0, 1, 1,
0.8449316, 1.297702, -1.103362, 0, 0, 0, 1, 1,
0.8449585, -0.09993198, 2.892108, 1, 1, 1, 1, 1,
0.8547133, -0.4643265, 1.832862, 1, 1, 1, 1, 1,
0.8570027, 0.6586623, 0.3186374, 1, 1, 1, 1, 1,
0.8607719, -0.4289209, 2.248949, 1, 1, 1, 1, 1,
0.8664557, -1.791807, 2.349204, 1, 1, 1, 1, 1,
0.8712034, 0.900103, 0.5366363, 1, 1, 1, 1, 1,
0.8723052, 0.9427354, -0.2592218, 1, 1, 1, 1, 1,
0.8744899, -0.8311281, 3.53383, 1, 1, 1, 1, 1,
0.8799149, -1.447228, 2.268952, 1, 1, 1, 1, 1,
0.8808873, -0.5140758, 2.501098, 1, 1, 1, 1, 1,
0.8810677, -0.1999241, 1.702362, 1, 1, 1, 1, 1,
0.8842831, -0.3807734, 2.675683, 1, 1, 1, 1, 1,
0.8857226, 1.251682, 0.2365279, 1, 1, 1, 1, 1,
0.8881873, -2.419171, 3.472293, 1, 1, 1, 1, 1,
0.8887064, 1.336441, 0.5178708, 1, 1, 1, 1, 1,
0.892578, -1.438083, 3.195092, 0, 0, 1, 1, 1,
0.8965178, 0.7068235, 2.36207, 1, 0, 0, 1, 1,
0.899335, -0.9565495, 2.534975, 1, 0, 0, 1, 1,
0.9001439, 1.415973, 0.7360371, 1, 0, 0, 1, 1,
0.9005415, 0.869656, 0.06990679, 1, 0, 0, 1, 1,
0.9136395, 0.8358453, 0.4953571, 1, 0, 0, 1, 1,
0.9162601, 0.3144317, 3.794786, 0, 0, 0, 1, 1,
0.9273865, 0.07173579, 0.6600877, 0, 0, 0, 1, 1,
0.9330187, -0.5918241, 2.575699, 0, 0, 0, 1, 1,
0.9352379, 0.9661218, -0.6237001, 0, 0, 0, 1, 1,
0.9356658, 0.1957648, 2.286934, 0, 0, 0, 1, 1,
0.9414337, -1.177801, 2.530576, 0, 0, 0, 1, 1,
0.9414977, 0.06104241, 1.732002, 0, 0, 0, 1, 1,
0.947042, -0.5001433, -0.999137, 1, 1, 1, 1, 1,
0.9473026, 0.6533168, 0.6985112, 1, 1, 1, 1, 1,
0.9523506, -0.06012092, -0.3762961, 1, 1, 1, 1, 1,
0.9590532, -0.2174236, 2.394863, 1, 1, 1, 1, 1,
0.9685505, 1.872395, 1.199213, 1, 1, 1, 1, 1,
0.9747625, 1.157874, 2.002418, 1, 1, 1, 1, 1,
0.9768921, 0.02990318, 1.319691, 1, 1, 1, 1, 1,
1.000156, 0.3161781, 2.012638, 1, 1, 1, 1, 1,
1.007061, -0.0931371, 0.1453528, 1, 1, 1, 1, 1,
1.008092, -1.023644, 2.055656, 1, 1, 1, 1, 1,
1.021903, -1.987357, 1.592312, 1, 1, 1, 1, 1,
1.023706, 0.6028897, 0.8226379, 1, 1, 1, 1, 1,
1.02389, -0.406375, 1.551168, 1, 1, 1, 1, 1,
1.024593, -1.335188, 2.737768, 1, 1, 1, 1, 1,
1.025899, -0.2748402, 0.3444201, 1, 1, 1, 1, 1,
1.028203, -0.4360136, 3.480867, 0, 0, 1, 1, 1,
1.028732, -1.139928, 3.020835, 1, 0, 0, 1, 1,
1.029366, -0.9732022, 1.761254, 1, 0, 0, 1, 1,
1.031282, 0.3114691, 1.771471, 1, 0, 0, 1, 1,
1.033305, -0.8474392, 3.159575, 1, 0, 0, 1, 1,
1.044508, 1.608271, 1.040693, 1, 0, 0, 1, 1,
1.054365, -0.5926794, 0.7881016, 0, 0, 0, 1, 1,
1.062773, 1.424068, 2.914053, 0, 0, 0, 1, 1,
1.070434, 0.6184531, 1.20841, 0, 0, 0, 1, 1,
1.070489, -0.1273707, 2.43271, 0, 0, 0, 1, 1,
1.074865, 1.579581, 0.9840372, 0, 0, 0, 1, 1,
1.077282, -0.4047469, 3.462995, 0, 0, 0, 1, 1,
1.077854, 1.105202, 3.095599, 0, 0, 0, 1, 1,
1.080939, 0.08120916, 2.578254, 1, 1, 1, 1, 1,
1.081279, 1.065056, -0.4940758, 1, 1, 1, 1, 1,
1.089878, 0.2195023, 2.255681, 1, 1, 1, 1, 1,
1.090817, 0.7316745, 0.7210265, 1, 1, 1, 1, 1,
1.105335, 2.272512, -0.8768684, 1, 1, 1, 1, 1,
1.109609, -0.3894517, 1.100373, 1, 1, 1, 1, 1,
1.123908, -0.7616159, 0.9543567, 1, 1, 1, 1, 1,
1.12962, 0.4051714, 1.28898, 1, 1, 1, 1, 1,
1.137371, 0.8146012, -1.37747, 1, 1, 1, 1, 1,
1.143212, -1.188835, 2.158396, 1, 1, 1, 1, 1,
1.144114, 0.1687423, 1.290755, 1, 1, 1, 1, 1,
1.146205, -1.776059, 2.498585, 1, 1, 1, 1, 1,
1.147397, 0.7662587, -0.4863879, 1, 1, 1, 1, 1,
1.149133, -1.044538, 0.9648721, 1, 1, 1, 1, 1,
1.157376, 0.945213, 0.6322588, 1, 1, 1, 1, 1,
1.161112, 0.9366924, 0.04138901, 0, 0, 1, 1, 1,
1.16705, 1.223109, -1.249865, 1, 0, 0, 1, 1,
1.172861, -0.4710472, 1.554056, 1, 0, 0, 1, 1,
1.176516, -1.662143, 1.869494, 1, 0, 0, 1, 1,
1.181166, -0.006307913, 1.54546, 1, 0, 0, 1, 1,
1.185093, 0.9976011, 1.265628, 1, 0, 0, 1, 1,
1.188705, -0.3505092, 1.888013, 0, 0, 0, 1, 1,
1.189753, 0.2707181, 0.7421104, 0, 0, 0, 1, 1,
1.197817, 1.019394, 1.221672, 0, 0, 0, 1, 1,
1.20699, 0.1705862, 1.007321, 0, 0, 0, 1, 1,
1.208652, 0.7919323, 0.9315335, 0, 0, 0, 1, 1,
1.213994, 0.6441907, -0.07326326, 0, 0, 0, 1, 1,
1.216002, -2.207325, 2.057201, 0, 0, 0, 1, 1,
1.219372, -1.725562, -0.3803314, 1, 1, 1, 1, 1,
1.220642, -2.328878, 2.347645, 1, 1, 1, 1, 1,
1.225705, 1.053508, 1.186772, 1, 1, 1, 1, 1,
1.227059, 0.6142012, 1.133717, 1, 1, 1, 1, 1,
1.234853, -0.6896011, 0.01998045, 1, 1, 1, 1, 1,
1.245788, -0.3264638, 0.6964383, 1, 1, 1, 1, 1,
1.247088, 0.1773459, 1.173922, 1, 1, 1, 1, 1,
1.250231, 2.019868, 0.7508749, 1, 1, 1, 1, 1,
1.253916, 0.6256853, 0.1015061, 1, 1, 1, 1, 1,
1.26521, -0.4210194, 0.1543664, 1, 1, 1, 1, 1,
1.271593, -0.2052134, 2.327543, 1, 1, 1, 1, 1,
1.278119, 0.6472642, 2.057615, 1, 1, 1, 1, 1,
1.279722, -0.4602945, 2.176045, 1, 1, 1, 1, 1,
1.282533, -1.036075, 3.612449, 1, 1, 1, 1, 1,
1.284943, -1.079246, 2.544919, 1, 1, 1, 1, 1,
1.288025, -0.5719314, 1.967727, 0, 0, 1, 1, 1,
1.293202, 1.427906, -0.2235877, 1, 0, 0, 1, 1,
1.293398, 0.7138889, -0.5531673, 1, 0, 0, 1, 1,
1.296473, 0.4012328, 0.5185989, 1, 0, 0, 1, 1,
1.325738, 1.93711, 0.6792575, 1, 0, 0, 1, 1,
1.330125, -0.01591072, 0.808705, 1, 0, 0, 1, 1,
1.337494, 0.913276, 1.940298, 0, 0, 0, 1, 1,
1.337826, -0.2317042, 1.182124, 0, 0, 0, 1, 1,
1.339186, -1.285375, 1.615095, 0, 0, 0, 1, 1,
1.347213, -0.184009, 0.8348588, 0, 0, 0, 1, 1,
1.348441, -0.4824328, 2.462869, 0, 0, 0, 1, 1,
1.357254, 0.1153379, 2.28416, 0, 0, 0, 1, 1,
1.358951, 0.308045, 1.825146, 0, 0, 0, 1, 1,
1.373256, 0.3791199, 0.7217125, 1, 1, 1, 1, 1,
1.378384, -1.156054, 1.095009, 1, 1, 1, 1, 1,
1.386447, -1.030271, 2.880312, 1, 1, 1, 1, 1,
1.389683, -1.314439, 4.058808, 1, 1, 1, 1, 1,
1.395984, -0.9765629, 1.73278, 1, 1, 1, 1, 1,
1.405335, 0.1041814, 1.153754, 1, 1, 1, 1, 1,
1.405663, -0.2978681, 1.493402, 1, 1, 1, 1, 1,
1.406907, -1.926667, 3.349159, 1, 1, 1, 1, 1,
1.417206, 0.001158176, 0.8643456, 1, 1, 1, 1, 1,
1.440298, 0.9708166, 0.4195658, 1, 1, 1, 1, 1,
1.453529, 1.635515, 0.7413302, 1, 1, 1, 1, 1,
1.464339, 0.4784091, 2.173457, 1, 1, 1, 1, 1,
1.466792, 0.614931, 2.364401, 1, 1, 1, 1, 1,
1.482005, -1.305186, 0.9541615, 1, 1, 1, 1, 1,
1.482812, -1.021182, 2.134559, 1, 1, 1, 1, 1,
1.487226, 1.70192, 0.6581609, 0, 0, 1, 1, 1,
1.498862, -0.02176683, 2.422955, 1, 0, 0, 1, 1,
1.505468, -0.4300279, 1.689824, 1, 0, 0, 1, 1,
1.53082, 1.27968, 1.508525, 1, 0, 0, 1, 1,
1.536996, -1.403171, 1.705058, 1, 0, 0, 1, 1,
1.545736, 0.3311296, 1.610666, 1, 0, 0, 1, 1,
1.549299, -1.022338, 4.23705, 0, 0, 0, 1, 1,
1.553206, -0.7594788, 1.402175, 0, 0, 0, 1, 1,
1.555723, 0.1257887, 1.329998, 0, 0, 0, 1, 1,
1.564001, -0.1588316, 2.01471, 0, 0, 0, 1, 1,
1.565288, -1.568295, 2.881669, 0, 0, 0, 1, 1,
1.566657, 0.9168971, 1.126408, 0, 0, 0, 1, 1,
1.578078, 0.8905302, 0.7592548, 0, 0, 0, 1, 1,
1.580005, 0.5381886, 1.861994, 1, 1, 1, 1, 1,
1.583598, -0.9692308, 0.8522859, 1, 1, 1, 1, 1,
1.584799, 0.614502, 0.7518096, 1, 1, 1, 1, 1,
1.592839, -0.2500297, 2.092736, 1, 1, 1, 1, 1,
1.593519, 1.22562, 1.270447, 1, 1, 1, 1, 1,
1.595823, -1.822727, 4.058355, 1, 1, 1, 1, 1,
1.597141, -0.2387443, 3.348387, 1, 1, 1, 1, 1,
1.604449, 0.9357828, 0.8823758, 1, 1, 1, 1, 1,
1.611217, 0.6707928, 2.369632, 1, 1, 1, 1, 1,
1.640989, -1.848859, 3.174542, 1, 1, 1, 1, 1,
1.644563, -0.3456361, 2.369604, 1, 1, 1, 1, 1,
1.651697, 2.593848, 1.826088, 1, 1, 1, 1, 1,
1.659003, 0.616695, 1.652707, 1, 1, 1, 1, 1,
1.675035, 0.8649516, -0.552445, 1, 1, 1, 1, 1,
1.678654, -1.149619, 4.210543, 1, 1, 1, 1, 1,
1.691618, -1.023913, 3.183667, 0, 0, 1, 1, 1,
1.702886, 0.1681838, 1.955079, 1, 0, 0, 1, 1,
1.704146, -0.7656823, 2.888274, 1, 0, 0, 1, 1,
1.706949, -0.5701982, 2.431525, 1, 0, 0, 1, 1,
1.717221, -1.438358, 2.917355, 1, 0, 0, 1, 1,
1.72836, -0.122523, 0.1681356, 1, 0, 0, 1, 1,
1.732325, -0.119114, 1.371471, 0, 0, 0, 1, 1,
1.743788, -1.23627, 2.69906, 0, 0, 0, 1, 1,
1.743912, -0.4426015, 2.360963, 0, 0, 0, 1, 1,
1.744704, 0.8958776, 0.7595139, 0, 0, 0, 1, 1,
1.754898, 0.5385924, -0.03209541, 0, 0, 0, 1, 1,
1.756715, 0.3409852, 2.574553, 0, 0, 0, 1, 1,
1.769564, -0.2566554, 1.139688, 0, 0, 0, 1, 1,
1.792887, -1.669625, 3.641032, 1, 1, 1, 1, 1,
1.797361, -0.6494539, 1.886064, 1, 1, 1, 1, 1,
1.802492, 1.545394, 2.284559, 1, 1, 1, 1, 1,
1.854494, -0.2403202, 0.7557074, 1, 1, 1, 1, 1,
1.878092, -1.139613, 2.077534, 1, 1, 1, 1, 1,
1.879758, -0.1749747, 0.2807607, 1, 1, 1, 1, 1,
1.936075, -0.3409454, 1.890672, 1, 1, 1, 1, 1,
1.955537, 0.5747355, 2.129557, 1, 1, 1, 1, 1,
1.959072, -1.405999, 1.496709, 1, 1, 1, 1, 1,
1.9603, -0.2148889, 1.888932, 1, 1, 1, 1, 1,
1.970022, 0.8525381, -0.2717864, 1, 1, 1, 1, 1,
1.97975, 0.5318259, 2.255777, 1, 1, 1, 1, 1,
1.988683, 0.3853818, 1.644912, 1, 1, 1, 1, 1,
2.050447, 0.9044327, 1.834778, 1, 1, 1, 1, 1,
2.065022, 0.8450441, 1.703743, 1, 1, 1, 1, 1,
2.086876, 0.942956, 0.841673, 0, 0, 1, 1, 1,
2.09103, -1.351261, 4.786888, 1, 0, 0, 1, 1,
2.099412, -0.410843, 3.049872, 1, 0, 0, 1, 1,
2.160117, 0.5426014, 0.6840728, 1, 0, 0, 1, 1,
2.172946, 0.267417, 0.3723024, 1, 0, 0, 1, 1,
2.187186, -1.100915, 1.578821, 1, 0, 0, 1, 1,
2.190026, -2.053177, 2.705189, 0, 0, 0, 1, 1,
2.260687, -1.138015, 1.348063, 0, 0, 0, 1, 1,
2.291225, -0.4997165, 2.969107, 0, 0, 0, 1, 1,
2.309151, -0.1254969, 2.89942, 0, 0, 0, 1, 1,
2.324625, -0.5639665, 3.574908, 0, 0, 0, 1, 1,
2.368469, 1.145967, 1.050701, 0, 0, 0, 1, 1,
2.425033, -0.751936, 2.071126, 0, 0, 0, 1, 1,
2.503586, 0.566499, -0.3807822, 1, 1, 1, 1, 1,
2.57154, 0.4025241, 0.2237993, 1, 1, 1, 1, 1,
2.59306, -0.9053583, 1.926907, 1, 1, 1, 1, 1,
2.600356, 0.1847189, 1.503343, 1, 1, 1, 1, 1,
3.154495, -0.8891783, 2.024189, 1, 1, 1, 1, 1,
3.471966, 1.086804, 0.5986874, 1, 1, 1, 1, 1,
3.502091, 0.1216304, 2.270559, 1, 1, 1, 1, 1
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
var radius = 9.964646;
var distance = 35.0004;
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
mvMatrix.translate( 0.6417115, 0.2863078, 0.02810121 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.0004);
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
