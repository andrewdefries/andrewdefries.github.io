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
-3.183954, -0.3580405, -2.797677, 1, 0, 0, 1,
-3.033321, 0.5452312, -2.380686, 1, 0.007843138, 0, 1,
-3.027779, 0.169374, -2.003838, 1, 0.01176471, 0, 1,
-2.601416, 0.1693425, 1.069132, 1, 0.01960784, 0, 1,
-2.513938, 0.3482792, -1.353734, 1, 0.02352941, 0, 1,
-2.512826, -0.07059725, -2.567757, 1, 0.03137255, 0, 1,
-2.437593, -1.163643, -2.44581, 1, 0.03529412, 0, 1,
-2.335765, -2.703799, -1.421132, 1, 0.04313726, 0, 1,
-2.300674, -0.8801756, -2.52478, 1, 0.04705882, 0, 1,
-2.252245, -0.007070047, 0.03519773, 1, 0.05490196, 0, 1,
-2.23594, 1.155311, 1.586668, 1, 0.05882353, 0, 1,
-2.231201, -1.49851, -2.858917, 1, 0.06666667, 0, 1,
-2.215, -0.8058599, -1.75292, 1, 0.07058824, 0, 1,
-2.206202, 0.3990782, -2.328916, 1, 0.07843138, 0, 1,
-2.165423, -0.06050716, -2.684656, 1, 0.08235294, 0, 1,
-2.121588, -0.230184, -0.3225473, 1, 0.09019608, 0, 1,
-2.111531, 0.004672068, -1.244261, 1, 0.09411765, 0, 1,
-2.11071, 1.172618, -2.807064, 1, 0.1019608, 0, 1,
-2.070101, 1.835, -2.007153, 1, 0.1098039, 0, 1,
-2.054627, 1.066519, -3.018985, 1, 0.1137255, 0, 1,
-2.028941, -0.5404714, -1.86563, 1, 0.1215686, 0, 1,
-1.995672, -1.969455, -3.577328, 1, 0.1254902, 0, 1,
-1.950353, 0.1848077, -1.454582, 1, 0.1333333, 0, 1,
-1.947307, -0.2874614, -0.4439036, 1, 0.1372549, 0, 1,
-1.931373, 0.6960818, -0.9546595, 1, 0.145098, 0, 1,
-1.894246, 0.2382413, -0.8132554, 1, 0.1490196, 0, 1,
-1.873843, 1.256305, -1.073419, 1, 0.1568628, 0, 1,
-1.866742, -1.600836, -2.27304, 1, 0.1607843, 0, 1,
-1.850316, 0.1358236, -0.9412481, 1, 0.1686275, 0, 1,
-1.836214, -0.3532651, -1.894691, 1, 0.172549, 0, 1,
-1.82753, 0.3553451, -0.8190917, 1, 0.1803922, 0, 1,
-1.795529, 1.155813, -0.244625, 1, 0.1843137, 0, 1,
-1.77779, 0.001177088, -1.48039, 1, 0.1921569, 0, 1,
-1.732655, -0.2704101, -2.131048, 1, 0.1960784, 0, 1,
-1.693349, 0.8820958, -0.5740063, 1, 0.2039216, 0, 1,
-1.693112, -0.4431877, -1.370898, 1, 0.2117647, 0, 1,
-1.675349, 1.42928, 0.5764117, 1, 0.2156863, 0, 1,
-1.652605, 0.4480068, -1.238974, 1, 0.2235294, 0, 1,
-1.648873, -1.084278, -2.67664, 1, 0.227451, 0, 1,
-1.641221, -3.100994, -2.350939, 1, 0.2352941, 0, 1,
-1.629164, -0.1838026, 0.2839142, 1, 0.2392157, 0, 1,
-1.627324, -0.9148391, -2.099709, 1, 0.2470588, 0, 1,
-1.624993, 0.0849933, 0.2609567, 1, 0.2509804, 0, 1,
-1.619376, -2.700145, -3.053038, 1, 0.2588235, 0, 1,
-1.617575, 1.06859, -2.531095, 1, 0.2627451, 0, 1,
-1.590404, 1.190702, -1.763134, 1, 0.2705882, 0, 1,
-1.584974, 0.2149248, -2.386912, 1, 0.2745098, 0, 1,
-1.581615, 0.3912226, -1.732882, 1, 0.282353, 0, 1,
-1.551496, -0.3037056, -2.475163, 1, 0.2862745, 0, 1,
-1.539624, 0.6642077, -0.3817444, 1, 0.2941177, 0, 1,
-1.5235, 0.8359281, -0.2660943, 1, 0.3019608, 0, 1,
-1.522011, 0.3435762, -2.16489, 1, 0.3058824, 0, 1,
-1.514355, -0.5118678, -0.4208926, 1, 0.3137255, 0, 1,
-1.513691, -0.2074185, -1.087741, 1, 0.3176471, 0, 1,
-1.50746, -2.084352, -3.619952, 1, 0.3254902, 0, 1,
-1.506273, 1.202931, -1.77665, 1, 0.3294118, 0, 1,
-1.499883, 0.754454, -0.7251379, 1, 0.3372549, 0, 1,
-1.485968, -1.979929, -3.194676, 1, 0.3411765, 0, 1,
-1.466177, 0.02669396, -1.364399, 1, 0.3490196, 0, 1,
-1.458981, 0.7869304, -0.843483, 1, 0.3529412, 0, 1,
-1.457794, 0.7614157, -0.845554, 1, 0.3607843, 0, 1,
-1.456006, -1.784769, -3.019801, 1, 0.3647059, 0, 1,
-1.442176, -1.831854, -2.253575, 1, 0.372549, 0, 1,
-1.424218, 0.6666517, -1.937969, 1, 0.3764706, 0, 1,
-1.418247, -0.5603163, -1.79918, 1, 0.3843137, 0, 1,
-1.417906, -0.06654423, -3.199679, 1, 0.3882353, 0, 1,
-1.415942, -2.000455, -2.987524, 1, 0.3960784, 0, 1,
-1.404699, 0.7720284, -1.716328, 1, 0.4039216, 0, 1,
-1.390783, 1.900053, -2.340937, 1, 0.4078431, 0, 1,
-1.390544, 0.8354305, -1.975446, 1, 0.4156863, 0, 1,
-1.389731, 0.5673425, -0.3701713, 1, 0.4196078, 0, 1,
-1.386405, -0.5888004, -3.231434, 1, 0.427451, 0, 1,
-1.385144, 1.041726, -0.9277477, 1, 0.4313726, 0, 1,
-1.376069, -0.04505149, -1.521115, 1, 0.4392157, 0, 1,
-1.374366, 0.09150524, -0.590322, 1, 0.4431373, 0, 1,
-1.371094, -0.4079427, -3.040813, 1, 0.4509804, 0, 1,
-1.368259, -1.886381, -2.080862, 1, 0.454902, 0, 1,
-1.357913, -1.043899, -4.20586, 1, 0.4627451, 0, 1,
-1.355412, -1.016566, -1.717454, 1, 0.4666667, 0, 1,
-1.352258, 0.01059692, -2.548107, 1, 0.4745098, 0, 1,
-1.340638, 0.4869725, -4.053598, 1, 0.4784314, 0, 1,
-1.340063, -0.02057386, 0.04076014, 1, 0.4862745, 0, 1,
-1.339722, -1.971963, -2.684222, 1, 0.4901961, 0, 1,
-1.338692, 1.502397, -1.023853, 1, 0.4980392, 0, 1,
-1.335296, 1.777869, -1.900926, 1, 0.5058824, 0, 1,
-1.331747, -0.7216768, -1.210123, 1, 0.509804, 0, 1,
-1.327621, -1.038599, -2.115557, 1, 0.5176471, 0, 1,
-1.322215, -1.047632, -2.92817, 1, 0.5215687, 0, 1,
-1.31582, -0.5683219, -1.787965, 1, 0.5294118, 0, 1,
-1.308547, 0.4372175, -0.5028057, 1, 0.5333334, 0, 1,
-1.3036, -2.367203, -3.266235, 1, 0.5411765, 0, 1,
-1.29356, -0.1262413, -3.270739, 1, 0.5450981, 0, 1,
-1.271528, 0.1306799, -0.6435754, 1, 0.5529412, 0, 1,
-1.271182, -1.022255, -4.80355, 1, 0.5568628, 0, 1,
-1.252849, -0.4611759, -3.62273, 1, 0.5647059, 0, 1,
-1.245849, -0.2982089, -0.5642316, 1, 0.5686275, 0, 1,
-1.245081, 0.1632065, -3.607284, 1, 0.5764706, 0, 1,
-1.227866, -0.7394755, -2.335949, 1, 0.5803922, 0, 1,
-1.226852, -0.7291917, -2.97187, 1, 0.5882353, 0, 1,
-1.222446, -0.5177621, -0.5503178, 1, 0.5921569, 0, 1,
-1.218192, -1.008212, -3.003752, 1, 0.6, 0, 1,
-1.216293, -1.027577, -1.495512, 1, 0.6078432, 0, 1,
-1.210133, 1.782152, -0.6030908, 1, 0.6117647, 0, 1,
-1.209961, 0.8121041, -1.713553, 1, 0.6196079, 0, 1,
-1.176579, 0.3465483, -1.208173, 1, 0.6235294, 0, 1,
-1.172016, 0.90298, 0.2596117, 1, 0.6313726, 0, 1,
-1.170712, -1.358176, -2.320145, 1, 0.6352941, 0, 1,
-1.160882, 0.3661656, -0.2132219, 1, 0.6431373, 0, 1,
-1.159429, -0.1666842, -1.346928, 1, 0.6470588, 0, 1,
-1.156296, -0.8619046, -1.883372, 1, 0.654902, 0, 1,
-1.150454, 0.4797524, -1.049885, 1, 0.6588235, 0, 1,
-1.145118, -0.5737422, -1.853162, 1, 0.6666667, 0, 1,
-1.141212, 0.1216188, -1.573793, 1, 0.6705883, 0, 1,
-1.140969, 0.796873, -1.583058, 1, 0.6784314, 0, 1,
-1.120292, -0.3361126, -3.428043, 1, 0.682353, 0, 1,
-1.104347, -0.6501895, -1.833933, 1, 0.6901961, 0, 1,
-1.102214, -1.102677, -2.051379, 1, 0.6941177, 0, 1,
-1.092714, -1.1288, -2.912081, 1, 0.7019608, 0, 1,
-1.087378, 0.03701765, -2.612242, 1, 0.7098039, 0, 1,
-1.083759, 0.8430181, -1.408034, 1, 0.7137255, 0, 1,
-1.082078, -0.635731, -1.891764, 1, 0.7215686, 0, 1,
-1.077304, -0.6739664, -3.639805, 1, 0.7254902, 0, 1,
-1.073552, -1.17844, -0.9256567, 1, 0.7333333, 0, 1,
-1.071917, -0.183839, -1.905941, 1, 0.7372549, 0, 1,
-1.069377, -0.1388157, -2.704704, 1, 0.7450981, 0, 1,
-1.062686, 0.07375506, -0.4600247, 1, 0.7490196, 0, 1,
-1.06154, -0.09043055, -1.36075, 1, 0.7568628, 0, 1,
-1.058519, -0.7647856, -2.545518, 1, 0.7607843, 0, 1,
-1.051691, -0.6958814, -2.41742, 1, 0.7686275, 0, 1,
-1.047634, 0.03247037, -1.119427, 1, 0.772549, 0, 1,
-1.046725, -1.399975, -2.244626, 1, 0.7803922, 0, 1,
-1.044246, -0.1610113, -2.420981, 1, 0.7843137, 0, 1,
-1.042935, -1.415897, -5.048889, 1, 0.7921569, 0, 1,
-1.042217, -2.277686, -3.354535, 1, 0.7960784, 0, 1,
-1.037821, 0.9794585, 2.158765, 1, 0.8039216, 0, 1,
-1.035172, -0.4719711, -2.332182, 1, 0.8117647, 0, 1,
-1.030284, -0.09253256, -2.468174, 1, 0.8156863, 0, 1,
-1.026816, 0.5841805, -0.123586, 1, 0.8235294, 0, 1,
-1.022736, 1.157714, -0.006354509, 1, 0.827451, 0, 1,
-1.019572, -0.1756144, 0.1270465, 1, 0.8352941, 0, 1,
-1.015017, -0.1943217, -3.294329, 1, 0.8392157, 0, 1,
-1.012178, 1.060447, -1.272082, 1, 0.8470588, 0, 1,
-1.010039, 0.5104786, 0.6622656, 1, 0.8509804, 0, 1,
-1.008707, 0.4226064, -1.698782, 1, 0.8588235, 0, 1,
-0.9990058, -0.621062, -2.971454, 1, 0.8627451, 0, 1,
-0.9957712, 0.05523298, -1.524655, 1, 0.8705882, 0, 1,
-0.9948381, 0.2352974, -0.6591486, 1, 0.8745098, 0, 1,
-0.9904743, -0.4194373, -3.081718, 1, 0.8823529, 0, 1,
-0.9880106, -0.9883552, -1.371599, 1, 0.8862745, 0, 1,
-0.9866589, -0.6830181, -0.4992419, 1, 0.8941177, 0, 1,
-0.9724612, 1.193378, 0.02248936, 1, 0.8980392, 0, 1,
-0.9646446, -1.10412, -2.744096, 1, 0.9058824, 0, 1,
-0.9632515, -0.3936784, -3.614, 1, 0.9137255, 0, 1,
-0.9612755, 0.7930746, -0.2172726, 1, 0.9176471, 0, 1,
-0.9608476, -1.841455, -2.401509, 1, 0.9254902, 0, 1,
-0.9566293, -1.225547, -2.435117, 1, 0.9294118, 0, 1,
-0.9503459, 0.1450661, 0.9374635, 1, 0.9372549, 0, 1,
-0.9496421, 0.2557628, 0.283269, 1, 0.9411765, 0, 1,
-0.9466487, 0.2631305, -0.7877644, 1, 0.9490196, 0, 1,
-0.9446578, 0.7408653, -0.1991539, 1, 0.9529412, 0, 1,
-0.9407129, -0.02529996, -1.003877, 1, 0.9607843, 0, 1,
-0.9393393, 0.01737795, -2.664026, 1, 0.9647059, 0, 1,
-0.9380935, 0.9607487, -1.01485, 1, 0.972549, 0, 1,
-0.9367603, -0.03964673, -2.647466, 1, 0.9764706, 0, 1,
-0.93509, -0.3886461, -0.823167, 1, 0.9843137, 0, 1,
-0.9347016, 1.28015, -1.395668, 1, 0.9882353, 0, 1,
-0.9328679, -0.7761732, -2.027933, 1, 0.9960784, 0, 1,
-0.9295126, -0.4296882, -2.363372, 0.9960784, 1, 0, 1,
-0.9286412, 0.999792, -0.4121633, 0.9921569, 1, 0, 1,
-0.9190162, -0.05562726, -2.842303, 0.9843137, 1, 0, 1,
-0.916257, 2.290534, 0.9607774, 0.9803922, 1, 0, 1,
-0.9144266, -0.8085426, -2.192888, 0.972549, 1, 0, 1,
-0.9137531, 0.2570064, -2.462098, 0.9686275, 1, 0, 1,
-0.9078607, 0.04930196, -0.7044445, 0.9607843, 1, 0, 1,
-0.9075583, -0.8299168, -2.722968, 0.9568627, 1, 0, 1,
-0.9030585, 0.01967235, -1.949068, 0.9490196, 1, 0, 1,
-0.8908797, -0.9334102, -2.02145, 0.945098, 1, 0, 1,
-0.8883343, 0.09011118, -3.631849, 0.9372549, 1, 0, 1,
-0.8846618, -0.5649617, -1.59847, 0.9333333, 1, 0, 1,
-0.8799752, -1.217015, -1.65881, 0.9254902, 1, 0, 1,
-0.8729913, -0.7751559, -4.238558, 0.9215686, 1, 0, 1,
-0.8703775, -1.026482, -3.546449, 0.9137255, 1, 0, 1,
-0.8661337, -1.257683, -4.915631, 0.9098039, 1, 0, 1,
-0.8634982, -1.833596, -4.113419, 0.9019608, 1, 0, 1,
-0.8625154, 0.4178387, -2.640558, 0.8941177, 1, 0, 1,
-0.8609486, 0.9714459, -1.418842, 0.8901961, 1, 0, 1,
-0.855897, -1.281733, -3.700304, 0.8823529, 1, 0, 1,
-0.8545949, -0.06228336, -1.358051, 0.8784314, 1, 0, 1,
-0.8495583, -0.4653147, -2.212286, 0.8705882, 1, 0, 1,
-0.8474112, -0.1874578, -0.2058911, 0.8666667, 1, 0, 1,
-0.846762, 0.6107723, -2.042511, 0.8588235, 1, 0, 1,
-0.8426367, -1.163692, -2.938607, 0.854902, 1, 0, 1,
-0.8376833, -0.1526773, -1.889211, 0.8470588, 1, 0, 1,
-0.8333953, 0.577484, 0.3055818, 0.8431373, 1, 0, 1,
-0.8165284, -0.6620538, -1.318137, 0.8352941, 1, 0, 1,
-0.8144811, 0.4281956, -0.946054, 0.8313726, 1, 0, 1,
-0.8030836, 1.343774, -1.736023, 0.8235294, 1, 0, 1,
-0.7981857, -0.4725132, -2.213554, 0.8196079, 1, 0, 1,
-0.7959949, 0.05912452, -1.759525, 0.8117647, 1, 0, 1,
-0.7925884, -0.9002579, -1.453895, 0.8078431, 1, 0, 1,
-0.7898532, -0.4756004, -1.385229, 0.8, 1, 0, 1,
-0.7852513, 2.485476, -2.000322, 0.7921569, 1, 0, 1,
-0.7801395, -0.1725667, -0.4403307, 0.7882353, 1, 0, 1,
-0.778032, -1.341847, -1.628558, 0.7803922, 1, 0, 1,
-0.772413, 0.5211747, -1.215377, 0.7764706, 1, 0, 1,
-0.7720008, 0.3306546, -2.818575, 0.7686275, 1, 0, 1,
-0.7667893, -2.2423, -2.582574, 0.7647059, 1, 0, 1,
-0.7648115, -0.5133391, -2.176196, 0.7568628, 1, 0, 1,
-0.7637041, -0.5867249, -1.972549, 0.7529412, 1, 0, 1,
-0.7575332, 0.4536723, -2.607335, 0.7450981, 1, 0, 1,
-0.7518724, 0.237454, -1.298279, 0.7411765, 1, 0, 1,
-0.7510568, 0.4412947, -1.743603, 0.7333333, 1, 0, 1,
-0.7466869, -0.3678171, -2.913189, 0.7294118, 1, 0, 1,
-0.7460948, 0.7815455, -1.882341, 0.7215686, 1, 0, 1,
-0.7435647, -1.805796, -3.436285, 0.7176471, 1, 0, 1,
-0.7402524, 2.008133, -1.579352, 0.7098039, 1, 0, 1,
-0.7328654, -0.149661, -3.417789, 0.7058824, 1, 0, 1,
-0.7289925, 0.02598275, -1.36908, 0.6980392, 1, 0, 1,
-0.7277349, 1.282449, -1.594626, 0.6901961, 1, 0, 1,
-0.7267186, -0.4940073, -1.221751, 0.6862745, 1, 0, 1,
-0.7243813, -1.02895, -3.843856, 0.6784314, 1, 0, 1,
-0.7230477, 1.405362, -1.500879, 0.6745098, 1, 0, 1,
-0.7216694, 1.631294, -1.144089, 0.6666667, 1, 0, 1,
-0.7149742, -0.2216282, -1.101703, 0.6627451, 1, 0, 1,
-0.7131883, -0.4843333, -1.217138, 0.654902, 1, 0, 1,
-0.7105533, -1.335167, -2.906349, 0.6509804, 1, 0, 1,
-0.7066458, 0.7597122, 0.6244786, 0.6431373, 1, 0, 1,
-0.7046918, -1.18963, -0.8994874, 0.6392157, 1, 0, 1,
-0.6940724, -0.5647296, -1.357772, 0.6313726, 1, 0, 1,
-0.6911802, -0.3536154, -1.605571, 0.627451, 1, 0, 1,
-0.6904312, 1.08066, -0.5127335, 0.6196079, 1, 0, 1,
-0.6863264, -0.4199678, -3.27655, 0.6156863, 1, 0, 1,
-0.6848139, -1.952268, -1.190465, 0.6078432, 1, 0, 1,
-0.683294, 0.1835922, -1.657298, 0.6039216, 1, 0, 1,
-0.6826069, 1.141696, -0.1345144, 0.5960785, 1, 0, 1,
-0.680689, 0.08519746, -4.338413, 0.5882353, 1, 0, 1,
-0.6778156, 0.9408381, -0.3946382, 0.5843138, 1, 0, 1,
-0.6768556, -1.091077, -1.999059, 0.5764706, 1, 0, 1,
-0.6731426, -0.3460084, -2.130719, 0.572549, 1, 0, 1,
-0.672152, 0.5319917, -1.425137, 0.5647059, 1, 0, 1,
-0.66824, 1.073147, -0.9036178, 0.5607843, 1, 0, 1,
-0.6654782, -0.7744051, -1.901423, 0.5529412, 1, 0, 1,
-0.6636914, 2.00086, 0.7539052, 0.5490196, 1, 0, 1,
-0.6585326, -0.6206507, -2.29507, 0.5411765, 1, 0, 1,
-0.6581809, 1.469547, -0.1269686, 0.5372549, 1, 0, 1,
-0.6576253, -1.050445, -3.853901, 0.5294118, 1, 0, 1,
-0.6567725, 1.689984, -1.972657, 0.5254902, 1, 0, 1,
-0.6556625, -1.067412, -4.306655, 0.5176471, 1, 0, 1,
-0.6478345, -1.104845, -3.155124, 0.5137255, 1, 0, 1,
-0.6474358, 1.671688, -1.550562, 0.5058824, 1, 0, 1,
-0.6410611, -1.414655, -2.757965, 0.5019608, 1, 0, 1,
-0.6372961, -1.169162, -2.723797, 0.4941176, 1, 0, 1,
-0.6353123, -0.3225698, -1.960294, 0.4862745, 1, 0, 1,
-0.6351547, 1.118211, -0.6097305, 0.4823529, 1, 0, 1,
-0.633886, 0.4668052, -1.330284, 0.4745098, 1, 0, 1,
-0.6287246, -1.581535, -3.399195, 0.4705882, 1, 0, 1,
-0.6267527, -0.5562237, -1.643158, 0.4627451, 1, 0, 1,
-0.6194785, 0.1175491, -0.9215963, 0.4588235, 1, 0, 1,
-0.6167252, 0.8853874, -0.4276414, 0.4509804, 1, 0, 1,
-0.6132129, -1.278071, -3.776052, 0.4470588, 1, 0, 1,
-0.5940111, -0.1057711, -3.176618, 0.4392157, 1, 0, 1,
-0.5918766, 0.5548192, -0.5193806, 0.4352941, 1, 0, 1,
-0.588282, 0.2046138, -3.226884, 0.427451, 1, 0, 1,
-0.5880978, -0.4604321, -2.054037, 0.4235294, 1, 0, 1,
-0.586675, -0.2922642, -1.498598, 0.4156863, 1, 0, 1,
-0.5850801, 0.1786615, -1.004437, 0.4117647, 1, 0, 1,
-0.581186, -0.4894999, -2.699036, 0.4039216, 1, 0, 1,
-0.5775924, -0.2594974, -0.5788645, 0.3960784, 1, 0, 1,
-0.5769638, -0.4584982, -3.113641, 0.3921569, 1, 0, 1,
-0.5756999, -0.8874707, -3.834521, 0.3843137, 1, 0, 1,
-0.5755427, -0.374218, -3.894318, 0.3803922, 1, 0, 1,
-0.5738795, -1.741758, -5.517383, 0.372549, 1, 0, 1,
-0.5726628, -1.675638, -4.297544, 0.3686275, 1, 0, 1,
-0.5724258, -0.03015383, 0.2005084, 0.3607843, 1, 0, 1,
-0.5678114, -0.1322198, -1.792603, 0.3568628, 1, 0, 1,
-0.5661557, -0.5733577, -2.132625, 0.3490196, 1, 0, 1,
-0.5658321, -1.134719, -1.491796, 0.345098, 1, 0, 1,
-0.5614986, -1.209571, -1.372329, 0.3372549, 1, 0, 1,
-0.5575382, -1.65007, -3.148144, 0.3333333, 1, 0, 1,
-0.5559899, 0.1313962, -1.070396, 0.3254902, 1, 0, 1,
-0.5530942, 0.5338704, -1.195012, 0.3215686, 1, 0, 1,
-0.5503954, 0.286705, -2.048802, 0.3137255, 1, 0, 1,
-0.5462799, -1.119921, -3.35496, 0.3098039, 1, 0, 1,
-0.5432094, 1.140581, -1.633813, 0.3019608, 1, 0, 1,
-0.5403785, -1.502531, -3.251605, 0.2941177, 1, 0, 1,
-0.5328628, 0.03720046, -1.411139, 0.2901961, 1, 0, 1,
-0.5281649, -1.874905, -2.586437, 0.282353, 1, 0, 1,
-0.526059, -0.5379588, -0.3544245, 0.2784314, 1, 0, 1,
-0.5251441, -0.4064867, -3.202093, 0.2705882, 1, 0, 1,
-0.5189232, 0.08144367, -0.4471738, 0.2666667, 1, 0, 1,
-0.5182464, -1.203596, -2.651873, 0.2588235, 1, 0, 1,
-0.5123386, -0.3609309, -3.292521, 0.254902, 1, 0, 1,
-0.5072887, -0.1625177, -1.410758, 0.2470588, 1, 0, 1,
-0.5036889, -0.03168387, -1.926369, 0.2431373, 1, 0, 1,
-0.4961116, -0.5321674, -1.916829, 0.2352941, 1, 0, 1,
-0.4955242, 0.7981147, -0.4095049, 0.2313726, 1, 0, 1,
-0.4887658, -1.006009, -3.459609, 0.2235294, 1, 0, 1,
-0.4887318, -0.7315931, -2.386774, 0.2196078, 1, 0, 1,
-0.4834731, -0.4064916, -1.764187, 0.2117647, 1, 0, 1,
-0.4814467, 0.3619339, -1.492688, 0.2078431, 1, 0, 1,
-0.479531, 1.343735, -1.500501, 0.2, 1, 0, 1,
-0.4773934, 0.1142964, -2.133171, 0.1921569, 1, 0, 1,
-0.4763123, 0.6023929, -1.004147, 0.1882353, 1, 0, 1,
-0.4699426, 0.9164647, -0.6850019, 0.1803922, 1, 0, 1,
-0.4676567, -0.1125354, -2.261128, 0.1764706, 1, 0, 1,
-0.4570662, -0.9921954, -3.535288, 0.1686275, 1, 0, 1,
-0.4537632, -0.5649523, -1.458077, 0.1647059, 1, 0, 1,
-0.4534402, 0.6905691, 0.160959, 0.1568628, 1, 0, 1,
-0.4524359, 0.4423575, 0.2018457, 0.1529412, 1, 0, 1,
-0.4507916, 0.9866931, -2.628827, 0.145098, 1, 0, 1,
-0.4491557, 0.5411156, -0.4184306, 0.1411765, 1, 0, 1,
-0.4482507, -0.5460479, -3.055109, 0.1333333, 1, 0, 1,
-0.4478591, -2.38151, -2.96231, 0.1294118, 1, 0, 1,
-0.442747, 1.21038, -1.467937, 0.1215686, 1, 0, 1,
-0.4379255, 0.9276929, -0.6230587, 0.1176471, 1, 0, 1,
-0.4360026, 0.1503309, -1.706093, 0.1098039, 1, 0, 1,
-0.4358575, -0.5679159, -3.181499, 0.1058824, 1, 0, 1,
-0.4356758, 2.374866, 2.280638, 0.09803922, 1, 0, 1,
-0.4356664, -1.066774, -1.915534, 0.09019608, 1, 0, 1,
-0.4343118, 1.684824, -2.094456, 0.08627451, 1, 0, 1,
-0.4330769, -0.6180483, -3.280811, 0.07843138, 1, 0, 1,
-0.4326428, 1.066394, -1.377935, 0.07450981, 1, 0, 1,
-0.4287946, -0.9497498, -3.017683, 0.06666667, 1, 0, 1,
-0.4285874, -0.1436184, -1.573234, 0.0627451, 1, 0, 1,
-0.4262842, -1.66937, -1.861657, 0.05490196, 1, 0, 1,
-0.424629, 1.568444, 0.2758254, 0.05098039, 1, 0, 1,
-0.4243577, -0.9416581, -3.140578, 0.04313726, 1, 0, 1,
-0.423846, 0.1743923, 0.2413071, 0.03921569, 1, 0, 1,
-0.4191059, 1.62374, 0.2369346, 0.03137255, 1, 0, 1,
-0.4182939, -1.247528, -3.293484, 0.02745098, 1, 0, 1,
-0.4162907, -0.9290551, -1.97155, 0.01960784, 1, 0, 1,
-0.4119757, -0.9146357, -2.892308, 0.01568628, 1, 0, 1,
-0.4003398, -1.224312, -2.976854, 0.007843138, 1, 0, 1,
-0.3990804, 0.3186151, -1.541357, 0.003921569, 1, 0, 1,
-0.3981532, 0.5715904, 0.8883497, 0, 1, 0.003921569, 1,
-0.3980249, -0.6401995, -3.554733, 0, 1, 0.01176471, 1,
-0.3967722, -0.3948917, -3.543735, 0, 1, 0.01568628, 1,
-0.3957098, 0.3924177, -0.1505827, 0, 1, 0.02352941, 1,
-0.3953502, -1.417456, -1.294566, 0, 1, 0.02745098, 1,
-0.3930469, 0.5695229, -1.294943, 0, 1, 0.03529412, 1,
-0.3897489, 0.2455639, -1.410976, 0, 1, 0.03921569, 1,
-0.3875532, 2.001223, 0.3082385, 0, 1, 0.04705882, 1,
-0.386776, -1.450553, -3.932792, 0, 1, 0.05098039, 1,
-0.3864842, 1.439479, -1.061705, 0, 1, 0.05882353, 1,
-0.3839726, -0.4728562, -2.71436, 0, 1, 0.0627451, 1,
-0.3808044, 0.2747736, -0.09473486, 0, 1, 0.07058824, 1,
-0.3771081, -0.6983249, -2.503825, 0, 1, 0.07450981, 1,
-0.3767125, -1.148459, -4.425681, 0, 1, 0.08235294, 1,
-0.3735453, -1.46661, -2.100279, 0, 1, 0.08627451, 1,
-0.3616494, 1.903148, 2.592348, 0, 1, 0.09411765, 1,
-0.3608737, -0.01441243, -0.7771218, 0, 1, 0.1019608, 1,
-0.3592376, -0.8244014, -2.701129, 0, 1, 0.1058824, 1,
-0.3586842, -1.559645, -2.813315, 0, 1, 0.1137255, 1,
-0.3577528, 0.07719877, -0.8413131, 0, 1, 0.1176471, 1,
-0.3568355, -0.2335629, -3.595053, 0, 1, 0.1254902, 1,
-0.3523882, -2.150298, -2.470484, 0, 1, 0.1294118, 1,
-0.351209, 1.152665, 1.310457, 0, 1, 0.1372549, 1,
-0.3414947, -0.2205011, -1.416691, 0, 1, 0.1411765, 1,
-0.3397453, -0.123795, 1.0119, 0, 1, 0.1490196, 1,
-0.3322448, -0.5614228, -4.680468, 0, 1, 0.1529412, 1,
-0.331419, 0.855502, 0.06379184, 0, 1, 0.1607843, 1,
-0.326958, 1.087367, -0.3563881, 0, 1, 0.1647059, 1,
-0.3264439, 1.605601, -0.4001768, 0, 1, 0.172549, 1,
-0.3239377, 0.4368719, -2.724682, 0, 1, 0.1764706, 1,
-0.3217801, 0.5259053, 0.6267766, 0, 1, 0.1843137, 1,
-0.3045928, 0.8121403, -0.1470809, 0, 1, 0.1882353, 1,
-0.3033541, 0.5771257, -0.01871315, 0, 1, 0.1960784, 1,
-0.2985911, -1.209264, -3.508987, 0, 1, 0.2039216, 1,
-0.2951759, -1.107256, -3.76095, 0, 1, 0.2078431, 1,
-0.2908005, 0.8405499, -1.273867, 0, 1, 0.2156863, 1,
-0.2892004, 1.082869, 0.7093324, 0, 1, 0.2196078, 1,
-0.2862677, -2.078355, -2.871035, 0, 1, 0.227451, 1,
-0.2817328, -1.57851, -3.460364, 0, 1, 0.2313726, 1,
-0.2814701, 1.402532, -1.406962, 0, 1, 0.2392157, 1,
-0.2756489, 0.3952815, 1.265937, 0, 1, 0.2431373, 1,
-0.2746423, 0.167047, 0.2910183, 0, 1, 0.2509804, 1,
-0.2732351, -1.132615, -3.708445, 0, 1, 0.254902, 1,
-0.2731365, 0.3408695, 0.540809, 0, 1, 0.2627451, 1,
-0.2729474, 0.3896337, -0.6934532, 0, 1, 0.2666667, 1,
-0.2684984, -0.6625383, -2.530025, 0, 1, 0.2745098, 1,
-0.2673309, -0.5750099, -4.029437, 0, 1, 0.2784314, 1,
-0.267027, 2.366645, -0.2326536, 0, 1, 0.2862745, 1,
-0.2669184, -1.042462, -3.411969, 0, 1, 0.2901961, 1,
-0.2648752, 1.170177, 0.5743592, 0, 1, 0.2980392, 1,
-0.2623546, 2.082035, -1.699102, 0, 1, 0.3058824, 1,
-0.2616045, 0.4914347, -0.02118218, 0, 1, 0.3098039, 1,
-0.2599855, 0.5067344, 0.4609616, 0, 1, 0.3176471, 1,
-0.2595793, 0.5116825, -0.7808586, 0, 1, 0.3215686, 1,
-0.2550741, -1.355172, -3.751815, 0, 1, 0.3294118, 1,
-0.2541625, 0.9817592, 0.9064798, 0, 1, 0.3333333, 1,
-0.2533649, 1.746137, -0.503946, 0, 1, 0.3411765, 1,
-0.2495138, 0.6822349, -0.08042895, 0, 1, 0.345098, 1,
-0.2460748, -0.6563028, -1.314, 0, 1, 0.3529412, 1,
-0.2451313, -0.4248928, -1.874975, 0, 1, 0.3568628, 1,
-0.2431008, -0.6828651, -3.00945, 0, 1, 0.3647059, 1,
-0.239122, -0.3271048, -1.493138, 0, 1, 0.3686275, 1,
-0.228327, -0.5929245, -3.699371, 0, 1, 0.3764706, 1,
-0.2239811, -1.846508, -2.098812, 0, 1, 0.3803922, 1,
-0.2223177, -0.1234579, -2.802512, 0, 1, 0.3882353, 1,
-0.2158542, 0.6365954, 0.1989653, 0, 1, 0.3921569, 1,
-0.2099998, -0.9158727, -1.625577, 0, 1, 0.4, 1,
-0.20973, 0.890665, -2.726933, 0, 1, 0.4078431, 1,
-0.2081366, -0.3745952, -1.751363, 0, 1, 0.4117647, 1,
-0.2011684, 1.790253, -0.3688609, 0, 1, 0.4196078, 1,
-0.1952173, -1.039437, -2.265924, 0, 1, 0.4235294, 1,
-0.1932605, -1.57932, -3.273084, 0, 1, 0.4313726, 1,
-0.1890738, -0.09144925, -3.244177, 0, 1, 0.4352941, 1,
-0.1889616, -0.694254, -2.132559, 0, 1, 0.4431373, 1,
-0.1849607, 0.8644637, -1.092815, 0, 1, 0.4470588, 1,
-0.1781768, 0.5451732, -1.373102, 0, 1, 0.454902, 1,
-0.1774039, 0.6363213, -0.2300553, 0, 1, 0.4588235, 1,
-0.1751262, -0.08394429, -0.6583022, 0, 1, 0.4666667, 1,
-0.1742175, 1.229484, -0.8977327, 0, 1, 0.4705882, 1,
-0.1736439, 0.5289728, 0.21419, 0, 1, 0.4784314, 1,
-0.1727685, 2.470031, 2.030941, 0, 1, 0.4823529, 1,
-0.1657776, 0.9173571, 0.8097169, 0, 1, 0.4901961, 1,
-0.162634, 1.431638, -1.044283, 0, 1, 0.4941176, 1,
-0.1611504, -0.02028045, -1.732818, 0, 1, 0.5019608, 1,
-0.1590123, 0.4463995, -1.080384, 0, 1, 0.509804, 1,
-0.1523251, -0.8953148, -3.028482, 0, 1, 0.5137255, 1,
-0.1515248, -0.01440414, -0.6832545, 0, 1, 0.5215687, 1,
-0.1499916, 0.3238907, -0.3506841, 0, 1, 0.5254902, 1,
-0.1470351, 1.335504, 0.6682309, 0, 1, 0.5333334, 1,
-0.1440457, 1.818343, 1.029271, 0, 1, 0.5372549, 1,
-0.1382553, -0.9835148, -2.101741, 0, 1, 0.5450981, 1,
-0.1376265, 0.5348942, 0.5911192, 0, 1, 0.5490196, 1,
-0.1329484, 0.4125421, -1.202146, 0, 1, 0.5568628, 1,
-0.1284622, 0.848088, -1.14992, 0, 1, 0.5607843, 1,
-0.1255995, 0.2286658, -1.400133, 0, 1, 0.5686275, 1,
-0.1248033, 0.3950799, 0.8135037, 0, 1, 0.572549, 1,
-0.1215561, -0.6771696, -2.165395, 0, 1, 0.5803922, 1,
-0.1212405, -0.6159895, -2.064254, 0, 1, 0.5843138, 1,
-0.1207894, 0.7127733, 1.304657, 0, 1, 0.5921569, 1,
-0.1170096, 1.657089, -0.4874719, 0, 1, 0.5960785, 1,
-0.1145989, -1.575072, -3.43205, 0, 1, 0.6039216, 1,
-0.1141191, 0.8769917, -0.8414541, 0, 1, 0.6117647, 1,
-0.1123133, -0.09293342, -1.830486, 0, 1, 0.6156863, 1,
-0.1068762, 0.6013477, -0.9518777, 0, 1, 0.6235294, 1,
-0.1021857, 1.145511, -0.4627473, 0, 1, 0.627451, 1,
-0.1007068, 1.347377, -1.216991, 0, 1, 0.6352941, 1,
-0.1004411, -0.6436719, -3.11732, 0, 1, 0.6392157, 1,
-0.09753, 0.193932, -0.9422697, 0, 1, 0.6470588, 1,
-0.09587217, -0.2039154, -2.555404, 0, 1, 0.6509804, 1,
-0.09423315, 1.069354, 2.786431, 0, 1, 0.6588235, 1,
-0.0924816, -0.3671903, -1.608063, 0, 1, 0.6627451, 1,
-0.08869683, 0.5184925, -0.74229, 0, 1, 0.6705883, 1,
-0.08109061, -0.3182096, -2.514338, 0, 1, 0.6745098, 1,
-0.08028051, -1.145422, -2.62562, 0, 1, 0.682353, 1,
-0.08024076, -0.110277, -2.191597, 0, 1, 0.6862745, 1,
-0.07881048, 0.7929802, -0.5055619, 0, 1, 0.6941177, 1,
-0.0720727, -1.34529, -3.210131, 0, 1, 0.7019608, 1,
-0.07199219, -0.2128525, -2.088344, 0, 1, 0.7058824, 1,
-0.06884784, 1.917309, 0.2576069, 0, 1, 0.7137255, 1,
-0.06834766, 1.518259, 1.295607, 0, 1, 0.7176471, 1,
-0.06757377, 0.0004800707, 0.4963002, 0, 1, 0.7254902, 1,
-0.0663945, -0.9779575, -2.426725, 0, 1, 0.7294118, 1,
-0.06154485, 0.6043392, 1.246829, 0, 1, 0.7372549, 1,
-0.05869562, -1.239373, -3.706563, 0, 1, 0.7411765, 1,
-0.05543995, 0.414078, -1.243339, 0, 1, 0.7490196, 1,
-0.05406044, 0.2728009, 1.059266, 0, 1, 0.7529412, 1,
-0.05372231, 1.210902, -1.508327, 0, 1, 0.7607843, 1,
-0.05253113, -0.9580491, -3.474578, 0, 1, 0.7647059, 1,
-0.05167078, -1.077457, -3.762261, 0, 1, 0.772549, 1,
-0.05125635, -0.1221623, -3.483467, 0, 1, 0.7764706, 1,
-0.04851309, 0.910479, -0.1340594, 0, 1, 0.7843137, 1,
-0.04547952, -0.6735693, -4.304027, 0, 1, 0.7882353, 1,
-0.04325512, -0.2745615, -3.105551, 0, 1, 0.7960784, 1,
-0.04320928, -1.184089, -2.167645, 0, 1, 0.8039216, 1,
-0.04178733, 0.0979729, 0.1308478, 0, 1, 0.8078431, 1,
-0.04050605, 0.6876118, -1.145277, 0, 1, 0.8156863, 1,
-0.03986545, 0.7426726, -1.369294, 0, 1, 0.8196079, 1,
-0.03979594, -1.368276, -2.868603, 0, 1, 0.827451, 1,
-0.03698992, -0.7933019, -2.223058, 0, 1, 0.8313726, 1,
-0.02856392, -0.3832504, -3.344906, 0, 1, 0.8392157, 1,
-0.02489293, -0.2942486, -3.65817, 0, 1, 0.8431373, 1,
-0.02467335, 0.7602343, -0.3964329, 0, 1, 0.8509804, 1,
-0.02300073, -0.2391293, -2.159535, 0, 1, 0.854902, 1,
-0.02133946, -1.310697, -2.253257, 0, 1, 0.8627451, 1,
-0.01918734, 0.9866144, 0.417479, 0, 1, 0.8666667, 1,
-0.01840383, -1.284726, -3.5944, 0, 1, 0.8745098, 1,
-0.01702608, 0.9278782, 0.07767436, 0, 1, 0.8784314, 1,
-0.01492326, 1.389017, -0.1209839, 0, 1, 0.8862745, 1,
-0.01435484, 0.1238453, 1.197152, 0, 1, 0.8901961, 1,
-0.01312899, 0.06738312, -0.1631552, 0, 1, 0.8980392, 1,
-0.01307483, 0.8153393, 0.3930556, 0, 1, 0.9058824, 1,
-0.01018304, -1.089571, -2.856023, 0, 1, 0.9098039, 1,
-0.009805021, 0.7706195, -0.2192378, 0, 1, 0.9176471, 1,
-0.007347013, 1.353243, 0.9243783, 0, 1, 0.9215686, 1,
-0.005760394, 0.5277917, -0.1098623, 0, 1, 0.9294118, 1,
-0.004511291, 0.7146053, 0.982939, 0, 1, 0.9333333, 1,
-0.00337356, -0.1711252, -2.993737, 0, 1, 0.9411765, 1,
-0.003054617, 1.903977, 3.132174, 0, 1, 0.945098, 1,
-0.002551743, 2.859215, -0.8801939, 0, 1, 0.9529412, 1,
-0.001446918, 0.1227334, 0.8023018, 0, 1, 0.9568627, 1,
0.001910352, 0.09842933, 0.6937922, 0, 1, 0.9647059, 1,
0.004527241, 1.671376, -0.4000182, 0, 1, 0.9686275, 1,
0.007116199, -2.309716, 1.8661, 0, 1, 0.9764706, 1,
0.008434162, 0.7332349, 0.2729303, 0, 1, 0.9803922, 1,
0.01049173, 0.9912435, 0.4047149, 0, 1, 0.9882353, 1,
0.01076701, 0.4747484, 0.4629288, 0, 1, 0.9921569, 1,
0.0143184, -0.2226802, 3.568863, 0, 1, 1, 1,
0.01609992, 1.794692, -1.010846, 0, 0.9921569, 1, 1,
0.01803238, 0.1580338, 1.03533, 0, 0.9882353, 1, 1,
0.02417089, -0.4853821, 3.950787, 0, 0.9803922, 1, 1,
0.0311641, -0.6197844, 1.206665, 0, 0.9764706, 1, 1,
0.03555254, 0.4367419, -0.03870634, 0, 0.9686275, 1, 1,
0.03784972, -0.6143991, 3.896587, 0, 0.9647059, 1, 1,
0.03887109, -0.8387319, 2.40459, 0, 0.9568627, 1, 1,
0.04392802, 0.03480551, 0.5729812, 0, 0.9529412, 1, 1,
0.04561681, -0.1569915, 2.657369, 0, 0.945098, 1, 1,
0.04722586, -0.2127029, 1.53654, 0, 0.9411765, 1, 1,
0.04751232, -0.3610579, 1.070461, 0, 0.9333333, 1, 1,
0.0475152, 1.313271, 0.01652734, 0, 0.9294118, 1, 1,
0.05173767, 0.6969185, 0.7475801, 0, 0.9215686, 1, 1,
0.05218284, -0.02976716, 2.12347, 0, 0.9176471, 1, 1,
0.05866969, 0.420598, 1.242844, 0, 0.9098039, 1, 1,
0.06135888, 0.1411954, -1.220795, 0, 0.9058824, 1, 1,
0.06402748, 1.00176, -0.2144558, 0, 0.8980392, 1, 1,
0.06559408, 0.5090401, 1.762551, 0, 0.8901961, 1, 1,
0.07057396, 0.9892311, -0.0813996, 0, 0.8862745, 1, 1,
0.07483201, -1.206841, 2.376899, 0, 0.8784314, 1, 1,
0.07879152, -0.9439954, 1.435463, 0, 0.8745098, 1, 1,
0.08208263, 0.4813086, 2.414447, 0, 0.8666667, 1, 1,
0.0839007, 0.009656855, 1.355824, 0, 0.8627451, 1, 1,
0.08678191, 0.1858048, 1.372003, 0, 0.854902, 1, 1,
0.08681778, 3.133677, -0.08314227, 0, 0.8509804, 1, 1,
0.08824586, -1.032797, 3.845311, 0, 0.8431373, 1, 1,
0.08996356, -0.691936, 3.541445, 0, 0.8392157, 1, 1,
0.09521948, -0.1805423, 1.731418, 0, 0.8313726, 1, 1,
0.09900556, -2.076343, 4.15202, 0, 0.827451, 1, 1,
0.09901955, 0.4385172, 1.42463, 0, 0.8196079, 1, 1,
0.09986701, -0.4663101, 3.778929, 0, 0.8156863, 1, 1,
0.1029508, 1.892884, 0.2658498, 0, 0.8078431, 1, 1,
0.106592, 1.288565, -1.165956, 0, 0.8039216, 1, 1,
0.1066383, 0.7349504, 1.829048, 0, 0.7960784, 1, 1,
0.1074581, 1.175223, -1.016478, 0, 0.7882353, 1, 1,
0.1123295, 0.6698176, -0.05822459, 0, 0.7843137, 1, 1,
0.1172427, 1.720604, -1.10898, 0, 0.7764706, 1, 1,
0.1189432, 0.06294369, 2.010195, 0, 0.772549, 1, 1,
0.1227423, 2.306215, 0.7113626, 0, 0.7647059, 1, 1,
0.1324624, -1.325085, 2.639804, 0, 0.7607843, 1, 1,
0.1380416, 0.8423449, -0.2833202, 0, 0.7529412, 1, 1,
0.13826, -0.08125322, 2.560471, 0, 0.7490196, 1, 1,
0.142167, 2.040747, 1.009864, 0, 0.7411765, 1, 1,
0.1479076, -0.4477662, 2.453984, 0, 0.7372549, 1, 1,
0.1484068, 0.4271462, 1.033671, 0, 0.7294118, 1, 1,
0.1491192, -1.794065, 3.200033, 0, 0.7254902, 1, 1,
0.1508467, 0.9440281, 1.275139, 0, 0.7176471, 1, 1,
0.1537853, 1.359126, -0.1977435, 0, 0.7137255, 1, 1,
0.1543013, -1.575325, 4.197285, 0, 0.7058824, 1, 1,
0.1548609, 0.7498152, -1.550447, 0, 0.6980392, 1, 1,
0.1611945, -1.399202, 2.436402, 0, 0.6941177, 1, 1,
0.1632975, -0.2375735, 3.874264, 0, 0.6862745, 1, 1,
0.1652275, -0.9158821, 3.84231, 0, 0.682353, 1, 1,
0.1686536, 0.6041869, 0.7913122, 0, 0.6745098, 1, 1,
0.1739455, -1.77613, 3.631829, 0, 0.6705883, 1, 1,
0.1742143, 0.587955, -0.8326855, 0, 0.6627451, 1, 1,
0.1756255, 0.6617872, 0.5678182, 0, 0.6588235, 1, 1,
0.1779397, -0.5806224, 2.583384, 0, 0.6509804, 1, 1,
0.180418, -2.100346, 2.797357, 0, 0.6470588, 1, 1,
0.1855159, -0.4944303, 4.885921, 0, 0.6392157, 1, 1,
0.1881078, 0.890453, 0.7616384, 0, 0.6352941, 1, 1,
0.1956502, 1.73085, 0.5576091, 0, 0.627451, 1, 1,
0.1981823, 1.8669, -0.6739656, 0, 0.6235294, 1, 1,
0.1983522, 0.05377379, 0.1123555, 0, 0.6156863, 1, 1,
0.2062249, 0.3995865, 1.925836, 0, 0.6117647, 1, 1,
0.2067429, -1.330511, 1.207642, 0, 0.6039216, 1, 1,
0.2073703, -2.175645, 4.010783, 0, 0.5960785, 1, 1,
0.2085297, 0.2310273, -0.7178978, 0, 0.5921569, 1, 1,
0.2087691, -0.2219634, 3.108932, 0, 0.5843138, 1, 1,
0.2108573, 0.1061463, 2.417301, 0, 0.5803922, 1, 1,
0.2119924, 1.386607, 0.6177486, 0, 0.572549, 1, 1,
0.2162276, -0.4237388, 2.903721, 0, 0.5686275, 1, 1,
0.2185332, 2.282617, -0.5218008, 0, 0.5607843, 1, 1,
0.220108, -1.813033, 1.203677, 0, 0.5568628, 1, 1,
0.2202111, 0.1886027, 1.210361, 0, 0.5490196, 1, 1,
0.2210009, -0.04086351, 0.8108935, 0, 0.5450981, 1, 1,
0.2214472, 0.9998133, 0.3898547, 0, 0.5372549, 1, 1,
0.2218571, 1.323755, -1.082972, 0, 0.5333334, 1, 1,
0.2238958, -0.466442, 2.863786, 0, 0.5254902, 1, 1,
0.2251975, 0.2167244, -0.3392305, 0, 0.5215687, 1, 1,
0.2285842, -1.028804, 0.7954691, 0, 0.5137255, 1, 1,
0.2301533, 0.6926314, -0.8281, 0, 0.509804, 1, 1,
0.23057, 0.3678215, 0.07378075, 0, 0.5019608, 1, 1,
0.231226, -1.027479, 2.662279, 0, 0.4941176, 1, 1,
0.2332177, -1.292417, 1.861926, 0, 0.4901961, 1, 1,
0.2446029, -0.2533796, 4.498733, 0, 0.4823529, 1, 1,
0.2453057, 0.386759, -0.5069948, 0, 0.4784314, 1, 1,
0.2479538, -0.7702366, 2.428962, 0, 0.4705882, 1, 1,
0.2482718, 0.4681798, 0.796005, 0, 0.4666667, 1, 1,
0.2542298, 1.022604, 1.384731, 0, 0.4588235, 1, 1,
0.2543761, 0.6709852, 0.166636, 0, 0.454902, 1, 1,
0.2568063, 0.5363335, -0.2723369, 0, 0.4470588, 1, 1,
0.2591944, -0.8925417, 5.033256, 0, 0.4431373, 1, 1,
0.259846, 0.4812431, 1.001117, 0, 0.4352941, 1, 1,
0.2627063, 0.5093473, 1.712985, 0, 0.4313726, 1, 1,
0.2665226, -1.150963, 2.629009, 0, 0.4235294, 1, 1,
0.2683228, -0.3231738, 2.395306, 0, 0.4196078, 1, 1,
0.2691768, -0.9747273, 3.479692, 0, 0.4117647, 1, 1,
0.2696475, -0.7016104, 1.501441, 0, 0.4078431, 1, 1,
0.2710566, -0.7571881, 2.007199, 0, 0.4, 1, 1,
0.271577, -1.299764, 2.341852, 0, 0.3921569, 1, 1,
0.2724169, -1.151322, 1.199502, 0, 0.3882353, 1, 1,
0.2736673, 0.3654234, 1.414753, 0, 0.3803922, 1, 1,
0.2757775, 0.8482644, 0.2939247, 0, 0.3764706, 1, 1,
0.2765013, -0.3205473, 2.591183, 0, 0.3686275, 1, 1,
0.2772232, 0.04088433, 0.7560481, 0, 0.3647059, 1, 1,
0.2784591, -0.09097993, 1.53113, 0, 0.3568628, 1, 1,
0.2790716, 1.700382, 0.1302681, 0, 0.3529412, 1, 1,
0.2807909, -0.317379, 1.286369, 0, 0.345098, 1, 1,
0.2842163, -0.3677357, 1.454653, 0, 0.3411765, 1, 1,
0.2922629, -0.4437662, 3.765757, 0, 0.3333333, 1, 1,
0.2990902, 1.322974, 0.9551225, 0, 0.3294118, 1, 1,
0.3006342, -0.8564066, 1.745624, 0, 0.3215686, 1, 1,
0.3023064, 0.3851074, 0.7809309, 0, 0.3176471, 1, 1,
0.3031272, 0.5999957, 1.421, 0, 0.3098039, 1, 1,
0.303396, -0.2114391, 2.467166, 0, 0.3058824, 1, 1,
0.3068377, 0.8258806, -0.1842853, 0, 0.2980392, 1, 1,
0.3097866, -0.2401457, 1.925051, 0, 0.2901961, 1, 1,
0.3124679, -0.753705, 2.306786, 0, 0.2862745, 1, 1,
0.3137949, -0.8300412, 3.347828, 0, 0.2784314, 1, 1,
0.3206236, -0.1533271, 4.55279, 0, 0.2745098, 1, 1,
0.324005, 0.261935, 2.456379, 0, 0.2666667, 1, 1,
0.3240937, 0.1228647, -0.2711099, 0, 0.2627451, 1, 1,
0.324269, 2.12891, -0.6298964, 0, 0.254902, 1, 1,
0.3265763, 1.074274, 0.6860953, 0, 0.2509804, 1, 1,
0.3290658, -1.408561, 2.534505, 0, 0.2431373, 1, 1,
0.3305952, -2.247643, 3.570979, 0, 0.2392157, 1, 1,
0.330718, 0.1740247, 1.187937, 0, 0.2313726, 1, 1,
0.3343492, 0.386636, 1.498665, 0, 0.227451, 1, 1,
0.3359685, -1.548365, 4.832022, 0, 0.2196078, 1, 1,
0.3389338, 2.931324, -0.7645881, 0, 0.2156863, 1, 1,
0.3411716, 0.2810313, 2.666676, 0, 0.2078431, 1, 1,
0.3414691, -1.754623, 1.837393, 0, 0.2039216, 1, 1,
0.3420113, 0.339036, 2.453254, 0, 0.1960784, 1, 1,
0.3485478, -0.2417681, 2.032215, 0, 0.1882353, 1, 1,
0.3487511, 1.307908, 0.5104145, 0, 0.1843137, 1, 1,
0.3499825, -1.035229, 3.851237, 0, 0.1764706, 1, 1,
0.35234, -0.4186564, 1.884853, 0, 0.172549, 1, 1,
0.3554793, -0.04497228, 0.7130354, 0, 0.1647059, 1, 1,
0.3570419, 0.1275935, 3.336533, 0, 0.1607843, 1, 1,
0.3580857, -2.233886, 2.903755, 0, 0.1529412, 1, 1,
0.3590439, 0.9583526, 0.2991699, 0, 0.1490196, 1, 1,
0.3643873, 2.446244, -0.5849758, 0, 0.1411765, 1, 1,
0.3664405, -0.4632011, 1.956859, 0, 0.1372549, 1, 1,
0.3692868, -1.486969, 2.50971, 0, 0.1294118, 1, 1,
0.3723882, -1.186588, 2.58846, 0, 0.1254902, 1, 1,
0.3748799, -0.5557016, 2.098192, 0, 0.1176471, 1, 1,
0.3778379, 0.8041701, 0.7964709, 0, 0.1137255, 1, 1,
0.3790067, 1.737703, 2.179248, 0, 0.1058824, 1, 1,
0.3793383, -0.6136875, 3.549131, 0, 0.09803922, 1, 1,
0.3794158, -0.1694057, 2.871015, 0, 0.09411765, 1, 1,
0.3802621, 0.5151602, 0.2165307, 0, 0.08627451, 1, 1,
0.3843027, -0.1477354, 3.417341, 0, 0.08235294, 1, 1,
0.3872818, -1.265355, 3.271135, 0, 0.07450981, 1, 1,
0.3939507, 2.052921, -1.285486, 0, 0.07058824, 1, 1,
0.3948281, -0.4788031, 2.956279, 0, 0.0627451, 1, 1,
0.3994277, -0.7226622, 1.106657, 0, 0.05882353, 1, 1,
0.4004086, 0.01957828, 2.379256, 0, 0.05098039, 1, 1,
0.4016849, -0.08417092, 1.606433, 0, 0.04705882, 1, 1,
0.4027683, -0.7560933, 2.748329, 0, 0.03921569, 1, 1,
0.4039159, 1.252254, 1.965067, 0, 0.03529412, 1, 1,
0.408121, 0.07790449, 1.732445, 0, 0.02745098, 1, 1,
0.4104078, -0.2498435, 2.461797, 0, 0.02352941, 1, 1,
0.4114614, -0.1560174, 2.04436, 0, 0.01568628, 1, 1,
0.4203334, -0.4326767, 2.502206, 0, 0.01176471, 1, 1,
0.4231729, -0.7640153, 2.696184, 0, 0.003921569, 1, 1,
0.4238494, -1.044883, 0.9353541, 0.003921569, 0, 1, 1,
0.425729, 1.151887, 0.321236, 0.007843138, 0, 1, 1,
0.4333003, -0.5185074, 1.780687, 0.01568628, 0, 1, 1,
0.4409177, -0.7411321, 3.273061, 0.01960784, 0, 1, 1,
0.4420103, -0.545615, 2.306534, 0.02745098, 0, 1, 1,
0.4425252, 0.09364551, 2.473727, 0.03137255, 0, 1, 1,
0.4472288, -1.393763, 3.396225, 0.03921569, 0, 1, 1,
0.448526, 0.6054336, -0.07364438, 0.04313726, 0, 1, 1,
0.4542816, -0.03724734, 0.790751, 0.05098039, 0, 1, 1,
0.4558148, 0.01565554, 3.910525, 0.05490196, 0, 1, 1,
0.4569445, -0.2278572, 2.572596, 0.0627451, 0, 1, 1,
0.4582085, -0.7700822, 2.170873, 0.06666667, 0, 1, 1,
0.4605826, -0.6475549, 2.970967, 0.07450981, 0, 1, 1,
0.4629354, -0.7204958, 3.490439, 0.07843138, 0, 1, 1,
0.4658968, 1.24957, 1.389515, 0.08627451, 0, 1, 1,
0.4663019, 0.7078414, 1.903001, 0.09019608, 0, 1, 1,
0.4723046, 1.536789, 0.3334827, 0.09803922, 0, 1, 1,
0.4730446, -0.3363435, 2.532207, 0.1058824, 0, 1, 1,
0.4768662, -0.9021245, 2.624485, 0.1098039, 0, 1, 1,
0.477708, -1.975963, 2.748273, 0.1176471, 0, 1, 1,
0.4792685, -2.05483, 3.600695, 0.1215686, 0, 1, 1,
0.4809231, -0.6195935, 1.307032, 0.1294118, 0, 1, 1,
0.4880157, -0.8421051, 2.914543, 0.1333333, 0, 1, 1,
0.4920174, -0.2507454, 2.511365, 0.1411765, 0, 1, 1,
0.495263, 0.3764827, 1.406332, 0.145098, 0, 1, 1,
0.4953354, 0.8487239, 0.2366471, 0.1529412, 0, 1, 1,
0.4965296, 1.523668, 1.398286, 0.1568628, 0, 1, 1,
0.5003251, -0.1218228, 2.041112, 0.1647059, 0, 1, 1,
0.5016013, 0.2747282, 0.7826496, 0.1686275, 0, 1, 1,
0.5016768, 0.5506203, 1.564766, 0.1764706, 0, 1, 1,
0.5116333, 1.572719, 0.1483376, 0.1803922, 0, 1, 1,
0.5117252, -0.2447185, 2.258146, 0.1882353, 0, 1, 1,
0.5159405, -1.621215, 3.400865, 0.1921569, 0, 1, 1,
0.5161451, -0.6438956, 1.703091, 0.2, 0, 1, 1,
0.5209327, -0.006000158, 1.926226, 0.2078431, 0, 1, 1,
0.5210276, -0.947213, 1.913765, 0.2117647, 0, 1, 1,
0.5239745, 1.286414, -0.03575002, 0.2196078, 0, 1, 1,
0.5283659, -0.5271128, 1.991494, 0.2235294, 0, 1, 1,
0.5291389, 0.06012671, 0.9172782, 0.2313726, 0, 1, 1,
0.5395127, -0.2042146, 0.3444026, 0.2352941, 0, 1, 1,
0.5396431, 0.6232932, 0.7842454, 0.2431373, 0, 1, 1,
0.5409163, 0.2469786, 1.538489, 0.2470588, 0, 1, 1,
0.5453848, 1.100224, 0.3936855, 0.254902, 0, 1, 1,
0.5454993, -0.005990647, 2.72406, 0.2588235, 0, 1, 1,
0.5506136, -2.26846, 1.922561, 0.2666667, 0, 1, 1,
0.5534742, -2.022868, 3.125082, 0.2705882, 0, 1, 1,
0.5547058, 0.3134167, 1.425327, 0.2784314, 0, 1, 1,
0.5590836, 1.028609, 1.048862, 0.282353, 0, 1, 1,
0.5656165, -1.261796, 3.188283, 0.2901961, 0, 1, 1,
0.5663939, -0.6662963, 2.14913, 0.2941177, 0, 1, 1,
0.5676455, 0.7828864, 1.838261, 0.3019608, 0, 1, 1,
0.5701278, 0.2579672, 2.258976, 0.3098039, 0, 1, 1,
0.5709465, -0.5209511, 2.661622, 0.3137255, 0, 1, 1,
0.5715551, -1.092398, 2.71228, 0.3215686, 0, 1, 1,
0.5811797, -0.6647508, 1.571095, 0.3254902, 0, 1, 1,
0.5826624, 0.6268823, 0.939088, 0.3333333, 0, 1, 1,
0.5827712, 0.1802938, 0.8177633, 0.3372549, 0, 1, 1,
0.5848571, -2.622587, 0.8452442, 0.345098, 0, 1, 1,
0.5851917, 0.3906204, -0.9698173, 0.3490196, 0, 1, 1,
0.5879418, -0.08793198, 1.695799, 0.3568628, 0, 1, 1,
0.5902968, 0.2678916, 0.7497298, 0.3607843, 0, 1, 1,
0.5912716, 0.9538704, -0.9302906, 0.3686275, 0, 1, 1,
0.592496, 0.06216757, -0.1934957, 0.372549, 0, 1, 1,
0.5935926, 0.8089321, 1.709435, 0.3803922, 0, 1, 1,
0.6089253, -1.263726, 0.5296459, 0.3843137, 0, 1, 1,
0.6103363, 0.7624777, 1.277987, 0.3921569, 0, 1, 1,
0.6139719, 0.8303487, 1.390568, 0.3960784, 0, 1, 1,
0.6216443, 0.2189477, 1.16542, 0.4039216, 0, 1, 1,
0.6242639, -0.8798692, 3.303176, 0.4117647, 0, 1, 1,
0.6278654, 0.06255005, 1.232039, 0.4156863, 0, 1, 1,
0.6325006, -0.1263698, 2.466861, 0.4235294, 0, 1, 1,
0.6331173, 0.3125764, 0.2843627, 0.427451, 0, 1, 1,
0.638975, 0.3137316, 1.101997, 0.4352941, 0, 1, 1,
0.6457985, -0.8273354, 1.897646, 0.4392157, 0, 1, 1,
0.6494461, -0.7438492, 1.416985, 0.4470588, 0, 1, 1,
0.6560816, -0.1814384, 2.20801, 0.4509804, 0, 1, 1,
0.656339, 1.128981, -0.3727774, 0.4588235, 0, 1, 1,
0.6566656, 0.7467448, 3.288076, 0.4627451, 0, 1, 1,
0.6576723, -1.253282, 2.390309, 0.4705882, 0, 1, 1,
0.6601583, 0.2913581, 1.299661, 0.4745098, 0, 1, 1,
0.6613765, -0.301078, 0.6560377, 0.4823529, 0, 1, 1,
0.6616006, 0.5587444, 0.3296547, 0.4862745, 0, 1, 1,
0.6621135, 0.6860889, 0.85654, 0.4941176, 0, 1, 1,
0.6664981, -1.020101, 2.496217, 0.5019608, 0, 1, 1,
0.6682237, -2.022012, 1.263767, 0.5058824, 0, 1, 1,
0.6702991, -1.178989, 1.873916, 0.5137255, 0, 1, 1,
0.6717476, -0.7238697, 0.6469158, 0.5176471, 0, 1, 1,
0.6733358, 1.27138, 0.1776019, 0.5254902, 0, 1, 1,
0.6739286, -2.078722, 2.627233, 0.5294118, 0, 1, 1,
0.6767767, -2.111861, 2.498814, 0.5372549, 0, 1, 1,
0.6811538, 0.7758762, 1.034319, 0.5411765, 0, 1, 1,
0.6908079, 0.8457527, 0.8993188, 0.5490196, 0, 1, 1,
0.6928676, 2.070468, 0.8805066, 0.5529412, 0, 1, 1,
0.6969345, 0.1283195, 1.439397, 0.5607843, 0, 1, 1,
0.697692, -0.5594835, 2.662728, 0.5647059, 0, 1, 1,
0.7026546, 1.286256, -2.509324, 0.572549, 0, 1, 1,
0.7028918, -0.4442953, 1.583096, 0.5764706, 0, 1, 1,
0.7041544, -0.5836735, 3.103688, 0.5843138, 0, 1, 1,
0.7052121, -0.07670221, 0.5054955, 0.5882353, 0, 1, 1,
0.7076089, 0.1615545, 0.9435369, 0.5960785, 0, 1, 1,
0.7179328, 0.6103877, 0.0650861, 0.6039216, 0, 1, 1,
0.734154, 0.2273719, 0.3138887, 0.6078432, 0, 1, 1,
0.7349805, 1.026864, 0.7424434, 0.6156863, 0, 1, 1,
0.7402138, -1.534543, 3.169728, 0.6196079, 0, 1, 1,
0.7454572, 0.5144728, -1.249885, 0.627451, 0, 1, 1,
0.7510333, 0.5487729, -0.1012325, 0.6313726, 0, 1, 1,
0.7511696, 0.9104983, 1.60953, 0.6392157, 0, 1, 1,
0.759207, -0.2940746, 2.01067, 0.6431373, 0, 1, 1,
0.7604976, -0.09654877, 2.192927, 0.6509804, 0, 1, 1,
0.7693621, 1.585585, 1.962574, 0.654902, 0, 1, 1,
0.7731431, -0.875378, 4.172252, 0.6627451, 0, 1, 1,
0.7791755, 1.948689, -1.09181, 0.6666667, 0, 1, 1,
0.7794414, -2.063529, 4.960899, 0.6745098, 0, 1, 1,
0.7849625, 0.9330423, -0.08728957, 0.6784314, 0, 1, 1,
0.7876732, 0.1656293, 0.8780209, 0.6862745, 0, 1, 1,
0.7907731, -1.150942, 2.776423, 0.6901961, 0, 1, 1,
0.7995375, -0.09395957, 1.532071, 0.6980392, 0, 1, 1,
0.8018976, -0.9900171, 1.718479, 0.7058824, 0, 1, 1,
0.8022011, -0.8555051, 2.070925, 0.7098039, 0, 1, 1,
0.8031576, 0.3850588, 0.6771289, 0.7176471, 0, 1, 1,
0.8037428, -1.00053, 0.8062431, 0.7215686, 0, 1, 1,
0.8085195, -0.5042605, 1.011924, 0.7294118, 0, 1, 1,
0.8151248, 0.7720958, 0.8916618, 0.7333333, 0, 1, 1,
0.8172664, 0.5197291, 1.145397, 0.7411765, 0, 1, 1,
0.8243687, 0.05982461, 1.257516, 0.7450981, 0, 1, 1,
0.828457, 1.762689, 0.7033951, 0.7529412, 0, 1, 1,
0.8291106, 0.8457897, 2.345301, 0.7568628, 0, 1, 1,
0.8312216, 0.8414068, -0.1993912, 0.7647059, 0, 1, 1,
0.8315978, 0.3128969, 1.51673, 0.7686275, 0, 1, 1,
0.8326405, -0.5747934, 0.3062452, 0.7764706, 0, 1, 1,
0.8345292, 1.04792, -0.9087756, 0.7803922, 0, 1, 1,
0.834739, -0.4037098, 3.607348, 0.7882353, 0, 1, 1,
0.8390558, -0.5096727, 2.223794, 0.7921569, 0, 1, 1,
0.8406892, 0.8205428, -1.068581, 0.8, 0, 1, 1,
0.845165, -0.7603193, 2.76533, 0.8078431, 0, 1, 1,
0.8520939, -1.773823, 0.9271461, 0.8117647, 0, 1, 1,
0.8551263, -0.332295, 2.800061, 0.8196079, 0, 1, 1,
0.8562455, -0.5753815, 0.9946434, 0.8235294, 0, 1, 1,
0.867485, 0.9207311, -0.0828997, 0.8313726, 0, 1, 1,
0.8677036, 0.5520058, 2.691553, 0.8352941, 0, 1, 1,
0.8719483, 0.1444991, 0.3458416, 0.8431373, 0, 1, 1,
0.8752786, 0.08088919, 1.069503, 0.8470588, 0, 1, 1,
0.8758675, 0.2207122, 0.176869, 0.854902, 0, 1, 1,
0.8773223, -2.801848, 2.422489, 0.8588235, 0, 1, 1,
0.8880114, -0.2187911, 3.576529, 0.8666667, 0, 1, 1,
0.9024637, 0.6958718, 0.4661357, 0.8705882, 0, 1, 1,
0.9075536, 0.2042666, 0.1853886, 0.8784314, 0, 1, 1,
0.9094523, 1.611681, 0.8401964, 0.8823529, 0, 1, 1,
0.9120572, 0.96998, 1.352747, 0.8901961, 0, 1, 1,
0.9136313, -2.597058, 3.099594, 0.8941177, 0, 1, 1,
0.9188746, -1.431409, 3.511356, 0.9019608, 0, 1, 1,
0.9228346, 0.9162325, 0.6719999, 0.9098039, 0, 1, 1,
0.9312847, -1.268873, 2.603457, 0.9137255, 0, 1, 1,
0.9318194, 0.4465588, 1.424917, 0.9215686, 0, 1, 1,
0.9348118, -0.6008716, 1.681594, 0.9254902, 0, 1, 1,
0.9366509, 0.1578466, 1.60542, 0.9333333, 0, 1, 1,
0.9384269, 0.3592597, 0.1691151, 0.9372549, 0, 1, 1,
0.9388051, 0.9135404, 0.03428979, 0.945098, 0, 1, 1,
0.9399297, 0.4414441, 1.099467, 0.9490196, 0, 1, 1,
0.9414827, -0.3317519, 2.320607, 0.9568627, 0, 1, 1,
0.941538, 0.8000924, 0.5957487, 0.9607843, 0, 1, 1,
0.9449736, 1.101081, 0.4097403, 0.9686275, 0, 1, 1,
0.945714, -1.921014, 3.908304, 0.972549, 0, 1, 1,
0.9557633, -0.191104, 2.923111, 0.9803922, 0, 1, 1,
0.957028, -0.5825723, 1.088491, 0.9843137, 0, 1, 1,
0.9597358, 1.689776, -1.067683, 0.9921569, 0, 1, 1,
0.9610378, -0.1984908, 2.27543, 0.9960784, 0, 1, 1,
0.9614128, -0.8321747, 1.742618, 1, 0, 0.9960784, 1,
0.9691315, 0.531504, 0.0084658, 1, 0, 0.9882353, 1,
0.9695897, 0.3327292, 2.60797, 1, 0, 0.9843137, 1,
0.9696479, -0.05602312, 0.4413888, 1, 0, 0.9764706, 1,
0.9722841, 0.2394585, 1.363037, 1, 0, 0.972549, 1,
0.9749615, 0.1121161, 2.663986, 1, 0, 0.9647059, 1,
0.9893016, -1.209756, 3.469122, 1, 0, 0.9607843, 1,
1.000803, 0.04282394, -0.2903471, 1, 0, 0.9529412, 1,
1.015845, 0.01673471, 2.629529, 1, 0, 0.9490196, 1,
1.018069, 0.2269353, 4.297774, 1, 0, 0.9411765, 1,
1.024917, 0.586107, 2.963293, 1, 0, 0.9372549, 1,
1.025589, -0.7732554, 2.287532, 1, 0, 0.9294118, 1,
1.028514, 0.7690743, -0.5655318, 1, 0, 0.9254902, 1,
1.032739, -0.9210485, 2.202649, 1, 0, 0.9176471, 1,
1.032943, 0.6068566, 0.366229, 1, 0, 0.9137255, 1,
1.037791, -0.8457794, 2.808214, 1, 0, 0.9058824, 1,
1.04226, 0.6312401, 0.5575597, 1, 0, 0.9019608, 1,
1.048974, -0.1424549, 2.51177, 1, 0, 0.8941177, 1,
1.056176, 1.181835, 0.3470365, 1, 0, 0.8862745, 1,
1.063518, -0.3573545, 1.682856, 1, 0, 0.8823529, 1,
1.066332, 1.03883, 1.903891, 1, 0, 0.8745098, 1,
1.084898, 1.254116, 0.6335141, 1, 0, 0.8705882, 1,
1.087234, -0.3055004, 2.277252, 1, 0, 0.8627451, 1,
1.09396, -0.5770585, 1.37146, 1, 0, 0.8588235, 1,
1.095546, 1.588807, 1.238178, 1, 0, 0.8509804, 1,
1.100035, -0.3382393, 3.322174, 1, 0, 0.8470588, 1,
1.100972, 0.148571, 1.436561, 1, 0, 0.8392157, 1,
1.105672, 0.782061, -0.2489887, 1, 0, 0.8352941, 1,
1.109655, -0.2727804, 1.993481, 1, 0, 0.827451, 1,
1.1179, -1.11853, 0.3123678, 1, 0, 0.8235294, 1,
1.129175, 0.06509372, 2.102112, 1, 0, 0.8156863, 1,
1.143432, 1.212392, 1.174716, 1, 0, 0.8117647, 1,
1.145466, -2.396209, 3.451617, 1, 0, 0.8039216, 1,
1.148586, 1.600382, 0.3896053, 1, 0, 0.7960784, 1,
1.150647, -0.5824506, 1.304447, 1, 0, 0.7921569, 1,
1.151371, -0.3452502, 1.889271, 1, 0, 0.7843137, 1,
1.160965, -2.059377, 1.195203, 1, 0, 0.7803922, 1,
1.166357, 0.2734477, 2.483364, 1, 0, 0.772549, 1,
1.167231, -1.186472, 2.03438, 1, 0, 0.7686275, 1,
1.171451, -0.71164, 3.343973, 1, 0, 0.7607843, 1,
1.179408, 1.339853, 0.5706046, 1, 0, 0.7568628, 1,
1.18194, 0.6212384, 1.345588, 1, 0, 0.7490196, 1,
1.182809, -1.247439, 1.43734, 1, 0, 0.7450981, 1,
1.192144, 1.198707, 0.9171849, 1, 0, 0.7372549, 1,
1.204463, 1.754302, -0.8029684, 1, 0, 0.7333333, 1,
1.221615, 1.352932, 1.146371, 1, 0, 0.7254902, 1,
1.223999, 0.6532873, 1.311082, 1, 0, 0.7215686, 1,
1.228401, -0.2621449, 2.131493, 1, 0, 0.7137255, 1,
1.233352, 0.4181589, 0.5674021, 1, 0, 0.7098039, 1,
1.23614, -3.377108, 1.272733, 1, 0, 0.7019608, 1,
1.236649, -1.672527, 2.314867, 1, 0, 0.6941177, 1,
1.237485, -1.078472, 1.360659, 1, 0, 0.6901961, 1,
1.238293, 1.764359, -0.168559, 1, 0, 0.682353, 1,
1.240376, 0.3774362, -0.09003834, 1, 0, 0.6784314, 1,
1.240767, -0.3549147, 0.3591954, 1, 0, 0.6705883, 1,
1.241443, 1.434806, 1.261462, 1, 0, 0.6666667, 1,
1.255216, -0.4998687, 1.94451, 1, 0, 0.6588235, 1,
1.264107, 0.4596679, 0.8638507, 1, 0, 0.654902, 1,
1.26963, -0.7582504, 3.868025, 1, 0, 0.6470588, 1,
1.274284, 0.9819335, 0.6660933, 1, 0, 0.6431373, 1,
1.286371, -0.03197983, 0.8557562, 1, 0, 0.6352941, 1,
1.313112, -0.639677, 1.682813, 1, 0, 0.6313726, 1,
1.314379, 0.2791719, 2.3404, 1, 0, 0.6235294, 1,
1.3151, 0.7581272, 1.842442, 1, 0, 0.6196079, 1,
1.316087, -0.9070578, 3.697537, 1, 0, 0.6117647, 1,
1.316921, 0.6901177, 0.8641446, 1, 0, 0.6078432, 1,
1.328487, -1.505989, 2.862653, 1, 0, 0.6, 1,
1.329979, 0.04275468, 0.5510788, 1, 0, 0.5921569, 1,
1.344918, 1.575722, 2.667408, 1, 0, 0.5882353, 1,
1.350246, 0.0286253, 0.2619339, 1, 0, 0.5803922, 1,
1.35398, 1.871457, 1.431311, 1, 0, 0.5764706, 1,
1.357371, -1.971859, 2.378371, 1, 0, 0.5686275, 1,
1.362991, 0.9750798, 1.984298, 1, 0, 0.5647059, 1,
1.365544, -1.637902, 1.073636, 1, 0, 0.5568628, 1,
1.377533, 0.3903737, 1.124553, 1, 0, 0.5529412, 1,
1.379503, -1.942521, 2.465235, 1, 0, 0.5450981, 1,
1.386148, -0.430861, 1.466016, 1, 0, 0.5411765, 1,
1.386951, 1.005326, 0.4708115, 1, 0, 0.5333334, 1,
1.388947, 0.8457272, -0.69429, 1, 0, 0.5294118, 1,
1.389606, -0.955155, 3.630277, 1, 0, 0.5215687, 1,
1.395054, 2.501043, 0.4136639, 1, 0, 0.5176471, 1,
1.397404, -0.671529, 3.096469, 1, 0, 0.509804, 1,
1.398997, -0.2426641, -0.6696717, 1, 0, 0.5058824, 1,
1.399787, -0.2159609, 3.751977, 1, 0, 0.4980392, 1,
1.406871, 1.092059, 0.4551732, 1, 0, 0.4901961, 1,
1.427172, -0.02836488, 0.7598047, 1, 0, 0.4862745, 1,
1.428726, 0.6843929, 1.491258, 1, 0, 0.4784314, 1,
1.429556, -0.6163138, 0.8436724, 1, 0, 0.4745098, 1,
1.433699, -0.1441443, 2.369976, 1, 0, 0.4666667, 1,
1.442989, -1.272178, 3.265238, 1, 0, 0.4627451, 1,
1.44702, 1.029987, 0.6869477, 1, 0, 0.454902, 1,
1.448109, 0.2804469, 1.92119, 1, 0, 0.4509804, 1,
1.449663, -2.12304, 3.151673, 1, 0, 0.4431373, 1,
1.450022, -0.6162753, 1.713873, 1, 0, 0.4392157, 1,
1.454055, 0.7185206, 0.329162, 1, 0, 0.4313726, 1,
1.463236, -1.083775, 1.357136, 1, 0, 0.427451, 1,
1.471844, 0.4591489, 1.419841, 1, 0, 0.4196078, 1,
1.47594, 0.7044041, 0.1444931, 1, 0, 0.4156863, 1,
1.484274, 0.9490431, 2.012518, 1, 0, 0.4078431, 1,
1.487287, 0.1443267, 1.190512, 1, 0, 0.4039216, 1,
1.506192, 1.591355, 0.003027594, 1, 0, 0.3960784, 1,
1.509381, -0.4284667, 1.686636, 1, 0, 0.3882353, 1,
1.511303, 1.189318, -0.417922, 1, 0, 0.3843137, 1,
1.511472, -0.07891824, 2.483272, 1, 0, 0.3764706, 1,
1.517969, 1.431679, 1.099281, 1, 0, 0.372549, 1,
1.519937, -0.1423149, 2.328015, 1, 0, 0.3647059, 1,
1.540573, -1.665, 1.038493, 1, 0, 0.3607843, 1,
1.544829, -0.6855794, 2.191034, 1, 0, 0.3529412, 1,
1.552478, -0.3366749, 2.630459, 1, 0, 0.3490196, 1,
1.561339, -0.07366209, 3.537051, 1, 0, 0.3411765, 1,
1.564535, -0.9879968, 1.504201, 1, 0, 0.3372549, 1,
1.568994, -1.678074, 2.313166, 1, 0, 0.3294118, 1,
1.573984, -0.1931995, 1.575984, 1, 0, 0.3254902, 1,
1.591832, 0.8777307, 0.2592696, 1, 0, 0.3176471, 1,
1.625768, -0.1720849, 1.737827, 1, 0, 0.3137255, 1,
1.627633, -1.727746, 2.922818, 1, 0, 0.3058824, 1,
1.644072, 0.7981205, 0.5515567, 1, 0, 0.2980392, 1,
1.645087, -1.451867, 3.556418, 1, 0, 0.2941177, 1,
1.647004, -0.3629875, 0.3471228, 1, 0, 0.2862745, 1,
1.672472, -1.508021, 4.600731, 1, 0, 0.282353, 1,
1.677399, -0.2671583, 0.8306278, 1, 0, 0.2745098, 1,
1.687117, -0.4063968, 1.111829, 1, 0, 0.2705882, 1,
1.705093, 2.054449, 0.1440084, 1, 0, 0.2627451, 1,
1.70684, -0.1846803, 1.357201, 1, 0, 0.2588235, 1,
1.74531, 0.9197357, 0.7262462, 1, 0, 0.2509804, 1,
1.761523, -0.1501674, 1.573276, 1, 0, 0.2470588, 1,
1.76708, 0.3834713, 0.9708042, 1, 0, 0.2392157, 1,
1.785782, 0.8024314, 1.266261, 1, 0, 0.2352941, 1,
1.793784, -0.6336812, 2.769875, 1, 0, 0.227451, 1,
1.793803, -1.585301, 3.874229, 1, 0, 0.2235294, 1,
1.807042, -1.086649, 0.8076007, 1, 0, 0.2156863, 1,
1.814217, -1.493478, 3.492236, 1, 0, 0.2117647, 1,
1.817779, 0.9474795, -0.5836424, 1, 0, 0.2039216, 1,
1.83321, 0.7695994, 0.4359395, 1, 0, 0.1960784, 1,
1.834315, 0.2146361, 1.905533, 1, 0, 0.1921569, 1,
1.872723, -0.2499454, 1.778826, 1, 0, 0.1843137, 1,
1.883666, 0.750167, 0.8513084, 1, 0, 0.1803922, 1,
1.912657, 0.02278973, 3.09091, 1, 0, 0.172549, 1,
1.933484, 1.182055, 1.091166, 1, 0, 0.1686275, 1,
1.957873, -0.02898356, 2.966006, 1, 0, 0.1607843, 1,
2.019489, 0.3539513, 1.513919, 1, 0, 0.1568628, 1,
2.023087, 0.3949944, 1.327026, 1, 0, 0.1490196, 1,
2.091088, 1.544286, 0.05450347, 1, 0, 0.145098, 1,
2.130735, 1.206255, 0.1996121, 1, 0, 0.1372549, 1,
2.205127, 0.4888144, 2.046844, 1, 0, 0.1333333, 1,
2.207321, 0.3282754, 1.694558, 1, 0, 0.1254902, 1,
2.207351, -0.1112393, 1.290584, 1, 0, 0.1215686, 1,
2.208383, 0.2276946, 1.263483, 1, 0, 0.1137255, 1,
2.215448, -0.828953, 3.082387, 1, 0, 0.1098039, 1,
2.264563, 0.3783181, 1.390393, 1, 0, 0.1019608, 1,
2.301498, 0.01955487, 1.546178, 1, 0, 0.09411765, 1,
2.311041, 0.4779727, 1.844422, 1, 0, 0.09019608, 1,
2.346727, 0.2203238, 1.378432, 1, 0, 0.08235294, 1,
2.352713, 0.133987, 2.160058, 1, 0, 0.07843138, 1,
2.43334, -0.3694149, 1.074202, 1, 0, 0.07058824, 1,
2.484174, -1.185448, 1.925725, 1, 0, 0.06666667, 1,
2.491142, 0.6862595, 2.326747, 1, 0, 0.05882353, 1,
2.496216, 0.1224755, 1.964344, 1, 0, 0.05490196, 1,
2.506341, -0.6144497, 0.5075762, 1, 0, 0.04705882, 1,
2.668751, 0.6081263, 0.8960004, 1, 0, 0.04313726, 1,
2.672038, -0.4980541, 0.7248926, 1, 0, 0.03529412, 1,
2.691496, -0.8441837, 1.560258, 1, 0, 0.03137255, 1,
2.738637, -0.5225908, 3.118991, 1, 0, 0.02352941, 1,
2.873743, -0.1584474, 1.107995, 1, 0, 0.01960784, 1,
2.921469, 0.6924323, 0.0356649, 1, 0, 0.01176471, 1,
3.009233, 1.212387, 0.8387111, 1, 0, 0.007843138, 1
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
-0.08736038, -4.480686, -7.305716, 0, -0.5, 0.5, 0.5,
-0.08736038, -4.480686, -7.305716, 1, -0.5, 0.5, 0.5,
-0.08736038, -4.480686, -7.305716, 1, 1.5, 0.5, 0.5,
-0.08736038, -4.480686, -7.305716, 0, 1.5, 0.5, 0.5
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
-4.233699, -0.1217152, -7.305716, 0, -0.5, 0.5, 0.5,
-4.233699, -0.1217152, -7.305716, 1, -0.5, 0.5, 0.5,
-4.233699, -0.1217152, -7.305716, 1, 1.5, 0.5, 0.5,
-4.233699, -0.1217152, -7.305716, 0, 1.5, 0.5, 0.5
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
-4.233699, -4.480686, -0.2420633, 0, -0.5, 0.5, 0.5,
-4.233699, -4.480686, -0.2420633, 1, -0.5, 0.5, 0.5,
-4.233699, -4.480686, -0.2420633, 1, 1.5, 0.5, 0.5,
-4.233699, -4.480686, -0.2420633, 0, 1.5, 0.5, 0.5
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
-3, -3.47477, -5.675642,
3, -3.47477, -5.675642,
-3, -3.47477, -5.675642,
-3, -3.642422, -5.947321,
-2, -3.47477, -5.675642,
-2, -3.642422, -5.947321,
-1, -3.47477, -5.675642,
-1, -3.642422, -5.947321,
0, -3.47477, -5.675642,
0, -3.642422, -5.947321,
1, -3.47477, -5.675642,
1, -3.642422, -5.947321,
2, -3.47477, -5.675642,
2, -3.642422, -5.947321,
3, -3.47477, -5.675642,
3, -3.642422, -5.947321
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
-3, -3.977728, -6.490679, 0, -0.5, 0.5, 0.5,
-3, -3.977728, -6.490679, 1, -0.5, 0.5, 0.5,
-3, -3.977728, -6.490679, 1, 1.5, 0.5, 0.5,
-3, -3.977728, -6.490679, 0, 1.5, 0.5, 0.5,
-2, -3.977728, -6.490679, 0, -0.5, 0.5, 0.5,
-2, -3.977728, -6.490679, 1, -0.5, 0.5, 0.5,
-2, -3.977728, -6.490679, 1, 1.5, 0.5, 0.5,
-2, -3.977728, -6.490679, 0, 1.5, 0.5, 0.5,
-1, -3.977728, -6.490679, 0, -0.5, 0.5, 0.5,
-1, -3.977728, -6.490679, 1, -0.5, 0.5, 0.5,
-1, -3.977728, -6.490679, 1, 1.5, 0.5, 0.5,
-1, -3.977728, -6.490679, 0, 1.5, 0.5, 0.5,
0, -3.977728, -6.490679, 0, -0.5, 0.5, 0.5,
0, -3.977728, -6.490679, 1, -0.5, 0.5, 0.5,
0, -3.977728, -6.490679, 1, 1.5, 0.5, 0.5,
0, -3.977728, -6.490679, 0, 1.5, 0.5, 0.5,
1, -3.977728, -6.490679, 0, -0.5, 0.5, 0.5,
1, -3.977728, -6.490679, 1, -0.5, 0.5, 0.5,
1, -3.977728, -6.490679, 1, 1.5, 0.5, 0.5,
1, -3.977728, -6.490679, 0, 1.5, 0.5, 0.5,
2, -3.977728, -6.490679, 0, -0.5, 0.5, 0.5,
2, -3.977728, -6.490679, 1, -0.5, 0.5, 0.5,
2, -3.977728, -6.490679, 1, 1.5, 0.5, 0.5,
2, -3.977728, -6.490679, 0, 1.5, 0.5, 0.5,
3, -3.977728, -6.490679, 0, -0.5, 0.5, 0.5,
3, -3.977728, -6.490679, 1, -0.5, 0.5, 0.5,
3, -3.977728, -6.490679, 1, 1.5, 0.5, 0.5,
3, -3.977728, -6.490679, 0, 1.5, 0.5, 0.5
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
-3.276852, -3, -5.675642,
-3.276852, 3, -5.675642,
-3.276852, -3, -5.675642,
-3.436326, -3, -5.947321,
-3.276852, -2, -5.675642,
-3.436326, -2, -5.947321,
-3.276852, -1, -5.675642,
-3.436326, -1, -5.947321,
-3.276852, 0, -5.675642,
-3.436326, 0, -5.947321,
-3.276852, 1, -5.675642,
-3.436326, 1, -5.947321,
-3.276852, 2, -5.675642,
-3.436326, 2, -5.947321,
-3.276852, 3, -5.675642,
-3.436326, 3, -5.947321
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
-3.755275, -3, -6.490679, 0, -0.5, 0.5, 0.5,
-3.755275, -3, -6.490679, 1, -0.5, 0.5, 0.5,
-3.755275, -3, -6.490679, 1, 1.5, 0.5, 0.5,
-3.755275, -3, -6.490679, 0, 1.5, 0.5, 0.5,
-3.755275, -2, -6.490679, 0, -0.5, 0.5, 0.5,
-3.755275, -2, -6.490679, 1, -0.5, 0.5, 0.5,
-3.755275, -2, -6.490679, 1, 1.5, 0.5, 0.5,
-3.755275, -2, -6.490679, 0, 1.5, 0.5, 0.5,
-3.755275, -1, -6.490679, 0, -0.5, 0.5, 0.5,
-3.755275, -1, -6.490679, 1, -0.5, 0.5, 0.5,
-3.755275, -1, -6.490679, 1, 1.5, 0.5, 0.5,
-3.755275, -1, -6.490679, 0, 1.5, 0.5, 0.5,
-3.755275, 0, -6.490679, 0, -0.5, 0.5, 0.5,
-3.755275, 0, -6.490679, 1, -0.5, 0.5, 0.5,
-3.755275, 0, -6.490679, 1, 1.5, 0.5, 0.5,
-3.755275, 0, -6.490679, 0, 1.5, 0.5, 0.5,
-3.755275, 1, -6.490679, 0, -0.5, 0.5, 0.5,
-3.755275, 1, -6.490679, 1, -0.5, 0.5, 0.5,
-3.755275, 1, -6.490679, 1, 1.5, 0.5, 0.5,
-3.755275, 1, -6.490679, 0, 1.5, 0.5, 0.5,
-3.755275, 2, -6.490679, 0, -0.5, 0.5, 0.5,
-3.755275, 2, -6.490679, 1, -0.5, 0.5, 0.5,
-3.755275, 2, -6.490679, 1, 1.5, 0.5, 0.5,
-3.755275, 2, -6.490679, 0, 1.5, 0.5, 0.5,
-3.755275, 3, -6.490679, 0, -0.5, 0.5, 0.5,
-3.755275, 3, -6.490679, 1, -0.5, 0.5, 0.5,
-3.755275, 3, -6.490679, 1, 1.5, 0.5, 0.5,
-3.755275, 3, -6.490679, 0, 1.5, 0.5, 0.5
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
-3.276852, -3.47477, -4,
-3.276852, -3.47477, 4,
-3.276852, -3.47477, -4,
-3.436326, -3.642422, -4,
-3.276852, -3.47477, -2,
-3.436326, -3.642422, -2,
-3.276852, -3.47477, 0,
-3.436326, -3.642422, 0,
-3.276852, -3.47477, 2,
-3.436326, -3.642422, 2,
-3.276852, -3.47477, 4,
-3.436326, -3.642422, 4
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
-3.755275, -3.977728, -4, 0, -0.5, 0.5, 0.5,
-3.755275, -3.977728, -4, 1, -0.5, 0.5, 0.5,
-3.755275, -3.977728, -4, 1, 1.5, 0.5, 0.5,
-3.755275, -3.977728, -4, 0, 1.5, 0.5, 0.5,
-3.755275, -3.977728, -2, 0, -0.5, 0.5, 0.5,
-3.755275, -3.977728, -2, 1, -0.5, 0.5, 0.5,
-3.755275, -3.977728, -2, 1, 1.5, 0.5, 0.5,
-3.755275, -3.977728, -2, 0, 1.5, 0.5, 0.5,
-3.755275, -3.977728, 0, 0, -0.5, 0.5, 0.5,
-3.755275, -3.977728, 0, 1, -0.5, 0.5, 0.5,
-3.755275, -3.977728, 0, 1, 1.5, 0.5, 0.5,
-3.755275, -3.977728, 0, 0, 1.5, 0.5, 0.5,
-3.755275, -3.977728, 2, 0, -0.5, 0.5, 0.5,
-3.755275, -3.977728, 2, 1, -0.5, 0.5, 0.5,
-3.755275, -3.977728, 2, 1, 1.5, 0.5, 0.5,
-3.755275, -3.977728, 2, 0, 1.5, 0.5, 0.5,
-3.755275, -3.977728, 4, 0, -0.5, 0.5, 0.5,
-3.755275, -3.977728, 4, 1, -0.5, 0.5, 0.5,
-3.755275, -3.977728, 4, 1, 1.5, 0.5, 0.5,
-3.755275, -3.977728, 4, 0, 1.5, 0.5, 0.5
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
-3.276852, -3.47477, -5.675642,
-3.276852, 3.231339, -5.675642,
-3.276852, -3.47477, 5.191515,
-3.276852, 3.231339, 5.191515,
-3.276852, -3.47477, -5.675642,
-3.276852, -3.47477, 5.191515,
-3.276852, 3.231339, -5.675642,
-3.276852, 3.231339, 5.191515,
-3.276852, -3.47477, -5.675642,
3.102131, -3.47477, -5.675642,
-3.276852, -3.47477, 5.191515,
3.102131, -3.47477, 5.191515,
-3.276852, 3.231339, -5.675642,
3.102131, 3.231339, -5.675642,
-3.276852, 3.231339, 5.191515,
3.102131, 3.231339, 5.191515,
3.102131, -3.47477, -5.675642,
3.102131, 3.231339, -5.675642,
3.102131, -3.47477, 5.191515,
3.102131, 3.231339, 5.191515,
3.102131, -3.47477, -5.675642,
3.102131, -3.47477, 5.191515,
3.102131, 3.231339, -5.675642,
3.102131, 3.231339, 5.191515
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
var radius = 7.622251;
var distance = 33.91226;
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
mvMatrix.translate( 0.08736038, 0.1217152, 0.2420633 );
mvMatrix.scale( 1.29195, 1.228928, 0.7583701 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.91226);
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
Hexachlorobenzene<-read.table("Hexachlorobenzene.xyz")
```

```
## Error in read.table("Hexachlorobenzene.xyz"): no lines available in input
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
-3.183954, -0.3580405, -2.797677, 0, 0, 1, 1, 1,
-3.033321, 0.5452312, -2.380686, 1, 0, 0, 1, 1,
-3.027779, 0.169374, -2.003838, 1, 0, 0, 1, 1,
-2.601416, 0.1693425, 1.069132, 1, 0, 0, 1, 1,
-2.513938, 0.3482792, -1.353734, 1, 0, 0, 1, 1,
-2.512826, -0.07059725, -2.567757, 1, 0, 0, 1, 1,
-2.437593, -1.163643, -2.44581, 0, 0, 0, 1, 1,
-2.335765, -2.703799, -1.421132, 0, 0, 0, 1, 1,
-2.300674, -0.8801756, -2.52478, 0, 0, 0, 1, 1,
-2.252245, -0.007070047, 0.03519773, 0, 0, 0, 1, 1,
-2.23594, 1.155311, 1.586668, 0, 0, 0, 1, 1,
-2.231201, -1.49851, -2.858917, 0, 0, 0, 1, 1,
-2.215, -0.8058599, -1.75292, 0, 0, 0, 1, 1,
-2.206202, 0.3990782, -2.328916, 1, 1, 1, 1, 1,
-2.165423, -0.06050716, -2.684656, 1, 1, 1, 1, 1,
-2.121588, -0.230184, -0.3225473, 1, 1, 1, 1, 1,
-2.111531, 0.004672068, -1.244261, 1, 1, 1, 1, 1,
-2.11071, 1.172618, -2.807064, 1, 1, 1, 1, 1,
-2.070101, 1.835, -2.007153, 1, 1, 1, 1, 1,
-2.054627, 1.066519, -3.018985, 1, 1, 1, 1, 1,
-2.028941, -0.5404714, -1.86563, 1, 1, 1, 1, 1,
-1.995672, -1.969455, -3.577328, 1, 1, 1, 1, 1,
-1.950353, 0.1848077, -1.454582, 1, 1, 1, 1, 1,
-1.947307, -0.2874614, -0.4439036, 1, 1, 1, 1, 1,
-1.931373, 0.6960818, -0.9546595, 1, 1, 1, 1, 1,
-1.894246, 0.2382413, -0.8132554, 1, 1, 1, 1, 1,
-1.873843, 1.256305, -1.073419, 1, 1, 1, 1, 1,
-1.866742, -1.600836, -2.27304, 1, 1, 1, 1, 1,
-1.850316, 0.1358236, -0.9412481, 0, 0, 1, 1, 1,
-1.836214, -0.3532651, -1.894691, 1, 0, 0, 1, 1,
-1.82753, 0.3553451, -0.8190917, 1, 0, 0, 1, 1,
-1.795529, 1.155813, -0.244625, 1, 0, 0, 1, 1,
-1.77779, 0.001177088, -1.48039, 1, 0, 0, 1, 1,
-1.732655, -0.2704101, -2.131048, 1, 0, 0, 1, 1,
-1.693349, 0.8820958, -0.5740063, 0, 0, 0, 1, 1,
-1.693112, -0.4431877, -1.370898, 0, 0, 0, 1, 1,
-1.675349, 1.42928, 0.5764117, 0, 0, 0, 1, 1,
-1.652605, 0.4480068, -1.238974, 0, 0, 0, 1, 1,
-1.648873, -1.084278, -2.67664, 0, 0, 0, 1, 1,
-1.641221, -3.100994, -2.350939, 0, 0, 0, 1, 1,
-1.629164, -0.1838026, 0.2839142, 0, 0, 0, 1, 1,
-1.627324, -0.9148391, -2.099709, 1, 1, 1, 1, 1,
-1.624993, 0.0849933, 0.2609567, 1, 1, 1, 1, 1,
-1.619376, -2.700145, -3.053038, 1, 1, 1, 1, 1,
-1.617575, 1.06859, -2.531095, 1, 1, 1, 1, 1,
-1.590404, 1.190702, -1.763134, 1, 1, 1, 1, 1,
-1.584974, 0.2149248, -2.386912, 1, 1, 1, 1, 1,
-1.581615, 0.3912226, -1.732882, 1, 1, 1, 1, 1,
-1.551496, -0.3037056, -2.475163, 1, 1, 1, 1, 1,
-1.539624, 0.6642077, -0.3817444, 1, 1, 1, 1, 1,
-1.5235, 0.8359281, -0.2660943, 1, 1, 1, 1, 1,
-1.522011, 0.3435762, -2.16489, 1, 1, 1, 1, 1,
-1.514355, -0.5118678, -0.4208926, 1, 1, 1, 1, 1,
-1.513691, -0.2074185, -1.087741, 1, 1, 1, 1, 1,
-1.50746, -2.084352, -3.619952, 1, 1, 1, 1, 1,
-1.506273, 1.202931, -1.77665, 1, 1, 1, 1, 1,
-1.499883, 0.754454, -0.7251379, 0, 0, 1, 1, 1,
-1.485968, -1.979929, -3.194676, 1, 0, 0, 1, 1,
-1.466177, 0.02669396, -1.364399, 1, 0, 0, 1, 1,
-1.458981, 0.7869304, -0.843483, 1, 0, 0, 1, 1,
-1.457794, 0.7614157, -0.845554, 1, 0, 0, 1, 1,
-1.456006, -1.784769, -3.019801, 1, 0, 0, 1, 1,
-1.442176, -1.831854, -2.253575, 0, 0, 0, 1, 1,
-1.424218, 0.6666517, -1.937969, 0, 0, 0, 1, 1,
-1.418247, -0.5603163, -1.79918, 0, 0, 0, 1, 1,
-1.417906, -0.06654423, -3.199679, 0, 0, 0, 1, 1,
-1.415942, -2.000455, -2.987524, 0, 0, 0, 1, 1,
-1.404699, 0.7720284, -1.716328, 0, 0, 0, 1, 1,
-1.390783, 1.900053, -2.340937, 0, 0, 0, 1, 1,
-1.390544, 0.8354305, -1.975446, 1, 1, 1, 1, 1,
-1.389731, 0.5673425, -0.3701713, 1, 1, 1, 1, 1,
-1.386405, -0.5888004, -3.231434, 1, 1, 1, 1, 1,
-1.385144, 1.041726, -0.9277477, 1, 1, 1, 1, 1,
-1.376069, -0.04505149, -1.521115, 1, 1, 1, 1, 1,
-1.374366, 0.09150524, -0.590322, 1, 1, 1, 1, 1,
-1.371094, -0.4079427, -3.040813, 1, 1, 1, 1, 1,
-1.368259, -1.886381, -2.080862, 1, 1, 1, 1, 1,
-1.357913, -1.043899, -4.20586, 1, 1, 1, 1, 1,
-1.355412, -1.016566, -1.717454, 1, 1, 1, 1, 1,
-1.352258, 0.01059692, -2.548107, 1, 1, 1, 1, 1,
-1.340638, 0.4869725, -4.053598, 1, 1, 1, 1, 1,
-1.340063, -0.02057386, 0.04076014, 1, 1, 1, 1, 1,
-1.339722, -1.971963, -2.684222, 1, 1, 1, 1, 1,
-1.338692, 1.502397, -1.023853, 1, 1, 1, 1, 1,
-1.335296, 1.777869, -1.900926, 0, 0, 1, 1, 1,
-1.331747, -0.7216768, -1.210123, 1, 0, 0, 1, 1,
-1.327621, -1.038599, -2.115557, 1, 0, 0, 1, 1,
-1.322215, -1.047632, -2.92817, 1, 0, 0, 1, 1,
-1.31582, -0.5683219, -1.787965, 1, 0, 0, 1, 1,
-1.308547, 0.4372175, -0.5028057, 1, 0, 0, 1, 1,
-1.3036, -2.367203, -3.266235, 0, 0, 0, 1, 1,
-1.29356, -0.1262413, -3.270739, 0, 0, 0, 1, 1,
-1.271528, 0.1306799, -0.6435754, 0, 0, 0, 1, 1,
-1.271182, -1.022255, -4.80355, 0, 0, 0, 1, 1,
-1.252849, -0.4611759, -3.62273, 0, 0, 0, 1, 1,
-1.245849, -0.2982089, -0.5642316, 0, 0, 0, 1, 1,
-1.245081, 0.1632065, -3.607284, 0, 0, 0, 1, 1,
-1.227866, -0.7394755, -2.335949, 1, 1, 1, 1, 1,
-1.226852, -0.7291917, -2.97187, 1, 1, 1, 1, 1,
-1.222446, -0.5177621, -0.5503178, 1, 1, 1, 1, 1,
-1.218192, -1.008212, -3.003752, 1, 1, 1, 1, 1,
-1.216293, -1.027577, -1.495512, 1, 1, 1, 1, 1,
-1.210133, 1.782152, -0.6030908, 1, 1, 1, 1, 1,
-1.209961, 0.8121041, -1.713553, 1, 1, 1, 1, 1,
-1.176579, 0.3465483, -1.208173, 1, 1, 1, 1, 1,
-1.172016, 0.90298, 0.2596117, 1, 1, 1, 1, 1,
-1.170712, -1.358176, -2.320145, 1, 1, 1, 1, 1,
-1.160882, 0.3661656, -0.2132219, 1, 1, 1, 1, 1,
-1.159429, -0.1666842, -1.346928, 1, 1, 1, 1, 1,
-1.156296, -0.8619046, -1.883372, 1, 1, 1, 1, 1,
-1.150454, 0.4797524, -1.049885, 1, 1, 1, 1, 1,
-1.145118, -0.5737422, -1.853162, 1, 1, 1, 1, 1,
-1.141212, 0.1216188, -1.573793, 0, 0, 1, 1, 1,
-1.140969, 0.796873, -1.583058, 1, 0, 0, 1, 1,
-1.120292, -0.3361126, -3.428043, 1, 0, 0, 1, 1,
-1.104347, -0.6501895, -1.833933, 1, 0, 0, 1, 1,
-1.102214, -1.102677, -2.051379, 1, 0, 0, 1, 1,
-1.092714, -1.1288, -2.912081, 1, 0, 0, 1, 1,
-1.087378, 0.03701765, -2.612242, 0, 0, 0, 1, 1,
-1.083759, 0.8430181, -1.408034, 0, 0, 0, 1, 1,
-1.082078, -0.635731, -1.891764, 0, 0, 0, 1, 1,
-1.077304, -0.6739664, -3.639805, 0, 0, 0, 1, 1,
-1.073552, -1.17844, -0.9256567, 0, 0, 0, 1, 1,
-1.071917, -0.183839, -1.905941, 0, 0, 0, 1, 1,
-1.069377, -0.1388157, -2.704704, 0, 0, 0, 1, 1,
-1.062686, 0.07375506, -0.4600247, 1, 1, 1, 1, 1,
-1.06154, -0.09043055, -1.36075, 1, 1, 1, 1, 1,
-1.058519, -0.7647856, -2.545518, 1, 1, 1, 1, 1,
-1.051691, -0.6958814, -2.41742, 1, 1, 1, 1, 1,
-1.047634, 0.03247037, -1.119427, 1, 1, 1, 1, 1,
-1.046725, -1.399975, -2.244626, 1, 1, 1, 1, 1,
-1.044246, -0.1610113, -2.420981, 1, 1, 1, 1, 1,
-1.042935, -1.415897, -5.048889, 1, 1, 1, 1, 1,
-1.042217, -2.277686, -3.354535, 1, 1, 1, 1, 1,
-1.037821, 0.9794585, 2.158765, 1, 1, 1, 1, 1,
-1.035172, -0.4719711, -2.332182, 1, 1, 1, 1, 1,
-1.030284, -0.09253256, -2.468174, 1, 1, 1, 1, 1,
-1.026816, 0.5841805, -0.123586, 1, 1, 1, 1, 1,
-1.022736, 1.157714, -0.006354509, 1, 1, 1, 1, 1,
-1.019572, -0.1756144, 0.1270465, 1, 1, 1, 1, 1,
-1.015017, -0.1943217, -3.294329, 0, 0, 1, 1, 1,
-1.012178, 1.060447, -1.272082, 1, 0, 0, 1, 1,
-1.010039, 0.5104786, 0.6622656, 1, 0, 0, 1, 1,
-1.008707, 0.4226064, -1.698782, 1, 0, 0, 1, 1,
-0.9990058, -0.621062, -2.971454, 1, 0, 0, 1, 1,
-0.9957712, 0.05523298, -1.524655, 1, 0, 0, 1, 1,
-0.9948381, 0.2352974, -0.6591486, 0, 0, 0, 1, 1,
-0.9904743, -0.4194373, -3.081718, 0, 0, 0, 1, 1,
-0.9880106, -0.9883552, -1.371599, 0, 0, 0, 1, 1,
-0.9866589, -0.6830181, -0.4992419, 0, 0, 0, 1, 1,
-0.9724612, 1.193378, 0.02248936, 0, 0, 0, 1, 1,
-0.9646446, -1.10412, -2.744096, 0, 0, 0, 1, 1,
-0.9632515, -0.3936784, -3.614, 0, 0, 0, 1, 1,
-0.9612755, 0.7930746, -0.2172726, 1, 1, 1, 1, 1,
-0.9608476, -1.841455, -2.401509, 1, 1, 1, 1, 1,
-0.9566293, -1.225547, -2.435117, 1, 1, 1, 1, 1,
-0.9503459, 0.1450661, 0.9374635, 1, 1, 1, 1, 1,
-0.9496421, 0.2557628, 0.283269, 1, 1, 1, 1, 1,
-0.9466487, 0.2631305, -0.7877644, 1, 1, 1, 1, 1,
-0.9446578, 0.7408653, -0.1991539, 1, 1, 1, 1, 1,
-0.9407129, -0.02529996, -1.003877, 1, 1, 1, 1, 1,
-0.9393393, 0.01737795, -2.664026, 1, 1, 1, 1, 1,
-0.9380935, 0.9607487, -1.01485, 1, 1, 1, 1, 1,
-0.9367603, -0.03964673, -2.647466, 1, 1, 1, 1, 1,
-0.93509, -0.3886461, -0.823167, 1, 1, 1, 1, 1,
-0.9347016, 1.28015, -1.395668, 1, 1, 1, 1, 1,
-0.9328679, -0.7761732, -2.027933, 1, 1, 1, 1, 1,
-0.9295126, -0.4296882, -2.363372, 1, 1, 1, 1, 1,
-0.9286412, 0.999792, -0.4121633, 0, 0, 1, 1, 1,
-0.9190162, -0.05562726, -2.842303, 1, 0, 0, 1, 1,
-0.916257, 2.290534, 0.9607774, 1, 0, 0, 1, 1,
-0.9144266, -0.8085426, -2.192888, 1, 0, 0, 1, 1,
-0.9137531, 0.2570064, -2.462098, 1, 0, 0, 1, 1,
-0.9078607, 0.04930196, -0.7044445, 1, 0, 0, 1, 1,
-0.9075583, -0.8299168, -2.722968, 0, 0, 0, 1, 1,
-0.9030585, 0.01967235, -1.949068, 0, 0, 0, 1, 1,
-0.8908797, -0.9334102, -2.02145, 0, 0, 0, 1, 1,
-0.8883343, 0.09011118, -3.631849, 0, 0, 0, 1, 1,
-0.8846618, -0.5649617, -1.59847, 0, 0, 0, 1, 1,
-0.8799752, -1.217015, -1.65881, 0, 0, 0, 1, 1,
-0.8729913, -0.7751559, -4.238558, 0, 0, 0, 1, 1,
-0.8703775, -1.026482, -3.546449, 1, 1, 1, 1, 1,
-0.8661337, -1.257683, -4.915631, 1, 1, 1, 1, 1,
-0.8634982, -1.833596, -4.113419, 1, 1, 1, 1, 1,
-0.8625154, 0.4178387, -2.640558, 1, 1, 1, 1, 1,
-0.8609486, 0.9714459, -1.418842, 1, 1, 1, 1, 1,
-0.855897, -1.281733, -3.700304, 1, 1, 1, 1, 1,
-0.8545949, -0.06228336, -1.358051, 1, 1, 1, 1, 1,
-0.8495583, -0.4653147, -2.212286, 1, 1, 1, 1, 1,
-0.8474112, -0.1874578, -0.2058911, 1, 1, 1, 1, 1,
-0.846762, 0.6107723, -2.042511, 1, 1, 1, 1, 1,
-0.8426367, -1.163692, -2.938607, 1, 1, 1, 1, 1,
-0.8376833, -0.1526773, -1.889211, 1, 1, 1, 1, 1,
-0.8333953, 0.577484, 0.3055818, 1, 1, 1, 1, 1,
-0.8165284, -0.6620538, -1.318137, 1, 1, 1, 1, 1,
-0.8144811, 0.4281956, -0.946054, 1, 1, 1, 1, 1,
-0.8030836, 1.343774, -1.736023, 0, 0, 1, 1, 1,
-0.7981857, -0.4725132, -2.213554, 1, 0, 0, 1, 1,
-0.7959949, 0.05912452, -1.759525, 1, 0, 0, 1, 1,
-0.7925884, -0.9002579, -1.453895, 1, 0, 0, 1, 1,
-0.7898532, -0.4756004, -1.385229, 1, 0, 0, 1, 1,
-0.7852513, 2.485476, -2.000322, 1, 0, 0, 1, 1,
-0.7801395, -0.1725667, -0.4403307, 0, 0, 0, 1, 1,
-0.778032, -1.341847, -1.628558, 0, 0, 0, 1, 1,
-0.772413, 0.5211747, -1.215377, 0, 0, 0, 1, 1,
-0.7720008, 0.3306546, -2.818575, 0, 0, 0, 1, 1,
-0.7667893, -2.2423, -2.582574, 0, 0, 0, 1, 1,
-0.7648115, -0.5133391, -2.176196, 0, 0, 0, 1, 1,
-0.7637041, -0.5867249, -1.972549, 0, 0, 0, 1, 1,
-0.7575332, 0.4536723, -2.607335, 1, 1, 1, 1, 1,
-0.7518724, 0.237454, -1.298279, 1, 1, 1, 1, 1,
-0.7510568, 0.4412947, -1.743603, 1, 1, 1, 1, 1,
-0.7466869, -0.3678171, -2.913189, 1, 1, 1, 1, 1,
-0.7460948, 0.7815455, -1.882341, 1, 1, 1, 1, 1,
-0.7435647, -1.805796, -3.436285, 1, 1, 1, 1, 1,
-0.7402524, 2.008133, -1.579352, 1, 1, 1, 1, 1,
-0.7328654, -0.149661, -3.417789, 1, 1, 1, 1, 1,
-0.7289925, 0.02598275, -1.36908, 1, 1, 1, 1, 1,
-0.7277349, 1.282449, -1.594626, 1, 1, 1, 1, 1,
-0.7267186, -0.4940073, -1.221751, 1, 1, 1, 1, 1,
-0.7243813, -1.02895, -3.843856, 1, 1, 1, 1, 1,
-0.7230477, 1.405362, -1.500879, 1, 1, 1, 1, 1,
-0.7216694, 1.631294, -1.144089, 1, 1, 1, 1, 1,
-0.7149742, -0.2216282, -1.101703, 1, 1, 1, 1, 1,
-0.7131883, -0.4843333, -1.217138, 0, 0, 1, 1, 1,
-0.7105533, -1.335167, -2.906349, 1, 0, 0, 1, 1,
-0.7066458, 0.7597122, 0.6244786, 1, 0, 0, 1, 1,
-0.7046918, -1.18963, -0.8994874, 1, 0, 0, 1, 1,
-0.6940724, -0.5647296, -1.357772, 1, 0, 0, 1, 1,
-0.6911802, -0.3536154, -1.605571, 1, 0, 0, 1, 1,
-0.6904312, 1.08066, -0.5127335, 0, 0, 0, 1, 1,
-0.6863264, -0.4199678, -3.27655, 0, 0, 0, 1, 1,
-0.6848139, -1.952268, -1.190465, 0, 0, 0, 1, 1,
-0.683294, 0.1835922, -1.657298, 0, 0, 0, 1, 1,
-0.6826069, 1.141696, -0.1345144, 0, 0, 0, 1, 1,
-0.680689, 0.08519746, -4.338413, 0, 0, 0, 1, 1,
-0.6778156, 0.9408381, -0.3946382, 0, 0, 0, 1, 1,
-0.6768556, -1.091077, -1.999059, 1, 1, 1, 1, 1,
-0.6731426, -0.3460084, -2.130719, 1, 1, 1, 1, 1,
-0.672152, 0.5319917, -1.425137, 1, 1, 1, 1, 1,
-0.66824, 1.073147, -0.9036178, 1, 1, 1, 1, 1,
-0.6654782, -0.7744051, -1.901423, 1, 1, 1, 1, 1,
-0.6636914, 2.00086, 0.7539052, 1, 1, 1, 1, 1,
-0.6585326, -0.6206507, -2.29507, 1, 1, 1, 1, 1,
-0.6581809, 1.469547, -0.1269686, 1, 1, 1, 1, 1,
-0.6576253, -1.050445, -3.853901, 1, 1, 1, 1, 1,
-0.6567725, 1.689984, -1.972657, 1, 1, 1, 1, 1,
-0.6556625, -1.067412, -4.306655, 1, 1, 1, 1, 1,
-0.6478345, -1.104845, -3.155124, 1, 1, 1, 1, 1,
-0.6474358, 1.671688, -1.550562, 1, 1, 1, 1, 1,
-0.6410611, -1.414655, -2.757965, 1, 1, 1, 1, 1,
-0.6372961, -1.169162, -2.723797, 1, 1, 1, 1, 1,
-0.6353123, -0.3225698, -1.960294, 0, 0, 1, 1, 1,
-0.6351547, 1.118211, -0.6097305, 1, 0, 0, 1, 1,
-0.633886, 0.4668052, -1.330284, 1, 0, 0, 1, 1,
-0.6287246, -1.581535, -3.399195, 1, 0, 0, 1, 1,
-0.6267527, -0.5562237, -1.643158, 1, 0, 0, 1, 1,
-0.6194785, 0.1175491, -0.9215963, 1, 0, 0, 1, 1,
-0.6167252, 0.8853874, -0.4276414, 0, 0, 0, 1, 1,
-0.6132129, -1.278071, -3.776052, 0, 0, 0, 1, 1,
-0.5940111, -0.1057711, -3.176618, 0, 0, 0, 1, 1,
-0.5918766, 0.5548192, -0.5193806, 0, 0, 0, 1, 1,
-0.588282, 0.2046138, -3.226884, 0, 0, 0, 1, 1,
-0.5880978, -0.4604321, -2.054037, 0, 0, 0, 1, 1,
-0.586675, -0.2922642, -1.498598, 0, 0, 0, 1, 1,
-0.5850801, 0.1786615, -1.004437, 1, 1, 1, 1, 1,
-0.581186, -0.4894999, -2.699036, 1, 1, 1, 1, 1,
-0.5775924, -0.2594974, -0.5788645, 1, 1, 1, 1, 1,
-0.5769638, -0.4584982, -3.113641, 1, 1, 1, 1, 1,
-0.5756999, -0.8874707, -3.834521, 1, 1, 1, 1, 1,
-0.5755427, -0.374218, -3.894318, 1, 1, 1, 1, 1,
-0.5738795, -1.741758, -5.517383, 1, 1, 1, 1, 1,
-0.5726628, -1.675638, -4.297544, 1, 1, 1, 1, 1,
-0.5724258, -0.03015383, 0.2005084, 1, 1, 1, 1, 1,
-0.5678114, -0.1322198, -1.792603, 1, 1, 1, 1, 1,
-0.5661557, -0.5733577, -2.132625, 1, 1, 1, 1, 1,
-0.5658321, -1.134719, -1.491796, 1, 1, 1, 1, 1,
-0.5614986, -1.209571, -1.372329, 1, 1, 1, 1, 1,
-0.5575382, -1.65007, -3.148144, 1, 1, 1, 1, 1,
-0.5559899, 0.1313962, -1.070396, 1, 1, 1, 1, 1,
-0.5530942, 0.5338704, -1.195012, 0, 0, 1, 1, 1,
-0.5503954, 0.286705, -2.048802, 1, 0, 0, 1, 1,
-0.5462799, -1.119921, -3.35496, 1, 0, 0, 1, 1,
-0.5432094, 1.140581, -1.633813, 1, 0, 0, 1, 1,
-0.5403785, -1.502531, -3.251605, 1, 0, 0, 1, 1,
-0.5328628, 0.03720046, -1.411139, 1, 0, 0, 1, 1,
-0.5281649, -1.874905, -2.586437, 0, 0, 0, 1, 1,
-0.526059, -0.5379588, -0.3544245, 0, 0, 0, 1, 1,
-0.5251441, -0.4064867, -3.202093, 0, 0, 0, 1, 1,
-0.5189232, 0.08144367, -0.4471738, 0, 0, 0, 1, 1,
-0.5182464, -1.203596, -2.651873, 0, 0, 0, 1, 1,
-0.5123386, -0.3609309, -3.292521, 0, 0, 0, 1, 1,
-0.5072887, -0.1625177, -1.410758, 0, 0, 0, 1, 1,
-0.5036889, -0.03168387, -1.926369, 1, 1, 1, 1, 1,
-0.4961116, -0.5321674, -1.916829, 1, 1, 1, 1, 1,
-0.4955242, 0.7981147, -0.4095049, 1, 1, 1, 1, 1,
-0.4887658, -1.006009, -3.459609, 1, 1, 1, 1, 1,
-0.4887318, -0.7315931, -2.386774, 1, 1, 1, 1, 1,
-0.4834731, -0.4064916, -1.764187, 1, 1, 1, 1, 1,
-0.4814467, 0.3619339, -1.492688, 1, 1, 1, 1, 1,
-0.479531, 1.343735, -1.500501, 1, 1, 1, 1, 1,
-0.4773934, 0.1142964, -2.133171, 1, 1, 1, 1, 1,
-0.4763123, 0.6023929, -1.004147, 1, 1, 1, 1, 1,
-0.4699426, 0.9164647, -0.6850019, 1, 1, 1, 1, 1,
-0.4676567, -0.1125354, -2.261128, 1, 1, 1, 1, 1,
-0.4570662, -0.9921954, -3.535288, 1, 1, 1, 1, 1,
-0.4537632, -0.5649523, -1.458077, 1, 1, 1, 1, 1,
-0.4534402, 0.6905691, 0.160959, 1, 1, 1, 1, 1,
-0.4524359, 0.4423575, 0.2018457, 0, 0, 1, 1, 1,
-0.4507916, 0.9866931, -2.628827, 1, 0, 0, 1, 1,
-0.4491557, 0.5411156, -0.4184306, 1, 0, 0, 1, 1,
-0.4482507, -0.5460479, -3.055109, 1, 0, 0, 1, 1,
-0.4478591, -2.38151, -2.96231, 1, 0, 0, 1, 1,
-0.442747, 1.21038, -1.467937, 1, 0, 0, 1, 1,
-0.4379255, 0.9276929, -0.6230587, 0, 0, 0, 1, 1,
-0.4360026, 0.1503309, -1.706093, 0, 0, 0, 1, 1,
-0.4358575, -0.5679159, -3.181499, 0, 0, 0, 1, 1,
-0.4356758, 2.374866, 2.280638, 0, 0, 0, 1, 1,
-0.4356664, -1.066774, -1.915534, 0, 0, 0, 1, 1,
-0.4343118, 1.684824, -2.094456, 0, 0, 0, 1, 1,
-0.4330769, -0.6180483, -3.280811, 0, 0, 0, 1, 1,
-0.4326428, 1.066394, -1.377935, 1, 1, 1, 1, 1,
-0.4287946, -0.9497498, -3.017683, 1, 1, 1, 1, 1,
-0.4285874, -0.1436184, -1.573234, 1, 1, 1, 1, 1,
-0.4262842, -1.66937, -1.861657, 1, 1, 1, 1, 1,
-0.424629, 1.568444, 0.2758254, 1, 1, 1, 1, 1,
-0.4243577, -0.9416581, -3.140578, 1, 1, 1, 1, 1,
-0.423846, 0.1743923, 0.2413071, 1, 1, 1, 1, 1,
-0.4191059, 1.62374, 0.2369346, 1, 1, 1, 1, 1,
-0.4182939, -1.247528, -3.293484, 1, 1, 1, 1, 1,
-0.4162907, -0.9290551, -1.97155, 1, 1, 1, 1, 1,
-0.4119757, -0.9146357, -2.892308, 1, 1, 1, 1, 1,
-0.4003398, -1.224312, -2.976854, 1, 1, 1, 1, 1,
-0.3990804, 0.3186151, -1.541357, 1, 1, 1, 1, 1,
-0.3981532, 0.5715904, 0.8883497, 1, 1, 1, 1, 1,
-0.3980249, -0.6401995, -3.554733, 1, 1, 1, 1, 1,
-0.3967722, -0.3948917, -3.543735, 0, 0, 1, 1, 1,
-0.3957098, 0.3924177, -0.1505827, 1, 0, 0, 1, 1,
-0.3953502, -1.417456, -1.294566, 1, 0, 0, 1, 1,
-0.3930469, 0.5695229, -1.294943, 1, 0, 0, 1, 1,
-0.3897489, 0.2455639, -1.410976, 1, 0, 0, 1, 1,
-0.3875532, 2.001223, 0.3082385, 1, 0, 0, 1, 1,
-0.386776, -1.450553, -3.932792, 0, 0, 0, 1, 1,
-0.3864842, 1.439479, -1.061705, 0, 0, 0, 1, 1,
-0.3839726, -0.4728562, -2.71436, 0, 0, 0, 1, 1,
-0.3808044, 0.2747736, -0.09473486, 0, 0, 0, 1, 1,
-0.3771081, -0.6983249, -2.503825, 0, 0, 0, 1, 1,
-0.3767125, -1.148459, -4.425681, 0, 0, 0, 1, 1,
-0.3735453, -1.46661, -2.100279, 0, 0, 0, 1, 1,
-0.3616494, 1.903148, 2.592348, 1, 1, 1, 1, 1,
-0.3608737, -0.01441243, -0.7771218, 1, 1, 1, 1, 1,
-0.3592376, -0.8244014, -2.701129, 1, 1, 1, 1, 1,
-0.3586842, -1.559645, -2.813315, 1, 1, 1, 1, 1,
-0.3577528, 0.07719877, -0.8413131, 1, 1, 1, 1, 1,
-0.3568355, -0.2335629, -3.595053, 1, 1, 1, 1, 1,
-0.3523882, -2.150298, -2.470484, 1, 1, 1, 1, 1,
-0.351209, 1.152665, 1.310457, 1, 1, 1, 1, 1,
-0.3414947, -0.2205011, -1.416691, 1, 1, 1, 1, 1,
-0.3397453, -0.123795, 1.0119, 1, 1, 1, 1, 1,
-0.3322448, -0.5614228, -4.680468, 1, 1, 1, 1, 1,
-0.331419, 0.855502, 0.06379184, 1, 1, 1, 1, 1,
-0.326958, 1.087367, -0.3563881, 1, 1, 1, 1, 1,
-0.3264439, 1.605601, -0.4001768, 1, 1, 1, 1, 1,
-0.3239377, 0.4368719, -2.724682, 1, 1, 1, 1, 1,
-0.3217801, 0.5259053, 0.6267766, 0, 0, 1, 1, 1,
-0.3045928, 0.8121403, -0.1470809, 1, 0, 0, 1, 1,
-0.3033541, 0.5771257, -0.01871315, 1, 0, 0, 1, 1,
-0.2985911, -1.209264, -3.508987, 1, 0, 0, 1, 1,
-0.2951759, -1.107256, -3.76095, 1, 0, 0, 1, 1,
-0.2908005, 0.8405499, -1.273867, 1, 0, 0, 1, 1,
-0.2892004, 1.082869, 0.7093324, 0, 0, 0, 1, 1,
-0.2862677, -2.078355, -2.871035, 0, 0, 0, 1, 1,
-0.2817328, -1.57851, -3.460364, 0, 0, 0, 1, 1,
-0.2814701, 1.402532, -1.406962, 0, 0, 0, 1, 1,
-0.2756489, 0.3952815, 1.265937, 0, 0, 0, 1, 1,
-0.2746423, 0.167047, 0.2910183, 0, 0, 0, 1, 1,
-0.2732351, -1.132615, -3.708445, 0, 0, 0, 1, 1,
-0.2731365, 0.3408695, 0.540809, 1, 1, 1, 1, 1,
-0.2729474, 0.3896337, -0.6934532, 1, 1, 1, 1, 1,
-0.2684984, -0.6625383, -2.530025, 1, 1, 1, 1, 1,
-0.2673309, -0.5750099, -4.029437, 1, 1, 1, 1, 1,
-0.267027, 2.366645, -0.2326536, 1, 1, 1, 1, 1,
-0.2669184, -1.042462, -3.411969, 1, 1, 1, 1, 1,
-0.2648752, 1.170177, 0.5743592, 1, 1, 1, 1, 1,
-0.2623546, 2.082035, -1.699102, 1, 1, 1, 1, 1,
-0.2616045, 0.4914347, -0.02118218, 1, 1, 1, 1, 1,
-0.2599855, 0.5067344, 0.4609616, 1, 1, 1, 1, 1,
-0.2595793, 0.5116825, -0.7808586, 1, 1, 1, 1, 1,
-0.2550741, -1.355172, -3.751815, 1, 1, 1, 1, 1,
-0.2541625, 0.9817592, 0.9064798, 1, 1, 1, 1, 1,
-0.2533649, 1.746137, -0.503946, 1, 1, 1, 1, 1,
-0.2495138, 0.6822349, -0.08042895, 1, 1, 1, 1, 1,
-0.2460748, -0.6563028, -1.314, 0, 0, 1, 1, 1,
-0.2451313, -0.4248928, -1.874975, 1, 0, 0, 1, 1,
-0.2431008, -0.6828651, -3.00945, 1, 0, 0, 1, 1,
-0.239122, -0.3271048, -1.493138, 1, 0, 0, 1, 1,
-0.228327, -0.5929245, -3.699371, 1, 0, 0, 1, 1,
-0.2239811, -1.846508, -2.098812, 1, 0, 0, 1, 1,
-0.2223177, -0.1234579, -2.802512, 0, 0, 0, 1, 1,
-0.2158542, 0.6365954, 0.1989653, 0, 0, 0, 1, 1,
-0.2099998, -0.9158727, -1.625577, 0, 0, 0, 1, 1,
-0.20973, 0.890665, -2.726933, 0, 0, 0, 1, 1,
-0.2081366, -0.3745952, -1.751363, 0, 0, 0, 1, 1,
-0.2011684, 1.790253, -0.3688609, 0, 0, 0, 1, 1,
-0.1952173, -1.039437, -2.265924, 0, 0, 0, 1, 1,
-0.1932605, -1.57932, -3.273084, 1, 1, 1, 1, 1,
-0.1890738, -0.09144925, -3.244177, 1, 1, 1, 1, 1,
-0.1889616, -0.694254, -2.132559, 1, 1, 1, 1, 1,
-0.1849607, 0.8644637, -1.092815, 1, 1, 1, 1, 1,
-0.1781768, 0.5451732, -1.373102, 1, 1, 1, 1, 1,
-0.1774039, 0.6363213, -0.2300553, 1, 1, 1, 1, 1,
-0.1751262, -0.08394429, -0.6583022, 1, 1, 1, 1, 1,
-0.1742175, 1.229484, -0.8977327, 1, 1, 1, 1, 1,
-0.1736439, 0.5289728, 0.21419, 1, 1, 1, 1, 1,
-0.1727685, 2.470031, 2.030941, 1, 1, 1, 1, 1,
-0.1657776, 0.9173571, 0.8097169, 1, 1, 1, 1, 1,
-0.162634, 1.431638, -1.044283, 1, 1, 1, 1, 1,
-0.1611504, -0.02028045, -1.732818, 1, 1, 1, 1, 1,
-0.1590123, 0.4463995, -1.080384, 1, 1, 1, 1, 1,
-0.1523251, -0.8953148, -3.028482, 1, 1, 1, 1, 1,
-0.1515248, -0.01440414, -0.6832545, 0, 0, 1, 1, 1,
-0.1499916, 0.3238907, -0.3506841, 1, 0, 0, 1, 1,
-0.1470351, 1.335504, 0.6682309, 1, 0, 0, 1, 1,
-0.1440457, 1.818343, 1.029271, 1, 0, 0, 1, 1,
-0.1382553, -0.9835148, -2.101741, 1, 0, 0, 1, 1,
-0.1376265, 0.5348942, 0.5911192, 1, 0, 0, 1, 1,
-0.1329484, 0.4125421, -1.202146, 0, 0, 0, 1, 1,
-0.1284622, 0.848088, -1.14992, 0, 0, 0, 1, 1,
-0.1255995, 0.2286658, -1.400133, 0, 0, 0, 1, 1,
-0.1248033, 0.3950799, 0.8135037, 0, 0, 0, 1, 1,
-0.1215561, -0.6771696, -2.165395, 0, 0, 0, 1, 1,
-0.1212405, -0.6159895, -2.064254, 0, 0, 0, 1, 1,
-0.1207894, 0.7127733, 1.304657, 0, 0, 0, 1, 1,
-0.1170096, 1.657089, -0.4874719, 1, 1, 1, 1, 1,
-0.1145989, -1.575072, -3.43205, 1, 1, 1, 1, 1,
-0.1141191, 0.8769917, -0.8414541, 1, 1, 1, 1, 1,
-0.1123133, -0.09293342, -1.830486, 1, 1, 1, 1, 1,
-0.1068762, 0.6013477, -0.9518777, 1, 1, 1, 1, 1,
-0.1021857, 1.145511, -0.4627473, 1, 1, 1, 1, 1,
-0.1007068, 1.347377, -1.216991, 1, 1, 1, 1, 1,
-0.1004411, -0.6436719, -3.11732, 1, 1, 1, 1, 1,
-0.09753, 0.193932, -0.9422697, 1, 1, 1, 1, 1,
-0.09587217, -0.2039154, -2.555404, 1, 1, 1, 1, 1,
-0.09423315, 1.069354, 2.786431, 1, 1, 1, 1, 1,
-0.0924816, -0.3671903, -1.608063, 1, 1, 1, 1, 1,
-0.08869683, 0.5184925, -0.74229, 1, 1, 1, 1, 1,
-0.08109061, -0.3182096, -2.514338, 1, 1, 1, 1, 1,
-0.08028051, -1.145422, -2.62562, 1, 1, 1, 1, 1,
-0.08024076, -0.110277, -2.191597, 0, 0, 1, 1, 1,
-0.07881048, 0.7929802, -0.5055619, 1, 0, 0, 1, 1,
-0.0720727, -1.34529, -3.210131, 1, 0, 0, 1, 1,
-0.07199219, -0.2128525, -2.088344, 1, 0, 0, 1, 1,
-0.06884784, 1.917309, 0.2576069, 1, 0, 0, 1, 1,
-0.06834766, 1.518259, 1.295607, 1, 0, 0, 1, 1,
-0.06757377, 0.0004800707, 0.4963002, 0, 0, 0, 1, 1,
-0.0663945, -0.9779575, -2.426725, 0, 0, 0, 1, 1,
-0.06154485, 0.6043392, 1.246829, 0, 0, 0, 1, 1,
-0.05869562, -1.239373, -3.706563, 0, 0, 0, 1, 1,
-0.05543995, 0.414078, -1.243339, 0, 0, 0, 1, 1,
-0.05406044, 0.2728009, 1.059266, 0, 0, 0, 1, 1,
-0.05372231, 1.210902, -1.508327, 0, 0, 0, 1, 1,
-0.05253113, -0.9580491, -3.474578, 1, 1, 1, 1, 1,
-0.05167078, -1.077457, -3.762261, 1, 1, 1, 1, 1,
-0.05125635, -0.1221623, -3.483467, 1, 1, 1, 1, 1,
-0.04851309, 0.910479, -0.1340594, 1, 1, 1, 1, 1,
-0.04547952, -0.6735693, -4.304027, 1, 1, 1, 1, 1,
-0.04325512, -0.2745615, -3.105551, 1, 1, 1, 1, 1,
-0.04320928, -1.184089, -2.167645, 1, 1, 1, 1, 1,
-0.04178733, 0.0979729, 0.1308478, 1, 1, 1, 1, 1,
-0.04050605, 0.6876118, -1.145277, 1, 1, 1, 1, 1,
-0.03986545, 0.7426726, -1.369294, 1, 1, 1, 1, 1,
-0.03979594, -1.368276, -2.868603, 1, 1, 1, 1, 1,
-0.03698992, -0.7933019, -2.223058, 1, 1, 1, 1, 1,
-0.02856392, -0.3832504, -3.344906, 1, 1, 1, 1, 1,
-0.02489293, -0.2942486, -3.65817, 1, 1, 1, 1, 1,
-0.02467335, 0.7602343, -0.3964329, 1, 1, 1, 1, 1,
-0.02300073, -0.2391293, -2.159535, 0, 0, 1, 1, 1,
-0.02133946, -1.310697, -2.253257, 1, 0, 0, 1, 1,
-0.01918734, 0.9866144, 0.417479, 1, 0, 0, 1, 1,
-0.01840383, -1.284726, -3.5944, 1, 0, 0, 1, 1,
-0.01702608, 0.9278782, 0.07767436, 1, 0, 0, 1, 1,
-0.01492326, 1.389017, -0.1209839, 1, 0, 0, 1, 1,
-0.01435484, 0.1238453, 1.197152, 0, 0, 0, 1, 1,
-0.01312899, 0.06738312, -0.1631552, 0, 0, 0, 1, 1,
-0.01307483, 0.8153393, 0.3930556, 0, 0, 0, 1, 1,
-0.01018304, -1.089571, -2.856023, 0, 0, 0, 1, 1,
-0.009805021, 0.7706195, -0.2192378, 0, 0, 0, 1, 1,
-0.007347013, 1.353243, 0.9243783, 0, 0, 0, 1, 1,
-0.005760394, 0.5277917, -0.1098623, 0, 0, 0, 1, 1,
-0.004511291, 0.7146053, 0.982939, 1, 1, 1, 1, 1,
-0.00337356, -0.1711252, -2.993737, 1, 1, 1, 1, 1,
-0.003054617, 1.903977, 3.132174, 1, 1, 1, 1, 1,
-0.002551743, 2.859215, -0.8801939, 1, 1, 1, 1, 1,
-0.001446918, 0.1227334, 0.8023018, 1, 1, 1, 1, 1,
0.001910352, 0.09842933, 0.6937922, 1, 1, 1, 1, 1,
0.004527241, 1.671376, -0.4000182, 1, 1, 1, 1, 1,
0.007116199, -2.309716, 1.8661, 1, 1, 1, 1, 1,
0.008434162, 0.7332349, 0.2729303, 1, 1, 1, 1, 1,
0.01049173, 0.9912435, 0.4047149, 1, 1, 1, 1, 1,
0.01076701, 0.4747484, 0.4629288, 1, 1, 1, 1, 1,
0.0143184, -0.2226802, 3.568863, 1, 1, 1, 1, 1,
0.01609992, 1.794692, -1.010846, 1, 1, 1, 1, 1,
0.01803238, 0.1580338, 1.03533, 1, 1, 1, 1, 1,
0.02417089, -0.4853821, 3.950787, 1, 1, 1, 1, 1,
0.0311641, -0.6197844, 1.206665, 0, 0, 1, 1, 1,
0.03555254, 0.4367419, -0.03870634, 1, 0, 0, 1, 1,
0.03784972, -0.6143991, 3.896587, 1, 0, 0, 1, 1,
0.03887109, -0.8387319, 2.40459, 1, 0, 0, 1, 1,
0.04392802, 0.03480551, 0.5729812, 1, 0, 0, 1, 1,
0.04561681, -0.1569915, 2.657369, 1, 0, 0, 1, 1,
0.04722586, -0.2127029, 1.53654, 0, 0, 0, 1, 1,
0.04751232, -0.3610579, 1.070461, 0, 0, 0, 1, 1,
0.0475152, 1.313271, 0.01652734, 0, 0, 0, 1, 1,
0.05173767, 0.6969185, 0.7475801, 0, 0, 0, 1, 1,
0.05218284, -0.02976716, 2.12347, 0, 0, 0, 1, 1,
0.05866969, 0.420598, 1.242844, 0, 0, 0, 1, 1,
0.06135888, 0.1411954, -1.220795, 0, 0, 0, 1, 1,
0.06402748, 1.00176, -0.2144558, 1, 1, 1, 1, 1,
0.06559408, 0.5090401, 1.762551, 1, 1, 1, 1, 1,
0.07057396, 0.9892311, -0.0813996, 1, 1, 1, 1, 1,
0.07483201, -1.206841, 2.376899, 1, 1, 1, 1, 1,
0.07879152, -0.9439954, 1.435463, 1, 1, 1, 1, 1,
0.08208263, 0.4813086, 2.414447, 1, 1, 1, 1, 1,
0.0839007, 0.009656855, 1.355824, 1, 1, 1, 1, 1,
0.08678191, 0.1858048, 1.372003, 1, 1, 1, 1, 1,
0.08681778, 3.133677, -0.08314227, 1, 1, 1, 1, 1,
0.08824586, -1.032797, 3.845311, 1, 1, 1, 1, 1,
0.08996356, -0.691936, 3.541445, 1, 1, 1, 1, 1,
0.09521948, -0.1805423, 1.731418, 1, 1, 1, 1, 1,
0.09900556, -2.076343, 4.15202, 1, 1, 1, 1, 1,
0.09901955, 0.4385172, 1.42463, 1, 1, 1, 1, 1,
0.09986701, -0.4663101, 3.778929, 1, 1, 1, 1, 1,
0.1029508, 1.892884, 0.2658498, 0, 0, 1, 1, 1,
0.106592, 1.288565, -1.165956, 1, 0, 0, 1, 1,
0.1066383, 0.7349504, 1.829048, 1, 0, 0, 1, 1,
0.1074581, 1.175223, -1.016478, 1, 0, 0, 1, 1,
0.1123295, 0.6698176, -0.05822459, 1, 0, 0, 1, 1,
0.1172427, 1.720604, -1.10898, 1, 0, 0, 1, 1,
0.1189432, 0.06294369, 2.010195, 0, 0, 0, 1, 1,
0.1227423, 2.306215, 0.7113626, 0, 0, 0, 1, 1,
0.1324624, -1.325085, 2.639804, 0, 0, 0, 1, 1,
0.1380416, 0.8423449, -0.2833202, 0, 0, 0, 1, 1,
0.13826, -0.08125322, 2.560471, 0, 0, 0, 1, 1,
0.142167, 2.040747, 1.009864, 0, 0, 0, 1, 1,
0.1479076, -0.4477662, 2.453984, 0, 0, 0, 1, 1,
0.1484068, 0.4271462, 1.033671, 1, 1, 1, 1, 1,
0.1491192, -1.794065, 3.200033, 1, 1, 1, 1, 1,
0.1508467, 0.9440281, 1.275139, 1, 1, 1, 1, 1,
0.1537853, 1.359126, -0.1977435, 1, 1, 1, 1, 1,
0.1543013, -1.575325, 4.197285, 1, 1, 1, 1, 1,
0.1548609, 0.7498152, -1.550447, 1, 1, 1, 1, 1,
0.1611945, -1.399202, 2.436402, 1, 1, 1, 1, 1,
0.1632975, -0.2375735, 3.874264, 1, 1, 1, 1, 1,
0.1652275, -0.9158821, 3.84231, 1, 1, 1, 1, 1,
0.1686536, 0.6041869, 0.7913122, 1, 1, 1, 1, 1,
0.1739455, -1.77613, 3.631829, 1, 1, 1, 1, 1,
0.1742143, 0.587955, -0.8326855, 1, 1, 1, 1, 1,
0.1756255, 0.6617872, 0.5678182, 1, 1, 1, 1, 1,
0.1779397, -0.5806224, 2.583384, 1, 1, 1, 1, 1,
0.180418, -2.100346, 2.797357, 1, 1, 1, 1, 1,
0.1855159, -0.4944303, 4.885921, 0, 0, 1, 1, 1,
0.1881078, 0.890453, 0.7616384, 1, 0, 0, 1, 1,
0.1956502, 1.73085, 0.5576091, 1, 0, 0, 1, 1,
0.1981823, 1.8669, -0.6739656, 1, 0, 0, 1, 1,
0.1983522, 0.05377379, 0.1123555, 1, 0, 0, 1, 1,
0.2062249, 0.3995865, 1.925836, 1, 0, 0, 1, 1,
0.2067429, -1.330511, 1.207642, 0, 0, 0, 1, 1,
0.2073703, -2.175645, 4.010783, 0, 0, 0, 1, 1,
0.2085297, 0.2310273, -0.7178978, 0, 0, 0, 1, 1,
0.2087691, -0.2219634, 3.108932, 0, 0, 0, 1, 1,
0.2108573, 0.1061463, 2.417301, 0, 0, 0, 1, 1,
0.2119924, 1.386607, 0.6177486, 0, 0, 0, 1, 1,
0.2162276, -0.4237388, 2.903721, 0, 0, 0, 1, 1,
0.2185332, 2.282617, -0.5218008, 1, 1, 1, 1, 1,
0.220108, -1.813033, 1.203677, 1, 1, 1, 1, 1,
0.2202111, 0.1886027, 1.210361, 1, 1, 1, 1, 1,
0.2210009, -0.04086351, 0.8108935, 1, 1, 1, 1, 1,
0.2214472, 0.9998133, 0.3898547, 1, 1, 1, 1, 1,
0.2218571, 1.323755, -1.082972, 1, 1, 1, 1, 1,
0.2238958, -0.466442, 2.863786, 1, 1, 1, 1, 1,
0.2251975, 0.2167244, -0.3392305, 1, 1, 1, 1, 1,
0.2285842, -1.028804, 0.7954691, 1, 1, 1, 1, 1,
0.2301533, 0.6926314, -0.8281, 1, 1, 1, 1, 1,
0.23057, 0.3678215, 0.07378075, 1, 1, 1, 1, 1,
0.231226, -1.027479, 2.662279, 1, 1, 1, 1, 1,
0.2332177, -1.292417, 1.861926, 1, 1, 1, 1, 1,
0.2446029, -0.2533796, 4.498733, 1, 1, 1, 1, 1,
0.2453057, 0.386759, -0.5069948, 1, 1, 1, 1, 1,
0.2479538, -0.7702366, 2.428962, 0, 0, 1, 1, 1,
0.2482718, 0.4681798, 0.796005, 1, 0, 0, 1, 1,
0.2542298, 1.022604, 1.384731, 1, 0, 0, 1, 1,
0.2543761, 0.6709852, 0.166636, 1, 0, 0, 1, 1,
0.2568063, 0.5363335, -0.2723369, 1, 0, 0, 1, 1,
0.2591944, -0.8925417, 5.033256, 1, 0, 0, 1, 1,
0.259846, 0.4812431, 1.001117, 0, 0, 0, 1, 1,
0.2627063, 0.5093473, 1.712985, 0, 0, 0, 1, 1,
0.2665226, -1.150963, 2.629009, 0, 0, 0, 1, 1,
0.2683228, -0.3231738, 2.395306, 0, 0, 0, 1, 1,
0.2691768, -0.9747273, 3.479692, 0, 0, 0, 1, 1,
0.2696475, -0.7016104, 1.501441, 0, 0, 0, 1, 1,
0.2710566, -0.7571881, 2.007199, 0, 0, 0, 1, 1,
0.271577, -1.299764, 2.341852, 1, 1, 1, 1, 1,
0.2724169, -1.151322, 1.199502, 1, 1, 1, 1, 1,
0.2736673, 0.3654234, 1.414753, 1, 1, 1, 1, 1,
0.2757775, 0.8482644, 0.2939247, 1, 1, 1, 1, 1,
0.2765013, -0.3205473, 2.591183, 1, 1, 1, 1, 1,
0.2772232, 0.04088433, 0.7560481, 1, 1, 1, 1, 1,
0.2784591, -0.09097993, 1.53113, 1, 1, 1, 1, 1,
0.2790716, 1.700382, 0.1302681, 1, 1, 1, 1, 1,
0.2807909, -0.317379, 1.286369, 1, 1, 1, 1, 1,
0.2842163, -0.3677357, 1.454653, 1, 1, 1, 1, 1,
0.2922629, -0.4437662, 3.765757, 1, 1, 1, 1, 1,
0.2990902, 1.322974, 0.9551225, 1, 1, 1, 1, 1,
0.3006342, -0.8564066, 1.745624, 1, 1, 1, 1, 1,
0.3023064, 0.3851074, 0.7809309, 1, 1, 1, 1, 1,
0.3031272, 0.5999957, 1.421, 1, 1, 1, 1, 1,
0.303396, -0.2114391, 2.467166, 0, 0, 1, 1, 1,
0.3068377, 0.8258806, -0.1842853, 1, 0, 0, 1, 1,
0.3097866, -0.2401457, 1.925051, 1, 0, 0, 1, 1,
0.3124679, -0.753705, 2.306786, 1, 0, 0, 1, 1,
0.3137949, -0.8300412, 3.347828, 1, 0, 0, 1, 1,
0.3206236, -0.1533271, 4.55279, 1, 0, 0, 1, 1,
0.324005, 0.261935, 2.456379, 0, 0, 0, 1, 1,
0.3240937, 0.1228647, -0.2711099, 0, 0, 0, 1, 1,
0.324269, 2.12891, -0.6298964, 0, 0, 0, 1, 1,
0.3265763, 1.074274, 0.6860953, 0, 0, 0, 1, 1,
0.3290658, -1.408561, 2.534505, 0, 0, 0, 1, 1,
0.3305952, -2.247643, 3.570979, 0, 0, 0, 1, 1,
0.330718, 0.1740247, 1.187937, 0, 0, 0, 1, 1,
0.3343492, 0.386636, 1.498665, 1, 1, 1, 1, 1,
0.3359685, -1.548365, 4.832022, 1, 1, 1, 1, 1,
0.3389338, 2.931324, -0.7645881, 1, 1, 1, 1, 1,
0.3411716, 0.2810313, 2.666676, 1, 1, 1, 1, 1,
0.3414691, -1.754623, 1.837393, 1, 1, 1, 1, 1,
0.3420113, 0.339036, 2.453254, 1, 1, 1, 1, 1,
0.3485478, -0.2417681, 2.032215, 1, 1, 1, 1, 1,
0.3487511, 1.307908, 0.5104145, 1, 1, 1, 1, 1,
0.3499825, -1.035229, 3.851237, 1, 1, 1, 1, 1,
0.35234, -0.4186564, 1.884853, 1, 1, 1, 1, 1,
0.3554793, -0.04497228, 0.7130354, 1, 1, 1, 1, 1,
0.3570419, 0.1275935, 3.336533, 1, 1, 1, 1, 1,
0.3580857, -2.233886, 2.903755, 1, 1, 1, 1, 1,
0.3590439, 0.9583526, 0.2991699, 1, 1, 1, 1, 1,
0.3643873, 2.446244, -0.5849758, 1, 1, 1, 1, 1,
0.3664405, -0.4632011, 1.956859, 0, 0, 1, 1, 1,
0.3692868, -1.486969, 2.50971, 1, 0, 0, 1, 1,
0.3723882, -1.186588, 2.58846, 1, 0, 0, 1, 1,
0.3748799, -0.5557016, 2.098192, 1, 0, 0, 1, 1,
0.3778379, 0.8041701, 0.7964709, 1, 0, 0, 1, 1,
0.3790067, 1.737703, 2.179248, 1, 0, 0, 1, 1,
0.3793383, -0.6136875, 3.549131, 0, 0, 0, 1, 1,
0.3794158, -0.1694057, 2.871015, 0, 0, 0, 1, 1,
0.3802621, 0.5151602, 0.2165307, 0, 0, 0, 1, 1,
0.3843027, -0.1477354, 3.417341, 0, 0, 0, 1, 1,
0.3872818, -1.265355, 3.271135, 0, 0, 0, 1, 1,
0.3939507, 2.052921, -1.285486, 0, 0, 0, 1, 1,
0.3948281, -0.4788031, 2.956279, 0, 0, 0, 1, 1,
0.3994277, -0.7226622, 1.106657, 1, 1, 1, 1, 1,
0.4004086, 0.01957828, 2.379256, 1, 1, 1, 1, 1,
0.4016849, -0.08417092, 1.606433, 1, 1, 1, 1, 1,
0.4027683, -0.7560933, 2.748329, 1, 1, 1, 1, 1,
0.4039159, 1.252254, 1.965067, 1, 1, 1, 1, 1,
0.408121, 0.07790449, 1.732445, 1, 1, 1, 1, 1,
0.4104078, -0.2498435, 2.461797, 1, 1, 1, 1, 1,
0.4114614, -0.1560174, 2.04436, 1, 1, 1, 1, 1,
0.4203334, -0.4326767, 2.502206, 1, 1, 1, 1, 1,
0.4231729, -0.7640153, 2.696184, 1, 1, 1, 1, 1,
0.4238494, -1.044883, 0.9353541, 1, 1, 1, 1, 1,
0.425729, 1.151887, 0.321236, 1, 1, 1, 1, 1,
0.4333003, -0.5185074, 1.780687, 1, 1, 1, 1, 1,
0.4409177, -0.7411321, 3.273061, 1, 1, 1, 1, 1,
0.4420103, -0.545615, 2.306534, 1, 1, 1, 1, 1,
0.4425252, 0.09364551, 2.473727, 0, 0, 1, 1, 1,
0.4472288, -1.393763, 3.396225, 1, 0, 0, 1, 1,
0.448526, 0.6054336, -0.07364438, 1, 0, 0, 1, 1,
0.4542816, -0.03724734, 0.790751, 1, 0, 0, 1, 1,
0.4558148, 0.01565554, 3.910525, 1, 0, 0, 1, 1,
0.4569445, -0.2278572, 2.572596, 1, 0, 0, 1, 1,
0.4582085, -0.7700822, 2.170873, 0, 0, 0, 1, 1,
0.4605826, -0.6475549, 2.970967, 0, 0, 0, 1, 1,
0.4629354, -0.7204958, 3.490439, 0, 0, 0, 1, 1,
0.4658968, 1.24957, 1.389515, 0, 0, 0, 1, 1,
0.4663019, 0.7078414, 1.903001, 0, 0, 0, 1, 1,
0.4723046, 1.536789, 0.3334827, 0, 0, 0, 1, 1,
0.4730446, -0.3363435, 2.532207, 0, 0, 0, 1, 1,
0.4768662, -0.9021245, 2.624485, 1, 1, 1, 1, 1,
0.477708, -1.975963, 2.748273, 1, 1, 1, 1, 1,
0.4792685, -2.05483, 3.600695, 1, 1, 1, 1, 1,
0.4809231, -0.6195935, 1.307032, 1, 1, 1, 1, 1,
0.4880157, -0.8421051, 2.914543, 1, 1, 1, 1, 1,
0.4920174, -0.2507454, 2.511365, 1, 1, 1, 1, 1,
0.495263, 0.3764827, 1.406332, 1, 1, 1, 1, 1,
0.4953354, 0.8487239, 0.2366471, 1, 1, 1, 1, 1,
0.4965296, 1.523668, 1.398286, 1, 1, 1, 1, 1,
0.5003251, -0.1218228, 2.041112, 1, 1, 1, 1, 1,
0.5016013, 0.2747282, 0.7826496, 1, 1, 1, 1, 1,
0.5016768, 0.5506203, 1.564766, 1, 1, 1, 1, 1,
0.5116333, 1.572719, 0.1483376, 1, 1, 1, 1, 1,
0.5117252, -0.2447185, 2.258146, 1, 1, 1, 1, 1,
0.5159405, -1.621215, 3.400865, 1, 1, 1, 1, 1,
0.5161451, -0.6438956, 1.703091, 0, 0, 1, 1, 1,
0.5209327, -0.006000158, 1.926226, 1, 0, 0, 1, 1,
0.5210276, -0.947213, 1.913765, 1, 0, 0, 1, 1,
0.5239745, 1.286414, -0.03575002, 1, 0, 0, 1, 1,
0.5283659, -0.5271128, 1.991494, 1, 0, 0, 1, 1,
0.5291389, 0.06012671, 0.9172782, 1, 0, 0, 1, 1,
0.5395127, -0.2042146, 0.3444026, 0, 0, 0, 1, 1,
0.5396431, 0.6232932, 0.7842454, 0, 0, 0, 1, 1,
0.5409163, 0.2469786, 1.538489, 0, 0, 0, 1, 1,
0.5453848, 1.100224, 0.3936855, 0, 0, 0, 1, 1,
0.5454993, -0.005990647, 2.72406, 0, 0, 0, 1, 1,
0.5506136, -2.26846, 1.922561, 0, 0, 0, 1, 1,
0.5534742, -2.022868, 3.125082, 0, 0, 0, 1, 1,
0.5547058, 0.3134167, 1.425327, 1, 1, 1, 1, 1,
0.5590836, 1.028609, 1.048862, 1, 1, 1, 1, 1,
0.5656165, -1.261796, 3.188283, 1, 1, 1, 1, 1,
0.5663939, -0.6662963, 2.14913, 1, 1, 1, 1, 1,
0.5676455, 0.7828864, 1.838261, 1, 1, 1, 1, 1,
0.5701278, 0.2579672, 2.258976, 1, 1, 1, 1, 1,
0.5709465, -0.5209511, 2.661622, 1, 1, 1, 1, 1,
0.5715551, -1.092398, 2.71228, 1, 1, 1, 1, 1,
0.5811797, -0.6647508, 1.571095, 1, 1, 1, 1, 1,
0.5826624, 0.6268823, 0.939088, 1, 1, 1, 1, 1,
0.5827712, 0.1802938, 0.8177633, 1, 1, 1, 1, 1,
0.5848571, -2.622587, 0.8452442, 1, 1, 1, 1, 1,
0.5851917, 0.3906204, -0.9698173, 1, 1, 1, 1, 1,
0.5879418, -0.08793198, 1.695799, 1, 1, 1, 1, 1,
0.5902968, 0.2678916, 0.7497298, 1, 1, 1, 1, 1,
0.5912716, 0.9538704, -0.9302906, 0, 0, 1, 1, 1,
0.592496, 0.06216757, -0.1934957, 1, 0, 0, 1, 1,
0.5935926, 0.8089321, 1.709435, 1, 0, 0, 1, 1,
0.6089253, -1.263726, 0.5296459, 1, 0, 0, 1, 1,
0.6103363, 0.7624777, 1.277987, 1, 0, 0, 1, 1,
0.6139719, 0.8303487, 1.390568, 1, 0, 0, 1, 1,
0.6216443, 0.2189477, 1.16542, 0, 0, 0, 1, 1,
0.6242639, -0.8798692, 3.303176, 0, 0, 0, 1, 1,
0.6278654, 0.06255005, 1.232039, 0, 0, 0, 1, 1,
0.6325006, -0.1263698, 2.466861, 0, 0, 0, 1, 1,
0.6331173, 0.3125764, 0.2843627, 0, 0, 0, 1, 1,
0.638975, 0.3137316, 1.101997, 0, 0, 0, 1, 1,
0.6457985, -0.8273354, 1.897646, 0, 0, 0, 1, 1,
0.6494461, -0.7438492, 1.416985, 1, 1, 1, 1, 1,
0.6560816, -0.1814384, 2.20801, 1, 1, 1, 1, 1,
0.656339, 1.128981, -0.3727774, 1, 1, 1, 1, 1,
0.6566656, 0.7467448, 3.288076, 1, 1, 1, 1, 1,
0.6576723, -1.253282, 2.390309, 1, 1, 1, 1, 1,
0.6601583, 0.2913581, 1.299661, 1, 1, 1, 1, 1,
0.6613765, -0.301078, 0.6560377, 1, 1, 1, 1, 1,
0.6616006, 0.5587444, 0.3296547, 1, 1, 1, 1, 1,
0.6621135, 0.6860889, 0.85654, 1, 1, 1, 1, 1,
0.6664981, -1.020101, 2.496217, 1, 1, 1, 1, 1,
0.6682237, -2.022012, 1.263767, 1, 1, 1, 1, 1,
0.6702991, -1.178989, 1.873916, 1, 1, 1, 1, 1,
0.6717476, -0.7238697, 0.6469158, 1, 1, 1, 1, 1,
0.6733358, 1.27138, 0.1776019, 1, 1, 1, 1, 1,
0.6739286, -2.078722, 2.627233, 1, 1, 1, 1, 1,
0.6767767, -2.111861, 2.498814, 0, 0, 1, 1, 1,
0.6811538, 0.7758762, 1.034319, 1, 0, 0, 1, 1,
0.6908079, 0.8457527, 0.8993188, 1, 0, 0, 1, 1,
0.6928676, 2.070468, 0.8805066, 1, 0, 0, 1, 1,
0.6969345, 0.1283195, 1.439397, 1, 0, 0, 1, 1,
0.697692, -0.5594835, 2.662728, 1, 0, 0, 1, 1,
0.7026546, 1.286256, -2.509324, 0, 0, 0, 1, 1,
0.7028918, -0.4442953, 1.583096, 0, 0, 0, 1, 1,
0.7041544, -0.5836735, 3.103688, 0, 0, 0, 1, 1,
0.7052121, -0.07670221, 0.5054955, 0, 0, 0, 1, 1,
0.7076089, 0.1615545, 0.9435369, 0, 0, 0, 1, 1,
0.7179328, 0.6103877, 0.0650861, 0, 0, 0, 1, 1,
0.734154, 0.2273719, 0.3138887, 0, 0, 0, 1, 1,
0.7349805, 1.026864, 0.7424434, 1, 1, 1, 1, 1,
0.7402138, -1.534543, 3.169728, 1, 1, 1, 1, 1,
0.7454572, 0.5144728, -1.249885, 1, 1, 1, 1, 1,
0.7510333, 0.5487729, -0.1012325, 1, 1, 1, 1, 1,
0.7511696, 0.9104983, 1.60953, 1, 1, 1, 1, 1,
0.759207, -0.2940746, 2.01067, 1, 1, 1, 1, 1,
0.7604976, -0.09654877, 2.192927, 1, 1, 1, 1, 1,
0.7693621, 1.585585, 1.962574, 1, 1, 1, 1, 1,
0.7731431, -0.875378, 4.172252, 1, 1, 1, 1, 1,
0.7791755, 1.948689, -1.09181, 1, 1, 1, 1, 1,
0.7794414, -2.063529, 4.960899, 1, 1, 1, 1, 1,
0.7849625, 0.9330423, -0.08728957, 1, 1, 1, 1, 1,
0.7876732, 0.1656293, 0.8780209, 1, 1, 1, 1, 1,
0.7907731, -1.150942, 2.776423, 1, 1, 1, 1, 1,
0.7995375, -0.09395957, 1.532071, 1, 1, 1, 1, 1,
0.8018976, -0.9900171, 1.718479, 0, 0, 1, 1, 1,
0.8022011, -0.8555051, 2.070925, 1, 0, 0, 1, 1,
0.8031576, 0.3850588, 0.6771289, 1, 0, 0, 1, 1,
0.8037428, -1.00053, 0.8062431, 1, 0, 0, 1, 1,
0.8085195, -0.5042605, 1.011924, 1, 0, 0, 1, 1,
0.8151248, 0.7720958, 0.8916618, 1, 0, 0, 1, 1,
0.8172664, 0.5197291, 1.145397, 0, 0, 0, 1, 1,
0.8243687, 0.05982461, 1.257516, 0, 0, 0, 1, 1,
0.828457, 1.762689, 0.7033951, 0, 0, 0, 1, 1,
0.8291106, 0.8457897, 2.345301, 0, 0, 0, 1, 1,
0.8312216, 0.8414068, -0.1993912, 0, 0, 0, 1, 1,
0.8315978, 0.3128969, 1.51673, 0, 0, 0, 1, 1,
0.8326405, -0.5747934, 0.3062452, 0, 0, 0, 1, 1,
0.8345292, 1.04792, -0.9087756, 1, 1, 1, 1, 1,
0.834739, -0.4037098, 3.607348, 1, 1, 1, 1, 1,
0.8390558, -0.5096727, 2.223794, 1, 1, 1, 1, 1,
0.8406892, 0.8205428, -1.068581, 1, 1, 1, 1, 1,
0.845165, -0.7603193, 2.76533, 1, 1, 1, 1, 1,
0.8520939, -1.773823, 0.9271461, 1, 1, 1, 1, 1,
0.8551263, -0.332295, 2.800061, 1, 1, 1, 1, 1,
0.8562455, -0.5753815, 0.9946434, 1, 1, 1, 1, 1,
0.867485, 0.9207311, -0.0828997, 1, 1, 1, 1, 1,
0.8677036, 0.5520058, 2.691553, 1, 1, 1, 1, 1,
0.8719483, 0.1444991, 0.3458416, 1, 1, 1, 1, 1,
0.8752786, 0.08088919, 1.069503, 1, 1, 1, 1, 1,
0.8758675, 0.2207122, 0.176869, 1, 1, 1, 1, 1,
0.8773223, -2.801848, 2.422489, 1, 1, 1, 1, 1,
0.8880114, -0.2187911, 3.576529, 1, 1, 1, 1, 1,
0.9024637, 0.6958718, 0.4661357, 0, 0, 1, 1, 1,
0.9075536, 0.2042666, 0.1853886, 1, 0, 0, 1, 1,
0.9094523, 1.611681, 0.8401964, 1, 0, 0, 1, 1,
0.9120572, 0.96998, 1.352747, 1, 0, 0, 1, 1,
0.9136313, -2.597058, 3.099594, 1, 0, 0, 1, 1,
0.9188746, -1.431409, 3.511356, 1, 0, 0, 1, 1,
0.9228346, 0.9162325, 0.6719999, 0, 0, 0, 1, 1,
0.9312847, -1.268873, 2.603457, 0, 0, 0, 1, 1,
0.9318194, 0.4465588, 1.424917, 0, 0, 0, 1, 1,
0.9348118, -0.6008716, 1.681594, 0, 0, 0, 1, 1,
0.9366509, 0.1578466, 1.60542, 0, 0, 0, 1, 1,
0.9384269, 0.3592597, 0.1691151, 0, 0, 0, 1, 1,
0.9388051, 0.9135404, 0.03428979, 0, 0, 0, 1, 1,
0.9399297, 0.4414441, 1.099467, 1, 1, 1, 1, 1,
0.9414827, -0.3317519, 2.320607, 1, 1, 1, 1, 1,
0.941538, 0.8000924, 0.5957487, 1, 1, 1, 1, 1,
0.9449736, 1.101081, 0.4097403, 1, 1, 1, 1, 1,
0.945714, -1.921014, 3.908304, 1, 1, 1, 1, 1,
0.9557633, -0.191104, 2.923111, 1, 1, 1, 1, 1,
0.957028, -0.5825723, 1.088491, 1, 1, 1, 1, 1,
0.9597358, 1.689776, -1.067683, 1, 1, 1, 1, 1,
0.9610378, -0.1984908, 2.27543, 1, 1, 1, 1, 1,
0.9614128, -0.8321747, 1.742618, 1, 1, 1, 1, 1,
0.9691315, 0.531504, 0.0084658, 1, 1, 1, 1, 1,
0.9695897, 0.3327292, 2.60797, 1, 1, 1, 1, 1,
0.9696479, -0.05602312, 0.4413888, 1, 1, 1, 1, 1,
0.9722841, 0.2394585, 1.363037, 1, 1, 1, 1, 1,
0.9749615, 0.1121161, 2.663986, 1, 1, 1, 1, 1,
0.9893016, -1.209756, 3.469122, 0, 0, 1, 1, 1,
1.000803, 0.04282394, -0.2903471, 1, 0, 0, 1, 1,
1.015845, 0.01673471, 2.629529, 1, 0, 0, 1, 1,
1.018069, 0.2269353, 4.297774, 1, 0, 0, 1, 1,
1.024917, 0.586107, 2.963293, 1, 0, 0, 1, 1,
1.025589, -0.7732554, 2.287532, 1, 0, 0, 1, 1,
1.028514, 0.7690743, -0.5655318, 0, 0, 0, 1, 1,
1.032739, -0.9210485, 2.202649, 0, 0, 0, 1, 1,
1.032943, 0.6068566, 0.366229, 0, 0, 0, 1, 1,
1.037791, -0.8457794, 2.808214, 0, 0, 0, 1, 1,
1.04226, 0.6312401, 0.5575597, 0, 0, 0, 1, 1,
1.048974, -0.1424549, 2.51177, 0, 0, 0, 1, 1,
1.056176, 1.181835, 0.3470365, 0, 0, 0, 1, 1,
1.063518, -0.3573545, 1.682856, 1, 1, 1, 1, 1,
1.066332, 1.03883, 1.903891, 1, 1, 1, 1, 1,
1.084898, 1.254116, 0.6335141, 1, 1, 1, 1, 1,
1.087234, -0.3055004, 2.277252, 1, 1, 1, 1, 1,
1.09396, -0.5770585, 1.37146, 1, 1, 1, 1, 1,
1.095546, 1.588807, 1.238178, 1, 1, 1, 1, 1,
1.100035, -0.3382393, 3.322174, 1, 1, 1, 1, 1,
1.100972, 0.148571, 1.436561, 1, 1, 1, 1, 1,
1.105672, 0.782061, -0.2489887, 1, 1, 1, 1, 1,
1.109655, -0.2727804, 1.993481, 1, 1, 1, 1, 1,
1.1179, -1.11853, 0.3123678, 1, 1, 1, 1, 1,
1.129175, 0.06509372, 2.102112, 1, 1, 1, 1, 1,
1.143432, 1.212392, 1.174716, 1, 1, 1, 1, 1,
1.145466, -2.396209, 3.451617, 1, 1, 1, 1, 1,
1.148586, 1.600382, 0.3896053, 1, 1, 1, 1, 1,
1.150647, -0.5824506, 1.304447, 0, 0, 1, 1, 1,
1.151371, -0.3452502, 1.889271, 1, 0, 0, 1, 1,
1.160965, -2.059377, 1.195203, 1, 0, 0, 1, 1,
1.166357, 0.2734477, 2.483364, 1, 0, 0, 1, 1,
1.167231, -1.186472, 2.03438, 1, 0, 0, 1, 1,
1.171451, -0.71164, 3.343973, 1, 0, 0, 1, 1,
1.179408, 1.339853, 0.5706046, 0, 0, 0, 1, 1,
1.18194, 0.6212384, 1.345588, 0, 0, 0, 1, 1,
1.182809, -1.247439, 1.43734, 0, 0, 0, 1, 1,
1.192144, 1.198707, 0.9171849, 0, 0, 0, 1, 1,
1.204463, 1.754302, -0.8029684, 0, 0, 0, 1, 1,
1.221615, 1.352932, 1.146371, 0, 0, 0, 1, 1,
1.223999, 0.6532873, 1.311082, 0, 0, 0, 1, 1,
1.228401, -0.2621449, 2.131493, 1, 1, 1, 1, 1,
1.233352, 0.4181589, 0.5674021, 1, 1, 1, 1, 1,
1.23614, -3.377108, 1.272733, 1, 1, 1, 1, 1,
1.236649, -1.672527, 2.314867, 1, 1, 1, 1, 1,
1.237485, -1.078472, 1.360659, 1, 1, 1, 1, 1,
1.238293, 1.764359, -0.168559, 1, 1, 1, 1, 1,
1.240376, 0.3774362, -0.09003834, 1, 1, 1, 1, 1,
1.240767, -0.3549147, 0.3591954, 1, 1, 1, 1, 1,
1.241443, 1.434806, 1.261462, 1, 1, 1, 1, 1,
1.255216, -0.4998687, 1.94451, 1, 1, 1, 1, 1,
1.264107, 0.4596679, 0.8638507, 1, 1, 1, 1, 1,
1.26963, -0.7582504, 3.868025, 1, 1, 1, 1, 1,
1.274284, 0.9819335, 0.6660933, 1, 1, 1, 1, 1,
1.286371, -0.03197983, 0.8557562, 1, 1, 1, 1, 1,
1.313112, -0.639677, 1.682813, 1, 1, 1, 1, 1,
1.314379, 0.2791719, 2.3404, 0, 0, 1, 1, 1,
1.3151, 0.7581272, 1.842442, 1, 0, 0, 1, 1,
1.316087, -0.9070578, 3.697537, 1, 0, 0, 1, 1,
1.316921, 0.6901177, 0.8641446, 1, 0, 0, 1, 1,
1.328487, -1.505989, 2.862653, 1, 0, 0, 1, 1,
1.329979, 0.04275468, 0.5510788, 1, 0, 0, 1, 1,
1.344918, 1.575722, 2.667408, 0, 0, 0, 1, 1,
1.350246, 0.0286253, 0.2619339, 0, 0, 0, 1, 1,
1.35398, 1.871457, 1.431311, 0, 0, 0, 1, 1,
1.357371, -1.971859, 2.378371, 0, 0, 0, 1, 1,
1.362991, 0.9750798, 1.984298, 0, 0, 0, 1, 1,
1.365544, -1.637902, 1.073636, 0, 0, 0, 1, 1,
1.377533, 0.3903737, 1.124553, 0, 0, 0, 1, 1,
1.379503, -1.942521, 2.465235, 1, 1, 1, 1, 1,
1.386148, -0.430861, 1.466016, 1, 1, 1, 1, 1,
1.386951, 1.005326, 0.4708115, 1, 1, 1, 1, 1,
1.388947, 0.8457272, -0.69429, 1, 1, 1, 1, 1,
1.389606, -0.955155, 3.630277, 1, 1, 1, 1, 1,
1.395054, 2.501043, 0.4136639, 1, 1, 1, 1, 1,
1.397404, -0.671529, 3.096469, 1, 1, 1, 1, 1,
1.398997, -0.2426641, -0.6696717, 1, 1, 1, 1, 1,
1.399787, -0.2159609, 3.751977, 1, 1, 1, 1, 1,
1.406871, 1.092059, 0.4551732, 1, 1, 1, 1, 1,
1.427172, -0.02836488, 0.7598047, 1, 1, 1, 1, 1,
1.428726, 0.6843929, 1.491258, 1, 1, 1, 1, 1,
1.429556, -0.6163138, 0.8436724, 1, 1, 1, 1, 1,
1.433699, -0.1441443, 2.369976, 1, 1, 1, 1, 1,
1.442989, -1.272178, 3.265238, 1, 1, 1, 1, 1,
1.44702, 1.029987, 0.6869477, 0, 0, 1, 1, 1,
1.448109, 0.2804469, 1.92119, 1, 0, 0, 1, 1,
1.449663, -2.12304, 3.151673, 1, 0, 0, 1, 1,
1.450022, -0.6162753, 1.713873, 1, 0, 0, 1, 1,
1.454055, 0.7185206, 0.329162, 1, 0, 0, 1, 1,
1.463236, -1.083775, 1.357136, 1, 0, 0, 1, 1,
1.471844, 0.4591489, 1.419841, 0, 0, 0, 1, 1,
1.47594, 0.7044041, 0.1444931, 0, 0, 0, 1, 1,
1.484274, 0.9490431, 2.012518, 0, 0, 0, 1, 1,
1.487287, 0.1443267, 1.190512, 0, 0, 0, 1, 1,
1.506192, 1.591355, 0.003027594, 0, 0, 0, 1, 1,
1.509381, -0.4284667, 1.686636, 0, 0, 0, 1, 1,
1.511303, 1.189318, -0.417922, 0, 0, 0, 1, 1,
1.511472, -0.07891824, 2.483272, 1, 1, 1, 1, 1,
1.517969, 1.431679, 1.099281, 1, 1, 1, 1, 1,
1.519937, -0.1423149, 2.328015, 1, 1, 1, 1, 1,
1.540573, -1.665, 1.038493, 1, 1, 1, 1, 1,
1.544829, -0.6855794, 2.191034, 1, 1, 1, 1, 1,
1.552478, -0.3366749, 2.630459, 1, 1, 1, 1, 1,
1.561339, -0.07366209, 3.537051, 1, 1, 1, 1, 1,
1.564535, -0.9879968, 1.504201, 1, 1, 1, 1, 1,
1.568994, -1.678074, 2.313166, 1, 1, 1, 1, 1,
1.573984, -0.1931995, 1.575984, 1, 1, 1, 1, 1,
1.591832, 0.8777307, 0.2592696, 1, 1, 1, 1, 1,
1.625768, -0.1720849, 1.737827, 1, 1, 1, 1, 1,
1.627633, -1.727746, 2.922818, 1, 1, 1, 1, 1,
1.644072, 0.7981205, 0.5515567, 1, 1, 1, 1, 1,
1.645087, -1.451867, 3.556418, 1, 1, 1, 1, 1,
1.647004, -0.3629875, 0.3471228, 0, 0, 1, 1, 1,
1.672472, -1.508021, 4.600731, 1, 0, 0, 1, 1,
1.677399, -0.2671583, 0.8306278, 1, 0, 0, 1, 1,
1.687117, -0.4063968, 1.111829, 1, 0, 0, 1, 1,
1.705093, 2.054449, 0.1440084, 1, 0, 0, 1, 1,
1.70684, -0.1846803, 1.357201, 1, 0, 0, 1, 1,
1.74531, 0.9197357, 0.7262462, 0, 0, 0, 1, 1,
1.761523, -0.1501674, 1.573276, 0, 0, 0, 1, 1,
1.76708, 0.3834713, 0.9708042, 0, 0, 0, 1, 1,
1.785782, 0.8024314, 1.266261, 0, 0, 0, 1, 1,
1.793784, -0.6336812, 2.769875, 0, 0, 0, 1, 1,
1.793803, -1.585301, 3.874229, 0, 0, 0, 1, 1,
1.807042, -1.086649, 0.8076007, 0, 0, 0, 1, 1,
1.814217, -1.493478, 3.492236, 1, 1, 1, 1, 1,
1.817779, 0.9474795, -0.5836424, 1, 1, 1, 1, 1,
1.83321, 0.7695994, 0.4359395, 1, 1, 1, 1, 1,
1.834315, 0.2146361, 1.905533, 1, 1, 1, 1, 1,
1.872723, -0.2499454, 1.778826, 1, 1, 1, 1, 1,
1.883666, 0.750167, 0.8513084, 1, 1, 1, 1, 1,
1.912657, 0.02278973, 3.09091, 1, 1, 1, 1, 1,
1.933484, 1.182055, 1.091166, 1, 1, 1, 1, 1,
1.957873, -0.02898356, 2.966006, 1, 1, 1, 1, 1,
2.019489, 0.3539513, 1.513919, 1, 1, 1, 1, 1,
2.023087, 0.3949944, 1.327026, 1, 1, 1, 1, 1,
2.091088, 1.544286, 0.05450347, 1, 1, 1, 1, 1,
2.130735, 1.206255, 0.1996121, 1, 1, 1, 1, 1,
2.205127, 0.4888144, 2.046844, 1, 1, 1, 1, 1,
2.207321, 0.3282754, 1.694558, 1, 1, 1, 1, 1,
2.207351, -0.1112393, 1.290584, 0, 0, 1, 1, 1,
2.208383, 0.2276946, 1.263483, 1, 0, 0, 1, 1,
2.215448, -0.828953, 3.082387, 1, 0, 0, 1, 1,
2.264563, 0.3783181, 1.390393, 1, 0, 0, 1, 1,
2.301498, 0.01955487, 1.546178, 1, 0, 0, 1, 1,
2.311041, 0.4779727, 1.844422, 1, 0, 0, 1, 1,
2.346727, 0.2203238, 1.378432, 0, 0, 0, 1, 1,
2.352713, 0.133987, 2.160058, 0, 0, 0, 1, 1,
2.43334, -0.3694149, 1.074202, 0, 0, 0, 1, 1,
2.484174, -1.185448, 1.925725, 0, 0, 0, 1, 1,
2.491142, 0.6862595, 2.326747, 0, 0, 0, 1, 1,
2.496216, 0.1224755, 1.964344, 0, 0, 0, 1, 1,
2.506341, -0.6144497, 0.5075762, 0, 0, 0, 1, 1,
2.668751, 0.6081263, 0.8960004, 1, 1, 1, 1, 1,
2.672038, -0.4980541, 0.7248926, 1, 1, 1, 1, 1,
2.691496, -0.8441837, 1.560258, 1, 1, 1, 1, 1,
2.738637, -0.5225908, 3.118991, 1, 1, 1, 1, 1,
2.873743, -0.1584474, 1.107995, 1, 1, 1, 1, 1,
2.921469, 0.6924323, 0.0356649, 1, 1, 1, 1, 1,
3.009233, 1.212387, 0.8387111, 1, 1, 1, 1, 1
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
var radius = 9.47981;
var distance = 33.29743;
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
mvMatrix.translate( 0.08736038, 0.1217151, 0.2420633 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.29743);
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
