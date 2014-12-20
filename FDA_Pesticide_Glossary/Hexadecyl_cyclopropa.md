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
-3.072125, -0.02408807, -1.52332, 1, 0, 0, 1,
-2.840524, 0.2825078, -0.7375565, 1, 0.007843138, 0, 1,
-2.691314, -0.9931305, -3.137089, 1, 0.01176471, 0, 1,
-2.650571, 1.380992, -1.861593, 1, 0.01960784, 0, 1,
-2.563604, -1.024668, -1.763408, 1, 0.02352941, 0, 1,
-2.541022, -1.53103, -3.047018, 1, 0.03137255, 0, 1,
-2.460069, 0.1577362, -0.1790226, 1, 0.03529412, 0, 1,
-2.45594, 0.3718179, -1.466996, 1, 0.04313726, 0, 1,
-2.405657, -1.717138, -2.071791, 1, 0.04705882, 0, 1,
-2.201856, 0.8182055, -2.053847, 1, 0.05490196, 0, 1,
-2.190056, 0.542024, 0.2608369, 1, 0.05882353, 0, 1,
-2.141702, -0.721814, -4.326286, 1, 0.06666667, 0, 1,
-2.141234, -0.6255381, -2.175372, 1, 0.07058824, 0, 1,
-2.113405, -0.6810662, -2.600461, 1, 0.07843138, 0, 1,
-2.097612, 0.4701158, -0.6498426, 1, 0.08235294, 0, 1,
-2.054742, 1.315331, -1.99796, 1, 0.09019608, 0, 1,
-2.042563, -1.098149, -1.782321, 1, 0.09411765, 0, 1,
-2.00763, 1.282544, -1.080026, 1, 0.1019608, 0, 1,
-2.006878, 2.362622, 0.8798674, 1, 0.1098039, 0, 1,
-1.999509, 0.6127167, -1.104842, 1, 0.1137255, 0, 1,
-1.983185, -0.7117679, -1.915689, 1, 0.1215686, 0, 1,
-1.946719, -0.3300333, -1.261294, 1, 0.1254902, 0, 1,
-1.922294, -0.3062871, -1.542481, 1, 0.1333333, 0, 1,
-1.908905, 1.617133, -1.727202, 1, 0.1372549, 0, 1,
-1.896878, 0.7714189, -1.520911, 1, 0.145098, 0, 1,
-1.859216, 0.2243221, -0.9985853, 1, 0.1490196, 0, 1,
-1.856717, 0.8385003, -1.003791, 1, 0.1568628, 0, 1,
-1.853292, 1.340382, -0.2362102, 1, 0.1607843, 0, 1,
-1.84846, 0.6519216, -1.419272, 1, 0.1686275, 0, 1,
-1.847671, -0.4340448, -2.457905, 1, 0.172549, 0, 1,
-1.837352, -0.6203309, -3.75229, 1, 0.1803922, 0, 1,
-1.836433, -0.004526855, 0.09320617, 1, 0.1843137, 0, 1,
-1.835576, -0.2996983, -1.007902, 1, 0.1921569, 0, 1,
-1.829098, -0.5089133, -3.038593, 1, 0.1960784, 0, 1,
-1.827946, 1.339034, -0.8415384, 1, 0.2039216, 0, 1,
-1.800856, 1.276761, -0.6041484, 1, 0.2117647, 0, 1,
-1.780836, -0.8209599, -3.641549, 1, 0.2156863, 0, 1,
-1.779186, -0.7802529, -0.6338772, 1, 0.2235294, 0, 1,
-1.75614, 2.323355, 0.2913841, 1, 0.227451, 0, 1,
-1.689411, -0.6847413, -0.1400201, 1, 0.2352941, 0, 1,
-1.673672, 1.453522, -3.201025, 1, 0.2392157, 0, 1,
-1.668144, -0.4532328, -2.03402, 1, 0.2470588, 0, 1,
-1.653652, -3.925987, -3.0693, 1, 0.2509804, 0, 1,
-1.651628, -0.1366709, -2.843743, 1, 0.2588235, 0, 1,
-1.651625, 1.52781, -0.9108127, 1, 0.2627451, 0, 1,
-1.630729, -1.290627, -2.301843, 1, 0.2705882, 0, 1,
-1.62884, 0.916929, -0.3958407, 1, 0.2745098, 0, 1,
-1.61712, -1.121879, -2.27577, 1, 0.282353, 0, 1,
-1.613642, -0.09477136, -2.290525, 1, 0.2862745, 0, 1,
-1.5993, 0.1151662, -2.147364, 1, 0.2941177, 0, 1,
-1.587642, -0.0934374, -0.5490471, 1, 0.3019608, 0, 1,
-1.583559, -1.542928, -2.833129, 1, 0.3058824, 0, 1,
-1.572514, 1.853557, -0.2994125, 1, 0.3137255, 0, 1,
-1.557961, 0.9733107, -2.046581, 1, 0.3176471, 0, 1,
-1.546636, -1.750204, -1.556839, 1, 0.3254902, 0, 1,
-1.536469, -0.6561392, -2.678367, 1, 0.3294118, 0, 1,
-1.512104, -0.1075426, -1.188081, 1, 0.3372549, 0, 1,
-1.495646, -0.5292708, -1.848942, 1, 0.3411765, 0, 1,
-1.495423, -0.9191051, -2.09872, 1, 0.3490196, 0, 1,
-1.484258, -0.9056633, -3.285137, 1, 0.3529412, 0, 1,
-1.483946, 1.082028, 0.906126, 1, 0.3607843, 0, 1,
-1.483096, 0.07518357, -1.101374, 1, 0.3647059, 0, 1,
-1.483044, 0.3704167, 0.4214171, 1, 0.372549, 0, 1,
-1.477764, 0.6392813, -1.893814, 1, 0.3764706, 0, 1,
-1.47693, 0.6660994, -0.2186187, 1, 0.3843137, 0, 1,
-1.47499, 0.4497961, -2.337981, 1, 0.3882353, 0, 1,
-1.46952, -1.502359, -1.955778, 1, 0.3960784, 0, 1,
-1.46844, -0.8817752, -2.101062, 1, 0.4039216, 0, 1,
-1.46476, -0.3025276, -1.016394, 1, 0.4078431, 0, 1,
-1.464564, -0.09394001, -2.643432, 1, 0.4156863, 0, 1,
-1.427882, -1.638299, -4.835343, 1, 0.4196078, 0, 1,
-1.426807, -1.056686, -1.158143, 1, 0.427451, 0, 1,
-1.42307, -0.06085035, -1.296672, 1, 0.4313726, 0, 1,
-1.42124, -0.5702826, -2.604916, 1, 0.4392157, 0, 1,
-1.418188, -0.2099909, -1.942799, 1, 0.4431373, 0, 1,
-1.417634, 0.27, 0.7708809, 1, 0.4509804, 0, 1,
-1.414703, 0.03539139, -1.971379, 1, 0.454902, 0, 1,
-1.400196, 0.7311959, -1.279105, 1, 0.4627451, 0, 1,
-1.391034, 1.454104, 1.41145, 1, 0.4666667, 0, 1,
-1.386529, -0.7437615, -2.136047, 1, 0.4745098, 0, 1,
-1.372174, -1.139595, -2.070988, 1, 0.4784314, 0, 1,
-1.357442, 1.43484, -1.863224, 1, 0.4862745, 0, 1,
-1.350728, -1.215958, -1.811401, 1, 0.4901961, 0, 1,
-1.337296, 0.7634277, -0.1198118, 1, 0.4980392, 0, 1,
-1.327889, -0.1811248, -1.39437, 1, 0.5058824, 0, 1,
-1.322496, -0.6629374, -0.7681667, 1, 0.509804, 0, 1,
-1.322285, 0.8676722, -0.4523905, 1, 0.5176471, 0, 1,
-1.312229, 0.6288766, 0.4204687, 1, 0.5215687, 0, 1,
-1.311402, 0.1210206, -2.219399, 1, 0.5294118, 0, 1,
-1.308241, -1.0461, -2.204985, 1, 0.5333334, 0, 1,
-1.2976, 0.6758054, 1.034574, 1, 0.5411765, 0, 1,
-1.285059, 0.2101239, -2.696424, 1, 0.5450981, 0, 1,
-1.281446, 1.350971, -0.8013244, 1, 0.5529412, 0, 1,
-1.279629, 1.208235, -1.098969, 1, 0.5568628, 0, 1,
-1.270902, 0.6680304, -2.119799, 1, 0.5647059, 0, 1,
-1.269016, -0.2335952, -3.072471, 1, 0.5686275, 0, 1,
-1.26397, 0.06500772, -2.583781, 1, 0.5764706, 0, 1,
-1.259545, -1.331908, -1.711986, 1, 0.5803922, 0, 1,
-1.257891, -1.175234, -2.785832, 1, 0.5882353, 0, 1,
-1.249973, 0.8535636, -0.1650107, 1, 0.5921569, 0, 1,
-1.241154, -0.9647343, -3.463815, 1, 0.6, 0, 1,
-1.236839, 0.8829252, 1.001681, 1, 0.6078432, 0, 1,
-1.222224, -0.4325775, -2.359418, 1, 0.6117647, 0, 1,
-1.21828, 0.5854329, 0.2263386, 1, 0.6196079, 0, 1,
-1.210594, 1.14298, -0.7970375, 1, 0.6235294, 0, 1,
-1.206731, 1.335008, -0.1554847, 1, 0.6313726, 0, 1,
-1.205945, -0.05365428, -1.573635, 1, 0.6352941, 0, 1,
-1.199593, 0.8678588, -0.9322446, 1, 0.6431373, 0, 1,
-1.194431, 1.141785, -0.708845, 1, 0.6470588, 0, 1,
-1.191143, -0.1375547, -1.255601, 1, 0.654902, 0, 1,
-1.182454, 1.291121, -0.4908405, 1, 0.6588235, 0, 1,
-1.180365, 0.01990382, -2.568632, 1, 0.6666667, 0, 1,
-1.179724, 2.500349, -0.5326873, 1, 0.6705883, 0, 1,
-1.175495, 0.4752613, -1.067514, 1, 0.6784314, 0, 1,
-1.171829, 0.4795073, -1.026852, 1, 0.682353, 0, 1,
-1.155614, 0.447838, -0.7945217, 1, 0.6901961, 0, 1,
-1.144132, -0.7115703, -1.949024, 1, 0.6941177, 0, 1,
-1.136791, -2.984351, -2.134266, 1, 0.7019608, 0, 1,
-1.134773, 0.5598335, -1.661547, 1, 0.7098039, 0, 1,
-1.119598, 0.5513115, -0.4458141, 1, 0.7137255, 0, 1,
-1.116405, 0.3627415, -1.267554, 1, 0.7215686, 0, 1,
-1.10659, 1.814588, -0.253024, 1, 0.7254902, 0, 1,
-1.100724, -1.480929, -2.632018, 1, 0.7333333, 0, 1,
-1.09836, 2.438277, -1.629231, 1, 0.7372549, 0, 1,
-1.084402, 0.322704, -1.179003, 1, 0.7450981, 0, 1,
-1.079142, -0.9141226, -2.104614, 1, 0.7490196, 0, 1,
-1.077564, 0.9353495, 0.644041, 1, 0.7568628, 0, 1,
-1.076417, 0.4699981, -1.029051, 1, 0.7607843, 0, 1,
-1.070427, 0.9092388, -0.4182169, 1, 0.7686275, 0, 1,
-1.055753, -0.1173408, -1.939592, 1, 0.772549, 0, 1,
-1.051343, -1.919772, -1.048831, 1, 0.7803922, 0, 1,
-1.044823, -1.031884, -2.0723, 1, 0.7843137, 0, 1,
-1.044522, 0.5877703, -0.5055606, 1, 0.7921569, 0, 1,
-1.041876, -0.3549577, -2.608398, 1, 0.7960784, 0, 1,
-1.035783, -0.3539686, -1.212803, 1, 0.8039216, 0, 1,
-1.029776, -2.433263, -3.03574, 1, 0.8117647, 0, 1,
-1.028192, -0.03652138, -1.170008, 1, 0.8156863, 0, 1,
-1.027723, -0.3785258, -1.430953, 1, 0.8235294, 0, 1,
-1.025519, -1.10529, -1.576529, 1, 0.827451, 0, 1,
-1.022397, -0.09513734, -3.68101, 1, 0.8352941, 0, 1,
-1.021558, 0.07847801, -1.73963, 1, 0.8392157, 0, 1,
-1.017693, -2.00607, -1.327711, 1, 0.8470588, 0, 1,
-1.011082, 0.738417, -1.081726, 1, 0.8509804, 0, 1,
-1.005942, 1.645677, -1.851497, 1, 0.8588235, 0, 1,
-1.002646, 0.562322, 0.5534833, 1, 0.8627451, 0, 1,
-1.001916, 0.5508804, -0.3575562, 1, 0.8705882, 0, 1,
-0.9916001, 0.5455532, 0.04771317, 1, 0.8745098, 0, 1,
-0.9914992, 0.05470376, -1.34903, 1, 0.8823529, 0, 1,
-0.9900558, -0.4480602, -1.255214, 1, 0.8862745, 0, 1,
-0.9659681, -0.2375724, -3.508937, 1, 0.8941177, 0, 1,
-0.9656532, 0.2810932, -0.2788533, 1, 0.8980392, 0, 1,
-0.9633557, 0.06125132, -2.251664, 1, 0.9058824, 0, 1,
-0.9627452, -1.544811, -3.701188, 1, 0.9137255, 0, 1,
-0.9595097, -0.9096476, -2.655562, 1, 0.9176471, 0, 1,
-0.9591988, 0.06540822, -1.092777, 1, 0.9254902, 0, 1,
-0.9582438, 0.09005652, 1.776022, 1, 0.9294118, 0, 1,
-0.9521263, -1.307742, -3.270962, 1, 0.9372549, 0, 1,
-0.9421449, -0.02771625, -1.955473, 1, 0.9411765, 0, 1,
-0.9408581, 0.7604275, -1.214689, 1, 0.9490196, 0, 1,
-0.9403908, -2.280264, -1.781382, 1, 0.9529412, 0, 1,
-0.9403656, 0.2784753, -0.5936388, 1, 0.9607843, 0, 1,
-0.919953, -0.8298001, -1.529524, 1, 0.9647059, 0, 1,
-0.9194822, -0.9054295, -0.938829, 1, 0.972549, 0, 1,
-0.9080216, -0.1188158, -0.880744, 1, 0.9764706, 0, 1,
-0.907869, -0.4278233, -2.629815, 1, 0.9843137, 0, 1,
-0.9075135, 1.22412, -0.09486725, 1, 0.9882353, 0, 1,
-0.9059063, -1.055674, -1.652932, 1, 0.9960784, 0, 1,
-0.9007429, -0.1320109, -1.373052, 0.9960784, 1, 0, 1,
-0.8884028, -1.305135, -2.053015, 0.9921569, 1, 0, 1,
-0.8838914, 1.331945, -2.311266, 0.9843137, 1, 0, 1,
-0.8824671, -0.6570114, -3.114883, 0.9803922, 1, 0, 1,
-0.8821431, 1.388283, -1.797508, 0.972549, 1, 0, 1,
-0.880318, -2.806318, -2.30468, 0.9686275, 1, 0, 1,
-0.8676525, 0.09522469, -1.376775, 0.9607843, 1, 0, 1,
-0.8656186, -1.661289, -3.683448, 0.9568627, 1, 0, 1,
-0.864433, -0.6807032, -1.346847, 0.9490196, 1, 0, 1,
-0.8630813, -0.9031686, -2.719439, 0.945098, 1, 0, 1,
-0.8619601, -0.720915, -0.216872, 0.9372549, 1, 0, 1,
-0.8615905, 0.04316823, -0.167726, 0.9333333, 1, 0, 1,
-0.8615563, -1.124299, -2.981002, 0.9254902, 1, 0, 1,
-0.8612716, 0.4152498, -2.830117, 0.9215686, 1, 0, 1,
-0.8573212, -1.346854, -2.317173, 0.9137255, 1, 0, 1,
-0.8553238, 0.5737399, 0.08458136, 0.9098039, 1, 0, 1,
-0.8531194, 0.6559709, -0.1909098, 0.9019608, 1, 0, 1,
-0.840607, -3.406976, -3.645179, 0.8941177, 1, 0, 1,
-0.8385351, -0.6366361, -1.650826, 0.8901961, 1, 0, 1,
-0.8366929, -0.3268844, -2.15202, 0.8823529, 1, 0, 1,
-0.8355662, 0.4953682, -0.7727655, 0.8784314, 1, 0, 1,
-0.8329967, 0.1288761, -2.415818, 0.8705882, 1, 0, 1,
-0.8304547, -0.2114766, -2.380981, 0.8666667, 1, 0, 1,
-0.8189267, 1.05189, -1.457109, 0.8588235, 1, 0, 1,
-0.8104634, -0.1486625, -2.573294, 0.854902, 1, 0, 1,
-0.8065504, -1.309179, -2.738317, 0.8470588, 1, 0, 1,
-0.8035218, -0.3826035, -2.786653, 0.8431373, 1, 0, 1,
-0.7995915, -1.079212, -2.880645, 0.8352941, 1, 0, 1,
-0.7954459, 0.2249052, 0.794394, 0.8313726, 1, 0, 1,
-0.7893662, -0.2096519, -2.37984, 0.8235294, 1, 0, 1,
-0.788351, 0.398573, -2.005281, 0.8196079, 1, 0, 1,
-0.7826682, -0.2135274, -0.6870138, 0.8117647, 1, 0, 1,
-0.781511, -0.1513019, -3.232219, 0.8078431, 1, 0, 1,
-0.7807616, -0.1436099, 0.7531051, 0.8, 1, 0, 1,
-0.7779814, 1.773664, 1.326471, 0.7921569, 1, 0, 1,
-0.7725531, -1.043574, -3.98714, 0.7882353, 1, 0, 1,
-0.7647862, -0.7365774, -1.661305, 0.7803922, 1, 0, 1,
-0.7643243, 0.6359971, 0.5909229, 0.7764706, 1, 0, 1,
-0.7623445, 0.6279622, -0.6087382, 0.7686275, 1, 0, 1,
-0.7611849, 0.2545369, 1.438248, 0.7647059, 1, 0, 1,
-0.7610056, -0.8077704, -2.554524, 0.7568628, 1, 0, 1,
-0.7600509, 0.6194606, 0.3818581, 0.7529412, 1, 0, 1,
-0.7539659, 1.283478, 0.1129578, 0.7450981, 1, 0, 1,
-0.7410854, 0.6670354, -0.3309365, 0.7411765, 1, 0, 1,
-0.7403381, 0.1547733, -2.004854, 0.7333333, 1, 0, 1,
-0.7394674, 1.490744, -1.51734, 0.7294118, 1, 0, 1,
-0.7309295, -0.1721212, -1.764494, 0.7215686, 1, 0, 1,
-0.7292166, -0.6030743, -2.032897, 0.7176471, 1, 0, 1,
-0.727309, -0.2978818, -1.906917, 0.7098039, 1, 0, 1,
-0.7212741, -0.9381881, -2.611195, 0.7058824, 1, 0, 1,
-0.7197502, -0.3978625, -3.176934, 0.6980392, 1, 0, 1,
-0.7190037, 0.2283906, -2.845967, 0.6901961, 1, 0, 1,
-0.718796, -1.136409, -3.79127, 0.6862745, 1, 0, 1,
-0.7152097, 0.1609289, -1.507238, 0.6784314, 1, 0, 1,
-0.7122067, 0.534288, -1.431572, 0.6745098, 1, 0, 1,
-0.7110538, 0.7420018, -2.29079, 0.6666667, 1, 0, 1,
-0.7025236, -1.232213, -2.360821, 0.6627451, 1, 0, 1,
-0.6995995, 1.324543, -0.308679, 0.654902, 1, 0, 1,
-0.6975341, -0.8857939, -2.761897, 0.6509804, 1, 0, 1,
-0.6964642, -0.1120625, -3.233298, 0.6431373, 1, 0, 1,
-0.6942362, 0.7608428, -1.264862, 0.6392157, 1, 0, 1,
-0.6930505, -0.6326418, -1.982867, 0.6313726, 1, 0, 1,
-0.6902514, 1.349942, -0.06986497, 0.627451, 1, 0, 1,
-0.68157, -1.449842, -2.911233, 0.6196079, 1, 0, 1,
-0.676768, -0.4619952, -1.629529, 0.6156863, 1, 0, 1,
-0.6750573, -0.1503339, -4.463911, 0.6078432, 1, 0, 1,
-0.6697901, -0.8354133, -3.431838, 0.6039216, 1, 0, 1,
-0.6632596, -0.5339566, -2.896713, 0.5960785, 1, 0, 1,
-0.6581152, 0.294242, -1.884307, 0.5882353, 1, 0, 1,
-0.6563588, 0.3045337, -0.4550301, 0.5843138, 1, 0, 1,
-0.6531267, 1.285742, -0.4957533, 0.5764706, 1, 0, 1,
-0.644942, -0.1184946, -3.490749, 0.572549, 1, 0, 1,
-0.6447651, 0.5440146, -0.9412707, 0.5647059, 1, 0, 1,
-0.6397625, 1.100132, -0.7830907, 0.5607843, 1, 0, 1,
-0.6313146, -0.2129388, -1.898905, 0.5529412, 1, 0, 1,
-0.6265199, -0.1947112, -0.3097391, 0.5490196, 1, 0, 1,
-0.6246299, -0.6535565, -2.949273, 0.5411765, 1, 0, 1,
-0.6235061, -2.085455, -3.175107, 0.5372549, 1, 0, 1,
-0.6118034, 1.66234, -1.704994, 0.5294118, 1, 0, 1,
-0.6088986, 0.3483526, -1.914158, 0.5254902, 1, 0, 1,
-0.5959023, 0.4120436, -1.670838, 0.5176471, 1, 0, 1,
-0.5902424, 0.4791424, -1.877305, 0.5137255, 1, 0, 1,
-0.5860462, -0.5978122, -3.169858, 0.5058824, 1, 0, 1,
-0.5856802, 0.4466408, -1.295674, 0.5019608, 1, 0, 1,
-0.5798054, 0.2899354, -1.134331, 0.4941176, 1, 0, 1,
-0.5729232, -1.247106, -3.035505, 0.4862745, 1, 0, 1,
-0.5728149, 0.619003, 0.3651864, 0.4823529, 1, 0, 1,
-0.5726179, -1.456724, -2.733269, 0.4745098, 1, 0, 1,
-0.563463, -1.651137, -2.131481, 0.4705882, 1, 0, 1,
-0.5543774, -0.4361944, -2.291186, 0.4627451, 1, 0, 1,
-0.549592, -1.010601, -4.667567, 0.4588235, 1, 0, 1,
-0.5434775, -0.7567384, -2.12681, 0.4509804, 1, 0, 1,
-0.5388454, -0.3398336, 0.8086802, 0.4470588, 1, 0, 1,
-0.5381779, 0.5233831, -1.242959, 0.4392157, 1, 0, 1,
-0.5327256, 0.6526184, 0.4194577, 0.4352941, 1, 0, 1,
-0.5311179, 0.1755891, -1.571485, 0.427451, 1, 0, 1,
-0.5288405, 1.137439, 0.8667415, 0.4235294, 1, 0, 1,
-0.5268896, -0.02862475, -3.774958, 0.4156863, 1, 0, 1,
-0.5255948, -1.385855, -3.124002, 0.4117647, 1, 0, 1,
-0.5251307, 0.1542338, -2.526427, 0.4039216, 1, 0, 1,
-0.5223719, -0.5678462, -4.600394, 0.3960784, 1, 0, 1,
-0.5181558, -0.8429695, -2.76315, 0.3921569, 1, 0, 1,
-0.5147023, -0.8190261, -3.45766, 0.3843137, 1, 0, 1,
-0.5105206, -0.9612253, -1.648484, 0.3803922, 1, 0, 1,
-0.5088802, -0.6832631, -1.736656, 0.372549, 1, 0, 1,
-0.5087993, 1.837166, -0.9163179, 0.3686275, 1, 0, 1,
-0.5078568, -0.01805509, -1.483334, 0.3607843, 1, 0, 1,
-0.5070069, -0.4829498, -2.404885, 0.3568628, 1, 0, 1,
-0.504498, 0.05488412, -0.9435472, 0.3490196, 1, 0, 1,
-0.5027011, -1.002352, -4.007009, 0.345098, 1, 0, 1,
-0.5023283, -1.049411, -1.839423, 0.3372549, 1, 0, 1,
-0.4977212, -0.03134421, -1.304604, 0.3333333, 1, 0, 1,
-0.4908449, -0.2492798, -2.211276, 0.3254902, 1, 0, 1,
-0.487041, 0.5443799, -0.4943729, 0.3215686, 1, 0, 1,
-0.4853801, 0.8215797, 0.1314902, 0.3137255, 1, 0, 1,
-0.4849042, 1.787294, 0.7534996, 0.3098039, 1, 0, 1,
-0.4834257, -0.07910042, -2.596074, 0.3019608, 1, 0, 1,
-0.4821839, -0.9446209, -3.559346, 0.2941177, 1, 0, 1,
-0.4814617, -0.785694, -2.966207, 0.2901961, 1, 0, 1,
-0.479904, -0.4689482, -2.378226, 0.282353, 1, 0, 1,
-0.4754162, -0.4482255, -1.034233, 0.2784314, 1, 0, 1,
-0.4731404, -1.75982, -2.672257, 0.2705882, 1, 0, 1,
-0.472317, -0.6794285, -2.648307, 0.2666667, 1, 0, 1,
-0.4705269, -0.8103, -1.144332, 0.2588235, 1, 0, 1,
-0.4701652, -1.536677, -2.634689, 0.254902, 1, 0, 1,
-0.4691104, 1.760562, 0.6795447, 0.2470588, 1, 0, 1,
-0.4683496, 0.6936973, -0.8420571, 0.2431373, 1, 0, 1,
-0.4670216, 1.721334, 0.2625317, 0.2352941, 1, 0, 1,
-0.4567625, 0.02516927, -2.390479, 0.2313726, 1, 0, 1,
-0.4527515, 0.4173835, -0.3841009, 0.2235294, 1, 0, 1,
-0.4526176, 1.81141, 1.268711, 0.2196078, 1, 0, 1,
-0.4516942, 0.7207533, -0.7460221, 0.2117647, 1, 0, 1,
-0.4492407, 0.6987795, 0.5764391, 0.2078431, 1, 0, 1,
-0.4471877, -0.1419714, -1.275817, 0.2, 1, 0, 1,
-0.44605, -1.040904, -3.222056, 0.1921569, 1, 0, 1,
-0.4438214, -0.3028483, -3.039387, 0.1882353, 1, 0, 1,
-0.4437306, -0.3969994, -2.219171, 0.1803922, 1, 0, 1,
-0.4424037, -0.4059485, -3.239202, 0.1764706, 1, 0, 1,
-0.4409727, -0.3179398, -1.699857, 0.1686275, 1, 0, 1,
-0.4390993, 0.9815018, 1.470108, 0.1647059, 1, 0, 1,
-0.4338724, -0.2390727, -1.822861, 0.1568628, 1, 0, 1,
-0.4327535, -0.2312436, -2.154934, 0.1529412, 1, 0, 1,
-0.4274863, 0.3035861, -1.684353, 0.145098, 1, 0, 1,
-0.4233747, 1.042976, 0.58993, 0.1411765, 1, 0, 1,
-0.4209816, 0.1301237, -1.335506, 0.1333333, 1, 0, 1,
-0.41621, 0.7852082, -0.790118, 0.1294118, 1, 0, 1,
-0.4157577, -0.04093004, -1.469534, 0.1215686, 1, 0, 1,
-0.4128011, 1.780597, 0.8321775, 0.1176471, 1, 0, 1,
-0.4127395, -1.367997, -3.05987, 0.1098039, 1, 0, 1,
-0.3975383, -0.08808732, -1.938659, 0.1058824, 1, 0, 1,
-0.394659, 0.3285806, -0.8718279, 0.09803922, 1, 0, 1,
-0.38963, -0.1489312, -2.208465, 0.09019608, 1, 0, 1,
-0.3882127, -0.4428809, -1.936977, 0.08627451, 1, 0, 1,
-0.3853238, 0.5766751, -0.6208102, 0.07843138, 1, 0, 1,
-0.3842303, -0.26195, -2.785468, 0.07450981, 1, 0, 1,
-0.3731807, 1.947058, -0.7605186, 0.06666667, 1, 0, 1,
-0.3727125, 0.07066368, -3.472662, 0.0627451, 1, 0, 1,
-0.3650112, -1.231395, -2.073055, 0.05490196, 1, 0, 1,
-0.361207, -0.6291006, -2.223858, 0.05098039, 1, 0, 1,
-0.3600349, -0.9097859, -0.9923664, 0.04313726, 1, 0, 1,
-0.3595704, 2.877244, 1.519574, 0.03921569, 1, 0, 1,
-0.3592615, 1.30526, -0.1085625, 0.03137255, 1, 0, 1,
-0.3587647, -0.2873522, -1.494207, 0.02745098, 1, 0, 1,
-0.3541947, 1.171705, 0.1825052, 0.01960784, 1, 0, 1,
-0.3523078, 0.5912885, -0.2138814, 0.01568628, 1, 0, 1,
-0.3482447, 0.3255904, -1.337524, 0.007843138, 1, 0, 1,
-0.3481833, 0.1775133, -0.1287807, 0.003921569, 1, 0, 1,
-0.3470111, 0.3232353, 0.856629, 0, 1, 0.003921569, 1,
-0.345663, 1.19346, -0.03651821, 0, 1, 0.01176471, 1,
-0.3443125, -1.234868, -2.38432, 0, 1, 0.01568628, 1,
-0.344108, -1.048708, -3.037752, 0, 1, 0.02352941, 1,
-0.3429933, 0.7389835, 1.578302, 0, 1, 0.02745098, 1,
-0.3367178, -0.3503565, -3.618261, 0, 1, 0.03529412, 1,
-0.3273809, 0.008993706, 0.1415443, 0, 1, 0.03921569, 1,
-0.3238392, 0.8499482, 0.2919758, 0, 1, 0.04705882, 1,
-0.320942, 1.278289, -0.1064135, 0, 1, 0.05098039, 1,
-0.3190124, -0.6819621, -3.200916, 0, 1, 0.05882353, 1,
-0.3169194, 0.1111059, -0.6886613, 0, 1, 0.0627451, 1,
-0.3139021, 0.2182037, 0.1804535, 0, 1, 0.07058824, 1,
-0.3118976, -0.8599364, -3.493662, 0, 1, 0.07450981, 1,
-0.31131, 0.5317571, -2.615345, 0, 1, 0.08235294, 1,
-0.3081884, 0.4633795, -0.05254518, 0, 1, 0.08627451, 1,
-0.3062603, -1.13969, -1.399511, 0, 1, 0.09411765, 1,
-0.2958151, 1.273308, 1.387558, 0, 1, 0.1019608, 1,
-0.2950526, 0.8378886, -0.8580577, 0, 1, 0.1058824, 1,
-0.2948864, 0.2553201, 0.1556449, 0, 1, 0.1137255, 1,
-0.2919221, 1.175012, 0.3518562, 0, 1, 0.1176471, 1,
-0.2916766, -1.137769, -2.679816, 0, 1, 0.1254902, 1,
-0.2887484, 0.8676859, 0.7413803, 0, 1, 0.1294118, 1,
-0.2875298, -0.1312839, -4.440718, 0, 1, 0.1372549, 1,
-0.2842539, -1.05919, -2.681491, 0, 1, 0.1411765, 1,
-0.2662223, -1.049708, -4.146333, 0, 1, 0.1490196, 1,
-0.2623127, -0.6473067, -3.775889, 0, 1, 0.1529412, 1,
-0.2610017, 0.03618889, -1.791482, 0, 1, 0.1607843, 1,
-0.2545476, 0.2700904, 0.6977228, 0, 1, 0.1647059, 1,
-0.2479125, 1.328387, -0.556453, 0, 1, 0.172549, 1,
-0.2459275, 0.1713272, -1.339676, 0, 1, 0.1764706, 1,
-0.2458857, -0.8779078, -2.805306, 0, 1, 0.1843137, 1,
-0.2411308, 0.5232393, -1.053018, 0, 1, 0.1882353, 1,
-0.237496, -0.6799392, -2.60501, 0, 1, 0.1960784, 1,
-0.2355956, -0.04428296, 0.631137, 0, 1, 0.2039216, 1,
-0.2300728, 1.339994, -0.4465123, 0, 1, 0.2078431, 1,
-0.2295061, 0.9927426, -1.679332, 0, 1, 0.2156863, 1,
-0.2238933, -0.2645767, -2.169685, 0, 1, 0.2196078, 1,
-0.2184908, -1.105222, -2.686153, 0, 1, 0.227451, 1,
-0.2158333, 0.2444754, -0.4929329, 0, 1, 0.2313726, 1,
-0.2153012, -1.603133, -4.438611, 0, 1, 0.2392157, 1,
-0.2126578, -0.1968618, -2.892467, 0, 1, 0.2431373, 1,
-0.20941, -1.646585, -1.412552, 0, 1, 0.2509804, 1,
-0.2068004, -0.1779116, -3.121839, 0, 1, 0.254902, 1,
-0.2043702, 1.860821, -0.5012466, 0, 1, 0.2627451, 1,
-0.1987705, -0.3039391, -1.422575, 0, 1, 0.2666667, 1,
-0.1960207, 0.1960432, -1.332653, 0, 1, 0.2745098, 1,
-0.1945104, 1.198577, 0.6120431, 0, 1, 0.2784314, 1,
-0.1939076, -0.5376561, -4.440421, 0, 1, 0.2862745, 1,
-0.193484, -0.2099894, -3.597635, 0, 1, 0.2901961, 1,
-0.1928438, -1.843398, -2.300511, 0, 1, 0.2980392, 1,
-0.1883305, -0.9366271, -3.23744, 0, 1, 0.3058824, 1,
-0.1883088, 1.755455, -1.210724, 0, 1, 0.3098039, 1,
-0.1846408, 2.732994, 1.442856, 0, 1, 0.3176471, 1,
-0.1810923, -1.312562, -2.263385, 0, 1, 0.3215686, 1,
-0.1756237, 2.453987, -0.09122091, 0, 1, 0.3294118, 1,
-0.175179, -1.890851, -2.265475, 0, 1, 0.3333333, 1,
-0.172449, -0.493435, -4.092901, 0, 1, 0.3411765, 1,
-0.1723291, -0.9628168, -4.11352, 0, 1, 0.345098, 1,
-0.1626309, 1.003628, -1.32537, 0, 1, 0.3529412, 1,
-0.1608806, 1.414179, -0.419546, 0, 1, 0.3568628, 1,
-0.1595498, -0.6941931, -2.39286, 0, 1, 0.3647059, 1,
-0.1582727, 0.7834868, 1.496917, 0, 1, 0.3686275, 1,
-0.1550293, 0.127379, -1.17532, 0, 1, 0.3764706, 1,
-0.1543581, -0.5213892, -2.308069, 0, 1, 0.3803922, 1,
-0.147326, 0.1576603, 0.757829, 0, 1, 0.3882353, 1,
-0.145144, 1.140464, -0.07699536, 0, 1, 0.3921569, 1,
-0.1427736, 1.660109, 0.3257907, 0, 1, 0.4, 1,
-0.1362323, 0.03186451, -0.488443, 0, 1, 0.4078431, 1,
-0.1321263, 1.55444, 0.8075314, 0, 1, 0.4117647, 1,
-0.1317014, -0.6196848, -1.960903, 0, 1, 0.4196078, 1,
-0.131051, 0.2212626, -1.42943, 0, 1, 0.4235294, 1,
-0.1294727, -1.310784, -3.488966, 0, 1, 0.4313726, 1,
-0.1287907, 3.326309, -1.09813, 0, 1, 0.4352941, 1,
-0.1279708, -0.5516607, -2.223171, 0, 1, 0.4431373, 1,
-0.1240574, 1.626606, 0.1226392, 0, 1, 0.4470588, 1,
-0.1237608, -0.01954142, -1.992524, 0, 1, 0.454902, 1,
-0.1206973, 0.4497637, -0.9383722, 0, 1, 0.4588235, 1,
-0.1196945, -2.266051, -2.398823, 0, 1, 0.4666667, 1,
-0.1193214, -0.9585678, -4.172194, 0, 1, 0.4705882, 1,
-0.1192799, 0.633001, -0.4104306, 0, 1, 0.4784314, 1,
-0.1182308, -0.08117625, -1.945682, 0, 1, 0.4823529, 1,
-0.1172789, 0.9959531, 0.04739349, 0, 1, 0.4901961, 1,
-0.1151694, 0.007636402, 0.2696451, 0, 1, 0.4941176, 1,
-0.1148343, -0.8944315, -1.612017, 0, 1, 0.5019608, 1,
-0.1135627, 1.525967, 0.2657112, 0, 1, 0.509804, 1,
-0.1122204, -0.3435667, -1.186848, 0, 1, 0.5137255, 1,
-0.1068172, -0.2109839, -3.243129, 0, 1, 0.5215687, 1,
-0.1061027, 0.2138178, -1.690286, 0, 1, 0.5254902, 1,
-0.105704, 0.5102512, 0.2006478, 0, 1, 0.5333334, 1,
-0.1046503, -1.158694, -3.227879, 0, 1, 0.5372549, 1,
-0.1010601, -1.347557, -1.698274, 0, 1, 0.5450981, 1,
-0.09619834, -0.1465173, 0.002530604, 0, 1, 0.5490196, 1,
-0.09252058, 1.081287, 0.4745419, 0, 1, 0.5568628, 1,
-0.09189273, 0.6170575, -1.302986, 0, 1, 0.5607843, 1,
-0.08977099, 1.793297, 0.9006694, 0, 1, 0.5686275, 1,
-0.08825405, 0.4088137, 0.07499864, 0, 1, 0.572549, 1,
-0.08060429, -0.4959839, -1.723696, 0, 1, 0.5803922, 1,
-0.08013277, 1.005338, 0.4771233, 0, 1, 0.5843138, 1,
-0.07771509, -0.9933448, -2.687003, 0, 1, 0.5921569, 1,
-0.07594537, -0.1935557, -0.1219128, 0, 1, 0.5960785, 1,
-0.07336814, -0.3067395, -4.390125, 0, 1, 0.6039216, 1,
-0.06815295, 0.3212657, -0.2975543, 0, 1, 0.6117647, 1,
-0.06647919, -0.139253, -2.904137, 0, 1, 0.6156863, 1,
-0.0628376, -0.4050197, -2.282534, 0, 1, 0.6235294, 1,
-0.06056855, -0.5751709, -1.811023, 0, 1, 0.627451, 1,
-0.05827486, 1.699965, 0.2703124, 0, 1, 0.6352941, 1,
-0.05805854, 1.243027, 0.6691918, 0, 1, 0.6392157, 1,
-0.05404248, -0.317859, -4.458869, 0, 1, 0.6470588, 1,
-0.05140481, 1.078871, 0.1542294, 0, 1, 0.6509804, 1,
-0.04720318, 0.5402753, 1.399362, 0, 1, 0.6588235, 1,
-0.03361485, -0.8466108, -2.350793, 0, 1, 0.6627451, 1,
-0.0270825, -1.324004, -4.049685, 0, 1, 0.6705883, 1,
-0.02491031, -0.1625542, -2.157235, 0, 1, 0.6745098, 1,
-0.02283951, -1.069548, -2.753829, 0, 1, 0.682353, 1,
-0.01541293, -0.5887681, -2.932678, 0, 1, 0.6862745, 1,
-0.01528594, 0.5411278, -1.084987, 0, 1, 0.6941177, 1,
-0.01491807, -0.4527537, -3.483825, 0, 1, 0.7019608, 1,
-0.01370432, 0.2267339, -0.1037945, 0, 1, 0.7058824, 1,
-0.003927566, 0.03498505, 1.569721, 0, 1, 0.7137255, 1,
-0.0006575427, 0.6474625, 1.282051, 0, 1, 0.7176471, 1,
0.004535633, 0.3058299, 1.604433, 0, 1, 0.7254902, 1,
0.005721873, -1.884878, 3.637136, 0, 1, 0.7294118, 1,
0.005738394, 1.257967, 0.1216737, 0, 1, 0.7372549, 1,
0.006767657, -2.196534, 2.829769, 0, 1, 0.7411765, 1,
0.009146771, 0.2199386, 0.6731573, 0, 1, 0.7490196, 1,
0.01046151, -3.563495, 2.755251, 0, 1, 0.7529412, 1,
0.01272304, 1.339432, -0.01595999, 0, 1, 0.7607843, 1,
0.01368432, -0.7289768, 3.65842, 0, 1, 0.7647059, 1,
0.01436893, 0.2387763, 0.9566391, 0, 1, 0.772549, 1,
0.01649661, -0.7230853, 4.009852, 0, 1, 0.7764706, 1,
0.01702308, -0.4560654, 3.997097, 0, 1, 0.7843137, 1,
0.01785786, 1.186789, -1.00159, 0, 1, 0.7882353, 1,
0.01965543, 1.558947, 0.6967802, 0, 1, 0.7960784, 1,
0.02509115, 0.1820381, 0.841651, 0, 1, 0.8039216, 1,
0.02755457, -0.6983415, 2.513421, 0, 1, 0.8078431, 1,
0.02862591, 1.249568, -0.1766604, 0, 1, 0.8156863, 1,
0.02925391, -0.06096384, 1.778437, 0, 1, 0.8196079, 1,
0.03295625, 0.1130144, -0.4675686, 0, 1, 0.827451, 1,
0.03314171, 2.103025, -0.2994258, 0, 1, 0.8313726, 1,
0.04463295, -0.4252992, 2.811425, 0, 1, 0.8392157, 1,
0.04640171, -0.9814771, 3.213782, 0, 1, 0.8431373, 1,
0.0532816, -0.9764768, 3.650399, 0, 1, 0.8509804, 1,
0.05416326, -1.526865, 2.355694, 0, 1, 0.854902, 1,
0.05962507, 0.5183162, 1.364392, 0, 1, 0.8627451, 1,
0.06116581, -1.626764, 3.464688, 0, 1, 0.8666667, 1,
0.06733911, 1.660559, 0.6324836, 0, 1, 0.8745098, 1,
0.06843417, -0.3512777, 3.056893, 0, 1, 0.8784314, 1,
0.07163586, -0.2983657, 2.073922, 0, 1, 0.8862745, 1,
0.07255927, 0.1870452, -0.3575076, 0, 1, 0.8901961, 1,
0.07500792, -2.226659, 2.959065, 0, 1, 0.8980392, 1,
0.07548818, -0.2560784, 1.117035, 0, 1, 0.9058824, 1,
0.07558525, 0.7395482, 1.470914, 0, 1, 0.9098039, 1,
0.0758846, 0.3478231, -0.6244323, 0, 1, 0.9176471, 1,
0.07598516, 1.273534, -1.958688, 0, 1, 0.9215686, 1,
0.07761444, -0.7561466, 2.697076, 0, 1, 0.9294118, 1,
0.07873372, -1.644387, 3.210625, 0, 1, 0.9333333, 1,
0.08077812, 2.122654, -1.004372, 0, 1, 0.9411765, 1,
0.0815701, 0.7003796, -1.361442, 0, 1, 0.945098, 1,
0.08259866, -0.3946775, 3.507351, 0, 1, 0.9529412, 1,
0.08285178, -0.5692871, 2.453473, 0, 1, 0.9568627, 1,
0.08345571, 0.7487978, -0.08772235, 0, 1, 0.9647059, 1,
0.08595211, -2.651461, 2.641314, 0, 1, 0.9686275, 1,
0.08744664, -1.95746, 1.938978, 0, 1, 0.9764706, 1,
0.08768784, 0.002369306, 1.58086, 0, 1, 0.9803922, 1,
0.08816859, -0.2042534, 2.427654, 0, 1, 0.9882353, 1,
0.08870133, -0.3308529, 4.474518, 0, 1, 0.9921569, 1,
0.0962327, -1.510675, 1.602044, 0, 1, 1, 1,
0.09733952, -0.430844, 3.38278, 0, 0.9921569, 1, 1,
0.09883966, -1.785184, 3.853612, 0, 0.9882353, 1, 1,
0.1001747, 1.193833, 0.839768, 0, 0.9803922, 1, 1,
0.1032483, -1.893225, 3.048781, 0, 0.9764706, 1, 1,
0.1083372, -1.114565, 4.014024, 0, 0.9686275, 1, 1,
0.1086989, -1.685382, 2.218969, 0, 0.9647059, 1, 1,
0.112922, 0.2156241, 1.017309, 0, 0.9568627, 1, 1,
0.1201797, 0.1858663, -0.07627041, 0, 0.9529412, 1, 1,
0.1227637, -0.9738771, 2.977688, 0, 0.945098, 1, 1,
0.1250877, -0.2158129, 2.876997, 0, 0.9411765, 1, 1,
0.126993, -0.3913645, 4.440736, 0, 0.9333333, 1, 1,
0.1328381, 0.7934013, -0.3998463, 0, 0.9294118, 1, 1,
0.133376, 1.853837, -0.5508532, 0, 0.9215686, 1, 1,
0.1335306, -0.5161791, 1.37801, 0, 0.9176471, 1, 1,
0.1378858, 1.072374, 1.462188, 0, 0.9098039, 1, 1,
0.1391837, 0.4400043, -0.09750563, 0, 0.9058824, 1, 1,
0.1441275, -1.839148, 4.966342, 0, 0.8980392, 1, 1,
0.1513682, 0.2730196, 0.9870252, 0, 0.8901961, 1, 1,
0.1554111, -0.3762895, 1.169031, 0, 0.8862745, 1, 1,
0.1556099, -1.968514, 1.917137, 0, 0.8784314, 1, 1,
0.1580964, 1.292846, 1.419835, 0, 0.8745098, 1, 1,
0.1619493, 0.9401365, -0.02040123, 0, 0.8666667, 1, 1,
0.16314, 1.309505, -0.5635608, 0, 0.8627451, 1, 1,
0.1653794, 0.9085578, -0.9117228, 0, 0.854902, 1, 1,
0.1718265, -0.355332, 2.216348, 0, 0.8509804, 1, 1,
0.1723022, 1.613799, 0.8893635, 0, 0.8431373, 1, 1,
0.1764167, -1.074926, 2.811379, 0, 0.8392157, 1, 1,
0.1793841, -0.804968, 2.541269, 0, 0.8313726, 1, 1,
0.1820669, -2.299716, 0.593425, 0, 0.827451, 1, 1,
0.1855015, -0.787501, 4.0558, 0, 0.8196079, 1, 1,
0.1859843, -0.7378763, 3.63679, 0, 0.8156863, 1, 1,
0.1920859, -0.003462577, 1.545162, 0, 0.8078431, 1, 1,
0.1927146, -0.8243259, 2.972462, 0, 0.8039216, 1, 1,
0.1958919, -0.9784582, 2.206148, 0, 0.7960784, 1, 1,
0.2028158, 0.6371323, -0.2593547, 0, 0.7882353, 1, 1,
0.2033872, 0.8309507, -0.2769631, 0, 0.7843137, 1, 1,
0.2035553, -0.3620219, 1.868186, 0, 0.7764706, 1, 1,
0.2039474, -0.2542785, 2.687187, 0, 0.772549, 1, 1,
0.2064717, -0.2620832, 1.007343, 0, 0.7647059, 1, 1,
0.206888, -1.835395, 1.706181, 0, 0.7607843, 1, 1,
0.2139955, 0.6672192, -0.1240192, 0, 0.7529412, 1, 1,
0.2141357, 1.484253, -0.2912681, 0, 0.7490196, 1, 1,
0.2161867, 0.8283019, 0.9130765, 0, 0.7411765, 1, 1,
0.2192338, -0.5081961, 2.494202, 0, 0.7372549, 1, 1,
0.2215679, -0.605117, 4.083619, 0, 0.7294118, 1, 1,
0.2224962, 0.575844, -0.1449759, 0, 0.7254902, 1, 1,
0.2250186, -0.7511307, 1.544832, 0, 0.7176471, 1, 1,
0.2270447, -1.615959, 3.08674, 0, 0.7137255, 1, 1,
0.2294952, -1.350949, 5.009685, 0, 0.7058824, 1, 1,
0.2379966, 1.313565, -0.7158313, 0, 0.6980392, 1, 1,
0.2387444, 0.2935668, 0.07430514, 0, 0.6941177, 1, 1,
0.2387966, -1.343077, 3.022575, 0, 0.6862745, 1, 1,
0.2392785, 0.1305968, -2.331924, 0, 0.682353, 1, 1,
0.2396542, 0.5699722, 0.2516862, 0, 0.6745098, 1, 1,
0.2431742, -1.733434, 2.846149, 0, 0.6705883, 1, 1,
0.2584273, 0.2352467, -0.4865785, 0, 0.6627451, 1, 1,
0.2611621, 0.08290403, 2.027138, 0, 0.6588235, 1, 1,
0.2626835, 1.043709, 0.4276854, 0, 0.6509804, 1, 1,
0.2713012, 1.133722, -1.334576, 0, 0.6470588, 1, 1,
0.2752557, 1.887597, -0.144283, 0, 0.6392157, 1, 1,
0.2758138, 0.2590013, 1.476012, 0, 0.6352941, 1, 1,
0.2802052, -0.5602223, 2.373934, 0, 0.627451, 1, 1,
0.2840719, 2.214923, -0.4973599, 0, 0.6235294, 1, 1,
0.2891993, 1.03264, 0.0143967, 0, 0.6156863, 1, 1,
0.2917184, 0.5938929, -0.4192408, 0, 0.6117647, 1, 1,
0.2938159, -1.579943, 1.607419, 0, 0.6039216, 1, 1,
0.2959918, -1.216253, 3.217789, 0, 0.5960785, 1, 1,
0.2962237, -1.90588, 3.113241, 0, 0.5921569, 1, 1,
0.2985345, -1.890328, 3.572749, 0, 0.5843138, 1, 1,
0.299949, 0.2935075, 2.308616, 0, 0.5803922, 1, 1,
0.3013071, -1.345233, 4.737837, 0, 0.572549, 1, 1,
0.3020212, -0.7251919, 3.425745, 0, 0.5686275, 1, 1,
0.3032513, 0.7683143, -1.114674, 0, 0.5607843, 1, 1,
0.3045696, 1.575991, 1.702952, 0, 0.5568628, 1, 1,
0.3049907, -0.6759655, 3.514838, 0, 0.5490196, 1, 1,
0.3121344, -0.0499742, 1.098345, 0, 0.5450981, 1, 1,
0.3134425, 0.327335, 0.6522348, 0, 0.5372549, 1, 1,
0.3145113, -0.7077894, 2.726705, 0, 0.5333334, 1, 1,
0.3162308, 0.6039426, 1.312405, 0, 0.5254902, 1, 1,
0.3208517, -1.471373, 1.733973, 0, 0.5215687, 1, 1,
0.3314731, 0.4410876, 2.962363, 0, 0.5137255, 1, 1,
0.3378384, 0.6989449, 0.323282, 0, 0.509804, 1, 1,
0.3386087, 0.1359474, 1.27654, 0, 0.5019608, 1, 1,
0.3472424, 0.2105746, 0.6198501, 0, 0.4941176, 1, 1,
0.3474143, -0.8436607, 4.246694, 0, 0.4901961, 1, 1,
0.3544781, -0.3037286, 1.157754, 0, 0.4823529, 1, 1,
0.3569437, -0.7085887, 4.852169, 0, 0.4784314, 1, 1,
0.3615817, -0.786553, 2.68028, 0, 0.4705882, 1, 1,
0.3673615, 0.7495992, 0.6548989, 0, 0.4666667, 1, 1,
0.3719465, 0.5855211, 0.6781033, 0, 0.4588235, 1, 1,
0.3739282, 0.05131401, 2.088506, 0, 0.454902, 1, 1,
0.3740244, 0.3766918, 1.320152, 0, 0.4470588, 1, 1,
0.3741689, -0.2149712, 1.80388, 0, 0.4431373, 1, 1,
0.3757787, -0.4818957, 1.077388, 0, 0.4352941, 1, 1,
0.376359, 0.6898176, 0.3886507, 0, 0.4313726, 1, 1,
0.3767098, 2.025437, -0.986967, 0, 0.4235294, 1, 1,
0.3772747, 1.010587, 2.183472, 0, 0.4196078, 1, 1,
0.377869, -0.8277153, 2.939482, 0, 0.4117647, 1, 1,
0.3787634, 0.5221485, -1.720265, 0, 0.4078431, 1, 1,
0.3867355, 0.01256844, 1.577993, 0, 0.4, 1, 1,
0.398825, 2.29027, 1.077519, 0, 0.3921569, 1, 1,
0.402901, 0.2458835, 1.179639, 0, 0.3882353, 1, 1,
0.4029022, -2.017416, 3.08494, 0, 0.3803922, 1, 1,
0.4035816, 0.1594983, 2.659457, 0, 0.3764706, 1, 1,
0.4059938, -1.488688, 2.139546, 0, 0.3686275, 1, 1,
0.4079874, -0.01127642, 2.588789, 0, 0.3647059, 1, 1,
0.4088174, 0.03146245, 2.273759, 0, 0.3568628, 1, 1,
0.4134278, 0.3963634, -1.128301, 0, 0.3529412, 1, 1,
0.4149234, 2.029369, 1.489733, 0, 0.345098, 1, 1,
0.4174109, -0.5982597, 3.839867, 0, 0.3411765, 1, 1,
0.4291486, 1.20473, -0.654703, 0, 0.3333333, 1, 1,
0.4304158, 0.4349947, -0.5592096, 0, 0.3294118, 1, 1,
0.4308003, -2.01115, 3.652559, 0, 0.3215686, 1, 1,
0.4319355, -0.4752848, 3.765653, 0, 0.3176471, 1, 1,
0.4345864, 0.3904614, -0.9744646, 0, 0.3098039, 1, 1,
0.4358205, 1.009112, 0.8253828, 0, 0.3058824, 1, 1,
0.4380932, 0.9355271, 0.2696531, 0, 0.2980392, 1, 1,
0.4407671, 1.27486, -1.138364, 0, 0.2901961, 1, 1,
0.4426385, -0.097753, -1.179187, 0, 0.2862745, 1, 1,
0.4429017, -0.3779127, 2.526358, 0, 0.2784314, 1, 1,
0.4447784, -0.4534063, 3.599545, 0, 0.2745098, 1, 1,
0.4453565, -1.72938, 3.301638, 0, 0.2666667, 1, 1,
0.4469848, 0.7468135, 1.024454, 0, 0.2627451, 1, 1,
0.4472402, 2.220356, 2.642868, 0, 0.254902, 1, 1,
0.4487697, 0.7160956, -0.4978809, 0, 0.2509804, 1, 1,
0.449176, 1.744173, 1.686525, 0, 0.2431373, 1, 1,
0.4515155, -0.9767762, 5.234951, 0, 0.2392157, 1, 1,
0.4556053, 1.757813, 0.7939602, 0, 0.2313726, 1, 1,
0.4575809, -1.346982, 2.354604, 0, 0.227451, 1, 1,
0.457699, 0.946392, -0.5362495, 0, 0.2196078, 1, 1,
0.4687177, -0.6152584, 2.989219, 0, 0.2156863, 1, 1,
0.4721408, 0.7599394, 0.8137079, 0, 0.2078431, 1, 1,
0.4724525, 1.074381, 0.1900986, 0, 0.2039216, 1, 1,
0.4738716, -0.9495267, 4.598524, 0, 0.1960784, 1, 1,
0.474123, -1.209107, 2.551719, 0, 0.1882353, 1, 1,
0.4751533, -0.6008967, 2.315309, 0, 0.1843137, 1, 1,
0.4755284, 0.5352352, 2.355793, 0, 0.1764706, 1, 1,
0.4755409, 1.308818, 0.7591236, 0, 0.172549, 1, 1,
0.4765833, 0.07564581, 1.941043, 0, 0.1647059, 1, 1,
0.4794498, 0.2374728, 1.385651, 0, 0.1607843, 1, 1,
0.4823215, -0.625895, 1.918435, 0, 0.1529412, 1, 1,
0.4823594, -1.076031, 3.552783, 0, 0.1490196, 1, 1,
0.4830666, -0.1404307, 1.241982, 0, 0.1411765, 1, 1,
0.483824, -0.642096, 1.867165, 0, 0.1372549, 1, 1,
0.4860671, 2.239097, -0.1843547, 0, 0.1294118, 1, 1,
0.4867016, -1.318221, 4.109976, 0, 0.1254902, 1, 1,
0.4870998, 0.7682027, -1.417141, 0, 0.1176471, 1, 1,
0.4916003, -0.01967977, 1.260511, 0, 0.1137255, 1, 1,
0.4945749, 1.332495, 0.8049707, 0, 0.1058824, 1, 1,
0.4952154, -0.8495748, 4.173138, 0, 0.09803922, 1, 1,
0.4969422, 1.021108, 0.4562233, 0, 0.09411765, 1, 1,
0.4979618, 0.1721938, 3.448764, 0, 0.08627451, 1, 1,
0.5011007, -0.8404399, 2.949442, 0, 0.08235294, 1, 1,
0.5015946, -1.820927, 1.152742, 0, 0.07450981, 1, 1,
0.5020141, 1.213817, -0.7021763, 0, 0.07058824, 1, 1,
0.5045406, 0.1577301, -0.7644846, 0, 0.0627451, 1, 1,
0.5061088, 0.4425196, 0.8809425, 0, 0.05882353, 1, 1,
0.5065852, 0.615007, 0.4184161, 0, 0.05098039, 1, 1,
0.5094106, -0.6110488, 0.5927852, 0, 0.04705882, 1, 1,
0.5124989, -0.07805909, 3.443578, 0, 0.03921569, 1, 1,
0.514015, 0.4115857, 0.04807709, 0, 0.03529412, 1, 1,
0.5151147, -0.6189554, 1.492235, 0, 0.02745098, 1, 1,
0.5153487, -1.006797, 3.473971, 0, 0.02352941, 1, 1,
0.5161526, 0.387499, -0.03181197, 0, 0.01568628, 1, 1,
0.5170467, -1.734378, 0.7273137, 0, 0.01176471, 1, 1,
0.5211702, 0.842032, 0.7623737, 0, 0.003921569, 1, 1,
0.5271754, -1.041804, 3.038908, 0.003921569, 0, 1, 1,
0.5272086, 1.109251, 1.824531, 0.007843138, 0, 1, 1,
0.5282239, -0.8602279, 2.632569, 0.01568628, 0, 1, 1,
0.5324115, -0.3684629, 3.195324, 0.01960784, 0, 1, 1,
0.5427391, 0.1950758, -1.191921, 0.02745098, 0, 1, 1,
0.5446327, 0.2422654, 1.856407, 0.03137255, 0, 1, 1,
0.5495494, -1.161912, 2.726122, 0.03921569, 0, 1, 1,
0.5566797, 0.2257484, 2.174413, 0.04313726, 0, 1, 1,
0.5590871, -0.9382334, 3.595975, 0.05098039, 0, 1, 1,
0.5614225, 0.9825807, -0.6323462, 0.05490196, 0, 1, 1,
0.57002, 0.844173, 2.419269, 0.0627451, 0, 1, 1,
0.5709819, -0.2054196, 2.638338, 0.06666667, 0, 1, 1,
0.5724699, -0.09917707, 1.784943, 0.07450981, 0, 1, 1,
0.578402, 0.1441351, 4.033699, 0.07843138, 0, 1, 1,
0.5828763, -1.145311, 3.00368, 0.08627451, 0, 1, 1,
0.5863908, -0.8760914, 1.52809, 0.09019608, 0, 1, 1,
0.5884959, -0.2206595, 2.93344, 0.09803922, 0, 1, 1,
0.5906879, -0.5757025, 2.329311, 0.1058824, 0, 1, 1,
0.5967348, 1.367293, 0.02552429, 0.1098039, 0, 1, 1,
0.5976133, -0.07447532, 1.355371, 0.1176471, 0, 1, 1,
0.598002, -0.1148268, 1.792979, 0.1215686, 0, 1, 1,
0.5983109, 0.6094242, 0.2351949, 0.1294118, 0, 1, 1,
0.600004, 0.9008932, 1.153604, 0.1333333, 0, 1, 1,
0.6039377, -0.9951531, 2.817076, 0.1411765, 0, 1, 1,
0.6041257, 2.052646, 0.8739592, 0.145098, 0, 1, 1,
0.604295, 1.129471, -0.08275388, 0.1529412, 0, 1, 1,
0.6074126, 0.6727986, -0.3669891, 0.1568628, 0, 1, 1,
0.6123071, 0.4680607, 0.929446, 0.1647059, 0, 1, 1,
0.6187941, -1.617376, 3.09431, 0.1686275, 0, 1, 1,
0.6232437, -0.3420841, 1.120933, 0.1764706, 0, 1, 1,
0.6234877, -0.3105464, 1.7323, 0.1803922, 0, 1, 1,
0.6252427, 0.04623783, 2.6988, 0.1882353, 0, 1, 1,
0.6316736, -0.6124398, 2.001803, 0.1921569, 0, 1, 1,
0.6345915, -0.202825, 2.455445, 0.2, 0, 1, 1,
0.6370177, -0.4828705, 2.283631, 0.2078431, 0, 1, 1,
0.6396714, 0.4590364, 0.1822312, 0.2117647, 0, 1, 1,
0.6426739, -2.536516, 2.246947, 0.2196078, 0, 1, 1,
0.6455121, 1.415848, -0.840812, 0.2235294, 0, 1, 1,
0.6500282, 0.7628839, 0.8053575, 0.2313726, 0, 1, 1,
0.6544852, -0.7193494, 1.649398, 0.2352941, 0, 1, 1,
0.6547549, -0.7052038, 2.207124, 0.2431373, 0, 1, 1,
0.6625386, 0.238953, 2.391282, 0.2470588, 0, 1, 1,
0.6640615, 1.578911, 0.450819, 0.254902, 0, 1, 1,
0.6644526, -0.2851906, 2.603286, 0.2588235, 0, 1, 1,
0.6668108, -1.344563, 2.681218, 0.2666667, 0, 1, 1,
0.6671796, 0.8296431, 1.925767, 0.2705882, 0, 1, 1,
0.6727156, -0.6737016, 4.080759, 0.2784314, 0, 1, 1,
0.6812491, -0.08394895, 3.315876, 0.282353, 0, 1, 1,
0.6834093, 0.5210799, 1.149962, 0.2901961, 0, 1, 1,
0.6847444, -0.1419283, 2.352952, 0.2941177, 0, 1, 1,
0.6855144, 0.04447026, 1.285164, 0.3019608, 0, 1, 1,
0.6919, 0.05196439, 1.195973, 0.3098039, 0, 1, 1,
0.692671, -0.083956, 1.984496, 0.3137255, 0, 1, 1,
0.6969678, -0.3407807, 2.373857, 0.3215686, 0, 1, 1,
0.7122285, 0.08557165, 1.201726, 0.3254902, 0, 1, 1,
0.715398, 2.137637, 1.669404, 0.3333333, 0, 1, 1,
0.715574, 1.472309, 0.5079698, 0.3372549, 0, 1, 1,
0.7167501, 0.2704402, 1.027966, 0.345098, 0, 1, 1,
0.7169316, 1.047919, 0.9776536, 0.3490196, 0, 1, 1,
0.7187064, -0.3911387, 2.028745, 0.3568628, 0, 1, 1,
0.7226953, 0.4127154, 1.948314, 0.3607843, 0, 1, 1,
0.7282073, 0.8831797, 1.959678, 0.3686275, 0, 1, 1,
0.7300048, 1.35066, 0.6402304, 0.372549, 0, 1, 1,
0.732368, 0.8609736, 0.05729393, 0.3803922, 0, 1, 1,
0.7358061, -0.7771853, 0.9468161, 0.3843137, 0, 1, 1,
0.7408081, -1.695, 2.594947, 0.3921569, 0, 1, 1,
0.7413633, 0.3347094, 1.366521, 0.3960784, 0, 1, 1,
0.7416939, -2.272842, 2.857677, 0.4039216, 0, 1, 1,
0.743816, 0.6152917, 3.081381, 0.4117647, 0, 1, 1,
0.7473282, 0.4840053, -1.252867, 0.4156863, 0, 1, 1,
0.7478642, -0.6949062, 1.540516, 0.4235294, 0, 1, 1,
0.7517219, 0.3759201, -0.8879462, 0.427451, 0, 1, 1,
0.7519079, -0.8795778, 3.830277, 0.4352941, 0, 1, 1,
0.7521511, 1.369685, -0.6460219, 0.4392157, 0, 1, 1,
0.7563711, -0.6224896, 1.561263, 0.4470588, 0, 1, 1,
0.7627837, -0.8886112, 2.154418, 0.4509804, 0, 1, 1,
0.7630563, 0.09048165, -1.422301, 0.4588235, 0, 1, 1,
0.7635738, -0.3760578, 2.435913, 0.4627451, 0, 1, 1,
0.7643182, 0.4375884, 1.837013, 0.4705882, 0, 1, 1,
0.7651796, 0.8691546, 0.166689, 0.4745098, 0, 1, 1,
0.7701093, -0.9407445, 3.238189, 0.4823529, 0, 1, 1,
0.7701543, -0.4008564, 1.905014, 0.4862745, 0, 1, 1,
0.7721193, 0.402829, 2.343364, 0.4941176, 0, 1, 1,
0.7784993, -0.2919302, 1.319897, 0.5019608, 0, 1, 1,
0.781903, 0.5416487, 1.730036, 0.5058824, 0, 1, 1,
0.7823128, -0.4877321, 1.293984, 0.5137255, 0, 1, 1,
0.7974148, -0.4901363, 0.390581, 0.5176471, 0, 1, 1,
0.8000342, 0.7765556, 2.306303, 0.5254902, 0, 1, 1,
0.801586, 1.036307, -1.164483, 0.5294118, 0, 1, 1,
0.8017288, -0.9462448, 1.618904, 0.5372549, 0, 1, 1,
0.8039659, 1.070218, 1.914299, 0.5411765, 0, 1, 1,
0.8075021, 1.207526, 1.569691, 0.5490196, 0, 1, 1,
0.8090694, 0.3606653, 0.8040491, 0.5529412, 0, 1, 1,
0.8097647, 0.6277756, 0.04199922, 0.5607843, 0, 1, 1,
0.8123595, -1.130408, 2.831369, 0.5647059, 0, 1, 1,
0.8169584, -0.2211544, 2.316069, 0.572549, 0, 1, 1,
0.8175532, 1.275113, 2.196621, 0.5764706, 0, 1, 1,
0.8179991, 2.32954, -0.9215882, 0.5843138, 0, 1, 1,
0.8226971, 0.006346569, 1.340592, 0.5882353, 0, 1, 1,
0.824331, -0.7888635, 0.7859572, 0.5960785, 0, 1, 1,
0.8366539, -0.6120538, 0.8695025, 0.6039216, 0, 1, 1,
0.8427457, 1.502233, 0.3246958, 0.6078432, 0, 1, 1,
0.8432225, -0.243816, 1.364413, 0.6156863, 0, 1, 1,
0.8432549, 1.436672, 0.4965929, 0.6196079, 0, 1, 1,
0.844323, 0.7570631, 0.8471383, 0.627451, 0, 1, 1,
0.8445726, 0.3453539, 1.323451, 0.6313726, 0, 1, 1,
0.8449742, 0.952206, 1.359724, 0.6392157, 0, 1, 1,
0.8457896, 1.203363, 0.3176681, 0.6431373, 0, 1, 1,
0.8467544, -1.101604, 2.770158, 0.6509804, 0, 1, 1,
0.8475269, -0.3358307, 2.393689, 0.654902, 0, 1, 1,
0.8495481, -1.26211, 3.204194, 0.6627451, 0, 1, 1,
0.8544697, -0.4752387, 2.699712, 0.6666667, 0, 1, 1,
0.8566422, -0.191856, 0.8864663, 0.6745098, 0, 1, 1,
0.858227, 0.212567, 0.925867, 0.6784314, 0, 1, 1,
0.8592014, 0.1993648, -0.2520324, 0.6862745, 0, 1, 1,
0.8596052, 0.9063843, 0.3882791, 0.6901961, 0, 1, 1,
0.8600323, 0.896435, 1.871168, 0.6980392, 0, 1, 1,
0.8616062, 0.03299675, 0.5758898, 0.7058824, 0, 1, 1,
0.872327, 0.3216828, 0.3606186, 0.7098039, 0, 1, 1,
0.8779368, 1.106728, 1.151703, 0.7176471, 0, 1, 1,
0.8780154, -1.036681, 2.893112, 0.7215686, 0, 1, 1,
0.8837641, -1.538716, 5.438034, 0.7294118, 0, 1, 1,
0.8841124, -0.7199459, 1.316207, 0.7333333, 0, 1, 1,
0.8892741, 0.4158119, 1.432273, 0.7411765, 0, 1, 1,
0.8895769, 0.8476328, 0.2278655, 0.7450981, 0, 1, 1,
0.8920276, -1.065742, 4.861721, 0.7529412, 0, 1, 1,
0.8938204, 1.119561, -0.4972586, 0.7568628, 0, 1, 1,
0.8956848, -0.7411824, 3.264991, 0.7647059, 0, 1, 1,
0.9127755, 0.5564566, 1.149079, 0.7686275, 0, 1, 1,
0.9149808, -0.7683504, 2.666584, 0.7764706, 0, 1, 1,
0.9204345, 0.2368879, 2.847606, 0.7803922, 0, 1, 1,
0.9223086, 0.177314, 1.892341, 0.7882353, 0, 1, 1,
0.9306732, -1.645388, 4.031398, 0.7921569, 0, 1, 1,
0.9313389, 0.8480653, 1.92321, 0.8, 0, 1, 1,
0.9330106, -0.5935706, 1.637547, 0.8078431, 0, 1, 1,
0.9342412, -1.028385, 2.618462, 0.8117647, 0, 1, 1,
0.934689, 0.1913093, 2.288536, 0.8196079, 0, 1, 1,
0.9367524, 0.5483161, 1.692812, 0.8235294, 0, 1, 1,
0.9377201, -1.473612, 3.788618, 0.8313726, 0, 1, 1,
0.9414315, 1.101313, 1.741315, 0.8352941, 0, 1, 1,
0.941707, -0.6567594, 3.27932, 0.8431373, 0, 1, 1,
0.9438357, -0.2166141, 1.321456, 0.8470588, 0, 1, 1,
0.95581, -0.5035846, 1.550254, 0.854902, 0, 1, 1,
0.9611748, 0.9692704, 0.3875282, 0.8588235, 0, 1, 1,
0.9615425, 0.2718332, 2.058281, 0.8666667, 0, 1, 1,
0.9653032, 0.1596942, 1.779474, 0.8705882, 0, 1, 1,
0.9658943, 0.6941875, 0.2442204, 0.8784314, 0, 1, 1,
0.9703665, 1.233389, 0.02659616, 0.8823529, 0, 1, 1,
0.970437, 1.931847, 0.7642617, 0.8901961, 0, 1, 1,
0.97371, 1.10275, 1.16023, 0.8941177, 0, 1, 1,
0.9775364, -0.5352184, 1.29521, 0.9019608, 0, 1, 1,
0.9875814, -0.2618223, 1.249067, 0.9098039, 0, 1, 1,
0.9919609, 0.1017134, 2.477339, 0.9137255, 0, 1, 1,
0.9922485, 1.093246, 0.3489799, 0.9215686, 0, 1, 1,
0.9929479, 1.524646, 2.237638, 0.9254902, 0, 1, 1,
0.9931499, 1.607076, 1.282176, 0.9333333, 0, 1, 1,
0.9934242, 0.1636189, 3.654639, 0.9372549, 0, 1, 1,
0.9972368, 0.6169544, 0.1879975, 0.945098, 0, 1, 1,
0.9994012, -1.787123, 3.103402, 0.9490196, 0, 1, 1,
1.001927, -2.392394, 4.663705, 0.9568627, 0, 1, 1,
1.013283, -0.269196, 1.825946, 0.9607843, 0, 1, 1,
1.016654, 0.8285918, -0.2868918, 0.9686275, 0, 1, 1,
1.024727, 0.06417765, 1.907426, 0.972549, 0, 1, 1,
1.029241, 0.5030628, 2.442595, 0.9803922, 0, 1, 1,
1.041585, 0.1850626, 1.853853, 0.9843137, 0, 1, 1,
1.048747, -1.535558, 3.598821, 0.9921569, 0, 1, 1,
1.04937, 0.7336508, 1.387091, 0.9960784, 0, 1, 1,
1.061701, 0.7559144, -0.9952629, 1, 0, 0.9960784, 1,
1.065017, 2.406371, 2.688137, 1, 0, 0.9882353, 1,
1.069926, 0.6865479, 1.964045, 1, 0, 0.9843137, 1,
1.069937, -0.3954381, 0.5139517, 1, 0, 0.9764706, 1,
1.075331, -0.02805768, 2.512912, 1, 0, 0.972549, 1,
1.075385, -0.1858553, 1.986529, 1, 0, 0.9647059, 1,
1.076539, 0.2024497, 2.20391, 1, 0, 0.9607843, 1,
1.08264, 0.2691847, 1.920668, 1, 0, 0.9529412, 1,
1.08397, -0.6322176, 2.240634, 1, 0, 0.9490196, 1,
1.084292, -1.223743, 2.460177, 1, 0, 0.9411765, 1,
1.096734, 1.161891, 0.8353732, 1, 0, 0.9372549, 1,
1.109608, -1.352316, 3.625576, 1, 0, 0.9294118, 1,
1.111526, -0.3238043, 0.4240068, 1, 0, 0.9254902, 1,
1.111829, -1.338063, 3.605413, 1, 0, 0.9176471, 1,
1.114005, 0.4884219, 1.830953, 1, 0, 0.9137255, 1,
1.125506, 1.21616, 0.5760695, 1, 0, 0.9058824, 1,
1.126709, -0.2220415, 1.4105, 1, 0, 0.9019608, 1,
1.127003, -1.441302, 1.521124, 1, 0, 0.8941177, 1,
1.12856, 0.2656491, 2.748945, 1, 0, 0.8862745, 1,
1.132207, -0.8305563, 2.230198, 1, 0, 0.8823529, 1,
1.13228, 0.34885, 2.773165, 1, 0, 0.8745098, 1,
1.139118, 1.097817, 1.175627, 1, 0, 0.8705882, 1,
1.15359, -0.7582277, 1.47652, 1, 0, 0.8627451, 1,
1.154513, -0.98116, 2.091443, 1, 0, 0.8588235, 1,
1.155312, 3.890255, 0.477932, 1, 0, 0.8509804, 1,
1.162051, 0.5417654, 1.253706, 1, 0, 0.8470588, 1,
1.163141, -1.318833, 5.288233, 1, 0, 0.8392157, 1,
1.163991, -0.5631389, 4.332881, 1, 0, 0.8352941, 1,
1.164912, -0.6167157, 2.012553, 1, 0, 0.827451, 1,
1.170195, 0.4559266, 2.909535, 1, 0, 0.8235294, 1,
1.174295, -0.8854, 2.585928, 1, 0, 0.8156863, 1,
1.184265, -2.352899, 1.447745, 1, 0, 0.8117647, 1,
1.189458, -0.8697595, 3.428838, 1, 0, 0.8039216, 1,
1.191037, 1.095839, 2.189847, 1, 0, 0.7960784, 1,
1.191273, 3.016563, 0.7368303, 1, 0, 0.7921569, 1,
1.193115, 0.07773852, 0.896342, 1, 0, 0.7843137, 1,
1.19673, -1.287858, 3.47899, 1, 0, 0.7803922, 1,
1.197068, 1.04121, 0.9457735, 1, 0, 0.772549, 1,
1.20175, 0.1655222, 1.634951, 1, 0, 0.7686275, 1,
1.201845, -0.7454917, 3.26999, 1, 0, 0.7607843, 1,
1.201953, 0.2581436, 3.030296, 1, 0, 0.7568628, 1,
1.203759, -0.7331713, 0.6118463, 1, 0, 0.7490196, 1,
1.208209, -0.6293611, 1.743482, 1, 0, 0.7450981, 1,
1.211594, 0.630249, 1.520744, 1, 0, 0.7372549, 1,
1.215405, 0.2892957, -0.3830316, 1, 0, 0.7333333, 1,
1.218249, 2.322002, -0.1635721, 1, 0, 0.7254902, 1,
1.225445, 0.233235, 2.622476, 1, 0, 0.7215686, 1,
1.229649, -1.114506, 2.468471, 1, 0, 0.7137255, 1,
1.233255, -0.2866528, 1.724966, 1, 0, 0.7098039, 1,
1.238866, -0.05226169, -0.5662247, 1, 0, 0.7019608, 1,
1.240527, 2.437327, 0.3851006, 1, 0, 0.6941177, 1,
1.246803, -0.1472411, 2.790253, 1, 0, 0.6901961, 1,
1.247369, -1.128183, 4.386091, 1, 0, 0.682353, 1,
1.258352, -1.35589, 2.281741, 1, 0, 0.6784314, 1,
1.25958, -0.30364, -0.08114479, 1, 0, 0.6705883, 1,
1.27264, 0.1083703, 0.13303, 1, 0, 0.6666667, 1,
1.296326, -2.330648, 3.088924, 1, 0, 0.6588235, 1,
1.331249, -1.316402, 0.4275242, 1, 0, 0.654902, 1,
1.331611, 0.4714279, -0.1746225, 1, 0, 0.6470588, 1,
1.334022, -0.4200437, 1.241811, 1, 0, 0.6431373, 1,
1.337747, -0.2199595, 2.13507, 1, 0, 0.6352941, 1,
1.345948, -0.7568313, 1.012522, 1, 0, 0.6313726, 1,
1.346899, 0.08726473, 1.483861, 1, 0, 0.6235294, 1,
1.352844, -0.3696408, -0.1138935, 1, 0, 0.6196079, 1,
1.354281, -0.02860782, 2.803916, 1, 0, 0.6117647, 1,
1.366417, -0.11771, 2.019984, 1, 0, 0.6078432, 1,
1.370384, 0.6794647, 1.25576, 1, 0, 0.6, 1,
1.373265, 2.153324, 1.366877, 1, 0, 0.5921569, 1,
1.374745, -1.153072, 1.69658, 1, 0, 0.5882353, 1,
1.386793, 1.05183, 1.526993, 1, 0, 0.5803922, 1,
1.388322, 0.229769, 0.5367712, 1, 0, 0.5764706, 1,
1.395315, -0.5235715, 3.538428, 1, 0, 0.5686275, 1,
1.399533, 0.02754869, 2.381504, 1, 0, 0.5647059, 1,
1.400714, 0.9244422, 1.433874, 1, 0, 0.5568628, 1,
1.408624, 1.366676, 1.33437, 1, 0, 0.5529412, 1,
1.413293, -1.57249, 1.646279, 1, 0, 0.5450981, 1,
1.415484, 0.1449723, 2.62032, 1, 0, 0.5411765, 1,
1.422714, -0.1478126, 1.62737, 1, 0, 0.5333334, 1,
1.423521, -0.3200045, 3.658968, 1, 0, 0.5294118, 1,
1.426748, -1.521743, 1.640504, 1, 0, 0.5215687, 1,
1.429869, 0.7341496, -0.2487216, 1, 0, 0.5176471, 1,
1.430397, -1.726768, 2.213726, 1, 0, 0.509804, 1,
1.449746, 1.485154, 0.6795108, 1, 0, 0.5058824, 1,
1.460974, -1.075116, 2.307313, 1, 0, 0.4980392, 1,
1.465163, -0.2235118, 1.849067, 1, 0, 0.4901961, 1,
1.466158, -0.05179491, 1.500585, 1, 0, 0.4862745, 1,
1.476248, 1.363838, -0.2733974, 1, 0, 0.4784314, 1,
1.477351, 0.8268437, 0.6733316, 1, 0, 0.4745098, 1,
1.484993, 0.04273882, 1.192212, 1, 0, 0.4666667, 1,
1.492457, 0.257576, 2.104459, 1, 0, 0.4627451, 1,
1.501175, 1.037803, 1.436812, 1, 0, 0.454902, 1,
1.510198, -0.3568621, 2.427924, 1, 0, 0.4509804, 1,
1.524532, 0.56498, 1.738804, 1, 0, 0.4431373, 1,
1.527378, 0.3887791, 0.8290949, 1, 0, 0.4392157, 1,
1.535562, 0.2726093, 0.9266514, 1, 0, 0.4313726, 1,
1.540504, -0.884406, 2.425011, 1, 0, 0.427451, 1,
1.544274, 1.018762, 1.959888, 1, 0, 0.4196078, 1,
1.545306, 0.5763865, 2.245081, 1, 0, 0.4156863, 1,
1.548133, -1.252732, 3.155253, 1, 0, 0.4078431, 1,
1.549114, -1.007569, 1.951556, 1, 0, 0.4039216, 1,
1.560953, -0.3744623, 2.823116, 1, 0, 0.3960784, 1,
1.563403, -0.3125754, 1.307021, 1, 0, 0.3882353, 1,
1.570014, -0.26862, 2.983534, 1, 0, 0.3843137, 1,
1.579596, 0.07847866, -0.3627046, 1, 0, 0.3764706, 1,
1.592881, -0.4513809, 1.479547, 1, 0, 0.372549, 1,
1.595938, 0.2336145, 0.344817, 1, 0, 0.3647059, 1,
1.605579, 1.625636, 0.5005019, 1, 0, 0.3607843, 1,
1.616372, 0.1130598, 1.520677, 1, 0, 0.3529412, 1,
1.616913, -1.762158, 1.716452, 1, 0, 0.3490196, 1,
1.623385, 0.4280219, 1.9532, 1, 0, 0.3411765, 1,
1.643358, 0.8817453, 2.249887, 1, 0, 0.3372549, 1,
1.644712, -0.4547737, 2.158299, 1, 0, 0.3294118, 1,
1.645988, 0.1409335, 2.992403, 1, 0, 0.3254902, 1,
1.65218, 1.059801, 1.857389, 1, 0, 0.3176471, 1,
1.676755, 0.03316518, 2.339293, 1, 0, 0.3137255, 1,
1.677431, -1.232177, 1.348536, 1, 0, 0.3058824, 1,
1.681461, 0.9790352, 0.5354189, 1, 0, 0.2980392, 1,
1.682363, 0.8737261, -0.02224159, 1, 0, 0.2941177, 1,
1.69897, 0.89446, 0.526986, 1, 0, 0.2862745, 1,
1.713598, -0.07910325, 0.6119854, 1, 0, 0.282353, 1,
1.716984, 0.2537263, 0.4834432, 1, 0, 0.2745098, 1,
1.719443, -1.033, 2.599061, 1, 0, 0.2705882, 1,
1.739424, 0.6727916, 1.833197, 1, 0, 0.2627451, 1,
1.744583, 0.0564918, 3.329853, 1, 0, 0.2588235, 1,
1.777435, 0.3129648, 0.1176164, 1, 0, 0.2509804, 1,
1.778014, -1.263179, 3.577713, 1, 0, 0.2470588, 1,
1.7876, 0.2996251, 1.537394, 1, 0, 0.2392157, 1,
1.82155, 2.21282, 1.77487, 1, 0, 0.2352941, 1,
1.822442, 0.7704571, 1.863073, 1, 0, 0.227451, 1,
1.824242, 0.2950531, 2.27993, 1, 0, 0.2235294, 1,
1.837378, -0.6750368, 1.20002, 1, 0, 0.2156863, 1,
1.846159, -1.574456, 1.752827, 1, 0, 0.2117647, 1,
1.86068, -1.054607, 0.3956853, 1, 0, 0.2039216, 1,
1.87483, -0.2716963, 2.325662, 1, 0, 0.1960784, 1,
1.884701, -0.8300968, 1.486672, 1, 0, 0.1921569, 1,
1.887666, -0.4220244, 1.949302, 1, 0, 0.1843137, 1,
1.901882, -0.4202139, 0.6687068, 1, 0, 0.1803922, 1,
1.924699, -0.1030586, 0.8408391, 1, 0, 0.172549, 1,
2.006496, 0.2598009, 3.120956, 1, 0, 0.1686275, 1,
2.0065, 0.1639378, 0.1524415, 1, 0, 0.1607843, 1,
2.011271, 1.518753, 0.3532338, 1, 0, 0.1568628, 1,
2.024633, -0.6816773, 3.279232, 1, 0, 0.1490196, 1,
2.036502, 1.703923, 3.265909, 1, 0, 0.145098, 1,
2.04772, -1.189186, 3.825701, 1, 0, 0.1372549, 1,
2.06415, 1.385383, -0.01487128, 1, 0, 0.1333333, 1,
2.068134, 0.1199301, 0.7515918, 1, 0, 0.1254902, 1,
2.098291, 0.6378783, 0.9221843, 1, 0, 0.1215686, 1,
2.124162, 0.1711283, 0.81063, 1, 0, 0.1137255, 1,
2.142419, -1.506087, 1.975391, 1, 0, 0.1098039, 1,
2.150538, -1.090935, 1.048054, 1, 0, 0.1019608, 1,
2.151568, -1.24886, 3.549499, 1, 0, 0.09411765, 1,
2.18224, -0.9653866, 0.5360837, 1, 0, 0.09019608, 1,
2.193945, -0.3214867, 0.7238684, 1, 0, 0.08235294, 1,
2.208242, 1.513265, 1.24173, 1, 0, 0.07843138, 1,
2.217839, -0.4680752, 1.695847, 1, 0, 0.07058824, 1,
2.242057, 1.256021, 3.536874, 1, 0, 0.06666667, 1,
2.2456, 0.7102898, 3.000293, 1, 0, 0.05882353, 1,
2.260229, -1.156844, 2.221724, 1, 0, 0.05490196, 1,
2.543168, 1.702189, 1.213686, 1, 0, 0.04705882, 1,
2.56247, 1.751557, 1.476455, 1, 0, 0.04313726, 1,
2.600672, -0.1882406, -0.007753539, 1, 0, 0.03529412, 1,
2.637355, 0.1308109, 0.6869678, 1, 0, 0.03137255, 1,
2.658384, -0.3993737, -0.2178165, 1, 0, 0.02352941, 1,
2.698256, 0.01532409, 1.149536, 1, 0, 0.01960784, 1,
2.881576, 0.946828, 3.07164, 1, 0, 0.01176471, 1,
3.291521, -0.998764, 1.831258, 1, 0, 0.007843138, 1
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
0.1096982, -5.25084, -6.57668, 0, -0.5, 0.5, 0.5,
0.1096982, -5.25084, -6.57668, 1, -0.5, 0.5, 0.5,
0.1096982, -5.25084, -6.57668, 1, 1.5, 0.5, 0.5,
0.1096982, -5.25084, -6.57668, 0, 1.5, 0.5, 0.5
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
-4.150763, -0.01786613, -6.57668, 0, -0.5, 0.5, 0.5,
-4.150763, -0.01786613, -6.57668, 1, -0.5, 0.5, 0.5,
-4.150763, -0.01786613, -6.57668, 1, 1.5, 0.5, 0.5,
-4.150763, -0.01786613, -6.57668, 0, 1.5, 0.5, 0.5
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
-4.150763, -5.25084, 0.3013456, 0, -0.5, 0.5, 0.5,
-4.150763, -5.25084, 0.3013456, 1, -0.5, 0.5, 0.5,
-4.150763, -5.25084, 0.3013456, 1, 1.5, 0.5, 0.5,
-4.150763, -5.25084, 0.3013456, 0, 1.5, 0.5, 0.5
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
-3, -4.043231, -4.989443,
3, -4.043231, -4.989443,
-3, -4.043231, -4.989443,
-3, -4.244499, -5.253983,
-2, -4.043231, -4.989443,
-2, -4.244499, -5.253983,
-1, -4.043231, -4.989443,
-1, -4.244499, -5.253983,
0, -4.043231, -4.989443,
0, -4.244499, -5.253983,
1, -4.043231, -4.989443,
1, -4.244499, -5.253983,
2, -4.043231, -4.989443,
2, -4.244499, -5.253983,
3, -4.043231, -4.989443,
3, -4.244499, -5.253983
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
-3, -4.647036, -5.783062, 0, -0.5, 0.5, 0.5,
-3, -4.647036, -5.783062, 1, -0.5, 0.5, 0.5,
-3, -4.647036, -5.783062, 1, 1.5, 0.5, 0.5,
-3, -4.647036, -5.783062, 0, 1.5, 0.5, 0.5,
-2, -4.647036, -5.783062, 0, -0.5, 0.5, 0.5,
-2, -4.647036, -5.783062, 1, -0.5, 0.5, 0.5,
-2, -4.647036, -5.783062, 1, 1.5, 0.5, 0.5,
-2, -4.647036, -5.783062, 0, 1.5, 0.5, 0.5,
-1, -4.647036, -5.783062, 0, -0.5, 0.5, 0.5,
-1, -4.647036, -5.783062, 1, -0.5, 0.5, 0.5,
-1, -4.647036, -5.783062, 1, 1.5, 0.5, 0.5,
-1, -4.647036, -5.783062, 0, 1.5, 0.5, 0.5,
0, -4.647036, -5.783062, 0, -0.5, 0.5, 0.5,
0, -4.647036, -5.783062, 1, -0.5, 0.5, 0.5,
0, -4.647036, -5.783062, 1, 1.5, 0.5, 0.5,
0, -4.647036, -5.783062, 0, 1.5, 0.5, 0.5,
1, -4.647036, -5.783062, 0, -0.5, 0.5, 0.5,
1, -4.647036, -5.783062, 1, -0.5, 0.5, 0.5,
1, -4.647036, -5.783062, 1, 1.5, 0.5, 0.5,
1, -4.647036, -5.783062, 0, 1.5, 0.5, 0.5,
2, -4.647036, -5.783062, 0, -0.5, 0.5, 0.5,
2, -4.647036, -5.783062, 1, -0.5, 0.5, 0.5,
2, -4.647036, -5.783062, 1, 1.5, 0.5, 0.5,
2, -4.647036, -5.783062, 0, 1.5, 0.5, 0.5,
3, -4.647036, -5.783062, 0, -0.5, 0.5, 0.5,
3, -4.647036, -5.783062, 1, -0.5, 0.5, 0.5,
3, -4.647036, -5.783062, 1, 1.5, 0.5, 0.5,
3, -4.647036, -5.783062, 0, 1.5, 0.5, 0.5
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
-3.16758, -2, -4.989443,
-3.16758, 2, -4.989443,
-3.16758, -2, -4.989443,
-3.331444, -2, -5.253983,
-3.16758, 0, -4.989443,
-3.331444, 0, -5.253983,
-3.16758, 2, -4.989443,
-3.331444, 2, -5.253983
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
-3.659171, -2, -5.783062, 0, -0.5, 0.5, 0.5,
-3.659171, -2, -5.783062, 1, -0.5, 0.5, 0.5,
-3.659171, -2, -5.783062, 1, 1.5, 0.5, 0.5,
-3.659171, -2, -5.783062, 0, 1.5, 0.5, 0.5,
-3.659171, 0, -5.783062, 0, -0.5, 0.5, 0.5,
-3.659171, 0, -5.783062, 1, -0.5, 0.5, 0.5,
-3.659171, 0, -5.783062, 1, 1.5, 0.5, 0.5,
-3.659171, 0, -5.783062, 0, 1.5, 0.5, 0.5,
-3.659171, 2, -5.783062, 0, -0.5, 0.5, 0.5,
-3.659171, 2, -5.783062, 1, -0.5, 0.5, 0.5,
-3.659171, 2, -5.783062, 1, 1.5, 0.5, 0.5,
-3.659171, 2, -5.783062, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.16758, -4.043231, -4,
-3.16758, -4.043231, 4,
-3.16758, -4.043231, -4,
-3.331444, -4.244499, -4,
-3.16758, -4.043231, -2,
-3.331444, -4.244499, -2,
-3.16758, -4.043231, 0,
-3.331444, -4.244499, 0,
-3.16758, -4.043231, 2,
-3.331444, -4.244499, 2,
-3.16758, -4.043231, 4,
-3.331444, -4.244499, 4
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
-3.659171, -4.647036, -4, 0, -0.5, 0.5, 0.5,
-3.659171, -4.647036, -4, 1, -0.5, 0.5, 0.5,
-3.659171, -4.647036, -4, 1, 1.5, 0.5, 0.5,
-3.659171, -4.647036, -4, 0, 1.5, 0.5, 0.5,
-3.659171, -4.647036, -2, 0, -0.5, 0.5, 0.5,
-3.659171, -4.647036, -2, 1, -0.5, 0.5, 0.5,
-3.659171, -4.647036, -2, 1, 1.5, 0.5, 0.5,
-3.659171, -4.647036, -2, 0, 1.5, 0.5, 0.5,
-3.659171, -4.647036, 0, 0, -0.5, 0.5, 0.5,
-3.659171, -4.647036, 0, 1, -0.5, 0.5, 0.5,
-3.659171, -4.647036, 0, 1, 1.5, 0.5, 0.5,
-3.659171, -4.647036, 0, 0, 1.5, 0.5, 0.5,
-3.659171, -4.647036, 2, 0, -0.5, 0.5, 0.5,
-3.659171, -4.647036, 2, 1, -0.5, 0.5, 0.5,
-3.659171, -4.647036, 2, 1, 1.5, 0.5, 0.5,
-3.659171, -4.647036, 2, 0, 1.5, 0.5, 0.5,
-3.659171, -4.647036, 4, 0, -0.5, 0.5, 0.5,
-3.659171, -4.647036, 4, 1, -0.5, 0.5, 0.5,
-3.659171, -4.647036, 4, 1, 1.5, 0.5, 0.5,
-3.659171, -4.647036, 4, 0, 1.5, 0.5, 0.5
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
-3.16758, -4.043231, -4.989443,
-3.16758, 4.007499, -4.989443,
-3.16758, -4.043231, 5.592134,
-3.16758, 4.007499, 5.592134,
-3.16758, -4.043231, -4.989443,
-3.16758, -4.043231, 5.592134,
-3.16758, 4.007499, -4.989443,
-3.16758, 4.007499, 5.592134,
-3.16758, -4.043231, -4.989443,
3.386976, -4.043231, -4.989443,
-3.16758, -4.043231, 5.592134,
3.386976, -4.043231, 5.592134,
-3.16758, 4.007499, -4.989443,
3.386976, 4.007499, -4.989443,
-3.16758, 4.007499, 5.592134,
3.386976, 4.007499, 5.592134,
3.386976, -4.043231, -4.989443,
3.386976, 4.007499, -4.989443,
3.386976, -4.043231, 5.592134,
3.386976, 4.007499, 5.592134,
3.386976, -4.043231, -4.989443,
3.386976, -4.043231, 5.592134,
3.386976, 4.007499, -4.989443,
3.386976, 4.007499, 5.592134
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
var radius = 7.915643;
var distance = 35.21759;
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
mvMatrix.translate( -0.1096982, 0.01786613, -0.3013456 );
mvMatrix.scale( 1.30574, 1.063077, 0.8088158 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.21759);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Hexadecyl_cyclopropa<-read.table("Hexadecyl_cyclopropa.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Hexadecyl_cyclopropa$V2
```

```
## Error in eval(expr, envir, enclos): object 'Hexadecyl_cyclopropa' not found
```

```r
y<-Hexadecyl_cyclopropa$V3
```

```
## Error in eval(expr, envir, enclos): object 'Hexadecyl_cyclopropa' not found
```

```r
z<-Hexadecyl_cyclopropa$V4
```

```
## Error in eval(expr, envir, enclos): object 'Hexadecyl_cyclopropa' not found
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
-3.072125, -0.02408807, -1.52332, 0, 0, 1, 1, 1,
-2.840524, 0.2825078, -0.7375565, 1, 0, 0, 1, 1,
-2.691314, -0.9931305, -3.137089, 1, 0, 0, 1, 1,
-2.650571, 1.380992, -1.861593, 1, 0, 0, 1, 1,
-2.563604, -1.024668, -1.763408, 1, 0, 0, 1, 1,
-2.541022, -1.53103, -3.047018, 1, 0, 0, 1, 1,
-2.460069, 0.1577362, -0.1790226, 0, 0, 0, 1, 1,
-2.45594, 0.3718179, -1.466996, 0, 0, 0, 1, 1,
-2.405657, -1.717138, -2.071791, 0, 0, 0, 1, 1,
-2.201856, 0.8182055, -2.053847, 0, 0, 0, 1, 1,
-2.190056, 0.542024, 0.2608369, 0, 0, 0, 1, 1,
-2.141702, -0.721814, -4.326286, 0, 0, 0, 1, 1,
-2.141234, -0.6255381, -2.175372, 0, 0, 0, 1, 1,
-2.113405, -0.6810662, -2.600461, 1, 1, 1, 1, 1,
-2.097612, 0.4701158, -0.6498426, 1, 1, 1, 1, 1,
-2.054742, 1.315331, -1.99796, 1, 1, 1, 1, 1,
-2.042563, -1.098149, -1.782321, 1, 1, 1, 1, 1,
-2.00763, 1.282544, -1.080026, 1, 1, 1, 1, 1,
-2.006878, 2.362622, 0.8798674, 1, 1, 1, 1, 1,
-1.999509, 0.6127167, -1.104842, 1, 1, 1, 1, 1,
-1.983185, -0.7117679, -1.915689, 1, 1, 1, 1, 1,
-1.946719, -0.3300333, -1.261294, 1, 1, 1, 1, 1,
-1.922294, -0.3062871, -1.542481, 1, 1, 1, 1, 1,
-1.908905, 1.617133, -1.727202, 1, 1, 1, 1, 1,
-1.896878, 0.7714189, -1.520911, 1, 1, 1, 1, 1,
-1.859216, 0.2243221, -0.9985853, 1, 1, 1, 1, 1,
-1.856717, 0.8385003, -1.003791, 1, 1, 1, 1, 1,
-1.853292, 1.340382, -0.2362102, 1, 1, 1, 1, 1,
-1.84846, 0.6519216, -1.419272, 0, 0, 1, 1, 1,
-1.847671, -0.4340448, -2.457905, 1, 0, 0, 1, 1,
-1.837352, -0.6203309, -3.75229, 1, 0, 0, 1, 1,
-1.836433, -0.004526855, 0.09320617, 1, 0, 0, 1, 1,
-1.835576, -0.2996983, -1.007902, 1, 0, 0, 1, 1,
-1.829098, -0.5089133, -3.038593, 1, 0, 0, 1, 1,
-1.827946, 1.339034, -0.8415384, 0, 0, 0, 1, 1,
-1.800856, 1.276761, -0.6041484, 0, 0, 0, 1, 1,
-1.780836, -0.8209599, -3.641549, 0, 0, 0, 1, 1,
-1.779186, -0.7802529, -0.6338772, 0, 0, 0, 1, 1,
-1.75614, 2.323355, 0.2913841, 0, 0, 0, 1, 1,
-1.689411, -0.6847413, -0.1400201, 0, 0, 0, 1, 1,
-1.673672, 1.453522, -3.201025, 0, 0, 0, 1, 1,
-1.668144, -0.4532328, -2.03402, 1, 1, 1, 1, 1,
-1.653652, -3.925987, -3.0693, 1, 1, 1, 1, 1,
-1.651628, -0.1366709, -2.843743, 1, 1, 1, 1, 1,
-1.651625, 1.52781, -0.9108127, 1, 1, 1, 1, 1,
-1.630729, -1.290627, -2.301843, 1, 1, 1, 1, 1,
-1.62884, 0.916929, -0.3958407, 1, 1, 1, 1, 1,
-1.61712, -1.121879, -2.27577, 1, 1, 1, 1, 1,
-1.613642, -0.09477136, -2.290525, 1, 1, 1, 1, 1,
-1.5993, 0.1151662, -2.147364, 1, 1, 1, 1, 1,
-1.587642, -0.0934374, -0.5490471, 1, 1, 1, 1, 1,
-1.583559, -1.542928, -2.833129, 1, 1, 1, 1, 1,
-1.572514, 1.853557, -0.2994125, 1, 1, 1, 1, 1,
-1.557961, 0.9733107, -2.046581, 1, 1, 1, 1, 1,
-1.546636, -1.750204, -1.556839, 1, 1, 1, 1, 1,
-1.536469, -0.6561392, -2.678367, 1, 1, 1, 1, 1,
-1.512104, -0.1075426, -1.188081, 0, 0, 1, 1, 1,
-1.495646, -0.5292708, -1.848942, 1, 0, 0, 1, 1,
-1.495423, -0.9191051, -2.09872, 1, 0, 0, 1, 1,
-1.484258, -0.9056633, -3.285137, 1, 0, 0, 1, 1,
-1.483946, 1.082028, 0.906126, 1, 0, 0, 1, 1,
-1.483096, 0.07518357, -1.101374, 1, 0, 0, 1, 1,
-1.483044, 0.3704167, 0.4214171, 0, 0, 0, 1, 1,
-1.477764, 0.6392813, -1.893814, 0, 0, 0, 1, 1,
-1.47693, 0.6660994, -0.2186187, 0, 0, 0, 1, 1,
-1.47499, 0.4497961, -2.337981, 0, 0, 0, 1, 1,
-1.46952, -1.502359, -1.955778, 0, 0, 0, 1, 1,
-1.46844, -0.8817752, -2.101062, 0, 0, 0, 1, 1,
-1.46476, -0.3025276, -1.016394, 0, 0, 0, 1, 1,
-1.464564, -0.09394001, -2.643432, 1, 1, 1, 1, 1,
-1.427882, -1.638299, -4.835343, 1, 1, 1, 1, 1,
-1.426807, -1.056686, -1.158143, 1, 1, 1, 1, 1,
-1.42307, -0.06085035, -1.296672, 1, 1, 1, 1, 1,
-1.42124, -0.5702826, -2.604916, 1, 1, 1, 1, 1,
-1.418188, -0.2099909, -1.942799, 1, 1, 1, 1, 1,
-1.417634, 0.27, 0.7708809, 1, 1, 1, 1, 1,
-1.414703, 0.03539139, -1.971379, 1, 1, 1, 1, 1,
-1.400196, 0.7311959, -1.279105, 1, 1, 1, 1, 1,
-1.391034, 1.454104, 1.41145, 1, 1, 1, 1, 1,
-1.386529, -0.7437615, -2.136047, 1, 1, 1, 1, 1,
-1.372174, -1.139595, -2.070988, 1, 1, 1, 1, 1,
-1.357442, 1.43484, -1.863224, 1, 1, 1, 1, 1,
-1.350728, -1.215958, -1.811401, 1, 1, 1, 1, 1,
-1.337296, 0.7634277, -0.1198118, 1, 1, 1, 1, 1,
-1.327889, -0.1811248, -1.39437, 0, 0, 1, 1, 1,
-1.322496, -0.6629374, -0.7681667, 1, 0, 0, 1, 1,
-1.322285, 0.8676722, -0.4523905, 1, 0, 0, 1, 1,
-1.312229, 0.6288766, 0.4204687, 1, 0, 0, 1, 1,
-1.311402, 0.1210206, -2.219399, 1, 0, 0, 1, 1,
-1.308241, -1.0461, -2.204985, 1, 0, 0, 1, 1,
-1.2976, 0.6758054, 1.034574, 0, 0, 0, 1, 1,
-1.285059, 0.2101239, -2.696424, 0, 0, 0, 1, 1,
-1.281446, 1.350971, -0.8013244, 0, 0, 0, 1, 1,
-1.279629, 1.208235, -1.098969, 0, 0, 0, 1, 1,
-1.270902, 0.6680304, -2.119799, 0, 0, 0, 1, 1,
-1.269016, -0.2335952, -3.072471, 0, 0, 0, 1, 1,
-1.26397, 0.06500772, -2.583781, 0, 0, 0, 1, 1,
-1.259545, -1.331908, -1.711986, 1, 1, 1, 1, 1,
-1.257891, -1.175234, -2.785832, 1, 1, 1, 1, 1,
-1.249973, 0.8535636, -0.1650107, 1, 1, 1, 1, 1,
-1.241154, -0.9647343, -3.463815, 1, 1, 1, 1, 1,
-1.236839, 0.8829252, 1.001681, 1, 1, 1, 1, 1,
-1.222224, -0.4325775, -2.359418, 1, 1, 1, 1, 1,
-1.21828, 0.5854329, 0.2263386, 1, 1, 1, 1, 1,
-1.210594, 1.14298, -0.7970375, 1, 1, 1, 1, 1,
-1.206731, 1.335008, -0.1554847, 1, 1, 1, 1, 1,
-1.205945, -0.05365428, -1.573635, 1, 1, 1, 1, 1,
-1.199593, 0.8678588, -0.9322446, 1, 1, 1, 1, 1,
-1.194431, 1.141785, -0.708845, 1, 1, 1, 1, 1,
-1.191143, -0.1375547, -1.255601, 1, 1, 1, 1, 1,
-1.182454, 1.291121, -0.4908405, 1, 1, 1, 1, 1,
-1.180365, 0.01990382, -2.568632, 1, 1, 1, 1, 1,
-1.179724, 2.500349, -0.5326873, 0, 0, 1, 1, 1,
-1.175495, 0.4752613, -1.067514, 1, 0, 0, 1, 1,
-1.171829, 0.4795073, -1.026852, 1, 0, 0, 1, 1,
-1.155614, 0.447838, -0.7945217, 1, 0, 0, 1, 1,
-1.144132, -0.7115703, -1.949024, 1, 0, 0, 1, 1,
-1.136791, -2.984351, -2.134266, 1, 0, 0, 1, 1,
-1.134773, 0.5598335, -1.661547, 0, 0, 0, 1, 1,
-1.119598, 0.5513115, -0.4458141, 0, 0, 0, 1, 1,
-1.116405, 0.3627415, -1.267554, 0, 0, 0, 1, 1,
-1.10659, 1.814588, -0.253024, 0, 0, 0, 1, 1,
-1.100724, -1.480929, -2.632018, 0, 0, 0, 1, 1,
-1.09836, 2.438277, -1.629231, 0, 0, 0, 1, 1,
-1.084402, 0.322704, -1.179003, 0, 0, 0, 1, 1,
-1.079142, -0.9141226, -2.104614, 1, 1, 1, 1, 1,
-1.077564, 0.9353495, 0.644041, 1, 1, 1, 1, 1,
-1.076417, 0.4699981, -1.029051, 1, 1, 1, 1, 1,
-1.070427, 0.9092388, -0.4182169, 1, 1, 1, 1, 1,
-1.055753, -0.1173408, -1.939592, 1, 1, 1, 1, 1,
-1.051343, -1.919772, -1.048831, 1, 1, 1, 1, 1,
-1.044823, -1.031884, -2.0723, 1, 1, 1, 1, 1,
-1.044522, 0.5877703, -0.5055606, 1, 1, 1, 1, 1,
-1.041876, -0.3549577, -2.608398, 1, 1, 1, 1, 1,
-1.035783, -0.3539686, -1.212803, 1, 1, 1, 1, 1,
-1.029776, -2.433263, -3.03574, 1, 1, 1, 1, 1,
-1.028192, -0.03652138, -1.170008, 1, 1, 1, 1, 1,
-1.027723, -0.3785258, -1.430953, 1, 1, 1, 1, 1,
-1.025519, -1.10529, -1.576529, 1, 1, 1, 1, 1,
-1.022397, -0.09513734, -3.68101, 1, 1, 1, 1, 1,
-1.021558, 0.07847801, -1.73963, 0, 0, 1, 1, 1,
-1.017693, -2.00607, -1.327711, 1, 0, 0, 1, 1,
-1.011082, 0.738417, -1.081726, 1, 0, 0, 1, 1,
-1.005942, 1.645677, -1.851497, 1, 0, 0, 1, 1,
-1.002646, 0.562322, 0.5534833, 1, 0, 0, 1, 1,
-1.001916, 0.5508804, -0.3575562, 1, 0, 0, 1, 1,
-0.9916001, 0.5455532, 0.04771317, 0, 0, 0, 1, 1,
-0.9914992, 0.05470376, -1.34903, 0, 0, 0, 1, 1,
-0.9900558, -0.4480602, -1.255214, 0, 0, 0, 1, 1,
-0.9659681, -0.2375724, -3.508937, 0, 0, 0, 1, 1,
-0.9656532, 0.2810932, -0.2788533, 0, 0, 0, 1, 1,
-0.9633557, 0.06125132, -2.251664, 0, 0, 0, 1, 1,
-0.9627452, -1.544811, -3.701188, 0, 0, 0, 1, 1,
-0.9595097, -0.9096476, -2.655562, 1, 1, 1, 1, 1,
-0.9591988, 0.06540822, -1.092777, 1, 1, 1, 1, 1,
-0.9582438, 0.09005652, 1.776022, 1, 1, 1, 1, 1,
-0.9521263, -1.307742, -3.270962, 1, 1, 1, 1, 1,
-0.9421449, -0.02771625, -1.955473, 1, 1, 1, 1, 1,
-0.9408581, 0.7604275, -1.214689, 1, 1, 1, 1, 1,
-0.9403908, -2.280264, -1.781382, 1, 1, 1, 1, 1,
-0.9403656, 0.2784753, -0.5936388, 1, 1, 1, 1, 1,
-0.919953, -0.8298001, -1.529524, 1, 1, 1, 1, 1,
-0.9194822, -0.9054295, -0.938829, 1, 1, 1, 1, 1,
-0.9080216, -0.1188158, -0.880744, 1, 1, 1, 1, 1,
-0.907869, -0.4278233, -2.629815, 1, 1, 1, 1, 1,
-0.9075135, 1.22412, -0.09486725, 1, 1, 1, 1, 1,
-0.9059063, -1.055674, -1.652932, 1, 1, 1, 1, 1,
-0.9007429, -0.1320109, -1.373052, 1, 1, 1, 1, 1,
-0.8884028, -1.305135, -2.053015, 0, 0, 1, 1, 1,
-0.8838914, 1.331945, -2.311266, 1, 0, 0, 1, 1,
-0.8824671, -0.6570114, -3.114883, 1, 0, 0, 1, 1,
-0.8821431, 1.388283, -1.797508, 1, 0, 0, 1, 1,
-0.880318, -2.806318, -2.30468, 1, 0, 0, 1, 1,
-0.8676525, 0.09522469, -1.376775, 1, 0, 0, 1, 1,
-0.8656186, -1.661289, -3.683448, 0, 0, 0, 1, 1,
-0.864433, -0.6807032, -1.346847, 0, 0, 0, 1, 1,
-0.8630813, -0.9031686, -2.719439, 0, 0, 0, 1, 1,
-0.8619601, -0.720915, -0.216872, 0, 0, 0, 1, 1,
-0.8615905, 0.04316823, -0.167726, 0, 0, 0, 1, 1,
-0.8615563, -1.124299, -2.981002, 0, 0, 0, 1, 1,
-0.8612716, 0.4152498, -2.830117, 0, 0, 0, 1, 1,
-0.8573212, -1.346854, -2.317173, 1, 1, 1, 1, 1,
-0.8553238, 0.5737399, 0.08458136, 1, 1, 1, 1, 1,
-0.8531194, 0.6559709, -0.1909098, 1, 1, 1, 1, 1,
-0.840607, -3.406976, -3.645179, 1, 1, 1, 1, 1,
-0.8385351, -0.6366361, -1.650826, 1, 1, 1, 1, 1,
-0.8366929, -0.3268844, -2.15202, 1, 1, 1, 1, 1,
-0.8355662, 0.4953682, -0.7727655, 1, 1, 1, 1, 1,
-0.8329967, 0.1288761, -2.415818, 1, 1, 1, 1, 1,
-0.8304547, -0.2114766, -2.380981, 1, 1, 1, 1, 1,
-0.8189267, 1.05189, -1.457109, 1, 1, 1, 1, 1,
-0.8104634, -0.1486625, -2.573294, 1, 1, 1, 1, 1,
-0.8065504, -1.309179, -2.738317, 1, 1, 1, 1, 1,
-0.8035218, -0.3826035, -2.786653, 1, 1, 1, 1, 1,
-0.7995915, -1.079212, -2.880645, 1, 1, 1, 1, 1,
-0.7954459, 0.2249052, 0.794394, 1, 1, 1, 1, 1,
-0.7893662, -0.2096519, -2.37984, 0, 0, 1, 1, 1,
-0.788351, 0.398573, -2.005281, 1, 0, 0, 1, 1,
-0.7826682, -0.2135274, -0.6870138, 1, 0, 0, 1, 1,
-0.781511, -0.1513019, -3.232219, 1, 0, 0, 1, 1,
-0.7807616, -0.1436099, 0.7531051, 1, 0, 0, 1, 1,
-0.7779814, 1.773664, 1.326471, 1, 0, 0, 1, 1,
-0.7725531, -1.043574, -3.98714, 0, 0, 0, 1, 1,
-0.7647862, -0.7365774, -1.661305, 0, 0, 0, 1, 1,
-0.7643243, 0.6359971, 0.5909229, 0, 0, 0, 1, 1,
-0.7623445, 0.6279622, -0.6087382, 0, 0, 0, 1, 1,
-0.7611849, 0.2545369, 1.438248, 0, 0, 0, 1, 1,
-0.7610056, -0.8077704, -2.554524, 0, 0, 0, 1, 1,
-0.7600509, 0.6194606, 0.3818581, 0, 0, 0, 1, 1,
-0.7539659, 1.283478, 0.1129578, 1, 1, 1, 1, 1,
-0.7410854, 0.6670354, -0.3309365, 1, 1, 1, 1, 1,
-0.7403381, 0.1547733, -2.004854, 1, 1, 1, 1, 1,
-0.7394674, 1.490744, -1.51734, 1, 1, 1, 1, 1,
-0.7309295, -0.1721212, -1.764494, 1, 1, 1, 1, 1,
-0.7292166, -0.6030743, -2.032897, 1, 1, 1, 1, 1,
-0.727309, -0.2978818, -1.906917, 1, 1, 1, 1, 1,
-0.7212741, -0.9381881, -2.611195, 1, 1, 1, 1, 1,
-0.7197502, -0.3978625, -3.176934, 1, 1, 1, 1, 1,
-0.7190037, 0.2283906, -2.845967, 1, 1, 1, 1, 1,
-0.718796, -1.136409, -3.79127, 1, 1, 1, 1, 1,
-0.7152097, 0.1609289, -1.507238, 1, 1, 1, 1, 1,
-0.7122067, 0.534288, -1.431572, 1, 1, 1, 1, 1,
-0.7110538, 0.7420018, -2.29079, 1, 1, 1, 1, 1,
-0.7025236, -1.232213, -2.360821, 1, 1, 1, 1, 1,
-0.6995995, 1.324543, -0.308679, 0, 0, 1, 1, 1,
-0.6975341, -0.8857939, -2.761897, 1, 0, 0, 1, 1,
-0.6964642, -0.1120625, -3.233298, 1, 0, 0, 1, 1,
-0.6942362, 0.7608428, -1.264862, 1, 0, 0, 1, 1,
-0.6930505, -0.6326418, -1.982867, 1, 0, 0, 1, 1,
-0.6902514, 1.349942, -0.06986497, 1, 0, 0, 1, 1,
-0.68157, -1.449842, -2.911233, 0, 0, 0, 1, 1,
-0.676768, -0.4619952, -1.629529, 0, 0, 0, 1, 1,
-0.6750573, -0.1503339, -4.463911, 0, 0, 0, 1, 1,
-0.6697901, -0.8354133, -3.431838, 0, 0, 0, 1, 1,
-0.6632596, -0.5339566, -2.896713, 0, 0, 0, 1, 1,
-0.6581152, 0.294242, -1.884307, 0, 0, 0, 1, 1,
-0.6563588, 0.3045337, -0.4550301, 0, 0, 0, 1, 1,
-0.6531267, 1.285742, -0.4957533, 1, 1, 1, 1, 1,
-0.644942, -0.1184946, -3.490749, 1, 1, 1, 1, 1,
-0.6447651, 0.5440146, -0.9412707, 1, 1, 1, 1, 1,
-0.6397625, 1.100132, -0.7830907, 1, 1, 1, 1, 1,
-0.6313146, -0.2129388, -1.898905, 1, 1, 1, 1, 1,
-0.6265199, -0.1947112, -0.3097391, 1, 1, 1, 1, 1,
-0.6246299, -0.6535565, -2.949273, 1, 1, 1, 1, 1,
-0.6235061, -2.085455, -3.175107, 1, 1, 1, 1, 1,
-0.6118034, 1.66234, -1.704994, 1, 1, 1, 1, 1,
-0.6088986, 0.3483526, -1.914158, 1, 1, 1, 1, 1,
-0.5959023, 0.4120436, -1.670838, 1, 1, 1, 1, 1,
-0.5902424, 0.4791424, -1.877305, 1, 1, 1, 1, 1,
-0.5860462, -0.5978122, -3.169858, 1, 1, 1, 1, 1,
-0.5856802, 0.4466408, -1.295674, 1, 1, 1, 1, 1,
-0.5798054, 0.2899354, -1.134331, 1, 1, 1, 1, 1,
-0.5729232, -1.247106, -3.035505, 0, 0, 1, 1, 1,
-0.5728149, 0.619003, 0.3651864, 1, 0, 0, 1, 1,
-0.5726179, -1.456724, -2.733269, 1, 0, 0, 1, 1,
-0.563463, -1.651137, -2.131481, 1, 0, 0, 1, 1,
-0.5543774, -0.4361944, -2.291186, 1, 0, 0, 1, 1,
-0.549592, -1.010601, -4.667567, 1, 0, 0, 1, 1,
-0.5434775, -0.7567384, -2.12681, 0, 0, 0, 1, 1,
-0.5388454, -0.3398336, 0.8086802, 0, 0, 0, 1, 1,
-0.5381779, 0.5233831, -1.242959, 0, 0, 0, 1, 1,
-0.5327256, 0.6526184, 0.4194577, 0, 0, 0, 1, 1,
-0.5311179, 0.1755891, -1.571485, 0, 0, 0, 1, 1,
-0.5288405, 1.137439, 0.8667415, 0, 0, 0, 1, 1,
-0.5268896, -0.02862475, -3.774958, 0, 0, 0, 1, 1,
-0.5255948, -1.385855, -3.124002, 1, 1, 1, 1, 1,
-0.5251307, 0.1542338, -2.526427, 1, 1, 1, 1, 1,
-0.5223719, -0.5678462, -4.600394, 1, 1, 1, 1, 1,
-0.5181558, -0.8429695, -2.76315, 1, 1, 1, 1, 1,
-0.5147023, -0.8190261, -3.45766, 1, 1, 1, 1, 1,
-0.5105206, -0.9612253, -1.648484, 1, 1, 1, 1, 1,
-0.5088802, -0.6832631, -1.736656, 1, 1, 1, 1, 1,
-0.5087993, 1.837166, -0.9163179, 1, 1, 1, 1, 1,
-0.5078568, -0.01805509, -1.483334, 1, 1, 1, 1, 1,
-0.5070069, -0.4829498, -2.404885, 1, 1, 1, 1, 1,
-0.504498, 0.05488412, -0.9435472, 1, 1, 1, 1, 1,
-0.5027011, -1.002352, -4.007009, 1, 1, 1, 1, 1,
-0.5023283, -1.049411, -1.839423, 1, 1, 1, 1, 1,
-0.4977212, -0.03134421, -1.304604, 1, 1, 1, 1, 1,
-0.4908449, -0.2492798, -2.211276, 1, 1, 1, 1, 1,
-0.487041, 0.5443799, -0.4943729, 0, 0, 1, 1, 1,
-0.4853801, 0.8215797, 0.1314902, 1, 0, 0, 1, 1,
-0.4849042, 1.787294, 0.7534996, 1, 0, 0, 1, 1,
-0.4834257, -0.07910042, -2.596074, 1, 0, 0, 1, 1,
-0.4821839, -0.9446209, -3.559346, 1, 0, 0, 1, 1,
-0.4814617, -0.785694, -2.966207, 1, 0, 0, 1, 1,
-0.479904, -0.4689482, -2.378226, 0, 0, 0, 1, 1,
-0.4754162, -0.4482255, -1.034233, 0, 0, 0, 1, 1,
-0.4731404, -1.75982, -2.672257, 0, 0, 0, 1, 1,
-0.472317, -0.6794285, -2.648307, 0, 0, 0, 1, 1,
-0.4705269, -0.8103, -1.144332, 0, 0, 0, 1, 1,
-0.4701652, -1.536677, -2.634689, 0, 0, 0, 1, 1,
-0.4691104, 1.760562, 0.6795447, 0, 0, 0, 1, 1,
-0.4683496, 0.6936973, -0.8420571, 1, 1, 1, 1, 1,
-0.4670216, 1.721334, 0.2625317, 1, 1, 1, 1, 1,
-0.4567625, 0.02516927, -2.390479, 1, 1, 1, 1, 1,
-0.4527515, 0.4173835, -0.3841009, 1, 1, 1, 1, 1,
-0.4526176, 1.81141, 1.268711, 1, 1, 1, 1, 1,
-0.4516942, 0.7207533, -0.7460221, 1, 1, 1, 1, 1,
-0.4492407, 0.6987795, 0.5764391, 1, 1, 1, 1, 1,
-0.4471877, -0.1419714, -1.275817, 1, 1, 1, 1, 1,
-0.44605, -1.040904, -3.222056, 1, 1, 1, 1, 1,
-0.4438214, -0.3028483, -3.039387, 1, 1, 1, 1, 1,
-0.4437306, -0.3969994, -2.219171, 1, 1, 1, 1, 1,
-0.4424037, -0.4059485, -3.239202, 1, 1, 1, 1, 1,
-0.4409727, -0.3179398, -1.699857, 1, 1, 1, 1, 1,
-0.4390993, 0.9815018, 1.470108, 1, 1, 1, 1, 1,
-0.4338724, -0.2390727, -1.822861, 1, 1, 1, 1, 1,
-0.4327535, -0.2312436, -2.154934, 0, 0, 1, 1, 1,
-0.4274863, 0.3035861, -1.684353, 1, 0, 0, 1, 1,
-0.4233747, 1.042976, 0.58993, 1, 0, 0, 1, 1,
-0.4209816, 0.1301237, -1.335506, 1, 0, 0, 1, 1,
-0.41621, 0.7852082, -0.790118, 1, 0, 0, 1, 1,
-0.4157577, -0.04093004, -1.469534, 1, 0, 0, 1, 1,
-0.4128011, 1.780597, 0.8321775, 0, 0, 0, 1, 1,
-0.4127395, -1.367997, -3.05987, 0, 0, 0, 1, 1,
-0.3975383, -0.08808732, -1.938659, 0, 0, 0, 1, 1,
-0.394659, 0.3285806, -0.8718279, 0, 0, 0, 1, 1,
-0.38963, -0.1489312, -2.208465, 0, 0, 0, 1, 1,
-0.3882127, -0.4428809, -1.936977, 0, 0, 0, 1, 1,
-0.3853238, 0.5766751, -0.6208102, 0, 0, 0, 1, 1,
-0.3842303, -0.26195, -2.785468, 1, 1, 1, 1, 1,
-0.3731807, 1.947058, -0.7605186, 1, 1, 1, 1, 1,
-0.3727125, 0.07066368, -3.472662, 1, 1, 1, 1, 1,
-0.3650112, -1.231395, -2.073055, 1, 1, 1, 1, 1,
-0.361207, -0.6291006, -2.223858, 1, 1, 1, 1, 1,
-0.3600349, -0.9097859, -0.9923664, 1, 1, 1, 1, 1,
-0.3595704, 2.877244, 1.519574, 1, 1, 1, 1, 1,
-0.3592615, 1.30526, -0.1085625, 1, 1, 1, 1, 1,
-0.3587647, -0.2873522, -1.494207, 1, 1, 1, 1, 1,
-0.3541947, 1.171705, 0.1825052, 1, 1, 1, 1, 1,
-0.3523078, 0.5912885, -0.2138814, 1, 1, 1, 1, 1,
-0.3482447, 0.3255904, -1.337524, 1, 1, 1, 1, 1,
-0.3481833, 0.1775133, -0.1287807, 1, 1, 1, 1, 1,
-0.3470111, 0.3232353, 0.856629, 1, 1, 1, 1, 1,
-0.345663, 1.19346, -0.03651821, 1, 1, 1, 1, 1,
-0.3443125, -1.234868, -2.38432, 0, 0, 1, 1, 1,
-0.344108, -1.048708, -3.037752, 1, 0, 0, 1, 1,
-0.3429933, 0.7389835, 1.578302, 1, 0, 0, 1, 1,
-0.3367178, -0.3503565, -3.618261, 1, 0, 0, 1, 1,
-0.3273809, 0.008993706, 0.1415443, 1, 0, 0, 1, 1,
-0.3238392, 0.8499482, 0.2919758, 1, 0, 0, 1, 1,
-0.320942, 1.278289, -0.1064135, 0, 0, 0, 1, 1,
-0.3190124, -0.6819621, -3.200916, 0, 0, 0, 1, 1,
-0.3169194, 0.1111059, -0.6886613, 0, 0, 0, 1, 1,
-0.3139021, 0.2182037, 0.1804535, 0, 0, 0, 1, 1,
-0.3118976, -0.8599364, -3.493662, 0, 0, 0, 1, 1,
-0.31131, 0.5317571, -2.615345, 0, 0, 0, 1, 1,
-0.3081884, 0.4633795, -0.05254518, 0, 0, 0, 1, 1,
-0.3062603, -1.13969, -1.399511, 1, 1, 1, 1, 1,
-0.2958151, 1.273308, 1.387558, 1, 1, 1, 1, 1,
-0.2950526, 0.8378886, -0.8580577, 1, 1, 1, 1, 1,
-0.2948864, 0.2553201, 0.1556449, 1, 1, 1, 1, 1,
-0.2919221, 1.175012, 0.3518562, 1, 1, 1, 1, 1,
-0.2916766, -1.137769, -2.679816, 1, 1, 1, 1, 1,
-0.2887484, 0.8676859, 0.7413803, 1, 1, 1, 1, 1,
-0.2875298, -0.1312839, -4.440718, 1, 1, 1, 1, 1,
-0.2842539, -1.05919, -2.681491, 1, 1, 1, 1, 1,
-0.2662223, -1.049708, -4.146333, 1, 1, 1, 1, 1,
-0.2623127, -0.6473067, -3.775889, 1, 1, 1, 1, 1,
-0.2610017, 0.03618889, -1.791482, 1, 1, 1, 1, 1,
-0.2545476, 0.2700904, 0.6977228, 1, 1, 1, 1, 1,
-0.2479125, 1.328387, -0.556453, 1, 1, 1, 1, 1,
-0.2459275, 0.1713272, -1.339676, 1, 1, 1, 1, 1,
-0.2458857, -0.8779078, -2.805306, 0, 0, 1, 1, 1,
-0.2411308, 0.5232393, -1.053018, 1, 0, 0, 1, 1,
-0.237496, -0.6799392, -2.60501, 1, 0, 0, 1, 1,
-0.2355956, -0.04428296, 0.631137, 1, 0, 0, 1, 1,
-0.2300728, 1.339994, -0.4465123, 1, 0, 0, 1, 1,
-0.2295061, 0.9927426, -1.679332, 1, 0, 0, 1, 1,
-0.2238933, -0.2645767, -2.169685, 0, 0, 0, 1, 1,
-0.2184908, -1.105222, -2.686153, 0, 0, 0, 1, 1,
-0.2158333, 0.2444754, -0.4929329, 0, 0, 0, 1, 1,
-0.2153012, -1.603133, -4.438611, 0, 0, 0, 1, 1,
-0.2126578, -0.1968618, -2.892467, 0, 0, 0, 1, 1,
-0.20941, -1.646585, -1.412552, 0, 0, 0, 1, 1,
-0.2068004, -0.1779116, -3.121839, 0, 0, 0, 1, 1,
-0.2043702, 1.860821, -0.5012466, 1, 1, 1, 1, 1,
-0.1987705, -0.3039391, -1.422575, 1, 1, 1, 1, 1,
-0.1960207, 0.1960432, -1.332653, 1, 1, 1, 1, 1,
-0.1945104, 1.198577, 0.6120431, 1, 1, 1, 1, 1,
-0.1939076, -0.5376561, -4.440421, 1, 1, 1, 1, 1,
-0.193484, -0.2099894, -3.597635, 1, 1, 1, 1, 1,
-0.1928438, -1.843398, -2.300511, 1, 1, 1, 1, 1,
-0.1883305, -0.9366271, -3.23744, 1, 1, 1, 1, 1,
-0.1883088, 1.755455, -1.210724, 1, 1, 1, 1, 1,
-0.1846408, 2.732994, 1.442856, 1, 1, 1, 1, 1,
-0.1810923, -1.312562, -2.263385, 1, 1, 1, 1, 1,
-0.1756237, 2.453987, -0.09122091, 1, 1, 1, 1, 1,
-0.175179, -1.890851, -2.265475, 1, 1, 1, 1, 1,
-0.172449, -0.493435, -4.092901, 1, 1, 1, 1, 1,
-0.1723291, -0.9628168, -4.11352, 1, 1, 1, 1, 1,
-0.1626309, 1.003628, -1.32537, 0, 0, 1, 1, 1,
-0.1608806, 1.414179, -0.419546, 1, 0, 0, 1, 1,
-0.1595498, -0.6941931, -2.39286, 1, 0, 0, 1, 1,
-0.1582727, 0.7834868, 1.496917, 1, 0, 0, 1, 1,
-0.1550293, 0.127379, -1.17532, 1, 0, 0, 1, 1,
-0.1543581, -0.5213892, -2.308069, 1, 0, 0, 1, 1,
-0.147326, 0.1576603, 0.757829, 0, 0, 0, 1, 1,
-0.145144, 1.140464, -0.07699536, 0, 0, 0, 1, 1,
-0.1427736, 1.660109, 0.3257907, 0, 0, 0, 1, 1,
-0.1362323, 0.03186451, -0.488443, 0, 0, 0, 1, 1,
-0.1321263, 1.55444, 0.8075314, 0, 0, 0, 1, 1,
-0.1317014, -0.6196848, -1.960903, 0, 0, 0, 1, 1,
-0.131051, 0.2212626, -1.42943, 0, 0, 0, 1, 1,
-0.1294727, -1.310784, -3.488966, 1, 1, 1, 1, 1,
-0.1287907, 3.326309, -1.09813, 1, 1, 1, 1, 1,
-0.1279708, -0.5516607, -2.223171, 1, 1, 1, 1, 1,
-0.1240574, 1.626606, 0.1226392, 1, 1, 1, 1, 1,
-0.1237608, -0.01954142, -1.992524, 1, 1, 1, 1, 1,
-0.1206973, 0.4497637, -0.9383722, 1, 1, 1, 1, 1,
-0.1196945, -2.266051, -2.398823, 1, 1, 1, 1, 1,
-0.1193214, -0.9585678, -4.172194, 1, 1, 1, 1, 1,
-0.1192799, 0.633001, -0.4104306, 1, 1, 1, 1, 1,
-0.1182308, -0.08117625, -1.945682, 1, 1, 1, 1, 1,
-0.1172789, 0.9959531, 0.04739349, 1, 1, 1, 1, 1,
-0.1151694, 0.007636402, 0.2696451, 1, 1, 1, 1, 1,
-0.1148343, -0.8944315, -1.612017, 1, 1, 1, 1, 1,
-0.1135627, 1.525967, 0.2657112, 1, 1, 1, 1, 1,
-0.1122204, -0.3435667, -1.186848, 1, 1, 1, 1, 1,
-0.1068172, -0.2109839, -3.243129, 0, 0, 1, 1, 1,
-0.1061027, 0.2138178, -1.690286, 1, 0, 0, 1, 1,
-0.105704, 0.5102512, 0.2006478, 1, 0, 0, 1, 1,
-0.1046503, -1.158694, -3.227879, 1, 0, 0, 1, 1,
-0.1010601, -1.347557, -1.698274, 1, 0, 0, 1, 1,
-0.09619834, -0.1465173, 0.002530604, 1, 0, 0, 1, 1,
-0.09252058, 1.081287, 0.4745419, 0, 0, 0, 1, 1,
-0.09189273, 0.6170575, -1.302986, 0, 0, 0, 1, 1,
-0.08977099, 1.793297, 0.9006694, 0, 0, 0, 1, 1,
-0.08825405, 0.4088137, 0.07499864, 0, 0, 0, 1, 1,
-0.08060429, -0.4959839, -1.723696, 0, 0, 0, 1, 1,
-0.08013277, 1.005338, 0.4771233, 0, 0, 0, 1, 1,
-0.07771509, -0.9933448, -2.687003, 0, 0, 0, 1, 1,
-0.07594537, -0.1935557, -0.1219128, 1, 1, 1, 1, 1,
-0.07336814, -0.3067395, -4.390125, 1, 1, 1, 1, 1,
-0.06815295, 0.3212657, -0.2975543, 1, 1, 1, 1, 1,
-0.06647919, -0.139253, -2.904137, 1, 1, 1, 1, 1,
-0.0628376, -0.4050197, -2.282534, 1, 1, 1, 1, 1,
-0.06056855, -0.5751709, -1.811023, 1, 1, 1, 1, 1,
-0.05827486, 1.699965, 0.2703124, 1, 1, 1, 1, 1,
-0.05805854, 1.243027, 0.6691918, 1, 1, 1, 1, 1,
-0.05404248, -0.317859, -4.458869, 1, 1, 1, 1, 1,
-0.05140481, 1.078871, 0.1542294, 1, 1, 1, 1, 1,
-0.04720318, 0.5402753, 1.399362, 1, 1, 1, 1, 1,
-0.03361485, -0.8466108, -2.350793, 1, 1, 1, 1, 1,
-0.0270825, -1.324004, -4.049685, 1, 1, 1, 1, 1,
-0.02491031, -0.1625542, -2.157235, 1, 1, 1, 1, 1,
-0.02283951, -1.069548, -2.753829, 1, 1, 1, 1, 1,
-0.01541293, -0.5887681, -2.932678, 0, 0, 1, 1, 1,
-0.01528594, 0.5411278, -1.084987, 1, 0, 0, 1, 1,
-0.01491807, -0.4527537, -3.483825, 1, 0, 0, 1, 1,
-0.01370432, 0.2267339, -0.1037945, 1, 0, 0, 1, 1,
-0.003927566, 0.03498505, 1.569721, 1, 0, 0, 1, 1,
-0.0006575427, 0.6474625, 1.282051, 1, 0, 0, 1, 1,
0.004535633, 0.3058299, 1.604433, 0, 0, 0, 1, 1,
0.005721873, -1.884878, 3.637136, 0, 0, 0, 1, 1,
0.005738394, 1.257967, 0.1216737, 0, 0, 0, 1, 1,
0.006767657, -2.196534, 2.829769, 0, 0, 0, 1, 1,
0.009146771, 0.2199386, 0.6731573, 0, 0, 0, 1, 1,
0.01046151, -3.563495, 2.755251, 0, 0, 0, 1, 1,
0.01272304, 1.339432, -0.01595999, 0, 0, 0, 1, 1,
0.01368432, -0.7289768, 3.65842, 1, 1, 1, 1, 1,
0.01436893, 0.2387763, 0.9566391, 1, 1, 1, 1, 1,
0.01649661, -0.7230853, 4.009852, 1, 1, 1, 1, 1,
0.01702308, -0.4560654, 3.997097, 1, 1, 1, 1, 1,
0.01785786, 1.186789, -1.00159, 1, 1, 1, 1, 1,
0.01965543, 1.558947, 0.6967802, 1, 1, 1, 1, 1,
0.02509115, 0.1820381, 0.841651, 1, 1, 1, 1, 1,
0.02755457, -0.6983415, 2.513421, 1, 1, 1, 1, 1,
0.02862591, 1.249568, -0.1766604, 1, 1, 1, 1, 1,
0.02925391, -0.06096384, 1.778437, 1, 1, 1, 1, 1,
0.03295625, 0.1130144, -0.4675686, 1, 1, 1, 1, 1,
0.03314171, 2.103025, -0.2994258, 1, 1, 1, 1, 1,
0.04463295, -0.4252992, 2.811425, 1, 1, 1, 1, 1,
0.04640171, -0.9814771, 3.213782, 1, 1, 1, 1, 1,
0.0532816, -0.9764768, 3.650399, 1, 1, 1, 1, 1,
0.05416326, -1.526865, 2.355694, 0, 0, 1, 1, 1,
0.05962507, 0.5183162, 1.364392, 1, 0, 0, 1, 1,
0.06116581, -1.626764, 3.464688, 1, 0, 0, 1, 1,
0.06733911, 1.660559, 0.6324836, 1, 0, 0, 1, 1,
0.06843417, -0.3512777, 3.056893, 1, 0, 0, 1, 1,
0.07163586, -0.2983657, 2.073922, 1, 0, 0, 1, 1,
0.07255927, 0.1870452, -0.3575076, 0, 0, 0, 1, 1,
0.07500792, -2.226659, 2.959065, 0, 0, 0, 1, 1,
0.07548818, -0.2560784, 1.117035, 0, 0, 0, 1, 1,
0.07558525, 0.7395482, 1.470914, 0, 0, 0, 1, 1,
0.0758846, 0.3478231, -0.6244323, 0, 0, 0, 1, 1,
0.07598516, 1.273534, -1.958688, 0, 0, 0, 1, 1,
0.07761444, -0.7561466, 2.697076, 0, 0, 0, 1, 1,
0.07873372, -1.644387, 3.210625, 1, 1, 1, 1, 1,
0.08077812, 2.122654, -1.004372, 1, 1, 1, 1, 1,
0.0815701, 0.7003796, -1.361442, 1, 1, 1, 1, 1,
0.08259866, -0.3946775, 3.507351, 1, 1, 1, 1, 1,
0.08285178, -0.5692871, 2.453473, 1, 1, 1, 1, 1,
0.08345571, 0.7487978, -0.08772235, 1, 1, 1, 1, 1,
0.08595211, -2.651461, 2.641314, 1, 1, 1, 1, 1,
0.08744664, -1.95746, 1.938978, 1, 1, 1, 1, 1,
0.08768784, 0.002369306, 1.58086, 1, 1, 1, 1, 1,
0.08816859, -0.2042534, 2.427654, 1, 1, 1, 1, 1,
0.08870133, -0.3308529, 4.474518, 1, 1, 1, 1, 1,
0.0962327, -1.510675, 1.602044, 1, 1, 1, 1, 1,
0.09733952, -0.430844, 3.38278, 1, 1, 1, 1, 1,
0.09883966, -1.785184, 3.853612, 1, 1, 1, 1, 1,
0.1001747, 1.193833, 0.839768, 1, 1, 1, 1, 1,
0.1032483, -1.893225, 3.048781, 0, 0, 1, 1, 1,
0.1083372, -1.114565, 4.014024, 1, 0, 0, 1, 1,
0.1086989, -1.685382, 2.218969, 1, 0, 0, 1, 1,
0.112922, 0.2156241, 1.017309, 1, 0, 0, 1, 1,
0.1201797, 0.1858663, -0.07627041, 1, 0, 0, 1, 1,
0.1227637, -0.9738771, 2.977688, 1, 0, 0, 1, 1,
0.1250877, -0.2158129, 2.876997, 0, 0, 0, 1, 1,
0.126993, -0.3913645, 4.440736, 0, 0, 0, 1, 1,
0.1328381, 0.7934013, -0.3998463, 0, 0, 0, 1, 1,
0.133376, 1.853837, -0.5508532, 0, 0, 0, 1, 1,
0.1335306, -0.5161791, 1.37801, 0, 0, 0, 1, 1,
0.1378858, 1.072374, 1.462188, 0, 0, 0, 1, 1,
0.1391837, 0.4400043, -0.09750563, 0, 0, 0, 1, 1,
0.1441275, -1.839148, 4.966342, 1, 1, 1, 1, 1,
0.1513682, 0.2730196, 0.9870252, 1, 1, 1, 1, 1,
0.1554111, -0.3762895, 1.169031, 1, 1, 1, 1, 1,
0.1556099, -1.968514, 1.917137, 1, 1, 1, 1, 1,
0.1580964, 1.292846, 1.419835, 1, 1, 1, 1, 1,
0.1619493, 0.9401365, -0.02040123, 1, 1, 1, 1, 1,
0.16314, 1.309505, -0.5635608, 1, 1, 1, 1, 1,
0.1653794, 0.9085578, -0.9117228, 1, 1, 1, 1, 1,
0.1718265, -0.355332, 2.216348, 1, 1, 1, 1, 1,
0.1723022, 1.613799, 0.8893635, 1, 1, 1, 1, 1,
0.1764167, -1.074926, 2.811379, 1, 1, 1, 1, 1,
0.1793841, -0.804968, 2.541269, 1, 1, 1, 1, 1,
0.1820669, -2.299716, 0.593425, 1, 1, 1, 1, 1,
0.1855015, -0.787501, 4.0558, 1, 1, 1, 1, 1,
0.1859843, -0.7378763, 3.63679, 1, 1, 1, 1, 1,
0.1920859, -0.003462577, 1.545162, 0, 0, 1, 1, 1,
0.1927146, -0.8243259, 2.972462, 1, 0, 0, 1, 1,
0.1958919, -0.9784582, 2.206148, 1, 0, 0, 1, 1,
0.2028158, 0.6371323, -0.2593547, 1, 0, 0, 1, 1,
0.2033872, 0.8309507, -0.2769631, 1, 0, 0, 1, 1,
0.2035553, -0.3620219, 1.868186, 1, 0, 0, 1, 1,
0.2039474, -0.2542785, 2.687187, 0, 0, 0, 1, 1,
0.2064717, -0.2620832, 1.007343, 0, 0, 0, 1, 1,
0.206888, -1.835395, 1.706181, 0, 0, 0, 1, 1,
0.2139955, 0.6672192, -0.1240192, 0, 0, 0, 1, 1,
0.2141357, 1.484253, -0.2912681, 0, 0, 0, 1, 1,
0.2161867, 0.8283019, 0.9130765, 0, 0, 0, 1, 1,
0.2192338, -0.5081961, 2.494202, 0, 0, 0, 1, 1,
0.2215679, -0.605117, 4.083619, 1, 1, 1, 1, 1,
0.2224962, 0.575844, -0.1449759, 1, 1, 1, 1, 1,
0.2250186, -0.7511307, 1.544832, 1, 1, 1, 1, 1,
0.2270447, -1.615959, 3.08674, 1, 1, 1, 1, 1,
0.2294952, -1.350949, 5.009685, 1, 1, 1, 1, 1,
0.2379966, 1.313565, -0.7158313, 1, 1, 1, 1, 1,
0.2387444, 0.2935668, 0.07430514, 1, 1, 1, 1, 1,
0.2387966, -1.343077, 3.022575, 1, 1, 1, 1, 1,
0.2392785, 0.1305968, -2.331924, 1, 1, 1, 1, 1,
0.2396542, 0.5699722, 0.2516862, 1, 1, 1, 1, 1,
0.2431742, -1.733434, 2.846149, 1, 1, 1, 1, 1,
0.2584273, 0.2352467, -0.4865785, 1, 1, 1, 1, 1,
0.2611621, 0.08290403, 2.027138, 1, 1, 1, 1, 1,
0.2626835, 1.043709, 0.4276854, 1, 1, 1, 1, 1,
0.2713012, 1.133722, -1.334576, 1, 1, 1, 1, 1,
0.2752557, 1.887597, -0.144283, 0, 0, 1, 1, 1,
0.2758138, 0.2590013, 1.476012, 1, 0, 0, 1, 1,
0.2802052, -0.5602223, 2.373934, 1, 0, 0, 1, 1,
0.2840719, 2.214923, -0.4973599, 1, 0, 0, 1, 1,
0.2891993, 1.03264, 0.0143967, 1, 0, 0, 1, 1,
0.2917184, 0.5938929, -0.4192408, 1, 0, 0, 1, 1,
0.2938159, -1.579943, 1.607419, 0, 0, 0, 1, 1,
0.2959918, -1.216253, 3.217789, 0, 0, 0, 1, 1,
0.2962237, -1.90588, 3.113241, 0, 0, 0, 1, 1,
0.2985345, -1.890328, 3.572749, 0, 0, 0, 1, 1,
0.299949, 0.2935075, 2.308616, 0, 0, 0, 1, 1,
0.3013071, -1.345233, 4.737837, 0, 0, 0, 1, 1,
0.3020212, -0.7251919, 3.425745, 0, 0, 0, 1, 1,
0.3032513, 0.7683143, -1.114674, 1, 1, 1, 1, 1,
0.3045696, 1.575991, 1.702952, 1, 1, 1, 1, 1,
0.3049907, -0.6759655, 3.514838, 1, 1, 1, 1, 1,
0.3121344, -0.0499742, 1.098345, 1, 1, 1, 1, 1,
0.3134425, 0.327335, 0.6522348, 1, 1, 1, 1, 1,
0.3145113, -0.7077894, 2.726705, 1, 1, 1, 1, 1,
0.3162308, 0.6039426, 1.312405, 1, 1, 1, 1, 1,
0.3208517, -1.471373, 1.733973, 1, 1, 1, 1, 1,
0.3314731, 0.4410876, 2.962363, 1, 1, 1, 1, 1,
0.3378384, 0.6989449, 0.323282, 1, 1, 1, 1, 1,
0.3386087, 0.1359474, 1.27654, 1, 1, 1, 1, 1,
0.3472424, 0.2105746, 0.6198501, 1, 1, 1, 1, 1,
0.3474143, -0.8436607, 4.246694, 1, 1, 1, 1, 1,
0.3544781, -0.3037286, 1.157754, 1, 1, 1, 1, 1,
0.3569437, -0.7085887, 4.852169, 1, 1, 1, 1, 1,
0.3615817, -0.786553, 2.68028, 0, 0, 1, 1, 1,
0.3673615, 0.7495992, 0.6548989, 1, 0, 0, 1, 1,
0.3719465, 0.5855211, 0.6781033, 1, 0, 0, 1, 1,
0.3739282, 0.05131401, 2.088506, 1, 0, 0, 1, 1,
0.3740244, 0.3766918, 1.320152, 1, 0, 0, 1, 1,
0.3741689, -0.2149712, 1.80388, 1, 0, 0, 1, 1,
0.3757787, -0.4818957, 1.077388, 0, 0, 0, 1, 1,
0.376359, 0.6898176, 0.3886507, 0, 0, 0, 1, 1,
0.3767098, 2.025437, -0.986967, 0, 0, 0, 1, 1,
0.3772747, 1.010587, 2.183472, 0, 0, 0, 1, 1,
0.377869, -0.8277153, 2.939482, 0, 0, 0, 1, 1,
0.3787634, 0.5221485, -1.720265, 0, 0, 0, 1, 1,
0.3867355, 0.01256844, 1.577993, 0, 0, 0, 1, 1,
0.398825, 2.29027, 1.077519, 1, 1, 1, 1, 1,
0.402901, 0.2458835, 1.179639, 1, 1, 1, 1, 1,
0.4029022, -2.017416, 3.08494, 1, 1, 1, 1, 1,
0.4035816, 0.1594983, 2.659457, 1, 1, 1, 1, 1,
0.4059938, -1.488688, 2.139546, 1, 1, 1, 1, 1,
0.4079874, -0.01127642, 2.588789, 1, 1, 1, 1, 1,
0.4088174, 0.03146245, 2.273759, 1, 1, 1, 1, 1,
0.4134278, 0.3963634, -1.128301, 1, 1, 1, 1, 1,
0.4149234, 2.029369, 1.489733, 1, 1, 1, 1, 1,
0.4174109, -0.5982597, 3.839867, 1, 1, 1, 1, 1,
0.4291486, 1.20473, -0.654703, 1, 1, 1, 1, 1,
0.4304158, 0.4349947, -0.5592096, 1, 1, 1, 1, 1,
0.4308003, -2.01115, 3.652559, 1, 1, 1, 1, 1,
0.4319355, -0.4752848, 3.765653, 1, 1, 1, 1, 1,
0.4345864, 0.3904614, -0.9744646, 1, 1, 1, 1, 1,
0.4358205, 1.009112, 0.8253828, 0, 0, 1, 1, 1,
0.4380932, 0.9355271, 0.2696531, 1, 0, 0, 1, 1,
0.4407671, 1.27486, -1.138364, 1, 0, 0, 1, 1,
0.4426385, -0.097753, -1.179187, 1, 0, 0, 1, 1,
0.4429017, -0.3779127, 2.526358, 1, 0, 0, 1, 1,
0.4447784, -0.4534063, 3.599545, 1, 0, 0, 1, 1,
0.4453565, -1.72938, 3.301638, 0, 0, 0, 1, 1,
0.4469848, 0.7468135, 1.024454, 0, 0, 0, 1, 1,
0.4472402, 2.220356, 2.642868, 0, 0, 0, 1, 1,
0.4487697, 0.7160956, -0.4978809, 0, 0, 0, 1, 1,
0.449176, 1.744173, 1.686525, 0, 0, 0, 1, 1,
0.4515155, -0.9767762, 5.234951, 0, 0, 0, 1, 1,
0.4556053, 1.757813, 0.7939602, 0, 0, 0, 1, 1,
0.4575809, -1.346982, 2.354604, 1, 1, 1, 1, 1,
0.457699, 0.946392, -0.5362495, 1, 1, 1, 1, 1,
0.4687177, -0.6152584, 2.989219, 1, 1, 1, 1, 1,
0.4721408, 0.7599394, 0.8137079, 1, 1, 1, 1, 1,
0.4724525, 1.074381, 0.1900986, 1, 1, 1, 1, 1,
0.4738716, -0.9495267, 4.598524, 1, 1, 1, 1, 1,
0.474123, -1.209107, 2.551719, 1, 1, 1, 1, 1,
0.4751533, -0.6008967, 2.315309, 1, 1, 1, 1, 1,
0.4755284, 0.5352352, 2.355793, 1, 1, 1, 1, 1,
0.4755409, 1.308818, 0.7591236, 1, 1, 1, 1, 1,
0.4765833, 0.07564581, 1.941043, 1, 1, 1, 1, 1,
0.4794498, 0.2374728, 1.385651, 1, 1, 1, 1, 1,
0.4823215, -0.625895, 1.918435, 1, 1, 1, 1, 1,
0.4823594, -1.076031, 3.552783, 1, 1, 1, 1, 1,
0.4830666, -0.1404307, 1.241982, 1, 1, 1, 1, 1,
0.483824, -0.642096, 1.867165, 0, 0, 1, 1, 1,
0.4860671, 2.239097, -0.1843547, 1, 0, 0, 1, 1,
0.4867016, -1.318221, 4.109976, 1, 0, 0, 1, 1,
0.4870998, 0.7682027, -1.417141, 1, 0, 0, 1, 1,
0.4916003, -0.01967977, 1.260511, 1, 0, 0, 1, 1,
0.4945749, 1.332495, 0.8049707, 1, 0, 0, 1, 1,
0.4952154, -0.8495748, 4.173138, 0, 0, 0, 1, 1,
0.4969422, 1.021108, 0.4562233, 0, 0, 0, 1, 1,
0.4979618, 0.1721938, 3.448764, 0, 0, 0, 1, 1,
0.5011007, -0.8404399, 2.949442, 0, 0, 0, 1, 1,
0.5015946, -1.820927, 1.152742, 0, 0, 0, 1, 1,
0.5020141, 1.213817, -0.7021763, 0, 0, 0, 1, 1,
0.5045406, 0.1577301, -0.7644846, 0, 0, 0, 1, 1,
0.5061088, 0.4425196, 0.8809425, 1, 1, 1, 1, 1,
0.5065852, 0.615007, 0.4184161, 1, 1, 1, 1, 1,
0.5094106, -0.6110488, 0.5927852, 1, 1, 1, 1, 1,
0.5124989, -0.07805909, 3.443578, 1, 1, 1, 1, 1,
0.514015, 0.4115857, 0.04807709, 1, 1, 1, 1, 1,
0.5151147, -0.6189554, 1.492235, 1, 1, 1, 1, 1,
0.5153487, -1.006797, 3.473971, 1, 1, 1, 1, 1,
0.5161526, 0.387499, -0.03181197, 1, 1, 1, 1, 1,
0.5170467, -1.734378, 0.7273137, 1, 1, 1, 1, 1,
0.5211702, 0.842032, 0.7623737, 1, 1, 1, 1, 1,
0.5271754, -1.041804, 3.038908, 1, 1, 1, 1, 1,
0.5272086, 1.109251, 1.824531, 1, 1, 1, 1, 1,
0.5282239, -0.8602279, 2.632569, 1, 1, 1, 1, 1,
0.5324115, -0.3684629, 3.195324, 1, 1, 1, 1, 1,
0.5427391, 0.1950758, -1.191921, 1, 1, 1, 1, 1,
0.5446327, 0.2422654, 1.856407, 0, 0, 1, 1, 1,
0.5495494, -1.161912, 2.726122, 1, 0, 0, 1, 1,
0.5566797, 0.2257484, 2.174413, 1, 0, 0, 1, 1,
0.5590871, -0.9382334, 3.595975, 1, 0, 0, 1, 1,
0.5614225, 0.9825807, -0.6323462, 1, 0, 0, 1, 1,
0.57002, 0.844173, 2.419269, 1, 0, 0, 1, 1,
0.5709819, -0.2054196, 2.638338, 0, 0, 0, 1, 1,
0.5724699, -0.09917707, 1.784943, 0, 0, 0, 1, 1,
0.578402, 0.1441351, 4.033699, 0, 0, 0, 1, 1,
0.5828763, -1.145311, 3.00368, 0, 0, 0, 1, 1,
0.5863908, -0.8760914, 1.52809, 0, 0, 0, 1, 1,
0.5884959, -0.2206595, 2.93344, 0, 0, 0, 1, 1,
0.5906879, -0.5757025, 2.329311, 0, 0, 0, 1, 1,
0.5967348, 1.367293, 0.02552429, 1, 1, 1, 1, 1,
0.5976133, -0.07447532, 1.355371, 1, 1, 1, 1, 1,
0.598002, -0.1148268, 1.792979, 1, 1, 1, 1, 1,
0.5983109, 0.6094242, 0.2351949, 1, 1, 1, 1, 1,
0.600004, 0.9008932, 1.153604, 1, 1, 1, 1, 1,
0.6039377, -0.9951531, 2.817076, 1, 1, 1, 1, 1,
0.6041257, 2.052646, 0.8739592, 1, 1, 1, 1, 1,
0.604295, 1.129471, -0.08275388, 1, 1, 1, 1, 1,
0.6074126, 0.6727986, -0.3669891, 1, 1, 1, 1, 1,
0.6123071, 0.4680607, 0.929446, 1, 1, 1, 1, 1,
0.6187941, -1.617376, 3.09431, 1, 1, 1, 1, 1,
0.6232437, -0.3420841, 1.120933, 1, 1, 1, 1, 1,
0.6234877, -0.3105464, 1.7323, 1, 1, 1, 1, 1,
0.6252427, 0.04623783, 2.6988, 1, 1, 1, 1, 1,
0.6316736, -0.6124398, 2.001803, 1, 1, 1, 1, 1,
0.6345915, -0.202825, 2.455445, 0, 0, 1, 1, 1,
0.6370177, -0.4828705, 2.283631, 1, 0, 0, 1, 1,
0.6396714, 0.4590364, 0.1822312, 1, 0, 0, 1, 1,
0.6426739, -2.536516, 2.246947, 1, 0, 0, 1, 1,
0.6455121, 1.415848, -0.840812, 1, 0, 0, 1, 1,
0.6500282, 0.7628839, 0.8053575, 1, 0, 0, 1, 1,
0.6544852, -0.7193494, 1.649398, 0, 0, 0, 1, 1,
0.6547549, -0.7052038, 2.207124, 0, 0, 0, 1, 1,
0.6625386, 0.238953, 2.391282, 0, 0, 0, 1, 1,
0.6640615, 1.578911, 0.450819, 0, 0, 0, 1, 1,
0.6644526, -0.2851906, 2.603286, 0, 0, 0, 1, 1,
0.6668108, -1.344563, 2.681218, 0, 0, 0, 1, 1,
0.6671796, 0.8296431, 1.925767, 0, 0, 0, 1, 1,
0.6727156, -0.6737016, 4.080759, 1, 1, 1, 1, 1,
0.6812491, -0.08394895, 3.315876, 1, 1, 1, 1, 1,
0.6834093, 0.5210799, 1.149962, 1, 1, 1, 1, 1,
0.6847444, -0.1419283, 2.352952, 1, 1, 1, 1, 1,
0.6855144, 0.04447026, 1.285164, 1, 1, 1, 1, 1,
0.6919, 0.05196439, 1.195973, 1, 1, 1, 1, 1,
0.692671, -0.083956, 1.984496, 1, 1, 1, 1, 1,
0.6969678, -0.3407807, 2.373857, 1, 1, 1, 1, 1,
0.7122285, 0.08557165, 1.201726, 1, 1, 1, 1, 1,
0.715398, 2.137637, 1.669404, 1, 1, 1, 1, 1,
0.715574, 1.472309, 0.5079698, 1, 1, 1, 1, 1,
0.7167501, 0.2704402, 1.027966, 1, 1, 1, 1, 1,
0.7169316, 1.047919, 0.9776536, 1, 1, 1, 1, 1,
0.7187064, -0.3911387, 2.028745, 1, 1, 1, 1, 1,
0.7226953, 0.4127154, 1.948314, 1, 1, 1, 1, 1,
0.7282073, 0.8831797, 1.959678, 0, 0, 1, 1, 1,
0.7300048, 1.35066, 0.6402304, 1, 0, 0, 1, 1,
0.732368, 0.8609736, 0.05729393, 1, 0, 0, 1, 1,
0.7358061, -0.7771853, 0.9468161, 1, 0, 0, 1, 1,
0.7408081, -1.695, 2.594947, 1, 0, 0, 1, 1,
0.7413633, 0.3347094, 1.366521, 1, 0, 0, 1, 1,
0.7416939, -2.272842, 2.857677, 0, 0, 0, 1, 1,
0.743816, 0.6152917, 3.081381, 0, 0, 0, 1, 1,
0.7473282, 0.4840053, -1.252867, 0, 0, 0, 1, 1,
0.7478642, -0.6949062, 1.540516, 0, 0, 0, 1, 1,
0.7517219, 0.3759201, -0.8879462, 0, 0, 0, 1, 1,
0.7519079, -0.8795778, 3.830277, 0, 0, 0, 1, 1,
0.7521511, 1.369685, -0.6460219, 0, 0, 0, 1, 1,
0.7563711, -0.6224896, 1.561263, 1, 1, 1, 1, 1,
0.7627837, -0.8886112, 2.154418, 1, 1, 1, 1, 1,
0.7630563, 0.09048165, -1.422301, 1, 1, 1, 1, 1,
0.7635738, -0.3760578, 2.435913, 1, 1, 1, 1, 1,
0.7643182, 0.4375884, 1.837013, 1, 1, 1, 1, 1,
0.7651796, 0.8691546, 0.166689, 1, 1, 1, 1, 1,
0.7701093, -0.9407445, 3.238189, 1, 1, 1, 1, 1,
0.7701543, -0.4008564, 1.905014, 1, 1, 1, 1, 1,
0.7721193, 0.402829, 2.343364, 1, 1, 1, 1, 1,
0.7784993, -0.2919302, 1.319897, 1, 1, 1, 1, 1,
0.781903, 0.5416487, 1.730036, 1, 1, 1, 1, 1,
0.7823128, -0.4877321, 1.293984, 1, 1, 1, 1, 1,
0.7974148, -0.4901363, 0.390581, 1, 1, 1, 1, 1,
0.8000342, 0.7765556, 2.306303, 1, 1, 1, 1, 1,
0.801586, 1.036307, -1.164483, 1, 1, 1, 1, 1,
0.8017288, -0.9462448, 1.618904, 0, 0, 1, 1, 1,
0.8039659, 1.070218, 1.914299, 1, 0, 0, 1, 1,
0.8075021, 1.207526, 1.569691, 1, 0, 0, 1, 1,
0.8090694, 0.3606653, 0.8040491, 1, 0, 0, 1, 1,
0.8097647, 0.6277756, 0.04199922, 1, 0, 0, 1, 1,
0.8123595, -1.130408, 2.831369, 1, 0, 0, 1, 1,
0.8169584, -0.2211544, 2.316069, 0, 0, 0, 1, 1,
0.8175532, 1.275113, 2.196621, 0, 0, 0, 1, 1,
0.8179991, 2.32954, -0.9215882, 0, 0, 0, 1, 1,
0.8226971, 0.006346569, 1.340592, 0, 0, 0, 1, 1,
0.824331, -0.7888635, 0.7859572, 0, 0, 0, 1, 1,
0.8366539, -0.6120538, 0.8695025, 0, 0, 0, 1, 1,
0.8427457, 1.502233, 0.3246958, 0, 0, 0, 1, 1,
0.8432225, -0.243816, 1.364413, 1, 1, 1, 1, 1,
0.8432549, 1.436672, 0.4965929, 1, 1, 1, 1, 1,
0.844323, 0.7570631, 0.8471383, 1, 1, 1, 1, 1,
0.8445726, 0.3453539, 1.323451, 1, 1, 1, 1, 1,
0.8449742, 0.952206, 1.359724, 1, 1, 1, 1, 1,
0.8457896, 1.203363, 0.3176681, 1, 1, 1, 1, 1,
0.8467544, -1.101604, 2.770158, 1, 1, 1, 1, 1,
0.8475269, -0.3358307, 2.393689, 1, 1, 1, 1, 1,
0.8495481, -1.26211, 3.204194, 1, 1, 1, 1, 1,
0.8544697, -0.4752387, 2.699712, 1, 1, 1, 1, 1,
0.8566422, -0.191856, 0.8864663, 1, 1, 1, 1, 1,
0.858227, 0.212567, 0.925867, 1, 1, 1, 1, 1,
0.8592014, 0.1993648, -0.2520324, 1, 1, 1, 1, 1,
0.8596052, 0.9063843, 0.3882791, 1, 1, 1, 1, 1,
0.8600323, 0.896435, 1.871168, 1, 1, 1, 1, 1,
0.8616062, 0.03299675, 0.5758898, 0, 0, 1, 1, 1,
0.872327, 0.3216828, 0.3606186, 1, 0, 0, 1, 1,
0.8779368, 1.106728, 1.151703, 1, 0, 0, 1, 1,
0.8780154, -1.036681, 2.893112, 1, 0, 0, 1, 1,
0.8837641, -1.538716, 5.438034, 1, 0, 0, 1, 1,
0.8841124, -0.7199459, 1.316207, 1, 0, 0, 1, 1,
0.8892741, 0.4158119, 1.432273, 0, 0, 0, 1, 1,
0.8895769, 0.8476328, 0.2278655, 0, 0, 0, 1, 1,
0.8920276, -1.065742, 4.861721, 0, 0, 0, 1, 1,
0.8938204, 1.119561, -0.4972586, 0, 0, 0, 1, 1,
0.8956848, -0.7411824, 3.264991, 0, 0, 0, 1, 1,
0.9127755, 0.5564566, 1.149079, 0, 0, 0, 1, 1,
0.9149808, -0.7683504, 2.666584, 0, 0, 0, 1, 1,
0.9204345, 0.2368879, 2.847606, 1, 1, 1, 1, 1,
0.9223086, 0.177314, 1.892341, 1, 1, 1, 1, 1,
0.9306732, -1.645388, 4.031398, 1, 1, 1, 1, 1,
0.9313389, 0.8480653, 1.92321, 1, 1, 1, 1, 1,
0.9330106, -0.5935706, 1.637547, 1, 1, 1, 1, 1,
0.9342412, -1.028385, 2.618462, 1, 1, 1, 1, 1,
0.934689, 0.1913093, 2.288536, 1, 1, 1, 1, 1,
0.9367524, 0.5483161, 1.692812, 1, 1, 1, 1, 1,
0.9377201, -1.473612, 3.788618, 1, 1, 1, 1, 1,
0.9414315, 1.101313, 1.741315, 1, 1, 1, 1, 1,
0.941707, -0.6567594, 3.27932, 1, 1, 1, 1, 1,
0.9438357, -0.2166141, 1.321456, 1, 1, 1, 1, 1,
0.95581, -0.5035846, 1.550254, 1, 1, 1, 1, 1,
0.9611748, 0.9692704, 0.3875282, 1, 1, 1, 1, 1,
0.9615425, 0.2718332, 2.058281, 1, 1, 1, 1, 1,
0.9653032, 0.1596942, 1.779474, 0, 0, 1, 1, 1,
0.9658943, 0.6941875, 0.2442204, 1, 0, 0, 1, 1,
0.9703665, 1.233389, 0.02659616, 1, 0, 0, 1, 1,
0.970437, 1.931847, 0.7642617, 1, 0, 0, 1, 1,
0.97371, 1.10275, 1.16023, 1, 0, 0, 1, 1,
0.9775364, -0.5352184, 1.29521, 1, 0, 0, 1, 1,
0.9875814, -0.2618223, 1.249067, 0, 0, 0, 1, 1,
0.9919609, 0.1017134, 2.477339, 0, 0, 0, 1, 1,
0.9922485, 1.093246, 0.3489799, 0, 0, 0, 1, 1,
0.9929479, 1.524646, 2.237638, 0, 0, 0, 1, 1,
0.9931499, 1.607076, 1.282176, 0, 0, 0, 1, 1,
0.9934242, 0.1636189, 3.654639, 0, 0, 0, 1, 1,
0.9972368, 0.6169544, 0.1879975, 0, 0, 0, 1, 1,
0.9994012, -1.787123, 3.103402, 1, 1, 1, 1, 1,
1.001927, -2.392394, 4.663705, 1, 1, 1, 1, 1,
1.013283, -0.269196, 1.825946, 1, 1, 1, 1, 1,
1.016654, 0.8285918, -0.2868918, 1, 1, 1, 1, 1,
1.024727, 0.06417765, 1.907426, 1, 1, 1, 1, 1,
1.029241, 0.5030628, 2.442595, 1, 1, 1, 1, 1,
1.041585, 0.1850626, 1.853853, 1, 1, 1, 1, 1,
1.048747, -1.535558, 3.598821, 1, 1, 1, 1, 1,
1.04937, 0.7336508, 1.387091, 1, 1, 1, 1, 1,
1.061701, 0.7559144, -0.9952629, 1, 1, 1, 1, 1,
1.065017, 2.406371, 2.688137, 1, 1, 1, 1, 1,
1.069926, 0.6865479, 1.964045, 1, 1, 1, 1, 1,
1.069937, -0.3954381, 0.5139517, 1, 1, 1, 1, 1,
1.075331, -0.02805768, 2.512912, 1, 1, 1, 1, 1,
1.075385, -0.1858553, 1.986529, 1, 1, 1, 1, 1,
1.076539, 0.2024497, 2.20391, 0, 0, 1, 1, 1,
1.08264, 0.2691847, 1.920668, 1, 0, 0, 1, 1,
1.08397, -0.6322176, 2.240634, 1, 0, 0, 1, 1,
1.084292, -1.223743, 2.460177, 1, 0, 0, 1, 1,
1.096734, 1.161891, 0.8353732, 1, 0, 0, 1, 1,
1.109608, -1.352316, 3.625576, 1, 0, 0, 1, 1,
1.111526, -0.3238043, 0.4240068, 0, 0, 0, 1, 1,
1.111829, -1.338063, 3.605413, 0, 0, 0, 1, 1,
1.114005, 0.4884219, 1.830953, 0, 0, 0, 1, 1,
1.125506, 1.21616, 0.5760695, 0, 0, 0, 1, 1,
1.126709, -0.2220415, 1.4105, 0, 0, 0, 1, 1,
1.127003, -1.441302, 1.521124, 0, 0, 0, 1, 1,
1.12856, 0.2656491, 2.748945, 0, 0, 0, 1, 1,
1.132207, -0.8305563, 2.230198, 1, 1, 1, 1, 1,
1.13228, 0.34885, 2.773165, 1, 1, 1, 1, 1,
1.139118, 1.097817, 1.175627, 1, 1, 1, 1, 1,
1.15359, -0.7582277, 1.47652, 1, 1, 1, 1, 1,
1.154513, -0.98116, 2.091443, 1, 1, 1, 1, 1,
1.155312, 3.890255, 0.477932, 1, 1, 1, 1, 1,
1.162051, 0.5417654, 1.253706, 1, 1, 1, 1, 1,
1.163141, -1.318833, 5.288233, 1, 1, 1, 1, 1,
1.163991, -0.5631389, 4.332881, 1, 1, 1, 1, 1,
1.164912, -0.6167157, 2.012553, 1, 1, 1, 1, 1,
1.170195, 0.4559266, 2.909535, 1, 1, 1, 1, 1,
1.174295, -0.8854, 2.585928, 1, 1, 1, 1, 1,
1.184265, -2.352899, 1.447745, 1, 1, 1, 1, 1,
1.189458, -0.8697595, 3.428838, 1, 1, 1, 1, 1,
1.191037, 1.095839, 2.189847, 1, 1, 1, 1, 1,
1.191273, 3.016563, 0.7368303, 0, 0, 1, 1, 1,
1.193115, 0.07773852, 0.896342, 1, 0, 0, 1, 1,
1.19673, -1.287858, 3.47899, 1, 0, 0, 1, 1,
1.197068, 1.04121, 0.9457735, 1, 0, 0, 1, 1,
1.20175, 0.1655222, 1.634951, 1, 0, 0, 1, 1,
1.201845, -0.7454917, 3.26999, 1, 0, 0, 1, 1,
1.201953, 0.2581436, 3.030296, 0, 0, 0, 1, 1,
1.203759, -0.7331713, 0.6118463, 0, 0, 0, 1, 1,
1.208209, -0.6293611, 1.743482, 0, 0, 0, 1, 1,
1.211594, 0.630249, 1.520744, 0, 0, 0, 1, 1,
1.215405, 0.2892957, -0.3830316, 0, 0, 0, 1, 1,
1.218249, 2.322002, -0.1635721, 0, 0, 0, 1, 1,
1.225445, 0.233235, 2.622476, 0, 0, 0, 1, 1,
1.229649, -1.114506, 2.468471, 1, 1, 1, 1, 1,
1.233255, -0.2866528, 1.724966, 1, 1, 1, 1, 1,
1.238866, -0.05226169, -0.5662247, 1, 1, 1, 1, 1,
1.240527, 2.437327, 0.3851006, 1, 1, 1, 1, 1,
1.246803, -0.1472411, 2.790253, 1, 1, 1, 1, 1,
1.247369, -1.128183, 4.386091, 1, 1, 1, 1, 1,
1.258352, -1.35589, 2.281741, 1, 1, 1, 1, 1,
1.25958, -0.30364, -0.08114479, 1, 1, 1, 1, 1,
1.27264, 0.1083703, 0.13303, 1, 1, 1, 1, 1,
1.296326, -2.330648, 3.088924, 1, 1, 1, 1, 1,
1.331249, -1.316402, 0.4275242, 1, 1, 1, 1, 1,
1.331611, 0.4714279, -0.1746225, 1, 1, 1, 1, 1,
1.334022, -0.4200437, 1.241811, 1, 1, 1, 1, 1,
1.337747, -0.2199595, 2.13507, 1, 1, 1, 1, 1,
1.345948, -0.7568313, 1.012522, 1, 1, 1, 1, 1,
1.346899, 0.08726473, 1.483861, 0, 0, 1, 1, 1,
1.352844, -0.3696408, -0.1138935, 1, 0, 0, 1, 1,
1.354281, -0.02860782, 2.803916, 1, 0, 0, 1, 1,
1.366417, -0.11771, 2.019984, 1, 0, 0, 1, 1,
1.370384, 0.6794647, 1.25576, 1, 0, 0, 1, 1,
1.373265, 2.153324, 1.366877, 1, 0, 0, 1, 1,
1.374745, -1.153072, 1.69658, 0, 0, 0, 1, 1,
1.386793, 1.05183, 1.526993, 0, 0, 0, 1, 1,
1.388322, 0.229769, 0.5367712, 0, 0, 0, 1, 1,
1.395315, -0.5235715, 3.538428, 0, 0, 0, 1, 1,
1.399533, 0.02754869, 2.381504, 0, 0, 0, 1, 1,
1.400714, 0.9244422, 1.433874, 0, 0, 0, 1, 1,
1.408624, 1.366676, 1.33437, 0, 0, 0, 1, 1,
1.413293, -1.57249, 1.646279, 1, 1, 1, 1, 1,
1.415484, 0.1449723, 2.62032, 1, 1, 1, 1, 1,
1.422714, -0.1478126, 1.62737, 1, 1, 1, 1, 1,
1.423521, -0.3200045, 3.658968, 1, 1, 1, 1, 1,
1.426748, -1.521743, 1.640504, 1, 1, 1, 1, 1,
1.429869, 0.7341496, -0.2487216, 1, 1, 1, 1, 1,
1.430397, -1.726768, 2.213726, 1, 1, 1, 1, 1,
1.449746, 1.485154, 0.6795108, 1, 1, 1, 1, 1,
1.460974, -1.075116, 2.307313, 1, 1, 1, 1, 1,
1.465163, -0.2235118, 1.849067, 1, 1, 1, 1, 1,
1.466158, -0.05179491, 1.500585, 1, 1, 1, 1, 1,
1.476248, 1.363838, -0.2733974, 1, 1, 1, 1, 1,
1.477351, 0.8268437, 0.6733316, 1, 1, 1, 1, 1,
1.484993, 0.04273882, 1.192212, 1, 1, 1, 1, 1,
1.492457, 0.257576, 2.104459, 1, 1, 1, 1, 1,
1.501175, 1.037803, 1.436812, 0, 0, 1, 1, 1,
1.510198, -0.3568621, 2.427924, 1, 0, 0, 1, 1,
1.524532, 0.56498, 1.738804, 1, 0, 0, 1, 1,
1.527378, 0.3887791, 0.8290949, 1, 0, 0, 1, 1,
1.535562, 0.2726093, 0.9266514, 1, 0, 0, 1, 1,
1.540504, -0.884406, 2.425011, 1, 0, 0, 1, 1,
1.544274, 1.018762, 1.959888, 0, 0, 0, 1, 1,
1.545306, 0.5763865, 2.245081, 0, 0, 0, 1, 1,
1.548133, -1.252732, 3.155253, 0, 0, 0, 1, 1,
1.549114, -1.007569, 1.951556, 0, 0, 0, 1, 1,
1.560953, -0.3744623, 2.823116, 0, 0, 0, 1, 1,
1.563403, -0.3125754, 1.307021, 0, 0, 0, 1, 1,
1.570014, -0.26862, 2.983534, 0, 0, 0, 1, 1,
1.579596, 0.07847866, -0.3627046, 1, 1, 1, 1, 1,
1.592881, -0.4513809, 1.479547, 1, 1, 1, 1, 1,
1.595938, 0.2336145, 0.344817, 1, 1, 1, 1, 1,
1.605579, 1.625636, 0.5005019, 1, 1, 1, 1, 1,
1.616372, 0.1130598, 1.520677, 1, 1, 1, 1, 1,
1.616913, -1.762158, 1.716452, 1, 1, 1, 1, 1,
1.623385, 0.4280219, 1.9532, 1, 1, 1, 1, 1,
1.643358, 0.8817453, 2.249887, 1, 1, 1, 1, 1,
1.644712, -0.4547737, 2.158299, 1, 1, 1, 1, 1,
1.645988, 0.1409335, 2.992403, 1, 1, 1, 1, 1,
1.65218, 1.059801, 1.857389, 1, 1, 1, 1, 1,
1.676755, 0.03316518, 2.339293, 1, 1, 1, 1, 1,
1.677431, -1.232177, 1.348536, 1, 1, 1, 1, 1,
1.681461, 0.9790352, 0.5354189, 1, 1, 1, 1, 1,
1.682363, 0.8737261, -0.02224159, 1, 1, 1, 1, 1,
1.69897, 0.89446, 0.526986, 0, 0, 1, 1, 1,
1.713598, -0.07910325, 0.6119854, 1, 0, 0, 1, 1,
1.716984, 0.2537263, 0.4834432, 1, 0, 0, 1, 1,
1.719443, -1.033, 2.599061, 1, 0, 0, 1, 1,
1.739424, 0.6727916, 1.833197, 1, 0, 0, 1, 1,
1.744583, 0.0564918, 3.329853, 1, 0, 0, 1, 1,
1.777435, 0.3129648, 0.1176164, 0, 0, 0, 1, 1,
1.778014, -1.263179, 3.577713, 0, 0, 0, 1, 1,
1.7876, 0.2996251, 1.537394, 0, 0, 0, 1, 1,
1.82155, 2.21282, 1.77487, 0, 0, 0, 1, 1,
1.822442, 0.7704571, 1.863073, 0, 0, 0, 1, 1,
1.824242, 0.2950531, 2.27993, 0, 0, 0, 1, 1,
1.837378, -0.6750368, 1.20002, 0, 0, 0, 1, 1,
1.846159, -1.574456, 1.752827, 1, 1, 1, 1, 1,
1.86068, -1.054607, 0.3956853, 1, 1, 1, 1, 1,
1.87483, -0.2716963, 2.325662, 1, 1, 1, 1, 1,
1.884701, -0.8300968, 1.486672, 1, 1, 1, 1, 1,
1.887666, -0.4220244, 1.949302, 1, 1, 1, 1, 1,
1.901882, -0.4202139, 0.6687068, 1, 1, 1, 1, 1,
1.924699, -0.1030586, 0.8408391, 1, 1, 1, 1, 1,
2.006496, 0.2598009, 3.120956, 1, 1, 1, 1, 1,
2.0065, 0.1639378, 0.1524415, 1, 1, 1, 1, 1,
2.011271, 1.518753, 0.3532338, 1, 1, 1, 1, 1,
2.024633, -0.6816773, 3.279232, 1, 1, 1, 1, 1,
2.036502, 1.703923, 3.265909, 1, 1, 1, 1, 1,
2.04772, -1.189186, 3.825701, 1, 1, 1, 1, 1,
2.06415, 1.385383, -0.01487128, 1, 1, 1, 1, 1,
2.068134, 0.1199301, 0.7515918, 1, 1, 1, 1, 1,
2.098291, 0.6378783, 0.9221843, 0, 0, 1, 1, 1,
2.124162, 0.1711283, 0.81063, 1, 0, 0, 1, 1,
2.142419, -1.506087, 1.975391, 1, 0, 0, 1, 1,
2.150538, -1.090935, 1.048054, 1, 0, 0, 1, 1,
2.151568, -1.24886, 3.549499, 1, 0, 0, 1, 1,
2.18224, -0.9653866, 0.5360837, 1, 0, 0, 1, 1,
2.193945, -0.3214867, 0.7238684, 0, 0, 0, 1, 1,
2.208242, 1.513265, 1.24173, 0, 0, 0, 1, 1,
2.217839, -0.4680752, 1.695847, 0, 0, 0, 1, 1,
2.242057, 1.256021, 3.536874, 0, 0, 0, 1, 1,
2.2456, 0.7102898, 3.000293, 0, 0, 0, 1, 1,
2.260229, -1.156844, 2.221724, 0, 0, 0, 1, 1,
2.543168, 1.702189, 1.213686, 0, 0, 0, 1, 1,
2.56247, 1.751557, 1.476455, 1, 1, 1, 1, 1,
2.600672, -0.1882406, -0.007753539, 1, 1, 1, 1, 1,
2.637355, 0.1308109, 0.6869678, 1, 1, 1, 1, 1,
2.658384, -0.3993737, -0.2178165, 1, 1, 1, 1, 1,
2.698256, 0.01532409, 1.149536, 1, 1, 1, 1, 1,
2.881576, 0.946828, 3.07164, 1, 1, 1, 1, 1,
3.291521, -0.998764, 1.831258, 1, 1, 1, 1, 1
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
var radius = 9.791622;
var distance = 34.39265;
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
mvMatrix.translate( -0.1096981, 0.01786613, -0.3013456 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.39265);
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
