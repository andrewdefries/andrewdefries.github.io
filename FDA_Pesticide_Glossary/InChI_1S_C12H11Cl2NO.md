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
-3.347196, 0.3643729, -0.2693724, 1, 0, 0, 1,
-3.129836, -1.298259, -0.0761336, 1, 0.007843138, 0, 1,
-3.015283, -0.8443179, -1.583057, 1, 0.01176471, 0, 1,
-2.814006, 0.08529316, -2.268177, 1, 0.01960784, 0, 1,
-2.806933, -0.9950124, -1.105067, 1, 0.02352941, 0, 1,
-2.702186, -0.8846713, -1.41737, 1, 0.03137255, 0, 1,
-2.648976, 0.3850372, -1.971109, 1, 0.03529412, 0, 1,
-2.641981, -2.286974, -0.61636, 1, 0.04313726, 0, 1,
-2.485685, -0.09288263, -0.9543623, 1, 0.04705882, 0, 1,
-2.391163, -0.08860224, -1.530352, 1, 0.05490196, 0, 1,
-2.367753, 1.927481, -1.964741, 1, 0.05882353, 0, 1,
-2.364887, -1.211159, -0.03713434, 1, 0.06666667, 0, 1,
-2.325522, -1.043422, -0.8049427, 1, 0.07058824, 0, 1,
-2.298948, 0.1978183, -2.21966, 1, 0.07843138, 0, 1,
-2.226565, 0.8726484, -2.603093, 1, 0.08235294, 0, 1,
-2.198442, 1.480965, -1.077569, 1, 0.09019608, 0, 1,
-2.165872, 0.5643139, -1.863052, 1, 0.09411765, 0, 1,
-2.129513, -0.1346225, -1.545555, 1, 0.1019608, 0, 1,
-2.080764, 0.1688052, -3.304351, 1, 0.1098039, 0, 1,
-2.067114, -2.188084, -0.5549746, 1, 0.1137255, 0, 1,
-2.06171, 0.1904583, -2.023879, 1, 0.1215686, 0, 1,
-2.060917, 1.82568, -3.326764, 1, 0.1254902, 0, 1,
-2.056172, -1.489828, -2.343242, 1, 0.1333333, 0, 1,
-2.053732, 0.7143579, 0.3850337, 1, 0.1372549, 0, 1,
-2.049119, -0.4892023, -1.686436, 1, 0.145098, 0, 1,
-2.041547, -1.139192, -0.4315671, 1, 0.1490196, 0, 1,
-2.038283, 0.9915143, -2.086372, 1, 0.1568628, 0, 1,
-2.024635, 1.855028, 0.2713743, 1, 0.1607843, 0, 1,
-2.004265, 0.430569, -0.005855301, 1, 0.1686275, 0, 1,
-1.965776, -0.7182341, -2.469531, 1, 0.172549, 0, 1,
-1.945382, 1.020797, -0.3078433, 1, 0.1803922, 0, 1,
-1.929163, 0.4687897, -0.8732215, 1, 0.1843137, 0, 1,
-1.926336, 0.2763894, -1.829745, 1, 0.1921569, 0, 1,
-1.915331, -0.4996412, -1.814005, 1, 0.1960784, 0, 1,
-1.889342, -0.8613253, -0.9254206, 1, 0.2039216, 0, 1,
-1.869546, -0.438946, -0.9981173, 1, 0.2117647, 0, 1,
-1.855482, -0.1852998, -0.7663608, 1, 0.2156863, 0, 1,
-1.847836, -0.8076923, -0.4018298, 1, 0.2235294, 0, 1,
-1.823153, 0.5674196, -1.967896, 1, 0.227451, 0, 1,
-1.807, -1.905701, -2.728874, 1, 0.2352941, 0, 1,
-1.798577, 0.5164735, -0.106947, 1, 0.2392157, 0, 1,
-1.789504, 0.3427919, -1.608629, 1, 0.2470588, 0, 1,
-1.759674, 1.051749, -0.5250006, 1, 0.2509804, 0, 1,
-1.735224, -1.573915, -2.488284, 1, 0.2588235, 0, 1,
-1.717646, 0.6220555, -2.229764, 1, 0.2627451, 0, 1,
-1.712866, 1.256261, -0.4623933, 1, 0.2705882, 0, 1,
-1.696763, 0.5344313, -2.025746, 1, 0.2745098, 0, 1,
-1.68703, -1.219728, -2.34144, 1, 0.282353, 0, 1,
-1.685271, 1.514026, -0.1581667, 1, 0.2862745, 0, 1,
-1.665249, -1.160596, -3.39204, 1, 0.2941177, 0, 1,
-1.662404, -0.5556659, -1.738617, 1, 0.3019608, 0, 1,
-1.628131, 1.458269, -1.570296, 1, 0.3058824, 0, 1,
-1.622548, -2.03325, -2.973096, 1, 0.3137255, 0, 1,
-1.61409, -0.1960189, 0.203951, 1, 0.3176471, 0, 1,
-1.61068, 0.4700369, -2.453526, 1, 0.3254902, 0, 1,
-1.602688, -0.1731889, -4.594697, 1, 0.3294118, 0, 1,
-1.567837, 0.2869422, -0.3846389, 1, 0.3372549, 0, 1,
-1.55576, -0.8135705, -3.029285, 1, 0.3411765, 0, 1,
-1.547513, 0.9889622, -1.397557, 1, 0.3490196, 0, 1,
-1.539831, -0.7419609, -4.879289, 1, 0.3529412, 0, 1,
-1.537841, -0.3022017, -1.053042, 1, 0.3607843, 0, 1,
-1.502614, -1.353434, -3.253334, 1, 0.3647059, 0, 1,
-1.497997, 0.2089855, -3.857675, 1, 0.372549, 0, 1,
-1.497084, 0.6080902, -1.825303, 1, 0.3764706, 0, 1,
-1.485227, -0.7842284, -3.508929, 1, 0.3843137, 0, 1,
-1.46936, -0.3465399, -1.936713, 1, 0.3882353, 0, 1,
-1.460491, -0.4317296, -0.978561, 1, 0.3960784, 0, 1,
-1.459821, -0.4863264, -1.133909, 1, 0.4039216, 0, 1,
-1.458261, -0.8759205, -2.096004, 1, 0.4078431, 0, 1,
-1.452957, 0.598911, -0.8096818, 1, 0.4156863, 0, 1,
-1.451228, 1.927768, 0.5917, 1, 0.4196078, 0, 1,
-1.442569, 0.01856718, -0.6177608, 1, 0.427451, 0, 1,
-1.439413, -1.090309, -4.081945, 1, 0.4313726, 0, 1,
-1.434751, 1.38893, 0.08743986, 1, 0.4392157, 0, 1,
-1.426322, -0.7087685, -1.278881, 1, 0.4431373, 0, 1,
-1.42029, 0.7461015, -0.8092273, 1, 0.4509804, 0, 1,
-1.416332, -0.700995, -4.796258, 1, 0.454902, 0, 1,
-1.370314, -0.690132, -1.280967, 1, 0.4627451, 0, 1,
-1.369795, -0.1820997, -1.130212, 1, 0.4666667, 0, 1,
-1.368994, 1.513472, -0.8173103, 1, 0.4745098, 0, 1,
-1.363572, 0.0005422207, -0.9941041, 1, 0.4784314, 0, 1,
-1.362483, 0.2326453, -2.94873, 1, 0.4862745, 0, 1,
-1.351714, 0.4416357, -1.08275, 1, 0.4901961, 0, 1,
-1.346237, -0.9260626, -1.689034, 1, 0.4980392, 0, 1,
-1.343882, 0.3127427, -0.9099025, 1, 0.5058824, 0, 1,
-1.342122, 0.2781565, -2.327826, 1, 0.509804, 0, 1,
-1.341619, 1.634732, -1.288276, 1, 0.5176471, 0, 1,
-1.338908, -0.9251186, -2.268651, 1, 0.5215687, 0, 1,
-1.323007, 0.5883134, -1.694302, 1, 0.5294118, 0, 1,
-1.321404, -0.6082164, -2.113708, 1, 0.5333334, 0, 1,
-1.304619, -0.7341176, -1.53688, 1, 0.5411765, 0, 1,
-1.301328, -0.8488395, -3.106127, 1, 0.5450981, 0, 1,
-1.295879, -0.50803, -1.589046, 1, 0.5529412, 0, 1,
-1.289225, 1.60191, -1.030936, 1, 0.5568628, 0, 1,
-1.286841, 0.6609549, -1.711969, 1, 0.5647059, 0, 1,
-1.284377, -1.242882, -2.635185, 1, 0.5686275, 0, 1,
-1.278279, 2.094974, -1.626652, 1, 0.5764706, 0, 1,
-1.273673, 1.264539, -1.75315, 1, 0.5803922, 0, 1,
-1.272473, 1.325531, -0.4953807, 1, 0.5882353, 0, 1,
-1.256779, -1.151713, -1.674703, 1, 0.5921569, 0, 1,
-1.255644, 0.5378492, -0.8500631, 1, 0.6, 0, 1,
-1.255384, -0.6616445, -2.305119, 1, 0.6078432, 0, 1,
-1.235459, -1.368803, -3.601412, 1, 0.6117647, 0, 1,
-1.222837, 0.1060934, -1.693925, 1, 0.6196079, 0, 1,
-1.219758, -1.322604, -1.65693, 1, 0.6235294, 0, 1,
-1.212014, 0.6572659, -0.3133599, 1, 0.6313726, 0, 1,
-1.211697, 1.357768, -1.82154, 1, 0.6352941, 0, 1,
-1.209644, -0.07890976, -1.923735, 1, 0.6431373, 0, 1,
-1.207162, 0.2919229, -1.481127, 1, 0.6470588, 0, 1,
-1.206242, 0.9080383, -0.7179875, 1, 0.654902, 0, 1,
-1.195356, -0.8367546, -1.184077, 1, 0.6588235, 0, 1,
-1.193388, 0.6059334, -1.494085, 1, 0.6666667, 0, 1,
-1.191251, 1.565271, -0.9295946, 1, 0.6705883, 0, 1,
-1.184151, -1.265838, -1.771401, 1, 0.6784314, 0, 1,
-1.18209, -0.2214309, -3.218394, 1, 0.682353, 0, 1,
-1.181634, 0.7006406, -2.768377, 1, 0.6901961, 0, 1,
-1.167381, -0.6712872, -2.60894, 1, 0.6941177, 0, 1,
-1.164042, 0.3611121, -0.5832372, 1, 0.7019608, 0, 1,
-1.148763, 0.8723847, -1.611656, 1, 0.7098039, 0, 1,
-1.146677, -0.4172018, -2.043193, 1, 0.7137255, 0, 1,
-1.142664, -0.7042392, -3.14982, 1, 0.7215686, 0, 1,
-1.141267, -1.369107, -3.974603, 1, 0.7254902, 0, 1,
-1.139865, -0.1462535, 0.1958139, 1, 0.7333333, 0, 1,
-1.136045, 1.228175, -2.960506, 1, 0.7372549, 0, 1,
-1.12899, 0.04679101, -3.931586, 1, 0.7450981, 0, 1,
-1.120254, 1.4232, 0.7069543, 1, 0.7490196, 0, 1,
-1.115754, 1.40866, -1.322444, 1, 0.7568628, 0, 1,
-1.103903, 0.4057885, -0.0763993, 1, 0.7607843, 0, 1,
-1.102353, -0.6056964, -2.702474, 1, 0.7686275, 0, 1,
-1.092028, -0.05521137, -1.20979, 1, 0.772549, 0, 1,
-1.089598, -0.488979, -2.193747, 1, 0.7803922, 0, 1,
-1.088827, -0.2829343, -1.974894, 1, 0.7843137, 0, 1,
-1.087373, -1.350084, -3.038317, 1, 0.7921569, 0, 1,
-1.078863, -0.06041694, -0.7221903, 1, 0.7960784, 0, 1,
-1.072338, -1.054649, -2.337237, 1, 0.8039216, 0, 1,
-1.068171, -1.767042, -2.474622, 1, 0.8117647, 0, 1,
-1.065615, -1.781111, -3.715453, 1, 0.8156863, 0, 1,
-1.056151, 1.965941, -1.355339, 1, 0.8235294, 0, 1,
-1.050599, 1.90485, -0.7453433, 1, 0.827451, 0, 1,
-1.044501, -2.188776, -2.315805, 1, 0.8352941, 0, 1,
-1.043846, 0.2858269, -2.10238, 1, 0.8392157, 0, 1,
-1.034649, 1.067473, 0.6968783, 1, 0.8470588, 0, 1,
-1.025509, -0.4137731, -2.503358, 1, 0.8509804, 0, 1,
-1.025202, -0.9316441, -2.494268, 1, 0.8588235, 0, 1,
-1.023603, 0.9149162, -1.108478, 1, 0.8627451, 0, 1,
-1.023398, 0.08625643, -1.395855, 1, 0.8705882, 0, 1,
-1.022273, -0.2179894, -1.24501, 1, 0.8745098, 0, 1,
-1.013604, 1.280695, -1.739134, 1, 0.8823529, 0, 1,
-1.009042, 1.010443, -1.889578, 1, 0.8862745, 0, 1,
-1.006917, 0.6049629, -0.865121, 1, 0.8941177, 0, 1,
-1.006441, 0.0592085, -1.230608, 1, 0.8980392, 0, 1,
-0.9938885, -1.333681, -4.14354, 1, 0.9058824, 0, 1,
-0.9889046, -0.6963498, -1.446387, 1, 0.9137255, 0, 1,
-0.9812821, -0.7618405, -2.79184, 1, 0.9176471, 0, 1,
-0.9798606, 0.4038255, -1.867424, 1, 0.9254902, 0, 1,
-0.9786194, -1.111983, -3.695905, 1, 0.9294118, 0, 1,
-0.9772722, 0.2105815, -1.367906, 1, 0.9372549, 0, 1,
-0.9609717, 1.452029, -0.01738628, 1, 0.9411765, 0, 1,
-0.9576388, -0.06154715, -1.527375, 1, 0.9490196, 0, 1,
-0.9547552, -0.3156544, -0.4636522, 1, 0.9529412, 0, 1,
-0.9532879, 0.8786248, -1.89173, 1, 0.9607843, 0, 1,
-0.9529933, 0.7671713, -0.9426525, 1, 0.9647059, 0, 1,
-0.9507511, 1.695846, 0.9847078, 1, 0.972549, 0, 1,
-0.9495893, -1.382045, -2.547126, 1, 0.9764706, 0, 1,
-0.9475114, 0.7823367, -0.6789714, 1, 0.9843137, 0, 1,
-0.9473994, -1.807333, -2.586145, 1, 0.9882353, 0, 1,
-0.945256, 2.110272, -1.4361, 1, 0.9960784, 0, 1,
-0.944432, -0.3807662, -1.811889, 0.9960784, 1, 0, 1,
-0.9357157, -0.5143183, -3.057055, 0.9921569, 1, 0, 1,
-0.9319289, -0.4865793, -2.465066, 0.9843137, 1, 0, 1,
-0.9298114, 0.1931938, -0.8911886, 0.9803922, 1, 0, 1,
-0.9271237, -1.321282, -1.722082, 0.972549, 1, 0, 1,
-0.9269187, -1.1307, -2.629612, 0.9686275, 1, 0, 1,
-0.9169362, 0.05724207, -0.7897857, 0.9607843, 1, 0, 1,
-0.9155602, -1.282509, -1.060426, 0.9568627, 1, 0, 1,
-0.9140936, 1.300496, -1.080801, 0.9490196, 1, 0, 1,
-0.9108515, 0.1772051, 0.2641367, 0.945098, 1, 0, 1,
-0.9103315, -0.6563323, -3.102878, 0.9372549, 1, 0, 1,
-0.9010401, -0.6280155, -1.595004, 0.9333333, 1, 0, 1,
-0.8982906, 2.308278, -1.514527, 0.9254902, 1, 0, 1,
-0.897667, -0.2791858, -3.473652, 0.9215686, 1, 0, 1,
-0.8936657, 0.5395851, -0.1348361, 0.9137255, 1, 0, 1,
-0.8879011, -0.2424244, -0.4127716, 0.9098039, 1, 0, 1,
-0.8878723, 0.7169259, 2.500273, 0.9019608, 1, 0, 1,
-0.886337, -0.1136077, -0.9170246, 0.8941177, 1, 0, 1,
-0.8844622, 0.3141639, 0.8731801, 0.8901961, 1, 0, 1,
-0.8795263, 0.06439868, -2.500202, 0.8823529, 1, 0, 1,
-0.8792914, 1.879366, -1.108609, 0.8784314, 1, 0, 1,
-0.8770069, 1.252632, 0.7092358, 0.8705882, 1, 0, 1,
-0.8765748, -0.03231231, -0.9152067, 0.8666667, 1, 0, 1,
-0.8693064, 0.3875466, -1.61093, 0.8588235, 1, 0, 1,
-0.8679309, -0.2362454, -2.685374, 0.854902, 1, 0, 1,
-0.8667068, -0.1679358, -2.516912, 0.8470588, 1, 0, 1,
-0.8662555, 0.6974881, -0.7299473, 0.8431373, 1, 0, 1,
-0.8638659, -0.2793322, -2.646517, 0.8352941, 1, 0, 1,
-0.8638034, 0.01496848, -1.591556, 0.8313726, 1, 0, 1,
-0.8529724, -0.05738793, -0.4572753, 0.8235294, 1, 0, 1,
-0.8525365, 0.2514712, -0.6369469, 0.8196079, 1, 0, 1,
-0.850407, 0.568015, -0.5963103, 0.8117647, 1, 0, 1,
-0.8494656, -0.3634161, -0.6025673, 0.8078431, 1, 0, 1,
-0.8492155, -0.4577601, -1.786439, 0.8, 1, 0, 1,
-0.8477977, 1.14496, -0.1580797, 0.7921569, 1, 0, 1,
-0.8474638, -0.8806598, -0.7393676, 0.7882353, 1, 0, 1,
-0.8368585, 0.03411594, -1.925977, 0.7803922, 1, 0, 1,
-0.8345949, -1.44309, -2.133255, 0.7764706, 1, 0, 1,
-0.8280957, 0.04616579, -2.607118, 0.7686275, 1, 0, 1,
-0.827628, -1.02799, -2.196707, 0.7647059, 1, 0, 1,
-0.819677, -0.702443, -2.968553, 0.7568628, 1, 0, 1,
-0.8161594, -1.182217, -3.421324, 0.7529412, 1, 0, 1,
-0.8010903, 0.2659203, -2.427844, 0.7450981, 1, 0, 1,
-0.7943326, -0.1968164, -1.267271, 0.7411765, 1, 0, 1,
-0.7883914, -0.7623616, 0.06130645, 0.7333333, 1, 0, 1,
-0.7806733, -0.3517585, -3.184568, 0.7294118, 1, 0, 1,
-0.7757507, 0.3086776, -0.167231, 0.7215686, 1, 0, 1,
-0.7735554, 1.845971, 0.03614746, 0.7176471, 1, 0, 1,
-0.7727961, -1.249528, -2.054022, 0.7098039, 1, 0, 1,
-0.7720353, -0.1773907, -1.138509, 0.7058824, 1, 0, 1,
-0.7676998, -0.1973815, -1.10286, 0.6980392, 1, 0, 1,
-0.7591292, -0.156538, -0.5926933, 0.6901961, 1, 0, 1,
-0.7510074, 0.5264513, -0.3560228, 0.6862745, 1, 0, 1,
-0.7493389, 0.5696881, 0.4218246, 0.6784314, 1, 0, 1,
-0.7478681, -0.6878891, -2.384382, 0.6745098, 1, 0, 1,
-0.7467467, 0.2361977, -3.946624, 0.6666667, 1, 0, 1,
-0.7454501, -0.2261156, -2.338576, 0.6627451, 1, 0, 1,
-0.7440746, -0.244144, -1.093186, 0.654902, 1, 0, 1,
-0.7271601, -2.15022, -1.892419, 0.6509804, 1, 0, 1,
-0.7268324, -2.338676, -3.364423, 0.6431373, 1, 0, 1,
-0.717983, -0.5989503, -1.090744, 0.6392157, 1, 0, 1,
-0.7152289, -0.4948059, -2.805468, 0.6313726, 1, 0, 1,
-0.7106466, 1.772874, -0.1919984, 0.627451, 1, 0, 1,
-0.7062449, -0.5563955, -3.301322, 0.6196079, 1, 0, 1,
-0.7043493, 0.6820371, -1.787025, 0.6156863, 1, 0, 1,
-0.7022586, 0.748959, 0.4605395, 0.6078432, 1, 0, 1,
-0.6979632, 0.5654949, -2.959645, 0.6039216, 1, 0, 1,
-0.6974387, -0.6691017, -4.511779, 0.5960785, 1, 0, 1,
-0.6932244, 0.7540383, -0.008447574, 0.5882353, 1, 0, 1,
-0.6891565, -0.6646094, -1.78148, 0.5843138, 1, 0, 1,
-0.6848965, -1.317465, -4.220691, 0.5764706, 1, 0, 1,
-0.6816925, -0.6944464, -2.520883, 0.572549, 1, 0, 1,
-0.6816249, -0.05820562, -1.42107, 0.5647059, 1, 0, 1,
-0.6771509, -0.02593963, -0.9919685, 0.5607843, 1, 0, 1,
-0.6688093, 0.2934709, -2.300142, 0.5529412, 1, 0, 1,
-0.6672955, 0.230909, -2.465499, 0.5490196, 1, 0, 1,
-0.6566904, 1.347712, -0.6664612, 0.5411765, 1, 0, 1,
-0.6562439, 0.5070807, -1.099311, 0.5372549, 1, 0, 1,
-0.6550428, 0.06896467, -1.362289, 0.5294118, 1, 0, 1,
-0.6505335, -0.3294112, -1.667011, 0.5254902, 1, 0, 1,
-0.642576, -0.3317276, -2.924143, 0.5176471, 1, 0, 1,
-0.6408865, -1.194608, -2.5857, 0.5137255, 1, 0, 1,
-0.6402996, 0.4472318, -0.7690982, 0.5058824, 1, 0, 1,
-0.6349319, -1.701891, -4.715957, 0.5019608, 1, 0, 1,
-0.6294721, 1.126972, -0.9385679, 0.4941176, 1, 0, 1,
-0.628794, 0.2967817, -0.8609804, 0.4862745, 1, 0, 1,
-0.6276095, -0.3978855, -1.436618, 0.4823529, 1, 0, 1,
-0.6271867, -1.308462, -3.643304, 0.4745098, 1, 0, 1,
-0.6269814, -0.05752543, -0.5873789, 0.4705882, 1, 0, 1,
-0.6204443, -1.270312, -1.11782, 0.4627451, 1, 0, 1,
-0.6157229, 0.2253563, -1.237232, 0.4588235, 1, 0, 1,
-0.6143249, 1.245195, -1.757555, 0.4509804, 1, 0, 1,
-0.6114544, 0.1498454, -1.019353, 0.4470588, 1, 0, 1,
-0.6091568, 1.023991, 0.002453842, 0.4392157, 1, 0, 1,
-0.6085926, -0.2767609, 0.6542071, 0.4352941, 1, 0, 1,
-0.6076496, 1.443022, -1.853218, 0.427451, 1, 0, 1,
-0.6034688, -0.2421591, -1.549388, 0.4235294, 1, 0, 1,
-0.602305, -1.349126, -1.941248, 0.4156863, 1, 0, 1,
-0.6011904, -0.7880699, -1.671081, 0.4117647, 1, 0, 1,
-0.6008602, -2.484929, -2.674856, 0.4039216, 1, 0, 1,
-0.60076, 2.035333, 1.330013, 0.3960784, 1, 0, 1,
-0.5942394, 1.335819, -1.071499, 0.3921569, 1, 0, 1,
-0.593576, 0.4975816, -2.360924, 0.3843137, 1, 0, 1,
-0.5927373, 1.130671, 1.066555, 0.3803922, 1, 0, 1,
-0.5912657, -2.414546, -2.165476, 0.372549, 1, 0, 1,
-0.5908479, -0.396744, -2.569437, 0.3686275, 1, 0, 1,
-0.5837251, 0.6378739, 0.6852958, 0.3607843, 1, 0, 1,
-0.5764459, 1.291982, -1.038378, 0.3568628, 1, 0, 1,
-0.576317, 1.011227, -0.453135, 0.3490196, 1, 0, 1,
-0.5750737, 0.7459496, -1.579089, 0.345098, 1, 0, 1,
-0.5730273, -0.1261216, -2.404488, 0.3372549, 1, 0, 1,
-0.5643947, -0.3757003, -2.335183, 0.3333333, 1, 0, 1,
-0.5425668, 1.048113, -2.089, 0.3254902, 1, 0, 1,
-0.5416743, -1.335137, -3.066495, 0.3215686, 1, 0, 1,
-0.5386299, 0.2582869, 0.2372171, 0.3137255, 1, 0, 1,
-0.5377392, 1.300838, 0.6447086, 0.3098039, 1, 0, 1,
-0.5369964, -0.5310327, -1.840578, 0.3019608, 1, 0, 1,
-0.5147302, -0.6514448, 0.2038988, 0.2941177, 1, 0, 1,
-0.5146402, -0.8107831, -1.728379, 0.2901961, 1, 0, 1,
-0.5144208, 0.578776, -2.087919, 0.282353, 1, 0, 1,
-0.5114895, -0.4897395, -1.552927, 0.2784314, 1, 0, 1,
-0.5082605, -1.004325, -3.222312, 0.2705882, 1, 0, 1,
-0.5010595, 0.8262494, -3.114922, 0.2666667, 1, 0, 1,
-0.4994463, -0.2509317, -1.489067, 0.2588235, 1, 0, 1,
-0.4990824, -0.1356978, -2.74323, 0.254902, 1, 0, 1,
-0.4947689, 0.6709247, -1.520472, 0.2470588, 1, 0, 1,
-0.4942584, 0.2066609, -2.002455, 0.2431373, 1, 0, 1,
-0.4885218, -1.636002, -2.339527, 0.2352941, 1, 0, 1,
-0.4864934, -0.3260591, -3.397061, 0.2313726, 1, 0, 1,
-0.4723236, -0.2289705, -1.467807, 0.2235294, 1, 0, 1,
-0.4718188, 0.5408128, -0.523073, 0.2196078, 1, 0, 1,
-0.4708535, -0.3639125, -3.327631, 0.2117647, 1, 0, 1,
-0.4682637, 0.624128, -0.3641427, 0.2078431, 1, 0, 1,
-0.4682214, 0.08083241, -0.5236686, 0.2, 1, 0, 1,
-0.4679902, 0.5096815, -1.660006, 0.1921569, 1, 0, 1,
-0.4666664, -1.600725, -3.723357, 0.1882353, 1, 0, 1,
-0.4651558, 1.097842, -1.84908, 0.1803922, 1, 0, 1,
-0.4609527, 0.6001058, -1.372354, 0.1764706, 1, 0, 1,
-0.4575594, -0.6691809, -1.788665, 0.1686275, 1, 0, 1,
-0.4554905, -0.4390318, -1.817429, 0.1647059, 1, 0, 1,
-0.4504317, 0.2860423, -0.8784197, 0.1568628, 1, 0, 1,
-0.4469813, -0.5030801, -3.49875, 0.1529412, 1, 0, 1,
-0.4452168, -1.923452, -2.415506, 0.145098, 1, 0, 1,
-0.4434951, 0.3276569, -0.7378197, 0.1411765, 1, 0, 1,
-0.4398978, 0.4123553, -0.3073856, 0.1333333, 1, 0, 1,
-0.4381573, 0.5255584, -1.198041, 0.1294118, 1, 0, 1,
-0.4340465, -0.59389, -3.327595, 0.1215686, 1, 0, 1,
-0.4339605, -0.8716902, -1.756494, 0.1176471, 1, 0, 1,
-0.4315462, 0.6222572, -1.457784, 0.1098039, 1, 0, 1,
-0.4270457, 0.1403509, -1.121043, 0.1058824, 1, 0, 1,
-0.4266372, 0.4295806, -0.7164898, 0.09803922, 1, 0, 1,
-0.4232761, 0.1810007, -0.3254616, 0.09019608, 1, 0, 1,
-0.4143449, -0.4723562, -2.712109, 0.08627451, 1, 0, 1,
-0.4138753, -1.251297, -2.553972, 0.07843138, 1, 0, 1,
-0.4123317, 0.3309474, -2.317018, 0.07450981, 1, 0, 1,
-0.4123239, -0.4770867, -2.259299, 0.06666667, 1, 0, 1,
-0.4115998, 0.743741, -0.3742561, 0.0627451, 1, 0, 1,
-0.4113532, 0.422355, -1.327034, 0.05490196, 1, 0, 1,
-0.4105192, 0.2443333, -2.277586, 0.05098039, 1, 0, 1,
-0.4080575, -0.3548985, -3.283109, 0.04313726, 1, 0, 1,
-0.407894, 1.425779, 0.9588779, 0.03921569, 1, 0, 1,
-0.4049813, -0.8146291, -1.287531, 0.03137255, 1, 0, 1,
-0.3978004, -1.745718, -0.4743755, 0.02745098, 1, 0, 1,
-0.3967493, -1.008914, -2.256354, 0.01960784, 1, 0, 1,
-0.3902555, 0.3048588, -1.396619, 0.01568628, 1, 0, 1,
-0.3894496, 0.1574526, -0.5102047, 0.007843138, 1, 0, 1,
-0.3889992, -0.03376267, -2.970212, 0.003921569, 1, 0, 1,
-0.3879982, 0.2063324, 0.1199079, 0, 1, 0.003921569, 1,
-0.384613, 0.375969, -3.347662, 0, 1, 0.01176471, 1,
-0.382232, -1.199244, -4.508914, 0, 1, 0.01568628, 1,
-0.381071, -0.1070782, -0.7665494, 0, 1, 0.02352941, 1,
-0.3762324, 0.6372399, -1.291118, 0, 1, 0.02745098, 1,
-0.3737909, 0.3018304, -1.010533, 0, 1, 0.03529412, 1,
-0.3712081, -2.230577, -2.918354, 0, 1, 0.03921569, 1,
-0.3687664, -1.09044, -1.016799, 0, 1, 0.04705882, 1,
-0.3664473, 2.007778, 1.213107, 0, 1, 0.05098039, 1,
-0.3623752, 1.250844, -0.8490183, 0, 1, 0.05882353, 1,
-0.3609888, -0.748657, -4.144799, 0, 1, 0.0627451, 1,
-0.3608787, 1.054512, -2.33876, 0, 1, 0.07058824, 1,
-0.359457, -0.1651895, -0.1578633, 0, 1, 0.07450981, 1,
-0.3580079, 0.6694623, -1.164997, 0, 1, 0.08235294, 1,
-0.3536521, 0.5438193, -2.508946, 0, 1, 0.08627451, 1,
-0.3536252, 1.424453, 0.06901346, 0, 1, 0.09411765, 1,
-0.3521743, -0.5623431, -3.193372, 0, 1, 0.1019608, 1,
-0.3517314, -0.448062, -0.3151746, 0, 1, 0.1058824, 1,
-0.3507511, 0.7085433, -1.374409, 0, 1, 0.1137255, 1,
-0.3473278, 0.5903942, -0.1979893, 0, 1, 0.1176471, 1,
-0.3459873, -0.6187891, -2.033348, 0, 1, 0.1254902, 1,
-0.3444163, 0.2097177, -1.376561, 0, 1, 0.1294118, 1,
-0.343459, 1.426551, -0.7266396, 0, 1, 0.1372549, 1,
-0.3409011, -0.242884, -2.10521, 0, 1, 0.1411765, 1,
-0.335505, 1.495711, -1.011563, 0, 1, 0.1490196, 1,
-0.3182323, 0.9171798, -0.840722, 0, 1, 0.1529412, 1,
-0.3171507, 2.270307, -0.3715906, 0, 1, 0.1607843, 1,
-0.3161044, -0.3696091, -2.236998, 0, 1, 0.1647059, 1,
-0.3126376, 1.396576, -0.4084386, 0, 1, 0.172549, 1,
-0.3091092, -2.394957, -4.01559, 0, 1, 0.1764706, 1,
-0.303905, -0.5137148, -3.292661, 0, 1, 0.1843137, 1,
-0.3036406, 0.4029815, -0.8451575, 0, 1, 0.1882353, 1,
-0.3034772, 0.6457633, -0.8728577, 0, 1, 0.1960784, 1,
-0.301236, 1.283989, 0.7122295, 0, 1, 0.2039216, 1,
-0.2986275, -0.2575611, -1.45949, 0, 1, 0.2078431, 1,
-0.2945615, -1.280038, -2.053525, 0, 1, 0.2156863, 1,
-0.2901909, 0.7732415, -0.7330356, 0, 1, 0.2196078, 1,
-0.2802756, -0.2454084, -2.121111, 0, 1, 0.227451, 1,
-0.2753451, -1.287076, -2.412669, 0, 1, 0.2313726, 1,
-0.2736264, -1.310157, -3.965818, 0, 1, 0.2392157, 1,
-0.2657478, -0.1815713, -1.963724, 0, 1, 0.2431373, 1,
-0.2655605, 0.248649, 0.1485021, 0, 1, 0.2509804, 1,
-0.260961, -0.05055185, -1.77604, 0, 1, 0.254902, 1,
-0.2560947, 0.300276, 0.2670153, 0, 1, 0.2627451, 1,
-0.251589, -0.1297201, -3.044788, 0, 1, 0.2666667, 1,
-0.2492391, 1.991147, -0.374943, 0, 1, 0.2745098, 1,
-0.2463603, -0.2077694, -1.095519, 0, 1, 0.2784314, 1,
-0.2439017, -0.2282001, -1.061021, 0, 1, 0.2862745, 1,
-0.2437281, 0.7615731, 0.1156425, 0, 1, 0.2901961, 1,
-0.2371783, 0.6104343, -1.299481, 0, 1, 0.2980392, 1,
-0.2359406, 0.2319197, -2.055048, 0, 1, 0.3058824, 1,
-0.2301555, -0.5900592, -2.219493, 0, 1, 0.3098039, 1,
-0.2301374, -0.8696625, -3.690078, 0, 1, 0.3176471, 1,
-0.229149, 0.49529, -1.270034, 0, 1, 0.3215686, 1,
-0.2277846, 0.1303805, -0.8717957, 0, 1, 0.3294118, 1,
-0.2265676, 0.1140013, -0.7809941, 0, 1, 0.3333333, 1,
-0.2261923, -1.055558, -3.069631, 0, 1, 0.3411765, 1,
-0.2259395, -0.8238435, -3.199951, 0, 1, 0.345098, 1,
-0.2191858, 0.1734085, -0.7538025, 0, 1, 0.3529412, 1,
-0.2166355, -0.1094721, -1.58658, 0, 1, 0.3568628, 1,
-0.2101546, -0.2902699, -3.009231, 0, 1, 0.3647059, 1,
-0.2088395, 1.110769, -1.436363, 0, 1, 0.3686275, 1,
-0.2084326, -2.339206, -4.962152, 0, 1, 0.3764706, 1,
-0.2078089, -0.3016337, -3.148072, 0, 1, 0.3803922, 1,
-0.2057681, 0.4917988, -0.5354161, 0, 1, 0.3882353, 1,
-0.2035195, 0.6763101, -1.713608, 0, 1, 0.3921569, 1,
-0.2031129, -0.8245024, -3.017652, 0, 1, 0.4, 1,
-0.1979395, 0.6286045, 0.3876419, 0, 1, 0.4078431, 1,
-0.1977101, -0.4681626, -3.893932, 0, 1, 0.4117647, 1,
-0.195714, -1.024189, -4.744944, 0, 1, 0.4196078, 1,
-0.1935859, -0.09787665, -3.071662, 0, 1, 0.4235294, 1,
-0.1930578, -0.9364109, -4.115549, 0, 1, 0.4313726, 1,
-0.1926422, -0.2871431, -0.6599075, 0, 1, 0.4352941, 1,
-0.1814573, 2.802141, -1.665339, 0, 1, 0.4431373, 1,
-0.1802574, 1.105563, 1.582561, 0, 1, 0.4470588, 1,
-0.1792456, -1.393188, -2.532783, 0, 1, 0.454902, 1,
-0.1768507, -0.0453231, -1.301427, 0, 1, 0.4588235, 1,
-0.174336, -0.02140466, -0.4232355, 0, 1, 0.4666667, 1,
-0.172538, -0.300027, -0.7816359, 0, 1, 0.4705882, 1,
-0.1706595, 0.3113804, -1.394211, 0, 1, 0.4784314, 1,
-0.1695614, 1.484317, -1.828486, 0, 1, 0.4823529, 1,
-0.1681447, -0.3250252, -2.02561, 0, 1, 0.4901961, 1,
-0.1610043, 1.390735, -0.7568549, 0, 1, 0.4941176, 1,
-0.1590898, -0.8898776, -2.74106, 0, 1, 0.5019608, 1,
-0.1583007, -0.1326452, -1.26678, 0, 1, 0.509804, 1,
-0.1544448, 0.7158722, -1.326177, 0, 1, 0.5137255, 1,
-0.1541218, 0.4248116, -0.4774568, 0, 1, 0.5215687, 1,
-0.1540871, -0.1120911, -2.555237, 0, 1, 0.5254902, 1,
-0.1516285, -0.04993577, -3.036395, 0, 1, 0.5333334, 1,
-0.1499971, -0.4792472, -2.894246, 0, 1, 0.5372549, 1,
-0.1480345, 1.715212, 0.3747848, 0, 1, 0.5450981, 1,
-0.1479676, 1.847855, -0.4651395, 0, 1, 0.5490196, 1,
-0.1468688, 0.8001016, -0.3381756, 0, 1, 0.5568628, 1,
-0.1464808, 0.6635791, 1.325388, 0, 1, 0.5607843, 1,
-0.1450017, 0.373289, -0.06319903, 0, 1, 0.5686275, 1,
-0.1420685, -0.9210387, -2.421073, 0, 1, 0.572549, 1,
-0.1418207, 0.3159654, 1.097436, 0, 1, 0.5803922, 1,
-0.1404751, 0.9614341, 0.808348, 0, 1, 0.5843138, 1,
-0.1364679, -1.29587, -3.453026, 0, 1, 0.5921569, 1,
-0.1363972, -0.04738728, -0.6271673, 0, 1, 0.5960785, 1,
-0.1288548, 0.6908791, -0.1782332, 0, 1, 0.6039216, 1,
-0.1280201, -0.3981175, -3.365322, 0, 1, 0.6117647, 1,
-0.124906, -3.103054, -3.021654, 0, 1, 0.6156863, 1,
-0.1246731, 0.6029899, -0.3393117, 0, 1, 0.6235294, 1,
-0.1215866, 1.136386, -1.078578, 0, 1, 0.627451, 1,
-0.1170956, -0.4677151, -3.122187, 0, 1, 0.6352941, 1,
-0.1128427, -0.35928, -1.193099, 0, 1, 0.6392157, 1,
-0.1118798, -1.765972, -1.930255, 0, 1, 0.6470588, 1,
-0.110592, 2.264979, -0.4665026, 0, 1, 0.6509804, 1,
-0.1096407, 1.076491, -1.048748, 0, 1, 0.6588235, 1,
-0.1095825, -0.6818411, -4.050169, 0, 1, 0.6627451, 1,
-0.1079985, -1.872778, -3.218214, 0, 1, 0.6705883, 1,
-0.1065086, -1.845422, -2.152575, 0, 1, 0.6745098, 1,
-0.1033028, 0.1423938, -1.074885, 0, 1, 0.682353, 1,
-0.09947345, 0.7373325, -0.6996288, 0, 1, 0.6862745, 1,
-0.09825855, 1.734836, 0.09795596, 0, 1, 0.6941177, 1,
-0.09300769, -0.9988382, -3.31079, 0, 1, 0.7019608, 1,
-0.09278046, -1.212504, -3.101137, 0, 1, 0.7058824, 1,
-0.08955452, -1.706244, -1.509571, 0, 1, 0.7137255, 1,
-0.08555173, -1.325138, -5.014389, 0, 1, 0.7176471, 1,
-0.08248165, -0.7371051, -3.904871, 0, 1, 0.7254902, 1,
-0.07688181, -0.7663558, -3.616839, 0, 1, 0.7294118, 1,
-0.07536081, 0.23146, -1.001382, 0, 1, 0.7372549, 1,
-0.06991051, -0.6518667, -1.959577, 0, 1, 0.7411765, 1,
-0.06662971, -0.7613502, -2.630548, 0, 1, 0.7490196, 1,
-0.06652747, 0.6296315, -1.744654, 0, 1, 0.7529412, 1,
-0.06280912, -0.6717135, -2.883772, 0, 1, 0.7607843, 1,
-0.06014232, -1.094515, -2.293873, 0, 1, 0.7647059, 1,
-0.05067233, -1.620976, -4.165808, 0, 1, 0.772549, 1,
-0.04969759, 0.3857617, -0.4018201, 0, 1, 0.7764706, 1,
-0.04646908, -0.6886289, -2.68062, 0, 1, 0.7843137, 1,
-0.04238449, -0.0624475, -3.181493, 0, 1, 0.7882353, 1,
-0.03889165, -0.4550295, -1.650658, 0, 1, 0.7960784, 1,
-0.03883296, -0.06425798, -2.546149, 0, 1, 0.8039216, 1,
-0.03778552, -1.801776, -2.593185, 0, 1, 0.8078431, 1,
-0.03575829, 0.5279716, -1.02899, 0, 1, 0.8156863, 1,
-0.03116992, -0.8523701, -3.383334, 0, 1, 0.8196079, 1,
-0.02409048, -0.04235042, -2.706805, 0, 1, 0.827451, 1,
-0.02318195, 0.7678354, -0.7538671, 0, 1, 0.8313726, 1,
-0.02166423, -1.075456, -2.270194, 0, 1, 0.8392157, 1,
-0.01123391, 2.123434, 2.250847, 0, 1, 0.8431373, 1,
-0.006832554, -0.4599791, -3.615788, 0, 1, 0.8509804, 1,
-0.004015109, -0.5014383, -2.985727, 0, 1, 0.854902, 1,
-0.0001994013, 2.585462, 0.9766251, 0, 1, 0.8627451, 1,
0.0005265063, -1.323452, 2.403675, 0, 1, 0.8666667, 1,
0.00476067, -0.1554506, 2.990315, 0, 1, 0.8745098, 1,
0.007603703, -0.7322564, 4.846857, 0, 1, 0.8784314, 1,
0.01054881, 1.037832, 1.739745, 0, 1, 0.8862745, 1,
0.01413769, 0.6550329, -0.9526793, 0, 1, 0.8901961, 1,
0.01434314, 0.7948205, -0.8699074, 0, 1, 0.8980392, 1,
0.01502918, 0.5401541, 0.1131338, 0, 1, 0.9058824, 1,
0.01599692, -0.7373095, 2.168287, 0, 1, 0.9098039, 1,
0.01787374, -1.161888, 3.155905, 0, 1, 0.9176471, 1,
0.02551701, 1.163266, -0.2421511, 0, 1, 0.9215686, 1,
0.02845562, 0.08529493, -1.184857, 0, 1, 0.9294118, 1,
0.03162307, -0.818205, 4.5239, 0, 1, 0.9333333, 1,
0.03166082, -0.4980204, 3.069902, 0, 1, 0.9411765, 1,
0.03447392, -1.432685, 4.13122, 0, 1, 0.945098, 1,
0.03517836, 0.9099944, 0.4796954, 0, 1, 0.9529412, 1,
0.03687729, 0.2106188, -0.7999584, 0, 1, 0.9568627, 1,
0.03730071, 0.1757807, -0.2369829, 0, 1, 0.9647059, 1,
0.04004241, 1.622621, -0.6260817, 0, 1, 0.9686275, 1,
0.05064447, 0.8076452, -0.7971622, 0, 1, 0.9764706, 1,
0.05344706, 0.5931823, -0.4848014, 0, 1, 0.9803922, 1,
0.05429938, 0.8584336, 0.3652598, 0, 1, 0.9882353, 1,
0.0584933, 0.5391783, 2.694007, 0, 1, 0.9921569, 1,
0.06077602, -1.240468, 4.785821, 0, 1, 1, 1,
0.06358153, 0.2270971, -1.122249, 0, 0.9921569, 1, 1,
0.06728025, 1.875158, -0.2540399, 0, 0.9882353, 1, 1,
0.06847373, -0.2922919, 2.565242, 0, 0.9803922, 1, 1,
0.06906026, 0.4741674, 0.8385314, 0, 0.9764706, 1, 1,
0.07139105, -0.3569322, 4.369547, 0, 0.9686275, 1, 1,
0.07171763, -0.423221, 2.665363, 0, 0.9647059, 1, 1,
0.07244704, 0.3678889, -0.4848199, 0, 0.9568627, 1, 1,
0.07417482, 1.471638, -0.3544149, 0, 0.9529412, 1, 1,
0.07515511, 1.316196, 0.0645542, 0, 0.945098, 1, 1,
0.08300027, 0.6907285, 1.049707, 0, 0.9411765, 1, 1,
0.08585361, 1.452707, -1.298874, 0, 0.9333333, 1, 1,
0.09506652, -0.2827011, 2.32363, 0, 0.9294118, 1, 1,
0.0954375, 2.968876, 1.731602, 0, 0.9215686, 1, 1,
0.09769595, -1.233684, 3.83987, 0, 0.9176471, 1, 1,
0.09969757, -1.125858, 3.891649, 0, 0.9098039, 1, 1,
0.1011595, 0.01286688, 1.265369, 0, 0.9058824, 1, 1,
0.1054794, -0.4031911, 4.12552, 0, 0.8980392, 1, 1,
0.106073, 0.7148396, 1.229316, 0, 0.8901961, 1, 1,
0.1062258, 1.621917, -1.910463, 0, 0.8862745, 1, 1,
0.1078465, -0.7362491, 0.9822804, 0, 0.8784314, 1, 1,
0.1081206, -0.2240331, 1.918086, 0, 0.8745098, 1, 1,
0.1100455, 0.1628224, 1.755971, 0, 0.8666667, 1, 1,
0.1107809, 0.8289211, 0.3085573, 0, 0.8627451, 1, 1,
0.111761, -0.4352697, 2.276507, 0, 0.854902, 1, 1,
0.1125526, 0.3921404, 1.783494, 0, 0.8509804, 1, 1,
0.1140974, -0.583628, 3.792828, 0, 0.8431373, 1, 1,
0.1163667, 0.376918, 0.6185648, 0, 0.8392157, 1, 1,
0.1223526, -2.118859, 3.09042, 0, 0.8313726, 1, 1,
0.1242318, 0.6576849, 1.341837, 0, 0.827451, 1, 1,
0.1245125, -2.309478, 2.442267, 0, 0.8196079, 1, 1,
0.126803, -0.002302215, 1.148322, 0, 0.8156863, 1, 1,
0.1270105, -0.6300143, 3.036069, 0, 0.8078431, 1, 1,
0.1348979, -1.269621, 3.372335, 0, 0.8039216, 1, 1,
0.1355734, -0.1583638, 3.562825, 0, 0.7960784, 1, 1,
0.1362458, 0.4169819, 0.8453386, 0, 0.7882353, 1, 1,
0.1372711, -1.148307, 2.283622, 0, 0.7843137, 1, 1,
0.139235, -0.07487135, 1.624086, 0, 0.7764706, 1, 1,
0.143634, 0.6033936, 0.3655934, 0, 0.772549, 1, 1,
0.1441679, 1.202632, -0.5170815, 0, 0.7647059, 1, 1,
0.1476872, -2.359674, 1.813243, 0, 0.7607843, 1, 1,
0.1489454, 0.7598725, 1.195459, 0, 0.7529412, 1, 1,
0.1561937, -0.9075156, 2.206984, 0, 0.7490196, 1, 1,
0.1588603, -0.9410576, 3.341715, 0, 0.7411765, 1, 1,
0.1590518, -0.01430121, 1.426913, 0, 0.7372549, 1, 1,
0.1601517, -0.3799296, 1.602821, 0, 0.7294118, 1, 1,
0.1637822, 2.168752, -0.005956638, 0, 0.7254902, 1, 1,
0.1642648, -0.0488482, 1.157063, 0, 0.7176471, 1, 1,
0.1644069, 0.4377111, -0.04774474, 0, 0.7137255, 1, 1,
0.1651946, -1.111794, 2.346894, 0, 0.7058824, 1, 1,
0.165695, -0.7829068, 2.806803, 0, 0.6980392, 1, 1,
0.1662409, 2.741629, -0.7345462, 0, 0.6941177, 1, 1,
0.1670811, 0.2012839, 0.6531895, 0, 0.6862745, 1, 1,
0.1689334, -0.1694079, 3.197231, 0, 0.682353, 1, 1,
0.1805953, 0.2062802, 1.249192, 0, 0.6745098, 1, 1,
0.184358, 1.643203, -0.7766213, 0, 0.6705883, 1, 1,
0.1843716, -0.2564905, 2.087261, 0, 0.6627451, 1, 1,
0.1889991, -1.027444, 3.664128, 0, 0.6588235, 1, 1,
0.1969141, -1.924218, 3.226069, 0, 0.6509804, 1, 1,
0.2016353, -0.2986873, 3.091794, 0, 0.6470588, 1, 1,
0.203652, -0.8475897, 2.429586, 0, 0.6392157, 1, 1,
0.2070942, -1.622368, 3.244169, 0, 0.6352941, 1, 1,
0.2163959, -0.540241, 4.874577, 0, 0.627451, 1, 1,
0.2210846, -0.2546907, 1.553581, 0, 0.6235294, 1, 1,
0.2316669, 0.136419, -0.1091427, 0, 0.6156863, 1, 1,
0.2351251, -0.1270781, 2.154008, 0, 0.6117647, 1, 1,
0.2400513, 1.173397, -0.3407962, 0, 0.6039216, 1, 1,
0.2420286, 0.06930622, 0.5096938, 0, 0.5960785, 1, 1,
0.2429509, 0.3243439, 1.350832, 0, 0.5921569, 1, 1,
0.2444372, -0.7786583, 3.328165, 0, 0.5843138, 1, 1,
0.2480763, 0.284265, 2.440289, 0, 0.5803922, 1, 1,
0.2502601, -0.1071825, 1.075582, 0, 0.572549, 1, 1,
0.2502981, 0.6758757, -0.6905794, 0, 0.5686275, 1, 1,
0.2508351, 0.9074847, 0.8980421, 0, 0.5607843, 1, 1,
0.2509888, 1.171135, 1.80095, 0, 0.5568628, 1, 1,
0.2510925, -0.1326271, 1.996518, 0, 0.5490196, 1, 1,
0.2552206, 0.7362261, 0.5227435, 0, 0.5450981, 1, 1,
0.2569617, -0.6691692, 2.448835, 0, 0.5372549, 1, 1,
0.2570026, 1.364233, -0.6675788, 0, 0.5333334, 1, 1,
0.2673826, 1.167445, -0.4588944, 0, 0.5254902, 1, 1,
0.2691172, 0.06873702, 3.118075, 0, 0.5215687, 1, 1,
0.2700702, 0.09174005, 0.3664632, 0, 0.5137255, 1, 1,
0.2702127, -1.65696, 2.921789, 0, 0.509804, 1, 1,
0.2715791, -1.61177, 3.337354, 0, 0.5019608, 1, 1,
0.2759844, 1.844054, 0.7841979, 0, 0.4941176, 1, 1,
0.2773055, -0.6300793, 3.029122, 0, 0.4901961, 1, 1,
0.2822336, -0.9172832, 2.539075, 0, 0.4823529, 1, 1,
0.2823139, 1.797268, 1.286114, 0, 0.4784314, 1, 1,
0.2884949, -0.5177041, 2.086074, 0, 0.4705882, 1, 1,
0.2935167, 0.6301637, 0.7012304, 0, 0.4666667, 1, 1,
0.2939333, -0.8720524, 2.25222, 0, 0.4588235, 1, 1,
0.2943044, 0.3998917, -0.1453873, 0, 0.454902, 1, 1,
0.2949201, -0.1933155, 2.540196, 0, 0.4470588, 1, 1,
0.2962741, 0.3555888, -0.3399089, 0, 0.4431373, 1, 1,
0.299722, 0.3438103, 0.02914855, 0, 0.4352941, 1, 1,
0.3009445, -0.3616817, 3.284834, 0, 0.4313726, 1, 1,
0.3019308, 0.7855309, -0.0518385, 0, 0.4235294, 1, 1,
0.3034855, -1.482447, 3.476883, 0, 0.4196078, 1, 1,
0.3055158, -2.15473, 2.466719, 0, 0.4117647, 1, 1,
0.3061622, 1.47919, 1.496915, 0, 0.4078431, 1, 1,
0.3083638, -0.80063, 3.804162, 0, 0.4, 1, 1,
0.3123201, 0.01530196, 1.726558, 0, 0.3921569, 1, 1,
0.3128981, -0.01667518, 0.07465667, 0, 0.3882353, 1, 1,
0.3142462, -0.6685695, 1.792642, 0, 0.3803922, 1, 1,
0.3211269, 1.439261, 1.242043, 0, 0.3764706, 1, 1,
0.3242539, -0.1036758, 0.8221262, 0, 0.3686275, 1, 1,
0.3255517, 0.3426279, 0.9692989, 0, 0.3647059, 1, 1,
0.3275675, -1.311965, 2.131833, 0, 0.3568628, 1, 1,
0.3290321, 0.3691586, -0.7340347, 0, 0.3529412, 1, 1,
0.3291222, -1.209691, 2.369322, 0, 0.345098, 1, 1,
0.331506, -0.1888111, 3.70104, 0, 0.3411765, 1, 1,
0.3344411, 0.2335868, 1.502174, 0, 0.3333333, 1, 1,
0.3374169, 0.0146768, 1.130528, 0, 0.3294118, 1, 1,
0.3395738, 0.2989775, 0.9349872, 0, 0.3215686, 1, 1,
0.3409796, -1.254705, 4.027387, 0, 0.3176471, 1, 1,
0.3430991, 0.8702999, 0.5858124, 0, 0.3098039, 1, 1,
0.3461496, 0.794425, -1.249001, 0, 0.3058824, 1, 1,
0.349557, 0.1162876, 1.156402, 0, 0.2980392, 1, 1,
0.3499903, 1.246869, 0.3059798, 0, 0.2901961, 1, 1,
0.3526941, 0.4395421, -1.001957, 0, 0.2862745, 1, 1,
0.3528813, -0.5537565, 3.948021, 0, 0.2784314, 1, 1,
0.353864, -0.8919098, 3.63993, 0, 0.2745098, 1, 1,
0.3576289, -0.01946676, 1.841324, 0, 0.2666667, 1, 1,
0.3664448, -0.5719869, 3.794657, 0, 0.2627451, 1, 1,
0.3754566, -1.089643, 1.328862, 0, 0.254902, 1, 1,
0.3847331, -0.9637254, 3.052584, 0, 0.2509804, 1, 1,
0.3865695, 0.07921495, 1.967949, 0, 0.2431373, 1, 1,
0.3880633, -0.8141715, 2.854423, 0, 0.2392157, 1, 1,
0.388937, -1.073501, 3.282846, 0, 0.2313726, 1, 1,
0.388953, -1.066805, 1.978559, 0, 0.227451, 1, 1,
0.3961604, 1.209508, 1.396419, 0, 0.2196078, 1, 1,
0.39814, -1.274153, 3.116286, 0, 0.2156863, 1, 1,
0.4017872, 1.050737, -0.1558628, 0, 0.2078431, 1, 1,
0.4027286, -0.4033473, 1.653445, 0, 0.2039216, 1, 1,
0.4101441, 0.1160907, 0.4355709, 0, 0.1960784, 1, 1,
0.4102672, 0.6114712, 0.7768534, 0, 0.1882353, 1, 1,
0.4110945, 1.63913, 0.2862932, 0, 0.1843137, 1, 1,
0.4127067, -0.8214055, 3.708691, 0, 0.1764706, 1, 1,
0.4128828, -0.3666119, 3.08924, 0, 0.172549, 1, 1,
0.4148459, -0.2220531, 0.2114281, 0, 0.1647059, 1, 1,
0.4154653, -0.3278415, 2.614882, 0, 0.1607843, 1, 1,
0.4169743, -0.3107076, 4.065527, 0, 0.1529412, 1, 1,
0.4174695, 0.8973291, -0.2408539, 0, 0.1490196, 1, 1,
0.4200155, 1.335456, 2.527453, 0, 0.1411765, 1, 1,
0.420035, 1.555443, -0.3014414, 0, 0.1372549, 1, 1,
0.4252671, 1.878781, 0.8584208, 0, 0.1294118, 1, 1,
0.4252887, 0.2680196, 0.8381284, 0, 0.1254902, 1, 1,
0.4263044, -1.611901, 4.567569, 0, 0.1176471, 1, 1,
0.4284042, -1.842898, 2.363405, 0, 0.1137255, 1, 1,
0.4289978, -0.08953856, 2.466367, 0, 0.1058824, 1, 1,
0.4362218, -2.513236, 3.225178, 0, 0.09803922, 1, 1,
0.439804, -1.057793, 2.9519, 0, 0.09411765, 1, 1,
0.4410224, 2.002278, -0.2412895, 0, 0.08627451, 1, 1,
0.4433621, 1.120733, -0.24407, 0, 0.08235294, 1, 1,
0.4488765, 0.9448034, -0.8371574, 0, 0.07450981, 1, 1,
0.4491145, 1.851771, 0.9496246, 0, 0.07058824, 1, 1,
0.4496316, -0.8558425, 3.339665, 0, 0.0627451, 1, 1,
0.4498002, -0.4618188, 1.833554, 0, 0.05882353, 1, 1,
0.4522624, 0.3024428, 2.129121, 0, 0.05098039, 1, 1,
0.4529688, 0.6190413, 1.182549, 0, 0.04705882, 1, 1,
0.461399, 0.4272839, 0.5117437, 0, 0.03921569, 1, 1,
0.4645073, -0.945758, 2.586694, 0, 0.03529412, 1, 1,
0.4689902, -0.7400266, 4.364681, 0, 0.02745098, 1, 1,
0.4700327, 1.315485, 2.434586, 0, 0.02352941, 1, 1,
0.4711543, -1.155849, 3.160617, 0, 0.01568628, 1, 1,
0.4754004, 0.1916314, 1.823869, 0, 0.01176471, 1, 1,
0.4784627, 0.6240127, 2.165515, 0, 0.003921569, 1, 1,
0.4816513, -0.8099926, 3.498963, 0.003921569, 0, 1, 1,
0.4873766, -0.5281196, 1.829986, 0.007843138, 0, 1, 1,
0.4877724, -0.9344819, 3.636069, 0.01568628, 0, 1, 1,
0.4934222, 1.5516, 2.480739, 0.01960784, 0, 1, 1,
0.4962772, 0.5610372, 0.6945561, 0.02745098, 0, 1, 1,
0.5044221, -0.8483464, 2.830822, 0.03137255, 0, 1, 1,
0.5091116, -0.4190835, 2.111656, 0.03921569, 0, 1, 1,
0.5096141, -1.42947, 3.289033, 0.04313726, 0, 1, 1,
0.513048, 1.295954, -1.163978, 0.05098039, 0, 1, 1,
0.5139909, 0.03534553, 2.673858, 0.05490196, 0, 1, 1,
0.5140907, 0.2637731, 0.6073568, 0.0627451, 0, 1, 1,
0.5155987, -0.6867103, 4.906585, 0.06666667, 0, 1, 1,
0.5184839, -1.093437, 2.578708, 0.07450981, 0, 1, 1,
0.5187256, 1.54683, 1.352002, 0.07843138, 0, 1, 1,
0.5201063, 1.263201, -0.075556, 0.08627451, 0, 1, 1,
0.5254232, -1.632897, 3.272434, 0.09019608, 0, 1, 1,
0.5256123, 1.95508, -1.230855, 0.09803922, 0, 1, 1,
0.5277467, 0.3365693, 1.686063, 0.1058824, 0, 1, 1,
0.5294666, -0.4454662, 1.636399, 0.1098039, 0, 1, 1,
0.5309987, -0.5636159, 2.936953, 0.1176471, 0, 1, 1,
0.5340168, 3.056583, 1.647872, 0.1215686, 0, 1, 1,
0.5341696, 0.9476817, 1.407472, 0.1294118, 0, 1, 1,
0.5348051, -1.088036, 3.770831, 0.1333333, 0, 1, 1,
0.5363544, 0.8380206, -0.004211662, 0.1411765, 0, 1, 1,
0.5464577, -1.474805, 0.7948418, 0.145098, 0, 1, 1,
0.5489287, -1.736048, 2.381581, 0.1529412, 0, 1, 1,
0.5507838, 0.9077958, -1.806042, 0.1568628, 0, 1, 1,
0.5563814, 0.07506564, 1.169686, 0.1647059, 0, 1, 1,
0.5622898, 1.245878, 0.2469298, 0.1686275, 0, 1, 1,
0.5675406, -0.1583433, 0.6513997, 0.1764706, 0, 1, 1,
0.5727658, -0.925622, 2.484207, 0.1803922, 0, 1, 1,
0.5752699, 1.398732, 1.025742, 0.1882353, 0, 1, 1,
0.577427, -0.9590595, 2.659, 0.1921569, 0, 1, 1,
0.5806833, 0.2472054, 2.049891, 0.2, 0, 1, 1,
0.5816787, 2.394877, -0.3122811, 0.2078431, 0, 1, 1,
0.5825844, 0.04358111, 2.350113, 0.2117647, 0, 1, 1,
0.5874971, -0.6214207, 0.4636246, 0.2196078, 0, 1, 1,
0.5892644, 2.046108, 3.2196, 0.2235294, 0, 1, 1,
0.5929156, -0.7238317, 3.368476, 0.2313726, 0, 1, 1,
0.5942772, -0.4313979, 1.633583, 0.2352941, 0, 1, 1,
0.6011353, 1.549218, -1.513078, 0.2431373, 0, 1, 1,
0.6018047, 0.7534015, 0.5717741, 0.2470588, 0, 1, 1,
0.6045413, 0.08312846, 0.6701202, 0.254902, 0, 1, 1,
0.6084419, 0.02749999, 1.590349, 0.2588235, 0, 1, 1,
0.6085724, 0.2309188, -0.5845638, 0.2666667, 0, 1, 1,
0.6086175, -0.7502199, 3.48762, 0.2705882, 0, 1, 1,
0.6109787, -0.7669955, 1.749661, 0.2784314, 0, 1, 1,
0.6120293, -1.726528, 2.300728, 0.282353, 0, 1, 1,
0.6129603, -0.8403299, 1.284464, 0.2901961, 0, 1, 1,
0.6172666, 1.058427, 0.3880561, 0.2941177, 0, 1, 1,
0.6189361, 1.666668, 0.3167116, 0.3019608, 0, 1, 1,
0.6202224, -1.279671, 2.747807, 0.3098039, 0, 1, 1,
0.6272087, -0.2918329, 0.9095192, 0.3137255, 0, 1, 1,
0.6378254, -0.5252944, 1.465074, 0.3215686, 0, 1, 1,
0.6412998, -0.530651, 4.951677, 0.3254902, 0, 1, 1,
0.6518577, 2.024315, -0.8261766, 0.3333333, 0, 1, 1,
0.6528141, -0.5746466, 2.393785, 0.3372549, 0, 1, 1,
0.6568954, -0.1115802, 1.228818, 0.345098, 0, 1, 1,
0.6569372, 0.2223089, 1.703535, 0.3490196, 0, 1, 1,
0.658223, -1.347332, 3.300675, 0.3568628, 0, 1, 1,
0.658264, -0.6901369, 1.970987, 0.3607843, 0, 1, 1,
0.6591872, -0.162669, 2.071955, 0.3686275, 0, 1, 1,
0.6621164, 0.6386918, 0.3631721, 0.372549, 0, 1, 1,
0.6666968, -0.9450082, 2.162437, 0.3803922, 0, 1, 1,
0.6730233, 2.054092, 0.6929367, 0.3843137, 0, 1, 1,
0.674917, -1.034858, 2.73948, 0.3921569, 0, 1, 1,
0.6761392, 0.940569, 0.6414754, 0.3960784, 0, 1, 1,
0.6764184, 0.6318317, 1.463386, 0.4039216, 0, 1, 1,
0.6798744, -0.6559317, 1.931948, 0.4117647, 0, 1, 1,
0.6845536, -0.4772374, 0.5845251, 0.4156863, 0, 1, 1,
0.6869192, 0.6373394, 0.6707867, 0.4235294, 0, 1, 1,
0.6874465, -1.711846, 2.265718, 0.427451, 0, 1, 1,
0.6884635, -0.5380692, 0.9293296, 0.4352941, 0, 1, 1,
0.6947448, 0.3151729, 2.928068, 0.4392157, 0, 1, 1,
0.7022326, -0.5364625, 2.519244, 0.4470588, 0, 1, 1,
0.7045859, 0.1359237, 1.255892, 0.4509804, 0, 1, 1,
0.7106592, 0.8024654, 2.395025, 0.4588235, 0, 1, 1,
0.7237806, -0.3706025, 3.294394, 0.4627451, 0, 1, 1,
0.7327553, -0.1640397, 2.118995, 0.4705882, 0, 1, 1,
0.7329267, -0.5801142, 2.13626, 0.4745098, 0, 1, 1,
0.7347084, 0.9081483, 1.563379, 0.4823529, 0, 1, 1,
0.7399113, -1.251838, 3.36099, 0.4862745, 0, 1, 1,
0.7404599, -0.1501118, 0.5896409, 0.4941176, 0, 1, 1,
0.7413946, -0.7247669, 3.121496, 0.5019608, 0, 1, 1,
0.7416269, -0.03198509, 0.7735363, 0.5058824, 0, 1, 1,
0.7418576, -0.2691717, 2.498791, 0.5137255, 0, 1, 1,
0.7421757, -0.6991162, 2.680627, 0.5176471, 0, 1, 1,
0.7470185, -0.7379984, 2.744049, 0.5254902, 0, 1, 1,
0.7507169, 0.3099381, 1.076337, 0.5294118, 0, 1, 1,
0.7512483, -0.1372444, -0.8294502, 0.5372549, 0, 1, 1,
0.755137, 0.495164, -0.2266762, 0.5411765, 0, 1, 1,
0.7567264, 0.7768811, -1.489914, 0.5490196, 0, 1, 1,
0.7597153, -1.14448, 2.616009, 0.5529412, 0, 1, 1,
0.7624606, 0.2610981, 1.794787, 0.5607843, 0, 1, 1,
0.767473, -0.5184137, 2.524462, 0.5647059, 0, 1, 1,
0.7776563, -0.2279381, 0.2006682, 0.572549, 0, 1, 1,
0.7777672, 0.3835323, 0.8547294, 0.5764706, 0, 1, 1,
0.780981, 1.12196, 2.997952, 0.5843138, 0, 1, 1,
0.7824691, -0.3644753, 1.667627, 0.5882353, 0, 1, 1,
0.7843631, -0.4018923, 1.941967, 0.5960785, 0, 1, 1,
0.7891418, -0.09248266, 1.488043, 0.6039216, 0, 1, 1,
0.7904693, 0.1207467, 1.25185, 0.6078432, 0, 1, 1,
0.7934668, -0.1043812, 3.225985, 0.6156863, 0, 1, 1,
0.7955832, -1.562377, 1.168007, 0.6196079, 0, 1, 1,
0.7959623, -0.8117698, 2.84693, 0.627451, 0, 1, 1,
0.8038926, -0.4362996, 3.689055, 0.6313726, 0, 1, 1,
0.8069116, -0.4291317, 2.61695, 0.6392157, 0, 1, 1,
0.8160511, -0.6580884, 2.331118, 0.6431373, 0, 1, 1,
0.8197885, -0.153664, 2.508223, 0.6509804, 0, 1, 1,
0.8287789, -0.2177296, 0.6685624, 0.654902, 0, 1, 1,
0.8293283, -1.704535, 2.624345, 0.6627451, 0, 1, 1,
0.8295785, 1.234345, 1.487089, 0.6666667, 0, 1, 1,
0.8327568, 2.023649, 0.6095266, 0.6745098, 0, 1, 1,
0.8369521, 0.2363141, 2.372958, 0.6784314, 0, 1, 1,
0.8382251, 0.4590688, 0.4222172, 0.6862745, 0, 1, 1,
0.8387117, -0.497797, 1.952125, 0.6901961, 0, 1, 1,
0.8469291, -0.09216273, 0.8451562, 0.6980392, 0, 1, 1,
0.8484111, -0.2117686, 3.475168, 0.7058824, 0, 1, 1,
0.8527747, 1.831339, 1.346748, 0.7098039, 0, 1, 1,
0.8568926, -1.199079, 1.166413, 0.7176471, 0, 1, 1,
0.8592295, -0.4609814, 2.983748, 0.7215686, 0, 1, 1,
0.8597529, -0.9306716, 2.471505, 0.7294118, 0, 1, 1,
0.860638, 0.01846533, 1.462058, 0.7333333, 0, 1, 1,
0.8657212, 0.07111915, -0.5008958, 0.7411765, 0, 1, 1,
0.8673723, -0.7546007, 1.599977, 0.7450981, 0, 1, 1,
0.8718024, -0.9171607, 1.518528, 0.7529412, 0, 1, 1,
0.8736071, 0.2867013, 2.395644, 0.7568628, 0, 1, 1,
0.8822543, 0.05716879, 2.466086, 0.7647059, 0, 1, 1,
0.8847948, 0.3529633, 1.446905, 0.7686275, 0, 1, 1,
0.8892182, -1.854994, 1.927568, 0.7764706, 0, 1, 1,
0.8922424, 0.07567398, 0.4147091, 0.7803922, 0, 1, 1,
0.8935046, 0.3867307, 2.233928, 0.7882353, 0, 1, 1,
0.8943455, 0.2524938, 2.312697, 0.7921569, 0, 1, 1,
0.9040285, -1.959502, 2.72607, 0.8, 0, 1, 1,
0.9051286, -1.608969, 2.56478, 0.8078431, 0, 1, 1,
0.9190147, -1.538849, 3.596797, 0.8117647, 0, 1, 1,
0.9222358, 0.9989067, -0.1382217, 0.8196079, 0, 1, 1,
0.9247337, -0.4670218, 1.634602, 0.8235294, 0, 1, 1,
0.9270669, -1.448449, 4.447001, 0.8313726, 0, 1, 1,
0.9284145, -2.152298, 4.472131, 0.8352941, 0, 1, 1,
0.9347218, 1.296526, 0.1698948, 0.8431373, 0, 1, 1,
0.9414526, -0.6034635, 2.432245, 0.8470588, 0, 1, 1,
0.9439173, -0.440563, 1.370814, 0.854902, 0, 1, 1,
0.9446515, 1.161392, -0.5036674, 0.8588235, 0, 1, 1,
0.9456874, 0.6159053, -0.1232252, 0.8666667, 0, 1, 1,
0.9465757, -0.1179593, 3.28131, 0.8705882, 0, 1, 1,
0.9515947, 1.613342, -0.1987802, 0.8784314, 0, 1, 1,
0.954374, -0.7684476, 1.904182, 0.8823529, 0, 1, 1,
0.9642414, -0.5777936, 3.735498, 0.8901961, 0, 1, 1,
0.9683047, 0.6509659, 1.023629, 0.8941177, 0, 1, 1,
0.9800143, 0.6218633, 2.500064, 0.9019608, 0, 1, 1,
0.9857249, 0.9298377, 0.528154, 0.9098039, 0, 1, 1,
0.9920747, -0.495712, 0.96316, 0.9137255, 0, 1, 1,
0.9937887, -0.1400583, 2.259104, 0.9215686, 0, 1, 1,
0.9954464, -0.9715555, 2.691199, 0.9254902, 0, 1, 1,
0.995479, -1.179407, 1.691037, 0.9333333, 0, 1, 1,
1.000696, -0.6787781, 1.99835, 0.9372549, 0, 1, 1,
1.008037, -1.0959, 2.705759, 0.945098, 0, 1, 1,
1.008122, -0.02386062, 1.741882, 0.9490196, 0, 1, 1,
1.008276, 0.9078877, 0.2152138, 0.9568627, 0, 1, 1,
1.011522, -0.4147778, 2.113732, 0.9607843, 0, 1, 1,
1.015053, 0.1289826, 1.970424, 0.9686275, 0, 1, 1,
1.020722, -0.6334574, 1.53541, 0.972549, 0, 1, 1,
1.023131, 1.150941, 0.7915611, 0.9803922, 0, 1, 1,
1.027972, -0.8924831, 3.389109, 0.9843137, 0, 1, 1,
1.031263, -0.6998624, 1.24893, 0.9921569, 0, 1, 1,
1.031433, -0.5041051, 1.083532, 0.9960784, 0, 1, 1,
1.044749, 0.4261905, 1.66596, 1, 0, 0.9960784, 1,
1.051349, -0.6267096, 1.799188, 1, 0, 0.9882353, 1,
1.061921, 0.513994, 0.6034811, 1, 0, 0.9843137, 1,
1.062192, 0.5149052, 2.763453, 1, 0, 0.9764706, 1,
1.066408, -1.194826, 1.515664, 1, 0, 0.972549, 1,
1.066715, -0.03693279, 2.765374, 1, 0, 0.9647059, 1,
1.071616, -0.3535691, 1.663949, 1, 0, 0.9607843, 1,
1.072825, 0.7561797, 0.7797709, 1, 0, 0.9529412, 1,
1.084325, 1.49632, -0.1091281, 1, 0, 0.9490196, 1,
1.086555, -0.69545, 3.702938, 1, 0, 0.9411765, 1,
1.0869, 0.1820006, 1.464167, 1, 0, 0.9372549, 1,
1.087102, -0.8229244, 1.166031, 1, 0, 0.9294118, 1,
1.091253, 0.6643492, -0.3542103, 1, 0, 0.9254902, 1,
1.099729, 0.03788519, 1.574238, 1, 0, 0.9176471, 1,
1.101118, 1.446215, -0.5002878, 1, 0, 0.9137255, 1,
1.105206, -2.157276, 2.764503, 1, 0, 0.9058824, 1,
1.113327, -1.368067, 1.560711, 1, 0, 0.9019608, 1,
1.114038, -1.384555, 3.268969, 1, 0, 0.8941177, 1,
1.121017, 1.76843, 0.4407075, 1, 0, 0.8862745, 1,
1.130824, -0.3524072, 0.724202, 1, 0, 0.8823529, 1,
1.13549, 0.5658128, 1.345306, 1, 0, 0.8745098, 1,
1.137629, -0.1023665, 3.078528, 1, 0, 0.8705882, 1,
1.137744, 0.2796083, 1.785032, 1, 0, 0.8627451, 1,
1.139043, -0.3485465, 3.026704, 1, 0, 0.8588235, 1,
1.156106, 0.4024027, 0.3207393, 1, 0, 0.8509804, 1,
1.162271, -0.3961625, 0.8061157, 1, 0, 0.8470588, 1,
1.16326, -0.2297675, 0.6829774, 1, 0, 0.8392157, 1,
1.170607, 0.7003301, 0.07780766, 1, 0, 0.8352941, 1,
1.172797, 1.92068, 1.371268, 1, 0, 0.827451, 1,
1.176303, 0.6715222, 0.1843292, 1, 0, 0.8235294, 1,
1.193088, -0.7062474, 3.477183, 1, 0, 0.8156863, 1,
1.203418, -0.6057909, 3.754675, 1, 0, 0.8117647, 1,
1.207076, -0.664638, 3.240139, 1, 0, 0.8039216, 1,
1.207216, 0.5755247, 2.903485, 1, 0, 0.7960784, 1,
1.212822, -0.0478698, 1.836837, 1, 0, 0.7921569, 1,
1.214011, 0.8993666, 1.677783, 1, 0, 0.7843137, 1,
1.21709, 0.2889248, 0.8304089, 1, 0, 0.7803922, 1,
1.230425, 0.5847164, 0.8116734, 1, 0, 0.772549, 1,
1.243228, 0.5622861, 3.088916, 1, 0, 0.7686275, 1,
1.253819, 0.7743268, 1.376829, 1, 0, 0.7607843, 1,
1.256163, 1.055866, 1.455668, 1, 0, 0.7568628, 1,
1.257594, -0.03069502, 0.899074, 1, 0, 0.7490196, 1,
1.257967, -0.1227915, 2.409855, 1, 0, 0.7450981, 1,
1.258843, 0.2096899, 2.55285, 1, 0, 0.7372549, 1,
1.261245, -0.6000877, 2.830407, 1, 0, 0.7333333, 1,
1.267325, 1.558674, 0.0007256679, 1, 0, 0.7254902, 1,
1.280052, 0.1455175, 0.07645416, 1, 0, 0.7215686, 1,
1.281452, -1.028421, 2.631637, 1, 0, 0.7137255, 1,
1.290528, -0.4191432, 3.031095, 1, 0, 0.7098039, 1,
1.292443, 0.3736294, 0.8200197, 1, 0, 0.7019608, 1,
1.297886, 0.8777432, 1.034966, 1, 0, 0.6941177, 1,
1.306791, -1.115167, 1.574607, 1, 0, 0.6901961, 1,
1.306844, 0.9354289, 0.7441075, 1, 0, 0.682353, 1,
1.311374, -0.4406413, 0.7243758, 1, 0, 0.6784314, 1,
1.32401, -0.63229, 1.526741, 1, 0, 0.6705883, 1,
1.324837, 0.8203498, 0.2491496, 1, 0, 0.6666667, 1,
1.325785, 0.06351787, 1.611583, 1, 0, 0.6588235, 1,
1.330309, -0.2233077, 2.391576, 1, 0, 0.654902, 1,
1.341507, 0.2085696, 3.50102, 1, 0, 0.6470588, 1,
1.34383, -1.450719, 1.366493, 1, 0, 0.6431373, 1,
1.345215, 0.9889595, -1.036823, 1, 0, 0.6352941, 1,
1.348614, -2.139976, 3.548234, 1, 0, 0.6313726, 1,
1.350245, -1.532879, 2.962933, 1, 0, 0.6235294, 1,
1.356374, -0.1753406, 2.133816, 1, 0, 0.6196079, 1,
1.358265, -1.080875, 3.138082, 1, 0, 0.6117647, 1,
1.361382, -0.7228689, 1.422481, 1, 0, 0.6078432, 1,
1.364642, 0.1442838, 1.43276, 1, 0, 0.6, 1,
1.368147, 0.4521781, 2.510684, 1, 0, 0.5921569, 1,
1.368905, 0.437799, -0.586696, 1, 0, 0.5882353, 1,
1.368966, 0.6413592, 2.529597, 1, 0, 0.5803922, 1,
1.382246, -0.3926394, 1.83063, 1, 0, 0.5764706, 1,
1.386935, 0.01994449, 1.076291, 1, 0, 0.5686275, 1,
1.391086, -1.176585, 2.018922, 1, 0, 0.5647059, 1,
1.393169, -3.240278, 4.430212, 1, 0, 0.5568628, 1,
1.396979, 0.1637275, 0.5698364, 1, 0, 0.5529412, 1,
1.397056, -1.299661, 1.727066, 1, 0, 0.5450981, 1,
1.409108, -0.4416732, -0.3347804, 1, 0, 0.5411765, 1,
1.411909, 1.850573, -1.732452, 1, 0, 0.5333334, 1,
1.418766, 0.308561, -0.1998859, 1, 0, 0.5294118, 1,
1.422476, 0.7162852, 1.445929, 1, 0, 0.5215687, 1,
1.423036, -1.339601, 2.263192, 1, 0, 0.5176471, 1,
1.428058, 1.056626, 2.078245, 1, 0, 0.509804, 1,
1.428579, -1.619207, 1.718118, 1, 0, 0.5058824, 1,
1.429597, -0.7934932, 2.220406, 1, 0, 0.4980392, 1,
1.436244, -0.9164943, 2.836698, 1, 0, 0.4901961, 1,
1.444959, 1.93058, 0.1705893, 1, 0, 0.4862745, 1,
1.451887, 0.4023047, 2.321925, 1, 0, 0.4784314, 1,
1.459592, -1.82354, 2.179535, 1, 0, 0.4745098, 1,
1.465147, 0.3400858, 1.301699, 1, 0, 0.4666667, 1,
1.478702, 0.1582187, -0.2734706, 1, 0, 0.4627451, 1,
1.479354, 0.1976432, 3.161411, 1, 0, 0.454902, 1,
1.483514, 1.675452, 0.7692344, 1, 0, 0.4509804, 1,
1.486523, -1.246227, 3.309181, 1, 0, 0.4431373, 1,
1.494426, -1.202955, 1.868027, 1, 0, 0.4392157, 1,
1.500486, 0.5407686, 1.378447, 1, 0, 0.4313726, 1,
1.515332, 0.8174852, 2.213517, 1, 0, 0.427451, 1,
1.52067, 0.4990022, 0.7003028, 1, 0, 0.4196078, 1,
1.521918, -1.239926, 1.520424, 1, 0, 0.4156863, 1,
1.522101, 0.7083253, 1.194926, 1, 0, 0.4078431, 1,
1.523125, 0.6734342, 0.2789355, 1, 0, 0.4039216, 1,
1.544399, 0.6482788, 2.743715, 1, 0, 0.3960784, 1,
1.557749, -0.4718401, 1.612455, 1, 0, 0.3882353, 1,
1.558574, 0.3078214, 1.172537, 1, 0, 0.3843137, 1,
1.559096, -1.389035, 1.965738, 1, 0, 0.3764706, 1,
1.561234, 0.3496391, 1.971226, 1, 0, 0.372549, 1,
1.566074, -0.6046881, 0.5616509, 1, 0, 0.3647059, 1,
1.570385, 0.8554782, 2.181396, 1, 0, 0.3607843, 1,
1.581755, 0.5587202, 2.411188, 1, 0, 0.3529412, 1,
1.5826, 1.79151, -1.181864, 1, 0, 0.3490196, 1,
1.588605, 0.3440061, 2.196212, 1, 0, 0.3411765, 1,
1.597838, -0.3438762, 1.568782, 1, 0, 0.3372549, 1,
1.637144, -0.8917349, 2.207273, 1, 0, 0.3294118, 1,
1.639284, 0.300711, 2.979146, 1, 0, 0.3254902, 1,
1.665881, 1.90818, 0.6177059, 1, 0, 0.3176471, 1,
1.667964, 0.7153317, 1.37155, 1, 0, 0.3137255, 1,
1.673319, -0.277007, 2.104931, 1, 0, 0.3058824, 1,
1.686198, 0.2314637, 2.578552, 1, 0, 0.2980392, 1,
1.691084, 0.08000001, 1.346583, 1, 0, 0.2941177, 1,
1.692661, 1.752173, 1.154975, 1, 0, 0.2862745, 1,
1.6961, -0.4018896, 1.495934, 1, 0, 0.282353, 1,
1.699405, 0.2274573, 0.06873891, 1, 0, 0.2745098, 1,
1.70378, -0.2623839, 2.626358, 1, 0, 0.2705882, 1,
1.720965, -1.697935, 2.451636, 1, 0, 0.2627451, 1,
1.726343, -2.538295, 2.382751, 1, 0, 0.2588235, 1,
1.756804, -0.3631372, 2.643723, 1, 0, 0.2509804, 1,
1.768361, -1.710691, 1.608846, 1, 0, 0.2470588, 1,
1.802861, -0.8739787, 0.7197844, 1, 0, 0.2392157, 1,
1.806097, 0.2642897, 2.274062, 1, 0, 0.2352941, 1,
1.822901, 1.413381, -0.03580423, 1, 0, 0.227451, 1,
1.830617, -0.8316082, 3.129888, 1, 0, 0.2235294, 1,
1.83611, 0.6043069, 2.216657, 1, 0, 0.2156863, 1,
1.841385, -1.256634, 2.040997, 1, 0, 0.2117647, 1,
1.845604, 0.03861307, 1.521594, 1, 0, 0.2039216, 1,
1.848329, 0.4407365, 1.524484, 1, 0, 0.1960784, 1,
1.852278, -0.4310337, 2.953873, 1, 0, 0.1921569, 1,
1.85491, 1.324893, 0.2857794, 1, 0, 0.1843137, 1,
1.875011, -0.7598186, 4.102852, 1, 0, 0.1803922, 1,
1.875778, -1.504401, 1.115052, 1, 0, 0.172549, 1,
1.879147, -1.915363, 2.687288, 1, 0, 0.1686275, 1,
1.884741, -0.7250757, 2.970236, 1, 0, 0.1607843, 1,
1.91186, 0.09506212, 0.754724, 1, 0, 0.1568628, 1,
1.915607, 0.2521763, 3.238252, 1, 0, 0.1490196, 1,
1.952388, 0.2861531, 1.788109, 1, 0, 0.145098, 1,
1.957516, 0.1042167, 1.142738, 1, 0, 0.1372549, 1,
1.999883, -0.5213023, 1.414472, 1, 0, 0.1333333, 1,
2.011069, 0.6737893, 2.346047, 1, 0, 0.1254902, 1,
2.06575, -1.57714, 2.762687, 1, 0, 0.1215686, 1,
2.070447, 1.052431, -0.14083, 1, 0, 0.1137255, 1,
2.105346, -0.1705203, 2.545123, 1, 0, 0.1098039, 1,
2.120465, -1.324521, 3.104562, 1, 0, 0.1019608, 1,
2.155599, -0.8004382, 2.996704, 1, 0, 0.09411765, 1,
2.156522, -2.141051, 2.964196, 1, 0, 0.09019608, 1,
2.191287, -2.265715, 3.223353, 1, 0, 0.08235294, 1,
2.203488, -1.338019, 3.109748, 1, 0, 0.07843138, 1,
2.237493, -0.8746706, 2.485758, 1, 0, 0.07058824, 1,
2.336078, 0.1505054, 1.212073, 1, 0, 0.06666667, 1,
2.343108, 1.150142, 1.010167, 1, 0, 0.05882353, 1,
2.446697, -1.75459, 1.188615, 1, 0, 0.05490196, 1,
2.489975, -2.294542, 3.429624, 1, 0, 0.04705882, 1,
2.527201, 0.1465188, 1.558031, 1, 0, 0.04313726, 1,
2.618874, -0.4012542, 2.491888, 1, 0, 0.03529412, 1,
2.646546, 1.545235, -0.7911493, 1, 0, 0.03137255, 1,
2.671456, 1.475244, 1.730765, 1, 0, 0.02352941, 1,
2.951016, 1.048837, 0.903783, 1, 0, 0.01960784, 1,
3.069332, 1.272231, -0.0389795, 1, 0, 0.01176471, 1,
3.400704, 0.3421648, 0.7825376, 1, 0, 0.007843138, 1
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
0.02675402, -4.307597, -6.703637, 0, -0.5, 0.5, 0.5,
0.02675402, -4.307597, -6.703637, 1, -0.5, 0.5, 0.5,
0.02675402, -4.307597, -6.703637, 1, 1.5, 0.5, 0.5,
0.02675402, -4.307597, -6.703637, 0, 1.5, 0.5, 0.5
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
-4.490965, -0.09184754, -6.703637, 0, -0.5, 0.5, 0.5,
-4.490965, -0.09184754, -6.703637, 1, -0.5, 0.5, 0.5,
-4.490965, -0.09184754, -6.703637, 1, 1.5, 0.5, 0.5,
-4.490965, -0.09184754, -6.703637, 0, 1.5, 0.5, 0.5
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
-4.490965, -4.307597, -0.03135586, 0, -0.5, 0.5, 0.5,
-4.490965, -4.307597, -0.03135586, 1, -0.5, 0.5, 0.5,
-4.490965, -4.307597, -0.03135586, 1, 1.5, 0.5, 0.5,
-4.490965, -4.307597, -0.03135586, 0, 1.5, 0.5, 0.5
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
-3, -3.334731, -5.16388,
3, -3.334731, -5.16388,
-3, -3.334731, -5.16388,
-3, -3.496876, -5.420506,
-2, -3.334731, -5.16388,
-2, -3.496876, -5.420506,
-1, -3.334731, -5.16388,
-1, -3.496876, -5.420506,
0, -3.334731, -5.16388,
0, -3.496876, -5.420506,
1, -3.334731, -5.16388,
1, -3.496876, -5.420506,
2, -3.334731, -5.16388,
2, -3.496876, -5.420506,
3, -3.334731, -5.16388,
3, -3.496876, -5.420506
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
-3, -3.821164, -5.933759, 0, -0.5, 0.5, 0.5,
-3, -3.821164, -5.933759, 1, -0.5, 0.5, 0.5,
-3, -3.821164, -5.933759, 1, 1.5, 0.5, 0.5,
-3, -3.821164, -5.933759, 0, 1.5, 0.5, 0.5,
-2, -3.821164, -5.933759, 0, -0.5, 0.5, 0.5,
-2, -3.821164, -5.933759, 1, -0.5, 0.5, 0.5,
-2, -3.821164, -5.933759, 1, 1.5, 0.5, 0.5,
-2, -3.821164, -5.933759, 0, 1.5, 0.5, 0.5,
-1, -3.821164, -5.933759, 0, -0.5, 0.5, 0.5,
-1, -3.821164, -5.933759, 1, -0.5, 0.5, 0.5,
-1, -3.821164, -5.933759, 1, 1.5, 0.5, 0.5,
-1, -3.821164, -5.933759, 0, 1.5, 0.5, 0.5,
0, -3.821164, -5.933759, 0, -0.5, 0.5, 0.5,
0, -3.821164, -5.933759, 1, -0.5, 0.5, 0.5,
0, -3.821164, -5.933759, 1, 1.5, 0.5, 0.5,
0, -3.821164, -5.933759, 0, 1.5, 0.5, 0.5,
1, -3.821164, -5.933759, 0, -0.5, 0.5, 0.5,
1, -3.821164, -5.933759, 1, -0.5, 0.5, 0.5,
1, -3.821164, -5.933759, 1, 1.5, 0.5, 0.5,
1, -3.821164, -5.933759, 0, 1.5, 0.5, 0.5,
2, -3.821164, -5.933759, 0, -0.5, 0.5, 0.5,
2, -3.821164, -5.933759, 1, -0.5, 0.5, 0.5,
2, -3.821164, -5.933759, 1, 1.5, 0.5, 0.5,
2, -3.821164, -5.933759, 0, 1.5, 0.5, 0.5,
3, -3.821164, -5.933759, 0, -0.5, 0.5, 0.5,
3, -3.821164, -5.933759, 1, -0.5, 0.5, 0.5,
3, -3.821164, -5.933759, 1, 1.5, 0.5, 0.5,
3, -3.821164, -5.933759, 0, 1.5, 0.5, 0.5
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
-3.448415, -3, -5.16388,
-3.448415, 3, -5.16388,
-3.448415, -3, -5.16388,
-3.622173, -3, -5.420506,
-3.448415, -2, -5.16388,
-3.622173, -2, -5.420506,
-3.448415, -1, -5.16388,
-3.622173, -1, -5.420506,
-3.448415, 0, -5.16388,
-3.622173, 0, -5.420506,
-3.448415, 1, -5.16388,
-3.622173, 1, -5.420506,
-3.448415, 2, -5.16388,
-3.622173, 2, -5.420506,
-3.448415, 3, -5.16388,
-3.622173, 3, -5.420506
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
-3.96969, -3, -5.933759, 0, -0.5, 0.5, 0.5,
-3.96969, -3, -5.933759, 1, -0.5, 0.5, 0.5,
-3.96969, -3, -5.933759, 1, 1.5, 0.5, 0.5,
-3.96969, -3, -5.933759, 0, 1.5, 0.5, 0.5,
-3.96969, -2, -5.933759, 0, -0.5, 0.5, 0.5,
-3.96969, -2, -5.933759, 1, -0.5, 0.5, 0.5,
-3.96969, -2, -5.933759, 1, 1.5, 0.5, 0.5,
-3.96969, -2, -5.933759, 0, 1.5, 0.5, 0.5,
-3.96969, -1, -5.933759, 0, -0.5, 0.5, 0.5,
-3.96969, -1, -5.933759, 1, -0.5, 0.5, 0.5,
-3.96969, -1, -5.933759, 1, 1.5, 0.5, 0.5,
-3.96969, -1, -5.933759, 0, 1.5, 0.5, 0.5,
-3.96969, 0, -5.933759, 0, -0.5, 0.5, 0.5,
-3.96969, 0, -5.933759, 1, -0.5, 0.5, 0.5,
-3.96969, 0, -5.933759, 1, 1.5, 0.5, 0.5,
-3.96969, 0, -5.933759, 0, 1.5, 0.5, 0.5,
-3.96969, 1, -5.933759, 0, -0.5, 0.5, 0.5,
-3.96969, 1, -5.933759, 1, -0.5, 0.5, 0.5,
-3.96969, 1, -5.933759, 1, 1.5, 0.5, 0.5,
-3.96969, 1, -5.933759, 0, 1.5, 0.5, 0.5,
-3.96969, 2, -5.933759, 0, -0.5, 0.5, 0.5,
-3.96969, 2, -5.933759, 1, -0.5, 0.5, 0.5,
-3.96969, 2, -5.933759, 1, 1.5, 0.5, 0.5,
-3.96969, 2, -5.933759, 0, 1.5, 0.5, 0.5,
-3.96969, 3, -5.933759, 0, -0.5, 0.5, 0.5,
-3.96969, 3, -5.933759, 1, -0.5, 0.5, 0.5,
-3.96969, 3, -5.933759, 1, 1.5, 0.5, 0.5,
-3.96969, 3, -5.933759, 0, 1.5, 0.5, 0.5
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
-3.448415, -3.334731, -4,
-3.448415, -3.334731, 4,
-3.448415, -3.334731, -4,
-3.622173, -3.496876, -4,
-3.448415, -3.334731, -2,
-3.622173, -3.496876, -2,
-3.448415, -3.334731, 0,
-3.622173, -3.496876, 0,
-3.448415, -3.334731, 2,
-3.622173, -3.496876, 2,
-3.448415, -3.334731, 4,
-3.622173, -3.496876, 4
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
-3.96969, -3.821164, -4, 0, -0.5, 0.5, 0.5,
-3.96969, -3.821164, -4, 1, -0.5, 0.5, 0.5,
-3.96969, -3.821164, -4, 1, 1.5, 0.5, 0.5,
-3.96969, -3.821164, -4, 0, 1.5, 0.5, 0.5,
-3.96969, -3.821164, -2, 0, -0.5, 0.5, 0.5,
-3.96969, -3.821164, -2, 1, -0.5, 0.5, 0.5,
-3.96969, -3.821164, -2, 1, 1.5, 0.5, 0.5,
-3.96969, -3.821164, -2, 0, 1.5, 0.5, 0.5,
-3.96969, -3.821164, 0, 0, -0.5, 0.5, 0.5,
-3.96969, -3.821164, 0, 1, -0.5, 0.5, 0.5,
-3.96969, -3.821164, 0, 1, 1.5, 0.5, 0.5,
-3.96969, -3.821164, 0, 0, 1.5, 0.5, 0.5,
-3.96969, -3.821164, 2, 0, -0.5, 0.5, 0.5,
-3.96969, -3.821164, 2, 1, -0.5, 0.5, 0.5,
-3.96969, -3.821164, 2, 1, 1.5, 0.5, 0.5,
-3.96969, -3.821164, 2, 0, 1.5, 0.5, 0.5,
-3.96969, -3.821164, 4, 0, -0.5, 0.5, 0.5,
-3.96969, -3.821164, 4, 1, -0.5, 0.5, 0.5,
-3.96969, -3.821164, 4, 1, 1.5, 0.5, 0.5,
-3.96969, -3.821164, 4, 0, 1.5, 0.5, 0.5
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
-3.448415, -3.334731, -5.16388,
-3.448415, 3.151036, -5.16388,
-3.448415, -3.334731, 5.101168,
-3.448415, 3.151036, 5.101168,
-3.448415, -3.334731, -5.16388,
-3.448415, -3.334731, 5.101168,
-3.448415, 3.151036, -5.16388,
-3.448415, 3.151036, 5.101168,
-3.448415, -3.334731, -5.16388,
3.501923, -3.334731, -5.16388,
-3.448415, -3.334731, 5.101168,
3.501923, -3.334731, 5.101168,
-3.448415, 3.151036, -5.16388,
3.501923, 3.151036, -5.16388,
-3.448415, 3.151036, 5.101168,
3.501923, 3.151036, 5.101168,
3.501923, -3.334731, -5.16388,
3.501923, 3.151036, -5.16388,
3.501923, -3.334731, 5.101168,
3.501923, 3.151036, 5.101168,
3.501923, -3.334731, -5.16388,
3.501923, -3.334731, 5.101168,
3.501923, 3.151036, -5.16388,
3.501923, 3.151036, 5.101168
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
var radius = 7.470837;
var distance = 33.2386;
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
mvMatrix.translate( -0.02675402, 0.09184754, 0.03135586 );
mvMatrix.scale( 1.16219, 1.245437, 0.7869048 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.2386);
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
InChI_1S_C12H11Cl2NO<-read.table("InChI_1S_C12H11Cl2NO.xyz")
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
-3.347196, 0.3643729, -0.2693724, 0, 0, 1, 1, 1,
-3.129836, -1.298259, -0.0761336, 1, 0, 0, 1, 1,
-3.015283, -0.8443179, -1.583057, 1, 0, 0, 1, 1,
-2.814006, 0.08529316, -2.268177, 1, 0, 0, 1, 1,
-2.806933, -0.9950124, -1.105067, 1, 0, 0, 1, 1,
-2.702186, -0.8846713, -1.41737, 1, 0, 0, 1, 1,
-2.648976, 0.3850372, -1.971109, 0, 0, 0, 1, 1,
-2.641981, -2.286974, -0.61636, 0, 0, 0, 1, 1,
-2.485685, -0.09288263, -0.9543623, 0, 0, 0, 1, 1,
-2.391163, -0.08860224, -1.530352, 0, 0, 0, 1, 1,
-2.367753, 1.927481, -1.964741, 0, 0, 0, 1, 1,
-2.364887, -1.211159, -0.03713434, 0, 0, 0, 1, 1,
-2.325522, -1.043422, -0.8049427, 0, 0, 0, 1, 1,
-2.298948, 0.1978183, -2.21966, 1, 1, 1, 1, 1,
-2.226565, 0.8726484, -2.603093, 1, 1, 1, 1, 1,
-2.198442, 1.480965, -1.077569, 1, 1, 1, 1, 1,
-2.165872, 0.5643139, -1.863052, 1, 1, 1, 1, 1,
-2.129513, -0.1346225, -1.545555, 1, 1, 1, 1, 1,
-2.080764, 0.1688052, -3.304351, 1, 1, 1, 1, 1,
-2.067114, -2.188084, -0.5549746, 1, 1, 1, 1, 1,
-2.06171, 0.1904583, -2.023879, 1, 1, 1, 1, 1,
-2.060917, 1.82568, -3.326764, 1, 1, 1, 1, 1,
-2.056172, -1.489828, -2.343242, 1, 1, 1, 1, 1,
-2.053732, 0.7143579, 0.3850337, 1, 1, 1, 1, 1,
-2.049119, -0.4892023, -1.686436, 1, 1, 1, 1, 1,
-2.041547, -1.139192, -0.4315671, 1, 1, 1, 1, 1,
-2.038283, 0.9915143, -2.086372, 1, 1, 1, 1, 1,
-2.024635, 1.855028, 0.2713743, 1, 1, 1, 1, 1,
-2.004265, 0.430569, -0.005855301, 0, 0, 1, 1, 1,
-1.965776, -0.7182341, -2.469531, 1, 0, 0, 1, 1,
-1.945382, 1.020797, -0.3078433, 1, 0, 0, 1, 1,
-1.929163, 0.4687897, -0.8732215, 1, 0, 0, 1, 1,
-1.926336, 0.2763894, -1.829745, 1, 0, 0, 1, 1,
-1.915331, -0.4996412, -1.814005, 1, 0, 0, 1, 1,
-1.889342, -0.8613253, -0.9254206, 0, 0, 0, 1, 1,
-1.869546, -0.438946, -0.9981173, 0, 0, 0, 1, 1,
-1.855482, -0.1852998, -0.7663608, 0, 0, 0, 1, 1,
-1.847836, -0.8076923, -0.4018298, 0, 0, 0, 1, 1,
-1.823153, 0.5674196, -1.967896, 0, 0, 0, 1, 1,
-1.807, -1.905701, -2.728874, 0, 0, 0, 1, 1,
-1.798577, 0.5164735, -0.106947, 0, 0, 0, 1, 1,
-1.789504, 0.3427919, -1.608629, 1, 1, 1, 1, 1,
-1.759674, 1.051749, -0.5250006, 1, 1, 1, 1, 1,
-1.735224, -1.573915, -2.488284, 1, 1, 1, 1, 1,
-1.717646, 0.6220555, -2.229764, 1, 1, 1, 1, 1,
-1.712866, 1.256261, -0.4623933, 1, 1, 1, 1, 1,
-1.696763, 0.5344313, -2.025746, 1, 1, 1, 1, 1,
-1.68703, -1.219728, -2.34144, 1, 1, 1, 1, 1,
-1.685271, 1.514026, -0.1581667, 1, 1, 1, 1, 1,
-1.665249, -1.160596, -3.39204, 1, 1, 1, 1, 1,
-1.662404, -0.5556659, -1.738617, 1, 1, 1, 1, 1,
-1.628131, 1.458269, -1.570296, 1, 1, 1, 1, 1,
-1.622548, -2.03325, -2.973096, 1, 1, 1, 1, 1,
-1.61409, -0.1960189, 0.203951, 1, 1, 1, 1, 1,
-1.61068, 0.4700369, -2.453526, 1, 1, 1, 1, 1,
-1.602688, -0.1731889, -4.594697, 1, 1, 1, 1, 1,
-1.567837, 0.2869422, -0.3846389, 0, 0, 1, 1, 1,
-1.55576, -0.8135705, -3.029285, 1, 0, 0, 1, 1,
-1.547513, 0.9889622, -1.397557, 1, 0, 0, 1, 1,
-1.539831, -0.7419609, -4.879289, 1, 0, 0, 1, 1,
-1.537841, -0.3022017, -1.053042, 1, 0, 0, 1, 1,
-1.502614, -1.353434, -3.253334, 1, 0, 0, 1, 1,
-1.497997, 0.2089855, -3.857675, 0, 0, 0, 1, 1,
-1.497084, 0.6080902, -1.825303, 0, 0, 0, 1, 1,
-1.485227, -0.7842284, -3.508929, 0, 0, 0, 1, 1,
-1.46936, -0.3465399, -1.936713, 0, 0, 0, 1, 1,
-1.460491, -0.4317296, -0.978561, 0, 0, 0, 1, 1,
-1.459821, -0.4863264, -1.133909, 0, 0, 0, 1, 1,
-1.458261, -0.8759205, -2.096004, 0, 0, 0, 1, 1,
-1.452957, 0.598911, -0.8096818, 1, 1, 1, 1, 1,
-1.451228, 1.927768, 0.5917, 1, 1, 1, 1, 1,
-1.442569, 0.01856718, -0.6177608, 1, 1, 1, 1, 1,
-1.439413, -1.090309, -4.081945, 1, 1, 1, 1, 1,
-1.434751, 1.38893, 0.08743986, 1, 1, 1, 1, 1,
-1.426322, -0.7087685, -1.278881, 1, 1, 1, 1, 1,
-1.42029, 0.7461015, -0.8092273, 1, 1, 1, 1, 1,
-1.416332, -0.700995, -4.796258, 1, 1, 1, 1, 1,
-1.370314, -0.690132, -1.280967, 1, 1, 1, 1, 1,
-1.369795, -0.1820997, -1.130212, 1, 1, 1, 1, 1,
-1.368994, 1.513472, -0.8173103, 1, 1, 1, 1, 1,
-1.363572, 0.0005422207, -0.9941041, 1, 1, 1, 1, 1,
-1.362483, 0.2326453, -2.94873, 1, 1, 1, 1, 1,
-1.351714, 0.4416357, -1.08275, 1, 1, 1, 1, 1,
-1.346237, -0.9260626, -1.689034, 1, 1, 1, 1, 1,
-1.343882, 0.3127427, -0.9099025, 0, 0, 1, 1, 1,
-1.342122, 0.2781565, -2.327826, 1, 0, 0, 1, 1,
-1.341619, 1.634732, -1.288276, 1, 0, 0, 1, 1,
-1.338908, -0.9251186, -2.268651, 1, 0, 0, 1, 1,
-1.323007, 0.5883134, -1.694302, 1, 0, 0, 1, 1,
-1.321404, -0.6082164, -2.113708, 1, 0, 0, 1, 1,
-1.304619, -0.7341176, -1.53688, 0, 0, 0, 1, 1,
-1.301328, -0.8488395, -3.106127, 0, 0, 0, 1, 1,
-1.295879, -0.50803, -1.589046, 0, 0, 0, 1, 1,
-1.289225, 1.60191, -1.030936, 0, 0, 0, 1, 1,
-1.286841, 0.6609549, -1.711969, 0, 0, 0, 1, 1,
-1.284377, -1.242882, -2.635185, 0, 0, 0, 1, 1,
-1.278279, 2.094974, -1.626652, 0, 0, 0, 1, 1,
-1.273673, 1.264539, -1.75315, 1, 1, 1, 1, 1,
-1.272473, 1.325531, -0.4953807, 1, 1, 1, 1, 1,
-1.256779, -1.151713, -1.674703, 1, 1, 1, 1, 1,
-1.255644, 0.5378492, -0.8500631, 1, 1, 1, 1, 1,
-1.255384, -0.6616445, -2.305119, 1, 1, 1, 1, 1,
-1.235459, -1.368803, -3.601412, 1, 1, 1, 1, 1,
-1.222837, 0.1060934, -1.693925, 1, 1, 1, 1, 1,
-1.219758, -1.322604, -1.65693, 1, 1, 1, 1, 1,
-1.212014, 0.6572659, -0.3133599, 1, 1, 1, 1, 1,
-1.211697, 1.357768, -1.82154, 1, 1, 1, 1, 1,
-1.209644, -0.07890976, -1.923735, 1, 1, 1, 1, 1,
-1.207162, 0.2919229, -1.481127, 1, 1, 1, 1, 1,
-1.206242, 0.9080383, -0.7179875, 1, 1, 1, 1, 1,
-1.195356, -0.8367546, -1.184077, 1, 1, 1, 1, 1,
-1.193388, 0.6059334, -1.494085, 1, 1, 1, 1, 1,
-1.191251, 1.565271, -0.9295946, 0, 0, 1, 1, 1,
-1.184151, -1.265838, -1.771401, 1, 0, 0, 1, 1,
-1.18209, -0.2214309, -3.218394, 1, 0, 0, 1, 1,
-1.181634, 0.7006406, -2.768377, 1, 0, 0, 1, 1,
-1.167381, -0.6712872, -2.60894, 1, 0, 0, 1, 1,
-1.164042, 0.3611121, -0.5832372, 1, 0, 0, 1, 1,
-1.148763, 0.8723847, -1.611656, 0, 0, 0, 1, 1,
-1.146677, -0.4172018, -2.043193, 0, 0, 0, 1, 1,
-1.142664, -0.7042392, -3.14982, 0, 0, 0, 1, 1,
-1.141267, -1.369107, -3.974603, 0, 0, 0, 1, 1,
-1.139865, -0.1462535, 0.1958139, 0, 0, 0, 1, 1,
-1.136045, 1.228175, -2.960506, 0, 0, 0, 1, 1,
-1.12899, 0.04679101, -3.931586, 0, 0, 0, 1, 1,
-1.120254, 1.4232, 0.7069543, 1, 1, 1, 1, 1,
-1.115754, 1.40866, -1.322444, 1, 1, 1, 1, 1,
-1.103903, 0.4057885, -0.0763993, 1, 1, 1, 1, 1,
-1.102353, -0.6056964, -2.702474, 1, 1, 1, 1, 1,
-1.092028, -0.05521137, -1.20979, 1, 1, 1, 1, 1,
-1.089598, -0.488979, -2.193747, 1, 1, 1, 1, 1,
-1.088827, -0.2829343, -1.974894, 1, 1, 1, 1, 1,
-1.087373, -1.350084, -3.038317, 1, 1, 1, 1, 1,
-1.078863, -0.06041694, -0.7221903, 1, 1, 1, 1, 1,
-1.072338, -1.054649, -2.337237, 1, 1, 1, 1, 1,
-1.068171, -1.767042, -2.474622, 1, 1, 1, 1, 1,
-1.065615, -1.781111, -3.715453, 1, 1, 1, 1, 1,
-1.056151, 1.965941, -1.355339, 1, 1, 1, 1, 1,
-1.050599, 1.90485, -0.7453433, 1, 1, 1, 1, 1,
-1.044501, -2.188776, -2.315805, 1, 1, 1, 1, 1,
-1.043846, 0.2858269, -2.10238, 0, 0, 1, 1, 1,
-1.034649, 1.067473, 0.6968783, 1, 0, 0, 1, 1,
-1.025509, -0.4137731, -2.503358, 1, 0, 0, 1, 1,
-1.025202, -0.9316441, -2.494268, 1, 0, 0, 1, 1,
-1.023603, 0.9149162, -1.108478, 1, 0, 0, 1, 1,
-1.023398, 0.08625643, -1.395855, 1, 0, 0, 1, 1,
-1.022273, -0.2179894, -1.24501, 0, 0, 0, 1, 1,
-1.013604, 1.280695, -1.739134, 0, 0, 0, 1, 1,
-1.009042, 1.010443, -1.889578, 0, 0, 0, 1, 1,
-1.006917, 0.6049629, -0.865121, 0, 0, 0, 1, 1,
-1.006441, 0.0592085, -1.230608, 0, 0, 0, 1, 1,
-0.9938885, -1.333681, -4.14354, 0, 0, 0, 1, 1,
-0.9889046, -0.6963498, -1.446387, 0, 0, 0, 1, 1,
-0.9812821, -0.7618405, -2.79184, 1, 1, 1, 1, 1,
-0.9798606, 0.4038255, -1.867424, 1, 1, 1, 1, 1,
-0.9786194, -1.111983, -3.695905, 1, 1, 1, 1, 1,
-0.9772722, 0.2105815, -1.367906, 1, 1, 1, 1, 1,
-0.9609717, 1.452029, -0.01738628, 1, 1, 1, 1, 1,
-0.9576388, -0.06154715, -1.527375, 1, 1, 1, 1, 1,
-0.9547552, -0.3156544, -0.4636522, 1, 1, 1, 1, 1,
-0.9532879, 0.8786248, -1.89173, 1, 1, 1, 1, 1,
-0.9529933, 0.7671713, -0.9426525, 1, 1, 1, 1, 1,
-0.9507511, 1.695846, 0.9847078, 1, 1, 1, 1, 1,
-0.9495893, -1.382045, -2.547126, 1, 1, 1, 1, 1,
-0.9475114, 0.7823367, -0.6789714, 1, 1, 1, 1, 1,
-0.9473994, -1.807333, -2.586145, 1, 1, 1, 1, 1,
-0.945256, 2.110272, -1.4361, 1, 1, 1, 1, 1,
-0.944432, -0.3807662, -1.811889, 1, 1, 1, 1, 1,
-0.9357157, -0.5143183, -3.057055, 0, 0, 1, 1, 1,
-0.9319289, -0.4865793, -2.465066, 1, 0, 0, 1, 1,
-0.9298114, 0.1931938, -0.8911886, 1, 0, 0, 1, 1,
-0.9271237, -1.321282, -1.722082, 1, 0, 0, 1, 1,
-0.9269187, -1.1307, -2.629612, 1, 0, 0, 1, 1,
-0.9169362, 0.05724207, -0.7897857, 1, 0, 0, 1, 1,
-0.9155602, -1.282509, -1.060426, 0, 0, 0, 1, 1,
-0.9140936, 1.300496, -1.080801, 0, 0, 0, 1, 1,
-0.9108515, 0.1772051, 0.2641367, 0, 0, 0, 1, 1,
-0.9103315, -0.6563323, -3.102878, 0, 0, 0, 1, 1,
-0.9010401, -0.6280155, -1.595004, 0, 0, 0, 1, 1,
-0.8982906, 2.308278, -1.514527, 0, 0, 0, 1, 1,
-0.897667, -0.2791858, -3.473652, 0, 0, 0, 1, 1,
-0.8936657, 0.5395851, -0.1348361, 1, 1, 1, 1, 1,
-0.8879011, -0.2424244, -0.4127716, 1, 1, 1, 1, 1,
-0.8878723, 0.7169259, 2.500273, 1, 1, 1, 1, 1,
-0.886337, -0.1136077, -0.9170246, 1, 1, 1, 1, 1,
-0.8844622, 0.3141639, 0.8731801, 1, 1, 1, 1, 1,
-0.8795263, 0.06439868, -2.500202, 1, 1, 1, 1, 1,
-0.8792914, 1.879366, -1.108609, 1, 1, 1, 1, 1,
-0.8770069, 1.252632, 0.7092358, 1, 1, 1, 1, 1,
-0.8765748, -0.03231231, -0.9152067, 1, 1, 1, 1, 1,
-0.8693064, 0.3875466, -1.61093, 1, 1, 1, 1, 1,
-0.8679309, -0.2362454, -2.685374, 1, 1, 1, 1, 1,
-0.8667068, -0.1679358, -2.516912, 1, 1, 1, 1, 1,
-0.8662555, 0.6974881, -0.7299473, 1, 1, 1, 1, 1,
-0.8638659, -0.2793322, -2.646517, 1, 1, 1, 1, 1,
-0.8638034, 0.01496848, -1.591556, 1, 1, 1, 1, 1,
-0.8529724, -0.05738793, -0.4572753, 0, 0, 1, 1, 1,
-0.8525365, 0.2514712, -0.6369469, 1, 0, 0, 1, 1,
-0.850407, 0.568015, -0.5963103, 1, 0, 0, 1, 1,
-0.8494656, -0.3634161, -0.6025673, 1, 0, 0, 1, 1,
-0.8492155, -0.4577601, -1.786439, 1, 0, 0, 1, 1,
-0.8477977, 1.14496, -0.1580797, 1, 0, 0, 1, 1,
-0.8474638, -0.8806598, -0.7393676, 0, 0, 0, 1, 1,
-0.8368585, 0.03411594, -1.925977, 0, 0, 0, 1, 1,
-0.8345949, -1.44309, -2.133255, 0, 0, 0, 1, 1,
-0.8280957, 0.04616579, -2.607118, 0, 0, 0, 1, 1,
-0.827628, -1.02799, -2.196707, 0, 0, 0, 1, 1,
-0.819677, -0.702443, -2.968553, 0, 0, 0, 1, 1,
-0.8161594, -1.182217, -3.421324, 0, 0, 0, 1, 1,
-0.8010903, 0.2659203, -2.427844, 1, 1, 1, 1, 1,
-0.7943326, -0.1968164, -1.267271, 1, 1, 1, 1, 1,
-0.7883914, -0.7623616, 0.06130645, 1, 1, 1, 1, 1,
-0.7806733, -0.3517585, -3.184568, 1, 1, 1, 1, 1,
-0.7757507, 0.3086776, -0.167231, 1, 1, 1, 1, 1,
-0.7735554, 1.845971, 0.03614746, 1, 1, 1, 1, 1,
-0.7727961, -1.249528, -2.054022, 1, 1, 1, 1, 1,
-0.7720353, -0.1773907, -1.138509, 1, 1, 1, 1, 1,
-0.7676998, -0.1973815, -1.10286, 1, 1, 1, 1, 1,
-0.7591292, -0.156538, -0.5926933, 1, 1, 1, 1, 1,
-0.7510074, 0.5264513, -0.3560228, 1, 1, 1, 1, 1,
-0.7493389, 0.5696881, 0.4218246, 1, 1, 1, 1, 1,
-0.7478681, -0.6878891, -2.384382, 1, 1, 1, 1, 1,
-0.7467467, 0.2361977, -3.946624, 1, 1, 1, 1, 1,
-0.7454501, -0.2261156, -2.338576, 1, 1, 1, 1, 1,
-0.7440746, -0.244144, -1.093186, 0, 0, 1, 1, 1,
-0.7271601, -2.15022, -1.892419, 1, 0, 0, 1, 1,
-0.7268324, -2.338676, -3.364423, 1, 0, 0, 1, 1,
-0.717983, -0.5989503, -1.090744, 1, 0, 0, 1, 1,
-0.7152289, -0.4948059, -2.805468, 1, 0, 0, 1, 1,
-0.7106466, 1.772874, -0.1919984, 1, 0, 0, 1, 1,
-0.7062449, -0.5563955, -3.301322, 0, 0, 0, 1, 1,
-0.7043493, 0.6820371, -1.787025, 0, 0, 0, 1, 1,
-0.7022586, 0.748959, 0.4605395, 0, 0, 0, 1, 1,
-0.6979632, 0.5654949, -2.959645, 0, 0, 0, 1, 1,
-0.6974387, -0.6691017, -4.511779, 0, 0, 0, 1, 1,
-0.6932244, 0.7540383, -0.008447574, 0, 0, 0, 1, 1,
-0.6891565, -0.6646094, -1.78148, 0, 0, 0, 1, 1,
-0.6848965, -1.317465, -4.220691, 1, 1, 1, 1, 1,
-0.6816925, -0.6944464, -2.520883, 1, 1, 1, 1, 1,
-0.6816249, -0.05820562, -1.42107, 1, 1, 1, 1, 1,
-0.6771509, -0.02593963, -0.9919685, 1, 1, 1, 1, 1,
-0.6688093, 0.2934709, -2.300142, 1, 1, 1, 1, 1,
-0.6672955, 0.230909, -2.465499, 1, 1, 1, 1, 1,
-0.6566904, 1.347712, -0.6664612, 1, 1, 1, 1, 1,
-0.6562439, 0.5070807, -1.099311, 1, 1, 1, 1, 1,
-0.6550428, 0.06896467, -1.362289, 1, 1, 1, 1, 1,
-0.6505335, -0.3294112, -1.667011, 1, 1, 1, 1, 1,
-0.642576, -0.3317276, -2.924143, 1, 1, 1, 1, 1,
-0.6408865, -1.194608, -2.5857, 1, 1, 1, 1, 1,
-0.6402996, 0.4472318, -0.7690982, 1, 1, 1, 1, 1,
-0.6349319, -1.701891, -4.715957, 1, 1, 1, 1, 1,
-0.6294721, 1.126972, -0.9385679, 1, 1, 1, 1, 1,
-0.628794, 0.2967817, -0.8609804, 0, 0, 1, 1, 1,
-0.6276095, -0.3978855, -1.436618, 1, 0, 0, 1, 1,
-0.6271867, -1.308462, -3.643304, 1, 0, 0, 1, 1,
-0.6269814, -0.05752543, -0.5873789, 1, 0, 0, 1, 1,
-0.6204443, -1.270312, -1.11782, 1, 0, 0, 1, 1,
-0.6157229, 0.2253563, -1.237232, 1, 0, 0, 1, 1,
-0.6143249, 1.245195, -1.757555, 0, 0, 0, 1, 1,
-0.6114544, 0.1498454, -1.019353, 0, 0, 0, 1, 1,
-0.6091568, 1.023991, 0.002453842, 0, 0, 0, 1, 1,
-0.6085926, -0.2767609, 0.6542071, 0, 0, 0, 1, 1,
-0.6076496, 1.443022, -1.853218, 0, 0, 0, 1, 1,
-0.6034688, -0.2421591, -1.549388, 0, 0, 0, 1, 1,
-0.602305, -1.349126, -1.941248, 0, 0, 0, 1, 1,
-0.6011904, -0.7880699, -1.671081, 1, 1, 1, 1, 1,
-0.6008602, -2.484929, -2.674856, 1, 1, 1, 1, 1,
-0.60076, 2.035333, 1.330013, 1, 1, 1, 1, 1,
-0.5942394, 1.335819, -1.071499, 1, 1, 1, 1, 1,
-0.593576, 0.4975816, -2.360924, 1, 1, 1, 1, 1,
-0.5927373, 1.130671, 1.066555, 1, 1, 1, 1, 1,
-0.5912657, -2.414546, -2.165476, 1, 1, 1, 1, 1,
-0.5908479, -0.396744, -2.569437, 1, 1, 1, 1, 1,
-0.5837251, 0.6378739, 0.6852958, 1, 1, 1, 1, 1,
-0.5764459, 1.291982, -1.038378, 1, 1, 1, 1, 1,
-0.576317, 1.011227, -0.453135, 1, 1, 1, 1, 1,
-0.5750737, 0.7459496, -1.579089, 1, 1, 1, 1, 1,
-0.5730273, -0.1261216, -2.404488, 1, 1, 1, 1, 1,
-0.5643947, -0.3757003, -2.335183, 1, 1, 1, 1, 1,
-0.5425668, 1.048113, -2.089, 1, 1, 1, 1, 1,
-0.5416743, -1.335137, -3.066495, 0, 0, 1, 1, 1,
-0.5386299, 0.2582869, 0.2372171, 1, 0, 0, 1, 1,
-0.5377392, 1.300838, 0.6447086, 1, 0, 0, 1, 1,
-0.5369964, -0.5310327, -1.840578, 1, 0, 0, 1, 1,
-0.5147302, -0.6514448, 0.2038988, 1, 0, 0, 1, 1,
-0.5146402, -0.8107831, -1.728379, 1, 0, 0, 1, 1,
-0.5144208, 0.578776, -2.087919, 0, 0, 0, 1, 1,
-0.5114895, -0.4897395, -1.552927, 0, 0, 0, 1, 1,
-0.5082605, -1.004325, -3.222312, 0, 0, 0, 1, 1,
-0.5010595, 0.8262494, -3.114922, 0, 0, 0, 1, 1,
-0.4994463, -0.2509317, -1.489067, 0, 0, 0, 1, 1,
-0.4990824, -0.1356978, -2.74323, 0, 0, 0, 1, 1,
-0.4947689, 0.6709247, -1.520472, 0, 0, 0, 1, 1,
-0.4942584, 0.2066609, -2.002455, 1, 1, 1, 1, 1,
-0.4885218, -1.636002, -2.339527, 1, 1, 1, 1, 1,
-0.4864934, -0.3260591, -3.397061, 1, 1, 1, 1, 1,
-0.4723236, -0.2289705, -1.467807, 1, 1, 1, 1, 1,
-0.4718188, 0.5408128, -0.523073, 1, 1, 1, 1, 1,
-0.4708535, -0.3639125, -3.327631, 1, 1, 1, 1, 1,
-0.4682637, 0.624128, -0.3641427, 1, 1, 1, 1, 1,
-0.4682214, 0.08083241, -0.5236686, 1, 1, 1, 1, 1,
-0.4679902, 0.5096815, -1.660006, 1, 1, 1, 1, 1,
-0.4666664, -1.600725, -3.723357, 1, 1, 1, 1, 1,
-0.4651558, 1.097842, -1.84908, 1, 1, 1, 1, 1,
-0.4609527, 0.6001058, -1.372354, 1, 1, 1, 1, 1,
-0.4575594, -0.6691809, -1.788665, 1, 1, 1, 1, 1,
-0.4554905, -0.4390318, -1.817429, 1, 1, 1, 1, 1,
-0.4504317, 0.2860423, -0.8784197, 1, 1, 1, 1, 1,
-0.4469813, -0.5030801, -3.49875, 0, 0, 1, 1, 1,
-0.4452168, -1.923452, -2.415506, 1, 0, 0, 1, 1,
-0.4434951, 0.3276569, -0.7378197, 1, 0, 0, 1, 1,
-0.4398978, 0.4123553, -0.3073856, 1, 0, 0, 1, 1,
-0.4381573, 0.5255584, -1.198041, 1, 0, 0, 1, 1,
-0.4340465, -0.59389, -3.327595, 1, 0, 0, 1, 1,
-0.4339605, -0.8716902, -1.756494, 0, 0, 0, 1, 1,
-0.4315462, 0.6222572, -1.457784, 0, 0, 0, 1, 1,
-0.4270457, 0.1403509, -1.121043, 0, 0, 0, 1, 1,
-0.4266372, 0.4295806, -0.7164898, 0, 0, 0, 1, 1,
-0.4232761, 0.1810007, -0.3254616, 0, 0, 0, 1, 1,
-0.4143449, -0.4723562, -2.712109, 0, 0, 0, 1, 1,
-0.4138753, -1.251297, -2.553972, 0, 0, 0, 1, 1,
-0.4123317, 0.3309474, -2.317018, 1, 1, 1, 1, 1,
-0.4123239, -0.4770867, -2.259299, 1, 1, 1, 1, 1,
-0.4115998, 0.743741, -0.3742561, 1, 1, 1, 1, 1,
-0.4113532, 0.422355, -1.327034, 1, 1, 1, 1, 1,
-0.4105192, 0.2443333, -2.277586, 1, 1, 1, 1, 1,
-0.4080575, -0.3548985, -3.283109, 1, 1, 1, 1, 1,
-0.407894, 1.425779, 0.9588779, 1, 1, 1, 1, 1,
-0.4049813, -0.8146291, -1.287531, 1, 1, 1, 1, 1,
-0.3978004, -1.745718, -0.4743755, 1, 1, 1, 1, 1,
-0.3967493, -1.008914, -2.256354, 1, 1, 1, 1, 1,
-0.3902555, 0.3048588, -1.396619, 1, 1, 1, 1, 1,
-0.3894496, 0.1574526, -0.5102047, 1, 1, 1, 1, 1,
-0.3889992, -0.03376267, -2.970212, 1, 1, 1, 1, 1,
-0.3879982, 0.2063324, 0.1199079, 1, 1, 1, 1, 1,
-0.384613, 0.375969, -3.347662, 1, 1, 1, 1, 1,
-0.382232, -1.199244, -4.508914, 0, 0, 1, 1, 1,
-0.381071, -0.1070782, -0.7665494, 1, 0, 0, 1, 1,
-0.3762324, 0.6372399, -1.291118, 1, 0, 0, 1, 1,
-0.3737909, 0.3018304, -1.010533, 1, 0, 0, 1, 1,
-0.3712081, -2.230577, -2.918354, 1, 0, 0, 1, 1,
-0.3687664, -1.09044, -1.016799, 1, 0, 0, 1, 1,
-0.3664473, 2.007778, 1.213107, 0, 0, 0, 1, 1,
-0.3623752, 1.250844, -0.8490183, 0, 0, 0, 1, 1,
-0.3609888, -0.748657, -4.144799, 0, 0, 0, 1, 1,
-0.3608787, 1.054512, -2.33876, 0, 0, 0, 1, 1,
-0.359457, -0.1651895, -0.1578633, 0, 0, 0, 1, 1,
-0.3580079, 0.6694623, -1.164997, 0, 0, 0, 1, 1,
-0.3536521, 0.5438193, -2.508946, 0, 0, 0, 1, 1,
-0.3536252, 1.424453, 0.06901346, 1, 1, 1, 1, 1,
-0.3521743, -0.5623431, -3.193372, 1, 1, 1, 1, 1,
-0.3517314, -0.448062, -0.3151746, 1, 1, 1, 1, 1,
-0.3507511, 0.7085433, -1.374409, 1, 1, 1, 1, 1,
-0.3473278, 0.5903942, -0.1979893, 1, 1, 1, 1, 1,
-0.3459873, -0.6187891, -2.033348, 1, 1, 1, 1, 1,
-0.3444163, 0.2097177, -1.376561, 1, 1, 1, 1, 1,
-0.343459, 1.426551, -0.7266396, 1, 1, 1, 1, 1,
-0.3409011, -0.242884, -2.10521, 1, 1, 1, 1, 1,
-0.335505, 1.495711, -1.011563, 1, 1, 1, 1, 1,
-0.3182323, 0.9171798, -0.840722, 1, 1, 1, 1, 1,
-0.3171507, 2.270307, -0.3715906, 1, 1, 1, 1, 1,
-0.3161044, -0.3696091, -2.236998, 1, 1, 1, 1, 1,
-0.3126376, 1.396576, -0.4084386, 1, 1, 1, 1, 1,
-0.3091092, -2.394957, -4.01559, 1, 1, 1, 1, 1,
-0.303905, -0.5137148, -3.292661, 0, 0, 1, 1, 1,
-0.3036406, 0.4029815, -0.8451575, 1, 0, 0, 1, 1,
-0.3034772, 0.6457633, -0.8728577, 1, 0, 0, 1, 1,
-0.301236, 1.283989, 0.7122295, 1, 0, 0, 1, 1,
-0.2986275, -0.2575611, -1.45949, 1, 0, 0, 1, 1,
-0.2945615, -1.280038, -2.053525, 1, 0, 0, 1, 1,
-0.2901909, 0.7732415, -0.7330356, 0, 0, 0, 1, 1,
-0.2802756, -0.2454084, -2.121111, 0, 0, 0, 1, 1,
-0.2753451, -1.287076, -2.412669, 0, 0, 0, 1, 1,
-0.2736264, -1.310157, -3.965818, 0, 0, 0, 1, 1,
-0.2657478, -0.1815713, -1.963724, 0, 0, 0, 1, 1,
-0.2655605, 0.248649, 0.1485021, 0, 0, 0, 1, 1,
-0.260961, -0.05055185, -1.77604, 0, 0, 0, 1, 1,
-0.2560947, 0.300276, 0.2670153, 1, 1, 1, 1, 1,
-0.251589, -0.1297201, -3.044788, 1, 1, 1, 1, 1,
-0.2492391, 1.991147, -0.374943, 1, 1, 1, 1, 1,
-0.2463603, -0.2077694, -1.095519, 1, 1, 1, 1, 1,
-0.2439017, -0.2282001, -1.061021, 1, 1, 1, 1, 1,
-0.2437281, 0.7615731, 0.1156425, 1, 1, 1, 1, 1,
-0.2371783, 0.6104343, -1.299481, 1, 1, 1, 1, 1,
-0.2359406, 0.2319197, -2.055048, 1, 1, 1, 1, 1,
-0.2301555, -0.5900592, -2.219493, 1, 1, 1, 1, 1,
-0.2301374, -0.8696625, -3.690078, 1, 1, 1, 1, 1,
-0.229149, 0.49529, -1.270034, 1, 1, 1, 1, 1,
-0.2277846, 0.1303805, -0.8717957, 1, 1, 1, 1, 1,
-0.2265676, 0.1140013, -0.7809941, 1, 1, 1, 1, 1,
-0.2261923, -1.055558, -3.069631, 1, 1, 1, 1, 1,
-0.2259395, -0.8238435, -3.199951, 1, 1, 1, 1, 1,
-0.2191858, 0.1734085, -0.7538025, 0, 0, 1, 1, 1,
-0.2166355, -0.1094721, -1.58658, 1, 0, 0, 1, 1,
-0.2101546, -0.2902699, -3.009231, 1, 0, 0, 1, 1,
-0.2088395, 1.110769, -1.436363, 1, 0, 0, 1, 1,
-0.2084326, -2.339206, -4.962152, 1, 0, 0, 1, 1,
-0.2078089, -0.3016337, -3.148072, 1, 0, 0, 1, 1,
-0.2057681, 0.4917988, -0.5354161, 0, 0, 0, 1, 1,
-0.2035195, 0.6763101, -1.713608, 0, 0, 0, 1, 1,
-0.2031129, -0.8245024, -3.017652, 0, 0, 0, 1, 1,
-0.1979395, 0.6286045, 0.3876419, 0, 0, 0, 1, 1,
-0.1977101, -0.4681626, -3.893932, 0, 0, 0, 1, 1,
-0.195714, -1.024189, -4.744944, 0, 0, 0, 1, 1,
-0.1935859, -0.09787665, -3.071662, 0, 0, 0, 1, 1,
-0.1930578, -0.9364109, -4.115549, 1, 1, 1, 1, 1,
-0.1926422, -0.2871431, -0.6599075, 1, 1, 1, 1, 1,
-0.1814573, 2.802141, -1.665339, 1, 1, 1, 1, 1,
-0.1802574, 1.105563, 1.582561, 1, 1, 1, 1, 1,
-0.1792456, -1.393188, -2.532783, 1, 1, 1, 1, 1,
-0.1768507, -0.0453231, -1.301427, 1, 1, 1, 1, 1,
-0.174336, -0.02140466, -0.4232355, 1, 1, 1, 1, 1,
-0.172538, -0.300027, -0.7816359, 1, 1, 1, 1, 1,
-0.1706595, 0.3113804, -1.394211, 1, 1, 1, 1, 1,
-0.1695614, 1.484317, -1.828486, 1, 1, 1, 1, 1,
-0.1681447, -0.3250252, -2.02561, 1, 1, 1, 1, 1,
-0.1610043, 1.390735, -0.7568549, 1, 1, 1, 1, 1,
-0.1590898, -0.8898776, -2.74106, 1, 1, 1, 1, 1,
-0.1583007, -0.1326452, -1.26678, 1, 1, 1, 1, 1,
-0.1544448, 0.7158722, -1.326177, 1, 1, 1, 1, 1,
-0.1541218, 0.4248116, -0.4774568, 0, 0, 1, 1, 1,
-0.1540871, -0.1120911, -2.555237, 1, 0, 0, 1, 1,
-0.1516285, -0.04993577, -3.036395, 1, 0, 0, 1, 1,
-0.1499971, -0.4792472, -2.894246, 1, 0, 0, 1, 1,
-0.1480345, 1.715212, 0.3747848, 1, 0, 0, 1, 1,
-0.1479676, 1.847855, -0.4651395, 1, 0, 0, 1, 1,
-0.1468688, 0.8001016, -0.3381756, 0, 0, 0, 1, 1,
-0.1464808, 0.6635791, 1.325388, 0, 0, 0, 1, 1,
-0.1450017, 0.373289, -0.06319903, 0, 0, 0, 1, 1,
-0.1420685, -0.9210387, -2.421073, 0, 0, 0, 1, 1,
-0.1418207, 0.3159654, 1.097436, 0, 0, 0, 1, 1,
-0.1404751, 0.9614341, 0.808348, 0, 0, 0, 1, 1,
-0.1364679, -1.29587, -3.453026, 0, 0, 0, 1, 1,
-0.1363972, -0.04738728, -0.6271673, 1, 1, 1, 1, 1,
-0.1288548, 0.6908791, -0.1782332, 1, 1, 1, 1, 1,
-0.1280201, -0.3981175, -3.365322, 1, 1, 1, 1, 1,
-0.124906, -3.103054, -3.021654, 1, 1, 1, 1, 1,
-0.1246731, 0.6029899, -0.3393117, 1, 1, 1, 1, 1,
-0.1215866, 1.136386, -1.078578, 1, 1, 1, 1, 1,
-0.1170956, -0.4677151, -3.122187, 1, 1, 1, 1, 1,
-0.1128427, -0.35928, -1.193099, 1, 1, 1, 1, 1,
-0.1118798, -1.765972, -1.930255, 1, 1, 1, 1, 1,
-0.110592, 2.264979, -0.4665026, 1, 1, 1, 1, 1,
-0.1096407, 1.076491, -1.048748, 1, 1, 1, 1, 1,
-0.1095825, -0.6818411, -4.050169, 1, 1, 1, 1, 1,
-0.1079985, -1.872778, -3.218214, 1, 1, 1, 1, 1,
-0.1065086, -1.845422, -2.152575, 1, 1, 1, 1, 1,
-0.1033028, 0.1423938, -1.074885, 1, 1, 1, 1, 1,
-0.09947345, 0.7373325, -0.6996288, 0, 0, 1, 1, 1,
-0.09825855, 1.734836, 0.09795596, 1, 0, 0, 1, 1,
-0.09300769, -0.9988382, -3.31079, 1, 0, 0, 1, 1,
-0.09278046, -1.212504, -3.101137, 1, 0, 0, 1, 1,
-0.08955452, -1.706244, -1.509571, 1, 0, 0, 1, 1,
-0.08555173, -1.325138, -5.014389, 1, 0, 0, 1, 1,
-0.08248165, -0.7371051, -3.904871, 0, 0, 0, 1, 1,
-0.07688181, -0.7663558, -3.616839, 0, 0, 0, 1, 1,
-0.07536081, 0.23146, -1.001382, 0, 0, 0, 1, 1,
-0.06991051, -0.6518667, -1.959577, 0, 0, 0, 1, 1,
-0.06662971, -0.7613502, -2.630548, 0, 0, 0, 1, 1,
-0.06652747, 0.6296315, -1.744654, 0, 0, 0, 1, 1,
-0.06280912, -0.6717135, -2.883772, 0, 0, 0, 1, 1,
-0.06014232, -1.094515, -2.293873, 1, 1, 1, 1, 1,
-0.05067233, -1.620976, -4.165808, 1, 1, 1, 1, 1,
-0.04969759, 0.3857617, -0.4018201, 1, 1, 1, 1, 1,
-0.04646908, -0.6886289, -2.68062, 1, 1, 1, 1, 1,
-0.04238449, -0.0624475, -3.181493, 1, 1, 1, 1, 1,
-0.03889165, -0.4550295, -1.650658, 1, 1, 1, 1, 1,
-0.03883296, -0.06425798, -2.546149, 1, 1, 1, 1, 1,
-0.03778552, -1.801776, -2.593185, 1, 1, 1, 1, 1,
-0.03575829, 0.5279716, -1.02899, 1, 1, 1, 1, 1,
-0.03116992, -0.8523701, -3.383334, 1, 1, 1, 1, 1,
-0.02409048, -0.04235042, -2.706805, 1, 1, 1, 1, 1,
-0.02318195, 0.7678354, -0.7538671, 1, 1, 1, 1, 1,
-0.02166423, -1.075456, -2.270194, 1, 1, 1, 1, 1,
-0.01123391, 2.123434, 2.250847, 1, 1, 1, 1, 1,
-0.006832554, -0.4599791, -3.615788, 1, 1, 1, 1, 1,
-0.004015109, -0.5014383, -2.985727, 0, 0, 1, 1, 1,
-0.0001994013, 2.585462, 0.9766251, 1, 0, 0, 1, 1,
0.0005265063, -1.323452, 2.403675, 1, 0, 0, 1, 1,
0.00476067, -0.1554506, 2.990315, 1, 0, 0, 1, 1,
0.007603703, -0.7322564, 4.846857, 1, 0, 0, 1, 1,
0.01054881, 1.037832, 1.739745, 1, 0, 0, 1, 1,
0.01413769, 0.6550329, -0.9526793, 0, 0, 0, 1, 1,
0.01434314, 0.7948205, -0.8699074, 0, 0, 0, 1, 1,
0.01502918, 0.5401541, 0.1131338, 0, 0, 0, 1, 1,
0.01599692, -0.7373095, 2.168287, 0, 0, 0, 1, 1,
0.01787374, -1.161888, 3.155905, 0, 0, 0, 1, 1,
0.02551701, 1.163266, -0.2421511, 0, 0, 0, 1, 1,
0.02845562, 0.08529493, -1.184857, 0, 0, 0, 1, 1,
0.03162307, -0.818205, 4.5239, 1, 1, 1, 1, 1,
0.03166082, -0.4980204, 3.069902, 1, 1, 1, 1, 1,
0.03447392, -1.432685, 4.13122, 1, 1, 1, 1, 1,
0.03517836, 0.9099944, 0.4796954, 1, 1, 1, 1, 1,
0.03687729, 0.2106188, -0.7999584, 1, 1, 1, 1, 1,
0.03730071, 0.1757807, -0.2369829, 1, 1, 1, 1, 1,
0.04004241, 1.622621, -0.6260817, 1, 1, 1, 1, 1,
0.05064447, 0.8076452, -0.7971622, 1, 1, 1, 1, 1,
0.05344706, 0.5931823, -0.4848014, 1, 1, 1, 1, 1,
0.05429938, 0.8584336, 0.3652598, 1, 1, 1, 1, 1,
0.0584933, 0.5391783, 2.694007, 1, 1, 1, 1, 1,
0.06077602, -1.240468, 4.785821, 1, 1, 1, 1, 1,
0.06358153, 0.2270971, -1.122249, 1, 1, 1, 1, 1,
0.06728025, 1.875158, -0.2540399, 1, 1, 1, 1, 1,
0.06847373, -0.2922919, 2.565242, 1, 1, 1, 1, 1,
0.06906026, 0.4741674, 0.8385314, 0, 0, 1, 1, 1,
0.07139105, -0.3569322, 4.369547, 1, 0, 0, 1, 1,
0.07171763, -0.423221, 2.665363, 1, 0, 0, 1, 1,
0.07244704, 0.3678889, -0.4848199, 1, 0, 0, 1, 1,
0.07417482, 1.471638, -0.3544149, 1, 0, 0, 1, 1,
0.07515511, 1.316196, 0.0645542, 1, 0, 0, 1, 1,
0.08300027, 0.6907285, 1.049707, 0, 0, 0, 1, 1,
0.08585361, 1.452707, -1.298874, 0, 0, 0, 1, 1,
0.09506652, -0.2827011, 2.32363, 0, 0, 0, 1, 1,
0.0954375, 2.968876, 1.731602, 0, 0, 0, 1, 1,
0.09769595, -1.233684, 3.83987, 0, 0, 0, 1, 1,
0.09969757, -1.125858, 3.891649, 0, 0, 0, 1, 1,
0.1011595, 0.01286688, 1.265369, 0, 0, 0, 1, 1,
0.1054794, -0.4031911, 4.12552, 1, 1, 1, 1, 1,
0.106073, 0.7148396, 1.229316, 1, 1, 1, 1, 1,
0.1062258, 1.621917, -1.910463, 1, 1, 1, 1, 1,
0.1078465, -0.7362491, 0.9822804, 1, 1, 1, 1, 1,
0.1081206, -0.2240331, 1.918086, 1, 1, 1, 1, 1,
0.1100455, 0.1628224, 1.755971, 1, 1, 1, 1, 1,
0.1107809, 0.8289211, 0.3085573, 1, 1, 1, 1, 1,
0.111761, -0.4352697, 2.276507, 1, 1, 1, 1, 1,
0.1125526, 0.3921404, 1.783494, 1, 1, 1, 1, 1,
0.1140974, -0.583628, 3.792828, 1, 1, 1, 1, 1,
0.1163667, 0.376918, 0.6185648, 1, 1, 1, 1, 1,
0.1223526, -2.118859, 3.09042, 1, 1, 1, 1, 1,
0.1242318, 0.6576849, 1.341837, 1, 1, 1, 1, 1,
0.1245125, -2.309478, 2.442267, 1, 1, 1, 1, 1,
0.126803, -0.002302215, 1.148322, 1, 1, 1, 1, 1,
0.1270105, -0.6300143, 3.036069, 0, 0, 1, 1, 1,
0.1348979, -1.269621, 3.372335, 1, 0, 0, 1, 1,
0.1355734, -0.1583638, 3.562825, 1, 0, 0, 1, 1,
0.1362458, 0.4169819, 0.8453386, 1, 0, 0, 1, 1,
0.1372711, -1.148307, 2.283622, 1, 0, 0, 1, 1,
0.139235, -0.07487135, 1.624086, 1, 0, 0, 1, 1,
0.143634, 0.6033936, 0.3655934, 0, 0, 0, 1, 1,
0.1441679, 1.202632, -0.5170815, 0, 0, 0, 1, 1,
0.1476872, -2.359674, 1.813243, 0, 0, 0, 1, 1,
0.1489454, 0.7598725, 1.195459, 0, 0, 0, 1, 1,
0.1561937, -0.9075156, 2.206984, 0, 0, 0, 1, 1,
0.1588603, -0.9410576, 3.341715, 0, 0, 0, 1, 1,
0.1590518, -0.01430121, 1.426913, 0, 0, 0, 1, 1,
0.1601517, -0.3799296, 1.602821, 1, 1, 1, 1, 1,
0.1637822, 2.168752, -0.005956638, 1, 1, 1, 1, 1,
0.1642648, -0.0488482, 1.157063, 1, 1, 1, 1, 1,
0.1644069, 0.4377111, -0.04774474, 1, 1, 1, 1, 1,
0.1651946, -1.111794, 2.346894, 1, 1, 1, 1, 1,
0.165695, -0.7829068, 2.806803, 1, 1, 1, 1, 1,
0.1662409, 2.741629, -0.7345462, 1, 1, 1, 1, 1,
0.1670811, 0.2012839, 0.6531895, 1, 1, 1, 1, 1,
0.1689334, -0.1694079, 3.197231, 1, 1, 1, 1, 1,
0.1805953, 0.2062802, 1.249192, 1, 1, 1, 1, 1,
0.184358, 1.643203, -0.7766213, 1, 1, 1, 1, 1,
0.1843716, -0.2564905, 2.087261, 1, 1, 1, 1, 1,
0.1889991, -1.027444, 3.664128, 1, 1, 1, 1, 1,
0.1969141, -1.924218, 3.226069, 1, 1, 1, 1, 1,
0.2016353, -0.2986873, 3.091794, 1, 1, 1, 1, 1,
0.203652, -0.8475897, 2.429586, 0, 0, 1, 1, 1,
0.2070942, -1.622368, 3.244169, 1, 0, 0, 1, 1,
0.2163959, -0.540241, 4.874577, 1, 0, 0, 1, 1,
0.2210846, -0.2546907, 1.553581, 1, 0, 0, 1, 1,
0.2316669, 0.136419, -0.1091427, 1, 0, 0, 1, 1,
0.2351251, -0.1270781, 2.154008, 1, 0, 0, 1, 1,
0.2400513, 1.173397, -0.3407962, 0, 0, 0, 1, 1,
0.2420286, 0.06930622, 0.5096938, 0, 0, 0, 1, 1,
0.2429509, 0.3243439, 1.350832, 0, 0, 0, 1, 1,
0.2444372, -0.7786583, 3.328165, 0, 0, 0, 1, 1,
0.2480763, 0.284265, 2.440289, 0, 0, 0, 1, 1,
0.2502601, -0.1071825, 1.075582, 0, 0, 0, 1, 1,
0.2502981, 0.6758757, -0.6905794, 0, 0, 0, 1, 1,
0.2508351, 0.9074847, 0.8980421, 1, 1, 1, 1, 1,
0.2509888, 1.171135, 1.80095, 1, 1, 1, 1, 1,
0.2510925, -0.1326271, 1.996518, 1, 1, 1, 1, 1,
0.2552206, 0.7362261, 0.5227435, 1, 1, 1, 1, 1,
0.2569617, -0.6691692, 2.448835, 1, 1, 1, 1, 1,
0.2570026, 1.364233, -0.6675788, 1, 1, 1, 1, 1,
0.2673826, 1.167445, -0.4588944, 1, 1, 1, 1, 1,
0.2691172, 0.06873702, 3.118075, 1, 1, 1, 1, 1,
0.2700702, 0.09174005, 0.3664632, 1, 1, 1, 1, 1,
0.2702127, -1.65696, 2.921789, 1, 1, 1, 1, 1,
0.2715791, -1.61177, 3.337354, 1, 1, 1, 1, 1,
0.2759844, 1.844054, 0.7841979, 1, 1, 1, 1, 1,
0.2773055, -0.6300793, 3.029122, 1, 1, 1, 1, 1,
0.2822336, -0.9172832, 2.539075, 1, 1, 1, 1, 1,
0.2823139, 1.797268, 1.286114, 1, 1, 1, 1, 1,
0.2884949, -0.5177041, 2.086074, 0, 0, 1, 1, 1,
0.2935167, 0.6301637, 0.7012304, 1, 0, 0, 1, 1,
0.2939333, -0.8720524, 2.25222, 1, 0, 0, 1, 1,
0.2943044, 0.3998917, -0.1453873, 1, 0, 0, 1, 1,
0.2949201, -0.1933155, 2.540196, 1, 0, 0, 1, 1,
0.2962741, 0.3555888, -0.3399089, 1, 0, 0, 1, 1,
0.299722, 0.3438103, 0.02914855, 0, 0, 0, 1, 1,
0.3009445, -0.3616817, 3.284834, 0, 0, 0, 1, 1,
0.3019308, 0.7855309, -0.0518385, 0, 0, 0, 1, 1,
0.3034855, -1.482447, 3.476883, 0, 0, 0, 1, 1,
0.3055158, -2.15473, 2.466719, 0, 0, 0, 1, 1,
0.3061622, 1.47919, 1.496915, 0, 0, 0, 1, 1,
0.3083638, -0.80063, 3.804162, 0, 0, 0, 1, 1,
0.3123201, 0.01530196, 1.726558, 1, 1, 1, 1, 1,
0.3128981, -0.01667518, 0.07465667, 1, 1, 1, 1, 1,
0.3142462, -0.6685695, 1.792642, 1, 1, 1, 1, 1,
0.3211269, 1.439261, 1.242043, 1, 1, 1, 1, 1,
0.3242539, -0.1036758, 0.8221262, 1, 1, 1, 1, 1,
0.3255517, 0.3426279, 0.9692989, 1, 1, 1, 1, 1,
0.3275675, -1.311965, 2.131833, 1, 1, 1, 1, 1,
0.3290321, 0.3691586, -0.7340347, 1, 1, 1, 1, 1,
0.3291222, -1.209691, 2.369322, 1, 1, 1, 1, 1,
0.331506, -0.1888111, 3.70104, 1, 1, 1, 1, 1,
0.3344411, 0.2335868, 1.502174, 1, 1, 1, 1, 1,
0.3374169, 0.0146768, 1.130528, 1, 1, 1, 1, 1,
0.3395738, 0.2989775, 0.9349872, 1, 1, 1, 1, 1,
0.3409796, -1.254705, 4.027387, 1, 1, 1, 1, 1,
0.3430991, 0.8702999, 0.5858124, 1, 1, 1, 1, 1,
0.3461496, 0.794425, -1.249001, 0, 0, 1, 1, 1,
0.349557, 0.1162876, 1.156402, 1, 0, 0, 1, 1,
0.3499903, 1.246869, 0.3059798, 1, 0, 0, 1, 1,
0.3526941, 0.4395421, -1.001957, 1, 0, 0, 1, 1,
0.3528813, -0.5537565, 3.948021, 1, 0, 0, 1, 1,
0.353864, -0.8919098, 3.63993, 1, 0, 0, 1, 1,
0.3576289, -0.01946676, 1.841324, 0, 0, 0, 1, 1,
0.3664448, -0.5719869, 3.794657, 0, 0, 0, 1, 1,
0.3754566, -1.089643, 1.328862, 0, 0, 0, 1, 1,
0.3847331, -0.9637254, 3.052584, 0, 0, 0, 1, 1,
0.3865695, 0.07921495, 1.967949, 0, 0, 0, 1, 1,
0.3880633, -0.8141715, 2.854423, 0, 0, 0, 1, 1,
0.388937, -1.073501, 3.282846, 0, 0, 0, 1, 1,
0.388953, -1.066805, 1.978559, 1, 1, 1, 1, 1,
0.3961604, 1.209508, 1.396419, 1, 1, 1, 1, 1,
0.39814, -1.274153, 3.116286, 1, 1, 1, 1, 1,
0.4017872, 1.050737, -0.1558628, 1, 1, 1, 1, 1,
0.4027286, -0.4033473, 1.653445, 1, 1, 1, 1, 1,
0.4101441, 0.1160907, 0.4355709, 1, 1, 1, 1, 1,
0.4102672, 0.6114712, 0.7768534, 1, 1, 1, 1, 1,
0.4110945, 1.63913, 0.2862932, 1, 1, 1, 1, 1,
0.4127067, -0.8214055, 3.708691, 1, 1, 1, 1, 1,
0.4128828, -0.3666119, 3.08924, 1, 1, 1, 1, 1,
0.4148459, -0.2220531, 0.2114281, 1, 1, 1, 1, 1,
0.4154653, -0.3278415, 2.614882, 1, 1, 1, 1, 1,
0.4169743, -0.3107076, 4.065527, 1, 1, 1, 1, 1,
0.4174695, 0.8973291, -0.2408539, 1, 1, 1, 1, 1,
0.4200155, 1.335456, 2.527453, 1, 1, 1, 1, 1,
0.420035, 1.555443, -0.3014414, 0, 0, 1, 1, 1,
0.4252671, 1.878781, 0.8584208, 1, 0, 0, 1, 1,
0.4252887, 0.2680196, 0.8381284, 1, 0, 0, 1, 1,
0.4263044, -1.611901, 4.567569, 1, 0, 0, 1, 1,
0.4284042, -1.842898, 2.363405, 1, 0, 0, 1, 1,
0.4289978, -0.08953856, 2.466367, 1, 0, 0, 1, 1,
0.4362218, -2.513236, 3.225178, 0, 0, 0, 1, 1,
0.439804, -1.057793, 2.9519, 0, 0, 0, 1, 1,
0.4410224, 2.002278, -0.2412895, 0, 0, 0, 1, 1,
0.4433621, 1.120733, -0.24407, 0, 0, 0, 1, 1,
0.4488765, 0.9448034, -0.8371574, 0, 0, 0, 1, 1,
0.4491145, 1.851771, 0.9496246, 0, 0, 0, 1, 1,
0.4496316, -0.8558425, 3.339665, 0, 0, 0, 1, 1,
0.4498002, -0.4618188, 1.833554, 1, 1, 1, 1, 1,
0.4522624, 0.3024428, 2.129121, 1, 1, 1, 1, 1,
0.4529688, 0.6190413, 1.182549, 1, 1, 1, 1, 1,
0.461399, 0.4272839, 0.5117437, 1, 1, 1, 1, 1,
0.4645073, -0.945758, 2.586694, 1, 1, 1, 1, 1,
0.4689902, -0.7400266, 4.364681, 1, 1, 1, 1, 1,
0.4700327, 1.315485, 2.434586, 1, 1, 1, 1, 1,
0.4711543, -1.155849, 3.160617, 1, 1, 1, 1, 1,
0.4754004, 0.1916314, 1.823869, 1, 1, 1, 1, 1,
0.4784627, 0.6240127, 2.165515, 1, 1, 1, 1, 1,
0.4816513, -0.8099926, 3.498963, 1, 1, 1, 1, 1,
0.4873766, -0.5281196, 1.829986, 1, 1, 1, 1, 1,
0.4877724, -0.9344819, 3.636069, 1, 1, 1, 1, 1,
0.4934222, 1.5516, 2.480739, 1, 1, 1, 1, 1,
0.4962772, 0.5610372, 0.6945561, 1, 1, 1, 1, 1,
0.5044221, -0.8483464, 2.830822, 0, 0, 1, 1, 1,
0.5091116, -0.4190835, 2.111656, 1, 0, 0, 1, 1,
0.5096141, -1.42947, 3.289033, 1, 0, 0, 1, 1,
0.513048, 1.295954, -1.163978, 1, 0, 0, 1, 1,
0.5139909, 0.03534553, 2.673858, 1, 0, 0, 1, 1,
0.5140907, 0.2637731, 0.6073568, 1, 0, 0, 1, 1,
0.5155987, -0.6867103, 4.906585, 0, 0, 0, 1, 1,
0.5184839, -1.093437, 2.578708, 0, 0, 0, 1, 1,
0.5187256, 1.54683, 1.352002, 0, 0, 0, 1, 1,
0.5201063, 1.263201, -0.075556, 0, 0, 0, 1, 1,
0.5254232, -1.632897, 3.272434, 0, 0, 0, 1, 1,
0.5256123, 1.95508, -1.230855, 0, 0, 0, 1, 1,
0.5277467, 0.3365693, 1.686063, 0, 0, 0, 1, 1,
0.5294666, -0.4454662, 1.636399, 1, 1, 1, 1, 1,
0.5309987, -0.5636159, 2.936953, 1, 1, 1, 1, 1,
0.5340168, 3.056583, 1.647872, 1, 1, 1, 1, 1,
0.5341696, 0.9476817, 1.407472, 1, 1, 1, 1, 1,
0.5348051, -1.088036, 3.770831, 1, 1, 1, 1, 1,
0.5363544, 0.8380206, -0.004211662, 1, 1, 1, 1, 1,
0.5464577, -1.474805, 0.7948418, 1, 1, 1, 1, 1,
0.5489287, -1.736048, 2.381581, 1, 1, 1, 1, 1,
0.5507838, 0.9077958, -1.806042, 1, 1, 1, 1, 1,
0.5563814, 0.07506564, 1.169686, 1, 1, 1, 1, 1,
0.5622898, 1.245878, 0.2469298, 1, 1, 1, 1, 1,
0.5675406, -0.1583433, 0.6513997, 1, 1, 1, 1, 1,
0.5727658, -0.925622, 2.484207, 1, 1, 1, 1, 1,
0.5752699, 1.398732, 1.025742, 1, 1, 1, 1, 1,
0.577427, -0.9590595, 2.659, 1, 1, 1, 1, 1,
0.5806833, 0.2472054, 2.049891, 0, 0, 1, 1, 1,
0.5816787, 2.394877, -0.3122811, 1, 0, 0, 1, 1,
0.5825844, 0.04358111, 2.350113, 1, 0, 0, 1, 1,
0.5874971, -0.6214207, 0.4636246, 1, 0, 0, 1, 1,
0.5892644, 2.046108, 3.2196, 1, 0, 0, 1, 1,
0.5929156, -0.7238317, 3.368476, 1, 0, 0, 1, 1,
0.5942772, -0.4313979, 1.633583, 0, 0, 0, 1, 1,
0.6011353, 1.549218, -1.513078, 0, 0, 0, 1, 1,
0.6018047, 0.7534015, 0.5717741, 0, 0, 0, 1, 1,
0.6045413, 0.08312846, 0.6701202, 0, 0, 0, 1, 1,
0.6084419, 0.02749999, 1.590349, 0, 0, 0, 1, 1,
0.6085724, 0.2309188, -0.5845638, 0, 0, 0, 1, 1,
0.6086175, -0.7502199, 3.48762, 0, 0, 0, 1, 1,
0.6109787, -0.7669955, 1.749661, 1, 1, 1, 1, 1,
0.6120293, -1.726528, 2.300728, 1, 1, 1, 1, 1,
0.6129603, -0.8403299, 1.284464, 1, 1, 1, 1, 1,
0.6172666, 1.058427, 0.3880561, 1, 1, 1, 1, 1,
0.6189361, 1.666668, 0.3167116, 1, 1, 1, 1, 1,
0.6202224, -1.279671, 2.747807, 1, 1, 1, 1, 1,
0.6272087, -0.2918329, 0.9095192, 1, 1, 1, 1, 1,
0.6378254, -0.5252944, 1.465074, 1, 1, 1, 1, 1,
0.6412998, -0.530651, 4.951677, 1, 1, 1, 1, 1,
0.6518577, 2.024315, -0.8261766, 1, 1, 1, 1, 1,
0.6528141, -0.5746466, 2.393785, 1, 1, 1, 1, 1,
0.6568954, -0.1115802, 1.228818, 1, 1, 1, 1, 1,
0.6569372, 0.2223089, 1.703535, 1, 1, 1, 1, 1,
0.658223, -1.347332, 3.300675, 1, 1, 1, 1, 1,
0.658264, -0.6901369, 1.970987, 1, 1, 1, 1, 1,
0.6591872, -0.162669, 2.071955, 0, 0, 1, 1, 1,
0.6621164, 0.6386918, 0.3631721, 1, 0, 0, 1, 1,
0.6666968, -0.9450082, 2.162437, 1, 0, 0, 1, 1,
0.6730233, 2.054092, 0.6929367, 1, 0, 0, 1, 1,
0.674917, -1.034858, 2.73948, 1, 0, 0, 1, 1,
0.6761392, 0.940569, 0.6414754, 1, 0, 0, 1, 1,
0.6764184, 0.6318317, 1.463386, 0, 0, 0, 1, 1,
0.6798744, -0.6559317, 1.931948, 0, 0, 0, 1, 1,
0.6845536, -0.4772374, 0.5845251, 0, 0, 0, 1, 1,
0.6869192, 0.6373394, 0.6707867, 0, 0, 0, 1, 1,
0.6874465, -1.711846, 2.265718, 0, 0, 0, 1, 1,
0.6884635, -0.5380692, 0.9293296, 0, 0, 0, 1, 1,
0.6947448, 0.3151729, 2.928068, 0, 0, 0, 1, 1,
0.7022326, -0.5364625, 2.519244, 1, 1, 1, 1, 1,
0.7045859, 0.1359237, 1.255892, 1, 1, 1, 1, 1,
0.7106592, 0.8024654, 2.395025, 1, 1, 1, 1, 1,
0.7237806, -0.3706025, 3.294394, 1, 1, 1, 1, 1,
0.7327553, -0.1640397, 2.118995, 1, 1, 1, 1, 1,
0.7329267, -0.5801142, 2.13626, 1, 1, 1, 1, 1,
0.7347084, 0.9081483, 1.563379, 1, 1, 1, 1, 1,
0.7399113, -1.251838, 3.36099, 1, 1, 1, 1, 1,
0.7404599, -0.1501118, 0.5896409, 1, 1, 1, 1, 1,
0.7413946, -0.7247669, 3.121496, 1, 1, 1, 1, 1,
0.7416269, -0.03198509, 0.7735363, 1, 1, 1, 1, 1,
0.7418576, -0.2691717, 2.498791, 1, 1, 1, 1, 1,
0.7421757, -0.6991162, 2.680627, 1, 1, 1, 1, 1,
0.7470185, -0.7379984, 2.744049, 1, 1, 1, 1, 1,
0.7507169, 0.3099381, 1.076337, 1, 1, 1, 1, 1,
0.7512483, -0.1372444, -0.8294502, 0, 0, 1, 1, 1,
0.755137, 0.495164, -0.2266762, 1, 0, 0, 1, 1,
0.7567264, 0.7768811, -1.489914, 1, 0, 0, 1, 1,
0.7597153, -1.14448, 2.616009, 1, 0, 0, 1, 1,
0.7624606, 0.2610981, 1.794787, 1, 0, 0, 1, 1,
0.767473, -0.5184137, 2.524462, 1, 0, 0, 1, 1,
0.7776563, -0.2279381, 0.2006682, 0, 0, 0, 1, 1,
0.7777672, 0.3835323, 0.8547294, 0, 0, 0, 1, 1,
0.780981, 1.12196, 2.997952, 0, 0, 0, 1, 1,
0.7824691, -0.3644753, 1.667627, 0, 0, 0, 1, 1,
0.7843631, -0.4018923, 1.941967, 0, 0, 0, 1, 1,
0.7891418, -0.09248266, 1.488043, 0, 0, 0, 1, 1,
0.7904693, 0.1207467, 1.25185, 0, 0, 0, 1, 1,
0.7934668, -0.1043812, 3.225985, 1, 1, 1, 1, 1,
0.7955832, -1.562377, 1.168007, 1, 1, 1, 1, 1,
0.7959623, -0.8117698, 2.84693, 1, 1, 1, 1, 1,
0.8038926, -0.4362996, 3.689055, 1, 1, 1, 1, 1,
0.8069116, -0.4291317, 2.61695, 1, 1, 1, 1, 1,
0.8160511, -0.6580884, 2.331118, 1, 1, 1, 1, 1,
0.8197885, -0.153664, 2.508223, 1, 1, 1, 1, 1,
0.8287789, -0.2177296, 0.6685624, 1, 1, 1, 1, 1,
0.8293283, -1.704535, 2.624345, 1, 1, 1, 1, 1,
0.8295785, 1.234345, 1.487089, 1, 1, 1, 1, 1,
0.8327568, 2.023649, 0.6095266, 1, 1, 1, 1, 1,
0.8369521, 0.2363141, 2.372958, 1, 1, 1, 1, 1,
0.8382251, 0.4590688, 0.4222172, 1, 1, 1, 1, 1,
0.8387117, -0.497797, 1.952125, 1, 1, 1, 1, 1,
0.8469291, -0.09216273, 0.8451562, 1, 1, 1, 1, 1,
0.8484111, -0.2117686, 3.475168, 0, 0, 1, 1, 1,
0.8527747, 1.831339, 1.346748, 1, 0, 0, 1, 1,
0.8568926, -1.199079, 1.166413, 1, 0, 0, 1, 1,
0.8592295, -0.4609814, 2.983748, 1, 0, 0, 1, 1,
0.8597529, -0.9306716, 2.471505, 1, 0, 0, 1, 1,
0.860638, 0.01846533, 1.462058, 1, 0, 0, 1, 1,
0.8657212, 0.07111915, -0.5008958, 0, 0, 0, 1, 1,
0.8673723, -0.7546007, 1.599977, 0, 0, 0, 1, 1,
0.8718024, -0.9171607, 1.518528, 0, 0, 0, 1, 1,
0.8736071, 0.2867013, 2.395644, 0, 0, 0, 1, 1,
0.8822543, 0.05716879, 2.466086, 0, 0, 0, 1, 1,
0.8847948, 0.3529633, 1.446905, 0, 0, 0, 1, 1,
0.8892182, -1.854994, 1.927568, 0, 0, 0, 1, 1,
0.8922424, 0.07567398, 0.4147091, 1, 1, 1, 1, 1,
0.8935046, 0.3867307, 2.233928, 1, 1, 1, 1, 1,
0.8943455, 0.2524938, 2.312697, 1, 1, 1, 1, 1,
0.9040285, -1.959502, 2.72607, 1, 1, 1, 1, 1,
0.9051286, -1.608969, 2.56478, 1, 1, 1, 1, 1,
0.9190147, -1.538849, 3.596797, 1, 1, 1, 1, 1,
0.9222358, 0.9989067, -0.1382217, 1, 1, 1, 1, 1,
0.9247337, -0.4670218, 1.634602, 1, 1, 1, 1, 1,
0.9270669, -1.448449, 4.447001, 1, 1, 1, 1, 1,
0.9284145, -2.152298, 4.472131, 1, 1, 1, 1, 1,
0.9347218, 1.296526, 0.1698948, 1, 1, 1, 1, 1,
0.9414526, -0.6034635, 2.432245, 1, 1, 1, 1, 1,
0.9439173, -0.440563, 1.370814, 1, 1, 1, 1, 1,
0.9446515, 1.161392, -0.5036674, 1, 1, 1, 1, 1,
0.9456874, 0.6159053, -0.1232252, 1, 1, 1, 1, 1,
0.9465757, -0.1179593, 3.28131, 0, 0, 1, 1, 1,
0.9515947, 1.613342, -0.1987802, 1, 0, 0, 1, 1,
0.954374, -0.7684476, 1.904182, 1, 0, 0, 1, 1,
0.9642414, -0.5777936, 3.735498, 1, 0, 0, 1, 1,
0.9683047, 0.6509659, 1.023629, 1, 0, 0, 1, 1,
0.9800143, 0.6218633, 2.500064, 1, 0, 0, 1, 1,
0.9857249, 0.9298377, 0.528154, 0, 0, 0, 1, 1,
0.9920747, -0.495712, 0.96316, 0, 0, 0, 1, 1,
0.9937887, -0.1400583, 2.259104, 0, 0, 0, 1, 1,
0.9954464, -0.9715555, 2.691199, 0, 0, 0, 1, 1,
0.995479, -1.179407, 1.691037, 0, 0, 0, 1, 1,
1.000696, -0.6787781, 1.99835, 0, 0, 0, 1, 1,
1.008037, -1.0959, 2.705759, 0, 0, 0, 1, 1,
1.008122, -0.02386062, 1.741882, 1, 1, 1, 1, 1,
1.008276, 0.9078877, 0.2152138, 1, 1, 1, 1, 1,
1.011522, -0.4147778, 2.113732, 1, 1, 1, 1, 1,
1.015053, 0.1289826, 1.970424, 1, 1, 1, 1, 1,
1.020722, -0.6334574, 1.53541, 1, 1, 1, 1, 1,
1.023131, 1.150941, 0.7915611, 1, 1, 1, 1, 1,
1.027972, -0.8924831, 3.389109, 1, 1, 1, 1, 1,
1.031263, -0.6998624, 1.24893, 1, 1, 1, 1, 1,
1.031433, -0.5041051, 1.083532, 1, 1, 1, 1, 1,
1.044749, 0.4261905, 1.66596, 1, 1, 1, 1, 1,
1.051349, -0.6267096, 1.799188, 1, 1, 1, 1, 1,
1.061921, 0.513994, 0.6034811, 1, 1, 1, 1, 1,
1.062192, 0.5149052, 2.763453, 1, 1, 1, 1, 1,
1.066408, -1.194826, 1.515664, 1, 1, 1, 1, 1,
1.066715, -0.03693279, 2.765374, 1, 1, 1, 1, 1,
1.071616, -0.3535691, 1.663949, 0, 0, 1, 1, 1,
1.072825, 0.7561797, 0.7797709, 1, 0, 0, 1, 1,
1.084325, 1.49632, -0.1091281, 1, 0, 0, 1, 1,
1.086555, -0.69545, 3.702938, 1, 0, 0, 1, 1,
1.0869, 0.1820006, 1.464167, 1, 0, 0, 1, 1,
1.087102, -0.8229244, 1.166031, 1, 0, 0, 1, 1,
1.091253, 0.6643492, -0.3542103, 0, 0, 0, 1, 1,
1.099729, 0.03788519, 1.574238, 0, 0, 0, 1, 1,
1.101118, 1.446215, -0.5002878, 0, 0, 0, 1, 1,
1.105206, -2.157276, 2.764503, 0, 0, 0, 1, 1,
1.113327, -1.368067, 1.560711, 0, 0, 0, 1, 1,
1.114038, -1.384555, 3.268969, 0, 0, 0, 1, 1,
1.121017, 1.76843, 0.4407075, 0, 0, 0, 1, 1,
1.130824, -0.3524072, 0.724202, 1, 1, 1, 1, 1,
1.13549, 0.5658128, 1.345306, 1, 1, 1, 1, 1,
1.137629, -0.1023665, 3.078528, 1, 1, 1, 1, 1,
1.137744, 0.2796083, 1.785032, 1, 1, 1, 1, 1,
1.139043, -0.3485465, 3.026704, 1, 1, 1, 1, 1,
1.156106, 0.4024027, 0.3207393, 1, 1, 1, 1, 1,
1.162271, -0.3961625, 0.8061157, 1, 1, 1, 1, 1,
1.16326, -0.2297675, 0.6829774, 1, 1, 1, 1, 1,
1.170607, 0.7003301, 0.07780766, 1, 1, 1, 1, 1,
1.172797, 1.92068, 1.371268, 1, 1, 1, 1, 1,
1.176303, 0.6715222, 0.1843292, 1, 1, 1, 1, 1,
1.193088, -0.7062474, 3.477183, 1, 1, 1, 1, 1,
1.203418, -0.6057909, 3.754675, 1, 1, 1, 1, 1,
1.207076, -0.664638, 3.240139, 1, 1, 1, 1, 1,
1.207216, 0.5755247, 2.903485, 1, 1, 1, 1, 1,
1.212822, -0.0478698, 1.836837, 0, 0, 1, 1, 1,
1.214011, 0.8993666, 1.677783, 1, 0, 0, 1, 1,
1.21709, 0.2889248, 0.8304089, 1, 0, 0, 1, 1,
1.230425, 0.5847164, 0.8116734, 1, 0, 0, 1, 1,
1.243228, 0.5622861, 3.088916, 1, 0, 0, 1, 1,
1.253819, 0.7743268, 1.376829, 1, 0, 0, 1, 1,
1.256163, 1.055866, 1.455668, 0, 0, 0, 1, 1,
1.257594, -0.03069502, 0.899074, 0, 0, 0, 1, 1,
1.257967, -0.1227915, 2.409855, 0, 0, 0, 1, 1,
1.258843, 0.2096899, 2.55285, 0, 0, 0, 1, 1,
1.261245, -0.6000877, 2.830407, 0, 0, 0, 1, 1,
1.267325, 1.558674, 0.0007256679, 0, 0, 0, 1, 1,
1.280052, 0.1455175, 0.07645416, 0, 0, 0, 1, 1,
1.281452, -1.028421, 2.631637, 1, 1, 1, 1, 1,
1.290528, -0.4191432, 3.031095, 1, 1, 1, 1, 1,
1.292443, 0.3736294, 0.8200197, 1, 1, 1, 1, 1,
1.297886, 0.8777432, 1.034966, 1, 1, 1, 1, 1,
1.306791, -1.115167, 1.574607, 1, 1, 1, 1, 1,
1.306844, 0.9354289, 0.7441075, 1, 1, 1, 1, 1,
1.311374, -0.4406413, 0.7243758, 1, 1, 1, 1, 1,
1.32401, -0.63229, 1.526741, 1, 1, 1, 1, 1,
1.324837, 0.8203498, 0.2491496, 1, 1, 1, 1, 1,
1.325785, 0.06351787, 1.611583, 1, 1, 1, 1, 1,
1.330309, -0.2233077, 2.391576, 1, 1, 1, 1, 1,
1.341507, 0.2085696, 3.50102, 1, 1, 1, 1, 1,
1.34383, -1.450719, 1.366493, 1, 1, 1, 1, 1,
1.345215, 0.9889595, -1.036823, 1, 1, 1, 1, 1,
1.348614, -2.139976, 3.548234, 1, 1, 1, 1, 1,
1.350245, -1.532879, 2.962933, 0, 0, 1, 1, 1,
1.356374, -0.1753406, 2.133816, 1, 0, 0, 1, 1,
1.358265, -1.080875, 3.138082, 1, 0, 0, 1, 1,
1.361382, -0.7228689, 1.422481, 1, 0, 0, 1, 1,
1.364642, 0.1442838, 1.43276, 1, 0, 0, 1, 1,
1.368147, 0.4521781, 2.510684, 1, 0, 0, 1, 1,
1.368905, 0.437799, -0.586696, 0, 0, 0, 1, 1,
1.368966, 0.6413592, 2.529597, 0, 0, 0, 1, 1,
1.382246, -0.3926394, 1.83063, 0, 0, 0, 1, 1,
1.386935, 0.01994449, 1.076291, 0, 0, 0, 1, 1,
1.391086, -1.176585, 2.018922, 0, 0, 0, 1, 1,
1.393169, -3.240278, 4.430212, 0, 0, 0, 1, 1,
1.396979, 0.1637275, 0.5698364, 0, 0, 0, 1, 1,
1.397056, -1.299661, 1.727066, 1, 1, 1, 1, 1,
1.409108, -0.4416732, -0.3347804, 1, 1, 1, 1, 1,
1.411909, 1.850573, -1.732452, 1, 1, 1, 1, 1,
1.418766, 0.308561, -0.1998859, 1, 1, 1, 1, 1,
1.422476, 0.7162852, 1.445929, 1, 1, 1, 1, 1,
1.423036, -1.339601, 2.263192, 1, 1, 1, 1, 1,
1.428058, 1.056626, 2.078245, 1, 1, 1, 1, 1,
1.428579, -1.619207, 1.718118, 1, 1, 1, 1, 1,
1.429597, -0.7934932, 2.220406, 1, 1, 1, 1, 1,
1.436244, -0.9164943, 2.836698, 1, 1, 1, 1, 1,
1.444959, 1.93058, 0.1705893, 1, 1, 1, 1, 1,
1.451887, 0.4023047, 2.321925, 1, 1, 1, 1, 1,
1.459592, -1.82354, 2.179535, 1, 1, 1, 1, 1,
1.465147, 0.3400858, 1.301699, 1, 1, 1, 1, 1,
1.478702, 0.1582187, -0.2734706, 1, 1, 1, 1, 1,
1.479354, 0.1976432, 3.161411, 0, 0, 1, 1, 1,
1.483514, 1.675452, 0.7692344, 1, 0, 0, 1, 1,
1.486523, -1.246227, 3.309181, 1, 0, 0, 1, 1,
1.494426, -1.202955, 1.868027, 1, 0, 0, 1, 1,
1.500486, 0.5407686, 1.378447, 1, 0, 0, 1, 1,
1.515332, 0.8174852, 2.213517, 1, 0, 0, 1, 1,
1.52067, 0.4990022, 0.7003028, 0, 0, 0, 1, 1,
1.521918, -1.239926, 1.520424, 0, 0, 0, 1, 1,
1.522101, 0.7083253, 1.194926, 0, 0, 0, 1, 1,
1.523125, 0.6734342, 0.2789355, 0, 0, 0, 1, 1,
1.544399, 0.6482788, 2.743715, 0, 0, 0, 1, 1,
1.557749, -0.4718401, 1.612455, 0, 0, 0, 1, 1,
1.558574, 0.3078214, 1.172537, 0, 0, 0, 1, 1,
1.559096, -1.389035, 1.965738, 1, 1, 1, 1, 1,
1.561234, 0.3496391, 1.971226, 1, 1, 1, 1, 1,
1.566074, -0.6046881, 0.5616509, 1, 1, 1, 1, 1,
1.570385, 0.8554782, 2.181396, 1, 1, 1, 1, 1,
1.581755, 0.5587202, 2.411188, 1, 1, 1, 1, 1,
1.5826, 1.79151, -1.181864, 1, 1, 1, 1, 1,
1.588605, 0.3440061, 2.196212, 1, 1, 1, 1, 1,
1.597838, -0.3438762, 1.568782, 1, 1, 1, 1, 1,
1.637144, -0.8917349, 2.207273, 1, 1, 1, 1, 1,
1.639284, 0.300711, 2.979146, 1, 1, 1, 1, 1,
1.665881, 1.90818, 0.6177059, 1, 1, 1, 1, 1,
1.667964, 0.7153317, 1.37155, 1, 1, 1, 1, 1,
1.673319, -0.277007, 2.104931, 1, 1, 1, 1, 1,
1.686198, 0.2314637, 2.578552, 1, 1, 1, 1, 1,
1.691084, 0.08000001, 1.346583, 1, 1, 1, 1, 1,
1.692661, 1.752173, 1.154975, 0, 0, 1, 1, 1,
1.6961, -0.4018896, 1.495934, 1, 0, 0, 1, 1,
1.699405, 0.2274573, 0.06873891, 1, 0, 0, 1, 1,
1.70378, -0.2623839, 2.626358, 1, 0, 0, 1, 1,
1.720965, -1.697935, 2.451636, 1, 0, 0, 1, 1,
1.726343, -2.538295, 2.382751, 1, 0, 0, 1, 1,
1.756804, -0.3631372, 2.643723, 0, 0, 0, 1, 1,
1.768361, -1.710691, 1.608846, 0, 0, 0, 1, 1,
1.802861, -0.8739787, 0.7197844, 0, 0, 0, 1, 1,
1.806097, 0.2642897, 2.274062, 0, 0, 0, 1, 1,
1.822901, 1.413381, -0.03580423, 0, 0, 0, 1, 1,
1.830617, -0.8316082, 3.129888, 0, 0, 0, 1, 1,
1.83611, 0.6043069, 2.216657, 0, 0, 0, 1, 1,
1.841385, -1.256634, 2.040997, 1, 1, 1, 1, 1,
1.845604, 0.03861307, 1.521594, 1, 1, 1, 1, 1,
1.848329, 0.4407365, 1.524484, 1, 1, 1, 1, 1,
1.852278, -0.4310337, 2.953873, 1, 1, 1, 1, 1,
1.85491, 1.324893, 0.2857794, 1, 1, 1, 1, 1,
1.875011, -0.7598186, 4.102852, 1, 1, 1, 1, 1,
1.875778, -1.504401, 1.115052, 1, 1, 1, 1, 1,
1.879147, -1.915363, 2.687288, 1, 1, 1, 1, 1,
1.884741, -0.7250757, 2.970236, 1, 1, 1, 1, 1,
1.91186, 0.09506212, 0.754724, 1, 1, 1, 1, 1,
1.915607, 0.2521763, 3.238252, 1, 1, 1, 1, 1,
1.952388, 0.2861531, 1.788109, 1, 1, 1, 1, 1,
1.957516, 0.1042167, 1.142738, 1, 1, 1, 1, 1,
1.999883, -0.5213023, 1.414472, 1, 1, 1, 1, 1,
2.011069, 0.6737893, 2.346047, 1, 1, 1, 1, 1,
2.06575, -1.57714, 2.762687, 0, 0, 1, 1, 1,
2.070447, 1.052431, -0.14083, 1, 0, 0, 1, 1,
2.105346, -0.1705203, 2.545123, 1, 0, 0, 1, 1,
2.120465, -1.324521, 3.104562, 1, 0, 0, 1, 1,
2.155599, -0.8004382, 2.996704, 1, 0, 0, 1, 1,
2.156522, -2.141051, 2.964196, 1, 0, 0, 1, 1,
2.191287, -2.265715, 3.223353, 0, 0, 0, 1, 1,
2.203488, -1.338019, 3.109748, 0, 0, 0, 1, 1,
2.237493, -0.8746706, 2.485758, 0, 0, 0, 1, 1,
2.336078, 0.1505054, 1.212073, 0, 0, 0, 1, 1,
2.343108, 1.150142, 1.010167, 0, 0, 0, 1, 1,
2.446697, -1.75459, 1.188615, 0, 0, 0, 1, 1,
2.489975, -2.294542, 3.429624, 0, 0, 0, 1, 1,
2.527201, 0.1465188, 1.558031, 1, 1, 1, 1, 1,
2.618874, -0.4012542, 2.491888, 1, 1, 1, 1, 1,
2.646546, 1.545235, -0.7911493, 1, 1, 1, 1, 1,
2.671456, 1.475244, 1.730765, 1, 1, 1, 1, 1,
2.951016, 1.048837, 0.903783, 1, 1, 1, 1, 1,
3.069332, 1.272231, -0.0389795, 1, 1, 1, 1, 1,
3.400704, 0.3421648, 0.7825376, 1, 1, 1, 1, 1
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
var radius = 9.342725;
var distance = 32.81593;
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
mvMatrix.translate( -0.0267539, 0.09184742, 0.03135586 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.81593);
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
