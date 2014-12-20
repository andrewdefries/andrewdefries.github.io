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
-3.525014, -0.7596674, -1.369635, 1, 0, 0, 1,
-2.973933, -0.5462295, -2.61077, 1, 0.007843138, 0, 1,
-2.918914, -0.5630551, -1.579335, 1, 0.01176471, 0, 1,
-2.904769, -1.124666, -2.053334, 1, 0.01960784, 0, 1,
-2.686059, 0.1181286, -1.542524, 1, 0.02352941, 0, 1,
-2.638391, 0.9866529, -0.9960867, 1, 0.03137255, 0, 1,
-2.619362, 0.8745111, -1.223094, 1, 0.03529412, 0, 1,
-2.618942, -2.523716, -2.125778, 1, 0.04313726, 0, 1,
-2.552433, -0.177879, -2.343177, 1, 0.04705882, 0, 1,
-2.423707, 1.635016, -0.06280085, 1, 0.05490196, 0, 1,
-2.355148, 0.7900234, -0.008124546, 1, 0.05882353, 0, 1,
-2.336739, -1.741497, -1.613361, 1, 0.06666667, 0, 1,
-2.301156, -0.9332107, -1.628077, 1, 0.07058824, 0, 1,
-2.279234, 1.145965, 0.2349313, 1, 0.07843138, 0, 1,
-2.21197, 0.448495, -2.250677, 1, 0.08235294, 0, 1,
-2.187276, 0.8714813, -2.450053, 1, 0.09019608, 0, 1,
-2.15845, 0.2045471, -0.3164705, 1, 0.09411765, 0, 1,
-2.141555, 0.6463948, -1.747089, 1, 0.1019608, 0, 1,
-2.074738, -0.7392834, -1.477932, 1, 0.1098039, 0, 1,
-2.070124, 1.415317, 1.248989, 1, 0.1137255, 0, 1,
-2.057796, 0.4633603, -2.10721, 1, 0.1215686, 0, 1,
-2.042667, -1.54281, -1.318476, 1, 0.1254902, 0, 1,
-1.931614, 0.2707976, -1.135118, 1, 0.1333333, 0, 1,
-1.927557, 0.5214295, -1.194324, 1, 0.1372549, 0, 1,
-1.884261, 1.12897, -0.139712, 1, 0.145098, 0, 1,
-1.817016, 0.7914839, -0.2034811, 1, 0.1490196, 0, 1,
-1.808244, -0.4288784, -1.533269, 1, 0.1568628, 0, 1,
-1.804666, 1.037475, -2.124252, 1, 0.1607843, 0, 1,
-1.791731, 0.3512194, -2.000444, 1, 0.1686275, 0, 1,
-1.767911, 1.835109, -1.712352, 1, 0.172549, 0, 1,
-1.765741, -1.217584, -1.33889, 1, 0.1803922, 0, 1,
-1.762107, -1.13075, -1.414784, 1, 0.1843137, 0, 1,
-1.74267, -0.1354843, -2.727927, 1, 0.1921569, 0, 1,
-1.742252, 0.993961, -0.2803731, 1, 0.1960784, 0, 1,
-1.736334, -1.156557, -1.540621, 1, 0.2039216, 0, 1,
-1.709921, 0.7809618, -0.7715421, 1, 0.2117647, 0, 1,
-1.685904, -0.9554344, -1.017044, 1, 0.2156863, 0, 1,
-1.662003, -1.863022, -2.675218, 1, 0.2235294, 0, 1,
-1.653848, 0.4928347, -1.34913, 1, 0.227451, 0, 1,
-1.646817, -0.9117472, -1.785503, 1, 0.2352941, 0, 1,
-1.64161, 0.4724863, -1.261947, 1, 0.2392157, 0, 1,
-1.638711, -1.203951, -3.196291, 1, 0.2470588, 0, 1,
-1.624925, 1.129526, -0.07217509, 1, 0.2509804, 0, 1,
-1.609432, -0.7613215, -2.186214, 1, 0.2588235, 0, 1,
-1.605903, 0.01591767, -4.112211, 1, 0.2627451, 0, 1,
-1.596135, 1.938915, -0.6349559, 1, 0.2705882, 0, 1,
-1.595911, 0.354037, -1.294967, 1, 0.2745098, 0, 1,
-1.58674, 0.3608741, -1.279911, 1, 0.282353, 0, 1,
-1.586696, 0.7861904, -0.9518877, 1, 0.2862745, 0, 1,
-1.576907, -0.7618921, -2.98408, 1, 0.2941177, 0, 1,
-1.564224, 2.147677, -0.5895573, 1, 0.3019608, 0, 1,
-1.54534, -0.8825063, -2.202368, 1, 0.3058824, 0, 1,
-1.543046, -0.3603273, -1.996166, 1, 0.3137255, 0, 1,
-1.541044, -2.102931, -4.584004, 1, 0.3176471, 0, 1,
-1.530957, -0.3619477, -2.462526, 1, 0.3254902, 0, 1,
-1.529414, 0.4935775, -1.49489, 1, 0.3294118, 0, 1,
-1.521295, 0.2940546, 1.051469, 1, 0.3372549, 0, 1,
-1.514115, -0.4643149, -1.99198, 1, 0.3411765, 0, 1,
-1.514007, -0.3171115, -1.415544, 1, 0.3490196, 0, 1,
-1.501877, 1.337424, -0.8604195, 1, 0.3529412, 0, 1,
-1.498174, -0.4921538, -3.766209, 1, 0.3607843, 0, 1,
-1.486045, 1.070989, 0.5054963, 1, 0.3647059, 0, 1,
-1.484715, -0.5692444, -2.506328, 1, 0.372549, 0, 1,
-1.475088, -0.5551767, -2.468082, 1, 0.3764706, 0, 1,
-1.466832, -0.475745, 0.1256533, 1, 0.3843137, 0, 1,
-1.442388, -0.5473111, -2.681276, 1, 0.3882353, 0, 1,
-1.440832, 0.2399887, -1.727516, 1, 0.3960784, 0, 1,
-1.439923, 0.5682521, -0.20085, 1, 0.4039216, 0, 1,
-1.434443, -0.229787, -2.751803, 1, 0.4078431, 0, 1,
-1.433849, -0.5982285, -1.411391, 1, 0.4156863, 0, 1,
-1.418387, 1.39564, -1.210067, 1, 0.4196078, 0, 1,
-1.416961, 0.9932721, -0.7832921, 1, 0.427451, 0, 1,
-1.416833, 0.1973744, 0.6652648, 1, 0.4313726, 0, 1,
-1.410313, -1.028784, -2.908923, 1, 0.4392157, 0, 1,
-1.409933, 0.4346379, -1.240583, 1, 0.4431373, 0, 1,
-1.408296, -0.4220335, -1.42082, 1, 0.4509804, 0, 1,
-1.397888, 1.641325, -0.476357, 1, 0.454902, 0, 1,
-1.385574, 0.4292476, 0.8489392, 1, 0.4627451, 0, 1,
-1.380037, 0.07468788, -0.5277883, 1, 0.4666667, 0, 1,
-1.3772, -0.3666566, -1.503045, 1, 0.4745098, 0, 1,
-1.371744, 2.023463, -1.288969, 1, 0.4784314, 0, 1,
-1.359383, -1.353799, -3.188532, 1, 0.4862745, 0, 1,
-1.359037, -0.509303, -1.803462, 1, 0.4901961, 0, 1,
-1.354599, -0.6144524, -2.401514, 1, 0.4980392, 0, 1,
-1.321352, 0.5637913, -2.896207, 1, 0.5058824, 0, 1,
-1.320447, -0.07723722, -1.325209, 1, 0.509804, 0, 1,
-1.320271, -1.061351, -0.6949312, 1, 0.5176471, 0, 1,
-1.316804, 2.025389, 0.07976733, 1, 0.5215687, 0, 1,
-1.309308, -1.892364, -3.04011, 1, 0.5294118, 0, 1,
-1.30351, -0.3777474, -0.7730387, 1, 0.5333334, 0, 1,
-1.271533, -0.9851022, -2.374626, 1, 0.5411765, 0, 1,
-1.257955, 0.149431, -2.320506, 1, 0.5450981, 0, 1,
-1.257026, -0.927175, -1.956845, 1, 0.5529412, 0, 1,
-1.254034, 0.4815306, -2.471852, 1, 0.5568628, 0, 1,
-1.243996, -0.6146096, -1.902194, 1, 0.5647059, 0, 1,
-1.228858, 0.5357985, -2.33698, 1, 0.5686275, 0, 1,
-1.22515, -0.222756, -1.252053, 1, 0.5764706, 0, 1,
-1.216253, 0.4843155, -2.08479, 1, 0.5803922, 0, 1,
-1.214899, 0.4991979, -0.8417822, 1, 0.5882353, 0, 1,
-1.213079, 1.682151, 1.338484, 1, 0.5921569, 0, 1,
-1.208836, 0.4028807, -1.137208, 1, 0.6, 0, 1,
-1.206676, -0.02529033, -1.049546, 1, 0.6078432, 0, 1,
-1.203398, 0.7809768, -2.502007, 1, 0.6117647, 0, 1,
-1.191307, 0.07492161, -0.8651101, 1, 0.6196079, 0, 1,
-1.176132, 1.085667, 0.1293954, 1, 0.6235294, 0, 1,
-1.167083, -1.249068, -1.848457, 1, 0.6313726, 0, 1,
-1.16194, -0.8586982, -1.663841, 1, 0.6352941, 0, 1,
-1.159934, -0.9836595, -1.325719, 1, 0.6431373, 0, 1,
-1.157675, -1.154912, -1.612087, 1, 0.6470588, 0, 1,
-1.150959, 0.5551649, -0.7484424, 1, 0.654902, 0, 1,
-1.149731, -0.2738859, -0.8947067, 1, 0.6588235, 0, 1,
-1.139378, 0.4940405, -0.3102228, 1, 0.6666667, 0, 1,
-1.131308, -0.2803397, -2.448125, 1, 0.6705883, 0, 1,
-1.128663, -1.942456, -3.49513, 1, 0.6784314, 0, 1,
-1.12758, -0.6555114, -0.9477765, 1, 0.682353, 0, 1,
-1.119821, -0.667272, -3.771909, 1, 0.6901961, 0, 1,
-1.113668, -0.002780512, -1.725929, 1, 0.6941177, 0, 1,
-1.112141, -0.4892598, -1.409985, 1, 0.7019608, 0, 1,
-1.109626, 0.04004269, -0.007772195, 1, 0.7098039, 0, 1,
-1.109623, 0.9692346, 1.050387, 1, 0.7137255, 0, 1,
-1.087102, 0.3685518, -1.707614, 1, 0.7215686, 0, 1,
-1.083774, 0.2125215, -1.122516, 1, 0.7254902, 0, 1,
-1.079664, -2.386355, -2.483823, 1, 0.7333333, 0, 1,
-1.077464, -0.0998245, -1.322524, 1, 0.7372549, 0, 1,
-1.076796, -1.030285, -2.40103, 1, 0.7450981, 0, 1,
-1.068035, -0.5221663, -3.416483, 1, 0.7490196, 0, 1,
-1.066501, 0.05462133, -2.431153, 1, 0.7568628, 0, 1,
-1.062118, 2.424476, -0.2384368, 1, 0.7607843, 0, 1,
-1.060829, 0.140684, -1.407594, 1, 0.7686275, 0, 1,
-1.058959, 0.6013482, -3.595383, 1, 0.772549, 0, 1,
-1.054401, -1.239904, -1.250077, 1, 0.7803922, 0, 1,
-1.054041, -0.7923261, -1.857736, 1, 0.7843137, 0, 1,
-1.046651, 0.8359056, -1.863939, 1, 0.7921569, 0, 1,
-1.037982, -1.418311, -2.410376, 1, 0.7960784, 0, 1,
-1.03653, -0.7077864, -1.391499, 1, 0.8039216, 0, 1,
-1.036511, -2.317811, -2.984454, 1, 0.8117647, 0, 1,
-1.035181, 1.042388, -2.938166, 1, 0.8156863, 0, 1,
-1.016161, 0.004199533, -2.537076, 1, 0.8235294, 0, 1,
-1.014273, -0.1740411, -1.657601, 1, 0.827451, 0, 1,
-1.008415, -0.1290561, -1.168668, 1, 0.8352941, 0, 1,
-1.002674, 0.270595, -3.595931, 1, 0.8392157, 0, 1,
-0.9848769, 0.5431854, 1.670706, 1, 0.8470588, 0, 1,
-0.9781837, -0.8872315, -1.214037, 1, 0.8509804, 0, 1,
-0.9775215, 0.719796, 0.2286485, 1, 0.8588235, 0, 1,
-0.9733375, 1.274316, -2.223593, 1, 0.8627451, 0, 1,
-0.9715507, 0.9183888, 0.1965068, 1, 0.8705882, 0, 1,
-0.9691394, 0.001072039, -1.495198, 1, 0.8745098, 0, 1,
-0.9664986, -0.2293904, -0.7336812, 1, 0.8823529, 0, 1,
-0.9636816, 0.5255641, -1.483037, 1, 0.8862745, 0, 1,
-0.9631272, 0.3190923, -2.341185, 1, 0.8941177, 0, 1,
-0.9577471, 0.09906427, -1.324128, 1, 0.8980392, 0, 1,
-0.9570332, -1.056921, -1.469896, 1, 0.9058824, 0, 1,
-0.955779, 1.471478, -1.887087, 1, 0.9137255, 0, 1,
-0.9550517, -0.1474093, -2.358079, 1, 0.9176471, 0, 1,
-0.9535446, -0.4787272, -1.614268, 1, 0.9254902, 0, 1,
-0.9529703, 1.746209, 1.754278, 1, 0.9294118, 0, 1,
-0.950702, -0.09704039, -1.96643, 1, 0.9372549, 0, 1,
-0.9482012, 1.557329, 0.2409255, 1, 0.9411765, 0, 1,
-0.9472043, -0.6616564, -1.372684, 1, 0.9490196, 0, 1,
-0.9404852, -0.6021855, -2.071084, 1, 0.9529412, 0, 1,
-0.9397747, 0.3163871, -1.321051, 1, 0.9607843, 0, 1,
-0.9360147, 0.5190156, -2.358844, 1, 0.9647059, 0, 1,
-0.9325865, 0.6105821, -0.3119969, 1, 0.972549, 0, 1,
-0.9236126, 0.2029719, -1.189271, 1, 0.9764706, 0, 1,
-0.920569, 1.126755, -1.740345, 1, 0.9843137, 0, 1,
-0.9166048, 0.6901794, -0.8227884, 1, 0.9882353, 0, 1,
-0.9108569, -1.245064, -3.46021, 1, 0.9960784, 0, 1,
-0.8992867, 2.322397, -0.327421, 0.9960784, 1, 0, 1,
-0.8992297, 0.7638548, 0.1154828, 0.9921569, 1, 0, 1,
-0.8972518, 0.5964296, -0.5593902, 0.9843137, 1, 0, 1,
-0.8959501, 0.8731316, 0.06497721, 0.9803922, 1, 0, 1,
-0.886804, 0.7790359, -1.637256, 0.972549, 1, 0, 1,
-0.8842038, 1.250033, 0.6587861, 0.9686275, 1, 0, 1,
-0.8821698, 0.136548, -1.541693, 0.9607843, 1, 0, 1,
-0.8777402, -0.1445379, -1.263644, 0.9568627, 1, 0, 1,
-0.8735578, 1.117872, 0.6728856, 0.9490196, 1, 0, 1,
-0.8693135, -0.07509558, -1.57658, 0.945098, 1, 0, 1,
-0.866694, 0.2302583, -1.057542, 0.9372549, 1, 0, 1,
-0.865895, 1.01795, -0.5056045, 0.9333333, 1, 0, 1,
-0.8634148, -0.331154, -3.174529, 0.9254902, 1, 0, 1,
-0.8601817, -0.6203092, -1.423856, 0.9215686, 1, 0, 1,
-0.8568234, 1.021629, 0.8093348, 0.9137255, 1, 0, 1,
-0.8505622, -0.8311467, -1.985776, 0.9098039, 1, 0, 1,
-0.8494747, 0.135486, -1.599482, 0.9019608, 1, 0, 1,
-0.8470268, -2.257048, -2.720417, 0.8941177, 1, 0, 1,
-0.8459221, -0.1286572, -1.432536, 0.8901961, 1, 0, 1,
-0.8440768, -0.4772747, -1.854382, 0.8823529, 1, 0, 1,
-0.8364782, -0.5724102, -1.826954, 0.8784314, 1, 0, 1,
-0.831909, -0.4617281, -1.970906, 0.8705882, 1, 0, 1,
-0.8305213, -2.259152, -2.678278, 0.8666667, 1, 0, 1,
-0.819227, -0.7317305, -0.9013793, 0.8588235, 1, 0, 1,
-0.8179004, -3.596874, -2.532395, 0.854902, 1, 0, 1,
-0.81495, -2.006095, -4.023461, 0.8470588, 1, 0, 1,
-0.8147854, 1.300814, 0.06367441, 0.8431373, 1, 0, 1,
-0.799794, 0.3998313, -1.261527, 0.8352941, 1, 0, 1,
-0.7990233, -1.542068, -2.527437, 0.8313726, 1, 0, 1,
-0.7963917, -0.2856696, -0.8430882, 0.8235294, 1, 0, 1,
-0.795897, 1.231215, -1.539085, 0.8196079, 1, 0, 1,
-0.7875759, 0.5484238, 0.8413581, 0.8117647, 1, 0, 1,
-0.787452, -0.4963031, -3.059677, 0.8078431, 1, 0, 1,
-0.7835363, -0.5233284, -2.685472, 0.8, 1, 0, 1,
-0.7828928, 1.642823, 1.198956, 0.7921569, 1, 0, 1,
-0.7792674, 0.3757581, -1.175471, 0.7882353, 1, 0, 1,
-0.7754571, -0.3028926, -0.01044953, 0.7803922, 1, 0, 1,
-0.7745684, 1.378663, 2.265265, 0.7764706, 1, 0, 1,
-0.7744758, 0.3326634, -2.735896, 0.7686275, 1, 0, 1,
-0.7731367, -1.107629, -2.714744, 0.7647059, 1, 0, 1,
-0.7723199, -0.9952752, -2.694626, 0.7568628, 1, 0, 1,
-0.7689461, 1.856938, -1.003082, 0.7529412, 1, 0, 1,
-0.7675375, 0.6589685, -1.508846, 0.7450981, 1, 0, 1,
-0.7673436, 0.1381735, -0.1831236, 0.7411765, 1, 0, 1,
-0.7636684, 0.1959247, -1.306128, 0.7333333, 1, 0, 1,
-0.7595681, -0.5510284, -4.056489, 0.7294118, 1, 0, 1,
-0.7588189, -0.05575478, -1.748746, 0.7215686, 1, 0, 1,
-0.7561826, 0.02636501, -1.846183, 0.7176471, 1, 0, 1,
-0.7465398, 1.240453, -0.0133819, 0.7098039, 1, 0, 1,
-0.7366465, -0.1570183, -3.562466, 0.7058824, 1, 0, 1,
-0.735837, 0.162094, -2.432966, 0.6980392, 1, 0, 1,
-0.7340698, 0.3954588, -1.209657, 0.6901961, 1, 0, 1,
-0.7331236, 0.5835074, -2.069644, 0.6862745, 1, 0, 1,
-0.7326445, -0.3717133, -2.234354, 0.6784314, 1, 0, 1,
-0.7323942, 0.9033622, -0.07696614, 0.6745098, 1, 0, 1,
-0.7256389, 0.281261, -1.250499, 0.6666667, 1, 0, 1,
-0.7215934, -1.16284, -3.936699, 0.6627451, 1, 0, 1,
-0.720481, 1.910418, 1.127258, 0.654902, 1, 0, 1,
-0.7197508, -0.4597728, -2.82334, 0.6509804, 1, 0, 1,
-0.7160261, 1.008064, -1.862937, 0.6431373, 1, 0, 1,
-0.7085278, -0.2816671, -2.979389, 0.6392157, 1, 0, 1,
-0.7064682, 0.1522671, -1.308407, 0.6313726, 1, 0, 1,
-0.7063126, 2.377447, -0.1682031, 0.627451, 1, 0, 1,
-0.6967986, -1.499364, -3.014511, 0.6196079, 1, 0, 1,
-0.6924713, 0.5855569, 0.9021844, 0.6156863, 1, 0, 1,
-0.6907637, 0.1633863, -1.098647, 0.6078432, 1, 0, 1,
-0.6906667, 0.02392177, -1.047258, 0.6039216, 1, 0, 1,
-0.6772497, -0.007758374, -0.7497939, 0.5960785, 1, 0, 1,
-0.6716501, 1.926994, -1.593368, 0.5882353, 1, 0, 1,
-0.6642228, -0.6692561, -1.394611, 0.5843138, 1, 0, 1,
-0.6628264, -0.9704476, -1.899123, 0.5764706, 1, 0, 1,
-0.6585674, -0.820262, -2.181468, 0.572549, 1, 0, 1,
-0.6571834, 0.7791319, -0.4764517, 0.5647059, 1, 0, 1,
-0.6567442, 1.643378, -0.8041783, 0.5607843, 1, 0, 1,
-0.6552773, 1.817909, 0.3678474, 0.5529412, 1, 0, 1,
-0.6511065, -1.929399, -2.333283, 0.5490196, 1, 0, 1,
-0.6484507, -0.6527478, -3.881066, 0.5411765, 1, 0, 1,
-0.6440433, 0.6211107, -2.616394, 0.5372549, 1, 0, 1,
-0.6438319, -0.4799416, -0.7790094, 0.5294118, 1, 0, 1,
-0.6429309, -0.939107, -2.322441, 0.5254902, 1, 0, 1,
-0.6428911, 1.068315, -1.620944, 0.5176471, 1, 0, 1,
-0.6420184, -0.5913405, -3.268484, 0.5137255, 1, 0, 1,
-0.6352777, -0.5571321, -3.220556, 0.5058824, 1, 0, 1,
-0.6297228, 0.2264948, -2.82557, 0.5019608, 1, 0, 1,
-0.6230849, 1.570601, -1.531026, 0.4941176, 1, 0, 1,
-0.6192386, -0.5817927, -3.137677, 0.4862745, 1, 0, 1,
-0.6130717, 0.329019, -0.152591, 0.4823529, 1, 0, 1,
-0.6106345, 1.248598, -0.01307735, 0.4745098, 1, 0, 1,
-0.609666, 1.659699, -0.298702, 0.4705882, 1, 0, 1,
-0.6053845, 0.7073671, 1.591376, 0.4627451, 1, 0, 1,
-0.6042963, 1.291084, 0.2658946, 0.4588235, 1, 0, 1,
-0.6025853, -0.2999169, -2.850241, 0.4509804, 1, 0, 1,
-0.5971843, 0.2097395, -0.369747, 0.4470588, 1, 0, 1,
-0.5943117, 0.103765, -1.728962, 0.4392157, 1, 0, 1,
-0.5926849, -0.4802186, -2.835988, 0.4352941, 1, 0, 1,
-0.5871484, 0.2992273, 0.7179691, 0.427451, 1, 0, 1,
-0.5735068, 0.8714401, -0.1798095, 0.4235294, 1, 0, 1,
-0.5722308, 0.6608425, -2.209752, 0.4156863, 1, 0, 1,
-0.5713706, 1.200581, 0.0661464, 0.4117647, 1, 0, 1,
-0.5693318, -0.1375105, -1.228878, 0.4039216, 1, 0, 1,
-0.5664268, 0.2103864, -1.538681, 0.3960784, 1, 0, 1,
-0.5613343, 0.04581077, -1.701942, 0.3921569, 1, 0, 1,
-0.5600238, -0.5223949, -2.800242, 0.3843137, 1, 0, 1,
-0.5565947, 0.7278647, 0.2459185, 0.3803922, 1, 0, 1,
-0.5534824, -0.08777235, -3.697733, 0.372549, 1, 0, 1,
-0.5529769, 1.033473, 1.035063, 0.3686275, 1, 0, 1,
-0.5459326, 1.524428, 0.6526085, 0.3607843, 1, 0, 1,
-0.5423852, 0.8596528, 0.02612269, 0.3568628, 1, 0, 1,
-0.5367934, -0.6511917, -2.739932, 0.3490196, 1, 0, 1,
-0.5352128, -0.7347137, -5.568249, 0.345098, 1, 0, 1,
-0.5277355, -0.02762828, -3.809876, 0.3372549, 1, 0, 1,
-0.5223121, -0.5237275, -1.336278, 0.3333333, 1, 0, 1,
-0.5218531, -0.4769458, -4.20847, 0.3254902, 1, 0, 1,
-0.5205806, 0.3489775, 0.9099541, 0.3215686, 1, 0, 1,
-0.5167874, -0.1798632, -2.334715, 0.3137255, 1, 0, 1,
-0.5127511, 0.2434596, -2.219878, 0.3098039, 1, 0, 1,
-0.5119302, -0.8315079, -3.220683, 0.3019608, 1, 0, 1,
-0.5115555, -0.6986188, -3.748731, 0.2941177, 1, 0, 1,
-0.5103685, 0.1455863, -1.423387, 0.2901961, 1, 0, 1,
-0.5075148, -1.055943, -2.394378, 0.282353, 1, 0, 1,
-0.5040556, 0.3933438, -0.6655084, 0.2784314, 1, 0, 1,
-0.5005546, -0.1939143, -2.420904, 0.2705882, 1, 0, 1,
-0.4964839, 1.043375, 1.606725, 0.2666667, 1, 0, 1,
-0.4942521, 1.021923, 0.9347031, 0.2588235, 1, 0, 1,
-0.4937537, -0.1516948, -2.096987, 0.254902, 1, 0, 1,
-0.4818309, -0.720672, -3.604208, 0.2470588, 1, 0, 1,
-0.4809182, -0.4418202, -0.2206213, 0.2431373, 1, 0, 1,
-0.4795262, 0.6506376, -0.3427365, 0.2352941, 1, 0, 1,
-0.4779555, 0.8216031, -0.8949001, 0.2313726, 1, 0, 1,
-0.4656028, -1.296039, -1.518655, 0.2235294, 1, 0, 1,
-0.4601503, -1.111825, -2.597545, 0.2196078, 1, 0, 1,
-0.4598626, -1.105543, -4.402888, 0.2117647, 1, 0, 1,
-0.4590222, 0.7089948, -0.3838292, 0.2078431, 1, 0, 1,
-0.4561918, 0.5535148, -1.288711, 0.2, 1, 0, 1,
-0.4555535, -0.6379154, -2.589695, 0.1921569, 1, 0, 1,
-0.4454915, -0.7009619, -3.26832, 0.1882353, 1, 0, 1,
-0.4450634, 0.1157885, -1.25003, 0.1803922, 1, 0, 1,
-0.4433421, -0.1850703, -2.511932, 0.1764706, 1, 0, 1,
-0.4428923, -1.402071, -3.525264, 0.1686275, 1, 0, 1,
-0.4417277, 0.6319032, -1.912676, 0.1647059, 1, 0, 1,
-0.4387016, 1.276253, -0.3579833, 0.1568628, 1, 0, 1,
-0.4373059, -1.215685, -2.927164, 0.1529412, 1, 0, 1,
-0.4316464, -1.063111, -2.472432, 0.145098, 1, 0, 1,
-0.4311573, -0.9184964, -2.491371, 0.1411765, 1, 0, 1,
-0.4300158, 1.495589, -1.429801, 0.1333333, 1, 0, 1,
-0.4297573, 1.536141, 1.239218, 0.1294118, 1, 0, 1,
-0.4276646, 0.826143, -2.447096, 0.1215686, 1, 0, 1,
-0.4249791, -0.8496363, -3.467859, 0.1176471, 1, 0, 1,
-0.4246638, -1.400519, -2.73887, 0.1098039, 1, 0, 1,
-0.4237533, -2.610889, -3.6814, 0.1058824, 1, 0, 1,
-0.4213039, 0.04706284, 0.3542846, 0.09803922, 1, 0, 1,
-0.4185473, -1.853018, -2.691152, 0.09019608, 1, 0, 1,
-0.4147955, 0.4523498, -0.9607608, 0.08627451, 1, 0, 1,
-0.414169, -0.8010245, -2.655344, 0.07843138, 1, 0, 1,
-0.4141123, -0.7806494, -2.10778, 0.07450981, 1, 0, 1,
-0.4136928, -0.3370789, -2.482432, 0.06666667, 1, 0, 1,
-0.4120106, 0.2078641, 0.7529297, 0.0627451, 1, 0, 1,
-0.4096961, -0.2874487, -0.9432768, 0.05490196, 1, 0, 1,
-0.409692, -1.022851, -1.720828, 0.05098039, 1, 0, 1,
-0.4077127, -1.224465, -1.706349, 0.04313726, 1, 0, 1,
-0.3892338, 0.5302405, -2.115657, 0.03921569, 1, 0, 1,
-0.3835912, 0.1417048, -0.4218785, 0.03137255, 1, 0, 1,
-0.3825427, 0.08368258, 0.1795293, 0.02745098, 1, 0, 1,
-0.379165, 1.121294, -0.5148432, 0.01960784, 1, 0, 1,
-0.3778629, -0.8225387, -2.697699, 0.01568628, 1, 0, 1,
-0.3759679, -0.7712569, -2.065966, 0.007843138, 1, 0, 1,
-0.3663868, -1.273506, -3.203186, 0.003921569, 1, 0, 1,
-0.3661039, 0.9573292, -1.309646, 0, 1, 0.003921569, 1,
-0.3628749, 0.05055432, -1.662864, 0, 1, 0.01176471, 1,
-0.3570698, 1.772026, 0.9210583, 0, 1, 0.01568628, 1,
-0.3556628, 0.7974803, -1.704926, 0, 1, 0.02352941, 1,
-0.3509836, -2.117846, -2.59117, 0, 1, 0.02745098, 1,
-0.3503199, 1.865335, 0.7077616, 0, 1, 0.03529412, 1,
-0.3498094, 0.8201444, -1.027661, 0, 1, 0.03921569, 1,
-0.3468508, -1.353071, -4.600924, 0, 1, 0.04705882, 1,
-0.3431307, 1.198884, -1.156052, 0, 1, 0.05098039, 1,
-0.342528, -0.9547547, -3.001513, 0, 1, 0.05882353, 1,
-0.341586, 0.4963238, -1.066496, 0, 1, 0.0627451, 1,
-0.3393086, 0.5683552, -0.1362964, 0, 1, 0.07058824, 1,
-0.3355564, 2.086803, -1.082124, 0, 1, 0.07450981, 1,
-0.3329182, 0.04363161, -1.581924, 0, 1, 0.08235294, 1,
-0.3289065, -0.9991661, -4.220289, 0, 1, 0.08627451, 1,
-0.3260161, -0.2136097, -2.066406, 0, 1, 0.09411765, 1,
-0.3256299, -1.943227, -3.546987, 0, 1, 0.1019608, 1,
-0.3197716, -0.7378387, -2.449189, 0, 1, 0.1058824, 1,
-0.3142393, 0.8442031, 1.14943, 0, 1, 0.1137255, 1,
-0.3138993, -0.1183939, -2.145316, 0, 1, 0.1176471, 1,
-0.3121617, 1.447428, -0.7905868, 0, 1, 0.1254902, 1,
-0.3119147, 1.250523, -0.7733661, 0, 1, 0.1294118, 1,
-0.3090001, 0.0003700695, -0.1825873, 0, 1, 0.1372549, 1,
-0.3076785, 0.4582381, -2.628786, 0, 1, 0.1411765, 1,
-0.3063249, 0.9240505, 0.20405, 0, 1, 0.1490196, 1,
-0.3016614, 2.515965, -0.8674249, 0, 1, 0.1529412, 1,
-0.2987495, -0.2036205, -1.671684, 0, 1, 0.1607843, 1,
-0.2985089, -0.3480057, -3.533203, 0, 1, 0.1647059, 1,
-0.2980646, -1.027308, -2.117216, 0, 1, 0.172549, 1,
-0.2973559, 0.290019, -1.79559, 0, 1, 0.1764706, 1,
-0.2907906, -0.0116354, -1.862237, 0, 1, 0.1843137, 1,
-0.286982, -1.289877, -1.935391, 0, 1, 0.1882353, 1,
-0.2836468, 0.531944, -0.7011994, 0, 1, 0.1960784, 1,
-0.2835855, 0.9814985, -1.135928, 0, 1, 0.2039216, 1,
-0.2831618, -0.4974824, -1.581336, 0, 1, 0.2078431, 1,
-0.2804911, 1.265015, -0.02389237, 0, 1, 0.2156863, 1,
-0.2796925, 0.5623251, -1.376363, 0, 1, 0.2196078, 1,
-0.2771847, -1.839477, -3.20575, 0, 1, 0.227451, 1,
-0.2766583, -0.835594, -3.117203, 0, 1, 0.2313726, 1,
-0.2750467, -0.03112245, -0.1788404, 0, 1, 0.2392157, 1,
-0.2746787, 1.819514, 0.2859248, 0, 1, 0.2431373, 1,
-0.2735955, 0.4522424, -0.4994305, 0, 1, 0.2509804, 1,
-0.2735654, -0.6233591, -3.371278, 0, 1, 0.254902, 1,
-0.2685876, 0.2629491, -1.039969, 0, 1, 0.2627451, 1,
-0.267615, -0.3867424, -1.707501, 0, 1, 0.2666667, 1,
-0.2656551, -0.1169103, -2.817408, 0, 1, 0.2745098, 1,
-0.2639023, 0.06065235, -0.4519598, 0, 1, 0.2784314, 1,
-0.2608309, 0.09625529, 0.8054377, 0, 1, 0.2862745, 1,
-0.2492248, 0.5823763, -1.572006, 0, 1, 0.2901961, 1,
-0.2491218, -0.6896675, -2.443083, 0, 1, 0.2980392, 1,
-0.2487897, 0.5487303, 0.2474951, 0, 1, 0.3058824, 1,
-0.2465304, -1.684842, -3.727146, 0, 1, 0.3098039, 1,
-0.2429633, -0.5101021, -4.07502, 0, 1, 0.3176471, 1,
-0.2429039, -0.1105799, -2.653163, 0, 1, 0.3215686, 1,
-0.2411301, 0.1745498, -0.6343705, 0, 1, 0.3294118, 1,
-0.2395862, -0.6144897, -2.649818, 0, 1, 0.3333333, 1,
-0.235767, -0.9144282, -2.268428, 0, 1, 0.3411765, 1,
-0.2355497, -0.7741975, -2.400332, 0, 1, 0.345098, 1,
-0.2341669, 0.2585142, -0.2482489, 0, 1, 0.3529412, 1,
-0.2295702, 0.003368369, -2.076083, 0, 1, 0.3568628, 1,
-0.2217995, -0.2333011, -2.232295, 0, 1, 0.3647059, 1,
-0.2183458, 0.167463, -1.737686, 0, 1, 0.3686275, 1,
-0.2137153, 1.68043, 0.4953734, 0, 1, 0.3764706, 1,
-0.2132574, -0.484919, -3.204324, 0, 1, 0.3803922, 1,
-0.2087298, 0.1575345, -0.5950891, 0, 1, 0.3882353, 1,
-0.2083233, 0.2719197, 0.7121936, 0, 1, 0.3921569, 1,
-0.2052969, 0.6220317, 0.5056792, 0, 1, 0.4, 1,
-0.2031709, 0.6897728, -1.020129, 0, 1, 0.4078431, 1,
-0.1934015, 0.976655, 2.53767, 0, 1, 0.4117647, 1,
-0.1912935, 0.63797, 1.253208, 0, 1, 0.4196078, 1,
-0.1908289, -0.1455283, -1.357155, 0, 1, 0.4235294, 1,
-0.1897157, -0.9826395, -3.206256, 0, 1, 0.4313726, 1,
-0.1871144, 0.2892245, -0.1215027, 0, 1, 0.4352941, 1,
-0.1854151, -1.743193, -1.152892, 0, 1, 0.4431373, 1,
-0.1823552, -0.8735581, -3.864403, 0, 1, 0.4470588, 1,
-0.1760018, 1.40223, -0.8187728, 0, 1, 0.454902, 1,
-0.1753314, -0.8267654, -2.962461, 0, 1, 0.4588235, 1,
-0.1747421, -0.457207, -3.13114, 0, 1, 0.4666667, 1,
-0.1744577, -0.742843, -1.895155, 0, 1, 0.4705882, 1,
-0.1682565, -2.230575, -4.041631, 0, 1, 0.4784314, 1,
-0.1655863, -0.9519369, -3.010503, 0, 1, 0.4823529, 1,
-0.1605686, 0.6063073, 1.22414, 0, 1, 0.4901961, 1,
-0.1571216, 0.299183, -0.2754043, 0, 1, 0.4941176, 1,
-0.1545816, -1.808791, -3.932797, 0, 1, 0.5019608, 1,
-0.1514746, -1.71152, -3.212547, 0, 1, 0.509804, 1,
-0.1432415, 0.6258883, -0.4699712, 0, 1, 0.5137255, 1,
-0.1423793, 0.7333163, -1.036598, 0, 1, 0.5215687, 1,
-0.1415449, 0.1677333, -2.107187, 0, 1, 0.5254902, 1,
-0.1404075, -1.176224, -3.334049, 0, 1, 0.5333334, 1,
-0.1401587, 2.17464, -1.812668, 0, 1, 0.5372549, 1,
-0.1389355, 0.6251413, -1.364338, 0, 1, 0.5450981, 1,
-0.1384911, 1.354001, -0.6676505, 0, 1, 0.5490196, 1,
-0.1357421, 0.04013392, -1.083772, 0, 1, 0.5568628, 1,
-0.1326194, 0.9276218, 0.151057, 0, 1, 0.5607843, 1,
-0.1309452, 0.927058, -0.7155358, 0, 1, 0.5686275, 1,
-0.1308145, -0.7988593, -2.753191, 0, 1, 0.572549, 1,
-0.1300768, -0.1586654, -2.424166, 0, 1, 0.5803922, 1,
-0.1296699, -0.6641785, -0.2357232, 0, 1, 0.5843138, 1,
-0.1285936, -1.389104, -4.496136, 0, 1, 0.5921569, 1,
-0.127402, -0.9258217, -2.623012, 0, 1, 0.5960785, 1,
-0.1267172, -1.158424, -2.595352, 0, 1, 0.6039216, 1,
-0.1260073, -0.03407912, -1.715277, 0, 1, 0.6117647, 1,
-0.1230457, 1.901053, -1.4188, 0, 1, 0.6156863, 1,
-0.1216178, 0.6028195, -0.5078853, 0, 1, 0.6235294, 1,
-0.1140902, 0.9606388, 0.7549126, 0, 1, 0.627451, 1,
-0.1111491, -0.1738921, -0.6329405, 0, 1, 0.6352941, 1,
-0.1100062, -0.9912378, -2.191384, 0, 1, 0.6392157, 1,
-0.1088031, 0.1221575, -1.461691, 0, 1, 0.6470588, 1,
-0.1028696, 0.9702948, 0.5873204, 0, 1, 0.6509804, 1,
-0.1014267, -1.821728, -4.278568, 0, 1, 0.6588235, 1,
-0.09977768, 0.6280192, -0.9123443, 0, 1, 0.6627451, 1,
-0.09962519, 0.5252832, -0.647261, 0, 1, 0.6705883, 1,
-0.0987019, -0.3148238, -2.692728, 0, 1, 0.6745098, 1,
-0.09057291, -0.1315738, -2.837025, 0, 1, 0.682353, 1,
-0.08878178, -0.5424757, -2.852025, 0, 1, 0.6862745, 1,
-0.08440223, -0.5183075, -3.241267, 0, 1, 0.6941177, 1,
-0.08321496, -0.9816039, -1.703549, 0, 1, 0.7019608, 1,
-0.08263721, 0.6312231, 0.4574141, 0, 1, 0.7058824, 1,
-0.06568418, -0.1497484, -2.45241, 0, 1, 0.7137255, 1,
-0.0647249, -0.7548048, -4.944808, 0, 1, 0.7176471, 1,
-0.06175252, -2.436042, -2.180634, 0, 1, 0.7254902, 1,
-0.05941289, -0.4140452, -2.192795, 0, 1, 0.7294118, 1,
-0.05868345, 1.411525, 1.205862, 0, 1, 0.7372549, 1,
-0.05272878, 0.915543, 1.54288, 0, 1, 0.7411765, 1,
-0.05247573, 0.3793043, -0.9184844, 0, 1, 0.7490196, 1,
-0.05063887, -0.09515902, -1.791757, 0, 1, 0.7529412, 1,
-0.04976442, -1.507558, -2.885311, 0, 1, 0.7607843, 1,
-0.04497084, 0.6089171, 1.276877, 0, 1, 0.7647059, 1,
-0.04110753, 1.841192, 0.3867619, 0, 1, 0.772549, 1,
-0.0352595, -0.3648831, -2.928609, 0, 1, 0.7764706, 1,
-0.03466275, -0.1823736, -2.651275, 0, 1, 0.7843137, 1,
-0.03248036, -1.107611, -2.922999, 0, 1, 0.7882353, 1,
-0.03165084, -1.054852, -3.082349, 0, 1, 0.7960784, 1,
-0.03053057, 1.137175, -0.09188099, 0, 1, 0.8039216, 1,
-0.03023896, 0.55678, 0.8538262, 0, 1, 0.8078431, 1,
-0.02996379, -0.6023382, -2.442514, 0, 1, 0.8156863, 1,
-0.02645084, -1.491904, -2.837579, 0, 1, 0.8196079, 1,
-0.02544271, -0.526357, -3.853698, 0, 1, 0.827451, 1,
-0.01919569, 0.0867086, 0.5175681, 0, 1, 0.8313726, 1,
-0.01917387, -1.657257, -4.202757, 0, 1, 0.8392157, 1,
-0.01794043, -0.01242813, -1.561064, 0, 1, 0.8431373, 1,
-0.01339014, -0.6710855, -3.857036, 0, 1, 0.8509804, 1,
-0.01332855, 0.7643397, -1.301733, 0, 1, 0.854902, 1,
-0.006735032, -1.41902, -3.481444, 0, 1, 0.8627451, 1,
-0.005495874, -1.452366, -0.8315792, 0, 1, 0.8666667, 1,
-0.004564693, 0.03599634, 0.1372889, 0, 1, 0.8745098, 1,
-0.003902925, 0.3406059, 0.06313936, 0, 1, 0.8784314, 1,
-0.001157837, 1.47823, -1.442549, 0, 1, 0.8862745, 1,
0.00718202, 0.9203415, -0.4330217, 0, 1, 0.8901961, 1,
0.007283217, 1.124473, -0.05421113, 0, 1, 0.8980392, 1,
0.008223241, -0.6811088, 2.980216, 0, 1, 0.9058824, 1,
0.008561233, -1.094542, 2.428056, 0, 1, 0.9098039, 1,
0.01302837, -0.1822495, 2.769207, 0, 1, 0.9176471, 1,
0.01394306, -0.1831131, 3.170575, 0, 1, 0.9215686, 1,
0.01642437, 0.3653598, -0.5201912, 0, 1, 0.9294118, 1,
0.01655331, 0.3656482, 0.6299764, 0, 1, 0.9333333, 1,
0.01951733, 0.01654116, 1.3828, 0, 1, 0.9411765, 1,
0.01958873, 0.8021601, 0.1164575, 0, 1, 0.945098, 1,
0.02121665, 0.3608895, 1.929867, 0, 1, 0.9529412, 1,
0.0222169, -0.3333413, 4.247437, 0, 1, 0.9568627, 1,
0.0254109, 0.3119451, 1.595225, 0, 1, 0.9647059, 1,
0.02668678, 0.2158134, -1.207435, 0, 1, 0.9686275, 1,
0.02670905, -0.4009434, 2.763298, 0, 1, 0.9764706, 1,
0.02794067, 0.4831938, -0.3106561, 0, 1, 0.9803922, 1,
0.02941724, 0.7693894, 1.061158, 0, 1, 0.9882353, 1,
0.02960082, -0.6053385, 2.559233, 0, 1, 0.9921569, 1,
0.0345794, -1.380737, 4.593172, 0, 1, 1, 1,
0.03527604, 1.303445, 1.421867, 0, 0.9921569, 1, 1,
0.04045495, 0.3348384, -0.8938935, 0, 0.9882353, 1, 1,
0.04384783, 0.04234275, 0.1661069, 0, 0.9803922, 1, 1,
0.04678515, -1.806885, 4.01549, 0, 0.9764706, 1, 1,
0.04719757, -0.2621183, 3.880747, 0, 0.9686275, 1, 1,
0.04846476, -0.4802146, 2.594288, 0, 0.9647059, 1, 1,
0.04983134, 1.496195, -0.4745272, 0, 0.9568627, 1, 1,
0.05014341, -0.668802, 4.078321, 0, 0.9529412, 1, 1,
0.05255147, 0.2756957, 0.1474843, 0, 0.945098, 1, 1,
0.0534182, -0.5544697, 2.872519, 0, 0.9411765, 1, 1,
0.06298101, -0.211447, 2.81721, 0, 0.9333333, 1, 1,
0.06722796, -0.7544448, 3.267733, 0, 0.9294118, 1, 1,
0.06877665, 0.6213027, 0.1612648, 0, 0.9215686, 1, 1,
0.07272319, 0.2202183, 0.9329206, 0, 0.9176471, 1, 1,
0.07557578, 1.716818, 1.099468, 0, 0.9098039, 1, 1,
0.07661615, 1.242571, -1.370724, 0, 0.9058824, 1, 1,
0.07777867, 1.438915, 1.093126, 0, 0.8980392, 1, 1,
0.07928672, 0.750003, -0.4083903, 0, 0.8901961, 1, 1,
0.07942446, 0.6330494, -1.055169, 0, 0.8862745, 1, 1,
0.08675627, 1.245546, 0.7554103, 0, 0.8784314, 1, 1,
0.09048638, 1.45779, 1.249302, 0, 0.8745098, 1, 1,
0.09170176, 0.9818271, 0.7774579, 0, 0.8666667, 1, 1,
0.103592, 1.232587, 0.2361128, 0, 0.8627451, 1, 1,
0.1150444, -0.559018, 4.151499, 0, 0.854902, 1, 1,
0.1282679, -1.330467, 4.045466, 0, 0.8509804, 1, 1,
0.1282845, -2.196552, 2.720984, 0, 0.8431373, 1, 1,
0.132949, 0.2817315, 0.2741496, 0, 0.8392157, 1, 1,
0.1356753, -0.3390249, 1.125374, 0, 0.8313726, 1, 1,
0.1387686, -0.3053126, 3.381103, 0, 0.827451, 1, 1,
0.1404631, 0.6795373, -0.6147287, 0, 0.8196079, 1, 1,
0.1416511, 0.04223423, 1.858765, 0, 0.8156863, 1, 1,
0.1419929, -0.7688849, 1.894175, 0, 0.8078431, 1, 1,
0.1429404, 0.3677878, 0.1749877, 0, 0.8039216, 1, 1,
0.1430077, -1.059249, 4.215803, 0, 0.7960784, 1, 1,
0.1432472, -0.08228111, 1.382853, 0, 0.7882353, 1, 1,
0.144656, -0.7388837, 0.7886032, 0, 0.7843137, 1, 1,
0.1447683, -0.6837511, 2.572775, 0, 0.7764706, 1, 1,
0.1466991, 0.8517591, 0.1571964, 0, 0.772549, 1, 1,
0.1472293, -0.1845309, 1.752478, 0, 0.7647059, 1, 1,
0.1501755, -0.003859656, 1.703695, 0, 0.7607843, 1, 1,
0.1508124, -0.4171483, 3.137736, 0, 0.7529412, 1, 1,
0.1519402, 0.8871337, -1.787099, 0, 0.7490196, 1, 1,
0.1579795, 0.3464557, 1.392508, 0, 0.7411765, 1, 1,
0.1588475, 0.5816349, 1.136188, 0, 0.7372549, 1, 1,
0.161639, 0.3275304, 1.430189, 0, 0.7294118, 1, 1,
0.1619622, 1.016297, 1.550261, 0, 0.7254902, 1, 1,
0.1634312, 0.06700981, 1.639366, 0, 0.7176471, 1, 1,
0.1643037, -1.579109, 4.598109, 0, 0.7137255, 1, 1,
0.1647559, 1.476233, -0.03969129, 0, 0.7058824, 1, 1,
0.1649145, 1.61675, -0.2946028, 0, 0.6980392, 1, 1,
0.1673422, 1.054362, 0.3352906, 0, 0.6941177, 1, 1,
0.1683655, 1.347948, -0.5543073, 0, 0.6862745, 1, 1,
0.1702673, -1.503155, 1.808861, 0, 0.682353, 1, 1,
0.1717039, 0.02113134, 1.426378, 0, 0.6745098, 1, 1,
0.1728129, 0.22187, 1.348687, 0, 0.6705883, 1, 1,
0.1746123, -0.4080695, 3.709099, 0, 0.6627451, 1, 1,
0.1775646, -1.680296, 1.92131, 0, 0.6588235, 1, 1,
0.1836638, -1.169398, 1.059195, 0, 0.6509804, 1, 1,
0.1839677, 0.0298443, 2.250709, 0, 0.6470588, 1, 1,
0.1858418, 1.559603, -0.6341876, 0, 0.6392157, 1, 1,
0.1862439, 0.6477598, 0.06103852, 0, 0.6352941, 1, 1,
0.1936826, 0.6988333, -0.3899822, 0, 0.627451, 1, 1,
0.1942219, -1.476838, 3.720998, 0, 0.6235294, 1, 1,
0.196771, 0.978522, 0.57361, 0, 0.6156863, 1, 1,
0.1984358, 0.1338072, 0.8075357, 0, 0.6117647, 1, 1,
0.20008, 0.6387908, -0.7631766, 0, 0.6039216, 1, 1,
0.2038614, -1.275084, 4.363455, 0, 0.5960785, 1, 1,
0.2091986, -0.1414849, 2.895538, 0, 0.5921569, 1, 1,
0.2155161, -0.1056014, 1.528979, 0, 0.5843138, 1, 1,
0.2178646, 1.005554, -2.27386, 0, 0.5803922, 1, 1,
0.2204801, 0.6364244, 0.4312857, 0, 0.572549, 1, 1,
0.2220243, 0.4348605, 1.839736, 0, 0.5686275, 1, 1,
0.2284985, -1.87298, 1.802879, 0, 0.5607843, 1, 1,
0.2298466, -0.00887336, 1.956993, 0, 0.5568628, 1, 1,
0.2300809, -0.3188727, 2.880325, 0, 0.5490196, 1, 1,
0.2355309, 0.752592, -0.7253593, 0, 0.5450981, 1, 1,
0.2393792, -2.14234, 3.451312, 0, 0.5372549, 1, 1,
0.240191, -0.2980344, 1.983228, 0, 0.5333334, 1, 1,
0.2433504, 1.026699, 0.6068742, 0, 0.5254902, 1, 1,
0.2480673, 0.4673815, 1.100378, 0, 0.5215687, 1, 1,
0.2563685, 0.4047755, -0.2435645, 0, 0.5137255, 1, 1,
0.2593006, -1.637011, 2.7393, 0, 0.509804, 1, 1,
0.2600402, 0.2727865, 0.006340584, 0, 0.5019608, 1, 1,
0.2655517, 1.291327, -0.8494872, 0, 0.4941176, 1, 1,
0.2686975, 1.496177, 1.075167, 0, 0.4901961, 1, 1,
0.2696227, -0.07567508, 2.233808, 0, 0.4823529, 1, 1,
0.2726097, 0.5152192, 0.008760679, 0, 0.4784314, 1, 1,
0.2746776, 1.333461, -1.813543, 0, 0.4705882, 1, 1,
0.2780537, -0.1291865, 0.5877053, 0, 0.4666667, 1, 1,
0.2785356, -0.1013222, 2.628426, 0, 0.4588235, 1, 1,
0.2813317, 2.098882, 1.503553, 0, 0.454902, 1, 1,
0.2825286, -1.048074, 2.763754, 0, 0.4470588, 1, 1,
0.2828034, 0.335406, 0.9444909, 0, 0.4431373, 1, 1,
0.2896937, 0.5124781, 0.02986058, 0, 0.4352941, 1, 1,
0.2967442, -0.4565043, 3.733234, 0, 0.4313726, 1, 1,
0.298784, -1.90164, 2.696861, 0, 0.4235294, 1, 1,
0.2991014, 1.523954, 0.06807733, 0, 0.4196078, 1, 1,
0.3003868, -0.3749818, 0.8449069, 0, 0.4117647, 1, 1,
0.301055, 0.2423484, 0.4110855, 0, 0.4078431, 1, 1,
0.3016906, 1.858966, -1.092958, 0, 0.4, 1, 1,
0.3021306, 1.832705, -1.082599, 0, 0.3921569, 1, 1,
0.3041877, -0.5979286, 2.957301, 0, 0.3882353, 1, 1,
0.3046547, 1.452757, 0.5481338, 0, 0.3803922, 1, 1,
0.3059831, 0.4288108, 0.3414145, 0, 0.3764706, 1, 1,
0.3064943, -0.09296805, 2.664789, 0, 0.3686275, 1, 1,
0.3078814, 1.002557, 0.5965677, 0, 0.3647059, 1, 1,
0.3082435, 2.31298, -1.633828, 0, 0.3568628, 1, 1,
0.3111063, 0.1180986, 0.3468229, 0, 0.3529412, 1, 1,
0.3128256, 0.8540002, -0.4619917, 0, 0.345098, 1, 1,
0.3186001, -0.1908713, 1.937627, 0, 0.3411765, 1, 1,
0.3224543, 0.1114579, 1.02656, 0, 0.3333333, 1, 1,
0.3232938, -0.008148248, 1.226918, 0, 0.3294118, 1, 1,
0.3238735, -1.62611, 4.789323, 0, 0.3215686, 1, 1,
0.3267511, 1.220178, -0.9672769, 0, 0.3176471, 1, 1,
0.3324048, -1.747982, 3.741132, 0, 0.3098039, 1, 1,
0.3332746, 1.591149, 0.382216, 0, 0.3058824, 1, 1,
0.3338807, 0.003876685, 2.027808, 0, 0.2980392, 1, 1,
0.3340912, 1.955819, -0.4677714, 0, 0.2901961, 1, 1,
0.3354244, 1.945314, 1.006469, 0, 0.2862745, 1, 1,
0.3486894, 1.678153, -0.2350885, 0, 0.2784314, 1, 1,
0.3499111, -0.5283251, 2.428294, 0, 0.2745098, 1, 1,
0.3503185, 0.3282675, -0.2733639, 0, 0.2666667, 1, 1,
0.3512861, 0.7201057, 0.646134, 0, 0.2627451, 1, 1,
0.3521949, 0.6720154, -0.331759, 0, 0.254902, 1, 1,
0.3578227, 0.4217829, 1.818122, 0, 0.2509804, 1, 1,
0.3587091, -1.571277, 3.303251, 0, 0.2431373, 1, 1,
0.3720021, -1.067177, 4.536418, 0, 0.2392157, 1, 1,
0.3752574, -0.5728775, 4.595859, 0, 0.2313726, 1, 1,
0.3755344, -1.667612, 3.259644, 0, 0.227451, 1, 1,
0.3776394, 0.7428548, 0.5762588, 0, 0.2196078, 1, 1,
0.3804616, -1.718734, 2.946416, 0, 0.2156863, 1, 1,
0.3839634, -0.3638753, 2.827486, 0, 0.2078431, 1, 1,
0.3863422, -1.42852, 3.218879, 0, 0.2039216, 1, 1,
0.3871881, -0.08342075, 1.325482, 0, 0.1960784, 1, 1,
0.3914388, -0.660478, 3.414898, 0, 0.1882353, 1, 1,
0.3914717, -0.4385842, 0.9433922, 0, 0.1843137, 1, 1,
0.3936285, -0.1767363, 2.825845, 0, 0.1764706, 1, 1,
0.3991652, 1.199861, -0.4570395, 0, 0.172549, 1, 1,
0.4005442, -0.3594107, 2.462672, 0, 0.1647059, 1, 1,
0.4022172, -1.982632, 2.944516, 0, 0.1607843, 1, 1,
0.4056808, 1.26758, 0.9322588, 0, 0.1529412, 1, 1,
0.4074251, 1.550178, 0.9878758, 0, 0.1490196, 1, 1,
0.4077041, 0.8375897, 0.872177, 0, 0.1411765, 1, 1,
0.4114777, -0.8500641, 1.674353, 0, 0.1372549, 1, 1,
0.4152255, -1.659262, 1.72526, 0, 0.1294118, 1, 1,
0.4169103, 0.8140142, 0.7074555, 0, 0.1254902, 1, 1,
0.417769, -0.4224131, 2.39107, 0, 0.1176471, 1, 1,
0.4195915, -0.7539389, 2.623456, 0, 0.1137255, 1, 1,
0.4239606, -1.22429, 4.374486, 0, 0.1058824, 1, 1,
0.4241526, 0.4165837, 1.011992, 0, 0.09803922, 1, 1,
0.4258218, -0.9222311, 1.978219, 0, 0.09411765, 1, 1,
0.4316197, -1.344347, 1.187908, 0, 0.08627451, 1, 1,
0.4331239, -0.6753505, 4.028157, 0, 0.08235294, 1, 1,
0.4353946, -1.144757, 3.045727, 0, 0.07450981, 1, 1,
0.4367805, 0.0579182, 0.7323546, 0, 0.07058824, 1, 1,
0.4368308, 0.1957434, 0.1650003, 0, 0.0627451, 1, 1,
0.4374665, -0.8280614, 2.703001, 0, 0.05882353, 1, 1,
0.4388604, 0.2119091, -0.01682921, 0, 0.05098039, 1, 1,
0.4394609, -2.071484, 3.613276, 0, 0.04705882, 1, 1,
0.4413674, -1.027116, 2.861877, 0, 0.03921569, 1, 1,
0.4473059, -0.06209312, 0.2719187, 0, 0.03529412, 1, 1,
0.4494053, 1.723481, -1.254203, 0, 0.02745098, 1, 1,
0.4503666, -0.4380821, 2.130277, 0, 0.02352941, 1, 1,
0.4513472, -1.759249, 3.88722, 0, 0.01568628, 1, 1,
0.4540154, -0.4582728, 1.964436, 0, 0.01176471, 1, 1,
0.4541635, 0.1020118, -0.4480571, 0, 0.003921569, 1, 1,
0.4550012, 0.1426239, 1.201194, 0.003921569, 0, 1, 1,
0.456083, -0.9383564, 3.501626, 0.007843138, 0, 1, 1,
0.4562615, -0.4469745, 2.738507, 0.01568628, 0, 1, 1,
0.457154, 0.2458871, 0.7438912, 0.01960784, 0, 1, 1,
0.4627876, 0.9770949, 1.225643, 0.02745098, 0, 1, 1,
0.464002, 0.7756299, 0.2624621, 0.03137255, 0, 1, 1,
0.4648603, -1.429727, 1.97366, 0.03921569, 0, 1, 1,
0.4649393, 2.062424, -0.3051494, 0.04313726, 0, 1, 1,
0.4689254, 0.4190419, -0.04917726, 0.05098039, 0, 1, 1,
0.4716498, -0.5801226, 2.149338, 0.05490196, 0, 1, 1,
0.475734, -1.171504, 3.294022, 0.0627451, 0, 1, 1,
0.4789501, 0.4364931, 2.132041, 0.06666667, 0, 1, 1,
0.479798, 0.1572104, 1.128526, 0.07450981, 0, 1, 1,
0.4805644, 1.582257, 0.2072606, 0.07843138, 0, 1, 1,
0.4833117, -0.5686751, 2.495924, 0.08627451, 0, 1, 1,
0.4847559, 0.02931037, 0.1236981, 0.09019608, 0, 1, 1,
0.4852714, 1.57852, 0.3903322, 0.09803922, 0, 1, 1,
0.4873696, -0.2072393, 1.369459, 0.1058824, 0, 1, 1,
0.4884174, -0.795432, 3.443479, 0.1098039, 0, 1, 1,
0.4884291, -1.30667, 3.226543, 0.1176471, 0, 1, 1,
0.4894114, -0.5501236, 1.670148, 0.1215686, 0, 1, 1,
0.4898605, 0.1389188, 1.743631, 0.1294118, 0, 1, 1,
0.4909866, -0.1490914, 2.860459, 0.1333333, 0, 1, 1,
0.4923767, -0.7378629, 3.24444, 0.1411765, 0, 1, 1,
0.500335, -1.342492, 3.80683, 0.145098, 0, 1, 1,
0.5042562, 0.7806495, 0.2821724, 0.1529412, 0, 1, 1,
0.5067417, 0.09933991, 0.7582027, 0.1568628, 0, 1, 1,
0.5134193, 1.32226, -1.326368, 0.1647059, 0, 1, 1,
0.5160674, -1.157527, 0.4696541, 0.1686275, 0, 1, 1,
0.5163128, -0.3402528, 1.216289, 0.1764706, 0, 1, 1,
0.516619, -0.3516113, 0.6950397, 0.1803922, 0, 1, 1,
0.5215657, 0.5656351, 1.089136, 0.1882353, 0, 1, 1,
0.5218264, 2.417878, -0.9439671, 0.1921569, 0, 1, 1,
0.523918, -1.484478, 1.603675, 0.2, 0, 1, 1,
0.5246239, 1.994382, 0.1559033, 0.2078431, 0, 1, 1,
0.5275398, -1.292773, 4.284029, 0.2117647, 0, 1, 1,
0.5282383, 1.128533, 1.586186, 0.2196078, 0, 1, 1,
0.5307037, -1.327216, 3.073578, 0.2235294, 0, 1, 1,
0.5351185, 0.5631407, 1.359762, 0.2313726, 0, 1, 1,
0.5401756, 0.8705245, 0.03422818, 0.2352941, 0, 1, 1,
0.5417966, -0.06880306, 1.295075, 0.2431373, 0, 1, 1,
0.5475657, 0.6664981, -0.8946653, 0.2470588, 0, 1, 1,
0.5478827, 0.7513447, 0.2291792, 0.254902, 0, 1, 1,
0.5512547, 0.4727244, 0.1924353, 0.2588235, 0, 1, 1,
0.5527018, 0.0457263, 1.426662, 0.2666667, 0, 1, 1,
0.5529447, -0.2072652, 0.9839402, 0.2705882, 0, 1, 1,
0.5722698, 0.4387935, 1.448862, 0.2784314, 0, 1, 1,
0.5738754, 1.158967, 1.845516, 0.282353, 0, 1, 1,
0.5779307, -0.6608464, 3.127133, 0.2901961, 0, 1, 1,
0.5802493, -0.3900965, 2.895279, 0.2941177, 0, 1, 1,
0.581193, 0.01670841, 3.18661, 0.3019608, 0, 1, 1,
0.5877209, -0.8093857, 3.884051, 0.3098039, 0, 1, 1,
0.5948715, -0.276237, 2.247719, 0.3137255, 0, 1, 1,
0.5949748, -0.5914072, 3.374342, 0.3215686, 0, 1, 1,
0.5988488, 0.9199042, 0.6014324, 0.3254902, 0, 1, 1,
0.603376, 0.1200831, 1.189648, 0.3333333, 0, 1, 1,
0.6181526, 0.2768247, 0.5609755, 0.3372549, 0, 1, 1,
0.6186994, 0.6311613, -1.064555, 0.345098, 0, 1, 1,
0.6192397, 0.9774746, 1.856675, 0.3490196, 0, 1, 1,
0.6241624, -0.1374063, 2.341702, 0.3568628, 0, 1, 1,
0.625389, -1.133666, 3.993565, 0.3607843, 0, 1, 1,
0.6285977, -0.9365875, 1.845989, 0.3686275, 0, 1, 1,
0.6290912, 1.008197, 2.807163, 0.372549, 0, 1, 1,
0.6301309, 0.6934848, 1.134173, 0.3803922, 0, 1, 1,
0.6347467, -0.1070254, 2.607315, 0.3843137, 0, 1, 1,
0.6358903, -1.894661, 3.240381, 0.3921569, 0, 1, 1,
0.6370292, 0.2919012, 2.791366, 0.3960784, 0, 1, 1,
0.6400117, 1.243476, 0.7561486, 0.4039216, 0, 1, 1,
0.6433353, 0.8601186, 2.106674, 0.4117647, 0, 1, 1,
0.6482144, 0.5051529, 0.0188624, 0.4156863, 0, 1, 1,
0.6548262, 1.940242, -0.5055567, 0.4235294, 0, 1, 1,
0.6605271, -2.335145, 1.440583, 0.427451, 0, 1, 1,
0.6612471, -0.9514075, 1.558848, 0.4352941, 0, 1, 1,
0.6647015, 0.8634136, -0.1846274, 0.4392157, 0, 1, 1,
0.6681591, -0.1948022, 2.700818, 0.4470588, 0, 1, 1,
0.6687056, -1.089395, 2.589129, 0.4509804, 0, 1, 1,
0.672549, -0.4503609, 3.2021, 0.4588235, 0, 1, 1,
0.6728964, -0.8713076, 5.37267, 0.4627451, 0, 1, 1,
0.6747051, -1.847236, 2.795013, 0.4705882, 0, 1, 1,
0.6753417, 0.06330548, 2.926569, 0.4745098, 0, 1, 1,
0.675783, -0.3892755, 2.902114, 0.4823529, 0, 1, 1,
0.6812124, -1.223207, 2.759589, 0.4862745, 0, 1, 1,
0.6866872, -1.109596, 1.703484, 0.4941176, 0, 1, 1,
0.6867775, 0.2766902, 2.000425, 0.5019608, 0, 1, 1,
0.6871598, -0.9607345, 2.102787, 0.5058824, 0, 1, 1,
0.6879387, -0.5350829, 2.648291, 0.5137255, 0, 1, 1,
0.6884559, 0.4375749, 2.340078, 0.5176471, 0, 1, 1,
0.6888273, -0.02950514, 1.355253, 0.5254902, 0, 1, 1,
0.6897843, 0.07166404, 2.162371, 0.5294118, 0, 1, 1,
0.6910552, 1.265428, 0.6495787, 0.5372549, 0, 1, 1,
0.6924306, 0.3426722, -0.1419922, 0.5411765, 0, 1, 1,
0.6929128, 0.03232463, 3.046674, 0.5490196, 0, 1, 1,
0.6930693, 1.182732, 1.315207, 0.5529412, 0, 1, 1,
0.6971561, 1.256051, -1.154625, 0.5607843, 0, 1, 1,
0.6999184, -0.1405416, 1.987121, 0.5647059, 0, 1, 1,
0.7072101, -0.1858992, 1.09255, 0.572549, 0, 1, 1,
0.708023, -0.06609264, 0.9648955, 0.5764706, 0, 1, 1,
0.7113631, 0.4737188, 2.28035, 0.5843138, 0, 1, 1,
0.7116924, 0.1989201, 0.7495202, 0.5882353, 0, 1, 1,
0.7178513, -0.4173082, 1.21296, 0.5960785, 0, 1, 1,
0.7190933, -0.8604224, 1.857355, 0.6039216, 0, 1, 1,
0.7211454, -1.618363, 2.006111, 0.6078432, 0, 1, 1,
0.7250882, 1.207042, 0.4664119, 0.6156863, 0, 1, 1,
0.7268531, -0.2620514, 2.122782, 0.6196079, 0, 1, 1,
0.7302834, -0.8485051, 2.7698, 0.627451, 0, 1, 1,
0.7303732, -1.189335, 2.194662, 0.6313726, 0, 1, 1,
0.7334618, -0.6923337, 1.009741, 0.6392157, 0, 1, 1,
0.7336133, 0.3798016, 1.335626, 0.6431373, 0, 1, 1,
0.7381694, -2.86845, 4.646187, 0.6509804, 0, 1, 1,
0.7391785, 1.947363, 1.405648, 0.654902, 0, 1, 1,
0.740185, 0.738798, 2.491694, 0.6627451, 0, 1, 1,
0.7437958, 0.669302, 1.751451, 0.6666667, 0, 1, 1,
0.7471251, -0.847154, 2.403729, 0.6745098, 0, 1, 1,
0.7472093, 0.4859064, 2.174497, 0.6784314, 0, 1, 1,
0.7480328, 1.089863, 0.7811468, 0.6862745, 0, 1, 1,
0.7539586, 0.05718184, 0.7095183, 0.6901961, 0, 1, 1,
0.7540214, 1.300006, 0.7493084, 0.6980392, 0, 1, 1,
0.760092, 0.9848072, 1.847316, 0.7058824, 0, 1, 1,
0.7685464, -1.103093, 1.212149, 0.7098039, 0, 1, 1,
0.7695964, 1.158213, 0.6269906, 0.7176471, 0, 1, 1,
0.7729775, -0.1111949, 2.389853, 0.7215686, 0, 1, 1,
0.773977, -1.695952, 3.709932, 0.7294118, 0, 1, 1,
0.7795731, 1.96486, 2.376895, 0.7333333, 0, 1, 1,
0.7835726, -0.9891629, 4.003165, 0.7411765, 0, 1, 1,
0.787718, -1.18242, 2.091772, 0.7450981, 0, 1, 1,
0.7946723, -0.5773572, 2.194577, 0.7529412, 0, 1, 1,
0.7974238, -0.02304483, 0.1509001, 0.7568628, 0, 1, 1,
0.7996644, -1.872649, 2.928468, 0.7647059, 0, 1, 1,
0.8010026, -0.2848189, 0.9452428, 0.7686275, 0, 1, 1,
0.804334, 0.3666463, 0.2234494, 0.7764706, 0, 1, 1,
0.8062605, 0.9984326, 0.9584553, 0.7803922, 0, 1, 1,
0.808997, -0.4649632, 2.466452, 0.7882353, 0, 1, 1,
0.8105106, 0.5708091, 2.263447, 0.7921569, 0, 1, 1,
0.822486, -0.1315626, 2.222733, 0.8, 0, 1, 1,
0.8313029, 1.052987, -0.4846275, 0.8078431, 0, 1, 1,
0.8334493, 0.6392231, 0.7009953, 0.8117647, 0, 1, 1,
0.8358651, -0.263195, 2.569781, 0.8196079, 0, 1, 1,
0.8362499, -0.3886964, 3.037879, 0.8235294, 0, 1, 1,
0.8393371, 0.1032441, 0.7018448, 0.8313726, 0, 1, 1,
0.8407075, 0.1304063, 0.05436468, 0.8352941, 0, 1, 1,
0.8455712, -1.043666, 2.522178, 0.8431373, 0, 1, 1,
0.8522236, -2.442221, 2.789383, 0.8470588, 0, 1, 1,
0.8536777, -0.1582957, 1.818916, 0.854902, 0, 1, 1,
0.8621802, 0.6010593, 3.048079, 0.8588235, 0, 1, 1,
0.8743748, -2.167749, 1.571952, 0.8666667, 0, 1, 1,
0.876548, -0.8643258, 3.757262, 0.8705882, 0, 1, 1,
0.879142, -1.343807, 2.211829, 0.8784314, 0, 1, 1,
0.8889101, -0.04209628, 1.477454, 0.8823529, 0, 1, 1,
0.8947691, -0.05596614, 2.88693, 0.8901961, 0, 1, 1,
0.8962401, -1.04034, 3.400606, 0.8941177, 0, 1, 1,
0.9042404, 0.1668505, -0.8097613, 0.9019608, 0, 1, 1,
0.9076295, -1.288354, 3.659476, 0.9098039, 0, 1, 1,
0.9077697, 1.487075, -0.2570745, 0.9137255, 0, 1, 1,
0.9120333, 0.8406174, 1.288204, 0.9215686, 0, 1, 1,
0.9144472, -0.01704527, 1.257014, 0.9254902, 0, 1, 1,
0.9267377, 2.146573, 1.280389, 0.9333333, 0, 1, 1,
0.9450313, -1.906324, 1.636357, 0.9372549, 0, 1, 1,
0.9458348, -1.620633, 3.469159, 0.945098, 0, 1, 1,
0.9475871, 1.211412, 1.244185, 0.9490196, 0, 1, 1,
0.9508966, 0.9419404, 0.2248448, 0.9568627, 0, 1, 1,
0.9546407, 0.7820187, 2.041393, 0.9607843, 0, 1, 1,
0.9612173, 0.6966715, 0.4113307, 0.9686275, 0, 1, 1,
0.9685149, 1.145741, 0.7113401, 0.972549, 0, 1, 1,
0.9685669, -0.08195192, 0.9930569, 0.9803922, 0, 1, 1,
0.9757624, -0.3402606, 2.454552, 0.9843137, 0, 1, 1,
0.9764273, 2.086372, -1.674673, 0.9921569, 0, 1, 1,
0.9794941, 1.103975, 0.302708, 0.9960784, 0, 1, 1,
0.990908, -1.143012, 2.105393, 1, 0, 0.9960784, 1,
0.9921019, -0.8380063, 3.529045, 1, 0, 0.9882353, 1,
0.9942578, -2.010547, 2.725806, 1, 0, 0.9843137, 1,
0.9951184, 0.5170652, 0.740509, 1, 0, 0.9764706, 1,
0.999517, 0.3534451, 2.428928, 1, 0, 0.972549, 1,
1.009699, 1.140281, -0.07080484, 1, 0, 0.9647059, 1,
1.009865, -0.4538586, 2.065356, 1, 0, 0.9607843, 1,
1.018437, 1.028686, -0.9333369, 1, 0, 0.9529412, 1,
1.020218, -0.3031814, 1.959886, 1, 0, 0.9490196, 1,
1.021716, 0.6912264, 1.143549, 1, 0, 0.9411765, 1,
1.025255, 1.301325, -0.2663009, 1, 0, 0.9372549, 1,
1.025969, 1.148854, 0.6030296, 1, 0, 0.9294118, 1,
1.028048, 0.05126971, 1.960843, 1, 0, 0.9254902, 1,
1.036962, -1.348446, 1.756679, 1, 0, 0.9176471, 1,
1.053407, 0.8814483, 2.28662, 1, 0, 0.9137255, 1,
1.056026, -1.378295, 1.454946, 1, 0, 0.9058824, 1,
1.056215, 0.9789565, -1.299878, 1, 0, 0.9019608, 1,
1.056766, 0.08701086, 2.483107, 1, 0, 0.8941177, 1,
1.058316, -0.2280353, 1.251982, 1, 0, 0.8862745, 1,
1.063265, 0.7076334, 1.08614, 1, 0, 0.8823529, 1,
1.070526, 0.3773485, 2.706371, 1, 0, 0.8745098, 1,
1.074789, -0.3125531, 2.880724, 1, 0, 0.8705882, 1,
1.076525, -1.94985, 1.435701, 1, 0, 0.8627451, 1,
1.076739, 0.8534815, 1.15325, 1, 0, 0.8588235, 1,
1.085183, -0.1093141, 1.665662, 1, 0, 0.8509804, 1,
1.08882, 2.005944, -0.6568816, 1, 0, 0.8470588, 1,
1.095028, -0.8524219, 2.690374, 1, 0, 0.8392157, 1,
1.095034, 1.233349, 0.6714098, 1, 0, 0.8352941, 1,
1.102479, 1.023638, 0.2007408, 1, 0, 0.827451, 1,
1.103604, -0.887771, 2.987625, 1, 0, 0.8235294, 1,
1.106844, -0.1395721, 2.144521, 1, 0, 0.8156863, 1,
1.107286, -0.3683864, 4.285926, 1, 0, 0.8117647, 1,
1.108233, 0.8798252, 1.145017, 1, 0, 0.8039216, 1,
1.109941, -1.228042, 0.8753821, 1, 0, 0.7960784, 1,
1.111015, -2.371879, 1.924768, 1, 0, 0.7921569, 1,
1.112011, -1.724651, 1.076298, 1, 0, 0.7843137, 1,
1.125202, 0.4546539, 3.06505, 1, 0, 0.7803922, 1,
1.125463, -0.7970734, 1.914425, 1, 0, 0.772549, 1,
1.128027, 1.277781, 1.436763, 1, 0, 0.7686275, 1,
1.130898, -1.791221, 2.277565, 1, 0, 0.7607843, 1,
1.135018, 1.096645, 1.650581, 1, 0, 0.7568628, 1,
1.138549, -0.818373, 2.69058, 1, 0, 0.7490196, 1,
1.140502, -0.872294, 1.359137, 1, 0, 0.7450981, 1,
1.147565, 0.09354037, 0.8048846, 1, 0, 0.7372549, 1,
1.158873, 2.131806, 1.652894, 1, 0, 0.7333333, 1,
1.170686, 0.6707487, 0.268874, 1, 0, 0.7254902, 1,
1.180421, -0.1419351, 2.210709, 1, 0, 0.7215686, 1,
1.184688, -1.076146, 1.376327, 1, 0, 0.7137255, 1,
1.186043, 0.280904, -0.3674763, 1, 0, 0.7098039, 1,
1.187629, 1.234282, 1.397544, 1, 0, 0.7019608, 1,
1.206543, 1.220455, 1.03632, 1, 0, 0.6941177, 1,
1.208107, -1.076176, 1.932002, 1, 0, 0.6901961, 1,
1.217981, 0.2185866, 1.442122, 1, 0, 0.682353, 1,
1.217993, -0.6302711, 2.029855, 1, 0, 0.6784314, 1,
1.21812, 0.06874762, 1.380466, 1, 0, 0.6705883, 1,
1.222951, 0.4835559, 0.1245741, 1, 0, 0.6666667, 1,
1.232548, 0.5099075, 1.048057, 1, 0, 0.6588235, 1,
1.239696, 0.6385147, 0.5052922, 1, 0, 0.654902, 1,
1.251589, -2.645164, 1.430144, 1, 0, 0.6470588, 1,
1.256788, 1.548918, 0.2176254, 1, 0, 0.6431373, 1,
1.280931, 0.07607628, 0.519727, 1, 0, 0.6352941, 1,
1.28136, 0.9583075, 1.829087, 1, 0, 0.6313726, 1,
1.281933, 2.29265, 3.186073, 1, 0, 0.6235294, 1,
1.29072, 0.2443426, 1.374111, 1, 0, 0.6196079, 1,
1.300616, 0.04962136, 2.186652, 1, 0, 0.6117647, 1,
1.32667, -1.381373, 1.446962, 1, 0, 0.6078432, 1,
1.333714, 0.5415987, 3.228466, 1, 0, 0.6, 1,
1.335205, 1.235279, 2.001674, 1, 0, 0.5921569, 1,
1.339723, 1.225593, 2.234785, 1, 0, 0.5882353, 1,
1.339998, 0.7982427, 1.262744, 1, 0, 0.5803922, 1,
1.342511, -0.1013136, 2.96122, 1, 0, 0.5764706, 1,
1.353198, -1.350046, 3.242485, 1, 0, 0.5686275, 1,
1.357204, -0.6817588, 2.791044, 1, 0, 0.5647059, 1,
1.369316, 1.498, 0.3074416, 1, 0, 0.5568628, 1,
1.38358, 0.3703911, 1.153588, 1, 0, 0.5529412, 1,
1.390628, 1.025782, 0.8207768, 1, 0, 0.5450981, 1,
1.390884, -0.4109719, 2.516199, 1, 0, 0.5411765, 1,
1.395066, -2.419085, 4.468338, 1, 0, 0.5333334, 1,
1.396954, 0.3154085, 1.777937, 1, 0, 0.5294118, 1,
1.40876, -0.272335, 1.969302, 1, 0, 0.5215687, 1,
1.415187, -0.5887368, 2.064847, 1, 0, 0.5176471, 1,
1.422453, -0.2978309, 2.737722, 1, 0, 0.509804, 1,
1.428009, -0.903504, 2.357328, 1, 0, 0.5058824, 1,
1.450829, 1.77713, 0.8899967, 1, 0, 0.4980392, 1,
1.453405, 0.2994088, 0.4070745, 1, 0, 0.4901961, 1,
1.456891, 1.011155, 0.4157695, 1, 0, 0.4862745, 1,
1.473374, 1.244053, 1.156371, 1, 0, 0.4784314, 1,
1.48004, 0.0122774, 1.995051, 1, 0, 0.4745098, 1,
1.482357, -1.612126, 3.020151, 1, 0, 0.4666667, 1,
1.486426, 0.5348518, 1.124584, 1, 0, 0.4627451, 1,
1.491229, -0.08925904, 1.513497, 1, 0, 0.454902, 1,
1.492769, 1.368673, 0.4226617, 1, 0, 0.4509804, 1,
1.499233, 0.5967988, 1.909846, 1, 0, 0.4431373, 1,
1.500439, 0.2404988, -0.8773189, 1, 0, 0.4392157, 1,
1.504132, 0.8723499, 0.3382349, 1, 0, 0.4313726, 1,
1.509447, -1.174075, 1.79386, 1, 0, 0.427451, 1,
1.513705, -1.0715, 1.586359, 1, 0, 0.4196078, 1,
1.519146, 0.2702069, 2.551045, 1, 0, 0.4156863, 1,
1.522782, -0.2321995, 1.602773, 1, 0, 0.4078431, 1,
1.52498, 1.496287, 1.002612, 1, 0, 0.4039216, 1,
1.525188, -0.3822124, 1.758551, 1, 0, 0.3960784, 1,
1.54131, 0.6669605, 0.8965425, 1, 0, 0.3882353, 1,
1.543875, -0.1928785, 0.7864157, 1, 0, 0.3843137, 1,
1.545327, -1.652636, 4.168952, 1, 0, 0.3764706, 1,
1.548096, -0.1274077, 1.973182, 1, 0, 0.372549, 1,
1.55096, 0.4902444, 0.1442792, 1, 0, 0.3647059, 1,
1.57162, -0.7369456, 2.507545, 1, 0, 0.3607843, 1,
1.573943, 1.303105, -0.4936376, 1, 0, 0.3529412, 1,
1.577346, -0.9858608, 1.632986, 1, 0, 0.3490196, 1,
1.58008, -0.2161889, 2.097362, 1, 0, 0.3411765, 1,
1.590656, -0.5948093, 1.411398, 1, 0, 0.3372549, 1,
1.600529, -0.1926075, 2.111133, 1, 0, 0.3294118, 1,
1.617961, -2.507236, 2.299251, 1, 0, 0.3254902, 1,
1.632445, 0.56073, -0.1436575, 1, 0, 0.3176471, 1,
1.635109, -0.4422556, 3.087671, 1, 0, 0.3137255, 1,
1.671156, -1.648724, 2.908855, 1, 0, 0.3058824, 1,
1.674929, -0.4747912, 2.224286, 1, 0, 0.2980392, 1,
1.693232, -0.03154228, 1.656701, 1, 0, 0.2941177, 1,
1.708113, 1.198561, 1.848566, 1, 0, 0.2862745, 1,
1.71336, -0.2335932, 2.481366, 1, 0, 0.282353, 1,
1.726483, -1.603633, -0.1607651, 1, 0, 0.2745098, 1,
1.727258, -0.4436774, 1.832985, 1, 0, 0.2705882, 1,
1.745946, -1.065613, 2.209206, 1, 0, 0.2627451, 1,
1.750469, -0.3191829, 0.5515028, 1, 0, 0.2588235, 1,
1.762094, 0.9524457, 1.263734, 1, 0, 0.2509804, 1,
1.777646, 0.0839688, 1.343278, 1, 0, 0.2470588, 1,
1.798489, 0.1392216, 2.851849, 1, 0, 0.2392157, 1,
1.81469, 0.2164579, 1.453446, 1, 0, 0.2352941, 1,
1.821738, 0.3390029, 0.7975497, 1, 0, 0.227451, 1,
1.825998, 0.3897219, 2.240663, 1, 0, 0.2235294, 1,
1.826344, 1.755302, 1.731117, 1, 0, 0.2156863, 1,
1.844242, 0.03792778, 2.140449, 1, 0, 0.2117647, 1,
1.84917, 0.09565518, 0.541059, 1, 0, 0.2039216, 1,
1.869385, 1.499859, 1.524986, 1, 0, 0.1960784, 1,
1.878322, 0.05864704, 1.692903, 1, 0, 0.1921569, 1,
1.879173, -2.105802, 2.794127, 1, 0, 0.1843137, 1,
1.890511, -0.1723762, 1.336597, 1, 0, 0.1803922, 1,
1.912588, -1.246871, 2.413748, 1, 0, 0.172549, 1,
1.914513, 0.2898839, 3.391915, 1, 0, 0.1686275, 1,
1.93934, 1.747613, -1.200076, 1, 0, 0.1607843, 1,
1.947846, -0.71939, 1.08637, 1, 0, 0.1568628, 1,
1.960504, -0.05672758, 0.1182708, 1, 0, 0.1490196, 1,
1.981886, 2.579198, 0.7444753, 1, 0, 0.145098, 1,
1.986544, -0.2172342, 2.411395, 1, 0, 0.1372549, 1,
2.000061, 0.6730921, 0.8740602, 1, 0, 0.1333333, 1,
2.056964, 0.9939918, 1.797687, 1, 0, 0.1254902, 1,
2.074964, 0.1902044, 0.2135657, 1, 0, 0.1215686, 1,
2.088022, 0.3670091, 3.071937, 1, 0, 0.1137255, 1,
2.115584, -1.150691, 1.864707, 1, 0, 0.1098039, 1,
2.123057, 1.234185, 0.6163632, 1, 0, 0.1019608, 1,
2.128835, -0.9426309, 1.859259, 1, 0, 0.09411765, 1,
2.223038, 0.143765, 1.428296, 1, 0, 0.09019608, 1,
2.266631, 0.2596732, 2.058631, 1, 0, 0.08235294, 1,
2.281116, 0.8252957, 0.9930055, 1, 0, 0.07843138, 1,
2.299487, 0.4565055, 1.07354, 1, 0, 0.07058824, 1,
2.356319, -1.345653, 3.008284, 1, 0, 0.06666667, 1,
2.3966, -1.872962, 2.699035, 1, 0, 0.05882353, 1,
2.414603, 0.147581, 1.105989, 1, 0, 0.05490196, 1,
2.446421, -0.6891944, 2.788301, 1, 0, 0.04705882, 1,
2.533641, -0.9926424, 2.274632, 1, 0, 0.04313726, 1,
2.585078, -1.503338, 1.291127, 1, 0, 0.03529412, 1,
2.593854, -0.8595071, 0.1713272, 1, 0, 0.03137255, 1,
2.631386, 0.2741361, 0.4412059, 1, 0, 0.02352941, 1,
2.706342, 1.226234, -0.2241236, 1, 0, 0.01960784, 1,
2.812024, -1.149503, 1.849539, 1, 0, 0.01176471, 1,
2.979383, -0.6794738, 0.937243, 1, 0, 0.007843138, 1
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
-0.2728153, -4.643718, -7.422735, 0, -0.5, 0.5, 0.5,
-0.2728153, -4.643718, -7.422735, 1, -0.5, 0.5, 0.5,
-0.2728153, -4.643718, -7.422735, 1, 1.5, 0.5, 0.5,
-0.2728153, -4.643718, -7.422735, 0, 1.5, 0.5, 0.5
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
-4.62751, -0.5088377, -7.422735, 0, -0.5, 0.5, 0.5,
-4.62751, -0.5088377, -7.422735, 1, -0.5, 0.5, 0.5,
-4.62751, -0.5088377, -7.422735, 1, 1.5, 0.5, 0.5,
-4.62751, -0.5088377, -7.422735, 0, 1.5, 0.5, 0.5
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
-4.62751, -4.643718, -0.09778929, 0, -0.5, 0.5, 0.5,
-4.62751, -4.643718, -0.09778929, 1, -0.5, 0.5, 0.5,
-4.62751, -4.643718, -0.09778929, 1, 1.5, 0.5, 0.5,
-4.62751, -4.643718, -0.09778929, 0, 1.5, 0.5, 0.5
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
-3, -3.689515, -5.732363,
2, -3.689515, -5.732363,
-3, -3.689515, -5.732363,
-3, -3.848549, -6.014091,
-2, -3.689515, -5.732363,
-2, -3.848549, -6.014091,
-1, -3.689515, -5.732363,
-1, -3.848549, -6.014091,
0, -3.689515, -5.732363,
0, -3.848549, -6.014091,
1, -3.689515, -5.732363,
1, -3.848549, -6.014091,
2, -3.689515, -5.732363,
2, -3.848549, -6.014091
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
-3, -4.166616, -6.577549, 0, -0.5, 0.5, 0.5,
-3, -4.166616, -6.577549, 1, -0.5, 0.5, 0.5,
-3, -4.166616, -6.577549, 1, 1.5, 0.5, 0.5,
-3, -4.166616, -6.577549, 0, 1.5, 0.5, 0.5,
-2, -4.166616, -6.577549, 0, -0.5, 0.5, 0.5,
-2, -4.166616, -6.577549, 1, -0.5, 0.5, 0.5,
-2, -4.166616, -6.577549, 1, 1.5, 0.5, 0.5,
-2, -4.166616, -6.577549, 0, 1.5, 0.5, 0.5,
-1, -4.166616, -6.577549, 0, -0.5, 0.5, 0.5,
-1, -4.166616, -6.577549, 1, -0.5, 0.5, 0.5,
-1, -4.166616, -6.577549, 1, 1.5, 0.5, 0.5,
-1, -4.166616, -6.577549, 0, 1.5, 0.5, 0.5,
0, -4.166616, -6.577549, 0, -0.5, 0.5, 0.5,
0, -4.166616, -6.577549, 1, -0.5, 0.5, 0.5,
0, -4.166616, -6.577549, 1, 1.5, 0.5, 0.5,
0, -4.166616, -6.577549, 0, 1.5, 0.5, 0.5,
1, -4.166616, -6.577549, 0, -0.5, 0.5, 0.5,
1, -4.166616, -6.577549, 1, -0.5, 0.5, 0.5,
1, -4.166616, -6.577549, 1, 1.5, 0.5, 0.5,
1, -4.166616, -6.577549, 0, 1.5, 0.5, 0.5,
2, -4.166616, -6.577549, 0, -0.5, 0.5, 0.5,
2, -4.166616, -6.577549, 1, -0.5, 0.5, 0.5,
2, -4.166616, -6.577549, 1, 1.5, 0.5, 0.5,
2, -4.166616, -6.577549, 0, 1.5, 0.5, 0.5
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
-3.62258, -3, -5.732363,
-3.62258, 2, -5.732363,
-3.62258, -3, -5.732363,
-3.790068, -3, -6.014091,
-3.62258, -2, -5.732363,
-3.790068, -2, -6.014091,
-3.62258, -1, -5.732363,
-3.790068, -1, -6.014091,
-3.62258, 0, -5.732363,
-3.790068, 0, -6.014091,
-3.62258, 1, -5.732363,
-3.790068, 1, -6.014091,
-3.62258, 2, -5.732363,
-3.790068, 2, -6.014091
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
-4.125045, -3, -6.577549, 0, -0.5, 0.5, 0.5,
-4.125045, -3, -6.577549, 1, -0.5, 0.5, 0.5,
-4.125045, -3, -6.577549, 1, 1.5, 0.5, 0.5,
-4.125045, -3, -6.577549, 0, 1.5, 0.5, 0.5,
-4.125045, -2, -6.577549, 0, -0.5, 0.5, 0.5,
-4.125045, -2, -6.577549, 1, -0.5, 0.5, 0.5,
-4.125045, -2, -6.577549, 1, 1.5, 0.5, 0.5,
-4.125045, -2, -6.577549, 0, 1.5, 0.5, 0.5,
-4.125045, -1, -6.577549, 0, -0.5, 0.5, 0.5,
-4.125045, -1, -6.577549, 1, -0.5, 0.5, 0.5,
-4.125045, -1, -6.577549, 1, 1.5, 0.5, 0.5,
-4.125045, -1, -6.577549, 0, 1.5, 0.5, 0.5,
-4.125045, 0, -6.577549, 0, -0.5, 0.5, 0.5,
-4.125045, 0, -6.577549, 1, -0.5, 0.5, 0.5,
-4.125045, 0, -6.577549, 1, 1.5, 0.5, 0.5,
-4.125045, 0, -6.577549, 0, 1.5, 0.5, 0.5,
-4.125045, 1, -6.577549, 0, -0.5, 0.5, 0.5,
-4.125045, 1, -6.577549, 1, -0.5, 0.5, 0.5,
-4.125045, 1, -6.577549, 1, 1.5, 0.5, 0.5,
-4.125045, 1, -6.577549, 0, 1.5, 0.5, 0.5,
-4.125045, 2, -6.577549, 0, -0.5, 0.5, 0.5,
-4.125045, 2, -6.577549, 1, -0.5, 0.5, 0.5,
-4.125045, 2, -6.577549, 1, 1.5, 0.5, 0.5,
-4.125045, 2, -6.577549, 0, 1.5, 0.5, 0.5
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
-3.62258, -3.689515, -4,
-3.62258, -3.689515, 4,
-3.62258, -3.689515, -4,
-3.790068, -3.848549, -4,
-3.62258, -3.689515, -2,
-3.790068, -3.848549, -2,
-3.62258, -3.689515, 0,
-3.790068, -3.848549, 0,
-3.62258, -3.689515, 2,
-3.790068, -3.848549, 2,
-3.62258, -3.689515, 4,
-3.790068, -3.848549, 4
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
-4.125045, -4.166616, -4, 0, -0.5, 0.5, 0.5,
-4.125045, -4.166616, -4, 1, -0.5, 0.5, 0.5,
-4.125045, -4.166616, -4, 1, 1.5, 0.5, 0.5,
-4.125045, -4.166616, -4, 0, 1.5, 0.5, 0.5,
-4.125045, -4.166616, -2, 0, -0.5, 0.5, 0.5,
-4.125045, -4.166616, -2, 1, -0.5, 0.5, 0.5,
-4.125045, -4.166616, -2, 1, 1.5, 0.5, 0.5,
-4.125045, -4.166616, -2, 0, 1.5, 0.5, 0.5,
-4.125045, -4.166616, 0, 0, -0.5, 0.5, 0.5,
-4.125045, -4.166616, 0, 1, -0.5, 0.5, 0.5,
-4.125045, -4.166616, 0, 1, 1.5, 0.5, 0.5,
-4.125045, -4.166616, 0, 0, 1.5, 0.5, 0.5,
-4.125045, -4.166616, 2, 0, -0.5, 0.5, 0.5,
-4.125045, -4.166616, 2, 1, -0.5, 0.5, 0.5,
-4.125045, -4.166616, 2, 1, 1.5, 0.5, 0.5,
-4.125045, -4.166616, 2, 0, 1.5, 0.5, 0.5,
-4.125045, -4.166616, 4, 0, -0.5, 0.5, 0.5,
-4.125045, -4.166616, 4, 1, -0.5, 0.5, 0.5,
-4.125045, -4.166616, 4, 1, 1.5, 0.5, 0.5,
-4.125045, -4.166616, 4, 0, 1.5, 0.5, 0.5
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
-3.62258, -3.689515, -5.732363,
-3.62258, 2.671839, -5.732363,
-3.62258, -3.689515, 5.536784,
-3.62258, 2.671839, 5.536784,
-3.62258, -3.689515, -5.732363,
-3.62258, -3.689515, 5.536784,
-3.62258, 2.671839, -5.732363,
-3.62258, 2.671839, 5.536784,
-3.62258, -3.689515, -5.732363,
3.076949, -3.689515, -5.732363,
-3.62258, -3.689515, 5.536784,
3.076949, -3.689515, 5.536784,
-3.62258, 2.671839, -5.732363,
3.076949, 2.671839, -5.732363,
-3.62258, 2.671839, 5.536784,
3.076949, 2.671839, 5.536784,
3.076949, -3.689515, -5.732363,
3.076949, 2.671839, -5.732363,
3.076949, -3.689515, 5.536784,
3.076949, 2.671839, 5.536784,
3.076949, -3.689515, -5.732363,
3.076949, -3.689515, 5.536784,
3.076949, 2.671839, -5.732363,
3.076949, 2.671839, 5.536784
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
var radius = 7.781183;
var distance = 34.61937;
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
mvMatrix.translate( 0.2728153, 0.5088377, 0.09778929 );
mvMatrix.scale( 1.255785, 1.322544, 0.7465666 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.61937);
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
InChI_1S_C14H21NO4_c<-read.table("InChI_1S_C14H21NO4_c.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C14H21NO4_c$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C14H21NO4_c' not found
```

```r
y<-InChI_1S_C14H21NO4_c$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C14H21NO4_c' not found
```

```r
z<-InChI_1S_C14H21NO4_c$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C14H21NO4_c' not found
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
-3.525014, -0.7596674, -1.369635, 0, 0, 1, 1, 1,
-2.973933, -0.5462295, -2.61077, 1, 0, 0, 1, 1,
-2.918914, -0.5630551, -1.579335, 1, 0, 0, 1, 1,
-2.904769, -1.124666, -2.053334, 1, 0, 0, 1, 1,
-2.686059, 0.1181286, -1.542524, 1, 0, 0, 1, 1,
-2.638391, 0.9866529, -0.9960867, 1, 0, 0, 1, 1,
-2.619362, 0.8745111, -1.223094, 0, 0, 0, 1, 1,
-2.618942, -2.523716, -2.125778, 0, 0, 0, 1, 1,
-2.552433, -0.177879, -2.343177, 0, 0, 0, 1, 1,
-2.423707, 1.635016, -0.06280085, 0, 0, 0, 1, 1,
-2.355148, 0.7900234, -0.008124546, 0, 0, 0, 1, 1,
-2.336739, -1.741497, -1.613361, 0, 0, 0, 1, 1,
-2.301156, -0.9332107, -1.628077, 0, 0, 0, 1, 1,
-2.279234, 1.145965, 0.2349313, 1, 1, 1, 1, 1,
-2.21197, 0.448495, -2.250677, 1, 1, 1, 1, 1,
-2.187276, 0.8714813, -2.450053, 1, 1, 1, 1, 1,
-2.15845, 0.2045471, -0.3164705, 1, 1, 1, 1, 1,
-2.141555, 0.6463948, -1.747089, 1, 1, 1, 1, 1,
-2.074738, -0.7392834, -1.477932, 1, 1, 1, 1, 1,
-2.070124, 1.415317, 1.248989, 1, 1, 1, 1, 1,
-2.057796, 0.4633603, -2.10721, 1, 1, 1, 1, 1,
-2.042667, -1.54281, -1.318476, 1, 1, 1, 1, 1,
-1.931614, 0.2707976, -1.135118, 1, 1, 1, 1, 1,
-1.927557, 0.5214295, -1.194324, 1, 1, 1, 1, 1,
-1.884261, 1.12897, -0.139712, 1, 1, 1, 1, 1,
-1.817016, 0.7914839, -0.2034811, 1, 1, 1, 1, 1,
-1.808244, -0.4288784, -1.533269, 1, 1, 1, 1, 1,
-1.804666, 1.037475, -2.124252, 1, 1, 1, 1, 1,
-1.791731, 0.3512194, -2.000444, 0, 0, 1, 1, 1,
-1.767911, 1.835109, -1.712352, 1, 0, 0, 1, 1,
-1.765741, -1.217584, -1.33889, 1, 0, 0, 1, 1,
-1.762107, -1.13075, -1.414784, 1, 0, 0, 1, 1,
-1.74267, -0.1354843, -2.727927, 1, 0, 0, 1, 1,
-1.742252, 0.993961, -0.2803731, 1, 0, 0, 1, 1,
-1.736334, -1.156557, -1.540621, 0, 0, 0, 1, 1,
-1.709921, 0.7809618, -0.7715421, 0, 0, 0, 1, 1,
-1.685904, -0.9554344, -1.017044, 0, 0, 0, 1, 1,
-1.662003, -1.863022, -2.675218, 0, 0, 0, 1, 1,
-1.653848, 0.4928347, -1.34913, 0, 0, 0, 1, 1,
-1.646817, -0.9117472, -1.785503, 0, 0, 0, 1, 1,
-1.64161, 0.4724863, -1.261947, 0, 0, 0, 1, 1,
-1.638711, -1.203951, -3.196291, 1, 1, 1, 1, 1,
-1.624925, 1.129526, -0.07217509, 1, 1, 1, 1, 1,
-1.609432, -0.7613215, -2.186214, 1, 1, 1, 1, 1,
-1.605903, 0.01591767, -4.112211, 1, 1, 1, 1, 1,
-1.596135, 1.938915, -0.6349559, 1, 1, 1, 1, 1,
-1.595911, 0.354037, -1.294967, 1, 1, 1, 1, 1,
-1.58674, 0.3608741, -1.279911, 1, 1, 1, 1, 1,
-1.586696, 0.7861904, -0.9518877, 1, 1, 1, 1, 1,
-1.576907, -0.7618921, -2.98408, 1, 1, 1, 1, 1,
-1.564224, 2.147677, -0.5895573, 1, 1, 1, 1, 1,
-1.54534, -0.8825063, -2.202368, 1, 1, 1, 1, 1,
-1.543046, -0.3603273, -1.996166, 1, 1, 1, 1, 1,
-1.541044, -2.102931, -4.584004, 1, 1, 1, 1, 1,
-1.530957, -0.3619477, -2.462526, 1, 1, 1, 1, 1,
-1.529414, 0.4935775, -1.49489, 1, 1, 1, 1, 1,
-1.521295, 0.2940546, 1.051469, 0, 0, 1, 1, 1,
-1.514115, -0.4643149, -1.99198, 1, 0, 0, 1, 1,
-1.514007, -0.3171115, -1.415544, 1, 0, 0, 1, 1,
-1.501877, 1.337424, -0.8604195, 1, 0, 0, 1, 1,
-1.498174, -0.4921538, -3.766209, 1, 0, 0, 1, 1,
-1.486045, 1.070989, 0.5054963, 1, 0, 0, 1, 1,
-1.484715, -0.5692444, -2.506328, 0, 0, 0, 1, 1,
-1.475088, -0.5551767, -2.468082, 0, 0, 0, 1, 1,
-1.466832, -0.475745, 0.1256533, 0, 0, 0, 1, 1,
-1.442388, -0.5473111, -2.681276, 0, 0, 0, 1, 1,
-1.440832, 0.2399887, -1.727516, 0, 0, 0, 1, 1,
-1.439923, 0.5682521, -0.20085, 0, 0, 0, 1, 1,
-1.434443, -0.229787, -2.751803, 0, 0, 0, 1, 1,
-1.433849, -0.5982285, -1.411391, 1, 1, 1, 1, 1,
-1.418387, 1.39564, -1.210067, 1, 1, 1, 1, 1,
-1.416961, 0.9932721, -0.7832921, 1, 1, 1, 1, 1,
-1.416833, 0.1973744, 0.6652648, 1, 1, 1, 1, 1,
-1.410313, -1.028784, -2.908923, 1, 1, 1, 1, 1,
-1.409933, 0.4346379, -1.240583, 1, 1, 1, 1, 1,
-1.408296, -0.4220335, -1.42082, 1, 1, 1, 1, 1,
-1.397888, 1.641325, -0.476357, 1, 1, 1, 1, 1,
-1.385574, 0.4292476, 0.8489392, 1, 1, 1, 1, 1,
-1.380037, 0.07468788, -0.5277883, 1, 1, 1, 1, 1,
-1.3772, -0.3666566, -1.503045, 1, 1, 1, 1, 1,
-1.371744, 2.023463, -1.288969, 1, 1, 1, 1, 1,
-1.359383, -1.353799, -3.188532, 1, 1, 1, 1, 1,
-1.359037, -0.509303, -1.803462, 1, 1, 1, 1, 1,
-1.354599, -0.6144524, -2.401514, 1, 1, 1, 1, 1,
-1.321352, 0.5637913, -2.896207, 0, 0, 1, 1, 1,
-1.320447, -0.07723722, -1.325209, 1, 0, 0, 1, 1,
-1.320271, -1.061351, -0.6949312, 1, 0, 0, 1, 1,
-1.316804, 2.025389, 0.07976733, 1, 0, 0, 1, 1,
-1.309308, -1.892364, -3.04011, 1, 0, 0, 1, 1,
-1.30351, -0.3777474, -0.7730387, 1, 0, 0, 1, 1,
-1.271533, -0.9851022, -2.374626, 0, 0, 0, 1, 1,
-1.257955, 0.149431, -2.320506, 0, 0, 0, 1, 1,
-1.257026, -0.927175, -1.956845, 0, 0, 0, 1, 1,
-1.254034, 0.4815306, -2.471852, 0, 0, 0, 1, 1,
-1.243996, -0.6146096, -1.902194, 0, 0, 0, 1, 1,
-1.228858, 0.5357985, -2.33698, 0, 0, 0, 1, 1,
-1.22515, -0.222756, -1.252053, 0, 0, 0, 1, 1,
-1.216253, 0.4843155, -2.08479, 1, 1, 1, 1, 1,
-1.214899, 0.4991979, -0.8417822, 1, 1, 1, 1, 1,
-1.213079, 1.682151, 1.338484, 1, 1, 1, 1, 1,
-1.208836, 0.4028807, -1.137208, 1, 1, 1, 1, 1,
-1.206676, -0.02529033, -1.049546, 1, 1, 1, 1, 1,
-1.203398, 0.7809768, -2.502007, 1, 1, 1, 1, 1,
-1.191307, 0.07492161, -0.8651101, 1, 1, 1, 1, 1,
-1.176132, 1.085667, 0.1293954, 1, 1, 1, 1, 1,
-1.167083, -1.249068, -1.848457, 1, 1, 1, 1, 1,
-1.16194, -0.8586982, -1.663841, 1, 1, 1, 1, 1,
-1.159934, -0.9836595, -1.325719, 1, 1, 1, 1, 1,
-1.157675, -1.154912, -1.612087, 1, 1, 1, 1, 1,
-1.150959, 0.5551649, -0.7484424, 1, 1, 1, 1, 1,
-1.149731, -0.2738859, -0.8947067, 1, 1, 1, 1, 1,
-1.139378, 0.4940405, -0.3102228, 1, 1, 1, 1, 1,
-1.131308, -0.2803397, -2.448125, 0, 0, 1, 1, 1,
-1.128663, -1.942456, -3.49513, 1, 0, 0, 1, 1,
-1.12758, -0.6555114, -0.9477765, 1, 0, 0, 1, 1,
-1.119821, -0.667272, -3.771909, 1, 0, 0, 1, 1,
-1.113668, -0.002780512, -1.725929, 1, 0, 0, 1, 1,
-1.112141, -0.4892598, -1.409985, 1, 0, 0, 1, 1,
-1.109626, 0.04004269, -0.007772195, 0, 0, 0, 1, 1,
-1.109623, 0.9692346, 1.050387, 0, 0, 0, 1, 1,
-1.087102, 0.3685518, -1.707614, 0, 0, 0, 1, 1,
-1.083774, 0.2125215, -1.122516, 0, 0, 0, 1, 1,
-1.079664, -2.386355, -2.483823, 0, 0, 0, 1, 1,
-1.077464, -0.0998245, -1.322524, 0, 0, 0, 1, 1,
-1.076796, -1.030285, -2.40103, 0, 0, 0, 1, 1,
-1.068035, -0.5221663, -3.416483, 1, 1, 1, 1, 1,
-1.066501, 0.05462133, -2.431153, 1, 1, 1, 1, 1,
-1.062118, 2.424476, -0.2384368, 1, 1, 1, 1, 1,
-1.060829, 0.140684, -1.407594, 1, 1, 1, 1, 1,
-1.058959, 0.6013482, -3.595383, 1, 1, 1, 1, 1,
-1.054401, -1.239904, -1.250077, 1, 1, 1, 1, 1,
-1.054041, -0.7923261, -1.857736, 1, 1, 1, 1, 1,
-1.046651, 0.8359056, -1.863939, 1, 1, 1, 1, 1,
-1.037982, -1.418311, -2.410376, 1, 1, 1, 1, 1,
-1.03653, -0.7077864, -1.391499, 1, 1, 1, 1, 1,
-1.036511, -2.317811, -2.984454, 1, 1, 1, 1, 1,
-1.035181, 1.042388, -2.938166, 1, 1, 1, 1, 1,
-1.016161, 0.004199533, -2.537076, 1, 1, 1, 1, 1,
-1.014273, -0.1740411, -1.657601, 1, 1, 1, 1, 1,
-1.008415, -0.1290561, -1.168668, 1, 1, 1, 1, 1,
-1.002674, 0.270595, -3.595931, 0, 0, 1, 1, 1,
-0.9848769, 0.5431854, 1.670706, 1, 0, 0, 1, 1,
-0.9781837, -0.8872315, -1.214037, 1, 0, 0, 1, 1,
-0.9775215, 0.719796, 0.2286485, 1, 0, 0, 1, 1,
-0.9733375, 1.274316, -2.223593, 1, 0, 0, 1, 1,
-0.9715507, 0.9183888, 0.1965068, 1, 0, 0, 1, 1,
-0.9691394, 0.001072039, -1.495198, 0, 0, 0, 1, 1,
-0.9664986, -0.2293904, -0.7336812, 0, 0, 0, 1, 1,
-0.9636816, 0.5255641, -1.483037, 0, 0, 0, 1, 1,
-0.9631272, 0.3190923, -2.341185, 0, 0, 0, 1, 1,
-0.9577471, 0.09906427, -1.324128, 0, 0, 0, 1, 1,
-0.9570332, -1.056921, -1.469896, 0, 0, 0, 1, 1,
-0.955779, 1.471478, -1.887087, 0, 0, 0, 1, 1,
-0.9550517, -0.1474093, -2.358079, 1, 1, 1, 1, 1,
-0.9535446, -0.4787272, -1.614268, 1, 1, 1, 1, 1,
-0.9529703, 1.746209, 1.754278, 1, 1, 1, 1, 1,
-0.950702, -0.09704039, -1.96643, 1, 1, 1, 1, 1,
-0.9482012, 1.557329, 0.2409255, 1, 1, 1, 1, 1,
-0.9472043, -0.6616564, -1.372684, 1, 1, 1, 1, 1,
-0.9404852, -0.6021855, -2.071084, 1, 1, 1, 1, 1,
-0.9397747, 0.3163871, -1.321051, 1, 1, 1, 1, 1,
-0.9360147, 0.5190156, -2.358844, 1, 1, 1, 1, 1,
-0.9325865, 0.6105821, -0.3119969, 1, 1, 1, 1, 1,
-0.9236126, 0.2029719, -1.189271, 1, 1, 1, 1, 1,
-0.920569, 1.126755, -1.740345, 1, 1, 1, 1, 1,
-0.9166048, 0.6901794, -0.8227884, 1, 1, 1, 1, 1,
-0.9108569, -1.245064, -3.46021, 1, 1, 1, 1, 1,
-0.8992867, 2.322397, -0.327421, 1, 1, 1, 1, 1,
-0.8992297, 0.7638548, 0.1154828, 0, 0, 1, 1, 1,
-0.8972518, 0.5964296, -0.5593902, 1, 0, 0, 1, 1,
-0.8959501, 0.8731316, 0.06497721, 1, 0, 0, 1, 1,
-0.886804, 0.7790359, -1.637256, 1, 0, 0, 1, 1,
-0.8842038, 1.250033, 0.6587861, 1, 0, 0, 1, 1,
-0.8821698, 0.136548, -1.541693, 1, 0, 0, 1, 1,
-0.8777402, -0.1445379, -1.263644, 0, 0, 0, 1, 1,
-0.8735578, 1.117872, 0.6728856, 0, 0, 0, 1, 1,
-0.8693135, -0.07509558, -1.57658, 0, 0, 0, 1, 1,
-0.866694, 0.2302583, -1.057542, 0, 0, 0, 1, 1,
-0.865895, 1.01795, -0.5056045, 0, 0, 0, 1, 1,
-0.8634148, -0.331154, -3.174529, 0, 0, 0, 1, 1,
-0.8601817, -0.6203092, -1.423856, 0, 0, 0, 1, 1,
-0.8568234, 1.021629, 0.8093348, 1, 1, 1, 1, 1,
-0.8505622, -0.8311467, -1.985776, 1, 1, 1, 1, 1,
-0.8494747, 0.135486, -1.599482, 1, 1, 1, 1, 1,
-0.8470268, -2.257048, -2.720417, 1, 1, 1, 1, 1,
-0.8459221, -0.1286572, -1.432536, 1, 1, 1, 1, 1,
-0.8440768, -0.4772747, -1.854382, 1, 1, 1, 1, 1,
-0.8364782, -0.5724102, -1.826954, 1, 1, 1, 1, 1,
-0.831909, -0.4617281, -1.970906, 1, 1, 1, 1, 1,
-0.8305213, -2.259152, -2.678278, 1, 1, 1, 1, 1,
-0.819227, -0.7317305, -0.9013793, 1, 1, 1, 1, 1,
-0.8179004, -3.596874, -2.532395, 1, 1, 1, 1, 1,
-0.81495, -2.006095, -4.023461, 1, 1, 1, 1, 1,
-0.8147854, 1.300814, 0.06367441, 1, 1, 1, 1, 1,
-0.799794, 0.3998313, -1.261527, 1, 1, 1, 1, 1,
-0.7990233, -1.542068, -2.527437, 1, 1, 1, 1, 1,
-0.7963917, -0.2856696, -0.8430882, 0, 0, 1, 1, 1,
-0.795897, 1.231215, -1.539085, 1, 0, 0, 1, 1,
-0.7875759, 0.5484238, 0.8413581, 1, 0, 0, 1, 1,
-0.787452, -0.4963031, -3.059677, 1, 0, 0, 1, 1,
-0.7835363, -0.5233284, -2.685472, 1, 0, 0, 1, 1,
-0.7828928, 1.642823, 1.198956, 1, 0, 0, 1, 1,
-0.7792674, 0.3757581, -1.175471, 0, 0, 0, 1, 1,
-0.7754571, -0.3028926, -0.01044953, 0, 0, 0, 1, 1,
-0.7745684, 1.378663, 2.265265, 0, 0, 0, 1, 1,
-0.7744758, 0.3326634, -2.735896, 0, 0, 0, 1, 1,
-0.7731367, -1.107629, -2.714744, 0, 0, 0, 1, 1,
-0.7723199, -0.9952752, -2.694626, 0, 0, 0, 1, 1,
-0.7689461, 1.856938, -1.003082, 0, 0, 0, 1, 1,
-0.7675375, 0.6589685, -1.508846, 1, 1, 1, 1, 1,
-0.7673436, 0.1381735, -0.1831236, 1, 1, 1, 1, 1,
-0.7636684, 0.1959247, -1.306128, 1, 1, 1, 1, 1,
-0.7595681, -0.5510284, -4.056489, 1, 1, 1, 1, 1,
-0.7588189, -0.05575478, -1.748746, 1, 1, 1, 1, 1,
-0.7561826, 0.02636501, -1.846183, 1, 1, 1, 1, 1,
-0.7465398, 1.240453, -0.0133819, 1, 1, 1, 1, 1,
-0.7366465, -0.1570183, -3.562466, 1, 1, 1, 1, 1,
-0.735837, 0.162094, -2.432966, 1, 1, 1, 1, 1,
-0.7340698, 0.3954588, -1.209657, 1, 1, 1, 1, 1,
-0.7331236, 0.5835074, -2.069644, 1, 1, 1, 1, 1,
-0.7326445, -0.3717133, -2.234354, 1, 1, 1, 1, 1,
-0.7323942, 0.9033622, -0.07696614, 1, 1, 1, 1, 1,
-0.7256389, 0.281261, -1.250499, 1, 1, 1, 1, 1,
-0.7215934, -1.16284, -3.936699, 1, 1, 1, 1, 1,
-0.720481, 1.910418, 1.127258, 0, 0, 1, 1, 1,
-0.7197508, -0.4597728, -2.82334, 1, 0, 0, 1, 1,
-0.7160261, 1.008064, -1.862937, 1, 0, 0, 1, 1,
-0.7085278, -0.2816671, -2.979389, 1, 0, 0, 1, 1,
-0.7064682, 0.1522671, -1.308407, 1, 0, 0, 1, 1,
-0.7063126, 2.377447, -0.1682031, 1, 0, 0, 1, 1,
-0.6967986, -1.499364, -3.014511, 0, 0, 0, 1, 1,
-0.6924713, 0.5855569, 0.9021844, 0, 0, 0, 1, 1,
-0.6907637, 0.1633863, -1.098647, 0, 0, 0, 1, 1,
-0.6906667, 0.02392177, -1.047258, 0, 0, 0, 1, 1,
-0.6772497, -0.007758374, -0.7497939, 0, 0, 0, 1, 1,
-0.6716501, 1.926994, -1.593368, 0, 0, 0, 1, 1,
-0.6642228, -0.6692561, -1.394611, 0, 0, 0, 1, 1,
-0.6628264, -0.9704476, -1.899123, 1, 1, 1, 1, 1,
-0.6585674, -0.820262, -2.181468, 1, 1, 1, 1, 1,
-0.6571834, 0.7791319, -0.4764517, 1, 1, 1, 1, 1,
-0.6567442, 1.643378, -0.8041783, 1, 1, 1, 1, 1,
-0.6552773, 1.817909, 0.3678474, 1, 1, 1, 1, 1,
-0.6511065, -1.929399, -2.333283, 1, 1, 1, 1, 1,
-0.6484507, -0.6527478, -3.881066, 1, 1, 1, 1, 1,
-0.6440433, 0.6211107, -2.616394, 1, 1, 1, 1, 1,
-0.6438319, -0.4799416, -0.7790094, 1, 1, 1, 1, 1,
-0.6429309, -0.939107, -2.322441, 1, 1, 1, 1, 1,
-0.6428911, 1.068315, -1.620944, 1, 1, 1, 1, 1,
-0.6420184, -0.5913405, -3.268484, 1, 1, 1, 1, 1,
-0.6352777, -0.5571321, -3.220556, 1, 1, 1, 1, 1,
-0.6297228, 0.2264948, -2.82557, 1, 1, 1, 1, 1,
-0.6230849, 1.570601, -1.531026, 1, 1, 1, 1, 1,
-0.6192386, -0.5817927, -3.137677, 0, 0, 1, 1, 1,
-0.6130717, 0.329019, -0.152591, 1, 0, 0, 1, 1,
-0.6106345, 1.248598, -0.01307735, 1, 0, 0, 1, 1,
-0.609666, 1.659699, -0.298702, 1, 0, 0, 1, 1,
-0.6053845, 0.7073671, 1.591376, 1, 0, 0, 1, 1,
-0.6042963, 1.291084, 0.2658946, 1, 0, 0, 1, 1,
-0.6025853, -0.2999169, -2.850241, 0, 0, 0, 1, 1,
-0.5971843, 0.2097395, -0.369747, 0, 0, 0, 1, 1,
-0.5943117, 0.103765, -1.728962, 0, 0, 0, 1, 1,
-0.5926849, -0.4802186, -2.835988, 0, 0, 0, 1, 1,
-0.5871484, 0.2992273, 0.7179691, 0, 0, 0, 1, 1,
-0.5735068, 0.8714401, -0.1798095, 0, 0, 0, 1, 1,
-0.5722308, 0.6608425, -2.209752, 0, 0, 0, 1, 1,
-0.5713706, 1.200581, 0.0661464, 1, 1, 1, 1, 1,
-0.5693318, -0.1375105, -1.228878, 1, 1, 1, 1, 1,
-0.5664268, 0.2103864, -1.538681, 1, 1, 1, 1, 1,
-0.5613343, 0.04581077, -1.701942, 1, 1, 1, 1, 1,
-0.5600238, -0.5223949, -2.800242, 1, 1, 1, 1, 1,
-0.5565947, 0.7278647, 0.2459185, 1, 1, 1, 1, 1,
-0.5534824, -0.08777235, -3.697733, 1, 1, 1, 1, 1,
-0.5529769, 1.033473, 1.035063, 1, 1, 1, 1, 1,
-0.5459326, 1.524428, 0.6526085, 1, 1, 1, 1, 1,
-0.5423852, 0.8596528, 0.02612269, 1, 1, 1, 1, 1,
-0.5367934, -0.6511917, -2.739932, 1, 1, 1, 1, 1,
-0.5352128, -0.7347137, -5.568249, 1, 1, 1, 1, 1,
-0.5277355, -0.02762828, -3.809876, 1, 1, 1, 1, 1,
-0.5223121, -0.5237275, -1.336278, 1, 1, 1, 1, 1,
-0.5218531, -0.4769458, -4.20847, 1, 1, 1, 1, 1,
-0.5205806, 0.3489775, 0.9099541, 0, 0, 1, 1, 1,
-0.5167874, -0.1798632, -2.334715, 1, 0, 0, 1, 1,
-0.5127511, 0.2434596, -2.219878, 1, 0, 0, 1, 1,
-0.5119302, -0.8315079, -3.220683, 1, 0, 0, 1, 1,
-0.5115555, -0.6986188, -3.748731, 1, 0, 0, 1, 1,
-0.5103685, 0.1455863, -1.423387, 1, 0, 0, 1, 1,
-0.5075148, -1.055943, -2.394378, 0, 0, 0, 1, 1,
-0.5040556, 0.3933438, -0.6655084, 0, 0, 0, 1, 1,
-0.5005546, -0.1939143, -2.420904, 0, 0, 0, 1, 1,
-0.4964839, 1.043375, 1.606725, 0, 0, 0, 1, 1,
-0.4942521, 1.021923, 0.9347031, 0, 0, 0, 1, 1,
-0.4937537, -0.1516948, -2.096987, 0, 0, 0, 1, 1,
-0.4818309, -0.720672, -3.604208, 0, 0, 0, 1, 1,
-0.4809182, -0.4418202, -0.2206213, 1, 1, 1, 1, 1,
-0.4795262, 0.6506376, -0.3427365, 1, 1, 1, 1, 1,
-0.4779555, 0.8216031, -0.8949001, 1, 1, 1, 1, 1,
-0.4656028, -1.296039, -1.518655, 1, 1, 1, 1, 1,
-0.4601503, -1.111825, -2.597545, 1, 1, 1, 1, 1,
-0.4598626, -1.105543, -4.402888, 1, 1, 1, 1, 1,
-0.4590222, 0.7089948, -0.3838292, 1, 1, 1, 1, 1,
-0.4561918, 0.5535148, -1.288711, 1, 1, 1, 1, 1,
-0.4555535, -0.6379154, -2.589695, 1, 1, 1, 1, 1,
-0.4454915, -0.7009619, -3.26832, 1, 1, 1, 1, 1,
-0.4450634, 0.1157885, -1.25003, 1, 1, 1, 1, 1,
-0.4433421, -0.1850703, -2.511932, 1, 1, 1, 1, 1,
-0.4428923, -1.402071, -3.525264, 1, 1, 1, 1, 1,
-0.4417277, 0.6319032, -1.912676, 1, 1, 1, 1, 1,
-0.4387016, 1.276253, -0.3579833, 1, 1, 1, 1, 1,
-0.4373059, -1.215685, -2.927164, 0, 0, 1, 1, 1,
-0.4316464, -1.063111, -2.472432, 1, 0, 0, 1, 1,
-0.4311573, -0.9184964, -2.491371, 1, 0, 0, 1, 1,
-0.4300158, 1.495589, -1.429801, 1, 0, 0, 1, 1,
-0.4297573, 1.536141, 1.239218, 1, 0, 0, 1, 1,
-0.4276646, 0.826143, -2.447096, 1, 0, 0, 1, 1,
-0.4249791, -0.8496363, -3.467859, 0, 0, 0, 1, 1,
-0.4246638, -1.400519, -2.73887, 0, 0, 0, 1, 1,
-0.4237533, -2.610889, -3.6814, 0, 0, 0, 1, 1,
-0.4213039, 0.04706284, 0.3542846, 0, 0, 0, 1, 1,
-0.4185473, -1.853018, -2.691152, 0, 0, 0, 1, 1,
-0.4147955, 0.4523498, -0.9607608, 0, 0, 0, 1, 1,
-0.414169, -0.8010245, -2.655344, 0, 0, 0, 1, 1,
-0.4141123, -0.7806494, -2.10778, 1, 1, 1, 1, 1,
-0.4136928, -0.3370789, -2.482432, 1, 1, 1, 1, 1,
-0.4120106, 0.2078641, 0.7529297, 1, 1, 1, 1, 1,
-0.4096961, -0.2874487, -0.9432768, 1, 1, 1, 1, 1,
-0.409692, -1.022851, -1.720828, 1, 1, 1, 1, 1,
-0.4077127, -1.224465, -1.706349, 1, 1, 1, 1, 1,
-0.3892338, 0.5302405, -2.115657, 1, 1, 1, 1, 1,
-0.3835912, 0.1417048, -0.4218785, 1, 1, 1, 1, 1,
-0.3825427, 0.08368258, 0.1795293, 1, 1, 1, 1, 1,
-0.379165, 1.121294, -0.5148432, 1, 1, 1, 1, 1,
-0.3778629, -0.8225387, -2.697699, 1, 1, 1, 1, 1,
-0.3759679, -0.7712569, -2.065966, 1, 1, 1, 1, 1,
-0.3663868, -1.273506, -3.203186, 1, 1, 1, 1, 1,
-0.3661039, 0.9573292, -1.309646, 1, 1, 1, 1, 1,
-0.3628749, 0.05055432, -1.662864, 1, 1, 1, 1, 1,
-0.3570698, 1.772026, 0.9210583, 0, 0, 1, 1, 1,
-0.3556628, 0.7974803, -1.704926, 1, 0, 0, 1, 1,
-0.3509836, -2.117846, -2.59117, 1, 0, 0, 1, 1,
-0.3503199, 1.865335, 0.7077616, 1, 0, 0, 1, 1,
-0.3498094, 0.8201444, -1.027661, 1, 0, 0, 1, 1,
-0.3468508, -1.353071, -4.600924, 1, 0, 0, 1, 1,
-0.3431307, 1.198884, -1.156052, 0, 0, 0, 1, 1,
-0.342528, -0.9547547, -3.001513, 0, 0, 0, 1, 1,
-0.341586, 0.4963238, -1.066496, 0, 0, 0, 1, 1,
-0.3393086, 0.5683552, -0.1362964, 0, 0, 0, 1, 1,
-0.3355564, 2.086803, -1.082124, 0, 0, 0, 1, 1,
-0.3329182, 0.04363161, -1.581924, 0, 0, 0, 1, 1,
-0.3289065, -0.9991661, -4.220289, 0, 0, 0, 1, 1,
-0.3260161, -0.2136097, -2.066406, 1, 1, 1, 1, 1,
-0.3256299, -1.943227, -3.546987, 1, 1, 1, 1, 1,
-0.3197716, -0.7378387, -2.449189, 1, 1, 1, 1, 1,
-0.3142393, 0.8442031, 1.14943, 1, 1, 1, 1, 1,
-0.3138993, -0.1183939, -2.145316, 1, 1, 1, 1, 1,
-0.3121617, 1.447428, -0.7905868, 1, 1, 1, 1, 1,
-0.3119147, 1.250523, -0.7733661, 1, 1, 1, 1, 1,
-0.3090001, 0.0003700695, -0.1825873, 1, 1, 1, 1, 1,
-0.3076785, 0.4582381, -2.628786, 1, 1, 1, 1, 1,
-0.3063249, 0.9240505, 0.20405, 1, 1, 1, 1, 1,
-0.3016614, 2.515965, -0.8674249, 1, 1, 1, 1, 1,
-0.2987495, -0.2036205, -1.671684, 1, 1, 1, 1, 1,
-0.2985089, -0.3480057, -3.533203, 1, 1, 1, 1, 1,
-0.2980646, -1.027308, -2.117216, 1, 1, 1, 1, 1,
-0.2973559, 0.290019, -1.79559, 1, 1, 1, 1, 1,
-0.2907906, -0.0116354, -1.862237, 0, 0, 1, 1, 1,
-0.286982, -1.289877, -1.935391, 1, 0, 0, 1, 1,
-0.2836468, 0.531944, -0.7011994, 1, 0, 0, 1, 1,
-0.2835855, 0.9814985, -1.135928, 1, 0, 0, 1, 1,
-0.2831618, -0.4974824, -1.581336, 1, 0, 0, 1, 1,
-0.2804911, 1.265015, -0.02389237, 1, 0, 0, 1, 1,
-0.2796925, 0.5623251, -1.376363, 0, 0, 0, 1, 1,
-0.2771847, -1.839477, -3.20575, 0, 0, 0, 1, 1,
-0.2766583, -0.835594, -3.117203, 0, 0, 0, 1, 1,
-0.2750467, -0.03112245, -0.1788404, 0, 0, 0, 1, 1,
-0.2746787, 1.819514, 0.2859248, 0, 0, 0, 1, 1,
-0.2735955, 0.4522424, -0.4994305, 0, 0, 0, 1, 1,
-0.2735654, -0.6233591, -3.371278, 0, 0, 0, 1, 1,
-0.2685876, 0.2629491, -1.039969, 1, 1, 1, 1, 1,
-0.267615, -0.3867424, -1.707501, 1, 1, 1, 1, 1,
-0.2656551, -0.1169103, -2.817408, 1, 1, 1, 1, 1,
-0.2639023, 0.06065235, -0.4519598, 1, 1, 1, 1, 1,
-0.2608309, 0.09625529, 0.8054377, 1, 1, 1, 1, 1,
-0.2492248, 0.5823763, -1.572006, 1, 1, 1, 1, 1,
-0.2491218, -0.6896675, -2.443083, 1, 1, 1, 1, 1,
-0.2487897, 0.5487303, 0.2474951, 1, 1, 1, 1, 1,
-0.2465304, -1.684842, -3.727146, 1, 1, 1, 1, 1,
-0.2429633, -0.5101021, -4.07502, 1, 1, 1, 1, 1,
-0.2429039, -0.1105799, -2.653163, 1, 1, 1, 1, 1,
-0.2411301, 0.1745498, -0.6343705, 1, 1, 1, 1, 1,
-0.2395862, -0.6144897, -2.649818, 1, 1, 1, 1, 1,
-0.235767, -0.9144282, -2.268428, 1, 1, 1, 1, 1,
-0.2355497, -0.7741975, -2.400332, 1, 1, 1, 1, 1,
-0.2341669, 0.2585142, -0.2482489, 0, 0, 1, 1, 1,
-0.2295702, 0.003368369, -2.076083, 1, 0, 0, 1, 1,
-0.2217995, -0.2333011, -2.232295, 1, 0, 0, 1, 1,
-0.2183458, 0.167463, -1.737686, 1, 0, 0, 1, 1,
-0.2137153, 1.68043, 0.4953734, 1, 0, 0, 1, 1,
-0.2132574, -0.484919, -3.204324, 1, 0, 0, 1, 1,
-0.2087298, 0.1575345, -0.5950891, 0, 0, 0, 1, 1,
-0.2083233, 0.2719197, 0.7121936, 0, 0, 0, 1, 1,
-0.2052969, 0.6220317, 0.5056792, 0, 0, 0, 1, 1,
-0.2031709, 0.6897728, -1.020129, 0, 0, 0, 1, 1,
-0.1934015, 0.976655, 2.53767, 0, 0, 0, 1, 1,
-0.1912935, 0.63797, 1.253208, 0, 0, 0, 1, 1,
-0.1908289, -0.1455283, -1.357155, 0, 0, 0, 1, 1,
-0.1897157, -0.9826395, -3.206256, 1, 1, 1, 1, 1,
-0.1871144, 0.2892245, -0.1215027, 1, 1, 1, 1, 1,
-0.1854151, -1.743193, -1.152892, 1, 1, 1, 1, 1,
-0.1823552, -0.8735581, -3.864403, 1, 1, 1, 1, 1,
-0.1760018, 1.40223, -0.8187728, 1, 1, 1, 1, 1,
-0.1753314, -0.8267654, -2.962461, 1, 1, 1, 1, 1,
-0.1747421, -0.457207, -3.13114, 1, 1, 1, 1, 1,
-0.1744577, -0.742843, -1.895155, 1, 1, 1, 1, 1,
-0.1682565, -2.230575, -4.041631, 1, 1, 1, 1, 1,
-0.1655863, -0.9519369, -3.010503, 1, 1, 1, 1, 1,
-0.1605686, 0.6063073, 1.22414, 1, 1, 1, 1, 1,
-0.1571216, 0.299183, -0.2754043, 1, 1, 1, 1, 1,
-0.1545816, -1.808791, -3.932797, 1, 1, 1, 1, 1,
-0.1514746, -1.71152, -3.212547, 1, 1, 1, 1, 1,
-0.1432415, 0.6258883, -0.4699712, 1, 1, 1, 1, 1,
-0.1423793, 0.7333163, -1.036598, 0, 0, 1, 1, 1,
-0.1415449, 0.1677333, -2.107187, 1, 0, 0, 1, 1,
-0.1404075, -1.176224, -3.334049, 1, 0, 0, 1, 1,
-0.1401587, 2.17464, -1.812668, 1, 0, 0, 1, 1,
-0.1389355, 0.6251413, -1.364338, 1, 0, 0, 1, 1,
-0.1384911, 1.354001, -0.6676505, 1, 0, 0, 1, 1,
-0.1357421, 0.04013392, -1.083772, 0, 0, 0, 1, 1,
-0.1326194, 0.9276218, 0.151057, 0, 0, 0, 1, 1,
-0.1309452, 0.927058, -0.7155358, 0, 0, 0, 1, 1,
-0.1308145, -0.7988593, -2.753191, 0, 0, 0, 1, 1,
-0.1300768, -0.1586654, -2.424166, 0, 0, 0, 1, 1,
-0.1296699, -0.6641785, -0.2357232, 0, 0, 0, 1, 1,
-0.1285936, -1.389104, -4.496136, 0, 0, 0, 1, 1,
-0.127402, -0.9258217, -2.623012, 1, 1, 1, 1, 1,
-0.1267172, -1.158424, -2.595352, 1, 1, 1, 1, 1,
-0.1260073, -0.03407912, -1.715277, 1, 1, 1, 1, 1,
-0.1230457, 1.901053, -1.4188, 1, 1, 1, 1, 1,
-0.1216178, 0.6028195, -0.5078853, 1, 1, 1, 1, 1,
-0.1140902, 0.9606388, 0.7549126, 1, 1, 1, 1, 1,
-0.1111491, -0.1738921, -0.6329405, 1, 1, 1, 1, 1,
-0.1100062, -0.9912378, -2.191384, 1, 1, 1, 1, 1,
-0.1088031, 0.1221575, -1.461691, 1, 1, 1, 1, 1,
-0.1028696, 0.9702948, 0.5873204, 1, 1, 1, 1, 1,
-0.1014267, -1.821728, -4.278568, 1, 1, 1, 1, 1,
-0.09977768, 0.6280192, -0.9123443, 1, 1, 1, 1, 1,
-0.09962519, 0.5252832, -0.647261, 1, 1, 1, 1, 1,
-0.0987019, -0.3148238, -2.692728, 1, 1, 1, 1, 1,
-0.09057291, -0.1315738, -2.837025, 1, 1, 1, 1, 1,
-0.08878178, -0.5424757, -2.852025, 0, 0, 1, 1, 1,
-0.08440223, -0.5183075, -3.241267, 1, 0, 0, 1, 1,
-0.08321496, -0.9816039, -1.703549, 1, 0, 0, 1, 1,
-0.08263721, 0.6312231, 0.4574141, 1, 0, 0, 1, 1,
-0.06568418, -0.1497484, -2.45241, 1, 0, 0, 1, 1,
-0.0647249, -0.7548048, -4.944808, 1, 0, 0, 1, 1,
-0.06175252, -2.436042, -2.180634, 0, 0, 0, 1, 1,
-0.05941289, -0.4140452, -2.192795, 0, 0, 0, 1, 1,
-0.05868345, 1.411525, 1.205862, 0, 0, 0, 1, 1,
-0.05272878, 0.915543, 1.54288, 0, 0, 0, 1, 1,
-0.05247573, 0.3793043, -0.9184844, 0, 0, 0, 1, 1,
-0.05063887, -0.09515902, -1.791757, 0, 0, 0, 1, 1,
-0.04976442, -1.507558, -2.885311, 0, 0, 0, 1, 1,
-0.04497084, 0.6089171, 1.276877, 1, 1, 1, 1, 1,
-0.04110753, 1.841192, 0.3867619, 1, 1, 1, 1, 1,
-0.0352595, -0.3648831, -2.928609, 1, 1, 1, 1, 1,
-0.03466275, -0.1823736, -2.651275, 1, 1, 1, 1, 1,
-0.03248036, -1.107611, -2.922999, 1, 1, 1, 1, 1,
-0.03165084, -1.054852, -3.082349, 1, 1, 1, 1, 1,
-0.03053057, 1.137175, -0.09188099, 1, 1, 1, 1, 1,
-0.03023896, 0.55678, 0.8538262, 1, 1, 1, 1, 1,
-0.02996379, -0.6023382, -2.442514, 1, 1, 1, 1, 1,
-0.02645084, -1.491904, -2.837579, 1, 1, 1, 1, 1,
-0.02544271, -0.526357, -3.853698, 1, 1, 1, 1, 1,
-0.01919569, 0.0867086, 0.5175681, 1, 1, 1, 1, 1,
-0.01917387, -1.657257, -4.202757, 1, 1, 1, 1, 1,
-0.01794043, -0.01242813, -1.561064, 1, 1, 1, 1, 1,
-0.01339014, -0.6710855, -3.857036, 1, 1, 1, 1, 1,
-0.01332855, 0.7643397, -1.301733, 0, 0, 1, 1, 1,
-0.006735032, -1.41902, -3.481444, 1, 0, 0, 1, 1,
-0.005495874, -1.452366, -0.8315792, 1, 0, 0, 1, 1,
-0.004564693, 0.03599634, 0.1372889, 1, 0, 0, 1, 1,
-0.003902925, 0.3406059, 0.06313936, 1, 0, 0, 1, 1,
-0.001157837, 1.47823, -1.442549, 1, 0, 0, 1, 1,
0.00718202, 0.9203415, -0.4330217, 0, 0, 0, 1, 1,
0.007283217, 1.124473, -0.05421113, 0, 0, 0, 1, 1,
0.008223241, -0.6811088, 2.980216, 0, 0, 0, 1, 1,
0.008561233, -1.094542, 2.428056, 0, 0, 0, 1, 1,
0.01302837, -0.1822495, 2.769207, 0, 0, 0, 1, 1,
0.01394306, -0.1831131, 3.170575, 0, 0, 0, 1, 1,
0.01642437, 0.3653598, -0.5201912, 0, 0, 0, 1, 1,
0.01655331, 0.3656482, 0.6299764, 1, 1, 1, 1, 1,
0.01951733, 0.01654116, 1.3828, 1, 1, 1, 1, 1,
0.01958873, 0.8021601, 0.1164575, 1, 1, 1, 1, 1,
0.02121665, 0.3608895, 1.929867, 1, 1, 1, 1, 1,
0.0222169, -0.3333413, 4.247437, 1, 1, 1, 1, 1,
0.0254109, 0.3119451, 1.595225, 1, 1, 1, 1, 1,
0.02668678, 0.2158134, -1.207435, 1, 1, 1, 1, 1,
0.02670905, -0.4009434, 2.763298, 1, 1, 1, 1, 1,
0.02794067, 0.4831938, -0.3106561, 1, 1, 1, 1, 1,
0.02941724, 0.7693894, 1.061158, 1, 1, 1, 1, 1,
0.02960082, -0.6053385, 2.559233, 1, 1, 1, 1, 1,
0.0345794, -1.380737, 4.593172, 1, 1, 1, 1, 1,
0.03527604, 1.303445, 1.421867, 1, 1, 1, 1, 1,
0.04045495, 0.3348384, -0.8938935, 1, 1, 1, 1, 1,
0.04384783, 0.04234275, 0.1661069, 1, 1, 1, 1, 1,
0.04678515, -1.806885, 4.01549, 0, 0, 1, 1, 1,
0.04719757, -0.2621183, 3.880747, 1, 0, 0, 1, 1,
0.04846476, -0.4802146, 2.594288, 1, 0, 0, 1, 1,
0.04983134, 1.496195, -0.4745272, 1, 0, 0, 1, 1,
0.05014341, -0.668802, 4.078321, 1, 0, 0, 1, 1,
0.05255147, 0.2756957, 0.1474843, 1, 0, 0, 1, 1,
0.0534182, -0.5544697, 2.872519, 0, 0, 0, 1, 1,
0.06298101, -0.211447, 2.81721, 0, 0, 0, 1, 1,
0.06722796, -0.7544448, 3.267733, 0, 0, 0, 1, 1,
0.06877665, 0.6213027, 0.1612648, 0, 0, 0, 1, 1,
0.07272319, 0.2202183, 0.9329206, 0, 0, 0, 1, 1,
0.07557578, 1.716818, 1.099468, 0, 0, 0, 1, 1,
0.07661615, 1.242571, -1.370724, 0, 0, 0, 1, 1,
0.07777867, 1.438915, 1.093126, 1, 1, 1, 1, 1,
0.07928672, 0.750003, -0.4083903, 1, 1, 1, 1, 1,
0.07942446, 0.6330494, -1.055169, 1, 1, 1, 1, 1,
0.08675627, 1.245546, 0.7554103, 1, 1, 1, 1, 1,
0.09048638, 1.45779, 1.249302, 1, 1, 1, 1, 1,
0.09170176, 0.9818271, 0.7774579, 1, 1, 1, 1, 1,
0.103592, 1.232587, 0.2361128, 1, 1, 1, 1, 1,
0.1150444, -0.559018, 4.151499, 1, 1, 1, 1, 1,
0.1282679, -1.330467, 4.045466, 1, 1, 1, 1, 1,
0.1282845, -2.196552, 2.720984, 1, 1, 1, 1, 1,
0.132949, 0.2817315, 0.2741496, 1, 1, 1, 1, 1,
0.1356753, -0.3390249, 1.125374, 1, 1, 1, 1, 1,
0.1387686, -0.3053126, 3.381103, 1, 1, 1, 1, 1,
0.1404631, 0.6795373, -0.6147287, 1, 1, 1, 1, 1,
0.1416511, 0.04223423, 1.858765, 1, 1, 1, 1, 1,
0.1419929, -0.7688849, 1.894175, 0, 0, 1, 1, 1,
0.1429404, 0.3677878, 0.1749877, 1, 0, 0, 1, 1,
0.1430077, -1.059249, 4.215803, 1, 0, 0, 1, 1,
0.1432472, -0.08228111, 1.382853, 1, 0, 0, 1, 1,
0.144656, -0.7388837, 0.7886032, 1, 0, 0, 1, 1,
0.1447683, -0.6837511, 2.572775, 1, 0, 0, 1, 1,
0.1466991, 0.8517591, 0.1571964, 0, 0, 0, 1, 1,
0.1472293, -0.1845309, 1.752478, 0, 0, 0, 1, 1,
0.1501755, -0.003859656, 1.703695, 0, 0, 0, 1, 1,
0.1508124, -0.4171483, 3.137736, 0, 0, 0, 1, 1,
0.1519402, 0.8871337, -1.787099, 0, 0, 0, 1, 1,
0.1579795, 0.3464557, 1.392508, 0, 0, 0, 1, 1,
0.1588475, 0.5816349, 1.136188, 0, 0, 0, 1, 1,
0.161639, 0.3275304, 1.430189, 1, 1, 1, 1, 1,
0.1619622, 1.016297, 1.550261, 1, 1, 1, 1, 1,
0.1634312, 0.06700981, 1.639366, 1, 1, 1, 1, 1,
0.1643037, -1.579109, 4.598109, 1, 1, 1, 1, 1,
0.1647559, 1.476233, -0.03969129, 1, 1, 1, 1, 1,
0.1649145, 1.61675, -0.2946028, 1, 1, 1, 1, 1,
0.1673422, 1.054362, 0.3352906, 1, 1, 1, 1, 1,
0.1683655, 1.347948, -0.5543073, 1, 1, 1, 1, 1,
0.1702673, -1.503155, 1.808861, 1, 1, 1, 1, 1,
0.1717039, 0.02113134, 1.426378, 1, 1, 1, 1, 1,
0.1728129, 0.22187, 1.348687, 1, 1, 1, 1, 1,
0.1746123, -0.4080695, 3.709099, 1, 1, 1, 1, 1,
0.1775646, -1.680296, 1.92131, 1, 1, 1, 1, 1,
0.1836638, -1.169398, 1.059195, 1, 1, 1, 1, 1,
0.1839677, 0.0298443, 2.250709, 1, 1, 1, 1, 1,
0.1858418, 1.559603, -0.6341876, 0, 0, 1, 1, 1,
0.1862439, 0.6477598, 0.06103852, 1, 0, 0, 1, 1,
0.1936826, 0.6988333, -0.3899822, 1, 0, 0, 1, 1,
0.1942219, -1.476838, 3.720998, 1, 0, 0, 1, 1,
0.196771, 0.978522, 0.57361, 1, 0, 0, 1, 1,
0.1984358, 0.1338072, 0.8075357, 1, 0, 0, 1, 1,
0.20008, 0.6387908, -0.7631766, 0, 0, 0, 1, 1,
0.2038614, -1.275084, 4.363455, 0, 0, 0, 1, 1,
0.2091986, -0.1414849, 2.895538, 0, 0, 0, 1, 1,
0.2155161, -0.1056014, 1.528979, 0, 0, 0, 1, 1,
0.2178646, 1.005554, -2.27386, 0, 0, 0, 1, 1,
0.2204801, 0.6364244, 0.4312857, 0, 0, 0, 1, 1,
0.2220243, 0.4348605, 1.839736, 0, 0, 0, 1, 1,
0.2284985, -1.87298, 1.802879, 1, 1, 1, 1, 1,
0.2298466, -0.00887336, 1.956993, 1, 1, 1, 1, 1,
0.2300809, -0.3188727, 2.880325, 1, 1, 1, 1, 1,
0.2355309, 0.752592, -0.7253593, 1, 1, 1, 1, 1,
0.2393792, -2.14234, 3.451312, 1, 1, 1, 1, 1,
0.240191, -0.2980344, 1.983228, 1, 1, 1, 1, 1,
0.2433504, 1.026699, 0.6068742, 1, 1, 1, 1, 1,
0.2480673, 0.4673815, 1.100378, 1, 1, 1, 1, 1,
0.2563685, 0.4047755, -0.2435645, 1, 1, 1, 1, 1,
0.2593006, -1.637011, 2.7393, 1, 1, 1, 1, 1,
0.2600402, 0.2727865, 0.006340584, 1, 1, 1, 1, 1,
0.2655517, 1.291327, -0.8494872, 1, 1, 1, 1, 1,
0.2686975, 1.496177, 1.075167, 1, 1, 1, 1, 1,
0.2696227, -0.07567508, 2.233808, 1, 1, 1, 1, 1,
0.2726097, 0.5152192, 0.008760679, 1, 1, 1, 1, 1,
0.2746776, 1.333461, -1.813543, 0, 0, 1, 1, 1,
0.2780537, -0.1291865, 0.5877053, 1, 0, 0, 1, 1,
0.2785356, -0.1013222, 2.628426, 1, 0, 0, 1, 1,
0.2813317, 2.098882, 1.503553, 1, 0, 0, 1, 1,
0.2825286, -1.048074, 2.763754, 1, 0, 0, 1, 1,
0.2828034, 0.335406, 0.9444909, 1, 0, 0, 1, 1,
0.2896937, 0.5124781, 0.02986058, 0, 0, 0, 1, 1,
0.2967442, -0.4565043, 3.733234, 0, 0, 0, 1, 1,
0.298784, -1.90164, 2.696861, 0, 0, 0, 1, 1,
0.2991014, 1.523954, 0.06807733, 0, 0, 0, 1, 1,
0.3003868, -0.3749818, 0.8449069, 0, 0, 0, 1, 1,
0.301055, 0.2423484, 0.4110855, 0, 0, 0, 1, 1,
0.3016906, 1.858966, -1.092958, 0, 0, 0, 1, 1,
0.3021306, 1.832705, -1.082599, 1, 1, 1, 1, 1,
0.3041877, -0.5979286, 2.957301, 1, 1, 1, 1, 1,
0.3046547, 1.452757, 0.5481338, 1, 1, 1, 1, 1,
0.3059831, 0.4288108, 0.3414145, 1, 1, 1, 1, 1,
0.3064943, -0.09296805, 2.664789, 1, 1, 1, 1, 1,
0.3078814, 1.002557, 0.5965677, 1, 1, 1, 1, 1,
0.3082435, 2.31298, -1.633828, 1, 1, 1, 1, 1,
0.3111063, 0.1180986, 0.3468229, 1, 1, 1, 1, 1,
0.3128256, 0.8540002, -0.4619917, 1, 1, 1, 1, 1,
0.3186001, -0.1908713, 1.937627, 1, 1, 1, 1, 1,
0.3224543, 0.1114579, 1.02656, 1, 1, 1, 1, 1,
0.3232938, -0.008148248, 1.226918, 1, 1, 1, 1, 1,
0.3238735, -1.62611, 4.789323, 1, 1, 1, 1, 1,
0.3267511, 1.220178, -0.9672769, 1, 1, 1, 1, 1,
0.3324048, -1.747982, 3.741132, 1, 1, 1, 1, 1,
0.3332746, 1.591149, 0.382216, 0, 0, 1, 1, 1,
0.3338807, 0.003876685, 2.027808, 1, 0, 0, 1, 1,
0.3340912, 1.955819, -0.4677714, 1, 0, 0, 1, 1,
0.3354244, 1.945314, 1.006469, 1, 0, 0, 1, 1,
0.3486894, 1.678153, -0.2350885, 1, 0, 0, 1, 1,
0.3499111, -0.5283251, 2.428294, 1, 0, 0, 1, 1,
0.3503185, 0.3282675, -0.2733639, 0, 0, 0, 1, 1,
0.3512861, 0.7201057, 0.646134, 0, 0, 0, 1, 1,
0.3521949, 0.6720154, -0.331759, 0, 0, 0, 1, 1,
0.3578227, 0.4217829, 1.818122, 0, 0, 0, 1, 1,
0.3587091, -1.571277, 3.303251, 0, 0, 0, 1, 1,
0.3720021, -1.067177, 4.536418, 0, 0, 0, 1, 1,
0.3752574, -0.5728775, 4.595859, 0, 0, 0, 1, 1,
0.3755344, -1.667612, 3.259644, 1, 1, 1, 1, 1,
0.3776394, 0.7428548, 0.5762588, 1, 1, 1, 1, 1,
0.3804616, -1.718734, 2.946416, 1, 1, 1, 1, 1,
0.3839634, -0.3638753, 2.827486, 1, 1, 1, 1, 1,
0.3863422, -1.42852, 3.218879, 1, 1, 1, 1, 1,
0.3871881, -0.08342075, 1.325482, 1, 1, 1, 1, 1,
0.3914388, -0.660478, 3.414898, 1, 1, 1, 1, 1,
0.3914717, -0.4385842, 0.9433922, 1, 1, 1, 1, 1,
0.3936285, -0.1767363, 2.825845, 1, 1, 1, 1, 1,
0.3991652, 1.199861, -0.4570395, 1, 1, 1, 1, 1,
0.4005442, -0.3594107, 2.462672, 1, 1, 1, 1, 1,
0.4022172, -1.982632, 2.944516, 1, 1, 1, 1, 1,
0.4056808, 1.26758, 0.9322588, 1, 1, 1, 1, 1,
0.4074251, 1.550178, 0.9878758, 1, 1, 1, 1, 1,
0.4077041, 0.8375897, 0.872177, 1, 1, 1, 1, 1,
0.4114777, -0.8500641, 1.674353, 0, 0, 1, 1, 1,
0.4152255, -1.659262, 1.72526, 1, 0, 0, 1, 1,
0.4169103, 0.8140142, 0.7074555, 1, 0, 0, 1, 1,
0.417769, -0.4224131, 2.39107, 1, 0, 0, 1, 1,
0.4195915, -0.7539389, 2.623456, 1, 0, 0, 1, 1,
0.4239606, -1.22429, 4.374486, 1, 0, 0, 1, 1,
0.4241526, 0.4165837, 1.011992, 0, 0, 0, 1, 1,
0.4258218, -0.9222311, 1.978219, 0, 0, 0, 1, 1,
0.4316197, -1.344347, 1.187908, 0, 0, 0, 1, 1,
0.4331239, -0.6753505, 4.028157, 0, 0, 0, 1, 1,
0.4353946, -1.144757, 3.045727, 0, 0, 0, 1, 1,
0.4367805, 0.0579182, 0.7323546, 0, 0, 0, 1, 1,
0.4368308, 0.1957434, 0.1650003, 0, 0, 0, 1, 1,
0.4374665, -0.8280614, 2.703001, 1, 1, 1, 1, 1,
0.4388604, 0.2119091, -0.01682921, 1, 1, 1, 1, 1,
0.4394609, -2.071484, 3.613276, 1, 1, 1, 1, 1,
0.4413674, -1.027116, 2.861877, 1, 1, 1, 1, 1,
0.4473059, -0.06209312, 0.2719187, 1, 1, 1, 1, 1,
0.4494053, 1.723481, -1.254203, 1, 1, 1, 1, 1,
0.4503666, -0.4380821, 2.130277, 1, 1, 1, 1, 1,
0.4513472, -1.759249, 3.88722, 1, 1, 1, 1, 1,
0.4540154, -0.4582728, 1.964436, 1, 1, 1, 1, 1,
0.4541635, 0.1020118, -0.4480571, 1, 1, 1, 1, 1,
0.4550012, 0.1426239, 1.201194, 1, 1, 1, 1, 1,
0.456083, -0.9383564, 3.501626, 1, 1, 1, 1, 1,
0.4562615, -0.4469745, 2.738507, 1, 1, 1, 1, 1,
0.457154, 0.2458871, 0.7438912, 1, 1, 1, 1, 1,
0.4627876, 0.9770949, 1.225643, 1, 1, 1, 1, 1,
0.464002, 0.7756299, 0.2624621, 0, 0, 1, 1, 1,
0.4648603, -1.429727, 1.97366, 1, 0, 0, 1, 1,
0.4649393, 2.062424, -0.3051494, 1, 0, 0, 1, 1,
0.4689254, 0.4190419, -0.04917726, 1, 0, 0, 1, 1,
0.4716498, -0.5801226, 2.149338, 1, 0, 0, 1, 1,
0.475734, -1.171504, 3.294022, 1, 0, 0, 1, 1,
0.4789501, 0.4364931, 2.132041, 0, 0, 0, 1, 1,
0.479798, 0.1572104, 1.128526, 0, 0, 0, 1, 1,
0.4805644, 1.582257, 0.2072606, 0, 0, 0, 1, 1,
0.4833117, -0.5686751, 2.495924, 0, 0, 0, 1, 1,
0.4847559, 0.02931037, 0.1236981, 0, 0, 0, 1, 1,
0.4852714, 1.57852, 0.3903322, 0, 0, 0, 1, 1,
0.4873696, -0.2072393, 1.369459, 0, 0, 0, 1, 1,
0.4884174, -0.795432, 3.443479, 1, 1, 1, 1, 1,
0.4884291, -1.30667, 3.226543, 1, 1, 1, 1, 1,
0.4894114, -0.5501236, 1.670148, 1, 1, 1, 1, 1,
0.4898605, 0.1389188, 1.743631, 1, 1, 1, 1, 1,
0.4909866, -0.1490914, 2.860459, 1, 1, 1, 1, 1,
0.4923767, -0.7378629, 3.24444, 1, 1, 1, 1, 1,
0.500335, -1.342492, 3.80683, 1, 1, 1, 1, 1,
0.5042562, 0.7806495, 0.2821724, 1, 1, 1, 1, 1,
0.5067417, 0.09933991, 0.7582027, 1, 1, 1, 1, 1,
0.5134193, 1.32226, -1.326368, 1, 1, 1, 1, 1,
0.5160674, -1.157527, 0.4696541, 1, 1, 1, 1, 1,
0.5163128, -0.3402528, 1.216289, 1, 1, 1, 1, 1,
0.516619, -0.3516113, 0.6950397, 1, 1, 1, 1, 1,
0.5215657, 0.5656351, 1.089136, 1, 1, 1, 1, 1,
0.5218264, 2.417878, -0.9439671, 1, 1, 1, 1, 1,
0.523918, -1.484478, 1.603675, 0, 0, 1, 1, 1,
0.5246239, 1.994382, 0.1559033, 1, 0, 0, 1, 1,
0.5275398, -1.292773, 4.284029, 1, 0, 0, 1, 1,
0.5282383, 1.128533, 1.586186, 1, 0, 0, 1, 1,
0.5307037, -1.327216, 3.073578, 1, 0, 0, 1, 1,
0.5351185, 0.5631407, 1.359762, 1, 0, 0, 1, 1,
0.5401756, 0.8705245, 0.03422818, 0, 0, 0, 1, 1,
0.5417966, -0.06880306, 1.295075, 0, 0, 0, 1, 1,
0.5475657, 0.6664981, -0.8946653, 0, 0, 0, 1, 1,
0.5478827, 0.7513447, 0.2291792, 0, 0, 0, 1, 1,
0.5512547, 0.4727244, 0.1924353, 0, 0, 0, 1, 1,
0.5527018, 0.0457263, 1.426662, 0, 0, 0, 1, 1,
0.5529447, -0.2072652, 0.9839402, 0, 0, 0, 1, 1,
0.5722698, 0.4387935, 1.448862, 1, 1, 1, 1, 1,
0.5738754, 1.158967, 1.845516, 1, 1, 1, 1, 1,
0.5779307, -0.6608464, 3.127133, 1, 1, 1, 1, 1,
0.5802493, -0.3900965, 2.895279, 1, 1, 1, 1, 1,
0.581193, 0.01670841, 3.18661, 1, 1, 1, 1, 1,
0.5877209, -0.8093857, 3.884051, 1, 1, 1, 1, 1,
0.5948715, -0.276237, 2.247719, 1, 1, 1, 1, 1,
0.5949748, -0.5914072, 3.374342, 1, 1, 1, 1, 1,
0.5988488, 0.9199042, 0.6014324, 1, 1, 1, 1, 1,
0.603376, 0.1200831, 1.189648, 1, 1, 1, 1, 1,
0.6181526, 0.2768247, 0.5609755, 1, 1, 1, 1, 1,
0.6186994, 0.6311613, -1.064555, 1, 1, 1, 1, 1,
0.6192397, 0.9774746, 1.856675, 1, 1, 1, 1, 1,
0.6241624, -0.1374063, 2.341702, 1, 1, 1, 1, 1,
0.625389, -1.133666, 3.993565, 1, 1, 1, 1, 1,
0.6285977, -0.9365875, 1.845989, 0, 0, 1, 1, 1,
0.6290912, 1.008197, 2.807163, 1, 0, 0, 1, 1,
0.6301309, 0.6934848, 1.134173, 1, 0, 0, 1, 1,
0.6347467, -0.1070254, 2.607315, 1, 0, 0, 1, 1,
0.6358903, -1.894661, 3.240381, 1, 0, 0, 1, 1,
0.6370292, 0.2919012, 2.791366, 1, 0, 0, 1, 1,
0.6400117, 1.243476, 0.7561486, 0, 0, 0, 1, 1,
0.6433353, 0.8601186, 2.106674, 0, 0, 0, 1, 1,
0.6482144, 0.5051529, 0.0188624, 0, 0, 0, 1, 1,
0.6548262, 1.940242, -0.5055567, 0, 0, 0, 1, 1,
0.6605271, -2.335145, 1.440583, 0, 0, 0, 1, 1,
0.6612471, -0.9514075, 1.558848, 0, 0, 0, 1, 1,
0.6647015, 0.8634136, -0.1846274, 0, 0, 0, 1, 1,
0.6681591, -0.1948022, 2.700818, 1, 1, 1, 1, 1,
0.6687056, -1.089395, 2.589129, 1, 1, 1, 1, 1,
0.672549, -0.4503609, 3.2021, 1, 1, 1, 1, 1,
0.6728964, -0.8713076, 5.37267, 1, 1, 1, 1, 1,
0.6747051, -1.847236, 2.795013, 1, 1, 1, 1, 1,
0.6753417, 0.06330548, 2.926569, 1, 1, 1, 1, 1,
0.675783, -0.3892755, 2.902114, 1, 1, 1, 1, 1,
0.6812124, -1.223207, 2.759589, 1, 1, 1, 1, 1,
0.6866872, -1.109596, 1.703484, 1, 1, 1, 1, 1,
0.6867775, 0.2766902, 2.000425, 1, 1, 1, 1, 1,
0.6871598, -0.9607345, 2.102787, 1, 1, 1, 1, 1,
0.6879387, -0.5350829, 2.648291, 1, 1, 1, 1, 1,
0.6884559, 0.4375749, 2.340078, 1, 1, 1, 1, 1,
0.6888273, -0.02950514, 1.355253, 1, 1, 1, 1, 1,
0.6897843, 0.07166404, 2.162371, 1, 1, 1, 1, 1,
0.6910552, 1.265428, 0.6495787, 0, 0, 1, 1, 1,
0.6924306, 0.3426722, -0.1419922, 1, 0, 0, 1, 1,
0.6929128, 0.03232463, 3.046674, 1, 0, 0, 1, 1,
0.6930693, 1.182732, 1.315207, 1, 0, 0, 1, 1,
0.6971561, 1.256051, -1.154625, 1, 0, 0, 1, 1,
0.6999184, -0.1405416, 1.987121, 1, 0, 0, 1, 1,
0.7072101, -0.1858992, 1.09255, 0, 0, 0, 1, 1,
0.708023, -0.06609264, 0.9648955, 0, 0, 0, 1, 1,
0.7113631, 0.4737188, 2.28035, 0, 0, 0, 1, 1,
0.7116924, 0.1989201, 0.7495202, 0, 0, 0, 1, 1,
0.7178513, -0.4173082, 1.21296, 0, 0, 0, 1, 1,
0.7190933, -0.8604224, 1.857355, 0, 0, 0, 1, 1,
0.7211454, -1.618363, 2.006111, 0, 0, 0, 1, 1,
0.7250882, 1.207042, 0.4664119, 1, 1, 1, 1, 1,
0.7268531, -0.2620514, 2.122782, 1, 1, 1, 1, 1,
0.7302834, -0.8485051, 2.7698, 1, 1, 1, 1, 1,
0.7303732, -1.189335, 2.194662, 1, 1, 1, 1, 1,
0.7334618, -0.6923337, 1.009741, 1, 1, 1, 1, 1,
0.7336133, 0.3798016, 1.335626, 1, 1, 1, 1, 1,
0.7381694, -2.86845, 4.646187, 1, 1, 1, 1, 1,
0.7391785, 1.947363, 1.405648, 1, 1, 1, 1, 1,
0.740185, 0.738798, 2.491694, 1, 1, 1, 1, 1,
0.7437958, 0.669302, 1.751451, 1, 1, 1, 1, 1,
0.7471251, -0.847154, 2.403729, 1, 1, 1, 1, 1,
0.7472093, 0.4859064, 2.174497, 1, 1, 1, 1, 1,
0.7480328, 1.089863, 0.7811468, 1, 1, 1, 1, 1,
0.7539586, 0.05718184, 0.7095183, 1, 1, 1, 1, 1,
0.7540214, 1.300006, 0.7493084, 1, 1, 1, 1, 1,
0.760092, 0.9848072, 1.847316, 0, 0, 1, 1, 1,
0.7685464, -1.103093, 1.212149, 1, 0, 0, 1, 1,
0.7695964, 1.158213, 0.6269906, 1, 0, 0, 1, 1,
0.7729775, -0.1111949, 2.389853, 1, 0, 0, 1, 1,
0.773977, -1.695952, 3.709932, 1, 0, 0, 1, 1,
0.7795731, 1.96486, 2.376895, 1, 0, 0, 1, 1,
0.7835726, -0.9891629, 4.003165, 0, 0, 0, 1, 1,
0.787718, -1.18242, 2.091772, 0, 0, 0, 1, 1,
0.7946723, -0.5773572, 2.194577, 0, 0, 0, 1, 1,
0.7974238, -0.02304483, 0.1509001, 0, 0, 0, 1, 1,
0.7996644, -1.872649, 2.928468, 0, 0, 0, 1, 1,
0.8010026, -0.2848189, 0.9452428, 0, 0, 0, 1, 1,
0.804334, 0.3666463, 0.2234494, 0, 0, 0, 1, 1,
0.8062605, 0.9984326, 0.9584553, 1, 1, 1, 1, 1,
0.808997, -0.4649632, 2.466452, 1, 1, 1, 1, 1,
0.8105106, 0.5708091, 2.263447, 1, 1, 1, 1, 1,
0.822486, -0.1315626, 2.222733, 1, 1, 1, 1, 1,
0.8313029, 1.052987, -0.4846275, 1, 1, 1, 1, 1,
0.8334493, 0.6392231, 0.7009953, 1, 1, 1, 1, 1,
0.8358651, -0.263195, 2.569781, 1, 1, 1, 1, 1,
0.8362499, -0.3886964, 3.037879, 1, 1, 1, 1, 1,
0.8393371, 0.1032441, 0.7018448, 1, 1, 1, 1, 1,
0.8407075, 0.1304063, 0.05436468, 1, 1, 1, 1, 1,
0.8455712, -1.043666, 2.522178, 1, 1, 1, 1, 1,
0.8522236, -2.442221, 2.789383, 1, 1, 1, 1, 1,
0.8536777, -0.1582957, 1.818916, 1, 1, 1, 1, 1,
0.8621802, 0.6010593, 3.048079, 1, 1, 1, 1, 1,
0.8743748, -2.167749, 1.571952, 1, 1, 1, 1, 1,
0.876548, -0.8643258, 3.757262, 0, 0, 1, 1, 1,
0.879142, -1.343807, 2.211829, 1, 0, 0, 1, 1,
0.8889101, -0.04209628, 1.477454, 1, 0, 0, 1, 1,
0.8947691, -0.05596614, 2.88693, 1, 0, 0, 1, 1,
0.8962401, -1.04034, 3.400606, 1, 0, 0, 1, 1,
0.9042404, 0.1668505, -0.8097613, 1, 0, 0, 1, 1,
0.9076295, -1.288354, 3.659476, 0, 0, 0, 1, 1,
0.9077697, 1.487075, -0.2570745, 0, 0, 0, 1, 1,
0.9120333, 0.8406174, 1.288204, 0, 0, 0, 1, 1,
0.9144472, -0.01704527, 1.257014, 0, 0, 0, 1, 1,
0.9267377, 2.146573, 1.280389, 0, 0, 0, 1, 1,
0.9450313, -1.906324, 1.636357, 0, 0, 0, 1, 1,
0.9458348, -1.620633, 3.469159, 0, 0, 0, 1, 1,
0.9475871, 1.211412, 1.244185, 1, 1, 1, 1, 1,
0.9508966, 0.9419404, 0.2248448, 1, 1, 1, 1, 1,
0.9546407, 0.7820187, 2.041393, 1, 1, 1, 1, 1,
0.9612173, 0.6966715, 0.4113307, 1, 1, 1, 1, 1,
0.9685149, 1.145741, 0.7113401, 1, 1, 1, 1, 1,
0.9685669, -0.08195192, 0.9930569, 1, 1, 1, 1, 1,
0.9757624, -0.3402606, 2.454552, 1, 1, 1, 1, 1,
0.9764273, 2.086372, -1.674673, 1, 1, 1, 1, 1,
0.9794941, 1.103975, 0.302708, 1, 1, 1, 1, 1,
0.990908, -1.143012, 2.105393, 1, 1, 1, 1, 1,
0.9921019, -0.8380063, 3.529045, 1, 1, 1, 1, 1,
0.9942578, -2.010547, 2.725806, 1, 1, 1, 1, 1,
0.9951184, 0.5170652, 0.740509, 1, 1, 1, 1, 1,
0.999517, 0.3534451, 2.428928, 1, 1, 1, 1, 1,
1.009699, 1.140281, -0.07080484, 1, 1, 1, 1, 1,
1.009865, -0.4538586, 2.065356, 0, 0, 1, 1, 1,
1.018437, 1.028686, -0.9333369, 1, 0, 0, 1, 1,
1.020218, -0.3031814, 1.959886, 1, 0, 0, 1, 1,
1.021716, 0.6912264, 1.143549, 1, 0, 0, 1, 1,
1.025255, 1.301325, -0.2663009, 1, 0, 0, 1, 1,
1.025969, 1.148854, 0.6030296, 1, 0, 0, 1, 1,
1.028048, 0.05126971, 1.960843, 0, 0, 0, 1, 1,
1.036962, -1.348446, 1.756679, 0, 0, 0, 1, 1,
1.053407, 0.8814483, 2.28662, 0, 0, 0, 1, 1,
1.056026, -1.378295, 1.454946, 0, 0, 0, 1, 1,
1.056215, 0.9789565, -1.299878, 0, 0, 0, 1, 1,
1.056766, 0.08701086, 2.483107, 0, 0, 0, 1, 1,
1.058316, -0.2280353, 1.251982, 0, 0, 0, 1, 1,
1.063265, 0.7076334, 1.08614, 1, 1, 1, 1, 1,
1.070526, 0.3773485, 2.706371, 1, 1, 1, 1, 1,
1.074789, -0.3125531, 2.880724, 1, 1, 1, 1, 1,
1.076525, -1.94985, 1.435701, 1, 1, 1, 1, 1,
1.076739, 0.8534815, 1.15325, 1, 1, 1, 1, 1,
1.085183, -0.1093141, 1.665662, 1, 1, 1, 1, 1,
1.08882, 2.005944, -0.6568816, 1, 1, 1, 1, 1,
1.095028, -0.8524219, 2.690374, 1, 1, 1, 1, 1,
1.095034, 1.233349, 0.6714098, 1, 1, 1, 1, 1,
1.102479, 1.023638, 0.2007408, 1, 1, 1, 1, 1,
1.103604, -0.887771, 2.987625, 1, 1, 1, 1, 1,
1.106844, -0.1395721, 2.144521, 1, 1, 1, 1, 1,
1.107286, -0.3683864, 4.285926, 1, 1, 1, 1, 1,
1.108233, 0.8798252, 1.145017, 1, 1, 1, 1, 1,
1.109941, -1.228042, 0.8753821, 1, 1, 1, 1, 1,
1.111015, -2.371879, 1.924768, 0, 0, 1, 1, 1,
1.112011, -1.724651, 1.076298, 1, 0, 0, 1, 1,
1.125202, 0.4546539, 3.06505, 1, 0, 0, 1, 1,
1.125463, -0.7970734, 1.914425, 1, 0, 0, 1, 1,
1.128027, 1.277781, 1.436763, 1, 0, 0, 1, 1,
1.130898, -1.791221, 2.277565, 1, 0, 0, 1, 1,
1.135018, 1.096645, 1.650581, 0, 0, 0, 1, 1,
1.138549, -0.818373, 2.69058, 0, 0, 0, 1, 1,
1.140502, -0.872294, 1.359137, 0, 0, 0, 1, 1,
1.147565, 0.09354037, 0.8048846, 0, 0, 0, 1, 1,
1.158873, 2.131806, 1.652894, 0, 0, 0, 1, 1,
1.170686, 0.6707487, 0.268874, 0, 0, 0, 1, 1,
1.180421, -0.1419351, 2.210709, 0, 0, 0, 1, 1,
1.184688, -1.076146, 1.376327, 1, 1, 1, 1, 1,
1.186043, 0.280904, -0.3674763, 1, 1, 1, 1, 1,
1.187629, 1.234282, 1.397544, 1, 1, 1, 1, 1,
1.206543, 1.220455, 1.03632, 1, 1, 1, 1, 1,
1.208107, -1.076176, 1.932002, 1, 1, 1, 1, 1,
1.217981, 0.2185866, 1.442122, 1, 1, 1, 1, 1,
1.217993, -0.6302711, 2.029855, 1, 1, 1, 1, 1,
1.21812, 0.06874762, 1.380466, 1, 1, 1, 1, 1,
1.222951, 0.4835559, 0.1245741, 1, 1, 1, 1, 1,
1.232548, 0.5099075, 1.048057, 1, 1, 1, 1, 1,
1.239696, 0.6385147, 0.5052922, 1, 1, 1, 1, 1,
1.251589, -2.645164, 1.430144, 1, 1, 1, 1, 1,
1.256788, 1.548918, 0.2176254, 1, 1, 1, 1, 1,
1.280931, 0.07607628, 0.519727, 1, 1, 1, 1, 1,
1.28136, 0.9583075, 1.829087, 1, 1, 1, 1, 1,
1.281933, 2.29265, 3.186073, 0, 0, 1, 1, 1,
1.29072, 0.2443426, 1.374111, 1, 0, 0, 1, 1,
1.300616, 0.04962136, 2.186652, 1, 0, 0, 1, 1,
1.32667, -1.381373, 1.446962, 1, 0, 0, 1, 1,
1.333714, 0.5415987, 3.228466, 1, 0, 0, 1, 1,
1.335205, 1.235279, 2.001674, 1, 0, 0, 1, 1,
1.339723, 1.225593, 2.234785, 0, 0, 0, 1, 1,
1.339998, 0.7982427, 1.262744, 0, 0, 0, 1, 1,
1.342511, -0.1013136, 2.96122, 0, 0, 0, 1, 1,
1.353198, -1.350046, 3.242485, 0, 0, 0, 1, 1,
1.357204, -0.6817588, 2.791044, 0, 0, 0, 1, 1,
1.369316, 1.498, 0.3074416, 0, 0, 0, 1, 1,
1.38358, 0.3703911, 1.153588, 0, 0, 0, 1, 1,
1.390628, 1.025782, 0.8207768, 1, 1, 1, 1, 1,
1.390884, -0.4109719, 2.516199, 1, 1, 1, 1, 1,
1.395066, -2.419085, 4.468338, 1, 1, 1, 1, 1,
1.396954, 0.3154085, 1.777937, 1, 1, 1, 1, 1,
1.40876, -0.272335, 1.969302, 1, 1, 1, 1, 1,
1.415187, -0.5887368, 2.064847, 1, 1, 1, 1, 1,
1.422453, -0.2978309, 2.737722, 1, 1, 1, 1, 1,
1.428009, -0.903504, 2.357328, 1, 1, 1, 1, 1,
1.450829, 1.77713, 0.8899967, 1, 1, 1, 1, 1,
1.453405, 0.2994088, 0.4070745, 1, 1, 1, 1, 1,
1.456891, 1.011155, 0.4157695, 1, 1, 1, 1, 1,
1.473374, 1.244053, 1.156371, 1, 1, 1, 1, 1,
1.48004, 0.0122774, 1.995051, 1, 1, 1, 1, 1,
1.482357, -1.612126, 3.020151, 1, 1, 1, 1, 1,
1.486426, 0.5348518, 1.124584, 1, 1, 1, 1, 1,
1.491229, -0.08925904, 1.513497, 0, 0, 1, 1, 1,
1.492769, 1.368673, 0.4226617, 1, 0, 0, 1, 1,
1.499233, 0.5967988, 1.909846, 1, 0, 0, 1, 1,
1.500439, 0.2404988, -0.8773189, 1, 0, 0, 1, 1,
1.504132, 0.8723499, 0.3382349, 1, 0, 0, 1, 1,
1.509447, -1.174075, 1.79386, 1, 0, 0, 1, 1,
1.513705, -1.0715, 1.586359, 0, 0, 0, 1, 1,
1.519146, 0.2702069, 2.551045, 0, 0, 0, 1, 1,
1.522782, -0.2321995, 1.602773, 0, 0, 0, 1, 1,
1.52498, 1.496287, 1.002612, 0, 0, 0, 1, 1,
1.525188, -0.3822124, 1.758551, 0, 0, 0, 1, 1,
1.54131, 0.6669605, 0.8965425, 0, 0, 0, 1, 1,
1.543875, -0.1928785, 0.7864157, 0, 0, 0, 1, 1,
1.545327, -1.652636, 4.168952, 1, 1, 1, 1, 1,
1.548096, -0.1274077, 1.973182, 1, 1, 1, 1, 1,
1.55096, 0.4902444, 0.1442792, 1, 1, 1, 1, 1,
1.57162, -0.7369456, 2.507545, 1, 1, 1, 1, 1,
1.573943, 1.303105, -0.4936376, 1, 1, 1, 1, 1,
1.577346, -0.9858608, 1.632986, 1, 1, 1, 1, 1,
1.58008, -0.2161889, 2.097362, 1, 1, 1, 1, 1,
1.590656, -0.5948093, 1.411398, 1, 1, 1, 1, 1,
1.600529, -0.1926075, 2.111133, 1, 1, 1, 1, 1,
1.617961, -2.507236, 2.299251, 1, 1, 1, 1, 1,
1.632445, 0.56073, -0.1436575, 1, 1, 1, 1, 1,
1.635109, -0.4422556, 3.087671, 1, 1, 1, 1, 1,
1.671156, -1.648724, 2.908855, 1, 1, 1, 1, 1,
1.674929, -0.4747912, 2.224286, 1, 1, 1, 1, 1,
1.693232, -0.03154228, 1.656701, 1, 1, 1, 1, 1,
1.708113, 1.198561, 1.848566, 0, 0, 1, 1, 1,
1.71336, -0.2335932, 2.481366, 1, 0, 0, 1, 1,
1.726483, -1.603633, -0.1607651, 1, 0, 0, 1, 1,
1.727258, -0.4436774, 1.832985, 1, 0, 0, 1, 1,
1.745946, -1.065613, 2.209206, 1, 0, 0, 1, 1,
1.750469, -0.3191829, 0.5515028, 1, 0, 0, 1, 1,
1.762094, 0.9524457, 1.263734, 0, 0, 0, 1, 1,
1.777646, 0.0839688, 1.343278, 0, 0, 0, 1, 1,
1.798489, 0.1392216, 2.851849, 0, 0, 0, 1, 1,
1.81469, 0.2164579, 1.453446, 0, 0, 0, 1, 1,
1.821738, 0.3390029, 0.7975497, 0, 0, 0, 1, 1,
1.825998, 0.3897219, 2.240663, 0, 0, 0, 1, 1,
1.826344, 1.755302, 1.731117, 0, 0, 0, 1, 1,
1.844242, 0.03792778, 2.140449, 1, 1, 1, 1, 1,
1.84917, 0.09565518, 0.541059, 1, 1, 1, 1, 1,
1.869385, 1.499859, 1.524986, 1, 1, 1, 1, 1,
1.878322, 0.05864704, 1.692903, 1, 1, 1, 1, 1,
1.879173, -2.105802, 2.794127, 1, 1, 1, 1, 1,
1.890511, -0.1723762, 1.336597, 1, 1, 1, 1, 1,
1.912588, -1.246871, 2.413748, 1, 1, 1, 1, 1,
1.914513, 0.2898839, 3.391915, 1, 1, 1, 1, 1,
1.93934, 1.747613, -1.200076, 1, 1, 1, 1, 1,
1.947846, -0.71939, 1.08637, 1, 1, 1, 1, 1,
1.960504, -0.05672758, 0.1182708, 1, 1, 1, 1, 1,
1.981886, 2.579198, 0.7444753, 1, 1, 1, 1, 1,
1.986544, -0.2172342, 2.411395, 1, 1, 1, 1, 1,
2.000061, 0.6730921, 0.8740602, 1, 1, 1, 1, 1,
2.056964, 0.9939918, 1.797687, 1, 1, 1, 1, 1,
2.074964, 0.1902044, 0.2135657, 0, 0, 1, 1, 1,
2.088022, 0.3670091, 3.071937, 1, 0, 0, 1, 1,
2.115584, -1.150691, 1.864707, 1, 0, 0, 1, 1,
2.123057, 1.234185, 0.6163632, 1, 0, 0, 1, 1,
2.128835, -0.9426309, 1.859259, 1, 0, 0, 1, 1,
2.223038, 0.143765, 1.428296, 1, 0, 0, 1, 1,
2.266631, 0.2596732, 2.058631, 0, 0, 0, 1, 1,
2.281116, 0.8252957, 0.9930055, 0, 0, 0, 1, 1,
2.299487, 0.4565055, 1.07354, 0, 0, 0, 1, 1,
2.356319, -1.345653, 3.008284, 0, 0, 0, 1, 1,
2.3966, -1.872962, 2.699035, 0, 0, 0, 1, 1,
2.414603, 0.147581, 1.105989, 0, 0, 0, 1, 1,
2.446421, -0.6891944, 2.788301, 0, 0, 0, 1, 1,
2.533641, -0.9926424, 2.274632, 1, 1, 1, 1, 1,
2.585078, -1.503338, 1.291127, 1, 1, 1, 1, 1,
2.593854, -0.8595071, 0.1713272, 1, 1, 1, 1, 1,
2.631386, 0.2741361, 0.4412059, 1, 1, 1, 1, 1,
2.706342, 1.226234, -0.2241236, 1, 1, 1, 1, 1,
2.812024, -1.149503, 1.849539, 1, 1, 1, 1, 1,
2.979383, -0.6794738, 0.937243, 1, 1, 1, 1, 1
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
var radius = 9.631132;
var distance = 33.82894;
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
mvMatrix.translate( 0.2728152, 0.5088377, 0.09778929 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.82894);
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
