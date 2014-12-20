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
-3.173535, -0.5302173, -0.8442924, 1, 0, 0, 1,
-2.79705, 0.6482791, -0.5798303, 1, 0.007843138, 0, 1,
-2.571751, 0.1170691, -1.612387, 1, 0.01176471, 0, 1,
-2.478362, -1.503699, -1.96389, 1, 0.01960784, 0, 1,
-2.4376, 0.6992059, -1.503923, 1, 0.02352941, 0, 1,
-2.401601, 1.147063, -1.320022, 1, 0.03137255, 0, 1,
-2.382941, 0.1692373, -0.1577748, 1, 0.03529412, 0, 1,
-2.381414, -1.371781, -4.314402, 1, 0.04313726, 0, 1,
-2.34569, -0.7603224, -1.500787, 1, 0.04705882, 0, 1,
-2.309009, 0.188526, -1.236188, 1, 0.05490196, 0, 1,
-2.232006, -1.105536, -1.418839, 1, 0.05882353, 0, 1,
-2.230446, 1.799405, -0.6903887, 1, 0.06666667, 0, 1,
-2.207401, -1.479806, -2.937228, 1, 0.07058824, 0, 1,
-2.193343, -0.4018479, -2.271846, 1, 0.07843138, 0, 1,
-2.144089, 0.1458318, -1.528582, 1, 0.08235294, 0, 1,
-2.130462, -0.8548203, -2.466815, 1, 0.09019608, 0, 1,
-2.049052, 0.1782142, 0.4920235, 1, 0.09411765, 0, 1,
-1.971717, 0.7810655, -2.165953, 1, 0.1019608, 0, 1,
-1.970592, 1.007247, -0.6480268, 1, 0.1098039, 0, 1,
-1.96761, -1.427551, -1.071659, 1, 0.1137255, 0, 1,
-1.967567, 1.517631, 0.2576264, 1, 0.1215686, 0, 1,
-1.956878, 0.2152361, -2.178214, 1, 0.1254902, 0, 1,
-1.941236, 0.02920257, -1.384258, 1, 0.1333333, 0, 1,
-1.935794, -0.1885664, -2.184003, 1, 0.1372549, 0, 1,
-1.924893, -0.2820848, -1.911024, 1, 0.145098, 0, 1,
-1.923416, 0.7340879, -1.475212, 1, 0.1490196, 0, 1,
-1.916602, -0.5955484, -0.7563897, 1, 0.1568628, 0, 1,
-1.910475, -0.4918509, -0.8169727, 1, 0.1607843, 0, 1,
-1.909218, -0.5417491, -0.8932833, 1, 0.1686275, 0, 1,
-1.908273, -0.4173573, -3.960037, 1, 0.172549, 0, 1,
-1.897889, 0.0002077777, -2.184762, 1, 0.1803922, 0, 1,
-1.86483, 2.344148, 0.319178, 1, 0.1843137, 0, 1,
-1.863283, 1.309405, -2.125144, 1, 0.1921569, 0, 1,
-1.855347, 0.8221408, -2.166386, 1, 0.1960784, 0, 1,
-1.841963, 0.6349154, -2.277456, 1, 0.2039216, 0, 1,
-1.826269, -0.06489184, -1.166832, 1, 0.2117647, 0, 1,
-1.821281, -0.6698345, -1.958155, 1, 0.2156863, 0, 1,
-1.811106, -1.332103, -1.920477, 1, 0.2235294, 0, 1,
-1.803899, -0.6220695, -2.44521, 1, 0.227451, 0, 1,
-1.773773, -1.577311, 0.261262, 1, 0.2352941, 0, 1,
-1.730451, 0.6971319, -0.2125239, 1, 0.2392157, 0, 1,
-1.727919, 1.275508, -1.631866, 1, 0.2470588, 0, 1,
-1.727328, -0.01416245, -2.087102, 1, 0.2509804, 0, 1,
-1.725036, -0.2418692, -2.9044, 1, 0.2588235, 0, 1,
-1.718533, 1.116508, -0.7230396, 1, 0.2627451, 0, 1,
-1.717672, -0.4816519, -1.272093, 1, 0.2705882, 0, 1,
-1.706115, 1.291911, -2.983201, 1, 0.2745098, 0, 1,
-1.693924, -1.462939, -2.028251, 1, 0.282353, 0, 1,
-1.685041, -0.02780129, -2.927797, 1, 0.2862745, 0, 1,
-1.679172, 0.9301137, -2.033581, 1, 0.2941177, 0, 1,
-1.676595, -0.9947026, -2.565892, 1, 0.3019608, 0, 1,
-1.666466, -1.133845, -1.407701, 1, 0.3058824, 0, 1,
-1.649777, -1.050148, -1.485126, 1, 0.3137255, 0, 1,
-1.630633, 0.1417666, -1.624179, 1, 0.3176471, 0, 1,
-1.630481, 1.821375, -1.695555, 1, 0.3254902, 0, 1,
-1.629969, 3.041434, -1.085704, 1, 0.3294118, 0, 1,
-1.62914, -0.2379534, -1.72299, 1, 0.3372549, 0, 1,
-1.627497, 0.03723082, -0.8913626, 1, 0.3411765, 0, 1,
-1.623238, -1.026433, -2.723919, 1, 0.3490196, 0, 1,
-1.621555, -0.3476647, -1.918864, 1, 0.3529412, 0, 1,
-1.619087, 1.260167, 0.7494305, 1, 0.3607843, 0, 1,
-1.617875, -0.655293, -2.542406, 1, 0.3647059, 0, 1,
-1.607211, 0.3842745, -0.280431, 1, 0.372549, 0, 1,
-1.603707, -1.757728, -3.053106, 1, 0.3764706, 0, 1,
-1.60082, 0.7098196, -1.373544, 1, 0.3843137, 0, 1,
-1.599035, 0.7603755, -0.9823964, 1, 0.3882353, 0, 1,
-1.598382, -0.9572043, -3.736588, 1, 0.3960784, 0, 1,
-1.597869, -1.038371, -2.108037, 1, 0.4039216, 0, 1,
-1.552919, 1.397606, -2.226927, 1, 0.4078431, 0, 1,
-1.543934, -0.3718936, -2.185271, 1, 0.4156863, 0, 1,
-1.536481, 0.6807262, -1.300812, 1, 0.4196078, 0, 1,
-1.524187, 0.5657023, -1.087032, 1, 0.427451, 0, 1,
-1.519452, -0.7069138, -1.753782, 1, 0.4313726, 0, 1,
-1.513654, -0.09049074, -1.229009, 1, 0.4392157, 0, 1,
-1.512787, -0.474032, -1.563699, 1, 0.4431373, 0, 1,
-1.512322, 0.05321509, -1.692366, 1, 0.4509804, 0, 1,
-1.50783, -1.303096, -2.009937, 1, 0.454902, 0, 1,
-1.499853, -1.337517, -2.746128, 1, 0.4627451, 0, 1,
-1.4966, -0.2232786, -2.442142, 1, 0.4666667, 0, 1,
-1.491352, 0.8935105, -1.108312, 1, 0.4745098, 0, 1,
-1.48359, -1.886525, -1.513798, 1, 0.4784314, 0, 1,
-1.481872, 0.723552, -1.512197, 1, 0.4862745, 0, 1,
-1.481745, -0.4034953, -2.729394, 1, 0.4901961, 0, 1,
-1.477335, 0.3619994, -1.904615, 1, 0.4980392, 0, 1,
-1.473825, 0.2523743, -1.163448, 1, 0.5058824, 0, 1,
-1.459858, 0.1419156, -0.4094914, 1, 0.509804, 0, 1,
-1.45952, 0.6703314, -2.728355, 1, 0.5176471, 0, 1,
-1.456236, -0.3002662, -2.367012, 1, 0.5215687, 0, 1,
-1.445514, -1.441709, -1.644488, 1, 0.5294118, 0, 1,
-1.439539, 1.213442, -1.377188, 1, 0.5333334, 0, 1,
-1.436184, -0.6231316, -2.640844, 1, 0.5411765, 0, 1,
-1.409805, 0.04246328, -1.17024, 1, 0.5450981, 0, 1,
-1.407471, -0.5585676, -3.195072, 1, 0.5529412, 0, 1,
-1.393925, 1.370854, -2.578853, 1, 0.5568628, 0, 1,
-1.393306, -0.7997145, -2.848147, 1, 0.5647059, 0, 1,
-1.38917, 0.597839, -0.1919384, 1, 0.5686275, 0, 1,
-1.383068, -0.1701511, -4.114636, 1, 0.5764706, 0, 1,
-1.377028, -2.307474, -2.209645, 1, 0.5803922, 0, 1,
-1.363771, 0.7154613, -0.3693964, 1, 0.5882353, 0, 1,
-1.359935, -0.4960196, -3.160303, 1, 0.5921569, 0, 1,
-1.358399, 1.063842, -0.637287, 1, 0.6, 0, 1,
-1.346301, 0.2349003, -1.07915, 1, 0.6078432, 0, 1,
-1.336454, 0.598769, 1.046424, 1, 0.6117647, 0, 1,
-1.336146, 0.4498952, -1.967099, 1, 0.6196079, 0, 1,
-1.333157, -0.1954322, -1.361755, 1, 0.6235294, 0, 1,
-1.319434, -1.344278, -3.626589, 1, 0.6313726, 0, 1,
-1.31559, 0.9571469, -1.583996, 1, 0.6352941, 0, 1,
-1.303651, 0.3049285, -2.782841, 1, 0.6431373, 0, 1,
-1.294867, -1.074663, -2.138942, 1, 0.6470588, 0, 1,
-1.292536, 0.6280155, 1.883906, 1, 0.654902, 0, 1,
-1.291156, -1.350222, -2.671506, 1, 0.6588235, 0, 1,
-1.290248, 0.3605993, -1.254281, 1, 0.6666667, 0, 1,
-1.289104, -0.009384307, -0.5599139, 1, 0.6705883, 0, 1,
-1.282522, 1.462323, -0.68039, 1, 0.6784314, 0, 1,
-1.276944, 1.126516, -1.3135, 1, 0.682353, 0, 1,
-1.276706, -0.09523142, -0.9829564, 1, 0.6901961, 0, 1,
-1.274202, -0.4415607, -1.1252, 1, 0.6941177, 0, 1,
-1.262485, 1.828871, -1.276793, 1, 0.7019608, 0, 1,
-1.258019, -0.4189365, -1.238542, 1, 0.7098039, 0, 1,
-1.257438, -0.437125, -0.7989587, 1, 0.7137255, 0, 1,
-1.252722, -0.3214535, -1.852092, 1, 0.7215686, 0, 1,
-1.24264, 1.443294, -0.09390443, 1, 0.7254902, 0, 1,
-1.24224, 0.7019319, -1.336714, 1, 0.7333333, 0, 1,
-1.238401, 1.35499, -1.358462, 1, 0.7372549, 0, 1,
-1.236516, -0.622875, -2.146511, 1, 0.7450981, 0, 1,
-1.228773, 0.3153306, -2.465193, 1, 0.7490196, 0, 1,
-1.225528, 0.5933465, -1.604035, 1, 0.7568628, 0, 1,
-1.222893, 2.072005, -0.8454954, 1, 0.7607843, 0, 1,
-1.221502, 0.4420004, -0.1804025, 1, 0.7686275, 0, 1,
-1.220736, -0.2124312, -0.4273858, 1, 0.772549, 0, 1,
-1.208809, -1.031436, -3.639068, 1, 0.7803922, 0, 1,
-1.204644, 1.250985, -1.999363, 1, 0.7843137, 0, 1,
-1.202802, 1.087861, -0.4686215, 1, 0.7921569, 0, 1,
-1.202097, -0.9501339, -2.588231, 1, 0.7960784, 0, 1,
-1.195536, -2.324579, -2.615444, 1, 0.8039216, 0, 1,
-1.191269, -1.173669, -3.656698, 1, 0.8117647, 0, 1,
-1.189777, 0.7625557, -0.8146018, 1, 0.8156863, 0, 1,
-1.186966, -0.922253, -2.916862, 1, 0.8235294, 0, 1,
-1.185043, -0.7603711, -0.9957542, 1, 0.827451, 0, 1,
-1.154832, -0.1471782, -1.711572, 1, 0.8352941, 0, 1,
-1.141342, 0.1471822, -0.9604343, 1, 0.8392157, 0, 1,
-1.129178, 0.3531201, -1.289088, 1, 0.8470588, 0, 1,
-1.121546, -0.09328516, -0.2594574, 1, 0.8509804, 0, 1,
-1.120954, -0.8395275, -2.725276, 1, 0.8588235, 0, 1,
-1.112972, -0.4536414, -0.1442793, 1, 0.8627451, 0, 1,
-1.102332, -2.19615, -3.181451, 1, 0.8705882, 0, 1,
-1.098914, 0.6029969, -2.361144, 1, 0.8745098, 0, 1,
-1.094258, -0.5735751, -1.206658, 1, 0.8823529, 0, 1,
-1.087669, 0.8072916, -0.8103256, 1, 0.8862745, 0, 1,
-1.084557, -0.445035, -2.287354, 1, 0.8941177, 0, 1,
-1.081934, -0.4443329, -3.147453, 1, 0.8980392, 0, 1,
-1.072871, 1.53309, -2.238331, 1, 0.9058824, 0, 1,
-1.068526, -1.188935, -3.108849, 1, 0.9137255, 0, 1,
-1.057896, -0.6930645, -2.039145, 1, 0.9176471, 0, 1,
-1.054223, -0.08823529, -2.676705, 1, 0.9254902, 0, 1,
-1.053795, -3.463544, -2.649941, 1, 0.9294118, 0, 1,
-1.052817, -0.3057552, -1.421806, 1, 0.9372549, 0, 1,
-1.042706, -0.2592573, -1.052127, 1, 0.9411765, 0, 1,
-1.034418, -0.4483441, -0.5142246, 1, 0.9490196, 0, 1,
-1.032904, 0.6351522, -1.129153, 1, 0.9529412, 0, 1,
-1.032088, 0.2390971, -1.326194, 1, 0.9607843, 0, 1,
-1.031131, 0.3964188, -1.644185, 1, 0.9647059, 0, 1,
-1.025609, -2.013753, -3.166383, 1, 0.972549, 0, 1,
-1.024447, -1.098426, -1.395143, 1, 0.9764706, 0, 1,
-1.023589, 0.3721828, -1.079529, 1, 0.9843137, 0, 1,
-1.017655, 0.4466309, 0.5566092, 1, 0.9882353, 0, 1,
-1.012461, -0.07105541, -1.247442, 1, 0.9960784, 0, 1,
-1.011774, 0.7031053, -0.9776825, 0.9960784, 1, 0, 1,
-1.007796, -1.121542, -3.940946, 0.9921569, 1, 0, 1,
-1.005689, 0.0516667, -2.718287, 0.9843137, 1, 0, 1,
-1.002167, -1.986926, -2.812376, 0.9803922, 1, 0, 1,
-0.9980277, 1.413877, 0.8943814, 0.972549, 1, 0, 1,
-0.9971947, 1.469905, 0.1839581, 0.9686275, 1, 0, 1,
-0.9922263, -0.8252459, -0.9059045, 0.9607843, 1, 0, 1,
-0.985825, 1.167988, 0.05729655, 0.9568627, 1, 0, 1,
-0.9782022, 0.8744668, -2.399484, 0.9490196, 1, 0, 1,
-0.978176, -0.1650236, -1.978469, 0.945098, 1, 0, 1,
-0.971153, -1.102574, -3.164286, 0.9372549, 1, 0, 1,
-0.9694206, 0.5172597, -0.96014, 0.9333333, 1, 0, 1,
-0.9677048, 1.186404, 0.2929901, 0.9254902, 1, 0, 1,
-0.9665201, 0.1394786, -2.740589, 0.9215686, 1, 0, 1,
-0.9578131, -0.2362323, -1.663062, 0.9137255, 1, 0, 1,
-0.9472941, 1.055609, -0.242439, 0.9098039, 1, 0, 1,
-0.9466142, 1.430669, -2.050276, 0.9019608, 1, 0, 1,
-0.9460219, -0.3290895, -1.774555, 0.8941177, 1, 0, 1,
-0.9363288, 0.4981147, -0.131953, 0.8901961, 1, 0, 1,
-0.9216787, -0.5933214, -2.275395, 0.8823529, 1, 0, 1,
-0.9208875, 0.9035233, 0.6504961, 0.8784314, 1, 0, 1,
-0.9105763, 2.589906, 0.6497667, 0.8705882, 1, 0, 1,
-0.9072696, 1.351628, -1.96014, 0.8666667, 1, 0, 1,
-0.9064455, 0.3496709, 1.100871, 0.8588235, 1, 0, 1,
-0.9031253, -1.297634, -2.411633, 0.854902, 1, 0, 1,
-0.9028054, 0.7346372, -1.597678, 0.8470588, 1, 0, 1,
-0.898213, 0.993564, -1.258103, 0.8431373, 1, 0, 1,
-0.8975264, -1.359479, -2.444198, 0.8352941, 1, 0, 1,
-0.8972476, 1.153096, -1.142391, 0.8313726, 1, 0, 1,
-0.8889648, -1.453155, -1.904708, 0.8235294, 1, 0, 1,
-0.8874697, 2.195175, -0.6125759, 0.8196079, 1, 0, 1,
-0.8845372, -1.23568, -1.527363, 0.8117647, 1, 0, 1,
-0.8818614, -0.2833218, -1.469243, 0.8078431, 1, 0, 1,
-0.880262, 0.176951, -1.147729, 0.8, 1, 0, 1,
-0.880217, 0.7511744, -1.526284, 0.7921569, 1, 0, 1,
-0.8782029, -0.8524783, -1.864682, 0.7882353, 1, 0, 1,
-0.8754846, 0.02049275, -3.489992, 0.7803922, 1, 0, 1,
-0.8731248, -0.2911167, -2.437788, 0.7764706, 1, 0, 1,
-0.866511, -1.053271, -2.218229, 0.7686275, 1, 0, 1,
-0.8638582, 0.4829894, -0.8503293, 0.7647059, 1, 0, 1,
-0.862848, -0.6848068, -3.045603, 0.7568628, 1, 0, 1,
-0.8610086, 0.9998958, -1.332687, 0.7529412, 1, 0, 1,
-0.8582712, -1.203765, -1.303836, 0.7450981, 1, 0, 1,
-0.8548232, -0.7777913, -0.7446261, 0.7411765, 1, 0, 1,
-0.8547691, 0.2764054, -1.709472, 0.7333333, 1, 0, 1,
-0.8543239, 0.4873117, -0.5215415, 0.7294118, 1, 0, 1,
-0.8528625, -0.7457671, -2.140702, 0.7215686, 1, 0, 1,
-0.8451896, -0.2828618, -1.706427, 0.7176471, 1, 0, 1,
-0.8379644, 1.081195, 0.8186646, 0.7098039, 1, 0, 1,
-0.8355348, -0.02693017, -1.815585, 0.7058824, 1, 0, 1,
-0.8347331, 1.290519, 0.33435, 0.6980392, 1, 0, 1,
-0.8299202, -0.3041559, -1.634488, 0.6901961, 1, 0, 1,
-0.8288195, -1.231153, -2.507653, 0.6862745, 1, 0, 1,
-0.8280317, 0.7621678, 0.1059534, 0.6784314, 1, 0, 1,
-0.827916, 1.765168, 0.8907682, 0.6745098, 1, 0, 1,
-0.8271702, 0.8236621, -0.4671943, 0.6666667, 1, 0, 1,
-0.8253547, 0.5400346, 0.9968918, 0.6627451, 1, 0, 1,
-0.8188187, -0.7622718, -1.164233, 0.654902, 1, 0, 1,
-0.8131676, 0.6004296, 0.1134865, 0.6509804, 1, 0, 1,
-0.8108588, 0.3648284, -1.970507, 0.6431373, 1, 0, 1,
-0.810746, 0.2595583, -1.126786, 0.6392157, 1, 0, 1,
-0.8059906, -0.6570839, -3.0702, 0.6313726, 1, 0, 1,
-0.7967989, -0.7398298, -1.45417, 0.627451, 1, 0, 1,
-0.7932873, 0.4673124, -0.878163, 0.6196079, 1, 0, 1,
-0.7924299, -0.06536078, -1.7828, 0.6156863, 1, 0, 1,
-0.7843614, 0.1792567, -0.7451068, 0.6078432, 1, 0, 1,
-0.7744253, 0.5536728, -0.07328708, 0.6039216, 1, 0, 1,
-0.773406, 0.593371, -1.004041, 0.5960785, 1, 0, 1,
-0.7732279, -1.020962, -1.85289, 0.5882353, 1, 0, 1,
-0.7714313, -0.3811207, -1.778901, 0.5843138, 1, 0, 1,
-0.7651659, -0.8858435, 0.4706222, 0.5764706, 1, 0, 1,
-0.7642318, 0.3013765, -0.1663348, 0.572549, 1, 0, 1,
-0.7600101, 0.6442096, -2.453833, 0.5647059, 1, 0, 1,
-0.7583583, 1.981424, 1.170172, 0.5607843, 1, 0, 1,
-0.757372, -0.7748708, 0.4659911, 0.5529412, 1, 0, 1,
-0.7548386, -0.8454987, -0.7209892, 0.5490196, 1, 0, 1,
-0.7514156, 0.0992723, -0.8991045, 0.5411765, 1, 0, 1,
-0.7506802, 0.9839411, -2.035702, 0.5372549, 1, 0, 1,
-0.7435876, 1.005251, -2.04557, 0.5294118, 1, 0, 1,
-0.7434422, 0.9579126, -0.09067436, 0.5254902, 1, 0, 1,
-0.7396005, 0.47552, -1.74936, 0.5176471, 1, 0, 1,
-0.7390527, -1.248914, -3.053178, 0.5137255, 1, 0, 1,
-0.7283354, 0.3362176, -2.882791, 0.5058824, 1, 0, 1,
-0.7079737, -0.9642038, -2.603939, 0.5019608, 1, 0, 1,
-0.7070678, -1.160786, -1.981165, 0.4941176, 1, 0, 1,
-0.7033744, -0.9715476, -1.865069, 0.4862745, 1, 0, 1,
-0.7033027, -0.3411946, -2.763852, 0.4823529, 1, 0, 1,
-0.7007498, 0.5168714, -3.261748, 0.4745098, 1, 0, 1,
-0.6964306, -1.187744, -2.882647, 0.4705882, 1, 0, 1,
-0.6906309, -1.62129, -1.343833, 0.4627451, 1, 0, 1,
-0.6874119, -0.02512116, -1.35134, 0.4588235, 1, 0, 1,
-0.6847208, 1.493062, -0.5983115, 0.4509804, 1, 0, 1,
-0.6826512, -0.4620767, -3.588788, 0.4470588, 1, 0, 1,
-0.6773129, 0.6198541, -2.622612, 0.4392157, 1, 0, 1,
-0.6739137, -0.1840318, -1.906801, 0.4352941, 1, 0, 1,
-0.6724275, -0.734062, -2.144052, 0.427451, 1, 0, 1,
-0.6722205, -0.4112568, -1.076514, 0.4235294, 1, 0, 1,
-0.6722025, 2.07918, 1.281671, 0.4156863, 1, 0, 1,
-0.6674783, 0.3892991, -1.405048, 0.4117647, 1, 0, 1,
-0.6663949, -0.50412, -2.083013, 0.4039216, 1, 0, 1,
-0.6645429, -0.807282, -1.461484, 0.3960784, 1, 0, 1,
-0.6494697, 2.172181, -0.323058, 0.3921569, 1, 0, 1,
-0.6444514, -0.5131282, -2.783962, 0.3843137, 1, 0, 1,
-0.6416957, -0.8456791, -1.470845, 0.3803922, 1, 0, 1,
-0.6402913, -1.452801, -2.568069, 0.372549, 1, 0, 1,
-0.634417, -0.6190709, -3.072354, 0.3686275, 1, 0, 1,
-0.6319758, 0.494612, 0.46466, 0.3607843, 1, 0, 1,
-0.6238192, -0.1442863, -2.06695, 0.3568628, 1, 0, 1,
-0.6173332, -0.01999884, -0.6153131, 0.3490196, 1, 0, 1,
-0.6157574, 0.3750364, -1.517992, 0.345098, 1, 0, 1,
-0.615474, 1.013995, -1.820544, 0.3372549, 1, 0, 1,
-0.6152467, -0.09032831, -1.792102, 0.3333333, 1, 0, 1,
-0.614244, 0.5872417, -0.2379993, 0.3254902, 1, 0, 1,
-0.6134018, -1.6906, -2.982175, 0.3215686, 1, 0, 1,
-0.613009, -0.5697636, -1.063034, 0.3137255, 1, 0, 1,
-0.612617, 2.191117, -0.145507, 0.3098039, 1, 0, 1,
-0.6121921, -1.561066, -2.583639, 0.3019608, 1, 0, 1,
-0.6046291, -1.178284, -4.840924, 0.2941177, 1, 0, 1,
-0.6013249, -0.324673, -1.646604, 0.2901961, 1, 0, 1,
-0.5958762, 0.03766974, -2.840101, 0.282353, 1, 0, 1,
-0.5954512, -0.222713, -1.810113, 0.2784314, 1, 0, 1,
-0.5937652, 0.6769534, -0.4327775, 0.2705882, 1, 0, 1,
-0.5929253, 0.5989213, -0.2432651, 0.2666667, 1, 0, 1,
-0.5920349, -0.3424516, -2.609869, 0.2588235, 1, 0, 1,
-0.5909808, 0.1754909, -1.61044, 0.254902, 1, 0, 1,
-0.5904611, 1.134349, 1.644342, 0.2470588, 1, 0, 1,
-0.5854203, 0.2267028, -1.102614, 0.2431373, 1, 0, 1,
-0.5850366, 0.009123516, -1.686341, 0.2352941, 1, 0, 1,
-0.5777144, -0.1796481, -2.726587, 0.2313726, 1, 0, 1,
-0.5735816, 1.457543, -0.4624051, 0.2235294, 1, 0, 1,
-0.5712222, 0.2661469, -0.4037635, 0.2196078, 1, 0, 1,
-0.5649896, 0.2858216, -1.958799, 0.2117647, 1, 0, 1,
-0.5622987, -1.173185, -2.342618, 0.2078431, 1, 0, 1,
-0.5609536, -1.753709, -2.185738, 0.2, 1, 0, 1,
-0.5585379, 1.584093, 0.07585526, 0.1921569, 1, 0, 1,
-0.5487731, -0.5991258, -3.040822, 0.1882353, 1, 0, 1,
-0.5459077, 0.6059855, -0.2734289, 0.1803922, 1, 0, 1,
-0.5447867, -1.719678, -3.1666, 0.1764706, 1, 0, 1,
-0.5435385, 1.969757, -1.366878, 0.1686275, 1, 0, 1,
-0.5380231, 0.6297709, -0.5526545, 0.1647059, 1, 0, 1,
-0.5372803, 1.338535, -0.8500827, 0.1568628, 1, 0, 1,
-0.5339624, 1.297281, 1.739264, 0.1529412, 1, 0, 1,
-0.5300046, -0.3039548, -3.613909, 0.145098, 1, 0, 1,
-0.5292077, -0.7745075, -4.140831, 0.1411765, 1, 0, 1,
-0.5289258, 1.381718, -0.4271196, 0.1333333, 1, 0, 1,
-0.5260557, 0.6763955, -0.6722578, 0.1294118, 1, 0, 1,
-0.519215, 0.5276883, -2.145406, 0.1215686, 1, 0, 1,
-0.5131321, -0.0925277, -1.62806, 0.1176471, 1, 0, 1,
-0.5108484, 1.768572, 0.3738796, 0.1098039, 1, 0, 1,
-0.5105987, 1.812088, -0.8969596, 0.1058824, 1, 0, 1,
-0.5091718, -1.493475, -1.170102, 0.09803922, 1, 0, 1,
-0.5086586, -0.8917884, -1.339599, 0.09019608, 1, 0, 1,
-0.503053, 0.4694596, -3.035906, 0.08627451, 1, 0, 1,
-0.5024608, -0.2406752, -2.066505, 0.07843138, 1, 0, 1,
-0.4990547, -0.4749599, -2.37152, 0.07450981, 1, 0, 1,
-0.4981447, 0.5202026, -0.302482, 0.06666667, 1, 0, 1,
-0.4958858, -1.406624, -1.402684, 0.0627451, 1, 0, 1,
-0.4940423, -0.002039745, -2.251379, 0.05490196, 1, 0, 1,
-0.4937368, -0.3646505, -0.08593616, 0.05098039, 1, 0, 1,
-0.4935818, -1.080977, -0.8419931, 0.04313726, 1, 0, 1,
-0.4932465, -1.113445, -2.531426, 0.03921569, 1, 0, 1,
-0.4924628, -0.1244882, -1.867367, 0.03137255, 1, 0, 1,
-0.4924458, 0.0156165, -1.793042, 0.02745098, 1, 0, 1,
-0.4842581, 0.9486358, -0.2240678, 0.01960784, 1, 0, 1,
-0.4827439, 0.3345935, -1.890647, 0.01568628, 1, 0, 1,
-0.4796675, -0.3131666, -2.852389, 0.007843138, 1, 0, 1,
-0.4772187, 0.2078555, -2.509084, 0.003921569, 1, 0, 1,
-0.4719389, 0.8007621, 0.9540564, 0, 1, 0.003921569, 1,
-0.4710815, 0.2799763, -1.272208, 0, 1, 0.01176471, 1,
-0.4705056, 1.029724, 0.02614168, 0, 1, 0.01568628, 1,
-0.4693542, -0.1249218, -2.642886, 0, 1, 0.02352941, 1,
-0.4607282, 0.3486063, 0.1754762, 0, 1, 0.02745098, 1,
-0.456357, 0.3354309, -0.7324248, 0, 1, 0.03529412, 1,
-0.4526556, 1.075685, -0.6722765, 0, 1, 0.03921569, 1,
-0.4490761, -0.5621316, -2.154299, 0, 1, 0.04705882, 1,
-0.4443155, -0.2713726, -0.5537953, 0, 1, 0.05098039, 1,
-0.4410625, 0.3320529, -1.229026, 0, 1, 0.05882353, 1,
-0.4409477, -0.5826818, -1.727232, 0, 1, 0.0627451, 1,
-0.4397847, 0.7330465, -1.062042, 0, 1, 0.07058824, 1,
-0.4349703, -1.087572, -3.369552, 0, 1, 0.07450981, 1,
-0.4293497, 0.2611195, -0.6053094, 0, 1, 0.08235294, 1,
-0.4269769, 0.6883723, 0.4181571, 0, 1, 0.08627451, 1,
-0.426404, -1.404477, -3.922436, 0, 1, 0.09411765, 1,
-0.4242761, 0.1017781, -0.169621, 0, 1, 0.1019608, 1,
-0.4219166, 0.414294, -0.4851802, 0, 1, 0.1058824, 1,
-0.4183433, 1.26977, -1.157879, 0, 1, 0.1137255, 1,
-0.4122579, 0.2777472, 0.8512868, 0, 1, 0.1176471, 1,
-0.4028677, 1.014578, -2.120702, 0, 1, 0.1254902, 1,
-0.3997937, -0.03135108, -1.017771, 0, 1, 0.1294118, 1,
-0.3948666, -0.2653142, -0.8700579, 0, 1, 0.1372549, 1,
-0.3918239, 0.4315027, -1.725103, 0, 1, 0.1411765, 1,
-0.3909183, 0.05921661, -0.6634605, 0, 1, 0.1490196, 1,
-0.3885657, 0.4136614, -0.7794863, 0, 1, 0.1529412, 1,
-0.3859699, 0.229386, -0.6568985, 0, 1, 0.1607843, 1,
-0.380398, 1.490465, 0.5178093, 0, 1, 0.1647059, 1,
-0.3740075, -1.721819, -1.370555, 0, 1, 0.172549, 1,
-0.3722758, 0.2538365, -1.906575, 0, 1, 0.1764706, 1,
-0.3711573, -0.4103592, -0.9409007, 0, 1, 0.1843137, 1,
-0.3710656, 0.2764957, 1.28633, 0, 1, 0.1882353, 1,
-0.3697049, 0.5532619, -1.162967, 0, 1, 0.1960784, 1,
-0.363504, -3.043293, -1.938987, 0, 1, 0.2039216, 1,
-0.3616335, -2.017705, -2.893716, 0, 1, 0.2078431, 1,
-0.3606731, -1.714956, -3.46852, 0, 1, 0.2156863, 1,
-0.3540361, 0.6347397, -0.7543774, 0, 1, 0.2196078, 1,
-0.3536675, -0.4781692, -2.806891, 0, 1, 0.227451, 1,
-0.3510913, 0.0420412, 0.09612339, 0, 1, 0.2313726, 1,
-0.3507323, 0.2760229, -0.8887057, 0, 1, 0.2392157, 1,
-0.3463765, -2.888801, -2.528678, 0, 1, 0.2431373, 1,
-0.3403294, 1.330008, -1.570649, 0, 1, 0.2509804, 1,
-0.3342761, 1.29183, -0.9296453, 0, 1, 0.254902, 1,
-0.3290006, -1.6223, -1.658831, 0, 1, 0.2627451, 1,
-0.3265969, -0.7195113, -0.8017436, 0, 1, 0.2666667, 1,
-0.3261646, -0.06070007, -2.538416, 0, 1, 0.2745098, 1,
-0.3230511, -0.5127302, -2.438358, 0, 1, 0.2784314, 1,
-0.3225259, 1.580085, 0.3248543, 0, 1, 0.2862745, 1,
-0.3223698, -0.9910405, -3.373727, 0, 1, 0.2901961, 1,
-0.3158982, -0.7356013, -3.325464, 0, 1, 0.2980392, 1,
-0.3134477, 0.4800836, -0.9890875, 0, 1, 0.3058824, 1,
-0.3112769, -0.4133241, -2.541464, 0, 1, 0.3098039, 1,
-0.3092684, -0.09462688, -0.6639056, 0, 1, 0.3176471, 1,
-0.3036273, 0.4841648, -1.40015, 0, 1, 0.3215686, 1,
-0.3030582, 0.2096196, -0.7344775, 0, 1, 0.3294118, 1,
-0.3027459, 0.7700281, -0.03835577, 0, 1, 0.3333333, 1,
-0.3001797, -0.7582577, -3.610339, 0, 1, 0.3411765, 1,
-0.2970403, 0.4627794, 0.5326633, 0, 1, 0.345098, 1,
-0.2949589, -0.3227598, -0.6688013, 0, 1, 0.3529412, 1,
-0.2924107, 0.8747395, 1.266143, 0, 1, 0.3568628, 1,
-0.2891699, -2.441486, -4.434345, 0, 1, 0.3647059, 1,
-0.287803, 1.468358, -0.08219827, 0, 1, 0.3686275, 1,
-0.2836124, 0.8606996, 0.1015533, 0, 1, 0.3764706, 1,
-0.2829178, -0.2236642, -2.676453, 0, 1, 0.3803922, 1,
-0.2808238, -1.015817, -2.543707, 0, 1, 0.3882353, 1,
-0.2738919, 0.2648391, 0.1921968, 0, 1, 0.3921569, 1,
-0.2733, 0.229404, -0.7655413, 0, 1, 0.4, 1,
-0.2701529, 1.194409, 0.8573503, 0, 1, 0.4078431, 1,
-0.2684628, 0.03241327, -2.117764, 0, 1, 0.4117647, 1,
-0.262383, -0.6063499, -2.413087, 0, 1, 0.4196078, 1,
-0.2605824, 1.841007, -0.3233302, 0, 1, 0.4235294, 1,
-0.2585833, 0.03202352, -2.369351, 0, 1, 0.4313726, 1,
-0.2540541, 1.873697, -0.9725575, 0, 1, 0.4352941, 1,
-0.2529862, 1.552392, -0.021368, 0, 1, 0.4431373, 1,
-0.2519643, 0.2470301, -2.070275, 0, 1, 0.4470588, 1,
-0.2508522, -0.09990089, -2.284545, 0, 1, 0.454902, 1,
-0.2447664, 1.067937, -0.4785229, 0, 1, 0.4588235, 1,
-0.244287, 2.27263, 0.2697713, 0, 1, 0.4666667, 1,
-0.2384502, 0.1136062, -1.65036, 0, 1, 0.4705882, 1,
-0.237748, 0.4743572, 0.6319008, 0, 1, 0.4784314, 1,
-0.2367999, 2.652873, -0.4629031, 0, 1, 0.4823529, 1,
-0.2326198, 0.3799631, 1.007495, 0, 1, 0.4901961, 1,
-0.231067, -0.4584205, -2.363664, 0, 1, 0.4941176, 1,
-0.2301346, 0.4170299, -1.046521, 0, 1, 0.5019608, 1,
-0.2288073, 1.095406, 1.543331, 0, 1, 0.509804, 1,
-0.2283553, 0.04805356, -3.034682, 0, 1, 0.5137255, 1,
-0.226707, -0.6888242, -4.166619, 0, 1, 0.5215687, 1,
-0.2252234, -1.114414, -3.658177, 0, 1, 0.5254902, 1,
-0.2243366, -1.792151, -2.711013, 0, 1, 0.5333334, 1,
-0.2243066, -0.5478472, -2.904616, 0, 1, 0.5372549, 1,
-0.2182568, 0.0892236, -2.696391, 0, 1, 0.5450981, 1,
-0.2158933, 0.2460407, -0.4021374, 0, 1, 0.5490196, 1,
-0.2115901, 2.616606, 1.028839, 0, 1, 0.5568628, 1,
-0.2110601, -0.3616047, -0.1034559, 0, 1, 0.5607843, 1,
-0.2101752, -0.29734, -2.052911, 0, 1, 0.5686275, 1,
-0.2048156, 0.138935, -1.52069, 0, 1, 0.572549, 1,
-0.1955473, -2.615884, -3.345168, 0, 1, 0.5803922, 1,
-0.1911113, 1.327877, 0.5820054, 0, 1, 0.5843138, 1,
-0.1901706, -0.511457, -3.495243, 0, 1, 0.5921569, 1,
-0.1898244, 2.802871, 0.4269408, 0, 1, 0.5960785, 1,
-0.1895581, 1.241541, -1.237319, 0, 1, 0.6039216, 1,
-0.1860213, -1.487621, -2.674877, 0, 1, 0.6117647, 1,
-0.1850788, -0.4652959, -0.7519245, 0, 1, 0.6156863, 1,
-0.1819769, -0.9811349, -5.206689, 0, 1, 0.6235294, 1,
-0.1813217, -0.1257206, -2.539891, 0, 1, 0.627451, 1,
-0.1808724, 1.663092, 0.2822685, 0, 1, 0.6352941, 1,
-0.1806961, -0.5129687, -1.837088, 0, 1, 0.6392157, 1,
-0.180654, 0.8766253, 0.3587519, 0, 1, 0.6470588, 1,
-0.1780832, 0.7325844, -1.963103, 0, 1, 0.6509804, 1,
-0.1765411, 0.4531678, -0.6373117, 0, 1, 0.6588235, 1,
-0.1753062, 0.4383957, -1.046144, 0, 1, 0.6627451, 1,
-0.1700711, -0.5143346, -2.875616, 0, 1, 0.6705883, 1,
-0.1683838, 0.6030626, -0.0399425, 0, 1, 0.6745098, 1,
-0.1626015, -0.9980928, -4.294104, 0, 1, 0.682353, 1,
-0.1608644, -0.8572093, -3.157023, 0, 1, 0.6862745, 1,
-0.1567169, 0.854732, 0.354825, 0, 1, 0.6941177, 1,
-0.1535281, 0.01075631, -1.367941, 0, 1, 0.7019608, 1,
-0.1510611, 0.02080568, -0.2339643, 0, 1, 0.7058824, 1,
-0.150887, 0.1641433, -1.722214, 0, 1, 0.7137255, 1,
-0.1488432, 0.3348237, -0.6403608, 0, 1, 0.7176471, 1,
-0.1476326, -0.421413, -3.722528, 0, 1, 0.7254902, 1,
-0.1447015, 0.4576316, -0.467899, 0, 1, 0.7294118, 1,
-0.1410646, 0.4023206, -0.4703458, 0, 1, 0.7372549, 1,
-0.1379295, 0.7726256, -0.3661499, 0, 1, 0.7411765, 1,
-0.137159, 0.4899252, -1.379776, 0, 1, 0.7490196, 1,
-0.1364576, -2.017006, -3.259177, 0, 1, 0.7529412, 1,
-0.1345652, 0.6978444, 1.364209, 0, 1, 0.7607843, 1,
-0.132215, 0.8872033, -1.093623, 0, 1, 0.7647059, 1,
-0.1311546, 0.4881277, -1.253353, 0, 1, 0.772549, 1,
-0.1311103, -0.3279645, -0.9899091, 0, 1, 0.7764706, 1,
-0.127134, 1.159183, -0.8179393, 0, 1, 0.7843137, 1,
-0.1230583, 0.697616, -1.116226, 0, 1, 0.7882353, 1,
-0.121531, -1.205246, -1.193429, 0, 1, 0.7960784, 1,
-0.1194197, 0.09180685, -1.714557, 0, 1, 0.8039216, 1,
-0.1160098, -1.371131, -4.158761, 0, 1, 0.8078431, 1,
-0.1151391, -0.1763429, -0.6215945, 0, 1, 0.8156863, 1,
-0.107517, -0.2111425, -3.182606, 0, 1, 0.8196079, 1,
-0.1045595, 1.343447, 0.3866115, 0, 1, 0.827451, 1,
-0.1006341, -0.3559583, -4.875392, 0, 1, 0.8313726, 1,
-0.0967106, -0.04044778, -1.907959, 0, 1, 0.8392157, 1,
-0.09610361, -0.1273053, -2.257549, 0, 1, 0.8431373, 1,
-0.09526697, -0.8826246, -3.542149, 0, 1, 0.8509804, 1,
-0.09301136, 1.414702, 0.8348522, 0, 1, 0.854902, 1,
-0.08464736, 1.621681, 0.4748452, 0, 1, 0.8627451, 1,
-0.07843586, 0.4908561, 1.548282, 0, 1, 0.8666667, 1,
-0.07114782, 0.7991002, 0.0955556, 0, 1, 0.8745098, 1,
-0.0702965, 1.961903, 1.962135, 0, 1, 0.8784314, 1,
-0.06648023, -1.235905, -3.78016, 0, 1, 0.8862745, 1,
-0.06275117, 1.415928, -1.793013, 0, 1, 0.8901961, 1,
-0.06251091, 1.278014, 0.666048, 0, 1, 0.8980392, 1,
-0.06219188, 0.1491537, -0.5133444, 0, 1, 0.9058824, 1,
-0.05967272, 0.1868421, 0.7068508, 0, 1, 0.9098039, 1,
-0.05778442, 0.356671, 0.1008905, 0, 1, 0.9176471, 1,
-0.05640071, 0.1888476, -1.56448, 0, 1, 0.9215686, 1,
-0.05623949, 0.3848865, 0.471777, 0, 1, 0.9294118, 1,
-0.05521961, 1.769158, -3.291813, 0, 1, 0.9333333, 1,
-0.04669035, -1.588332, -2.321121, 0, 1, 0.9411765, 1,
-0.04650889, -0.3425239, -4.119321, 0, 1, 0.945098, 1,
-0.04387131, -0.5007685, -3.582146, 0, 1, 0.9529412, 1,
-0.04091372, 0.003222923, -1.700619, 0, 1, 0.9568627, 1,
-0.03708129, 0.5717643, -1.410349, 0, 1, 0.9647059, 1,
-0.03526425, -0.4888466, -1.766514, 0, 1, 0.9686275, 1,
-0.03369119, -0.8602144, -2.434083, 0, 1, 0.9764706, 1,
-0.03006943, -0.1409202, -3.270526, 0, 1, 0.9803922, 1,
-0.02896187, -1.817557, -4.104086, 0, 1, 0.9882353, 1,
-0.02630444, 1.124355, -0.2038111, 0, 1, 0.9921569, 1,
-0.01412957, -2.18614, -1.976737, 0, 1, 1, 1,
-0.01368973, 1.412297, 0.2940634, 0, 0.9921569, 1, 1,
-0.01271173, 1.696952, -0.777319, 0, 0.9882353, 1, 1,
-0.01066931, -0.9555736, -2.687767, 0, 0.9803922, 1, 1,
-0.01066775, 1.223105, -0.1430835, 0, 0.9764706, 1, 1,
-0.01017013, 1.435866, 1.363415, 0, 0.9686275, 1, 1,
-0.01006121, -1.127381, -2.980651, 0, 0.9647059, 1, 1,
-0.00662687, 1.056758, 0.1236691, 0, 0.9568627, 1, 1,
-0.001496204, -0.4915335, -4.823737, 0, 0.9529412, 1, 1,
-0.0004811814, -1.069098, -2.621279, 0, 0.945098, 1, 1,
-0.0003600349, 0.3028118, 0.0160834, 0, 0.9411765, 1, 1,
0.00310966, 0.2185489, 0.3674265, 0, 0.9333333, 1, 1,
0.007723709, -0.07151747, 2.154232, 0, 0.9294118, 1, 1,
0.01015502, 0.4108731, -1.9386, 0, 0.9215686, 1, 1,
0.01551702, -0.9851236, 6.421369, 0, 0.9176471, 1, 1,
0.02213102, -0.2936535, 2.869384, 0, 0.9098039, 1, 1,
0.02332508, -0.2575371, 2.560456, 0, 0.9058824, 1, 1,
0.02449525, -1.359283, 3.469716, 0, 0.8980392, 1, 1,
0.03125278, -2.682025, 3.43339, 0, 0.8901961, 1, 1,
0.03284254, 0.1165705, 1.503781, 0, 0.8862745, 1, 1,
0.03554009, -0.7377573, 2.18056, 0, 0.8784314, 1, 1,
0.03734806, 0.8872959, -0.4746218, 0, 0.8745098, 1, 1,
0.04016586, -1.841806, 2.428846, 0, 0.8666667, 1, 1,
0.04303298, 0.3050787, -0.2483784, 0, 0.8627451, 1, 1,
0.0458366, -0.9442128, 4.249743, 0, 0.854902, 1, 1,
0.05468838, -0.6279171, 2.915262, 0, 0.8509804, 1, 1,
0.0569829, 0.676642, 1.069179, 0, 0.8431373, 1, 1,
0.05940574, -0.1302166, 1.739146, 0, 0.8392157, 1, 1,
0.06052883, 0.2276419, 0.02902536, 0, 0.8313726, 1, 1,
0.06327789, -0.4104437, 2.983826, 0, 0.827451, 1, 1,
0.06464498, 1.448122, -0.7719341, 0, 0.8196079, 1, 1,
0.06608782, 0.5086057, 0.06671879, 0, 0.8156863, 1, 1,
0.06857554, 0.128407, 0.389705, 0, 0.8078431, 1, 1,
0.06864014, -1.991973, 3.474699, 0, 0.8039216, 1, 1,
0.06988227, 0.09643354, -0.4459329, 0, 0.7960784, 1, 1,
0.07268378, -1.986632, 3.571535, 0, 0.7882353, 1, 1,
0.07443036, 1.333043, 0.3263005, 0, 0.7843137, 1, 1,
0.07705444, 1.759059, -0.1008117, 0, 0.7764706, 1, 1,
0.07778339, 0.005049777, 1.519694, 0, 0.772549, 1, 1,
0.07940453, -1.281365, 2.439723, 0, 0.7647059, 1, 1,
0.08209117, 1.476522, 1.576731, 0, 0.7607843, 1, 1,
0.08685561, 0.6813431, -0.3340583, 0, 0.7529412, 1, 1,
0.09162222, 0.6921757, -0.6101593, 0, 0.7490196, 1, 1,
0.1058069, 0.3809052, -0.610988, 0, 0.7411765, 1, 1,
0.1062027, -0.1723359, 3.035014, 0, 0.7372549, 1, 1,
0.1169327, 0.9167203, 1.166019, 0, 0.7294118, 1, 1,
0.1183425, -0.1477668, 0.8713219, 0, 0.7254902, 1, 1,
0.1211111, -0.04756357, 1.660792, 0, 0.7176471, 1, 1,
0.1253161, 0.6573316, 1.18327, 0, 0.7137255, 1, 1,
0.1256935, 0.6537501, 0.9048753, 0, 0.7058824, 1, 1,
0.1268798, 0.2275487, 0.172509, 0, 0.6980392, 1, 1,
0.1277751, 1.63718, 0.09779464, 0, 0.6941177, 1, 1,
0.1280447, 0.6955069, -0.5722729, 0, 0.6862745, 1, 1,
0.1324879, 1.291475, -0.6848672, 0, 0.682353, 1, 1,
0.1326494, -0.4357432, 2.809519, 0, 0.6745098, 1, 1,
0.1333763, -1.691897, 2.971988, 0, 0.6705883, 1, 1,
0.1372706, -0.36948, 2.235661, 0, 0.6627451, 1, 1,
0.1374517, 1.169937, 0.307079, 0, 0.6588235, 1, 1,
0.1397581, -0.437258, 3.275644, 0, 0.6509804, 1, 1,
0.1406252, 0.7412064, 0.4839349, 0, 0.6470588, 1, 1,
0.1406433, 0.9443534, 0.6272929, 0, 0.6392157, 1, 1,
0.1412562, -0.6896319, 4.480988, 0, 0.6352941, 1, 1,
0.1414414, -1.527712, 2.476818, 0, 0.627451, 1, 1,
0.1433146, -0.2611185, 3.212031, 0, 0.6235294, 1, 1,
0.1496627, -0.277275, 3.399581, 0, 0.6156863, 1, 1,
0.15006, 0.4189922, 0.4409942, 0, 0.6117647, 1, 1,
0.1565412, 0.3329853, -0.5695338, 0, 0.6039216, 1, 1,
0.1590583, -0.3066201, 2.923383, 0, 0.5960785, 1, 1,
0.1617119, 0.382203, 2.009187, 0, 0.5921569, 1, 1,
0.1642542, 0.4115152, -0.3624853, 0, 0.5843138, 1, 1,
0.1652363, -0.5238704, 2.349701, 0, 0.5803922, 1, 1,
0.1655993, -1.229179, 3.147207, 0, 0.572549, 1, 1,
0.1660634, 0.9761009, -0.4940744, 0, 0.5686275, 1, 1,
0.1673979, -1.366517, 1.25565, 0, 0.5607843, 1, 1,
0.1703831, -0.3490309, 3.841377, 0, 0.5568628, 1, 1,
0.1774189, 0.9318219, 0.08002388, 0, 0.5490196, 1, 1,
0.1793436, -1.981101, 3.958576, 0, 0.5450981, 1, 1,
0.1832058, -0.4804591, 3.628373, 0, 0.5372549, 1, 1,
0.1837867, 1.396581, 0.5593063, 0, 0.5333334, 1, 1,
0.1847717, -0.5783238, 3.731622, 0, 0.5254902, 1, 1,
0.189774, 0.8274059, -0.4776123, 0, 0.5215687, 1, 1,
0.1903779, -0.4791715, 1.869437, 0, 0.5137255, 1, 1,
0.1998174, 1.164751, 0.6453131, 0, 0.509804, 1, 1,
0.2021996, -0.6438758, 2.502916, 0, 0.5019608, 1, 1,
0.2054555, -0.08441617, 2.64415, 0, 0.4941176, 1, 1,
0.209531, 1.42767, 0.01752718, 0, 0.4901961, 1, 1,
0.2133765, 0.3137381, 0.2853077, 0, 0.4823529, 1, 1,
0.2133834, 0.1743253, -1.788379, 0, 0.4784314, 1, 1,
0.2177313, -1.071487, 3.610881, 0, 0.4705882, 1, 1,
0.2235814, -1.345003, 4.016944, 0, 0.4666667, 1, 1,
0.2242879, 0.2298527, 0.2037224, 0, 0.4588235, 1, 1,
0.2247065, 2.837379, -0.2717392, 0, 0.454902, 1, 1,
0.2273661, -0.4635648, 2.951143, 0, 0.4470588, 1, 1,
0.2292739, -0.4180952, 2.89385, 0, 0.4431373, 1, 1,
0.2313154, 0.7875198, 0.958963, 0, 0.4352941, 1, 1,
0.232245, -1.451391, 3.45506, 0, 0.4313726, 1, 1,
0.234319, -0.421571, 2.456894, 0, 0.4235294, 1, 1,
0.2346686, -0.06319276, 2.905356, 0, 0.4196078, 1, 1,
0.2349646, -0.4508001, 2.385631, 0, 0.4117647, 1, 1,
0.2351038, 0.2255938, 0.3945061, 0, 0.4078431, 1, 1,
0.2441132, -0.5793576, 3.917141, 0, 0.4, 1, 1,
0.2480459, 0.4328526, 0.1483521, 0, 0.3921569, 1, 1,
0.2485068, 0.9372148, 0.1471599, 0, 0.3882353, 1, 1,
0.2519735, 1.071543, 0.601857, 0, 0.3803922, 1, 1,
0.2552303, -2.205001, 2.693884, 0, 0.3764706, 1, 1,
0.2556156, 0.8882291, -0.5527321, 0, 0.3686275, 1, 1,
0.2679605, 0.3348471, 0.9672886, 0, 0.3647059, 1, 1,
0.2685792, 0.9433513, -0.8739474, 0, 0.3568628, 1, 1,
0.2706522, -1.918479, 2.936162, 0, 0.3529412, 1, 1,
0.2792751, -0.8469104, 2.609891, 0, 0.345098, 1, 1,
0.2807673, -1.497441, 3.91366, 0, 0.3411765, 1, 1,
0.2824574, 0.3424341, 1.469801, 0, 0.3333333, 1, 1,
0.2840782, -0.05504061, 0.526584, 0, 0.3294118, 1, 1,
0.2876931, -1.460198, 3.23542, 0, 0.3215686, 1, 1,
0.2883204, -1.356008, 4.444777, 0, 0.3176471, 1, 1,
0.288451, 0.1494541, 0.6204636, 0, 0.3098039, 1, 1,
0.2891086, -0.434715, 4.416729, 0, 0.3058824, 1, 1,
0.2945171, 1.090261, -1.139921, 0, 0.2980392, 1, 1,
0.2951536, -0.44241, 0.2703389, 0, 0.2901961, 1, 1,
0.299087, -0.5050512, 0.7650343, 0, 0.2862745, 1, 1,
0.2996505, 0.4017278, -1.046785, 0, 0.2784314, 1, 1,
0.3028291, -0.5602144, 0.9481932, 0, 0.2745098, 1, 1,
0.3038853, -0.04932265, 1.650975, 0, 0.2666667, 1, 1,
0.3095775, 0.2127648, 0.6702924, 0, 0.2627451, 1, 1,
0.311602, -1.324123, 2.809295, 0, 0.254902, 1, 1,
0.3118003, 0.02843419, 1.690511, 0, 0.2509804, 1, 1,
0.3161503, -0.2408758, 2.734568, 0, 0.2431373, 1, 1,
0.3169574, -1.892338, 4.048289, 0, 0.2392157, 1, 1,
0.3174123, -0.2296601, 2.995106, 0, 0.2313726, 1, 1,
0.3176501, 0.3758618, 0.7848444, 0, 0.227451, 1, 1,
0.317881, -1.620823, 3.000927, 0, 0.2196078, 1, 1,
0.3188338, -0.1698574, 1.730459, 0, 0.2156863, 1, 1,
0.3208356, 0.06903208, 1.934463, 0, 0.2078431, 1, 1,
0.3317606, -0.1290175, 1.361526, 0, 0.2039216, 1, 1,
0.3333367, -0.5155321, 2.048525, 0, 0.1960784, 1, 1,
0.3340927, 0.2454029, -0.7748384, 0, 0.1882353, 1, 1,
0.336498, 1.154003, 0.6220568, 0, 0.1843137, 1, 1,
0.3422998, 0.3527322, -0.4541568, 0, 0.1764706, 1, 1,
0.3456023, 0.5538596, -0.7201436, 0, 0.172549, 1, 1,
0.3478473, -0.6483537, 2.049435, 0, 0.1647059, 1, 1,
0.3503202, 0.08275589, 0.638245, 0, 0.1607843, 1, 1,
0.3526329, 0.552039, 0.4793666, 0, 0.1529412, 1, 1,
0.3534751, -0.8198217, 2.022774, 0, 0.1490196, 1, 1,
0.3566696, 0.1280799, 0.1268136, 0, 0.1411765, 1, 1,
0.3569824, 0.1331436, 1.61206, 0, 0.1372549, 1, 1,
0.3591065, 0.2589059, 1.182963, 0, 0.1294118, 1, 1,
0.3600885, -1.14393, 3.862757, 0, 0.1254902, 1, 1,
0.3608325, -1.492173, 3.363894, 0, 0.1176471, 1, 1,
0.363677, -0.3432579, 1.221308, 0, 0.1137255, 1, 1,
0.366526, -0.6211599, 1.692871, 0, 0.1058824, 1, 1,
0.3728616, -1.890947, 2.924249, 0, 0.09803922, 1, 1,
0.388041, 0.9113677, 0.2749774, 0, 0.09411765, 1, 1,
0.3901559, -1.501045, 1.788687, 0, 0.08627451, 1, 1,
0.393995, 0.5307946, 0.7613307, 0, 0.08235294, 1, 1,
0.3949881, -0.00203428, 1.270324, 0, 0.07450981, 1, 1,
0.3954362, -0.1554883, 0.5867561, 0, 0.07058824, 1, 1,
0.3992292, 1.636898, 0.2687657, 0, 0.0627451, 1, 1,
0.3999044, 0.3600825, 0.9849254, 0, 0.05882353, 1, 1,
0.4016084, -0.8727189, 2.411762, 0, 0.05098039, 1, 1,
0.404893, 0.5200207, 0.9466729, 0, 0.04705882, 1, 1,
0.4056883, -1.298004, 2.667097, 0, 0.03921569, 1, 1,
0.4072178, -1.04103, 4.961036, 0, 0.03529412, 1, 1,
0.4082097, 0.02124752, 1.591027, 0, 0.02745098, 1, 1,
0.4115905, -1.103043, 2.788331, 0, 0.02352941, 1, 1,
0.4130912, 0.351156, 1.01369, 0, 0.01568628, 1, 1,
0.4171098, 1.473031, 0.2918718, 0, 0.01176471, 1, 1,
0.42688, -1.024473, 2.787249, 0, 0.003921569, 1, 1,
0.4325258, 1.301962, -1.284624, 0.003921569, 0, 1, 1,
0.4346405, -0.3544424, 2.209651, 0.007843138, 0, 1, 1,
0.4367535, 0.8410813, -0.1145594, 0.01568628, 0, 1, 1,
0.4373167, -1.074989, 2.598489, 0.01960784, 0, 1, 1,
0.4412687, 0.3293225, 1.845498, 0.02745098, 0, 1, 1,
0.4419091, 1.161081, 1.184907, 0.03137255, 0, 1, 1,
0.4480066, 1.098664, 0.1300003, 0.03921569, 0, 1, 1,
0.4493942, -0.4384097, 3.439216, 0.04313726, 0, 1, 1,
0.4536173, -0.4816114, 2.388224, 0.05098039, 0, 1, 1,
0.4543507, 0.09803697, 0.3513535, 0.05490196, 0, 1, 1,
0.4605365, 0.4680977, 1.495758, 0.0627451, 0, 1, 1,
0.4620899, -0.8096356, 1.739816, 0.06666667, 0, 1, 1,
0.4651048, -1.45456, 2.500874, 0.07450981, 0, 1, 1,
0.4660138, -1.674098, 2.235435, 0.07843138, 0, 1, 1,
0.4669985, -0.1456342, 2.61995, 0.08627451, 0, 1, 1,
0.4679835, -0.1881434, 2.210424, 0.09019608, 0, 1, 1,
0.469114, 0.9434458, 1.109439, 0.09803922, 0, 1, 1,
0.4755924, 0.9519714, 1.55669, 0.1058824, 0, 1, 1,
0.4887945, -0.3960141, 1.594965, 0.1098039, 0, 1, 1,
0.4924317, 0.5446603, 0.2376715, 0.1176471, 0, 1, 1,
0.4933201, -1.119219, 4.09372, 0.1215686, 0, 1, 1,
0.4946343, 2.644789, -1.365377, 0.1294118, 0, 1, 1,
0.4963057, 0.0512122, 0.8414207, 0.1333333, 0, 1, 1,
0.5006642, 1.055985, -1.364613, 0.1411765, 0, 1, 1,
0.5011281, 1.518151, 1.161461, 0.145098, 0, 1, 1,
0.5015975, 1.354394, -0.05361516, 0.1529412, 0, 1, 1,
0.501948, 0.7584614, 0.432678, 0.1568628, 0, 1, 1,
0.5035697, -0.4978279, 2.495183, 0.1647059, 0, 1, 1,
0.5048545, -0.4810743, 4.769086, 0.1686275, 0, 1, 1,
0.5090154, -1.636624, 0.4775296, 0.1764706, 0, 1, 1,
0.5118892, 1.516803, 1.281039, 0.1803922, 0, 1, 1,
0.5120361, 1.142783, 0.1694251, 0.1882353, 0, 1, 1,
0.5136732, -1.196175, 0.6673512, 0.1921569, 0, 1, 1,
0.5168887, -0.3145518, 3.282921, 0.2, 0, 1, 1,
0.5173152, 0.4078143, 1.599593, 0.2078431, 0, 1, 1,
0.5249482, 1.576249, -0.2551509, 0.2117647, 0, 1, 1,
0.5249801, 0.3022718, 0.7219162, 0.2196078, 0, 1, 1,
0.5265557, 0.7339806, 0.332179, 0.2235294, 0, 1, 1,
0.526723, 1.957415, 1.263888, 0.2313726, 0, 1, 1,
0.5299471, 0.1401005, 0.405643, 0.2352941, 0, 1, 1,
0.5306192, -0.1453171, 1.064996, 0.2431373, 0, 1, 1,
0.5340461, 0.3201535, 0.6178262, 0.2470588, 0, 1, 1,
0.5342746, -0.7026829, 2.736519, 0.254902, 0, 1, 1,
0.5346961, -1.112461, 1.724047, 0.2588235, 0, 1, 1,
0.5384982, -0.2007534, 3.693649, 0.2666667, 0, 1, 1,
0.5449705, -0.189672, 2.342057, 0.2705882, 0, 1, 1,
0.5459331, -0.5565439, 1.675089, 0.2784314, 0, 1, 1,
0.5475626, 0.5326725, 0.4619505, 0.282353, 0, 1, 1,
0.5509307, -0.2208327, 2.417349, 0.2901961, 0, 1, 1,
0.5557774, 0.5775977, -0.1022468, 0.2941177, 0, 1, 1,
0.5579565, 0.3285206, 0.7097963, 0.3019608, 0, 1, 1,
0.5589663, -0.113282, 2.970897, 0.3098039, 0, 1, 1,
0.5604675, 0.2076733, 1.966465, 0.3137255, 0, 1, 1,
0.5636417, 0.5473232, 1.406155, 0.3215686, 0, 1, 1,
0.5749426, 0.1305863, 1.260197, 0.3254902, 0, 1, 1,
0.5753052, -0.6419021, 3.710664, 0.3333333, 0, 1, 1,
0.5763802, -1.433656, 2.32848, 0.3372549, 0, 1, 1,
0.5784369, -0.009857285, 0.5414137, 0.345098, 0, 1, 1,
0.581946, -0.05345194, 2.127885, 0.3490196, 0, 1, 1,
0.5837132, 0.2553965, -1.176747, 0.3568628, 0, 1, 1,
0.5847454, 0.02540516, 1.92258, 0.3607843, 0, 1, 1,
0.5856863, 0.2190988, 2.326786, 0.3686275, 0, 1, 1,
0.5882252, 1.309967, 1.714906, 0.372549, 0, 1, 1,
0.5894599, -1.34003, 2.141951, 0.3803922, 0, 1, 1,
0.5913389, -1.727283, 3.916799, 0.3843137, 0, 1, 1,
0.5963888, 0.7994902, 1.093646, 0.3921569, 0, 1, 1,
0.6011689, -0.6069059, 2.146662, 0.3960784, 0, 1, 1,
0.6028169, -1.761766, 3.689137, 0.4039216, 0, 1, 1,
0.6031293, 0.067688, 2.29537, 0.4117647, 0, 1, 1,
0.6039389, -0.8721212, 1.119159, 0.4156863, 0, 1, 1,
0.6074969, -2.507161, 3.172528, 0.4235294, 0, 1, 1,
0.608824, 0.7022036, 1.389431, 0.427451, 0, 1, 1,
0.6116521, -1.539579, 1.318635, 0.4352941, 0, 1, 1,
0.6143585, 0.2430359, 1.601863, 0.4392157, 0, 1, 1,
0.6187901, 0.3049042, 0.2594623, 0.4470588, 0, 1, 1,
0.6200603, 0.1013771, 1.126677, 0.4509804, 0, 1, 1,
0.6220821, -1.668644, 2.770514, 0.4588235, 0, 1, 1,
0.6283207, -1.056797, 3.474979, 0.4627451, 0, 1, 1,
0.6305376, 0.4748691, 1.114282, 0.4705882, 0, 1, 1,
0.6355366, 1.267578, 0.7800721, 0.4745098, 0, 1, 1,
0.6372521, -1.493793, 4.609661, 0.4823529, 0, 1, 1,
0.6429414, -0.650034, 1.740034, 0.4862745, 0, 1, 1,
0.6445878, -1.07456, 0.8965985, 0.4941176, 0, 1, 1,
0.6514829, 1.714354, 0.5199824, 0.5019608, 0, 1, 1,
0.6536126, 0.3308636, 1.606991, 0.5058824, 0, 1, 1,
0.6563715, -0.2445007, 0.9717271, 0.5137255, 0, 1, 1,
0.6575253, -0.234417, 2.505481, 0.5176471, 0, 1, 1,
0.6587946, -1.026067, 3.358555, 0.5254902, 0, 1, 1,
0.6609253, -1.40105, 2.148887, 0.5294118, 0, 1, 1,
0.6675119, -0.04191271, -0.8954567, 0.5372549, 0, 1, 1,
0.6684066, 0.3226395, 0.3048736, 0.5411765, 0, 1, 1,
0.6691686, -1.281358, 1.397657, 0.5490196, 0, 1, 1,
0.6694818, -0.526368, 1.511612, 0.5529412, 0, 1, 1,
0.6713191, 0.2427886, 2.204546, 0.5607843, 0, 1, 1,
0.672473, 0.574235, 1.732871, 0.5647059, 0, 1, 1,
0.6736535, 0.9035885, 0.5398133, 0.572549, 0, 1, 1,
0.6743825, 0.1165784, 1.573092, 0.5764706, 0, 1, 1,
0.6845587, 0.1197445, 0.2979059, 0.5843138, 0, 1, 1,
0.6890303, -0.6295786, 4.506964, 0.5882353, 0, 1, 1,
0.6949604, 0.3588195, 2.073796, 0.5960785, 0, 1, 1,
0.6965017, -1.905777, 2.490355, 0.6039216, 0, 1, 1,
0.6969787, -0.3118834, -0.07056873, 0.6078432, 0, 1, 1,
0.6980014, -0.1729356, 2.785612, 0.6156863, 0, 1, 1,
0.6992941, 0.2970807, 1.234727, 0.6196079, 0, 1, 1,
0.7000223, 0.3395324, 1.010028, 0.627451, 0, 1, 1,
0.7064087, 1.248639, -0.1874407, 0.6313726, 0, 1, 1,
0.7110376, -1.375727, 1.256498, 0.6392157, 0, 1, 1,
0.7112218, 0.5592414, 2.131199, 0.6431373, 0, 1, 1,
0.717806, -1.560152, 3.92589, 0.6509804, 0, 1, 1,
0.7193488, -0.861538, 3.441143, 0.654902, 0, 1, 1,
0.7214344, 0.4224801, 2.601459, 0.6627451, 0, 1, 1,
0.7222756, 0.1616928, 0.9916973, 0.6666667, 0, 1, 1,
0.7275825, 0.9552811, 1.73037, 0.6745098, 0, 1, 1,
0.7295265, -0.5734398, 2.895228, 0.6784314, 0, 1, 1,
0.7351269, 0.6295363, 1.563562, 0.6862745, 0, 1, 1,
0.7357764, -0.4267707, 1.02986, 0.6901961, 0, 1, 1,
0.7384493, -0.4282857, 2.606844, 0.6980392, 0, 1, 1,
0.7431678, -0.3048677, 0.1501854, 0.7058824, 0, 1, 1,
0.7438844, -0.7630463, 2.717425, 0.7098039, 0, 1, 1,
0.7444256, 0.8748821, 0.6962742, 0.7176471, 0, 1, 1,
0.7448564, 0.9902877, 2.946898, 0.7215686, 0, 1, 1,
0.750062, -0.7173302, 2.5822, 0.7294118, 0, 1, 1,
0.7524075, 1.513479, -0.1713168, 0.7333333, 0, 1, 1,
0.7527832, 1.437069, -0.02953423, 0.7411765, 0, 1, 1,
0.7601294, 0.2277718, 2.776046, 0.7450981, 0, 1, 1,
0.761039, 0.3877057, 1.283719, 0.7529412, 0, 1, 1,
0.7611489, -0.8013431, 2.384862, 0.7568628, 0, 1, 1,
0.7663451, -0.7784482, 1.951487, 0.7647059, 0, 1, 1,
0.7680212, -0.4463602, 3.455574, 0.7686275, 0, 1, 1,
0.7696912, -1.047424, 3.178393, 0.7764706, 0, 1, 1,
0.7729779, 0.6985348, 0.07622573, 0.7803922, 0, 1, 1,
0.7819867, -0.2254732, 0.3224572, 0.7882353, 0, 1, 1,
0.796975, -1.789552, 2.503991, 0.7921569, 0, 1, 1,
0.7970958, 0.2496003, 1.012362, 0.8, 0, 1, 1,
0.7985724, -0.3162558, 1.190198, 0.8078431, 0, 1, 1,
0.8047903, 1.260685, 0.8273166, 0.8117647, 0, 1, 1,
0.804881, -0.7999951, 3.018753, 0.8196079, 0, 1, 1,
0.8065444, 0.3153552, 0.3838153, 0.8235294, 0, 1, 1,
0.8109062, -0.5353869, 2.819999, 0.8313726, 0, 1, 1,
0.8173963, 0.1316992, 1.981471, 0.8352941, 0, 1, 1,
0.8215095, -0.9423182, 2.398861, 0.8431373, 0, 1, 1,
0.8235132, -1.243805, 2.723382, 0.8470588, 0, 1, 1,
0.8407803, 1.378489, 0.6114811, 0.854902, 0, 1, 1,
0.8433549, -0.1799007, 2.125032, 0.8588235, 0, 1, 1,
0.8464471, -0.1067131, 1.183053, 0.8666667, 0, 1, 1,
0.8505067, 2.669271, 2.395596, 0.8705882, 0, 1, 1,
0.8568042, -0.1099647, 1.520514, 0.8784314, 0, 1, 1,
0.8585886, 0.8428727, 0.4377635, 0.8823529, 0, 1, 1,
0.8623176, -2.213227, 1.75776, 0.8901961, 0, 1, 1,
0.8632244, -1.252512, 3.184787, 0.8941177, 0, 1, 1,
0.8672172, 0.4490529, 1.921329, 0.9019608, 0, 1, 1,
0.8749748, 1.078927, -0.1989648, 0.9098039, 0, 1, 1,
0.878087, -0.9473611, 2.329814, 0.9137255, 0, 1, 1,
0.8781348, 0.3174507, 1.065265, 0.9215686, 0, 1, 1,
0.8790798, 0.1722317, 2.101755, 0.9254902, 0, 1, 1,
0.8848214, -0.05840783, -0.8905312, 0.9333333, 0, 1, 1,
0.8877108, 0.5624655, 1.874847, 0.9372549, 0, 1, 1,
0.8880828, -1.363895, 2.783412, 0.945098, 0, 1, 1,
0.8916934, -1.278555, 3.867323, 0.9490196, 0, 1, 1,
0.8941561, 2.170661, 0.03135368, 0.9568627, 0, 1, 1,
0.8999368, 0.2264496, 2.315141, 0.9607843, 0, 1, 1,
0.9010445, -0.5940146, 2.15741, 0.9686275, 0, 1, 1,
0.9038361, 1.505563, -0.3026125, 0.972549, 0, 1, 1,
0.9043279, -0.6239802, 3.231152, 0.9803922, 0, 1, 1,
0.9074613, 0.7041552, 1.398298, 0.9843137, 0, 1, 1,
0.9075675, 0.06856589, 1.978412, 0.9921569, 0, 1, 1,
0.9144174, -0.1063222, -0.002555304, 0.9960784, 0, 1, 1,
0.9195433, -0.7057171, 2.670069, 1, 0, 0.9960784, 1,
0.9328693, -0.04234544, 2.394411, 1, 0, 0.9882353, 1,
0.9387912, 1.320684, 1.379175, 1, 0, 0.9843137, 1,
0.9389336, -0.1676851, 2.728758, 1, 0, 0.9764706, 1,
0.9511197, -1.267423, 3.211439, 1, 0, 0.972549, 1,
0.9565016, -0.7152306, 1.532577, 1, 0, 0.9647059, 1,
0.9732295, -0.9146988, 3.156442, 1, 0, 0.9607843, 1,
0.9800856, 1.231596, 0.6944317, 1, 0, 0.9529412, 1,
0.986731, -0.2788613, 3.092716, 1, 0, 0.9490196, 1,
0.9883599, -1.332752, 3.242135, 1, 0, 0.9411765, 1,
0.9937972, 0.1363999, 2.027056, 1, 0, 0.9372549, 1,
0.9941413, -0.2451147, 2.171488, 1, 0, 0.9294118, 1,
0.9992484, -0.66045, 1.9025, 1, 0, 0.9254902, 1,
0.9999807, 0.8703616, 1.808754, 1, 0, 0.9176471, 1,
1.007237, -0.8809451, 1.261454, 1, 0, 0.9137255, 1,
1.008328, -1.33703, 2.742729, 1, 0, 0.9058824, 1,
1.016212, 0.2907399, 1.734659, 1, 0, 0.9019608, 1,
1.026542, -2.320518, 1.959315, 1, 0, 0.8941177, 1,
1.027729, 0.4577576, 0.2636011, 1, 0, 0.8862745, 1,
1.033943, 0.5024772, 0.3920924, 1, 0, 0.8823529, 1,
1.044237, -1.000372, 1.317693, 1, 0, 0.8745098, 1,
1.049424, -0.9663732, 2.306815, 1, 0, 0.8705882, 1,
1.049454, -0.2934438, 1.132437, 1, 0, 0.8627451, 1,
1.055823, -0.5685052, 1.235581, 1, 0, 0.8588235, 1,
1.056988, -0.7084848, 2.152292, 1, 0, 0.8509804, 1,
1.058197, 0.1674768, 1.366281, 1, 0, 0.8470588, 1,
1.058633, -0.4745899, 3.448442, 1, 0, 0.8392157, 1,
1.067425, 0.648145, -0.5660341, 1, 0, 0.8352941, 1,
1.071997, 1.388478, 2.37616, 1, 0, 0.827451, 1,
1.081492, -1.110156, 1.645272, 1, 0, 0.8235294, 1,
1.083808, -0.209465, 1.571927, 1, 0, 0.8156863, 1,
1.091099, 0.5791286, 1.531908, 1, 0, 0.8117647, 1,
1.091343, 0.8576766, 2.279929, 1, 0, 0.8039216, 1,
1.099571, 0.4881211, 1.418266, 1, 0, 0.7960784, 1,
1.101772, 0.8865266, -0.05392568, 1, 0, 0.7921569, 1,
1.10257, -0.2302062, 2.16579, 1, 0, 0.7843137, 1,
1.105541, -0.2196765, 1.753983, 1, 0, 0.7803922, 1,
1.108081, -0.5866067, 2.472229, 1, 0, 0.772549, 1,
1.10865, -1.440606, 2.524368, 1, 0, 0.7686275, 1,
1.111904, -0.6763403, 0.9212825, 1, 0, 0.7607843, 1,
1.127194, 1.778187, 1.114977, 1, 0, 0.7568628, 1,
1.132402, -0.971784, 0.2710958, 1, 0, 0.7490196, 1,
1.133929, -0.03459341, 1.10787, 1, 0, 0.7450981, 1,
1.140363, -0.3635019, 2.879007, 1, 0, 0.7372549, 1,
1.141212, -1.33471, 2.980266, 1, 0, 0.7333333, 1,
1.141357, -1.442933, 2.612613, 1, 0, 0.7254902, 1,
1.154535, -1.398139, 2.666814, 1, 0, 0.7215686, 1,
1.157308, -0.5464901, 1.729105, 1, 0, 0.7137255, 1,
1.157702, -0.3747447, 1.564903, 1, 0, 0.7098039, 1,
1.161451, -0.1090284, 1.684495, 1, 0, 0.7019608, 1,
1.17062, -1.450343, 4.362936, 1, 0, 0.6941177, 1,
1.177763, -0.1594746, 2.617515, 1, 0, 0.6901961, 1,
1.187948, 1.00448, 1.384372, 1, 0, 0.682353, 1,
1.190002, 0.4282087, 0.5656192, 1, 0, 0.6784314, 1,
1.192832, 1.224504, 1.439051, 1, 0, 0.6705883, 1,
1.207237, 0.8337938, -0.1453266, 1, 0, 0.6666667, 1,
1.209024, 0.6084914, 0.9247968, 1, 0, 0.6588235, 1,
1.231939, 0.07411641, 2.600807, 1, 0, 0.654902, 1,
1.23297, 0.386382, 2.014635, 1, 0, 0.6470588, 1,
1.236068, -0.8599568, 0.6014454, 1, 0, 0.6431373, 1,
1.243658, 0.3303144, 2.713652, 1, 0, 0.6352941, 1,
1.254891, -0.8825197, 0.7602301, 1, 0, 0.6313726, 1,
1.255036, -0.2669306, 3.14402, 1, 0, 0.6235294, 1,
1.266694, 0.3174371, 0.2208474, 1, 0, 0.6196079, 1,
1.268205, 0.1808552, 0.328919, 1, 0, 0.6117647, 1,
1.278025, -0.04757657, 1.450888, 1, 0, 0.6078432, 1,
1.278787, 0.218952, 1.706541, 1, 0, 0.6, 1,
1.281301, 0.5154831, 2.547803, 1, 0, 0.5921569, 1,
1.282092, 0.06963339, -0.3127765, 1, 0, 0.5882353, 1,
1.283906, 0.9430667, 0.544444, 1, 0, 0.5803922, 1,
1.291677, 2.019872, 1.428062, 1, 0, 0.5764706, 1,
1.303167, 1.058834, 0.5331931, 1, 0, 0.5686275, 1,
1.306569, 1.430812, 3.0795, 1, 0, 0.5647059, 1,
1.311147, -0.3795194, 2.108331, 1, 0, 0.5568628, 1,
1.327003, -0.4785718, 1.495082, 1, 0, 0.5529412, 1,
1.327155, -1.162054, 0.6706196, 1, 0, 0.5450981, 1,
1.327509, 1.350929, 0.8150035, 1, 0, 0.5411765, 1,
1.32767, 0.665499, 2.126626, 1, 0, 0.5333334, 1,
1.331603, -0.1829358, 1.991169, 1, 0, 0.5294118, 1,
1.331805, -1.482237, 2.213593, 1, 0, 0.5215687, 1,
1.335975, 0.171039, 1.413002, 1, 0, 0.5176471, 1,
1.340407, 0.8058097, 3.186467, 1, 0, 0.509804, 1,
1.342357, 1.801086, 1.425317, 1, 0, 0.5058824, 1,
1.348258, 0.9404329, 2.157016, 1, 0, 0.4980392, 1,
1.35706, 0.7189672, 0.8615456, 1, 0, 0.4901961, 1,
1.363686, 1.034687, 0.3200803, 1, 0, 0.4862745, 1,
1.365763, -1.375546, 0.5497274, 1, 0, 0.4784314, 1,
1.37161, -0.1490715, 2.937516, 1, 0, 0.4745098, 1,
1.371837, -0.6207963, 2.915557, 1, 0, 0.4666667, 1,
1.372322, 1.335803, 3.237805, 1, 0, 0.4627451, 1,
1.373286, -1.109043, 1.652474, 1, 0, 0.454902, 1,
1.375885, -0.4855808, 2.383313, 1, 0, 0.4509804, 1,
1.383183, 0.4217128, 0.8736592, 1, 0, 0.4431373, 1,
1.383498, 0.4722522, 0.7234106, 1, 0, 0.4392157, 1,
1.386365, 0.2571644, 0.4673376, 1, 0, 0.4313726, 1,
1.394637, -1.19343, 2.892835, 1, 0, 0.427451, 1,
1.414133, -1.230489, 1.527747, 1, 0, 0.4196078, 1,
1.419199, 0.1496947, 1.272952, 1, 0, 0.4156863, 1,
1.421661, -2.20058, 1.737021, 1, 0, 0.4078431, 1,
1.429259, 0.8655487, 0.8994517, 1, 0, 0.4039216, 1,
1.430041, -1.638656, 4.344831, 1, 0, 0.3960784, 1,
1.430945, 0.2395519, 3.46697, 1, 0, 0.3882353, 1,
1.43754, 0.7099739, 2.457205, 1, 0, 0.3843137, 1,
1.447408, 0.2329909, -0.4905773, 1, 0, 0.3764706, 1,
1.451385, 1.501641, -0.5883953, 1, 0, 0.372549, 1,
1.459746, -0.1022974, 1.090129, 1, 0, 0.3647059, 1,
1.460752, 0.5463501, -0.3722227, 1, 0, 0.3607843, 1,
1.479805, 0.9312685, 0.9883907, 1, 0, 0.3529412, 1,
1.480942, -0.30661, 1.335696, 1, 0, 0.3490196, 1,
1.504379, 0.8581079, 0.3190266, 1, 0, 0.3411765, 1,
1.506985, -1.998034, 3.614772, 1, 0, 0.3372549, 1,
1.518636, -0.8198115, 2.018548, 1, 0, 0.3294118, 1,
1.522244, 1.746295, 1.147357, 1, 0, 0.3254902, 1,
1.539749, -0.3932733, 2.135474, 1, 0, 0.3176471, 1,
1.560719, -0.3535815, -0.236941, 1, 0, 0.3137255, 1,
1.57664, -1.156466, -0.4556283, 1, 0, 0.3058824, 1,
1.584384, -0.1084078, 2.236058, 1, 0, 0.2980392, 1,
1.592766, -0.1428439, 1.926706, 1, 0, 0.2941177, 1,
1.622743, 0.2936087, 3.650659, 1, 0, 0.2862745, 1,
1.636223, 0.2307676, 1.33161, 1, 0, 0.282353, 1,
1.637672, 0.2786539, 2.885007, 1, 0, 0.2745098, 1,
1.640485, -1.366132, 2.308213, 1, 0, 0.2705882, 1,
1.643526, -0.4136558, 4.108723, 1, 0, 0.2627451, 1,
1.64623, 0.9251481, 4.262036, 1, 0, 0.2588235, 1,
1.652641, -0.6685061, 0.6952083, 1, 0, 0.2509804, 1,
1.660487, -1.184568, 0.5009349, 1, 0, 0.2470588, 1,
1.677512, -2.174089, 2.471779, 1, 0, 0.2392157, 1,
1.678352, 0.5809792, 1.970374, 1, 0, 0.2352941, 1,
1.69315, -0.8222383, 2.68694, 1, 0, 0.227451, 1,
1.698582, -0.9763978, 1.961804, 1, 0, 0.2235294, 1,
1.70144, -0.9588478, 2.547658, 1, 0, 0.2156863, 1,
1.71059, -1.040177, 1.63091, 1, 0, 0.2117647, 1,
1.729789, 0.5855557, 1.53738, 1, 0, 0.2039216, 1,
1.749578, 1.130852, 0.8444225, 1, 0, 0.1960784, 1,
1.757438, 0.4343922, 0.2788571, 1, 0, 0.1921569, 1,
1.759919, -0.7273818, 4.119649, 1, 0, 0.1843137, 1,
1.76789, 1.478433, 1.30694, 1, 0, 0.1803922, 1,
1.798978, 1.246987, 0.06705251, 1, 0, 0.172549, 1,
1.813163, -0.7504565, 0.7694187, 1, 0, 0.1686275, 1,
1.813377, -0.8218973, 1.109557, 1, 0, 0.1607843, 1,
1.83256, 0.3366266, 0.1624042, 1, 0, 0.1568628, 1,
1.835436, 0.2030286, 1.981793, 1, 0, 0.1490196, 1,
1.840309, -1.729206, 1.389464, 1, 0, 0.145098, 1,
1.844128, -1.228268, 2.533535, 1, 0, 0.1372549, 1,
1.88743, -1.220857, 0.5604043, 1, 0, 0.1333333, 1,
1.891436, 1.208685, -0.04452311, 1, 0, 0.1254902, 1,
1.904104, 0.25818, -0.1923354, 1, 0, 0.1215686, 1,
1.912398, -0.3865113, 1.056141, 1, 0, 0.1137255, 1,
1.949087, 1.129521, -0.08183796, 1, 0, 0.1098039, 1,
1.958231, 0.6698865, 1.509405, 1, 0, 0.1019608, 1,
1.963034, -1.218536, 1.432899, 1, 0, 0.09411765, 1,
1.984829, -0.7103449, 1.365774, 1, 0, 0.09019608, 1,
2.021789, -0.7774644, 0.599513, 1, 0, 0.08235294, 1,
2.028431, 0.8209143, 3.186874, 1, 0, 0.07843138, 1,
2.063213, 0.8644277, 0.1667761, 1, 0, 0.07058824, 1,
2.068837, -1.534413, 2.057416, 1, 0, 0.06666667, 1,
2.071852, 0.963818, 0.4763702, 1, 0, 0.05882353, 1,
2.084124, 2.000983, 1.547802, 1, 0, 0.05490196, 1,
2.085234, -1.206175, 1.636485, 1, 0, 0.04705882, 1,
2.0896, 0.03096411, 1.148843, 1, 0, 0.04313726, 1,
2.107959, 0.1635411, 1.842033, 1, 0, 0.03529412, 1,
2.233617, 2.573144, 0.4817876, 1, 0, 0.03137255, 1,
2.451008, 0.007342578, 0.0302097, 1, 0, 0.02352941, 1,
2.638622, -0.3261964, 1.003638, 1, 0, 0.01960784, 1,
2.692406, 1.029223, 2.37482, 1, 0, 0.01176471, 1,
3.126459, 0.7533732, 1.929231, 1, 0, 0.007843138, 1
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
-0.02353787, -4.566138, -7.177645, 0, -0.5, 0.5, 0.5,
-0.02353787, -4.566138, -7.177645, 1, -0.5, 0.5, 0.5,
-0.02353787, -4.566138, -7.177645, 1, 1.5, 0.5, 0.5,
-0.02353787, -4.566138, -7.177645, 0, 1.5, 0.5, 0.5
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
-4.241384, -0.2110549, -7.177645, 0, -0.5, 0.5, 0.5,
-4.241384, -0.2110549, -7.177645, 1, -0.5, 0.5, 0.5,
-4.241384, -0.2110549, -7.177645, 1, 1.5, 0.5, 0.5,
-4.241384, -0.2110549, -7.177645, 0, 1.5, 0.5, 0.5
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
-4.241384, -4.566138, 0.6073399, 0, -0.5, 0.5, 0.5,
-4.241384, -4.566138, 0.6073399, 1, -0.5, 0.5, 0.5,
-4.241384, -4.566138, 0.6073399, 1, 1.5, 0.5, 0.5,
-4.241384, -4.566138, 0.6073399, 0, 1.5, 0.5, 0.5
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
-3, -3.561119, -5.38111,
3, -3.561119, -5.38111,
-3, -3.561119, -5.38111,
-3, -3.728622, -5.680532,
-2, -3.561119, -5.38111,
-2, -3.728622, -5.680532,
-1, -3.561119, -5.38111,
-1, -3.728622, -5.680532,
0, -3.561119, -5.38111,
0, -3.728622, -5.680532,
1, -3.561119, -5.38111,
1, -3.728622, -5.680532,
2, -3.561119, -5.38111,
2, -3.728622, -5.680532,
3, -3.561119, -5.38111,
3, -3.728622, -5.680532
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
-3, -4.063628, -6.279377, 0, -0.5, 0.5, 0.5,
-3, -4.063628, -6.279377, 1, -0.5, 0.5, 0.5,
-3, -4.063628, -6.279377, 1, 1.5, 0.5, 0.5,
-3, -4.063628, -6.279377, 0, 1.5, 0.5, 0.5,
-2, -4.063628, -6.279377, 0, -0.5, 0.5, 0.5,
-2, -4.063628, -6.279377, 1, -0.5, 0.5, 0.5,
-2, -4.063628, -6.279377, 1, 1.5, 0.5, 0.5,
-2, -4.063628, -6.279377, 0, 1.5, 0.5, 0.5,
-1, -4.063628, -6.279377, 0, -0.5, 0.5, 0.5,
-1, -4.063628, -6.279377, 1, -0.5, 0.5, 0.5,
-1, -4.063628, -6.279377, 1, 1.5, 0.5, 0.5,
-1, -4.063628, -6.279377, 0, 1.5, 0.5, 0.5,
0, -4.063628, -6.279377, 0, -0.5, 0.5, 0.5,
0, -4.063628, -6.279377, 1, -0.5, 0.5, 0.5,
0, -4.063628, -6.279377, 1, 1.5, 0.5, 0.5,
0, -4.063628, -6.279377, 0, 1.5, 0.5, 0.5,
1, -4.063628, -6.279377, 0, -0.5, 0.5, 0.5,
1, -4.063628, -6.279377, 1, -0.5, 0.5, 0.5,
1, -4.063628, -6.279377, 1, 1.5, 0.5, 0.5,
1, -4.063628, -6.279377, 0, 1.5, 0.5, 0.5,
2, -4.063628, -6.279377, 0, -0.5, 0.5, 0.5,
2, -4.063628, -6.279377, 1, -0.5, 0.5, 0.5,
2, -4.063628, -6.279377, 1, 1.5, 0.5, 0.5,
2, -4.063628, -6.279377, 0, 1.5, 0.5, 0.5,
3, -4.063628, -6.279377, 0, -0.5, 0.5, 0.5,
3, -4.063628, -6.279377, 1, -0.5, 0.5, 0.5,
3, -4.063628, -6.279377, 1, 1.5, 0.5, 0.5,
3, -4.063628, -6.279377, 0, 1.5, 0.5, 0.5
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
-3.268035, -3, -5.38111,
-3.268035, 3, -5.38111,
-3.268035, -3, -5.38111,
-3.43026, -3, -5.680532,
-3.268035, -2, -5.38111,
-3.43026, -2, -5.680532,
-3.268035, -1, -5.38111,
-3.43026, -1, -5.680532,
-3.268035, 0, -5.38111,
-3.43026, 0, -5.680532,
-3.268035, 1, -5.38111,
-3.43026, 1, -5.680532,
-3.268035, 2, -5.38111,
-3.43026, 2, -5.680532,
-3.268035, 3, -5.38111,
-3.43026, 3, -5.680532
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
-3.754709, -3, -6.279377, 0, -0.5, 0.5, 0.5,
-3.754709, -3, -6.279377, 1, -0.5, 0.5, 0.5,
-3.754709, -3, -6.279377, 1, 1.5, 0.5, 0.5,
-3.754709, -3, -6.279377, 0, 1.5, 0.5, 0.5,
-3.754709, -2, -6.279377, 0, -0.5, 0.5, 0.5,
-3.754709, -2, -6.279377, 1, -0.5, 0.5, 0.5,
-3.754709, -2, -6.279377, 1, 1.5, 0.5, 0.5,
-3.754709, -2, -6.279377, 0, 1.5, 0.5, 0.5,
-3.754709, -1, -6.279377, 0, -0.5, 0.5, 0.5,
-3.754709, -1, -6.279377, 1, -0.5, 0.5, 0.5,
-3.754709, -1, -6.279377, 1, 1.5, 0.5, 0.5,
-3.754709, -1, -6.279377, 0, 1.5, 0.5, 0.5,
-3.754709, 0, -6.279377, 0, -0.5, 0.5, 0.5,
-3.754709, 0, -6.279377, 1, -0.5, 0.5, 0.5,
-3.754709, 0, -6.279377, 1, 1.5, 0.5, 0.5,
-3.754709, 0, -6.279377, 0, 1.5, 0.5, 0.5,
-3.754709, 1, -6.279377, 0, -0.5, 0.5, 0.5,
-3.754709, 1, -6.279377, 1, -0.5, 0.5, 0.5,
-3.754709, 1, -6.279377, 1, 1.5, 0.5, 0.5,
-3.754709, 1, -6.279377, 0, 1.5, 0.5, 0.5,
-3.754709, 2, -6.279377, 0, -0.5, 0.5, 0.5,
-3.754709, 2, -6.279377, 1, -0.5, 0.5, 0.5,
-3.754709, 2, -6.279377, 1, 1.5, 0.5, 0.5,
-3.754709, 2, -6.279377, 0, 1.5, 0.5, 0.5,
-3.754709, 3, -6.279377, 0, -0.5, 0.5, 0.5,
-3.754709, 3, -6.279377, 1, -0.5, 0.5, 0.5,
-3.754709, 3, -6.279377, 1, 1.5, 0.5, 0.5,
-3.754709, 3, -6.279377, 0, 1.5, 0.5, 0.5
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
-3.268035, -3.561119, -4,
-3.268035, -3.561119, 6,
-3.268035, -3.561119, -4,
-3.43026, -3.728622, -4,
-3.268035, -3.561119, -2,
-3.43026, -3.728622, -2,
-3.268035, -3.561119, 0,
-3.43026, -3.728622, 0,
-3.268035, -3.561119, 2,
-3.43026, -3.728622, 2,
-3.268035, -3.561119, 4,
-3.43026, -3.728622, 4,
-3.268035, -3.561119, 6,
-3.43026, -3.728622, 6
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
-3.754709, -4.063628, -4, 0, -0.5, 0.5, 0.5,
-3.754709, -4.063628, -4, 1, -0.5, 0.5, 0.5,
-3.754709, -4.063628, -4, 1, 1.5, 0.5, 0.5,
-3.754709, -4.063628, -4, 0, 1.5, 0.5, 0.5,
-3.754709, -4.063628, -2, 0, -0.5, 0.5, 0.5,
-3.754709, -4.063628, -2, 1, -0.5, 0.5, 0.5,
-3.754709, -4.063628, -2, 1, 1.5, 0.5, 0.5,
-3.754709, -4.063628, -2, 0, 1.5, 0.5, 0.5,
-3.754709, -4.063628, 0, 0, -0.5, 0.5, 0.5,
-3.754709, -4.063628, 0, 1, -0.5, 0.5, 0.5,
-3.754709, -4.063628, 0, 1, 1.5, 0.5, 0.5,
-3.754709, -4.063628, 0, 0, 1.5, 0.5, 0.5,
-3.754709, -4.063628, 2, 0, -0.5, 0.5, 0.5,
-3.754709, -4.063628, 2, 1, -0.5, 0.5, 0.5,
-3.754709, -4.063628, 2, 1, 1.5, 0.5, 0.5,
-3.754709, -4.063628, 2, 0, 1.5, 0.5, 0.5,
-3.754709, -4.063628, 4, 0, -0.5, 0.5, 0.5,
-3.754709, -4.063628, 4, 1, -0.5, 0.5, 0.5,
-3.754709, -4.063628, 4, 1, 1.5, 0.5, 0.5,
-3.754709, -4.063628, 4, 0, 1.5, 0.5, 0.5,
-3.754709, -4.063628, 6, 0, -0.5, 0.5, 0.5,
-3.754709, -4.063628, 6, 1, -0.5, 0.5, 0.5,
-3.754709, -4.063628, 6, 1, 1.5, 0.5, 0.5,
-3.754709, -4.063628, 6, 0, 1.5, 0.5, 0.5
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
-3.268035, -3.561119, -5.38111,
-3.268035, 3.139009, -5.38111,
-3.268035, -3.561119, 6.595789,
-3.268035, 3.139009, 6.595789,
-3.268035, -3.561119, -5.38111,
-3.268035, -3.561119, 6.595789,
-3.268035, 3.139009, -5.38111,
-3.268035, 3.139009, 6.595789,
-3.268035, -3.561119, -5.38111,
3.220959, -3.561119, -5.38111,
-3.268035, -3.561119, 6.595789,
3.220959, -3.561119, 6.595789,
-3.268035, 3.139009, -5.38111,
3.220959, 3.139009, -5.38111,
-3.268035, 3.139009, 6.595789,
3.220959, 3.139009, 6.595789,
3.220959, -3.561119, -5.38111,
3.220959, 3.139009, -5.38111,
3.220959, -3.561119, 6.595789,
3.220959, 3.139009, 6.595789,
3.220959, -3.561119, -5.38111,
3.220959, -3.561119, 6.595789,
3.220959, 3.139009, -5.38111,
3.220959, 3.139009, 6.595789
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
var radius = 8.106045;
var distance = 36.06471;
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
mvMatrix.translate( 0.02353787, 0.2110549, -0.6073399 );
mvMatrix.scale( 1.350658, 1.308097, 0.7317766 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.06471);
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
InChI_1S_C13H9Cl2F3N<-read.table("InChI_1S_C13H9Cl2F3N.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C13H9Cl2F3N$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C13H9Cl2F3N' not found
```

```r
y<-InChI_1S_C13H9Cl2F3N$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C13H9Cl2F3N' not found
```

```r
z<-InChI_1S_C13H9Cl2F3N$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C13H9Cl2F3N' not found
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
-3.173535, -0.5302173, -0.8442924, 0, 0, 1, 1, 1,
-2.79705, 0.6482791, -0.5798303, 1, 0, 0, 1, 1,
-2.571751, 0.1170691, -1.612387, 1, 0, 0, 1, 1,
-2.478362, -1.503699, -1.96389, 1, 0, 0, 1, 1,
-2.4376, 0.6992059, -1.503923, 1, 0, 0, 1, 1,
-2.401601, 1.147063, -1.320022, 1, 0, 0, 1, 1,
-2.382941, 0.1692373, -0.1577748, 0, 0, 0, 1, 1,
-2.381414, -1.371781, -4.314402, 0, 0, 0, 1, 1,
-2.34569, -0.7603224, -1.500787, 0, 0, 0, 1, 1,
-2.309009, 0.188526, -1.236188, 0, 0, 0, 1, 1,
-2.232006, -1.105536, -1.418839, 0, 0, 0, 1, 1,
-2.230446, 1.799405, -0.6903887, 0, 0, 0, 1, 1,
-2.207401, -1.479806, -2.937228, 0, 0, 0, 1, 1,
-2.193343, -0.4018479, -2.271846, 1, 1, 1, 1, 1,
-2.144089, 0.1458318, -1.528582, 1, 1, 1, 1, 1,
-2.130462, -0.8548203, -2.466815, 1, 1, 1, 1, 1,
-2.049052, 0.1782142, 0.4920235, 1, 1, 1, 1, 1,
-1.971717, 0.7810655, -2.165953, 1, 1, 1, 1, 1,
-1.970592, 1.007247, -0.6480268, 1, 1, 1, 1, 1,
-1.96761, -1.427551, -1.071659, 1, 1, 1, 1, 1,
-1.967567, 1.517631, 0.2576264, 1, 1, 1, 1, 1,
-1.956878, 0.2152361, -2.178214, 1, 1, 1, 1, 1,
-1.941236, 0.02920257, -1.384258, 1, 1, 1, 1, 1,
-1.935794, -0.1885664, -2.184003, 1, 1, 1, 1, 1,
-1.924893, -0.2820848, -1.911024, 1, 1, 1, 1, 1,
-1.923416, 0.7340879, -1.475212, 1, 1, 1, 1, 1,
-1.916602, -0.5955484, -0.7563897, 1, 1, 1, 1, 1,
-1.910475, -0.4918509, -0.8169727, 1, 1, 1, 1, 1,
-1.909218, -0.5417491, -0.8932833, 0, 0, 1, 1, 1,
-1.908273, -0.4173573, -3.960037, 1, 0, 0, 1, 1,
-1.897889, 0.0002077777, -2.184762, 1, 0, 0, 1, 1,
-1.86483, 2.344148, 0.319178, 1, 0, 0, 1, 1,
-1.863283, 1.309405, -2.125144, 1, 0, 0, 1, 1,
-1.855347, 0.8221408, -2.166386, 1, 0, 0, 1, 1,
-1.841963, 0.6349154, -2.277456, 0, 0, 0, 1, 1,
-1.826269, -0.06489184, -1.166832, 0, 0, 0, 1, 1,
-1.821281, -0.6698345, -1.958155, 0, 0, 0, 1, 1,
-1.811106, -1.332103, -1.920477, 0, 0, 0, 1, 1,
-1.803899, -0.6220695, -2.44521, 0, 0, 0, 1, 1,
-1.773773, -1.577311, 0.261262, 0, 0, 0, 1, 1,
-1.730451, 0.6971319, -0.2125239, 0, 0, 0, 1, 1,
-1.727919, 1.275508, -1.631866, 1, 1, 1, 1, 1,
-1.727328, -0.01416245, -2.087102, 1, 1, 1, 1, 1,
-1.725036, -0.2418692, -2.9044, 1, 1, 1, 1, 1,
-1.718533, 1.116508, -0.7230396, 1, 1, 1, 1, 1,
-1.717672, -0.4816519, -1.272093, 1, 1, 1, 1, 1,
-1.706115, 1.291911, -2.983201, 1, 1, 1, 1, 1,
-1.693924, -1.462939, -2.028251, 1, 1, 1, 1, 1,
-1.685041, -0.02780129, -2.927797, 1, 1, 1, 1, 1,
-1.679172, 0.9301137, -2.033581, 1, 1, 1, 1, 1,
-1.676595, -0.9947026, -2.565892, 1, 1, 1, 1, 1,
-1.666466, -1.133845, -1.407701, 1, 1, 1, 1, 1,
-1.649777, -1.050148, -1.485126, 1, 1, 1, 1, 1,
-1.630633, 0.1417666, -1.624179, 1, 1, 1, 1, 1,
-1.630481, 1.821375, -1.695555, 1, 1, 1, 1, 1,
-1.629969, 3.041434, -1.085704, 1, 1, 1, 1, 1,
-1.62914, -0.2379534, -1.72299, 0, 0, 1, 1, 1,
-1.627497, 0.03723082, -0.8913626, 1, 0, 0, 1, 1,
-1.623238, -1.026433, -2.723919, 1, 0, 0, 1, 1,
-1.621555, -0.3476647, -1.918864, 1, 0, 0, 1, 1,
-1.619087, 1.260167, 0.7494305, 1, 0, 0, 1, 1,
-1.617875, -0.655293, -2.542406, 1, 0, 0, 1, 1,
-1.607211, 0.3842745, -0.280431, 0, 0, 0, 1, 1,
-1.603707, -1.757728, -3.053106, 0, 0, 0, 1, 1,
-1.60082, 0.7098196, -1.373544, 0, 0, 0, 1, 1,
-1.599035, 0.7603755, -0.9823964, 0, 0, 0, 1, 1,
-1.598382, -0.9572043, -3.736588, 0, 0, 0, 1, 1,
-1.597869, -1.038371, -2.108037, 0, 0, 0, 1, 1,
-1.552919, 1.397606, -2.226927, 0, 0, 0, 1, 1,
-1.543934, -0.3718936, -2.185271, 1, 1, 1, 1, 1,
-1.536481, 0.6807262, -1.300812, 1, 1, 1, 1, 1,
-1.524187, 0.5657023, -1.087032, 1, 1, 1, 1, 1,
-1.519452, -0.7069138, -1.753782, 1, 1, 1, 1, 1,
-1.513654, -0.09049074, -1.229009, 1, 1, 1, 1, 1,
-1.512787, -0.474032, -1.563699, 1, 1, 1, 1, 1,
-1.512322, 0.05321509, -1.692366, 1, 1, 1, 1, 1,
-1.50783, -1.303096, -2.009937, 1, 1, 1, 1, 1,
-1.499853, -1.337517, -2.746128, 1, 1, 1, 1, 1,
-1.4966, -0.2232786, -2.442142, 1, 1, 1, 1, 1,
-1.491352, 0.8935105, -1.108312, 1, 1, 1, 1, 1,
-1.48359, -1.886525, -1.513798, 1, 1, 1, 1, 1,
-1.481872, 0.723552, -1.512197, 1, 1, 1, 1, 1,
-1.481745, -0.4034953, -2.729394, 1, 1, 1, 1, 1,
-1.477335, 0.3619994, -1.904615, 1, 1, 1, 1, 1,
-1.473825, 0.2523743, -1.163448, 0, 0, 1, 1, 1,
-1.459858, 0.1419156, -0.4094914, 1, 0, 0, 1, 1,
-1.45952, 0.6703314, -2.728355, 1, 0, 0, 1, 1,
-1.456236, -0.3002662, -2.367012, 1, 0, 0, 1, 1,
-1.445514, -1.441709, -1.644488, 1, 0, 0, 1, 1,
-1.439539, 1.213442, -1.377188, 1, 0, 0, 1, 1,
-1.436184, -0.6231316, -2.640844, 0, 0, 0, 1, 1,
-1.409805, 0.04246328, -1.17024, 0, 0, 0, 1, 1,
-1.407471, -0.5585676, -3.195072, 0, 0, 0, 1, 1,
-1.393925, 1.370854, -2.578853, 0, 0, 0, 1, 1,
-1.393306, -0.7997145, -2.848147, 0, 0, 0, 1, 1,
-1.38917, 0.597839, -0.1919384, 0, 0, 0, 1, 1,
-1.383068, -0.1701511, -4.114636, 0, 0, 0, 1, 1,
-1.377028, -2.307474, -2.209645, 1, 1, 1, 1, 1,
-1.363771, 0.7154613, -0.3693964, 1, 1, 1, 1, 1,
-1.359935, -0.4960196, -3.160303, 1, 1, 1, 1, 1,
-1.358399, 1.063842, -0.637287, 1, 1, 1, 1, 1,
-1.346301, 0.2349003, -1.07915, 1, 1, 1, 1, 1,
-1.336454, 0.598769, 1.046424, 1, 1, 1, 1, 1,
-1.336146, 0.4498952, -1.967099, 1, 1, 1, 1, 1,
-1.333157, -0.1954322, -1.361755, 1, 1, 1, 1, 1,
-1.319434, -1.344278, -3.626589, 1, 1, 1, 1, 1,
-1.31559, 0.9571469, -1.583996, 1, 1, 1, 1, 1,
-1.303651, 0.3049285, -2.782841, 1, 1, 1, 1, 1,
-1.294867, -1.074663, -2.138942, 1, 1, 1, 1, 1,
-1.292536, 0.6280155, 1.883906, 1, 1, 1, 1, 1,
-1.291156, -1.350222, -2.671506, 1, 1, 1, 1, 1,
-1.290248, 0.3605993, -1.254281, 1, 1, 1, 1, 1,
-1.289104, -0.009384307, -0.5599139, 0, 0, 1, 1, 1,
-1.282522, 1.462323, -0.68039, 1, 0, 0, 1, 1,
-1.276944, 1.126516, -1.3135, 1, 0, 0, 1, 1,
-1.276706, -0.09523142, -0.9829564, 1, 0, 0, 1, 1,
-1.274202, -0.4415607, -1.1252, 1, 0, 0, 1, 1,
-1.262485, 1.828871, -1.276793, 1, 0, 0, 1, 1,
-1.258019, -0.4189365, -1.238542, 0, 0, 0, 1, 1,
-1.257438, -0.437125, -0.7989587, 0, 0, 0, 1, 1,
-1.252722, -0.3214535, -1.852092, 0, 0, 0, 1, 1,
-1.24264, 1.443294, -0.09390443, 0, 0, 0, 1, 1,
-1.24224, 0.7019319, -1.336714, 0, 0, 0, 1, 1,
-1.238401, 1.35499, -1.358462, 0, 0, 0, 1, 1,
-1.236516, -0.622875, -2.146511, 0, 0, 0, 1, 1,
-1.228773, 0.3153306, -2.465193, 1, 1, 1, 1, 1,
-1.225528, 0.5933465, -1.604035, 1, 1, 1, 1, 1,
-1.222893, 2.072005, -0.8454954, 1, 1, 1, 1, 1,
-1.221502, 0.4420004, -0.1804025, 1, 1, 1, 1, 1,
-1.220736, -0.2124312, -0.4273858, 1, 1, 1, 1, 1,
-1.208809, -1.031436, -3.639068, 1, 1, 1, 1, 1,
-1.204644, 1.250985, -1.999363, 1, 1, 1, 1, 1,
-1.202802, 1.087861, -0.4686215, 1, 1, 1, 1, 1,
-1.202097, -0.9501339, -2.588231, 1, 1, 1, 1, 1,
-1.195536, -2.324579, -2.615444, 1, 1, 1, 1, 1,
-1.191269, -1.173669, -3.656698, 1, 1, 1, 1, 1,
-1.189777, 0.7625557, -0.8146018, 1, 1, 1, 1, 1,
-1.186966, -0.922253, -2.916862, 1, 1, 1, 1, 1,
-1.185043, -0.7603711, -0.9957542, 1, 1, 1, 1, 1,
-1.154832, -0.1471782, -1.711572, 1, 1, 1, 1, 1,
-1.141342, 0.1471822, -0.9604343, 0, 0, 1, 1, 1,
-1.129178, 0.3531201, -1.289088, 1, 0, 0, 1, 1,
-1.121546, -0.09328516, -0.2594574, 1, 0, 0, 1, 1,
-1.120954, -0.8395275, -2.725276, 1, 0, 0, 1, 1,
-1.112972, -0.4536414, -0.1442793, 1, 0, 0, 1, 1,
-1.102332, -2.19615, -3.181451, 1, 0, 0, 1, 1,
-1.098914, 0.6029969, -2.361144, 0, 0, 0, 1, 1,
-1.094258, -0.5735751, -1.206658, 0, 0, 0, 1, 1,
-1.087669, 0.8072916, -0.8103256, 0, 0, 0, 1, 1,
-1.084557, -0.445035, -2.287354, 0, 0, 0, 1, 1,
-1.081934, -0.4443329, -3.147453, 0, 0, 0, 1, 1,
-1.072871, 1.53309, -2.238331, 0, 0, 0, 1, 1,
-1.068526, -1.188935, -3.108849, 0, 0, 0, 1, 1,
-1.057896, -0.6930645, -2.039145, 1, 1, 1, 1, 1,
-1.054223, -0.08823529, -2.676705, 1, 1, 1, 1, 1,
-1.053795, -3.463544, -2.649941, 1, 1, 1, 1, 1,
-1.052817, -0.3057552, -1.421806, 1, 1, 1, 1, 1,
-1.042706, -0.2592573, -1.052127, 1, 1, 1, 1, 1,
-1.034418, -0.4483441, -0.5142246, 1, 1, 1, 1, 1,
-1.032904, 0.6351522, -1.129153, 1, 1, 1, 1, 1,
-1.032088, 0.2390971, -1.326194, 1, 1, 1, 1, 1,
-1.031131, 0.3964188, -1.644185, 1, 1, 1, 1, 1,
-1.025609, -2.013753, -3.166383, 1, 1, 1, 1, 1,
-1.024447, -1.098426, -1.395143, 1, 1, 1, 1, 1,
-1.023589, 0.3721828, -1.079529, 1, 1, 1, 1, 1,
-1.017655, 0.4466309, 0.5566092, 1, 1, 1, 1, 1,
-1.012461, -0.07105541, -1.247442, 1, 1, 1, 1, 1,
-1.011774, 0.7031053, -0.9776825, 1, 1, 1, 1, 1,
-1.007796, -1.121542, -3.940946, 0, 0, 1, 1, 1,
-1.005689, 0.0516667, -2.718287, 1, 0, 0, 1, 1,
-1.002167, -1.986926, -2.812376, 1, 0, 0, 1, 1,
-0.9980277, 1.413877, 0.8943814, 1, 0, 0, 1, 1,
-0.9971947, 1.469905, 0.1839581, 1, 0, 0, 1, 1,
-0.9922263, -0.8252459, -0.9059045, 1, 0, 0, 1, 1,
-0.985825, 1.167988, 0.05729655, 0, 0, 0, 1, 1,
-0.9782022, 0.8744668, -2.399484, 0, 0, 0, 1, 1,
-0.978176, -0.1650236, -1.978469, 0, 0, 0, 1, 1,
-0.971153, -1.102574, -3.164286, 0, 0, 0, 1, 1,
-0.9694206, 0.5172597, -0.96014, 0, 0, 0, 1, 1,
-0.9677048, 1.186404, 0.2929901, 0, 0, 0, 1, 1,
-0.9665201, 0.1394786, -2.740589, 0, 0, 0, 1, 1,
-0.9578131, -0.2362323, -1.663062, 1, 1, 1, 1, 1,
-0.9472941, 1.055609, -0.242439, 1, 1, 1, 1, 1,
-0.9466142, 1.430669, -2.050276, 1, 1, 1, 1, 1,
-0.9460219, -0.3290895, -1.774555, 1, 1, 1, 1, 1,
-0.9363288, 0.4981147, -0.131953, 1, 1, 1, 1, 1,
-0.9216787, -0.5933214, -2.275395, 1, 1, 1, 1, 1,
-0.9208875, 0.9035233, 0.6504961, 1, 1, 1, 1, 1,
-0.9105763, 2.589906, 0.6497667, 1, 1, 1, 1, 1,
-0.9072696, 1.351628, -1.96014, 1, 1, 1, 1, 1,
-0.9064455, 0.3496709, 1.100871, 1, 1, 1, 1, 1,
-0.9031253, -1.297634, -2.411633, 1, 1, 1, 1, 1,
-0.9028054, 0.7346372, -1.597678, 1, 1, 1, 1, 1,
-0.898213, 0.993564, -1.258103, 1, 1, 1, 1, 1,
-0.8975264, -1.359479, -2.444198, 1, 1, 1, 1, 1,
-0.8972476, 1.153096, -1.142391, 1, 1, 1, 1, 1,
-0.8889648, -1.453155, -1.904708, 0, 0, 1, 1, 1,
-0.8874697, 2.195175, -0.6125759, 1, 0, 0, 1, 1,
-0.8845372, -1.23568, -1.527363, 1, 0, 0, 1, 1,
-0.8818614, -0.2833218, -1.469243, 1, 0, 0, 1, 1,
-0.880262, 0.176951, -1.147729, 1, 0, 0, 1, 1,
-0.880217, 0.7511744, -1.526284, 1, 0, 0, 1, 1,
-0.8782029, -0.8524783, -1.864682, 0, 0, 0, 1, 1,
-0.8754846, 0.02049275, -3.489992, 0, 0, 0, 1, 1,
-0.8731248, -0.2911167, -2.437788, 0, 0, 0, 1, 1,
-0.866511, -1.053271, -2.218229, 0, 0, 0, 1, 1,
-0.8638582, 0.4829894, -0.8503293, 0, 0, 0, 1, 1,
-0.862848, -0.6848068, -3.045603, 0, 0, 0, 1, 1,
-0.8610086, 0.9998958, -1.332687, 0, 0, 0, 1, 1,
-0.8582712, -1.203765, -1.303836, 1, 1, 1, 1, 1,
-0.8548232, -0.7777913, -0.7446261, 1, 1, 1, 1, 1,
-0.8547691, 0.2764054, -1.709472, 1, 1, 1, 1, 1,
-0.8543239, 0.4873117, -0.5215415, 1, 1, 1, 1, 1,
-0.8528625, -0.7457671, -2.140702, 1, 1, 1, 1, 1,
-0.8451896, -0.2828618, -1.706427, 1, 1, 1, 1, 1,
-0.8379644, 1.081195, 0.8186646, 1, 1, 1, 1, 1,
-0.8355348, -0.02693017, -1.815585, 1, 1, 1, 1, 1,
-0.8347331, 1.290519, 0.33435, 1, 1, 1, 1, 1,
-0.8299202, -0.3041559, -1.634488, 1, 1, 1, 1, 1,
-0.8288195, -1.231153, -2.507653, 1, 1, 1, 1, 1,
-0.8280317, 0.7621678, 0.1059534, 1, 1, 1, 1, 1,
-0.827916, 1.765168, 0.8907682, 1, 1, 1, 1, 1,
-0.8271702, 0.8236621, -0.4671943, 1, 1, 1, 1, 1,
-0.8253547, 0.5400346, 0.9968918, 1, 1, 1, 1, 1,
-0.8188187, -0.7622718, -1.164233, 0, 0, 1, 1, 1,
-0.8131676, 0.6004296, 0.1134865, 1, 0, 0, 1, 1,
-0.8108588, 0.3648284, -1.970507, 1, 0, 0, 1, 1,
-0.810746, 0.2595583, -1.126786, 1, 0, 0, 1, 1,
-0.8059906, -0.6570839, -3.0702, 1, 0, 0, 1, 1,
-0.7967989, -0.7398298, -1.45417, 1, 0, 0, 1, 1,
-0.7932873, 0.4673124, -0.878163, 0, 0, 0, 1, 1,
-0.7924299, -0.06536078, -1.7828, 0, 0, 0, 1, 1,
-0.7843614, 0.1792567, -0.7451068, 0, 0, 0, 1, 1,
-0.7744253, 0.5536728, -0.07328708, 0, 0, 0, 1, 1,
-0.773406, 0.593371, -1.004041, 0, 0, 0, 1, 1,
-0.7732279, -1.020962, -1.85289, 0, 0, 0, 1, 1,
-0.7714313, -0.3811207, -1.778901, 0, 0, 0, 1, 1,
-0.7651659, -0.8858435, 0.4706222, 1, 1, 1, 1, 1,
-0.7642318, 0.3013765, -0.1663348, 1, 1, 1, 1, 1,
-0.7600101, 0.6442096, -2.453833, 1, 1, 1, 1, 1,
-0.7583583, 1.981424, 1.170172, 1, 1, 1, 1, 1,
-0.757372, -0.7748708, 0.4659911, 1, 1, 1, 1, 1,
-0.7548386, -0.8454987, -0.7209892, 1, 1, 1, 1, 1,
-0.7514156, 0.0992723, -0.8991045, 1, 1, 1, 1, 1,
-0.7506802, 0.9839411, -2.035702, 1, 1, 1, 1, 1,
-0.7435876, 1.005251, -2.04557, 1, 1, 1, 1, 1,
-0.7434422, 0.9579126, -0.09067436, 1, 1, 1, 1, 1,
-0.7396005, 0.47552, -1.74936, 1, 1, 1, 1, 1,
-0.7390527, -1.248914, -3.053178, 1, 1, 1, 1, 1,
-0.7283354, 0.3362176, -2.882791, 1, 1, 1, 1, 1,
-0.7079737, -0.9642038, -2.603939, 1, 1, 1, 1, 1,
-0.7070678, -1.160786, -1.981165, 1, 1, 1, 1, 1,
-0.7033744, -0.9715476, -1.865069, 0, 0, 1, 1, 1,
-0.7033027, -0.3411946, -2.763852, 1, 0, 0, 1, 1,
-0.7007498, 0.5168714, -3.261748, 1, 0, 0, 1, 1,
-0.6964306, -1.187744, -2.882647, 1, 0, 0, 1, 1,
-0.6906309, -1.62129, -1.343833, 1, 0, 0, 1, 1,
-0.6874119, -0.02512116, -1.35134, 1, 0, 0, 1, 1,
-0.6847208, 1.493062, -0.5983115, 0, 0, 0, 1, 1,
-0.6826512, -0.4620767, -3.588788, 0, 0, 0, 1, 1,
-0.6773129, 0.6198541, -2.622612, 0, 0, 0, 1, 1,
-0.6739137, -0.1840318, -1.906801, 0, 0, 0, 1, 1,
-0.6724275, -0.734062, -2.144052, 0, 0, 0, 1, 1,
-0.6722205, -0.4112568, -1.076514, 0, 0, 0, 1, 1,
-0.6722025, 2.07918, 1.281671, 0, 0, 0, 1, 1,
-0.6674783, 0.3892991, -1.405048, 1, 1, 1, 1, 1,
-0.6663949, -0.50412, -2.083013, 1, 1, 1, 1, 1,
-0.6645429, -0.807282, -1.461484, 1, 1, 1, 1, 1,
-0.6494697, 2.172181, -0.323058, 1, 1, 1, 1, 1,
-0.6444514, -0.5131282, -2.783962, 1, 1, 1, 1, 1,
-0.6416957, -0.8456791, -1.470845, 1, 1, 1, 1, 1,
-0.6402913, -1.452801, -2.568069, 1, 1, 1, 1, 1,
-0.634417, -0.6190709, -3.072354, 1, 1, 1, 1, 1,
-0.6319758, 0.494612, 0.46466, 1, 1, 1, 1, 1,
-0.6238192, -0.1442863, -2.06695, 1, 1, 1, 1, 1,
-0.6173332, -0.01999884, -0.6153131, 1, 1, 1, 1, 1,
-0.6157574, 0.3750364, -1.517992, 1, 1, 1, 1, 1,
-0.615474, 1.013995, -1.820544, 1, 1, 1, 1, 1,
-0.6152467, -0.09032831, -1.792102, 1, 1, 1, 1, 1,
-0.614244, 0.5872417, -0.2379993, 1, 1, 1, 1, 1,
-0.6134018, -1.6906, -2.982175, 0, 0, 1, 1, 1,
-0.613009, -0.5697636, -1.063034, 1, 0, 0, 1, 1,
-0.612617, 2.191117, -0.145507, 1, 0, 0, 1, 1,
-0.6121921, -1.561066, -2.583639, 1, 0, 0, 1, 1,
-0.6046291, -1.178284, -4.840924, 1, 0, 0, 1, 1,
-0.6013249, -0.324673, -1.646604, 1, 0, 0, 1, 1,
-0.5958762, 0.03766974, -2.840101, 0, 0, 0, 1, 1,
-0.5954512, -0.222713, -1.810113, 0, 0, 0, 1, 1,
-0.5937652, 0.6769534, -0.4327775, 0, 0, 0, 1, 1,
-0.5929253, 0.5989213, -0.2432651, 0, 0, 0, 1, 1,
-0.5920349, -0.3424516, -2.609869, 0, 0, 0, 1, 1,
-0.5909808, 0.1754909, -1.61044, 0, 0, 0, 1, 1,
-0.5904611, 1.134349, 1.644342, 0, 0, 0, 1, 1,
-0.5854203, 0.2267028, -1.102614, 1, 1, 1, 1, 1,
-0.5850366, 0.009123516, -1.686341, 1, 1, 1, 1, 1,
-0.5777144, -0.1796481, -2.726587, 1, 1, 1, 1, 1,
-0.5735816, 1.457543, -0.4624051, 1, 1, 1, 1, 1,
-0.5712222, 0.2661469, -0.4037635, 1, 1, 1, 1, 1,
-0.5649896, 0.2858216, -1.958799, 1, 1, 1, 1, 1,
-0.5622987, -1.173185, -2.342618, 1, 1, 1, 1, 1,
-0.5609536, -1.753709, -2.185738, 1, 1, 1, 1, 1,
-0.5585379, 1.584093, 0.07585526, 1, 1, 1, 1, 1,
-0.5487731, -0.5991258, -3.040822, 1, 1, 1, 1, 1,
-0.5459077, 0.6059855, -0.2734289, 1, 1, 1, 1, 1,
-0.5447867, -1.719678, -3.1666, 1, 1, 1, 1, 1,
-0.5435385, 1.969757, -1.366878, 1, 1, 1, 1, 1,
-0.5380231, 0.6297709, -0.5526545, 1, 1, 1, 1, 1,
-0.5372803, 1.338535, -0.8500827, 1, 1, 1, 1, 1,
-0.5339624, 1.297281, 1.739264, 0, 0, 1, 1, 1,
-0.5300046, -0.3039548, -3.613909, 1, 0, 0, 1, 1,
-0.5292077, -0.7745075, -4.140831, 1, 0, 0, 1, 1,
-0.5289258, 1.381718, -0.4271196, 1, 0, 0, 1, 1,
-0.5260557, 0.6763955, -0.6722578, 1, 0, 0, 1, 1,
-0.519215, 0.5276883, -2.145406, 1, 0, 0, 1, 1,
-0.5131321, -0.0925277, -1.62806, 0, 0, 0, 1, 1,
-0.5108484, 1.768572, 0.3738796, 0, 0, 0, 1, 1,
-0.5105987, 1.812088, -0.8969596, 0, 0, 0, 1, 1,
-0.5091718, -1.493475, -1.170102, 0, 0, 0, 1, 1,
-0.5086586, -0.8917884, -1.339599, 0, 0, 0, 1, 1,
-0.503053, 0.4694596, -3.035906, 0, 0, 0, 1, 1,
-0.5024608, -0.2406752, -2.066505, 0, 0, 0, 1, 1,
-0.4990547, -0.4749599, -2.37152, 1, 1, 1, 1, 1,
-0.4981447, 0.5202026, -0.302482, 1, 1, 1, 1, 1,
-0.4958858, -1.406624, -1.402684, 1, 1, 1, 1, 1,
-0.4940423, -0.002039745, -2.251379, 1, 1, 1, 1, 1,
-0.4937368, -0.3646505, -0.08593616, 1, 1, 1, 1, 1,
-0.4935818, -1.080977, -0.8419931, 1, 1, 1, 1, 1,
-0.4932465, -1.113445, -2.531426, 1, 1, 1, 1, 1,
-0.4924628, -0.1244882, -1.867367, 1, 1, 1, 1, 1,
-0.4924458, 0.0156165, -1.793042, 1, 1, 1, 1, 1,
-0.4842581, 0.9486358, -0.2240678, 1, 1, 1, 1, 1,
-0.4827439, 0.3345935, -1.890647, 1, 1, 1, 1, 1,
-0.4796675, -0.3131666, -2.852389, 1, 1, 1, 1, 1,
-0.4772187, 0.2078555, -2.509084, 1, 1, 1, 1, 1,
-0.4719389, 0.8007621, 0.9540564, 1, 1, 1, 1, 1,
-0.4710815, 0.2799763, -1.272208, 1, 1, 1, 1, 1,
-0.4705056, 1.029724, 0.02614168, 0, 0, 1, 1, 1,
-0.4693542, -0.1249218, -2.642886, 1, 0, 0, 1, 1,
-0.4607282, 0.3486063, 0.1754762, 1, 0, 0, 1, 1,
-0.456357, 0.3354309, -0.7324248, 1, 0, 0, 1, 1,
-0.4526556, 1.075685, -0.6722765, 1, 0, 0, 1, 1,
-0.4490761, -0.5621316, -2.154299, 1, 0, 0, 1, 1,
-0.4443155, -0.2713726, -0.5537953, 0, 0, 0, 1, 1,
-0.4410625, 0.3320529, -1.229026, 0, 0, 0, 1, 1,
-0.4409477, -0.5826818, -1.727232, 0, 0, 0, 1, 1,
-0.4397847, 0.7330465, -1.062042, 0, 0, 0, 1, 1,
-0.4349703, -1.087572, -3.369552, 0, 0, 0, 1, 1,
-0.4293497, 0.2611195, -0.6053094, 0, 0, 0, 1, 1,
-0.4269769, 0.6883723, 0.4181571, 0, 0, 0, 1, 1,
-0.426404, -1.404477, -3.922436, 1, 1, 1, 1, 1,
-0.4242761, 0.1017781, -0.169621, 1, 1, 1, 1, 1,
-0.4219166, 0.414294, -0.4851802, 1, 1, 1, 1, 1,
-0.4183433, 1.26977, -1.157879, 1, 1, 1, 1, 1,
-0.4122579, 0.2777472, 0.8512868, 1, 1, 1, 1, 1,
-0.4028677, 1.014578, -2.120702, 1, 1, 1, 1, 1,
-0.3997937, -0.03135108, -1.017771, 1, 1, 1, 1, 1,
-0.3948666, -0.2653142, -0.8700579, 1, 1, 1, 1, 1,
-0.3918239, 0.4315027, -1.725103, 1, 1, 1, 1, 1,
-0.3909183, 0.05921661, -0.6634605, 1, 1, 1, 1, 1,
-0.3885657, 0.4136614, -0.7794863, 1, 1, 1, 1, 1,
-0.3859699, 0.229386, -0.6568985, 1, 1, 1, 1, 1,
-0.380398, 1.490465, 0.5178093, 1, 1, 1, 1, 1,
-0.3740075, -1.721819, -1.370555, 1, 1, 1, 1, 1,
-0.3722758, 0.2538365, -1.906575, 1, 1, 1, 1, 1,
-0.3711573, -0.4103592, -0.9409007, 0, 0, 1, 1, 1,
-0.3710656, 0.2764957, 1.28633, 1, 0, 0, 1, 1,
-0.3697049, 0.5532619, -1.162967, 1, 0, 0, 1, 1,
-0.363504, -3.043293, -1.938987, 1, 0, 0, 1, 1,
-0.3616335, -2.017705, -2.893716, 1, 0, 0, 1, 1,
-0.3606731, -1.714956, -3.46852, 1, 0, 0, 1, 1,
-0.3540361, 0.6347397, -0.7543774, 0, 0, 0, 1, 1,
-0.3536675, -0.4781692, -2.806891, 0, 0, 0, 1, 1,
-0.3510913, 0.0420412, 0.09612339, 0, 0, 0, 1, 1,
-0.3507323, 0.2760229, -0.8887057, 0, 0, 0, 1, 1,
-0.3463765, -2.888801, -2.528678, 0, 0, 0, 1, 1,
-0.3403294, 1.330008, -1.570649, 0, 0, 0, 1, 1,
-0.3342761, 1.29183, -0.9296453, 0, 0, 0, 1, 1,
-0.3290006, -1.6223, -1.658831, 1, 1, 1, 1, 1,
-0.3265969, -0.7195113, -0.8017436, 1, 1, 1, 1, 1,
-0.3261646, -0.06070007, -2.538416, 1, 1, 1, 1, 1,
-0.3230511, -0.5127302, -2.438358, 1, 1, 1, 1, 1,
-0.3225259, 1.580085, 0.3248543, 1, 1, 1, 1, 1,
-0.3223698, -0.9910405, -3.373727, 1, 1, 1, 1, 1,
-0.3158982, -0.7356013, -3.325464, 1, 1, 1, 1, 1,
-0.3134477, 0.4800836, -0.9890875, 1, 1, 1, 1, 1,
-0.3112769, -0.4133241, -2.541464, 1, 1, 1, 1, 1,
-0.3092684, -0.09462688, -0.6639056, 1, 1, 1, 1, 1,
-0.3036273, 0.4841648, -1.40015, 1, 1, 1, 1, 1,
-0.3030582, 0.2096196, -0.7344775, 1, 1, 1, 1, 1,
-0.3027459, 0.7700281, -0.03835577, 1, 1, 1, 1, 1,
-0.3001797, -0.7582577, -3.610339, 1, 1, 1, 1, 1,
-0.2970403, 0.4627794, 0.5326633, 1, 1, 1, 1, 1,
-0.2949589, -0.3227598, -0.6688013, 0, 0, 1, 1, 1,
-0.2924107, 0.8747395, 1.266143, 1, 0, 0, 1, 1,
-0.2891699, -2.441486, -4.434345, 1, 0, 0, 1, 1,
-0.287803, 1.468358, -0.08219827, 1, 0, 0, 1, 1,
-0.2836124, 0.8606996, 0.1015533, 1, 0, 0, 1, 1,
-0.2829178, -0.2236642, -2.676453, 1, 0, 0, 1, 1,
-0.2808238, -1.015817, -2.543707, 0, 0, 0, 1, 1,
-0.2738919, 0.2648391, 0.1921968, 0, 0, 0, 1, 1,
-0.2733, 0.229404, -0.7655413, 0, 0, 0, 1, 1,
-0.2701529, 1.194409, 0.8573503, 0, 0, 0, 1, 1,
-0.2684628, 0.03241327, -2.117764, 0, 0, 0, 1, 1,
-0.262383, -0.6063499, -2.413087, 0, 0, 0, 1, 1,
-0.2605824, 1.841007, -0.3233302, 0, 0, 0, 1, 1,
-0.2585833, 0.03202352, -2.369351, 1, 1, 1, 1, 1,
-0.2540541, 1.873697, -0.9725575, 1, 1, 1, 1, 1,
-0.2529862, 1.552392, -0.021368, 1, 1, 1, 1, 1,
-0.2519643, 0.2470301, -2.070275, 1, 1, 1, 1, 1,
-0.2508522, -0.09990089, -2.284545, 1, 1, 1, 1, 1,
-0.2447664, 1.067937, -0.4785229, 1, 1, 1, 1, 1,
-0.244287, 2.27263, 0.2697713, 1, 1, 1, 1, 1,
-0.2384502, 0.1136062, -1.65036, 1, 1, 1, 1, 1,
-0.237748, 0.4743572, 0.6319008, 1, 1, 1, 1, 1,
-0.2367999, 2.652873, -0.4629031, 1, 1, 1, 1, 1,
-0.2326198, 0.3799631, 1.007495, 1, 1, 1, 1, 1,
-0.231067, -0.4584205, -2.363664, 1, 1, 1, 1, 1,
-0.2301346, 0.4170299, -1.046521, 1, 1, 1, 1, 1,
-0.2288073, 1.095406, 1.543331, 1, 1, 1, 1, 1,
-0.2283553, 0.04805356, -3.034682, 1, 1, 1, 1, 1,
-0.226707, -0.6888242, -4.166619, 0, 0, 1, 1, 1,
-0.2252234, -1.114414, -3.658177, 1, 0, 0, 1, 1,
-0.2243366, -1.792151, -2.711013, 1, 0, 0, 1, 1,
-0.2243066, -0.5478472, -2.904616, 1, 0, 0, 1, 1,
-0.2182568, 0.0892236, -2.696391, 1, 0, 0, 1, 1,
-0.2158933, 0.2460407, -0.4021374, 1, 0, 0, 1, 1,
-0.2115901, 2.616606, 1.028839, 0, 0, 0, 1, 1,
-0.2110601, -0.3616047, -0.1034559, 0, 0, 0, 1, 1,
-0.2101752, -0.29734, -2.052911, 0, 0, 0, 1, 1,
-0.2048156, 0.138935, -1.52069, 0, 0, 0, 1, 1,
-0.1955473, -2.615884, -3.345168, 0, 0, 0, 1, 1,
-0.1911113, 1.327877, 0.5820054, 0, 0, 0, 1, 1,
-0.1901706, -0.511457, -3.495243, 0, 0, 0, 1, 1,
-0.1898244, 2.802871, 0.4269408, 1, 1, 1, 1, 1,
-0.1895581, 1.241541, -1.237319, 1, 1, 1, 1, 1,
-0.1860213, -1.487621, -2.674877, 1, 1, 1, 1, 1,
-0.1850788, -0.4652959, -0.7519245, 1, 1, 1, 1, 1,
-0.1819769, -0.9811349, -5.206689, 1, 1, 1, 1, 1,
-0.1813217, -0.1257206, -2.539891, 1, 1, 1, 1, 1,
-0.1808724, 1.663092, 0.2822685, 1, 1, 1, 1, 1,
-0.1806961, -0.5129687, -1.837088, 1, 1, 1, 1, 1,
-0.180654, 0.8766253, 0.3587519, 1, 1, 1, 1, 1,
-0.1780832, 0.7325844, -1.963103, 1, 1, 1, 1, 1,
-0.1765411, 0.4531678, -0.6373117, 1, 1, 1, 1, 1,
-0.1753062, 0.4383957, -1.046144, 1, 1, 1, 1, 1,
-0.1700711, -0.5143346, -2.875616, 1, 1, 1, 1, 1,
-0.1683838, 0.6030626, -0.0399425, 1, 1, 1, 1, 1,
-0.1626015, -0.9980928, -4.294104, 1, 1, 1, 1, 1,
-0.1608644, -0.8572093, -3.157023, 0, 0, 1, 1, 1,
-0.1567169, 0.854732, 0.354825, 1, 0, 0, 1, 1,
-0.1535281, 0.01075631, -1.367941, 1, 0, 0, 1, 1,
-0.1510611, 0.02080568, -0.2339643, 1, 0, 0, 1, 1,
-0.150887, 0.1641433, -1.722214, 1, 0, 0, 1, 1,
-0.1488432, 0.3348237, -0.6403608, 1, 0, 0, 1, 1,
-0.1476326, -0.421413, -3.722528, 0, 0, 0, 1, 1,
-0.1447015, 0.4576316, -0.467899, 0, 0, 0, 1, 1,
-0.1410646, 0.4023206, -0.4703458, 0, 0, 0, 1, 1,
-0.1379295, 0.7726256, -0.3661499, 0, 0, 0, 1, 1,
-0.137159, 0.4899252, -1.379776, 0, 0, 0, 1, 1,
-0.1364576, -2.017006, -3.259177, 0, 0, 0, 1, 1,
-0.1345652, 0.6978444, 1.364209, 0, 0, 0, 1, 1,
-0.132215, 0.8872033, -1.093623, 1, 1, 1, 1, 1,
-0.1311546, 0.4881277, -1.253353, 1, 1, 1, 1, 1,
-0.1311103, -0.3279645, -0.9899091, 1, 1, 1, 1, 1,
-0.127134, 1.159183, -0.8179393, 1, 1, 1, 1, 1,
-0.1230583, 0.697616, -1.116226, 1, 1, 1, 1, 1,
-0.121531, -1.205246, -1.193429, 1, 1, 1, 1, 1,
-0.1194197, 0.09180685, -1.714557, 1, 1, 1, 1, 1,
-0.1160098, -1.371131, -4.158761, 1, 1, 1, 1, 1,
-0.1151391, -0.1763429, -0.6215945, 1, 1, 1, 1, 1,
-0.107517, -0.2111425, -3.182606, 1, 1, 1, 1, 1,
-0.1045595, 1.343447, 0.3866115, 1, 1, 1, 1, 1,
-0.1006341, -0.3559583, -4.875392, 1, 1, 1, 1, 1,
-0.0967106, -0.04044778, -1.907959, 1, 1, 1, 1, 1,
-0.09610361, -0.1273053, -2.257549, 1, 1, 1, 1, 1,
-0.09526697, -0.8826246, -3.542149, 1, 1, 1, 1, 1,
-0.09301136, 1.414702, 0.8348522, 0, 0, 1, 1, 1,
-0.08464736, 1.621681, 0.4748452, 1, 0, 0, 1, 1,
-0.07843586, 0.4908561, 1.548282, 1, 0, 0, 1, 1,
-0.07114782, 0.7991002, 0.0955556, 1, 0, 0, 1, 1,
-0.0702965, 1.961903, 1.962135, 1, 0, 0, 1, 1,
-0.06648023, -1.235905, -3.78016, 1, 0, 0, 1, 1,
-0.06275117, 1.415928, -1.793013, 0, 0, 0, 1, 1,
-0.06251091, 1.278014, 0.666048, 0, 0, 0, 1, 1,
-0.06219188, 0.1491537, -0.5133444, 0, 0, 0, 1, 1,
-0.05967272, 0.1868421, 0.7068508, 0, 0, 0, 1, 1,
-0.05778442, 0.356671, 0.1008905, 0, 0, 0, 1, 1,
-0.05640071, 0.1888476, -1.56448, 0, 0, 0, 1, 1,
-0.05623949, 0.3848865, 0.471777, 0, 0, 0, 1, 1,
-0.05521961, 1.769158, -3.291813, 1, 1, 1, 1, 1,
-0.04669035, -1.588332, -2.321121, 1, 1, 1, 1, 1,
-0.04650889, -0.3425239, -4.119321, 1, 1, 1, 1, 1,
-0.04387131, -0.5007685, -3.582146, 1, 1, 1, 1, 1,
-0.04091372, 0.003222923, -1.700619, 1, 1, 1, 1, 1,
-0.03708129, 0.5717643, -1.410349, 1, 1, 1, 1, 1,
-0.03526425, -0.4888466, -1.766514, 1, 1, 1, 1, 1,
-0.03369119, -0.8602144, -2.434083, 1, 1, 1, 1, 1,
-0.03006943, -0.1409202, -3.270526, 1, 1, 1, 1, 1,
-0.02896187, -1.817557, -4.104086, 1, 1, 1, 1, 1,
-0.02630444, 1.124355, -0.2038111, 1, 1, 1, 1, 1,
-0.01412957, -2.18614, -1.976737, 1, 1, 1, 1, 1,
-0.01368973, 1.412297, 0.2940634, 1, 1, 1, 1, 1,
-0.01271173, 1.696952, -0.777319, 1, 1, 1, 1, 1,
-0.01066931, -0.9555736, -2.687767, 1, 1, 1, 1, 1,
-0.01066775, 1.223105, -0.1430835, 0, 0, 1, 1, 1,
-0.01017013, 1.435866, 1.363415, 1, 0, 0, 1, 1,
-0.01006121, -1.127381, -2.980651, 1, 0, 0, 1, 1,
-0.00662687, 1.056758, 0.1236691, 1, 0, 0, 1, 1,
-0.001496204, -0.4915335, -4.823737, 1, 0, 0, 1, 1,
-0.0004811814, -1.069098, -2.621279, 1, 0, 0, 1, 1,
-0.0003600349, 0.3028118, 0.0160834, 0, 0, 0, 1, 1,
0.00310966, 0.2185489, 0.3674265, 0, 0, 0, 1, 1,
0.007723709, -0.07151747, 2.154232, 0, 0, 0, 1, 1,
0.01015502, 0.4108731, -1.9386, 0, 0, 0, 1, 1,
0.01551702, -0.9851236, 6.421369, 0, 0, 0, 1, 1,
0.02213102, -0.2936535, 2.869384, 0, 0, 0, 1, 1,
0.02332508, -0.2575371, 2.560456, 0, 0, 0, 1, 1,
0.02449525, -1.359283, 3.469716, 1, 1, 1, 1, 1,
0.03125278, -2.682025, 3.43339, 1, 1, 1, 1, 1,
0.03284254, 0.1165705, 1.503781, 1, 1, 1, 1, 1,
0.03554009, -0.7377573, 2.18056, 1, 1, 1, 1, 1,
0.03734806, 0.8872959, -0.4746218, 1, 1, 1, 1, 1,
0.04016586, -1.841806, 2.428846, 1, 1, 1, 1, 1,
0.04303298, 0.3050787, -0.2483784, 1, 1, 1, 1, 1,
0.0458366, -0.9442128, 4.249743, 1, 1, 1, 1, 1,
0.05468838, -0.6279171, 2.915262, 1, 1, 1, 1, 1,
0.0569829, 0.676642, 1.069179, 1, 1, 1, 1, 1,
0.05940574, -0.1302166, 1.739146, 1, 1, 1, 1, 1,
0.06052883, 0.2276419, 0.02902536, 1, 1, 1, 1, 1,
0.06327789, -0.4104437, 2.983826, 1, 1, 1, 1, 1,
0.06464498, 1.448122, -0.7719341, 1, 1, 1, 1, 1,
0.06608782, 0.5086057, 0.06671879, 1, 1, 1, 1, 1,
0.06857554, 0.128407, 0.389705, 0, 0, 1, 1, 1,
0.06864014, -1.991973, 3.474699, 1, 0, 0, 1, 1,
0.06988227, 0.09643354, -0.4459329, 1, 0, 0, 1, 1,
0.07268378, -1.986632, 3.571535, 1, 0, 0, 1, 1,
0.07443036, 1.333043, 0.3263005, 1, 0, 0, 1, 1,
0.07705444, 1.759059, -0.1008117, 1, 0, 0, 1, 1,
0.07778339, 0.005049777, 1.519694, 0, 0, 0, 1, 1,
0.07940453, -1.281365, 2.439723, 0, 0, 0, 1, 1,
0.08209117, 1.476522, 1.576731, 0, 0, 0, 1, 1,
0.08685561, 0.6813431, -0.3340583, 0, 0, 0, 1, 1,
0.09162222, 0.6921757, -0.6101593, 0, 0, 0, 1, 1,
0.1058069, 0.3809052, -0.610988, 0, 0, 0, 1, 1,
0.1062027, -0.1723359, 3.035014, 0, 0, 0, 1, 1,
0.1169327, 0.9167203, 1.166019, 1, 1, 1, 1, 1,
0.1183425, -0.1477668, 0.8713219, 1, 1, 1, 1, 1,
0.1211111, -0.04756357, 1.660792, 1, 1, 1, 1, 1,
0.1253161, 0.6573316, 1.18327, 1, 1, 1, 1, 1,
0.1256935, 0.6537501, 0.9048753, 1, 1, 1, 1, 1,
0.1268798, 0.2275487, 0.172509, 1, 1, 1, 1, 1,
0.1277751, 1.63718, 0.09779464, 1, 1, 1, 1, 1,
0.1280447, 0.6955069, -0.5722729, 1, 1, 1, 1, 1,
0.1324879, 1.291475, -0.6848672, 1, 1, 1, 1, 1,
0.1326494, -0.4357432, 2.809519, 1, 1, 1, 1, 1,
0.1333763, -1.691897, 2.971988, 1, 1, 1, 1, 1,
0.1372706, -0.36948, 2.235661, 1, 1, 1, 1, 1,
0.1374517, 1.169937, 0.307079, 1, 1, 1, 1, 1,
0.1397581, -0.437258, 3.275644, 1, 1, 1, 1, 1,
0.1406252, 0.7412064, 0.4839349, 1, 1, 1, 1, 1,
0.1406433, 0.9443534, 0.6272929, 0, 0, 1, 1, 1,
0.1412562, -0.6896319, 4.480988, 1, 0, 0, 1, 1,
0.1414414, -1.527712, 2.476818, 1, 0, 0, 1, 1,
0.1433146, -0.2611185, 3.212031, 1, 0, 0, 1, 1,
0.1496627, -0.277275, 3.399581, 1, 0, 0, 1, 1,
0.15006, 0.4189922, 0.4409942, 1, 0, 0, 1, 1,
0.1565412, 0.3329853, -0.5695338, 0, 0, 0, 1, 1,
0.1590583, -0.3066201, 2.923383, 0, 0, 0, 1, 1,
0.1617119, 0.382203, 2.009187, 0, 0, 0, 1, 1,
0.1642542, 0.4115152, -0.3624853, 0, 0, 0, 1, 1,
0.1652363, -0.5238704, 2.349701, 0, 0, 0, 1, 1,
0.1655993, -1.229179, 3.147207, 0, 0, 0, 1, 1,
0.1660634, 0.9761009, -0.4940744, 0, 0, 0, 1, 1,
0.1673979, -1.366517, 1.25565, 1, 1, 1, 1, 1,
0.1703831, -0.3490309, 3.841377, 1, 1, 1, 1, 1,
0.1774189, 0.9318219, 0.08002388, 1, 1, 1, 1, 1,
0.1793436, -1.981101, 3.958576, 1, 1, 1, 1, 1,
0.1832058, -0.4804591, 3.628373, 1, 1, 1, 1, 1,
0.1837867, 1.396581, 0.5593063, 1, 1, 1, 1, 1,
0.1847717, -0.5783238, 3.731622, 1, 1, 1, 1, 1,
0.189774, 0.8274059, -0.4776123, 1, 1, 1, 1, 1,
0.1903779, -0.4791715, 1.869437, 1, 1, 1, 1, 1,
0.1998174, 1.164751, 0.6453131, 1, 1, 1, 1, 1,
0.2021996, -0.6438758, 2.502916, 1, 1, 1, 1, 1,
0.2054555, -0.08441617, 2.64415, 1, 1, 1, 1, 1,
0.209531, 1.42767, 0.01752718, 1, 1, 1, 1, 1,
0.2133765, 0.3137381, 0.2853077, 1, 1, 1, 1, 1,
0.2133834, 0.1743253, -1.788379, 1, 1, 1, 1, 1,
0.2177313, -1.071487, 3.610881, 0, 0, 1, 1, 1,
0.2235814, -1.345003, 4.016944, 1, 0, 0, 1, 1,
0.2242879, 0.2298527, 0.2037224, 1, 0, 0, 1, 1,
0.2247065, 2.837379, -0.2717392, 1, 0, 0, 1, 1,
0.2273661, -0.4635648, 2.951143, 1, 0, 0, 1, 1,
0.2292739, -0.4180952, 2.89385, 1, 0, 0, 1, 1,
0.2313154, 0.7875198, 0.958963, 0, 0, 0, 1, 1,
0.232245, -1.451391, 3.45506, 0, 0, 0, 1, 1,
0.234319, -0.421571, 2.456894, 0, 0, 0, 1, 1,
0.2346686, -0.06319276, 2.905356, 0, 0, 0, 1, 1,
0.2349646, -0.4508001, 2.385631, 0, 0, 0, 1, 1,
0.2351038, 0.2255938, 0.3945061, 0, 0, 0, 1, 1,
0.2441132, -0.5793576, 3.917141, 0, 0, 0, 1, 1,
0.2480459, 0.4328526, 0.1483521, 1, 1, 1, 1, 1,
0.2485068, 0.9372148, 0.1471599, 1, 1, 1, 1, 1,
0.2519735, 1.071543, 0.601857, 1, 1, 1, 1, 1,
0.2552303, -2.205001, 2.693884, 1, 1, 1, 1, 1,
0.2556156, 0.8882291, -0.5527321, 1, 1, 1, 1, 1,
0.2679605, 0.3348471, 0.9672886, 1, 1, 1, 1, 1,
0.2685792, 0.9433513, -0.8739474, 1, 1, 1, 1, 1,
0.2706522, -1.918479, 2.936162, 1, 1, 1, 1, 1,
0.2792751, -0.8469104, 2.609891, 1, 1, 1, 1, 1,
0.2807673, -1.497441, 3.91366, 1, 1, 1, 1, 1,
0.2824574, 0.3424341, 1.469801, 1, 1, 1, 1, 1,
0.2840782, -0.05504061, 0.526584, 1, 1, 1, 1, 1,
0.2876931, -1.460198, 3.23542, 1, 1, 1, 1, 1,
0.2883204, -1.356008, 4.444777, 1, 1, 1, 1, 1,
0.288451, 0.1494541, 0.6204636, 1, 1, 1, 1, 1,
0.2891086, -0.434715, 4.416729, 0, 0, 1, 1, 1,
0.2945171, 1.090261, -1.139921, 1, 0, 0, 1, 1,
0.2951536, -0.44241, 0.2703389, 1, 0, 0, 1, 1,
0.299087, -0.5050512, 0.7650343, 1, 0, 0, 1, 1,
0.2996505, 0.4017278, -1.046785, 1, 0, 0, 1, 1,
0.3028291, -0.5602144, 0.9481932, 1, 0, 0, 1, 1,
0.3038853, -0.04932265, 1.650975, 0, 0, 0, 1, 1,
0.3095775, 0.2127648, 0.6702924, 0, 0, 0, 1, 1,
0.311602, -1.324123, 2.809295, 0, 0, 0, 1, 1,
0.3118003, 0.02843419, 1.690511, 0, 0, 0, 1, 1,
0.3161503, -0.2408758, 2.734568, 0, 0, 0, 1, 1,
0.3169574, -1.892338, 4.048289, 0, 0, 0, 1, 1,
0.3174123, -0.2296601, 2.995106, 0, 0, 0, 1, 1,
0.3176501, 0.3758618, 0.7848444, 1, 1, 1, 1, 1,
0.317881, -1.620823, 3.000927, 1, 1, 1, 1, 1,
0.3188338, -0.1698574, 1.730459, 1, 1, 1, 1, 1,
0.3208356, 0.06903208, 1.934463, 1, 1, 1, 1, 1,
0.3317606, -0.1290175, 1.361526, 1, 1, 1, 1, 1,
0.3333367, -0.5155321, 2.048525, 1, 1, 1, 1, 1,
0.3340927, 0.2454029, -0.7748384, 1, 1, 1, 1, 1,
0.336498, 1.154003, 0.6220568, 1, 1, 1, 1, 1,
0.3422998, 0.3527322, -0.4541568, 1, 1, 1, 1, 1,
0.3456023, 0.5538596, -0.7201436, 1, 1, 1, 1, 1,
0.3478473, -0.6483537, 2.049435, 1, 1, 1, 1, 1,
0.3503202, 0.08275589, 0.638245, 1, 1, 1, 1, 1,
0.3526329, 0.552039, 0.4793666, 1, 1, 1, 1, 1,
0.3534751, -0.8198217, 2.022774, 1, 1, 1, 1, 1,
0.3566696, 0.1280799, 0.1268136, 1, 1, 1, 1, 1,
0.3569824, 0.1331436, 1.61206, 0, 0, 1, 1, 1,
0.3591065, 0.2589059, 1.182963, 1, 0, 0, 1, 1,
0.3600885, -1.14393, 3.862757, 1, 0, 0, 1, 1,
0.3608325, -1.492173, 3.363894, 1, 0, 0, 1, 1,
0.363677, -0.3432579, 1.221308, 1, 0, 0, 1, 1,
0.366526, -0.6211599, 1.692871, 1, 0, 0, 1, 1,
0.3728616, -1.890947, 2.924249, 0, 0, 0, 1, 1,
0.388041, 0.9113677, 0.2749774, 0, 0, 0, 1, 1,
0.3901559, -1.501045, 1.788687, 0, 0, 0, 1, 1,
0.393995, 0.5307946, 0.7613307, 0, 0, 0, 1, 1,
0.3949881, -0.00203428, 1.270324, 0, 0, 0, 1, 1,
0.3954362, -0.1554883, 0.5867561, 0, 0, 0, 1, 1,
0.3992292, 1.636898, 0.2687657, 0, 0, 0, 1, 1,
0.3999044, 0.3600825, 0.9849254, 1, 1, 1, 1, 1,
0.4016084, -0.8727189, 2.411762, 1, 1, 1, 1, 1,
0.404893, 0.5200207, 0.9466729, 1, 1, 1, 1, 1,
0.4056883, -1.298004, 2.667097, 1, 1, 1, 1, 1,
0.4072178, -1.04103, 4.961036, 1, 1, 1, 1, 1,
0.4082097, 0.02124752, 1.591027, 1, 1, 1, 1, 1,
0.4115905, -1.103043, 2.788331, 1, 1, 1, 1, 1,
0.4130912, 0.351156, 1.01369, 1, 1, 1, 1, 1,
0.4171098, 1.473031, 0.2918718, 1, 1, 1, 1, 1,
0.42688, -1.024473, 2.787249, 1, 1, 1, 1, 1,
0.4325258, 1.301962, -1.284624, 1, 1, 1, 1, 1,
0.4346405, -0.3544424, 2.209651, 1, 1, 1, 1, 1,
0.4367535, 0.8410813, -0.1145594, 1, 1, 1, 1, 1,
0.4373167, -1.074989, 2.598489, 1, 1, 1, 1, 1,
0.4412687, 0.3293225, 1.845498, 1, 1, 1, 1, 1,
0.4419091, 1.161081, 1.184907, 0, 0, 1, 1, 1,
0.4480066, 1.098664, 0.1300003, 1, 0, 0, 1, 1,
0.4493942, -0.4384097, 3.439216, 1, 0, 0, 1, 1,
0.4536173, -0.4816114, 2.388224, 1, 0, 0, 1, 1,
0.4543507, 0.09803697, 0.3513535, 1, 0, 0, 1, 1,
0.4605365, 0.4680977, 1.495758, 1, 0, 0, 1, 1,
0.4620899, -0.8096356, 1.739816, 0, 0, 0, 1, 1,
0.4651048, -1.45456, 2.500874, 0, 0, 0, 1, 1,
0.4660138, -1.674098, 2.235435, 0, 0, 0, 1, 1,
0.4669985, -0.1456342, 2.61995, 0, 0, 0, 1, 1,
0.4679835, -0.1881434, 2.210424, 0, 0, 0, 1, 1,
0.469114, 0.9434458, 1.109439, 0, 0, 0, 1, 1,
0.4755924, 0.9519714, 1.55669, 0, 0, 0, 1, 1,
0.4887945, -0.3960141, 1.594965, 1, 1, 1, 1, 1,
0.4924317, 0.5446603, 0.2376715, 1, 1, 1, 1, 1,
0.4933201, -1.119219, 4.09372, 1, 1, 1, 1, 1,
0.4946343, 2.644789, -1.365377, 1, 1, 1, 1, 1,
0.4963057, 0.0512122, 0.8414207, 1, 1, 1, 1, 1,
0.5006642, 1.055985, -1.364613, 1, 1, 1, 1, 1,
0.5011281, 1.518151, 1.161461, 1, 1, 1, 1, 1,
0.5015975, 1.354394, -0.05361516, 1, 1, 1, 1, 1,
0.501948, 0.7584614, 0.432678, 1, 1, 1, 1, 1,
0.5035697, -0.4978279, 2.495183, 1, 1, 1, 1, 1,
0.5048545, -0.4810743, 4.769086, 1, 1, 1, 1, 1,
0.5090154, -1.636624, 0.4775296, 1, 1, 1, 1, 1,
0.5118892, 1.516803, 1.281039, 1, 1, 1, 1, 1,
0.5120361, 1.142783, 0.1694251, 1, 1, 1, 1, 1,
0.5136732, -1.196175, 0.6673512, 1, 1, 1, 1, 1,
0.5168887, -0.3145518, 3.282921, 0, 0, 1, 1, 1,
0.5173152, 0.4078143, 1.599593, 1, 0, 0, 1, 1,
0.5249482, 1.576249, -0.2551509, 1, 0, 0, 1, 1,
0.5249801, 0.3022718, 0.7219162, 1, 0, 0, 1, 1,
0.5265557, 0.7339806, 0.332179, 1, 0, 0, 1, 1,
0.526723, 1.957415, 1.263888, 1, 0, 0, 1, 1,
0.5299471, 0.1401005, 0.405643, 0, 0, 0, 1, 1,
0.5306192, -0.1453171, 1.064996, 0, 0, 0, 1, 1,
0.5340461, 0.3201535, 0.6178262, 0, 0, 0, 1, 1,
0.5342746, -0.7026829, 2.736519, 0, 0, 0, 1, 1,
0.5346961, -1.112461, 1.724047, 0, 0, 0, 1, 1,
0.5384982, -0.2007534, 3.693649, 0, 0, 0, 1, 1,
0.5449705, -0.189672, 2.342057, 0, 0, 0, 1, 1,
0.5459331, -0.5565439, 1.675089, 1, 1, 1, 1, 1,
0.5475626, 0.5326725, 0.4619505, 1, 1, 1, 1, 1,
0.5509307, -0.2208327, 2.417349, 1, 1, 1, 1, 1,
0.5557774, 0.5775977, -0.1022468, 1, 1, 1, 1, 1,
0.5579565, 0.3285206, 0.7097963, 1, 1, 1, 1, 1,
0.5589663, -0.113282, 2.970897, 1, 1, 1, 1, 1,
0.5604675, 0.2076733, 1.966465, 1, 1, 1, 1, 1,
0.5636417, 0.5473232, 1.406155, 1, 1, 1, 1, 1,
0.5749426, 0.1305863, 1.260197, 1, 1, 1, 1, 1,
0.5753052, -0.6419021, 3.710664, 1, 1, 1, 1, 1,
0.5763802, -1.433656, 2.32848, 1, 1, 1, 1, 1,
0.5784369, -0.009857285, 0.5414137, 1, 1, 1, 1, 1,
0.581946, -0.05345194, 2.127885, 1, 1, 1, 1, 1,
0.5837132, 0.2553965, -1.176747, 1, 1, 1, 1, 1,
0.5847454, 0.02540516, 1.92258, 1, 1, 1, 1, 1,
0.5856863, 0.2190988, 2.326786, 0, 0, 1, 1, 1,
0.5882252, 1.309967, 1.714906, 1, 0, 0, 1, 1,
0.5894599, -1.34003, 2.141951, 1, 0, 0, 1, 1,
0.5913389, -1.727283, 3.916799, 1, 0, 0, 1, 1,
0.5963888, 0.7994902, 1.093646, 1, 0, 0, 1, 1,
0.6011689, -0.6069059, 2.146662, 1, 0, 0, 1, 1,
0.6028169, -1.761766, 3.689137, 0, 0, 0, 1, 1,
0.6031293, 0.067688, 2.29537, 0, 0, 0, 1, 1,
0.6039389, -0.8721212, 1.119159, 0, 0, 0, 1, 1,
0.6074969, -2.507161, 3.172528, 0, 0, 0, 1, 1,
0.608824, 0.7022036, 1.389431, 0, 0, 0, 1, 1,
0.6116521, -1.539579, 1.318635, 0, 0, 0, 1, 1,
0.6143585, 0.2430359, 1.601863, 0, 0, 0, 1, 1,
0.6187901, 0.3049042, 0.2594623, 1, 1, 1, 1, 1,
0.6200603, 0.1013771, 1.126677, 1, 1, 1, 1, 1,
0.6220821, -1.668644, 2.770514, 1, 1, 1, 1, 1,
0.6283207, -1.056797, 3.474979, 1, 1, 1, 1, 1,
0.6305376, 0.4748691, 1.114282, 1, 1, 1, 1, 1,
0.6355366, 1.267578, 0.7800721, 1, 1, 1, 1, 1,
0.6372521, -1.493793, 4.609661, 1, 1, 1, 1, 1,
0.6429414, -0.650034, 1.740034, 1, 1, 1, 1, 1,
0.6445878, -1.07456, 0.8965985, 1, 1, 1, 1, 1,
0.6514829, 1.714354, 0.5199824, 1, 1, 1, 1, 1,
0.6536126, 0.3308636, 1.606991, 1, 1, 1, 1, 1,
0.6563715, -0.2445007, 0.9717271, 1, 1, 1, 1, 1,
0.6575253, -0.234417, 2.505481, 1, 1, 1, 1, 1,
0.6587946, -1.026067, 3.358555, 1, 1, 1, 1, 1,
0.6609253, -1.40105, 2.148887, 1, 1, 1, 1, 1,
0.6675119, -0.04191271, -0.8954567, 0, 0, 1, 1, 1,
0.6684066, 0.3226395, 0.3048736, 1, 0, 0, 1, 1,
0.6691686, -1.281358, 1.397657, 1, 0, 0, 1, 1,
0.6694818, -0.526368, 1.511612, 1, 0, 0, 1, 1,
0.6713191, 0.2427886, 2.204546, 1, 0, 0, 1, 1,
0.672473, 0.574235, 1.732871, 1, 0, 0, 1, 1,
0.6736535, 0.9035885, 0.5398133, 0, 0, 0, 1, 1,
0.6743825, 0.1165784, 1.573092, 0, 0, 0, 1, 1,
0.6845587, 0.1197445, 0.2979059, 0, 0, 0, 1, 1,
0.6890303, -0.6295786, 4.506964, 0, 0, 0, 1, 1,
0.6949604, 0.3588195, 2.073796, 0, 0, 0, 1, 1,
0.6965017, -1.905777, 2.490355, 0, 0, 0, 1, 1,
0.6969787, -0.3118834, -0.07056873, 0, 0, 0, 1, 1,
0.6980014, -0.1729356, 2.785612, 1, 1, 1, 1, 1,
0.6992941, 0.2970807, 1.234727, 1, 1, 1, 1, 1,
0.7000223, 0.3395324, 1.010028, 1, 1, 1, 1, 1,
0.7064087, 1.248639, -0.1874407, 1, 1, 1, 1, 1,
0.7110376, -1.375727, 1.256498, 1, 1, 1, 1, 1,
0.7112218, 0.5592414, 2.131199, 1, 1, 1, 1, 1,
0.717806, -1.560152, 3.92589, 1, 1, 1, 1, 1,
0.7193488, -0.861538, 3.441143, 1, 1, 1, 1, 1,
0.7214344, 0.4224801, 2.601459, 1, 1, 1, 1, 1,
0.7222756, 0.1616928, 0.9916973, 1, 1, 1, 1, 1,
0.7275825, 0.9552811, 1.73037, 1, 1, 1, 1, 1,
0.7295265, -0.5734398, 2.895228, 1, 1, 1, 1, 1,
0.7351269, 0.6295363, 1.563562, 1, 1, 1, 1, 1,
0.7357764, -0.4267707, 1.02986, 1, 1, 1, 1, 1,
0.7384493, -0.4282857, 2.606844, 1, 1, 1, 1, 1,
0.7431678, -0.3048677, 0.1501854, 0, 0, 1, 1, 1,
0.7438844, -0.7630463, 2.717425, 1, 0, 0, 1, 1,
0.7444256, 0.8748821, 0.6962742, 1, 0, 0, 1, 1,
0.7448564, 0.9902877, 2.946898, 1, 0, 0, 1, 1,
0.750062, -0.7173302, 2.5822, 1, 0, 0, 1, 1,
0.7524075, 1.513479, -0.1713168, 1, 0, 0, 1, 1,
0.7527832, 1.437069, -0.02953423, 0, 0, 0, 1, 1,
0.7601294, 0.2277718, 2.776046, 0, 0, 0, 1, 1,
0.761039, 0.3877057, 1.283719, 0, 0, 0, 1, 1,
0.7611489, -0.8013431, 2.384862, 0, 0, 0, 1, 1,
0.7663451, -0.7784482, 1.951487, 0, 0, 0, 1, 1,
0.7680212, -0.4463602, 3.455574, 0, 0, 0, 1, 1,
0.7696912, -1.047424, 3.178393, 0, 0, 0, 1, 1,
0.7729779, 0.6985348, 0.07622573, 1, 1, 1, 1, 1,
0.7819867, -0.2254732, 0.3224572, 1, 1, 1, 1, 1,
0.796975, -1.789552, 2.503991, 1, 1, 1, 1, 1,
0.7970958, 0.2496003, 1.012362, 1, 1, 1, 1, 1,
0.7985724, -0.3162558, 1.190198, 1, 1, 1, 1, 1,
0.8047903, 1.260685, 0.8273166, 1, 1, 1, 1, 1,
0.804881, -0.7999951, 3.018753, 1, 1, 1, 1, 1,
0.8065444, 0.3153552, 0.3838153, 1, 1, 1, 1, 1,
0.8109062, -0.5353869, 2.819999, 1, 1, 1, 1, 1,
0.8173963, 0.1316992, 1.981471, 1, 1, 1, 1, 1,
0.8215095, -0.9423182, 2.398861, 1, 1, 1, 1, 1,
0.8235132, -1.243805, 2.723382, 1, 1, 1, 1, 1,
0.8407803, 1.378489, 0.6114811, 1, 1, 1, 1, 1,
0.8433549, -0.1799007, 2.125032, 1, 1, 1, 1, 1,
0.8464471, -0.1067131, 1.183053, 1, 1, 1, 1, 1,
0.8505067, 2.669271, 2.395596, 0, 0, 1, 1, 1,
0.8568042, -0.1099647, 1.520514, 1, 0, 0, 1, 1,
0.8585886, 0.8428727, 0.4377635, 1, 0, 0, 1, 1,
0.8623176, -2.213227, 1.75776, 1, 0, 0, 1, 1,
0.8632244, -1.252512, 3.184787, 1, 0, 0, 1, 1,
0.8672172, 0.4490529, 1.921329, 1, 0, 0, 1, 1,
0.8749748, 1.078927, -0.1989648, 0, 0, 0, 1, 1,
0.878087, -0.9473611, 2.329814, 0, 0, 0, 1, 1,
0.8781348, 0.3174507, 1.065265, 0, 0, 0, 1, 1,
0.8790798, 0.1722317, 2.101755, 0, 0, 0, 1, 1,
0.8848214, -0.05840783, -0.8905312, 0, 0, 0, 1, 1,
0.8877108, 0.5624655, 1.874847, 0, 0, 0, 1, 1,
0.8880828, -1.363895, 2.783412, 0, 0, 0, 1, 1,
0.8916934, -1.278555, 3.867323, 1, 1, 1, 1, 1,
0.8941561, 2.170661, 0.03135368, 1, 1, 1, 1, 1,
0.8999368, 0.2264496, 2.315141, 1, 1, 1, 1, 1,
0.9010445, -0.5940146, 2.15741, 1, 1, 1, 1, 1,
0.9038361, 1.505563, -0.3026125, 1, 1, 1, 1, 1,
0.9043279, -0.6239802, 3.231152, 1, 1, 1, 1, 1,
0.9074613, 0.7041552, 1.398298, 1, 1, 1, 1, 1,
0.9075675, 0.06856589, 1.978412, 1, 1, 1, 1, 1,
0.9144174, -0.1063222, -0.002555304, 1, 1, 1, 1, 1,
0.9195433, -0.7057171, 2.670069, 1, 1, 1, 1, 1,
0.9328693, -0.04234544, 2.394411, 1, 1, 1, 1, 1,
0.9387912, 1.320684, 1.379175, 1, 1, 1, 1, 1,
0.9389336, -0.1676851, 2.728758, 1, 1, 1, 1, 1,
0.9511197, -1.267423, 3.211439, 1, 1, 1, 1, 1,
0.9565016, -0.7152306, 1.532577, 1, 1, 1, 1, 1,
0.9732295, -0.9146988, 3.156442, 0, 0, 1, 1, 1,
0.9800856, 1.231596, 0.6944317, 1, 0, 0, 1, 1,
0.986731, -0.2788613, 3.092716, 1, 0, 0, 1, 1,
0.9883599, -1.332752, 3.242135, 1, 0, 0, 1, 1,
0.9937972, 0.1363999, 2.027056, 1, 0, 0, 1, 1,
0.9941413, -0.2451147, 2.171488, 1, 0, 0, 1, 1,
0.9992484, -0.66045, 1.9025, 0, 0, 0, 1, 1,
0.9999807, 0.8703616, 1.808754, 0, 0, 0, 1, 1,
1.007237, -0.8809451, 1.261454, 0, 0, 0, 1, 1,
1.008328, -1.33703, 2.742729, 0, 0, 0, 1, 1,
1.016212, 0.2907399, 1.734659, 0, 0, 0, 1, 1,
1.026542, -2.320518, 1.959315, 0, 0, 0, 1, 1,
1.027729, 0.4577576, 0.2636011, 0, 0, 0, 1, 1,
1.033943, 0.5024772, 0.3920924, 1, 1, 1, 1, 1,
1.044237, -1.000372, 1.317693, 1, 1, 1, 1, 1,
1.049424, -0.9663732, 2.306815, 1, 1, 1, 1, 1,
1.049454, -0.2934438, 1.132437, 1, 1, 1, 1, 1,
1.055823, -0.5685052, 1.235581, 1, 1, 1, 1, 1,
1.056988, -0.7084848, 2.152292, 1, 1, 1, 1, 1,
1.058197, 0.1674768, 1.366281, 1, 1, 1, 1, 1,
1.058633, -0.4745899, 3.448442, 1, 1, 1, 1, 1,
1.067425, 0.648145, -0.5660341, 1, 1, 1, 1, 1,
1.071997, 1.388478, 2.37616, 1, 1, 1, 1, 1,
1.081492, -1.110156, 1.645272, 1, 1, 1, 1, 1,
1.083808, -0.209465, 1.571927, 1, 1, 1, 1, 1,
1.091099, 0.5791286, 1.531908, 1, 1, 1, 1, 1,
1.091343, 0.8576766, 2.279929, 1, 1, 1, 1, 1,
1.099571, 0.4881211, 1.418266, 1, 1, 1, 1, 1,
1.101772, 0.8865266, -0.05392568, 0, 0, 1, 1, 1,
1.10257, -0.2302062, 2.16579, 1, 0, 0, 1, 1,
1.105541, -0.2196765, 1.753983, 1, 0, 0, 1, 1,
1.108081, -0.5866067, 2.472229, 1, 0, 0, 1, 1,
1.10865, -1.440606, 2.524368, 1, 0, 0, 1, 1,
1.111904, -0.6763403, 0.9212825, 1, 0, 0, 1, 1,
1.127194, 1.778187, 1.114977, 0, 0, 0, 1, 1,
1.132402, -0.971784, 0.2710958, 0, 0, 0, 1, 1,
1.133929, -0.03459341, 1.10787, 0, 0, 0, 1, 1,
1.140363, -0.3635019, 2.879007, 0, 0, 0, 1, 1,
1.141212, -1.33471, 2.980266, 0, 0, 0, 1, 1,
1.141357, -1.442933, 2.612613, 0, 0, 0, 1, 1,
1.154535, -1.398139, 2.666814, 0, 0, 0, 1, 1,
1.157308, -0.5464901, 1.729105, 1, 1, 1, 1, 1,
1.157702, -0.3747447, 1.564903, 1, 1, 1, 1, 1,
1.161451, -0.1090284, 1.684495, 1, 1, 1, 1, 1,
1.17062, -1.450343, 4.362936, 1, 1, 1, 1, 1,
1.177763, -0.1594746, 2.617515, 1, 1, 1, 1, 1,
1.187948, 1.00448, 1.384372, 1, 1, 1, 1, 1,
1.190002, 0.4282087, 0.5656192, 1, 1, 1, 1, 1,
1.192832, 1.224504, 1.439051, 1, 1, 1, 1, 1,
1.207237, 0.8337938, -0.1453266, 1, 1, 1, 1, 1,
1.209024, 0.6084914, 0.9247968, 1, 1, 1, 1, 1,
1.231939, 0.07411641, 2.600807, 1, 1, 1, 1, 1,
1.23297, 0.386382, 2.014635, 1, 1, 1, 1, 1,
1.236068, -0.8599568, 0.6014454, 1, 1, 1, 1, 1,
1.243658, 0.3303144, 2.713652, 1, 1, 1, 1, 1,
1.254891, -0.8825197, 0.7602301, 1, 1, 1, 1, 1,
1.255036, -0.2669306, 3.14402, 0, 0, 1, 1, 1,
1.266694, 0.3174371, 0.2208474, 1, 0, 0, 1, 1,
1.268205, 0.1808552, 0.328919, 1, 0, 0, 1, 1,
1.278025, -0.04757657, 1.450888, 1, 0, 0, 1, 1,
1.278787, 0.218952, 1.706541, 1, 0, 0, 1, 1,
1.281301, 0.5154831, 2.547803, 1, 0, 0, 1, 1,
1.282092, 0.06963339, -0.3127765, 0, 0, 0, 1, 1,
1.283906, 0.9430667, 0.544444, 0, 0, 0, 1, 1,
1.291677, 2.019872, 1.428062, 0, 0, 0, 1, 1,
1.303167, 1.058834, 0.5331931, 0, 0, 0, 1, 1,
1.306569, 1.430812, 3.0795, 0, 0, 0, 1, 1,
1.311147, -0.3795194, 2.108331, 0, 0, 0, 1, 1,
1.327003, -0.4785718, 1.495082, 0, 0, 0, 1, 1,
1.327155, -1.162054, 0.6706196, 1, 1, 1, 1, 1,
1.327509, 1.350929, 0.8150035, 1, 1, 1, 1, 1,
1.32767, 0.665499, 2.126626, 1, 1, 1, 1, 1,
1.331603, -0.1829358, 1.991169, 1, 1, 1, 1, 1,
1.331805, -1.482237, 2.213593, 1, 1, 1, 1, 1,
1.335975, 0.171039, 1.413002, 1, 1, 1, 1, 1,
1.340407, 0.8058097, 3.186467, 1, 1, 1, 1, 1,
1.342357, 1.801086, 1.425317, 1, 1, 1, 1, 1,
1.348258, 0.9404329, 2.157016, 1, 1, 1, 1, 1,
1.35706, 0.7189672, 0.8615456, 1, 1, 1, 1, 1,
1.363686, 1.034687, 0.3200803, 1, 1, 1, 1, 1,
1.365763, -1.375546, 0.5497274, 1, 1, 1, 1, 1,
1.37161, -0.1490715, 2.937516, 1, 1, 1, 1, 1,
1.371837, -0.6207963, 2.915557, 1, 1, 1, 1, 1,
1.372322, 1.335803, 3.237805, 1, 1, 1, 1, 1,
1.373286, -1.109043, 1.652474, 0, 0, 1, 1, 1,
1.375885, -0.4855808, 2.383313, 1, 0, 0, 1, 1,
1.383183, 0.4217128, 0.8736592, 1, 0, 0, 1, 1,
1.383498, 0.4722522, 0.7234106, 1, 0, 0, 1, 1,
1.386365, 0.2571644, 0.4673376, 1, 0, 0, 1, 1,
1.394637, -1.19343, 2.892835, 1, 0, 0, 1, 1,
1.414133, -1.230489, 1.527747, 0, 0, 0, 1, 1,
1.419199, 0.1496947, 1.272952, 0, 0, 0, 1, 1,
1.421661, -2.20058, 1.737021, 0, 0, 0, 1, 1,
1.429259, 0.8655487, 0.8994517, 0, 0, 0, 1, 1,
1.430041, -1.638656, 4.344831, 0, 0, 0, 1, 1,
1.430945, 0.2395519, 3.46697, 0, 0, 0, 1, 1,
1.43754, 0.7099739, 2.457205, 0, 0, 0, 1, 1,
1.447408, 0.2329909, -0.4905773, 1, 1, 1, 1, 1,
1.451385, 1.501641, -0.5883953, 1, 1, 1, 1, 1,
1.459746, -0.1022974, 1.090129, 1, 1, 1, 1, 1,
1.460752, 0.5463501, -0.3722227, 1, 1, 1, 1, 1,
1.479805, 0.9312685, 0.9883907, 1, 1, 1, 1, 1,
1.480942, -0.30661, 1.335696, 1, 1, 1, 1, 1,
1.504379, 0.8581079, 0.3190266, 1, 1, 1, 1, 1,
1.506985, -1.998034, 3.614772, 1, 1, 1, 1, 1,
1.518636, -0.8198115, 2.018548, 1, 1, 1, 1, 1,
1.522244, 1.746295, 1.147357, 1, 1, 1, 1, 1,
1.539749, -0.3932733, 2.135474, 1, 1, 1, 1, 1,
1.560719, -0.3535815, -0.236941, 1, 1, 1, 1, 1,
1.57664, -1.156466, -0.4556283, 1, 1, 1, 1, 1,
1.584384, -0.1084078, 2.236058, 1, 1, 1, 1, 1,
1.592766, -0.1428439, 1.926706, 1, 1, 1, 1, 1,
1.622743, 0.2936087, 3.650659, 0, 0, 1, 1, 1,
1.636223, 0.2307676, 1.33161, 1, 0, 0, 1, 1,
1.637672, 0.2786539, 2.885007, 1, 0, 0, 1, 1,
1.640485, -1.366132, 2.308213, 1, 0, 0, 1, 1,
1.643526, -0.4136558, 4.108723, 1, 0, 0, 1, 1,
1.64623, 0.9251481, 4.262036, 1, 0, 0, 1, 1,
1.652641, -0.6685061, 0.6952083, 0, 0, 0, 1, 1,
1.660487, -1.184568, 0.5009349, 0, 0, 0, 1, 1,
1.677512, -2.174089, 2.471779, 0, 0, 0, 1, 1,
1.678352, 0.5809792, 1.970374, 0, 0, 0, 1, 1,
1.69315, -0.8222383, 2.68694, 0, 0, 0, 1, 1,
1.698582, -0.9763978, 1.961804, 0, 0, 0, 1, 1,
1.70144, -0.9588478, 2.547658, 0, 0, 0, 1, 1,
1.71059, -1.040177, 1.63091, 1, 1, 1, 1, 1,
1.729789, 0.5855557, 1.53738, 1, 1, 1, 1, 1,
1.749578, 1.130852, 0.8444225, 1, 1, 1, 1, 1,
1.757438, 0.4343922, 0.2788571, 1, 1, 1, 1, 1,
1.759919, -0.7273818, 4.119649, 1, 1, 1, 1, 1,
1.76789, 1.478433, 1.30694, 1, 1, 1, 1, 1,
1.798978, 1.246987, 0.06705251, 1, 1, 1, 1, 1,
1.813163, -0.7504565, 0.7694187, 1, 1, 1, 1, 1,
1.813377, -0.8218973, 1.109557, 1, 1, 1, 1, 1,
1.83256, 0.3366266, 0.1624042, 1, 1, 1, 1, 1,
1.835436, 0.2030286, 1.981793, 1, 1, 1, 1, 1,
1.840309, -1.729206, 1.389464, 1, 1, 1, 1, 1,
1.844128, -1.228268, 2.533535, 1, 1, 1, 1, 1,
1.88743, -1.220857, 0.5604043, 1, 1, 1, 1, 1,
1.891436, 1.208685, -0.04452311, 1, 1, 1, 1, 1,
1.904104, 0.25818, -0.1923354, 0, 0, 1, 1, 1,
1.912398, -0.3865113, 1.056141, 1, 0, 0, 1, 1,
1.949087, 1.129521, -0.08183796, 1, 0, 0, 1, 1,
1.958231, 0.6698865, 1.509405, 1, 0, 0, 1, 1,
1.963034, -1.218536, 1.432899, 1, 0, 0, 1, 1,
1.984829, -0.7103449, 1.365774, 1, 0, 0, 1, 1,
2.021789, -0.7774644, 0.599513, 0, 0, 0, 1, 1,
2.028431, 0.8209143, 3.186874, 0, 0, 0, 1, 1,
2.063213, 0.8644277, 0.1667761, 0, 0, 0, 1, 1,
2.068837, -1.534413, 2.057416, 0, 0, 0, 1, 1,
2.071852, 0.963818, 0.4763702, 0, 0, 0, 1, 1,
2.084124, 2.000983, 1.547802, 0, 0, 0, 1, 1,
2.085234, -1.206175, 1.636485, 0, 0, 0, 1, 1,
2.0896, 0.03096411, 1.148843, 1, 1, 1, 1, 1,
2.107959, 0.1635411, 1.842033, 1, 1, 1, 1, 1,
2.233617, 2.573144, 0.4817876, 1, 1, 1, 1, 1,
2.451008, 0.007342578, 0.0302097, 1, 1, 1, 1, 1,
2.638622, -0.3261964, 1.003638, 1, 1, 1, 1, 1,
2.692406, 1.029223, 2.37482, 1, 1, 1, 1, 1,
3.126459, 0.7533732, 1.929231, 1, 1, 1, 1, 1
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
var radius = 9.944945;
var distance = 34.93119;
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
mvMatrix.translate( 0.02353787, 0.2110548, -0.6073399 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.93119);
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
