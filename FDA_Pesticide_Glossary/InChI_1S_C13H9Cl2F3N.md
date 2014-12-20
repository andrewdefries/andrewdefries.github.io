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
-3.216354, 2.159645, -0.5378488, 1, 0, 0, 1,
-3.081386, 0.03834051, -0.1060563, 1, 0.007843138, 0, 1,
-3.03993, 1.445291, -0.6466029, 1, 0.01176471, 0, 1,
-3.027222, -0.07477197, -2.523106, 1, 0.01960784, 0, 1,
-2.877835, 1.434149, -0.2568349, 1, 0.02352941, 0, 1,
-2.771376, 1.124443, -0.9584192, 1, 0.03137255, 0, 1,
-2.766362, 1.008042, -0.1891522, 1, 0.03529412, 0, 1,
-2.636848, 0.6665905, -1.240432, 1, 0.04313726, 0, 1,
-2.629261, 0.8985901, -1.664023, 1, 0.04705882, 0, 1,
-2.613767, -1.39561, -0.2757302, 1, 0.05490196, 0, 1,
-2.427846, 0.270806, -2.11948, 1, 0.05882353, 0, 1,
-2.386362, 0.09167911, -1.281223, 1, 0.06666667, 0, 1,
-2.370877, -1.299126, -1.507049, 1, 0.07058824, 0, 1,
-2.330486, -0.989804, -0.4345275, 1, 0.07843138, 0, 1,
-2.319361, 0.2207717, -2.474106, 1, 0.08235294, 0, 1,
-2.286428, 0.5937711, -3.829885, 1, 0.09019608, 0, 1,
-2.283355, -0.7802591, -1.813932, 1, 0.09411765, 0, 1,
-2.245293, -0.598202, -1.342327, 1, 0.1019608, 0, 1,
-2.226377, 0.8960187, 0.4218763, 1, 0.1098039, 0, 1,
-2.158453, 0.3144847, -2.080333, 1, 0.1137255, 0, 1,
-2.155944, 0.2183889, -1.632636, 1, 0.1215686, 0, 1,
-2.145645, -1.059506, -2.376105, 1, 0.1254902, 0, 1,
-2.120759, 1.208742, 0.09783934, 1, 0.1333333, 0, 1,
-2.082713, -0.04430468, -2.008897, 1, 0.1372549, 0, 1,
-2.065371, 0.5944062, -1.4857, 1, 0.145098, 0, 1,
-2.063055, -0.01020067, -2.450817, 1, 0.1490196, 0, 1,
-2.045035, 1.021898, -1.176631, 1, 0.1568628, 0, 1,
-2.033878, 0.6542311, -2.01468, 1, 0.1607843, 0, 1,
-2.031878, -0.9003142, -1.059529, 1, 0.1686275, 0, 1,
-2.007902, -0.1959454, -0.7325845, 1, 0.172549, 0, 1,
-1.992487, -0.8295676, -2.54673, 1, 0.1803922, 0, 1,
-1.978967, -0.3823257, -0.6570098, 1, 0.1843137, 0, 1,
-1.959033, 0.2298552, -1.719599, 1, 0.1921569, 0, 1,
-1.925922, 1.528878, -0.3546211, 1, 0.1960784, 0, 1,
-1.915149, -0.7077648, -2.82574, 1, 0.2039216, 0, 1,
-1.912359, 0.9664566, -0.1376967, 1, 0.2117647, 0, 1,
-1.904879, -0.7834793, 0.3962239, 1, 0.2156863, 0, 1,
-1.901152, 1.212811, 1.08916, 1, 0.2235294, 0, 1,
-1.897994, 1.681401, 0.2188814, 1, 0.227451, 0, 1,
-1.888723, 0.416147, -2.057263, 1, 0.2352941, 0, 1,
-1.879577, 0.5559864, -0.9298636, 1, 0.2392157, 0, 1,
-1.876145, -0.9122102, -1.789448, 1, 0.2470588, 0, 1,
-1.835336, -0.5604729, -1.509048, 1, 0.2509804, 0, 1,
-1.826691, 1.039148, -1.302693, 1, 0.2588235, 0, 1,
-1.817878, 0.9457598, -0.8173503, 1, 0.2627451, 0, 1,
-1.810814, -2.229741, -2.827992, 1, 0.2705882, 0, 1,
-1.793824, 0.2474632, -0.7652103, 1, 0.2745098, 0, 1,
-1.779689, 1.06798, -1.502744, 1, 0.282353, 0, 1,
-1.770264, 0.03770955, -1.720646, 1, 0.2862745, 0, 1,
-1.742479, -1.106123, -3.083555, 1, 0.2941177, 0, 1,
-1.733757, 0.791943, -1.520459, 1, 0.3019608, 0, 1,
-1.73278, 0.9480259, -0.5342111, 1, 0.3058824, 0, 1,
-1.729361, -0.6687598, -4.279752, 1, 0.3137255, 0, 1,
-1.71112, -0.3579183, -4.999492, 1, 0.3176471, 0, 1,
-1.70237, -0.6649505, -2.895272, 1, 0.3254902, 0, 1,
-1.701588, -0.09482001, -1.686351, 1, 0.3294118, 0, 1,
-1.693185, 0.7279682, -2.529242, 1, 0.3372549, 0, 1,
-1.685187, -0.8233365, -0.8265371, 1, 0.3411765, 0, 1,
-1.676615, -0.6468855, -2.069595, 1, 0.3490196, 0, 1,
-1.639611, -1.807417, -2.803288, 1, 0.3529412, 0, 1,
-1.63483, 0.6510929, -0.8590169, 1, 0.3607843, 0, 1,
-1.627601, -0.1002944, -1.054175, 1, 0.3647059, 0, 1,
-1.627343, 0.06266695, -0.804817, 1, 0.372549, 0, 1,
-1.624405, 0.02953718, -2.139989, 1, 0.3764706, 0, 1,
-1.622382, 1.838551, -1.042867, 1, 0.3843137, 0, 1,
-1.612931, 1.688741, -0.3361504, 1, 0.3882353, 0, 1,
-1.607798, -1.952582, -4.125252, 1, 0.3960784, 0, 1,
-1.584913, -1.418531, -3.171602, 1, 0.4039216, 0, 1,
-1.583505, 0.463404, -2.545751, 1, 0.4078431, 0, 1,
-1.578716, -1.433132, -0.7664288, 1, 0.4156863, 0, 1,
-1.555985, -0.1031977, -0.3963369, 1, 0.4196078, 0, 1,
-1.546855, -0.2826495, -2.382227, 1, 0.427451, 0, 1,
-1.541325, -0.3037927, -1.439547, 1, 0.4313726, 0, 1,
-1.532553, 0.626197, -0.7590635, 1, 0.4392157, 0, 1,
-1.529677, 0.06860179, -4.062814, 1, 0.4431373, 0, 1,
-1.52812, -0.3930982, -2.116771, 1, 0.4509804, 0, 1,
-1.511124, 0.2264368, -2.02366, 1, 0.454902, 0, 1,
-1.510589, -0.4810717, -1.396518, 1, 0.4627451, 0, 1,
-1.507644, -0.3220893, -3.28073, 1, 0.4666667, 0, 1,
-1.505082, -1.143277, -2.69489, 1, 0.4745098, 0, 1,
-1.498911, -0.5319873, -1.150399, 1, 0.4784314, 0, 1,
-1.487547, 1.356549, 0.3753989, 1, 0.4862745, 0, 1,
-1.485797, 0.8198623, -1.361745, 1, 0.4901961, 0, 1,
-1.481607, -1.561033, -3.78914, 1, 0.4980392, 0, 1,
-1.467417, -0.3168822, -0.3095897, 1, 0.5058824, 0, 1,
-1.442256, 0.2022814, -2.030786, 1, 0.509804, 0, 1,
-1.435292, 0.2718476, -1.582887, 1, 0.5176471, 0, 1,
-1.431551, 1.819407, 0.06062478, 1, 0.5215687, 0, 1,
-1.422957, -0.2450296, -3.287748, 1, 0.5294118, 0, 1,
-1.419827, -0.1526234, -0.8085179, 1, 0.5333334, 0, 1,
-1.410767, 0.7329562, 0.4004406, 1, 0.5411765, 0, 1,
-1.40624, -0.3826661, -1.559768, 1, 0.5450981, 0, 1,
-1.401977, -1.963886, -1.775658, 1, 0.5529412, 0, 1,
-1.385468, -1.039675, -0.971566, 1, 0.5568628, 0, 1,
-1.380761, -1.179221, -1.982729, 1, 0.5647059, 0, 1,
-1.379183, 1.028234, 0.2602737, 1, 0.5686275, 0, 1,
-1.375993, -0.5506756, -3.366345, 1, 0.5764706, 0, 1,
-1.372611, -0.2796678, -0.6808509, 1, 0.5803922, 0, 1,
-1.369485, 0.06057991, -2.322657, 1, 0.5882353, 0, 1,
-1.36674, 0.1585125, -0.3791364, 1, 0.5921569, 0, 1,
-1.342457, 0.7292596, -2.537181, 1, 0.6, 0, 1,
-1.332484, -1.110458, -3.688796, 1, 0.6078432, 0, 1,
-1.325412, 0.2777689, -0.9038861, 1, 0.6117647, 0, 1,
-1.319614, 0.9051134, -2.153221, 1, 0.6196079, 0, 1,
-1.319381, 0.2609138, -3.278359, 1, 0.6235294, 0, 1,
-1.31774, -1.402347, -2.312451, 1, 0.6313726, 0, 1,
-1.313363, -2.189067, -2.558573, 1, 0.6352941, 0, 1,
-1.308243, -0.890235, -2.639783, 1, 0.6431373, 0, 1,
-1.298655, 0.8035954, -0.2373967, 1, 0.6470588, 0, 1,
-1.282845, -0.2567537, -1.067415, 1, 0.654902, 0, 1,
-1.28109, 0.1223177, -1.174061, 1, 0.6588235, 0, 1,
-1.278105, -1.008449, -2.784192, 1, 0.6666667, 0, 1,
-1.269999, -1.388255, -1.902853, 1, 0.6705883, 0, 1,
-1.254678, 0.641388, 0.5120201, 1, 0.6784314, 0, 1,
-1.251782, -1.158608, -1.308755, 1, 0.682353, 0, 1,
-1.249802, 1.100502, -1.754972, 1, 0.6901961, 0, 1,
-1.245479, -1.275853, -2.875674, 1, 0.6941177, 0, 1,
-1.243982, -0.327511, -0.08096813, 1, 0.7019608, 0, 1,
-1.242946, -0.05007777, -1.540719, 1, 0.7098039, 0, 1,
-1.240022, -0.7470284, -2.257088, 1, 0.7137255, 0, 1,
-1.23244, 1.294223, 0.5546408, 1, 0.7215686, 0, 1,
-1.230602, -0.3041837, -2.059477, 1, 0.7254902, 0, 1,
-1.226317, 0.8722299, -0.8436943, 1, 0.7333333, 0, 1,
-1.225021, 0.6013039, -1.981666, 1, 0.7372549, 0, 1,
-1.225002, -0.2113232, -3.123736, 1, 0.7450981, 0, 1,
-1.217565, 1.481991, -1.935341, 1, 0.7490196, 0, 1,
-1.214854, -0.8352887, -0.3244607, 1, 0.7568628, 0, 1,
-1.20952, 0.5604852, -0.8375126, 1, 0.7607843, 0, 1,
-1.208809, -1.252663, -2.462927, 1, 0.7686275, 0, 1,
-1.198207, 1.918757, -2.082255, 1, 0.772549, 0, 1,
-1.174986, 2.270819, -1.144122, 1, 0.7803922, 0, 1,
-1.174664, -0.5230849, -1.865091, 1, 0.7843137, 0, 1,
-1.174259, 1.449165, -0.2423614, 1, 0.7921569, 0, 1,
-1.173087, -0.9326507, -2.957311, 1, 0.7960784, 0, 1,
-1.168206, -0.5902108, -1.716726, 1, 0.8039216, 0, 1,
-1.165198, 0.1580704, 0.7492245, 1, 0.8117647, 0, 1,
-1.154458, -0.9146389, -0.6052728, 1, 0.8156863, 0, 1,
-1.153925, 0.5357531, -0.6923882, 1, 0.8235294, 0, 1,
-1.149322, -0.8671584, -0.2717868, 1, 0.827451, 0, 1,
-1.144032, -0.7412891, -3.299742, 1, 0.8352941, 0, 1,
-1.140291, 0.0621859, 0.1814297, 1, 0.8392157, 0, 1,
-1.13987, -0.6501344, -0.7927369, 1, 0.8470588, 0, 1,
-1.135827, -0.2035294, -3.413312, 1, 0.8509804, 0, 1,
-1.135278, -1.360385, -2.492071, 1, 0.8588235, 0, 1,
-1.133297, -1.893692, -2.94853, 1, 0.8627451, 0, 1,
-1.125459, -1.00151, -2.677683, 1, 0.8705882, 0, 1,
-1.124761, 1.649186, -0.8958017, 1, 0.8745098, 0, 1,
-1.120115, 0.08490057, -2.506694, 1, 0.8823529, 0, 1,
-1.120031, -1.629325, -3.181624, 1, 0.8862745, 0, 1,
-1.119282, 1.199338, -0.834008, 1, 0.8941177, 0, 1,
-1.113631, -0.3415643, -3.239583, 1, 0.8980392, 0, 1,
-1.113345, -0.3921233, -1.536173, 1, 0.9058824, 0, 1,
-1.104334, 0.2535804, -0.6730576, 1, 0.9137255, 0, 1,
-1.102555, 2.787205, -2.553324, 1, 0.9176471, 0, 1,
-1.100001, -1.963826, -2.880175, 1, 0.9254902, 0, 1,
-1.08891, -1.216656, -0.8808877, 1, 0.9294118, 0, 1,
-1.088882, 2.503207, 1.352515, 1, 0.9372549, 0, 1,
-1.069633, 0.226056, -0.772774, 1, 0.9411765, 0, 1,
-1.065336, 0.4268257, -0.9572393, 1, 0.9490196, 0, 1,
-1.059908, 0.5411082, -1.942878, 1, 0.9529412, 0, 1,
-1.057899, -0.4218174, -1.759848, 1, 0.9607843, 0, 1,
-1.055158, -0.06469478, -2.345104, 1, 0.9647059, 0, 1,
-1.053286, 0.9323522, -0.7440797, 1, 0.972549, 0, 1,
-1.051606, -0.4901055, -1.275124, 1, 0.9764706, 0, 1,
-1.043697, 0.4911838, 0.5111946, 1, 0.9843137, 0, 1,
-1.04219, 1.718359, 0.4628809, 1, 0.9882353, 0, 1,
-1.036178, 0.1446159, -1.743619, 1, 0.9960784, 0, 1,
-1.009492, -0.2848375, -1.82228, 0.9960784, 1, 0, 1,
-1.002539, 0.09902821, -0.7099944, 0.9921569, 1, 0, 1,
-0.9897645, 0.2607791, 0.4394117, 0.9843137, 1, 0, 1,
-0.9818193, 0.6942393, -0.8417153, 0.9803922, 1, 0, 1,
-0.9807913, 1.258533, -0.9281558, 0.972549, 1, 0, 1,
-0.9794679, -0.1958252, -1.887005, 0.9686275, 1, 0, 1,
-0.9788381, -1.060506, -2.572778, 0.9607843, 1, 0, 1,
-0.9768007, 0.6465502, -2.281799, 0.9568627, 1, 0, 1,
-0.9651546, -0.943973, -4.557909, 0.9490196, 1, 0, 1,
-0.9646346, 0.4078356, -1.199181, 0.945098, 1, 0, 1,
-0.9551085, -1.806975, -2.223939, 0.9372549, 1, 0, 1,
-0.9544667, 1.901183, 1.035827, 0.9333333, 1, 0, 1,
-0.9429043, -1.624077, -2.522023, 0.9254902, 1, 0, 1,
-0.9397754, 0.07832949, -3.124349, 0.9215686, 1, 0, 1,
-0.9351524, -1.781432, -3.981183, 0.9137255, 1, 0, 1,
-0.9319685, -2.090833, -3.725078, 0.9098039, 1, 0, 1,
-0.9294436, 1.92123, -0.5370315, 0.9019608, 1, 0, 1,
-0.9252765, -0.562212, -4.010532, 0.8941177, 1, 0, 1,
-0.9233897, 1.035233, -2.058348, 0.8901961, 1, 0, 1,
-0.923368, 0.5317537, 0.9818749, 0.8823529, 1, 0, 1,
-0.9223766, -1.794628, -3.162398, 0.8784314, 1, 0, 1,
-0.9162237, 0.2615781, -2.615677, 0.8705882, 1, 0, 1,
-0.9140905, 0.276531, -0.3829454, 0.8666667, 1, 0, 1,
-0.9129289, -2.462661, -3.622922, 0.8588235, 1, 0, 1,
-0.9129079, -0.6843442, -0.8470202, 0.854902, 1, 0, 1,
-0.9113557, 1.014768, 1.515319, 0.8470588, 1, 0, 1,
-0.896897, -0.9503102, -1.99567, 0.8431373, 1, 0, 1,
-0.8942114, 0.5215153, -0.9214462, 0.8352941, 1, 0, 1,
-0.8844429, -0.02599313, -1.909404, 0.8313726, 1, 0, 1,
-0.8816206, 0.09238485, -1.612158, 0.8235294, 1, 0, 1,
-0.8764199, -0.9933957, -1.935599, 0.8196079, 1, 0, 1,
-0.8756742, -1.123125, -1.897763, 0.8117647, 1, 0, 1,
-0.8744199, 1.410874, -0.3345006, 0.8078431, 1, 0, 1,
-0.8627915, 0.9497166, -1.670775, 0.8, 1, 0, 1,
-0.8617418, -0.6714249, -2.378736, 0.7921569, 1, 0, 1,
-0.8525376, -1.632118, -1.891381, 0.7882353, 1, 0, 1,
-0.8493552, -0.6096942, -1.321774, 0.7803922, 1, 0, 1,
-0.8445789, 0.6190767, -1.294097, 0.7764706, 1, 0, 1,
-0.8436711, -0.2686591, -0.414689, 0.7686275, 1, 0, 1,
-0.841368, -0.425508, -0.124595, 0.7647059, 1, 0, 1,
-0.8401884, 0.8491554, -2.264331, 0.7568628, 1, 0, 1,
-0.8379489, 0.6214564, -3.274109, 0.7529412, 1, 0, 1,
-0.8376314, -0.2324456, -1.271047, 0.7450981, 1, 0, 1,
-0.8371903, -2.150763, -4.380777, 0.7411765, 1, 0, 1,
-0.8358607, -0.5055982, -3.022122, 0.7333333, 1, 0, 1,
-0.8334088, -1.657218, -3.716261, 0.7294118, 1, 0, 1,
-0.8312053, -0.8614699, -2.216428, 0.7215686, 1, 0, 1,
-0.8300957, 0.2626485, -0.4299796, 0.7176471, 1, 0, 1,
-0.8285502, 0.6797323, -0.9415729, 0.7098039, 1, 0, 1,
-0.8282393, -0.8357766, -2.453277, 0.7058824, 1, 0, 1,
-0.8275717, -0.167691, -0.5469647, 0.6980392, 1, 0, 1,
-0.8272992, -1.999006, -3.949864, 0.6901961, 1, 0, 1,
-0.8216274, 1.198263, -0.2963564, 0.6862745, 1, 0, 1,
-0.8216267, -0.1751305, -2.142692, 0.6784314, 1, 0, 1,
-0.8212752, -0.3279867, -2.602435, 0.6745098, 1, 0, 1,
-0.8210668, -0.08701488, -1.13516, 0.6666667, 1, 0, 1,
-0.8202847, -0.5133008, -0.8013401, 0.6627451, 1, 0, 1,
-0.8174244, -1.158584, -3.313, 0.654902, 1, 0, 1,
-0.8125392, -0.2851022, -0.6167184, 0.6509804, 1, 0, 1,
-0.8051968, -0.1860807, 1.316921, 0.6431373, 1, 0, 1,
-0.7965797, -0.3925942, -2.391439, 0.6392157, 1, 0, 1,
-0.795581, 1.610384, 0.6908794, 0.6313726, 1, 0, 1,
-0.7943619, -0.4562052, -1.967834, 0.627451, 1, 0, 1,
-0.7817945, 0.9465066, -0.2599947, 0.6196079, 1, 0, 1,
-0.7813266, -0.7623634, -1.292306, 0.6156863, 1, 0, 1,
-0.7812001, 1.538384, 0.5894992, 0.6078432, 1, 0, 1,
-0.780745, -0.5182554, -2.053174, 0.6039216, 1, 0, 1,
-0.7769092, -0.3241128, -1.420516, 0.5960785, 1, 0, 1,
-0.7755463, -0.88236, -1.967005, 0.5882353, 1, 0, 1,
-0.7717328, -1.208035, -4.257213, 0.5843138, 1, 0, 1,
-0.7649346, 0.8814648, -1.612561, 0.5764706, 1, 0, 1,
-0.7583198, -1.205287, 0.1137927, 0.572549, 1, 0, 1,
-0.7554153, 0.08021236, -1.605111, 0.5647059, 1, 0, 1,
-0.7553066, -1.00104, -0.6304784, 0.5607843, 1, 0, 1,
-0.7467414, 0.7719057, -0.9782074, 0.5529412, 1, 0, 1,
-0.7452927, -1.031518, -1.176777, 0.5490196, 1, 0, 1,
-0.7437114, -0.3516327, -1.688429, 0.5411765, 1, 0, 1,
-0.7420406, -0.491784, -0.960342, 0.5372549, 1, 0, 1,
-0.7402139, -0.02782412, -0.684747, 0.5294118, 1, 0, 1,
-0.7264699, 0.9273596, -1.080871, 0.5254902, 1, 0, 1,
-0.723658, -0.1295068, -2.319134, 0.5176471, 1, 0, 1,
-0.7195541, 0.8126302, 0.1524856, 0.5137255, 1, 0, 1,
-0.7180111, -0.9092633, -1.308852, 0.5058824, 1, 0, 1,
-0.7170283, -1.59798, -1.929004, 0.5019608, 1, 0, 1,
-0.7156584, -0.8148956, -3.550008, 0.4941176, 1, 0, 1,
-0.7070706, -1.946943, -1.995995, 0.4862745, 1, 0, 1,
-0.6981147, -0.2017119, -1.134154, 0.4823529, 1, 0, 1,
-0.6973991, 0.527998, -0.6535024, 0.4745098, 1, 0, 1,
-0.6925193, 0.6261545, -0.4372696, 0.4705882, 1, 0, 1,
-0.6890842, 0.9330394, -1.273127, 0.4627451, 1, 0, 1,
-0.6863116, -0.6297704, -3.455482, 0.4588235, 1, 0, 1,
-0.6841235, 1.345348, -0.8979526, 0.4509804, 1, 0, 1,
-0.6805902, -0.0005735187, -2.406236, 0.4470588, 1, 0, 1,
-0.6775616, -1.920411, -1.67301, 0.4392157, 1, 0, 1,
-0.6775386, -0.12322, -2.020024, 0.4352941, 1, 0, 1,
-0.6745372, -1.07857, -2.022692, 0.427451, 1, 0, 1,
-0.6728435, -1.756745, -2.739886, 0.4235294, 1, 0, 1,
-0.6718615, -1.383629, -1.991415, 0.4156863, 1, 0, 1,
-0.6674082, -3.38736, -2.857006, 0.4117647, 1, 0, 1,
-0.6663705, 0.8154453, -0.2590162, 0.4039216, 1, 0, 1,
-0.6622333, -0.5376, -3.137154, 0.3960784, 1, 0, 1,
-0.6620448, 0.3673938, -0.1217944, 0.3921569, 1, 0, 1,
-0.6531717, 0.1721772, -0.9126834, 0.3843137, 1, 0, 1,
-0.6418711, -0.6703077, -0.9730029, 0.3803922, 1, 0, 1,
-0.6389861, -0.5757099, -2.086785, 0.372549, 1, 0, 1,
-0.6378673, -0.1220465, 0.09453849, 0.3686275, 1, 0, 1,
-0.637553, 2.875827, -0.574284, 0.3607843, 1, 0, 1,
-0.637121, -2.26725, -3.646147, 0.3568628, 1, 0, 1,
-0.6338766, 0.8983535, 0.5797958, 0.3490196, 1, 0, 1,
-0.6319224, 0.7869431, -1.011887, 0.345098, 1, 0, 1,
-0.6307914, 0.672482, -2.062892, 0.3372549, 1, 0, 1,
-0.6296586, -1.658109, -2.195591, 0.3333333, 1, 0, 1,
-0.6243715, 0.965651, -1.595448, 0.3254902, 1, 0, 1,
-0.6164863, -1.233042, -2.542956, 0.3215686, 1, 0, 1,
-0.6099806, 0.7348578, -0.5530797, 0.3137255, 1, 0, 1,
-0.6069207, 0.2692234, -1.578617, 0.3098039, 1, 0, 1,
-0.6054648, -0.1324377, -2.050104, 0.3019608, 1, 0, 1,
-0.6050923, -0.04998404, -1.094235, 0.2941177, 1, 0, 1,
-0.6047007, 1.007249, -1.891471, 0.2901961, 1, 0, 1,
-0.6035671, -0.2491842, -2.495744, 0.282353, 1, 0, 1,
-0.6020774, -1.531414, -3.103855, 0.2784314, 1, 0, 1,
-0.5925516, 0.578039, 0.07337295, 0.2705882, 1, 0, 1,
-0.5906337, -0.5130618, -2.332516, 0.2666667, 1, 0, 1,
-0.5893087, 0.3761167, -0.3303488, 0.2588235, 1, 0, 1,
-0.5856795, 0.3181072, -0.6702018, 0.254902, 1, 0, 1,
-0.5800571, -0.6414614, -2.509628, 0.2470588, 1, 0, 1,
-0.5793776, -0.5117667, -2.980622, 0.2431373, 1, 0, 1,
-0.5782688, 0.292722, 0.04866376, 0.2352941, 1, 0, 1,
-0.5778876, -0.7232336, -5.553384, 0.2313726, 1, 0, 1,
-0.5690875, -0.8237411, -0.8605447, 0.2235294, 1, 0, 1,
-0.5676253, 1.36324, -0.9806939, 0.2196078, 1, 0, 1,
-0.5672869, 0.600607, -0.3369188, 0.2117647, 1, 0, 1,
-0.5655555, 0.1101874, -0.4985687, 0.2078431, 1, 0, 1,
-0.5573726, -1.526758, -3.154397, 0.2, 1, 0, 1,
-0.5566665, -0.7225433, -3.527544, 0.1921569, 1, 0, 1,
-0.5551509, -1.396873, 0.09365388, 0.1882353, 1, 0, 1,
-0.5547377, -0.8670534, -2.021127, 0.1803922, 1, 0, 1,
-0.5502729, -0.02583129, -3.968152, 0.1764706, 1, 0, 1,
-0.5482159, 0.08945091, -1.155538, 0.1686275, 1, 0, 1,
-0.5440224, 0.627569, -0.1781442, 0.1647059, 1, 0, 1,
-0.5409744, -1.241192, -3.90335, 0.1568628, 1, 0, 1,
-0.5402871, 0.5402554, -0.7050634, 0.1529412, 1, 0, 1,
-0.5363359, -1.377272, -2.565547, 0.145098, 1, 0, 1,
-0.5320032, -0.651132, -3.565926, 0.1411765, 1, 0, 1,
-0.5305929, 0.9815933, 0.1958829, 0.1333333, 1, 0, 1,
-0.5173535, 1.053375, -0.2968352, 0.1294118, 1, 0, 1,
-0.5159593, -1.31962, -2.43742, 0.1215686, 1, 0, 1,
-0.5123585, -0.8857934, -1.817692, 0.1176471, 1, 0, 1,
-0.5106564, -0.9700252, -3.079388, 0.1098039, 1, 0, 1,
-0.5091594, -0.03978334, -1.892814, 0.1058824, 1, 0, 1,
-0.5077515, -0.1801969, -2.59551, 0.09803922, 1, 0, 1,
-0.5034143, 0.8634159, 0.4008628, 0.09019608, 1, 0, 1,
-0.5011667, 1.528112, -0.1622646, 0.08627451, 1, 0, 1,
-0.5010432, -0.5544443, -3.826173, 0.07843138, 1, 0, 1,
-0.4980844, -0.08613613, -3.404905, 0.07450981, 1, 0, 1,
-0.497579, -0.7737842, -2.252434, 0.06666667, 1, 0, 1,
-0.4969413, 0.1513051, -2.768141, 0.0627451, 1, 0, 1,
-0.4961852, 1.009658, -0.561244, 0.05490196, 1, 0, 1,
-0.4956312, 2.318702, 0.1976295, 0.05098039, 1, 0, 1,
-0.4902653, 1.138701, -0.2546865, 0.04313726, 1, 0, 1,
-0.4853202, -0.7310368, -1.461646, 0.03921569, 1, 0, 1,
-0.4845022, -0.8232481, -4.927783, 0.03137255, 1, 0, 1,
-0.4825482, 2.011618, -0.06836801, 0.02745098, 1, 0, 1,
-0.4811482, -0.01269062, -0.9957644, 0.01960784, 1, 0, 1,
-0.4680938, 0.3081498, -1.500256, 0.01568628, 1, 0, 1,
-0.4679233, -0.6690805, -3.09226, 0.007843138, 1, 0, 1,
-0.4632083, -0.8764538, -2.088134, 0.003921569, 1, 0, 1,
-0.4617558, -0.6788101, -2.515389, 0, 1, 0.003921569, 1,
-0.4616251, 1.449577, 0.5607722, 0, 1, 0.01176471, 1,
-0.4512363, 0.9036332, -0.1040283, 0, 1, 0.01568628, 1,
-0.4505348, 0.7484066, 0.2132009, 0, 1, 0.02352941, 1,
-0.448519, -2.500312, -3.514009, 0, 1, 0.02745098, 1,
-0.4464748, 0.0151568, -1.418215, 0, 1, 0.03529412, 1,
-0.4410242, 0.270686, -2.700327, 0, 1, 0.03921569, 1,
-0.4355552, -0.3554304, -2.056966, 0, 1, 0.04705882, 1,
-0.4337615, 1.264992, 0.39352, 0, 1, 0.05098039, 1,
-0.4323825, -0.4435004, -2.696294, 0, 1, 0.05882353, 1,
-0.4283588, 1.238227, -1.365965, 0, 1, 0.0627451, 1,
-0.426786, 0.05376635, -4.173083, 0, 1, 0.07058824, 1,
-0.424621, 0.7400182, -0.8339548, 0, 1, 0.07450981, 1,
-0.4214188, -0.4998372, -2.519121, 0, 1, 0.08235294, 1,
-0.4203987, -1.976142, -2.574616, 0, 1, 0.08627451, 1,
-0.4200055, -0.1622151, -1.338433, 0, 1, 0.09411765, 1,
-0.4146862, 0.3179021, -0.03467762, 0, 1, 0.1019608, 1,
-0.4100086, 0.1444152, -1.693969, 0, 1, 0.1058824, 1,
-0.4059235, 0.6807042, -1.176557, 0, 1, 0.1137255, 1,
-0.4049219, -0.6229953, -3.694849, 0, 1, 0.1176471, 1,
-0.4036255, -0.3765603, -2.407654, 0, 1, 0.1254902, 1,
-0.4016542, -1.325896, -3.189826, 0, 1, 0.1294118, 1,
-0.3938074, 1.454829, -0.5070059, 0, 1, 0.1372549, 1,
-0.3936091, -1.118179, -2.145609, 0, 1, 0.1411765, 1,
-0.3933137, -0.4807248, -2.866603, 0, 1, 0.1490196, 1,
-0.3921035, -0.4640053, -2.427626, 0, 1, 0.1529412, 1,
-0.3906379, -0.7192479, -3.596387, 0, 1, 0.1607843, 1,
-0.3865234, 0.4551718, 0.3717584, 0, 1, 0.1647059, 1,
-0.3826984, 0.0005875099, -0.6717535, 0, 1, 0.172549, 1,
-0.3789414, 2.50024, -1.187914, 0, 1, 0.1764706, 1,
-0.3743263, -1.59167, -3.205839, 0, 1, 0.1843137, 1,
-0.373061, -0.1350752, -3.724545, 0, 1, 0.1882353, 1,
-0.37133, 0.4076607, -1.103896, 0, 1, 0.1960784, 1,
-0.3663563, -0.4789775, -3.132717, 0, 1, 0.2039216, 1,
-0.3641945, 1.753158, -0.1948708, 0, 1, 0.2078431, 1,
-0.3603304, -0.5023019, -2.962024, 0, 1, 0.2156863, 1,
-0.3525715, 1.336025, 0.6527703, 0, 1, 0.2196078, 1,
-0.3481828, 1.229597, 0.1269621, 0, 1, 0.227451, 1,
-0.3442928, 2.426575, 0.8409253, 0, 1, 0.2313726, 1,
-0.3379004, -0.8155954, -3.977787, 0, 1, 0.2392157, 1,
-0.3376162, -1.134648, -2.563973, 0, 1, 0.2431373, 1,
-0.3361752, 0.3711415, -1.950806, 0, 1, 0.2509804, 1,
-0.3330132, 1.027325, -0.47596, 0, 1, 0.254902, 1,
-0.3313429, -1.761835, -2.591465, 0, 1, 0.2627451, 1,
-0.3305095, -0.5478364, -2.57596, 0, 1, 0.2666667, 1,
-0.3283814, 2.180278, -1.459353, 0, 1, 0.2745098, 1,
-0.3262267, -2.107314, -3.995527, 0, 1, 0.2784314, 1,
-0.3219244, -0.617256, -3.375814, 0, 1, 0.2862745, 1,
-0.3202862, 0.1747458, -1.790377, 0, 1, 0.2901961, 1,
-0.3169818, -2.228716, -3.84565, 0, 1, 0.2980392, 1,
-0.3139472, -0.9519421, -2.699466, 0, 1, 0.3058824, 1,
-0.2994164, 1.038893, -0.2939525, 0, 1, 0.3098039, 1,
-0.2966196, 2.105869, -0.7041429, 0, 1, 0.3176471, 1,
-0.2922753, -0.1288029, -0.3673039, 0, 1, 0.3215686, 1,
-0.2909592, -0.2651706, -1.532999, 0, 1, 0.3294118, 1,
-0.2891489, 0.312118, -1.44907, 0, 1, 0.3333333, 1,
-0.2844275, -0.3552454, -3.156484, 0, 1, 0.3411765, 1,
-0.2830222, -0.200553, -1.844426, 0, 1, 0.345098, 1,
-0.2769119, -0.6181687, -1.995109, 0, 1, 0.3529412, 1,
-0.276482, 0.3696078, -0.9197975, 0, 1, 0.3568628, 1,
-0.2745389, 1.043913, -2.758044, 0, 1, 0.3647059, 1,
-0.272586, -0.3354062, -1.026063, 0, 1, 0.3686275, 1,
-0.2679432, 1.069719, -0.699728, 0, 1, 0.3764706, 1,
-0.2628868, 1.289273, 1.497154, 0, 1, 0.3803922, 1,
-0.2623216, 0.3673979, -0.6027592, 0, 1, 0.3882353, 1,
-0.2597726, 1.18211, -1.137267, 0, 1, 0.3921569, 1,
-0.259048, 1.377427, -0.1662219, 0, 1, 0.4, 1,
-0.2579215, 0.1726794, -1.512814, 0, 1, 0.4078431, 1,
-0.2567525, 0.9532922, 0.1603995, 0, 1, 0.4117647, 1,
-0.256382, -0.6221902, -3.713101, 0, 1, 0.4196078, 1,
-0.250671, -0.04849209, -2.290365, 0, 1, 0.4235294, 1,
-0.2493558, 1.790621, 0.06768906, 0, 1, 0.4313726, 1,
-0.2478938, -1.046398, -2.699008, 0, 1, 0.4352941, 1,
-0.2457032, 1.388583, -1.097723, 0, 1, 0.4431373, 1,
-0.2418518, -0.3449111, -2.281997, 0, 1, 0.4470588, 1,
-0.2410831, 0.1497575, -0.2996852, 0, 1, 0.454902, 1,
-0.2396718, 0.8192008, 0.8371987, 0, 1, 0.4588235, 1,
-0.2391566, -1.323296, -2.369267, 0, 1, 0.4666667, 1,
-0.2380593, -0.7237492, -1.371146, 0, 1, 0.4705882, 1,
-0.2375674, 0.6198975, -1.263499, 0, 1, 0.4784314, 1,
-0.2358966, 1.147932, -1.113557, 0, 1, 0.4823529, 1,
-0.2346599, -0.4798546, -3.935573, 0, 1, 0.4901961, 1,
-0.2328824, -0.2928696, -2.891826, 0, 1, 0.4941176, 1,
-0.2262212, 0.04428235, -1.971523, 0, 1, 0.5019608, 1,
-0.2238968, 1.436288, -0.4282203, 0, 1, 0.509804, 1,
-0.2231551, 0.3759313, 0.0367852, 0, 1, 0.5137255, 1,
-0.2227175, 0.7939798, -2.525661, 0, 1, 0.5215687, 1,
-0.2158951, 2.100909, 0.5682249, 0, 1, 0.5254902, 1,
-0.2116795, -0.6511967, -2.176211, 0, 1, 0.5333334, 1,
-0.2062583, 0.05790921, -0.8736095, 0, 1, 0.5372549, 1,
-0.2058642, 0.7377459, 0.8321573, 0, 1, 0.5450981, 1,
-0.205366, -0.3511178, -3.283422, 0, 1, 0.5490196, 1,
-0.2034286, -0.5000497, -3.607463, 0, 1, 0.5568628, 1,
-0.2033175, -1.794224, -1.422723, 0, 1, 0.5607843, 1,
-0.2031894, -0.9565966, -3.507741, 0, 1, 0.5686275, 1,
-0.1995704, 1.186255, 0.3229026, 0, 1, 0.572549, 1,
-0.1994102, -0.1530748, -4.455753, 0, 1, 0.5803922, 1,
-0.1982042, 0.3483846, -1.307622, 0, 1, 0.5843138, 1,
-0.1896843, -1.249663, -1.292043, 0, 1, 0.5921569, 1,
-0.1868745, -0.1396365, -3.63613, 0, 1, 0.5960785, 1,
-0.1844119, 1.829973, 0.07082643, 0, 1, 0.6039216, 1,
-0.1787417, -1.416045, -3.021518, 0, 1, 0.6117647, 1,
-0.1786037, 0.2296048, -0.8470395, 0, 1, 0.6156863, 1,
-0.1785353, 1.859982, -1.396003, 0, 1, 0.6235294, 1,
-0.1784927, 0.441161, 1.307267, 0, 1, 0.627451, 1,
-0.1780109, 0.1854957, -0.1212083, 0, 1, 0.6352941, 1,
-0.1683134, -0.5828982, -0.7079682, 0, 1, 0.6392157, 1,
-0.1673002, 0.7256029, -1.097372, 0, 1, 0.6470588, 1,
-0.1621005, -0.3664322, -2.568149, 0, 1, 0.6509804, 1,
-0.1549423, 1.204, 0.9666234, 0, 1, 0.6588235, 1,
-0.151366, -0.4243356, -2.630995, 0, 1, 0.6627451, 1,
-0.1421602, -0.5538628, -3.948639, 0, 1, 0.6705883, 1,
-0.1374176, 0.7516857, -0.9484244, 0, 1, 0.6745098, 1,
-0.1342762, 1.167926, -0.3194501, 0, 1, 0.682353, 1,
-0.1285878, 1.074844, 0.426489, 0, 1, 0.6862745, 1,
-0.1277803, -0.631819, -2.1991, 0, 1, 0.6941177, 1,
-0.1269926, -0.7093385, -0.9967886, 0, 1, 0.7019608, 1,
-0.1262797, 0.8065497, -0.3166507, 0, 1, 0.7058824, 1,
-0.1176517, 1.584068, -0.2455893, 0, 1, 0.7137255, 1,
-0.1161453, -1.111593, -3.399642, 0, 1, 0.7176471, 1,
-0.1078071, -1.938653, -2.166941, 0, 1, 0.7254902, 1,
-0.1069035, 1.180934, -0.08325717, 0, 1, 0.7294118, 1,
-0.106407, -1.31681, -3.070873, 0, 1, 0.7372549, 1,
-0.1062365, -0.491324, -4.544018, 0, 1, 0.7411765, 1,
-0.0991336, -0.4538146, -2.508563, 0, 1, 0.7490196, 1,
-0.09813523, -0.06593685, -0.4890412, 0, 1, 0.7529412, 1,
-0.09221436, 0.06592613, -2.502177, 0, 1, 0.7607843, 1,
-0.08976004, 1.324097, -0.004611532, 0, 1, 0.7647059, 1,
-0.08932135, 0.07289783, -1.911554, 0, 1, 0.772549, 1,
-0.08894356, -0.3720371, -3.278062, 0, 1, 0.7764706, 1,
-0.08701693, 0.3608735, 0.3547186, 0, 1, 0.7843137, 1,
-0.08563375, 0.4207643, -0.02809097, 0, 1, 0.7882353, 1,
-0.0843894, 2.454983, -0.582244, 0, 1, 0.7960784, 1,
-0.07800155, 1.486869, 1.023482, 0, 1, 0.8039216, 1,
-0.07719584, -1.951923, -3.510507, 0, 1, 0.8078431, 1,
-0.0766037, 0.2051314, -0.2761824, 0, 1, 0.8156863, 1,
-0.07566465, -0.08421878, -0.8071222, 0, 1, 0.8196079, 1,
-0.0753297, -0.2945545, -3.803057, 0, 1, 0.827451, 1,
-0.0751426, 0.113077, -1.343639, 0, 1, 0.8313726, 1,
-0.07134103, 0.6008791, -0.8239812, 0, 1, 0.8392157, 1,
-0.07110754, -1.702133, -4.217106, 0, 1, 0.8431373, 1,
-0.07017087, 0.389738, 1.027503, 0, 1, 0.8509804, 1,
-0.0686513, -1.564271, -3.66119, 0, 1, 0.854902, 1,
-0.05929418, 0.05023422, 0.1953136, 0, 1, 0.8627451, 1,
-0.05680607, -0.4430172, -3.088244, 0, 1, 0.8666667, 1,
-0.05167945, 0.5680588, 0.1694013, 0, 1, 0.8745098, 1,
-0.05065913, -1.993528, -4.050605, 0, 1, 0.8784314, 1,
-0.0471029, 0.2815325, -0.9227327, 0, 1, 0.8862745, 1,
-0.0458886, -1.480048, -3.900311, 0, 1, 0.8901961, 1,
-0.04562238, -2.351337, -3.379035, 0, 1, 0.8980392, 1,
-0.03913873, 1.07625, -0.2483835, 0, 1, 0.9058824, 1,
-0.03906699, 1.744079, -0.7405365, 0, 1, 0.9098039, 1,
-0.03620952, -0.7682086, -4.462089, 0, 1, 0.9176471, 1,
-0.03564106, 0.01482596, 0.01841698, 0, 1, 0.9215686, 1,
-0.03071571, 1.105109, -1.032681, 0, 1, 0.9294118, 1,
-0.02979503, 1.698171, 0.2284404, 0, 1, 0.9333333, 1,
-0.02949474, 0.2696897, -1.22573, 0, 1, 0.9411765, 1,
-0.02113958, 0.4586314, -1.186614, 0, 1, 0.945098, 1,
-0.0177303, 1.17211, -0.1312471, 0, 1, 0.9529412, 1,
-0.0105346, -1.33698, -2.576818, 0, 1, 0.9568627, 1,
-0.007498747, 0.0001400547, -2.692743, 0, 1, 0.9647059, 1,
-0.005973559, 3.162777, 0.4184805, 0, 1, 0.9686275, 1,
-0.002682474, -1.58166, -4.260563, 0, 1, 0.9764706, 1,
0.001552773, -1.142006, 3.617932, 0, 1, 0.9803922, 1,
0.005368691, 0.5397023, 0.6361562, 0, 1, 0.9882353, 1,
0.006199231, -1.588044, 2.156533, 0, 1, 0.9921569, 1,
0.007492304, 0.8233546, 0.6919639, 0, 1, 1, 1,
0.01105516, 0.1312682, -0.1371345, 0, 0.9921569, 1, 1,
0.01515885, -0.7980546, 3.246284, 0, 0.9882353, 1, 1,
0.01538287, -1.585722, 2.597388, 0, 0.9803922, 1, 1,
0.01630008, -1.752209, 3.457279, 0, 0.9764706, 1, 1,
0.0179023, 0.1287376, 0.01558234, 0, 0.9686275, 1, 1,
0.01808113, 1.392908, 2.933629, 0, 0.9647059, 1, 1,
0.01891246, -0.4569671, 2.576963, 0, 0.9568627, 1, 1,
0.01900852, -0.5295543, 1.241867, 0, 0.9529412, 1, 1,
0.02041596, -0.3662629, 2.513729, 0, 0.945098, 1, 1,
0.02050699, 1.007611, 2.173361, 0, 0.9411765, 1, 1,
0.02051023, 0.2139146, 1.859767, 0, 0.9333333, 1, 1,
0.02071972, 0.1290495, -1.608141, 0, 0.9294118, 1, 1,
0.02273263, 1.70583, -0.2782142, 0, 0.9215686, 1, 1,
0.02767169, -1.521424, 2.262382, 0, 0.9176471, 1, 1,
0.03003341, -0.4249078, 2.088252, 0, 0.9098039, 1, 1,
0.03252726, 0.04118346, -0.1710249, 0, 0.9058824, 1, 1,
0.03265766, 0.2163056, -0.0202412, 0, 0.8980392, 1, 1,
0.0339856, -0.4542124, 2.073713, 0, 0.8901961, 1, 1,
0.03473262, -0.3067066, 3.081142, 0, 0.8862745, 1, 1,
0.03626719, -0.3336029, 2.399261, 0, 0.8784314, 1, 1,
0.03655297, 0.912522, 1.367066, 0, 0.8745098, 1, 1,
0.03925014, 0.2832944, -0.0839109, 0, 0.8666667, 1, 1,
0.04200389, 1.097959, 0.443755, 0, 0.8627451, 1, 1,
0.04210832, -3.065189, 2.917711, 0, 0.854902, 1, 1,
0.04532956, -0.498675, 1.942061, 0, 0.8509804, 1, 1,
0.04613637, -0.9864517, -0.3469396, 0, 0.8431373, 1, 1,
0.04906886, 0.4358178, 0.03814469, 0, 0.8392157, 1, 1,
0.05067489, -0.1435369, 3.947731, 0, 0.8313726, 1, 1,
0.05106982, 0.1196224, 1.274267, 0, 0.827451, 1, 1,
0.06271593, 0.8230664, 0.7123865, 0, 0.8196079, 1, 1,
0.06364057, -0.3957384, 4.253717, 0, 0.8156863, 1, 1,
0.06412057, 0.5090566, 1.134982, 0, 0.8078431, 1, 1,
0.06541719, -0.009165822, 3.870747, 0, 0.8039216, 1, 1,
0.06550541, -0.7378763, 1.432238, 0, 0.7960784, 1, 1,
0.06780834, -2.561719, 2.868616, 0, 0.7882353, 1, 1,
0.06988745, -0.1897827, 2.160837, 0, 0.7843137, 1, 1,
0.07774757, -1.006916, 2.730619, 0, 0.7764706, 1, 1,
0.08052642, -1.446337, 2.542017, 0, 0.772549, 1, 1,
0.08142202, -0.4040945, 3.118873, 0, 0.7647059, 1, 1,
0.09123369, 1.605674, -0.392619, 0, 0.7607843, 1, 1,
0.09457448, -0.3517474, 3.993589, 0, 0.7529412, 1, 1,
0.09746239, 0.6491863, 0.2121432, 0, 0.7490196, 1, 1,
0.09956479, 0.7063723, 0.821058, 0, 0.7411765, 1, 1,
0.1047662, 0.6609914, 1.12768, 0, 0.7372549, 1, 1,
0.1115568, -0.4785578, 0.9378468, 0, 0.7294118, 1, 1,
0.1130846, 0.8087137, -1.157587, 0, 0.7254902, 1, 1,
0.1186216, 1.317967, 1.41985, 0, 0.7176471, 1, 1,
0.1186536, 1.570297, -1.963889, 0, 0.7137255, 1, 1,
0.1199697, 0.5336689, -0.5662179, 0, 0.7058824, 1, 1,
0.1200406, -0.2961663, 1.743444, 0, 0.6980392, 1, 1,
0.120411, 0.07294868, 0.9407821, 0, 0.6941177, 1, 1,
0.1227623, 0.8480649, 1.891473, 0, 0.6862745, 1, 1,
0.1232628, 1.973611, 1.807139, 0, 0.682353, 1, 1,
0.1236553, 0.9742385, -1.027141, 0, 0.6745098, 1, 1,
0.1249818, 0.1321678, 1.649681, 0, 0.6705883, 1, 1,
0.1285337, 0.7152582, 0.9419971, 0, 0.6627451, 1, 1,
0.1306079, -0.6502557, 3.475639, 0, 0.6588235, 1, 1,
0.131082, -0.6062151, 4.301667, 0, 0.6509804, 1, 1,
0.1314929, -1.155014, 1.305421, 0, 0.6470588, 1, 1,
0.1316645, 1.2075, -2.215726, 0, 0.6392157, 1, 1,
0.13439, -0.837735, 4.199208, 0, 0.6352941, 1, 1,
0.1356717, 0.8419073, 1.137502, 0, 0.627451, 1, 1,
0.1361859, 0.3888513, -0.805984, 0, 0.6235294, 1, 1,
0.1400461, 0.2534749, 1.354163, 0, 0.6156863, 1, 1,
0.1470955, 2.030135, -0.4613608, 0, 0.6117647, 1, 1,
0.1485034, 1.842256, -0.466525, 0, 0.6039216, 1, 1,
0.1526508, -0.8660481, 2.016596, 0, 0.5960785, 1, 1,
0.154317, 0.1200176, 1.434754, 0, 0.5921569, 1, 1,
0.1603535, 1.465182, 0.7103385, 0, 0.5843138, 1, 1,
0.1607655, 0.5075076, 1.243636, 0, 0.5803922, 1, 1,
0.1613096, 0.1546311, 0.391862, 0, 0.572549, 1, 1,
0.166973, 1.639003, 0.9243309, 0, 0.5686275, 1, 1,
0.1696863, -1.100693, 3.344539, 0, 0.5607843, 1, 1,
0.1700099, -0.663386, 1.594764, 0, 0.5568628, 1, 1,
0.1733739, 1.600042, 0.3442152, 0, 0.5490196, 1, 1,
0.1738196, 0.1130316, 1.058494, 0, 0.5450981, 1, 1,
0.1756104, 0.7988809, -0.7444078, 0, 0.5372549, 1, 1,
0.1777971, -0.3758141, 2.893826, 0, 0.5333334, 1, 1,
0.1799366, -1.777313, 3.161198, 0, 0.5254902, 1, 1,
0.1835594, -0.105956, 0.7032012, 0, 0.5215687, 1, 1,
0.1960863, -0.2392988, 1.183545, 0, 0.5137255, 1, 1,
0.1962503, 0.5602434, -1.876611, 0, 0.509804, 1, 1,
0.1993443, -0.7154539, 3.088192, 0, 0.5019608, 1, 1,
0.2000357, 0.2639261, 0.6770174, 0, 0.4941176, 1, 1,
0.2019385, -1.810548, 3.270124, 0, 0.4901961, 1, 1,
0.2063186, 0.905238, 0.6435802, 0, 0.4823529, 1, 1,
0.2116427, -0.5307781, 0.4112454, 0, 0.4784314, 1, 1,
0.2145444, -0.9818152, 4.285313, 0, 0.4705882, 1, 1,
0.2170698, 0.8041536, 0.05118934, 0, 0.4666667, 1, 1,
0.2239053, -0.6884092, 0.5027577, 0, 0.4588235, 1, 1,
0.2297606, -1.280091, 3.682164, 0, 0.454902, 1, 1,
0.232142, 0.1378241, -0.06485923, 0, 0.4470588, 1, 1,
0.2341253, -0.7138072, 3.909153, 0, 0.4431373, 1, 1,
0.2370747, -0.02187597, 1.871251, 0, 0.4352941, 1, 1,
0.23906, 0.2764629, 1.463868, 0, 0.4313726, 1, 1,
0.2491097, 1.654857, -0.5473554, 0, 0.4235294, 1, 1,
0.2512184, -1.741643, 3.428454, 0, 0.4196078, 1, 1,
0.2574913, -0.5979226, 2.816767, 0, 0.4117647, 1, 1,
0.2591295, 0.754852, -0.1620552, 0, 0.4078431, 1, 1,
0.2593514, 1.203941, -1.169018, 0, 0.4, 1, 1,
0.2619369, -2.191532, 2.356791, 0, 0.3921569, 1, 1,
0.2635434, 0.3577455, 1.251647, 0, 0.3882353, 1, 1,
0.267393, -1.994841, 1.702728, 0, 0.3803922, 1, 1,
0.2674419, 0.04063785, 3.286801, 0, 0.3764706, 1, 1,
0.2700624, -0.2624596, 1.954817, 0, 0.3686275, 1, 1,
0.275825, 1.494689, -0.3949268, 0, 0.3647059, 1, 1,
0.277178, 0.7560048, 0.3807731, 0, 0.3568628, 1, 1,
0.2777032, 1.183619, 0.7865704, 0, 0.3529412, 1, 1,
0.2782235, -0.1244221, 0.8674075, 0, 0.345098, 1, 1,
0.2806801, -2.016679, 4.339169, 0, 0.3411765, 1, 1,
0.2827521, -1.010568, 2.683073, 0, 0.3333333, 1, 1,
0.2842285, -1.195098, 2.610224, 0, 0.3294118, 1, 1,
0.2894651, 0.3938532, 0.7663084, 0, 0.3215686, 1, 1,
0.2932096, 1.027975, 1.407155, 0, 0.3176471, 1, 1,
0.3152035, 1.246347, 2.610901, 0, 0.3098039, 1, 1,
0.3159923, -0.9451857, 3.659438, 0, 0.3058824, 1, 1,
0.3207897, -0.6580419, 1.436879, 0, 0.2980392, 1, 1,
0.3222073, -0.1259002, 2.290133, 0, 0.2901961, 1, 1,
0.3231121, -0.1986912, 2.60605, 0, 0.2862745, 1, 1,
0.3300448, 1.332232, 1.004755, 0, 0.2784314, 1, 1,
0.3309562, 3.19961, 1.038569, 0, 0.2745098, 1, 1,
0.3342425, 2.181552, -0.1525829, 0, 0.2666667, 1, 1,
0.3350435, -0.5030943, 3.108228, 0, 0.2627451, 1, 1,
0.3378378, 1.515261, 0.1704732, 0, 0.254902, 1, 1,
0.3413403, 0.8895174, 0.787384, 0, 0.2509804, 1, 1,
0.3465668, 1.344906, 0.1282158, 0, 0.2431373, 1, 1,
0.3476673, -1.892462, 2.057724, 0, 0.2392157, 1, 1,
0.3494511, -0.6691914, 3.00472, 0, 0.2313726, 1, 1,
0.3532302, -0.4258873, 2.150365, 0, 0.227451, 1, 1,
0.3555563, 0.3172778, 0.2433785, 0, 0.2196078, 1, 1,
0.3655547, 1.439189, 0.3284442, 0, 0.2156863, 1, 1,
0.3669445, -1.538097, 1.426592, 0, 0.2078431, 1, 1,
0.3674215, -0.1862485, 2.546021, 0, 0.2039216, 1, 1,
0.3695277, -1.239383, 2.786468, 0, 0.1960784, 1, 1,
0.3761804, -0.9727241, 3.872731, 0, 0.1882353, 1, 1,
0.3796629, -0.5613022, 2.255909, 0, 0.1843137, 1, 1,
0.3814185, -0.8088078, 2.489212, 0, 0.1764706, 1, 1,
0.3816648, 0.8978148, 0.3357515, 0, 0.172549, 1, 1,
0.3817131, 0.8165056, 1.32946, 0, 0.1647059, 1, 1,
0.3831172, -0.6935344, 4.430964, 0, 0.1607843, 1, 1,
0.3839484, 1.076534, 2.174119, 0, 0.1529412, 1, 1,
0.385402, 0.7091459, -1.931322, 0, 0.1490196, 1, 1,
0.3877764, 0.6108624, 1.704922, 0, 0.1411765, 1, 1,
0.3899659, 1.226116, 0.8764853, 0, 0.1372549, 1, 1,
0.3910205, 1.165199, 2.009392, 0, 0.1294118, 1, 1,
0.3921676, 0.3610201, 0.1678326, 0, 0.1254902, 1, 1,
0.3934916, 0.7177339, 0.04832319, 0, 0.1176471, 1, 1,
0.3965224, -0.4720905, 1.398136, 0, 0.1137255, 1, 1,
0.3977605, -1.038733, 3.745759, 0, 0.1058824, 1, 1,
0.4018621, 0.8413136, 0.1443858, 0, 0.09803922, 1, 1,
0.4064941, -1.364194, 1.872459, 0, 0.09411765, 1, 1,
0.4128858, 1.136722, 0.01021938, 0, 0.08627451, 1, 1,
0.4172812, 0.4210383, 0.6566716, 0, 0.08235294, 1, 1,
0.4178954, -0.9551761, 3.274128, 0, 0.07450981, 1, 1,
0.4216796, -0.1908897, 1.819091, 0, 0.07058824, 1, 1,
0.4237474, -0.270894, 1.145016, 0, 0.0627451, 1, 1,
0.4253941, -0.3328156, 2.966447, 0, 0.05882353, 1, 1,
0.4270962, -0.2651094, 2.696219, 0, 0.05098039, 1, 1,
0.4341694, -1.260003, 2.580865, 0, 0.04705882, 1, 1,
0.4370208, -1.999445, 2.078408, 0, 0.03921569, 1, 1,
0.4468721, -1.658795, 3.675787, 0, 0.03529412, 1, 1,
0.4515745, -0.7556084, 1.88223, 0, 0.02745098, 1, 1,
0.4522884, 0.03708372, 3.864911, 0, 0.02352941, 1, 1,
0.4535423, 1.220093, 0.09845304, 0, 0.01568628, 1, 1,
0.4619423, -0.2931627, 0.6762956, 0, 0.01176471, 1, 1,
0.4623912, 0.1693741, 0.3747153, 0, 0.003921569, 1, 1,
0.4678352, -0.625787, 2.850902, 0.003921569, 0, 1, 1,
0.4780074, -0.955976, 3.351974, 0.007843138, 0, 1, 1,
0.4792356, -1.489267, 1.391918, 0.01568628, 0, 1, 1,
0.4804024, 1.840683, 0.7610472, 0.01960784, 0, 1, 1,
0.4820768, 1.032202, -1.065874, 0.02745098, 0, 1, 1,
0.4850517, 0.1314519, 2.446374, 0.03137255, 0, 1, 1,
0.4873283, -0.05875273, 1.574148, 0.03921569, 0, 1, 1,
0.4875691, -1.320761, 4.216239, 0.04313726, 0, 1, 1,
0.4941879, 0.0950821, 0.7239304, 0.05098039, 0, 1, 1,
0.4988813, -0.1521042, 1.974745, 0.05490196, 0, 1, 1,
0.4999245, -0.2863646, 2.423594, 0.0627451, 0, 1, 1,
0.5019712, -0.4253618, 2.283247, 0.06666667, 0, 1, 1,
0.5032036, -1.934244, 4.442283, 0.07450981, 0, 1, 1,
0.5059571, -0.4607015, 3.614281, 0.07843138, 0, 1, 1,
0.5137425, -1.20335, 2.962257, 0.08627451, 0, 1, 1,
0.5147647, -0.2844449, 2.212407, 0.09019608, 0, 1, 1,
0.5168431, -0.2432912, 2.306871, 0.09803922, 0, 1, 1,
0.5193372, 1.747251, -1.267639, 0.1058824, 0, 1, 1,
0.5213069, 1.086377, -0.6744323, 0.1098039, 0, 1, 1,
0.521836, 0.9426538, 1.335344, 0.1176471, 0, 1, 1,
0.5223305, -0.1508708, 0.8339716, 0.1215686, 0, 1, 1,
0.5230303, 0.001546281, 2.344017, 0.1294118, 0, 1, 1,
0.5240595, 2.37602, -0.5361612, 0.1333333, 0, 1, 1,
0.5264935, -0.6376259, 2.143823, 0.1411765, 0, 1, 1,
0.5282645, -0.8131575, 3.122415, 0.145098, 0, 1, 1,
0.5294877, 0.6620809, -0.8215477, 0.1529412, 0, 1, 1,
0.5298231, -0.5065031, 1.867995, 0.1568628, 0, 1, 1,
0.5309952, 0.0798584, 2.816471, 0.1647059, 0, 1, 1,
0.5323694, -0.05457699, 1.689725, 0.1686275, 0, 1, 1,
0.5338441, -0.3625101, 3.738378, 0.1764706, 0, 1, 1,
0.5339803, 0.1885874, 1.935501, 0.1803922, 0, 1, 1,
0.5355213, 0.5586811, 3.355319, 0.1882353, 0, 1, 1,
0.5367807, 0.7575471, 1.094067, 0.1921569, 0, 1, 1,
0.5423477, 0.7872451, 0.5928044, 0.2, 0, 1, 1,
0.5473981, 0.9986956, 0.06475757, 0.2078431, 0, 1, 1,
0.5507819, -0.9248835, 3.201334, 0.2117647, 0, 1, 1,
0.5578725, 0.3477501, 1.450161, 0.2196078, 0, 1, 1,
0.5585731, -1.508582, 4.031063, 0.2235294, 0, 1, 1,
0.5687355, -0.06236012, 1.812006, 0.2313726, 0, 1, 1,
0.5706905, 0.2910741, 0.1214256, 0.2352941, 0, 1, 1,
0.5749271, -1.434747, 2.446014, 0.2431373, 0, 1, 1,
0.5761837, 0.07811252, -0.007343179, 0.2470588, 0, 1, 1,
0.5781235, -1.164898, 2.136735, 0.254902, 0, 1, 1,
0.5795375, 0.1768857, 1.277054, 0.2588235, 0, 1, 1,
0.5858541, -0.4743968, 3.9627, 0.2666667, 0, 1, 1,
0.5869753, -0.6438587, 2.576784, 0.2705882, 0, 1, 1,
0.5882034, -0.5264512, 3.70839, 0.2784314, 0, 1, 1,
0.5921148, 0.6226377, 0.8167045, 0.282353, 0, 1, 1,
0.602612, 0.5585372, 1.615847, 0.2901961, 0, 1, 1,
0.6064385, -0.2119782, 2.43333, 0.2941177, 0, 1, 1,
0.6083501, 0.5381416, 1.515688, 0.3019608, 0, 1, 1,
0.6085911, 1.494283, -0.5844602, 0.3098039, 0, 1, 1,
0.6100149, 0.4803656, 1.006706, 0.3137255, 0, 1, 1,
0.6133277, 1.521155, 0.7310677, 0.3215686, 0, 1, 1,
0.6139191, -0.7773202, 1.370675, 0.3254902, 0, 1, 1,
0.6180637, 0.6326402, 2.099882, 0.3333333, 0, 1, 1,
0.6250786, 0.5674848, 3.139748, 0.3372549, 0, 1, 1,
0.6301382, 0.6076776, 2.21306, 0.345098, 0, 1, 1,
0.636586, 0.7650129, 1.836812, 0.3490196, 0, 1, 1,
0.6385472, -0.3986107, 1.267766, 0.3568628, 0, 1, 1,
0.6406164, 0.6346107, 0.8284147, 0.3607843, 0, 1, 1,
0.6447187, 0.9136331, -0.2595094, 0.3686275, 0, 1, 1,
0.6503629, -0.8579093, 1.295314, 0.372549, 0, 1, 1,
0.6516417, -1.216908, 2.6296, 0.3803922, 0, 1, 1,
0.6531402, 1.259333, 0.3617097, 0.3843137, 0, 1, 1,
0.6560455, 1.005198, 0.6848226, 0.3921569, 0, 1, 1,
0.6591944, 0.2590369, 1.182217, 0.3960784, 0, 1, 1,
0.6616911, 0.1536733, 3.097417, 0.4039216, 0, 1, 1,
0.6626097, -0.02219605, 1.967588, 0.4117647, 0, 1, 1,
0.6626682, -0.07603492, 0.1028889, 0.4156863, 0, 1, 1,
0.6660613, 0.261559, 1.930942, 0.4235294, 0, 1, 1,
0.6705021, -1.610852, 2.436949, 0.427451, 0, 1, 1,
0.6795252, 0.6803949, 1.280405, 0.4352941, 0, 1, 1,
0.685553, 0.09818436, 2.31451, 0.4392157, 0, 1, 1,
0.6978983, 0.7445625, 0.4535053, 0.4470588, 0, 1, 1,
0.6979327, -0.04365185, 0.1507193, 0.4509804, 0, 1, 1,
0.6980795, 0.7011072, 3.48734, 0.4588235, 0, 1, 1,
0.6985443, 2.19539, 1.275217, 0.4627451, 0, 1, 1,
0.7031957, -1.592405, 2.292704, 0.4705882, 0, 1, 1,
0.7034535, 0.2920151, 2.213202, 0.4745098, 0, 1, 1,
0.7035005, 0.08435205, 0.5426311, 0.4823529, 0, 1, 1,
0.7086635, -0.961202, 1.764176, 0.4862745, 0, 1, 1,
0.7130029, -0.707778, 2.633431, 0.4941176, 0, 1, 1,
0.7152278, 0.1420218, 0.8202366, 0.5019608, 0, 1, 1,
0.7161896, -0.2186025, 2.638143, 0.5058824, 0, 1, 1,
0.7181791, -1.46997, 1.503742, 0.5137255, 0, 1, 1,
0.71854, -0.5285765, 4.012285, 0.5176471, 0, 1, 1,
0.7226176, -1.929193, 3.538655, 0.5254902, 0, 1, 1,
0.7226487, -0.2946802, 1.265413, 0.5294118, 0, 1, 1,
0.7243377, -0.6988894, 1.872674, 0.5372549, 0, 1, 1,
0.7285491, -1.042369, 1.820479, 0.5411765, 0, 1, 1,
0.7378471, 0.1649116, 1.876379, 0.5490196, 0, 1, 1,
0.7415913, 1.074449, -0.2536714, 0.5529412, 0, 1, 1,
0.7416736, 0.300712, 0.07676772, 0.5607843, 0, 1, 1,
0.745564, 1.503873, 0.829488, 0.5647059, 0, 1, 1,
0.7474296, 0.5463561, 1.36369, 0.572549, 0, 1, 1,
0.7491362, 0.6407067, 0.8820761, 0.5764706, 0, 1, 1,
0.7510309, -0.6093161, 2.689003, 0.5843138, 0, 1, 1,
0.7522667, 0.8496263, 2.383079, 0.5882353, 0, 1, 1,
0.765525, -0.4441545, 0.5341181, 0.5960785, 0, 1, 1,
0.7666833, 1.50666, 1.183405, 0.6039216, 0, 1, 1,
0.7771245, -1.008808, 2.281582, 0.6078432, 0, 1, 1,
0.7839745, 0.6440481, -0.2205611, 0.6156863, 0, 1, 1,
0.7920802, -0.8360059, 2.646967, 0.6196079, 0, 1, 1,
0.7948679, -0.2304754, 4.005786, 0.627451, 0, 1, 1,
0.7988944, -0.5243187, 1.06661, 0.6313726, 0, 1, 1,
0.8020836, 0.04000809, 0.2384961, 0.6392157, 0, 1, 1,
0.8038756, 0.1010287, 2.039059, 0.6431373, 0, 1, 1,
0.807156, 0.1301322, 1.245114, 0.6509804, 0, 1, 1,
0.8095862, -1.832497, 1.426601, 0.654902, 0, 1, 1,
0.8148511, -1.146128, 1.683509, 0.6627451, 0, 1, 1,
0.8193454, 0.4053448, 1.523062, 0.6666667, 0, 1, 1,
0.8218586, -0.2224591, 1.701364, 0.6745098, 0, 1, 1,
0.8233783, 0.2057712, 2.295719, 0.6784314, 0, 1, 1,
0.8245806, 0.5118976, 1.167297, 0.6862745, 0, 1, 1,
0.8261477, 1.247635, -0.009947011, 0.6901961, 0, 1, 1,
0.8262432, -1.075259, 1.25197, 0.6980392, 0, 1, 1,
0.8265104, -0.9573447, -1.001215, 0.7058824, 0, 1, 1,
0.8268671, -1.307718, 2.004746, 0.7098039, 0, 1, 1,
0.8274489, -3.125286, 4.462222, 0.7176471, 0, 1, 1,
0.8303788, -0.3545342, 0.7274408, 0.7215686, 0, 1, 1,
0.8310249, 1.225741, -0.9078273, 0.7294118, 0, 1, 1,
0.8347588, -2.648723, 2.829574, 0.7333333, 0, 1, 1,
0.8391032, -0.8688909, 3.407416, 0.7411765, 0, 1, 1,
0.8420023, 1.059643, 0.09515566, 0.7450981, 0, 1, 1,
0.8443373, -0.4998725, 3.751311, 0.7529412, 0, 1, 1,
0.8444565, 0.5854769, 2.537995, 0.7568628, 0, 1, 1,
0.8445358, 0.7879871, 0.07788884, 0.7647059, 0, 1, 1,
0.8466617, 0.3453608, 1.451456, 0.7686275, 0, 1, 1,
0.8505026, -0.4345927, 2.673413, 0.7764706, 0, 1, 1,
0.8505307, 0.3251033, 1.564475, 0.7803922, 0, 1, 1,
0.850616, 1.46067, 1.670654, 0.7882353, 0, 1, 1,
0.854247, -1.587587, 2.565302, 0.7921569, 0, 1, 1,
0.856852, 0.1279729, 1.169004, 0.8, 0, 1, 1,
0.862357, -0.1438556, 1.426398, 0.8078431, 0, 1, 1,
0.8661159, -2.503741, 1.663479, 0.8117647, 0, 1, 1,
0.8681363, -1.369451, 2.196277, 0.8196079, 0, 1, 1,
0.8688241, -1.134707, 1.601244, 0.8235294, 0, 1, 1,
0.8692293, 0.8823895, 0.9912781, 0.8313726, 0, 1, 1,
0.8742341, 0.4802704, 0.7513281, 0.8352941, 0, 1, 1,
0.8786917, -0.862124, 2.301992, 0.8431373, 0, 1, 1,
0.8887764, 0.8684287, 2.063476, 0.8470588, 0, 1, 1,
0.9011332, -1.372396, 2.645919, 0.854902, 0, 1, 1,
0.9030222, 0.4749448, 2.828535, 0.8588235, 0, 1, 1,
0.9058773, -0.3783088, 0.664933, 0.8666667, 0, 1, 1,
0.9060347, 1.594122, 0.1261159, 0.8705882, 0, 1, 1,
0.9144866, 1.342115, 1.020596, 0.8784314, 0, 1, 1,
0.9150602, -0.8278553, 1.894596, 0.8823529, 0, 1, 1,
0.9169332, 0.7745033, 1.115574, 0.8901961, 0, 1, 1,
0.9178578, -0.4090419, 2.053515, 0.8941177, 0, 1, 1,
0.9328573, 0.01898646, 0.9404511, 0.9019608, 0, 1, 1,
0.9396734, 0.6713389, 1.309016, 0.9098039, 0, 1, 1,
0.9470902, 0.1584585, 0.4654762, 0.9137255, 0, 1, 1,
0.9476777, -1.68975, 3.832644, 0.9215686, 0, 1, 1,
0.9510514, 0.01150152, -0.08276643, 0.9254902, 0, 1, 1,
0.9558223, -1.584827, 3.73452, 0.9333333, 0, 1, 1,
0.9587899, 0.01779342, 1.918848, 0.9372549, 0, 1, 1,
0.9641448, -1.256479, 4.18162, 0.945098, 0, 1, 1,
0.9748339, 0.2480587, 2.431796, 0.9490196, 0, 1, 1,
0.9825519, -1.607779, 3.751936, 0.9568627, 0, 1, 1,
0.9969877, -1.462207, 2.930931, 0.9607843, 0, 1, 1,
0.9997932, 0.1227643, 2.312143, 0.9686275, 0, 1, 1,
1.003414, -0.1573978, 0.4948697, 0.972549, 0, 1, 1,
1.005443, 0.2531758, -0.0871369, 0.9803922, 0, 1, 1,
1.010389, 1.50446, 0.3150729, 0.9843137, 0, 1, 1,
1.010558, -0.04912633, 1.884219, 0.9921569, 0, 1, 1,
1.015231, -0.1950872, 0.6443905, 0.9960784, 0, 1, 1,
1.020603, -0.8800106, 3.295564, 1, 0, 0.9960784, 1,
1.0212, 0.7023892, -0.5421063, 1, 0, 0.9882353, 1,
1.026382, -1.383919, 1.996668, 1, 0, 0.9843137, 1,
1.028624, -1.285722, 1.152995, 1, 0, 0.9764706, 1,
1.031103, -1.018185, 2.121266, 1, 0, 0.972549, 1,
1.032291, 0.9950138, 0.1683381, 1, 0, 0.9647059, 1,
1.033731, 0.5647513, 1.631042, 1, 0, 0.9607843, 1,
1.037209, -0.3500117, 3.254513, 1, 0, 0.9529412, 1,
1.040419, 0.6770594, 0.4635672, 1, 0, 0.9490196, 1,
1.040981, -0.2779323, 2.680851, 1, 0, 0.9411765, 1,
1.044421, 1.132067, 1.337325, 1, 0, 0.9372549, 1,
1.054613, 1.760236, 0.02568259, 1, 0, 0.9294118, 1,
1.05805, 0.8670189, 0.8756758, 1, 0, 0.9254902, 1,
1.061452, -0.4287491, 2.325941, 1, 0, 0.9176471, 1,
1.064659, 0.4226038, 0.9326994, 1, 0, 0.9137255, 1,
1.06653, 2.010609, 1.0869, 1, 0, 0.9058824, 1,
1.0673, -1.174464, 2.208313, 1, 0, 0.9019608, 1,
1.067301, 0.5254297, 1.387638, 1, 0, 0.8941177, 1,
1.07832, -0.6591154, 1.073387, 1, 0, 0.8862745, 1,
1.08303, 0.3610486, 1.681371, 1, 0, 0.8823529, 1,
1.084001, -0.6839417, 2.181911, 1, 0, 0.8745098, 1,
1.085091, -0.7066392, 1.902767, 1, 0, 0.8705882, 1,
1.08565, 0.09915497, 1.091943, 1, 0, 0.8627451, 1,
1.093577, 0.8601167, 2.181448, 1, 0, 0.8588235, 1,
1.093714, 1.672963, 0.1303989, 1, 0, 0.8509804, 1,
1.095967, -0.4036991, 0.9034873, 1, 0, 0.8470588, 1,
1.105104, -0.6765948, 2.503356, 1, 0, 0.8392157, 1,
1.108524, 0.4332997, 1.149686, 1, 0, 0.8352941, 1,
1.118542, -0.8338816, 4.196931, 1, 0, 0.827451, 1,
1.122182, 0.6984203, 1.277445, 1, 0, 0.8235294, 1,
1.126336, 1.561456, 0.1367442, 1, 0, 0.8156863, 1,
1.128114, 0.5706895, 0.5297601, 1, 0, 0.8117647, 1,
1.135461, 0.4112988, 1.313883, 1, 0, 0.8039216, 1,
1.139219, -1.672794, 3.057458, 1, 0, 0.7960784, 1,
1.140397, -0.4897683, 1.907386, 1, 0, 0.7921569, 1,
1.143112, 1.468091, 0.9276904, 1, 0, 0.7843137, 1,
1.147833, 0.5658957, 1.026555, 1, 0, 0.7803922, 1,
1.149782, -2.12, 2.055035, 1, 0, 0.772549, 1,
1.151724, -0.944261, 3.091466, 1, 0, 0.7686275, 1,
1.160601, 1.08438, 1.956837, 1, 0, 0.7607843, 1,
1.180912, 1.944392, -0.197673, 1, 0, 0.7568628, 1,
1.183781, 0.4045482, 1.522438, 1, 0, 0.7490196, 1,
1.188954, -0.4182501, 1.583188, 1, 0, 0.7450981, 1,
1.198332, 0.4761179, 0.6399977, 1, 0, 0.7372549, 1,
1.207529, 0.3892965, 0.7277702, 1, 0, 0.7333333, 1,
1.208219, 0.9331146, 0.6241037, 1, 0, 0.7254902, 1,
1.223498, -2.660739, 2.117513, 1, 0, 0.7215686, 1,
1.227164, 1.523892, -0.2712724, 1, 0, 0.7137255, 1,
1.227316, 0.0007912556, 2.166586, 1, 0, 0.7098039, 1,
1.23007, -0.08162467, 1.50825, 1, 0, 0.7019608, 1,
1.232295, 2.583491, 1.865437, 1, 0, 0.6941177, 1,
1.237164, 0.3225668, 0.06098155, 1, 0, 0.6901961, 1,
1.241136, 1.934708, 1.035579, 1, 0, 0.682353, 1,
1.243715, -0.7947996, 4.001898, 1, 0, 0.6784314, 1,
1.24655, 0.5732535, 1.558704, 1, 0, 0.6705883, 1,
1.263749, 1.831661, 1.524504, 1, 0, 0.6666667, 1,
1.272688, 0.8596758, 0.1871649, 1, 0, 0.6588235, 1,
1.27518, 0.325906, -0.0714772, 1, 0, 0.654902, 1,
1.279747, 1.582588, 2.842202, 1, 0, 0.6470588, 1,
1.284314, -1.77204, 2.601434, 1, 0, 0.6431373, 1,
1.299951, -0.3839013, 3.199472, 1, 0, 0.6352941, 1,
1.319031, 1.703895, -1.095512, 1, 0, 0.6313726, 1,
1.321275, 0.1188508, 1.200481, 1, 0, 0.6235294, 1,
1.321903, 0.8344918, 0.7884604, 1, 0, 0.6196079, 1,
1.326966, 0.5901557, 0.3864319, 1, 0, 0.6117647, 1,
1.328412, -0.1607901, 1.91352, 1, 0, 0.6078432, 1,
1.334706, -0.1358025, 2.325689, 1, 0, 0.6, 1,
1.34389, 1.055853, 0.2833503, 1, 0, 0.5921569, 1,
1.35219, -2.275132, 1.395405, 1, 0, 0.5882353, 1,
1.352461, 1.222392, 0.7459154, 1, 0, 0.5803922, 1,
1.357153, -0.4189535, 2.071803, 1, 0, 0.5764706, 1,
1.371422, 0.296906, 2.998698, 1, 0, 0.5686275, 1,
1.375069, -0.4478106, 3.513072, 1, 0, 0.5647059, 1,
1.409113, 0.6445647, -0.09753377, 1, 0, 0.5568628, 1,
1.410409, -0.08748788, 1.772949, 1, 0, 0.5529412, 1,
1.432592, 0.3345109, 0.9687792, 1, 0, 0.5450981, 1,
1.439842, -0.03922617, 1.227974, 1, 0, 0.5411765, 1,
1.441183, -0.340434, 2.709841, 1, 0, 0.5333334, 1,
1.441685, 1.169073, 0.5984491, 1, 0, 0.5294118, 1,
1.448863, 0.3371262, 1.362758, 1, 0, 0.5215687, 1,
1.461901, 0.2484933, -0.3982539, 1, 0, 0.5176471, 1,
1.463236, -0.3030298, 0.664274, 1, 0, 0.509804, 1,
1.470024, -0.8517402, 1.459756, 1, 0, 0.5058824, 1,
1.476141, 0.2495372, 0.07716376, 1, 0, 0.4980392, 1,
1.479588, -0.6369034, 1.009581, 1, 0, 0.4901961, 1,
1.482745, 0.03136981, 1.34481, 1, 0, 0.4862745, 1,
1.500492, 0.5721803, 2.149241, 1, 0, 0.4784314, 1,
1.50145, 1.873755, 0.467991, 1, 0, 0.4745098, 1,
1.51905, -1.527541, 1.010841, 1, 0, 0.4666667, 1,
1.521312, -0.784861, 3.367174, 1, 0, 0.4627451, 1,
1.524683, 0.1696622, 3.038708, 1, 0, 0.454902, 1,
1.547732, 0.1057486, 0.6060349, 1, 0, 0.4509804, 1,
1.54817, 2.023251, 1.128828, 1, 0, 0.4431373, 1,
1.548988, 1.370447, 1.675683, 1, 0, 0.4392157, 1,
1.557791, -0.7215134, 0.3222665, 1, 0, 0.4313726, 1,
1.558094, -2.620762, 2.822736, 1, 0, 0.427451, 1,
1.566257, -0.4164849, 1.388323, 1, 0, 0.4196078, 1,
1.566758, 1.215637, 2.041813, 1, 0, 0.4156863, 1,
1.567742, 0.2401879, 0.773323, 1, 0, 0.4078431, 1,
1.574434, 0.2570612, 1.430029, 1, 0, 0.4039216, 1,
1.581003, 0.3883948, 1.652533, 1, 0, 0.3960784, 1,
1.590476, 1.17365, 1.393304, 1, 0, 0.3882353, 1,
1.598852, -0.5013528, 2.261622, 1, 0, 0.3843137, 1,
1.609266, 0.09746785, 0.5492852, 1, 0, 0.3764706, 1,
1.645728, -0.3928497, 3.183943, 1, 0, 0.372549, 1,
1.646342, -0.2879429, 1.629177, 1, 0, 0.3647059, 1,
1.647892, 0.2140815, 2.123248, 1, 0, 0.3607843, 1,
1.653784, -0.1307703, 3.141534, 1, 0, 0.3529412, 1,
1.658741, 0.6082922, 2.181751, 1, 0, 0.3490196, 1,
1.670254, -0.8116539, 2.085125, 1, 0, 0.3411765, 1,
1.674443, -1.684583, 4.77187, 1, 0, 0.3372549, 1,
1.676513, 1.646267, 0.5854979, 1, 0, 0.3294118, 1,
1.685266, 0.9038571, 2.509583, 1, 0, 0.3254902, 1,
1.711055, 0.9511835, 3.55253, 1, 0, 0.3176471, 1,
1.714311, -0.3941287, -0.1293372, 1, 0, 0.3137255, 1,
1.716017, -1.084474, -0.4685218, 1, 0, 0.3058824, 1,
1.723777, -0.03087744, 1.860498, 1, 0, 0.2980392, 1,
1.723844, -0.212008, 1.303506, 1, 0, 0.2941177, 1,
1.753433, -0.07858202, 2.584585, 1, 0, 0.2862745, 1,
1.762515, -0.5261359, 1.459892, 1, 0, 0.282353, 1,
1.783409, 0.3292858, 1.939296, 1, 0, 0.2745098, 1,
1.801641, 1.087447, 1.235288, 1, 0, 0.2705882, 1,
1.82233, -0.1402532, 1.588981, 1, 0, 0.2627451, 1,
1.83297, 1.287614, 1.671461, 1, 0, 0.2588235, 1,
1.842523, -0.5011617, 2.774597, 1, 0, 0.2509804, 1,
1.846637, 0.4605856, 0.2914739, 1, 0, 0.2470588, 1,
1.875, 0.7948315, -0.4047481, 1, 0, 0.2392157, 1,
1.885415, 1.041872, -0.5217281, 1, 0, 0.2352941, 1,
1.890114, 2.463814, 0.4380077, 1, 0, 0.227451, 1,
1.890505, -1.55902, 1.783436, 1, 0, 0.2235294, 1,
1.900525, 1.656175, 1.073991, 1, 0, 0.2156863, 1,
1.905919, 1.478358, 1.432876, 1, 0, 0.2117647, 1,
1.909931, -0.04401047, 1.775415, 1, 0, 0.2039216, 1,
1.91025, -0.5680151, 0.1671481, 1, 0, 0.1960784, 1,
1.928311, 0.7467856, 0.1170865, 1, 0, 0.1921569, 1,
1.929052, -0.7816875, 2.201684, 1, 0, 0.1843137, 1,
1.934832, -0.5193989, 3.931862, 1, 0, 0.1803922, 1,
1.978992, 0.4547144, -0.02367809, 1, 0, 0.172549, 1,
1.991877, 0.1055872, 1.524408, 1, 0, 0.1686275, 1,
2.056126, -0.00352948, 1.473246, 1, 0, 0.1607843, 1,
2.083236, 1.558451, -1.473704, 1, 0, 0.1568628, 1,
2.094613, 1.350511, -1.323167, 1, 0, 0.1490196, 1,
2.119467, -0.8129843, 2.766098, 1, 0, 0.145098, 1,
2.145424, 0.3656158, 2.979186, 1, 0, 0.1372549, 1,
2.152286, -2.010287, 1.629217, 1, 0, 0.1333333, 1,
2.190084, -1.723793, 0.496791, 1, 0, 0.1254902, 1,
2.210863, 1.233155, 1.695275, 1, 0, 0.1215686, 1,
2.21732, 0.7381639, 0.1700946, 1, 0, 0.1137255, 1,
2.237886, -1.42553, 2.446456, 1, 0, 0.1098039, 1,
2.240493, -0.2123296, 1.440591, 1, 0, 0.1019608, 1,
2.253531, -0.6014233, 0.9206409, 1, 0, 0.09411765, 1,
2.268275, 0.8617625, 1.016316, 1, 0, 0.09019608, 1,
2.279398, 1.649809, 3.266768, 1, 0, 0.08235294, 1,
2.312932, -0.9599129, 1.434647, 1, 0, 0.07843138, 1,
2.384629, 0.5916051, 3.018228, 1, 0, 0.07058824, 1,
2.38787, 2.912471, 0.3245378, 1, 0, 0.06666667, 1,
2.45615, -0.7154207, 1.839507, 1, 0, 0.05882353, 1,
2.464844, 0.01903523, 1.003847, 1, 0, 0.05490196, 1,
2.467737, 1.023714, 1.246356, 1, 0, 0.04705882, 1,
2.4954, -0.9629185, 1.639397, 1, 0, 0.04313726, 1,
2.496837, -0.3340899, 3.59454, 1, 0, 0.03529412, 1,
2.500428, 0.6805921, 0.4711794, 1, 0, 0.03137255, 1,
2.515449, -1.464428, 0.8861612, 1, 0, 0.02352941, 1,
2.525516, 0.8945084, 0.1571969, 1, 0, 0.01960784, 1,
3.018929, -0.1088202, 1.213799, 1, 0, 0.01176471, 1,
3.078453, -0.7370766, 1.442801, 1, 0, 0.007843138, 1
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
-0.06895077, -4.503851, -7.303515, 0, -0.5, 0.5, 0.5,
-0.06895077, -4.503851, -7.303515, 1, -0.5, 0.5, 0.5,
-0.06895077, -4.503851, -7.303515, 1, 1.5, 0.5, 0.5,
-0.06895077, -4.503851, -7.303515, 0, 1.5, 0.5, 0.5
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
-4.283324, -0.09387493, -7.303515, 0, -0.5, 0.5, 0.5,
-4.283324, -0.09387493, -7.303515, 1, -0.5, 0.5, 0.5,
-4.283324, -0.09387493, -7.303515, 1, 1.5, 0.5, 0.5,
-4.283324, -0.09387493, -7.303515, 0, 1.5, 0.5, 0.5
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
-4.283324, -4.503851, -0.3907573, 0, -0.5, 0.5, 0.5,
-4.283324, -4.503851, -0.3907573, 1, -0.5, 0.5, 0.5,
-4.283324, -4.503851, -0.3907573, 1, 1.5, 0.5, 0.5,
-4.283324, -4.503851, -0.3907573, 0, 1.5, 0.5, 0.5
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
-3, -3.486164, -5.708263,
3, -3.486164, -5.708263,
-3, -3.486164, -5.708263,
-3, -3.655779, -5.974138,
-2, -3.486164, -5.708263,
-2, -3.655779, -5.974138,
-1, -3.486164, -5.708263,
-1, -3.655779, -5.974138,
0, -3.486164, -5.708263,
0, -3.655779, -5.974138,
1, -3.486164, -5.708263,
1, -3.655779, -5.974138,
2, -3.486164, -5.708263,
2, -3.655779, -5.974138,
3, -3.486164, -5.708263,
3, -3.655779, -5.974138
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
-3, -3.995008, -6.505889, 0, -0.5, 0.5, 0.5,
-3, -3.995008, -6.505889, 1, -0.5, 0.5, 0.5,
-3, -3.995008, -6.505889, 1, 1.5, 0.5, 0.5,
-3, -3.995008, -6.505889, 0, 1.5, 0.5, 0.5,
-2, -3.995008, -6.505889, 0, -0.5, 0.5, 0.5,
-2, -3.995008, -6.505889, 1, -0.5, 0.5, 0.5,
-2, -3.995008, -6.505889, 1, 1.5, 0.5, 0.5,
-2, -3.995008, -6.505889, 0, 1.5, 0.5, 0.5,
-1, -3.995008, -6.505889, 0, -0.5, 0.5, 0.5,
-1, -3.995008, -6.505889, 1, -0.5, 0.5, 0.5,
-1, -3.995008, -6.505889, 1, 1.5, 0.5, 0.5,
-1, -3.995008, -6.505889, 0, 1.5, 0.5, 0.5,
0, -3.995008, -6.505889, 0, -0.5, 0.5, 0.5,
0, -3.995008, -6.505889, 1, -0.5, 0.5, 0.5,
0, -3.995008, -6.505889, 1, 1.5, 0.5, 0.5,
0, -3.995008, -6.505889, 0, 1.5, 0.5, 0.5,
1, -3.995008, -6.505889, 0, -0.5, 0.5, 0.5,
1, -3.995008, -6.505889, 1, -0.5, 0.5, 0.5,
1, -3.995008, -6.505889, 1, 1.5, 0.5, 0.5,
1, -3.995008, -6.505889, 0, 1.5, 0.5, 0.5,
2, -3.995008, -6.505889, 0, -0.5, 0.5, 0.5,
2, -3.995008, -6.505889, 1, -0.5, 0.5, 0.5,
2, -3.995008, -6.505889, 1, 1.5, 0.5, 0.5,
2, -3.995008, -6.505889, 0, 1.5, 0.5, 0.5,
3, -3.995008, -6.505889, 0, -0.5, 0.5, 0.5,
3, -3.995008, -6.505889, 1, -0.5, 0.5, 0.5,
3, -3.995008, -6.505889, 1, 1.5, 0.5, 0.5,
3, -3.995008, -6.505889, 0, 1.5, 0.5, 0.5
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
-3.310776, -3, -5.708263,
-3.310776, 3, -5.708263,
-3.310776, -3, -5.708263,
-3.472868, -3, -5.974138,
-3.310776, -2, -5.708263,
-3.472868, -2, -5.974138,
-3.310776, -1, -5.708263,
-3.472868, -1, -5.974138,
-3.310776, 0, -5.708263,
-3.472868, 0, -5.974138,
-3.310776, 1, -5.708263,
-3.472868, 1, -5.974138,
-3.310776, 2, -5.708263,
-3.472868, 2, -5.974138,
-3.310776, 3, -5.708263,
-3.472868, 3, -5.974138
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
-3.79705, -3, -6.505889, 0, -0.5, 0.5, 0.5,
-3.79705, -3, -6.505889, 1, -0.5, 0.5, 0.5,
-3.79705, -3, -6.505889, 1, 1.5, 0.5, 0.5,
-3.79705, -3, -6.505889, 0, 1.5, 0.5, 0.5,
-3.79705, -2, -6.505889, 0, -0.5, 0.5, 0.5,
-3.79705, -2, -6.505889, 1, -0.5, 0.5, 0.5,
-3.79705, -2, -6.505889, 1, 1.5, 0.5, 0.5,
-3.79705, -2, -6.505889, 0, 1.5, 0.5, 0.5,
-3.79705, -1, -6.505889, 0, -0.5, 0.5, 0.5,
-3.79705, -1, -6.505889, 1, -0.5, 0.5, 0.5,
-3.79705, -1, -6.505889, 1, 1.5, 0.5, 0.5,
-3.79705, -1, -6.505889, 0, 1.5, 0.5, 0.5,
-3.79705, 0, -6.505889, 0, -0.5, 0.5, 0.5,
-3.79705, 0, -6.505889, 1, -0.5, 0.5, 0.5,
-3.79705, 0, -6.505889, 1, 1.5, 0.5, 0.5,
-3.79705, 0, -6.505889, 0, 1.5, 0.5, 0.5,
-3.79705, 1, -6.505889, 0, -0.5, 0.5, 0.5,
-3.79705, 1, -6.505889, 1, -0.5, 0.5, 0.5,
-3.79705, 1, -6.505889, 1, 1.5, 0.5, 0.5,
-3.79705, 1, -6.505889, 0, 1.5, 0.5, 0.5,
-3.79705, 2, -6.505889, 0, -0.5, 0.5, 0.5,
-3.79705, 2, -6.505889, 1, -0.5, 0.5, 0.5,
-3.79705, 2, -6.505889, 1, 1.5, 0.5, 0.5,
-3.79705, 2, -6.505889, 0, 1.5, 0.5, 0.5,
-3.79705, 3, -6.505889, 0, -0.5, 0.5, 0.5,
-3.79705, 3, -6.505889, 1, -0.5, 0.5, 0.5,
-3.79705, 3, -6.505889, 1, 1.5, 0.5, 0.5,
-3.79705, 3, -6.505889, 0, 1.5, 0.5, 0.5
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
-3.310776, -3.486164, -4,
-3.310776, -3.486164, 4,
-3.310776, -3.486164, -4,
-3.472868, -3.655779, -4,
-3.310776, -3.486164, -2,
-3.472868, -3.655779, -2,
-3.310776, -3.486164, 0,
-3.472868, -3.655779, 0,
-3.310776, -3.486164, 2,
-3.472868, -3.655779, 2,
-3.310776, -3.486164, 4,
-3.472868, -3.655779, 4
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
-3.79705, -3.995008, -4, 0, -0.5, 0.5, 0.5,
-3.79705, -3.995008, -4, 1, -0.5, 0.5, 0.5,
-3.79705, -3.995008, -4, 1, 1.5, 0.5, 0.5,
-3.79705, -3.995008, -4, 0, 1.5, 0.5, 0.5,
-3.79705, -3.995008, -2, 0, -0.5, 0.5, 0.5,
-3.79705, -3.995008, -2, 1, -0.5, 0.5, 0.5,
-3.79705, -3.995008, -2, 1, 1.5, 0.5, 0.5,
-3.79705, -3.995008, -2, 0, 1.5, 0.5, 0.5,
-3.79705, -3.995008, 0, 0, -0.5, 0.5, 0.5,
-3.79705, -3.995008, 0, 1, -0.5, 0.5, 0.5,
-3.79705, -3.995008, 0, 1, 1.5, 0.5, 0.5,
-3.79705, -3.995008, 0, 0, 1.5, 0.5, 0.5,
-3.79705, -3.995008, 2, 0, -0.5, 0.5, 0.5,
-3.79705, -3.995008, 2, 1, -0.5, 0.5, 0.5,
-3.79705, -3.995008, 2, 1, 1.5, 0.5, 0.5,
-3.79705, -3.995008, 2, 0, 1.5, 0.5, 0.5,
-3.79705, -3.995008, 4, 0, -0.5, 0.5, 0.5,
-3.79705, -3.995008, 4, 1, -0.5, 0.5, 0.5,
-3.79705, -3.995008, 4, 1, 1.5, 0.5, 0.5,
-3.79705, -3.995008, 4, 0, 1.5, 0.5, 0.5
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
-3.310776, -3.486164, -5.708263,
-3.310776, 3.298414, -5.708263,
-3.310776, -3.486164, 4.926748,
-3.310776, 3.298414, 4.926748,
-3.310776, -3.486164, -5.708263,
-3.310776, -3.486164, 4.926748,
-3.310776, 3.298414, -5.708263,
-3.310776, 3.298414, 4.926748,
-3.310776, -3.486164, -5.708263,
3.172875, -3.486164, -5.708263,
-3.310776, -3.486164, 4.926748,
3.172875, -3.486164, 4.926748,
-3.310776, 3.298414, -5.708263,
3.172875, 3.298414, -5.708263,
-3.310776, 3.298414, 4.926748,
3.172875, 3.298414, 4.926748,
3.172875, -3.486164, -5.708263,
3.172875, 3.298414, -5.708263,
3.172875, -3.486164, 4.926748,
3.172875, 3.298414, 4.926748,
3.172875, -3.486164, -5.708263,
3.172875, -3.486164, 4.926748,
3.172875, 3.298414, -5.708263,
3.172875, 3.298414, 4.926748
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
var radius = 7.573714;
var distance = 33.69631;
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
mvMatrix.translate( 0.06895077, 0.09387493, 0.3907573 );
mvMatrix.scale( 1.263, 1.20698, 0.7699896 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.69631);
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
InChI_1S_C13H9Cl2F3N<-read.table("InChI_1S_C13H9Cl2F3N.xyz")
```

```
## Error in read.table("InChI_1S_C13H9Cl2F3N.xyz"): no lines available in input
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
-3.216354, 2.159645, -0.5378488, 0, 0, 1, 1, 1,
-3.081386, 0.03834051, -0.1060563, 1, 0, 0, 1, 1,
-3.03993, 1.445291, -0.6466029, 1, 0, 0, 1, 1,
-3.027222, -0.07477197, -2.523106, 1, 0, 0, 1, 1,
-2.877835, 1.434149, -0.2568349, 1, 0, 0, 1, 1,
-2.771376, 1.124443, -0.9584192, 1, 0, 0, 1, 1,
-2.766362, 1.008042, -0.1891522, 0, 0, 0, 1, 1,
-2.636848, 0.6665905, -1.240432, 0, 0, 0, 1, 1,
-2.629261, 0.8985901, -1.664023, 0, 0, 0, 1, 1,
-2.613767, -1.39561, -0.2757302, 0, 0, 0, 1, 1,
-2.427846, 0.270806, -2.11948, 0, 0, 0, 1, 1,
-2.386362, 0.09167911, -1.281223, 0, 0, 0, 1, 1,
-2.370877, -1.299126, -1.507049, 0, 0, 0, 1, 1,
-2.330486, -0.989804, -0.4345275, 1, 1, 1, 1, 1,
-2.319361, 0.2207717, -2.474106, 1, 1, 1, 1, 1,
-2.286428, 0.5937711, -3.829885, 1, 1, 1, 1, 1,
-2.283355, -0.7802591, -1.813932, 1, 1, 1, 1, 1,
-2.245293, -0.598202, -1.342327, 1, 1, 1, 1, 1,
-2.226377, 0.8960187, 0.4218763, 1, 1, 1, 1, 1,
-2.158453, 0.3144847, -2.080333, 1, 1, 1, 1, 1,
-2.155944, 0.2183889, -1.632636, 1, 1, 1, 1, 1,
-2.145645, -1.059506, -2.376105, 1, 1, 1, 1, 1,
-2.120759, 1.208742, 0.09783934, 1, 1, 1, 1, 1,
-2.082713, -0.04430468, -2.008897, 1, 1, 1, 1, 1,
-2.065371, 0.5944062, -1.4857, 1, 1, 1, 1, 1,
-2.063055, -0.01020067, -2.450817, 1, 1, 1, 1, 1,
-2.045035, 1.021898, -1.176631, 1, 1, 1, 1, 1,
-2.033878, 0.6542311, -2.01468, 1, 1, 1, 1, 1,
-2.031878, -0.9003142, -1.059529, 0, 0, 1, 1, 1,
-2.007902, -0.1959454, -0.7325845, 1, 0, 0, 1, 1,
-1.992487, -0.8295676, -2.54673, 1, 0, 0, 1, 1,
-1.978967, -0.3823257, -0.6570098, 1, 0, 0, 1, 1,
-1.959033, 0.2298552, -1.719599, 1, 0, 0, 1, 1,
-1.925922, 1.528878, -0.3546211, 1, 0, 0, 1, 1,
-1.915149, -0.7077648, -2.82574, 0, 0, 0, 1, 1,
-1.912359, 0.9664566, -0.1376967, 0, 0, 0, 1, 1,
-1.904879, -0.7834793, 0.3962239, 0, 0, 0, 1, 1,
-1.901152, 1.212811, 1.08916, 0, 0, 0, 1, 1,
-1.897994, 1.681401, 0.2188814, 0, 0, 0, 1, 1,
-1.888723, 0.416147, -2.057263, 0, 0, 0, 1, 1,
-1.879577, 0.5559864, -0.9298636, 0, 0, 0, 1, 1,
-1.876145, -0.9122102, -1.789448, 1, 1, 1, 1, 1,
-1.835336, -0.5604729, -1.509048, 1, 1, 1, 1, 1,
-1.826691, 1.039148, -1.302693, 1, 1, 1, 1, 1,
-1.817878, 0.9457598, -0.8173503, 1, 1, 1, 1, 1,
-1.810814, -2.229741, -2.827992, 1, 1, 1, 1, 1,
-1.793824, 0.2474632, -0.7652103, 1, 1, 1, 1, 1,
-1.779689, 1.06798, -1.502744, 1, 1, 1, 1, 1,
-1.770264, 0.03770955, -1.720646, 1, 1, 1, 1, 1,
-1.742479, -1.106123, -3.083555, 1, 1, 1, 1, 1,
-1.733757, 0.791943, -1.520459, 1, 1, 1, 1, 1,
-1.73278, 0.9480259, -0.5342111, 1, 1, 1, 1, 1,
-1.729361, -0.6687598, -4.279752, 1, 1, 1, 1, 1,
-1.71112, -0.3579183, -4.999492, 1, 1, 1, 1, 1,
-1.70237, -0.6649505, -2.895272, 1, 1, 1, 1, 1,
-1.701588, -0.09482001, -1.686351, 1, 1, 1, 1, 1,
-1.693185, 0.7279682, -2.529242, 0, 0, 1, 1, 1,
-1.685187, -0.8233365, -0.8265371, 1, 0, 0, 1, 1,
-1.676615, -0.6468855, -2.069595, 1, 0, 0, 1, 1,
-1.639611, -1.807417, -2.803288, 1, 0, 0, 1, 1,
-1.63483, 0.6510929, -0.8590169, 1, 0, 0, 1, 1,
-1.627601, -0.1002944, -1.054175, 1, 0, 0, 1, 1,
-1.627343, 0.06266695, -0.804817, 0, 0, 0, 1, 1,
-1.624405, 0.02953718, -2.139989, 0, 0, 0, 1, 1,
-1.622382, 1.838551, -1.042867, 0, 0, 0, 1, 1,
-1.612931, 1.688741, -0.3361504, 0, 0, 0, 1, 1,
-1.607798, -1.952582, -4.125252, 0, 0, 0, 1, 1,
-1.584913, -1.418531, -3.171602, 0, 0, 0, 1, 1,
-1.583505, 0.463404, -2.545751, 0, 0, 0, 1, 1,
-1.578716, -1.433132, -0.7664288, 1, 1, 1, 1, 1,
-1.555985, -0.1031977, -0.3963369, 1, 1, 1, 1, 1,
-1.546855, -0.2826495, -2.382227, 1, 1, 1, 1, 1,
-1.541325, -0.3037927, -1.439547, 1, 1, 1, 1, 1,
-1.532553, 0.626197, -0.7590635, 1, 1, 1, 1, 1,
-1.529677, 0.06860179, -4.062814, 1, 1, 1, 1, 1,
-1.52812, -0.3930982, -2.116771, 1, 1, 1, 1, 1,
-1.511124, 0.2264368, -2.02366, 1, 1, 1, 1, 1,
-1.510589, -0.4810717, -1.396518, 1, 1, 1, 1, 1,
-1.507644, -0.3220893, -3.28073, 1, 1, 1, 1, 1,
-1.505082, -1.143277, -2.69489, 1, 1, 1, 1, 1,
-1.498911, -0.5319873, -1.150399, 1, 1, 1, 1, 1,
-1.487547, 1.356549, 0.3753989, 1, 1, 1, 1, 1,
-1.485797, 0.8198623, -1.361745, 1, 1, 1, 1, 1,
-1.481607, -1.561033, -3.78914, 1, 1, 1, 1, 1,
-1.467417, -0.3168822, -0.3095897, 0, 0, 1, 1, 1,
-1.442256, 0.2022814, -2.030786, 1, 0, 0, 1, 1,
-1.435292, 0.2718476, -1.582887, 1, 0, 0, 1, 1,
-1.431551, 1.819407, 0.06062478, 1, 0, 0, 1, 1,
-1.422957, -0.2450296, -3.287748, 1, 0, 0, 1, 1,
-1.419827, -0.1526234, -0.8085179, 1, 0, 0, 1, 1,
-1.410767, 0.7329562, 0.4004406, 0, 0, 0, 1, 1,
-1.40624, -0.3826661, -1.559768, 0, 0, 0, 1, 1,
-1.401977, -1.963886, -1.775658, 0, 0, 0, 1, 1,
-1.385468, -1.039675, -0.971566, 0, 0, 0, 1, 1,
-1.380761, -1.179221, -1.982729, 0, 0, 0, 1, 1,
-1.379183, 1.028234, 0.2602737, 0, 0, 0, 1, 1,
-1.375993, -0.5506756, -3.366345, 0, 0, 0, 1, 1,
-1.372611, -0.2796678, -0.6808509, 1, 1, 1, 1, 1,
-1.369485, 0.06057991, -2.322657, 1, 1, 1, 1, 1,
-1.36674, 0.1585125, -0.3791364, 1, 1, 1, 1, 1,
-1.342457, 0.7292596, -2.537181, 1, 1, 1, 1, 1,
-1.332484, -1.110458, -3.688796, 1, 1, 1, 1, 1,
-1.325412, 0.2777689, -0.9038861, 1, 1, 1, 1, 1,
-1.319614, 0.9051134, -2.153221, 1, 1, 1, 1, 1,
-1.319381, 0.2609138, -3.278359, 1, 1, 1, 1, 1,
-1.31774, -1.402347, -2.312451, 1, 1, 1, 1, 1,
-1.313363, -2.189067, -2.558573, 1, 1, 1, 1, 1,
-1.308243, -0.890235, -2.639783, 1, 1, 1, 1, 1,
-1.298655, 0.8035954, -0.2373967, 1, 1, 1, 1, 1,
-1.282845, -0.2567537, -1.067415, 1, 1, 1, 1, 1,
-1.28109, 0.1223177, -1.174061, 1, 1, 1, 1, 1,
-1.278105, -1.008449, -2.784192, 1, 1, 1, 1, 1,
-1.269999, -1.388255, -1.902853, 0, 0, 1, 1, 1,
-1.254678, 0.641388, 0.5120201, 1, 0, 0, 1, 1,
-1.251782, -1.158608, -1.308755, 1, 0, 0, 1, 1,
-1.249802, 1.100502, -1.754972, 1, 0, 0, 1, 1,
-1.245479, -1.275853, -2.875674, 1, 0, 0, 1, 1,
-1.243982, -0.327511, -0.08096813, 1, 0, 0, 1, 1,
-1.242946, -0.05007777, -1.540719, 0, 0, 0, 1, 1,
-1.240022, -0.7470284, -2.257088, 0, 0, 0, 1, 1,
-1.23244, 1.294223, 0.5546408, 0, 0, 0, 1, 1,
-1.230602, -0.3041837, -2.059477, 0, 0, 0, 1, 1,
-1.226317, 0.8722299, -0.8436943, 0, 0, 0, 1, 1,
-1.225021, 0.6013039, -1.981666, 0, 0, 0, 1, 1,
-1.225002, -0.2113232, -3.123736, 0, 0, 0, 1, 1,
-1.217565, 1.481991, -1.935341, 1, 1, 1, 1, 1,
-1.214854, -0.8352887, -0.3244607, 1, 1, 1, 1, 1,
-1.20952, 0.5604852, -0.8375126, 1, 1, 1, 1, 1,
-1.208809, -1.252663, -2.462927, 1, 1, 1, 1, 1,
-1.198207, 1.918757, -2.082255, 1, 1, 1, 1, 1,
-1.174986, 2.270819, -1.144122, 1, 1, 1, 1, 1,
-1.174664, -0.5230849, -1.865091, 1, 1, 1, 1, 1,
-1.174259, 1.449165, -0.2423614, 1, 1, 1, 1, 1,
-1.173087, -0.9326507, -2.957311, 1, 1, 1, 1, 1,
-1.168206, -0.5902108, -1.716726, 1, 1, 1, 1, 1,
-1.165198, 0.1580704, 0.7492245, 1, 1, 1, 1, 1,
-1.154458, -0.9146389, -0.6052728, 1, 1, 1, 1, 1,
-1.153925, 0.5357531, -0.6923882, 1, 1, 1, 1, 1,
-1.149322, -0.8671584, -0.2717868, 1, 1, 1, 1, 1,
-1.144032, -0.7412891, -3.299742, 1, 1, 1, 1, 1,
-1.140291, 0.0621859, 0.1814297, 0, 0, 1, 1, 1,
-1.13987, -0.6501344, -0.7927369, 1, 0, 0, 1, 1,
-1.135827, -0.2035294, -3.413312, 1, 0, 0, 1, 1,
-1.135278, -1.360385, -2.492071, 1, 0, 0, 1, 1,
-1.133297, -1.893692, -2.94853, 1, 0, 0, 1, 1,
-1.125459, -1.00151, -2.677683, 1, 0, 0, 1, 1,
-1.124761, 1.649186, -0.8958017, 0, 0, 0, 1, 1,
-1.120115, 0.08490057, -2.506694, 0, 0, 0, 1, 1,
-1.120031, -1.629325, -3.181624, 0, 0, 0, 1, 1,
-1.119282, 1.199338, -0.834008, 0, 0, 0, 1, 1,
-1.113631, -0.3415643, -3.239583, 0, 0, 0, 1, 1,
-1.113345, -0.3921233, -1.536173, 0, 0, 0, 1, 1,
-1.104334, 0.2535804, -0.6730576, 0, 0, 0, 1, 1,
-1.102555, 2.787205, -2.553324, 1, 1, 1, 1, 1,
-1.100001, -1.963826, -2.880175, 1, 1, 1, 1, 1,
-1.08891, -1.216656, -0.8808877, 1, 1, 1, 1, 1,
-1.088882, 2.503207, 1.352515, 1, 1, 1, 1, 1,
-1.069633, 0.226056, -0.772774, 1, 1, 1, 1, 1,
-1.065336, 0.4268257, -0.9572393, 1, 1, 1, 1, 1,
-1.059908, 0.5411082, -1.942878, 1, 1, 1, 1, 1,
-1.057899, -0.4218174, -1.759848, 1, 1, 1, 1, 1,
-1.055158, -0.06469478, -2.345104, 1, 1, 1, 1, 1,
-1.053286, 0.9323522, -0.7440797, 1, 1, 1, 1, 1,
-1.051606, -0.4901055, -1.275124, 1, 1, 1, 1, 1,
-1.043697, 0.4911838, 0.5111946, 1, 1, 1, 1, 1,
-1.04219, 1.718359, 0.4628809, 1, 1, 1, 1, 1,
-1.036178, 0.1446159, -1.743619, 1, 1, 1, 1, 1,
-1.009492, -0.2848375, -1.82228, 1, 1, 1, 1, 1,
-1.002539, 0.09902821, -0.7099944, 0, 0, 1, 1, 1,
-0.9897645, 0.2607791, 0.4394117, 1, 0, 0, 1, 1,
-0.9818193, 0.6942393, -0.8417153, 1, 0, 0, 1, 1,
-0.9807913, 1.258533, -0.9281558, 1, 0, 0, 1, 1,
-0.9794679, -0.1958252, -1.887005, 1, 0, 0, 1, 1,
-0.9788381, -1.060506, -2.572778, 1, 0, 0, 1, 1,
-0.9768007, 0.6465502, -2.281799, 0, 0, 0, 1, 1,
-0.9651546, -0.943973, -4.557909, 0, 0, 0, 1, 1,
-0.9646346, 0.4078356, -1.199181, 0, 0, 0, 1, 1,
-0.9551085, -1.806975, -2.223939, 0, 0, 0, 1, 1,
-0.9544667, 1.901183, 1.035827, 0, 0, 0, 1, 1,
-0.9429043, -1.624077, -2.522023, 0, 0, 0, 1, 1,
-0.9397754, 0.07832949, -3.124349, 0, 0, 0, 1, 1,
-0.9351524, -1.781432, -3.981183, 1, 1, 1, 1, 1,
-0.9319685, -2.090833, -3.725078, 1, 1, 1, 1, 1,
-0.9294436, 1.92123, -0.5370315, 1, 1, 1, 1, 1,
-0.9252765, -0.562212, -4.010532, 1, 1, 1, 1, 1,
-0.9233897, 1.035233, -2.058348, 1, 1, 1, 1, 1,
-0.923368, 0.5317537, 0.9818749, 1, 1, 1, 1, 1,
-0.9223766, -1.794628, -3.162398, 1, 1, 1, 1, 1,
-0.9162237, 0.2615781, -2.615677, 1, 1, 1, 1, 1,
-0.9140905, 0.276531, -0.3829454, 1, 1, 1, 1, 1,
-0.9129289, -2.462661, -3.622922, 1, 1, 1, 1, 1,
-0.9129079, -0.6843442, -0.8470202, 1, 1, 1, 1, 1,
-0.9113557, 1.014768, 1.515319, 1, 1, 1, 1, 1,
-0.896897, -0.9503102, -1.99567, 1, 1, 1, 1, 1,
-0.8942114, 0.5215153, -0.9214462, 1, 1, 1, 1, 1,
-0.8844429, -0.02599313, -1.909404, 1, 1, 1, 1, 1,
-0.8816206, 0.09238485, -1.612158, 0, 0, 1, 1, 1,
-0.8764199, -0.9933957, -1.935599, 1, 0, 0, 1, 1,
-0.8756742, -1.123125, -1.897763, 1, 0, 0, 1, 1,
-0.8744199, 1.410874, -0.3345006, 1, 0, 0, 1, 1,
-0.8627915, 0.9497166, -1.670775, 1, 0, 0, 1, 1,
-0.8617418, -0.6714249, -2.378736, 1, 0, 0, 1, 1,
-0.8525376, -1.632118, -1.891381, 0, 0, 0, 1, 1,
-0.8493552, -0.6096942, -1.321774, 0, 0, 0, 1, 1,
-0.8445789, 0.6190767, -1.294097, 0, 0, 0, 1, 1,
-0.8436711, -0.2686591, -0.414689, 0, 0, 0, 1, 1,
-0.841368, -0.425508, -0.124595, 0, 0, 0, 1, 1,
-0.8401884, 0.8491554, -2.264331, 0, 0, 0, 1, 1,
-0.8379489, 0.6214564, -3.274109, 0, 0, 0, 1, 1,
-0.8376314, -0.2324456, -1.271047, 1, 1, 1, 1, 1,
-0.8371903, -2.150763, -4.380777, 1, 1, 1, 1, 1,
-0.8358607, -0.5055982, -3.022122, 1, 1, 1, 1, 1,
-0.8334088, -1.657218, -3.716261, 1, 1, 1, 1, 1,
-0.8312053, -0.8614699, -2.216428, 1, 1, 1, 1, 1,
-0.8300957, 0.2626485, -0.4299796, 1, 1, 1, 1, 1,
-0.8285502, 0.6797323, -0.9415729, 1, 1, 1, 1, 1,
-0.8282393, -0.8357766, -2.453277, 1, 1, 1, 1, 1,
-0.8275717, -0.167691, -0.5469647, 1, 1, 1, 1, 1,
-0.8272992, -1.999006, -3.949864, 1, 1, 1, 1, 1,
-0.8216274, 1.198263, -0.2963564, 1, 1, 1, 1, 1,
-0.8216267, -0.1751305, -2.142692, 1, 1, 1, 1, 1,
-0.8212752, -0.3279867, -2.602435, 1, 1, 1, 1, 1,
-0.8210668, -0.08701488, -1.13516, 1, 1, 1, 1, 1,
-0.8202847, -0.5133008, -0.8013401, 1, 1, 1, 1, 1,
-0.8174244, -1.158584, -3.313, 0, 0, 1, 1, 1,
-0.8125392, -0.2851022, -0.6167184, 1, 0, 0, 1, 1,
-0.8051968, -0.1860807, 1.316921, 1, 0, 0, 1, 1,
-0.7965797, -0.3925942, -2.391439, 1, 0, 0, 1, 1,
-0.795581, 1.610384, 0.6908794, 1, 0, 0, 1, 1,
-0.7943619, -0.4562052, -1.967834, 1, 0, 0, 1, 1,
-0.7817945, 0.9465066, -0.2599947, 0, 0, 0, 1, 1,
-0.7813266, -0.7623634, -1.292306, 0, 0, 0, 1, 1,
-0.7812001, 1.538384, 0.5894992, 0, 0, 0, 1, 1,
-0.780745, -0.5182554, -2.053174, 0, 0, 0, 1, 1,
-0.7769092, -0.3241128, -1.420516, 0, 0, 0, 1, 1,
-0.7755463, -0.88236, -1.967005, 0, 0, 0, 1, 1,
-0.7717328, -1.208035, -4.257213, 0, 0, 0, 1, 1,
-0.7649346, 0.8814648, -1.612561, 1, 1, 1, 1, 1,
-0.7583198, -1.205287, 0.1137927, 1, 1, 1, 1, 1,
-0.7554153, 0.08021236, -1.605111, 1, 1, 1, 1, 1,
-0.7553066, -1.00104, -0.6304784, 1, 1, 1, 1, 1,
-0.7467414, 0.7719057, -0.9782074, 1, 1, 1, 1, 1,
-0.7452927, -1.031518, -1.176777, 1, 1, 1, 1, 1,
-0.7437114, -0.3516327, -1.688429, 1, 1, 1, 1, 1,
-0.7420406, -0.491784, -0.960342, 1, 1, 1, 1, 1,
-0.7402139, -0.02782412, -0.684747, 1, 1, 1, 1, 1,
-0.7264699, 0.9273596, -1.080871, 1, 1, 1, 1, 1,
-0.723658, -0.1295068, -2.319134, 1, 1, 1, 1, 1,
-0.7195541, 0.8126302, 0.1524856, 1, 1, 1, 1, 1,
-0.7180111, -0.9092633, -1.308852, 1, 1, 1, 1, 1,
-0.7170283, -1.59798, -1.929004, 1, 1, 1, 1, 1,
-0.7156584, -0.8148956, -3.550008, 1, 1, 1, 1, 1,
-0.7070706, -1.946943, -1.995995, 0, 0, 1, 1, 1,
-0.6981147, -0.2017119, -1.134154, 1, 0, 0, 1, 1,
-0.6973991, 0.527998, -0.6535024, 1, 0, 0, 1, 1,
-0.6925193, 0.6261545, -0.4372696, 1, 0, 0, 1, 1,
-0.6890842, 0.9330394, -1.273127, 1, 0, 0, 1, 1,
-0.6863116, -0.6297704, -3.455482, 1, 0, 0, 1, 1,
-0.6841235, 1.345348, -0.8979526, 0, 0, 0, 1, 1,
-0.6805902, -0.0005735187, -2.406236, 0, 0, 0, 1, 1,
-0.6775616, -1.920411, -1.67301, 0, 0, 0, 1, 1,
-0.6775386, -0.12322, -2.020024, 0, 0, 0, 1, 1,
-0.6745372, -1.07857, -2.022692, 0, 0, 0, 1, 1,
-0.6728435, -1.756745, -2.739886, 0, 0, 0, 1, 1,
-0.6718615, -1.383629, -1.991415, 0, 0, 0, 1, 1,
-0.6674082, -3.38736, -2.857006, 1, 1, 1, 1, 1,
-0.6663705, 0.8154453, -0.2590162, 1, 1, 1, 1, 1,
-0.6622333, -0.5376, -3.137154, 1, 1, 1, 1, 1,
-0.6620448, 0.3673938, -0.1217944, 1, 1, 1, 1, 1,
-0.6531717, 0.1721772, -0.9126834, 1, 1, 1, 1, 1,
-0.6418711, -0.6703077, -0.9730029, 1, 1, 1, 1, 1,
-0.6389861, -0.5757099, -2.086785, 1, 1, 1, 1, 1,
-0.6378673, -0.1220465, 0.09453849, 1, 1, 1, 1, 1,
-0.637553, 2.875827, -0.574284, 1, 1, 1, 1, 1,
-0.637121, -2.26725, -3.646147, 1, 1, 1, 1, 1,
-0.6338766, 0.8983535, 0.5797958, 1, 1, 1, 1, 1,
-0.6319224, 0.7869431, -1.011887, 1, 1, 1, 1, 1,
-0.6307914, 0.672482, -2.062892, 1, 1, 1, 1, 1,
-0.6296586, -1.658109, -2.195591, 1, 1, 1, 1, 1,
-0.6243715, 0.965651, -1.595448, 1, 1, 1, 1, 1,
-0.6164863, -1.233042, -2.542956, 0, 0, 1, 1, 1,
-0.6099806, 0.7348578, -0.5530797, 1, 0, 0, 1, 1,
-0.6069207, 0.2692234, -1.578617, 1, 0, 0, 1, 1,
-0.6054648, -0.1324377, -2.050104, 1, 0, 0, 1, 1,
-0.6050923, -0.04998404, -1.094235, 1, 0, 0, 1, 1,
-0.6047007, 1.007249, -1.891471, 1, 0, 0, 1, 1,
-0.6035671, -0.2491842, -2.495744, 0, 0, 0, 1, 1,
-0.6020774, -1.531414, -3.103855, 0, 0, 0, 1, 1,
-0.5925516, 0.578039, 0.07337295, 0, 0, 0, 1, 1,
-0.5906337, -0.5130618, -2.332516, 0, 0, 0, 1, 1,
-0.5893087, 0.3761167, -0.3303488, 0, 0, 0, 1, 1,
-0.5856795, 0.3181072, -0.6702018, 0, 0, 0, 1, 1,
-0.5800571, -0.6414614, -2.509628, 0, 0, 0, 1, 1,
-0.5793776, -0.5117667, -2.980622, 1, 1, 1, 1, 1,
-0.5782688, 0.292722, 0.04866376, 1, 1, 1, 1, 1,
-0.5778876, -0.7232336, -5.553384, 1, 1, 1, 1, 1,
-0.5690875, -0.8237411, -0.8605447, 1, 1, 1, 1, 1,
-0.5676253, 1.36324, -0.9806939, 1, 1, 1, 1, 1,
-0.5672869, 0.600607, -0.3369188, 1, 1, 1, 1, 1,
-0.5655555, 0.1101874, -0.4985687, 1, 1, 1, 1, 1,
-0.5573726, -1.526758, -3.154397, 1, 1, 1, 1, 1,
-0.5566665, -0.7225433, -3.527544, 1, 1, 1, 1, 1,
-0.5551509, -1.396873, 0.09365388, 1, 1, 1, 1, 1,
-0.5547377, -0.8670534, -2.021127, 1, 1, 1, 1, 1,
-0.5502729, -0.02583129, -3.968152, 1, 1, 1, 1, 1,
-0.5482159, 0.08945091, -1.155538, 1, 1, 1, 1, 1,
-0.5440224, 0.627569, -0.1781442, 1, 1, 1, 1, 1,
-0.5409744, -1.241192, -3.90335, 1, 1, 1, 1, 1,
-0.5402871, 0.5402554, -0.7050634, 0, 0, 1, 1, 1,
-0.5363359, -1.377272, -2.565547, 1, 0, 0, 1, 1,
-0.5320032, -0.651132, -3.565926, 1, 0, 0, 1, 1,
-0.5305929, 0.9815933, 0.1958829, 1, 0, 0, 1, 1,
-0.5173535, 1.053375, -0.2968352, 1, 0, 0, 1, 1,
-0.5159593, -1.31962, -2.43742, 1, 0, 0, 1, 1,
-0.5123585, -0.8857934, -1.817692, 0, 0, 0, 1, 1,
-0.5106564, -0.9700252, -3.079388, 0, 0, 0, 1, 1,
-0.5091594, -0.03978334, -1.892814, 0, 0, 0, 1, 1,
-0.5077515, -0.1801969, -2.59551, 0, 0, 0, 1, 1,
-0.5034143, 0.8634159, 0.4008628, 0, 0, 0, 1, 1,
-0.5011667, 1.528112, -0.1622646, 0, 0, 0, 1, 1,
-0.5010432, -0.5544443, -3.826173, 0, 0, 0, 1, 1,
-0.4980844, -0.08613613, -3.404905, 1, 1, 1, 1, 1,
-0.497579, -0.7737842, -2.252434, 1, 1, 1, 1, 1,
-0.4969413, 0.1513051, -2.768141, 1, 1, 1, 1, 1,
-0.4961852, 1.009658, -0.561244, 1, 1, 1, 1, 1,
-0.4956312, 2.318702, 0.1976295, 1, 1, 1, 1, 1,
-0.4902653, 1.138701, -0.2546865, 1, 1, 1, 1, 1,
-0.4853202, -0.7310368, -1.461646, 1, 1, 1, 1, 1,
-0.4845022, -0.8232481, -4.927783, 1, 1, 1, 1, 1,
-0.4825482, 2.011618, -0.06836801, 1, 1, 1, 1, 1,
-0.4811482, -0.01269062, -0.9957644, 1, 1, 1, 1, 1,
-0.4680938, 0.3081498, -1.500256, 1, 1, 1, 1, 1,
-0.4679233, -0.6690805, -3.09226, 1, 1, 1, 1, 1,
-0.4632083, -0.8764538, -2.088134, 1, 1, 1, 1, 1,
-0.4617558, -0.6788101, -2.515389, 1, 1, 1, 1, 1,
-0.4616251, 1.449577, 0.5607722, 1, 1, 1, 1, 1,
-0.4512363, 0.9036332, -0.1040283, 0, 0, 1, 1, 1,
-0.4505348, 0.7484066, 0.2132009, 1, 0, 0, 1, 1,
-0.448519, -2.500312, -3.514009, 1, 0, 0, 1, 1,
-0.4464748, 0.0151568, -1.418215, 1, 0, 0, 1, 1,
-0.4410242, 0.270686, -2.700327, 1, 0, 0, 1, 1,
-0.4355552, -0.3554304, -2.056966, 1, 0, 0, 1, 1,
-0.4337615, 1.264992, 0.39352, 0, 0, 0, 1, 1,
-0.4323825, -0.4435004, -2.696294, 0, 0, 0, 1, 1,
-0.4283588, 1.238227, -1.365965, 0, 0, 0, 1, 1,
-0.426786, 0.05376635, -4.173083, 0, 0, 0, 1, 1,
-0.424621, 0.7400182, -0.8339548, 0, 0, 0, 1, 1,
-0.4214188, -0.4998372, -2.519121, 0, 0, 0, 1, 1,
-0.4203987, -1.976142, -2.574616, 0, 0, 0, 1, 1,
-0.4200055, -0.1622151, -1.338433, 1, 1, 1, 1, 1,
-0.4146862, 0.3179021, -0.03467762, 1, 1, 1, 1, 1,
-0.4100086, 0.1444152, -1.693969, 1, 1, 1, 1, 1,
-0.4059235, 0.6807042, -1.176557, 1, 1, 1, 1, 1,
-0.4049219, -0.6229953, -3.694849, 1, 1, 1, 1, 1,
-0.4036255, -0.3765603, -2.407654, 1, 1, 1, 1, 1,
-0.4016542, -1.325896, -3.189826, 1, 1, 1, 1, 1,
-0.3938074, 1.454829, -0.5070059, 1, 1, 1, 1, 1,
-0.3936091, -1.118179, -2.145609, 1, 1, 1, 1, 1,
-0.3933137, -0.4807248, -2.866603, 1, 1, 1, 1, 1,
-0.3921035, -0.4640053, -2.427626, 1, 1, 1, 1, 1,
-0.3906379, -0.7192479, -3.596387, 1, 1, 1, 1, 1,
-0.3865234, 0.4551718, 0.3717584, 1, 1, 1, 1, 1,
-0.3826984, 0.0005875099, -0.6717535, 1, 1, 1, 1, 1,
-0.3789414, 2.50024, -1.187914, 1, 1, 1, 1, 1,
-0.3743263, -1.59167, -3.205839, 0, 0, 1, 1, 1,
-0.373061, -0.1350752, -3.724545, 1, 0, 0, 1, 1,
-0.37133, 0.4076607, -1.103896, 1, 0, 0, 1, 1,
-0.3663563, -0.4789775, -3.132717, 1, 0, 0, 1, 1,
-0.3641945, 1.753158, -0.1948708, 1, 0, 0, 1, 1,
-0.3603304, -0.5023019, -2.962024, 1, 0, 0, 1, 1,
-0.3525715, 1.336025, 0.6527703, 0, 0, 0, 1, 1,
-0.3481828, 1.229597, 0.1269621, 0, 0, 0, 1, 1,
-0.3442928, 2.426575, 0.8409253, 0, 0, 0, 1, 1,
-0.3379004, -0.8155954, -3.977787, 0, 0, 0, 1, 1,
-0.3376162, -1.134648, -2.563973, 0, 0, 0, 1, 1,
-0.3361752, 0.3711415, -1.950806, 0, 0, 0, 1, 1,
-0.3330132, 1.027325, -0.47596, 0, 0, 0, 1, 1,
-0.3313429, -1.761835, -2.591465, 1, 1, 1, 1, 1,
-0.3305095, -0.5478364, -2.57596, 1, 1, 1, 1, 1,
-0.3283814, 2.180278, -1.459353, 1, 1, 1, 1, 1,
-0.3262267, -2.107314, -3.995527, 1, 1, 1, 1, 1,
-0.3219244, -0.617256, -3.375814, 1, 1, 1, 1, 1,
-0.3202862, 0.1747458, -1.790377, 1, 1, 1, 1, 1,
-0.3169818, -2.228716, -3.84565, 1, 1, 1, 1, 1,
-0.3139472, -0.9519421, -2.699466, 1, 1, 1, 1, 1,
-0.2994164, 1.038893, -0.2939525, 1, 1, 1, 1, 1,
-0.2966196, 2.105869, -0.7041429, 1, 1, 1, 1, 1,
-0.2922753, -0.1288029, -0.3673039, 1, 1, 1, 1, 1,
-0.2909592, -0.2651706, -1.532999, 1, 1, 1, 1, 1,
-0.2891489, 0.312118, -1.44907, 1, 1, 1, 1, 1,
-0.2844275, -0.3552454, -3.156484, 1, 1, 1, 1, 1,
-0.2830222, -0.200553, -1.844426, 1, 1, 1, 1, 1,
-0.2769119, -0.6181687, -1.995109, 0, 0, 1, 1, 1,
-0.276482, 0.3696078, -0.9197975, 1, 0, 0, 1, 1,
-0.2745389, 1.043913, -2.758044, 1, 0, 0, 1, 1,
-0.272586, -0.3354062, -1.026063, 1, 0, 0, 1, 1,
-0.2679432, 1.069719, -0.699728, 1, 0, 0, 1, 1,
-0.2628868, 1.289273, 1.497154, 1, 0, 0, 1, 1,
-0.2623216, 0.3673979, -0.6027592, 0, 0, 0, 1, 1,
-0.2597726, 1.18211, -1.137267, 0, 0, 0, 1, 1,
-0.259048, 1.377427, -0.1662219, 0, 0, 0, 1, 1,
-0.2579215, 0.1726794, -1.512814, 0, 0, 0, 1, 1,
-0.2567525, 0.9532922, 0.1603995, 0, 0, 0, 1, 1,
-0.256382, -0.6221902, -3.713101, 0, 0, 0, 1, 1,
-0.250671, -0.04849209, -2.290365, 0, 0, 0, 1, 1,
-0.2493558, 1.790621, 0.06768906, 1, 1, 1, 1, 1,
-0.2478938, -1.046398, -2.699008, 1, 1, 1, 1, 1,
-0.2457032, 1.388583, -1.097723, 1, 1, 1, 1, 1,
-0.2418518, -0.3449111, -2.281997, 1, 1, 1, 1, 1,
-0.2410831, 0.1497575, -0.2996852, 1, 1, 1, 1, 1,
-0.2396718, 0.8192008, 0.8371987, 1, 1, 1, 1, 1,
-0.2391566, -1.323296, -2.369267, 1, 1, 1, 1, 1,
-0.2380593, -0.7237492, -1.371146, 1, 1, 1, 1, 1,
-0.2375674, 0.6198975, -1.263499, 1, 1, 1, 1, 1,
-0.2358966, 1.147932, -1.113557, 1, 1, 1, 1, 1,
-0.2346599, -0.4798546, -3.935573, 1, 1, 1, 1, 1,
-0.2328824, -0.2928696, -2.891826, 1, 1, 1, 1, 1,
-0.2262212, 0.04428235, -1.971523, 1, 1, 1, 1, 1,
-0.2238968, 1.436288, -0.4282203, 1, 1, 1, 1, 1,
-0.2231551, 0.3759313, 0.0367852, 1, 1, 1, 1, 1,
-0.2227175, 0.7939798, -2.525661, 0, 0, 1, 1, 1,
-0.2158951, 2.100909, 0.5682249, 1, 0, 0, 1, 1,
-0.2116795, -0.6511967, -2.176211, 1, 0, 0, 1, 1,
-0.2062583, 0.05790921, -0.8736095, 1, 0, 0, 1, 1,
-0.2058642, 0.7377459, 0.8321573, 1, 0, 0, 1, 1,
-0.205366, -0.3511178, -3.283422, 1, 0, 0, 1, 1,
-0.2034286, -0.5000497, -3.607463, 0, 0, 0, 1, 1,
-0.2033175, -1.794224, -1.422723, 0, 0, 0, 1, 1,
-0.2031894, -0.9565966, -3.507741, 0, 0, 0, 1, 1,
-0.1995704, 1.186255, 0.3229026, 0, 0, 0, 1, 1,
-0.1994102, -0.1530748, -4.455753, 0, 0, 0, 1, 1,
-0.1982042, 0.3483846, -1.307622, 0, 0, 0, 1, 1,
-0.1896843, -1.249663, -1.292043, 0, 0, 0, 1, 1,
-0.1868745, -0.1396365, -3.63613, 1, 1, 1, 1, 1,
-0.1844119, 1.829973, 0.07082643, 1, 1, 1, 1, 1,
-0.1787417, -1.416045, -3.021518, 1, 1, 1, 1, 1,
-0.1786037, 0.2296048, -0.8470395, 1, 1, 1, 1, 1,
-0.1785353, 1.859982, -1.396003, 1, 1, 1, 1, 1,
-0.1784927, 0.441161, 1.307267, 1, 1, 1, 1, 1,
-0.1780109, 0.1854957, -0.1212083, 1, 1, 1, 1, 1,
-0.1683134, -0.5828982, -0.7079682, 1, 1, 1, 1, 1,
-0.1673002, 0.7256029, -1.097372, 1, 1, 1, 1, 1,
-0.1621005, -0.3664322, -2.568149, 1, 1, 1, 1, 1,
-0.1549423, 1.204, 0.9666234, 1, 1, 1, 1, 1,
-0.151366, -0.4243356, -2.630995, 1, 1, 1, 1, 1,
-0.1421602, -0.5538628, -3.948639, 1, 1, 1, 1, 1,
-0.1374176, 0.7516857, -0.9484244, 1, 1, 1, 1, 1,
-0.1342762, 1.167926, -0.3194501, 1, 1, 1, 1, 1,
-0.1285878, 1.074844, 0.426489, 0, 0, 1, 1, 1,
-0.1277803, -0.631819, -2.1991, 1, 0, 0, 1, 1,
-0.1269926, -0.7093385, -0.9967886, 1, 0, 0, 1, 1,
-0.1262797, 0.8065497, -0.3166507, 1, 0, 0, 1, 1,
-0.1176517, 1.584068, -0.2455893, 1, 0, 0, 1, 1,
-0.1161453, -1.111593, -3.399642, 1, 0, 0, 1, 1,
-0.1078071, -1.938653, -2.166941, 0, 0, 0, 1, 1,
-0.1069035, 1.180934, -0.08325717, 0, 0, 0, 1, 1,
-0.106407, -1.31681, -3.070873, 0, 0, 0, 1, 1,
-0.1062365, -0.491324, -4.544018, 0, 0, 0, 1, 1,
-0.0991336, -0.4538146, -2.508563, 0, 0, 0, 1, 1,
-0.09813523, -0.06593685, -0.4890412, 0, 0, 0, 1, 1,
-0.09221436, 0.06592613, -2.502177, 0, 0, 0, 1, 1,
-0.08976004, 1.324097, -0.004611532, 1, 1, 1, 1, 1,
-0.08932135, 0.07289783, -1.911554, 1, 1, 1, 1, 1,
-0.08894356, -0.3720371, -3.278062, 1, 1, 1, 1, 1,
-0.08701693, 0.3608735, 0.3547186, 1, 1, 1, 1, 1,
-0.08563375, 0.4207643, -0.02809097, 1, 1, 1, 1, 1,
-0.0843894, 2.454983, -0.582244, 1, 1, 1, 1, 1,
-0.07800155, 1.486869, 1.023482, 1, 1, 1, 1, 1,
-0.07719584, -1.951923, -3.510507, 1, 1, 1, 1, 1,
-0.0766037, 0.2051314, -0.2761824, 1, 1, 1, 1, 1,
-0.07566465, -0.08421878, -0.8071222, 1, 1, 1, 1, 1,
-0.0753297, -0.2945545, -3.803057, 1, 1, 1, 1, 1,
-0.0751426, 0.113077, -1.343639, 1, 1, 1, 1, 1,
-0.07134103, 0.6008791, -0.8239812, 1, 1, 1, 1, 1,
-0.07110754, -1.702133, -4.217106, 1, 1, 1, 1, 1,
-0.07017087, 0.389738, 1.027503, 1, 1, 1, 1, 1,
-0.0686513, -1.564271, -3.66119, 0, 0, 1, 1, 1,
-0.05929418, 0.05023422, 0.1953136, 1, 0, 0, 1, 1,
-0.05680607, -0.4430172, -3.088244, 1, 0, 0, 1, 1,
-0.05167945, 0.5680588, 0.1694013, 1, 0, 0, 1, 1,
-0.05065913, -1.993528, -4.050605, 1, 0, 0, 1, 1,
-0.0471029, 0.2815325, -0.9227327, 1, 0, 0, 1, 1,
-0.0458886, -1.480048, -3.900311, 0, 0, 0, 1, 1,
-0.04562238, -2.351337, -3.379035, 0, 0, 0, 1, 1,
-0.03913873, 1.07625, -0.2483835, 0, 0, 0, 1, 1,
-0.03906699, 1.744079, -0.7405365, 0, 0, 0, 1, 1,
-0.03620952, -0.7682086, -4.462089, 0, 0, 0, 1, 1,
-0.03564106, 0.01482596, 0.01841698, 0, 0, 0, 1, 1,
-0.03071571, 1.105109, -1.032681, 0, 0, 0, 1, 1,
-0.02979503, 1.698171, 0.2284404, 1, 1, 1, 1, 1,
-0.02949474, 0.2696897, -1.22573, 1, 1, 1, 1, 1,
-0.02113958, 0.4586314, -1.186614, 1, 1, 1, 1, 1,
-0.0177303, 1.17211, -0.1312471, 1, 1, 1, 1, 1,
-0.0105346, -1.33698, -2.576818, 1, 1, 1, 1, 1,
-0.007498747, 0.0001400547, -2.692743, 1, 1, 1, 1, 1,
-0.005973559, 3.162777, 0.4184805, 1, 1, 1, 1, 1,
-0.002682474, -1.58166, -4.260563, 1, 1, 1, 1, 1,
0.001552773, -1.142006, 3.617932, 1, 1, 1, 1, 1,
0.005368691, 0.5397023, 0.6361562, 1, 1, 1, 1, 1,
0.006199231, -1.588044, 2.156533, 1, 1, 1, 1, 1,
0.007492304, 0.8233546, 0.6919639, 1, 1, 1, 1, 1,
0.01105516, 0.1312682, -0.1371345, 1, 1, 1, 1, 1,
0.01515885, -0.7980546, 3.246284, 1, 1, 1, 1, 1,
0.01538287, -1.585722, 2.597388, 1, 1, 1, 1, 1,
0.01630008, -1.752209, 3.457279, 0, 0, 1, 1, 1,
0.0179023, 0.1287376, 0.01558234, 1, 0, 0, 1, 1,
0.01808113, 1.392908, 2.933629, 1, 0, 0, 1, 1,
0.01891246, -0.4569671, 2.576963, 1, 0, 0, 1, 1,
0.01900852, -0.5295543, 1.241867, 1, 0, 0, 1, 1,
0.02041596, -0.3662629, 2.513729, 1, 0, 0, 1, 1,
0.02050699, 1.007611, 2.173361, 0, 0, 0, 1, 1,
0.02051023, 0.2139146, 1.859767, 0, 0, 0, 1, 1,
0.02071972, 0.1290495, -1.608141, 0, 0, 0, 1, 1,
0.02273263, 1.70583, -0.2782142, 0, 0, 0, 1, 1,
0.02767169, -1.521424, 2.262382, 0, 0, 0, 1, 1,
0.03003341, -0.4249078, 2.088252, 0, 0, 0, 1, 1,
0.03252726, 0.04118346, -0.1710249, 0, 0, 0, 1, 1,
0.03265766, 0.2163056, -0.0202412, 1, 1, 1, 1, 1,
0.0339856, -0.4542124, 2.073713, 1, 1, 1, 1, 1,
0.03473262, -0.3067066, 3.081142, 1, 1, 1, 1, 1,
0.03626719, -0.3336029, 2.399261, 1, 1, 1, 1, 1,
0.03655297, 0.912522, 1.367066, 1, 1, 1, 1, 1,
0.03925014, 0.2832944, -0.0839109, 1, 1, 1, 1, 1,
0.04200389, 1.097959, 0.443755, 1, 1, 1, 1, 1,
0.04210832, -3.065189, 2.917711, 1, 1, 1, 1, 1,
0.04532956, -0.498675, 1.942061, 1, 1, 1, 1, 1,
0.04613637, -0.9864517, -0.3469396, 1, 1, 1, 1, 1,
0.04906886, 0.4358178, 0.03814469, 1, 1, 1, 1, 1,
0.05067489, -0.1435369, 3.947731, 1, 1, 1, 1, 1,
0.05106982, 0.1196224, 1.274267, 1, 1, 1, 1, 1,
0.06271593, 0.8230664, 0.7123865, 1, 1, 1, 1, 1,
0.06364057, -0.3957384, 4.253717, 1, 1, 1, 1, 1,
0.06412057, 0.5090566, 1.134982, 0, 0, 1, 1, 1,
0.06541719, -0.009165822, 3.870747, 1, 0, 0, 1, 1,
0.06550541, -0.7378763, 1.432238, 1, 0, 0, 1, 1,
0.06780834, -2.561719, 2.868616, 1, 0, 0, 1, 1,
0.06988745, -0.1897827, 2.160837, 1, 0, 0, 1, 1,
0.07774757, -1.006916, 2.730619, 1, 0, 0, 1, 1,
0.08052642, -1.446337, 2.542017, 0, 0, 0, 1, 1,
0.08142202, -0.4040945, 3.118873, 0, 0, 0, 1, 1,
0.09123369, 1.605674, -0.392619, 0, 0, 0, 1, 1,
0.09457448, -0.3517474, 3.993589, 0, 0, 0, 1, 1,
0.09746239, 0.6491863, 0.2121432, 0, 0, 0, 1, 1,
0.09956479, 0.7063723, 0.821058, 0, 0, 0, 1, 1,
0.1047662, 0.6609914, 1.12768, 0, 0, 0, 1, 1,
0.1115568, -0.4785578, 0.9378468, 1, 1, 1, 1, 1,
0.1130846, 0.8087137, -1.157587, 1, 1, 1, 1, 1,
0.1186216, 1.317967, 1.41985, 1, 1, 1, 1, 1,
0.1186536, 1.570297, -1.963889, 1, 1, 1, 1, 1,
0.1199697, 0.5336689, -0.5662179, 1, 1, 1, 1, 1,
0.1200406, -0.2961663, 1.743444, 1, 1, 1, 1, 1,
0.120411, 0.07294868, 0.9407821, 1, 1, 1, 1, 1,
0.1227623, 0.8480649, 1.891473, 1, 1, 1, 1, 1,
0.1232628, 1.973611, 1.807139, 1, 1, 1, 1, 1,
0.1236553, 0.9742385, -1.027141, 1, 1, 1, 1, 1,
0.1249818, 0.1321678, 1.649681, 1, 1, 1, 1, 1,
0.1285337, 0.7152582, 0.9419971, 1, 1, 1, 1, 1,
0.1306079, -0.6502557, 3.475639, 1, 1, 1, 1, 1,
0.131082, -0.6062151, 4.301667, 1, 1, 1, 1, 1,
0.1314929, -1.155014, 1.305421, 1, 1, 1, 1, 1,
0.1316645, 1.2075, -2.215726, 0, 0, 1, 1, 1,
0.13439, -0.837735, 4.199208, 1, 0, 0, 1, 1,
0.1356717, 0.8419073, 1.137502, 1, 0, 0, 1, 1,
0.1361859, 0.3888513, -0.805984, 1, 0, 0, 1, 1,
0.1400461, 0.2534749, 1.354163, 1, 0, 0, 1, 1,
0.1470955, 2.030135, -0.4613608, 1, 0, 0, 1, 1,
0.1485034, 1.842256, -0.466525, 0, 0, 0, 1, 1,
0.1526508, -0.8660481, 2.016596, 0, 0, 0, 1, 1,
0.154317, 0.1200176, 1.434754, 0, 0, 0, 1, 1,
0.1603535, 1.465182, 0.7103385, 0, 0, 0, 1, 1,
0.1607655, 0.5075076, 1.243636, 0, 0, 0, 1, 1,
0.1613096, 0.1546311, 0.391862, 0, 0, 0, 1, 1,
0.166973, 1.639003, 0.9243309, 0, 0, 0, 1, 1,
0.1696863, -1.100693, 3.344539, 1, 1, 1, 1, 1,
0.1700099, -0.663386, 1.594764, 1, 1, 1, 1, 1,
0.1733739, 1.600042, 0.3442152, 1, 1, 1, 1, 1,
0.1738196, 0.1130316, 1.058494, 1, 1, 1, 1, 1,
0.1756104, 0.7988809, -0.7444078, 1, 1, 1, 1, 1,
0.1777971, -0.3758141, 2.893826, 1, 1, 1, 1, 1,
0.1799366, -1.777313, 3.161198, 1, 1, 1, 1, 1,
0.1835594, -0.105956, 0.7032012, 1, 1, 1, 1, 1,
0.1960863, -0.2392988, 1.183545, 1, 1, 1, 1, 1,
0.1962503, 0.5602434, -1.876611, 1, 1, 1, 1, 1,
0.1993443, -0.7154539, 3.088192, 1, 1, 1, 1, 1,
0.2000357, 0.2639261, 0.6770174, 1, 1, 1, 1, 1,
0.2019385, -1.810548, 3.270124, 1, 1, 1, 1, 1,
0.2063186, 0.905238, 0.6435802, 1, 1, 1, 1, 1,
0.2116427, -0.5307781, 0.4112454, 1, 1, 1, 1, 1,
0.2145444, -0.9818152, 4.285313, 0, 0, 1, 1, 1,
0.2170698, 0.8041536, 0.05118934, 1, 0, 0, 1, 1,
0.2239053, -0.6884092, 0.5027577, 1, 0, 0, 1, 1,
0.2297606, -1.280091, 3.682164, 1, 0, 0, 1, 1,
0.232142, 0.1378241, -0.06485923, 1, 0, 0, 1, 1,
0.2341253, -0.7138072, 3.909153, 1, 0, 0, 1, 1,
0.2370747, -0.02187597, 1.871251, 0, 0, 0, 1, 1,
0.23906, 0.2764629, 1.463868, 0, 0, 0, 1, 1,
0.2491097, 1.654857, -0.5473554, 0, 0, 0, 1, 1,
0.2512184, -1.741643, 3.428454, 0, 0, 0, 1, 1,
0.2574913, -0.5979226, 2.816767, 0, 0, 0, 1, 1,
0.2591295, 0.754852, -0.1620552, 0, 0, 0, 1, 1,
0.2593514, 1.203941, -1.169018, 0, 0, 0, 1, 1,
0.2619369, -2.191532, 2.356791, 1, 1, 1, 1, 1,
0.2635434, 0.3577455, 1.251647, 1, 1, 1, 1, 1,
0.267393, -1.994841, 1.702728, 1, 1, 1, 1, 1,
0.2674419, 0.04063785, 3.286801, 1, 1, 1, 1, 1,
0.2700624, -0.2624596, 1.954817, 1, 1, 1, 1, 1,
0.275825, 1.494689, -0.3949268, 1, 1, 1, 1, 1,
0.277178, 0.7560048, 0.3807731, 1, 1, 1, 1, 1,
0.2777032, 1.183619, 0.7865704, 1, 1, 1, 1, 1,
0.2782235, -0.1244221, 0.8674075, 1, 1, 1, 1, 1,
0.2806801, -2.016679, 4.339169, 1, 1, 1, 1, 1,
0.2827521, -1.010568, 2.683073, 1, 1, 1, 1, 1,
0.2842285, -1.195098, 2.610224, 1, 1, 1, 1, 1,
0.2894651, 0.3938532, 0.7663084, 1, 1, 1, 1, 1,
0.2932096, 1.027975, 1.407155, 1, 1, 1, 1, 1,
0.3152035, 1.246347, 2.610901, 1, 1, 1, 1, 1,
0.3159923, -0.9451857, 3.659438, 0, 0, 1, 1, 1,
0.3207897, -0.6580419, 1.436879, 1, 0, 0, 1, 1,
0.3222073, -0.1259002, 2.290133, 1, 0, 0, 1, 1,
0.3231121, -0.1986912, 2.60605, 1, 0, 0, 1, 1,
0.3300448, 1.332232, 1.004755, 1, 0, 0, 1, 1,
0.3309562, 3.19961, 1.038569, 1, 0, 0, 1, 1,
0.3342425, 2.181552, -0.1525829, 0, 0, 0, 1, 1,
0.3350435, -0.5030943, 3.108228, 0, 0, 0, 1, 1,
0.3378378, 1.515261, 0.1704732, 0, 0, 0, 1, 1,
0.3413403, 0.8895174, 0.787384, 0, 0, 0, 1, 1,
0.3465668, 1.344906, 0.1282158, 0, 0, 0, 1, 1,
0.3476673, -1.892462, 2.057724, 0, 0, 0, 1, 1,
0.3494511, -0.6691914, 3.00472, 0, 0, 0, 1, 1,
0.3532302, -0.4258873, 2.150365, 1, 1, 1, 1, 1,
0.3555563, 0.3172778, 0.2433785, 1, 1, 1, 1, 1,
0.3655547, 1.439189, 0.3284442, 1, 1, 1, 1, 1,
0.3669445, -1.538097, 1.426592, 1, 1, 1, 1, 1,
0.3674215, -0.1862485, 2.546021, 1, 1, 1, 1, 1,
0.3695277, -1.239383, 2.786468, 1, 1, 1, 1, 1,
0.3761804, -0.9727241, 3.872731, 1, 1, 1, 1, 1,
0.3796629, -0.5613022, 2.255909, 1, 1, 1, 1, 1,
0.3814185, -0.8088078, 2.489212, 1, 1, 1, 1, 1,
0.3816648, 0.8978148, 0.3357515, 1, 1, 1, 1, 1,
0.3817131, 0.8165056, 1.32946, 1, 1, 1, 1, 1,
0.3831172, -0.6935344, 4.430964, 1, 1, 1, 1, 1,
0.3839484, 1.076534, 2.174119, 1, 1, 1, 1, 1,
0.385402, 0.7091459, -1.931322, 1, 1, 1, 1, 1,
0.3877764, 0.6108624, 1.704922, 1, 1, 1, 1, 1,
0.3899659, 1.226116, 0.8764853, 0, 0, 1, 1, 1,
0.3910205, 1.165199, 2.009392, 1, 0, 0, 1, 1,
0.3921676, 0.3610201, 0.1678326, 1, 0, 0, 1, 1,
0.3934916, 0.7177339, 0.04832319, 1, 0, 0, 1, 1,
0.3965224, -0.4720905, 1.398136, 1, 0, 0, 1, 1,
0.3977605, -1.038733, 3.745759, 1, 0, 0, 1, 1,
0.4018621, 0.8413136, 0.1443858, 0, 0, 0, 1, 1,
0.4064941, -1.364194, 1.872459, 0, 0, 0, 1, 1,
0.4128858, 1.136722, 0.01021938, 0, 0, 0, 1, 1,
0.4172812, 0.4210383, 0.6566716, 0, 0, 0, 1, 1,
0.4178954, -0.9551761, 3.274128, 0, 0, 0, 1, 1,
0.4216796, -0.1908897, 1.819091, 0, 0, 0, 1, 1,
0.4237474, -0.270894, 1.145016, 0, 0, 0, 1, 1,
0.4253941, -0.3328156, 2.966447, 1, 1, 1, 1, 1,
0.4270962, -0.2651094, 2.696219, 1, 1, 1, 1, 1,
0.4341694, -1.260003, 2.580865, 1, 1, 1, 1, 1,
0.4370208, -1.999445, 2.078408, 1, 1, 1, 1, 1,
0.4468721, -1.658795, 3.675787, 1, 1, 1, 1, 1,
0.4515745, -0.7556084, 1.88223, 1, 1, 1, 1, 1,
0.4522884, 0.03708372, 3.864911, 1, 1, 1, 1, 1,
0.4535423, 1.220093, 0.09845304, 1, 1, 1, 1, 1,
0.4619423, -0.2931627, 0.6762956, 1, 1, 1, 1, 1,
0.4623912, 0.1693741, 0.3747153, 1, 1, 1, 1, 1,
0.4678352, -0.625787, 2.850902, 1, 1, 1, 1, 1,
0.4780074, -0.955976, 3.351974, 1, 1, 1, 1, 1,
0.4792356, -1.489267, 1.391918, 1, 1, 1, 1, 1,
0.4804024, 1.840683, 0.7610472, 1, 1, 1, 1, 1,
0.4820768, 1.032202, -1.065874, 1, 1, 1, 1, 1,
0.4850517, 0.1314519, 2.446374, 0, 0, 1, 1, 1,
0.4873283, -0.05875273, 1.574148, 1, 0, 0, 1, 1,
0.4875691, -1.320761, 4.216239, 1, 0, 0, 1, 1,
0.4941879, 0.0950821, 0.7239304, 1, 0, 0, 1, 1,
0.4988813, -0.1521042, 1.974745, 1, 0, 0, 1, 1,
0.4999245, -0.2863646, 2.423594, 1, 0, 0, 1, 1,
0.5019712, -0.4253618, 2.283247, 0, 0, 0, 1, 1,
0.5032036, -1.934244, 4.442283, 0, 0, 0, 1, 1,
0.5059571, -0.4607015, 3.614281, 0, 0, 0, 1, 1,
0.5137425, -1.20335, 2.962257, 0, 0, 0, 1, 1,
0.5147647, -0.2844449, 2.212407, 0, 0, 0, 1, 1,
0.5168431, -0.2432912, 2.306871, 0, 0, 0, 1, 1,
0.5193372, 1.747251, -1.267639, 0, 0, 0, 1, 1,
0.5213069, 1.086377, -0.6744323, 1, 1, 1, 1, 1,
0.521836, 0.9426538, 1.335344, 1, 1, 1, 1, 1,
0.5223305, -0.1508708, 0.8339716, 1, 1, 1, 1, 1,
0.5230303, 0.001546281, 2.344017, 1, 1, 1, 1, 1,
0.5240595, 2.37602, -0.5361612, 1, 1, 1, 1, 1,
0.5264935, -0.6376259, 2.143823, 1, 1, 1, 1, 1,
0.5282645, -0.8131575, 3.122415, 1, 1, 1, 1, 1,
0.5294877, 0.6620809, -0.8215477, 1, 1, 1, 1, 1,
0.5298231, -0.5065031, 1.867995, 1, 1, 1, 1, 1,
0.5309952, 0.0798584, 2.816471, 1, 1, 1, 1, 1,
0.5323694, -0.05457699, 1.689725, 1, 1, 1, 1, 1,
0.5338441, -0.3625101, 3.738378, 1, 1, 1, 1, 1,
0.5339803, 0.1885874, 1.935501, 1, 1, 1, 1, 1,
0.5355213, 0.5586811, 3.355319, 1, 1, 1, 1, 1,
0.5367807, 0.7575471, 1.094067, 1, 1, 1, 1, 1,
0.5423477, 0.7872451, 0.5928044, 0, 0, 1, 1, 1,
0.5473981, 0.9986956, 0.06475757, 1, 0, 0, 1, 1,
0.5507819, -0.9248835, 3.201334, 1, 0, 0, 1, 1,
0.5578725, 0.3477501, 1.450161, 1, 0, 0, 1, 1,
0.5585731, -1.508582, 4.031063, 1, 0, 0, 1, 1,
0.5687355, -0.06236012, 1.812006, 1, 0, 0, 1, 1,
0.5706905, 0.2910741, 0.1214256, 0, 0, 0, 1, 1,
0.5749271, -1.434747, 2.446014, 0, 0, 0, 1, 1,
0.5761837, 0.07811252, -0.007343179, 0, 0, 0, 1, 1,
0.5781235, -1.164898, 2.136735, 0, 0, 0, 1, 1,
0.5795375, 0.1768857, 1.277054, 0, 0, 0, 1, 1,
0.5858541, -0.4743968, 3.9627, 0, 0, 0, 1, 1,
0.5869753, -0.6438587, 2.576784, 0, 0, 0, 1, 1,
0.5882034, -0.5264512, 3.70839, 1, 1, 1, 1, 1,
0.5921148, 0.6226377, 0.8167045, 1, 1, 1, 1, 1,
0.602612, 0.5585372, 1.615847, 1, 1, 1, 1, 1,
0.6064385, -0.2119782, 2.43333, 1, 1, 1, 1, 1,
0.6083501, 0.5381416, 1.515688, 1, 1, 1, 1, 1,
0.6085911, 1.494283, -0.5844602, 1, 1, 1, 1, 1,
0.6100149, 0.4803656, 1.006706, 1, 1, 1, 1, 1,
0.6133277, 1.521155, 0.7310677, 1, 1, 1, 1, 1,
0.6139191, -0.7773202, 1.370675, 1, 1, 1, 1, 1,
0.6180637, 0.6326402, 2.099882, 1, 1, 1, 1, 1,
0.6250786, 0.5674848, 3.139748, 1, 1, 1, 1, 1,
0.6301382, 0.6076776, 2.21306, 1, 1, 1, 1, 1,
0.636586, 0.7650129, 1.836812, 1, 1, 1, 1, 1,
0.6385472, -0.3986107, 1.267766, 1, 1, 1, 1, 1,
0.6406164, 0.6346107, 0.8284147, 1, 1, 1, 1, 1,
0.6447187, 0.9136331, -0.2595094, 0, 0, 1, 1, 1,
0.6503629, -0.8579093, 1.295314, 1, 0, 0, 1, 1,
0.6516417, -1.216908, 2.6296, 1, 0, 0, 1, 1,
0.6531402, 1.259333, 0.3617097, 1, 0, 0, 1, 1,
0.6560455, 1.005198, 0.6848226, 1, 0, 0, 1, 1,
0.6591944, 0.2590369, 1.182217, 1, 0, 0, 1, 1,
0.6616911, 0.1536733, 3.097417, 0, 0, 0, 1, 1,
0.6626097, -0.02219605, 1.967588, 0, 0, 0, 1, 1,
0.6626682, -0.07603492, 0.1028889, 0, 0, 0, 1, 1,
0.6660613, 0.261559, 1.930942, 0, 0, 0, 1, 1,
0.6705021, -1.610852, 2.436949, 0, 0, 0, 1, 1,
0.6795252, 0.6803949, 1.280405, 0, 0, 0, 1, 1,
0.685553, 0.09818436, 2.31451, 0, 0, 0, 1, 1,
0.6978983, 0.7445625, 0.4535053, 1, 1, 1, 1, 1,
0.6979327, -0.04365185, 0.1507193, 1, 1, 1, 1, 1,
0.6980795, 0.7011072, 3.48734, 1, 1, 1, 1, 1,
0.6985443, 2.19539, 1.275217, 1, 1, 1, 1, 1,
0.7031957, -1.592405, 2.292704, 1, 1, 1, 1, 1,
0.7034535, 0.2920151, 2.213202, 1, 1, 1, 1, 1,
0.7035005, 0.08435205, 0.5426311, 1, 1, 1, 1, 1,
0.7086635, -0.961202, 1.764176, 1, 1, 1, 1, 1,
0.7130029, -0.707778, 2.633431, 1, 1, 1, 1, 1,
0.7152278, 0.1420218, 0.8202366, 1, 1, 1, 1, 1,
0.7161896, -0.2186025, 2.638143, 1, 1, 1, 1, 1,
0.7181791, -1.46997, 1.503742, 1, 1, 1, 1, 1,
0.71854, -0.5285765, 4.012285, 1, 1, 1, 1, 1,
0.7226176, -1.929193, 3.538655, 1, 1, 1, 1, 1,
0.7226487, -0.2946802, 1.265413, 1, 1, 1, 1, 1,
0.7243377, -0.6988894, 1.872674, 0, 0, 1, 1, 1,
0.7285491, -1.042369, 1.820479, 1, 0, 0, 1, 1,
0.7378471, 0.1649116, 1.876379, 1, 0, 0, 1, 1,
0.7415913, 1.074449, -0.2536714, 1, 0, 0, 1, 1,
0.7416736, 0.300712, 0.07676772, 1, 0, 0, 1, 1,
0.745564, 1.503873, 0.829488, 1, 0, 0, 1, 1,
0.7474296, 0.5463561, 1.36369, 0, 0, 0, 1, 1,
0.7491362, 0.6407067, 0.8820761, 0, 0, 0, 1, 1,
0.7510309, -0.6093161, 2.689003, 0, 0, 0, 1, 1,
0.7522667, 0.8496263, 2.383079, 0, 0, 0, 1, 1,
0.765525, -0.4441545, 0.5341181, 0, 0, 0, 1, 1,
0.7666833, 1.50666, 1.183405, 0, 0, 0, 1, 1,
0.7771245, -1.008808, 2.281582, 0, 0, 0, 1, 1,
0.7839745, 0.6440481, -0.2205611, 1, 1, 1, 1, 1,
0.7920802, -0.8360059, 2.646967, 1, 1, 1, 1, 1,
0.7948679, -0.2304754, 4.005786, 1, 1, 1, 1, 1,
0.7988944, -0.5243187, 1.06661, 1, 1, 1, 1, 1,
0.8020836, 0.04000809, 0.2384961, 1, 1, 1, 1, 1,
0.8038756, 0.1010287, 2.039059, 1, 1, 1, 1, 1,
0.807156, 0.1301322, 1.245114, 1, 1, 1, 1, 1,
0.8095862, -1.832497, 1.426601, 1, 1, 1, 1, 1,
0.8148511, -1.146128, 1.683509, 1, 1, 1, 1, 1,
0.8193454, 0.4053448, 1.523062, 1, 1, 1, 1, 1,
0.8218586, -0.2224591, 1.701364, 1, 1, 1, 1, 1,
0.8233783, 0.2057712, 2.295719, 1, 1, 1, 1, 1,
0.8245806, 0.5118976, 1.167297, 1, 1, 1, 1, 1,
0.8261477, 1.247635, -0.009947011, 1, 1, 1, 1, 1,
0.8262432, -1.075259, 1.25197, 1, 1, 1, 1, 1,
0.8265104, -0.9573447, -1.001215, 0, 0, 1, 1, 1,
0.8268671, -1.307718, 2.004746, 1, 0, 0, 1, 1,
0.8274489, -3.125286, 4.462222, 1, 0, 0, 1, 1,
0.8303788, -0.3545342, 0.7274408, 1, 0, 0, 1, 1,
0.8310249, 1.225741, -0.9078273, 1, 0, 0, 1, 1,
0.8347588, -2.648723, 2.829574, 1, 0, 0, 1, 1,
0.8391032, -0.8688909, 3.407416, 0, 0, 0, 1, 1,
0.8420023, 1.059643, 0.09515566, 0, 0, 0, 1, 1,
0.8443373, -0.4998725, 3.751311, 0, 0, 0, 1, 1,
0.8444565, 0.5854769, 2.537995, 0, 0, 0, 1, 1,
0.8445358, 0.7879871, 0.07788884, 0, 0, 0, 1, 1,
0.8466617, 0.3453608, 1.451456, 0, 0, 0, 1, 1,
0.8505026, -0.4345927, 2.673413, 0, 0, 0, 1, 1,
0.8505307, 0.3251033, 1.564475, 1, 1, 1, 1, 1,
0.850616, 1.46067, 1.670654, 1, 1, 1, 1, 1,
0.854247, -1.587587, 2.565302, 1, 1, 1, 1, 1,
0.856852, 0.1279729, 1.169004, 1, 1, 1, 1, 1,
0.862357, -0.1438556, 1.426398, 1, 1, 1, 1, 1,
0.8661159, -2.503741, 1.663479, 1, 1, 1, 1, 1,
0.8681363, -1.369451, 2.196277, 1, 1, 1, 1, 1,
0.8688241, -1.134707, 1.601244, 1, 1, 1, 1, 1,
0.8692293, 0.8823895, 0.9912781, 1, 1, 1, 1, 1,
0.8742341, 0.4802704, 0.7513281, 1, 1, 1, 1, 1,
0.8786917, -0.862124, 2.301992, 1, 1, 1, 1, 1,
0.8887764, 0.8684287, 2.063476, 1, 1, 1, 1, 1,
0.9011332, -1.372396, 2.645919, 1, 1, 1, 1, 1,
0.9030222, 0.4749448, 2.828535, 1, 1, 1, 1, 1,
0.9058773, -0.3783088, 0.664933, 1, 1, 1, 1, 1,
0.9060347, 1.594122, 0.1261159, 0, 0, 1, 1, 1,
0.9144866, 1.342115, 1.020596, 1, 0, 0, 1, 1,
0.9150602, -0.8278553, 1.894596, 1, 0, 0, 1, 1,
0.9169332, 0.7745033, 1.115574, 1, 0, 0, 1, 1,
0.9178578, -0.4090419, 2.053515, 1, 0, 0, 1, 1,
0.9328573, 0.01898646, 0.9404511, 1, 0, 0, 1, 1,
0.9396734, 0.6713389, 1.309016, 0, 0, 0, 1, 1,
0.9470902, 0.1584585, 0.4654762, 0, 0, 0, 1, 1,
0.9476777, -1.68975, 3.832644, 0, 0, 0, 1, 1,
0.9510514, 0.01150152, -0.08276643, 0, 0, 0, 1, 1,
0.9558223, -1.584827, 3.73452, 0, 0, 0, 1, 1,
0.9587899, 0.01779342, 1.918848, 0, 0, 0, 1, 1,
0.9641448, -1.256479, 4.18162, 0, 0, 0, 1, 1,
0.9748339, 0.2480587, 2.431796, 1, 1, 1, 1, 1,
0.9825519, -1.607779, 3.751936, 1, 1, 1, 1, 1,
0.9969877, -1.462207, 2.930931, 1, 1, 1, 1, 1,
0.9997932, 0.1227643, 2.312143, 1, 1, 1, 1, 1,
1.003414, -0.1573978, 0.4948697, 1, 1, 1, 1, 1,
1.005443, 0.2531758, -0.0871369, 1, 1, 1, 1, 1,
1.010389, 1.50446, 0.3150729, 1, 1, 1, 1, 1,
1.010558, -0.04912633, 1.884219, 1, 1, 1, 1, 1,
1.015231, -0.1950872, 0.6443905, 1, 1, 1, 1, 1,
1.020603, -0.8800106, 3.295564, 1, 1, 1, 1, 1,
1.0212, 0.7023892, -0.5421063, 1, 1, 1, 1, 1,
1.026382, -1.383919, 1.996668, 1, 1, 1, 1, 1,
1.028624, -1.285722, 1.152995, 1, 1, 1, 1, 1,
1.031103, -1.018185, 2.121266, 1, 1, 1, 1, 1,
1.032291, 0.9950138, 0.1683381, 1, 1, 1, 1, 1,
1.033731, 0.5647513, 1.631042, 0, 0, 1, 1, 1,
1.037209, -0.3500117, 3.254513, 1, 0, 0, 1, 1,
1.040419, 0.6770594, 0.4635672, 1, 0, 0, 1, 1,
1.040981, -0.2779323, 2.680851, 1, 0, 0, 1, 1,
1.044421, 1.132067, 1.337325, 1, 0, 0, 1, 1,
1.054613, 1.760236, 0.02568259, 1, 0, 0, 1, 1,
1.05805, 0.8670189, 0.8756758, 0, 0, 0, 1, 1,
1.061452, -0.4287491, 2.325941, 0, 0, 0, 1, 1,
1.064659, 0.4226038, 0.9326994, 0, 0, 0, 1, 1,
1.06653, 2.010609, 1.0869, 0, 0, 0, 1, 1,
1.0673, -1.174464, 2.208313, 0, 0, 0, 1, 1,
1.067301, 0.5254297, 1.387638, 0, 0, 0, 1, 1,
1.07832, -0.6591154, 1.073387, 0, 0, 0, 1, 1,
1.08303, 0.3610486, 1.681371, 1, 1, 1, 1, 1,
1.084001, -0.6839417, 2.181911, 1, 1, 1, 1, 1,
1.085091, -0.7066392, 1.902767, 1, 1, 1, 1, 1,
1.08565, 0.09915497, 1.091943, 1, 1, 1, 1, 1,
1.093577, 0.8601167, 2.181448, 1, 1, 1, 1, 1,
1.093714, 1.672963, 0.1303989, 1, 1, 1, 1, 1,
1.095967, -0.4036991, 0.9034873, 1, 1, 1, 1, 1,
1.105104, -0.6765948, 2.503356, 1, 1, 1, 1, 1,
1.108524, 0.4332997, 1.149686, 1, 1, 1, 1, 1,
1.118542, -0.8338816, 4.196931, 1, 1, 1, 1, 1,
1.122182, 0.6984203, 1.277445, 1, 1, 1, 1, 1,
1.126336, 1.561456, 0.1367442, 1, 1, 1, 1, 1,
1.128114, 0.5706895, 0.5297601, 1, 1, 1, 1, 1,
1.135461, 0.4112988, 1.313883, 1, 1, 1, 1, 1,
1.139219, -1.672794, 3.057458, 1, 1, 1, 1, 1,
1.140397, -0.4897683, 1.907386, 0, 0, 1, 1, 1,
1.143112, 1.468091, 0.9276904, 1, 0, 0, 1, 1,
1.147833, 0.5658957, 1.026555, 1, 0, 0, 1, 1,
1.149782, -2.12, 2.055035, 1, 0, 0, 1, 1,
1.151724, -0.944261, 3.091466, 1, 0, 0, 1, 1,
1.160601, 1.08438, 1.956837, 1, 0, 0, 1, 1,
1.180912, 1.944392, -0.197673, 0, 0, 0, 1, 1,
1.183781, 0.4045482, 1.522438, 0, 0, 0, 1, 1,
1.188954, -0.4182501, 1.583188, 0, 0, 0, 1, 1,
1.198332, 0.4761179, 0.6399977, 0, 0, 0, 1, 1,
1.207529, 0.3892965, 0.7277702, 0, 0, 0, 1, 1,
1.208219, 0.9331146, 0.6241037, 0, 0, 0, 1, 1,
1.223498, -2.660739, 2.117513, 0, 0, 0, 1, 1,
1.227164, 1.523892, -0.2712724, 1, 1, 1, 1, 1,
1.227316, 0.0007912556, 2.166586, 1, 1, 1, 1, 1,
1.23007, -0.08162467, 1.50825, 1, 1, 1, 1, 1,
1.232295, 2.583491, 1.865437, 1, 1, 1, 1, 1,
1.237164, 0.3225668, 0.06098155, 1, 1, 1, 1, 1,
1.241136, 1.934708, 1.035579, 1, 1, 1, 1, 1,
1.243715, -0.7947996, 4.001898, 1, 1, 1, 1, 1,
1.24655, 0.5732535, 1.558704, 1, 1, 1, 1, 1,
1.263749, 1.831661, 1.524504, 1, 1, 1, 1, 1,
1.272688, 0.8596758, 0.1871649, 1, 1, 1, 1, 1,
1.27518, 0.325906, -0.0714772, 1, 1, 1, 1, 1,
1.279747, 1.582588, 2.842202, 1, 1, 1, 1, 1,
1.284314, -1.77204, 2.601434, 1, 1, 1, 1, 1,
1.299951, -0.3839013, 3.199472, 1, 1, 1, 1, 1,
1.319031, 1.703895, -1.095512, 1, 1, 1, 1, 1,
1.321275, 0.1188508, 1.200481, 0, 0, 1, 1, 1,
1.321903, 0.8344918, 0.7884604, 1, 0, 0, 1, 1,
1.326966, 0.5901557, 0.3864319, 1, 0, 0, 1, 1,
1.328412, -0.1607901, 1.91352, 1, 0, 0, 1, 1,
1.334706, -0.1358025, 2.325689, 1, 0, 0, 1, 1,
1.34389, 1.055853, 0.2833503, 1, 0, 0, 1, 1,
1.35219, -2.275132, 1.395405, 0, 0, 0, 1, 1,
1.352461, 1.222392, 0.7459154, 0, 0, 0, 1, 1,
1.357153, -0.4189535, 2.071803, 0, 0, 0, 1, 1,
1.371422, 0.296906, 2.998698, 0, 0, 0, 1, 1,
1.375069, -0.4478106, 3.513072, 0, 0, 0, 1, 1,
1.409113, 0.6445647, -0.09753377, 0, 0, 0, 1, 1,
1.410409, -0.08748788, 1.772949, 0, 0, 0, 1, 1,
1.432592, 0.3345109, 0.9687792, 1, 1, 1, 1, 1,
1.439842, -0.03922617, 1.227974, 1, 1, 1, 1, 1,
1.441183, -0.340434, 2.709841, 1, 1, 1, 1, 1,
1.441685, 1.169073, 0.5984491, 1, 1, 1, 1, 1,
1.448863, 0.3371262, 1.362758, 1, 1, 1, 1, 1,
1.461901, 0.2484933, -0.3982539, 1, 1, 1, 1, 1,
1.463236, -0.3030298, 0.664274, 1, 1, 1, 1, 1,
1.470024, -0.8517402, 1.459756, 1, 1, 1, 1, 1,
1.476141, 0.2495372, 0.07716376, 1, 1, 1, 1, 1,
1.479588, -0.6369034, 1.009581, 1, 1, 1, 1, 1,
1.482745, 0.03136981, 1.34481, 1, 1, 1, 1, 1,
1.500492, 0.5721803, 2.149241, 1, 1, 1, 1, 1,
1.50145, 1.873755, 0.467991, 1, 1, 1, 1, 1,
1.51905, -1.527541, 1.010841, 1, 1, 1, 1, 1,
1.521312, -0.784861, 3.367174, 1, 1, 1, 1, 1,
1.524683, 0.1696622, 3.038708, 0, 0, 1, 1, 1,
1.547732, 0.1057486, 0.6060349, 1, 0, 0, 1, 1,
1.54817, 2.023251, 1.128828, 1, 0, 0, 1, 1,
1.548988, 1.370447, 1.675683, 1, 0, 0, 1, 1,
1.557791, -0.7215134, 0.3222665, 1, 0, 0, 1, 1,
1.558094, -2.620762, 2.822736, 1, 0, 0, 1, 1,
1.566257, -0.4164849, 1.388323, 0, 0, 0, 1, 1,
1.566758, 1.215637, 2.041813, 0, 0, 0, 1, 1,
1.567742, 0.2401879, 0.773323, 0, 0, 0, 1, 1,
1.574434, 0.2570612, 1.430029, 0, 0, 0, 1, 1,
1.581003, 0.3883948, 1.652533, 0, 0, 0, 1, 1,
1.590476, 1.17365, 1.393304, 0, 0, 0, 1, 1,
1.598852, -0.5013528, 2.261622, 0, 0, 0, 1, 1,
1.609266, 0.09746785, 0.5492852, 1, 1, 1, 1, 1,
1.645728, -0.3928497, 3.183943, 1, 1, 1, 1, 1,
1.646342, -0.2879429, 1.629177, 1, 1, 1, 1, 1,
1.647892, 0.2140815, 2.123248, 1, 1, 1, 1, 1,
1.653784, -0.1307703, 3.141534, 1, 1, 1, 1, 1,
1.658741, 0.6082922, 2.181751, 1, 1, 1, 1, 1,
1.670254, -0.8116539, 2.085125, 1, 1, 1, 1, 1,
1.674443, -1.684583, 4.77187, 1, 1, 1, 1, 1,
1.676513, 1.646267, 0.5854979, 1, 1, 1, 1, 1,
1.685266, 0.9038571, 2.509583, 1, 1, 1, 1, 1,
1.711055, 0.9511835, 3.55253, 1, 1, 1, 1, 1,
1.714311, -0.3941287, -0.1293372, 1, 1, 1, 1, 1,
1.716017, -1.084474, -0.4685218, 1, 1, 1, 1, 1,
1.723777, -0.03087744, 1.860498, 1, 1, 1, 1, 1,
1.723844, -0.212008, 1.303506, 1, 1, 1, 1, 1,
1.753433, -0.07858202, 2.584585, 0, 0, 1, 1, 1,
1.762515, -0.5261359, 1.459892, 1, 0, 0, 1, 1,
1.783409, 0.3292858, 1.939296, 1, 0, 0, 1, 1,
1.801641, 1.087447, 1.235288, 1, 0, 0, 1, 1,
1.82233, -0.1402532, 1.588981, 1, 0, 0, 1, 1,
1.83297, 1.287614, 1.671461, 1, 0, 0, 1, 1,
1.842523, -0.5011617, 2.774597, 0, 0, 0, 1, 1,
1.846637, 0.4605856, 0.2914739, 0, 0, 0, 1, 1,
1.875, 0.7948315, -0.4047481, 0, 0, 0, 1, 1,
1.885415, 1.041872, -0.5217281, 0, 0, 0, 1, 1,
1.890114, 2.463814, 0.4380077, 0, 0, 0, 1, 1,
1.890505, -1.55902, 1.783436, 0, 0, 0, 1, 1,
1.900525, 1.656175, 1.073991, 0, 0, 0, 1, 1,
1.905919, 1.478358, 1.432876, 1, 1, 1, 1, 1,
1.909931, -0.04401047, 1.775415, 1, 1, 1, 1, 1,
1.91025, -0.5680151, 0.1671481, 1, 1, 1, 1, 1,
1.928311, 0.7467856, 0.1170865, 1, 1, 1, 1, 1,
1.929052, -0.7816875, 2.201684, 1, 1, 1, 1, 1,
1.934832, -0.5193989, 3.931862, 1, 1, 1, 1, 1,
1.978992, 0.4547144, -0.02367809, 1, 1, 1, 1, 1,
1.991877, 0.1055872, 1.524408, 1, 1, 1, 1, 1,
2.056126, -0.00352948, 1.473246, 1, 1, 1, 1, 1,
2.083236, 1.558451, -1.473704, 1, 1, 1, 1, 1,
2.094613, 1.350511, -1.323167, 1, 1, 1, 1, 1,
2.119467, -0.8129843, 2.766098, 1, 1, 1, 1, 1,
2.145424, 0.3656158, 2.979186, 1, 1, 1, 1, 1,
2.152286, -2.010287, 1.629217, 1, 1, 1, 1, 1,
2.190084, -1.723793, 0.496791, 1, 1, 1, 1, 1,
2.210863, 1.233155, 1.695275, 0, 0, 1, 1, 1,
2.21732, 0.7381639, 0.1700946, 1, 0, 0, 1, 1,
2.237886, -1.42553, 2.446456, 1, 0, 0, 1, 1,
2.240493, -0.2123296, 1.440591, 1, 0, 0, 1, 1,
2.253531, -0.6014233, 0.9206409, 1, 0, 0, 1, 1,
2.268275, 0.8617625, 1.016316, 1, 0, 0, 1, 1,
2.279398, 1.649809, 3.266768, 0, 0, 0, 1, 1,
2.312932, -0.9599129, 1.434647, 0, 0, 0, 1, 1,
2.384629, 0.5916051, 3.018228, 0, 0, 0, 1, 1,
2.38787, 2.912471, 0.3245378, 0, 0, 0, 1, 1,
2.45615, -0.7154207, 1.839507, 0, 0, 0, 1, 1,
2.464844, 0.01903523, 1.003847, 0, 0, 0, 1, 1,
2.467737, 1.023714, 1.246356, 0, 0, 0, 1, 1,
2.4954, -0.9629185, 1.639397, 1, 1, 1, 1, 1,
2.496837, -0.3340899, 3.59454, 1, 1, 1, 1, 1,
2.500428, 0.6805921, 0.4711794, 1, 1, 1, 1, 1,
2.515449, -1.464428, 0.8861612, 1, 1, 1, 1, 1,
2.525516, 0.8945084, 0.1571969, 1, 1, 1, 1, 1,
3.018929, -0.1088202, 1.213799, 1, 1, 1, 1, 1,
3.078453, -0.7370766, 1.442801, 1, 1, 1, 1, 1
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
var radius = 9.437778;
var distance = 33.1498;
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
mvMatrix.translate( 0.06895065, 0.09387493, 0.3907573 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.1498);
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
