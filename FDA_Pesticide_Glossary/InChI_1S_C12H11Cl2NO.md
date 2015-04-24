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
-3.366355, -1.191815, -3.958476, 1, 0, 0, 1,
-2.906567, -1.111447, 0.3312808, 1, 0.007843138, 0, 1,
-2.844863, 0.4833626, -0.7562064, 1, 0.01176471, 0, 1,
-2.601536, 0.3288347, -1.171564, 1, 0.01960784, 0, 1,
-2.516308, 0.7274632, -0.8851898, 1, 0.02352941, 0, 1,
-2.443968, 0.27531, -0.8786902, 1, 0.03137255, 0, 1,
-2.436278, -1.131397, -1.967088, 1, 0.03529412, 0, 1,
-2.430073, 0.4725863, -0.5882283, 1, 0.04313726, 0, 1,
-2.423978, 0.296365, -0.9707333, 1, 0.04705882, 0, 1,
-2.418301, -0.07187463, -0.5166987, 1, 0.05490196, 0, 1,
-2.418047, -0.7200094, -1.850336, 1, 0.05882353, 0, 1,
-2.373645, -0.2105123, -3.702112, 1, 0.06666667, 0, 1,
-2.356468, -0.247537, -2.461083, 1, 0.07058824, 0, 1,
-2.34877, -0.01886616, -1.568661, 1, 0.07843138, 0, 1,
-2.304454, 0.07373468, -2.456984, 1, 0.08235294, 0, 1,
-2.28089, 1.801225, -0.4974306, 1, 0.09019608, 0, 1,
-2.276988, -0.03811331, -1.506, 1, 0.09411765, 0, 1,
-2.262436, 1.327703, -2.831481, 1, 0.1019608, 0, 1,
-2.193111, -0.4935948, -1.502745, 1, 0.1098039, 0, 1,
-2.190157, 1.4183, -0.6137673, 1, 0.1137255, 0, 1,
-2.088377, -0.2996771, -2.799068, 1, 0.1215686, 0, 1,
-2.042434, -0.09644687, -2.774298, 1, 0.1254902, 0, 1,
-2.036356, 0.256529, -2.886861, 1, 0.1333333, 0, 1,
-2.001949, 1.290297, -2.29272, 1, 0.1372549, 0, 1,
-1.999051, -1.395134, -2.812343, 1, 0.145098, 0, 1,
-1.978688, -0.7291939, -2.053849, 1, 0.1490196, 0, 1,
-1.963273, -0.182009, -1.602344, 1, 0.1568628, 0, 1,
-1.960574, 0.06016611, -1.498215, 1, 0.1607843, 0, 1,
-1.958361, 1.191968, 0.1925063, 1, 0.1686275, 0, 1,
-1.926897, 1.541533, 0.2051838, 1, 0.172549, 0, 1,
-1.925804, -0.5601293, -1.094885, 1, 0.1803922, 0, 1,
-1.898572, 0.2843623, -1.399338, 1, 0.1843137, 0, 1,
-1.870983, -0.840993, -1.670709, 1, 0.1921569, 0, 1,
-1.85327, -0.1472673, -0.6247289, 1, 0.1960784, 0, 1,
-1.846949, -0.4809962, -3.003597, 1, 0.2039216, 0, 1,
-1.79425, 0.929059, -0.9858317, 1, 0.2117647, 0, 1,
-1.766183, 0.6474916, -0.5543227, 1, 0.2156863, 0, 1,
-1.761535, 1.655763, -0.1922211, 1, 0.2235294, 0, 1,
-1.730529, 1.513589, -0.6815519, 1, 0.227451, 0, 1,
-1.729757, 0.4073964, -1.612867, 1, 0.2352941, 0, 1,
-1.726333, 0.196394, -1.328688, 1, 0.2392157, 0, 1,
-1.712797, -0.4590929, -2.738548, 1, 0.2470588, 0, 1,
-1.702176, 0.1218549, -0.4205729, 1, 0.2509804, 0, 1,
-1.685421, -0.3548139, -3.299996, 1, 0.2588235, 0, 1,
-1.680391, 0.2071533, -0.6408409, 1, 0.2627451, 0, 1,
-1.674056, -0.5930467, -2.444042, 1, 0.2705882, 0, 1,
-1.658977, -0.2747935, -0.8727413, 1, 0.2745098, 0, 1,
-1.651201, 0.1503264, -0.1549889, 1, 0.282353, 0, 1,
-1.650954, 0.8324927, 0.8812873, 1, 0.2862745, 0, 1,
-1.64384, -1.22626, -3.111426, 1, 0.2941177, 0, 1,
-1.641173, 0.5629374, -2.474542, 1, 0.3019608, 0, 1,
-1.617551, -1.227442, -2.709038, 1, 0.3058824, 0, 1,
-1.607427, 0.3011527, -1.059408, 1, 0.3137255, 0, 1,
-1.595827, -0.7763696, -1.446706, 1, 0.3176471, 0, 1,
-1.587584, -0.856493, -2.250524, 1, 0.3254902, 0, 1,
-1.568763, -1.080263, -3.379358, 1, 0.3294118, 0, 1,
-1.561484, 0.7561656, -2.733862, 1, 0.3372549, 0, 1,
-1.559216, 1.536525, -1.666944, 1, 0.3411765, 0, 1,
-1.553722, 0.6842038, -0.7168679, 1, 0.3490196, 0, 1,
-1.553507, -0.2239068, -0.7581024, 1, 0.3529412, 0, 1,
-1.537183, 0.03024768, -2.610066, 1, 0.3607843, 0, 1,
-1.528504, -0.9048367, -0.9611633, 1, 0.3647059, 0, 1,
-1.503881, 0.4441159, -0.03722609, 1, 0.372549, 0, 1,
-1.501959, -1.228045, -1.764583, 1, 0.3764706, 0, 1,
-1.487706, 0.2686083, -1.394881, 1, 0.3843137, 0, 1,
-1.477805, 0.4756985, -0.74896, 1, 0.3882353, 0, 1,
-1.461832, -0.1777746, -2.694813, 1, 0.3960784, 0, 1,
-1.455479, -0.06317637, -3.669796, 1, 0.4039216, 0, 1,
-1.444084, 1.004937, 0.1651396, 1, 0.4078431, 0, 1,
-1.442265, 1.380621, -2.411225, 1, 0.4156863, 0, 1,
-1.441014, 0.9166664, -0.02626193, 1, 0.4196078, 0, 1,
-1.434448, -1.80397, -3.486885, 1, 0.427451, 0, 1,
-1.432888, 0.08895443, -4.988887, 1, 0.4313726, 0, 1,
-1.429298, 0.6422751, -1.426647, 1, 0.4392157, 0, 1,
-1.391342, -1.899625, -0.7555084, 1, 0.4431373, 0, 1,
-1.385775, -1.334751, -2.966581, 1, 0.4509804, 0, 1,
-1.380049, 0.5757232, -1.277953, 1, 0.454902, 0, 1,
-1.373699, -0.01833156, -1.060818, 1, 0.4627451, 0, 1,
-1.373467, -1.731603, -1.851356, 1, 0.4666667, 0, 1,
-1.369722, 0.09840879, -2.145303, 1, 0.4745098, 0, 1,
-1.357499, -1.113502, -3.531667, 1, 0.4784314, 0, 1,
-1.351753, -0.8892704, -2.537692, 1, 0.4862745, 0, 1,
-1.347531, 0.6243309, -1.819081, 1, 0.4901961, 0, 1,
-1.346721, -1.29115, -2.892235, 1, 0.4980392, 0, 1,
-1.334579, -0.1021091, -1.925223, 1, 0.5058824, 0, 1,
-1.315507, 0.6658056, -2.750421, 1, 0.509804, 0, 1,
-1.307364, 1.673507, 1.177165, 1, 0.5176471, 0, 1,
-1.306558, 0.8111573, -1.677857, 1, 0.5215687, 0, 1,
-1.300451, -1.365423, -1.643983, 1, 0.5294118, 0, 1,
-1.296347, 0.07105628, -1.792758, 1, 0.5333334, 0, 1,
-1.289002, -0.5778933, -1.68297, 1, 0.5411765, 0, 1,
-1.284817, 1.878071, -1.485737, 1, 0.5450981, 0, 1,
-1.270848, -0.1028594, -0.3233377, 1, 0.5529412, 0, 1,
-1.269488, -0.6808895, -2.598436, 1, 0.5568628, 0, 1,
-1.265542, 1.549943, 0.932648, 1, 0.5647059, 0, 1,
-1.25591, -0.9002513, -1.560562, 1, 0.5686275, 0, 1,
-1.254804, 0.582917, -1.000266, 1, 0.5764706, 0, 1,
-1.251182, 1.608875, -2.184942, 1, 0.5803922, 0, 1,
-1.248338, -1.254558, -1.152495, 1, 0.5882353, 0, 1,
-1.237529, -2.505957, -0.8933969, 1, 0.5921569, 0, 1,
-1.234889, 0.08134941, -1.695643, 1, 0.6, 0, 1,
-1.233573, 0.03545451, -0.7853157, 1, 0.6078432, 0, 1,
-1.231782, -1.350285, -1.68833, 1, 0.6117647, 0, 1,
-1.229122, -0.3315141, -2.461245, 1, 0.6196079, 0, 1,
-1.222618, 0.8591664, -2.057629, 1, 0.6235294, 0, 1,
-1.218711, 0.5479119, -2.681361, 1, 0.6313726, 0, 1,
-1.209391, -0.4016312, -1.841879, 1, 0.6352941, 0, 1,
-1.20494, 1.080339, 0.9242256, 1, 0.6431373, 0, 1,
-1.19685, -1.422085, -2.706001, 1, 0.6470588, 0, 1,
-1.1937, -0.1826769, 0.09430812, 1, 0.654902, 0, 1,
-1.182219, 1.018141, -1.509512, 1, 0.6588235, 0, 1,
-1.178629, 0.9146103, -0.2684309, 1, 0.6666667, 0, 1,
-1.163785, 0.5133327, -1.366152, 1, 0.6705883, 0, 1,
-1.161618, -0.6772338, -2.834432, 1, 0.6784314, 0, 1,
-1.130522, -1.416545, -2.892505, 1, 0.682353, 0, 1,
-1.12691, 1.41575, -1.745632, 1, 0.6901961, 0, 1,
-1.126712, 1.084855, -1.866085, 1, 0.6941177, 0, 1,
-1.114142, -0.7356972, -0.7052252, 1, 0.7019608, 0, 1,
-1.112388, 1.393995, -0.5167865, 1, 0.7098039, 0, 1,
-1.108645, 0.5322489, -0.5449778, 1, 0.7137255, 0, 1,
-1.104656, 2.68023, -1.55929, 1, 0.7215686, 0, 1,
-1.101892, -0.1796784, -2.602011, 1, 0.7254902, 0, 1,
-1.100416, -0.6540929, -3.151331, 1, 0.7333333, 0, 1,
-1.097922, -0.6056004, -0.746566, 1, 0.7372549, 0, 1,
-1.089095, -1.904041, -1.704714, 1, 0.7450981, 0, 1,
-1.088058, -0.5629294, -2.562944, 1, 0.7490196, 0, 1,
-1.075263, -1.452833, -2.165339, 1, 0.7568628, 0, 1,
-1.070868, 0.9770108, 0.8076653, 1, 0.7607843, 0, 1,
-1.064987, -0.3593283, -3.67236, 1, 0.7686275, 0, 1,
-1.063612, 0.9564152, -0.4400181, 1, 0.772549, 0, 1,
-1.061811, 0.7555324, 0.8469298, 1, 0.7803922, 0, 1,
-1.059664, -0.447038, -1.231809, 1, 0.7843137, 0, 1,
-1.052849, -1.740639, -3.269259, 1, 0.7921569, 0, 1,
-1.041358, 0.005764486, -0.8432367, 1, 0.7960784, 0, 1,
-1.034822, -1.389986, -2.718665, 1, 0.8039216, 0, 1,
-1.027422, -0.6797547, -2.021878, 1, 0.8117647, 0, 1,
-1.025317, -1.352643, -3.363136, 1, 0.8156863, 0, 1,
-1.017352, 0.06281409, -1.562477, 1, 0.8235294, 0, 1,
-1.014705, -0.1657674, -0.6538004, 1, 0.827451, 0, 1,
-1.011144, 0.7067544, 0.1063506, 1, 0.8352941, 0, 1,
-1.000514, 0.5412456, -0.5870196, 1, 0.8392157, 0, 1,
-0.9711658, -0.782464, -1.969138, 1, 0.8470588, 0, 1,
-0.9705355, 0.9028533, -0.5928189, 1, 0.8509804, 0, 1,
-0.9581837, -0.3727826, -2.348886, 1, 0.8588235, 0, 1,
-0.9572949, 0.2425036, -1.158467, 1, 0.8627451, 0, 1,
-0.9480767, -0.5090144, -0.1694954, 1, 0.8705882, 0, 1,
-0.9441833, -0.7218337, -2.015033, 1, 0.8745098, 0, 1,
-0.9346507, 0.0986069, -3.549207, 1, 0.8823529, 0, 1,
-0.9296446, 0.07825349, -1.638777, 1, 0.8862745, 0, 1,
-0.9277142, 1.058079, 1.556649, 1, 0.8941177, 0, 1,
-0.9241613, -1.369377, -3.646235, 1, 0.8980392, 0, 1,
-0.923349, -2.215142, -2.149478, 1, 0.9058824, 0, 1,
-0.9163235, -0.6231723, -2.0264, 1, 0.9137255, 0, 1,
-0.9154568, -0.6829222, -3.370769, 1, 0.9176471, 0, 1,
-0.91269, -0.5465584, -2.904691, 1, 0.9254902, 0, 1,
-0.9046025, -0.330371, -3.21517, 1, 0.9294118, 0, 1,
-0.9044719, -0.2073122, -2.999023, 1, 0.9372549, 0, 1,
-0.9007922, -0.1255661, -2.08391, 1, 0.9411765, 0, 1,
-0.8983594, 0.2965129, -0.5869812, 1, 0.9490196, 0, 1,
-0.8939263, -0.8894343, -0.3857307, 1, 0.9529412, 0, 1,
-0.8930742, 0.0389123, -2.731163, 1, 0.9607843, 0, 1,
-0.8924502, -1.030544, -1.918571, 1, 0.9647059, 0, 1,
-0.8847763, -0.6988587, -3.000446, 1, 0.972549, 0, 1,
-0.8832182, -1.219636, -2.172746, 1, 0.9764706, 0, 1,
-0.8814047, 0.158774, -1.96176, 1, 0.9843137, 0, 1,
-0.8781006, -2.65089, -0.5062601, 1, 0.9882353, 0, 1,
-0.8762083, -1.185881, -2.48199, 1, 0.9960784, 0, 1,
-0.8750653, -0.1782915, -2.8413, 0.9960784, 1, 0, 1,
-0.8710757, 1.48234, -0.5943807, 0.9921569, 1, 0, 1,
-0.870779, -1.514996, -0.8412176, 0.9843137, 1, 0, 1,
-0.8683295, -1.915775, -2.468385, 0.9803922, 1, 0, 1,
-0.8602372, 0.134011, -0.4838733, 0.972549, 1, 0, 1,
-0.8579634, 0.9849167, -0.7725507, 0.9686275, 1, 0, 1,
-0.8488002, -0.8622316, -2.409485, 0.9607843, 1, 0, 1,
-0.8472489, -0.2175118, -1.993627, 0.9568627, 1, 0, 1,
-0.8451436, -1.790854, -0.7029969, 0.9490196, 1, 0, 1,
-0.8403549, -0.2759165, -1.386073, 0.945098, 1, 0, 1,
-0.8351538, 0.6675758, -0.06882574, 0.9372549, 1, 0, 1,
-0.8312001, -1.92982, -2.567223, 0.9333333, 1, 0, 1,
-0.8296655, 1.86462, 0.07362308, 0.9254902, 1, 0, 1,
-0.8269871, -0.3011458, -1.645353, 0.9215686, 1, 0, 1,
-0.8242802, -1.009755, -1.890672, 0.9137255, 1, 0, 1,
-0.8226721, 0.9152755, 1.008947, 0.9098039, 1, 0, 1,
-0.8148052, -0.1112448, 0.4089838, 0.9019608, 1, 0, 1,
-0.8116805, 0.0743066, -1.331794, 0.8941177, 1, 0, 1,
-0.8097422, 0.0712858, -0.7346877, 0.8901961, 1, 0, 1,
-0.8065681, -0.1576284, 0.4450968, 0.8823529, 1, 0, 1,
-0.8048347, 1.468654, -0.935759, 0.8784314, 1, 0, 1,
-0.8039758, -1.145872, -2.979056, 0.8705882, 1, 0, 1,
-0.8008504, 0.0299718, -1.098437, 0.8666667, 1, 0, 1,
-0.7987403, 1.318628, -0.6925834, 0.8588235, 1, 0, 1,
-0.7975804, 0.8806481, 0.03298214, 0.854902, 1, 0, 1,
-0.7966933, 0.2755288, -1.332925, 0.8470588, 1, 0, 1,
-0.7964318, 1.676646, 0.9632587, 0.8431373, 1, 0, 1,
-0.794837, 0.1253689, -2.635165, 0.8352941, 1, 0, 1,
-0.7896314, -1.010985, -0.6800776, 0.8313726, 1, 0, 1,
-0.7855354, 0.2806359, -0.29363, 0.8235294, 1, 0, 1,
-0.7783861, -0.100819, -1.652733, 0.8196079, 1, 0, 1,
-0.7782519, -0.9170643, -3.715887, 0.8117647, 1, 0, 1,
-0.7759732, 0.8115028, -0.3117805, 0.8078431, 1, 0, 1,
-0.7737648, 1.52547, 0.3164228, 0.8, 1, 0, 1,
-0.7733287, -1.099847, -1.371736, 0.7921569, 1, 0, 1,
-0.7713189, 0.0851622, -3.212888, 0.7882353, 1, 0, 1,
-0.7709179, -0.9427414, -3.430032, 0.7803922, 1, 0, 1,
-0.7694964, -2.151858, -1.556972, 0.7764706, 1, 0, 1,
-0.7576106, 1.781436, -0.5866945, 0.7686275, 1, 0, 1,
-0.756358, 1.857925, -1.516188, 0.7647059, 1, 0, 1,
-0.7514182, 0.05926483, -2.003021, 0.7568628, 1, 0, 1,
-0.7493173, 2.095501, -1.021217, 0.7529412, 1, 0, 1,
-0.7450312, -1.150467, -3.179541, 0.7450981, 1, 0, 1,
-0.735621, -0.8157435, -1.731936, 0.7411765, 1, 0, 1,
-0.7350451, -0.7311325, -0.7820219, 0.7333333, 1, 0, 1,
-0.7337792, 0.9443448, -1.766121, 0.7294118, 1, 0, 1,
-0.7329401, 0.2351955, -2.119782, 0.7215686, 1, 0, 1,
-0.7294661, 0.9349167, 0.6717538, 0.7176471, 1, 0, 1,
-0.7292402, -1.172953, -1.563329, 0.7098039, 1, 0, 1,
-0.7290512, -1.813864, -3.674647, 0.7058824, 1, 0, 1,
-0.7207304, 1.029746, -1.022959, 0.6980392, 1, 0, 1,
-0.7198109, -0.5560139, -2.99807, 0.6901961, 1, 0, 1,
-0.7184891, -0.6315981, -3.183056, 0.6862745, 1, 0, 1,
-0.7177533, 0.6149888, -1.005198, 0.6784314, 1, 0, 1,
-0.717697, 0.2783494, -1.127558, 0.6745098, 1, 0, 1,
-0.7141591, -1.509991, -3.419052, 0.6666667, 1, 0, 1,
-0.7076411, 0.4367608, -1.670186, 0.6627451, 1, 0, 1,
-0.7050654, 0.7053401, -0.6789715, 0.654902, 1, 0, 1,
-0.7044057, -0.5254802, -2.482775, 0.6509804, 1, 0, 1,
-0.6999326, 1.067134, -0.4431887, 0.6431373, 1, 0, 1,
-0.6900364, 0.606492, -1.453013, 0.6392157, 1, 0, 1,
-0.6900336, 1.730451, 0.626467, 0.6313726, 1, 0, 1,
-0.6879917, -0.6904709, -4.531668, 0.627451, 1, 0, 1,
-0.6876833, -1.416661, -2.730963, 0.6196079, 1, 0, 1,
-0.6818736, 2.351746, -0.2010408, 0.6156863, 1, 0, 1,
-0.6789933, 0.9146276, -1.498609, 0.6078432, 1, 0, 1,
-0.6764414, -1.934792, -2.106072, 0.6039216, 1, 0, 1,
-0.6762766, 0.5689003, 0.07689982, 0.5960785, 1, 0, 1,
-0.6736118, 0.07180177, -0.6385447, 0.5882353, 1, 0, 1,
-0.6722615, 1.410465, -0.4073278, 0.5843138, 1, 0, 1,
-0.6713926, -1.184983, -2.264062, 0.5764706, 1, 0, 1,
-0.6650339, -0.2109097, -1.788748, 0.572549, 1, 0, 1,
-0.6610662, -0.4969873, -2.802893, 0.5647059, 1, 0, 1,
-0.6428682, 1.914833, -0.8714229, 0.5607843, 1, 0, 1,
-0.6424389, -0.1116026, -2.6539, 0.5529412, 1, 0, 1,
-0.6415355, -0.3438407, -3.062774, 0.5490196, 1, 0, 1,
-0.6384721, -0.4978125, -2.005469, 0.5411765, 1, 0, 1,
-0.6384677, 0.9204369, -1.726018, 0.5372549, 1, 0, 1,
-0.6317714, 0.3380229, -0.688932, 0.5294118, 1, 0, 1,
-0.6277068, -1.40429, -3.111316, 0.5254902, 1, 0, 1,
-0.6258325, 0.03172149, -0.8303366, 0.5176471, 1, 0, 1,
-0.6232038, -1.867587, -3.682617, 0.5137255, 1, 0, 1,
-0.6184804, -0.447484, -1.045409, 0.5058824, 1, 0, 1,
-0.6163448, -1.130509, -3.162913, 0.5019608, 1, 0, 1,
-0.615046, -0.3291736, -2.550849, 0.4941176, 1, 0, 1,
-0.6139828, -1.958186, -3.070658, 0.4862745, 1, 0, 1,
-0.608843, 0.798892, 0.7822874, 0.4823529, 1, 0, 1,
-0.6083899, -1.336336, -2.703507, 0.4745098, 1, 0, 1,
-0.5981636, -0.4554837, -1.356681, 0.4705882, 1, 0, 1,
-0.5954409, -0.403882, -0.4390947, 0.4627451, 1, 0, 1,
-0.5948719, -0.2770317, -3.78594, 0.4588235, 1, 0, 1,
-0.5941978, 0.6937566, -1.122328, 0.4509804, 1, 0, 1,
-0.5899204, -1.760745, -1.894599, 0.4470588, 1, 0, 1,
-0.5887388, 0.8841996, 0.05425373, 0.4392157, 1, 0, 1,
-0.586117, -0.7757373, 0.4287139, 0.4352941, 1, 0, 1,
-0.582012, 0.1943485, -0.3148485, 0.427451, 1, 0, 1,
-0.5792777, 0.1592971, -2.040062, 0.4235294, 1, 0, 1,
-0.5747094, 1.334179, 0.4620372, 0.4156863, 1, 0, 1,
-0.5640767, -0.03568684, -3.301812, 0.4117647, 1, 0, 1,
-0.5574396, 2.146838, 0.4286165, 0.4039216, 1, 0, 1,
-0.5522127, 0.3284319, -1.651314, 0.3960784, 1, 0, 1,
-0.5521352, -0.9015333, -1.203859, 0.3921569, 1, 0, 1,
-0.5515136, -0.877339, -0.8337315, 0.3843137, 1, 0, 1,
-0.5479495, -1.076346, -2.760744, 0.3803922, 1, 0, 1,
-0.5449364, 0.2250933, -3.016891, 0.372549, 1, 0, 1,
-0.5437941, -2.249533, -3.331048, 0.3686275, 1, 0, 1,
-0.5395972, -1.168078, -1.793704, 0.3607843, 1, 0, 1,
-0.5317293, -0.04791056, -1.976236, 0.3568628, 1, 0, 1,
-0.5303601, 0.8483019, 0.02828574, 0.3490196, 1, 0, 1,
-0.5295375, 0.6002457, -1.138369, 0.345098, 1, 0, 1,
-0.5291777, 0.6410136, 1.180858, 0.3372549, 1, 0, 1,
-0.5281132, 0.4009625, -0.3581186, 0.3333333, 1, 0, 1,
-0.5269194, -0.462898, -3.802251, 0.3254902, 1, 0, 1,
-0.5127847, -0.9310137, -2.132128, 0.3215686, 1, 0, 1,
-0.5125852, -0.2987064, -3.039939, 0.3137255, 1, 0, 1,
-0.510352, 0.1724424, -0.6561285, 0.3098039, 1, 0, 1,
-0.5089482, -1.341421, -2.666919, 0.3019608, 1, 0, 1,
-0.50707, 0.6621754, -0.1930251, 0.2941177, 1, 0, 1,
-0.5062767, 0.4410555, -1.969755, 0.2901961, 1, 0, 1,
-0.5054532, -2.562791, -2.202132, 0.282353, 1, 0, 1,
-0.5046216, -0.2512081, 0.01414238, 0.2784314, 1, 0, 1,
-0.5023356, 0.542879, -1.2483, 0.2705882, 1, 0, 1,
-0.5000727, 0.824253, -3.189493, 0.2666667, 1, 0, 1,
-0.4971481, 0.9957234, -0.05692267, 0.2588235, 1, 0, 1,
-0.4956496, 0.5121964, -0.09658526, 0.254902, 1, 0, 1,
-0.4791081, -0.1246883, -3.429776, 0.2470588, 1, 0, 1,
-0.4748886, 0.7859249, -2.032267, 0.2431373, 1, 0, 1,
-0.4724258, 0.6143796, 0.3168356, 0.2352941, 1, 0, 1,
-0.4684001, 0.2048387, -0.7812254, 0.2313726, 1, 0, 1,
-0.4676918, 1.272246, 0.06296019, 0.2235294, 1, 0, 1,
-0.4675628, -0.2404322, -0.670757, 0.2196078, 1, 0, 1,
-0.4596581, -1.250738, -1.666902, 0.2117647, 1, 0, 1,
-0.4571859, -0.4236144, -2.790514, 0.2078431, 1, 0, 1,
-0.453713, 1.609622, 0.7193791, 0.2, 1, 0, 1,
-0.4534836, 1.990381, 1.857727, 0.1921569, 1, 0, 1,
-0.4501392, -1.927244, -4.57764, 0.1882353, 1, 0, 1,
-0.4469218, 1.427186, -0.302012, 0.1803922, 1, 0, 1,
-0.4429768, -1.740995, -3.458646, 0.1764706, 1, 0, 1,
-0.4338671, -0.5125503, -4.328244, 0.1686275, 1, 0, 1,
-0.4287662, -0.2469088, -1.983615, 0.1647059, 1, 0, 1,
-0.422603, 0.6568422, -0.3024007, 0.1568628, 1, 0, 1,
-0.4170007, 0.08995991, -2.499005, 0.1529412, 1, 0, 1,
-0.4154512, -0.6680744, -3.766195, 0.145098, 1, 0, 1,
-0.4095677, -0.1846192, -2.604293, 0.1411765, 1, 0, 1,
-0.4025265, -0.10329, -2.307542, 0.1333333, 1, 0, 1,
-0.3994958, 0.1542566, 0.5674849, 0.1294118, 1, 0, 1,
-0.3990733, -0.5404997, -2.340949, 0.1215686, 1, 0, 1,
-0.3977821, 1.590522, -2.370298, 0.1176471, 1, 0, 1,
-0.3976797, -0.4362191, -2.681449, 0.1098039, 1, 0, 1,
-0.3974283, 0.6269674, 1.11739, 0.1058824, 1, 0, 1,
-0.396847, 0.2196717, -0.2986396, 0.09803922, 1, 0, 1,
-0.3949173, 0.6738622, -0.6378319, 0.09019608, 1, 0, 1,
-0.3891348, -1.565312, -1.742821, 0.08627451, 1, 0, 1,
-0.3886048, -1.03486, -3.043919, 0.07843138, 1, 0, 1,
-0.3834696, -0.9337475, -3.66645, 0.07450981, 1, 0, 1,
-0.3832062, 3.049035, -0.1337206, 0.06666667, 1, 0, 1,
-0.3783876, -1.686051, -3.345842, 0.0627451, 1, 0, 1,
-0.3660217, -2.062817, -4.746169, 0.05490196, 1, 0, 1,
-0.3646302, 0.9488386, -0.188719, 0.05098039, 1, 0, 1,
-0.3643642, 0.3136744, 0.2151341, 0.04313726, 1, 0, 1,
-0.3616265, -2.329413, -2.610663, 0.03921569, 1, 0, 1,
-0.354087, -0.2594753, -3.731173, 0.03137255, 1, 0, 1,
-0.3540235, -0.8189912, -1.521053, 0.02745098, 1, 0, 1,
-0.3519514, 0.06165501, -1.733438, 0.01960784, 1, 0, 1,
-0.3518553, -0.376705, -0.9843406, 0.01568628, 1, 0, 1,
-0.349401, -0.7144749, -1.476416, 0.007843138, 1, 0, 1,
-0.3481389, -0.7245864, -3.763327, 0.003921569, 1, 0, 1,
-0.3456016, 0.9730347, -0.1693323, 0, 1, 0.003921569, 1,
-0.3442701, -2.642879, -1.467282, 0, 1, 0.01176471, 1,
-0.3434207, 0.1510628, -1.85099, 0, 1, 0.01568628, 1,
-0.3424252, 0.3028456, 0.006660135, 0, 1, 0.02352941, 1,
-0.3344426, 1.577311, 0.4108639, 0, 1, 0.02745098, 1,
-0.3327517, -0.8732857, -2.146851, 0, 1, 0.03529412, 1,
-0.3285746, 1.674344, 0.1997463, 0, 1, 0.03921569, 1,
-0.3276092, 0.3457446, 0.4264016, 0, 1, 0.04705882, 1,
-0.327338, 1.154667, 2.241547, 0, 1, 0.05098039, 1,
-0.3251599, -0.4490675, -1.418183, 0, 1, 0.05882353, 1,
-0.3247811, -0.1439435, -1.965824, 0, 1, 0.0627451, 1,
-0.3241482, -0.2933869, -3.833114, 0, 1, 0.07058824, 1,
-0.3215809, 0.007388123, -3.198809, 0, 1, 0.07450981, 1,
-0.3189769, 1.113185, -0.6620873, 0, 1, 0.08235294, 1,
-0.3172304, 1.728387, -1.187465, 0, 1, 0.08627451, 1,
-0.3158408, -0.2031687, -3.347677, 0, 1, 0.09411765, 1,
-0.3157989, 0.5077976, -0.3708771, 0, 1, 0.1019608, 1,
-0.3149649, -0.241944, -1.818953, 0, 1, 0.1058824, 1,
-0.3127392, 0.003878318, -2.32692, 0, 1, 0.1137255, 1,
-0.3108461, -1.312005, -2.979182, 0, 1, 0.1176471, 1,
-0.3095796, 0.440834, -1.500981, 0, 1, 0.1254902, 1,
-0.3078748, -0.1323989, -1.740833, 0, 1, 0.1294118, 1,
-0.3058438, 0.4699504, 0.5110861, 0, 1, 0.1372549, 1,
-0.3049917, -0.0416332, -0.9351414, 0, 1, 0.1411765, 1,
-0.2982608, 0.8395429, -1.316569, 0, 1, 0.1490196, 1,
-0.2981144, 0.09439733, -1.277692, 0, 1, 0.1529412, 1,
-0.2974896, -1.420608, -3.75088, 0, 1, 0.1607843, 1,
-0.293288, 0.4112854, -0.5887417, 0, 1, 0.1647059, 1,
-0.2929545, 0.805665, 0.6272684, 0, 1, 0.172549, 1,
-0.2912239, 2.064861, -1.909881, 0, 1, 0.1764706, 1,
-0.2909223, 0.4492041, -0.9623486, 0, 1, 0.1843137, 1,
-0.2826028, -0.5937909, -1.9781, 0, 1, 0.1882353, 1,
-0.2824671, 0.4296937, -1.752738, 0, 1, 0.1960784, 1,
-0.2800015, -1.334708, -2.668791, 0, 1, 0.2039216, 1,
-0.2798074, -1.462939, -3.015162, 0, 1, 0.2078431, 1,
-0.279107, 0.1400392, -2.53371, 0, 1, 0.2156863, 1,
-0.2735931, 1.148545, -0.9192227, 0, 1, 0.2196078, 1,
-0.2733769, -0.6463209, -3.711108, 0, 1, 0.227451, 1,
-0.273122, 0.3195683, 1.602182, 0, 1, 0.2313726, 1,
-0.272203, -1.125403, -2.438476, 0, 1, 0.2392157, 1,
-0.267979, -0.3853563, -1.236479, 0, 1, 0.2431373, 1,
-0.2652397, 0.5779682, 0.1595508, 0, 1, 0.2509804, 1,
-0.2603605, -1.230093, -1.906678, 0, 1, 0.254902, 1,
-0.2602433, -0.390387, -3.45391, 0, 1, 0.2627451, 1,
-0.2582658, 0.1076186, -0.8318396, 0, 1, 0.2666667, 1,
-0.2578102, -1.158016, -0.7863066, 0, 1, 0.2745098, 1,
-0.2569073, -0.5932485, -3.409835, 0, 1, 0.2784314, 1,
-0.2534638, -0.6782269, -2.676979, 0, 1, 0.2862745, 1,
-0.2509249, -1.373095, -3.226781, 0, 1, 0.2901961, 1,
-0.2496492, 0.9730915, -1.531771, 0, 1, 0.2980392, 1,
-0.2431755, 0.185015, -0.201938, 0, 1, 0.3058824, 1,
-0.2422739, -0.7916144, -3.77471, 0, 1, 0.3098039, 1,
-0.2375614, -0.7867188, -3.546991, 0, 1, 0.3176471, 1,
-0.2342237, 0.1109487, -1.740881, 0, 1, 0.3215686, 1,
-0.2341459, 0.6185204, -2.655995, 0, 1, 0.3294118, 1,
-0.234071, 0.2393226, 0.1399863, 0, 1, 0.3333333, 1,
-0.2291323, 0.877001, -1.346167, 0, 1, 0.3411765, 1,
-0.2281516, -1.517831, -2.087269, 0, 1, 0.345098, 1,
-0.2280807, -1.440642, -3.894264, 0, 1, 0.3529412, 1,
-0.2279447, -0.8875149, -2.36208, 0, 1, 0.3568628, 1,
-0.2267317, 0.4817883, 0.265018, 0, 1, 0.3647059, 1,
-0.2245124, 0.4972665, -0.1135629, 0, 1, 0.3686275, 1,
-0.221209, 0.09728723, -1.461853, 0, 1, 0.3764706, 1,
-0.2212062, 0.1173309, -2.122082, 0, 1, 0.3803922, 1,
-0.2139628, 0.03238852, -2.617561, 0, 1, 0.3882353, 1,
-0.2134318, 2.059703, -0.4350811, 0, 1, 0.3921569, 1,
-0.2058086, -0.4942245, -2.868714, 0, 1, 0.4, 1,
-0.202125, -0.4825114, -0.8888728, 0, 1, 0.4078431, 1,
-0.1956134, -1.699592, -2.489733, 0, 1, 0.4117647, 1,
-0.194168, 0.9852207, -0.4270499, 0, 1, 0.4196078, 1,
-0.1941492, 0.5013081, -0.6092733, 0, 1, 0.4235294, 1,
-0.1912934, -0.7406559, -4.562053, 0, 1, 0.4313726, 1,
-0.190828, -0.3067477, -2.790484, 0, 1, 0.4352941, 1,
-0.1894568, -0.253198, -1.76228, 0, 1, 0.4431373, 1,
-0.1878589, 1.640702, 0.04916202, 0, 1, 0.4470588, 1,
-0.1876031, 1.463131, -1.087961, 0, 1, 0.454902, 1,
-0.1849688, -0.4776092, -2.112958, 0, 1, 0.4588235, 1,
-0.1847528, 1.099825, 0.0301268, 0, 1, 0.4666667, 1,
-0.1838266, 0.170922, -0.9616181, 0, 1, 0.4705882, 1,
-0.1819073, -0.3885841, -4.12112, 0, 1, 0.4784314, 1,
-0.1793639, 0.7984564, 0.2328643, 0, 1, 0.4823529, 1,
-0.1784412, 0.8518143, 1.154812, 0, 1, 0.4901961, 1,
-0.1766063, -0.1128724, -2.278233, 0, 1, 0.4941176, 1,
-0.1738485, 0.08452003, -0.08097663, 0, 1, 0.5019608, 1,
-0.171621, -0.6117099, -3.068755, 0, 1, 0.509804, 1,
-0.1686223, -0.7380281, -4.000756, 0, 1, 0.5137255, 1,
-0.1668831, 0.7851714, -0.06428669, 0, 1, 0.5215687, 1,
-0.1658607, -1.544277, -3.322282, 0, 1, 0.5254902, 1,
-0.1654932, -0.5588393, -1.532087, 0, 1, 0.5333334, 1,
-0.1618644, -1.305978, -3.967628, 0, 1, 0.5372549, 1,
-0.1596127, 0.4663929, -0.3157267, 0, 1, 0.5450981, 1,
-0.1585541, -2.071461, -4.795006, 0, 1, 0.5490196, 1,
-0.1538091, 1.916568, -0.5942846, 0, 1, 0.5568628, 1,
-0.1507231, 1.494142, -0.3438456, 0, 1, 0.5607843, 1,
-0.1507065, 1.031091, -2.150552, 0, 1, 0.5686275, 1,
-0.1501405, -0.8924342, -2.299379, 0, 1, 0.572549, 1,
-0.1447366, -0.224126, -2.118151, 0, 1, 0.5803922, 1,
-0.1395883, -0.637289, -3.222809, 0, 1, 0.5843138, 1,
-0.139339, 0.9057562, 0.05424025, 0, 1, 0.5921569, 1,
-0.1384445, -0.5115384, -3.300684, 0, 1, 0.5960785, 1,
-0.1378722, -0.6356332, -4.94833, 0, 1, 0.6039216, 1,
-0.1370261, -0.1510799, -2.036717, 0, 1, 0.6117647, 1,
-0.1352759, 0.6503583, -0.7646685, 0, 1, 0.6156863, 1,
-0.1304065, 0.4499467, -0.2432479, 0, 1, 0.6235294, 1,
-0.1213425, 0.0140785, -2.250741, 0, 1, 0.627451, 1,
-0.1187421, -0.530025, -3.507949, 0, 1, 0.6352941, 1,
-0.1176063, 0.7594864, 0.8964231, 0, 1, 0.6392157, 1,
-0.1128632, 0.1778838, -1.40151, 0, 1, 0.6470588, 1,
-0.1113451, -0.3415191, -4.727294, 0, 1, 0.6509804, 1,
-0.1107799, -1.250783, -2.272166, 0, 1, 0.6588235, 1,
-0.1105554, 1.171455, -1.008113, 0, 1, 0.6627451, 1,
-0.1059724, 1.270407, -0.606456, 0, 1, 0.6705883, 1,
-0.1052247, -0.2388198, -1.270533, 0, 1, 0.6745098, 1,
-0.09778915, -0.5488465, -1.860336, 0, 1, 0.682353, 1,
-0.09239569, 0.4228137, -2.197236, 0, 1, 0.6862745, 1,
-0.09163864, 3.406293, 1.055016, 0, 1, 0.6941177, 1,
-0.09039835, -0.5011914, -1.714433, 0, 1, 0.7019608, 1,
-0.08824735, -1.008752, -4.865821, 0, 1, 0.7058824, 1,
-0.08553884, -0.642207, -4.272593, 0, 1, 0.7137255, 1,
-0.07713114, 1.182164, -1.10953, 0, 1, 0.7176471, 1,
-0.07088657, -0.9660116, -3.708538, 0, 1, 0.7254902, 1,
-0.06994943, -1.782835, -1.868328, 0, 1, 0.7294118, 1,
-0.06889892, 1.406788, 0.5099158, 0, 1, 0.7372549, 1,
-0.06726926, -0.7336003, -5.222082, 0, 1, 0.7411765, 1,
-0.0661462, 0.3396178, 0.745568, 0, 1, 0.7490196, 1,
-0.06477221, -1.71728, -3.134266, 0, 1, 0.7529412, 1,
-0.06336795, 1.479227, 0.7502899, 0, 1, 0.7607843, 1,
-0.06188771, 0.9878972, 0.3799254, 0, 1, 0.7647059, 1,
-0.05991709, -1.555074, -1.356897, 0, 1, 0.772549, 1,
-0.05580598, 0.3258446, 0.3468672, 0, 1, 0.7764706, 1,
-0.04990417, 0.7476624, -1.067244, 0, 1, 0.7843137, 1,
-0.04785112, 0.3442157, 0.7609206, 0, 1, 0.7882353, 1,
-0.04667271, 1.866298, -1.709777, 0, 1, 0.7960784, 1,
-0.04287656, 0.6097638, -0.9971985, 0, 1, 0.8039216, 1,
-0.04278394, -0.562417, 0.1051752, 0, 1, 0.8078431, 1,
-0.04185494, 1.547871, 0.7596634, 0, 1, 0.8156863, 1,
-0.04175449, -1.511224, -3.859347, 0, 1, 0.8196079, 1,
-0.037296, -0.2820274, -4.677045, 0, 1, 0.827451, 1,
-0.03245372, 0.5364888, 0.7582957, 0, 1, 0.8313726, 1,
-0.02256636, 1.203231, 1.187515, 0, 1, 0.8392157, 1,
-0.02191677, -0.01436998, -2.68321, 0, 1, 0.8431373, 1,
-0.02182106, 0.9727129, -1.088656, 0, 1, 0.8509804, 1,
-0.01874827, 0.2781134, 0.5785394, 0, 1, 0.854902, 1,
-0.01759599, -0.7454817, -3.794971, 0, 1, 0.8627451, 1,
-0.01419143, 2.48393, -0.1168156, 0, 1, 0.8666667, 1,
-0.009256062, 0.2747151, -1.733933, 0, 1, 0.8745098, 1,
-0.009020583, -0.6394989, -2.902921, 0, 1, 0.8784314, 1,
-0.008234992, 0.5753852, 0.914658, 0, 1, 0.8862745, 1,
-0.005830854, -0.09885515, -2.707698, 0, 1, 0.8901961, 1,
-0.005237964, -0.9207532, -3.599539, 0, 1, 0.8980392, 1,
-0.003566256, 1.098926, -0.7524581, 0, 1, 0.9058824, 1,
-0.003401317, -0.7816812, -3.819979, 0, 1, 0.9098039, 1,
-0.002121434, -1.303394, -2.385775, 0, 1, 0.9176471, 1,
0.003168451, -1.583051, 3.425601, 0, 1, 0.9215686, 1,
0.008354381, -0.434876, 3.408546, 0, 1, 0.9294118, 1,
0.01115377, -2.000655, 1.918433, 0, 1, 0.9333333, 1,
0.01307716, -0.7839524, 1.493845, 0, 1, 0.9411765, 1,
0.01370535, -0.4802572, 4.617322, 0, 1, 0.945098, 1,
0.01585376, 0.8759038, 0.5997763, 0, 1, 0.9529412, 1,
0.01631786, -2.935712, 2.745404, 0, 1, 0.9568627, 1,
0.02149168, -0.1619753, 3.616328, 0, 1, 0.9647059, 1,
0.02186469, -0.810211, 2.813821, 0, 1, 0.9686275, 1,
0.0220846, 1.12271, -0.3996841, 0, 1, 0.9764706, 1,
0.02380961, -0.2805779, 3.348476, 0, 1, 0.9803922, 1,
0.02669548, -1.784318, 2.75423, 0, 1, 0.9882353, 1,
0.02762479, 1.311961, 0.7293952, 0, 1, 0.9921569, 1,
0.03392601, 0.9104138, -0.5544841, 0, 1, 1, 1,
0.03456731, -1.552802, 3.353254, 0, 0.9921569, 1, 1,
0.03569385, 0.297693, -0.2081963, 0, 0.9882353, 1, 1,
0.04833683, 0.001856009, 2.00035, 0, 0.9803922, 1, 1,
0.04835907, -0.2093546, 3.019207, 0, 0.9764706, 1, 1,
0.04837002, 0.7566392, -1.508308, 0, 0.9686275, 1, 1,
0.05023912, 0.3581411, 0.1282056, 0, 0.9647059, 1, 1,
0.0512941, -0.02957012, 0.1130751, 0, 0.9568627, 1, 1,
0.05430481, 1.100468, 0.9904998, 0, 0.9529412, 1, 1,
0.05636796, -0.4795304, 3.837309, 0, 0.945098, 1, 1,
0.06143836, 0.7475887, 0.05113478, 0, 0.9411765, 1, 1,
0.0630292, 1.362025, -0.007565375, 0, 0.9333333, 1, 1,
0.06483231, 0.244383, 0.8647027, 0, 0.9294118, 1, 1,
0.06512539, 0.2847576, 0.278619, 0, 0.9215686, 1, 1,
0.06903508, -0.4678277, 3.356389, 0, 0.9176471, 1, 1,
0.06906557, -0.6948156, 3.18603, 0, 0.9098039, 1, 1,
0.06967848, 0.766562, -1.30146, 0, 0.9058824, 1, 1,
0.0744566, -1.124912, 1.098302, 0, 0.8980392, 1, 1,
0.0764662, 0.3235717, 0.8963423, 0, 0.8901961, 1, 1,
0.07979164, -1.286102, 4.403847, 0, 0.8862745, 1, 1,
0.0813471, -0.2893718, 1.994298, 0, 0.8784314, 1, 1,
0.08197629, -1.653609, 2.053105, 0, 0.8745098, 1, 1,
0.08390478, 0.6628059, 0.90489, 0, 0.8666667, 1, 1,
0.08791105, -0.9112417, 3.142411, 0, 0.8627451, 1, 1,
0.09041391, 1.476662, -0.546156, 0, 0.854902, 1, 1,
0.09183031, 0.9771205, 0.9213856, 0, 0.8509804, 1, 1,
0.09636388, -3.212055, 2.837566, 0, 0.8431373, 1, 1,
0.111642, -0.07272413, 3.584593, 0, 0.8392157, 1, 1,
0.1121885, 1.46135, 1.36502, 0, 0.8313726, 1, 1,
0.1155721, 0.8932179, 0.5304095, 0, 0.827451, 1, 1,
0.1161249, -0.9146139, 2.307087, 0, 0.8196079, 1, 1,
0.1180665, -0.5944113, 3.794695, 0, 0.8156863, 1, 1,
0.1182226, -2.05867, 1.420331, 0, 0.8078431, 1, 1,
0.1189223, 1.178605, -0.2668014, 0, 0.8039216, 1, 1,
0.1235466, -0.7445565, 4.857589, 0, 0.7960784, 1, 1,
0.125632, 0.402437, -0.7641965, 0, 0.7882353, 1, 1,
0.1270059, -0.9483215, 2.66459, 0, 0.7843137, 1, 1,
0.1279563, 0.2858285, -1.136808, 0, 0.7764706, 1, 1,
0.1281316, 1.234739, 1.727969, 0, 0.772549, 1, 1,
0.1287454, -0.3754263, 3.60521, 0, 0.7647059, 1, 1,
0.1320767, 0.4650066, 1.940765, 0, 0.7607843, 1, 1,
0.1372753, 0.3873797, -0.1518776, 0, 0.7529412, 1, 1,
0.137444, -0.6530526, 3.31252, 0, 0.7490196, 1, 1,
0.1404748, 0.1028091, 3.852829, 0, 0.7411765, 1, 1,
0.1449614, -1.681351, 1.374063, 0, 0.7372549, 1, 1,
0.1486135, 0.06808884, 1.702605, 0, 0.7294118, 1, 1,
0.1492134, 2.404232, -2.606395, 0, 0.7254902, 1, 1,
0.1511215, -0.474082, 2.135663, 0, 0.7176471, 1, 1,
0.1525647, -1.542093, 2.400155, 0, 0.7137255, 1, 1,
0.159201, 0.6089458, -0.6875309, 0, 0.7058824, 1, 1,
0.1613178, 1.646935, -1.179001, 0, 0.6980392, 1, 1,
0.1718594, 0.4499335, 0.5179855, 0, 0.6941177, 1, 1,
0.1747397, -1.776937, 1.558941, 0, 0.6862745, 1, 1,
0.1751279, -0.6572507, 2.684067, 0, 0.682353, 1, 1,
0.1777785, -0.4771108, 2.372464, 0, 0.6745098, 1, 1,
0.1782147, -1.315669, 3.839829, 0, 0.6705883, 1, 1,
0.1788183, 1.702464, 1.526607, 0, 0.6627451, 1, 1,
0.1792519, 0.5846612, 1.175308, 0, 0.6588235, 1, 1,
0.1868244, -0.00713341, 2.57757, 0, 0.6509804, 1, 1,
0.1880382, 0.3997872, 1.532357, 0, 0.6470588, 1, 1,
0.1919402, 1.560637, -1.191744, 0, 0.6392157, 1, 1,
0.1961945, 0.1155379, 1.8451, 0, 0.6352941, 1, 1,
0.199954, 0.2370708, 1.691397, 0, 0.627451, 1, 1,
0.2003352, -0.298061, 2.933042, 0, 0.6235294, 1, 1,
0.2006748, -0.06082502, 3.727238, 0, 0.6156863, 1, 1,
0.2007766, 0.7367939, 1.158464, 0, 0.6117647, 1, 1,
0.201422, 0.8218101, 0.1984866, 0, 0.6039216, 1, 1,
0.2025903, -0.5272952, 1.979028, 0, 0.5960785, 1, 1,
0.2026543, -0.7452921, 3.992081, 0, 0.5921569, 1, 1,
0.2035518, 0.0602124, 0.7775669, 0, 0.5843138, 1, 1,
0.208426, 0.09770976, 1.008262, 0, 0.5803922, 1, 1,
0.2113278, -0.003685663, -0.1194705, 0, 0.572549, 1, 1,
0.2117183, 0.7633395, -0.7822304, 0, 0.5686275, 1, 1,
0.2117499, -0.8756064, 0.6875198, 0, 0.5607843, 1, 1,
0.2118389, 0.4284236, -0.5150298, 0, 0.5568628, 1, 1,
0.2142416, -1.338663, 3.595037, 0, 0.5490196, 1, 1,
0.2152738, 1.121283, 1.390466, 0, 0.5450981, 1, 1,
0.2167065, 0.0822691, -0.6887326, 0, 0.5372549, 1, 1,
0.2178741, -0.740205, 4.428104, 0, 0.5333334, 1, 1,
0.2187103, 0.726161, 1.560965, 0, 0.5254902, 1, 1,
0.2196204, -1.501848, 4.152614, 0, 0.5215687, 1, 1,
0.2212045, -0.005542017, -0.1384742, 0, 0.5137255, 1, 1,
0.2225666, -0.6595733, 3.765467, 0, 0.509804, 1, 1,
0.2238538, -0.1318339, 1.596537, 0, 0.5019608, 1, 1,
0.2244799, -1.16564, 3.533092, 0, 0.4941176, 1, 1,
0.2259216, -0.3823985, 1.357036, 0, 0.4901961, 1, 1,
0.2321846, 0.9313242, -0.3386037, 0, 0.4823529, 1, 1,
0.2344903, 0.6258624, 0.2938045, 0, 0.4784314, 1, 1,
0.2350616, 1.056506, 0.8488938, 0, 0.4705882, 1, 1,
0.2368835, -0.6852617, 2.364004, 0, 0.4666667, 1, 1,
0.2389464, -0.2578701, 1.895491, 0, 0.4588235, 1, 1,
0.2421963, 0.007555324, 2.964502, 0, 0.454902, 1, 1,
0.2438122, 1.049854, 1.467766, 0, 0.4470588, 1, 1,
0.2479254, -0.56446, 2.318187, 0, 0.4431373, 1, 1,
0.250318, 1.093645, -0.4961308, 0, 0.4352941, 1, 1,
0.2545045, -0.9899518, 1.599995, 0, 0.4313726, 1, 1,
0.2564235, 1.310856, 1.323677, 0, 0.4235294, 1, 1,
0.2625427, 0.1316549, 1.941943, 0, 0.4196078, 1, 1,
0.2643601, 0.5423529, -0.5168227, 0, 0.4117647, 1, 1,
0.2643896, -0.2510722, 2.150301, 0, 0.4078431, 1, 1,
0.2663858, -0.8964864, 4.29461, 0, 0.4, 1, 1,
0.2690036, 0.04308524, 1.158768, 0, 0.3921569, 1, 1,
0.2723068, -0.3054812, 2.531352, 0, 0.3882353, 1, 1,
0.2756533, 1.612067, -0.526661, 0, 0.3803922, 1, 1,
0.2775938, 1.555961, 0.6747021, 0, 0.3764706, 1, 1,
0.2802635, 0.2813232, 2.289407, 0, 0.3686275, 1, 1,
0.2847637, -0.00934035, 2.214639, 0, 0.3647059, 1, 1,
0.2852688, -0.2210645, 3.809228, 0, 0.3568628, 1, 1,
0.2872415, -1.380966, 5.166664, 0, 0.3529412, 1, 1,
0.2876966, 0.0211757, -0.1780389, 0, 0.345098, 1, 1,
0.2896444, -0.138135, 2.753507, 0, 0.3411765, 1, 1,
0.2938928, 0.1080102, -0.5475758, 0, 0.3333333, 1, 1,
0.2944393, 0.8697863, 0.4345435, 0, 0.3294118, 1, 1,
0.2965049, -0.7617184, 3.517213, 0, 0.3215686, 1, 1,
0.3028801, 0.08773057, 0.6972449, 0, 0.3176471, 1, 1,
0.3067974, -0.4499763, 0.9503813, 0, 0.3098039, 1, 1,
0.3073595, -1.552266, 2.265859, 0, 0.3058824, 1, 1,
0.3080262, -1.088037, 3.154506, 0, 0.2980392, 1, 1,
0.3093038, -0.1321531, 1.284507, 0, 0.2901961, 1, 1,
0.3130536, -1.064186, 2.979385, 0, 0.2862745, 1, 1,
0.313765, 0.2532, 2.370796, 0, 0.2784314, 1, 1,
0.3217673, 1.058396, -0.092219, 0, 0.2745098, 1, 1,
0.3220502, 2.066594, 1.018497, 0, 0.2666667, 1, 1,
0.3221504, -0.6701265, 2.481202, 0, 0.2627451, 1, 1,
0.3224284, 0.3925943, -0.4571722, 0, 0.254902, 1, 1,
0.3226531, 2.00593, -0.5205557, 0, 0.2509804, 1, 1,
0.323466, 0.3955294, 0.6495937, 0, 0.2431373, 1, 1,
0.326115, -0.3276142, 1.304752, 0, 0.2392157, 1, 1,
0.3262842, 0.4825741, -1.015214, 0, 0.2313726, 1, 1,
0.329971, 1.517649, -1.376076, 0, 0.227451, 1, 1,
0.3300422, -0.8025918, 1.466964, 0, 0.2196078, 1, 1,
0.3315374, 1.482985, -0.2522014, 0, 0.2156863, 1, 1,
0.3416419, 0.3520506, 0.2056609, 0, 0.2078431, 1, 1,
0.3441785, 2.302877, 0.1650913, 0, 0.2039216, 1, 1,
0.3448914, 0.009541155, 3.940902, 0, 0.1960784, 1, 1,
0.3469273, 1.162984, 0.8296241, 0, 0.1882353, 1, 1,
0.3481607, -1.126686, 3.452553, 0, 0.1843137, 1, 1,
0.348206, 0.009091918, 1.19118, 0, 0.1764706, 1, 1,
0.3501464, -0.9965369, 3.372832, 0, 0.172549, 1, 1,
0.3526014, 1.667837, 1.095256, 0, 0.1647059, 1, 1,
0.3528149, 0.7261677, 0.590687, 0, 0.1607843, 1, 1,
0.3593898, -0.6644536, 2.789509, 0, 0.1529412, 1, 1,
0.362334, 0.5681072, 0.4975935, 0, 0.1490196, 1, 1,
0.3701468, -1.480633, 1.599282, 0, 0.1411765, 1, 1,
0.3737538, 0.3102761, 1.57398, 0, 0.1372549, 1, 1,
0.373958, -1.294582, 2.920357, 0, 0.1294118, 1, 1,
0.3750233, 0.1180005, 1.617193, 0, 0.1254902, 1, 1,
0.3766677, 0.5741472, -0.7993526, 0, 0.1176471, 1, 1,
0.3867904, -0.2008622, 1.768925, 0, 0.1137255, 1, 1,
0.3874919, -0.4957818, 0.3567233, 0, 0.1058824, 1, 1,
0.3886259, 1.530959, -1.003285, 0, 0.09803922, 1, 1,
0.3901081, 1.527982, -0.6678503, 0, 0.09411765, 1, 1,
0.3903424, -0.9652348, 2.629748, 0, 0.08627451, 1, 1,
0.3914193, -1.027177, 2.903727, 0, 0.08235294, 1, 1,
0.3932059, -0.4300143, 2.156487, 0, 0.07450981, 1, 1,
0.3972052, -1.889711, 3.4768, 0, 0.07058824, 1, 1,
0.3992056, 1.706707, -0.7036399, 0, 0.0627451, 1, 1,
0.4022854, 0.3085229, 1.911344, 0, 0.05882353, 1, 1,
0.4051195, -0.5427933, 0.9219604, 0, 0.05098039, 1, 1,
0.4083381, 1.813395, -0.4174161, 0, 0.04705882, 1, 1,
0.4119927, -1.247937, 2.670314, 0, 0.03921569, 1, 1,
0.4191712, -0.7668628, 3.777575, 0, 0.03529412, 1, 1,
0.4202571, -0.8087016, 1.191773, 0, 0.02745098, 1, 1,
0.4208684, -1.635806, 2.323559, 0, 0.02352941, 1, 1,
0.4233348, -1.744958, 2.536443, 0, 0.01568628, 1, 1,
0.4236447, -1.061188, 1.459018, 0, 0.01176471, 1, 1,
0.4246171, -1.185756, 1.982228, 0, 0.003921569, 1, 1,
0.4275495, -0.4027744, 3.072762, 0.003921569, 0, 1, 1,
0.4302871, -0.6460557, 4.214582, 0.007843138, 0, 1, 1,
0.4366972, 0.2161131, 2.747113, 0.01568628, 0, 1, 1,
0.4374756, -1.641826, 2.738418, 0.01960784, 0, 1, 1,
0.4424364, 1.391878, -0.3915922, 0.02745098, 0, 1, 1,
0.4458161, 0.4665058, 0.5017225, 0.03137255, 0, 1, 1,
0.4460489, 0.3707729, 2.316039, 0.03921569, 0, 1, 1,
0.4476378, 0.7127807, 0.9365821, 0.04313726, 0, 1, 1,
0.4489908, 0.2969072, 1.255991, 0.05098039, 0, 1, 1,
0.4574392, -1.501351, 2.191531, 0.05490196, 0, 1, 1,
0.4587614, 1.942475, -0.1976637, 0.0627451, 0, 1, 1,
0.4602803, -0.7273967, 1.546843, 0.06666667, 0, 1, 1,
0.4604175, 1.128968, -0.693055, 0.07450981, 0, 1, 1,
0.4673042, -1.17584, 2.483911, 0.07843138, 0, 1, 1,
0.4701802, 1.294653, 0.08509019, 0.08627451, 0, 1, 1,
0.4706856, 0.9782398, -0.1749666, 0.09019608, 0, 1, 1,
0.476479, -0.3230755, 1.917258, 0.09803922, 0, 1, 1,
0.4793637, 1.667896, -0.3468824, 0.1058824, 0, 1, 1,
0.4842227, 1.188285, 0.3271206, 0.1098039, 0, 1, 1,
0.4848133, -0.4842502, 2.710855, 0.1176471, 0, 1, 1,
0.4886017, 0.057832, 1.403848, 0.1215686, 0, 1, 1,
0.4918246, -0.1879206, 1.492244, 0.1294118, 0, 1, 1,
0.4955779, -1.530498, 4.039299, 0.1333333, 0, 1, 1,
0.4961137, 0.2826259, 2.618677, 0.1411765, 0, 1, 1,
0.4988375, 1.39657, 0.8216525, 0.145098, 0, 1, 1,
0.5050542, -0.647004, 1.682012, 0.1529412, 0, 1, 1,
0.5082749, 0.356238, 0.4138621, 0.1568628, 0, 1, 1,
0.509399, 0.9112416, 1.687097, 0.1647059, 0, 1, 1,
0.5097618, 1.89606, -0.2165441, 0.1686275, 0, 1, 1,
0.5159574, -1.118615, 3.684031, 0.1764706, 0, 1, 1,
0.5221699, -0.7384648, 2.876719, 0.1803922, 0, 1, 1,
0.5258394, -0.4682136, 2.704465, 0.1882353, 0, 1, 1,
0.5288791, -0.1319254, 0.5948492, 0.1921569, 0, 1, 1,
0.5291831, 0.3005506, 0.8333027, 0.2, 0, 1, 1,
0.5317231, -0.8976216, 2.151806, 0.2078431, 0, 1, 1,
0.5356436, 0.1431802, 0.9962137, 0.2117647, 0, 1, 1,
0.5385169, -1.023448, 2.413531, 0.2196078, 0, 1, 1,
0.5388578, -0.3886852, 1.427618, 0.2235294, 0, 1, 1,
0.5406132, 2.504204, 0.5253186, 0.2313726, 0, 1, 1,
0.5412779, -0.5000346, 1.789143, 0.2352941, 0, 1, 1,
0.5417616, -0.3569574, 2.3544, 0.2431373, 0, 1, 1,
0.5421132, 0.3457374, -0.2656307, 0.2470588, 0, 1, 1,
0.5440881, -1.28359, 1.701695, 0.254902, 0, 1, 1,
0.5471412, -0.2924325, 2.286565, 0.2588235, 0, 1, 1,
0.5478857, 1.355455, 0.4769013, 0.2666667, 0, 1, 1,
0.5483981, 0.04742736, 3.865062, 0.2705882, 0, 1, 1,
0.5493626, -0.9811611, 2.788969, 0.2784314, 0, 1, 1,
0.5552346, -0.8263817, 3.053934, 0.282353, 0, 1, 1,
0.5586395, -0.5353729, 2.439436, 0.2901961, 0, 1, 1,
0.559242, -2.797265, 2.47106, 0.2941177, 0, 1, 1,
0.5649426, -0.6411107, 2.0927, 0.3019608, 0, 1, 1,
0.5672523, -1.453422, 1.193879, 0.3098039, 0, 1, 1,
0.5714606, 1.218296, 0.4864507, 0.3137255, 0, 1, 1,
0.576046, -0.5574668, 2.76974, 0.3215686, 0, 1, 1,
0.5808127, 2.048154, 0.5413555, 0.3254902, 0, 1, 1,
0.5836993, -1.029313, 1.919622, 0.3333333, 0, 1, 1,
0.5868893, -0.1455421, 1.904659, 0.3372549, 0, 1, 1,
0.5909641, -0.08825383, 3.270388, 0.345098, 0, 1, 1,
0.5989719, -0.9103822, 2.952702, 0.3490196, 0, 1, 1,
0.6011827, -0.5259113, 3.446416, 0.3568628, 0, 1, 1,
0.6017514, -0.9854041, 2.690786, 0.3607843, 0, 1, 1,
0.6019905, -0.2261053, 2.369241, 0.3686275, 0, 1, 1,
0.6051276, -0.2277283, 1.727407, 0.372549, 0, 1, 1,
0.6070648, -0.7338241, 3.927655, 0.3803922, 0, 1, 1,
0.6080912, -0.2948174, 1.310004, 0.3843137, 0, 1, 1,
0.6099154, -0.6023917, 1.088912, 0.3921569, 0, 1, 1,
0.6120012, -0.3709119, 1.322916, 0.3960784, 0, 1, 1,
0.61283, 0.5124322, 0.855803, 0.4039216, 0, 1, 1,
0.6143953, 1.070805, 0.5620772, 0.4117647, 0, 1, 1,
0.6146672, -0.9056964, 3.332493, 0.4156863, 0, 1, 1,
0.6230888, 0.6272463, 1.559377, 0.4235294, 0, 1, 1,
0.6237408, -0.7462537, 0.6202486, 0.427451, 0, 1, 1,
0.6274216, -2.434882, 2.401572, 0.4352941, 0, 1, 1,
0.6293467, -2.267275, 3.93873, 0.4392157, 0, 1, 1,
0.6307796, -1.835431, 1.920359, 0.4470588, 0, 1, 1,
0.6313854, 1.418567, 0.6003764, 0.4509804, 0, 1, 1,
0.633944, -0.5230598, 2.061441, 0.4588235, 0, 1, 1,
0.6348065, -0.2362491, -0.4693933, 0.4627451, 0, 1, 1,
0.6350621, 0.09618423, 0.8509328, 0.4705882, 0, 1, 1,
0.6445782, -0.3152443, 3.217977, 0.4745098, 0, 1, 1,
0.6483085, 0.7175395, 0.8813598, 0.4823529, 0, 1, 1,
0.6485807, -0.6559173, 3.000405, 0.4862745, 0, 1, 1,
0.6597003, -0.7932633, 0.5011337, 0.4941176, 0, 1, 1,
0.6625182, 0.4735473, -0.5374629, 0.5019608, 0, 1, 1,
0.66425, -0.9174184, 0.3065205, 0.5058824, 0, 1, 1,
0.6675632, 1.198261, 0.1710275, 0.5137255, 0, 1, 1,
0.672264, -0.3815371, 1.563439, 0.5176471, 0, 1, 1,
0.6773191, -0.0006096935, 1.653404, 0.5254902, 0, 1, 1,
0.6784333, 0.8489565, 3.228184, 0.5294118, 0, 1, 1,
0.6817845, -0.9412277, 1.165781, 0.5372549, 0, 1, 1,
0.6874845, 0.2367429, -0.08344616, 0.5411765, 0, 1, 1,
0.6890903, -0.2281526, 1.859765, 0.5490196, 0, 1, 1,
0.6898602, -0.2911588, 1.522805, 0.5529412, 0, 1, 1,
0.697479, -0.7499038, 3.372772, 0.5607843, 0, 1, 1,
0.699055, -1.585115, 1.903028, 0.5647059, 0, 1, 1,
0.702545, -0.4479451, 0.7872666, 0.572549, 0, 1, 1,
0.7080792, 2.068762, 0.3914649, 0.5764706, 0, 1, 1,
0.7143613, -0.1688191, 2.286466, 0.5843138, 0, 1, 1,
0.7158199, 0.6730973, 0.3806252, 0.5882353, 0, 1, 1,
0.7183872, -1.477241, 2.683511, 0.5960785, 0, 1, 1,
0.7195988, 0.3160625, 1.534864, 0.6039216, 0, 1, 1,
0.7230458, 0.4384442, -0.08907489, 0.6078432, 0, 1, 1,
0.726029, 0.8924254, -0.6745782, 0.6156863, 0, 1, 1,
0.7305081, 0.84382, 0.8265079, 0.6196079, 0, 1, 1,
0.7310398, 0.7344912, 1.391449, 0.627451, 0, 1, 1,
0.7477615, 0.467376, 1.832136, 0.6313726, 0, 1, 1,
0.7482585, -0.03422875, 0.7652646, 0.6392157, 0, 1, 1,
0.750285, -2.046144, 4.175251, 0.6431373, 0, 1, 1,
0.7578871, 0.1758161, -0.5213245, 0.6509804, 0, 1, 1,
0.7628826, 1.902561, 0.4877283, 0.654902, 0, 1, 1,
0.7650623, 1.243605, -0.1678299, 0.6627451, 0, 1, 1,
0.7690459, 0.2467126, 3.553997, 0.6666667, 0, 1, 1,
0.7728649, -0.5814492, 3.201281, 0.6745098, 0, 1, 1,
0.7741107, -0.3057922, 1.819589, 0.6784314, 0, 1, 1,
0.7768313, 0.8773735, 0.5895855, 0.6862745, 0, 1, 1,
0.7775511, -1.395317, 1.762285, 0.6901961, 0, 1, 1,
0.7799783, 1.123795, 1.162375, 0.6980392, 0, 1, 1,
0.786128, 1.399425, 0.01363802, 0.7058824, 0, 1, 1,
0.7864965, 0.3604524, 1.160567, 0.7098039, 0, 1, 1,
0.7915487, 0.09766286, 1.227185, 0.7176471, 0, 1, 1,
0.8016027, -0.4633852, 1.235583, 0.7215686, 0, 1, 1,
0.8019467, -1.801322, 3.87161, 0.7294118, 0, 1, 1,
0.8057733, 1.178831, 1.417867, 0.7333333, 0, 1, 1,
0.8061053, 0.4792356, -0.4388206, 0.7411765, 0, 1, 1,
0.8102194, -1.251842, 1.293865, 0.7450981, 0, 1, 1,
0.8136622, 0.02419886, 1.952503, 0.7529412, 0, 1, 1,
0.8272638, 0.585811, -0.335186, 0.7568628, 0, 1, 1,
0.8306516, 0.04718128, 1.749214, 0.7647059, 0, 1, 1,
0.8323038, -0.9673964, 3.062715, 0.7686275, 0, 1, 1,
0.8356425, 0.8032318, 1.526392, 0.7764706, 0, 1, 1,
0.8387352, -0.1351949, 1.543162, 0.7803922, 0, 1, 1,
0.8423153, 1.204927, -0.4256907, 0.7882353, 0, 1, 1,
0.8490193, -0.9575455, 2.65611, 0.7921569, 0, 1, 1,
0.8495568, 0.8258098, 1.079797, 0.8, 0, 1, 1,
0.8510375, 0.8862486, 1.875667, 0.8078431, 0, 1, 1,
0.8510486, -0.7365409, 2.128974, 0.8117647, 0, 1, 1,
0.8516936, -0.3810288, 3.473707, 0.8196079, 0, 1, 1,
0.8533091, -1.440166, 1.811933, 0.8235294, 0, 1, 1,
0.8589828, 0.0658728, 1.05551, 0.8313726, 0, 1, 1,
0.8632591, -0.2751813, 1.080651, 0.8352941, 0, 1, 1,
0.8662022, 0.6185138, 1.959084, 0.8431373, 0, 1, 1,
0.8675415, 1.699279, 1.247263, 0.8470588, 0, 1, 1,
0.870653, 0.8305085, -0.3092627, 0.854902, 0, 1, 1,
0.8709406, -0.7703361, 4.861934, 0.8588235, 0, 1, 1,
0.8721726, -0.0009986296, -0.6779261, 0.8666667, 0, 1, 1,
0.8901254, -1.188982, 3.505334, 0.8705882, 0, 1, 1,
0.8913807, -0.3191563, 1.664519, 0.8784314, 0, 1, 1,
0.8935307, -0.3242449, 4.589435, 0.8823529, 0, 1, 1,
0.8985172, 0.521684, 0.4533638, 0.8901961, 0, 1, 1,
0.9133511, -0.005248402, 3.046589, 0.8941177, 0, 1, 1,
0.9266348, -0.7111667, 0.8935407, 0.9019608, 0, 1, 1,
0.9329935, 0.4451953, 1.701822, 0.9098039, 0, 1, 1,
0.9368024, 1.771038, -0.647554, 0.9137255, 0, 1, 1,
0.939413, -1.150483, 2.378595, 0.9215686, 0, 1, 1,
0.9419287, 1.224882, -0.4054543, 0.9254902, 0, 1, 1,
0.9529793, 0.09553339, 1.163349, 0.9333333, 0, 1, 1,
0.9541628, 1.403754, 0.03222549, 0.9372549, 0, 1, 1,
0.9562944, -2.151026, 4.160295, 0.945098, 0, 1, 1,
0.9583376, -0.4180761, 2.910633, 0.9490196, 0, 1, 1,
0.9585246, -0.4334212, 2.707216, 0.9568627, 0, 1, 1,
0.9691763, 2.863149, 0.008344711, 0.9607843, 0, 1, 1,
0.96997, -0.3609237, 3.182785, 0.9686275, 0, 1, 1,
0.9769441, 1.61872, 0.8458253, 0.972549, 0, 1, 1,
0.9790838, 0.2949337, 2.073694, 0.9803922, 0, 1, 1,
0.9799091, 1.154367, 0.1238188, 0.9843137, 0, 1, 1,
0.9851844, -0.3751095, 1.395396, 0.9921569, 0, 1, 1,
0.9904187, 1.92536, -1.201699, 0.9960784, 0, 1, 1,
1.005885, -1.753314, 2.184371, 1, 0, 0.9960784, 1,
1.023169, 1.153565, -0.9841429, 1, 0, 0.9882353, 1,
1.025733, -0.2940044, 4.00281, 1, 0, 0.9843137, 1,
1.037942, -1.637683, 2.056497, 1, 0, 0.9764706, 1,
1.039996, 0.2995085, 2.564996, 1, 0, 0.972549, 1,
1.054268, -1.00982, 2.118692, 1, 0, 0.9647059, 1,
1.05529, 0.1395765, 0.7931958, 1, 0, 0.9607843, 1,
1.056623, -0.5382986, 3.199339, 1, 0, 0.9529412, 1,
1.057082, -0.1012405, 0.8183134, 1, 0, 0.9490196, 1,
1.057407, -0.3160009, 2.918276, 1, 0, 0.9411765, 1,
1.058272, 0.08820473, -0.3163939, 1, 0, 0.9372549, 1,
1.062574, -0.06508035, 1.773431, 1, 0, 0.9294118, 1,
1.063354, -0.2653387, 2.521626, 1, 0, 0.9254902, 1,
1.063544, -0.5639565, 1.70075, 1, 0, 0.9176471, 1,
1.065374, 0.1658634, 0.8350003, 1, 0, 0.9137255, 1,
1.067669, 1.669791, 1.790363, 1, 0, 0.9058824, 1,
1.077294, 0.9488751, 1.794206, 1, 0, 0.9019608, 1,
1.078031, -0.2050888, 3.063021, 1, 0, 0.8941177, 1,
1.08194, -1.237846, 2.422293, 1, 0, 0.8862745, 1,
1.08413, 0.05339216, 1.284934, 1, 0, 0.8823529, 1,
1.097691, 0.6921093, 0.8382097, 1, 0, 0.8745098, 1,
1.097691, 0.2767964, 1.293088, 1, 0, 0.8705882, 1,
1.098701, -1.201734, 1.846414, 1, 0, 0.8627451, 1,
1.101752, -0.9251291, 3.510862, 1, 0, 0.8588235, 1,
1.109978, -0.6572729, 2.728204, 1, 0, 0.8509804, 1,
1.130565, 0.3004013, 2.322795, 1, 0, 0.8470588, 1,
1.132805, 0.5810005, 1.92355, 1, 0, 0.8392157, 1,
1.133498, -0.3449044, 1.538953, 1, 0, 0.8352941, 1,
1.154568, -0.6484173, 3.447798, 1, 0, 0.827451, 1,
1.157105, -0.04148668, 2.102347, 1, 0, 0.8235294, 1,
1.158962, -0.001098066, 1.168267, 1, 0, 0.8156863, 1,
1.159913, 0.3721777, 1.425763, 1, 0, 0.8117647, 1,
1.160599, 0.05053007, 1.364437, 1, 0, 0.8039216, 1,
1.163253, 0.4886041, 1.807139, 1, 0, 0.7960784, 1,
1.176365, -1.12403, 2.680714, 1, 0, 0.7921569, 1,
1.17751, 0.1615902, 0.5498576, 1, 0, 0.7843137, 1,
1.178608, 0.7808334, 0.504828, 1, 0, 0.7803922, 1,
1.18514, -1.544477, 3.204215, 1, 0, 0.772549, 1,
1.185243, -0.8326645, 1.320096, 1, 0, 0.7686275, 1,
1.188515, -1.480102, 2.668651, 1, 0, 0.7607843, 1,
1.189825, 0.6249405, 2.9861, 1, 0, 0.7568628, 1,
1.190321, 0.8548625, 1.864941, 1, 0, 0.7490196, 1,
1.190875, -1.543334, 3.74188, 1, 0, 0.7450981, 1,
1.193465, -0.5839993, 2.703529, 1, 0, 0.7372549, 1,
1.198416, 1.010497, -0.2249979, 1, 0, 0.7333333, 1,
1.202814, -1.305266, 2.923284, 1, 0, 0.7254902, 1,
1.204466, 0.7706338, 1.872058, 1, 0, 0.7215686, 1,
1.208372, -0.6242663, 1.057342, 1, 0, 0.7137255, 1,
1.212093, -0.3280211, 0.6773663, 1, 0, 0.7098039, 1,
1.212854, 0.259623, -0.2338793, 1, 0, 0.7019608, 1,
1.217144, 0.5580786, -0.5239524, 1, 0, 0.6941177, 1,
1.218756, 0.2702372, 1.185679, 1, 0, 0.6901961, 1,
1.242798, -1.862603, 2.504795, 1, 0, 0.682353, 1,
1.243336, -0.1015463, 1.383171, 1, 0, 0.6784314, 1,
1.243701, -0.3322182, 2.992864, 1, 0, 0.6705883, 1,
1.24874, -0.2089324, 0.8109313, 1, 0, 0.6666667, 1,
1.251613, 0.7554418, 1.00293, 1, 0, 0.6588235, 1,
1.252643, 0.2208176, 1.422878, 1, 0, 0.654902, 1,
1.259192, 0.7357345, 2.024337, 1, 0, 0.6470588, 1,
1.259247, -0.06773735, 2.113937, 1, 0, 0.6431373, 1,
1.26732, 0.9181647, 3.443766, 1, 0, 0.6352941, 1,
1.268046, -1.116266, 2.248728, 1, 0, 0.6313726, 1,
1.281663, 0.1587278, -1.024537, 1, 0, 0.6235294, 1,
1.285093, -1.256623, 2.619928, 1, 0, 0.6196079, 1,
1.285757, -0.07807406, 1.315344, 1, 0, 0.6117647, 1,
1.297529, -2.119818, 3.616385, 1, 0, 0.6078432, 1,
1.310343, 1.722572, 0.7342482, 1, 0, 0.6, 1,
1.317785, -0.7296702, 2.683227, 1, 0, 0.5921569, 1,
1.322055, -0.6277061, 2.738814, 1, 0, 0.5882353, 1,
1.328, -0.4809524, 1.987913, 1, 0, 0.5803922, 1,
1.329241, -1.777044, 3.637397, 1, 0, 0.5764706, 1,
1.331241, 1.309258, 1.914589, 1, 0, 0.5686275, 1,
1.336402, -1.444355, 1.711683, 1, 0, 0.5647059, 1,
1.339102, 1.913024, 1.330761, 1, 0, 0.5568628, 1,
1.341057, 0.2199969, 2.535407, 1, 0, 0.5529412, 1,
1.347747, 1.375315, -0.07295945, 1, 0, 0.5450981, 1,
1.348726, 0.9501289, 0.6863876, 1, 0, 0.5411765, 1,
1.352153, 0.6073071, 0.8654463, 1, 0, 0.5333334, 1,
1.353997, -0.9691333, 1.28324, 1, 0, 0.5294118, 1,
1.359601, 0.3030193, 1.510867, 1, 0, 0.5215687, 1,
1.373079, -0.6297508, 2.484415, 1, 0, 0.5176471, 1,
1.376387, -0.332188, 2.477348, 1, 0, 0.509804, 1,
1.379045, 0.8342904, 0.9939633, 1, 0, 0.5058824, 1,
1.383278, -1.161789, 1.527453, 1, 0, 0.4980392, 1,
1.388722, 1.219538, 0.3677372, 1, 0, 0.4901961, 1,
1.392436, -2.212932, 2.805133, 1, 0, 0.4862745, 1,
1.395392, -0.8691754, 0.7345307, 1, 0, 0.4784314, 1,
1.402481, 0.138429, 0.7962778, 1, 0, 0.4745098, 1,
1.412695, 0.5639356, 1.488216, 1, 0, 0.4666667, 1,
1.418808, -0.8349075, 3.31509, 1, 0, 0.4627451, 1,
1.422595, 0.1518331, 2.624679, 1, 0, 0.454902, 1,
1.431032, 0.14152, -0.2092579, 1, 0, 0.4509804, 1,
1.431988, 0.3065553, 1.717505, 1, 0, 0.4431373, 1,
1.440686, 0.336016, -0.6616597, 1, 0, 0.4392157, 1,
1.441675, 0.2475159, 1.201262, 1, 0, 0.4313726, 1,
1.45019, 0.07808918, 2.985205, 1, 0, 0.427451, 1,
1.46043, 0.7485749, 0.9717253, 1, 0, 0.4196078, 1,
1.465346, -0.3047255, 1.815248, 1, 0, 0.4156863, 1,
1.465353, -1.250125, 1.496556, 1, 0, 0.4078431, 1,
1.47528, -0.2385159, 0.4304678, 1, 0, 0.4039216, 1,
1.493319, 0.9393631, 2.8548, 1, 0, 0.3960784, 1,
1.498183, 2.892382, 0.7296621, 1, 0, 0.3882353, 1,
1.514083, -0.3467347, 0.5102221, 1, 0, 0.3843137, 1,
1.517523, 0.204254, 2.707628, 1, 0, 0.3764706, 1,
1.524604, -1.081748, 2.872798, 1, 0, 0.372549, 1,
1.565644, 2.031775, 1.782453, 1, 0, 0.3647059, 1,
1.572052, -2.07419, 1.952268, 1, 0, 0.3607843, 1,
1.588793, 0.9660931, 0.1254897, 1, 0, 0.3529412, 1,
1.619966, -0.1737908, 1.885133, 1, 0, 0.3490196, 1,
1.631554, 1.755174, 0.1805542, 1, 0, 0.3411765, 1,
1.665739, -1.403199, 2.313164, 1, 0, 0.3372549, 1,
1.670734, 1.513346, -1.192802, 1, 0, 0.3294118, 1,
1.680494, 0.8084489, 1.225163, 1, 0, 0.3254902, 1,
1.685538, -0.7692087, 0.6080557, 1, 0, 0.3176471, 1,
1.69183, 0.1644934, 1.701714, 1, 0, 0.3137255, 1,
1.714463, 0.4630673, 2.18823, 1, 0, 0.3058824, 1,
1.730282, 1.357533, 1.5014, 1, 0, 0.2980392, 1,
1.738612, 0.708958, 0.003150557, 1, 0, 0.2941177, 1,
1.739991, 0.8898526, 1.800279, 1, 0, 0.2862745, 1,
1.746745, -0.9404189, 0.5932897, 1, 0, 0.282353, 1,
1.751385, 1.622017, 1.351965, 1, 0, 0.2745098, 1,
1.759678, 1.478721, 1.271049, 1, 0, 0.2705882, 1,
1.768657, -0.5454796, 2.744089, 1, 0, 0.2627451, 1,
1.785603, -0.4757002, 0.2137299, 1, 0, 0.2588235, 1,
1.81493, -1.016289, 1.501408, 1, 0, 0.2509804, 1,
1.822824, -0.5887626, 2.07786, 1, 0, 0.2470588, 1,
1.840037, 0.3461064, 0.2671584, 1, 0, 0.2392157, 1,
1.851983, 1.186112, 0.6125435, 1, 0, 0.2352941, 1,
1.867643, -0.366667, 1.314447, 1, 0, 0.227451, 1,
1.867731, -0.5717474, 0.6402457, 1, 0, 0.2235294, 1,
1.873573, 0.290936, 0.3490748, 1, 0, 0.2156863, 1,
1.894553, 0.7089723, 1.597683, 1, 0, 0.2117647, 1,
1.910942, 0.2509093, 3.193722, 1, 0, 0.2039216, 1,
1.929985, -0.5593634, 3.131709, 1, 0, 0.1960784, 1,
1.938809, 0.2928731, 1.098784, 1, 0, 0.1921569, 1,
1.960616, -2.037622, 2.360103, 1, 0, 0.1843137, 1,
1.984799, 0.2476912, 1.491917, 1, 0, 0.1803922, 1,
2.008922, 0.4117261, 1.023821, 1, 0, 0.172549, 1,
2.013046, -1.233012, 1.402179, 1, 0, 0.1686275, 1,
2.043045, 1.341365, -0.7667513, 1, 0, 0.1607843, 1,
2.064004, -0.3066312, 2.397933, 1, 0, 0.1568628, 1,
2.101683, 1.662211, 0.4982271, 1, 0, 0.1490196, 1,
2.104006, -0.3849557, 2.421582, 1, 0, 0.145098, 1,
2.146328, 0.07209297, 1.567421, 1, 0, 0.1372549, 1,
2.183402, 1.991144, 1.309475, 1, 0, 0.1333333, 1,
2.20612, 0.8596952, 1.583176, 1, 0, 0.1254902, 1,
2.215745, -0.1977247, 2.67784, 1, 0, 0.1215686, 1,
2.235888, 0.5887032, 2.431582, 1, 0, 0.1137255, 1,
2.245908, 1.86784, 0.6769425, 1, 0, 0.1098039, 1,
2.246917, -0.5283975, 3.412356, 1, 0, 0.1019608, 1,
2.255118, -1.551552, 2.446006, 1, 0, 0.09411765, 1,
2.277152, -0.6960952, 2.460837, 1, 0, 0.09019608, 1,
2.322255, 0.5584338, 0.3133858, 1, 0, 0.08235294, 1,
2.407043, -1.05557, 1.155435, 1, 0, 0.07843138, 1,
2.419951, -0.2508826, 2.340251, 1, 0, 0.07058824, 1,
2.448975, 0.3358377, 1.808903, 1, 0, 0.06666667, 1,
2.514728, -0.5783904, 1.64882, 1, 0, 0.05882353, 1,
2.556667, -0.6482912, 2.192735, 1, 0, 0.05490196, 1,
2.559691, -2.405932, 1.837103, 1, 0, 0.04705882, 1,
2.685763, -1.418384, 2.87936, 1, 0, 0.04313726, 1,
2.692122, -0.6408944, 0.09057956, 1, 0, 0.03529412, 1,
2.705744, -0.9417598, 2.091416, 1, 0, 0.03137255, 1,
2.832717, 0.6906621, 2.372073, 1, 0, 0.02352941, 1,
2.970501, 0.935553, 2.278797, 1, 0, 0.01960784, 1,
3.123531, -0.55142, 0.8188743, 1, 0, 0.01176471, 1,
3.246619, -0.8050068, 1.369191, 1, 0, 0.007843138, 1
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
-0.05986774, -4.333865, -6.982975, 0, -0.5, 0.5, 0.5,
-0.05986774, -4.333865, -6.982975, 1, -0.5, 0.5, 0.5,
-0.05986774, -4.333865, -6.982975, 1, 1.5, 0.5, 0.5,
-0.05986774, -4.333865, -6.982975, 0, 1.5, 0.5, 0.5
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
-4.487254, 0.09711885, -6.982975, 0, -0.5, 0.5, 0.5,
-4.487254, 0.09711885, -6.982975, 1, -0.5, 0.5, 0.5,
-4.487254, 0.09711885, -6.982975, 1, 1.5, 0.5, 0.5,
-4.487254, 0.09711885, -6.982975, 0, 1.5, 0.5, 0.5
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
-4.487254, -4.333865, -0.02770901, 0, -0.5, 0.5, 0.5,
-4.487254, -4.333865, -0.02770901, 1, -0.5, 0.5, 0.5,
-4.487254, -4.333865, -0.02770901, 1, 1.5, 0.5, 0.5,
-4.487254, -4.333865, -0.02770901, 0, 1.5, 0.5, 0.5
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
-3, -3.31133, -5.377913,
3, -3.31133, -5.377913,
-3, -3.31133, -5.377913,
-3, -3.481753, -5.645423,
-2, -3.31133, -5.377913,
-2, -3.481753, -5.645423,
-1, -3.31133, -5.377913,
-1, -3.481753, -5.645423,
0, -3.31133, -5.377913,
0, -3.481753, -5.645423,
1, -3.31133, -5.377913,
1, -3.481753, -5.645423,
2, -3.31133, -5.377913,
2, -3.481753, -5.645423,
3, -3.31133, -5.377913,
3, -3.481753, -5.645423
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
-3, -3.822598, -6.180444, 0, -0.5, 0.5, 0.5,
-3, -3.822598, -6.180444, 1, -0.5, 0.5, 0.5,
-3, -3.822598, -6.180444, 1, 1.5, 0.5, 0.5,
-3, -3.822598, -6.180444, 0, 1.5, 0.5, 0.5,
-2, -3.822598, -6.180444, 0, -0.5, 0.5, 0.5,
-2, -3.822598, -6.180444, 1, -0.5, 0.5, 0.5,
-2, -3.822598, -6.180444, 1, 1.5, 0.5, 0.5,
-2, -3.822598, -6.180444, 0, 1.5, 0.5, 0.5,
-1, -3.822598, -6.180444, 0, -0.5, 0.5, 0.5,
-1, -3.822598, -6.180444, 1, -0.5, 0.5, 0.5,
-1, -3.822598, -6.180444, 1, 1.5, 0.5, 0.5,
-1, -3.822598, -6.180444, 0, 1.5, 0.5, 0.5,
0, -3.822598, -6.180444, 0, -0.5, 0.5, 0.5,
0, -3.822598, -6.180444, 1, -0.5, 0.5, 0.5,
0, -3.822598, -6.180444, 1, 1.5, 0.5, 0.5,
0, -3.822598, -6.180444, 0, 1.5, 0.5, 0.5,
1, -3.822598, -6.180444, 0, -0.5, 0.5, 0.5,
1, -3.822598, -6.180444, 1, -0.5, 0.5, 0.5,
1, -3.822598, -6.180444, 1, 1.5, 0.5, 0.5,
1, -3.822598, -6.180444, 0, 1.5, 0.5, 0.5,
2, -3.822598, -6.180444, 0, -0.5, 0.5, 0.5,
2, -3.822598, -6.180444, 1, -0.5, 0.5, 0.5,
2, -3.822598, -6.180444, 1, 1.5, 0.5, 0.5,
2, -3.822598, -6.180444, 0, 1.5, 0.5, 0.5,
3, -3.822598, -6.180444, 0, -0.5, 0.5, 0.5,
3, -3.822598, -6.180444, 1, -0.5, 0.5, 0.5,
3, -3.822598, -6.180444, 1, 1.5, 0.5, 0.5,
3, -3.822598, -6.180444, 0, 1.5, 0.5, 0.5
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
-3.465549, -3, -5.377913,
-3.465549, 3, -5.377913,
-3.465549, -3, -5.377913,
-3.635834, -3, -5.645423,
-3.465549, -2, -5.377913,
-3.635834, -2, -5.645423,
-3.465549, -1, -5.377913,
-3.635834, -1, -5.645423,
-3.465549, 0, -5.377913,
-3.635834, 0, -5.645423,
-3.465549, 1, -5.377913,
-3.635834, 1, -5.645423,
-3.465549, 2, -5.377913,
-3.635834, 2, -5.645423,
-3.465549, 3, -5.377913,
-3.635834, 3, -5.645423
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
-3.976402, -3, -6.180444, 0, -0.5, 0.5, 0.5,
-3.976402, -3, -6.180444, 1, -0.5, 0.5, 0.5,
-3.976402, -3, -6.180444, 1, 1.5, 0.5, 0.5,
-3.976402, -3, -6.180444, 0, 1.5, 0.5, 0.5,
-3.976402, -2, -6.180444, 0, -0.5, 0.5, 0.5,
-3.976402, -2, -6.180444, 1, -0.5, 0.5, 0.5,
-3.976402, -2, -6.180444, 1, 1.5, 0.5, 0.5,
-3.976402, -2, -6.180444, 0, 1.5, 0.5, 0.5,
-3.976402, -1, -6.180444, 0, -0.5, 0.5, 0.5,
-3.976402, -1, -6.180444, 1, -0.5, 0.5, 0.5,
-3.976402, -1, -6.180444, 1, 1.5, 0.5, 0.5,
-3.976402, -1, -6.180444, 0, 1.5, 0.5, 0.5,
-3.976402, 0, -6.180444, 0, -0.5, 0.5, 0.5,
-3.976402, 0, -6.180444, 1, -0.5, 0.5, 0.5,
-3.976402, 0, -6.180444, 1, 1.5, 0.5, 0.5,
-3.976402, 0, -6.180444, 0, 1.5, 0.5, 0.5,
-3.976402, 1, -6.180444, 0, -0.5, 0.5, 0.5,
-3.976402, 1, -6.180444, 1, -0.5, 0.5, 0.5,
-3.976402, 1, -6.180444, 1, 1.5, 0.5, 0.5,
-3.976402, 1, -6.180444, 0, 1.5, 0.5, 0.5,
-3.976402, 2, -6.180444, 0, -0.5, 0.5, 0.5,
-3.976402, 2, -6.180444, 1, -0.5, 0.5, 0.5,
-3.976402, 2, -6.180444, 1, 1.5, 0.5, 0.5,
-3.976402, 2, -6.180444, 0, 1.5, 0.5, 0.5,
-3.976402, 3, -6.180444, 0, -0.5, 0.5, 0.5,
-3.976402, 3, -6.180444, 1, -0.5, 0.5, 0.5,
-3.976402, 3, -6.180444, 1, 1.5, 0.5, 0.5,
-3.976402, 3, -6.180444, 0, 1.5, 0.5, 0.5
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
-3.465549, -3.31133, -4,
-3.465549, -3.31133, 4,
-3.465549, -3.31133, -4,
-3.635834, -3.481753, -4,
-3.465549, -3.31133, -2,
-3.635834, -3.481753, -2,
-3.465549, -3.31133, 0,
-3.635834, -3.481753, 0,
-3.465549, -3.31133, 2,
-3.635834, -3.481753, 2,
-3.465549, -3.31133, 4,
-3.635834, -3.481753, 4
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
-3.976402, -3.822598, -4, 0, -0.5, 0.5, 0.5,
-3.976402, -3.822598, -4, 1, -0.5, 0.5, 0.5,
-3.976402, -3.822598, -4, 1, 1.5, 0.5, 0.5,
-3.976402, -3.822598, -4, 0, 1.5, 0.5, 0.5,
-3.976402, -3.822598, -2, 0, -0.5, 0.5, 0.5,
-3.976402, -3.822598, -2, 1, -0.5, 0.5, 0.5,
-3.976402, -3.822598, -2, 1, 1.5, 0.5, 0.5,
-3.976402, -3.822598, -2, 0, 1.5, 0.5, 0.5,
-3.976402, -3.822598, 0, 0, -0.5, 0.5, 0.5,
-3.976402, -3.822598, 0, 1, -0.5, 0.5, 0.5,
-3.976402, -3.822598, 0, 1, 1.5, 0.5, 0.5,
-3.976402, -3.822598, 0, 0, 1.5, 0.5, 0.5,
-3.976402, -3.822598, 2, 0, -0.5, 0.5, 0.5,
-3.976402, -3.822598, 2, 1, -0.5, 0.5, 0.5,
-3.976402, -3.822598, 2, 1, 1.5, 0.5, 0.5,
-3.976402, -3.822598, 2, 0, 1.5, 0.5, 0.5,
-3.976402, -3.822598, 4, 0, -0.5, 0.5, 0.5,
-3.976402, -3.822598, 4, 1, -0.5, 0.5, 0.5,
-3.976402, -3.822598, 4, 1, 1.5, 0.5, 0.5,
-3.976402, -3.822598, 4, 0, 1.5, 0.5, 0.5
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
-3.465549, -3.31133, -5.377913,
-3.465549, 3.505568, -5.377913,
-3.465549, -3.31133, 5.322495,
-3.465549, 3.505568, 5.322495,
-3.465549, -3.31133, -5.377913,
-3.465549, -3.31133, 5.322495,
-3.465549, 3.505568, -5.377913,
-3.465549, 3.505568, 5.322495,
-3.465549, -3.31133, -5.377913,
3.345814, -3.31133, -5.377913,
-3.465549, -3.31133, 5.322495,
3.345814, -3.31133, 5.322495,
-3.465549, 3.505568, -5.377913,
3.345814, 3.505568, -5.377913,
-3.465549, 3.505568, 5.322495,
3.345814, 3.505568, 5.322495,
3.345814, -3.31133, -5.377913,
3.345814, 3.505568, -5.377913,
3.345814, -3.31133, 5.322495,
3.345814, 3.505568, 5.322495,
3.345814, -3.31133, -5.377913,
3.345814, -3.31133, 5.322495,
3.345814, 3.505568, -5.377913,
3.345814, 3.505568, 5.322495
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
var radius = 7.689386;
var distance = 34.21095;
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
mvMatrix.translate( 0.05986774, -0.09711885, 0.02770901 );
mvMatrix.scale( 1.220595, 1.219604, 0.7769717 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.21095);
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
InChI_1S_C12H11Cl2NO<-read.table("InChI_1S_C12H11Cl2NO.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C12H11Cl2NO$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C12H11Cl2NO' not found
```

```r
y<-InChI_1S_C12H11Cl2NO$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C12H11Cl2NO' not found
```

```r
z<-InChI_1S_C12H11Cl2NO$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C12H11Cl2NO' not found
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
-3.366355, -1.191815, -3.958476, 0, 0, 1, 1, 1,
-2.906567, -1.111447, 0.3312808, 1, 0, 0, 1, 1,
-2.844863, 0.4833626, -0.7562064, 1, 0, 0, 1, 1,
-2.601536, 0.3288347, -1.171564, 1, 0, 0, 1, 1,
-2.516308, 0.7274632, -0.8851898, 1, 0, 0, 1, 1,
-2.443968, 0.27531, -0.8786902, 1, 0, 0, 1, 1,
-2.436278, -1.131397, -1.967088, 0, 0, 0, 1, 1,
-2.430073, 0.4725863, -0.5882283, 0, 0, 0, 1, 1,
-2.423978, 0.296365, -0.9707333, 0, 0, 0, 1, 1,
-2.418301, -0.07187463, -0.5166987, 0, 0, 0, 1, 1,
-2.418047, -0.7200094, -1.850336, 0, 0, 0, 1, 1,
-2.373645, -0.2105123, -3.702112, 0, 0, 0, 1, 1,
-2.356468, -0.247537, -2.461083, 0, 0, 0, 1, 1,
-2.34877, -0.01886616, -1.568661, 1, 1, 1, 1, 1,
-2.304454, 0.07373468, -2.456984, 1, 1, 1, 1, 1,
-2.28089, 1.801225, -0.4974306, 1, 1, 1, 1, 1,
-2.276988, -0.03811331, -1.506, 1, 1, 1, 1, 1,
-2.262436, 1.327703, -2.831481, 1, 1, 1, 1, 1,
-2.193111, -0.4935948, -1.502745, 1, 1, 1, 1, 1,
-2.190157, 1.4183, -0.6137673, 1, 1, 1, 1, 1,
-2.088377, -0.2996771, -2.799068, 1, 1, 1, 1, 1,
-2.042434, -0.09644687, -2.774298, 1, 1, 1, 1, 1,
-2.036356, 0.256529, -2.886861, 1, 1, 1, 1, 1,
-2.001949, 1.290297, -2.29272, 1, 1, 1, 1, 1,
-1.999051, -1.395134, -2.812343, 1, 1, 1, 1, 1,
-1.978688, -0.7291939, -2.053849, 1, 1, 1, 1, 1,
-1.963273, -0.182009, -1.602344, 1, 1, 1, 1, 1,
-1.960574, 0.06016611, -1.498215, 1, 1, 1, 1, 1,
-1.958361, 1.191968, 0.1925063, 0, 0, 1, 1, 1,
-1.926897, 1.541533, 0.2051838, 1, 0, 0, 1, 1,
-1.925804, -0.5601293, -1.094885, 1, 0, 0, 1, 1,
-1.898572, 0.2843623, -1.399338, 1, 0, 0, 1, 1,
-1.870983, -0.840993, -1.670709, 1, 0, 0, 1, 1,
-1.85327, -0.1472673, -0.6247289, 1, 0, 0, 1, 1,
-1.846949, -0.4809962, -3.003597, 0, 0, 0, 1, 1,
-1.79425, 0.929059, -0.9858317, 0, 0, 0, 1, 1,
-1.766183, 0.6474916, -0.5543227, 0, 0, 0, 1, 1,
-1.761535, 1.655763, -0.1922211, 0, 0, 0, 1, 1,
-1.730529, 1.513589, -0.6815519, 0, 0, 0, 1, 1,
-1.729757, 0.4073964, -1.612867, 0, 0, 0, 1, 1,
-1.726333, 0.196394, -1.328688, 0, 0, 0, 1, 1,
-1.712797, -0.4590929, -2.738548, 1, 1, 1, 1, 1,
-1.702176, 0.1218549, -0.4205729, 1, 1, 1, 1, 1,
-1.685421, -0.3548139, -3.299996, 1, 1, 1, 1, 1,
-1.680391, 0.2071533, -0.6408409, 1, 1, 1, 1, 1,
-1.674056, -0.5930467, -2.444042, 1, 1, 1, 1, 1,
-1.658977, -0.2747935, -0.8727413, 1, 1, 1, 1, 1,
-1.651201, 0.1503264, -0.1549889, 1, 1, 1, 1, 1,
-1.650954, 0.8324927, 0.8812873, 1, 1, 1, 1, 1,
-1.64384, -1.22626, -3.111426, 1, 1, 1, 1, 1,
-1.641173, 0.5629374, -2.474542, 1, 1, 1, 1, 1,
-1.617551, -1.227442, -2.709038, 1, 1, 1, 1, 1,
-1.607427, 0.3011527, -1.059408, 1, 1, 1, 1, 1,
-1.595827, -0.7763696, -1.446706, 1, 1, 1, 1, 1,
-1.587584, -0.856493, -2.250524, 1, 1, 1, 1, 1,
-1.568763, -1.080263, -3.379358, 1, 1, 1, 1, 1,
-1.561484, 0.7561656, -2.733862, 0, 0, 1, 1, 1,
-1.559216, 1.536525, -1.666944, 1, 0, 0, 1, 1,
-1.553722, 0.6842038, -0.7168679, 1, 0, 0, 1, 1,
-1.553507, -0.2239068, -0.7581024, 1, 0, 0, 1, 1,
-1.537183, 0.03024768, -2.610066, 1, 0, 0, 1, 1,
-1.528504, -0.9048367, -0.9611633, 1, 0, 0, 1, 1,
-1.503881, 0.4441159, -0.03722609, 0, 0, 0, 1, 1,
-1.501959, -1.228045, -1.764583, 0, 0, 0, 1, 1,
-1.487706, 0.2686083, -1.394881, 0, 0, 0, 1, 1,
-1.477805, 0.4756985, -0.74896, 0, 0, 0, 1, 1,
-1.461832, -0.1777746, -2.694813, 0, 0, 0, 1, 1,
-1.455479, -0.06317637, -3.669796, 0, 0, 0, 1, 1,
-1.444084, 1.004937, 0.1651396, 0, 0, 0, 1, 1,
-1.442265, 1.380621, -2.411225, 1, 1, 1, 1, 1,
-1.441014, 0.9166664, -0.02626193, 1, 1, 1, 1, 1,
-1.434448, -1.80397, -3.486885, 1, 1, 1, 1, 1,
-1.432888, 0.08895443, -4.988887, 1, 1, 1, 1, 1,
-1.429298, 0.6422751, -1.426647, 1, 1, 1, 1, 1,
-1.391342, -1.899625, -0.7555084, 1, 1, 1, 1, 1,
-1.385775, -1.334751, -2.966581, 1, 1, 1, 1, 1,
-1.380049, 0.5757232, -1.277953, 1, 1, 1, 1, 1,
-1.373699, -0.01833156, -1.060818, 1, 1, 1, 1, 1,
-1.373467, -1.731603, -1.851356, 1, 1, 1, 1, 1,
-1.369722, 0.09840879, -2.145303, 1, 1, 1, 1, 1,
-1.357499, -1.113502, -3.531667, 1, 1, 1, 1, 1,
-1.351753, -0.8892704, -2.537692, 1, 1, 1, 1, 1,
-1.347531, 0.6243309, -1.819081, 1, 1, 1, 1, 1,
-1.346721, -1.29115, -2.892235, 1, 1, 1, 1, 1,
-1.334579, -0.1021091, -1.925223, 0, 0, 1, 1, 1,
-1.315507, 0.6658056, -2.750421, 1, 0, 0, 1, 1,
-1.307364, 1.673507, 1.177165, 1, 0, 0, 1, 1,
-1.306558, 0.8111573, -1.677857, 1, 0, 0, 1, 1,
-1.300451, -1.365423, -1.643983, 1, 0, 0, 1, 1,
-1.296347, 0.07105628, -1.792758, 1, 0, 0, 1, 1,
-1.289002, -0.5778933, -1.68297, 0, 0, 0, 1, 1,
-1.284817, 1.878071, -1.485737, 0, 0, 0, 1, 1,
-1.270848, -0.1028594, -0.3233377, 0, 0, 0, 1, 1,
-1.269488, -0.6808895, -2.598436, 0, 0, 0, 1, 1,
-1.265542, 1.549943, 0.932648, 0, 0, 0, 1, 1,
-1.25591, -0.9002513, -1.560562, 0, 0, 0, 1, 1,
-1.254804, 0.582917, -1.000266, 0, 0, 0, 1, 1,
-1.251182, 1.608875, -2.184942, 1, 1, 1, 1, 1,
-1.248338, -1.254558, -1.152495, 1, 1, 1, 1, 1,
-1.237529, -2.505957, -0.8933969, 1, 1, 1, 1, 1,
-1.234889, 0.08134941, -1.695643, 1, 1, 1, 1, 1,
-1.233573, 0.03545451, -0.7853157, 1, 1, 1, 1, 1,
-1.231782, -1.350285, -1.68833, 1, 1, 1, 1, 1,
-1.229122, -0.3315141, -2.461245, 1, 1, 1, 1, 1,
-1.222618, 0.8591664, -2.057629, 1, 1, 1, 1, 1,
-1.218711, 0.5479119, -2.681361, 1, 1, 1, 1, 1,
-1.209391, -0.4016312, -1.841879, 1, 1, 1, 1, 1,
-1.20494, 1.080339, 0.9242256, 1, 1, 1, 1, 1,
-1.19685, -1.422085, -2.706001, 1, 1, 1, 1, 1,
-1.1937, -0.1826769, 0.09430812, 1, 1, 1, 1, 1,
-1.182219, 1.018141, -1.509512, 1, 1, 1, 1, 1,
-1.178629, 0.9146103, -0.2684309, 1, 1, 1, 1, 1,
-1.163785, 0.5133327, -1.366152, 0, 0, 1, 1, 1,
-1.161618, -0.6772338, -2.834432, 1, 0, 0, 1, 1,
-1.130522, -1.416545, -2.892505, 1, 0, 0, 1, 1,
-1.12691, 1.41575, -1.745632, 1, 0, 0, 1, 1,
-1.126712, 1.084855, -1.866085, 1, 0, 0, 1, 1,
-1.114142, -0.7356972, -0.7052252, 1, 0, 0, 1, 1,
-1.112388, 1.393995, -0.5167865, 0, 0, 0, 1, 1,
-1.108645, 0.5322489, -0.5449778, 0, 0, 0, 1, 1,
-1.104656, 2.68023, -1.55929, 0, 0, 0, 1, 1,
-1.101892, -0.1796784, -2.602011, 0, 0, 0, 1, 1,
-1.100416, -0.6540929, -3.151331, 0, 0, 0, 1, 1,
-1.097922, -0.6056004, -0.746566, 0, 0, 0, 1, 1,
-1.089095, -1.904041, -1.704714, 0, 0, 0, 1, 1,
-1.088058, -0.5629294, -2.562944, 1, 1, 1, 1, 1,
-1.075263, -1.452833, -2.165339, 1, 1, 1, 1, 1,
-1.070868, 0.9770108, 0.8076653, 1, 1, 1, 1, 1,
-1.064987, -0.3593283, -3.67236, 1, 1, 1, 1, 1,
-1.063612, 0.9564152, -0.4400181, 1, 1, 1, 1, 1,
-1.061811, 0.7555324, 0.8469298, 1, 1, 1, 1, 1,
-1.059664, -0.447038, -1.231809, 1, 1, 1, 1, 1,
-1.052849, -1.740639, -3.269259, 1, 1, 1, 1, 1,
-1.041358, 0.005764486, -0.8432367, 1, 1, 1, 1, 1,
-1.034822, -1.389986, -2.718665, 1, 1, 1, 1, 1,
-1.027422, -0.6797547, -2.021878, 1, 1, 1, 1, 1,
-1.025317, -1.352643, -3.363136, 1, 1, 1, 1, 1,
-1.017352, 0.06281409, -1.562477, 1, 1, 1, 1, 1,
-1.014705, -0.1657674, -0.6538004, 1, 1, 1, 1, 1,
-1.011144, 0.7067544, 0.1063506, 1, 1, 1, 1, 1,
-1.000514, 0.5412456, -0.5870196, 0, 0, 1, 1, 1,
-0.9711658, -0.782464, -1.969138, 1, 0, 0, 1, 1,
-0.9705355, 0.9028533, -0.5928189, 1, 0, 0, 1, 1,
-0.9581837, -0.3727826, -2.348886, 1, 0, 0, 1, 1,
-0.9572949, 0.2425036, -1.158467, 1, 0, 0, 1, 1,
-0.9480767, -0.5090144, -0.1694954, 1, 0, 0, 1, 1,
-0.9441833, -0.7218337, -2.015033, 0, 0, 0, 1, 1,
-0.9346507, 0.0986069, -3.549207, 0, 0, 0, 1, 1,
-0.9296446, 0.07825349, -1.638777, 0, 0, 0, 1, 1,
-0.9277142, 1.058079, 1.556649, 0, 0, 0, 1, 1,
-0.9241613, -1.369377, -3.646235, 0, 0, 0, 1, 1,
-0.923349, -2.215142, -2.149478, 0, 0, 0, 1, 1,
-0.9163235, -0.6231723, -2.0264, 0, 0, 0, 1, 1,
-0.9154568, -0.6829222, -3.370769, 1, 1, 1, 1, 1,
-0.91269, -0.5465584, -2.904691, 1, 1, 1, 1, 1,
-0.9046025, -0.330371, -3.21517, 1, 1, 1, 1, 1,
-0.9044719, -0.2073122, -2.999023, 1, 1, 1, 1, 1,
-0.9007922, -0.1255661, -2.08391, 1, 1, 1, 1, 1,
-0.8983594, 0.2965129, -0.5869812, 1, 1, 1, 1, 1,
-0.8939263, -0.8894343, -0.3857307, 1, 1, 1, 1, 1,
-0.8930742, 0.0389123, -2.731163, 1, 1, 1, 1, 1,
-0.8924502, -1.030544, -1.918571, 1, 1, 1, 1, 1,
-0.8847763, -0.6988587, -3.000446, 1, 1, 1, 1, 1,
-0.8832182, -1.219636, -2.172746, 1, 1, 1, 1, 1,
-0.8814047, 0.158774, -1.96176, 1, 1, 1, 1, 1,
-0.8781006, -2.65089, -0.5062601, 1, 1, 1, 1, 1,
-0.8762083, -1.185881, -2.48199, 1, 1, 1, 1, 1,
-0.8750653, -0.1782915, -2.8413, 1, 1, 1, 1, 1,
-0.8710757, 1.48234, -0.5943807, 0, 0, 1, 1, 1,
-0.870779, -1.514996, -0.8412176, 1, 0, 0, 1, 1,
-0.8683295, -1.915775, -2.468385, 1, 0, 0, 1, 1,
-0.8602372, 0.134011, -0.4838733, 1, 0, 0, 1, 1,
-0.8579634, 0.9849167, -0.7725507, 1, 0, 0, 1, 1,
-0.8488002, -0.8622316, -2.409485, 1, 0, 0, 1, 1,
-0.8472489, -0.2175118, -1.993627, 0, 0, 0, 1, 1,
-0.8451436, -1.790854, -0.7029969, 0, 0, 0, 1, 1,
-0.8403549, -0.2759165, -1.386073, 0, 0, 0, 1, 1,
-0.8351538, 0.6675758, -0.06882574, 0, 0, 0, 1, 1,
-0.8312001, -1.92982, -2.567223, 0, 0, 0, 1, 1,
-0.8296655, 1.86462, 0.07362308, 0, 0, 0, 1, 1,
-0.8269871, -0.3011458, -1.645353, 0, 0, 0, 1, 1,
-0.8242802, -1.009755, -1.890672, 1, 1, 1, 1, 1,
-0.8226721, 0.9152755, 1.008947, 1, 1, 1, 1, 1,
-0.8148052, -0.1112448, 0.4089838, 1, 1, 1, 1, 1,
-0.8116805, 0.0743066, -1.331794, 1, 1, 1, 1, 1,
-0.8097422, 0.0712858, -0.7346877, 1, 1, 1, 1, 1,
-0.8065681, -0.1576284, 0.4450968, 1, 1, 1, 1, 1,
-0.8048347, 1.468654, -0.935759, 1, 1, 1, 1, 1,
-0.8039758, -1.145872, -2.979056, 1, 1, 1, 1, 1,
-0.8008504, 0.0299718, -1.098437, 1, 1, 1, 1, 1,
-0.7987403, 1.318628, -0.6925834, 1, 1, 1, 1, 1,
-0.7975804, 0.8806481, 0.03298214, 1, 1, 1, 1, 1,
-0.7966933, 0.2755288, -1.332925, 1, 1, 1, 1, 1,
-0.7964318, 1.676646, 0.9632587, 1, 1, 1, 1, 1,
-0.794837, 0.1253689, -2.635165, 1, 1, 1, 1, 1,
-0.7896314, -1.010985, -0.6800776, 1, 1, 1, 1, 1,
-0.7855354, 0.2806359, -0.29363, 0, 0, 1, 1, 1,
-0.7783861, -0.100819, -1.652733, 1, 0, 0, 1, 1,
-0.7782519, -0.9170643, -3.715887, 1, 0, 0, 1, 1,
-0.7759732, 0.8115028, -0.3117805, 1, 0, 0, 1, 1,
-0.7737648, 1.52547, 0.3164228, 1, 0, 0, 1, 1,
-0.7733287, -1.099847, -1.371736, 1, 0, 0, 1, 1,
-0.7713189, 0.0851622, -3.212888, 0, 0, 0, 1, 1,
-0.7709179, -0.9427414, -3.430032, 0, 0, 0, 1, 1,
-0.7694964, -2.151858, -1.556972, 0, 0, 0, 1, 1,
-0.7576106, 1.781436, -0.5866945, 0, 0, 0, 1, 1,
-0.756358, 1.857925, -1.516188, 0, 0, 0, 1, 1,
-0.7514182, 0.05926483, -2.003021, 0, 0, 0, 1, 1,
-0.7493173, 2.095501, -1.021217, 0, 0, 0, 1, 1,
-0.7450312, -1.150467, -3.179541, 1, 1, 1, 1, 1,
-0.735621, -0.8157435, -1.731936, 1, 1, 1, 1, 1,
-0.7350451, -0.7311325, -0.7820219, 1, 1, 1, 1, 1,
-0.7337792, 0.9443448, -1.766121, 1, 1, 1, 1, 1,
-0.7329401, 0.2351955, -2.119782, 1, 1, 1, 1, 1,
-0.7294661, 0.9349167, 0.6717538, 1, 1, 1, 1, 1,
-0.7292402, -1.172953, -1.563329, 1, 1, 1, 1, 1,
-0.7290512, -1.813864, -3.674647, 1, 1, 1, 1, 1,
-0.7207304, 1.029746, -1.022959, 1, 1, 1, 1, 1,
-0.7198109, -0.5560139, -2.99807, 1, 1, 1, 1, 1,
-0.7184891, -0.6315981, -3.183056, 1, 1, 1, 1, 1,
-0.7177533, 0.6149888, -1.005198, 1, 1, 1, 1, 1,
-0.717697, 0.2783494, -1.127558, 1, 1, 1, 1, 1,
-0.7141591, -1.509991, -3.419052, 1, 1, 1, 1, 1,
-0.7076411, 0.4367608, -1.670186, 1, 1, 1, 1, 1,
-0.7050654, 0.7053401, -0.6789715, 0, 0, 1, 1, 1,
-0.7044057, -0.5254802, -2.482775, 1, 0, 0, 1, 1,
-0.6999326, 1.067134, -0.4431887, 1, 0, 0, 1, 1,
-0.6900364, 0.606492, -1.453013, 1, 0, 0, 1, 1,
-0.6900336, 1.730451, 0.626467, 1, 0, 0, 1, 1,
-0.6879917, -0.6904709, -4.531668, 1, 0, 0, 1, 1,
-0.6876833, -1.416661, -2.730963, 0, 0, 0, 1, 1,
-0.6818736, 2.351746, -0.2010408, 0, 0, 0, 1, 1,
-0.6789933, 0.9146276, -1.498609, 0, 0, 0, 1, 1,
-0.6764414, -1.934792, -2.106072, 0, 0, 0, 1, 1,
-0.6762766, 0.5689003, 0.07689982, 0, 0, 0, 1, 1,
-0.6736118, 0.07180177, -0.6385447, 0, 0, 0, 1, 1,
-0.6722615, 1.410465, -0.4073278, 0, 0, 0, 1, 1,
-0.6713926, -1.184983, -2.264062, 1, 1, 1, 1, 1,
-0.6650339, -0.2109097, -1.788748, 1, 1, 1, 1, 1,
-0.6610662, -0.4969873, -2.802893, 1, 1, 1, 1, 1,
-0.6428682, 1.914833, -0.8714229, 1, 1, 1, 1, 1,
-0.6424389, -0.1116026, -2.6539, 1, 1, 1, 1, 1,
-0.6415355, -0.3438407, -3.062774, 1, 1, 1, 1, 1,
-0.6384721, -0.4978125, -2.005469, 1, 1, 1, 1, 1,
-0.6384677, 0.9204369, -1.726018, 1, 1, 1, 1, 1,
-0.6317714, 0.3380229, -0.688932, 1, 1, 1, 1, 1,
-0.6277068, -1.40429, -3.111316, 1, 1, 1, 1, 1,
-0.6258325, 0.03172149, -0.8303366, 1, 1, 1, 1, 1,
-0.6232038, -1.867587, -3.682617, 1, 1, 1, 1, 1,
-0.6184804, -0.447484, -1.045409, 1, 1, 1, 1, 1,
-0.6163448, -1.130509, -3.162913, 1, 1, 1, 1, 1,
-0.615046, -0.3291736, -2.550849, 1, 1, 1, 1, 1,
-0.6139828, -1.958186, -3.070658, 0, 0, 1, 1, 1,
-0.608843, 0.798892, 0.7822874, 1, 0, 0, 1, 1,
-0.6083899, -1.336336, -2.703507, 1, 0, 0, 1, 1,
-0.5981636, -0.4554837, -1.356681, 1, 0, 0, 1, 1,
-0.5954409, -0.403882, -0.4390947, 1, 0, 0, 1, 1,
-0.5948719, -0.2770317, -3.78594, 1, 0, 0, 1, 1,
-0.5941978, 0.6937566, -1.122328, 0, 0, 0, 1, 1,
-0.5899204, -1.760745, -1.894599, 0, 0, 0, 1, 1,
-0.5887388, 0.8841996, 0.05425373, 0, 0, 0, 1, 1,
-0.586117, -0.7757373, 0.4287139, 0, 0, 0, 1, 1,
-0.582012, 0.1943485, -0.3148485, 0, 0, 0, 1, 1,
-0.5792777, 0.1592971, -2.040062, 0, 0, 0, 1, 1,
-0.5747094, 1.334179, 0.4620372, 0, 0, 0, 1, 1,
-0.5640767, -0.03568684, -3.301812, 1, 1, 1, 1, 1,
-0.5574396, 2.146838, 0.4286165, 1, 1, 1, 1, 1,
-0.5522127, 0.3284319, -1.651314, 1, 1, 1, 1, 1,
-0.5521352, -0.9015333, -1.203859, 1, 1, 1, 1, 1,
-0.5515136, -0.877339, -0.8337315, 1, 1, 1, 1, 1,
-0.5479495, -1.076346, -2.760744, 1, 1, 1, 1, 1,
-0.5449364, 0.2250933, -3.016891, 1, 1, 1, 1, 1,
-0.5437941, -2.249533, -3.331048, 1, 1, 1, 1, 1,
-0.5395972, -1.168078, -1.793704, 1, 1, 1, 1, 1,
-0.5317293, -0.04791056, -1.976236, 1, 1, 1, 1, 1,
-0.5303601, 0.8483019, 0.02828574, 1, 1, 1, 1, 1,
-0.5295375, 0.6002457, -1.138369, 1, 1, 1, 1, 1,
-0.5291777, 0.6410136, 1.180858, 1, 1, 1, 1, 1,
-0.5281132, 0.4009625, -0.3581186, 1, 1, 1, 1, 1,
-0.5269194, -0.462898, -3.802251, 1, 1, 1, 1, 1,
-0.5127847, -0.9310137, -2.132128, 0, 0, 1, 1, 1,
-0.5125852, -0.2987064, -3.039939, 1, 0, 0, 1, 1,
-0.510352, 0.1724424, -0.6561285, 1, 0, 0, 1, 1,
-0.5089482, -1.341421, -2.666919, 1, 0, 0, 1, 1,
-0.50707, 0.6621754, -0.1930251, 1, 0, 0, 1, 1,
-0.5062767, 0.4410555, -1.969755, 1, 0, 0, 1, 1,
-0.5054532, -2.562791, -2.202132, 0, 0, 0, 1, 1,
-0.5046216, -0.2512081, 0.01414238, 0, 0, 0, 1, 1,
-0.5023356, 0.542879, -1.2483, 0, 0, 0, 1, 1,
-0.5000727, 0.824253, -3.189493, 0, 0, 0, 1, 1,
-0.4971481, 0.9957234, -0.05692267, 0, 0, 0, 1, 1,
-0.4956496, 0.5121964, -0.09658526, 0, 0, 0, 1, 1,
-0.4791081, -0.1246883, -3.429776, 0, 0, 0, 1, 1,
-0.4748886, 0.7859249, -2.032267, 1, 1, 1, 1, 1,
-0.4724258, 0.6143796, 0.3168356, 1, 1, 1, 1, 1,
-0.4684001, 0.2048387, -0.7812254, 1, 1, 1, 1, 1,
-0.4676918, 1.272246, 0.06296019, 1, 1, 1, 1, 1,
-0.4675628, -0.2404322, -0.670757, 1, 1, 1, 1, 1,
-0.4596581, -1.250738, -1.666902, 1, 1, 1, 1, 1,
-0.4571859, -0.4236144, -2.790514, 1, 1, 1, 1, 1,
-0.453713, 1.609622, 0.7193791, 1, 1, 1, 1, 1,
-0.4534836, 1.990381, 1.857727, 1, 1, 1, 1, 1,
-0.4501392, -1.927244, -4.57764, 1, 1, 1, 1, 1,
-0.4469218, 1.427186, -0.302012, 1, 1, 1, 1, 1,
-0.4429768, -1.740995, -3.458646, 1, 1, 1, 1, 1,
-0.4338671, -0.5125503, -4.328244, 1, 1, 1, 1, 1,
-0.4287662, -0.2469088, -1.983615, 1, 1, 1, 1, 1,
-0.422603, 0.6568422, -0.3024007, 1, 1, 1, 1, 1,
-0.4170007, 0.08995991, -2.499005, 0, 0, 1, 1, 1,
-0.4154512, -0.6680744, -3.766195, 1, 0, 0, 1, 1,
-0.4095677, -0.1846192, -2.604293, 1, 0, 0, 1, 1,
-0.4025265, -0.10329, -2.307542, 1, 0, 0, 1, 1,
-0.3994958, 0.1542566, 0.5674849, 1, 0, 0, 1, 1,
-0.3990733, -0.5404997, -2.340949, 1, 0, 0, 1, 1,
-0.3977821, 1.590522, -2.370298, 0, 0, 0, 1, 1,
-0.3976797, -0.4362191, -2.681449, 0, 0, 0, 1, 1,
-0.3974283, 0.6269674, 1.11739, 0, 0, 0, 1, 1,
-0.396847, 0.2196717, -0.2986396, 0, 0, 0, 1, 1,
-0.3949173, 0.6738622, -0.6378319, 0, 0, 0, 1, 1,
-0.3891348, -1.565312, -1.742821, 0, 0, 0, 1, 1,
-0.3886048, -1.03486, -3.043919, 0, 0, 0, 1, 1,
-0.3834696, -0.9337475, -3.66645, 1, 1, 1, 1, 1,
-0.3832062, 3.049035, -0.1337206, 1, 1, 1, 1, 1,
-0.3783876, -1.686051, -3.345842, 1, 1, 1, 1, 1,
-0.3660217, -2.062817, -4.746169, 1, 1, 1, 1, 1,
-0.3646302, 0.9488386, -0.188719, 1, 1, 1, 1, 1,
-0.3643642, 0.3136744, 0.2151341, 1, 1, 1, 1, 1,
-0.3616265, -2.329413, -2.610663, 1, 1, 1, 1, 1,
-0.354087, -0.2594753, -3.731173, 1, 1, 1, 1, 1,
-0.3540235, -0.8189912, -1.521053, 1, 1, 1, 1, 1,
-0.3519514, 0.06165501, -1.733438, 1, 1, 1, 1, 1,
-0.3518553, -0.376705, -0.9843406, 1, 1, 1, 1, 1,
-0.349401, -0.7144749, -1.476416, 1, 1, 1, 1, 1,
-0.3481389, -0.7245864, -3.763327, 1, 1, 1, 1, 1,
-0.3456016, 0.9730347, -0.1693323, 1, 1, 1, 1, 1,
-0.3442701, -2.642879, -1.467282, 1, 1, 1, 1, 1,
-0.3434207, 0.1510628, -1.85099, 0, 0, 1, 1, 1,
-0.3424252, 0.3028456, 0.006660135, 1, 0, 0, 1, 1,
-0.3344426, 1.577311, 0.4108639, 1, 0, 0, 1, 1,
-0.3327517, -0.8732857, -2.146851, 1, 0, 0, 1, 1,
-0.3285746, 1.674344, 0.1997463, 1, 0, 0, 1, 1,
-0.3276092, 0.3457446, 0.4264016, 1, 0, 0, 1, 1,
-0.327338, 1.154667, 2.241547, 0, 0, 0, 1, 1,
-0.3251599, -0.4490675, -1.418183, 0, 0, 0, 1, 1,
-0.3247811, -0.1439435, -1.965824, 0, 0, 0, 1, 1,
-0.3241482, -0.2933869, -3.833114, 0, 0, 0, 1, 1,
-0.3215809, 0.007388123, -3.198809, 0, 0, 0, 1, 1,
-0.3189769, 1.113185, -0.6620873, 0, 0, 0, 1, 1,
-0.3172304, 1.728387, -1.187465, 0, 0, 0, 1, 1,
-0.3158408, -0.2031687, -3.347677, 1, 1, 1, 1, 1,
-0.3157989, 0.5077976, -0.3708771, 1, 1, 1, 1, 1,
-0.3149649, -0.241944, -1.818953, 1, 1, 1, 1, 1,
-0.3127392, 0.003878318, -2.32692, 1, 1, 1, 1, 1,
-0.3108461, -1.312005, -2.979182, 1, 1, 1, 1, 1,
-0.3095796, 0.440834, -1.500981, 1, 1, 1, 1, 1,
-0.3078748, -0.1323989, -1.740833, 1, 1, 1, 1, 1,
-0.3058438, 0.4699504, 0.5110861, 1, 1, 1, 1, 1,
-0.3049917, -0.0416332, -0.9351414, 1, 1, 1, 1, 1,
-0.2982608, 0.8395429, -1.316569, 1, 1, 1, 1, 1,
-0.2981144, 0.09439733, -1.277692, 1, 1, 1, 1, 1,
-0.2974896, -1.420608, -3.75088, 1, 1, 1, 1, 1,
-0.293288, 0.4112854, -0.5887417, 1, 1, 1, 1, 1,
-0.2929545, 0.805665, 0.6272684, 1, 1, 1, 1, 1,
-0.2912239, 2.064861, -1.909881, 1, 1, 1, 1, 1,
-0.2909223, 0.4492041, -0.9623486, 0, 0, 1, 1, 1,
-0.2826028, -0.5937909, -1.9781, 1, 0, 0, 1, 1,
-0.2824671, 0.4296937, -1.752738, 1, 0, 0, 1, 1,
-0.2800015, -1.334708, -2.668791, 1, 0, 0, 1, 1,
-0.2798074, -1.462939, -3.015162, 1, 0, 0, 1, 1,
-0.279107, 0.1400392, -2.53371, 1, 0, 0, 1, 1,
-0.2735931, 1.148545, -0.9192227, 0, 0, 0, 1, 1,
-0.2733769, -0.6463209, -3.711108, 0, 0, 0, 1, 1,
-0.273122, 0.3195683, 1.602182, 0, 0, 0, 1, 1,
-0.272203, -1.125403, -2.438476, 0, 0, 0, 1, 1,
-0.267979, -0.3853563, -1.236479, 0, 0, 0, 1, 1,
-0.2652397, 0.5779682, 0.1595508, 0, 0, 0, 1, 1,
-0.2603605, -1.230093, -1.906678, 0, 0, 0, 1, 1,
-0.2602433, -0.390387, -3.45391, 1, 1, 1, 1, 1,
-0.2582658, 0.1076186, -0.8318396, 1, 1, 1, 1, 1,
-0.2578102, -1.158016, -0.7863066, 1, 1, 1, 1, 1,
-0.2569073, -0.5932485, -3.409835, 1, 1, 1, 1, 1,
-0.2534638, -0.6782269, -2.676979, 1, 1, 1, 1, 1,
-0.2509249, -1.373095, -3.226781, 1, 1, 1, 1, 1,
-0.2496492, 0.9730915, -1.531771, 1, 1, 1, 1, 1,
-0.2431755, 0.185015, -0.201938, 1, 1, 1, 1, 1,
-0.2422739, -0.7916144, -3.77471, 1, 1, 1, 1, 1,
-0.2375614, -0.7867188, -3.546991, 1, 1, 1, 1, 1,
-0.2342237, 0.1109487, -1.740881, 1, 1, 1, 1, 1,
-0.2341459, 0.6185204, -2.655995, 1, 1, 1, 1, 1,
-0.234071, 0.2393226, 0.1399863, 1, 1, 1, 1, 1,
-0.2291323, 0.877001, -1.346167, 1, 1, 1, 1, 1,
-0.2281516, -1.517831, -2.087269, 1, 1, 1, 1, 1,
-0.2280807, -1.440642, -3.894264, 0, 0, 1, 1, 1,
-0.2279447, -0.8875149, -2.36208, 1, 0, 0, 1, 1,
-0.2267317, 0.4817883, 0.265018, 1, 0, 0, 1, 1,
-0.2245124, 0.4972665, -0.1135629, 1, 0, 0, 1, 1,
-0.221209, 0.09728723, -1.461853, 1, 0, 0, 1, 1,
-0.2212062, 0.1173309, -2.122082, 1, 0, 0, 1, 1,
-0.2139628, 0.03238852, -2.617561, 0, 0, 0, 1, 1,
-0.2134318, 2.059703, -0.4350811, 0, 0, 0, 1, 1,
-0.2058086, -0.4942245, -2.868714, 0, 0, 0, 1, 1,
-0.202125, -0.4825114, -0.8888728, 0, 0, 0, 1, 1,
-0.1956134, -1.699592, -2.489733, 0, 0, 0, 1, 1,
-0.194168, 0.9852207, -0.4270499, 0, 0, 0, 1, 1,
-0.1941492, 0.5013081, -0.6092733, 0, 0, 0, 1, 1,
-0.1912934, -0.7406559, -4.562053, 1, 1, 1, 1, 1,
-0.190828, -0.3067477, -2.790484, 1, 1, 1, 1, 1,
-0.1894568, -0.253198, -1.76228, 1, 1, 1, 1, 1,
-0.1878589, 1.640702, 0.04916202, 1, 1, 1, 1, 1,
-0.1876031, 1.463131, -1.087961, 1, 1, 1, 1, 1,
-0.1849688, -0.4776092, -2.112958, 1, 1, 1, 1, 1,
-0.1847528, 1.099825, 0.0301268, 1, 1, 1, 1, 1,
-0.1838266, 0.170922, -0.9616181, 1, 1, 1, 1, 1,
-0.1819073, -0.3885841, -4.12112, 1, 1, 1, 1, 1,
-0.1793639, 0.7984564, 0.2328643, 1, 1, 1, 1, 1,
-0.1784412, 0.8518143, 1.154812, 1, 1, 1, 1, 1,
-0.1766063, -0.1128724, -2.278233, 1, 1, 1, 1, 1,
-0.1738485, 0.08452003, -0.08097663, 1, 1, 1, 1, 1,
-0.171621, -0.6117099, -3.068755, 1, 1, 1, 1, 1,
-0.1686223, -0.7380281, -4.000756, 1, 1, 1, 1, 1,
-0.1668831, 0.7851714, -0.06428669, 0, 0, 1, 1, 1,
-0.1658607, -1.544277, -3.322282, 1, 0, 0, 1, 1,
-0.1654932, -0.5588393, -1.532087, 1, 0, 0, 1, 1,
-0.1618644, -1.305978, -3.967628, 1, 0, 0, 1, 1,
-0.1596127, 0.4663929, -0.3157267, 1, 0, 0, 1, 1,
-0.1585541, -2.071461, -4.795006, 1, 0, 0, 1, 1,
-0.1538091, 1.916568, -0.5942846, 0, 0, 0, 1, 1,
-0.1507231, 1.494142, -0.3438456, 0, 0, 0, 1, 1,
-0.1507065, 1.031091, -2.150552, 0, 0, 0, 1, 1,
-0.1501405, -0.8924342, -2.299379, 0, 0, 0, 1, 1,
-0.1447366, -0.224126, -2.118151, 0, 0, 0, 1, 1,
-0.1395883, -0.637289, -3.222809, 0, 0, 0, 1, 1,
-0.139339, 0.9057562, 0.05424025, 0, 0, 0, 1, 1,
-0.1384445, -0.5115384, -3.300684, 1, 1, 1, 1, 1,
-0.1378722, -0.6356332, -4.94833, 1, 1, 1, 1, 1,
-0.1370261, -0.1510799, -2.036717, 1, 1, 1, 1, 1,
-0.1352759, 0.6503583, -0.7646685, 1, 1, 1, 1, 1,
-0.1304065, 0.4499467, -0.2432479, 1, 1, 1, 1, 1,
-0.1213425, 0.0140785, -2.250741, 1, 1, 1, 1, 1,
-0.1187421, -0.530025, -3.507949, 1, 1, 1, 1, 1,
-0.1176063, 0.7594864, 0.8964231, 1, 1, 1, 1, 1,
-0.1128632, 0.1778838, -1.40151, 1, 1, 1, 1, 1,
-0.1113451, -0.3415191, -4.727294, 1, 1, 1, 1, 1,
-0.1107799, -1.250783, -2.272166, 1, 1, 1, 1, 1,
-0.1105554, 1.171455, -1.008113, 1, 1, 1, 1, 1,
-0.1059724, 1.270407, -0.606456, 1, 1, 1, 1, 1,
-0.1052247, -0.2388198, -1.270533, 1, 1, 1, 1, 1,
-0.09778915, -0.5488465, -1.860336, 1, 1, 1, 1, 1,
-0.09239569, 0.4228137, -2.197236, 0, 0, 1, 1, 1,
-0.09163864, 3.406293, 1.055016, 1, 0, 0, 1, 1,
-0.09039835, -0.5011914, -1.714433, 1, 0, 0, 1, 1,
-0.08824735, -1.008752, -4.865821, 1, 0, 0, 1, 1,
-0.08553884, -0.642207, -4.272593, 1, 0, 0, 1, 1,
-0.07713114, 1.182164, -1.10953, 1, 0, 0, 1, 1,
-0.07088657, -0.9660116, -3.708538, 0, 0, 0, 1, 1,
-0.06994943, -1.782835, -1.868328, 0, 0, 0, 1, 1,
-0.06889892, 1.406788, 0.5099158, 0, 0, 0, 1, 1,
-0.06726926, -0.7336003, -5.222082, 0, 0, 0, 1, 1,
-0.0661462, 0.3396178, 0.745568, 0, 0, 0, 1, 1,
-0.06477221, -1.71728, -3.134266, 0, 0, 0, 1, 1,
-0.06336795, 1.479227, 0.7502899, 0, 0, 0, 1, 1,
-0.06188771, 0.9878972, 0.3799254, 1, 1, 1, 1, 1,
-0.05991709, -1.555074, -1.356897, 1, 1, 1, 1, 1,
-0.05580598, 0.3258446, 0.3468672, 1, 1, 1, 1, 1,
-0.04990417, 0.7476624, -1.067244, 1, 1, 1, 1, 1,
-0.04785112, 0.3442157, 0.7609206, 1, 1, 1, 1, 1,
-0.04667271, 1.866298, -1.709777, 1, 1, 1, 1, 1,
-0.04287656, 0.6097638, -0.9971985, 1, 1, 1, 1, 1,
-0.04278394, -0.562417, 0.1051752, 1, 1, 1, 1, 1,
-0.04185494, 1.547871, 0.7596634, 1, 1, 1, 1, 1,
-0.04175449, -1.511224, -3.859347, 1, 1, 1, 1, 1,
-0.037296, -0.2820274, -4.677045, 1, 1, 1, 1, 1,
-0.03245372, 0.5364888, 0.7582957, 1, 1, 1, 1, 1,
-0.02256636, 1.203231, 1.187515, 1, 1, 1, 1, 1,
-0.02191677, -0.01436998, -2.68321, 1, 1, 1, 1, 1,
-0.02182106, 0.9727129, -1.088656, 1, 1, 1, 1, 1,
-0.01874827, 0.2781134, 0.5785394, 0, 0, 1, 1, 1,
-0.01759599, -0.7454817, -3.794971, 1, 0, 0, 1, 1,
-0.01419143, 2.48393, -0.1168156, 1, 0, 0, 1, 1,
-0.009256062, 0.2747151, -1.733933, 1, 0, 0, 1, 1,
-0.009020583, -0.6394989, -2.902921, 1, 0, 0, 1, 1,
-0.008234992, 0.5753852, 0.914658, 1, 0, 0, 1, 1,
-0.005830854, -0.09885515, -2.707698, 0, 0, 0, 1, 1,
-0.005237964, -0.9207532, -3.599539, 0, 0, 0, 1, 1,
-0.003566256, 1.098926, -0.7524581, 0, 0, 0, 1, 1,
-0.003401317, -0.7816812, -3.819979, 0, 0, 0, 1, 1,
-0.002121434, -1.303394, -2.385775, 0, 0, 0, 1, 1,
0.003168451, -1.583051, 3.425601, 0, 0, 0, 1, 1,
0.008354381, -0.434876, 3.408546, 0, 0, 0, 1, 1,
0.01115377, -2.000655, 1.918433, 1, 1, 1, 1, 1,
0.01307716, -0.7839524, 1.493845, 1, 1, 1, 1, 1,
0.01370535, -0.4802572, 4.617322, 1, 1, 1, 1, 1,
0.01585376, 0.8759038, 0.5997763, 1, 1, 1, 1, 1,
0.01631786, -2.935712, 2.745404, 1, 1, 1, 1, 1,
0.02149168, -0.1619753, 3.616328, 1, 1, 1, 1, 1,
0.02186469, -0.810211, 2.813821, 1, 1, 1, 1, 1,
0.0220846, 1.12271, -0.3996841, 1, 1, 1, 1, 1,
0.02380961, -0.2805779, 3.348476, 1, 1, 1, 1, 1,
0.02669548, -1.784318, 2.75423, 1, 1, 1, 1, 1,
0.02762479, 1.311961, 0.7293952, 1, 1, 1, 1, 1,
0.03392601, 0.9104138, -0.5544841, 1, 1, 1, 1, 1,
0.03456731, -1.552802, 3.353254, 1, 1, 1, 1, 1,
0.03569385, 0.297693, -0.2081963, 1, 1, 1, 1, 1,
0.04833683, 0.001856009, 2.00035, 1, 1, 1, 1, 1,
0.04835907, -0.2093546, 3.019207, 0, 0, 1, 1, 1,
0.04837002, 0.7566392, -1.508308, 1, 0, 0, 1, 1,
0.05023912, 0.3581411, 0.1282056, 1, 0, 0, 1, 1,
0.0512941, -0.02957012, 0.1130751, 1, 0, 0, 1, 1,
0.05430481, 1.100468, 0.9904998, 1, 0, 0, 1, 1,
0.05636796, -0.4795304, 3.837309, 1, 0, 0, 1, 1,
0.06143836, 0.7475887, 0.05113478, 0, 0, 0, 1, 1,
0.0630292, 1.362025, -0.007565375, 0, 0, 0, 1, 1,
0.06483231, 0.244383, 0.8647027, 0, 0, 0, 1, 1,
0.06512539, 0.2847576, 0.278619, 0, 0, 0, 1, 1,
0.06903508, -0.4678277, 3.356389, 0, 0, 0, 1, 1,
0.06906557, -0.6948156, 3.18603, 0, 0, 0, 1, 1,
0.06967848, 0.766562, -1.30146, 0, 0, 0, 1, 1,
0.0744566, -1.124912, 1.098302, 1, 1, 1, 1, 1,
0.0764662, 0.3235717, 0.8963423, 1, 1, 1, 1, 1,
0.07979164, -1.286102, 4.403847, 1, 1, 1, 1, 1,
0.0813471, -0.2893718, 1.994298, 1, 1, 1, 1, 1,
0.08197629, -1.653609, 2.053105, 1, 1, 1, 1, 1,
0.08390478, 0.6628059, 0.90489, 1, 1, 1, 1, 1,
0.08791105, -0.9112417, 3.142411, 1, 1, 1, 1, 1,
0.09041391, 1.476662, -0.546156, 1, 1, 1, 1, 1,
0.09183031, 0.9771205, 0.9213856, 1, 1, 1, 1, 1,
0.09636388, -3.212055, 2.837566, 1, 1, 1, 1, 1,
0.111642, -0.07272413, 3.584593, 1, 1, 1, 1, 1,
0.1121885, 1.46135, 1.36502, 1, 1, 1, 1, 1,
0.1155721, 0.8932179, 0.5304095, 1, 1, 1, 1, 1,
0.1161249, -0.9146139, 2.307087, 1, 1, 1, 1, 1,
0.1180665, -0.5944113, 3.794695, 1, 1, 1, 1, 1,
0.1182226, -2.05867, 1.420331, 0, 0, 1, 1, 1,
0.1189223, 1.178605, -0.2668014, 1, 0, 0, 1, 1,
0.1235466, -0.7445565, 4.857589, 1, 0, 0, 1, 1,
0.125632, 0.402437, -0.7641965, 1, 0, 0, 1, 1,
0.1270059, -0.9483215, 2.66459, 1, 0, 0, 1, 1,
0.1279563, 0.2858285, -1.136808, 1, 0, 0, 1, 1,
0.1281316, 1.234739, 1.727969, 0, 0, 0, 1, 1,
0.1287454, -0.3754263, 3.60521, 0, 0, 0, 1, 1,
0.1320767, 0.4650066, 1.940765, 0, 0, 0, 1, 1,
0.1372753, 0.3873797, -0.1518776, 0, 0, 0, 1, 1,
0.137444, -0.6530526, 3.31252, 0, 0, 0, 1, 1,
0.1404748, 0.1028091, 3.852829, 0, 0, 0, 1, 1,
0.1449614, -1.681351, 1.374063, 0, 0, 0, 1, 1,
0.1486135, 0.06808884, 1.702605, 1, 1, 1, 1, 1,
0.1492134, 2.404232, -2.606395, 1, 1, 1, 1, 1,
0.1511215, -0.474082, 2.135663, 1, 1, 1, 1, 1,
0.1525647, -1.542093, 2.400155, 1, 1, 1, 1, 1,
0.159201, 0.6089458, -0.6875309, 1, 1, 1, 1, 1,
0.1613178, 1.646935, -1.179001, 1, 1, 1, 1, 1,
0.1718594, 0.4499335, 0.5179855, 1, 1, 1, 1, 1,
0.1747397, -1.776937, 1.558941, 1, 1, 1, 1, 1,
0.1751279, -0.6572507, 2.684067, 1, 1, 1, 1, 1,
0.1777785, -0.4771108, 2.372464, 1, 1, 1, 1, 1,
0.1782147, -1.315669, 3.839829, 1, 1, 1, 1, 1,
0.1788183, 1.702464, 1.526607, 1, 1, 1, 1, 1,
0.1792519, 0.5846612, 1.175308, 1, 1, 1, 1, 1,
0.1868244, -0.00713341, 2.57757, 1, 1, 1, 1, 1,
0.1880382, 0.3997872, 1.532357, 1, 1, 1, 1, 1,
0.1919402, 1.560637, -1.191744, 0, 0, 1, 1, 1,
0.1961945, 0.1155379, 1.8451, 1, 0, 0, 1, 1,
0.199954, 0.2370708, 1.691397, 1, 0, 0, 1, 1,
0.2003352, -0.298061, 2.933042, 1, 0, 0, 1, 1,
0.2006748, -0.06082502, 3.727238, 1, 0, 0, 1, 1,
0.2007766, 0.7367939, 1.158464, 1, 0, 0, 1, 1,
0.201422, 0.8218101, 0.1984866, 0, 0, 0, 1, 1,
0.2025903, -0.5272952, 1.979028, 0, 0, 0, 1, 1,
0.2026543, -0.7452921, 3.992081, 0, 0, 0, 1, 1,
0.2035518, 0.0602124, 0.7775669, 0, 0, 0, 1, 1,
0.208426, 0.09770976, 1.008262, 0, 0, 0, 1, 1,
0.2113278, -0.003685663, -0.1194705, 0, 0, 0, 1, 1,
0.2117183, 0.7633395, -0.7822304, 0, 0, 0, 1, 1,
0.2117499, -0.8756064, 0.6875198, 1, 1, 1, 1, 1,
0.2118389, 0.4284236, -0.5150298, 1, 1, 1, 1, 1,
0.2142416, -1.338663, 3.595037, 1, 1, 1, 1, 1,
0.2152738, 1.121283, 1.390466, 1, 1, 1, 1, 1,
0.2167065, 0.0822691, -0.6887326, 1, 1, 1, 1, 1,
0.2178741, -0.740205, 4.428104, 1, 1, 1, 1, 1,
0.2187103, 0.726161, 1.560965, 1, 1, 1, 1, 1,
0.2196204, -1.501848, 4.152614, 1, 1, 1, 1, 1,
0.2212045, -0.005542017, -0.1384742, 1, 1, 1, 1, 1,
0.2225666, -0.6595733, 3.765467, 1, 1, 1, 1, 1,
0.2238538, -0.1318339, 1.596537, 1, 1, 1, 1, 1,
0.2244799, -1.16564, 3.533092, 1, 1, 1, 1, 1,
0.2259216, -0.3823985, 1.357036, 1, 1, 1, 1, 1,
0.2321846, 0.9313242, -0.3386037, 1, 1, 1, 1, 1,
0.2344903, 0.6258624, 0.2938045, 1, 1, 1, 1, 1,
0.2350616, 1.056506, 0.8488938, 0, 0, 1, 1, 1,
0.2368835, -0.6852617, 2.364004, 1, 0, 0, 1, 1,
0.2389464, -0.2578701, 1.895491, 1, 0, 0, 1, 1,
0.2421963, 0.007555324, 2.964502, 1, 0, 0, 1, 1,
0.2438122, 1.049854, 1.467766, 1, 0, 0, 1, 1,
0.2479254, -0.56446, 2.318187, 1, 0, 0, 1, 1,
0.250318, 1.093645, -0.4961308, 0, 0, 0, 1, 1,
0.2545045, -0.9899518, 1.599995, 0, 0, 0, 1, 1,
0.2564235, 1.310856, 1.323677, 0, 0, 0, 1, 1,
0.2625427, 0.1316549, 1.941943, 0, 0, 0, 1, 1,
0.2643601, 0.5423529, -0.5168227, 0, 0, 0, 1, 1,
0.2643896, -0.2510722, 2.150301, 0, 0, 0, 1, 1,
0.2663858, -0.8964864, 4.29461, 0, 0, 0, 1, 1,
0.2690036, 0.04308524, 1.158768, 1, 1, 1, 1, 1,
0.2723068, -0.3054812, 2.531352, 1, 1, 1, 1, 1,
0.2756533, 1.612067, -0.526661, 1, 1, 1, 1, 1,
0.2775938, 1.555961, 0.6747021, 1, 1, 1, 1, 1,
0.2802635, 0.2813232, 2.289407, 1, 1, 1, 1, 1,
0.2847637, -0.00934035, 2.214639, 1, 1, 1, 1, 1,
0.2852688, -0.2210645, 3.809228, 1, 1, 1, 1, 1,
0.2872415, -1.380966, 5.166664, 1, 1, 1, 1, 1,
0.2876966, 0.0211757, -0.1780389, 1, 1, 1, 1, 1,
0.2896444, -0.138135, 2.753507, 1, 1, 1, 1, 1,
0.2938928, 0.1080102, -0.5475758, 1, 1, 1, 1, 1,
0.2944393, 0.8697863, 0.4345435, 1, 1, 1, 1, 1,
0.2965049, -0.7617184, 3.517213, 1, 1, 1, 1, 1,
0.3028801, 0.08773057, 0.6972449, 1, 1, 1, 1, 1,
0.3067974, -0.4499763, 0.9503813, 1, 1, 1, 1, 1,
0.3073595, -1.552266, 2.265859, 0, 0, 1, 1, 1,
0.3080262, -1.088037, 3.154506, 1, 0, 0, 1, 1,
0.3093038, -0.1321531, 1.284507, 1, 0, 0, 1, 1,
0.3130536, -1.064186, 2.979385, 1, 0, 0, 1, 1,
0.313765, 0.2532, 2.370796, 1, 0, 0, 1, 1,
0.3217673, 1.058396, -0.092219, 1, 0, 0, 1, 1,
0.3220502, 2.066594, 1.018497, 0, 0, 0, 1, 1,
0.3221504, -0.6701265, 2.481202, 0, 0, 0, 1, 1,
0.3224284, 0.3925943, -0.4571722, 0, 0, 0, 1, 1,
0.3226531, 2.00593, -0.5205557, 0, 0, 0, 1, 1,
0.323466, 0.3955294, 0.6495937, 0, 0, 0, 1, 1,
0.326115, -0.3276142, 1.304752, 0, 0, 0, 1, 1,
0.3262842, 0.4825741, -1.015214, 0, 0, 0, 1, 1,
0.329971, 1.517649, -1.376076, 1, 1, 1, 1, 1,
0.3300422, -0.8025918, 1.466964, 1, 1, 1, 1, 1,
0.3315374, 1.482985, -0.2522014, 1, 1, 1, 1, 1,
0.3416419, 0.3520506, 0.2056609, 1, 1, 1, 1, 1,
0.3441785, 2.302877, 0.1650913, 1, 1, 1, 1, 1,
0.3448914, 0.009541155, 3.940902, 1, 1, 1, 1, 1,
0.3469273, 1.162984, 0.8296241, 1, 1, 1, 1, 1,
0.3481607, -1.126686, 3.452553, 1, 1, 1, 1, 1,
0.348206, 0.009091918, 1.19118, 1, 1, 1, 1, 1,
0.3501464, -0.9965369, 3.372832, 1, 1, 1, 1, 1,
0.3526014, 1.667837, 1.095256, 1, 1, 1, 1, 1,
0.3528149, 0.7261677, 0.590687, 1, 1, 1, 1, 1,
0.3593898, -0.6644536, 2.789509, 1, 1, 1, 1, 1,
0.362334, 0.5681072, 0.4975935, 1, 1, 1, 1, 1,
0.3701468, -1.480633, 1.599282, 1, 1, 1, 1, 1,
0.3737538, 0.3102761, 1.57398, 0, 0, 1, 1, 1,
0.373958, -1.294582, 2.920357, 1, 0, 0, 1, 1,
0.3750233, 0.1180005, 1.617193, 1, 0, 0, 1, 1,
0.3766677, 0.5741472, -0.7993526, 1, 0, 0, 1, 1,
0.3867904, -0.2008622, 1.768925, 1, 0, 0, 1, 1,
0.3874919, -0.4957818, 0.3567233, 1, 0, 0, 1, 1,
0.3886259, 1.530959, -1.003285, 0, 0, 0, 1, 1,
0.3901081, 1.527982, -0.6678503, 0, 0, 0, 1, 1,
0.3903424, -0.9652348, 2.629748, 0, 0, 0, 1, 1,
0.3914193, -1.027177, 2.903727, 0, 0, 0, 1, 1,
0.3932059, -0.4300143, 2.156487, 0, 0, 0, 1, 1,
0.3972052, -1.889711, 3.4768, 0, 0, 0, 1, 1,
0.3992056, 1.706707, -0.7036399, 0, 0, 0, 1, 1,
0.4022854, 0.3085229, 1.911344, 1, 1, 1, 1, 1,
0.4051195, -0.5427933, 0.9219604, 1, 1, 1, 1, 1,
0.4083381, 1.813395, -0.4174161, 1, 1, 1, 1, 1,
0.4119927, -1.247937, 2.670314, 1, 1, 1, 1, 1,
0.4191712, -0.7668628, 3.777575, 1, 1, 1, 1, 1,
0.4202571, -0.8087016, 1.191773, 1, 1, 1, 1, 1,
0.4208684, -1.635806, 2.323559, 1, 1, 1, 1, 1,
0.4233348, -1.744958, 2.536443, 1, 1, 1, 1, 1,
0.4236447, -1.061188, 1.459018, 1, 1, 1, 1, 1,
0.4246171, -1.185756, 1.982228, 1, 1, 1, 1, 1,
0.4275495, -0.4027744, 3.072762, 1, 1, 1, 1, 1,
0.4302871, -0.6460557, 4.214582, 1, 1, 1, 1, 1,
0.4366972, 0.2161131, 2.747113, 1, 1, 1, 1, 1,
0.4374756, -1.641826, 2.738418, 1, 1, 1, 1, 1,
0.4424364, 1.391878, -0.3915922, 1, 1, 1, 1, 1,
0.4458161, 0.4665058, 0.5017225, 0, 0, 1, 1, 1,
0.4460489, 0.3707729, 2.316039, 1, 0, 0, 1, 1,
0.4476378, 0.7127807, 0.9365821, 1, 0, 0, 1, 1,
0.4489908, 0.2969072, 1.255991, 1, 0, 0, 1, 1,
0.4574392, -1.501351, 2.191531, 1, 0, 0, 1, 1,
0.4587614, 1.942475, -0.1976637, 1, 0, 0, 1, 1,
0.4602803, -0.7273967, 1.546843, 0, 0, 0, 1, 1,
0.4604175, 1.128968, -0.693055, 0, 0, 0, 1, 1,
0.4673042, -1.17584, 2.483911, 0, 0, 0, 1, 1,
0.4701802, 1.294653, 0.08509019, 0, 0, 0, 1, 1,
0.4706856, 0.9782398, -0.1749666, 0, 0, 0, 1, 1,
0.476479, -0.3230755, 1.917258, 0, 0, 0, 1, 1,
0.4793637, 1.667896, -0.3468824, 0, 0, 0, 1, 1,
0.4842227, 1.188285, 0.3271206, 1, 1, 1, 1, 1,
0.4848133, -0.4842502, 2.710855, 1, 1, 1, 1, 1,
0.4886017, 0.057832, 1.403848, 1, 1, 1, 1, 1,
0.4918246, -0.1879206, 1.492244, 1, 1, 1, 1, 1,
0.4955779, -1.530498, 4.039299, 1, 1, 1, 1, 1,
0.4961137, 0.2826259, 2.618677, 1, 1, 1, 1, 1,
0.4988375, 1.39657, 0.8216525, 1, 1, 1, 1, 1,
0.5050542, -0.647004, 1.682012, 1, 1, 1, 1, 1,
0.5082749, 0.356238, 0.4138621, 1, 1, 1, 1, 1,
0.509399, 0.9112416, 1.687097, 1, 1, 1, 1, 1,
0.5097618, 1.89606, -0.2165441, 1, 1, 1, 1, 1,
0.5159574, -1.118615, 3.684031, 1, 1, 1, 1, 1,
0.5221699, -0.7384648, 2.876719, 1, 1, 1, 1, 1,
0.5258394, -0.4682136, 2.704465, 1, 1, 1, 1, 1,
0.5288791, -0.1319254, 0.5948492, 1, 1, 1, 1, 1,
0.5291831, 0.3005506, 0.8333027, 0, 0, 1, 1, 1,
0.5317231, -0.8976216, 2.151806, 1, 0, 0, 1, 1,
0.5356436, 0.1431802, 0.9962137, 1, 0, 0, 1, 1,
0.5385169, -1.023448, 2.413531, 1, 0, 0, 1, 1,
0.5388578, -0.3886852, 1.427618, 1, 0, 0, 1, 1,
0.5406132, 2.504204, 0.5253186, 1, 0, 0, 1, 1,
0.5412779, -0.5000346, 1.789143, 0, 0, 0, 1, 1,
0.5417616, -0.3569574, 2.3544, 0, 0, 0, 1, 1,
0.5421132, 0.3457374, -0.2656307, 0, 0, 0, 1, 1,
0.5440881, -1.28359, 1.701695, 0, 0, 0, 1, 1,
0.5471412, -0.2924325, 2.286565, 0, 0, 0, 1, 1,
0.5478857, 1.355455, 0.4769013, 0, 0, 0, 1, 1,
0.5483981, 0.04742736, 3.865062, 0, 0, 0, 1, 1,
0.5493626, -0.9811611, 2.788969, 1, 1, 1, 1, 1,
0.5552346, -0.8263817, 3.053934, 1, 1, 1, 1, 1,
0.5586395, -0.5353729, 2.439436, 1, 1, 1, 1, 1,
0.559242, -2.797265, 2.47106, 1, 1, 1, 1, 1,
0.5649426, -0.6411107, 2.0927, 1, 1, 1, 1, 1,
0.5672523, -1.453422, 1.193879, 1, 1, 1, 1, 1,
0.5714606, 1.218296, 0.4864507, 1, 1, 1, 1, 1,
0.576046, -0.5574668, 2.76974, 1, 1, 1, 1, 1,
0.5808127, 2.048154, 0.5413555, 1, 1, 1, 1, 1,
0.5836993, -1.029313, 1.919622, 1, 1, 1, 1, 1,
0.5868893, -0.1455421, 1.904659, 1, 1, 1, 1, 1,
0.5909641, -0.08825383, 3.270388, 1, 1, 1, 1, 1,
0.5989719, -0.9103822, 2.952702, 1, 1, 1, 1, 1,
0.6011827, -0.5259113, 3.446416, 1, 1, 1, 1, 1,
0.6017514, -0.9854041, 2.690786, 1, 1, 1, 1, 1,
0.6019905, -0.2261053, 2.369241, 0, 0, 1, 1, 1,
0.6051276, -0.2277283, 1.727407, 1, 0, 0, 1, 1,
0.6070648, -0.7338241, 3.927655, 1, 0, 0, 1, 1,
0.6080912, -0.2948174, 1.310004, 1, 0, 0, 1, 1,
0.6099154, -0.6023917, 1.088912, 1, 0, 0, 1, 1,
0.6120012, -0.3709119, 1.322916, 1, 0, 0, 1, 1,
0.61283, 0.5124322, 0.855803, 0, 0, 0, 1, 1,
0.6143953, 1.070805, 0.5620772, 0, 0, 0, 1, 1,
0.6146672, -0.9056964, 3.332493, 0, 0, 0, 1, 1,
0.6230888, 0.6272463, 1.559377, 0, 0, 0, 1, 1,
0.6237408, -0.7462537, 0.6202486, 0, 0, 0, 1, 1,
0.6274216, -2.434882, 2.401572, 0, 0, 0, 1, 1,
0.6293467, -2.267275, 3.93873, 0, 0, 0, 1, 1,
0.6307796, -1.835431, 1.920359, 1, 1, 1, 1, 1,
0.6313854, 1.418567, 0.6003764, 1, 1, 1, 1, 1,
0.633944, -0.5230598, 2.061441, 1, 1, 1, 1, 1,
0.6348065, -0.2362491, -0.4693933, 1, 1, 1, 1, 1,
0.6350621, 0.09618423, 0.8509328, 1, 1, 1, 1, 1,
0.6445782, -0.3152443, 3.217977, 1, 1, 1, 1, 1,
0.6483085, 0.7175395, 0.8813598, 1, 1, 1, 1, 1,
0.6485807, -0.6559173, 3.000405, 1, 1, 1, 1, 1,
0.6597003, -0.7932633, 0.5011337, 1, 1, 1, 1, 1,
0.6625182, 0.4735473, -0.5374629, 1, 1, 1, 1, 1,
0.66425, -0.9174184, 0.3065205, 1, 1, 1, 1, 1,
0.6675632, 1.198261, 0.1710275, 1, 1, 1, 1, 1,
0.672264, -0.3815371, 1.563439, 1, 1, 1, 1, 1,
0.6773191, -0.0006096935, 1.653404, 1, 1, 1, 1, 1,
0.6784333, 0.8489565, 3.228184, 1, 1, 1, 1, 1,
0.6817845, -0.9412277, 1.165781, 0, 0, 1, 1, 1,
0.6874845, 0.2367429, -0.08344616, 1, 0, 0, 1, 1,
0.6890903, -0.2281526, 1.859765, 1, 0, 0, 1, 1,
0.6898602, -0.2911588, 1.522805, 1, 0, 0, 1, 1,
0.697479, -0.7499038, 3.372772, 1, 0, 0, 1, 1,
0.699055, -1.585115, 1.903028, 1, 0, 0, 1, 1,
0.702545, -0.4479451, 0.7872666, 0, 0, 0, 1, 1,
0.7080792, 2.068762, 0.3914649, 0, 0, 0, 1, 1,
0.7143613, -0.1688191, 2.286466, 0, 0, 0, 1, 1,
0.7158199, 0.6730973, 0.3806252, 0, 0, 0, 1, 1,
0.7183872, -1.477241, 2.683511, 0, 0, 0, 1, 1,
0.7195988, 0.3160625, 1.534864, 0, 0, 0, 1, 1,
0.7230458, 0.4384442, -0.08907489, 0, 0, 0, 1, 1,
0.726029, 0.8924254, -0.6745782, 1, 1, 1, 1, 1,
0.7305081, 0.84382, 0.8265079, 1, 1, 1, 1, 1,
0.7310398, 0.7344912, 1.391449, 1, 1, 1, 1, 1,
0.7477615, 0.467376, 1.832136, 1, 1, 1, 1, 1,
0.7482585, -0.03422875, 0.7652646, 1, 1, 1, 1, 1,
0.750285, -2.046144, 4.175251, 1, 1, 1, 1, 1,
0.7578871, 0.1758161, -0.5213245, 1, 1, 1, 1, 1,
0.7628826, 1.902561, 0.4877283, 1, 1, 1, 1, 1,
0.7650623, 1.243605, -0.1678299, 1, 1, 1, 1, 1,
0.7690459, 0.2467126, 3.553997, 1, 1, 1, 1, 1,
0.7728649, -0.5814492, 3.201281, 1, 1, 1, 1, 1,
0.7741107, -0.3057922, 1.819589, 1, 1, 1, 1, 1,
0.7768313, 0.8773735, 0.5895855, 1, 1, 1, 1, 1,
0.7775511, -1.395317, 1.762285, 1, 1, 1, 1, 1,
0.7799783, 1.123795, 1.162375, 1, 1, 1, 1, 1,
0.786128, 1.399425, 0.01363802, 0, 0, 1, 1, 1,
0.7864965, 0.3604524, 1.160567, 1, 0, 0, 1, 1,
0.7915487, 0.09766286, 1.227185, 1, 0, 0, 1, 1,
0.8016027, -0.4633852, 1.235583, 1, 0, 0, 1, 1,
0.8019467, -1.801322, 3.87161, 1, 0, 0, 1, 1,
0.8057733, 1.178831, 1.417867, 1, 0, 0, 1, 1,
0.8061053, 0.4792356, -0.4388206, 0, 0, 0, 1, 1,
0.8102194, -1.251842, 1.293865, 0, 0, 0, 1, 1,
0.8136622, 0.02419886, 1.952503, 0, 0, 0, 1, 1,
0.8272638, 0.585811, -0.335186, 0, 0, 0, 1, 1,
0.8306516, 0.04718128, 1.749214, 0, 0, 0, 1, 1,
0.8323038, -0.9673964, 3.062715, 0, 0, 0, 1, 1,
0.8356425, 0.8032318, 1.526392, 0, 0, 0, 1, 1,
0.8387352, -0.1351949, 1.543162, 1, 1, 1, 1, 1,
0.8423153, 1.204927, -0.4256907, 1, 1, 1, 1, 1,
0.8490193, -0.9575455, 2.65611, 1, 1, 1, 1, 1,
0.8495568, 0.8258098, 1.079797, 1, 1, 1, 1, 1,
0.8510375, 0.8862486, 1.875667, 1, 1, 1, 1, 1,
0.8510486, -0.7365409, 2.128974, 1, 1, 1, 1, 1,
0.8516936, -0.3810288, 3.473707, 1, 1, 1, 1, 1,
0.8533091, -1.440166, 1.811933, 1, 1, 1, 1, 1,
0.8589828, 0.0658728, 1.05551, 1, 1, 1, 1, 1,
0.8632591, -0.2751813, 1.080651, 1, 1, 1, 1, 1,
0.8662022, 0.6185138, 1.959084, 1, 1, 1, 1, 1,
0.8675415, 1.699279, 1.247263, 1, 1, 1, 1, 1,
0.870653, 0.8305085, -0.3092627, 1, 1, 1, 1, 1,
0.8709406, -0.7703361, 4.861934, 1, 1, 1, 1, 1,
0.8721726, -0.0009986296, -0.6779261, 1, 1, 1, 1, 1,
0.8901254, -1.188982, 3.505334, 0, 0, 1, 1, 1,
0.8913807, -0.3191563, 1.664519, 1, 0, 0, 1, 1,
0.8935307, -0.3242449, 4.589435, 1, 0, 0, 1, 1,
0.8985172, 0.521684, 0.4533638, 1, 0, 0, 1, 1,
0.9133511, -0.005248402, 3.046589, 1, 0, 0, 1, 1,
0.9266348, -0.7111667, 0.8935407, 1, 0, 0, 1, 1,
0.9329935, 0.4451953, 1.701822, 0, 0, 0, 1, 1,
0.9368024, 1.771038, -0.647554, 0, 0, 0, 1, 1,
0.939413, -1.150483, 2.378595, 0, 0, 0, 1, 1,
0.9419287, 1.224882, -0.4054543, 0, 0, 0, 1, 1,
0.9529793, 0.09553339, 1.163349, 0, 0, 0, 1, 1,
0.9541628, 1.403754, 0.03222549, 0, 0, 0, 1, 1,
0.9562944, -2.151026, 4.160295, 0, 0, 0, 1, 1,
0.9583376, -0.4180761, 2.910633, 1, 1, 1, 1, 1,
0.9585246, -0.4334212, 2.707216, 1, 1, 1, 1, 1,
0.9691763, 2.863149, 0.008344711, 1, 1, 1, 1, 1,
0.96997, -0.3609237, 3.182785, 1, 1, 1, 1, 1,
0.9769441, 1.61872, 0.8458253, 1, 1, 1, 1, 1,
0.9790838, 0.2949337, 2.073694, 1, 1, 1, 1, 1,
0.9799091, 1.154367, 0.1238188, 1, 1, 1, 1, 1,
0.9851844, -0.3751095, 1.395396, 1, 1, 1, 1, 1,
0.9904187, 1.92536, -1.201699, 1, 1, 1, 1, 1,
1.005885, -1.753314, 2.184371, 1, 1, 1, 1, 1,
1.023169, 1.153565, -0.9841429, 1, 1, 1, 1, 1,
1.025733, -0.2940044, 4.00281, 1, 1, 1, 1, 1,
1.037942, -1.637683, 2.056497, 1, 1, 1, 1, 1,
1.039996, 0.2995085, 2.564996, 1, 1, 1, 1, 1,
1.054268, -1.00982, 2.118692, 1, 1, 1, 1, 1,
1.05529, 0.1395765, 0.7931958, 0, 0, 1, 1, 1,
1.056623, -0.5382986, 3.199339, 1, 0, 0, 1, 1,
1.057082, -0.1012405, 0.8183134, 1, 0, 0, 1, 1,
1.057407, -0.3160009, 2.918276, 1, 0, 0, 1, 1,
1.058272, 0.08820473, -0.3163939, 1, 0, 0, 1, 1,
1.062574, -0.06508035, 1.773431, 1, 0, 0, 1, 1,
1.063354, -0.2653387, 2.521626, 0, 0, 0, 1, 1,
1.063544, -0.5639565, 1.70075, 0, 0, 0, 1, 1,
1.065374, 0.1658634, 0.8350003, 0, 0, 0, 1, 1,
1.067669, 1.669791, 1.790363, 0, 0, 0, 1, 1,
1.077294, 0.9488751, 1.794206, 0, 0, 0, 1, 1,
1.078031, -0.2050888, 3.063021, 0, 0, 0, 1, 1,
1.08194, -1.237846, 2.422293, 0, 0, 0, 1, 1,
1.08413, 0.05339216, 1.284934, 1, 1, 1, 1, 1,
1.097691, 0.6921093, 0.8382097, 1, 1, 1, 1, 1,
1.097691, 0.2767964, 1.293088, 1, 1, 1, 1, 1,
1.098701, -1.201734, 1.846414, 1, 1, 1, 1, 1,
1.101752, -0.9251291, 3.510862, 1, 1, 1, 1, 1,
1.109978, -0.6572729, 2.728204, 1, 1, 1, 1, 1,
1.130565, 0.3004013, 2.322795, 1, 1, 1, 1, 1,
1.132805, 0.5810005, 1.92355, 1, 1, 1, 1, 1,
1.133498, -0.3449044, 1.538953, 1, 1, 1, 1, 1,
1.154568, -0.6484173, 3.447798, 1, 1, 1, 1, 1,
1.157105, -0.04148668, 2.102347, 1, 1, 1, 1, 1,
1.158962, -0.001098066, 1.168267, 1, 1, 1, 1, 1,
1.159913, 0.3721777, 1.425763, 1, 1, 1, 1, 1,
1.160599, 0.05053007, 1.364437, 1, 1, 1, 1, 1,
1.163253, 0.4886041, 1.807139, 1, 1, 1, 1, 1,
1.176365, -1.12403, 2.680714, 0, 0, 1, 1, 1,
1.17751, 0.1615902, 0.5498576, 1, 0, 0, 1, 1,
1.178608, 0.7808334, 0.504828, 1, 0, 0, 1, 1,
1.18514, -1.544477, 3.204215, 1, 0, 0, 1, 1,
1.185243, -0.8326645, 1.320096, 1, 0, 0, 1, 1,
1.188515, -1.480102, 2.668651, 1, 0, 0, 1, 1,
1.189825, 0.6249405, 2.9861, 0, 0, 0, 1, 1,
1.190321, 0.8548625, 1.864941, 0, 0, 0, 1, 1,
1.190875, -1.543334, 3.74188, 0, 0, 0, 1, 1,
1.193465, -0.5839993, 2.703529, 0, 0, 0, 1, 1,
1.198416, 1.010497, -0.2249979, 0, 0, 0, 1, 1,
1.202814, -1.305266, 2.923284, 0, 0, 0, 1, 1,
1.204466, 0.7706338, 1.872058, 0, 0, 0, 1, 1,
1.208372, -0.6242663, 1.057342, 1, 1, 1, 1, 1,
1.212093, -0.3280211, 0.6773663, 1, 1, 1, 1, 1,
1.212854, 0.259623, -0.2338793, 1, 1, 1, 1, 1,
1.217144, 0.5580786, -0.5239524, 1, 1, 1, 1, 1,
1.218756, 0.2702372, 1.185679, 1, 1, 1, 1, 1,
1.242798, -1.862603, 2.504795, 1, 1, 1, 1, 1,
1.243336, -0.1015463, 1.383171, 1, 1, 1, 1, 1,
1.243701, -0.3322182, 2.992864, 1, 1, 1, 1, 1,
1.24874, -0.2089324, 0.8109313, 1, 1, 1, 1, 1,
1.251613, 0.7554418, 1.00293, 1, 1, 1, 1, 1,
1.252643, 0.2208176, 1.422878, 1, 1, 1, 1, 1,
1.259192, 0.7357345, 2.024337, 1, 1, 1, 1, 1,
1.259247, -0.06773735, 2.113937, 1, 1, 1, 1, 1,
1.26732, 0.9181647, 3.443766, 1, 1, 1, 1, 1,
1.268046, -1.116266, 2.248728, 1, 1, 1, 1, 1,
1.281663, 0.1587278, -1.024537, 0, 0, 1, 1, 1,
1.285093, -1.256623, 2.619928, 1, 0, 0, 1, 1,
1.285757, -0.07807406, 1.315344, 1, 0, 0, 1, 1,
1.297529, -2.119818, 3.616385, 1, 0, 0, 1, 1,
1.310343, 1.722572, 0.7342482, 1, 0, 0, 1, 1,
1.317785, -0.7296702, 2.683227, 1, 0, 0, 1, 1,
1.322055, -0.6277061, 2.738814, 0, 0, 0, 1, 1,
1.328, -0.4809524, 1.987913, 0, 0, 0, 1, 1,
1.329241, -1.777044, 3.637397, 0, 0, 0, 1, 1,
1.331241, 1.309258, 1.914589, 0, 0, 0, 1, 1,
1.336402, -1.444355, 1.711683, 0, 0, 0, 1, 1,
1.339102, 1.913024, 1.330761, 0, 0, 0, 1, 1,
1.341057, 0.2199969, 2.535407, 0, 0, 0, 1, 1,
1.347747, 1.375315, -0.07295945, 1, 1, 1, 1, 1,
1.348726, 0.9501289, 0.6863876, 1, 1, 1, 1, 1,
1.352153, 0.6073071, 0.8654463, 1, 1, 1, 1, 1,
1.353997, -0.9691333, 1.28324, 1, 1, 1, 1, 1,
1.359601, 0.3030193, 1.510867, 1, 1, 1, 1, 1,
1.373079, -0.6297508, 2.484415, 1, 1, 1, 1, 1,
1.376387, -0.332188, 2.477348, 1, 1, 1, 1, 1,
1.379045, 0.8342904, 0.9939633, 1, 1, 1, 1, 1,
1.383278, -1.161789, 1.527453, 1, 1, 1, 1, 1,
1.388722, 1.219538, 0.3677372, 1, 1, 1, 1, 1,
1.392436, -2.212932, 2.805133, 1, 1, 1, 1, 1,
1.395392, -0.8691754, 0.7345307, 1, 1, 1, 1, 1,
1.402481, 0.138429, 0.7962778, 1, 1, 1, 1, 1,
1.412695, 0.5639356, 1.488216, 1, 1, 1, 1, 1,
1.418808, -0.8349075, 3.31509, 1, 1, 1, 1, 1,
1.422595, 0.1518331, 2.624679, 0, 0, 1, 1, 1,
1.431032, 0.14152, -0.2092579, 1, 0, 0, 1, 1,
1.431988, 0.3065553, 1.717505, 1, 0, 0, 1, 1,
1.440686, 0.336016, -0.6616597, 1, 0, 0, 1, 1,
1.441675, 0.2475159, 1.201262, 1, 0, 0, 1, 1,
1.45019, 0.07808918, 2.985205, 1, 0, 0, 1, 1,
1.46043, 0.7485749, 0.9717253, 0, 0, 0, 1, 1,
1.465346, -0.3047255, 1.815248, 0, 0, 0, 1, 1,
1.465353, -1.250125, 1.496556, 0, 0, 0, 1, 1,
1.47528, -0.2385159, 0.4304678, 0, 0, 0, 1, 1,
1.493319, 0.9393631, 2.8548, 0, 0, 0, 1, 1,
1.498183, 2.892382, 0.7296621, 0, 0, 0, 1, 1,
1.514083, -0.3467347, 0.5102221, 0, 0, 0, 1, 1,
1.517523, 0.204254, 2.707628, 1, 1, 1, 1, 1,
1.524604, -1.081748, 2.872798, 1, 1, 1, 1, 1,
1.565644, 2.031775, 1.782453, 1, 1, 1, 1, 1,
1.572052, -2.07419, 1.952268, 1, 1, 1, 1, 1,
1.588793, 0.9660931, 0.1254897, 1, 1, 1, 1, 1,
1.619966, -0.1737908, 1.885133, 1, 1, 1, 1, 1,
1.631554, 1.755174, 0.1805542, 1, 1, 1, 1, 1,
1.665739, -1.403199, 2.313164, 1, 1, 1, 1, 1,
1.670734, 1.513346, -1.192802, 1, 1, 1, 1, 1,
1.680494, 0.8084489, 1.225163, 1, 1, 1, 1, 1,
1.685538, -0.7692087, 0.6080557, 1, 1, 1, 1, 1,
1.69183, 0.1644934, 1.701714, 1, 1, 1, 1, 1,
1.714463, 0.4630673, 2.18823, 1, 1, 1, 1, 1,
1.730282, 1.357533, 1.5014, 1, 1, 1, 1, 1,
1.738612, 0.708958, 0.003150557, 1, 1, 1, 1, 1,
1.739991, 0.8898526, 1.800279, 0, 0, 1, 1, 1,
1.746745, -0.9404189, 0.5932897, 1, 0, 0, 1, 1,
1.751385, 1.622017, 1.351965, 1, 0, 0, 1, 1,
1.759678, 1.478721, 1.271049, 1, 0, 0, 1, 1,
1.768657, -0.5454796, 2.744089, 1, 0, 0, 1, 1,
1.785603, -0.4757002, 0.2137299, 1, 0, 0, 1, 1,
1.81493, -1.016289, 1.501408, 0, 0, 0, 1, 1,
1.822824, -0.5887626, 2.07786, 0, 0, 0, 1, 1,
1.840037, 0.3461064, 0.2671584, 0, 0, 0, 1, 1,
1.851983, 1.186112, 0.6125435, 0, 0, 0, 1, 1,
1.867643, -0.366667, 1.314447, 0, 0, 0, 1, 1,
1.867731, -0.5717474, 0.6402457, 0, 0, 0, 1, 1,
1.873573, 0.290936, 0.3490748, 0, 0, 0, 1, 1,
1.894553, 0.7089723, 1.597683, 1, 1, 1, 1, 1,
1.910942, 0.2509093, 3.193722, 1, 1, 1, 1, 1,
1.929985, -0.5593634, 3.131709, 1, 1, 1, 1, 1,
1.938809, 0.2928731, 1.098784, 1, 1, 1, 1, 1,
1.960616, -2.037622, 2.360103, 1, 1, 1, 1, 1,
1.984799, 0.2476912, 1.491917, 1, 1, 1, 1, 1,
2.008922, 0.4117261, 1.023821, 1, 1, 1, 1, 1,
2.013046, -1.233012, 1.402179, 1, 1, 1, 1, 1,
2.043045, 1.341365, -0.7667513, 1, 1, 1, 1, 1,
2.064004, -0.3066312, 2.397933, 1, 1, 1, 1, 1,
2.101683, 1.662211, 0.4982271, 1, 1, 1, 1, 1,
2.104006, -0.3849557, 2.421582, 1, 1, 1, 1, 1,
2.146328, 0.07209297, 1.567421, 1, 1, 1, 1, 1,
2.183402, 1.991144, 1.309475, 1, 1, 1, 1, 1,
2.20612, 0.8596952, 1.583176, 1, 1, 1, 1, 1,
2.215745, -0.1977247, 2.67784, 0, 0, 1, 1, 1,
2.235888, 0.5887032, 2.431582, 1, 0, 0, 1, 1,
2.245908, 1.86784, 0.6769425, 1, 0, 0, 1, 1,
2.246917, -0.5283975, 3.412356, 1, 0, 0, 1, 1,
2.255118, -1.551552, 2.446006, 1, 0, 0, 1, 1,
2.277152, -0.6960952, 2.460837, 1, 0, 0, 1, 1,
2.322255, 0.5584338, 0.3133858, 0, 0, 0, 1, 1,
2.407043, -1.05557, 1.155435, 0, 0, 0, 1, 1,
2.419951, -0.2508826, 2.340251, 0, 0, 0, 1, 1,
2.448975, 0.3358377, 1.808903, 0, 0, 0, 1, 1,
2.514728, -0.5783904, 1.64882, 0, 0, 0, 1, 1,
2.556667, -0.6482912, 2.192735, 0, 0, 0, 1, 1,
2.559691, -2.405932, 1.837103, 0, 0, 0, 1, 1,
2.685763, -1.418384, 2.87936, 1, 1, 1, 1, 1,
2.692122, -0.6408944, 0.09057956, 1, 1, 1, 1, 1,
2.705744, -0.9417598, 2.091416, 1, 1, 1, 1, 1,
2.832717, 0.6906621, 2.372073, 1, 1, 1, 1, 1,
2.970501, 0.935553, 2.278797, 1, 1, 1, 1, 1,
3.123531, -0.55142, 0.8188743, 1, 1, 1, 1, 1,
3.246619, -0.8050068, 1.369191, 1, 1, 1, 1, 1
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
var radius = 9.557036;
var distance = 33.56869;
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
mvMatrix.translate( 0.05986786, -0.09711885, 0.02770901 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.56869);
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