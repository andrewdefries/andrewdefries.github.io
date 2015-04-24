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
-2.659515, 0.7953973, -0.963562, 1, 0, 0, 1,
-2.532696, 0.4548697, -2.896728, 1, 0.007843138, 0, 1,
-2.458603, -0.8454884, -1.953859, 1, 0.01176471, 0, 1,
-2.191625, -0.7862158, -3.50699, 1, 0.01960784, 0, 1,
-2.168579, 0.6969621, -2.402132, 1, 0.02352941, 0, 1,
-2.105374, -0.7137108, -1.898803, 1, 0.03137255, 0, 1,
-2.09234, -1.382857, -0.1560657, 1, 0.03529412, 0, 1,
-2.041379, -0.942211, -1.152876, 1, 0.04313726, 0, 1,
-2.033283, 0.8752114, 0.2575391, 1, 0.04705882, 0, 1,
-2.033006, 1.631817, 0.3937528, 1, 0.05490196, 0, 1,
-2.026658, 0.792447, -1.806535, 1, 0.05882353, 0, 1,
-2.021907, 0.3540467, 0.4937441, 1, 0.06666667, 0, 1,
-2.016914, 1.382696, -1.578819, 1, 0.07058824, 0, 1,
-2.007147, -0.3866608, -1.871202, 1, 0.07843138, 0, 1,
-2.00106, 0.5891697, -1.649348, 1, 0.08235294, 0, 1,
-1.999109, 1.960322, -1.541695, 1, 0.09019608, 0, 1,
-1.969618, 2.71972, -2.437977, 1, 0.09411765, 0, 1,
-1.946848, 0.410677, -1.052166, 1, 0.1019608, 0, 1,
-1.942051, 0.6469619, -1.115042, 1, 0.1098039, 0, 1,
-1.937713, -1.860934, -1.66806, 1, 0.1137255, 0, 1,
-1.921099, 0.6151424, -0.09657177, 1, 0.1215686, 0, 1,
-1.910765, 0.6415972, -1.982296, 1, 0.1254902, 0, 1,
-1.895182, 0.3922502, -1.785449, 1, 0.1333333, 0, 1,
-1.869833, 0.1569341, -1.550751, 1, 0.1372549, 0, 1,
-1.863794, 0.1227319, -3.609145, 1, 0.145098, 0, 1,
-1.860895, 0.1982549, -0.6270418, 1, 0.1490196, 0, 1,
-1.859577, 0.8632365, -1.648184, 1, 0.1568628, 0, 1,
-1.853284, 0.1095042, -1.44846, 1, 0.1607843, 0, 1,
-1.841703, -0.1356232, 0.511618, 1, 0.1686275, 0, 1,
-1.827941, 1.035911, -2.674042, 1, 0.172549, 0, 1,
-1.818367, 0.7909362, -1.523087, 1, 0.1803922, 0, 1,
-1.809633, 0.6355338, -0.9576015, 1, 0.1843137, 0, 1,
-1.79429, -0.1192734, -1.347782, 1, 0.1921569, 0, 1,
-1.789384, 0.4290661, -0.8048751, 1, 0.1960784, 0, 1,
-1.784105, -0.6926185, 0.3738707, 1, 0.2039216, 0, 1,
-1.773585, -0.7837753, -1.411458, 1, 0.2117647, 0, 1,
-1.772764, -0.4525445, -2.451966, 1, 0.2156863, 0, 1,
-1.764989, -0.3550368, -1.380034, 1, 0.2235294, 0, 1,
-1.761992, -0.6221364, -1.133894, 1, 0.227451, 0, 1,
-1.761178, -2.070519, -1.676911, 1, 0.2352941, 0, 1,
-1.757977, -0.8694961, -0.718939, 1, 0.2392157, 0, 1,
-1.747726, -0.8161582, -1.08494, 1, 0.2470588, 0, 1,
-1.741459, -0.6455679, -0.9789796, 1, 0.2509804, 0, 1,
-1.740173, -0.1967745, -0.09082123, 1, 0.2588235, 0, 1,
-1.729967, 1.05612, -0.6795799, 1, 0.2627451, 0, 1,
-1.717599, -0.3823234, -1.20344, 1, 0.2705882, 0, 1,
-1.694079, -0.08753645, -1.470526, 1, 0.2745098, 0, 1,
-1.689739, -0.2411849, -0.7679161, 1, 0.282353, 0, 1,
-1.680644, -1.43091, -2.041538, 1, 0.2862745, 0, 1,
-1.667976, -0.05240529, -2.512167, 1, 0.2941177, 0, 1,
-1.638422, 0.903216, -1.478493, 1, 0.3019608, 0, 1,
-1.60843, 0.8732943, -1.472111, 1, 0.3058824, 0, 1,
-1.607038, -0.9865317, -2.376171, 1, 0.3137255, 0, 1,
-1.599804, -1.528358, -2.505717, 1, 0.3176471, 0, 1,
-1.571806, 0.8409871, -1.928379, 1, 0.3254902, 0, 1,
-1.561634, -0.7071208, -0.4997666, 1, 0.3294118, 0, 1,
-1.558605, 1.198199, -1.444098, 1, 0.3372549, 0, 1,
-1.556152, 1.13907, -0.4394009, 1, 0.3411765, 0, 1,
-1.541232, 1.300877, 0.2357362, 1, 0.3490196, 0, 1,
-1.538036, 0.5789139, -1.227184, 1, 0.3529412, 0, 1,
-1.53387, -0.5887869, -3.128314, 1, 0.3607843, 0, 1,
-1.515869, -0.6239066, -2.190538, 1, 0.3647059, 0, 1,
-1.513791, 0.1501164, 0.1026458, 1, 0.372549, 0, 1,
-1.502224, -0.1228783, -1.31519, 1, 0.3764706, 0, 1,
-1.481707, -0.9515813, -2.158304, 1, 0.3843137, 0, 1,
-1.46673, -0.07950591, -1.547477, 1, 0.3882353, 0, 1,
-1.464244, -0.4882878, -2.719328, 1, 0.3960784, 0, 1,
-1.4523, 0.1282534, -2.542071, 1, 0.4039216, 0, 1,
-1.440503, 1.688882, -0.03352645, 1, 0.4078431, 0, 1,
-1.412647, 0.7998746, -1.609482, 1, 0.4156863, 0, 1,
-1.4069, -1.650686, -3.003402, 1, 0.4196078, 0, 1,
-1.400887, 1.340071, 1.121475, 1, 0.427451, 0, 1,
-1.385605, 1.344894, -1.065578, 1, 0.4313726, 0, 1,
-1.380601, -0.3150941, -1.642441, 1, 0.4392157, 0, 1,
-1.380213, -0.279951, -0.952961, 1, 0.4431373, 0, 1,
-1.378393, 0.2692891, -1.853289, 1, 0.4509804, 0, 1,
-1.35932, 1.187528, -1.212278, 1, 0.454902, 0, 1,
-1.357851, -0.5828562, -1.810484, 1, 0.4627451, 0, 1,
-1.356665, -1.252148, -2.020311, 1, 0.4666667, 0, 1,
-1.345555, 1.489206, -0.7775169, 1, 0.4745098, 0, 1,
-1.33814, 0.5329706, -1.493846, 1, 0.4784314, 0, 1,
-1.328852, 0.07902346, 0.05916536, 1, 0.4862745, 0, 1,
-1.327908, -0.2544056, -2.448287, 1, 0.4901961, 0, 1,
-1.326749, -0.6818848, -1.909233, 1, 0.4980392, 0, 1,
-1.300557, -0.0815178, -0.4282408, 1, 0.5058824, 0, 1,
-1.300163, -0.3084319, -0.5229419, 1, 0.509804, 0, 1,
-1.279854, -0.7585052, -1.478922, 1, 0.5176471, 0, 1,
-1.279639, 1.556271, -0.7601001, 1, 0.5215687, 0, 1,
-1.272619, -0.074318, -1.236963, 1, 0.5294118, 0, 1,
-1.261117, 0.7239151, -2.011527, 1, 0.5333334, 0, 1,
-1.256668, 0.3500443, -0.4196039, 1, 0.5411765, 0, 1,
-1.254156, -0.3529738, -0.5320198, 1, 0.5450981, 0, 1,
-1.248996, 0.4924201, -0.4355389, 1, 0.5529412, 0, 1,
-1.246181, -0.1416729, -2.608656, 1, 0.5568628, 0, 1,
-1.231148, 0.6249088, -0.3924459, 1, 0.5647059, 0, 1,
-1.223408, -0.5490763, -1.729023, 1, 0.5686275, 0, 1,
-1.223143, -0.3671129, -2.220222, 1, 0.5764706, 0, 1,
-1.217283, 0.9513689, -0.7704194, 1, 0.5803922, 0, 1,
-1.213783, 0.7241212, 0.7289477, 1, 0.5882353, 0, 1,
-1.200769, 1.555993, -1.502926, 1, 0.5921569, 0, 1,
-1.194342, -1.453679, -2.92359, 1, 0.6, 0, 1,
-1.184805, 0.944484, 0.2838829, 1, 0.6078432, 0, 1,
-1.182665, -0.7559806, -1.974118, 1, 0.6117647, 0, 1,
-1.182253, -0.6615845, -3.02787, 1, 0.6196079, 0, 1,
-1.179633, -0.294991, -2.160894, 1, 0.6235294, 0, 1,
-1.171442, 1.071137, 0.6912559, 1, 0.6313726, 0, 1,
-1.16555, -0.640588, -2.230372, 1, 0.6352941, 0, 1,
-1.15686, 0.8982481, -0.1606473, 1, 0.6431373, 0, 1,
-1.156679, -0.3101063, -0.6173136, 1, 0.6470588, 0, 1,
-1.156336, -0.3885303, -1.292648, 1, 0.654902, 0, 1,
-1.152079, -0.3983069, -3.449491, 1, 0.6588235, 0, 1,
-1.144452, 1.264338, -2.163722, 1, 0.6666667, 0, 1,
-1.144317, -0.9454197, -1.526442, 1, 0.6705883, 0, 1,
-1.141006, 0.4740206, -0.8038558, 1, 0.6784314, 0, 1,
-1.138939, 1.3682, -1.090313, 1, 0.682353, 0, 1,
-1.128423, 0.8234715, -1.184976, 1, 0.6901961, 0, 1,
-1.121656, 0.9150147, 0.6753412, 1, 0.6941177, 0, 1,
-1.119846, -0.3556646, -4.121968, 1, 0.7019608, 0, 1,
-1.116177, 0.8805875, -1.808122, 1, 0.7098039, 0, 1,
-1.104537, -1.450014, -1.16397, 1, 0.7137255, 0, 1,
-1.097957, 0.5730328, -2.507304, 1, 0.7215686, 0, 1,
-1.094738, 1.459728, -0.3749527, 1, 0.7254902, 0, 1,
-1.091986, -1.285505, -2.926479, 1, 0.7333333, 0, 1,
-1.090326, -1.365677, -2.432184, 1, 0.7372549, 0, 1,
-1.078896, 1.43813, 0.03724403, 1, 0.7450981, 0, 1,
-1.078254, 1.17002, -1.32926, 1, 0.7490196, 0, 1,
-1.061288, -1.360757, -3.494854, 1, 0.7568628, 0, 1,
-1.051573, -0.007630449, -3.981014, 1, 0.7607843, 0, 1,
-1.041605, -0.9186733, -1.009661, 1, 0.7686275, 0, 1,
-1.04076, 0.2667274, -1.408775, 1, 0.772549, 0, 1,
-1.03684, 1.536427, 0.06039852, 1, 0.7803922, 0, 1,
-1.027436, 0.5583652, -0.9481075, 1, 0.7843137, 0, 1,
-1.012371, -0.8412954, -2.662637, 1, 0.7921569, 0, 1,
-1.009027, -0.5554106, -1.615639, 1, 0.7960784, 0, 1,
-1.007383, 0.1257713, -0.5148513, 1, 0.8039216, 0, 1,
-1.002533, -1.320494, -2.560532, 1, 0.8117647, 0, 1,
-0.9962857, -0.1948235, -2.227177, 1, 0.8156863, 0, 1,
-0.9927315, -0.02266126, -0.3925552, 1, 0.8235294, 0, 1,
-0.9874451, -0.5510184, -2.507831, 1, 0.827451, 0, 1,
-0.9818961, -1.18495, -2.923537, 1, 0.8352941, 0, 1,
-0.9738743, -2.083762, -0.1499345, 1, 0.8392157, 0, 1,
-0.9700976, 0.9228864, -0.1563739, 1, 0.8470588, 0, 1,
-0.9538534, 0.8594865, 0.5282861, 1, 0.8509804, 0, 1,
-0.9521362, 0.4632174, -1.350451, 1, 0.8588235, 0, 1,
-0.9513946, 0.7119248, 1.766079, 1, 0.8627451, 0, 1,
-0.9429997, -0.2128371, -2.637792, 1, 0.8705882, 0, 1,
-0.9416569, 0.02002918, -1.942998, 1, 0.8745098, 0, 1,
-0.9293492, 0.02273328, -0.6690839, 1, 0.8823529, 0, 1,
-0.9253599, -0.2299593, -0.3493089, 1, 0.8862745, 0, 1,
-0.9168987, -0.3387557, -0.9935454, 1, 0.8941177, 0, 1,
-0.9140257, -0.6205031, -1.845919, 1, 0.8980392, 0, 1,
-0.9115601, -0.2188425, -4.042663, 1, 0.9058824, 0, 1,
-0.9093601, 0.9332363, -2.838165, 1, 0.9137255, 0, 1,
-0.9058362, -0.192523, -1.203175, 1, 0.9176471, 0, 1,
-0.9030068, 0.6998343, -1.166047, 1, 0.9254902, 0, 1,
-0.9000303, 0.05280102, -2.230422, 1, 0.9294118, 0, 1,
-0.8989252, -1.732518, -3.315465, 1, 0.9372549, 0, 1,
-0.8978681, 0.1014714, -0.8641362, 1, 0.9411765, 0, 1,
-0.8946006, -1.060909, -2.229337, 1, 0.9490196, 0, 1,
-0.8940293, -1.667987, -2.669863, 1, 0.9529412, 0, 1,
-0.8891394, -0.9368867, -4.736772, 1, 0.9607843, 0, 1,
-0.8876394, 0.5458741, -1.397742, 1, 0.9647059, 0, 1,
-0.8858825, 0.7710207, -3.074609, 1, 0.972549, 0, 1,
-0.8811458, -1.483162, -1.788746, 1, 0.9764706, 0, 1,
-0.8810235, -0.4511539, -1.595207, 1, 0.9843137, 0, 1,
-0.8784555, -0.2395186, -2.448619, 1, 0.9882353, 0, 1,
-0.8768153, 0.5386274, -0.8697091, 1, 0.9960784, 0, 1,
-0.872528, -0.1203687, -2.581989, 0.9960784, 1, 0, 1,
-0.870079, 1.046159, -1.099993, 0.9921569, 1, 0, 1,
-0.8695379, 0.3374172, -1.730633, 0.9843137, 1, 0, 1,
-0.8693786, 0.7275665, 0.2257709, 0.9803922, 1, 0, 1,
-0.8680945, -1.596567, -2.797537, 0.972549, 1, 0, 1,
-0.865903, 1.622988, -0.4417853, 0.9686275, 1, 0, 1,
-0.8642113, -0.9918684, -4.358235, 0.9607843, 1, 0, 1,
-0.8626975, 0.3061885, -1.257003, 0.9568627, 1, 0, 1,
-0.8624092, -0.3199131, -1.902837, 0.9490196, 1, 0, 1,
-0.8615674, 1.898156, -0.2567299, 0.945098, 1, 0, 1,
-0.8604503, -0.006208359, -0.3232034, 0.9372549, 1, 0, 1,
-0.8558191, -0.9152796, -1.662113, 0.9333333, 1, 0, 1,
-0.855206, 0.2082653, -1.905123, 0.9254902, 1, 0, 1,
-0.8551129, 0.6777751, -1.868037, 0.9215686, 1, 0, 1,
-0.852277, 0.4613818, -2.607752, 0.9137255, 1, 0, 1,
-0.8512515, -1.070937, -4.411166, 0.9098039, 1, 0, 1,
-0.8457378, -0.2287522, -3.440762, 0.9019608, 1, 0, 1,
-0.8444934, 0.5324672, -0.3250486, 0.8941177, 1, 0, 1,
-0.8440132, -0.534974, -1.884471, 0.8901961, 1, 0, 1,
-0.8416859, 0.2441372, -1.907476, 0.8823529, 1, 0, 1,
-0.8407177, -0.5942026, -0.8064127, 0.8784314, 1, 0, 1,
-0.8404652, 0.2795413, -1.167919, 0.8705882, 1, 0, 1,
-0.8374984, 1.245862, 0.03840925, 0.8666667, 1, 0, 1,
-0.8367607, 0.09781268, -1.827512, 0.8588235, 1, 0, 1,
-0.8364615, -1.411553, -3.165434, 0.854902, 1, 0, 1,
-0.8363888, 0.7647368, -1.622412, 0.8470588, 1, 0, 1,
-0.834702, 1.391293, 0.3348209, 0.8431373, 1, 0, 1,
-0.8344455, 1.4037, -1.889489, 0.8352941, 1, 0, 1,
-0.8293564, -1.115553, -2.571098, 0.8313726, 1, 0, 1,
-0.827247, 0.2195309, -0.940651, 0.8235294, 1, 0, 1,
-0.8260633, -0.5221811, -3.806358, 0.8196079, 1, 0, 1,
-0.8238533, -0.3552201, -1.651743, 0.8117647, 1, 0, 1,
-0.8217422, -0.4574691, -1.241976, 0.8078431, 1, 0, 1,
-0.817826, 1.986292, -0.6446293, 0.8, 1, 0, 1,
-0.8153993, 0.547196, -0.2633897, 0.7921569, 1, 0, 1,
-0.8138933, -0.1831616, -1.632296, 0.7882353, 1, 0, 1,
-0.8127355, 0.5088142, -1.596979, 0.7803922, 1, 0, 1,
-0.8117632, 0.6854093, -1.399292, 0.7764706, 1, 0, 1,
-0.801755, 0.1749928, -2.350687, 0.7686275, 1, 0, 1,
-0.8016092, -0.1414873, -2.114762, 0.7647059, 1, 0, 1,
-0.8012637, -1.609787, -1.830493, 0.7568628, 1, 0, 1,
-0.8000556, -0.823688, -2.681615, 0.7529412, 1, 0, 1,
-0.7974421, -0.7089078, -2.101729, 0.7450981, 1, 0, 1,
-0.7857351, -1.358726, -2.293536, 0.7411765, 1, 0, 1,
-0.7846171, 1.001213, -1.133046, 0.7333333, 1, 0, 1,
-0.7821724, -1.234699, -0.3378, 0.7294118, 1, 0, 1,
-0.7816024, 0.6737269, -0.7533788, 0.7215686, 1, 0, 1,
-0.7802958, -0.4170293, -2.106663, 0.7176471, 1, 0, 1,
-0.7724448, 0.349404, -1.649833, 0.7098039, 1, 0, 1,
-0.7536568, -0.04551755, -1.819881, 0.7058824, 1, 0, 1,
-0.750035, 0.540195, -2.002596, 0.6980392, 1, 0, 1,
-0.7463425, -0.106245, -1.517047, 0.6901961, 1, 0, 1,
-0.7452334, 1.548587, 0.8950006, 0.6862745, 1, 0, 1,
-0.7431055, -0.7104471, -0.6800124, 0.6784314, 1, 0, 1,
-0.739553, 0.3057353, -1.230994, 0.6745098, 1, 0, 1,
-0.7324734, -1.163962, -1.097898, 0.6666667, 1, 0, 1,
-0.7324001, 0.632907, -1.940339, 0.6627451, 1, 0, 1,
-0.7263683, 1.469084, -0.4930458, 0.654902, 1, 0, 1,
-0.7262082, -2.947962, -2.667098, 0.6509804, 1, 0, 1,
-0.7258104, 1.751368, -0.1850238, 0.6431373, 1, 0, 1,
-0.7218738, -0.4667043, -2.244722, 0.6392157, 1, 0, 1,
-0.7210259, 1.008369, -2.719486, 0.6313726, 1, 0, 1,
-0.7205899, -0.3370888, -2.213305, 0.627451, 1, 0, 1,
-0.7188615, 0.451535, -2.865906, 0.6196079, 1, 0, 1,
-0.7127396, 1.10957, -0.7753243, 0.6156863, 1, 0, 1,
-0.7093346, 0.4460252, -0.47797, 0.6078432, 1, 0, 1,
-0.7051108, -0.3003935, -2.12611, 0.6039216, 1, 0, 1,
-0.7021166, -0.6216173, -1.349639, 0.5960785, 1, 0, 1,
-0.7020634, -0.6210972, -0.5213799, 0.5882353, 1, 0, 1,
-0.7004284, -0.4355849, -2.561089, 0.5843138, 1, 0, 1,
-0.6984324, -0.6829385, -2.421276, 0.5764706, 1, 0, 1,
-0.6968678, 0.07574604, -1.959453, 0.572549, 1, 0, 1,
-0.6941952, 0.238583, -1.110371, 0.5647059, 1, 0, 1,
-0.6922948, -0.2611027, -1.52765, 0.5607843, 1, 0, 1,
-0.6911362, -0.9613815, -3.173964, 0.5529412, 1, 0, 1,
-0.6896991, 2.137962, -0.3367576, 0.5490196, 1, 0, 1,
-0.6882021, 0.3608005, 1.456759, 0.5411765, 1, 0, 1,
-0.6856139, 0.01655586, -1.734589, 0.5372549, 1, 0, 1,
-0.6850429, 0.6714464, -0.8884772, 0.5294118, 1, 0, 1,
-0.6840422, -0.8004426, -2.887329, 0.5254902, 1, 0, 1,
-0.682898, 0.587314, -1.672365, 0.5176471, 1, 0, 1,
-0.6827498, -0.5819371, -2.37789, 0.5137255, 1, 0, 1,
-0.6821032, -0.4943297, -1.492754, 0.5058824, 1, 0, 1,
-0.6818367, -0.6485493, -2.017612, 0.5019608, 1, 0, 1,
-0.6762186, -0.2028786, -1.403277, 0.4941176, 1, 0, 1,
-0.6663424, 0.1760583, -1.586359, 0.4862745, 1, 0, 1,
-0.6641212, 0.8547276, 0.7905654, 0.4823529, 1, 0, 1,
-0.6456916, 0.3549788, -0.1176805, 0.4745098, 1, 0, 1,
-0.644486, -0.8962755, -2.972214, 0.4705882, 1, 0, 1,
-0.6425055, -1.394402, -3.151655, 0.4627451, 1, 0, 1,
-0.6409491, -0.4888021, -2.09179, 0.4588235, 1, 0, 1,
-0.6387244, -0.4654258, -2.587897, 0.4509804, 1, 0, 1,
-0.6374023, 0.808253, -2.998714, 0.4470588, 1, 0, 1,
-0.6364353, -0.1964021, -1.036756, 0.4392157, 1, 0, 1,
-0.635667, -1.533456, -3.879858, 0.4352941, 1, 0, 1,
-0.6338947, -0.1075077, -1.796246, 0.427451, 1, 0, 1,
-0.6312511, -0.1812012, -3.665264, 0.4235294, 1, 0, 1,
-0.6284345, -0.9808454, -3.343393, 0.4156863, 1, 0, 1,
-0.6233316, 1.027558, -1.071888, 0.4117647, 1, 0, 1,
-0.6219888, 0.8605765, 0.2875926, 0.4039216, 1, 0, 1,
-0.6212009, -0.1182295, -0.9866251, 0.3960784, 1, 0, 1,
-0.6193224, -0.6118099, -2.506153, 0.3921569, 1, 0, 1,
-0.6180609, 2.032528, -1.267288, 0.3843137, 1, 0, 1,
-0.6159195, 0.3939482, -0.002588339, 0.3803922, 1, 0, 1,
-0.6059732, -0.540765, -2.704966, 0.372549, 1, 0, 1,
-0.6046582, -1.17906, -2.114877, 0.3686275, 1, 0, 1,
-0.592123, -0.6034951, -2.386781, 0.3607843, 1, 0, 1,
-0.5837192, -1.649993, -3.217746, 0.3568628, 1, 0, 1,
-0.5812587, 0.6464111, -1.772289, 0.3490196, 1, 0, 1,
-0.58032, 1.300634, -0.6900502, 0.345098, 1, 0, 1,
-0.5740244, -0.3466196, -3.029172, 0.3372549, 1, 0, 1,
-0.5710814, 0.765615, -0.6508485, 0.3333333, 1, 0, 1,
-0.5708401, -0.8183216, -1.823408, 0.3254902, 1, 0, 1,
-0.5657463, 1.199425, 0.8536803, 0.3215686, 1, 0, 1,
-0.5638555, 0.2292099, -0.9303713, 0.3137255, 1, 0, 1,
-0.5630259, 0.08008447, -2.812264, 0.3098039, 1, 0, 1,
-0.5615031, 0.6171888, -2.050984, 0.3019608, 1, 0, 1,
-0.5602703, 0.4176321, -0.4267829, 0.2941177, 1, 0, 1,
-0.5569629, -0.6502997, -2.604443, 0.2901961, 1, 0, 1,
-0.5550964, 0.3037398, -0.7829573, 0.282353, 1, 0, 1,
-0.5487094, 0.07842246, -0.7968501, 0.2784314, 1, 0, 1,
-0.5436617, 0.3592201, -2.155444, 0.2705882, 1, 0, 1,
-0.5406206, 0.4668148, -0.1203812, 0.2666667, 1, 0, 1,
-0.5387836, -0.7190828, -4.357326, 0.2588235, 1, 0, 1,
-0.536631, -0.6761665, -4.069684, 0.254902, 1, 0, 1,
-0.5352684, -1.030772, -1.133485, 0.2470588, 1, 0, 1,
-0.5349917, 0.1558985, -2.005482, 0.2431373, 1, 0, 1,
-0.5302165, -0.1900741, -1.402731, 0.2352941, 1, 0, 1,
-0.5271333, -2.015442, -2.277435, 0.2313726, 1, 0, 1,
-0.5263996, -1.401338, -1.71597, 0.2235294, 1, 0, 1,
-0.5242071, 0.6200772, -2.057023, 0.2196078, 1, 0, 1,
-0.5234784, -0.950337, -4.035863, 0.2117647, 1, 0, 1,
-0.5221706, 0.5080636, -2.10293, 0.2078431, 1, 0, 1,
-0.5220824, 0.2539027, -1.22086, 0.2, 1, 0, 1,
-0.5206103, 1.478197, 0.1559871, 0.1921569, 1, 0, 1,
-0.509305, 0.486055, -0.8790141, 0.1882353, 1, 0, 1,
-0.5036706, 1.639811, -0.1210198, 0.1803922, 1, 0, 1,
-0.5010399, -0.180096, -1.284386, 0.1764706, 1, 0, 1,
-0.4934237, -0.4288749, -2.862137, 0.1686275, 1, 0, 1,
-0.4923358, 0.2795276, -1.813073, 0.1647059, 1, 0, 1,
-0.491508, 0.004457044, -2.202234, 0.1568628, 1, 0, 1,
-0.4894733, -1.255602, -3.182192, 0.1529412, 1, 0, 1,
-0.4842195, -0.7344238, -4.179894, 0.145098, 1, 0, 1,
-0.4830742, -2.072061, -2.287318, 0.1411765, 1, 0, 1,
-0.4751492, 0.2484416, -2.286195, 0.1333333, 1, 0, 1,
-0.4717731, 0.6944514, -0.7555659, 0.1294118, 1, 0, 1,
-0.4670737, 1.098571, 0.2090784, 0.1215686, 1, 0, 1,
-0.4633991, 0.9734188, -0.5911595, 0.1176471, 1, 0, 1,
-0.459482, 0.4169469, -0.6856293, 0.1098039, 1, 0, 1,
-0.4566843, 0.6393381, 0.1900743, 0.1058824, 1, 0, 1,
-0.4546125, 1.492898, 0.1284992, 0.09803922, 1, 0, 1,
-0.4540292, 0.5723593, -0.7677849, 0.09019608, 1, 0, 1,
-0.4516392, -0.1745774, -1.182625, 0.08627451, 1, 0, 1,
-0.4485831, -0.2607127, -2.708497, 0.07843138, 1, 0, 1,
-0.4460817, -0.5011715, -2.958963, 0.07450981, 1, 0, 1,
-0.4459665, 1.154871, 0.5096626, 0.06666667, 1, 0, 1,
-0.4455388, 0.4927293, -1.384609, 0.0627451, 1, 0, 1,
-0.4454294, -0.4561328, -3.142363, 0.05490196, 1, 0, 1,
-0.4433765, 0.5377288, 0.736275, 0.05098039, 1, 0, 1,
-0.4432539, -1.332164, -4.386008, 0.04313726, 1, 0, 1,
-0.4408576, -1.74396, -1.545488, 0.03921569, 1, 0, 1,
-0.4400359, -1.348819, -3.549855, 0.03137255, 1, 0, 1,
-0.4343629, 0.6946603, -0.3003027, 0.02745098, 1, 0, 1,
-0.4335742, 0.0639329, -0.2182301, 0.01960784, 1, 0, 1,
-0.4335708, -0.2631952, -2.505793, 0.01568628, 1, 0, 1,
-0.4323434, -0.08522839, -1.009965, 0.007843138, 1, 0, 1,
-0.4308794, -0.2726145, -1.59407, 0.003921569, 1, 0, 1,
-0.4246765, 1.331246, 0.2875403, 0, 1, 0.003921569, 1,
-0.4237384, 0.1478204, 0.04259544, 0, 1, 0.01176471, 1,
-0.4235103, -0.04617095, -0.4849122, 0, 1, 0.01568628, 1,
-0.4173677, -0.03650956, -2.762806, 0, 1, 0.02352941, 1,
-0.4171596, -0.8716682, -3.987437, 0, 1, 0.02745098, 1,
-0.4151769, 0.3605542, -1.491933, 0, 1, 0.03529412, 1,
-0.4068108, -0.8709256, -2.644059, 0, 1, 0.03921569, 1,
-0.4050064, -1.076078, -3.358959, 0, 1, 0.04705882, 1,
-0.4004309, 1.233325, -1.139023, 0, 1, 0.05098039, 1,
-0.3974502, 0.2342492, -0.6426306, 0, 1, 0.05882353, 1,
-0.3967692, 1.023865, -2.172056, 0, 1, 0.0627451, 1,
-0.3962899, 0.1677906, -0.8772509, 0, 1, 0.07058824, 1,
-0.3920536, -0.4456239, -2.179681, 0, 1, 0.07450981, 1,
-0.3902535, 0.09428169, -2.693339, 0, 1, 0.08235294, 1,
-0.3878949, 0.09521261, -2.829149, 0, 1, 0.08627451, 1,
-0.3864435, 0.4323444, -0.4601236, 0, 1, 0.09411765, 1,
-0.3838607, -1.075231, -2.369241, 0, 1, 0.1019608, 1,
-0.3831223, 0.5571826, 2.037339, 0, 1, 0.1058824, 1,
-0.3821754, 0.3073778, -0.6975311, 0, 1, 0.1137255, 1,
-0.3820906, -0.2206916, -3.204622, 0, 1, 0.1176471, 1,
-0.3815299, 0.6236151, -1.71368, 0, 1, 0.1254902, 1,
-0.3814496, 0.08495004, -1.250174, 0, 1, 0.1294118, 1,
-0.3751654, 1.810155, -0.09705171, 0, 1, 0.1372549, 1,
-0.3735859, 1.495789, -0.222654, 0, 1, 0.1411765, 1,
-0.3724448, -1.346965, -3.900815, 0, 1, 0.1490196, 1,
-0.3711286, 0.3065015, 0.5602564, 0, 1, 0.1529412, 1,
-0.3709711, -0.7207652, -2.874537, 0, 1, 0.1607843, 1,
-0.3490226, -0.5641899, -1.903815, 0, 1, 0.1647059, 1,
-0.3433841, 1.269585, -0.2489474, 0, 1, 0.172549, 1,
-0.342486, -1.700354, -1.333879, 0, 1, 0.1764706, 1,
-0.3415326, -0.3933645, -5.114233, 0, 1, 0.1843137, 1,
-0.3405181, -0.6224649, -2.482595, 0, 1, 0.1882353, 1,
-0.337712, -0.5050372, -1.827895, 0, 1, 0.1960784, 1,
-0.3347448, -1.969322, -2.143915, 0, 1, 0.2039216, 1,
-0.3337869, -1.471914, -3.028707, 0, 1, 0.2078431, 1,
-0.3293347, 1.68473, 1.347986, 0, 1, 0.2156863, 1,
-0.3287103, 1.992331, -1.010417, 0, 1, 0.2196078, 1,
-0.3275824, 0.06654146, -2.063036, 0, 1, 0.227451, 1,
-0.3255018, -0.9572711, -1.930014, 0, 1, 0.2313726, 1,
-0.3250283, -0.03923192, -0.7273744, 0, 1, 0.2392157, 1,
-0.324196, 0.3505883, -0.08237114, 0, 1, 0.2431373, 1,
-0.323794, 0.3453819, -0.2393975, 0, 1, 0.2509804, 1,
-0.3217522, 0.4660806, -0.7270103, 0, 1, 0.254902, 1,
-0.3202593, 0.4866244, -0.2000605, 0, 1, 0.2627451, 1,
-0.3200454, -0.4254541, -3.601715, 0, 1, 0.2666667, 1,
-0.3178362, -0.4738074, -1.327108, 0, 1, 0.2745098, 1,
-0.3151336, -0.1626449, -1.520862, 0, 1, 0.2784314, 1,
-0.3130578, 0.2529457, -1.947242, 0, 1, 0.2862745, 1,
-0.3116524, -0.7244466, -2.447598, 0, 1, 0.2901961, 1,
-0.305946, -0.2522728, -1.438169, 0, 1, 0.2980392, 1,
-0.3055637, 2.16331, -0.0438058, 0, 1, 0.3058824, 1,
-0.2951974, -1.193918, -2.973419, 0, 1, 0.3098039, 1,
-0.294962, 1.397351, -1.175099, 0, 1, 0.3176471, 1,
-0.2929186, -0.426189, -3.201526, 0, 1, 0.3215686, 1,
-0.2912626, -0.3921938, -3.093099, 0, 1, 0.3294118, 1,
-0.2888115, 0.408598, -1.906564, 0, 1, 0.3333333, 1,
-0.2885156, 1.262434, -1.233692, 0, 1, 0.3411765, 1,
-0.2879255, 0.8262992, -1.453057, 0, 1, 0.345098, 1,
-0.2859188, -0.06853155, -2.78842, 0, 1, 0.3529412, 1,
-0.2763575, 2.85315, 0.5128839, 0, 1, 0.3568628, 1,
-0.2750908, -1.573094, -2.471848, 0, 1, 0.3647059, 1,
-0.2688837, 0.7026035, -0.6119792, 0, 1, 0.3686275, 1,
-0.2662781, -0.09643599, -1.226504, 0, 1, 0.3764706, 1,
-0.2636825, -1.096263, -3.716982, 0, 1, 0.3803922, 1,
-0.2598418, -0.302907, -3.082819, 0, 1, 0.3882353, 1,
-0.2551049, 0.649247, -1.444485, 0, 1, 0.3921569, 1,
-0.2548493, 0.31262, -1.314622, 0, 1, 0.4, 1,
-0.2518222, -1.173856, -3.641651, 0, 1, 0.4078431, 1,
-0.2499208, -0.1969189, -0.8189735, 0, 1, 0.4117647, 1,
-0.2495328, -1.195475, -3.470958, 0, 1, 0.4196078, 1,
-0.2475249, -0.1821973, -3.02853, 0, 1, 0.4235294, 1,
-0.2453767, 0.02287577, -1.610819, 0, 1, 0.4313726, 1,
-0.2433775, -0.06502457, -2.263884, 0, 1, 0.4352941, 1,
-0.2412307, 0.6720961, -0.9297034, 0, 1, 0.4431373, 1,
-0.2409443, 1.699968, 0.3830693, 0, 1, 0.4470588, 1,
-0.2396814, -1.367011, -3.11308, 0, 1, 0.454902, 1,
-0.2364446, -1.186085, -3.374799, 0, 1, 0.4588235, 1,
-0.2331921, -1.233704, -3.900962, 0, 1, 0.4666667, 1,
-0.2274811, -0.5377669, -1.424906, 0, 1, 0.4705882, 1,
-0.2212167, 0.3667157, -1.32293, 0, 1, 0.4784314, 1,
-0.2203593, -0.4618873, -1.739655, 0, 1, 0.4823529, 1,
-0.2167562, -0.743174, -2.480883, 0, 1, 0.4901961, 1,
-0.2088114, -0.7104763, -0.6525522, 0, 1, 0.4941176, 1,
-0.2031694, -1.548213, -4.018782, 0, 1, 0.5019608, 1,
-0.2018977, 0.5224358, -0.1858714, 0, 1, 0.509804, 1,
-0.2011551, -0.2100716, -1.744772, 0, 1, 0.5137255, 1,
-0.2004331, 0.4623859, -0.626011, 0, 1, 0.5215687, 1,
-0.1999823, 0.4594437, 1.073973, 0, 1, 0.5254902, 1,
-0.1979293, 1.48592, -0.7854444, 0, 1, 0.5333334, 1,
-0.1961104, -0.5580876, -5.085689, 0, 1, 0.5372549, 1,
-0.1941743, 0.1953132, 0.1916328, 0, 1, 0.5450981, 1,
-0.1939748, 0.2283478, 0.187812, 0, 1, 0.5490196, 1,
-0.1935081, 0.5666739, -0.2161093, 0, 1, 0.5568628, 1,
-0.1858131, -0.4954338, -3.785815, 0, 1, 0.5607843, 1,
-0.1800381, 0.5853099, -1.27591, 0, 1, 0.5686275, 1,
-0.1768973, 1.69177, 1.627954, 0, 1, 0.572549, 1,
-0.1751152, 0.7830302, -1.008641, 0, 1, 0.5803922, 1,
-0.1726131, 1.696226, 1.772915, 0, 1, 0.5843138, 1,
-0.1634578, 0.4259902, -2.244395, 0, 1, 0.5921569, 1,
-0.1628275, 0.009946531, -0.6423988, 0, 1, 0.5960785, 1,
-0.1583779, 2.028778, -1.361868, 0, 1, 0.6039216, 1,
-0.1582213, -0.1722839, -2.773376, 0, 1, 0.6117647, 1,
-0.1573442, -0.2016533, -3.906865, 0, 1, 0.6156863, 1,
-0.1509148, -0.599183, -3.167582, 0, 1, 0.6235294, 1,
-0.1486207, -0.4826329, -1.904696, 0, 1, 0.627451, 1,
-0.1452455, -0.1468427, -2.89569, 0, 1, 0.6352941, 1,
-0.1451853, -1.433865, -3.308774, 0, 1, 0.6392157, 1,
-0.1417368, -1.471283, -2.582815, 0, 1, 0.6470588, 1,
-0.1411684, -1.983795, -2.607313, 0, 1, 0.6509804, 1,
-0.139748, 1.414548, -1.223817, 0, 1, 0.6588235, 1,
-0.1298407, 0.4688627, 0.9747745, 0, 1, 0.6627451, 1,
-0.1256564, -1.257217, -1.576108, 0, 1, 0.6705883, 1,
-0.1255868, -2.010138, -3.29393, 0, 1, 0.6745098, 1,
-0.1234386, 0.6724232, 0.5063346, 0, 1, 0.682353, 1,
-0.1222568, -1.751508, -3.812161, 0, 1, 0.6862745, 1,
-0.1184181, 0.9555725, 0.3980187, 0, 1, 0.6941177, 1,
-0.1171652, 0.3034118, -0.8677608, 0, 1, 0.7019608, 1,
-0.114088, -1.24388, -2.262156, 0, 1, 0.7058824, 1,
-0.1129681, -0.4659711, -2.763196, 0, 1, 0.7137255, 1,
-0.1082118, 0.09213828, -2.045241, 0, 1, 0.7176471, 1,
-0.1069452, 0.3358241, -0.5704086, 0, 1, 0.7254902, 1,
-0.10284, 1.766117, -0.1334472, 0, 1, 0.7294118, 1,
-0.1024043, -0.4531927, -0.02596705, 0, 1, 0.7372549, 1,
-0.1022158, 0.7695119, -2.54056, 0, 1, 0.7411765, 1,
-0.1005408, -1.396296, -2.936313, 0, 1, 0.7490196, 1,
-0.09974793, 0.774892, -0.2493842, 0, 1, 0.7529412, 1,
-0.0992564, 0.3880171, 0.113826, 0, 1, 0.7607843, 1,
-0.09888386, 0.8926734, -2.869568, 0, 1, 0.7647059, 1,
-0.09791001, -0.1358394, -2.687677, 0, 1, 0.772549, 1,
-0.09681027, 0.9508539, 0.680745, 0, 1, 0.7764706, 1,
-0.09352139, 0.2499797, 0.140983, 0, 1, 0.7843137, 1,
-0.09227021, -0.3236108, -2.685212, 0, 1, 0.7882353, 1,
-0.09133418, 0.4579731, 1.373675, 0, 1, 0.7960784, 1,
-0.09119446, -0.4452678, -1.278473, 0, 1, 0.8039216, 1,
-0.08895584, -0.8923436, -3.111007, 0, 1, 0.8078431, 1,
-0.08353186, 1.393552, 0.4909181, 0, 1, 0.8156863, 1,
-0.08329092, -1.753261, -3.198037, 0, 1, 0.8196079, 1,
-0.06557006, -1.319403, -3.491145, 0, 1, 0.827451, 1,
-0.06525041, -0.737878, -4.097224, 0, 1, 0.8313726, 1,
-0.06393281, -0.6700001, -3.391307, 0, 1, 0.8392157, 1,
-0.06305528, 0.2517305, -0.4356652, 0, 1, 0.8431373, 1,
-0.06110428, -0.4098989, -4.681312, 0, 1, 0.8509804, 1,
-0.0608394, 0.40435, 1.722686, 0, 1, 0.854902, 1,
-0.05828439, -0.7633886, -3.629069, 0, 1, 0.8627451, 1,
-0.05707588, -2.381532, -3.212819, 0, 1, 0.8666667, 1,
-0.05509991, 1.70399, 0.8369731, 0, 1, 0.8745098, 1,
-0.04638021, -0.2479229, -2.189192, 0, 1, 0.8784314, 1,
-0.04504386, 1.315924, 0.38014, 0, 1, 0.8862745, 1,
-0.04130911, -0.1932162, -4.050501, 0, 1, 0.8901961, 1,
-0.03945643, 1.236421, 0.92749, 0, 1, 0.8980392, 1,
-0.03855281, 0.4559181, 0.2619333, 0, 1, 0.9058824, 1,
-0.03813568, -0.6420743, -0.1954811, 0, 1, 0.9098039, 1,
-0.03614217, 0.003456646, -1.24199, 0, 1, 0.9176471, 1,
-0.03497644, -0.1081537, -1.900039, 0, 1, 0.9215686, 1,
-0.03488036, -1.829395, -2.781639, 0, 1, 0.9294118, 1,
-0.03255948, 0.1731557, 3.262814, 0, 1, 0.9333333, 1,
-0.03169154, 0.9119829, -0.2141141, 0, 1, 0.9411765, 1,
-0.03064307, 1.319354, 0.2095922, 0, 1, 0.945098, 1,
-0.01785982, -0.06104784, -3.713179, 0, 1, 0.9529412, 1,
-0.01614736, -0.9009301, -3.119575, 0, 1, 0.9568627, 1,
-0.01330917, 1.30566, -0.3635802, 0, 1, 0.9647059, 1,
-0.01303714, 1.076331, 0.1782221, 0, 1, 0.9686275, 1,
-0.006353459, -0.09315272, -4.289701, 0, 1, 0.9764706, 1,
-0.003955852, 0.06982722, -0.7101279, 0, 1, 0.9803922, 1,
-0.001144886, -1.756894, -3.715596, 0, 1, 0.9882353, 1,
0.001720655, -0.1659411, 3.337752, 0, 1, 0.9921569, 1,
0.004577521, -0.2693426, 2.971462, 0, 1, 1, 1,
0.006150148, -0.5907996, 2.283176, 0, 0.9921569, 1, 1,
0.0136631, -0.3546169, 3.320658, 0, 0.9882353, 1, 1,
0.01379002, 0.0619043, 0.05997614, 0, 0.9803922, 1, 1,
0.01435087, 0.56242, 0.6242498, 0, 0.9764706, 1, 1,
0.01813823, 0.0776216, -2.306187, 0, 0.9686275, 1, 1,
0.01953076, 0.02338106, 2.363153, 0, 0.9647059, 1, 1,
0.01990215, 0.6976538, 0.6756712, 0, 0.9568627, 1, 1,
0.02235455, 0.4973216, 1.366984, 0, 0.9529412, 1, 1,
0.02280143, 0.5296786, -0.1447913, 0, 0.945098, 1, 1,
0.02953639, -0.1227633, 3.48875, 0, 0.9411765, 1, 1,
0.0323121, -0.4110601, 2.026478, 0, 0.9333333, 1, 1,
0.03290438, 1.114502, 0.02940576, 0, 0.9294118, 1, 1,
0.033323, 1.501205, -0.2904423, 0, 0.9215686, 1, 1,
0.04016976, 1.312021, -0.2131066, 0, 0.9176471, 1, 1,
0.04118448, 1.678148, 0.3896487, 0, 0.9098039, 1, 1,
0.04622569, 0.4459716, -0.7194952, 0, 0.9058824, 1, 1,
0.05050543, 0.496758, -0.3385352, 0, 0.8980392, 1, 1,
0.05109847, -1.254957, 4.699259, 0, 0.8901961, 1, 1,
0.06209967, -0.3782594, 2.413196, 0, 0.8862745, 1, 1,
0.06370264, 0.0482974, -1.038263, 0, 0.8784314, 1, 1,
0.0638001, -0.6765854, 3.4681, 0, 0.8745098, 1, 1,
0.06507856, -0.2617642, 3.275196, 0, 0.8666667, 1, 1,
0.06720264, -0.2180004, 3.536493, 0, 0.8627451, 1, 1,
0.06776951, -0.253692, 2.710457, 0, 0.854902, 1, 1,
0.06983087, 1.575094, 1.85969, 0, 0.8509804, 1, 1,
0.07793786, 0.8861529, -1.192109, 0, 0.8431373, 1, 1,
0.07921652, 0.4320995, -1.740838, 0, 0.8392157, 1, 1,
0.08211599, 0.9877355, 0.05296296, 0, 0.8313726, 1, 1,
0.08525424, -0.2832204, 2.392645, 0, 0.827451, 1, 1,
0.08670054, -0.1105229, 2.549972, 0, 0.8196079, 1, 1,
0.0940447, -0.4920991, 3.309405, 0, 0.8156863, 1, 1,
0.09463573, 0.09811933, 0.1227736, 0, 0.8078431, 1, 1,
0.09503166, -0.9607024, 2.493509, 0, 0.8039216, 1, 1,
0.09856574, 0.1919931, -0.04173517, 0, 0.7960784, 1, 1,
0.1039595, -1.03293, 2.318089, 0, 0.7882353, 1, 1,
0.1066904, -1.466157, 2.531748, 0, 0.7843137, 1, 1,
0.1085317, -0.4241212, 3.501467, 0, 0.7764706, 1, 1,
0.1102628, 0.1215339, -1.101709, 0, 0.772549, 1, 1,
0.1106085, 0.5115749, 0.5396491, 0, 0.7647059, 1, 1,
0.113891, 0.5478019, -0.6763759, 0, 0.7607843, 1, 1,
0.1156707, -0.4032072, 2.369738, 0, 0.7529412, 1, 1,
0.1202807, 1.447198, -1.437641, 0, 0.7490196, 1, 1,
0.1206558, 0.1597463, 0.7840143, 0, 0.7411765, 1, 1,
0.1221779, 0.4514463, 0.8764438, 0, 0.7372549, 1, 1,
0.1250204, -1.213426, 3.244428, 0, 0.7294118, 1, 1,
0.1256066, -0.9866019, 1.226011, 0, 0.7254902, 1, 1,
0.126624, -1.554317, 4.802664, 0, 0.7176471, 1, 1,
0.1307778, 0.4151801, 0.09364241, 0, 0.7137255, 1, 1,
0.1313858, -1.321284, 1.611436, 0, 0.7058824, 1, 1,
0.1330315, 0.167336, -0.1305398, 0, 0.6980392, 1, 1,
0.1439046, -0.09655155, 2.214167, 0, 0.6941177, 1, 1,
0.1457561, -0.9901301, 3.070329, 0, 0.6862745, 1, 1,
0.1500584, -0.2396909, 1.383789, 0, 0.682353, 1, 1,
0.1585304, -0.6201051, 2.566359, 0, 0.6745098, 1, 1,
0.1588399, 2.974059, 0.1466004, 0, 0.6705883, 1, 1,
0.1613704, 0.7977672, 0.5191664, 0, 0.6627451, 1, 1,
0.1643645, -1.271932, 2.652656, 0, 0.6588235, 1, 1,
0.1646315, 1.509714, 1.077835, 0, 0.6509804, 1, 1,
0.1698661, -1.566404, 3.044824, 0, 0.6470588, 1, 1,
0.1736063, 0.05572216, 2.020277, 0, 0.6392157, 1, 1,
0.1782078, -1.05381, 4.267231, 0, 0.6352941, 1, 1,
0.1814451, 0.3129912, -0.8216935, 0, 0.627451, 1, 1,
0.1825137, -0.5883461, 0.786955, 0, 0.6235294, 1, 1,
0.1830936, 1.11658, 0.8991261, 0, 0.6156863, 1, 1,
0.1831847, 1.420162, -0.4809119, 0, 0.6117647, 1, 1,
0.1837423, 0.7470205, -0.1495539, 0, 0.6039216, 1, 1,
0.1850003, 1.521187, 1.174327, 0, 0.5960785, 1, 1,
0.1869106, 0.8783376, -0.2281071, 0, 0.5921569, 1, 1,
0.190779, -0.2981658, 4.474506, 0, 0.5843138, 1, 1,
0.1908608, -0.02220446, -0.4116828, 0, 0.5803922, 1, 1,
0.1915712, -0.08780063, 1.290732, 0, 0.572549, 1, 1,
0.1916283, 1.233169, -0.1571939, 0, 0.5686275, 1, 1,
0.1968407, 0.9993045, 0.9962139, 0, 0.5607843, 1, 1,
0.1969656, -1.138072, 2.344215, 0, 0.5568628, 1, 1,
0.1984118, -0.7203644, 1.582512, 0, 0.5490196, 1, 1,
0.2089028, 1.633304, 0.01007564, 0, 0.5450981, 1, 1,
0.2133423, 1.801132, -1.536512, 0, 0.5372549, 1, 1,
0.2199236, 0.630542, 0.4821466, 0, 0.5333334, 1, 1,
0.2210008, -0.2163232, 3.05467, 0, 0.5254902, 1, 1,
0.2214058, -0.269316, 3.580883, 0, 0.5215687, 1, 1,
0.2228114, -0.3077947, 1.890632, 0, 0.5137255, 1, 1,
0.2232573, 0.7460251, 0.7702122, 0, 0.509804, 1, 1,
0.2251102, 1.718902, -0.1759091, 0, 0.5019608, 1, 1,
0.2252203, -0.02373594, 1.311464, 0, 0.4941176, 1, 1,
0.2310685, -0.5794275, 0.8436123, 0, 0.4901961, 1, 1,
0.2319015, -0.05862308, 2.256048, 0, 0.4823529, 1, 1,
0.2326617, -0.112995, 4.051265, 0, 0.4784314, 1, 1,
0.2385388, -1.276883, 2.157764, 0, 0.4705882, 1, 1,
0.2416225, -2.541516, 3.004927, 0, 0.4666667, 1, 1,
0.2432113, 1.294694, 1.362747, 0, 0.4588235, 1, 1,
0.2433942, -0.3961529, 3.131417, 0, 0.454902, 1, 1,
0.2439224, -0.3607797, 3.28758, 0, 0.4470588, 1, 1,
0.2442441, 0.3978864, 0.5149084, 0, 0.4431373, 1, 1,
0.245157, -0.2855276, 2.631172, 0, 0.4352941, 1, 1,
0.2452547, -0.9888922, 3.607739, 0, 0.4313726, 1, 1,
0.2663518, 0.024295, 2.707053, 0, 0.4235294, 1, 1,
0.2683234, -1.691594, 3.937436, 0, 0.4196078, 1, 1,
0.2748022, 1.681942, -0.1010986, 0, 0.4117647, 1, 1,
0.2751317, -0.6821805, 3.268687, 0, 0.4078431, 1, 1,
0.2754206, -0.5855483, 1.633479, 0, 0.4, 1, 1,
0.2780571, -0.06157139, 2.09119, 0, 0.3921569, 1, 1,
0.2783579, -1.07516, 2.7433, 0, 0.3882353, 1, 1,
0.2787242, -0.3104655, 2.514079, 0, 0.3803922, 1, 1,
0.2806288, -0.8348843, 1.173669, 0, 0.3764706, 1, 1,
0.2815255, 0.04656458, 2.00107, 0, 0.3686275, 1, 1,
0.281742, -1.937837, 2.315609, 0, 0.3647059, 1, 1,
0.2825908, -0.9691524, 2.735268, 0, 0.3568628, 1, 1,
0.2848764, -0.3030301, 0.1861756, 0, 0.3529412, 1, 1,
0.2867286, 0.2233005, 0.4694873, 0, 0.345098, 1, 1,
0.2874796, 0.2591609, 2.589619, 0, 0.3411765, 1, 1,
0.2893279, 2.075361, -0.8756083, 0, 0.3333333, 1, 1,
0.2904761, 0.324178, 0.6728919, 0, 0.3294118, 1, 1,
0.2950654, 0.4733898, -0.5492009, 0, 0.3215686, 1, 1,
0.2956672, -0.7016762, 5.390384, 0, 0.3176471, 1, 1,
0.3007713, 1.659894, -0.3216328, 0, 0.3098039, 1, 1,
0.3043561, -1.513091, 4.896129, 0, 0.3058824, 1, 1,
0.3044168, -0.6994208, 3.894343, 0, 0.2980392, 1, 1,
0.3044508, -1.075855, 3.741049, 0, 0.2901961, 1, 1,
0.3060125, 1.227564, 1.987305, 0, 0.2862745, 1, 1,
0.3080252, 0.2452448, -0.4173819, 0, 0.2784314, 1, 1,
0.3090971, -0.7833624, 3.286464, 0, 0.2745098, 1, 1,
0.3110978, -0.1860736, 0.1623172, 0, 0.2666667, 1, 1,
0.3132615, -2.113351, 3.292293, 0, 0.2627451, 1, 1,
0.3160132, -1.880566, 6.164961, 0, 0.254902, 1, 1,
0.3160937, 1.680401, 0.7463664, 0, 0.2509804, 1, 1,
0.319191, -0.4475053, 1.849086, 0, 0.2431373, 1, 1,
0.3192753, 0.5517277, -1.708383, 0, 0.2392157, 1, 1,
0.3194688, 1.332301, 0.3065628, 0, 0.2313726, 1, 1,
0.3223509, 1.19142, -0.5268194, 0, 0.227451, 1, 1,
0.3240472, 0.3722038, 0.2622396, 0, 0.2196078, 1, 1,
0.3249428, 0.1601613, -0.1081037, 0, 0.2156863, 1, 1,
0.3252203, 0.3244241, 0.5206004, 0, 0.2078431, 1, 1,
0.3289398, -0.2273079, 2.565422, 0, 0.2039216, 1, 1,
0.32952, -0.406971, 2.900505, 0, 0.1960784, 1, 1,
0.3295514, 0.2313384, 0.9979819, 0, 0.1882353, 1, 1,
0.3328035, 2.096986, -0.5122536, 0, 0.1843137, 1, 1,
0.3381417, -0.06298686, 2.949867, 0, 0.1764706, 1, 1,
0.3408805, -1.414946, 2.427892, 0, 0.172549, 1, 1,
0.3428324, -0.7999982, 3.368264, 0, 0.1647059, 1, 1,
0.3466374, -0.3600187, 3.048296, 0, 0.1607843, 1, 1,
0.3476233, 0.2975355, 2.186209, 0, 0.1529412, 1, 1,
0.3477994, 1.216243, -0.3818238, 0, 0.1490196, 1, 1,
0.3517842, -0.832818, 1.995725, 0, 0.1411765, 1, 1,
0.3537198, -1.017605, 2.403482, 0, 0.1372549, 1, 1,
0.3553343, -0.4197611, 3.018788, 0, 0.1294118, 1, 1,
0.3568879, 0.8263859, -1.034779, 0, 0.1254902, 1, 1,
0.3593702, 0.3735335, 1.013663, 0, 0.1176471, 1, 1,
0.3630362, 0.3867155, 0.3040718, 0, 0.1137255, 1, 1,
0.3647164, 0.5922354, 0.9695457, 0, 0.1058824, 1, 1,
0.3670399, 0.09434201, 1.414402, 0, 0.09803922, 1, 1,
0.3677631, 0.1848106, 1.724504, 0, 0.09411765, 1, 1,
0.3735303, 0.01693674, 1.273139, 0, 0.08627451, 1, 1,
0.3761338, -0.8909699, 2.712866, 0, 0.08235294, 1, 1,
0.3783462, -0.3333716, 2.419896, 0, 0.07450981, 1, 1,
0.3812558, 0.1174667, 0.5492863, 0, 0.07058824, 1, 1,
0.3830961, 0.274017, 1.290918, 0, 0.0627451, 1, 1,
0.3857717, -0.05247653, 2.981777, 0, 0.05882353, 1, 1,
0.3870572, -1.771569, 2.507766, 0, 0.05098039, 1, 1,
0.3886999, -1.491086, 2.425005, 0, 0.04705882, 1, 1,
0.395986, -0.09270811, 2.763707, 0, 0.03921569, 1, 1,
0.3974182, -0.6431122, 2.10248, 0, 0.03529412, 1, 1,
0.4089189, -3.595724, 5.146058, 0, 0.02745098, 1, 1,
0.4122383, 0.5252072, 1.174824, 0, 0.02352941, 1, 1,
0.4176401, -0.6773961, 2.502813, 0, 0.01568628, 1, 1,
0.4274177, 1.05076, 0.06456704, 0, 0.01176471, 1, 1,
0.4284198, -1.36447, 1.724157, 0, 0.003921569, 1, 1,
0.4315198, 1.149618, 0.5842943, 0.003921569, 0, 1, 1,
0.4362955, -1.670386, 2.024563, 0.007843138, 0, 1, 1,
0.4363622, -2.289402, 2.859606, 0.01568628, 0, 1, 1,
0.4372593, 0.008614758, 0.5636176, 0.01960784, 0, 1, 1,
0.4377205, 1.418614, -0.102989, 0.02745098, 0, 1, 1,
0.4416659, 0.386155, 2.127138, 0.03137255, 0, 1, 1,
0.4449746, -1.386773, 1.813079, 0.03921569, 0, 1, 1,
0.4513812, 0.6390377, 0.4979256, 0.04313726, 0, 1, 1,
0.4516236, -1.574349, 2.710351, 0.05098039, 0, 1, 1,
0.45266, 0.3363703, 0.04319604, 0.05490196, 0, 1, 1,
0.4564077, 0.3994798, 2.626635, 0.0627451, 0, 1, 1,
0.4568605, 0.2815136, 1.565609, 0.06666667, 0, 1, 1,
0.4609639, 0.6484454, 1.510354, 0.07450981, 0, 1, 1,
0.462432, 0.7932161, -0.1854722, 0.07843138, 0, 1, 1,
0.4650605, 1.223764, 2.092892, 0.08627451, 0, 1, 1,
0.4663587, 0.2000558, 0.601068, 0.09019608, 0, 1, 1,
0.4679365, -1.083777, 3.822583, 0.09803922, 0, 1, 1,
0.468554, 0.4345716, 0.7421071, 0.1058824, 0, 1, 1,
0.4711449, -0.912231, 3.425673, 0.1098039, 0, 1, 1,
0.4754504, 0.8327394, -0.02707008, 0.1176471, 0, 1, 1,
0.4764117, -1.25047, 2.633542, 0.1215686, 0, 1, 1,
0.4900221, -0.4294839, 3.159851, 0.1294118, 0, 1, 1,
0.4924436, -0.05892653, 3.695185, 0.1333333, 0, 1, 1,
0.4930979, -2.010883, 2.309634, 0.1411765, 0, 1, 1,
0.4992085, -0.2459179, 4.195019, 0.145098, 0, 1, 1,
0.4995091, 1.111111, 2.622186, 0.1529412, 0, 1, 1,
0.4996829, -1.520723, 2.268434, 0.1568628, 0, 1, 1,
0.5120955, -0.123578, 0.3808545, 0.1647059, 0, 1, 1,
0.5158298, 0.4702938, 0.4937345, 0.1686275, 0, 1, 1,
0.5162126, 0.5791188, 0.6628398, 0.1764706, 0, 1, 1,
0.5170381, -0.6452124, 1.011639, 0.1803922, 0, 1, 1,
0.5291204, -0.514908, 3.780892, 0.1882353, 0, 1, 1,
0.5321246, -0.7063875, 2.244322, 0.1921569, 0, 1, 1,
0.5334794, -0.6351815, 2.271885, 0.2, 0, 1, 1,
0.5351456, 0.6404684, 2.306238, 0.2078431, 0, 1, 1,
0.5369516, 1.679755, -0.48373, 0.2117647, 0, 1, 1,
0.5478761, 0.4171461, 1.179675, 0.2196078, 0, 1, 1,
0.5487389, 0.2776508, 1.759073, 0.2235294, 0, 1, 1,
0.554467, -0.08664245, 0.8915169, 0.2313726, 0, 1, 1,
0.5556514, 1.279759, -1.735009, 0.2352941, 0, 1, 1,
0.5594623, 0.4982235, 0.5457261, 0.2431373, 0, 1, 1,
0.5599369, 0.9833905, -0.9652507, 0.2470588, 0, 1, 1,
0.5680208, -1.482848, 2.019217, 0.254902, 0, 1, 1,
0.5697852, -1.187756, 1.729365, 0.2588235, 0, 1, 1,
0.5698149, 0.5850111, 0.1157303, 0.2666667, 0, 1, 1,
0.5755799, -0.8653845, 0.5934514, 0.2705882, 0, 1, 1,
0.5799783, -3.186356, 3.948145, 0.2784314, 0, 1, 1,
0.5799925, 1.055953, 0.9400958, 0.282353, 0, 1, 1,
0.581651, 0.38217, -0.1858755, 0.2901961, 0, 1, 1,
0.5883878, 0.2533492, 1.549523, 0.2941177, 0, 1, 1,
0.5890567, 1.180144, 0.7054104, 0.3019608, 0, 1, 1,
0.5893288, 1.327408, 3.009217, 0.3098039, 0, 1, 1,
0.5907341, 0.9146544, -0.9700154, 0.3137255, 0, 1, 1,
0.5946781, -1.321802, 2.908674, 0.3215686, 0, 1, 1,
0.598608, -0.1047376, 2.891193, 0.3254902, 0, 1, 1,
0.6012694, 0.3070697, -0.2786148, 0.3333333, 0, 1, 1,
0.6068769, 0.1296888, 0.4478197, 0.3372549, 0, 1, 1,
0.6074294, 1.145477, -0.3374025, 0.345098, 0, 1, 1,
0.6104696, -1.577666, 3.926855, 0.3490196, 0, 1, 1,
0.6152101, 0.3702215, 1.944597, 0.3568628, 0, 1, 1,
0.6160765, -0.296703, 2.298497, 0.3607843, 0, 1, 1,
0.6162301, 0.8940455, 1.103723, 0.3686275, 0, 1, 1,
0.6162727, 0.9636381, 0.8214124, 0.372549, 0, 1, 1,
0.616626, -1.862649, 3.24066, 0.3803922, 0, 1, 1,
0.6171447, 0.008037516, 2.367396, 0.3843137, 0, 1, 1,
0.6195, 0.2506718, 0.6965129, 0.3921569, 0, 1, 1,
0.6208515, 0.3159414, 1.697654, 0.3960784, 0, 1, 1,
0.6208971, -1.194339, 3.122191, 0.4039216, 0, 1, 1,
0.6213952, 0.4373447, 1.588628, 0.4117647, 0, 1, 1,
0.6220734, -1.663651, 5.195278, 0.4156863, 0, 1, 1,
0.6233459, -0.9761102, 0.6239157, 0.4235294, 0, 1, 1,
0.6241141, -0.6407456, 1.627238, 0.427451, 0, 1, 1,
0.6261362, 0.5113432, -0.3921251, 0.4352941, 0, 1, 1,
0.6265975, -0.644296, 1.847147, 0.4392157, 0, 1, 1,
0.6267835, -1.106642, 1.071268, 0.4470588, 0, 1, 1,
0.6295527, 0.8228996, -0.2265152, 0.4509804, 0, 1, 1,
0.6299583, -0.6537493, 3.934845, 0.4588235, 0, 1, 1,
0.6306617, 0.03844243, 2.18853, 0.4627451, 0, 1, 1,
0.6366166, -0.5326179, 2.415746, 0.4705882, 0, 1, 1,
0.6376896, 0.5286322, 1.980866, 0.4745098, 0, 1, 1,
0.6488589, 0.4267903, 1.744582, 0.4823529, 0, 1, 1,
0.6489567, 0.3634813, -0.8846091, 0.4862745, 0, 1, 1,
0.6492, 0.2116957, 1.77348, 0.4941176, 0, 1, 1,
0.6493756, -0.2076, 0.4883055, 0.5019608, 0, 1, 1,
0.6524709, -0.2745297, 1.082864, 0.5058824, 0, 1, 1,
0.6581698, -0.158222, 1.060921, 0.5137255, 0, 1, 1,
0.6649674, -0.4663474, 1.704812, 0.5176471, 0, 1, 1,
0.6652613, -0.8268368, 2.058756, 0.5254902, 0, 1, 1,
0.674466, 0.9905107, -0.5578071, 0.5294118, 0, 1, 1,
0.6748832, 0.9953876, 1.951862, 0.5372549, 0, 1, 1,
0.6770558, -1.020313, 2.403747, 0.5411765, 0, 1, 1,
0.6775993, 1.387884, 1.202061, 0.5490196, 0, 1, 1,
0.6777029, -0.4460038, 2.288382, 0.5529412, 0, 1, 1,
0.6900289, 0.6100842, -0.4716461, 0.5607843, 0, 1, 1,
0.6908414, 1.280428, 2.153872, 0.5647059, 0, 1, 1,
0.6912581, 0.1438258, 2.259129, 0.572549, 0, 1, 1,
0.6917836, -0.9073745, 2.756393, 0.5764706, 0, 1, 1,
0.6930212, -0.6878323, 0.2124855, 0.5843138, 0, 1, 1,
0.6941769, -0.9713016, 1.712526, 0.5882353, 0, 1, 1,
0.6945664, 1.188983, -0.111346, 0.5960785, 0, 1, 1,
0.6968577, 0.1948515, 1.777786, 0.6039216, 0, 1, 1,
0.7045051, -0.1318903, 0.6316483, 0.6078432, 0, 1, 1,
0.7055722, -0.7346904, 2.811995, 0.6156863, 0, 1, 1,
0.7125782, 0.505254, 1.305385, 0.6196079, 0, 1, 1,
0.7144912, -1.113793, 2.100042, 0.627451, 0, 1, 1,
0.7260436, -0.08704523, 2.281373, 0.6313726, 0, 1, 1,
0.7323898, -0.04930095, 1.435858, 0.6392157, 0, 1, 1,
0.7326316, -1.052125, 0.5083746, 0.6431373, 0, 1, 1,
0.7362903, 0.1198862, 1.749588, 0.6509804, 0, 1, 1,
0.7427194, 0.01891852, 0.863563, 0.654902, 0, 1, 1,
0.7436827, 1.212397, 1.64298, 0.6627451, 0, 1, 1,
0.7439254, 0.4084719, 0.9095074, 0.6666667, 0, 1, 1,
0.7454679, -1.769191, 1.362216, 0.6745098, 0, 1, 1,
0.7499086, 1.200267, -0.01816275, 0.6784314, 0, 1, 1,
0.7499558, 0.7484525, 1.02362, 0.6862745, 0, 1, 1,
0.7547427, -0.4716463, 1.531438, 0.6901961, 0, 1, 1,
0.7634398, 0.2997919, 0.6734256, 0.6980392, 0, 1, 1,
0.7644383, -0.6331834, 3.349993, 0.7058824, 0, 1, 1,
0.7677364, -0.3575498, 2.644965, 0.7098039, 0, 1, 1,
0.7708673, 0.5836875, 1.898927, 0.7176471, 0, 1, 1,
0.7718558, 0.7195459, -0.7918336, 0.7215686, 0, 1, 1,
0.7750975, 0.04659878, 2.276328, 0.7294118, 0, 1, 1,
0.7784824, 0.4439606, 2.751234, 0.7333333, 0, 1, 1,
0.7798536, 0.2495874, 0.6109812, 0.7411765, 0, 1, 1,
0.7833743, 1.826622, -0.06209891, 0.7450981, 0, 1, 1,
0.7912138, 1.258917, -0.8304189, 0.7529412, 0, 1, 1,
0.7912947, 0.22608, 0.9770343, 0.7568628, 0, 1, 1,
0.797509, 0.7332311, 0.7862031, 0.7647059, 0, 1, 1,
0.7979158, 1.002197, 1.984761, 0.7686275, 0, 1, 1,
0.8085653, -0.369749, 2.084526, 0.7764706, 0, 1, 1,
0.8133553, 0.1394661, 1.944773, 0.7803922, 0, 1, 1,
0.8185362, -0.05040841, 1.7563, 0.7882353, 0, 1, 1,
0.8185983, -1.317951, 3.754722, 0.7921569, 0, 1, 1,
0.8236831, -0.6465237, 2.773015, 0.8, 0, 1, 1,
0.8261415, 0.9517212, 1.019053, 0.8078431, 0, 1, 1,
0.8281879, -1.167808, 2.338343, 0.8117647, 0, 1, 1,
0.8405752, 1.394757, 0.1646745, 0.8196079, 0, 1, 1,
0.8423025, 0.8741688, -1.317864, 0.8235294, 0, 1, 1,
0.8461745, -1.859959, 1.766313, 0.8313726, 0, 1, 1,
0.8502281, 0.4465604, 1.152376, 0.8352941, 0, 1, 1,
0.8503329, -0.6254208, 0.9522303, 0.8431373, 0, 1, 1,
0.8535355, 0.8159747, 1.812074, 0.8470588, 0, 1, 1,
0.8567218, 0.3487729, 2.921035, 0.854902, 0, 1, 1,
0.8577792, 0.2545382, -0.1186572, 0.8588235, 0, 1, 1,
0.8643729, 1.074505, 0.39751, 0.8666667, 0, 1, 1,
0.8665469, 1.147617, 1.489621, 0.8705882, 0, 1, 1,
0.8691354, 0.6148667, 0.4277859, 0.8784314, 0, 1, 1,
0.8737583, -2.818571, 2.358729, 0.8823529, 0, 1, 1,
0.8836423, 1.674836, -0.2085196, 0.8901961, 0, 1, 1,
0.8870289, 1.909766, 2.573659, 0.8941177, 0, 1, 1,
0.8895074, 0.7824964, 0.8260239, 0.9019608, 0, 1, 1,
0.8936297, 0.2855156, 0.03286561, 0.9098039, 0, 1, 1,
0.8954701, -1.647506, 2.75033, 0.9137255, 0, 1, 1,
0.8988122, -1.009983, 1.271163, 0.9215686, 0, 1, 1,
0.8998314, 0.9857407, 1.99208, 0.9254902, 0, 1, 1,
0.9019961, 0.1205166, 0.2205001, 0.9333333, 0, 1, 1,
0.9071456, -0.4206919, 3.187335, 0.9372549, 0, 1, 1,
0.9166484, -1.117822, 2.502673, 0.945098, 0, 1, 1,
0.92536, 1.062865, 0.7959936, 0.9490196, 0, 1, 1,
0.9290267, -0.01507415, 0.6150685, 0.9568627, 0, 1, 1,
0.9313843, -1.379081, 2.327839, 0.9607843, 0, 1, 1,
0.9341011, 0.366857, 1.20774, 0.9686275, 0, 1, 1,
0.9398094, 0.8551403, 0.7861772, 0.972549, 0, 1, 1,
0.9442803, 0.5817428, 1.854028, 0.9803922, 0, 1, 1,
0.9460034, -1.18406, 2.151036, 0.9843137, 0, 1, 1,
0.9474983, 2.085758, 1.970778, 0.9921569, 0, 1, 1,
0.9500465, 0.6371861, 2.638319, 0.9960784, 0, 1, 1,
0.9523771, -1.909563, 3.271963, 1, 0, 0.9960784, 1,
0.9557865, -1.105412, 3.205133, 1, 0, 0.9882353, 1,
0.9565752, -0.2834893, 0.7205355, 1, 0, 0.9843137, 1,
0.963182, -0.1995308, 0.2302929, 1, 0, 0.9764706, 1,
0.9655442, 0.3667668, 1.326779, 1, 0, 0.972549, 1,
0.9666777, 0.3705393, 2.011682, 1, 0, 0.9647059, 1,
0.9719667, 2.469598, -0.2715609, 1, 0, 0.9607843, 1,
0.9771823, 0.2938458, 2.83776, 1, 0, 0.9529412, 1,
0.9778435, 0.5752025, 0.3577645, 1, 0, 0.9490196, 1,
0.9813704, 0.07783113, 0.4924277, 1, 0, 0.9411765, 1,
0.9850569, 1.021325, 1.204593, 1, 0, 0.9372549, 1,
0.9878832, -1.600057, 1.935449, 1, 0, 0.9294118, 1,
0.9963427, 0.2439264, 1.402002, 1, 0, 0.9254902, 1,
0.9993299, 0.1148799, 0.3193341, 1, 0, 0.9176471, 1,
1.007496, -0.3623676, 1.260966, 1, 0, 0.9137255, 1,
1.012606, -0.08097359, 1.485126, 1, 0, 0.9058824, 1,
1.016833, 0.02337369, -0.5200874, 1, 0, 0.9019608, 1,
1.021599, 0.4136091, 1.093005, 1, 0, 0.8941177, 1,
1.0281, -1.318208, 1.527348, 1, 0, 0.8862745, 1,
1.034862, -1.923126, 2.929023, 1, 0, 0.8823529, 1,
1.042523, -0.7399648, 1.79146, 1, 0, 0.8745098, 1,
1.044279, -0.05262131, 1.75504, 1, 0, 0.8705882, 1,
1.044667, 1.163154, 1.055564, 1, 0, 0.8627451, 1,
1.045627, -0.09769593, 1.377814, 1, 0, 0.8588235, 1,
1.0483, -1.857108, 4.28457, 1, 0, 0.8509804, 1,
1.052198, -1.468947, 1.798048, 1, 0, 0.8470588, 1,
1.053382, 1.507062, 0.730932, 1, 0, 0.8392157, 1,
1.060523, -0.1734593, 0.1984477, 1, 0, 0.8352941, 1,
1.069717, -0.6332281, 2.191015, 1, 0, 0.827451, 1,
1.074381, 0.2547557, 1.559645, 1, 0, 0.8235294, 1,
1.087665, -1.045997, 2.936108, 1, 0, 0.8156863, 1,
1.094309, 0.2760991, 1.343054, 1, 0, 0.8117647, 1,
1.097184, 0.09257171, 1.203254, 1, 0, 0.8039216, 1,
1.102879, 1.032682, 1.085338, 1, 0, 0.7960784, 1,
1.106473, 2.325963, 1.266637, 1, 0, 0.7921569, 1,
1.11058, 0.7993169, 2.896622, 1, 0, 0.7843137, 1,
1.113013, -1.26802, 2.25847, 1, 0, 0.7803922, 1,
1.122919, 0.4366369, 1.114967, 1, 0, 0.772549, 1,
1.125077, -0.7352319, 2.120337, 1, 0, 0.7686275, 1,
1.126872, 1.310149, 0.9518819, 1, 0, 0.7607843, 1,
1.130179, -0.6581715, 1.173835, 1, 0, 0.7568628, 1,
1.139771, 0.3920498, -0.2857663, 1, 0, 0.7490196, 1,
1.140456, 0.9251884, 0.6701925, 1, 0, 0.7450981, 1,
1.146878, -0.5005592, 1.826864, 1, 0, 0.7372549, 1,
1.157221, -0.5089801, 1.790923, 1, 0, 0.7333333, 1,
1.159683, -0.2973724, 1.240945, 1, 0, 0.7254902, 1,
1.164014, 1.103535, -0.8380694, 1, 0, 0.7215686, 1,
1.165294, 0.5511, 2.20903, 1, 0, 0.7137255, 1,
1.166922, -1.58866, 3.189951, 1, 0, 0.7098039, 1,
1.169336, 0.3120557, 1.380069, 1, 0, 0.7019608, 1,
1.173918, 0.005741534, 0.4140404, 1, 0, 0.6941177, 1,
1.176125, -0.05777538, 2.718958, 1, 0, 0.6901961, 1,
1.189937, 0.759311, 1.210771, 1, 0, 0.682353, 1,
1.190316, 1.082187, 1.027401, 1, 0, 0.6784314, 1,
1.191467, 0.4600395, 2.925601, 1, 0, 0.6705883, 1,
1.202478, -0.6480403, 1.979856, 1, 0, 0.6666667, 1,
1.236812, 0.9427782, 0.1743089, 1, 0, 0.6588235, 1,
1.237774, 0.4811931, 1.918723, 1, 0, 0.654902, 1,
1.239821, 1.020405, 0.5261701, 1, 0, 0.6470588, 1,
1.246918, -0.879794, 1.829279, 1, 0, 0.6431373, 1,
1.249965, 1.263097, 2.62927, 1, 0, 0.6352941, 1,
1.251121, 2.207654, 0.3953041, 1, 0, 0.6313726, 1,
1.257828, 1.357706, 0.881804, 1, 0, 0.6235294, 1,
1.257996, -1.368953, 1.65367, 1, 0, 0.6196079, 1,
1.259006, -0.02726219, 3.553721, 1, 0, 0.6117647, 1,
1.259504, -0.7943147, 3.616434, 1, 0, 0.6078432, 1,
1.268384, 1.513166, 0.7925265, 1, 0, 0.6, 1,
1.271032, -0.2362166, 0.846823, 1, 0, 0.5921569, 1,
1.271674, -0.9453127, 3.956591, 1, 0, 0.5882353, 1,
1.281912, -1.044284, 2.151864, 1, 0, 0.5803922, 1,
1.287944, -0.09357883, 2.541474, 1, 0, 0.5764706, 1,
1.297523, 0.8122756, 1.577179, 1, 0, 0.5686275, 1,
1.299286, 0.6430897, 0.6495711, 1, 0, 0.5647059, 1,
1.302142, -0.2797209, 3.678936, 1, 0, 0.5568628, 1,
1.304343, -1.173223, 4.303176, 1, 0, 0.5529412, 1,
1.307047, 0.7811963, -0.4318467, 1, 0, 0.5450981, 1,
1.313632, -1.509477, 2.379962, 1, 0, 0.5411765, 1,
1.314786, 0.6571859, 1.68168, 1, 0, 0.5333334, 1,
1.315546, -2.605532, 2.162264, 1, 0, 0.5294118, 1,
1.316377, -1.691713, 1.210753, 1, 0, 0.5215687, 1,
1.337837, -0.5088441, 3.029673, 1, 0, 0.5176471, 1,
1.343495, 0.05319153, 1.007194, 1, 0, 0.509804, 1,
1.348451, 1.088454, 0.8270791, 1, 0, 0.5058824, 1,
1.351881, -0.3573861, 3.750883, 1, 0, 0.4980392, 1,
1.360091, 0.6155954, 1.373279, 1, 0, 0.4901961, 1,
1.362024, 0.2540229, 2.285007, 1, 0, 0.4862745, 1,
1.368965, -1.082202, 1.844347, 1, 0, 0.4784314, 1,
1.378062, 1.460475, 1.439174, 1, 0, 0.4745098, 1,
1.385036, -1.363972, 3.141615, 1, 0, 0.4666667, 1,
1.387248, -0.9033834, 1.679319, 1, 0, 0.4627451, 1,
1.393638, 0.562922, 0.6254794, 1, 0, 0.454902, 1,
1.393888, -0.6005118, -0.1482957, 1, 0, 0.4509804, 1,
1.415918, 0.4368194, 1.784757, 1, 0, 0.4431373, 1,
1.430797, -1.079145, 1.982622, 1, 0, 0.4392157, 1,
1.434526, -1.823887, 4.444054, 1, 0, 0.4313726, 1,
1.437016, -0.7054103, 1.891374, 1, 0, 0.427451, 1,
1.444632, -0.4320844, 2.416538, 1, 0, 0.4196078, 1,
1.448888, -0.6637028, 0.2233501, 1, 0, 0.4156863, 1,
1.452882, -0.2639917, 1.157862, 1, 0, 0.4078431, 1,
1.455784, -1.146298, 3.670905, 1, 0, 0.4039216, 1,
1.465199, -0.08227485, 1.002692, 1, 0, 0.3960784, 1,
1.467129, -0.8102099, 2.094819, 1, 0, 0.3882353, 1,
1.47613, -1.261932, 2.69042, 1, 0, 0.3843137, 1,
1.487, -2.22036, -0.3621644, 1, 0, 0.3764706, 1,
1.488788, 0.7456033, 0.8335149, 1, 0, 0.372549, 1,
1.533845, 1.367368, 0.3521844, 1, 0, 0.3647059, 1,
1.552929, -0.08019136, 1.957303, 1, 0, 0.3607843, 1,
1.577053, -1.857487, 1.799182, 1, 0, 0.3529412, 1,
1.587554, -1.588637, 2.192546, 1, 0, 0.3490196, 1,
1.596424, 0.2144212, 0.6895087, 1, 0, 0.3411765, 1,
1.602932, -1.22588, 2.115256, 1, 0, 0.3372549, 1,
1.607785, -0.1876057, 1.677363, 1, 0, 0.3294118, 1,
1.609051, 2.06143, -1.498631, 1, 0, 0.3254902, 1,
1.616276, -0.4360133, 2.038354, 1, 0, 0.3176471, 1,
1.622708, -0.4500577, 0.3916724, 1, 0, 0.3137255, 1,
1.629967, 0.9324439, 0.6549461, 1, 0, 0.3058824, 1,
1.633695, 0.4096251, 1.54493, 1, 0, 0.2980392, 1,
1.657905, -1.444875, 1.983039, 1, 0, 0.2941177, 1,
1.662957, -0.4464991, 2.360664, 1, 0, 0.2862745, 1,
1.670677, -1.183202, 1.714331, 1, 0, 0.282353, 1,
1.681327, -1.865987, 2.635462, 1, 0, 0.2745098, 1,
1.687252, 0.3471424, 2.385462, 1, 0, 0.2705882, 1,
1.72019, 1.057009, -1.524695, 1, 0, 0.2627451, 1,
1.729043, 2.228477, 0.3776295, 1, 0, 0.2588235, 1,
1.734187, -0.7984464, 2.455916, 1, 0, 0.2509804, 1,
1.742096, 1.46803, 1.465474, 1, 0, 0.2470588, 1,
1.751126, -0.2626758, 2.936238, 1, 0, 0.2392157, 1,
1.753299, 0.2320615, 0.6164498, 1, 0, 0.2352941, 1,
1.777715, 0.4785304, 1.44588, 1, 0, 0.227451, 1,
1.785004, -0.009947466, 1.073638, 1, 0, 0.2235294, 1,
1.798377, 0.7888004, 1.087034, 1, 0, 0.2156863, 1,
1.805083, 0.1096104, 0.82748, 1, 0, 0.2117647, 1,
1.817542, 0.1737644, 1.756521, 1, 0, 0.2039216, 1,
1.840143, 1.432295, 0.1744624, 1, 0, 0.1960784, 1,
1.863202, 1.027048, -0.08234862, 1, 0, 0.1921569, 1,
1.87594, 1.13326, 1.734868, 1, 0, 0.1843137, 1,
1.890311, -0.253633, 3.20196, 1, 0, 0.1803922, 1,
1.914624, -0.6033889, 2.289295, 1, 0, 0.172549, 1,
1.992478, 0.9072288, 2.19294, 1, 0, 0.1686275, 1,
1.996367, -0.4259744, 1.89083, 1, 0, 0.1607843, 1,
1.998868, 1.157864, 0.1847369, 1, 0, 0.1568628, 1,
2.016903, -2.679576, 3.262966, 1, 0, 0.1490196, 1,
2.018012, 0.915139, 3.16473, 1, 0, 0.145098, 1,
2.096496, -0.2917148, 2.048086, 1, 0, 0.1372549, 1,
2.118192, -0.6333509, 1.550173, 1, 0, 0.1333333, 1,
2.139762, 0.838577, 1.221847, 1, 0, 0.1254902, 1,
2.139954, 0.5969172, 1.665934, 1, 0, 0.1215686, 1,
2.14502, -0.941622, 3.214901, 1, 0, 0.1137255, 1,
2.14812, 0.2991732, 1.425599, 1, 0, 0.1098039, 1,
2.149934, 0.963031, 0.3647467, 1, 0, 0.1019608, 1,
2.157714, 0.8555781, 0.2688185, 1, 0, 0.09411765, 1,
2.185217, 0.6399109, 0.07429001, 1, 0, 0.09019608, 1,
2.195512, 1.040814, 1.917369, 1, 0, 0.08235294, 1,
2.202533, 2.16836, 0.808746, 1, 0, 0.07843138, 1,
2.216379, -0.7000735, 1.807259, 1, 0, 0.07058824, 1,
2.378177, -1.012843, 2.504078, 1, 0, 0.06666667, 1,
2.418343, -0.9167129, 3.513134, 1, 0, 0.05882353, 1,
2.46946, -1.321656, 2.603719, 1, 0, 0.05490196, 1,
2.483811, 0.5144117, 1.434468, 1, 0, 0.04705882, 1,
2.489298, -0.3017355, 0.7782694, 1, 0, 0.04313726, 1,
2.517596, -0.7332743, 3.840349, 1, 0, 0.03529412, 1,
2.71999, -1.374462, 3.449609, 1, 0, 0.03137255, 1,
2.768845, -0.9520702, 2.617723, 1, 0, 0.02352941, 1,
3.02326, 0.1665923, 0.7945473, 1, 0, 0.01960784, 1,
3.049183, -0.553709, 0.6991127, 1, 0, 0.01176471, 1,
3.796762, 0.9938332, -0.2273675, 1, 0, 0.007843138, 1
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
0.5686237, -4.709302, -7.026056, 0, -0.5, 0.5, 0.5,
0.5686237, -4.709302, -7.026056, 1, -0.5, 0.5, 0.5,
0.5686237, -4.709302, -7.026056, 1, 1.5, 0.5, 0.5,
0.5686237, -4.709302, -7.026056, 0, 1.5, 0.5, 0.5
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
-3.753854, -0.3108323, -7.026056, 0, -0.5, 0.5, 0.5,
-3.753854, -0.3108323, -7.026056, 1, -0.5, 0.5, 0.5,
-3.753854, -0.3108323, -7.026056, 1, 1.5, 0.5, 0.5,
-3.753854, -0.3108323, -7.026056, 0, 1.5, 0.5, 0.5
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
-3.753854, -4.709302, 0.5253642, 0, -0.5, 0.5, 0.5,
-3.753854, -4.709302, 0.5253642, 1, -0.5, 0.5, 0.5,
-3.753854, -4.709302, 0.5253642, 1, 1.5, 0.5, 0.5,
-3.753854, -4.709302, 0.5253642, 0, 1.5, 0.5, 0.5
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
-2, -3.69427, -5.283421,
3, -3.69427, -5.283421,
-2, -3.69427, -5.283421,
-2, -3.863442, -5.57386,
-1, -3.69427, -5.283421,
-1, -3.863442, -5.57386,
0, -3.69427, -5.283421,
0, -3.863442, -5.57386,
1, -3.69427, -5.283421,
1, -3.863442, -5.57386,
2, -3.69427, -5.283421,
2, -3.863442, -5.57386,
3, -3.69427, -5.283421,
3, -3.863442, -5.57386
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
-2, -4.201786, -6.154739, 0, -0.5, 0.5, 0.5,
-2, -4.201786, -6.154739, 1, -0.5, 0.5, 0.5,
-2, -4.201786, -6.154739, 1, 1.5, 0.5, 0.5,
-2, -4.201786, -6.154739, 0, 1.5, 0.5, 0.5,
-1, -4.201786, -6.154739, 0, -0.5, 0.5, 0.5,
-1, -4.201786, -6.154739, 1, -0.5, 0.5, 0.5,
-1, -4.201786, -6.154739, 1, 1.5, 0.5, 0.5,
-1, -4.201786, -6.154739, 0, 1.5, 0.5, 0.5,
0, -4.201786, -6.154739, 0, -0.5, 0.5, 0.5,
0, -4.201786, -6.154739, 1, -0.5, 0.5, 0.5,
0, -4.201786, -6.154739, 1, 1.5, 0.5, 0.5,
0, -4.201786, -6.154739, 0, 1.5, 0.5, 0.5,
1, -4.201786, -6.154739, 0, -0.5, 0.5, 0.5,
1, -4.201786, -6.154739, 1, -0.5, 0.5, 0.5,
1, -4.201786, -6.154739, 1, 1.5, 0.5, 0.5,
1, -4.201786, -6.154739, 0, 1.5, 0.5, 0.5,
2, -4.201786, -6.154739, 0, -0.5, 0.5, 0.5,
2, -4.201786, -6.154739, 1, -0.5, 0.5, 0.5,
2, -4.201786, -6.154739, 1, 1.5, 0.5, 0.5,
2, -4.201786, -6.154739, 0, 1.5, 0.5, 0.5,
3, -4.201786, -6.154739, 0, -0.5, 0.5, 0.5,
3, -4.201786, -6.154739, 1, -0.5, 0.5, 0.5,
3, -4.201786, -6.154739, 1, 1.5, 0.5, 0.5,
3, -4.201786, -6.154739, 0, 1.5, 0.5, 0.5
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
-2.756359, -3, -5.283421,
-2.756359, 2, -5.283421,
-2.756359, -3, -5.283421,
-2.922608, -3, -5.57386,
-2.756359, -2, -5.283421,
-2.922608, -2, -5.57386,
-2.756359, -1, -5.283421,
-2.922608, -1, -5.57386,
-2.756359, 0, -5.283421,
-2.922608, 0, -5.57386,
-2.756359, 1, -5.283421,
-2.922608, 1, -5.57386,
-2.756359, 2, -5.283421,
-2.922608, 2, -5.57386
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
-3.255107, -3, -6.154739, 0, -0.5, 0.5, 0.5,
-3.255107, -3, -6.154739, 1, -0.5, 0.5, 0.5,
-3.255107, -3, -6.154739, 1, 1.5, 0.5, 0.5,
-3.255107, -3, -6.154739, 0, 1.5, 0.5, 0.5,
-3.255107, -2, -6.154739, 0, -0.5, 0.5, 0.5,
-3.255107, -2, -6.154739, 1, -0.5, 0.5, 0.5,
-3.255107, -2, -6.154739, 1, 1.5, 0.5, 0.5,
-3.255107, -2, -6.154739, 0, 1.5, 0.5, 0.5,
-3.255107, -1, -6.154739, 0, -0.5, 0.5, 0.5,
-3.255107, -1, -6.154739, 1, -0.5, 0.5, 0.5,
-3.255107, -1, -6.154739, 1, 1.5, 0.5, 0.5,
-3.255107, -1, -6.154739, 0, 1.5, 0.5, 0.5,
-3.255107, 0, -6.154739, 0, -0.5, 0.5, 0.5,
-3.255107, 0, -6.154739, 1, -0.5, 0.5, 0.5,
-3.255107, 0, -6.154739, 1, 1.5, 0.5, 0.5,
-3.255107, 0, -6.154739, 0, 1.5, 0.5, 0.5,
-3.255107, 1, -6.154739, 0, -0.5, 0.5, 0.5,
-3.255107, 1, -6.154739, 1, -0.5, 0.5, 0.5,
-3.255107, 1, -6.154739, 1, 1.5, 0.5, 0.5,
-3.255107, 1, -6.154739, 0, 1.5, 0.5, 0.5,
-3.255107, 2, -6.154739, 0, -0.5, 0.5, 0.5,
-3.255107, 2, -6.154739, 1, -0.5, 0.5, 0.5,
-3.255107, 2, -6.154739, 1, 1.5, 0.5, 0.5,
-3.255107, 2, -6.154739, 0, 1.5, 0.5, 0.5
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
-2.756359, -3.69427, -4,
-2.756359, -3.69427, 6,
-2.756359, -3.69427, -4,
-2.922608, -3.863442, -4,
-2.756359, -3.69427, -2,
-2.922608, -3.863442, -2,
-2.756359, -3.69427, 0,
-2.922608, -3.863442, 0,
-2.756359, -3.69427, 2,
-2.922608, -3.863442, 2,
-2.756359, -3.69427, 4,
-2.922608, -3.863442, 4,
-2.756359, -3.69427, 6,
-2.922608, -3.863442, 6
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
-3.255107, -4.201786, -4, 0, -0.5, 0.5, 0.5,
-3.255107, -4.201786, -4, 1, -0.5, 0.5, 0.5,
-3.255107, -4.201786, -4, 1, 1.5, 0.5, 0.5,
-3.255107, -4.201786, -4, 0, 1.5, 0.5, 0.5,
-3.255107, -4.201786, -2, 0, -0.5, 0.5, 0.5,
-3.255107, -4.201786, -2, 1, -0.5, 0.5, 0.5,
-3.255107, -4.201786, -2, 1, 1.5, 0.5, 0.5,
-3.255107, -4.201786, -2, 0, 1.5, 0.5, 0.5,
-3.255107, -4.201786, 0, 0, -0.5, 0.5, 0.5,
-3.255107, -4.201786, 0, 1, -0.5, 0.5, 0.5,
-3.255107, -4.201786, 0, 1, 1.5, 0.5, 0.5,
-3.255107, -4.201786, 0, 0, 1.5, 0.5, 0.5,
-3.255107, -4.201786, 2, 0, -0.5, 0.5, 0.5,
-3.255107, -4.201786, 2, 1, -0.5, 0.5, 0.5,
-3.255107, -4.201786, 2, 1, 1.5, 0.5, 0.5,
-3.255107, -4.201786, 2, 0, 1.5, 0.5, 0.5,
-3.255107, -4.201786, 4, 0, -0.5, 0.5, 0.5,
-3.255107, -4.201786, 4, 1, -0.5, 0.5, 0.5,
-3.255107, -4.201786, 4, 1, 1.5, 0.5, 0.5,
-3.255107, -4.201786, 4, 0, 1.5, 0.5, 0.5,
-3.255107, -4.201786, 6, 0, -0.5, 0.5, 0.5,
-3.255107, -4.201786, 6, 1, -0.5, 0.5, 0.5,
-3.255107, -4.201786, 6, 1, 1.5, 0.5, 0.5,
-3.255107, -4.201786, 6, 0, 1.5, 0.5, 0.5
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
-2.756359, -3.69427, -5.283421,
-2.756359, 3.072606, -5.283421,
-2.756359, -3.69427, 6.334149,
-2.756359, 3.072606, 6.334149,
-2.756359, -3.69427, -5.283421,
-2.756359, -3.69427, 6.334149,
-2.756359, 3.072606, -5.283421,
-2.756359, 3.072606, 6.334149,
-2.756359, -3.69427, -5.283421,
3.893607, -3.69427, -5.283421,
-2.756359, -3.69427, 6.334149,
3.893607, -3.69427, 6.334149,
-2.756359, 3.072606, -5.283421,
3.893607, 3.072606, -5.283421,
-2.756359, 3.072606, 6.334149,
3.893607, 3.072606, 6.334149,
3.893607, -3.69427, -5.283421,
3.893607, 3.072606, -5.283421,
3.893607, -3.69427, 6.334149,
3.893607, 3.072606, 6.334149,
3.893607, -3.69427, -5.283421,
3.893607, -3.69427, 6.334149,
3.893607, 3.072606, -5.283421,
3.893607, 3.072606, 6.334149
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
var radius = 8.009363;
var distance = 35.63456;
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
mvMatrix.translate( -0.5686237, 0.3108323, -0.5253642 );
mvMatrix.scale( 1.302244, 1.279746, 0.7454123 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.63456);
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
InChI_1S_C17H15ClFNO<-read.table("InChI_1S_C17H15ClFNO.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C17H15ClFNO$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C17H15ClFNO' not found
```

```r
y<-InChI_1S_C17H15ClFNO$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C17H15ClFNO' not found
```

```r
z<-InChI_1S_C17H15ClFNO$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C17H15ClFNO' not found
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
-2.659515, 0.7953973, -0.963562, 0, 0, 1, 1, 1,
-2.532696, 0.4548697, -2.896728, 1, 0, 0, 1, 1,
-2.458603, -0.8454884, -1.953859, 1, 0, 0, 1, 1,
-2.191625, -0.7862158, -3.50699, 1, 0, 0, 1, 1,
-2.168579, 0.6969621, -2.402132, 1, 0, 0, 1, 1,
-2.105374, -0.7137108, -1.898803, 1, 0, 0, 1, 1,
-2.09234, -1.382857, -0.1560657, 0, 0, 0, 1, 1,
-2.041379, -0.942211, -1.152876, 0, 0, 0, 1, 1,
-2.033283, 0.8752114, 0.2575391, 0, 0, 0, 1, 1,
-2.033006, 1.631817, 0.3937528, 0, 0, 0, 1, 1,
-2.026658, 0.792447, -1.806535, 0, 0, 0, 1, 1,
-2.021907, 0.3540467, 0.4937441, 0, 0, 0, 1, 1,
-2.016914, 1.382696, -1.578819, 0, 0, 0, 1, 1,
-2.007147, -0.3866608, -1.871202, 1, 1, 1, 1, 1,
-2.00106, 0.5891697, -1.649348, 1, 1, 1, 1, 1,
-1.999109, 1.960322, -1.541695, 1, 1, 1, 1, 1,
-1.969618, 2.71972, -2.437977, 1, 1, 1, 1, 1,
-1.946848, 0.410677, -1.052166, 1, 1, 1, 1, 1,
-1.942051, 0.6469619, -1.115042, 1, 1, 1, 1, 1,
-1.937713, -1.860934, -1.66806, 1, 1, 1, 1, 1,
-1.921099, 0.6151424, -0.09657177, 1, 1, 1, 1, 1,
-1.910765, 0.6415972, -1.982296, 1, 1, 1, 1, 1,
-1.895182, 0.3922502, -1.785449, 1, 1, 1, 1, 1,
-1.869833, 0.1569341, -1.550751, 1, 1, 1, 1, 1,
-1.863794, 0.1227319, -3.609145, 1, 1, 1, 1, 1,
-1.860895, 0.1982549, -0.6270418, 1, 1, 1, 1, 1,
-1.859577, 0.8632365, -1.648184, 1, 1, 1, 1, 1,
-1.853284, 0.1095042, -1.44846, 1, 1, 1, 1, 1,
-1.841703, -0.1356232, 0.511618, 0, 0, 1, 1, 1,
-1.827941, 1.035911, -2.674042, 1, 0, 0, 1, 1,
-1.818367, 0.7909362, -1.523087, 1, 0, 0, 1, 1,
-1.809633, 0.6355338, -0.9576015, 1, 0, 0, 1, 1,
-1.79429, -0.1192734, -1.347782, 1, 0, 0, 1, 1,
-1.789384, 0.4290661, -0.8048751, 1, 0, 0, 1, 1,
-1.784105, -0.6926185, 0.3738707, 0, 0, 0, 1, 1,
-1.773585, -0.7837753, -1.411458, 0, 0, 0, 1, 1,
-1.772764, -0.4525445, -2.451966, 0, 0, 0, 1, 1,
-1.764989, -0.3550368, -1.380034, 0, 0, 0, 1, 1,
-1.761992, -0.6221364, -1.133894, 0, 0, 0, 1, 1,
-1.761178, -2.070519, -1.676911, 0, 0, 0, 1, 1,
-1.757977, -0.8694961, -0.718939, 0, 0, 0, 1, 1,
-1.747726, -0.8161582, -1.08494, 1, 1, 1, 1, 1,
-1.741459, -0.6455679, -0.9789796, 1, 1, 1, 1, 1,
-1.740173, -0.1967745, -0.09082123, 1, 1, 1, 1, 1,
-1.729967, 1.05612, -0.6795799, 1, 1, 1, 1, 1,
-1.717599, -0.3823234, -1.20344, 1, 1, 1, 1, 1,
-1.694079, -0.08753645, -1.470526, 1, 1, 1, 1, 1,
-1.689739, -0.2411849, -0.7679161, 1, 1, 1, 1, 1,
-1.680644, -1.43091, -2.041538, 1, 1, 1, 1, 1,
-1.667976, -0.05240529, -2.512167, 1, 1, 1, 1, 1,
-1.638422, 0.903216, -1.478493, 1, 1, 1, 1, 1,
-1.60843, 0.8732943, -1.472111, 1, 1, 1, 1, 1,
-1.607038, -0.9865317, -2.376171, 1, 1, 1, 1, 1,
-1.599804, -1.528358, -2.505717, 1, 1, 1, 1, 1,
-1.571806, 0.8409871, -1.928379, 1, 1, 1, 1, 1,
-1.561634, -0.7071208, -0.4997666, 1, 1, 1, 1, 1,
-1.558605, 1.198199, -1.444098, 0, 0, 1, 1, 1,
-1.556152, 1.13907, -0.4394009, 1, 0, 0, 1, 1,
-1.541232, 1.300877, 0.2357362, 1, 0, 0, 1, 1,
-1.538036, 0.5789139, -1.227184, 1, 0, 0, 1, 1,
-1.53387, -0.5887869, -3.128314, 1, 0, 0, 1, 1,
-1.515869, -0.6239066, -2.190538, 1, 0, 0, 1, 1,
-1.513791, 0.1501164, 0.1026458, 0, 0, 0, 1, 1,
-1.502224, -0.1228783, -1.31519, 0, 0, 0, 1, 1,
-1.481707, -0.9515813, -2.158304, 0, 0, 0, 1, 1,
-1.46673, -0.07950591, -1.547477, 0, 0, 0, 1, 1,
-1.464244, -0.4882878, -2.719328, 0, 0, 0, 1, 1,
-1.4523, 0.1282534, -2.542071, 0, 0, 0, 1, 1,
-1.440503, 1.688882, -0.03352645, 0, 0, 0, 1, 1,
-1.412647, 0.7998746, -1.609482, 1, 1, 1, 1, 1,
-1.4069, -1.650686, -3.003402, 1, 1, 1, 1, 1,
-1.400887, 1.340071, 1.121475, 1, 1, 1, 1, 1,
-1.385605, 1.344894, -1.065578, 1, 1, 1, 1, 1,
-1.380601, -0.3150941, -1.642441, 1, 1, 1, 1, 1,
-1.380213, -0.279951, -0.952961, 1, 1, 1, 1, 1,
-1.378393, 0.2692891, -1.853289, 1, 1, 1, 1, 1,
-1.35932, 1.187528, -1.212278, 1, 1, 1, 1, 1,
-1.357851, -0.5828562, -1.810484, 1, 1, 1, 1, 1,
-1.356665, -1.252148, -2.020311, 1, 1, 1, 1, 1,
-1.345555, 1.489206, -0.7775169, 1, 1, 1, 1, 1,
-1.33814, 0.5329706, -1.493846, 1, 1, 1, 1, 1,
-1.328852, 0.07902346, 0.05916536, 1, 1, 1, 1, 1,
-1.327908, -0.2544056, -2.448287, 1, 1, 1, 1, 1,
-1.326749, -0.6818848, -1.909233, 1, 1, 1, 1, 1,
-1.300557, -0.0815178, -0.4282408, 0, 0, 1, 1, 1,
-1.300163, -0.3084319, -0.5229419, 1, 0, 0, 1, 1,
-1.279854, -0.7585052, -1.478922, 1, 0, 0, 1, 1,
-1.279639, 1.556271, -0.7601001, 1, 0, 0, 1, 1,
-1.272619, -0.074318, -1.236963, 1, 0, 0, 1, 1,
-1.261117, 0.7239151, -2.011527, 1, 0, 0, 1, 1,
-1.256668, 0.3500443, -0.4196039, 0, 0, 0, 1, 1,
-1.254156, -0.3529738, -0.5320198, 0, 0, 0, 1, 1,
-1.248996, 0.4924201, -0.4355389, 0, 0, 0, 1, 1,
-1.246181, -0.1416729, -2.608656, 0, 0, 0, 1, 1,
-1.231148, 0.6249088, -0.3924459, 0, 0, 0, 1, 1,
-1.223408, -0.5490763, -1.729023, 0, 0, 0, 1, 1,
-1.223143, -0.3671129, -2.220222, 0, 0, 0, 1, 1,
-1.217283, 0.9513689, -0.7704194, 1, 1, 1, 1, 1,
-1.213783, 0.7241212, 0.7289477, 1, 1, 1, 1, 1,
-1.200769, 1.555993, -1.502926, 1, 1, 1, 1, 1,
-1.194342, -1.453679, -2.92359, 1, 1, 1, 1, 1,
-1.184805, 0.944484, 0.2838829, 1, 1, 1, 1, 1,
-1.182665, -0.7559806, -1.974118, 1, 1, 1, 1, 1,
-1.182253, -0.6615845, -3.02787, 1, 1, 1, 1, 1,
-1.179633, -0.294991, -2.160894, 1, 1, 1, 1, 1,
-1.171442, 1.071137, 0.6912559, 1, 1, 1, 1, 1,
-1.16555, -0.640588, -2.230372, 1, 1, 1, 1, 1,
-1.15686, 0.8982481, -0.1606473, 1, 1, 1, 1, 1,
-1.156679, -0.3101063, -0.6173136, 1, 1, 1, 1, 1,
-1.156336, -0.3885303, -1.292648, 1, 1, 1, 1, 1,
-1.152079, -0.3983069, -3.449491, 1, 1, 1, 1, 1,
-1.144452, 1.264338, -2.163722, 1, 1, 1, 1, 1,
-1.144317, -0.9454197, -1.526442, 0, 0, 1, 1, 1,
-1.141006, 0.4740206, -0.8038558, 1, 0, 0, 1, 1,
-1.138939, 1.3682, -1.090313, 1, 0, 0, 1, 1,
-1.128423, 0.8234715, -1.184976, 1, 0, 0, 1, 1,
-1.121656, 0.9150147, 0.6753412, 1, 0, 0, 1, 1,
-1.119846, -0.3556646, -4.121968, 1, 0, 0, 1, 1,
-1.116177, 0.8805875, -1.808122, 0, 0, 0, 1, 1,
-1.104537, -1.450014, -1.16397, 0, 0, 0, 1, 1,
-1.097957, 0.5730328, -2.507304, 0, 0, 0, 1, 1,
-1.094738, 1.459728, -0.3749527, 0, 0, 0, 1, 1,
-1.091986, -1.285505, -2.926479, 0, 0, 0, 1, 1,
-1.090326, -1.365677, -2.432184, 0, 0, 0, 1, 1,
-1.078896, 1.43813, 0.03724403, 0, 0, 0, 1, 1,
-1.078254, 1.17002, -1.32926, 1, 1, 1, 1, 1,
-1.061288, -1.360757, -3.494854, 1, 1, 1, 1, 1,
-1.051573, -0.007630449, -3.981014, 1, 1, 1, 1, 1,
-1.041605, -0.9186733, -1.009661, 1, 1, 1, 1, 1,
-1.04076, 0.2667274, -1.408775, 1, 1, 1, 1, 1,
-1.03684, 1.536427, 0.06039852, 1, 1, 1, 1, 1,
-1.027436, 0.5583652, -0.9481075, 1, 1, 1, 1, 1,
-1.012371, -0.8412954, -2.662637, 1, 1, 1, 1, 1,
-1.009027, -0.5554106, -1.615639, 1, 1, 1, 1, 1,
-1.007383, 0.1257713, -0.5148513, 1, 1, 1, 1, 1,
-1.002533, -1.320494, -2.560532, 1, 1, 1, 1, 1,
-0.9962857, -0.1948235, -2.227177, 1, 1, 1, 1, 1,
-0.9927315, -0.02266126, -0.3925552, 1, 1, 1, 1, 1,
-0.9874451, -0.5510184, -2.507831, 1, 1, 1, 1, 1,
-0.9818961, -1.18495, -2.923537, 1, 1, 1, 1, 1,
-0.9738743, -2.083762, -0.1499345, 0, 0, 1, 1, 1,
-0.9700976, 0.9228864, -0.1563739, 1, 0, 0, 1, 1,
-0.9538534, 0.8594865, 0.5282861, 1, 0, 0, 1, 1,
-0.9521362, 0.4632174, -1.350451, 1, 0, 0, 1, 1,
-0.9513946, 0.7119248, 1.766079, 1, 0, 0, 1, 1,
-0.9429997, -0.2128371, -2.637792, 1, 0, 0, 1, 1,
-0.9416569, 0.02002918, -1.942998, 0, 0, 0, 1, 1,
-0.9293492, 0.02273328, -0.6690839, 0, 0, 0, 1, 1,
-0.9253599, -0.2299593, -0.3493089, 0, 0, 0, 1, 1,
-0.9168987, -0.3387557, -0.9935454, 0, 0, 0, 1, 1,
-0.9140257, -0.6205031, -1.845919, 0, 0, 0, 1, 1,
-0.9115601, -0.2188425, -4.042663, 0, 0, 0, 1, 1,
-0.9093601, 0.9332363, -2.838165, 0, 0, 0, 1, 1,
-0.9058362, -0.192523, -1.203175, 1, 1, 1, 1, 1,
-0.9030068, 0.6998343, -1.166047, 1, 1, 1, 1, 1,
-0.9000303, 0.05280102, -2.230422, 1, 1, 1, 1, 1,
-0.8989252, -1.732518, -3.315465, 1, 1, 1, 1, 1,
-0.8978681, 0.1014714, -0.8641362, 1, 1, 1, 1, 1,
-0.8946006, -1.060909, -2.229337, 1, 1, 1, 1, 1,
-0.8940293, -1.667987, -2.669863, 1, 1, 1, 1, 1,
-0.8891394, -0.9368867, -4.736772, 1, 1, 1, 1, 1,
-0.8876394, 0.5458741, -1.397742, 1, 1, 1, 1, 1,
-0.8858825, 0.7710207, -3.074609, 1, 1, 1, 1, 1,
-0.8811458, -1.483162, -1.788746, 1, 1, 1, 1, 1,
-0.8810235, -0.4511539, -1.595207, 1, 1, 1, 1, 1,
-0.8784555, -0.2395186, -2.448619, 1, 1, 1, 1, 1,
-0.8768153, 0.5386274, -0.8697091, 1, 1, 1, 1, 1,
-0.872528, -0.1203687, -2.581989, 1, 1, 1, 1, 1,
-0.870079, 1.046159, -1.099993, 0, 0, 1, 1, 1,
-0.8695379, 0.3374172, -1.730633, 1, 0, 0, 1, 1,
-0.8693786, 0.7275665, 0.2257709, 1, 0, 0, 1, 1,
-0.8680945, -1.596567, -2.797537, 1, 0, 0, 1, 1,
-0.865903, 1.622988, -0.4417853, 1, 0, 0, 1, 1,
-0.8642113, -0.9918684, -4.358235, 1, 0, 0, 1, 1,
-0.8626975, 0.3061885, -1.257003, 0, 0, 0, 1, 1,
-0.8624092, -0.3199131, -1.902837, 0, 0, 0, 1, 1,
-0.8615674, 1.898156, -0.2567299, 0, 0, 0, 1, 1,
-0.8604503, -0.006208359, -0.3232034, 0, 0, 0, 1, 1,
-0.8558191, -0.9152796, -1.662113, 0, 0, 0, 1, 1,
-0.855206, 0.2082653, -1.905123, 0, 0, 0, 1, 1,
-0.8551129, 0.6777751, -1.868037, 0, 0, 0, 1, 1,
-0.852277, 0.4613818, -2.607752, 1, 1, 1, 1, 1,
-0.8512515, -1.070937, -4.411166, 1, 1, 1, 1, 1,
-0.8457378, -0.2287522, -3.440762, 1, 1, 1, 1, 1,
-0.8444934, 0.5324672, -0.3250486, 1, 1, 1, 1, 1,
-0.8440132, -0.534974, -1.884471, 1, 1, 1, 1, 1,
-0.8416859, 0.2441372, -1.907476, 1, 1, 1, 1, 1,
-0.8407177, -0.5942026, -0.8064127, 1, 1, 1, 1, 1,
-0.8404652, 0.2795413, -1.167919, 1, 1, 1, 1, 1,
-0.8374984, 1.245862, 0.03840925, 1, 1, 1, 1, 1,
-0.8367607, 0.09781268, -1.827512, 1, 1, 1, 1, 1,
-0.8364615, -1.411553, -3.165434, 1, 1, 1, 1, 1,
-0.8363888, 0.7647368, -1.622412, 1, 1, 1, 1, 1,
-0.834702, 1.391293, 0.3348209, 1, 1, 1, 1, 1,
-0.8344455, 1.4037, -1.889489, 1, 1, 1, 1, 1,
-0.8293564, -1.115553, -2.571098, 1, 1, 1, 1, 1,
-0.827247, 0.2195309, -0.940651, 0, 0, 1, 1, 1,
-0.8260633, -0.5221811, -3.806358, 1, 0, 0, 1, 1,
-0.8238533, -0.3552201, -1.651743, 1, 0, 0, 1, 1,
-0.8217422, -0.4574691, -1.241976, 1, 0, 0, 1, 1,
-0.817826, 1.986292, -0.6446293, 1, 0, 0, 1, 1,
-0.8153993, 0.547196, -0.2633897, 1, 0, 0, 1, 1,
-0.8138933, -0.1831616, -1.632296, 0, 0, 0, 1, 1,
-0.8127355, 0.5088142, -1.596979, 0, 0, 0, 1, 1,
-0.8117632, 0.6854093, -1.399292, 0, 0, 0, 1, 1,
-0.801755, 0.1749928, -2.350687, 0, 0, 0, 1, 1,
-0.8016092, -0.1414873, -2.114762, 0, 0, 0, 1, 1,
-0.8012637, -1.609787, -1.830493, 0, 0, 0, 1, 1,
-0.8000556, -0.823688, -2.681615, 0, 0, 0, 1, 1,
-0.7974421, -0.7089078, -2.101729, 1, 1, 1, 1, 1,
-0.7857351, -1.358726, -2.293536, 1, 1, 1, 1, 1,
-0.7846171, 1.001213, -1.133046, 1, 1, 1, 1, 1,
-0.7821724, -1.234699, -0.3378, 1, 1, 1, 1, 1,
-0.7816024, 0.6737269, -0.7533788, 1, 1, 1, 1, 1,
-0.7802958, -0.4170293, -2.106663, 1, 1, 1, 1, 1,
-0.7724448, 0.349404, -1.649833, 1, 1, 1, 1, 1,
-0.7536568, -0.04551755, -1.819881, 1, 1, 1, 1, 1,
-0.750035, 0.540195, -2.002596, 1, 1, 1, 1, 1,
-0.7463425, -0.106245, -1.517047, 1, 1, 1, 1, 1,
-0.7452334, 1.548587, 0.8950006, 1, 1, 1, 1, 1,
-0.7431055, -0.7104471, -0.6800124, 1, 1, 1, 1, 1,
-0.739553, 0.3057353, -1.230994, 1, 1, 1, 1, 1,
-0.7324734, -1.163962, -1.097898, 1, 1, 1, 1, 1,
-0.7324001, 0.632907, -1.940339, 1, 1, 1, 1, 1,
-0.7263683, 1.469084, -0.4930458, 0, 0, 1, 1, 1,
-0.7262082, -2.947962, -2.667098, 1, 0, 0, 1, 1,
-0.7258104, 1.751368, -0.1850238, 1, 0, 0, 1, 1,
-0.7218738, -0.4667043, -2.244722, 1, 0, 0, 1, 1,
-0.7210259, 1.008369, -2.719486, 1, 0, 0, 1, 1,
-0.7205899, -0.3370888, -2.213305, 1, 0, 0, 1, 1,
-0.7188615, 0.451535, -2.865906, 0, 0, 0, 1, 1,
-0.7127396, 1.10957, -0.7753243, 0, 0, 0, 1, 1,
-0.7093346, 0.4460252, -0.47797, 0, 0, 0, 1, 1,
-0.7051108, -0.3003935, -2.12611, 0, 0, 0, 1, 1,
-0.7021166, -0.6216173, -1.349639, 0, 0, 0, 1, 1,
-0.7020634, -0.6210972, -0.5213799, 0, 0, 0, 1, 1,
-0.7004284, -0.4355849, -2.561089, 0, 0, 0, 1, 1,
-0.6984324, -0.6829385, -2.421276, 1, 1, 1, 1, 1,
-0.6968678, 0.07574604, -1.959453, 1, 1, 1, 1, 1,
-0.6941952, 0.238583, -1.110371, 1, 1, 1, 1, 1,
-0.6922948, -0.2611027, -1.52765, 1, 1, 1, 1, 1,
-0.6911362, -0.9613815, -3.173964, 1, 1, 1, 1, 1,
-0.6896991, 2.137962, -0.3367576, 1, 1, 1, 1, 1,
-0.6882021, 0.3608005, 1.456759, 1, 1, 1, 1, 1,
-0.6856139, 0.01655586, -1.734589, 1, 1, 1, 1, 1,
-0.6850429, 0.6714464, -0.8884772, 1, 1, 1, 1, 1,
-0.6840422, -0.8004426, -2.887329, 1, 1, 1, 1, 1,
-0.682898, 0.587314, -1.672365, 1, 1, 1, 1, 1,
-0.6827498, -0.5819371, -2.37789, 1, 1, 1, 1, 1,
-0.6821032, -0.4943297, -1.492754, 1, 1, 1, 1, 1,
-0.6818367, -0.6485493, -2.017612, 1, 1, 1, 1, 1,
-0.6762186, -0.2028786, -1.403277, 1, 1, 1, 1, 1,
-0.6663424, 0.1760583, -1.586359, 0, 0, 1, 1, 1,
-0.6641212, 0.8547276, 0.7905654, 1, 0, 0, 1, 1,
-0.6456916, 0.3549788, -0.1176805, 1, 0, 0, 1, 1,
-0.644486, -0.8962755, -2.972214, 1, 0, 0, 1, 1,
-0.6425055, -1.394402, -3.151655, 1, 0, 0, 1, 1,
-0.6409491, -0.4888021, -2.09179, 1, 0, 0, 1, 1,
-0.6387244, -0.4654258, -2.587897, 0, 0, 0, 1, 1,
-0.6374023, 0.808253, -2.998714, 0, 0, 0, 1, 1,
-0.6364353, -0.1964021, -1.036756, 0, 0, 0, 1, 1,
-0.635667, -1.533456, -3.879858, 0, 0, 0, 1, 1,
-0.6338947, -0.1075077, -1.796246, 0, 0, 0, 1, 1,
-0.6312511, -0.1812012, -3.665264, 0, 0, 0, 1, 1,
-0.6284345, -0.9808454, -3.343393, 0, 0, 0, 1, 1,
-0.6233316, 1.027558, -1.071888, 1, 1, 1, 1, 1,
-0.6219888, 0.8605765, 0.2875926, 1, 1, 1, 1, 1,
-0.6212009, -0.1182295, -0.9866251, 1, 1, 1, 1, 1,
-0.6193224, -0.6118099, -2.506153, 1, 1, 1, 1, 1,
-0.6180609, 2.032528, -1.267288, 1, 1, 1, 1, 1,
-0.6159195, 0.3939482, -0.002588339, 1, 1, 1, 1, 1,
-0.6059732, -0.540765, -2.704966, 1, 1, 1, 1, 1,
-0.6046582, -1.17906, -2.114877, 1, 1, 1, 1, 1,
-0.592123, -0.6034951, -2.386781, 1, 1, 1, 1, 1,
-0.5837192, -1.649993, -3.217746, 1, 1, 1, 1, 1,
-0.5812587, 0.6464111, -1.772289, 1, 1, 1, 1, 1,
-0.58032, 1.300634, -0.6900502, 1, 1, 1, 1, 1,
-0.5740244, -0.3466196, -3.029172, 1, 1, 1, 1, 1,
-0.5710814, 0.765615, -0.6508485, 1, 1, 1, 1, 1,
-0.5708401, -0.8183216, -1.823408, 1, 1, 1, 1, 1,
-0.5657463, 1.199425, 0.8536803, 0, 0, 1, 1, 1,
-0.5638555, 0.2292099, -0.9303713, 1, 0, 0, 1, 1,
-0.5630259, 0.08008447, -2.812264, 1, 0, 0, 1, 1,
-0.5615031, 0.6171888, -2.050984, 1, 0, 0, 1, 1,
-0.5602703, 0.4176321, -0.4267829, 1, 0, 0, 1, 1,
-0.5569629, -0.6502997, -2.604443, 1, 0, 0, 1, 1,
-0.5550964, 0.3037398, -0.7829573, 0, 0, 0, 1, 1,
-0.5487094, 0.07842246, -0.7968501, 0, 0, 0, 1, 1,
-0.5436617, 0.3592201, -2.155444, 0, 0, 0, 1, 1,
-0.5406206, 0.4668148, -0.1203812, 0, 0, 0, 1, 1,
-0.5387836, -0.7190828, -4.357326, 0, 0, 0, 1, 1,
-0.536631, -0.6761665, -4.069684, 0, 0, 0, 1, 1,
-0.5352684, -1.030772, -1.133485, 0, 0, 0, 1, 1,
-0.5349917, 0.1558985, -2.005482, 1, 1, 1, 1, 1,
-0.5302165, -0.1900741, -1.402731, 1, 1, 1, 1, 1,
-0.5271333, -2.015442, -2.277435, 1, 1, 1, 1, 1,
-0.5263996, -1.401338, -1.71597, 1, 1, 1, 1, 1,
-0.5242071, 0.6200772, -2.057023, 1, 1, 1, 1, 1,
-0.5234784, -0.950337, -4.035863, 1, 1, 1, 1, 1,
-0.5221706, 0.5080636, -2.10293, 1, 1, 1, 1, 1,
-0.5220824, 0.2539027, -1.22086, 1, 1, 1, 1, 1,
-0.5206103, 1.478197, 0.1559871, 1, 1, 1, 1, 1,
-0.509305, 0.486055, -0.8790141, 1, 1, 1, 1, 1,
-0.5036706, 1.639811, -0.1210198, 1, 1, 1, 1, 1,
-0.5010399, -0.180096, -1.284386, 1, 1, 1, 1, 1,
-0.4934237, -0.4288749, -2.862137, 1, 1, 1, 1, 1,
-0.4923358, 0.2795276, -1.813073, 1, 1, 1, 1, 1,
-0.491508, 0.004457044, -2.202234, 1, 1, 1, 1, 1,
-0.4894733, -1.255602, -3.182192, 0, 0, 1, 1, 1,
-0.4842195, -0.7344238, -4.179894, 1, 0, 0, 1, 1,
-0.4830742, -2.072061, -2.287318, 1, 0, 0, 1, 1,
-0.4751492, 0.2484416, -2.286195, 1, 0, 0, 1, 1,
-0.4717731, 0.6944514, -0.7555659, 1, 0, 0, 1, 1,
-0.4670737, 1.098571, 0.2090784, 1, 0, 0, 1, 1,
-0.4633991, 0.9734188, -0.5911595, 0, 0, 0, 1, 1,
-0.459482, 0.4169469, -0.6856293, 0, 0, 0, 1, 1,
-0.4566843, 0.6393381, 0.1900743, 0, 0, 0, 1, 1,
-0.4546125, 1.492898, 0.1284992, 0, 0, 0, 1, 1,
-0.4540292, 0.5723593, -0.7677849, 0, 0, 0, 1, 1,
-0.4516392, -0.1745774, -1.182625, 0, 0, 0, 1, 1,
-0.4485831, -0.2607127, -2.708497, 0, 0, 0, 1, 1,
-0.4460817, -0.5011715, -2.958963, 1, 1, 1, 1, 1,
-0.4459665, 1.154871, 0.5096626, 1, 1, 1, 1, 1,
-0.4455388, 0.4927293, -1.384609, 1, 1, 1, 1, 1,
-0.4454294, -0.4561328, -3.142363, 1, 1, 1, 1, 1,
-0.4433765, 0.5377288, 0.736275, 1, 1, 1, 1, 1,
-0.4432539, -1.332164, -4.386008, 1, 1, 1, 1, 1,
-0.4408576, -1.74396, -1.545488, 1, 1, 1, 1, 1,
-0.4400359, -1.348819, -3.549855, 1, 1, 1, 1, 1,
-0.4343629, 0.6946603, -0.3003027, 1, 1, 1, 1, 1,
-0.4335742, 0.0639329, -0.2182301, 1, 1, 1, 1, 1,
-0.4335708, -0.2631952, -2.505793, 1, 1, 1, 1, 1,
-0.4323434, -0.08522839, -1.009965, 1, 1, 1, 1, 1,
-0.4308794, -0.2726145, -1.59407, 1, 1, 1, 1, 1,
-0.4246765, 1.331246, 0.2875403, 1, 1, 1, 1, 1,
-0.4237384, 0.1478204, 0.04259544, 1, 1, 1, 1, 1,
-0.4235103, -0.04617095, -0.4849122, 0, 0, 1, 1, 1,
-0.4173677, -0.03650956, -2.762806, 1, 0, 0, 1, 1,
-0.4171596, -0.8716682, -3.987437, 1, 0, 0, 1, 1,
-0.4151769, 0.3605542, -1.491933, 1, 0, 0, 1, 1,
-0.4068108, -0.8709256, -2.644059, 1, 0, 0, 1, 1,
-0.4050064, -1.076078, -3.358959, 1, 0, 0, 1, 1,
-0.4004309, 1.233325, -1.139023, 0, 0, 0, 1, 1,
-0.3974502, 0.2342492, -0.6426306, 0, 0, 0, 1, 1,
-0.3967692, 1.023865, -2.172056, 0, 0, 0, 1, 1,
-0.3962899, 0.1677906, -0.8772509, 0, 0, 0, 1, 1,
-0.3920536, -0.4456239, -2.179681, 0, 0, 0, 1, 1,
-0.3902535, 0.09428169, -2.693339, 0, 0, 0, 1, 1,
-0.3878949, 0.09521261, -2.829149, 0, 0, 0, 1, 1,
-0.3864435, 0.4323444, -0.4601236, 1, 1, 1, 1, 1,
-0.3838607, -1.075231, -2.369241, 1, 1, 1, 1, 1,
-0.3831223, 0.5571826, 2.037339, 1, 1, 1, 1, 1,
-0.3821754, 0.3073778, -0.6975311, 1, 1, 1, 1, 1,
-0.3820906, -0.2206916, -3.204622, 1, 1, 1, 1, 1,
-0.3815299, 0.6236151, -1.71368, 1, 1, 1, 1, 1,
-0.3814496, 0.08495004, -1.250174, 1, 1, 1, 1, 1,
-0.3751654, 1.810155, -0.09705171, 1, 1, 1, 1, 1,
-0.3735859, 1.495789, -0.222654, 1, 1, 1, 1, 1,
-0.3724448, -1.346965, -3.900815, 1, 1, 1, 1, 1,
-0.3711286, 0.3065015, 0.5602564, 1, 1, 1, 1, 1,
-0.3709711, -0.7207652, -2.874537, 1, 1, 1, 1, 1,
-0.3490226, -0.5641899, -1.903815, 1, 1, 1, 1, 1,
-0.3433841, 1.269585, -0.2489474, 1, 1, 1, 1, 1,
-0.342486, -1.700354, -1.333879, 1, 1, 1, 1, 1,
-0.3415326, -0.3933645, -5.114233, 0, 0, 1, 1, 1,
-0.3405181, -0.6224649, -2.482595, 1, 0, 0, 1, 1,
-0.337712, -0.5050372, -1.827895, 1, 0, 0, 1, 1,
-0.3347448, -1.969322, -2.143915, 1, 0, 0, 1, 1,
-0.3337869, -1.471914, -3.028707, 1, 0, 0, 1, 1,
-0.3293347, 1.68473, 1.347986, 1, 0, 0, 1, 1,
-0.3287103, 1.992331, -1.010417, 0, 0, 0, 1, 1,
-0.3275824, 0.06654146, -2.063036, 0, 0, 0, 1, 1,
-0.3255018, -0.9572711, -1.930014, 0, 0, 0, 1, 1,
-0.3250283, -0.03923192, -0.7273744, 0, 0, 0, 1, 1,
-0.324196, 0.3505883, -0.08237114, 0, 0, 0, 1, 1,
-0.323794, 0.3453819, -0.2393975, 0, 0, 0, 1, 1,
-0.3217522, 0.4660806, -0.7270103, 0, 0, 0, 1, 1,
-0.3202593, 0.4866244, -0.2000605, 1, 1, 1, 1, 1,
-0.3200454, -0.4254541, -3.601715, 1, 1, 1, 1, 1,
-0.3178362, -0.4738074, -1.327108, 1, 1, 1, 1, 1,
-0.3151336, -0.1626449, -1.520862, 1, 1, 1, 1, 1,
-0.3130578, 0.2529457, -1.947242, 1, 1, 1, 1, 1,
-0.3116524, -0.7244466, -2.447598, 1, 1, 1, 1, 1,
-0.305946, -0.2522728, -1.438169, 1, 1, 1, 1, 1,
-0.3055637, 2.16331, -0.0438058, 1, 1, 1, 1, 1,
-0.2951974, -1.193918, -2.973419, 1, 1, 1, 1, 1,
-0.294962, 1.397351, -1.175099, 1, 1, 1, 1, 1,
-0.2929186, -0.426189, -3.201526, 1, 1, 1, 1, 1,
-0.2912626, -0.3921938, -3.093099, 1, 1, 1, 1, 1,
-0.2888115, 0.408598, -1.906564, 1, 1, 1, 1, 1,
-0.2885156, 1.262434, -1.233692, 1, 1, 1, 1, 1,
-0.2879255, 0.8262992, -1.453057, 1, 1, 1, 1, 1,
-0.2859188, -0.06853155, -2.78842, 0, 0, 1, 1, 1,
-0.2763575, 2.85315, 0.5128839, 1, 0, 0, 1, 1,
-0.2750908, -1.573094, -2.471848, 1, 0, 0, 1, 1,
-0.2688837, 0.7026035, -0.6119792, 1, 0, 0, 1, 1,
-0.2662781, -0.09643599, -1.226504, 1, 0, 0, 1, 1,
-0.2636825, -1.096263, -3.716982, 1, 0, 0, 1, 1,
-0.2598418, -0.302907, -3.082819, 0, 0, 0, 1, 1,
-0.2551049, 0.649247, -1.444485, 0, 0, 0, 1, 1,
-0.2548493, 0.31262, -1.314622, 0, 0, 0, 1, 1,
-0.2518222, -1.173856, -3.641651, 0, 0, 0, 1, 1,
-0.2499208, -0.1969189, -0.8189735, 0, 0, 0, 1, 1,
-0.2495328, -1.195475, -3.470958, 0, 0, 0, 1, 1,
-0.2475249, -0.1821973, -3.02853, 0, 0, 0, 1, 1,
-0.2453767, 0.02287577, -1.610819, 1, 1, 1, 1, 1,
-0.2433775, -0.06502457, -2.263884, 1, 1, 1, 1, 1,
-0.2412307, 0.6720961, -0.9297034, 1, 1, 1, 1, 1,
-0.2409443, 1.699968, 0.3830693, 1, 1, 1, 1, 1,
-0.2396814, -1.367011, -3.11308, 1, 1, 1, 1, 1,
-0.2364446, -1.186085, -3.374799, 1, 1, 1, 1, 1,
-0.2331921, -1.233704, -3.900962, 1, 1, 1, 1, 1,
-0.2274811, -0.5377669, -1.424906, 1, 1, 1, 1, 1,
-0.2212167, 0.3667157, -1.32293, 1, 1, 1, 1, 1,
-0.2203593, -0.4618873, -1.739655, 1, 1, 1, 1, 1,
-0.2167562, -0.743174, -2.480883, 1, 1, 1, 1, 1,
-0.2088114, -0.7104763, -0.6525522, 1, 1, 1, 1, 1,
-0.2031694, -1.548213, -4.018782, 1, 1, 1, 1, 1,
-0.2018977, 0.5224358, -0.1858714, 1, 1, 1, 1, 1,
-0.2011551, -0.2100716, -1.744772, 1, 1, 1, 1, 1,
-0.2004331, 0.4623859, -0.626011, 0, 0, 1, 1, 1,
-0.1999823, 0.4594437, 1.073973, 1, 0, 0, 1, 1,
-0.1979293, 1.48592, -0.7854444, 1, 0, 0, 1, 1,
-0.1961104, -0.5580876, -5.085689, 1, 0, 0, 1, 1,
-0.1941743, 0.1953132, 0.1916328, 1, 0, 0, 1, 1,
-0.1939748, 0.2283478, 0.187812, 1, 0, 0, 1, 1,
-0.1935081, 0.5666739, -0.2161093, 0, 0, 0, 1, 1,
-0.1858131, -0.4954338, -3.785815, 0, 0, 0, 1, 1,
-0.1800381, 0.5853099, -1.27591, 0, 0, 0, 1, 1,
-0.1768973, 1.69177, 1.627954, 0, 0, 0, 1, 1,
-0.1751152, 0.7830302, -1.008641, 0, 0, 0, 1, 1,
-0.1726131, 1.696226, 1.772915, 0, 0, 0, 1, 1,
-0.1634578, 0.4259902, -2.244395, 0, 0, 0, 1, 1,
-0.1628275, 0.009946531, -0.6423988, 1, 1, 1, 1, 1,
-0.1583779, 2.028778, -1.361868, 1, 1, 1, 1, 1,
-0.1582213, -0.1722839, -2.773376, 1, 1, 1, 1, 1,
-0.1573442, -0.2016533, -3.906865, 1, 1, 1, 1, 1,
-0.1509148, -0.599183, -3.167582, 1, 1, 1, 1, 1,
-0.1486207, -0.4826329, -1.904696, 1, 1, 1, 1, 1,
-0.1452455, -0.1468427, -2.89569, 1, 1, 1, 1, 1,
-0.1451853, -1.433865, -3.308774, 1, 1, 1, 1, 1,
-0.1417368, -1.471283, -2.582815, 1, 1, 1, 1, 1,
-0.1411684, -1.983795, -2.607313, 1, 1, 1, 1, 1,
-0.139748, 1.414548, -1.223817, 1, 1, 1, 1, 1,
-0.1298407, 0.4688627, 0.9747745, 1, 1, 1, 1, 1,
-0.1256564, -1.257217, -1.576108, 1, 1, 1, 1, 1,
-0.1255868, -2.010138, -3.29393, 1, 1, 1, 1, 1,
-0.1234386, 0.6724232, 0.5063346, 1, 1, 1, 1, 1,
-0.1222568, -1.751508, -3.812161, 0, 0, 1, 1, 1,
-0.1184181, 0.9555725, 0.3980187, 1, 0, 0, 1, 1,
-0.1171652, 0.3034118, -0.8677608, 1, 0, 0, 1, 1,
-0.114088, -1.24388, -2.262156, 1, 0, 0, 1, 1,
-0.1129681, -0.4659711, -2.763196, 1, 0, 0, 1, 1,
-0.1082118, 0.09213828, -2.045241, 1, 0, 0, 1, 1,
-0.1069452, 0.3358241, -0.5704086, 0, 0, 0, 1, 1,
-0.10284, 1.766117, -0.1334472, 0, 0, 0, 1, 1,
-0.1024043, -0.4531927, -0.02596705, 0, 0, 0, 1, 1,
-0.1022158, 0.7695119, -2.54056, 0, 0, 0, 1, 1,
-0.1005408, -1.396296, -2.936313, 0, 0, 0, 1, 1,
-0.09974793, 0.774892, -0.2493842, 0, 0, 0, 1, 1,
-0.0992564, 0.3880171, 0.113826, 0, 0, 0, 1, 1,
-0.09888386, 0.8926734, -2.869568, 1, 1, 1, 1, 1,
-0.09791001, -0.1358394, -2.687677, 1, 1, 1, 1, 1,
-0.09681027, 0.9508539, 0.680745, 1, 1, 1, 1, 1,
-0.09352139, 0.2499797, 0.140983, 1, 1, 1, 1, 1,
-0.09227021, -0.3236108, -2.685212, 1, 1, 1, 1, 1,
-0.09133418, 0.4579731, 1.373675, 1, 1, 1, 1, 1,
-0.09119446, -0.4452678, -1.278473, 1, 1, 1, 1, 1,
-0.08895584, -0.8923436, -3.111007, 1, 1, 1, 1, 1,
-0.08353186, 1.393552, 0.4909181, 1, 1, 1, 1, 1,
-0.08329092, -1.753261, -3.198037, 1, 1, 1, 1, 1,
-0.06557006, -1.319403, -3.491145, 1, 1, 1, 1, 1,
-0.06525041, -0.737878, -4.097224, 1, 1, 1, 1, 1,
-0.06393281, -0.6700001, -3.391307, 1, 1, 1, 1, 1,
-0.06305528, 0.2517305, -0.4356652, 1, 1, 1, 1, 1,
-0.06110428, -0.4098989, -4.681312, 1, 1, 1, 1, 1,
-0.0608394, 0.40435, 1.722686, 0, 0, 1, 1, 1,
-0.05828439, -0.7633886, -3.629069, 1, 0, 0, 1, 1,
-0.05707588, -2.381532, -3.212819, 1, 0, 0, 1, 1,
-0.05509991, 1.70399, 0.8369731, 1, 0, 0, 1, 1,
-0.04638021, -0.2479229, -2.189192, 1, 0, 0, 1, 1,
-0.04504386, 1.315924, 0.38014, 1, 0, 0, 1, 1,
-0.04130911, -0.1932162, -4.050501, 0, 0, 0, 1, 1,
-0.03945643, 1.236421, 0.92749, 0, 0, 0, 1, 1,
-0.03855281, 0.4559181, 0.2619333, 0, 0, 0, 1, 1,
-0.03813568, -0.6420743, -0.1954811, 0, 0, 0, 1, 1,
-0.03614217, 0.003456646, -1.24199, 0, 0, 0, 1, 1,
-0.03497644, -0.1081537, -1.900039, 0, 0, 0, 1, 1,
-0.03488036, -1.829395, -2.781639, 0, 0, 0, 1, 1,
-0.03255948, 0.1731557, 3.262814, 1, 1, 1, 1, 1,
-0.03169154, 0.9119829, -0.2141141, 1, 1, 1, 1, 1,
-0.03064307, 1.319354, 0.2095922, 1, 1, 1, 1, 1,
-0.01785982, -0.06104784, -3.713179, 1, 1, 1, 1, 1,
-0.01614736, -0.9009301, -3.119575, 1, 1, 1, 1, 1,
-0.01330917, 1.30566, -0.3635802, 1, 1, 1, 1, 1,
-0.01303714, 1.076331, 0.1782221, 1, 1, 1, 1, 1,
-0.006353459, -0.09315272, -4.289701, 1, 1, 1, 1, 1,
-0.003955852, 0.06982722, -0.7101279, 1, 1, 1, 1, 1,
-0.001144886, -1.756894, -3.715596, 1, 1, 1, 1, 1,
0.001720655, -0.1659411, 3.337752, 1, 1, 1, 1, 1,
0.004577521, -0.2693426, 2.971462, 1, 1, 1, 1, 1,
0.006150148, -0.5907996, 2.283176, 1, 1, 1, 1, 1,
0.0136631, -0.3546169, 3.320658, 1, 1, 1, 1, 1,
0.01379002, 0.0619043, 0.05997614, 1, 1, 1, 1, 1,
0.01435087, 0.56242, 0.6242498, 0, 0, 1, 1, 1,
0.01813823, 0.0776216, -2.306187, 1, 0, 0, 1, 1,
0.01953076, 0.02338106, 2.363153, 1, 0, 0, 1, 1,
0.01990215, 0.6976538, 0.6756712, 1, 0, 0, 1, 1,
0.02235455, 0.4973216, 1.366984, 1, 0, 0, 1, 1,
0.02280143, 0.5296786, -0.1447913, 1, 0, 0, 1, 1,
0.02953639, -0.1227633, 3.48875, 0, 0, 0, 1, 1,
0.0323121, -0.4110601, 2.026478, 0, 0, 0, 1, 1,
0.03290438, 1.114502, 0.02940576, 0, 0, 0, 1, 1,
0.033323, 1.501205, -0.2904423, 0, 0, 0, 1, 1,
0.04016976, 1.312021, -0.2131066, 0, 0, 0, 1, 1,
0.04118448, 1.678148, 0.3896487, 0, 0, 0, 1, 1,
0.04622569, 0.4459716, -0.7194952, 0, 0, 0, 1, 1,
0.05050543, 0.496758, -0.3385352, 1, 1, 1, 1, 1,
0.05109847, -1.254957, 4.699259, 1, 1, 1, 1, 1,
0.06209967, -0.3782594, 2.413196, 1, 1, 1, 1, 1,
0.06370264, 0.0482974, -1.038263, 1, 1, 1, 1, 1,
0.0638001, -0.6765854, 3.4681, 1, 1, 1, 1, 1,
0.06507856, -0.2617642, 3.275196, 1, 1, 1, 1, 1,
0.06720264, -0.2180004, 3.536493, 1, 1, 1, 1, 1,
0.06776951, -0.253692, 2.710457, 1, 1, 1, 1, 1,
0.06983087, 1.575094, 1.85969, 1, 1, 1, 1, 1,
0.07793786, 0.8861529, -1.192109, 1, 1, 1, 1, 1,
0.07921652, 0.4320995, -1.740838, 1, 1, 1, 1, 1,
0.08211599, 0.9877355, 0.05296296, 1, 1, 1, 1, 1,
0.08525424, -0.2832204, 2.392645, 1, 1, 1, 1, 1,
0.08670054, -0.1105229, 2.549972, 1, 1, 1, 1, 1,
0.0940447, -0.4920991, 3.309405, 1, 1, 1, 1, 1,
0.09463573, 0.09811933, 0.1227736, 0, 0, 1, 1, 1,
0.09503166, -0.9607024, 2.493509, 1, 0, 0, 1, 1,
0.09856574, 0.1919931, -0.04173517, 1, 0, 0, 1, 1,
0.1039595, -1.03293, 2.318089, 1, 0, 0, 1, 1,
0.1066904, -1.466157, 2.531748, 1, 0, 0, 1, 1,
0.1085317, -0.4241212, 3.501467, 1, 0, 0, 1, 1,
0.1102628, 0.1215339, -1.101709, 0, 0, 0, 1, 1,
0.1106085, 0.5115749, 0.5396491, 0, 0, 0, 1, 1,
0.113891, 0.5478019, -0.6763759, 0, 0, 0, 1, 1,
0.1156707, -0.4032072, 2.369738, 0, 0, 0, 1, 1,
0.1202807, 1.447198, -1.437641, 0, 0, 0, 1, 1,
0.1206558, 0.1597463, 0.7840143, 0, 0, 0, 1, 1,
0.1221779, 0.4514463, 0.8764438, 0, 0, 0, 1, 1,
0.1250204, -1.213426, 3.244428, 1, 1, 1, 1, 1,
0.1256066, -0.9866019, 1.226011, 1, 1, 1, 1, 1,
0.126624, -1.554317, 4.802664, 1, 1, 1, 1, 1,
0.1307778, 0.4151801, 0.09364241, 1, 1, 1, 1, 1,
0.1313858, -1.321284, 1.611436, 1, 1, 1, 1, 1,
0.1330315, 0.167336, -0.1305398, 1, 1, 1, 1, 1,
0.1439046, -0.09655155, 2.214167, 1, 1, 1, 1, 1,
0.1457561, -0.9901301, 3.070329, 1, 1, 1, 1, 1,
0.1500584, -0.2396909, 1.383789, 1, 1, 1, 1, 1,
0.1585304, -0.6201051, 2.566359, 1, 1, 1, 1, 1,
0.1588399, 2.974059, 0.1466004, 1, 1, 1, 1, 1,
0.1613704, 0.7977672, 0.5191664, 1, 1, 1, 1, 1,
0.1643645, -1.271932, 2.652656, 1, 1, 1, 1, 1,
0.1646315, 1.509714, 1.077835, 1, 1, 1, 1, 1,
0.1698661, -1.566404, 3.044824, 1, 1, 1, 1, 1,
0.1736063, 0.05572216, 2.020277, 0, 0, 1, 1, 1,
0.1782078, -1.05381, 4.267231, 1, 0, 0, 1, 1,
0.1814451, 0.3129912, -0.8216935, 1, 0, 0, 1, 1,
0.1825137, -0.5883461, 0.786955, 1, 0, 0, 1, 1,
0.1830936, 1.11658, 0.8991261, 1, 0, 0, 1, 1,
0.1831847, 1.420162, -0.4809119, 1, 0, 0, 1, 1,
0.1837423, 0.7470205, -0.1495539, 0, 0, 0, 1, 1,
0.1850003, 1.521187, 1.174327, 0, 0, 0, 1, 1,
0.1869106, 0.8783376, -0.2281071, 0, 0, 0, 1, 1,
0.190779, -0.2981658, 4.474506, 0, 0, 0, 1, 1,
0.1908608, -0.02220446, -0.4116828, 0, 0, 0, 1, 1,
0.1915712, -0.08780063, 1.290732, 0, 0, 0, 1, 1,
0.1916283, 1.233169, -0.1571939, 0, 0, 0, 1, 1,
0.1968407, 0.9993045, 0.9962139, 1, 1, 1, 1, 1,
0.1969656, -1.138072, 2.344215, 1, 1, 1, 1, 1,
0.1984118, -0.7203644, 1.582512, 1, 1, 1, 1, 1,
0.2089028, 1.633304, 0.01007564, 1, 1, 1, 1, 1,
0.2133423, 1.801132, -1.536512, 1, 1, 1, 1, 1,
0.2199236, 0.630542, 0.4821466, 1, 1, 1, 1, 1,
0.2210008, -0.2163232, 3.05467, 1, 1, 1, 1, 1,
0.2214058, -0.269316, 3.580883, 1, 1, 1, 1, 1,
0.2228114, -0.3077947, 1.890632, 1, 1, 1, 1, 1,
0.2232573, 0.7460251, 0.7702122, 1, 1, 1, 1, 1,
0.2251102, 1.718902, -0.1759091, 1, 1, 1, 1, 1,
0.2252203, -0.02373594, 1.311464, 1, 1, 1, 1, 1,
0.2310685, -0.5794275, 0.8436123, 1, 1, 1, 1, 1,
0.2319015, -0.05862308, 2.256048, 1, 1, 1, 1, 1,
0.2326617, -0.112995, 4.051265, 1, 1, 1, 1, 1,
0.2385388, -1.276883, 2.157764, 0, 0, 1, 1, 1,
0.2416225, -2.541516, 3.004927, 1, 0, 0, 1, 1,
0.2432113, 1.294694, 1.362747, 1, 0, 0, 1, 1,
0.2433942, -0.3961529, 3.131417, 1, 0, 0, 1, 1,
0.2439224, -0.3607797, 3.28758, 1, 0, 0, 1, 1,
0.2442441, 0.3978864, 0.5149084, 1, 0, 0, 1, 1,
0.245157, -0.2855276, 2.631172, 0, 0, 0, 1, 1,
0.2452547, -0.9888922, 3.607739, 0, 0, 0, 1, 1,
0.2663518, 0.024295, 2.707053, 0, 0, 0, 1, 1,
0.2683234, -1.691594, 3.937436, 0, 0, 0, 1, 1,
0.2748022, 1.681942, -0.1010986, 0, 0, 0, 1, 1,
0.2751317, -0.6821805, 3.268687, 0, 0, 0, 1, 1,
0.2754206, -0.5855483, 1.633479, 0, 0, 0, 1, 1,
0.2780571, -0.06157139, 2.09119, 1, 1, 1, 1, 1,
0.2783579, -1.07516, 2.7433, 1, 1, 1, 1, 1,
0.2787242, -0.3104655, 2.514079, 1, 1, 1, 1, 1,
0.2806288, -0.8348843, 1.173669, 1, 1, 1, 1, 1,
0.2815255, 0.04656458, 2.00107, 1, 1, 1, 1, 1,
0.281742, -1.937837, 2.315609, 1, 1, 1, 1, 1,
0.2825908, -0.9691524, 2.735268, 1, 1, 1, 1, 1,
0.2848764, -0.3030301, 0.1861756, 1, 1, 1, 1, 1,
0.2867286, 0.2233005, 0.4694873, 1, 1, 1, 1, 1,
0.2874796, 0.2591609, 2.589619, 1, 1, 1, 1, 1,
0.2893279, 2.075361, -0.8756083, 1, 1, 1, 1, 1,
0.2904761, 0.324178, 0.6728919, 1, 1, 1, 1, 1,
0.2950654, 0.4733898, -0.5492009, 1, 1, 1, 1, 1,
0.2956672, -0.7016762, 5.390384, 1, 1, 1, 1, 1,
0.3007713, 1.659894, -0.3216328, 1, 1, 1, 1, 1,
0.3043561, -1.513091, 4.896129, 0, 0, 1, 1, 1,
0.3044168, -0.6994208, 3.894343, 1, 0, 0, 1, 1,
0.3044508, -1.075855, 3.741049, 1, 0, 0, 1, 1,
0.3060125, 1.227564, 1.987305, 1, 0, 0, 1, 1,
0.3080252, 0.2452448, -0.4173819, 1, 0, 0, 1, 1,
0.3090971, -0.7833624, 3.286464, 1, 0, 0, 1, 1,
0.3110978, -0.1860736, 0.1623172, 0, 0, 0, 1, 1,
0.3132615, -2.113351, 3.292293, 0, 0, 0, 1, 1,
0.3160132, -1.880566, 6.164961, 0, 0, 0, 1, 1,
0.3160937, 1.680401, 0.7463664, 0, 0, 0, 1, 1,
0.319191, -0.4475053, 1.849086, 0, 0, 0, 1, 1,
0.3192753, 0.5517277, -1.708383, 0, 0, 0, 1, 1,
0.3194688, 1.332301, 0.3065628, 0, 0, 0, 1, 1,
0.3223509, 1.19142, -0.5268194, 1, 1, 1, 1, 1,
0.3240472, 0.3722038, 0.2622396, 1, 1, 1, 1, 1,
0.3249428, 0.1601613, -0.1081037, 1, 1, 1, 1, 1,
0.3252203, 0.3244241, 0.5206004, 1, 1, 1, 1, 1,
0.3289398, -0.2273079, 2.565422, 1, 1, 1, 1, 1,
0.32952, -0.406971, 2.900505, 1, 1, 1, 1, 1,
0.3295514, 0.2313384, 0.9979819, 1, 1, 1, 1, 1,
0.3328035, 2.096986, -0.5122536, 1, 1, 1, 1, 1,
0.3381417, -0.06298686, 2.949867, 1, 1, 1, 1, 1,
0.3408805, -1.414946, 2.427892, 1, 1, 1, 1, 1,
0.3428324, -0.7999982, 3.368264, 1, 1, 1, 1, 1,
0.3466374, -0.3600187, 3.048296, 1, 1, 1, 1, 1,
0.3476233, 0.2975355, 2.186209, 1, 1, 1, 1, 1,
0.3477994, 1.216243, -0.3818238, 1, 1, 1, 1, 1,
0.3517842, -0.832818, 1.995725, 1, 1, 1, 1, 1,
0.3537198, -1.017605, 2.403482, 0, 0, 1, 1, 1,
0.3553343, -0.4197611, 3.018788, 1, 0, 0, 1, 1,
0.3568879, 0.8263859, -1.034779, 1, 0, 0, 1, 1,
0.3593702, 0.3735335, 1.013663, 1, 0, 0, 1, 1,
0.3630362, 0.3867155, 0.3040718, 1, 0, 0, 1, 1,
0.3647164, 0.5922354, 0.9695457, 1, 0, 0, 1, 1,
0.3670399, 0.09434201, 1.414402, 0, 0, 0, 1, 1,
0.3677631, 0.1848106, 1.724504, 0, 0, 0, 1, 1,
0.3735303, 0.01693674, 1.273139, 0, 0, 0, 1, 1,
0.3761338, -0.8909699, 2.712866, 0, 0, 0, 1, 1,
0.3783462, -0.3333716, 2.419896, 0, 0, 0, 1, 1,
0.3812558, 0.1174667, 0.5492863, 0, 0, 0, 1, 1,
0.3830961, 0.274017, 1.290918, 0, 0, 0, 1, 1,
0.3857717, -0.05247653, 2.981777, 1, 1, 1, 1, 1,
0.3870572, -1.771569, 2.507766, 1, 1, 1, 1, 1,
0.3886999, -1.491086, 2.425005, 1, 1, 1, 1, 1,
0.395986, -0.09270811, 2.763707, 1, 1, 1, 1, 1,
0.3974182, -0.6431122, 2.10248, 1, 1, 1, 1, 1,
0.4089189, -3.595724, 5.146058, 1, 1, 1, 1, 1,
0.4122383, 0.5252072, 1.174824, 1, 1, 1, 1, 1,
0.4176401, -0.6773961, 2.502813, 1, 1, 1, 1, 1,
0.4274177, 1.05076, 0.06456704, 1, 1, 1, 1, 1,
0.4284198, -1.36447, 1.724157, 1, 1, 1, 1, 1,
0.4315198, 1.149618, 0.5842943, 1, 1, 1, 1, 1,
0.4362955, -1.670386, 2.024563, 1, 1, 1, 1, 1,
0.4363622, -2.289402, 2.859606, 1, 1, 1, 1, 1,
0.4372593, 0.008614758, 0.5636176, 1, 1, 1, 1, 1,
0.4377205, 1.418614, -0.102989, 1, 1, 1, 1, 1,
0.4416659, 0.386155, 2.127138, 0, 0, 1, 1, 1,
0.4449746, -1.386773, 1.813079, 1, 0, 0, 1, 1,
0.4513812, 0.6390377, 0.4979256, 1, 0, 0, 1, 1,
0.4516236, -1.574349, 2.710351, 1, 0, 0, 1, 1,
0.45266, 0.3363703, 0.04319604, 1, 0, 0, 1, 1,
0.4564077, 0.3994798, 2.626635, 1, 0, 0, 1, 1,
0.4568605, 0.2815136, 1.565609, 0, 0, 0, 1, 1,
0.4609639, 0.6484454, 1.510354, 0, 0, 0, 1, 1,
0.462432, 0.7932161, -0.1854722, 0, 0, 0, 1, 1,
0.4650605, 1.223764, 2.092892, 0, 0, 0, 1, 1,
0.4663587, 0.2000558, 0.601068, 0, 0, 0, 1, 1,
0.4679365, -1.083777, 3.822583, 0, 0, 0, 1, 1,
0.468554, 0.4345716, 0.7421071, 0, 0, 0, 1, 1,
0.4711449, -0.912231, 3.425673, 1, 1, 1, 1, 1,
0.4754504, 0.8327394, -0.02707008, 1, 1, 1, 1, 1,
0.4764117, -1.25047, 2.633542, 1, 1, 1, 1, 1,
0.4900221, -0.4294839, 3.159851, 1, 1, 1, 1, 1,
0.4924436, -0.05892653, 3.695185, 1, 1, 1, 1, 1,
0.4930979, -2.010883, 2.309634, 1, 1, 1, 1, 1,
0.4992085, -0.2459179, 4.195019, 1, 1, 1, 1, 1,
0.4995091, 1.111111, 2.622186, 1, 1, 1, 1, 1,
0.4996829, -1.520723, 2.268434, 1, 1, 1, 1, 1,
0.5120955, -0.123578, 0.3808545, 1, 1, 1, 1, 1,
0.5158298, 0.4702938, 0.4937345, 1, 1, 1, 1, 1,
0.5162126, 0.5791188, 0.6628398, 1, 1, 1, 1, 1,
0.5170381, -0.6452124, 1.011639, 1, 1, 1, 1, 1,
0.5291204, -0.514908, 3.780892, 1, 1, 1, 1, 1,
0.5321246, -0.7063875, 2.244322, 1, 1, 1, 1, 1,
0.5334794, -0.6351815, 2.271885, 0, 0, 1, 1, 1,
0.5351456, 0.6404684, 2.306238, 1, 0, 0, 1, 1,
0.5369516, 1.679755, -0.48373, 1, 0, 0, 1, 1,
0.5478761, 0.4171461, 1.179675, 1, 0, 0, 1, 1,
0.5487389, 0.2776508, 1.759073, 1, 0, 0, 1, 1,
0.554467, -0.08664245, 0.8915169, 1, 0, 0, 1, 1,
0.5556514, 1.279759, -1.735009, 0, 0, 0, 1, 1,
0.5594623, 0.4982235, 0.5457261, 0, 0, 0, 1, 1,
0.5599369, 0.9833905, -0.9652507, 0, 0, 0, 1, 1,
0.5680208, -1.482848, 2.019217, 0, 0, 0, 1, 1,
0.5697852, -1.187756, 1.729365, 0, 0, 0, 1, 1,
0.5698149, 0.5850111, 0.1157303, 0, 0, 0, 1, 1,
0.5755799, -0.8653845, 0.5934514, 0, 0, 0, 1, 1,
0.5799783, -3.186356, 3.948145, 1, 1, 1, 1, 1,
0.5799925, 1.055953, 0.9400958, 1, 1, 1, 1, 1,
0.581651, 0.38217, -0.1858755, 1, 1, 1, 1, 1,
0.5883878, 0.2533492, 1.549523, 1, 1, 1, 1, 1,
0.5890567, 1.180144, 0.7054104, 1, 1, 1, 1, 1,
0.5893288, 1.327408, 3.009217, 1, 1, 1, 1, 1,
0.5907341, 0.9146544, -0.9700154, 1, 1, 1, 1, 1,
0.5946781, -1.321802, 2.908674, 1, 1, 1, 1, 1,
0.598608, -0.1047376, 2.891193, 1, 1, 1, 1, 1,
0.6012694, 0.3070697, -0.2786148, 1, 1, 1, 1, 1,
0.6068769, 0.1296888, 0.4478197, 1, 1, 1, 1, 1,
0.6074294, 1.145477, -0.3374025, 1, 1, 1, 1, 1,
0.6104696, -1.577666, 3.926855, 1, 1, 1, 1, 1,
0.6152101, 0.3702215, 1.944597, 1, 1, 1, 1, 1,
0.6160765, -0.296703, 2.298497, 1, 1, 1, 1, 1,
0.6162301, 0.8940455, 1.103723, 0, 0, 1, 1, 1,
0.6162727, 0.9636381, 0.8214124, 1, 0, 0, 1, 1,
0.616626, -1.862649, 3.24066, 1, 0, 0, 1, 1,
0.6171447, 0.008037516, 2.367396, 1, 0, 0, 1, 1,
0.6195, 0.2506718, 0.6965129, 1, 0, 0, 1, 1,
0.6208515, 0.3159414, 1.697654, 1, 0, 0, 1, 1,
0.6208971, -1.194339, 3.122191, 0, 0, 0, 1, 1,
0.6213952, 0.4373447, 1.588628, 0, 0, 0, 1, 1,
0.6220734, -1.663651, 5.195278, 0, 0, 0, 1, 1,
0.6233459, -0.9761102, 0.6239157, 0, 0, 0, 1, 1,
0.6241141, -0.6407456, 1.627238, 0, 0, 0, 1, 1,
0.6261362, 0.5113432, -0.3921251, 0, 0, 0, 1, 1,
0.6265975, -0.644296, 1.847147, 0, 0, 0, 1, 1,
0.6267835, -1.106642, 1.071268, 1, 1, 1, 1, 1,
0.6295527, 0.8228996, -0.2265152, 1, 1, 1, 1, 1,
0.6299583, -0.6537493, 3.934845, 1, 1, 1, 1, 1,
0.6306617, 0.03844243, 2.18853, 1, 1, 1, 1, 1,
0.6366166, -0.5326179, 2.415746, 1, 1, 1, 1, 1,
0.6376896, 0.5286322, 1.980866, 1, 1, 1, 1, 1,
0.6488589, 0.4267903, 1.744582, 1, 1, 1, 1, 1,
0.6489567, 0.3634813, -0.8846091, 1, 1, 1, 1, 1,
0.6492, 0.2116957, 1.77348, 1, 1, 1, 1, 1,
0.6493756, -0.2076, 0.4883055, 1, 1, 1, 1, 1,
0.6524709, -0.2745297, 1.082864, 1, 1, 1, 1, 1,
0.6581698, -0.158222, 1.060921, 1, 1, 1, 1, 1,
0.6649674, -0.4663474, 1.704812, 1, 1, 1, 1, 1,
0.6652613, -0.8268368, 2.058756, 1, 1, 1, 1, 1,
0.674466, 0.9905107, -0.5578071, 1, 1, 1, 1, 1,
0.6748832, 0.9953876, 1.951862, 0, 0, 1, 1, 1,
0.6770558, -1.020313, 2.403747, 1, 0, 0, 1, 1,
0.6775993, 1.387884, 1.202061, 1, 0, 0, 1, 1,
0.6777029, -0.4460038, 2.288382, 1, 0, 0, 1, 1,
0.6900289, 0.6100842, -0.4716461, 1, 0, 0, 1, 1,
0.6908414, 1.280428, 2.153872, 1, 0, 0, 1, 1,
0.6912581, 0.1438258, 2.259129, 0, 0, 0, 1, 1,
0.6917836, -0.9073745, 2.756393, 0, 0, 0, 1, 1,
0.6930212, -0.6878323, 0.2124855, 0, 0, 0, 1, 1,
0.6941769, -0.9713016, 1.712526, 0, 0, 0, 1, 1,
0.6945664, 1.188983, -0.111346, 0, 0, 0, 1, 1,
0.6968577, 0.1948515, 1.777786, 0, 0, 0, 1, 1,
0.7045051, -0.1318903, 0.6316483, 0, 0, 0, 1, 1,
0.7055722, -0.7346904, 2.811995, 1, 1, 1, 1, 1,
0.7125782, 0.505254, 1.305385, 1, 1, 1, 1, 1,
0.7144912, -1.113793, 2.100042, 1, 1, 1, 1, 1,
0.7260436, -0.08704523, 2.281373, 1, 1, 1, 1, 1,
0.7323898, -0.04930095, 1.435858, 1, 1, 1, 1, 1,
0.7326316, -1.052125, 0.5083746, 1, 1, 1, 1, 1,
0.7362903, 0.1198862, 1.749588, 1, 1, 1, 1, 1,
0.7427194, 0.01891852, 0.863563, 1, 1, 1, 1, 1,
0.7436827, 1.212397, 1.64298, 1, 1, 1, 1, 1,
0.7439254, 0.4084719, 0.9095074, 1, 1, 1, 1, 1,
0.7454679, -1.769191, 1.362216, 1, 1, 1, 1, 1,
0.7499086, 1.200267, -0.01816275, 1, 1, 1, 1, 1,
0.7499558, 0.7484525, 1.02362, 1, 1, 1, 1, 1,
0.7547427, -0.4716463, 1.531438, 1, 1, 1, 1, 1,
0.7634398, 0.2997919, 0.6734256, 1, 1, 1, 1, 1,
0.7644383, -0.6331834, 3.349993, 0, 0, 1, 1, 1,
0.7677364, -0.3575498, 2.644965, 1, 0, 0, 1, 1,
0.7708673, 0.5836875, 1.898927, 1, 0, 0, 1, 1,
0.7718558, 0.7195459, -0.7918336, 1, 0, 0, 1, 1,
0.7750975, 0.04659878, 2.276328, 1, 0, 0, 1, 1,
0.7784824, 0.4439606, 2.751234, 1, 0, 0, 1, 1,
0.7798536, 0.2495874, 0.6109812, 0, 0, 0, 1, 1,
0.7833743, 1.826622, -0.06209891, 0, 0, 0, 1, 1,
0.7912138, 1.258917, -0.8304189, 0, 0, 0, 1, 1,
0.7912947, 0.22608, 0.9770343, 0, 0, 0, 1, 1,
0.797509, 0.7332311, 0.7862031, 0, 0, 0, 1, 1,
0.7979158, 1.002197, 1.984761, 0, 0, 0, 1, 1,
0.8085653, -0.369749, 2.084526, 0, 0, 0, 1, 1,
0.8133553, 0.1394661, 1.944773, 1, 1, 1, 1, 1,
0.8185362, -0.05040841, 1.7563, 1, 1, 1, 1, 1,
0.8185983, -1.317951, 3.754722, 1, 1, 1, 1, 1,
0.8236831, -0.6465237, 2.773015, 1, 1, 1, 1, 1,
0.8261415, 0.9517212, 1.019053, 1, 1, 1, 1, 1,
0.8281879, -1.167808, 2.338343, 1, 1, 1, 1, 1,
0.8405752, 1.394757, 0.1646745, 1, 1, 1, 1, 1,
0.8423025, 0.8741688, -1.317864, 1, 1, 1, 1, 1,
0.8461745, -1.859959, 1.766313, 1, 1, 1, 1, 1,
0.8502281, 0.4465604, 1.152376, 1, 1, 1, 1, 1,
0.8503329, -0.6254208, 0.9522303, 1, 1, 1, 1, 1,
0.8535355, 0.8159747, 1.812074, 1, 1, 1, 1, 1,
0.8567218, 0.3487729, 2.921035, 1, 1, 1, 1, 1,
0.8577792, 0.2545382, -0.1186572, 1, 1, 1, 1, 1,
0.8643729, 1.074505, 0.39751, 1, 1, 1, 1, 1,
0.8665469, 1.147617, 1.489621, 0, 0, 1, 1, 1,
0.8691354, 0.6148667, 0.4277859, 1, 0, 0, 1, 1,
0.8737583, -2.818571, 2.358729, 1, 0, 0, 1, 1,
0.8836423, 1.674836, -0.2085196, 1, 0, 0, 1, 1,
0.8870289, 1.909766, 2.573659, 1, 0, 0, 1, 1,
0.8895074, 0.7824964, 0.8260239, 1, 0, 0, 1, 1,
0.8936297, 0.2855156, 0.03286561, 0, 0, 0, 1, 1,
0.8954701, -1.647506, 2.75033, 0, 0, 0, 1, 1,
0.8988122, -1.009983, 1.271163, 0, 0, 0, 1, 1,
0.8998314, 0.9857407, 1.99208, 0, 0, 0, 1, 1,
0.9019961, 0.1205166, 0.2205001, 0, 0, 0, 1, 1,
0.9071456, -0.4206919, 3.187335, 0, 0, 0, 1, 1,
0.9166484, -1.117822, 2.502673, 0, 0, 0, 1, 1,
0.92536, 1.062865, 0.7959936, 1, 1, 1, 1, 1,
0.9290267, -0.01507415, 0.6150685, 1, 1, 1, 1, 1,
0.9313843, -1.379081, 2.327839, 1, 1, 1, 1, 1,
0.9341011, 0.366857, 1.20774, 1, 1, 1, 1, 1,
0.9398094, 0.8551403, 0.7861772, 1, 1, 1, 1, 1,
0.9442803, 0.5817428, 1.854028, 1, 1, 1, 1, 1,
0.9460034, -1.18406, 2.151036, 1, 1, 1, 1, 1,
0.9474983, 2.085758, 1.970778, 1, 1, 1, 1, 1,
0.9500465, 0.6371861, 2.638319, 1, 1, 1, 1, 1,
0.9523771, -1.909563, 3.271963, 1, 1, 1, 1, 1,
0.9557865, -1.105412, 3.205133, 1, 1, 1, 1, 1,
0.9565752, -0.2834893, 0.7205355, 1, 1, 1, 1, 1,
0.963182, -0.1995308, 0.2302929, 1, 1, 1, 1, 1,
0.9655442, 0.3667668, 1.326779, 1, 1, 1, 1, 1,
0.9666777, 0.3705393, 2.011682, 1, 1, 1, 1, 1,
0.9719667, 2.469598, -0.2715609, 0, 0, 1, 1, 1,
0.9771823, 0.2938458, 2.83776, 1, 0, 0, 1, 1,
0.9778435, 0.5752025, 0.3577645, 1, 0, 0, 1, 1,
0.9813704, 0.07783113, 0.4924277, 1, 0, 0, 1, 1,
0.9850569, 1.021325, 1.204593, 1, 0, 0, 1, 1,
0.9878832, -1.600057, 1.935449, 1, 0, 0, 1, 1,
0.9963427, 0.2439264, 1.402002, 0, 0, 0, 1, 1,
0.9993299, 0.1148799, 0.3193341, 0, 0, 0, 1, 1,
1.007496, -0.3623676, 1.260966, 0, 0, 0, 1, 1,
1.012606, -0.08097359, 1.485126, 0, 0, 0, 1, 1,
1.016833, 0.02337369, -0.5200874, 0, 0, 0, 1, 1,
1.021599, 0.4136091, 1.093005, 0, 0, 0, 1, 1,
1.0281, -1.318208, 1.527348, 0, 0, 0, 1, 1,
1.034862, -1.923126, 2.929023, 1, 1, 1, 1, 1,
1.042523, -0.7399648, 1.79146, 1, 1, 1, 1, 1,
1.044279, -0.05262131, 1.75504, 1, 1, 1, 1, 1,
1.044667, 1.163154, 1.055564, 1, 1, 1, 1, 1,
1.045627, -0.09769593, 1.377814, 1, 1, 1, 1, 1,
1.0483, -1.857108, 4.28457, 1, 1, 1, 1, 1,
1.052198, -1.468947, 1.798048, 1, 1, 1, 1, 1,
1.053382, 1.507062, 0.730932, 1, 1, 1, 1, 1,
1.060523, -0.1734593, 0.1984477, 1, 1, 1, 1, 1,
1.069717, -0.6332281, 2.191015, 1, 1, 1, 1, 1,
1.074381, 0.2547557, 1.559645, 1, 1, 1, 1, 1,
1.087665, -1.045997, 2.936108, 1, 1, 1, 1, 1,
1.094309, 0.2760991, 1.343054, 1, 1, 1, 1, 1,
1.097184, 0.09257171, 1.203254, 1, 1, 1, 1, 1,
1.102879, 1.032682, 1.085338, 1, 1, 1, 1, 1,
1.106473, 2.325963, 1.266637, 0, 0, 1, 1, 1,
1.11058, 0.7993169, 2.896622, 1, 0, 0, 1, 1,
1.113013, -1.26802, 2.25847, 1, 0, 0, 1, 1,
1.122919, 0.4366369, 1.114967, 1, 0, 0, 1, 1,
1.125077, -0.7352319, 2.120337, 1, 0, 0, 1, 1,
1.126872, 1.310149, 0.9518819, 1, 0, 0, 1, 1,
1.130179, -0.6581715, 1.173835, 0, 0, 0, 1, 1,
1.139771, 0.3920498, -0.2857663, 0, 0, 0, 1, 1,
1.140456, 0.9251884, 0.6701925, 0, 0, 0, 1, 1,
1.146878, -0.5005592, 1.826864, 0, 0, 0, 1, 1,
1.157221, -0.5089801, 1.790923, 0, 0, 0, 1, 1,
1.159683, -0.2973724, 1.240945, 0, 0, 0, 1, 1,
1.164014, 1.103535, -0.8380694, 0, 0, 0, 1, 1,
1.165294, 0.5511, 2.20903, 1, 1, 1, 1, 1,
1.166922, -1.58866, 3.189951, 1, 1, 1, 1, 1,
1.169336, 0.3120557, 1.380069, 1, 1, 1, 1, 1,
1.173918, 0.005741534, 0.4140404, 1, 1, 1, 1, 1,
1.176125, -0.05777538, 2.718958, 1, 1, 1, 1, 1,
1.189937, 0.759311, 1.210771, 1, 1, 1, 1, 1,
1.190316, 1.082187, 1.027401, 1, 1, 1, 1, 1,
1.191467, 0.4600395, 2.925601, 1, 1, 1, 1, 1,
1.202478, -0.6480403, 1.979856, 1, 1, 1, 1, 1,
1.236812, 0.9427782, 0.1743089, 1, 1, 1, 1, 1,
1.237774, 0.4811931, 1.918723, 1, 1, 1, 1, 1,
1.239821, 1.020405, 0.5261701, 1, 1, 1, 1, 1,
1.246918, -0.879794, 1.829279, 1, 1, 1, 1, 1,
1.249965, 1.263097, 2.62927, 1, 1, 1, 1, 1,
1.251121, 2.207654, 0.3953041, 1, 1, 1, 1, 1,
1.257828, 1.357706, 0.881804, 0, 0, 1, 1, 1,
1.257996, -1.368953, 1.65367, 1, 0, 0, 1, 1,
1.259006, -0.02726219, 3.553721, 1, 0, 0, 1, 1,
1.259504, -0.7943147, 3.616434, 1, 0, 0, 1, 1,
1.268384, 1.513166, 0.7925265, 1, 0, 0, 1, 1,
1.271032, -0.2362166, 0.846823, 1, 0, 0, 1, 1,
1.271674, -0.9453127, 3.956591, 0, 0, 0, 1, 1,
1.281912, -1.044284, 2.151864, 0, 0, 0, 1, 1,
1.287944, -0.09357883, 2.541474, 0, 0, 0, 1, 1,
1.297523, 0.8122756, 1.577179, 0, 0, 0, 1, 1,
1.299286, 0.6430897, 0.6495711, 0, 0, 0, 1, 1,
1.302142, -0.2797209, 3.678936, 0, 0, 0, 1, 1,
1.304343, -1.173223, 4.303176, 0, 0, 0, 1, 1,
1.307047, 0.7811963, -0.4318467, 1, 1, 1, 1, 1,
1.313632, -1.509477, 2.379962, 1, 1, 1, 1, 1,
1.314786, 0.6571859, 1.68168, 1, 1, 1, 1, 1,
1.315546, -2.605532, 2.162264, 1, 1, 1, 1, 1,
1.316377, -1.691713, 1.210753, 1, 1, 1, 1, 1,
1.337837, -0.5088441, 3.029673, 1, 1, 1, 1, 1,
1.343495, 0.05319153, 1.007194, 1, 1, 1, 1, 1,
1.348451, 1.088454, 0.8270791, 1, 1, 1, 1, 1,
1.351881, -0.3573861, 3.750883, 1, 1, 1, 1, 1,
1.360091, 0.6155954, 1.373279, 1, 1, 1, 1, 1,
1.362024, 0.2540229, 2.285007, 1, 1, 1, 1, 1,
1.368965, -1.082202, 1.844347, 1, 1, 1, 1, 1,
1.378062, 1.460475, 1.439174, 1, 1, 1, 1, 1,
1.385036, -1.363972, 3.141615, 1, 1, 1, 1, 1,
1.387248, -0.9033834, 1.679319, 1, 1, 1, 1, 1,
1.393638, 0.562922, 0.6254794, 0, 0, 1, 1, 1,
1.393888, -0.6005118, -0.1482957, 1, 0, 0, 1, 1,
1.415918, 0.4368194, 1.784757, 1, 0, 0, 1, 1,
1.430797, -1.079145, 1.982622, 1, 0, 0, 1, 1,
1.434526, -1.823887, 4.444054, 1, 0, 0, 1, 1,
1.437016, -0.7054103, 1.891374, 1, 0, 0, 1, 1,
1.444632, -0.4320844, 2.416538, 0, 0, 0, 1, 1,
1.448888, -0.6637028, 0.2233501, 0, 0, 0, 1, 1,
1.452882, -0.2639917, 1.157862, 0, 0, 0, 1, 1,
1.455784, -1.146298, 3.670905, 0, 0, 0, 1, 1,
1.465199, -0.08227485, 1.002692, 0, 0, 0, 1, 1,
1.467129, -0.8102099, 2.094819, 0, 0, 0, 1, 1,
1.47613, -1.261932, 2.69042, 0, 0, 0, 1, 1,
1.487, -2.22036, -0.3621644, 1, 1, 1, 1, 1,
1.488788, 0.7456033, 0.8335149, 1, 1, 1, 1, 1,
1.533845, 1.367368, 0.3521844, 1, 1, 1, 1, 1,
1.552929, -0.08019136, 1.957303, 1, 1, 1, 1, 1,
1.577053, -1.857487, 1.799182, 1, 1, 1, 1, 1,
1.587554, -1.588637, 2.192546, 1, 1, 1, 1, 1,
1.596424, 0.2144212, 0.6895087, 1, 1, 1, 1, 1,
1.602932, -1.22588, 2.115256, 1, 1, 1, 1, 1,
1.607785, -0.1876057, 1.677363, 1, 1, 1, 1, 1,
1.609051, 2.06143, -1.498631, 1, 1, 1, 1, 1,
1.616276, -0.4360133, 2.038354, 1, 1, 1, 1, 1,
1.622708, -0.4500577, 0.3916724, 1, 1, 1, 1, 1,
1.629967, 0.9324439, 0.6549461, 1, 1, 1, 1, 1,
1.633695, 0.4096251, 1.54493, 1, 1, 1, 1, 1,
1.657905, -1.444875, 1.983039, 1, 1, 1, 1, 1,
1.662957, -0.4464991, 2.360664, 0, 0, 1, 1, 1,
1.670677, -1.183202, 1.714331, 1, 0, 0, 1, 1,
1.681327, -1.865987, 2.635462, 1, 0, 0, 1, 1,
1.687252, 0.3471424, 2.385462, 1, 0, 0, 1, 1,
1.72019, 1.057009, -1.524695, 1, 0, 0, 1, 1,
1.729043, 2.228477, 0.3776295, 1, 0, 0, 1, 1,
1.734187, -0.7984464, 2.455916, 0, 0, 0, 1, 1,
1.742096, 1.46803, 1.465474, 0, 0, 0, 1, 1,
1.751126, -0.2626758, 2.936238, 0, 0, 0, 1, 1,
1.753299, 0.2320615, 0.6164498, 0, 0, 0, 1, 1,
1.777715, 0.4785304, 1.44588, 0, 0, 0, 1, 1,
1.785004, -0.009947466, 1.073638, 0, 0, 0, 1, 1,
1.798377, 0.7888004, 1.087034, 0, 0, 0, 1, 1,
1.805083, 0.1096104, 0.82748, 1, 1, 1, 1, 1,
1.817542, 0.1737644, 1.756521, 1, 1, 1, 1, 1,
1.840143, 1.432295, 0.1744624, 1, 1, 1, 1, 1,
1.863202, 1.027048, -0.08234862, 1, 1, 1, 1, 1,
1.87594, 1.13326, 1.734868, 1, 1, 1, 1, 1,
1.890311, -0.253633, 3.20196, 1, 1, 1, 1, 1,
1.914624, -0.6033889, 2.289295, 1, 1, 1, 1, 1,
1.992478, 0.9072288, 2.19294, 1, 1, 1, 1, 1,
1.996367, -0.4259744, 1.89083, 1, 1, 1, 1, 1,
1.998868, 1.157864, 0.1847369, 1, 1, 1, 1, 1,
2.016903, -2.679576, 3.262966, 1, 1, 1, 1, 1,
2.018012, 0.915139, 3.16473, 1, 1, 1, 1, 1,
2.096496, -0.2917148, 2.048086, 1, 1, 1, 1, 1,
2.118192, -0.6333509, 1.550173, 1, 1, 1, 1, 1,
2.139762, 0.838577, 1.221847, 1, 1, 1, 1, 1,
2.139954, 0.5969172, 1.665934, 0, 0, 1, 1, 1,
2.14502, -0.941622, 3.214901, 1, 0, 0, 1, 1,
2.14812, 0.2991732, 1.425599, 1, 0, 0, 1, 1,
2.149934, 0.963031, 0.3647467, 1, 0, 0, 1, 1,
2.157714, 0.8555781, 0.2688185, 1, 0, 0, 1, 1,
2.185217, 0.6399109, 0.07429001, 1, 0, 0, 1, 1,
2.195512, 1.040814, 1.917369, 0, 0, 0, 1, 1,
2.202533, 2.16836, 0.808746, 0, 0, 0, 1, 1,
2.216379, -0.7000735, 1.807259, 0, 0, 0, 1, 1,
2.378177, -1.012843, 2.504078, 0, 0, 0, 1, 1,
2.418343, -0.9167129, 3.513134, 0, 0, 0, 1, 1,
2.46946, -1.321656, 2.603719, 0, 0, 0, 1, 1,
2.483811, 0.5144117, 1.434468, 0, 0, 0, 1, 1,
2.489298, -0.3017355, 0.7782694, 1, 1, 1, 1, 1,
2.517596, -0.7332743, 3.840349, 1, 1, 1, 1, 1,
2.71999, -1.374462, 3.449609, 1, 1, 1, 1, 1,
2.768845, -0.9520702, 2.617723, 1, 1, 1, 1, 1,
3.02326, 0.1665923, 0.7945473, 1, 1, 1, 1, 1,
3.049183, -0.553709, 0.6991127, 1, 1, 1, 1, 1,
3.796762, 0.9938332, -0.2273675, 1, 1, 1, 1, 1
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
var radius = 9.858461;
var distance = 34.62743;
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
mvMatrix.translate( -0.5686237, 0.3108323, -0.5253642 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.62743);
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