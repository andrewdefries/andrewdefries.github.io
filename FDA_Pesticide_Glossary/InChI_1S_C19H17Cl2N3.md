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
-3.087401, -0.4721791, -3.168684, 1, 0, 0, 1,
-2.726437, 0.2901624, -0.4779089, 1, 0.007843138, 0, 1,
-2.549778, 0.389064, -1.998286, 1, 0.01176471, 0, 1,
-2.535673, 0.6594992, -0.2805878, 1, 0.01960784, 0, 1,
-2.516608, 1.311675, -3.159348, 1, 0.02352941, 0, 1,
-2.371025, -1.274951, -2.25606, 1, 0.03137255, 0, 1,
-2.350034, -0.1976655, -1.163516, 1, 0.03529412, 0, 1,
-2.329491, 0.4787671, -4.104971, 1, 0.04313726, 0, 1,
-2.280536, 0.7983161, -2.845884, 1, 0.04705882, 0, 1,
-2.258228, 0.06640776, -1.781525, 1, 0.05490196, 0, 1,
-2.23105, 0.02892029, -2.989177, 1, 0.05882353, 0, 1,
-2.196628, -0.3014551, -0.2455508, 1, 0.06666667, 0, 1,
-2.180982, 1.893111, -0.5613884, 1, 0.07058824, 0, 1,
-2.097019, 0.05491123, -1.068711, 1, 0.07843138, 0, 1,
-2.054066, 0.232242, -1.122907, 1, 0.08235294, 0, 1,
-2.011641, 0.7221383, -2.603989, 1, 0.09019608, 0, 1,
-1.959713, 0.5426557, -2.643601, 1, 0.09411765, 0, 1,
-1.956236, 0.1444555, -2.005267, 1, 0.1019608, 0, 1,
-1.91954, 0.07360037, -0.03270387, 1, 0.1098039, 0, 1,
-1.901847, 1.178691, -1.826054, 1, 0.1137255, 0, 1,
-1.898762, 0.9295421, -1.795538, 1, 0.1215686, 0, 1,
-1.869007, 1.380297, -1.193553, 1, 0.1254902, 0, 1,
-1.856955, -0.03923316, -1.147106, 1, 0.1333333, 0, 1,
-1.845656, -0.2526597, -1.052088, 1, 0.1372549, 0, 1,
-1.826627, 1.536702, -1.607043, 1, 0.145098, 0, 1,
-1.81994, 1.046585, 0.2637733, 1, 0.1490196, 0, 1,
-1.794826, 0.08410504, -1.441778, 1, 0.1568628, 0, 1,
-1.790337, -2.797294, -1.355007, 1, 0.1607843, 0, 1,
-1.789313, 0.151166, -3.363462, 1, 0.1686275, 0, 1,
-1.786453, -1.336578, -1.431261, 1, 0.172549, 0, 1,
-1.771856, 1.47968, -0.9983547, 1, 0.1803922, 0, 1,
-1.752283, -0.01997667, 0.09746271, 1, 0.1843137, 0, 1,
-1.750199, 0.4700119, -0.3008682, 1, 0.1921569, 0, 1,
-1.739, 1.154795, -0.9647793, 1, 0.1960784, 0, 1,
-1.73893, -0.1219841, -2.133265, 1, 0.2039216, 0, 1,
-1.737963, -0.1948871, -2.903148, 1, 0.2117647, 0, 1,
-1.701628, 0.002300934, 0.2893868, 1, 0.2156863, 0, 1,
-1.694312, -0.209687, -1.23799, 1, 0.2235294, 0, 1,
-1.691646, 0.279931, 1.10034, 1, 0.227451, 0, 1,
-1.68566, -0.1099089, -3.245141, 1, 0.2352941, 0, 1,
-1.680902, 0.9420608, -2.664388, 1, 0.2392157, 0, 1,
-1.673303, 0.3353407, -1.150149, 1, 0.2470588, 0, 1,
-1.669321, -0.763956, -1.962499, 1, 0.2509804, 0, 1,
-1.656633, -1.55782, -2.676712, 1, 0.2588235, 0, 1,
-1.644762, -0.975453, -1.820872, 1, 0.2627451, 0, 1,
-1.640182, -0.01824775, -0.5200359, 1, 0.2705882, 0, 1,
-1.635295, -0.5588465, -3.20382, 1, 0.2745098, 0, 1,
-1.627051, 0.252823, 0.9605541, 1, 0.282353, 0, 1,
-1.586874, -0.3931117, -1.856617, 1, 0.2862745, 0, 1,
-1.579967, 0.2464024, -0.02844092, 1, 0.2941177, 0, 1,
-1.57487, 0.4417592, -0.7537594, 1, 0.3019608, 0, 1,
-1.551941, 0.7281849, -1.697108, 1, 0.3058824, 0, 1,
-1.551535, 0.4291988, -0.9208497, 1, 0.3137255, 0, 1,
-1.549191, -1.651301, -1.688195, 1, 0.3176471, 0, 1,
-1.535108, 2.127894, -0.8531007, 1, 0.3254902, 0, 1,
-1.535054, -0.132969, -0.8685936, 1, 0.3294118, 0, 1,
-1.533647, -2.326692, -1.615298, 1, 0.3372549, 0, 1,
-1.524674, 0.4796504, -1.544468, 1, 0.3411765, 0, 1,
-1.501671, 0.5160345, -1.212063, 1, 0.3490196, 0, 1,
-1.491369, 1.038458, -1.21603, 1, 0.3529412, 0, 1,
-1.48938, -0.7117209, -1.755935, 1, 0.3607843, 0, 1,
-1.464943, 0.3113673, -2.215521, 1, 0.3647059, 0, 1,
-1.462553, 0.1831147, -0.923007, 1, 0.372549, 0, 1,
-1.45057, 0.9504901, -2.381502, 1, 0.3764706, 0, 1,
-1.445262, 0.5705568, -0.8801079, 1, 0.3843137, 0, 1,
-1.441906, -0.517002, -4.567826, 1, 0.3882353, 0, 1,
-1.437003, 0.4219196, -2.334901, 1, 0.3960784, 0, 1,
-1.435302, 0.6535622, -1.252548, 1, 0.4039216, 0, 1,
-1.428432, 0.0502276, -1.340186, 1, 0.4078431, 0, 1,
-1.424558, 0.2928001, -1.479199, 1, 0.4156863, 0, 1,
-1.420295, 0.08536707, -0.8632098, 1, 0.4196078, 0, 1,
-1.407911, 1.073979, 0.2239813, 1, 0.427451, 0, 1,
-1.404567, 0.9741294, -0.7565224, 1, 0.4313726, 0, 1,
-1.39252, 0.1102784, -1.808952, 1, 0.4392157, 0, 1,
-1.390016, 0.3751481, -1.00404, 1, 0.4431373, 0, 1,
-1.385262, -1.992398, -2.962166, 1, 0.4509804, 0, 1,
-1.384956, 0.4924113, 0.5492802, 1, 0.454902, 0, 1,
-1.384532, -0.2289742, -1.341247, 1, 0.4627451, 0, 1,
-1.375413, -1.742429, -1.276055, 1, 0.4666667, 0, 1,
-1.374196, -0.2343015, -0.4090351, 1, 0.4745098, 0, 1,
-1.367687, -0.03925561, -0.7097961, 1, 0.4784314, 0, 1,
-1.367545, 0.486058, -1.410843, 1, 0.4862745, 0, 1,
-1.363289, 0.6888925, -1.231606, 1, 0.4901961, 0, 1,
-1.354363, -0.1966314, -2.264743, 1, 0.4980392, 0, 1,
-1.350248, 1.121945, 0.2182744, 1, 0.5058824, 0, 1,
-1.348769, -0.8825519, -2.103351, 1, 0.509804, 0, 1,
-1.341334, 0.3792667, -2.537882, 1, 0.5176471, 0, 1,
-1.334975, -1.47301, -1.416764, 1, 0.5215687, 0, 1,
-1.330702, -0.2208367, -1.150761, 1, 0.5294118, 0, 1,
-1.329548, 0.5703172, -2.025051, 1, 0.5333334, 0, 1,
-1.325479, 0.7132022, -0.7771949, 1, 0.5411765, 0, 1,
-1.324721, 0.9439438, -1.457712, 1, 0.5450981, 0, 1,
-1.322299, -0.7062888, -3.778567, 1, 0.5529412, 0, 1,
-1.311525, 0.1215658, -1.607884, 1, 0.5568628, 0, 1,
-1.298363, -0.724245, -2.522776, 1, 0.5647059, 0, 1,
-1.29001, 0.7626256, -1.762945, 1, 0.5686275, 0, 1,
-1.271646, -0.7753066, -1.720658, 1, 0.5764706, 0, 1,
-1.268222, -0.1884199, -2.956206, 1, 0.5803922, 0, 1,
-1.259442, 1.792897, 0.2433373, 1, 0.5882353, 0, 1,
-1.257759, 0.2357654, -1.738513, 1, 0.5921569, 0, 1,
-1.252264, 0.7788017, -2.093746, 1, 0.6, 0, 1,
-1.250061, 0.4876925, -0.5880947, 1, 0.6078432, 0, 1,
-1.249651, -0.3289302, -1.677398, 1, 0.6117647, 0, 1,
-1.23431, -0.4336933, -1.731629, 1, 0.6196079, 0, 1,
-1.233718, -0.2757331, -2.451357, 1, 0.6235294, 0, 1,
-1.232061, -0.782982, -2.153457, 1, 0.6313726, 0, 1,
-1.224617, 0.2441693, -0.2846769, 1, 0.6352941, 0, 1,
-1.221611, -0.4996523, -2.194458, 1, 0.6431373, 0, 1,
-1.220113, 0.03270333, -0.3876069, 1, 0.6470588, 0, 1,
-1.214986, 1.335843, -2.51769, 1, 0.654902, 0, 1,
-1.210119, 0.3096215, -2.006785, 1, 0.6588235, 0, 1,
-1.207421, -0.294579, -1.656788, 1, 0.6666667, 0, 1,
-1.201693, 0.01409591, -0.6512927, 1, 0.6705883, 0, 1,
-1.201453, -1.059965, -1.061835, 1, 0.6784314, 0, 1,
-1.193052, 0.6488519, -2.641783, 1, 0.682353, 0, 1,
-1.191115, -0.3908728, -2.146948, 1, 0.6901961, 0, 1,
-1.187999, 1.67687, -1.937937, 1, 0.6941177, 0, 1,
-1.186542, -0.440073, -2.32112, 1, 0.7019608, 0, 1,
-1.172592, -1.03549, -1.531238, 1, 0.7098039, 0, 1,
-1.139194, -1.364353, -2.731347, 1, 0.7137255, 0, 1,
-1.134865, 0.8421022, -1.5359, 1, 0.7215686, 0, 1,
-1.130643, 1.124464, -1.968642, 1, 0.7254902, 0, 1,
-1.127957, -0.2857287, -1.86899, 1, 0.7333333, 0, 1,
-1.126796, 0.5927723, -0.4384366, 1, 0.7372549, 0, 1,
-1.120032, 0.9257178, -0.7376115, 1, 0.7450981, 0, 1,
-1.119648, -1.481194, -1.980389, 1, 0.7490196, 0, 1,
-1.118662, 0.4642538, -0.7072203, 1, 0.7568628, 0, 1,
-1.113984, 0.277925, -1.616201, 1, 0.7607843, 0, 1,
-1.113148, 0.8053735, -1.458539, 1, 0.7686275, 0, 1,
-1.098633, -0.9396109, -2.909221, 1, 0.772549, 0, 1,
-1.0943, -0.05783259, -1.713535, 1, 0.7803922, 0, 1,
-1.092749, 1.986076, 0.7832795, 1, 0.7843137, 0, 1,
-1.087505, -0.2061387, -1.586897, 1, 0.7921569, 0, 1,
-1.079801, -0.03337486, -1.473895, 1, 0.7960784, 0, 1,
-1.073799, -0.3632936, -1.103795, 1, 0.8039216, 0, 1,
-1.072575, 1.059033, -0.5144965, 1, 0.8117647, 0, 1,
-1.069612, -0.06591897, -1.939942, 1, 0.8156863, 0, 1,
-1.06637, 0.8484097, 1.038026, 1, 0.8235294, 0, 1,
-1.055801, 0.2876278, -1.64652, 1, 0.827451, 0, 1,
-1.04937, -1.527367, -3.211073, 1, 0.8352941, 0, 1,
-1.045027, 1.103961, 0.3807794, 1, 0.8392157, 0, 1,
-1.04261, -0.6979576, -3.028041, 1, 0.8470588, 0, 1,
-1.037812, -1.397998, -0.7154957, 1, 0.8509804, 0, 1,
-1.036183, -0.952758, -1.997152, 1, 0.8588235, 0, 1,
-1.033061, 0.2460182, -0.9566831, 1, 0.8627451, 0, 1,
-1.023715, -0.8790014, -2.856525, 1, 0.8705882, 0, 1,
-1.016858, 0.5006536, -1.501408, 1, 0.8745098, 0, 1,
-1.016306, 0.7885761, -1.942368, 1, 0.8823529, 0, 1,
-1.014625, -1.059767, -2.432856, 1, 0.8862745, 0, 1,
-1.014364, 1.324346, -0.2572055, 1, 0.8941177, 0, 1,
-1.009365, -2.603929, -3.001108, 1, 0.8980392, 0, 1,
-1.000603, -1.612709, -1.312409, 1, 0.9058824, 0, 1,
-0.9965255, 0.9103661, -0.3714209, 1, 0.9137255, 0, 1,
-0.993631, 0.6179712, -0.03553783, 1, 0.9176471, 0, 1,
-0.9872983, -0.7685465, -2.246473, 1, 0.9254902, 0, 1,
-0.9775424, -0.2016425, -0.2557784, 1, 0.9294118, 0, 1,
-0.9706369, 0.5549667, -2.893199, 1, 0.9372549, 0, 1,
-0.969745, 0.3415944, -1.849403, 1, 0.9411765, 0, 1,
-0.9691342, 0.5401232, -0.9974974, 1, 0.9490196, 0, 1,
-0.9639915, -1.71503, -1.387617, 1, 0.9529412, 0, 1,
-0.9617661, 2.037248, 0.5012361, 1, 0.9607843, 0, 1,
-0.9606842, 0.6349625, -0.3157865, 1, 0.9647059, 0, 1,
-0.951956, 1.749128, 1.944746, 1, 0.972549, 0, 1,
-0.9469892, 0.2224824, -0.968371, 1, 0.9764706, 0, 1,
-0.9436072, 0.3733441, -0.9269357, 1, 0.9843137, 0, 1,
-0.9400482, 0.08153055, -1.69233, 1, 0.9882353, 0, 1,
-0.9345921, 0.4368716, -0.7887749, 1, 0.9960784, 0, 1,
-0.9283693, 0.1750269, -2.152906, 0.9960784, 1, 0, 1,
-0.9272418, -1.154131, -2.103765, 0.9921569, 1, 0, 1,
-0.9199411, -1.097253, -2.235039, 0.9843137, 1, 0, 1,
-0.9195336, -0.5775178, -1.646425, 0.9803922, 1, 0, 1,
-0.9173008, -0.3096667, -0.8683273, 0.972549, 1, 0, 1,
-0.9160565, -1.252316, -1.426959, 0.9686275, 1, 0, 1,
-0.9067656, 0.8110229, -1.514649, 0.9607843, 1, 0, 1,
-0.9039696, -0.0733945, -0.8345999, 0.9568627, 1, 0, 1,
-0.8978877, -0.6919371, -3.290807, 0.9490196, 1, 0, 1,
-0.8968788, -1.477245, -2.697602, 0.945098, 1, 0, 1,
-0.8966405, 0.990077, -0.6029451, 0.9372549, 1, 0, 1,
-0.8962858, -1.862878, -1.718818, 0.9333333, 1, 0, 1,
-0.8922667, -1.301508, -3.202484, 0.9254902, 1, 0, 1,
-0.891867, -1.475691, -4.16855, 0.9215686, 1, 0, 1,
-0.8908622, -1.859737, -3.313619, 0.9137255, 1, 0, 1,
-0.8880559, -0.6536369, -3.268414, 0.9098039, 1, 0, 1,
-0.8837458, -0.6762867, -1.196146, 0.9019608, 1, 0, 1,
-0.8826371, 0.7258969, -1.044706, 0.8941177, 1, 0, 1,
-0.8746495, 0.8326173, -1.333443, 0.8901961, 1, 0, 1,
-0.863897, -1.087342, -4.323408, 0.8823529, 1, 0, 1,
-0.8634126, 0.4294744, -1.241141, 0.8784314, 1, 0, 1,
-0.8633048, 0.02927094, -0.1293822, 0.8705882, 1, 0, 1,
-0.8628687, -0.1941492, -1.183815, 0.8666667, 1, 0, 1,
-0.8625802, -0.8571803, -1.73104, 0.8588235, 1, 0, 1,
-0.8531252, -2.153058, -3.031166, 0.854902, 1, 0, 1,
-0.850923, -0.07968633, -1.679323, 0.8470588, 1, 0, 1,
-0.8504743, 0.3985197, -0.02600462, 0.8431373, 1, 0, 1,
-0.8476853, -0.2580127, -1.746188, 0.8352941, 1, 0, 1,
-0.846525, -2.011636, -1.694486, 0.8313726, 1, 0, 1,
-0.8459939, -0.09920182, -1.361988, 0.8235294, 1, 0, 1,
-0.8439536, 1.162389, -2.15795, 0.8196079, 1, 0, 1,
-0.8438765, -0.1761485, -2.561496, 0.8117647, 1, 0, 1,
-0.839438, 0.6261299, 0.1415465, 0.8078431, 1, 0, 1,
-0.8343615, -0.2210686, 0.3914041, 0.8, 1, 0, 1,
-0.8246843, 0.62436, -0.5831945, 0.7921569, 1, 0, 1,
-0.8224295, -0.1839434, -2.769234, 0.7882353, 1, 0, 1,
-0.8224027, -0.9317266, -2.211539, 0.7803922, 1, 0, 1,
-0.8217962, 0.2849475, -0.5965884, 0.7764706, 1, 0, 1,
-0.7969393, -0.4604999, -1.948951, 0.7686275, 1, 0, 1,
-0.7924688, -0.1227077, -1.795901, 0.7647059, 1, 0, 1,
-0.7900404, 0.8803916, -1.38974, 0.7568628, 1, 0, 1,
-0.7835706, -0.5801698, -2.485433, 0.7529412, 1, 0, 1,
-0.7826465, 0.434414, -0.9890197, 0.7450981, 1, 0, 1,
-0.7804099, 1.51624, 1.818173, 0.7411765, 1, 0, 1,
-0.7796866, 0.5239775, -0.7557703, 0.7333333, 1, 0, 1,
-0.7764243, -2.332753, -2.319668, 0.7294118, 1, 0, 1,
-0.7753617, -1.249232, -1.426209, 0.7215686, 1, 0, 1,
-0.7752725, 0.9210969, -1.413534, 0.7176471, 1, 0, 1,
-0.7741158, -0.6116753, -3.586024, 0.7098039, 1, 0, 1,
-0.7670012, 0.3140742, -0.9071162, 0.7058824, 1, 0, 1,
-0.7600642, 1.7725, -1.309875, 0.6980392, 1, 0, 1,
-0.7565505, 0.1695668, -1.566313, 0.6901961, 1, 0, 1,
-0.7538955, 0.6753818, -1.216849, 0.6862745, 1, 0, 1,
-0.7414418, 0.1674975, -1.304055, 0.6784314, 1, 0, 1,
-0.7388887, -0.2656814, -0.7739661, 0.6745098, 1, 0, 1,
-0.7372239, -1.361533, -5.269871, 0.6666667, 1, 0, 1,
-0.732621, 0.01868755, -0.7445328, 0.6627451, 1, 0, 1,
-0.7261486, -0.9383438, -4.22069, 0.654902, 1, 0, 1,
-0.7256339, -0.06758542, -1.160822, 0.6509804, 1, 0, 1,
-0.7202637, 0.1617834, -1.269243, 0.6431373, 1, 0, 1,
-0.7182989, -2.132745, -2.526725, 0.6392157, 1, 0, 1,
-0.7176607, 0.396542, 0.3451392, 0.6313726, 1, 0, 1,
-0.7119763, -0.4703351, -1.43874, 0.627451, 1, 0, 1,
-0.7102692, -0.5113832, -2.245953, 0.6196079, 1, 0, 1,
-0.7099508, 0.5345112, -0.948165, 0.6156863, 1, 0, 1,
-0.7069103, 0.14408, 0.4589209, 0.6078432, 1, 0, 1,
-0.7051261, -0.5811977, -1.373111, 0.6039216, 1, 0, 1,
-0.6997464, -1.457245, -3.472038, 0.5960785, 1, 0, 1,
-0.6966583, -1.00432, -2.965987, 0.5882353, 1, 0, 1,
-0.6962507, 0.2986944, -2.126005, 0.5843138, 1, 0, 1,
-0.6924269, -0.2351865, -2.249673, 0.5764706, 1, 0, 1,
-0.6906039, -0.3997012, -1.096221, 0.572549, 1, 0, 1,
-0.6868476, 0.1503107, -0.1018601, 0.5647059, 1, 0, 1,
-0.6856273, 0.626187, -2.613904, 0.5607843, 1, 0, 1,
-0.6754283, -1.676825, -3.388254, 0.5529412, 1, 0, 1,
-0.6712125, -0.9372231, -2.271669, 0.5490196, 1, 0, 1,
-0.668082, -0.09261984, -1.962875, 0.5411765, 1, 0, 1,
-0.6634011, 1.247382, -0.5697769, 0.5372549, 1, 0, 1,
-0.6602646, -0.007801588, -1.664542, 0.5294118, 1, 0, 1,
-0.6555933, 2.202158, 0.6700466, 0.5254902, 1, 0, 1,
-0.6516651, -0.08013465, -0.732215, 0.5176471, 1, 0, 1,
-0.6490983, -1.009438, -3.996197, 0.5137255, 1, 0, 1,
-0.6478564, -0.4510969, -3.792675, 0.5058824, 1, 0, 1,
-0.6476768, 1.010943, -1.762883, 0.5019608, 1, 0, 1,
-0.6437865, 1.247134, -1.140515, 0.4941176, 1, 0, 1,
-0.6409438, -0.7797018, -1.639603, 0.4862745, 1, 0, 1,
-0.6405193, 0.2261881, -0.7263362, 0.4823529, 1, 0, 1,
-0.6349908, 1.380267, -0.7790762, 0.4745098, 1, 0, 1,
-0.6345744, -0.2899408, -3.384748, 0.4705882, 1, 0, 1,
-0.6338388, 0.9377258, -1.310516, 0.4627451, 1, 0, 1,
-0.6336839, 0.6220914, 0.3138751, 0.4588235, 1, 0, 1,
-0.6332322, -2.317654, -0.3552946, 0.4509804, 1, 0, 1,
-0.6286983, -1.060134, -1.927679, 0.4470588, 1, 0, 1,
-0.6279312, 0.04672176, -1.287624, 0.4392157, 1, 0, 1,
-0.6262325, 1.657882, -1.865448, 0.4352941, 1, 0, 1,
-0.6256451, 0.4111602, -1.385185, 0.427451, 1, 0, 1,
-0.6248657, -0.7234073, -3.041627, 0.4235294, 1, 0, 1,
-0.622184, 0.6695696, -0.3968213, 0.4156863, 1, 0, 1,
-0.6124631, -1.755566, -2.163228, 0.4117647, 1, 0, 1,
-0.6115907, -0.4530863, -2.688171, 0.4039216, 1, 0, 1,
-0.6050971, -0.7601495, -1.123274, 0.3960784, 1, 0, 1,
-0.5895699, 0.2520579, -0.3824935, 0.3921569, 1, 0, 1,
-0.587047, 0.7954383, -1.24925, 0.3843137, 1, 0, 1,
-0.5797557, 0.8958659, 0.0344709, 0.3803922, 1, 0, 1,
-0.5766359, 0.5930844, -2.405324, 0.372549, 1, 0, 1,
-0.5739924, 1.748918, -0.4066371, 0.3686275, 1, 0, 1,
-0.5723584, 0.3200083, -1.352288, 0.3607843, 1, 0, 1,
-0.571356, -1.536379, -3.409733, 0.3568628, 1, 0, 1,
-0.571184, 0.6817092, -1.324986, 0.3490196, 1, 0, 1,
-0.567375, -0.3566544, -1.964579, 0.345098, 1, 0, 1,
-0.5612144, -1.048911, -3.467088, 0.3372549, 1, 0, 1,
-0.560226, 0.4515389, -2.131575, 0.3333333, 1, 0, 1,
-0.5579566, 1.579899, 0.5049325, 0.3254902, 1, 0, 1,
-0.5556734, 0.8012686, -1.719959, 0.3215686, 1, 0, 1,
-0.5538625, 0.2009404, -1.264756, 0.3137255, 1, 0, 1,
-0.550797, 2.13845, 0.4709011, 0.3098039, 1, 0, 1,
-0.5464922, 0.7789083, 0.4393534, 0.3019608, 1, 0, 1,
-0.5455253, 1.613435, -0.960978, 0.2941177, 1, 0, 1,
-0.5447772, -0.5882437, -2.331035, 0.2901961, 1, 0, 1,
-0.5442805, 1.397923, 1.176794, 0.282353, 1, 0, 1,
-0.5415093, -0.6274039, -2.407962, 0.2784314, 1, 0, 1,
-0.5400738, 0.2745935, -0.05583447, 0.2705882, 1, 0, 1,
-0.5398176, 0.4721243, -1.682353, 0.2666667, 1, 0, 1,
-0.535765, 0.5279971, -1.520864, 0.2588235, 1, 0, 1,
-0.5281397, -0.26266, -3.007025, 0.254902, 1, 0, 1,
-0.5256127, -0.7190254, -3.988197, 0.2470588, 1, 0, 1,
-0.5248379, -0.1443128, -2.441251, 0.2431373, 1, 0, 1,
-0.5218383, 0.8285637, 0.9137689, 0.2352941, 1, 0, 1,
-0.5196675, 0.988683, -0.3222379, 0.2313726, 1, 0, 1,
-0.5169806, 0.1030234, -1.678438, 0.2235294, 1, 0, 1,
-0.5158272, -1.460973, -3.297567, 0.2196078, 1, 0, 1,
-0.5143549, -1.000629, -0.8746902, 0.2117647, 1, 0, 1,
-0.5114169, -1.527027, -3.221789, 0.2078431, 1, 0, 1,
-0.507887, 0.6737528, -0.9788511, 0.2, 1, 0, 1,
-0.5059435, 0.4851604, 0.02162143, 0.1921569, 1, 0, 1,
-0.5026001, -0.2904277, -0.2447529, 0.1882353, 1, 0, 1,
-0.5007079, 0.1029901, -1.391073, 0.1803922, 1, 0, 1,
-0.499665, 0.06873502, -1.933977, 0.1764706, 1, 0, 1,
-0.4985537, -0.4562587, -3.488286, 0.1686275, 1, 0, 1,
-0.4970791, 0.8812462, -1.578636, 0.1647059, 1, 0, 1,
-0.4970759, 0.8862458, -1.195382, 0.1568628, 1, 0, 1,
-0.494412, 0.966527, 0.1457963, 0.1529412, 1, 0, 1,
-0.4849873, 0.5155045, -1.534204, 0.145098, 1, 0, 1,
-0.4832536, 0.5995536, -0.3835367, 0.1411765, 1, 0, 1,
-0.4832237, -0.54232, -1.737761, 0.1333333, 1, 0, 1,
-0.4792721, 1.134219, -1.013664, 0.1294118, 1, 0, 1,
-0.4657658, -0.1745957, -2.274145, 0.1215686, 1, 0, 1,
-0.4576834, 1.154737, 0.2721682, 0.1176471, 1, 0, 1,
-0.4572992, 1.789673, -2.137693, 0.1098039, 1, 0, 1,
-0.4568225, 0.3010414, -1.6396, 0.1058824, 1, 0, 1,
-0.455532, -0.1624777, -3.136146, 0.09803922, 1, 0, 1,
-0.4511186, 0.1133868, -0.6844332, 0.09019608, 1, 0, 1,
-0.4492457, 0.4961355, -2.351384, 0.08627451, 1, 0, 1,
-0.4473279, 0.1473098, -2.013291, 0.07843138, 1, 0, 1,
-0.4465761, -0.6807703, -2.564552, 0.07450981, 1, 0, 1,
-0.4457102, -0.1570788, -3.820226, 0.06666667, 1, 0, 1,
-0.4452962, 0.2173621, -0.02144943, 0.0627451, 1, 0, 1,
-0.4450903, 0.8473698, -1.392234, 0.05490196, 1, 0, 1,
-0.4392009, 0.3372948, -0.6057587, 0.05098039, 1, 0, 1,
-0.4351165, 0.08239862, -1.916577, 0.04313726, 1, 0, 1,
-0.4320168, 0.1469058, -0.1651456, 0.03921569, 1, 0, 1,
-0.4308299, 1.786392, -1.183265, 0.03137255, 1, 0, 1,
-0.4262792, -0.7858072, -3.494019, 0.02745098, 1, 0, 1,
-0.4244206, -1.102383, -3.286587, 0.01960784, 1, 0, 1,
-0.4239929, -0.9979751, -1.440407, 0.01568628, 1, 0, 1,
-0.4217766, 0.8470387, -2.877018, 0.007843138, 1, 0, 1,
-0.4158445, 0.3781119, -0.14352, 0.003921569, 1, 0, 1,
-0.4124112, 1.241901, -0.6511104, 0, 1, 0.003921569, 1,
-0.4120097, 0.7379786, -1.193234, 0, 1, 0.01176471, 1,
-0.4101233, 0.298812, -0.7683065, 0, 1, 0.01568628, 1,
-0.4075829, 0.4905115, 0.7387955, 0, 1, 0.02352941, 1,
-0.4051126, 1.091389, -1.562774, 0, 1, 0.02745098, 1,
-0.4034237, -1.750393, -2.378172, 0, 1, 0.03529412, 1,
-0.4006172, -2.06476, -3.431002, 0, 1, 0.03921569, 1,
-0.3980004, 0.1800341, -0.7672787, 0, 1, 0.04705882, 1,
-0.3917793, 1.112337, 0.1869605, 0, 1, 0.05098039, 1,
-0.3892189, -0.2361156, -2.511595, 0, 1, 0.05882353, 1,
-0.3862298, -0.1387371, -0.8464215, 0, 1, 0.0627451, 1,
-0.3861224, -1.515035, -1.430635, 0, 1, 0.07058824, 1,
-0.3855281, -0.6158581, -1.159912, 0, 1, 0.07450981, 1,
-0.3834934, 1.70763, -1.25906, 0, 1, 0.08235294, 1,
-0.3825652, 0.1222115, -1.778112, 0, 1, 0.08627451, 1,
-0.3773811, 1.287338, -1.683707, 0, 1, 0.09411765, 1,
-0.3751038, -1.190961, -1.401993, 0, 1, 0.1019608, 1,
-0.3732567, -0.1488106, -3.308509, 0, 1, 0.1058824, 1,
-0.3729406, 0.8884249, -0.7484646, 0, 1, 0.1137255, 1,
-0.3708597, 0.2003073, -1.308672, 0, 1, 0.1176471, 1,
-0.3702013, 1.488489, -1.853122, 0, 1, 0.1254902, 1,
-0.3688304, 0.4507264, -1.911994, 0, 1, 0.1294118, 1,
-0.3647545, 0.6750501, 0.6746871, 0, 1, 0.1372549, 1,
-0.3638269, 1.499597, -1.374102, 0, 1, 0.1411765, 1,
-0.35624, -0.0286896, -1.918213, 0, 1, 0.1490196, 1,
-0.3533608, -0.4847594, -3.92142, 0, 1, 0.1529412, 1,
-0.3502326, -1.448781, -2.298464, 0, 1, 0.1607843, 1,
-0.3475502, 1.207111, -1.341919, 0, 1, 0.1647059, 1,
-0.3456398, 0.1169098, -1.632394, 0, 1, 0.172549, 1,
-0.3454567, -1.181236, -1.60366, 0, 1, 0.1764706, 1,
-0.3421074, -0.9038746, -4.28631, 0, 1, 0.1843137, 1,
-0.3383902, -1.208774, -3.694244, 0, 1, 0.1882353, 1,
-0.3377769, -0.6287861, -2.917092, 0, 1, 0.1960784, 1,
-0.3375867, 0.3169846, -0.2422926, 0, 1, 0.2039216, 1,
-0.3374129, -0.9661455, -3.009068, 0, 1, 0.2078431, 1,
-0.3324625, -1.184503, -2.227746, 0, 1, 0.2156863, 1,
-0.3311831, -1.161972, -4.188811, 0, 1, 0.2196078, 1,
-0.3279812, 0.8969479, -1.400309, 0, 1, 0.227451, 1,
-0.3210153, 1.12688, -1.013067, 0, 1, 0.2313726, 1,
-0.3160514, -1.842177, -2.647918, 0, 1, 0.2392157, 1,
-0.3159151, -0.8378594, -3.166664, 0, 1, 0.2431373, 1,
-0.3133166, 0.2158085, -1.661878, 0, 1, 0.2509804, 1,
-0.3106405, -0.5023136, -1.349343, 0, 1, 0.254902, 1,
-0.3086219, -0.970417, -0.8864907, 0, 1, 0.2627451, 1,
-0.3033052, -0.2439244, -2.287332, 0, 1, 0.2666667, 1,
-0.3001699, 1.464649, -0.1929756, 0, 1, 0.2745098, 1,
-0.2989062, -0.367466, -3.26169, 0, 1, 0.2784314, 1,
-0.2986189, -0.1252883, -1.708143, 0, 1, 0.2862745, 1,
-0.2943716, -0.4736845, -2.537589, 0, 1, 0.2901961, 1,
-0.2910239, -0.2781652, -2.353906, 0, 1, 0.2980392, 1,
-0.2904122, -1.068697, -2.871624, 0, 1, 0.3058824, 1,
-0.2889088, -1.19591, -2.91165, 0, 1, 0.3098039, 1,
-0.2881244, -0.04382082, -0.2675166, 0, 1, 0.3176471, 1,
-0.2843118, -0.2589513, -1.806569, 0, 1, 0.3215686, 1,
-0.2789367, -0.1605946, -1.539904, 0, 1, 0.3294118, 1,
-0.2755738, -0.4118724, -3.012939, 0, 1, 0.3333333, 1,
-0.2736518, -1.593456, -2.670623, 0, 1, 0.3411765, 1,
-0.2728966, -0.3988371, -2.264386, 0, 1, 0.345098, 1,
-0.2651817, 0.7765821, -0.1905915, 0, 1, 0.3529412, 1,
-0.2616925, 1.666301, -2.157062, 0, 1, 0.3568628, 1,
-0.2580967, -2.200735, -2.229215, 0, 1, 0.3647059, 1,
-0.256095, 0.1607326, -2.615594, 0, 1, 0.3686275, 1,
-0.2521063, 2.233569, 1.356633, 0, 1, 0.3764706, 1,
-0.2506972, 0.9798414, 0.773883, 0, 1, 0.3803922, 1,
-0.2495706, 2.214686, 0.1954797, 0, 1, 0.3882353, 1,
-0.2470917, -0.1449656, -2.042272, 0, 1, 0.3921569, 1,
-0.2435271, -1.28601, -3.100106, 0, 1, 0.4, 1,
-0.239343, 1.215533, 1.084907, 0, 1, 0.4078431, 1,
-0.2389438, 0.8363312, -0.6710681, 0, 1, 0.4117647, 1,
-0.2350404, 0.8918932, -0.5186585, 0, 1, 0.4196078, 1,
-0.2309835, -0.05591155, -2.705904, 0, 1, 0.4235294, 1,
-0.2285248, -1.457922, -2.707266, 0, 1, 0.4313726, 1,
-0.2240883, 0.4793524, -1.638133, 0, 1, 0.4352941, 1,
-0.2206271, -1.229188, -2.058749, 0, 1, 0.4431373, 1,
-0.2156844, -0.2539016, -2.521923, 0, 1, 0.4470588, 1,
-0.2113767, -0.7997154, -3.33275, 0, 1, 0.454902, 1,
-0.2064069, 1.287601, 0.8095818, 0, 1, 0.4588235, 1,
-0.2030034, 0.01432605, -0.9351, 0, 1, 0.4666667, 1,
-0.2019144, 1.450922, 1.143581, 0, 1, 0.4705882, 1,
-0.1993966, -1.615058, -3.530197, 0, 1, 0.4784314, 1,
-0.1990481, -0.192472, -1.282676, 0, 1, 0.4823529, 1,
-0.1946577, -0.9839164, -2.869416, 0, 1, 0.4901961, 1,
-0.1919797, -0.5053692, -3.049327, 0, 1, 0.4941176, 1,
-0.1892217, 0.7075472, -0.9454316, 0, 1, 0.5019608, 1,
-0.185975, 1.519055, 0.1193964, 0, 1, 0.509804, 1,
-0.1857554, -0.2486262, -2.194588, 0, 1, 0.5137255, 1,
-0.1842922, -1.757003, -3.850525, 0, 1, 0.5215687, 1,
-0.1823252, 0.3409258, -2.540429, 0, 1, 0.5254902, 1,
-0.1804591, 0.5110036, -0.01705071, 0, 1, 0.5333334, 1,
-0.1803907, -1.030965, -4.133396, 0, 1, 0.5372549, 1,
-0.1797696, 0.03569665, -1.37482, 0, 1, 0.5450981, 1,
-0.1785919, 1.778458, 0.03654564, 0, 1, 0.5490196, 1,
-0.1744863, 0.5431141, -0.003951528, 0, 1, 0.5568628, 1,
-0.1731588, 0.5845607, -0.7003742, 0, 1, 0.5607843, 1,
-0.1723089, 0.2283038, -0.05939269, 0, 1, 0.5686275, 1,
-0.1696998, -0.7727267, -3.657636, 0, 1, 0.572549, 1,
-0.1691369, -0.04299711, -3.011275, 0, 1, 0.5803922, 1,
-0.1662719, 0.01226048, -0.5802277, 0, 1, 0.5843138, 1,
-0.1535349, 1.438114, 1.03101, 0, 1, 0.5921569, 1,
-0.1519782, 0.4705631, 0.8801634, 0, 1, 0.5960785, 1,
-0.1482307, 0.5648634, -0.4837155, 0, 1, 0.6039216, 1,
-0.1474194, 0.1526164, -0.1796257, 0, 1, 0.6117647, 1,
-0.1452909, -0.6240213, -1.14442, 0, 1, 0.6156863, 1,
-0.1437852, -1.354493, -4.808387, 0, 1, 0.6235294, 1,
-0.1384797, -0.894118, -2.703426, 0, 1, 0.627451, 1,
-0.1368751, 1.008269, 0.5359784, 0, 1, 0.6352941, 1,
-0.1350679, -1.712443, -2.341173, 0, 1, 0.6392157, 1,
-0.1337486, 0.6411639, -1.748688, 0, 1, 0.6470588, 1,
-0.1311528, -1.077834, -1.47699, 0, 1, 0.6509804, 1,
-0.1281646, -0.9176984, -2.947, 0, 1, 0.6588235, 1,
-0.1271446, -0.5961515, -2.178793, 0, 1, 0.6627451, 1,
-0.1259909, 0.5847716, 1.207537, 0, 1, 0.6705883, 1,
-0.1250211, -1.223472, -2.967565, 0, 1, 0.6745098, 1,
-0.1240906, -0.6256434, -3.139861, 0, 1, 0.682353, 1,
-0.1224819, -0.7355217, -3.593959, 0, 1, 0.6862745, 1,
-0.1210698, -1.30456, -5.393077, 0, 1, 0.6941177, 1,
-0.1162632, 0.8670895, -0.1124808, 0, 1, 0.7019608, 1,
-0.1158816, -0.7378721, -4.129082, 0, 1, 0.7058824, 1,
-0.1155369, 0.158581, -2.280096, 0, 1, 0.7137255, 1,
-0.1150734, -0.1731041, -2.65544, 0, 1, 0.7176471, 1,
-0.115056, 0.821761, -0.6231102, 0, 1, 0.7254902, 1,
-0.111144, -2.163402, -3.396303, 0, 1, 0.7294118, 1,
-0.1077463, 0.8033884, -0.0210996, 0, 1, 0.7372549, 1,
-0.1054538, 0.0173329, -1.539344, 0, 1, 0.7411765, 1,
-0.1051152, -0.5400447, -2.986921, 0, 1, 0.7490196, 1,
-0.1007006, -0.6408678, -1.472356, 0, 1, 0.7529412, 1,
-0.09930761, 2.150591, -0.5465636, 0, 1, 0.7607843, 1,
-0.09593302, -0.08236486, -1.287538, 0, 1, 0.7647059, 1,
-0.09334525, -1.20176, -3.232602, 0, 1, 0.772549, 1,
-0.09173108, 0.624427, 0.6987681, 0, 1, 0.7764706, 1,
-0.08378447, -1.887846, -3.304075, 0, 1, 0.7843137, 1,
-0.07860675, -0.3692436, -3.819695, 0, 1, 0.7882353, 1,
-0.07800929, 0.7040136, -0.6508836, 0, 1, 0.7960784, 1,
-0.07738326, 0.3178189, -1.170845, 0, 1, 0.8039216, 1,
-0.07505439, 0.7703677, 0.638252, 0, 1, 0.8078431, 1,
-0.07358815, -0.9813922, -3.05719, 0, 1, 0.8156863, 1,
-0.07339618, -1.745277, -2.704009, 0, 1, 0.8196079, 1,
-0.06674673, 0.4315073, 1.016801, 0, 1, 0.827451, 1,
-0.0665702, -0.3899484, -1.344568, 0, 1, 0.8313726, 1,
-0.0648274, -0.2355788, -3.922898, 0, 1, 0.8392157, 1,
-0.06391557, -0.4721639, -2.9364, 0, 1, 0.8431373, 1,
-0.06313031, -0.9036047, -4.698582, 0, 1, 0.8509804, 1,
-0.05495489, -0.9772481, -3.825098, 0, 1, 0.854902, 1,
-0.05314782, 0.02564133, -1.952156, 0, 1, 0.8627451, 1,
-0.05284782, 0.9392657, -0.9333356, 0, 1, 0.8666667, 1,
-0.05073566, -0.2826255, -3.880116, 0, 1, 0.8745098, 1,
-0.05016521, -0.7569764, -3.514976, 0, 1, 0.8784314, 1,
-0.04653908, -0.4573065, -3.035514, 0, 1, 0.8862745, 1,
-0.04428998, -1.250279, -4.036305, 0, 1, 0.8901961, 1,
-0.03858091, 1.002707, -1.061178, 0, 1, 0.8980392, 1,
-0.03443212, -1.520023, -2.75512, 0, 1, 0.9058824, 1,
-0.03336769, -0.4426651, -4.459947, 0, 1, 0.9098039, 1,
-0.03128052, -0.02754579, -1.6488, 0, 1, 0.9176471, 1,
-0.03096845, -1.080649, -2.231805, 0, 1, 0.9215686, 1,
-0.03084063, -0.4911265, -3.094745, 0, 1, 0.9294118, 1,
-0.02779738, 0.117135, 1.419308, 0, 1, 0.9333333, 1,
-0.02726429, -0.6444728, -1.353913, 0, 1, 0.9411765, 1,
-0.02543432, -0.1029124, -1.339643, 0, 1, 0.945098, 1,
-0.0138957, -0.9089781, -4.194325, 0, 1, 0.9529412, 1,
-0.01272018, -0.7294189, -2.462681, 0, 1, 0.9568627, 1,
-0.01150249, 0.758893, 0.2949772, 0, 1, 0.9647059, 1,
-0.005979566, -0.1033098, -2.245309, 0, 1, 0.9686275, 1,
-0.00458364, -0.07182085, -3.606145, 0, 1, 0.9764706, 1,
0.005579936, 0.1308351, -0.2557763, 0, 1, 0.9803922, 1,
0.011217, 0.6995904, 0.3983187, 0, 1, 0.9882353, 1,
0.0195161, -0.5181115, 4.343305, 0, 1, 0.9921569, 1,
0.02359644, -1.37837, 2.214835, 0, 1, 1, 1,
0.02875178, -1.211443, 1.714079, 0, 0.9921569, 1, 1,
0.0288239, 0.9451007, -0.247091, 0, 0.9882353, 1, 1,
0.02912327, -0.9399105, 3.226059, 0, 0.9803922, 1, 1,
0.03009413, -0.06338453, 1.469774, 0, 0.9764706, 1, 1,
0.03420827, 0.4214299, 0.4924536, 0, 0.9686275, 1, 1,
0.03464569, -1.737512, 3.501893, 0, 0.9647059, 1, 1,
0.0348518, 1.503984, -1.14403, 0, 0.9568627, 1, 1,
0.03869408, 0.008663261, -0.002452022, 0, 0.9529412, 1, 1,
0.05529505, -2.153355, 3.967786, 0, 0.945098, 1, 1,
0.05615275, 1.26292, 0.4999355, 0, 0.9411765, 1, 1,
0.06356653, -1.776235, 3.160108, 0, 0.9333333, 1, 1,
0.0640671, -0.7264362, 3.277624, 0, 0.9294118, 1, 1,
0.06829897, -0.5508924, 2.202155, 0, 0.9215686, 1, 1,
0.07087927, 0.7113136, 1.207863, 0, 0.9176471, 1, 1,
0.07685044, -0.1720589, 2.064528, 0, 0.9098039, 1, 1,
0.07749578, 1.483542, -0.845515, 0, 0.9058824, 1, 1,
0.07805552, 0.7120445, -0.7998912, 0, 0.8980392, 1, 1,
0.08170766, 0.9169168, 2.123406, 0, 0.8901961, 1, 1,
0.08467503, 1.115452, 1.759644, 0, 0.8862745, 1, 1,
0.08503364, 0.1168481, -0.07096559, 0, 0.8784314, 1, 1,
0.08559716, -0.776727, 3.947561, 0, 0.8745098, 1, 1,
0.08617634, -0.3663879, 3.325679, 0, 0.8666667, 1, 1,
0.09104787, 1.343784, -0.2114533, 0, 0.8627451, 1, 1,
0.09316726, 1.176863, 1.361999, 0, 0.854902, 1, 1,
0.09631319, -0.07682732, 2.903244, 0, 0.8509804, 1, 1,
0.09637567, -1.064355, 5.147387, 0, 0.8431373, 1, 1,
0.1015168, 1.442899, 0.8730579, 0, 0.8392157, 1, 1,
0.1116725, 0.2708077, 1.253755, 0, 0.8313726, 1, 1,
0.1127071, -1.786018, 4.174342, 0, 0.827451, 1, 1,
0.1133631, -1.486887, 1.121235, 0, 0.8196079, 1, 1,
0.1133742, -0.9200749, 3.012455, 0, 0.8156863, 1, 1,
0.1178858, -0.2600692, 3.012579, 0, 0.8078431, 1, 1,
0.1192803, 0.8170249, 0.9705452, 0, 0.8039216, 1, 1,
0.1200681, 0.4333144, -0.4593423, 0, 0.7960784, 1, 1,
0.1284819, -0.1317172, 3.080656, 0, 0.7882353, 1, 1,
0.1324046, 0.8977283, 0.9373071, 0, 0.7843137, 1, 1,
0.1325416, -0.7940183, 3.292, 0, 0.7764706, 1, 1,
0.1372928, 1.089576, 0.775158, 0, 0.772549, 1, 1,
0.1378917, -0.06343362, 1.591403, 0, 0.7647059, 1, 1,
0.1384902, -1.361495, 4.565999, 0, 0.7607843, 1, 1,
0.1424369, -0.0646964, 2.619257, 0, 0.7529412, 1, 1,
0.144764, -1.458274, 3.689859, 0, 0.7490196, 1, 1,
0.1522492, 0.1678413, 1.353144, 0, 0.7411765, 1, 1,
0.1570186, 0.6871575, -1.167136, 0, 0.7372549, 1, 1,
0.1590783, 0.9894235, 0.09740423, 0, 0.7294118, 1, 1,
0.1624293, 1.194427, 0.3342728, 0, 0.7254902, 1, 1,
0.1666872, -0.556352, 2.097, 0, 0.7176471, 1, 1,
0.1696002, -0.07939647, 0.7058783, 0, 0.7137255, 1, 1,
0.1697492, -0.74131, 2.402551, 0, 0.7058824, 1, 1,
0.1715621, 2.162377, -0.8981025, 0, 0.6980392, 1, 1,
0.186285, 0.06783553, 0.01048036, 0, 0.6941177, 1, 1,
0.1866569, 0.09850627, 1.603136, 0, 0.6862745, 1, 1,
0.1884791, -0.1088834, 1.410317, 0, 0.682353, 1, 1,
0.1895782, 0.31402, 0.323788, 0, 0.6745098, 1, 1,
0.1936553, -0.3892913, 4.462284, 0, 0.6705883, 1, 1,
0.202395, -0.1981454, 2.251548, 0, 0.6627451, 1, 1,
0.2054392, -1.341498, 3.955681, 0, 0.6588235, 1, 1,
0.2073697, -0.9748863, 3.326782, 0, 0.6509804, 1, 1,
0.2135132, 1.326712, 2.441562, 0, 0.6470588, 1, 1,
0.2145287, -0.05811245, 3.021116, 0, 0.6392157, 1, 1,
0.2155247, -1.524359, 1.591677, 0, 0.6352941, 1, 1,
0.2188028, 0.8838418, -0.5439171, 0, 0.627451, 1, 1,
0.2195395, 1.303785, -2.099968, 0, 0.6235294, 1, 1,
0.2215295, -1.096283, 3.21176, 0, 0.6156863, 1, 1,
0.2247412, -1.306397, 3.302685, 0, 0.6117647, 1, 1,
0.2255377, 0.2617891, 1.298886, 0, 0.6039216, 1, 1,
0.2293407, -1.358396, 2.728384, 0, 0.5960785, 1, 1,
0.2369141, -0.409261, 2.609634, 0, 0.5921569, 1, 1,
0.2446946, -1.445594, -0.2678367, 0, 0.5843138, 1, 1,
0.247206, -0.9758713, 2.260219, 0, 0.5803922, 1, 1,
0.2483013, -1.003746, 4.155647, 0, 0.572549, 1, 1,
0.2494973, 1.133976, 0.5672856, 0, 0.5686275, 1, 1,
0.2500155, -0.2424051, 1.893443, 0, 0.5607843, 1, 1,
0.254959, -0.8272218, 3.587107, 0, 0.5568628, 1, 1,
0.2576852, -0.9819353, 2.685193, 0, 0.5490196, 1, 1,
0.2603226, -0.9376933, 2.569192, 0, 0.5450981, 1, 1,
0.2671814, 0.07284615, -0.9492993, 0, 0.5372549, 1, 1,
0.2716534, -0.4608977, 2.352576, 0, 0.5333334, 1, 1,
0.2747889, -0.2222137, 0.3182394, 0, 0.5254902, 1, 1,
0.2798098, -0.1551719, 1.953804, 0, 0.5215687, 1, 1,
0.2814751, 0.3571611, 1.406993, 0, 0.5137255, 1, 1,
0.2834907, -0.2425475, 3.478562, 0, 0.509804, 1, 1,
0.2856758, 0.009535095, 1.843019, 0, 0.5019608, 1, 1,
0.2863716, 0.359651, 2.079599, 0, 0.4941176, 1, 1,
0.2892269, 1.222945, 1.594253, 0, 0.4901961, 1, 1,
0.2912985, 1.397374, 0.7585617, 0, 0.4823529, 1, 1,
0.2936271, -0.2787472, 1.187059, 0, 0.4784314, 1, 1,
0.2955948, 0.009429836, 1.930005, 0, 0.4705882, 1, 1,
0.2974168, -0.4588044, 1.744806, 0, 0.4666667, 1, 1,
0.3047121, -0.325643, 2.83208, 0, 0.4588235, 1, 1,
0.3059493, 0.01194547, 2.653378, 0, 0.454902, 1, 1,
0.3064068, -0.05171454, 1.749907, 0, 0.4470588, 1, 1,
0.3074474, -0.2622135, 3.064374, 0, 0.4431373, 1, 1,
0.3079553, -2.030433, 1.681219, 0, 0.4352941, 1, 1,
0.3096724, -2.432962, 2.535627, 0, 0.4313726, 1, 1,
0.3159959, -0.5254604, 2.252309, 0, 0.4235294, 1, 1,
0.3197643, -0.5912989, 3.632622, 0, 0.4196078, 1, 1,
0.3219613, -0.5255329, 1.673136, 0, 0.4117647, 1, 1,
0.3232821, 1.657972, 1.1354, 0, 0.4078431, 1, 1,
0.3243499, 0.3521566, 0.447243, 0, 0.4, 1, 1,
0.3277699, 0.9190844, -1.012095, 0, 0.3921569, 1, 1,
0.3312436, 1.566983, 1.519954, 0, 0.3882353, 1, 1,
0.3313836, -0.6071404, 3.554472, 0, 0.3803922, 1, 1,
0.3346428, -0.6861417, 1.519836, 0, 0.3764706, 1, 1,
0.3393828, 1.575004, -0.1758652, 0, 0.3686275, 1, 1,
0.3435379, 0.8323807, 2.031819, 0, 0.3647059, 1, 1,
0.3435501, -1.210032, 1.345124, 0, 0.3568628, 1, 1,
0.3437416, 0.4965414, -0.2253664, 0, 0.3529412, 1, 1,
0.3493502, 0.7635856, -0.5500388, 0, 0.345098, 1, 1,
0.3505061, 1.531542, -0.5145503, 0, 0.3411765, 1, 1,
0.3620439, -0.8468851, 0.9308842, 0, 0.3333333, 1, 1,
0.36288, -0.9284725, 3.290422, 0, 0.3294118, 1, 1,
0.3634309, -0.009557834, 2.3063, 0, 0.3215686, 1, 1,
0.3647937, 0.587169, 0.7237403, 0, 0.3176471, 1, 1,
0.3665018, -0.890833, 1.319192, 0, 0.3098039, 1, 1,
0.3717414, 0.8902511, 0.1801428, 0, 0.3058824, 1, 1,
0.3720579, -1.059947, 3.12478, 0, 0.2980392, 1, 1,
0.3737677, 0.8223411, -0.4745005, 0, 0.2901961, 1, 1,
0.3750542, 0.8761715, 1.394945, 0, 0.2862745, 1, 1,
0.3813164, 1.708304, 0.799982, 0, 0.2784314, 1, 1,
0.3857099, 0.3629145, -0.2835595, 0, 0.2745098, 1, 1,
0.3866956, -0.3115754, 2.179748, 0, 0.2666667, 1, 1,
0.3880061, -2.437946, 4.268547, 0, 0.2627451, 1, 1,
0.3883346, 1.600558, -0.11897, 0, 0.254902, 1, 1,
0.3883796, -0.3977015, 3.659755, 0, 0.2509804, 1, 1,
0.3891997, -0.9325004, 1.262296, 0, 0.2431373, 1, 1,
0.3907935, -0.4977427, 2.24583, 0, 0.2392157, 1, 1,
0.3913825, -1.223269, 4.073978, 0, 0.2313726, 1, 1,
0.3962911, 0.3438035, 0.2714186, 0, 0.227451, 1, 1,
0.3962981, 0.2171088, 2.479989, 0, 0.2196078, 1, 1,
0.3975127, 1.847849, 1.569167, 0, 0.2156863, 1, 1,
0.3980212, 0.2443782, -0.05803563, 0, 0.2078431, 1, 1,
0.4007609, 0.8679934, 1.455801, 0, 0.2039216, 1, 1,
0.4028059, -0.5168812, 1.758227, 0, 0.1960784, 1, 1,
0.4031532, 1.633056, 1.898983, 0, 0.1882353, 1, 1,
0.4106666, 0.6810718, 0.08145215, 0, 0.1843137, 1, 1,
0.4125297, -1.475921, 2.575898, 0, 0.1764706, 1, 1,
0.415665, -1.429393, 3.991819, 0, 0.172549, 1, 1,
0.4297123, 0.3152115, 1.457531, 0, 0.1647059, 1, 1,
0.430937, -0.5872437, 2.194079, 0, 0.1607843, 1, 1,
0.4316724, 0.7475421, -1.222693, 0, 0.1529412, 1, 1,
0.4329843, 0.5454797, 1.158268, 0, 0.1490196, 1, 1,
0.4359366, -2.04564, 2.398722, 0, 0.1411765, 1, 1,
0.4399613, -0.6643813, 3.139092, 0, 0.1372549, 1, 1,
0.4400564, 1.451771, 0.4641289, 0, 0.1294118, 1, 1,
0.4401851, -0.5973235, 3.535255, 0, 0.1254902, 1, 1,
0.4421008, 0.6351625, 0.2292496, 0, 0.1176471, 1, 1,
0.4422675, -0.3644275, 1.876376, 0, 0.1137255, 1, 1,
0.4461398, 2.005252, 0.2153064, 0, 0.1058824, 1, 1,
0.4463913, -0.4865973, 4.044398, 0, 0.09803922, 1, 1,
0.4486847, -0.0001575508, 1.160014, 0, 0.09411765, 1, 1,
0.450006, 0.2278928, -0.2464348, 0, 0.08627451, 1, 1,
0.4534582, 0.002629545, 2.443504, 0, 0.08235294, 1, 1,
0.4541126, -0.7069222, 3.255146, 0, 0.07450981, 1, 1,
0.4548876, -0.1772051, 1.124632, 0, 0.07058824, 1, 1,
0.4550597, 1.610519, -1.190885, 0, 0.0627451, 1, 1,
0.4562938, 0.601047, 1.269869, 0, 0.05882353, 1, 1,
0.4589323, -0.8552402, 1.586772, 0, 0.05098039, 1, 1,
0.4599167, -0.2085348, 3.901953, 0, 0.04705882, 1, 1,
0.4604444, -0.5773783, 1.783182, 0, 0.03921569, 1, 1,
0.4616648, 0.1050953, 1.207025, 0, 0.03529412, 1, 1,
0.4631908, -1.362367, 2.53325, 0, 0.02745098, 1, 1,
0.4648774, 0.8470783, 2.019346, 0, 0.02352941, 1, 1,
0.4702314, -1.090017, 2.914646, 0, 0.01568628, 1, 1,
0.4737067, -1.514446, 3.268921, 0, 0.01176471, 1, 1,
0.4770117, 1.458512, -1.857442, 0, 0.003921569, 1, 1,
0.4770288, -1.846047, 3.910872, 0.003921569, 0, 1, 1,
0.4771617, 0.1001785, 2.23612, 0.007843138, 0, 1, 1,
0.4781483, 0.5810057, -0.6670382, 0.01568628, 0, 1, 1,
0.4841198, 1.236906, 0.1503961, 0.01960784, 0, 1, 1,
0.4859179, -1.98578, 3.372237, 0.02745098, 0, 1, 1,
0.4874834, 0.7910343, 1.057091, 0.03137255, 0, 1, 1,
0.49345, -1.983301, 3.380432, 0.03921569, 0, 1, 1,
0.4952988, -0.4526417, 2.18453, 0.04313726, 0, 1, 1,
0.4981218, -0.5031354, 4.442325, 0.05098039, 0, 1, 1,
0.4990054, -0.04830675, 2.806784, 0.05490196, 0, 1, 1,
0.5019658, -0.5971183, 1.480671, 0.0627451, 0, 1, 1,
0.502822, -1.168344, 2.129694, 0.06666667, 0, 1, 1,
0.5034739, -1.020066, 2.260545, 0.07450981, 0, 1, 1,
0.5038735, 0.03235279, 2.098943, 0.07843138, 0, 1, 1,
0.5101051, 0.147956, 1.933638, 0.08627451, 0, 1, 1,
0.5172485, -1.070101, 3.410164, 0.09019608, 0, 1, 1,
0.5298579, 0.8908422, 1.516406, 0.09803922, 0, 1, 1,
0.5334793, -0.3488252, 1.426587, 0.1058824, 0, 1, 1,
0.5418556, -0.703581, 3.082891, 0.1098039, 0, 1, 1,
0.5429937, 1.079076, -0.2878808, 0.1176471, 0, 1, 1,
0.5431429, 0.2907928, 2.075355, 0.1215686, 0, 1, 1,
0.544175, 0.8006122, 0.09428324, 0.1294118, 0, 1, 1,
0.5568445, -3.011774, 2.901375, 0.1333333, 0, 1, 1,
0.5634973, 0.5884342, 2.903399, 0.1411765, 0, 1, 1,
0.5664478, 0.9286455, 0.7483665, 0.145098, 0, 1, 1,
0.5668375, -0.06604244, 3.4479, 0.1529412, 0, 1, 1,
0.5669387, 1.057896, -0.5770944, 0.1568628, 0, 1, 1,
0.5681925, 0.5081698, 3.105252, 0.1647059, 0, 1, 1,
0.5683991, -0.8025268, 3.291842, 0.1686275, 0, 1, 1,
0.5698715, 0.5078896, 0.592356, 0.1764706, 0, 1, 1,
0.5700798, 0.1732371, 1.214584, 0.1803922, 0, 1, 1,
0.5717927, -0.2378536, 3.455148, 0.1882353, 0, 1, 1,
0.5730247, -1.145079, 3.361438, 0.1921569, 0, 1, 1,
0.575641, 0.01877805, 0.4141004, 0.2, 0, 1, 1,
0.5758544, 0.5292585, 2.153156, 0.2078431, 0, 1, 1,
0.5782223, -1.346226, 2.47264, 0.2117647, 0, 1, 1,
0.5813724, -1.465955, 4.10568, 0.2196078, 0, 1, 1,
0.5851704, -0.1838951, 2.589339, 0.2235294, 0, 1, 1,
0.588576, 1.494372, 1.020651, 0.2313726, 0, 1, 1,
0.588961, -1.291443, 3.326716, 0.2352941, 0, 1, 1,
0.5899193, -0.7040727, 1.867554, 0.2431373, 0, 1, 1,
0.59113, 2.345933, 0.08114366, 0.2470588, 0, 1, 1,
0.5924613, 0.4869884, 0.689048, 0.254902, 0, 1, 1,
0.5933552, -0.6105722, 1.15903, 0.2588235, 0, 1, 1,
0.5951802, 0.4205267, 0.3538484, 0.2666667, 0, 1, 1,
0.5968322, 1.85638, 0.3807345, 0.2705882, 0, 1, 1,
0.5968857, -0.7838486, 3.485029, 0.2784314, 0, 1, 1,
0.5969724, -0.4997643, 1.067537, 0.282353, 0, 1, 1,
0.5984959, -1.256704, 2.551629, 0.2901961, 0, 1, 1,
0.5996482, 0.1403382, -0.3381278, 0.2941177, 0, 1, 1,
0.6018914, -1.335627, 2.68499, 0.3019608, 0, 1, 1,
0.6019874, -1.118972, 1.880215, 0.3098039, 0, 1, 1,
0.6026739, 0.5225045, 1.83624, 0.3137255, 0, 1, 1,
0.6028187, -1.743303, 2.711467, 0.3215686, 0, 1, 1,
0.6036064, -1.923509, 2.287379, 0.3254902, 0, 1, 1,
0.6037973, 0.339258, 2.097049, 0.3333333, 0, 1, 1,
0.6055748, 0.08630903, 0.2477233, 0.3372549, 0, 1, 1,
0.6104262, 0.8327992, 0.04794135, 0.345098, 0, 1, 1,
0.6123945, -0.7359846, 2.115098, 0.3490196, 0, 1, 1,
0.6179149, 0.6839609, 1.271993, 0.3568628, 0, 1, 1,
0.6239756, 0.81888, 1.376376, 0.3607843, 0, 1, 1,
0.6288592, 0.8896233, 0.6358106, 0.3686275, 0, 1, 1,
0.6289452, -2.456719, 2.548421, 0.372549, 0, 1, 1,
0.6327708, -1.676777, 3.364115, 0.3803922, 0, 1, 1,
0.6378604, -0.7289325, 3.279948, 0.3843137, 0, 1, 1,
0.6387898, -0.3053355, 1.862247, 0.3921569, 0, 1, 1,
0.6412901, -0.2528248, 1.538694, 0.3960784, 0, 1, 1,
0.6470006, -0.1934793, 0.6958465, 0.4039216, 0, 1, 1,
0.6489279, -0.1837247, 1.94059, 0.4117647, 0, 1, 1,
0.6538121, 0.9912896, 1.292363, 0.4156863, 0, 1, 1,
0.6542557, -1.305629, 2.233479, 0.4235294, 0, 1, 1,
0.6552577, 1.867932, -0.3097385, 0.427451, 0, 1, 1,
0.6557211, 0.1634099, 0.6996813, 0.4352941, 0, 1, 1,
0.6561306, -2.092023, 3.517528, 0.4392157, 0, 1, 1,
0.6661565, 0.1223729, 2.385401, 0.4470588, 0, 1, 1,
0.669259, -1.176284, 1.135417, 0.4509804, 0, 1, 1,
0.6736149, 0.3252252, 0.1458513, 0.4588235, 0, 1, 1,
0.6847489, 1.138037, 2.027854, 0.4627451, 0, 1, 1,
0.689807, -1.224559, 3.39218, 0.4705882, 0, 1, 1,
0.689833, 0.5159473, 1.044633, 0.4745098, 0, 1, 1,
0.692807, -0.6945146, 2.614655, 0.4823529, 0, 1, 1,
0.7025315, 1.183771, 0.3409702, 0.4862745, 0, 1, 1,
0.7055488, 0.3437156, 0.2969235, 0.4941176, 0, 1, 1,
0.7056182, -0.8108587, 2.908107, 0.5019608, 0, 1, 1,
0.7075791, 0.5553663, 0.9537886, 0.5058824, 0, 1, 1,
0.7100496, 0.6859106, 2.553325, 0.5137255, 0, 1, 1,
0.7204081, 1.863426, -0.187803, 0.5176471, 0, 1, 1,
0.7230651, -0.3215369, 3.189926, 0.5254902, 0, 1, 1,
0.7232261, 0.1009709, -0.03465583, 0.5294118, 0, 1, 1,
0.7302963, -0.790439, 3.641082, 0.5372549, 0, 1, 1,
0.7303126, -0.4393876, 2.004618, 0.5411765, 0, 1, 1,
0.7329745, 1.291463, -0.5217514, 0.5490196, 0, 1, 1,
0.7356192, -0.712054, 1.808322, 0.5529412, 0, 1, 1,
0.7384108, 1.039126, -0.3975011, 0.5607843, 0, 1, 1,
0.7454274, -0.6279486, 1.455873, 0.5647059, 0, 1, 1,
0.7459347, 0.04478415, 1.47773, 0.572549, 0, 1, 1,
0.7482403, -0.9969773, 2.364574, 0.5764706, 0, 1, 1,
0.7499699, 1.258289, 1.444162, 0.5843138, 0, 1, 1,
0.7545053, -0.545646, 3.638729, 0.5882353, 0, 1, 1,
0.7553529, 1.751094, 0.1868238, 0.5960785, 0, 1, 1,
0.7611181, -0.5984999, 2.202219, 0.6039216, 0, 1, 1,
0.7634568, 1.078806, 0.4574277, 0.6078432, 0, 1, 1,
0.7656957, 2.470185, -1.735075, 0.6156863, 0, 1, 1,
0.7706138, -1.393968, 2.265871, 0.6196079, 0, 1, 1,
0.77178, 0.008451446, 3.093066, 0.627451, 0, 1, 1,
0.7727383, 0.7107373, 3.57179, 0.6313726, 0, 1, 1,
0.7740414, -1.315329, 3.41722, 0.6392157, 0, 1, 1,
0.7763179, -0.3568435, 1.334325, 0.6431373, 0, 1, 1,
0.781851, -0.1335354, 1.609143, 0.6509804, 0, 1, 1,
0.7823369, -0.6277528, 0.4292198, 0.654902, 0, 1, 1,
0.7838693, 1.224177, 0.1787149, 0.6627451, 0, 1, 1,
0.7869424, 0.3992475, 2.492434, 0.6666667, 0, 1, 1,
0.790736, -0.151769, 1.474582, 0.6745098, 0, 1, 1,
0.7968604, 0.7274887, 0.4884383, 0.6784314, 0, 1, 1,
0.8011737, 0.9469749, -0.09144925, 0.6862745, 0, 1, 1,
0.8032357, 0.2561283, 0.8783355, 0.6901961, 0, 1, 1,
0.803501, 1.156226, 0.7455245, 0.6980392, 0, 1, 1,
0.8046839, -0.5316036, 2.906804, 0.7058824, 0, 1, 1,
0.8047665, 1.907412, 0.2849074, 0.7098039, 0, 1, 1,
0.8073132, -0.334723, 2.959087, 0.7176471, 0, 1, 1,
0.8116012, 0.8623968, 0.4781164, 0.7215686, 0, 1, 1,
0.8180628, 2.945047, 0.7075093, 0.7294118, 0, 1, 1,
0.8221762, -0.72816, 1.33863, 0.7333333, 0, 1, 1,
0.8261554, 1.64896, -0.8947127, 0.7411765, 0, 1, 1,
0.8290313, 0.9105958, -0.8930774, 0.7450981, 0, 1, 1,
0.8328536, -0.2184469, 1.294166, 0.7529412, 0, 1, 1,
0.8378381, -1.801385, 3.11153, 0.7568628, 0, 1, 1,
0.8453674, -1.1495, 1.27466, 0.7647059, 0, 1, 1,
0.8482355, 0.1757167, 2.444341, 0.7686275, 0, 1, 1,
0.8507032, -1.398683, 2.722345, 0.7764706, 0, 1, 1,
0.8568475, -0.3450129, 2.173794, 0.7803922, 0, 1, 1,
0.8650669, -1.516772, 2.652142, 0.7882353, 0, 1, 1,
0.8703967, 1.778512, 0.5275794, 0.7921569, 0, 1, 1,
0.8770639, -1.865814, 3.52545, 0.8, 0, 1, 1,
0.8772811, -0.4685642, 2.952692, 0.8078431, 0, 1, 1,
0.8805473, 0.1924281, 0.7433824, 0.8117647, 0, 1, 1,
0.8855873, 1.168117, -1.871513, 0.8196079, 0, 1, 1,
0.8860288, 1.611608, 1.337439, 0.8235294, 0, 1, 1,
0.8914686, 0.9495254, 0.1476678, 0.8313726, 0, 1, 1,
0.8969043, -0.1177785, 1.319318, 0.8352941, 0, 1, 1,
0.8969704, 1.143662, 0.296093, 0.8431373, 0, 1, 1,
0.8977015, -0.516229, 1.62728, 0.8470588, 0, 1, 1,
0.9030319, 0.5621589, 0.8645154, 0.854902, 0, 1, 1,
0.9091719, 0.274828, 2.554775, 0.8588235, 0, 1, 1,
0.9114332, 1.111304, 0.1239636, 0.8666667, 0, 1, 1,
0.9127219, 1.770617, 1.601215, 0.8705882, 0, 1, 1,
0.9127811, -0.6232291, 1.927922, 0.8784314, 0, 1, 1,
0.9132032, 0.549166, -0.04025067, 0.8823529, 0, 1, 1,
0.9141824, 0.9748577, 2.416193, 0.8901961, 0, 1, 1,
0.9207563, 1.461588, 0.8077698, 0.8941177, 0, 1, 1,
0.9325539, -2.065144, 2.526614, 0.9019608, 0, 1, 1,
0.9415338, 0.9045471, 2.020335, 0.9098039, 0, 1, 1,
0.9518333, 1.020541, 0.6342857, 0.9137255, 0, 1, 1,
0.9522524, -0.2475067, -0.3652796, 0.9215686, 0, 1, 1,
0.9575148, -1.223754, 2.051321, 0.9254902, 0, 1, 1,
0.9605052, 0.7935673, 1.278385, 0.9333333, 0, 1, 1,
0.962369, -0.6248875, 3.002886, 0.9372549, 0, 1, 1,
0.9657298, -0.7057553, 4.066061, 0.945098, 0, 1, 1,
0.966616, 0.1608494, -0.01686216, 0.9490196, 0, 1, 1,
0.9707148, 0.8224622, 0.1945446, 0.9568627, 0, 1, 1,
0.9730738, -1.990365, 3.665702, 0.9607843, 0, 1, 1,
0.975347, -1.301929, 1.240595, 0.9686275, 0, 1, 1,
0.9821501, 1.438689, 0.5335494, 0.972549, 0, 1, 1,
0.9824401, -1.416042, 1.432861, 0.9803922, 0, 1, 1,
0.9850286, -2.025337, 4.319579, 0.9843137, 0, 1, 1,
0.9879522, -0.3005546, 2.177903, 0.9921569, 0, 1, 1,
0.9896419, 0.6891585, -0.3730422, 0.9960784, 0, 1, 1,
0.9914901, 0.2081134, 0.1246141, 1, 0, 0.9960784, 1,
0.9965138, -0.5358061, 3.57469, 1, 0, 0.9882353, 1,
0.9984776, -0.1443271, 2.72611, 1, 0, 0.9843137, 1,
1.00023, 0.1978932, 0.6403852, 1, 0, 0.9764706, 1,
1.000894, 0.4579266, 3.709676, 1, 0, 0.972549, 1,
1.005869, 0.6061278, 0.7701426, 1, 0, 0.9647059, 1,
1.006223, 2.312421, 1.545169, 1, 0, 0.9607843, 1,
1.009044, -0.8946277, 1.40179, 1, 0, 0.9529412, 1,
1.012597, 1.436762, 1.079414, 1, 0, 0.9490196, 1,
1.014397, 0.4005203, 2.705583, 1, 0, 0.9411765, 1,
1.016684, -0.7771683, 3.066358, 1, 0, 0.9372549, 1,
1.016819, -0.4673785, 2.348428, 1, 0, 0.9294118, 1,
1.02512, -0.7856331, 4.054284, 1, 0, 0.9254902, 1,
1.028167, -0.03392209, 1.354395, 1, 0, 0.9176471, 1,
1.030848, -0.09228587, 0.2676232, 1, 0, 0.9137255, 1,
1.032628, -0.9317, 3.790267, 1, 0, 0.9058824, 1,
1.042568, 0.1662175, 0.2225671, 1, 0, 0.9019608, 1,
1.048028, 0.5754126, 2.662996, 1, 0, 0.8941177, 1,
1.050627, 0.1364717, 1.243826, 1, 0, 0.8862745, 1,
1.056025, 0.507228, 1.85487, 1, 0, 0.8823529, 1,
1.05914, -0.4359184, 1.182495, 1, 0, 0.8745098, 1,
1.06742, -0.5734593, 2.941018, 1, 0, 0.8705882, 1,
1.067861, -0.3490111, 3.939862, 1, 0, 0.8627451, 1,
1.070205, 0.4922114, 0.8200131, 1, 0, 0.8588235, 1,
1.07088, -1.472981, 3.559243, 1, 0, 0.8509804, 1,
1.081237, 2.291216, -0.3685133, 1, 0, 0.8470588, 1,
1.085014, 0.7119453, 0.4402595, 1, 0, 0.8392157, 1,
1.090485, 2.486062, 1.836842, 1, 0, 0.8352941, 1,
1.093168, -0.4893022, 2.506363, 1, 0, 0.827451, 1,
1.096235, -0.1389109, 1.140332, 1, 0, 0.8235294, 1,
1.10159, 0.6855564, 3.638106, 1, 0, 0.8156863, 1,
1.103524, 0.07268985, 2.699465, 1, 0, 0.8117647, 1,
1.109601, 0.7737082, 0.770332, 1, 0, 0.8039216, 1,
1.113863, -1.26322, 2.615681, 1, 0, 0.7960784, 1,
1.123154, -0.1684608, 1.379339, 1, 0, 0.7921569, 1,
1.124095, -0.2580554, 3.827551, 1, 0, 0.7843137, 1,
1.124929, -1.632994, 3.229799, 1, 0, 0.7803922, 1,
1.129008, 1.113044, 0.8568755, 1, 0, 0.772549, 1,
1.135013, 0.7811801, 0.03957894, 1, 0, 0.7686275, 1,
1.138366, 0.6316407, -0.8061892, 1, 0, 0.7607843, 1,
1.160534, -1.887655, 0.9959763, 1, 0, 0.7568628, 1,
1.167112, -0.6878651, 1.061349, 1, 0, 0.7490196, 1,
1.167901, -1.189194, 2.05693, 1, 0, 0.7450981, 1,
1.172337, -0.6109153, 2.171434, 1, 0, 0.7372549, 1,
1.175078, -1.389235, 0.5818751, 1, 0, 0.7333333, 1,
1.176642, 0.307405, 1.284045, 1, 0, 0.7254902, 1,
1.181873, 1.339069, 1.113195, 1, 0, 0.7215686, 1,
1.191126, 0.6382557, 1.82824, 1, 0, 0.7137255, 1,
1.198657, -0.2961063, 2.162026, 1, 0, 0.7098039, 1,
1.199128, 0.6287334, 0.866372, 1, 0, 0.7019608, 1,
1.208969, 0.5552286, 0.4222636, 1, 0, 0.6941177, 1,
1.211386, -1.733563, -0.110651, 1, 0, 0.6901961, 1,
1.217313, 0.3834358, 0.6692117, 1, 0, 0.682353, 1,
1.222722, 1.142447, 1.730793, 1, 0, 0.6784314, 1,
1.225366, -0.3724894, -0.2776074, 1, 0, 0.6705883, 1,
1.235961, 0.5605361, 2.363694, 1, 0, 0.6666667, 1,
1.24766, 1.007385, 0.3767664, 1, 0, 0.6588235, 1,
1.249424, 1.257206, 1.191331, 1, 0, 0.654902, 1,
1.255153, -1.152898, 2.335208, 1, 0, 0.6470588, 1,
1.258077, 1.762569, 1.088684, 1, 0, 0.6431373, 1,
1.260905, -1.068774, 1.976158, 1, 0, 0.6352941, 1,
1.261111, 2.182252, 0.4307017, 1, 0, 0.6313726, 1,
1.261967, -0.6052232, 0.5932792, 1, 0, 0.6235294, 1,
1.264137, -0.4320937, 2.738773, 1, 0, 0.6196079, 1,
1.264737, 1.483926, 2.486321, 1, 0, 0.6117647, 1,
1.267276, -0.9359885, 0.895628, 1, 0, 0.6078432, 1,
1.269986, -0.7707507, 2.2724, 1, 0, 0.6, 1,
1.273788, -0.4592722, 2.38253, 1, 0, 0.5921569, 1,
1.27522, -0.5412299, 2.294036, 1, 0, 0.5882353, 1,
1.276872, 1.819084, -0.277052, 1, 0, 0.5803922, 1,
1.279228, -1.87292, 2.000158, 1, 0, 0.5764706, 1,
1.291437, 0.6183743, 2.12142, 1, 0, 0.5686275, 1,
1.29872, 1.394503, 0.1008048, 1, 0, 0.5647059, 1,
1.305097, -0.8451242, 2.585451, 1, 0, 0.5568628, 1,
1.31229, -0.4169274, 0.4997742, 1, 0, 0.5529412, 1,
1.313156, -0.3152445, 2.375135, 1, 0, 0.5450981, 1,
1.313574, 1.033759, 1.195775, 1, 0, 0.5411765, 1,
1.319147, 0.9190004, -0.8176842, 1, 0, 0.5333334, 1,
1.328609, 0.1635495, 2.074712, 1, 0, 0.5294118, 1,
1.334329, 0.1392803, -0.6660392, 1, 0, 0.5215687, 1,
1.340572, -0.1116028, 3.071863, 1, 0, 0.5176471, 1,
1.34109, 1.331654, 0.1181381, 1, 0, 0.509804, 1,
1.366644, -0.6951679, 1.447109, 1, 0, 0.5058824, 1,
1.388283, 0.03002668, 0.8472484, 1, 0, 0.4980392, 1,
1.392936, -0.06290097, 1.169172, 1, 0, 0.4901961, 1,
1.419133, -2.927027, 2.303705, 1, 0, 0.4862745, 1,
1.424286, 0.4518606, -1.203043, 1, 0, 0.4784314, 1,
1.428169, -0.2097011, 1.391952, 1, 0, 0.4745098, 1,
1.428217, -1.414313, 4.396946, 1, 0, 0.4666667, 1,
1.435531, 0.4242527, 0.7003599, 1, 0, 0.4627451, 1,
1.470871, -1.928284, 3.117957, 1, 0, 0.454902, 1,
1.47851, -0.5632436, 2.539051, 1, 0, 0.4509804, 1,
1.489198, 0.1715119, 1.506157, 1, 0, 0.4431373, 1,
1.492651, -1.301335, 2.248625, 1, 0, 0.4392157, 1,
1.493563, 1.103883, -2.096549, 1, 0, 0.4313726, 1,
1.499935, -0.350596, 1.530014, 1, 0, 0.427451, 1,
1.506915, 0.5030723, 1.247419, 1, 0, 0.4196078, 1,
1.51216, -0.4193478, 2.494822, 1, 0, 0.4156863, 1,
1.526014, -1.344998, 1.012289, 1, 0, 0.4078431, 1,
1.528044, -0.6666511, 2.207912, 1, 0, 0.4039216, 1,
1.541318, 0.3916737, 1.657564, 1, 0, 0.3960784, 1,
1.549523, -1.051135, 0.4503174, 1, 0, 0.3882353, 1,
1.551034, 1.067025, 1.637952, 1, 0, 0.3843137, 1,
1.551423, -1.183189, 1.143283, 1, 0, 0.3764706, 1,
1.567184, -0.9696509, 3.37147, 1, 0, 0.372549, 1,
1.567414, -0.03802054, 2.738813, 1, 0, 0.3647059, 1,
1.572094, -0.4555987, 3.340435, 1, 0, 0.3607843, 1,
1.572506, -0.7054002, 2.194511, 1, 0, 0.3529412, 1,
1.585188, -0.2153597, 1.833691, 1, 0, 0.3490196, 1,
1.588649, 0.1165794, 3.659979, 1, 0, 0.3411765, 1,
1.594162, -0.6785448, 2.964201, 1, 0, 0.3372549, 1,
1.615304, 1.176576, 0.8632218, 1, 0, 0.3294118, 1,
1.62648, 0.6858946, -0.2038884, 1, 0, 0.3254902, 1,
1.638768, -0.290787, 2.959445, 1, 0, 0.3176471, 1,
1.639408, 0.446222, 2.378601, 1, 0, 0.3137255, 1,
1.663537, -0.7468382, 1.693606, 1, 0, 0.3058824, 1,
1.675751, -0.9930491, 1.969255, 1, 0, 0.2980392, 1,
1.679226, 0.3094239, 2.896947, 1, 0, 0.2941177, 1,
1.684841, -0.8732001, 2.740784, 1, 0, 0.2862745, 1,
1.695535, -0.2781688, 0.7259594, 1, 0, 0.282353, 1,
1.702024, -0.2495607, 3.080453, 1, 0, 0.2745098, 1,
1.711521, 0.1559407, 0.8724203, 1, 0, 0.2705882, 1,
1.71529, -1.102586, 2.040849, 1, 0, 0.2627451, 1,
1.722385, -0.02568572, 2.393825, 1, 0, 0.2588235, 1,
1.730546, -0.2920484, 1.509368, 1, 0, 0.2509804, 1,
1.755185, 1.172237, -0.2324337, 1, 0, 0.2470588, 1,
1.774369, 0.6794558, 1.850568, 1, 0, 0.2392157, 1,
1.784087, -0.6196999, 1.124323, 1, 0, 0.2352941, 1,
1.801104, 0.7427387, 0.2835482, 1, 0, 0.227451, 1,
1.842532, 2.208928, 2.189735, 1, 0, 0.2235294, 1,
1.844955, -0.9069766, 2.095758, 1, 0, 0.2156863, 1,
1.850576, -0.9643327, 1.918831, 1, 0, 0.2117647, 1,
1.880933, -1.822791, 3.624754, 1, 0, 0.2039216, 1,
1.8859, -1.595974, 0.7862837, 1, 0, 0.1960784, 1,
1.890506, 0.08677598, 1.026976, 1, 0, 0.1921569, 1,
1.892697, 0.7971179, 3.277102, 1, 0, 0.1843137, 1,
1.936303, 0.01179609, 0.367291, 1, 0, 0.1803922, 1,
1.960826, 0.4707396, -1.326399, 1, 0, 0.172549, 1,
1.966358, -0.2188933, 3.623516, 1, 0, 0.1686275, 1,
1.977182, -0.5498433, 1.411359, 1, 0, 0.1607843, 1,
1.982996, 0.4705854, 0.9459096, 1, 0, 0.1568628, 1,
1.99139, 1.664835, -1.240327, 1, 0, 0.1490196, 1,
2.024689, 0.1937756, 0.7229906, 1, 0, 0.145098, 1,
2.033828, 0.262708, 0.5669093, 1, 0, 0.1372549, 1,
2.039756, 1.414557, 1.582067, 1, 0, 0.1333333, 1,
2.087892, 0.2009466, 2.12997, 1, 0, 0.1254902, 1,
2.148232, 0.6481761, 2.249324, 1, 0, 0.1215686, 1,
2.153807, -0.01331789, 0.2232637, 1, 0, 0.1137255, 1,
2.162423, -1.203164, 3.83746, 1, 0, 0.1098039, 1,
2.165096, 1.361365, 1.752088, 1, 0, 0.1019608, 1,
2.175849, -0.07450953, 1.204679, 1, 0, 0.09411765, 1,
2.207675, -0.8696529, 1.800212, 1, 0, 0.09019608, 1,
2.225259, -0.6936041, 0.1266542, 1, 0, 0.08235294, 1,
2.315758, 0.4098692, 1.532536, 1, 0, 0.07843138, 1,
2.347983, -0.01059276, 1.694728, 1, 0, 0.07058824, 1,
2.376034, 0.614435, 1.901551, 1, 0, 0.06666667, 1,
2.43012, 1.116574, 1.967677, 1, 0, 0.05882353, 1,
2.517973, -1.68216, 4.375288, 1, 0, 0.05490196, 1,
2.529595, 3.133208, 0.5521066, 1, 0, 0.04705882, 1,
2.604305, 1.676309, 0.6586365, 1, 0, 0.04313726, 1,
2.636564, -2.503917, 1.777842, 1, 0, 0.03529412, 1,
2.649525, -0.304377, 1.636866, 1, 0, 0.03137255, 1,
2.677705, 1.058074, 1.036882, 1, 0, 0.02352941, 1,
2.739854, 0.3060798, 0.7157431, 1, 0, 0.01960784, 1,
2.969531, 0.6861358, 2.232483, 1, 0, 0.01176471, 1,
3.032583, 0.1433818, 0.3746551, 1, 0, 0.007843138, 1
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
-0.0274092, -4.053349, -7.179686, 0, -0.5, 0.5, 0.5,
-0.0274092, -4.053349, -7.179686, 1, -0.5, 0.5, 0.5,
-0.0274092, -4.053349, -7.179686, 1, 1.5, 0.5, 0.5,
-0.0274092, -4.053349, -7.179686, 0, 1.5, 0.5, 0.5
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
-4.124738, 0.06071675, -7.179686, 0, -0.5, 0.5, 0.5,
-4.124738, 0.06071675, -7.179686, 1, -0.5, 0.5, 0.5,
-4.124738, 0.06071675, -7.179686, 1, 1.5, 0.5, 0.5,
-4.124738, 0.06071675, -7.179686, 0, 1.5, 0.5, 0.5
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
-4.124738, -4.053349, -0.1228449, 0, -0.5, 0.5, 0.5,
-4.124738, -4.053349, -0.1228449, 1, -0.5, 0.5, 0.5,
-4.124738, -4.053349, -0.1228449, 1, 1.5, 0.5, 0.5,
-4.124738, -4.053349, -0.1228449, 0, 1.5, 0.5, 0.5
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
-3, -3.103949, -5.551184,
3, -3.103949, -5.551184,
-3, -3.103949, -5.551184,
-3, -3.262182, -5.822601,
-2, -3.103949, -5.551184,
-2, -3.262182, -5.822601,
-1, -3.103949, -5.551184,
-1, -3.262182, -5.822601,
0, -3.103949, -5.551184,
0, -3.262182, -5.822601,
1, -3.103949, -5.551184,
1, -3.262182, -5.822601,
2, -3.103949, -5.551184,
2, -3.262182, -5.822601,
3, -3.103949, -5.551184,
3, -3.262182, -5.822601
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
-3, -3.578649, -6.365435, 0, -0.5, 0.5, 0.5,
-3, -3.578649, -6.365435, 1, -0.5, 0.5, 0.5,
-3, -3.578649, -6.365435, 1, 1.5, 0.5, 0.5,
-3, -3.578649, -6.365435, 0, 1.5, 0.5, 0.5,
-2, -3.578649, -6.365435, 0, -0.5, 0.5, 0.5,
-2, -3.578649, -6.365435, 1, -0.5, 0.5, 0.5,
-2, -3.578649, -6.365435, 1, 1.5, 0.5, 0.5,
-2, -3.578649, -6.365435, 0, 1.5, 0.5, 0.5,
-1, -3.578649, -6.365435, 0, -0.5, 0.5, 0.5,
-1, -3.578649, -6.365435, 1, -0.5, 0.5, 0.5,
-1, -3.578649, -6.365435, 1, 1.5, 0.5, 0.5,
-1, -3.578649, -6.365435, 0, 1.5, 0.5, 0.5,
0, -3.578649, -6.365435, 0, -0.5, 0.5, 0.5,
0, -3.578649, -6.365435, 1, -0.5, 0.5, 0.5,
0, -3.578649, -6.365435, 1, 1.5, 0.5, 0.5,
0, -3.578649, -6.365435, 0, 1.5, 0.5, 0.5,
1, -3.578649, -6.365435, 0, -0.5, 0.5, 0.5,
1, -3.578649, -6.365435, 1, -0.5, 0.5, 0.5,
1, -3.578649, -6.365435, 1, 1.5, 0.5, 0.5,
1, -3.578649, -6.365435, 0, 1.5, 0.5, 0.5,
2, -3.578649, -6.365435, 0, -0.5, 0.5, 0.5,
2, -3.578649, -6.365435, 1, -0.5, 0.5, 0.5,
2, -3.578649, -6.365435, 1, 1.5, 0.5, 0.5,
2, -3.578649, -6.365435, 0, 1.5, 0.5, 0.5,
3, -3.578649, -6.365435, 0, -0.5, 0.5, 0.5,
3, -3.578649, -6.365435, 1, -0.5, 0.5, 0.5,
3, -3.578649, -6.365435, 1, 1.5, 0.5, 0.5,
3, -3.578649, -6.365435, 0, 1.5, 0.5, 0.5
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
-3.179201, -3, -5.551184,
-3.179201, 3, -5.551184,
-3.179201, -3, -5.551184,
-3.33679, -3, -5.822601,
-3.179201, -2, -5.551184,
-3.33679, -2, -5.822601,
-3.179201, -1, -5.551184,
-3.33679, -1, -5.822601,
-3.179201, 0, -5.551184,
-3.33679, 0, -5.822601,
-3.179201, 1, -5.551184,
-3.33679, 1, -5.822601,
-3.179201, 2, -5.551184,
-3.33679, 2, -5.822601,
-3.179201, 3, -5.551184,
-3.33679, 3, -5.822601
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
-3.651969, -3, -6.365435, 0, -0.5, 0.5, 0.5,
-3.651969, -3, -6.365435, 1, -0.5, 0.5, 0.5,
-3.651969, -3, -6.365435, 1, 1.5, 0.5, 0.5,
-3.651969, -3, -6.365435, 0, 1.5, 0.5, 0.5,
-3.651969, -2, -6.365435, 0, -0.5, 0.5, 0.5,
-3.651969, -2, -6.365435, 1, -0.5, 0.5, 0.5,
-3.651969, -2, -6.365435, 1, 1.5, 0.5, 0.5,
-3.651969, -2, -6.365435, 0, 1.5, 0.5, 0.5,
-3.651969, -1, -6.365435, 0, -0.5, 0.5, 0.5,
-3.651969, -1, -6.365435, 1, -0.5, 0.5, 0.5,
-3.651969, -1, -6.365435, 1, 1.5, 0.5, 0.5,
-3.651969, -1, -6.365435, 0, 1.5, 0.5, 0.5,
-3.651969, 0, -6.365435, 0, -0.5, 0.5, 0.5,
-3.651969, 0, -6.365435, 1, -0.5, 0.5, 0.5,
-3.651969, 0, -6.365435, 1, 1.5, 0.5, 0.5,
-3.651969, 0, -6.365435, 0, 1.5, 0.5, 0.5,
-3.651969, 1, -6.365435, 0, -0.5, 0.5, 0.5,
-3.651969, 1, -6.365435, 1, -0.5, 0.5, 0.5,
-3.651969, 1, -6.365435, 1, 1.5, 0.5, 0.5,
-3.651969, 1, -6.365435, 0, 1.5, 0.5, 0.5,
-3.651969, 2, -6.365435, 0, -0.5, 0.5, 0.5,
-3.651969, 2, -6.365435, 1, -0.5, 0.5, 0.5,
-3.651969, 2, -6.365435, 1, 1.5, 0.5, 0.5,
-3.651969, 2, -6.365435, 0, 1.5, 0.5, 0.5,
-3.651969, 3, -6.365435, 0, -0.5, 0.5, 0.5,
-3.651969, 3, -6.365435, 1, -0.5, 0.5, 0.5,
-3.651969, 3, -6.365435, 1, 1.5, 0.5, 0.5,
-3.651969, 3, -6.365435, 0, 1.5, 0.5, 0.5
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
-3.179201, -3.103949, -4,
-3.179201, -3.103949, 4,
-3.179201, -3.103949, -4,
-3.33679, -3.262182, -4,
-3.179201, -3.103949, -2,
-3.33679, -3.262182, -2,
-3.179201, -3.103949, 0,
-3.33679, -3.262182, 0,
-3.179201, -3.103949, 2,
-3.33679, -3.262182, 2,
-3.179201, -3.103949, 4,
-3.33679, -3.262182, 4
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
-3.651969, -3.578649, -4, 0, -0.5, 0.5, 0.5,
-3.651969, -3.578649, -4, 1, -0.5, 0.5, 0.5,
-3.651969, -3.578649, -4, 1, 1.5, 0.5, 0.5,
-3.651969, -3.578649, -4, 0, 1.5, 0.5, 0.5,
-3.651969, -3.578649, -2, 0, -0.5, 0.5, 0.5,
-3.651969, -3.578649, -2, 1, -0.5, 0.5, 0.5,
-3.651969, -3.578649, -2, 1, 1.5, 0.5, 0.5,
-3.651969, -3.578649, -2, 0, 1.5, 0.5, 0.5,
-3.651969, -3.578649, 0, 0, -0.5, 0.5, 0.5,
-3.651969, -3.578649, 0, 1, -0.5, 0.5, 0.5,
-3.651969, -3.578649, 0, 1, 1.5, 0.5, 0.5,
-3.651969, -3.578649, 0, 0, 1.5, 0.5, 0.5,
-3.651969, -3.578649, 2, 0, -0.5, 0.5, 0.5,
-3.651969, -3.578649, 2, 1, -0.5, 0.5, 0.5,
-3.651969, -3.578649, 2, 1, 1.5, 0.5, 0.5,
-3.651969, -3.578649, 2, 0, 1.5, 0.5, 0.5,
-3.651969, -3.578649, 4, 0, -0.5, 0.5, 0.5,
-3.651969, -3.578649, 4, 1, -0.5, 0.5, 0.5,
-3.651969, -3.578649, 4, 1, 1.5, 0.5, 0.5,
-3.651969, -3.578649, 4, 0, 1.5, 0.5, 0.5
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
-3.179201, -3.103949, -5.551184,
-3.179201, 3.225383, -5.551184,
-3.179201, -3.103949, 5.305494,
-3.179201, 3.225383, 5.305494,
-3.179201, -3.103949, -5.551184,
-3.179201, -3.103949, 5.305494,
-3.179201, 3.225383, -5.551184,
-3.179201, 3.225383, 5.305494,
-3.179201, -3.103949, -5.551184,
3.124382, -3.103949, -5.551184,
-3.179201, -3.103949, 5.305494,
3.124382, -3.103949, 5.305494,
-3.179201, 3.225383, -5.551184,
3.124382, 3.225383, -5.551184,
-3.179201, 3.225383, 5.305494,
3.124382, 3.225383, 5.305494,
3.124382, -3.103949, -5.551184,
3.124382, 3.225383, -5.551184,
3.124382, -3.103949, 5.305494,
3.124382, 3.225383, 5.305494,
3.124382, -3.103949, -5.551184,
3.124382, -3.103949, 5.305494,
3.124382, 3.225383, -5.551184,
3.124382, 3.225383, 5.305494
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
var radius = 7.507377;
var distance = 33.40117;
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
mvMatrix.translate( 0.0274092, -0.06071675, 0.1228449 );
mvMatrix.scale( 1.2877, 1.282461, 0.7476618 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.40117);
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
InChI_1S_C19H17Cl2N3<-read.table("InChI_1S_C19H17Cl2N3.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C19H17Cl2N3$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C19H17Cl2N3' not found
```

```r
y<-InChI_1S_C19H17Cl2N3$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C19H17Cl2N3' not found
```

```r
z<-InChI_1S_C19H17Cl2N3$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C19H17Cl2N3' not found
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
-3.087401, -0.4721791, -3.168684, 0, 0, 1, 1, 1,
-2.726437, 0.2901624, -0.4779089, 1, 0, 0, 1, 1,
-2.549778, 0.389064, -1.998286, 1, 0, 0, 1, 1,
-2.535673, 0.6594992, -0.2805878, 1, 0, 0, 1, 1,
-2.516608, 1.311675, -3.159348, 1, 0, 0, 1, 1,
-2.371025, -1.274951, -2.25606, 1, 0, 0, 1, 1,
-2.350034, -0.1976655, -1.163516, 0, 0, 0, 1, 1,
-2.329491, 0.4787671, -4.104971, 0, 0, 0, 1, 1,
-2.280536, 0.7983161, -2.845884, 0, 0, 0, 1, 1,
-2.258228, 0.06640776, -1.781525, 0, 0, 0, 1, 1,
-2.23105, 0.02892029, -2.989177, 0, 0, 0, 1, 1,
-2.196628, -0.3014551, -0.2455508, 0, 0, 0, 1, 1,
-2.180982, 1.893111, -0.5613884, 0, 0, 0, 1, 1,
-2.097019, 0.05491123, -1.068711, 1, 1, 1, 1, 1,
-2.054066, 0.232242, -1.122907, 1, 1, 1, 1, 1,
-2.011641, 0.7221383, -2.603989, 1, 1, 1, 1, 1,
-1.959713, 0.5426557, -2.643601, 1, 1, 1, 1, 1,
-1.956236, 0.1444555, -2.005267, 1, 1, 1, 1, 1,
-1.91954, 0.07360037, -0.03270387, 1, 1, 1, 1, 1,
-1.901847, 1.178691, -1.826054, 1, 1, 1, 1, 1,
-1.898762, 0.9295421, -1.795538, 1, 1, 1, 1, 1,
-1.869007, 1.380297, -1.193553, 1, 1, 1, 1, 1,
-1.856955, -0.03923316, -1.147106, 1, 1, 1, 1, 1,
-1.845656, -0.2526597, -1.052088, 1, 1, 1, 1, 1,
-1.826627, 1.536702, -1.607043, 1, 1, 1, 1, 1,
-1.81994, 1.046585, 0.2637733, 1, 1, 1, 1, 1,
-1.794826, 0.08410504, -1.441778, 1, 1, 1, 1, 1,
-1.790337, -2.797294, -1.355007, 1, 1, 1, 1, 1,
-1.789313, 0.151166, -3.363462, 0, 0, 1, 1, 1,
-1.786453, -1.336578, -1.431261, 1, 0, 0, 1, 1,
-1.771856, 1.47968, -0.9983547, 1, 0, 0, 1, 1,
-1.752283, -0.01997667, 0.09746271, 1, 0, 0, 1, 1,
-1.750199, 0.4700119, -0.3008682, 1, 0, 0, 1, 1,
-1.739, 1.154795, -0.9647793, 1, 0, 0, 1, 1,
-1.73893, -0.1219841, -2.133265, 0, 0, 0, 1, 1,
-1.737963, -0.1948871, -2.903148, 0, 0, 0, 1, 1,
-1.701628, 0.002300934, 0.2893868, 0, 0, 0, 1, 1,
-1.694312, -0.209687, -1.23799, 0, 0, 0, 1, 1,
-1.691646, 0.279931, 1.10034, 0, 0, 0, 1, 1,
-1.68566, -0.1099089, -3.245141, 0, 0, 0, 1, 1,
-1.680902, 0.9420608, -2.664388, 0, 0, 0, 1, 1,
-1.673303, 0.3353407, -1.150149, 1, 1, 1, 1, 1,
-1.669321, -0.763956, -1.962499, 1, 1, 1, 1, 1,
-1.656633, -1.55782, -2.676712, 1, 1, 1, 1, 1,
-1.644762, -0.975453, -1.820872, 1, 1, 1, 1, 1,
-1.640182, -0.01824775, -0.5200359, 1, 1, 1, 1, 1,
-1.635295, -0.5588465, -3.20382, 1, 1, 1, 1, 1,
-1.627051, 0.252823, 0.9605541, 1, 1, 1, 1, 1,
-1.586874, -0.3931117, -1.856617, 1, 1, 1, 1, 1,
-1.579967, 0.2464024, -0.02844092, 1, 1, 1, 1, 1,
-1.57487, 0.4417592, -0.7537594, 1, 1, 1, 1, 1,
-1.551941, 0.7281849, -1.697108, 1, 1, 1, 1, 1,
-1.551535, 0.4291988, -0.9208497, 1, 1, 1, 1, 1,
-1.549191, -1.651301, -1.688195, 1, 1, 1, 1, 1,
-1.535108, 2.127894, -0.8531007, 1, 1, 1, 1, 1,
-1.535054, -0.132969, -0.8685936, 1, 1, 1, 1, 1,
-1.533647, -2.326692, -1.615298, 0, 0, 1, 1, 1,
-1.524674, 0.4796504, -1.544468, 1, 0, 0, 1, 1,
-1.501671, 0.5160345, -1.212063, 1, 0, 0, 1, 1,
-1.491369, 1.038458, -1.21603, 1, 0, 0, 1, 1,
-1.48938, -0.7117209, -1.755935, 1, 0, 0, 1, 1,
-1.464943, 0.3113673, -2.215521, 1, 0, 0, 1, 1,
-1.462553, 0.1831147, -0.923007, 0, 0, 0, 1, 1,
-1.45057, 0.9504901, -2.381502, 0, 0, 0, 1, 1,
-1.445262, 0.5705568, -0.8801079, 0, 0, 0, 1, 1,
-1.441906, -0.517002, -4.567826, 0, 0, 0, 1, 1,
-1.437003, 0.4219196, -2.334901, 0, 0, 0, 1, 1,
-1.435302, 0.6535622, -1.252548, 0, 0, 0, 1, 1,
-1.428432, 0.0502276, -1.340186, 0, 0, 0, 1, 1,
-1.424558, 0.2928001, -1.479199, 1, 1, 1, 1, 1,
-1.420295, 0.08536707, -0.8632098, 1, 1, 1, 1, 1,
-1.407911, 1.073979, 0.2239813, 1, 1, 1, 1, 1,
-1.404567, 0.9741294, -0.7565224, 1, 1, 1, 1, 1,
-1.39252, 0.1102784, -1.808952, 1, 1, 1, 1, 1,
-1.390016, 0.3751481, -1.00404, 1, 1, 1, 1, 1,
-1.385262, -1.992398, -2.962166, 1, 1, 1, 1, 1,
-1.384956, 0.4924113, 0.5492802, 1, 1, 1, 1, 1,
-1.384532, -0.2289742, -1.341247, 1, 1, 1, 1, 1,
-1.375413, -1.742429, -1.276055, 1, 1, 1, 1, 1,
-1.374196, -0.2343015, -0.4090351, 1, 1, 1, 1, 1,
-1.367687, -0.03925561, -0.7097961, 1, 1, 1, 1, 1,
-1.367545, 0.486058, -1.410843, 1, 1, 1, 1, 1,
-1.363289, 0.6888925, -1.231606, 1, 1, 1, 1, 1,
-1.354363, -0.1966314, -2.264743, 1, 1, 1, 1, 1,
-1.350248, 1.121945, 0.2182744, 0, 0, 1, 1, 1,
-1.348769, -0.8825519, -2.103351, 1, 0, 0, 1, 1,
-1.341334, 0.3792667, -2.537882, 1, 0, 0, 1, 1,
-1.334975, -1.47301, -1.416764, 1, 0, 0, 1, 1,
-1.330702, -0.2208367, -1.150761, 1, 0, 0, 1, 1,
-1.329548, 0.5703172, -2.025051, 1, 0, 0, 1, 1,
-1.325479, 0.7132022, -0.7771949, 0, 0, 0, 1, 1,
-1.324721, 0.9439438, -1.457712, 0, 0, 0, 1, 1,
-1.322299, -0.7062888, -3.778567, 0, 0, 0, 1, 1,
-1.311525, 0.1215658, -1.607884, 0, 0, 0, 1, 1,
-1.298363, -0.724245, -2.522776, 0, 0, 0, 1, 1,
-1.29001, 0.7626256, -1.762945, 0, 0, 0, 1, 1,
-1.271646, -0.7753066, -1.720658, 0, 0, 0, 1, 1,
-1.268222, -0.1884199, -2.956206, 1, 1, 1, 1, 1,
-1.259442, 1.792897, 0.2433373, 1, 1, 1, 1, 1,
-1.257759, 0.2357654, -1.738513, 1, 1, 1, 1, 1,
-1.252264, 0.7788017, -2.093746, 1, 1, 1, 1, 1,
-1.250061, 0.4876925, -0.5880947, 1, 1, 1, 1, 1,
-1.249651, -0.3289302, -1.677398, 1, 1, 1, 1, 1,
-1.23431, -0.4336933, -1.731629, 1, 1, 1, 1, 1,
-1.233718, -0.2757331, -2.451357, 1, 1, 1, 1, 1,
-1.232061, -0.782982, -2.153457, 1, 1, 1, 1, 1,
-1.224617, 0.2441693, -0.2846769, 1, 1, 1, 1, 1,
-1.221611, -0.4996523, -2.194458, 1, 1, 1, 1, 1,
-1.220113, 0.03270333, -0.3876069, 1, 1, 1, 1, 1,
-1.214986, 1.335843, -2.51769, 1, 1, 1, 1, 1,
-1.210119, 0.3096215, -2.006785, 1, 1, 1, 1, 1,
-1.207421, -0.294579, -1.656788, 1, 1, 1, 1, 1,
-1.201693, 0.01409591, -0.6512927, 0, 0, 1, 1, 1,
-1.201453, -1.059965, -1.061835, 1, 0, 0, 1, 1,
-1.193052, 0.6488519, -2.641783, 1, 0, 0, 1, 1,
-1.191115, -0.3908728, -2.146948, 1, 0, 0, 1, 1,
-1.187999, 1.67687, -1.937937, 1, 0, 0, 1, 1,
-1.186542, -0.440073, -2.32112, 1, 0, 0, 1, 1,
-1.172592, -1.03549, -1.531238, 0, 0, 0, 1, 1,
-1.139194, -1.364353, -2.731347, 0, 0, 0, 1, 1,
-1.134865, 0.8421022, -1.5359, 0, 0, 0, 1, 1,
-1.130643, 1.124464, -1.968642, 0, 0, 0, 1, 1,
-1.127957, -0.2857287, -1.86899, 0, 0, 0, 1, 1,
-1.126796, 0.5927723, -0.4384366, 0, 0, 0, 1, 1,
-1.120032, 0.9257178, -0.7376115, 0, 0, 0, 1, 1,
-1.119648, -1.481194, -1.980389, 1, 1, 1, 1, 1,
-1.118662, 0.4642538, -0.7072203, 1, 1, 1, 1, 1,
-1.113984, 0.277925, -1.616201, 1, 1, 1, 1, 1,
-1.113148, 0.8053735, -1.458539, 1, 1, 1, 1, 1,
-1.098633, -0.9396109, -2.909221, 1, 1, 1, 1, 1,
-1.0943, -0.05783259, -1.713535, 1, 1, 1, 1, 1,
-1.092749, 1.986076, 0.7832795, 1, 1, 1, 1, 1,
-1.087505, -0.2061387, -1.586897, 1, 1, 1, 1, 1,
-1.079801, -0.03337486, -1.473895, 1, 1, 1, 1, 1,
-1.073799, -0.3632936, -1.103795, 1, 1, 1, 1, 1,
-1.072575, 1.059033, -0.5144965, 1, 1, 1, 1, 1,
-1.069612, -0.06591897, -1.939942, 1, 1, 1, 1, 1,
-1.06637, 0.8484097, 1.038026, 1, 1, 1, 1, 1,
-1.055801, 0.2876278, -1.64652, 1, 1, 1, 1, 1,
-1.04937, -1.527367, -3.211073, 1, 1, 1, 1, 1,
-1.045027, 1.103961, 0.3807794, 0, 0, 1, 1, 1,
-1.04261, -0.6979576, -3.028041, 1, 0, 0, 1, 1,
-1.037812, -1.397998, -0.7154957, 1, 0, 0, 1, 1,
-1.036183, -0.952758, -1.997152, 1, 0, 0, 1, 1,
-1.033061, 0.2460182, -0.9566831, 1, 0, 0, 1, 1,
-1.023715, -0.8790014, -2.856525, 1, 0, 0, 1, 1,
-1.016858, 0.5006536, -1.501408, 0, 0, 0, 1, 1,
-1.016306, 0.7885761, -1.942368, 0, 0, 0, 1, 1,
-1.014625, -1.059767, -2.432856, 0, 0, 0, 1, 1,
-1.014364, 1.324346, -0.2572055, 0, 0, 0, 1, 1,
-1.009365, -2.603929, -3.001108, 0, 0, 0, 1, 1,
-1.000603, -1.612709, -1.312409, 0, 0, 0, 1, 1,
-0.9965255, 0.9103661, -0.3714209, 0, 0, 0, 1, 1,
-0.993631, 0.6179712, -0.03553783, 1, 1, 1, 1, 1,
-0.9872983, -0.7685465, -2.246473, 1, 1, 1, 1, 1,
-0.9775424, -0.2016425, -0.2557784, 1, 1, 1, 1, 1,
-0.9706369, 0.5549667, -2.893199, 1, 1, 1, 1, 1,
-0.969745, 0.3415944, -1.849403, 1, 1, 1, 1, 1,
-0.9691342, 0.5401232, -0.9974974, 1, 1, 1, 1, 1,
-0.9639915, -1.71503, -1.387617, 1, 1, 1, 1, 1,
-0.9617661, 2.037248, 0.5012361, 1, 1, 1, 1, 1,
-0.9606842, 0.6349625, -0.3157865, 1, 1, 1, 1, 1,
-0.951956, 1.749128, 1.944746, 1, 1, 1, 1, 1,
-0.9469892, 0.2224824, -0.968371, 1, 1, 1, 1, 1,
-0.9436072, 0.3733441, -0.9269357, 1, 1, 1, 1, 1,
-0.9400482, 0.08153055, -1.69233, 1, 1, 1, 1, 1,
-0.9345921, 0.4368716, -0.7887749, 1, 1, 1, 1, 1,
-0.9283693, 0.1750269, -2.152906, 1, 1, 1, 1, 1,
-0.9272418, -1.154131, -2.103765, 0, 0, 1, 1, 1,
-0.9199411, -1.097253, -2.235039, 1, 0, 0, 1, 1,
-0.9195336, -0.5775178, -1.646425, 1, 0, 0, 1, 1,
-0.9173008, -0.3096667, -0.8683273, 1, 0, 0, 1, 1,
-0.9160565, -1.252316, -1.426959, 1, 0, 0, 1, 1,
-0.9067656, 0.8110229, -1.514649, 1, 0, 0, 1, 1,
-0.9039696, -0.0733945, -0.8345999, 0, 0, 0, 1, 1,
-0.8978877, -0.6919371, -3.290807, 0, 0, 0, 1, 1,
-0.8968788, -1.477245, -2.697602, 0, 0, 0, 1, 1,
-0.8966405, 0.990077, -0.6029451, 0, 0, 0, 1, 1,
-0.8962858, -1.862878, -1.718818, 0, 0, 0, 1, 1,
-0.8922667, -1.301508, -3.202484, 0, 0, 0, 1, 1,
-0.891867, -1.475691, -4.16855, 0, 0, 0, 1, 1,
-0.8908622, -1.859737, -3.313619, 1, 1, 1, 1, 1,
-0.8880559, -0.6536369, -3.268414, 1, 1, 1, 1, 1,
-0.8837458, -0.6762867, -1.196146, 1, 1, 1, 1, 1,
-0.8826371, 0.7258969, -1.044706, 1, 1, 1, 1, 1,
-0.8746495, 0.8326173, -1.333443, 1, 1, 1, 1, 1,
-0.863897, -1.087342, -4.323408, 1, 1, 1, 1, 1,
-0.8634126, 0.4294744, -1.241141, 1, 1, 1, 1, 1,
-0.8633048, 0.02927094, -0.1293822, 1, 1, 1, 1, 1,
-0.8628687, -0.1941492, -1.183815, 1, 1, 1, 1, 1,
-0.8625802, -0.8571803, -1.73104, 1, 1, 1, 1, 1,
-0.8531252, -2.153058, -3.031166, 1, 1, 1, 1, 1,
-0.850923, -0.07968633, -1.679323, 1, 1, 1, 1, 1,
-0.8504743, 0.3985197, -0.02600462, 1, 1, 1, 1, 1,
-0.8476853, -0.2580127, -1.746188, 1, 1, 1, 1, 1,
-0.846525, -2.011636, -1.694486, 1, 1, 1, 1, 1,
-0.8459939, -0.09920182, -1.361988, 0, 0, 1, 1, 1,
-0.8439536, 1.162389, -2.15795, 1, 0, 0, 1, 1,
-0.8438765, -0.1761485, -2.561496, 1, 0, 0, 1, 1,
-0.839438, 0.6261299, 0.1415465, 1, 0, 0, 1, 1,
-0.8343615, -0.2210686, 0.3914041, 1, 0, 0, 1, 1,
-0.8246843, 0.62436, -0.5831945, 1, 0, 0, 1, 1,
-0.8224295, -0.1839434, -2.769234, 0, 0, 0, 1, 1,
-0.8224027, -0.9317266, -2.211539, 0, 0, 0, 1, 1,
-0.8217962, 0.2849475, -0.5965884, 0, 0, 0, 1, 1,
-0.7969393, -0.4604999, -1.948951, 0, 0, 0, 1, 1,
-0.7924688, -0.1227077, -1.795901, 0, 0, 0, 1, 1,
-0.7900404, 0.8803916, -1.38974, 0, 0, 0, 1, 1,
-0.7835706, -0.5801698, -2.485433, 0, 0, 0, 1, 1,
-0.7826465, 0.434414, -0.9890197, 1, 1, 1, 1, 1,
-0.7804099, 1.51624, 1.818173, 1, 1, 1, 1, 1,
-0.7796866, 0.5239775, -0.7557703, 1, 1, 1, 1, 1,
-0.7764243, -2.332753, -2.319668, 1, 1, 1, 1, 1,
-0.7753617, -1.249232, -1.426209, 1, 1, 1, 1, 1,
-0.7752725, 0.9210969, -1.413534, 1, 1, 1, 1, 1,
-0.7741158, -0.6116753, -3.586024, 1, 1, 1, 1, 1,
-0.7670012, 0.3140742, -0.9071162, 1, 1, 1, 1, 1,
-0.7600642, 1.7725, -1.309875, 1, 1, 1, 1, 1,
-0.7565505, 0.1695668, -1.566313, 1, 1, 1, 1, 1,
-0.7538955, 0.6753818, -1.216849, 1, 1, 1, 1, 1,
-0.7414418, 0.1674975, -1.304055, 1, 1, 1, 1, 1,
-0.7388887, -0.2656814, -0.7739661, 1, 1, 1, 1, 1,
-0.7372239, -1.361533, -5.269871, 1, 1, 1, 1, 1,
-0.732621, 0.01868755, -0.7445328, 1, 1, 1, 1, 1,
-0.7261486, -0.9383438, -4.22069, 0, 0, 1, 1, 1,
-0.7256339, -0.06758542, -1.160822, 1, 0, 0, 1, 1,
-0.7202637, 0.1617834, -1.269243, 1, 0, 0, 1, 1,
-0.7182989, -2.132745, -2.526725, 1, 0, 0, 1, 1,
-0.7176607, 0.396542, 0.3451392, 1, 0, 0, 1, 1,
-0.7119763, -0.4703351, -1.43874, 1, 0, 0, 1, 1,
-0.7102692, -0.5113832, -2.245953, 0, 0, 0, 1, 1,
-0.7099508, 0.5345112, -0.948165, 0, 0, 0, 1, 1,
-0.7069103, 0.14408, 0.4589209, 0, 0, 0, 1, 1,
-0.7051261, -0.5811977, -1.373111, 0, 0, 0, 1, 1,
-0.6997464, -1.457245, -3.472038, 0, 0, 0, 1, 1,
-0.6966583, -1.00432, -2.965987, 0, 0, 0, 1, 1,
-0.6962507, 0.2986944, -2.126005, 0, 0, 0, 1, 1,
-0.6924269, -0.2351865, -2.249673, 1, 1, 1, 1, 1,
-0.6906039, -0.3997012, -1.096221, 1, 1, 1, 1, 1,
-0.6868476, 0.1503107, -0.1018601, 1, 1, 1, 1, 1,
-0.6856273, 0.626187, -2.613904, 1, 1, 1, 1, 1,
-0.6754283, -1.676825, -3.388254, 1, 1, 1, 1, 1,
-0.6712125, -0.9372231, -2.271669, 1, 1, 1, 1, 1,
-0.668082, -0.09261984, -1.962875, 1, 1, 1, 1, 1,
-0.6634011, 1.247382, -0.5697769, 1, 1, 1, 1, 1,
-0.6602646, -0.007801588, -1.664542, 1, 1, 1, 1, 1,
-0.6555933, 2.202158, 0.6700466, 1, 1, 1, 1, 1,
-0.6516651, -0.08013465, -0.732215, 1, 1, 1, 1, 1,
-0.6490983, -1.009438, -3.996197, 1, 1, 1, 1, 1,
-0.6478564, -0.4510969, -3.792675, 1, 1, 1, 1, 1,
-0.6476768, 1.010943, -1.762883, 1, 1, 1, 1, 1,
-0.6437865, 1.247134, -1.140515, 1, 1, 1, 1, 1,
-0.6409438, -0.7797018, -1.639603, 0, 0, 1, 1, 1,
-0.6405193, 0.2261881, -0.7263362, 1, 0, 0, 1, 1,
-0.6349908, 1.380267, -0.7790762, 1, 0, 0, 1, 1,
-0.6345744, -0.2899408, -3.384748, 1, 0, 0, 1, 1,
-0.6338388, 0.9377258, -1.310516, 1, 0, 0, 1, 1,
-0.6336839, 0.6220914, 0.3138751, 1, 0, 0, 1, 1,
-0.6332322, -2.317654, -0.3552946, 0, 0, 0, 1, 1,
-0.6286983, -1.060134, -1.927679, 0, 0, 0, 1, 1,
-0.6279312, 0.04672176, -1.287624, 0, 0, 0, 1, 1,
-0.6262325, 1.657882, -1.865448, 0, 0, 0, 1, 1,
-0.6256451, 0.4111602, -1.385185, 0, 0, 0, 1, 1,
-0.6248657, -0.7234073, -3.041627, 0, 0, 0, 1, 1,
-0.622184, 0.6695696, -0.3968213, 0, 0, 0, 1, 1,
-0.6124631, -1.755566, -2.163228, 1, 1, 1, 1, 1,
-0.6115907, -0.4530863, -2.688171, 1, 1, 1, 1, 1,
-0.6050971, -0.7601495, -1.123274, 1, 1, 1, 1, 1,
-0.5895699, 0.2520579, -0.3824935, 1, 1, 1, 1, 1,
-0.587047, 0.7954383, -1.24925, 1, 1, 1, 1, 1,
-0.5797557, 0.8958659, 0.0344709, 1, 1, 1, 1, 1,
-0.5766359, 0.5930844, -2.405324, 1, 1, 1, 1, 1,
-0.5739924, 1.748918, -0.4066371, 1, 1, 1, 1, 1,
-0.5723584, 0.3200083, -1.352288, 1, 1, 1, 1, 1,
-0.571356, -1.536379, -3.409733, 1, 1, 1, 1, 1,
-0.571184, 0.6817092, -1.324986, 1, 1, 1, 1, 1,
-0.567375, -0.3566544, -1.964579, 1, 1, 1, 1, 1,
-0.5612144, -1.048911, -3.467088, 1, 1, 1, 1, 1,
-0.560226, 0.4515389, -2.131575, 1, 1, 1, 1, 1,
-0.5579566, 1.579899, 0.5049325, 1, 1, 1, 1, 1,
-0.5556734, 0.8012686, -1.719959, 0, 0, 1, 1, 1,
-0.5538625, 0.2009404, -1.264756, 1, 0, 0, 1, 1,
-0.550797, 2.13845, 0.4709011, 1, 0, 0, 1, 1,
-0.5464922, 0.7789083, 0.4393534, 1, 0, 0, 1, 1,
-0.5455253, 1.613435, -0.960978, 1, 0, 0, 1, 1,
-0.5447772, -0.5882437, -2.331035, 1, 0, 0, 1, 1,
-0.5442805, 1.397923, 1.176794, 0, 0, 0, 1, 1,
-0.5415093, -0.6274039, -2.407962, 0, 0, 0, 1, 1,
-0.5400738, 0.2745935, -0.05583447, 0, 0, 0, 1, 1,
-0.5398176, 0.4721243, -1.682353, 0, 0, 0, 1, 1,
-0.535765, 0.5279971, -1.520864, 0, 0, 0, 1, 1,
-0.5281397, -0.26266, -3.007025, 0, 0, 0, 1, 1,
-0.5256127, -0.7190254, -3.988197, 0, 0, 0, 1, 1,
-0.5248379, -0.1443128, -2.441251, 1, 1, 1, 1, 1,
-0.5218383, 0.8285637, 0.9137689, 1, 1, 1, 1, 1,
-0.5196675, 0.988683, -0.3222379, 1, 1, 1, 1, 1,
-0.5169806, 0.1030234, -1.678438, 1, 1, 1, 1, 1,
-0.5158272, -1.460973, -3.297567, 1, 1, 1, 1, 1,
-0.5143549, -1.000629, -0.8746902, 1, 1, 1, 1, 1,
-0.5114169, -1.527027, -3.221789, 1, 1, 1, 1, 1,
-0.507887, 0.6737528, -0.9788511, 1, 1, 1, 1, 1,
-0.5059435, 0.4851604, 0.02162143, 1, 1, 1, 1, 1,
-0.5026001, -0.2904277, -0.2447529, 1, 1, 1, 1, 1,
-0.5007079, 0.1029901, -1.391073, 1, 1, 1, 1, 1,
-0.499665, 0.06873502, -1.933977, 1, 1, 1, 1, 1,
-0.4985537, -0.4562587, -3.488286, 1, 1, 1, 1, 1,
-0.4970791, 0.8812462, -1.578636, 1, 1, 1, 1, 1,
-0.4970759, 0.8862458, -1.195382, 1, 1, 1, 1, 1,
-0.494412, 0.966527, 0.1457963, 0, 0, 1, 1, 1,
-0.4849873, 0.5155045, -1.534204, 1, 0, 0, 1, 1,
-0.4832536, 0.5995536, -0.3835367, 1, 0, 0, 1, 1,
-0.4832237, -0.54232, -1.737761, 1, 0, 0, 1, 1,
-0.4792721, 1.134219, -1.013664, 1, 0, 0, 1, 1,
-0.4657658, -0.1745957, -2.274145, 1, 0, 0, 1, 1,
-0.4576834, 1.154737, 0.2721682, 0, 0, 0, 1, 1,
-0.4572992, 1.789673, -2.137693, 0, 0, 0, 1, 1,
-0.4568225, 0.3010414, -1.6396, 0, 0, 0, 1, 1,
-0.455532, -0.1624777, -3.136146, 0, 0, 0, 1, 1,
-0.4511186, 0.1133868, -0.6844332, 0, 0, 0, 1, 1,
-0.4492457, 0.4961355, -2.351384, 0, 0, 0, 1, 1,
-0.4473279, 0.1473098, -2.013291, 0, 0, 0, 1, 1,
-0.4465761, -0.6807703, -2.564552, 1, 1, 1, 1, 1,
-0.4457102, -0.1570788, -3.820226, 1, 1, 1, 1, 1,
-0.4452962, 0.2173621, -0.02144943, 1, 1, 1, 1, 1,
-0.4450903, 0.8473698, -1.392234, 1, 1, 1, 1, 1,
-0.4392009, 0.3372948, -0.6057587, 1, 1, 1, 1, 1,
-0.4351165, 0.08239862, -1.916577, 1, 1, 1, 1, 1,
-0.4320168, 0.1469058, -0.1651456, 1, 1, 1, 1, 1,
-0.4308299, 1.786392, -1.183265, 1, 1, 1, 1, 1,
-0.4262792, -0.7858072, -3.494019, 1, 1, 1, 1, 1,
-0.4244206, -1.102383, -3.286587, 1, 1, 1, 1, 1,
-0.4239929, -0.9979751, -1.440407, 1, 1, 1, 1, 1,
-0.4217766, 0.8470387, -2.877018, 1, 1, 1, 1, 1,
-0.4158445, 0.3781119, -0.14352, 1, 1, 1, 1, 1,
-0.4124112, 1.241901, -0.6511104, 1, 1, 1, 1, 1,
-0.4120097, 0.7379786, -1.193234, 1, 1, 1, 1, 1,
-0.4101233, 0.298812, -0.7683065, 0, 0, 1, 1, 1,
-0.4075829, 0.4905115, 0.7387955, 1, 0, 0, 1, 1,
-0.4051126, 1.091389, -1.562774, 1, 0, 0, 1, 1,
-0.4034237, -1.750393, -2.378172, 1, 0, 0, 1, 1,
-0.4006172, -2.06476, -3.431002, 1, 0, 0, 1, 1,
-0.3980004, 0.1800341, -0.7672787, 1, 0, 0, 1, 1,
-0.3917793, 1.112337, 0.1869605, 0, 0, 0, 1, 1,
-0.3892189, -0.2361156, -2.511595, 0, 0, 0, 1, 1,
-0.3862298, -0.1387371, -0.8464215, 0, 0, 0, 1, 1,
-0.3861224, -1.515035, -1.430635, 0, 0, 0, 1, 1,
-0.3855281, -0.6158581, -1.159912, 0, 0, 0, 1, 1,
-0.3834934, 1.70763, -1.25906, 0, 0, 0, 1, 1,
-0.3825652, 0.1222115, -1.778112, 0, 0, 0, 1, 1,
-0.3773811, 1.287338, -1.683707, 1, 1, 1, 1, 1,
-0.3751038, -1.190961, -1.401993, 1, 1, 1, 1, 1,
-0.3732567, -0.1488106, -3.308509, 1, 1, 1, 1, 1,
-0.3729406, 0.8884249, -0.7484646, 1, 1, 1, 1, 1,
-0.3708597, 0.2003073, -1.308672, 1, 1, 1, 1, 1,
-0.3702013, 1.488489, -1.853122, 1, 1, 1, 1, 1,
-0.3688304, 0.4507264, -1.911994, 1, 1, 1, 1, 1,
-0.3647545, 0.6750501, 0.6746871, 1, 1, 1, 1, 1,
-0.3638269, 1.499597, -1.374102, 1, 1, 1, 1, 1,
-0.35624, -0.0286896, -1.918213, 1, 1, 1, 1, 1,
-0.3533608, -0.4847594, -3.92142, 1, 1, 1, 1, 1,
-0.3502326, -1.448781, -2.298464, 1, 1, 1, 1, 1,
-0.3475502, 1.207111, -1.341919, 1, 1, 1, 1, 1,
-0.3456398, 0.1169098, -1.632394, 1, 1, 1, 1, 1,
-0.3454567, -1.181236, -1.60366, 1, 1, 1, 1, 1,
-0.3421074, -0.9038746, -4.28631, 0, 0, 1, 1, 1,
-0.3383902, -1.208774, -3.694244, 1, 0, 0, 1, 1,
-0.3377769, -0.6287861, -2.917092, 1, 0, 0, 1, 1,
-0.3375867, 0.3169846, -0.2422926, 1, 0, 0, 1, 1,
-0.3374129, -0.9661455, -3.009068, 1, 0, 0, 1, 1,
-0.3324625, -1.184503, -2.227746, 1, 0, 0, 1, 1,
-0.3311831, -1.161972, -4.188811, 0, 0, 0, 1, 1,
-0.3279812, 0.8969479, -1.400309, 0, 0, 0, 1, 1,
-0.3210153, 1.12688, -1.013067, 0, 0, 0, 1, 1,
-0.3160514, -1.842177, -2.647918, 0, 0, 0, 1, 1,
-0.3159151, -0.8378594, -3.166664, 0, 0, 0, 1, 1,
-0.3133166, 0.2158085, -1.661878, 0, 0, 0, 1, 1,
-0.3106405, -0.5023136, -1.349343, 0, 0, 0, 1, 1,
-0.3086219, -0.970417, -0.8864907, 1, 1, 1, 1, 1,
-0.3033052, -0.2439244, -2.287332, 1, 1, 1, 1, 1,
-0.3001699, 1.464649, -0.1929756, 1, 1, 1, 1, 1,
-0.2989062, -0.367466, -3.26169, 1, 1, 1, 1, 1,
-0.2986189, -0.1252883, -1.708143, 1, 1, 1, 1, 1,
-0.2943716, -0.4736845, -2.537589, 1, 1, 1, 1, 1,
-0.2910239, -0.2781652, -2.353906, 1, 1, 1, 1, 1,
-0.2904122, -1.068697, -2.871624, 1, 1, 1, 1, 1,
-0.2889088, -1.19591, -2.91165, 1, 1, 1, 1, 1,
-0.2881244, -0.04382082, -0.2675166, 1, 1, 1, 1, 1,
-0.2843118, -0.2589513, -1.806569, 1, 1, 1, 1, 1,
-0.2789367, -0.1605946, -1.539904, 1, 1, 1, 1, 1,
-0.2755738, -0.4118724, -3.012939, 1, 1, 1, 1, 1,
-0.2736518, -1.593456, -2.670623, 1, 1, 1, 1, 1,
-0.2728966, -0.3988371, -2.264386, 1, 1, 1, 1, 1,
-0.2651817, 0.7765821, -0.1905915, 0, 0, 1, 1, 1,
-0.2616925, 1.666301, -2.157062, 1, 0, 0, 1, 1,
-0.2580967, -2.200735, -2.229215, 1, 0, 0, 1, 1,
-0.256095, 0.1607326, -2.615594, 1, 0, 0, 1, 1,
-0.2521063, 2.233569, 1.356633, 1, 0, 0, 1, 1,
-0.2506972, 0.9798414, 0.773883, 1, 0, 0, 1, 1,
-0.2495706, 2.214686, 0.1954797, 0, 0, 0, 1, 1,
-0.2470917, -0.1449656, -2.042272, 0, 0, 0, 1, 1,
-0.2435271, -1.28601, -3.100106, 0, 0, 0, 1, 1,
-0.239343, 1.215533, 1.084907, 0, 0, 0, 1, 1,
-0.2389438, 0.8363312, -0.6710681, 0, 0, 0, 1, 1,
-0.2350404, 0.8918932, -0.5186585, 0, 0, 0, 1, 1,
-0.2309835, -0.05591155, -2.705904, 0, 0, 0, 1, 1,
-0.2285248, -1.457922, -2.707266, 1, 1, 1, 1, 1,
-0.2240883, 0.4793524, -1.638133, 1, 1, 1, 1, 1,
-0.2206271, -1.229188, -2.058749, 1, 1, 1, 1, 1,
-0.2156844, -0.2539016, -2.521923, 1, 1, 1, 1, 1,
-0.2113767, -0.7997154, -3.33275, 1, 1, 1, 1, 1,
-0.2064069, 1.287601, 0.8095818, 1, 1, 1, 1, 1,
-0.2030034, 0.01432605, -0.9351, 1, 1, 1, 1, 1,
-0.2019144, 1.450922, 1.143581, 1, 1, 1, 1, 1,
-0.1993966, -1.615058, -3.530197, 1, 1, 1, 1, 1,
-0.1990481, -0.192472, -1.282676, 1, 1, 1, 1, 1,
-0.1946577, -0.9839164, -2.869416, 1, 1, 1, 1, 1,
-0.1919797, -0.5053692, -3.049327, 1, 1, 1, 1, 1,
-0.1892217, 0.7075472, -0.9454316, 1, 1, 1, 1, 1,
-0.185975, 1.519055, 0.1193964, 1, 1, 1, 1, 1,
-0.1857554, -0.2486262, -2.194588, 1, 1, 1, 1, 1,
-0.1842922, -1.757003, -3.850525, 0, 0, 1, 1, 1,
-0.1823252, 0.3409258, -2.540429, 1, 0, 0, 1, 1,
-0.1804591, 0.5110036, -0.01705071, 1, 0, 0, 1, 1,
-0.1803907, -1.030965, -4.133396, 1, 0, 0, 1, 1,
-0.1797696, 0.03569665, -1.37482, 1, 0, 0, 1, 1,
-0.1785919, 1.778458, 0.03654564, 1, 0, 0, 1, 1,
-0.1744863, 0.5431141, -0.003951528, 0, 0, 0, 1, 1,
-0.1731588, 0.5845607, -0.7003742, 0, 0, 0, 1, 1,
-0.1723089, 0.2283038, -0.05939269, 0, 0, 0, 1, 1,
-0.1696998, -0.7727267, -3.657636, 0, 0, 0, 1, 1,
-0.1691369, -0.04299711, -3.011275, 0, 0, 0, 1, 1,
-0.1662719, 0.01226048, -0.5802277, 0, 0, 0, 1, 1,
-0.1535349, 1.438114, 1.03101, 0, 0, 0, 1, 1,
-0.1519782, 0.4705631, 0.8801634, 1, 1, 1, 1, 1,
-0.1482307, 0.5648634, -0.4837155, 1, 1, 1, 1, 1,
-0.1474194, 0.1526164, -0.1796257, 1, 1, 1, 1, 1,
-0.1452909, -0.6240213, -1.14442, 1, 1, 1, 1, 1,
-0.1437852, -1.354493, -4.808387, 1, 1, 1, 1, 1,
-0.1384797, -0.894118, -2.703426, 1, 1, 1, 1, 1,
-0.1368751, 1.008269, 0.5359784, 1, 1, 1, 1, 1,
-0.1350679, -1.712443, -2.341173, 1, 1, 1, 1, 1,
-0.1337486, 0.6411639, -1.748688, 1, 1, 1, 1, 1,
-0.1311528, -1.077834, -1.47699, 1, 1, 1, 1, 1,
-0.1281646, -0.9176984, -2.947, 1, 1, 1, 1, 1,
-0.1271446, -0.5961515, -2.178793, 1, 1, 1, 1, 1,
-0.1259909, 0.5847716, 1.207537, 1, 1, 1, 1, 1,
-0.1250211, -1.223472, -2.967565, 1, 1, 1, 1, 1,
-0.1240906, -0.6256434, -3.139861, 1, 1, 1, 1, 1,
-0.1224819, -0.7355217, -3.593959, 0, 0, 1, 1, 1,
-0.1210698, -1.30456, -5.393077, 1, 0, 0, 1, 1,
-0.1162632, 0.8670895, -0.1124808, 1, 0, 0, 1, 1,
-0.1158816, -0.7378721, -4.129082, 1, 0, 0, 1, 1,
-0.1155369, 0.158581, -2.280096, 1, 0, 0, 1, 1,
-0.1150734, -0.1731041, -2.65544, 1, 0, 0, 1, 1,
-0.115056, 0.821761, -0.6231102, 0, 0, 0, 1, 1,
-0.111144, -2.163402, -3.396303, 0, 0, 0, 1, 1,
-0.1077463, 0.8033884, -0.0210996, 0, 0, 0, 1, 1,
-0.1054538, 0.0173329, -1.539344, 0, 0, 0, 1, 1,
-0.1051152, -0.5400447, -2.986921, 0, 0, 0, 1, 1,
-0.1007006, -0.6408678, -1.472356, 0, 0, 0, 1, 1,
-0.09930761, 2.150591, -0.5465636, 0, 0, 0, 1, 1,
-0.09593302, -0.08236486, -1.287538, 1, 1, 1, 1, 1,
-0.09334525, -1.20176, -3.232602, 1, 1, 1, 1, 1,
-0.09173108, 0.624427, 0.6987681, 1, 1, 1, 1, 1,
-0.08378447, -1.887846, -3.304075, 1, 1, 1, 1, 1,
-0.07860675, -0.3692436, -3.819695, 1, 1, 1, 1, 1,
-0.07800929, 0.7040136, -0.6508836, 1, 1, 1, 1, 1,
-0.07738326, 0.3178189, -1.170845, 1, 1, 1, 1, 1,
-0.07505439, 0.7703677, 0.638252, 1, 1, 1, 1, 1,
-0.07358815, -0.9813922, -3.05719, 1, 1, 1, 1, 1,
-0.07339618, -1.745277, -2.704009, 1, 1, 1, 1, 1,
-0.06674673, 0.4315073, 1.016801, 1, 1, 1, 1, 1,
-0.0665702, -0.3899484, -1.344568, 1, 1, 1, 1, 1,
-0.0648274, -0.2355788, -3.922898, 1, 1, 1, 1, 1,
-0.06391557, -0.4721639, -2.9364, 1, 1, 1, 1, 1,
-0.06313031, -0.9036047, -4.698582, 1, 1, 1, 1, 1,
-0.05495489, -0.9772481, -3.825098, 0, 0, 1, 1, 1,
-0.05314782, 0.02564133, -1.952156, 1, 0, 0, 1, 1,
-0.05284782, 0.9392657, -0.9333356, 1, 0, 0, 1, 1,
-0.05073566, -0.2826255, -3.880116, 1, 0, 0, 1, 1,
-0.05016521, -0.7569764, -3.514976, 1, 0, 0, 1, 1,
-0.04653908, -0.4573065, -3.035514, 1, 0, 0, 1, 1,
-0.04428998, -1.250279, -4.036305, 0, 0, 0, 1, 1,
-0.03858091, 1.002707, -1.061178, 0, 0, 0, 1, 1,
-0.03443212, -1.520023, -2.75512, 0, 0, 0, 1, 1,
-0.03336769, -0.4426651, -4.459947, 0, 0, 0, 1, 1,
-0.03128052, -0.02754579, -1.6488, 0, 0, 0, 1, 1,
-0.03096845, -1.080649, -2.231805, 0, 0, 0, 1, 1,
-0.03084063, -0.4911265, -3.094745, 0, 0, 0, 1, 1,
-0.02779738, 0.117135, 1.419308, 1, 1, 1, 1, 1,
-0.02726429, -0.6444728, -1.353913, 1, 1, 1, 1, 1,
-0.02543432, -0.1029124, -1.339643, 1, 1, 1, 1, 1,
-0.0138957, -0.9089781, -4.194325, 1, 1, 1, 1, 1,
-0.01272018, -0.7294189, -2.462681, 1, 1, 1, 1, 1,
-0.01150249, 0.758893, 0.2949772, 1, 1, 1, 1, 1,
-0.005979566, -0.1033098, -2.245309, 1, 1, 1, 1, 1,
-0.00458364, -0.07182085, -3.606145, 1, 1, 1, 1, 1,
0.005579936, 0.1308351, -0.2557763, 1, 1, 1, 1, 1,
0.011217, 0.6995904, 0.3983187, 1, 1, 1, 1, 1,
0.0195161, -0.5181115, 4.343305, 1, 1, 1, 1, 1,
0.02359644, -1.37837, 2.214835, 1, 1, 1, 1, 1,
0.02875178, -1.211443, 1.714079, 1, 1, 1, 1, 1,
0.0288239, 0.9451007, -0.247091, 1, 1, 1, 1, 1,
0.02912327, -0.9399105, 3.226059, 1, 1, 1, 1, 1,
0.03009413, -0.06338453, 1.469774, 0, 0, 1, 1, 1,
0.03420827, 0.4214299, 0.4924536, 1, 0, 0, 1, 1,
0.03464569, -1.737512, 3.501893, 1, 0, 0, 1, 1,
0.0348518, 1.503984, -1.14403, 1, 0, 0, 1, 1,
0.03869408, 0.008663261, -0.002452022, 1, 0, 0, 1, 1,
0.05529505, -2.153355, 3.967786, 1, 0, 0, 1, 1,
0.05615275, 1.26292, 0.4999355, 0, 0, 0, 1, 1,
0.06356653, -1.776235, 3.160108, 0, 0, 0, 1, 1,
0.0640671, -0.7264362, 3.277624, 0, 0, 0, 1, 1,
0.06829897, -0.5508924, 2.202155, 0, 0, 0, 1, 1,
0.07087927, 0.7113136, 1.207863, 0, 0, 0, 1, 1,
0.07685044, -0.1720589, 2.064528, 0, 0, 0, 1, 1,
0.07749578, 1.483542, -0.845515, 0, 0, 0, 1, 1,
0.07805552, 0.7120445, -0.7998912, 1, 1, 1, 1, 1,
0.08170766, 0.9169168, 2.123406, 1, 1, 1, 1, 1,
0.08467503, 1.115452, 1.759644, 1, 1, 1, 1, 1,
0.08503364, 0.1168481, -0.07096559, 1, 1, 1, 1, 1,
0.08559716, -0.776727, 3.947561, 1, 1, 1, 1, 1,
0.08617634, -0.3663879, 3.325679, 1, 1, 1, 1, 1,
0.09104787, 1.343784, -0.2114533, 1, 1, 1, 1, 1,
0.09316726, 1.176863, 1.361999, 1, 1, 1, 1, 1,
0.09631319, -0.07682732, 2.903244, 1, 1, 1, 1, 1,
0.09637567, -1.064355, 5.147387, 1, 1, 1, 1, 1,
0.1015168, 1.442899, 0.8730579, 1, 1, 1, 1, 1,
0.1116725, 0.2708077, 1.253755, 1, 1, 1, 1, 1,
0.1127071, -1.786018, 4.174342, 1, 1, 1, 1, 1,
0.1133631, -1.486887, 1.121235, 1, 1, 1, 1, 1,
0.1133742, -0.9200749, 3.012455, 1, 1, 1, 1, 1,
0.1178858, -0.2600692, 3.012579, 0, 0, 1, 1, 1,
0.1192803, 0.8170249, 0.9705452, 1, 0, 0, 1, 1,
0.1200681, 0.4333144, -0.4593423, 1, 0, 0, 1, 1,
0.1284819, -0.1317172, 3.080656, 1, 0, 0, 1, 1,
0.1324046, 0.8977283, 0.9373071, 1, 0, 0, 1, 1,
0.1325416, -0.7940183, 3.292, 1, 0, 0, 1, 1,
0.1372928, 1.089576, 0.775158, 0, 0, 0, 1, 1,
0.1378917, -0.06343362, 1.591403, 0, 0, 0, 1, 1,
0.1384902, -1.361495, 4.565999, 0, 0, 0, 1, 1,
0.1424369, -0.0646964, 2.619257, 0, 0, 0, 1, 1,
0.144764, -1.458274, 3.689859, 0, 0, 0, 1, 1,
0.1522492, 0.1678413, 1.353144, 0, 0, 0, 1, 1,
0.1570186, 0.6871575, -1.167136, 0, 0, 0, 1, 1,
0.1590783, 0.9894235, 0.09740423, 1, 1, 1, 1, 1,
0.1624293, 1.194427, 0.3342728, 1, 1, 1, 1, 1,
0.1666872, -0.556352, 2.097, 1, 1, 1, 1, 1,
0.1696002, -0.07939647, 0.7058783, 1, 1, 1, 1, 1,
0.1697492, -0.74131, 2.402551, 1, 1, 1, 1, 1,
0.1715621, 2.162377, -0.8981025, 1, 1, 1, 1, 1,
0.186285, 0.06783553, 0.01048036, 1, 1, 1, 1, 1,
0.1866569, 0.09850627, 1.603136, 1, 1, 1, 1, 1,
0.1884791, -0.1088834, 1.410317, 1, 1, 1, 1, 1,
0.1895782, 0.31402, 0.323788, 1, 1, 1, 1, 1,
0.1936553, -0.3892913, 4.462284, 1, 1, 1, 1, 1,
0.202395, -0.1981454, 2.251548, 1, 1, 1, 1, 1,
0.2054392, -1.341498, 3.955681, 1, 1, 1, 1, 1,
0.2073697, -0.9748863, 3.326782, 1, 1, 1, 1, 1,
0.2135132, 1.326712, 2.441562, 1, 1, 1, 1, 1,
0.2145287, -0.05811245, 3.021116, 0, 0, 1, 1, 1,
0.2155247, -1.524359, 1.591677, 1, 0, 0, 1, 1,
0.2188028, 0.8838418, -0.5439171, 1, 0, 0, 1, 1,
0.2195395, 1.303785, -2.099968, 1, 0, 0, 1, 1,
0.2215295, -1.096283, 3.21176, 1, 0, 0, 1, 1,
0.2247412, -1.306397, 3.302685, 1, 0, 0, 1, 1,
0.2255377, 0.2617891, 1.298886, 0, 0, 0, 1, 1,
0.2293407, -1.358396, 2.728384, 0, 0, 0, 1, 1,
0.2369141, -0.409261, 2.609634, 0, 0, 0, 1, 1,
0.2446946, -1.445594, -0.2678367, 0, 0, 0, 1, 1,
0.247206, -0.9758713, 2.260219, 0, 0, 0, 1, 1,
0.2483013, -1.003746, 4.155647, 0, 0, 0, 1, 1,
0.2494973, 1.133976, 0.5672856, 0, 0, 0, 1, 1,
0.2500155, -0.2424051, 1.893443, 1, 1, 1, 1, 1,
0.254959, -0.8272218, 3.587107, 1, 1, 1, 1, 1,
0.2576852, -0.9819353, 2.685193, 1, 1, 1, 1, 1,
0.2603226, -0.9376933, 2.569192, 1, 1, 1, 1, 1,
0.2671814, 0.07284615, -0.9492993, 1, 1, 1, 1, 1,
0.2716534, -0.4608977, 2.352576, 1, 1, 1, 1, 1,
0.2747889, -0.2222137, 0.3182394, 1, 1, 1, 1, 1,
0.2798098, -0.1551719, 1.953804, 1, 1, 1, 1, 1,
0.2814751, 0.3571611, 1.406993, 1, 1, 1, 1, 1,
0.2834907, -0.2425475, 3.478562, 1, 1, 1, 1, 1,
0.2856758, 0.009535095, 1.843019, 1, 1, 1, 1, 1,
0.2863716, 0.359651, 2.079599, 1, 1, 1, 1, 1,
0.2892269, 1.222945, 1.594253, 1, 1, 1, 1, 1,
0.2912985, 1.397374, 0.7585617, 1, 1, 1, 1, 1,
0.2936271, -0.2787472, 1.187059, 1, 1, 1, 1, 1,
0.2955948, 0.009429836, 1.930005, 0, 0, 1, 1, 1,
0.2974168, -0.4588044, 1.744806, 1, 0, 0, 1, 1,
0.3047121, -0.325643, 2.83208, 1, 0, 0, 1, 1,
0.3059493, 0.01194547, 2.653378, 1, 0, 0, 1, 1,
0.3064068, -0.05171454, 1.749907, 1, 0, 0, 1, 1,
0.3074474, -0.2622135, 3.064374, 1, 0, 0, 1, 1,
0.3079553, -2.030433, 1.681219, 0, 0, 0, 1, 1,
0.3096724, -2.432962, 2.535627, 0, 0, 0, 1, 1,
0.3159959, -0.5254604, 2.252309, 0, 0, 0, 1, 1,
0.3197643, -0.5912989, 3.632622, 0, 0, 0, 1, 1,
0.3219613, -0.5255329, 1.673136, 0, 0, 0, 1, 1,
0.3232821, 1.657972, 1.1354, 0, 0, 0, 1, 1,
0.3243499, 0.3521566, 0.447243, 0, 0, 0, 1, 1,
0.3277699, 0.9190844, -1.012095, 1, 1, 1, 1, 1,
0.3312436, 1.566983, 1.519954, 1, 1, 1, 1, 1,
0.3313836, -0.6071404, 3.554472, 1, 1, 1, 1, 1,
0.3346428, -0.6861417, 1.519836, 1, 1, 1, 1, 1,
0.3393828, 1.575004, -0.1758652, 1, 1, 1, 1, 1,
0.3435379, 0.8323807, 2.031819, 1, 1, 1, 1, 1,
0.3435501, -1.210032, 1.345124, 1, 1, 1, 1, 1,
0.3437416, 0.4965414, -0.2253664, 1, 1, 1, 1, 1,
0.3493502, 0.7635856, -0.5500388, 1, 1, 1, 1, 1,
0.3505061, 1.531542, -0.5145503, 1, 1, 1, 1, 1,
0.3620439, -0.8468851, 0.9308842, 1, 1, 1, 1, 1,
0.36288, -0.9284725, 3.290422, 1, 1, 1, 1, 1,
0.3634309, -0.009557834, 2.3063, 1, 1, 1, 1, 1,
0.3647937, 0.587169, 0.7237403, 1, 1, 1, 1, 1,
0.3665018, -0.890833, 1.319192, 1, 1, 1, 1, 1,
0.3717414, 0.8902511, 0.1801428, 0, 0, 1, 1, 1,
0.3720579, -1.059947, 3.12478, 1, 0, 0, 1, 1,
0.3737677, 0.8223411, -0.4745005, 1, 0, 0, 1, 1,
0.3750542, 0.8761715, 1.394945, 1, 0, 0, 1, 1,
0.3813164, 1.708304, 0.799982, 1, 0, 0, 1, 1,
0.3857099, 0.3629145, -0.2835595, 1, 0, 0, 1, 1,
0.3866956, -0.3115754, 2.179748, 0, 0, 0, 1, 1,
0.3880061, -2.437946, 4.268547, 0, 0, 0, 1, 1,
0.3883346, 1.600558, -0.11897, 0, 0, 0, 1, 1,
0.3883796, -0.3977015, 3.659755, 0, 0, 0, 1, 1,
0.3891997, -0.9325004, 1.262296, 0, 0, 0, 1, 1,
0.3907935, -0.4977427, 2.24583, 0, 0, 0, 1, 1,
0.3913825, -1.223269, 4.073978, 0, 0, 0, 1, 1,
0.3962911, 0.3438035, 0.2714186, 1, 1, 1, 1, 1,
0.3962981, 0.2171088, 2.479989, 1, 1, 1, 1, 1,
0.3975127, 1.847849, 1.569167, 1, 1, 1, 1, 1,
0.3980212, 0.2443782, -0.05803563, 1, 1, 1, 1, 1,
0.4007609, 0.8679934, 1.455801, 1, 1, 1, 1, 1,
0.4028059, -0.5168812, 1.758227, 1, 1, 1, 1, 1,
0.4031532, 1.633056, 1.898983, 1, 1, 1, 1, 1,
0.4106666, 0.6810718, 0.08145215, 1, 1, 1, 1, 1,
0.4125297, -1.475921, 2.575898, 1, 1, 1, 1, 1,
0.415665, -1.429393, 3.991819, 1, 1, 1, 1, 1,
0.4297123, 0.3152115, 1.457531, 1, 1, 1, 1, 1,
0.430937, -0.5872437, 2.194079, 1, 1, 1, 1, 1,
0.4316724, 0.7475421, -1.222693, 1, 1, 1, 1, 1,
0.4329843, 0.5454797, 1.158268, 1, 1, 1, 1, 1,
0.4359366, -2.04564, 2.398722, 1, 1, 1, 1, 1,
0.4399613, -0.6643813, 3.139092, 0, 0, 1, 1, 1,
0.4400564, 1.451771, 0.4641289, 1, 0, 0, 1, 1,
0.4401851, -0.5973235, 3.535255, 1, 0, 0, 1, 1,
0.4421008, 0.6351625, 0.2292496, 1, 0, 0, 1, 1,
0.4422675, -0.3644275, 1.876376, 1, 0, 0, 1, 1,
0.4461398, 2.005252, 0.2153064, 1, 0, 0, 1, 1,
0.4463913, -0.4865973, 4.044398, 0, 0, 0, 1, 1,
0.4486847, -0.0001575508, 1.160014, 0, 0, 0, 1, 1,
0.450006, 0.2278928, -0.2464348, 0, 0, 0, 1, 1,
0.4534582, 0.002629545, 2.443504, 0, 0, 0, 1, 1,
0.4541126, -0.7069222, 3.255146, 0, 0, 0, 1, 1,
0.4548876, -0.1772051, 1.124632, 0, 0, 0, 1, 1,
0.4550597, 1.610519, -1.190885, 0, 0, 0, 1, 1,
0.4562938, 0.601047, 1.269869, 1, 1, 1, 1, 1,
0.4589323, -0.8552402, 1.586772, 1, 1, 1, 1, 1,
0.4599167, -0.2085348, 3.901953, 1, 1, 1, 1, 1,
0.4604444, -0.5773783, 1.783182, 1, 1, 1, 1, 1,
0.4616648, 0.1050953, 1.207025, 1, 1, 1, 1, 1,
0.4631908, -1.362367, 2.53325, 1, 1, 1, 1, 1,
0.4648774, 0.8470783, 2.019346, 1, 1, 1, 1, 1,
0.4702314, -1.090017, 2.914646, 1, 1, 1, 1, 1,
0.4737067, -1.514446, 3.268921, 1, 1, 1, 1, 1,
0.4770117, 1.458512, -1.857442, 1, 1, 1, 1, 1,
0.4770288, -1.846047, 3.910872, 1, 1, 1, 1, 1,
0.4771617, 0.1001785, 2.23612, 1, 1, 1, 1, 1,
0.4781483, 0.5810057, -0.6670382, 1, 1, 1, 1, 1,
0.4841198, 1.236906, 0.1503961, 1, 1, 1, 1, 1,
0.4859179, -1.98578, 3.372237, 1, 1, 1, 1, 1,
0.4874834, 0.7910343, 1.057091, 0, 0, 1, 1, 1,
0.49345, -1.983301, 3.380432, 1, 0, 0, 1, 1,
0.4952988, -0.4526417, 2.18453, 1, 0, 0, 1, 1,
0.4981218, -0.5031354, 4.442325, 1, 0, 0, 1, 1,
0.4990054, -0.04830675, 2.806784, 1, 0, 0, 1, 1,
0.5019658, -0.5971183, 1.480671, 1, 0, 0, 1, 1,
0.502822, -1.168344, 2.129694, 0, 0, 0, 1, 1,
0.5034739, -1.020066, 2.260545, 0, 0, 0, 1, 1,
0.5038735, 0.03235279, 2.098943, 0, 0, 0, 1, 1,
0.5101051, 0.147956, 1.933638, 0, 0, 0, 1, 1,
0.5172485, -1.070101, 3.410164, 0, 0, 0, 1, 1,
0.5298579, 0.8908422, 1.516406, 0, 0, 0, 1, 1,
0.5334793, -0.3488252, 1.426587, 0, 0, 0, 1, 1,
0.5418556, -0.703581, 3.082891, 1, 1, 1, 1, 1,
0.5429937, 1.079076, -0.2878808, 1, 1, 1, 1, 1,
0.5431429, 0.2907928, 2.075355, 1, 1, 1, 1, 1,
0.544175, 0.8006122, 0.09428324, 1, 1, 1, 1, 1,
0.5568445, -3.011774, 2.901375, 1, 1, 1, 1, 1,
0.5634973, 0.5884342, 2.903399, 1, 1, 1, 1, 1,
0.5664478, 0.9286455, 0.7483665, 1, 1, 1, 1, 1,
0.5668375, -0.06604244, 3.4479, 1, 1, 1, 1, 1,
0.5669387, 1.057896, -0.5770944, 1, 1, 1, 1, 1,
0.5681925, 0.5081698, 3.105252, 1, 1, 1, 1, 1,
0.5683991, -0.8025268, 3.291842, 1, 1, 1, 1, 1,
0.5698715, 0.5078896, 0.592356, 1, 1, 1, 1, 1,
0.5700798, 0.1732371, 1.214584, 1, 1, 1, 1, 1,
0.5717927, -0.2378536, 3.455148, 1, 1, 1, 1, 1,
0.5730247, -1.145079, 3.361438, 1, 1, 1, 1, 1,
0.575641, 0.01877805, 0.4141004, 0, 0, 1, 1, 1,
0.5758544, 0.5292585, 2.153156, 1, 0, 0, 1, 1,
0.5782223, -1.346226, 2.47264, 1, 0, 0, 1, 1,
0.5813724, -1.465955, 4.10568, 1, 0, 0, 1, 1,
0.5851704, -0.1838951, 2.589339, 1, 0, 0, 1, 1,
0.588576, 1.494372, 1.020651, 1, 0, 0, 1, 1,
0.588961, -1.291443, 3.326716, 0, 0, 0, 1, 1,
0.5899193, -0.7040727, 1.867554, 0, 0, 0, 1, 1,
0.59113, 2.345933, 0.08114366, 0, 0, 0, 1, 1,
0.5924613, 0.4869884, 0.689048, 0, 0, 0, 1, 1,
0.5933552, -0.6105722, 1.15903, 0, 0, 0, 1, 1,
0.5951802, 0.4205267, 0.3538484, 0, 0, 0, 1, 1,
0.5968322, 1.85638, 0.3807345, 0, 0, 0, 1, 1,
0.5968857, -0.7838486, 3.485029, 1, 1, 1, 1, 1,
0.5969724, -0.4997643, 1.067537, 1, 1, 1, 1, 1,
0.5984959, -1.256704, 2.551629, 1, 1, 1, 1, 1,
0.5996482, 0.1403382, -0.3381278, 1, 1, 1, 1, 1,
0.6018914, -1.335627, 2.68499, 1, 1, 1, 1, 1,
0.6019874, -1.118972, 1.880215, 1, 1, 1, 1, 1,
0.6026739, 0.5225045, 1.83624, 1, 1, 1, 1, 1,
0.6028187, -1.743303, 2.711467, 1, 1, 1, 1, 1,
0.6036064, -1.923509, 2.287379, 1, 1, 1, 1, 1,
0.6037973, 0.339258, 2.097049, 1, 1, 1, 1, 1,
0.6055748, 0.08630903, 0.2477233, 1, 1, 1, 1, 1,
0.6104262, 0.8327992, 0.04794135, 1, 1, 1, 1, 1,
0.6123945, -0.7359846, 2.115098, 1, 1, 1, 1, 1,
0.6179149, 0.6839609, 1.271993, 1, 1, 1, 1, 1,
0.6239756, 0.81888, 1.376376, 1, 1, 1, 1, 1,
0.6288592, 0.8896233, 0.6358106, 0, 0, 1, 1, 1,
0.6289452, -2.456719, 2.548421, 1, 0, 0, 1, 1,
0.6327708, -1.676777, 3.364115, 1, 0, 0, 1, 1,
0.6378604, -0.7289325, 3.279948, 1, 0, 0, 1, 1,
0.6387898, -0.3053355, 1.862247, 1, 0, 0, 1, 1,
0.6412901, -0.2528248, 1.538694, 1, 0, 0, 1, 1,
0.6470006, -0.1934793, 0.6958465, 0, 0, 0, 1, 1,
0.6489279, -0.1837247, 1.94059, 0, 0, 0, 1, 1,
0.6538121, 0.9912896, 1.292363, 0, 0, 0, 1, 1,
0.6542557, -1.305629, 2.233479, 0, 0, 0, 1, 1,
0.6552577, 1.867932, -0.3097385, 0, 0, 0, 1, 1,
0.6557211, 0.1634099, 0.6996813, 0, 0, 0, 1, 1,
0.6561306, -2.092023, 3.517528, 0, 0, 0, 1, 1,
0.6661565, 0.1223729, 2.385401, 1, 1, 1, 1, 1,
0.669259, -1.176284, 1.135417, 1, 1, 1, 1, 1,
0.6736149, 0.3252252, 0.1458513, 1, 1, 1, 1, 1,
0.6847489, 1.138037, 2.027854, 1, 1, 1, 1, 1,
0.689807, -1.224559, 3.39218, 1, 1, 1, 1, 1,
0.689833, 0.5159473, 1.044633, 1, 1, 1, 1, 1,
0.692807, -0.6945146, 2.614655, 1, 1, 1, 1, 1,
0.7025315, 1.183771, 0.3409702, 1, 1, 1, 1, 1,
0.7055488, 0.3437156, 0.2969235, 1, 1, 1, 1, 1,
0.7056182, -0.8108587, 2.908107, 1, 1, 1, 1, 1,
0.7075791, 0.5553663, 0.9537886, 1, 1, 1, 1, 1,
0.7100496, 0.6859106, 2.553325, 1, 1, 1, 1, 1,
0.7204081, 1.863426, -0.187803, 1, 1, 1, 1, 1,
0.7230651, -0.3215369, 3.189926, 1, 1, 1, 1, 1,
0.7232261, 0.1009709, -0.03465583, 1, 1, 1, 1, 1,
0.7302963, -0.790439, 3.641082, 0, 0, 1, 1, 1,
0.7303126, -0.4393876, 2.004618, 1, 0, 0, 1, 1,
0.7329745, 1.291463, -0.5217514, 1, 0, 0, 1, 1,
0.7356192, -0.712054, 1.808322, 1, 0, 0, 1, 1,
0.7384108, 1.039126, -0.3975011, 1, 0, 0, 1, 1,
0.7454274, -0.6279486, 1.455873, 1, 0, 0, 1, 1,
0.7459347, 0.04478415, 1.47773, 0, 0, 0, 1, 1,
0.7482403, -0.9969773, 2.364574, 0, 0, 0, 1, 1,
0.7499699, 1.258289, 1.444162, 0, 0, 0, 1, 1,
0.7545053, -0.545646, 3.638729, 0, 0, 0, 1, 1,
0.7553529, 1.751094, 0.1868238, 0, 0, 0, 1, 1,
0.7611181, -0.5984999, 2.202219, 0, 0, 0, 1, 1,
0.7634568, 1.078806, 0.4574277, 0, 0, 0, 1, 1,
0.7656957, 2.470185, -1.735075, 1, 1, 1, 1, 1,
0.7706138, -1.393968, 2.265871, 1, 1, 1, 1, 1,
0.77178, 0.008451446, 3.093066, 1, 1, 1, 1, 1,
0.7727383, 0.7107373, 3.57179, 1, 1, 1, 1, 1,
0.7740414, -1.315329, 3.41722, 1, 1, 1, 1, 1,
0.7763179, -0.3568435, 1.334325, 1, 1, 1, 1, 1,
0.781851, -0.1335354, 1.609143, 1, 1, 1, 1, 1,
0.7823369, -0.6277528, 0.4292198, 1, 1, 1, 1, 1,
0.7838693, 1.224177, 0.1787149, 1, 1, 1, 1, 1,
0.7869424, 0.3992475, 2.492434, 1, 1, 1, 1, 1,
0.790736, -0.151769, 1.474582, 1, 1, 1, 1, 1,
0.7968604, 0.7274887, 0.4884383, 1, 1, 1, 1, 1,
0.8011737, 0.9469749, -0.09144925, 1, 1, 1, 1, 1,
0.8032357, 0.2561283, 0.8783355, 1, 1, 1, 1, 1,
0.803501, 1.156226, 0.7455245, 1, 1, 1, 1, 1,
0.8046839, -0.5316036, 2.906804, 0, 0, 1, 1, 1,
0.8047665, 1.907412, 0.2849074, 1, 0, 0, 1, 1,
0.8073132, -0.334723, 2.959087, 1, 0, 0, 1, 1,
0.8116012, 0.8623968, 0.4781164, 1, 0, 0, 1, 1,
0.8180628, 2.945047, 0.7075093, 1, 0, 0, 1, 1,
0.8221762, -0.72816, 1.33863, 1, 0, 0, 1, 1,
0.8261554, 1.64896, -0.8947127, 0, 0, 0, 1, 1,
0.8290313, 0.9105958, -0.8930774, 0, 0, 0, 1, 1,
0.8328536, -0.2184469, 1.294166, 0, 0, 0, 1, 1,
0.8378381, -1.801385, 3.11153, 0, 0, 0, 1, 1,
0.8453674, -1.1495, 1.27466, 0, 0, 0, 1, 1,
0.8482355, 0.1757167, 2.444341, 0, 0, 0, 1, 1,
0.8507032, -1.398683, 2.722345, 0, 0, 0, 1, 1,
0.8568475, -0.3450129, 2.173794, 1, 1, 1, 1, 1,
0.8650669, -1.516772, 2.652142, 1, 1, 1, 1, 1,
0.8703967, 1.778512, 0.5275794, 1, 1, 1, 1, 1,
0.8770639, -1.865814, 3.52545, 1, 1, 1, 1, 1,
0.8772811, -0.4685642, 2.952692, 1, 1, 1, 1, 1,
0.8805473, 0.1924281, 0.7433824, 1, 1, 1, 1, 1,
0.8855873, 1.168117, -1.871513, 1, 1, 1, 1, 1,
0.8860288, 1.611608, 1.337439, 1, 1, 1, 1, 1,
0.8914686, 0.9495254, 0.1476678, 1, 1, 1, 1, 1,
0.8969043, -0.1177785, 1.319318, 1, 1, 1, 1, 1,
0.8969704, 1.143662, 0.296093, 1, 1, 1, 1, 1,
0.8977015, -0.516229, 1.62728, 1, 1, 1, 1, 1,
0.9030319, 0.5621589, 0.8645154, 1, 1, 1, 1, 1,
0.9091719, 0.274828, 2.554775, 1, 1, 1, 1, 1,
0.9114332, 1.111304, 0.1239636, 1, 1, 1, 1, 1,
0.9127219, 1.770617, 1.601215, 0, 0, 1, 1, 1,
0.9127811, -0.6232291, 1.927922, 1, 0, 0, 1, 1,
0.9132032, 0.549166, -0.04025067, 1, 0, 0, 1, 1,
0.9141824, 0.9748577, 2.416193, 1, 0, 0, 1, 1,
0.9207563, 1.461588, 0.8077698, 1, 0, 0, 1, 1,
0.9325539, -2.065144, 2.526614, 1, 0, 0, 1, 1,
0.9415338, 0.9045471, 2.020335, 0, 0, 0, 1, 1,
0.9518333, 1.020541, 0.6342857, 0, 0, 0, 1, 1,
0.9522524, -0.2475067, -0.3652796, 0, 0, 0, 1, 1,
0.9575148, -1.223754, 2.051321, 0, 0, 0, 1, 1,
0.9605052, 0.7935673, 1.278385, 0, 0, 0, 1, 1,
0.962369, -0.6248875, 3.002886, 0, 0, 0, 1, 1,
0.9657298, -0.7057553, 4.066061, 0, 0, 0, 1, 1,
0.966616, 0.1608494, -0.01686216, 1, 1, 1, 1, 1,
0.9707148, 0.8224622, 0.1945446, 1, 1, 1, 1, 1,
0.9730738, -1.990365, 3.665702, 1, 1, 1, 1, 1,
0.975347, -1.301929, 1.240595, 1, 1, 1, 1, 1,
0.9821501, 1.438689, 0.5335494, 1, 1, 1, 1, 1,
0.9824401, -1.416042, 1.432861, 1, 1, 1, 1, 1,
0.9850286, -2.025337, 4.319579, 1, 1, 1, 1, 1,
0.9879522, -0.3005546, 2.177903, 1, 1, 1, 1, 1,
0.9896419, 0.6891585, -0.3730422, 1, 1, 1, 1, 1,
0.9914901, 0.2081134, 0.1246141, 1, 1, 1, 1, 1,
0.9965138, -0.5358061, 3.57469, 1, 1, 1, 1, 1,
0.9984776, -0.1443271, 2.72611, 1, 1, 1, 1, 1,
1.00023, 0.1978932, 0.6403852, 1, 1, 1, 1, 1,
1.000894, 0.4579266, 3.709676, 1, 1, 1, 1, 1,
1.005869, 0.6061278, 0.7701426, 1, 1, 1, 1, 1,
1.006223, 2.312421, 1.545169, 0, 0, 1, 1, 1,
1.009044, -0.8946277, 1.40179, 1, 0, 0, 1, 1,
1.012597, 1.436762, 1.079414, 1, 0, 0, 1, 1,
1.014397, 0.4005203, 2.705583, 1, 0, 0, 1, 1,
1.016684, -0.7771683, 3.066358, 1, 0, 0, 1, 1,
1.016819, -0.4673785, 2.348428, 1, 0, 0, 1, 1,
1.02512, -0.7856331, 4.054284, 0, 0, 0, 1, 1,
1.028167, -0.03392209, 1.354395, 0, 0, 0, 1, 1,
1.030848, -0.09228587, 0.2676232, 0, 0, 0, 1, 1,
1.032628, -0.9317, 3.790267, 0, 0, 0, 1, 1,
1.042568, 0.1662175, 0.2225671, 0, 0, 0, 1, 1,
1.048028, 0.5754126, 2.662996, 0, 0, 0, 1, 1,
1.050627, 0.1364717, 1.243826, 0, 0, 0, 1, 1,
1.056025, 0.507228, 1.85487, 1, 1, 1, 1, 1,
1.05914, -0.4359184, 1.182495, 1, 1, 1, 1, 1,
1.06742, -0.5734593, 2.941018, 1, 1, 1, 1, 1,
1.067861, -0.3490111, 3.939862, 1, 1, 1, 1, 1,
1.070205, 0.4922114, 0.8200131, 1, 1, 1, 1, 1,
1.07088, -1.472981, 3.559243, 1, 1, 1, 1, 1,
1.081237, 2.291216, -0.3685133, 1, 1, 1, 1, 1,
1.085014, 0.7119453, 0.4402595, 1, 1, 1, 1, 1,
1.090485, 2.486062, 1.836842, 1, 1, 1, 1, 1,
1.093168, -0.4893022, 2.506363, 1, 1, 1, 1, 1,
1.096235, -0.1389109, 1.140332, 1, 1, 1, 1, 1,
1.10159, 0.6855564, 3.638106, 1, 1, 1, 1, 1,
1.103524, 0.07268985, 2.699465, 1, 1, 1, 1, 1,
1.109601, 0.7737082, 0.770332, 1, 1, 1, 1, 1,
1.113863, -1.26322, 2.615681, 1, 1, 1, 1, 1,
1.123154, -0.1684608, 1.379339, 0, 0, 1, 1, 1,
1.124095, -0.2580554, 3.827551, 1, 0, 0, 1, 1,
1.124929, -1.632994, 3.229799, 1, 0, 0, 1, 1,
1.129008, 1.113044, 0.8568755, 1, 0, 0, 1, 1,
1.135013, 0.7811801, 0.03957894, 1, 0, 0, 1, 1,
1.138366, 0.6316407, -0.8061892, 1, 0, 0, 1, 1,
1.160534, -1.887655, 0.9959763, 0, 0, 0, 1, 1,
1.167112, -0.6878651, 1.061349, 0, 0, 0, 1, 1,
1.167901, -1.189194, 2.05693, 0, 0, 0, 1, 1,
1.172337, -0.6109153, 2.171434, 0, 0, 0, 1, 1,
1.175078, -1.389235, 0.5818751, 0, 0, 0, 1, 1,
1.176642, 0.307405, 1.284045, 0, 0, 0, 1, 1,
1.181873, 1.339069, 1.113195, 0, 0, 0, 1, 1,
1.191126, 0.6382557, 1.82824, 1, 1, 1, 1, 1,
1.198657, -0.2961063, 2.162026, 1, 1, 1, 1, 1,
1.199128, 0.6287334, 0.866372, 1, 1, 1, 1, 1,
1.208969, 0.5552286, 0.4222636, 1, 1, 1, 1, 1,
1.211386, -1.733563, -0.110651, 1, 1, 1, 1, 1,
1.217313, 0.3834358, 0.6692117, 1, 1, 1, 1, 1,
1.222722, 1.142447, 1.730793, 1, 1, 1, 1, 1,
1.225366, -0.3724894, -0.2776074, 1, 1, 1, 1, 1,
1.235961, 0.5605361, 2.363694, 1, 1, 1, 1, 1,
1.24766, 1.007385, 0.3767664, 1, 1, 1, 1, 1,
1.249424, 1.257206, 1.191331, 1, 1, 1, 1, 1,
1.255153, -1.152898, 2.335208, 1, 1, 1, 1, 1,
1.258077, 1.762569, 1.088684, 1, 1, 1, 1, 1,
1.260905, -1.068774, 1.976158, 1, 1, 1, 1, 1,
1.261111, 2.182252, 0.4307017, 1, 1, 1, 1, 1,
1.261967, -0.6052232, 0.5932792, 0, 0, 1, 1, 1,
1.264137, -0.4320937, 2.738773, 1, 0, 0, 1, 1,
1.264737, 1.483926, 2.486321, 1, 0, 0, 1, 1,
1.267276, -0.9359885, 0.895628, 1, 0, 0, 1, 1,
1.269986, -0.7707507, 2.2724, 1, 0, 0, 1, 1,
1.273788, -0.4592722, 2.38253, 1, 0, 0, 1, 1,
1.27522, -0.5412299, 2.294036, 0, 0, 0, 1, 1,
1.276872, 1.819084, -0.277052, 0, 0, 0, 1, 1,
1.279228, -1.87292, 2.000158, 0, 0, 0, 1, 1,
1.291437, 0.6183743, 2.12142, 0, 0, 0, 1, 1,
1.29872, 1.394503, 0.1008048, 0, 0, 0, 1, 1,
1.305097, -0.8451242, 2.585451, 0, 0, 0, 1, 1,
1.31229, -0.4169274, 0.4997742, 0, 0, 0, 1, 1,
1.313156, -0.3152445, 2.375135, 1, 1, 1, 1, 1,
1.313574, 1.033759, 1.195775, 1, 1, 1, 1, 1,
1.319147, 0.9190004, -0.8176842, 1, 1, 1, 1, 1,
1.328609, 0.1635495, 2.074712, 1, 1, 1, 1, 1,
1.334329, 0.1392803, -0.6660392, 1, 1, 1, 1, 1,
1.340572, -0.1116028, 3.071863, 1, 1, 1, 1, 1,
1.34109, 1.331654, 0.1181381, 1, 1, 1, 1, 1,
1.366644, -0.6951679, 1.447109, 1, 1, 1, 1, 1,
1.388283, 0.03002668, 0.8472484, 1, 1, 1, 1, 1,
1.392936, -0.06290097, 1.169172, 1, 1, 1, 1, 1,
1.419133, -2.927027, 2.303705, 1, 1, 1, 1, 1,
1.424286, 0.4518606, -1.203043, 1, 1, 1, 1, 1,
1.428169, -0.2097011, 1.391952, 1, 1, 1, 1, 1,
1.428217, -1.414313, 4.396946, 1, 1, 1, 1, 1,
1.435531, 0.4242527, 0.7003599, 1, 1, 1, 1, 1,
1.470871, -1.928284, 3.117957, 0, 0, 1, 1, 1,
1.47851, -0.5632436, 2.539051, 1, 0, 0, 1, 1,
1.489198, 0.1715119, 1.506157, 1, 0, 0, 1, 1,
1.492651, -1.301335, 2.248625, 1, 0, 0, 1, 1,
1.493563, 1.103883, -2.096549, 1, 0, 0, 1, 1,
1.499935, -0.350596, 1.530014, 1, 0, 0, 1, 1,
1.506915, 0.5030723, 1.247419, 0, 0, 0, 1, 1,
1.51216, -0.4193478, 2.494822, 0, 0, 0, 1, 1,
1.526014, -1.344998, 1.012289, 0, 0, 0, 1, 1,
1.528044, -0.6666511, 2.207912, 0, 0, 0, 1, 1,
1.541318, 0.3916737, 1.657564, 0, 0, 0, 1, 1,
1.549523, -1.051135, 0.4503174, 0, 0, 0, 1, 1,
1.551034, 1.067025, 1.637952, 0, 0, 0, 1, 1,
1.551423, -1.183189, 1.143283, 1, 1, 1, 1, 1,
1.567184, -0.9696509, 3.37147, 1, 1, 1, 1, 1,
1.567414, -0.03802054, 2.738813, 1, 1, 1, 1, 1,
1.572094, -0.4555987, 3.340435, 1, 1, 1, 1, 1,
1.572506, -0.7054002, 2.194511, 1, 1, 1, 1, 1,
1.585188, -0.2153597, 1.833691, 1, 1, 1, 1, 1,
1.588649, 0.1165794, 3.659979, 1, 1, 1, 1, 1,
1.594162, -0.6785448, 2.964201, 1, 1, 1, 1, 1,
1.615304, 1.176576, 0.8632218, 1, 1, 1, 1, 1,
1.62648, 0.6858946, -0.2038884, 1, 1, 1, 1, 1,
1.638768, -0.290787, 2.959445, 1, 1, 1, 1, 1,
1.639408, 0.446222, 2.378601, 1, 1, 1, 1, 1,
1.663537, -0.7468382, 1.693606, 1, 1, 1, 1, 1,
1.675751, -0.9930491, 1.969255, 1, 1, 1, 1, 1,
1.679226, 0.3094239, 2.896947, 1, 1, 1, 1, 1,
1.684841, -0.8732001, 2.740784, 0, 0, 1, 1, 1,
1.695535, -0.2781688, 0.7259594, 1, 0, 0, 1, 1,
1.702024, -0.2495607, 3.080453, 1, 0, 0, 1, 1,
1.711521, 0.1559407, 0.8724203, 1, 0, 0, 1, 1,
1.71529, -1.102586, 2.040849, 1, 0, 0, 1, 1,
1.722385, -0.02568572, 2.393825, 1, 0, 0, 1, 1,
1.730546, -0.2920484, 1.509368, 0, 0, 0, 1, 1,
1.755185, 1.172237, -0.2324337, 0, 0, 0, 1, 1,
1.774369, 0.6794558, 1.850568, 0, 0, 0, 1, 1,
1.784087, -0.6196999, 1.124323, 0, 0, 0, 1, 1,
1.801104, 0.7427387, 0.2835482, 0, 0, 0, 1, 1,
1.842532, 2.208928, 2.189735, 0, 0, 0, 1, 1,
1.844955, -0.9069766, 2.095758, 0, 0, 0, 1, 1,
1.850576, -0.9643327, 1.918831, 1, 1, 1, 1, 1,
1.880933, -1.822791, 3.624754, 1, 1, 1, 1, 1,
1.8859, -1.595974, 0.7862837, 1, 1, 1, 1, 1,
1.890506, 0.08677598, 1.026976, 1, 1, 1, 1, 1,
1.892697, 0.7971179, 3.277102, 1, 1, 1, 1, 1,
1.936303, 0.01179609, 0.367291, 1, 1, 1, 1, 1,
1.960826, 0.4707396, -1.326399, 1, 1, 1, 1, 1,
1.966358, -0.2188933, 3.623516, 1, 1, 1, 1, 1,
1.977182, -0.5498433, 1.411359, 1, 1, 1, 1, 1,
1.982996, 0.4705854, 0.9459096, 1, 1, 1, 1, 1,
1.99139, 1.664835, -1.240327, 1, 1, 1, 1, 1,
2.024689, 0.1937756, 0.7229906, 1, 1, 1, 1, 1,
2.033828, 0.262708, 0.5669093, 1, 1, 1, 1, 1,
2.039756, 1.414557, 1.582067, 1, 1, 1, 1, 1,
2.087892, 0.2009466, 2.12997, 1, 1, 1, 1, 1,
2.148232, 0.6481761, 2.249324, 0, 0, 1, 1, 1,
2.153807, -0.01331789, 0.2232637, 1, 0, 0, 1, 1,
2.162423, -1.203164, 3.83746, 1, 0, 0, 1, 1,
2.165096, 1.361365, 1.752088, 1, 0, 0, 1, 1,
2.175849, -0.07450953, 1.204679, 1, 0, 0, 1, 1,
2.207675, -0.8696529, 1.800212, 1, 0, 0, 1, 1,
2.225259, -0.6936041, 0.1266542, 0, 0, 0, 1, 1,
2.315758, 0.4098692, 1.532536, 0, 0, 0, 1, 1,
2.347983, -0.01059276, 1.694728, 0, 0, 0, 1, 1,
2.376034, 0.614435, 1.901551, 0, 0, 0, 1, 1,
2.43012, 1.116574, 1.967677, 0, 0, 0, 1, 1,
2.517973, -1.68216, 4.375288, 0, 0, 0, 1, 1,
2.529595, 3.133208, 0.5521066, 0, 0, 0, 1, 1,
2.604305, 1.676309, 0.6586365, 1, 1, 1, 1, 1,
2.636564, -2.503917, 1.777842, 1, 1, 1, 1, 1,
2.649525, -0.304377, 1.636866, 1, 1, 1, 1, 1,
2.677705, 1.058074, 1.036882, 1, 1, 1, 1, 1,
2.739854, 0.3060798, 0.7157431, 1, 1, 1, 1, 1,
2.969531, 0.6861358, 2.232483, 1, 1, 1, 1, 1,
3.032583, 0.1433818, 0.3746551, 1, 1, 1, 1, 1
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
var radius = 9.3587;
var distance = 32.87204;
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
mvMatrix.translate( 0.02740932, -0.06071687, 0.1228449 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.87204);
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
