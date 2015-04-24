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
-2.875404, 1.627823, 0.2865565, 1, 0, 0, 1,
-2.551633, -1.178817, -2.134796, 1, 0.007843138, 0, 1,
-2.506329, -0.4697199, -1.799761, 1, 0.01176471, 0, 1,
-2.460365, 0.9752367, -2.596942, 1, 0.01960784, 0, 1,
-2.34467, 0.6853822, -1.691056, 1, 0.02352941, 0, 1,
-2.342869, 0.1877815, -2.990408, 1, 0.03137255, 0, 1,
-2.295932, 0.6876331, -1.078021, 1, 0.03529412, 0, 1,
-2.223535, 0.1779054, -1.975366, 1, 0.04313726, 0, 1,
-2.18993, -0.9016944, -1.062519, 1, 0.04705882, 0, 1,
-2.174835, 0.3152742, -1.687372, 1, 0.05490196, 0, 1,
-2.144221, -0.6209579, -2.541559, 1, 0.05882353, 0, 1,
-2.133255, -0.418189, -2.80992, 1, 0.06666667, 0, 1,
-2.062697, -0.2540721, -1.867349, 1, 0.07058824, 0, 1,
-2.049756, -0.2035126, -0.5515718, 1, 0.07843138, 0, 1,
-2.022923, 0.3257377, -2.185499, 1, 0.08235294, 0, 1,
-1.996792, -1.048793, -2.468508, 1, 0.09019608, 0, 1,
-1.978791, -0.403774, -1.606568, 1, 0.09411765, 0, 1,
-1.977741, -0.3046976, -2.422219, 1, 0.1019608, 0, 1,
-1.973565, -0.9765989, -1.878187, 1, 0.1098039, 0, 1,
-1.961054, -0.1624836, -0.3863648, 1, 0.1137255, 0, 1,
-1.958297, 0.7287131, -2.52253, 1, 0.1215686, 0, 1,
-1.935845, -0.443691, -2.659659, 1, 0.1254902, 0, 1,
-1.887473, 0.7236407, -0.6640102, 1, 0.1333333, 0, 1,
-1.885375, -0.6186816, -3.223007, 1, 0.1372549, 0, 1,
-1.836146, -1.125465, -3.198641, 1, 0.145098, 0, 1,
-1.836089, -1.088429, -0.4764325, 1, 0.1490196, 0, 1,
-1.824943, -0.5268691, -0.8314695, 1, 0.1568628, 0, 1,
-1.822339, 0.3165272, -0.3866255, 1, 0.1607843, 0, 1,
-1.812313, 0.1120607, -2.438447, 1, 0.1686275, 0, 1,
-1.810982, 0.936491, 0.06168993, 1, 0.172549, 0, 1,
-1.803962, 0.1757268, -0.778458, 1, 0.1803922, 0, 1,
-1.800407, 1.393761, -0.3967519, 1, 0.1843137, 0, 1,
-1.755788, 0.9126678, -2.71844, 1, 0.1921569, 0, 1,
-1.731882, 0.4782161, -1.716549, 1, 0.1960784, 0, 1,
-1.684381, -0.5092677, -3.316228, 1, 0.2039216, 0, 1,
-1.665469, 0.7402407, 0.1134628, 1, 0.2117647, 0, 1,
-1.663058, 0.2433663, 1.20493, 1, 0.2156863, 0, 1,
-1.653166, 0.280044, -1.682044, 1, 0.2235294, 0, 1,
-1.63612, 0.6623762, -1.962487, 1, 0.227451, 0, 1,
-1.635479, -0.6058492, -1.627115, 1, 0.2352941, 0, 1,
-1.633697, -0.1909316, -2.027251, 1, 0.2392157, 0, 1,
-1.625539, 0.7909656, -0.7275166, 1, 0.2470588, 0, 1,
-1.615889, -0.9506136, -3.738228, 1, 0.2509804, 0, 1,
-1.600733, -0.7811722, -0.11314, 1, 0.2588235, 0, 1,
-1.594538, -0.4446477, -1.67577, 1, 0.2627451, 0, 1,
-1.593371, -0.8743598, -2.376515, 1, 0.2705882, 0, 1,
-1.57642, 0.5479464, -2.087544, 1, 0.2745098, 0, 1,
-1.571615, -0.5004407, -2.218508, 1, 0.282353, 0, 1,
-1.570781, 0.3969858, -1.18293, 1, 0.2862745, 0, 1,
-1.559739, -1.039258, -2.147112, 1, 0.2941177, 0, 1,
-1.557579, -0.2433701, -2.582954, 1, 0.3019608, 0, 1,
-1.556721, -0.1677612, 0.8263413, 1, 0.3058824, 0, 1,
-1.551993, -0.7580706, -1.321243, 1, 0.3137255, 0, 1,
-1.547819, 0.002485052, -1.922023, 1, 0.3176471, 0, 1,
-1.547642, 1.192991, -0.409853, 1, 0.3254902, 0, 1,
-1.542039, -1.14068, -4.388346, 1, 0.3294118, 0, 1,
-1.531729, 0.9972472, -0.2845904, 1, 0.3372549, 0, 1,
-1.515787, 0.3124037, -1.995231, 1, 0.3411765, 0, 1,
-1.503298, 0.0006456628, -1.359307, 1, 0.3490196, 0, 1,
-1.497305, 0.5117788, -2.400124, 1, 0.3529412, 0, 1,
-1.491115, -0.242884, -0.8398837, 1, 0.3607843, 0, 1,
-1.487114, -0.06688568, -1.133952, 1, 0.3647059, 0, 1,
-1.465664, -1.911533, -3.037115, 1, 0.372549, 0, 1,
-1.464385, -0.1011761, -3.417452, 1, 0.3764706, 0, 1,
-1.462531, -1.861882, -1.9724, 1, 0.3843137, 0, 1,
-1.450973, -2.451882, -3.36779, 1, 0.3882353, 0, 1,
-1.446747, -0.8493648, -2.474955, 1, 0.3960784, 0, 1,
-1.436296, -1.292205, -1.577142, 1, 0.4039216, 0, 1,
-1.432403, 0.01751462, -1.815612, 1, 0.4078431, 0, 1,
-1.419481, -0.02196044, -0.3163138, 1, 0.4156863, 0, 1,
-1.41824, 1.840099, 0.2122767, 1, 0.4196078, 0, 1,
-1.413299, 1.677203, -1.282493, 1, 0.427451, 0, 1,
-1.399067, -0.6470755, -1.011994, 1, 0.4313726, 0, 1,
-1.398675, -0.02787804, -2.863509, 1, 0.4392157, 0, 1,
-1.395246, -1.369975, -3.486677, 1, 0.4431373, 0, 1,
-1.388729, -1.509127, -4.502968, 1, 0.4509804, 0, 1,
-1.377554, 0.7076926, 0.6216677, 1, 0.454902, 0, 1,
-1.362583, 1.414203, 2.278613, 1, 0.4627451, 0, 1,
-1.356306, -0.7177632, 0.07092761, 1, 0.4666667, 0, 1,
-1.35476, -0.4252341, -0.4780121, 1, 0.4745098, 0, 1,
-1.353336, -0.09691505, -2.953974, 1, 0.4784314, 0, 1,
-1.352556, -0.623938, -1.42302, 1, 0.4862745, 0, 1,
-1.343394, -0.8116706, -0.688266, 1, 0.4901961, 0, 1,
-1.337589, 0.7957565, -3.555579, 1, 0.4980392, 0, 1,
-1.333398, -1.121603, -2.313053, 1, 0.5058824, 0, 1,
-1.327149, 1.390057, -1.536289, 1, 0.509804, 0, 1,
-1.323831, 0.7256708, -1.540467, 1, 0.5176471, 0, 1,
-1.317485, -2.086744, -2.551503, 1, 0.5215687, 0, 1,
-1.316881, -0.02687179, -1.910954, 1, 0.5294118, 0, 1,
-1.316814, 1.587426, -1.793015, 1, 0.5333334, 0, 1,
-1.272101, -0.292482, -1.619679, 1, 0.5411765, 0, 1,
-1.270699, 1.281388, 0.35527, 1, 0.5450981, 0, 1,
-1.26951, 0.2813753, 0.04838999, 1, 0.5529412, 0, 1,
-1.257329, -0.4016038, -2.561256, 1, 0.5568628, 0, 1,
-1.251444, 0.7961102, -0.2404056, 1, 0.5647059, 0, 1,
-1.248626, 1.283622, 0.8660284, 1, 0.5686275, 0, 1,
-1.243114, -0.1280795, -3.8238, 1, 0.5764706, 0, 1,
-1.238503, 2.294184, -0.4344706, 1, 0.5803922, 0, 1,
-1.231554, 0.914942, -1.861639, 1, 0.5882353, 0, 1,
-1.230935, -1.504586, -1.447984, 1, 0.5921569, 0, 1,
-1.228478, 0.8113466, -1.769921, 1, 0.6, 0, 1,
-1.220243, -0.03240442, -2.893745, 1, 0.6078432, 0, 1,
-1.219677, 0.2779381, -2.39484, 1, 0.6117647, 0, 1,
-1.217577, 0.1715323, -1.951672, 1, 0.6196079, 0, 1,
-1.213211, 0.1171413, -1.281913, 1, 0.6235294, 0, 1,
-1.213138, 0.7025266, -0.899299, 1, 0.6313726, 0, 1,
-1.212925, -0.009783807, -0.862622, 1, 0.6352941, 0, 1,
-1.210701, -0.7279487, -0.7616203, 1, 0.6431373, 0, 1,
-1.204305, -0.2583445, -2.821882, 1, 0.6470588, 0, 1,
-1.196414, -0.4922807, -1.748897, 1, 0.654902, 0, 1,
-1.187188, -0.368455, -0.9209679, 1, 0.6588235, 0, 1,
-1.182176, 2.073592, -1.939299, 1, 0.6666667, 0, 1,
-1.159468, -0.2274869, -1.866066, 1, 0.6705883, 0, 1,
-1.150254, -0.04237322, -0.9256231, 1, 0.6784314, 0, 1,
-1.135111, 0.3040574, -2.197402, 1, 0.682353, 0, 1,
-1.132054, 0.3942219, -1.167219, 1, 0.6901961, 0, 1,
-1.1318, -0.7259602, -3.191439, 1, 0.6941177, 0, 1,
-1.12201, -1.294168, -3.668926, 1, 0.7019608, 0, 1,
-1.121113, -0.05617822, -2.122405, 1, 0.7098039, 0, 1,
-1.115237, -0.4982821, -1.476342, 1, 0.7137255, 0, 1,
-1.10734, 0.6235862, -1.18767, 1, 0.7215686, 0, 1,
-1.105528, -1.47471, -2.958951, 1, 0.7254902, 0, 1,
-1.103997, 0.4652366, -1.40927, 1, 0.7333333, 0, 1,
-1.103078, -2.450482, -2.878368, 1, 0.7372549, 0, 1,
-1.101068, -0.155251, -0.8687928, 1, 0.7450981, 0, 1,
-1.096561, -0.3411756, -0.6023179, 1, 0.7490196, 0, 1,
-1.094794, -1.115207, -2.035051, 1, 0.7568628, 0, 1,
-1.085167, -0.5507833, -2.880419, 1, 0.7607843, 0, 1,
-1.081618, -0.6335021, -2.508506, 1, 0.7686275, 0, 1,
-1.074566, -0.4401415, -1.856111, 1, 0.772549, 0, 1,
-1.067732, 0.7384793, -1.250989, 1, 0.7803922, 0, 1,
-1.059659, 1.289505, -0.9489654, 1, 0.7843137, 0, 1,
-1.056207, -1.236979, -4.307535, 1, 0.7921569, 0, 1,
-1.049603, -0.0176035, -1.920215, 1, 0.7960784, 0, 1,
-1.043636, -1.0215, -2.304828, 1, 0.8039216, 0, 1,
-1.035812, -0.7607372, -1.229881, 1, 0.8117647, 0, 1,
-1.034203, 0.6651464, -1.979468, 1, 0.8156863, 0, 1,
-1.02829, -0.4740289, -2.070624, 1, 0.8235294, 0, 1,
-1.023542, 0.08598842, -0.9631345, 1, 0.827451, 0, 1,
-1.019805, 1.182511, -0.8178589, 1, 0.8352941, 0, 1,
-1.018858, 2.098828, -1.020532, 1, 0.8392157, 0, 1,
-1.01522, -0.373878, -0.9590521, 1, 0.8470588, 0, 1,
-1.013524, -0.4388038, -3.176864, 1, 0.8509804, 0, 1,
-1.006544, 1.792272, -1.101985, 1, 0.8588235, 0, 1,
-1.004947, -2.886678, -3.690214, 1, 0.8627451, 0, 1,
-1.001773, 2.193083, -1.837122, 1, 0.8705882, 0, 1,
-0.9959874, -0.733169, -1.919837, 1, 0.8745098, 0, 1,
-0.9958442, 0.4172926, -2.07645, 1, 0.8823529, 0, 1,
-0.9870791, -0.8470051, -2.562689, 1, 0.8862745, 0, 1,
-0.9863141, -0.8809261, -2.849472, 1, 0.8941177, 0, 1,
-0.9768831, -0.02124335, -0.2684741, 1, 0.8980392, 0, 1,
-0.9747306, 0.3023162, -0.9914663, 1, 0.9058824, 0, 1,
-0.9682351, -0.9904594, -2.846802, 1, 0.9137255, 0, 1,
-0.9662781, 0.7885388, -1.512204, 1, 0.9176471, 0, 1,
-0.9650733, -0.6215895, -2.256195, 1, 0.9254902, 0, 1,
-0.9646189, -0.600583, -2.199924, 1, 0.9294118, 0, 1,
-0.9600583, 1.098735, -1.700764, 1, 0.9372549, 0, 1,
-0.9567475, -1.589811, -2.318029, 1, 0.9411765, 0, 1,
-0.9560284, -1.897954, -4.486577, 1, 0.9490196, 0, 1,
-0.9550064, -1.07435, -2.477484, 1, 0.9529412, 0, 1,
-0.9537758, -0.8112189, -2.877191, 1, 0.9607843, 0, 1,
-0.9503372, -0.1429189, -1.874319, 1, 0.9647059, 0, 1,
-0.9452183, 0.5131918, -1.005709, 1, 0.972549, 0, 1,
-0.9414958, -0.1579146, -1.060912, 1, 0.9764706, 0, 1,
-0.9384917, 1.250971, 0.8687362, 1, 0.9843137, 0, 1,
-0.9358279, 0.4961762, -1.61939, 1, 0.9882353, 0, 1,
-0.9336847, -1.182391, -3.413674, 1, 0.9960784, 0, 1,
-0.9273034, -0.7263328, -3.183191, 0.9960784, 1, 0, 1,
-0.927267, 0.1476887, -0.8817625, 0.9921569, 1, 0, 1,
-0.9229309, -1.249588, -0.9337011, 0.9843137, 1, 0, 1,
-0.9218994, 0.06220937, -2.01421, 0.9803922, 1, 0, 1,
-0.9202591, 0.2561658, -1.879755, 0.972549, 1, 0, 1,
-0.9191888, 0.1829639, -3.824886, 0.9686275, 1, 0, 1,
-0.8962861, 0.3433512, -1.124019, 0.9607843, 1, 0, 1,
-0.8933944, 0.03293572, -1.627305, 0.9568627, 1, 0, 1,
-0.892535, 0.1785556, -2.123776, 0.9490196, 1, 0, 1,
-0.8881032, -0.4992027, -1.510109, 0.945098, 1, 0, 1,
-0.8859923, -1.436347, -3.434859, 0.9372549, 1, 0, 1,
-0.8859848, -0.3249637, -1.081524, 0.9333333, 1, 0, 1,
-0.8832037, 0.1897662, -0.9790525, 0.9254902, 1, 0, 1,
-0.8811737, -0.4824007, -2.52658, 0.9215686, 1, 0, 1,
-0.8809899, 0.6159163, 0.6764926, 0.9137255, 1, 0, 1,
-0.8800161, 0.03940218, -0.02725059, 0.9098039, 1, 0, 1,
-0.8789714, 0.8128263, -0.3401478, 0.9019608, 1, 0, 1,
-0.8734299, 0.6074148, -0.9565817, 0.8941177, 1, 0, 1,
-0.8702877, 0.950328, -0.5514354, 0.8901961, 1, 0, 1,
-0.8673253, 0.446982, -0.4685178, 0.8823529, 1, 0, 1,
-0.8672815, -0.2775076, -2.905111, 0.8784314, 1, 0, 1,
-0.8643391, -0.6131175, -3.330289, 0.8705882, 1, 0, 1,
-0.8642843, -0.4693567, -1.651853, 0.8666667, 1, 0, 1,
-0.8626441, -0.8017685, -3.831537, 0.8588235, 1, 0, 1,
-0.8575146, 1.183871, -0.9495053, 0.854902, 1, 0, 1,
-0.8541331, 0.6543403, -2.117442, 0.8470588, 1, 0, 1,
-0.8514617, 1.08536, -0.7509778, 0.8431373, 1, 0, 1,
-0.8466743, 0.3798189, -0.5001467, 0.8352941, 1, 0, 1,
-0.8417181, 0.3795601, -2.356408, 0.8313726, 1, 0, 1,
-0.8389526, -1.020995, -0.5114352, 0.8235294, 1, 0, 1,
-0.8349428, -2.084051, -2.653296, 0.8196079, 1, 0, 1,
-0.8340873, 0.5417317, -1.67069, 0.8117647, 1, 0, 1,
-0.8336512, 0.1066803, -2.032005, 0.8078431, 1, 0, 1,
-0.82954, -1.026051, -2.314944, 0.8, 1, 0, 1,
-0.8272854, 0.381153, -2.120904, 0.7921569, 1, 0, 1,
-0.816686, -0.3722674, -1.739334, 0.7882353, 1, 0, 1,
-0.815387, 0.3112011, -1.23095, 0.7803922, 1, 0, 1,
-0.811816, -0.5119603, -0.2906312, 0.7764706, 1, 0, 1,
-0.8054919, -0.09495533, -2.824421, 0.7686275, 1, 0, 1,
-0.8007033, -0.5805848, -1.908513, 0.7647059, 1, 0, 1,
-0.800215, 2.006261, -0.2035765, 0.7568628, 1, 0, 1,
-0.7999505, 1.55322, -1.555794, 0.7529412, 1, 0, 1,
-0.7987787, 0.913574, -0.8088778, 0.7450981, 1, 0, 1,
-0.794551, -1.484097, -1.068152, 0.7411765, 1, 0, 1,
-0.7928347, -0.4118732, -2.455601, 0.7333333, 1, 0, 1,
-0.7914917, 0.1736988, -1.274802, 0.7294118, 1, 0, 1,
-0.7829496, 0.1622176, -1.830126, 0.7215686, 1, 0, 1,
-0.7791618, -1.628257, -1.424676, 0.7176471, 1, 0, 1,
-0.7717414, 0.130939, -1.155595, 0.7098039, 1, 0, 1,
-0.7712662, 0.08822468, -0.7718837, 0.7058824, 1, 0, 1,
-0.767145, 0.2797846, -1.305493, 0.6980392, 1, 0, 1,
-0.7623928, 0.7239643, 0.3655246, 0.6901961, 1, 0, 1,
-0.7603869, -1.269078, -2.967346, 0.6862745, 1, 0, 1,
-0.7592481, -1.033009, -4.35182, 0.6784314, 1, 0, 1,
-0.75349, -0.4123901, -0.7546683, 0.6745098, 1, 0, 1,
-0.7510774, -2.431508, -1.586552, 0.6666667, 1, 0, 1,
-0.7329693, 0.227209, -0.5374336, 0.6627451, 1, 0, 1,
-0.7325355, -0.343479, -2.688554, 0.654902, 1, 0, 1,
-0.7305334, -0.09815036, -0.1831858, 0.6509804, 1, 0, 1,
-0.710858, 1.189444, 0.7239586, 0.6431373, 1, 0, 1,
-0.7101914, -0.8243058, -3.001376, 0.6392157, 1, 0, 1,
-0.6896084, 0.7459588, -1.353997, 0.6313726, 1, 0, 1,
-0.6868303, 0.5231464, -1.728679, 0.627451, 1, 0, 1,
-0.6855803, 0.257507, -1.206407, 0.6196079, 1, 0, 1,
-0.6852044, 0.3773577, -0.5600217, 0.6156863, 1, 0, 1,
-0.6842492, -0.6634777, -1.18106, 0.6078432, 1, 0, 1,
-0.6816242, -0.3600819, -1.32661, 0.6039216, 1, 0, 1,
-0.6787735, 1.316326, -2.016013, 0.5960785, 1, 0, 1,
-0.6783144, -1.452777, -2.821621, 0.5882353, 1, 0, 1,
-0.6781806, 0.2372508, 0.3636784, 0.5843138, 1, 0, 1,
-0.6781476, 1.169753, 0.264614, 0.5764706, 1, 0, 1,
-0.676457, 0.1330764, -1.682526, 0.572549, 1, 0, 1,
-0.674824, 1.147816, -2.453515, 0.5647059, 1, 0, 1,
-0.6714553, 0.2699234, -0.8622524, 0.5607843, 1, 0, 1,
-0.6677839, -0.3280538, -4.133055, 0.5529412, 1, 0, 1,
-0.6644896, -1.424597, -1.387399, 0.5490196, 1, 0, 1,
-0.6635195, -1.022597, -4.079086, 0.5411765, 1, 0, 1,
-0.6613518, 0.365171, -0.5774729, 0.5372549, 1, 0, 1,
-0.6602581, 1.461064, -0.08323732, 0.5294118, 1, 0, 1,
-0.6597994, -0.5807785, -0.0767538, 0.5254902, 1, 0, 1,
-0.659273, -0.1630144, -3.424055, 0.5176471, 1, 0, 1,
-0.6543139, -0.6652369, -1.182998, 0.5137255, 1, 0, 1,
-0.6510265, 1.137003, -0.7792172, 0.5058824, 1, 0, 1,
-0.6375872, -0.2839332, -3.209761, 0.5019608, 1, 0, 1,
-0.6369889, 0.315198, -1.332721, 0.4941176, 1, 0, 1,
-0.6363633, -0.01450753, -2.274337, 0.4862745, 1, 0, 1,
-0.6284775, -0.1178251, -3.020934, 0.4823529, 1, 0, 1,
-0.620936, 0.01767066, -1.410689, 0.4745098, 1, 0, 1,
-0.6193061, -0.4236211, -2.439114, 0.4705882, 1, 0, 1,
-0.6170157, -1.137804, -2.83992, 0.4627451, 1, 0, 1,
-0.614103, 0.5551509, -0.2120917, 0.4588235, 1, 0, 1,
-0.6135997, 0.6066317, -1.651468, 0.4509804, 1, 0, 1,
-0.6114309, 0.6746482, -3.023892, 0.4470588, 1, 0, 1,
-0.6061583, 1.687716, -1.173702, 0.4392157, 1, 0, 1,
-0.6051998, -0.2586007, -2.840218, 0.4352941, 1, 0, 1,
-0.599043, -1.817844, -2.619987, 0.427451, 1, 0, 1,
-0.5980714, 0.09023628, -0.8634205, 0.4235294, 1, 0, 1,
-0.5974171, 0.5820696, 0.3391052, 0.4156863, 1, 0, 1,
-0.5971507, -0.4466542, -1.463738, 0.4117647, 1, 0, 1,
-0.5895311, -0.8825518, -2.140629, 0.4039216, 1, 0, 1,
-0.5894126, -0.2886368, -2.521412, 0.3960784, 1, 0, 1,
-0.5861055, -0.5325971, -2.091109, 0.3921569, 1, 0, 1,
-0.5846446, -2.063376, -2.340901, 0.3843137, 1, 0, 1,
-0.5837144, 0.1426877, -2.202426, 0.3803922, 1, 0, 1,
-0.5830856, -0.6012357, -2.20416, 0.372549, 1, 0, 1,
-0.5798537, -0.144576, -2.269255, 0.3686275, 1, 0, 1,
-0.5794207, 0.6826343, -0.5767421, 0.3607843, 1, 0, 1,
-0.5778559, 0.01161832, -2.264324, 0.3568628, 1, 0, 1,
-0.5736037, -0.2981597, -1.928649, 0.3490196, 1, 0, 1,
-0.5679148, 0.9037365, 0.1378618, 0.345098, 1, 0, 1,
-0.5659024, -1.302591, -2.711016, 0.3372549, 1, 0, 1,
-0.5541234, -0.9782486, -1.322008, 0.3333333, 1, 0, 1,
-0.5532582, 1.207364, -2.176507, 0.3254902, 1, 0, 1,
-0.550994, -1.69355, -4.419508, 0.3215686, 1, 0, 1,
-0.5489591, -1.101414, -2.765478, 0.3137255, 1, 0, 1,
-0.5436175, -0.5915622, -0.9397526, 0.3098039, 1, 0, 1,
-0.5426599, -0.09519533, -0.1279751, 0.3019608, 1, 0, 1,
-0.5321645, -0.6017147, -0.8579827, 0.2941177, 1, 0, 1,
-0.5262125, -0.4568686, -1.113571, 0.2901961, 1, 0, 1,
-0.5234872, -0.5782952, -2.234654, 0.282353, 1, 0, 1,
-0.5219351, 2.034128, -0.7787376, 0.2784314, 1, 0, 1,
-0.5204313, -0.2113604, -3.252502, 0.2705882, 1, 0, 1,
-0.5201875, -0.4023727, -1.73102, 0.2666667, 1, 0, 1,
-0.5198067, 2.420289, -1.273878, 0.2588235, 1, 0, 1,
-0.5178686, -0.3502883, -2.67674, 0.254902, 1, 0, 1,
-0.5175374, 0.8204159, 0.210287, 0.2470588, 1, 0, 1,
-0.5144057, -2.44942, -3.061985, 0.2431373, 1, 0, 1,
-0.5022387, -1.609563, -2.386814, 0.2352941, 1, 0, 1,
-0.5007019, -0.6830449, -2.09099, 0.2313726, 1, 0, 1,
-0.5002307, 0.7131749, -0.4023247, 0.2235294, 1, 0, 1,
-0.4998863, 1.109195, -0.6927778, 0.2196078, 1, 0, 1,
-0.4948248, -0.5452013, -2.945254, 0.2117647, 1, 0, 1,
-0.4940184, -0.8052501, -2.243924, 0.2078431, 1, 0, 1,
-0.493544, -0.8492402, -1.506832, 0.2, 1, 0, 1,
-0.4915987, -0.05451599, -0.1885573, 0.1921569, 1, 0, 1,
-0.4889838, 0.4167694, -2.114488, 0.1882353, 1, 0, 1,
-0.4796638, 1.774184, 1.116206, 0.1803922, 1, 0, 1,
-0.478947, -0.005908385, -1.791124, 0.1764706, 1, 0, 1,
-0.4762994, 1.675914, 0.4723215, 0.1686275, 1, 0, 1,
-0.4752364, -0.7096912, -1.356593, 0.1647059, 1, 0, 1,
-0.4639359, 0.001350057, -0.1386731, 0.1568628, 1, 0, 1,
-0.4627753, -0.3335099, -1.245376, 0.1529412, 1, 0, 1,
-0.4556075, -1.05224, -1.825937, 0.145098, 1, 0, 1,
-0.4531853, 1.867431, 0.7180406, 0.1411765, 1, 0, 1,
-0.4531743, 0.6841879, -0.9078047, 0.1333333, 1, 0, 1,
-0.4498899, 0.6981192, -1.339911, 0.1294118, 1, 0, 1,
-0.4436909, -1.753402, -5.180979, 0.1215686, 1, 0, 1,
-0.4428219, 1.351722, -0.2479288, 0.1176471, 1, 0, 1,
-0.4427901, 0.9951416, 0.1652472, 0.1098039, 1, 0, 1,
-0.440497, -0.6682515, -1.908819, 0.1058824, 1, 0, 1,
-0.4399586, 0.09682105, -2.288549, 0.09803922, 1, 0, 1,
-0.4393061, -1.287557, -2.33535, 0.09019608, 1, 0, 1,
-0.4387052, -0.2795833, -2.228074, 0.08627451, 1, 0, 1,
-0.4379635, 1.052939, -0.749952, 0.07843138, 1, 0, 1,
-0.4374487, 0.08278836, -1.439325, 0.07450981, 1, 0, 1,
-0.4350609, -1.292701, -1.326526, 0.06666667, 1, 0, 1,
-0.434036, -1.107422, -2.464194, 0.0627451, 1, 0, 1,
-0.43314, 2.09247, -0.6924301, 0.05490196, 1, 0, 1,
-0.4296376, -1.412856, -1.988132, 0.05098039, 1, 0, 1,
-0.4268086, -0.8989271, -3.757537, 0.04313726, 1, 0, 1,
-0.4259869, 0.09719553, -0.5362483, 0.03921569, 1, 0, 1,
-0.4257016, 0.4514687, -0.8537583, 0.03137255, 1, 0, 1,
-0.4243899, -0.906449, -4.161288, 0.02745098, 1, 0, 1,
-0.4240195, -0.4515502, -4.029779, 0.01960784, 1, 0, 1,
-0.4233798, 0.6067299, -0.09551485, 0.01568628, 1, 0, 1,
-0.423318, 0.1051195, -0.5399773, 0.007843138, 1, 0, 1,
-0.4151625, -1.17684, -3.615901, 0.003921569, 1, 0, 1,
-0.4133992, 0.4668774, 0.6064187, 0, 1, 0.003921569, 1,
-0.4121991, -0.01410409, -2.470504, 0, 1, 0.01176471, 1,
-0.4118029, 0.06801395, -0.8148493, 0, 1, 0.01568628, 1,
-0.410534, 0.1192991, -1.797867, 0, 1, 0.02352941, 1,
-0.4078196, -0.6891575, -1.963193, 0, 1, 0.02745098, 1,
-0.406193, -1.19451, -2.661431, 0, 1, 0.03529412, 1,
-0.4050563, -0.7347733, -2.9998, 0, 1, 0.03921569, 1,
-0.4044487, 0.5402315, -0.5353203, 0, 1, 0.04705882, 1,
-0.4003716, -0.7346798, -5.608816, 0, 1, 0.05098039, 1,
-0.3993723, 0.245802, -1.264163, 0, 1, 0.05882353, 1,
-0.3974898, -1.560847, -3.079368, 0, 1, 0.0627451, 1,
-0.3912797, 0.06425647, -2.199352, 0, 1, 0.07058824, 1,
-0.3904519, 0.2228382, -1.14699, 0, 1, 0.07450981, 1,
-0.3888042, 1.044241, 0.9882867, 0, 1, 0.08235294, 1,
-0.3878437, 0.1234654, -0.8338127, 0, 1, 0.08627451, 1,
-0.3870159, -0.4850452, -3.116224, 0, 1, 0.09411765, 1,
-0.3863395, 0.2761315, -1.544366, 0, 1, 0.1019608, 1,
-0.3815033, 2.323608, -1.590969, 0, 1, 0.1058824, 1,
-0.3788499, 0.08140478, -1.760492, 0, 1, 0.1137255, 1,
-0.3760945, -0.8031403, -1.597433, 0, 1, 0.1176471, 1,
-0.375823, 0.7252384, 1.735911, 0, 1, 0.1254902, 1,
-0.3733115, 0.1513689, -1.042623, 0, 1, 0.1294118, 1,
-0.3720124, 0.04930576, -0.4322031, 0, 1, 0.1372549, 1,
-0.3703489, -0.2628427, -2.624562, 0, 1, 0.1411765, 1,
-0.3701794, -0.1516261, -2.392843, 0, 1, 0.1490196, 1,
-0.3700505, -0.6917377, -3.871334, 0, 1, 0.1529412, 1,
-0.3686414, 0.6867018, -0.4686523, 0, 1, 0.1607843, 1,
-0.3606767, 0.6293396, 1.591215, 0, 1, 0.1647059, 1,
-0.3589701, 0.6669976, 0.8389102, 0, 1, 0.172549, 1,
-0.3537094, -0.8750345, -1.367424, 0, 1, 0.1764706, 1,
-0.3493247, -2.246019, -3.350695, 0, 1, 0.1843137, 1,
-0.348933, 0.3353873, -0.6580315, 0, 1, 0.1882353, 1,
-0.3450887, 0.4663533, -0.06995872, 0, 1, 0.1960784, 1,
-0.3409874, 0.5752906, -0.1187886, 0, 1, 0.2039216, 1,
-0.3351166, 0.3266254, -0.1157387, 0, 1, 0.2078431, 1,
-0.3329328, -0.1605562, -4.115615, 0, 1, 0.2156863, 1,
-0.3293357, -0.1750436, -2.409619, 0, 1, 0.2196078, 1,
-0.327185, -0.989537, -3.243803, 0, 1, 0.227451, 1,
-0.3221229, -0.2437031, -2.964173, 0, 1, 0.2313726, 1,
-0.3197172, 0.9451907, -1.100265, 0, 1, 0.2392157, 1,
-0.3190435, 1.465216, 0.1016203, 0, 1, 0.2431373, 1,
-0.3183452, -0.3171757, -1.290106, 0, 1, 0.2509804, 1,
-0.3170672, -0.7855486, -2.770353, 0, 1, 0.254902, 1,
-0.3152048, 0.6492527, -1.023541, 0, 1, 0.2627451, 1,
-0.3132044, -0.144037, -1.555984, 0, 1, 0.2666667, 1,
-0.3131726, 1.453771, -0.6503537, 0, 1, 0.2745098, 1,
-0.3111701, -1.083311, -2.795506, 0, 1, 0.2784314, 1,
-0.3059956, 2.030883, -0.5606558, 0, 1, 0.2862745, 1,
-0.2956177, 2.706945, -0.07168777, 0, 1, 0.2901961, 1,
-0.2896244, -0.964835, -2.701755, 0, 1, 0.2980392, 1,
-0.2896233, -0.7037195, -3.154153, 0, 1, 0.3058824, 1,
-0.2884495, 0.3687665, -0.6815809, 0, 1, 0.3098039, 1,
-0.2877768, -0.6469282, -3.59225, 0, 1, 0.3176471, 1,
-0.2874595, -0.5674109, -1.792883, 0, 1, 0.3215686, 1,
-0.2851277, 0.1848967, -0.9810781, 0, 1, 0.3294118, 1,
-0.2845094, 0.7801216, -0.8344452, 0, 1, 0.3333333, 1,
-0.2820881, 0.5390676, -1.556756, 0, 1, 0.3411765, 1,
-0.2792497, -0.8553395, -2.196011, 0, 1, 0.345098, 1,
-0.2767493, -0.7482548, -3.855712, 0, 1, 0.3529412, 1,
-0.276089, 0.4371355, -1.575164, 0, 1, 0.3568628, 1,
-0.2703707, 1.131231, 1.262219, 0, 1, 0.3647059, 1,
-0.2652233, -0.3639358, -2.994224, 0, 1, 0.3686275, 1,
-0.2643176, -0.3714039, -3.649072, 0, 1, 0.3764706, 1,
-0.263883, -1.065787, -1.897212, 0, 1, 0.3803922, 1,
-0.2601315, 1.704598, -0.6857425, 0, 1, 0.3882353, 1,
-0.257272, 0.4332947, -1.912776, 0, 1, 0.3921569, 1,
-0.2571555, -0.4078488, -3.152794, 0, 1, 0.4, 1,
-0.2568776, 0.8633882, -0.5507098, 0, 1, 0.4078431, 1,
-0.2540975, -1.338439, -3.986592, 0, 1, 0.4117647, 1,
-0.2502984, 0.5303118, 0.1523007, 0, 1, 0.4196078, 1,
-0.2418347, 1.166152, -1.076216, 0, 1, 0.4235294, 1,
-0.2368278, 0.5783343, 0.6797682, 0, 1, 0.4313726, 1,
-0.2348325, -0.5004964, -3.921198, 0, 1, 0.4352941, 1,
-0.2301337, -0.7186031, -2.214492, 0, 1, 0.4431373, 1,
-0.2244844, 0.5408835, -0.9310824, 0, 1, 0.4470588, 1,
-0.2150525, 0.8454383, 1.278415, 0, 1, 0.454902, 1,
-0.2067301, 0.7679677, 0.7441723, 0, 1, 0.4588235, 1,
-0.2037102, 0.6217645, -0.8479521, 0, 1, 0.4666667, 1,
-0.1990772, -1.523599, -2.986626, 0, 1, 0.4705882, 1,
-0.1980811, 0.5947063, -0.02695144, 0, 1, 0.4784314, 1,
-0.1977087, 0.9208784, 1.758077, 0, 1, 0.4823529, 1,
-0.1974891, 1.06949, 0.7170081, 0, 1, 0.4901961, 1,
-0.194044, -0.4965915, -2.714345, 0, 1, 0.4941176, 1,
-0.1939845, -0.2393789, -2.377101, 0, 1, 0.5019608, 1,
-0.1850902, 2.648496, -0.634925, 0, 1, 0.509804, 1,
-0.1829404, 1.217416, -0.9338622, 0, 1, 0.5137255, 1,
-0.1824664, 0.2327955, -1.111485, 0, 1, 0.5215687, 1,
-0.1819209, 0.7433665, 0.8674704, 0, 1, 0.5254902, 1,
-0.1798963, -0.5024031, -4.97339, 0, 1, 0.5333334, 1,
-0.1777235, -0.2935353, -2.4249, 0, 1, 0.5372549, 1,
-0.1702761, -0.1500666, -3.521984, 0, 1, 0.5450981, 1,
-0.1634926, -0.21644, -4.134406, 0, 1, 0.5490196, 1,
-0.1633734, -0.765433, -3.155247, 0, 1, 0.5568628, 1,
-0.1609126, -0.7101271, -2.324136, 0, 1, 0.5607843, 1,
-0.1604392, 0.1958932, -1.293534, 0, 1, 0.5686275, 1,
-0.1589735, 0.2245082, -0.09826328, 0, 1, 0.572549, 1,
-0.1540922, -0.09495597, -1.510897, 0, 1, 0.5803922, 1,
-0.1430115, 0.06170716, -1.614446, 0, 1, 0.5843138, 1,
-0.1408448, -0.09670059, -0.8245354, 0, 1, 0.5921569, 1,
-0.1378054, 0.3770939, -1.468816, 0, 1, 0.5960785, 1,
-0.136738, -0.6256304, -2.448805, 0, 1, 0.6039216, 1,
-0.134377, -0.03353342, -0.796295, 0, 1, 0.6117647, 1,
-0.1304853, 0.1067671, -1.374372, 0, 1, 0.6156863, 1,
-0.1298685, -1.886209, -3.733611, 0, 1, 0.6235294, 1,
-0.1276925, -0.2002038, -3.638349, 0, 1, 0.627451, 1,
-0.1273438, 0.0108415, -2.599961, 0, 1, 0.6352941, 1,
-0.1269814, 0.02323383, -2.040241, 0, 1, 0.6392157, 1,
-0.1256045, -0.4056013, -2.263035, 0, 1, 0.6470588, 1,
-0.1236516, -0.9616668, -3.068347, 0, 1, 0.6509804, 1,
-0.116696, 0.1885486, -0.07590547, 0, 1, 0.6588235, 1,
-0.1163371, -0.345363, -2.228841, 0, 1, 0.6627451, 1,
-0.1142499, 1.544403, 0.6612656, 0, 1, 0.6705883, 1,
-0.1131688, 0.8648281, -0.519872, 0, 1, 0.6745098, 1,
-0.1112614, 3.438044, 1.711638, 0, 1, 0.682353, 1,
-0.1096046, 0.6232305, -1.690368, 0, 1, 0.6862745, 1,
-0.09832308, 1.856169, -0.9272192, 0, 1, 0.6941177, 1,
-0.09645347, 0.9063675, -1.976015, 0, 1, 0.7019608, 1,
-0.09403577, -0.1640838, -2.68111, 0, 1, 0.7058824, 1,
-0.09058381, 0.3277506, -0.5090498, 0, 1, 0.7137255, 1,
-0.08980208, -1.909778, -2.542606, 0, 1, 0.7176471, 1,
-0.08934929, 1.204418, 0.6614003, 0, 1, 0.7254902, 1,
-0.08671407, 0.2626114, -1.083902, 0, 1, 0.7294118, 1,
-0.0858982, -0.6738351, -2.079851, 0, 1, 0.7372549, 1,
-0.08419283, 0.7089881, 0.4446048, 0, 1, 0.7411765, 1,
-0.08307967, 0.1859587, 1.156136, 0, 1, 0.7490196, 1,
-0.07740696, 2.188402, 0.8398597, 0, 1, 0.7529412, 1,
-0.0769499, -0.07435032, -3.388943, 0, 1, 0.7607843, 1,
-0.0701053, -0.4373468, -3.392766, 0, 1, 0.7647059, 1,
-0.06961756, 0.3463731, 1.004662, 0, 1, 0.772549, 1,
-0.06959318, -0.145321, -2.501375, 0, 1, 0.7764706, 1,
-0.06858182, 1.768331, 1.277319, 0, 1, 0.7843137, 1,
-0.06519616, -0.6971219, -2.268134, 0, 1, 0.7882353, 1,
-0.06167574, -2.483365, -4.286034, 0, 1, 0.7960784, 1,
-0.0566773, -1.794797, -3.881556, 0, 1, 0.8039216, 1,
-0.05589278, 0.5520806, 0.4490191, 0, 1, 0.8078431, 1,
-0.05510404, 0.241588, 0.04473137, 0, 1, 0.8156863, 1,
-0.05288567, 0.7028735, 1.655662, 0, 1, 0.8196079, 1,
-0.05140194, 0.70829, -0.246379, 0, 1, 0.827451, 1,
-0.04894256, -1.66394, -2.446032, 0, 1, 0.8313726, 1,
-0.04606511, -1.485392, -2.237299, 0, 1, 0.8392157, 1,
-0.04220794, 0.2590447, -1.157713, 0, 1, 0.8431373, 1,
-0.03961894, -0.5837042, -4.733235, 0, 1, 0.8509804, 1,
-0.03388645, -0.6825181, -2.25749, 0, 1, 0.854902, 1,
-0.03249366, -1.100963, -3.251076, 0, 1, 0.8627451, 1,
-0.02926925, -0.1758783, -2.393577, 0, 1, 0.8666667, 1,
-0.02513066, -0.4393032, -4.93475, 0, 1, 0.8745098, 1,
-0.02437019, 1.038612, -1.345437, 0, 1, 0.8784314, 1,
-0.02355652, 2.06582, 0.4046881, 0, 1, 0.8862745, 1,
-0.02338001, 0.7125151, -0.08598942, 0, 1, 0.8901961, 1,
-0.02323198, -0.3966353, -3.90611, 0, 1, 0.8980392, 1,
-0.02080027, -0.08426277, -4.129407, 0, 1, 0.9058824, 1,
-0.01154352, 0.1069121, -1.363243, 0, 1, 0.9098039, 1,
-0.01098044, -1.57486, -3.145217, 0, 1, 0.9176471, 1,
-0.009904657, -0.6998298, -3.266137, 0, 1, 0.9215686, 1,
-0.009897546, 0.2115443, -0.7822918, 0, 1, 0.9294118, 1,
-0.007269511, 0.2010901, 1.132715, 0, 1, 0.9333333, 1,
-0.005233638, 0.5648698, -0.2179191, 0, 1, 0.9411765, 1,
-0.00307559, 0.5839519, -1.386587, 0, 1, 0.945098, 1,
-0.001920119, -1.237805, -3.39429, 0, 1, 0.9529412, 1,
-0.001371979, -1.454086, -2.672778, 0, 1, 0.9568627, 1,
-0.001309798, -0.08290327, -2.68212, 0, 1, 0.9647059, 1,
0.004896596, -0.7507466, 3.410552, 0, 1, 0.9686275, 1,
0.008954669, -1.474978, 3.918981, 0, 1, 0.9764706, 1,
0.01287208, -2.866226, 2.225097, 0, 1, 0.9803922, 1,
0.01352211, -0.4116305, 4.792796, 0, 1, 0.9882353, 1,
0.03355423, -0.2673552, 3.303007, 0, 1, 0.9921569, 1,
0.03542732, -0.9925399, 3.957824, 0, 1, 1, 1,
0.04127017, 0.9204814, 0.1445193, 0, 0.9921569, 1, 1,
0.04493115, 1.592449, 0.5065317, 0, 0.9882353, 1, 1,
0.04759741, -0.6304695, 3.000045, 0, 0.9803922, 1, 1,
0.04890241, 0.116003, 1.649574, 0, 0.9764706, 1, 1,
0.05023573, 0.01243028, 1.428952, 0, 0.9686275, 1, 1,
0.05037935, -1.966121, 3.844349, 0, 0.9647059, 1, 1,
0.05162058, 0.2036302, -0.2969906, 0, 0.9568627, 1, 1,
0.05255417, -0.7487997, 2.697108, 0, 0.9529412, 1, 1,
0.05357272, 0.2020108, -0.5660026, 0, 0.945098, 1, 1,
0.05464928, 0.7819398, 0.1847888, 0, 0.9411765, 1, 1,
0.05732052, -0.8010103, 2.96474, 0, 0.9333333, 1, 1,
0.05945523, 0.7950665, 0.398287, 0, 0.9294118, 1, 1,
0.06219953, -1.422346, 2.194766, 0, 0.9215686, 1, 1,
0.06243093, 0.2214792, 0.09718297, 0, 0.9176471, 1, 1,
0.06276856, -1.545236, 2.629829, 0, 0.9098039, 1, 1,
0.06313951, 1.147581, -1.155071, 0, 0.9058824, 1, 1,
0.06333811, -0.1739846, 2.876233, 0, 0.8980392, 1, 1,
0.06513788, 0.4230224, -0.102264, 0, 0.8901961, 1, 1,
0.06987549, 0.5855632, 0.1444165, 0, 0.8862745, 1, 1,
0.07028648, -0.274618, 3.149894, 0, 0.8784314, 1, 1,
0.07114018, -0.4869186, 3.33163, 0, 0.8745098, 1, 1,
0.07199281, 0.1003158, 1.229576, 0, 0.8666667, 1, 1,
0.07440393, -1.143347, 4.301518, 0, 0.8627451, 1, 1,
0.07572123, -0.1838345, 3.669213, 0, 0.854902, 1, 1,
0.08269434, -1.604863, 2.562349, 0, 0.8509804, 1, 1,
0.08407816, -0.6777918, 3.572727, 0, 0.8431373, 1, 1,
0.08696355, -1.635169, 2.68981, 0, 0.8392157, 1, 1,
0.08953506, -0.03748181, 2.4762, 0, 0.8313726, 1, 1,
0.09063391, 0.6062856, -0.6303652, 0, 0.827451, 1, 1,
0.09640142, 1.069718, -1.985741, 0, 0.8196079, 1, 1,
0.1027933, -1.397348, 2.428746, 0, 0.8156863, 1, 1,
0.1037287, -0.3820132, 2.129355, 0, 0.8078431, 1, 1,
0.1044124, -0.4394037, 4.487574, 0, 0.8039216, 1, 1,
0.1093481, 0.06578394, 0.1951172, 0, 0.7960784, 1, 1,
0.1124898, -1.674775, 3.197933, 0, 0.7882353, 1, 1,
0.1151771, -0.06479752, 2.437099, 0, 0.7843137, 1, 1,
0.1155541, 0.8087361, 0.3541231, 0, 0.7764706, 1, 1,
0.1181464, -0.7886803, 2.766703, 0, 0.772549, 1, 1,
0.119231, -0.5693702, 2.469959, 0, 0.7647059, 1, 1,
0.1222767, 0.05199161, 1.26018, 0, 0.7607843, 1, 1,
0.1228755, 2.849847, -0.1402176, 0, 0.7529412, 1, 1,
0.1232685, 0.7538987, 1.399693, 0, 0.7490196, 1, 1,
0.1235293, 1.651492, 1.027145, 0, 0.7411765, 1, 1,
0.1258071, -0.1971334, 3.341891, 0, 0.7372549, 1, 1,
0.1281217, 1.421644, -0.4756716, 0, 0.7294118, 1, 1,
0.1290709, 1.049695, -0.4881764, 0, 0.7254902, 1, 1,
0.1292256, 0.6338658, -0.8084086, 0, 0.7176471, 1, 1,
0.1336684, 0.8486554, 1.116434, 0, 0.7137255, 1, 1,
0.134273, 1.308774, -2.767732, 0, 0.7058824, 1, 1,
0.1388818, 1.220834, 0.6035458, 0, 0.6980392, 1, 1,
0.139185, -0.8404366, 1.586286, 0, 0.6941177, 1, 1,
0.139773, -1.278488, 3.821078, 0, 0.6862745, 1, 1,
0.1439283, -1.274937, 1.902476, 0, 0.682353, 1, 1,
0.1457368, 0.3950493, -0.3921034, 0, 0.6745098, 1, 1,
0.1467754, 0.760528, -0.8569597, 0, 0.6705883, 1, 1,
0.1506946, -0.507684, 2.347886, 0, 0.6627451, 1, 1,
0.1547813, 1.829931, 1.160981, 0, 0.6588235, 1, 1,
0.1607016, -1.178512, 3.512223, 0, 0.6509804, 1, 1,
0.1613975, 0.8122497, -0.3883849, 0, 0.6470588, 1, 1,
0.1614893, 2.374604, -0.3645556, 0, 0.6392157, 1, 1,
0.1620089, 0.1295595, 0.6783848, 0, 0.6352941, 1, 1,
0.1655987, -1.368665, 2.674304, 0, 0.627451, 1, 1,
0.1675618, 1.199417, 0.5686556, 0, 0.6235294, 1, 1,
0.1686815, 2.927484, 1.150718, 0, 0.6156863, 1, 1,
0.1727279, -0.5174657, 4.184294, 0, 0.6117647, 1, 1,
0.1728708, -0.1172447, 2.333316, 0, 0.6039216, 1, 1,
0.1820626, 0.9291765, 0.4616065, 0, 0.5960785, 1, 1,
0.1822149, -0.6327885, 3.829736, 0, 0.5921569, 1, 1,
0.182579, 0.06608559, 0.7740172, 0, 0.5843138, 1, 1,
0.1840354, -1.772175, 0.9387938, 0, 0.5803922, 1, 1,
0.1865515, 0.2694668, 1.857946, 0, 0.572549, 1, 1,
0.1898332, -1.746167, 2.578334, 0, 0.5686275, 1, 1,
0.1912289, -0.07397909, 0.7847959, 0, 0.5607843, 1, 1,
0.1989127, -1.943129, 5.241944, 0, 0.5568628, 1, 1,
0.2002279, -0.0360294, 3.042173, 0, 0.5490196, 1, 1,
0.2012107, 0.251584, 0.9406293, 0, 0.5450981, 1, 1,
0.2033328, -1.454113, 2.538036, 0, 0.5372549, 1, 1,
0.2061619, 1.36687, 0.4931629, 0, 0.5333334, 1, 1,
0.2094602, 0.3930987, 1.699219, 0, 0.5254902, 1, 1,
0.212032, -0.5534807, 3.282081, 0, 0.5215687, 1, 1,
0.214064, 0.4673454, -0.01505225, 0, 0.5137255, 1, 1,
0.2235827, -0.2330673, 0.7507031, 0, 0.509804, 1, 1,
0.2236557, -0.5349205, 3.02233, 0, 0.5019608, 1, 1,
0.2259946, 2.089024, -0.5202974, 0, 0.4941176, 1, 1,
0.2265622, -1.747767, 1.770684, 0, 0.4901961, 1, 1,
0.2279141, 0.1928216, -0.8776796, 0, 0.4823529, 1, 1,
0.2281579, 0.07106545, 1.612983, 0, 0.4784314, 1, 1,
0.2285326, 1.411853, 0.9804901, 0, 0.4705882, 1, 1,
0.2303913, 0.440849, 0.7300264, 0, 0.4666667, 1, 1,
0.2328959, 1.764481, 0.4361602, 0, 0.4588235, 1, 1,
0.2364961, 0.8687692, 2.283583, 0, 0.454902, 1, 1,
0.2392405, -0.5959803, 3.247185, 0, 0.4470588, 1, 1,
0.2436664, -0.5926209, 2.538926, 0, 0.4431373, 1, 1,
0.2472595, 1.19807, -0.0304985, 0, 0.4352941, 1, 1,
0.2484245, 0.4200452, 1.449328, 0, 0.4313726, 1, 1,
0.2488489, 1.134562, 0.6089429, 0, 0.4235294, 1, 1,
0.2508798, -1.332008, 2.250459, 0, 0.4196078, 1, 1,
0.2508985, -0.3609671, 2.56763, 0, 0.4117647, 1, 1,
0.2569654, 0.6172151, 0.8348072, 0, 0.4078431, 1, 1,
0.2604324, -0.911852, 3.032764, 0, 0.4, 1, 1,
0.2606228, 0.4850112, 1.092455, 0, 0.3921569, 1, 1,
0.2617734, -1.460566, 4.159851, 0, 0.3882353, 1, 1,
0.2654399, 0.3307015, 0.2392543, 0, 0.3803922, 1, 1,
0.2678806, -0.8025426, 5.669101, 0, 0.3764706, 1, 1,
0.2690715, -1.67738, 2.969162, 0, 0.3686275, 1, 1,
0.2715812, 0.7239187, 1.23284, 0, 0.3647059, 1, 1,
0.2717324, 0.8881891, 0.9892395, 0, 0.3568628, 1, 1,
0.2746676, 0.8548489, -1.829679, 0, 0.3529412, 1, 1,
0.2752101, -1.216545, 4.191718, 0, 0.345098, 1, 1,
0.2758018, 0.20937, 0.7582723, 0, 0.3411765, 1, 1,
0.2760783, 0.8900044, 1.102851, 0, 0.3333333, 1, 1,
0.2786332, 0.5777417, 0.1702532, 0, 0.3294118, 1, 1,
0.2810428, -0.1210419, 2.538671, 0, 0.3215686, 1, 1,
0.2840719, 0.542889, -0.1624329, 0, 0.3176471, 1, 1,
0.2849548, -1.771266, 3.03616, 0, 0.3098039, 1, 1,
0.2850325, 0.4798389, -0.1095599, 0, 0.3058824, 1, 1,
0.285425, -0.5335289, 3.117616, 0, 0.2980392, 1, 1,
0.2899869, -0.1193333, 1.874712, 0, 0.2901961, 1, 1,
0.2900854, -0.1308791, 2.638987, 0, 0.2862745, 1, 1,
0.2959333, 0.3602323, -0.4865417, 0, 0.2784314, 1, 1,
0.2968464, -0.09516662, 1.494488, 0, 0.2745098, 1, 1,
0.2975776, -0.3780352, 2.014393, 0, 0.2666667, 1, 1,
0.2981625, -1.066535, 1.788579, 0, 0.2627451, 1, 1,
0.3046536, -0.07107194, 2.427573, 0, 0.254902, 1, 1,
0.3158669, 2.777677, -0.0254785, 0, 0.2509804, 1, 1,
0.3171958, -0.842812, 2.820435, 0, 0.2431373, 1, 1,
0.3195384, -2.037266, 3.03053, 0, 0.2392157, 1, 1,
0.3201139, 0.4300886, 1.477642, 0, 0.2313726, 1, 1,
0.3249913, -1.944682, 3.79892, 0, 0.227451, 1, 1,
0.3252108, -1.049639, 2.561015, 0, 0.2196078, 1, 1,
0.3264152, 0.8436651, 1.008765, 0, 0.2156863, 1, 1,
0.3265331, 2.001358, 1.619022, 0, 0.2078431, 1, 1,
0.3284619, 1.298311, 0.5175107, 0, 0.2039216, 1, 1,
0.3441459, 1.740185, -0.6375878, 0, 0.1960784, 1, 1,
0.3464813, -0.02677265, 0.7856373, 0, 0.1882353, 1, 1,
0.3469945, 0.7037846, 2.026954, 0, 0.1843137, 1, 1,
0.3523048, -0.1924694, 2.534772, 0, 0.1764706, 1, 1,
0.3528378, -0.7683315, 3.042497, 0, 0.172549, 1, 1,
0.3537458, -0.6656949, 2.951976, 0, 0.1647059, 1, 1,
0.355122, 1.801904, -1.01551, 0, 0.1607843, 1, 1,
0.356317, -0.7837238, 0.9084288, 0, 0.1529412, 1, 1,
0.3607846, 0.6242989, 1.886111, 0, 0.1490196, 1, 1,
0.363746, 0.3114803, 0.1982677, 0, 0.1411765, 1, 1,
0.36395, 0.1558977, 0.08662362, 0, 0.1372549, 1, 1,
0.36472, 0.8162604, 0.7784616, 0, 0.1294118, 1, 1,
0.367167, 1.144833, 1.836093, 0, 0.1254902, 1, 1,
0.3692377, 1.218874, -0.2351397, 0, 0.1176471, 1, 1,
0.3700095, -0.8044711, 2.934415, 0, 0.1137255, 1, 1,
0.3701527, 0.5346861, -0.2317528, 0, 0.1058824, 1, 1,
0.3828665, 1.064916, 0.08426555, 0, 0.09803922, 1, 1,
0.3841239, 0.7954835, -0.3849817, 0, 0.09411765, 1, 1,
0.3922161, -1.969689, 3.288484, 0, 0.08627451, 1, 1,
0.4037012, 1.230181, -0.676782, 0, 0.08235294, 1, 1,
0.4166581, -1.390096, 3.621378, 0, 0.07450981, 1, 1,
0.4202861, 1.614561, 0.3542107, 0, 0.07058824, 1, 1,
0.4207976, -0.06125463, 1.299259, 0, 0.0627451, 1, 1,
0.4236116, -1.963038, 3.057544, 0, 0.05882353, 1, 1,
0.4303308, 1.281894, 0.8977233, 0, 0.05098039, 1, 1,
0.4318549, -0.1614263, 2.878099, 0, 0.04705882, 1, 1,
0.4334866, -1.753871, 2.53382, 0, 0.03921569, 1, 1,
0.4336928, -0.1804656, 1.541058, 0, 0.03529412, 1, 1,
0.4359067, 0.854851, 1.53835, 0, 0.02745098, 1, 1,
0.4359851, 0.1262432, 1.004104, 0, 0.02352941, 1, 1,
0.4378066, 0.108256, 1.817731, 0, 0.01568628, 1, 1,
0.4435471, -3.143493, 3.054969, 0, 0.01176471, 1, 1,
0.4501012, -0.277537, 0.6257737, 0, 0.003921569, 1, 1,
0.4511858, -0.2639726, 2.491653, 0.003921569, 0, 1, 1,
0.4551415, 2.775945, -0.4639361, 0.007843138, 0, 1, 1,
0.4567371, 0.4193682, 2.379407, 0.01568628, 0, 1, 1,
0.4575251, 1.094126, 0.455943, 0.01960784, 0, 1, 1,
0.4612301, -0.1714946, 0.07502826, 0.02745098, 0, 1, 1,
0.4621606, 0.9493857, -1.471114, 0.03137255, 0, 1, 1,
0.4627738, -2.110698, 4.442325, 0.03921569, 0, 1, 1,
0.4673524, -0.9430224, 2.661461, 0.04313726, 0, 1, 1,
0.4679886, 0.490731, 1.391132, 0.05098039, 0, 1, 1,
0.4690276, -0.3856808, 4.352725, 0.05490196, 0, 1, 1,
0.4734902, 0.6917168, 0.3142375, 0.0627451, 0, 1, 1,
0.4737675, -1.783719, 2.927041, 0.06666667, 0, 1, 1,
0.4797184, -0.3502667, 1.138044, 0.07450981, 0, 1, 1,
0.481157, -0.7274189, 2.59311, 0.07843138, 0, 1, 1,
0.4813665, 1.672561, 0.8065092, 0.08627451, 0, 1, 1,
0.4819307, -2.012944, 1.953149, 0.09019608, 0, 1, 1,
0.4828123, 0.2465218, 1.124175, 0.09803922, 0, 1, 1,
0.4858927, -1.85556, 2.144908, 0.1058824, 0, 1, 1,
0.4906248, 0.3435261, 0.591783, 0.1098039, 0, 1, 1,
0.4906745, 0.7595373, -0.2265353, 0.1176471, 0, 1, 1,
0.4916121, -2.225053, 1.758766, 0.1215686, 0, 1, 1,
0.4995788, 0.02648339, 1.730959, 0.1294118, 0, 1, 1,
0.5005877, 0.06063082, 2.05281, 0.1333333, 0, 1, 1,
0.5053709, 1.073722, -1.67392, 0.1411765, 0, 1, 1,
0.5090251, 0.7668825, -0.5351637, 0.145098, 0, 1, 1,
0.5112723, -0.5638458, 3.045864, 0.1529412, 0, 1, 1,
0.5186893, -0.3032658, 1.52055, 0.1568628, 0, 1, 1,
0.5192015, -0.9571877, 3.130072, 0.1647059, 0, 1, 1,
0.5290663, 1.205083, 0.06980034, 0.1686275, 0, 1, 1,
0.5299683, 2.020759, -0.8462184, 0.1764706, 0, 1, 1,
0.5326349, -1.122187, 1.998501, 0.1803922, 0, 1, 1,
0.540014, -1.269101, 3.884673, 0.1882353, 0, 1, 1,
0.5410063, 0.9142664, 0.4747251, 0.1921569, 0, 1, 1,
0.541625, 1.099055, -0.7671654, 0.2, 0, 1, 1,
0.5538253, 0.8863826, -0.3131856, 0.2078431, 0, 1, 1,
0.5559996, -1.973282, 3.61749, 0.2117647, 0, 1, 1,
0.5613464, -0.000731503, 2.210472, 0.2196078, 0, 1, 1,
0.5625033, 1.850663, 0.03549506, 0.2235294, 0, 1, 1,
0.5628827, -0.5832481, 2.299402, 0.2313726, 0, 1, 1,
0.5630205, -0.745938, 0.9223841, 0.2352941, 0, 1, 1,
0.5670113, -1.252967, 1.496475, 0.2431373, 0, 1, 1,
0.5689861, -0.9247096, 2.832004, 0.2470588, 0, 1, 1,
0.5763021, -0.006278051, 2.875281, 0.254902, 0, 1, 1,
0.5842971, 0.1716767, 1.548299, 0.2588235, 0, 1, 1,
0.5862324, -0.7801794, 0.5567653, 0.2666667, 0, 1, 1,
0.5884686, -1.085403, 4.110144, 0.2705882, 0, 1, 1,
0.5899745, 1.733551, -0.8386131, 0.2784314, 0, 1, 1,
0.5938761, -0.6670474, 3.802349, 0.282353, 0, 1, 1,
0.5970117, 0.7195505, 0.6927828, 0.2901961, 0, 1, 1,
0.5971146, 1.619283, 0.9788932, 0.2941177, 0, 1, 1,
0.5989695, 1.202227, -0.3540665, 0.3019608, 0, 1, 1,
0.6002886, -1.059887, 1.616472, 0.3098039, 0, 1, 1,
0.6020218, 0.4551748, 1.342427, 0.3137255, 0, 1, 1,
0.6116639, -0.4130656, 1.019282, 0.3215686, 0, 1, 1,
0.6132396, 0.05154377, 0.04031923, 0.3254902, 0, 1, 1,
0.615147, 0.792442, 1.976853, 0.3333333, 0, 1, 1,
0.6164384, -1.863117, 2.954427, 0.3372549, 0, 1, 1,
0.6243045, -0.6175414, 2.754584, 0.345098, 0, 1, 1,
0.6246124, 1.710512, 0.438063, 0.3490196, 0, 1, 1,
0.6306399, 1.312274, 0.3489048, 0.3568628, 0, 1, 1,
0.6333163, -0.5769082, 1.629002, 0.3607843, 0, 1, 1,
0.6347531, -0.005489133, 1.068542, 0.3686275, 0, 1, 1,
0.640752, -0.6671326, 3.07084, 0.372549, 0, 1, 1,
0.6422733, 0.1527628, -0.931772, 0.3803922, 0, 1, 1,
0.659795, -0.3007899, 2.596257, 0.3843137, 0, 1, 1,
0.6626356, 0.8232041, -1.476331, 0.3921569, 0, 1, 1,
0.6650569, -0.2723118, 3.230567, 0.3960784, 0, 1, 1,
0.6663871, -2.014746, 3.236179, 0.4039216, 0, 1, 1,
0.6668293, 1.316855, -0.1466854, 0.4117647, 0, 1, 1,
0.6670864, 0.2775469, 2.685506, 0.4156863, 0, 1, 1,
0.6683547, -0.3233728, 2.68115, 0.4235294, 0, 1, 1,
0.6698627, 1.604992, 0.380522, 0.427451, 0, 1, 1,
0.6711705, 0.8792011, 1.636455, 0.4352941, 0, 1, 1,
0.6714339, -0.4316753, 1.488468, 0.4392157, 0, 1, 1,
0.6730126, -0.4264523, 2.940016, 0.4470588, 0, 1, 1,
0.6743432, -0.5061523, 1.587449, 0.4509804, 0, 1, 1,
0.6781815, -0.1730605, 2.284762, 0.4588235, 0, 1, 1,
0.685015, 0.6330571, 0.242078, 0.4627451, 0, 1, 1,
0.6888188, -0.6521788, 1.750946, 0.4705882, 0, 1, 1,
0.7008754, 0.3451596, 1.50235, 0.4745098, 0, 1, 1,
0.7047027, 0.918067, -0.98676, 0.4823529, 0, 1, 1,
0.7087904, -0.5058484, 3.741185, 0.4862745, 0, 1, 1,
0.7097986, -0.8255761, 0.9472167, 0.4941176, 0, 1, 1,
0.7101311, 0.8242519, 0.1978714, 0.5019608, 0, 1, 1,
0.7136509, 0.7716857, 0.9554437, 0.5058824, 0, 1, 1,
0.7138463, 0.2739549, 1.61752, 0.5137255, 0, 1, 1,
0.7143756, 0.9882175, 1.500134, 0.5176471, 0, 1, 1,
0.7169832, -0.4649054, 1.266113, 0.5254902, 0, 1, 1,
0.7202927, -1.585848, 2.167768, 0.5294118, 0, 1, 1,
0.7245644, -1.136338, 2.074458, 0.5372549, 0, 1, 1,
0.7252559, 0.7110116, 1.02608, 0.5411765, 0, 1, 1,
0.7351512, 1.272645, 1.488592, 0.5490196, 0, 1, 1,
0.7352772, 3.516289, 1.503416, 0.5529412, 0, 1, 1,
0.7379155, -0.3640752, 4.463006, 0.5607843, 0, 1, 1,
0.7445166, 0.3595029, 0.383018, 0.5647059, 0, 1, 1,
0.7451785, 0.4827904, -0.535527, 0.572549, 0, 1, 1,
0.7470575, 1.238551, 1.217965, 0.5764706, 0, 1, 1,
0.7486113, -0.05458684, 0.3366689, 0.5843138, 0, 1, 1,
0.7503905, -0.2056237, 2.622432, 0.5882353, 0, 1, 1,
0.7587445, 1.263961, -0.5164238, 0.5960785, 0, 1, 1,
0.7609963, -0.3986363, 2.254972, 0.6039216, 0, 1, 1,
0.7617708, 3.30648, 0.2765811, 0.6078432, 0, 1, 1,
0.765378, -0.1092301, 1.254985, 0.6156863, 0, 1, 1,
0.7744121, 0.4297865, 3.168563, 0.6196079, 0, 1, 1,
0.7755675, -0.6118935, 2.147752, 0.627451, 0, 1, 1,
0.7820641, -0.1734993, 2.909806, 0.6313726, 0, 1, 1,
0.7826722, 0.0284306, 1.622297, 0.6392157, 0, 1, 1,
0.7859719, -0.425254, 3.219117, 0.6431373, 0, 1, 1,
0.7875687, -0.3122025, 2.646904, 0.6509804, 0, 1, 1,
0.7899557, 0.2449429, 0.2636056, 0.654902, 0, 1, 1,
0.7916281, 0.575599, 0.2888077, 0.6627451, 0, 1, 1,
0.7917895, -0.3707772, 0.1025102, 0.6666667, 0, 1, 1,
0.7983884, 0.04310472, 3.453516, 0.6745098, 0, 1, 1,
0.8011866, 0.6553032, 0.08905698, 0.6784314, 0, 1, 1,
0.8037856, 2.254139, -0.7723552, 0.6862745, 0, 1, 1,
0.8044839, -0.6626109, 2.9689, 0.6901961, 0, 1, 1,
0.8061795, -0.1777908, 1.730721, 0.6980392, 0, 1, 1,
0.8064457, 1.152511, 0.7100436, 0.7058824, 0, 1, 1,
0.8064667, 0.3486043, 0.7546043, 0.7098039, 0, 1, 1,
0.8145369, -0.947187, 2.585981, 0.7176471, 0, 1, 1,
0.8192987, 0.4504097, 1.242441, 0.7215686, 0, 1, 1,
0.8199033, 1.3302, 0.5755484, 0.7294118, 0, 1, 1,
0.8209483, -1.873825, 2.563371, 0.7333333, 0, 1, 1,
0.821593, -1.826412, 2.506084, 0.7411765, 0, 1, 1,
0.821789, -0.8796492, 2.224046, 0.7450981, 0, 1, 1,
0.8230296, 1.200472, 1.386458, 0.7529412, 0, 1, 1,
0.8290012, -1.130767, 1.560193, 0.7568628, 0, 1, 1,
0.8332556, -1.659595, 2.404665, 0.7647059, 0, 1, 1,
0.8398369, 0.8278369, 2.741937, 0.7686275, 0, 1, 1,
0.8483655, -0.5535437, 1.71847, 0.7764706, 0, 1, 1,
0.8491549, 2.285488, -1.62898, 0.7803922, 0, 1, 1,
0.8577131, 0.2619831, 0.3851294, 0.7882353, 0, 1, 1,
0.8608662, -0.6962594, 2.713312, 0.7921569, 0, 1, 1,
0.8659688, -0.5392754, 2.05551, 0.8, 0, 1, 1,
0.866347, 0.9074483, 0.4145494, 0.8078431, 0, 1, 1,
0.8674179, -0.427581, 2.405581, 0.8117647, 0, 1, 1,
0.8741905, -0.1418088, 2.398205, 0.8196079, 0, 1, 1,
0.8748784, 0.4864881, -0.2351324, 0.8235294, 0, 1, 1,
0.8801928, 0.1669978, 1.572749, 0.8313726, 0, 1, 1,
0.9004393, -1.734087, 2.775659, 0.8352941, 0, 1, 1,
0.9038245, 0.1919984, 1.742143, 0.8431373, 0, 1, 1,
0.9038839, -0.9423103, 3.167715, 0.8470588, 0, 1, 1,
0.9116925, 0.8162434, 0.5151355, 0.854902, 0, 1, 1,
0.922251, 1.107141, 2.463515, 0.8588235, 0, 1, 1,
0.9250048, -0.4592522, 1.336327, 0.8666667, 0, 1, 1,
0.9278842, 0.2367494, 3.1133, 0.8705882, 0, 1, 1,
0.9380295, -0.5553732, 3.797434, 0.8784314, 0, 1, 1,
0.939907, 0.09947793, 1.847244, 0.8823529, 0, 1, 1,
0.9412853, -0.8268399, 3.611088, 0.8901961, 0, 1, 1,
0.9443821, -1.483168, 2.956803, 0.8941177, 0, 1, 1,
0.9470241, 0.3481562, 1.116739, 0.9019608, 0, 1, 1,
0.9520923, 0.7916548, 1.660668, 0.9098039, 0, 1, 1,
0.9555466, 1.549207, -0.5346749, 0.9137255, 0, 1, 1,
0.9648812, -1.790354, 2.463655, 0.9215686, 0, 1, 1,
0.968024, -1.259898, 3.242628, 0.9254902, 0, 1, 1,
0.9735992, 0.08980082, 1.628409, 0.9333333, 0, 1, 1,
0.9739401, -0.7929016, 2.05138, 0.9372549, 0, 1, 1,
0.9791016, -0.7433363, 2.91069, 0.945098, 0, 1, 1,
0.9840542, -0.4264135, 2.13181, 0.9490196, 0, 1, 1,
0.9869844, -0.18436, 2.828048, 0.9568627, 0, 1, 1,
0.9947859, 0.5168259, 0.4853627, 0.9607843, 0, 1, 1,
0.9948439, -0.002632441, 1.129337, 0.9686275, 0, 1, 1,
0.995176, -1.389377, 2.840789, 0.972549, 0, 1, 1,
0.9984483, 0.03031391, 0.5569949, 0.9803922, 0, 1, 1,
1.002248, -0.1905997, -0.4269249, 0.9843137, 0, 1, 1,
1.003196, 0.811308, 1.235643, 0.9921569, 0, 1, 1,
1.006728, -0.592716, 2.739546, 0.9960784, 0, 1, 1,
1.012705, -0.1341916, 2.406163, 1, 0, 0.9960784, 1,
1.01414, -0.4180929, 3.041471, 1, 0, 0.9882353, 1,
1.020019, 0.04892741, -0.733725, 1, 0, 0.9843137, 1,
1.022415, 0.001070727, 2.095387, 1, 0, 0.9764706, 1,
1.02439, 0.2252987, 0.5884824, 1, 0, 0.972549, 1,
1.02624, -0.5026711, 1.849487, 1, 0, 0.9647059, 1,
1.027878, 0.6977851, 0.1166427, 1, 0, 0.9607843, 1,
1.028101, 0.5203959, 0.2907356, 1, 0, 0.9529412, 1,
1.035866, 1.090986, -0.08111679, 1, 0, 0.9490196, 1,
1.03796, 0.1240609, 2.786549, 1, 0, 0.9411765, 1,
1.038699, -0.08560296, 1.446956, 1, 0, 0.9372549, 1,
1.046369, -0.6894121, 2.885483, 1, 0, 0.9294118, 1,
1.055143, -1.262886, 2.766682, 1, 0, 0.9254902, 1,
1.061831, -0.1251517, -0.728232, 1, 0, 0.9176471, 1,
1.064702, -1.161244, 2.472562, 1, 0, 0.9137255, 1,
1.0665, 0.2722056, 1.584421, 1, 0, 0.9058824, 1,
1.068459, 2.106901, -0.9457574, 1, 0, 0.9019608, 1,
1.071541, 0.2914085, 0.3885142, 1, 0, 0.8941177, 1,
1.074252, 0.2812884, 2.311665, 1, 0, 0.8862745, 1,
1.086388, -0.3337688, 0.9360448, 1, 0, 0.8823529, 1,
1.090515, 1.207089, -0.7184814, 1, 0, 0.8745098, 1,
1.090814, -0.4086097, 1.942824, 1, 0, 0.8705882, 1,
1.095152, -0.4703008, 1.151496, 1, 0, 0.8627451, 1,
1.096766, -0.1445199, 1.03675, 1, 0, 0.8588235, 1,
1.103117, -1.375366, 1.681309, 1, 0, 0.8509804, 1,
1.10412, -1.512912, 2.95481, 1, 0, 0.8470588, 1,
1.106391, 0.5120105, 0.5512394, 1, 0, 0.8392157, 1,
1.110853, 0.7525064, 1.937623, 1, 0, 0.8352941, 1,
1.114634, 0.9477446, 2.160055, 1, 0, 0.827451, 1,
1.115416, 1.016531, 0.4553709, 1, 0, 0.8235294, 1,
1.118251, -0.2418727, 1.790497, 1, 0, 0.8156863, 1,
1.120624, -1.233479, 1.328964, 1, 0, 0.8117647, 1,
1.123117, -1.825076, 4.318837, 1, 0, 0.8039216, 1,
1.125281, -2.346559, 2.418775, 1, 0, 0.7960784, 1,
1.125901, 0.6998341, 0.7825666, 1, 0, 0.7921569, 1,
1.132555, -1.567594, 3.600578, 1, 0, 0.7843137, 1,
1.142828, -0.7959352, 3.418392, 1, 0, 0.7803922, 1,
1.147953, 0.5875922, 0.1207129, 1, 0, 0.772549, 1,
1.149604, -0.9966397, 1.772193, 1, 0, 0.7686275, 1,
1.153026, 1.13713, 2.24013, 1, 0, 0.7607843, 1,
1.154711, 0.8514985, -0.2017953, 1, 0, 0.7568628, 1,
1.15873, 0.4535979, 1.532525, 1, 0, 0.7490196, 1,
1.165538, -1.98325, 1.38693, 1, 0, 0.7450981, 1,
1.171286, 0.5147406, 0.1009613, 1, 0, 0.7372549, 1,
1.172118, 0.4838171, 0.777096, 1, 0, 0.7333333, 1,
1.174345, -1.266404, 3.267058, 1, 0, 0.7254902, 1,
1.181314, 0.4359804, 0.3619174, 1, 0, 0.7215686, 1,
1.184891, -1.463568, 2.219026, 1, 0, 0.7137255, 1,
1.188782, 1.528849, 0.6643659, 1, 0, 0.7098039, 1,
1.193089, -1.156481, 1.674046, 1, 0, 0.7019608, 1,
1.19582, -1.249263, 0.4388457, 1, 0, 0.6941177, 1,
1.205198, 0.1520161, 1.662519, 1, 0, 0.6901961, 1,
1.20849, -0.4234873, 1.207303, 1, 0, 0.682353, 1,
1.210193, 0.9171573, 3.714677, 1, 0, 0.6784314, 1,
1.230664, 1.029224, 0.2511013, 1, 0, 0.6705883, 1,
1.231004, 0.3848498, 1.615407, 1, 0, 0.6666667, 1,
1.233208, 0.6306038, -0.5488957, 1, 0, 0.6588235, 1,
1.234581, 1.152225, -0.4102858, 1, 0, 0.654902, 1,
1.245113, -0.24492, 1.813124, 1, 0, 0.6470588, 1,
1.264568, -0.2936487, 4.068482, 1, 0, 0.6431373, 1,
1.26539, 1.412267, 1.203421, 1, 0, 0.6352941, 1,
1.28736, 0.3306323, 1.40904, 1, 0, 0.6313726, 1,
1.31603, 0.8459612, 2.773648, 1, 0, 0.6235294, 1,
1.317936, 1.906055, 0.5789034, 1, 0, 0.6196079, 1,
1.328867, -0.4863831, 1.210992, 1, 0, 0.6117647, 1,
1.329574, -1.030484, 3.245015, 1, 0, 0.6078432, 1,
1.332703, -0.215318, -0.4709412, 1, 0, 0.6, 1,
1.343222, 0.6929747, 0.829502, 1, 0, 0.5921569, 1,
1.346156, 2.025131, 1.53101, 1, 0, 0.5882353, 1,
1.357785, -0.1012158, 1.799439, 1, 0, 0.5803922, 1,
1.357954, 0.07224757, 3.112863, 1, 0, 0.5764706, 1,
1.358651, 0.1227499, 2.194884, 1, 0, 0.5686275, 1,
1.36624, 1.522722, 1.387577, 1, 0, 0.5647059, 1,
1.37067, 0.1376489, 3.279277, 1, 0, 0.5568628, 1,
1.370733, -0.9533488, 0.1822819, 1, 0, 0.5529412, 1,
1.382758, 0.01256016, 1.470111, 1, 0, 0.5450981, 1,
1.386508, 1.55538, 0.5915199, 1, 0, 0.5411765, 1,
1.391565, -0.3667023, 2.77358, 1, 0, 0.5333334, 1,
1.406916, 0.3917438, -0.1670636, 1, 0, 0.5294118, 1,
1.407264, 1.446865, 0.3657136, 1, 0, 0.5215687, 1,
1.41046, 0.4547151, 0.9505922, 1, 0, 0.5176471, 1,
1.412585, -1.151935, 0.8266426, 1, 0, 0.509804, 1,
1.412882, 1.489438, -1.406909, 1, 0, 0.5058824, 1,
1.416833, -0.1693246, 2.945868, 1, 0, 0.4980392, 1,
1.418197, -0.1830609, -0.1260472, 1, 0, 0.4901961, 1,
1.4279, 0.08907334, 1.951768, 1, 0, 0.4862745, 1,
1.430657, 0.484899, -0.7154238, 1, 0, 0.4784314, 1,
1.432103, -0.6508838, 0.9631776, 1, 0, 0.4745098, 1,
1.438045, 1.2236, 0.6848231, 1, 0, 0.4666667, 1,
1.438798, -0.3964631, 2.824817, 1, 0, 0.4627451, 1,
1.46034, -0.540091, 2.459799, 1, 0, 0.454902, 1,
1.465728, -0.8046315, 3.734925, 1, 0, 0.4509804, 1,
1.46656, -1.381773, 2.269624, 1, 0, 0.4431373, 1,
1.471326, -0.4674254, 1.850284, 1, 0, 0.4392157, 1,
1.472629, -1.731248, 3.420302, 1, 0, 0.4313726, 1,
1.488142, -0.7620804, 2.232419, 1, 0, 0.427451, 1,
1.492705, 0.7271347, 2.322664, 1, 0, 0.4196078, 1,
1.504921, 0.385231, -0.07037713, 1, 0, 0.4156863, 1,
1.517828, -0.9144548, 4.006757, 1, 0, 0.4078431, 1,
1.518625, -0.738829, 3.92703, 1, 0, 0.4039216, 1,
1.530591, -0.4978923, 0.525542, 1, 0, 0.3960784, 1,
1.562137, 0.2455325, 1.336993, 1, 0, 0.3882353, 1,
1.57394, -1.657298, 1.794483, 1, 0, 0.3843137, 1,
1.57584, -0.8530599, 1.138692, 1, 0, 0.3764706, 1,
1.58624, -1.231333, 1.936741, 1, 0, 0.372549, 1,
1.609377, -0.8984068, 2.618555, 1, 0, 0.3647059, 1,
1.645376, 1.547864, 0.4424741, 1, 0, 0.3607843, 1,
1.648111, -0.2257065, 1.780168, 1, 0, 0.3529412, 1,
1.652708, 0.2954418, 1.643725, 1, 0, 0.3490196, 1,
1.653099, 0.5128201, -0.1643738, 1, 0, 0.3411765, 1,
1.662418, -0.2234104, 2.731119, 1, 0, 0.3372549, 1,
1.679652, 0.04448397, 1.113029, 1, 0, 0.3294118, 1,
1.712587, -0.7945602, 1.376743, 1, 0, 0.3254902, 1,
1.727378, 0.1099529, 0.1297679, 1, 0, 0.3176471, 1,
1.728269, -0.1062618, 1.942424, 1, 0, 0.3137255, 1,
1.748625, -1.012075, 1.789021, 1, 0, 0.3058824, 1,
1.749928, 1.408539, 2.369716, 1, 0, 0.2980392, 1,
1.758274, 0.8147993, 0.257183, 1, 0, 0.2941177, 1,
1.789649, -2.001647, 1.76375, 1, 0, 0.2862745, 1,
1.796652, 1.057374, 0.6127595, 1, 0, 0.282353, 1,
1.825574, 0.7532856, 0.147058, 1, 0, 0.2745098, 1,
1.840566, -1.150264, 1.406576, 1, 0, 0.2705882, 1,
1.854974, 0.1451402, 1.461861, 1, 0, 0.2627451, 1,
1.859464, -1.115227, 2.629352, 1, 0, 0.2588235, 1,
1.873283, 0.2352836, 2.315689, 1, 0, 0.2509804, 1,
1.887093, 0.03824754, 2.501246, 1, 0, 0.2470588, 1,
1.906831, 0.6666301, 1.90123, 1, 0, 0.2392157, 1,
1.925214, 1.254148, 2.956975, 1, 0, 0.2352941, 1,
1.929096, -1.231418, 2.13269, 1, 0, 0.227451, 1,
1.94088, 1.349228, 0.378891, 1, 0, 0.2235294, 1,
1.976365, 0.8878855, 0.5886264, 1, 0, 0.2156863, 1,
1.977096, -0.2860729, 1.862772, 1, 0, 0.2117647, 1,
2.033855, -1.56767, 0.7704732, 1, 0, 0.2039216, 1,
2.037058, -0.6954858, 3.16553, 1, 0, 0.1960784, 1,
2.03769, 0.5457109, 1.235702, 1, 0, 0.1921569, 1,
2.047561, 0.8053865, 1.646659, 1, 0, 0.1843137, 1,
2.061317, 1.656323, 2.14591, 1, 0, 0.1803922, 1,
2.063441, -0.6242174, 3.05918, 1, 0, 0.172549, 1,
2.086974, 0.1266171, 2.625463, 1, 0, 0.1686275, 1,
2.095125, 0.3532135, 1.289961, 1, 0, 0.1607843, 1,
2.096531, -0.1861824, 1.227197, 1, 0, 0.1568628, 1,
2.111914, 0.4336415, 1.982501, 1, 0, 0.1490196, 1,
2.117597, 2.308527, 1.158675, 1, 0, 0.145098, 1,
2.119865, -1.247918, 3.190676, 1, 0, 0.1372549, 1,
2.15337, 0.09628106, 1.716967, 1, 0, 0.1333333, 1,
2.160198, 0.4091268, 1.714934, 1, 0, 0.1254902, 1,
2.17942, 2.078931, -0.2897504, 1, 0, 0.1215686, 1,
2.190102, -0.3049982, 2.811068, 1, 0, 0.1137255, 1,
2.198604, -0.2901751, 1.78432, 1, 0, 0.1098039, 1,
2.238415, -1.38529, 2.165061, 1, 0, 0.1019608, 1,
2.28092, -0.8901188, 1.635925, 1, 0, 0.09411765, 1,
2.34139, -1.335283, 1.69483, 1, 0, 0.09019608, 1,
2.389416, 0.3950903, 3.003956, 1, 0, 0.08235294, 1,
2.399071, -0.1823929, 2.21747, 1, 0, 0.07843138, 1,
2.404412, 1.711944, 0.9369033, 1, 0, 0.07058824, 1,
2.498215, 0.07103068, 1.354647, 1, 0, 0.06666667, 1,
2.504818, -3.003079, 1.690351, 1, 0, 0.05882353, 1,
2.636256, -0.0739127, 1.399065, 1, 0, 0.05490196, 1,
2.653042, -1.076559, 2.208327, 1, 0, 0.04705882, 1,
2.72294, 1.497642, -0.2339599, 1, 0, 0.04313726, 1,
2.742593, -0.8958565, 2.376343, 1, 0, 0.03529412, 1,
2.760852, -0.3191597, 2.011471, 1, 0, 0.03137255, 1,
2.767948, 1.586388, 1.400508, 1, 0, 0.02352941, 1,
2.780977, 0.4779268, 3.058105, 1, 0, 0.01960784, 1,
2.9836, -0.7587315, 2.377301, 1, 0, 0.01176471, 1,
3.620658, 0.7786967, 1.9243, 1, 0, 0.007843138, 1
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
0.3726269, -4.272326, -7.520423, 0, -0.5, 0.5, 0.5,
0.3726269, -4.272326, -7.520423, 1, -0.5, 0.5, 0.5,
0.3726269, -4.272326, -7.520423, 1, 1.5, 0.5, 0.5,
0.3726269, -4.272326, -7.520423, 0, 1.5, 0.5, 0.5
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
-3.976487, 0.1863979, -7.520423, 0, -0.5, 0.5, 0.5,
-3.976487, 0.1863979, -7.520423, 1, -0.5, 0.5, 0.5,
-3.976487, 0.1863979, -7.520423, 1, 1.5, 0.5, 0.5,
-3.976487, 0.1863979, -7.520423, 0, 1.5, 0.5, 0.5
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
-3.976487, -4.272326, 0.03014255, 0, -0.5, 0.5, 0.5,
-3.976487, -4.272326, 0.03014255, 1, -0.5, 0.5, 0.5,
-3.976487, -4.272326, 0.03014255, 1, 1.5, 0.5, 0.5,
-3.976487, -4.272326, 0.03014255, 0, 1.5, 0.5, 0.5
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
-2, -3.24339, -5.777985,
3, -3.24339, -5.777985,
-2, -3.24339, -5.777985,
-2, -3.414879, -6.068391,
-1, -3.24339, -5.777985,
-1, -3.414879, -6.068391,
0, -3.24339, -5.777985,
0, -3.414879, -6.068391,
1, -3.24339, -5.777985,
1, -3.414879, -6.068391,
2, -3.24339, -5.777985,
2, -3.414879, -6.068391,
3, -3.24339, -5.777985,
3, -3.414879, -6.068391
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
-2, -3.757858, -6.649204, 0, -0.5, 0.5, 0.5,
-2, -3.757858, -6.649204, 1, -0.5, 0.5, 0.5,
-2, -3.757858, -6.649204, 1, 1.5, 0.5, 0.5,
-2, -3.757858, -6.649204, 0, 1.5, 0.5, 0.5,
-1, -3.757858, -6.649204, 0, -0.5, 0.5, 0.5,
-1, -3.757858, -6.649204, 1, -0.5, 0.5, 0.5,
-1, -3.757858, -6.649204, 1, 1.5, 0.5, 0.5,
-1, -3.757858, -6.649204, 0, 1.5, 0.5, 0.5,
0, -3.757858, -6.649204, 0, -0.5, 0.5, 0.5,
0, -3.757858, -6.649204, 1, -0.5, 0.5, 0.5,
0, -3.757858, -6.649204, 1, 1.5, 0.5, 0.5,
0, -3.757858, -6.649204, 0, 1.5, 0.5, 0.5,
1, -3.757858, -6.649204, 0, -0.5, 0.5, 0.5,
1, -3.757858, -6.649204, 1, -0.5, 0.5, 0.5,
1, -3.757858, -6.649204, 1, 1.5, 0.5, 0.5,
1, -3.757858, -6.649204, 0, 1.5, 0.5, 0.5,
2, -3.757858, -6.649204, 0, -0.5, 0.5, 0.5,
2, -3.757858, -6.649204, 1, -0.5, 0.5, 0.5,
2, -3.757858, -6.649204, 1, 1.5, 0.5, 0.5,
2, -3.757858, -6.649204, 0, 1.5, 0.5, 0.5,
3, -3.757858, -6.649204, 0, -0.5, 0.5, 0.5,
3, -3.757858, -6.649204, 1, -0.5, 0.5, 0.5,
3, -3.757858, -6.649204, 1, 1.5, 0.5, 0.5,
3, -3.757858, -6.649204, 0, 1.5, 0.5, 0.5
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
-2.972845, -3, -5.777985,
-2.972845, 3, -5.777985,
-2.972845, -3, -5.777985,
-3.140119, -3, -6.068391,
-2.972845, -2, -5.777985,
-3.140119, -2, -6.068391,
-2.972845, -1, -5.777985,
-3.140119, -1, -6.068391,
-2.972845, 0, -5.777985,
-3.140119, 0, -6.068391,
-2.972845, 1, -5.777985,
-3.140119, 1, -6.068391,
-2.972845, 2, -5.777985,
-3.140119, 2, -6.068391,
-2.972845, 3, -5.777985,
-3.140119, 3, -6.068391
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
-3.474666, -3, -6.649204, 0, -0.5, 0.5, 0.5,
-3.474666, -3, -6.649204, 1, -0.5, 0.5, 0.5,
-3.474666, -3, -6.649204, 1, 1.5, 0.5, 0.5,
-3.474666, -3, -6.649204, 0, 1.5, 0.5, 0.5,
-3.474666, -2, -6.649204, 0, -0.5, 0.5, 0.5,
-3.474666, -2, -6.649204, 1, -0.5, 0.5, 0.5,
-3.474666, -2, -6.649204, 1, 1.5, 0.5, 0.5,
-3.474666, -2, -6.649204, 0, 1.5, 0.5, 0.5,
-3.474666, -1, -6.649204, 0, -0.5, 0.5, 0.5,
-3.474666, -1, -6.649204, 1, -0.5, 0.5, 0.5,
-3.474666, -1, -6.649204, 1, 1.5, 0.5, 0.5,
-3.474666, -1, -6.649204, 0, 1.5, 0.5, 0.5,
-3.474666, 0, -6.649204, 0, -0.5, 0.5, 0.5,
-3.474666, 0, -6.649204, 1, -0.5, 0.5, 0.5,
-3.474666, 0, -6.649204, 1, 1.5, 0.5, 0.5,
-3.474666, 0, -6.649204, 0, 1.5, 0.5, 0.5,
-3.474666, 1, -6.649204, 0, -0.5, 0.5, 0.5,
-3.474666, 1, -6.649204, 1, -0.5, 0.5, 0.5,
-3.474666, 1, -6.649204, 1, 1.5, 0.5, 0.5,
-3.474666, 1, -6.649204, 0, 1.5, 0.5, 0.5,
-3.474666, 2, -6.649204, 0, -0.5, 0.5, 0.5,
-3.474666, 2, -6.649204, 1, -0.5, 0.5, 0.5,
-3.474666, 2, -6.649204, 1, 1.5, 0.5, 0.5,
-3.474666, 2, -6.649204, 0, 1.5, 0.5, 0.5,
-3.474666, 3, -6.649204, 0, -0.5, 0.5, 0.5,
-3.474666, 3, -6.649204, 1, -0.5, 0.5, 0.5,
-3.474666, 3, -6.649204, 1, 1.5, 0.5, 0.5,
-3.474666, 3, -6.649204, 0, 1.5, 0.5, 0.5
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
-2.972845, -3.24339, -4,
-2.972845, -3.24339, 4,
-2.972845, -3.24339, -4,
-3.140119, -3.414879, -4,
-2.972845, -3.24339, -2,
-3.140119, -3.414879, -2,
-2.972845, -3.24339, 0,
-3.140119, -3.414879, 0,
-2.972845, -3.24339, 2,
-3.140119, -3.414879, 2,
-2.972845, -3.24339, 4,
-3.140119, -3.414879, 4
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
-3.474666, -3.757858, -4, 0, -0.5, 0.5, 0.5,
-3.474666, -3.757858, -4, 1, -0.5, 0.5, 0.5,
-3.474666, -3.757858, -4, 1, 1.5, 0.5, 0.5,
-3.474666, -3.757858, -4, 0, 1.5, 0.5, 0.5,
-3.474666, -3.757858, -2, 0, -0.5, 0.5, 0.5,
-3.474666, -3.757858, -2, 1, -0.5, 0.5, 0.5,
-3.474666, -3.757858, -2, 1, 1.5, 0.5, 0.5,
-3.474666, -3.757858, -2, 0, 1.5, 0.5, 0.5,
-3.474666, -3.757858, 0, 0, -0.5, 0.5, 0.5,
-3.474666, -3.757858, 0, 1, -0.5, 0.5, 0.5,
-3.474666, -3.757858, 0, 1, 1.5, 0.5, 0.5,
-3.474666, -3.757858, 0, 0, 1.5, 0.5, 0.5,
-3.474666, -3.757858, 2, 0, -0.5, 0.5, 0.5,
-3.474666, -3.757858, 2, 1, -0.5, 0.5, 0.5,
-3.474666, -3.757858, 2, 1, 1.5, 0.5, 0.5,
-3.474666, -3.757858, 2, 0, 1.5, 0.5, 0.5,
-3.474666, -3.757858, 4, 0, -0.5, 0.5, 0.5,
-3.474666, -3.757858, 4, 1, -0.5, 0.5, 0.5,
-3.474666, -3.757858, 4, 1, 1.5, 0.5, 0.5,
-3.474666, -3.757858, 4, 0, 1.5, 0.5, 0.5
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
-2.972845, -3.24339, -5.777985,
-2.972845, 3.616185, -5.777985,
-2.972845, -3.24339, 5.83827,
-2.972845, 3.616185, 5.83827,
-2.972845, -3.24339, -5.777985,
-2.972845, -3.24339, 5.83827,
-2.972845, 3.616185, -5.777985,
-2.972845, 3.616185, 5.83827,
-2.972845, -3.24339, -5.777985,
3.718099, -3.24339, -5.777985,
-2.972845, -3.24339, 5.83827,
3.718099, -3.24339, 5.83827,
-2.972845, 3.616185, -5.777985,
3.718099, 3.616185, -5.777985,
-2.972845, 3.616185, 5.83827,
3.718099, 3.616185, 5.83827,
3.718099, -3.24339, -5.777985,
3.718099, 3.616185, -5.777985,
3.718099, -3.24339, 5.83827,
3.718099, 3.616185, 5.83827,
3.718099, -3.24339, -5.777985,
3.718099, -3.24339, 5.83827,
3.718099, 3.616185, -5.777985,
3.718099, 3.616185, 5.83827
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
var radius = 8.040972;
var distance = 35.7752;
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
mvMatrix.translate( -0.3726269, -0.1863979, -0.03014255 );
mvMatrix.scale( 1.299377, 1.267434, 0.7484389 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.7752);
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
InChI_1S_C18H19NO4_c<-read.table("InChI_1S_C18H19NO4_c.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C18H19NO4_c$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C18H19NO4_c' not found
```

```r
y<-InChI_1S_C18H19NO4_c$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C18H19NO4_c' not found
```

```r
z<-InChI_1S_C18H19NO4_c$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C18H19NO4_c' not found
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
-2.875404, 1.627823, 0.2865565, 0, 0, 1, 1, 1,
-2.551633, -1.178817, -2.134796, 1, 0, 0, 1, 1,
-2.506329, -0.4697199, -1.799761, 1, 0, 0, 1, 1,
-2.460365, 0.9752367, -2.596942, 1, 0, 0, 1, 1,
-2.34467, 0.6853822, -1.691056, 1, 0, 0, 1, 1,
-2.342869, 0.1877815, -2.990408, 1, 0, 0, 1, 1,
-2.295932, 0.6876331, -1.078021, 0, 0, 0, 1, 1,
-2.223535, 0.1779054, -1.975366, 0, 0, 0, 1, 1,
-2.18993, -0.9016944, -1.062519, 0, 0, 0, 1, 1,
-2.174835, 0.3152742, -1.687372, 0, 0, 0, 1, 1,
-2.144221, -0.6209579, -2.541559, 0, 0, 0, 1, 1,
-2.133255, -0.418189, -2.80992, 0, 0, 0, 1, 1,
-2.062697, -0.2540721, -1.867349, 0, 0, 0, 1, 1,
-2.049756, -0.2035126, -0.5515718, 1, 1, 1, 1, 1,
-2.022923, 0.3257377, -2.185499, 1, 1, 1, 1, 1,
-1.996792, -1.048793, -2.468508, 1, 1, 1, 1, 1,
-1.978791, -0.403774, -1.606568, 1, 1, 1, 1, 1,
-1.977741, -0.3046976, -2.422219, 1, 1, 1, 1, 1,
-1.973565, -0.9765989, -1.878187, 1, 1, 1, 1, 1,
-1.961054, -0.1624836, -0.3863648, 1, 1, 1, 1, 1,
-1.958297, 0.7287131, -2.52253, 1, 1, 1, 1, 1,
-1.935845, -0.443691, -2.659659, 1, 1, 1, 1, 1,
-1.887473, 0.7236407, -0.6640102, 1, 1, 1, 1, 1,
-1.885375, -0.6186816, -3.223007, 1, 1, 1, 1, 1,
-1.836146, -1.125465, -3.198641, 1, 1, 1, 1, 1,
-1.836089, -1.088429, -0.4764325, 1, 1, 1, 1, 1,
-1.824943, -0.5268691, -0.8314695, 1, 1, 1, 1, 1,
-1.822339, 0.3165272, -0.3866255, 1, 1, 1, 1, 1,
-1.812313, 0.1120607, -2.438447, 0, 0, 1, 1, 1,
-1.810982, 0.936491, 0.06168993, 1, 0, 0, 1, 1,
-1.803962, 0.1757268, -0.778458, 1, 0, 0, 1, 1,
-1.800407, 1.393761, -0.3967519, 1, 0, 0, 1, 1,
-1.755788, 0.9126678, -2.71844, 1, 0, 0, 1, 1,
-1.731882, 0.4782161, -1.716549, 1, 0, 0, 1, 1,
-1.684381, -0.5092677, -3.316228, 0, 0, 0, 1, 1,
-1.665469, 0.7402407, 0.1134628, 0, 0, 0, 1, 1,
-1.663058, 0.2433663, 1.20493, 0, 0, 0, 1, 1,
-1.653166, 0.280044, -1.682044, 0, 0, 0, 1, 1,
-1.63612, 0.6623762, -1.962487, 0, 0, 0, 1, 1,
-1.635479, -0.6058492, -1.627115, 0, 0, 0, 1, 1,
-1.633697, -0.1909316, -2.027251, 0, 0, 0, 1, 1,
-1.625539, 0.7909656, -0.7275166, 1, 1, 1, 1, 1,
-1.615889, -0.9506136, -3.738228, 1, 1, 1, 1, 1,
-1.600733, -0.7811722, -0.11314, 1, 1, 1, 1, 1,
-1.594538, -0.4446477, -1.67577, 1, 1, 1, 1, 1,
-1.593371, -0.8743598, -2.376515, 1, 1, 1, 1, 1,
-1.57642, 0.5479464, -2.087544, 1, 1, 1, 1, 1,
-1.571615, -0.5004407, -2.218508, 1, 1, 1, 1, 1,
-1.570781, 0.3969858, -1.18293, 1, 1, 1, 1, 1,
-1.559739, -1.039258, -2.147112, 1, 1, 1, 1, 1,
-1.557579, -0.2433701, -2.582954, 1, 1, 1, 1, 1,
-1.556721, -0.1677612, 0.8263413, 1, 1, 1, 1, 1,
-1.551993, -0.7580706, -1.321243, 1, 1, 1, 1, 1,
-1.547819, 0.002485052, -1.922023, 1, 1, 1, 1, 1,
-1.547642, 1.192991, -0.409853, 1, 1, 1, 1, 1,
-1.542039, -1.14068, -4.388346, 1, 1, 1, 1, 1,
-1.531729, 0.9972472, -0.2845904, 0, 0, 1, 1, 1,
-1.515787, 0.3124037, -1.995231, 1, 0, 0, 1, 1,
-1.503298, 0.0006456628, -1.359307, 1, 0, 0, 1, 1,
-1.497305, 0.5117788, -2.400124, 1, 0, 0, 1, 1,
-1.491115, -0.242884, -0.8398837, 1, 0, 0, 1, 1,
-1.487114, -0.06688568, -1.133952, 1, 0, 0, 1, 1,
-1.465664, -1.911533, -3.037115, 0, 0, 0, 1, 1,
-1.464385, -0.1011761, -3.417452, 0, 0, 0, 1, 1,
-1.462531, -1.861882, -1.9724, 0, 0, 0, 1, 1,
-1.450973, -2.451882, -3.36779, 0, 0, 0, 1, 1,
-1.446747, -0.8493648, -2.474955, 0, 0, 0, 1, 1,
-1.436296, -1.292205, -1.577142, 0, 0, 0, 1, 1,
-1.432403, 0.01751462, -1.815612, 0, 0, 0, 1, 1,
-1.419481, -0.02196044, -0.3163138, 1, 1, 1, 1, 1,
-1.41824, 1.840099, 0.2122767, 1, 1, 1, 1, 1,
-1.413299, 1.677203, -1.282493, 1, 1, 1, 1, 1,
-1.399067, -0.6470755, -1.011994, 1, 1, 1, 1, 1,
-1.398675, -0.02787804, -2.863509, 1, 1, 1, 1, 1,
-1.395246, -1.369975, -3.486677, 1, 1, 1, 1, 1,
-1.388729, -1.509127, -4.502968, 1, 1, 1, 1, 1,
-1.377554, 0.7076926, 0.6216677, 1, 1, 1, 1, 1,
-1.362583, 1.414203, 2.278613, 1, 1, 1, 1, 1,
-1.356306, -0.7177632, 0.07092761, 1, 1, 1, 1, 1,
-1.35476, -0.4252341, -0.4780121, 1, 1, 1, 1, 1,
-1.353336, -0.09691505, -2.953974, 1, 1, 1, 1, 1,
-1.352556, -0.623938, -1.42302, 1, 1, 1, 1, 1,
-1.343394, -0.8116706, -0.688266, 1, 1, 1, 1, 1,
-1.337589, 0.7957565, -3.555579, 1, 1, 1, 1, 1,
-1.333398, -1.121603, -2.313053, 0, 0, 1, 1, 1,
-1.327149, 1.390057, -1.536289, 1, 0, 0, 1, 1,
-1.323831, 0.7256708, -1.540467, 1, 0, 0, 1, 1,
-1.317485, -2.086744, -2.551503, 1, 0, 0, 1, 1,
-1.316881, -0.02687179, -1.910954, 1, 0, 0, 1, 1,
-1.316814, 1.587426, -1.793015, 1, 0, 0, 1, 1,
-1.272101, -0.292482, -1.619679, 0, 0, 0, 1, 1,
-1.270699, 1.281388, 0.35527, 0, 0, 0, 1, 1,
-1.26951, 0.2813753, 0.04838999, 0, 0, 0, 1, 1,
-1.257329, -0.4016038, -2.561256, 0, 0, 0, 1, 1,
-1.251444, 0.7961102, -0.2404056, 0, 0, 0, 1, 1,
-1.248626, 1.283622, 0.8660284, 0, 0, 0, 1, 1,
-1.243114, -0.1280795, -3.8238, 0, 0, 0, 1, 1,
-1.238503, 2.294184, -0.4344706, 1, 1, 1, 1, 1,
-1.231554, 0.914942, -1.861639, 1, 1, 1, 1, 1,
-1.230935, -1.504586, -1.447984, 1, 1, 1, 1, 1,
-1.228478, 0.8113466, -1.769921, 1, 1, 1, 1, 1,
-1.220243, -0.03240442, -2.893745, 1, 1, 1, 1, 1,
-1.219677, 0.2779381, -2.39484, 1, 1, 1, 1, 1,
-1.217577, 0.1715323, -1.951672, 1, 1, 1, 1, 1,
-1.213211, 0.1171413, -1.281913, 1, 1, 1, 1, 1,
-1.213138, 0.7025266, -0.899299, 1, 1, 1, 1, 1,
-1.212925, -0.009783807, -0.862622, 1, 1, 1, 1, 1,
-1.210701, -0.7279487, -0.7616203, 1, 1, 1, 1, 1,
-1.204305, -0.2583445, -2.821882, 1, 1, 1, 1, 1,
-1.196414, -0.4922807, -1.748897, 1, 1, 1, 1, 1,
-1.187188, -0.368455, -0.9209679, 1, 1, 1, 1, 1,
-1.182176, 2.073592, -1.939299, 1, 1, 1, 1, 1,
-1.159468, -0.2274869, -1.866066, 0, 0, 1, 1, 1,
-1.150254, -0.04237322, -0.9256231, 1, 0, 0, 1, 1,
-1.135111, 0.3040574, -2.197402, 1, 0, 0, 1, 1,
-1.132054, 0.3942219, -1.167219, 1, 0, 0, 1, 1,
-1.1318, -0.7259602, -3.191439, 1, 0, 0, 1, 1,
-1.12201, -1.294168, -3.668926, 1, 0, 0, 1, 1,
-1.121113, -0.05617822, -2.122405, 0, 0, 0, 1, 1,
-1.115237, -0.4982821, -1.476342, 0, 0, 0, 1, 1,
-1.10734, 0.6235862, -1.18767, 0, 0, 0, 1, 1,
-1.105528, -1.47471, -2.958951, 0, 0, 0, 1, 1,
-1.103997, 0.4652366, -1.40927, 0, 0, 0, 1, 1,
-1.103078, -2.450482, -2.878368, 0, 0, 0, 1, 1,
-1.101068, -0.155251, -0.8687928, 0, 0, 0, 1, 1,
-1.096561, -0.3411756, -0.6023179, 1, 1, 1, 1, 1,
-1.094794, -1.115207, -2.035051, 1, 1, 1, 1, 1,
-1.085167, -0.5507833, -2.880419, 1, 1, 1, 1, 1,
-1.081618, -0.6335021, -2.508506, 1, 1, 1, 1, 1,
-1.074566, -0.4401415, -1.856111, 1, 1, 1, 1, 1,
-1.067732, 0.7384793, -1.250989, 1, 1, 1, 1, 1,
-1.059659, 1.289505, -0.9489654, 1, 1, 1, 1, 1,
-1.056207, -1.236979, -4.307535, 1, 1, 1, 1, 1,
-1.049603, -0.0176035, -1.920215, 1, 1, 1, 1, 1,
-1.043636, -1.0215, -2.304828, 1, 1, 1, 1, 1,
-1.035812, -0.7607372, -1.229881, 1, 1, 1, 1, 1,
-1.034203, 0.6651464, -1.979468, 1, 1, 1, 1, 1,
-1.02829, -0.4740289, -2.070624, 1, 1, 1, 1, 1,
-1.023542, 0.08598842, -0.9631345, 1, 1, 1, 1, 1,
-1.019805, 1.182511, -0.8178589, 1, 1, 1, 1, 1,
-1.018858, 2.098828, -1.020532, 0, 0, 1, 1, 1,
-1.01522, -0.373878, -0.9590521, 1, 0, 0, 1, 1,
-1.013524, -0.4388038, -3.176864, 1, 0, 0, 1, 1,
-1.006544, 1.792272, -1.101985, 1, 0, 0, 1, 1,
-1.004947, -2.886678, -3.690214, 1, 0, 0, 1, 1,
-1.001773, 2.193083, -1.837122, 1, 0, 0, 1, 1,
-0.9959874, -0.733169, -1.919837, 0, 0, 0, 1, 1,
-0.9958442, 0.4172926, -2.07645, 0, 0, 0, 1, 1,
-0.9870791, -0.8470051, -2.562689, 0, 0, 0, 1, 1,
-0.9863141, -0.8809261, -2.849472, 0, 0, 0, 1, 1,
-0.9768831, -0.02124335, -0.2684741, 0, 0, 0, 1, 1,
-0.9747306, 0.3023162, -0.9914663, 0, 0, 0, 1, 1,
-0.9682351, -0.9904594, -2.846802, 0, 0, 0, 1, 1,
-0.9662781, 0.7885388, -1.512204, 1, 1, 1, 1, 1,
-0.9650733, -0.6215895, -2.256195, 1, 1, 1, 1, 1,
-0.9646189, -0.600583, -2.199924, 1, 1, 1, 1, 1,
-0.9600583, 1.098735, -1.700764, 1, 1, 1, 1, 1,
-0.9567475, -1.589811, -2.318029, 1, 1, 1, 1, 1,
-0.9560284, -1.897954, -4.486577, 1, 1, 1, 1, 1,
-0.9550064, -1.07435, -2.477484, 1, 1, 1, 1, 1,
-0.9537758, -0.8112189, -2.877191, 1, 1, 1, 1, 1,
-0.9503372, -0.1429189, -1.874319, 1, 1, 1, 1, 1,
-0.9452183, 0.5131918, -1.005709, 1, 1, 1, 1, 1,
-0.9414958, -0.1579146, -1.060912, 1, 1, 1, 1, 1,
-0.9384917, 1.250971, 0.8687362, 1, 1, 1, 1, 1,
-0.9358279, 0.4961762, -1.61939, 1, 1, 1, 1, 1,
-0.9336847, -1.182391, -3.413674, 1, 1, 1, 1, 1,
-0.9273034, -0.7263328, -3.183191, 1, 1, 1, 1, 1,
-0.927267, 0.1476887, -0.8817625, 0, 0, 1, 1, 1,
-0.9229309, -1.249588, -0.9337011, 1, 0, 0, 1, 1,
-0.9218994, 0.06220937, -2.01421, 1, 0, 0, 1, 1,
-0.9202591, 0.2561658, -1.879755, 1, 0, 0, 1, 1,
-0.9191888, 0.1829639, -3.824886, 1, 0, 0, 1, 1,
-0.8962861, 0.3433512, -1.124019, 1, 0, 0, 1, 1,
-0.8933944, 0.03293572, -1.627305, 0, 0, 0, 1, 1,
-0.892535, 0.1785556, -2.123776, 0, 0, 0, 1, 1,
-0.8881032, -0.4992027, -1.510109, 0, 0, 0, 1, 1,
-0.8859923, -1.436347, -3.434859, 0, 0, 0, 1, 1,
-0.8859848, -0.3249637, -1.081524, 0, 0, 0, 1, 1,
-0.8832037, 0.1897662, -0.9790525, 0, 0, 0, 1, 1,
-0.8811737, -0.4824007, -2.52658, 0, 0, 0, 1, 1,
-0.8809899, 0.6159163, 0.6764926, 1, 1, 1, 1, 1,
-0.8800161, 0.03940218, -0.02725059, 1, 1, 1, 1, 1,
-0.8789714, 0.8128263, -0.3401478, 1, 1, 1, 1, 1,
-0.8734299, 0.6074148, -0.9565817, 1, 1, 1, 1, 1,
-0.8702877, 0.950328, -0.5514354, 1, 1, 1, 1, 1,
-0.8673253, 0.446982, -0.4685178, 1, 1, 1, 1, 1,
-0.8672815, -0.2775076, -2.905111, 1, 1, 1, 1, 1,
-0.8643391, -0.6131175, -3.330289, 1, 1, 1, 1, 1,
-0.8642843, -0.4693567, -1.651853, 1, 1, 1, 1, 1,
-0.8626441, -0.8017685, -3.831537, 1, 1, 1, 1, 1,
-0.8575146, 1.183871, -0.9495053, 1, 1, 1, 1, 1,
-0.8541331, 0.6543403, -2.117442, 1, 1, 1, 1, 1,
-0.8514617, 1.08536, -0.7509778, 1, 1, 1, 1, 1,
-0.8466743, 0.3798189, -0.5001467, 1, 1, 1, 1, 1,
-0.8417181, 0.3795601, -2.356408, 1, 1, 1, 1, 1,
-0.8389526, -1.020995, -0.5114352, 0, 0, 1, 1, 1,
-0.8349428, -2.084051, -2.653296, 1, 0, 0, 1, 1,
-0.8340873, 0.5417317, -1.67069, 1, 0, 0, 1, 1,
-0.8336512, 0.1066803, -2.032005, 1, 0, 0, 1, 1,
-0.82954, -1.026051, -2.314944, 1, 0, 0, 1, 1,
-0.8272854, 0.381153, -2.120904, 1, 0, 0, 1, 1,
-0.816686, -0.3722674, -1.739334, 0, 0, 0, 1, 1,
-0.815387, 0.3112011, -1.23095, 0, 0, 0, 1, 1,
-0.811816, -0.5119603, -0.2906312, 0, 0, 0, 1, 1,
-0.8054919, -0.09495533, -2.824421, 0, 0, 0, 1, 1,
-0.8007033, -0.5805848, -1.908513, 0, 0, 0, 1, 1,
-0.800215, 2.006261, -0.2035765, 0, 0, 0, 1, 1,
-0.7999505, 1.55322, -1.555794, 0, 0, 0, 1, 1,
-0.7987787, 0.913574, -0.8088778, 1, 1, 1, 1, 1,
-0.794551, -1.484097, -1.068152, 1, 1, 1, 1, 1,
-0.7928347, -0.4118732, -2.455601, 1, 1, 1, 1, 1,
-0.7914917, 0.1736988, -1.274802, 1, 1, 1, 1, 1,
-0.7829496, 0.1622176, -1.830126, 1, 1, 1, 1, 1,
-0.7791618, -1.628257, -1.424676, 1, 1, 1, 1, 1,
-0.7717414, 0.130939, -1.155595, 1, 1, 1, 1, 1,
-0.7712662, 0.08822468, -0.7718837, 1, 1, 1, 1, 1,
-0.767145, 0.2797846, -1.305493, 1, 1, 1, 1, 1,
-0.7623928, 0.7239643, 0.3655246, 1, 1, 1, 1, 1,
-0.7603869, -1.269078, -2.967346, 1, 1, 1, 1, 1,
-0.7592481, -1.033009, -4.35182, 1, 1, 1, 1, 1,
-0.75349, -0.4123901, -0.7546683, 1, 1, 1, 1, 1,
-0.7510774, -2.431508, -1.586552, 1, 1, 1, 1, 1,
-0.7329693, 0.227209, -0.5374336, 1, 1, 1, 1, 1,
-0.7325355, -0.343479, -2.688554, 0, 0, 1, 1, 1,
-0.7305334, -0.09815036, -0.1831858, 1, 0, 0, 1, 1,
-0.710858, 1.189444, 0.7239586, 1, 0, 0, 1, 1,
-0.7101914, -0.8243058, -3.001376, 1, 0, 0, 1, 1,
-0.6896084, 0.7459588, -1.353997, 1, 0, 0, 1, 1,
-0.6868303, 0.5231464, -1.728679, 1, 0, 0, 1, 1,
-0.6855803, 0.257507, -1.206407, 0, 0, 0, 1, 1,
-0.6852044, 0.3773577, -0.5600217, 0, 0, 0, 1, 1,
-0.6842492, -0.6634777, -1.18106, 0, 0, 0, 1, 1,
-0.6816242, -0.3600819, -1.32661, 0, 0, 0, 1, 1,
-0.6787735, 1.316326, -2.016013, 0, 0, 0, 1, 1,
-0.6783144, -1.452777, -2.821621, 0, 0, 0, 1, 1,
-0.6781806, 0.2372508, 0.3636784, 0, 0, 0, 1, 1,
-0.6781476, 1.169753, 0.264614, 1, 1, 1, 1, 1,
-0.676457, 0.1330764, -1.682526, 1, 1, 1, 1, 1,
-0.674824, 1.147816, -2.453515, 1, 1, 1, 1, 1,
-0.6714553, 0.2699234, -0.8622524, 1, 1, 1, 1, 1,
-0.6677839, -0.3280538, -4.133055, 1, 1, 1, 1, 1,
-0.6644896, -1.424597, -1.387399, 1, 1, 1, 1, 1,
-0.6635195, -1.022597, -4.079086, 1, 1, 1, 1, 1,
-0.6613518, 0.365171, -0.5774729, 1, 1, 1, 1, 1,
-0.6602581, 1.461064, -0.08323732, 1, 1, 1, 1, 1,
-0.6597994, -0.5807785, -0.0767538, 1, 1, 1, 1, 1,
-0.659273, -0.1630144, -3.424055, 1, 1, 1, 1, 1,
-0.6543139, -0.6652369, -1.182998, 1, 1, 1, 1, 1,
-0.6510265, 1.137003, -0.7792172, 1, 1, 1, 1, 1,
-0.6375872, -0.2839332, -3.209761, 1, 1, 1, 1, 1,
-0.6369889, 0.315198, -1.332721, 1, 1, 1, 1, 1,
-0.6363633, -0.01450753, -2.274337, 0, 0, 1, 1, 1,
-0.6284775, -0.1178251, -3.020934, 1, 0, 0, 1, 1,
-0.620936, 0.01767066, -1.410689, 1, 0, 0, 1, 1,
-0.6193061, -0.4236211, -2.439114, 1, 0, 0, 1, 1,
-0.6170157, -1.137804, -2.83992, 1, 0, 0, 1, 1,
-0.614103, 0.5551509, -0.2120917, 1, 0, 0, 1, 1,
-0.6135997, 0.6066317, -1.651468, 0, 0, 0, 1, 1,
-0.6114309, 0.6746482, -3.023892, 0, 0, 0, 1, 1,
-0.6061583, 1.687716, -1.173702, 0, 0, 0, 1, 1,
-0.6051998, -0.2586007, -2.840218, 0, 0, 0, 1, 1,
-0.599043, -1.817844, -2.619987, 0, 0, 0, 1, 1,
-0.5980714, 0.09023628, -0.8634205, 0, 0, 0, 1, 1,
-0.5974171, 0.5820696, 0.3391052, 0, 0, 0, 1, 1,
-0.5971507, -0.4466542, -1.463738, 1, 1, 1, 1, 1,
-0.5895311, -0.8825518, -2.140629, 1, 1, 1, 1, 1,
-0.5894126, -0.2886368, -2.521412, 1, 1, 1, 1, 1,
-0.5861055, -0.5325971, -2.091109, 1, 1, 1, 1, 1,
-0.5846446, -2.063376, -2.340901, 1, 1, 1, 1, 1,
-0.5837144, 0.1426877, -2.202426, 1, 1, 1, 1, 1,
-0.5830856, -0.6012357, -2.20416, 1, 1, 1, 1, 1,
-0.5798537, -0.144576, -2.269255, 1, 1, 1, 1, 1,
-0.5794207, 0.6826343, -0.5767421, 1, 1, 1, 1, 1,
-0.5778559, 0.01161832, -2.264324, 1, 1, 1, 1, 1,
-0.5736037, -0.2981597, -1.928649, 1, 1, 1, 1, 1,
-0.5679148, 0.9037365, 0.1378618, 1, 1, 1, 1, 1,
-0.5659024, -1.302591, -2.711016, 1, 1, 1, 1, 1,
-0.5541234, -0.9782486, -1.322008, 1, 1, 1, 1, 1,
-0.5532582, 1.207364, -2.176507, 1, 1, 1, 1, 1,
-0.550994, -1.69355, -4.419508, 0, 0, 1, 1, 1,
-0.5489591, -1.101414, -2.765478, 1, 0, 0, 1, 1,
-0.5436175, -0.5915622, -0.9397526, 1, 0, 0, 1, 1,
-0.5426599, -0.09519533, -0.1279751, 1, 0, 0, 1, 1,
-0.5321645, -0.6017147, -0.8579827, 1, 0, 0, 1, 1,
-0.5262125, -0.4568686, -1.113571, 1, 0, 0, 1, 1,
-0.5234872, -0.5782952, -2.234654, 0, 0, 0, 1, 1,
-0.5219351, 2.034128, -0.7787376, 0, 0, 0, 1, 1,
-0.5204313, -0.2113604, -3.252502, 0, 0, 0, 1, 1,
-0.5201875, -0.4023727, -1.73102, 0, 0, 0, 1, 1,
-0.5198067, 2.420289, -1.273878, 0, 0, 0, 1, 1,
-0.5178686, -0.3502883, -2.67674, 0, 0, 0, 1, 1,
-0.5175374, 0.8204159, 0.210287, 0, 0, 0, 1, 1,
-0.5144057, -2.44942, -3.061985, 1, 1, 1, 1, 1,
-0.5022387, -1.609563, -2.386814, 1, 1, 1, 1, 1,
-0.5007019, -0.6830449, -2.09099, 1, 1, 1, 1, 1,
-0.5002307, 0.7131749, -0.4023247, 1, 1, 1, 1, 1,
-0.4998863, 1.109195, -0.6927778, 1, 1, 1, 1, 1,
-0.4948248, -0.5452013, -2.945254, 1, 1, 1, 1, 1,
-0.4940184, -0.8052501, -2.243924, 1, 1, 1, 1, 1,
-0.493544, -0.8492402, -1.506832, 1, 1, 1, 1, 1,
-0.4915987, -0.05451599, -0.1885573, 1, 1, 1, 1, 1,
-0.4889838, 0.4167694, -2.114488, 1, 1, 1, 1, 1,
-0.4796638, 1.774184, 1.116206, 1, 1, 1, 1, 1,
-0.478947, -0.005908385, -1.791124, 1, 1, 1, 1, 1,
-0.4762994, 1.675914, 0.4723215, 1, 1, 1, 1, 1,
-0.4752364, -0.7096912, -1.356593, 1, 1, 1, 1, 1,
-0.4639359, 0.001350057, -0.1386731, 1, 1, 1, 1, 1,
-0.4627753, -0.3335099, -1.245376, 0, 0, 1, 1, 1,
-0.4556075, -1.05224, -1.825937, 1, 0, 0, 1, 1,
-0.4531853, 1.867431, 0.7180406, 1, 0, 0, 1, 1,
-0.4531743, 0.6841879, -0.9078047, 1, 0, 0, 1, 1,
-0.4498899, 0.6981192, -1.339911, 1, 0, 0, 1, 1,
-0.4436909, -1.753402, -5.180979, 1, 0, 0, 1, 1,
-0.4428219, 1.351722, -0.2479288, 0, 0, 0, 1, 1,
-0.4427901, 0.9951416, 0.1652472, 0, 0, 0, 1, 1,
-0.440497, -0.6682515, -1.908819, 0, 0, 0, 1, 1,
-0.4399586, 0.09682105, -2.288549, 0, 0, 0, 1, 1,
-0.4393061, -1.287557, -2.33535, 0, 0, 0, 1, 1,
-0.4387052, -0.2795833, -2.228074, 0, 0, 0, 1, 1,
-0.4379635, 1.052939, -0.749952, 0, 0, 0, 1, 1,
-0.4374487, 0.08278836, -1.439325, 1, 1, 1, 1, 1,
-0.4350609, -1.292701, -1.326526, 1, 1, 1, 1, 1,
-0.434036, -1.107422, -2.464194, 1, 1, 1, 1, 1,
-0.43314, 2.09247, -0.6924301, 1, 1, 1, 1, 1,
-0.4296376, -1.412856, -1.988132, 1, 1, 1, 1, 1,
-0.4268086, -0.8989271, -3.757537, 1, 1, 1, 1, 1,
-0.4259869, 0.09719553, -0.5362483, 1, 1, 1, 1, 1,
-0.4257016, 0.4514687, -0.8537583, 1, 1, 1, 1, 1,
-0.4243899, -0.906449, -4.161288, 1, 1, 1, 1, 1,
-0.4240195, -0.4515502, -4.029779, 1, 1, 1, 1, 1,
-0.4233798, 0.6067299, -0.09551485, 1, 1, 1, 1, 1,
-0.423318, 0.1051195, -0.5399773, 1, 1, 1, 1, 1,
-0.4151625, -1.17684, -3.615901, 1, 1, 1, 1, 1,
-0.4133992, 0.4668774, 0.6064187, 1, 1, 1, 1, 1,
-0.4121991, -0.01410409, -2.470504, 1, 1, 1, 1, 1,
-0.4118029, 0.06801395, -0.8148493, 0, 0, 1, 1, 1,
-0.410534, 0.1192991, -1.797867, 1, 0, 0, 1, 1,
-0.4078196, -0.6891575, -1.963193, 1, 0, 0, 1, 1,
-0.406193, -1.19451, -2.661431, 1, 0, 0, 1, 1,
-0.4050563, -0.7347733, -2.9998, 1, 0, 0, 1, 1,
-0.4044487, 0.5402315, -0.5353203, 1, 0, 0, 1, 1,
-0.4003716, -0.7346798, -5.608816, 0, 0, 0, 1, 1,
-0.3993723, 0.245802, -1.264163, 0, 0, 0, 1, 1,
-0.3974898, -1.560847, -3.079368, 0, 0, 0, 1, 1,
-0.3912797, 0.06425647, -2.199352, 0, 0, 0, 1, 1,
-0.3904519, 0.2228382, -1.14699, 0, 0, 0, 1, 1,
-0.3888042, 1.044241, 0.9882867, 0, 0, 0, 1, 1,
-0.3878437, 0.1234654, -0.8338127, 0, 0, 0, 1, 1,
-0.3870159, -0.4850452, -3.116224, 1, 1, 1, 1, 1,
-0.3863395, 0.2761315, -1.544366, 1, 1, 1, 1, 1,
-0.3815033, 2.323608, -1.590969, 1, 1, 1, 1, 1,
-0.3788499, 0.08140478, -1.760492, 1, 1, 1, 1, 1,
-0.3760945, -0.8031403, -1.597433, 1, 1, 1, 1, 1,
-0.375823, 0.7252384, 1.735911, 1, 1, 1, 1, 1,
-0.3733115, 0.1513689, -1.042623, 1, 1, 1, 1, 1,
-0.3720124, 0.04930576, -0.4322031, 1, 1, 1, 1, 1,
-0.3703489, -0.2628427, -2.624562, 1, 1, 1, 1, 1,
-0.3701794, -0.1516261, -2.392843, 1, 1, 1, 1, 1,
-0.3700505, -0.6917377, -3.871334, 1, 1, 1, 1, 1,
-0.3686414, 0.6867018, -0.4686523, 1, 1, 1, 1, 1,
-0.3606767, 0.6293396, 1.591215, 1, 1, 1, 1, 1,
-0.3589701, 0.6669976, 0.8389102, 1, 1, 1, 1, 1,
-0.3537094, -0.8750345, -1.367424, 1, 1, 1, 1, 1,
-0.3493247, -2.246019, -3.350695, 0, 0, 1, 1, 1,
-0.348933, 0.3353873, -0.6580315, 1, 0, 0, 1, 1,
-0.3450887, 0.4663533, -0.06995872, 1, 0, 0, 1, 1,
-0.3409874, 0.5752906, -0.1187886, 1, 0, 0, 1, 1,
-0.3351166, 0.3266254, -0.1157387, 1, 0, 0, 1, 1,
-0.3329328, -0.1605562, -4.115615, 1, 0, 0, 1, 1,
-0.3293357, -0.1750436, -2.409619, 0, 0, 0, 1, 1,
-0.327185, -0.989537, -3.243803, 0, 0, 0, 1, 1,
-0.3221229, -0.2437031, -2.964173, 0, 0, 0, 1, 1,
-0.3197172, 0.9451907, -1.100265, 0, 0, 0, 1, 1,
-0.3190435, 1.465216, 0.1016203, 0, 0, 0, 1, 1,
-0.3183452, -0.3171757, -1.290106, 0, 0, 0, 1, 1,
-0.3170672, -0.7855486, -2.770353, 0, 0, 0, 1, 1,
-0.3152048, 0.6492527, -1.023541, 1, 1, 1, 1, 1,
-0.3132044, -0.144037, -1.555984, 1, 1, 1, 1, 1,
-0.3131726, 1.453771, -0.6503537, 1, 1, 1, 1, 1,
-0.3111701, -1.083311, -2.795506, 1, 1, 1, 1, 1,
-0.3059956, 2.030883, -0.5606558, 1, 1, 1, 1, 1,
-0.2956177, 2.706945, -0.07168777, 1, 1, 1, 1, 1,
-0.2896244, -0.964835, -2.701755, 1, 1, 1, 1, 1,
-0.2896233, -0.7037195, -3.154153, 1, 1, 1, 1, 1,
-0.2884495, 0.3687665, -0.6815809, 1, 1, 1, 1, 1,
-0.2877768, -0.6469282, -3.59225, 1, 1, 1, 1, 1,
-0.2874595, -0.5674109, -1.792883, 1, 1, 1, 1, 1,
-0.2851277, 0.1848967, -0.9810781, 1, 1, 1, 1, 1,
-0.2845094, 0.7801216, -0.8344452, 1, 1, 1, 1, 1,
-0.2820881, 0.5390676, -1.556756, 1, 1, 1, 1, 1,
-0.2792497, -0.8553395, -2.196011, 1, 1, 1, 1, 1,
-0.2767493, -0.7482548, -3.855712, 0, 0, 1, 1, 1,
-0.276089, 0.4371355, -1.575164, 1, 0, 0, 1, 1,
-0.2703707, 1.131231, 1.262219, 1, 0, 0, 1, 1,
-0.2652233, -0.3639358, -2.994224, 1, 0, 0, 1, 1,
-0.2643176, -0.3714039, -3.649072, 1, 0, 0, 1, 1,
-0.263883, -1.065787, -1.897212, 1, 0, 0, 1, 1,
-0.2601315, 1.704598, -0.6857425, 0, 0, 0, 1, 1,
-0.257272, 0.4332947, -1.912776, 0, 0, 0, 1, 1,
-0.2571555, -0.4078488, -3.152794, 0, 0, 0, 1, 1,
-0.2568776, 0.8633882, -0.5507098, 0, 0, 0, 1, 1,
-0.2540975, -1.338439, -3.986592, 0, 0, 0, 1, 1,
-0.2502984, 0.5303118, 0.1523007, 0, 0, 0, 1, 1,
-0.2418347, 1.166152, -1.076216, 0, 0, 0, 1, 1,
-0.2368278, 0.5783343, 0.6797682, 1, 1, 1, 1, 1,
-0.2348325, -0.5004964, -3.921198, 1, 1, 1, 1, 1,
-0.2301337, -0.7186031, -2.214492, 1, 1, 1, 1, 1,
-0.2244844, 0.5408835, -0.9310824, 1, 1, 1, 1, 1,
-0.2150525, 0.8454383, 1.278415, 1, 1, 1, 1, 1,
-0.2067301, 0.7679677, 0.7441723, 1, 1, 1, 1, 1,
-0.2037102, 0.6217645, -0.8479521, 1, 1, 1, 1, 1,
-0.1990772, -1.523599, -2.986626, 1, 1, 1, 1, 1,
-0.1980811, 0.5947063, -0.02695144, 1, 1, 1, 1, 1,
-0.1977087, 0.9208784, 1.758077, 1, 1, 1, 1, 1,
-0.1974891, 1.06949, 0.7170081, 1, 1, 1, 1, 1,
-0.194044, -0.4965915, -2.714345, 1, 1, 1, 1, 1,
-0.1939845, -0.2393789, -2.377101, 1, 1, 1, 1, 1,
-0.1850902, 2.648496, -0.634925, 1, 1, 1, 1, 1,
-0.1829404, 1.217416, -0.9338622, 1, 1, 1, 1, 1,
-0.1824664, 0.2327955, -1.111485, 0, 0, 1, 1, 1,
-0.1819209, 0.7433665, 0.8674704, 1, 0, 0, 1, 1,
-0.1798963, -0.5024031, -4.97339, 1, 0, 0, 1, 1,
-0.1777235, -0.2935353, -2.4249, 1, 0, 0, 1, 1,
-0.1702761, -0.1500666, -3.521984, 1, 0, 0, 1, 1,
-0.1634926, -0.21644, -4.134406, 1, 0, 0, 1, 1,
-0.1633734, -0.765433, -3.155247, 0, 0, 0, 1, 1,
-0.1609126, -0.7101271, -2.324136, 0, 0, 0, 1, 1,
-0.1604392, 0.1958932, -1.293534, 0, 0, 0, 1, 1,
-0.1589735, 0.2245082, -0.09826328, 0, 0, 0, 1, 1,
-0.1540922, -0.09495597, -1.510897, 0, 0, 0, 1, 1,
-0.1430115, 0.06170716, -1.614446, 0, 0, 0, 1, 1,
-0.1408448, -0.09670059, -0.8245354, 0, 0, 0, 1, 1,
-0.1378054, 0.3770939, -1.468816, 1, 1, 1, 1, 1,
-0.136738, -0.6256304, -2.448805, 1, 1, 1, 1, 1,
-0.134377, -0.03353342, -0.796295, 1, 1, 1, 1, 1,
-0.1304853, 0.1067671, -1.374372, 1, 1, 1, 1, 1,
-0.1298685, -1.886209, -3.733611, 1, 1, 1, 1, 1,
-0.1276925, -0.2002038, -3.638349, 1, 1, 1, 1, 1,
-0.1273438, 0.0108415, -2.599961, 1, 1, 1, 1, 1,
-0.1269814, 0.02323383, -2.040241, 1, 1, 1, 1, 1,
-0.1256045, -0.4056013, -2.263035, 1, 1, 1, 1, 1,
-0.1236516, -0.9616668, -3.068347, 1, 1, 1, 1, 1,
-0.116696, 0.1885486, -0.07590547, 1, 1, 1, 1, 1,
-0.1163371, -0.345363, -2.228841, 1, 1, 1, 1, 1,
-0.1142499, 1.544403, 0.6612656, 1, 1, 1, 1, 1,
-0.1131688, 0.8648281, -0.519872, 1, 1, 1, 1, 1,
-0.1112614, 3.438044, 1.711638, 1, 1, 1, 1, 1,
-0.1096046, 0.6232305, -1.690368, 0, 0, 1, 1, 1,
-0.09832308, 1.856169, -0.9272192, 1, 0, 0, 1, 1,
-0.09645347, 0.9063675, -1.976015, 1, 0, 0, 1, 1,
-0.09403577, -0.1640838, -2.68111, 1, 0, 0, 1, 1,
-0.09058381, 0.3277506, -0.5090498, 1, 0, 0, 1, 1,
-0.08980208, -1.909778, -2.542606, 1, 0, 0, 1, 1,
-0.08934929, 1.204418, 0.6614003, 0, 0, 0, 1, 1,
-0.08671407, 0.2626114, -1.083902, 0, 0, 0, 1, 1,
-0.0858982, -0.6738351, -2.079851, 0, 0, 0, 1, 1,
-0.08419283, 0.7089881, 0.4446048, 0, 0, 0, 1, 1,
-0.08307967, 0.1859587, 1.156136, 0, 0, 0, 1, 1,
-0.07740696, 2.188402, 0.8398597, 0, 0, 0, 1, 1,
-0.0769499, -0.07435032, -3.388943, 0, 0, 0, 1, 1,
-0.0701053, -0.4373468, -3.392766, 1, 1, 1, 1, 1,
-0.06961756, 0.3463731, 1.004662, 1, 1, 1, 1, 1,
-0.06959318, -0.145321, -2.501375, 1, 1, 1, 1, 1,
-0.06858182, 1.768331, 1.277319, 1, 1, 1, 1, 1,
-0.06519616, -0.6971219, -2.268134, 1, 1, 1, 1, 1,
-0.06167574, -2.483365, -4.286034, 1, 1, 1, 1, 1,
-0.0566773, -1.794797, -3.881556, 1, 1, 1, 1, 1,
-0.05589278, 0.5520806, 0.4490191, 1, 1, 1, 1, 1,
-0.05510404, 0.241588, 0.04473137, 1, 1, 1, 1, 1,
-0.05288567, 0.7028735, 1.655662, 1, 1, 1, 1, 1,
-0.05140194, 0.70829, -0.246379, 1, 1, 1, 1, 1,
-0.04894256, -1.66394, -2.446032, 1, 1, 1, 1, 1,
-0.04606511, -1.485392, -2.237299, 1, 1, 1, 1, 1,
-0.04220794, 0.2590447, -1.157713, 1, 1, 1, 1, 1,
-0.03961894, -0.5837042, -4.733235, 1, 1, 1, 1, 1,
-0.03388645, -0.6825181, -2.25749, 0, 0, 1, 1, 1,
-0.03249366, -1.100963, -3.251076, 1, 0, 0, 1, 1,
-0.02926925, -0.1758783, -2.393577, 1, 0, 0, 1, 1,
-0.02513066, -0.4393032, -4.93475, 1, 0, 0, 1, 1,
-0.02437019, 1.038612, -1.345437, 1, 0, 0, 1, 1,
-0.02355652, 2.06582, 0.4046881, 1, 0, 0, 1, 1,
-0.02338001, 0.7125151, -0.08598942, 0, 0, 0, 1, 1,
-0.02323198, -0.3966353, -3.90611, 0, 0, 0, 1, 1,
-0.02080027, -0.08426277, -4.129407, 0, 0, 0, 1, 1,
-0.01154352, 0.1069121, -1.363243, 0, 0, 0, 1, 1,
-0.01098044, -1.57486, -3.145217, 0, 0, 0, 1, 1,
-0.009904657, -0.6998298, -3.266137, 0, 0, 0, 1, 1,
-0.009897546, 0.2115443, -0.7822918, 0, 0, 0, 1, 1,
-0.007269511, 0.2010901, 1.132715, 1, 1, 1, 1, 1,
-0.005233638, 0.5648698, -0.2179191, 1, 1, 1, 1, 1,
-0.00307559, 0.5839519, -1.386587, 1, 1, 1, 1, 1,
-0.001920119, -1.237805, -3.39429, 1, 1, 1, 1, 1,
-0.001371979, -1.454086, -2.672778, 1, 1, 1, 1, 1,
-0.001309798, -0.08290327, -2.68212, 1, 1, 1, 1, 1,
0.004896596, -0.7507466, 3.410552, 1, 1, 1, 1, 1,
0.008954669, -1.474978, 3.918981, 1, 1, 1, 1, 1,
0.01287208, -2.866226, 2.225097, 1, 1, 1, 1, 1,
0.01352211, -0.4116305, 4.792796, 1, 1, 1, 1, 1,
0.03355423, -0.2673552, 3.303007, 1, 1, 1, 1, 1,
0.03542732, -0.9925399, 3.957824, 1, 1, 1, 1, 1,
0.04127017, 0.9204814, 0.1445193, 1, 1, 1, 1, 1,
0.04493115, 1.592449, 0.5065317, 1, 1, 1, 1, 1,
0.04759741, -0.6304695, 3.000045, 1, 1, 1, 1, 1,
0.04890241, 0.116003, 1.649574, 0, 0, 1, 1, 1,
0.05023573, 0.01243028, 1.428952, 1, 0, 0, 1, 1,
0.05037935, -1.966121, 3.844349, 1, 0, 0, 1, 1,
0.05162058, 0.2036302, -0.2969906, 1, 0, 0, 1, 1,
0.05255417, -0.7487997, 2.697108, 1, 0, 0, 1, 1,
0.05357272, 0.2020108, -0.5660026, 1, 0, 0, 1, 1,
0.05464928, 0.7819398, 0.1847888, 0, 0, 0, 1, 1,
0.05732052, -0.8010103, 2.96474, 0, 0, 0, 1, 1,
0.05945523, 0.7950665, 0.398287, 0, 0, 0, 1, 1,
0.06219953, -1.422346, 2.194766, 0, 0, 0, 1, 1,
0.06243093, 0.2214792, 0.09718297, 0, 0, 0, 1, 1,
0.06276856, -1.545236, 2.629829, 0, 0, 0, 1, 1,
0.06313951, 1.147581, -1.155071, 0, 0, 0, 1, 1,
0.06333811, -0.1739846, 2.876233, 1, 1, 1, 1, 1,
0.06513788, 0.4230224, -0.102264, 1, 1, 1, 1, 1,
0.06987549, 0.5855632, 0.1444165, 1, 1, 1, 1, 1,
0.07028648, -0.274618, 3.149894, 1, 1, 1, 1, 1,
0.07114018, -0.4869186, 3.33163, 1, 1, 1, 1, 1,
0.07199281, 0.1003158, 1.229576, 1, 1, 1, 1, 1,
0.07440393, -1.143347, 4.301518, 1, 1, 1, 1, 1,
0.07572123, -0.1838345, 3.669213, 1, 1, 1, 1, 1,
0.08269434, -1.604863, 2.562349, 1, 1, 1, 1, 1,
0.08407816, -0.6777918, 3.572727, 1, 1, 1, 1, 1,
0.08696355, -1.635169, 2.68981, 1, 1, 1, 1, 1,
0.08953506, -0.03748181, 2.4762, 1, 1, 1, 1, 1,
0.09063391, 0.6062856, -0.6303652, 1, 1, 1, 1, 1,
0.09640142, 1.069718, -1.985741, 1, 1, 1, 1, 1,
0.1027933, -1.397348, 2.428746, 1, 1, 1, 1, 1,
0.1037287, -0.3820132, 2.129355, 0, 0, 1, 1, 1,
0.1044124, -0.4394037, 4.487574, 1, 0, 0, 1, 1,
0.1093481, 0.06578394, 0.1951172, 1, 0, 0, 1, 1,
0.1124898, -1.674775, 3.197933, 1, 0, 0, 1, 1,
0.1151771, -0.06479752, 2.437099, 1, 0, 0, 1, 1,
0.1155541, 0.8087361, 0.3541231, 1, 0, 0, 1, 1,
0.1181464, -0.7886803, 2.766703, 0, 0, 0, 1, 1,
0.119231, -0.5693702, 2.469959, 0, 0, 0, 1, 1,
0.1222767, 0.05199161, 1.26018, 0, 0, 0, 1, 1,
0.1228755, 2.849847, -0.1402176, 0, 0, 0, 1, 1,
0.1232685, 0.7538987, 1.399693, 0, 0, 0, 1, 1,
0.1235293, 1.651492, 1.027145, 0, 0, 0, 1, 1,
0.1258071, -0.1971334, 3.341891, 0, 0, 0, 1, 1,
0.1281217, 1.421644, -0.4756716, 1, 1, 1, 1, 1,
0.1290709, 1.049695, -0.4881764, 1, 1, 1, 1, 1,
0.1292256, 0.6338658, -0.8084086, 1, 1, 1, 1, 1,
0.1336684, 0.8486554, 1.116434, 1, 1, 1, 1, 1,
0.134273, 1.308774, -2.767732, 1, 1, 1, 1, 1,
0.1388818, 1.220834, 0.6035458, 1, 1, 1, 1, 1,
0.139185, -0.8404366, 1.586286, 1, 1, 1, 1, 1,
0.139773, -1.278488, 3.821078, 1, 1, 1, 1, 1,
0.1439283, -1.274937, 1.902476, 1, 1, 1, 1, 1,
0.1457368, 0.3950493, -0.3921034, 1, 1, 1, 1, 1,
0.1467754, 0.760528, -0.8569597, 1, 1, 1, 1, 1,
0.1506946, -0.507684, 2.347886, 1, 1, 1, 1, 1,
0.1547813, 1.829931, 1.160981, 1, 1, 1, 1, 1,
0.1607016, -1.178512, 3.512223, 1, 1, 1, 1, 1,
0.1613975, 0.8122497, -0.3883849, 1, 1, 1, 1, 1,
0.1614893, 2.374604, -0.3645556, 0, 0, 1, 1, 1,
0.1620089, 0.1295595, 0.6783848, 1, 0, 0, 1, 1,
0.1655987, -1.368665, 2.674304, 1, 0, 0, 1, 1,
0.1675618, 1.199417, 0.5686556, 1, 0, 0, 1, 1,
0.1686815, 2.927484, 1.150718, 1, 0, 0, 1, 1,
0.1727279, -0.5174657, 4.184294, 1, 0, 0, 1, 1,
0.1728708, -0.1172447, 2.333316, 0, 0, 0, 1, 1,
0.1820626, 0.9291765, 0.4616065, 0, 0, 0, 1, 1,
0.1822149, -0.6327885, 3.829736, 0, 0, 0, 1, 1,
0.182579, 0.06608559, 0.7740172, 0, 0, 0, 1, 1,
0.1840354, -1.772175, 0.9387938, 0, 0, 0, 1, 1,
0.1865515, 0.2694668, 1.857946, 0, 0, 0, 1, 1,
0.1898332, -1.746167, 2.578334, 0, 0, 0, 1, 1,
0.1912289, -0.07397909, 0.7847959, 1, 1, 1, 1, 1,
0.1989127, -1.943129, 5.241944, 1, 1, 1, 1, 1,
0.2002279, -0.0360294, 3.042173, 1, 1, 1, 1, 1,
0.2012107, 0.251584, 0.9406293, 1, 1, 1, 1, 1,
0.2033328, -1.454113, 2.538036, 1, 1, 1, 1, 1,
0.2061619, 1.36687, 0.4931629, 1, 1, 1, 1, 1,
0.2094602, 0.3930987, 1.699219, 1, 1, 1, 1, 1,
0.212032, -0.5534807, 3.282081, 1, 1, 1, 1, 1,
0.214064, 0.4673454, -0.01505225, 1, 1, 1, 1, 1,
0.2235827, -0.2330673, 0.7507031, 1, 1, 1, 1, 1,
0.2236557, -0.5349205, 3.02233, 1, 1, 1, 1, 1,
0.2259946, 2.089024, -0.5202974, 1, 1, 1, 1, 1,
0.2265622, -1.747767, 1.770684, 1, 1, 1, 1, 1,
0.2279141, 0.1928216, -0.8776796, 1, 1, 1, 1, 1,
0.2281579, 0.07106545, 1.612983, 1, 1, 1, 1, 1,
0.2285326, 1.411853, 0.9804901, 0, 0, 1, 1, 1,
0.2303913, 0.440849, 0.7300264, 1, 0, 0, 1, 1,
0.2328959, 1.764481, 0.4361602, 1, 0, 0, 1, 1,
0.2364961, 0.8687692, 2.283583, 1, 0, 0, 1, 1,
0.2392405, -0.5959803, 3.247185, 1, 0, 0, 1, 1,
0.2436664, -0.5926209, 2.538926, 1, 0, 0, 1, 1,
0.2472595, 1.19807, -0.0304985, 0, 0, 0, 1, 1,
0.2484245, 0.4200452, 1.449328, 0, 0, 0, 1, 1,
0.2488489, 1.134562, 0.6089429, 0, 0, 0, 1, 1,
0.2508798, -1.332008, 2.250459, 0, 0, 0, 1, 1,
0.2508985, -0.3609671, 2.56763, 0, 0, 0, 1, 1,
0.2569654, 0.6172151, 0.8348072, 0, 0, 0, 1, 1,
0.2604324, -0.911852, 3.032764, 0, 0, 0, 1, 1,
0.2606228, 0.4850112, 1.092455, 1, 1, 1, 1, 1,
0.2617734, -1.460566, 4.159851, 1, 1, 1, 1, 1,
0.2654399, 0.3307015, 0.2392543, 1, 1, 1, 1, 1,
0.2678806, -0.8025426, 5.669101, 1, 1, 1, 1, 1,
0.2690715, -1.67738, 2.969162, 1, 1, 1, 1, 1,
0.2715812, 0.7239187, 1.23284, 1, 1, 1, 1, 1,
0.2717324, 0.8881891, 0.9892395, 1, 1, 1, 1, 1,
0.2746676, 0.8548489, -1.829679, 1, 1, 1, 1, 1,
0.2752101, -1.216545, 4.191718, 1, 1, 1, 1, 1,
0.2758018, 0.20937, 0.7582723, 1, 1, 1, 1, 1,
0.2760783, 0.8900044, 1.102851, 1, 1, 1, 1, 1,
0.2786332, 0.5777417, 0.1702532, 1, 1, 1, 1, 1,
0.2810428, -0.1210419, 2.538671, 1, 1, 1, 1, 1,
0.2840719, 0.542889, -0.1624329, 1, 1, 1, 1, 1,
0.2849548, -1.771266, 3.03616, 1, 1, 1, 1, 1,
0.2850325, 0.4798389, -0.1095599, 0, 0, 1, 1, 1,
0.285425, -0.5335289, 3.117616, 1, 0, 0, 1, 1,
0.2899869, -0.1193333, 1.874712, 1, 0, 0, 1, 1,
0.2900854, -0.1308791, 2.638987, 1, 0, 0, 1, 1,
0.2959333, 0.3602323, -0.4865417, 1, 0, 0, 1, 1,
0.2968464, -0.09516662, 1.494488, 1, 0, 0, 1, 1,
0.2975776, -0.3780352, 2.014393, 0, 0, 0, 1, 1,
0.2981625, -1.066535, 1.788579, 0, 0, 0, 1, 1,
0.3046536, -0.07107194, 2.427573, 0, 0, 0, 1, 1,
0.3158669, 2.777677, -0.0254785, 0, 0, 0, 1, 1,
0.3171958, -0.842812, 2.820435, 0, 0, 0, 1, 1,
0.3195384, -2.037266, 3.03053, 0, 0, 0, 1, 1,
0.3201139, 0.4300886, 1.477642, 0, 0, 0, 1, 1,
0.3249913, -1.944682, 3.79892, 1, 1, 1, 1, 1,
0.3252108, -1.049639, 2.561015, 1, 1, 1, 1, 1,
0.3264152, 0.8436651, 1.008765, 1, 1, 1, 1, 1,
0.3265331, 2.001358, 1.619022, 1, 1, 1, 1, 1,
0.3284619, 1.298311, 0.5175107, 1, 1, 1, 1, 1,
0.3441459, 1.740185, -0.6375878, 1, 1, 1, 1, 1,
0.3464813, -0.02677265, 0.7856373, 1, 1, 1, 1, 1,
0.3469945, 0.7037846, 2.026954, 1, 1, 1, 1, 1,
0.3523048, -0.1924694, 2.534772, 1, 1, 1, 1, 1,
0.3528378, -0.7683315, 3.042497, 1, 1, 1, 1, 1,
0.3537458, -0.6656949, 2.951976, 1, 1, 1, 1, 1,
0.355122, 1.801904, -1.01551, 1, 1, 1, 1, 1,
0.356317, -0.7837238, 0.9084288, 1, 1, 1, 1, 1,
0.3607846, 0.6242989, 1.886111, 1, 1, 1, 1, 1,
0.363746, 0.3114803, 0.1982677, 1, 1, 1, 1, 1,
0.36395, 0.1558977, 0.08662362, 0, 0, 1, 1, 1,
0.36472, 0.8162604, 0.7784616, 1, 0, 0, 1, 1,
0.367167, 1.144833, 1.836093, 1, 0, 0, 1, 1,
0.3692377, 1.218874, -0.2351397, 1, 0, 0, 1, 1,
0.3700095, -0.8044711, 2.934415, 1, 0, 0, 1, 1,
0.3701527, 0.5346861, -0.2317528, 1, 0, 0, 1, 1,
0.3828665, 1.064916, 0.08426555, 0, 0, 0, 1, 1,
0.3841239, 0.7954835, -0.3849817, 0, 0, 0, 1, 1,
0.3922161, -1.969689, 3.288484, 0, 0, 0, 1, 1,
0.4037012, 1.230181, -0.676782, 0, 0, 0, 1, 1,
0.4166581, -1.390096, 3.621378, 0, 0, 0, 1, 1,
0.4202861, 1.614561, 0.3542107, 0, 0, 0, 1, 1,
0.4207976, -0.06125463, 1.299259, 0, 0, 0, 1, 1,
0.4236116, -1.963038, 3.057544, 1, 1, 1, 1, 1,
0.4303308, 1.281894, 0.8977233, 1, 1, 1, 1, 1,
0.4318549, -0.1614263, 2.878099, 1, 1, 1, 1, 1,
0.4334866, -1.753871, 2.53382, 1, 1, 1, 1, 1,
0.4336928, -0.1804656, 1.541058, 1, 1, 1, 1, 1,
0.4359067, 0.854851, 1.53835, 1, 1, 1, 1, 1,
0.4359851, 0.1262432, 1.004104, 1, 1, 1, 1, 1,
0.4378066, 0.108256, 1.817731, 1, 1, 1, 1, 1,
0.4435471, -3.143493, 3.054969, 1, 1, 1, 1, 1,
0.4501012, -0.277537, 0.6257737, 1, 1, 1, 1, 1,
0.4511858, -0.2639726, 2.491653, 1, 1, 1, 1, 1,
0.4551415, 2.775945, -0.4639361, 1, 1, 1, 1, 1,
0.4567371, 0.4193682, 2.379407, 1, 1, 1, 1, 1,
0.4575251, 1.094126, 0.455943, 1, 1, 1, 1, 1,
0.4612301, -0.1714946, 0.07502826, 1, 1, 1, 1, 1,
0.4621606, 0.9493857, -1.471114, 0, 0, 1, 1, 1,
0.4627738, -2.110698, 4.442325, 1, 0, 0, 1, 1,
0.4673524, -0.9430224, 2.661461, 1, 0, 0, 1, 1,
0.4679886, 0.490731, 1.391132, 1, 0, 0, 1, 1,
0.4690276, -0.3856808, 4.352725, 1, 0, 0, 1, 1,
0.4734902, 0.6917168, 0.3142375, 1, 0, 0, 1, 1,
0.4737675, -1.783719, 2.927041, 0, 0, 0, 1, 1,
0.4797184, -0.3502667, 1.138044, 0, 0, 0, 1, 1,
0.481157, -0.7274189, 2.59311, 0, 0, 0, 1, 1,
0.4813665, 1.672561, 0.8065092, 0, 0, 0, 1, 1,
0.4819307, -2.012944, 1.953149, 0, 0, 0, 1, 1,
0.4828123, 0.2465218, 1.124175, 0, 0, 0, 1, 1,
0.4858927, -1.85556, 2.144908, 0, 0, 0, 1, 1,
0.4906248, 0.3435261, 0.591783, 1, 1, 1, 1, 1,
0.4906745, 0.7595373, -0.2265353, 1, 1, 1, 1, 1,
0.4916121, -2.225053, 1.758766, 1, 1, 1, 1, 1,
0.4995788, 0.02648339, 1.730959, 1, 1, 1, 1, 1,
0.5005877, 0.06063082, 2.05281, 1, 1, 1, 1, 1,
0.5053709, 1.073722, -1.67392, 1, 1, 1, 1, 1,
0.5090251, 0.7668825, -0.5351637, 1, 1, 1, 1, 1,
0.5112723, -0.5638458, 3.045864, 1, 1, 1, 1, 1,
0.5186893, -0.3032658, 1.52055, 1, 1, 1, 1, 1,
0.5192015, -0.9571877, 3.130072, 1, 1, 1, 1, 1,
0.5290663, 1.205083, 0.06980034, 1, 1, 1, 1, 1,
0.5299683, 2.020759, -0.8462184, 1, 1, 1, 1, 1,
0.5326349, -1.122187, 1.998501, 1, 1, 1, 1, 1,
0.540014, -1.269101, 3.884673, 1, 1, 1, 1, 1,
0.5410063, 0.9142664, 0.4747251, 1, 1, 1, 1, 1,
0.541625, 1.099055, -0.7671654, 0, 0, 1, 1, 1,
0.5538253, 0.8863826, -0.3131856, 1, 0, 0, 1, 1,
0.5559996, -1.973282, 3.61749, 1, 0, 0, 1, 1,
0.5613464, -0.000731503, 2.210472, 1, 0, 0, 1, 1,
0.5625033, 1.850663, 0.03549506, 1, 0, 0, 1, 1,
0.5628827, -0.5832481, 2.299402, 1, 0, 0, 1, 1,
0.5630205, -0.745938, 0.9223841, 0, 0, 0, 1, 1,
0.5670113, -1.252967, 1.496475, 0, 0, 0, 1, 1,
0.5689861, -0.9247096, 2.832004, 0, 0, 0, 1, 1,
0.5763021, -0.006278051, 2.875281, 0, 0, 0, 1, 1,
0.5842971, 0.1716767, 1.548299, 0, 0, 0, 1, 1,
0.5862324, -0.7801794, 0.5567653, 0, 0, 0, 1, 1,
0.5884686, -1.085403, 4.110144, 0, 0, 0, 1, 1,
0.5899745, 1.733551, -0.8386131, 1, 1, 1, 1, 1,
0.5938761, -0.6670474, 3.802349, 1, 1, 1, 1, 1,
0.5970117, 0.7195505, 0.6927828, 1, 1, 1, 1, 1,
0.5971146, 1.619283, 0.9788932, 1, 1, 1, 1, 1,
0.5989695, 1.202227, -0.3540665, 1, 1, 1, 1, 1,
0.6002886, -1.059887, 1.616472, 1, 1, 1, 1, 1,
0.6020218, 0.4551748, 1.342427, 1, 1, 1, 1, 1,
0.6116639, -0.4130656, 1.019282, 1, 1, 1, 1, 1,
0.6132396, 0.05154377, 0.04031923, 1, 1, 1, 1, 1,
0.615147, 0.792442, 1.976853, 1, 1, 1, 1, 1,
0.6164384, -1.863117, 2.954427, 1, 1, 1, 1, 1,
0.6243045, -0.6175414, 2.754584, 1, 1, 1, 1, 1,
0.6246124, 1.710512, 0.438063, 1, 1, 1, 1, 1,
0.6306399, 1.312274, 0.3489048, 1, 1, 1, 1, 1,
0.6333163, -0.5769082, 1.629002, 1, 1, 1, 1, 1,
0.6347531, -0.005489133, 1.068542, 0, 0, 1, 1, 1,
0.640752, -0.6671326, 3.07084, 1, 0, 0, 1, 1,
0.6422733, 0.1527628, -0.931772, 1, 0, 0, 1, 1,
0.659795, -0.3007899, 2.596257, 1, 0, 0, 1, 1,
0.6626356, 0.8232041, -1.476331, 1, 0, 0, 1, 1,
0.6650569, -0.2723118, 3.230567, 1, 0, 0, 1, 1,
0.6663871, -2.014746, 3.236179, 0, 0, 0, 1, 1,
0.6668293, 1.316855, -0.1466854, 0, 0, 0, 1, 1,
0.6670864, 0.2775469, 2.685506, 0, 0, 0, 1, 1,
0.6683547, -0.3233728, 2.68115, 0, 0, 0, 1, 1,
0.6698627, 1.604992, 0.380522, 0, 0, 0, 1, 1,
0.6711705, 0.8792011, 1.636455, 0, 0, 0, 1, 1,
0.6714339, -0.4316753, 1.488468, 0, 0, 0, 1, 1,
0.6730126, -0.4264523, 2.940016, 1, 1, 1, 1, 1,
0.6743432, -0.5061523, 1.587449, 1, 1, 1, 1, 1,
0.6781815, -0.1730605, 2.284762, 1, 1, 1, 1, 1,
0.685015, 0.6330571, 0.242078, 1, 1, 1, 1, 1,
0.6888188, -0.6521788, 1.750946, 1, 1, 1, 1, 1,
0.7008754, 0.3451596, 1.50235, 1, 1, 1, 1, 1,
0.7047027, 0.918067, -0.98676, 1, 1, 1, 1, 1,
0.7087904, -0.5058484, 3.741185, 1, 1, 1, 1, 1,
0.7097986, -0.8255761, 0.9472167, 1, 1, 1, 1, 1,
0.7101311, 0.8242519, 0.1978714, 1, 1, 1, 1, 1,
0.7136509, 0.7716857, 0.9554437, 1, 1, 1, 1, 1,
0.7138463, 0.2739549, 1.61752, 1, 1, 1, 1, 1,
0.7143756, 0.9882175, 1.500134, 1, 1, 1, 1, 1,
0.7169832, -0.4649054, 1.266113, 1, 1, 1, 1, 1,
0.7202927, -1.585848, 2.167768, 1, 1, 1, 1, 1,
0.7245644, -1.136338, 2.074458, 0, 0, 1, 1, 1,
0.7252559, 0.7110116, 1.02608, 1, 0, 0, 1, 1,
0.7351512, 1.272645, 1.488592, 1, 0, 0, 1, 1,
0.7352772, 3.516289, 1.503416, 1, 0, 0, 1, 1,
0.7379155, -0.3640752, 4.463006, 1, 0, 0, 1, 1,
0.7445166, 0.3595029, 0.383018, 1, 0, 0, 1, 1,
0.7451785, 0.4827904, -0.535527, 0, 0, 0, 1, 1,
0.7470575, 1.238551, 1.217965, 0, 0, 0, 1, 1,
0.7486113, -0.05458684, 0.3366689, 0, 0, 0, 1, 1,
0.7503905, -0.2056237, 2.622432, 0, 0, 0, 1, 1,
0.7587445, 1.263961, -0.5164238, 0, 0, 0, 1, 1,
0.7609963, -0.3986363, 2.254972, 0, 0, 0, 1, 1,
0.7617708, 3.30648, 0.2765811, 0, 0, 0, 1, 1,
0.765378, -0.1092301, 1.254985, 1, 1, 1, 1, 1,
0.7744121, 0.4297865, 3.168563, 1, 1, 1, 1, 1,
0.7755675, -0.6118935, 2.147752, 1, 1, 1, 1, 1,
0.7820641, -0.1734993, 2.909806, 1, 1, 1, 1, 1,
0.7826722, 0.0284306, 1.622297, 1, 1, 1, 1, 1,
0.7859719, -0.425254, 3.219117, 1, 1, 1, 1, 1,
0.7875687, -0.3122025, 2.646904, 1, 1, 1, 1, 1,
0.7899557, 0.2449429, 0.2636056, 1, 1, 1, 1, 1,
0.7916281, 0.575599, 0.2888077, 1, 1, 1, 1, 1,
0.7917895, -0.3707772, 0.1025102, 1, 1, 1, 1, 1,
0.7983884, 0.04310472, 3.453516, 1, 1, 1, 1, 1,
0.8011866, 0.6553032, 0.08905698, 1, 1, 1, 1, 1,
0.8037856, 2.254139, -0.7723552, 1, 1, 1, 1, 1,
0.8044839, -0.6626109, 2.9689, 1, 1, 1, 1, 1,
0.8061795, -0.1777908, 1.730721, 1, 1, 1, 1, 1,
0.8064457, 1.152511, 0.7100436, 0, 0, 1, 1, 1,
0.8064667, 0.3486043, 0.7546043, 1, 0, 0, 1, 1,
0.8145369, -0.947187, 2.585981, 1, 0, 0, 1, 1,
0.8192987, 0.4504097, 1.242441, 1, 0, 0, 1, 1,
0.8199033, 1.3302, 0.5755484, 1, 0, 0, 1, 1,
0.8209483, -1.873825, 2.563371, 1, 0, 0, 1, 1,
0.821593, -1.826412, 2.506084, 0, 0, 0, 1, 1,
0.821789, -0.8796492, 2.224046, 0, 0, 0, 1, 1,
0.8230296, 1.200472, 1.386458, 0, 0, 0, 1, 1,
0.8290012, -1.130767, 1.560193, 0, 0, 0, 1, 1,
0.8332556, -1.659595, 2.404665, 0, 0, 0, 1, 1,
0.8398369, 0.8278369, 2.741937, 0, 0, 0, 1, 1,
0.8483655, -0.5535437, 1.71847, 0, 0, 0, 1, 1,
0.8491549, 2.285488, -1.62898, 1, 1, 1, 1, 1,
0.8577131, 0.2619831, 0.3851294, 1, 1, 1, 1, 1,
0.8608662, -0.6962594, 2.713312, 1, 1, 1, 1, 1,
0.8659688, -0.5392754, 2.05551, 1, 1, 1, 1, 1,
0.866347, 0.9074483, 0.4145494, 1, 1, 1, 1, 1,
0.8674179, -0.427581, 2.405581, 1, 1, 1, 1, 1,
0.8741905, -0.1418088, 2.398205, 1, 1, 1, 1, 1,
0.8748784, 0.4864881, -0.2351324, 1, 1, 1, 1, 1,
0.8801928, 0.1669978, 1.572749, 1, 1, 1, 1, 1,
0.9004393, -1.734087, 2.775659, 1, 1, 1, 1, 1,
0.9038245, 0.1919984, 1.742143, 1, 1, 1, 1, 1,
0.9038839, -0.9423103, 3.167715, 1, 1, 1, 1, 1,
0.9116925, 0.8162434, 0.5151355, 1, 1, 1, 1, 1,
0.922251, 1.107141, 2.463515, 1, 1, 1, 1, 1,
0.9250048, -0.4592522, 1.336327, 1, 1, 1, 1, 1,
0.9278842, 0.2367494, 3.1133, 0, 0, 1, 1, 1,
0.9380295, -0.5553732, 3.797434, 1, 0, 0, 1, 1,
0.939907, 0.09947793, 1.847244, 1, 0, 0, 1, 1,
0.9412853, -0.8268399, 3.611088, 1, 0, 0, 1, 1,
0.9443821, -1.483168, 2.956803, 1, 0, 0, 1, 1,
0.9470241, 0.3481562, 1.116739, 1, 0, 0, 1, 1,
0.9520923, 0.7916548, 1.660668, 0, 0, 0, 1, 1,
0.9555466, 1.549207, -0.5346749, 0, 0, 0, 1, 1,
0.9648812, -1.790354, 2.463655, 0, 0, 0, 1, 1,
0.968024, -1.259898, 3.242628, 0, 0, 0, 1, 1,
0.9735992, 0.08980082, 1.628409, 0, 0, 0, 1, 1,
0.9739401, -0.7929016, 2.05138, 0, 0, 0, 1, 1,
0.9791016, -0.7433363, 2.91069, 0, 0, 0, 1, 1,
0.9840542, -0.4264135, 2.13181, 1, 1, 1, 1, 1,
0.9869844, -0.18436, 2.828048, 1, 1, 1, 1, 1,
0.9947859, 0.5168259, 0.4853627, 1, 1, 1, 1, 1,
0.9948439, -0.002632441, 1.129337, 1, 1, 1, 1, 1,
0.995176, -1.389377, 2.840789, 1, 1, 1, 1, 1,
0.9984483, 0.03031391, 0.5569949, 1, 1, 1, 1, 1,
1.002248, -0.1905997, -0.4269249, 1, 1, 1, 1, 1,
1.003196, 0.811308, 1.235643, 1, 1, 1, 1, 1,
1.006728, -0.592716, 2.739546, 1, 1, 1, 1, 1,
1.012705, -0.1341916, 2.406163, 1, 1, 1, 1, 1,
1.01414, -0.4180929, 3.041471, 1, 1, 1, 1, 1,
1.020019, 0.04892741, -0.733725, 1, 1, 1, 1, 1,
1.022415, 0.001070727, 2.095387, 1, 1, 1, 1, 1,
1.02439, 0.2252987, 0.5884824, 1, 1, 1, 1, 1,
1.02624, -0.5026711, 1.849487, 1, 1, 1, 1, 1,
1.027878, 0.6977851, 0.1166427, 0, 0, 1, 1, 1,
1.028101, 0.5203959, 0.2907356, 1, 0, 0, 1, 1,
1.035866, 1.090986, -0.08111679, 1, 0, 0, 1, 1,
1.03796, 0.1240609, 2.786549, 1, 0, 0, 1, 1,
1.038699, -0.08560296, 1.446956, 1, 0, 0, 1, 1,
1.046369, -0.6894121, 2.885483, 1, 0, 0, 1, 1,
1.055143, -1.262886, 2.766682, 0, 0, 0, 1, 1,
1.061831, -0.1251517, -0.728232, 0, 0, 0, 1, 1,
1.064702, -1.161244, 2.472562, 0, 0, 0, 1, 1,
1.0665, 0.2722056, 1.584421, 0, 0, 0, 1, 1,
1.068459, 2.106901, -0.9457574, 0, 0, 0, 1, 1,
1.071541, 0.2914085, 0.3885142, 0, 0, 0, 1, 1,
1.074252, 0.2812884, 2.311665, 0, 0, 0, 1, 1,
1.086388, -0.3337688, 0.9360448, 1, 1, 1, 1, 1,
1.090515, 1.207089, -0.7184814, 1, 1, 1, 1, 1,
1.090814, -0.4086097, 1.942824, 1, 1, 1, 1, 1,
1.095152, -0.4703008, 1.151496, 1, 1, 1, 1, 1,
1.096766, -0.1445199, 1.03675, 1, 1, 1, 1, 1,
1.103117, -1.375366, 1.681309, 1, 1, 1, 1, 1,
1.10412, -1.512912, 2.95481, 1, 1, 1, 1, 1,
1.106391, 0.5120105, 0.5512394, 1, 1, 1, 1, 1,
1.110853, 0.7525064, 1.937623, 1, 1, 1, 1, 1,
1.114634, 0.9477446, 2.160055, 1, 1, 1, 1, 1,
1.115416, 1.016531, 0.4553709, 1, 1, 1, 1, 1,
1.118251, -0.2418727, 1.790497, 1, 1, 1, 1, 1,
1.120624, -1.233479, 1.328964, 1, 1, 1, 1, 1,
1.123117, -1.825076, 4.318837, 1, 1, 1, 1, 1,
1.125281, -2.346559, 2.418775, 1, 1, 1, 1, 1,
1.125901, 0.6998341, 0.7825666, 0, 0, 1, 1, 1,
1.132555, -1.567594, 3.600578, 1, 0, 0, 1, 1,
1.142828, -0.7959352, 3.418392, 1, 0, 0, 1, 1,
1.147953, 0.5875922, 0.1207129, 1, 0, 0, 1, 1,
1.149604, -0.9966397, 1.772193, 1, 0, 0, 1, 1,
1.153026, 1.13713, 2.24013, 1, 0, 0, 1, 1,
1.154711, 0.8514985, -0.2017953, 0, 0, 0, 1, 1,
1.15873, 0.4535979, 1.532525, 0, 0, 0, 1, 1,
1.165538, -1.98325, 1.38693, 0, 0, 0, 1, 1,
1.171286, 0.5147406, 0.1009613, 0, 0, 0, 1, 1,
1.172118, 0.4838171, 0.777096, 0, 0, 0, 1, 1,
1.174345, -1.266404, 3.267058, 0, 0, 0, 1, 1,
1.181314, 0.4359804, 0.3619174, 0, 0, 0, 1, 1,
1.184891, -1.463568, 2.219026, 1, 1, 1, 1, 1,
1.188782, 1.528849, 0.6643659, 1, 1, 1, 1, 1,
1.193089, -1.156481, 1.674046, 1, 1, 1, 1, 1,
1.19582, -1.249263, 0.4388457, 1, 1, 1, 1, 1,
1.205198, 0.1520161, 1.662519, 1, 1, 1, 1, 1,
1.20849, -0.4234873, 1.207303, 1, 1, 1, 1, 1,
1.210193, 0.9171573, 3.714677, 1, 1, 1, 1, 1,
1.230664, 1.029224, 0.2511013, 1, 1, 1, 1, 1,
1.231004, 0.3848498, 1.615407, 1, 1, 1, 1, 1,
1.233208, 0.6306038, -0.5488957, 1, 1, 1, 1, 1,
1.234581, 1.152225, -0.4102858, 1, 1, 1, 1, 1,
1.245113, -0.24492, 1.813124, 1, 1, 1, 1, 1,
1.264568, -0.2936487, 4.068482, 1, 1, 1, 1, 1,
1.26539, 1.412267, 1.203421, 1, 1, 1, 1, 1,
1.28736, 0.3306323, 1.40904, 1, 1, 1, 1, 1,
1.31603, 0.8459612, 2.773648, 0, 0, 1, 1, 1,
1.317936, 1.906055, 0.5789034, 1, 0, 0, 1, 1,
1.328867, -0.4863831, 1.210992, 1, 0, 0, 1, 1,
1.329574, -1.030484, 3.245015, 1, 0, 0, 1, 1,
1.332703, -0.215318, -0.4709412, 1, 0, 0, 1, 1,
1.343222, 0.6929747, 0.829502, 1, 0, 0, 1, 1,
1.346156, 2.025131, 1.53101, 0, 0, 0, 1, 1,
1.357785, -0.1012158, 1.799439, 0, 0, 0, 1, 1,
1.357954, 0.07224757, 3.112863, 0, 0, 0, 1, 1,
1.358651, 0.1227499, 2.194884, 0, 0, 0, 1, 1,
1.36624, 1.522722, 1.387577, 0, 0, 0, 1, 1,
1.37067, 0.1376489, 3.279277, 0, 0, 0, 1, 1,
1.370733, -0.9533488, 0.1822819, 0, 0, 0, 1, 1,
1.382758, 0.01256016, 1.470111, 1, 1, 1, 1, 1,
1.386508, 1.55538, 0.5915199, 1, 1, 1, 1, 1,
1.391565, -0.3667023, 2.77358, 1, 1, 1, 1, 1,
1.406916, 0.3917438, -0.1670636, 1, 1, 1, 1, 1,
1.407264, 1.446865, 0.3657136, 1, 1, 1, 1, 1,
1.41046, 0.4547151, 0.9505922, 1, 1, 1, 1, 1,
1.412585, -1.151935, 0.8266426, 1, 1, 1, 1, 1,
1.412882, 1.489438, -1.406909, 1, 1, 1, 1, 1,
1.416833, -0.1693246, 2.945868, 1, 1, 1, 1, 1,
1.418197, -0.1830609, -0.1260472, 1, 1, 1, 1, 1,
1.4279, 0.08907334, 1.951768, 1, 1, 1, 1, 1,
1.430657, 0.484899, -0.7154238, 1, 1, 1, 1, 1,
1.432103, -0.6508838, 0.9631776, 1, 1, 1, 1, 1,
1.438045, 1.2236, 0.6848231, 1, 1, 1, 1, 1,
1.438798, -0.3964631, 2.824817, 1, 1, 1, 1, 1,
1.46034, -0.540091, 2.459799, 0, 0, 1, 1, 1,
1.465728, -0.8046315, 3.734925, 1, 0, 0, 1, 1,
1.46656, -1.381773, 2.269624, 1, 0, 0, 1, 1,
1.471326, -0.4674254, 1.850284, 1, 0, 0, 1, 1,
1.472629, -1.731248, 3.420302, 1, 0, 0, 1, 1,
1.488142, -0.7620804, 2.232419, 1, 0, 0, 1, 1,
1.492705, 0.7271347, 2.322664, 0, 0, 0, 1, 1,
1.504921, 0.385231, -0.07037713, 0, 0, 0, 1, 1,
1.517828, -0.9144548, 4.006757, 0, 0, 0, 1, 1,
1.518625, -0.738829, 3.92703, 0, 0, 0, 1, 1,
1.530591, -0.4978923, 0.525542, 0, 0, 0, 1, 1,
1.562137, 0.2455325, 1.336993, 0, 0, 0, 1, 1,
1.57394, -1.657298, 1.794483, 0, 0, 0, 1, 1,
1.57584, -0.8530599, 1.138692, 1, 1, 1, 1, 1,
1.58624, -1.231333, 1.936741, 1, 1, 1, 1, 1,
1.609377, -0.8984068, 2.618555, 1, 1, 1, 1, 1,
1.645376, 1.547864, 0.4424741, 1, 1, 1, 1, 1,
1.648111, -0.2257065, 1.780168, 1, 1, 1, 1, 1,
1.652708, 0.2954418, 1.643725, 1, 1, 1, 1, 1,
1.653099, 0.5128201, -0.1643738, 1, 1, 1, 1, 1,
1.662418, -0.2234104, 2.731119, 1, 1, 1, 1, 1,
1.679652, 0.04448397, 1.113029, 1, 1, 1, 1, 1,
1.712587, -0.7945602, 1.376743, 1, 1, 1, 1, 1,
1.727378, 0.1099529, 0.1297679, 1, 1, 1, 1, 1,
1.728269, -0.1062618, 1.942424, 1, 1, 1, 1, 1,
1.748625, -1.012075, 1.789021, 1, 1, 1, 1, 1,
1.749928, 1.408539, 2.369716, 1, 1, 1, 1, 1,
1.758274, 0.8147993, 0.257183, 1, 1, 1, 1, 1,
1.789649, -2.001647, 1.76375, 0, 0, 1, 1, 1,
1.796652, 1.057374, 0.6127595, 1, 0, 0, 1, 1,
1.825574, 0.7532856, 0.147058, 1, 0, 0, 1, 1,
1.840566, -1.150264, 1.406576, 1, 0, 0, 1, 1,
1.854974, 0.1451402, 1.461861, 1, 0, 0, 1, 1,
1.859464, -1.115227, 2.629352, 1, 0, 0, 1, 1,
1.873283, 0.2352836, 2.315689, 0, 0, 0, 1, 1,
1.887093, 0.03824754, 2.501246, 0, 0, 0, 1, 1,
1.906831, 0.6666301, 1.90123, 0, 0, 0, 1, 1,
1.925214, 1.254148, 2.956975, 0, 0, 0, 1, 1,
1.929096, -1.231418, 2.13269, 0, 0, 0, 1, 1,
1.94088, 1.349228, 0.378891, 0, 0, 0, 1, 1,
1.976365, 0.8878855, 0.5886264, 0, 0, 0, 1, 1,
1.977096, -0.2860729, 1.862772, 1, 1, 1, 1, 1,
2.033855, -1.56767, 0.7704732, 1, 1, 1, 1, 1,
2.037058, -0.6954858, 3.16553, 1, 1, 1, 1, 1,
2.03769, 0.5457109, 1.235702, 1, 1, 1, 1, 1,
2.047561, 0.8053865, 1.646659, 1, 1, 1, 1, 1,
2.061317, 1.656323, 2.14591, 1, 1, 1, 1, 1,
2.063441, -0.6242174, 3.05918, 1, 1, 1, 1, 1,
2.086974, 0.1266171, 2.625463, 1, 1, 1, 1, 1,
2.095125, 0.3532135, 1.289961, 1, 1, 1, 1, 1,
2.096531, -0.1861824, 1.227197, 1, 1, 1, 1, 1,
2.111914, 0.4336415, 1.982501, 1, 1, 1, 1, 1,
2.117597, 2.308527, 1.158675, 1, 1, 1, 1, 1,
2.119865, -1.247918, 3.190676, 1, 1, 1, 1, 1,
2.15337, 0.09628106, 1.716967, 1, 1, 1, 1, 1,
2.160198, 0.4091268, 1.714934, 1, 1, 1, 1, 1,
2.17942, 2.078931, -0.2897504, 0, 0, 1, 1, 1,
2.190102, -0.3049982, 2.811068, 1, 0, 0, 1, 1,
2.198604, -0.2901751, 1.78432, 1, 0, 0, 1, 1,
2.238415, -1.38529, 2.165061, 1, 0, 0, 1, 1,
2.28092, -0.8901188, 1.635925, 1, 0, 0, 1, 1,
2.34139, -1.335283, 1.69483, 1, 0, 0, 1, 1,
2.389416, 0.3950903, 3.003956, 0, 0, 0, 1, 1,
2.399071, -0.1823929, 2.21747, 0, 0, 0, 1, 1,
2.404412, 1.711944, 0.9369033, 0, 0, 0, 1, 1,
2.498215, 0.07103068, 1.354647, 0, 0, 0, 1, 1,
2.504818, -3.003079, 1.690351, 0, 0, 0, 1, 1,
2.636256, -0.0739127, 1.399065, 0, 0, 0, 1, 1,
2.653042, -1.076559, 2.208327, 0, 0, 0, 1, 1,
2.72294, 1.497642, -0.2339599, 1, 1, 1, 1, 1,
2.742593, -0.8958565, 2.376343, 1, 1, 1, 1, 1,
2.760852, -0.3191597, 2.011471, 1, 1, 1, 1, 1,
2.767948, 1.586388, 1.400508, 1, 1, 1, 1, 1,
2.780977, 0.4779268, 3.058105, 1, 1, 1, 1, 1,
2.9836, -0.7587315, 2.377301, 1, 1, 1, 1, 1,
3.620658, 0.7786967, 1.9243, 1, 1, 1, 1, 1
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
var radius = 9.892021;
var distance = 34.74531;
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
mvMatrix.translate( -0.3726269, -0.186398, -0.03014255 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.74531);
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