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
-3.330999, 0.745086, -1.666403, 1, 0, 0, 1,
-2.997529, -0.7541128, -2.524693, 1, 0.007843138, 0, 1,
-2.978002, 1.393184, -2.610122, 1, 0.01176471, 0, 1,
-2.770435, 0.1668366, 0.1011102, 1, 0.01960784, 0, 1,
-2.674425, 1.175449, -2.105377, 1, 0.02352941, 0, 1,
-2.583339, -0.7222458, -1.271488, 1, 0.03137255, 0, 1,
-2.522485, 1.361616, -0.8828235, 1, 0.03529412, 0, 1,
-2.510826, 1.445868, -1.174149, 1, 0.04313726, 0, 1,
-2.442392, 1.616713, -1.319609, 1, 0.04705882, 0, 1,
-2.391137, 0.9928151, -1.798947, 1, 0.05490196, 0, 1,
-2.379172, -0.4958611, -2.016142, 1, 0.05882353, 0, 1,
-2.355396, -0.04583547, -1.179954, 1, 0.06666667, 0, 1,
-2.305355, 0.5837032, -0.2447742, 1, 0.07058824, 0, 1,
-2.288284, -0.1300818, -3.542348, 1, 0.07843138, 0, 1,
-2.211836, -0.5885003, -1.860392, 1, 0.08235294, 0, 1,
-2.188734, 0.9147408, 0.7434995, 1, 0.09019608, 0, 1,
-2.16086, 0.2948893, -0.2714651, 1, 0.09411765, 0, 1,
-2.160419, 1.208384, 1.322208, 1, 0.1019608, 0, 1,
-2.12348, 0.01879753, -2.118339, 1, 0.1098039, 0, 1,
-2.076262, 1.84289, -0.6895061, 1, 0.1137255, 0, 1,
-2.054358, 0.8117378, -2.079098, 1, 0.1215686, 0, 1,
-2.048867, -2.105694, 0.05035662, 1, 0.1254902, 0, 1,
-2.037468, 0.1887541, -2.716999, 1, 0.1333333, 0, 1,
-2.014423, -1.046953, -2.094553, 1, 0.1372549, 0, 1,
-2.00664, -0.1262084, -1.370684, 1, 0.145098, 0, 1,
-1.981022, 0.06548128, -0.606438, 1, 0.1490196, 0, 1,
-1.977905, -0.3145339, -2.712567, 1, 0.1568628, 0, 1,
-1.968555, 0.4160446, -1.156371, 1, 0.1607843, 0, 1,
-1.953156, -0.6604187, -1.809505, 1, 0.1686275, 0, 1,
-1.95165, -1.123553, -1.90019, 1, 0.172549, 0, 1,
-1.922128, -1.001692, -2.900076, 1, 0.1803922, 0, 1,
-1.902235, -0.9612406, -1.1231, 1, 0.1843137, 0, 1,
-1.893965, 0.3010987, -0.3562793, 1, 0.1921569, 0, 1,
-1.892647, 0.1664095, -2.447855, 1, 0.1960784, 0, 1,
-1.879624, 0.7113796, 0.08807497, 1, 0.2039216, 0, 1,
-1.842199, -1.772865, -1.098605, 1, 0.2117647, 0, 1,
-1.84035, 0.201614, -0.5569812, 1, 0.2156863, 0, 1,
-1.838632, -0.5228989, -1.196441, 1, 0.2235294, 0, 1,
-1.795771, -0.7529265, -2.831188, 1, 0.227451, 0, 1,
-1.788904, -0.4360221, -1.229271, 1, 0.2352941, 0, 1,
-1.782559, -1.300303, -0.9632409, 1, 0.2392157, 0, 1,
-1.779561, -0.3395341, 1.232272, 1, 0.2470588, 0, 1,
-1.770823, -0.004546924, -2.701604, 1, 0.2509804, 0, 1,
-1.762484, -0.6107815, -0.400969, 1, 0.2588235, 0, 1,
-1.761957, 0.6623564, -0.6484075, 1, 0.2627451, 0, 1,
-1.757327, 1.543814, -1.302131, 1, 0.2705882, 0, 1,
-1.743661, -0.03295808, -1.707946, 1, 0.2745098, 0, 1,
-1.71307, 0.02118452, -2.561825, 1, 0.282353, 0, 1,
-1.710774, -2.034849, -1.625507, 1, 0.2862745, 0, 1,
-1.696343, -0.03011257, -1.943637, 1, 0.2941177, 0, 1,
-1.695479, -0.3558605, -2.220801, 1, 0.3019608, 0, 1,
-1.692446, -0.8172693, -1.453024, 1, 0.3058824, 0, 1,
-1.685372, 2.379533, 1.079804, 1, 0.3137255, 0, 1,
-1.674227, -0.6064327, -3.411928, 1, 0.3176471, 0, 1,
-1.671224, -0.1395767, -1.436524, 1, 0.3254902, 0, 1,
-1.633127, 2.030486, -2.440878, 1, 0.3294118, 0, 1,
-1.632553, 0.6714222, -1.727295, 1, 0.3372549, 0, 1,
-1.631186, 0.581839, -1.218196, 1, 0.3411765, 0, 1,
-1.624875, -0.376868, -1.484631, 1, 0.3490196, 0, 1,
-1.597265, 0.4941732, 0.4441196, 1, 0.3529412, 0, 1,
-1.593533, 0.5215073, 1.266395, 1, 0.3607843, 0, 1,
-1.586681, -0.2463209, -0.6305218, 1, 0.3647059, 0, 1,
-1.584064, 0.2468148, -2.23201, 1, 0.372549, 0, 1,
-1.580388, 1.49885, -1.085516, 1, 0.3764706, 0, 1,
-1.579001, -2.285479, -1.439514, 1, 0.3843137, 0, 1,
-1.578434, 1.307317, -1.952828, 1, 0.3882353, 0, 1,
-1.573456, -0.09085416, -0.7893602, 1, 0.3960784, 0, 1,
-1.563313, 1.241013, -0.5787849, 1, 0.4039216, 0, 1,
-1.553216, 0.7789176, -1.80165, 1, 0.4078431, 0, 1,
-1.55014, 1.093734, -0.1355325, 1, 0.4156863, 0, 1,
-1.548292, -0.3955216, -0.7093681, 1, 0.4196078, 0, 1,
-1.546376, 1.19971, -2.14804, 1, 0.427451, 0, 1,
-1.531393, 0.833066, -2.010688, 1, 0.4313726, 0, 1,
-1.530649, -1.792123, -2.758429, 1, 0.4392157, 0, 1,
-1.521309, 0.1695976, -2.226854, 1, 0.4431373, 0, 1,
-1.515209, -0.6219262, -1.92043, 1, 0.4509804, 0, 1,
-1.512448, -0.2247697, -1.903271, 1, 0.454902, 0, 1,
-1.493291, 0.7143924, -0.9103497, 1, 0.4627451, 0, 1,
-1.485647, 0.1263814, -1.977558, 1, 0.4666667, 0, 1,
-1.47624, 1.199758, 0.01768141, 1, 0.4745098, 0, 1,
-1.468763, 1.312276, -0.9537679, 1, 0.4784314, 0, 1,
-1.462615, 1.093541, 0.3281398, 1, 0.4862745, 0, 1,
-1.447833, -0.1389477, -1.348811, 1, 0.4901961, 0, 1,
-1.428432, 1.828942, -0.6906182, 1, 0.4980392, 0, 1,
-1.417567, -1.346291, -3.116832, 1, 0.5058824, 0, 1,
-1.412756, -0.3331636, -0.9837217, 1, 0.509804, 0, 1,
-1.407632, -0.9184482, -2.0422, 1, 0.5176471, 0, 1,
-1.404471, 0.1030358, -2.020512, 1, 0.5215687, 0, 1,
-1.389515, -0.2657045, -1.049364, 1, 0.5294118, 0, 1,
-1.375917, 1.449125, -1.373253, 1, 0.5333334, 0, 1,
-1.375787, 0.7413508, -0.04451069, 1, 0.5411765, 0, 1,
-1.372834, 0.8481096, -1.342292, 1, 0.5450981, 0, 1,
-1.369534, 0.5844651, -2.036831, 1, 0.5529412, 0, 1,
-1.36873, -0.8426729, -2.99993, 1, 0.5568628, 0, 1,
-1.359565, -1.027726, -4.32514, 1, 0.5647059, 0, 1,
-1.350688, -0.2568997, -1.267515, 1, 0.5686275, 0, 1,
-1.348054, 2.374765, -1.223292, 1, 0.5764706, 0, 1,
-1.333038, 0.6431425, -2.269684, 1, 0.5803922, 0, 1,
-1.330752, 1.347503, -0.6003795, 1, 0.5882353, 0, 1,
-1.327588, 0.1928501, -1.750183, 1, 0.5921569, 0, 1,
-1.31949, 0.3070916, -1.397024, 1, 0.6, 0, 1,
-1.318758, 1.049408, -1.08984, 1, 0.6078432, 0, 1,
-1.31798, -0.407816, -2.768057, 1, 0.6117647, 0, 1,
-1.314061, 1.09718, -2.73507, 1, 0.6196079, 0, 1,
-1.313168, -1.114903, -3.461127, 1, 0.6235294, 0, 1,
-1.30866, -0.2210026, -1.129673, 1, 0.6313726, 0, 1,
-1.306475, -0.2476404, -1.674898, 1, 0.6352941, 0, 1,
-1.301303, -2.943518, -2.162808, 1, 0.6431373, 0, 1,
-1.300311, -0.2909578, -1.947646, 1, 0.6470588, 0, 1,
-1.299888, -0.8162814, -3.200542, 1, 0.654902, 0, 1,
-1.294748, -0.5488109, -1.321905, 1, 0.6588235, 0, 1,
-1.294042, -2.073781, -3.954938, 1, 0.6666667, 0, 1,
-1.293819, 1.604606, -1.659248, 1, 0.6705883, 0, 1,
-1.286911, 0.1976869, -0.1695735, 1, 0.6784314, 0, 1,
-1.269275, 1.134447, -1.694394, 1, 0.682353, 0, 1,
-1.266923, -0.1444842, -2.678734, 1, 0.6901961, 0, 1,
-1.256314, -0.6715618, -2.125515, 1, 0.6941177, 0, 1,
-1.25534, -0.4768633, -1.068449, 1, 0.7019608, 0, 1,
-1.253164, -1.063346, -0.3808967, 1, 0.7098039, 0, 1,
-1.245884, -0.3057372, -0.3257223, 1, 0.7137255, 0, 1,
-1.245542, 1.176902, -1.424378, 1, 0.7215686, 0, 1,
-1.242038, -0.6779062, -2.641148, 1, 0.7254902, 0, 1,
-1.238515, 0.6320897, -0.2833446, 1, 0.7333333, 0, 1,
-1.234419, -1.20467, -2.476258, 1, 0.7372549, 0, 1,
-1.231235, 1.164588, 0.381249, 1, 0.7450981, 0, 1,
-1.228234, -0.04825189, -1.946542, 1, 0.7490196, 0, 1,
-1.225336, 1.826391, -0.3350342, 1, 0.7568628, 0, 1,
-1.224041, 0.2125847, -0.8185485, 1, 0.7607843, 0, 1,
-1.223272, -0.7140729, -1.559071, 1, 0.7686275, 0, 1,
-1.215415, 0.2036842, -2.028042, 1, 0.772549, 0, 1,
-1.210387, -1.244741, -1.484591, 1, 0.7803922, 0, 1,
-1.21028, -2.534411, -2.149203, 1, 0.7843137, 0, 1,
-1.207933, 0.4562083, -0.128998, 1, 0.7921569, 0, 1,
-1.205947, -0.875832, -0.2644086, 1, 0.7960784, 0, 1,
-1.204363, 0.06881327, -0.6612313, 1, 0.8039216, 0, 1,
-1.202856, 0.3347615, -1.213945, 1, 0.8117647, 0, 1,
-1.200682, -0.2412045, -1.281155, 1, 0.8156863, 0, 1,
-1.19971, 0.758143, -1.615908, 1, 0.8235294, 0, 1,
-1.196651, 0.4691699, 1.176987, 1, 0.827451, 0, 1,
-1.191586, 1.347824, -2.353338, 1, 0.8352941, 0, 1,
-1.190893, 1.480574, 0.02307729, 1, 0.8392157, 0, 1,
-1.188763, -1.474645, -2.565856, 1, 0.8470588, 0, 1,
-1.185356, 1.300364, 0.8749163, 1, 0.8509804, 0, 1,
-1.180095, 0.6797071, 0.5419413, 1, 0.8588235, 0, 1,
-1.180005, -0.4382972, -1.96789, 1, 0.8627451, 0, 1,
-1.175311, -0.00483882, -0.5901252, 1, 0.8705882, 0, 1,
-1.169309, 0.7727012, -0.8616159, 1, 0.8745098, 0, 1,
-1.16772, -0.4286968, -2.924533, 1, 0.8823529, 0, 1,
-1.161932, 0.738022, 0.8118643, 1, 0.8862745, 0, 1,
-1.140067, 1.028259, -0.7737375, 1, 0.8941177, 0, 1,
-1.136744, -0.9744963, -0.5348387, 1, 0.8980392, 0, 1,
-1.132407, -0.4862074, -3.588022, 1, 0.9058824, 0, 1,
-1.127054, 0.2698092, -1.926509, 1, 0.9137255, 0, 1,
-1.124372, -0.9925807, -1.251343, 1, 0.9176471, 0, 1,
-1.121339, 0.3266126, -2.510658, 1, 0.9254902, 0, 1,
-1.098954, -0.3282793, -1.692588, 1, 0.9294118, 0, 1,
-1.093195, -1.112087, 0.136698, 1, 0.9372549, 0, 1,
-1.087753, -0.6472643, -1.44682, 1, 0.9411765, 0, 1,
-1.080398, 0.2196659, -1.36313, 1, 0.9490196, 0, 1,
-1.076693, -2.565046, -1.983824, 1, 0.9529412, 0, 1,
-1.074944, 1.772978, -0.2542758, 1, 0.9607843, 0, 1,
-1.06832, -0.5182866, -1.55391, 1, 0.9647059, 0, 1,
-1.067514, -0.2797804, -0.7165785, 1, 0.972549, 0, 1,
-1.066038, -0.03100676, -0.3833972, 1, 0.9764706, 0, 1,
-1.061414, 1.128659, 0.2118479, 1, 0.9843137, 0, 1,
-1.059399, 0.2134878, -2.268889, 1, 0.9882353, 0, 1,
-1.058535, -0.004715321, -1.057842, 1, 0.9960784, 0, 1,
-1.058081, -0.5182241, -2.981647, 0.9960784, 1, 0, 1,
-1.056016, 2.814953, -0.7426714, 0.9921569, 1, 0, 1,
-1.052357, 0.02063522, -3.065732, 0.9843137, 1, 0, 1,
-1.04686, 0.5757835, -0.4934367, 0.9803922, 1, 0, 1,
-1.040825, -0.2305837, -2.256584, 0.972549, 1, 0, 1,
-1.029554, -0.3093981, -2.058785, 0.9686275, 1, 0, 1,
-1.019962, 0.062358, -0.1246459, 0.9607843, 1, 0, 1,
-1.011371, 0.5518802, -2.965266, 0.9568627, 1, 0, 1,
-1.010519, 1.116201, -1.481395, 0.9490196, 1, 0, 1,
-1.007733, -0.658569, -2.461267, 0.945098, 1, 0, 1,
-0.9988307, -1.951401, -2.027372, 0.9372549, 1, 0, 1,
-0.9946432, -0.06200561, -1.076505, 0.9333333, 1, 0, 1,
-0.9924865, 0.1020524, -2.152259, 0.9254902, 1, 0, 1,
-0.9839852, -0.3103266, -2.648494, 0.9215686, 1, 0, 1,
-0.982666, 0.8434516, -1.105369, 0.9137255, 1, 0, 1,
-0.9781666, 0.4964506, -2.531244, 0.9098039, 1, 0, 1,
-0.9692706, 0.934366, -1.638923, 0.9019608, 1, 0, 1,
-0.9687757, -0.876654, -3.584858, 0.8941177, 1, 0, 1,
-0.9666268, 0.6015955, -0.142452, 0.8901961, 1, 0, 1,
-0.9638395, 1.446006, -1.78147, 0.8823529, 1, 0, 1,
-0.9520093, -1.580613, -1.948814, 0.8784314, 1, 0, 1,
-0.9498311, 0.2137932, 0.04665798, 0.8705882, 1, 0, 1,
-0.9496974, -0.2252938, -1.38998, 0.8666667, 1, 0, 1,
-0.9481207, 0.2581147, -3.017377, 0.8588235, 1, 0, 1,
-0.9473418, 0.7623701, 0.7721284, 0.854902, 1, 0, 1,
-0.9469169, -1.512181, -2.640451, 0.8470588, 1, 0, 1,
-0.9338024, -0.6245543, -1.857628, 0.8431373, 1, 0, 1,
-0.9317192, 2.425101, -0.09204593, 0.8352941, 1, 0, 1,
-0.9254059, -1.095024, -1.890024, 0.8313726, 1, 0, 1,
-0.9248955, 1.115901, 0.5251932, 0.8235294, 1, 0, 1,
-0.9110457, 0.8418603, 0.7163524, 0.8196079, 1, 0, 1,
-0.9018904, -1.212108, -2.229255, 0.8117647, 1, 0, 1,
-0.8995444, -1.099095, -2.153652, 0.8078431, 1, 0, 1,
-0.8959284, -1.376965, -1.08751, 0.8, 1, 0, 1,
-0.8880877, 1.051836, -1.049022, 0.7921569, 1, 0, 1,
-0.8878401, -1.269889, -3.812986, 0.7882353, 1, 0, 1,
-0.8877626, -0.621986, -2.23704, 0.7803922, 1, 0, 1,
-0.886937, 0.2002626, -1.390294, 0.7764706, 1, 0, 1,
-0.8839028, 1.321496, -0.1825574, 0.7686275, 1, 0, 1,
-0.873394, 0.08355168, -1.417153, 0.7647059, 1, 0, 1,
-0.8690703, 0.5728176, -0.5491572, 0.7568628, 1, 0, 1,
-0.8655227, 0.9789211, -0.8174834, 0.7529412, 1, 0, 1,
-0.8643067, 0.3896482, -0.8780919, 0.7450981, 1, 0, 1,
-0.8625956, -0.7062213, -3.740509, 0.7411765, 1, 0, 1,
-0.8582444, -0.567311, -2.951398, 0.7333333, 1, 0, 1,
-0.8558373, -1.601399, -1.626453, 0.7294118, 1, 0, 1,
-0.8495741, 1.055665, -1.583878, 0.7215686, 1, 0, 1,
-0.8476488, -0.7802616, -2.371705, 0.7176471, 1, 0, 1,
-0.846979, 0.1780494, -2.42029, 0.7098039, 1, 0, 1,
-0.8468328, -0.1953586, -1.504709, 0.7058824, 1, 0, 1,
-0.8390666, 0.7846445, 1.102596, 0.6980392, 1, 0, 1,
-0.8370529, -0.3266892, -3.074955, 0.6901961, 1, 0, 1,
-0.8315467, -0.3904738, -1.596048, 0.6862745, 1, 0, 1,
-0.8260222, -0.3584421, -4.152333, 0.6784314, 1, 0, 1,
-0.8207587, 0.1237608, -0.8207428, 0.6745098, 1, 0, 1,
-0.8165012, -0.1388164, -2.310823, 0.6666667, 1, 0, 1,
-0.8151677, 0.4090158, -0.9391259, 0.6627451, 1, 0, 1,
-0.8146256, -0.4284279, -0.2455637, 0.654902, 1, 0, 1,
-0.8131096, -0.7069224, -2.780085, 0.6509804, 1, 0, 1,
-0.8119074, -1.017904, -3.871986, 0.6431373, 1, 0, 1,
-0.8104927, 1.024955, -1.141297, 0.6392157, 1, 0, 1,
-0.8095083, 0.207407, -3.59108, 0.6313726, 1, 0, 1,
-0.8080982, -0.660827, -2.596916, 0.627451, 1, 0, 1,
-0.806918, -1.124052, -2.501409, 0.6196079, 1, 0, 1,
-0.7975119, 0.2861401, -2.703082, 0.6156863, 1, 0, 1,
-0.7970906, 1.691957, -0.05024425, 0.6078432, 1, 0, 1,
-0.7931049, 1.693171, 1.209578, 0.6039216, 1, 0, 1,
-0.7916346, -1.405136, -3.458863, 0.5960785, 1, 0, 1,
-0.7875635, -0.2932357, -0.6653528, 0.5882353, 1, 0, 1,
-0.7867218, -1.335242, -3.540763, 0.5843138, 1, 0, 1,
-0.7800825, 0.06321385, -1.768908, 0.5764706, 1, 0, 1,
-0.778556, -1.26263, -3.004649, 0.572549, 1, 0, 1,
-0.7681313, 0.2065524, -1.922933, 0.5647059, 1, 0, 1,
-0.7678999, 1.003892, -2.390027, 0.5607843, 1, 0, 1,
-0.7674074, -1.270802, -2.403842, 0.5529412, 1, 0, 1,
-0.7653478, -0.09167437, -1.294865, 0.5490196, 1, 0, 1,
-0.7649109, -0.7081812, -2.757156, 0.5411765, 1, 0, 1,
-0.762019, -2.140023, -3.209182, 0.5372549, 1, 0, 1,
-0.7618296, 0.04224906, -2.56971, 0.5294118, 1, 0, 1,
-0.7618149, -0.5622105, -2.55373, 0.5254902, 1, 0, 1,
-0.7604903, 1.316323, -0.4400423, 0.5176471, 1, 0, 1,
-0.75451, 1.054492, -1.493523, 0.5137255, 1, 0, 1,
-0.7532645, 1.372487, -0.7936555, 0.5058824, 1, 0, 1,
-0.7493877, 1.392893, -0.8867257, 0.5019608, 1, 0, 1,
-0.7487261, -0.8335051, -2.361587, 0.4941176, 1, 0, 1,
-0.7467601, -0.717033, -1.92629, 0.4862745, 1, 0, 1,
-0.7461336, 1.425605, 1.074078, 0.4823529, 1, 0, 1,
-0.7445632, -1.455004, -3.832684, 0.4745098, 1, 0, 1,
-0.7433967, -1.711478, -2.276182, 0.4705882, 1, 0, 1,
-0.7422523, -1.890445, -2.375657, 0.4627451, 1, 0, 1,
-0.7390738, 0.2683938, -2.113463, 0.4588235, 1, 0, 1,
-0.7303181, -0.3104616, -1.956689, 0.4509804, 1, 0, 1,
-0.7250532, -1.138515, -0.49005, 0.4470588, 1, 0, 1,
-0.7243309, -0.2942423, -1.841363, 0.4392157, 1, 0, 1,
-0.7224622, 0.9285991, 0.3291143, 0.4352941, 1, 0, 1,
-0.7179658, 0.2364512, -3.346493, 0.427451, 1, 0, 1,
-0.7147292, 0.5300674, 0.8462431, 0.4235294, 1, 0, 1,
-0.7144627, -1.314146, -3.261291, 0.4156863, 1, 0, 1,
-0.7126741, 0.5863037, -1.959286, 0.4117647, 1, 0, 1,
-0.7101978, 0.142611, -0.1199407, 0.4039216, 1, 0, 1,
-0.7094414, 0.3799316, -1.475175, 0.3960784, 1, 0, 1,
-0.7050929, -0.5508687, -2.407692, 0.3921569, 1, 0, 1,
-0.7000692, 1.443541, -0.3000843, 0.3843137, 1, 0, 1,
-0.6983656, 2.997128, -0.4810582, 0.3803922, 1, 0, 1,
-0.6935919, 0.05019167, -0.824864, 0.372549, 1, 0, 1,
-0.691898, -0.2017392, -3.329353, 0.3686275, 1, 0, 1,
-0.6891881, -1.114827, -4.38515, 0.3607843, 1, 0, 1,
-0.6860398, -0.776605, -3.175925, 0.3568628, 1, 0, 1,
-0.6819313, 1.250048, -0.3697505, 0.3490196, 1, 0, 1,
-0.6813341, -0.7400617, -3.254738, 0.345098, 1, 0, 1,
-0.6796211, -0.517745, -2.672885, 0.3372549, 1, 0, 1,
-0.6790437, 0.5189562, -2.862209, 0.3333333, 1, 0, 1,
-0.6750376, -0.0913758, -2.176871, 0.3254902, 1, 0, 1,
-0.6737109, 1.964717, 0.179081, 0.3215686, 1, 0, 1,
-0.6730275, -0.8009059, -1.118847, 0.3137255, 1, 0, 1,
-0.6727963, -1.456196, -2.795728, 0.3098039, 1, 0, 1,
-0.6725426, -0.9729014, -3.596575, 0.3019608, 1, 0, 1,
-0.671034, -1.562027, -4.451551, 0.2941177, 1, 0, 1,
-0.6664116, -0.2649519, -0.858763, 0.2901961, 1, 0, 1,
-0.6661095, 0.9704049, 0.1737266, 0.282353, 1, 0, 1,
-0.6654301, 0.1021553, -1.709625, 0.2784314, 1, 0, 1,
-0.6647602, -0.9453808, -2.444415, 0.2705882, 1, 0, 1,
-0.6643671, 0.2913594, -0.7488167, 0.2666667, 1, 0, 1,
-0.6596118, 0.8079098, -0.6962351, 0.2588235, 1, 0, 1,
-0.65785, -1.130333, -3.306696, 0.254902, 1, 0, 1,
-0.6529598, 0.7966525, -0.3372399, 0.2470588, 1, 0, 1,
-0.6509321, 0.775942, -2.055218, 0.2431373, 1, 0, 1,
-0.6472322, -0.6046869, -2.166633, 0.2352941, 1, 0, 1,
-0.6438482, -0.2439395, -2.336554, 0.2313726, 1, 0, 1,
-0.6424597, 0.2573375, -0.7943139, 0.2235294, 1, 0, 1,
-0.641434, -1.477765, -3.563009, 0.2196078, 1, 0, 1,
-0.6413621, 0.3951312, -0.60631, 0.2117647, 1, 0, 1,
-0.6396885, -0.951908, -0.7079705, 0.2078431, 1, 0, 1,
-0.6367834, -0.7989202, -1.385197, 0.2, 1, 0, 1,
-0.6353561, -0.6680824, -3.26878, 0.1921569, 1, 0, 1,
-0.6347862, -0.3261038, -1.894348, 0.1882353, 1, 0, 1,
-0.630057, 0.2399663, -0.3466201, 0.1803922, 1, 0, 1,
-0.6255144, -0.1012546, -2.17537, 0.1764706, 1, 0, 1,
-0.624558, 1.025616, -2.973947, 0.1686275, 1, 0, 1,
-0.6168369, -0.1157121, 0.3225941, 0.1647059, 1, 0, 1,
-0.6099499, 0.9463534, -0.6776288, 0.1568628, 1, 0, 1,
-0.6041092, 2.826158, -0.002812353, 0.1529412, 1, 0, 1,
-0.5948795, 0.6771364, 0.3699193, 0.145098, 1, 0, 1,
-0.5887938, 1.140881, 0.4082158, 0.1411765, 1, 0, 1,
-0.5864939, -0.6787071, -1.91273, 0.1333333, 1, 0, 1,
-0.5863564, -0.9546004, -1.156313, 0.1294118, 1, 0, 1,
-0.5845292, 0.7018954, 1.217432, 0.1215686, 1, 0, 1,
-0.5824772, 0.006453472, -1.703194, 0.1176471, 1, 0, 1,
-0.5816835, 0.4075491, -1.738006, 0.1098039, 1, 0, 1,
-0.5807, -0.9419521, -2.359648, 0.1058824, 1, 0, 1,
-0.5806767, -1.745106, -3.326198, 0.09803922, 1, 0, 1,
-0.5762264, -0.4473057, -2.017447, 0.09019608, 1, 0, 1,
-0.5756616, 0.9860326, -0.8153963, 0.08627451, 1, 0, 1,
-0.5734867, 0.6286157, -0.7684814, 0.07843138, 1, 0, 1,
-0.5710311, -1.997254, -5.051912, 0.07450981, 1, 0, 1,
-0.5682048, 0.8671055, 0.1221746, 0.06666667, 1, 0, 1,
-0.5677841, 0.3552009, -0.4878774, 0.0627451, 1, 0, 1,
-0.5669613, -1.222151, -2.33616, 0.05490196, 1, 0, 1,
-0.5664114, 0.2174046, -2.562479, 0.05098039, 1, 0, 1,
-0.5663837, -0.1869227, -2.536717, 0.04313726, 1, 0, 1,
-0.5601159, 1.140105, 0.5411258, 0.03921569, 1, 0, 1,
-0.5600353, -0.08381008, -2.08131, 0.03137255, 1, 0, 1,
-0.5569999, 0.5520194, -0.6714689, 0.02745098, 1, 0, 1,
-0.5533968, 0.6624923, -1.288173, 0.01960784, 1, 0, 1,
-0.5507339, 0.4874257, 0.1906918, 0.01568628, 1, 0, 1,
-0.5475922, -0.7020842, -4.253412, 0.007843138, 1, 0, 1,
-0.5469708, -1.277454, -2.923848, 0.003921569, 1, 0, 1,
-0.5418448, -0.08481702, -1.805447, 0, 1, 0.003921569, 1,
-0.5375941, 0.9584918, -0.4443802, 0, 1, 0.01176471, 1,
-0.5358027, -0.2260734, -2.441031, 0, 1, 0.01568628, 1,
-0.5337839, -0.3600241, -3.163763, 0, 1, 0.02352941, 1,
-0.5334606, 0.08800068, -2.606214, 0, 1, 0.02745098, 1,
-0.5308141, -0.541182, -2.304695, 0, 1, 0.03529412, 1,
-0.5295125, -0.4805749, -0.5147861, 0, 1, 0.03921569, 1,
-0.5248377, -0.04549199, 0.03221511, 0, 1, 0.04705882, 1,
-0.5241796, 0.390201, -1.03841, 0, 1, 0.05098039, 1,
-0.5228835, 0.2021131, -1.76146, 0, 1, 0.05882353, 1,
-0.5216922, -0.7361404, -2.408299, 0, 1, 0.0627451, 1,
-0.520393, -1.282379, -4.165113, 0, 1, 0.07058824, 1,
-0.5159588, -1.92705, -4.594429, 0, 1, 0.07450981, 1,
-0.5111223, 1.383171, -0.5805314, 0, 1, 0.08235294, 1,
-0.5081912, -1.697768, -2.246073, 0, 1, 0.08627451, 1,
-0.5049314, -0.5856808, -3.371571, 0, 1, 0.09411765, 1,
-0.498013, -0.3753963, 0.2723361, 0, 1, 0.1019608, 1,
-0.4973666, 0.7391713, 0.1145161, 0, 1, 0.1058824, 1,
-0.49444, -1.272301, -2.238388, 0, 1, 0.1137255, 1,
-0.4936825, 0.2943866, -0.08941504, 0, 1, 0.1176471, 1,
-0.493593, -0.6439357, -2.771415, 0, 1, 0.1254902, 1,
-0.4923806, -1.084938, -4.205379, 0, 1, 0.1294118, 1,
-0.4871667, -0.08506835, -2.102795, 0, 1, 0.1372549, 1,
-0.4828337, -0.09590599, -2.256347, 0, 1, 0.1411765, 1,
-0.4822429, -2.466759, -4.065243, 0, 1, 0.1490196, 1,
-0.4794642, -0.5734652, -1.387722, 0, 1, 0.1529412, 1,
-0.4788701, -1.531482, -3.475708, 0, 1, 0.1607843, 1,
-0.4782001, 1.368425, -1.040452, 0, 1, 0.1647059, 1,
-0.4762256, 1.107598, 1.07593, 0, 1, 0.172549, 1,
-0.4704634, 0.3477625, -0.5198102, 0, 1, 0.1764706, 1,
-0.4671565, 0.6800634, -1.562718, 0, 1, 0.1843137, 1,
-0.4668363, 0.8088102, -0.1918955, 0, 1, 0.1882353, 1,
-0.4666997, 0.9099241, -2.11683, 0, 1, 0.1960784, 1,
-0.4644183, 1.491912, -0.3554646, 0, 1, 0.2039216, 1,
-0.4620408, 0.6229517, -0.1415529, 0, 1, 0.2078431, 1,
-0.4563811, -0.1225616, -1.175992, 0, 1, 0.2156863, 1,
-0.4504625, 1.484167, -0.5649206, 0, 1, 0.2196078, 1,
-0.4494636, -0.4346366, -3.131326, 0, 1, 0.227451, 1,
-0.4428651, -1.39984, -1.705067, 0, 1, 0.2313726, 1,
-0.4397324, 1.186451, 0.4918697, 0, 1, 0.2392157, 1,
-0.4394218, 0.6802159, 0.4716092, 0, 1, 0.2431373, 1,
-0.4368597, -0.2814704, -2.798429, 0, 1, 0.2509804, 1,
-0.4282352, 1.190364, 0.9328273, 0, 1, 0.254902, 1,
-0.4261968, 0.873817, -1.953339, 0, 1, 0.2627451, 1,
-0.4227735, -0.6651978, -2.83616, 0, 1, 0.2666667, 1,
-0.4180168, -1.89405, -1.776445, 0, 1, 0.2745098, 1,
-0.41613, 0.3248796, -0.02465483, 0, 1, 0.2784314, 1,
-0.4110701, 0.936997, -0.6820961, 0, 1, 0.2862745, 1,
-0.4084257, 0.4912847, 0.01555215, 0, 1, 0.2901961, 1,
-0.4022365, -1.550937, -1.789354, 0, 1, 0.2980392, 1,
-0.4020882, -0.4996598, -2.524252, 0, 1, 0.3058824, 1,
-0.399092, -0.4479865, -3.052942, 0, 1, 0.3098039, 1,
-0.3978919, 0.6425262, 0.8916088, 0, 1, 0.3176471, 1,
-0.3971503, 0.07338529, -2.858152, 0, 1, 0.3215686, 1,
-0.395164, 1.151633, -0.69605, 0, 1, 0.3294118, 1,
-0.3939708, 0.3929427, -0.4597284, 0, 1, 0.3333333, 1,
-0.3870648, -1.480616, -4.385764, 0, 1, 0.3411765, 1,
-0.3809868, -0.4300463, -3.419658, 0, 1, 0.345098, 1,
-0.3809479, -2.082662, -3.902604, 0, 1, 0.3529412, 1,
-0.3786623, -1.579133, -2.331558, 0, 1, 0.3568628, 1,
-0.3781126, 0.05588367, -0.9313734, 0, 1, 0.3647059, 1,
-0.3769326, 0.8822808, -0.9546794, 0, 1, 0.3686275, 1,
-0.367525, -1.584884, -3.031927, 0, 1, 0.3764706, 1,
-0.3617853, -1.370402, -1.997139, 0, 1, 0.3803922, 1,
-0.3599913, -0.8196071, -0.6831039, 0, 1, 0.3882353, 1,
-0.3589549, 1.942958, 1.665893, 0, 1, 0.3921569, 1,
-0.3533066, 1.084645, -1.250706, 0, 1, 0.4, 1,
-0.3515527, -0.5542249, -4.127215, 0, 1, 0.4078431, 1,
-0.3497589, -0.03248331, -1.995986, 0, 1, 0.4117647, 1,
-0.3455109, 0.3421563, -2.012789, 0, 1, 0.4196078, 1,
-0.3388528, -0.7648027, -0.7474539, 0, 1, 0.4235294, 1,
-0.3381242, -2.130464, -3.878478, 0, 1, 0.4313726, 1,
-0.3360822, -0.6350138, -1.71672, 0, 1, 0.4352941, 1,
-0.3355868, -2.79596, -2.009311, 0, 1, 0.4431373, 1,
-0.3355354, 0.5033235, -0.6947836, 0, 1, 0.4470588, 1,
-0.3291925, -1.340518, -4.534222, 0, 1, 0.454902, 1,
-0.3246227, 0.8472274, 0.3126518, 0, 1, 0.4588235, 1,
-0.323943, 0.3009639, -0.5944235, 0, 1, 0.4666667, 1,
-0.3217312, 0.3280073, -2.947276, 0, 1, 0.4705882, 1,
-0.3172759, -0.2473793, -2.513682, 0, 1, 0.4784314, 1,
-0.3165844, 0.8810012, 0.3146451, 0, 1, 0.4823529, 1,
-0.3129566, 0.01582881, -1.697349, 0, 1, 0.4901961, 1,
-0.3120298, 2.365797, -0.5439636, 0, 1, 0.4941176, 1,
-0.3106743, -3.209047, -5.037936, 0, 1, 0.5019608, 1,
-0.3073064, 2.127859, -0.7516466, 0, 1, 0.509804, 1,
-0.3050599, -0.03706035, -1.109299, 0, 1, 0.5137255, 1,
-0.3047836, -0.4892446, -1.688587, 0, 1, 0.5215687, 1,
-0.3004523, -1.206126, -3.72266, 0, 1, 0.5254902, 1,
-0.2973368, 0.4234636, -2.321024, 0, 1, 0.5333334, 1,
-0.2969522, -1.579737, -2.442146, 0, 1, 0.5372549, 1,
-0.2936789, 0.2317756, -0.3847226, 0, 1, 0.5450981, 1,
-0.2917976, 0.09284475, -1.529398, 0, 1, 0.5490196, 1,
-0.2915564, 0.9822476, -0.1607989, 0, 1, 0.5568628, 1,
-0.2893698, -0.6093548, -4.018407, 0, 1, 0.5607843, 1,
-0.2893594, -1.164966, -4.888605, 0, 1, 0.5686275, 1,
-0.2889041, -0.667118, -4.643234, 0, 1, 0.572549, 1,
-0.2886852, 1.155329, 0.2002288, 0, 1, 0.5803922, 1,
-0.2883933, 1.928583, -0.3079547, 0, 1, 0.5843138, 1,
-0.2870952, 0.490648, 0.8686026, 0, 1, 0.5921569, 1,
-0.2870789, 0.3340206, -0.3022912, 0, 1, 0.5960785, 1,
-0.2864973, -1.071623, -5.579666, 0, 1, 0.6039216, 1,
-0.2789778, -0.5741023, -3.35566, 0, 1, 0.6117647, 1,
-0.2777987, 0.8936366, -1.41026, 0, 1, 0.6156863, 1,
-0.2753783, 0.7803825, -0.08611757, 0, 1, 0.6235294, 1,
-0.2753628, -1.740355, -4.291387, 0, 1, 0.627451, 1,
-0.275102, -0.435135, -2.200725, 0, 1, 0.6352941, 1,
-0.2701351, 0.5774395, 1.932775, 0, 1, 0.6392157, 1,
-0.2651829, 2.698544, -2.277545, 0, 1, 0.6470588, 1,
-0.2636297, 0.8241476, -1.336543, 0, 1, 0.6509804, 1,
-0.2624236, 0.4820765, -1.480378, 0, 1, 0.6588235, 1,
-0.2621115, -0.629501, -2.312824, 0, 1, 0.6627451, 1,
-0.2556396, -0.3892574, -2.177285, 0, 1, 0.6705883, 1,
-0.2480589, 2.229206, -0.9832333, 0, 1, 0.6745098, 1,
-0.2477071, 0.4601777, -1.06515, 0, 1, 0.682353, 1,
-0.2423022, 1.576353, 0.3924315, 0, 1, 0.6862745, 1,
-0.2392743, 0.6746033, 1.375405, 0, 1, 0.6941177, 1,
-0.2354303, 1.698111, 0.2888282, 0, 1, 0.7019608, 1,
-0.229654, -0.2649862, -2.581008, 0, 1, 0.7058824, 1,
-0.2268352, -1.048004, -2.240708, 0, 1, 0.7137255, 1,
-0.2238019, -0.1451254, -3.637395, 0, 1, 0.7176471, 1,
-0.2232503, -0.01357896, -1.005733, 0, 1, 0.7254902, 1,
-0.2143281, -0.3428667, -3.244122, 0, 1, 0.7294118, 1,
-0.2059519, 0.3349859, 0.002934985, 0, 1, 0.7372549, 1,
-0.203327, -0.5944522, -2.863919, 0, 1, 0.7411765, 1,
-0.2023874, 1.065635, -0.6725965, 0, 1, 0.7490196, 1,
-0.2008154, 0.04698339, -1.544675, 0, 1, 0.7529412, 1,
-0.1934219, 0.9335446, 0.9570109, 0, 1, 0.7607843, 1,
-0.1921503, -1.458117, -2.36111, 0, 1, 0.7647059, 1,
-0.182643, 0.7397297, 0.6425577, 0, 1, 0.772549, 1,
-0.1811696, -0.5017965, -4.965057, 0, 1, 0.7764706, 1,
-0.175649, 0.44527, -1.81557, 0, 1, 0.7843137, 1,
-0.1754616, -0.69821, -1.837839, 0, 1, 0.7882353, 1,
-0.1746845, -0.3671617, -2.203756, 0, 1, 0.7960784, 1,
-0.1700297, -0.1459805, -3.199299, 0, 1, 0.8039216, 1,
-0.1690918, -0.1142789, -4.08141, 0, 1, 0.8078431, 1,
-0.1677874, -0.2103174, -4.797339, 0, 1, 0.8156863, 1,
-0.1654617, 2.010553, 1.010392, 0, 1, 0.8196079, 1,
-0.1650352, 1.275537, 0.4740545, 0, 1, 0.827451, 1,
-0.1629533, -0.2334132, -1.644176, 0, 1, 0.8313726, 1,
-0.1597741, 0.3700186, -1.311206, 0, 1, 0.8392157, 1,
-0.1595823, 0.2814475, -1.370756, 0, 1, 0.8431373, 1,
-0.1566534, -1.299644, -2.857031, 0, 1, 0.8509804, 1,
-0.1566432, 0.2949265, 0.1583001, 0, 1, 0.854902, 1,
-0.1537589, 0.4878122, -0.9204935, 0, 1, 0.8627451, 1,
-0.1532514, -2.511199, -3.294729, 0, 1, 0.8666667, 1,
-0.1481481, -0.8235061, -5.554038, 0, 1, 0.8745098, 1,
-0.1468004, 2.952292, 0.3965061, 0, 1, 0.8784314, 1,
-0.1449859, 0.2494475, -0.8147929, 0, 1, 0.8862745, 1,
-0.1430497, 0.7248065, -0.690986, 0, 1, 0.8901961, 1,
-0.1422489, 0.5463023, -0.4296961, 0, 1, 0.8980392, 1,
-0.1390831, -0.09496449, -2.421071, 0, 1, 0.9058824, 1,
-0.1386683, 0.9239404, -1.207666, 0, 1, 0.9098039, 1,
-0.1386242, 0.8242306, 1.382906, 0, 1, 0.9176471, 1,
-0.1382897, -0.5318787, -2.63684, 0, 1, 0.9215686, 1,
-0.1355441, 0.7534205, -0.07459172, 0, 1, 0.9294118, 1,
-0.1340193, 1.023128, -0.1268767, 0, 1, 0.9333333, 1,
-0.1321066, 0.4855906, 1.577136, 0, 1, 0.9411765, 1,
-0.132086, -0.8871977, -3.144788, 0, 1, 0.945098, 1,
-0.1306001, 0.3333957, -1.16992, 0, 1, 0.9529412, 1,
-0.1303244, -0.00289211, -1.163768, 0, 1, 0.9568627, 1,
-0.1297677, -1.982701, -1.999876, 0, 1, 0.9647059, 1,
-0.1283357, 0.9906134, 1.307485, 0, 1, 0.9686275, 1,
-0.1266903, -0.2568196, -1.424976, 0, 1, 0.9764706, 1,
-0.1251877, 1.937533, -1.546217, 0, 1, 0.9803922, 1,
-0.1243724, -0.5526287, -3.149772, 0, 1, 0.9882353, 1,
-0.1230154, 0.4201226, 0.05885286, 0, 1, 0.9921569, 1,
-0.1193633, 0.3804357, -0.2784894, 0, 1, 1, 1,
-0.1159314, -1.424641, -1.789993, 0, 0.9921569, 1, 1,
-0.1140476, 0.3990274, -0.2173749, 0, 0.9882353, 1, 1,
-0.1100223, -0.5406128, -3.081913, 0, 0.9803922, 1, 1,
-0.1097902, 0.2097669, 0.03914876, 0, 0.9764706, 1, 1,
-0.1014567, 0.2426592, -0.844096, 0, 0.9686275, 1, 1,
-0.09975963, 0.5112571, 0.6211865, 0, 0.9647059, 1, 1,
-0.09666291, -0.5342079, -2.228286, 0, 0.9568627, 1, 1,
-0.09656038, -0.7755265, -2.234152, 0, 0.9529412, 1, 1,
-0.0933699, -1.777103, -1.786342, 0, 0.945098, 1, 1,
-0.09142327, -0.3169253, -3.541378, 0, 0.9411765, 1, 1,
-0.0900976, -0.3878896, -3.055249, 0, 0.9333333, 1, 1,
-0.08308244, -0.8642621, -2.928952, 0, 0.9294118, 1, 1,
-0.0808358, -0.9148556, -1.207505, 0, 0.9215686, 1, 1,
-0.07652066, 0.4107735, 0.5170001, 0, 0.9176471, 1, 1,
-0.07271969, -0.3434487, -1.776077, 0, 0.9098039, 1, 1,
-0.07136652, -0.4432273, -1.728868, 0, 0.9058824, 1, 1,
-0.06136409, 0.2073072, -0.7212127, 0, 0.8980392, 1, 1,
-0.0559816, 0.6539387, -0.3218354, 0, 0.8901961, 1, 1,
-0.05030094, -1.292199, -1.988622, 0, 0.8862745, 1, 1,
-0.04952434, -0.1115001, -2.337753, 0, 0.8784314, 1, 1,
-0.04785569, -2.359162, -3.115247, 0, 0.8745098, 1, 1,
-0.04551752, 0.3099419, -1.519925, 0, 0.8666667, 1, 1,
-0.04390538, -0.8831936, -2.927611, 0, 0.8627451, 1, 1,
-0.04006977, 0.3053223, -0.1879262, 0, 0.854902, 1, 1,
-0.03051891, -1.423193, -1.992836, 0, 0.8509804, 1, 1,
-0.02980933, 1.326111, 1.220896, 0, 0.8431373, 1, 1,
-0.02786819, 0.2956124, 0.2394677, 0, 0.8392157, 1, 1,
-0.0223029, -0.3950675, -2.72448, 0, 0.8313726, 1, 1,
-0.01860156, 0.7404639, -2.748578, 0, 0.827451, 1, 1,
-0.01853938, 0.6837064, 0.04849327, 0, 0.8196079, 1, 1,
-0.0109292, -0.3521537, -1.473172, 0, 0.8156863, 1, 1,
-0.009359849, -0.4852761, -5.528662, 0, 0.8078431, 1, 1,
-0.007457121, 0.7571383, 2.083373, 0, 0.8039216, 1, 1,
-0.007380723, 0.7417717, -0.9458317, 0, 0.7960784, 1, 1,
-0.005664696, -0.2984578, -3.15162, 0, 0.7882353, 1, 1,
-0.002991149, 1.253977, 0.87884, 0, 0.7843137, 1, 1,
-0.0009952632, 0.09872108, 0.03751507, 0, 0.7764706, 1, 1,
-2.977903e-05, -0.5624567, -4.420479, 0, 0.772549, 1, 1,
0.0004645326, -0.3038632, 3.109268, 0, 0.7647059, 1, 1,
0.001502419, -1.420084, 4.008401, 0, 0.7607843, 1, 1,
0.001965978, 0.7536962, -0.3206607, 0, 0.7529412, 1, 1,
0.003815001, 0.6521773, -0.1227041, 0, 0.7490196, 1, 1,
0.0135527, -0.4251877, 2.611251, 0, 0.7411765, 1, 1,
0.01611448, -0.248809, 4.020453, 0, 0.7372549, 1, 1,
0.01626237, -0.3185158, 2.884258, 0, 0.7294118, 1, 1,
0.0165906, 0.8608706, 1.071307, 0, 0.7254902, 1, 1,
0.01976659, -1.517982, 4.444255, 0, 0.7176471, 1, 1,
0.02009924, -0.7073088, 2.991407, 0, 0.7137255, 1, 1,
0.02872457, 0.3555067, 0.704699, 0, 0.7058824, 1, 1,
0.02970846, -0.5336173, 3.19723, 0, 0.6980392, 1, 1,
0.03178672, 1.028652, 1.357668, 0, 0.6941177, 1, 1,
0.03519335, -0.6710322, 3.635387, 0, 0.6862745, 1, 1,
0.03801221, -0.06382482, 3.160173, 0, 0.682353, 1, 1,
0.0394175, 0.6654058, 0.2092374, 0, 0.6745098, 1, 1,
0.04032582, 0.006254347, 1.404782, 0, 0.6705883, 1, 1,
0.04206323, -0.6215093, 2.233552, 0, 0.6627451, 1, 1,
0.04274684, 0.1899398, 3.239663, 0, 0.6588235, 1, 1,
0.04422208, -0.3109613, 2.711239, 0, 0.6509804, 1, 1,
0.0444424, -0.2941329, 4.941978, 0, 0.6470588, 1, 1,
0.04575703, -2.004345, 1.668946, 0, 0.6392157, 1, 1,
0.04790945, -0.674941, 2.295605, 0, 0.6352941, 1, 1,
0.04899956, -0.4477135, 2.316453, 0, 0.627451, 1, 1,
0.05458726, 0.9893584, 0.4422136, 0, 0.6235294, 1, 1,
0.05739739, -1.116202, 4.06073, 0, 0.6156863, 1, 1,
0.06054873, 0.2378019, -0.3904913, 0, 0.6117647, 1, 1,
0.06128804, 1.570198, -0.8094564, 0, 0.6039216, 1, 1,
0.06262442, 1.802822, -1.025866, 0, 0.5960785, 1, 1,
0.06793561, -0.6288002, 2.446146, 0, 0.5921569, 1, 1,
0.07049659, 0.3451385, -0.02165397, 0, 0.5843138, 1, 1,
0.07108108, 0.6328647, -0.02065185, 0, 0.5803922, 1, 1,
0.07201389, -0.2407422, 1.686673, 0, 0.572549, 1, 1,
0.07628316, -0.9736601, 2.547221, 0, 0.5686275, 1, 1,
0.07936621, 1.345267, 1.206672, 0, 0.5607843, 1, 1,
0.08044393, -0.306997, 3.884014, 0, 0.5568628, 1, 1,
0.08106627, -0.4536931, 3.382207, 0, 0.5490196, 1, 1,
0.08702809, 0.8997356, 1.332797, 0, 0.5450981, 1, 1,
0.08863596, 1.445777, 0.7417195, 0, 0.5372549, 1, 1,
0.08981171, -1.739703, 2.437021, 0, 0.5333334, 1, 1,
0.09177659, 0.1687539, 0.4357641, 0, 0.5254902, 1, 1,
0.09476081, 1.341063, 0.1729236, 0, 0.5215687, 1, 1,
0.09722444, -0.7666425, 2.351104, 0, 0.5137255, 1, 1,
0.1072362, 0.06070384, 1.548085, 0, 0.509804, 1, 1,
0.112466, 1.032604, -0.893405, 0, 0.5019608, 1, 1,
0.112702, 0.1713814, -0.4065563, 0, 0.4941176, 1, 1,
0.1172147, -0.6283081, 3.605308, 0, 0.4901961, 1, 1,
0.1216229, -0.08073481, 2.472701, 0, 0.4823529, 1, 1,
0.1258384, 1.105371, 0.8650261, 0, 0.4784314, 1, 1,
0.1300145, -0.2702281, 3.273025, 0, 0.4705882, 1, 1,
0.1313577, -1.579163, 2.126123, 0, 0.4666667, 1, 1,
0.1498995, 1.410612, -0.3657371, 0, 0.4588235, 1, 1,
0.1571221, -0.4617468, 3.024541, 0, 0.454902, 1, 1,
0.1583335, 0.5383986, 1.417215, 0, 0.4470588, 1, 1,
0.1584222, 0.8787403, -0.1177716, 0, 0.4431373, 1, 1,
0.1585236, 1.877214, 0.4482473, 0, 0.4352941, 1, 1,
0.1592916, 0.7224408, 0.07637671, 0, 0.4313726, 1, 1,
0.1721665, 1.140769, -1.590528, 0, 0.4235294, 1, 1,
0.1760574, 0.5915958, -0.5229704, 0, 0.4196078, 1, 1,
0.1764987, 0.2693228, 1.054151, 0, 0.4117647, 1, 1,
0.1783975, 0.04916335, 0.8141818, 0, 0.4078431, 1, 1,
0.179147, 0.4741591, 0.3625433, 0, 0.4, 1, 1,
0.1799955, -1.589028, 1.778775, 0, 0.3921569, 1, 1,
0.1813354, -0.3136376, 2.72909, 0, 0.3882353, 1, 1,
0.185516, -0.7585219, 3.083867, 0, 0.3803922, 1, 1,
0.1931936, -2.268248, 4.00119, 0, 0.3764706, 1, 1,
0.2029399, -1.004244, 3.728842, 0, 0.3686275, 1, 1,
0.2107719, -0.342287, 2.40193, 0, 0.3647059, 1, 1,
0.2114568, 0.7491122, -0.1265974, 0, 0.3568628, 1, 1,
0.2164109, -0.237718, 2.221649, 0, 0.3529412, 1, 1,
0.2168722, 0.6216693, -0.1292955, 0, 0.345098, 1, 1,
0.2204117, -0.1684416, 1.260229, 0, 0.3411765, 1, 1,
0.2215317, 0.7400057, 0.03281448, 0, 0.3333333, 1, 1,
0.2219264, -0.8027564, 4.228162, 0, 0.3294118, 1, 1,
0.2269506, -0.0366865, 1.052654, 0, 0.3215686, 1, 1,
0.2296856, -1.613159, 4.589968, 0, 0.3176471, 1, 1,
0.2302901, 0.7779388, 0.2854089, 0, 0.3098039, 1, 1,
0.2371107, 0.7861062, 2.581306, 0, 0.3058824, 1, 1,
0.2378044, 0.2659402, 0.5915384, 0, 0.2980392, 1, 1,
0.2399084, 0.4483841, -0.6171395, 0, 0.2901961, 1, 1,
0.2409818, 0.4561996, 1.335856, 0, 0.2862745, 1, 1,
0.2426866, 1.314503, 0.03395351, 0, 0.2784314, 1, 1,
0.2464685, -0.07312331, 1.139132, 0, 0.2745098, 1, 1,
0.2516459, -0.09782463, 1.427864, 0, 0.2666667, 1, 1,
0.2557814, 1.307086, 0.7259327, 0, 0.2627451, 1, 1,
0.2573946, 1.895326, 0.02032173, 0, 0.254902, 1, 1,
0.261551, 1.288695, 0.9023797, 0, 0.2509804, 1, 1,
0.2624307, -1.540071, 3.42158, 0, 0.2431373, 1, 1,
0.263266, 0.7655228, 2.488272, 0, 0.2392157, 1, 1,
0.2643116, 1.473281, -1.867365, 0, 0.2313726, 1, 1,
0.2650363, -0.03574518, 3.599209, 0, 0.227451, 1, 1,
0.2661689, 0.8862101, 0.5748264, 0, 0.2196078, 1, 1,
0.266248, -0.2548037, 0.2950203, 0, 0.2156863, 1, 1,
0.277596, 1.383112, -0.7538585, 0, 0.2078431, 1, 1,
0.2803818, 1.228507, 0.2316726, 0, 0.2039216, 1, 1,
0.2848105, -1.210649, 4.582373, 0, 0.1960784, 1, 1,
0.2853733, 0.90624, 0.2699941, 0, 0.1882353, 1, 1,
0.2854233, -0.7771747, 3.279029, 0, 0.1843137, 1, 1,
0.2857355, -1.222494, 2.937901, 0, 0.1764706, 1, 1,
0.2863158, 1.183938, -0.3686429, 0, 0.172549, 1, 1,
0.2865053, 0.2645974, 0.2826179, 0, 0.1647059, 1, 1,
0.2865265, 0.2419957, -0.5573924, 0, 0.1607843, 1, 1,
0.2865857, -0.2915924, 3.32068, 0, 0.1529412, 1, 1,
0.2884027, 1.013467, -1.04014, 0, 0.1490196, 1, 1,
0.2884308, 0.2823989, 1.919252, 0, 0.1411765, 1, 1,
0.291806, 0.1335286, 0.5800243, 0, 0.1372549, 1, 1,
0.3019787, -1.06403, 3.726336, 0, 0.1294118, 1, 1,
0.3050786, 1.694149, 0.262632, 0, 0.1254902, 1, 1,
0.309209, -0.8447084, 4.828667, 0, 0.1176471, 1, 1,
0.3105504, -2.066274, 5.084239, 0, 0.1137255, 1, 1,
0.3113838, 1.139071, -0.7144519, 0, 0.1058824, 1, 1,
0.314694, -0.6441667, 3.284377, 0, 0.09803922, 1, 1,
0.3163534, -1.496587, 3.392401, 0, 0.09411765, 1, 1,
0.3251602, -0.2081534, 3.58944, 0, 0.08627451, 1, 1,
0.3269452, -0.8730571, 1.273185, 0, 0.08235294, 1, 1,
0.3278726, 1.515839, -0.134414, 0, 0.07450981, 1, 1,
0.3288644, -1.483006, 1.656299, 0, 0.07058824, 1, 1,
0.3416635, 0.2704487, 1.524716, 0, 0.0627451, 1, 1,
0.3436025, 1.046815, -0.1014494, 0, 0.05882353, 1, 1,
0.3437295, -0.03941987, 1.697563, 0, 0.05098039, 1, 1,
0.3445669, -0.5711148, 2.124501, 0, 0.04705882, 1, 1,
0.3465314, 0.2565866, 0.2099025, 0, 0.03921569, 1, 1,
0.3488282, 1.476698, 0.4210201, 0, 0.03529412, 1, 1,
0.3495141, -1.080782, 2.234497, 0, 0.02745098, 1, 1,
0.3591022, -0.05231075, 1.862574, 0, 0.02352941, 1, 1,
0.361371, 1.156958, -0.150554, 0, 0.01568628, 1, 1,
0.3645995, 0.888346, 1.290492, 0, 0.01176471, 1, 1,
0.3721711, 0.661505, 0.4630491, 0, 0.003921569, 1, 1,
0.3734116, 1.047011, -2.572413, 0.003921569, 0, 1, 1,
0.3761048, -0.9848855, 3.518423, 0.007843138, 0, 1, 1,
0.3762526, 0.2840002, 1.194121, 0.01568628, 0, 1, 1,
0.3767555, 0.4510231, 0.5374172, 0.01960784, 0, 1, 1,
0.379134, 0.5501821, 1.852784, 0.02745098, 0, 1, 1,
0.3792455, -0.4107179, 3.418441, 0.03137255, 0, 1, 1,
0.3794373, -1.16279, 3.072878, 0.03921569, 0, 1, 1,
0.3819196, -1.264663, 4.73838, 0.04313726, 0, 1, 1,
0.3839085, 2.450622, -0.4594078, 0.05098039, 0, 1, 1,
0.3935117, 0.6453309, -0.2942068, 0.05490196, 0, 1, 1,
0.3982723, 0.3861811, 0.8239222, 0.0627451, 0, 1, 1,
0.3989998, -1.42483, 3.130586, 0.06666667, 0, 1, 1,
0.4002683, 0.5915949, 0.7141969, 0.07450981, 0, 1, 1,
0.4062576, 0.5268482, 0.5866787, 0.07843138, 0, 1, 1,
0.4066907, -1.168161, 2.852277, 0.08627451, 0, 1, 1,
0.4086601, -0.07031954, 0.7978444, 0.09019608, 0, 1, 1,
0.4162666, -1.015595, 2.551322, 0.09803922, 0, 1, 1,
0.4171984, -0.7900255, 1.842478, 0.1058824, 0, 1, 1,
0.4191863, 0.6035777, 2.437187, 0.1098039, 0, 1, 1,
0.4196391, -1.382433, 3.82051, 0.1176471, 0, 1, 1,
0.4243309, -0.2557632, 3.458901, 0.1215686, 0, 1, 1,
0.4297725, -0.4390161, 2.725496, 0.1294118, 0, 1, 1,
0.4298981, 1.259836, 0.02567654, 0.1333333, 0, 1, 1,
0.4306151, 0.393935, 2.100185, 0.1411765, 0, 1, 1,
0.432408, 2.121782, 1.691918, 0.145098, 0, 1, 1,
0.4423935, 2.161145, -1.598281, 0.1529412, 0, 1, 1,
0.4437698, -0.2136937, 3.427643, 0.1568628, 0, 1, 1,
0.4453163, -1.183245, 1.170471, 0.1647059, 0, 1, 1,
0.4475092, 1.364297, 0.8604634, 0.1686275, 0, 1, 1,
0.4475543, -0.4107186, 3.453934, 0.1764706, 0, 1, 1,
0.4496502, 1.46252, 0.7114289, 0.1803922, 0, 1, 1,
0.4505966, 1.882411, -0.5198008, 0.1882353, 0, 1, 1,
0.4521607, -1.304612, 2.896383, 0.1921569, 0, 1, 1,
0.4526064, 1.587681, -1.291594, 0.2, 0, 1, 1,
0.4548275, -0.1849255, 2.021011, 0.2078431, 0, 1, 1,
0.4641659, -0.04197539, 1.056581, 0.2117647, 0, 1, 1,
0.4659002, 0.09713764, -0.01098138, 0.2196078, 0, 1, 1,
0.4725275, 0.01781612, 1.779639, 0.2235294, 0, 1, 1,
0.473234, -0.3586131, 2.668756, 0.2313726, 0, 1, 1,
0.4786902, -0.2424361, 1.529454, 0.2352941, 0, 1, 1,
0.4837992, -0.52217, 1.271938, 0.2431373, 0, 1, 1,
0.4841566, -0.569693, 2.839542, 0.2470588, 0, 1, 1,
0.4846918, -0.002016862, 1.48442, 0.254902, 0, 1, 1,
0.485393, -0.05900467, 2.535919, 0.2588235, 0, 1, 1,
0.4881282, 0.710632, -0.9402101, 0.2666667, 0, 1, 1,
0.4898109, -0.9281862, 2.757052, 0.2705882, 0, 1, 1,
0.4917972, -0.4769594, 2.350643, 0.2784314, 0, 1, 1,
0.4950375, 0.6474237, 0.9552664, 0.282353, 0, 1, 1,
0.4955685, 1.278967, 1.184158, 0.2901961, 0, 1, 1,
0.497571, 1.804466, 1.021317, 0.2941177, 0, 1, 1,
0.4991468, -1.488904, 2.211928, 0.3019608, 0, 1, 1,
0.4996341, 0.5261255, 1.679832, 0.3098039, 0, 1, 1,
0.5008093, -0.5344231, 2.566316, 0.3137255, 0, 1, 1,
0.502489, 1.034813, -0.6384911, 0.3215686, 0, 1, 1,
0.514838, 1.181908, -0.6611175, 0.3254902, 0, 1, 1,
0.5189303, -0.62393, 2.696499, 0.3333333, 0, 1, 1,
0.5312403, -1.146946, 4.380711, 0.3372549, 0, 1, 1,
0.5348361, 0.3638728, 1.120306, 0.345098, 0, 1, 1,
0.5355354, -1.879803, 2.815985, 0.3490196, 0, 1, 1,
0.5384673, -1.130218, 2.019375, 0.3568628, 0, 1, 1,
0.5409582, -1.317291, 1.737554, 0.3607843, 0, 1, 1,
0.5423416, 1.427506, 1.05592, 0.3686275, 0, 1, 1,
0.5469117, 0.37477, -0.3697866, 0.372549, 0, 1, 1,
0.5471677, 0.1886175, 0.4557318, 0.3803922, 0, 1, 1,
0.5489037, -1.259009, 3.94215, 0.3843137, 0, 1, 1,
0.5495017, 0.1274706, 0.6429765, 0.3921569, 0, 1, 1,
0.5499386, -0.7810673, 2.936563, 0.3960784, 0, 1, 1,
0.5536069, -0.5174175, 1.349998, 0.4039216, 0, 1, 1,
0.554961, 0.5286599, 4.023714, 0.4117647, 0, 1, 1,
0.5553001, 0.4007789, 1.798402, 0.4156863, 0, 1, 1,
0.5607712, -0.006671977, 1.072649, 0.4235294, 0, 1, 1,
0.5611188, -0.433167, 1.957825, 0.427451, 0, 1, 1,
0.5620114, -0.748146, 3.99147, 0.4352941, 0, 1, 1,
0.5640894, -1.468901, 3.053209, 0.4392157, 0, 1, 1,
0.566958, 0.3680896, 1.156887, 0.4470588, 0, 1, 1,
0.5716324, -0.5300174, 2.116069, 0.4509804, 0, 1, 1,
0.5720661, 0.1218953, -0.2218687, 0.4588235, 0, 1, 1,
0.5726084, 0.8469738, 1.100625, 0.4627451, 0, 1, 1,
0.581248, -1.148369, 2.473135, 0.4705882, 0, 1, 1,
0.5814947, 0.5845564, 0.8011414, 0.4745098, 0, 1, 1,
0.5887608, 0.7070512, 0.3741281, 0.4823529, 0, 1, 1,
0.5957341, 0.1672671, 1.58802, 0.4862745, 0, 1, 1,
0.5984881, 0.5292577, 1.910122, 0.4941176, 0, 1, 1,
0.5985816, -1.197307, 2.399623, 0.5019608, 0, 1, 1,
0.6002019, -1.591055, 4.532981, 0.5058824, 0, 1, 1,
0.6017496, -0.872451, 3.660813, 0.5137255, 0, 1, 1,
0.6104286, -1.169633, 4.095198, 0.5176471, 0, 1, 1,
0.6165966, 1.828746, 1.343499, 0.5254902, 0, 1, 1,
0.6233442, 0.9379581, -0.3510007, 0.5294118, 0, 1, 1,
0.6239671, -0.3397117, 2.068959, 0.5372549, 0, 1, 1,
0.6282738, -0.5035138, 2.878827, 0.5411765, 0, 1, 1,
0.6283219, 0.06879392, 3.428572, 0.5490196, 0, 1, 1,
0.6285772, -1.420781, 3.818696, 0.5529412, 0, 1, 1,
0.6286319, -0.3216291, 2.328939, 0.5607843, 0, 1, 1,
0.63255, -0.7267987, 1.768711, 0.5647059, 0, 1, 1,
0.634222, -0.221155, 1.224181, 0.572549, 0, 1, 1,
0.6384688, -0.8100968, 3.297158, 0.5764706, 0, 1, 1,
0.6385723, -0.4634839, 3.567671, 0.5843138, 0, 1, 1,
0.6399854, 1.443232, 0.233365, 0.5882353, 0, 1, 1,
0.6403931, -0.4321448, 0.9453259, 0.5960785, 0, 1, 1,
0.6484742, -1.361654, 1.396022, 0.6039216, 0, 1, 1,
0.6486359, 0.373932, 1.929698, 0.6078432, 0, 1, 1,
0.6513404, 0.3127879, 2.040262, 0.6156863, 0, 1, 1,
0.6522377, 0.01673357, 2.308189, 0.6196079, 0, 1, 1,
0.6534095, -0.08018614, 1.025707, 0.627451, 0, 1, 1,
0.6562414, 0.09166373, 1.797495, 0.6313726, 0, 1, 1,
0.6580169, 0.4379093, 0.2826539, 0.6392157, 0, 1, 1,
0.6580757, -0.8436064, 2.135583, 0.6431373, 0, 1, 1,
0.6596014, -0.2114398, 1.951452, 0.6509804, 0, 1, 1,
0.6627325, -0.9427556, 1.449373, 0.654902, 0, 1, 1,
0.6674086, -1.608251, 3.477833, 0.6627451, 0, 1, 1,
0.6689588, -0.9484645, 1.772105, 0.6666667, 0, 1, 1,
0.6691534, 1.275139, 0.7893388, 0.6745098, 0, 1, 1,
0.6756022, -0.5548778, 4.341126, 0.6784314, 0, 1, 1,
0.6768555, 0.4497444, 0.5862544, 0.6862745, 0, 1, 1,
0.6787524, -0.07619981, 1.091226, 0.6901961, 0, 1, 1,
0.6855723, 0.2465063, 0.6489453, 0.6980392, 0, 1, 1,
0.6907153, 0.5815138, 1.213446, 0.7058824, 0, 1, 1,
0.6950969, -0.3732601, 1.723698, 0.7098039, 0, 1, 1,
0.7032474, -0.6562685, -0.1222638, 0.7176471, 0, 1, 1,
0.7041602, -0.0004567088, 1.464325, 0.7215686, 0, 1, 1,
0.7062029, -2.141526, 3.405639, 0.7294118, 0, 1, 1,
0.709442, 0.1820722, 0.7098205, 0.7333333, 0, 1, 1,
0.7097635, 0.93448, 0.4195736, 0.7411765, 0, 1, 1,
0.7176676, -1.88762, 2.811803, 0.7450981, 0, 1, 1,
0.7182512, -1.260728, 3.087848, 0.7529412, 0, 1, 1,
0.7184269, 0.9765714, -0.9495764, 0.7568628, 0, 1, 1,
0.7262307, -1.417547, 3.148743, 0.7647059, 0, 1, 1,
0.7301319, -0.03529612, 2.633915, 0.7686275, 0, 1, 1,
0.7308184, -0.3894446, 3.619997, 0.7764706, 0, 1, 1,
0.7348084, -0.9535674, 3.329348, 0.7803922, 0, 1, 1,
0.738462, -1.724611, 2.792315, 0.7882353, 0, 1, 1,
0.7414247, 1.278039, 1.420281, 0.7921569, 0, 1, 1,
0.7528665, 0.3401272, 2.044304, 0.8, 0, 1, 1,
0.7530292, 0.06325768, 1.429554, 0.8078431, 0, 1, 1,
0.7567602, -0.5898644, 1.107032, 0.8117647, 0, 1, 1,
0.760269, -0.3593851, 3.318037, 0.8196079, 0, 1, 1,
0.7622377, -1.033239, 3.474923, 0.8235294, 0, 1, 1,
0.7670931, 0.2052198, 1.23436, 0.8313726, 0, 1, 1,
0.7692563, 1.090732, -0.5048777, 0.8352941, 0, 1, 1,
0.7692873, -0.06933127, -0.0802567, 0.8431373, 0, 1, 1,
0.7719873, 0.2244827, 2.509063, 0.8470588, 0, 1, 1,
0.7721199, 0.4732364, 0.603793, 0.854902, 0, 1, 1,
0.791083, -0.3205193, 3.014115, 0.8588235, 0, 1, 1,
0.8118348, -0.7780351, 1.766626, 0.8666667, 0, 1, 1,
0.8120423, 2.282334, 0.451445, 0.8705882, 0, 1, 1,
0.818563, -0.4230447, 1.37969, 0.8784314, 0, 1, 1,
0.8340502, 1.079521, 0.7397079, 0.8823529, 0, 1, 1,
0.839443, -1.047981, 1.229045, 0.8901961, 0, 1, 1,
0.8496966, 0.5864591, 0.4690974, 0.8941177, 0, 1, 1,
0.8600127, 0.2765191, 0.5828876, 0.9019608, 0, 1, 1,
0.8715717, -0.2771053, 0.9384329, 0.9098039, 0, 1, 1,
0.8726213, 0.03631469, 0.5067714, 0.9137255, 0, 1, 1,
0.8759914, 0.8032234, 0.2964056, 0.9215686, 0, 1, 1,
0.8769549, -0.7567005, 1.74694, 0.9254902, 0, 1, 1,
0.8788613, 0.08776752, 0.2298333, 0.9333333, 0, 1, 1,
0.8824993, 0.9209353, 0.5298698, 0.9372549, 0, 1, 1,
0.8831266, -0.5396279, 2.545839, 0.945098, 0, 1, 1,
0.8876558, 0.231599, 2.130897, 0.9490196, 0, 1, 1,
0.8907684, 0.2775111, 0.7532977, 0.9568627, 0, 1, 1,
0.8933815, -0.57165, 2.218514, 0.9607843, 0, 1, 1,
0.8946823, 0.440074, 2.460205, 0.9686275, 0, 1, 1,
0.8982336, -1.452301, 4.910914, 0.972549, 0, 1, 1,
0.9003239, 0.940625, 1.646433, 0.9803922, 0, 1, 1,
0.9010291, -0.4253012, 2.811363, 0.9843137, 0, 1, 1,
0.9083872, -0.3595291, 1.459755, 0.9921569, 0, 1, 1,
0.9158262, 1.398156, 1.202885, 0.9960784, 0, 1, 1,
0.917345, 0.2903404, -0.01792567, 1, 0, 0.9960784, 1,
0.9193645, -0.0216224, -0.5544641, 1, 0, 0.9882353, 1,
0.928135, -0.8237979, 3.190544, 1, 0, 0.9843137, 1,
0.931401, -0.2700067, 0.7073147, 1, 0, 0.9764706, 1,
0.9326748, -1.507761, 4.596025, 1, 0, 0.972549, 1,
0.9381554, 0.05719182, 1.742687, 1, 0, 0.9647059, 1,
0.9386452, 0.4551729, 2.414446, 1, 0, 0.9607843, 1,
0.9399101, 0.6991759, 2.231211, 1, 0, 0.9529412, 1,
0.9449157, -0.7554153, 3.324875, 1, 0, 0.9490196, 1,
0.9449884, -0.484601, 0.9879686, 1, 0, 0.9411765, 1,
0.9463852, -0.9358947, 2.468151, 1, 0, 0.9372549, 1,
0.9520684, -0.3666925, -0.04483222, 1, 0, 0.9294118, 1,
0.9639088, 1.245757, -0.1402776, 1, 0, 0.9254902, 1,
0.9675193, -1.180712, 1.76682, 1, 0, 0.9176471, 1,
0.9747054, -1.002725, 2.417436, 1, 0, 0.9137255, 1,
0.9770018, 2.820936, 1.479755, 1, 0, 0.9058824, 1,
0.9877235, -0.7717947, 3.025387, 1, 0, 0.9019608, 1,
0.9957743, 0.5976076, -0.6396866, 1, 0, 0.8941177, 1,
1.003972, -0.07831118, 2.885674, 1, 0, 0.8862745, 1,
1.005269, 0.8606505, -0.609459, 1, 0, 0.8823529, 1,
1.008226, 0.07943197, 1.902867, 1, 0, 0.8745098, 1,
1.015411, 1.548844, 0.9929015, 1, 0, 0.8705882, 1,
1.015998, 1.865625, -0.4877208, 1, 0, 0.8627451, 1,
1.022242, 0.08354016, 2.910169, 1, 0, 0.8588235, 1,
1.025861, 0.2190989, -0.1295598, 1, 0, 0.8509804, 1,
1.033196, -1.366483, 4.033022, 1, 0, 0.8470588, 1,
1.033264, 1.108432, 1.55649, 1, 0, 0.8392157, 1,
1.034067, 1.157162, 1.159138, 1, 0, 0.8352941, 1,
1.035691, -0.1321348, 1.791242, 1, 0, 0.827451, 1,
1.044626, -1.053853, 2.387793, 1, 0, 0.8235294, 1,
1.047334, 2.490907, 1.485999, 1, 0, 0.8156863, 1,
1.053688, -0.7790372, 3.959947, 1, 0, 0.8117647, 1,
1.056484, 1.467722, 0.5634778, 1, 0, 0.8039216, 1,
1.056595, -0.08652119, 0.9240103, 1, 0, 0.7960784, 1,
1.056749, 0.5074286, 0.8125573, 1, 0, 0.7921569, 1,
1.059117, -0.04187528, -0.6027769, 1, 0, 0.7843137, 1,
1.071982, 0.1156142, 0.8174756, 1, 0, 0.7803922, 1,
1.073171, 1.41357, -0.7549874, 1, 0, 0.772549, 1,
1.07319, -0.7816998, 2.75445, 1, 0, 0.7686275, 1,
1.076431, -2.387292, 2.455676, 1, 0, 0.7607843, 1,
1.079716, 0.4114724, 1.444169, 1, 0, 0.7568628, 1,
1.090045, -0.5278059, 2.518196, 1, 0, 0.7490196, 1,
1.101962, 0.5590898, 1.14419, 1, 0, 0.7450981, 1,
1.110268, 1.03334, 0.6774333, 1, 0, 0.7372549, 1,
1.122185, -0.8004881, 0.9165193, 1, 0, 0.7333333, 1,
1.126731, -0.975076, 2.577935, 1, 0, 0.7254902, 1,
1.139936, 1.198292, 1.290638, 1, 0, 0.7215686, 1,
1.149119, -0.064206, 1.259587, 1, 0, 0.7137255, 1,
1.158329, -0.07187472, 0.7195681, 1, 0, 0.7098039, 1,
1.159395, 0.2121964, 3.284528, 1, 0, 0.7019608, 1,
1.162351, -0.8110093, 1.775864, 1, 0, 0.6941177, 1,
1.164154, 1.12354, -0.2375745, 1, 0, 0.6901961, 1,
1.167559, -0.8656313, 1.694622, 1, 0, 0.682353, 1,
1.173628, 0.4240001, 1.460181, 1, 0, 0.6784314, 1,
1.183962, 1.269288, 0.260039, 1, 0, 0.6705883, 1,
1.188214, -0.6866798, 2.967219, 1, 0, 0.6666667, 1,
1.192051, -0.2518133, 0.7572476, 1, 0, 0.6588235, 1,
1.198083, 0.3153776, 0.4989612, 1, 0, 0.654902, 1,
1.205696, -0.1311854, 1.566301, 1, 0, 0.6470588, 1,
1.207783, -0.7212985, 0.4346362, 1, 0, 0.6431373, 1,
1.211765, -0.8268789, 2.795285, 1, 0, 0.6352941, 1,
1.213018, -1.987269, 2.012456, 1, 0, 0.6313726, 1,
1.237056, -0.5474772, 2.79562, 1, 0, 0.6235294, 1,
1.255892, 0.840663, 1.401459, 1, 0, 0.6196079, 1,
1.267481, -0.01757722, 0.7052833, 1, 0, 0.6117647, 1,
1.280051, -0.9490505, 1.572832, 1, 0, 0.6078432, 1,
1.287779, 0.05194671, 1.085915, 1, 0, 0.6, 1,
1.292582, 0.07880196, 1.574047, 1, 0, 0.5921569, 1,
1.303281, -0.06635847, 1.696346, 1, 0, 0.5882353, 1,
1.305742, 0.4688384, 0.3717581, 1, 0, 0.5803922, 1,
1.312601, 0.2929066, -0.5379283, 1, 0, 0.5764706, 1,
1.321827, 0.7384654, 2.474109, 1, 0, 0.5686275, 1,
1.353773, 0.6629782, -0.5884865, 1, 0, 0.5647059, 1,
1.365142, 0.2152014, 0.9262216, 1, 0, 0.5568628, 1,
1.365917, -0.122877, 3.061578, 1, 0, 0.5529412, 1,
1.371484, 0.6080633, 1.636424, 1, 0, 0.5450981, 1,
1.372708, 1.344658, 0.520191, 1, 0, 0.5411765, 1,
1.379577, 0.1900148, -1.046231, 1, 0, 0.5333334, 1,
1.388383, 0.2160146, 1.722614, 1, 0, 0.5294118, 1,
1.403414, -0.9579731, 0.820281, 1, 0, 0.5215687, 1,
1.411457, -1.071782, 1.8882, 1, 0, 0.5176471, 1,
1.418478, 1.237127, 1.345176, 1, 0, 0.509804, 1,
1.419055, -0.3280226, 0.9471514, 1, 0, 0.5058824, 1,
1.426811, -1.074033, 1.213282, 1, 0, 0.4980392, 1,
1.439429, 0.591907, -0.5440919, 1, 0, 0.4901961, 1,
1.444649, -1.066101, 3.642621, 1, 0, 0.4862745, 1,
1.444778, 1.567475, 0.8174447, 1, 0, 0.4784314, 1,
1.449353, -0.5578642, 2.707506, 1, 0, 0.4745098, 1,
1.452761, -0.4301079, 2.361239, 1, 0, 0.4666667, 1,
1.455279, -2.334911, 3.059216, 1, 0, 0.4627451, 1,
1.462175, 2.656094, 0.01306938, 1, 0, 0.454902, 1,
1.475548, 0.6065314, 1.110281, 1, 0, 0.4509804, 1,
1.477996, 1.322555, 1.584061, 1, 0, 0.4431373, 1,
1.489511, 0.7220637, -0.01460145, 1, 0, 0.4392157, 1,
1.510252, -1.628543, 3.752974, 1, 0, 0.4313726, 1,
1.530198, -0.05260375, 1.936052, 1, 0, 0.427451, 1,
1.532119, 0.7339467, 1.924892, 1, 0, 0.4196078, 1,
1.537201, 0.8724012, 1.257397, 1, 0, 0.4156863, 1,
1.540277, 1.853614, 1.927842, 1, 0, 0.4078431, 1,
1.54582, 0.3009738, 1.469905, 1, 0, 0.4039216, 1,
1.547473, 0.08610968, 0.7743192, 1, 0, 0.3960784, 1,
1.551735, 1.327325, 1.017983, 1, 0, 0.3882353, 1,
1.559746, 0.7285557, -0.1278896, 1, 0, 0.3843137, 1,
1.561292, 1.049155, 1.020716, 1, 0, 0.3764706, 1,
1.589305, -1.754362, 2.002323, 1, 0, 0.372549, 1,
1.59989, 0.7766817, 1.835218, 1, 0, 0.3647059, 1,
1.61397, 0.1655391, 1.560756, 1, 0, 0.3607843, 1,
1.615465, -0.01168629, -0.1219646, 1, 0, 0.3529412, 1,
1.631649, -1.433892, 3.00022, 1, 0, 0.3490196, 1,
1.663999, 0.04473935, 2.047237, 1, 0, 0.3411765, 1,
1.680035, -0.8585233, 0.9832908, 1, 0, 0.3372549, 1,
1.696607, -0.7612034, 0.8013253, 1, 0, 0.3294118, 1,
1.697566, -0.753686, 2.721005, 1, 0, 0.3254902, 1,
1.698199, -0.6116495, 1.973625, 1, 0, 0.3176471, 1,
1.713264, 0.9589417, -0.02896733, 1, 0, 0.3137255, 1,
1.718658, 0.01673706, 1.517079, 1, 0, 0.3058824, 1,
1.725305, 0.7439168, 2.650792, 1, 0, 0.2980392, 1,
1.741746, -0.310339, 2.630638, 1, 0, 0.2941177, 1,
1.74802, -1.096508, 2.452813, 1, 0, 0.2862745, 1,
1.765781, -1.657003, 2.750288, 1, 0, 0.282353, 1,
1.775002, -0.8212314, 1.486707, 1, 0, 0.2745098, 1,
1.779386, -0.2449871, 2.090998, 1, 0, 0.2705882, 1,
1.787192, -1.149303, 2.614351, 1, 0, 0.2627451, 1,
1.78936, -1.154314, 1.910114, 1, 0, 0.2588235, 1,
1.800818, -0.01218536, 1.656269, 1, 0, 0.2509804, 1,
1.807059, 0.1071806, 1.946568, 1, 0, 0.2470588, 1,
1.824981, -1.290334, 2.729409, 1, 0, 0.2392157, 1,
1.83555, -1.035504, 2.64545, 1, 0, 0.2352941, 1,
1.83997, -1.700216, 0.8758013, 1, 0, 0.227451, 1,
1.846055, -0.4374099, 4.142962, 1, 0, 0.2235294, 1,
1.848138, 0.8257087, 2.1261, 1, 0, 0.2156863, 1,
1.871415, -0.349984, 4.560612, 1, 0, 0.2117647, 1,
1.884971, 1.655175, 2.879322, 1, 0, 0.2039216, 1,
1.888743, 1.037122, 1.066569, 1, 0, 0.1960784, 1,
1.896435, -1.259211, 1.744912, 1, 0, 0.1921569, 1,
1.912937, 0.008555907, 0.5364052, 1, 0, 0.1843137, 1,
1.920714, -0.1436569, 1.710556, 1, 0, 0.1803922, 1,
1.931751, -1.957092, 1.951524, 1, 0, 0.172549, 1,
1.973193, 1.796841, 0.9966938, 1, 0, 0.1686275, 1,
1.982161, -0.3354699, 2.650416, 1, 0, 0.1607843, 1,
1.985107, 0.1633108, 1.455265, 1, 0, 0.1568628, 1,
1.998899, -0.5326065, 2.661314, 1, 0, 0.1490196, 1,
2.009172, -0.6739946, 1.757292, 1, 0, 0.145098, 1,
2.060021, 1.359889, 0.3665263, 1, 0, 0.1372549, 1,
2.076629, 1.751874, -0.2446962, 1, 0, 0.1333333, 1,
2.128894, -1.319049, 3.721023, 1, 0, 0.1254902, 1,
2.132587, 1.100691, 3.268132, 1, 0, 0.1215686, 1,
2.140354, 0.9797418, 2.062456, 1, 0, 0.1137255, 1,
2.146385, -0.1578079, 1.879447, 1, 0, 0.1098039, 1,
2.150498, -1.41076, 2.153838, 1, 0, 0.1019608, 1,
2.187521, -0.2484034, 0.4028049, 1, 0, 0.09411765, 1,
2.25954, 0.01038316, 1.791735, 1, 0, 0.09019608, 1,
2.306398, 0.9479315, 0.5857552, 1, 0, 0.08235294, 1,
2.308429, 0.3774464, 1.474816, 1, 0, 0.07843138, 1,
2.357718, -0.5520679, 2.569216, 1, 0, 0.07058824, 1,
2.414747, 0.03835201, 1.483218, 1, 0, 0.06666667, 1,
2.441774, -1.533745, 1.969507, 1, 0, 0.05882353, 1,
2.484734, 1.730768, 0.2870506, 1, 0, 0.05490196, 1,
2.490448, -0.8008606, 3.197131, 1, 0, 0.04705882, 1,
2.557634, -0.2136751, 1.149493, 1, 0, 0.04313726, 1,
2.625183, -1.468454, -0.6999244, 1, 0, 0.03529412, 1,
2.651362, 0.6521404, 1.929709, 1, 0, 0.03137255, 1,
2.683957, 0.6393838, 1.417295, 1, 0, 0.02352941, 1,
2.716064, 0.4372509, 2.976364, 1, 0, 0.01960784, 1,
2.837299, 2.084062, 1.34489, 1, 0, 0.01176471, 1,
3.260839, -0.2056746, 1.107915, 1, 0, 0.007843138, 1
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
-0.03507984, -4.260994, -7.387198, 0, -0.5, 0.5, 0.5,
-0.03507984, -4.260994, -7.387198, 1, -0.5, 0.5, 0.5,
-0.03507984, -4.260994, -7.387198, 1, 1.5, 0.5, 0.5,
-0.03507984, -4.260994, -7.387198, 0, 1.5, 0.5, 0.5
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
-4.448315, -0.1059593, -7.387198, 0, -0.5, 0.5, 0.5,
-4.448315, -0.1059593, -7.387198, 1, -0.5, 0.5, 0.5,
-4.448315, -0.1059593, -7.387198, 1, 1.5, 0.5, 0.5,
-4.448315, -0.1059593, -7.387198, 0, 1.5, 0.5, 0.5
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
-4.448315, -4.260994, -0.2477138, 0, -0.5, 0.5, 0.5,
-4.448315, -4.260994, -0.2477138, 1, -0.5, 0.5, 0.5,
-4.448315, -4.260994, -0.2477138, 1, 1.5, 0.5, 0.5,
-4.448315, -4.260994, -0.2477138, 0, 1.5, 0.5, 0.5
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
-3, -3.30214, -5.739625,
3, -3.30214, -5.739625,
-3, -3.30214, -5.739625,
-3, -3.461949, -6.01422,
-2, -3.30214, -5.739625,
-2, -3.461949, -6.01422,
-1, -3.30214, -5.739625,
-1, -3.461949, -6.01422,
0, -3.30214, -5.739625,
0, -3.461949, -6.01422,
1, -3.30214, -5.739625,
1, -3.461949, -6.01422,
2, -3.30214, -5.739625,
2, -3.461949, -6.01422,
3, -3.30214, -5.739625,
3, -3.461949, -6.01422
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
-3, -3.781567, -6.563411, 0, -0.5, 0.5, 0.5,
-3, -3.781567, -6.563411, 1, -0.5, 0.5, 0.5,
-3, -3.781567, -6.563411, 1, 1.5, 0.5, 0.5,
-3, -3.781567, -6.563411, 0, 1.5, 0.5, 0.5,
-2, -3.781567, -6.563411, 0, -0.5, 0.5, 0.5,
-2, -3.781567, -6.563411, 1, -0.5, 0.5, 0.5,
-2, -3.781567, -6.563411, 1, 1.5, 0.5, 0.5,
-2, -3.781567, -6.563411, 0, 1.5, 0.5, 0.5,
-1, -3.781567, -6.563411, 0, -0.5, 0.5, 0.5,
-1, -3.781567, -6.563411, 1, -0.5, 0.5, 0.5,
-1, -3.781567, -6.563411, 1, 1.5, 0.5, 0.5,
-1, -3.781567, -6.563411, 0, 1.5, 0.5, 0.5,
0, -3.781567, -6.563411, 0, -0.5, 0.5, 0.5,
0, -3.781567, -6.563411, 1, -0.5, 0.5, 0.5,
0, -3.781567, -6.563411, 1, 1.5, 0.5, 0.5,
0, -3.781567, -6.563411, 0, 1.5, 0.5, 0.5,
1, -3.781567, -6.563411, 0, -0.5, 0.5, 0.5,
1, -3.781567, -6.563411, 1, -0.5, 0.5, 0.5,
1, -3.781567, -6.563411, 1, 1.5, 0.5, 0.5,
1, -3.781567, -6.563411, 0, 1.5, 0.5, 0.5,
2, -3.781567, -6.563411, 0, -0.5, 0.5, 0.5,
2, -3.781567, -6.563411, 1, -0.5, 0.5, 0.5,
2, -3.781567, -6.563411, 1, 1.5, 0.5, 0.5,
2, -3.781567, -6.563411, 0, 1.5, 0.5, 0.5,
3, -3.781567, -6.563411, 0, -0.5, 0.5, 0.5,
3, -3.781567, -6.563411, 1, -0.5, 0.5, 0.5,
3, -3.781567, -6.563411, 1, 1.5, 0.5, 0.5,
3, -3.781567, -6.563411, 0, 1.5, 0.5, 0.5
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
-3.429876, -3, -5.739625,
-3.429876, 2, -5.739625,
-3.429876, -3, -5.739625,
-3.599616, -3, -6.01422,
-3.429876, -2, -5.739625,
-3.599616, -2, -6.01422,
-3.429876, -1, -5.739625,
-3.599616, -1, -6.01422,
-3.429876, 0, -5.739625,
-3.599616, 0, -6.01422,
-3.429876, 1, -5.739625,
-3.599616, 1, -6.01422,
-3.429876, 2, -5.739625,
-3.599616, 2, -6.01422
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
-3.939096, -3, -6.563411, 0, -0.5, 0.5, 0.5,
-3.939096, -3, -6.563411, 1, -0.5, 0.5, 0.5,
-3.939096, -3, -6.563411, 1, 1.5, 0.5, 0.5,
-3.939096, -3, -6.563411, 0, 1.5, 0.5, 0.5,
-3.939096, -2, -6.563411, 0, -0.5, 0.5, 0.5,
-3.939096, -2, -6.563411, 1, -0.5, 0.5, 0.5,
-3.939096, -2, -6.563411, 1, 1.5, 0.5, 0.5,
-3.939096, -2, -6.563411, 0, 1.5, 0.5, 0.5,
-3.939096, -1, -6.563411, 0, -0.5, 0.5, 0.5,
-3.939096, -1, -6.563411, 1, -0.5, 0.5, 0.5,
-3.939096, -1, -6.563411, 1, 1.5, 0.5, 0.5,
-3.939096, -1, -6.563411, 0, 1.5, 0.5, 0.5,
-3.939096, 0, -6.563411, 0, -0.5, 0.5, 0.5,
-3.939096, 0, -6.563411, 1, -0.5, 0.5, 0.5,
-3.939096, 0, -6.563411, 1, 1.5, 0.5, 0.5,
-3.939096, 0, -6.563411, 0, 1.5, 0.5, 0.5,
-3.939096, 1, -6.563411, 0, -0.5, 0.5, 0.5,
-3.939096, 1, -6.563411, 1, -0.5, 0.5, 0.5,
-3.939096, 1, -6.563411, 1, 1.5, 0.5, 0.5,
-3.939096, 1, -6.563411, 0, 1.5, 0.5, 0.5,
-3.939096, 2, -6.563411, 0, -0.5, 0.5, 0.5,
-3.939096, 2, -6.563411, 1, -0.5, 0.5, 0.5,
-3.939096, 2, -6.563411, 1, 1.5, 0.5, 0.5,
-3.939096, 2, -6.563411, 0, 1.5, 0.5, 0.5
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
-3.429876, -3.30214, -4,
-3.429876, -3.30214, 4,
-3.429876, -3.30214, -4,
-3.599616, -3.461949, -4,
-3.429876, -3.30214, -2,
-3.599616, -3.461949, -2,
-3.429876, -3.30214, 0,
-3.599616, -3.461949, 0,
-3.429876, -3.30214, 2,
-3.599616, -3.461949, 2,
-3.429876, -3.30214, 4,
-3.599616, -3.461949, 4
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
-3.939096, -3.781567, -4, 0, -0.5, 0.5, 0.5,
-3.939096, -3.781567, -4, 1, -0.5, 0.5, 0.5,
-3.939096, -3.781567, -4, 1, 1.5, 0.5, 0.5,
-3.939096, -3.781567, -4, 0, 1.5, 0.5, 0.5,
-3.939096, -3.781567, -2, 0, -0.5, 0.5, 0.5,
-3.939096, -3.781567, -2, 1, -0.5, 0.5, 0.5,
-3.939096, -3.781567, -2, 1, 1.5, 0.5, 0.5,
-3.939096, -3.781567, -2, 0, 1.5, 0.5, 0.5,
-3.939096, -3.781567, 0, 0, -0.5, 0.5, 0.5,
-3.939096, -3.781567, 0, 1, -0.5, 0.5, 0.5,
-3.939096, -3.781567, 0, 1, 1.5, 0.5, 0.5,
-3.939096, -3.781567, 0, 0, 1.5, 0.5, 0.5,
-3.939096, -3.781567, 2, 0, -0.5, 0.5, 0.5,
-3.939096, -3.781567, 2, 1, -0.5, 0.5, 0.5,
-3.939096, -3.781567, 2, 1, 1.5, 0.5, 0.5,
-3.939096, -3.781567, 2, 0, 1.5, 0.5, 0.5,
-3.939096, -3.781567, 4, 0, -0.5, 0.5, 0.5,
-3.939096, -3.781567, 4, 1, -0.5, 0.5, 0.5,
-3.939096, -3.781567, 4, 1, 1.5, 0.5, 0.5,
-3.939096, -3.781567, 4, 0, 1.5, 0.5, 0.5
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
-3.429876, -3.30214, -5.739625,
-3.429876, 3.090221, -5.739625,
-3.429876, -3.30214, 5.244197,
-3.429876, 3.090221, 5.244197,
-3.429876, -3.30214, -5.739625,
-3.429876, -3.30214, 5.244197,
-3.429876, 3.090221, -5.739625,
-3.429876, 3.090221, 5.244197,
-3.429876, -3.30214, -5.739625,
3.359717, -3.30214, -5.739625,
-3.429876, -3.30214, 5.244197,
3.359717, -3.30214, 5.244197,
-3.429876, 3.090221, -5.739625,
3.359717, 3.090221, -5.739625,
-3.429876, 3.090221, 5.244197,
3.359717, 3.090221, 5.244197,
3.359717, -3.30214, -5.739625,
3.359717, 3.090221, -5.739625,
3.359717, -3.30214, 5.244197,
3.359717, 3.090221, 5.244197,
3.359717, -3.30214, -5.739625,
3.359717, -3.30214, 5.244197,
3.359717, 3.090221, -5.739625,
3.359717, 3.090221, 5.244197
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
var radius = 7.693865;
var distance = 34.23087;
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
mvMatrix.translate( 0.03507984, 0.1059593, 0.2477138 );
mvMatrix.scale( 1.225222, 1.301359, 0.7573646 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.23087);
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
Hexadecyl_cyclopropa<-read.table("Hexadecyl_cyclopropa.xyz", skip=1)
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
-3.330999, 0.745086, -1.666403, 0, 0, 1, 1, 1,
-2.997529, -0.7541128, -2.524693, 1, 0, 0, 1, 1,
-2.978002, 1.393184, -2.610122, 1, 0, 0, 1, 1,
-2.770435, 0.1668366, 0.1011102, 1, 0, 0, 1, 1,
-2.674425, 1.175449, -2.105377, 1, 0, 0, 1, 1,
-2.583339, -0.7222458, -1.271488, 1, 0, 0, 1, 1,
-2.522485, 1.361616, -0.8828235, 0, 0, 0, 1, 1,
-2.510826, 1.445868, -1.174149, 0, 0, 0, 1, 1,
-2.442392, 1.616713, -1.319609, 0, 0, 0, 1, 1,
-2.391137, 0.9928151, -1.798947, 0, 0, 0, 1, 1,
-2.379172, -0.4958611, -2.016142, 0, 0, 0, 1, 1,
-2.355396, -0.04583547, -1.179954, 0, 0, 0, 1, 1,
-2.305355, 0.5837032, -0.2447742, 0, 0, 0, 1, 1,
-2.288284, -0.1300818, -3.542348, 1, 1, 1, 1, 1,
-2.211836, -0.5885003, -1.860392, 1, 1, 1, 1, 1,
-2.188734, 0.9147408, 0.7434995, 1, 1, 1, 1, 1,
-2.16086, 0.2948893, -0.2714651, 1, 1, 1, 1, 1,
-2.160419, 1.208384, 1.322208, 1, 1, 1, 1, 1,
-2.12348, 0.01879753, -2.118339, 1, 1, 1, 1, 1,
-2.076262, 1.84289, -0.6895061, 1, 1, 1, 1, 1,
-2.054358, 0.8117378, -2.079098, 1, 1, 1, 1, 1,
-2.048867, -2.105694, 0.05035662, 1, 1, 1, 1, 1,
-2.037468, 0.1887541, -2.716999, 1, 1, 1, 1, 1,
-2.014423, -1.046953, -2.094553, 1, 1, 1, 1, 1,
-2.00664, -0.1262084, -1.370684, 1, 1, 1, 1, 1,
-1.981022, 0.06548128, -0.606438, 1, 1, 1, 1, 1,
-1.977905, -0.3145339, -2.712567, 1, 1, 1, 1, 1,
-1.968555, 0.4160446, -1.156371, 1, 1, 1, 1, 1,
-1.953156, -0.6604187, -1.809505, 0, 0, 1, 1, 1,
-1.95165, -1.123553, -1.90019, 1, 0, 0, 1, 1,
-1.922128, -1.001692, -2.900076, 1, 0, 0, 1, 1,
-1.902235, -0.9612406, -1.1231, 1, 0, 0, 1, 1,
-1.893965, 0.3010987, -0.3562793, 1, 0, 0, 1, 1,
-1.892647, 0.1664095, -2.447855, 1, 0, 0, 1, 1,
-1.879624, 0.7113796, 0.08807497, 0, 0, 0, 1, 1,
-1.842199, -1.772865, -1.098605, 0, 0, 0, 1, 1,
-1.84035, 0.201614, -0.5569812, 0, 0, 0, 1, 1,
-1.838632, -0.5228989, -1.196441, 0, 0, 0, 1, 1,
-1.795771, -0.7529265, -2.831188, 0, 0, 0, 1, 1,
-1.788904, -0.4360221, -1.229271, 0, 0, 0, 1, 1,
-1.782559, -1.300303, -0.9632409, 0, 0, 0, 1, 1,
-1.779561, -0.3395341, 1.232272, 1, 1, 1, 1, 1,
-1.770823, -0.004546924, -2.701604, 1, 1, 1, 1, 1,
-1.762484, -0.6107815, -0.400969, 1, 1, 1, 1, 1,
-1.761957, 0.6623564, -0.6484075, 1, 1, 1, 1, 1,
-1.757327, 1.543814, -1.302131, 1, 1, 1, 1, 1,
-1.743661, -0.03295808, -1.707946, 1, 1, 1, 1, 1,
-1.71307, 0.02118452, -2.561825, 1, 1, 1, 1, 1,
-1.710774, -2.034849, -1.625507, 1, 1, 1, 1, 1,
-1.696343, -0.03011257, -1.943637, 1, 1, 1, 1, 1,
-1.695479, -0.3558605, -2.220801, 1, 1, 1, 1, 1,
-1.692446, -0.8172693, -1.453024, 1, 1, 1, 1, 1,
-1.685372, 2.379533, 1.079804, 1, 1, 1, 1, 1,
-1.674227, -0.6064327, -3.411928, 1, 1, 1, 1, 1,
-1.671224, -0.1395767, -1.436524, 1, 1, 1, 1, 1,
-1.633127, 2.030486, -2.440878, 1, 1, 1, 1, 1,
-1.632553, 0.6714222, -1.727295, 0, 0, 1, 1, 1,
-1.631186, 0.581839, -1.218196, 1, 0, 0, 1, 1,
-1.624875, -0.376868, -1.484631, 1, 0, 0, 1, 1,
-1.597265, 0.4941732, 0.4441196, 1, 0, 0, 1, 1,
-1.593533, 0.5215073, 1.266395, 1, 0, 0, 1, 1,
-1.586681, -0.2463209, -0.6305218, 1, 0, 0, 1, 1,
-1.584064, 0.2468148, -2.23201, 0, 0, 0, 1, 1,
-1.580388, 1.49885, -1.085516, 0, 0, 0, 1, 1,
-1.579001, -2.285479, -1.439514, 0, 0, 0, 1, 1,
-1.578434, 1.307317, -1.952828, 0, 0, 0, 1, 1,
-1.573456, -0.09085416, -0.7893602, 0, 0, 0, 1, 1,
-1.563313, 1.241013, -0.5787849, 0, 0, 0, 1, 1,
-1.553216, 0.7789176, -1.80165, 0, 0, 0, 1, 1,
-1.55014, 1.093734, -0.1355325, 1, 1, 1, 1, 1,
-1.548292, -0.3955216, -0.7093681, 1, 1, 1, 1, 1,
-1.546376, 1.19971, -2.14804, 1, 1, 1, 1, 1,
-1.531393, 0.833066, -2.010688, 1, 1, 1, 1, 1,
-1.530649, -1.792123, -2.758429, 1, 1, 1, 1, 1,
-1.521309, 0.1695976, -2.226854, 1, 1, 1, 1, 1,
-1.515209, -0.6219262, -1.92043, 1, 1, 1, 1, 1,
-1.512448, -0.2247697, -1.903271, 1, 1, 1, 1, 1,
-1.493291, 0.7143924, -0.9103497, 1, 1, 1, 1, 1,
-1.485647, 0.1263814, -1.977558, 1, 1, 1, 1, 1,
-1.47624, 1.199758, 0.01768141, 1, 1, 1, 1, 1,
-1.468763, 1.312276, -0.9537679, 1, 1, 1, 1, 1,
-1.462615, 1.093541, 0.3281398, 1, 1, 1, 1, 1,
-1.447833, -0.1389477, -1.348811, 1, 1, 1, 1, 1,
-1.428432, 1.828942, -0.6906182, 1, 1, 1, 1, 1,
-1.417567, -1.346291, -3.116832, 0, 0, 1, 1, 1,
-1.412756, -0.3331636, -0.9837217, 1, 0, 0, 1, 1,
-1.407632, -0.9184482, -2.0422, 1, 0, 0, 1, 1,
-1.404471, 0.1030358, -2.020512, 1, 0, 0, 1, 1,
-1.389515, -0.2657045, -1.049364, 1, 0, 0, 1, 1,
-1.375917, 1.449125, -1.373253, 1, 0, 0, 1, 1,
-1.375787, 0.7413508, -0.04451069, 0, 0, 0, 1, 1,
-1.372834, 0.8481096, -1.342292, 0, 0, 0, 1, 1,
-1.369534, 0.5844651, -2.036831, 0, 0, 0, 1, 1,
-1.36873, -0.8426729, -2.99993, 0, 0, 0, 1, 1,
-1.359565, -1.027726, -4.32514, 0, 0, 0, 1, 1,
-1.350688, -0.2568997, -1.267515, 0, 0, 0, 1, 1,
-1.348054, 2.374765, -1.223292, 0, 0, 0, 1, 1,
-1.333038, 0.6431425, -2.269684, 1, 1, 1, 1, 1,
-1.330752, 1.347503, -0.6003795, 1, 1, 1, 1, 1,
-1.327588, 0.1928501, -1.750183, 1, 1, 1, 1, 1,
-1.31949, 0.3070916, -1.397024, 1, 1, 1, 1, 1,
-1.318758, 1.049408, -1.08984, 1, 1, 1, 1, 1,
-1.31798, -0.407816, -2.768057, 1, 1, 1, 1, 1,
-1.314061, 1.09718, -2.73507, 1, 1, 1, 1, 1,
-1.313168, -1.114903, -3.461127, 1, 1, 1, 1, 1,
-1.30866, -0.2210026, -1.129673, 1, 1, 1, 1, 1,
-1.306475, -0.2476404, -1.674898, 1, 1, 1, 1, 1,
-1.301303, -2.943518, -2.162808, 1, 1, 1, 1, 1,
-1.300311, -0.2909578, -1.947646, 1, 1, 1, 1, 1,
-1.299888, -0.8162814, -3.200542, 1, 1, 1, 1, 1,
-1.294748, -0.5488109, -1.321905, 1, 1, 1, 1, 1,
-1.294042, -2.073781, -3.954938, 1, 1, 1, 1, 1,
-1.293819, 1.604606, -1.659248, 0, 0, 1, 1, 1,
-1.286911, 0.1976869, -0.1695735, 1, 0, 0, 1, 1,
-1.269275, 1.134447, -1.694394, 1, 0, 0, 1, 1,
-1.266923, -0.1444842, -2.678734, 1, 0, 0, 1, 1,
-1.256314, -0.6715618, -2.125515, 1, 0, 0, 1, 1,
-1.25534, -0.4768633, -1.068449, 1, 0, 0, 1, 1,
-1.253164, -1.063346, -0.3808967, 0, 0, 0, 1, 1,
-1.245884, -0.3057372, -0.3257223, 0, 0, 0, 1, 1,
-1.245542, 1.176902, -1.424378, 0, 0, 0, 1, 1,
-1.242038, -0.6779062, -2.641148, 0, 0, 0, 1, 1,
-1.238515, 0.6320897, -0.2833446, 0, 0, 0, 1, 1,
-1.234419, -1.20467, -2.476258, 0, 0, 0, 1, 1,
-1.231235, 1.164588, 0.381249, 0, 0, 0, 1, 1,
-1.228234, -0.04825189, -1.946542, 1, 1, 1, 1, 1,
-1.225336, 1.826391, -0.3350342, 1, 1, 1, 1, 1,
-1.224041, 0.2125847, -0.8185485, 1, 1, 1, 1, 1,
-1.223272, -0.7140729, -1.559071, 1, 1, 1, 1, 1,
-1.215415, 0.2036842, -2.028042, 1, 1, 1, 1, 1,
-1.210387, -1.244741, -1.484591, 1, 1, 1, 1, 1,
-1.21028, -2.534411, -2.149203, 1, 1, 1, 1, 1,
-1.207933, 0.4562083, -0.128998, 1, 1, 1, 1, 1,
-1.205947, -0.875832, -0.2644086, 1, 1, 1, 1, 1,
-1.204363, 0.06881327, -0.6612313, 1, 1, 1, 1, 1,
-1.202856, 0.3347615, -1.213945, 1, 1, 1, 1, 1,
-1.200682, -0.2412045, -1.281155, 1, 1, 1, 1, 1,
-1.19971, 0.758143, -1.615908, 1, 1, 1, 1, 1,
-1.196651, 0.4691699, 1.176987, 1, 1, 1, 1, 1,
-1.191586, 1.347824, -2.353338, 1, 1, 1, 1, 1,
-1.190893, 1.480574, 0.02307729, 0, 0, 1, 1, 1,
-1.188763, -1.474645, -2.565856, 1, 0, 0, 1, 1,
-1.185356, 1.300364, 0.8749163, 1, 0, 0, 1, 1,
-1.180095, 0.6797071, 0.5419413, 1, 0, 0, 1, 1,
-1.180005, -0.4382972, -1.96789, 1, 0, 0, 1, 1,
-1.175311, -0.00483882, -0.5901252, 1, 0, 0, 1, 1,
-1.169309, 0.7727012, -0.8616159, 0, 0, 0, 1, 1,
-1.16772, -0.4286968, -2.924533, 0, 0, 0, 1, 1,
-1.161932, 0.738022, 0.8118643, 0, 0, 0, 1, 1,
-1.140067, 1.028259, -0.7737375, 0, 0, 0, 1, 1,
-1.136744, -0.9744963, -0.5348387, 0, 0, 0, 1, 1,
-1.132407, -0.4862074, -3.588022, 0, 0, 0, 1, 1,
-1.127054, 0.2698092, -1.926509, 0, 0, 0, 1, 1,
-1.124372, -0.9925807, -1.251343, 1, 1, 1, 1, 1,
-1.121339, 0.3266126, -2.510658, 1, 1, 1, 1, 1,
-1.098954, -0.3282793, -1.692588, 1, 1, 1, 1, 1,
-1.093195, -1.112087, 0.136698, 1, 1, 1, 1, 1,
-1.087753, -0.6472643, -1.44682, 1, 1, 1, 1, 1,
-1.080398, 0.2196659, -1.36313, 1, 1, 1, 1, 1,
-1.076693, -2.565046, -1.983824, 1, 1, 1, 1, 1,
-1.074944, 1.772978, -0.2542758, 1, 1, 1, 1, 1,
-1.06832, -0.5182866, -1.55391, 1, 1, 1, 1, 1,
-1.067514, -0.2797804, -0.7165785, 1, 1, 1, 1, 1,
-1.066038, -0.03100676, -0.3833972, 1, 1, 1, 1, 1,
-1.061414, 1.128659, 0.2118479, 1, 1, 1, 1, 1,
-1.059399, 0.2134878, -2.268889, 1, 1, 1, 1, 1,
-1.058535, -0.004715321, -1.057842, 1, 1, 1, 1, 1,
-1.058081, -0.5182241, -2.981647, 1, 1, 1, 1, 1,
-1.056016, 2.814953, -0.7426714, 0, 0, 1, 1, 1,
-1.052357, 0.02063522, -3.065732, 1, 0, 0, 1, 1,
-1.04686, 0.5757835, -0.4934367, 1, 0, 0, 1, 1,
-1.040825, -0.2305837, -2.256584, 1, 0, 0, 1, 1,
-1.029554, -0.3093981, -2.058785, 1, 0, 0, 1, 1,
-1.019962, 0.062358, -0.1246459, 1, 0, 0, 1, 1,
-1.011371, 0.5518802, -2.965266, 0, 0, 0, 1, 1,
-1.010519, 1.116201, -1.481395, 0, 0, 0, 1, 1,
-1.007733, -0.658569, -2.461267, 0, 0, 0, 1, 1,
-0.9988307, -1.951401, -2.027372, 0, 0, 0, 1, 1,
-0.9946432, -0.06200561, -1.076505, 0, 0, 0, 1, 1,
-0.9924865, 0.1020524, -2.152259, 0, 0, 0, 1, 1,
-0.9839852, -0.3103266, -2.648494, 0, 0, 0, 1, 1,
-0.982666, 0.8434516, -1.105369, 1, 1, 1, 1, 1,
-0.9781666, 0.4964506, -2.531244, 1, 1, 1, 1, 1,
-0.9692706, 0.934366, -1.638923, 1, 1, 1, 1, 1,
-0.9687757, -0.876654, -3.584858, 1, 1, 1, 1, 1,
-0.9666268, 0.6015955, -0.142452, 1, 1, 1, 1, 1,
-0.9638395, 1.446006, -1.78147, 1, 1, 1, 1, 1,
-0.9520093, -1.580613, -1.948814, 1, 1, 1, 1, 1,
-0.9498311, 0.2137932, 0.04665798, 1, 1, 1, 1, 1,
-0.9496974, -0.2252938, -1.38998, 1, 1, 1, 1, 1,
-0.9481207, 0.2581147, -3.017377, 1, 1, 1, 1, 1,
-0.9473418, 0.7623701, 0.7721284, 1, 1, 1, 1, 1,
-0.9469169, -1.512181, -2.640451, 1, 1, 1, 1, 1,
-0.9338024, -0.6245543, -1.857628, 1, 1, 1, 1, 1,
-0.9317192, 2.425101, -0.09204593, 1, 1, 1, 1, 1,
-0.9254059, -1.095024, -1.890024, 1, 1, 1, 1, 1,
-0.9248955, 1.115901, 0.5251932, 0, 0, 1, 1, 1,
-0.9110457, 0.8418603, 0.7163524, 1, 0, 0, 1, 1,
-0.9018904, -1.212108, -2.229255, 1, 0, 0, 1, 1,
-0.8995444, -1.099095, -2.153652, 1, 0, 0, 1, 1,
-0.8959284, -1.376965, -1.08751, 1, 0, 0, 1, 1,
-0.8880877, 1.051836, -1.049022, 1, 0, 0, 1, 1,
-0.8878401, -1.269889, -3.812986, 0, 0, 0, 1, 1,
-0.8877626, -0.621986, -2.23704, 0, 0, 0, 1, 1,
-0.886937, 0.2002626, -1.390294, 0, 0, 0, 1, 1,
-0.8839028, 1.321496, -0.1825574, 0, 0, 0, 1, 1,
-0.873394, 0.08355168, -1.417153, 0, 0, 0, 1, 1,
-0.8690703, 0.5728176, -0.5491572, 0, 0, 0, 1, 1,
-0.8655227, 0.9789211, -0.8174834, 0, 0, 0, 1, 1,
-0.8643067, 0.3896482, -0.8780919, 1, 1, 1, 1, 1,
-0.8625956, -0.7062213, -3.740509, 1, 1, 1, 1, 1,
-0.8582444, -0.567311, -2.951398, 1, 1, 1, 1, 1,
-0.8558373, -1.601399, -1.626453, 1, 1, 1, 1, 1,
-0.8495741, 1.055665, -1.583878, 1, 1, 1, 1, 1,
-0.8476488, -0.7802616, -2.371705, 1, 1, 1, 1, 1,
-0.846979, 0.1780494, -2.42029, 1, 1, 1, 1, 1,
-0.8468328, -0.1953586, -1.504709, 1, 1, 1, 1, 1,
-0.8390666, 0.7846445, 1.102596, 1, 1, 1, 1, 1,
-0.8370529, -0.3266892, -3.074955, 1, 1, 1, 1, 1,
-0.8315467, -0.3904738, -1.596048, 1, 1, 1, 1, 1,
-0.8260222, -0.3584421, -4.152333, 1, 1, 1, 1, 1,
-0.8207587, 0.1237608, -0.8207428, 1, 1, 1, 1, 1,
-0.8165012, -0.1388164, -2.310823, 1, 1, 1, 1, 1,
-0.8151677, 0.4090158, -0.9391259, 1, 1, 1, 1, 1,
-0.8146256, -0.4284279, -0.2455637, 0, 0, 1, 1, 1,
-0.8131096, -0.7069224, -2.780085, 1, 0, 0, 1, 1,
-0.8119074, -1.017904, -3.871986, 1, 0, 0, 1, 1,
-0.8104927, 1.024955, -1.141297, 1, 0, 0, 1, 1,
-0.8095083, 0.207407, -3.59108, 1, 0, 0, 1, 1,
-0.8080982, -0.660827, -2.596916, 1, 0, 0, 1, 1,
-0.806918, -1.124052, -2.501409, 0, 0, 0, 1, 1,
-0.7975119, 0.2861401, -2.703082, 0, 0, 0, 1, 1,
-0.7970906, 1.691957, -0.05024425, 0, 0, 0, 1, 1,
-0.7931049, 1.693171, 1.209578, 0, 0, 0, 1, 1,
-0.7916346, -1.405136, -3.458863, 0, 0, 0, 1, 1,
-0.7875635, -0.2932357, -0.6653528, 0, 0, 0, 1, 1,
-0.7867218, -1.335242, -3.540763, 0, 0, 0, 1, 1,
-0.7800825, 0.06321385, -1.768908, 1, 1, 1, 1, 1,
-0.778556, -1.26263, -3.004649, 1, 1, 1, 1, 1,
-0.7681313, 0.2065524, -1.922933, 1, 1, 1, 1, 1,
-0.7678999, 1.003892, -2.390027, 1, 1, 1, 1, 1,
-0.7674074, -1.270802, -2.403842, 1, 1, 1, 1, 1,
-0.7653478, -0.09167437, -1.294865, 1, 1, 1, 1, 1,
-0.7649109, -0.7081812, -2.757156, 1, 1, 1, 1, 1,
-0.762019, -2.140023, -3.209182, 1, 1, 1, 1, 1,
-0.7618296, 0.04224906, -2.56971, 1, 1, 1, 1, 1,
-0.7618149, -0.5622105, -2.55373, 1, 1, 1, 1, 1,
-0.7604903, 1.316323, -0.4400423, 1, 1, 1, 1, 1,
-0.75451, 1.054492, -1.493523, 1, 1, 1, 1, 1,
-0.7532645, 1.372487, -0.7936555, 1, 1, 1, 1, 1,
-0.7493877, 1.392893, -0.8867257, 1, 1, 1, 1, 1,
-0.7487261, -0.8335051, -2.361587, 1, 1, 1, 1, 1,
-0.7467601, -0.717033, -1.92629, 0, 0, 1, 1, 1,
-0.7461336, 1.425605, 1.074078, 1, 0, 0, 1, 1,
-0.7445632, -1.455004, -3.832684, 1, 0, 0, 1, 1,
-0.7433967, -1.711478, -2.276182, 1, 0, 0, 1, 1,
-0.7422523, -1.890445, -2.375657, 1, 0, 0, 1, 1,
-0.7390738, 0.2683938, -2.113463, 1, 0, 0, 1, 1,
-0.7303181, -0.3104616, -1.956689, 0, 0, 0, 1, 1,
-0.7250532, -1.138515, -0.49005, 0, 0, 0, 1, 1,
-0.7243309, -0.2942423, -1.841363, 0, 0, 0, 1, 1,
-0.7224622, 0.9285991, 0.3291143, 0, 0, 0, 1, 1,
-0.7179658, 0.2364512, -3.346493, 0, 0, 0, 1, 1,
-0.7147292, 0.5300674, 0.8462431, 0, 0, 0, 1, 1,
-0.7144627, -1.314146, -3.261291, 0, 0, 0, 1, 1,
-0.7126741, 0.5863037, -1.959286, 1, 1, 1, 1, 1,
-0.7101978, 0.142611, -0.1199407, 1, 1, 1, 1, 1,
-0.7094414, 0.3799316, -1.475175, 1, 1, 1, 1, 1,
-0.7050929, -0.5508687, -2.407692, 1, 1, 1, 1, 1,
-0.7000692, 1.443541, -0.3000843, 1, 1, 1, 1, 1,
-0.6983656, 2.997128, -0.4810582, 1, 1, 1, 1, 1,
-0.6935919, 0.05019167, -0.824864, 1, 1, 1, 1, 1,
-0.691898, -0.2017392, -3.329353, 1, 1, 1, 1, 1,
-0.6891881, -1.114827, -4.38515, 1, 1, 1, 1, 1,
-0.6860398, -0.776605, -3.175925, 1, 1, 1, 1, 1,
-0.6819313, 1.250048, -0.3697505, 1, 1, 1, 1, 1,
-0.6813341, -0.7400617, -3.254738, 1, 1, 1, 1, 1,
-0.6796211, -0.517745, -2.672885, 1, 1, 1, 1, 1,
-0.6790437, 0.5189562, -2.862209, 1, 1, 1, 1, 1,
-0.6750376, -0.0913758, -2.176871, 1, 1, 1, 1, 1,
-0.6737109, 1.964717, 0.179081, 0, 0, 1, 1, 1,
-0.6730275, -0.8009059, -1.118847, 1, 0, 0, 1, 1,
-0.6727963, -1.456196, -2.795728, 1, 0, 0, 1, 1,
-0.6725426, -0.9729014, -3.596575, 1, 0, 0, 1, 1,
-0.671034, -1.562027, -4.451551, 1, 0, 0, 1, 1,
-0.6664116, -0.2649519, -0.858763, 1, 0, 0, 1, 1,
-0.6661095, 0.9704049, 0.1737266, 0, 0, 0, 1, 1,
-0.6654301, 0.1021553, -1.709625, 0, 0, 0, 1, 1,
-0.6647602, -0.9453808, -2.444415, 0, 0, 0, 1, 1,
-0.6643671, 0.2913594, -0.7488167, 0, 0, 0, 1, 1,
-0.6596118, 0.8079098, -0.6962351, 0, 0, 0, 1, 1,
-0.65785, -1.130333, -3.306696, 0, 0, 0, 1, 1,
-0.6529598, 0.7966525, -0.3372399, 0, 0, 0, 1, 1,
-0.6509321, 0.775942, -2.055218, 1, 1, 1, 1, 1,
-0.6472322, -0.6046869, -2.166633, 1, 1, 1, 1, 1,
-0.6438482, -0.2439395, -2.336554, 1, 1, 1, 1, 1,
-0.6424597, 0.2573375, -0.7943139, 1, 1, 1, 1, 1,
-0.641434, -1.477765, -3.563009, 1, 1, 1, 1, 1,
-0.6413621, 0.3951312, -0.60631, 1, 1, 1, 1, 1,
-0.6396885, -0.951908, -0.7079705, 1, 1, 1, 1, 1,
-0.6367834, -0.7989202, -1.385197, 1, 1, 1, 1, 1,
-0.6353561, -0.6680824, -3.26878, 1, 1, 1, 1, 1,
-0.6347862, -0.3261038, -1.894348, 1, 1, 1, 1, 1,
-0.630057, 0.2399663, -0.3466201, 1, 1, 1, 1, 1,
-0.6255144, -0.1012546, -2.17537, 1, 1, 1, 1, 1,
-0.624558, 1.025616, -2.973947, 1, 1, 1, 1, 1,
-0.6168369, -0.1157121, 0.3225941, 1, 1, 1, 1, 1,
-0.6099499, 0.9463534, -0.6776288, 1, 1, 1, 1, 1,
-0.6041092, 2.826158, -0.002812353, 0, 0, 1, 1, 1,
-0.5948795, 0.6771364, 0.3699193, 1, 0, 0, 1, 1,
-0.5887938, 1.140881, 0.4082158, 1, 0, 0, 1, 1,
-0.5864939, -0.6787071, -1.91273, 1, 0, 0, 1, 1,
-0.5863564, -0.9546004, -1.156313, 1, 0, 0, 1, 1,
-0.5845292, 0.7018954, 1.217432, 1, 0, 0, 1, 1,
-0.5824772, 0.006453472, -1.703194, 0, 0, 0, 1, 1,
-0.5816835, 0.4075491, -1.738006, 0, 0, 0, 1, 1,
-0.5807, -0.9419521, -2.359648, 0, 0, 0, 1, 1,
-0.5806767, -1.745106, -3.326198, 0, 0, 0, 1, 1,
-0.5762264, -0.4473057, -2.017447, 0, 0, 0, 1, 1,
-0.5756616, 0.9860326, -0.8153963, 0, 0, 0, 1, 1,
-0.5734867, 0.6286157, -0.7684814, 0, 0, 0, 1, 1,
-0.5710311, -1.997254, -5.051912, 1, 1, 1, 1, 1,
-0.5682048, 0.8671055, 0.1221746, 1, 1, 1, 1, 1,
-0.5677841, 0.3552009, -0.4878774, 1, 1, 1, 1, 1,
-0.5669613, -1.222151, -2.33616, 1, 1, 1, 1, 1,
-0.5664114, 0.2174046, -2.562479, 1, 1, 1, 1, 1,
-0.5663837, -0.1869227, -2.536717, 1, 1, 1, 1, 1,
-0.5601159, 1.140105, 0.5411258, 1, 1, 1, 1, 1,
-0.5600353, -0.08381008, -2.08131, 1, 1, 1, 1, 1,
-0.5569999, 0.5520194, -0.6714689, 1, 1, 1, 1, 1,
-0.5533968, 0.6624923, -1.288173, 1, 1, 1, 1, 1,
-0.5507339, 0.4874257, 0.1906918, 1, 1, 1, 1, 1,
-0.5475922, -0.7020842, -4.253412, 1, 1, 1, 1, 1,
-0.5469708, -1.277454, -2.923848, 1, 1, 1, 1, 1,
-0.5418448, -0.08481702, -1.805447, 1, 1, 1, 1, 1,
-0.5375941, 0.9584918, -0.4443802, 1, 1, 1, 1, 1,
-0.5358027, -0.2260734, -2.441031, 0, 0, 1, 1, 1,
-0.5337839, -0.3600241, -3.163763, 1, 0, 0, 1, 1,
-0.5334606, 0.08800068, -2.606214, 1, 0, 0, 1, 1,
-0.5308141, -0.541182, -2.304695, 1, 0, 0, 1, 1,
-0.5295125, -0.4805749, -0.5147861, 1, 0, 0, 1, 1,
-0.5248377, -0.04549199, 0.03221511, 1, 0, 0, 1, 1,
-0.5241796, 0.390201, -1.03841, 0, 0, 0, 1, 1,
-0.5228835, 0.2021131, -1.76146, 0, 0, 0, 1, 1,
-0.5216922, -0.7361404, -2.408299, 0, 0, 0, 1, 1,
-0.520393, -1.282379, -4.165113, 0, 0, 0, 1, 1,
-0.5159588, -1.92705, -4.594429, 0, 0, 0, 1, 1,
-0.5111223, 1.383171, -0.5805314, 0, 0, 0, 1, 1,
-0.5081912, -1.697768, -2.246073, 0, 0, 0, 1, 1,
-0.5049314, -0.5856808, -3.371571, 1, 1, 1, 1, 1,
-0.498013, -0.3753963, 0.2723361, 1, 1, 1, 1, 1,
-0.4973666, 0.7391713, 0.1145161, 1, 1, 1, 1, 1,
-0.49444, -1.272301, -2.238388, 1, 1, 1, 1, 1,
-0.4936825, 0.2943866, -0.08941504, 1, 1, 1, 1, 1,
-0.493593, -0.6439357, -2.771415, 1, 1, 1, 1, 1,
-0.4923806, -1.084938, -4.205379, 1, 1, 1, 1, 1,
-0.4871667, -0.08506835, -2.102795, 1, 1, 1, 1, 1,
-0.4828337, -0.09590599, -2.256347, 1, 1, 1, 1, 1,
-0.4822429, -2.466759, -4.065243, 1, 1, 1, 1, 1,
-0.4794642, -0.5734652, -1.387722, 1, 1, 1, 1, 1,
-0.4788701, -1.531482, -3.475708, 1, 1, 1, 1, 1,
-0.4782001, 1.368425, -1.040452, 1, 1, 1, 1, 1,
-0.4762256, 1.107598, 1.07593, 1, 1, 1, 1, 1,
-0.4704634, 0.3477625, -0.5198102, 1, 1, 1, 1, 1,
-0.4671565, 0.6800634, -1.562718, 0, 0, 1, 1, 1,
-0.4668363, 0.8088102, -0.1918955, 1, 0, 0, 1, 1,
-0.4666997, 0.9099241, -2.11683, 1, 0, 0, 1, 1,
-0.4644183, 1.491912, -0.3554646, 1, 0, 0, 1, 1,
-0.4620408, 0.6229517, -0.1415529, 1, 0, 0, 1, 1,
-0.4563811, -0.1225616, -1.175992, 1, 0, 0, 1, 1,
-0.4504625, 1.484167, -0.5649206, 0, 0, 0, 1, 1,
-0.4494636, -0.4346366, -3.131326, 0, 0, 0, 1, 1,
-0.4428651, -1.39984, -1.705067, 0, 0, 0, 1, 1,
-0.4397324, 1.186451, 0.4918697, 0, 0, 0, 1, 1,
-0.4394218, 0.6802159, 0.4716092, 0, 0, 0, 1, 1,
-0.4368597, -0.2814704, -2.798429, 0, 0, 0, 1, 1,
-0.4282352, 1.190364, 0.9328273, 0, 0, 0, 1, 1,
-0.4261968, 0.873817, -1.953339, 1, 1, 1, 1, 1,
-0.4227735, -0.6651978, -2.83616, 1, 1, 1, 1, 1,
-0.4180168, -1.89405, -1.776445, 1, 1, 1, 1, 1,
-0.41613, 0.3248796, -0.02465483, 1, 1, 1, 1, 1,
-0.4110701, 0.936997, -0.6820961, 1, 1, 1, 1, 1,
-0.4084257, 0.4912847, 0.01555215, 1, 1, 1, 1, 1,
-0.4022365, -1.550937, -1.789354, 1, 1, 1, 1, 1,
-0.4020882, -0.4996598, -2.524252, 1, 1, 1, 1, 1,
-0.399092, -0.4479865, -3.052942, 1, 1, 1, 1, 1,
-0.3978919, 0.6425262, 0.8916088, 1, 1, 1, 1, 1,
-0.3971503, 0.07338529, -2.858152, 1, 1, 1, 1, 1,
-0.395164, 1.151633, -0.69605, 1, 1, 1, 1, 1,
-0.3939708, 0.3929427, -0.4597284, 1, 1, 1, 1, 1,
-0.3870648, -1.480616, -4.385764, 1, 1, 1, 1, 1,
-0.3809868, -0.4300463, -3.419658, 1, 1, 1, 1, 1,
-0.3809479, -2.082662, -3.902604, 0, 0, 1, 1, 1,
-0.3786623, -1.579133, -2.331558, 1, 0, 0, 1, 1,
-0.3781126, 0.05588367, -0.9313734, 1, 0, 0, 1, 1,
-0.3769326, 0.8822808, -0.9546794, 1, 0, 0, 1, 1,
-0.367525, -1.584884, -3.031927, 1, 0, 0, 1, 1,
-0.3617853, -1.370402, -1.997139, 1, 0, 0, 1, 1,
-0.3599913, -0.8196071, -0.6831039, 0, 0, 0, 1, 1,
-0.3589549, 1.942958, 1.665893, 0, 0, 0, 1, 1,
-0.3533066, 1.084645, -1.250706, 0, 0, 0, 1, 1,
-0.3515527, -0.5542249, -4.127215, 0, 0, 0, 1, 1,
-0.3497589, -0.03248331, -1.995986, 0, 0, 0, 1, 1,
-0.3455109, 0.3421563, -2.012789, 0, 0, 0, 1, 1,
-0.3388528, -0.7648027, -0.7474539, 0, 0, 0, 1, 1,
-0.3381242, -2.130464, -3.878478, 1, 1, 1, 1, 1,
-0.3360822, -0.6350138, -1.71672, 1, 1, 1, 1, 1,
-0.3355868, -2.79596, -2.009311, 1, 1, 1, 1, 1,
-0.3355354, 0.5033235, -0.6947836, 1, 1, 1, 1, 1,
-0.3291925, -1.340518, -4.534222, 1, 1, 1, 1, 1,
-0.3246227, 0.8472274, 0.3126518, 1, 1, 1, 1, 1,
-0.323943, 0.3009639, -0.5944235, 1, 1, 1, 1, 1,
-0.3217312, 0.3280073, -2.947276, 1, 1, 1, 1, 1,
-0.3172759, -0.2473793, -2.513682, 1, 1, 1, 1, 1,
-0.3165844, 0.8810012, 0.3146451, 1, 1, 1, 1, 1,
-0.3129566, 0.01582881, -1.697349, 1, 1, 1, 1, 1,
-0.3120298, 2.365797, -0.5439636, 1, 1, 1, 1, 1,
-0.3106743, -3.209047, -5.037936, 1, 1, 1, 1, 1,
-0.3073064, 2.127859, -0.7516466, 1, 1, 1, 1, 1,
-0.3050599, -0.03706035, -1.109299, 1, 1, 1, 1, 1,
-0.3047836, -0.4892446, -1.688587, 0, 0, 1, 1, 1,
-0.3004523, -1.206126, -3.72266, 1, 0, 0, 1, 1,
-0.2973368, 0.4234636, -2.321024, 1, 0, 0, 1, 1,
-0.2969522, -1.579737, -2.442146, 1, 0, 0, 1, 1,
-0.2936789, 0.2317756, -0.3847226, 1, 0, 0, 1, 1,
-0.2917976, 0.09284475, -1.529398, 1, 0, 0, 1, 1,
-0.2915564, 0.9822476, -0.1607989, 0, 0, 0, 1, 1,
-0.2893698, -0.6093548, -4.018407, 0, 0, 0, 1, 1,
-0.2893594, -1.164966, -4.888605, 0, 0, 0, 1, 1,
-0.2889041, -0.667118, -4.643234, 0, 0, 0, 1, 1,
-0.2886852, 1.155329, 0.2002288, 0, 0, 0, 1, 1,
-0.2883933, 1.928583, -0.3079547, 0, 0, 0, 1, 1,
-0.2870952, 0.490648, 0.8686026, 0, 0, 0, 1, 1,
-0.2870789, 0.3340206, -0.3022912, 1, 1, 1, 1, 1,
-0.2864973, -1.071623, -5.579666, 1, 1, 1, 1, 1,
-0.2789778, -0.5741023, -3.35566, 1, 1, 1, 1, 1,
-0.2777987, 0.8936366, -1.41026, 1, 1, 1, 1, 1,
-0.2753783, 0.7803825, -0.08611757, 1, 1, 1, 1, 1,
-0.2753628, -1.740355, -4.291387, 1, 1, 1, 1, 1,
-0.275102, -0.435135, -2.200725, 1, 1, 1, 1, 1,
-0.2701351, 0.5774395, 1.932775, 1, 1, 1, 1, 1,
-0.2651829, 2.698544, -2.277545, 1, 1, 1, 1, 1,
-0.2636297, 0.8241476, -1.336543, 1, 1, 1, 1, 1,
-0.2624236, 0.4820765, -1.480378, 1, 1, 1, 1, 1,
-0.2621115, -0.629501, -2.312824, 1, 1, 1, 1, 1,
-0.2556396, -0.3892574, -2.177285, 1, 1, 1, 1, 1,
-0.2480589, 2.229206, -0.9832333, 1, 1, 1, 1, 1,
-0.2477071, 0.4601777, -1.06515, 1, 1, 1, 1, 1,
-0.2423022, 1.576353, 0.3924315, 0, 0, 1, 1, 1,
-0.2392743, 0.6746033, 1.375405, 1, 0, 0, 1, 1,
-0.2354303, 1.698111, 0.2888282, 1, 0, 0, 1, 1,
-0.229654, -0.2649862, -2.581008, 1, 0, 0, 1, 1,
-0.2268352, -1.048004, -2.240708, 1, 0, 0, 1, 1,
-0.2238019, -0.1451254, -3.637395, 1, 0, 0, 1, 1,
-0.2232503, -0.01357896, -1.005733, 0, 0, 0, 1, 1,
-0.2143281, -0.3428667, -3.244122, 0, 0, 0, 1, 1,
-0.2059519, 0.3349859, 0.002934985, 0, 0, 0, 1, 1,
-0.203327, -0.5944522, -2.863919, 0, 0, 0, 1, 1,
-0.2023874, 1.065635, -0.6725965, 0, 0, 0, 1, 1,
-0.2008154, 0.04698339, -1.544675, 0, 0, 0, 1, 1,
-0.1934219, 0.9335446, 0.9570109, 0, 0, 0, 1, 1,
-0.1921503, -1.458117, -2.36111, 1, 1, 1, 1, 1,
-0.182643, 0.7397297, 0.6425577, 1, 1, 1, 1, 1,
-0.1811696, -0.5017965, -4.965057, 1, 1, 1, 1, 1,
-0.175649, 0.44527, -1.81557, 1, 1, 1, 1, 1,
-0.1754616, -0.69821, -1.837839, 1, 1, 1, 1, 1,
-0.1746845, -0.3671617, -2.203756, 1, 1, 1, 1, 1,
-0.1700297, -0.1459805, -3.199299, 1, 1, 1, 1, 1,
-0.1690918, -0.1142789, -4.08141, 1, 1, 1, 1, 1,
-0.1677874, -0.2103174, -4.797339, 1, 1, 1, 1, 1,
-0.1654617, 2.010553, 1.010392, 1, 1, 1, 1, 1,
-0.1650352, 1.275537, 0.4740545, 1, 1, 1, 1, 1,
-0.1629533, -0.2334132, -1.644176, 1, 1, 1, 1, 1,
-0.1597741, 0.3700186, -1.311206, 1, 1, 1, 1, 1,
-0.1595823, 0.2814475, -1.370756, 1, 1, 1, 1, 1,
-0.1566534, -1.299644, -2.857031, 1, 1, 1, 1, 1,
-0.1566432, 0.2949265, 0.1583001, 0, 0, 1, 1, 1,
-0.1537589, 0.4878122, -0.9204935, 1, 0, 0, 1, 1,
-0.1532514, -2.511199, -3.294729, 1, 0, 0, 1, 1,
-0.1481481, -0.8235061, -5.554038, 1, 0, 0, 1, 1,
-0.1468004, 2.952292, 0.3965061, 1, 0, 0, 1, 1,
-0.1449859, 0.2494475, -0.8147929, 1, 0, 0, 1, 1,
-0.1430497, 0.7248065, -0.690986, 0, 0, 0, 1, 1,
-0.1422489, 0.5463023, -0.4296961, 0, 0, 0, 1, 1,
-0.1390831, -0.09496449, -2.421071, 0, 0, 0, 1, 1,
-0.1386683, 0.9239404, -1.207666, 0, 0, 0, 1, 1,
-0.1386242, 0.8242306, 1.382906, 0, 0, 0, 1, 1,
-0.1382897, -0.5318787, -2.63684, 0, 0, 0, 1, 1,
-0.1355441, 0.7534205, -0.07459172, 0, 0, 0, 1, 1,
-0.1340193, 1.023128, -0.1268767, 1, 1, 1, 1, 1,
-0.1321066, 0.4855906, 1.577136, 1, 1, 1, 1, 1,
-0.132086, -0.8871977, -3.144788, 1, 1, 1, 1, 1,
-0.1306001, 0.3333957, -1.16992, 1, 1, 1, 1, 1,
-0.1303244, -0.00289211, -1.163768, 1, 1, 1, 1, 1,
-0.1297677, -1.982701, -1.999876, 1, 1, 1, 1, 1,
-0.1283357, 0.9906134, 1.307485, 1, 1, 1, 1, 1,
-0.1266903, -0.2568196, -1.424976, 1, 1, 1, 1, 1,
-0.1251877, 1.937533, -1.546217, 1, 1, 1, 1, 1,
-0.1243724, -0.5526287, -3.149772, 1, 1, 1, 1, 1,
-0.1230154, 0.4201226, 0.05885286, 1, 1, 1, 1, 1,
-0.1193633, 0.3804357, -0.2784894, 1, 1, 1, 1, 1,
-0.1159314, -1.424641, -1.789993, 1, 1, 1, 1, 1,
-0.1140476, 0.3990274, -0.2173749, 1, 1, 1, 1, 1,
-0.1100223, -0.5406128, -3.081913, 1, 1, 1, 1, 1,
-0.1097902, 0.2097669, 0.03914876, 0, 0, 1, 1, 1,
-0.1014567, 0.2426592, -0.844096, 1, 0, 0, 1, 1,
-0.09975963, 0.5112571, 0.6211865, 1, 0, 0, 1, 1,
-0.09666291, -0.5342079, -2.228286, 1, 0, 0, 1, 1,
-0.09656038, -0.7755265, -2.234152, 1, 0, 0, 1, 1,
-0.0933699, -1.777103, -1.786342, 1, 0, 0, 1, 1,
-0.09142327, -0.3169253, -3.541378, 0, 0, 0, 1, 1,
-0.0900976, -0.3878896, -3.055249, 0, 0, 0, 1, 1,
-0.08308244, -0.8642621, -2.928952, 0, 0, 0, 1, 1,
-0.0808358, -0.9148556, -1.207505, 0, 0, 0, 1, 1,
-0.07652066, 0.4107735, 0.5170001, 0, 0, 0, 1, 1,
-0.07271969, -0.3434487, -1.776077, 0, 0, 0, 1, 1,
-0.07136652, -0.4432273, -1.728868, 0, 0, 0, 1, 1,
-0.06136409, 0.2073072, -0.7212127, 1, 1, 1, 1, 1,
-0.0559816, 0.6539387, -0.3218354, 1, 1, 1, 1, 1,
-0.05030094, -1.292199, -1.988622, 1, 1, 1, 1, 1,
-0.04952434, -0.1115001, -2.337753, 1, 1, 1, 1, 1,
-0.04785569, -2.359162, -3.115247, 1, 1, 1, 1, 1,
-0.04551752, 0.3099419, -1.519925, 1, 1, 1, 1, 1,
-0.04390538, -0.8831936, -2.927611, 1, 1, 1, 1, 1,
-0.04006977, 0.3053223, -0.1879262, 1, 1, 1, 1, 1,
-0.03051891, -1.423193, -1.992836, 1, 1, 1, 1, 1,
-0.02980933, 1.326111, 1.220896, 1, 1, 1, 1, 1,
-0.02786819, 0.2956124, 0.2394677, 1, 1, 1, 1, 1,
-0.0223029, -0.3950675, -2.72448, 1, 1, 1, 1, 1,
-0.01860156, 0.7404639, -2.748578, 1, 1, 1, 1, 1,
-0.01853938, 0.6837064, 0.04849327, 1, 1, 1, 1, 1,
-0.0109292, -0.3521537, -1.473172, 1, 1, 1, 1, 1,
-0.009359849, -0.4852761, -5.528662, 0, 0, 1, 1, 1,
-0.007457121, 0.7571383, 2.083373, 1, 0, 0, 1, 1,
-0.007380723, 0.7417717, -0.9458317, 1, 0, 0, 1, 1,
-0.005664696, -0.2984578, -3.15162, 1, 0, 0, 1, 1,
-0.002991149, 1.253977, 0.87884, 1, 0, 0, 1, 1,
-0.0009952632, 0.09872108, 0.03751507, 1, 0, 0, 1, 1,
-2.977903e-05, -0.5624567, -4.420479, 0, 0, 0, 1, 1,
0.0004645326, -0.3038632, 3.109268, 0, 0, 0, 1, 1,
0.001502419, -1.420084, 4.008401, 0, 0, 0, 1, 1,
0.001965978, 0.7536962, -0.3206607, 0, 0, 0, 1, 1,
0.003815001, 0.6521773, -0.1227041, 0, 0, 0, 1, 1,
0.0135527, -0.4251877, 2.611251, 0, 0, 0, 1, 1,
0.01611448, -0.248809, 4.020453, 0, 0, 0, 1, 1,
0.01626237, -0.3185158, 2.884258, 1, 1, 1, 1, 1,
0.0165906, 0.8608706, 1.071307, 1, 1, 1, 1, 1,
0.01976659, -1.517982, 4.444255, 1, 1, 1, 1, 1,
0.02009924, -0.7073088, 2.991407, 1, 1, 1, 1, 1,
0.02872457, 0.3555067, 0.704699, 1, 1, 1, 1, 1,
0.02970846, -0.5336173, 3.19723, 1, 1, 1, 1, 1,
0.03178672, 1.028652, 1.357668, 1, 1, 1, 1, 1,
0.03519335, -0.6710322, 3.635387, 1, 1, 1, 1, 1,
0.03801221, -0.06382482, 3.160173, 1, 1, 1, 1, 1,
0.0394175, 0.6654058, 0.2092374, 1, 1, 1, 1, 1,
0.04032582, 0.006254347, 1.404782, 1, 1, 1, 1, 1,
0.04206323, -0.6215093, 2.233552, 1, 1, 1, 1, 1,
0.04274684, 0.1899398, 3.239663, 1, 1, 1, 1, 1,
0.04422208, -0.3109613, 2.711239, 1, 1, 1, 1, 1,
0.0444424, -0.2941329, 4.941978, 1, 1, 1, 1, 1,
0.04575703, -2.004345, 1.668946, 0, 0, 1, 1, 1,
0.04790945, -0.674941, 2.295605, 1, 0, 0, 1, 1,
0.04899956, -0.4477135, 2.316453, 1, 0, 0, 1, 1,
0.05458726, 0.9893584, 0.4422136, 1, 0, 0, 1, 1,
0.05739739, -1.116202, 4.06073, 1, 0, 0, 1, 1,
0.06054873, 0.2378019, -0.3904913, 1, 0, 0, 1, 1,
0.06128804, 1.570198, -0.8094564, 0, 0, 0, 1, 1,
0.06262442, 1.802822, -1.025866, 0, 0, 0, 1, 1,
0.06793561, -0.6288002, 2.446146, 0, 0, 0, 1, 1,
0.07049659, 0.3451385, -0.02165397, 0, 0, 0, 1, 1,
0.07108108, 0.6328647, -0.02065185, 0, 0, 0, 1, 1,
0.07201389, -0.2407422, 1.686673, 0, 0, 0, 1, 1,
0.07628316, -0.9736601, 2.547221, 0, 0, 0, 1, 1,
0.07936621, 1.345267, 1.206672, 1, 1, 1, 1, 1,
0.08044393, -0.306997, 3.884014, 1, 1, 1, 1, 1,
0.08106627, -0.4536931, 3.382207, 1, 1, 1, 1, 1,
0.08702809, 0.8997356, 1.332797, 1, 1, 1, 1, 1,
0.08863596, 1.445777, 0.7417195, 1, 1, 1, 1, 1,
0.08981171, -1.739703, 2.437021, 1, 1, 1, 1, 1,
0.09177659, 0.1687539, 0.4357641, 1, 1, 1, 1, 1,
0.09476081, 1.341063, 0.1729236, 1, 1, 1, 1, 1,
0.09722444, -0.7666425, 2.351104, 1, 1, 1, 1, 1,
0.1072362, 0.06070384, 1.548085, 1, 1, 1, 1, 1,
0.112466, 1.032604, -0.893405, 1, 1, 1, 1, 1,
0.112702, 0.1713814, -0.4065563, 1, 1, 1, 1, 1,
0.1172147, -0.6283081, 3.605308, 1, 1, 1, 1, 1,
0.1216229, -0.08073481, 2.472701, 1, 1, 1, 1, 1,
0.1258384, 1.105371, 0.8650261, 1, 1, 1, 1, 1,
0.1300145, -0.2702281, 3.273025, 0, 0, 1, 1, 1,
0.1313577, -1.579163, 2.126123, 1, 0, 0, 1, 1,
0.1498995, 1.410612, -0.3657371, 1, 0, 0, 1, 1,
0.1571221, -0.4617468, 3.024541, 1, 0, 0, 1, 1,
0.1583335, 0.5383986, 1.417215, 1, 0, 0, 1, 1,
0.1584222, 0.8787403, -0.1177716, 1, 0, 0, 1, 1,
0.1585236, 1.877214, 0.4482473, 0, 0, 0, 1, 1,
0.1592916, 0.7224408, 0.07637671, 0, 0, 0, 1, 1,
0.1721665, 1.140769, -1.590528, 0, 0, 0, 1, 1,
0.1760574, 0.5915958, -0.5229704, 0, 0, 0, 1, 1,
0.1764987, 0.2693228, 1.054151, 0, 0, 0, 1, 1,
0.1783975, 0.04916335, 0.8141818, 0, 0, 0, 1, 1,
0.179147, 0.4741591, 0.3625433, 0, 0, 0, 1, 1,
0.1799955, -1.589028, 1.778775, 1, 1, 1, 1, 1,
0.1813354, -0.3136376, 2.72909, 1, 1, 1, 1, 1,
0.185516, -0.7585219, 3.083867, 1, 1, 1, 1, 1,
0.1931936, -2.268248, 4.00119, 1, 1, 1, 1, 1,
0.2029399, -1.004244, 3.728842, 1, 1, 1, 1, 1,
0.2107719, -0.342287, 2.40193, 1, 1, 1, 1, 1,
0.2114568, 0.7491122, -0.1265974, 1, 1, 1, 1, 1,
0.2164109, -0.237718, 2.221649, 1, 1, 1, 1, 1,
0.2168722, 0.6216693, -0.1292955, 1, 1, 1, 1, 1,
0.2204117, -0.1684416, 1.260229, 1, 1, 1, 1, 1,
0.2215317, 0.7400057, 0.03281448, 1, 1, 1, 1, 1,
0.2219264, -0.8027564, 4.228162, 1, 1, 1, 1, 1,
0.2269506, -0.0366865, 1.052654, 1, 1, 1, 1, 1,
0.2296856, -1.613159, 4.589968, 1, 1, 1, 1, 1,
0.2302901, 0.7779388, 0.2854089, 1, 1, 1, 1, 1,
0.2371107, 0.7861062, 2.581306, 0, 0, 1, 1, 1,
0.2378044, 0.2659402, 0.5915384, 1, 0, 0, 1, 1,
0.2399084, 0.4483841, -0.6171395, 1, 0, 0, 1, 1,
0.2409818, 0.4561996, 1.335856, 1, 0, 0, 1, 1,
0.2426866, 1.314503, 0.03395351, 1, 0, 0, 1, 1,
0.2464685, -0.07312331, 1.139132, 1, 0, 0, 1, 1,
0.2516459, -0.09782463, 1.427864, 0, 0, 0, 1, 1,
0.2557814, 1.307086, 0.7259327, 0, 0, 0, 1, 1,
0.2573946, 1.895326, 0.02032173, 0, 0, 0, 1, 1,
0.261551, 1.288695, 0.9023797, 0, 0, 0, 1, 1,
0.2624307, -1.540071, 3.42158, 0, 0, 0, 1, 1,
0.263266, 0.7655228, 2.488272, 0, 0, 0, 1, 1,
0.2643116, 1.473281, -1.867365, 0, 0, 0, 1, 1,
0.2650363, -0.03574518, 3.599209, 1, 1, 1, 1, 1,
0.2661689, 0.8862101, 0.5748264, 1, 1, 1, 1, 1,
0.266248, -0.2548037, 0.2950203, 1, 1, 1, 1, 1,
0.277596, 1.383112, -0.7538585, 1, 1, 1, 1, 1,
0.2803818, 1.228507, 0.2316726, 1, 1, 1, 1, 1,
0.2848105, -1.210649, 4.582373, 1, 1, 1, 1, 1,
0.2853733, 0.90624, 0.2699941, 1, 1, 1, 1, 1,
0.2854233, -0.7771747, 3.279029, 1, 1, 1, 1, 1,
0.2857355, -1.222494, 2.937901, 1, 1, 1, 1, 1,
0.2863158, 1.183938, -0.3686429, 1, 1, 1, 1, 1,
0.2865053, 0.2645974, 0.2826179, 1, 1, 1, 1, 1,
0.2865265, 0.2419957, -0.5573924, 1, 1, 1, 1, 1,
0.2865857, -0.2915924, 3.32068, 1, 1, 1, 1, 1,
0.2884027, 1.013467, -1.04014, 1, 1, 1, 1, 1,
0.2884308, 0.2823989, 1.919252, 1, 1, 1, 1, 1,
0.291806, 0.1335286, 0.5800243, 0, 0, 1, 1, 1,
0.3019787, -1.06403, 3.726336, 1, 0, 0, 1, 1,
0.3050786, 1.694149, 0.262632, 1, 0, 0, 1, 1,
0.309209, -0.8447084, 4.828667, 1, 0, 0, 1, 1,
0.3105504, -2.066274, 5.084239, 1, 0, 0, 1, 1,
0.3113838, 1.139071, -0.7144519, 1, 0, 0, 1, 1,
0.314694, -0.6441667, 3.284377, 0, 0, 0, 1, 1,
0.3163534, -1.496587, 3.392401, 0, 0, 0, 1, 1,
0.3251602, -0.2081534, 3.58944, 0, 0, 0, 1, 1,
0.3269452, -0.8730571, 1.273185, 0, 0, 0, 1, 1,
0.3278726, 1.515839, -0.134414, 0, 0, 0, 1, 1,
0.3288644, -1.483006, 1.656299, 0, 0, 0, 1, 1,
0.3416635, 0.2704487, 1.524716, 0, 0, 0, 1, 1,
0.3436025, 1.046815, -0.1014494, 1, 1, 1, 1, 1,
0.3437295, -0.03941987, 1.697563, 1, 1, 1, 1, 1,
0.3445669, -0.5711148, 2.124501, 1, 1, 1, 1, 1,
0.3465314, 0.2565866, 0.2099025, 1, 1, 1, 1, 1,
0.3488282, 1.476698, 0.4210201, 1, 1, 1, 1, 1,
0.3495141, -1.080782, 2.234497, 1, 1, 1, 1, 1,
0.3591022, -0.05231075, 1.862574, 1, 1, 1, 1, 1,
0.361371, 1.156958, -0.150554, 1, 1, 1, 1, 1,
0.3645995, 0.888346, 1.290492, 1, 1, 1, 1, 1,
0.3721711, 0.661505, 0.4630491, 1, 1, 1, 1, 1,
0.3734116, 1.047011, -2.572413, 1, 1, 1, 1, 1,
0.3761048, -0.9848855, 3.518423, 1, 1, 1, 1, 1,
0.3762526, 0.2840002, 1.194121, 1, 1, 1, 1, 1,
0.3767555, 0.4510231, 0.5374172, 1, 1, 1, 1, 1,
0.379134, 0.5501821, 1.852784, 1, 1, 1, 1, 1,
0.3792455, -0.4107179, 3.418441, 0, 0, 1, 1, 1,
0.3794373, -1.16279, 3.072878, 1, 0, 0, 1, 1,
0.3819196, -1.264663, 4.73838, 1, 0, 0, 1, 1,
0.3839085, 2.450622, -0.4594078, 1, 0, 0, 1, 1,
0.3935117, 0.6453309, -0.2942068, 1, 0, 0, 1, 1,
0.3982723, 0.3861811, 0.8239222, 1, 0, 0, 1, 1,
0.3989998, -1.42483, 3.130586, 0, 0, 0, 1, 1,
0.4002683, 0.5915949, 0.7141969, 0, 0, 0, 1, 1,
0.4062576, 0.5268482, 0.5866787, 0, 0, 0, 1, 1,
0.4066907, -1.168161, 2.852277, 0, 0, 0, 1, 1,
0.4086601, -0.07031954, 0.7978444, 0, 0, 0, 1, 1,
0.4162666, -1.015595, 2.551322, 0, 0, 0, 1, 1,
0.4171984, -0.7900255, 1.842478, 0, 0, 0, 1, 1,
0.4191863, 0.6035777, 2.437187, 1, 1, 1, 1, 1,
0.4196391, -1.382433, 3.82051, 1, 1, 1, 1, 1,
0.4243309, -0.2557632, 3.458901, 1, 1, 1, 1, 1,
0.4297725, -0.4390161, 2.725496, 1, 1, 1, 1, 1,
0.4298981, 1.259836, 0.02567654, 1, 1, 1, 1, 1,
0.4306151, 0.393935, 2.100185, 1, 1, 1, 1, 1,
0.432408, 2.121782, 1.691918, 1, 1, 1, 1, 1,
0.4423935, 2.161145, -1.598281, 1, 1, 1, 1, 1,
0.4437698, -0.2136937, 3.427643, 1, 1, 1, 1, 1,
0.4453163, -1.183245, 1.170471, 1, 1, 1, 1, 1,
0.4475092, 1.364297, 0.8604634, 1, 1, 1, 1, 1,
0.4475543, -0.4107186, 3.453934, 1, 1, 1, 1, 1,
0.4496502, 1.46252, 0.7114289, 1, 1, 1, 1, 1,
0.4505966, 1.882411, -0.5198008, 1, 1, 1, 1, 1,
0.4521607, -1.304612, 2.896383, 1, 1, 1, 1, 1,
0.4526064, 1.587681, -1.291594, 0, 0, 1, 1, 1,
0.4548275, -0.1849255, 2.021011, 1, 0, 0, 1, 1,
0.4641659, -0.04197539, 1.056581, 1, 0, 0, 1, 1,
0.4659002, 0.09713764, -0.01098138, 1, 0, 0, 1, 1,
0.4725275, 0.01781612, 1.779639, 1, 0, 0, 1, 1,
0.473234, -0.3586131, 2.668756, 1, 0, 0, 1, 1,
0.4786902, -0.2424361, 1.529454, 0, 0, 0, 1, 1,
0.4837992, -0.52217, 1.271938, 0, 0, 0, 1, 1,
0.4841566, -0.569693, 2.839542, 0, 0, 0, 1, 1,
0.4846918, -0.002016862, 1.48442, 0, 0, 0, 1, 1,
0.485393, -0.05900467, 2.535919, 0, 0, 0, 1, 1,
0.4881282, 0.710632, -0.9402101, 0, 0, 0, 1, 1,
0.4898109, -0.9281862, 2.757052, 0, 0, 0, 1, 1,
0.4917972, -0.4769594, 2.350643, 1, 1, 1, 1, 1,
0.4950375, 0.6474237, 0.9552664, 1, 1, 1, 1, 1,
0.4955685, 1.278967, 1.184158, 1, 1, 1, 1, 1,
0.497571, 1.804466, 1.021317, 1, 1, 1, 1, 1,
0.4991468, -1.488904, 2.211928, 1, 1, 1, 1, 1,
0.4996341, 0.5261255, 1.679832, 1, 1, 1, 1, 1,
0.5008093, -0.5344231, 2.566316, 1, 1, 1, 1, 1,
0.502489, 1.034813, -0.6384911, 1, 1, 1, 1, 1,
0.514838, 1.181908, -0.6611175, 1, 1, 1, 1, 1,
0.5189303, -0.62393, 2.696499, 1, 1, 1, 1, 1,
0.5312403, -1.146946, 4.380711, 1, 1, 1, 1, 1,
0.5348361, 0.3638728, 1.120306, 1, 1, 1, 1, 1,
0.5355354, -1.879803, 2.815985, 1, 1, 1, 1, 1,
0.5384673, -1.130218, 2.019375, 1, 1, 1, 1, 1,
0.5409582, -1.317291, 1.737554, 1, 1, 1, 1, 1,
0.5423416, 1.427506, 1.05592, 0, 0, 1, 1, 1,
0.5469117, 0.37477, -0.3697866, 1, 0, 0, 1, 1,
0.5471677, 0.1886175, 0.4557318, 1, 0, 0, 1, 1,
0.5489037, -1.259009, 3.94215, 1, 0, 0, 1, 1,
0.5495017, 0.1274706, 0.6429765, 1, 0, 0, 1, 1,
0.5499386, -0.7810673, 2.936563, 1, 0, 0, 1, 1,
0.5536069, -0.5174175, 1.349998, 0, 0, 0, 1, 1,
0.554961, 0.5286599, 4.023714, 0, 0, 0, 1, 1,
0.5553001, 0.4007789, 1.798402, 0, 0, 0, 1, 1,
0.5607712, -0.006671977, 1.072649, 0, 0, 0, 1, 1,
0.5611188, -0.433167, 1.957825, 0, 0, 0, 1, 1,
0.5620114, -0.748146, 3.99147, 0, 0, 0, 1, 1,
0.5640894, -1.468901, 3.053209, 0, 0, 0, 1, 1,
0.566958, 0.3680896, 1.156887, 1, 1, 1, 1, 1,
0.5716324, -0.5300174, 2.116069, 1, 1, 1, 1, 1,
0.5720661, 0.1218953, -0.2218687, 1, 1, 1, 1, 1,
0.5726084, 0.8469738, 1.100625, 1, 1, 1, 1, 1,
0.581248, -1.148369, 2.473135, 1, 1, 1, 1, 1,
0.5814947, 0.5845564, 0.8011414, 1, 1, 1, 1, 1,
0.5887608, 0.7070512, 0.3741281, 1, 1, 1, 1, 1,
0.5957341, 0.1672671, 1.58802, 1, 1, 1, 1, 1,
0.5984881, 0.5292577, 1.910122, 1, 1, 1, 1, 1,
0.5985816, -1.197307, 2.399623, 1, 1, 1, 1, 1,
0.6002019, -1.591055, 4.532981, 1, 1, 1, 1, 1,
0.6017496, -0.872451, 3.660813, 1, 1, 1, 1, 1,
0.6104286, -1.169633, 4.095198, 1, 1, 1, 1, 1,
0.6165966, 1.828746, 1.343499, 1, 1, 1, 1, 1,
0.6233442, 0.9379581, -0.3510007, 1, 1, 1, 1, 1,
0.6239671, -0.3397117, 2.068959, 0, 0, 1, 1, 1,
0.6282738, -0.5035138, 2.878827, 1, 0, 0, 1, 1,
0.6283219, 0.06879392, 3.428572, 1, 0, 0, 1, 1,
0.6285772, -1.420781, 3.818696, 1, 0, 0, 1, 1,
0.6286319, -0.3216291, 2.328939, 1, 0, 0, 1, 1,
0.63255, -0.7267987, 1.768711, 1, 0, 0, 1, 1,
0.634222, -0.221155, 1.224181, 0, 0, 0, 1, 1,
0.6384688, -0.8100968, 3.297158, 0, 0, 0, 1, 1,
0.6385723, -0.4634839, 3.567671, 0, 0, 0, 1, 1,
0.6399854, 1.443232, 0.233365, 0, 0, 0, 1, 1,
0.6403931, -0.4321448, 0.9453259, 0, 0, 0, 1, 1,
0.6484742, -1.361654, 1.396022, 0, 0, 0, 1, 1,
0.6486359, 0.373932, 1.929698, 0, 0, 0, 1, 1,
0.6513404, 0.3127879, 2.040262, 1, 1, 1, 1, 1,
0.6522377, 0.01673357, 2.308189, 1, 1, 1, 1, 1,
0.6534095, -0.08018614, 1.025707, 1, 1, 1, 1, 1,
0.6562414, 0.09166373, 1.797495, 1, 1, 1, 1, 1,
0.6580169, 0.4379093, 0.2826539, 1, 1, 1, 1, 1,
0.6580757, -0.8436064, 2.135583, 1, 1, 1, 1, 1,
0.6596014, -0.2114398, 1.951452, 1, 1, 1, 1, 1,
0.6627325, -0.9427556, 1.449373, 1, 1, 1, 1, 1,
0.6674086, -1.608251, 3.477833, 1, 1, 1, 1, 1,
0.6689588, -0.9484645, 1.772105, 1, 1, 1, 1, 1,
0.6691534, 1.275139, 0.7893388, 1, 1, 1, 1, 1,
0.6756022, -0.5548778, 4.341126, 1, 1, 1, 1, 1,
0.6768555, 0.4497444, 0.5862544, 1, 1, 1, 1, 1,
0.6787524, -0.07619981, 1.091226, 1, 1, 1, 1, 1,
0.6855723, 0.2465063, 0.6489453, 1, 1, 1, 1, 1,
0.6907153, 0.5815138, 1.213446, 0, 0, 1, 1, 1,
0.6950969, -0.3732601, 1.723698, 1, 0, 0, 1, 1,
0.7032474, -0.6562685, -0.1222638, 1, 0, 0, 1, 1,
0.7041602, -0.0004567088, 1.464325, 1, 0, 0, 1, 1,
0.7062029, -2.141526, 3.405639, 1, 0, 0, 1, 1,
0.709442, 0.1820722, 0.7098205, 1, 0, 0, 1, 1,
0.7097635, 0.93448, 0.4195736, 0, 0, 0, 1, 1,
0.7176676, -1.88762, 2.811803, 0, 0, 0, 1, 1,
0.7182512, -1.260728, 3.087848, 0, 0, 0, 1, 1,
0.7184269, 0.9765714, -0.9495764, 0, 0, 0, 1, 1,
0.7262307, -1.417547, 3.148743, 0, 0, 0, 1, 1,
0.7301319, -0.03529612, 2.633915, 0, 0, 0, 1, 1,
0.7308184, -0.3894446, 3.619997, 0, 0, 0, 1, 1,
0.7348084, -0.9535674, 3.329348, 1, 1, 1, 1, 1,
0.738462, -1.724611, 2.792315, 1, 1, 1, 1, 1,
0.7414247, 1.278039, 1.420281, 1, 1, 1, 1, 1,
0.7528665, 0.3401272, 2.044304, 1, 1, 1, 1, 1,
0.7530292, 0.06325768, 1.429554, 1, 1, 1, 1, 1,
0.7567602, -0.5898644, 1.107032, 1, 1, 1, 1, 1,
0.760269, -0.3593851, 3.318037, 1, 1, 1, 1, 1,
0.7622377, -1.033239, 3.474923, 1, 1, 1, 1, 1,
0.7670931, 0.2052198, 1.23436, 1, 1, 1, 1, 1,
0.7692563, 1.090732, -0.5048777, 1, 1, 1, 1, 1,
0.7692873, -0.06933127, -0.0802567, 1, 1, 1, 1, 1,
0.7719873, 0.2244827, 2.509063, 1, 1, 1, 1, 1,
0.7721199, 0.4732364, 0.603793, 1, 1, 1, 1, 1,
0.791083, -0.3205193, 3.014115, 1, 1, 1, 1, 1,
0.8118348, -0.7780351, 1.766626, 1, 1, 1, 1, 1,
0.8120423, 2.282334, 0.451445, 0, 0, 1, 1, 1,
0.818563, -0.4230447, 1.37969, 1, 0, 0, 1, 1,
0.8340502, 1.079521, 0.7397079, 1, 0, 0, 1, 1,
0.839443, -1.047981, 1.229045, 1, 0, 0, 1, 1,
0.8496966, 0.5864591, 0.4690974, 1, 0, 0, 1, 1,
0.8600127, 0.2765191, 0.5828876, 1, 0, 0, 1, 1,
0.8715717, -0.2771053, 0.9384329, 0, 0, 0, 1, 1,
0.8726213, 0.03631469, 0.5067714, 0, 0, 0, 1, 1,
0.8759914, 0.8032234, 0.2964056, 0, 0, 0, 1, 1,
0.8769549, -0.7567005, 1.74694, 0, 0, 0, 1, 1,
0.8788613, 0.08776752, 0.2298333, 0, 0, 0, 1, 1,
0.8824993, 0.9209353, 0.5298698, 0, 0, 0, 1, 1,
0.8831266, -0.5396279, 2.545839, 0, 0, 0, 1, 1,
0.8876558, 0.231599, 2.130897, 1, 1, 1, 1, 1,
0.8907684, 0.2775111, 0.7532977, 1, 1, 1, 1, 1,
0.8933815, -0.57165, 2.218514, 1, 1, 1, 1, 1,
0.8946823, 0.440074, 2.460205, 1, 1, 1, 1, 1,
0.8982336, -1.452301, 4.910914, 1, 1, 1, 1, 1,
0.9003239, 0.940625, 1.646433, 1, 1, 1, 1, 1,
0.9010291, -0.4253012, 2.811363, 1, 1, 1, 1, 1,
0.9083872, -0.3595291, 1.459755, 1, 1, 1, 1, 1,
0.9158262, 1.398156, 1.202885, 1, 1, 1, 1, 1,
0.917345, 0.2903404, -0.01792567, 1, 1, 1, 1, 1,
0.9193645, -0.0216224, -0.5544641, 1, 1, 1, 1, 1,
0.928135, -0.8237979, 3.190544, 1, 1, 1, 1, 1,
0.931401, -0.2700067, 0.7073147, 1, 1, 1, 1, 1,
0.9326748, -1.507761, 4.596025, 1, 1, 1, 1, 1,
0.9381554, 0.05719182, 1.742687, 1, 1, 1, 1, 1,
0.9386452, 0.4551729, 2.414446, 0, 0, 1, 1, 1,
0.9399101, 0.6991759, 2.231211, 1, 0, 0, 1, 1,
0.9449157, -0.7554153, 3.324875, 1, 0, 0, 1, 1,
0.9449884, -0.484601, 0.9879686, 1, 0, 0, 1, 1,
0.9463852, -0.9358947, 2.468151, 1, 0, 0, 1, 1,
0.9520684, -0.3666925, -0.04483222, 1, 0, 0, 1, 1,
0.9639088, 1.245757, -0.1402776, 0, 0, 0, 1, 1,
0.9675193, -1.180712, 1.76682, 0, 0, 0, 1, 1,
0.9747054, -1.002725, 2.417436, 0, 0, 0, 1, 1,
0.9770018, 2.820936, 1.479755, 0, 0, 0, 1, 1,
0.9877235, -0.7717947, 3.025387, 0, 0, 0, 1, 1,
0.9957743, 0.5976076, -0.6396866, 0, 0, 0, 1, 1,
1.003972, -0.07831118, 2.885674, 0, 0, 0, 1, 1,
1.005269, 0.8606505, -0.609459, 1, 1, 1, 1, 1,
1.008226, 0.07943197, 1.902867, 1, 1, 1, 1, 1,
1.015411, 1.548844, 0.9929015, 1, 1, 1, 1, 1,
1.015998, 1.865625, -0.4877208, 1, 1, 1, 1, 1,
1.022242, 0.08354016, 2.910169, 1, 1, 1, 1, 1,
1.025861, 0.2190989, -0.1295598, 1, 1, 1, 1, 1,
1.033196, -1.366483, 4.033022, 1, 1, 1, 1, 1,
1.033264, 1.108432, 1.55649, 1, 1, 1, 1, 1,
1.034067, 1.157162, 1.159138, 1, 1, 1, 1, 1,
1.035691, -0.1321348, 1.791242, 1, 1, 1, 1, 1,
1.044626, -1.053853, 2.387793, 1, 1, 1, 1, 1,
1.047334, 2.490907, 1.485999, 1, 1, 1, 1, 1,
1.053688, -0.7790372, 3.959947, 1, 1, 1, 1, 1,
1.056484, 1.467722, 0.5634778, 1, 1, 1, 1, 1,
1.056595, -0.08652119, 0.9240103, 1, 1, 1, 1, 1,
1.056749, 0.5074286, 0.8125573, 0, 0, 1, 1, 1,
1.059117, -0.04187528, -0.6027769, 1, 0, 0, 1, 1,
1.071982, 0.1156142, 0.8174756, 1, 0, 0, 1, 1,
1.073171, 1.41357, -0.7549874, 1, 0, 0, 1, 1,
1.07319, -0.7816998, 2.75445, 1, 0, 0, 1, 1,
1.076431, -2.387292, 2.455676, 1, 0, 0, 1, 1,
1.079716, 0.4114724, 1.444169, 0, 0, 0, 1, 1,
1.090045, -0.5278059, 2.518196, 0, 0, 0, 1, 1,
1.101962, 0.5590898, 1.14419, 0, 0, 0, 1, 1,
1.110268, 1.03334, 0.6774333, 0, 0, 0, 1, 1,
1.122185, -0.8004881, 0.9165193, 0, 0, 0, 1, 1,
1.126731, -0.975076, 2.577935, 0, 0, 0, 1, 1,
1.139936, 1.198292, 1.290638, 0, 0, 0, 1, 1,
1.149119, -0.064206, 1.259587, 1, 1, 1, 1, 1,
1.158329, -0.07187472, 0.7195681, 1, 1, 1, 1, 1,
1.159395, 0.2121964, 3.284528, 1, 1, 1, 1, 1,
1.162351, -0.8110093, 1.775864, 1, 1, 1, 1, 1,
1.164154, 1.12354, -0.2375745, 1, 1, 1, 1, 1,
1.167559, -0.8656313, 1.694622, 1, 1, 1, 1, 1,
1.173628, 0.4240001, 1.460181, 1, 1, 1, 1, 1,
1.183962, 1.269288, 0.260039, 1, 1, 1, 1, 1,
1.188214, -0.6866798, 2.967219, 1, 1, 1, 1, 1,
1.192051, -0.2518133, 0.7572476, 1, 1, 1, 1, 1,
1.198083, 0.3153776, 0.4989612, 1, 1, 1, 1, 1,
1.205696, -0.1311854, 1.566301, 1, 1, 1, 1, 1,
1.207783, -0.7212985, 0.4346362, 1, 1, 1, 1, 1,
1.211765, -0.8268789, 2.795285, 1, 1, 1, 1, 1,
1.213018, -1.987269, 2.012456, 1, 1, 1, 1, 1,
1.237056, -0.5474772, 2.79562, 0, 0, 1, 1, 1,
1.255892, 0.840663, 1.401459, 1, 0, 0, 1, 1,
1.267481, -0.01757722, 0.7052833, 1, 0, 0, 1, 1,
1.280051, -0.9490505, 1.572832, 1, 0, 0, 1, 1,
1.287779, 0.05194671, 1.085915, 1, 0, 0, 1, 1,
1.292582, 0.07880196, 1.574047, 1, 0, 0, 1, 1,
1.303281, -0.06635847, 1.696346, 0, 0, 0, 1, 1,
1.305742, 0.4688384, 0.3717581, 0, 0, 0, 1, 1,
1.312601, 0.2929066, -0.5379283, 0, 0, 0, 1, 1,
1.321827, 0.7384654, 2.474109, 0, 0, 0, 1, 1,
1.353773, 0.6629782, -0.5884865, 0, 0, 0, 1, 1,
1.365142, 0.2152014, 0.9262216, 0, 0, 0, 1, 1,
1.365917, -0.122877, 3.061578, 0, 0, 0, 1, 1,
1.371484, 0.6080633, 1.636424, 1, 1, 1, 1, 1,
1.372708, 1.344658, 0.520191, 1, 1, 1, 1, 1,
1.379577, 0.1900148, -1.046231, 1, 1, 1, 1, 1,
1.388383, 0.2160146, 1.722614, 1, 1, 1, 1, 1,
1.403414, -0.9579731, 0.820281, 1, 1, 1, 1, 1,
1.411457, -1.071782, 1.8882, 1, 1, 1, 1, 1,
1.418478, 1.237127, 1.345176, 1, 1, 1, 1, 1,
1.419055, -0.3280226, 0.9471514, 1, 1, 1, 1, 1,
1.426811, -1.074033, 1.213282, 1, 1, 1, 1, 1,
1.439429, 0.591907, -0.5440919, 1, 1, 1, 1, 1,
1.444649, -1.066101, 3.642621, 1, 1, 1, 1, 1,
1.444778, 1.567475, 0.8174447, 1, 1, 1, 1, 1,
1.449353, -0.5578642, 2.707506, 1, 1, 1, 1, 1,
1.452761, -0.4301079, 2.361239, 1, 1, 1, 1, 1,
1.455279, -2.334911, 3.059216, 1, 1, 1, 1, 1,
1.462175, 2.656094, 0.01306938, 0, 0, 1, 1, 1,
1.475548, 0.6065314, 1.110281, 1, 0, 0, 1, 1,
1.477996, 1.322555, 1.584061, 1, 0, 0, 1, 1,
1.489511, 0.7220637, -0.01460145, 1, 0, 0, 1, 1,
1.510252, -1.628543, 3.752974, 1, 0, 0, 1, 1,
1.530198, -0.05260375, 1.936052, 1, 0, 0, 1, 1,
1.532119, 0.7339467, 1.924892, 0, 0, 0, 1, 1,
1.537201, 0.8724012, 1.257397, 0, 0, 0, 1, 1,
1.540277, 1.853614, 1.927842, 0, 0, 0, 1, 1,
1.54582, 0.3009738, 1.469905, 0, 0, 0, 1, 1,
1.547473, 0.08610968, 0.7743192, 0, 0, 0, 1, 1,
1.551735, 1.327325, 1.017983, 0, 0, 0, 1, 1,
1.559746, 0.7285557, -0.1278896, 0, 0, 0, 1, 1,
1.561292, 1.049155, 1.020716, 1, 1, 1, 1, 1,
1.589305, -1.754362, 2.002323, 1, 1, 1, 1, 1,
1.59989, 0.7766817, 1.835218, 1, 1, 1, 1, 1,
1.61397, 0.1655391, 1.560756, 1, 1, 1, 1, 1,
1.615465, -0.01168629, -0.1219646, 1, 1, 1, 1, 1,
1.631649, -1.433892, 3.00022, 1, 1, 1, 1, 1,
1.663999, 0.04473935, 2.047237, 1, 1, 1, 1, 1,
1.680035, -0.8585233, 0.9832908, 1, 1, 1, 1, 1,
1.696607, -0.7612034, 0.8013253, 1, 1, 1, 1, 1,
1.697566, -0.753686, 2.721005, 1, 1, 1, 1, 1,
1.698199, -0.6116495, 1.973625, 1, 1, 1, 1, 1,
1.713264, 0.9589417, -0.02896733, 1, 1, 1, 1, 1,
1.718658, 0.01673706, 1.517079, 1, 1, 1, 1, 1,
1.725305, 0.7439168, 2.650792, 1, 1, 1, 1, 1,
1.741746, -0.310339, 2.630638, 1, 1, 1, 1, 1,
1.74802, -1.096508, 2.452813, 0, 0, 1, 1, 1,
1.765781, -1.657003, 2.750288, 1, 0, 0, 1, 1,
1.775002, -0.8212314, 1.486707, 1, 0, 0, 1, 1,
1.779386, -0.2449871, 2.090998, 1, 0, 0, 1, 1,
1.787192, -1.149303, 2.614351, 1, 0, 0, 1, 1,
1.78936, -1.154314, 1.910114, 1, 0, 0, 1, 1,
1.800818, -0.01218536, 1.656269, 0, 0, 0, 1, 1,
1.807059, 0.1071806, 1.946568, 0, 0, 0, 1, 1,
1.824981, -1.290334, 2.729409, 0, 0, 0, 1, 1,
1.83555, -1.035504, 2.64545, 0, 0, 0, 1, 1,
1.83997, -1.700216, 0.8758013, 0, 0, 0, 1, 1,
1.846055, -0.4374099, 4.142962, 0, 0, 0, 1, 1,
1.848138, 0.8257087, 2.1261, 0, 0, 0, 1, 1,
1.871415, -0.349984, 4.560612, 1, 1, 1, 1, 1,
1.884971, 1.655175, 2.879322, 1, 1, 1, 1, 1,
1.888743, 1.037122, 1.066569, 1, 1, 1, 1, 1,
1.896435, -1.259211, 1.744912, 1, 1, 1, 1, 1,
1.912937, 0.008555907, 0.5364052, 1, 1, 1, 1, 1,
1.920714, -0.1436569, 1.710556, 1, 1, 1, 1, 1,
1.931751, -1.957092, 1.951524, 1, 1, 1, 1, 1,
1.973193, 1.796841, 0.9966938, 1, 1, 1, 1, 1,
1.982161, -0.3354699, 2.650416, 1, 1, 1, 1, 1,
1.985107, 0.1633108, 1.455265, 1, 1, 1, 1, 1,
1.998899, -0.5326065, 2.661314, 1, 1, 1, 1, 1,
2.009172, -0.6739946, 1.757292, 1, 1, 1, 1, 1,
2.060021, 1.359889, 0.3665263, 1, 1, 1, 1, 1,
2.076629, 1.751874, -0.2446962, 1, 1, 1, 1, 1,
2.128894, -1.319049, 3.721023, 1, 1, 1, 1, 1,
2.132587, 1.100691, 3.268132, 0, 0, 1, 1, 1,
2.140354, 0.9797418, 2.062456, 1, 0, 0, 1, 1,
2.146385, -0.1578079, 1.879447, 1, 0, 0, 1, 1,
2.150498, -1.41076, 2.153838, 1, 0, 0, 1, 1,
2.187521, -0.2484034, 0.4028049, 1, 0, 0, 1, 1,
2.25954, 0.01038316, 1.791735, 1, 0, 0, 1, 1,
2.306398, 0.9479315, 0.5857552, 0, 0, 0, 1, 1,
2.308429, 0.3774464, 1.474816, 0, 0, 0, 1, 1,
2.357718, -0.5520679, 2.569216, 0, 0, 0, 1, 1,
2.414747, 0.03835201, 1.483218, 0, 0, 0, 1, 1,
2.441774, -1.533745, 1.969507, 0, 0, 0, 1, 1,
2.484734, 1.730768, 0.2870506, 0, 0, 0, 1, 1,
2.490448, -0.8008606, 3.197131, 0, 0, 0, 1, 1,
2.557634, -0.2136751, 1.149493, 1, 1, 1, 1, 1,
2.625183, -1.468454, -0.6999244, 1, 1, 1, 1, 1,
2.651362, 0.6521404, 1.929709, 1, 1, 1, 1, 1,
2.683957, 0.6393838, 1.417295, 1, 1, 1, 1, 1,
2.716064, 0.4372509, 2.976364, 1, 1, 1, 1, 1,
2.837299, 2.084062, 1.34489, 1, 1, 1, 1, 1,
3.260839, -0.2056746, 1.107915, 1, 1, 1, 1, 1
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
var radius = 9.550627;
var distance = 33.54617;
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
mvMatrix.translate( 0.03507972, 0.1059594, 0.2477138 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.54617);
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
