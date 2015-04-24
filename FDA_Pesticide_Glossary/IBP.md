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
-3.908575, -1.219181, -2.635271, 1, 0, 0, 1,
-3.198402, 1.489641, 0.913406, 1, 0.007843138, 0, 1,
-3.152014, -0.997355, -2.6689, 1, 0.01176471, 0, 1,
-2.917602, 0.108669, -2.537267, 1, 0.01960784, 0, 1,
-2.803038, -0.3775375, -2.450443, 1, 0.02352941, 0, 1,
-2.786474, -0.5028209, -0.1261324, 1, 0.03137255, 0, 1,
-2.784981, 0.1476172, -1.60311, 1, 0.03529412, 0, 1,
-2.744675, 0.5061979, -2.744249, 1, 0.04313726, 0, 1,
-2.635924, 0.3739083, -2.086615, 1, 0.04705882, 0, 1,
-2.55876, 0.9050888, -1.846296, 1, 0.05490196, 0, 1,
-2.542285, 1.240671, -0.3415747, 1, 0.05882353, 0, 1,
-2.513975, 1.29962, -1.023932, 1, 0.06666667, 0, 1,
-2.441747, -1.66265, -2.883753, 1, 0.07058824, 0, 1,
-2.422664, -1.257388, -0.7524547, 1, 0.07843138, 0, 1,
-2.368161, 0.1225308, -0.112134, 1, 0.08235294, 0, 1,
-2.358829, 0.9330167, -1.59259, 1, 0.09019608, 0, 1,
-2.275476, -0.4817608, -2.029187, 1, 0.09411765, 0, 1,
-2.253811, 0.2872191, -1.598127, 1, 0.1019608, 0, 1,
-2.22985, 0.1927149, -0.4793592, 1, 0.1098039, 0, 1,
-2.216934, -1.686205, -1.924188, 1, 0.1137255, 0, 1,
-2.164632, 0.2946407, -1.361749, 1, 0.1215686, 0, 1,
-2.133195, -0.1050393, -3.087728, 1, 0.1254902, 0, 1,
-2.128091, -0.2813397, -1.483247, 1, 0.1333333, 0, 1,
-2.121322, 1.451645, -1.025638, 1, 0.1372549, 0, 1,
-2.114687, 0.5856428, -1.541963, 1, 0.145098, 0, 1,
-2.106032, 0.0624713, -1.672469, 1, 0.1490196, 0, 1,
-2.082347, -0.925118, -1.784037, 1, 0.1568628, 0, 1,
-2.016585, -0.3360929, -2.876422, 1, 0.1607843, 0, 1,
-2.009367, -0.03938818, -2.010848, 1, 0.1686275, 0, 1,
-2.000889, 1.059819, 0.2963064, 1, 0.172549, 0, 1,
-1.967646, -2.035873, -1.304487, 1, 0.1803922, 0, 1,
-1.948975, -0.4081243, -0.9394152, 1, 0.1843137, 0, 1,
-1.948009, -1.010577, -2.834746, 1, 0.1921569, 0, 1,
-1.939618, -0.8333526, -3.011565, 1, 0.1960784, 0, 1,
-1.878254, -1.202247, -3.634295, 1, 0.2039216, 0, 1,
-1.840506, 1.254845, 0.06327564, 1, 0.2117647, 0, 1,
-1.813573, -1.73781, -2.919168, 1, 0.2156863, 0, 1,
-1.793346, 0.8668509, -0.8213115, 1, 0.2235294, 0, 1,
-1.763389, 1.565939, -0.1997258, 1, 0.227451, 0, 1,
-1.737949, -0.2313141, 0.7290186, 1, 0.2352941, 0, 1,
-1.736407, 0.56541, -1.75701, 1, 0.2392157, 0, 1,
-1.733788, 0.8350422, -0.8721033, 1, 0.2470588, 0, 1,
-1.718405, -1.30243, -2.207468, 1, 0.2509804, 0, 1,
-1.712775, -0.4816752, -1.75252, 1, 0.2588235, 0, 1,
-1.711089, -0.6453218, -1.278482, 1, 0.2627451, 0, 1,
-1.709542, 1.389708, 0.001645808, 1, 0.2705882, 0, 1,
-1.701038, -0.8743232, -1.838295, 1, 0.2745098, 0, 1,
-1.690741, -0.1793116, -1.704203, 1, 0.282353, 0, 1,
-1.685554, 2.17194, -0.3364288, 1, 0.2862745, 0, 1,
-1.68214, 2.578227, 0.05838447, 1, 0.2941177, 0, 1,
-1.67365, -0.5678976, -3.081831, 1, 0.3019608, 0, 1,
-1.672641, 1.294643, -1.261431, 1, 0.3058824, 0, 1,
-1.654774, 0.524186, -1.869563, 1, 0.3137255, 0, 1,
-1.653776, 0.5138478, -0.5573402, 1, 0.3176471, 0, 1,
-1.652867, -0.6627032, -3.205044, 1, 0.3254902, 0, 1,
-1.650701, 1.589127, -2.51571, 1, 0.3294118, 0, 1,
-1.63845, 0.4514437, -3.838566, 1, 0.3372549, 0, 1,
-1.611448, 0.6265527, -1.727054, 1, 0.3411765, 0, 1,
-1.575889, -1.414611, -0.4199824, 1, 0.3490196, 0, 1,
-1.542835, 0.8169354, -0.9705577, 1, 0.3529412, 0, 1,
-1.529496, -0.7047395, -0.923052, 1, 0.3607843, 0, 1,
-1.523173, -0.1877622, -0.203427, 1, 0.3647059, 0, 1,
-1.514473, -1.308978, -0.8800619, 1, 0.372549, 0, 1,
-1.51014, 1.150377, -1.883404, 1, 0.3764706, 0, 1,
-1.509809, 0.7800629, -0.8319542, 1, 0.3843137, 0, 1,
-1.508684, -0.1542857, -2.54622, 1, 0.3882353, 0, 1,
-1.506057, -0.007340171, -0.6521032, 1, 0.3960784, 0, 1,
-1.504037, -0.1995492, -2.43225, 1, 0.4039216, 0, 1,
-1.499577, -0.5032834, -2.537601, 1, 0.4078431, 0, 1,
-1.488389, -1.022673, -2.560654, 1, 0.4156863, 0, 1,
-1.473063, -1.032822, -1.89916, 1, 0.4196078, 0, 1,
-1.469012, -0.2052219, -2.079103, 1, 0.427451, 0, 1,
-1.46406, 0.5940063, -2.451628, 1, 0.4313726, 0, 1,
-1.463715, 0.3752548, -1.43114, 1, 0.4392157, 0, 1,
-1.442139, -2.200904, -3.405505, 1, 0.4431373, 0, 1,
-1.43713, -0.04479692, -2.52931, 1, 0.4509804, 0, 1,
-1.420767, -1.021706, -2.322776, 1, 0.454902, 0, 1,
-1.411415, 1.162648, -1.579368, 1, 0.4627451, 0, 1,
-1.407725, 1.396588, -0.1734426, 1, 0.4666667, 0, 1,
-1.406807, -0.06974346, -1.75721, 1, 0.4745098, 0, 1,
-1.403991, -0.9922427, -1.429162, 1, 0.4784314, 0, 1,
-1.40138, 0.4672269, -0.5001783, 1, 0.4862745, 0, 1,
-1.396152, 1.5967, 0.8465211, 1, 0.4901961, 0, 1,
-1.378257, -0.1190534, -0.1420524, 1, 0.4980392, 0, 1,
-1.361074, -0.8468274, -1.647995, 1, 0.5058824, 0, 1,
-1.359584, -0.5386293, -0.2556034, 1, 0.509804, 0, 1,
-1.356162, -2.522599, -2.640071, 1, 0.5176471, 0, 1,
-1.339594, -0.7608573, -1.609614, 1, 0.5215687, 0, 1,
-1.336065, -0.6336348, -1.500442, 1, 0.5294118, 0, 1,
-1.335755, 0.5901718, -1.781219, 1, 0.5333334, 0, 1,
-1.333149, 1.342705, -1.033937, 1, 0.5411765, 0, 1,
-1.330345, -0.4975249, -3.040647, 1, 0.5450981, 0, 1,
-1.305827, -0.9386382, -1.815061, 1, 0.5529412, 0, 1,
-1.289106, -0.6509106, -1.253906, 1, 0.5568628, 0, 1,
-1.280413, -0.3571611, -3.741324, 1, 0.5647059, 0, 1,
-1.270244, 0.2876784, -0.3774018, 1, 0.5686275, 0, 1,
-1.266882, -0.1912535, -0.3898123, 1, 0.5764706, 0, 1,
-1.262066, 0.3320088, 0.001588003, 1, 0.5803922, 0, 1,
-1.261829, -0.4736285, -1.309024, 1, 0.5882353, 0, 1,
-1.26162, 0.2259942, -0.7252609, 1, 0.5921569, 0, 1,
-1.254141, 0.6248021, -1.450849, 1, 0.6, 0, 1,
-1.252822, -0.6482521, -2.653218, 1, 0.6078432, 0, 1,
-1.250938, 1.528373, -0.9983014, 1, 0.6117647, 0, 1,
-1.244834, 0.8471332, -0.1949826, 1, 0.6196079, 0, 1,
-1.236629, -0.4577915, -1.514292, 1, 0.6235294, 0, 1,
-1.235543, -0.4752809, -2.57316, 1, 0.6313726, 0, 1,
-1.228935, -0.7288386, -0.1005338, 1, 0.6352941, 0, 1,
-1.225962, -0.7442808, -4.058118, 1, 0.6431373, 0, 1,
-1.222727, 0.224043, -2.435023, 1, 0.6470588, 0, 1,
-1.208279, -0.0485055, -1.820254, 1, 0.654902, 0, 1,
-1.200089, -0.2727879, -1.595788, 1, 0.6588235, 0, 1,
-1.197744, -0.1003071, -0.6309534, 1, 0.6666667, 0, 1,
-1.18287, 1.003672, -0.8556242, 1, 0.6705883, 0, 1,
-1.159191, -1.835885, -2.698082, 1, 0.6784314, 0, 1,
-1.150178, 1.710647, -0.7612595, 1, 0.682353, 0, 1,
-1.135983, -0.8636287, -2.63362, 1, 0.6901961, 0, 1,
-1.128924, -2.119114, -2.531605, 1, 0.6941177, 0, 1,
-1.128559, -1.054759, 0.05842508, 1, 0.7019608, 0, 1,
-1.125045, -0.6265469, -2.061326, 1, 0.7098039, 0, 1,
-1.124592, 0.4156022, -1.585661, 1, 0.7137255, 0, 1,
-1.122787, 2.233746, 1.121091, 1, 0.7215686, 0, 1,
-1.122376, 0.4947214, -0.8173079, 1, 0.7254902, 0, 1,
-1.12023, -0.06884323, -1.369531, 1, 0.7333333, 0, 1,
-1.107229, 0.14495, -1.804721, 1, 0.7372549, 0, 1,
-1.100577, 0.7070594, -0.5317574, 1, 0.7450981, 0, 1,
-1.098803, -0.9700021, -1.523869, 1, 0.7490196, 0, 1,
-1.098093, 0.5105069, -1.370974, 1, 0.7568628, 0, 1,
-1.097027, -0.9282503, -2.037403, 1, 0.7607843, 0, 1,
-1.095529, -0.5445099, -0.1842175, 1, 0.7686275, 0, 1,
-1.093501, 0.2525194, -0.7533762, 1, 0.772549, 0, 1,
-1.093233, 0.9654095, -0.403971, 1, 0.7803922, 0, 1,
-1.092796, 0.853797, -1.110098, 1, 0.7843137, 0, 1,
-1.090649, 0.5982978, -1.794583, 1, 0.7921569, 0, 1,
-1.087732, 0.1261149, 0.08357419, 1, 0.7960784, 0, 1,
-1.086671, -0.07819305, -1.720816, 1, 0.8039216, 0, 1,
-1.077847, 1.024108, -2.128907, 1, 0.8117647, 0, 1,
-1.073043, -0.1136464, -1.352471, 1, 0.8156863, 0, 1,
-1.070345, 0.375686, -0.8039506, 1, 0.8235294, 0, 1,
-1.064139, -0.4386686, -1.175489, 1, 0.827451, 0, 1,
-1.060088, -0.8094448, -3.970749, 1, 0.8352941, 0, 1,
-1.058819, -0.1491184, -2.61433, 1, 0.8392157, 0, 1,
-1.053164, 0.5585138, -1.741404, 1, 0.8470588, 0, 1,
-1.050731, -0.3618736, -2.732743, 1, 0.8509804, 0, 1,
-1.04473, -0.4653458, -2.353691, 1, 0.8588235, 0, 1,
-1.039714, 0.2397848, -1.271749, 1, 0.8627451, 0, 1,
-1.039636, 1.292424, -2.043104, 1, 0.8705882, 0, 1,
-1.034424, -1.644204, -1.899025, 1, 0.8745098, 0, 1,
-1.031452, -0.2600529, -2.128478, 1, 0.8823529, 0, 1,
-1.027754, 1.678191, -0.6442568, 1, 0.8862745, 0, 1,
-1.014732, -0.375379, -1.669658, 1, 0.8941177, 0, 1,
-1.012968, -0.3039706, -1.58449, 1, 0.8980392, 0, 1,
-1.011579, 0.7044994, -1.344498, 1, 0.9058824, 0, 1,
-1.007742, 0.6060662, -0.9175056, 1, 0.9137255, 0, 1,
-1.003896, 0.5152407, 0.3498717, 1, 0.9176471, 0, 1,
-1.003071, -0.7076542, -4.478738, 1, 0.9254902, 0, 1,
-1.000204, 0.7131501, 1.598115, 1, 0.9294118, 0, 1,
-0.9968624, 0.3794035, -0.4312185, 1, 0.9372549, 0, 1,
-0.9953669, 0.941685, -0.5761804, 1, 0.9411765, 0, 1,
-0.9930082, -1.47523, -2.528423, 1, 0.9490196, 0, 1,
-0.9880183, 0.6124241, 0.2613561, 1, 0.9529412, 0, 1,
-0.9739077, 1.383263, 0.4639753, 1, 0.9607843, 0, 1,
-0.972061, -0.7674656, -4.121916, 1, 0.9647059, 0, 1,
-0.9717479, -1.008783, -2.386056, 1, 0.972549, 0, 1,
-0.9697084, -0.3110029, -1.915305, 1, 0.9764706, 0, 1,
-0.9673518, 1.332793, -0.9895999, 1, 0.9843137, 0, 1,
-0.9638116, -0.42625, -1.553208, 1, 0.9882353, 0, 1,
-0.9608799, -1.072777, -2.810986, 1, 0.9960784, 0, 1,
-0.9549121, 1.521645, -0.5119614, 0.9960784, 1, 0, 1,
-0.9542452, -0.07453287, -1.145918, 0.9921569, 1, 0, 1,
-0.9535222, 0.5901654, -0.2202433, 0.9843137, 1, 0, 1,
-0.9524536, 0.9418412, -2.574155, 0.9803922, 1, 0, 1,
-0.9505926, -0.6621468, -2.806532, 0.972549, 1, 0, 1,
-0.9463307, 0.3151013, -0.2461584, 0.9686275, 1, 0, 1,
-0.9443803, 0.2440189, 0.8565195, 0.9607843, 1, 0, 1,
-0.939905, -0.2899895, -1.89756, 0.9568627, 1, 0, 1,
-0.9344776, 0.3120039, -0.5366948, 0.9490196, 1, 0, 1,
-0.9342106, 0.3698982, -1.98679, 0.945098, 1, 0, 1,
-0.9272904, -0.2473592, -0.04420426, 0.9372549, 1, 0, 1,
-0.9266536, -0.4133461, -2.894838, 0.9333333, 1, 0, 1,
-0.9238189, 0.1502172, -0.7841282, 0.9254902, 1, 0, 1,
-0.917487, 0.3616416, -1.659509, 0.9215686, 1, 0, 1,
-0.9168065, -0.4229955, -0.7777292, 0.9137255, 1, 0, 1,
-0.915141, 1.012544, -2.062725, 0.9098039, 1, 0, 1,
-0.9151354, 1.115031, -1.525556, 0.9019608, 1, 0, 1,
-0.9127777, -0.8241149, -1.572255, 0.8941177, 1, 0, 1,
-0.9116955, 0.2502746, -2.715357, 0.8901961, 1, 0, 1,
-0.907598, -0.1356887, -0.6548631, 0.8823529, 1, 0, 1,
-0.9051331, -0.3587826, -1.824032, 0.8784314, 1, 0, 1,
-0.903477, -1.426028, -3.557442, 0.8705882, 1, 0, 1,
-0.9016721, 1.769261, 0.2616446, 0.8666667, 1, 0, 1,
-0.8979048, -1.365984, -2.045656, 0.8588235, 1, 0, 1,
-0.8963654, -0.01108371, -2.313873, 0.854902, 1, 0, 1,
-0.8862086, 2.335483, 1.740872, 0.8470588, 1, 0, 1,
-0.8852583, 1.885071, 0.9588383, 0.8431373, 1, 0, 1,
-0.8843426, 0.3739735, -2.213743, 0.8352941, 1, 0, 1,
-0.8760418, 1.014201, -1.65571, 0.8313726, 1, 0, 1,
-0.8693069, -1.602202, -2.568819, 0.8235294, 1, 0, 1,
-0.869185, -0.9797095, -1.504495, 0.8196079, 1, 0, 1,
-0.8669545, -1.498817, -3.091236, 0.8117647, 1, 0, 1,
-0.8655747, -0.9890742, -1.763401, 0.8078431, 1, 0, 1,
-0.8569334, 1.506395, -1.913852, 0.8, 1, 0, 1,
-0.8522641, -0.3611121, -2.084823, 0.7921569, 1, 0, 1,
-0.8486398, 0.4057789, -0.712791, 0.7882353, 1, 0, 1,
-0.8432117, 0.8277523, -1.073074, 0.7803922, 1, 0, 1,
-0.8413247, 0.2737997, -1.474257, 0.7764706, 1, 0, 1,
-0.8395187, 0.1363366, -2.879457, 0.7686275, 1, 0, 1,
-0.8364487, -0.09292334, -0.9155432, 0.7647059, 1, 0, 1,
-0.8355759, -0.7442987, -2.677999, 0.7568628, 1, 0, 1,
-0.8308893, -0.0895111, -2.248792, 0.7529412, 1, 0, 1,
-0.8308045, 0.6527118, 0.190587, 0.7450981, 1, 0, 1,
-0.8301138, -1.456644, -2.454806, 0.7411765, 1, 0, 1,
-0.8294528, -0.1715815, -3.172354, 0.7333333, 1, 0, 1,
-0.823001, 0.2893857, -0.3169052, 0.7294118, 1, 0, 1,
-0.8171957, -0.4846921, -1.644649, 0.7215686, 1, 0, 1,
-0.814706, 1.438219, -0.5218822, 0.7176471, 1, 0, 1,
-0.8122947, 2.115248, -1.28266, 0.7098039, 1, 0, 1,
-0.8117184, -2.568574, -4.185091, 0.7058824, 1, 0, 1,
-0.8092139, 1.251382, -0.4028481, 0.6980392, 1, 0, 1,
-0.8065015, 1.254513, -1.18301, 0.6901961, 1, 0, 1,
-0.8041025, 0.9119979, -0.5413903, 0.6862745, 1, 0, 1,
-0.8034348, 0.6883343, -2.141749, 0.6784314, 1, 0, 1,
-0.8031504, -0.297155, -0.975948, 0.6745098, 1, 0, 1,
-0.7951821, 0.1833361, 0.03965821, 0.6666667, 1, 0, 1,
-0.7946643, 1.342807, -0.3784899, 0.6627451, 1, 0, 1,
-0.7919492, -0.5445679, -3.134456, 0.654902, 1, 0, 1,
-0.7893757, 0.9158792, -0.3182689, 0.6509804, 1, 0, 1,
-0.788255, 1.126435, 0.03377952, 0.6431373, 1, 0, 1,
-0.7877746, 0.9675397, -0.7118862, 0.6392157, 1, 0, 1,
-0.7834763, 0.1413955, -2.992951, 0.6313726, 1, 0, 1,
-0.7803668, 0.02904338, -0.5210949, 0.627451, 1, 0, 1,
-0.7801877, 0.6925619, -1.227482, 0.6196079, 1, 0, 1,
-0.7703956, 1.239477, -0.1109351, 0.6156863, 1, 0, 1,
-0.7702395, -0.05507294, -3.546849, 0.6078432, 1, 0, 1,
-0.768745, -1.386818, -1.634785, 0.6039216, 1, 0, 1,
-0.7599669, 0.5008758, -1.45331, 0.5960785, 1, 0, 1,
-0.7560307, -1.031054, -4.365365, 0.5882353, 1, 0, 1,
-0.7506928, -0.76898, -1.832655, 0.5843138, 1, 0, 1,
-0.740791, 0.001672528, 1.496538, 0.5764706, 1, 0, 1,
-0.7405986, 0.2135184, -2.75029, 0.572549, 1, 0, 1,
-0.7330337, -1.385438, -2.488646, 0.5647059, 1, 0, 1,
-0.7312573, 1.225115, -0.7355032, 0.5607843, 1, 0, 1,
-0.7294071, -0.5845738, -2.635916, 0.5529412, 1, 0, 1,
-0.7287225, 1.050109, 0.8792542, 0.5490196, 1, 0, 1,
-0.7226475, -0.4501482, -2.784944, 0.5411765, 1, 0, 1,
-0.7197729, -1.272248, -3.625304, 0.5372549, 1, 0, 1,
-0.7150618, -1.444095, -1.684448, 0.5294118, 1, 0, 1,
-0.7140614, -3.778873, -3.721821, 0.5254902, 1, 0, 1,
-0.7127168, -0.1931452, -1.328971, 0.5176471, 1, 0, 1,
-0.7058225, 0.2320564, 0.7866348, 0.5137255, 1, 0, 1,
-0.7039887, -1.064132, -2.741663, 0.5058824, 1, 0, 1,
-0.7028899, 2.146185, 1.449121, 0.5019608, 1, 0, 1,
-0.701219, 0.1660155, -0.1288784, 0.4941176, 1, 0, 1,
-0.6990171, 0.9107339, 0.4971916, 0.4862745, 1, 0, 1,
-0.6941645, 0.9208379, 0.293633, 0.4823529, 1, 0, 1,
-0.6860927, 0.3334208, -0.3792809, 0.4745098, 1, 0, 1,
-0.6858739, -0.539645, -1.775212, 0.4705882, 1, 0, 1,
-0.675245, -0.4588215, -1.165636, 0.4627451, 1, 0, 1,
-0.6715173, -0.4767029, -3.062519, 0.4588235, 1, 0, 1,
-0.6694643, 1.785928, -0.7108963, 0.4509804, 1, 0, 1,
-0.6690714, 0.2832288, -0.6166092, 0.4470588, 1, 0, 1,
-0.663815, -2.074209, -0.3237442, 0.4392157, 1, 0, 1,
-0.6564644, 0.7865595, -0.274985, 0.4352941, 1, 0, 1,
-0.6453832, 1.184628, 0.001418676, 0.427451, 1, 0, 1,
-0.6440991, -0.8164496, -2.304993, 0.4235294, 1, 0, 1,
-0.6436585, -0.5360377, -0.8197302, 0.4156863, 1, 0, 1,
-0.6390731, -1.836792, -2.213716, 0.4117647, 1, 0, 1,
-0.6357011, -1.084599, -3.166051, 0.4039216, 1, 0, 1,
-0.6316351, -0.4281796, -1.461015, 0.3960784, 1, 0, 1,
-0.6309066, -1.305614, -3.533152, 0.3921569, 1, 0, 1,
-0.630716, 1.293221, -0.7583935, 0.3843137, 1, 0, 1,
-0.6304168, -0.1500643, -1.699124, 0.3803922, 1, 0, 1,
-0.6254605, -0.5608315, -2.900543, 0.372549, 1, 0, 1,
-0.6254209, -0.561208, -3.035372, 0.3686275, 1, 0, 1,
-0.6231648, -0.08241165, -2.141263, 0.3607843, 1, 0, 1,
-0.6139591, 0.3796616, -1.27571, 0.3568628, 1, 0, 1,
-0.6084771, -0.4454996, -3.175339, 0.3490196, 1, 0, 1,
-0.604339, 0.4200764, -2.137363, 0.345098, 1, 0, 1,
-0.6026211, 0.4561033, -3.030742, 0.3372549, 1, 0, 1,
-0.6008639, 0.5297042, -0.5999492, 0.3333333, 1, 0, 1,
-0.5996944, -0.6086047, -3.014611, 0.3254902, 1, 0, 1,
-0.5981063, 0.9337536, -1.606547, 0.3215686, 1, 0, 1,
-0.5976409, 0.5275659, 0.3578594, 0.3137255, 1, 0, 1,
-0.5972252, -1.865528, -1.276075, 0.3098039, 1, 0, 1,
-0.5944219, -0.9550311, -4.290968, 0.3019608, 1, 0, 1,
-0.5935959, -1.740152, -4.070475, 0.2941177, 1, 0, 1,
-0.5929971, 1.106539, -0.1437886, 0.2901961, 1, 0, 1,
-0.5859293, 0.0005517764, -1.370343, 0.282353, 1, 0, 1,
-0.5849277, 2.632143, 1.581003, 0.2784314, 1, 0, 1,
-0.5835863, -0.620033, -2.901313, 0.2705882, 1, 0, 1,
-0.5820166, 0.2725675, -3.28088, 0.2666667, 1, 0, 1,
-0.580567, 0.7425125, 1.325247, 0.2588235, 1, 0, 1,
-0.5747547, 0.67344, -0.1075832, 0.254902, 1, 0, 1,
-0.5742412, -2.581163, -1.721642, 0.2470588, 1, 0, 1,
-0.5657062, -0.9220778, -2.192868, 0.2431373, 1, 0, 1,
-0.565345, 0.7779487, 0.3419153, 0.2352941, 1, 0, 1,
-0.563747, -0.833387, -1.707345, 0.2313726, 1, 0, 1,
-0.556933, 0.4991357, -0.8890756, 0.2235294, 1, 0, 1,
-0.5558776, -1.358819, -2.283488, 0.2196078, 1, 0, 1,
-0.5540497, 1.315155, -0.4607809, 0.2117647, 1, 0, 1,
-0.5528242, 0.4240625, -0.8004944, 0.2078431, 1, 0, 1,
-0.5493341, 0.6509384, -0.5435611, 0.2, 1, 0, 1,
-0.5415503, 1.839995, 1.221334, 0.1921569, 1, 0, 1,
-0.5407203, -0.7907883, -2.773403, 0.1882353, 1, 0, 1,
-0.5373415, 0.9100567, 0.6636704, 0.1803922, 1, 0, 1,
-0.5366787, 0.2066088, -0.906235, 0.1764706, 1, 0, 1,
-0.5297092, 1.997293, -0.6170219, 0.1686275, 1, 0, 1,
-0.5280941, 0.9305004, -0.2309124, 0.1647059, 1, 0, 1,
-0.5246891, 0.9425133, -0.8910573, 0.1568628, 1, 0, 1,
-0.5199115, -0.08586085, -3.038821, 0.1529412, 1, 0, 1,
-0.5103383, 1.804937, -1.129694, 0.145098, 1, 0, 1,
-0.5075465, -0.9258597, -2.621651, 0.1411765, 1, 0, 1,
-0.5070211, -1.060946, -3.336467, 0.1333333, 1, 0, 1,
-0.5052071, 0.9857256, -2.697992, 0.1294118, 1, 0, 1,
-0.4975248, 0.5678037, 0.2405731, 0.1215686, 1, 0, 1,
-0.48923, 0.2529291, -0.6783695, 0.1176471, 1, 0, 1,
-0.4883304, -0.5756899, -3.506857, 0.1098039, 1, 0, 1,
-0.4760635, 0.6060961, -1.305679, 0.1058824, 1, 0, 1,
-0.4758651, -0.9354121, -1.476442, 0.09803922, 1, 0, 1,
-0.4735019, 0.532758, -1.154925, 0.09019608, 1, 0, 1,
-0.4731846, 2.39362, 1.14598, 0.08627451, 1, 0, 1,
-0.4703924, -0.1430322, -0.2956781, 0.07843138, 1, 0, 1,
-0.4695083, 1.154039, -1.130373, 0.07450981, 1, 0, 1,
-0.4681995, 0.1865861, -2.318809, 0.06666667, 1, 0, 1,
-0.4656246, 0.6244068, -2.07814, 0.0627451, 1, 0, 1,
-0.463845, -0.5828037, -1.568738, 0.05490196, 1, 0, 1,
-0.4626532, 0.7818099, -0.5389788, 0.05098039, 1, 0, 1,
-0.4609277, 0.8319827, 0.3993959, 0.04313726, 1, 0, 1,
-0.4570162, 1.284463, 0.972306, 0.03921569, 1, 0, 1,
-0.4548927, -0.05283744, 0.6854854, 0.03137255, 1, 0, 1,
-0.4535046, 0.04992883, -3.454653, 0.02745098, 1, 0, 1,
-0.4474171, 0.7444583, -1.085485, 0.01960784, 1, 0, 1,
-0.4467527, 0.3616945, -1.267804, 0.01568628, 1, 0, 1,
-0.4457892, 1.048367, 0.8022513, 0.007843138, 1, 0, 1,
-0.4325114, -1.219256, -3.702822, 0.003921569, 1, 0, 1,
-0.4252444, -0.3543101, -2.235391, 0, 1, 0.003921569, 1,
-0.4219497, 0.3131781, -0.6373305, 0, 1, 0.01176471, 1,
-0.4170178, -0.3984303, -1.691901, 0, 1, 0.01568628, 1,
-0.4156439, 0.0430508, -0.5164145, 0, 1, 0.02352941, 1,
-0.4107341, 0.5128788, -1.315416, 0, 1, 0.02745098, 1,
-0.4106458, 0.2581578, -0.591404, 0, 1, 0.03529412, 1,
-0.4102805, 0.1966187, -0.7399941, 0, 1, 0.03921569, 1,
-0.4078591, 0.4042844, -2.12681, 0, 1, 0.04705882, 1,
-0.4076755, -0.1213334, 0.1052797, 0, 1, 0.05098039, 1,
-0.4054036, -0.08384632, -4.000486, 0, 1, 0.05882353, 1,
-0.4035769, -0.9938754, -3.283188, 0, 1, 0.0627451, 1,
-0.4006559, -0.9443573, -3.045173, 0, 1, 0.07058824, 1,
-0.4001998, -1.359223, -3.577488, 0, 1, 0.07450981, 1,
-0.3990068, 0.5092846, 0.7458727, 0, 1, 0.08235294, 1,
-0.3982874, -0.1687416, -0.8454403, 0, 1, 0.08627451, 1,
-0.390164, -0.5327834, -2.080293, 0, 1, 0.09411765, 1,
-0.3845271, -0.7914272, -1.891353, 0, 1, 0.1019608, 1,
-0.3821455, 1.101511, -0.8403269, 0, 1, 0.1058824, 1,
-0.3779827, 0.4435166, -1.947967, 0, 1, 0.1137255, 1,
-0.3753555, -0.4194897, -2.339227, 0, 1, 0.1176471, 1,
-0.3730724, -0.07479822, -1.703123, 0, 1, 0.1254902, 1,
-0.3686701, -0.2669889, -1.513021, 0, 1, 0.1294118, 1,
-0.3683073, 0.5970781, -1.016097, 0, 1, 0.1372549, 1,
-0.3665559, 0.3391986, -0.8858926, 0, 1, 0.1411765, 1,
-0.3633101, -0.590172, -1.889522, 0, 1, 0.1490196, 1,
-0.3602599, 0.229701, -2.181975, 0, 1, 0.1529412, 1,
-0.3570074, -0.2803832, -1.7383, 0, 1, 0.1607843, 1,
-0.3555609, -0.1828624, -1.9043, 0, 1, 0.1647059, 1,
-0.3508908, 0.322593, -0.1749821, 0, 1, 0.172549, 1,
-0.3501182, 0.7909681, -2.490856, 0, 1, 0.1764706, 1,
-0.3480642, -1.424463, -0.83344, 0, 1, 0.1843137, 1,
-0.3474769, 0.3326031, -0.2987929, 0, 1, 0.1882353, 1,
-0.3440285, -1.22028, -3.94739, 0, 1, 0.1960784, 1,
-0.3438067, 0.2298395, -3.120387, 0, 1, 0.2039216, 1,
-0.3426564, 0.4735738, -0.1440881, 0, 1, 0.2078431, 1,
-0.3409395, -0.8270682, -2.851877, 0, 1, 0.2156863, 1,
-0.3403535, -0.9868062, -1.107046, 0, 1, 0.2196078, 1,
-0.3399989, 0.1644064, -3.185883, 0, 1, 0.227451, 1,
-0.3364129, -0.1760724, -2.867514, 0, 1, 0.2313726, 1,
-0.3360908, -0.4921215, -3.797247, 0, 1, 0.2392157, 1,
-0.3335135, -1.194857, -3.662257, 0, 1, 0.2431373, 1,
-0.3330591, 0.2874061, -1.615378, 0, 1, 0.2509804, 1,
-0.3240832, 0.4057663, -1.930363, 0, 1, 0.254902, 1,
-0.319538, -0.4954783, -2.422835, 0, 1, 0.2627451, 1,
-0.3181548, 0.7819782, -3.309025, 0, 1, 0.2666667, 1,
-0.316869, 0.6801345, 0.6052086, 0, 1, 0.2745098, 1,
-0.3148223, -0.1454505, -2.069648, 0, 1, 0.2784314, 1,
-0.3138199, -0.5350404, -4.738807, 0, 1, 0.2862745, 1,
-0.3131661, 2.335516, -1.112656, 0, 1, 0.2901961, 1,
-0.3115894, 0.3271196, -1.715518, 0, 1, 0.2980392, 1,
-0.311241, 1.230608, -2.076342, 0, 1, 0.3058824, 1,
-0.3083919, 1.245924, -0.4156518, 0, 1, 0.3098039, 1,
-0.3046703, -1.083971, -3.52708, 0, 1, 0.3176471, 1,
-0.3030239, 1.074585, 0.2514851, 0, 1, 0.3215686, 1,
-0.2989177, 0.3119811, -0.1047619, 0, 1, 0.3294118, 1,
-0.2973664, 0.5563431, -0.1475359, 0, 1, 0.3333333, 1,
-0.297281, -0.110315, -4.071673, 0, 1, 0.3411765, 1,
-0.2951142, 0.2775212, -0.7346635, 0, 1, 0.345098, 1,
-0.2906763, -1.055825, -2.203929, 0, 1, 0.3529412, 1,
-0.2890348, 1.374556, -0.9806566, 0, 1, 0.3568628, 1,
-0.2876939, -0.3894566, -3.402452, 0, 1, 0.3647059, 1,
-0.2826277, 0.3465118, 0.4627401, 0, 1, 0.3686275, 1,
-0.2818714, 0.256189, -0.1408793, 0, 1, 0.3764706, 1,
-0.2817848, -0.898187, -1.766993, 0, 1, 0.3803922, 1,
-0.281611, 0.0282771, -1.831964, 0, 1, 0.3882353, 1,
-0.2785645, -1.435366, -2.689366, 0, 1, 0.3921569, 1,
-0.276807, -0.1322115, -3.262963, 0, 1, 0.4, 1,
-0.2753415, -0.6246181, -3.875783, 0, 1, 0.4078431, 1,
-0.2742828, 1.529063, -0.9555372, 0, 1, 0.4117647, 1,
-0.2728451, 1.004049, -1.758872, 0, 1, 0.4196078, 1,
-0.2727986, -0.2177759, -1.265909, 0, 1, 0.4235294, 1,
-0.2687, 2.181644, -0.8149823, 0, 1, 0.4313726, 1,
-0.2642987, -0.1781678, -1.971559, 0, 1, 0.4352941, 1,
-0.2641526, 0.3640047, -2.586676, 0, 1, 0.4431373, 1,
-0.2640512, -1.108146, -0.9342797, 0, 1, 0.4470588, 1,
-0.2625903, -0.3326088, -2.789963, 0, 1, 0.454902, 1,
-0.2567113, -0.8198796, -3.12519, 0, 1, 0.4588235, 1,
-0.2553069, -2.044469, -2.719463, 0, 1, 0.4666667, 1,
-0.2542427, 0.06162015, -2.494673, 0, 1, 0.4705882, 1,
-0.2517517, -0.5024539, -3.782464, 0, 1, 0.4784314, 1,
-0.2428824, -0.7212108, -3.063279, 0, 1, 0.4823529, 1,
-0.2423198, -0.5042408, -3.35228, 0, 1, 0.4901961, 1,
-0.2371251, -0.1455634, -2.985774, 0, 1, 0.4941176, 1,
-0.2354094, 0.6663132, 2.129407, 0, 1, 0.5019608, 1,
-0.231998, 1.610773, -0.08194164, 0, 1, 0.509804, 1,
-0.2239214, -0.6825195, -3.198524, 0, 1, 0.5137255, 1,
-0.2185008, 1.112594, -0.5631334, 0, 1, 0.5215687, 1,
-0.2156587, -0.1849456, -3.547589, 0, 1, 0.5254902, 1,
-0.2153392, -0.2915006, -3.235649, 0, 1, 0.5333334, 1,
-0.210549, -0.7141747, -4.622615, 0, 1, 0.5372549, 1,
-0.2101813, -0.6652797, -1.510693, 0, 1, 0.5450981, 1,
-0.208253, 0.1804948, -1.063761, 0, 1, 0.5490196, 1,
-0.2024434, -0.7338144, -1.089535, 0, 1, 0.5568628, 1,
-0.2017644, -2.361434, -3.015912, 0, 1, 0.5607843, 1,
-0.1944931, -1.597464, -3.151375, 0, 1, 0.5686275, 1,
-0.1941413, -0.3896241, -1.469177, 0, 1, 0.572549, 1,
-0.1932441, -0.3515644, -2.302564, 0, 1, 0.5803922, 1,
-0.1915764, 0.1808469, -0.3873786, 0, 1, 0.5843138, 1,
-0.1911296, -0.2941848, -4.450333, 0, 1, 0.5921569, 1,
-0.1880444, 0.6748186, 0.4863727, 0, 1, 0.5960785, 1,
-0.1877213, -0.8855177, -3.329424, 0, 1, 0.6039216, 1,
-0.1858983, 0.5292628, 0.7332838, 0, 1, 0.6117647, 1,
-0.1858336, 0.4999839, 0.8099449, 0, 1, 0.6156863, 1,
-0.1823276, 1.177693, 1.545621, 0, 1, 0.6235294, 1,
-0.181006, 0.01304383, -1.740818, 0, 1, 0.627451, 1,
-0.1803054, 0.4110823, -0.6833725, 0, 1, 0.6352941, 1,
-0.1792164, 0.02654717, -1.209327, 0, 1, 0.6392157, 1,
-0.1772097, -0.06764793, -3.835553, 0, 1, 0.6470588, 1,
-0.1741865, 0.9830215, -0.9256666, 0, 1, 0.6509804, 1,
-0.1717447, -1.108119, -3.985865, 0, 1, 0.6588235, 1,
-0.1702243, 0.504048, -0.8550841, 0, 1, 0.6627451, 1,
-0.1668341, 0.3649944, -1.309079, 0, 1, 0.6705883, 1,
-0.1653191, 2.431439, 0.9300887, 0, 1, 0.6745098, 1,
-0.1611159, 1.173583, -1.338529, 0, 1, 0.682353, 1,
-0.156978, -0.7898357, -4.396939, 0, 1, 0.6862745, 1,
-0.1546416, -0.7109371, -3.670259, 0, 1, 0.6941177, 1,
-0.1516532, 0.828533, 0.0737243, 0, 1, 0.7019608, 1,
-0.1493713, 0.05329913, -0.1953974, 0, 1, 0.7058824, 1,
-0.1463681, 1.983112, -1.852514, 0, 1, 0.7137255, 1,
-0.143342, 0.4067506, -0.04421796, 0, 1, 0.7176471, 1,
-0.1324945, -0.4413178, -2.419388, 0, 1, 0.7254902, 1,
-0.1316708, -1.956884, -3.003354, 0, 1, 0.7294118, 1,
-0.125364, -1.713845, -0.8730671, 0, 1, 0.7372549, 1,
-0.1210597, -0.9221241, -3.321119, 0, 1, 0.7411765, 1,
-0.1201024, 0.6324444, -0.2054665, 0, 1, 0.7490196, 1,
-0.1200353, 0.6085216, -1.609514, 0, 1, 0.7529412, 1,
-0.1072789, -0.2138522, -1.73669, 0, 1, 0.7607843, 1,
-0.1047206, 1.847035, -2.091453, 0, 1, 0.7647059, 1,
-0.1031837, -0.06825043, -2.848119, 0, 1, 0.772549, 1,
-0.1019409, 0.3751334, -1.389679, 0, 1, 0.7764706, 1,
-0.1005014, -0.4119371, -2.711711, 0, 1, 0.7843137, 1,
-0.09839201, -0.934197, -1.046636, 0, 1, 0.7882353, 1,
-0.09552556, 0.5154805, -1.342577, 0, 1, 0.7960784, 1,
-0.09140461, -0.5996891, -4.555012, 0, 1, 0.8039216, 1,
-0.09129211, 1.32534, 0.6387984, 0, 1, 0.8078431, 1,
-0.09070896, 0.6048959, 0.1218182, 0, 1, 0.8156863, 1,
-0.09036911, 0.8813563, -1.003056, 0, 1, 0.8196079, 1,
-0.09032407, 1.388562, -0.2767166, 0, 1, 0.827451, 1,
-0.08976301, 0.4928928, -2.19337, 0, 1, 0.8313726, 1,
-0.08721929, -0.1202343, -1.4497, 0, 1, 0.8392157, 1,
-0.07951801, 2.193864, 0.1328681, 0, 1, 0.8431373, 1,
-0.07900113, -1.46623, -4.184363, 0, 1, 0.8509804, 1,
-0.07596072, -1.464686, -1.712306, 0, 1, 0.854902, 1,
-0.07554005, -1.769045, -2.128601, 0, 1, 0.8627451, 1,
-0.06776818, 0.5472925, -0.4717948, 0, 1, 0.8666667, 1,
-0.06766479, -1.074952, -2.333101, 0, 1, 0.8745098, 1,
-0.05151348, -0.4181128, -2.550832, 0, 1, 0.8784314, 1,
-0.0490348, -0.7005126, -3.235103, 0, 1, 0.8862745, 1,
-0.03698724, 1.081022, -0.6377987, 0, 1, 0.8901961, 1,
-0.03678775, -0.6303309, -2.825974, 0, 1, 0.8980392, 1,
-0.03480192, -1.0838, -3.182031, 0, 1, 0.9058824, 1,
-0.03446231, 0.431166, -0.8665275, 0, 1, 0.9098039, 1,
-0.03279619, -0.4726684, -3.344673, 0, 1, 0.9176471, 1,
-0.03006257, -0.721919, -2.277421, 0, 1, 0.9215686, 1,
-0.02640819, 0.09325722, -1.313362, 0, 1, 0.9294118, 1,
-0.0240702, 1.727159, -1.123627, 0, 1, 0.9333333, 1,
-0.0235098, -0.2349603, -2.216488, 0, 1, 0.9411765, 1,
-0.009821679, 0.6502534, 0.04971185, 0, 1, 0.945098, 1,
-0.008359778, -0.6063981, -3.879168, 0, 1, 0.9529412, 1,
-0.004521246, -1.072309, -2.952367, 0, 1, 0.9568627, 1,
-0.002169807, -0.3526732, -3.205498, 0, 1, 0.9647059, 1,
0.004447533, -2.606173, 3.268935, 0, 1, 0.9686275, 1,
0.007023696, -0.9485481, 2.915557, 0, 1, 0.9764706, 1,
0.007094117, -0.3351718, 2.922872, 0, 1, 0.9803922, 1,
0.008594676, -1.026697, 3.039007, 0, 1, 0.9882353, 1,
0.009822966, -0.349864, 3.02046, 0, 1, 0.9921569, 1,
0.01062524, 0.3788902, 1.171308, 0, 1, 1, 1,
0.01313845, -1.784497, 3.865025, 0, 0.9921569, 1, 1,
0.01462713, 0.5543164, 2.246814, 0, 0.9882353, 1, 1,
0.01925833, 0.1144481, 0.1625014, 0, 0.9803922, 1, 1,
0.02191306, 0.2379238, -1.121019, 0, 0.9764706, 1, 1,
0.02258225, 0.9313102, 0.7417076, 0, 0.9686275, 1, 1,
0.02531763, 0.05729765, -0.9772955, 0, 0.9647059, 1, 1,
0.02630653, 0.3642573, 0.3540899, 0, 0.9568627, 1, 1,
0.03165141, 1.731004, 0.289685, 0, 0.9529412, 1, 1,
0.03270538, -0.8888873, 4.516804, 0, 0.945098, 1, 1,
0.03501277, -1.391298, 3.028145, 0, 0.9411765, 1, 1,
0.03983003, -0.9652913, 3.68721, 0, 0.9333333, 1, 1,
0.04431915, -1.944518, 4.733222, 0, 0.9294118, 1, 1,
0.0489843, 0.6655284, 2.560702, 0, 0.9215686, 1, 1,
0.05408285, 0.356211, -0.801111, 0, 0.9176471, 1, 1,
0.05649877, 1.116589, -0.4876371, 0, 0.9098039, 1, 1,
0.0574819, -0.3869676, 3.341381, 0, 0.9058824, 1, 1,
0.06487754, 0.1764594, 0.2468179, 0, 0.8980392, 1, 1,
0.06766035, 0.01039333, -0.08356977, 0, 0.8901961, 1, 1,
0.07000093, -1.749748, 3.529698, 0, 0.8862745, 1, 1,
0.07028735, 0.3171884, 1.704554, 0, 0.8784314, 1, 1,
0.07751196, 0.4277366, 0.2634851, 0, 0.8745098, 1, 1,
0.07812241, 0.251275, 0.6166723, 0, 0.8666667, 1, 1,
0.07962386, -0.4735934, 4.025594, 0, 0.8627451, 1, 1,
0.07986189, 0.3808757, 0.2556689, 0, 0.854902, 1, 1,
0.08164734, -0.6030563, 1.499176, 0, 0.8509804, 1, 1,
0.08213566, 0.6396101, 1.143205, 0, 0.8431373, 1, 1,
0.0834071, 1.211454, -0.6336594, 0, 0.8392157, 1, 1,
0.08484552, 0.2561598, 0.55734, 0, 0.8313726, 1, 1,
0.0853413, -1.820614, 5.396736, 0, 0.827451, 1, 1,
0.08621654, -0.2145196, 6.093855, 0, 0.8196079, 1, 1,
0.08754995, -0.1112803, 2.62148, 0, 0.8156863, 1, 1,
0.08769269, -1.13503, 2.65649, 0, 0.8078431, 1, 1,
0.09440781, 0.221771, 2.264261, 0, 0.8039216, 1, 1,
0.1005709, 0.7480878, 1.349755, 0, 0.7960784, 1, 1,
0.1037293, -0.7178097, 2.974938, 0, 0.7882353, 1, 1,
0.1074377, -1.435531, 2.889985, 0, 0.7843137, 1, 1,
0.1115205, 0.685536, -0.3733879, 0, 0.7764706, 1, 1,
0.1121874, -1.303199, 2.289021, 0, 0.772549, 1, 1,
0.1158767, -0.05868379, 1.399087, 0, 0.7647059, 1, 1,
0.1180651, 0.307507, -0.1615373, 0, 0.7607843, 1, 1,
0.1185859, 0.6185043, 1.079623, 0, 0.7529412, 1, 1,
0.118985, -1.474219, 3.70365, 0, 0.7490196, 1, 1,
0.1220556, -0.4257193, 3.135099, 0, 0.7411765, 1, 1,
0.1227262, 0.8297848, 1.974419, 0, 0.7372549, 1, 1,
0.1231239, -0.8837278, 2.818743, 0, 0.7294118, 1, 1,
0.1262108, -0.7354361, 1.752085, 0, 0.7254902, 1, 1,
0.1324361, 0.4374692, -1.75215, 0, 0.7176471, 1, 1,
0.1333677, 2.080199, 0.01206032, 0, 0.7137255, 1, 1,
0.1352333, -0.4429634, 2.902371, 0, 0.7058824, 1, 1,
0.1358046, 0.3019665, 0.4387564, 0, 0.6980392, 1, 1,
0.1398735, -0.2861909, 1.266183, 0, 0.6941177, 1, 1,
0.1482574, -0.3498477, 3.253124, 0, 0.6862745, 1, 1,
0.1499347, 0.1079312, 0.9152684, 0, 0.682353, 1, 1,
0.1507674, 1.182341, 2.249026, 0, 0.6745098, 1, 1,
0.1523371, 1.063438, 0.9415195, 0, 0.6705883, 1, 1,
0.1532074, 1.129367, 1.246767, 0, 0.6627451, 1, 1,
0.1552589, -0.8010636, 3.468249, 0, 0.6588235, 1, 1,
0.1577325, 2.44088, 0.685421, 0, 0.6509804, 1, 1,
0.1586094, -1.553741, 2.712823, 0, 0.6470588, 1, 1,
0.1622805, 1.402629, -0.2616928, 0, 0.6392157, 1, 1,
0.1669315, 0.09366433, 0.07932597, 0, 0.6352941, 1, 1,
0.1681836, 0.3425227, -0.4324071, 0, 0.627451, 1, 1,
0.1690497, -2.019721, 5.216766, 0, 0.6235294, 1, 1,
0.1693348, 1.379471, 1.070973, 0, 0.6156863, 1, 1,
0.1696436, 0.02461882, 3.553811, 0, 0.6117647, 1, 1,
0.171022, -1.03519, 1.85466, 0, 0.6039216, 1, 1,
0.1715879, 0.6400607, 1.395874, 0, 0.5960785, 1, 1,
0.174104, -0.7949051, 3.131444, 0, 0.5921569, 1, 1,
0.1767272, 1.217021, -0.3674576, 0, 0.5843138, 1, 1,
0.1805524, 1.687921, 2.254653, 0, 0.5803922, 1, 1,
0.1861814, -0.9502636, 4.295238, 0, 0.572549, 1, 1,
0.189463, 0.310967, 0.6340422, 0, 0.5686275, 1, 1,
0.1918826, -0.008804605, 2.046482, 0, 0.5607843, 1, 1,
0.1926205, 0.6973345, 0.732411, 0, 0.5568628, 1, 1,
0.1963752, 1.320336, -1.034062, 0, 0.5490196, 1, 1,
0.1969332, -1.207948, 2.703076, 0, 0.5450981, 1, 1,
0.1983184, -0.4014234, -0.0537048, 0, 0.5372549, 1, 1,
0.1996367, 0.6161062, 1.209384, 0, 0.5333334, 1, 1,
0.200336, -1.867784, 1.811072, 0, 0.5254902, 1, 1,
0.2011867, -0.3665317, 2.329976, 0, 0.5215687, 1, 1,
0.2038872, -0.8209398, 2.708682, 0, 0.5137255, 1, 1,
0.2060742, 0.7224583, -1.367884, 0, 0.509804, 1, 1,
0.2093963, 2.7621, -0.9076881, 0, 0.5019608, 1, 1,
0.210014, -0.05059, 1.343107, 0, 0.4941176, 1, 1,
0.2115713, -0.006718998, 0.2487733, 0, 0.4901961, 1, 1,
0.2151373, -0.804318, 3.918187, 0, 0.4823529, 1, 1,
0.2166584, -1.421281, 4.002327, 0, 0.4784314, 1, 1,
0.2193047, -0.9310099, 2.493558, 0, 0.4705882, 1, 1,
0.2202072, 1.070363, 3.353034, 0, 0.4666667, 1, 1,
0.2232826, 1.295531, 0.4192775, 0, 0.4588235, 1, 1,
0.2245577, -1.874386, 2.184611, 0, 0.454902, 1, 1,
0.2272347, -1.05178, 6.379404, 0, 0.4470588, 1, 1,
0.2290259, -0.4541482, 2.368978, 0, 0.4431373, 1, 1,
0.2329501, -0.3916121, 3.931802, 0, 0.4352941, 1, 1,
0.2383042, -0.930335, 3.314373, 0, 0.4313726, 1, 1,
0.2438551, -0.3956279, 2.051836, 0, 0.4235294, 1, 1,
0.2439097, 0.08104124, 2.023898, 0, 0.4196078, 1, 1,
0.2443837, -0.09284995, 3.32526, 0, 0.4117647, 1, 1,
0.2503703, -0.4302788, 3.155641, 0, 0.4078431, 1, 1,
0.2509214, 1.562398, -0.1280071, 0, 0.4, 1, 1,
0.254384, -1.270904, 3.569798, 0, 0.3921569, 1, 1,
0.2556329, 0.4852777, 2.25715, 0, 0.3882353, 1, 1,
0.258287, -0.110609, 3.090701, 0, 0.3803922, 1, 1,
0.2595683, 0.7443656, 0.5440152, 0, 0.3764706, 1, 1,
0.2650212, 0.2743048, 1.555535, 0, 0.3686275, 1, 1,
0.2738981, 0.8515514, -0.1695395, 0, 0.3647059, 1, 1,
0.2756156, 1.569439, -0.01946411, 0, 0.3568628, 1, 1,
0.2802134, 0.3766081, 0.8317959, 0, 0.3529412, 1, 1,
0.2901137, 1.582481, -0.9460247, 0, 0.345098, 1, 1,
0.301221, -0.4890288, 2.893402, 0, 0.3411765, 1, 1,
0.3018641, -0.5378307, 2.83822, 0, 0.3333333, 1, 1,
0.3061048, 1.393971, 1.608474, 0, 0.3294118, 1, 1,
0.3066171, 1.620826, 0.5191959, 0, 0.3215686, 1, 1,
0.3087213, -1.644714, 1.889814, 0, 0.3176471, 1, 1,
0.3092488, -0.3673691, 1.989858, 0, 0.3098039, 1, 1,
0.310704, -0.4581122, 2.728551, 0, 0.3058824, 1, 1,
0.3108367, -0.8195078, 3.236556, 0, 0.2980392, 1, 1,
0.3132353, 0.8721352, 0.2548989, 0, 0.2901961, 1, 1,
0.3137127, 1.196333, -0.1246805, 0, 0.2862745, 1, 1,
0.3156867, 0.1739762, 0.5438378, 0, 0.2784314, 1, 1,
0.3160331, 1.309837, 1.685655, 0, 0.2745098, 1, 1,
0.320611, -2.726748, 3.719339, 0, 0.2666667, 1, 1,
0.3241445, 1.835649, 0.1299588, 0, 0.2627451, 1, 1,
0.3249717, 0.4249389, 1.48571, 0, 0.254902, 1, 1,
0.3253605, 0.4700907, -1.12829, 0, 0.2509804, 1, 1,
0.327345, 0.7838483, 1.980284, 0, 0.2431373, 1, 1,
0.3341253, 0.01016485, 1.433171, 0, 0.2392157, 1, 1,
0.3347851, -0.1474414, 2.448409, 0, 0.2313726, 1, 1,
0.3439014, 1.547642, -0.5781919, 0, 0.227451, 1, 1,
0.3444081, 0.7658384, 0.01492386, 0, 0.2196078, 1, 1,
0.3495325, 0.7264143, 1.345387, 0, 0.2156863, 1, 1,
0.3496359, -1.815606, 2.984107, 0, 0.2078431, 1, 1,
0.3507223, -1.101181, 2.496297, 0, 0.2039216, 1, 1,
0.3514731, -0.4069031, 1.940466, 0, 0.1960784, 1, 1,
0.3549237, -1.718696, 3.215024, 0, 0.1882353, 1, 1,
0.3603086, -0.09950265, 2.694412, 0, 0.1843137, 1, 1,
0.3606115, -0.2049619, 1.842875, 0, 0.1764706, 1, 1,
0.3614718, -0.3925811, 2.044921, 0, 0.172549, 1, 1,
0.3617172, -0.2532277, -0.7721559, 0, 0.1647059, 1, 1,
0.366494, -0.4169378, 3.780954, 0, 0.1607843, 1, 1,
0.3665819, -0.1401828, 2.307861, 0, 0.1529412, 1, 1,
0.3670935, 1.068031, 0.3323135, 0, 0.1490196, 1, 1,
0.3821502, 0.4731521, 1.608327, 0, 0.1411765, 1, 1,
0.3827014, -0.4455334, 3.421693, 0, 0.1372549, 1, 1,
0.3835608, 0.00733632, 2.368817, 0, 0.1294118, 1, 1,
0.3837104, 0.1807276, 1.539317, 0, 0.1254902, 1, 1,
0.3867557, -0.3047042, 1.222775, 0, 0.1176471, 1, 1,
0.3898357, -0.7896478, 2.794676, 0, 0.1137255, 1, 1,
0.3904327, 1.4631, -0.7111484, 0, 0.1058824, 1, 1,
0.3918758, 1.478937, -0.7599233, 0, 0.09803922, 1, 1,
0.3929132, -2.29059, 3.921466, 0, 0.09411765, 1, 1,
0.3967303, 1.239796, -1.11813, 0, 0.08627451, 1, 1,
0.3970321, 1.427924, -1.121426, 0, 0.08235294, 1, 1,
0.3979569, 0.7483954, -0.6540687, 0, 0.07450981, 1, 1,
0.3992929, -0.0189748, 2.270183, 0, 0.07058824, 1, 1,
0.4002801, -0.2453873, 2.564918, 0, 0.0627451, 1, 1,
0.4021009, -1.602551, 4.16453, 0, 0.05882353, 1, 1,
0.4038811, -0.6869776, 4.531919, 0, 0.05098039, 1, 1,
0.4058196, -0.8614615, 2.29509, 0, 0.04705882, 1, 1,
0.4087269, -1.149414, 2.721726, 0, 0.03921569, 1, 1,
0.4185202, -1.062292, 3.220836, 0, 0.03529412, 1, 1,
0.4269516, -0.1666595, 3.522442, 0, 0.02745098, 1, 1,
0.4311617, -0.3844635, 2.515093, 0, 0.02352941, 1, 1,
0.4326735, -2.010333, 2.08305, 0, 0.01568628, 1, 1,
0.4425032, -0.2541016, 2.772986, 0, 0.01176471, 1, 1,
0.4498313, 0.2699798, 1.207682, 0, 0.003921569, 1, 1,
0.4525818, -2.319973, 2.253903, 0.003921569, 0, 1, 1,
0.4579522, 0.2068145, 0.4175982, 0.007843138, 0, 1, 1,
0.463056, -0.6097816, 1.453826, 0.01568628, 0, 1, 1,
0.4631748, 0.5702918, 0.8788213, 0.01960784, 0, 1, 1,
0.464597, -0.4898683, 2.2351, 0.02745098, 0, 1, 1,
0.4652069, 0.03466463, 3.848885, 0.03137255, 0, 1, 1,
0.4708469, 1.137744, 1.696975, 0.03921569, 0, 1, 1,
0.4713378, 0.7409932, 0.8386786, 0.04313726, 0, 1, 1,
0.4749067, 0.5578047, 0.8713403, 0.05098039, 0, 1, 1,
0.475199, -0.9084504, 2.166137, 0.05490196, 0, 1, 1,
0.4754969, 0.247247, 1.276305, 0.0627451, 0, 1, 1,
0.4792673, 0.5074279, 2.312968, 0.06666667, 0, 1, 1,
0.4793025, 0.003646279, 1.432678, 0.07450981, 0, 1, 1,
0.4797271, 0.7373054, -0.2335281, 0.07843138, 0, 1, 1,
0.4803424, 0.146429, 1.359373, 0.08627451, 0, 1, 1,
0.4823892, 1.709551, 0.4949256, 0.09019608, 0, 1, 1,
0.4854736, 0.6531789, 0.7336187, 0.09803922, 0, 1, 1,
0.4870685, -0.7736722, 1.866078, 0.1058824, 0, 1, 1,
0.4890408, 0.2793079, -1.429736, 0.1098039, 0, 1, 1,
0.4941999, -0.07356951, 2.209244, 0.1176471, 0, 1, 1,
0.4942344, 0.6328852, 2.655767, 0.1215686, 0, 1, 1,
0.4954394, -0.1025257, 2.206193, 0.1294118, 0, 1, 1,
0.496454, 0.4801886, 0.9928039, 0.1333333, 0, 1, 1,
0.4992383, 0.2959406, 3.006778, 0.1411765, 0, 1, 1,
0.5004514, -1.510815, 1.27987, 0.145098, 0, 1, 1,
0.5082586, -0.008522106, 0.5877186, 0.1529412, 0, 1, 1,
0.5103809, -2.037781, 2.541644, 0.1568628, 0, 1, 1,
0.5107452, -3.284009, 2.816691, 0.1647059, 0, 1, 1,
0.5108585, -0.7920849, 1.493859, 0.1686275, 0, 1, 1,
0.5111191, 0.12056, 2.091342, 0.1764706, 0, 1, 1,
0.5178742, 0.3538735, -0.5998535, 0.1803922, 0, 1, 1,
0.5179645, -1.401266, 1.292384, 0.1882353, 0, 1, 1,
0.5319062, 0.4474833, -0.2541003, 0.1921569, 0, 1, 1,
0.531972, -1.084382, 3.856493, 0.2, 0, 1, 1,
0.5342525, -2.125253, 2.457146, 0.2078431, 0, 1, 1,
0.5365115, 0.04868924, 1.344852, 0.2117647, 0, 1, 1,
0.5386377, 1.52246, -0.3860692, 0.2196078, 0, 1, 1,
0.5395071, -0.09981439, -0.05085142, 0.2235294, 0, 1, 1,
0.5399424, -1.281652, 2.552354, 0.2313726, 0, 1, 1,
0.5407572, 0.4307834, 0.5653819, 0.2352941, 0, 1, 1,
0.5449712, 0.1878062, 0.7339625, 0.2431373, 0, 1, 1,
0.54626, 0.1244745, 2.722216, 0.2470588, 0, 1, 1,
0.5512088, 1.164821, 0.3914273, 0.254902, 0, 1, 1,
0.5512769, 0.6236327, 2.096398, 0.2588235, 0, 1, 1,
0.5520329, -0.7476696, 3.13178, 0.2666667, 0, 1, 1,
0.5529338, -0.1757642, 1.170259, 0.2705882, 0, 1, 1,
0.5551934, 0.2849568, 1.347706, 0.2784314, 0, 1, 1,
0.5631411, 0.6936218, -0.3505116, 0.282353, 0, 1, 1,
0.5652741, 0.4350155, 0.5186357, 0.2901961, 0, 1, 1,
0.5668902, -1.200809, 3.810031, 0.2941177, 0, 1, 1,
0.5715175, 1.048882, 0.0222389, 0.3019608, 0, 1, 1,
0.5741115, 0.2425465, 1.713976, 0.3098039, 0, 1, 1,
0.5746258, 1.785244, 0.9106155, 0.3137255, 0, 1, 1,
0.5761096, -0.3599143, 1.898418, 0.3215686, 0, 1, 1,
0.5836094, 0.9920274, 0.3263009, 0.3254902, 0, 1, 1,
0.5926046, 1.323318, -0.861307, 0.3333333, 0, 1, 1,
0.5937918, -0.4110991, 1.189877, 0.3372549, 0, 1, 1,
0.5990661, -0.2091142, 3.479599, 0.345098, 0, 1, 1,
0.6015281, 0.3094708, 1.211125, 0.3490196, 0, 1, 1,
0.6029947, -0.4231606, 1.854473, 0.3568628, 0, 1, 1,
0.6045897, -0.4571569, 1.972249, 0.3607843, 0, 1, 1,
0.6059369, 0.3443075, -0.02802251, 0.3686275, 0, 1, 1,
0.6082731, -1.051576, 1.893204, 0.372549, 0, 1, 1,
0.6101649, -0.2047179, 1.831705, 0.3803922, 0, 1, 1,
0.6184657, 1.011945, 1.788529, 0.3843137, 0, 1, 1,
0.6191798, 0.9058489, 0.6278665, 0.3921569, 0, 1, 1,
0.6211293, 0.3373525, 2.860744, 0.3960784, 0, 1, 1,
0.6220084, 0.2305255, -0.1925475, 0.4039216, 0, 1, 1,
0.6271214, -0.01164385, 1.812682, 0.4117647, 0, 1, 1,
0.6382334, -0.4399614, 1.653034, 0.4156863, 0, 1, 1,
0.6382737, -0.2655472, 2.623584, 0.4235294, 0, 1, 1,
0.6420476, -0.4217942, 1.17501, 0.427451, 0, 1, 1,
0.6464985, -1.12631, 4.239901, 0.4352941, 0, 1, 1,
0.6469356, 0.4859062, 0.2835632, 0.4392157, 0, 1, 1,
0.6533204, -1.991419, 2.81853, 0.4470588, 0, 1, 1,
0.6538902, -1.33494, 3.946019, 0.4509804, 0, 1, 1,
0.6607816, 0.2982838, 0.2840725, 0.4588235, 0, 1, 1,
0.665521, 0.7799696, 1.857639, 0.4627451, 0, 1, 1,
0.6725433, 0.2030248, 0.8974568, 0.4705882, 0, 1, 1,
0.6732932, -1.900224, 3.273946, 0.4745098, 0, 1, 1,
0.6742084, 1.323322, 1.088848, 0.4823529, 0, 1, 1,
0.6745261, -0.9171154, 1.700996, 0.4862745, 0, 1, 1,
0.6747487, 0.8877615, -0.9700935, 0.4941176, 0, 1, 1,
0.6770089, -1.162102, 2.043168, 0.5019608, 0, 1, 1,
0.6774513, -0.6656404, 2.960682, 0.5058824, 0, 1, 1,
0.6813533, -2.286919, 2.291207, 0.5137255, 0, 1, 1,
0.6904118, 1.635896, -0.09619401, 0.5176471, 0, 1, 1,
0.6926013, 1.932621, 0.9532979, 0.5254902, 0, 1, 1,
0.6966283, 0.9457718, 0.7302802, 0.5294118, 0, 1, 1,
0.6973091, -0.3441493, 3.172155, 0.5372549, 0, 1, 1,
0.6979972, 0.23793, 2.642868, 0.5411765, 0, 1, 1,
0.698395, -1.533517, 3.005033, 0.5490196, 0, 1, 1,
0.7005309, 1.648663, 0.0467206, 0.5529412, 0, 1, 1,
0.7015563, 0.8384793, -1.055547, 0.5607843, 0, 1, 1,
0.702419, 0.02795073, 2.704953, 0.5647059, 0, 1, 1,
0.7119925, -0.5802706, 2.19608, 0.572549, 0, 1, 1,
0.7136865, 0.3043644, 2.234215, 0.5764706, 0, 1, 1,
0.7158984, 0.4982235, 0.111131, 0.5843138, 0, 1, 1,
0.7169739, 0.5173022, 1.198744, 0.5882353, 0, 1, 1,
0.7174185, -1.635945, 1.858074, 0.5960785, 0, 1, 1,
0.7185705, -1.310796, 3.564965, 0.6039216, 0, 1, 1,
0.7234287, -0.975022, 3.225567, 0.6078432, 0, 1, 1,
0.723455, 1.979619, 1.861596, 0.6156863, 0, 1, 1,
0.7257962, -0.6642172, 2.862841, 0.6196079, 0, 1, 1,
0.7265074, -0.2426872, 2.24299, 0.627451, 0, 1, 1,
0.7265368, -0.358266, 2.362831, 0.6313726, 0, 1, 1,
0.7282405, -0.6033715, 2.317, 0.6392157, 0, 1, 1,
0.7313682, 0.5190334, 2.371438, 0.6431373, 0, 1, 1,
0.7325506, 1.21128, 0.9876046, 0.6509804, 0, 1, 1,
0.7373695, 0.9743271, 1.2098, 0.654902, 0, 1, 1,
0.7438772, -1.620892, 3.173517, 0.6627451, 0, 1, 1,
0.74609, 0.1015957, 0.002564248, 0.6666667, 0, 1, 1,
0.7464388, 0.05015098, 2.020847, 0.6745098, 0, 1, 1,
0.7514761, 0.3248132, 1.152067, 0.6784314, 0, 1, 1,
0.759506, 1.099558, 0.02736307, 0.6862745, 0, 1, 1,
0.7734951, -0.994931, 2.48995, 0.6901961, 0, 1, 1,
0.7784028, -0.4691346, 2.545278, 0.6980392, 0, 1, 1,
0.7845297, -0.7966543, 3.334091, 0.7058824, 0, 1, 1,
0.7908518, 0.4979181, 1.628501, 0.7098039, 0, 1, 1,
0.7914891, 0.1825848, 1.242682, 0.7176471, 0, 1, 1,
0.7924877, -1.337586, 3.520531, 0.7215686, 0, 1, 1,
0.794287, -1.518644, 3.027527, 0.7294118, 0, 1, 1,
0.8043166, 0.2342369, 0.9573221, 0.7333333, 0, 1, 1,
0.8145204, -1.640276, 2.335013, 0.7411765, 0, 1, 1,
0.8219844, -0.4421913, 3.148793, 0.7450981, 0, 1, 1,
0.8220548, 0.02391145, 0.6485232, 0.7529412, 0, 1, 1,
0.8280969, -0.7937469, 2.861034, 0.7568628, 0, 1, 1,
0.8317704, 1.670687, 0.03021509, 0.7647059, 0, 1, 1,
0.8354743, -1.690707, 0.8188466, 0.7686275, 0, 1, 1,
0.8393422, 1.410639, 0.7370901, 0.7764706, 0, 1, 1,
0.851043, 1.82152, 0.6279322, 0.7803922, 0, 1, 1,
0.851392, 0.9930268, 0.3341871, 0.7882353, 0, 1, 1,
0.8557345, -0.2417743, 0.909376, 0.7921569, 0, 1, 1,
0.857206, -0.2498842, 2.555166, 0.8, 0, 1, 1,
0.8581329, -1.132159, 1.861256, 0.8078431, 0, 1, 1,
0.8631567, 0.2161999, 1.431711, 0.8117647, 0, 1, 1,
0.8665513, 0.9289039, 0.6983722, 0.8196079, 0, 1, 1,
0.8677757, -1.628926, 4.784179, 0.8235294, 0, 1, 1,
0.8698472, 0.4604096, 0.9977032, 0.8313726, 0, 1, 1,
0.8701472, -0.7732228, 3.448142, 0.8352941, 0, 1, 1,
0.8724319, 1.529004, 1.368079, 0.8431373, 0, 1, 1,
0.8800156, 0.2006187, 1.431318, 0.8470588, 0, 1, 1,
0.881334, 0.4693123, 1.192318, 0.854902, 0, 1, 1,
0.8831667, 0.8465488, -1.124937, 0.8588235, 0, 1, 1,
0.8839474, -2.352004, 1.778813, 0.8666667, 0, 1, 1,
0.8867359, -0.8728542, 2.338265, 0.8705882, 0, 1, 1,
0.8919858, -0.2980086, -0.5549523, 0.8784314, 0, 1, 1,
0.89487, -0.07263068, 1.852592, 0.8823529, 0, 1, 1,
0.89894, 0.75515, 1.46883, 0.8901961, 0, 1, 1,
0.9036102, -0.06111329, 0.8340175, 0.8941177, 0, 1, 1,
0.9044377, 0.1450258, 2.415942, 0.9019608, 0, 1, 1,
0.9053997, -0.1214424, 3.376681, 0.9098039, 0, 1, 1,
0.910949, 0.6627904, 0.1821761, 0.9137255, 0, 1, 1,
0.9112062, -0.5558521, 2.029621, 0.9215686, 0, 1, 1,
0.9159906, 0.06581076, 1.774372, 0.9254902, 0, 1, 1,
0.9239327, 1.033003, 1.131823, 0.9333333, 0, 1, 1,
0.9244564, -0.433413, 1.537986, 0.9372549, 0, 1, 1,
0.93432, 0.1729056, 0.2916733, 0.945098, 0, 1, 1,
0.9395641, 0.1706681, 2.248049, 0.9490196, 0, 1, 1,
0.9402281, 0.1899123, 1.391713, 0.9568627, 0, 1, 1,
0.9565138, 0.219399, 0.6350591, 0.9607843, 0, 1, 1,
0.9568286, 0.570758, 0.7047274, 0.9686275, 0, 1, 1,
0.9682815, 1.667747, -0.7543887, 0.972549, 0, 1, 1,
0.9701116, -2.959798, 3.892591, 0.9803922, 0, 1, 1,
0.9702799, -0.7598265, 1.264969, 0.9843137, 0, 1, 1,
0.9767449, -0.04309209, 2.16557, 0.9921569, 0, 1, 1,
0.9808071, -0.5957557, 1.92839, 0.9960784, 0, 1, 1,
0.9825178, -1.036552, 4.481454, 1, 0, 0.9960784, 1,
0.9846116, -1.25528, 3.468812, 1, 0, 0.9882353, 1,
0.9880256, 0.4924627, 1.06742, 1, 0, 0.9843137, 1,
0.9899704, -0.4322183, 1.959745, 1, 0, 0.9764706, 1,
0.9906031, -0.851989, 4.96736, 1, 0, 0.972549, 1,
0.993593, 1.254719, 1.331036, 1, 0, 0.9647059, 1,
0.9970551, 1.156858, 0.004259695, 1, 0, 0.9607843, 1,
1.000935, 0.5778113, 0.3333899, 1, 0, 0.9529412, 1,
1.003482, -1.266282, 1.007906, 1, 0, 0.9490196, 1,
1.006602, -0.06615712, 1.745655, 1, 0, 0.9411765, 1,
1.010713, 0.4212113, 1.859142, 1, 0, 0.9372549, 1,
1.0182, -1.611996, 4.56258, 1, 0, 0.9294118, 1,
1.020257, 1.133169, -0.06784067, 1, 0, 0.9254902, 1,
1.022017, -0.04933874, 3.1486, 1, 0, 0.9176471, 1,
1.030404, -0.1727242, -0.8446036, 1, 0, 0.9137255, 1,
1.03545, 1.373665, 1.565758, 1, 0, 0.9058824, 1,
1.044131, 1.078245, 1.124558, 1, 0, 0.9019608, 1,
1.061218, -1.74796, 2.016458, 1, 0, 0.8941177, 1,
1.064425, -0.6268346, 2.545336, 1, 0, 0.8862745, 1,
1.064981, -0.1313913, 1.552804, 1, 0, 0.8823529, 1,
1.067478, -0.8019227, 2.726531, 1, 0, 0.8745098, 1,
1.068077, 0.2137905, 2.380566, 1, 0, 0.8705882, 1,
1.070407, -0.8425458, 1.12561, 1, 0, 0.8627451, 1,
1.076086, -0.5334244, 3.219709, 1, 0, 0.8588235, 1,
1.079586, -0.08212756, 1.880672, 1, 0, 0.8509804, 1,
1.081311, 0.6780539, 0.3247088, 1, 0, 0.8470588, 1,
1.083818, -1.798831, 0.8616222, 1, 0, 0.8392157, 1,
1.085308, 0.1163387, 2.341441, 1, 0, 0.8352941, 1,
1.089271, -1.27349, 0.9871441, 1, 0, 0.827451, 1,
1.101786, -0.4189826, 2.471423, 1, 0, 0.8235294, 1,
1.101796, -0.2482442, -0.211266, 1, 0, 0.8156863, 1,
1.105738, 1.668952, 1.410815, 1, 0, 0.8117647, 1,
1.105996, -0.2547626, 3.85779, 1, 0, 0.8039216, 1,
1.107387, -0.1953551, 1.274488, 1, 0, 0.7960784, 1,
1.108595, 1.112045, -1.035969, 1, 0, 0.7921569, 1,
1.11816, 1.967915, -1.863817, 1, 0, 0.7843137, 1,
1.126038, -0.2604226, 2.095616, 1, 0, 0.7803922, 1,
1.138576, -1.048132, 3.735481, 1, 0, 0.772549, 1,
1.140239, -1.480698, 2.376381, 1, 0, 0.7686275, 1,
1.141693, -1.119634, 1.483613, 1, 0, 0.7607843, 1,
1.160745, 0.1290849, 0.6006967, 1, 0, 0.7568628, 1,
1.164196, 0.6272672, 2.675132, 1, 0, 0.7490196, 1,
1.176976, -0.6472035, 1.076053, 1, 0, 0.7450981, 1,
1.183693, 0.7144328, -0.4284419, 1, 0, 0.7372549, 1,
1.196288, -0.5745109, 0.4890259, 1, 0, 0.7333333, 1,
1.203146, 0.949867, 2.942934, 1, 0, 0.7254902, 1,
1.205426, 0.3296358, 1.4006, 1, 0, 0.7215686, 1,
1.209659, -0.8161909, 1.931783, 1, 0, 0.7137255, 1,
1.210392, -0.2267532, 0.3881863, 1, 0, 0.7098039, 1,
1.214646, 0.1981643, 2.556489, 1, 0, 0.7019608, 1,
1.215015, 2.126366, 1.559506, 1, 0, 0.6941177, 1,
1.221985, -0.3051062, 3.317904, 1, 0, 0.6901961, 1,
1.229188, -0.1108677, 1.96913, 1, 0, 0.682353, 1,
1.233577, 0.9966012, 0.2703059, 1, 0, 0.6784314, 1,
1.235528, 0.3956694, 0.9843822, 1, 0, 0.6705883, 1,
1.236755, 0.4732148, 1.420576, 1, 0, 0.6666667, 1,
1.237673, -0.7951327, 2.141426, 1, 0, 0.6588235, 1,
1.238293, -0.3042334, 2.972349, 1, 0, 0.654902, 1,
1.241781, 1.28671, 1.509622, 1, 0, 0.6470588, 1,
1.251945, 0.2204586, 1.9206, 1, 0, 0.6431373, 1,
1.253821, -0.3679072, 2.867706, 1, 0, 0.6352941, 1,
1.256332, 0.2140986, 2.209931, 1, 0, 0.6313726, 1,
1.258116, -0.4306525, 0.529634, 1, 0, 0.6235294, 1,
1.267128, -1.426921, 2.535169, 1, 0, 0.6196079, 1,
1.267781, -1.987843, 2.067871, 1, 0, 0.6117647, 1,
1.27904, -0.3939144, 0.9341537, 1, 0, 0.6078432, 1,
1.285916, -1.777419, 1.891241, 1, 0, 0.6, 1,
1.291191, 2.757353, 1.950771, 1, 0, 0.5921569, 1,
1.299038, 0.156926, 1.235698, 1, 0, 0.5882353, 1,
1.301717, 0.8206661, -1.298616, 1, 0, 0.5803922, 1,
1.302662, -0.2179123, 1.85369, 1, 0, 0.5764706, 1,
1.304494, 0.0002652932, 0.6507096, 1, 0, 0.5686275, 1,
1.318595, 0.06642655, -1.374127, 1, 0, 0.5647059, 1,
1.320241, -0.7568712, 1.442523, 1, 0, 0.5568628, 1,
1.332636, -2.220929, 1.417483, 1, 0, 0.5529412, 1,
1.33318, -0.6847669, 0.5465416, 1, 0, 0.5450981, 1,
1.334907, -0.1420866, 1.324523, 1, 0, 0.5411765, 1,
1.338048, 0.9962577, -0.5337192, 1, 0, 0.5333334, 1,
1.341665, 0.5732269, -1.339247, 1, 0, 0.5294118, 1,
1.349852, -0.8065181, 2.88641, 1, 0, 0.5215687, 1,
1.354452, -0.02152702, 1.369761, 1, 0, 0.5176471, 1,
1.361643, -1.192502, 2.385872, 1, 0, 0.509804, 1,
1.37191, 0.5953696, 0.9691006, 1, 0, 0.5058824, 1,
1.374394, -0.7226668, 2.727012, 1, 0, 0.4980392, 1,
1.375057, 1.465889, 1.864809, 1, 0, 0.4901961, 1,
1.383487, 1.355941, -1.124307, 1, 0, 0.4862745, 1,
1.388472, -0.6352375, 1.017899, 1, 0, 0.4784314, 1,
1.399495, 1.749043, -0.7555355, 1, 0, 0.4745098, 1,
1.399939, 1.86626, 0.3169067, 1, 0, 0.4666667, 1,
1.415676, -1.888631, 2.200483, 1, 0, 0.4627451, 1,
1.416654, 0.1020687, 1.563505, 1, 0, 0.454902, 1,
1.421397, 0.7756603, 0.6718425, 1, 0, 0.4509804, 1,
1.427804, -0.3265037, 0.9449674, 1, 0, 0.4431373, 1,
1.429981, -0.3767665, 1.793219, 1, 0, 0.4392157, 1,
1.433513, 0.02278163, 1.484701, 1, 0, 0.4313726, 1,
1.443055, 0.4979825, 1.309239, 1, 0, 0.427451, 1,
1.44617, -1.186132, 3.634998, 1, 0, 0.4196078, 1,
1.448689, -1.588555, 2.493817, 1, 0, 0.4156863, 1,
1.449742, -2.419284, 3.224816, 1, 0, 0.4078431, 1,
1.453332, 1.793441, 0.5763894, 1, 0, 0.4039216, 1,
1.463435, 1.240626, 1.901293, 1, 0, 0.3960784, 1,
1.464871, 0.5798355, 1.819378, 1, 0, 0.3882353, 1,
1.466615, -0.270389, 3.012496, 1, 0, 0.3843137, 1,
1.470522, -0.8638309, 3.039362, 1, 0, 0.3764706, 1,
1.473834, 2.00215, 0.7108148, 1, 0, 0.372549, 1,
1.495552, -0.188371, 1.436045, 1, 0, 0.3647059, 1,
1.49682, 0.7113851, -0.06981397, 1, 0, 0.3607843, 1,
1.498567, -1.972711, 2.036256, 1, 0, 0.3529412, 1,
1.499956, 1.249748, 0.9733364, 1, 0, 0.3490196, 1,
1.510475, 0.4650152, 2.168721, 1, 0, 0.3411765, 1,
1.525383, -0.7085633, -1.090107, 1, 0, 0.3372549, 1,
1.528662, -1.722241, 3.659438, 1, 0, 0.3294118, 1,
1.538918, -0.2223288, 3.633471, 1, 0, 0.3254902, 1,
1.549564, 1.325179, 0.715307, 1, 0, 0.3176471, 1,
1.580902, -0.2109445, 1.569838, 1, 0, 0.3137255, 1,
1.583095, -0.16738, 3.406486, 1, 0, 0.3058824, 1,
1.589044, -0.007087481, 0.7985791, 1, 0, 0.2980392, 1,
1.60828, 0.5055766, 3.254087, 1, 0, 0.2941177, 1,
1.611651, -1.135521, 1.42789, 1, 0, 0.2862745, 1,
1.640125, -0.6095161, 1.597534, 1, 0, 0.282353, 1,
1.644945, -0.5614284, 0.7668456, 1, 0, 0.2745098, 1,
1.64712, 0.8771989, 0.7116741, 1, 0, 0.2705882, 1,
1.647302, -1.276174, 2.746971, 1, 0, 0.2627451, 1,
1.653182, 0.03597179, 1.138906, 1, 0, 0.2588235, 1,
1.67856, -0.4098085, 1.149128, 1, 0, 0.2509804, 1,
1.686061, -0.6006469, 2.782863, 1, 0, 0.2470588, 1,
1.723589, 0.7554173, 2.393705, 1, 0, 0.2392157, 1,
1.72986, -0.5325509, 2.186092, 1, 0, 0.2352941, 1,
1.734241, -0.07845826, 0.4458353, 1, 0, 0.227451, 1,
1.741301, -0.9368836, 2.611702, 1, 0, 0.2235294, 1,
1.758314, 1.89826, -0.08808727, 1, 0, 0.2156863, 1,
1.793043, 1.239797, -0.7573462, 1, 0, 0.2117647, 1,
1.808241, -0.2292791, 2.166436, 1, 0, 0.2039216, 1,
1.818948, -0.4643897, 2.006521, 1, 0, 0.1960784, 1,
1.827884, -2.605178, 2.307348, 1, 0, 0.1921569, 1,
1.834852, -0.78937, 2.857454, 1, 0, 0.1843137, 1,
1.842491, 1.857403, 0.4290403, 1, 0, 0.1803922, 1,
1.849015, 0.5297902, 0.8139905, 1, 0, 0.172549, 1,
1.851391, 0.5790464, 0.1216494, 1, 0, 0.1686275, 1,
1.879381, 0.5114664, -0.7226955, 1, 0, 0.1607843, 1,
1.897004, -2.042446, 1.667661, 1, 0, 0.1568628, 1,
1.93299, 1.743619, -1.289055, 1, 0, 0.1490196, 1,
1.945309, 0.02448989, 1.202748, 1, 0, 0.145098, 1,
1.947103, -0.6181357, 0.6243359, 1, 0, 0.1372549, 1,
1.954241, -0.4691447, 1.034028, 1, 0, 0.1333333, 1,
1.954717, -0.6725692, 1.725813, 1, 0, 0.1254902, 1,
1.957749, -0.5975465, 1.465602, 1, 0, 0.1215686, 1,
1.958928, -0.5426893, 4.212023, 1, 0, 0.1137255, 1,
1.96642, -0.6824871, -1.337036, 1, 0, 0.1098039, 1,
1.990748, 0.8702941, 2.301937, 1, 0, 0.1019608, 1,
2.018432, -2.223577, 3.132541, 1, 0, 0.09411765, 1,
2.031056, 1.03146, 1.837123, 1, 0, 0.09019608, 1,
2.059025, 0.3031237, 1.104515, 1, 0, 0.08235294, 1,
2.06349, -0.9170059, 1.551561, 1, 0, 0.07843138, 1,
2.076913, 0.9226246, 1.051234, 1, 0, 0.07058824, 1,
2.106773, -2.295713, 1.829491, 1, 0, 0.06666667, 1,
2.112365, 0.01719766, 1.435478, 1, 0, 0.05882353, 1,
2.122371, 0.5638574, 0.5103787, 1, 0, 0.05490196, 1,
2.124621, 1.019594, 0.0727494, 1, 0, 0.04705882, 1,
2.127856, -0.1921299, 2.73188, 1, 0, 0.04313726, 1,
2.185052, -1.500644, 2.412156, 1, 0, 0.03529412, 1,
2.28666, -0.5664148, 0.6482337, 1, 0, 0.03137255, 1,
2.334631, -0.7762613, 1.278594, 1, 0, 0.02352941, 1,
2.42997, 1.449864, 1.254701, 1, 0, 0.01960784, 1,
2.55702, 0.3339322, 1.978068, 1, 0, 0.01176471, 1,
3.779961, 0.0790609, 1.798995, 1, 0, 0.007843138, 1
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
-0.06430697, -4.887568, -6.623343, 0, -0.5, 0.5, 0.5,
-0.06430697, -4.887568, -6.623343, 1, -0.5, 0.5, 0.5,
-0.06430697, -4.887568, -6.623343, 1, 1.5, 0.5, 0.5,
-0.06430697, -4.887568, -6.623343, 0, 1.5, 0.5, 0.5
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
-5.211782, -0.5083863, -6.623343, 0, -0.5, 0.5, 0.5,
-5.211782, -0.5083863, -6.623343, 1, -0.5, 0.5, 0.5,
-5.211782, -0.5083863, -6.623343, 1, 1.5, 0.5, 0.5,
-5.211782, -0.5083863, -6.623343, 0, 1.5, 0.5, 0.5
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
-5.211782, -4.887568, 0.8202984, 0, -0.5, 0.5, 0.5,
-5.211782, -4.887568, 0.8202984, 1, -0.5, 0.5, 0.5,
-5.211782, -4.887568, 0.8202984, 1, 1.5, 0.5, 0.5,
-5.211782, -4.887568, 0.8202984, 0, 1.5, 0.5, 0.5
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
-2, -3.876987, -4.90558,
2, -3.876987, -4.90558,
-2, -3.876987, -4.90558,
-2, -4.045418, -5.191874,
0, -3.876987, -4.90558,
0, -4.045418, -5.191874,
2, -3.876987, -4.90558,
2, -4.045418, -5.191874
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
-2, -4.382278, -5.764462, 0, -0.5, 0.5, 0.5,
-2, -4.382278, -5.764462, 1, -0.5, 0.5, 0.5,
-2, -4.382278, -5.764462, 1, 1.5, 0.5, 0.5,
-2, -4.382278, -5.764462, 0, 1.5, 0.5, 0.5,
0, -4.382278, -5.764462, 0, -0.5, 0.5, 0.5,
0, -4.382278, -5.764462, 1, -0.5, 0.5, 0.5,
0, -4.382278, -5.764462, 1, 1.5, 0.5, 0.5,
0, -4.382278, -5.764462, 0, 1.5, 0.5, 0.5,
2, -4.382278, -5.764462, 0, -0.5, 0.5, 0.5,
2, -4.382278, -5.764462, 1, -0.5, 0.5, 0.5,
2, -4.382278, -5.764462, 1, 1.5, 0.5, 0.5,
2, -4.382278, -5.764462, 0, 1.5, 0.5, 0.5
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
-4.023903, -3, -4.90558,
-4.023903, 2, -4.90558,
-4.023903, -3, -4.90558,
-4.221883, -3, -5.191874,
-4.023903, -2, -4.90558,
-4.221883, -2, -5.191874,
-4.023903, -1, -4.90558,
-4.221883, -1, -5.191874,
-4.023903, 0, -4.90558,
-4.221883, 0, -5.191874,
-4.023903, 1, -4.90558,
-4.221883, 1, -5.191874,
-4.023903, 2, -4.90558,
-4.221883, 2, -5.191874
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
-4.617842, -3, -5.764462, 0, -0.5, 0.5, 0.5,
-4.617842, -3, -5.764462, 1, -0.5, 0.5, 0.5,
-4.617842, -3, -5.764462, 1, 1.5, 0.5, 0.5,
-4.617842, -3, -5.764462, 0, 1.5, 0.5, 0.5,
-4.617842, -2, -5.764462, 0, -0.5, 0.5, 0.5,
-4.617842, -2, -5.764462, 1, -0.5, 0.5, 0.5,
-4.617842, -2, -5.764462, 1, 1.5, 0.5, 0.5,
-4.617842, -2, -5.764462, 0, 1.5, 0.5, 0.5,
-4.617842, -1, -5.764462, 0, -0.5, 0.5, 0.5,
-4.617842, -1, -5.764462, 1, -0.5, 0.5, 0.5,
-4.617842, -1, -5.764462, 1, 1.5, 0.5, 0.5,
-4.617842, -1, -5.764462, 0, 1.5, 0.5, 0.5,
-4.617842, 0, -5.764462, 0, -0.5, 0.5, 0.5,
-4.617842, 0, -5.764462, 1, -0.5, 0.5, 0.5,
-4.617842, 0, -5.764462, 1, 1.5, 0.5, 0.5,
-4.617842, 0, -5.764462, 0, 1.5, 0.5, 0.5,
-4.617842, 1, -5.764462, 0, -0.5, 0.5, 0.5,
-4.617842, 1, -5.764462, 1, -0.5, 0.5, 0.5,
-4.617842, 1, -5.764462, 1, 1.5, 0.5, 0.5,
-4.617842, 1, -5.764462, 0, 1.5, 0.5, 0.5,
-4.617842, 2, -5.764462, 0, -0.5, 0.5, 0.5,
-4.617842, 2, -5.764462, 1, -0.5, 0.5, 0.5,
-4.617842, 2, -5.764462, 1, 1.5, 0.5, 0.5,
-4.617842, 2, -5.764462, 0, 1.5, 0.5, 0.5
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
-4.023903, -3.876987, -4,
-4.023903, -3.876987, 6,
-4.023903, -3.876987, -4,
-4.221883, -4.045418, -4,
-4.023903, -3.876987, -2,
-4.221883, -4.045418, -2,
-4.023903, -3.876987, 0,
-4.221883, -4.045418, 0,
-4.023903, -3.876987, 2,
-4.221883, -4.045418, 2,
-4.023903, -3.876987, 4,
-4.221883, -4.045418, 4,
-4.023903, -3.876987, 6,
-4.221883, -4.045418, 6
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
"4",
"6"
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
-4.617842, -4.382278, -4, 0, -0.5, 0.5, 0.5,
-4.617842, -4.382278, -4, 1, -0.5, 0.5, 0.5,
-4.617842, -4.382278, -4, 1, 1.5, 0.5, 0.5,
-4.617842, -4.382278, -4, 0, 1.5, 0.5, 0.5,
-4.617842, -4.382278, -2, 0, -0.5, 0.5, 0.5,
-4.617842, -4.382278, -2, 1, -0.5, 0.5, 0.5,
-4.617842, -4.382278, -2, 1, 1.5, 0.5, 0.5,
-4.617842, -4.382278, -2, 0, 1.5, 0.5, 0.5,
-4.617842, -4.382278, 0, 0, -0.5, 0.5, 0.5,
-4.617842, -4.382278, 0, 1, -0.5, 0.5, 0.5,
-4.617842, -4.382278, 0, 1, 1.5, 0.5, 0.5,
-4.617842, -4.382278, 0, 0, 1.5, 0.5, 0.5,
-4.617842, -4.382278, 2, 0, -0.5, 0.5, 0.5,
-4.617842, -4.382278, 2, 1, -0.5, 0.5, 0.5,
-4.617842, -4.382278, 2, 1, 1.5, 0.5, 0.5,
-4.617842, -4.382278, 2, 0, 1.5, 0.5, 0.5,
-4.617842, -4.382278, 4, 0, -0.5, 0.5, 0.5,
-4.617842, -4.382278, 4, 1, -0.5, 0.5, 0.5,
-4.617842, -4.382278, 4, 1, 1.5, 0.5, 0.5,
-4.617842, -4.382278, 4, 0, 1.5, 0.5, 0.5,
-4.617842, -4.382278, 6, 0, -0.5, 0.5, 0.5,
-4.617842, -4.382278, 6, 1, -0.5, 0.5, 0.5,
-4.617842, -4.382278, 6, 1, 1.5, 0.5, 0.5,
-4.617842, -4.382278, 6, 0, 1.5, 0.5, 0.5
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
-4.023903, -3.876987, -4.90558,
-4.023903, 2.860215, -4.90558,
-4.023903, -3.876987, 6.546177,
-4.023903, 2.860215, 6.546177,
-4.023903, -3.876987, -4.90558,
-4.023903, -3.876987, 6.546177,
-4.023903, 2.860215, -4.90558,
-4.023903, 2.860215, 6.546177,
-4.023903, -3.876987, -4.90558,
3.895289, -3.876987, -4.90558,
-4.023903, -3.876987, 6.546177,
3.895289, -3.876987, 6.546177,
-4.023903, 2.860215, -4.90558,
3.895289, 2.860215, -4.90558,
-4.023903, 2.860215, 6.546177,
3.895289, 2.860215, 6.546177,
3.895289, -3.876987, -4.90558,
3.895289, 2.860215, -4.90558,
3.895289, -3.876987, 6.546177,
3.895289, 2.860215, 6.546177,
3.895289, -3.876987, -4.90558,
3.895289, -3.876987, 6.546177,
3.895289, 2.860215, -4.90558,
3.895289, 2.860215, 6.546177
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
var radius = 8.259391;
var distance = 36.74696;
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
mvMatrix.translate( 0.06430697, 0.5083863, -0.8202984 );
mvMatrix.scale( 1.127668, 1.325508, 0.7798118 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.74696);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
IBP<-read.table("IBP.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-IBP$V2
```

```
## Error in eval(expr, envir, enclos): object 'IBP' not found
```

```r
y<-IBP$V3
```

```
## Error in eval(expr, envir, enclos): object 'IBP' not found
```

```r
z<-IBP$V4
```

```
## Error in eval(expr, envir, enclos): object 'IBP' not found
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
-3.908575, -1.219181, -2.635271, 0, 0, 1, 1, 1,
-3.198402, 1.489641, 0.913406, 1, 0, 0, 1, 1,
-3.152014, -0.997355, -2.6689, 1, 0, 0, 1, 1,
-2.917602, 0.108669, -2.537267, 1, 0, 0, 1, 1,
-2.803038, -0.3775375, -2.450443, 1, 0, 0, 1, 1,
-2.786474, -0.5028209, -0.1261324, 1, 0, 0, 1, 1,
-2.784981, 0.1476172, -1.60311, 0, 0, 0, 1, 1,
-2.744675, 0.5061979, -2.744249, 0, 0, 0, 1, 1,
-2.635924, 0.3739083, -2.086615, 0, 0, 0, 1, 1,
-2.55876, 0.9050888, -1.846296, 0, 0, 0, 1, 1,
-2.542285, 1.240671, -0.3415747, 0, 0, 0, 1, 1,
-2.513975, 1.29962, -1.023932, 0, 0, 0, 1, 1,
-2.441747, -1.66265, -2.883753, 0, 0, 0, 1, 1,
-2.422664, -1.257388, -0.7524547, 1, 1, 1, 1, 1,
-2.368161, 0.1225308, -0.112134, 1, 1, 1, 1, 1,
-2.358829, 0.9330167, -1.59259, 1, 1, 1, 1, 1,
-2.275476, -0.4817608, -2.029187, 1, 1, 1, 1, 1,
-2.253811, 0.2872191, -1.598127, 1, 1, 1, 1, 1,
-2.22985, 0.1927149, -0.4793592, 1, 1, 1, 1, 1,
-2.216934, -1.686205, -1.924188, 1, 1, 1, 1, 1,
-2.164632, 0.2946407, -1.361749, 1, 1, 1, 1, 1,
-2.133195, -0.1050393, -3.087728, 1, 1, 1, 1, 1,
-2.128091, -0.2813397, -1.483247, 1, 1, 1, 1, 1,
-2.121322, 1.451645, -1.025638, 1, 1, 1, 1, 1,
-2.114687, 0.5856428, -1.541963, 1, 1, 1, 1, 1,
-2.106032, 0.0624713, -1.672469, 1, 1, 1, 1, 1,
-2.082347, -0.925118, -1.784037, 1, 1, 1, 1, 1,
-2.016585, -0.3360929, -2.876422, 1, 1, 1, 1, 1,
-2.009367, -0.03938818, -2.010848, 0, 0, 1, 1, 1,
-2.000889, 1.059819, 0.2963064, 1, 0, 0, 1, 1,
-1.967646, -2.035873, -1.304487, 1, 0, 0, 1, 1,
-1.948975, -0.4081243, -0.9394152, 1, 0, 0, 1, 1,
-1.948009, -1.010577, -2.834746, 1, 0, 0, 1, 1,
-1.939618, -0.8333526, -3.011565, 1, 0, 0, 1, 1,
-1.878254, -1.202247, -3.634295, 0, 0, 0, 1, 1,
-1.840506, 1.254845, 0.06327564, 0, 0, 0, 1, 1,
-1.813573, -1.73781, -2.919168, 0, 0, 0, 1, 1,
-1.793346, 0.8668509, -0.8213115, 0, 0, 0, 1, 1,
-1.763389, 1.565939, -0.1997258, 0, 0, 0, 1, 1,
-1.737949, -0.2313141, 0.7290186, 0, 0, 0, 1, 1,
-1.736407, 0.56541, -1.75701, 0, 0, 0, 1, 1,
-1.733788, 0.8350422, -0.8721033, 1, 1, 1, 1, 1,
-1.718405, -1.30243, -2.207468, 1, 1, 1, 1, 1,
-1.712775, -0.4816752, -1.75252, 1, 1, 1, 1, 1,
-1.711089, -0.6453218, -1.278482, 1, 1, 1, 1, 1,
-1.709542, 1.389708, 0.001645808, 1, 1, 1, 1, 1,
-1.701038, -0.8743232, -1.838295, 1, 1, 1, 1, 1,
-1.690741, -0.1793116, -1.704203, 1, 1, 1, 1, 1,
-1.685554, 2.17194, -0.3364288, 1, 1, 1, 1, 1,
-1.68214, 2.578227, 0.05838447, 1, 1, 1, 1, 1,
-1.67365, -0.5678976, -3.081831, 1, 1, 1, 1, 1,
-1.672641, 1.294643, -1.261431, 1, 1, 1, 1, 1,
-1.654774, 0.524186, -1.869563, 1, 1, 1, 1, 1,
-1.653776, 0.5138478, -0.5573402, 1, 1, 1, 1, 1,
-1.652867, -0.6627032, -3.205044, 1, 1, 1, 1, 1,
-1.650701, 1.589127, -2.51571, 1, 1, 1, 1, 1,
-1.63845, 0.4514437, -3.838566, 0, 0, 1, 1, 1,
-1.611448, 0.6265527, -1.727054, 1, 0, 0, 1, 1,
-1.575889, -1.414611, -0.4199824, 1, 0, 0, 1, 1,
-1.542835, 0.8169354, -0.9705577, 1, 0, 0, 1, 1,
-1.529496, -0.7047395, -0.923052, 1, 0, 0, 1, 1,
-1.523173, -0.1877622, -0.203427, 1, 0, 0, 1, 1,
-1.514473, -1.308978, -0.8800619, 0, 0, 0, 1, 1,
-1.51014, 1.150377, -1.883404, 0, 0, 0, 1, 1,
-1.509809, 0.7800629, -0.8319542, 0, 0, 0, 1, 1,
-1.508684, -0.1542857, -2.54622, 0, 0, 0, 1, 1,
-1.506057, -0.007340171, -0.6521032, 0, 0, 0, 1, 1,
-1.504037, -0.1995492, -2.43225, 0, 0, 0, 1, 1,
-1.499577, -0.5032834, -2.537601, 0, 0, 0, 1, 1,
-1.488389, -1.022673, -2.560654, 1, 1, 1, 1, 1,
-1.473063, -1.032822, -1.89916, 1, 1, 1, 1, 1,
-1.469012, -0.2052219, -2.079103, 1, 1, 1, 1, 1,
-1.46406, 0.5940063, -2.451628, 1, 1, 1, 1, 1,
-1.463715, 0.3752548, -1.43114, 1, 1, 1, 1, 1,
-1.442139, -2.200904, -3.405505, 1, 1, 1, 1, 1,
-1.43713, -0.04479692, -2.52931, 1, 1, 1, 1, 1,
-1.420767, -1.021706, -2.322776, 1, 1, 1, 1, 1,
-1.411415, 1.162648, -1.579368, 1, 1, 1, 1, 1,
-1.407725, 1.396588, -0.1734426, 1, 1, 1, 1, 1,
-1.406807, -0.06974346, -1.75721, 1, 1, 1, 1, 1,
-1.403991, -0.9922427, -1.429162, 1, 1, 1, 1, 1,
-1.40138, 0.4672269, -0.5001783, 1, 1, 1, 1, 1,
-1.396152, 1.5967, 0.8465211, 1, 1, 1, 1, 1,
-1.378257, -0.1190534, -0.1420524, 1, 1, 1, 1, 1,
-1.361074, -0.8468274, -1.647995, 0, 0, 1, 1, 1,
-1.359584, -0.5386293, -0.2556034, 1, 0, 0, 1, 1,
-1.356162, -2.522599, -2.640071, 1, 0, 0, 1, 1,
-1.339594, -0.7608573, -1.609614, 1, 0, 0, 1, 1,
-1.336065, -0.6336348, -1.500442, 1, 0, 0, 1, 1,
-1.335755, 0.5901718, -1.781219, 1, 0, 0, 1, 1,
-1.333149, 1.342705, -1.033937, 0, 0, 0, 1, 1,
-1.330345, -0.4975249, -3.040647, 0, 0, 0, 1, 1,
-1.305827, -0.9386382, -1.815061, 0, 0, 0, 1, 1,
-1.289106, -0.6509106, -1.253906, 0, 0, 0, 1, 1,
-1.280413, -0.3571611, -3.741324, 0, 0, 0, 1, 1,
-1.270244, 0.2876784, -0.3774018, 0, 0, 0, 1, 1,
-1.266882, -0.1912535, -0.3898123, 0, 0, 0, 1, 1,
-1.262066, 0.3320088, 0.001588003, 1, 1, 1, 1, 1,
-1.261829, -0.4736285, -1.309024, 1, 1, 1, 1, 1,
-1.26162, 0.2259942, -0.7252609, 1, 1, 1, 1, 1,
-1.254141, 0.6248021, -1.450849, 1, 1, 1, 1, 1,
-1.252822, -0.6482521, -2.653218, 1, 1, 1, 1, 1,
-1.250938, 1.528373, -0.9983014, 1, 1, 1, 1, 1,
-1.244834, 0.8471332, -0.1949826, 1, 1, 1, 1, 1,
-1.236629, -0.4577915, -1.514292, 1, 1, 1, 1, 1,
-1.235543, -0.4752809, -2.57316, 1, 1, 1, 1, 1,
-1.228935, -0.7288386, -0.1005338, 1, 1, 1, 1, 1,
-1.225962, -0.7442808, -4.058118, 1, 1, 1, 1, 1,
-1.222727, 0.224043, -2.435023, 1, 1, 1, 1, 1,
-1.208279, -0.0485055, -1.820254, 1, 1, 1, 1, 1,
-1.200089, -0.2727879, -1.595788, 1, 1, 1, 1, 1,
-1.197744, -0.1003071, -0.6309534, 1, 1, 1, 1, 1,
-1.18287, 1.003672, -0.8556242, 0, 0, 1, 1, 1,
-1.159191, -1.835885, -2.698082, 1, 0, 0, 1, 1,
-1.150178, 1.710647, -0.7612595, 1, 0, 0, 1, 1,
-1.135983, -0.8636287, -2.63362, 1, 0, 0, 1, 1,
-1.128924, -2.119114, -2.531605, 1, 0, 0, 1, 1,
-1.128559, -1.054759, 0.05842508, 1, 0, 0, 1, 1,
-1.125045, -0.6265469, -2.061326, 0, 0, 0, 1, 1,
-1.124592, 0.4156022, -1.585661, 0, 0, 0, 1, 1,
-1.122787, 2.233746, 1.121091, 0, 0, 0, 1, 1,
-1.122376, 0.4947214, -0.8173079, 0, 0, 0, 1, 1,
-1.12023, -0.06884323, -1.369531, 0, 0, 0, 1, 1,
-1.107229, 0.14495, -1.804721, 0, 0, 0, 1, 1,
-1.100577, 0.7070594, -0.5317574, 0, 0, 0, 1, 1,
-1.098803, -0.9700021, -1.523869, 1, 1, 1, 1, 1,
-1.098093, 0.5105069, -1.370974, 1, 1, 1, 1, 1,
-1.097027, -0.9282503, -2.037403, 1, 1, 1, 1, 1,
-1.095529, -0.5445099, -0.1842175, 1, 1, 1, 1, 1,
-1.093501, 0.2525194, -0.7533762, 1, 1, 1, 1, 1,
-1.093233, 0.9654095, -0.403971, 1, 1, 1, 1, 1,
-1.092796, 0.853797, -1.110098, 1, 1, 1, 1, 1,
-1.090649, 0.5982978, -1.794583, 1, 1, 1, 1, 1,
-1.087732, 0.1261149, 0.08357419, 1, 1, 1, 1, 1,
-1.086671, -0.07819305, -1.720816, 1, 1, 1, 1, 1,
-1.077847, 1.024108, -2.128907, 1, 1, 1, 1, 1,
-1.073043, -0.1136464, -1.352471, 1, 1, 1, 1, 1,
-1.070345, 0.375686, -0.8039506, 1, 1, 1, 1, 1,
-1.064139, -0.4386686, -1.175489, 1, 1, 1, 1, 1,
-1.060088, -0.8094448, -3.970749, 1, 1, 1, 1, 1,
-1.058819, -0.1491184, -2.61433, 0, 0, 1, 1, 1,
-1.053164, 0.5585138, -1.741404, 1, 0, 0, 1, 1,
-1.050731, -0.3618736, -2.732743, 1, 0, 0, 1, 1,
-1.04473, -0.4653458, -2.353691, 1, 0, 0, 1, 1,
-1.039714, 0.2397848, -1.271749, 1, 0, 0, 1, 1,
-1.039636, 1.292424, -2.043104, 1, 0, 0, 1, 1,
-1.034424, -1.644204, -1.899025, 0, 0, 0, 1, 1,
-1.031452, -0.2600529, -2.128478, 0, 0, 0, 1, 1,
-1.027754, 1.678191, -0.6442568, 0, 0, 0, 1, 1,
-1.014732, -0.375379, -1.669658, 0, 0, 0, 1, 1,
-1.012968, -0.3039706, -1.58449, 0, 0, 0, 1, 1,
-1.011579, 0.7044994, -1.344498, 0, 0, 0, 1, 1,
-1.007742, 0.6060662, -0.9175056, 0, 0, 0, 1, 1,
-1.003896, 0.5152407, 0.3498717, 1, 1, 1, 1, 1,
-1.003071, -0.7076542, -4.478738, 1, 1, 1, 1, 1,
-1.000204, 0.7131501, 1.598115, 1, 1, 1, 1, 1,
-0.9968624, 0.3794035, -0.4312185, 1, 1, 1, 1, 1,
-0.9953669, 0.941685, -0.5761804, 1, 1, 1, 1, 1,
-0.9930082, -1.47523, -2.528423, 1, 1, 1, 1, 1,
-0.9880183, 0.6124241, 0.2613561, 1, 1, 1, 1, 1,
-0.9739077, 1.383263, 0.4639753, 1, 1, 1, 1, 1,
-0.972061, -0.7674656, -4.121916, 1, 1, 1, 1, 1,
-0.9717479, -1.008783, -2.386056, 1, 1, 1, 1, 1,
-0.9697084, -0.3110029, -1.915305, 1, 1, 1, 1, 1,
-0.9673518, 1.332793, -0.9895999, 1, 1, 1, 1, 1,
-0.9638116, -0.42625, -1.553208, 1, 1, 1, 1, 1,
-0.9608799, -1.072777, -2.810986, 1, 1, 1, 1, 1,
-0.9549121, 1.521645, -0.5119614, 1, 1, 1, 1, 1,
-0.9542452, -0.07453287, -1.145918, 0, 0, 1, 1, 1,
-0.9535222, 0.5901654, -0.2202433, 1, 0, 0, 1, 1,
-0.9524536, 0.9418412, -2.574155, 1, 0, 0, 1, 1,
-0.9505926, -0.6621468, -2.806532, 1, 0, 0, 1, 1,
-0.9463307, 0.3151013, -0.2461584, 1, 0, 0, 1, 1,
-0.9443803, 0.2440189, 0.8565195, 1, 0, 0, 1, 1,
-0.939905, -0.2899895, -1.89756, 0, 0, 0, 1, 1,
-0.9344776, 0.3120039, -0.5366948, 0, 0, 0, 1, 1,
-0.9342106, 0.3698982, -1.98679, 0, 0, 0, 1, 1,
-0.9272904, -0.2473592, -0.04420426, 0, 0, 0, 1, 1,
-0.9266536, -0.4133461, -2.894838, 0, 0, 0, 1, 1,
-0.9238189, 0.1502172, -0.7841282, 0, 0, 0, 1, 1,
-0.917487, 0.3616416, -1.659509, 0, 0, 0, 1, 1,
-0.9168065, -0.4229955, -0.7777292, 1, 1, 1, 1, 1,
-0.915141, 1.012544, -2.062725, 1, 1, 1, 1, 1,
-0.9151354, 1.115031, -1.525556, 1, 1, 1, 1, 1,
-0.9127777, -0.8241149, -1.572255, 1, 1, 1, 1, 1,
-0.9116955, 0.2502746, -2.715357, 1, 1, 1, 1, 1,
-0.907598, -0.1356887, -0.6548631, 1, 1, 1, 1, 1,
-0.9051331, -0.3587826, -1.824032, 1, 1, 1, 1, 1,
-0.903477, -1.426028, -3.557442, 1, 1, 1, 1, 1,
-0.9016721, 1.769261, 0.2616446, 1, 1, 1, 1, 1,
-0.8979048, -1.365984, -2.045656, 1, 1, 1, 1, 1,
-0.8963654, -0.01108371, -2.313873, 1, 1, 1, 1, 1,
-0.8862086, 2.335483, 1.740872, 1, 1, 1, 1, 1,
-0.8852583, 1.885071, 0.9588383, 1, 1, 1, 1, 1,
-0.8843426, 0.3739735, -2.213743, 1, 1, 1, 1, 1,
-0.8760418, 1.014201, -1.65571, 1, 1, 1, 1, 1,
-0.8693069, -1.602202, -2.568819, 0, 0, 1, 1, 1,
-0.869185, -0.9797095, -1.504495, 1, 0, 0, 1, 1,
-0.8669545, -1.498817, -3.091236, 1, 0, 0, 1, 1,
-0.8655747, -0.9890742, -1.763401, 1, 0, 0, 1, 1,
-0.8569334, 1.506395, -1.913852, 1, 0, 0, 1, 1,
-0.8522641, -0.3611121, -2.084823, 1, 0, 0, 1, 1,
-0.8486398, 0.4057789, -0.712791, 0, 0, 0, 1, 1,
-0.8432117, 0.8277523, -1.073074, 0, 0, 0, 1, 1,
-0.8413247, 0.2737997, -1.474257, 0, 0, 0, 1, 1,
-0.8395187, 0.1363366, -2.879457, 0, 0, 0, 1, 1,
-0.8364487, -0.09292334, -0.9155432, 0, 0, 0, 1, 1,
-0.8355759, -0.7442987, -2.677999, 0, 0, 0, 1, 1,
-0.8308893, -0.0895111, -2.248792, 0, 0, 0, 1, 1,
-0.8308045, 0.6527118, 0.190587, 1, 1, 1, 1, 1,
-0.8301138, -1.456644, -2.454806, 1, 1, 1, 1, 1,
-0.8294528, -0.1715815, -3.172354, 1, 1, 1, 1, 1,
-0.823001, 0.2893857, -0.3169052, 1, 1, 1, 1, 1,
-0.8171957, -0.4846921, -1.644649, 1, 1, 1, 1, 1,
-0.814706, 1.438219, -0.5218822, 1, 1, 1, 1, 1,
-0.8122947, 2.115248, -1.28266, 1, 1, 1, 1, 1,
-0.8117184, -2.568574, -4.185091, 1, 1, 1, 1, 1,
-0.8092139, 1.251382, -0.4028481, 1, 1, 1, 1, 1,
-0.8065015, 1.254513, -1.18301, 1, 1, 1, 1, 1,
-0.8041025, 0.9119979, -0.5413903, 1, 1, 1, 1, 1,
-0.8034348, 0.6883343, -2.141749, 1, 1, 1, 1, 1,
-0.8031504, -0.297155, -0.975948, 1, 1, 1, 1, 1,
-0.7951821, 0.1833361, 0.03965821, 1, 1, 1, 1, 1,
-0.7946643, 1.342807, -0.3784899, 1, 1, 1, 1, 1,
-0.7919492, -0.5445679, -3.134456, 0, 0, 1, 1, 1,
-0.7893757, 0.9158792, -0.3182689, 1, 0, 0, 1, 1,
-0.788255, 1.126435, 0.03377952, 1, 0, 0, 1, 1,
-0.7877746, 0.9675397, -0.7118862, 1, 0, 0, 1, 1,
-0.7834763, 0.1413955, -2.992951, 1, 0, 0, 1, 1,
-0.7803668, 0.02904338, -0.5210949, 1, 0, 0, 1, 1,
-0.7801877, 0.6925619, -1.227482, 0, 0, 0, 1, 1,
-0.7703956, 1.239477, -0.1109351, 0, 0, 0, 1, 1,
-0.7702395, -0.05507294, -3.546849, 0, 0, 0, 1, 1,
-0.768745, -1.386818, -1.634785, 0, 0, 0, 1, 1,
-0.7599669, 0.5008758, -1.45331, 0, 0, 0, 1, 1,
-0.7560307, -1.031054, -4.365365, 0, 0, 0, 1, 1,
-0.7506928, -0.76898, -1.832655, 0, 0, 0, 1, 1,
-0.740791, 0.001672528, 1.496538, 1, 1, 1, 1, 1,
-0.7405986, 0.2135184, -2.75029, 1, 1, 1, 1, 1,
-0.7330337, -1.385438, -2.488646, 1, 1, 1, 1, 1,
-0.7312573, 1.225115, -0.7355032, 1, 1, 1, 1, 1,
-0.7294071, -0.5845738, -2.635916, 1, 1, 1, 1, 1,
-0.7287225, 1.050109, 0.8792542, 1, 1, 1, 1, 1,
-0.7226475, -0.4501482, -2.784944, 1, 1, 1, 1, 1,
-0.7197729, -1.272248, -3.625304, 1, 1, 1, 1, 1,
-0.7150618, -1.444095, -1.684448, 1, 1, 1, 1, 1,
-0.7140614, -3.778873, -3.721821, 1, 1, 1, 1, 1,
-0.7127168, -0.1931452, -1.328971, 1, 1, 1, 1, 1,
-0.7058225, 0.2320564, 0.7866348, 1, 1, 1, 1, 1,
-0.7039887, -1.064132, -2.741663, 1, 1, 1, 1, 1,
-0.7028899, 2.146185, 1.449121, 1, 1, 1, 1, 1,
-0.701219, 0.1660155, -0.1288784, 1, 1, 1, 1, 1,
-0.6990171, 0.9107339, 0.4971916, 0, 0, 1, 1, 1,
-0.6941645, 0.9208379, 0.293633, 1, 0, 0, 1, 1,
-0.6860927, 0.3334208, -0.3792809, 1, 0, 0, 1, 1,
-0.6858739, -0.539645, -1.775212, 1, 0, 0, 1, 1,
-0.675245, -0.4588215, -1.165636, 1, 0, 0, 1, 1,
-0.6715173, -0.4767029, -3.062519, 1, 0, 0, 1, 1,
-0.6694643, 1.785928, -0.7108963, 0, 0, 0, 1, 1,
-0.6690714, 0.2832288, -0.6166092, 0, 0, 0, 1, 1,
-0.663815, -2.074209, -0.3237442, 0, 0, 0, 1, 1,
-0.6564644, 0.7865595, -0.274985, 0, 0, 0, 1, 1,
-0.6453832, 1.184628, 0.001418676, 0, 0, 0, 1, 1,
-0.6440991, -0.8164496, -2.304993, 0, 0, 0, 1, 1,
-0.6436585, -0.5360377, -0.8197302, 0, 0, 0, 1, 1,
-0.6390731, -1.836792, -2.213716, 1, 1, 1, 1, 1,
-0.6357011, -1.084599, -3.166051, 1, 1, 1, 1, 1,
-0.6316351, -0.4281796, -1.461015, 1, 1, 1, 1, 1,
-0.6309066, -1.305614, -3.533152, 1, 1, 1, 1, 1,
-0.630716, 1.293221, -0.7583935, 1, 1, 1, 1, 1,
-0.6304168, -0.1500643, -1.699124, 1, 1, 1, 1, 1,
-0.6254605, -0.5608315, -2.900543, 1, 1, 1, 1, 1,
-0.6254209, -0.561208, -3.035372, 1, 1, 1, 1, 1,
-0.6231648, -0.08241165, -2.141263, 1, 1, 1, 1, 1,
-0.6139591, 0.3796616, -1.27571, 1, 1, 1, 1, 1,
-0.6084771, -0.4454996, -3.175339, 1, 1, 1, 1, 1,
-0.604339, 0.4200764, -2.137363, 1, 1, 1, 1, 1,
-0.6026211, 0.4561033, -3.030742, 1, 1, 1, 1, 1,
-0.6008639, 0.5297042, -0.5999492, 1, 1, 1, 1, 1,
-0.5996944, -0.6086047, -3.014611, 1, 1, 1, 1, 1,
-0.5981063, 0.9337536, -1.606547, 0, 0, 1, 1, 1,
-0.5976409, 0.5275659, 0.3578594, 1, 0, 0, 1, 1,
-0.5972252, -1.865528, -1.276075, 1, 0, 0, 1, 1,
-0.5944219, -0.9550311, -4.290968, 1, 0, 0, 1, 1,
-0.5935959, -1.740152, -4.070475, 1, 0, 0, 1, 1,
-0.5929971, 1.106539, -0.1437886, 1, 0, 0, 1, 1,
-0.5859293, 0.0005517764, -1.370343, 0, 0, 0, 1, 1,
-0.5849277, 2.632143, 1.581003, 0, 0, 0, 1, 1,
-0.5835863, -0.620033, -2.901313, 0, 0, 0, 1, 1,
-0.5820166, 0.2725675, -3.28088, 0, 0, 0, 1, 1,
-0.580567, 0.7425125, 1.325247, 0, 0, 0, 1, 1,
-0.5747547, 0.67344, -0.1075832, 0, 0, 0, 1, 1,
-0.5742412, -2.581163, -1.721642, 0, 0, 0, 1, 1,
-0.5657062, -0.9220778, -2.192868, 1, 1, 1, 1, 1,
-0.565345, 0.7779487, 0.3419153, 1, 1, 1, 1, 1,
-0.563747, -0.833387, -1.707345, 1, 1, 1, 1, 1,
-0.556933, 0.4991357, -0.8890756, 1, 1, 1, 1, 1,
-0.5558776, -1.358819, -2.283488, 1, 1, 1, 1, 1,
-0.5540497, 1.315155, -0.4607809, 1, 1, 1, 1, 1,
-0.5528242, 0.4240625, -0.8004944, 1, 1, 1, 1, 1,
-0.5493341, 0.6509384, -0.5435611, 1, 1, 1, 1, 1,
-0.5415503, 1.839995, 1.221334, 1, 1, 1, 1, 1,
-0.5407203, -0.7907883, -2.773403, 1, 1, 1, 1, 1,
-0.5373415, 0.9100567, 0.6636704, 1, 1, 1, 1, 1,
-0.5366787, 0.2066088, -0.906235, 1, 1, 1, 1, 1,
-0.5297092, 1.997293, -0.6170219, 1, 1, 1, 1, 1,
-0.5280941, 0.9305004, -0.2309124, 1, 1, 1, 1, 1,
-0.5246891, 0.9425133, -0.8910573, 1, 1, 1, 1, 1,
-0.5199115, -0.08586085, -3.038821, 0, 0, 1, 1, 1,
-0.5103383, 1.804937, -1.129694, 1, 0, 0, 1, 1,
-0.5075465, -0.9258597, -2.621651, 1, 0, 0, 1, 1,
-0.5070211, -1.060946, -3.336467, 1, 0, 0, 1, 1,
-0.5052071, 0.9857256, -2.697992, 1, 0, 0, 1, 1,
-0.4975248, 0.5678037, 0.2405731, 1, 0, 0, 1, 1,
-0.48923, 0.2529291, -0.6783695, 0, 0, 0, 1, 1,
-0.4883304, -0.5756899, -3.506857, 0, 0, 0, 1, 1,
-0.4760635, 0.6060961, -1.305679, 0, 0, 0, 1, 1,
-0.4758651, -0.9354121, -1.476442, 0, 0, 0, 1, 1,
-0.4735019, 0.532758, -1.154925, 0, 0, 0, 1, 1,
-0.4731846, 2.39362, 1.14598, 0, 0, 0, 1, 1,
-0.4703924, -0.1430322, -0.2956781, 0, 0, 0, 1, 1,
-0.4695083, 1.154039, -1.130373, 1, 1, 1, 1, 1,
-0.4681995, 0.1865861, -2.318809, 1, 1, 1, 1, 1,
-0.4656246, 0.6244068, -2.07814, 1, 1, 1, 1, 1,
-0.463845, -0.5828037, -1.568738, 1, 1, 1, 1, 1,
-0.4626532, 0.7818099, -0.5389788, 1, 1, 1, 1, 1,
-0.4609277, 0.8319827, 0.3993959, 1, 1, 1, 1, 1,
-0.4570162, 1.284463, 0.972306, 1, 1, 1, 1, 1,
-0.4548927, -0.05283744, 0.6854854, 1, 1, 1, 1, 1,
-0.4535046, 0.04992883, -3.454653, 1, 1, 1, 1, 1,
-0.4474171, 0.7444583, -1.085485, 1, 1, 1, 1, 1,
-0.4467527, 0.3616945, -1.267804, 1, 1, 1, 1, 1,
-0.4457892, 1.048367, 0.8022513, 1, 1, 1, 1, 1,
-0.4325114, -1.219256, -3.702822, 1, 1, 1, 1, 1,
-0.4252444, -0.3543101, -2.235391, 1, 1, 1, 1, 1,
-0.4219497, 0.3131781, -0.6373305, 1, 1, 1, 1, 1,
-0.4170178, -0.3984303, -1.691901, 0, 0, 1, 1, 1,
-0.4156439, 0.0430508, -0.5164145, 1, 0, 0, 1, 1,
-0.4107341, 0.5128788, -1.315416, 1, 0, 0, 1, 1,
-0.4106458, 0.2581578, -0.591404, 1, 0, 0, 1, 1,
-0.4102805, 0.1966187, -0.7399941, 1, 0, 0, 1, 1,
-0.4078591, 0.4042844, -2.12681, 1, 0, 0, 1, 1,
-0.4076755, -0.1213334, 0.1052797, 0, 0, 0, 1, 1,
-0.4054036, -0.08384632, -4.000486, 0, 0, 0, 1, 1,
-0.4035769, -0.9938754, -3.283188, 0, 0, 0, 1, 1,
-0.4006559, -0.9443573, -3.045173, 0, 0, 0, 1, 1,
-0.4001998, -1.359223, -3.577488, 0, 0, 0, 1, 1,
-0.3990068, 0.5092846, 0.7458727, 0, 0, 0, 1, 1,
-0.3982874, -0.1687416, -0.8454403, 0, 0, 0, 1, 1,
-0.390164, -0.5327834, -2.080293, 1, 1, 1, 1, 1,
-0.3845271, -0.7914272, -1.891353, 1, 1, 1, 1, 1,
-0.3821455, 1.101511, -0.8403269, 1, 1, 1, 1, 1,
-0.3779827, 0.4435166, -1.947967, 1, 1, 1, 1, 1,
-0.3753555, -0.4194897, -2.339227, 1, 1, 1, 1, 1,
-0.3730724, -0.07479822, -1.703123, 1, 1, 1, 1, 1,
-0.3686701, -0.2669889, -1.513021, 1, 1, 1, 1, 1,
-0.3683073, 0.5970781, -1.016097, 1, 1, 1, 1, 1,
-0.3665559, 0.3391986, -0.8858926, 1, 1, 1, 1, 1,
-0.3633101, -0.590172, -1.889522, 1, 1, 1, 1, 1,
-0.3602599, 0.229701, -2.181975, 1, 1, 1, 1, 1,
-0.3570074, -0.2803832, -1.7383, 1, 1, 1, 1, 1,
-0.3555609, -0.1828624, -1.9043, 1, 1, 1, 1, 1,
-0.3508908, 0.322593, -0.1749821, 1, 1, 1, 1, 1,
-0.3501182, 0.7909681, -2.490856, 1, 1, 1, 1, 1,
-0.3480642, -1.424463, -0.83344, 0, 0, 1, 1, 1,
-0.3474769, 0.3326031, -0.2987929, 1, 0, 0, 1, 1,
-0.3440285, -1.22028, -3.94739, 1, 0, 0, 1, 1,
-0.3438067, 0.2298395, -3.120387, 1, 0, 0, 1, 1,
-0.3426564, 0.4735738, -0.1440881, 1, 0, 0, 1, 1,
-0.3409395, -0.8270682, -2.851877, 1, 0, 0, 1, 1,
-0.3403535, -0.9868062, -1.107046, 0, 0, 0, 1, 1,
-0.3399989, 0.1644064, -3.185883, 0, 0, 0, 1, 1,
-0.3364129, -0.1760724, -2.867514, 0, 0, 0, 1, 1,
-0.3360908, -0.4921215, -3.797247, 0, 0, 0, 1, 1,
-0.3335135, -1.194857, -3.662257, 0, 0, 0, 1, 1,
-0.3330591, 0.2874061, -1.615378, 0, 0, 0, 1, 1,
-0.3240832, 0.4057663, -1.930363, 0, 0, 0, 1, 1,
-0.319538, -0.4954783, -2.422835, 1, 1, 1, 1, 1,
-0.3181548, 0.7819782, -3.309025, 1, 1, 1, 1, 1,
-0.316869, 0.6801345, 0.6052086, 1, 1, 1, 1, 1,
-0.3148223, -0.1454505, -2.069648, 1, 1, 1, 1, 1,
-0.3138199, -0.5350404, -4.738807, 1, 1, 1, 1, 1,
-0.3131661, 2.335516, -1.112656, 1, 1, 1, 1, 1,
-0.3115894, 0.3271196, -1.715518, 1, 1, 1, 1, 1,
-0.311241, 1.230608, -2.076342, 1, 1, 1, 1, 1,
-0.3083919, 1.245924, -0.4156518, 1, 1, 1, 1, 1,
-0.3046703, -1.083971, -3.52708, 1, 1, 1, 1, 1,
-0.3030239, 1.074585, 0.2514851, 1, 1, 1, 1, 1,
-0.2989177, 0.3119811, -0.1047619, 1, 1, 1, 1, 1,
-0.2973664, 0.5563431, -0.1475359, 1, 1, 1, 1, 1,
-0.297281, -0.110315, -4.071673, 1, 1, 1, 1, 1,
-0.2951142, 0.2775212, -0.7346635, 1, 1, 1, 1, 1,
-0.2906763, -1.055825, -2.203929, 0, 0, 1, 1, 1,
-0.2890348, 1.374556, -0.9806566, 1, 0, 0, 1, 1,
-0.2876939, -0.3894566, -3.402452, 1, 0, 0, 1, 1,
-0.2826277, 0.3465118, 0.4627401, 1, 0, 0, 1, 1,
-0.2818714, 0.256189, -0.1408793, 1, 0, 0, 1, 1,
-0.2817848, -0.898187, -1.766993, 1, 0, 0, 1, 1,
-0.281611, 0.0282771, -1.831964, 0, 0, 0, 1, 1,
-0.2785645, -1.435366, -2.689366, 0, 0, 0, 1, 1,
-0.276807, -0.1322115, -3.262963, 0, 0, 0, 1, 1,
-0.2753415, -0.6246181, -3.875783, 0, 0, 0, 1, 1,
-0.2742828, 1.529063, -0.9555372, 0, 0, 0, 1, 1,
-0.2728451, 1.004049, -1.758872, 0, 0, 0, 1, 1,
-0.2727986, -0.2177759, -1.265909, 0, 0, 0, 1, 1,
-0.2687, 2.181644, -0.8149823, 1, 1, 1, 1, 1,
-0.2642987, -0.1781678, -1.971559, 1, 1, 1, 1, 1,
-0.2641526, 0.3640047, -2.586676, 1, 1, 1, 1, 1,
-0.2640512, -1.108146, -0.9342797, 1, 1, 1, 1, 1,
-0.2625903, -0.3326088, -2.789963, 1, 1, 1, 1, 1,
-0.2567113, -0.8198796, -3.12519, 1, 1, 1, 1, 1,
-0.2553069, -2.044469, -2.719463, 1, 1, 1, 1, 1,
-0.2542427, 0.06162015, -2.494673, 1, 1, 1, 1, 1,
-0.2517517, -0.5024539, -3.782464, 1, 1, 1, 1, 1,
-0.2428824, -0.7212108, -3.063279, 1, 1, 1, 1, 1,
-0.2423198, -0.5042408, -3.35228, 1, 1, 1, 1, 1,
-0.2371251, -0.1455634, -2.985774, 1, 1, 1, 1, 1,
-0.2354094, 0.6663132, 2.129407, 1, 1, 1, 1, 1,
-0.231998, 1.610773, -0.08194164, 1, 1, 1, 1, 1,
-0.2239214, -0.6825195, -3.198524, 1, 1, 1, 1, 1,
-0.2185008, 1.112594, -0.5631334, 0, 0, 1, 1, 1,
-0.2156587, -0.1849456, -3.547589, 1, 0, 0, 1, 1,
-0.2153392, -0.2915006, -3.235649, 1, 0, 0, 1, 1,
-0.210549, -0.7141747, -4.622615, 1, 0, 0, 1, 1,
-0.2101813, -0.6652797, -1.510693, 1, 0, 0, 1, 1,
-0.208253, 0.1804948, -1.063761, 1, 0, 0, 1, 1,
-0.2024434, -0.7338144, -1.089535, 0, 0, 0, 1, 1,
-0.2017644, -2.361434, -3.015912, 0, 0, 0, 1, 1,
-0.1944931, -1.597464, -3.151375, 0, 0, 0, 1, 1,
-0.1941413, -0.3896241, -1.469177, 0, 0, 0, 1, 1,
-0.1932441, -0.3515644, -2.302564, 0, 0, 0, 1, 1,
-0.1915764, 0.1808469, -0.3873786, 0, 0, 0, 1, 1,
-0.1911296, -0.2941848, -4.450333, 0, 0, 0, 1, 1,
-0.1880444, 0.6748186, 0.4863727, 1, 1, 1, 1, 1,
-0.1877213, -0.8855177, -3.329424, 1, 1, 1, 1, 1,
-0.1858983, 0.5292628, 0.7332838, 1, 1, 1, 1, 1,
-0.1858336, 0.4999839, 0.8099449, 1, 1, 1, 1, 1,
-0.1823276, 1.177693, 1.545621, 1, 1, 1, 1, 1,
-0.181006, 0.01304383, -1.740818, 1, 1, 1, 1, 1,
-0.1803054, 0.4110823, -0.6833725, 1, 1, 1, 1, 1,
-0.1792164, 0.02654717, -1.209327, 1, 1, 1, 1, 1,
-0.1772097, -0.06764793, -3.835553, 1, 1, 1, 1, 1,
-0.1741865, 0.9830215, -0.9256666, 1, 1, 1, 1, 1,
-0.1717447, -1.108119, -3.985865, 1, 1, 1, 1, 1,
-0.1702243, 0.504048, -0.8550841, 1, 1, 1, 1, 1,
-0.1668341, 0.3649944, -1.309079, 1, 1, 1, 1, 1,
-0.1653191, 2.431439, 0.9300887, 1, 1, 1, 1, 1,
-0.1611159, 1.173583, -1.338529, 1, 1, 1, 1, 1,
-0.156978, -0.7898357, -4.396939, 0, 0, 1, 1, 1,
-0.1546416, -0.7109371, -3.670259, 1, 0, 0, 1, 1,
-0.1516532, 0.828533, 0.0737243, 1, 0, 0, 1, 1,
-0.1493713, 0.05329913, -0.1953974, 1, 0, 0, 1, 1,
-0.1463681, 1.983112, -1.852514, 1, 0, 0, 1, 1,
-0.143342, 0.4067506, -0.04421796, 1, 0, 0, 1, 1,
-0.1324945, -0.4413178, -2.419388, 0, 0, 0, 1, 1,
-0.1316708, -1.956884, -3.003354, 0, 0, 0, 1, 1,
-0.125364, -1.713845, -0.8730671, 0, 0, 0, 1, 1,
-0.1210597, -0.9221241, -3.321119, 0, 0, 0, 1, 1,
-0.1201024, 0.6324444, -0.2054665, 0, 0, 0, 1, 1,
-0.1200353, 0.6085216, -1.609514, 0, 0, 0, 1, 1,
-0.1072789, -0.2138522, -1.73669, 0, 0, 0, 1, 1,
-0.1047206, 1.847035, -2.091453, 1, 1, 1, 1, 1,
-0.1031837, -0.06825043, -2.848119, 1, 1, 1, 1, 1,
-0.1019409, 0.3751334, -1.389679, 1, 1, 1, 1, 1,
-0.1005014, -0.4119371, -2.711711, 1, 1, 1, 1, 1,
-0.09839201, -0.934197, -1.046636, 1, 1, 1, 1, 1,
-0.09552556, 0.5154805, -1.342577, 1, 1, 1, 1, 1,
-0.09140461, -0.5996891, -4.555012, 1, 1, 1, 1, 1,
-0.09129211, 1.32534, 0.6387984, 1, 1, 1, 1, 1,
-0.09070896, 0.6048959, 0.1218182, 1, 1, 1, 1, 1,
-0.09036911, 0.8813563, -1.003056, 1, 1, 1, 1, 1,
-0.09032407, 1.388562, -0.2767166, 1, 1, 1, 1, 1,
-0.08976301, 0.4928928, -2.19337, 1, 1, 1, 1, 1,
-0.08721929, -0.1202343, -1.4497, 1, 1, 1, 1, 1,
-0.07951801, 2.193864, 0.1328681, 1, 1, 1, 1, 1,
-0.07900113, -1.46623, -4.184363, 1, 1, 1, 1, 1,
-0.07596072, -1.464686, -1.712306, 0, 0, 1, 1, 1,
-0.07554005, -1.769045, -2.128601, 1, 0, 0, 1, 1,
-0.06776818, 0.5472925, -0.4717948, 1, 0, 0, 1, 1,
-0.06766479, -1.074952, -2.333101, 1, 0, 0, 1, 1,
-0.05151348, -0.4181128, -2.550832, 1, 0, 0, 1, 1,
-0.0490348, -0.7005126, -3.235103, 1, 0, 0, 1, 1,
-0.03698724, 1.081022, -0.6377987, 0, 0, 0, 1, 1,
-0.03678775, -0.6303309, -2.825974, 0, 0, 0, 1, 1,
-0.03480192, -1.0838, -3.182031, 0, 0, 0, 1, 1,
-0.03446231, 0.431166, -0.8665275, 0, 0, 0, 1, 1,
-0.03279619, -0.4726684, -3.344673, 0, 0, 0, 1, 1,
-0.03006257, -0.721919, -2.277421, 0, 0, 0, 1, 1,
-0.02640819, 0.09325722, -1.313362, 0, 0, 0, 1, 1,
-0.0240702, 1.727159, -1.123627, 1, 1, 1, 1, 1,
-0.0235098, -0.2349603, -2.216488, 1, 1, 1, 1, 1,
-0.009821679, 0.6502534, 0.04971185, 1, 1, 1, 1, 1,
-0.008359778, -0.6063981, -3.879168, 1, 1, 1, 1, 1,
-0.004521246, -1.072309, -2.952367, 1, 1, 1, 1, 1,
-0.002169807, -0.3526732, -3.205498, 1, 1, 1, 1, 1,
0.004447533, -2.606173, 3.268935, 1, 1, 1, 1, 1,
0.007023696, -0.9485481, 2.915557, 1, 1, 1, 1, 1,
0.007094117, -0.3351718, 2.922872, 1, 1, 1, 1, 1,
0.008594676, -1.026697, 3.039007, 1, 1, 1, 1, 1,
0.009822966, -0.349864, 3.02046, 1, 1, 1, 1, 1,
0.01062524, 0.3788902, 1.171308, 1, 1, 1, 1, 1,
0.01313845, -1.784497, 3.865025, 1, 1, 1, 1, 1,
0.01462713, 0.5543164, 2.246814, 1, 1, 1, 1, 1,
0.01925833, 0.1144481, 0.1625014, 1, 1, 1, 1, 1,
0.02191306, 0.2379238, -1.121019, 0, 0, 1, 1, 1,
0.02258225, 0.9313102, 0.7417076, 1, 0, 0, 1, 1,
0.02531763, 0.05729765, -0.9772955, 1, 0, 0, 1, 1,
0.02630653, 0.3642573, 0.3540899, 1, 0, 0, 1, 1,
0.03165141, 1.731004, 0.289685, 1, 0, 0, 1, 1,
0.03270538, -0.8888873, 4.516804, 1, 0, 0, 1, 1,
0.03501277, -1.391298, 3.028145, 0, 0, 0, 1, 1,
0.03983003, -0.9652913, 3.68721, 0, 0, 0, 1, 1,
0.04431915, -1.944518, 4.733222, 0, 0, 0, 1, 1,
0.0489843, 0.6655284, 2.560702, 0, 0, 0, 1, 1,
0.05408285, 0.356211, -0.801111, 0, 0, 0, 1, 1,
0.05649877, 1.116589, -0.4876371, 0, 0, 0, 1, 1,
0.0574819, -0.3869676, 3.341381, 0, 0, 0, 1, 1,
0.06487754, 0.1764594, 0.2468179, 1, 1, 1, 1, 1,
0.06766035, 0.01039333, -0.08356977, 1, 1, 1, 1, 1,
0.07000093, -1.749748, 3.529698, 1, 1, 1, 1, 1,
0.07028735, 0.3171884, 1.704554, 1, 1, 1, 1, 1,
0.07751196, 0.4277366, 0.2634851, 1, 1, 1, 1, 1,
0.07812241, 0.251275, 0.6166723, 1, 1, 1, 1, 1,
0.07962386, -0.4735934, 4.025594, 1, 1, 1, 1, 1,
0.07986189, 0.3808757, 0.2556689, 1, 1, 1, 1, 1,
0.08164734, -0.6030563, 1.499176, 1, 1, 1, 1, 1,
0.08213566, 0.6396101, 1.143205, 1, 1, 1, 1, 1,
0.0834071, 1.211454, -0.6336594, 1, 1, 1, 1, 1,
0.08484552, 0.2561598, 0.55734, 1, 1, 1, 1, 1,
0.0853413, -1.820614, 5.396736, 1, 1, 1, 1, 1,
0.08621654, -0.2145196, 6.093855, 1, 1, 1, 1, 1,
0.08754995, -0.1112803, 2.62148, 1, 1, 1, 1, 1,
0.08769269, -1.13503, 2.65649, 0, 0, 1, 1, 1,
0.09440781, 0.221771, 2.264261, 1, 0, 0, 1, 1,
0.1005709, 0.7480878, 1.349755, 1, 0, 0, 1, 1,
0.1037293, -0.7178097, 2.974938, 1, 0, 0, 1, 1,
0.1074377, -1.435531, 2.889985, 1, 0, 0, 1, 1,
0.1115205, 0.685536, -0.3733879, 1, 0, 0, 1, 1,
0.1121874, -1.303199, 2.289021, 0, 0, 0, 1, 1,
0.1158767, -0.05868379, 1.399087, 0, 0, 0, 1, 1,
0.1180651, 0.307507, -0.1615373, 0, 0, 0, 1, 1,
0.1185859, 0.6185043, 1.079623, 0, 0, 0, 1, 1,
0.118985, -1.474219, 3.70365, 0, 0, 0, 1, 1,
0.1220556, -0.4257193, 3.135099, 0, 0, 0, 1, 1,
0.1227262, 0.8297848, 1.974419, 0, 0, 0, 1, 1,
0.1231239, -0.8837278, 2.818743, 1, 1, 1, 1, 1,
0.1262108, -0.7354361, 1.752085, 1, 1, 1, 1, 1,
0.1324361, 0.4374692, -1.75215, 1, 1, 1, 1, 1,
0.1333677, 2.080199, 0.01206032, 1, 1, 1, 1, 1,
0.1352333, -0.4429634, 2.902371, 1, 1, 1, 1, 1,
0.1358046, 0.3019665, 0.4387564, 1, 1, 1, 1, 1,
0.1398735, -0.2861909, 1.266183, 1, 1, 1, 1, 1,
0.1482574, -0.3498477, 3.253124, 1, 1, 1, 1, 1,
0.1499347, 0.1079312, 0.9152684, 1, 1, 1, 1, 1,
0.1507674, 1.182341, 2.249026, 1, 1, 1, 1, 1,
0.1523371, 1.063438, 0.9415195, 1, 1, 1, 1, 1,
0.1532074, 1.129367, 1.246767, 1, 1, 1, 1, 1,
0.1552589, -0.8010636, 3.468249, 1, 1, 1, 1, 1,
0.1577325, 2.44088, 0.685421, 1, 1, 1, 1, 1,
0.1586094, -1.553741, 2.712823, 1, 1, 1, 1, 1,
0.1622805, 1.402629, -0.2616928, 0, 0, 1, 1, 1,
0.1669315, 0.09366433, 0.07932597, 1, 0, 0, 1, 1,
0.1681836, 0.3425227, -0.4324071, 1, 0, 0, 1, 1,
0.1690497, -2.019721, 5.216766, 1, 0, 0, 1, 1,
0.1693348, 1.379471, 1.070973, 1, 0, 0, 1, 1,
0.1696436, 0.02461882, 3.553811, 1, 0, 0, 1, 1,
0.171022, -1.03519, 1.85466, 0, 0, 0, 1, 1,
0.1715879, 0.6400607, 1.395874, 0, 0, 0, 1, 1,
0.174104, -0.7949051, 3.131444, 0, 0, 0, 1, 1,
0.1767272, 1.217021, -0.3674576, 0, 0, 0, 1, 1,
0.1805524, 1.687921, 2.254653, 0, 0, 0, 1, 1,
0.1861814, -0.9502636, 4.295238, 0, 0, 0, 1, 1,
0.189463, 0.310967, 0.6340422, 0, 0, 0, 1, 1,
0.1918826, -0.008804605, 2.046482, 1, 1, 1, 1, 1,
0.1926205, 0.6973345, 0.732411, 1, 1, 1, 1, 1,
0.1963752, 1.320336, -1.034062, 1, 1, 1, 1, 1,
0.1969332, -1.207948, 2.703076, 1, 1, 1, 1, 1,
0.1983184, -0.4014234, -0.0537048, 1, 1, 1, 1, 1,
0.1996367, 0.6161062, 1.209384, 1, 1, 1, 1, 1,
0.200336, -1.867784, 1.811072, 1, 1, 1, 1, 1,
0.2011867, -0.3665317, 2.329976, 1, 1, 1, 1, 1,
0.2038872, -0.8209398, 2.708682, 1, 1, 1, 1, 1,
0.2060742, 0.7224583, -1.367884, 1, 1, 1, 1, 1,
0.2093963, 2.7621, -0.9076881, 1, 1, 1, 1, 1,
0.210014, -0.05059, 1.343107, 1, 1, 1, 1, 1,
0.2115713, -0.006718998, 0.2487733, 1, 1, 1, 1, 1,
0.2151373, -0.804318, 3.918187, 1, 1, 1, 1, 1,
0.2166584, -1.421281, 4.002327, 1, 1, 1, 1, 1,
0.2193047, -0.9310099, 2.493558, 0, 0, 1, 1, 1,
0.2202072, 1.070363, 3.353034, 1, 0, 0, 1, 1,
0.2232826, 1.295531, 0.4192775, 1, 0, 0, 1, 1,
0.2245577, -1.874386, 2.184611, 1, 0, 0, 1, 1,
0.2272347, -1.05178, 6.379404, 1, 0, 0, 1, 1,
0.2290259, -0.4541482, 2.368978, 1, 0, 0, 1, 1,
0.2329501, -0.3916121, 3.931802, 0, 0, 0, 1, 1,
0.2383042, -0.930335, 3.314373, 0, 0, 0, 1, 1,
0.2438551, -0.3956279, 2.051836, 0, 0, 0, 1, 1,
0.2439097, 0.08104124, 2.023898, 0, 0, 0, 1, 1,
0.2443837, -0.09284995, 3.32526, 0, 0, 0, 1, 1,
0.2503703, -0.4302788, 3.155641, 0, 0, 0, 1, 1,
0.2509214, 1.562398, -0.1280071, 0, 0, 0, 1, 1,
0.254384, -1.270904, 3.569798, 1, 1, 1, 1, 1,
0.2556329, 0.4852777, 2.25715, 1, 1, 1, 1, 1,
0.258287, -0.110609, 3.090701, 1, 1, 1, 1, 1,
0.2595683, 0.7443656, 0.5440152, 1, 1, 1, 1, 1,
0.2650212, 0.2743048, 1.555535, 1, 1, 1, 1, 1,
0.2738981, 0.8515514, -0.1695395, 1, 1, 1, 1, 1,
0.2756156, 1.569439, -0.01946411, 1, 1, 1, 1, 1,
0.2802134, 0.3766081, 0.8317959, 1, 1, 1, 1, 1,
0.2901137, 1.582481, -0.9460247, 1, 1, 1, 1, 1,
0.301221, -0.4890288, 2.893402, 1, 1, 1, 1, 1,
0.3018641, -0.5378307, 2.83822, 1, 1, 1, 1, 1,
0.3061048, 1.393971, 1.608474, 1, 1, 1, 1, 1,
0.3066171, 1.620826, 0.5191959, 1, 1, 1, 1, 1,
0.3087213, -1.644714, 1.889814, 1, 1, 1, 1, 1,
0.3092488, -0.3673691, 1.989858, 1, 1, 1, 1, 1,
0.310704, -0.4581122, 2.728551, 0, 0, 1, 1, 1,
0.3108367, -0.8195078, 3.236556, 1, 0, 0, 1, 1,
0.3132353, 0.8721352, 0.2548989, 1, 0, 0, 1, 1,
0.3137127, 1.196333, -0.1246805, 1, 0, 0, 1, 1,
0.3156867, 0.1739762, 0.5438378, 1, 0, 0, 1, 1,
0.3160331, 1.309837, 1.685655, 1, 0, 0, 1, 1,
0.320611, -2.726748, 3.719339, 0, 0, 0, 1, 1,
0.3241445, 1.835649, 0.1299588, 0, 0, 0, 1, 1,
0.3249717, 0.4249389, 1.48571, 0, 0, 0, 1, 1,
0.3253605, 0.4700907, -1.12829, 0, 0, 0, 1, 1,
0.327345, 0.7838483, 1.980284, 0, 0, 0, 1, 1,
0.3341253, 0.01016485, 1.433171, 0, 0, 0, 1, 1,
0.3347851, -0.1474414, 2.448409, 0, 0, 0, 1, 1,
0.3439014, 1.547642, -0.5781919, 1, 1, 1, 1, 1,
0.3444081, 0.7658384, 0.01492386, 1, 1, 1, 1, 1,
0.3495325, 0.7264143, 1.345387, 1, 1, 1, 1, 1,
0.3496359, -1.815606, 2.984107, 1, 1, 1, 1, 1,
0.3507223, -1.101181, 2.496297, 1, 1, 1, 1, 1,
0.3514731, -0.4069031, 1.940466, 1, 1, 1, 1, 1,
0.3549237, -1.718696, 3.215024, 1, 1, 1, 1, 1,
0.3603086, -0.09950265, 2.694412, 1, 1, 1, 1, 1,
0.3606115, -0.2049619, 1.842875, 1, 1, 1, 1, 1,
0.3614718, -0.3925811, 2.044921, 1, 1, 1, 1, 1,
0.3617172, -0.2532277, -0.7721559, 1, 1, 1, 1, 1,
0.366494, -0.4169378, 3.780954, 1, 1, 1, 1, 1,
0.3665819, -0.1401828, 2.307861, 1, 1, 1, 1, 1,
0.3670935, 1.068031, 0.3323135, 1, 1, 1, 1, 1,
0.3821502, 0.4731521, 1.608327, 1, 1, 1, 1, 1,
0.3827014, -0.4455334, 3.421693, 0, 0, 1, 1, 1,
0.3835608, 0.00733632, 2.368817, 1, 0, 0, 1, 1,
0.3837104, 0.1807276, 1.539317, 1, 0, 0, 1, 1,
0.3867557, -0.3047042, 1.222775, 1, 0, 0, 1, 1,
0.3898357, -0.7896478, 2.794676, 1, 0, 0, 1, 1,
0.3904327, 1.4631, -0.7111484, 1, 0, 0, 1, 1,
0.3918758, 1.478937, -0.7599233, 0, 0, 0, 1, 1,
0.3929132, -2.29059, 3.921466, 0, 0, 0, 1, 1,
0.3967303, 1.239796, -1.11813, 0, 0, 0, 1, 1,
0.3970321, 1.427924, -1.121426, 0, 0, 0, 1, 1,
0.3979569, 0.7483954, -0.6540687, 0, 0, 0, 1, 1,
0.3992929, -0.0189748, 2.270183, 0, 0, 0, 1, 1,
0.4002801, -0.2453873, 2.564918, 0, 0, 0, 1, 1,
0.4021009, -1.602551, 4.16453, 1, 1, 1, 1, 1,
0.4038811, -0.6869776, 4.531919, 1, 1, 1, 1, 1,
0.4058196, -0.8614615, 2.29509, 1, 1, 1, 1, 1,
0.4087269, -1.149414, 2.721726, 1, 1, 1, 1, 1,
0.4185202, -1.062292, 3.220836, 1, 1, 1, 1, 1,
0.4269516, -0.1666595, 3.522442, 1, 1, 1, 1, 1,
0.4311617, -0.3844635, 2.515093, 1, 1, 1, 1, 1,
0.4326735, -2.010333, 2.08305, 1, 1, 1, 1, 1,
0.4425032, -0.2541016, 2.772986, 1, 1, 1, 1, 1,
0.4498313, 0.2699798, 1.207682, 1, 1, 1, 1, 1,
0.4525818, -2.319973, 2.253903, 1, 1, 1, 1, 1,
0.4579522, 0.2068145, 0.4175982, 1, 1, 1, 1, 1,
0.463056, -0.6097816, 1.453826, 1, 1, 1, 1, 1,
0.4631748, 0.5702918, 0.8788213, 1, 1, 1, 1, 1,
0.464597, -0.4898683, 2.2351, 1, 1, 1, 1, 1,
0.4652069, 0.03466463, 3.848885, 0, 0, 1, 1, 1,
0.4708469, 1.137744, 1.696975, 1, 0, 0, 1, 1,
0.4713378, 0.7409932, 0.8386786, 1, 0, 0, 1, 1,
0.4749067, 0.5578047, 0.8713403, 1, 0, 0, 1, 1,
0.475199, -0.9084504, 2.166137, 1, 0, 0, 1, 1,
0.4754969, 0.247247, 1.276305, 1, 0, 0, 1, 1,
0.4792673, 0.5074279, 2.312968, 0, 0, 0, 1, 1,
0.4793025, 0.003646279, 1.432678, 0, 0, 0, 1, 1,
0.4797271, 0.7373054, -0.2335281, 0, 0, 0, 1, 1,
0.4803424, 0.146429, 1.359373, 0, 0, 0, 1, 1,
0.4823892, 1.709551, 0.4949256, 0, 0, 0, 1, 1,
0.4854736, 0.6531789, 0.7336187, 0, 0, 0, 1, 1,
0.4870685, -0.7736722, 1.866078, 0, 0, 0, 1, 1,
0.4890408, 0.2793079, -1.429736, 1, 1, 1, 1, 1,
0.4941999, -0.07356951, 2.209244, 1, 1, 1, 1, 1,
0.4942344, 0.6328852, 2.655767, 1, 1, 1, 1, 1,
0.4954394, -0.1025257, 2.206193, 1, 1, 1, 1, 1,
0.496454, 0.4801886, 0.9928039, 1, 1, 1, 1, 1,
0.4992383, 0.2959406, 3.006778, 1, 1, 1, 1, 1,
0.5004514, -1.510815, 1.27987, 1, 1, 1, 1, 1,
0.5082586, -0.008522106, 0.5877186, 1, 1, 1, 1, 1,
0.5103809, -2.037781, 2.541644, 1, 1, 1, 1, 1,
0.5107452, -3.284009, 2.816691, 1, 1, 1, 1, 1,
0.5108585, -0.7920849, 1.493859, 1, 1, 1, 1, 1,
0.5111191, 0.12056, 2.091342, 1, 1, 1, 1, 1,
0.5178742, 0.3538735, -0.5998535, 1, 1, 1, 1, 1,
0.5179645, -1.401266, 1.292384, 1, 1, 1, 1, 1,
0.5319062, 0.4474833, -0.2541003, 1, 1, 1, 1, 1,
0.531972, -1.084382, 3.856493, 0, 0, 1, 1, 1,
0.5342525, -2.125253, 2.457146, 1, 0, 0, 1, 1,
0.5365115, 0.04868924, 1.344852, 1, 0, 0, 1, 1,
0.5386377, 1.52246, -0.3860692, 1, 0, 0, 1, 1,
0.5395071, -0.09981439, -0.05085142, 1, 0, 0, 1, 1,
0.5399424, -1.281652, 2.552354, 1, 0, 0, 1, 1,
0.5407572, 0.4307834, 0.5653819, 0, 0, 0, 1, 1,
0.5449712, 0.1878062, 0.7339625, 0, 0, 0, 1, 1,
0.54626, 0.1244745, 2.722216, 0, 0, 0, 1, 1,
0.5512088, 1.164821, 0.3914273, 0, 0, 0, 1, 1,
0.5512769, 0.6236327, 2.096398, 0, 0, 0, 1, 1,
0.5520329, -0.7476696, 3.13178, 0, 0, 0, 1, 1,
0.5529338, -0.1757642, 1.170259, 0, 0, 0, 1, 1,
0.5551934, 0.2849568, 1.347706, 1, 1, 1, 1, 1,
0.5631411, 0.6936218, -0.3505116, 1, 1, 1, 1, 1,
0.5652741, 0.4350155, 0.5186357, 1, 1, 1, 1, 1,
0.5668902, -1.200809, 3.810031, 1, 1, 1, 1, 1,
0.5715175, 1.048882, 0.0222389, 1, 1, 1, 1, 1,
0.5741115, 0.2425465, 1.713976, 1, 1, 1, 1, 1,
0.5746258, 1.785244, 0.9106155, 1, 1, 1, 1, 1,
0.5761096, -0.3599143, 1.898418, 1, 1, 1, 1, 1,
0.5836094, 0.9920274, 0.3263009, 1, 1, 1, 1, 1,
0.5926046, 1.323318, -0.861307, 1, 1, 1, 1, 1,
0.5937918, -0.4110991, 1.189877, 1, 1, 1, 1, 1,
0.5990661, -0.2091142, 3.479599, 1, 1, 1, 1, 1,
0.6015281, 0.3094708, 1.211125, 1, 1, 1, 1, 1,
0.6029947, -0.4231606, 1.854473, 1, 1, 1, 1, 1,
0.6045897, -0.4571569, 1.972249, 1, 1, 1, 1, 1,
0.6059369, 0.3443075, -0.02802251, 0, 0, 1, 1, 1,
0.6082731, -1.051576, 1.893204, 1, 0, 0, 1, 1,
0.6101649, -0.2047179, 1.831705, 1, 0, 0, 1, 1,
0.6184657, 1.011945, 1.788529, 1, 0, 0, 1, 1,
0.6191798, 0.9058489, 0.6278665, 1, 0, 0, 1, 1,
0.6211293, 0.3373525, 2.860744, 1, 0, 0, 1, 1,
0.6220084, 0.2305255, -0.1925475, 0, 0, 0, 1, 1,
0.6271214, -0.01164385, 1.812682, 0, 0, 0, 1, 1,
0.6382334, -0.4399614, 1.653034, 0, 0, 0, 1, 1,
0.6382737, -0.2655472, 2.623584, 0, 0, 0, 1, 1,
0.6420476, -0.4217942, 1.17501, 0, 0, 0, 1, 1,
0.6464985, -1.12631, 4.239901, 0, 0, 0, 1, 1,
0.6469356, 0.4859062, 0.2835632, 0, 0, 0, 1, 1,
0.6533204, -1.991419, 2.81853, 1, 1, 1, 1, 1,
0.6538902, -1.33494, 3.946019, 1, 1, 1, 1, 1,
0.6607816, 0.2982838, 0.2840725, 1, 1, 1, 1, 1,
0.665521, 0.7799696, 1.857639, 1, 1, 1, 1, 1,
0.6725433, 0.2030248, 0.8974568, 1, 1, 1, 1, 1,
0.6732932, -1.900224, 3.273946, 1, 1, 1, 1, 1,
0.6742084, 1.323322, 1.088848, 1, 1, 1, 1, 1,
0.6745261, -0.9171154, 1.700996, 1, 1, 1, 1, 1,
0.6747487, 0.8877615, -0.9700935, 1, 1, 1, 1, 1,
0.6770089, -1.162102, 2.043168, 1, 1, 1, 1, 1,
0.6774513, -0.6656404, 2.960682, 1, 1, 1, 1, 1,
0.6813533, -2.286919, 2.291207, 1, 1, 1, 1, 1,
0.6904118, 1.635896, -0.09619401, 1, 1, 1, 1, 1,
0.6926013, 1.932621, 0.9532979, 1, 1, 1, 1, 1,
0.6966283, 0.9457718, 0.7302802, 1, 1, 1, 1, 1,
0.6973091, -0.3441493, 3.172155, 0, 0, 1, 1, 1,
0.6979972, 0.23793, 2.642868, 1, 0, 0, 1, 1,
0.698395, -1.533517, 3.005033, 1, 0, 0, 1, 1,
0.7005309, 1.648663, 0.0467206, 1, 0, 0, 1, 1,
0.7015563, 0.8384793, -1.055547, 1, 0, 0, 1, 1,
0.702419, 0.02795073, 2.704953, 1, 0, 0, 1, 1,
0.7119925, -0.5802706, 2.19608, 0, 0, 0, 1, 1,
0.7136865, 0.3043644, 2.234215, 0, 0, 0, 1, 1,
0.7158984, 0.4982235, 0.111131, 0, 0, 0, 1, 1,
0.7169739, 0.5173022, 1.198744, 0, 0, 0, 1, 1,
0.7174185, -1.635945, 1.858074, 0, 0, 0, 1, 1,
0.7185705, -1.310796, 3.564965, 0, 0, 0, 1, 1,
0.7234287, -0.975022, 3.225567, 0, 0, 0, 1, 1,
0.723455, 1.979619, 1.861596, 1, 1, 1, 1, 1,
0.7257962, -0.6642172, 2.862841, 1, 1, 1, 1, 1,
0.7265074, -0.2426872, 2.24299, 1, 1, 1, 1, 1,
0.7265368, -0.358266, 2.362831, 1, 1, 1, 1, 1,
0.7282405, -0.6033715, 2.317, 1, 1, 1, 1, 1,
0.7313682, 0.5190334, 2.371438, 1, 1, 1, 1, 1,
0.7325506, 1.21128, 0.9876046, 1, 1, 1, 1, 1,
0.7373695, 0.9743271, 1.2098, 1, 1, 1, 1, 1,
0.7438772, -1.620892, 3.173517, 1, 1, 1, 1, 1,
0.74609, 0.1015957, 0.002564248, 1, 1, 1, 1, 1,
0.7464388, 0.05015098, 2.020847, 1, 1, 1, 1, 1,
0.7514761, 0.3248132, 1.152067, 1, 1, 1, 1, 1,
0.759506, 1.099558, 0.02736307, 1, 1, 1, 1, 1,
0.7734951, -0.994931, 2.48995, 1, 1, 1, 1, 1,
0.7784028, -0.4691346, 2.545278, 1, 1, 1, 1, 1,
0.7845297, -0.7966543, 3.334091, 0, 0, 1, 1, 1,
0.7908518, 0.4979181, 1.628501, 1, 0, 0, 1, 1,
0.7914891, 0.1825848, 1.242682, 1, 0, 0, 1, 1,
0.7924877, -1.337586, 3.520531, 1, 0, 0, 1, 1,
0.794287, -1.518644, 3.027527, 1, 0, 0, 1, 1,
0.8043166, 0.2342369, 0.9573221, 1, 0, 0, 1, 1,
0.8145204, -1.640276, 2.335013, 0, 0, 0, 1, 1,
0.8219844, -0.4421913, 3.148793, 0, 0, 0, 1, 1,
0.8220548, 0.02391145, 0.6485232, 0, 0, 0, 1, 1,
0.8280969, -0.7937469, 2.861034, 0, 0, 0, 1, 1,
0.8317704, 1.670687, 0.03021509, 0, 0, 0, 1, 1,
0.8354743, -1.690707, 0.8188466, 0, 0, 0, 1, 1,
0.8393422, 1.410639, 0.7370901, 0, 0, 0, 1, 1,
0.851043, 1.82152, 0.6279322, 1, 1, 1, 1, 1,
0.851392, 0.9930268, 0.3341871, 1, 1, 1, 1, 1,
0.8557345, -0.2417743, 0.909376, 1, 1, 1, 1, 1,
0.857206, -0.2498842, 2.555166, 1, 1, 1, 1, 1,
0.8581329, -1.132159, 1.861256, 1, 1, 1, 1, 1,
0.8631567, 0.2161999, 1.431711, 1, 1, 1, 1, 1,
0.8665513, 0.9289039, 0.6983722, 1, 1, 1, 1, 1,
0.8677757, -1.628926, 4.784179, 1, 1, 1, 1, 1,
0.8698472, 0.4604096, 0.9977032, 1, 1, 1, 1, 1,
0.8701472, -0.7732228, 3.448142, 1, 1, 1, 1, 1,
0.8724319, 1.529004, 1.368079, 1, 1, 1, 1, 1,
0.8800156, 0.2006187, 1.431318, 1, 1, 1, 1, 1,
0.881334, 0.4693123, 1.192318, 1, 1, 1, 1, 1,
0.8831667, 0.8465488, -1.124937, 1, 1, 1, 1, 1,
0.8839474, -2.352004, 1.778813, 1, 1, 1, 1, 1,
0.8867359, -0.8728542, 2.338265, 0, 0, 1, 1, 1,
0.8919858, -0.2980086, -0.5549523, 1, 0, 0, 1, 1,
0.89487, -0.07263068, 1.852592, 1, 0, 0, 1, 1,
0.89894, 0.75515, 1.46883, 1, 0, 0, 1, 1,
0.9036102, -0.06111329, 0.8340175, 1, 0, 0, 1, 1,
0.9044377, 0.1450258, 2.415942, 1, 0, 0, 1, 1,
0.9053997, -0.1214424, 3.376681, 0, 0, 0, 1, 1,
0.910949, 0.6627904, 0.1821761, 0, 0, 0, 1, 1,
0.9112062, -0.5558521, 2.029621, 0, 0, 0, 1, 1,
0.9159906, 0.06581076, 1.774372, 0, 0, 0, 1, 1,
0.9239327, 1.033003, 1.131823, 0, 0, 0, 1, 1,
0.9244564, -0.433413, 1.537986, 0, 0, 0, 1, 1,
0.93432, 0.1729056, 0.2916733, 0, 0, 0, 1, 1,
0.9395641, 0.1706681, 2.248049, 1, 1, 1, 1, 1,
0.9402281, 0.1899123, 1.391713, 1, 1, 1, 1, 1,
0.9565138, 0.219399, 0.6350591, 1, 1, 1, 1, 1,
0.9568286, 0.570758, 0.7047274, 1, 1, 1, 1, 1,
0.9682815, 1.667747, -0.7543887, 1, 1, 1, 1, 1,
0.9701116, -2.959798, 3.892591, 1, 1, 1, 1, 1,
0.9702799, -0.7598265, 1.264969, 1, 1, 1, 1, 1,
0.9767449, -0.04309209, 2.16557, 1, 1, 1, 1, 1,
0.9808071, -0.5957557, 1.92839, 1, 1, 1, 1, 1,
0.9825178, -1.036552, 4.481454, 1, 1, 1, 1, 1,
0.9846116, -1.25528, 3.468812, 1, 1, 1, 1, 1,
0.9880256, 0.4924627, 1.06742, 1, 1, 1, 1, 1,
0.9899704, -0.4322183, 1.959745, 1, 1, 1, 1, 1,
0.9906031, -0.851989, 4.96736, 1, 1, 1, 1, 1,
0.993593, 1.254719, 1.331036, 1, 1, 1, 1, 1,
0.9970551, 1.156858, 0.004259695, 0, 0, 1, 1, 1,
1.000935, 0.5778113, 0.3333899, 1, 0, 0, 1, 1,
1.003482, -1.266282, 1.007906, 1, 0, 0, 1, 1,
1.006602, -0.06615712, 1.745655, 1, 0, 0, 1, 1,
1.010713, 0.4212113, 1.859142, 1, 0, 0, 1, 1,
1.0182, -1.611996, 4.56258, 1, 0, 0, 1, 1,
1.020257, 1.133169, -0.06784067, 0, 0, 0, 1, 1,
1.022017, -0.04933874, 3.1486, 0, 0, 0, 1, 1,
1.030404, -0.1727242, -0.8446036, 0, 0, 0, 1, 1,
1.03545, 1.373665, 1.565758, 0, 0, 0, 1, 1,
1.044131, 1.078245, 1.124558, 0, 0, 0, 1, 1,
1.061218, -1.74796, 2.016458, 0, 0, 0, 1, 1,
1.064425, -0.6268346, 2.545336, 0, 0, 0, 1, 1,
1.064981, -0.1313913, 1.552804, 1, 1, 1, 1, 1,
1.067478, -0.8019227, 2.726531, 1, 1, 1, 1, 1,
1.068077, 0.2137905, 2.380566, 1, 1, 1, 1, 1,
1.070407, -0.8425458, 1.12561, 1, 1, 1, 1, 1,
1.076086, -0.5334244, 3.219709, 1, 1, 1, 1, 1,
1.079586, -0.08212756, 1.880672, 1, 1, 1, 1, 1,
1.081311, 0.6780539, 0.3247088, 1, 1, 1, 1, 1,
1.083818, -1.798831, 0.8616222, 1, 1, 1, 1, 1,
1.085308, 0.1163387, 2.341441, 1, 1, 1, 1, 1,
1.089271, -1.27349, 0.9871441, 1, 1, 1, 1, 1,
1.101786, -0.4189826, 2.471423, 1, 1, 1, 1, 1,
1.101796, -0.2482442, -0.211266, 1, 1, 1, 1, 1,
1.105738, 1.668952, 1.410815, 1, 1, 1, 1, 1,
1.105996, -0.2547626, 3.85779, 1, 1, 1, 1, 1,
1.107387, -0.1953551, 1.274488, 1, 1, 1, 1, 1,
1.108595, 1.112045, -1.035969, 0, 0, 1, 1, 1,
1.11816, 1.967915, -1.863817, 1, 0, 0, 1, 1,
1.126038, -0.2604226, 2.095616, 1, 0, 0, 1, 1,
1.138576, -1.048132, 3.735481, 1, 0, 0, 1, 1,
1.140239, -1.480698, 2.376381, 1, 0, 0, 1, 1,
1.141693, -1.119634, 1.483613, 1, 0, 0, 1, 1,
1.160745, 0.1290849, 0.6006967, 0, 0, 0, 1, 1,
1.164196, 0.6272672, 2.675132, 0, 0, 0, 1, 1,
1.176976, -0.6472035, 1.076053, 0, 0, 0, 1, 1,
1.183693, 0.7144328, -0.4284419, 0, 0, 0, 1, 1,
1.196288, -0.5745109, 0.4890259, 0, 0, 0, 1, 1,
1.203146, 0.949867, 2.942934, 0, 0, 0, 1, 1,
1.205426, 0.3296358, 1.4006, 0, 0, 0, 1, 1,
1.209659, -0.8161909, 1.931783, 1, 1, 1, 1, 1,
1.210392, -0.2267532, 0.3881863, 1, 1, 1, 1, 1,
1.214646, 0.1981643, 2.556489, 1, 1, 1, 1, 1,
1.215015, 2.126366, 1.559506, 1, 1, 1, 1, 1,
1.221985, -0.3051062, 3.317904, 1, 1, 1, 1, 1,
1.229188, -0.1108677, 1.96913, 1, 1, 1, 1, 1,
1.233577, 0.9966012, 0.2703059, 1, 1, 1, 1, 1,
1.235528, 0.3956694, 0.9843822, 1, 1, 1, 1, 1,
1.236755, 0.4732148, 1.420576, 1, 1, 1, 1, 1,
1.237673, -0.7951327, 2.141426, 1, 1, 1, 1, 1,
1.238293, -0.3042334, 2.972349, 1, 1, 1, 1, 1,
1.241781, 1.28671, 1.509622, 1, 1, 1, 1, 1,
1.251945, 0.2204586, 1.9206, 1, 1, 1, 1, 1,
1.253821, -0.3679072, 2.867706, 1, 1, 1, 1, 1,
1.256332, 0.2140986, 2.209931, 1, 1, 1, 1, 1,
1.258116, -0.4306525, 0.529634, 0, 0, 1, 1, 1,
1.267128, -1.426921, 2.535169, 1, 0, 0, 1, 1,
1.267781, -1.987843, 2.067871, 1, 0, 0, 1, 1,
1.27904, -0.3939144, 0.9341537, 1, 0, 0, 1, 1,
1.285916, -1.777419, 1.891241, 1, 0, 0, 1, 1,
1.291191, 2.757353, 1.950771, 1, 0, 0, 1, 1,
1.299038, 0.156926, 1.235698, 0, 0, 0, 1, 1,
1.301717, 0.8206661, -1.298616, 0, 0, 0, 1, 1,
1.302662, -0.2179123, 1.85369, 0, 0, 0, 1, 1,
1.304494, 0.0002652932, 0.6507096, 0, 0, 0, 1, 1,
1.318595, 0.06642655, -1.374127, 0, 0, 0, 1, 1,
1.320241, -0.7568712, 1.442523, 0, 0, 0, 1, 1,
1.332636, -2.220929, 1.417483, 0, 0, 0, 1, 1,
1.33318, -0.6847669, 0.5465416, 1, 1, 1, 1, 1,
1.334907, -0.1420866, 1.324523, 1, 1, 1, 1, 1,
1.338048, 0.9962577, -0.5337192, 1, 1, 1, 1, 1,
1.341665, 0.5732269, -1.339247, 1, 1, 1, 1, 1,
1.349852, -0.8065181, 2.88641, 1, 1, 1, 1, 1,
1.354452, -0.02152702, 1.369761, 1, 1, 1, 1, 1,
1.361643, -1.192502, 2.385872, 1, 1, 1, 1, 1,
1.37191, 0.5953696, 0.9691006, 1, 1, 1, 1, 1,
1.374394, -0.7226668, 2.727012, 1, 1, 1, 1, 1,
1.375057, 1.465889, 1.864809, 1, 1, 1, 1, 1,
1.383487, 1.355941, -1.124307, 1, 1, 1, 1, 1,
1.388472, -0.6352375, 1.017899, 1, 1, 1, 1, 1,
1.399495, 1.749043, -0.7555355, 1, 1, 1, 1, 1,
1.399939, 1.86626, 0.3169067, 1, 1, 1, 1, 1,
1.415676, -1.888631, 2.200483, 1, 1, 1, 1, 1,
1.416654, 0.1020687, 1.563505, 0, 0, 1, 1, 1,
1.421397, 0.7756603, 0.6718425, 1, 0, 0, 1, 1,
1.427804, -0.3265037, 0.9449674, 1, 0, 0, 1, 1,
1.429981, -0.3767665, 1.793219, 1, 0, 0, 1, 1,
1.433513, 0.02278163, 1.484701, 1, 0, 0, 1, 1,
1.443055, 0.4979825, 1.309239, 1, 0, 0, 1, 1,
1.44617, -1.186132, 3.634998, 0, 0, 0, 1, 1,
1.448689, -1.588555, 2.493817, 0, 0, 0, 1, 1,
1.449742, -2.419284, 3.224816, 0, 0, 0, 1, 1,
1.453332, 1.793441, 0.5763894, 0, 0, 0, 1, 1,
1.463435, 1.240626, 1.901293, 0, 0, 0, 1, 1,
1.464871, 0.5798355, 1.819378, 0, 0, 0, 1, 1,
1.466615, -0.270389, 3.012496, 0, 0, 0, 1, 1,
1.470522, -0.8638309, 3.039362, 1, 1, 1, 1, 1,
1.473834, 2.00215, 0.7108148, 1, 1, 1, 1, 1,
1.495552, -0.188371, 1.436045, 1, 1, 1, 1, 1,
1.49682, 0.7113851, -0.06981397, 1, 1, 1, 1, 1,
1.498567, -1.972711, 2.036256, 1, 1, 1, 1, 1,
1.499956, 1.249748, 0.9733364, 1, 1, 1, 1, 1,
1.510475, 0.4650152, 2.168721, 1, 1, 1, 1, 1,
1.525383, -0.7085633, -1.090107, 1, 1, 1, 1, 1,
1.528662, -1.722241, 3.659438, 1, 1, 1, 1, 1,
1.538918, -0.2223288, 3.633471, 1, 1, 1, 1, 1,
1.549564, 1.325179, 0.715307, 1, 1, 1, 1, 1,
1.580902, -0.2109445, 1.569838, 1, 1, 1, 1, 1,
1.583095, -0.16738, 3.406486, 1, 1, 1, 1, 1,
1.589044, -0.007087481, 0.7985791, 1, 1, 1, 1, 1,
1.60828, 0.5055766, 3.254087, 1, 1, 1, 1, 1,
1.611651, -1.135521, 1.42789, 0, 0, 1, 1, 1,
1.640125, -0.6095161, 1.597534, 1, 0, 0, 1, 1,
1.644945, -0.5614284, 0.7668456, 1, 0, 0, 1, 1,
1.64712, 0.8771989, 0.7116741, 1, 0, 0, 1, 1,
1.647302, -1.276174, 2.746971, 1, 0, 0, 1, 1,
1.653182, 0.03597179, 1.138906, 1, 0, 0, 1, 1,
1.67856, -0.4098085, 1.149128, 0, 0, 0, 1, 1,
1.686061, -0.6006469, 2.782863, 0, 0, 0, 1, 1,
1.723589, 0.7554173, 2.393705, 0, 0, 0, 1, 1,
1.72986, -0.5325509, 2.186092, 0, 0, 0, 1, 1,
1.734241, -0.07845826, 0.4458353, 0, 0, 0, 1, 1,
1.741301, -0.9368836, 2.611702, 0, 0, 0, 1, 1,
1.758314, 1.89826, -0.08808727, 0, 0, 0, 1, 1,
1.793043, 1.239797, -0.7573462, 1, 1, 1, 1, 1,
1.808241, -0.2292791, 2.166436, 1, 1, 1, 1, 1,
1.818948, -0.4643897, 2.006521, 1, 1, 1, 1, 1,
1.827884, -2.605178, 2.307348, 1, 1, 1, 1, 1,
1.834852, -0.78937, 2.857454, 1, 1, 1, 1, 1,
1.842491, 1.857403, 0.4290403, 1, 1, 1, 1, 1,
1.849015, 0.5297902, 0.8139905, 1, 1, 1, 1, 1,
1.851391, 0.5790464, 0.1216494, 1, 1, 1, 1, 1,
1.879381, 0.5114664, -0.7226955, 1, 1, 1, 1, 1,
1.897004, -2.042446, 1.667661, 1, 1, 1, 1, 1,
1.93299, 1.743619, -1.289055, 1, 1, 1, 1, 1,
1.945309, 0.02448989, 1.202748, 1, 1, 1, 1, 1,
1.947103, -0.6181357, 0.6243359, 1, 1, 1, 1, 1,
1.954241, -0.4691447, 1.034028, 1, 1, 1, 1, 1,
1.954717, -0.6725692, 1.725813, 1, 1, 1, 1, 1,
1.957749, -0.5975465, 1.465602, 0, 0, 1, 1, 1,
1.958928, -0.5426893, 4.212023, 1, 0, 0, 1, 1,
1.96642, -0.6824871, -1.337036, 1, 0, 0, 1, 1,
1.990748, 0.8702941, 2.301937, 1, 0, 0, 1, 1,
2.018432, -2.223577, 3.132541, 1, 0, 0, 1, 1,
2.031056, 1.03146, 1.837123, 1, 0, 0, 1, 1,
2.059025, 0.3031237, 1.104515, 0, 0, 0, 1, 1,
2.06349, -0.9170059, 1.551561, 0, 0, 0, 1, 1,
2.076913, 0.9226246, 1.051234, 0, 0, 0, 1, 1,
2.106773, -2.295713, 1.829491, 0, 0, 0, 1, 1,
2.112365, 0.01719766, 1.435478, 0, 0, 0, 1, 1,
2.122371, 0.5638574, 0.5103787, 0, 0, 0, 1, 1,
2.124621, 1.019594, 0.0727494, 0, 0, 0, 1, 1,
2.127856, -0.1921299, 2.73188, 1, 1, 1, 1, 1,
2.185052, -1.500644, 2.412156, 1, 1, 1, 1, 1,
2.28666, -0.5664148, 0.6482337, 1, 1, 1, 1, 1,
2.334631, -0.7762613, 1.278594, 1, 1, 1, 1, 1,
2.42997, 1.449864, 1.254701, 1, 1, 1, 1, 1,
2.55702, 0.3339322, 1.978068, 1, 1, 1, 1, 1,
3.779961, 0.0790609, 1.798995, 1, 1, 1, 1, 1
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
var radius = 10.12513;
var distance = 35.56409;
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
mvMatrix.translate( 0.06430721, 0.5083863, -0.8202984 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.56409);
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