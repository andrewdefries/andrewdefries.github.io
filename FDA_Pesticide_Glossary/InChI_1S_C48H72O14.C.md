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
-2.92777, -2.048942, -2.766455, 1, 0, 0, 1,
-2.885288, -0.5034221, -0.937287, 1, 0.007843138, 0, 1,
-2.813797, 0.9395903, -3.450039, 1, 0.01176471, 0, 1,
-2.708102, -1.503872, -2.360226, 1, 0.01960784, 0, 1,
-2.548865, 0.1368234, -0.9172053, 1, 0.02352941, 0, 1,
-2.460211, 0.216001, -0.8820536, 1, 0.03137255, 0, 1,
-2.450727, 0.8654103, -3.873099, 1, 0.03529412, 0, 1,
-2.378038, 0.4698636, -0.9882711, 1, 0.04313726, 0, 1,
-2.34201, -2.351193, -0.8745679, 1, 0.04705882, 0, 1,
-2.265844, -0.1629076, -0.3423646, 1, 0.05490196, 0, 1,
-2.218138, -0.5207145, -0.7195249, 1, 0.05882353, 0, 1,
-2.188073, -0.9084322, -3.518856, 1, 0.06666667, 0, 1,
-2.157641, 0.3806475, -1.452908, 1, 0.07058824, 0, 1,
-2.022832, -0.4298318, -0.03698681, 1, 0.07843138, 0, 1,
-1.996461, -0.2905344, 0.6687243, 1, 0.08235294, 0, 1,
-1.990896, 0.9244736, -1.443087, 1, 0.09019608, 0, 1,
-1.988967, 0.7395867, -1.683474, 1, 0.09411765, 0, 1,
-1.970526, 0.9933621, 1.267051, 1, 0.1019608, 0, 1,
-1.918049, -1.464198, -1.895532, 1, 0.1098039, 0, 1,
-1.897646, -0.3024083, -2.98276, 1, 0.1137255, 0, 1,
-1.875859, 0.7566609, -0.6015841, 1, 0.1215686, 0, 1,
-1.860711, 0.8423457, -1.264517, 1, 0.1254902, 0, 1,
-1.838287, 0.8142228, 1.059173, 1, 0.1333333, 0, 1,
-1.828449, 1.310921, -0.6008488, 1, 0.1372549, 0, 1,
-1.816718, 1.158673, -1.997184, 1, 0.145098, 0, 1,
-1.752041, -0.2143405, -1.479198, 1, 0.1490196, 0, 1,
-1.747888, -0.1023504, -1.44775, 1, 0.1568628, 0, 1,
-1.742907, -0.9533191, -1.974743, 1, 0.1607843, 0, 1,
-1.724684, 0.5324488, -0.08435772, 1, 0.1686275, 0, 1,
-1.724482, -0.9054869, -2.0769, 1, 0.172549, 0, 1,
-1.700256, 1.966081, 0.934621, 1, 0.1803922, 0, 1,
-1.689953, -0.5059746, -2.011838, 1, 0.1843137, 0, 1,
-1.684984, -0.6198646, -1.65495, 1, 0.1921569, 0, 1,
-1.679719, -0.1822643, 0.4408286, 1, 0.1960784, 0, 1,
-1.660209, -1.760031, -1.528559, 1, 0.2039216, 0, 1,
-1.649043, -0.2819753, -2.640034, 1, 0.2117647, 0, 1,
-1.645247, -1.50871, -1.811962, 1, 0.2156863, 0, 1,
-1.644013, 0.4645059, -1.692616, 1, 0.2235294, 0, 1,
-1.633932, 1.204684, 0.05263762, 1, 0.227451, 0, 1,
-1.625865, 0.2149619, -1.047461, 1, 0.2352941, 0, 1,
-1.619155, -2.376248, -2.118492, 1, 0.2392157, 0, 1,
-1.615945, -0.4990181, -1.237212, 1, 0.2470588, 0, 1,
-1.612528, 0.5378779, -1.042346, 1, 0.2509804, 0, 1,
-1.606903, 1.162169, -0.8768686, 1, 0.2588235, 0, 1,
-1.596283, -0.5355328, -2.683839, 1, 0.2627451, 0, 1,
-1.593256, -0.1890339, -3.653921, 1, 0.2705882, 0, 1,
-1.578409, -1.16762, -4.571323, 1, 0.2745098, 0, 1,
-1.575514, -0.7085524, -1.645801, 1, 0.282353, 0, 1,
-1.564064, -0.09763573, -0.2089301, 1, 0.2862745, 0, 1,
-1.562828, 1.741, -3.299721, 1, 0.2941177, 0, 1,
-1.541942, -0.5099536, -0.4963035, 1, 0.3019608, 0, 1,
-1.532177, -1.726822, -3.654323, 1, 0.3058824, 0, 1,
-1.522402, -0.9808691, -1.182693, 1, 0.3137255, 0, 1,
-1.503736, -0.1335981, -0.2428166, 1, 0.3176471, 0, 1,
-1.475034, 0.3966032, -1.954301, 1, 0.3254902, 0, 1,
-1.472623, -0.3581616, -3.845938, 1, 0.3294118, 0, 1,
-1.471285, 1.105697, -0.5051968, 1, 0.3372549, 0, 1,
-1.470222, -1.191163, -1.170804, 1, 0.3411765, 0, 1,
-1.466322, -0.3487024, -2.088868, 1, 0.3490196, 0, 1,
-1.459408, -0.6864663, -3.982203, 1, 0.3529412, 0, 1,
-1.432074, -1.080499, -0.2257295, 1, 0.3607843, 0, 1,
-1.422403, -0.06701893, -0.8752528, 1, 0.3647059, 0, 1,
-1.422023, -1.122398, -2.517834, 1, 0.372549, 0, 1,
-1.411597, 1.248481, -2.118912, 1, 0.3764706, 0, 1,
-1.399512, 0.1649074, -0.7607892, 1, 0.3843137, 0, 1,
-1.399166, -3.000568, -3.444628, 1, 0.3882353, 0, 1,
-1.37755, 1.492671, -0.3853225, 1, 0.3960784, 0, 1,
-1.376362, 1.138631, 1.071761, 1, 0.4039216, 0, 1,
-1.374878, -0.08308209, -3.273366, 1, 0.4078431, 0, 1,
-1.37443, -0.4322326, -1.047482, 1, 0.4156863, 0, 1,
-1.363555, 0.2004171, -1.748347, 1, 0.4196078, 0, 1,
-1.360856, -0.6073247, -0.8405812, 1, 0.427451, 0, 1,
-1.357255, -0.4834967, -3.595646, 1, 0.4313726, 0, 1,
-1.34765, -0.17046, -1.728079, 1, 0.4392157, 0, 1,
-1.34595, -0.3118457, -0.531437, 1, 0.4431373, 0, 1,
-1.343184, 0.4297171, -1.450834, 1, 0.4509804, 0, 1,
-1.338268, 0.9590382, -0.3445974, 1, 0.454902, 0, 1,
-1.337951, -0.01208401, -0.2501564, 1, 0.4627451, 0, 1,
-1.298106, 0.5791432, -1.755555, 1, 0.4666667, 0, 1,
-1.293338, 0.8604927, -1.687144, 1, 0.4745098, 0, 1,
-1.292046, 0.6733717, -0.1294458, 1, 0.4784314, 0, 1,
-1.278665, -2.224139, -4.509063, 1, 0.4862745, 0, 1,
-1.276582, 0.3842949, -0.8237757, 1, 0.4901961, 0, 1,
-1.271839, 1.611508, 0.2371214, 1, 0.4980392, 0, 1,
-1.268283, 0.8933796, -1.860338, 1, 0.5058824, 0, 1,
-1.26449, -0.9788209, -3.205707, 1, 0.509804, 0, 1,
-1.262533, 0.1987047, -1.410383, 1, 0.5176471, 0, 1,
-1.260296, -0.3328347, -0.6814882, 1, 0.5215687, 0, 1,
-1.256726, 1.167612, -1.616432, 1, 0.5294118, 0, 1,
-1.253541, -0.1884671, -1.088317, 1, 0.5333334, 0, 1,
-1.239937, 0.2663567, -1.380031, 1, 0.5411765, 0, 1,
-1.237448, -0.9783975, -3.002073, 1, 0.5450981, 0, 1,
-1.227781, 0.01206667, -1.284228, 1, 0.5529412, 0, 1,
-1.227246, 0.3639663, -0.1120928, 1, 0.5568628, 0, 1,
-1.221621, 0.1566232, -0.6407356, 1, 0.5647059, 0, 1,
-1.206339, -0.02094989, -3.26906, 1, 0.5686275, 0, 1,
-1.201101, -1.411582, -1.369867, 1, 0.5764706, 0, 1,
-1.19375, 0.2205988, -1.591913, 1, 0.5803922, 0, 1,
-1.190076, 0.4978183, -0.5143342, 1, 0.5882353, 0, 1,
-1.187316, -0.364428, -1.620239, 1, 0.5921569, 0, 1,
-1.185118, 0.5428068, -0.194877, 1, 0.6, 0, 1,
-1.184312, -0.08043856, -1.532876, 1, 0.6078432, 0, 1,
-1.18267, 0.5112734, -0.8889381, 1, 0.6117647, 0, 1,
-1.182032, 2.106992, -1.203128, 1, 0.6196079, 0, 1,
-1.166824, -0.4779169, -1.995566, 1, 0.6235294, 0, 1,
-1.164778, -0.2917289, -3.214399, 1, 0.6313726, 0, 1,
-1.164437, -0.8651986, -2.501634, 1, 0.6352941, 0, 1,
-1.157021, 2.006258, 0.09227728, 1, 0.6431373, 0, 1,
-1.148236, -0.8202865, -1.62814, 1, 0.6470588, 0, 1,
-1.145058, -0.7694765, -1.559297, 1, 0.654902, 0, 1,
-1.143634, 0.01717434, -0.3672593, 1, 0.6588235, 0, 1,
-1.140104, -1.060043, -1.236967, 1, 0.6666667, 0, 1,
-1.138069, 1.021683, -1.568626, 1, 0.6705883, 0, 1,
-1.134227, -0.08520537, -3.518246, 1, 0.6784314, 0, 1,
-1.133889, -0.9826013, -3.310232, 1, 0.682353, 0, 1,
-1.132201, 0.06242203, -0.07856885, 1, 0.6901961, 0, 1,
-1.131517, 0.4268728, -1.431256, 1, 0.6941177, 0, 1,
-1.123936, -0.0735265, -3.14013, 1, 0.7019608, 0, 1,
-1.117913, 0.03754483, -0.6573104, 1, 0.7098039, 0, 1,
-1.115881, -1.765154, -3.392547, 1, 0.7137255, 0, 1,
-1.112953, 0.8238953, 0.8289728, 1, 0.7215686, 0, 1,
-1.112193, -1.425419, -1.489297, 1, 0.7254902, 0, 1,
-1.111207, -0.3930413, -3.334756, 1, 0.7333333, 0, 1,
-1.108401, 0.7077268, -1.580356, 1, 0.7372549, 0, 1,
-1.108136, 0.249861, -0.6622629, 1, 0.7450981, 0, 1,
-1.106199, 1.17979, -2.800002, 1, 0.7490196, 0, 1,
-1.10479, 1.02861, -1.553485, 1, 0.7568628, 0, 1,
-1.097523, 0.2187629, 0.3169037, 1, 0.7607843, 0, 1,
-1.093092, 0.3019951, -1.286851, 1, 0.7686275, 0, 1,
-1.089551, 1.046193, -0.7570816, 1, 0.772549, 0, 1,
-1.08853, 0.06035765, -1.65593, 1, 0.7803922, 0, 1,
-1.083932, -1.217217, -2.522954, 1, 0.7843137, 0, 1,
-1.077218, 1.869733, -1.195482, 1, 0.7921569, 0, 1,
-1.07588, 0.6954767, -0.9291918, 1, 0.7960784, 0, 1,
-1.067264, -0.1930472, -0.3958123, 1, 0.8039216, 0, 1,
-1.066661, 0.3862719, -0.4480472, 1, 0.8117647, 0, 1,
-1.049456, -1.174821, -3.616372, 1, 0.8156863, 0, 1,
-1.049159, -0.5611466, -0.1281663, 1, 0.8235294, 0, 1,
-1.047377, 1.437828, -0.4641613, 1, 0.827451, 0, 1,
-1.043492, -0.4654869, -3.114457, 1, 0.8352941, 0, 1,
-1.03957, -0.1241979, -1.026863, 1, 0.8392157, 0, 1,
-1.039134, -2.505007, -2.576866, 1, 0.8470588, 0, 1,
-1.03637, -0.8870137, -3.349211, 1, 0.8509804, 0, 1,
-1.034914, 0.5688693, -2.011689, 1, 0.8588235, 0, 1,
-1.033923, -1.573015, -2.281847, 1, 0.8627451, 0, 1,
-1.03141, 1.473754, -0.5400444, 1, 0.8705882, 0, 1,
-1.028595, 0.3757572, -1.481256, 1, 0.8745098, 0, 1,
-1.02664, -1.919583, -3.379667, 1, 0.8823529, 0, 1,
-1.026214, -0.2176188, -3.507376, 1, 0.8862745, 0, 1,
-1.014297, -1.047468, -1.099644, 1, 0.8941177, 0, 1,
-1.010991, 0.2550853, -2.047173, 1, 0.8980392, 0, 1,
-1.008526, 1.011814, -2.093409, 1, 0.9058824, 0, 1,
-1.00852, 1.838386, -1.248516, 1, 0.9137255, 0, 1,
-1.007571, -0.8190024, -2.230594, 1, 0.9176471, 0, 1,
-1.001837, -0.9187862, -3.265053, 1, 0.9254902, 0, 1,
-0.9982451, -0.6088403, -2.584804, 1, 0.9294118, 0, 1,
-0.9952782, -0.1297409, -2.946517, 1, 0.9372549, 0, 1,
-0.9944694, -1.343116, -4.634367, 1, 0.9411765, 0, 1,
-0.9934664, -0.9863999, -1.146415, 1, 0.9490196, 0, 1,
-0.9905936, 1.196226, -1.552227, 1, 0.9529412, 0, 1,
-0.9896961, -0.8536544, -2.00113, 1, 0.9607843, 0, 1,
-0.987887, 0.5530913, -0.1457766, 1, 0.9647059, 0, 1,
-0.9719698, 1.51438, -0.8193843, 1, 0.972549, 0, 1,
-0.9676783, 0.4688355, 0.05852427, 1, 0.9764706, 0, 1,
-0.9665625, -0.7290004, -1.111036, 1, 0.9843137, 0, 1,
-0.9618857, -0.1349289, -1.404571, 1, 0.9882353, 0, 1,
-0.9593498, -0.9394299, -3.727289, 1, 0.9960784, 0, 1,
-0.9586675, -2.167464, -1.86429, 0.9960784, 1, 0, 1,
-0.9555143, 0.1763601, 0.7660232, 0.9921569, 1, 0, 1,
-0.9472119, 0.1888927, -0.6159474, 0.9843137, 1, 0, 1,
-0.9469883, 1.660009, -1.924559, 0.9803922, 1, 0, 1,
-0.945351, -1.939467, -3.907401, 0.972549, 1, 0, 1,
-0.9452429, -0.1483682, -1.831184, 0.9686275, 1, 0, 1,
-0.944057, -0.3711536, -1.407768, 0.9607843, 1, 0, 1,
-0.921708, 1.620049, 1.226212, 0.9568627, 1, 0, 1,
-0.9195414, 0.3032016, -1.707829, 0.9490196, 1, 0, 1,
-0.9177027, 1.291487, 1.279412, 0.945098, 1, 0, 1,
-0.9174051, 0.2425292, -0.8664523, 0.9372549, 1, 0, 1,
-0.9169053, -0.2256331, -0.2743917, 0.9333333, 1, 0, 1,
-0.9084872, -1.149522, -3.935168, 0.9254902, 1, 0, 1,
-0.9082531, 1.925602, -0.529937, 0.9215686, 1, 0, 1,
-0.9077061, 0.2757141, 0.2530439, 0.9137255, 1, 0, 1,
-0.8968962, 1.08326, -1.3643, 0.9098039, 1, 0, 1,
-0.8961241, -1.500134, -3.738741, 0.9019608, 1, 0, 1,
-0.8929008, -1.410586, -2.130974, 0.8941177, 1, 0, 1,
-0.8800704, -1.426556, -4.125446, 0.8901961, 1, 0, 1,
-0.8775345, -0.6115937, -2.211529, 0.8823529, 1, 0, 1,
-0.8709053, -1.12756, -2.791687, 0.8784314, 1, 0, 1,
-0.8618262, -0.1856451, -1.055189, 0.8705882, 1, 0, 1,
-0.859766, -0.07593523, 0.9701812, 0.8666667, 1, 0, 1,
-0.8566964, -0.8808975, -2.729452, 0.8588235, 1, 0, 1,
-0.8514427, 0.01360929, -0.5968636, 0.854902, 1, 0, 1,
-0.8513268, -0.4112112, -2.115167, 0.8470588, 1, 0, 1,
-0.8507527, -2.652641, -0.9925799, 0.8431373, 1, 0, 1,
-0.8464574, -0.4366044, -2.21306, 0.8352941, 1, 0, 1,
-0.8427991, 0.1485386, -0.8674338, 0.8313726, 1, 0, 1,
-0.8426405, 0.8070747, -0.904544, 0.8235294, 1, 0, 1,
-0.8396294, -1.33141, -5.269207, 0.8196079, 1, 0, 1,
-0.8361206, 0.6109108, 0.05476528, 0.8117647, 1, 0, 1,
-0.8330764, -1.895142, -2.987338, 0.8078431, 1, 0, 1,
-0.8283097, -1.152211, -3.381414, 0.8, 1, 0, 1,
-0.8244467, -0.04430055, -0.4974475, 0.7921569, 1, 0, 1,
-0.8223177, -2.299352, -2.009076, 0.7882353, 1, 0, 1,
-0.8222363, 1.681148, 0.9360858, 0.7803922, 1, 0, 1,
-0.8214684, 0.5464652, -0.1300175, 0.7764706, 1, 0, 1,
-0.8202493, -0.6118852, -4.230277, 0.7686275, 1, 0, 1,
-0.8185656, -1.383051, -1.908863, 0.7647059, 1, 0, 1,
-0.8181359, 0.8540943, -0.06551934, 0.7568628, 1, 0, 1,
-0.8158851, -0.5017641, -3.22218, 0.7529412, 1, 0, 1,
-0.8151976, 1.61631, -0.1353312, 0.7450981, 1, 0, 1,
-0.8126475, 1.10648, -1.220698, 0.7411765, 1, 0, 1,
-0.8125881, -0.6197183, -0.9062817, 0.7333333, 1, 0, 1,
-0.8109474, -1.223819, -2.875051, 0.7294118, 1, 0, 1,
-0.8098385, -0.4795691, -3.5722, 0.7215686, 1, 0, 1,
-0.7960206, -0.4936025, -0.2886853, 0.7176471, 1, 0, 1,
-0.7855502, 1.607074, -0.105266, 0.7098039, 1, 0, 1,
-0.7826653, 0.998522, -0.5506107, 0.7058824, 1, 0, 1,
-0.7795817, 0.1136329, -0.6585247, 0.6980392, 1, 0, 1,
-0.7678702, 0.3966313, -1.190042, 0.6901961, 1, 0, 1,
-0.7664778, 0.9200569, -0.3260783, 0.6862745, 1, 0, 1,
-0.7648745, -0.6095272, -2.095134, 0.6784314, 1, 0, 1,
-0.7580111, 1.237705, -1.013496, 0.6745098, 1, 0, 1,
-0.7567089, -0.7426044, -1.009968, 0.6666667, 1, 0, 1,
-0.7553905, -0.1521096, 0.9653678, 0.6627451, 1, 0, 1,
-0.7522931, -1.599681, -2.525436, 0.654902, 1, 0, 1,
-0.7456971, -1.49405, -3.154446, 0.6509804, 1, 0, 1,
-0.7430685, 0.4926728, -0.3807005, 0.6431373, 1, 0, 1,
-0.7418625, -0.1190459, -2.720648, 0.6392157, 1, 0, 1,
-0.7387676, 0.1376235, -2.024757, 0.6313726, 1, 0, 1,
-0.737792, 2.431697, -0.4191191, 0.627451, 1, 0, 1,
-0.7346092, 1.810929, -2.675115, 0.6196079, 1, 0, 1,
-0.7211273, 0.3490011, -0.6429157, 0.6156863, 1, 0, 1,
-0.718381, -1.059034, -2.055156, 0.6078432, 1, 0, 1,
-0.7169226, -1.502802, -2.58426, 0.6039216, 1, 0, 1,
-0.7157604, -0.8239592, -1.589964, 0.5960785, 1, 0, 1,
-0.7053103, -1.146897, -1.645755, 0.5882353, 1, 0, 1,
-0.7040526, 0.4951708, -0.2314599, 0.5843138, 1, 0, 1,
-0.7016755, -1.435328, -3.535117, 0.5764706, 1, 0, 1,
-0.7006662, -0.9504704, -3.163323, 0.572549, 1, 0, 1,
-0.6963702, -1.200002, -2.392658, 0.5647059, 1, 0, 1,
-0.6916375, -0.6669285, -3.412331, 0.5607843, 1, 0, 1,
-0.6846654, 0.5208689, -1.041123, 0.5529412, 1, 0, 1,
-0.6817267, 1.238676, -1.148834, 0.5490196, 1, 0, 1,
-0.6771286, -0.1045254, 0.4448809, 0.5411765, 1, 0, 1,
-0.6698238, 0.7499324, -0.7691497, 0.5372549, 1, 0, 1,
-0.6659043, -0.721766, -1.794556, 0.5294118, 1, 0, 1,
-0.6633615, 0.2293934, -1.134385, 0.5254902, 1, 0, 1,
-0.6589311, 0.2082483, -1.773446, 0.5176471, 1, 0, 1,
-0.6586385, -1.797157, -1.70707, 0.5137255, 1, 0, 1,
-0.6568456, 1.183738, 0.3345965, 0.5058824, 1, 0, 1,
-0.6555756, -0.7164667, -3.118118, 0.5019608, 1, 0, 1,
-0.6518498, 0.506213, 0.4985034, 0.4941176, 1, 0, 1,
-0.6511356, 0.3365754, 0.8388866, 0.4862745, 1, 0, 1,
-0.6479816, 1.200739, -1.007765, 0.4823529, 1, 0, 1,
-0.6416402, 1.907379, -0.3572773, 0.4745098, 1, 0, 1,
-0.6364318, 2.038857, -0.06290315, 0.4705882, 1, 0, 1,
-0.636365, 0.9531672, -0.9579767, 0.4627451, 1, 0, 1,
-0.6334203, -0.5046646, -0.3514808, 0.4588235, 1, 0, 1,
-0.6297135, 2.061308, -0.5200915, 0.4509804, 1, 0, 1,
-0.6295797, -1.147399, -3.160915, 0.4470588, 1, 0, 1,
-0.6274387, -0.555594, -2.057407, 0.4392157, 1, 0, 1,
-0.6273735, -0.04099314, -0.9424069, 0.4352941, 1, 0, 1,
-0.6270994, 2.770237, -2.2357, 0.427451, 1, 0, 1,
-0.6221505, -0.1767777, -0.141081, 0.4235294, 1, 0, 1,
-0.6173432, 1.028472, -2.086393, 0.4156863, 1, 0, 1,
-0.6071407, -0.9876108, -1.085226, 0.4117647, 1, 0, 1,
-0.6071137, -1.513949, -3.070663, 0.4039216, 1, 0, 1,
-0.6049893, 0.5857896, 1.574442, 0.3960784, 1, 0, 1,
-0.6006011, 0.0671431, -0.8280772, 0.3921569, 1, 0, 1,
-0.5977998, -0.3317378, -1.324323, 0.3843137, 1, 0, 1,
-0.5921013, 0.3154662, -2.265783, 0.3803922, 1, 0, 1,
-0.586359, 0.127111, -0.2738238, 0.372549, 1, 0, 1,
-0.5843303, 0.534344, -0.7186252, 0.3686275, 1, 0, 1,
-0.583433, -1.024896, -3.033948, 0.3607843, 1, 0, 1,
-0.5799851, 0.7792619, -1.646495, 0.3568628, 1, 0, 1,
-0.5791615, 0.5217484, -0.5108863, 0.3490196, 1, 0, 1,
-0.575887, 0.4630032, 2.09999, 0.345098, 1, 0, 1,
-0.5744634, 0.9737496, 0.09394367, 0.3372549, 1, 0, 1,
-0.5728508, -0.1520504, -1.773194, 0.3333333, 1, 0, 1,
-0.5728249, 0.7154229, -1.317952, 0.3254902, 1, 0, 1,
-0.5726401, -0.696049, -3.727319, 0.3215686, 1, 0, 1,
-0.5653523, 0.9662378, 1.539619, 0.3137255, 1, 0, 1,
-0.5641409, -0.4402993, -3.643262, 0.3098039, 1, 0, 1,
-0.5547699, 1.999105, -0.2106896, 0.3019608, 1, 0, 1,
-0.5529242, -1.439358, -2.960607, 0.2941177, 1, 0, 1,
-0.5495733, -0.3265647, -1.615378, 0.2901961, 1, 0, 1,
-0.5478273, 1.576082, 0.04638001, 0.282353, 1, 0, 1,
-0.5440074, -0.3594937, -1.442957, 0.2784314, 1, 0, 1,
-0.5426933, -0.6234125, -2.186492, 0.2705882, 1, 0, 1,
-0.5404878, -0.4009026, -0.6869323, 0.2666667, 1, 0, 1,
-0.5366636, 1.81734, -0.8380117, 0.2588235, 1, 0, 1,
-0.5365979, -1.954006, -3.903011, 0.254902, 1, 0, 1,
-0.5359427, 0.7284213, -0.312292, 0.2470588, 1, 0, 1,
-0.5314947, 1.280559, -0.9562074, 0.2431373, 1, 0, 1,
-0.5295552, -0.1037105, -0.321844, 0.2352941, 1, 0, 1,
-0.5294449, -0.008393371, -3.386615, 0.2313726, 1, 0, 1,
-0.5291157, 1.413518, -2.507366, 0.2235294, 1, 0, 1,
-0.5282826, -1.999789, -2.513838, 0.2196078, 1, 0, 1,
-0.5278689, -0.03086375, -1.417791, 0.2117647, 1, 0, 1,
-0.5264609, 1.231295, -0.8255814, 0.2078431, 1, 0, 1,
-0.5242419, -0.1627755, -0.4093033, 0.2, 1, 0, 1,
-0.5224198, 1.556682, 1.189821, 0.1921569, 1, 0, 1,
-0.5218253, 0.225059, -0.1544857, 0.1882353, 1, 0, 1,
-0.5191165, -0.5756026, -4.627319, 0.1803922, 1, 0, 1,
-0.518535, -0.8363132, -2.962421, 0.1764706, 1, 0, 1,
-0.5160386, -0.4445377, -2.045519, 0.1686275, 1, 0, 1,
-0.5145112, -0.6782969, -4.248889, 0.1647059, 1, 0, 1,
-0.5137985, 1.03678, 0.5840722, 0.1568628, 1, 0, 1,
-0.5133415, 0.4616395, -2.170003, 0.1529412, 1, 0, 1,
-0.5102267, -0.06871783, -2.405849, 0.145098, 1, 0, 1,
-0.5092323, 0.4638813, -2.341042, 0.1411765, 1, 0, 1,
-0.5023472, -0.9246861, -4.826005, 0.1333333, 1, 0, 1,
-0.4999624, 0.3637291, -0.8112699, 0.1294118, 1, 0, 1,
-0.4994313, -1.705859, -1.686272, 0.1215686, 1, 0, 1,
-0.4873355, -0.9519632, -2.462925, 0.1176471, 1, 0, 1,
-0.4863712, 0.317838, -1.004098, 0.1098039, 1, 0, 1,
-0.4789945, -0.02928603, -0.4387364, 0.1058824, 1, 0, 1,
-0.4748743, -0.9019429, -4.356374, 0.09803922, 1, 0, 1,
-0.4735538, 1.347642, 1.55391, 0.09019608, 1, 0, 1,
-0.4722107, 0.9237813, -0.8389333, 0.08627451, 1, 0, 1,
-0.4664523, -1.143921, -2.190683, 0.07843138, 1, 0, 1,
-0.4649762, 0.4167711, 0.4432854, 0.07450981, 1, 0, 1,
-0.4618387, -0.1234543, -1.79091, 0.06666667, 1, 0, 1,
-0.4578301, 0.6665446, 0.2824613, 0.0627451, 1, 0, 1,
-0.4527746, 1.558867, 0.9322619, 0.05490196, 1, 0, 1,
-0.4468568, 0.7226524, -0.9850093, 0.05098039, 1, 0, 1,
-0.4416868, -1.229443, -3.444246, 0.04313726, 1, 0, 1,
-0.4326254, 0.987165, -0.2864972, 0.03921569, 1, 0, 1,
-0.4319024, -0.7716746, -3.894461, 0.03137255, 1, 0, 1,
-0.4312981, 0.4878559, -1.123631, 0.02745098, 1, 0, 1,
-0.4295842, -1.030745, -4.109544, 0.01960784, 1, 0, 1,
-0.4294368, 0.006135117, -1.540504, 0.01568628, 1, 0, 1,
-0.4285421, -0.07577712, 0.9223076, 0.007843138, 1, 0, 1,
-0.4252138, 1.489303, -2.028786, 0.003921569, 1, 0, 1,
-0.4245103, 0.2525666, 0.2684273, 0, 1, 0.003921569, 1,
-0.422764, 0.671497, -2.703428, 0, 1, 0.01176471, 1,
-0.4157623, 2.984066, 0.07622444, 0, 1, 0.01568628, 1,
-0.4075536, 0.3611834, -1.127474, 0, 1, 0.02352941, 1,
-0.4065126, -1.258693, -2.624943, 0, 1, 0.02745098, 1,
-0.4043498, -0.7969944, -5.652177, 0, 1, 0.03529412, 1,
-0.4000144, -0.3096297, -0.2808299, 0, 1, 0.03921569, 1,
-0.3978592, 1.264883, 0.3904127, 0, 1, 0.04705882, 1,
-0.3961495, -2.08664, -3.992411, 0, 1, 0.05098039, 1,
-0.3912596, -2.701293, -2.321463, 0, 1, 0.05882353, 1,
-0.3900255, -1.280264, -2.104022, 0, 1, 0.0627451, 1,
-0.3880272, 1.047768, -0.1220767, 0, 1, 0.07058824, 1,
-0.386839, -0.5248701, -3.114743, 0, 1, 0.07450981, 1,
-0.3856161, -1.611893, -1.354661, 0, 1, 0.08235294, 1,
-0.3837431, -2.706064, -3.560101, 0, 1, 0.08627451, 1,
-0.3837206, -1.253765, -2.24567, 0, 1, 0.09411765, 1,
-0.3792591, -0.5053184, -1.767372, 0, 1, 0.1019608, 1,
-0.3767714, 1.022783, 0.3314198, 0, 1, 0.1058824, 1,
-0.3754459, 1.357048, -0.6406512, 0, 1, 0.1137255, 1,
-0.3643221, 0.7365645, -0.4191957, 0, 1, 0.1176471, 1,
-0.3621641, -0.612541, -2.950353, 0, 1, 0.1254902, 1,
-0.3600013, 1.295436, 1.165247, 0, 1, 0.1294118, 1,
-0.3561283, -2.181399, -4.422743, 0, 1, 0.1372549, 1,
-0.3510692, -0.714402, -1.693013, 0, 1, 0.1411765, 1,
-0.3487276, -0.6508454, -2.590683, 0, 1, 0.1490196, 1,
-0.3478396, 0.02352376, -1.726707, 0, 1, 0.1529412, 1,
-0.3457614, -0.3427515, -0.9531136, 0, 1, 0.1607843, 1,
-0.3409782, -0.09862049, -1.970914, 0, 1, 0.1647059, 1,
-0.3353277, -1.269263, -4.417369, 0, 1, 0.172549, 1,
-0.3296273, -0.9974834, -3.416259, 0, 1, 0.1764706, 1,
-0.3254057, 0.6467866, -1.552695, 0, 1, 0.1843137, 1,
-0.3184667, -1.13989, -2.741268, 0, 1, 0.1882353, 1,
-0.3165096, -0.1268082, -1.550243, 0, 1, 0.1960784, 1,
-0.3120702, 0.8417844, -1.187462, 0, 1, 0.2039216, 1,
-0.306071, -0.02992279, -1.344043, 0, 1, 0.2078431, 1,
-0.3052268, 1.160339, -0.9027238, 0, 1, 0.2156863, 1,
-0.3018053, -0.6369462, -1.944506, 0, 1, 0.2196078, 1,
-0.2925233, 0.1670811, -1.115183, 0, 1, 0.227451, 1,
-0.2900304, -0.8313103, -2.854253, 0, 1, 0.2313726, 1,
-0.2896534, 0.4430024, -0.4365563, 0, 1, 0.2392157, 1,
-0.2890848, 0.1263651, -1.175258, 0, 1, 0.2431373, 1,
-0.2880005, -0.5696384, -2.123431, 0, 1, 0.2509804, 1,
-0.2874758, 1.057284, 0.003686198, 0, 1, 0.254902, 1,
-0.286956, -0.06254628, -1.827314, 0, 1, 0.2627451, 1,
-0.2858902, 0.3267611, -2.865615, 0, 1, 0.2666667, 1,
-0.2846932, 0.8227726, -0.75673, 0, 1, 0.2745098, 1,
-0.2839891, -0.8242275, -2.339434, 0, 1, 0.2784314, 1,
-0.2839125, 0.0416019, -0.7122743, 0, 1, 0.2862745, 1,
-0.2805959, 0.6491822, 0.5449157, 0, 1, 0.2901961, 1,
-0.2796993, 2.074445, -0.223536, 0, 1, 0.2980392, 1,
-0.277355, 0.7763534, -0.332947, 0, 1, 0.3058824, 1,
-0.2768947, -1.611463, -2.836773, 0, 1, 0.3098039, 1,
-0.2719235, -0.7462762, -2.452962, 0, 1, 0.3176471, 1,
-0.2711384, 0.460988, 0.553112, 0, 1, 0.3215686, 1,
-0.2711149, 0.3486152, -0.2655963, 0, 1, 0.3294118, 1,
-0.2666759, -0.2557615, -2.12412, 0, 1, 0.3333333, 1,
-0.2661537, 0.7216076, -2.83258, 0, 1, 0.3411765, 1,
-0.2633574, -0.299046, -2.667621, 0, 1, 0.345098, 1,
-0.2575099, -0.4760491, -2.232129, 0, 1, 0.3529412, 1,
-0.2512912, 1.050967, 0.1040952, 0, 1, 0.3568628, 1,
-0.2496013, 1.215367, -2.125447, 0, 1, 0.3647059, 1,
-0.2447773, 1.013468, -0.8913378, 0, 1, 0.3686275, 1,
-0.2412193, -0.1332156, -1.962507, 0, 1, 0.3764706, 1,
-0.239941, -0.4668474, -1.51048, 0, 1, 0.3803922, 1,
-0.2344716, -1.685175, -3.423957, 0, 1, 0.3882353, 1,
-0.2331478, -0.02918432, 0.8013897, 0, 1, 0.3921569, 1,
-0.2313628, -0.1846816, -2.970671, 0, 1, 0.4, 1,
-0.2165601, -1.075943, -3.626046, 0, 1, 0.4078431, 1,
-0.2158163, 0.7850583, -0.08578478, 0, 1, 0.4117647, 1,
-0.2126534, 0.3666265, -0.5259749, 0, 1, 0.4196078, 1,
-0.2122515, 1.83413, 0.4105852, 0, 1, 0.4235294, 1,
-0.2110434, 2.407469, -0.8402829, 0, 1, 0.4313726, 1,
-0.2109593, 1.432177, 0.6086292, 0, 1, 0.4352941, 1,
-0.2076932, -1.131485, -3.654465, 0, 1, 0.4431373, 1,
-0.2060117, 1.21704, -0.3077836, 0, 1, 0.4470588, 1,
-0.204894, -0.008577256, -2.512328, 0, 1, 0.454902, 1,
-0.2013831, 0.6742424, 0.7032253, 0, 1, 0.4588235, 1,
-0.199992, -0.418367, -2.984987, 0, 1, 0.4666667, 1,
-0.1993923, 2.069435, -0.7825602, 0, 1, 0.4705882, 1,
-0.1873365, 0.410504, -1.161849, 0, 1, 0.4784314, 1,
-0.1812918, 0.1789143, 0.2057697, 0, 1, 0.4823529, 1,
-0.1809277, -0.8247395, -3.183388, 0, 1, 0.4901961, 1,
-0.1766952, 1.201023, 0.678459, 0, 1, 0.4941176, 1,
-0.1761719, -0.2199659, -4.572339, 0, 1, 0.5019608, 1,
-0.1747656, -0.1541493, -3.451651, 0, 1, 0.509804, 1,
-0.1743069, -0.7403329, -2.136634, 0, 1, 0.5137255, 1,
-0.1686774, -0.7520255, -3.546408, 0, 1, 0.5215687, 1,
-0.1666624, -0.3905377, -3.090663, 0, 1, 0.5254902, 1,
-0.1628262, 1.660263, 0.3446565, 0, 1, 0.5333334, 1,
-0.162473, -0.1888354, -2.63574, 0, 1, 0.5372549, 1,
-0.1616836, -0.6744285, -2.145786, 0, 1, 0.5450981, 1,
-0.1606001, 0.4229874, -1.76566, 0, 1, 0.5490196, 1,
-0.1542246, -0.04156241, -3.591875, 0, 1, 0.5568628, 1,
-0.1490481, -1.041946, -2.123026, 0, 1, 0.5607843, 1,
-0.1476097, 0.05303118, -0.6483426, 0, 1, 0.5686275, 1,
-0.1469508, 0.1272928, 0.1169128, 0, 1, 0.572549, 1,
-0.1463142, -1.663834, -2.723924, 0, 1, 0.5803922, 1,
-0.1444737, 0.01302186, -2.322396, 0, 1, 0.5843138, 1,
-0.1440473, 0.1340252, -2.466774, 0, 1, 0.5921569, 1,
-0.1359165, 1.078958, 1.960257, 0, 1, 0.5960785, 1,
-0.133171, -0.8059424, -2.067755, 0, 1, 0.6039216, 1,
-0.1324872, -0.9233414, -2.152019, 0, 1, 0.6117647, 1,
-0.1266171, -2.096751, -1.760884, 0, 1, 0.6156863, 1,
-0.1252881, -0.04898072, -2.23154, 0, 1, 0.6235294, 1,
-0.1219972, -0.0959055, -3.649539, 0, 1, 0.627451, 1,
-0.1184719, -0.1215595, -2.506165, 0, 1, 0.6352941, 1,
-0.1179751, -0.9348539, -4.389043, 0, 1, 0.6392157, 1,
-0.11504, -0.4300891, -4.985065, 0, 1, 0.6470588, 1,
-0.1145283, -0.192878, -3.935696, 0, 1, 0.6509804, 1,
-0.1135024, 1.984279, 0.9034149, 0, 1, 0.6588235, 1,
-0.1110689, 0.7892904, 0.7360257, 0, 1, 0.6627451, 1,
-0.1106464, -0.8855622, -3.172645, 0, 1, 0.6705883, 1,
-0.1102424, 0.4713046, 0.8702552, 0, 1, 0.6745098, 1,
-0.1085371, -0.9632354, -3.519812, 0, 1, 0.682353, 1,
-0.1074426, -0.5028827, -4.882119, 0, 1, 0.6862745, 1,
-0.1060575, 0.5342546, 0.170701, 0, 1, 0.6941177, 1,
-0.1058715, 0.2975567, -0.3246023, 0, 1, 0.7019608, 1,
-0.09886815, 0.02954919, -1.06785, 0, 1, 0.7058824, 1,
-0.09391698, -1.069396, -2.609661, 0, 1, 0.7137255, 1,
-0.09342979, -0.2123721, -4.976993, 0, 1, 0.7176471, 1,
-0.09330213, -0.7757729, -3.295592, 0, 1, 0.7254902, 1,
-0.09255216, -0.5361636, -1.90111, 0, 1, 0.7294118, 1,
-0.09094469, -0.0886251, -2.060903, 0, 1, 0.7372549, 1,
-0.08910314, 0.2535901, -1.070211, 0, 1, 0.7411765, 1,
-0.08885643, -0.8947475, -2.745832, 0, 1, 0.7490196, 1,
-0.08689296, 1.237617, 0.1879935, 0, 1, 0.7529412, 1,
-0.08067616, 0.9774737, 0.2838682, 0, 1, 0.7607843, 1,
-0.07986605, -1.235812, -1.91387, 0, 1, 0.7647059, 1,
-0.07199246, 1.103762, 1.236503, 0, 1, 0.772549, 1,
-0.06603679, 0.666189, -0.9579438, 0, 1, 0.7764706, 1,
-0.06537673, -0.1665539, -3.544107, 0, 1, 0.7843137, 1,
-0.0646906, -0.3615638, -3.793908, 0, 1, 0.7882353, 1,
-0.06074914, 0.5966058, -0.2602091, 0, 1, 0.7960784, 1,
-0.05963931, 0.02523447, -0.6229113, 0, 1, 0.8039216, 1,
-0.05560718, -0.5493174, -2.443224, 0, 1, 0.8078431, 1,
-0.05492251, -0.04459993, -0.7459412, 0, 1, 0.8156863, 1,
-0.05421994, -0.08735422, -1.908446, 0, 1, 0.8196079, 1,
-0.05185026, -0.9540114, -2.151467, 0, 1, 0.827451, 1,
-0.05127842, 0.7923965, -0.8114001, 0, 1, 0.8313726, 1,
-0.05063139, -0.5969009, -4.596416, 0, 1, 0.8392157, 1,
-0.04094468, 1.615375, 1.523733, 0, 1, 0.8431373, 1,
-0.03567685, -1.243201, -2.212372, 0, 1, 0.8509804, 1,
-0.03023328, -0.6519088, -2.194656, 0, 1, 0.854902, 1,
-0.02051293, -2.098869, -3.465067, 0, 1, 0.8627451, 1,
-0.01061009, 2.184681, 1.017978, 0, 1, 0.8666667, 1,
-0.005944529, -0.4030725, -1.991825, 0, 1, 0.8745098, 1,
-0.003227431, -0.0001744026, 0.3198221, 0, 1, 0.8784314, 1,
-0.001998593, -0.5356602, -1.781564, 0, 1, 0.8862745, 1,
0.001549536, -0.9054013, 4.5747, 0, 1, 0.8901961, 1,
0.004955576, -0.6573868, 2.916748, 0, 1, 0.8980392, 1,
0.006064643, 0.9183977, -0.5916656, 0, 1, 0.9058824, 1,
0.006744063, -0.9295816, 2.811556, 0, 1, 0.9098039, 1,
0.01043817, 2.081527, -0.1243476, 0, 1, 0.9176471, 1,
0.01067716, -0.3843204, 3.585979, 0, 1, 0.9215686, 1,
0.01122811, 0.3969435, 1.618222, 0, 1, 0.9294118, 1,
0.01375511, 1.364198, 0.5029498, 0, 1, 0.9333333, 1,
0.01606939, -0.02264243, 3.813658, 0, 1, 0.9411765, 1,
0.0173524, 0.8125576, -0.3087876, 0, 1, 0.945098, 1,
0.02152448, -0.3300352, 3.878882, 0, 1, 0.9529412, 1,
0.02377797, -0.1818323, 4.645729, 0, 1, 0.9568627, 1,
0.02477817, 0.3255721, 0.6739519, 0, 1, 0.9647059, 1,
0.02754999, 2.485097, -0.4661481, 0, 1, 0.9686275, 1,
0.02859564, 0.09225153, -0.02023023, 0, 1, 0.9764706, 1,
0.03304156, 0.1234543, 0.5883961, 0, 1, 0.9803922, 1,
0.03430037, 0.1499594, -1.145522, 0, 1, 0.9882353, 1,
0.03720041, -2.365033, 1.619759, 0, 1, 0.9921569, 1,
0.03785131, 0.9673852, 0.4527876, 0, 1, 1, 1,
0.0387373, -0.6099408, 2.307668, 0, 0.9921569, 1, 1,
0.04207718, 0.6231843, -0.0294858, 0, 0.9882353, 1, 1,
0.04280269, -0.3617046, 0.9972641, 0, 0.9803922, 1, 1,
0.04534353, -1.296085, 2.423676, 0, 0.9764706, 1, 1,
0.04785459, 1.348619, -2.091208, 0, 0.9686275, 1, 1,
0.05340079, -1.624221, 4.196589, 0, 0.9647059, 1, 1,
0.05484124, 0.2272245, -0.1176249, 0, 0.9568627, 1, 1,
0.05509208, -0.2259314, 2.73657, 0, 0.9529412, 1, 1,
0.05646389, -1.349962, 3.252481, 0, 0.945098, 1, 1,
0.05916721, -0.5087646, 4.058451, 0, 0.9411765, 1, 1,
0.0621489, 0.6223494, -1.183816, 0, 0.9333333, 1, 1,
0.06245873, 1.696048, 1.096877, 0, 0.9294118, 1, 1,
0.06362541, 1.052284, -2.041641, 0, 0.9215686, 1, 1,
0.0646661, -0.4660972, 3.251153, 0, 0.9176471, 1, 1,
0.07590833, 0.2340901, -1.283934, 0, 0.9098039, 1, 1,
0.07594311, 1.988344, 1.167631, 0, 0.9058824, 1, 1,
0.07796098, 0.1850621, 1.242266, 0, 0.8980392, 1, 1,
0.07957768, 0.4597175, 0.5191554, 0, 0.8901961, 1, 1,
0.08209991, 0.6856709, -0.4410875, 0, 0.8862745, 1, 1,
0.08299974, 1.114339, 0.6575187, 0, 0.8784314, 1, 1,
0.08893789, -0.6279671, 2.423139, 0, 0.8745098, 1, 1,
0.09214108, -0.8309577, 0.6635191, 0, 0.8666667, 1, 1,
0.09565729, -0.8330461, 2.875078, 0, 0.8627451, 1, 1,
0.09635643, -1.294481, 3.969456, 0, 0.854902, 1, 1,
0.1012123, 1.384642, -0.1337078, 0, 0.8509804, 1, 1,
0.1030229, -1.470662, 2.253091, 0, 0.8431373, 1, 1,
0.1032908, -0.6050152, 1.538652, 0, 0.8392157, 1, 1,
0.1089693, 0.4750721, 0.2751599, 0, 0.8313726, 1, 1,
0.1092412, 0.3365059, -0.1558037, 0, 0.827451, 1, 1,
0.1098443, -0.0696611, 3.467649, 0, 0.8196079, 1, 1,
0.1117457, 0.6984218, -1.104308, 0, 0.8156863, 1, 1,
0.1118478, 2.157705, 0.6190339, 0, 0.8078431, 1, 1,
0.1124559, -0.1222649, 2.862203, 0, 0.8039216, 1, 1,
0.1127112, -1.000236, 1.621405, 0, 0.7960784, 1, 1,
0.113932, -0.7228632, 1.58443, 0, 0.7882353, 1, 1,
0.1153721, 0.8792151, 0.363845, 0, 0.7843137, 1, 1,
0.1226259, 1.146575, 0.2974258, 0, 0.7764706, 1, 1,
0.1242058, 0.1712684, -0.5187019, 0, 0.772549, 1, 1,
0.1244551, 0.09426845, 2.781537, 0, 0.7647059, 1, 1,
0.124854, -1.151667, 3.583385, 0, 0.7607843, 1, 1,
0.1316711, 1.622119, 1.060337, 0, 0.7529412, 1, 1,
0.1322809, -1.768991, 4.025522, 0, 0.7490196, 1, 1,
0.1341978, 0.4871291, 0.979943, 0, 0.7411765, 1, 1,
0.1375317, -2.451933, 2.521392, 0, 0.7372549, 1, 1,
0.137965, 0.3957498, 1.428572, 0, 0.7294118, 1, 1,
0.1386118, -0.6347336, 2.440383, 0, 0.7254902, 1, 1,
0.1414904, 0.759686, -0.2487671, 0, 0.7176471, 1, 1,
0.1423597, 0.05602673, 1.311915, 0, 0.7137255, 1, 1,
0.1452242, 0.639194, 0.7365989, 0, 0.7058824, 1, 1,
0.145748, -1.053696, 4.952332, 0, 0.6980392, 1, 1,
0.1458644, -0.2097852, 2.562999, 0, 0.6941177, 1, 1,
0.1516786, 0.4473074, -1.342289, 0, 0.6862745, 1, 1,
0.1537779, -1.151722, 3.548691, 0, 0.682353, 1, 1,
0.158803, 0.06113531, 2.3991, 0, 0.6745098, 1, 1,
0.1616323, 0.4922348, 0.697984, 0, 0.6705883, 1, 1,
0.1621678, -0.2235368, 2.274726, 0, 0.6627451, 1, 1,
0.1640484, 1.038014, -0.1931233, 0, 0.6588235, 1, 1,
0.1663045, -0.06403561, -1.977988, 0, 0.6509804, 1, 1,
0.1739104, 1.673253, 0.6116735, 0, 0.6470588, 1, 1,
0.1748291, 1.339377, 0.02228983, 0, 0.6392157, 1, 1,
0.1792801, -0.9330787, 5.066133, 0, 0.6352941, 1, 1,
0.180291, 0.4680574, -0.2815758, 0, 0.627451, 1, 1,
0.1817823, 1.496053, 0.8827152, 0, 0.6235294, 1, 1,
0.1845181, -1.108756, 1.525778, 0, 0.6156863, 1, 1,
0.1848825, -1.045409, 1.478405, 0, 0.6117647, 1, 1,
0.1902176, 0.6975683, 1.186443, 0, 0.6039216, 1, 1,
0.1958618, -2.072075, 2.385585, 0, 0.5960785, 1, 1,
0.1986667, -0.01083914, 0.5399408, 0, 0.5921569, 1, 1,
0.2004556, 0.8687648, 2.398493, 0, 0.5843138, 1, 1,
0.2017795, 0.2173783, 0.426836, 0, 0.5803922, 1, 1,
0.2056481, -1.732004, 4.159127, 0, 0.572549, 1, 1,
0.2069471, 0.3124154, 1.238111, 0, 0.5686275, 1, 1,
0.2074917, -0.9326671, 0.8853942, 0, 0.5607843, 1, 1,
0.2121414, -0.06994113, 0.2811426, 0, 0.5568628, 1, 1,
0.212774, 0.8351333, 0.1683272, 0, 0.5490196, 1, 1,
0.2156021, 1.038311, -1.477537, 0, 0.5450981, 1, 1,
0.2184027, -0.4558293, 3.984353, 0, 0.5372549, 1, 1,
0.2230998, 0.5687367, 1.374933, 0, 0.5333334, 1, 1,
0.2290135, 2.112582, 2.26038, 0, 0.5254902, 1, 1,
0.2416256, -0.7771596, 2.874233, 0, 0.5215687, 1, 1,
0.242811, 0.2669484, -2.137781, 0, 0.5137255, 1, 1,
0.2496711, -0.2507057, 1.346028, 0, 0.509804, 1, 1,
0.255212, 0.1606112, 0.1491914, 0, 0.5019608, 1, 1,
0.2558272, -0.3944183, 1.403322, 0, 0.4941176, 1, 1,
0.2567558, -0.8317457, 2.205288, 0, 0.4901961, 1, 1,
0.2578909, -3.180216, 4.47448, 0, 0.4823529, 1, 1,
0.2603469, 1.536872, -0.3560029, 0, 0.4784314, 1, 1,
0.2617823, 1.667788, -2.049363, 0, 0.4705882, 1, 1,
0.2631121, 0.5660868, -0.4326955, 0, 0.4666667, 1, 1,
0.2635931, 1.279533, 0.8086239, 0, 0.4588235, 1, 1,
0.2640232, -1.090125, 2.722784, 0, 0.454902, 1, 1,
0.2667185, 1.307624, -0.9815295, 0, 0.4470588, 1, 1,
0.2704769, 0.3930524, 0.344331, 0, 0.4431373, 1, 1,
0.27403, 0.8133087, 0.815246, 0, 0.4352941, 1, 1,
0.2764172, 1.415377, 0.7447082, 0, 0.4313726, 1, 1,
0.2840854, -2.134346, 3.357696, 0, 0.4235294, 1, 1,
0.2855791, 0.5756778, 1.648832, 0, 0.4196078, 1, 1,
0.2865105, -0.9534056, 2.720954, 0, 0.4117647, 1, 1,
0.2897627, 0.75165, 0.1975145, 0, 0.4078431, 1, 1,
0.2898965, 0.9280619, 0.550432, 0, 0.4, 1, 1,
0.2916985, -0.0594648, 2.410702, 0, 0.3921569, 1, 1,
0.2963507, 0.754316, 1.458148, 0, 0.3882353, 1, 1,
0.2977751, 0.9179136, 0.9583789, 0, 0.3803922, 1, 1,
0.2987052, 0.5594419, -0.1354465, 0, 0.3764706, 1, 1,
0.3024734, 0.5504902, 1.322938, 0, 0.3686275, 1, 1,
0.3087907, -0.9133248, 3.720763, 0, 0.3647059, 1, 1,
0.322379, 0.4641976, 1.194114, 0, 0.3568628, 1, 1,
0.3246897, 0.3980187, -1.318148, 0, 0.3529412, 1, 1,
0.3294634, 1.372213, -0.1435205, 0, 0.345098, 1, 1,
0.3329704, 1.208848, -0.2881609, 0, 0.3411765, 1, 1,
0.3339942, -2.058739, 4.86332, 0, 0.3333333, 1, 1,
0.3372622, 0.3238663, 0.3374245, 0, 0.3294118, 1, 1,
0.3377143, -0.06992674, 1.692548, 0, 0.3215686, 1, 1,
0.3455284, -0.6993804, 4.285882, 0, 0.3176471, 1, 1,
0.3474934, -2.306776, 2.171273, 0, 0.3098039, 1, 1,
0.3518966, 2.432456, 0.715581, 0, 0.3058824, 1, 1,
0.3643422, 1.460253, 1.106964, 0, 0.2980392, 1, 1,
0.3697183, 0.1114481, 1.411582, 0, 0.2901961, 1, 1,
0.3713662, -0.317345, 2.464906, 0, 0.2862745, 1, 1,
0.3815371, 0.7101036, -2.305909, 0, 0.2784314, 1, 1,
0.384268, 1.48919, 0.2423139, 0, 0.2745098, 1, 1,
0.3874238, -0.860527, 1.967687, 0, 0.2666667, 1, 1,
0.3875648, -1.090472, 2.016342, 0, 0.2627451, 1, 1,
0.3899621, 0.03302656, 2.21336, 0, 0.254902, 1, 1,
0.3901333, 0.9697408, -0.2969556, 0, 0.2509804, 1, 1,
0.3901413, -1.669486, 0.1030412, 0, 0.2431373, 1, 1,
0.3934262, -0.4101514, 2.676396, 0, 0.2392157, 1, 1,
0.401378, -1.127981, 3.02856, 0, 0.2313726, 1, 1,
0.4015717, -0.6356368, 3.325684, 0, 0.227451, 1, 1,
0.4067429, -0.8478823, 2.531167, 0, 0.2196078, 1, 1,
0.4072883, -0.04503502, 2.333781, 0, 0.2156863, 1, 1,
0.4077692, 0.07342956, 2.040564, 0, 0.2078431, 1, 1,
0.4128157, 0.9027955, -0.7999278, 0, 0.2039216, 1, 1,
0.4147025, -0.7675833, 1.686019, 0, 0.1960784, 1, 1,
0.4151525, 1.242613, 0.8266451, 0, 0.1882353, 1, 1,
0.4181741, 0.1711987, -1.092415, 0, 0.1843137, 1, 1,
0.4184731, -0.9636703, 2.94031, 0, 0.1764706, 1, 1,
0.4214869, -0.02176309, 1.160148, 0, 0.172549, 1, 1,
0.4285137, -0.6872947, 1.824343, 0, 0.1647059, 1, 1,
0.4291686, -0.4602171, 2.810053, 0, 0.1607843, 1, 1,
0.4313922, 0.3360685, 0.8855917, 0, 0.1529412, 1, 1,
0.4333687, -0.3767496, 1.601888, 0, 0.1490196, 1, 1,
0.4360621, -1.685075, 2.18444, 0, 0.1411765, 1, 1,
0.4374166, 0.9487232, 0.2963927, 0, 0.1372549, 1, 1,
0.4411106, -1.674938, 3.900801, 0, 0.1294118, 1, 1,
0.4419321, 0.7840446, 0.4609971, 0, 0.1254902, 1, 1,
0.4441257, -0.3819936, 3.027437, 0, 0.1176471, 1, 1,
0.4454996, 0.05338195, 2.624269, 0, 0.1137255, 1, 1,
0.4483441, -0.1532707, 1.006405, 0, 0.1058824, 1, 1,
0.4489543, -0.9143021, -0.2583832, 0, 0.09803922, 1, 1,
0.4503499, 0.2448581, 2.247098, 0, 0.09411765, 1, 1,
0.4528053, -0.5179276, 2.749979, 0, 0.08627451, 1, 1,
0.454056, -0.7491236, 2.06622, 0, 0.08235294, 1, 1,
0.4579643, 0.8603883, -0.2215125, 0, 0.07450981, 1, 1,
0.4649344, 0.6064459, 0.5011669, 0, 0.07058824, 1, 1,
0.473993, 1.286197, 1.640834, 0, 0.0627451, 1, 1,
0.4743674, -0.8192763, 2.043803, 0, 0.05882353, 1, 1,
0.4772789, -0.7666937, 3.94472, 0, 0.05098039, 1, 1,
0.4788411, -0.7146203, 3.636652, 0, 0.04705882, 1, 1,
0.4811368, 0.8134806, 2.347792, 0, 0.03921569, 1, 1,
0.4845685, -0.7565651, 2.581566, 0, 0.03529412, 1, 1,
0.4857402, 0.3980909, 1.44981, 0, 0.02745098, 1, 1,
0.4890606, -0.5064825, 1.096638, 0, 0.02352941, 1, 1,
0.4965036, -2.641762, 3.819406, 0, 0.01568628, 1, 1,
0.4989671, 1.857902, 1.1229, 0, 0.01176471, 1, 1,
0.5025116, 0.09023, 1.282944, 0, 0.003921569, 1, 1,
0.5074721, 0.4911853, -0.213595, 0.003921569, 0, 1, 1,
0.5141538, 0.1316208, 1.039221, 0.007843138, 0, 1, 1,
0.5182886, 0.3822525, 2.042605, 0.01568628, 0, 1, 1,
0.5183114, -1.511792, 3.251423, 0.01960784, 0, 1, 1,
0.5196972, 1.213698, 2.359088, 0.02745098, 0, 1, 1,
0.5216394, 0.7394194, -0.6852739, 0.03137255, 0, 1, 1,
0.525395, 0.8903205, 0.1650166, 0.03921569, 0, 1, 1,
0.5303903, 0.6458923, 0.9777307, 0.04313726, 0, 1, 1,
0.5340976, -0.4682798, 1.588068, 0.05098039, 0, 1, 1,
0.5342891, -0.1099724, -0.0906983, 0.05490196, 0, 1, 1,
0.5351324, -0.9872565, 3.888677, 0.0627451, 0, 1, 1,
0.5352899, 0.4664938, 0.5844543, 0.06666667, 0, 1, 1,
0.5360206, 0.6055782, 2.101785, 0.07450981, 0, 1, 1,
0.5374295, -0.8354666, 2.206661, 0.07843138, 0, 1, 1,
0.5375273, -0.9053642, 4.290881, 0.08627451, 0, 1, 1,
0.5396663, -0.7014235, 3.017733, 0.09019608, 0, 1, 1,
0.5399101, 0.6630262, 2.147415, 0.09803922, 0, 1, 1,
0.5439474, 0.4004091, 0.1084576, 0.1058824, 0, 1, 1,
0.5480162, 0.2203755, 1.530175, 0.1098039, 0, 1, 1,
0.5493774, 1.728181, 0.6931242, 0.1176471, 0, 1, 1,
0.5495548, -1.00389, 3.059527, 0.1215686, 0, 1, 1,
0.5507495, 0.6977473, 0.04501966, 0.1294118, 0, 1, 1,
0.5538589, 0.6132982, 1.864071, 0.1333333, 0, 1, 1,
0.5610179, -0.9222982, 2.048257, 0.1411765, 0, 1, 1,
0.561156, 0.4079091, -0.03926192, 0.145098, 0, 1, 1,
0.5625697, 1.823211, -2.421839, 0.1529412, 0, 1, 1,
0.5652066, -1.006945, 4.010544, 0.1568628, 0, 1, 1,
0.5684187, 0.5359819, 0.8251132, 0.1647059, 0, 1, 1,
0.5705289, 0.5083637, -0.08518174, 0.1686275, 0, 1, 1,
0.5791033, 0.7050031, 1.515872, 0.1764706, 0, 1, 1,
0.5845738, -1.856954, 3.853561, 0.1803922, 0, 1, 1,
0.5888297, 1.30394, -0.1695991, 0.1882353, 0, 1, 1,
0.5899058, -0.3843144, 1.338337, 0.1921569, 0, 1, 1,
0.5942269, 0.7591149, 1.256781, 0.2, 0, 1, 1,
0.5985194, -0.4807329, 2.128313, 0.2078431, 0, 1, 1,
0.5986915, 0.2008705, 1.313214, 0.2117647, 0, 1, 1,
0.6030793, -0.8439415, 2.130696, 0.2196078, 0, 1, 1,
0.6072065, 0.9219445, -0.0869805, 0.2235294, 0, 1, 1,
0.6094572, -0.9767987, 1.081759, 0.2313726, 0, 1, 1,
0.6097273, 1.093072, 1.643165, 0.2352941, 0, 1, 1,
0.610251, -1.153018, 2.097925, 0.2431373, 0, 1, 1,
0.6125582, 1.149906, -0.4300646, 0.2470588, 0, 1, 1,
0.6174174, -0.3754656, 1.907814, 0.254902, 0, 1, 1,
0.620617, 1.824706, 1.527243, 0.2588235, 0, 1, 1,
0.622172, -0.2470676, 3.203092, 0.2666667, 0, 1, 1,
0.6238376, -0.263429, 1.915577, 0.2705882, 0, 1, 1,
0.6271425, 0.2980321, 2.894701, 0.2784314, 0, 1, 1,
0.6303277, 0.01310716, 0.8460264, 0.282353, 0, 1, 1,
0.6306573, 0.25665, 1.086785, 0.2901961, 0, 1, 1,
0.6319653, 2.539188, 0.01897319, 0.2941177, 0, 1, 1,
0.6348339, -0.5479355, 3.245034, 0.3019608, 0, 1, 1,
0.636553, -0.7238456, 2.508659, 0.3098039, 0, 1, 1,
0.6365958, 0.8571585, 1.70315, 0.3137255, 0, 1, 1,
0.6366687, -1.159659, 3.93667, 0.3215686, 0, 1, 1,
0.6399364, 0.2373821, 1.870837, 0.3254902, 0, 1, 1,
0.6451986, 1.259709, 0.2314513, 0.3333333, 0, 1, 1,
0.6455919, -0.3785524, 2.493716, 0.3372549, 0, 1, 1,
0.649736, 0.2677886, 2.567135, 0.345098, 0, 1, 1,
0.6516533, 2.37394, 0.7896834, 0.3490196, 0, 1, 1,
0.6518995, 0.9201266, -0.1463847, 0.3568628, 0, 1, 1,
0.653329, 1.296997, 0.8659778, 0.3607843, 0, 1, 1,
0.6598651, 0.4857019, 0.06182856, 0.3686275, 0, 1, 1,
0.6601316, -0.7992815, 2.71611, 0.372549, 0, 1, 1,
0.6634371, 0.1633088, 0.7728798, 0.3803922, 0, 1, 1,
0.6650059, -1.373046, 4.638015, 0.3843137, 0, 1, 1,
0.6685795, 0.2247179, 0.9078814, 0.3921569, 0, 1, 1,
0.6695861, 0.07770356, 0.2986756, 0.3960784, 0, 1, 1,
0.6729427, 1.399064, 1.728066, 0.4039216, 0, 1, 1,
0.6774916, 0.201004, 0.4466993, 0.4117647, 0, 1, 1,
0.6809435, 0.9957641, 0.5830945, 0.4156863, 0, 1, 1,
0.6830898, -0.1817686, 2.387851, 0.4235294, 0, 1, 1,
0.6863785, 0.6292614, 2.014019, 0.427451, 0, 1, 1,
0.6869531, 0.1236174, 0.6040246, 0.4352941, 0, 1, 1,
0.6888726, -0.4234133, 1.735495, 0.4392157, 0, 1, 1,
0.6900297, -0.2502697, 3.865653, 0.4470588, 0, 1, 1,
0.6915002, -0.6456663, 1.597468, 0.4509804, 0, 1, 1,
0.6948491, 0.3897917, 1.919607, 0.4588235, 0, 1, 1,
0.6957779, 0.1673768, 0.3405218, 0.4627451, 0, 1, 1,
0.6963651, -1.162974, 2.619822, 0.4705882, 0, 1, 1,
0.6988726, -1.230156, 3.552466, 0.4745098, 0, 1, 1,
0.6993074, 0.6590169, 0.4282524, 0.4823529, 0, 1, 1,
0.7000433, -0.486918, 2.312236, 0.4862745, 0, 1, 1,
0.7005744, -0.1425981, 3.170788, 0.4941176, 0, 1, 1,
0.7039552, -0.8019189, 2.68038, 0.5019608, 0, 1, 1,
0.7069772, 0.3007021, 1.880625, 0.5058824, 0, 1, 1,
0.7073525, 0.08060037, 2.371886, 0.5137255, 0, 1, 1,
0.7114716, -2.045134, 5.271087, 0.5176471, 0, 1, 1,
0.7121799, -0.3879698, 2.29504, 0.5254902, 0, 1, 1,
0.7121899, -0.8422032, 2.48979, 0.5294118, 0, 1, 1,
0.7196456, 0.8888372, 0.9904063, 0.5372549, 0, 1, 1,
0.7279061, -0.0773728, 3.125677, 0.5411765, 0, 1, 1,
0.7331095, 0.7534419, -0.8856757, 0.5490196, 0, 1, 1,
0.7393742, -1.552508, 2.338396, 0.5529412, 0, 1, 1,
0.7449521, 1.830661, 2.560354, 0.5607843, 0, 1, 1,
0.7456177, 1.885631, 0.9621034, 0.5647059, 0, 1, 1,
0.7469468, 1.58637, 0.8455909, 0.572549, 0, 1, 1,
0.7549775, 0.1080048, 2.598852, 0.5764706, 0, 1, 1,
0.7556103, 1.689196, -1.459955, 0.5843138, 0, 1, 1,
0.7558052, -1.872367, 2.081421, 0.5882353, 0, 1, 1,
0.7564104, -0.08712604, 0.833805, 0.5960785, 0, 1, 1,
0.7600116, -1.071316, 2.447755, 0.6039216, 0, 1, 1,
0.7627718, -0.6468964, 3.03212, 0.6078432, 0, 1, 1,
0.763131, -0.3950724, 3.590077, 0.6156863, 0, 1, 1,
0.7714853, 0.6403668, 1.213608, 0.6196079, 0, 1, 1,
0.7730159, 0.9900325, 1.109425, 0.627451, 0, 1, 1,
0.7739437, 1.263741, 0.03835911, 0.6313726, 0, 1, 1,
0.7761505, 0.2903925, -0.7806565, 0.6392157, 0, 1, 1,
0.7816659, -0.5150257, 3.413282, 0.6431373, 0, 1, 1,
0.7837465, 1.623634, -1.617681, 0.6509804, 0, 1, 1,
0.7890702, -0.6087674, 0.6899937, 0.654902, 0, 1, 1,
0.7907341, 0.3361516, 0.7375405, 0.6627451, 0, 1, 1,
0.7938291, 0.2420937, 1.704218, 0.6666667, 0, 1, 1,
0.799055, -2.360236, 3.256222, 0.6745098, 0, 1, 1,
0.8026385, -0.393757, 1.221828, 0.6784314, 0, 1, 1,
0.8038504, 0.536667, 0.2377128, 0.6862745, 0, 1, 1,
0.8069503, 1.052734, 0.5057033, 0.6901961, 0, 1, 1,
0.8111879, 1.640432, 1.176261, 0.6980392, 0, 1, 1,
0.8114551, 0.6457443, 0.7685373, 0.7058824, 0, 1, 1,
0.8181699, 0.399153, -0.04016515, 0.7098039, 0, 1, 1,
0.8193145, -0.08465502, 3.237187, 0.7176471, 0, 1, 1,
0.8199949, 0.6646376, 1.43477, 0.7215686, 0, 1, 1,
0.8223473, 0.4101652, 0.9809748, 0.7294118, 0, 1, 1,
0.8226444, -0.3925427, 2.717672, 0.7333333, 0, 1, 1,
0.8235398, 0.4969033, 2.199947, 0.7411765, 0, 1, 1,
0.8265017, -0.0510899, 4.792068, 0.7450981, 0, 1, 1,
0.8279731, 2.01719, 0.8689097, 0.7529412, 0, 1, 1,
0.830998, 1.780451, 1.040617, 0.7568628, 0, 1, 1,
0.8332094, 0.7373406, 0.3730602, 0.7647059, 0, 1, 1,
0.8339695, 1.255011, -0.335571, 0.7686275, 0, 1, 1,
0.8342572, 1.542876, 1.197282, 0.7764706, 0, 1, 1,
0.8365325, 0.2293378, 1.332391, 0.7803922, 0, 1, 1,
0.8376778, 0.2782492, 1.245899, 0.7882353, 0, 1, 1,
0.8394654, -0.5466082, 3.235046, 0.7921569, 0, 1, 1,
0.8442484, 0.7711928, 1.592365, 0.8, 0, 1, 1,
0.846315, -0.4687194, 1.434582, 0.8078431, 0, 1, 1,
0.8479878, -0.2401826, 2.226373, 0.8117647, 0, 1, 1,
0.8509227, -2.997741, 5.034634, 0.8196079, 0, 1, 1,
0.8553168, -0.1183976, 2.252778, 0.8235294, 0, 1, 1,
0.8586448, -1.840176, 2.24767, 0.8313726, 0, 1, 1,
0.8594934, -0.8580328, 2.72564, 0.8352941, 0, 1, 1,
0.8606454, -0.01672491, 0.5111122, 0.8431373, 0, 1, 1,
0.8631036, -1.1535, 1.930078, 0.8470588, 0, 1, 1,
0.8664346, 0.1372616, 0.849878, 0.854902, 0, 1, 1,
0.8719279, -1.077069, 2.435458, 0.8588235, 0, 1, 1,
0.8823795, -0.9104908, 0.8551729, 0.8666667, 0, 1, 1,
0.8828431, -0.02291913, 0.456761, 0.8705882, 0, 1, 1,
0.8842155, 0.2710742, 0.4634093, 0.8784314, 0, 1, 1,
0.8864039, -0.8322998, 2.845881, 0.8823529, 0, 1, 1,
0.887482, 0.5366763, 1.328954, 0.8901961, 0, 1, 1,
0.8943281, -1.162133, 4.342957, 0.8941177, 0, 1, 1,
0.8947619, 0.1160049, 1.609452, 0.9019608, 0, 1, 1,
0.895153, 0.2834785, 1.586575, 0.9098039, 0, 1, 1,
0.898841, 0.2784521, 1.248529, 0.9137255, 0, 1, 1,
0.8997578, -0.3120106, 1.594014, 0.9215686, 0, 1, 1,
0.9103161, 0.6323905, 1.764918, 0.9254902, 0, 1, 1,
0.9112303, -0.5343794, 4.124387, 0.9333333, 0, 1, 1,
0.9135863, 0.4094463, 0.332472, 0.9372549, 0, 1, 1,
0.9151228, 0.05768186, 1.399684, 0.945098, 0, 1, 1,
0.9204302, 0.9432025, 2.245595, 0.9490196, 0, 1, 1,
0.9290804, 1.167495, 1.104468, 0.9568627, 0, 1, 1,
0.9382652, 0.2717446, -0.207864, 0.9607843, 0, 1, 1,
0.9441243, -0.1679748, 1.080991, 0.9686275, 0, 1, 1,
0.9472545, -0.2970122, 1.434186, 0.972549, 0, 1, 1,
0.9594603, 0.4018403, -0.543021, 0.9803922, 0, 1, 1,
0.9613286, 0.8113596, 0.4253809, 0.9843137, 0, 1, 1,
0.9654368, -1.537037, 0.3923846, 0.9921569, 0, 1, 1,
0.9684554, 0.3815546, 2.368856, 0.9960784, 0, 1, 1,
0.9725133, 0.6941456, -0.4766122, 1, 0, 0.9960784, 1,
0.9751399, 0.17043, 1.88616, 1, 0, 0.9882353, 1,
0.9807017, -1.55611, 4.157648, 1, 0, 0.9843137, 1,
0.9851046, -1.622645, 2.649953, 1, 0, 0.9764706, 1,
0.9893579, -0.253846, 2.33709, 1, 0, 0.972549, 1,
0.9932147, 0.4420542, -1.371708, 1, 0, 0.9647059, 1,
1.009098, 0.6094781, -0.6739478, 1, 0, 0.9607843, 1,
1.009671, 0.7033371, -0.4773899, 1, 0, 0.9529412, 1,
1.012124, -0.3032404, 1.313869, 1, 0, 0.9490196, 1,
1.016345, 0.5932547, -0.3135429, 1, 0, 0.9411765, 1,
1.018738, -1.374322, 2.516726, 1, 0, 0.9372549, 1,
1.018833, 0.4587137, 0.6680426, 1, 0, 0.9294118, 1,
1.01924, -0.4427564, 1.46476, 1, 0, 0.9254902, 1,
1.021823, 1.800771, -0.03749079, 1, 0, 0.9176471, 1,
1.028535, -0.7004143, 4.562429, 1, 0, 0.9137255, 1,
1.033185, 0.3226614, 2.029007, 1, 0, 0.9058824, 1,
1.038344, 1.404578, 0.34155, 1, 0, 0.9019608, 1,
1.041243, 1.376585, 0.2328467, 1, 0, 0.8941177, 1,
1.041708, -1.92134, 2.787573, 1, 0, 0.8862745, 1,
1.052497, -0.2938597, 0.7721463, 1, 0, 0.8823529, 1,
1.053766, -1.029424, 2.851503, 1, 0, 0.8745098, 1,
1.061127, 0.6993362, -0.2735096, 1, 0, 0.8705882, 1,
1.070477, -0.6353337, 1.135472, 1, 0, 0.8627451, 1,
1.071838, -1.877562, 2.246343, 1, 0, 0.8588235, 1,
1.07276, 0.6528215, -0.1388654, 1, 0, 0.8509804, 1,
1.073991, 1.897158, -0.5463938, 1, 0, 0.8470588, 1,
1.07453, -0.3650045, 0.3047392, 1, 0, 0.8392157, 1,
1.081002, -2.577131, 2.548727, 1, 0, 0.8352941, 1,
1.081903, -1.636939, 4.077996, 1, 0, 0.827451, 1,
1.086947, -0.8983777, 1.640681, 1, 0, 0.8235294, 1,
1.086992, -0.5253084, 3.035674, 1, 0, 0.8156863, 1,
1.088886, -1.763402, 2.123374, 1, 0, 0.8117647, 1,
1.093777, -0.9012578, 2.328749, 1, 0, 0.8039216, 1,
1.094834, -0.4173852, 2.284676, 1, 0, 0.7960784, 1,
1.103244, -0.506229, 1.96726, 1, 0, 0.7921569, 1,
1.107534, 0.3045471, 0.5973912, 1, 0, 0.7843137, 1,
1.110511, 0.1561715, 3.371882, 1, 0, 0.7803922, 1,
1.114048, -0.6930767, -0.7089179, 1, 0, 0.772549, 1,
1.119476, -1.447217, 1.676177, 1, 0, 0.7686275, 1,
1.126911, 0.03614824, 0.4147611, 1, 0, 0.7607843, 1,
1.138375, -1.374361, 3.065318, 1, 0, 0.7568628, 1,
1.144973, -0.2298951, 2.001904, 1, 0, 0.7490196, 1,
1.147545, -0.4740936, 2.366621, 1, 0, 0.7450981, 1,
1.159904, -1.746718, 1.990935, 1, 0, 0.7372549, 1,
1.160457, -1.225568, 3.854611, 1, 0, 0.7333333, 1,
1.163814, -0.05721881, 1.956834, 1, 0, 0.7254902, 1,
1.168571, -0.3762363, 2.734948, 1, 0, 0.7215686, 1,
1.17368, -0.3986026, 1.985632, 1, 0, 0.7137255, 1,
1.177976, -0.06090731, 3.947572, 1, 0, 0.7098039, 1,
1.179955, -0.001998894, -0.7950865, 1, 0, 0.7019608, 1,
1.181143, -0.4514641, 2.737928, 1, 0, 0.6941177, 1,
1.182347, -0.2666641, 0.2413684, 1, 0, 0.6901961, 1,
1.186985, 1.273051, 0.7399124, 1, 0, 0.682353, 1,
1.19978, 0.512119, 1.320962, 1, 0, 0.6784314, 1,
1.205917, -2.700953, 1.953238, 1, 0, 0.6705883, 1,
1.210562, -0.5402851, 1.556717, 1, 0, 0.6666667, 1,
1.211354, -0.1530892, 1.537676, 1, 0, 0.6588235, 1,
1.214593, 0.9728955, -0.243484, 1, 0, 0.654902, 1,
1.214731, -0.2302099, 1.694899, 1, 0, 0.6470588, 1,
1.220189, 1.858414, 1.068309, 1, 0, 0.6431373, 1,
1.220851, -0.3431756, 0.09366991, 1, 0, 0.6352941, 1,
1.224101, 1.072303, 0.8763174, 1, 0, 0.6313726, 1,
1.228708, 1.044577, 0.2065919, 1, 0, 0.6235294, 1,
1.243122, 0.3271628, 1.756955, 1, 0, 0.6196079, 1,
1.244863, 0.5116343, 1.770886, 1, 0, 0.6117647, 1,
1.246739, -1.42611, 4.297362, 1, 0, 0.6078432, 1,
1.252133, 0.8238893, 1.503868, 1, 0, 0.6, 1,
1.253419, -0.5553485, 1.709203, 1, 0, 0.5921569, 1,
1.25695, -0.8186712, 2.786981, 1, 0, 0.5882353, 1,
1.258845, 0.7274377, -0.2256927, 1, 0, 0.5803922, 1,
1.262638, -0.5081286, 2.25452, 1, 0, 0.5764706, 1,
1.26321, -0.2835196, 1.364317, 1, 0, 0.5686275, 1,
1.26323, 0.8737507, 0.07070313, 1, 0, 0.5647059, 1,
1.26801, -0.6696945, 1.057478, 1, 0, 0.5568628, 1,
1.271323, -0.8904589, 1.302292, 1, 0, 0.5529412, 1,
1.281034, 0.329901, 0.7212269, 1, 0, 0.5450981, 1,
1.282724, -0.3096045, 4.061469, 1, 0, 0.5411765, 1,
1.284253, 0.3007181, 0.1168218, 1, 0, 0.5333334, 1,
1.306996, -1.74953, 3.537968, 1, 0, 0.5294118, 1,
1.309468, -0.9327905, 1.874315, 1, 0, 0.5215687, 1,
1.325807, -0.3212011, 1.898848, 1, 0, 0.5176471, 1,
1.329135, -0.6588709, 2.856345, 1, 0, 0.509804, 1,
1.343866, -0.8547689, 1.190828, 1, 0, 0.5058824, 1,
1.345641, 1.379707, 1.104182, 1, 0, 0.4980392, 1,
1.357044, -1.429932, 2.224085, 1, 0, 0.4901961, 1,
1.357136, -0.8184927, 2.252402, 1, 0, 0.4862745, 1,
1.363097, -1.990736, 1.196192, 1, 0, 0.4784314, 1,
1.371333, 0.1711714, 2.717937, 1, 0, 0.4745098, 1,
1.373641, -0.618748, 2.960703, 1, 0, 0.4666667, 1,
1.380585, -0.4162404, 1.169059, 1, 0, 0.4627451, 1,
1.380603, 1.111956, 1.509728, 1, 0, 0.454902, 1,
1.381858, -1.092559, 3.055626, 1, 0, 0.4509804, 1,
1.384274, 0.2034552, 1.615945, 1, 0, 0.4431373, 1,
1.386788, -2.58741, 2.659271, 1, 0, 0.4392157, 1,
1.386853, 0.5703461, 1.50808, 1, 0, 0.4313726, 1,
1.404412, -0.05483933, 0.7738262, 1, 0, 0.427451, 1,
1.404738, 1.04266, 2.430177, 1, 0, 0.4196078, 1,
1.405324, 0.2635596, 0.9502354, 1, 0, 0.4156863, 1,
1.407589, -0.2486968, 3.017354, 1, 0, 0.4078431, 1,
1.411322, -1.457628, 2.543258, 1, 0, 0.4039216, 1,
1.418362, -2.168102, 3.160545, 1, 0, 0.3960784, 1,
1.425485, 1.120387, 0.9192725, 1, 0, 0.3882353, 1,
1.432345, 1.010281, 0.0447353, 1, 0, 0.3843137, 1,
1.472616, -0.6204534, 0.934916, 1, 0, 0.3764706, 1,
1.481827, 0.5452384, 1.943964, 1, 0, 0.372549, 1,
1.482187, -0.1104981, 1.45405, 1, 0, 0.3647059, 1,
1.48753, -1.842265, 2.306368, 1, 0, 0.3607843, 1,
1.494, -0.2800871, -0.4576134, 1, 0, 0.3529412, 1,
1.498359, 0.8209029, 2.244146, 1, 0, 0.3490196, 1,
1.509928, -0.5531015, 2.362231, 1, 0, 0.3411765, 1,
1.519149, -0.9214066, 1.377012, 1, 0, 0.3372549, 1,
1.520703, -1.571679, 2.729952, 1, 0, 0.3294118, 1,
1.550072, -0.2175516, 0.7136462, 1, 0, 0.3254902, 1,
1.576787, 0.1935158, 0.8451091, 1, 0, 0.3176471, 1,
1.582235, -0.1865966, 0.7632077, 1, 0, 0.3137255, 1,
1.582333, -0.5465729, 1.470569, 1, 0, 0.3058824, 1,
1.586676, 1.172733, 0.8561856, 1, 0, 0.2980392, 1,
1.600586, 1.676949, 0.8807534, 1, 0, 0.2941177, 1,
1.609914, 0.4212314, 2.135131, 1, 0, 0.2862745, 1,
1.612653, 0.6808102, 2.774641, 1, 0, 0.282353, 1,
1.612808, -0.2983751, 1.449898, 1, 0, 0.2745098, 1,
1.622965, -0.9816027, 2.208368, 1, 0, 0.2705882, 1,
1.63614, 0.002035814, 1.784345, 1, 0, 0.2627451, 1,
1.650778, 0.1438936, -0.6239981, 1, 0, 0.2588235, 1,
1.654844, 0.5072514, 1.482559, 1, 0, 0.2509804, 1,
1.670744, -0.6083886, 2.544659, 1, 0, 0.2470588, 1,
1.676934, -0.2820827, 1.695333, 1, 0, 0.2392157, 1,
1.713899, -0.4549377, 2.722847, 1, 0, 0.2352941, 1,
1.719898, 1.870218, 0.5284004, 1, 0, 0.227451, 1,
1.722867, 0.1534904, 1.330909, 1, 0, 0.2235294, 1,
1.723769, 1.897489, 1.576982, 1, 0, 0.2156863, 1,
1.72505, -1.272572, 2.114395, 1, 0, 0.2117647, 1,
1.740105, 0.3475005, 1.496603, 1, 0, 0.2039216, 1,
1.752393, 0.1078008, 3.090153, 1, 0, 0.1960784, 1,
1.761507, -0.9048325, 1.613192, 1, 0, 0.1921569, 1,
1.762625, 2.016934, 1.540306, 1, 0, 0.1843137, 1,
1.790616, -0.8549587, 4.148752, 1, 0, 0.1803922, 1,
1.790638, -0.7185797, 1.372327, 1, 0, 0.172549, 1,
1.859986, -0.2605726, 2.596634, 1, 0, 0.1686275, 1,
1.872796, -1.975404, 2.579834, 1, 0, 0.1607843, 1,
1.889878, -0.4960594, -0.373924, 1, 0, 0.1568628, 1,
1.915043, 1.963565, 1.542862, 1, 0, 0.1490196, 1,
1.919308, -0.9795322, 0.7838628, 1, 0, 0.145098, 1,
1.934769, 1.003774, 0.3274365, 1, 0, 0.1372549, 1,
1.941187, 0.01743412, 2.106248, 1, 0, 0.1333333, 1,
1.948547, -0.2698423, 0.7960818, 1, 0, 0.1254902, 1,
1.977711, 0.8007552, 1.732452, 1, 0, 0.1215686, 1,
1.980521, 0.7929539, 0.6570587, 1, 0, 0.1137255, 1,
2.042595, -0.4069443, 1.405987, 1, 0, 0.1098039, 1,
2.081029, 0.1564042, 1.789872, 1, 0, 0.1019608, 1,
2.098582, 2.156618, 0.4596853, 1, 0, 0.09411765, 1,
2.119028, 0.6638256, 0.9185726, 1, 0, 0.09019608, 1,
2.126343, 0.6721942, 0.05880945, 1, 0, 0.08235294, 1,
2.184278, -0.482448, 1.875784, 1, 0, 0.07843138, 1,
2.247541, -0.4369856, 2.281789, 1, 0, 0.07058824, 1,
2.271433, -1.101531, 2.378565, 1, 0, 0.06666667, 1,
2.281913, -1.412792, 2.848002, 1, 0, 0.05882353, 1,
2.307958, 0.4891469, 1.939124, 1, 0, 0.05490196, 1,
2.338547, 0.2443959, 2.19761, 1, 0, 0.04705882, 1,
2.416945, -0.328331, 2.185558, 1, 0, 0.04313726, 1,
2.430436, -0.05475636, 1.704382, 1, 0, 0.03529412, 1,
2.465961, -1.76599, 2.041703, 1, 0, 0.03137255, 1,
2.514717, -0.9923552, 0.5823541, 1, 0, 0.02352941, 1,
2.528162, -0.2326417, 3.71841, 1, 0, 0.01960784, 1,
2.538203, 0.3394739, 1.484478, 1, 0, 0.01176471, 1,
3.051208, -1.392349, 1.385244, 1, 0, 0.007843138, 1
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
0.06171882, -4.225061, -7.50367, 0, -0.5, 0.5, 0.5,
0.06171882, -4.225061, -7.50367, 1, -0.5, 0.5, 0.5,
0.06171882, -4.225061, -7.50367, 1, 1.5, 0.5, 0.5,
0.06171882, -4.225061, -7.50367, 0, 1.5, 0.5, 0.5
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
-3.941207, -0.09807467, -7.50367, 0, -0.5, 0.5, 0.5,
-3.941207, -0.09807467, -7.50367, 1, -0.5, 0.5, 0.5,
-3.941207, -0.09807467, -7.50367, 1, 1.5, 0.5, 0.5,
-3.941207, -0.09807467, -7.50367, 0, 1.5, 0.5, 0.5
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
-3.941207, -4.225061, -0.1905448, 0, -0.5, 0.5, 0.5,
-3.941207, -4.225061, -0.1905448, 1, -0.5, 0.5, 0.5,
-3.941207, -4.225061, -0.1905448, 1, 1.5, 0.5, 0.5,
-3.941207, -4.225061, -0.1905448, 0, 1.5, 0.5, 0.5
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
-2, -3.27268, -5.816026,
3, -3.27268, -5.816026,
-2, -3.27268, -5.816026,
-2, -3.43141, -6.0973,
-1, -3.27268, -5.816026,
-1, -3.43141, -6.0973,
0, -3.27268, -5.816026,
0, -3.43141, -6.0973,
1, -3.27268, -5.816026,
1, -3.43141, -6.0973,
2, -3.27268, -5.816026,
2, -3.43141, -6.0973,
3, -3.27268, -5.816026,
3, -3.43141, -6.0973
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
-2, -3.748871, -6.659848, 0, -0.5, 0.5, 0.5,
-2, -3.748871, -6.659848, 1, -0.5, 0.5, 0.5,
-2, -3.748871, -6.659848, 1, 1.5, 0.5, 0.5,
-2, -3.748871, -6.659848, 0, 1.5, 0.5, 0.5,
-1, -3.748871, -6.659848, 0, -0.5, 0.5, 0.5,
-1, -3.748871, -6.659848, 1, -0.5, 0.5, 0.5,
-1, -3.748871, -6.659848, 1, 1.5, 0.5, 0.5,
-1, -3.748871, -6.659848, 0, 1.5, 0.5, 0.5,
0, -3.748871, -6.659848, 0, -0.5, 0.5, 0.5,
0, -3.748871, -6.659848, 1, -0.5, 0.5, 0.5,
0, -3.748871, -6.659848, 1, 1.5, 0.5, 0.5,
0, -3.748871, -6.659848, 0, 1.5, 0.5, 0.5,
1, -3.748871, -6.659848, 0, -0.5, 0.5, 0.5,
1, -3.748871, -6.659848, 1, -0.5, 0.5, 0.5,
1, -3.748871, -6.659848, 1, 1.5, 0.5, 0.5,
1, -3.748871, -6.659848, 0, 1.5, 0.5, 0.5,
2, -3.748871, -6.659848, 0, -0.5, 0.5, 0.5,
2, -3.748871, -6.659848, 1, -0.5, 0.5, 0.5,
2, -3.748871, -6.659848, 1, 1.5, 0.5, 0.5,
2, -3.748871, -6.659848, 0, 1.5, 0.5, 0.5,
3, -3.748871, -6.659848, 0, -0.5, 0.5, 0.5,
3, -3.748871, -6.659848, 1, -0.5, 0.5, 0.5,
3, -3.748871, -6.659848, 1, 1.5, 0.5, 0.5,
3, -3.748871, -6.659848, 0, 1.5, 0.5, 0.5
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
-3.017455, -3, -5.816026,
-3.017455, 2, -5.816026,
-3.017455, -3, -5.816026,
-3.171413, -3, -6.0973,
-3.017455, -2, -5.816026,
-3.171413, -2, -6.0973,
-3.017455, -1, -5.816026,
-3.171413, -1, -6.0973,
-3.017455, 0, -5.816026,
-3.171413, 0, -6.0973,
-3.017455, 1, -5.816026,
-3.171413, 1, -6.0973,
-3.017455, 2, -5.816026,
-3.171413, 2, -6.0973
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
-3.479331, -3, -6.659848, 0, -0.5, 0.5, 0.5,
-3.479331, -3, -6.659848, 1, -0.5, 0.5, 0.5,
-3.479331, -3, -6.659848, 1, 1.5, 0.5, 0.5,
-3.479331, -3, -6.659848, 0, 1.5, 0.5, 0.5,
-3.479331, -2, -6.659848, 0, -0.5, 0.5, 0.5,
-3.479331, -2, -6.659848, 1, -0.5, 0.5, 0.5,
-3.479331, -2, -6.659848, 1, 1.5, 0.5, 0.5,
-3.479331, -2, -6.659848, 0, 1.5, 0.5, 0.5,
-3.479331, -1, -6.659848, 0, -0.5, 0.5, 0.5,
-3.479331, -1, -6.659848, 1, -0.5, 0.5, 0.5,
-3.479331, -1, -6.659848, 1, 1.5, 0.5, 0.5,
-3.479331, -1, -6.659848, 0, 1.5, 0.5, 0.5,
-3.479331, 0, -6.659848, 0, -0.5, 0.5, 0.5,
-3.479331, 0, -6.659848, 1, -0.5, 0.5, 0.5,
-3.479331, 0, -6.659848, 1, 1.5, 0.5, 0.5,
-3.479331, 0, -6.659848, 0, 1.5, 0.5, 0.5,
-3.479331, 1, -6.659848, 0, -0.5, 0.5, 0.5,
-3.479331, 1, -6.659848, 1, -0.5, 0.5, 0.5,
-3.479331, 1, -6.659848, 1, 1.5, 0.5, 0.5,
-3.479331, 1, -6.659848, 0, 1.5, 0.5, 0.5,
-3.479331, 2, -6.659848, 0, -0.5, 0.5, 0.5,
-3.479331, 2, -6.659848, 1, -0.5, 0.5, 0.5,
-3.479331, 2, -6.659848, 1, 1.5, 0.5, 0.5,
-3.479331, 2, -6.659848, 0, 1.5, 0.5, 0.5
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
-3.017455, -3.27268, -4,
-3.017455, -3.27268, 4,
-3.017455, -3.27268, -4,
-3.171413, -3.43141, -4,
-3.017455, -3.27268, -2,
-3.171413, -3.43141, -2,
-3.017455, -3.27268, 0,
-3.171413, -3.43141, 0,
-3.017455, -3.27268, 2,
-3.171413, -3.43141, 2,
-3.017455, -3.27268, 4,
-3.171413, -3.43141, 4
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
-3.479331, -3.748871, -4, 0, -0.5, 0.5, 0.5,
-3.479331, -3.748871, -4, 1, -0.5, 0.5, 0.5,
-3.479331, -3.748871, -4, 1, 1.5, 0.5, 0.5,
-3.479331, -3.748871, -4, 0, 1.5, 0.5, 0.5,
-3.479331, -3.748871, -2, 0, -0.5, 0.5, 0.5,
-3.479331, -3.748871, -2, 1, -0.5, 0.5, 0.5,
-3.479331, -3.748871, -2, 1, 1.5, 0.5, 0.5,
-3.479331, -3.748871, -2, 0, 1.5, 0.5, 0.5,
-3.479331, -3.748871, 0, 0, -0.5, 0.5, 0.5,
-3.479331, -3.748871, 0, 1, -0.5, 0.5, 0.5,
-3.479331, -3.748871, 0, 1, 1.5, 0.5, 0.5,
-3.479331, -3.748871, 0, 0, 1.5, 0.5, 0.5,
-3.479331, -3.748871, 2, 0, -0.5, 0.5, 0.5,
-3.479331, -3.748871, 2, 1, -0.5, 0.5, 0.5,
-3.479331, -3.748871, 2, 1, 1.5, 0.5, 0.5,
-3.479331, -3.748871, 2, 0, 1.5, 0.5, 0.5,
-3.479331, -3.748871, 4, 0, -0.5, 0.5, 0.5,
-3.479331, -3.748871, 4, 1, -0.5, 0.5, 0.5,
-3.479331, -3.748871, 4, 1, 1.5, 0.5, 0.5,
-3.479331, -3.748871, 4, 0, 1.5, 0.5, 0.5
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
-3.017455, -3.27268, -5.816026,
-3.017455, 3.07653, -5.816026,
-3.017455, -3.27268, 5.434936,
-3.017455, 3.07653, 5.434936,
-3.017455, -3.27268, -5.816026,
-3.017455, -3.27268, 5.434936,
-3.017455, 3.07653, -5.816026,
-3.017455, 3.07653, 5.434936,
-3.017455, -3.27268, -5.816026,
3.140892, -3.27268, -5.816026,
-3.017455, -3.27268, 5.434936,
3.140892, -3.27268, 5.434936,
-3.017455, 3.07653, -5.816026,
3.140892, 3.07653, -5.816026,
-3.017455, 3.07653, 5.434936,
3.140892, 3.07653, 5.434936,
3.140892, -3.27268, -5.816026,
3.140892, 3.07653, -5.816026,
3.140892, -3.27268, 5.434936,
3.140892, 3.07653, 5.434936,
3.140892, -3.27268, -5.816026,
3.140892, -3.27268, 5.434936,
3.140892, 3.07653, -5.816026,
3.140892, 3.07653, 5.434936
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
var radius = 7.642116;
var distance = 34.00064;
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
mvMatrix.translate( -0.06171882, 0.09807467, 0.1905448 );
mvMatrix.scale( 1.341725, 1.301391, 0.7344088 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.00064);
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
InChI_1S_C48H72O14.C<-read.table("InChI_1S_C48H72O14.C.xyz")
```

```
## Error in read.table("InChI_1S_C48H72O14.C.xyz"): no lines available in input
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
-2.92777, -2.048942, -2.766455, 0, 0, 1, 1, 1,
-2.885288, -0.5034221, -0.937287, 1, 0, 0, 1, 1,
-2.813797, 0.9395903, -3.450039, 1, 0, 0, 1, 1,
-2.708102, -1.503872, -2.360226, 1, 0, 0, 1, 1,
-2.548865, 0.1368234, -0.9172053, 1, 0, 0, 1, 1,
-2.460211, 0.216001, -0.8820536, 1, 0, 0, 1, 1,
-2.450727, 0.8654103, -3.873099, 0, 0, 0, 1, 1,
-2.378038, 0.4698636, -0.9882711, 0, 0, 0, 1, 1,
-2.34201, -2.351193, -0.8745679, 0, 0, 0, 1, 1,
-2.265844, -0.1629076, -0.3423646, 0, 0, 0, 1, 1,
-2.218138, -0.5207145, -0.7195249, 0, 0, 0, 1, 1,
-2.188073, -0.9084322, -3.518856, 0, 0, 0, 1, 1,
-2.157641, 0.3806475, -1.452908, 0, 0, 0, 1, 1,
-2.022832, -0.4298318, -0.03698681, 1, 1, 1, 1, 1,
-1.996461, -0.2905344, 0.6687243, 1, 1, 1, 1, 1,
-1.990896, 0.9244736, -1.443087, 1, 1, 1, 1, 1,
-1.988967, 0.7395867, -1.683474, 1, 1, 1, 1, 1,
-1.970526, 0.9933621, 1.267051, 1, 1, 1, 1, 1,
-1.918049, -1.464198, -1.895532, 1, 1, 1, 1, 1,
-1.897646, -0.3024083, -2.98276, 1, 1, 1, 1, 1,
-1.875859, 0.7566609, -0.6015841, 1, 1, 1, 1, 1,
-1.860711, 0.8423457, -1.264517, 1, 1, 1, 1, 1,
-1.838287, 0.8142228, 1.059173, 1, 1, 1, 1, 1,
-1.828449, 1.310921, -0.6008488, 1, 1, 1, 1, 1,
-1.816718, 1.158673, -1.997184, 1, 1, 1, 1, 1,
-1.752041, -0.2143405, -1.479198, 1, 1, 1, 1, 1,
-1.747888, -0.1023504, -1.44775, 1, 1, 1, 1, 1,
-1.742907, -0.9533191, -1.974743, 1, 1, 1, 1, 1,
-1.724684, 0.5324488, -0.08435772, 0, 0, 1, 1, 1,
-1.724482, -0.9054869, -2.0769, 1, 0, 0, 1, 1,
-1.700256, 1.966081, 0.934621, 1, 0, 0, 1, 1,
-1.689953, -0.5059746, -2.011838, 1, 0, 0, 1, 1,
-1.684984, -0.6198646, -1.65495, 1, 0, 0, 1, 1,
-1.679719, -0.1822643, 0.4408286, 1, 0, 0, 1, 1,
-1.660209, -1.760031, -1.528559, 0, 0, 0, 1, 1,
-1.649043, -0.2819753, -2.640034, 0, 0, 0, 1, 1,
-1.645247, -1.50871, -1.811962, 0, 0, 0, 1, 1,
-1.644013, 0.4645059, -1.692616, 0, 0, 0, 1, 1,
-1.633932, 1.204684, 0.05263762, 0, 0, 0, 1, 1,
-1.625865, 0.2149619, -1.047461, 0, 0, 0, 1, 1,
-1.619155, -2.376248, -2.118492, 0, 0, 0, 1, 1,
-1.615945, -0.4990181, -1.237212, 1, 1, 1, 1, 1,
-1.612528, 0.5378779, -1.042346, 1, 1, 1, 1, 1,
-1.606903, 1.162169, -0.8768686, 1, 1, 1, 1, 1,
-1.596283, -0.5355328, -2.683839, 1, 1, 1, 1, 1,
-1.593256, -0.1890339, -3.653921, 1, 1, 1, 1, 1,
-1.578409, -1.16762, -4.571323, 1, 1, 1, 1, 1,
-1.575514, -0.7085524, -1.645801, 1, 1, 1, 1, 1,
-1.564064, -0.09763573, -0.2089301, 1, 1, 1, 1, 1,
-1.562828, 1.741, -3.299721, 1, 1, 1, 1, 1,
-1.541942, -0.5099536, -0.4963035, 1, 1, 1, 1, 1,
-1.532177, -1.726822, -3.654323, 1, 1, 1, 1, 1,
-1.522402, -0.9808691, -1.182693, 1, 1, 1, 1, 1,
-1.503736, -0.1335981, -0.2428166, 1, 1, 1, 1, 1,
-1.475034, 0.3966032, -1.954301, 1, 1, 1, 1, 1,
-1.472623, -0.3581616, -3.845938, 1, 1, 1, 1, 1,
-1.471285, 1.105697, -0.5051968, 0, 0, 1, 1, 1,
-1.470222, -1.191163, -1.170804, 1, 0, 0, 1, 1,
-1.466322, -0.3487024, -2.088868, 1, 0, 0, 1, 1,
-1.459408, -0.6864663, -3.982203, 1, 0, 0, 1, 1,
-1.432074, -1.080499, -0.2257295, 1, 0, 0, 1, 1,
-1.422403, -0.06701893, -0.8752528, 1, 0, 0, 1, 1,
-1.422023, -1.122398, -2.517834, 0, 0, 0, 1, 1,
-1.411597, 1.248481, -2.118912, 0, 0, 0, 1, 1,
-1.399512, 0.1649074, -0.7607892, 0, 0, 0, 1, 1,
-1.399166, -3.000568, -3.444628, 0, 0, 0, 1, 1,
-1.37755, 1.492671, -0.3853225, 0, 0, 0, 1, 1,
-1.376362, 1.138631, 1.071761, 0, 0, 0, 1, 1,
-1.374878, -0.08308209, -3.273366, 0, 0, 0, 1, 1,
-1.37443, -0.4322326, -1.047482, 1, 1, 1, 1, 1,
-1.363555, 0.2004171, -1.748347, 1, 1, 1, 1, 1,
-1.360856, -0.6073247, -0.8405812, 1, 1, 1, 1, 1,
-1.357255, -0.4834967, -3.595646, 1, 1, 1, 1, 1,
-1.34765, -0.17046, -1.728079, 1, 1, 1, 1, 1,
-1.34595, -0.3118457, -0.531437, 1, 1, 1, 1, 1,
-1.343184, 0.4297171, -1.450834, 1, 1, 1, 1, 1,
-1.338268, 0.9590382, -0.3445974, 1, 1, 1, 1, 1,
-1.337951, -0.01208401, -0.2501564, 1, 1, 1, 1, 1,
-1.298106, 0.5791432, -1.755555, 1, 1, 1, 1, 1,
-1.293338, 0.8604927, -1.687144, 1, 1, 1, 1, 1,
-1.292046, 0.6733717, -0.1294458, 1, 1, 1, 1, 1,
-1.278665, -2.224139, -4.509063, 1, 1, 1, 1, 1,
-1.276582, 0.3842949, -0.8237757, 1, 1, 1, 1, 1,
-1.271839, 1.611508, 0.2371214, 1, 1, 1, 1, 1,
-1.268283, 0.8933796, -1.860338, 0, 0, 1, 1, 1,
-1.26449, -0.9788209, -3.205707, 1, 0, 0, 1, 1,
-1.262533, 0.1987047, -1.410383, 1, 0, 0, 1, 1,
-1.260296, -0.3328347, -0.6814882, 1, 0, 0, 1, 1,
-1.256726, 1.167612, -1.616432, 1, 0, 0, 1, 1,
-1.253541, -0.1884671, -1.088317, 1, 0, 0, 1, 1,
-1.239937, 0.2663567, -1.380031, 0, 0, 0, 1, 1,
-1.237448, -0.9783975, -3.002073, 0, 0, 0, 1, 1,
-1.227781, 0.01206667, -1.284228, 0, 0, 0, 1, 1,
-1.227246, 0.3639663, -0.1120928, 0, 0, 0, 1, 1,
-1.221621, 0.1566232, -0.6407356, 0, 0, 0, 1, 1,
-1.206339, -0.02094989, -3.26906, 0, 0, 0, 1, 1,
-1.201101, -1.411582, -1.369867, 0, 0, 0, 1, 1,
-1.19375, 0.2205988, -1.591913, 1, 1, 1, 1, 1,
-1.190076, 0.4978183, -0.5143342, 1, 1, 1, 1, 1,
-1.187316, -0.364428, -1.620239, 1, 1, 1, 1, 1,
-1.185118, 0.5428068, -0.194877, 1, 1, 1, 1, 1,
-1.184312, -0.08043856, -1.532876, 1, 1, 1, 1, 1,
-1.18267, 0.5112734, -0.8889381, 1, 1, 1, 1, 1,
-1.182032, 2.106992, -1.203128, 1, 1, 1, 1, 1,
-1.166824, -0.4779169, -1.995566, 1, 1, 1, 1, 1,
-1.164778, -0.2917289, -3.214399, 1, 1, 1, 1, 1,
-1.164437, -0.8651986, -2.501634, 1, 1, 1, 1, 1,
-1.157021, 2.006258, 0.09227728, 1, 1, 1, 1, 1,
-1.148236, -0.8202865, -1.62814, 1, 1, 1, 1, 1,
-1.145058, -0.7694765, -1.559297, 1, 1, 1, 1, 1,
-1.143634, 0.01717434, -0.3672593, 1, 1, 1, 1, 1,
-1.140104, -1.060043, -1.236967, 1, 1, 1, 1, 1,
-1.138069, 1.021683, -1.568626, 0, 0, 1, 1, 1,
-1.134227, -0.08520537, -3.518246, 1, 0, 0, 1, 1,
-1.133889, -0.9826013, -3.310232, 1, 0, 0, 1, 1,
-1.132201, 0.06242203, -0.07856885, 1, 0, 0, 1, 1,
-1.131517, 0.4268728, -1.431256, 1, 0, 0, 1, 1,
-1.123936, -0.0735265, -3.14013, 1, 0, 0, 1, 1,
-1.117913, 0.03754483, -0.6573104, 0, 0, 0, 1, 1,
-1.115881, -1.765154, -3.392547, 0, 0, 0, 1, 1,
-1.112953, 0.8238953, 0.8289728, 0, 0, 0, 1, 1,
-1.112193, -1.425419, -1.489297, 0, 0, 0, 1, 1,
-1.111207, -0.3930413, -3.334756, 0, 0, 0, 1, 1,
-1.108401, 0.7077268, -1.580356, 0, 0, 0, 1, 1,
-1.108136, 0.249861, -0.6622629, 0, 0, 0, 1, 1,
-1.106199, 1.17979, -2.800002, 1, 1, 1, 1, 1,
-1.10479, 1.02861, -1.553485, 1, 1, 1, 1, 1,
-1.097523, 0.2187629, 0.3169037, 1, 1, 1, 1, 1,
-1.093092, 0.3019951, -1.286851, 1, 1, 1, 1, 1,
-1.089551, 1.046193, -0.7570816, 1, 1, 1, 1, 1,
-1.08853, 0.06035765, -1.65593, 1, 1, 1, 1, 1,
-1.083932, -1.217217, -2.522954, 1, 1, 1, 1, 1,
-1.077218, 1.869733, -1.195482, 1, 1, 1, 1, 1,
-1.07588, 0.6954767, -0.9291918, 1, 1, 1, 1, 1,
-1.067264, -0.1930472, -0.3958123, 1, 1, 1, 1, 1,
-1.066661, 0.3862719, -0.4480472, 1, 1, 1, 1, 1,
-1.049456, -1.174821, -3.616372, 1, 1, 1, 1, 1,
-1.049159, -0.5611466, -0.1281663, 1, 1, 1, 1, 1,
-1.047377, 1.437828, -0.4641613, 1, 1, 1, 1, 1,
-1.043492, -0.4654869, -3.114457, 1, 1, 1, 1, 1,
-1.03957, -0.1241979, -1.026863, 0, 0, 1, 1, 1,
-1.039134, -2.505007, -2.576866, 1, 0, 0, 1, 1,
-1.03637, -0.8870137, -3.349211, 1, 0, 0, 1, 1,
-1.034914, 0.5688693, -2.011689, 1, 0, 0, 1, 1,
-1.033923, -1.573015, -2.281847, 1, 0, 0, 1, 1,
-1.03141, 1.473754, -0.5400444, 1, 0, 0, 1, 1,
-1.028595, 0.3757572, -1.481256, 0, 0, 0, 1, 1,
-1.02664, -1.919583, -3.379667, 0, 0, 0, 1, 1,
-1.026214, -0.2176188, -3.507376, 0, 0, 0, 1, 1,
-1.014297, -1.047468, -1.099644, 0, 0, 0, 1, 1,
-1.010991, 0.2550853, -2.047173, 0, 0, 0, 1, 1,
-1.008526, 1.011814, -2.093409, 0, 0, 0, 1, 1,
-1.00852, 1.838386, -1.248516, 0, 0, 0, 1, 1,
-1.007571, -0.8190024, -2.230594, 1, 1, 1, 1, 1,
-1.001837, -0.9187862, -3.265053, 1, 1, 1, 1, 1,
-0.9982451, -0.6088403, -2.584804, 1, 1, 1, 1, 1,
-0.9952782, -0.1297409, -2.946517, 1, 1, 1, 1, 1,
-0.9944694, -1.343116, -4.634367, 1, 1, 1, 1, 1,
-0.9934664, -0.9863999, -1.146415, 1, 1, 1, 1, 1,
-0.9905936, 1.196226, -1.552227, 1, 1, 1, 1, 1,
-0.9896961, -0.8536544, -2.00113, 1, 1, 1, 1, 1,
-0.987887, 0.5530913, -0.1457766, 1, 1, 1, 1, 1,
-0.9719698, 1.51438, -0.8193843, 1, 1, 1, 1, 1,
-0.9676783, 0.4688355, 0.05852427, 1, 1, 1, 1, 1,
-0.9665625, -0.7290004, -1.111036, 1, 1, 1, 1, 1,
-0.9618857, -0.1349289, -1.404571, 1, 1, 1, 1, 1,
-0.9593498, -0.9394299, -3.727289, 1, 1, 1, 1, 1,
-0.9586675, -2.167464, -1.86429, 1, 1, 1, 1, 1,
-0.9555143, 0.1763601, 0.7660232, 0, 0, 1, 1, 1,
-0.9472119, 0.1888927, -0.6159474, 1, 0, 0, 1, 1,
-0.9469883, 1.660009, -1.924559, 1, 0, 0, 1, 1,
-0.945351, -1.939467, -3.907401, 1, 0, 0, 1, 1,
-0.9452429, -0.1483682, -1.831184, 1, 0, 0, 1, 1,
-0.944057, -0.3711536, -1.407768, 1, 0, 0, 1, 1,
-0.921708, 1.620049, 1.226212, 0, 0, 0, 1, 1,
-0.9195414, 0.3032016, -1.707829, 0, 0, 0, 1, 1,
-0.9177027, 1.291487, 1.279412, 0, 0, 0, 1, 1,
-0.9174051, 0.2425292, -0.8664523, 0, 0, 0, 1, 1,
-0.9169053, -0.2256331, -0.2743917, 0, 0, 0, 1, 1,
-0.9084872, -1.149522, -3.935168, 0, 0, 0, 1, 1,
-0.9082531, 1.925602, -0.529937, 0, 0, 0, 1, 1,
-0.9077061, 0.2757141, 0.2530439, 1, 1, 1, 1, 1,
-0.8968962, 1.08326, -1.3643, 1, 1, 1, 1, 1,
-0.8961241, -1.500134, -3.738741, 1, 1, 1, 1, 1,
-0.8929008, -1.410586, -2.130974, 1, 1, 1, 1, 1,
-0.8800704, -1.426556, -4.125446, 1, 1, 1, 1, 1,
-0.8775345, -0.6115937, -2.211529, 1, 1, 1, 1, 1,
-0.8709053, -1.12756, -2.791687, 1, 1, 1, 1, 1,
-0.8618262, -0.1856451, -1.055189, 1, 1, 1, 1, 1,
-0.859766, -0.07593523, 0.9701812, 1, 1, 1, 1, 1,
-0.8566964, -0.8808975, -2.729452, 1, 1, 1, 1, 1,
-0.8514427, 0.01360929, -0.5968636, 1, 1, 1, 1, 1,
-0.8513268, -0.4112112, -2.115167, 1, 1, 1, 1, 1,
-0.8507527, -2.652641, -0.9925799, 1, 1, 1, 1, 1,
-0.8464574, -0.4366044, -2.21306, 1, 1, 1, 1, 1,
-0.8427991, 0.1485386, -0.8674338, 1, 1, 1, 1, 1,
-0.8426405, 0.8070747, -0.904544, 0, 0, 1, 1, 1,
-0.8396294, -1.33141, -5.269207, 1, 0, 0, 1, 1,
-0.8361206, 0.6109108, 0.05476528, 1, 0, 0, 1, 1,
-0.8330764, -1.895142, -2.987338, 1, 0, 0, 1, 1,
-0.8283097, -1.152211, -3.381414, 1, 0, 0, 1, 1,
-0.8244467, -0.04430055, -0.4974475, 1, 0, 0, 1, 1,
-0.8223177, -2.299352, -2.009076, 0, 0, 0, 1, 1,
-0.8222363, 1.681148, 0.9360858, 0, 0, 0, 1, 1,
-0.8214684, 0.5464652, -0.1300175, 0, 0, 0, 1, 1,
-0.8202493, -0.6118852, -4.230277, 0, 0, 0, 1, 1,
-0.8185656, -1.383051, -1.908863, 0, 0, 0, 1, 1,
-0.8181359, 0.8540943, -0.06551934, 0, 0, 0, 1, 1,
-0.8158851, -0.5017641, -3.22218, 0, 0, 0, 1, 1,
-0.8151976, 1.61631, -0.1353312, 1, 1, 1, 1, 1,
-0.8126475, 1.10648, -1.220698, 1, 1, 1, 1, 1,
-0.8125881, -0.6197183, -0.9062817, 1, 1, 1, 1, 1,
-0.8109474, -1.223819, -2.875051, 1, 1, 1, 1, 1,
-0.8098385, -0.4795691, -3.5722, 1, 1, 1, 1, 1,
-0.7960206, -0.4936025, -0.2886853, 1, 1, 1, 1, 1,
-0.7855502, 1.607074, -0.105266, 1, 1, 1, 1, 1,
-0.7826653, 0.998522, -0.5506107, 1, 1, 1, 1, 1,
-0.7795817, 0.1136329, -0.6585247, 1, 1, 1, 1, 1,
-0.7678702, 0.3966313, -1.190042, 1, 1, 1, 1, 1,
-0.7664778, 0.9200569, -0.3260783, 1, 1, 1, 1, 1,
-0.7648745, -0.6095272, -2.095134, 1, 1, 1, 1, 1,
-0.7580111, 1.237705, -1.013496, 1, 1, 1, 1, 1,
-0.7567089, -0.7426044, -1.009968, 1, 1, 1, 1, 1,
-0.7553905, -0.1521096, 0.9653678, 1, 1, 1, 1, 1,
-0.7522931, -1.599681, -2.525436, 0, 0, 1, 1, 1,
-0.7456971, -1.49405, -3.154446, 1, 0, 0, 1, 1,
-0.7430685, 0.4926728, -0.3807005, 1, 0, 0, 1, 1,
-0.7418625, -0.1190459, -2.720648, 1, 0, 0, 1, 1,
-0.7387676, 0.1376235, -2.024757, 1, 0, 0, 1, 1,
-0.737792, 2.431697, -0.4191191, 1, 0, 0, 1, 1,
-0.7346092, 1.810929, -2.675115, 0, 0, 0, 1, 1,
-0.7211273, 0.3490011, -0.6429157, 0, 0, 0, 1, 1,
-0.718381, -1.059034, -2.055156, 0, 0, 0, 1, 1,
-0.7169226, -1.502802, -2.58426, 0, 0, 0, 1, 1,
-0.7157604, -0.8239592, -1.589964, 0, 0, 0, 1, 1,
-0.7053103, -1.146897, -1.645755, 0, 0, 0, 1, 1,
-0.7040526, 0.4951708, -0.2314599, 0, 0, 0, 1, 1,
-0.7016755, -1.435328, -3.535117, 1, 1, 1, 1, 1,
-0.7006662, -0.9504704, -3.163323, 1, 1, 1, 1, 1,
-0.6963702, -1.200002, -2.392658, 1, 1, 1, 1, 1,
-0.6916375, -0.6669285, -3.412331, 1, 1, 1, 1, 1,
-0.6846654, 0.5208689, -1.041123, 1, 1, 1, 1, 1,
-0.6817267, 1.238676, -1.148834, 1, 1, 1, 1, 1,
-0.6771286, -0.1045254, 0.4448809, 1, 1, 1, 1, 1,
-0.6698238, 0.7499324, -0.7691497, 1, 1, 1, 1, 1,
-0.6659043, -0.721766, -1.794556, 1, 1, 1, 1, 1,
-0.6633615, 0.2293934, -1.134385, 1, 1, 1, 1, 1,
-0.6589311, 0.2082483, -1.773446, 1, 1, 1, 1, 1,
-0.6586385, -1.797157, -1.70707, 1, 1, 1, 1, 1,
-0.6568456, 1.183738, 0.3345965, 1, 1, 1, 1, 1,
-0.6555756, -0.7164667, -3.118118, 1, 1, 1, 1, 1,
-0.6518498, 0.506213, 0.4985034, 1, 1, 1, 1, 1,
-0.6511356, 0.3365754, 0.8388866, 0, 0, 1, 1, 1,
-0.6479816, 1.200739, -1.007765, 1, 0, 0, 1, 1,
-0.6416402, 1.907379, -0.3572773, 1, 0, 0, 1, 1,
-0.6364318, 2.038857, -0.06290315, 1, 0, 0, 1, 1,
-0.636365, 0.9531672, -0.9579767, 1, 0, 0, 1, 1,
-0.6334203, -0.5046646, -0.3514808, 1, 0, 0, 1, 1,
-0.6297135, 2.061308, -0.5200915, 0, 0, 0, 1, 1,
-0.6295797, -1.147399, -3.160915, 0, 0, 0, 1, 1,
-0.6274387, -0.555594, -2.057407, 0, 0, 0, 1, 1,
-0.6273735, -0.04099314, -0.9424069, 0, 0, 0, 1, 1,
-0.6270994, 2.770237, -2.2357, 0, 0, 0, 1, 1,
-0.6221505, -0.1767777, -0.141081, 0, 0, 0, 1, 1,
-0.6173432, 1.028472, -2.086393, 0, 0, 0, 1, 1,
-0.6071407, -0.9876108, -1.085226, 1, 1, 1, 1, 1,
-0.6071137, -1.513949, -3.070663, 1, 1, 1, 1, 1,
-0.6049893, 0.5857896, 1.574442, 1, 1, 1, 1, 1,
-0.6006011, 0.0671431, -0.8280772, 1, 1, 1, 1, 1,
-0.5977998, -0.3317378, -1.324323, 1, 1, 1, 1, 1,
-0.5921013, 0.3154662, -2.265783, 1, 1, 1, 1, 1,
-0.586359, 0.127111, -0.2738238, 1, 1, 1, 1, 1,
-0.5843303, 0.534344, -0.7186252, 1, 1, 1, 1, 1,
-0.583433, -1.024896, -3.033948, 1, 1, 1, 1, 1,
-0.5799851, 0.7792619, -1.646495, 1, 1, 1, 1, 1,
-0.5791615, 0.5217484, -0.5108863, 1, 1, 1, 1, 1,
-0.575887, 0.4630032, 2.09999, 1, 1, 1, 1, 1,
-0.5744634, 0.9737496, 0.09394367, 1, 1, 1, 1, 1,
-0.5728508, -0.1520504, -1.773194, 1, 1, 1, 1, 1,
-0.5728249, 0.7154229, -1.317952, 1, 1, 1, 1, 1,
-0.5726401, -0.696049, -3.727319, 0, 0, 1, 1, 1,
-0.5653523, 0.9662378, 1.539619, 1, 0, 0, 1, 1,
-0.5641409, -0.4402993, -3.643262, 1, 0, 0, 1, 1,
-0.5547699, 1.999105, -0.2106896, 1, 0, 0, 1, 1,
-0.5529242, -1.439358, -2.960607, 1, 0, 0, 1, 1,
-0.5495733, -0.3265647, -1.615378, 1, 0, 0, 1, 1,
-0.5478273, 1.576082, 0.04638001, 0, 0, 0, 1, 1,
-0.5440074, -0.3594937, -1.442957, 0, 0, 0, 1, 1,
-0.5426933, -0.6234125, -2.186492, 0, 0, 0, 1, 1,
-0.5404878, -0.4009026, -0.6869323, 0, 0, 0, 1, 1,
-0.5366636, 1.81734, -0.8380117, 0, 0, 0, 1, 1,
-0.5365979, -1.954006, -3.903011, 0, 0, 0, 1, 1,
-0.5359427, 0.7284213, -0.312292, 0, 0, 0, 1, 1,
-0.5314947, 1.280559, -0.9562074, 1, 1, 1, 1, 1,
-0.5295552, -0.1037105, -0.321844, 1, 1, 1, 1, 1,
-0.5294449, -0.008393371, -3.386615, 1, 1, 1, 1, 1,
-0.5291157, 1.413518, -2.507366, 1, 1, 1, 1, 1,
-0.5282826, -1.999789, -2.513838, 1, 1, 1, 1, 1,
-0.5278689, -0.03086375, -1.417791, 1, 1, 1, 1, 1,
-0.5264609, 1.231295, -0.8255814, 1, 1, 1, 1, 1,
-0.5242419, -0.1627755, -0.4093033, 1, 1, 1, 1, 1,
-0.5224198, 1.556682, 1.189821, 1, 1, 1, 1, 1,
-0.5218253, 0.225059, -0.1544857, 1, 1, 1, 1, 1,
-0.5191165, -0.5756026, -4.627319, 1, 1, 1, 1, 1,
-0.518535, -0.8363132, -2.962421, 1, 1, 1, 1, 1,
-0.5160386, -0.4445377, -2.045519, 1, 1, 1, 1, 1,
-0.5145112, -0.6782969, -4.248889, 1, 1, 1, 1, 1,
-0.5137985, 1.03678, 0.5840722, 1, 1, 1, 1, 1,
-0.5133415, 0.4616395, -2.170003, 0, 0, 1, 1, 1,
-0.5102267, -0.06871783, -2.405849, 1, 0, 0, 1, 1,
-0.5092323, 0.4638813, -2.341042, 1, 0, 0, 1, 1,
-0.5023472, -0.9246861, -4.826005, 1, 0, 0, 1, 1,
-0.4999624, 0.3637291, -0.8112699, 1, 0, 0, 1, 1,
-0.4994313, -1.705859, -1.686272, 1, 0, 0, 1, 1,
-0.4873355, -0.9519632, -2.462925, 0, 0, 0, 1, 1,
-0.4863712, 0.317838, -1.004098, 0, 0, 0, 1, 1,
-0.4789945, -0.02928603, -0.4387364, 0, 0, 0, 1, 1,
-0.4748743, -0.9019429, -4.356374, 0, 0, 0, 1, 1,
-0.4735538, 1.347642, 1.55391, 0, 0, 0, 1, 1,
-0.4722107, 0.9237813, -0.8389333, 0, 0, 0, 1, 1,
-0.4664523, -1.143921, -2.190683, 0, 0, 0, 1, 1,
-0.4649762, 0.4167711, 0.4432854, 1, 1, 1, 1, 1,
-0.4618387, -0.1234543, -1.79091, 1, 1, 1, 1, 1,
-0.4578301, 0.6665446, 0.2824613, 1, 1, 1, 1, 1,
-0.4527746, 1.558867, 0.9322619, 1, 1, 1, 1, 1,
-0.4468568, 0.7226524, -0.9850093, 1, 1, 1, 1, 1,
-0.4416868, -1.229443, -3.444246, 1, 1, 1, 1, 1,
-0.4326254, 0.987165, -0.2864972, 1, 1, 1, 1, 1,
-0.4319024, -0.7716746, -3.894461, 1, 1, 1, 1, 1,
-0.4312981, 0.4878559, -1.123631, 1, 1, 1, 1, 1,
-0.4295842, -1.030745, -4.109544, 1, 1, 1, 1, 1,
-0.4294368, 0.006135117, -1.540504, 1, 1, 1, 1, 1,
-0.4285421, -0.07577712, 0.9223076, 1, 1, 1, 1, 1,
-0.4252138, 1.489303, -2.028786, 1, 1, 1, 1, 1,
-0.4245103, 0.2525666, 0.2684273, 1, 1, 1, 1, 1,
-0.422764, 0.671497, -2.703428, 1, 1, 1, 1, 1,
-0.4157623, 2.984066, 0.07622444, 0, 0, 1, 1, 1,
-0.4075536, 0.3611834, -1.127474, 1, 0, 0, 1, 1,
-0.4065126, -1.258693, -2.624943, 1, 0, 0, 1, 1,
-0.4043498, -0.7969944, -5.652177, 1, 0, 0, 1, 1,
-0.4000144, -0.3096297, -0.2808299, 1, 0, 0, 1, 1,
-0.3978592, 1.264883, 0.3904127, 1, 0, 0, 1, 1,
-0.3961495, -2.08664, -3.992411, 0, 0, 0, 1, 1,
-0.3912596, -2.701293, -2.321463, 0, 0, 0, 1, 1,
-0.3900255, -1.280264, -2.104022, 0, 0, 0, 1, 1,
-0.3880272, 1.047768, -0.1220767, 0, 0, 0, 1, 1,
-0.386839, -0.5248701, -3.114743, 0, 0, 0, 1, 1,
-0.3856161, -1.611893, -1.354661, 0, 0, 0, 1, 1,
-0.3837431, -2.706064, -3.560101, 0, 0, 0, 1, 1,
-0.3837206, -1.253765, -2.24567, 1, 1, 1, 1, 1,
-0.3792591, -0.5053184, -1.767372, 1, 1, 1, 1, 1,
-0.3767714, 1.022783, 0.3314198, 1, 1, 1, 1, 1,
-0.3754459, 1.357048, -0.6406512, 1, 1, 1, 1, 1,
-0.3643221, 0.7365645, -0.4191957, 1, 1, 1, 1, 1,
-0.3621641, -0.612541, -2.950353, 1, 1, 1, 1, 1,
-0.3600013, 1.295436, 1.165247, 1, 1, 1, 1, 1,
-0.3561283, -2.181399, -4.422743, 1, 1, 1, 1, 1,
-0.3510692, -0.714402, -1.693013, 1, 1, 1, 1, 1,
-0.3487276, -0.6508454, -2.590683, 1, 1, 1, 1, 1,
-0.3478396, 0.02352376, -1.726707, 1, 1, 1, 1, 1,
-0.3457614, -0.3427515, -0.9531136, 1, 1, 1, 1, 1,
-0.3409782, -0.09862049, -1.970914, 1, 1, 1, 1, 1,
-0.3353277, -1.269263, -4.417369, 1, 1, 1, 1, 1,
-0.3296273, -0.9974834, -3.416259, 1, 1, 1, 1, 1,
-0.3254057, 0.6467866, -1.552695, 0, 0, 1, 1, 1,
-0.3184667, -1.13989, -2.741268, 1, 0, 0, 1, 1,
-0.3165096, -0.1268082, -1.550243, 1, 0, 0, 1, 1,
-0.3120702, 0.8417844, -1.187462, 1, 0, 0, 1, 1,
-0.306071, -0.02992279, -1.344043, 1, 0, 0, 1, 1,
-0.3052268, 1.160339, -0.9027238, 1, 0, 0, 1, 1,
-0.3018053, -0.6369462, -1.944506, 0, 0, 0, 1, 1,
-0.2925233, 0.1670811, -1.115183, 0, 0, 0, 1, 1,
-0.2900304, -0.8313103, -2.854253, 0, 0, 0, 1, 1,
-0.2896534, 0.4430024, -0.4365563, 0, 0, 0, 1, 1,
-0.2890848, 0.1263651, -1.175258, 0, 0, 0, 1, 1,
-0.2880005, -0.5696384, -2.123431, 0, 0, 0, 1, 1,
-0.2874758, 1.057284, 0.003686198, 0, 0, 0, 1, 1,
-0.286956, -0.06254628, -1.827314, 1, 1, 1, 1, 1,
-0.2858902, 0.3267611, -2.865615, 1, 1, 1, 1, 1,
-0.2846932, 0.8227726, -0.75673, 1, 1, 1, 1, 1,
-0.2839891, -0.8242275, -2.339434, 1, 1, 1, 1, 1,
-0.2839125, 0.0416019, -0.7122743, 1, 1, 1, 1, 1,
-0.2805959, 0.6491822, 0.5449157, 1, 1, 1, 1, 1,
-0.2796993, 2.074445, -0.223536, 1, 1, 1, 1, 1,
-0.277355, 0.7763534, -0.332947, 1, 1, 1, 1, 1,
-0.2768947, -1.611463, -2.836773, 1, 1, 1, 1, 1,
-0.2719235, -0.7462762, -2.452962, 1, 1, 1, 1, 1,
-0.2711384, 0.460988, 0.553112, 1, 1, 1, 1, 1,
-0.2711149, 0.3486152, -0.2655963, 1, 1, 1, 1, 1,
-0.2666759, -0.2557615, -2.12412, 1, 1, 1, 1, 1,
-0.2661537, 0.7216076, -2.83258, 1, 1, 1, 1, 1,
-0.2633574, -0.299046, -2.667621, 1, 1, 1, 1, 1,
-0.2575099, -0.4760491, -2.232129, 0, 0, 1, 1, 1,
-0.2512912, 1.050967, 0.1040952, 1, 0, 0, 1, 1,
-0.2496013, 1.215367, -2.125447, 1, 0, 0, 1, 1,
-0.2447773, 1.013468, -0.8913378, 1, 0, 0, 1, 1,
-0.2412193, -0.1332156, -1.962507, 1, 0, 0, 1, 1,
-0.239941, -0.4668474, -1.51048, 1, 0, 0, 1, 1,
-0.2344716, -1.685175, -3.423957, 0, 0, 0, 1, 1,
-0.2331478, -0.02918432, 0.8013897, 0, 0, 0, 1, 1,
-0.2313628, -0.1846816, -2.970671, 0, 0, 0, 1, 1,
-0.2165601, -1.075943, -3.626046, 0, 0, 0, 1, 1,
-0.2158163, 0.7850583, -0.08578478, 0, 0, 0, 1, 1,
-0.2126534, 0.3666265, -0.5259749, 0, 0, 0, 1, 1,
-0.2122515, 1.83413, 0.4105852, 0, 0, 0, 1, 1,
-0.2110434, 2.407469, -0.8402829, 1, 1, 1, 1, 1,
-0.2109593, 1.432177, 0.6086292, 1, 1, 1, 1, 1,
-0.2076932, -1.131485, -3.654465, 1, 1, 1, 1, 1,
-0.2060117, 1.21704, -0.3077836, 1, 1, 1, 1, 1,
-0.204894, -0.008577256, -2.512328, 1, 1, 1, 1, 1,
-0.2013831, 0.6742424, 0.7032253, 1, 1, 1, 1, 1,
-0.199992, -0.418367, -2.984987, 1, 1, 1, 1, 1,
-0.1993923, 2.069435, -0.7825602, 1, 1, 1, 1, 1,
-0.1873365, 0.410504, -1.161849, 1, 1, 1, 1, 1,
-0.1812918, 0.1789143, 0.2057697, 1, 1, 1, 1, 1,
-0.1809277, -0.8247395, -3.183388, 1, 1, 1, 1, 1,
-0.1766952, 1.201023, 0.678459, 1, 1, 1, 1, 1,
-0.1761719, -0.2199659, -4.572339, 1, 1, 1, 1, 1,
-0.1747656, -0.1541493, -3.451651, 1, 1, 1, 1, 1,
-0.1743069, -0.7403329, -2.136634, 1, 1, 1, 1, 1,
-0.1686774, -0.7520255, -3.546408, 0, 0, 1, 1, 1,
-0.1666624, -0.3905377, -3.090663, 1, 0, 0, 1, 1,
-0.1628262, 1.660263, 0.3446565, 1, 0, 0, 1, 1,
-0.162473, -0.1888354, -2.63574, 1, 0, 0, 1, 1,
-0.1616836, -0.6744285, -2.145786, 1, 0, 0, 1, 1,
-0.1606001, 0.4229874, -1.76566, 1, 0, 0, 1, 1,
-0.1542246, -0.04156241, -3.591875, 0, 0, 0, 1, 1,
-0.1490481, -1.041946, -2.123026, 0, 0, 0, 1, 1,
-0.1476097, 0.05303118, -0.6483426, 0, 0, 0, 1, 1,
-0.1469508, 0.1272928, 0.1169128, 0, 0, 0, 1, 1,
-0.1463142, -1.663834, -2.723924, 0, 0, 0, 1, 1,
-0.1444737, 0.01302186, -2.322396, 0, 0, 0, 1, 1,
-0.1440473, 0.1340252, -2.466774, 0, 0, 0, 1, 1,
-0.1359165, 1.078958, 1.960257, 1, 1, 1, 1, 1,
-0.133171, -0.8059424, -2.067755, 1, 1, 1, 1, 1,
-0.1324872, -0.9233414, -2.152019, 1, 1, 1, 1, 1,
-0.1266171, -2.096751, -1.760884, 1, 1, 1, 1, 1,
-0.1252881, -0.04898072, -2.23154, 1, 1, 1, 1, 1,
-0.1219972, -0.0959055, -3.649539, 1, 1, 1, 1, 1,
-0.1184719, -0.1215595, -2.506165, 1, 1, 1, 1, 1,
-0.1179751, -0.9348539, -4.389043, 1, 1, 1, 1, 1,
-0.11504, -0.4300891, -4.985065, 1, 1, 1, 1, 1,
-0.1145283, -0.192878, -3.935696, 1, 1, 1, 1, 1,
-0.1135024, 1.984279, 0.9034149, 1, 1, 1, 1, 1,
-0.1110689, 0.7892904, 0.7360257, 1, 1, 1, 1, 1,
-0.1106464, -0.8855622, -3.172645, 1, 1, 1, 1, 1,
-0.1102424, 0.4713046, 0.8702552, 1, 1, 1, 1, 1,
-0.1085371, -0.9632354, -3.519812, 1, 1, 1, 1, 1,
-0.1074426, -0.5028827, -4.882119, 0, 0, 1, 1, 1,
-0.1060575, 0.5342546, 0.170701, 1, 0, 0, 1, 1,
-0.1058715, 0.2975567, -0.3246023, 1, 0, 0, 1, 1,
-0.09886815, 0.02954919, -1.06785, 1, 0, 0, 1, 1,
-0.09391698, -1.069396, -2.609661, 1, 0, 0, 1, 1,
-0.09342979, -0.2123721, -4.976993, 1, 0, 0, 1, 1,
-0.09330213, -0.7757729, -3.295592, 0, 0, 0, 1, 1,
-0.09255216, -0.5361636, -1.90111, 0, 0, 0, 1, 1,
-0.09094469, -0.0886251, -2.060903, 0, 0, 0, 1, 1,
-0.08910314, 0.2535901, -1.070211, 0, 0, 0, 1, 1,
-0.08885643, -0.8947475, -2.745832, 0, 0, 0, 1, 1,
-0.08689296, 1.237617, 0.1879935, 0, 0, 0, 1, 1,
-0.08067616, 0.9774737, 0.2838682, 0, 0, 0, 1, 1,
-0.07986605, -1.235812, -1.91387, 1, 1, 1, 1, 1,
-0.07199246, 1.103762, 1.236503, 1, 1, 1, 1, 1,
-0.06603679, 0.666189, -0.9579438, 1, 1, 1, 1, 1,
-0.06537673, -0.1665539, -3.544107, 1, 1, 1, 1, 1,
-0.0646906, -0.3615638, -3.793908, 1, 1, 1, 1, 1,
-0.06074914, 0.5966058, -0.2602091, 1, 1, 1, 1, 1,
-0.05963931, 0.02523447, -0.6229113, 1, 1, 1, 1, 1,
-0.05560718, -0.5493174, -2.443224, 1, 1, 1, 1, 1,
-0.05492251, -0.04459993, -0.7459412, 1, 1, 1, 1, 1,
-0.05421994, -0.08735422, -1.908446, 1, 1, 1, 1, 1,
-0.05185026, -0.9540114, -2.151467, 1, 1, 1, 1, 1,
-0.05127842, 0.7923965, -0.8114001, 1, 1, 1, 1, 1,
-0.05063139, -0.5969009, -4.596416, 1, 1, 1, 1, 1,
-0.04094468, 1.615375, 1.523733, 1, 1, 1, 1, 1,
-0.03567685, -1.243201, -2.212372, 1, 1, 1, 1, 1,
-0.03023328, -0.6519088, -2.194656, 0, 0, 1, 1, 1,
-0.02051293, -2.098869, -3.465067, 1, 0, 0, 1, 1,
-0.01061009, 2.184681, 1.017978, 1, 0, 0, 1, 1,
-0.005944529, -0.4030725, -1.991825, 1, 0, 0, 1, 1,
-0.003227431, -0.0001744026, 0.3198221, 1, 0, 0, 1, 1,
-0.001998593, -0.5356602, -1.781564, 1, 0, 0, 1, 1,
0.001549536, -0.9054013, 4.5747, 0, 0, 0, 1, 1,
0.004955576, -0.6573868, 2.916748, 0, 0, 0, 1, 1,
0.006064643, 0.9183977, -0.5916656, 0, 0, 0, 1, 1,
0.006744063, -0.9295816, 2.811556, 0, 0, 0, 1, 1,
0.01043817, 2.081527, -0.1243476, 0, 0, 0, 1, 1,
0.01067716, -0.3843204, 3.585979, 0, 0, 0, 1, 1,
0.01122811, 0.3969435, 1.618222, 0, 0, 0, 1, 1,
0.01375511, 1.364198, 0.5029498, 1, 1, 1, 1, 1,
0.01606939, -0.02264243, 3.813658, 1, 1, 1, 1, 1,
0.0173524, 0.8125576, -0.3087876, 1, 1, 1, 1, 1,
0.02152448, -0.3300352, 3.878882, 1, 1, 1, 1, 1,
0.02377797, -0.1818323, 4.645729, 1, 1, 1, 1, 1,
0.02477817, 0.3255721, 0.6739519, 1, 1, 1, 1, 1,
0.02754999, 2.485097, -0.4661481, 1, 1, 1, 1, 1,
0.02859564, 0.09225153, -0.02023023, 1, 1, 1, 1, 1,
0.03304156, 0.1234543, 0.5883961, 1, 1, 1, 1, 1,
0.03430037, 0.1499594, -1.145522, 1, 1, 1, 1, 1,
0.03720041, -2.365033, 1.619759, 1, 1, 1, 1, 1,
0.03785131, 0.9673852, 0.4527876, 1, 1, 1, 1, 1,
0.0387373, -0.6099408, 2.307668, 1, 1, 1, 1, 1,
0.04207718, 0.6231843, -0.0294858, 1, 1, 1, 1, 1,
0.04280269, -0.3617046, 0.9972641, 1, 1, 1, 1, 1,
0.04534353, -1.296085, 2.423676, 0, 0, 1, 1, 1,
0.04785459, 1.348619, -2.091208, 1, 0, 0, 1, 1,
0.05340079, -1.624221, 4.196589, 1, 0, 0, 1, 1,
0.05484124, 0.2272245, -0.1176249, 1, 0, 0, 1, 1,
0.05509208, -0.2259314, 2.73657, 1, 0, 0, 1, 1,
0.05646389, -1.349962, 3.252481, 1, 0, 0, 1, 1,
0.05916721, -0.5087646, 4.058451, 0, 0, 0, 1, 1,
0.0621489, 0.6223494, -1.183816, 0, 0, 0, 1, 1,
0.06245873, 1.696048, 1.096877, 0, 0, 0, 1, 1,
0.06362541, 1.052284, -2.041641, 0, 0, 0, 1, 1,
0.0646661, -0.4660972, 3.251153, 0, 0, 0, 1, 1,
0.07590833, 0.2340901, -1.283934, 0, 0, 0, 1, 1,
0.07594311, 1.988344, 1.167631, 0, 0, 0, 1, 1,
0.07796098, 0.1850621, 1.242266, 1, 1, 1, 1, 1,
0.07957768, 0.4597175, 0.5191554, 1, 1, 1, 1, 1,
0.08209991, 0.6856709, -0.4410875, 1, 1, 1, 1, 1,
0.08299974, 1.114339, 0.6575187, 1, 1, 1, 1, 1,
0.08893789, -0.6279671, 2.423139, 1, 1, 1, 1, 1,
0.09214108, -0.8309577, 0.6635191, 1, 1, 1, 1, 1,
0.09565729, -0.8330461, 2.875078, 1, 1, 1, 1, 1,
0.09635643, -1.294481, 3.969456, 1, 1, 1, 1, 1,
0.1012123, 1.384642, -0.1337078, 1, 1, 1, 1, 1,
0.1030229, -1.470662, 2.253091, 1, 1, 1, 1, 1,
0.1032908, -0.6050152, 1.538652, 1, 1, 1, 1, 1,
0.1089693, 0.4750721, 0.2751599, 1, 1, 1, 1, 1,
0.1092412, 0.3365059, -0.1558037, 1, 1, 1, 1, 1,
0.1098443, -0.0696611, 3.467649, 1, 1, 1, 1, 1,
0.1117457, 0.6984218, -1.104308, 1, 1, 1, 1, 1,
0.1118478, 2.157705, 0.6190339, 0, 0, 1, 1, 1,
0.1124559, -0.1222649, 2.862203, 1, 0, 0, 1, 1,
0.1127112, -1.000236, 1.621405, 1, 0, 0, 1, 1,
0.113932, -0.7228632, 1.58443, 1, 0, 0, 1, 1,
0.1153721, 0.8792151, 0.363845, 1, 0, 0, 1, 1,
0.1226259, 1.146575, 0.2974258, 1, 0, 0, 1, 1,
0.1242058, 0.1712684, -0.5187019, 0, 0, 0, 1, 1,
0.1244551, 0.09426845, 2.781537, 0, 0, 0, 1, 1,
0.124854, -1.151667, 3.583385, 0, 0, 0, 1, 1,
0.1316711, 1.622119, 1.060337, 0, 0, 0, 1, 1,
0.1322809, -1.768991, 4.025522, 0, 0, 0, 1, 1,
0.1341978, 0.4871291, 0.979943, 0, 0, 0, 1, 1,
0.1375317, -2.451933, 2.521392, 0, 0, 0, 1, 1,
0.137965, 0.3957498, 1.428572, 1, 1, 1, 1, 1,
0.1386118, -0.6347336, 2.440383, 1, 1, 1, 1, 1,
0.1414904, 0.759686, -0.2487671, 1, 1, 1, 1, 1,
0.1423597, 0.05602673, 1.311915, 1, 1, 1, 1, 1,
0.1452242, 0.639194, 0.7365989, 1, 1, 1, 1, 1,
0.145748, -1.053696, 4.952332, 1, 1, 1, 1, 1,
0.1458644, -0.2097852, 2.562999, 1, 1, 1, 1, 1,
0.1516786, 0.4473074, -1.342289, 1, 1, 1, 1, 1,
0.1537779, -1.151722, 3.548691, 1, 1, 1, 1, 1,
0.158803, 0.06113531, 2.3991, 1, 1, 1, 1, 1,
0.1616323, 0.4922348, 0.697984, 1, 1, 1, 1, 1,
0.1621678, -0.2235368, 2.274726, 1, 1, 1, 1, 1,
0.1640484, 1.038014, -0.1931233, 1, 1, 1, 1, 1,
0.1663045, -0.06403561, -1.977988, 1, 1, 1, 1, 1,
0.1739104, 1.673253, 0.6116735, 1, 1, 1, 1, 1,
0.1748291, 1.339377, 0.02228983, 0, 0, 1, 1, 1,
0.1792801, -0.9330787, 5.066133, 1, 0, 0, 1, 1,
0.180291, 0.4680574, -0.2815758, 1, 0, 0, 1, 1,
0.1817823, 1.496053, 0.8827152, 1, 0, 0, 1, 1,
0.1845181, -1.108756, 1.525778, 1, 0, 0, 1, 1,
0.1848825, -1.045409, 1.478405, 1, 0, 0, 1, 1,
0.1902176, 0.6975683, 1.186443, 0, 0, 0, 1, 1,
0.1958618, -2.072075, 2.385585, 0, 0, 0, 1, 1,
0.1986667, -0.01083914, 0.5399408, 0, 0, 0, 1, 1,
0.2004556, 0.8687648, 2.398493, 0, 0, 0, 1, 1,
0.2017795, 0.2173783, 0.426836, 0, 0, 0, 1, 1,
0.2056481, -1.732004, 4.159127, 0, 0, 0, 1, 1,
0.2069471, 0.3124154, 1.238111, 0, 0, 0, 1, 1,
0.2074917, -0.9326671, 0.8853942, 1, 1, 1, 1, 1,
0.2121414, -0.06994113, 0.2811426, 1, 1, 1, 1, 1,
0.212774, 0.8351333, 0.1683272, 1, 1, 1, 1, 1,
0.2156021, 1.038311, -1.477537, 1, 1, 1, 1, 1,
0.2184027, -0.4558293, 3.984353, 1, 1, 1, 1, 1,
0.2230998, 0.5687367, 1.374933, 1, 1, 1, 1, 1,
0.2290135, 2.112582, 2.26038, 1, 1, 1, 1, 1,
0.2416256, -0.7771596, 2.874233, 1, 1, 1, 1, 1,
0.242811, 0.2669484, -2.137781, 1, 1, 1, 1, 1,
0.2496711, -0.2507057, 1.346028, 1, 1, 1, 1, 1,
0.255212, 0.1606112, 0.1491914, 1, 1, 1, 1, 1,
0.2558272, -0.3944183, 1.403322, 1, 1, 1, 1, 1,
0.2567558, -0.8317457, 2.205288, 1, 1, 1, 1, 1,
0.2578909, -3.180216, 4.47448, 1, 1, 1, 1, 1,
0.2603469, 1.536872, -0.3560029, 1, 1, 1, 1, 1,
0.2617823, 1.667788, -2.049363, 0, 0, 1, 1, 1,
0.2631121, 0.5660868, -0.4326955, 1, 0, 0, 1, 1,
0.2635931, 1.279533, 0.8086239, 1, 0, 0, 1, 1,
0.2640232, -1.090125, 2.722784, 1, 0, 0, 1, 1,
0.2667185, 1.307624, -0.9815295, 1, 0, 0, 1, 1,
0.2704769, 0.3930524, 0.344331, 1, 0, 0, 1, 1,
0.27403, 0.8133087, 0.815246, 0, 0, 0, 1, 1,
0.2764172, 1.415377, 0.7447082, 0, 0, 0, 1, 1,
0.2840854, -2.134346, 3.357696, 0, 0, 0, 1, 1,
0.2855791, 0.5756778, 1.648832, 0, 0, 0, 1, 1,
0.2865105, -0.9534056, 2.720954, 0, 0, 0, 1, 1,
0.2897627, 0.75165, 0.1975145, 0, 0, 0, 1, 1,
0.2898965, 0.9280619, 0.550432, 0, 0, 0, 1, 1,
0.2916985, -0.0594648, 2.410702, 1, 1, 1, 1, 1,
0.2963507, 0.754316, 1.458148, 1, 1, 1, 1, 1,
0.2977751, 0.9179136, 0.9583789, 1, 1, 1, 1, 1,
0.2987052, 0.5594419, -0.1354465, 1, 1, 1, 1, 1,
0.3024734, 0.5504902, 1.322938, 1, 1, 1, 1, 1,
0.3087907, -0.9133248, 3.720763, 1, 1, 1, 1, 1,
0.322379, 0.4641976, 1.194114, 1, 1, 1, 1, 1,
0.3246897, 0.3980187, -1.318148, 1, 1, 1, 1, 1,
0.3294634, 1.372213, -0.1435205, 1, 1, 1, 1, 1,
0.3329704, 1.208848, -0.2881609, 1, 1, 1, 1, 1,
0.3339942, -2.058739, 4.86332, 1, 1, 1, 1, 1,
0.3372622, 0.3238663, 0.3374245, 1, 1, 1, 1, 1,
0.3377143, -0.06992674, 1.692548, 1, 1, 1, 1, 1,
0.3455284, -0.6993804, 4.285882, 1, 1, 1, 1, 1,
0.3474934, -2.306776, 2.171273, 1, 1, 1, 1, 1,
0.3518966, 2.432456, 0.715581, 0, 0, 1, 1, 1,
0.3643422, 1.460253, 1.106964, 1, 0, 0, 1, 1,
0.3697183, 0.1114481, 1.411582, 1, 0, 0, 1, 1,
0.3713662, -0.317345, 2.464906, 1, 0, 0, 1, 1,
0.3815371, 0.7101036, -2.305909, 1, 0, 0, 1, 1,
0.384268, 1.48919, 0.2423139, 1, 0, 0, 1, 1,
0.3874238, -0.860527, 1.967687, 0, 0, 0, 1, 1,
0.3875648, -1.090472, 2.016342, 0, 0, 0, 1, 1,
0.3899621, 0.03302656, 2.21336, 0, 0, 0, 1, 1,
0.3901333, 0.9697408, -0.2969556, 0, 0, 0, 1, 1,
0.3901413, -1.669486, 0.1030412, 0, 0, 0, 1, 1,
0.3934262, -0.4101514, 2.676396, 0, 0, 0, 1, 1,
0.401378, -1.127981, 3.02856, 0, 0, 0, 1, 1,
0.4015717, -0.6356368, 3.325684, 1, 1, 1, 1, 1,
0.4067429, -0.8478823, 2.531167, 1, 1, 1, 1, 1,
0.4072883, -0.04503502, 2.333781, 1, 1, 1, 1, 1,
0.4077692, 0.07342956, 2.040564, 1, 1, 1, 1, 1,
0.4128157, 0.9027955, -0.7999278, 1, 1, 1, 1, 1,
0.4147025, -0.7675833, 1.686019, 1, 1, 1, 1, 1,
0.4151525, 1.242613, 0.8266451, 1, 1, 1, 1, 1,
0.4181741, 0.1711987, -1.092415, 1, 1, 1, 1, 1,
0.4184731, -0.9636703, 2.94031, 1, 1, 1, 1, 1,
0.4214869, -0.02176309, 1.160148, 1, 1, 1, 1, 1,
0.4285137, -0.6872947, 1.824343, 1, 1, 1, 1, 1,
0.4291686, -0.4602171, 2.810053, 1, 1, 1, 1, 1,
0.4313922, 0.3360685, 0.8855917, 1, 1, 1, 1, 1,
0.4333687, -0.3767496, 1.601888, 1, 1, 1, 1, 1,
0.4360621, -1.685075, 2.18444, 1, 1, 1, 1, 1,
0.4374166, 0.9487232, 0.2963927, 0, 0, 1, 1, 1,
0.4411106, -1.674938, 3.900801, 1, 0, 0, 1, 1,
0.4419321, 0.7840446, 0.4609971, 1, 0, 0, 1, 1,
0.4441257, -0.3819936, 3.027437, 1, 0, 0, 1, 1,
0.4454996, 0.05338195, 2.624269, 1, 0, 0, 1, 1,
0.4483441, -0.1532707, 1.006405, 1, 0, 0, 1, 1,
0.4489543, -0.9143021, -0.2583832, 0, 0, 0, 1, 1,
0.4503499, 0.2448581, 2.247098, 0, 0, 0, 1, 1,
0.4528053, -0.5179276, 2.749979, 0, 0, 0, 1, 1,
0.454056, -0.7491236, 2.06622, 0, 0, 0, 1, 1,
0.4579643, 0.8603883, -0.2215125, 0, 0, 0, 1, 1,
0.4649344, 0.6064459, 0.5011669, 0, 0, 0, 1, 1,
0.473993, 1.286197, 1.640834, 0, 0, 0, 1, 1,
0.4743674, -0.8192763, 2.043803, 1, 1, 1, 1, 1,
0.4772789, -0.7666937, 3.94472, 1, 1, 1, 1, 1,
0.4788411, -0.7146203, 3.636652, 1, 1, 1, 1, 1,
0.4811368, 0.8134806, 2.347792, 1, 1, 1, 1, 1,
0.4845685, -0.7565651, 2.581566, 1, 1, 1, 1, 1,
0.4857402, 0.3980909, 1.44981, 1, 1, 1, 1, 1,
0.4890606, -0.5064825, 1.096638, 1, 1, 1, 1, 1,
0.4965036, -2.641762, 3.819406, 1, 1, 1, 1, 1,
0.4989671, 1.857902, 1.1229, 1, 1, 1, 1, 1,
0.5025116, 0.09023, 1.282944, 1, 1, 1, 1, 1,
0.5074721, 0.4911853, -0.213595, 1, 1, 1, 1, 1,
0.5141538, 0.1316208, 1.039221, 1, 1, 1, 1, 1,
0.5182886, 0.3822525, 2.042605, 1, 1, 1, 1, 1,
0.5183114, -1.511792, 3.251423, 1, 1, 1, 1, 1,
0.5196972, 1.213698, 2.359088, 1, 1, 1, 1, 1,
0.5216394, 0.7394194, -0.6852739, 0, 0, 1, 1, 1,
0.525395, 0.8903205, 0.1650166, 1, 0, 0, 1, 1,
0.5303903, 0.6458923, 0.9777307, 1, 0, 0, 1, 1,
0.5340976, -0.4682798, 1.588068, 1, 0, 0, 1, 1,
0.5342891, -0.1099724, -0.0906983, 1, 0, 0, 1, 1,
0.5351324, -0.9872565, 3.888677, 1, 0, 0, 1, 1,
0.5352899, 0.4664938, 0.5844543, 0, 0, 0, 1, 1,
0.5360206, 0.6055782, 2.101785, 0, 0, 0, 1, 1,
0.5374295, -0.8354666, 2.206661, 0, 0, 0, 1, 1,
0.5375273, -0.9053642, 4.290881, 0, 0, 0, 1, 1,
0.5396663, -0.7014235, 3.017733, 0, 0, 0, 1, 1,
0.5399101, 0.6630262, 2.147415, 0, 0, 0, 1, 1,
0.5439474, 0.4004091, 0.1084576, 0, 0, 0, 1, 1,
0.5480162, 0.2203755, 1.530175, 1, 1, 1, 1, 1,
0.5493774, 1.728181, 0.6931242, 1, 1, 1, 1, 1,
0.5495548, -1.00389, 3.059527, 1, 1, 1, 1, 1,
0.5507495, 0.6977473, 0.04501966, 1, 1, 1, 1, 1,
0.5538589, 0.6132982, 1.864071, 1, 1, 1, 1, 1,
0.5610179, -0.9222982, 2.048257, 1, 1, 1, 1, 1,
0.561156, 0.4079091, -0.03926192, 1, 1, 1, 1, 1,
0.5625697, 1.823211, -2.421839, 1, 1, 1, 1, 1,
0.5652066, -1.006945, 4.010544, 1, 1, 1, 1, 1,
0.5684187, 0.5359819, 0.8251132, 1, 1, 1, 1, 1,
0.5705289, 0.5083637, -0.08518174, 1, 1, 1, 1, 1,
0.5791033, 0.7050031, 1.515872, 1, 1, 1, 1, 1,
0.5845738, -1.856954, 3.853561, 1, 1, 1, 1, 1,
0.5888297, 1.30394, -0.1695991, 1, 1, 1, 1, 1,
0.5899058, -0.3843144, 1.338337, 1, 1, 1, 1, 1,
0.5942269, 0.7591149, 1.256781, 0, 0, 1, 1, 1,
0.5985194, -0.4807329, 2.128313, 1, 0, 0, 1, 1,
0.5986915, 0.2008705, 1.313214, 1, 0, 0, 1, 1,
0.6030793, -0.8439415, 2.130696, 1, 0, 0, 1, 1,
0.6072065, 0.9219445, -0.0869805, 1, 0, 0, 1, 1,
0.6094572, -0.9767987, 1.081759, 1, 0, 0, 1, 1,
0.6097273, 1.093072, 1.643165, 0, 0, 0, 1, 1,
0.610251, -1.153018, 2.097925, 0, 0, 0, 1, 1,
0.6125582, 1.149906, -0.4300646, 0, 0, 0, 1, 1,
0.6174174, -0.3754656, 1.907814, 0, 0, 0, 1, 1,
0.620617, 1.824706, 1.527243, 0, 0, 0, 1, 1,
0.622172, -0.2470676, 3.203092, 0, 0, 0, 1, 1,
0.6238376, -0.263429, 1.915577, 0, 0, 0, 1, 1,
0.6271425, 0.2980321, 2.894701, 1, 1, 1, 1, 1,
0.6303277, 0.01310716, 0.8460264, 1, 1, 1, 1, 1,
0.6306573, 0.25665, 1.086785, 1, 1, 1, 1, 1,
0.6319653, 2.539188, 0.01897319, 1, 1, 1, 1, 1,
0.6348339, -0.5479355, 3.245034, 1, 1, 1, 1, 1,
0.636553, -0.7238456, 2.508659, 1, 1, 1, 1, 1,
0.6365958, 0.8571585, 1.70315, 1, 1, 1, 1, 1,
0.6366687, -1.159659, 3.93667, 1, 1, 1, 1, 1,
0.6399364, 0.2373821, 1.870837, 1, 1, 1, 1, 1,
0.6451986, 1.259709, 0.2314513, 1, 1, 1, 1, 1,
0.6455919, -0.3785524, 2.493716, 1, 1, 1, 1, 1,
0.649736, 0.2677886, 2.567135, 1, 1, 1, 1, 1,
0.6516533, 2.37394, 0.7896834, 1, 1, 1, 1, 1,
0.6518995, 0.9201266, -0.1463847, 1, 1, 1, 1, 1,
0.653329, 1.296997, 0.8659778, 1, 1, 1, 1, 1,
0.6598651, 0.4857019, 0.06182856, 0, 0, 1, 1, 1,
0.6601316, -0.7992815, 2.71611, 1, 0, 0, 1, 1,
0.6634371, 0.1633088, 0.7728798, 1, 0, 0, 1, 1,
0.6650059, -1.373046, 4.638015, 1, 0, 0, 1, 1,
0.6685795, 0.2247179, 0.9078814, 1, 0, 0, 1, 1,
0.6695861, 0.07770356, 0.2986756, 1, 0, 0, 1, 1,
0.6729427, 1.399064, 1.728066, 0, 0, 0, 1, 1,
0.6774916, 0.201004, 0.4466993, 0, 0, 0, 1, 1,
0.6809435, 0.9957641, 0.5830945, 0, 0, 0, 1, 1,
0.6830898, -0.1817686, 2.387851, 0, 0, 0, 1, 1,
0.6863785, 0.6292614, 2.014019, 0, 0, 0, 1, 1,
0.6869531, 0.1236174, 0.6040246, 0, 0, 0, 1, 1,
0.6888726, -0.4234133, 1.735495, 0, 0, 0, 1, 1,
0.6900297, -0.2502697, 3.865653, 1, 1, 1, 1, 1,
0.6915002, -0.6456663, 1.597468, 1, 1, 1, 1, 1,
0.6948491, 0.3897917, 1.919607, 1, 1, 1, 1, 1,
0.6957779, 0.1673768, 0.3405218, 1, 1, 1, 1, 1,
0.6963651, -1.162974, 2.619822, 1, 1, 1, 1, 1,
0.6988726, -1.230156, 3.552466, 1, 1, 1, 1, 1,
0.6993074, 0.6590169, 0.4282524, 1, 1, 1, 1, 1,
0.7000433, -0.486918, 2.312236, 1, 1, 1, 1, 1,
0.7005744, -0.1425981, 3.170788, 1, 1, 1, 1, 1,
0.7039552, -0.8019189, 2.68038, 1, 1, 1, 1, 1,
0.7069772, 0.3007021, 1.880625, 1, 1, 1, 1, 1,
0.7073525, 0.08060037, 2.371886, 1, 1, 1, 1, 1,
0.7114716, -2.045134, 5.271087, 1, 1, 1, 1, 1,
0.7121799, -0.3879698, 2.29504, 1, 1, 1, 1, 1,
0.7121899, -0.8422032, 2.48979, 1, 1, 1, 1, 1,
0.7196456, 0.8888372, 0.9904063, 0, 0, 1, 1, 1,
0.7279061, -0.0773728, 3.125677, 1, 0, 0, 1, 1,
0.7331095, 0.7534419, -0.8856757, 1, 0, 0, 1, 1,
0.7393742, -1.552508, 2.338396, 1, 0, 0, 1, 1,
0.7449521, 1.830661, 2.560354, 1, 0, 0, 1, 1,
0.7456177, 1.885631, 0.9621034, 1, 0, 0, 1, 1,
0.7469468, 1.58637, 0.8455909, 0, 0, 0, 1, 1,
0.7549775, 0.1080048, 2.598852, 0, 0, 0, 1, 1,
0.7556103, 1.689196, -1.459955, 0, 0, 0, 1, 1,
0.7558052, -1.872367, 2.081421, 0, 0, 0, 1, 1,
0.7564104, -0.08712604, 0.833805, 0, 0, 0, 1, 1,
0.7600116, -1.071316, 2.447755, 0, 0, 0, 1, 1,
0.7627718, -0.6468964, 3.03212, 0, 0, 0, 1, 1,
0.763131, -0.3950724, 3.590077, 1, 1, 1, 1, 1,
0.7714853, 0.6403668, 1.213608, 1, 1, 1, 1, 1,
0.7730159, 0.9900325, 1.109425, 1, 1, 1, 1, 1,
0.7739437, 1.263741, 0.03835911, 1, 1, 1, 1, 1,
0.7761505, 0.2903925, -0.7806565, 1, 1, 1, 1, 1,
0.7816659, -0.5150257, 3.413282, 1, 1, 1, 1, 1,
0.7837465, 1.623634, -1.617681, 1, 1, 1, 1, 1,
0.7890702, -0.6087674, 0.6899937, 1, 1, 1, 1, 1,
0.7907341, 0.3361516, 0.7375405, 1, 1, 1, 1, 1,
0.7938291, 0.2420937, 1.704218, 1, 1, 1, 1, 1,
0.799055, -2.360236, 3.256222, 1, 1, 1, 1, 1,
0.8026385, -0.393757, 1.221828, 1, 1, 1, 1, 1,
0.8038504, 0.536667, 0.2377128, 1, 1, 1, 1, 1,
0.8069503, 1.052734, 0.5057033, 1, 1, 1, 1, 1,
0.8111879, 1.640432, 1.176261, 1, 1, 1, 1, 1,
0.8114551, 0.6457443, 0.7685373, 0, 0, 1, 1, 1,
0.8181699, 0.399153, -0.04016515, 1, 0, 0, 1, 1,
0.8193145, -0.08465502, 3.237187, 1, 0, 0, 1, 1,
0.8199949, 0.6646376, 1.43477, 1, 0, 0, 1, 1,
0.8223473, 0.4101652, 0.9809748, 1, 0, 0, 1, 1,
0.8226444, -0.3925427, 2.717672, 1, 0, 0, 1, 1,
0.8235398, 0.4969033, 2.199947, 0, 0, 0, 1, 1,
0.8265017, -0.0510899, 4.792068, 0, 0, 0, 1, 1,
0.8279731, 2.01719, 0.8689097, 0, 0, 0, 1, 1,
0.830998, 1.780451, 1.040617, 0, 0, 0, 1, 1,
0.8332094, 0.7373406, 0.3730602, 0, 0, 0, 1, 1,
0.8339695, 1.255011, -0.335571, 0, 0, 0, 1, 1,
0.8342572, 1.542876, 1.197282, 0, 0, 0, 1, 1,
0.8365325, 0.2293378, 1.332391, 1, 1, 1, 1, 1,
0.8376778, 0.2782492, 1.245899, 1, 1, 1, 1, 1,
0.8394654, -0.5466082, 3.235046, 1, 1, 1, 1, 1,
0.8442484, 0.7711928, 1.592365, 1, 1, 1, 1, 1,
0.846315, -0.4687194, 1.434582, 1, 1, 1, 1, 1,
0.8479878, -0.2401826, 2.226373, 1, 1, 1, 1, 1,
0.8509227, -2.997741, 5.034634, 1, 1, 1, 1, 1,
0.8553168, -0.1183976, 2.252778, 1, 1, 1, 1, 1,
0.8586448, -1.840176, 2.24767, 1, 1, 1, 1, 1,
0.8594934, -0.8580328, 2.72564, 1, 1, 1, 1, 1,
0.8606454, -0.01672491, 0.5111122, 1, 1, 1, 1, 1,
0.8631036, -1.1535, 1.930078, 1, 1, 1, 1, 1,
0.8664346, 0.1372616, 0.849878, 1, 1, 1, 1, 1,
0.8719279, -1.077069, 2.435458, 1, 1, 1, 1, 1,
0.8823795, -0.9104908, 0.8551729, 1, 1, 1, 1, 1,
0.8828431, -0.02291913, 0.456761, 0, 0, 1, 1, 1,
0.8842155, 0.2710742, 0.4634093, 1, 0, 0, 1, 1,
0.8864039, -0.8322998, 2.845881, 1, 0, 0, 1, 1,
0.887482, 0.5366763, 1.328954, 1, 0, 0, 1, 1,
0.8943281, -1.162133, 4.342957, 1, 0, 0, 1, 1,
0.8947619, 0.1160049, 1.609452, 1, 0, 0, 1, 1,
0.895153, 0.2834785, 1.586575, 0, 0, 0, 1, 1,
0.898841, 0.2784521, 1.248529, 0, 0, 0, 1, 1,
0.8997578, -0.3120106, 1.594014, 0, 0, 0, 1, 1,
0.9103161, 0.6323905, 1.764918, 0, 0, 0, 1, 1,
0.9112303, -0.5343794, 4.124387, 0, 0, 0, 1, 1,
0.9135863, 0.4094463, 0.332472, 0, 0, 0, 1, 1,
0.9151228, 0.05768186, 1.399684, 0, 0, 0, 1, 1,
0.9204302, 0.9432025, 2.245595, 1, 1, 1, 1, 1,
0.9290804, 1.167495, 1.104468, 1, 1, 1, 1, 1,
0.9382652, 0.2717446, -0.207864, 1, 1, 1, 1, 1,
0.9441243, -0.1679748, 1.080991, 1, 1, 1, 1, 1,
0.9472545, -0.2970122, 1.434186, 1, 1, 1, 1, 1,
0.9594603, 0.4018403, -0.543021, 1, 1, 1, 1, 1,
0.9613286, 0.8113596, 0.4253809, 1, 1, 1, 1, 1,
0.9654368, -1.537037, 0.3923846, 1, 1, 1, 1, 1,
0.9684554, 0.3815546, 2.368856, 1, 1, 1, 1, 1,
0.9725133, 0.6941456, -0.4766122, 1, 1, 1, 1, 1,
0.9751399, 0.17043, 1.88616, 1, 1, 1, 1, 1,
0.9807017, -1.55611, 4.157648, 1, 1, 1, 1, 1,
0.9851046, -1.622645, 2.649953, 1, 1, 1, 1, 1,
0.9893579, -0.253846, 2.33709, 1, 1, 1, 1, 1,
0.9932147, 0.4420542, -1.371708, 1, 1, 1, 1, 1,
1.009098, 0.6094781, -0.6739478, 0, 0, 1, 1, 1,
1.009671, 0.7033371, -0.4773899, 1, 0, 0, 1, 1,
1.012124, -0.3032404, 1.313869, 1, 0, 0, 1, 1,
1.016345, 0.5932547, -0.3135429, 1, 0, 0, 1, 1,
1.018738, -1.374322, 2.516726, 1, 0, 0, 1, 1,
1.018833, 0.4587137, 0.6680426, 1, 0, 0, 1, 1,
1.01924, -0.4427564, 1.46476, 0, 0, 0, 1, 1,
1.021823, 1.800771, -0.03749079, 0, 0, 0, 1, 1,
1.028535, -0.7004143, 4.562429, 0, 0, 0, 1, 1,
1.033185, 0.3226614, 2.029007, 0, 0, 0, 1, 1,
1.038344, 1.404578, 0.34155, 0, 0, 0, 1, 1,
1.041243, 1.376585, 0.2328467, 0, 0, 0, 1, 1,
1.041708, -1.92134, 2.787573, 0, 0, 0, 1, 1,
1.052497, -0.2938597, 0.7721463, 1, 1, 1, 1, 1,
1.053766, -1.029424, 2.851503, 1, 1, 1, 1, 1,
1.061127, 0.6993362, -0.2735096, 1, 1, 1, 1, 1,
1.070477, -0.6353337, 1.135472, 1, 1, 1, 1, 1,
1.071838, -1.877562, 2.246343, 1, 1, 1, 1, 1,
1.07276, 0.6528215, -0.1388654, 1, 1, 1, 1, 1,
1.073991, 1.897158, -0.5463938, 1, 1, 1, 1, 1,
1.07453, -0.3650045, 0.3047392, 1, 1, 1, 1, 1,
1.081002, -2.577131, 2.548727, 1, 1, 1, 1, 1,
1.081903, -1.636939, 4.077996, 1, 1, 1, 1, 1,
1.086947, -0.8983777, 1.640681, 1, 1, 1, 1, 1,
1.086992, -0.5253084, 3.035674, 1, 1, 1, 1, 1,
1.088886, -1.763402, 2.123374, 1, 1, 1, 1, 1,
1.093777, -0.9012578, 2.328749, 1, 1, 1, 1, 1,
1.094834, -0.4173852, 2.284676, 1, 1, 1, 1, 1,
1.103244, -0.506229, 1.96726, 0, 0, 1, 1, 1,
1.107534, 0.3045471, 0.5973912, 1, 0, 0, 1, 1,
1.110511, 0.1561715, 3.371882, 1, 0, 0, 1, 1,
1.114048, -0.6930767, -0.7089179, 1, 0, 0, 1, 1,
1.119476, -1.447217, 1.676177, 1, 0, 0, 1, 1,
1.126911, 0.03614824, 0.4147611, 1, 0, 0, 1, 1,
1.138375, -1.374361, 3.065318, 0, 0, 0, 1, 1,
1.144973, -0.2298951, 2.001904, 0, 0, 0, 1, 1,
1.147545, -0.4740936, 2.366621, 0, 0, 0, 1, 1,
1.159904, -1.746718, 1.990935, 0, 0, 0, 1, 1,
1.160457, -1.225568, 3.854611, 0, 0, 0, 1, 1,
1.163814, -0.05721881, 1.956834, 0, 0, 0, 1, 1,
1.168571, -0.3762363, 2.734948, 0, 0, 0, 1, 1,
1.17368, -0.3986026, 1.985632, 1, 1, 1, 1, 1,
1.177976, -0.06090731, 3.947572, 1, 1, 1, 1, 1,
1.179955, -0.001998894, -0.7950865, 1, 1, 1, 1, 1,
1.181143, -0.4514641, 2.737928, 1, 1, 1, 1, 1,
1.182347, -0.2666641, 0.2413684, 1, 1, 1, 1, 1,
1.186985, 1.273051, 0.7399124, 1, 1, 1, 1, 1,
1.19978, 0.512119, 1.320962, 1, 1, 1, 1, 1,
1.205917, -2.700953, 1.953238, 1, 1, 1, 1, 1,
1.210562, -0.5402851, 1.556717, 1, 1, 1, 1, 1,
1.211354, -0.1530892, 1.537676, 1, 1, 1, 1, 1,
1.214593, 0.9728955, -0.243484, 1, 1, 1, 1, 1,
1.214731, -0.2302099, 1.694899, 1, 1, 1, 1, 1,
1.220189, 1.858414, 1.068309, 1, 1, 1, 1, 1,
1.220851, -0.3431756, 0.09366991, 1, 1, 1, 1, 1,
1.224101, 1.072303, 0.8763174, 1, 1, 1, 1, 1,
1.228708, 1.044577, 0.2065919, 0, 0, 1, 1, 1,
1.243122, 0.3271628, 1.756955, 1, 0, 0, 1, 1,
1.244863, 0.5116343, 1.770886, 1, 0, 0, 1, 1,
1.246739, -1.42611, 4.297362, 1, 0, 0, 1, 1,
1.252133, 0.8238893, 1.503868, 1, 0, 0, 1, 1,
1.253419, -0.5553485, 1.709203, 1, 0, 0, 1, 1,
1.25695, -0.8186712, 2.786981, 0, 0, 0, 1, 1,
1.258845, 0.7274377, -0.2256927, 0, 0, 0, 1, 1,
1.262638, -0.5081286, 2.25452, 0, 0, 0, 1, 1,
1.26321, -0.2835196, 1.364317, 0, 0, 0, 1, 1,
1.26323, 0.8737507, 0.07070313, 0, 0, 0, 1, 1,
1.26801, -0.6696945, 1.057478, 0, 0, 0, 1, 1,
1.271323, -0.8904589, 1.302292, 0, 0, 0, 1, 1,
1.281034, 0.329901, 0.7212269, 1, 1, 1, 1, 1,
1.282724, -0.3096045, 4.061469, 1, 1, 1, 1, 1,
1.284253, 0.3007181, 0.1168218, 1, 1, 1, 1, 1,
1.306996, -1.74953, 3.537968, 1, 1, 1, 1, 1,
1.309468, -0.9327905, 1.874315, 1, 1, 1, 1, 1,
1.325807, -0.3212011, 1.898848, 1, 1, 1, 1, 1,
1.329135, -0.6588709, 2.856345, 1, 1, 1, 1, 1,
1.343866, -0.8547689, 1.190828, 1, 1, 1, 1, 1,
1.345641, 1.379707, 1.104182, 1, 1, 1, 1, 1,
1.357044, -1.429932, 2.224085, 1, 1, 1, 1, 1,
1.357136, -0.8184927, 2.252402, 1, 1, 1, 1, 1,
1.363097, -1.990736, 1.196192, 1, 1, 1, 1, 1,
1.371333, 0.1711714, 2.717937, 1, 1, 1, 1, 1,
1.373641, -0.618748, 2.960703, 1, 1, 1, 1, 1,
1.380585, -0.4162404, 1.169059, 1, 1, 1, 1, 1,
1.380603, 1.111956, 1.509728, 0, 0, 1, 1, 1,
1.381858, -1.092559, 3.055626, 1, 0, 0, 1, 1,
1.384274, 0.2034552, 1.615945, 1, 0, 0, 1, 1,
1.386788, -2.58741, 2.659271, 1, 0, 0, 1, 1,
1.386853, 0.5703461, 1.50808, 1, 0, 0, 1, 1,
1.404412, -0.05483933, 0.7738262, 1, 0, 0, 1, 1,
1.404738, 1.04266, 2.430177, 0, 0, 0, 1, 1,
1.405324, 0.2635596, 0.9502354, 0, 0, 0, 1, 1,
1.407589, -0.2486968, 3.017354, 0, 0, 0, 1, 1,
1.411322, -1.457628, 2.543258, 0, 0, 0, 1, 1,
1.418362, -2.168102, 3.160545, 0, 0, 0, 1, 1,
1.425485, 1.120387, 0.9192725, 0, 0, 0, 1, 1,
1.432345, 1.010281, 0.0447353, 0, 0, 0, 1, 1,
1.472616, -0.6204534, 0.934916, 1, 1, 1, 1, 1,
1.481827, 0.5452384, 1.943964, 1, 1, 1, 1, 1,
1.482187, -0.1104981, 1.45405, 1, 1, 1, 1, 1,
1.48753, -1.842265, 2.306368, 1, 1, 1, 1, 1,
1.494, -0.2800871, -0.4576134, 1, 1, 1, 1, 1,
1.498359, 0.8209029, 2.244146, 1, 1, 1, 1, 1,
1.509928, -0.5531015, 2.362231, 1, 1, 1, 1, 1,
1.519149, -0.9214066, 1.377012, 1, 1, 1, 1, 1,
1.520703, -1.571679, 2.729952, 1, 1, 1, 1, 1,
1.550072, -0.2175516, 0.7136462, 1, 1, 1, 1, 1,
1.576787, 0.1935158, 0.8451091, 1, 1, 1, 1, 1,
1.582235, -0.1865966, 0.7632077, 1, 1, 1, 1, 1,
1.582333, -0.5465729, 1.470569, 1, 1, 1, 1, 1,
1.586676, 1.172733, 0.8561856, 1, 1, 1, 1, 1,
1.600586, 1.676949, 0.8807534, 1, 1, 1, 1, 1,
1.609914, 0.4212314, 2.135131, 0, 0, 1, 1, 1,
1.612653, 0.6808102, 2.774641, 1, 0, 0, 1, 1,
1.612808, -0.2983751, 1.449898, 1, 0, 0, 1, 1,
1.622965, -0.9816027, 2.208368, 1, 0, 0, 1, 1,
1.63614, 0.002035814, 1.784345, 1, 0, 0, 1, 1,
1.650778, 0.1438936, -0.6239981, 1, 0, 0, 1, 1,
1.654844, 0.5072514, 1.482559, 0, 0, 0, 1, 1,
1.670744, -0.6083886, 2.544659, 0, 0, 0, 1, 1,
1.676934, -0.2820827, 1.695333, 0, 0, 0, 1, 1,
1.713899, -0.4549377, 2.722847, 0, 0, 0, 1, 1,
1.719898, 1.870218, 0.5284004, 0, 0, 0, 1, 1,
1.722867, 0.1534904, 1.330909, 0, 0, 0, 1, 1,
1.723769, 1.897489, 1.576982, 0, 0, 0, 1, 1,
1.72505, -1.272572, 2.114395, 1, 1, 1, 1, 1,
1.740105, 0.3475005, 1.496603, 1, 1, 1, 1, 1,
1.752393, 0.1078008, 3.090153, 1, 1, 1, 1, 1,
1.761507, -0.9048325, 1.613192, 1, 1, 1, 1, 1,
1.762625, 2.016934, 1.540306, 1, 1, 1, 1, 1,
1.790616, -0.8549587, 4.148752, 1, 1, 1, 1, 1,
1.790638, -0.7185797, 1.372327, 1, 1, 1, 1, 1,
1.859986, -0.2605726, 2.596634, 1, 1, 1, 1, 1,
1.872796, -1.975404, 2.579834, 1, 1, 1, 1, 1,
1.889878, -0.4960594, -0.373924, 1, 1, 1, 1, 1,
1.915043, 1.963565, 1.542862, 1, 1, 1, 1, 1,
1.919308, -0.9795322, 0.7838628, 1, 1, 1, 1, 1,
1.934769, 1.003774, 0.3274365, 1, 1, 1, 1, 1,
1.941187, 0.01743412, 2.106248, 1, 1, 1, 1, 1,
1.948547, -0.2698423, 0.7960818, 1, 1, 1, 1, 1,
1.977711, 0.8007552, 1.732452, 0, 0, 1, 1, 1,
1.980521, 0.7929539, 0.6570587, 1, 0, 0, 1, 1,
2.042595, -0.4069443, 1.405987, 1, 0, 0, 1, 1,
2.081029, 0.1564042, 1.789872, 1, 0, 0, 1, 1,
2.098582, 2.156618, 0.4596853, 1, 0, 0, 1, 1,
2.119028, 0.6638256, 0.9185726, 1, 0, 0, 1, 1,
2.126343, 0.6721942, 0.05880945, 0, 0, 0, 1, 1,
2.184278, -0.482448, 1.875784, 0, 0, 0, 1, 1,
2.247541, -0.4369856, 2.281789, 0, 0, 0, 1, 1,
2.271433, -1.101531, 2.378565, 0, 0, 0, 1, 1,
2.281913, -1.412792, 2.848002, 0, 0, 0, 1, 1,
2.307958, 0.4891469, 1.939124, 0, 0, 0, 1, 1,
2.338547, 0.2443959, 2.19761, 0, 0, 0, 1, 1,
2.416945, -0.328331, 2.185558, 1, 1, 1, 1, 1,
2.430436, -0.05475636, 1.704382, 1, 1, 1, 1, 1,
2.465961, -1.76599, 2.041703, 1, 1, 1, 1, 1,
2.514717, -0.9923552, 0.5823541, 1, 1, 1, 1, 1,
2.528162, -0.2326417, 3.71841, 1, 1, 1, 1, 1,
2.538203, 0.3394739, 1.484478, 1, 1, 1, 1, 1,
3.051208, -1.392349, 1.385244, 1, 1, 1, 1, 1
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
var radius = 9.483798;
var distance = 33.31144;
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
mvMatrix.translate( -0.06171882, 0.09807479, 0.1905448 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.31144);
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
