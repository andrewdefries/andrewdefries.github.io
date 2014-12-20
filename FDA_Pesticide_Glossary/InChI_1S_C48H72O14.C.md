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
-2.848145, -2.183125, -2.238367, 1, 0, 0, 1,
-2.493814, 1.320467, -0.6617352, 1, 0.007843138, 0, 1,
-2.473343, 0.4288648, -0.7392187, 1, 0.01176471, 0, 1,
-2.408473, -0.07564454, -0.1070848, 1, 0.01960784, 0, 1,
-2.394216, -0.1176584, -2.611075, 1, 0.02352941, 0, 1,
-2.303987, 0.7366381, -1.966233, 1, 0.03137255, 0, 1,
-2.279918, 0.7715599, -1.062336, 1, 0.03529412, 0, 1,
-2.24369, 1.348275, -2.14207, 1, 0.04313726, 0, 1,
-2.243319, 0.244581, -0.3998275, 1, 0.04705882, 0, 1,
-2.200844, 2.344151, -2.772424, 1, 0.05490196, 0, 1,
-2.184281, 0.414888, -0.7453604, 1, 0.05882353, 0, 1,
-2.182096, -0.9876813, -0.647476, 1, 0.06666667, 0, 1,
-2.181762, 0.8080517, -1.637462, 1, 0.07058824, 0, 1,
-2.170224, 0.8197749, -2.847098, 1, 0.07843138, 0, 1,
-2.12414, -0.560084, -1.424991, 1, 0.08235294, 0, 1,
-2.112889, -1.90167, -3.765359, 1, 0.09019608, 0, 1,
-2.093348, -1.00358, -2.034804, 1, 0.09411765, 0, 1,
-2.061433, 1.133631, -1.586188, 1, 0.1019608, 0, 1,
-2.060198, -0.6698366, -2.229458, 1, 0.1098039, 0, 1,
-2.017094, 0.2200069, -3.089969, 1, 0.1137255, 0, 1,
-1.998208, 0.03823333, -0.9366155, 1, 0.1215686, 0, 1,
-1.996521, -1.03072, -2.304383, 1, 0.1254902, 0, 1,
-1.959485, 0.6455793, -2.312629, 1, 0.1333333, 0, 1,
-1.950429, -0.1357716, -3.070169, 1, 0.1372549, 0, 1,
-1.945219, -1.292559, -0.849446, 1, 0.145098, 0, 1,
-1.928849, -0.8942705, -1.565725, 1, 0.1490196, 0, 1,
-1.926229, -0.249125, 0.3020454, 1, 0.1568628, 0, 1,
-1.916074, 0.9470752, -0.5387117, 1, 0.1607843, 0, 1,
-1.854665, -1.468538, -2.995981, 1, 0.1686275, 0, 1,
-1.846003, -0.4683324, -1.085547, 1, 0.172549, 0, 1,
-1.828895, -1.336095, -1.81633, 1, 0.1803922, 0, 1,
-1.820498, 0.1644183, -1.058405, 1, 0.1843137, 0, 1,
-1.808475, 0.06533464, -2.455842, 1, 0.1921569, 0, 1,
-1.801975, -0.6557143, -1.265448, 1, 0.1960784, 0, 1,
-1.791486, -0.5855601, -1.403686, 1, 0.2039216, 0, 1,
-1.789171, 1.161532, -1.532583, 1, 0.2117647, 0, 1,
-1.727324, 0.886746, -0.8514751, 1, 0.2156863, 0, 1,
-1.719195, 0.8583056, 0.7882718, 1, 0.2235294, 0, 1,
-1.714458, -1.496712, -3.018958, 1, 0.227451, 0, 1,
-1.691539, -0.5438129, -1.45272, 1, 0.2352941, 0, 1,
-1.684955, -1.461184, 0.1625606, 1, 0.2392157, 0, 1,
-1.681664, -0.4101754, -3.658573, 1, 0.2470588, 0, 1,
-1.663949, -2.004704, -1.613447, 1, 0.2509804, 0, 1,
-1.659065, -0.3480886, -0.5550043, 1, 0.2588235, 0, 1,
-1.623466, -0.6712065, -3.284906, 1, 0.2627451, 0, 1,
-1.619635, 0.7633897, -1.203071, 1, 0.2705882, 0, 1,
-1.619588, 1.048432, -0.7954348, 1, 0.2745098, 0, 1,
-1.608436, -0.9180551, -2.14174, 1, 0.282353, 0, 1,
-1.58336, 0.8823094, -1.074015, 1, 0.2862745, 0, 1,
-1.581285, -0.3514037, -1.176591, 1, 0.2941177, 0, 1,
-1.552539, -0.8443323, -3.395248, 1, 0.3019608, 0, 1,
-1.521977, 0.9987183, 1.702808, 1, 0.3058824, 0, 1,
-1.509666, 1.637625, -0.2700403, 1, 0.3137255, 0, 1,
-1.493045, 1.623394, -1.170114, 1, 0.3176471, 0, 1,
-1.474252, 1.566942, -2.142766, 1, 0.3254902, 0, 1,
-1.471097, 1.182254, -0.5652289, 1, 0.3294118, 0, 1,
-1.465825, 0.7995799, -2.121645, 1, 0.3372549, 0, 1,
-1.457586, 1.371435, -0.9308523, 1, 0.3411765, 0, 1,
-1.453826, -1.93421, -1.449049, 1, 0.3490196, 0, 1,
-1.450565, -0.3482145, -2.289288, 1, 0.3529412, 0, 1,
-1.447139, 0.355532, -1.124668, 1, 0.3607843, 0, 1,
-1.44431, -0.686352, -1.702087, 1, 0.3647059, 0, 1,
-1.433471, 1.32949, 0.4452804, 1, 0.372549, 0, 1,
-1.418216, 0.7806685, -1.234654, 1, 0.3764706, 0, 1,
-1.416918, -0.3605171, -2.361577, 1, 0.3843137, 0, 1,
-1.415896, -0.146655, -1.606273, 1, 0.3882353, 0, 1,
-1.414636, 0.244322, -1.378957, 1, 0.3960784, 0, 1,
-1.407099, 0.6256974, -0.3138629, 1, 0.4039216, 0, 1,
-1.406732, 0.5831317, -1.108415, 1, 0.4078431, 0, 1,
-1.406138, 0.08849195, -2.142383, 1, 0.4156863, 0, 1,
-1.406053, 0.5884437, -1.957101, 1, 0.4196078, 0, 1,
-1.397943, -1.14112, -2.699215, 1, 0.427451, 0, 1,
-1.37846, -2.362687, -1.351618, 1, 0.4313726, 0, 1,
-1.377989, 0.1699373, -0.9200267, 1, 0.4392157, 0, 1,
-1.376176, -0.02502824, -2.160229, 1, 0.4431373, 0, 1,
-1.375189, 1.090739, -0.8201073, 1, 0.4509804, 0, 1,
-1.365243, 1.703769, 0.7497346, 1, 0.454902, 0, 1,
-1.352097, 0.2615785, -1.268319, 1, 0.4627451, 0, 1,
-1.351038, 1.520425, -1.6081, 1, 0.4666667, 0, 1,
-1.33868, -1.592227, -3.411719, 1, 0.4745098, 0, 1,
-1.338397, 1.6716, -1.537902, 1, 0.4784314, 0, 1,
-1.335114, -1.147018, -2.247837, 1, 0.4862745, 0, 1,
-1.323588, 1.049814, -0.1174062, 1, 0.4901961, 0, 1,
-1.323046, 0.9596134, -2.230742, 1, 0.4980392, 0, 1,
-1.322342, -0.7337593, -2.979384, 1, 0.5058824, 0, 1,
-1.305444, 0.5683727, -1.27486, 1, 0.509804, 0, 1,
-1.296446, 0.114257, -2.668787, 1, 0.5176471, 0, 1,
-1.273875, 0.4191241, -1.405249, 1, 0.5215687, 0, 1,
-1.258978, 1.027032, -1.09834, 1, 0.5294118, 0, 1,
-1.258646, 0.6520775, -2.645117, 1, 0.5333334, 0, 1,
-1.254516, 0.2033521, -1.280781, 1, 0.5411765, 0, 1,
-1.253452, 0.4057693, -0.01664585, 1, 0.5450981, 0, 1,
-1.245837, -1.072977, -1.932135, 1, 0.5529412, 0, 1,
-1.238189, 2.73331, -0.7010049, 1, 0.5568628, 0, 1,
-1.234628, 1.166775, -0.2008304, 1, 0.5647059, 0, 1,
-1.233273, 0.3787387, -0.7230716, 1, 0.5686275, 0, 1,
-1.231533, 0.6844541, -1.027367, 1, 0.5764706, 0, 1,
-1.223466, 1.885152, 0.6413593, 1, 0.5803922, 0, 1,
-1.215751, -0.1337865, -0.8665783, 1, 0.5882353, 0, 1,
-1.215284, 0.7910774, 0.7373263, 1, 0.5921569, 0, 1,
-1.199733, -0.3264638, -0.6654274, 1, 0.6, 0, 1,
-1.197937, -0.4377204, -3.101678, 1, 0.6078432, 0, 1,
-1.196082, 0.4606083, -0.825559, 1, 0.6117647, 0, 1,
-1.193701, -0.7014729, 0.6699293, 1, 0.6196079, 0, 1,
-1.182522, 2.045075, -2.01262, 1, 0.6235294, 0, 1,
-1.181917, -1.117421, -1.606778, 1, 0.6313726, 0, 1,
-1.170021, 3.023876, -1.614146, 1, 0.6352941, 0, 1,
-1.166378, -1.101018, -2.908408, 1, 0.6431373, 0, 1,
-1.165841, -0.1109592, -2.070289, 1, 0.6470588, 0, 1,
-1.165134, 0.9345886, -0.9226203, 1, 0.654902, 0, 1,
-1.1598, 0.829767, -2.651901, 1, 0.6588235, 0, 1,
-1.157419, 0.1124125, -1.400639, 1, 0.6666667, 0, 1,
-1.143033, 0.07632942, -3.772397, 1, 0.6705883, 0, 1,
-1.142642, -1.417241, -3.649135, 1, 0.6784314, 0, 1,
-1.142256, -1.474292, -2.001724, 1, 0.682353, 0, 1,
-1.136274, 0.111632, -2.993667, 1, 0.6901961, 0, 1,
-1.133371, -2.124178, -3.514162, 1, 0.6941177, 0, 1,
-1.131419, 0.194817, -0.318528, 1, 0.7019608, 0, 1,
-1.130301, -0.8379536, -3.008077, 1, 0.7098039, 0, 1,
-1.119624, 0.2053791, -0.4052047, 1, 0.7137255, 0, 1,
-1.108672, -0.7699795, -0.5313061, 1, 0.7215686, 0, 1,
-1.096511, -2.882913, -0.9602019, 1, 0.7254902, 0, 1,
-1.093774, 0.1940991, -1.21057, 1, 0.7333333, 0, 1,
-1.090471, -0.7178584, -2.744506, 1, 0.7372549, 0, 1,
-1.084964, 1.841733, -0.614446, 1, 0.7450981, 0, 1,
-1.084859, 0.6887987, -1.035576, 1, 0.7490196, 0, 1,
-1.083623, -1.027017, -1.938741, 1, 0.7568628, 0, 1,
-1.082643, -2.040124, -2.366998, 1, 0.7607843, 0, 1,
-1.082124, -0.1755137, -1.754633, 1, 0.7686275, 0, 1,
-1.068107, -0.6811247, -2.346139, 1, 0.772549, 0, 1,
-1.067982, -2.016582, -2.838236, 1, 0.7803922, 0, 1,
-1.06697, 0.2047655, -3.123879, 1, 0.7843137, 0, 1,
-1.065837, 0.2042136, -1.816528, 1, 0.7921569, 0, 1,
-1.054313, -0.7699686, -1.898454, 1, 0.7960784, 0, 1,
-1.047771, 0.100066, -2.57925, 1, 0.8039216, 0, 1,
-1.041517, 0.07565236, -1.954443, 1, 0.8117647, 0, 1,
-1.039446, -1.82136, -3.800593, 1, 0.8156863, 0, 1,
-1.038384, -0.04975179, -1.353886, 1, 0.8235294, 0, 1,
-1.038208, -0.1275824, -3.899624, 1, 0.827451, 0, 1,
-1.035359, 0.4205385, 0.1228118, 1, 0.8352941, 0, 1,
-1.021857, 0.7619565, -2.019695, 1, 0.8392157, 0, 1,
-1.017367, -1.014642, -1.809902, 1, 0.8470588, 0, 1,
-1.016396, 0.2795066, 0.4124194, 1, 0.8509804, 0, 1,
-1.00253, 1.709008, 1.199257, 1, 0.8588235, 0, 1,
-1.002375, -0.1462437, -2.431942, 1, 0.8627451, 0, 1,
-1.000083, -0.3113251, -1.763915, 1, 0.8705882, 0, 1,
-0.9974329, 0.9881462, -0.5235647, 1, 0.8745098, 0, 1,
-0.9920712, 1.677755, 0.07975872, 1, 0.8823529, 0, 1,
-0.9773042, 0.7966813, -0.4938661, 1, 0.8862745, 0, 1,
-0.9765154, -1.217639, -1.553564, 1, 0.8941177, 0, 1,
-0.968322, 0.7582725, -0.8494079, 1, 0.8980392, 0, 1,
-0.9585316, -0.4065299, -0.906743, 1, 0.9058824, 0, 1,
-0.9522079, 0.3097305, -1.935538, 1, 0.9137255, 0, 1,
-0.9491119, -0.8377379, -2.526542, 1, 0.9176471, 0, 1,
-0.9466155, 0.07321943, -1.19584, 1, 0.9254902, 0, 1,
-0.9361728, 0.06906839, 0.6492798, 1, 0.9294118, 0, 1,
-0.9360325, -0.0953893, -0.934521, 1, 0.9372549, 0, 1,
-0.9359633, 1.37043, 0.3769117, 1, 0.9411765, 0, 1,
-0.9307194, 0.3328127, -2.131391, 1, 0.9490196, 0, 1,
-0.9238009, -0.4547856, -0.9435645, 1, 0.9529412, 0, 1,
-0.9213162, -2.991929, -2.849829, 1, 0.9607843, 0, 1,
-0.9200224, -1.385502, -1.151507, 1, 0.9647059, 0, 1,
-0.9166543, -0.4922786, -2.074087, 1, 0.972549, 0, 1,
-0.9095827, 1.289467, -0.4409751, 1, 0.9764706, 0, 1,
-0.9066109, 2.36678, 0.1216673, 1, 0.9843137, 0, 1,
-0.9041739, 0.4483355, -2.8288, 1, 0.9882353, 0, 1,
-0.8980813, -1.263724, -1.572303, 1, 0.9960784, 0, 1,
-0.8911232, -0.9012318, -1.636038, 0.9960784, 1, 0, 1,
-0.8902194, 0.5123115, -3.056505, 0.9921569, 1, 0, 1,
-0.8855442, -1.360977, -3.730299, 0.9843137, 1, 0, 1,
-0.8804923, -0.8212453, -1.549923, 0.9803922, 1, 0, 1,
-0.8801737, 0.06614219, -0.5397085, 0.972549, 1, 0, 1,
-0.8801676, -1.507401, -3.993991, 0.9686275, 1, 0, 1,
-0.8754569, -2.252023, -1.903753, 0.9607843, 1, 0, 1,
-0.8662347, -0.8184401, -3.799557, 0.9568627, 1, 0, 1,
-0.8565114, 1.330682, -0.6889723, 0.9490196, 1, 0, 1,
-0.8562082, -0.1800535, -0.9438047, 0.945098, 1, 0, 1,
-0.8550434, 0.4602623, 0.3912402, 0.9372549, 1, 0, 1,
-0.8536676, -0.737071, -0.4435644, 0.9333333, 1, 0, 1,
-0.8525255, 0.1637777, -2.982951, 0.9254902, 1, 0, 1,
-0.8518066, -0.001105747, 0.8829151, 0.9215686, 1, 0, 1,
-0.8482673, 0.03818681, -1.352105, 0.9137255, 1, 0, 1,
-0.8374705, -0.8431977, -3.105838, 0.9098039, 1, 0, 1,
-0.8365932, 0.8949069, 1.205533, 0.9019608, 1, 0, 1,
-0.8359128, 1.109998, -0.717269, 0.8941177, 1, 0, 1,
-0.8294138, -0.003721588, 1.259927, 0.8901961, 1, 0, 1,
-0.8291631, 0.5500143, -0.5307843, 0.8823529, 1, 0, 1,
-0.8250911, 0.7720252, -0.4401885, 0.8784314, 1, 0, 1,
-0.8227419, 0.3278911, -1.16199, 0.8705882, 1, 0, 1,
-0.8224396, -1.127363, -2.189679, 0.8666667, 1, 0, 1,
-0.8174018, 0.1342951, -0.4644887, 0.8588235, 1, 0, 1,
-0.8125967, -0.7109634, -1.505301, 0.854902, 1, 0, 1,
-0.8088304, 1.197736, -1.766074, 0.8470588, 1, 0, 1,
-0.8035778, -0.3251615, -4.079451, 0.8431373, 1, 0, 1,
-0.8034521, -0.2212352, -1.070603, 0.8352941, 1, 0, 1,
-0.7956697, -2.292552, -3.222667, 0.8313726, 1, 0, 1,
-0.7922917, 0.4141677, -1.173551, 0.8235294, 1, 0, 1,
-0.7896164, -0.3583709, -1.161111, 0.8196079, 1, 0, 1,
-0.7887319, 0.1476313, 0.4546084, 0.8117647, 1, 0, 1,
-0.7860936, 0.113399, -0.9398949, 0.8078431, 1, 0, 1,
-0.7805319, 1.843665, -0.1956779, 0.8, 1, 0, 1,
-0.7714781, 0.1245424, -0.3019314, 0.7921569, 1, 0, 1,
-0.7698728, -0.4162656, -2.393662, 0.7882353, 1, 0, 1,
-0.7690398, 0.7694603, -0.9405143, 0.7803922, 1, 0, 1,
-0.7654544, 0.6824616, -0.4218192, 0.7764706, 1, 0, 1,
-0.7630812, -1.104587, -2.72262, 0.7686275, 1, 0, 1,
-0.76144, -0.442714, -1.997949, 0.7647059, 1, 0, 1,
-0.7576035, 2.745259, 0.5063094, 0.7568628, 1, 0, 1,
-0.7570025, -0.9962224, -3.054496, 0.7529412, 1, 0, 1,
-0.7483999, -0.6809605, -2.052381, 0.7450981, 1, 0, 1,
-0.7477145, -0.863197, -3.247706, 0.7411765, 1, 0, 1,
-0.7436787, -0.1092978, -2.117744, 0.7333333, 1, 0, 1,
-0.7326476, 0.2510663, -0.2744714, 0.7294118, 1, 0, 1,
-0.7283618, -0.05264292, -2.590966, 0.7215686, 1, 0, 1,
-0.7241911, 0.06446111, -1.873583, 0.7176471, 1, 0, 1,
-0.7218691, 0.9628581, -1.117609, 0.7098039, 1, 0, 1,
-0.7163478, 1.010564, -1.784735, 0.7058824, 1, 0, 1,
-0.7096902, -1.014077, -3.423799, 0.6980392, 1, 0, 1,
-0.7081204, -1.570715, -1.78351, 0.6901961, 1, 0, 1,
-0.7065489, 1.632674, 0.1783966, 0.6862745, 1, 0, 1,
-0.7031015, 0.393282, -3.166885, 0.6784314, 1, 0, 1,
-0.6958077, -2.865979, -2.446151, 0.6745098, 1, 0, 1,
-0.6953688, -2.789911, -5.494696, 0.6666667, 1, 0, 1,
-0.6943962, 1.337593, -2.41697, 0.6627451, 1, 0, 1,
-0.6935951, -0.6375387, -1.551657, 0.654902, 1, 0, 1,
-0.6871883, -0.1610687, -1.31469, 0.6509804, 1, 0, 1,
-0.6847578, 0.8601853, 0.8447773, 0.6431373, 1, 0, 1,
-0.6824326, -0.06951567, -1.137047, 0.6392157, 1, 0, 1,
-0.6810521, -0.8556516, -2.846525, 0.6313726, 1, 0, 1,
-0.6728414, 0.344355, -1.262441, 0.627451, 1, 0, 1,
-0.670745, 0.4572781, -0.9968234, 0.6196079, 1, 0, 1,
-0.65773, 2.147765, 1.809985, 0.6156863, 1, 0, 1,
-0.6550786, -0.4574029, -4.335908, 0.6078432, 1, 0, 1,
-0.6527193, -1.377146, -2.135388, 0.6039216, 1, 0, 1,
-0.6519749, 0.189511, -1.119821, 0.5960785, 1, 0, 1,
-0.6464176, 0.473409, -0.8648548, 0.5882353, 1, 0, 1,
-0.6432974, 0.190025, -2.051248, 0.5843138, 1, 0, 1,
-0.6414223, 1.518225, 0.9039785, 0.5764706, 1, 0, 1,
-0.6407347, -1.619711, -0.8632826, 0.572549, 1, 0, 1,
-0.6369847, -0.3211973, -2.051075, 0.5647059, 1, 0, 1,
-0.6369662, 1.859042, 0.04156881, 0.5607843, 1, 0, 1,
-0.6368092, -0.1845623, -0.4809181, 0.5529412, 1, 0, 1,
-0.6353312, -0.9111514, -3.000221, 0.5490196, 1, 0, 1,
-0.633575, -0.3835977, -2.981293, 0.5411765, 1, 0, 1,
-0.6329613, 0.3119111, -0.8954093, 0.5372549, 1, 0, 1,
-0.6324316, 0.485584, -0.2630078, 0.5294118, 1, 0, 1,
-0.6307263, -0.2582073, -1.729043, 0.5254902, 1, 0, 1,
-0.6301827, -0.2669604, -1.16389, 0.5176471, 1, 0, 1,
-0.6253718, -1.013817, -2.046623, 0.5137255, 1, 0, 1,
-0.6174318, -0.3203033, -2.119412, 0.5058824, 1, 0, 1,
-0.6164384, -1.866084, -2.303357, 0.5019608, 1, 0, 1,
-0.6154621, 0.07887902, -2.132924, 0.4941176, 1, 0, 1,
-0.6112527, -1.704579, -2.644412, 0.4862745, 1, 0, 1,
-0.6108892, 0.262729, -1.25911, 0.4823529, 1, 0, 1,
-0.6087638, -0.65995, -1.994087, 0.4745098, 1, 0, 1,
-0.606661, -1.104438, -2.071658, 0.4705882, 1, 0, 1,
-0.6058498, -1.254062, -3.454872, 0.4627451, 1, 0, 1,
-0.6043644, 0.4401502, 0.6845598, 0.4588235, 1, 0, 1,
-0.6017892, 0.5146186, -0.6544805, 0.4509804, 1, 0, 1,
-0.5978568, 0.4017211, -0.1208336, 0.4470588, 1, 0, 1,
-0.5969355, -1.335941, -2.678432, 0.4392157, 1, 0, 1,
-0.5869401, 1.03432, -1.719097, 0.4352941, 1, 0, 1,
-0.5866811, 0.2776511, 0.08690703, 0.427451, 1, 0, 1,
-0.5806302, -1.059346, -1.317242, 0.4235294, 1, 0, 1,
-0.5804241, 0.4571338, -0.8231016, 0.4156863, 1, 0, 1,
-0.5739712, 0.5142319, -1.22559, 0.4117647, 1, 0, 1,
-0.5738899, 0.6472432, -1.53059, 0.4039216, 1, 0, 1,
-0.571284, 2.598022, -1.038171, 0.3960784, 1, 0, 1,
-0.5703325, 0.05180422, -0.894797, 0.3921569, 1, 0, 1,
-0.5603963, 1.831788, 0.7179924, 0.3843137, 1, 0, 1,
-0.5556774, -2.400449, -3.996288, 0.3803922, 1, 0, 1,
-0.5556078, 1.258328, -1.045366, 0.372549, 1, 0, 1,
-0.5505908, 0.009757889, -2.871967, 0.3686275, 1, 0, 1,
-0.5501916, -0.5929792, -3.788286, 0.3607843, 1, 0, 1,
-0.5495806, 0.353306, -1.71275, 0.3568628, 1, 0, 1,
-0.542943, -0.6987967, -2.232826, 0.3490196, 1, 0, 1,
-0.5415995, -0.3894778, -2.456887, 0.345098, 1, 0, 1,
-0.5387107, -0.6741176, -3.236845, 0.3372549, 1, 0, 1,
-0.5343934, -0.01025884, -1.115526, 0.3333333, 1, 0, 1,
-0.5190021, -0.5361355, -4.012142, 0.3254902, 1, 0, 1,
-0.5187119, -1.686742, -3.304124, 0.3215686, 1, 0, 1,
-0.5123911, 0.6050111, -0.1341664, 0.3137255, 1, 0, 1,
-0.510755, -0.08641067, -2.85566, 0.3098039, 1, 0, 1,
-0.5089897, -0.8206726, -3.961589, 0.3019608, 1, 0, 1,
-0.5075018, -0.8607388, -3.252575, 0.2941177, 1, 0, 1,
-0.5071583, -0.9106167, -1.351527, 0.2901961, 1, 0, 1,
-0.5059505, -0.3795916, -1.121878, 0.282353, 1, 0, 1,
-0.4914649, 0.2343488, -1.734448, 0.2784314, 1, 0, 1,
-0.4912884, 0.5424462, -1.252712, 0.2705882, 1, 0, 1,
-0.4882312, 0.9825194, -3.129554, 0.2666667, 1, 0, 1,
-0.4831135, 0.6091964, -1.614178, 0.2588235, 1, 0, 1,
-0.481998, 0.8175775, -0.2069044, 0.254902, 1, 0, 1,
-0.479442, 1.792941, -1.919431, 0.2470588, 1, 0, 1,
-0.4774096, 2.986846, 0.4444658, 0.2431373, 1, 0, 1,
-0.4751239, -2.583563, -2.53046, 0.2352941, 1, 0, 1,
-0.4734583, 0.1303407, -0.8668659, 0.2313726, 1, 0, 1,
-0.4733988, 0.9573739, -0.1177231, 0.2235294, 1, 0, 1,
-0.4654335, 0.4150681, -2.080438, 0.2196078, 1, 0, 1,
-0.464119, -0.6164839, -3.289809, 0.2117647, 1, 0, 1,
-0.4613588, 0.9349919, -0.01357594, 0.2078431, 1, 0, 1,
-0.4596144, -1.120974, -0.2575817, 0.2, 1, 0, 1,
-0.4594702, -0.9016778, -1.955535, 0.1921569, 1, 0, 1,
-0.4573398, -0.2803755, -2.879186, 0.1882353, 1, 0, 1,
-0.4564103, -0.3215081, -1.510752, 0.1803922, 1, 0, 1,
-0.4548584, -1.597939, -3.783643, 0.1764706, 1, 0, 1,
-0.4505118, -0.5525084, -2.053988, 0.1686275, 1, 0, 1,
-0.4489244, -0.7216063, -2.09854, 0.1647059, 1, 0, 1,
-0.4446917, 0.9143322, 0.499817, 0.1568628, 1, 0, 1,
-0.4440157, -0.4247038, -2.491178, 0.1529412, 1, 0, 1,
-0.4437696, 0.7927722, 0.3870295, 0.145098, 1, 0, 1,
-0.4405652, -1.464765, -1.74979, 0.1411765, 1, 0, 1,
-0.4377649, -0.8313646, -3.248004, 0.1333333, 1, 0, 1,
-0.4360932, 0.3175886, 0.04297914, 0.1294118, 1, 0, 1,
-0.4240487, 1.885792, -0.2998434, 0.1215686, 1, 0, 1,
-0.4194783, 1.504268, -0.6579421, 0.1176471, 1, 0, 1,
-0.4130894, 0.6119367, -1.609332, 0.1098039, 1, 0, 1,
-0.4072115, -0.3917951, -0.6618741, 0.1058824, 1, 0, 1,
-0.4045374, -0.1327986, -0.4237488, 0.09803922, 1, 0, 1,
-0.4027867, 0.6822784, -1.822294, 0.09019608, 1, 0, 1,
-0.3981418, -1.779218, -2.276066, 0.08627451, 1, 0, 1,
-0.3977746, -1.519151, -1.767382, 0.07843138, 1, 0, 1,
-0.3962319, 1.841554, 0.6871811, 0.07450981, 1, 0, 1,
-0.3960901, -0.3122399, -1.162538, 0.06666667, 1, 0, 1,
-0.3957633, -0.2203793, -1.975017, 0.0627451, 1, 0, 1,
-0.3885311, -1.362455, -2.324852, 0.05490196, 1, 0, 1,
-0.3884927, -1.35419, -3.868863, 0.05098039, 1, 0, 1,
-0.3872188, -0.7713639, -2.023673, 0.04313726, 1, 0, 1,
-0.386287, -0.556034, -2.736972, 0.03921569, 1, 0, 1,
-0.3844837, -0.8393375, -3.143896, 0.03137255, 1, 0, 1,
-0.3795498, -0.8551685, -1.799934, 0.02745098, 1, 0, 1,
-0.3774784, 0.2670095, -1.083006, 0.01960784, 1, 0, 1,
-0.3726341, -1.214527, -2.783298, 0.01568628, 1, 0, 1,
-0.3689107, 0.9661735, -0.9272909, 0.007843138, 1, 0, 1,
-0.3604751, -0.04651064, -2.452651, 0.003921569, 1, 0, 1,
-0.3572763, -0.9744438, -2.538832, 0, 1, 0.003921569, 1,
-0.3566483, -0.7902264, -2.80591, 0, 1, 0.01176471, 1,
-0.3558251, 0.1981416, -1.073963, 0, 1, 0.01568628, 1,
-0.3522985, -1.53168, -1.957245, 0, 1, 0.02352941, 1,
-0.3521419, -1.007892, -3.781401, 0, 1, 0.02745098, 1,
-0.3519107, -0.1367935, -1.111876, 0, 1, 0.03529412, 1,
-0.3474213, -0.9270422, -2.193469, 0, 1, 0.03921569, 1,
-0.3471714, -0.2368682, -1.061732, 0, 1, 0.04705882, 1,
-0.3470617, 0.6390975, -1.858495, 0, 1, 0.05098039, 1,
-0.3385492, 1.633673, 1.270364, 0, 1, 0.05882353, 1,
-0.3339194, -0.3199071, -2.667139, 0, 1, 0.0627451, 1,
-0.3320044, 0.3352372, -0.9090037, 0, 1, 0.07058824, 1,
-0.3319931, -1.770062, -5.381865, 0, 1, 0.07450981, 1,
-0.3240996, -1.07614, -2.843969, 0, 1, 0.08235294, 1,
-0.3198627, -0.45191, -1.124588, 0, 1, 0.08627451, 1,
-0.3148138, -0.8771356, -4.225519, 0, 1, 0.09411765, 1,
-0.3095988, -1.2421, -3.739862, 0, 1, 0.1019608, 1,
-0.307765, 0.6116226, -0.9172637, 0, 1, 0.1058824, 1,
-0.3071437, 1.359542, 0.3775731, 0, 1, 0.1137255, 1,
-0.3062769, -1.118361, -3.833422, 0, 1, 0.1176471, 1,
-0.3046212, 1.092245, 0.1824094, 0, 1, 0.1254902, 1,
-0.302599, 0.3775591, -0.3928278, 0, 1, 0.1294118, 1,
-0.3024856, -0.7196096, -3.727705, 0, 1, 0.1372549, 1,
-0.3019353, -0.1671393, -1.611443, 0, 1, 0.1411765, 1,
-0.3017857, -0.6129637, -2.896479, 0, 1, 0.1490196, 1,
-0.3005741, 2.947365, -0.1049584, 0, 1, 0.1529412, 1,
-0.2996794, 0.394673, -0.4931429, 0, 1, 0.1607843, 1,
-0.2932979, 0.6135612, -0.04995957, 0, 1, 0.1647059, 1,
-0.2918358, 0.1413558, 0.109384, 0, 1, 0.172549, 1,
-0.288851, -0.9474753, -3.961534, 0, 1, 0.1764706, 1,
-0.2829075, 0.2250434, -1.941967, 0, 1, 0.1843137, 1,
-0.2816962, 0.7527607, -1.814852, 0, 1, 0.1882353, 1,
-0.2811123, -1.087872, -0.9611547, 0, 1, 0.1960784, 1,
-0.2800295, -1.580002, -2.093199, 0, 1, 0.2039216, 1,
-0.279612, 0.9287226, 0.8286494, 0, 1, 0.2078431, 1,
-0.2780723, -0.722765, -1.626103, 0, 1, 0.2156863, 1,
-0.27468, 0.5284129, -0.6931529, 0, 1, 0.2196078, 1,
-0.2728367, 0.9351101, -1.051993, 0, 1, 0.227451, 1,
-0.2672573, -0.725153, -3.617128, 0, 1, 0.2313726, 1,
-0.259692, -0.1418341, -2.212513, 0, 1, 0.2392157, 1,
-0.2589481, -0.6489826, -2.109126, 0, 1, 0.2431373, 1,
-0.2587801, -0.1738169, -3.13905, 0, 1, 0.2509804, 1,
-0.2555082, 0.3686964, 0.05117577, 0, 1, 0.254902, 1,
-0.2550486, -0.0586624, -1.789151, 0, 1, 0.2627451, 1,
-0.2535201, 0.4725802, -0.9317193, 0, 1, 0.2666667, 1,
-0.2528551, -0.4933654, -2.836313, 0, 1, 0.2745098, 1,
-0.2491113, 0.4763097, 0.4296994, 0, 1, 0.2784314, 1,
-0.2485473, 0.5660184, 0.2781658, 0, 1, 0.2862745, 1,
-0.2439995, 0.3866583, -0.2031371, 0, 1, 0.2901961, 1,
-0.2433648, -0.9096496, -4.342772, 0, 1, 0.2980392, 1,
-0.2422728, 0.7418265, 1.314472, 0, 1, 0.3058824, 1,
-0.2403537, 1.134174, 1.275744, 0, 1, 0.3098039, 1,
-0.2356658, -0.1484026, -2.417527, 0, 1, 0.3176471, 1,
-0.2336627, -2.172573, -4.417384, 0, 1, 0.3215686, 1,
-0.2304615, -1.836117, -3.454727, 0, 1, 0.3294118, 1,
-0.2219638, -0.872742, -4.768365, 0, 1, 0.3333333, 1,
-0.2179683, -1.181063, -4.655256, 0, 1, 0.3411765, 1,
-0.2177852, 1.068157, -0.3623627, 0, 1, 0.345098, 1,
-0.215932, 0.6015946, -2.575478, 0, 1, 0.3529412, 1,
-0.214138, 0.5443413, 0.1579218, 0, 1, 0.3568628, 1,
-0.2140072, 0.7055236, -2.640558, 0, 1, 0.3647059, 1,
-0.1981992, -0.782676, -1.48439, 0, 1, 0.3686275, 1,
-0.1937477, -0.901454, -5.141828, 0, 1, 0.3764706, 1,
-0.1922627, -0.6389936, -4.218059, 0, 1, 0.3803922, 1,
-0.1907316, 0.3608795, -2.432122, 0, 1, 0.3882353, 1,
-0.1890877, 1.751691, -1.028661, 0, 1, 0.3921569, 1,
-0.188441, -0.4658738, -1.744533, 0, 1, 0.4, 1,
-0.1870415, 0.4199007, -1.750186, 0, 1, 0.4078431, 1,
-0.185293, 0.5938612, 1.573998, 0, 1, 0.4117647, 1,
-0.1851343, -0.5947375, -3.123105, 0, 1, 0.4196078, 1,
-0.1834442, -2.159926, -2.496159, 0, 1, 0.4235294, 1,
-0.1800546, 0.6994957, 0.208209, 0, 1, 0.4313726, 1,
-0.1781371, -1.005225, -2.822446, 0, 1, 0.4352941, 1,
-0.1758979, 1.17374, -1.249075, 0, 1, 0.4431373, 1,
-0.1727836, 0.6271911, -0.6082126, 0, 1, 0.4470588, 1,
-0.1724997, -0.8152113, -5.295945, 0, 1, 0.454902, 1,
-0.1719874, -0.7927108, -2.589316, 0, 1, 0.4588235, 1,
-0.1710226, 0.7709761, -0.963959, 0, 1, 0.4666667, 1,
-0.1710044, -1.792228, -4.407443, 0, 1, 0.4705882, 1,
-0.1689238, -1.463099, -4.093574, 0, 1, 0.4784314, 1,
-0.1642836, 0.1303229, -1.073281, 0, 1, 0.4823529, 1,
-0.1539111, -0.8006999, -2.486471, 0, 1, 0.4901961, 1,
-0.1527012, -0.05493835, -1.697417, 0, 1, 0.4941176, 1,
-0.1500914, -1.106336, -2.237255, 0, 1, 0.5019608, 1,
-0.1479402, -0.6119781, -2.861361, 0, 1, 0.509804, 1,
-0.1434292, -1.477807, -4.374414, 0, 1, 0.5137255, 1,
-0.140499, 0.08357082, -1.004062, 0, 1, 0.5215687, 1,
-0.1382927, -0.7714956, -2.107409, 0, 1, 0.5254902, 1,
-0.1360913, -0.4988277, -5.164908, 0, 1, 0.5333334, 1,
-0.1328851, -2.901697, -3.053371, 0, 1, 0.5372549, 1,
-0.1263923, 0.1805992, -0.7065501, 0, 1, 0.5450981, 1,
-0.1222346, 1.383219, 0.7739489, 0, 1, 0.5490196, 1,
-0.1172007, 0.6313518, 0.1167958, 0, 1, 0.5568628, 1,
-0.1160871, 0.9053158, 0.3063686, 0, 1, 0.5607843, 1,
-0.1151771, 0.5258436, 0.08002271, 0, 1, 0.5686275, 1,
-0.114199, 0.5783093, -1.235923, 0, 1, 0.572549, 1,
-0.1141662, -0.193695, -3.946737, 0, 1, 0.5803922, 1,
-0.1116831, -2.064462, -4.112143, 0, 1, 0.5843138, 1,
-0.1015339, -1.074882, -3.4279, 0, 1, 0.5921569, 1,
-0.1015254, -0.2535232, -4.973816, 0, 1, 0.5960785, 1,
-0.09773446, 1.293297, -0.3266253, 0, 1, 0.6039216, 1,
-0.09771984, 0.4440896, 0.3483247, 0, 1, 0.6117647, 1,
-0.09537571, -0.2293024, -3.223029, 0, 1, 0.6156863, 1,
-0.08741032, 1.746441, 0.7164912, 0, 1, 0.6235294, 1,
-0.08363427, 1.310686, 0.03548682, 0, 1, 0.627451, 1,
-0.08178838, -0.9945838, -2.720586, 0, 1, 0.6352941, 1,
-0.07812818, -1.621506, -3.155843, 0, 1, 0.6392157, 1,
-0.07731061, 1.349977, -0.6550943, 0, 1, 0.6470588, 1,
-0.0761311, 1.409765, 0.4378828, 0, 1, 0.6509804, 1,
-0.07403, -0.2551678, 0.2275597, 0, 1, 0.6588235, 1,
-0.06800248, -0.8106809, -2.769001, 0, 1, 0.6627451, 1,
-0.06764336, -1.83585, -4.447772, 0, 1, 0.6705883, 1,
-0.06560793, -0.1396649, -3.683934, 0, 1, 0.6745098, 1,
-0.06112211, 0.05689151, 0.4019124, 0, 1, 0.682353, 1,
-0.05775878, -1.031292, -4.845675, 0, 1, 0.6862745, 1,
-0.05763248, -0.1432102, -4.016471, 0, 1, 0.6941177, 1,
-0.052306, 0.04017471, -1.35616, 0, 1, 0.7019608, 1,
-0.05209814, -1.567048, -3.252877, 0, 1, 0.7058824, 1,
-0.05208038, 0.6262181, -1.061825, 0, 1, 0.7137255, 1,
-0.04963865, 0.9727859, 1.239152, 0, 1, 0.7176471, 1,
-0.04585537, -0.5376841, -2.509502, 0, 1, 0.7254902, 1,
-0.04411148, -0.324898, -3.369781, 0, 1, 0.7294118, 1,
-0.03873836, 0.9568205, 0.1604954, 0, 1, 0.7372549, 1,
-0.03705399, 0.3905098, 0.465266, 0, 1, 0.7411765, 1,
-0.03283312, -1.597559, -2.859111, 0, 1, 0.7490196, 1,
-0.03254116, 0.4628759, -0.04907792, 0, 1, 0.7529412, 1,
-0.03234305, 1.34278, -0.5917741, 0, 1, 0.7607843, 1,
-0.02641508, 0.4381857, -1.498588, 0, 1, 0.7647059, 1,
-0.02474323, -2.087104, -4.148423, 0, 1, 0.772549, 1,
-0.02396686, 0.3170814, -0.8486454, 0, 1, 0.7764706, 1,
-0.01930661, 0.5418582, 0.8199412, 0, 1, 0.7843137, 1,
-0.01828447, -0.7447495, -3.840542, 0, 1, 0.7882353, 1,
-0.0168785, 2.455549, -0.4168948, 0, 1, 0.7960784, 1,
-0.01576292, 0.5445347, 0.1658627, 0, 1, 0.8039216, 1,
-0.01287953, -1.019136, -2.650889, 0, 1, 0.8078431, 1,
-0.01286926, 1.703948, 1.284005, 0, 1, 0.8156863, 1,
-0.01024847, -2.140647, -2.736242, 0, 1, 0.8196079, 1,
-0.008745654, -1.267793, -1.604757, 0, 1, 0.827451, 1,
-0.006145529, -0.1830981, -3.087285, 0, 1, 0.8313726, 1,
-0.003787993, 0.8648931, 0.5221834, 0, 1, 0.8392157, 1,
-0.003730811, 0.1719862, 0.2685997, 0, 1, 0.8431373, 1,
-0.0002438821, 0.5434994, 0.4931944, 0, 1, 0.8509804, 1,
0.0003780542, -0.8007679, 4.483048, 0, 1, 0.854902, 1,
0.002242769, 1.473997, -0.5503603, 0, 1, 0.8627451, 1,
0.004838356, 0.2055551, -0.03757393, 0, 1, 0.8666667, 1,
0.005671876, 0.5437203, 0.04287382, 0, 1, 0.8745098, 1,
0.005698632, -2.680497, 4.058961, 0, 1, 0.8784314, 1,
0.008138114, -1.251453, 4.100477, 0, 1, 0.8862745, 1,
0.008833852, -1.292047, 2.166828, 0, 1, 0.8901961, 1,
0.01070702, 0.06672438, 0.02960859, 0, 1, 0.8980392, 1,
0.01158401, 0.2875414, -1.412968, 0, 1, 0.9058824, 1,
0.01291948, -0.3472822, 2.829225, 0, 1, 0.9098039, 1,
0.01370954, -0.8186358, 1.112902, 0, 1, 0.9176471, 1,
0.01401329, 0.1068185, -1.689774, 0, 1, 0.9215686, 1,
0.01812145, 1.271076, -0.2278285, 0, 1, 0.9294118, 1,
0.0184025, 1.361457, 0.5327298, 0, 1, 0.9333333, 1,
0.02169866, 1.068453, 0.3048649, 0, 1, 0.9411765, 1,
0.02583266, 1.038017, -0.8335029, 0, 1, 0.945098, 1,
0.02759987, -0.2491236, 4.167264, 0, 1, 0.9529412, 1,
0.0287162, -0.297565, 2.875354, 0, 1, 0.9568627, 1,
0.02879132, 0.2874764, 1.641863, 0, 1, 0.9647059, 1,
0.02902181, 0.2855599, -0.4044742, 0, 1, 0.9686275, 1,
0.02964673, -0.7429562, 1.670902, 0, 1, 0.9764706, 1,
0.03328029, 0.5066605, 1.299184, 0, 1, 0.9803922, 1,
0.03563053, -0.4698801, 4.057344, 0, 1, 0.9882353, 1,
0.03647977, 0.6530761, 0.2048669, 0, 1, 0.9921569, 1,
0.03924445, -0.4255929, 2.098795, 0, 1, 1, 1,
0.03960435, 0.5770572, 1.278257, 0, 0.9921569, 1, 1,
0.04027442, -0.1589861, 2.718988, 0, 0.9882353, 1, 1,
0.04279077, -0.3333918, 2.410903, 0, 0.9803922, 1, 1,
0.04874143, 0.1472006, -0.1311198, 0, 0.9764706, 1, 1,
0.05001315, -1.928724, 2.888, 0, 0.9686275, 1, 1,
0.05758412, 0.7364868, -0.06976886, 0, 0.9647059, 1, 1,
0.05850706, -0.2341529, 2.629022, 0, 0.9568627, 1, 1,
0.06222482, -0.521969, 4.021455, 0, 0.9529412, 1, 1,
0.06305908, -0.3624414, 3.694837, 0, 0.945098, 1, 1,
0.06371874, 1.006195, 0.5747344, 0, 0.9411765, 1, 1,
0.06465308, -1.640038, 4.155043, 0, 0.9333333, 1, 1,
0.065175, -1.921288, 1.520664, 0, 0.9294118, 1, 1,
0.07123903, -0.1274525, 3.95772, 0, 0.9215686, 1, 1,
0.07153026, 0.4847805, -0.42284, 0, 0.9176471, 1, 1,
0.07253119, -0.3596945, 1.982313, 0, 0.9098039, 1, 1,
0.08141891, 1.957134, -0.9698651, 0, 0.9058824, 1, 1,
0.08522262, -0.243517, 3.080138, 0, 0.8980392, 1, 1,
0.08886096, -0.05302696, 2.034804, 0, 0.8901961, 1, 1,
0.09233185, -0.9540322, 3.623043, 0, 0.8862745, 1, 1,
0.09819908, 0.2089068, -0.4519607, 0, 0.8784314, 1, 1,
0.09873892, 0.1680456, 0.9472406, 0, 0.8745098, 1, 1,
0.09911212, -1.154189, 4.931852, 0, 0.8666667, 1, 1,
0.09980383, -1.340281, 3.411839, 0, 0.8627451, 1, 1,
0.09999806, -0.4788307, 3.159439, 0, 0.854902, 1, 1,
0.1024415, 0.9320492, -0.7444572, 0, 0.8509804, 1, 1,
0.10579, -0.3853332, 3.323289, 0, 0.8431373, 1, 1,
0.1059668, 0.1479444, 1.040539, 0, 0.8392157, 1, 1,
0.1062506, -0.007585596, 1.973574, 0, 0.8313726, 1, 1,
0.1069678, 2.307935, -0.2981692, 0, 0.827451, 1, 1,
0.1111898, 0.02273951, 0.8346359, 0, 0.8196079, 1, 1,
0.1141501, -0.6513202, 2.124568, 0, 0.8156863, 1, 1,
0.1158512, 1.554866, 1.850598, 0, 0.8078431, 1, 1,
0.1169902, -0.9775073, 1.547662, 0, 0.8039216, 1, 1,
0.1174304, -1.000703, 3.977973, 0, 0.7960784, 1, 1,
0.1188387, -0.4764494, 1.983013, 0, 0.7882353, 1, 1,
0.1213853, 0.7293221, -0.5983545, 0, 0.7843137, 1, 1,
0.1230445, 2.453337, -0.7002257, 0, 0.7764706, 1, 1,
0.1236904, 1.936729, 1.161273, 0, 0.772549, 1, 1,
0.1245532, -0.4060739, 3.07463, 0, 0.7647059, 1, 1,
0.1245561, -0.9955688, 0.4385524, 0, 0.7607843, 1, 1,
0.1289077, -1.050397, 3.804173, 0, 0.7529412, 1, 1,
0.1357521, 0.3282253, 1.512158, 0, 0.7490196, 1, 1,
0.1400019, 1.31383, -0.5918272, 0, 0.7411765, 1, 1,
0.1407667, -0.02542922, 2.011178, 0, 0.7372549, 1, 1,
0.1417225, -0.7256185, 3.069337, 0, 0.7294118, 1, 1,
0.1433547, 0.5881518, 0.450681, 0, 0.7254902, 1, 1,
0.1449931, -1.630356, 3.594014, 0, 0.7176471, 1, 1,
0.1480327, 0.5878434, -1.067304, 0, 0.7137255, 1, 1,
0.1523977, -0.5739763, 4.092169, 0, 0.7058824, 1, 1,
0.1536312, 0.2801008, 1.025706, 0, 0.6980392, 1, 1,
0.1541061, -0.2785321, 2.030688, 0, 0.6941177, 1, 1,
0.1583297, -0.3726072, 4.859312, 0, 0.6862745, 1, 1,
0.1625393, 0.5668967, 0.7285864, 0, 0.682353, 1, 1,
0.1630533, 2.203513, 1.576848, 0, 0.6745098, 1, 1,
0.1660467, 0.4639224, 1.085555, 0, 0.6705883, 1, 1,
0.1668406, -0.6933652, 4.071424, 0, 0.6627451, 1, 1,
0.1678791, 0.3766218, 0.5391629, 0, 0.6588235, 1, 1,
0.1720405, 1.804357, 0.625591, 0, 0.6509804, 1, 1,
0.1727269, 2.213349, 1.148702, 0, 0.6470588, 1, 1,
0.1729873, -0.8081605, 1.274136, 0, 0.6392157, 1, 1,
0.1794404, 0.4829664, 0.6619225, 0, 0.6352941, 1, 1,
0.1855453, 1.390013, 0.6448687, 0, 0.627451, 1, 1,
0.1878028, 0.738243, -2.359833, 0, 0.6235294, 1, 1,
0.193427, -0.8192771, 3.179212, 0, 0.6156863, 1, 1,
0.1949126, 0.07936616, 2.405886, 0, 0.6117647, 1, 1,
0.1953555, 0.1486745, -1.088737, 0, 0.6039216, 1, 1,
0.1963206, 1.05676, 1.295769, 0, 0.5960785, 1, 1,
0.1979665, 0.3561246, -0.2667463, 0, 0.5921569, 1, 1,
0.1990918, -1.287819, 3.993256, 0, 0.5843138, 1, 1,
0.2025294, -1.053582, 1.963816, 0, 0.5803922, 1, 1,
0.2130809, -0.4798571, 3.024753, 0, 0.572549, 1, 1,
0.2132923, 0.3211046, 0.05716611, 0, 0.5686275, 1, 1,
0.2138108, 0.4351713, -0.1068696, 0, 0.5607843, 1, 1,
0.2143776, 0.1552483, 1.201564, 0, 0.5568628, 1, 1,
0.2145092, 0.09526069, 1.943479, 0, 0.5490196, 1, 1,
0.2194692, -1.925934, 3.236254, 0, 0.5450981, 1, 1,
0.2197461, 0.7141175, -1.120862, 0, 0.5372549, 1, 1,
0.2221262, -0.1909641, -0.1772966, 0, 0.5333334, 1, 1,
0.2252283, 0.497778, 1.444854, 0, 0.5254902, 1, 1,
0.2266961, 0.9187835, 0.6339356, 0, 0.5215687, 1, 1,
0.227222, 0.2636203, -0.3257461, 0, 0.5137255, 1, 1,
0.2272911, 0.3693682, 2.546458, 0, 0.509804, 1, 1,
0.2274128, 1.59796, 2.290416, 0, 0.5019608, 1, 1,
0.2347926, -1.068973, 2.864224, 0, 0.4941176, 1, 1,
0.2352065, -1.267159, 2.47998, 0, 0.4901961, 1, 1,
0.2381516, 0.165046, 1.734422, 0, 0.4823529, 1, 1,
0.2389477, 1.51069, 0.5751398, 0, 0.4784314, 1, 1,
0.2426532, -0.5487813, 3.642278, 0, 0.4705882, 1, 1,
0.2427392, 0.1703211, -0.03455723, 0, 0.4666667, 1, 1,
0.2428094, -0.4171552, 3.387105, 0, 0.4588235, 1, 1,
0.2436075, -0.09302795, 2.599724, 0, 0.454902, 1, 1,
0.2500026, -0.5983766, 2.865565, 0, 0.4470588, 1, 1,
0.2547958, -0.08332483, 2.061096, 0, 0.4431373, 1, 1,
0.266036, -1.255228, 1.128669, 0, 0.4352941, 1, 1,
0.2669184, -0.5060058, 3.488165, 0, 0.4313726, 1, 1,
0.2695385, -0.6356833, 1.227795, 0, 0.4235294, 1, 1,
0.2696115, -2.837513, 2.255476, 0, 0.4196078, 1, 1,
0.2697148, -1.654429, 4.291021, 0, 0.4117647, 1, 1,
0.270654, -1.464823, 1.486368, 0, 0.4078431, 1, 1,
0.2722969, 0.0259656, 0.08954247, 0, 0.4, 1, 1,
0.2789408, 0.4076231, 0.9229203, 0, 0.3921569, 1, 1,
0.2841392, -0.0816559, 0.6172779, 0, 0.3882353, 1, 1,
0.2859246, -1.65873, 2.368641, 0, 0.3803922, 1, 1,
0.2878237, 0.2356682, 0.3944745, 0, 0.3764706, 1, 1,
0.2900482, -1.829572, 1.368557, 0, 0.3686275, 1, 1,
0.2915277, 0.9275258, 0.302199, 0, 0.3647059, 1, 1,
0.2939646, 1.557018, -0.4580427, 0, 0.3568628, 1, 1,
0.2970497, -0.6058983, 2.67226, 0, 0.3529412, 1, 1,
0.2970882, 0.7425982, 0.993396, 0, 0.345098, 1, 1,
0.2975679, 0.5651908, -0.3056474, 0, 0.3411765, 1, 1,
0.2996951, 1.855347, 1.124418, 0, 0.3333333, 1, 1,
0.3002033, -1.146607, 0.3042561, 0, 0.3294118, 1, 1,
0.3015544, -1.262059, 3.165384, 0, 0.3215686, 1, 1,
0.3017504, -0.4241761, 2.860422, 0, 0.3176471, 1, 1,
0.3023064, 0.3065079, 0.01101395, 0, 0.3098039, 1, 1,
0.3045282, -0.516109, 2.363272, 0, 0.3058824, 1, 1,
0.306793, -1.122015, 3.531087, 0, 0.2980392, 1, 1,
0.3103371, 1.450114, 0.4782927, 0, 0.2901961, 1, 1,
0.3119102, 1.016396, -0.1650673, 0, 0.2862745, 1, 1,
0.3144615, 0.1325847, 2.237114, 0, 0.2784314, 1, 1,
0.318119, -0.4321894, 4.44991, 0, 0.2745098, 1, 1,
0.3277927, 1.531414, 0.6482178, 0, 0.2666667, 1, 1,
0.3299744, -1.188432, 3.14169, 0, 0.2627451, 1, 1,
0.3310475, 0.7591732, 1.833861, 0, 0.254902, 1, 1,
0.3356095, -0.5632946, 1.466699, 0, 0.2509804, 1, 1,
0.3396406, -1.701351, 3.660685, 0, 0.2431373, 1, 1,
0.3418107, 0.6328379, 0.666491, 0, 0.2392157, 1, 1,
0.3419098, 0.549893, 0.477031, 0, 0.2313726, 1, 1,
0.3427863, -0.1301042, 1.501159, 0, 0.227451, 1, 1,
0.3453675, 0.6235145, 1.419597, 0, 0.2196078, 1, 1,
0.3461373, 0.06229772, 1.433441, 0, 0.2156863, 1, 1,
0.3517624, 0.07977837, 1.986232, 0, 0.2078431, 1, 1,
0.3529644, 1.912623, -0.5203394, 0, 0.2039216, 1, 1,
0.3531199, 0.6451159, -0.3174253, 0, 0.1960784, 1, 1,
0.3553222, 0.6466333, 0.1367619, 0, 0.1882353, 1, 1,
0.3604761, 0.2229948, 1.834083, 0, 0.1843137, 1, 1,
0.3607126, 0.03080638, 2.415123, 0, 0.1764706, 1, 1,
0.3614143, -0.2253415, 1.786119, 0, 0.172549, 1, 1,
0.3635571, -1.317551, 5.304675, 0, 0.1647059, 1, 1,
0.3653799, -0.2931138, 4.012514, 0, 0.1607843, 1, 1,
0.3661432, -0.392828, 1.036335, 0, 0.1529412, 1, 1,
0.3664654, -1.123647, 2.698976, 0, 0.1490196, 1, 1,
0.3770113, 0.2490175, 1.520424, 0, 0.1411765, 1, 1,
0.3776876, 0.5727693, -0.381899, 0, 0.1372549, 1, 1,
0.3796833, -0.4665221, 2.863755, 0, 0.1294118, 1, 1,
0.3834172, -0.06999048, 3.03581, 0, 0.1254902, 1, 1,
0.3857703, -0.09951574, 2.893523, 0, 0.1176471, 1, 1,
0.38682, -1.347853, 3.879592, 0, 0.1137255, 1, 1,
0.3878424, -0.2178955, 1.329006, 0, 0.1058824, 1, 1,
0.3924087, -0.4782161, 3.578321, 0, 0.09803922, 1, 1,
0.3934102, 0.7017524, 0.9436948, 0, 0.09411765, 1, 1,
0.3935007, -0.4725603, 3.347032, 0, 0.08627451, 1, 1,
0.397195, 0.2620716, -0.1312456, 0, 0.08235294, 1, 1,
0.3975253, 1.299899, 1.681907, 0, 0.07450981, 1, 1,
0.397887, 0.7501608, 0.438144, 0, 0.07058824, 1, 1,
0.3984162, -0.1909243, 0.7889165, 0, 0.0627451, 1, 1,
0.40063, 0.3970805, 3.956056, 0, 0.05882353, 1, 1,
0.4008212, -0.2623301, 0.988768, 0, 0.05098039, 1, 1,
0.4031229, 1.465733, 0.5681661, 0, 0.04705882, 1, 1,
0.4065381, -0.7810056, 5.176716, 0, 0.03921569, 1, 1,
0.407443, 0.2137182, 0.7100377, 0, 0.03529412, 1, 1,
0.4076828, 0.3621917, -0.5195373, 0, 0.02745098, 1, 1,
0.4112926, 1.02272, 2.656665, 0, 0.02352941, 1, 1,
0.4270358, -0.4663009, 0.5965804, 0, 0.01568628, 1, 1,
0.4285024, -0.6826555, 2.357358, 0, 0.01176471, 1, 1,
0.4305952, -0.7671795, 1.267676, 0, 0.003921569, 1, 1,
0.4359526, 1.333607, -1.280212, 0.003921569, 0, 1, 1,
0.4419619, 0.0408281, 0.6341954, 0.007843138, 0, 1, 1,
0.4422559, -0.5168037, 2.088735, 0.01568628, 0, 1, 1,
0.4440714, -0.9132801, 3.766803, 0.01960784, 0, 1, 1,
0.4451839, -0.8278828, 0.3086836, 0.02745098, 0, 1, 1,
0.4503228, 0.3217908, 0.9354222, 0.03137255, 0, 1, 1,
0.4549289, -1.010997, 3.517265, 0.03921569, 0, 1, 1,
0.4550341, -0.3787189, 2.052845, 0.04313726, 0, 1, 1,
0.4553883, -1.248324, 3.271928, 0.05098039, 0, 1, 1,
0.4571314, -0.6628945, 3.001616, 0.05490196, 0, 1, 1,
0.4661967, -0.7718133, 1.037029, 0.0627451, 0, 1, 1,
0.4708157, 0.02509953, 1.68092, 0.06666667, 0, 1, 1,
0.4729111, 0.5342668, -0.05122988, 0.07450981, 0, 1, 1,
0.4741403, -1.073158, 3.002022, 0.07843138, 0, 1, 1,
0.4760353, -0.1589853, -0.5101487, 0.08627451, 0, 1, 1,
0.4781311, -1.168819, 1.490825, 0.09019608, 0, 1, 1,
0.4791968, 0.7144847, 3.131239, 0.09803922, 0, 1, 1,
0.4854414, 0.912375, 0.7218484, 0.1058824, 0, 1, 1,
0.4886999, -0.7176225, 2.637467, 0.1098039, 0, 1, 1,
0.4893832, 0.6414704, 0.4296032, 0.1176471, 0, 1, 1,
0.4928796, 0.9249856, 0.6894836, 0.1215686, 0, 1, 1,
0.4935466, -0.7008043, 0.8025889, 0.1294118, 0, 1, 1,
0.4978083, 0.1770112, 1.530119, 0.1333333, 0, 1, 1,
0.5000551, 0.6939941, 0.6882943, 0.1411765, 0, 1, 1,
0.5040253, -0.9704582, 3.124514, 0.145098, 0, 1, 1,
0.5055011, 1.999379, 1.131045, 0.1529412, 0, 1, 1,
0.5062638, -2.466242, 2.771132, 0.1568628, 0, 1, 1,
0.5064822, -0.5974241, 2.97477, 0.1647059, 0, 1, 1,
0.5087593, 1.725432, 0.1619063, 0.1686275, 0, 1, 1,
0.5089555, 1.491829, 0.8963954, 0.1764706, 0, 1, 1,
0.5117596, 0.09319083, 2.629804, 0.1803922, 0, 1, 1,
0.514804, -2.127532, 4.546984, 0.1882353, 0, 1, 1,
0.5173451, 1.112921, 1.20046, 0.1921569, 0, 1, 1,
0.5230384, 0.5692948, 1.487001, 0.2, 0, 1, 1,
0.524739, -0.1661272, 2.676331, 0.2078431, 0, 1, 1,
0.532439, 0.3868285, 1.830252, 0.2117647, 0, 1, 1,
0.535466, -0.9770787, 3.151605, 0.2196078, 0, 1, 1,
0.5438081, -0.2839352, 2.783633, 0.2235294, 0, 1, 1,
0.5475422, 1.127582, -0.7879335, 0.2313726, 0, 1, 1,
0.5503352, -0.9703897, 2.683988, 0.2352941, 0, 1, 1,
0.5531358, 1.12463, -1.818846, 0.2431373, 0, 1, 1,
0.5546733, -0.691358, 2.571928, 0.2470588, 0, 1, 1,
0.5555317, 0.2917605, 1.149635, 0.254902, 0, 1, 1,
0.5590588, 0.6276801, 0.792447, 0.2588235, 0, 1, 1,
0.5600821, -2.85099, 3.421176, 0.2666667, 0, 1, 1,
0.560476, 0.3545052, 1.73606, 0.2705882, 0, 1, 1,
0.5610048, 1.645692, 0.6234614, 0.2784314, 0, 1, 1,
0.561324, -0.2277344, 0.8982425, 0.282353, 0, 1, 1,
0.5616071, 1.379572, 0.6340023, 0.2901961, 0, 1, 1,
0.5681466, -1.079136, 1.690631, 0.2941177, 0, 1, 1,
0.5753347, -1.328215, 3.317391, 0.3019608, 0, 1, 1,
0.5755975, -0.6897185, 0.5001322, 0.3098039, 0, 1, 1,
0.5829782, -0.1969695, 1.262221, 0.3137255, 0, 1, 1,
0.5859242, -1.30029, 2.504053, 0.3215686, 0, 1, 1,
0.5862995, 1.574986, 0.88644, 0.3254902, 0, 1, 1,
0.5969103, 0.03643288, 0.6720967, 0.3333333, 0, 1, 1,
0.6003101, 0.5062921, 0.3217738, 0.3372549, 0, 1, 1,
0.6013418, -0.03373871, 2.013819, 0.345098, 0, 1, 1,
0.6030222, 0.7475094, 1.406809, 0.3490196, 0, 1, 1,
0.6085715, 0.6975419, 1.37017, 0.3568628, 0, 1, 1,
0.6139426, -0.5925403, 3.50124, 0.3607843, 0, 1, 1,
0.6152954, -0.3091942, 1.932786, 0.3686275, 0, 1, 1,
0.6188968, 0.01936498, 2.957478, 0.372549, 0, 1, 1,
0.6198772, -0.3635592, 3.921304, 0.3803922, 0, 1, 1,
0.6204125, -0.1606521, 2.465893, 0.3843137, 0, 1, 1,
0.6323789, -0.358109, -0.363335, 0.3921569, 0, 1, 1,
0.6413236, -0.3212516, 1.83368, 0.3960784, 0, 1, 1,
0.644156, 1.003709, -0.356332, 0.4039216, 0, 1, 1,
0.6442248, -1.056725, 2.205916, 0.4117647, 0, 1, 1,
0.6454028, -0.8154057, 3.343058, 0.4156863, 0, 1, 1,
0.6456887, 1.575452, 2.660607, 0.4235294, 0, 1, 1,
0.6472238, -1.203776, 2.974929, 0.427451, 0, 1, 1,
0.652618, 0.2416507, -0.4122222, 0.4352941, 0, 1, 1,
0.6541746, 0.3919497, 2.552349, 0.4392157, 0, 1, 1,
0.6542174, 1.036841, 1.180568, 0.4470588, 0, 1, 1,
0.6569735, -0.9234252, 2.98698, 0.4509804, 0, 1, 1,
0.6587943, -0.4719625, 3.12941, 0.4588235, 0, 1, 1,
0.6593124, 0.09108724, 0.5468101, 0.4627451, 0, 1, 1,
0.6597006, -0.9113399, 1.522643, 0.4705882, 0, 1, 1,
0.6614386, -3.255922, 4.885721, 0.4745098, 0, 1, 1,
0.662129, -1.51979, 2.881214, 0.4823529, 0, 1, 1,
0.6655711, 1.141245, 1.247923, 0.4862745, 0, 1, 1,
0.6676545, -1.232888, 1.885542, 0.4941176, 0, 1, 1,
0.674332, -0.3919052, 1.774688, 0.5019608, 0, 1, 1,
0.6769999, 0.7970119, 0.9645205, 0.5058824, 0, 1, 1,
0.6777722, -1.782617, 3.833632, 0.5137255, 0, 1, 1,
0.6806022, 1.235574, -0.3706076, 0.5176471, 0, 1, 1,
0.6820627, 0.4144509, 0.4600394, 0.5254902, 0, 1, 1,
0.6868461, -0.9172279, 2.8446, 0.5294118, 0, 1, 1,
0.6911086, 0.3526044, 1.166057, 0.5372549, 0, 1, 1,
0.6932209, -1.92299, 3.978317, 0.5411765, 0, 1, 1,
0.6935409, 0.0003697098, 1.23017, 0.5490196, 0, 1, 1,
0.6994511, -0.5932361, 2.286839, 0.5529412, 0, 1, 1,
0.7041719, -1.845513, 3.256626, 0.5607843, 0, 1, 1,
0.7072626, 0.2500992, 1.914981, 0.5647059, 0, 1, 1,
0.7124915, -0.2428956, 2.874059, 0.572549, 0, 1, 1,
0.7190294, -0.200938, 0.6240749, 0.5764706, 0, 1, 1,
0.7197053, 0.1364376, 1.857119, 0.5843138, 0, 1, 1,
0.7204183, 0.193969, 1.015219, 0.5882353, 0, 1, 1,
0.7228199, -0.770721, 2.704099, 0.5960785, 0, 1, 1,
0.7308344, 0.8352855, 0.9777635, 0.6039216, 0, 1, 1,
0.7349596, 0.3944792, -0.1713599, 0.6078432, 0, 1, 1,
0.7357736, -0.6092967, 2.301919, 0.6156863, 0, 1, 1,
0.7361646, 1.48014, 1.02426, 0.6196079, 0, 1, 1,
0.7374272, -0.2578149, 0.9918801, 0.627451, 0, 1, 1,
0.7387245, -0.6640109, 2.230928, 0.6313726, 0, 1, 1,
0.7415541, -0.03879547, 1.290612, 0.6392157, 0, 1, 1,
0.7436641, 0.3128082, 1.678444, 0.6431373, 0, 1, 1,
0.7481835, -1.828524, 3.218596, 0.6509804, 0, 1, 1,
0.7512897, 0.7223124, 0.8935412, 0.654902, 0, 1, 1,
0.7596445, -0.05677849, 2.110571, 0.6627451, 0, 1, 1,
0.7601801, 0.5490369, 1.059025, 0.6666667, 0, 1, 1,
0.7627598, 0.4934452, 0.6395973, 0.6745098, 0, 1, 1,
0.7631978, -0.4315515, 1.318903, 0.6784314, 0, 1, 1,
0.7648255, 0.05233493, 0.8580834, 0.6862745, 0, 1, 1,
0.7703933, 0.682226, 0.7911551, 0.6901961, 0, 1, 1,
0.7734631, -0.2188276, 1.616635, 0.6980392, 0, 1, 1,
0.7792559, 0.6216578, 0.5008968, 0.7058824, 0, 1, 1,
0.7815291, -0.4694191, 1.835783, 0.7098039, 0, 1, 1,
0.7971455, 0.009842171, 1.964332, 0.7176471, 0, 1, 1,
0.7976434, -0.8553576, 1.304772, 0.7215686, 0, 1, 1,
0.8037378, -0.196492, -0.2778935, 0.7294118, 0, 1, 1,
0.8101858, 1.03239, 1.309564, 0.7333333, 0, 1, 1,
0.8149028, -0.2595176, 2.130084, 0.7411765, 0, 1, 1,
0.8233515, -0.6346774, 1.526636, 0.7450981, 0, 1, 1,
0.824882, -0.3436904, 1.662174, 0.7529412, 0, 1, 1,
0.8251436, 0.9168802, -0.2482547, 0.7568628, 0, 1, 1,
0.8264416, 0.3766229, 0.863058, 0.7647059, 0, 1, 1,
0.8302441, 1.120324, 1.622861, 0.7686275, 0, 1, 1,
0.8354825, -2.102883, 1.826345, 0.7764706, 0, 1, 1,
0.8358249, -0.03985514, 0.3903625, 0.7803922, 0, 1, 1,
0.8442464, -0.2157832, 0.4556746, 0.7882353, 0, 1, 1,
0.8477551, -0.1369665, 1.504129, 0.7921569, 0, 1, 1,
0.8517472, 1.659238, 0.1914622, 0.8, 0, 1, 1,
0.8518558, -0.5073533, 1.761909, 0.8078431, 0, 1, 1,
0.8526128, 0.9918588, 0.8701378, 0.8117647, 0, 1, 1,
0.8559198, 0.578638, 1.228418, 0.8196079, 0, 1, 1,
0.8632371, 0.1136752, 0.6056628, 0.8235294, 0, 1, 1,
0.8746134, 0.07864469, 0.3580169, 0.8313726, 0, 1, 1,
0.8767002, -0.719546, 2.970754, 0.8352941, 0, 1, 1,
0.8768732, -0.01529275, 1.30542, 0.8431373, 0, 1, 1,
0.8830003, -0.136517, 2.05462, 0.8470588, 0, 1, 1,
0.8837519, -0.4067363, 2.07275, 0.854902, 0, 1, 1,
0.8897972, -0.3317026, 2.239861, 0.8588235, 0, 1, 1,
0.9011871, -0.7830091, 3.243629, 0.8666667, 0, 1, 1,
0.9064891, 1.31261, 0.99908, 0.8705882, 0, 1, 1,
0.9070466, 0.052023, 1.786177, 0.8784314, 0, 1, 1,
0.9083266, 1.705623, 1.38702, 0.8823529, 0, 1, 1,
0.9118288, -1.326105, 0.2585367, 0.8901961, 0, 1, 1,
0.9151555, 2.263253, -0.07507133, 0.8941177, 0, 1, 1,
0.9153203, -1.484023, 1.742103, 0.9019608, 0, 1, 1,
0.9153671, 1.26532, 0.6060643, 0.9098039, 0, 1, 1,
0.9173831, 0.4351383, 1.983106, 0.9137255, 0, 1, 1,
0.9201485, 0.7815407, 1.14879, 0.9215686, 0, 1, 1,
0.9322928, -0.324801, 2.315289, 0.9254902, 0, 1, 1,
0.9323366, -0.4057585, 3.764926, 0.9333333, 0, 1, 1,
0.935811, 0.3107732, -0.1312476, 0.9372549, 0, 1, 1,
0.937257, -1.726785, 1.824584, 0.945098, 0, 1, 1,
0.9373278, -0.1539391, 1.160476, 0.9490196, 0, 1, 1,
0.9373556, -1.121766, 3.998921, 0.9568627, 0, 1, 1,
0.9374321, -1.816713, 2.132953, 0.9607843, 0, 1, 1,
0.9380592, -1.144703, 0.6892695, 0.9686275, 0, 1, 1,
0.941115, 1.377405, -0.6080539, 0.972549, 0, 1, 1,
0.9437242, 1.117989, 2.121916, 0.9803922, 0, 1, 1,
0.945211, 0.4477659, 2.57269, 0.9843137, 0, 1, 1,
0.9466704, 0.9015626, 0.3013682, 0.9921569, 0, 1, 1,
0.9495626, -0.03954139, 2.951082, 0.9960784, 0, 1, 1,
0.9516096, 0.02991771, 1.069291, 1, 0, 0.9960784, 1,
0.9550489, 0.6129981, 1.851065, 1, 0, 0.9882353, 1,
0.9624892, -0.2883045, 1.5248, 1, 0, 0.9843137, 1,
0.9758423, 0.9076739, -0.4211029, 1, 0, 0.9764706, 1,
0.9812135, 0.2080375, 1.028953, 1, 0, 0.972549, 1,
0.988152, -0.05625258, 2.533512, 1, 0, 0.9647059, 1,
0.9886249, 0.5158858, 0.6186975, 1, 0, 0.9607843, 1,
0.997479, 1.913978, 1.255474, 1, 0, 0.9529412, 1,
1.001312, 2.675498, 3.054745, 1, 0, 0.9490196, 1,
1.002037, 0.5707184, 0.4023358, 1, 0, 0.9411765, 1,
1.002299, -1.142375, 2.346252, 1, 0, 0.9372549, 1,
1.002424, 2.01607, -0.6886917, 1, 0, 0.9294118, 1,
1.007451, -0.9881232, 1.820499, 1, 0, 0.9254902, 1,
1.009121, -2.822958, 3.038361, 1, 0, 0.9176471, 1,
1.012908, -1.457573, 1.438286, 1, 0, 0.9137255, 1,
1.019302, -1.03915, 3.072025, 1, 0, 0.9058824, 1,
1.025055, -0.2249339, 1.436177, 1, 0, 0.9019608, 1,
1.033816, 0.01888409, 2.12863, 1, 0, 0.8941177, 1,
1.03586, 0.4291614, -0.2365949, 1, 0, 0.8862745, 1,
1.038816, 1.165462, 0.814485, 1, 0, 0.8823529, 1,
1.040926, 1.998464, -0.5672946, 1, 0, 0.8745098, 1,
1.041122, 0.06315812, -0.2076244, 1, 0, 0.8705882, 1,
1.04749, -1.3985, 2.913388, 1, 0, 0.8627451, 1,
1.063541, 0.9640748, -0.07374337, 1, 0, 0.8588235, 1,
1.082485, 1.096416, 1.612678, 1, 0, 0.8509804, 1,
1.085061, 1.288753, -0.1148313, 1, 0, 0.8470588, 1,
1.088995, -1.221808, 3.085121, 1, 0, 0.8392157, 1,
1.094482, 0.08538228, 3.530475, 1, 0, 0.8352941, 1,
1.101079, 1.46259, 0.2252219, 1, 0, 0.827451, 1,
1.102887, 1.139996, 1.839341, 1, 0, 0.8235294, 1,
1.10517, -0.8532009, 4.223701, 1, 0, 0.8156863, 1,
1.10567, -0.07251679, 0.9066867, 1, 0, 0.8117647, 1,
1.110715, 0.2566777, 1.38739, 1, 0, 0.8039216, 1,
1.12184, 0.5417759, -0.5680313, 1, 0, 0.7960784, 1,
1.126479, -0.4803683, 1.799104, 1, 0, 0.7921569, 1,
1.127565, 0.2602401, 1.528793, 1, 0, 0.7843137, 1,
1.129986, -1.09965, 1.799829, 1, 0, 0.7803922, 1,
1.130638, 1.687792, 0.6659226, 1, 0, 0.772549, 1,
1.132778, -1.113002, 2.747301, 1, 0, 0.7686275, 1,
1.132984, 0.5390666, 0.631664, 1, 0, 0.7607843, 1,
1.136013, 2.251887, 1.083202, 1, 0, 0.7568628, 1,
1.140951, 1.016532, -0.3491542, 1, 0, 0.7490196, 1,
1.141052, 1.140919, 0.9463449, 1, 0, 0.7450981, 1,
1.141665, -0.4020329, 1.076959, 1, 0, 0.7372549, 1,
1.152147, 2.201969, -2.074982, 1, 0, 0.7333333, 1,
1.152603, 1.66492, 1.366122, 1, 0, 0.7254902, 1,
1.155897, 0.9156648, 0.2888233, 1, 0, 0.7215686, 1,
1.156449, -1.564444, 3.103575, 1, 0, 0.7137255, 1,
1.160783, 1.025519, 0.6773099, 1, 0, 0.7098039, 1,
1.16288, -1.986981, 2.541276, 1, 0, 0.7019608, 1,
1.167886, -0.7535006, 2.428037, 1, 0, 0.6941177, 1,
1.188601, 1.300774, -0.105309, 1, 0, 0.6901961, 1,
1.190731, -0.9409006, 4.037961, 1, 0, 0.682353, 1,
1.201227, 0.8237879, 0.8608974, 1, 0, 0.6784314, 1,
1.201277, -1.869897, 2.629704, 1, 0, 0.6705883, 1,
1.204891, -0.2113878, 1.863345, 1, 0, 0.6666667, 1,
1.207749, -1.625413, 2.021805, 1, 0, 0.6588235, 1,
1.210605, -0.2545331, 1.020617, 1, 0, 0.654902, 1,
1.217248, 0.706593, 0.2522969, 1, 0, 0.6470588, 1,
1.221238, 0.5668154, 2.360084, 1, 0, 0.6431373, 1,
1.222015, 1.222139, 0.7770627, 1, 0, 0.6352941, 1,
1.223481, 0.6496509, 2.553336, 1, 0, 0.6313726, 1,
1.224335, 0.8965119, 0.2741638, 1, 0, 0.6235294, 1,
1.22469, 0.4672673, 1.413793, 1, 0, 0.6196079, 1,
1.227235, -1.185232, 2.366563, 1, 0, 0.6117647, 1,
1.230615, -1.68345, 1.821037, 1, 0, 0.6078432, 1,
1.2605, -0.1442048, 0.4976003, 1, 0, 0.6, 1,
1.261778, 1.039218, 1.19898, 1, 0, 0.5921569, 1,
1.27112, -1.406218, 3.61359, 1, 0, 0.5882353, 1,
1.271403, -0.1693084, 1.800978, 1, 0, 0.5803922, 1,
1.272415, 1.929314, -0.5822345, 1, 0, 0.5764706, 1,
1.280517, 0.8316483, 1.175942, 1, 0, 0.5686275, 1,
1.283987, -0.2349716, 1.625364, 1, 0, 0.5647059, 1,
1.29431, -0.9279163, 1.937582, 1, 0, 0.5568628, 1,
1.294467, 0.803843, 1.122541, 1, 0, 0.5529412, 1,
1.295647, -1.173923, 1.494199, 1, 0, 0.5450981, 1,
1.302044, 0.1754134, -0.2993211, 1, 0, 0.5411765, 1,
1.302947, -0.2608295, 2.62557, 1, 0, 0.5333334, 1,
1.303295, -0.22917, 0.9103043, 1, 0, 0.5294118, 1,
1.313743, -0.2325302, 1.941989, 1, 0, 0.5215687, 1,
1.325879, 0.3021731, -1.561524, 1, 0, 0.5176471, 1,
1.332023, 0.6961951, 1.840391, 1, 0, 0.509804, 1,
1.336908, -0.2733704, -0.02181071, 1, 0, 0.5058824, 1,
1.344006, -1.056483, 3.738197, 1, 0, 0.4980392, 1,
1.34985, 0.3841586, 1.630634, 1, 0, 0.4901961, 1,
1.351023, 1.09386, 1.60149, 1, 0, 0.4862745, 1,
1.361524, -0.1761405, 2.950135, 1, 0, 0.4784314, 1,
1.362104, -0.4999306, 2.838744, 1, 0, 0.4745098, 1,
1.383604, 0.9125223, 2.591376, 1, 0, 0.4666667, 1,
1.395579, 1.392938, 1.809632, 1, 0, 0.4627451, 1,
1.397118, -0.6779351, 1.190212, 1, 0, 0.454902, 1,
1.413445, 0.1367648, 2.638144, 1, 0, 0.4509804, 1,
1.417697, 0.4035491, -0.1249113, 1, 0, 0.4431373, 1,
1.439512, -1.647932, 0.9083843, 1, 0, 0.4392157, 1,
1.461139, 1.057068, 2.736179, 1, 0, 0.4313726, 1,
1.464562, -0.6832805, 1.519784, 1, 0, 0.427451, 1,
1.475286, -1.007659, 3.376961, 1, 0, 0.4196078, 1,
1.482574, -0.4382411, 0.3692274, 1, 0, 0.4156863, 1,
1.484515, 0.1451343, 0.9683673, 1, 0, 0.4078431, 1,
1.485097, 0.07265997, -0.2259562, 1, 0, 0.4039216, 1,
1.496663, 0.652025, 1.650758, 1, 0, 0.3960784, 1,
1.497284, -0.8207081, 2.261996, 1, 0, 0.3882353, 1,
1.502821, -0.5902225, 1.971262, 1, 0, 0.3843137, 1,
1.513697, 0.1811969, 0.9394839, 1, 0, 0.3764706, 1,
1.519587, 0.7164439, 0.422234, 1, 0, 0.372549, 1,
1.523792, -0.5442101, 5.157959, 1, 0, 0.3647059, 1,
1.535442, -1.594411, 2.157258, 1, 0, 0.3607843, 1,
1.536159, 1.639358, 0.8049171, 1, 0, 0.3529412, 1,
1.542214, 0.5597293, 0.686128, 1, 0, 0.3490196, 1,
1.546505, -0.09645583, 2.149891, 1, 0, 0.3411765, 1,
1.550817, -0.8063, 2.256653, 1, 0, 0.3372549, 1,
1.554026, 0.657213, 0.2165129, 1, 0, 0.3294118, 1,
1.566601, 0.6901159, 3.586812, 1, 0, 0.3254902, 1,
1.583384, 0.6321803, 0.6600024, 1, 0, 0.3176471, 1,
1.588406, -0.4939882, 2.102162, 1, 0, 0.3137255, 1,
1.594554, -0.08414965, 1.897176, 1, 0, 0.3058824, 1,
1.598846, 0.3351085, -0.1745852, 1, 0, 0.2980392, 1,
1.603459, -0.229762, -0.06107214, 1, 0, 0.2941177, 1,
1.604776, 1.067035, 2.573955, 1, 0, 0.2862745, 1,
1.60583, -1.266567, 3.724059, 1, 0, 0.282353, 1,
1.607701, -0.3009888, 2.825915, 1, 0, 0.2745098, 1,
1.614115, 1.976389, -0.677999, 1, 0, 0.2705882, 1,
1.621508, -0.7120655, 2.252887, 1, 0, 0.2627451, 1,
1.62349, -0.5663542, 2.650046, 1, 0, 0.2588235, 1,
1.636984, -0.2234458, 1.886125, 1, 0, 0.2509804, 1,
1.650777, -0.8929486, 1.525773, 1, 0, 0.2470588, 1,
1.680078, -0.4235387, 1.893153, 1, 0, 0.2392157, 1,
1.681351, -0.8690631, 2.878034, 1, 0, 0.2352941, 1,
1.698079, 0.4162972, 1.074423, 1, 0, 0.227451, 1,
1.702635, -2.22878, 2.92732, 1, 0, 0.2235294, 1,
1.708145, 1.061153, 1.115718, 1, 0, 0.2156863, 1,
1.710576, -1.22001, 1.498341, 1, 0, 0.2117647, 1,
1.712875, 0.2120655, 2.519038, 1, 0, 0.2039216, 1,
1.749856, 0.2659286, 1.711284, 1, 0, 0.1960784, 1,
1.776987, 0.5645872, 3.181135, 1, 0, 0.1921569, 1,
1.782342, 1.522706, 0.8437366, 1, 0, 0.1843137, 1,
1.816236, -0.02405104, 2.883392, 1, 0, 0.1803922, 1,
1.828575, 1.788905, 1.55885, 1, 0, 0.172549, 1,
1.835185, 0.6518989, 0.2916976, 1, 0, 0.1686275, 1,
1.852241, 0.6646721, 1.67879, 1, 0, 0.1607843, 1,
1.856751, 0.1225555, -0.1964127, 1, 0, 0.1568628, 1,
1.87326, -2.540772, 1.039822, 1, 0, 0.1490196, 1,
1.885211, -2.03387, 1.171172, 1, 0, 0.145098, 1,
1.886782, 0.8403348, 1.106563, 1, 0, 0.1372549, 1,
1.887891, -2.070564, 0.7264476, 1, 0, 0.1333333, 1,
1.897865, -0.6212104, 1.130478, 1, 0, 0.1254902, 1,
1.938742, -1.229265, 2.351662, 1, 0, 0.1215686, 1,
1.969343, 0.9717583, 1.654296, 1, 0, 0.1137255, 1,
1.980381, 0.6970707, 1.170675, 1, 0, 0.1098039, 1,
2.031465, -1.186269, 1.851535, 1, 0, 0.1019608, 1,
2.034847, 0.5251976, 1.064586, 1, 0, 0.09411765, 1,
2.06348, 0.2497775, 2.89869, 1, 0, 0.09019608, 1,
2.103907, -0.6372856, 3.145386, 1, 0, 0.08235294, 1,
2.129292, 0.424351, 0.7200337, 1, 0, 0.07843138, 1,
2.133489, 0.07544173, 1.403262, 1, 0, 0.07058824, 1,
2.147506, 2.344078, -0.2911058, 1, 0, 0.06666667, 1,
2.179217, 0.2556508, 2.396487, 1, 0, 0.05882353, 1,
2.271515, 0.6674767, 3.284105, 1, 0, 0.05490196, 1,
2.383164, -0.0227653, -0.5724035, 1, 0, 0.04705882, 1,
2.39418, 1.912487, 0.6275224, 1, 0, 0.04313726, 1,
2.483459, -1.653667, 3.107111, 1, 0, 0.03529412, 1,
2.620847, 0.9674189, 2.416101, 1, 0, 0.03137255, 1,
2.7263, 0.5301847, -0.04362145, 1, 0, 0.02352941, 1,
2.804467, -1.67253, 4.724312, 1, 0, 0.01960784, 1,
2.809227, -0.6616855, 3.276897, 1, 0, 0.01176471, 1,
3.175582, 0.05048196, 2.320478, 1, 0, 0.007843138, 1
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
0.1637182, -4.320347, -7.32519, 0, -0.5, 0.5, 0.5,
0.1637182, -4.320347, -7.32519, 1, -0.5, 0.5, 0.5,
0.1637182, -4.320347, -7.32519, 1, 1.5, 0.5, 0.5,
0.1637182, -4.320347, -7.32519, 0, 1.5, 0.5, 0.5
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
-3.869167, -0.1160226, -7.32519, 0, -0.5, 0.5, 0.5,
-3.869167, -0.1160226, -7.32519, 1, -0.5, 0.5, 0.5,
-3.869167, -0.1160226, -7.32519, 1, 1.5, 0.5, 0.5,
-3.869167, -0.1160226, -7.32519, 0, 1.5, 0.5, 0.5
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
-3.869167, -4.320347, -0.09501052, 0, -0.5, 0.5, 0.5,
-3.869167, -4.320347, -0.09501052, 1, -0.5, 0.5, 0.5,
-3.869167, -4.320347, -0.09501052, 1, 1.5, 0.5, 0.5,
-3.869167, -4.320347, -0.09501052, 0, 1.5, 0.5, 0.5
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
-2, -3.350119, -5.656687,
3, -3.350119, -5.656687,
-2, -3.350119, -5.656687,
-2, -3.511823, -5.934771,
-1, -3.350119, -5.656687,
-1, -3.511823, -5.934771,
0, -3.350119, -5.656687,
0, -3.511823, -5.934771,
1, -3.350119, -5.656687,
1, -3.511823, -5.934771,
2, -3.350119, -5.656687,
2, -3.511823, -5.934771,
3, -3.350119, -5.656687,
3, -3.511823, -5.934771
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
-2, -3.835233, -6.490938, 0, -0.5, 0.5, 0.5,
-2, -3.835233, -6.490938, 1, -0.5, 0.5, 0.5,
-2, -3.835233, -6.490938, 1, 1.5, 0.5, 0.5,
-2, -3.835233, -6.490938, 0, 1.5, 0.5, 0.5,
-1, -3.835233, -6.490938, 0, -0.5, 0.5, 0.5,
-1, -3.835233, -6.490938, 1, -0.5, 0.5, 0.5,
-1, -3.835233, -6.490938, 1, 1.5, 0.5, 0.5,
-1, -3.835233, -6.490938, 0, 1.5, 0.5, 0.5,
0, -3.835233, -6.490938, 0, -0.5, 0.5, 0.5,
0, -3.835233, -6.490938, 1, -0.5, 0.5, 0.5,
0, -3.835233, -6.490938, 1, 1.5, 0.5, 0.5,
0, -3.835233, -6.490938, 0, 1.5, 0.5, 0.5,
1, -3.835233, -6.490938, 0, -0.5, 0.5, 0.5,
1, -3.835233, -6.490938, 1, -0.5, 0.5, 0.5,
1, -3.835233, -6.490938, 1, 1.5, 0.5, 0.5,
1, -3.835233, -6.490938, 0, 1.5, 0.5, 0.5,
2, -3.835233, -6.490938, 0, -0.5, 0.5, 0.5,
2, -3.835233, -6.490938, 1, -0.5, 0.5, 0.5,
2, -3.835233, -6.490938, 1, 1.5, 0.5, 0.5,
2, -3.835233, -6.490938, 0, 1.5, 0.5, 0.5,
3, -3.835233, -6.490938, 0, -0.5, 0.5, 0.5,
3, -3.835233, -6.490938, 1, -0.5, 0.5, 0.5,
3, -3.835233, -6.490938, 1, 1.5, 0.5, 0.5,
3, -3.835233, -6.490938, 0, 1.5, 0.5, 0.5
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
-2.938501, -3, -5.656687,
-2.938501, 3, -5.656687,
-2.938501, -3, -5.656687,
-3.093612, -3, -5.934771,
-2.938501, -2, -5.656687,
-3.093612, -2, -5.934771,
-2.938501, -1, -5.656687,
-3.093612, -1, -5.934771,
-2.938501, 0, -5.656687,
-3.093612, 0, -5.934771,
-2.938501, 1, -5.656687,
-3.093612, 1, -5.934771,
-2.938501, 2, -5.656687,
-3.093612, 2, -5.934771,
-2.938501, 3, -5.656687,
-3.093612, 3, -5.934771
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
-3.403834, -3, -6.490938, 0, -0.5, 0.5, 0.5,
-3.403834, -3, -6.490938, 1, -0.5, 0.5, 0.5,
-3.403834, -3, -6.490938, 1, 1.5, 0.5, 0.5,
-3.403834, -3, -6.490938, 0, 1.5, 0.5, 0.5,
-3.403834, -2, -6.490938, 0, -0.5, 0.5, 0.5,
-3.403834, -2, -6.490938, 1, -0.5, 0.5, 0.5,
-3.403834, -2, -6.490938, 1, 1.5, 0.5, 0.5,
-3.403834, -2, -6.490938, 0, 1.5, 0.5, 0.5,
-3.403834, -1, -6.490938, 0, -0.5, 0.5, 0.5,
-3.403834, -1, -6.490938, 1, -0.5, 0.5, 0.5,
-3.403834, -1, -6.490938, 1, 1.5, 0.5, 0.5,
-3.403834, -1, -6.490938, 0, 1.5, 0.5, 0.5,
-3.403834, 0, -6.490938, 0, -0.5, 0.5, 0.5,
-3.403834, 0, -6.490938, 1, -0.5, 0.5, 0.5,
-3.403834, 0, -6.490938, 1, 1.5, 0.5, 0.5,
-3.403834, 0, -6.490938, 0, 1.5, 0.5, 0.5,
-3.403834, 1, -6.490938, 0, -0.5, 0.5, 0.5,
-3.403834, 1, -6.490938, 1, -0.5, 0.5, 0.5,
-3.403834, 1, -6.490938, 1, 1.5, 0.5, 0.5,
-3.403834, 1, -6.490938, 0, 1.5, 0.5, 0.5,
-3.403834, 2, -6.490938, 0, -0.5, 0.5, 0.5,
-3.403834, 2, -6.490938, 1, -0.5, 0.5, 0.5,
-3.403834, 2, -6.490938, 1, 1.5, 0.5, 0.5,
-3.403834, 2, -6.490938, 0, 1.5, 0.5, 0.5,
-3.403834, 3, -6.490938, 0, -0.5, 0.5, 0.5,
-3.403834, 3, -6.490938, 1, -0.5, 0.5, 0.5,
-3.403834, 3, -6.490938, 1, 1.5, 0.5, 0.5,
-3.403834, 3, -6.490938, 0, 1.5, 0.5, 0.5
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
-2.938501, -3.350119, -4,
-2.938501, -3.350119, 4,
-2.938501, -3.350119, -4,
-3.093612, -3.511823, -4,
-2.938501, -3.350119, -2,
-3.093612, -3.511823, -2,
-2.938501, -3.350119, 0,
-3.093612, -3.511823, 0,
-2.938501, -3.350119, 2,
-3.093612, -3.511823, 2,
-2.938501, -3.350119, 4,
-3.093612, -3.511823, 4
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
-3.403834, -3.835233, -4, 0, -0.5, 0.5, 0.5,
-3.403834, -3.835233, -4, 1, -0.5, 0.5, 0.5,
-3.403834, -3.835233, -4, 1, 1.5, 0.5, 0.5,
-3.403834, -3.835233, -4, 0, 1.5, 0.5, 0.5,
-3.403834, -3.835233, -2, 0, -0.5, 0.5, 0.5,
-3.403834, -3.835233, -2, 1, -0.5, 0.5, 0.5,
-3.403834, -3.835233, -2, 1, 1.5, 0.5, 0.5,
-3.403834, -3.835233, -2, 0, 1.5, 0.5, 0.5,
-3.403834, -3.835233, 0, 0, -0.5, 0.5, 0.5,
-3.403834, -3.835233, 0, 1, -0.5, 0.5, 0.5,
-3.403834, -3.835233, 0, 1, 1.5, 0.5, 0.5,
-3.403834, -3.835233, 0, 0, 1.5, 0.5, 0.5,
-3.403834, -3.835233, 2, 0, -0.5, 0.5, 0.5,
-3.403834, -3.835233, 2, 1, -0.5, 0.5, 0.5,
-3.403834, -3.835233, 2, 1, 1.5, 0.5, 0.5,
-3.403834, -3.835233, 2, 0, 1.5, 0.5, 0.5,
-3.403834, -3.835233, 4, 0, -0.5, 0.5, 0.5,
-3.403834, -3.835233, 4, 1, -0.5, 0.5, 0.5,
-3.403834, -3.835233, 4, 1, 1.5, 0.5, 0.5,
-3.403834, -3.835233, 4, 0, 1.5, 0.5, 0.5
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
-2.938501, -3.350119, -5.656687,
-2.938501, 3.118073, -5.656687,
-2.938501, -3.350119, 5.466666,
-2.938501, 3.118073, 5.466666,
-2.938501, -3.350119, -5.656687,
-2.938501, -3.350119, 5.466666,
-2.938501, 3.118073, -5.656687,
-2.938501, 3.118073, 5.466666,
-2.938501, -3.350119, -5.656687,
3.265938, -3.350119, -5.656687,
-2.938501, -3.350119, 5.466666,
3.265938, -3.350119, 5.466666,
-2.938501, 3.118073, -5.656687,
3.265938, 3.118073, -5.656687,
-2.938501, 3.118073, 5.466666,
3.265938, 3.118073, 5.466666,
3.265938, -3.350119, -5.656687,
3.265938, 3.118073, -5.656687,
3.265938, -3.350119, 5.466666,
3.265938, 3.118073, 5.466666,
3.265938, -3.350119, -5.656687,
3.265938, -3.350119, 5.466666,
3.265938, 3.118073, -5.656687,
3.265938, 3.118073, 5.466666
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
var radius = 7.627918;
var distance = 33.93747;
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
mvMatrix.translate( -0.1637182, 0.1160226, 0.09501052 );
mvMatrix.scale( 1.329283, 1.275079, 0.7414541 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.93747);
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
InChI_1S_C48H72O14.C<-read.table("InChI_1S_C48H72O14.C.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C48H72O14.C$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C48H72O14.C' not found
```

```r
y<-InChI_1S_C48H72O14.C$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C48H72O14.C' not found
```

```r
z<-InChI_1S_C48H72O14.C$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C48H72O14.C' not found
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
-2.848145, -2.183125, -2.238367, 0, 0, 1, 1, 1,
-2.493814, 1.320467, -0.6617352, 1, 0, 0, 1, 1,
-2.473343, 0.4288648, -0.7392187, 1, 0, 0, 1, 1,
-2.408473, -0.07564454, -0.1070848, 1, 0, 0, 1, 1,
-2.394216, -0.1176584, -2.611075, 1, 0, 0, 1, 1,
-2.303987, 0.7366381, -1.966233, 1, 0, 0, 1, 1,
-2.279918, 0.7715599, -1.062336, 0, 0, 0, 1, 1,
-2.24369, 1.348275, -2.14207, 0, 0, 0, 1, 1,
-2.243319, 0.244581, -0.3998275, 0, 0, 0, 1, 1,
-2.200844, 2.344151, -2.772424, 0, 0, 0, 1, 1,
-2.184281, 0.414888, -0.7453604, 0, 0, 0, 1, 1,
-2.182096, -0.9876813, -0.647476, 0, 0, 0, 1, 1,
-2.181762, 0.8080517, -1.637462, 0, 0, 0, 1, 1,
-2.170224, 0.8197749, -2.847098, 1, 1, 1, 1, 1,
-2.12414, -0.560084, -1.424991, 1, 1, 1, 1, 1,
-2.112889, -1.90167, -3.765359, 1, 1, 1, 1, 1,
-2.093348, -1.00358, -2.034804, 1, 1, 1, 1, 1,
-2.061433, 1.133631, -1.586188, 1, 1, 1, 1, 1,
-2.060198, -0.6698366, -2.229458, 1, 1, 1, 1, 1,
-2.017094, 0.2200069, -3.089969, 1, 1, 1, 1, 1,
-1.998208, 0.03823333, -0.9366155, 1, 1, 1, 1, 1,
-1.996521, -1.03072, -2.304383, 1, 1, 1, 1, 1,
-1.959485, 0.6455793, -2.312629, 1, 1, 1, 1, 1,
-1.950429, -0.1357716, -3.070169, 1, 1, 1, 1, 1,
-1.945219, -1.292559, -0.849446, 1, 1, 1, 1, 1,
-1.928849, -0.8942705, -1.565725, 1, 1, 1, 1, 1,
-1.926229, -0.249125, 0.3020454, 1, 1, 1, 1, 1,
-1.916074, 0.9470752, -0.5387117, 1, 1, 1, 1, 1,
-1.854665, -1.468538, -2.995981, 0, 0, 1, 1, 1,
-1.846003, -0.4683324, -1.085547, 1, 0, 0, 1, 1,
-1.828895, -1.336095, -1.81633, 1, 0, 0, 1, 1,
-1.820498, 0.1644183, -1.058405, 1, 0, 0, 1, 1,
-1.808475, 0.06533464, -2.455842, 1, 0, 0, 1, 1,
-1.801975, -0.6557143, -1.265448, 1, 0, 0, 1, 1,
-1.791486, -0.5855601, -1.403686, 0, 0, 0, 1, 1,
-1.789171, 1.161532, -1.532583, 0, 0, 0, 1, 1,
-1.727324, 0.886746, -0.8514751, 0, 0, 0, 1, 1,
-1.719195, 0.8583056, 0.7882718, 0, 0, 0, 1, 1,
-1.714458, -1.496712, -3.018958, 0, 0, 0, 1, 1,
-1.691539, -0.5438129, -1.45272, 0, 0, 0, 1, 1,
-1.684955, -1.461184, 0.1625606, 0, 0, 0, 1, 1,
-1.681664, -0.4101754, -3.658573, 1, 1, 1, 1, 1,
-1.663949, -2.004704, -1.613447, 1, 1, 1, 1, 1,
-1.659065, -0.3480886, -0.5550043, 1, 1, 1, 1, 1,
-1.623466, -0.6712065, -3.284906, 1, 1, 1, 1, 1,
-1.619635, 0.7633897, -1.203071, 1, 1, 1, 1, 1,
-1.619588, 1.048432, -0.7954348, 1, 1, 1, 1, 1,
-1.608436, -0.9180551, -2.14174, 1, 1, 1, 1, 1,
-1.58336, 0.8823094, -1.074015, 1, 1, 1, 1, 1,
-1.581285, -0.3514037, -1.176591, 1, 1, 1, 1, 1,
-1.552539, -0.8443323, -3.395248, 1, 1, 1, 1, 1,
-1.521977, 0.9987183, 1.702808, 1, 1, 1, 1, 1,
-1.509666, 1.637625, -0.2700403, 1, 1, 1, 1, 1,
-1.493045, 1.623394, -1.170114, 1, 1, 1, 1, 1,
-1.474252, 1.566942, -2.142766, 1, 1, 1, 1, 1,
-1.471097, 1.182254, -0.5652289, 1, 1, 1, 1, 1,
-1.465825, 0.7995799, -2.121645, 0, 0, 1, 1, 1,
-1.457586, 1.371435, -0.9308523, 1, 0, 0, 1, 1,
-1.453826, -1.93421, -1.449049, 1, 0, 0, 1, 1,
-1.450565, -0.3482145, -2.289288, 1, 0, 0, 1, 1,
-1.447139, 0.355532, -1.124668, 1, 0, 0, 1, 1,
-1.44431, -0.686352, -1.702087, 1, 0, 0, 1, 1,
-1.433471, 1.32949, 0.4452804, 0, 0, 0, 1, 1,
-1.418216, 0.7806685, -1.234654, 0, 0, 0, 1, 1,
-1.416918, -0.3605171, -2.361577, 0, 0, 0, 1, 1,
-1.415896, -0.146655, -1.606273, 0, 0, 0, 1, 1,
-1.414636, 0.244322, -1.378957, 0, 0, 0, 1, 1,
-1.407099, 0.6256974, -0.3138629, 0, 0, 0, 1, 1,
-1.406732, 0.5831317, -1.108415, 0, 0, 0, 1, 1,
-1.406138, 0.08849195, -2.142383, 1, 1, 1, 1, 1,
-1.406053, 0.5884437, -1.957101, 1, 1, 1, 1, 1,
-1.397943, -1.14112, -2.699215, 1, 1, 1, 1, 1,
-1.37846, -2.362687, -1.351618, 1, 1, 1, 1, 1,
-1.377989, 0.1699373, -0.9200267, 1, 1, 1, 1, 1,
-1.376176, -0.02502824, -2.160229, 1, 1, 1, 1, 1,
-1.375189, 1.090739, -0.8201073, 1, 1, 1, 1, 1,
-1.365243, 1.703769, 0.7497346, 1, 1, 1, 1, 1,
-1.352097, 0.2615785, -1.268319, 1, 1, 1, 1, 1,
-1.351038, 1.520425, -1.6081, 1, 1, 1, 1, 1,
-1.33868, -1.592227, -3.411719, 1, 1, 1, 1, 1,
-1.338397, 1.6716, -1.537902, 1, 1, 1, 1, 1,
-1.335114, -1.147018, -2.247837, 1, 1, 1, 1, 1,
-1.323588, 1.049814, -0.1174062, 1, 1, 1, 1, 1,
-1.323046, 0.9596134, -2.230742, 1, 1, 1, 1, 1,
-1.322342, -0.7337593, -2.979384, 0, 0, 1, 1, 1,
-1.305444, 0.5683727, -1.27486, 1, 0, 0, 1, 1,
-1.296446, 0.114257, -2.668787, 1, 0, 0, 1, 1,
-1.273875, 0.4191241, -1.405249, 1, 0, 0, 1, 1,
-1.258978, 1.027032, -1.09834, 1, 0, 0, 1, 1,
-1.258646, 0.6520775, -2.645117, 1, 0, 0, 1, 1,
-1.254516, 0.2033521, -1.280781, 0, 0, 0, 1, 1,
-1.253452, 0.4057693, -0.01664585, 0, 0, 0, 1, 1,
-1.245837, -1.072977, -1.932135, 0, 0, 0, 1, 1,
-1.238189, 2.73331, -0.7010049, 0, 0, 0, 1, 1,
-1.234628, 1.166775, -0.2008304, 0, 0, 0, 1, 1,
-1.233273, 0.3787387, -0.7230716, 0, 0, 0, 1, 1,
-1.231533, 0.6844541, -1.027367, 0, 0, 0, 1, 1,
-1.223466, 1.885152, 0.6413593, 1, 1, 1, 1, 1,
-1.215751, -0.1337865, -0.8665783, 1, 1, 1, 1, 1,
-1.215284, 0.7910774, 0.7373263, 1, 1, 1, 1, 1,
-1.199733, -0.3264638, -0.6654274, 1, 1, 1, 1, 1,
-1.197937, -0.4377204, -3.101678, 1, 1, 1, 1, 1,
-1.196082, 0.4606083, -0.825559, 1, 1, 1, 1, 1,
-1.193701, -0.7014729, 0.6699293, 1, 1, 1, 1, 1,
-1.182522, 2.045075, -2.01262, 1, 1, 1, 1, 1,
-1.181917, -1.117421, -1.606778, 1, 1, 1, 1, 1,
-1.170021, 3.023876, -1.614146, 1, 1, 1, 1, 1,
-1.166378, -1.101018, -2.908408, 1, 1, 1, 1, 1,
-1.165841, -0.1109592, -2.070289, 1, 1, 1, 1, 1,
-1.165134, 0.9345886, -0.9226203, 1, 1, 1, 1, 1,
-1.1598, 0.829767, -2.651901, 1, 1, 1, 1, 1,
-1.157419, 0.1124125, -1.400639, 1, 1, 1, 1, 1,
-1.143033, 0.07632942, -3.772397, 0, 0, 1, 1, 1,
-1.142642, -1.417241, -3.649135, 1, 0, 0, 1, 1,
-1.142256, -1.474292, -2.001724, 1, 0, 0, 1, 1,
-1.136274, 0.111632, -2.993667, 1, 0, 0, 1, 1,
-1.133371, -2.124178, -3.514162, 1, 0, 0, 1, 1,
-1.131419, 0.194817, -0.318528, 1, 0, 0, 1, 1,
-1.130301, -0.8379536, -3.008077, 0, 0, 0, 1, 1,
-1.119624, 0.2053791, -0.4052047, 0, 0, 0, 1, 1,
-1.108672, -0.7699795, -0.5313061, 0, 0, 0, 1, 1,
-1.096511, -2.882913, -0.9602019, 0, 0, 0, 1, 1,
-1.093774, 0.1940991, -1.21057, 0, 0, 0, 1, 1,
-1.090471, -0.7178584, -2.744506, 0, 0, 0, 1, 1,
-1.084964, 1.841733, -0.614446, 0, 0, 0, 1, 1,
-1.084859, 0.6887987, -1.035576, 1, 1, 1, 1, 1,
-1.083623, -1.027017, -1.938741, 1, 1, 1, 1, 1,
-1.082643, -2.040124, -2.366998, 1, 1, 1, 1, 1,
-1.082124, -0.1755137, -1.754633, 1, 1, 1, 1, 1,
-1.068107, -0.6811247, -2.346139, 1, 1, 1, 1, 1,
-1.067982, -2.016582, -2.838236, 1, 1, 1, 1, 1,
-1.06697, 0.2047655, -3.123879, 1, 1, 1, 1, 1,
-1.065837, 0.2042136, -1.816528, 1, 1, 1, 1, 1,
-1.054313, -0.7699686, -1.898454, 1, 1, 1, 1, 1,
-1.047771, 0.100066, -2.57925, 1, 1, 1, 1, 1,
-1.041517, 0.07565236, -1.954443, 1, 1, 1, 1, 1,
-1.039446, -1.82136, -3.800593, 1, 1, 1, 1, 1,
-1.038384, -0.04975179, -1.353886, 1, 1, 1, 1, 1,
-1.038208, -0.1275824, -3.899624, 1, 1, 1, 1, 1,
-1.035359, 0.4205385, 0.1228118, 1, 1, 1, 1, 1,
-1.021857, 0.7619565, -2.019695, 0, 0, 1, 1, 1,
-1.017367, -1.014642, -1.809902, 1, 0, 0, 1, 1,
-1.016396, 0.2795066, 0.4124194, 1, 0, 0, 1, 1,
-1.00253, 1.709008, 1.199257, 1, 0, 0, 1, 1,
-1.002375, -0.1462437, -2.431942, 1, 0, 0, 1, 1,
-1.000083, -0.3113251, -1.763915, 1, 0, 0, 1, 1,
-0.9974329, 0.9881462, -0.5235647, 0, 0, 0, 1, 1,
-0.9920712, 1.677755, 0.07975872, 0, 0, 0, 1, 1,
-0.9773042, 0.7966813, -0.4938661, 0, 0, 0, 1, 1,
-0.9765154, -1.217639, -1.553564, 0, 0, 0, 1, 1,
-0.968322, 0.7582725, -0.8494079, 0, 0, 0, 1, 1,
-0.9585316, -0.4065299, -0.906743, 0, 0, 0, 1, 1,
-0.9522079, 0.3097305, -1.935538, 0, 0, 0, 1, 1,
-0.9491119, -0.8377379, -2.526542, 1, 1, 1, 1, 1,
-0.9466155, 0.07321943, -1.19584, 1, 1, 1, 1, 1,
-0.9361728, 0.06906839, 0.6492798, 1, 1, 1, 1, 1,
-0.9360325, -0.0953893, -0.934521, 1, 1, 1, 1, 1,
-0.9359633, 1.37043, 0.3769117, 1, 1, 1, 1, 1,
-0.9307194, 0.3328127, -2.131391, 1, 1, 1, 1, 1,
-0.9238009, -0.4547856, -0.9435645, 1, 1, 1, 1, 1,
-0.9213162, -2.991929, -2.849829, 1, 1, 1, 1, 1,
-0.9200224, -1.385502, -1.151507, 1, 1, 1, 1, 1,
-0.9166543, -0.4922786, -2.074087, 1, 1, 1, 1, 1,
-0.9095827, 1.289467, -0.4409751, 1, 1, 1, 1, 1,
-0.9066109, 2.36678, 0.1216673, 1, 1, 1, 1, 1,
-0.9041739, 0.4483355, -2.8288, 1, 1, 1, 1, 1,
-0.8980813, -1.263724, -1.572303, 1, 1, 1, 1, 1,
-0.8911232, -0.9012318, -1.636038, 1, 1, 1, 1, 1,
-0.8902194, 0.5123115, -3.056505, 0, 0, 1, 1, 1,
-0.8855442, -1.360977, -3.730299, 1, 0, 0, 1, 1,
-0.8804923, -0.8212453, -1.549923, 1, 0, 0, 1, 1,
-0.8801737, 0.06614219, -0.5397085, 1, 0, 0, 1, 1,
-0.8801676, -1.507401, -3.993991, 1, 0, 0, 1, 1,
-0.8754569, -2.252023, -1.903753, 1, 0, 0, 1, 1,
-0.8662347, -0.8184401, -3.799557, 0, 0, 0, 1, 1,
-0.8565114, 1.330682, -0.6889723, 0, 0, 0, 1, 1,
-0.8562082, -0.1800535, -0.9438047, 0, 0, 0, 1, 1,
-0.8550434, 0.4602623, 0.3912402, 0, 0, 0, 1, 1,
-0.8536676, -0.737071, -0.4435644, 0, 0, 0, 1, 1,
-0.8525255, 0.1637777, -2.982951, 0, 0, 0, 1, 1,
-0.8518066, -0.001105747, 0.8829151, 0, 0, 0, 1, 1,
-0.8482673, 0.03818681, -1.352105, 1, 1, 1, 1, 1,
-0.8374705, -0.8431977, -3.105838, 1, 1, 1, 1, 1,
-0.8365932, 0.8949069, 1.205533, 1, 1, 1, 1, 1,
-0.8359128, 1.109998, -0.717269, 1, 1, 1, 1, 1,
-0.8294138, -0.003721588, 1.259927, 1, 1, 1, 1, 1,
-0.8291631, 0.5500143, -0.5307843, 1, 1, 1, 1, 1,
-0.8250911, 0.7720252, -0.4401885, 1, 1, 1, 1, 1,
-0.8227419, 0.3278911, -1.16199, 1, 1, 1, 1, 1,
-0.8224396, -1.127363, -2.189679, 1, 1, 1, 1, 1,
-0.8174018, 0.1342951, -0.4644887, 1, 1, 1, 1, 1,
-0.8125967, -0.7109634, -1.505301, 1, 1, 1, 1, 1,
-0.8088304, 1.197736, -1.766074, 1, 1, 1, 1, 1,
-0.8035778, -0.3251615, -4.079451, 1, 1, 1, 1, 1,
-0.8034521, -0.2212352, -1.070603, 1, 1, 1, 1, 1,
-0.7956697, -2.292552, -3.222667, 1, 1, 1, 1, 1,
-0.7922917, 0.4141677, -1.173551, 0, 0, 1, 1, 1,
-0.7896164, -0.3583709, -1.161111, 1, 0, 0, 1, 1,
-0.7887319, 0.1476313, 0.4546084, 1, 0, 0, 1, 1,
-0.7860936, 0.113399, -0.9398949, 1, 0, 0, 1, 1,
-0.7805319, 1.843665, -0.1956779, 1, 0, 0, 1, 1,
-0.7714781, 0.1245424, -0.3019314, 1, 0, 0, 1, 1,
-0.7698728, -0.4162656, -2.393662, 0, 0, 0, 1, 1,
-0.7690398, 0.7694603, -0.9405143, 0, 0, 0, 1, 1,
-0.7654544, 0.6824616, -0.4218192, 0, 0, 0, 1, 1,
-0.7630812, -1.104587, -2.72262, 0, 0, 0, 1, 1,
-0.76144, -0.442714, -1.997949, 0, 0, 0, 1, 1,
-0.7576035, 2.745259, 0.5063094, 0, 0, 0, 1, 1,
-0.7570025, -0.9962224, -3.054496, 0, 0, 0, 1, 1,
-0.7483999, -0.6809605, -2.052381, 1, 1, 1, 1, 1,
-0.7477145, -0.863197, -3.247706, 1, 1, 1, 1, 1,
-0.7436787, -0.1092978, -2.117744, 1, 1, 1, 1, 1,
-0.7326476, 0.2510663, -0.2744714, 1, 1, 1, 1, 1,
-0.7283618, -0.05264292, -2.590966, 1, 1, 1, 1, 1,
-0.7241911, 0.06446111, -1.873583, 1, 1, 1, 1, 1,
-0.7218691, 0.9628581, -1.117609, 1, 1, 1, 1, 1,
-0.7163478, 1.010564, -1.784735, 1, 1, 1, 1, 1,
-0.7096902, -1.014077, -3.423799, 1, 1, 1, 1, 1,
-0.7081204, -1.570715, -1.78351, 1, 1, 1, 1, 1,
-0.7065489, 1.632674, 0.1783966, 1, 1, 1, 1, 1,
-0.7031015, 0.393282, -3.166885, 1, 1, 1, 1, 1,
-0.6958077, -2.865979, -2.446151, 1, 1, 1, 1, 1,
-0.6953688, -2.789911, -5.494696, 1, 1, 1, 1, 1,
-0.6943962, 1.337593, -2.41697, 1, 1, 1, 1, 1,
-0.6935951, -0.6375387, -1.551657, 0, 0, 1, 1, 1,
-0.6871883, -0.1610687, -1.31469, 1, 0, 0, 1, 1,
-0.6847578, 0.8601853, 0.8447773, 1, 0, 0, 1, 1,
-0.6824326, -0.06951567, -1.137047, 1, 0, 0, 1, 1,
-0.6810521, -0.8556516, -2.846525, 1, 0, 0, 1, 1,
-0.6728414, 0.344355, -1.262441, 1, 0, 0, 1, 1,
-0.670745, 0.4572781, -0.9968234, 0, 0, 0, 1, 1,
-0.65773, 2.147765, 1.809985, 0, 0, 0, 1, 1,
-0.6550786, -0.4574029, -4.335908, 0, 0, 0, 1, 1,
-0.6527193, -1.377146, -2.135388, 0, 0, 0, 1, 1,
-0.6519749, 0.189511, -1.119821, 0, 0, 0, 1, 1,
-0.6464176, 0.473409, -0.8648548, 0, 0, 0, 1, 1,
-0.6432974, 0.190025, -2.051248, 0, 0, 0, 1, 1,
-0.6414223, 1.518225, 0.9039785, 1, 1, 1, 1, 1,
-0.6407347, -1.619711, -0.8632826, 1, 1, 1, 1, 1,
-0.6369847, -0.3211973, -2.051075, 1, 1, 1, 1, 1,
-0.6369662, 1.859042, 0.04156881, 1, 1, 1, 1, 1,
-0.6368092, -0.1845623, -0.4809181, 1, 1, 1, 1, 1,
-0.6353312, -0.9111514, -3.000221, 1, 1, 1, 1, 1,
-0.633575, -0.3835977, -2.981293, 1, 1, 1, 1, 1,
-0.6329613, 0.3119111, -0.8954093, 1, 1, 1, 1, 1,
-0.6324316, 0.485584, -0.2630078, 1, 1, 1, 1, 1,
-0.6307263, -0.2582073, -1.729043, 1, 1, 1, 1, 1,
-0.6301827, -0.2669604, -1.16389, 1, 1, 1, 1, 1,
-0.6253718, -1.013817, -2.046623, 1, 1, 1, 1, 1,
-0.6174318, -0.3203033, -2.119412, 1, 1, 1, 1, 1,
-0.6164384, -1.866084, -2.303357, 1, 1, 1, 1, 1,
-0.6154621, 0.07887902, -2.132924, 1, 1, 1, 1, 1,
-0.6112527, -1.704579, -2.644412, 0, 0, 1, 1, 1,
-0.6108892, 0.262729, -1.25911, 1, 0, 0, 1, 1,
-0.6087638, -0.65995, -1.994087, 1, 0, 0, 1, 1,
-0.606661, -1.104438, -2.071658, 1, 0, 0, 1, 1,
-0.6058498, -1.254062, -3.454872, 1, 0, 0, 1, 1,
-0.6043644, 0.4401502, 0.6845598, 1, 0, 0, 1, 1,
-0.6017892, 0.5146186, -0.6544805, 0, 0, 0, 1, 1,
-0.5978568, 0.4017211, -0.1208336, 0, 0, 0, 1, 1,
-0.5969355, -1.335941, -2.678432, 0, 0, 0, 1, 1,
-0.5869401, 1.03432, -1.719097, 0, 0, 0, 1, 1,
-0.5866811, 0.2776511, 0.08690703, 0, 0, 0, 1, 1,
-0.5806302, -1.059346, -1.317242, 0, 0, 0, 1, 1,
-0.5804241, 0.4571338, -0.8231016, 0, 0, 0, 1, 1,
-0.5739712, 0.5142319, -1.22559, 1, 1, 1, 1, 1,
-0.5738899, 0.6472432, -1.53059, 1, 1, 1, 1, 1,
-0.571284, 2.598022, -1.038171, 1, 1, 1, 1, 1,
-0.5703325, 0.05180422, -0.894797, 1, 1, 1, 1, 1,
-0.5603963, 1.831788, 0.7179924, 1, 1, 1, 1, 1,
-0.5556774, -2.400449, -3.996288, 1, 1, 1, 1, 1,
-0.5556078, 1.258328, -1.045366, 1, 1, 1, 1, 1,
-0.5505908, 0.009757889, -2.871967, 1, 1, 1, 1, 1,
-0.5501916, -0.5929792, -3.788286, 1, 1, 1, 1, 1,
-0.5495806, 0.353306, -1.71275, 1, 1, 1, 1, 1,
-0.542943, -0.6987967, -2.232826, 1, 1, 1, 1, 1,
-0.5415995, -0.3894778, -2.456887, 1, 1, 1, 1, 1,
-0.5387107, -0.6741176, -3.236845, 1, 1, 1, 1, 1,
-0.5343934, -0.01025884, -1.115526, 1, 1, 1, 1, 1,
-0.5190021, -0.5361355, -4.012142, 1, 1, 1, 1, 1,
-0.5187119, -1.686742, -3.304124, 0, 0, 1, 1, 1,
-0.5123911, 0.6050111, -0.1341664, 1, 0, 0, 1, 1,
-0.510755, -0.08641067, -2.85566, 1, 0, 0, 1, 1,
-0.5089897, -0.8206726, -3.961589, 1, 0, 0, 1, 1,
-0.5075018, -0.8607388, -3.252575, 1, 0, 0, 1, 1,
-0.5071583, -0.9106167, -1.351527, 1, 0, 0, 1, 1,
-0.5059505, -0.3795916, -1.121878, 0, 0, 0, 1, 1,
-0.4914649, 0.2343488, -1.734448, 0, 0, 0, 1, 1,
-0.4912884, 0.5424462, -1.252712, 0, 0, 0, 1, 1,
-0.4882312, 0.9825194, -3.129554, 0, 0, 0, 1, 1,
-0.4831135, 0.6091964, -1.614178, 0, 0, 0, 1, 1,
-0.481998, 0.8175775, -0.2069044, 0, 0, 0, 1, 1,
-0.479442, 1.792941, -1.919431, 0, 0, 0, 1, 1,
-0.4774096, 2.986846, 0.4444658, 1, 1, 1, 1, 1,
-0.4751239, -2.583563, -2.53046, 1, 1, 1, 1, 1,
-0.4734583, 0.1303407, -0.8668659, 1, 1, 1, 1, 1,
-0.4733988, 0.9573739, -0.1177231, 1, 1, 1, 1, 1,
-0.4654335, 0.4150681, -2.080438, 1, 1, 1, 1, 1,
-0.464119, -0.6164839, -3.289809, 1, 1, 1, 1, 1,
-0.4613588, 0.9349919, -0.01357594, 1, 1, 1, 1, 1,
-0.4596144, -1.120974, -0.2575817, 1, 1, 1, 1, 1,
-0.4594702, -0.9016778, -1.955535, 1, 1, 1, 1, 1,
-0.4573398, -0.2803755, -2.879186, 1, 1, 1, 1, 1,
-0.4564103, -0.3215081, -1.510752, 1, 1, 1, 1, 1,
-0.4548584, -1.597939, -3.783643, 1, 1, 1, 1, 1,
-0.4505118, -0.5525084, -2.053988, 1, 1, 1, 1, 1,
-0.4489244, -0.7216063, -2.09854, 1, 1, 1, 1, 1,
-0.4446917, 0.9143322, 0.499817, 1, 1, 1, 1, 1,
-0.4440157, -0.4247038, -2.491178, 0, 0, 1, 1, 1,
-0.4437696, 0.7927722, 0.3870295, 1, 0, 0, 1, 1,
-0.4405652, -1.464765, -1.74979, 1, 0, 0, 1, 1,
-0.4377649, -0.8313646, -3.248004, 1, 0, 0, 1, 1,
-0.4360932, 0.3175886, 0.04297914, 1, 0, 0, 1, 1,
-0.4240487, 1.885792, -0.2998434, 1, 0, 0, 1, 1,
-0.4194783, 1.504268, -0.6579421, 0, 0, 0, 1, 1,
-0.4130894, 0.6119367, -1.609332, 0, 0, 0, 1, 1,
-0.4072115, -0.3917951, -0.6618741, 0, 0, 0, 1, 1,
-0.4045374, -0.1327986, -0.4237488, 0, 0, 0, 1, 1,
-0.4027867, 0.6822784, -1.822294, 0, 0, 0, 1, 1,
-0.3981418, -1.779218, -2.276066, 0, 0, 0, 1, 1,
-0.3977746, -1.519151, -1.767382, 0, 0, 0, 1, 1,
-0.3962319, 1.841554, 0.6871811, 1, 1, 1, 1, 1,
-0.3960901, -0.3122399, -1.162538, 1, 1, 1, 1, 1,
-0.3957633, -0.2203793, -1.975017, 1, 1, 1, 1, 1,
-0.3885311, -1.362455, -2.324852, 1, 1, 1, 1, 1,
-0.3884927, -1.35419, -3.868863, 1, 1, 1, 1, 1,
-0.3872188, -0.7713639, -2.023673, 1, 1, 1, 1, 1,
-0.386287, -0.556034, -2.736972, 1, 1, 1, 1, 1,
-0.3844837, -0.8393375, -3.143896, 1, 1, 1, 1, 1,
-0.3795498, -0.8551685, -1.799934, 1, 1, 1, 1, 1,
-0.3774784, 0.2670095, -1.083006, 1, 1, 1, 1, 1,
-0.3726341, -1.214527, -2.783298, 1, 1, 1, 1, 1,
-0.3689107, 0.9661735, -0.9272909, 1, 1, 1, 1, 1,
-0.3604751, -0.04651064, -2.452651, 1, 1, 1, 1, 1,
-0.3572763, -0.9744438, -2.538832, 1, 1, 1, 1, 1,
-0.3566483, -0.7902264, -2.80591, 1, 1, 1, 1, 1,
-0.3558251, 0.1981416, -1.073963, 0, 0, 1, 1, 1,
-0.3522985, -1.53168, -1.957245, 1, 0, 0, 1, 1,
-0.3521419, -1.007892, -3.781401, 1, 0, 0, 1, 1,
-0.3519107, -0.1367935, -1.111876, 1, 0, 0, 1, 1,
-0.3474213, -0.9270422, -2.193469, 1, 0, 0, 1, 1,
-0.3471714, -0.2368682, -1.061732, 1, 0, 0, 1, 1,
-0.3470617, 0.6390975, -1.858495, 0, 0, 0, 1, 1,
-0.3385492, 1.633673, 1.270364, 0, 0, 0, 1, 1,
-0.3339194, -0.3199071, -2.667139, 0, 0, 0, 1, 1,
-0.3320044, 0.3352372, -0.9090037, 0, 0, 0, 1, 1,
-0.3319931, -1.770062, -5.381865, 0, 0, 0, 1, 1,
-0.3240996, -1.07614, -2.843969, 0, 0, 0, 1, 1,
-0.3198627, -0.45191, -1.124588, 0, 0, 0, 1, 1,
-0.3148138, -0.8771356, -4.225519, 1, 1, 1, 1, 1,
-0.3095988, -1.2421, -3.739862, 1, 1, 1, 1, 1,
-0.307765, 0.6116226, -0.9172637, 1, 1, 1, 1, 1,
-0.3071437, 1.359542, 0.3775731, 1, 1, 1, 1, 1,
-0.3062769, -1.118361, -3.833422, 1, 1, 1, 1, 1,
-0.3046212, 1.092245, 0.1824094, 1, 1, 1, 1, 1,
-0.302599, 0.3775591, -0.3928278, 1, 1, 1, 1, 1,
-0.3024856, -0.7196096, -3.727705, 1, 1, 1, 1, 1,
-0.3019353, -0.1671393, -1.611443, 1, 1, 1, 1, 1,
-0.3017857, -0.6129637, -2.896479, 1, 1, 1, 1, 1,
-0.3005741, 2.947365, -0.1049584, 1, 1, 1, 1, 1,
-0.2996794, 0.394673, -0.4931429, 1, 1, 1, 1, 1,
-0.2932979, 0.6135612, -0.04995957, 1, 1, 1, 1, 1,
-0.2918358, 0.1413558, 0.109384, 1, 1, 1, 1, 1,
-0.288851, -0.9474753, -3.961534, 1, 1, 1, 1, 1,
-0.2829075, 0.2250434, -1.941967, 0, 0, 1, 1, 1,
-0.2816962, 0.7527607, -1.814852, 1, 0, 0, 1, 1,
-0.2811123, -1.087872, -0.9611547, 1, 0, 0, 1, 1,
-0.2800295, -1.580002, -2.093199, 1, 0, 0, 1, 1,
-0.279612, 0.9287226, 0.8286494, 1, 0, 0, 1, 1,
-0.2780723, -0.722765, -1.626103, 1, 0, 0, 1, 1,
-0.27468, 0.5284129, -0.6931529, 0, 0, 0, 1, 1,
-0.2728367, 0.9351101, -1.051993, 0, 0, 0, 1, 1,
-0.2672573, -0.725153, -3.617128, 0, 0, 0, 1, 1,
-0.259692, -0.1418341, -2.212513, 0, 0, 0, 1, 1,
-0.2589481, -0.6489826, -2.109126, 0, 0, 0, 1, 1,
-0.2587801, -0.1738169, -3.13905, 0, 0, 0, 1, 1,
-0.2555082, 0.3686964, 0.05117577, 0, 0, 0, 1, 1,
-0.2550486, -0.0586624, -1.789151, 1, 1, 1, 1, 1,
-0.2535201, 0.4725802, -0.9317193, 1, 1, 1, 1, 1,
-0.2528551, -0.4933654, -2.836313, 1, 1, 1, 1, 1,
-0.2491113, 0.4763097, 0.4296994, 1, 1, 1, 1, 1,
-0.2485473, 0.5660184, 0.2781658, 1, 1, 1, 1, 1,
-0.2439995, 0.3866583, -0.2031371, 1, 1, 1, 1, 1,
-0.2433648, -0.9096496, -4.342772, 1, 1, 1, 1, 1,
-0.2422728, 0.7418265, 1.314472, 1, 1, 1, 1, 1,
-0.2403537, 1.134174, 1.275744, 1, 1, 1, 1, 1,
-0.2356658, -0.1484026, -2.417527, 1, 1, 1, 1, 1,
-0.2336627, -2.172573, -4.417384, 1, 1, 1, 1, 1,
-0.2304615, -1.836117, -3.454727, 1, 1, 1, 1, 1,
-0.2219638, -0.872742, -4.768365, 1, 1, 1, 1, 1,
-0.2179683, -1.181063, -4.655256, 1, 1, 1, 1, 1,
-0.2177852, 1.068157, -0.3623627, 1, 1, 1, 1, 1,
-0.215932, 0.6015946, -2.575478, 0, 0, 1, 1, 1,
-0.214138, 0.5443413, 0.1579218, 1, 0, 0, 1, 1,
-0.2140072, 0.7055236, -2.640558, 1, 0, 0, 1, 1,
-0.1981992, -0.782676, -1.48439, 1, 0, 0, 1, 1,
-0.1937477, -0.901454, -5.141828, 1, 0, 0, 1, 1,
-0.1922627, -0.6389936, -4.218059, 1, 0, 0, 1, 1,
-0.1907316, 0.3608795, -2.432122, 0, 0, 0, 1, 1,
-0.1890877, 1.751691, -1.028661, 0, 0, 0, 1, 1,
-0.188441, -0.4658738, -1.744533, 0, 0, 0, 1, 1,
-0.1870415, 0.4199007, -1.750186, 0, 0, 0, 1, 1,
-0.185293, 0.5938612, 1.573998, 0, 0, 0, 1, 1,
-0.1851343, -0.5947375, -3.123105, 0, 0, 0, 1, 1,
-0.1834442, -2.159926, -2.496159, 0, 0, 0, 1, 1,
-0.1800546, 0.6994957, 0.208209, 1, 1, 1, 1, 1,
-0.1781371, -1.005225, -2.822446, 1, 1, 1, 1, 1,
-0.1758979, 1.17374, -1.249075, 1, 1, 1, 1, 1,
-0.1727836, 0.6271911, -0.6082126, 1, 1, 1, 1, 1,
-0.1724997, -0.8152113, -5.295945, 1, 1, 1, 1, 1,
-0.1719874, -0.7927108, -2.589316, 1, 1, 1, 1, 1,
-0.1710226, 0.7709761, -0.963959, 1, 1, 1, 1, 1,
-0.1710044, -1.792228, -4.407443, 1, 1, 1, 1, 1,
-0.1689238, -1.463099, -4.093574, 1, 1, 1, 1, 1,
-0.1642836, 0.1303229, -1.073281, 1, 1, 1, 1, 1,
-0.1539111, -0.8006999, -2.486471, 1, 1, 1, 1, 1,
-0.1527012, -0.05493835, -1.697417, 1, 1, 1, 1, 1,
-0.1500914, -1.106336, -2.237255, 1, 1, 1, 1, 1,
-0.1479402, -0.6119781, -2.861361, 1, 1, 1, 1, 1,
-0.1434292, -1.477807, -4.374414, 1, 1, 1, 1, 1,
-0.140499, 0.08357082, -1.004062, 0, 0, 1, 1, 1,
-0.1382927, -0.7714956, -2.107409, 1, 0, 0, 1, 1,
-0.1360913, -0.4988277, -5.164908, 1, 0, 0, 1, 1,
-0.1328851, -2.901697, -3.053371, 1, 0, 0, 1, 1,
-0.1263923, 0.1805992, -0.7065501, 1, 0, 0, 1, 1,
-0.1222346, 1.383219, 0.7739489, 1, 0, 0, 1, 1,
-0.1172007, 0.6313518, 0.1167958, 0, 0, 0, 1, 1,
-0.1160871, 0.9053158, 0.3063686, 0, 0, 0, 1, 1,
-0.1151771, 0.5258436, 0.08002271, 0, 0, 0, 1, 1,
-0.114199, 0.5783093, -1.235923, 0, 0, 0, 1, 1,
-0.1141662, -0.193695, -3.946737, 0, 0, 0, 1, 1,
-0.1116831, -2.064462, -4.112143, 0, 0, 0, 1, 1,
-0.1015339, -1.074882, -3.4279, 0, 0, 0, 1, 1,
-0.1015254, -0.2535232, -4.973816, 1, 1, 1, 1, 1,
-0.09773446, 1.293297, -0.3266253, 1, 1, 1, 1, 1,
-0.09771984, 0.4440896, 0.3483247, 1, 1, 1, 1, 1,
-0.09537571, -0.2293024, -3.223029, 1, 1, 1, 1, 1,
-0.08741032, 1.746441, 0.7164912, 1, 1, 1, 1, 1,
-0.08363427, 1.310686, 0.03548682, 1, 1, 1, 1, 1,
-0.08178838, -0.9945838, -2.720586, 1, 1, 1, 1, 1,
-0.07812818, -1.621506, -3.155843, 1, 1, 1, 1, 1,
-0.07731061, 1.349977, -0.6550943, 1, 1, 1, 1, 1,
-0.0761311, 1.409765, 0.4378828, 1, 1, 1, 1, 1,
-0.07403, -0.2551678, 0.2275597, 1, 1, 1, 1, 1,
-0.06800248, -0.8106809, -2.769001, 1, 1, 1, 1, 1,
-0.06764336, -1.83585, -4.447772, 1, 1, 1, 1, 1,
-0.06560793, -0.1396649, -3.683934, 1, 1, 1, 1, 1,
-0.06112211, 0.05689151, 0.4019124, 1, 1, 1, 1, 1,
-0.05775878, -1.031292, -4.845675, 0, 0, 1, 1, 1,
-0.05763248, -0.1432102, -4.016471, 1, 0, 0, 1, 1,
-0.052306, 0.04017471, -1.35616, 1, 0, 0, 1, 1,
-0.05209814, -1.567048, -3.252877, 1, 0, 0, 1, 1,
-0.05208038, 0.6262181, -1.061825, 1, 0, 0, 1, 1,
-0.04963865, 0.9727859, 1.239152, 1, 0, 0, 1, 1,
-0.04585537, -0.5376841, -2.509502, 0, 0, 0, 1, 1,
-0.04411148, -0.324898, -3.369781, 0, 0, 0, 1, 1,
-0.03873836, 0.9568205, 0.1604954, 0, 0, 0, 1, 1,
-0.03705399, 0.3905098, 0.465266, 0, 0, 0, 1, 1,
-0.03283312, -1.597559, -2.859111, 0, 0, 0, 1, 1,
-0.03254116, 0.4628759, -0.04907792, 0, 0, 0, 1, 1,
-0.03234305, 1.34278, -0.5917741, 0, 0, 0, 1, 1,
-0.02641508, 0.4381857, -1.498588, 1, 1, 1, 1, 1,
-0.02474323, -2.087104, -4.148423, 1, 1, 1, 1, 1,
-0.02396686, 0.3170814, -0.8486454, 1, 1, 1, 1, 1,
-0.01930661, 0.5418582, 0.8199412, 1, 1, 1, 1, 1,
-0.01828447, -0.7447495, -3.840542, 1, 1, 1, 1, 1,
-0.0168785, 2.455549, -0.4168948, 1, 1, 1, 1, 1,
-0.01576292, 0.5445347, 0.1658627, 1, 1, 1, 1, 1,
-0.01287953, -1.019136, -2.650889, 1, 1, 1, 1, 1,
-0.01286926, 1.703948, 1.284005, 1, 1, 1, 1, 1,
-0.01024847, -2.140647, -2.736242, 1, 1, 1, 1, 1,
-0.008745654, -1.267793, -1.604757, 1, 1, 1, 1, 1,
-0.006145529, -0.1830981, -3.087285, 1, 1, 1, 1, 1,
-0.003787993, 0.8648931, 0.5221834, 1, 1, 1, 1, 1,
-0.003730811, 0.1719862, 0.2685997, 1, 1, 1, 1, 1,
-0.0002438821, 0.5434994, 0.4931944, 1, 1, 1, 1, 1,
0.0003780542, -0.8007679, 4.483048, 0, 0, 1, 1, 1,
0.002242769, 1.473997, -0.5503603, 1, 0, 0, 1, 1,
0.004838356, 0.2055551, -0.03757393, 1, 0, 0, 1, 1,
0.005671876, 0.5437203, 0.04287382, 1, 0, 0, 1, 1,
0.005698632, -2.680497, 4.058961, 1, 0, 0, 1, 1,
0.008138114, -1.251453, 4.100477, 1, 0, 0, 1, 1,
0.008833852, -1.292047, 2.166828, 0, 0, 0, 1, 1,
0.01070702, 0.06672438, 0.02960859, 0, 0, 0, 1, 1,
0.01158401, 0.2875414, -1.412968, 0, 0, 0, 1, 1,
0.01291948, -0.3472822, 2.829225, 0, 0, 0, 1, 1,
0.01370954, -0.8186358, 1.112902, 0, 0, 0, 1, 1,
0.01401329, 0.1068185, -1.689774, 0, 0, 0, 1, 1,
0.01812145, 1.271076, -0.2278285, 0, 0, 0, 1, 1,
0.0184025, 1.361457, 0.5327298, 1, 1, 1, 1, 1,
0.02169866, 1.068453, 0.3048649, 1, 1, 1, 1, 1,
0.02583266, 1.038017, -0.8335029, 1, 1, 1, 1, 1,
0.02759987, -0.2491236, 4.167264, 1, 1, 1, 1, 1,
0.0287162, -0.297565, 2.875354, 1, 1, 1, 1, 1,
0.02879132, 0.2874764, 1.641863, 1, 1, 1, 1, 1,
0.02902181, 0.2855599, -0.4044742, 1, 1, 1, 1, 1,
0.02964673, -0.7429562, 1.670902, 1, 1, 1, 1, 1,
0.03328029, 0.5066605, 1.299184, 1, 1, 1, 1, 1,
0.03563053, -0.4698801, 4.057344, 1, 1, 1, 1, 1,
0.03647977, 0.6530761, 0.2048669, 1, 1, 1, 1, 1,
0.03924445, -0.4255929, 2.098795, 1, 1, 1, 1, 1,
0.03960435, 0.5770572, 1.278257, 1, 1, 1, 1, 1,
0.04027442, -0.1589861, 2.718988, 1, 1, 1, 1, 1,
0.04279077, -0.3333918, 2.410903, 1, 1, 1, 1, 1,
0.04874143, 0.1472006, -0.1311198, 0, 0, 1, 1, 1,
0.05001315, -1.928724, 2.888, 1, 0, 0, 1, 1,
0.05758412, 0.7364868, -0.06976886, 1, 0, 0, 1, 1,
0.05850706, -0.2341529, 2.629022, 1, 0, 0, 1, 1,
0.06222482, -0.521969, 4.021455, 1, 0, 0, 1, 1,
0.06305908, -0.3624414, 3.694837, 1, 0, 0, 1, 1,
0.06371874, 1.006195, 0.5747344, 0, 0, 0, 1, 1,
0.06465308, -1.640038, 4.155043, 0, 0, 0, 1, 1,
0.065175, -1.921288, 1.520664, 0, 0, 0, 1, 1,
0.07123903, -0.1274525, 3.95772, 0, 0, 0, 1, 1,
0.07153026, 0.4847805, -0.42284, 0, 0, 0, 1, 1,
0.07253119, -0.3596945, 1.982313, 0, 0, 0, 1, 1,
0.08141891, 1.957134, -0.9698651, 0, 0, 0, 1, 1,
0.08522262, -0.243517, 3.080138, 1, 1, 1, 1, 1,
0.08886096, -0.05302696, 2.034804, 1, 1, 1, 1, 1,
0.09233185, -0.9540322, 3.623043, 1, 1, 1, 1, 1,
0.09819908, 0.2089068, -0.4519607, 1, 1, 1, 1, 1,
0.09873892, 0.1680456, 0.9472406, 1, 1, 1, 1, 1,
0.09911212, -1.154189, 4.931852, 1, 1, 1, 1, 1,
0.09980383, -1.340281, 3.411839, 1, 1, 1, 1, 1,
0.09999806, -0.4788307, 3.159439, 1, 1, 1, 1, 1,
0.1024415, 0.9320492, -0.7444572, 1, 1, 1, 1, 1,
0.10579, -0.3853332, 3.323289, 1, 1, 1, 1, 1,
0.1059668, 0.1479444, 1.040539, 1, 1, 1, 1, 1,
0.1062506, -0.007585596, 1.973574, 1, 1, 1, 1, 1,
0.1069678, 2.307935, -0.2981692, 1, 1, 1, 1, 1,
0.1111898, 0.02273951, 0.8346359, 1, 1, 1, 1, 1,
0.1141501, -0.6513202, 2.124568, 1, 1, 1, 1, 1,
0.1158512, 1.554866, 1.850598, 0, 0, 1, 1, 1,
0.1169902, -0.9775073, 1.547662, 1, 0, 0, 1, 1,
0.1174304, -1.000703, 3.977973, 1, 0, 0, 1, 1,
0.1188387, -0.4764494, 1.983013, 1, 0, 0, 1, 1,
0.1213853, 0.7293221, -0.5983545, 1, 0, 0, 1, 1,
0.1230445, 2.453337, -0.7002257, 1, 0, 0, 1, 1,
0.1236904, 1.936729, 1.161273, 0, 0, 0, 1, 1,
0.1245532, -0.4060739, 3.07463, 0, 0, 0, 1, 1,
0.1245561, -0.9955688, 0.4385524, 0, 0, 0, 1, 1,
0.1289077, -1.050397, 3.804173, 0, 0, 0, 1, 1,
0.1357521, 0.3282253, 1.512158, 0, 0, 0, 1, 1,
0.1400019, 1.31383, -0.5918272, 0, 0, 0, 1, 1,
0.1407667, -0.02542922, 2.011178, 0, 0, 0, 1, 1,
0.1417225, -0.7256185, 3.069337, 1, 1, 1, 1, 1,
0.1433547, 0.5881518, 0.450681, 1, 1, 1, 1, 1,
0.1449931, -1.630356, 3.594014, 1, 1, 1, 1, 1,
0.1480327, 0.5878434, -1.067304, 1, 1, 1, 1, 1,
0.1523977, -0.5739763, 4.092169, 1, 1, 1, 1, 1,
0.1536312, 0.2801008, 1.025706, 1, 1, 1, 1, 1,
0.1541061, -0.2785321, 2.030688, 1, 1, 1, 1, 1,
0.1583297, -0.3726072, 4.859312, 1, 1, 1, 1, 1,
0.1625393, 0.5668967, 0.7285864, 1, 1, 1, 1, 1,
0.1630533, 2.203513, 1.576848, 1, 1, 1, 1, 1,
0.1660467, 0.4639224, 1.085555, 1, 1, 1, 1, 1,
0.1668406, -0.6933652, 4.071424, 1, 1, 1, 1, 1,
0.1678791, 0.3766218, 0.5391629, 1, 1, 1, 1, 1,
0.1720405, 1.804357, 0.625591, 1, 1, 1, 1, 1,
0.1727269, 2.213349, 1.148702, 1, 1, 1, 1, 1,
0.1729873, -0.8081605, 1.274136, 0, 0, 1, 1, 1,
0.1794404, 0.4829664, 0.6619225, 1, 0, 0, 1, 1,
0.1855453, 1.390013, 0.6448687, 1, 0, 0, 1, 1,
0.1878028, 0.738243, -2.359833, 1, 0, 0, 1, 1,
0.193427, -0.8192771, 3.179212, 1, 0, 0, 1, 1,
0.1949126, 0.07936616, 2.405886, 1, 0, 0, 1, 1,
0.1953555, 0.1486745, -1.088737, 0, 0, 0, 1, 1,
0.1963206, 1.05676, 1.295769, 0, 0, 0, 1, 1,
0.1979665, 0.3561246, -0.2667463, 0, 0, 0, 1, 1,
0.1990918, -1.287819, 3.993256, 0, 0, 0, 1, 1,
0.2025294, -1.053582, 1.963816, 0, 0, 0, 1, 1,
0.2130809, -0.4798571, 3.024753, 0, 0, 0, 1, 1,
0.2132923, 0.3211046, 0.05716611, 0, 0, 0, 1, 1,
0.2138108, 0.4351713, -0.1068696, 1, 1, 1, 1, 1,
0.2143776, 0.1552483, 1.201564, 1, 1, 1, 1, 1,
0.2145092, 0.09526069, 1.943479, 1, 1, 1, 1, 1,
0.2194692, -1.925934, 3.236254, 1, 1, 1, 1, 1,
0.2197461, 0.7141175, -1.120862, 1, 1, 1, 1, 1,
0.2221262, -0.1909641, -0.1772966, 1, 1, 1, 1, 1,
0.2252283, 0.497778, 1.444854, 1, 1, 1, 1, 1,
0.2266961, 0.9187835, 0.6339356, 1, 1, 1, 1, 1,
0.227222, 0.2636203, -0.3257461, 1, 1, 1, 1, 1,
0.2272911, 0.3693682, 2.546458, 1, 1, 1, 1, 1,
0.2274128, 1.59796, 2.290416, 1, 1, 1, 1, 1,
0.2347926, -1.068973, 2.864224, 1, 1, 1, 1, 1,
0.2352065, -1.267159, 2.47998, 1, 1, 1, 1, 1,
0.2381516, 0.165046, 1.734422, 1, 1, 1, 1, 1,
0.2389477, 1.51069, 0.5751398, 1, 1, 1, 1, 1,
0.2426532, -0.5487813, 3.642278, 0, 0, 1, 1, 1,
0.2427392, 0.1703211, -0.03455723, 1, 0, 0, 1, 1,
0.2428094, -0.4171552, 3.387105, 1, 0, 0, 1, 1,
0.2436075, -0.09302795, 2.599724, 1, 0, 0, 1, 1,
0.2500026, -0.5983766, 2.865565, 1, 0, 0, 1, 1,
0.2547958, -0.08332483, 2.061096, 1, 0, 0, 1, 1,
0.266036, -1.255228, 1.128669, 0, 0, 0, 1, 1,
0.2669184, -0.5060058, 3.488165, 0, 0, 0, 1, 1,
0.2695385, -0.6356833, 1.227795, 0, 0, 0, 1, 1,
0.2696115, -2.837513, 2.255476, 0, 0, 0, 1, 1,
0.2697148, -1.654429, 4.291021, 0, 0, 0, 1, 1,
0.270654, -1.464823, 1.486368, 0, 0, 0, 1, 1,
0.2722969, 0.0259656, 0.08954247, 0, 0, 0, 1, 1,
0.2789408, 0.4076231, 0.9229203, 1, 1, 1, 1, 1,
0.2841392, -0.0816559, 0.6172779, 1, 1, 1, 1, 1,
0.2859246, -1.65873, 2.368641, 1, 1, 1, 1, 1,
0.2878237, 0.2356682, 0.3944745, 1, 1, 1, 1, 1,
0.2900482, -1.829572, 1.368557, 1, 1, 1, 1, 1,
0.2915277, 0.9275258, 0.302199, 1, 1, 1, 1, 1,
0.2939646, 1.557018, -0.4580427, 1, 1, 1, 1, 1,
0.2970497, -0.6058983, 2.67226, 1, 1, 1, 1, 1,
0.2970882, 0.7425982, 0.993396, 1, 1, 1, 1, 1,
0.2975679, 0.5651908, -0.3056474, 1, 1, 1, 1, 1,
0.2996951, 1.855347, 1.124418, 1, 1, 1, 1, 1,
0.3002033, -1.146607, 0.3042561, 1, 1, 1, 1, 1,
0.3015544, -1.262059, 3.165384, 1, 1, 1, 1, 1,
0.3017504, -0.4241761, 2.860422, 1, 1, 1, 1, 1,
0.3023064, 0.3065079, 0.01101395, 1, 1, 1, 1, 1,
0.3045282, -0.516109, 2.363272, 0, 0, 1, 1, 1,
0.306793, -1.122015, 3.531087, 1, 0, 0, 1, 1,
0.3103371, 1.450114, 0.4782927, 1, 0, 0, 1, 1,
0.3119102, 1.016396, -0.1650673, 1, 0, 0, 1, 1,
0.3144615, 0.1325847, 2.237114, 1, 0, 0, 1, 1,
0.318119, -0.4321894, 4.44991, 1, 0, 0, 1, 1,
0.3277927, 1.531414, 0.6482178, 0, 0, 0, 1, 1,
0.3299744, -1.188432, 3.14169, 0, 0, 0, 1, 1,
0.3310475, 0.7591732, 1.833861, 0, 0, 0, 1, 1,
0.3356095, -0.5632946, 1.466699, 0, 0, 0, 1, 1,
0.3396406, -1.701351, 3.660685, 0, 0, 0, 1, 1,
0.3418107, 0.6328379, 0.666491, 0, 0, 0, 1, 1,
0.3419098, 0.549893, 0.477031, 0, 0, 0, 1, 1,
0.3427863, -0.1301042, 1.501159, 1, 1, 1, 1, 1,
0.3453675, 0.6235145, 1.419597, 1, 1, 1, 1, 1,
0.3461373, 0.06229772, 1.433441, 1, 1, 1, 1, 1,
0.3517624, 0.07977837, 1.986232, 1, 1, 1, 1, 1,
0.3529644, 1.912623, -0.5203394, 1, 1, 1, 1, 1,
0.3531199, 0.6451159, -0.3174253, 1, 1, 1, 1, 1,
0.3553222, 0.6466333, 0.1367619, 1, 1, 1, 1, 1,
0.3604761, 0.2229948, 1.834083, 1, 1, 1, 1, 1,
0.3607126, 0.03080638, 2.415123, 1, 1, 1, 1, 1,
0.3614143, -0.2253415, 1.786119, 1, 1, 1, 1, 1,
0.3635571, -1.317551, 5.304675, 1, 1, 1, 1, 1,
0.3653799, -0.2931138, 4.012514, 1, 1, 1, 1, 1,
0.3661432, -0.392828, 1.036335, 1, 1, 1, 1, 1,
0.3664654, -1.123647, 2.698976, 1, 1, 1, 1, 1,
0.3770113, 0.2490175, 1.520424, 1, 1, 1, 1, 1,
0.3776876, 0.5727693, -0.381899, 0, 0, 1, 1, 1,
0.3796833, -0.4665221, 2.863755, 1, 0, 0, 1, 1,
0.3834172, -0.06999048, 3.03581, 1, 0, 0, 1, 1,
0.3857703, -0.09951574, 2.893523, 1, 0, 0, 1, 1,
0.38682, -1.347853, 3.879592, 1, 0, 0, 1, 1,
0.3878424, -0.2178955, 1.329006, 1, 0, 0, 1, 1,
0.3924087, -0.4782161, 3.578321, 0, 0, 0, 1, 1,
0.3934102, 0.7017524, 0.9436948, 0, 0, 0, 1, 1,
0.3935007, -0.4725603, 3.347032, 0, 0, 0, 1, 1,
0.397195, 0.2620716, -0.1312456, 0, 0, 0, 1, 1,
0.3975253, 1.299899, 1.681907, 0, 0, 0, 1, 1,
0.397887, 0.7501608, 0.438144, 0, 0, 0, 1, 1,
0.3984162, -0.1909243, 0.7889165, 0, 0, 0, 1, 1,
0.40063, 0.3970805, 3.956056, 1, 1, 1, 1, 1,
0.4008212, -0.2623301, 0.988768, 1, 1, 1, 1, 1,
0.4031229, 1.465733, 0.5681661, 1, 1, 1, 1, 1,
0.4065381, -0.7810056, 5.176716, 1, 1, 1, 1, 1,
0.407443, 0.2137182, 0.7100377, 1, 1, 1, 1, 1,
0.4076828, 0.3621917, -0.5195373, 1, 1, 1, 1, 1,
0.4112926, 1.02272, 2.656665, 1, 1, 1, 1, 1,
0.4270358, -0.4663009, 0.5965804, 1, 1, 1, 1, 1,
0.4285024, -0.6826555, 2.357358, 1, 1, 1, 1, 1,
0.4305952, -0.7671795, 1.267676, 1, 1, 1, 1, 1,
0.4359526, 1.333607, -1.280212, 1, 1, 1, 1, 1,
0.4419619, 0.0408281, 0.6341954, 1, 1, 1, 1, 1,
0.4422559, -0.5168037, 2.088735, 1, 1, 1, 1, 1,
0.4440714, -0.9132801, 3.766803, 1, 1, 1, 1, 1,
0.4451839, -0.8278828, 0.3086836, 1, 1, 1, 1, 1,
0.4503228, 0.3217908, 0.9354222, 0, 0, 1, 1, 1,
0.4549289, -1.010997, 3.517265, 1, 0, 0, 1, 1,
0.4550341, -0.3787189, 2.052845, 1, 0, 0, 1, 1,
0.4553883, -1.248324, 3.271928, 1, 0, 0, 1, 1,
0.4571314, -0.6628945, 3.001616, 1, 0, 0, 1, 1,
0.4661967, -0.7718133, 1.037029, 1, 0, 0, 1, 1,
0.4708157, 0.02509953, 1.68092, 0, 0, 0, 1, 1,
0.4729111, 0.5342668, -0.05122988, 0, 0, 0, 1, 1,
0.4741403, -1.073158, 3.002022, 0, 0, 0, 1, 1,
0.4760353, -0.1589853, -0.5101487, 0, 0, 0, 1, 1,
0.4781311, -1.168819, 1.490825, 0, 0, 0, 1, 1,
0.4791968, 0.7144847, 3.131239, 0, 0, 0, 1, 1,
0.4854414, 0.912375, 0.7218484, 0, 0, 0, 1, 1,
0.4886999, -0.7176225, 2.637467, 1, 1, 1, 1, 1,
0.4893832, 0.6414704, 0.4296032, 1, 1, 1, 1, 1,
0.4928796, 0.9249856, 0.6894836, 1, 1, 1, 1, 1,
0.4935466, -0.7008043, 0.8025889, 1, 1, 1, 1, 1,
0.4978083, 0.1770112, 1.530119, 1, 1, 1, 1, 1,
0.5000551, 0.6939941, 0.6882943, 1, 1, 1, 1, 1,
0.5040253, -0.9704582, 3.124514, 1, 1, 1, 1, 1,
0.5055011, 1.999379, 1.131045, 1, 1, 1, 1, 1,
0.5062638, -2.466242, 2.771132, 1, 1, 1, 1, 1,
0.5064822, -0.5974241, 2.97477, 1, 1, 1, 1, 1,
0.5087593, 1.725432, 0.1619063, 1, 1, 1, 1, 1,
0.5089555, 1.491829, 0.8963954, 1, 1, 1, 1, 1,
0.5117596, 0.09319083, 2.629804, 1, 1, 1, 1, 1,
0.514804, -2.127532, 4.546984, 1, 1, 1, 1, 1,
0.5173451, 1.112921, 1.20046, 1, 1, 1, 1, 1,
0.5230384, 0.5692948, 1.487001, 0, 0, 1, 1, 1,
0.524739, -0.1661272, 2.676331, 1, 0, 0, 1, 1,
0.532439, 0.3868285, 1.830252, 1, 0, 0, 1, 1,
0.535466, -0.9770787, 3.151605, 1, 0, 0, 1, 1,
0.5438081, -0.2839352, 2.783633, 1, 0, 0, 1, 1,
0.5475422, 1.127582, -0.7879335, 1, 0, 0, 1, 1,
0.5503352, -0.9703897, 2.683988, 0, 0, 0, 1, 1,
0.5531358, 1.12463, -1.818846, 0, 0, 0, 1, 1,
0.5546733, -0.691358, 2.571928, 0, 0, 0, 1, 1,
0.5555317, 0.2917605, 1.149635, 0, 0, 0, 1, 1,
0.5590588, 0.6276801, 0.792447, 0, 0, 0, 1, 1,
0.5600821, -2.85099, 3.421176, 0, 0, 0, 1, 1,
0.560476, 0.3545052, 1.73606, 0, 0, 0, 1, 1,
0.5610048, 1.645692, 0.6234614, 1, 1, 1, 1, 1,
0.561324, -0.2277344, 0.8982425, 1, 1, 1, 1, 1,
0.5616071, 1.379572, 0.6340023, 1, 1, 1, 1, 1,
0.5681466, -1.079136, 1.690631, 1, 1, 1, 1, 1,
0.5753347, -1.328215, 3.317391, 1, 1, 1, 1, 1,
0.5755975, -0.6897185, 0.5001322, 1, 1, 1, 1, 1,
0.5829782, -0.1969695, 1.262221, 1, 1, 1, 1, 1,
0.5859242, -1.30029, 2.504053, 1, 1, 1, 1, 1,
0.5862995, 1.574986, 0.88644, 1, 1, 1, 1, 1,
0.5969103, 0.03643288, 0.6720967, 1, 1, 1, 1, 1,
0.6003101, 0.5062921, 0.3217738, 1, 1, 1, 1, 1,
0.6013418, -0.03373871, 2.013819, 1, 1, 1, 1, 1,
0.6030222, 0.7475094, 1.406809, 1, 1, 1, 1, 1,
0.6085715, 0.6975419, 1.37017, 1, 1, 1, 1, 1,
0.6139426, -0.5925403, 3.50124, 1, 1, 1, 1, 1,
0.6152954, -0.3091942, 1.932786, 0, 0, 1, 1, 1,
0.6188968, 0.01936498, 2.957478, 1, 0, 0, 1, 1,
0.6198772, -0.3635592, 3.921304, 1, 0, 0, 1, 1,
0.6204125, -0.1606521, 2.465893, 1, 0, 0, 1, 1,
0.6323789, -0.358109, -0.363335, 1, 0, 0, 1, 1,
0.6413236, -0.3212516, 1.83368, 1, 0, 0, 1, 1,
0.644156, 1.003709, -0.356332, 0, 0, 0, 1, 1,
0.6442248, -1.056725, 2.205916, 0, 0, 0, 1, 1,
0.6454028, -0.8154057, 3.343058, 0, 0, 0, 1, 1,
0.6456887, 1.575452, 2.660607, 0, 0, 0, 1, 1,
0.6472238, -1.203776, 2.974929, 0, 0, 0, 1, 1,
0.652618, 0.2416507, -0.4122222, 0, 0, 0, 1, 1,
0.6541746, 0.3919497, 2.552349, 0, 0, 0, 1, 1,
0.6542174, 1.036841, 1.180568, 1, 1, 1, 1, 1,
0.6569735, -0.9234252, 2.98698, 1, 1, 1, 1, 1,
0.6587943, -0.4719625, 3.12941, 1, 1, 1, 1, 1,
0.6593124, 0.09108724, 0.5468101, 1, 1, 1, 1, 1,
0.6597006, -0.9113399, 1.522643, 1, 1, 1, 1, 1,
0.6614386, -3.255922, 4.885721, 1, 1, 1, 1, 1,
0.662129, -1.51979, 2.881214, 1, 1, 1, 1, 1,
0.6655711, 1.141245, 1.247923, 1, 1, 1, 1, 1,
0.6676545, -1.232888, 1.885542, 1, 1, 1, 1, 1,
0.674332, -0.3919052, 1.774688, 1, 1, 1, 1, 1,
0.6769999, 0.7970119, 0.9645205, 1, 1, 1, 1, 1,
0.6777722, -1.782617, 3.833632, 1, 1, 1, 1, 1,
0.6806022, 1.235574, -0.3706076, 1, 1, 1, 1, 1,
0.6820627, 0.4144509, 0.4600394, 1, 1, 1, 1, 1,
0.6868461, -0.9172279, 2.8446, 1, 1, 1, 1, 1,
0.6911086, 0.3526044, 1.166057, 0, 0, 1, 1, 1,
0.6932209, -1.92299, 3.978317, 1, 0, 0, 1, 1,
0.6935409, 0.0003697098, 1.23017, 1, 0, 0, 1, 1,
0.6994511, -0.5932361, 2.286839, 1, 0, 0, 1, 1,
0.7041719, -1.845513, 3.256626, 1, 0, 0, 1, 1,
0.7072626, 0.2500992, 1.914981, 1, 0, 0, 1, 1,
0.7124915, -0.2428956, 2.874059, 0, 0, 0, 1, 1,
0.7190294, -0.200938, 0.6240749, 0, 0, 0, 1, 1,
0.7197053, 0.1364376, 1.857119, 0, 0, 0, 1, 1,
0.7204183, 0.193969, 1.015219, 0, 0, 0, 1, 1,
0.7228199, -0.770721, 2.704099, 0, 0, 0, 1, 1,
0.7308344, 0.8352855, 0.9777635, 0, 0, 0, 1, 1,
0.7349596, 0.3944792, -0.1713599, 0, 0, 0, 1, 1,
0.7357736, -0.6092967, 2.301919, 1, 1, 1, 1, 1,
0.7361646, 1.48014, 1.02426, 1, 1, 1, 1, 1,
0.7374272, -0.2578149, 0.9918801, 1, 1, 1, 1, 1,
0.7387245, -0.6640109, 2.230928, 1, 1, 1, 1, 1,
0.7415541, -0.03879547, 1.290612, 1, 1, 1, 1, 1,
0.7436641, 0.3128082, 1.678444, 1, 1, 1, 1, 1,
0.7481835, -1.828524, 3.218596, 1, 1, 1, 1, 1,
0.7512897, 0.7223124, 0.8935412, 1, 1, 1, 1, 1,
0.7596445, -0.05677849, 2.110571, 1, 1, 1, 1, 1,
0.7601801, 0.5490369, 1.059025, 1, 1, 1, 1, 1,
0.7627598, 0.4934452, 0.6395973, 1, 1, 1, 1, 1,
0.7631978, -0.4315515, 1.318903, 1, 1, 1, 1, 1,
0.7648255, 0.05233493, 0.8580834, 1, 1, 1, 1, 1,
0.7703933, 0.682226, 0.7911551, 1, 1, 1, 1, 1,
0.7734631, -0.2188276, 1.616635, 1, 1, 1, 1, 1,
0.7792559, 0.6216578, 0.5008968, 0, 0, 1, 1, 1,
0.7815291, -0.4694191, 1.835783, 1, 0, 0, 1, 1,
0.7971455, 0.009842171, 1.964332, 1, 0, 0, 1, 1,
0.7976434, -0.8553576, 1.304772, 1, 0, 0, 1, 1,
0.8037378, -0.196492, -0.2778935, 1, 0, 0, 1, 1,
0.8101858, 1.03239, 1.309564, 1, 0, 0, 1, 1,
0.8149028, -0.2595176, 2.130084, 0, 0, 0, 1, 1,
0.8233515, -0.6346774, 1.526636, 0, 0, 0, 1, 1,
0.824882, -0.3436904, 1.662174, 0, 0, 0, 1, 1,
0.8251436, 0.9168802, -0.2482547, 0, 0, 0, 1, 1,
0.8264416, 0.3766229, 0.863058, 0, 0, 0, 1, 1,
0.8302441, 1.120324, 1.622861, 0, 0, 0, 1, 1,
0.8354825, -2.102883, 1.826345, 0, 0, 0, 1, 1,
0.8358249, -0.03985514, 0.3903625, 1, 1, 1, 1, 1,
0.8442464, -0.2157832, 0.4556746, 1, 1, 1, 1, 1,
0.8477551, -0.1369665, 1.504129, 1, 1, 1, 1, 1,
0.8517472, 1.659238, 0.1914622, 1, 1, 1, 1, 1,
0.8518558, -0.5073533, 1.761909, 1, 1, 1, 1, 1,
0.8526128, 0.9918588, 0.8701378, 1, 1, 1, 1, 1,
0.8559198, 0.578638, 1.228418, 1, 1, 1, 1, 1,
0.8632371, 0.1136752, 0.6056628, 1, 1, 1, 1, 1,
0.8746134, 0.07864469, 0.3580169, 1, 1, 1, 1, 1,
0.8767002, -0.719546, 2.970754, 1, 1, 1, 1, 1,
0.8768732, -0.01529275, 1.30542, 1, 1, 1, 1, 1,
0.8830003, -0.136517, 2.05462, 1, 1, 1, 1, 1,
0.8837519, -0.4067363, 2.07275, 1, 1, 1, 1, 1,
0.8897972, -0.3317026, 2.239861, 1, 1, 1, 1, 1,
0.9011871, -0.7830091, 3.243629, 1, 1, 1, 1, 1,
0.9064891, 1.31261, 0.99908, 0, 0, 1, 1, 1,
0.9070466, 0.052023, 1.786177, 1, 0, 0, 1, 1,
0.9083266, 1.705623, 1.38702, 1, 0, 0, 1, 1,
0.9118288, -1.326105, 0.2585367, 1, 0, 0, 1, 1,
0.9151555, 2.263253, -0.07507133, 1, 0, 0, 1, 1,
0.9153203, -1.484023, 1.742103, 1, 0, 0, 1, 1,
0.9153671, 1.26532, 0.6060643, 0, 0, 0, 1, 1,
0.9173831, 0.4351383, 1.983106, 0, 0, 0, 1, 1,
0.9201485, 0.7815407, 1.14879, 0, 0, 0, 1, 1,
0.9322928, -0.324801, 2.315289, 0, 0, 0, 1, 1,
0.9323366, -0.4057585, 3.764926, 0, 0, 0, 1, 1,
0.935811, 0.3107732, -0.1312476, 0, 0, 0, 1, 1,
0.937257, -1.726785, 1.824584, 0, 0, 0, 1, 1,
0.9373278, -0.1539391, 1.160476, 1, 1, 1, 1, 1,
0.9373556, -1.121766, 3.998921, 1, 1, 1, 1, 1,
0.9374321, -1.816713, 2.132953, 1, 1, 1, 1, 1,
0.9380592, -1.144703, 0.6892695, 1, 1, 1, 1, 1,
0.941115, 1.377405, -0.6080539, 1, 1, 1, 1, 1,
0.9437242, 1.117989, 2.121916, 1, 1, 1, 1, 1,
0.945211, 0.4477659, 2.57269, 1, 1, 1, 1, 1,
0.9466704, 0.9015626, 0.3013682, 1, 1, 1, 1, 1,
0.9495626, -0.03954139, 2.951082, 1, 1, 1, 1, 1,
0.9516096, 0.02991771, 1.069291, 1, 1, 1, 1, 1,
0.9550489, 0.6129981, 1.851065, 1, 1, 1, 1, 1,
0.9624892, -0.2883045, 1.5248, 1, 1, 1, 1, 1,
0.9758423, 0.9076739, -0.4211029, 1, 1, 1, 1, 1,
0.9812135, 0.2080375, 1.028953, 1, 1, 1, 1, 1,
0.988152, -0.05625258, 2.533512, 1, 1, 1, 1, 1,
0.9886249, 0.5158858, 0.6186975, 0, 0, 1, 1, 1,
0.997479, 1.913978, 1.255474, 1, 0, 0, 1, 1,
1.001312, 2.675498, 3.054745, 1, 0, 0, 1, 1,
1.002037, 0.5707184, 0.4023358, 1, 0, 0, 1, 1,
1.002299, -1.142375, 2.346252, 1, 0, 0, 1, 1,
1.002424, 2.01607, -0.6886917, 1, 0, 0, 1, 1,
1.007451, -0.9881232, 1.820499, 0, 0, 0, 1, 1,
1.009121, -2.822958, 3.038361, 0, 0, 0, 1, 1,
1.012908, -1.457573, 1.438286, 0, 0, 0, 1, 1,
1.019302, -1.03915, 3.072025, 0, 0, 0, 1, 1,
1.025055, -0.2249339, 1.436177, 0, 0, 0, 1, 1,
1.033816, 0.01888409, 2.12863, 0, 0, 0, 1, 1,
1.03586, 0.4291614, -0.2365949, 0, 0, 0, 1, 1,
1.038816, 1.165462, 0.814485, 1, 1, 1, 1, 1,
1.040926, 1.998464, -0.5672946, 1, 1, 1, 1, 1,
1.041122, 0.06315812, -0.2076244, 1, 1, 1, 1, 1,
1.04749, -1.3985, 2.913388, 1, 1, 1, 1, 1,
1.063541, 0.9640748, -0.07374337, 1, 1, 1, 1, 1,
1.082485, 1.096416, 1.612678, 1, 1, 1, 1, 1,
1.085061, 1.288753, -0.1148313, 1, 1, 1, 1, 1,
1.088995, -1.221808, 3.085121, 1, 1, 1, 1, 1,
1.094482, 0.08538228, 3.530475, 1, 1, 1, 1, 1,
1.101079, 1.46259, 0.2252219, 1, 1, 1, 1, 1,
1.102887, 1.139996, 1.839341, 1, 1, 1, 1, 1,
1.10517, -0.8532009, 4.223701, 1, 1, 1, 1, 1,
1.10567, -0.07251679, 0.9066867, 1, 1, 1, 1, 1,
1.110715, 0.2566777, 1.38739, 1, 1, 1, 1, 1,
1.12184, 0.5417759, -0.5680313, 1, 1, 1, 1, 1,
1.126479, -0.4803683, 1.799104, 0, 0, 1, 1, 1,
1.127565, 0.2602401, 1.528793, 1, 0, 0, 1, 1,
1.129986, -1.09965, 1.799829, 1, 0, 0, 1, 1,
1.130638, 1.687792, 0.6659226, 1, 0, 0, 1, 1,
1.132778, -1.113002, 2.747301, 1, 0, 0, 1, 1,
1.132984, 0.5390666, 0.631664, 1, 0, 0, 1, 1,
1.136013, 2.251887, 1.083202, 0, 0, 0, 1, 1,
1.140951, 1.016532, -0.3491542, 0, 0, 0, 1, 1,
1.141052, 1.140919, 0.9463449, 0, 0, 0, 1, 1,
1.141665, -0.4020329, 1.076959, 0, 0, 0, 1, 1,
1.152147, 2.201969, -2.074982, 0, 0, 0, 1, 1,
1.152603, 1.66492, 1.366122, 0, 0, 0, 1, 1,
1.155897, 0.9156648, 0.2888233, 0, 0, 0, 1, 1,
1.156449, -1.564444, 3.103575, 1, 1, 1, 1, 1,
1.160783, 1.025519, 0.6773099, 1, 1, 1, 1, 1,
1.16288, -1.986981, 2.541276, 1, 1, 1, 1, 1,
1.167886, -0.7535006, 2.428037, 1, 1, 1, 1, 1,
1.188601, 1.300774, -0.105309, 1, 1, 1, 1, 1,
1.190731, -0.9409006, 4.037961, 1, 1, 1, 1, 1,
1.201227, 0.8237879, 0.8608974, 1, 1, 1, 1, 1,
1.201277, -1.869897, 2.629704, 1, 1, 1, 1, 1,
1.204891, -0.2113878, 1.863345, 1, 1, 1, 1, 1,
1.207749, -1.625413, 2.021805, 1, 1, 1, 1, 1,
1.210605, -0.2545331, 1.020617, 1, 1, 1, 1, 1,
1.217248, 0.706593, 0.2522969, 1, 1, 1, 1, 1,
1.221238, 0.5668154, 2.360084, 1, 1, 1, 1, 1,
1.222015, 1.222139, 0.7770627, 1, 1, 1, 1, 1,
1.223481, 0.6496509, 2.553336, 1, 1, 1, 1, 1,
1.224335, 0.8965119, 0.2741638, 0, 0, 1, 1, 1,
1.22469, 0.4672673, 1.413793, 1, 0, 0, 1, 1,
1.227235, -1.185232, 2.366563, 1, 0, 0, 1, 1,
1.230615, -1.68345, 1.821037, 1, 0, 0, 1, 1,
1.2605, -0.1442048, 0.4976003, 1, 0, 0, 1, 1,
1.261778, 1.039218, 1.19898, 1, 0, 0, 1, 1,
1.27112, -1.406218, 3.61359, 0, 0, 0, 1, 1,
1.271403, -0.1693084, 1.800978, 0, 0, 0, 1, 1,
1.272415, 1.929314, -0.5822345, 0, 0, 0, 1, 1,
1.280517, 0.8316483, 1.175942, 0, 0, 0, 1, 1,
1.283987, -0.2349716, 1.625364, 0, 0, 0, 1, 1,
1.29431, -0.9279163, 1.937582, 0, 0, 0, 1, 1,
1.294467, 0.803843, 1.122541, 0, 0, 0, 1, 1,
1.295647, -1.173923, 1.494199, 1, 1, 1, 1, 1,
1.302044, 0.1754134, -0.2993211, 1, 1, 1, 1, 1,
1.302947, -0.2608295, 2.62557, 1, 1, 1, 1, 1,
1.303295, -0.22917, 0.9103043, 1, 1, 1, 1, 1,
1.313743, -0.2325302, 1.941989, 1, 1, 1, 1, 1,
1.325879, 0.3021731, -1.561524, 1, 1, 1, 1, 1,
1.332023, 0.6961951, 1.840391, 1, 1, 1, 1, 1,
1.336908, -0.2733704, -0.02181071, 1, 1, 1, 1, 1,
1.344006, -1.056483, 3.738197, 1, 1, 1, 1, 1,
1.34985, 0.3841586, 1.630634, 1, 1, 1, 1, 1,
1.351023, 1.09386, 1.60149, 1, 1, 1, 1, 1,
1.361524, -0.1761405, 2.950135, 1, 1, 1, 1, 1,
1.362104, -0.4999306, 2.838744, 1, 1, 1, 1, 1,
1.383604, 0.9125223, 2.591376, 1, 1, 1, 1, 1,
1.395579, 1.392938, 1.809632, 1, 1, 1, 1, 1,
1.397118, -0.6779351, 1.190212, 0, 0, 1, 1, 1,
1.413445, 0.1367648, 2.638144, 1, 0, 0, 1, 1,
1.417697, 0.4035491, -0.1249113, 1, 0, 0, 1, 1,
1.439512, -1.647932, 0.9083843, 1, 0, 0, 1, 1,
1.461139, 1.057068, 2.736179, 1, 0, 0, 1, 1,
1.464562, -0.6832805, 1.519784, 1, 0, 0, 1, 1,
1.475286, -1.007659, 3.376961, 0, 0, 0, 1, 1,
1.482574, -0.4382411, 0.3692274, 0, 0, 0, 1, 1,
1.484515, 0.1451343, 0.9683673, 0, 0, 0, 1, 1,
1.485097, 0.07265997, -0.2259562, 0, 0, 0, 1, 1,
1.496663, 0.652025, 1.650758, 0, 0, 0, 1, 1,
1.497284, -0.8207081, 2.261996, 0, 0, 0, 1, 1,
1.502821, -0.5902225, 1.971262, 0, 0, 0, 1, 1,
1.513697, 0.1811969, 0.9394839, 1, 1, 1, 1, 1,
1.519587, 0.7164439, 0.422234, 1, 1, 1, 1, 1,
1.523792, -0.5442101, 5.157959, 1, 1, 1, 1, 1,
1.535442, -1.594411, 2.157258, 1, 1, 1, 1, 1,
1.536159, 1.639358, 0.8049171, 1, 1, 1, 1, 1,
1.542214, 0.5597293, 0.686128, 1, 1, 1, 1, 1,
1.546505, -0.09645583, 2.149891, 1, 1, 1, 1, 1,
1.550817, -0.8063, 2.256653, 1, 1, 1, 1, 1,
1.554026, 0.657213, 0.2165129, 1, 1, 1, 1, 1,
1.566601, 0.6901159, 3.586812, 1, 1, 1, 1, 1,
1.583384, 0.6321803, 0.6600024, 1, 1, 1, 1, 1,
1.588406, -0.4939882, 2.102162, 1, 1, 1, 1, 1,
1.594554, -0.08414965, 1.897176, 1, 1, 1, 1, 1,
1.598846, 0.3351085, -0.1745852, 1, 1, 1, 1, 1,
1.603459, -0.229762, -0.06107214, 1, 1, 1, 1, 1,
1.604776, 1.067035, 2.573955, 0, 0, 1, 1, 1,
1.60583, -1.266567, 3.724059, 1, 0, 0, 1, 1,
1.607701, -0.3009888, 2.825915, 1, 0, 0, 1, 1,
1.614115, 1.976389, -0.677999, 1, 0, 0, 1, 1,
1.621508, -0.7120655, 2.252887, 1, 0, 0, 1, 1,
1.62349, -0.5663542, 2.650046, 1, 0, 0, 1, 1,
1.636984, -0.2234458, 1.886125, 0, 0, 0, 1, 1,
1.650777, -0.8929486, 1.525773, 0, 0, 0, 1, 1,
1.680078, -0.4235387, 1.893153, 0, 0, 0, 1, 1,
1.681351, -0.8690631, 2.878034, 0, 0, 0, 1, 1,
1.698079, 0.4162972, 1.074423, 0, 0, 0, 1, 1,
1.702635, -2.22878, 2.92732, 0, 0, 0, 1, 1,
1.708145, 1.061153, 1.115718, 0, 0, 0, 1, 1,
1.710576, -1.22001, 1.498341, 1, 1, 1, 1, 1,
1.712875, 0.2120655, 2.519038, 1, 1, 1, 1, 1,
1.749856, 0.2659286, 1.711284, 1, 1, 1, 1, 1,
1.776987, 0.5645872, 3.181135, 1, 1, 1, 1, 1,
1.782342, 1.522706, 0.8437366, 1, 1, 1, 1, 1,
1.816236, -0.02405104, 2.883392, 1, 1, 1, 1, 1,
1.828575, 1.788905, 1.55885, 1, 1, 1, 1, 1,
1.835185, 0.6518989, 0.2916976, 1, 1, 1, 1, 1,
1.852241, 0.6646721, 1.67879, 1, 1, 1, 1, 1,
1.856751, 0.1225555, -0.1964127, 1, 1, 1, 1, 1,
1.87326, -2.540772, 1.039822, 1, 1, 1, 1, 1,
1.885211, -2.03387, 1.171172, 1, 1, 1, 1, 1,
1.886782, 0.8403348, 1.106563, 1, 1, 1, 1, 1,
1.887891, -2.070564, 0.7264476, 1, 1, 1, 1, 1,
1.897865, -0.6212104, 1.130478, 1, 1, 1, 1, 1,
1.938742, -1.229265, 2.351662, 0, 0, 1, 1, 1,
1.969343, 0.9717583, 1.654296, 1, 0, 0, 1, 1,
1.980381, 0.6970707, 1.170675, 1, 0, 0, 1, 1,
2.031465, -1.186269, 1.851535, 1, 0, 0, 1, 1,
2.034847, 0.5251976, 1.064586, 1, 0, 0, 1, 1,
2.06348, 0.2497775, 2.89869, 1, 0, 0, 1, 1,
2.103907, -0.6372856, 3.145386, 0, 0, 0, 1, 1,
2.129292, 0.424351, 0.7200337, 0, 0, 0, 1, 1,
2.133489, 0.07544173, 1.403262, 0, 0, 0, 1, 1,
2.147506, 2.344078, -0.2911058, 0, 0, 0, 1, 1,
2.179217, 0.2556508, 2.396487, 0, 0, 0, 1, 1,
2.271515, 0.6674767, 3.284105, 0, 0, 0, 1, 1,
2.383164, -0.0227653, -0.5724035, 0, 0, 0, 1, 1,
2.39418, 1.912487, 0.6275224, 1, 1, 1, 1, 1,
2.483459, -1.653667, 3.107111, 1, 1, 1, 1, 1,
2.620847, 0.9674189, 2.416101, 1, 1, 1, 1, 1,
2.7263, 0.5301847, -0.04362145, 1, 1, 1, 1, 1,
2.804467, -1.67253, 4.724312, 1, 1, 1, 1, 1,
2.809227, -0.6616855, 3.276897, 1, 1, 1, 1, 1,
3.175582, 0.05048196, 2.320478, 1, 1, 1, 1, 1
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
var radius = 9.474684;
var distance = 33.27943;
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
mvMatrix.translate( -0.1637182, 0.1160226, 0.09501052 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.27943);
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
