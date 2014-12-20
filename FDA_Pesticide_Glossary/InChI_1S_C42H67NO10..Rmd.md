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
-2.833041, 1.116899, -1.557212, 1, 0, 0, 1,
-2.627467, 1.237845, -2.239748, 1, 0.007843138, 0, 1,
-2.615868, 0.332078, -2.132072, 1, 0.01176471, 0, 1,
-2.534124, -0.4230205, -2.554429, 1, 0.01960784, 0, 1,
-2.504663, -0.2234761, 0.604389, 1, 0.02352941, 0, 1,
-2.451068, -0.6637525, -0.7021924, 1, 0.03137255, 0, 1,
-2.383592, 0.213731, -2.056038, 1, 0.03529412, 0, 1,
-2.350544, -1.376874, -1.910824, 1, 0.04313726, 0, 1,
-2.349146, -3.343185, -2.686907, 1, 0.04705882, 0, 1,
-2.340762, 0.6866984, -0.6496953, 1, 0.05490196, 0, 1,
-2.268066, 1.88343, -2.056657, 1, 0.05882353, 0, 1,
-2.251332, -1.163645, -0.8453198, 1, 0.06666667, 0, 1,
-2.213563, 1.197466, 1.092818, 1, 0.07058824, 0, 1,
-2.11308, -0.662247, -1.880933, 1, 0.07843138, 0, 1,
-2.104924, 0.4380975, -1.347902, 1, 0.08235294, 0, 1,
-2.0913, 0.4151774, -3.053975, 1, 0.09019608, 0, 1,
-2.077992, 0.1657696, -0.964365, 1, 0.09411765, 0, 1,
-2.075777, 0.7596619, -1.575901, 1, 0.1019608, 0, 1,
-1.965061, 0.398553, -1.989676, 1, 0.1098039, 0, 1,
-1.951144, 0.6745806, -1.662934, 1, 0.1137255, 0, 1,
-1.933885, -0.3338442, -0.7706676, 1, 0.1215686, 0, 1,
-1.931384, -1.479697, -2.122866, 1, 0.1254902, 0, 1,
-1.914336, 0.02033702, -0.9407445, 1, 0.1333333, 0, 1,
-1.913774, 0.3248253, -1.46071, 1, 0.1372549, 0, 1,
-1.910404, -0.6699824, -2.222999, 1, 0.145098, 0, 1,
-1.840118, 1.409474, -1.683592, 1, 0.1490196, 0, 1,
-1.829428, 0.304369, -0.4353365, 1, 0.1568628, 0, 1,
-1.819433, 0.1163353, -2.505391, 1, 0.1607843, 0, 1,
-1.791549, -0.2505221, -0.5955721, 1, 0.1686275, 0, 1,
-1.776392, -1.788808, -3.170933, 1, 0.172549, 0, 1,
-1.736505, 1.122116, -1.365522, 1, 0.1803922, 0, 1,
-1.73278, -0.1136921, -0.5703449, 1, 0.1843137, 0, 1,
-1.710688, -0.5726306, -2.166652, 1, 0.1921569, 0, 1,
-1.703439, 0.6816617, -1.224906, 1, 0.1960784, 0, 1,
-1.684503, -0.2321162, -1.922747, 1, 0.2039216, 0, 1,
-1.680943, 0.932568, -1.59396, 1, 0.2117647, 0, 1,
-1.666647, -0.9997403, -1.297359, 1, 0.2156863, 0, 1,
-1.652388, 1.142437, -1.391827, 1, 0.2235294, 0, 1,
-1.648394, -1.390577, -1.865059, 1, 0.227451, 0, 1,
-1.64579, 0.2521684, -0.3692625, 1, 0.2352941, 0, 1,
-1.633441, 0.1253939, -0.8847322, 1, 0.2392157, 0, 1,
-1.623704, -1.597108, -0.1263463, 1, 0.2470588, 0, 1,
-1.618161, 0.9012985, -1.050586, 1, 0.2509804, 0, 1,
-1.585431, -0.602656, -2.403924, 1, 0.2588235, 0, 1,
-1.583601, 0.1874525, -2.410892, 1, 0.2627451, 0, 1,
-1.566534, 0.9307382, -0.4846438, 1, 0.2705882, 0, 1,
-1.564682, 0.2214627, -0.5171588, 1, 0.2745098, 0, 1,
-1.55968, 0.9225731, -2.201185, 1, 0.282353, 0, 1,
-1.546864, -1.458403, -2.567203, 1, 0.2862745, 0, 1,
-1.535508, -0.2174694, -2.727452, 1, 0.2941177, 0, 1,
-1.528322, 0.1868352, -1.999671, 1, 0.3019608, 0, 1,
-1.525708, 0.4331875, -2.132445, 1, 0.3058824, 0, 1,
-1.50083, 0.244294, -1.058895, 1, 0.3137255, 0, 1,
-1.492117, 0.004967066, -2.850034, 1, 0.3176471, 0, 1,
-1.468738, 0.04249344, -0.7514766, 1, 0.3254902, 0, 1,
-1.449089, 0.05640157, -2.837841, 1, 0.3294118, 0, 1,
-1.441826, -0.05284928, -2.827601, 1, 0.3372549, 0, 1,
-1.44102, -0.5488388, -2.657812, 1, 0.3411765, 0, 1,
-1.435287, 0.1460951, -2.042521, 1, 0.3490196, 0, 1,
-1.428729, -1.009533, -1.072196, 1, 0.3529412, 0, 1,
-1.426998, 0.1612259, -1.202329, 1, 0.3607843, 0, 1,
-1.424915, -0.4853757, -4.036926, 1, 0.3647059, 0, 1,
-1.41161, -1.701196, -3.166112, 1, 0.372549, 0, 1,
-1.396582, -1.199636, -0.2441035, 1, 0.3764706, 0, 1,
-1.393784, 0.8153377, -0.1996973, 1, 0.3843137, 0, 1,
-1.382127, -0.2248375, -0.9938664, 1, 0.3882353, 0, 1,
-1.381837, -1.340731, -3.306418, 1, 0.3960784, 0, 1,
-1.371415, 0.1336803, -2.578207, 1, 0.4039216, 0, 1,
-1.36737, -0.3460549, -2.067702, 1, 0.4078431, 0, 1,
-1.357667, -1.090405, -2.620042, 1, 0.4156863, 0, 1,
-1.343267, -0.3858241, -1.929189, 1, 0.4196078, 0, 1,
-1.337721, 0.0144323, -0.6531954, 1, 0.427451, 0, 1,
-1.337128, 1.213885, -0.3960622, 1, 0.4313726, 0, 1,
-1.334304, 0.1776324, -1.173964, 1, 0.4392157, 0, 1,
-1.332914, -0.4683909, -2.212467, 1, 0.4431373, 0, 1,
-1.332436, -1.226306, -3.756476, 1, 0.4509804, 0, 1,
-1.32558, -0.3286178, -2.462521, 1, 0.454902, 0, 1,
-1.321373, 0.571132, -0.6545489, 1, 0.4627451, 0, 1,
-1.310743, 0.2110577, -1.994654, 1, 0.4666667, 0, 1,
-1.310551, 0.03305886, -0.9863639, 1, 0.4745098, 0, 1,
-1.296152, -0.7456421, -0.4630443, 1, 0.4784314, 0, 1,
-1.291208, -0.08738547, -2.561632, 1, 0.4862745, 0, 1,
-1.281937, -0.3465621, -2.502542, 1, 0.4901961, 0, 1,
-1.280244, 0.8630271, -1.370653, 1, 0.4980392, 0, 1,
-1.27533, 0.08400624, -2.978879, 1, 0.5058824, 0, 1,
-1.269117, -0.5849593, -0.8981403, 1, 0.509804, 0, 1,
-1.261134, 0.9045719, -0.8160326, 1, 0.5176471, 0, 1,
-1.25624, 0.4044763, 0.6945845, 1, 0.5215687, 0, 1,
-1.241177, -0.0143674, -0.6992457, 1, 0.5294118, 0, 1,
-1.232157, 0.997509, -0.4749571, 1, 0.5333334, 0, 1,
-1.231518, -2.566656, -3.794763, 1, 0.5411765, 0, 1,
-1.230845, 0.398178, -0.7776157, 1, 0.5450981, 0, 1,
-1.226243, -0.595838, -0.8420497, 1, 0.5529412, 0, 1,
-1.225926, 0.6694644, 0.8801, 1, 0.5568628, 0, 1,
-1.219371, 0.5618244, -1.080906, 1, 0.5647059, 0, 1,
-1.209036, -0.6455012, -2.456171, 1, 0.5686275, 0, 1,
-1.205045, 0.8260449, -0.3740143, 1, 0.5764706, 0, 1,
-1.199653, 0.6451375, -1.227494, 1, 0.5803922, 0, 1,
-1.179453, 0.3864375, -0.7756014, 1, 0.5882353, 0, 1,
-1.175503, 1.267018, -1.885317, 1, 0.5921569, 0, 1,
-1.173761, -0.4775742, -1.453012, 1, 0.6, 0, 1,
-1.172876, -0.6796241, -3.36745, 1, 0.6078432, 0, 1,
-1.163218, -0.2980166, -2.251163, 1, 0.6117647, 0, 1,
-1.16153, 0.2990812, -1.135043, 1, 0.6196079, 0, 1,
-1.159757, 1.045756, -0.9610396, 1, 0.6235294, 0, 1,
-1.156955, 1.244216, -1.234693, 1, 0.6313726, 0, 1,
-1.154219, 0.347289, -1.850889, 1, 0.6352941, 0, 1,
-1.147611, -0.582857, -3.963143, 1, 0.6431373, 0, 1,
-1.146766, 0.5589994, -1.105594, 1, 0.6470588, 0, 1,
-1.14296, 0.6468428, -0.3814602, 1, 0.654902, 0, 1,
-1.134866, 0.5180204, -0.179757, 1, 0.6588235, 0, 1,
-1.133162, 0.5362908, -0.8330724, 1, 0.6666667, 0, 1,
-1.123512, -1.074207, -3.470063, 1, 0.6705883, 0, 1,
-1.121427, -0.3008451, -2.471998, 1, 0.6784314, 0, 1,
-1.110039, -0.3905186, 0.01662006, 1, 0.682353, 0, 1,
-1.099004, -0.001147602, -1.38323, 1, 0.6901961, 0, 1,
-1.098927, -1.345334, -3.356598, 1, 0.6941177, 0, 1,
-1.092654, -0.8237549, -3.150891, 1, 0.7019608, 0, 1,
-1.088788, 0.661893, -0.6187169, 1, 0.7098039, 0, 1,
-1.087727, 0.6014455, 0.008950282, 1, 0.7137255, 0, 1,
-1.086064, 0.008926307, -1.003875, 1, 0.7215686, 0, 1,
-1.085532, 1.086532, -1.279168, 1, 0.7254902, 0, 1,
-1.085212, 0.3398473, -1.95732, 1, 0.7333333, 0, 1,
-1.084025, -0.7228538, -1.623988, 1, 0.7372549, 0, 1,
-1.082774, 0.7001379, -1.879438, 1, 0.7450981, 0, 1,
-1.079891, -0.7075002, -0.9475428, 1, 0.7490196, 0, 1,
-1.079638, 0.4085197, -1.636276, 1, 0.7568628, 0, 1,
-1.076112, 1.517861, -0.4263656, 1, 0.7607843, 0, 1,
-1.070613, 0.5672546, -1.865683, 1, 0.7686275, 0, 1,
-1.066203, -0.5928797, 0.02233331, 1, 0.772549, 0, 1,
-1.063383, -0.3437267, -2.821918, 1, 0.7803922, 0, 1,
-1.062645, 0.4515833, -1.161344, 1, 0.7843137, 0, 1,
-1.062205, -0.2254909, -1.25105, 1, 0.7921569, 0, 1,
-1.051273, -1.002685, -2.877865, 1, 0.7960784, 0, 1,
-1.049435, 0.6342451, -0.4605963, 1, 0.8039216, 0, 1,
-1.04837, 0.4124773, -1.567506, 1, 0.8117647, 0, 1,
-1.046957, 0.159794, -2.41003, 1, 0.8156863, 0, 1,
-1.045904, -0.2197984, -1.90952, 1, 0.8235294, 0, 1,
-1.044843, -0.6626206, -2.884561, 1, 0.827451, 0, 1,
-1.043971, -0.3304043, -4.316286, 1, 0.8352941, 0, 1,
-1.043177, -1.682598, -2.777602, 1, 0.8392157, 0, 1,
-1.038113, -1.474233, -3.330615, 1, 0.8470588, 0, 1,
-1.035217, -1.259298, -3.775743, 1, 0.8509804, 0, 1,
-1.023363, -0.0747278, -0.6611667, 1, 0.8588235, 0, 1,
-1.012401, -2.016429, -3.456753, 1, 0.8627451, 0, 1,
-1.012178, 1.178652, -0.9998909, 1, 0.8705882, 0, 1,
-1.006542, -0.8935775, -2.88179, 1, 0.8745098, 0, 1,
-1.005519, 0.1174986, -2.931368, 1, 0.8823529, 0, 1,
-1.005439, 0.4274372, -1.729545, 1, 0.8862745, 0, 1,
-1.001878, 0.5879043, 0.6448673, 1, 0.8941177, 0, 1,
-0.9852592, -0.5430629, -4.367629, 1, 0.8980392, 0, 1,
-0.9824581, -0.2829816, -1.335496, 1, 0.9058824, 0, 1,
-0.9810246, -0.05480225, -0.5147133, 1, 0.9137255, 0, 1,
-0.9802166, -1.207402, -3.250309, 1, 0.9176471, 0, 1,
-0.9771764, 0.2232642, -0.795773, 1, 0.9254902, 0, 1,
-0.9761618, -0.5129103, -1.324461, 1, 0.9294118, 0, 1,
-0.9744959, -0.1524311, -1.727562, 1, 0.9372549, 0, 1,
-0.9659163, -0.3353145, -0.9317666, 1, 0.9411765, 0, 1,
-0.9645418, 0.1123238, -2.696816, 1, 0.9490196, 0, 1,
-0.9635434, 0.6195754, 0.8527984, 1, 0.9529412, 0, 1,
-0.9583716, 2.250014, -1.388826, 1, 0.9607843, 0, 1,
-0.9555523, -0.1128231, -0.6540334, 1, 0.9647059, 0, 1,
-0.9549016, -1.077022, -2.776618, 1, 0.972549, 0, 1,
-0.9547967, -0.6301281, -1.22561, 1, 0.9764706, 0, 1,
-0.954274, 1.661819, -3.022452, 1, 0.9843137, 0, 1,
-0.943926, 0.1686673, -3.453869, 1, 0.9882353, 0, 1,
-0.9409153, 0.7466486, 0.2857167, 1, 0.9960784, 0, 1,
-0.9402097, -1.381861, -3.303553, 0.9960784, 1, 0, 1,
-0.9363667, 1.650322, -1.667848, 0.9921569, 1, 0, 1,
-0.9313424, 0.07428779, -3.346451, 0.9843137, 1, 0, 1,
-0.928677, -0.1190973, -3.721255, 0.9803922, 1, 0, 1,
-0.9266824, -0.04870934, -3.138993, 0.972549, 1, 0, 1,
-0.9264498, 1.53989, -2.403504, 0.9686275, 1, 0, 1,
-0.9210451, 0.7096041, -0.1980459, 0.9607843, 1, 0, 1,
-0.9169798, -2.418886, -3.541732, 0.9568627, 1, 0, 1,
-0.9135953, 0.6867135, -0.7279819, 0.9490196, 1, 0, 1,
-0.9063832, -0.4068175, -2.968101, 0.945098, 1, 0, 1,
-0.9055553, 0.3319192, -0.7069792, 0.9372549, 1, 0, 1,
-0.8962436, -1.970185, -4.049818, 0.9333333, 1, 0, 1,
-0.8945695, 0.5771331, -1.752961, 0.9254902, 1, 0, 1,
-0.8881561, -0.0002418897, -2.886953, 0.9215686, 1, 0, 1,
-0.887831, -0.5394369, -0.6235757, 0.9137255, 1, 0, 1,
-0.886318, 0.6603662, -1.047989, 0.9098039, 1, 0, 1,
-0.881495, 1.320717, -0.7047232, 0.9019608, 1, 0, 1,
-0.8771555, 0.3265902, -0.8068651, 0.8941177, 1, 0, 1,
-0.8667607, 0.05557999, -1.972322, 0.8901961, 1, 0, 1,
-0.8617263, -0.8324928, -2.584042, 0.8823529, 1, 0, 1,
-0.8447161, -1.557442, -2.121334, 0.8784314, 1, 0, 1,
-0.8440858, 0.2807496, -1.887816, 0.8705882, 1, 0, 1,
-0.833573, -0.7802522, -2.667622, 0.8666667, 1, 0, 1,
-0.8284339, 0.7635009, -2.135457, 0.8588235, 1, 0, 1,
-0.8200679, 0.4164928, -0.6227826, 0.854902, 1, 0, 1,
-0.8150385, 0.6403638, -1.555423, 0.8470588, 1, 0, 1,
-0.7997863, -0.296686, -1.890393, 0.8431373, 1, 0, 1,
-0.7981585, -0.4382602, -0.5163824, 0.8352941, 1, 0, 1,
-0.7960194, 1.728968, 0.02379832, 0.8313726, 1, 0, 1,
-0.7893868, 0.01628016, -3.13197, 0.8235294, 1, 0, 1,
-0.7874402, 0.7247266, -0.8093398, 0.8196079, 1, 0, 1,
-0.7794285, 0.7522992, -1.265838, 0.8117647, 1, 0, 1,
-0.7731684, 0.772418, 0.1502735, 0.8078431, 1, 0, 1,
-0.7712325, 1.168605, -2.811865, 0.8, 1, 0, 1,
-0.767745, 0.357918, -1.849543, 0.7921569, 1, 0, 1,
-0.7677042, -1.43686, -2.57238, 0.7882353, 1, 0, 1,
-0.7671615, 0.180931, -0.6315971, 0.7803922, 1, 0, 1,
-0.7649335, -1.127945, -1.870776, 0.7764706, 1, 0, 1,
-0.7630349, 1.64653, -1.135468, 0.7686275, 1, 0, 1,
-0.762102, 0.7588717, -2.683624, 0.7647059, 1, 0, 1,
-0.7521352, 0.1276494, -2.361961, 0.7568628, 1, 0, 1,
-0.7506594, -0.5910849, -3.715067, 0.7529412, 1, 0, 1,
-0.7384065, 0.2428776, -1.460867, 0.7450981, 1, 0, 1,
-0.7354478, 1.271268, -0.9982414, 0.7411765, 1, 0, 1,
-0.733206, -2.007751, -4.095835, 0.7333333, 1, 0, 1,
-0.7329499, -0.134306, -2.338814, 0.7294118, 1, 0, 1,
-0.7267915, 0.4180389, -0.5071538, 0.7215686, 1, 0, 1,
-0.7238245, -0.4038124, -0.5729257, 0.7176471, 1, 0, 1,
-0.7232184, -0.5786656, -3.15943, 0.7098039, 1, 0, 1,
-0.7194446, 1.845125, -1.329755, 0.7058824, 1, 0, 1,
-0.7174879, 0.7277699, -1.62291, 0.6980392, 1, 0, 1,
-0.711345, -0.7134055, -2.733966, 0.6901961, 1, 0, 1,
-0.7105724, -0.1569068, -1.574988, 0.6862745, 1, 0, 1,
-0.7098117, -0.5991783, -3.093806, 0.6784314, 1, 0, 1,
-0.7077315, -0.05790949, -2.556854, 0.6745098, 1, 0, 1,
-0.7003878, 0.6988766, 0.9765054, 0.6666667, 1, 0, 1,
-0.7000066, -1.229647, -2.460757, 0.6627451, 1, 0, 1,
-0.696415, -0.04415886, -0.5876768, 0.654902, 1, 0, 1,
-0.6961138, 0.501651, -1.148618, 0.6509804, 1, 0, 1,
-0.6890924, -2.363842, -2.657345, 0.6431373, 1, 0, 1,
-0.689039, -0.5942623, -1.054993, 0.6392157, 1, 0, 1,
-0.6871745, 0.152257, -2.144973, 0.6313726, 1, 0, 1,
-0.6855538, -1.357816, -2.451973, 0.627451, 1, 0, 1,
-0.6834784, 1.724798, 1.71088, 0.6196079, 1, 0, 1,
-0.6789345, -0.5370804, -1.757536, 0.6156863, 1, 0, 1,
-0.6773735, -0.3636144, -1.528031, 0.6078432, 1, 0, 1,
-0.6727227, -0.01886297, -1.488548, 0.6039216, 1, 0, 1,
-0.6716366, 1.013707, -0.2997529, 0.5960785, 1, 0, 1,
-0.6715106, -1.042295, -2.281588, 0.5882353, 1, 0, 1,
-0.6703504, 1.321746, -2.026782, 0.5843138, 1, 0, 1,
-0.6664322, 0.1992308, -1.566564, 0.5764706, 1, 0, 1,
-0.6651426, -1.057215, -2.566551, 0.572549, 1, 0, 1,
-0.6647936, 0.7788625, -0.9767222, 0.5647059, 1, 0, 1,
-0.6643056, -1.543312, -1.687996, 0.5607843, 1, 0, 1,
-0.6626796, -0.5065203, -0.3718775, 0.5529412, 1, 0, 1,
-0.6619881, 0.1448603, -1.642295, 0.5490196, 1, 0, 1,
-0.6526858, 2.58643, 0.1399141, 0.5411765, 1, 0, 1,
-0.6522121, -1.273703, -1.725286, 0.5372549, 1, 0, 1,
-0.6515782, 1.950214, -0.8167847, 0.5294118, 1, 0, 1,
-0.648645, -1.259574, -2.327818, 0.5254902, 1, 0, 1,
-0.6428046, -1.071538, -0.6810235, 0.5176471, 1, 0, 1,
-0.6403185, -0.5991792, -1.51871, 0.5137255, 1, 0, 1,
-0.6395385, -0.5853247, -1.964441, 0.5058824, 1, 0, 1,
-0.6325445, -0.04195851, -2.969005, 0.5019608, 1, 0, 1,
-0.627187, 0.9702523, -0.762772, 0.4941176, 1, 0, 1,
-0.6214347, 0.8831549, 1.696773, 0.4862745, 1, 0, 1,
-0.6144943, 0.1960183, -0.3211502, 0.4823529, 1, 0, 1,
-0.6133578, -1.172743, -4.006244, 0.4745098, 1, 0, 1,
-0.6098239, -0.8595487, -4.244836, 0.4705882, 1, 0, 1,
-0.6077819, -0.7996023, -3.050193, 0.4627451, 1, 0, 1,
-0.6054505, -1.445763, -2.803983, 0.4588235, 1, 0, 1,
-0.6030035, 0.3059485, -1.751269, 0.4509804, 1, 0, 1,
-0.6027123, 0.8200779, -1.389978, 0.4470588, 1, 0, 1,
-0.5994248, -1.081878, -1.953021, 0.4392157, 1, 0, 1,
-0.5961635, 0.6916838, -1.220829, 0.4352941, 1, 0, 1,
-0.5936596, -1.736921, -1.330114, 0.427451, 1, 0, 1,
-0.593549, -0.4049685, -2.781478, 0.4235294, 1, 0, 1,
-0.5918957, 0.8004643, -0.7960495, 0.4156863, 1, 0, 1,
-0.5904458, 0.1762605, -0.1386649, 0.4117647, 1, 0, 1,
-0.5864914, -0.5768468, -3.050033, 0.4039216, 1, 0, 1,
-0.5852469, 0.3181945, -0.7652308, 0.3960784, 1, 0, 1,
-0.5831646, 2.405205, 1.429117, 0.3921569, 1, 0, 1,
-0.5830544, 1.730972, 0.07727761, 0.3843137, 1, 0, 1,
-0.58291, -0.1500259, -2.789209, 0.3803922, 1, 0, 1,
-0.5817516, -0.4305697, -3.879387, 0.372549, 1, 0, 1,
-0.5768717, 1.648614, -0.8077556, 0.3686275, 1, 0, 1,
-0.574372, -0.6597389, -1.603794, 0.3607843, 1, 0, 1,
-0.5717344, -1.107148, -2.131484, 0.3568628, 1, 0, 1,
-0.5694565, 0.1763982, -0.723459, 0.3490196, 1, 0, 1,
-0.5689937, 0.07569899, -1.099833, 0.345098, 1, 0, 1,
-0.5681187, 0.332028, -0.4162257, 0.3372549, 1, 0, 1,
-0.566668, -0.8427711, -3.043742, 0.3333333, 1, 0, 1,
-0.5593159, 0.7306861, -1.687889, 0.3254902, 1, 0, 1,
-0.5551339, -2.593857, -1.500449, 0.3215686, 1, 0, 1,
-0.5507121, 0.128993, -2.363608, 0.3137255, 1, 0, 1,
-0.550252, -0.9049049, -2.092505, 0.3098039, 1, 0, 1,
-0.5493777, -0.07982345, -1.376836, 0.3019608, 1, 0, 1,
-0.5485878, -1.270691, -2.457816, 0.2941177, 1, 0, 1,
-0.5470175, 0.2880282, -2.098163, 0.2901961, 1, 0, 1,
-0.5458232, -0.1347932, -1.655598, 0.282353, 1, 0, 1,
-0.5457841, -0.2031277, -1.711867, 0.2784314, 1, 0, 1,
-0.5425651, -1.199887, -2.635772, 0.2705882, 1, 0, 1,
-0.5419974, 0.1100686, -0.983593, 0.2666667, 1, 0, 1,
-0.5370981, 1.221325, -0.6890413, 0.2588235, 1, 0, 1,
-0.533852, 0.6963503, -0.762297, 0.254902, 1, 0, 1,
-0.5333841, 0.6220096, -1.895642, 0.2470588, 1, 0, 1,
-0.5330425, -0.5943645, -2.011217, 0.2431373, 1, 0, 1,
-0.5324857, -0.2561818, -2.776213, 0.2352941, 1, 0, 1,
-0.5274535, 0.5554552, -0.3025166, 0.2313726, 1, 0, 1,
-0.5253891, -2.417253, -2.538343, 0.2235294, 1, 0, 1,
-0.525272, 0.5820036, -2.368398, 0.2196078, 1, 0, 1,
-0.5240605, 0.2146749, -2.184285, 0.2117647, 1, 0, 1,
-0.5230604, 0.9257419, -0.2472812, 0.2078431, 1, 0, 1,
-0.5156526, 1.850588, 0.4831749, 0.2, 1, 0, 1,
-0.5142986, 1.30645, -1.316875, 0.1921569, 1, 0, 1,
-0.5132704, -0.05501482, -0.54299, 0.1882353, 1, 0, 1,
-0.5113218, -0.3598207, -0.6386987, 0.1803922, 1, 0, 1,
-0.5082074, 0.1570626, -1.387026, 0.1764706, 1, 0, 1,
-0.5008265, 0.07888681, -2.283908, 0.1686275, 1, 0, 1,
-0.5007829, -0.3985325, -2.647283, 0.1647059, 1, 0, 1,
-0.4993581, -0.09237061, -2.059188, 0.1568628, 1, 0, 1,
-0.4968833, 0.1582003, -2.500332, 0.1529412, 1, 0, 1,
-0.4966223, 0.2133663, -0.6258119, 0.145098, 1, 0, 1,
-0.4965952, 1.153495, 0.04838951, 0.1411765, 1, 0, 1,
-0.4948298, 0.6521829, -1.452386, 0.1333333, 1, 0, 1,
-0.4926718, 1.897864, 0.3569264, 0.1294118, 1, 0, 1,
-0.4908208, -0.9949148, -2.162427, 0.1215686, 1, 0, 1,
-0.4901995, 0.05853659, -2.147158, 0.1176471, 1, 0, 1,
-0.4896588, -2.503526, -1.940343, 0.1098039, 1, 0, 1,
-0.4865242, 0.2721502, -1.700624, 0.1058824, 1, 0, 1,
-0.4865027, -0.5552716, -0.9349458, 0.09803922, 1, 0, 1,
-0.4825732, 0.2665308, -0.522152, 0.09019608, 1, 0, 1,
-0.4804353, 0.6002698, 0.3174688, 0.08627451, 1, 0, 1,
-0.4800248, 1.094661, -0.03211254, 0.07843138, 1, 0, 1,
-0.475571, 0.9241012, 0.1929214, 0.07450981, 1, 0, 1,
-0.473693, 3.19978, 0.7321776, 0.06666667, 1, 0, 1,
-0.4711794, -1.328217, -0.6706935, 0.0627451, 1, 0, 1,
-0.4665075, 1.006536, -0.3513753, 0.05490196, 1, 0, 1,
-0.4664398, 0.7993394, 1.123787, 0.05098039, 1, 0, 1,
-0.4639585, 0.3690904, -0.1851282, 0.04313726, 1, 0, 1,
-0.4586994, -1.643729, -1.235608, 0.03921569, 1, 0, 1,
-0.4585283, -0.08397874, -3.737729, 0.03137255, 1, 0, 1,
-0.4579509, -0.3140839, -1.390435, 0.02745098, 1, 0, 1,
-0.4569151, 1.559711, -1.747341, 0.01960784, 1, 0, 1,
-0.4565495, 2.037043, -1.238179, 0.01568628, 1, 0, 1,
-0.4503597, -1.394515, -2.433672, 0.007843138, 1, 0, 1,
-0.4474851, -0.7022028, -4.280604, 0.003921569, 1, 0, 1,
-0.4465306, 1.22948, -1.189068, 0, 1, 0.003921569, 1,
-0.4440434, 0.6558117, -0.828403, 0, 1, 0.01176471, 1,
-0.4375906, -1.148512, -1.143388, 0, 1, 0.01568628, 1,
-0.428377, -0.8639152, -4.250717, 0, 1, 0.02352941, 1,
-0.4264381, -0.6065546, -1.070119, 0, 1, 0.02745098, 1,
-0.4250095, -0.6283985, -2.460623, 0, 1, 0.03529412, 1,
-0.42449, 0.4626728, -0.7209136, 0, 1, 0.03921569, 1,
-0.4236369, 0.1380142, -0.4206455, 0, 1, 0.04705882, 1,
-0.4233561, -0.159925, -1.501322, 0, 1, 0.05098039, 1,
-0.421456, 0.6665131, -0.2710572, 0, 1, 0.05882353, 1,
-0.4208602, -0.2230476, -0.7878263, 0, 1, 0.0627451, 1,
-0.4206827, 0.6804864, -1.863576, 0, 1, 0.07058824, 1,
-0.4203991, 0.02946171, -1.693831, 0, 1, 0.07450981, 1,
-0.4188917, 0.4118367, -0.6220145, 0, 1, 0.08235294, 1,
-0.4174618, 0.310796, -1.320569, 0, 1, 0.08627451, 1,
-0.4125314, -1.45443, -2.444555, 0, 1, 0.09411765, 1,
-0.4086799, -0.7324549, -3.291937, 0, 1, 0.1019608, 1,
-0.4083918, -2.165789, -4.720659, 0, 1, 0.1058824, 1,
-0.4028126, -0.2475923, -2.112691, 0, 1, 0.1137255, 1,
-0.401505, -0.5159888, -2.482909, 0, 1, 0.1176471, 1,
-0.3943909, 1.060738, -1.140784, 0, 1, 0.1254902, 1,
-0.3920636, 0.5055416, -0.8930268, 0, 1, 0.1294118, 1,
-0.3871406, 2.169881, -0.3928916, 0, 1, 0.1372549, 1,
-0.3857806, 1.772748, 1.420839, 0, 1, 0.1411765, 1,
-0.38497, -0.5611821, -3.751963, 0, 1, 0.1490196, 1,
-0.3814746, -1.677849, -3.323991, 0, 1, 0.1529412, 1,
-0.3809357, -0.3898269, -2.430892, 0, 1, 0.1607843, 1,
-0.380686, -0.4220227, -3.827556, 0, 1, 0.1647059, 1,
-0.3777278, 2.639393, -1.291291, 0, 1, 0.172549, 1,
-0.376123, -0.4080566, -1.2226, 0, 1, 0.1764706, 1,
-0.3721492, -0.08464485, 0.4033422, 0, 1, 0.1843137, 1,
-0.3693828, 0.01092258, -3.5364, 0, 1, 0.1882353, 1,
-0.3693001, -0.01356932, -1.080949, 0, 1, 0.1960784, 1,
-0.3685231, 0.5704275, 0.1444582, 0, 1, 0.2039216, 1,
-0.3599103, -1.031845, -1.860152, 0, 1, 0.2078431, 1,
-0.3568621, 0.6978772, 0.6746258, 0, 1, 0.2156863, 1,
-0.3565247, -0.6612368, -1.447167, 0, 1, 0.2196078, 1,
-0.348752, -1.559142, -2.243417, 0, 1, 0.227451, 1,
-0.3479209, -0.06228794, 0.3519694, 0, 1, 0.2313726, 1,
-0.3391008, -1.454654, -2.874283, 0, 1, 0.2392157, 1,
-0.3315855, -0.3667879, -1.96171, 0, 1, 0.2431373, 1,
-0.3304223, 0.109571, 0.3007546, 0, 1, 0.2509804, 1,
-0.3286895, -1.775244, -1.809916, 0, 1, 0.254902, 1,
-0.3270882, -1.37121, -2.611244, 0, 1, 0.2627451, 1,
-0.3257824, -2.562344, -2.105565, 0, 1, 0.2666667, 1,
-0.3250565, 0.4853975, -1.43485, 0, 1, 0.2745098, 1,
-0.3227771, -0.2567427, -0.4251969, 0, 1, 0.2784314, 1,
-0.3222174, -0.2810039, -2.655013, 0, 1, 0.2862745, 1,
-0.3211237, -0.8227275, -3.694557, 0, 1, 0.2901961, 1,
-0.3210875, 0.9486017, 0.5152435, 0, 1, 0.2980392, 1,
-0.3158174, -0.6390171, -2.758591, 0, 1, 0.3058824, 1,
-0.3110052, 0.6072183, 0.04010598, 0, 1, 0.3098039, 1,
-0.3048803, 0.1643278, -1.383724, 0, 1, 0.3176471, 1,
-0.302372, 0.8630659, 0.07950309, 0, 1, 0.3215686, 1,
-0.3001029, -0.3276611, -1.912051, 0, 1, 0.3294118, 1,
-0.2938712, 1.071963, 0.0565192, 0, 1, 0.3333333, 1,
-0.29273, 0.5480328, 0.7328297, 0, 1, 0.3411765, 1,
-0.2919595, -2.490125, -3.254128, 0, 1, 0.345098, 1,
-0.2886938, 2.416459, 0.7503816, 0, 1, 0.3529412, 1,
-0.287858, -0.7226388, -4.05898, 0, 1, 0.3568628, 1,
-0.2847043, -0.7956272, -3.877603, 0, 1, 0.3647059, 1,
-0.2835068, -0.8427092, -2.493224, 0, 1, 0.3686275, 1,
-0.2807094, -0.01300532, 0.06643693, 0, 1, 0.3764706, 1,
-0.2758508, 1.356291, -1.136619, 0, 1, 0.3803922, 1,
-0.2751269, 0.9301503, -0.3423837, 0, 1, 0.3882353, 1,
-0.2735515, -0.970958, -4.48141, 0, 1, 0.3921569, 1,
-0.2718765, -0.08094344, -0.5994577, 0, 1, 0.4, 1,
-0.2713105, -0.2244485, -2.577242, 0, 1, 0.4078431, 1,
-0.269727, -0.1233076, -0.0996149, 0, 1, 0.4117647, 1,
-0.2640975, 0.3610881, -0.3888586, 0, 1, 0.4196078, 1,
-0.2627997, -1.445924, -4.057775, 0, 1, 0.4235294, 1,
-0.262172, -1.181885, -3.653872, 0, 1, 0.4313726, 1,
-0.2610877, 0.03363064, -2.359584, 0, 1, 0.4352941, 1,
-0.260425, -2.014171, -3.074449, 0, 1, 0.4431373, 1,
-0.259451, 0.9213877, -2.360738, 0, 1, 0.4470588, 1,
-0.2549821, -0.09094388, -1.723091, 0, 1, 0.454902, 1,
-0.2468451, -0.7616056, -1.711434, 0, 1, 0.4588235, 1,
-0.2465231, -1.175582, -2.79685, 0, 1, 0.4666667, 1,
-0.2430766, 1.749479, -1.430969, 0, 1, 0.4705882, 1,
-0.2395572, 0.697085, 0.1128818, 0, 1, 0.4784314, 1,
-0.2363521, -1.291243, -2.060978, 0, 1, 0.4823529, 1,
-0.2321415, 1.649875, -0.5589067, 0, 1, 0.4901961, 1,
-0.2297536, 0.8204105, -0.9243096, 0, 1, 0.4941176, 1,
-0.2260871, -1.038543, -1.947727, 0, 1, 0.5019608, 1,
-0.2225906, -0.7374086, -2.513054, 0, 1, 0.509804, 1,
-0.2194289, 2.114998, -0.8360383, 0, 1, 0.5137255, 1,
-0.2171961, -0.8766041, -0.1088784, 0, 1, 0.5215687, 1,
-0.2159053, 1.377084, 1.753641, 0, 1, 0.5254902, 1,
-0.2146925, -0.8919927, -4.348409, 0, 1, 0.5333334, 1,
-0.2131217, 0.06617073, -1.097431, 0, 1, 0.5372549, 1,
-0.2119605, -0.9449694, -4.54718, 0, 1, 0.5450981, 1,
-0.2073374, -1.323015, -1.768447, 0, 1, 0.5490196, 1,
-0.2041693, 1.18351, 0.641241, 0, 1, 0.5568628, 1,
-0.202128, 0.2442396, 0.05343008, 0, 1, 0.5607843, 1,
-0.2009683, 0.6327129, -0.5262356, 0, 1, 0.5686275, 1,
-0.1978964, 1.183696, 0.7211529, 0, 1, 0.572549, 1,
-0.1966364, 0.9307438, 0.9916621, 0, 1, 0.5803922, 1,
-0.1937637, -0.9037595, -3.703578, 0, 1, 0.5843138, 1,
-0.1935437, 0.8328972, 0.4816268, 0, 1, 0.5921569, 1,
-0.1930135, -0.4868948, -2.276685, 0, 1, 0.5960785, 1,
-0.1920522, 0.6130481, -0.4354183, 0, 1, 0.6039216, 1,
-0.1866904, 1.808104, -1.69235, 0, 1, 0.6117647, 1,
-0.1841652, 1.20247, -0.6624433, 0, 1, 0.6156863, 1,
-0.1834608, -1.47225, -2.095197, 0, 1, 0.6235294, 1,
-0.1826429, -2.206214, -2.96943, 0, 1, 0.627451, 1,
-0.1813144, 0.5139376, -0.8180164, 0, 1, 0.6352941, 1,
-0.1793748, 1.068072, -0.6848662, 0, 1, 0.6392157, 1,
-0.1787535, 0.8136051, -0.5709311, 0, 1, 0.6470588, 1,
-0.1758887, -1.030556, -0.981885, 0, 1, 0.6509804, 1,
-0.1734911, 1.008891, -1.101954, 0, 1, 0.6588235, 1,
-0.1679923, 1.394196, 0.2452291, 0, 1, 0.6627451, 1,
-0.1670674, -1.011063, -3.814049, 0, 1, 0.6705883, 1,
-0.1662717, -0.1237369, -2.708928, 0, 1, 0.6745098, 1,
-0.1638106, 0.05139026, 0.7351491, 0, 1, 0.682353, 1,
-0.1612118, 1.07707, 0.5686592, 0, 1, 0.6862745, 1,
-0.1583986, -0.2601318, -2.884181, 0, 1, 0.6941177, 1,
-0.1551853, 1.153077, -0.6198184, 0, 1, 0.7019608, 1,
-0.1548636, -0.1049434, -1.025115, 0, 1, 0.7058824, 1,
-0.1537445, -1.658194, -4.309259, 0, 1, 0.7137255, 1,
-0.1460788, -0.7319853, -2.970694, 0, 1, 0.7176471, 1,
-0.1442636, -0.9703305, -3.794097, 0, 1, 0.7254902, 1,
-0.1418363, -1.310245, -3.09441, 0, 1, 0.7294118, 1,
-0.1373366, -0.8759443, -5.147121, 0, 1, 0.7372549, 1,
-0.1320368, 0.3214183, 0.03151822, 0, 1, 0.7411765, 1,
-0.1282727, -1.000163, -4.412476, 0, 1, 0.7490196, 1,
-0.1277439, 0.5517048, -0.9155033, 0, 1, 0.7529412, 1,
-0.1276902, 0.1463769, -0.03395482, 0, 1, 0.7607843, 1,
-0.1222351, -0.5571054, -3.258428, 0, 1, 0.7647059, 1,
-0.1195199, 1.514577, -1.13905, 0, 1, 0.772549, 1,
-0.1186593, -0.1053011, -1.614795, 0, 1, 0.7764706, 1,
-0.1182302, -1.610353, -2.29049, 0, 1, 0.7843137, 1,
-0.1142944, 0.510497, 0.4913915, 0, 1, 0.7882353, 1,
-0.1137799, -0.4095942, -3.704778, 0, 1, 0.7960784, 1,
-0.1132002, 0.073557, 0.1670034, 0, 1, 0.8039216, 1,
-0.1050645, -0.4173476, -3.954289, 0, 1, 0.8078431, 1,
-0.1027769, 0.08822225, -0.7655025, 0, 1, 0.8156863, 1,
-0.1008438, -1.417445, -3.383001, 0, 1, 0.8196079, 1,
-0.09978093, -0.09348107, -0.97666, 0, 1, 0.827451, 1,
-0.09694454, 0.1561162, -0.9330306, 0, 1, 0.8313726, 1,
-0.08956885, -1.060369, -4.330362, 0, 1, 0.8392157, 1,
-0.08740342, -0.003590038, -2.437111, 0, 1, 0.8431373, 1,
-0.08013387, -1.677648, -2.74058, 0, 1, 0.8509804, 1,
-0.07736428, 1.574831, 0.5989401, 0, 1, 0.854902, 1,
-0.07686599, 0.2000235, -0.5146275, 0, 1, 0.8627451, 1,
-0.07286482, 1.094153, -1.52011, 0, 1, 0.8666667, 1,
-0.07262313, -0.00823772, -1.797914, 0, 1, 0.8745098, 1,
-0.05954296, -0.8321804, -3.414616, 0, 1, 0.8784314, 1,
-0.05907751, 0.5815131, -0.3185503, 0, 1, 0.8862745, 1,
-0.05837611, 1.085966, -1.877492, 0, 1, 0.8901961, 1,
-0.05675019, 2.027936, -0.5128894, 0, 1, 0.8980392, 1,
-0.05572928, -0.4990857, -2.797213, 0, 1, 0.9058824, 1,
-0.05463875, 0.7229065, -0.4027256, 0, 1, 0.9098039, 1,
-0.05135639, 0.6547937, 0.8155781, 0, 1, 0.9176471, 1,
-0.05065911, -1.940592, -3.867004, 0, 1, 0.9215686, 1,
-0.05005051, -1.127335, -3.10887, 0, 1, 0.9294118, 1,
-0.04691128, -0.05119656, -2.908875, 0, 1, 0.9333333, 1,
-0.04669888, -2.389168, -3.410629, 0, 1, 0.9411765, 1,
-0.04551428, 1.140619, 0.3729942, 0, 1, 0.945098, 1,
-0.04273349, -0.7678035, -3.062561, 0, 1, 0.9529412, 1,
-0.04210245, 1.374972, -0.3657338, 0, 1, 0.9568627, 1,
-0.03893607, 0.2187625, -0.5925654, 0, 1, 0.9647059, 1,
-0.0350077, 1.355337, 0.03736307, 0, 1, 0.9686275, 1,
-0.02617133, -0.1261809, -2.921837, 0, 1, 0.9764706, 1,
-0.02416162, 0.1312732, -1.5625, 0, 1, 0.9803922, 1,
-0.02407476, -0.7641367, -3.784382, 0, 1, 0.9882353, 1,
-0.0238286, 0.1432367, 0.716997, 0, 1, 0.9921569, 1,
-0.02276342, 0.8703424, -0.374257, 0, 1, 1, 1,
-0.01717225, -0.05566457, -3.203902, 0, 0.9921569, 1, 1,
-0.009008832, 0.6453142, -0.1193261, 0, 0.9882353, 1, 1,
-0.00852587, -0.1012494, -4.646616, 0, 0.9803922, 1, 1,
-0.007505191, 0.8642095, 2.714515, 0, 0.9764706, 1, 1,
-0.001736616, 0.9167146, 0.7743928, 0, 0.9686275, 1, 1,
-0.0009370871, -1.143527, -2.169425, 0, 0.9647059, 1, 1,
0.001652851, -0.3982017, 4.997238, 0, 0.9568627, 1, 1,
0.003009081, 1.125154, -0.04032593, 0, 0.9529412, 1, 1,
0.006296586, 0.6895368, 0.4058572, 0, 0.945098, 1, 1,
0.008592125, 0.8899415, -1.60176, 0, 0.9411765, 1, 1,
0.01101051, 1.549938, -0.3603451, 0, 0.9333333, 1, 1,
0.01103617, 0.4482448, -0.4342882, 0, 0.9294118, 1, 1,
0.01166211, -0.6337184, 2.461062, 0, 0.9215686, 1, 1,
0.01487416, 0.7448018, 0.009516211, 0, 0.9176471, 1, 1,
0.01969137, -0.0843666, 4.436726, 0, 0.9098039, 1, 1,
0.02481887, -0.4362838, 3.467916, 0, 0.9058824, 1, 1,
0.02586994, -1.44482, 2.344717, 0, 0.8980392, 1, 1,
0.02663171, 0.33406, 0.3661683, 0, 0.8901961, 1, 1,
0.02908783, -0.4417996, 3.759168, 0, 0.8862745, 1, 1,
0.02949655, -0.8277243, 2.981798, 0, 0.8784314, 1, 1,
0.03014421, 1.094398, 0.578103, 0, 0.8745098, 1, 1,
0.0308728, -0.3044742, 2.776223, 0, 0.8666667, 1, 1,
0.03296672, -0.8948778, 5.162117, 0, 0.8627451, 1, 1,
0.03921537, -0.677384, 3.509127, 0, 0.854902, 1, 1,
0.04140878, 0.00634575, 1.003009, 0, 0.8509804, 1, 1,
0.04704343, -0.2632836, 3.211106, 0, 0.8431373, 1, 1,
0.04759461, 0.3630485, -1.456301, 0, 0.8392157, 1, 1,
0.0513436, 2.079636, 0.4482861, 0, 0.8313726, 1, 1,
0.05279616, -0.7232414, 3.826338, 0, 0.827451, 1, 1,
0.0584608, -0.3024843, 2.92067, 0, 0.8196079, 1, 1,
0.06291186, -1.130624, 3.574646, 0, 0.8156863, 1, 1,
0.06736349, 1.07475, 0.6468998, 0, 0.8078431, 1, 1,
0.06892714, 0.8591213, -0.2911252, 0, 0.8039216, 1, 1,
0.06953422, -0.4939293, 2.64017, 0, 0.7960784, 1, 1,
0.07077064, -0.5780835, 2.83528, 0, 0.7882353, 1, 1,
0.0710255, 0.8794836, 0.6081395, 0, 0.7843137, 1, 1,
0.07648253, 0.9282975, 1.500938, 0, 0.7764706, 1, 1,
0.07704999, 0.4377455, -0.3630801, 0, 0.772549, 1, 1,
0.08369148, 1.173722, -0.7815531, 0, 0.7647059, 1, 1,
0.08413162, 1.663564, -0.4406908, 0, 0.7607843, 1, 1,
0.08474506, -0.7699088, 2.007421, 0, 0.7529412, 1, 1,
0.0880839, 1.526772, 1.044338, 0, 0.7490196, 1, 1,
0.09001729, 0.7295773, 0.9107576, 0, 0.7411765, 1, 1,
0.0937513, -2.270981, 3.536798, 0, 0.7372549, 1, 1,
0.09400278, -0.07525917, 1.853869, 0, 0.7294118, 1, 1,
0.09476146, 0.3278283, -1.288583, 0, 0.7254902, 1, 1,
0.1003694, -0.6389404, 2.754103, 0, 0.7176471, 1, 1,
0.1016044, -0.3217557, 1.843325, 0, 0.7137255, 1, 1,
0.1039567, 0.2640001, 1.209204, 0, 0.7058824, 1, 1,
0.1081878, 0.7947886, 0.3778017, 0, 0.6980392, 1, 1,
0.1109149, -0.5654942, 3.540303, 0, 0.6941177, 1, 1,
0.1178146, -1.54755, 2.77396, 0, 0.6862745, 1, 1,
0.1256559, -0.5040342, 1.1254, 0, 0.682353, 1, 1,
0.1260708, 1.093605, 1.72595, 0, 0.6745098, 1, 1,
0.1286966, -1.703141, 4.568619, 0, 0.6705883, 1, 1,
0.1331766, -0.8892461, 2.225642, 0, 0.6627451, 1, 1,
0.1361239, 0.4895599, 1.832214, 0, 0.6588235, 1, 1,
0.1371663, -1.304703, 1.583893, 0, 0.6509804, 1, 1,
0.1454425, 0.5689953, -0.1891626, 0, 0.6470588, 1, 1,
0.1481775, 1.134182, -1.500156, 0, 0.6392157, 1, 1,
0.1489777, 1.717404, 0.1164595, 0, 0.6352941, 1, 1,
0.1529224, 0.9344847, -0.5241014, 0, 0.627451, 1, 1,
0.1548427, -0.3026038, 1.679434, 0, 0.6235294, 1, 1,
0.161858, 0.2985379, 0.1735888, 0, 0.6156863, 1, 1,
0.164603, -1.1402, 3.533998, 0, 0.6117647, 1, 1,
0.1648677, -0.8450274, 2.419447, 0, 0.6039216, 1, 1,
0.1673687, 0.8089913, 0.9083456, 0, 0.5960785, 1, 1,
0.1698346, -0.3398174, 1.857573, 0, 0.5921569, 1, 1,
0.1705841, 0.9891169, 0.690389, 0, 0.5843138, 1, 1,
0.1707509, -0.5948732, 4.341221, 0, 0.5803922, 1, 1,
0.1726195, 1.077158, -0.3356152, 0, 0.572549, 1, 1,
0.1739366, -0.4147345, 2.296588, 0, 0.5686275, 1, 1,
0.174066, -0.3613524, 4.822222, 0, 0.5607843, 1, 1,
0.1748347, 1.066762, -0.0860298, 0, 0.5568628, 1, 1,
0.175147, 0.3035433, -0.1026348, 0, 0.5490196, 1, 1,
0.1807158, 0.1916652, -0.4043118, 0, 0.5450981, 1, 1,
0.1882031, 0.849115, -0.2089608, 0, 0.5372549, 1, 1,
0.1920716, 0.7966082, 2.740494, 0, 0.5333334, 1, 1,
0.1977869, -0.2417123, 1.925925, 0, 0.5254902, 1, 1,
0.1985962, 2.824584, 0.1125552, 0, 0.5215687, 1, 1,
0.1993861, 0.6024975, -0.8033752, 0, 0.5137255, 1, 1,
0.2015796, -0.2548547, 2.969307, 0, 0.509804, 1, 1,
0.2027279, -0.09755906, 1.760373, 0, 0.5019608, 1, 1,
0.2033218, 0.6450123, 2.147571, 0, 0.4941176, 1, 1,
0.2034996, 0.003108404, 1.195157, 0, 0.4901961, 1, 1,
0.2053391, 0.9257888, -0.3654116, 0, 0.4823529, 1, 1,
0.2106256, -0.5189756, 2.92109, 0, 0.4784314, 1, 1,
0.2116719, 0.7680382, -1.673973, 0, 0.4705882, 1, 1,
0.2141889, 2.586489, -0.2988136, 0, 0.4666667, 1, 1,
0.2235901, -0.2622517, 5.870767, 0, 0.4588235, 1, 1,
0.2249674, 1.250764, 0.6530916, 0, 0.454902, 1, 1,
0.2278039, 0.2391432, -0.7249307, 0, 0.4470588, 1, 1,
0.2284071, -0.5283668, 1.519768, 0, 0.4431373, 1, 1,
0.230858, 0.7124914, 0.3052983, 0, 0.4352941, 1, 1,
0.2332644, 1.157152, 0.6815583, 0, 0.4313726, 1, 1,
0.2335721, 2.1843, -0.061563, 0, 0.4235294, 1, 1,
0.2372253, 1.784355, 0.6874501, 0, 0.4196078, 1, 1,
0.2384935, 0.7895394, -0.4980002, 0, 0.4117647, 1, 1,
0.2405479, 0.1307179, 0.1033071, 0, 0.4078431, 1, 1,
0.2415372, 0.3483098, 3.856359, 0, 0.4, 1, 1,
0.24179, -1.350327, 3.541746, 0, 0.3921569, 1, 1,
0.242171, 0.7126124, 0.2087353, 0, 0.3882353, 1, 1,
0.246348, 0.2427883, -0.2303713, 0, 0.3803922, 1, 1,
0.2480526, 0.1350047, -0.2122409, 0, 0.3764706, 1, 1,
0.2505552, 0.8721913, 0.5059534, 0, 0.3686275, 1, 1,
0.25107, -0.2715494, 1.51741, 0, 0.3647059, 1, 1,
0.253539, 0.4815499, 1.746156, 0, 0.3568628, 1, 1,
0.2544048, 2.127779, 2.558056, 0, 0.3529412, 1, 1,
0.2561623, 1.059487, 1.63153, 0, 0.345098, 1, 1,
0.2561842, -0.8145608, 1.991328, 0, 0.3411765, 1, 1,
0.2597643, -0.6900524, 3.214854, 0, 0.3333333, 1, 1,
0.2618561, -0.3257129, 2.688951, 0, 0.3294118, 1, 1,
0.2694215, -1.273235, 3.263446, 0, 0.3215686, 1, 1,
0.2705314, -0.9030319, 3.435272, 0, 0.3176471, 1, 1,
0.2711313, 0.2613404, 0.3783541, 0, 0.3098039, 1, 1,
0.27123, -0.6265645, 2.61995, 0, 0.3058824, 1, 1,
0.2767468, -0.6168994, 0.8038291, 0, 0.2980392, 1, 1,
0.279306, 1.038193, -0.7385037, 0, 0.2901961, 1, 1,
0.2842664, -0.3249112, 2.982559, 0, 0.2862745, 1, 1,
0.2850828, 0.665942, 0.3575429, 0, 0.2784314, 1, 1,
0.2863981, 0.3580041, 0.2177894, 0, 0.2745098, 1, 1,
0.2908573, -0.2923634, 2.171298, 0, 0.2666667, 1, 1,
0.294212, 1.771602, -1.814656, 0, 0.2627451, 1, 1,
0.2945921, 1.684147, -1.144318, 0, 0.254902, 1, 1,
0.2988258, 0.7691295, 1.73919, 0, 0.2509804, 1, 1,
0.3009751, 0.7583716, 0.5722547, 0, 0.2431373, 1, 1,
0.3031177, 0.7156042, -0.6806211, 0, 0.2392157, 1, 1,
0.3038826, 0.547368, -0.4340094, 0, 0.2313726, 1, 1,
0.3063504, 2.241639, 0.2479076, 0, 0.227451, 1, 1,
0.3091902, 0.4173901, -0.3340302, 0, 0.2196078, 1, 1,
0.3109221, -1.34597, 3.017234, 0, 0.2156863, 1, 1,
0.3115565, -1.70839, 1.897475, 0, 0.2078431, 1, 1,
0.3126434, -0.7306671, 0.3244267, 0, 0.2039216, 1, 1,
0.3150872, 0.8176287, -1.050435, 0, 0.1960784, 1, 1,
0.3160213, -0.6053267, 3.272882, 0, 0.1882353, 1, 1,
0.3183551, 0.7415377, -0.5115604, 0, 0.1843137, 1, 1,
0.3190481, -0.3539339, 3.246453, 0, 0.1764706, 1, 1,
0.3197421, -0.8640988, -0.1285709, 0, 0.172549, 1, 1,
0.3198155, 0.6473015, 0.7076926, 0, 0.1647059, 1, 1,
0.3218452, 1.125073, 0.9558725, 0, 0.1607843, 1, 1,
0.3221161, 0.6301297, -0.1080552, 0, 0.1529412, 1, 1,
0.3241185, 0.1302543, 2.598579, 0, 0.1490196, 1, 1,
0.3289696, 0.3609029, 0.4362898, 0, 0.1411765, 1, 1,
0.3312534, -0.8743965, 4.901487, 0, 0.1372549, 1, 1,
0.3319502, -0.8079852, 2.833443, 0, 0.1294118, 1, 1,
0.3341592, 0.311392, 2.129425, 0, 0.1254902, 1, 1,
0.3351084, -0.01826048, 2.217649, 0, 0.1176471, 1, 1,
0.337986, -0.1222561, 2.637964, 0, 0.1137255, 1, 1,
0.3390928, -0.3809468, 2.142642, 0, 0.1058824, 1, 1,
0.3420469, 0.04082886, 2.119396, 0, 0.09803922, 1, 1,
0.3453152, -0.8049313, 1.391003, 0, 0.09411765, 1, 1,
0.3502256, -0.2238238, 2.72216, 0, 0.08627451, 1, 1,
0.3540666, 1.245069, 0.7374326, 0, 0.08235294, 1, 1,
0.3545885, 1.141729, 2.173911, 0, 0.07450981, 1, 1,
0.3566911, -1.289168, 2.340047, 0, 0.07058824, 1, 1,
0.3596232, 0.4994597, -0.7330211, 0, 0.0627451, 1, 1,
0.3599201, 2.280221, 0.8916144, 0, 0.05882353, 1, 1,
0.3615386, 0.3091437, 2.492411, 0, 0.05098039, 1, 1,
0.3752343, -0.6854563, 2.627753, 0, 0.04705882, 1, 1,
0.3770082, -1.532744, 3.619773, 0, 0.03921569, 1, 1,
0.3846872, -0.5133555, 2.572569, 0, 0.03529412, 1, 1,
0.3860277, 2.358084, 0.422163, 0, 0.02745098, 1, 1,
0.3863412, -0.2034539, 3.94607, 0, 0.02352941, 1, 1,
0.3887994, -1.228528, 2.384241, 0, 0.01568628, 1, 1,
0.3978937, 0.3241442, -0.796451, 0, 0.01176471, 1, 1,
0.3994073, -0.3630456, 2.566835, 0, 0.003921569, 1, 1,
0.4009767, 0.6229459, 0.4722029, 0.003921569, 0, 1, 1,
0.4077525, 0.4493524, -0.6538838, 0.007843138, 0, 1, 1,
0.408035, -0.7043132, 2.592464, 0.01568628, 0, 1, 1,
0.4098811, -0.4312344, -0.003728409, 0.01960784, 0, 1, 1,
0.4102038, 1.87497, -2.003335, 0.02745098, 0, 1, 1,
0.413067, -0.04623628, 1.151274, 0.03137255, 0, 1, 1,
0.4138175, -0.2902406, 2.345936, 0.03921569, 0, 1, 1,
0.4148336, 0.5654274, 0.865867, 0.04313726, 0, 1, 1,
0.4160782, -0.01863673, 0.4744008, 0.05098039, 0, 1, 1,
0.4161647, 1.408153, -0.1155422, 0.05490196, 0, 1, 1,
0.4217505, 1.237783, 0.04642667, 0.0627451, 0, 1, 1,
0.4239622, -0.1506484, 1.364727, 0.06666667, 0, 1, 1,
0.4347821, 0.8925784, 0.7396266, 0.07450981, 0, 1, 1,
0.4457121, -0.6039616, 1.081034, 0.07843138, 0, 1, 1,
0.4470011, 0.1835406, 0.8591115, 0.08627451, 0, 1, 1,
0.4474524, -0.3889184, 1.386957, 0.09019608, 0, 1, 1,
0.4487328, -1.558584, 1.85479, 0.09803922, 0, 1, 1,
0.4555844, -0.5018551, 2.154613, 0.1058824, 0, 1, 1,
0.4576631, 0.3319335, 0.2170268, 0.1098039, 0, 1, 1,
0.4578435, 0.08726379, 2.011267, 0.1176471, 0, 1, 1,
0.4595916, 0.4077602, 1.186901, 0.1215686, 0, 1, 1,
0.4669086, 0.9341952, 1.674421, 0.1294118, 0, 1, 1,
0.4692747, 1.178396, 2.515434, 0.1333333, 0, 1, 1,
0.4708372, 1.015896, -0.6744697, 0.1411765, 0, 1, 1,
0.4742126, 0.4988295, -0.2129623, 0.145098, 0, 1, 1,
0.4756791, -0.5495316, 0.8011026, 0.1529412, 0, 1, 1,
0.477437, 0.5380271, 0.1149183, 0.1568628, 0, 1, 1,
0.4818018, -0.8025345, 2.268672, 0.1647059, 0, 1, 1,
0.4818317, 2.582118, 0.4335257, 0.1686275, 0, 1, 1,
0.4950418, 0.4045395, 2.018392, 0.1764706, 0, 1, 1,
0.4957678, -0.4408537, 2.704604, 0.1803922, 0, 1, 1,
0.4982377, -1.336536, 3.379385, 0.1882353, 0, 1, 1,
0.4989238, 0.3662359, 0.1822028, 0.1921569, 0, 1, 1,
0.4998242, -0.9903086, 2.648888, 0.2, 0, 1, 1,
0.4998569, -0.494089, 4.345136, 0.2078431, 0, 1, 1,
0.507916, 1.124025, -0.1864113, 0.2117647, 0, 1, 1,
0.5106526, -0.8546339, 3.621214, 0.2196078, 0, 1, 1,
0.5153828, -1.789502, 1.997416, 0.2235294, 0, 1, 1,
0.5164518, -1.11689, 3.920023, 0.2313726, 0, 1, 1,
0.5184796, 0.1302183, 1.661332, 0.2352941, 0, 1, 1,
0.5209446, -0.3472448, 1.198972, 0.2431373, 0, 1, 1,
0.5247238, 1.740368, 0.6792806, 0.2470588, 0, 1, 1,
0.5275412, 1.572311, 0.1964696, 0.254902, 0, 1, 1,
0.5293121, 1.876756, -0.1836234, 0.2588235, 0, 1, 1,
0.5311624, -0.2896294, 3.530528, 0.2666667, 0, 1, 1,
0.5356049, 1.1203, 1.724571, 0.2705882, 0, 1, 1,
0.5396204, 0.2253815, 0.7978528, 0.2784314, 0, 1, 1,
0.5406983, -0.7665991, 1.746061, 0.282353, 0, 1, 1,
0.5415182, -0.1355217, 0.2641559, 0.2901961, 0, 1, 1,
0.5433682, 0.9230896, 0.6467741, 0.2941177, 0, 1, 1,
0.5443529, -0.7099682, 4.32403, 0.3019608, 0, 1, 1,
0.5452099, -0.5668421, 1.054883, 0.3098039, 0, 1, 1,
0.5481466, 0.4223121, -0.4804281, 0.3137255, 0, 1, 1,
0.5488457, -1.258841, 2.631691, 0.3215686, 0, 1, 1,
0.5546954, -1.689321, 4.185097, 0.3254902, 0, 1, 1,
0.5551163, -1.267905, 2.931208, 0.3333333, 0, 1, 1,
0.5561125, -1.016118, 1.062359, 0.3372549, 0, 1, 1,
0.5566375, -1.777388, 4.122933, 0.345098, 0, 1, 1,
0.5568243, 0.1407207, 1.629735, 0.3490196, 0, 1, 1,
0.5575834, -1.874431, 1.307247, 0.3568628, 0, 1, 1,
0.563782, -0.9720035, 3.097758, 0.3607843, 0, 1, 1,
0.5685394, -0.9325757, 3.087455, 0.3686275, 0, 1, 1,
0.5705206, -1.545141, 2.555367, 0.372549, 0, 1, 1,
0.5764273, -1.45468, 2.913989, 0.3803922, 0, 1, 1,
0.5766069, 0.9748709, 0.4730526, 0.3843137, 0, 1, 1,
0.5775492, -1.285397, 4.249084, 0.3921569, 0, 1, 1,
0.5809686, -0.7656559, 2.055326, 0.3960784, 0, 1, 1,
0.587521, -1.290138, 2.364823, 0.4039216, 0, 1, 1,
0.5894301, -0.911841, 1.19509, 0.4117647, 0, 1, 1,
0.5914031, 0.4444956, 0.7520954, 0.4156863, 0, 1, 1,
0.5939087, 1.664677, 1.268256, 0.4235294, 0, 1, 1,
0.5998823, 0.9335039, 0.4372876, 0.427451, 0, 1, 1,
0.601182, -1.221593, 2.940104, 0.4352941, 0, 1, 1,
0.6044936, 1.1951, 0.39122, 0.4392157, 0, 1, 1,
0.6073267, -1.396852, 3.951299, 0.4470588, 0, 1, 1,
0.6084522, -0.7565365, 1.802308, 0.4509804, 0, 1, 1,
0.6110998, 0.1233058, 1.68004, 0.4588235, 0, 1, 1,
0.613196, 0.4543206, -0.1120611, 0.4627451, 0, 1, 1,
0.6151692, 0.4471507, 0.8249826, 0.4705882, 0, 1, 1,
0.6184968, 1.439186, 0.762586, 0.4745098, 0, 1, 1,
0.6207483, -0.4657284, 2.760794, 0.4823529, 0, 1, 1,
0.6228269, 1.442581, 0.4513516, 0.4862745, 0, 1, 1,
0.6235784, -0.7206558, 2.854677, 0.4941176, 0, 1, 1,
0.6246178, -0.04501329, 0.2043941, 0.5019608, 0, 1, 1,
0.6307026, -1.396419, 3.40147, 0.5058824, 0, 1, 1,
0.63135, 0.0247358, 2.801826, 0.5137255, 0, 1, 1,
0.6322068, 0.3107135, -0.1761303, 0.5176471, 0, 1, 1,
0.6329206, -0.6281701, 1.815306, 0.5254902, 0, 1, 1,
0.6392313, 0.8005517, -1.574518, 0.5294118, 0, 1, 1,
0.6424977, 0.1019789, 1.626509, 0.5372549, 0, 1, 1,
0.6430299, 0.2682175, 1.502441, 0.5411765, 0, 1, 1,
0.6446377, -0.1831313, 2.458483, 0.5490196, 0, 1, 1,
0.6559148, -0.3593507, 3.054846, 0.5529412, 0, 1, 1,
0.6559861, 1.866552, 0.4077405, 0.5607843, 0, 1, 1,
0.656163, -0.7240774, 1.801006, 0.5647059, 0, 1, 1,
0.6602973, -1.329248, 1.18818, 0.572549, 0, 1, 1,
0.6617712, -0.03074742, 2.438283, 0.5764706, 0, 1, 1,
0.6621556, -1.547764, 3.991733, 0.5843138, 0, 1, 1,
0.6645633, 0.3269597, 0.7357218, 0.5882353, 0, 1, 1,
0.6685737, 0.07288201, 1.652385, 0.5960785, 0, 1, 1,
0.6744806, 0.5236712, -0.4298034, 0.6039216, 0, 1, 1,
0.6746571, -1.766313, 2.051655, 0.6078432, 0, 1, 1,
0.6802948, 0.5395542, 1.40574, 0.6156863, 0, 1, 1,
0.681924, 0.1261328, 0.2953801, 0.6196079, 0, 1, 1,
0.6822655, -1.034036, 2.698067, 0.627451, 0, 1, 1,
0.685007, 0.4794788, 1.001324, 0.6313726, 0, 1, 1,
0.6892899, 0.250893, 0.8222942, 0.6392157, 0, 1, 1,
0.6897193, 0.08022188, 1.915844, 0.6431373, 0, 1, 1,
0.6931586, -1.52774, 3.600189, 0.6509804, 0, 1, 1,
0.694348, -0.9217761, 1.26862, 0.654902, 0, 1, 1,
0.6996406, 0.2793073, 2.042083, 0.6627451, 0, 1, 1,
0.7032062, -1.76716, 3.902559, 0.6666667, 0, 1, 1,
0.7068639, -0.3443475, 1.655162, 0.6745098, 0, 1, 1,
0.7154249, 0.2395645, 1.877492, 0.6784314, 0, 1, 1,
0.7199677, -0.05829195, 0.214662, 0.6862745, 0, 1, 1,
0.7210735, 0.3807869, 0.3385612, 0.6901961, 0, 1, 1,
0.7296213, 0.7544641, 1.42367, 0.6980392, 0, 1, 1,
0.7309091, -0.5624395, 2.802801, 0.7058824, 0, 1, 1,
0.7312381, -1.360609, 2.106809, 0.7098039, 0, 1, 1,
0.7333195, 0.4750879, 2.220667, 0.7176471, 0, 1, 1,
0.7348821, -1.186747, 0.2607597, 0.7215686, 0, 1, 1,
0.7370586, -0.9545555, 0.7603314, 0.7294118, 0, 1, 1,
0.7413882, -1.10642, 2.768846, 0.7333333, 0, 1, 1,
0.7431785, 0.8318812, 0.6078157, 0.7411765, 0, 1, 1,
0.7437466, -2.023578, 2.101365, 0.7450981, 0, 1, 1,
0.7485192, -0.9373083, 3.862844, 0.7529412, 0, 1, 1,
0.7520246, -0.0711674, 2.228927, 0.7568628, 0, 1, 1,
0.7525781, 0.1235825, 0.415323, 0.7647059, 0, 1, 1,
0.7543741, 0.06935072, 1.465664, 0.7686275, 0, 1, 1,
0.7546978, -0.7663105, 1.497141, 0.7764706, 0, 1, 1,
0.7697926, 0.8296577, -0.8970283, 0.7803922, 0, 1, 1,
0.7699109, -1.176856, 1.056025, 0.7882353, 0, 1, 1,
0.7747428, -0.933452, 1.364762, 0.7921569, 0, 1, 1,
0.7802752, 0.5592501, 0.734719, 0.8, 0, 1, 1,
0.7852674, 1.586575, -0.3503481, 0.8078431, 0, 1, 1,
0.7859911, 0.1087861, 0.2807107, 0.8117647, 0, 1, 1,
0.7900204, 1.451751, 0.6631923, 0.8196079, 0, 1, 1,
0.7945895, 1.254404, -1.099508, 0.8235294, 0, 1, 1,
0.8004404, -0.3002273, 1.739873, 0.8313726, 0, 1, 1,
0.8007672, 1.21588, -0.6548086, 0.8352941, 0, 1, 1,
0.806636, -0.5564324, 2.869687, 0.8431373, 0, 1, 1,
0.8088893, 0.8037327, 0.303378, 0.8470588, 0, 1, 1,
0.8098231, -1.04742, 1.74102, 0.854902, 0, 1, 1,
0.8119195, 2.312582, -1.745607, 0.8588235, 0, 1, 1,
0.8120995, 1.185152, 0.9933664, 0.8666667, 0, 1, 1,
0.8140736, -0.06633427, 0.9365278, 0.8705882, 0, 1, 1,
0.8149063, 0.8569978, 1.00939, 0.8784314, 0, 1, 1,
0.8176166, 1.747353, 0.4839438, 0.8823529, 0, 1, 1,
0.8189099, -0.7461209, 0.6769277, 0.8901961, 0, 1, 1,
0.8323347, 0.477129, 0.5220369, 0.8941177, 0, 1, 1,
0.8326331, -0.1162241, 1.225006, 0.9019608, 0, 1, 1,
0.8326709, -0.9116148, 1.368865, 0.9098039, 0, 1, 1,
0.8450652, -0.4716668, 0.7745181, 0.9137255, 0, 1, 1,
0.8581458, 1.352895, 1.228024, 0.9215686, 0, 1, 1,
0.8581772, 0.2012534, 3.004586, 0.9254902, 0, 1, 1,
0.8656015, 1.730828, 1.670915, 0.9333333, 0, 1, 1,
0.8658997, -0.5766482, 2.948306, 0.9372549, 0, 1, 1,
0.8674888, 0.6290582, 0.5863913, 0.945098, 0, 1, 1,
0.8839761, -0.3867223, 1.374026, 0.9490196, 0, 1, 1,
0.8871682, -0.05623896, 1.475895, 0.9568627, 0, 1, 1,
0.8907561, 0.06048172, 1.664416, 0.9607843, 0, 1, 1,
0.8920287, -0.009671265, 1.033537, 0.9686275, 0, 1, 1,
0.8949652, 0.234967, 2.534469, 0.972549, 0, 1, 1,
0.89545, -0.7134062, 0.285067, 0.9803922, 0, 1, 1,
0.8956754, -0.05439508, 1.607643, 0.9843137, 0, 1, 1,
0.8994333, 0.2682776, -0.1342095, 0.9921569, 0, 1, 1,
0.8995104, -0.7754245, 3.871755, 0.9960784, 0, 1, 1,
0.9009899, 0.219702, -0.5394944, 1, 0, 0.9960784, 1,
0.9028349, 0.2730644, 2.285547, 1, 0, 0.9882353, 1,
0.908069, -0.8940927, 1.74242, 1, 0, 0.9843137, 1,
0.9164919, 0.4854872, 1.620958, 1, 0, 0.9764706, 1,
0.9204258, 0.3144241, 1.528016, 1, 0, 0.972549, 1,
0.923901, -0.8002462, 0.7284405, 1, 0, 0.9647059, 1,
0.9542792, 0.7928909, 1.910212, 1, 0, 0.9607843, 1,
0.957231, 0.2763966, 2.086023, 1, 0, 0.9529412, 1,
0.972017, 2.312081, 1.008279, 1, 0, 0.9490196, 1,
0.9748404, -1.616685, 3.199886, 1, 0, 0.9411765, 1,
0.9751018, -0.04970709, 1.48688, 1, 0, 0.9372549, 1,
0.9774164, -1.302091, 0.7235194, 1, 0, 0.9294118, 1,
0.9781392, 0.880033, 0.4627378, 1, 0, 0.9254902, 1,
0.9788557, -1.268572, 1.622758, 1, 0, 0.9176471, 1,
0.9796669, -0.5516011, 1.996073, 1, 0, 0.9137255, 1,
0.9871576, -2.24571, 1.897504, 1, 0, 0.9058824, 1,
0.9873443, -1.206661, 2.573259, 1, 0, 0.9019608, 1,
0.9918497, 0.07439628, 1.749336, 1, 0, 0.8941177, 1,
1.003891, 1.37922, -0.9998756, 1, 0, 0.8862745, 1,
1.011126, 0.06966625, 3.044544, 1, 0, 0.8823529, 1,
1.012015, 1.312677, -0.3242694, 1, 0, 0.8745098, 1,
1.016551, -0.8958511, 3.191284, 1, 0, 0.8705882, 1,
1.026123, 2.69513, 2.15383, 1, 0, 0.8627451, 1,
1.034355, -1.557061, 3.400078, 1, 0, 0.8588235, 1,
1.034536, 0.6918321, -0.2259811, 1, 0, 0.8509804, 1,
1.046465, 1.443177, 1.251618, 1, 0, 0.8470588, 1,
1.048938, 0.2845151, 0.4974012, 1, 0, 0.8392157, 1,
1.050364, -1.051975, 1.95298, 1, 0, 0.8352941, 1,
1.051959, -0.8217264, 2.028654, 1, 0, 0.827451, 1,
1.053013, -0.5726745, 1.022488, 1, 0, 0.8235294, 1,
1.058666, -0.7908553, 1.596111, 1, 0, 0.8156863, 1,
1.060254, -1.164175, 0.7693353, 1, 0, 0.8117647, 1,
1.064852, -0.5439286, 0.6454773, 1, 0, 0.8039216, 1,
1.081053, 0.5374961, -0.2886475, 1, 0, 0.7960784, 1,
1.0848, -0.9333171, 2.491849, 1, 0, 0.7921569, 1,
1.088666, 1.674234, 0.2691628, 1, 0, 0.7843137, 1,
1.090692, -0.5750814, 2.59076, 1, 0, 0.7803922, 1,
1.096414, -0.09748743, 1.496081, 1, 0, 0.772549, 1,
1.096658, 0.6151958, 1.045244, 1, 0, 0.7686275, 1,
1.098179, -0.03966365, 0.6946515, 1, 0, 0.7607843, 1,
1.101884, 0.7900289, 1.583116, 1, 0, 0.7568628, 1,
1.103348, -2.331538, 3.127633, 1, 0, 0.7490196, 1,
1.103431, -1.872457, 1.912049, 1, 0, 0.7450981, 1,
1.103517, -0.887247, 2.57805, 1, 0, 0.7372549, 1,
1.107872, -1.222612, 2.048517, 1, 0, 0.7333333, 1,
1.108829, 0.4401102, 0.9215159, 1, 0, 0.7254902, 1,
1.111749, 0.3845754, 1.35023, 1, 0, 0.7215686, 1,
1.122538, 0.4438818, -0.3926261, 1, 0, 0.7137255, 1,
1.145964, -0.6133869, 1.342208, 1, 0, 0.7098039, 1,
1.146715, -0.8265836, 2.059835, 1, 0, 0.7019608, 1,
1.165841, 0.3484489, -0.473258, 1, 0, 0.6941177, 1,
1.170271, 1.642666, 1.629777, 1, 0, 0.6901961, 1,
1.18248, -1.149171, 3.269047, 1, 0, 0.682353, 1,
1.189832, 0.1662443, 2.111626, 1, 0, 0.6784314, 1,
1.19399, -0.01898672, 1.12307, 1, 0, 0.6705883, 1,
1.198982, -0.0973606, 2.117684, 1, 0, 0.6666667, 1,
1.209783, 0.07241599, 1.455526, 1, 0, 0.6588235, 1,
1.215195, 1.617373, -0.05209681, 1, 0, 0.654902, 1,
1.221772, 0.444206, 0.1709616, 1, 0, 0.6470588, 1,
1.227124, -0.2689143, 2.356804, 1, 0, 0.6431373, 1,
1.230536, 0.723465, 2.798112, 1, 0, 0.6352941, 1,
1.235169, 1.109886, 0.3978773, 1, 0, 0.6313726, 1,
1.24843, 0.3282187, 1.900596, 1, 0, 0.6235294, 1,
1.255049, -0.496676, 4.391668, 1, 0, 0.6196079, 1,
1.256389, -0.5860909, 2.93824, 1, 0, 0.6117647, 1,
1.258847, 0.5981442, 0.9629728, 1, 0, 0.6078432, 1,
1.260855, 0.3858595, 2.550627, 1, 0, 0.6, 1,
1.261316, 0.3648806, 1.367342, 1, 0, 0.5921569, 1,
1.268231, 1.292532, 0.420619, 1, 0, 0.5882353, 1,
1.268761, -0.866454, 3.026156, 1, 0, 0.5803922, 1,
1.273927, 0.9704644, -0.4030086, 1, 0, 0.5764706, 1,
1.277389, -0.261666, 1.167686, 1, 0, 0.5686275, 1,
1.280751, -2.021206, 3.470579, 1, 0, 0.5647059, 1,
1.291711, -1.297759, 3.007447, 1, 0, 0.5568628, 1,
1.293144, -0.3527855, 2.123341, 1, 0, 0.5529412, 1,
1.316396, -0.09314112, 0.6040273, 1, 0, 0.5450981, 1,
1.322255, 0.2167351, 0.6868893, 1, 0, 0.5411765, 1,
1.325432, 0.6983342, 1.566627, 1, 0, 0.5333334, 1,
1.326483, 2.740574, 1.69099, 1, 0, 0.5294118, 1,
1.328568, -0.9611943, 1.443692, 1, 0, 0.5215687, 1,
1.333765, -2.563312, 1.800522, 1, 0, 0.5176471, 1,
1.35078, 0.6864279, 3.523326, 1, 0, 0.509804, 1,
1.353718, 0.2829989, 1.732282, 1, 0, 0.5058824, 1,
1.370572, -0.01191763, 2.054653, 1, 0, 0.4980392, 1,
1.374154, 0.4524711, 3.053171, 1, 0, 0.4901961, 1,
1.389515, 1.042617, 0.1070575, 1, 0, 0.4862745, 1,
1.40291, 0.6324525, 1.139518, 1, 0, 0.4784314, 1,
1.419868, 0.6810011, 0.4035751, 1, 0, 0.4745098, 1,
1.456116, -0.8059427, 2.419022, 1, 0, 0.4666667, 1,
1.469998, -1.058066, 1.912528, 1, 0, 0.4627451, 1,
1.476451, -0.1059973, 2.078153, 1, 0, 0.454902, 1,
1.480095, 0.1422446, 0.9905419, 1, 0, 0.4509804, 1,
1.49081, -0.9521579, 1.331869, 1, 0, 0.4431373, 1,
1.498353, -2.639648, 1.637351, 1, 0, 0.4392157, 1,
1.503497, -0.641321, 1.54999, 1, 0, 0.4313726, 1,
1.5074, 0.7046077, 2.013338, 1, 0, 0.427451, 1,
1.509138, -0.1204083, 1.183765, 1, 0, 0.4196078, 1,
1.528285, 0.05216874, 0.3991348, 1, 0, 0.4156863, 1,
1.530645, -1.836164, 2.588924, 1, 0, 0.4078431, 1,
1.546385, -0.09900308, 2.553636, 1, 0, 0.4039216, 1,
1.548454, 1.314707, 0.4513155, 1, 0, 0.3960784, 1,
1.549855, -0.09072244, 2.397143, 1, 0, 0.3882353, 1,
1.554792, -0.2702232, 1.331993, 1, 0, 0.3843137, 1,
1.555366, 1.278561, 0.3187065, 1, 0, 0.3764706, 1,
1.556901, 1.116232, 1.725774, 1, 0, 0.372549, 1,
1.584574, -1.39309, 0.6058862, 1, 0, 0.3647059, 1,
1.586782, -0.7815642, 2.131649, 1, 0, 0.3607843, 1,
1.591063, -1.934568, 0.8699898, 1, 0, 0.3529412, 1,
1.594447, 1.202573, 1.498001, 1, 0, 0.3490196, 1,
1.597189, -0.6931931, 2.334901, 1, 0, 0.3411765, 1,
1.604105, 1.199087, 1.03066, 1, 0, 0.3372549, 1,
1.650969, 0.5704539, 0.5066254, 1, 0, 0.3294118, 1,
1.652555, -0.3022925, 1.76556, 1, 0, 0.3254902, 1,
1.673076, 0.9891933, 3.119304, 1, 0, 0.3176471, 1,
1.675035, 0.2910283, 1.820899, 1, 0, 0.3137255, 1,
1.675718, -0.9917564, 1.515968, 1, 0, 0.3058824, 1,
1.678971, 0.6496547, 2.576535, 1, 0, 0.2980392, 1,
1.689626, -0.8143889, 2.862499, 1, 0, 0.2941177, 1,
1.692373, 0.3846283, 0.4522981, 1, 0, 0.2862745, 1,
1.699955, 0.3086443, -0.4443483, 1, 0, 0.282353, 1,
1.70713, 0.4833518, 0.3013741, 1, 0, 0.2745098, 1,
1.734509, 0.6804076, 1.467271, 1, 0, 0.2705882, 1,
1.753662, -0.07652406, 1.086061, 1, 0, 0.2627451, 1,
1.757588, 0.5189598, 1.165414, 1, 0, 0.2588235, 1,
1.800587, 1.045781, 3.977477, 1, 0, 0.2509804, 1,
1.805132, 0.8372086, 2.719926, 1, 0, 0.2470588, 1,
1.835151, 0.625163, 1.266434, 1, 0, 0.2392157, 1,
1.848064, -1.164846, 1.400445, 1, 0, 0.2352941, 1,
1.855525, -0.7524791, 0.7630497, 1, 0, 0.227451, 1,
1.869513, 0.6250836, 2.948555, 1, 0, 0.2235294, 1,
1.87167, -0.06245972, 0.8257053, 1, 0, 0.2156863, 1,
1.900218, -2.075239, 2.108539, 1, 0, 0.2117647, 1,
1.901651, -0.7997511, 1.947597, 1, 0, 0.2039216, 1,
1.923557, -1.783291, 1.83292, 1, 0, 0.1960784, 1,
1.941742, -0.3320071, 4.399714, 1, 0, 0.1921569, 1,
1.942519, -0.7095751, 2.870795, 1, 0, 0.1843137, 1,
1.986618, -0.3119914, 2.198206, 1, 0, 0.1803922, 1,
1.997592, -0.5874333, 2.420591, 1, 0, 0.172549, 1,
1.998661, 1.624922, 1.415341, 1, 0, 0.1686275, 1,
2.017058, -0.2531936, 1.730093, 1, 0, 0.1607843, 1,
2.019699, 0.2257292, 2.730758, 1, 0, 0.1568628, 1,
2.03049, -0.3316386, 0.9355913, 1, 0, 0.1490196, 1,
2.07137, -0.5469828, 2.500301, 1, 0, 0.145098, 1,
2.113643, 0.0596719, 1.397011, 1, 0, 0.1372549, 1,
2.120502, 0.5090109, -1.443535, 1, 0, 0.1333333, 1,
2.120715, -0.3366975, 2.709276, 1, 0, 0.1254902, 1,
2.143929, 0.04495448, -1.22785, 1, 0, 0.1215686, 1,
2.159616, 1.003659, 0.5928996, 1, 0, 0.1137255, 1,
2.204891, -1.91584, 3.671091, 1, 0, 0.1098039, 1,
2.219761, 0.3547347, 0.5422435, 1, 0, 0.1019608, 1,
2.227934, -0.9846554, 1.803067, 1, 0, 0.09411765, 1,
2.238077, 0.9762633, 1.413256, 1, 0, 0.09019608, 1,
2.25611, 1.256865, 0.7798408, 1, 0, 0.08235294, 1,
2.32097, 2.111224, 1.251603, 1, 0, 0.07843138, 1,
2.325402, 1.314082, -0.232066, 1, 0, 0.07058824, 1,
2.331918, 0.9991178, 0.6278195, 1, 0, 0.06666667, 1,
2.352631, 0.454962, 0.7419328, 1, 0, 0.05882353, 1,
2.381155, -0.3276548, 2.866177, 1, 0, 0.05490196, 1,
2.466222, -0.3759566, 1.455445, 1, 0, 0.04705882, 1,
2.510528, 0.3694535, 0.983423, 1, 0, 0.04313726, 1,
2.573374, -1.355682, 2.761597, 1, 0, 0.03529412, 1,
2.602417, 0.05921362, 1.563795, 1, 0, 0.03137255, 1,
2.624266, 1.036533, 1.54832, 1, 0, 0.02352941, 1,
2.66695, 0.4152785, 1.398568, 1, 0, 0.01960784, 1,
2.7588, -0.5862119, 3.321713, 1, 0, 0.01176471, 1,
3.044042, 0.8242312, 0.1545834, 1, 0, 0.007843138, 1
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
0.1055001, -4.452218, -7.014654, 0, -0.5, 0.5, 0.5,
0.1055001, -4.452218, -7.014654, 1, -0.5, 0.5, 0.5,
0.1055001, -4.452218, -7.014654, 1, 1.5, 0.5, 0.5,
0.1055001, -4.452218, -7.014654, 0, 1.5, 0.5, 0.5
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
-3.829207, -0.0717026, -7.014654, 0, -0.5, 0.5, 0.5,
-3.829207, -0.0717026, -7.014654, 1, -0.5, 0.5, 0.5,
-3.829207, -0.0717026, -7.014654, 1, 1.5, 0.5, 0.5,
-3.829207, -0.0717026, -7.014654, 0, 1.5, 0.5, 0.5
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
-3.829207, -4.452218, 0.3618228, 0, -0.5, 0.5, 0.5,
-3.829207, -4.452218, 0.3618228, 1, -0.5, 0.5, 0.5,
-3.829207, -4.452218, 0.3618228, 1, 1.5, 0.5, 0.5,
-3.829207, -4.452218, 0.3618228, 0, 1.5, 0.5, 0.5
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
-2, -3.44133, -5.31239,
3, -3.44133, -5.31239,
-2, -3.44133, -5.31239,
-2, -3.609811, -5.5961,
-1, -3.44133, -5.31239,
-1, -3.609811, -5.5961,
0, -3.44133, -5.31239,
0, -3.609811, -5.5961,
1, -3.44133, -5.31239,
1, -3.609811, -5.5961,
2, -3.44133, -5.31239,
2, -3.609811, -5.5961,
3, -3.44133, -5.31239,
3, -3.609811, -5.5961
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
-2, -3.946774, -6.163522, 0, -0.5, 0.5, 0.5,
-2, -3.946774, -6.163522, 1, -0.5, 0.5, 0.5,
-2, -3.946774, -6.163522, 1, 1.5, 0.5, 0.5,
-2, -3.946774, -6.163522, 0, 1.5, 0.5, 0.5,
-1, -3.946774, -6.163522, 0, -0.5, 0.5, 0.5,
-1, -3.946774, -6.163522, 1, -0.5, 0.5, 0.5,
-1, -3.946774, -6.163522, 1, 1.5, 0.5, 0.5,
-1, -3.946774, -6.163522, 0, 1.5, 0.5, 0.5,
0, -3.946774, -6.163522, 0, -0.5, 0.5, 0.5,
0, -3.946774, -6.163522, 1, -0.5, 0.5, 0.5,
0, -3.946774, -6.163522, 1, 1.5, 0.5, 0.5,
0, -3.946774, -6.163522, 0, 1.5, 0.5, 0.5,
1, -3.946774, -6.163522, 0, -0.5, 0.5, 0.5,
1, -3.946774, -6.163522, 1, -0.5, 0.5, 0.5,
1, -3.946774, -6.163522, 1, 1.5, 0.5, 0.5,
1, -3.946774, -6.163522, 0, 1.5, 0.5, 0.5,
2, -3.946774, -6.163522, 0, -0.5, 0.5, 0.5,
2, -3.946774, -6.163522, 1, -0.5, 0.5, 0.5,
2, -3.946774, -6.163522, 1, 1.5, 0.5, 0.5,
2, -3.946774, -6.163522, 0, 1.5, 0.5, 0.5,
3, -3.946774, -6.163522, 0, -0.5, 0.5, 0.5,
3, -3.946774, -6.163522, 1, -0.5, 0.5, 0.5,
3, -3.946774, -6.163522, 1, 1.5, 0.5, 0.5,
3, -3.946774, -6.163522, 0, 1.5, 0.5, 0.5
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
-2.921198, -3, -5.31239,
-2.921198, 3, -5.31239,
-2.921198, -3, -5.31239,
-3.072533, -3, -5.5961,
-2.921198, -2, -5.31239,
-3.072533, -2, -5.5961,
-2.921198, -1, -5.31239,
-3.072533, -1, -5.5961,
-2.921198, 0, -5.31239,
-3.072533, 0, -5.5961,
-2.921198, 1, -5.31239,
-3.072533, 1, -5.5961,
-2.921198, 2, -5.31239,
-3.072533, 2, -5.5961,
-2.921198, 3, -5.31239,
-3.072533, 3, -5.5961
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
-3.375202, -3, -6.163522, 0, -0.5, 0.5, 0.5,
-3.375202, -3, -6.163522, 1, -0.5, 0.5, 0.5,
-3.375202, -3, -6.163522, 1, 1.5, 0.5, 0.5,
-3.375202, -3, -6.163522, 0, 1.5, 0.5, 0.5,
-3.375202, -2, -6.163522, 0, -0.5, 0.5, 0.5,
-3.375202, -2, -6.163522, 1, -0.5, 0.5, 0.5,
-3.375202, -2, -6.163522, 1, 1.5, 0.5, 0.5,
-3.375202, -2, -6.163522, 0, 1.5, 0.5, 0.5,
-3.375202, -1, -6.163522, 0, -0.5, 0.5, 0.5,
-3.375202, -1, -6.163522, 1, -0.5, 0.5, 0.5,
-3.375202, -1, -6.163522, 1, 1.5, 0.5, 0.5,
-3.375202, -1, -6.163522, 0, 1.5, 0.5, 0.5,
-3.375202, 0, -6.163522, 0, -0.5, 0.5, 0.5,
-3.375202, 0, -6.163522, 1, -0.5, 0.5, 0.5,
-3.375202, 0, -6.163522, 1, 1.5, 0.5, 0.5,
-3.375202, 0, -6.163522, 0, 1.5, 0.5, 0.5,
-3.375202, 1, -6.163522, 0, -0.5, 0.5, 0.5,
-3.375202, 1, -6.163522, 1, -0.5, 0.5, 0.5,
-3.375202, 1, -6.163522, 1, 1.5, 0.5, 0.5,
-3.375202, 1, -6.163522, 0, 1.5, 0.5, 0.5,
-3.375202, 2, -6.163522, 0, -0.5, 0.5, 0.5,
-3.375202, 2, -6.163522, 1, -0.5, 0.5, 0.5,
-3.375202, 2, -6.163522, 1, 1.5, 0.5, 0.5,
-3.375202, 2, -6.163522, 0, 1.5, 0.5, 0.5,
-3.375202, 3, -6.163522, 0, -0.5, 0.5, 0.5,
-3.375202, 3, -6.163522, 1, -0.5, 0.5, 0.5,
-3.375202, 3, -6.163522, 1, 1.5, 0.5, 0.5,
-3.375202, 3, -6.163522, 0, 1.5, 0.5, 0.5
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
-2.921198, -3.44133, -4,
-2.921198, -3.44133, 4,
-2.921198, -3.44133, -4,
-3.072533, -3.609811, -4,
-2.921198, -3.44133, -2,
-3.072533, -3.609811, -2,
-2.921198, -3.44133, 0,
-3.072533, -3.609811, 0,
-2.921198, -3.44133, 2,
-3.072533, -3.609811, 2,
-2.921198, -3.44133, 4,
-3.072533, -3.609811, 4
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
-3.375202, -3.946774, -4, 0, -0.5, 0.5, 0.5,
-3.375202, -3.946774, -4, 1, -0.5, 0.5, 0.5,
-3.375202, -3.946774, -4, 1, 1.5, 0.5, 0.5,
-3.375202, -3.946774, -4, 0, 1.5, 0.5, 0.5,
-3.375202, -3.946774, -2, 0, -0.5, 0.5, 0.5,
-3.375202, -3.946774, -2, 1, -0.5, 0.5, 0.5,
-3.375202, -3.946774, -2, 1, 1.5, 0.5, 0.5,
-3.375202, -3.946774, -2, 0, 1.5, 0.5, 0.5,
-3.375202, -3.946774, 0, 0, -0.5, 0.5, 0.5,
-3.375202, -3.946774, 0, 1, -0.5, 0.5, 0.5,
-3.375202, -3.946774, 0, 1, 1.5, 0.5, 0.5,
-3.375202, -3.946774, 0, 0, 1.5, 0.5, 0.5,
-3.375202, -3.946774, 2, 0, -0.5, 0.5, 0.5,
-3.375202, -3.946774, 2, 1, -0.5, 0.5, 0.5,
-3.375202, -3.946774, 2, 1, 1.5, 0.5, 0.5,
-3.375202, -3.946774, 2, 0, 1.5, 0.5, 0.5,
-3.375202, -3.946774, 4, 0, -0.5, 0.5, 0.5,
-3.375202, -3.946774, 4, 1, -0.5, 0.5, 0.5,
-3.375202, -3.946774, 4, 1, 1.5, 0.5, 0.5,
-3.375202, -3.946774, 4, 0, 1.5, 0.5, 0.5
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
-2.921198, -3.44133, -5.31239,
-2.921198, 3.297925, -5.31239,
-2.921198, -3.44133, 6.036036,
-2.921198, 3.297925, 6.036036,
-2.921198, -3.44133, -5.31239,
-2.921198, -3.44133, 6.036036,
-2.921198, 3.297925, -5.31239,
-2.921198, 3.297925, 6.036036,
-2.921198, -3.44133, -5.31239,
3.132198, -3.44133, -5.31239,
-2.921198, -3.44133, 6.036036,
3.132198, -3.44133, 6.036036,
-2.921198, 3.297925, -5.31239,
3.132198, 3.297925, -5.31239,
-2.921198, 3.297925, 6.036036,
3.132198, 3.297925, 6.036036,
3.132198, -3.44133, -5.31239,
3.132198, 3.297925, -5.31239,
3.132198, -3.44133, 6.036036,
3.132198, 3.297925, 6.036036,
3.132198, -3.44133, -5.31239,
3.132198, -3.44133, 6.036036,
3.132198, 3.297925, -5.31239,
3.132198, 3.297925, 6.036036
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
var radius = 7.75372;
var distance = 34.49718;
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
mvMatrix.translate( -0.1055001, 0.0717026, -0.3618228 );
mvMatrix.scale( 1.384921, 1.243976, 0.7387345 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.49718);
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
InChI_1S_C42H67NO10.<-read.table("InChI_1S_C42H67NO10..xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C42H67NO10.$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C42H67NO10.' not found
```

```r
y<-InChI_1S_C42H67NO10.$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C42H67NO10.' not found
```

```r
z<-InChI_1S_C42H67NO10.$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C42H67NO10.' not found
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
-2.833041, 1.116899, -1.557212, 0, 0, 1, 1, 1,
-2.627467, 1.237845, -2.239748, 1, 0, 0, 1, 1,
-2.615868, 0.332078, -2.132072, 1, 0, 0, 1, 1,
-2.534124, -0.4230205, -2.554429, 1, 0, 0, 1, 1,
-2.504663, -0.2234761, 0.604389, 1, 0, 0, 1, 1,
-2.451068, -0.6637525, -0.7021924, 1, 0, 0, 1, 1,
-2.383592, 0.213731, -2.056038, 0, 0, 0, 1, 1,
-2.350544, -1.376874, -1.910824, 0, 0, 0, 1, 1,
-2.349146, -3.343185, -2.686907, 0, 0, 0, 1, 1,
-2.340762, 0.6866984, -0.6496953, 0, 0, 0, 1, 1,
-2.268066, 1.88343, -2.056657, 0, 0, 0, 1, 1,
-2.251332, -1.163645, -0.8453198, 0, 0, 0, 1, 1,
-2.213563, 1.197466, 1.092818, 0, 0, 0, 1, 1,
-2.11308, -0.662247, -1.880933, 1, 1, 1, 1, 1,
-2.104924, 0.4380975, -1.347902, 1, 1, 1, 1, 1,
-2.0913, 0.4151774, -3.053975, 1, 1, 1, 1, 1,
-2.077992, 0.1657696, -0.964365, 1, 1, 1, 1, 1,
-2.075777, 0.7596619, -1.575901, 1, 1, 1, 1, 1,
-1.965061, 0.398553, -1.989676, 1, 1, 1, 1, 1,
-1.951144, 0.6745806, -1.662934, 1, 1, 1, 1, 1,
-1.933885, -0.3338442, -0.7706676, 1, 1, 1, 1, 1,
-1.931384, -1.479697, -2.122866, 1, 1, 1, 1, 1,
-1.914336, 0.02033702, -0.9407445, 1, 1, 1, 1, 1,
-1.913774, 0.3248253, -1.46071, 1, 1, 1, 1, 1,
-1.910404, -0.6699824, -2.222999, 1, 1, 1, 1, 1,
-1.840118, 1.409474, -1.683592, 1, 1, 1, 1, 1,
-1.829428, 0.304369, -0.4353365, 1, 1, 1, 1, 1,
-1.819433, 0.1163353, -2.505391, 1, 1, 1, 1, 1,
-1.791549, -0.2505221, -0.5955721, 0, 0, 1, 1, 1,
-1.776392, -1.788808, -3.170933, 1, 0, 0, 1, 1,
-1.736505, 1.122116, -1.365522, 1, 0, 0, 1, 1,
-1.73278, -0.1136921, -0.5703449, 1, 0, 0, 1, 1,
-1.710688, -0.5726306, -2.166652, 1, 0, 0, 1, 1,
-1.703439, 0.6816617, -1.224906, 1, 0, 0, 1, 1,
-1.684503, -0.2321162, -1.922747, 0, 0, 0, 1, 1,
-1.680943, 0.932568, -1.59396, 0, 0, 0, 1, 1,
-1.666647, -0.9997403, -1.297359, 0, 0, 0, 1, 1,
-1.652388, 1.142437, -1.391827, 0, 0, 0, 1, 1,
-1.648394, -1.390577, -1.865059, 0, 0, 0, 1, 1,
-1.64579, 0.2521684, -0.3692625, 0, 0, 0, 1, 1,
-1.633441, 0.1253939, -0.8847322, 0, 0, 0, 1, 1,
-1.623704, -1.597108, -0.1263463, 1, 1, 1, 1, 1,
-1.618161, 0.9012985, -1.050586, 1, 1, 1, 1, 1,
-1.585431, -0.602656, -2.403924, 1, 1, 1, 1, 1,
-1.583601, 0.1874525, -2.410892, 1, 1, 1, 1, 1,
-1.566534, 0.9307382, -0.4846438, 1, 1, 1, 1, 1,
-1.564682, 0.2214627, -0.5171588, 1, 1, 1, 1, 1,
-1.55968, 0.9225731, -2.201185, 1, 1, 1, 1, 1,
-1.546864, -1.458403, -2.567203, 1, 1, 1, 1, 1,
-1.535508, -0.2174694, -2.727452, 1, 1, 1, 1, 1,
-1.528322, 0.1868352, -1.999671, 1, 1, 1, 1, 1,
-1.525708, 0.4331875, -2.132445, 1, 1, 1, 1, 1,
-1.50083, 0.244294, -1.058895, 1, 1, 1, 1, 1,
-1.492117, 0.004967066, -2.850034, 1, 1, 1, 1, 1,
-1.468738, 0.04249344, -0.7514766, 1, 1, 1, 1, 1,
-1.449089, 0.05640157, -2.837841, 1, 1, 1, 1, 1,
-1.441826, -0.05284928, -2.827601, 0, 0, 1, 1, 1,
-1.44102, -0.5488388, -2.657812, 1, 0, 0, 1, 1,
-1.435287, 0.1460951, -2.042521, 1, 0, 0, 1, 1,
-1.428729, -1.009533, -1.072196, 1, 0, 0, 1, 1,
-1.426998, 0.1612259, -1.202329, 1, 0, 0, 1, 1,
-1.424915, -0.4853757, -4.036926, 1, 0, 0, 1, 1,
-1.41161, -1.701196, -3.166112, 0, 0, 0, 1, 1,
-1.396582, -1.199636, -0.2441035, 0, 0, 0, 1, 1,
-1.393784, 0.8153377, -0.1996973, 0, 0, 0, 1, 1,
-1.382127, -0.2248375, -0.9938664, 0, 0, 0, 1, 1,
-1.381837, -1.340731, -3.306418, 0, 0, 0, 1, 1,
-1.371415, 0.1336803, -2.578207, 0, 0, 0, 1, 1,
-1.36737, -0.3460549, -2.067702, 0, 0, 0, 1, 1,
-1.357667, -1.090405, -2.620042, 1, 1, 1, 1, 1,
-1.343267, -0.3858241, -1.929189, 1, 1, 1, 1, 1,
-1.337721, 0.0144323, -0.6531954, 1, 1, 1, 1, 1,
-1.337128, 1.213885, -0.3960622, 1, 1, 1, 1, 1,
-1.334304, 0.1776324, -1.173964, 1, 1, 1, 1, 1,
-1.332914, -0.4683909, -2.212467, 1, 1, 1, 1, 1,
-1.332436, -1.226306, -3.756476, 1, 1, 1, 1, 1,
-1.32558, -0.3286178, -2.462521, 1, 1, 1, 1, 1,
-1.321373, 0.571132, -0.6545489, 1, 1, 1, 1, 1,
-1.310743, 0.2110577, -1.994654, 1, 1, 1, 1, 1,
-1.310551, 0.03305886, -0.9863639, 1, 1, 1, 1, 1,
-1.296152, -0.7456421, -0.4630443, 1, 1, 1, 1, 1,
-1.291208, -0.08738547, -2.561632, 1, 1, 1, 1, 1,
-1.281937, -0.3465621, -2.502542, 1, 1, 1, 1, 1,
-1.280244, 0.8630271, -1.370653, 1, 1, 1, 1, 1,
-1.27533, 0.08400624, -2.978879, 0, 0, 1, 1, 1,
-1.269117, -0.5849593, -0.8981403, 1, 0, 0, 1, 1,
-1.261134, 0.9045719, -0.8160326, 1, 0, 0, 1, 1,
-1.25624, 0.4044763, 0.6945845, 1, 0, 0, 1, 1,
-1.241177, -0.0143674, -0.6992457, 1, 0, 0, 1, 1,
-1.232157, 0.997509, -0.4749571, 1, 0, 0, 1, 1,
-1.231518, -2.566656, -3.794763, 0, 0, 0, 1, 1,
-1.230845, 0.398178, -0.7776157, 0, 0, 0, 1, 1,
-1.226243, -0.595838, -0.8420497, 0, 0, 0, 1, 1,
-1.225926, 0.6694644, 0.8801, 0, 0, 0, 1, 1,
-1.219371, 0.5618244, -1.080906, 0, 0, 0, 1, 1,
-1.209036, -0.6455012, -2.456171, 0, 0, 0, 1, 1,
-1.205045, 0.8260449, -0.3740143, 0, 0, 0, 1, 1,
-1.199653, 0.6451375, -1.227494, 1, 1, 1, 1, 1,
-1.179453, 0.3864375, -0.7756014, 1, 1, 1, 1, 1,
-1.175503, 1.267018, -1.885317, 1, 1, 1, 1, 1,
-1.173761, -0.4775742, -1.453012, 1, 1, 1, 1, 1,
-1.172876, -0.6796241, -3.36745, 1, 1, 1, 1, 1,
-1.163218, -0.2980166, -2.251163, 1, 1, 1, 1, 1,
-1.16153, 0.2990812, -1.135043, 1, 1, 1, 1, 1,
-1.159757, 1.045756, -0.9610396, 1, 1, 1, 1, 1,
-1.156955, 1.244216, -1.234693, 1, 1, 1, 1, 1,
-1.154219, 0.347289, -1.850889, 1, 1, 1, 1, 1,
-1.147611, -0.582857, -3.963143, 1, 1, 1, 1, 1,
-1.146766, 0.5589994, -1.105594, 1, 1, 1, 1, 1,
-1.14296, 0.6468428, -0.3814602, 1, 1, 1, 1, 1,
-1.134866, 0.5180204, -0.179757, 1, 1, 1, 1, 1,
-1.133162, 0.5362908, -0.8330724, 1, 1, 1, 1, 1,
-1.123512, -1.074207, -3.470063, 0, 0, 1, 1, 1,
-1.121427, -0.3008451, -2.471998, 1, 0, 0, 1, 1,
-1.110039, -0.3905186, 0.01662006, 1, 0, 0, 1, 1,
-1.099004, -0.001147602, -1.38323, 1, 0, 0, 1, 1,
-1.098927, -1.345334, -3.356598, 1, 0, 0, 1, 1,
-1.092654, -0.8237549, -3.150891, 1, 0, 0, 1, 1,
-1.088788, 0.661893, -0.6187169, 0, 0, 0, 1, 1,
-1.087727, 0.6014455, 0.008950282, 0, 0, 0, 1, 1,
-1.086064, 0.008926307, -1.003875, 0, 0, 0, 1, 1,
-1.085532, 1.086532, -1.279168, 0, 0, 0, 1, 1,
-1.085212, 0.3398473, -1.95732, 0, 0, 0, 1, 1,
-1.084025, -0.7228538, -1.623988, 0, 0, 0, 1, 1,
-1.082774, 0.7001379, -1.879438, 0, 0, 0, 1, 1,
-1.079891, -0.7075002, -0.9475428, 1, 1, 1, 1, 1,
-1.079638, 0.4085197, -1.636276, 1, 1, 1, 1, 1,
-1.076112, 1.517861, -0.4263656, 1, 1, 1, 1, 1,
-1.070613, 0.5672546, -1.865683, 1, 1, 1, 1, 1,
-1.066203, -0.5928797, 0.02233331, 1, 1, 1, 1, 1,
-1.063383, -0.3437267, -2.821918, 1, 1, 1, 1, 1,
-1.062645, 0.4515833, -1.161344, 1, 1, 1, 1, 1,
-1.062205, -0.2254909, -1.25105, 1, 1, 1, 1, 1,
-1.051273, -1.002685, -2.877865, 1, 1, 1, 1, 1,
-1.049435, 0.6342451, -0.4605963, 1, 1, 1, 1, 1,
-1.04837, 0.4124773, -1.567506, 1, 1, 1, 1, 1,
-1.046957, 0.159794, -2.41003, 1, 1, 1, 1, 1,
-1.045904, -0.2197984, -1.90952, 1, 1, 1, 1, 1,
-1.044843, -0.6626206, -2.884561, 1, 1, 1, 1, 1,
-1.043971, -0.3304043, -4.316286, 1, 1, 1, 1, 1,
-1.043177, -1.682598, -2.777602, 0, 0, 1, 1, 1,
-1.038113, -1.474233, -3.330615, 1, 0, 0, 1, 1,
-1.035217, -1.259298, -3.775743, 1, 0, 0, 1, 1,
-1.023363, -0.0747278, -0.6611667, 1, 0, 0, 1, 1,
-1.012401, -2.016429, -3.456753, 1, 0, 0, 1, 1,
-1.012178, 1.178652, -0.9998909, 1, 0, 0, 1, 1,
-1.006542, -0.8935775, -2.88179, 0, 0, 0, 1, 1,
-1.005519, 0.1174986, -2.931368, 0, 0, 0, 1, 1,
-1.005439, 0.4274372, -1.729545, 0, 0, 0, 1, 1,
-1.001878, 0.5879043, 0.6448673, 0, 0, 0, 1, 1,
-0.9852592, -0.5430629, -4.367629, 0, 0, 0, 1, 1,
-0.9824581, -0.2829816, -1.335496, 0, 0, 0, 1, 1,
-0.9810246, -0.05480225, -0.5147133, 0, 0, 0, 1, 1,
-0.9802166, -1.207402, -3.250309, 1, 1, 1, 1, 1,
-0.9771764, 0.2232642, -0.795773, 1, 1, 1, 1, 1,
-0.9761618, -0.5129103, -1.324461, 1, 1, 1, 1, 1,
-0.9744959, -0.1524311, -1.727562, 1, 1, 1, 1, 1,
-0.9659163, -0.3353145, -0.9317666, 1, 1, 1, 1, 1,
-0.9645418, 0.1123238, -2.696816, 1, 1, 1, 1, 1,
-0.9635434, 0.6195754, 0.8527984, 1, 1, 1, 1, 1,
-0.9583716, 2.250014, -1.388826, 1, 1, 1, 1, 1,
-0.9555523, -0.1128231, -0.6540334, 1, 1, 1, 1, 1,
-0.9549016, -1.077022, -2.776618, 1, 1, 1, 1, 1,
-0.9547967, -0.6301281, -1.22561, 1, 1, 1, 1, 1,
-0.954274, 1.661819, -3.022452, 1, 1, 1, 1, 1,
-0.943926, 0.1686673, -3.453869, 1, 1, 1, 1, 1,
-0.9409153, 0.7466486, 0.2857167, 1, 1, 1, 1, 1,
-0.9402097, -1.381861, -3.303553, 1, 1, 1, 1, 1,
-0.9363667, 1.650322, -1.667848, 0, 0, 1, 1, 1,
-0.9313424, 0.07428779, -3.346451, 1, 0, 0, 1, 1,
-0.928677, -0.1190973, -3.721255, 1, 0, 0, 1, 1,
-0.9266824, -0.04870934, -3.138993, 1, 0, 0, 1, 1,
-0.9264498, 1.53989, -2.403504, 1, 0, 0, 1, 1,
-0.9210451, 0.7096041, -0.1980459, 1, 0, 0, 1, 1,
-0.9169798, -2.418886, -3.541732, 0, 0, 0, 1, 1,
-0.9135953, 0.6867135, -0.7279819, 0, 0, 0, 1, 1,
-0.9063832, -0.4068175, -2.968101, 0, 0, 0, 1, 1,
-0.9055553, 0.3319192, -0.7069792, 0, 0, 0, 1, 1,
-0.8962436, -1.970185, -4.049818, 0, 0, 0, 1, 1,
-0.8945695, 0.5771331, -1.752961, 0, 0, 0, 1, 1,
-0.8881561, -0.0002418897, -2.886953, 0, 0, 0, 1, 1,
-0.887831, -0.5394369, -0.6235757, 1, 1, 1, 1, 1,
-0.886318, 0.6603662, -1.047989, 1, 1, 1, 1, 1,
-0.881495, 1.320717, -0.7047232, 1, 1, 1, 1, 1,
-0.8771555, 0.3265902, -0.8068651, 1, 1, 1, 1, 1,
-0.8667607, 0.05557999, -1.972322, 1, 1, 1, 1, 1,
-0.8617263, -0.8324928, -2.584042, 1, 1, 1, 1, 1,
-0.8447161, -1.557442, -2.121334, 1, 1, 1, 1, 1,
-0.8440858, 0.2807496, -1.887816, 1, 1, 1, 1, 1,
-0.833573, -0.7802522, -2.667622, 1, 1, 1, 1, 1,
-0.8284339, 0.7635009, -2.135457, 1, 1, 1, 1, 1,
-0.8200679, 0.4164928, -0.6227826, 1, 1, 1, 1, 1,
-0.8150385, 0.6403638, -1.555423, 1, 1, 1, 1, 1,
-0.7997863, -0.296686, -1.890393, 1, 1, 1, 1, 1,
-0.7981585, -0.4382602, -0.5163824, 1, 1, 1, 1, 1,
-0.7960194, 1.728968, 0.02379832, 1, 1, 1, 1, 1,
-0.7893868, 0.01628016, -3.13197, 0, 0, 1, 1, 1,
-0.7874402, 0.7247266, -0.8093398, 1, 0, 0, 1, 1,
-0.7794285, 0.7522992, -1.265838, 1, 0, 0, 1, 1,
-0.7731684, 0.772418, 0.1502735, 1, 0, 0, 1, 1,
-0.7712325, 1.168605, -2.811865, 1, 0, 0, 1, 1,
-0.767745, 0.357918, -1.849543, 1, 0, 0, 1, 1,
-0.7677042, -1.43686, -2.57238, 0, 0, 0, 1, 1,
-0.7671615, 0.180931, -0.6315971, 0, 0, 0, 1, 1,
-0.7649335, -1.127945, -1.870776, 0, 0, 0, 1, 1,
-0.7630349, 1.64653, -1.135468, 0, 0, 0, 1, 1,
-0.762102, 0.7588717, -2.683624, 0, 0, 0, 1, 1,
-0.7521352, 0.1276494, -2.361961, 0, 0, 0, 1, 1,
-0.7506594, -0.5910849, -3.715067, 0, 0, 0, 1, 1,
-0.7384065, 0.2428776, -1.460867, 1, 1, 1, 1, 1,
-0.7354478, 1.271268, -0.9982414, 1, 1, 1, 1, 1,
-0.733206, -2.007751, -4.095835, 1, 1, 1, 1, 1,
-0.7329499, -0.134306, -2.338814, 1, 1, 1, 1, 1,
-0.7267915, 0.4180389, -0.5071538, 1, 1, 1, 1, 1,
-0.7238245, -0.4038124, -0.5729257, 1, 1, 1, 1, 1,
-0.7232184, -0.5786656, -3.15943, 1, 1, 1, 1, 1,
-0.7194446, 1.845125, -1.329755, 1, 1, 1, 1, 1,
-0.7174879, 0.7277699, -1.62291, 1, 1, 1, 1, 1,
-0.711345, -0.7134055, -2.733966, 1, 1, 1, 1, 1,
-0.7105724, -0.1569068, -1.574988, 1, 1, 1, 1, 1,
-0.7098117, -0.5991783, -3.093806, 1, 1, 1, 1, 1,
-0.7077315, -0.05790949, -2.556854, 1, 1, 1, 1, 1,
-0.7003878, 0.6988766, 0.9765054, 1, 1, 1, 1, 1,
-0.7000066, -1.229647, -2.460757, 1, 1, 1, 1, 1,
-0.696415, -0.04415886, -0.5876768, 0, 0, 1, 1, 1,
-0.6961138, 0.501651, -1.148618, 1, 0, 0, 1, 1,
-0.6890924, -2.363842, -2.657345, 1, 0, 0, 1, 1,
-0.689039, -0.5942623, -1.054993, 1, 0, 0, 1, 1,
-0.6871745, 0.152257, -2.144973, 1, 0, 0, 1, 1,
-0.6855538, -1.357816, -2.451973, 1, 0, 0, 1, 1,
-0.6834784, 1.724798, 1.71088, 0, 0, 0, 1, 1,
-0.6789345, -0.5370804, -1.757536, 0, 0, 0, 1, 1,
-0.6773735, -0.3636144, -1.528031, 0, 0, 0, 1, 1,
-0.6727227, -0.01886297, -1.488548, 0, 0, 0, 1, 1,
-0.6716366, 1.013707, -0.2997529, 0, 0, 0, 1, 1,
-0.6715106, -1.042295, -2.281588, 0, 0, 0, 1, 1,
-0.6703504, 1.321746, -2.026782, 0, 0, 0, 1, 1,
-0.6664322, 0.1992308, -1.566564, 1, 1, 1, 1, 1,
-0.6651426, -1.057215, -2.566551, 1, 1, 1, 1, 1,
-0.6647936, 0.7788625, -0.9767222, 1, 1, 1, 1, 1,
-0.6643056, -1.543312, -1.687996, 1, 1, 1, 1, 1,
-0.6626796, -0.5065203, -0.3718775, 1, 1, 1, 1, 1,
-0.6619881, 0.1448603, -1.642295, 1, 1, 1, 1, 1,
-0.6526858, 2.58643, 0.1399141, 1, 1, 1, 1, 1,
-0.6522121, -1.273703, -1.725286, 1, 1, 1, 1, 1,
-0.6515782, 1.950214, -0.8167847, 1, 1, 1, 1, 1,
-0.648645, -1.259574, -2.327818, 1, 1, 1, 1, 1,
-0.6428046, -1.071538, -0.6810235, 1, 1, 1, 1, 1,
-0.6403185, -0.5991792, -1.51871, 1, 1, 1, 1, 1,
-0.6395385, -0.5853247, -1.964441, 1, 1, 1, 1, 1,
-0.6325445, -0.04195851, -2.969005, 1, 1, 1, 1, 1,
-0.627187, 0.9702523, -0.762772, 1, 1, 1, 1, 1,
-0.6214347, 0.8831549, 1.696773, 0, 0, 1, 1, 1,
-0.6144943, 0.1960183, -0.3211502, 1, 0, 0, 1, 1,
-0.6133578, -1.172743, -4.006244, 1, 0, 0, 1, 1,
-0.6098239, -0.8595487, -4.244836, 1, 0, 0, 1, 1,
-0.6077819, -0.7996023, -3.050193, 1, 0, 0, 1, 1,
-0.6054505, -1.445763, -2.803983, 1, 0, 0, 1, 1,
-0.6030035, 0.3059485, -1.751269, 0, 0, 0, 1, 1,
-0.6027123, 0.8200779, -1.389978, 0, 0, 0, 1, 1,
-0.5994248, -1.081878, -1.953021, 0, 0, 0, 1, 1,
-0.5961635, 0.6916838, -1.220829, 0, 0, 0, 1, 1,
-0.5936596, -1.736921, -1.330114, 0, 0, 0, 1, 1,
-0.593549, -0.4049685, -2.781478, 0, 0, 0, 1, 1,
-0.5918957, 0.8004643, -0.7960495, 0, 0, 0, 1, 1,
-0.5904458, 0.1762605, -0.1386649, 1, 1, 1, 1, 1,
-0.5864914, -0.5768468, -3.050033, 1, 1, 1, 1, 1,
-0.5852469, 0.3181945, -0.7652308, 1, 1, 1, 1, 1,
-0.5831646, 2.405205, 1.429117, 1, 1, 1, 1, 1,
-0.5830544, 1.730972, 0.07727761, 1, 1, 1, 1, 1,
-0.58291, -0.1500259, -2.789209, 1, 1, 1, 1, 1,
-0.5817516, -0.4305697, -3.879387, 1, 1, 1, 1, 1,
-0.5768717, 1.648614, -0.8077556, 1, 1, 1, 1, 1,
-0.574372, -0.6597389, -1.603794, 1, 1, 1, 1, 1,
-0.5717344, -1.107148, -2.131484, 1, 1, 1, 1, 1,
-0.5694565, 0.1763982, -0.723459, 1, 1, 1, 1, 1,
-0.5689937, 0.07569899, -1.099833, 1, 1, 1, 1, 1,
-0.5681187, 0.332028, -0.4162257, 1, 1, 1, 1, 1,
-0.566668, -0.8427711, -3.043742, 1, 1, 1, 1, 1,
-0.5593159, 0.7306861, -1.687889, 1, 1, 1, 1, 1,
-0.5551339, -2.593857, -1.500449, 0, 0, 1, 1, 1,
-0.5507121, 0.128993, -2.363608, 1, 0, 0, 1, 1,
-0.550252, -0.9049049, -2.092505, 1, 0, 0, 1, 1,
-0.5493777, -0.07982345, -1.376836, 1, 0, 0, 1, 1,
-0.5485878, -1.270691, -2.457816, 1, 0, 0, 1, 1,
-0.5470175, 0.2880282, -2.098163, 1, 0, 0, 1, 1,
-0.5458232, -0.1347932, -1.655598, 0, 0, 0, 1, 1,
-0.5457841, -0.2031277, -1.711867, 0, 0, 0, 1, 1,
-0.5425651, -1.199887, -2.635772, 0, 0, 0, 1, 1,
-0.5419974, 0.1100686, -0.983593, 0, 0, 0, 1, 1,
-0.5370981, 1.221325, -0.6890413, 0, 0, 0, 1, 1,
-0.533852, 0.6963503, -0.762297, 0, 0, 0, 1, 1,
-0.5333841, 0.6220096, -1.895642, 0, 0, 0, 1, 1,
-0.5330425, -0.5943645, -2.011217, 1, 1, 1, 1, 1,
-0.5324857, -0.2561818, -2.776213, 1, 1, 1, 1, 1,
-0.5274535, 0.5554552, -0.3025166, 1, 1, 1, 1, 1,
-0.5253891, -2.417253, -2.538343, 1, 1, 1, 1, 1,
-0.525272, 0.5820036, -2.368398, 1, 1, 1, 1, 1,
-0.5240605, 0.2146749, -2.184285, 1, 1, 1, 1, 1,
-0.5230604, 0.9257419, -0.2472812, 1, 1, 1, 1, 1,
-0.5156526, 1.850588, 0.4831749, 1, 1, 1, 1, 1,
-0.5142986, 1.30645, -1.316875, 1, 1, 1, 1, 1,
-0.5132704, -0.05501482, -0.54299, 1, 1, 1, 1, 1,
-0.5113218, -0.3598207, -0.6386987, 1, 1, 1, 1, 1,
-0.5082074, 0.1570626, -1.387026, 1, 1, 1, 1, 1,
-0.5008265, 0.07888681, -2.283908, 1, 1, 1, 1, 1,
-0.5007829, -0.3985325, -2.647283, 1, 1, 1, 1, 1,
-0.4993581, -0.09237061, -2.059188, 1, 1, 1, 1, 1,
-0.4968833, 0.1582003, -2.500332, 0, 0, 1, 1, 1,
-0.4966223, 0.2133663, -0.6258119, 1, 0, 0, 1, 1,
-0.4965952, 1.153495, 0.04838951, 1, 0, 0, 1, 1,
-0.4948298, 0.6521829, -1.452386, 1, 0, 0, 1, 1,
-0.4926718, 1.897864, 0.3569264, 1, 0, 0, 1, 1,
-0.4908208, -0.9949148, -2.162427, 1, 0, 0, 1, 1,
-0.4901995, 0.05853659, -2.147158, 0, 0, 0, 1, 1,
-0.4896588, -2.503526, -1.940343, 0, 0, 0, 1, 1,
-0.4865242, 0.2721502, -1.700624, 0, 0, 0, 1, 1,
-0.4865027, -0.5552716, -0.9349458, 0, 0, 0, 1, 1,
-0.4825732, 0.2665308, -0.522152, 0, 0, 0, 1, 1,
-0.4804353, 0.6002698, 0.3174688, 0, 0, 0, 1, 1,
-0.4800248, 1.094661, -0.03211254, 0, 0, 0, 1, 1,
-0.475571, 0.9241012, 0.1929214, 1, 1, 1, 1, 1,
-0.473693, 3.19978, 0.7321776, 1, 1, 1, 1, 1,
-0.4711794, -1.328217, -0.6706935, 1, 1, 1, 1, 1,
-0.4665075, 1.006536, -0.3513753, 1, 1, 1, 1, 1,
-0.4664398, 0.7993394, 1.123787, 1, 1, 1, 1, 1,
-0.4639585, 0.3690904, -0.1851282, 1, 1, 1, 1, 1,
-0.4586994, -1.643729, -1.235608, 1, 1, 1, 1, 1,
-0.4585283, -0.08397874, -3.737729, 1, 1, 1, 1, 1,
-0.4579509, -0.3140839, -1.390435, 1, 1, 1, 1, 1,
-0.4569151, 1.559711, -1.747341, 1, 1, 1, 1, 1,
-0.4565495, 2.037043, -1.238179, 1, 1, 1, 1, 1,
-0.4503597, -1.394515, -2.433672, 1, 1, 1, 1, 1,
-0.4474851, -0.7022028, -4.280604, 1, 1, 1, 1, 1,
-0.4465306, 1.22948, -1.189068, 1, 1, 1, 1, 1,
-0.4440434, 0.6558117, -0.828403, 1, 1, 1, 1, 1,
-0.4375906, -1.148512, -1.143388, 0, 0, 1, 1, 1,
-0.428377, -0.8639152, -4.250717, 1, 0, 0, 1, 1,
-0.4264381, -0.6065546, -1.070119, 1, 0, 0, 1, 1,
-0.4250095, -0.6283985, -2.460623, 1, 0, 0, 1, 1,
-0.42449, 0.4626728, -0.7209136, 1, 0, 0, 1, 1,
-0.4236369, 0.1380142, -0.4206455, 1, 0, 0, 1, 1,
-0.4233561, -0.159925, -1.501322, 0, 0, 0, 1, 1,
-0.421456, 0.6665131, -0.2710572, 0, 0, 0, 1, 1,
-0.4208602, -0.2230476, -0.7878263, 0, 0, 0, 1, 1,
-0.4206827, 0.6804864, -1.863576, 0, 0, 0, 1, 1,
-0.4203991, 0.02946171, -1.693831, 0, 0, 0, 1, 1,
-0.4188917, 0.4118367, -0.6220145, 0, 0, 0, 1, 1,
-0.4174618, 0.310796, -1.320569, 0, 0, 0, 1, 1,
-0.4125314, -1.45443, -2.444555, 1, 1, 1, 1, 1,
-0.4086799, -0.7324549, -3.291937, 1, 1, 1, 1, 1,
-0.4083918, -2.165789, -4.720659, 1, 1, 1, 1, 1,
-0.4028126, -0.2475923, -2.112691, 1, 1, 1, 1, 1,
-0.401505, -0.5159888, -2.482909, 1, 1, 1, 1, 1,
-0.3943909, 1.060738, -1.140784, 1, 1, 1, 1, 1,
-0.3920636, 0.5055416, -0.8930268, 1, 1, 1, 1, 1,
-0.3871406, 2.169881, -0.3928916, 1, 1, 1, 1, 1,
-0.3857806, 1.772748, 1.420839, 1, 1, 1, 1, 1,
-0.38497, -0.5611821, -3.751963, 1, 1, 1, 1, 1,
-0.3814746, -1.677849, -3.323991, 1, 1, 1, 1, 1,
-0.3809357, -0.3898269, -2.430892, 1, 1, 1, 1, 1,
-0.380686, -0.4220227, -3.827556, 1, 1, 1, 1, 1,
-0.3777278, 2.639393, -1.291291, 1, 1, 1, 1, 1,
-0.376123, -0.4080566, -1.2226, 1, 1, 1, 1, 1,
-0.3721492, -0.08464485, 0.4033422, 0, 0, 1, 1, 1,
-0.3693828, 0.01092258, -3.5364, 1, 0, 0, 1, 1,
-0.3693001, -0.01356932, -1.080949, 1, 0, 0, 1, 1,
-0.3685231, 0.5704275, 0.1444582, 1, 0, 0, 1, 1,
-0.3599103, -1.031845, -1.860152, 1, 0, 0, 1, 1,
-0.3568621, 0.6978772, 0.6746258, 1, 0, 0, 1, 1,
-0.3565247, -0.6612368, -1.447167, 0, 0, 0, 1, 1,
-0.348752, -1.559142, -2.243417, 0, 0, 0, 1, 1,
-0.3479209, -0.06228794, 0.3519694, 0, 0, 0, 1, 1,
-0.3391008, -1.454654, -2.874283, 0, 0, 0, 1, 1,
-0.3315855, -0.3667879, -1.96171, 0, 0, 0, 1, 1,
-0.3304223, 0.109571, 0.3007546, 0, 0, 0, 1, 1,
-0.3286895, -1.775244, -1.809916, 0, 0, 0, 1, 1,
-0.3270882, -1.37121, -2.611244, 1, 1, 1, 1, 1,
-0.3257824, -2.562344, -2.105565, 1, 1, 1, 1, 1,
-0.3250565, 0.4853975, -1.43485, 1, 1, 1, 1, 1,
-0.3227771, -0.2567427, -0.4251969, 1, 1, 1, 1, 1,
-0.3222174, -0.2810039, -2.655013, 1, 1, 1, 1, 1,
-0.3211237, -0.8227275, -3.694557, 1, 1, 1, 1, 1,
-0.3210875, 0.9486017, 0.5152435, 1, 1, 1, 1, 1,
-0.3158174, -0.6390171, -2.758591, 1, 1, 1, 1, 1,
-0.3110052, 0.6072183, 0.04010598, 1, 1, 1, 1, 1,
-0.3048803, 0.1643278, -1.383724, 1, 1, 1, 1, 1,
-0.302372, 0.8630659, 0.07950309, 1, 1, 1, 1, 1,
-0.3001029, -0.3276611, -1.912051, 1, 1, 1, 1, 1,
-0.2938712, 1.071963, 0.0565192, 1, 1, 1, 1, 1,
-0.29273, 0.5480328, 0.7328297, 1, 1, 1, 1, 1,
-0.2919595, -2.490125, -3.254128, 1, 1, 1, 1, 1,
-0.2886938, 2.416459, 0.7503816, 0, 0, 1, 1, 1,
-0.287858, -0.7226388, -4.05898, 1, 0, 0, 1, 1,
-0.2847043, -0.7956272, -3.877603, 1, 0, 0, 1, 1,
-0.2835068, -0.8427092, -2.493224, 1, 0, 0, 1, 1,
-0.2807094, -0.01300532, 0.06643693, 1, 0, 0, 1, 1,
-0.2758508, 1.356291, -1.136619, 1, 0, 0, 1, 1,
-0.2751269, 0.9301503, -0.3423837, 0, 0, 0, 1, 1,
-0.2735515, -0.970958, -4.48141, 0, 0, 0, 1, 1,
-0.2718765, -0.08094344, -0.5994577, 0, 0, 0, 1, 1,
-0.2713105, -0.2244485, -2.577242, 0, 0, 0, 1, 1,
-0.269727, -0.1233076, -0.0996149, 0, 0, 0, 1, 1,
-0.2640975, 0.3610881, -0.3888586, 0, 0, 0, 1, 1,
-0.2627997, -1.445924, -4.057775, 0, 0, 0, 1, 1,
-0.262172, -1.181885, -3.653872, 1, 1, 1, 1, 1,
-0.2610877, 0.03363064, -2.359584, 1, 1, 1, 1, 1,
-0.260425, -2.014171, -3.074449, 1, 1, 1, 1, 1,
-0.259451, 0.9213877, -2.360738, 1, 1, 1, 1, 1,
-0.2549821, -0.09094388, -1.723091, 1, 1, 1, 1, 1,
-0.2468451, -0.7616056, -1.711434, 1, 1, 1, 1, 1,
-0.2465231, -1.175582, -2.79685, 1, 1, 1, 1, 1,
-0.2430766, 1.749479, -1.430969, 1, 1, 1, 1, 1,
-0.2395572, 0.697085, 0.1128818, 1, 1, 1, 1, 1,
-0.2363521, -1.291243, -2.060978, 1, 1, 1, 1, 1,
-0.2321415, 1.649875, -0.5589067, 1, 1, 1, 1, 1,
-0.2297536, 0.8204105, -0.9243096, 1, 1, 1, 1, 1,
-0.2260871, -1.038543, -1.947727, 1, 1, 1, 1, 1,
-0.2225906, -0.7374086, -2.513054, 1, 1, 1, 1, 1,
-0.2194289, 2.114998, -0.8360383, 1, 1, 1, 1, 1,
-0.2171961, -0.8766041, -0.1088784, 0, 0, 1, 1, 1,
-0.2159053, 1.377084, 1.753641, 1, 0, 0, 1, 1,
-0.2146925, -0.8919927, -4.348409, 1, 0, 0, 1, 1,
-0.2131217, 0.06617073, -1.097431, 1, 0, 0, 1, 1,
-0.2119605, -0.9449694, -4.54718, 1, 0, 0, 1, 1,
-0.2073374, -1.323015, -1.768447, 1, 0, 0, 1, 1,
-0.2041693, 1.18351, 0.641241, 0, 0, 0, 1, 1,
-0.202128, 0.2442396, 0.05343008, 0, 0, 0, 1, 1,
-0.2009683, 0.6327129, -0.5262356, 0, 0, 0, 1, 1,
-0.1978964, 1.183696, 0.7211529, 0, 0, 0, 1, 1,
-0.1966364, 0.9307438, 0.9916621, 0, 0, 0, 1, 1,
-0.1937637, -0.9037595, -3.703578, 0, 0, 0, 1, 1,
-0.1935437, 0.8328972, 0.4816268, 0, 0, 0, 1, 1,
-0.1930135, -0.4868948, -2.276685, 1, 1, 1, 1, 1,
-0.1920522, 0.6130481, -0.4354183, 1, 1, 1, 1, 1,
-0.1866904, 1.808104, -1.69235, 1, 1, 1, 1, 1,
-0.1841652, 1.20247, -0.6624433, 1, 1, 1, 1, 1,
-0.1834608, -1.47225, -2.095197, 1, 1, 1, 1, 1,
-0.1826429, -2.206214, -2.96943, 1, 1, 1, 1, 1,
-0.1813144, 0.5139376, -0.8180164, 1, 1, 1, 1, 1,
-0.1793748, 1.068072, -0.6848662, 1, 1, 1, 1, 1,
-0.1787535, 0.8136051, -0.5709311, 1, 1, 1, 1, 1,
-0.1758887, -1.030556, -0.981885, 1, 1, 1, 1, 1,
-0.1734911, 1.008891, -1.101954, 1, 1, 1, 1, 1,
-0.1679923, 1.394196, 0.2452291, 1, 1, 1, 1, 1,
-0.1670674, -1.011063, -3.814049, 1, 1, 1, 1, 1,
-0.1662717, -0.1237369, -2.708928, 1, 1, 1, 1, 1,
-0.1638106, 0.05139026, 0.7351491, 1, 1, 1, 1, 1,
-0.1612118, 1.07707, 0.5686592, 0, 0, 1, 1, 1,
-0.1583986, -0.2601318, -2.884181, 1, 0, 0, 1, 1,
-0.1551853, 1.153077, -0.6198184, 1, 0, 0, 1, 1,
-0.1548636, -0.1049434, -1.025115, 1, 0, 0, 1, 1,
-0.1537445, -1.658194, -4.309259, 1, 0, 0, 1, 1,
-0.1460788, -0.7319853, -2.970694, 1, 0, 0, 1, 1,
-0.1442636, -0.9703305, -3.794097, 0, 0, 0, 1, 1,
-0.1418363, -1.310245, -3.09441, 0, 0, 0, 1, 1,
-0.1373366, -0.8759443, -5.147121, 0, 0, 0, 1, 1,
-0.1320368, 0.3214183, 0.03151822, 0, 0, 0, 1, 1,
-0.1282727, -1.000163, -4.412476, 0, 0, 0, 1, 1,
-0.1277439, 0.5517048, -0.9155033, 0, 0, 0, 1, 1,
-0.1276902, 0.1463769, -0.03395482, 0, 0, 0, 1, 1,
-0.1222351, -0.5571054, -3.258428, 1, 1, 1, 1, 1,
-0.1195199, 1.514577, -1.13905, 1, 1, 1, 1, 1,
-0.1186593, -0.1053011, -1.614795, 1, 1, 1, 1, 1,
-0.1182302, -1.610353, -2.29049, 1, 1, 1, 1, 1,
-0.1142944, 0.510497, 0.4913915, 1, 1, 1, 1, 1,
-0.1137799, -0.4095942, -3.704778, 1, 1, 1, 1, 1,
-0.1132002, 0.073557, 0.1670034, 1, 1, 1, 1, 1,
-0.1050645, -0.4173476, -3.954289, 1, 1, 1, 1, 1,
-0.1027769, 0.08822225, -0.7655025, 1, 1, 1, 1, 1,
-0.1008438, -1.417445, -3.383001, 1, 1, 1, 1, 1,
-0.09978093, -0.09348107, -0.97666, 1, 1, 1, 1, 1,
-0.09694454, 0.1561162, -0.9330306, 1, 1, 1, 1, 1,
-0.08956885, -1.060369, -4.330362, 1, 1, 1, 1, 1,
-0.08740342, -0.003590038, -2.437111, 1, 1, 1, 1, 1,
-0.08013387, -1.677648, -2.74058, 1, 1, 1, 1, 1,
-0.07736428, 1.574831, 0.5989401, 0, 0, 1, 1, 1,
-0.07686599, 0.2000235, -0.5146275, 1, 0, 0, 1, 1,
-0.07286482, 1.094153, -1.52011, 1, 0, 0, 1, 1,
-0.07262313, -0.00823772, -1.797914, 1, 0, 0, 1, 1,
-0.05954296, -0.8321804, -3.414616, 1, 0, 0, 1, 1,
-0.05907751, 0.5815131, -0.3185503, 1, 0, 0, 1, 1,
-0.05837611, 1.085966, -1.877492, 0, 0, 0, 1, 1,
-0.05675019, 2.027936, -0.5128894, 0, 0, 0, 1, 1,
-0.05572928, -0.4990857, -2.797213, 0, 0, 0, 1, 1,
-0.05463875, 0.7229065, -0.4027256, 0, 0, 0, 1, 1,
-0.05135639, 0.6547937, 0.8155781, 0, 0, 0, 1, 1,
-0.05065911, -1.940592, -3.867004, 0, 0, 0, 1, 1,
-0.05005051, -1.127335, -3.10887, 0, 0, 0, 1, 1,
-0.04691128, -0.05119656, -2.908875, 1, 1, 1, 1, 1,
-0.04669888, -2.389168, -3.410629, 1, 1, 1, 1, 1,
-0.04551428, 1.140619, 0.3729942, 1, 1, 1, 1, 1,
-0.04273349, -0.7678035, -3.062561, 1, 1, 1, 1, 1,
-0.04210245, 1.374972, -0.3657338, 1, 1, 1, 1, 1,
-0.03893607, 0.2187625, -0.5925654, 1, 1, 1, 1, 1,
-0.0350077, 1.355337, 0.03736307, 1, 1, 1, 1, 1,
-0.02617133, -0.1261809, -2.921837, 1, 1, 1, 1, 1,
-0.02416162, 0.1312732, -1.5625, 1, 1, 1, 1, 1,
-0.02407476, -0.7641367, -3.784382, 1, 1, 1, 1, 1,
-0.0238286, 0.1432367, 0.716997, 1, 1, 1, 1, 1,
-0.02276342, 0.8703424, -0.374257, 1, 1, 1, 1, 1,
-0.01717225, -0.05566457, -3.203902, 1, 1, 1, 1, 1,
-0.009008832, 0.6453142, -0.1193261, 1, 1, 1, 1, 1,
-0.00852587, -0.1012494, -4.646616, 1, 1, 1, 1, 1,
-0.007505191, 0.8642095, 2.714515, 0, 0, 1, 1, 1,
-0.001736616, 0.9167146, 0.7743928, 1, 0, 0, 1, 1,
-0.0009370871, -1.143527, -2.169425, 1, 0, 0, 1, 1,
0.001652851, -0.3982017, 4.997238, 1, 0, 0, 1, 1,
0.003009081, 1.125154, -0.04032593, 1, 0, 0, 1, 1,
0.006296586, 0.6895368, 0.4058572, 1, 0, 0, 1, 1,
0.008592125, 0.8899415, -1.60176, 0, 0, 0, 1, 1,
0.01101051, 1.549938, -0.3603451, 0, 0, 0, 1, 1,
0.01103617, 0.4482448, -0.4342882, 0, 0, 0, 1, 1,
0.01166211, -0.6337184, 2.461062, 0, 0, 0, 1, 1,
0.01487416, 0.7448018, 0.009516211, 0, 0, 0, 1, 1,
0.01969137, -0.0843666, 4.436726, 0, 0, 0, 1, 1,
0.02481887, -0.4362838, 3.467916, 0, 0, 0, 1, 1,
0.02586994, -1.44482, 2.344717, 1, 1, 1, 1, 1,
0.02663171, 0.33406, 0.3661683, 1, 1, 1, 1, 1,
0.02908783, -0.4417996, 3.759168, 1, 1, 1, 1, 1,
0.02949655, -0.8277243, 2.981798, 1, 1, 1, 1, 1,
0.03014421, 1.094398, 0.578103, 1, 1, 1, 1, 1,
0.0308728, -0.3044742, 2.776223, 1, 1, 1, 1, 1,
0.03296672, -0.8948778, 5.162117, 1, 1, 1, 1, 1,
0.03921537, -0.677384, 3.509127, 1, 1, 1, 1, 1,
0.04140878, 0.00634575, 1.003009, 1, 1, 1, 1, 1,
0.04704343, -0.2632836, 3.211106, 1, 1, 1, 1, 1,
0.04759461, 0.3630485, -1.456301, 1, 1, 1, 1, 1,
0.0513436, 2.079636, 0.4482861, 1, 1, 1, 1, 1,
0.05279616, -0.7232414, 3.826338, 1, 1, 1, 1, 1,
0.0584608, -0.3024843, 2.92067, 1, 1, 1, 1, 1,
0.06291186, -1.130624, 3.574646, 1, 1, 1, 1, 1,
0.06736349, 1.07475, 0.6468998, 0, 0, 1, 1, 1,
0.06892714, 0.8591213, -0.2911252, 1, 0, 0, 1, 1,
0.06953422, -0.4939293, 2.64017, 1, 0, 0, 1, 1,
0.07077064, -0.5780835, 2.83528, 1, 0, 0, 1, 1,
0.0710255, 0.8794836, 0.6081395, 1, 0, 0, 1, 1,
0.07648253, 0.9282975, 1.500938, 1, 0, 0, 1, 1,
0.07704999, 0.4377455, -0.3630801, 0, 0, 0, 1, 1,
0.08369148, 1.173722, -0.7815531, 0, 0, 0, 1, 1,
0.08413162, 1.663564, -0.4406908, 0, 0, 0, 1, 1,
0.08474506, -0.7699088, 2.007421, 0, 0, 0, 1, 1,
0.0880839, 1.526772, 1.044338, 0, 0, 0, 1, 1,
0.09001729, 0.7295773, 0.9107576, 0, 0, 0, 1, 1,
0.0937513, -2.270981, 3.536798, 0, 0, 0, 1, 1,
0.09400278, -0.07525917, 1.853869, 1, 1, 1, 1, 1,
0.09476146, 0.3278283, -1.288583, 1, 1, 1, 1, 1,
0.1003694, -0.6389404, 2.754103, 1, 1, 1, 1, 1,
0.1016044, -0.3217557, 1.843325, 1, 1, 1, 1, 1,
0.1039567, 0.2640001, 1.209204, 1, 1, 1, 1, 1,
0.1081878, 0.7947886, 0.3778017, 1, 1, 1, 1, 1,
0.1109149, -0.5654942, 3.540303, 1, 1, 1, 1, 1,
0.1178146, -1.54755, 2.77396, 1, 1, 1, 1, 1,
0.1256559, -0.5040342, 1.1254, 1, 1, 1, 1, 1,
0.1260708, 1.093605, 1.72595, 1, 1, 1, 1, 1,
0.1286966, -1.703141, 4.568619, 1, 1, 1, 1, 1,
0.1331766, -0.8892461, 2.225642, 1, 1, 1, 1, 1,
0.1361239, 0.4895599, 1.832214, 1, 1, 1, 1, 1,
0.1371663, -1.304703, 1.583893, 1, 1, 1, 1, 1,
0.1454425, 0.5689953, -0.1891626, 1, 1, 1, 1, 1,
0.1481775, 1.134182, -1.500156, 0, 0, 1, 1, 1,
0.1489777, 1.717404, 0.1164595, 1, 0, 0, 1, 1,
0.1529224, 0.9344847, -0.5241014, 1, 0, 0, 1, 1,
0.1548427, -0.3026038, 1.679434, 1, 0, 0, 1, 1,
0.161858, 0.2985379, 0.1735888, 1, 0, 0, 1, 1,
0.164603, -1.1402, 3.533998, 1, 0, 0, 1, 1,
0.1648677, -0.8450274, 2.419447, 0, 0, 0, 1, 1,
0.1673687, 0.8089913, 0.9083456, 0, 0, 0, 1, 1,
0.1698346, -0.3398174, 1.857573, 0, 0, 0, 1, 1,
0.1705841, 0.9891169, 0.690389, 0, 0, 0, 1, 1,
0.1707509, -0.5948732, 4.341221, 0, 0, 0, 1, 1,
0.1726195, 1.077158, -0.3356152, 0, 0, 0, 1, 1,
0.1739366, -0.4147345, 2.296588, 0, 0, 0, 1, 1,
0.174066, -0.3613524, 4.822222, 1, 1, 1, 1, 1,
0.1748347, 1.066762, -0.0860298, 1, 1, 1, 1, 1,
0.175147, 0.3035433, -0.1026348, 1, 1, 1, 1, 1,
0.1807158, 0.1916652, -0.4043118, 1, 1, 1, 1, 1,
0.1882031, 0.849115, -0.2089608, 1, 1, 1, 1, 1,
0.1920716, 0.7966082, 2.740494, 1, 1, 1, 1, 1,
0.1977869, -0.2417123, 1.925925, 1, 1, 1, 1, 1,
0.1985962, 2.824584, 0.1125552, 1, 1, 1, 1, 1,
0.1993861, 0.6024975, -0.8033752, 1, 1, 1, 1, 1,
0.2015796, -0.2548547, 2.969307, 1, 1, 1, 1, 1,
0.2027279, -0.09755906, 1.760373, 1, 1, 1, 1, 1,
0.2033218, 0.6450123, 2.147571, 1, 1, 1, 1, 1,
0.2034996, 0.003108404, 1.195157, 1, 1, 1, 1, 1,
0.2053391, 0.9257888, -0.3654116, 1, 1, 1, 1, 1,
0.2106256, -0.5189756, 2.92109, 1, 1, 1, 1, 1,
0.2116719, 0.7680382, -1.673973, 0, 0, 1, 1, 1,
0.2141889, 2.586489, -0.2988136, 1, 0, 0, 1, 1,
0.2235901, -0.2622517, 5.870767, 1, 0, 0, 1, 1,
0.2249674, 1.250764, 0.6530916, 1, 0, 0, 1, 1,
0.2278039, 0.2391432, -0.7249307, 1, 0, 0, 1, 1,
0.2284071, -0.5283668, 1.519768, 1, 0, 0, 1, 1,
0.230858, 0.7124914, 0.3052983, 0, 0, 0, 1, 1,
0.2332644, 1.157152, 0.6815583, 0, 0, 0, 1, 1,
0.2335721, 2.1843, -0.061563, 0, 0, 0, 1, 1,
0.2372253, 1.784355, 0.6874501, 0, 0, 0, 1, 1,
0.2384935, 0.7895394, -0.4980002, 0, 0, 0, 1, 1,
0.2405479, 0.1307179, 0.1033071, 0, 0, 0, 1, 1,
0.2415372, 0.3483098, 3.856359, 0, 0, 0, 1, 1,
0.24179, -1.350327, 3.541746, 1, 1, 1, 1, 1,
0.242171, 0.7126124, 0.2087353, 1, 1, 1, 1, 1,
0.246348, 0.2427883, -0.2303713, 1, 1, 1, 1, 1,
0.2480526, 0.1350047, -0.2122409, 1, 1, 1, 1, 1,
0.2505552, 0.8721913, 0.5059534, 1, 1, 1, 1, 1,
0.25107, -0.2715494, 1.51741, 1, 1, 1, 1, 1,
0.253539, 0.4815499, 1.746156, 1, 1, 1, 1, 1,
0.2544048, 2.127779, 2.558056, 1, 1, 1, 1, 1,
0.2561623, 1.059487, 1.63153, 1, 1, 1, 1, 1,
0.2561842, -0.8145608, 1.991328, 1, 1, 1, 1, 1,
0.2597643, -0.6900524, 3.214854, 1, 1, 1, 1, 1,
0.2618561, -0.3257129, 2.688951, 1, 1, 1, 1, 1,
0.2694215, -1.273235, 3.263446, 1, 1, 1, 1, 1,
0.2705314, -0.9030319, 3.435272, 1, 1, 1, 1, 1,
0.2711313, 0.2613404, 0.3783541, 1, 1, 1, 1, 1,
0.27123, -0.6265645, 2.61995, 0, 0, 1, 1, 1,
0.2767468, -0.6168994, 0.8038291, 1, 0, 0, 1, 1,
0.279306, 1.038193, -0.7385037, 1, 0, 0, 1, 1,
0.2842664, -0.3249112, 2.982559, 1, 0, 0, 1, 1,
0.2850828, 0.665942, 0.3575429, 1, 0, 0, 1, 1,
0.2863981, 0.3580041, 0.2177894, 1, 0, 0, 1, 1,
0.2908573, -0.2923634, 2.171298, 0, 0, 0, 1, 1,
0.294212, 1.771602, -1.814656, 0, 0, 0, 1, 1,
0.2945921, 1.684147, -1.144318, 0, 0, 0, 1, 1,
0.2988258, 0.7691295, 1.73919, 0, 0, 0, 1, 1,
0.3009751, 0.7583716, 0.5722547, 0, 0, 0, 1, 1,
0.3031177, 0.7156042, -0.6806211, 0, 0, 0, 1, 1,
0.3038826, 0.547368, -0.4340094, 0, 0, 0, 1, 1,
0.3063504, 2.241639, 0.2479076, 1, 1, 1, 1, 1,
0.3091902, 0.4173901, -0.3340302, 1, 1, 1, 1, 1,
0.3109221, -1.34597, 3.017234, 1, 1, 1, 1, 1,
0.3115565, -1.70839, 1.897475, 1, 1, 1, 1, 1,
0.3126434, -0.7306671, 0.3244267, 1, 1, 1, 1, 1,
0.3150872, 0.8176287, -1.050435, 1, 1, 1, 1, 1,
0.3160213, -0.6053267, 3.272882, 1, 1, 1, 1, 1,
0.3183551, 0.7415377, -0.5115604, 1, 1, 1, 1, 1,
0.3190481, -0.3539339, 3.246453, 1, 1, 1, 1, 1,
0.3197421, -0.8640988, -0.1285709, 1, 1, 1, 1, 1,
0.3198155, 0.6473015, 0.7076926, 1, 1, 1, 1, 1,
0.3218452, 1.125073, 0.9558725, 1, 1, 1, 1, 1,
0.3221161, 0.6301297, -0.1080552, 1, 1, 1, 1, 1,
0.3241185, 0.1302543, 2.598579, 1, 1, 1, 1, 1,
0.3289696, 0.3609029, 0.4362898, 1, 1, 1, 1, 1,
0.3312534, -0.8743965, 4.901487, 0, 0, 1, 1, 1,
0.3319502, -0.8079852, 2.833443, 1, 0, 0, 1, 1,
0.3341592, 0.311392, 2.129425, 1, 0, 0, 1, 1,
0.3351084, -0.01826048, 2.217649, 1, 0, 0, 1, 1,
0.337986, -0.1222561, 2.637964, 1, 0, 0, 1, 1,
0.3390928, -0.3809468, 2.142642, 1, 0, 0, 1, 1,
0.3420469, 0.04082886, 2.119396, 0, 0, 0, 1, 1,
0.3453152, -0.8049313, 1.391003, 0, 0, 0, 1, 1,
0.3502256, -0.2238238, 2.72216, 0, 0, 0, 1, 1,
0.3540666, 1.245069, 0.7374326, 0, 0, 0, 1, 1,
0.3545885, 1.141729, 2.173911, 0, 0, 0, 1, 1,
0.3566911, -1.289168, 2.340047, 0, 0, 0, 1, 1,
0.3596232, 0.4994597, -0.7330211, 0, 0, 0, 1, 1,
0.3599201, 2.280221, 0.8916144, 1, 1, 1, 1, 1,
0.3615386, 0.3091437, 2.492411, 1, 1, 1, 1, 1,
0.3752343, -0.6854563, 2.627753, 1, 1, 1, 1, 1,
0.3770082, -1.532744, 3.619773, 1, 1, 1, 1, 1,
0.3846872, -0.5133555, 2.572569, 1, 1, 1, 1, 1,
0.3860277, 2.358084, 0.422163, 1, 1, 1, 1, 1,
0.3863412, -0.2034539, 3.94607, 1, 1, 1, 1, 1,
0.3887994, -1.228528, 2.384241, 1, 1, 1, 1, 1,
0.3978937, 0.3241442, -0.796451, 1, 1, 1, 1, 1,
0.3994073, -0.3630456, 2.566835, 1, 1, 1, 1, 1,
0.4009767, 0.6229459, 0.4722029, 1, 1, 1, 1, 1,
0.4077525, 0.4493524, -0.6538838, 1, 1, 1, 1, 1,
0.408035, -0.7043132, 2.592464, 1, 1, 1, 1, 1,
0.4098811, -0.4312344, -0.003728409, 1, 1, 1, 1, 1,
0.4102038, 1.87497, -2.003335, 1, 1, 1, 1, 1,
0.413067, -0.04623628, 1.151274, 0, 0, 1, 1, 1,
0.4138175, -0.2902406, 2.345936, 1, 0, 0, 1, 1,
0.4148336, 0.5654274, 0.865867, 1, 0, 0, 1, 1,
0.4160782, -0.01863673, 0.4744008, 1, 0, 0, 1, 1,
0.4161647, 1.408153, -0.1155422, 1, 0, 0, 1, 1,
0.4217505, 1.237783, 0.04642667, 1, 0, 0, 1, 1,
0.4239622, -0.1506484, 1.364727, 0, 0, 0, 1, 1,
0.4347821, 0.8925784, 0.7396266, 0, 0, 0, 1, 1,
0.4457121, -0.6039616, 1.081034, 0, 0, 0, 1, 1,
0.4470011, 0.1835406, 0.8591115, 0, 0, 0, 1, 1,
0.4474524, -0.3889184, 1.386957, 0, 0, 0, 1, 1,
0.4487328, -1.558584, 1.85479, 0, 0, 0, 1, 1,
0.4555844, -0.5018551, 2.154613, 0, 0, 0, 1, 1,
0.4576631, 0.3319335, 0.2170268, 1, 1, 1, 1, 1,
0.4578435, 0.08726379, 2.011267, 1, 1, 1, 1, 1,
0.4595916, 0.4077602, 1.186901, 1, 1, 1, 1, 1,
0.4669086, 0.9341952, 1.674421, 1, 1, 1, 1, 1,
0.4692747, 1.178396, 2.515434, 1, 1, 1, 1, 1,
0.4708372, 1.015896, -0.6744697, 1, 1, 1, 1, 1,
0.4742126, 0.4988295, -0.2129623, 1, 1, 1, 1, 1,
0.4756791, -0.5495316, 0.8011026, 1, 1, 1, 1, 1,
0.477437, 0.5380271, 0.1149183, 1, 1, 1, 1, 1,
0.4818018, -0.8025345, 2.268672, 1, 1, 1, 1, 1,
0.4818317, 2.582118, 0.4335257, 1, 1, 1, 1, 1,
0.4950418, 0.4045395, 2.018392, 1, 1, 1, 1, 1,
0.4957678, -0.4408537, 2.704604, 1, 1, 1, 1, 1,
0.4982377, -1.336536, 3.379385, 1, 1, 1, 1, 1,
0.4989238, 0.3662359, 0.1822028, 1, 1, 1, 1, 1,
0.4998242, -0.9903086, 2.648888, 0, 0, 1, 1, 1,
0.4998569, -0.494089, 4.345136, 1, 0, 0, 1, 1,
0.507916, 1.124025, -0.1864113, 1, 0, 0, 1, 1,
0.5106526, -0.8546339, 3.621214, 1, 0, 0, 1, 1,
0.5153828, -1.789502, 1.997416, 1, 0, 0, 1, 1,
0.5164518, -1.11689, 3.920023, 1, 0, 0, 1, 1,
0.5184796, 0.1302183, 1.661332, 0, 0, 0, 1, 1,
0.5209446, -0.3472448, 1.198972, 0, 0, 0, 1, 1,
0.5247238, 1.740368, 0.6792806, 0, 0, 0, 1, 1,
0.5275412, 1.572311, 0.1964696, 0, 0, 0, 1, 1,
0.5293121, 1.876756, -0.1836234, 0, 0, 0, 1, 1,
0.5311624, -0.2896294, 3.530528, 0, 0, 0, 1, 1,
0.5356049, 1.1203, 1.724571, 0, 0, 0, 1, 1,
0.5396204, 0.2253815, 0.7978528, 1, 1, 1, 1, 1,
0.5406983, -0.7665991, 1.746061, 1, 1, 1, 1, 1,
0.5415182, -0.1355217, 0.2641559, 1, 1, 1, 1, 1,
0.5433682, 0.9230896, 0.6467741, 1, 1, 1, 1, 1,
0.5443529, -0.7099682, 4.32403, 1, 1, 1, 1, 1,
0.5452099, -0.5668421, 1.054883, 1, 1, 1, 1, 1,
0.5481466, 0.4223121, -0.4804281, 1, 1, 1, 1, 1,
0.5488457, -1.258841, 2.631691, 1, 1, 1, 1, 1,
0.5546954, -1.689321, 4.185097, 1, 1, 1, 1, 1,
0.5551163, -1.267905, 2.931208, 1, 1, 1, 1, 1,
0.5561125, -1.016118, 1.062359, 1, 1, 1, 1, 1,
0.5566375, -1.777388, 4.122933, 1, 1, 1, 1, 1,
0.5568243, 0.1407207, 1.629735, 1, 1, 1, 1, 1,
0.5575834, -1.874431, 1.307247, 1, 1, 1, 1, 1,
0.563782, -0.9720035, 3.097758, 1, 1, 1, 1, 1,
0.5685394, -0.9325757, 3.087455, 0, 0, 1, 1, 1,
0.5705206, -1.545141, 2.555367, 1, 0, 0, 1, 1,
0.5764273, -1.45468, 2.913989, 1, 0, 0, 1, 1,
0.5766069, 0.9748709, 0.4730526, 1, 0, 0, 1, 1,
0.5775492, -1.285397, 4.249084, 1, 0, 0, 1, 1,
0.5809686, -0.7656559, 2.055326, 1, 0, 0, 1, 1,
0.587521, -1.290138, 2.364823, 0, 0, 0, 1, 1,
0.5894301, -0.911841, 1.19509, 0, 0, 0, 1, 1,
0.5914031, 0.4444956, 0.7520954, 0, 0, 0, 1, 1,
0.5939087, 1.664677, 1.268256, 0, 0, 0, 1, 1,
0.5998823, 0.9335039, 0.4372876, 0, 0, 0, 1, 1,
0.601182, -1.221593, 2.940104, 0, 0, 0, 1, 1,
0.6044936, 1.1951, 0.39122, 0, 0, 0, 1, 1,
0.6073267, -1.396852, 3.951299, 1, 1, 1, 1, 1,
0.6084522, -0.7565365, 1.802308, 1, 1, 1, 1, 1,
0.6110998, 0.1233058, 1.68004, 1, 1, 1, 1, 1,
0.613196, 0.4543206, -0.1120611, 1, 1, 1, 1, 1,
0.6151692, 0.4471507, 0.8249826, 1, 1, 1, 1, 1,
0.6184968, 1.439186, 0.762586, 1, 1, 1, 1, 1,
0.6207483, -0.4657284, 2.760794, 1, 1, 1, 1, 1,
0.6228269, 1.442581, 0.4513516, 1, 1, 1, 1, 1,
0.6235784, -0.7206558, 2.854677, 1, 1, 1, 1, 1,
0.6246178, -0.04501329, 0.2043941, 1, 1, 1, 1, 1,
0.6307026, -1.396419, 3.40147, 1, 1, 1, 1, 1,
0.63135, 0.0247358, 2.801826, 1, 1, 1, 1, 1,
0.6322068, 0.3107135, -0.1761303, 1, 1, 1, 1, 1,
0.6329206, -0.6281701, 1.815306, 1, 1, 1, 1, 1,
0.6392313, 0.8005517, -1.574518, 1, 1, 1, 1, 1,
0.6424977, 0.1019789, 1.626509, 0, 0, 1, 1, 1,
0.6430299, 0.2682175, 1.502441, 1, 0, 0, 1, 1,
0.6446377, -0.1831313, 2.458483, 1, 0, 0, 1, 1,
0.6559148, -0.3593507, 3.054846, 1, 0, 0, 1, 1,
0.6559861, 1.866552, 0.4077405, 1, 0, 0, 1, 1,
0.656163, -0.7240774, 1.801006, 1, 0, 0, 1, 1,
0.6602973, -1.329248, 1.18818, 0, 0, 0, 1, 1,
0.6617712, -0.03074742, 2.438283, 0, 0, 0, 1, 1,
0.6621556, -1.547764, 3.991733, 0, 0, 0, 1, 1,
0.6645633, 0.3269597, 0.7357218, 0, 0, 0, 1, 1,
0.6685737, 0.07288201, 1.652385, 0, 0, 0, 1, 1,
0.6744806, 0.5236712, -0.4298034, 0, 0, 0, 1, 1,
0.6746571, -1.766313, 2.051655, 0, 0, 0, 1, 1,
0.6802948, 0.5395542, 1.40574, 1, 1, 1, 1, 1,
0.681924, 0.1261328, 0.2953801, 1, 1, 1, 1, 1,
0.6822655, -1.034036, 2.698067, 1, 1, 1, 1, 1,
0.685007, 0.4794788, 1.001324, 1, 1, 1, 1, 1,
0.6892899, 0.250893, 0.8222942, 1, 1, 1, 1, 1,
0.6897193, 0.08022188, 1.915844, 1, 1, 1, 1, 1,
0.6931586, -1.52774, 3.600189, 1, 1, 1, 1, 1,
0.694348, -0.9217761, 1.26862, 1, 1, 1, 1, 1,
0.6996406, 0.2793073, 2.042083, 1, 1, 1, 1, 1,
0.7032062, -1.76716, 3.902559, 1, 1, 1, 1, 1,
0.7068639, -0.3443475, 1.655162, 1, 1, 1, 1, 1,
0.7154249, 0.2395645, 1.877492, 1, 1, 1, 1, 1,
0.7199677, -0.05829195, 0.214662, 1, 1, 1, 1, 1,
0.7210735, 0.3807869, 0.3385612, 1, 1, 1, 1, 1,
0.7296213, 0.7544641, 1.42367, 1, 1, 1, 1, 1,
0.7309091, -0.5624395, 2.802801, 0, 0, 1, 1, 1,
0.7312381, -1.360609, 2.106809, 1, 0, 0, 1, 1,
0.7333195, 0.4750879, 2.220667, 1, 0, 0, 1, 1,
0.7348821, -1.186747, 0.2607597, 1, 0, 0, 1, 1,
0.7370586, -0.9545555, 0.7603314, 1, 0, 0, 1, 1,
0.7413882, -1.10642, 2.768846, 1, 0, 0, 1, 1,
0.7431785, 0.8318812, 0.6078157, 0, 0, 0, 1, 1,
0.7437466, -2.023578, 2.101365, 0, 0, 0, 1, 1,
0.7485192, -0.9373083, 3.862844, 0, 0, 0, 1, 1,
0.7520246, -0.0711674, 2.228927, 0, 0, 0, 1, 1,
0.7525781, 0.1235825, 0.415323, 0, 0, 0, 1, 1,
0.7543741, 0.06935072, 1.465664, 0, 0, 0, 1, 1,
0.7546978, -0.7663105, 1.497141, 0, 0, 0, 1, 1,
0.7697926, 0.8296577, -0.8970283, 1, 1, 1, 1, 1,
0.7699109, -1.176856, 1.056025, 1, 1, 1, 1, 1,
0.7747428, -0.933452, 1.364762, 1, 1, 1, 1, 1,
0.7802752, 0.5592501, 0.734719, 1, 1, 1, 1, 1,
0.7852674, 1.586575, -0.3503481, 1, 1, 1, 1, 1,
0.7859911, 0.1087861, 0.2807107, 1, 1, 1, 1, 1,
0.7900204, 1.451751, 0.6631923, 1, 1, 1, 1, 1,
0.7945895, 1.254404, -1.099508, 1, 1, 1, 1, 1,
0.8004404, -0.3002273, 1.739873, 1, 1, 1, 1, 1,
0.8007672, 1.21588, -0.6548086, 1, 1, 1, 1, 1,
0.806636, -0.5564324, 2.869687, 1, 1, 1, 1, 1,
0.8088893, 0.8037327, 0.303378, 1, 1, 1, 1, 1,
0.8098231, -1.04742, 1.74102, 1, 1, 1, 1, 1,
0.8119195, 2.312582, -1.745607, 1, 1, 1, 1, 1,
0.8120995, 1.185152, 0.9933664, 1, 1, 1, 1, 1,
0.8140736, -0.06633427, 0.9365278, 0, 0, 1, 1, 1,
0.8149063, 0.8569978, 1.00939, 1, 0, 0, 1, 1,
0.8176166, 1.747353, 0.4839438, 1, 0, 0, 1, 1,
0.8189099, -0.7461209, 0.6769277, 1, 0, 0, 1, 1,
0.8323347, 0.477129, 0.5220369, 1, 0, 0, 1, 1,
0.8326331, -0.1162241, 1.225006, 1, 0, 0, 1, 1,
0.8326709, -0.9116148, 1.368865, 0, 0, 0, 1, 1,
0.8450652, -0.4716668, 0.7745181, 0, 0, 0, 1, 1,
0.8581458, 1.352895, 1.228024, 0, 0, 0, 1, 1,
0.8581772, 0.2012534, 3.004586, 0, 0, 0, 1, 1,
0.8656015, 1.730828, 1.670915, 0, 0, 0, 1, 1,
0.8658997, -0.5766482, 2.948306, 0, 0, 0, 1, 1,
0.8674888, 0.6290582, 0.5863913, 0, 0, 0, 1, 1,
0.8839761, -0.3867223, 1.374026, 1, 1, 1, 1, 1,
0.8871682, -0.05623896, 1.475895, 1, 1, 1, 1, 1,
0.8907561, 0.06048172, 1.664416, 1, 1, 1, 1, 1,
0.8920287, -0.009671265, 1.033537, 1, 1, 1, 1, 1,
0.8949652, 0.234967, 2.534469, 1, 1, 1, 1, 1,
0.89545, -0.7134062, 0.285067, 1, 1, 1, 1, 1,
0.8956754, -0.05439508, 1.607643, 1, 1, 1, 1, 1,
0.8994333, 0.2682776, -0.1342095, 1, 1, 1, 1, 1,
0.8995104, -0.7754245, 3.871755, 1, 1, 1, 1, 1,
0.9009899, 0.219702, -0.5394944, 1, 1, 1, 1, 1,
0.9028349, 0.2730644, 2.285547, 1, 1, 1, 1, 1,
0.908069, -0.8940927, 1.74242, 1, 1, 1, 1, 1,
0.9164919, 0.4854872, 1.620958, 1, 1, 1, 1, 1,
0.9204258, 0.3144241, 1.528016, 1, 1, 1, 1, 1,
0.923901, -0.8002462, 0.7284405, 1, 1, 1, 1, 1,
0.9542792, 0.7928909, 1.910212, 0, 0, 1, 1, 1,
0.957231, 0.2763966, 2.086023, 1, 0, 0, 1, 1,
0.972017, 2.312081, 1.008279, 1, 0, 0, 1, 1,
0.9748404, -1.616685, 3.199886, 1, 0, 0, 1, 1,
0.9751018, -0.04970709, 1.48688, 1, 0, 0, 1, 1,
0.9774164, -1.302091, 0.7235194, 1, 0, 0, 1, 1,
0.9781392, 0.880033, 0.4627378, 0, 0, 0, 1, 1,
0.9788557, -1.268572, 1.622758, 0, 0, 0, 1, 1,
0.9796669, -0.5516011, 1.996073, 0, 0, 0, 1, 1,
0.9871576, -2.24571, 1.897504, 0, 0, 0, 1, 1,
0.9873443, -1.206661, 2.573259, 0, 0, 0, 1, 1,
0.9918497, 0.07439628, 1.749336, 0, 0, 0, 1, 1,
1.003891, 1.37922, -0.9998756, 0, 0, 0, 1, 1,
1.011126, 0.06966625, 3.044544, 1, 1, 1, 1, 1,
1.012015, 1.312677, -0.3242694, 1, 1, 1, 1, 1,
1.016551, -0.8958511, 3.191284, 1, 1, 1, 1, 1,
1.026123, 2.69513, 2.15383, 1, 1, 1, 1, 1,
1.034355, -1.557061, 3.400078, 1, 1, 1, 1, 1,
1.034536, 0.6918321, -0.2259811, 1, 1, 1, 1, 1,
1.046465, 1.443177, 1.251618, 1, 1, 1, 1, 1,
1.048938, 0.2845151, 0.4974012, 1, 1, 1, 1, 1,
1.050364, -1.051975, 1.95298, 1, 1, 1, 1, 1,
1.051959, -0.8217264, 2.028654, 1, 1, 1, 1, 1,
1.053013, -0.5726745, 1.022488, 1, 1, 1, 1, 1,
1.058666, -0.7908553, 1.596111, 1, 1, 1, 1, 1,
1.060254, -1.164175, 0.7693353, 1, 1, 1, 1, 1,
1.064852, -0.5439286, 0.6454773, 1, 1, 1, 1, 1,
1.081053, 0.5374961, -0.2886475, 1, 1, 1, 1, 1,
1.0848, -0.9333171, 2.491849, 0, 0, 1, 1, 1,
1.088666, 1.674234, 0.2691628, 1, 0, 0, 1, 1,
1.090692, -0.5750814, 2.59076, 1, 0, 0, 1, 1,
1.096414, -0.09748743, 1.496081, 1, 0, 0, 1, 1,
1.096658, 0.6151958, 1.045244, 1, 0, 0, 1, 1,
1.098179, -0.03966365, 0.6946515, 1, 0, 0, 1, 1,
1.101884, 0.7900289, 1.583116, 0, 0, 0, 1, 1,
1.103348, -2.331538, 3.127633, 0, 0, 0, 1, 1,
1.103431, -1.872457, 1.912049, 0, 0, 0, 1, 1,
1.103517, -0.887247, 2.57805, 0, 0, 0, 1, 1,
1.107872, -1.222612, 2.048517, 0, 0, 0, 1, 1,
1.108829, 0.4401102, 0.9215159, 0, 0, 0, 1, 1,
1.111749, 0.3845754, 1.35023, 0, 0, 0, 1, 1,
1.122538, 0.4438818, -0.3926261, 1, 1, 1, 1, 1,
1.145964, -0.6133869, 1.342208, 1, 1, 1, 1, 1,
1.146715, -0.8265836, 2.059835, 1, 1, 1, 1, 1,
1.165841, 0.3484489, -0.473258, 1, 1, 1, 1, 1,
1.170271, 1.642666, 1.629777, 1, 1, 1, 1, 1,
1.18248, -1.149171, 3.269047, 1, 1, 1, 1, 1,
1.189832, 0.1662443, 2.111626, 1, 1, 1, 1, 1,
1.19399, -0.01898672, 1.12307, 1, 1, 1, 1, 1,
1.198982, -0.0973606, 2.117684, 1, 1, 1, 1, 1,
1.209783, 0.07241599, 1.455526, 1, 1, 1, 1, 1,
1.215195, 1.617373, -0.05209681, 1, 1, 1, 1, 1,
1.221772, 0.444206, 0.1709616, 1, 1, 1, 1, 1,
1.227124, -0.2689143, 2.356804, 1, 1, 1, 1, 1,
1.230536, 0.723465, 2.798112, 1, 1, 1, 1, 1,
1.235169, 1.109886, 0.3978773, 1, 1, 1, 1, 1,
1.24843, 0.3282187, 1.900596, 0, 0, 1, 1, 1,
1.255049, -0.496676, 4.391668, 1, 0, 0, 1, 1,
1.256389, -0.5860909, 2.93824, 1, 0, 0, 1, 1,
1.258847, 0.5981442, 0.9629728, 1, 0, 0, 1, 1,
1.260855, 0.3858595, 2.550627, 1, 0, 0, 1, 1,
1.261316, 0.3648806, 1.367342, 1, 0, 0, 1, 1,
1.268231, 1.292532, 0.420619, 0, 0, 0, 1, 1,
1.268761, -0.866454, 3.026156, 0, 0, 0, 1, 1,
1.273927, 0.9704644, -0.4030086, 0, 0, 0, 1, 1,
1.277389, -0.261666, 1.167686, 0, 0, 0, 1, 1,
1.280751, -2.021206, 3.470579, 0, 0, 0, 1, 1,
1.291711, -1.297759, 3.007447, 0, 0, 0, 1, 1,
1.293144, -0.3527855, 2.123341, 0, 0, 0, 1, 1,
1.316396, -0.09314112, 0.6040273, 1, 1, 1, 1, 1,
1.322255, 0.2167351, 0.6868893, 1, 1, 1, 1, 1,
1.325432, 0.6983342, 1.566627, 1, 1, 1, 1, 1,
1.326483, 2.740574, 1.69099, 1, 1, 1, 1, 1,
1.328568, -0.9611943, 1.443692, 1, 1, 1, 1, 1,
1.333765, -2.563312, 1.800522, 1, 1, 1, 1, 1,
1.35078, 0.6864279, 3.523326, 1, 1, 1, 1, 1,
1.353718, 0.2829989, 1.732282, 1, 1, 1, 1, 1,
1.370572, -0.01191763, 2.054653, 1, 1, 1, 1, 1,
1.374154, 0.4524711, 3.053171, 1, 1, 1, 1, 1,
1.389515, 1.042617, 0.1070575, 1, 1, 1, 1, 1,
1.40291, 0.6324525, 1.139518, 1, 1, 1, 1, 1,
1.419868, 0.6810011, 0.4035751, 1, 1, 1, 1, 1,
1.456116, -0.8059427, 2.419022, 1, 1, 1, 1, 1,
1.469998, -1.058066, 1.912528, 1, 1, 1, 1, 1,
1.476451, -0.1059973, 2.078153, 0, 0, 1, 1, 1,
1.480095, 0.1422446, 0.9905419, 1, 0, 0, 1, 1,
1.49081, -0.9521579, 1.331869, 1, 0, 0, 1, 1,
1.498353, -2.639648, 1.637351, 1, 0, 0, 1, 1,
1.503497, -0.641321, 1.54999, 1, 0, 0, 1, 1,
1.5074, 0.7046077, 2.013338, 1, 0, 0, 1, 1,
1.509138, -0.1204083, 1.183765, 0, 0, 0, 1, 1,
1.528285, 0.05216874, 0.3991348, 0, 0, 0, 1, 1,
1.530645, -1.836164, 2.588924, 0, 0, 0, 1, 1,
1.546385, -0.09900308, 2.553636, 0, 0, 0, 1, 1,
1.548454, 1.314707, 0.4513155, 0, 0, 0, 1, 1,
1.549855, -0.09072244, 2.397143, 0, 0, 0, 1, 1,
1.554792, -0.2702232, 1.331993, 0, 0, 0, 1, 1,
1.555366, 1.278561, 0.3187065, 1, 1, 1, 1, 1,
1.556901, 1.116232, 1.725774, 1, 1, 1, 1, 1,
1.584574, -1.39309, 0.6058862, 1, 1, 1, 1, 1,
1.586782, -0.7815642, 2.131649, 1, 1, 1, 1, 1,
1.591063, -1.934568, 0.8699898, 1, 1, 1, 1, 1,
1.594447, 1.202573, 1.498001, 1, 1, 1, 1, 1,
1.597189, -0.6931931, 2.334901, 1, 1, 1, 1, 1,
1.604105, 1.199087, 1.03066, 1, 1, 1, 1, 1,
1.650969, 0.5704539, 0.5066254, 1, 1, 1, 1, 1,
1.652555, -0.3022925, 1.76556, 1, 1, 1, 1, 1,
1.673076, 0.9891933, 3.119304, 1, 1, 1, 1, 1,
1.675035, 0.2910283, 1.820899, 1, 1, 1, 1, 1,
1.675718, -0.9917564, 1.515968, 1, 1, 1, 1, 1,
1.678971, 0.6496547, 2.576535, 1, 1, 1, 1, 1,
1.689626, -0.8143889, 2.862499, 1, 1, 1, 1, 1,
1.692373, 0.3846283, 0.4522981, 0, 0, 1, 1, 1,
1.699955, 0.3086443, -0.4443483, 1, 0, 0, 1, 1,
1.70713, 0.4833518, 0.3013741, 1, 0, 0, 1, 1,
1.734509, 0.6804076, 1.467271, 1, 0, 0, 1, 1,
1.753662, -0.07652406, 1.086061, 1, 0, 0, 1, 1,
1.757588, 0.5189598, 1.165414, 1, 0, 0, 1, 1,
1.800587, 1.045781, 3.977477, 0, 0, 0, 1, 1,
1.805132, 0.8372086, 2.719926, 0, 0, 0, 1, 1,
1.835151, 0.625163, 1.266434, 0, 0, 0, 1, 1,
1.848064, -1.164846, 1.400445, 0, 0, 0, 1, 1,
1.855525, -0.7524791, 0.7630497, 0, 0, 0, 1, 1,
1.869513, 0.6250836, 2.948555, 0, 0, 0, 1, 1,
1.87167, -0.06245972, 0.8257053, 0, 0, 0, 1, 1,
1.900218, -2.075239, 2.108539, 1, 1, 1, 1, 1,
1.901651, -0.7997511, 1.947597, 1, 1, 1, 1, 1,
1.923557, -1.783291, 1.83292, 1, 1, 1, 1, 1,
1.941742, -0.3320071, 4.399714, 1, 1, 1, 1, 1,
1.942519, -0.7095751, 2.870795, 1, 1, 1, 1, 1,
1.986618, -0.3119914, 2.198206, 1, 1, 1, 1, 1,
1.997592, -0.5874333, 2.420591, 1, 1, 1, 1, 1,
1.998661, 1.624922, 1.415341, 1, 1, 1, 1, 1,
2.017058, -0.2531936, 1.730093, 1, 1, 1, 1, 1,
2.019699, 0.2257292, 2.730758, 1, 1, 1, 1, 1,
2.03049, -0.3316386, 0.9355913, 1, 1, 1, 1, 1,
2.07137, -0.5469828, 2.500301, 1, 1, 1, 1, 1,
2.113643, 0.0596719, 1.397011, 1, 1, 1, 1, 1,
2.120502, 0.5090109, -1.443535, 1, 1, 1, 1, 1,
2.120715, -0.3366975, 2.709276, 1, 1, 1, 1, 1,
2.143929, 0.04495448, -1.22785, 0, 0, 1, 1, 1,
2.159616, 1.003659, 0.5928996, 1, 0, 0, 1, 1,
2.204891, -1.91584, 3.671091, 1, 0, 0, 1, 1,
2.219761, 0.3547347, 0.5422435, 1, 0, 0, 1, 1,
2.227934, -0.9846554, 1.803067, 1, 0, 0, 1, 1,
2.238077, 0.9762633, 1.413256, 1, 0, 0, 1, 1,
2.25611, 1.256865, 0.7798408, 0, 0, 0, 1, 1,
2.32097, 2.111224, 1.251603, 0, 0, 0, 1, 1,
2.325402, 1.314082, -0.232066, 0, 0, 0, 1, 1,
2.331918, 0.9991178, 0.6278195, 0, 0, 0, 1, 1,
2.352631, 0.454962, 0.7419328, 0, 0, 0, 1, 1,
2.381155, -0.3276548, 2.866177, 0, 0, 0, 1, 1,
2.466222, -0.3759566, 1.455445, 0, 0, 0, 1, 1,
2.510528, 0.3694535, 0.983423, 1, 1, 1, 1, 1,
2.573374, -1.355682, 2.761597, 1, 1, 1, 1, 1,
2.602417, 0.05921362, 1.563795, 1, 1, 1, 1, 1,
2.624266, 1.036533, 1.54832, 1, 1, 1, 1, 1,
2.66695, 0.4152785, 1.398568, 1, 1, 1, 1, 1,
2.7588, -0.5862119, 3.321713, 1, 1, 1, 1, 1,
3.044042, 0.8242312, 0.1545834, 1, 1, 1, 1, 1
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
var radius = 9.597399;
var distance = 33.71046;
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
mvMatrix.translate( -0.1055001, 0.07170272, -0.3618228 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.71046);
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
