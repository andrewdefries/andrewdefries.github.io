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
-3.08953, 1.420982, -1.408981, 1, 0, 0, 1,
-2.953681, 0.4060959, -2.325981, 1, 0.007843138, 0, 1,
-2.712878, -0.02236478, -1.353143, 1, 0.01176471, 0, 1,
-2.706977, -0.9976195, -1.189837, 1, 0.01960784, 0, 1,
-2.665967, -1.008538, -2.599716, 1, 0.02352941, 0, 1,
-2.650892, -0.4234865, -1.32948, 1, 0.03137255, 0, 1,
-2.449992, 0.9322616, -0.9905779, 1, 0.03529412, 0, 1,
-2.440026, -0.4035959, -0.396698, 1, 0.04313726, 0, 1,
-2.362898, 0.1309098, -0.4562099, 1, 0.04705882, 0, 1,
-2.35919, 0.4627335, 0.3909887, 1, 0.05490196, 0, 1,
-2.340241, 2.400687, 0.786863, 1, 0.05882353, 0, 1,
-2.296584, 2.03547, -3.071834, 1, 0.06666667, 0, 1,
-2.215237, -1.870642, -3.650686, 1, 0.07058824, 0, 1,
-2.197307, -0.1857411, -1.999334, 1, 0.07843138, 0, 1,
-2.138444, 1.648034, -0.2842461, 1, 0.08235294, 0, 1,
-2.097697, 1.190468, -1.71224, 1, 0.09019608, 0, 1,
-2.084603, 1.67011, -0.8271316, 1, 0.09411765, 0, 1,
-2.057308, -0.4478209, -1.138263, 1, 0.1019608, 0, 1,
-2.050891, 0.001440705, -2.324845, 1, 0.1098039, 0, 1,
-2.049612, -0.0002024765, -0.7718691, 1, 0.1137255, 0, 1,
-2.022642, 0.3586913, -1.713876, 1, 0.1215686, 0, 1,
-2.015547, 0.009427824, 0.0772626, 1, 0.1254902, 0, 1,
-2.014675, -0.9084827, -1.497528, 1, 0.1333333, 0, 1,
-1.989539, -1.318072, -0.7173465, 1, 0.1372549, 0, 1,
-1.98028, 0.6084397, -0.377016, 1, 0.145098, 0, 1,
-1.963221, 0.04329286, -0.6305959, 1, 0.1490196, 0, 1,
-1.957831, 0.6828723, -0.5960416, 1, 0.1568628, 0, 1,
-1.94701, -1.066738, -0.9698337, 1, 0.1607843, 0, 1,
-1.939145, 0.8823139, -1.941912, 1, 0.1686275, 0, 1,
-1.9118, 1.892989, 0.6732931, 1, 0.172549, 0, 1,
-1.896476, 0.3120207, -2.843822, 1, 0.1803922, 0, 1,
-1.889655, -0.4612237, -3.580121, 1, 0.1843137, 0, 1,
-1.882443, 0.1401742, -0.725596, 1, 0.1921569, 0, 1,
-1.877973, -0.4121798, 0.5114449, 1, 0.1960784, 0, 1,
-1.870441, -1.09295, -1.921948, 1, 0.2039216, 0, 1,
-1.86464, -1.398074, -3.342219, 1, 0.2117647, 0, 1,
-1.856548, -0.2610386, -0.3399325, 1, 0.2156863, 0, 1,
-1.836624, -0.2088482, -2.314037, 1, 0.2235294, 0, 1,
-1.835238, 1.421708, -2.692111, 1, 0.227451, 0, 1,
-1.835227, -0.6984394, -1.896411, 1, 0.2352941, 0, 1,
-1.832073, -0.8418199, -1.750761, 1, 0.2392157, 0, 1,
-1.806384, 0.177698, -2.272258, 1, 0.2470588, 0, 1,
-1.795882, 0.1499126, -1.517275, 1, 0.2509804, 0, 1,
-1.782076, -0.3113708, -2.175604, 1, 0.2588235, 0, 1,
-1.776144, 0.6503133, -1.900389, 1, 0.2627451, 0, 1,
-1.767957, 0.389402, 0.02489089, 1, 0.2705882, 0, 1,
-1.767809, -0.2468056, -2.123205, 1, 0.2745098, 0, 1,
-1.763975, -2.270431, -2.054995, 1, 0.282353, 0, 1,
-1.757289, 0.7681059, -1.377517, 1, 0.2862745, 0, 1,
-1.75342, 0.4753936, 0.5540377, 1, 0.2941177, 0, 1,
-1.749473, -0.5461208, -1.141104, 1, 0.3019608, 0, 1,
-1.745169, -0.4601589, -2.831905, 1, 0.3058824, 0, 1,
-1.741054, 0.5265108, -2.323084, 1, 0.3137255, 0, 1,
-1.724649, 0.590676, -0.7389709, 1, 0.3176471, 0, 1,
-1.718683, 0.3969035, -3.329921, 1, 0.3254902, 0, 1,
-1.70857, -0.5488913, -3.12167, 1, 0.3294118, 0, 1,
-1.692813, 0.1533082, -2.491266, 1, 0.3372549, 0, 1,
-1.688476, 0.5243911, 0.08719334, 1, 0.3411765, 0, 1,
-1.667079, 0.8050009, -0.6867443, 1, 0.3490196, 0, 1,
-1.666061, 0.5626109, -1.595238, 1, 0.3529412, 0, 1,
-1.665145, -0.9948729, -1.928236, 1, 0.3607843, 0, 1,
-1.646549, 1.431452, -0.08301158, 1, 0.3647059, 0, 1,
-1.643456, 0.2780075, -1.163155, 1, 0.372549, 0, 1,
-1.620595, -1.912296, -1.965648, 1, 0.3764706, 0, 1,
-1.61627, 0.4052745, -0.958685, 1, 0.3843137, 0, 1,
-1.60499, 0.03145096, -0.8237389, 1, 0.3882353, 0, 1,
-1.60297, 0.2927465, -0.5656434, 1, 0.3960784, 0, 1,
-1.594697, -0.9003751, -3.0054, 1, 0.4039216, 0, 1,
-1.586403, -0.9314178, -1.967362, 1, 0.4078431, 0, 1,
-1.583082, 0.1577472, -1.454421, 1, 0.4156863, 0, 1,
-1.57982, -1.127865, -2.151876, 1, 0.4196078, 0, 1,
-1.572252, -0.8947312, -0.7745052, 1, 0.427451, 0, 1,
-1.56018, -0.3563807, -1.215871, 1, 0.4313726, 0, 1,
-1.558997, 1.498523, -1.150853, 1, 0.4392157, 0, 1,
-1.546814, 0.5998164, 0.3050428, 1, 0.4431373, 0, 1,
-1.533672, 0.4692577, -1.36073, 1, 0.4509804, 0, 1,
-1.53151, 0.3936937, -1.531275, 1, 0.454902, 0, 1,
-1.52517, -1.061288, -2.096191, 1, 0.4627451, 0, 1,
-1.519153, 0.3142968, -1.468148, 1, 0.4666667, 0, 1,
-1.510728, -1.949329, -2.105837, 1, 0.4745098, 0, 1,
-1.506829, 0.7649738, -0.2331852, 1, 0.4784314, 0, 1,
-1.484303, -2.007306, -2.190258, 1, 0.4862745, 0, 1,
-1.469659, 0.7181288, -1.195693, 1, 0.4901961, 0, 1,
-1.463285, -1.492815, -2.02416, 1, 0.4980392, 0, 1,
-1.46324, -1.064427, -1.448255, 1, 0.5058824, 0, 1,
-1.457581, 0.896925, -0.9511063, 1, 0.509804, 0, 1,
-1.455894, 1.037324, 0.4029493, 1, 0.5176471, 0, 1,
-1.452264, 1.143769, -0.9014175, 1, 0.5215687, 0, 1,
-1.44953, 0.4929512, -2.192182, 1, 0.5294118, 0, 1,
-1.448323, 1.690722, -1.661379, 1, 0.5333334, 0, 1,
-1.442041, -0.7364321, -3.281638, 1, 0.5411765, 0, 1,
-1.433368, -1.25334, -2.577816, 1, 0.5450981, 0, 1,
-1.422075, 0.4443108, 0.01975979, 1, 0.5529412, 0, 1,
-1.420961, 1.336109, -0.9646628, 1, 0.5568628, 0, 1,
-1.418603, -1.117566, -1.678177, 1, 0.5647059, 0, 1,
-1.413075, 0.002667669, -0.6946903, 1, 0.5686275, 0, 1,
-1.407039, 0.7197055, -1.341945, 1, 0.5764706, 0, 1,
-1.39903, -1.236133, -2.581141, 1, 0.5803922, 0, 1,
-1.38984, -1.004458, -1.102829, 1, 0.5882353, 0, 1,
-1.388663, -2.557709, -1.363034, 1, 0.5921569, 0, 1,
-1.384031, 0.1386247, -1.363775, 1, 0.6, 0, 1,
-1.369808, -0.9738243, -2.041978, 1, 0.6078432, 0, 1,
-1.364952, -1.146884, -0.7983643, 1, 0.6117647, 0, 1,
-1.363419, -0.7566978, -2.632279, 1, 0.6196079, 0, 1,
-1.35818, -1.31383, -0.3649959, 1, 0.6235294, 0, 1,
-1.352188, 1.067418, -1.384851, 1, 0.6313726, 0, 1,
-1.351339, -0.1440443, -1.55564, 1, 0.6352941, 0, 1,
-1.346457, -0.242413, -1.165905, 1, 0.6431373, 0, 1,
-1.342208, 0.9267666, -1.620123, 1, 0.6470588, 0, 1,
-1.341182, -0.6623381, -2.54993, 1, 0.654902, 0, 1,
-1.322807, 0.5444018, -3.413898, 1, 0.6588235, 0, 1,
-1.317823, -0.8817672, -2.753047, 1, 0.6666667, 0, 1,
-1.308499, 0.6986445, -1.298062, 1, 0.6705883, 0, 1,
-1.289285, 0.7490273, -1.35219, 1, 0.6784314, 0, 1,
-1.286157, -1.542534, -1.901874, 1, 0.682353, 0, 1,
-1.281445, 1.507653, -2.626705, 1, 0.6901961, 0, 1,
-1.275861, 0.03589217, -1.355381, 1, 0.6941177, 0, 1,
-1.274061, -0.5247148, -1.474062, 1, 0.7019608, 0, 1,
-1.269473, 1.269252, -0.2595435, 1, 0.7098039, 0, 1,
-1.260643, -0.062166, -2.19209, 1, 0.7137255, 0, 1,
-1.252164, 0.1546319, -0.2512183, 1, 0.7215686, 0, 1,
-1.244128, 0.5771222, -1.863855, 1, 0.7254902, 0, 1,
-1.243752, -0.3805951, -2.191329, 1, 0.7333333, 0, 1,
-1.234691, -0.7780311, -1.75786, 1, 0.7372549, 0, 1,
-1.224268, -1.12588, -0.3644146, 1, 0.7450981, 0, 1,
-1.218453, -1.303049, -3.8925, 1, 0.7490196, 0, 1,
-1.218148, -0.8273307, -1.701107, 1, 0.7568628, 0, 1,
-1.211241, -0.7340763, -1.743318, 1, 0.7607843, 0, 1,
-1.205952, -0.1399985, -0.9615321, 1, 0.7686275, 0, 1,
-1.204713, 0.5038627, -0.4258776, 1, 0.772549, 0, 1,
-1.199518, 0.7597544, -1.000683, 1, 0.7803922, 0, 1,
-1.195943, 1.479326, 0.7065231, 1, 0.7843137, 0, 1,
-1.193018, -0.5679553, -0.8989009, 1, 0.7921569, 0, 1,
-1.192589, 0.12716, 0.971904, 1, 0.7960784, 0, 1,
-1.186689, 0.2626, -0.9295301, 1, 0.8039216, 0, 1,
-1.181988, -1.030166, -2.759221, 1, 0.8117647, 0, 1,
-1.176768, 0.1329745, -1.941443, 1, 0.8156863, 0, 1,
-1.172319, -0.7316967, -0.437819, 1, 0.8235294, 0, 1,
-1.170703, 0.5148025, -2.032062, 1, 0.827451, 0, 1,
-1.166833, 1.062847, -0.2378589, 1, 0.8352941, 0, 1,
-1.166049, 1.926584, 1.069318, 1, 0.8392157, 0, 1,
-1.16163, -0.2653101, -1.935305, 1, 0.8470588, 0, 1,
-1.155908, 0.05327074, -1.765308, 1, 0.8509804, 0, 1,
-1.155554, -1.027516, -2.465592, 1, 0.8588235, 0, 1,
-1.151549, 1.479995, -2.372168, 1, 0.8627451, 0, 1,
-1.150569, 1.230642, -1.44606, 1, 0.8705882, 0, 1,
-1.146367, 0.2753104, -1.193988, 1, 0.8745098, 0, 1,
-1.141745, -1.010437, -2.031646, 1, 0.8823529, 0, 1,
-1.139196, 2.322195, -1.439771, 1, 0.8862745, 0, 1,
-1.135201, -0.6758122, -2.540385, 1, 0.8941177, 0, 1,
-1.133354, 0.1908247, -1.509275, 1, 0.8980392, 0, 1,
-1.12617, -0.240664, -1.75839, 1, 0.9058824, 0, 1,
-1.124905, 0.02055008, -3.111, 1, 0.9137255, 0, 1,
-1.120641, 0.8730205, -1.516442, 1, 0.9176471, 0, 1,
-1.112771, 0.7480663, -1.499955, 1, 0.9254902, 0, 1,
-1.110627, -0.589098, -2.581015, 1, 0.9294118, 0, 1,
-1.109742, 0.4216487, -0.70033, 1, 0.9372549, 0, 1,
-1.103127, -0.5029225, -2.589549, 1, 0.9411765, 0, 1,
-1.100355, 0.09132381, -3.079867, 1, 0.9490196, 0, 1,
-1.09304, 0.4611951, 0.7811978, 1, 0.9529412, 0, 1,
-1.087032, 0.4158294, -2.215733, 1, 0.9607843, 0, 1,
-1.086839, 1.094077, -1.373479, 1, 0.9647059, 0, 1,
-1.08605, 0.7538368, -1.295688, 1, 0.972549, 0, 1,
-1.068252, -0.4055297, -3.745162, 1, 0.9764706, 0, 1,
-1.067964, -0.4843994, -1.830848, 1, 0.9843137, 0, 1,
-1.062243, -0.9384329, -1.47617, 1, 0.9882353, 0, 1,
-1.061621, 0.1489526, -1.352402, 1, 0.9960784, 0, 1,
-1.059773, 0.5954442, -1.225075, 0.9960784, 1, 0, 1,
-1.059485, -0.5377648, -3.050455, 0.9921569, 1, 0, 1,
-1.058758, 0.2401277, -2.299555, 0.9843137, 1, 0, 1,
-1.044715, 0.5015664, -0.7993321, 0.9803922, 1, 0, 1,
-1.040777, -0.5172496, -2.601671, 0.972549, 1, 0, 1,
-1.039989, -1.565164, -2.502772, 0.9686275, 1, 0, 1,
-1.039959, -1.081334, -1.938371, 0.9607843, 1, 0, 1,
-1.038089, 0.1549315, -2.409148, 0.9568627, 1, 0, 1,
-1.038057, -0.3761106, -1.121238, 0.9490196, 1, 0, 1,
-1.033157, -1.950641, -2.509529, 0.945098, 1, 0, 1,
-1.032199, -1.041206, -0.2791636, 0.9372549, 1, 0, 1,
-1.029613, 0.3472534, -1.811829, 0.9333333, 1, 0, 1,
-1.028341, -1.221587, -2.592544, 0.9254902, 1, 0, 1,
-1.019588, -1.172451, -1.841942, 0.9215686, 1, 0, 1,
-1.019, -0.8401649, -2.643897, 0.9137255, 1, 0, 1,
-1.017464, 0.5280177, -2.601362, 0.9098039, 1, 0, 1,
-1.015076, 1.280867, -0.9264959, 0.9019608, 1, 0, 1,
-1.014589, 0.4676833, -0.3364419, 0.8941177, 1, 0, 1,
-1.013514, 1.24529, -1.6003, 0.8901961, 1, 0, 1,
-1.010253, -0.1773596, -2.105952, 0.8823529, 1, 0, 1,
-1.009035, 1.209072, -0.9203943, 0.8784314, 1, 0, 1,
-1.000787, -0.5836872, -1.676288, 0.8705882, 1, 0, 1,
-0.9901645, -0.5049686, -0.9663038, 0.8666667, 1, 0, 1,
-0.98943, -1.10713, -2.533118, 0.8588235, 1, 0, 1,
-0.9876419, -1.749152, -2.48106, 0.854902, 1, 0, 1,
-0.9869277, 0.2348924, -2.377655, 0.8470588, 1, 0, 1,
-0.9843677, -1.386465, -3.481062, 0.8431373, 1, 0, 1,
-0.9790585, 1.414871, -0.623069, 0.8352941, 1, 0, 1,
-0.977527, -0.2219909, -1.546337, 0.8313726, 1, 0, 1,
-0.9769185, 1.322686, 1.467983, 0.8235294, 1, 0, 1,
-0.9767071, -0.7747998, -3.177734, 0.8196079, 1, 0, 1,
-0.969262, 0.5142673, -1.555365, 0.8117647, 1, 0, 1,
-0.9685769, -1.090735, -2.567988, 0.8078431, 1, 0, 1,
-0.9649703, 0.8430337, -1.119685, 0.8, 1, 0, 1,
-0.9633106, -0.6409134, -1.000733, 0.7921569, 1, 0, 1,
-0.9629647, 0.09624819, -2.362136, 0.7882353, 1, 0, 1,
-0.9602972, 1.078127, 0.240513, 0.7803922, 1, 0, 1,
-0.9486853, -1.416381, -2.765841, 0.7764706, 1, 0, 1,
-0.947872, 1.496148, -1.380663, 0.7686275, 1, 0, 1,
-0.938051, -1.117004, -0.7859042, 0.7647059, 1, 0, 1,
-0.9355606, 1.293969, -0.955128, 0.7568628, 1, 0, 1,
-0.9328234, 1.312446, 0.3413455, 0.7529412, 1, 0, 1,
-0.9324535, 1.073671, -1.371782, 0.7450981, 1, 0, 1,
-0.9311324, 0.1917738, -2.809053, 0.7411765, 1, 0, 1,
-0.9307364, -0.2429111, -0.0796703, 0.7333333, 1, 0, 1,
-0.9297583, 0.168068, -2.232319, 0.7294118, 1, 0, 1,
-0.9238605, -0.6596336, -1.709337, 0.7215686, 1, 0, 1,
-0.9233384, 1.079896, -1.803815, 0.7176471, 1, 0, 1,
-0.9227399, -0.184644, -3.054706, 0.7098039, 1, 0, 1,
-0.9202117, 0.03953465, 0.692525, 0.7058824, 1, 0, 1,
-0.9199045, 0.2859938, -0.3449447, 0.6980392, 1, 0, 1,
-0.9154543, -0.9402491, -3.055139, 0.6901961, 1, 0, 1,
-0.9131, -0.4835418, -3.073373, 0.6862745, 1, 0, 1,
-0.912605, 2.612139, 1.125878, 0.6784314, 1, 0, 1,
-0.9062902, 1.023978, -0.3280713, 0.6745098, 1, 0, 1,
-0.9058803, 2.469169, 0.2371264, 0.6666667, 1, 0, 1,
-0.9031737, 0.0806765, -1.409973, 0.6627451, 1, 0, 1,
-0.9007195, 0.1061924, -1.867393, 0.654902, 1, 0, 1,
-0.9007026, 0.3798839, -2.395332, 0.6509804, 1, 0, 1,
-0.9001349, 0.464407, -0.5379738, 0.6431373, 1, 0, 1,
-0.8847989, 0.8507642, 0.9474753, 0.6392157, 1, 0, 1,
-0.8833437, -1.280603, -3.455165, 0.6313726, 1, 0, 1,
-0.8826646, 0.2536106, -1.532915, 0.627451, 1, 0, 1,
-0.8803412, -0.3036471, -0.9739044, 0.6196079, 1, 0, 1,
-0.8738589, -0.1625234, -2.095128, 0.6156863, 1, 0, 1,
-0.8628315, 0.002600003, -0.4434527, 0.6078432, 1, 0, 1,
-0.8628129, -0.7124516, -2.859273, 0.6039216, 1, 0, 1,
-0.8627001, -0.7293827, -2.194377, 0.5960785, 1, 0, 1,
-0.8623657, -0.3252399, -2.589439, 0.5882353, 1, 0, 1,
-0.8618497, -1.592677, -3.545787, 0.5843138, 1, 0, 1,
-0.859867, -0.2805095, -1.208041, 0.5764706, 1, 0, 1,
-0.8544736, 1.09742, -1.623918, 0.572549, 1, 0, 1,
-0.8537891, -1.672535, -4.093868, 0.5647059, 1, 0, 1,
-0.8483908, 1.28448, 0.3187554, 0.5607843, 1, 0, 1,
-0.8460919, 1.386497, -0.4914777, 0.5529412, 1, 0, 1,
-0.8452337, 1.443193, 0.05024435, 0.5490196, 1, 0, 1,
-0.8435615, -0.7474028, -1.465704, 0.5411765, 1, 0, 1,
-0.8428856, 0.3143766, -0.1573434, 0.5372549, 1, 0, 1,
-0.839156, -0.04674961, -4.095127, 0.5294118, 1, 0, 1,
-0.8370242, -0.5310067, -0.9554769, 0.5254902, 1, 0, 1,
-0.8358465, 1.462575, -1.065128, 0.5176471, 1, 0, 1,
-0.8309334, 0.6065554, -1.411112, 0.5137255, 1, 0, 1,
-0.8295802, 1.030348, -1.727732, 0.5058824, 1, 0, 1,
-0.8275902, -0.2168963, -3.002616, 0.5019608, 1, 0, 1,
-0.8154953, -0.2775435, -2.825611, 0.4941176, 1, 0, 1,
-0.8102198, -0.6572308, -1.92506, 0.4862745, 1, 0, 1,
-0.8031896, -0.9810119, -1.927725, 0.4823529, 1, 0, 1,
-0.8028263, 0.9915322, -1.908598, 0.4745098, 1, 0, 1,
-0.8020878, 0.09157293, 0.01493315, 0.4705882, 1, 0, 1,
-0.7986516, 1.200855, -1.158156, 0.4627451, 1, 0, 1,
-0.7979536, 0.888114, -1.441568, 0.4588235, 1, 0, 1,
-0.7973247, 0.269019, -1.770341, 0.4509804, 1, 0, 1,
-0.7897426, 0.7505594, -1.635143, 0.4470588, 1, 0, 1,
-0.7848731, -0.1802691, -2.747577, 0.4392157, 1, 0, 1,
-0.7779478, 2.268095, -1.238114, 0.4352941, 1, 0, 1,
-0.7775744, 0.320217, -2.671337, 0.427451, 1, 0, 1,
-0.7717479, 0.4005392, -1.001235, 0.4235294, 1, 0, 1,
-0.761034, -0.2367598, -2.858881, 0.4156863, 1, 0, 1,
-0.7600667, -1.272009, -3.321979, 0.4117647, 1, 0, 1,
-0.7513381, -0.4135497, -3.982171, 0.4039216, 1, 0, 1,
-0.7512452, -0.4492035, -0.508075, 0.3960784, 1, 0, 1,
-0.7490264, -0.7617691, -1.780743, 0.3921569, 1, 0, 1,
-0.7489129, -0.5005116, -0.4060876, 0.3843137, 1, 0, 1,
-0.7462024, 0.7238683, -1.456721, 0.3803922, 1, 0, 1,
-0.7398376, -0.7842315, -3.748476, 0.372549, 1, 0, 1,
-0.7360039, 0.2013022, -1.695303, 0.3686275, 1, 0, 1,
-0.7334995, 0.04778223, 0.07650475, 0.3607843, 1, 0, 1,
-0.7331799, 0.2529888, -0.3562826, 0.3568628, 1, 0, 1,
-0.7287397, 1.485674, 0.591935, 0.3490196, 1, 0, 1,
-0.7162392, -0.8332472, -2.575112, 0.345098, 1, 0, 1,
-0.7086514, 0.4175073, -1.271402, 0.3372549, 1, 0, 1,
-0.7086041, -2.045183, -3.513088, 0.3333333, 1, 0, 1,
-0.7047826, 0.8038216, -1.277007, 0.3254902, 1, 0, 1,
-0.6957316, 0.3872392, -1.615284, 0.3215686, 1, 0, 1,
-0.6880385, -1.248388, -1.018214, 0.3137255, 1, 0, 1,
-0.6788939, 1.714923, -0.3598115, 0.3098039, 1, 0, 1,
-0.6698215, 1.1407, -1.06875, 0.3019608, 1, 0, 1,
-0.6693356, 1.621642, -1.004237, 0.2941177, 1, 0, 1,
-0.6679752, -0.7729835, -1.799088, 0.2901961, 1, 0, 1,
-0.6649794, -0.2898011, -2.776177, 0.282353, 1, 0, 1,
-0.6648861, 0.3080745, -1.750094, 0.2784314, 1, 0, 1,
-0.6590248, 0.2931406, -0.7838824, 0.2705882, 1, 0, 1,
-0.6583218, -0.3035772, -1.544811, 0.2666667, 1, 0, 1,
-0.6540345, -0.1955069, -1.494423, 0.2588235, 1, 0, 1,
-0.6462716, -0.2203623, -3.187972, 0.254902, 1, 0, 1,
-0.6422488, 1.074558, -1.607801, 0.2470588, 1, 0, 1,
-0.628618, 0.4746205, -3.077105, 0.2431373, 1, 0, 1,
-0.6267695, 2.247198, -0.1480154, 0.2352941, 1, 0, 1,
-0.6243463, -0.9283261, -3.09611, 0.2313726, 1, 0, 1,
-0.6219864, -0.2376054, -1.782781, 0.2235294, 1, 0, 1,
-0.6187667, 1.285217, -2.18203, 0.2196078, 1, 0, 1,
-0.6176421, 1.142871, -1.004073, 0.2117647, 1, 0, 1,
-0.6054892, 0.2358625, -1.741114, 0.2078431, 1, 0, 1,
-0.6024182, 0.07135881, -2.746464, 0.2, 1, 0, 1,
-0.6004557, -1.088424, -2.268795, 0.1921569, 1, 0, 1,
-0.5939797, 0.2076039, -2.890861, 0.1882353, 1, 0, 1,
-0.5865052, -0.2310888, -2.068967, 0.1803922, 1, 0, 1,
-0.5831527, -0.0352043, -0.29473, 0.1764706, 1, 0, 1,
-0.5826765, 1.939992, 0.1001561, 0.1686275, 1, 0, 1,
-0.5817742, -1.596126, -4.638763, 0.1647059, 1, 0, 1,
-0.5797821, 0.2404732, -1.539787, 0.1568628, 1, 0, 1,
-0.5775148, 0.3307336, -1.199269, 0.1529412, 1, 0, 1,
-0.5748423, 2.852332, 0.1750006, 0.145098, 1, 0, 1,
-0.5717751, 0.4479285, -1.34737, 0.1411765, 1, 0, 1,
-0.571335, 2.269251, -1.045932, 0.1333333, 1, 0, 1,
-0.5639327, -0.8802854, -1.643256, 0.1294118, 1, 0, 1,
-0.5629818, -2.160835, -3.515457, 0.1215686, 1, 0, 1,
-0.5596262, -0.08363169, -2.75808, 0.1176471, 1, 0, 1,
-0.5588766, 0.5926673, 0.1668846, 0.1098039, 1, 0, 1,
-0.5569062, 0.429276, -1.480594, 0.1058824, 1, 0, 1,
-0.555418, 0.1574631, -1.413062, 0.09803922, 1, 0, 1,
-0.5452118, -0.4657739, -1.242928, 0.09019608, 1, 0, 1,
-0.5424143, 1.129356, -0.7261659, 0.08627451, 1, 0, 1,
-0.5405017, -1.075462, -2.918511, 0.07843138, 1, 0, 1,
-0.5366505, -0.4350407, -0.789049, 0.07450981, 1, 0, 1,
-0.5355272, 0.6085359, -0.6414561, 0.06666667, 1, 0, 1,
-0.5313999, 2.352788, 1.168065, 0.0627451, 1, 0, 1,
-0.5286675, 1.308034, -1.120448, 0.05490196, 1, 0, 1,
-0.5258859, 0.672721, -0.2227381, 0.05098039, 1, 0, 1,
-0.5249128, -0.4150891, -2.528403, 0.04313726, 1, 0, 1,
-0.5245515, 0.4136162, -2.092393, 0.03921569, 1, 0, 1,
-0.5240804, 1.569206, -0.7328337, 0.03137255, 1, 0, 1,
-0.5163683, -1.497271, -3.578074, 0.02745098, 1, 0, 1,
-0.5158857, 1.288828, -0.176697, 0.01960784, 1, 0, 1,
-0.5134861, -1.698205, -3.296979, 0.01568628, 1, 0, 1,
-0.509447, 1.5182, -2.575583, 0.007843138, 1, 0, 1,
-0.5086327, -0.5703982, -2.051689, 0.003921569, 1, 0, 1,
-0.5045539, 0.513255, -0.1489977, 0, 1, 0.003921569, 1,
-0.5022333, 1.224927, -0.3266245, 0, 1, 0.01176471, 1,
-0.5014784, -2.145297, -3.317871, 0, 1, 0.01568628, 1,
-0.5005461, 1.078328, -0.4268923, 0, 1, 0.02352941, 1,
-0.4987781, 0.09006288, -0.6875805, 0, 1, 0.02745098, 1,
-0.497401, -0.5970086, -4.019862, 0, 1, 0.03529412, 1,
-0.4972191, -0.9785908, -3.234072, 0, 1, 0.03921569, 1,
-0.492705, 1.562428, 0.004387278, 0, 1, 0.04705882, 1,
-0.4916595, 0.7680725, -0.1861347, 0, 1, 0.05098039, 1,
-0.4858411, -1.567954, -3.201199, 0, 1, 0.05882353, 1,
-0.4812737, 0.4679515, -0.6234999, 0, 1, 0.0627451, 1,
-0.4783022, -0.4090966, -1.646674, 0, 1, 0.07058824, 1,
-0.4777415, -0.2353693, -1.117414, 0, 1, 0.07450981, 1,
-0.477101, -0.4433314, -3.171889, 0, 1, 0.08235294, 1,
-0.4759649, 0.1996008, -4.72835, 0, 1, 0.08627451, 1,
-0.4748849, 0.979746, -0.8966686, 0, 1, 0.09411765, 1,
-0.472681, -1.239905, -2.884285, 0, 1, 0.1019608, 1,
-0.470225, -0.6625336, -3.484029, 0, 1, 0.1058824, 1,
-0.4701596, 0.4202144, -0.3994941, 0, 1, 0.1137255, 1,
-0.4698822, 0.1040291, -1.908395, 0, 1, 0.1176471, 1,
-0.4698125, 0.2771648, -0.6610458, 0, 1, 0.1254902, 1,
-0.4663949, 0.09470096, -1.634756, 0, 1, 0.1294118, 1,
-0.4648534, -1.249976, -3.733386, 0, 1, 0.1372549, 1,
-0.4646652, -3.20533, -3.75869, 0, 1, 0.1411765, 1,
-0.4641714, 1.908543, -0.2691521, 0, 1, 0.1490196, 1,
-0.4614187, 0.2174817, -1.627917, 0, 1, 0.1529412, 1,
-0.4570507, -0.8705412, -3.048835, 0, 1, 0.1607843, 1,
-0.4557597, -1.620593, -4.523916, 0, 1, 0.1647059, 1,
-0.4549827, -1.748626, -2.60361, 0, 1, 0.172549, 1,
-0.4521839, -0.5931541, -3.052272, 0, 1, 0.1764706, 1,
-0.451501, -1.086788, -2.576783, 0, 1, 0.1843137, 1,
-0.4481782, -0.4745374, -0.7561094, 0, 1, 0.1882353, 1,
-0.4475558, -0.7880339, -1.412519, 0, 1, 0.1960784, 1,
-0.440246, 0.1404787, -0.7275084, 0, 1, 0.2039216, 1,
-0.4378429, -0.08600575, -1.754243, 0, 1, 0.2078431, 1,
-0.4365742, -2.229157, -2.324164, 0, 1, 0.2156863, 1,
-0.4340226, -0.6930333, -3.773882, 0, 1, 0.2196078, 1,
-0.433922, 1.964916, 0.3896955, 0, 1, 0.227451, 1,
-0.4331948, -1.998099, -2.586305, 0, 1, 0.2313726, 1,
-0.4329884, 1.200387, -1.017117, 0, 1, 0.2392157, 1,
-0.4322135, 0.8727974, 1.676353, 0, 1, 0.2431373, 1,
-0.4320014, 0.9262526, -1.434187, 0, 1, 0.2509804, 1,
-0.4319854, 0.3393156, 0.7253522, 0, 1, 0.254902, 1,
-0.4272785, -0.6599461, -3.152571, 0, 1, 0.2627451, 1,
-0.4207235, 0.690291, -0.2373792, 0, 1, 0.2666667, 1,
-0.4203911, -1.907997, -2.5793, 0, 1, 0.2745098, 1,
-0.4202365, -0.5074696, -3.364015, 0, 1, 0.2784314, 1,
-0.4186193, 0.1958025, -0.969066, 0, 1, 0.2862745, 1,
-0.4150903, -0.4438529, -2.383969, 0, 1, 0.2901961, 1,
-0.4150605, -0.4213989, -2.808754, 0, 1, 0.2980392, 1,
-0.4119605, 0.3816354, -2.00411, 0, 1, 0.3058824, 1,
-0.4092248, -0.5924385, -2.236637, 0, 1, 0.3098039, 1,
-0.4080576, 0.6034705, -2.054877, 0, 1, 0.3176471, 1,
-0.4045739, -0.1953722, -1.280374, 0, 1, 0.3215686, 1,
-0.4036517, 1.687896, 0.6505239, 0, 1, 0.3294118, 1,
-0.4016627, -0.4594182, -2.426445, 0, 1, 0.3333333, 1,
-0.3980212, -0.8683642, -1.637182, 0, 1, 0.3411765, 1,
-0.3977022, -0.2933458, -1.338991, 0, 1, 0.345098, 1,
-0.3947391, -0.3729327, -1.297773, 0, 1, 0.3529412, 1,
-0.3943454, -0.0566943, -0.5871174, 0, 1, 0.3568628, 1,
-0.3918802, -0.1744213, -2.257273, 0, 1, 0.3647059, 1,
-0.3914181, -1.049148, -2.116523, 0, 1, 0.3686275, 1,
-0.387226, 0.7503175, 0.9653741, 0, 1, 0.3764706, 1,
-0.3843393, 0.8376781, 0.3283252, 0, 1, 0.3803922, 1,
-0.3836113, 0.2285238, -2.411813, 0, 1, 0.3882353, 1,
-0.3742978, 0.9278105, -0.02813379, 0, 1, 0.3921569, 1,
-0.3697094, -0.4719377, -1.244216, 0, 1, 0.4, 1,
-0.3676886, -2.177151, -3.012416, 0, 1, 0.4078431, 1,
-0.3658007, -0.1823609, -1.087474, 0, 1, 0.4117647, 1,
-0.3618835, 0.2542835, -0.8877728, 0, 1, 0.4196078, 1,
-0.3567965, 1.009356, -1.816782, 0, 1, 0.4235294, 1,
-0.3560458, 1.181626, -1.445355, 0, 1, 0.4313726, 1,
-0.3540388, 1.585327, -0.04104057, 0, 1, 0.4352941, 1,
-0.3502147, -1.998909, -2.239008, 0, 1, 0.4431373, 1,
-0.3412647, -0.6703069, -4.039074, 0, 1, 0.4470588, 1,
-0.3408278, 0.7430343, -2.224566, 0, 1, 0.454902, 1,
-0.3395559, 0.4736509, -1.426127, 0, 1, 0.4588235, 1,
-0.3373737, 0.2952786, -0.9265114, 0, 1, 0.4666667, 1,
-0.3370014, 0.01072486, -2.928996, 0, 1, 0.4705882, 1,
-0.3363861, 1.247871, -2.388208, 0, 1, 0.4784314, 1,
-0.3342415, -0.6161659, -2.117381, 0, 1, 0.4823529, 1,
-0.3337899, 0.3150823, -0.817426, 0, 1, 0.4901961, 1,
-0.3330205, 1.32561, -0.2400455, 0, 1, 0.4941176, 1,
-0.3303743, -0.6675911, -2.533838, 0, 1, 0.5019608, 1,
-0.3285482, -0.5967713, -1.188654, 0, 1, 0.509804, 1,
-0.3277262, -0.9423149, -4.2289, 0, 1, 0.5137255, 1,
-0.3223332, 0.8504224, -1.632917, 0, 1, 0.5215687, 1,
-0.3180577, -1.69231, -1.910451, 0, 1, 0.5254902, 1,
-0.3172986, -1.127839, -4.515563, 0, 1, 0.5333334, 1,
-0.3151896, 0.5213819, -0.5879844, 0, 1, 0.5372549, 1,
-0.3149275, 0.1416359, -0.7859564, 0, 1, 0.5450981, 1,
-0.311079, 0.9304613, -0.9522886, 0, 1, 0.5490196, 1,
-0.3086738, 0.5056219, 1.530553, 0, 1, 0.5568628, 1,
-0.3077486, 0.6101562, 0.4424178, 0, 1, 0.5607843, 1,
-0.3075673, 1.256581, 0.3187183, 0, 1, 0.5686275, 1,
-0.3070281, -0.08835123, -2.535697, 0, 1, 0.572549, 1,
-0.3036077, 0.658057, 0.3108763, 0, 1, 0.5803922, 1,
-0.2983107, -0.3986201, -3.263656, 0, 1, 0.5843138, 1,
-0.2952579, -1.20571, -2.842536, 0, 1, 0.5921569, 1,
-0.2942058, 0.4699083, -0.7129462, 0, 1, 0.5960785, 1,
-0.2911206, 0.5301052, -1.214274, 0, 1, 0.6039216, 1,
-0.2881311, 0.7675371, -0.7101799, 0, 1, 0.6117647, 1,
-0.2863279, -0.2199057, -1.043455, 0, 1, 0.6156863, 1,
-0.2791061, -1.760125, -2.070971, 0, 1, 0.6235294, 1,
-0.2698151, -1.079166, -1.331084, 0, 1, 0.627451, 1,
-0.266936, 1.432922, 0.153091, 0, 1, 0.6352941, 1,
-0.2666674, 0.5199325, -0.005154391, 0, 1, 0.6392157, 1,
-0.266323, 0.5704438, 0.172738, 0, 1, 0.6470588, 1,
-0.2579838, -0.2894647, -2.669691, 0, 1, 0.6509804, 1,
-0.2568381, -0.9726805, -1.946518, 0, 1, 0.6588235, 1,
-0.2551156, -1.178581, -5.259784, 0, 1, 0.6627451, 1,
-0.2551079, 1.347916, 1.173322, 0, 1, 0.6705883, 1,
-0.2511558, -1.515142, -2.321808, 0, 1, 0.6745098, 1,
-0.2486849, 0.6123117, 1.12339, 0, 1, 0.682353, 1,
-0.2431332, 2.141161, -0.0681617, 0, 1, 0.6862745, 1,
-0.2329494, -1.612276, -4.763527, 0, 1, 0.6941177, 1,
-0.2314688, 1.256413, -0.3704852, 0, 1, 0.7019608, 1,
-0.2288765, -0.03016956, -2.286006, 0, 1, 0.7058824, 1,
-0.2280702, 0.6197634, -0.2884888, 0, 1, 0.7137255, 1,
-0.2256523, -1.167961, -3.583033, 0, 1, 0.7176471, 1,
-0.2243851, -0.6581107, -2.376999, 0, 1, 0.7254902, 1,
-0.222257, 1.035036, 0.8571674, 0, 1, 0.7294118, 1,
-0.2153033, 0.3844709, -0.5906194, 0, 1, 0.7372549, 1,
-0.2064282, -1.128949, -4.233633, 0, 1, 0.7411765, 1,
-0.1985729, 0.2529437, -0.8372676, 0, 1, 0.7490196, 1,
-0.1984257, 0.1540886, -0.942837, 0, 1, 0.7529412, 1,
-0.1942927, 1.274832, -0.2424759, 0, 1, 0.7607843, 1,
-0.1929946, -3.590138, -1.154875, 0, 1, 0.7647059, 1,
-0.1847978, 1.08983, -0.3053201, 0, 1, 0.772549, 1,
-0.1827331, 1.325397, 1.46388, 0, 1, 0.7764706, 1,
-0.1809685, -0.02116332, -0.01579814, 0, 1, 0.7843137, 1,
-0.1806978, 0.8807109, -0.720444, 0, 1, 0.7882353, 1,
-0.178252, 0.4484016, -0.4433721, 0, 1, 0.7960784, 1,
-0.1772513, 1.747033, 1.611955, 0, 1, 0.8039216, 1,
-0.1753103, 0.0928283, -1.784496, 0, 1, 0.8078431, 1,
-0.1739343, -1.443681, -2.609244, 0, 1, 0.8156863, 1,
-0.1738437, 0.4112775, -0.9413387, 0, 1, 0.8196079, 1,
-0.1672432, -0.5203013, -3.155147, 0, 1, 0.827451, 1,
-0.1629374, 0.2611253, 1.453298, 0, 1, 0.8313726, 1,
-0.1614102, -0.7522856, -3.064466, 0, 1, 0.8392157, 1,
-0.159597, 0.4921215, -0.3122992, 0, 1, 0.8431373, 1,
-0.1580398, 0.674146, -1.701552, 0, 1, 0.8509804, 1,
-0.1578795, -0.4188141, -2.564141, 0, 1, 0.854902, 1,
-0.1490198, -1.066703, -3.481729, 0, 1, 0.8627451, 1,
-0.1435283, -0.0270268, -2.662577, 0, 1, 0.8666667, 1,
-0.1429191, -0.7127758, -3.055218, 0, 1, 0.8745098, 1,
-0.1409081, -1.342318, -2.408273, 0, 1, 0.8784314, 1,
-0.1405289, -0.8773626, -2.892653, 0, 1, 0.8862745, 1,
-0.138878, 0.6951458, 0.1234526, 0, 1, 0.8901961, 1,
-0.1384066, -0.493615, -4.323129, 0, 1, 0.8980392, 1,
-0.1370461, -1.157412, -1.851064, 0, 1, 0.9058824, 1,
-0.1285571, -2.044055, -3.571672, 0, 1, 0.9098039, 1,
-0.1270209, 0.4920346, 0.6033784, 0, 1, 0.9176471, 1,
-0.1244207, -0.5314647, -3.419107, 0, 1, 0.9215686, 1,
-0.1229635, 0.9482182, 0.6944573, 0, 1, 0.9294118, 1,
-0.1170013, -0.165848, -1.794628, 0, 1, 0.9333333, 1,
-0.1025805, 0.9408197, -1.406631, 0, 1, 0.9411765, 1,
-0.1002896, -2.038051, -4.075687, 0, 1, 0.945098, 1,
-0.09909195, 0.3254626, -0.9854421, 0, 1, 0.9529412, 1,
-0.0981643, -1.586836, -2.839201, 0, 1, 0.9568627, 1,
-0.09489773, -0.6365635, -3.656756, 0, 1, 0.9647059, 1,
-0.0926481, -1.111975, -1.944595, 0, 1, 0.9686275, 1,
-0.08579592, 1.138768, -0.6366977, 0, 1, 0.9764706, 1,
-0.0852195, 0.01573485, -0.2827039, 0, 1, 0.9803922, 1,
-0.08285362, 1.551101, -0.7976465, 0, 1, 0.9882353, 1,
-0.08047215, -0.1782406, -3.089292, 0, 1, 0.9921569, 1,
-0.07245518, 0.3665882, 0.6191733, 0, 1, 1, 1,
-0.07220585, 0.9517549, 1.444374, 0, 0.9921569, 1, 1,
-0.06979138, 0.01152963, -0.3434041, 0, 0.9882353, 1, 1,
-0.06871557, -0.7634832, -3.323454, 0, 0.9803922, 1, 1,
-0.06225883, 0.9792919, -0.2041274, 0, 0.9764706, 1, 1,
-0.05815728, -0.5153444, -1.991035, 0, 0.9686275, 1, 1,
-0.05767937, 0.3996969, 0.6127737, 0, 0.9647059, 1, 1,
-0.0547143, 0.9923702, -1.122745, 0, 0.9568627, 1, 1,
-0.05249012, 0.8110281, 0.8713997, 0, 0.9529412, 1, 1,
-0.04549237, 0.506415, 1.054686, 0, 0.945098, 1, 1,
-0.04348921, 0.7743863, -1.491969, 0, 0.9411765, 1, 1,
-0.0419669, 0.7979457, -1.46151, 0, 0.9333333, 1, 1,
-0.03666714, -0.7117953, -3.645552, 0, 0.9294118, 1, 1,
-0.03448474, 1.561989, -0.1781272, 0, 0.9215686, 1, 1,
-0.03122712, 0.476996, 0.480205, 0, 0.9176471, 1, 1,
-0.02679605, 1.489275, -1.314769, 0, 0.9098039, 1, 1,
-0.02556824, -0.01281809, -0.8083422, 0, 0.9058824, 1, 1,
-0.02545086, 0.5229579, -0.1278191, 0, 0.8980392, 1, 1,
-0.02486107, -0.04099081, -1.432263, 0, 0.8901961, 1, 1,
-0.02264345, -1.663304, -1.252566, 0, 0.8862745, 1, 1,
-0.02145944, -0.6061972, -2.748309, 0, 0.8784314, 1, 1,
-0.01989915, 0.5587564, 1.888486, 0, 0.8745098, 1, 1,
-0.01884132, -0.9373635, -2.701206, 0, 0.8666667, 1, 1,
-0.01825574, -0.5900697, -3.419556, 0, 0.8627451, 1, 1,
-0.01119692, -0.6749033, -0.8120294, 0, 0.854902, 1, 1,
-0.0093155, -2.517866, -3.573225, 0, 0.8509804, 1, 1,
-0.007692999, 0.223396, -0.07975154, 0, 0.8431373, 1, 1,
-0.005841311, 2.261011, -0.08915417, 0, 0.8392157, 1, 1,
0.002254385, -0.08151864, 1.168244, 0, 0.8313726, 1, 1,
0.002900503, 0.1329067, 1.418059, 0, 0.827451, 1, 1,
0.005101936, -0.2490744, 2.262875, 0, 0.8196079, 1, 1,
0.005156049, -0.4031489, 4.106363, 0, 0.8156863, 1, 1,
0.005252698, -0.1087625, 3.982728, 0, 0.8078431, 1, 1,
0.006882604, -1.635907, 1.744925, 0, 0.8039216, 1, 1,
0.007962969, -0.6426399, 3.240772, 0, 0.7960784, 1, 1,
0.0116036, -0.6891192, 3.40538, 0, 0.7882353, 1, 1,
0.01175159, -1.015991, 2.497246, 0, 0.7843137, 1, 1,
0.01306651, -0.9933574, 1.860434, 0, 0.7764706, 1, 1,
0.01398593, 0.7057567, 0.6766619, 0, 0.772549, 1, 1,
0.01401195, 0.6247275, -0.2922756, 0, 0.7647059, 1, 1,
0.01597653, -1.216491, 2.896622, 0, 0.7607843, 1, 1,
0.01851222, 0.3295075, -1.137794, 0, 0.7529412, 1, 1,
0.02176478, 1.215876, 1.510542, 0, 0.7490196, 1, 1,
0.02244162, -1.30824, 2.867331, 0, 0.7411765, 1, 1,
0.02410989, 1.258998, 1.048279, 0, 0.7372549, 1, 1,
0.02481775, -1.584884, 4.015985, 0, 0.7294118, 1, 1,
0.02573751, 1.258929, 1.184363, 0, 0.7254902, 1, 1,
0.02784946, 0.5293556, -0.9988285, 0, 0.7176471, 1, 1,
0.02802411, -1.437972, 0.9099426, 0, 0.7137255, 1, 1,
0.03294446, 0.556026, 0.4162067, 0, 0.7058824, 1, 1,
0.03582964, 0.748449, 0.6768351, 0, 0.6980392, 1, 1,
0.03648689, 0.165059, 0.3395767, 0, 0.6941177, 1, 1,
0.0391673, -1.189276, 1.887695, 0, 0.6862745, 1, 1,
0.04091528, -0.5560846, 4.707041, 0, 0.682353, 1, 1,
0.04510855, 0.1177547, 1.601613, 0, 0.6745098, 1, 1,
0.04624119, 0.6438604, 0.2573169, 0, 0.6705883, 1, 1,
0.04800156, 1.812113, -1.189031, 0, 0.6627451, 1, 1,
0.05271668, -0.4607636, 3.036453, 0, 0.6588235, 1, 1,
0.05710183, -0.361989, 3.3696, 0, 0.6509804, 1, 1,
0.05730079, 0.9533919, -1.116578, 0, 0.6470588, 1, 1,
0.05891494, 0.9390568, -0.1685089, 0, 0.6392157, 1, 1,
0.06055987, -1.663738, 2.713388, 0, 0.6352941, 1, 1,
0.06235738, -0.3462965, 2.574953, 0, 0.627451, 1, 1,
0.06430944, -0.8762458, 3.047371, 0, 0.6235294, 1, 1,
0.06545285, -0.07151207, 2.150891, 0, 0.6156863, 1, 1,
0.06617315, -0.4748064, 2.610218, 0, 0.6117647, 1, 1,
0.06722649, -0.7576477, 1.442997, 0, 0.6039216, 1, 1,
0.06906008, 0.5725819, 0.2486145, 0, 0.5960785, 1, 1,
0.07096817, -1.109374, 2.054568, 0, 0.5921569, 1, 1,
0.0891571, -0.9395627, 2.310387, 0, 0.5843138, 1, 1,
0.09501903, 0.5039617, 0.7121401, 0, 0.5803922, 1, 1,
0.0962689, -1.936729, 4.123385, 0, 0.572549, 1, 1,
0.09696963, 2.124056, 1.568058, 0, 0.5686275, 1, 1,
0.09773792, 0.3384482, 0.2655107, 0, 0.5607843, 1, 1,
0.09840644, -0.2668185, 2.775646, 0, 0.5568628, 1, 1,
0.1084771, -0.7600037, 3.765185, 0, 0.5490196, 1, 1,
0.1152756, -0.06318432, 3.664734, 0, 0.5450981, 1, 1,
0.1196093, 0.42243, -0.1527333, 0, 0.5372549, 1, 1,
0.1222314, 0.173641, 0.4128267, 0, 0.5333334, 1, 1,
0.1240394, 0.8744267, -0.7261616, 0, 0.5254902, 1, 1,
0.1245309, 1.945523, 1.642745, 0, 0.5215687, 1, 1,
0.1337677, 0.955338, -1.098483, 0, 0.5137255, 1, 1,
0.1378793, -0.7512382, 1.589276, 0, 0.509804, 1, 1,
0.1395018, 0.5457702, 0.389346, 0, 0.5019608, 1, 1,
0.1441282, -1.76199, 2.76076, 0, 0.4941176, 1, 1,
0.1452421, 0.8039891, -0.4689199, 0, 0.4901961, 1, 1,
0.1467581, -0.3115594, 1.825485, 0, 0.4823529, 1, 1,
0.1483627, 0.08940616, 2.158911, 0, 0.4784314, 1, 1,
0.1486291, 1.27698, 0.3931797, 0, 0.4705882, 1, 1,
0.1488083, 0.5838742, 0.3810622, 0, 0.4666667, 1, 1,
0.1508196, 0.2468643, 1.49911, 0, 0.4588235, 1, 1,
0.1514899, 1.194004, 1.168531, 0, 0.454902, 1, 1,
0.1537746, 1.661376, 1.290321, 0, 0.4470588, 1, 1,
0.1561311, 1.463878, -1.67257, 0, 0.4431373, 1, 1,
0.1562943, -0.0733458, 2.00444, 0, 0.4352941, 1, 1,
0.1568703, -0.9015431, 3.307184, 0, 0.4313726, 1, 1,
0.1595684, -2.104201, 3.459193, 0, 0.4235294, 1, 1,
0.163343, -0.8076475, 2.866653, 0, 0.4196078, 1, 1,
0.16433, 1.008856, 0.8320331, 0, 0.4117647, 1, 1,
0.1653465, 0.6148739, 1.713324, 0, 0.4078431, 1, 1,
0.1703236, 0.474582, 0.2338227, 0, 0.4, 1, 1,
0.1847155, 0.2860983, 1.68977, 0, 0.3921569, 1, 1,
0.1849443, 0.5109653, 1.000333, 0, 0.3882353, 1, 1,
0.1881417, -1.625299, 3.477471, 0, 0.3803922, 1, 1,
0.1891397, -0.9694592, 1.936079, 0, 0.3764706, 1, 1,
0.193054, -0.7986856, 2.679711, 0, 0.3686275, 1, 1,
0.1938327, -2.351903, 4.28288, 0, 0.3647059, 1, 1,
0.1972593, -0.3367546, 3.242088, 0, 0.3568628, 1, 1,
0.2069316, -1.431187, 3.199025, 0, 0.3529412, 1, 1,
0.2248207, -0.5921604, 2.467733, 0, 0.345098, 1, 1,
0.2309056, 0.1897969, 1.075626, 0, 0.3411765, 1, 1,
0.2402543, 2.383214, 1.784558, 0, 0.3333333, 1, 1,
0.2466334, -0.7745019, 2.962483, 0, 0.3294118, 1, 1,
0.2471037, -2.052837, 3.465569, 0, 0.3215686, 1, 1,
0.2474704, 0.7158925, 0.649579, 0, 0.3176471, 1, 1,
0.2482542, -0.9792287, 3.130949, 0, 0.3098039, 1, 1,
0.2491331, 0.09576704, 1.037048, 0, 0.3058824, 1, 1,
0.249465, -0.2274787, 2.766129, 0, 0.2980392, 1, 1,
0.2521799, -1.818957, 3.274342, 0, 0.2901961, 1, 1,
0.2564153, 0.1827521, 1.272307, 0, 0.2862745, 1, 1,
0.25864, -0.2679243, 2.615937, 0, 0.2784314, 1, 1,
0.2667382, 0.558032, -0.2342287, 0, 0.2745098, 1, 1,
0.2670125, 0.05445543, 1.413302, 0, 0.2666667, 1, 1,
0.2740284, -0.1279197, 2.475063, 0, 0.2627451, 1, 1,
0.2802511, 0.3357961, -0.22584, 0, 0.254902, 1, 1,
0.285426, -0.5286703, 1.129663, 0, 0.2509804, 1, 1,
0.2905503, -1.840352, 3.604548, 0, 0.2431373, 1, 1,
0.2942715, -0.2055714, 2.643992, 0, 0.2392157, 1, 1,
0.2989175, -0.8318622, 2.589898, 0, 0.2313726, 1, 1,
0.3074563, 1.042409, 0.03220421, 0, 0.227451, 1, 1,
0.31915, 0.0519634, 0.7445238, 0, 0.2196078, 1, 1,
0.3226896, -0.2930444, 3.253553, 0, 0.2156863, 1, 1,
0.3229315, -0.6822426, 2.60886, 0, 0.2078431, 1, 1,
0.3235559, -1.467488, 2.164886, 0, 0.2039216, 1, 1,
0.3290219, 0.9398666, 0.3004211, 0, 0.1960784, 1, 1,
0.3295839, -0.9739209, 2.660949, 0, 0.1882353, 1, 1,
0.3376141, -1.179869, 2.081244, 0, 0.1843137, 1, 1,
0.3409863, 0.009466397, 0.2436068, 0, 0.1764706, 1, 1,
0.3413133, -0.6279345, 1.409155, 0, 0.172549, 1, 1,
0.3423305, -0.896468, 2.434371, 0, 0.1647059, 1, 1,
0.3444993, 0.08734273, 0.9805925, 0, 0.1607843, 1, 1,
0.3446323, -0.3915893, 0.9332977, 0, 0.1529412, 1, 1,
0.3513623, -0.3142845, 2.558045, 0, 0.1490196, 1, 1,
0.3532571, 1.260974, 1.43319, 0, 0.1411765, 1, 1,
0.356667, -0.5301013, 3.011347, 0, 0.1372549, 1, 1,
0.3602137, 1.764285, 2.044202, 0, 0.1294118, 1, 1,
0.3638306, 0.4494494, 0.2682423, 0, 0.1254902, 1, 1,
0.3640852, 0.3946206, -1.326901, 0, 0.1176471, 1, 1,
0.3663877, -1.564319, 3.137378, 0, 0.1137255, 1, 1,
0.3681599, 0.003222053, 2.284505, 0, 0.1058824, 1, 1,
0.3700734, 0.5899029, 1.783572, 0, 0.09803922, 1, 1,
0.3810517, 2.047251, 2.461397, 0, 0.09411765, 1, 1,
0.3875732, 1.32146, 1.616867, 0, 0.08627451, 1, 1,
0.3915475, 1.455196, 1.302715, 0, 0.08235294, 1, 1,
0.391608, 0.9602112, 1.010054, 0, 0.07450981, 1, 1,
0.392219, -1.739954, 4.322328, 0, 0.07058824, 1, 1,
0.3931172, 0.9402135, 0.486318, 0, 0.0627451, 1, 1,
0.3949752, 0.7877662, 1.081179, 0, 0.05882353, 1, 1,
0.3958822, -0.4126362, 2.6684, 0, 0.05098039, 1, 1,
0.4006507, 0.03077813, 1.758007, 0, 0.04705882, 1, 1,
0.4014323, -0.1337966, 1.49505, 0, 0.03921569, 1, 1,
0.4034853, 0.6126938, -0.4603723, 0, 0.03529412, 1, 1,
0.4059029, 0.005336342, 0.5042254, 0, 0.02745098, 1, 1,
0.4213386, 1.010692, 0.9090142, 0, 0.02352941, 1, 1,
0.4243978, 0.4078279, 1.683488, 0, 0.01568628, 1, 1,
0.4246002, 0.194824, 2.246115, 0, 0.01176471, 1, 1,
0.4264193, 0.5649785, 1.341236, 0, 0.003921569, 1, 1,
0.4269767, -0.241484, 2.059279, 0.003921569, 0, 1, 1,
0.4284665, 0.3147167, 0.8389618, 0.007843138, 0, 1, 1,
0.4382533, -0.6707802, 2.874755, 0.01568628, 0, 1, 1,
0.4389886, -1.524518, 3.375422, 0.01960784, 0, 1, 1,
0.4446195, 0.4604374, 0.8153756, 0.02745098, 0, 1, 1,
0.4540873, 0.6494939, 0.04236899, 0.03137255, 0, 1, 1,
0.4566096, 0.8956767, -0.2028217, 0.03921569, 0, 1, 1,
0.457922, 0.2924341, 0.3264524, 0.04313726, 0, 1, 1,
0.4590084, 0.4055645, 0.1315379, 0.05098039, 0, 1, 1,
0.4647177, -1.910704, 3.150161, 0.05490196, 0, 1, 1,
0.46472, -0.0742762, 0.8167087, 0.0627451, 0, 1, 1,
0.4649116, -0.1453046, 1.554297, 0.06666667, 0, 1, 1,
0.4659236, -0.05270891, 1.073596, 0.07450981, 0, 1, 1,
0.479361, 0.8429321, -0.6430429, 0.07843138, 0, 1, 1,
0.4805186, 0.7192133, -0.1410726, 0.08627451, 0, 1, 1,
0.482777, -1.462511, 1.900481, 0.09019608, 0, 1, 1,
0.4839869, 0.590606, -1.975422, 0.09803922, 0, 1, 1,
0.4881594, -0.4509812, 2.99321, 0.1058824, 0, 1, 1,
0.4919381, -1.198702, 2.205061, 0.1098039, 0, 1, 1,
0.4924761, 0.9595649, 2.277372, 0.1176471, 0, 1, 1,
0.4925172, 0.4772863, 3.150289, 0.1215686, 0, 1, 1,
0.4970018, -0.2929461, 2.400661, 0.1294118, 0, 1, 1,
0.5011138, -0.720149, 1.819589, 0.1333333, 0, 1, 1,
0.5082614, -0.2489443, 3.325069, 0.1411765, 0, 1, 1,
0.508943, 0.4439701, 0.2170163, 0.145098, 0, 1, 1,
0.5091081, 0.1791691, 2.203269, 0.1529412, 0, 1, 1,
0.5150956, 0.9533393, -0.1008665, 0.1568628, 0, 1, 1,
0.5163653, 0.2316678, 1.790657, 0.1647059, 0, 1, 1,
0.5221109, -0.95652, 3.278149, 0.1686275, 0, 1, 1,
0.5223719, -0.3611045, 2.592299, 0.1764706, 0, 1, 1,
0.5223784, 0.4604021, 0.852125, 0.1803922, 0, 1, 1,
0.5261907, -1.479864, 4.453396, 0.1882353, 0, 1, 1,
0.5269176, -0.7163145, 2.761074, 0.1921569, 0, 1, 1,
0.5328034, -0.01549939, 2.336985, 0.2, 0, 1, 1,
0.53324, 0.5934781, 1.316146, 0.2078431, 0, 1, 1,
0.5441821, -0.2469293, 1.680977, 0.2117647, 0, 1, 1,
0.545346, 0.6578199, 0.7976415, 0.2196078, 0, 1, 1,
0.5474733, 0.6592227, -1.408659, 0.2235294, 0, 1, 1,
0.5491021, -0.246933, 1.291456, 0.2313726, 0, 1, 1,
0.5661678, 0.4253795, 0.5665979, 0.2352941, 0, 1, 1,
0.5667784, 1.615053, 0.1353589, 0.2431373, 0, 1, 1,
0.5668766, 0.9685519, 1.008627, 0.2470588, 0, 1, 1,
0.5694324, 0.2623447, -0.4983835, 0.254902, 0, 1, 1,
0.5712087, -0.3835762, 1.713622, 0.2588235, 0, 1, 1,
0.5715407, -0.2649359, 3.977671, 0.2666667, 0, 1, 1,
0.574691, -0.1246213, 1.51811, 0.2705882, 0, 1, 1,
0.5813136, 0.6353405, 1.291931, 0.2784314, 0, 1, 1,
0.5913523, 0.09962621, 0.8903039, 0.282353, 0, 1, 1,
0.5923764, 1.551723, 1.057709, 0.2901961, 0, 1, 1,
0.5931178, -0.4583149, 2.40819, 0.2941177, 0, 1, 1,
0.5985614, -1.652834, 1.920967, 0.3019608, 0, 1, 1,
0.5997606, -1.859771, 1.285022, 0.3098039, 0, 1, 1,
0.6001564, 0.1177478, 3.528894, 0.3137255, 0, 1, 1,
0.6026932, 1.493608, 1.649491, 0.3215686, 0, 1, 1,
0.611281, -0.2061255, 1.980463, 0.3254902, 0, 1, 1,
0.6129524, -0.8307859, 2.439503, 0.3333333, 0, 1, 1,
0.613302, -1.689893, 2.996655, 0.3372549, 0, 1, 1,
0.6141056, 0.7058938, 0.08393534, 0.345098, 0, 1, 1,
0.6160403, -0.2252941, 1.751017, 0.3490196, 0, 1, 1,
0.6176494, 0.8754164, 0.1418381, 0.3568628, 0, 1, 1,
0.6182497, -1.27491, 2.966609, 0.3607843, 0, 1, 1,
0.618383, 0.5895108, 0.2480156, 0.3686275, 0, 1, 1,
0.6189069, -0.5601848, 1.970734, 0.372549, 0, 1, 1,
0.6220674, 1.649588, -0.5320779, 0.3803922, 0, 1, 1,
0.6222044, -0.02314216, 3.052933, 0.3843137, 0, 1, 1,
0.6244864, 0.3903913, 0.1250835, 0.3921569, 0, 1, 1,
0.6312726, -1.051686, 2.611641, 0.3960784, 0, 1, 1,
0.6348191, -1.665056, 4.676486, 0.4039216, 0, 1, 1,
0.6348924, -0.612626, 0.6736258, 0.4117647, 0, 1, 1,
0.6395783, -1.04367, 1.576057, 0.4156863, 0, 1, 1,
0.6410151, -1.360043, 3.380619, 0.4235294, 0, 1, 1,
0.6417131, -0.5486208, 2.269994, 0.427451, 0, 1, 1,
0.6458214, 0.3572181, 2.009979, 0.4352941, 0, 1, 1,
0.6462474, -2.172717, 3.587411, 0.4392157, 0, 1, 1,
0.6465374, -0.2456206, 1.25736, 0.4470588, 0, 1, 1,
0.6519094, 0.8725782, 0.91682, 0.4509804, 0, 1, 1,
0.6540199, -1.061792, 2.453669, 0.4588235, 0, 1, 1,
0.6555544, -2.162174, 3.082636, 0.4627451, 0, 1, 1,
0.6629518, -0.1012609, 1.38966, 0.4705882, 0, 1, 1,
0.6673355, -0.6292493, 2.578119, 0.4745098, 0, 1, 1,
0.6678427, 0.6385032, 0.5786025, 0.4823529, 0, 1, 1,
0.6684593, -1.206335, 2.751467, 0.4862745, 0, 1, 1,
0.6702985, 0.2133149, 0.7180562, 0.4941176, 0, 1, 1,
0.6716672, 1.020447, 0.4980557, 0.5019608, 0, 1, 1,
0.6793588, -0.3634068, 4.455816, 0.5058824, 0, 1, 1,
0.6803693, 0.05868406, 1.69329, 0.5137255, 0, 1, 1,
0.6844347, -0.5396305, 4.651917, 0.5176471, 0, 1, 1,
0.6877187, -0.8190556, 2.01538, 0.5254902, 0, 1, 1,
0.6900314, 0.07032149, 0.8415832, 0.5294118, 0, 1, 1,
0.6939641, 0.4052503, -0.1007953, 0.5372549, 0, 1, 1,
0.6970792, 1.082019, 0.7261373, 0.5411765, 0, 1, 1,
0.6973855, -0.02401886, 2.275472, 0.5490196, 0, 1, 1,
0.6985324, -0.3156773, 1.566509, 0.5529412, 0, 1, 1,
0.7019574, -1.279476, 3.512247, 0.5607843, 0, 1, 1,
0.7028374, -0.8637375, 2.618241, 0.5647059, 0, 1, 1,
0.7042224, 1.3868, 1.029085, 0.572549, 0, 1, 1,
0.7125854, 1.345702, -0.7150221, 0.5764706, 0, 1, 1,
0.7133502, 0.7945699, 1.770948, 0.5843138, 0, 1, 1,
0.7134414, -0.2534892, 3.099327, 0.5882353, 0, 1, 1,
0.7246264, 0.5620313, 0.9305488, 0.5960785, 0, 1, 1,
0.7255355, 0.2546399, 1.042526, 0.6039216, 0, 1, 1,
0.7314692, 1.272217, 0.4823041, 0.6078432, 0, 1, 1,
0.7338687, -1.669198, 1.752159, 0.6156863, 0, 1, 1,
0.7401993, -0.1627928, 1.263171, 0.6196079, 0, 1, 1,
0.7431293, -0.01406228, 2.304744, 0.627451, 0, 1, 1,
0.7443804, -0.1203463, 3.129494, 0.6313726, 0, 1, 1,
0.751264, 0.7381575, -0.6228315, 0.6392157, 0, 1, 1,
0.752598, -1.814967, 3.293652, 0.6431373, 0, 1, 1,
0.7605188, 0.8115874, 2.249978, 0.6509804, 0, 1, 1,
0.7619386, 0.4821505, 2.589795, 0.654902, 0, 1, 1,
0.7637062, 0.373001, 1.016135, 0.6627451, 0, 1, 1,
0.7643937, -0.5635816, 1.770309, 0.6666667, 0, 1, 1,
0.7762151, 1.953453, -0.6358179, 0.6745098, 0, 1, 1,
0.7776114, 0.8463905, 1.382512, 0.6784314, 0, 1, 1,
0.7846335, -0.4903212, 2.522866, 0.6862745, 0, 1, 1,
0.7895705, -0.9935308, 3.359424, 0.6901961, 0, 1, 1,
0.790032, 1.056428, 1.532309, 0.6980392, 0, 1, 1,
0.7911798, 0.789016, -2.765986, 0.7058824, 0, 1, 1,
0.7912923, 1.798072, 0.5054224, 0.7098039, 0, 1, 1,
0.7951752, 0.3189066, -1.702745, 0.7176471, 0, 1, 1,
0.8014633, 1.583373, 0.7673545, 0.7215686, 0, 1, 1,
0.8039492, 0.5524907, -1.137537, 0.7294118, 0, 1, 1,
0.8118965, -1.227877, 3.766437, 0.7333333, 0, 1, 1,
0.813531, -0.312494, 3.134121, 0.7411765, 0, 1, 1,
0.8220533, 0.6095644, 1.539828, 0.7450981, 0, 1, 1,
0.8235876, -0.6469308, 1.471122, 0.7529412, 0, 1, 1,
0.8282997, 1.081524, 0.3857506, 0.7568628, 0, 1, 1,
0.8300468, 0.6003706, -1.096775, 0.7647059, 0, 1, 1,
0.833908, 0.8534664, 0.7237236, 0.7686275, 0, 1, 1,
0.8339191, -0.9574343, 2.257714, 0.7764706, 0, 1, 1,
0.8355411, -1.507843, 1.977942, 0.7803922, 0, 1, 1,
0.8383948, 0.5197558, 1.341972, 0.7882353, 0, 1, 1,
0.8390433, 1.34055, 2.004965, 0.7921569, 0, 1, 1,
0.8392762, -1.22149, 2.911865, 0.8, 0, 1, 1,
0.8403365, 0.8132534, -0.1868609, 0.8078431, 0, 1, 1,
0.8424298, 0.2851801, 0.1943354, 0.8117647, 0, 1, 1,
0.8449333, -0.5356546, 4.374753, 0.8196079, 0, 1, 1,
0.8457376, 0.08900366, 2.167381, 0.8235294, 0, 1, 1,
0.8521658, 1.138904, -0.6821465, 0.8313726, 0, 1, 1,
0.8578216, -0.09966619, 0.8609055, 0.8352941, 0, 1, 1,
0.8629434, -0.8667513, 1.657821, 0.8431373, 0, 1, 1,
0.8701428, -0.6549513, 2.409561, 0.8470588, 0, 1, 1,
0.8708305, -1.380706, 1.162806, 0.854902, 0, 1, 1,
0.8712636, 0.2749983, 1.625487, 0.8588235, 0, 1, 1,
0.8740829, -0.6500365, 1.227249, 0.8666667, 0, 1, 1,
0.8773679, 1.084159, 1.84438, 0.8705882, 0, 1, 1,
0.880707, -0.2259041, 1.51188, 0.8784314, 0, 1, 1,
0.8818418, 0.9381786, 0.6161566, 0.8823529, 0, 1, 1,
0.8917174, -0.733414, 3.752282, 0.8901961, 0, 1, 1,
0.9017573, 0.03888397, 0.5452328, 0.8941177, 0, 1, 1,
0.9090574, -0.6944771, 2.623795, 0.9019608, 0, 1, 1,
0.9101349, 0.715134, 3.084147, 0.9098039, 0, 1, 1,
0.9122306, 0.5049295, 0.7011203, 0.9137255, 0, 1, 1,
0.9170684, -1.072127, 2.496591, 0.9215686, 0, 1, 1,
0.9280797, -1.822999, 3.493869, 0.9254902, 0, 1, 1,
0.9336855, 0.6514573, 1.788042, 0.9333333, 0, 1, 1,
0.9442747, 0.2992487, -0.614666, 0.9372549, 0, 1, 1,
0.9466715, 1.128338, 0.3751702, 0.945098, 0, 1, 1,
0.9491339, -1.745141, 1.606692, 0.9490196, 0, 1, 1,
0.9503596, 0.4848181, 2.421568, 0.9568627, 0, 1, 1,
0.9513616, 0.09539788, -0.1716918, 0.9607843, 0, 1, 1,
0.9531042, 0.6593684, 1.324696, 0.9686275, 0, 1, 1,
0.9532966, 0.4244571, 2.609084, 0.972549, 0, 1, 1,
0.9595623, 1.406159, 1.156033, 0.9803922, 0, 1, 1,
0.961692, -0.1473481, 1.656755, 0.9843137, 0, 1, 1,
0.9702792, -1.51575, 3.536774, 0.9921569, 0, 1, 1,
0.9708793, -0.05775371, 2.401166, 0.9960784, 0, 1, 1,
0.9740667, 1.41492, 0.6402799, 1, 0, 0.9960784, 1,
0.9763557, -0.5980117, 1.030859, 1, 0, 0.9882353, 1,
0.9814022, -1.217956, 1.20925, 1, 0, 0.9843137, 1,
0.9847411, -1.254991, 0.6945632, 1, 0, 0.9764706, 1,
0.9933168, -0.36194, 2.638226, 1, 0, 0.972549, 1,
0.9939368, -0.1893161, 0.5587402, 1, 0, 0.9647059, 1,
0.9949349, -0.08810509, 1.964205, 1, 0, 0.9607843, 1,
0.9975733, -0.4949651, 1.797246, 1, 0, 0.9529412, 1,
1.003672, 0.9139823, 0.9136341, 1, 0, 0.9490196, 1,
1.007959, 0.04795729, 0.5492851, 1, 0, 0.9411765, 1,
1.013933, -1.799031, 1.151735, 1, 0, 0.9372549, 1,
1.021624, 1.651136, 0.5691332, 1, 0, 0.9294118, 1,
1.024524, -1.739988, 2.709997, 1, 0, 0.9254902, 1,
1.027929, -0.6861548, 1.27606, 1, 0, 0.9176471, 1,
1.035479, -2.444675, 2.37851, 1, 0, 0.9137255, 1,
1.040353, 1.171081, -0.5585051, 1, 0, 0.9058824, 1,
1.042848, 0.1865885, 2.284386, 1, 0, 0.9019608, 1,
1.050913, -0.1861443, 2.763772, 1, 0, 0.8941177, 1,
1.055452, -0.1477577, 3.01623, 1, 0, 0.8862745, 1,
1.055473, -0.5768775, 1.581543, 1, 0, 0.8823529, 1,
1.057879, 0.004217396, 1.840113, 1, 0, 0.8745098, 1,
1.071478, 0.8898137, 1.666605, 1, 0, 0.8705882, 1,
1.073496, 1.328002, -0.4552973, 1, 0, 0.8627451, 1,
1.076785, -0.564265, 1.080964, 1, 0, 0.8588235, 1,
1.082544, 0.8972528, -0.4864354, 1, 0, 0.8509804, 1,
1.083612, 1.217701, 1.694732, 1, 0, 0.8470588, 1,
1.085611, 1.313281, 0.4280308, 1, 0, 0.8392157, 1,
1.0982, 0.6214134, 2.090035, 1, 0, 0.8352941, 1,
1.101392, 0.7526658, -0.1409995, 1, 0, 0.827451, 1,
1.101859, 0.5757776, 0.540976, 1, 0, 0.8235294, 1,
1.107584, -1.192199, 2.604501, 1, 0, 0.8156863, 1,
1.115251, 0.04713072, 2.938741, 1, 0, 0.8117647, 1,
1.11774, 0.7365788, -1.128162, 1, 0, 0.8039216, 1,
1.137193, 1.214227, 0.002562366, 1, 0, 0.7960784, 1,
1.142243, 1.628537, 0.7107155, 1, 0, 0.7921569, 1,
1.146755, 0.9781007, 0.4860716, 1, 0, 0.7843137, 1,
1.151892, 0.497242, 0.7962043, 1, 0, 0.7803922, 1,
1.152855, 0.183513, 0.3211332, 1, 0, 0.772549, 1,
1.167659, 1.046964, 0.0410199, 1, 0, 0.7686275, 1,
1.167659, 0.1447832, 2.569496, 1, 0, 0.7607843, 1,
1.181571, 0.04126473, 1.146084, 1, 0, 0.7568628, 1,
1.18434, 2.149014, -0.1326096, 1, 0, 0.7490196, 1,
1.187602, 0.08434492, 1.019533, 1, 0, 0.7450981, 1,
1.198596, -0.8752542, 3.555107, 1, 0, 0.7372549, 1,
1.199473, -1.569648, 2.566076, 1, 0, 0.7333333, 1,
1.210576, 1.572072, 1.881112, 1, 0, 0.7254902, 1,
1.212574, -0.08411738, 2.432799, 1, 0, 0.7215686, 1,
1.218765, -0.9835106, 2.257419, 1, 0, 0.7137255, 1,
1.219937, 1.510613, 2.181984, 1, 0, 0.7098039, 1,
1.225286, 0.7714804, -0.6126363, 1, 0, 0.7019608, 1,
1.238786, -1.148129, 0.7756817, 1, 0, 0.6941177, 1,
1.239926, -2.00054, 2.644896, 1, 0, 0.6901961, 1,
1.244313, -0.522862, 3.43586, 1, 0, 0.682353, 1,
1.251306, 0.6248891, 0.999205, 1, 0, 0.6784314, 1,
1.251903, -1.323194, 0.4219154, 1, 0, 0.6705883, 1,
1.268891, -0.2954876, 2.10632, 1, 0, 0.6666667, 1,
1.271932, -1.477721, 3.262083, 1, 0, 0.6588235, 1,
1.272317, 0.7830054, 0.9216007, 1, 0, 0.654902, 1,
1.274458, 1.934984, 0.6673352, 1, 0, 0.6470588, 1,
1.274957, -0.03960089, 0.9227096, 1, 0, 0.6431373, 1,
1.280362, 0.05032163, 1.418689, 1, 0, 0.6352941, 1,
1.282386, -0.3540278, 1.477706, 1, 0, 0.6313726, 1,
1.28407, -0.6839236, 0.4416301, 1, 0, 0.6235294, 1,
1.284582, -0.5947576, 1.465098, 1, 0, 0.6196079, 1,
1.297502, 0.7778808, 1.664667, 1, 0, 0.6117647, 1,
1.300725, -0.6533114, 2.166401, 1, 0, 0.6078432, 1,
1.309828, 0.02205336, 1.848551, 1, 0, 0.6, 1,
1.324913, -1.008926, 2.122541, 1, 0, 0.5921569, 1,
1.328659, -1.732909, 3.075132, 1, 0, 0.5882353, 1,
1.331226, -0.1891285, 1.996794, 1, 0, 0.5803922, 1,
1.332076, -1.980836, 2.981107, 1, 0, 0.5764706, 1,
1.334203, 0.2008532, -0.2247177, 1, 0, 0.5686275, 1,
1.334212, -0.6242961, 4.512154, 1, 0, 0.5647059, 1,
1.341375, 0.3317158, 1.444653, 1, 0, 0.5568628, 1,
1.342368, 0.06288438, 0.9962841, 1, 0, 0.5529412, 1,
1.353408, 0.8906423, 0.1769497, 1, 0, 0.5450981, 1,
1.359821, 1.147024, 0.7554209, 1, 0, 0.5411765, 1,
1.369029, 0.3870803, 3.124154, 1, 0, 0.5333334, 1,
1.379898, -0.2200104, 2.901635, 1, 0, 0.5294118, 1,
1.383969, -1.051139, 1.220174, 1, 0, 0.5215687, 1,
1.398505, 1.478816, 1.176773, 1, 0, 0.5176471, 1,
1.41621, -0.2913238, -0.1363967, 1, 0, 0.509804, 1,
1.416756, 0.6969824, 1.142151, 1, 0, 0.5058824, 1,
1.417421, -0.3119401, 2.977671, 1, 0, 0.4980392, 1,
1.41782, -0.215022, 0.3007382, 1, 0, 0.4901961, 1,
1.419016, -0.7423205, 3.870233, 1, 0, 0.4862745, 1,
1.425602, -1.412451, 1.861301, 1, 0, 0.4784314, 1,
1.441123, -0.6769562, 2.599392, 1, 0, 0.4745098, 1,
1.443671, -1.465088, 2.913089, 1, 0, 0.4666667, 1,
1.446327, -0.2180454, 1.66599, 1, 0, 0.4627451, 1,
1.46893, 0.5251893, 1.70706, 1, 0, 0.454902, 1,
1.487206, 0.9799495, -0.03954317, 1, 0, 0.4509804, 1,
1.491266, -0.4032339, 1.110198, 1, 0, 0.4431373, 1,
1.496922, -0.381684, -0.260237, 1, 0, 0.4392157, 1,
1.516539, -0.908824, 3.879964, 1, 0, 0.4313726, 1,
1.51845, 1.299177, 1.273032, 1, 0, 0.427451, 1,
1.52191, -0.9307309, 1.333173, 1, 0, 0.4196078, 1,
1.52239, -2.943042, 2.472438, 1, 0, 0.4156863, 1,
1.522431, -0.4007663, 4.29007, 1, 0, 0.4078431, 1,
1.524534, 0.2940676, 2.311635, 1, 0, 0.4039216, 1,
1.532025, 0.5346266, 3.141191, 1, 0, 0.3960784, 1,
1.55238, -0.06315474, 1.049016, 1, 0, 0.3882353, 1,
1.561009, 0.1662003, 1.768696, 1, 0, 0.3843137, 1,
1.568059, 0.9416404, 0.02888907, 1, 0, 0.3764706, 1,
1.590382, -0.9046468, 1.414919, 1, 0, 0.372549, 1,
1.608636, 1.605199, -0.4593083, 1, 0, 0.3647059, 1,
1.610589, -0.435772, 1.25404, 1, 0, 0.3607843, 1,
1.650379, -1.409291, 2.093226, 1, 0, 0.3529412, 1,
1.660587, 1.498526, 1.178998, 1, 0, 0.3490196, 1,
1.663862, 0.2536494, 1.172636, 1, 0, 0.3411765, 1,
1.663971, 1.223262, 0.5552153, 1, 0, 0.3372549, 1,
1.702914, -0.3355395, 1.919349, 1, 0, 0.3294118, 1,
1.704791, -0.6089273, 1.165576, 1, 0, 0.3254902, 1,
1.712061, -1.501843, 1.600749, 1, 0, 0.3176471, 1,
1.733828, 1.221367, 0.3811412, 1, 0, 0.3137255, 1,
1.741808, 1.457158, 2.4492, 1, 0, 0.3058824, 1,
1.746195, 0.5196187, 2.752933, 1, 0, 0.2980392, 1,
1.74941, 0.9658675, 0.9867437, 1, 0, 0.2941177, 1,
1.75893, 0.00716877, 1.870625, 1, 0, 0.2862745, 1,
1.763375, -0.2331595, 1.392597, 1, 0, 0.282353, 1,
1.772533, -0.07341091, 0.9705755, 1, 0, 0.2745098, 1,
1.778543, 0.2139203, 1.743363, 1, 0, 0.2705882, 1,
1.779634, 0.7680181, 0.4931915, 1, 0, 0.2627451, 1,
1.801805, -1.194542, 2.848778, 1, 0, 0.2588235, 1,
1.81457, 0.01001688, 2.58864, 1, 0, 0.2509804, 1,
1.816381, 0.7041562, 1.16171, 1, 0, 0.2470588, 1,
1.831783, -0.6733834, 1.999879, 1, 0, 0.2392157, 1,
1.836167, 0.3572989, -0.1068098, 1, 0, 0.2352941, 1,
1.846572, 0.05275109, 3.179143, 1, 0, 0.227451, 1,
1.84899, -0.5606704, 1.881336, 1, 0, 0.2235294, 1,
1.863068, 0.9644699, 0.9457671, 1, 0, 0.2156863, 1,
1.864565, -1.269922, 1.12379, 1, 0, 0.2117647, 1,
1.87267, 1.166948, 0.5409701, 1, 0, 0.2039216, 1,
1.873463, 0.06902481, 1.503459, 1, 0, 0.1960784, 1,
1.881236, -0.431057, 2.149549, 1, 0, 0.1921569, 1,
1.882753, -0.2156543, 1.348582, 1, 0, 0.1843137, 1,
1.883534, -0.8093699, 1.334905, 1, 0, 0.1803922, 1,
1.900897, 1.240415, -0.3184606, 1, 0, 0.172549, 1,
1.902449, 0.7538457, 3.123638, 1, 0, 0.1686275, 1,
1.92889, 0.2370732, 0.8909077, 1, 0, 0.1607843, 1,
1.949154, 0.4480117, 2.554641, 1, 0, 0.1568628, 1,
1.97845, -1.374073, 1.819919, 1, 0, 0.1490196, 1,
2.037113, -0.2626973, 1.809825, 1, 0, 0.145098, 1,
2.093317, -0.1753315, 1.664941, 1, 0, 0.1372549, 1,
2.126599, -0.272971, 2.438239, 1, 0, 0.1333333, 1,
2.13437, -0.94649, 1.756082, 1, 0, 0.1254902, 1,
2.214327, 1.281695, 0.5652651, 1, 0, 0.1215686, 1,
2.246169, -0.6153408, 2.21313, 1, 0, 0.1137255, 1,
2.254238, 0.5753917, 2.833314, 1, 0, 0.1098039, 1,
2.263448, 0.8653674, 0.749697, 1, 0, 0.1019608, 1,
2.269208, -0.3048956, 1.384927, 1, 0, 0.09411765, 1,
2.275434, 0.3688126, 1.48575, 1, 0, 0.09019608, 1,
2.278728, 0.1459073, 2.398296, 1, 0, 0.08235294, 1,
2.279893, 0.6684238, 0.8434593, 1, 0, 0.07843138, 1,
2.284401, -0.8372603, 0.8628404, 1, 0, 0.07058824, 1,
2.304088, 0.5401837, 1.57513, 1, 0, 0.06666667, 1,
2.310299, 0.2438484, 0.9469029, 1, 0, 0.05882353, 1,
2.32197, 1.541366, 0.8053519, 1, 0, 0.05490196, 1,
2.322385, 0.6424021, -0.5252061, 1, 0, 0.04705882, 1,
2.345768, -1.565268, 2.48123, 1, 0, 0.04313726, 1,
2.415105, 1.599879, 2.831045, 1, 0, 0.03529412, 1,
2.437827, 1.293678, 1.933396, 1, 0, 0.03137255, 1,
2.4384, -0.02087981, 0.2125236, 1, 0, 0.02352941, 1,
2.44227, 1.006319, 1.283007, 1, 0, 0.01960784, 1,
2.572696, 0.821462, 0.3902484, 1, 0, 0.01176471, 1,
3.069525, -0.2518587, 1.628862, 1, 0, 0.007843138, 1
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
-0.01000249, -4.682137, -6.949161, 0, -0.5, 0.5, 0.5,
-0.01000249, -4.682137, -6.949161, 1, -0.5, 0.5, 0.5,
-0.01000249, -4.682137, -6.949161, 1, 1.5, 0.5, 0.5,
-0.01000249, -4.682137, -6.949161, 0, 1.5, 0.5, 0.5
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
-4.13349, -0.3689029, -6.949161, 0, -0.5, 0.5, 0.5,
-4.13349, -0.3689029, -6.949161, 1, -0.5, 0.5, 0.5,
-4.13349, -0.3689029, -6.949161, 1, 1.5, 0.5, 0.5,
-4.13349, -0.3689029, -6.949161, 0, 1.5, 0.5, 0.5
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
-4.13349, -4.682137, -0.2763712, 0, -0.5, 0.5, 0.5,
-4.13349, -4.682137, -0.2763712, 1, -0.5, 0.5, 0.5,
-4.13349, -4.682137, -0.2763712, 1, 1.5, 0.5, 0.5,
-4.13349, -4.682137, -0.2763712, 0, 1.5, 0.5, 0.5
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
-3, -3.686775, -5.409286,
3, -3.686775, -5.409286,
-3, -3.686775, -5.409286,
-3, -3.852669, -5.665932,
-2, -3.686775, -5.409286,
-2, -3.852669, -5.665932,
-1, -3.686775, -5.409286,
-1, -3.852669, -5.665932,
0, -3.686775, -5.409286,
0, -3.852669, -5.665932,
1, -3.686775, -5.409286,
1, -3.852669, -5.665932,
2, -3.686775, -5.409286,
2, -3.852669, -5.665932,
3, -3.686775, -5.409286,
3, -3.852669, -5.665932
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
-3, -4.184456, -6.179224, 0, -0.5, 0.5, 0.5,
-3, -4.184456, -6.179224, 1, -0.5, 0.5, 0.5,
-3, -4.184456, -6.179224, 1, 1.5, 0.5, 0.5,
-3, -4.184456, -6.179224, 0, 1.5, 0.5, 0.5,
-2, -4.184456, -6.179224, 0, -0.5, 0.5, 0.5,
-2, -4.184456, -6.179224, 1, -0.5, 0.5, 0.5,
-2, -4.184456, -6.179224, 1, 1.5, 0.5, 0.5,
-2, -4.184456, -6.179224, 0, 1.5, 0.5, 0.5,
-1, -4.184456, -6.179224, 0, -0.5, 0.5, 0.5,
-1, -4.184456, -6.179224, 1, -0.5, 0.5, 0.5,
-1, -4.184456, -6.179224, 1, 1.5, 0.5, 0.5,
-1, -4.184456, -6.179224, 0, 1.5, 0.5, 0.5,
0, -4.184456, -6.179224, 0, -0.5, 0.5, 0.5,
0, -4.184456, -6.179224, 1, -0.5, 0.5, 0.5,
0, -4.184456, -6.179224, 1, 1.5, 0.5, 0.5,
0, -4.184456, -6.179224, 0, 1.5, 0.5, 0.5,
1, -4.184456, -6.179224, 0, -0.5, 0.5, 0.5,
1, -4.184456, -6.179224, 1, -0.5, 0.5, 0.5,
1, -4.184456, -6.179224, 1, 1.5, 0.5, 0.5,
1, -4.184456, -6.179224, 0, 1.5, 0.5, 0.5,
2, -4.184456, -6.179224, 0, -0.5, 0.5, 0.5,
2, -4.184456, -6.179224, 1, -0.5, 0.5, 0.5,
2, -4.184456, -6.179224, 1, 1.5, 0.5, 0.5,
2, -4.184456, -6.179224, 0, 1.5, 0.5, 0.5,
3, -4.184456, -6.179224, 0, -0.5, 0.5, 0.5,
3, -4.184456, -6.179224, 1, -0.5, 0.5, 0.5,
3, -4.184456, -6.179224, 1, 1.5, 0.5, 0.5,
3, -4.184456, -6.179224, 0, 1.5, 0.5, 0.5
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
-3.181916, -3, -5.409286,
-3.181916, 2, -5.409286,
-3.181916, -3, -5.409286,
-3.340512, -3, -5.665932,
-3.181916, -2, -5.409286,
-3.340512, -2, -5.665932,
-3.181916, -1, -5.409286,
-3.340512, -1, -5.665932,
-3.181916, 0, -5.409286,
-3.340512, 0, -5.665932,
-3.181916, 1, -5.409286,
-3.340512, 1, -5.665932,
-3.181916, 2, -5.409286,
-3.340512, 2, -5.665932
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
-3.657703, -3, -6.179224, 0, -0.5, 0.5, 0.5,
-3.657703, -3, -6.179224, 1, -0.5, 0.5, 0.5,
-3.657703, -3, -6.179224, 1, 1.5, 0.5, 0.5,
-3.657703, -3, -6.179224, 0, 1.5, 0.5, 0.5,
-3.657703, -2, -6.179224, 0, -0.5, 0.5, 0.5,
-3.657703, -2, -6.179224, 1, -0.5, 0.5, 0.5,
-3.657703, -2, -6.179224, 1, 1.5, 0.5, 0.5,
-3.657703, -2, -6.179224, 0, 1.5, 0.5, 0.5,
-3.657703, -1, -6.179224, 0, -0.5, 0.5, 0.5,
-3.657703, -1, -6.179224, 1, -0.5, 0.5, 0.5,
-3.657703, -1, -6.179224, 1, 1.5, 0.5, 0.5,
-3.657703, -1, -6.179224, 0, 1.5, 0.5, 0.5,
-3.657703, 0, -6.179224, 0, -0.5, 0.5, 0.5,
-3.657703, 0, -6.179224, 1, -0.5, 0.5, 0.5,
-3.657703, 0, -6.179224, 1, 1.5, 0.5, 0.5,
-3.657703, 0, -6.179224, 0, 1.5, 0.5, 0.5,
-3.657703, 1, -6.179224, 0, -0.5, 0.5, 0.5,
-3.657703, 1, -6.179224, 1, -0.5, 0.5, 0.5,
-3.657703, 1, -6.179224, 1, 1.5, 0.5, 0.5,
-3.657703, 1, -6.179224, 0, 1.5, 0.5, 0.5,
-3.657703, 2, -6.179224, 0, -0.5, 0.5, 0.5,
-3.657703, 2, -6.179224, 1, -0.5, 0.5, 0.5,
-3.657703, 2, -6.179224, 1, 1.5, 0.5, 0.5,
-3.657703, 2, -6.179224, 0, 1.5, 0.5, 0.5
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
-3.181916, -3.686775, -4,
-3.181916, -3.686775, 4,
-3.181916, -3.686775, -4,
-3.340512, -3.852669, -4,
-3.181916, -3.686775, -2,
-3.340512, -3.852669, -2,
-3.181916, -3.686775, 0,
-3.340512, -3.852669, 0,
-3.181916, -3.686775, 2,
-3.340512, -3.852669, 2,
-3.181916, -3.686775, 4,
-3.340512, -3.852669, 4
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
-3.657703, -4.184456, -4, 0, -0.5, 0.5, 0.5,
-3.657703, -4.184456, -4, 1, -0.5, 0.5, 0.5,
-3.657703, -4.184456, -4, 1, 1.5, 0.5, 0.5,
-3.657703, -4.184456, -4, 0, 1.5, 0.5, 0.5,
-3.657703, -4.184456, -2, 0, -0.5, 0.5, 0.5,
-3.657703, -4.184456, -2, 1, -0.5, 0.5, 0.5,
-3.657703, -4.184456, -2, 1, 1.5, 0.5, 0.5,
-3.657703, -4.184456, -2, 0, 1.5, 0.5, 0.5,
-3.657703, -4.184456, 0, 0, -0.5, 0.5, 0.5,
-3.657703, -4.184456, 0, 1, -0.5, 0.5, 0.5,
-3.657703, -4.184456, 0, 1, 1.5, 0.5, 0.5,
-3.657703, -4.184456, 0, 0, 1.5, 0.5, 0.5,
-3.657703, -4.184456, 2, 0, -0.5, 0.5, 0.5,
-3.657703, -4.184456, 2, 1, -0.5, 0.5, 0.5,
-3.657703, -4.184456, 2, 1, 1.5, 0.5, 0.5,
-3.657703, -4.184456, 2, 0, 1.5, 0.5, 0.5,
-3.657703, -4.184456, 4, 0, -0.5, 0.5, 0.5,
-3.657703, -4.184456, 4, 1, -0.5, 0.5, 0.5,
-3.657703, -4.184456, 4, 1, 1.5, 0.5, 0.5,
-3.657703, -4.184456, 4, 0, 1.5, 0.5, 0.5
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
-3.181916, -3.686775, -5.409286,
-3.181916, 2.948969, -5.409286,
-3.181916, -3.686775, 4.856544,
-3.181916, 2.948969, 4.856544,
-3.181916, -3.686775, -5.409286,
-3.181916, -3.686775, 4.856544,
-3.181916, 2.948969, -5.409286,
-3.181916, 2.948969, 4.856544,
-3.181916, -3.686775, -5.409286,
3.161911, -3.686775, -5.409286,
-3.181916, -3.686775, 4.856544,
3.161911, -3.686775, 4.856544,
-3.181916, 2.948969, -5.409286,
3.161911, 2.948969, -5.409286,
-3.181916, 2.948969, 4.856544,
3.161911, 2.948969, 4.856544,
3.161911, -3.686775, -5.409286,
3.161911, 2.948969, -5.409286,
3.161911, -3.686775, 4.856544,
3.161911, 2.948969, 4.856544,
3.161911, -3.686775, -5.409286,
3.161911, -3.686775, 4.856544,
3.161911, 2.948969, -5.409286,
3.161911, 2.948969, 4.856544
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
var radius = 7.353913;
var distance = 32.71839;
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
mvMatrix.translate( 0.01000249, 0.3689029, 0.2763712 );
mvMatrix.scale( 1.253375, 1.198237, 0.7745302 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.71839);
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
InChI_1S_C5H12NO3PS2<-read.table("InChI_1S_C5H12NO3PS2.xyz")
```

```
## Error in read.table("InChI_1S_C5H12NO3PS2.xyz"): no lines available in input
```

```r
x<-InChI_1S_C5H12NO3PS2$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C5H12NO3PS2' not found
```

```r
y<-InChI_1S_C5H12NO3PS2$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C5H12NO3PS2' not found
```

```r
z<-InChI_1S_C5H12NO3PS2$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C5H12NO3PS2' not found
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
-3.08953, 1.420982, -1.408981, 0, 0, 1, 1, 1,
-2.953681, 0.4060959, -2.325981, 1, 0, 0, 1, 1,
-2.712878, -0.02236478, -1.353143, 1, 0, 0, 1, 1,
-2.706977, -0.9976195, -1.189837, 1, 0, 0, 1, 1,
-2.665967, -1.008538, -2.599716, 1, 0, 0, 1, 1,
-2.650892, -0.4234865, -1.32948, 1, 0, 0, 1, 1,
-2.449992, 0.9322616, -0.9905779, 0, 0, 0, 1, 1,
-2.440026, -0.4035959, -0.396698, 0, 0, 0, 1, 1,
-2.362898, 0.1309098, -0.4562099, 0, 0, 0, 1, 1,
-2.35919, 0.4627335, 0.3909887, 0, 0, 0, 1, 1,
-2.340241, 2.400687, 0.786863, 0, 0, 0, 1, 1,
-2.296584, 2.03547, -3.071834, 0, 0, 0, 1, 1,
-2.215237, -1.870642, -3.650686, 0, 0, 0, 1, 1,
-2.197307, -0.1857411, -1.999334, 1, 1, 1, 1, 1,
-2.138444, 1.648034, -0.2842461, 1, 1, 1, 1, 1,
-2.097697, 1.190468, -1.71224, 1, 1, 1, 1, 1,
-2.084603, 1.67011, -0.8271316, 1, 1, 1, 1, 1,
-2.057308, -0.4478209, -1.138263, 1, 1, 1, 1, 1,
-2.050891, 0.001440705, -2.324845, 1, 1, 1, 1, 1,
-2.049612, -0.0002024765, -0.7718691, 1, 1, 1, 1, 1,
-2.022642, 0.3586913, -1.713876, 1, 1, 1, 1, 1,
-2.015547, 0.009427824, 0.0772626, 1, 1, 1, 1, 1,
-2.014675, -0.9084827, -1.497528, 1, 1, 1, 1, 1,
-1.989539, -1.318072, -0.7173465, 1, 1, 1, 1, 1,
-1.98028, 0.6084397, -0.377016, 1, 1, 1, 1, 1,
-1.963221, 0.04329286, -0.6305959, 1, 1, 1, 1, 1,
-1.957831, 0.6828723, -0.5960416, 1, 1, 1, 1, 1,
-1.94701, -1.066738, -0.9698337, 1, 1, 1, 1, 1,
-1.939145, 0.8823139, -1.941912, 0, 0, 1, 1, 1,
-1.9118, 1.892989, 0.6732931, 1, 0, 0, 1, 1,
-1.896476, 0.3120207, -2.843822, 1, 0, 0, 1, 1,
-1.889655, -0.4612237, -3.580121, 1, 0, 0, 1, 1,
-1.882443, 0.1401742, -0.725596, 1, 0, 0, 1, 1,
-1.877973, -0.4121798, 0.5114449, 1, 0, 0, 1, 1,
-1.870441, -1.09295, -1.921948, 0, 0, 0, 1, 1,
-1.86464, -1.398074, -3.342219, 0, 0, 0, 1, 1,
-1.856548, -0.2610386, -0.3399325, 0, 0, 0, 1, 1,
-1.836624, -0.2088482, -2.314037, 0, 0, 0, 1, 1,
-1.835238, 1.421708, -2.692111, 0, 0, 0, 1, 1,
-1.835227, -0.6984394, -1.896411, 0, 0, 0, 1, 1,
-1.832073, -0.8418199, -1.750761, 0, 0, 0, 1, 1,
-1.806384, 0.177698, -2.272258, 1, 1, 1, 1, 1,
-1.795882, 0.1499126, -1.517275, 1, 1, 1, 1, 1,
-1.782076, -0.3113708, -2.175604, 1, 1, 1, 1, 1,
-1.776144, 0.6503133, -1.900389, 1, 1, 1, 1, 1,
-1.767957, 0.389402, 0.02489089, 1, 1, 1, 1, 1,
-1.767809, -0.2468056, -2.123205, 1, 1, 1, 1, 1,
-1.763975, -2.270431, -2.054995, 1, 1, 1, 1, 1,
-1.757289, 0.7681059, -1.377517, 1, 1, 1, 1, 1,
-1.75342, 0.4753936, 0.5540377, 1, 1, 1, 1, 1,
-1.749473, -0.5461208, -1.141104, 1, 1, 1, 1, 1,
-1.745169, -0.4601589, -2.831905, 1, 1, 1, 1, 1,
-1.741054, 0.5265108, -2.323084, 1, 1, 1, 1, 1,
-1.724649, 0.590676, -0.7389709, 1, 1, 1, 1, 1,
-1.718683, 0.3969035, -3.329921, 1, 1, 1, 1, 1,
-1.70857, -0.5488913, -3.12167, 1, 1, 1, 1, 1,
-1.692813, 0.1533082, -2.491266, 0, 0, 1, 1, 1,
-1.688476, 0.5243911, 0.08719334, 1, 0, 0, 1, 1,
-1.667079, 0.8050009, -0.6867443, 1, 0, 0, 1, 1,
-1.666061, 0.5626109, -1.595238, 1, 0, 0, 1, 1,
-1.665145, -0.9948729, -1.928236, 1, 0, 0, 1, 1,
-1.646549, 1.431452, -0.08301158, 1, 0, 0, 1, 1,
-1.643456, 0.2780075, -1.163155, 0, 0, 0, 1, 1,
-1.620595, -1.912296, -1.965648, 0, 0, 0, 1, 1,
-1.61627, 0.4052745, -0.958685, 0, 0, 0, 1, 1,
-1.60499, 0.03145096, -0.8237389, 0, 0, 0, 1, 1,
-1.60297, 0.2927465, -0.5656434, 0, 0, 0, 1, 1,
-1.594697, -0.9003751, -3.0054, 0, 0, 0, 1, 1,
-1.586403, -0.9314178, -1.967362, 0, 0, 0, 1, 1,
-1.583082, 0.1577472, -1.454421, 1, 1, 1, 1, 1,
-1.57982, -1.127865, -2.151876, 1, 1, 1, 1, 1,
-1.572252, -0.8947312, -0.7745052, 1, 1, 1, 1, 1,
-1.56018, -0.3563807, -1.215871, 1, 1, 1, 1, 1,
-1.558997, 1.498523, -1.150853, 1, 1, 1, 1, 1,
-1.546814, 0.5998164, 0.3050428, 1, 1, 1, 1, 1,
-1.533672, 0.4692577, -1.36073, 1, 1, 1, 1, 1,
-1.53151, 0.3936937, -1.531275, 1, 1, 1, 1, 1,
-1.52517, -1.061288, -2.096191, 1, 1, 1, 1, 1,
-1.519153, 0.3142968, -1.468148, 1, 1, 1, 1, 1,
-1.510728, -1.949329, -2.105837, 1, 1, 1, 1, 1,
-1.506829, 0.7649738, -0.2331852, 1, 1, 1, 1, 1,
-1.484303, -2.007306, -2.190258, 1, 1, 1, 1, 1,
-1.469659, 0.7181288, -1.195693, 1, 1, 1, 1, 1,
-1.463285, -1.492815, -2.02416, 1, 1, 1, 1, 1,
-1.46324, -1.064427, -1.448255, 0, 0, 1, 1, 1,
-1.457581, 0.896925, -0.9511063, 1, 0, 0, 1, 1,
-1.455894, 1.037324, 0.4029493, 1, 0, 0, 1, 1,
-1.452264, 1.143769, -0.9014175, 1, 0, 0, 1, 1,
-1.44953, 0.4929512, -2.192182, 1, 0, 0, 1, 1,
-1.448323, 1.690722, -1.661379, 1, 0, 0, 1, 1,
-1.442041, -0.7364321, -3.281638, 0, 0, 0, 1, 1,
-1.433368, -1.25334, -2.577816, 0, 0, 0, 1, 1,
-1.422075, 0.4443108, 0.01975979, 0, 0, 0, 1, 1,
-1.420961, 1.336109, -0.9646628, 0, 0, 0, 1, 1,
-1.418603, -1.117566, -1.678177, 0, 0, 0, 1, 1,
-1.413075, 0.002667669, -0.6946903, 0, 0, 0, 1, 1,
-1.407039, 0.7197055, -1.341945, 0, 0, 0, 1, 1,
-1.39903, -1.236133, -2.581141, 1, 1, 1, 1, 1,
-1.38984, -1.004458, -1.102829, 1, 1, 1, 1, 1,
-1.388663, -2.557709, -1.363034, 1, 1, 1, 1, 1,
-1.384031, 0.1386247, -1.363775, 1, 1, 1, 1, 1,
-1.369808, -0.9738243, -2.041978, 1, 1, 1, 1, 1,
-1.364952, -1.146884, -0.7983643, 1, 1, 1, 1, 1,
-1.363419, -0.7566978, -2.632279, 1, 1, 1, 1, 1,
-1.35818, -1.31383, -0.3649959, 1, 1, 1, 1, 1,
-1.352188, 1.067418, -1.384851, 1, 1, 1, 1, 1,
-1.351339, -0.1440443, -1.55564, 1, 1, 1, 1, 1,
-1.346457, -0.242413, -1.165905, 1, 1, 1, 1, 1,
-1.342208, 0.9267666, -1.620123, 1, 1, 1, 1, 1,
-1.341182, -0.6623381, -2.54993, 1, 1, 1, 1, 1,
-1.322807, 0.5444018, -3.413898, 1, 1, 1, 1, 1,
-1.317823, -0.8817672, -2.753047, 1, 1, 1, 1, 1,
-1.308499, 0.6986445, -1.298062, 0, 0, 1, 1, 1,
-1.289285, 0.7490273, -1.35219, 1, 0, 0, 1, 1,
-1.286157, -1.542534, -1.901874, 1, 0, 0, 1, 1,
-1.281445, 1.507653, -2.626705, 1, 0, 0, 1, 1,
-1.275861, 0.03589217, -1.355381, 1, 0, 0, 1, 1,
-1.274061, -0.5247148, -1.474062, 1, 0, 0, 1, 1,
-1.269473, 1.269252, -0.2595435, 0, 0, 0, 1, 1,
-1.260643, -0.062166, -2.19209, 0, 0, 0, 1, 1,
-1.252164, 0.1546319, -0.2512183, 0, 0, 0, 1, 1,
-1.244128, 0.5771222, -1.863855, 0, 0, 0, 1, 1,
-1.243752, -0.3805951, -2.191329, 0, 0, 0, 1, 1,
-1.234691, -0.7780311, -1.75786, 0, 0, 0, 1, 1,
-1.224268, -1.12588, -0.3644146, 0, 0, 0, 1, 1,
-1.218453, -1.303049, -3.8925, 1, 1, 1, 1, 1,
-1.218148, -0.8273307, -1.701107, 1, 1, 1, 1, 1,
-1.211241, -0.7340763, -1.743318, 1, 1, 1, 1, 1,
-1.205952, -0.1399985, -0.9615321, 1, 1, 1, 1, 1,
-1.204713, 0.5038627, -0.4258776, 1, 1, 1, 1, 1,
-1.199518, 0.7597544, -1.000683, 1, 1, 1, 1, 1,
-1.195943, 1.479326, 0.7065231, 1, 1, 1, 1, 1,
-1.193018, -0.5679553, -0.8989009, 1, 1, 1, 1, 1,
-1.192589, 0.12716, 0.971904, 1, 1, 1, 1, 1,
-1.186689, 0.2626, -0.9295301, 1, 1, 1, 1, 1,
-1.181988, -1.030166, -2.759221, 1, 1, 1, 1, 1,
-1.176768, 0.1329745, -1.941443, 1, 1, 1, 1, 1,
-1.172319, -0.7316967, -0.437819, 1, 1, 1, 1, 1,
-1.170703, 0.5148025, -2.032062, 1, 1, 1, 1, 1,
-1.166833, 1.062847, -0.2378589, 1, 1, 1, 1, 1,
-1.166049, 1.926584, 1.069318, 0, 0, 1, 1, 1,
-1.16163, -0.2653101, -1.935305, 1, 0, 0, 1, 1,
-1.155908, 0.05327074, -1.765308, 1, 0, 0, 1, 1,
-1.155554, -1.027516, -2.465592, 1, 0, 0, 1, 1,
-1.151549, 1.479995, -2.372168, 1, 0, 0, 1, 1,
-1.150569, 1.230642, -1.44606, 1, 0, 0, 1, 1,
-1.146367, 0.2753104, -1.193988, 0, 0, 0, 1, 1,
-1.141745, -1.010437, -2.031646, 0, 0, 0, 1, 1,
-1.139196, 2.322195, -1.439771, 0, 0, 0, 1, 1,
-1.135201, -0.6758122, -2.540385, 0, 0, 0, 1, 1,
-1.133354, 0.1908247, -1.509275, 0, 0, 0, 1, 1,
-1.12617, -0.240664, -1.75839, 0, 0, 0, 1, 1,
-1.124905, 0.02055008, -3.111, 0, 0, 0, 1, 1,
-1.120641, 0.8730205, -1.516442, 1, 1, 1, 1, 1,
-1.112771, 0.7480663, -1.499955, 1, 1, 1, 1, 1,
-1.110627, -0.589098, -2.581015, 1, 1, 1, 1, 1,
-1.109742, 0.4216487, -0.70033, 1, 1, 1, 1, 1,
-1.103127, -0.5029225, -2.589549, 1, 1, 1, 1, 1,
-1.100355, 0.09132381, -3.079867, 1, 1, 1, 1, 1,
-1.09304, 0.4611951, 0.7811978, 1, 1, 1, 1, 1,
-1.087032, 0.4158294, -2.215733, 1, 1, 1, 1, 1,
-1.086839, 1.094077, -1.373479, 1, 1, 1, 1, 1,
-1.08605, 0.7538368, -1.295688, 1, 1, 1, 1, 1,
-1.068252, -0.4055297, -3.745162, 1, 1, 1, 1, 1,
-1.067964, -0.4843994, -1.830848, 1, 1, 1, 1, 1,
-1.062243, -0.9384329, -1.47617, 1, 1, 1, 1, 1,
-1.061621, 0.1489526, -1.352402, 1, 1, 1, 1, 1,
-1.059773, 0.5954442, -1.225075, 1, 1, 1, 1, 1,
-1.059485, -0.5377648, -3.050455, 0, 0, 1, 1, 1,
-1.058758, 0.2401277, -2.299555, 1, 0, 0, 1, 1,
-1.044715, 0.5015664, -0.7993321, 1, 0, 0, 1, 1,
-1.040777, -0.5172496, -2.601671, 1, 0, 0, 1, 1,
-1.039989, -1.565164, -2.502772, 1, 0, 0, 1, 1,
-1.039959, -1.081334, -1.938371, 1, 0, 0, 1, 1,
-1.038089, 0.1549315, -2.409148, 0, 0, 0, 1, 1,
-1.038057, -0.3761106, -1.121238, 0, 0, 0, 1, 1,
-1.033157, -1.950641, -2.509529, 0, 0, 0, 1, 1,
-1.032199, -1.041206, -0.2791636, 0, 0, 0, 1, 1,
-1.029613, 0.3472534, -1.811829, 0, 0, 0, 1, 1,
-1.028341, -1.221587, -2.592544, 0, 0, 0, 1, 1,
-1.019588, -1.172451, -1.841942, 0, 0, 0, 1, 1,
-1.019, -0.8401649, -2.643897, 1, 1, 1, 1, 1,
-1.017464, 0.5280177, -2.601362, 1, 1, 1, 1, 1,
-1.015076, 1.280867, -0.9264959, 1, 1, 1, 1, 1,
-1.014589, 0.4676833, -0.3364419, 1, 1, 1, 1, 1,
-1.013514, 1.24529, -1.6003, 1, 1, 1, 1, 1,
-1.010253, -0.1773596, -2.105952, 1, 1, 1, 1, 1,
-1.009035, 1.209072, -0.9203943, 1, 1, 1, 1, 1,
-1.000787, -0.5836872, -1.676288, 1, 1, 1, 1, 1,
-0.9901645, -0.5049686, -0.9663038, 1, 1, 1, 1, 1,
-0.98943, -1.10713, -2.533118, 1, 1, 1, 1, 1,
-0.9876419, -1.749152, -2.48106, 1, 1, 1, 1, 1,
-0.9869277, 0.2348924, -2.377655, 1, 1, 1, 1, 1,
-0.9843677, -1.386465, -3.481062, 1, 1, 1, 1, 1,
-0.9790585, 1.414871, -0.623069, 1, 1, 1, 1, 1,
-0.977527, -0.2219909, -1.546337, 1, 1, 1, 1, 1,
-0.9769185, 1.322686, 1.467983, 0, 0, 1, 1, 1,
-0.9767071, -0.7747998, -3.177734, 1, 0, 0, 1, 1,
-0.969262, 0.5142673, -1.555365, 1, 0, 0, 1, 1,
-0.9685769, -1.090735, -2.567988, 1, 0, 0, 1, 1,
-0.9649703, 0.8430337, -1.119685, 1, 0, 0, 1, 1,
-0.9633106, -0.6409134, -1.000733, 1, 0, 0, 1, 1,
-0.9629647, 0.09624819, -2.362136, 0, 0, 0, 1, 1,
-0.9602972, 1.078127, 0.240513, 0, 0, 0, 1, 1,
-0.9486853, -1.416381, -2.765841, 0, 0, 0, 1, 1,
-0.947872, 1.496148, -1.380663, 0, 0, 0, 1, 1,
-0.938051, -1.117004, -0.7859042, 0, 0, 0, 1, 1,
-0.9355606, 1.293969, -0.955128, 0, 0, 0, 1, 1,
-0.9328234, 1.312446, 0.3413455, 0, 0, 0, 1, 1,
-0.9324535, 1.073671, -1.371782, 1, 1, 1, 1, 1,
-0.9311324, 0.1917738, -2.809053, 1, 1, 1, 1, 1,
-0.9307364, -0.2429111, -0.0796703, 1, 1, 1, 1, 1,
-0.9297583, 0.168068, -2.232319, 1, 1, 1, 1, 1,
-0.9238605, -0.6596336, -1.709337, 1, 1, 1, 1, 1,
-0.9233384, 1.079896, -1.803815, 1, 1, 1, 1, 1,
-0.9227399, -0.184644, -3.054706, 1, 1, 1, 1, 1,
-0.9202117, 0.03953465, 0.692525, 1, 1, 1, 1, 1,
-0.9199045, 0.2859938, -0.3449447, 1, 1, 1, 1, 1,
-0.9154543, -0.9402491, -3.055139, 1, 1, 1, 1, 1,
-0.9131, -0.4835418, -3.073373, 1, 1, 1, 1, 1,
-0.912605, 2.612139, 1.125878, 1, 1, 1, 1, 1,
-0.9062902, 1.023978, -0.3280713, 1, 1, 1, 1, 1,
-0.9058803, 2.469169, 0.2371264, 1, 1, 1, 1, 1,
-0.9031737, 0.0806765, -1.409973, 1, 1, 1, 1, 1,
-0.9007195, 0.1061924, -1.867393, 0, 0, 1, 1, 1,
-0.9007026, 0.3798839, -2.395332, 1, 0, 0, 1, 1,
-0.9001349, 0.464407, -0.5379738, 1, 0, 0, 1, 1,
-0.8847989, 0.8507642, 0.9474753, 1, 0, 0, 1, 1,
-0.8833437, -1.280603, -3.455165, 1, 0, 0, 1, 1,
-0.8826646, 0.2536106, -1.532915, 1, 0, 0, 1, 1,
-0.8803412, -0.3036471, -0.9739044, 0, 0, 0, 1, 1,
-0.8738589, -0.1625234, -2.095128, 0, 0, 0, 1, 1,
-0.8628315, 0.002600003, -0.4434527, 0, 0, 0, 1, 1,
-0.8628129, -0.7124516, -2.859273, 0, 0, 0, 1, 1,
-0.8627001, -0.7293827, -2.194377, 0, 0, 0, 1, 1,
-0.8623657, -0.3252399, -2.589439, 0, 0, 0, 1, 1,
-0.8618497, -1.592677, -3.545787, 0, 0, 0, 1, 1,
-0.859867, -0.2805095, -1.208041, 1, 1, 1, 1, 1,
-0.8544736, 1.09742, -1.623918, 1, 1, 1, 1, 1,
-0.8537891, -1.672535, -4.093868, 1, 1, 1, 1, 1,
-0.8483908, 1.28448, 0.3187554, 1, 1, 1, 1, 1,
-0.8460919, 1.386497, -0.4914777, 1, 1, 1, 1, 1,
-0.8452337, 1.443193, 0.05024435, 1, 1, 1, 1, 1,
-0.8435615, -0.7474028, -1.465704, 1, 1, 1, 1, 1,
-0.8428856, 0.3143766, -0.1573434, 1, 1, 1, 1, 1,
-0.839156, -0.04674961, -4.095127, 1, 1, 1, 1, 1,
-0.8370242, -0.5310067, -0.9554769, 1, 1, 1, 1, 1,
-0.8358465, 1.462575, -1.065128, 1, 1, 1, 1, 1,
-0.8309334, 0.6065554, -1.411112, 1, 1, 1, 1, 1,
-0.8295802, 1.030348, -1.727732, 1, 1, 1, 1, 1,
-0.8275902, -0.2168963, -3.002616, 1, 1, 1, 1, 1,
-0.8154953, -0.2775435, -2.825611, 1, 1, 1, 1, 1,
-0.8102198, -0.6572308, -1.92506, 0, 0, 1, 1, 1,
-0.8031896, -0.9810119, -1.927725, 1, 0, 0, 1, 1,
-0.8028263, 0.9915322, -1.908598, 1, 0, 0, 1, 1,
-0.8020878, 0.09157293, 0.01493315, 1, 0, 0, 1, 1,
-0.7986516, 1.200855, -1.158156, 1, 0, 0, 1, 1,
-0.7979536, 0.888114, -1.441568, 1, 0, 0, 1, 1,
-0.7973247, 0.269019, -1.770341, 0, 0, 0, 1, 1,
-0.7897426, 0.7505594, -1.635143, 0, 0, 0, 1, 1,
-0.7848731, -0.1802691, -2.747577, 0, 0, 0, 1, 1,
-0.7779478, 2.268095, -1.238114, 0, 0, 0, 1, 1,
-0.7775744, 0.320217, -2.671337, 0, 0, 0, 1, 1,
-0.7717479, 0.4005392, -1.001235, 0, 0, 0, 1, 1,
-0.761034, -0.2367598, -2.858881, 0, 0, 0, 1, 1,
-0.7600667, -1.272009, -3.321979, 1, 1, 1, 1, 1,
-0.7513381, -0.4135497, -3.982171, 1, 1, 1, 1, 1,
-0.7512452, -0.4492035, -0.508075, 1, 1, 1, 1, 1,
-0.7490264, -0.7617691, -1.780743, 1, 1, 1, 1, 1,
-0.7489129, -0.5005116, -0.4060876, 1, 1, 1, 1, 1,
-0.7462024, 0.7238683, -1.456721, 1, 1, 1, 1, 1,
-0.7398376, -0.7842315, -3.748476, 1, 1, 1, 1, 1,
-0.7360039, 0.2013022, -1.695303, 1, 1, 1, 1, 1,
-0.7334995, 0.04778223, 0.07650475, 1, 1, 1, 1, 1,
-0.7331799, 0.2529888, -0.3562826, 1, 1, 1, 1, 1,
-0.7287397, 1.485674, 0.591935, 1, 1, 1, 1, 1,
-0.7162392, -0.8332472, -2.575112, 1, 1, 1, 1, 1,
-0.7086514, 0.4175073, -1.271402, 1, 1, 1, 1, 1,
-0.7086041, -2.045183, -3.513088, 1, 1, 1, 1, 1,
-0.7047826, 0.8038216, -1.277007, 1, 1, 1, 1, 1,
-0.6957316, 0.3872392, -1.615284, 0, 0, 1, 1, 1,
-0.6880385, -1.248388, -1.018214, 1, 0, 0, 1, 1,
-0.6788939, 1.714923, -0.3598115, 1, 0, 0, 1, 1,
-0.6698215, 1.1407, -1.06875, 1, 0, 0, 1, 1,
-0.6693356, 1.621642, -1.004237, 1, 0, 0, 1, 1,
-0.6679752, -0.7729835, -1.799088, 1, 0, 0, 1, 1,
-0.6649794, -0.2898011, -2.776177, 0, 0, 0, 1, 1,
-0.6648861, 0.3080745, -1.750094, 0, 0, 0, 1, 1,
-0.6590248, 0.2931406, -0.7838824, 0, 0, 0, 1, 1,
-0.6583218, -0.3035772, -1.544811, 0, 0, 0, 1, 1,
-0.6540345, -0.1955069, -1.494423, 0, 0, 0, 1, 1,
-0.6462716, -0.2203623, -3.187972, 0, 0, 0, 1, 1,
-0.6422488, 1.074558, -1.607801, 0, 0, 0, 1, 1,
-0.628618, 0.4746205, -3.077105, 1, 1, 1, 1, 1,
-0.6267695, 2.247198, -0.1480154, 1, 1, 1, 1, 1,
-0.6243463, -0.9283261, -3.09611, 1, 1, 1, 1, 1,
-0.6219864, -0.2376054, -1.782781, 1, 1, 1, 1, 1,
-0.6187667, 1.285217, -2.18203, 1, 1, 1, 1, 1,
-0.6176421, 1.142871, -1.004073, 1, 1, 1, 1, 1,
-0.6054892, 0.2358625, -1.741114, 1, 1, 1, 1, 1,
-0.6024182, 0.07135881, -2.746464, 1, 1, 1, 1, 1,
-0.6004557, -1.088424, -2.268795, 1, 1, 1, 1, 1,
-0.5939797, 0.2076039, -2.890861, 1, 1, 1, 1, 1,
-0.5865052, -0.2310888, -2.068967, 1, 1, 1, 1, 1,
-0.5831527, -0.0352043, -0.29473, 1, 1, 1, 1, 1,
-0.5826765, 1.939992, 0.1001561, 1, 1, 1, 1, 1,
-0.5817742, -1.596126, -4.638763, 1, 1, 1, 1, 1,
-0.5797821, 0.2404732, -1.539787, 1, 1, 1, 1, 1,
-0.5775148, 0.3307336, -1.199269, 0, 0, 1, 1, 1,
-0.5748423, 2.852332, 0.1750006, 1, 0, 0, 1, 1,
-0.5717751, 0.4479285, -1.34737, 1, 0, 0, 1, 1,
-0.571335, 2.269251, -1.045932, 1, 0, 0, 1, 1,
-0.5639327, -0.8802854, -1.643256, 1, 0, 0, 1, 1,
-0.5629818, -2.160835, -3.515457, 1, 0, 0, 1, 1,
-0.5596262, -0.08363169, -2.75808, 0, 0, 0, 1, 1,
-0.5588766, 0.5926673, 0.1668846, 0, 0, 0, 1, 1,
-0.5569062, 0.429276, -1.480594, 0, 0, 0, 1, 1,
-0.555418, 0.1574631, -1.413062, 0, 0, 0, 1, 1,
-0.5452118, -0.4657739, -1.242928, 0, 0, 0, 1, 1,
-0.5424143, 1.129356, -0.7261659, 0, 0, 0, 1, 1,
-0.5405017, -1.075462, -2.918511, 0, 0, 0, 1, 1,
-0.5366505, -0.4350407, -0.789049, 1, 1, 1, 1, 1,
-0.5355272, 0.6085359, -0.6414561, 1, 1, 1, 1, 1,
-0.5313999, 2.352788, 1.168065, 1, 1, 1, 1, 1,
-0.5286675, 1.308034, -1.120448, 1, 1, 1, 1, 1,
-0.5258859, 0.672721, -0.2227381, 1, 1, 1, 1, 1,
-0.5249128, -0.4150891, -2.528403, 1, 1, 1, 1, 1,
-0.5245515, 0.4136162, -2.092393, 1, 1, 1, 1, 1,
-0.5240804, 1.569206, -0.7328337, 1, 1, 1, 1, 1,
-0.5163683, -1.497271, -3.578074, 1, 1, 1, 1, 1,
-0.5158857, 1.288828, -0.176697, 1, 1, 1, 1, 1,
-0.5134861, -1.698205, -3.296979, 1, 1, 1, 1, 1,
-0.509447, 1.5182, -2.575583, 1, 1, 1, 1, 1,
-0.5086327, -0.5703982, -2.051689, 1, 1, 1, 1, 1,
-0.5045539, 0.513255, -0.1489977, 1, 1, 1, 1, 1,
-0.5022333, 1.224927, -0.3266245, 1, 1, 1, 1, 1,
-0.5014784, -2.145297, -3.317871, 0, 0, 1, 1, 1,
-0.5005461, 1.078328, -0.4268923, 1, 0, 0, 1, 1,
-0.4987781, 0.09006288, -0.6875805, 1, 0, 0, 1, 1,
-0.497401, -0.5970086, -4.019862, 1, 0, 0, 1, 1,
-0.4972191, -0.9785908, -3.234072, 1, 0, 0, 1, 1,
-0.492705, 1.562428, 0.004387278, 1, 0, 0, 1, 1,
-0.4916595, 0.7680725, -0.1861347, 0, 0, 0, 1, 1,
-0.4858411, -1.567954, -3.201199, 0, 0, 0, 1, 1,
-0.4812737, 0.4679515, -0.6234999, 0, 0, 0, 1, 1,
-0.4783022, -0.4090966, -1.646674, 0, 0, 0, 1, 1,
-0.4777415, -0.2353693, -1.117414, 0, 0, 0, 1, 1,
-0.477101, -0.4433314, -3.171889, 0, 0, 0, 1, 1,
-0.4759649, 0.1996008, -4.72835, 0, 0, 0, 1, 1,
-0.4748849, 0.979746, -0.8966686, 1, 1, 1, 1, 1,
-0.472681, -1.239905, -2.884285, 1, 1, 1, 1, 1,
-0.470225, -0.6625336, -3.484029, 1, 1, 1, 1, 1,
-0.4701596, 0.4202144, -0.3994941, 1, 1, 1, 1, 1,
-0.4698822, 0.1040291, -1.908395, 1, 1, 1, 1, 1,
-0.4698125, 0.2771648, -0.6610458, 1, 1, 1, 1, 1,
-0.4663949, 0.09470096, -1.634756, 1, 1, 1, 1, 1,
-0.4648534, -1.249976, -3.733386, 1, 1, 1, 1, 1,
-0.4646652, -3.20533, -3.75869, 1, 1, 1, 1, 1,
-0.4641714, 1.908543, -0.2691521, 1, 1, 1, 1, 1,
-0.4614187, 0.2174817, -1.627917, 1, 1, 1, 1, 1,
-0.4570507, -0.8705412, -3.048835, 1, 1, 1, 1, 1,
-0.4557597, -1.620593, -4.523916, 1, 1, 1, 1, 1,
-0.4549827, -1.748626, -2.60361, 1, 1, 1, 1, 1,
-0.4521839, -0.5931541, -3.052272, 1, 1, 1, 1, 1,
-0.451501, -1.086788, -2.576783, 0, 0, 1, 1, 1,
-0.4481782, -0.4745374, -0.7561094, 1, 0, 0, 1, 1,
-0.4475558, -0.7880339, -1.412519, 1, 0, 0, 1, 1,
-0.440246, 0.1404787, -0.7275084, 1, 0, 0, 1, 1,
-0.4378429, -0.08600575, -1.754243, 1, 0, 0, 1, 1,
-0.4365742, -2.229157, -2.324164, 1, 0, 0, 1, 1,
-0.4340226, -0.6930333, -3.773882, 0, 0, 0, 1, 1,
-0.433922, 1.964916, 0.3896955, 0, 0, 0, 1, 1,
-0.4331948, -1.998099, -2.586305, 0, 0, 0, 1, 1,
-0.4329884, 1.200387, -1.017117, 0, 0, 0, 1, 1,
-0.4322135, 0.8727974, 1.676353, 0, 0, 0, 1, 1,
-0.4320014, 0.9262526, -1.434187, 0, 0, 0, 1, 1,
-0.4319854, 0.3393156, 0.7253522, 0, 0, 0, 1, 1,
-0.4272785, -0.6599461, -3.152571, 1, 1, 1, 1, 1,
-0.4207235, 0.690291, -0.2373792, 1, 1, 1, 1, 1,
-0.4203911, -1.907997, -2.5793, 1, 1, 1, 1, 1,
-0.4202365, -0.5074696, -3.364015, 1, 1, 1, 1, 1,
-0.4186193, 0.1958025, -0.969066, 1, 1, 1, 1, 1,
-0.4150903, -0.4438529, -2.383969, 1, 1, 1, 1, 1,
-0.4150605, -0.4213989, -2.808754, 1, 1, 1, 1, 1,
-0.4119605, 0.3816354, -2.00411, 1, 1, 1, 1, 1,
-0.4092248, -0.5924385, -2.236637, 1, 1, 1, 1, 1,
-0.4080576, 0.6034705, -2.054877, 1, 1, 1, 1, 1,
-0.4045739, -0.1953722, -1.280374, 1, 1, 1, 1, 1,
-0.4036517, 1.687896, 0.6505239, 1, 1, 1, 1, 1,
-0.4016627, -0.4594182, -2.426445, 1, 1, 1, 1, 1,
-0.3980212, -0.8683642, -1.637182, 1, 1, 1, 1, 1,
-0.3977022, -0.2933458, -1.338991, 1, 1, 1, 1, 1,
-0.3947391, -0.3729327, -1.297773, 0, 0, 1, 1, 1,
-0.3943454, -0.0566943, -0.5871174, 1, 0, 0, 1, 1,
-0.3918802, -0.1744213, -2.257273, 1, 0, 0, 1, 1,
-0.3914181, -1.049148, -2.116523, 1, 0, 0, 1, 1,
-0.387226, 0.7503175, 0.9653741, 1, 0, 0, 1, 1,
-0.3843393, 0.8376781, 0.3283252, 1, 0, 0, 1, 1,
-0.3836113, 0.2285238, -2.411813, 0, 0, 0, 1, 1,
-0.3742978, 0.9278105, -0.02813379, 0, 0, 0, 1, 1,
-0.3697094, -0.4719377, -1.244216, 0, 0, 0, 1, 1,
-0.3676886, -2.177151, -3.012416, 0, 0, 0, 1, 1,
-0.3658007, -0.1823609, -1.087474, 0, 0, 0, 1, 1,
-0.3618835, 0.2542835, -0.8877728, 0, 0, 0, 1, 1,
-0.3567965, 1.009356, -1.816782, 0, 0, 0, 1, 1,
-0.3560458, 1.181626, -1.445355, 1, 1, 1, 1, 1,
-0.3540388, 1.585327, -0.04104057, 1, 1, 1, 1, 1,
-0.3502147, -1.998909, -2.239008, 1, 1, 1, 1, 1,
-0.3412647, -0.6703069, -4.039074, 1, 1, 1, 1, 1,
-0.3408278, 0.7430343, -2.224566, 1, 1, 1, 1, 1,
-0.3395559, 0.4736509, -1.426127, 1, 1, 1, 1, 1,
-0.3373737, 0.2952786, -0.9265114, 1, 1, 1, 1, 1,
-0.3370014, 0.01072486, -2.928996, 1, 1, 1, 1, 1,
-0.3363861, 1.247871, -2.388208, 1, 1, 1, 1, 1,
-0.3342415, -0.6161659, -2.117381, 1, 1, 1, 1, 1,
-0.3337899, 0.3150823, -0.817426, 1, 1, 1, 1, 1,
-0.3330205, 1.32561, -0.2400455, 1, 1, 1, 1, 1,
-0.3303743, -0.6675911, -2.533838, 1, 1, 1, 1, 1,
-0.3285482, -0.5967713, -1.188654, 1, 1, 1, 1, 1,
-0.3277262, -0.9423149, -4.2289, 1, 1, 1, 1, 1,
-0.3223332, 0.8504224, -1.632917, 0, 0, 1, 1, 1,
-0.3180577, -1.69231, -1.910451, 1, 0, 0, 1, 1,
-0.3172986, -1.127839, -4.515563, 1, 0, 0, 1, 1,
-0.3151896, 0.5213819, -0.5879844, 1, 0, 0, 1, 1,
-0.3149275, 0.1416359, -0.7859564, 1, 0, 0, 1, 1,
-0.311079, 0.9304613, -0.9522886, 1, 0, 0, 1, 1,
-0.3086738, 0.5056219, 1.530553, 0, 0, 0, 1, 1,
-0.3077486, 0.6101562, 0.4424178, 0, 0, 0, 1, 1,
-0.3075673, 1.256581, 0.3187183, 0, 0, 0, 1, 1,
-0.3070281, -0.08835123, -2.535697, 0, 0, 0, 1, 1,
-0.3036077, 0.658057, 0.3108763, 0, 0, 0, 1, 1,
-0.2983107, -0.3986201, -3.263656, 0, 0, 0, 1, 1,
-0.2952579, -1.20571, -2.842536, 0, 0, 0, 1, 1,
-0.2942058, 0.4699083, -0.7129462, 1, 1, 1, 1, 1,
-0.2911206, 0.5301052, -1.214274, 1, 1, 1, 1, 1,
-0.2881311, 0.7675371, -0.7101799, 1, 1, 1, 1, 1,
-0.2863279, -0.2199057, -1.043455, 1, 1, 1, 1, 1,
-0.2791061, -1.760125, -2.070971, 1, 1, 1, 1, 1,
-0.2698151, -1.079166, -1.331084, 1, 1, 1, 1, 1,
-0.266936, 1.432922, 0.153091, 1, 1, 1, 1, 1,
-0.2666674, 0.5199325, -0.005154391, 1, 1, 1, 1, 1,
-0.266323, 0.5704438, 0.172738, 1, 1, 1, 1, 1,
-0.2579838, -0.2894647, -2.669691, 1, 1, 1, 1, 1,
-0.2568381, -0.9726805, -1.946518, 1, 1, 1, 1, 1,
-0.2551156, -1.178581, -5.259784, 1, 1, 1, 1, 1,
-0.2551079, 1.347916, 1.173322, 1, 1, 1, 1, 1,
-0.2511558, -1.515142, -2.321808, 1, 1, 1, 1, 1,
-0.2486849, 0.6123117, 1.12339, 1, 1, 1, 1, 1,
-0.2431332, 2.141161, -0.0681617, 0, 0, 1, 1, 1,
-0.2329494, -1.612276, -4.763527, 1, 0, 0, 1, 1,
-0.2314688, 1.256413, -0.3704852, 1, 0, 0, 1, 1,
-0.2288765, -0.03016956, -2.286006, 1, 0, 0, 1, 1,
-0.2280702, 0.6197634, -0.2884888, 1, 0, 0, 1, 1,
-0.2256523, -1.167961, -3.583033, 1, 0, 0, 1, 1,
-0.2243851, -0.6581107, -2.376999, 0, 0, 0, 1, 1,
-0.222257, 1.035036, 0.8571674, 0, 0, 0, 1, 1,
-0.2153033, 0.3844709, -0.5906194, 0, 0, 0, 1, 1,
-0.2064282, -1.128949, -4.233633, 0, 0, 0, 1, 1,
-0.1985729, 0.2529437, -0.8372676, 0, 0, 0, 1, 1,
-0.1984257, 0.1540886, -0.942837, 0, 0, 0, 1, 1,
-0.1942927, 1.274832, -0.2424759, 0, 0, 0, 1, 1,
-0.1929946, -3.590138, -1.154875, 1, 1, 1, 1, 1,
-0.1847978, 1.08983, -0.3053201, 1, 1, 1, 1, 1,
-0.1827331, 1.325397, 1.46388, 1, 1, 1, 1, 1,
-0.1809685, -0.02116332, -0.01579814, 1, 1, 1, 1, 1,
-0.1806978, 0.8807109, -0.720444, 1, 1, 1, 1, 1,
-0.178252, 0.4484016, -0.4433721, 1, 1, 1, 1, 1,
-0.1772513, 1.747033, 1.611955, 1, 1, 1, 1, 1,
-0.1753103, 0.0928283, -1.784496, 1, 1, 1, 1, 1,
-0.1739343, -1.443681, -2.609244, 1, 1, 1, 1, 1,
-0.1738437, 0.4112775, -0.9413387, 1, 1, 1, 1, 1,
-0.1672432, -0.5203013, -3.155147, 1, 1, 1, 1, 1,
-0.1629374, 0.2611253, 1.453298, 1, 1, 1, 1, 1,
-0.1614102, -0.7522856, -3.064466, 1, 1, 1, 1, 1,
-0.159597, 0.4921215, -0.3122992, 1, 1, 1, 1, 1,
-0.1580398, 0.674146, -1.701552, 1, 1, 1, 1, 1,
-0.1578795, -0.4188141, -2.564141, 0, 0, 1, 1, 1,
-0.1490198, -1.066703, -3.481729, 1, 0, 0, 1, 1,
-0.1435283, -0.0270268, -2.662577, 1, 0, 0, 1, 1,
-0.1429191, -0.7127758, -3.055218, 1, 0, 0, 1, 1,
-0.1409081, -1.342318, -2.408273, 1, 0, 0, 1, 1,
-0.1405289, -0.8773626, -2.892653, 1, 0, 0, 1, 1,
-0.138878, 0.6951458, 0.1234526, 0, 0, 0, 1, 1,
-0.1384066, -0.493615, -4.323129, 0, 0, 0, 1, 1,
-0.1370461, -1.157412, -1.851064, 0, 0, 0, 1, 1,
-0.1285571, -2.044055, -3.571672, 0, 0, 0, 1, 1,
-0.1270209, 0.4920346, 0.6033784, 0, 0, 0, 1, 1,
-0.1244207, -0.5314647, -3.419107, 0, 0, 0, 1, 1,
-0.1229635, 0.9482182, 0.6944573, 0, 0, 0, 1, 1,
-0.1170013, -0.165848, -1.794628, 1, 1, 1, 1, 1,
-0.1025805, 0.9408197, -1.406631, 1, 1, 1, 1, 1,
-0.1002896, -2.038051, -4.075687, 1, 1, 1, 1, 1,
-0.09909195, 0.3254626, -0.9854421, 1, 1, 1, 1, 1,
-0.0981643, -1.586836, -2.839201, 1, 1, 1, 1, 1,
-0.09489773, -0.6365635, -3.656756, 1, 1, 1, 1, 1,
-0.0926481, -1.111975, -1.944595, 1, 1, 1, 1, 1,
-0.08579592, 1.138768, -0.6366977, 1, 1, 1, 1, 1,
-0.0852195, 0.01573485, -0.2827039, 1, 1, 1, 1, 1,
-0.08285362, 1.551101, -0.7976465, 1, 1, 1, 1, 1,
-0.08047215, -0.1782406, -3.089292, 1, 1, 1, 1, 1,
-0.07245518, 0.3665882, 0.6191733, 1, 1, 1, 1, 1,
-0.07220585, 0.9517549, 1.444374, 1, 1, 1, 1, 1,
-0.06979138, 0.01152963, -0.3434041, 1, 1, 1, 1, 1,
-0.06871557, -0.7634832, -3.323454, 1, 1, 1, 1, 1,
-0.06225883, 0.9792919, -0.2041274, 0, 0, 1, 1, 1,
-0.05815728, -0.5153444, -1.991035, 1, 0, 0, 1, 1,
-0.05767937, 0.3996969, 0.6127737, 1, 0, 0, 1, 1,
-0.0547143, 0.9923702, -1.122745, 1, 0, 0, 1, 1,
-0.05249012, 0.8110281, 0.8713997, 1, 0, 0, 1, 1,
-0.04549237, 0.506415, 1.054686, 1, 0, 0, 1, 1,
-0.04348921, 0.7743863, -1.491969, 0, 0, 0, 1, 1,
-0.0419669, 0.7979457, -1.46151, 0, 0, 0, 1, 1,
-0.03666714, -0.7117953, -3.645552, 0, 0, 0, 1, 1,
-0.03448474, 1.561989, -0.1781272, 0, 0, 0, 1, 1,
-0.03122712, 0.476996, 0.480205, 0, 0, 0, 1, 1,
-0.02679605, 1.489275, -1.314769, 0, 0, 0, 1, 1,
-0.02556824, -0.01281809, -0.8083422, 0, 0, 0, 1, 1,
-0.02545086, 0.5229579, -0.1278191, 1, 1, 1, 1, 1,
-0.02486107, -0.04099081, -1.432263, 1, 1, 1, 1, 1,
-0.02264345, -1.663304, -1.252566, 1, 1, 1, 1, 1,
-0.02145944, -0.6061972, -2.748309, 1, 1, 1, 1, 1,
-0.01989915, 0.5587564, 1.888486, 1, 1, 1, 1, 1,
-0.01884132, -0.9373635, -2.701206, 1, 1, 1, 1, 1,
-0.01825574, -0.5900697, -3.419556, 1, 1, 1, 1, 1,
-0.01119692, -0.6749033, -0.8120294, 1, 1, 1, 1, 1,
-0.0093155, -2.517866, -3.573225, 1, 1, 1, 1, 1,
-0.007692999, 0.223396, -0.07975154, 1, 1, 1, 1, 1,
-0.005841311, 2.261011, -0.08915417, 1, 1, 1, 1, 1,
0.002254385, -0.08151864, 1.168244, 1, 1, 1, 1, 1,
0.002900503, 0.1329067, 1.418059, 1, 1, 1, 1, 1,
0.005101936, -0.2490744, 2.262875, 1, 1, 1, 1, 1,
0.005156049, -0.4031489, 4.106363, 1, 1, 1, 1, 1,
0.005252698, -0.1087625, 3.982728, 0, 0, 1, 1, 1,
0.006882604, -1.635907, 1.744925, 1, 0, 0, 1, 1,
0.007962969, -0.6426399, 3.240772, 1, 0, 0, 1, 1,
0.0116036, -0.6891192, 3.40538, 1, 0, 0, 1, 1,
0.01175159, -1.015991, 2.497246, 1, 0, 0, 1, 1,
0.01306651, -0.9933574, 1.860434, 1, 0, 0, 1, 1,
0.01398593, 0.7057567, 0.6766619, 0, 0, 0, 1, 1,
0.01401195, 0.6247275, -0.2922756, 0, 0, 0, 1, 1,
0.01597653, -1.216491, 2.896622, 0, 0, 0, 1, 1,
0.01851222, 0.3295075, -1.137794, 0, 0, 0, 1, 1,
0.02176478, 1.215876, 1.510542, 0, 0, 0, 1, 1,
0.02244162, -1.30824, 2.867331, 0, 0, 0, 1, 1,
0.02410989, 1.258998, 1.048279, 0, 0, 0, 1, 1,
0.02481775, -1.584884, 4.015985, 1, 1, 1, 1, 1,
0.02573751, 1.258929, 1.184363, 1, 1, 1, 1, 1,
0.02784946, 0.5293556, -0.9988285, 1, 1, 1, 1, 1,
0.02802411, -1.437972, 0.9099426, 1, 1, 1, 1, 1,
0.03294446, 0.556026, 0.4162067, 1, 1, 1, 1, 1,
0.03582964, 0.748449, 0.6768351, 1, 1, 1, 1, 1,
0.03648689, 0.165059, 0.3395767, 1, 1, 1, 1, 1,
0.0391673, -1.189276, 1.887695, 1, 1, 1, 1, 1,
0.04091528, -0.5560846, 4.707041, 1, 1, 1, 1, 1,
0.04510855, 0.1177547, 1.601613, 1, 1, 1, 1, 1,
0.04624119, 0.6438604, 0.2573169, 1, 1, 1, 1, 1,
0.04800156, 1.812113, -1.189031, 1, 1, 1, 1, 1,
0.05271668, -0.4607636, 3.036453, 1, 1, 1, 1, 1,
0.05710183, -0.361989, 3.3696, 1, 1, 1, 1, 1,
0.05730079, 0.9533919, -1.116578, 1, 1, 1, 1, 1,
0.05891494, 0.9390568, -0.1685089, 0, 0, 1, 1, 1,
0.06055987, -1.663738, 2.713388, 1, 0, 0, 1, 1,
0.06235738, -0.3462965, 2.574953, 1, 0, 0, 1, 1,
0.06430944, -0.8762458, 3.047371, 1, 0, 0, 1, 1,
0.06545285, -0.07151207, 2.150891, 1, 0, 0, 1, 1,
0.06617315, -0.4748064, 2.610218, 1, 0, 0, 1, 1,
0.06722649, -0.7576477, 1.442997, 0, 0, 0, 1, 1,
0.06906008, 0.5725819, 0.2486145, 0, 0, 0, 1, 1,
0.07096817, -1.109374, 2.054568, 0, 0, 0, 1, 1,
0.0891571, -0.9395627, 2.310387, 0, 0, 0, 1, 1,
0.09501903, 0.5039617, 0.7121401, 0, 0, 0, 1, 1,
0.0962689, -1.936729, 4.123385, 0, 0, 0, 1, 1,
0.09696963, 2.124056, 1.568058, 0, 0, 0, 1, 1,
0.09773792, 0.3384482, 0.2655107, 1, 1, 1, 1, 1,
0.09840644, -0.2668185, 2.775646, 1, 1, 1, 1, 1,
0.1084771, -0.7600037, 3.765185, 1, 1, 1, 1, 1,
0.1152756, -0.06318432, 3.664734, 1, 1, 1, 1, 1,
0.1196093, 0.42243, -0.1527333, 1, 1, 1, 1, 1,
0.1222314, 0.173641, 0.4128267, 1, 1, 1, 1, 1,
0.1240394, 0.8744267, -0.7261616, 1, 1, 1, 1, 1,
0.1245309, 1.945523, 1.642745, 1, 1, 1, 1, 1,
0.1337677, 0.955338, -1.098483, 1, 1, 1, 1, 1,
0.1378793, -0.7512382, 1.589276, 1, 1, 1, 1, 1,
0.1395018, 0.5457702, 0.389346, 1, 1, 1, 1, 1,
0.1441282, -1.76199, 2.76076, 1, 1, 1, 1, 1,
0.1452421, 0.8039891, -0.4689199, 1, 1, 1, 1, 1,
0.1467581, -0.3115594, 1.825485, 1, 1, 1, 1, 1,
0.1483627, 0.08940616, 2.158911, 1, 1, 1, 1, 1,
0.1486291, 1.27698, 0.3931797, 0, 0, 1, 1, 1,
0.1488083, 0.5838742, 0.3810622, 1, 0, 0, 1, 1,
0.1508196, 0.2468643, 1.49911, 1, 0, 0, 1, 1,
0.1514899, 1.194004, 1.168531, 1, 0, 0, 1, 1,
0.1537746, 1.661376, 1.290321, 1, 0, 0, 1, 1,
0.1561311, 1.463878, -1.67257, 1, 0, 0, 1, 1,
0.1562943, -0.0733458, 2.00444, 0, 0, 0, 1, 1,
0.1568703, -0.9015431, 3.307184, 0, 0, 0, 1, 1,
0.1595684, -2.104201, 3.459193, 0, 0, 0, 1, 1,
0.163343, -0.8076475, 2.866653, 0, 0, 0, 1, 1,
0.16433, 1.008856, 0.8320331, 0, 0, 0, 1, 1,
0.1653465, 0.6148739, 1.713324, 0, 0, 0, 1, 1,
0.1703236, 0.474582, 0.2338227, 0, 0, 0, 1, 1,
0.1847155, 0.2860983, 1.68977, 1, 1, 1, 1, 1,
0.1849443, 0.5109653, 1.000333, 1, 1, 1, 1, 1,
0.1881417, -1.625299, 3.477471, 1, 1, 1, 1, 1,
0.1891397, -0.9694592, 1.936079, 1, 1, 1, 1, 1,
0.193054, -0.7986856, 2.679711, 1, 1, 1, 1, 1,
0.1938327, -2.351903, 4.28288, 1, 1, 1, 1, 1,
0.1972593, -0.3367546, 3.242088, 1, 1, 1, 1, 1,
0.2069316, -1.431187, 3.199025, 1, 1, 1, 1, 1,
0.2248207, -0.5921604, 2.467733, 1, 1, 1, 1, 1,
0.2309056, 0.1897969, 1.075626, 1, 1, 1, 1, 1,
0.2402543, 2.383214, 1.784558, 1, 1, 1, 1, 1,
0.2466334, -0.7745019, 2.962483, 1, 1, 1, 1, 1,
0.2471037, -2.052837, 3.465569, 1, 1, 1, 1, 1,
0.2474704, 0.7158925, 0.649579, 1, 1, 1, 1, 1,
0.2482542, -0.9792287, 3.130949, 1, 1, 1, 1, 1,
0.2491331, 0.09576704, 1.037048, 0, 0, 1, 1, 1,
0.249465, -0.2274787, 2.766129, 1, 0, 0, 1, 1,
0.2521799, -1.818957, 3.274342, 1, 0, 0, 1, 1,
0.2564153, 0.1827521, 1.272307, 1, 0, 0, 1, 1,
0.25864, -0.2679243, 2.615937, 1, 0, 0, 1, 1,
0.2667382, 0.558032, -0.2342287, 1, 0, 0, 1, 1,
0.2670125, 0.05445543, 1.413302, 0, 0, 0, 1, 1,
0.2740284, -0.1279197, 2.475063, 0, 0, 0, 1, 1,
0.2802511, 0.3357961, -0.22584, 0, 0, 0, 1, 1,
0.285426, -0.5286703, 1.129663, 0, 0, 0, 1, 1,
0.2905503, -1.840352, 3.604548, 0, 0, 0, 1, 1,
0.2942715, -0.2055714, 2.643992, 0, 0, 0, 1, 1,
0.2989175, -0.8318622, 2.589898, 0, 0, 0, 1, 1,
0.3074563, 1.042409, 0.03220421, 1, 1, 1, 1, 1,
0.31915, 0.0519634, 0.7445238, 1, 1, 1, 1, 1,
0.3226896, -0.2930444, 3.253553, 1, 1, 1, 1, 1,
0.3229315, -0.6822426, 2.60886, 1, 1, 1, 1, 1,
0.3235559, -1.467488, 2.164886, 1, 1, 1, 1, 1,
0.3290219, 0.9398666, 0.3004211, 1, 1, 1, 1, 1,
0.3295839, -0.9739209, 2.660949, 1, 1, 1, 1, 1,
0.3376141, -1.179869, 2.081244, 1, 1, 1, 1, 1,
0.3409863, 0.009466397, 0.2436068, 1, 1, 1, 1, 1,
0.3413133, -0.6279345, 1.409155, 1, 1, 1, 1, 1,
0.3423305, -0.896468, 2.434371, 1, 1, 1, 1, 1,
0.3444993, 0.08734273, 0.9805925, 1, 1, 1, 1, 1,
0.3446323, -0.3915893, 0.9332977, 1, 1, 1, 1, 1,
0.3513623, -0.3142845, 2.558045, 1, 1, 1, 1, 1,
0.3532571, 1.260974, 1.43319, 1, 1, 1, 1, 1,
0.356667, -0.5301013, 3.011347, 0, 0, 1, 1, 1,
0.3602137, 1.764285, 2.044202, 1, 0, 0, 1, 1,
0.3638306, 0.4494494, 0.2682423, 1, 0, 0, 1, 1,
0.3640852, 0.3946206, -1.326901, 1, 0, 0, 1, 1,
0.3663877, -1.564319, 3.137378, 1, 0, 0, 1, 1,
0.3681599, 0.003222053, 2.284505, 1, 0, 0, 1, 1,
0.3700734, 0.5899029, 1.783572, 0, 0, 0, 1, 1,
0.3810517, 2.047251, 2.461397, 0, 0, 0, 1, 1,
0.3875732, 1.32146, 1.616867, 0, 0, 0, 1, 1,
0.3915475, 1.455196, 1.302715, 0, 0, 0, 1, 1,
0.391608, 0.9602112, 1.010054, 0, 0, 0, 1, 1,
0.392219, -1.739954, 4.322328, 0, 0, 0, 1, 1,
0.3931172, 0.9402135, 0.486318, 0, 0, 0, 1, 1,
0.3949752, 0.7877662, 1.081179, 1, 1, 1, 1, 1,
0.3958822, -0.4126362, 2.6684, 1, 1, 1, 1, 1,
0.4006507, 0.03077813, 1.758007, 1, 1, 1, 1, 1,
0.4014323, -0.1337966, 1.49505, 1, 1, 1, 1, 1,
0.4034853, 0.6126938, -0.4603723, 1, 1, 1, 1, 1,
0.4059029, 0.005336342, 0.5042254, 1, 1, 1, 1, 1,
0.4213386, 1.010692, 0.9090142, 1, 1, 1, 1, 1,
0.4243978, 0.4078279, 1.683488, 1, 1, 1, 1, 1,
0.4246002, 0.194824, 2.246115, 1, 1, 1, 1, 1,
0.4264193, 0.5649785, 1.341236, 1, 1, 1, 1, 1,
0.4269767, -0.241484, 2.059279, 1, 1, 1, 1, 1,
0.4284665, 0.3147167, 0.8389618, 1, 1, 1, 1, 1,
0.4382533, -0.6707802, 2.874755, 1, 1, 1, 1, 1,
0.4389886, -1.524518, 3.375422, 1, 1, 1, 1, 1,
0.4446195, 0.4604374, 0.8153756, 1, 1, 1, 1, 1,
0.4540873, 0.6494939, 0.04236899, 0, 0, 1, 1, 1,
0.4566096, 0.8956767, -0.2028217, 1, 0, 0, 1, 1,
0.457922, 0.2924341, 0.3264524, 1, 0, 0, 1, 1,
0.4590084, 0.4055645, 0.1315379, 1, 0, 0, 1, 1,
0.4647177, -1.910704, 3.150161, 1, 0, 0, 1, 1,
0.46472, -0.0742762, 0.8167087, 1, 0, 0, 1, 1,
0.4649116, -0.1453046, 1.554297, 0, 0, 0, 1, 1,
0.4659236, -0.05270891, 1.073596, 0, 0, 0, 1, 1,
0.479361, 0.8429321, -0.6430429, 0, 0, 0, 1, 1,
0.4805186, 0.7192133, -0.1410726, 0, 0, 0, 1, 1,
0.482777, -1.462511, 1.900481, 0, 0, 0, 1, 1,
0.4839869, 0.590606, -1.975422, 0, 0, 0, 1, 1,
0.4881594, -0.4509812, 2.99321, 0, 0, 0, 1, 1,
0.4919381, -1.198702, 2.205061, 1, 1, 1, 1, 1,
0.4924761, 0.9595649, 2.277372, 1, 1, 1, 1, 1,
0.4925172, 0.4772863, 3.150289, 1, 1, 1, 1, 1,
0.4970018, -0.2929461, 2.400661, 1, 1, 1, 1, 1,
0.5011138, -0.720149, 1.819589, 1, 1, 1, 1, 1,
0.5082614, -0.2489443, 3.325069, 1, 1, 1, 1, 1,
0.508943, 0.4439701, 0.2170163, 1, 1, 1, 1, 1,
0.5091081, 0.1791691, 2.203269, 1, 1, 1, 1, 1,
0.5150956, 0.9533393, -0.1008665, 1, 1, 1, 1, 1,
0.5163653, 0.2316678, 1.790657, 1, 1, 1, 1, 1,
0.5221109, -0.95652, 3.278149, 1, 1, 1, 1, 1,
0.5223719, -0.3611045, 2.592299, 1, 1, 1, 1, 1,
0.5223784, 0.4604021, 0.852125, 1, 1, 1, 1, 1,
0.5261907, -1.479864, 4.453396, 1, 1, 1, 1, 1,
0.5269176, -0.7163145, 2.761074, 1, 1, 1, 1, 1,
0.5328034, -0.01549939, 2.336985, 0, 0, 1, 1, 1,
0.53324, 0.5934781, 1.316146, 1, 0, 0, 1, 1,
0.5441821, -0.2469293, 1.680977, 1, 0, 0, 1, 1,
0.545346, 0.6578199, 0.7976415, 1, 0, 0, 1, 1,
0.5474733, 0.6592227, -1.408659, 1, 0, 0, 1, 1,
0.5491021, -0.246933, 1.291456, 1, 0, 0, 1, 1,
0.5661678, 0.4253795, 0.5665979, 0, 0, 0, 1, 1,
0.5667784, 1.615053, 0.1353589, 0, 0, 0, 1, 1,
0.5668766, 0.9685519, 1.008627, 0, 0, 0, 1, 1,
0.5694324, 0.2623447, -0.4983835, 0, 0, 0, 1, 1,
0.5712087, -0.3835762, 1.713622, 0, 0, 0, 1, 1,
0.5715407, -0.2649359, 3.977671, 0, 0, 0, 1, 1,
0.574691, -0.1246213, 1.51811, 0, 0, 0, 1, 1,
0.5813136, 0.6353405, 1.291931, 1, 1, 1, 1, 1,
0.5913523, 0.09962621, 0.8903039, 1, 1, 1, 1, 1,
0.5923764, 1.551723, 1.057709, 1, 1, 1, 1, 1,
0.5931178, -0.4583149, 2.40819, 1, 1, 1, 1, 1,
0.5985614, -1.652834, 1.920967, 1, 1, 1, 1, 1,
0.5997606, -1.859771, 1.285022, 1, 1, 1, 1, 1,
0.6001564, 0.1177478, 3.528894, 1, 1, 1, 1, 1,
0.6026932, 1.493608, 1.649491, 1, 1, 1, 1, 1,
0.611281, -0.2061255, 1.980463, 1, 1, 1, 1, 1,
0.6129524, -0.8307859, 2.439503, 1, 1, 1, 1, 1,
0.613302, -1.689893, 2.996655, 1, 1, 1, 1, 1,
0.6141056, 0.7058938, 0.08393534, 1, 1, 1, 1, 1,
0.6160403, -0.2252941, 1.751017, 1, 1, 1, 1, 1,
0.6176494, 0.8754164, 0.1418381, 1, 1, 1, 1, 1,
0.6182497, -1.27491, 2.966609, 1, 1, 1, 1, 1,
0.618383, 0.5895108, 0.2480156, 0, 0, 1, 1, 1,
0.6189069, -0.5601848, 1.970734, 1, 0, 0, 1, 1,
0.6220674, 1.649588, -0.5320779, 1, 0, 0, 1, 1,
0.6222044, -0.02314216, 3.052933, 1, 0, 0, 1, 1,
0.6244864, 0.3903913, 0.1250835, 1, 0, 0, 1, 1,
0.6312726, -1.051686, 2.611641, 1, 0, 0, 1, 1,
0.6348191, -1.665056, 4.676486, 0, 0, 0, 1, 1,
0.6348924, -0.612626, 0.6736258, 0, 0, 0, 1, 1,
0.6395783, -1.04367, 1.576057, 0, 0, 0, 1, 1,
0.6410151, -1.360043, 3.380619, 0, 0, 0, 1, 1,
0.6417131, -0.5486208, 2.269994, 0, 0, 0, 1, 1,
0.6458214, 0.3572181, 2.009979, 0, 0, 0, 1, 1,
0.6462474, -2.172717, 3.587411, 0, 0, 0, 1, 1,
0.6465374, -0.2456206, 1.25736, 1, 1, 1, 1, 1,
0.6519094, 0.8725782, 0.91682, 1, 1, 1, 1, 1,
0.6540199, -1.061792, 2.453669, 1, 1, 1, 1, 1,
0.6555544, -2.162174, 3.082636, 1, 1, 1, 1, 1,
0.6629518, -0.1012609, 1.38966, 1, 1, 1, 1, 1,
0.6673355, -0.6292493, 2.578119, 1, 1, 1, 1, 1,
0.6678427, 0.6385032, 0.5786025, 1, 1, 1, 1, 1,
0.6684593, -1.206335, 2.751467, 1, 1, 1, 1, 1,
0.6702985, 0.2133149, 0.7180562, 1, 1, 1, 1, 1,
0.6716672, 1.020447, 0.4980557, 1, 1, 1, 1, 1,
0.6793588, -0.3634068, 4.455816, 1, 1, 1, 1, 1,
0.6803693, 0.05868406, 1.69329, 1, 1, 1, 1, 1,
0.6844347, -0.5396305, 4.651917, 1, 1, 1, 1, 1,
0.6877187, -0.8190556, 2.01538, 1, 1, 1, 1, 1,
0.6900314, 0.07032149, 0.8415832, 1, 1, 1, 1, 1,
0.6939641, 0.4052503, -0.1007953, 0, 0, 1, 1, 1,
0.6970792, 1.082019, 0.7261373, 1, 0, 0, 1, 1,
0.6973855, -0.02401886, 2.275472, 1, 0, 0, 1, 1,
0.6985324, -0.3156773, 1.566509, 1, 0, 0, 1, 1,
0.7019574, -1.279476, 3.512247, 1, 0, 0, 1, 1,
0.7028374, -0.8637375, 2.618241, 1, 0, 0, 1, 1,
0.7042224, 1.3868, 1.029085, 0, 0, 0, 1, 1,
0.7125854, 1.345702, -0.7150221, 0, 0, 0, 1, 1,
0.7133502, 0.7945699, 1.770948, 0, 0, 0, 1, 1,
0.7134414, -0.2534892, 3.099327, 0, 0, 0, 1, 1,
0.7246264, 0.5620313, 0.9305488, 0, 0, 0, 1, 1,
0.7255355, 0.2546399, 1.042526, 0, 0, 0, 1, 1,
0.7314692, 1.272217, 0.4823041, 0, 0, 0, 1, 1,
0.7338687, -1.669198, 1.752159, 1, 1, 1, 1, 1,
0.7401993, -0.1627928, 1.263171, 1, 1, 1, 1, 1,
0.7431293, -0.01406228, 2.304744, 1, 1, 1, 1, 1,
0.7443804, -0.1203463, 3.129494, 1, 1, 1, 1, 1,
0.751264, 0.7381575, -0.6228315, 1, 1, 1, 1, 1,
0.752598, -1.814967, 3.293652, 1, 1, 1, 1, 1,
0.7605188, 0.8115874, 2.249978, 1, 1, 1, 1, 1,
0.7619386, 0.4821505, 2.589795, 1, 1, 1, 1, 1,
0.7637062, 0.373001, 1.016135, 1, 1, 1, 1, 1,
0.7643937, -0.5635816, 1.770309, 1, 1, 1, 1, 1,
0.7762151, 1.953453, -0.6358179, 1, 1, 1, 1, 1,
0.7776114, 0.8463905, 1.382512, 1, 1, 1, 1, 1,
0.7846335, -0.4903212, 2.522866, 1, 1, 1, 1, 1,
0.7895705, -0.9935308, 3.359424, 1, 1, 1, 1, 1,
0.790032, 1.056428, 1.532309, 1, 1, 1, 1, 1,
0.7911798, 0.789016, -2.765986, 0, 0, 1, 1, 1,
0.7912923, 1.798072, 0.5054224, 1, 0, 0, 1, 1,
0.7951752, 0.3189066, -1.702745, 1, 0, 0, 1, 1,
0.8014633, 1.583373, 0.7673545, 1, 0, 0, 1, 1,
0.8039492, 0.5524907, -1.137537, 1, 0, 0, 1, 1,
0.8118965, -1.227877, 3.766437, 1, 0, 0, 1, 1,
0.813531, -0.312494, 3.134121, 0, 0, 0, 1, 1,
0.8220533, 0.6095644, 1.539828, 0, 0, 0, 1, 1,
0.8235876, -0.6469308, 1.471122, 0, 0, 0, 1, 1,
0.8282997, 1.081524, 0.3857506, 0, 0, 0, 1, 1,
0.8300468, 0.6003706, -1.096775, 0, 0, 0, 1, 1,
0.833908, 0.8534664, 0.7237236, 0, 0, 0, 1, 1,
0.8339191, -0.9574343, 2.257714, 0, 0, 0, 1, 1,
0.8355411, -1.507843, 1.977942, 1, 1, 1, 1, 1,
0.8383948, 0.5197558, 1.341972, 1, 1, 1, 1, 1,
0.8390433, 1.34055, 2.004965, 1, 1, 1, 1, 1,
0.8392762, -1.22149, 2.911865, 1, 1, 1, 1, 1,
0.8403365, 0.8132534, -0.1868609, 1, 1, 1, 1, 1,
0.8424298, 0.2851801, 0.1943354, 1, 1, 1, 1, 1,
0.8449333, -0.5356546, 4.374753, 1, 1, 1, 1, 1,
0.8457376, 0.08900366, 2.167381, 1, 1, 1, 1, 1,
0.8521658, 1.138904, -0.6821465, 1, 1, 1, 1, 1,
0.8578216, -0.09966619, 0.8609055, 1, 1, 1, 1, 1,
0.8629434, -0.8667513, 1.657821, 1, 1, 1, 1, 1,
0.8701428, -0.6549513, 2.409561, 1, 1, 1, 1, 1,
0.8708305, -1.380706, 1.162806, 1, 1, 1, 1, 1,
0.8712636, 0.2749983, 1.625487, 1, 1, 1, 1, 1,
0.8740829, -0.6500365, 1.227249, 1, 1, 1, 1, 1,
0.8773679, 1.084159, 1.84438, 0, 0, 1, 1, 1,
0.880707, -0.2259041, 1.51188, 1, 0, 0, 1, 1,
0.8818418, 0.9381786, 0.6161566, 1, 0, 0, 1, 1,
0.8917174, -0.733414, 3.752282, 1, 0, 0, 1, 1,
0.9017573, 0.03888397, 0.5452328, 1, 0, 0, 1, 1,
0.9090574, -0.6944771, 2.623795, 1, 0, 0, 1, 1,
0.9101349, 0.715134, 3.084147, 0, 0, 0, 1, 1,
0.9122306, 0.5049295, 0.7011203, 0, 0, 0, 1, 1,
0.9170684, -1.072127, 2.496591, 0, 0, 0, 1, 1,
0.9280797, -1.822999, 3.493869, 0, 0, 0, 1, 1,
0.9336855, 0.6514573, 1.788042, 0, 0, 0, 1, 1,
0.9442747, 0.2992487, -0.614666, 0, 0, 0, 1, 1,
0.9466715, 1.128338, 0.3751702, 0, 0, 0, 1, 1,
0.9491339, -1.745141, 1.606692, 1, 1, 1, 1, 1,
0.9503596, 0.4848181, 2.421568, 1, 1, 1, 1, 1,
0.9513616, 0.09539788, -0.1716918, 1, 1, 1, 1, 1,
0.9531042, 0.6593684, 1.324696, 1, 1, 1, 1, 1,
0.9532966, 0.4244571, 2.609084, 1, 1, 1, 1, 1,
0.9595623, 1.406159, 1.156033, 1, 1, 1, 1, 1,
0.961692, -0.1473481, 1.656755, 1, 1, 1, 1, 1,
0.9702792, -1.51575, 3.536774, 1, 1, 1, 1, 1,
0.9708793, -0.05775371, 2.401166, 1, 1, 1, 1, 1,
0.9740667, 1.41492, 0.6402799, 1, 1, 1, 1, 1,
0.9763557, -0.5980117, 1.030859, 1, 1, 1, 1, 1,
0.9814022, -1.217956, 1.20925, 1, 1, 1, 1, 1,
0.9847411, -1.254991, 0.6945632, 1, 1, 1, 1, 1,
0.9933168, -0.36194, 2.638226, 1, 1, 1, 1, 1,
0.9939368, -0.1893161, 0.5587402, 1, 1, 1, 1, 1,
0.9949349, -0.08810509, 1.964205, 0, 0, 1, 1, 1,
0.9975733, -0.4949651, 1.797246, 1, 0, 0, 1, 1,
1.003672, 0.9139823, 0.9136341, 1, 0, 0, 1, 1,
1.007959, 0.04795729, 0.5492851, 1, 0, 0, 1, 1,
1.013933, -1.799031, 1.151735, 1, 0, 0, 1, 1,
1.021624, 1.651136, 0.5691332, 1, 0, 0, 1, 1,
1.024524, -1.739988, 2.709997, 0, 0, 0, 1, 1,
1.027929, -0.6861548, 1.27606, 0, 0, 0, 1, 1,
1.035479, -2.444675, 2.37851, 0, 0, 0, 1, 1,
1.040353, 1.171081, -0.5585051, 0, 0, 0, 1, 1,
1.042848, 0.1865885, 2.284386, 0, 0, 0, 1, 1,
1.050913, -0.1861443, 2.763772, 0, 0, 0, 1, 1,
1.055452, -0.1477577, 3.01623, 0, 0, 0, 1, 1,
1.055473, -0.5768775, 1.581543, 1, 1, 1, 1, 1,
1.057879, 0.004217396, 1.840113, 1, 1, 1, 1, 1,
1.071478, 0.8898137, 1.666605, 1, 1, 1, 1, 1,
1.073496, 1.328002, -0.4552973, 1, 1, 1, 1, 1,
1.076785, -0.564265, 1.080964, 1, 1, 1, 1, 1,
1.082544, 0.8972528, -0.4864354, 1, 1, 1, 1, 1,
1.083612, 1.217701, 1.694732, 1, 1, 1, 1, 1,
1.085611, 1.313281, 0.4280308, 1, 1, 1, 1, 1,
1.0982, 0.6214134, 2.090035, 1, 1, 1, 1, 1,
1.101392, 0.7526658, -0.1409995, 1, 1, 1, 1, 1,
1.101859, 0.5757776, 0.540976, 1, 1, 1, 1, 1,
1.107584, -1.192199, 2.604501, 1, 1, 1, 1, 1,
1.115251, 0.04713072, 2.938741, 1, 1, 1, 1, 1,
1.11774, 0.7365788, -1.128162, 1, 1, 1, 1, 1,
1.137193, 1.214227, 0.002562366, 1, 1, 1, 1, 1,
1.142243, 1.628537, 0.7107155, 0, 0, 1, 1, 1,
1.146755, 0.9781007, 0.4860716, 1, 0, 0, 1, 1,
1.151892, 0.497242, 0.7962043, 1, 0, 0, 1, 1,
1.152855, 0.183513, 0.3211332, 1, 0, 0, 1, 1,
1.167659, 1.046964, 0.0410199, 1, 0, 0, 1, 1,
1.167659, 0.1447832, 2.569496, 1, 0, 0, 1, 1,
1.181571, 0.04126473, 1.146084, 0, 0, 0, 1, 1,
1.18434, 2.149014, -0.1326096, 0, 0, 0, 1, 1,
1.187602, 0.08434492, 1.019533, 0, 0, 0, 1, 1,
1.198596, -0.8752542, 3.555107, 0, 0, 0, 1, 1,
1.199473, -1.569648, 2.566076, 0, 0, 0, 1, 1,
1.210576, 1.572072, 1.881112, 0, 0, 0, 1, 1,
1.212574, -0.08411738, 2.432799, 0, 0, 0, 1, 1,
1.218765, -0.9835106, 2.257419, 1, 1, 1, 1, 1,
1.219937, 1.510613, 2.181984, 1, 1, 1, 1, 1,
1.225286, 0.7714804, -0.6126363, 1, 1, 1, 1, 1,
1.238786, -1.148129, 0.7756817, 1, 1, 1, 1, 1,
1.239926, -2.00054, 2.644896, 1, 1, 1, 1, 1,
1.244313, -0.522862, 3.43586, 1, 1, 1, 1, 1,
1.251306, 0.6248891, 0.999205, 1, 1, 1, 1, 1,
1.251903, -1.323194, 0.4219154, 1, 1, 1, 1, 1,
1.268891, -0.2954876, 2.10632, 1, 1, 1, 1, 1,
1.271932, -1.477721, 3.262083, 1, 1, 1, 1, 1,
1.272317, 0.7830054, 0.9216007, 1, 1, 1, 1, 1,
1.274458, 1.934984, 0.6673352, 1, 1, 1, 1, 1,
1.274957, -0.03960089, 0.9227096, 1, 1, 1, 1, 1,
1.280362, 0.05032163, 1.418689, 1, 1, 1, 1, 1,
1.282386, -0.3540278, 1.477706, 1, 1, 1, 1, 1,
1.28407, -0.6839236, 0.4416301, 0, 0, 1, 1, 1,
1.284582, -0.5947576, 1.465098, 1, 0, 0, 1, 1,
1.297502, 0.7778808, 1.664667, 1, 0, 0, 1, 1,
1.300725, -0.6533114, 2.166401, 1, 0, 0, 1, 1,
1.309828, 0.02205336, 1.848551, 1, 0, 0, 1, 1,
1.324913, -1.008926, 2.122541, 1, 0, 0, 1, 1,
1.328659, -1.732909, 3.075132, 0, 0, 0, 1, 1,
1.331226, -0.1891285, 1.996794, 0, 0, 0, 1, 1,
1.332076, -1.980836, 2.981107, 0, 0, 0, 1, 1,
1.334203, 0.2008532, -0.2247177, 0, 0, 0, 1, 1,
1.334212, -0.6242961, 4.512154, 0, 0, 0, 1, 1,
1.341375, 0.3317158, 1.444653, 0, 0, 0, 1, 1,
1.342368, 0.06288438, 0.9962841, 0, 0, 0, 1, 1,
1.353408, 0.8906423, 0.1769497, 1, 1, 1, 1, 1,
1.359821, 1.147024, 0.7554209, 1, 1, 1, 1, 1,
1.369029, 0.3870803, 3.124154, 1, 1, 1, 1, 1,
1.379898, -0.2200104, 2.901635, 1, 1, 1, 1, 1,
1.383969, -1.051139, 1.220174, 1, 1, 1, 1, 1,
1.398505, 1.478816, 1.176773, 1, 1, 1, 1, 1,
1.41621, -0.2913238, -0.1363967, 1, 1, 1, 1, 1,
1.416756, 0.6969824, 1.142151, 1, 1, 1, 1, 1,
1.417421, -0.3119401, 2.977671, 1, 1, 1, 1, 1,
1.41782, -0.215022, 0.3007382, 1, 1, 1, 1, 1,
1.419016, -0.7423205, 3.870233, 1, 1, 1, 1, 1,
1.425602, -1.412451, 1.861301, 1, 1, 1, 1, 1,
1.441123, -0.6769562, 2.599392, 1, 1, 1, 1, 1,
1.443671, -1.465088, 2.913089, 1, 1, 1, 1, 1,
1.446327, -0.2180454, 1.66599, 1, 1, 1, 1, 1,
1.46893, 0.5251893, 1.70706, 0, 0, 1, 1, 1,
1.487206, 0.9799495, -0.03954317, 1, 0, 0, 1, 1,
1.491266, -0.4032339, 1.110198, 1, 0, 0, 1, 1,
1.496922, -0.381684, -0.260237, 1, 0, 0, 1, 1,
1.516539, -0.908824, 3.879964, 1, 0, 0, 1, 1,
1.51845, 1.299177, 1.273032, 1, 0, 0, 1, 1,
1.52191, -0.9307309, 1.333173, 0, 0, 0, 1, 1,
1.52239, -2.943042, 2.472438, 0, 0, 0, 1, 1,
1.522431, -0.4007663, 4.29007, 0, 0, 0, 1, 1,
1.524534, 0.2940676, 2.311635, 0, 0, 0, 1, 1,
1.532025, 0.5346266, 3.141191, 0, 0, 0, 1, 1,
1.55238, -0.06315474, 1.049016, 0, 0, 0, 1, 1,
1.561009, 0.1662003, 1.768696, 0, 0, 0, 1, 1,
1.568059, 0.9416404, 0.02888907, 1, 1, 1, 1, 1,
1.590382, -0.9046468, 1.414919, 1, 1, 1, 1, 1,
1.608636, 1.605199, -0.4593083, 1, 1, 1, 1, 1,
1.610589, -0.435772, 1.25404, 1, 1, 1, 1, 1,
1.650379, -1.409291, 2.093226, 1, 1, 1, 1, 1,
1.660587, 1.498526, 1.178998, 1, 1, 1, 1, 1,
1.663862, 0.2536494, 1.172636, 1, 1, 1, 1, 1,
1.663971, 1.223262, 0.5552153, 1, 1, 1, 1, 1,
1.702914, -0.3355395, 1.919349, 1, 1, 1, 1, 1,
1.704791, -0.6089273, 1.165576, 1, 1, 1, 1, 1,
1.712061, -1.501843, 1.600749, 1, 1, 1, 1, 1,
1.733828, 1.221367, 0.3811412, 1, 1, 1, 1, 1,
1.741808, 1.457158, 2.4492, 1, 1, 1, 1, 1,
1.746195, 0.5196187, 2.752933, 1, 1, 1, 1, 1,
1.74941, 0.9658675, 0.9867437, 1, 1, 1, 1, 1,
1.75893, 0.00716877, 1.870625, 0, 0, 1, 1, 1,
1.763375, -0.2331595, 1.392597, 1, 0, 0, 1, 1,
1.772533, -0.07341091, 0.9705755, 1, 0, 0, 1, 1,
1.778543, 0.2139203, 1.743363, 1, 0, 0, 1, 1,
1.779634, 0.7680181, 0.4931915, 1, 0, 0, 1, 1,
1.801805, -1.194542, 2.848778, 1, 0, 0, 1, 1,
1.81457, 0.01001688, 2.58864, 0, 0, 0, 1, 1,
1.816381, 0.7041562, 1.16171, 0, 0, 0, 1, 1,
1.831783, -0.6733834, 1.999879, 0, 0, 0, 1, 1,
1.836167, 0.3572989, -0.1068098, 0, 0, 0, 1, 1,
1.846572, 0.05275109, 3.179143, 0, 0, 0, 1, 1,
1.84899, -0.5606704, 1.881336, 0, 0, 0, 1, 1,
1.863068, 0.9644699, 0.9457671, 0, 0, 0, 1, 1,
1.864565, -1.269922, 1.12379, 1, 1, 1, 1, 1,
1.87267, 1.166948, 0.5409701, 1, 1, 1, 1, 1,
1.873463, 0.06902481, 1.503459, 1, 1, 1, 1, 1,
1.881236, -0.431057, 2.149549, 1, 1, 1, 1, 1,
1.882753, -0.2156543, 1.348582, 1, 1, 1, 1, 1,
1.883534, -0.8093699, 1.334905, 1, 1, 1, 1, 1,
1.900897, 1.240415, -0.3184606, 1, 1, 1, 1, 1,
1.902449, 0.7538457, 3.123638, 1, 1, 1, 1, 1,
1.92889, 0.2370732, 0.8909077, 1, 1, 1, 1, 1,
1.949154, 0.4480117, 2.554641, 1, 1, 1, 1, 1,
1.97845, -1.374073, 1.819919, 1, 1, 1, 1, 1,
2.037113, -0.2626973, 1.809825, 1, 1, 1, 1, 1,
2.093317, -0.1753315, 1.664941, 1, 1, 1, 1, 1,
2.126599, -0.272971, 2.438239, 1, 1, 1, 1, 1,
2.13437, -0.94649, 1.756082, 1, 1, 1, 1, 1,
2.214327, 1.281695, 0.5652651, 0, 0, 1, 1, 1,
2.246169, -0.6153408, 2.21313, 1, 0, 0, 1, 1,
2.254238, 0.5753917, 2.833314, 1, 0, 0, 1, 1,
2.263448, 0.8653674, 0.749697, 1, 0, 0, 1, 1,
2.269208, -0.3048956, 1.384927, 1, 0, 0, 1, 1,
2.275434, 0.3688126, 1.48575, 1, 0, 0, 1, 1,
2.278728, 0.1459073, 2.398296, 0, 0, 0, 1, 1,
2.279893, 0.6684238, 0.8434593, 0, 0, 0, 1, 1,
2.284401, -0.8372603, 0.8628404, 0, 0, 0, 1, 1,
2.304088, 0.5401837, 1.57513, 0, 0, 0, 1, 1,
2.310299, 0.2438484, 0.9469029, 0, 0, 0, 1, 1,
2.32197, 1.541366, 0.8053519, 0, 0, 0, 1, 1,
2.322385, 0.6424021, -0.5252061, 0, 0, 0, 1, 1,
2.345768, -1.565268, 2.48123, 1, 1, 1, 1, 1,
2.415105, 1.599879, 2.831045, 1, 1, 1, 1, 1,
2.437827, 1.293678, 1.933396, 1, 1, 1, 1, 1,
2.4384, -0.02087981, 0.2125236, 1, 1, 1, 1, 1,
2.44227, 1.006319, 1.283007, 1, 1, 1, 1, 1,
2.572696, 0.821462, 0.3902484, 1, 1, 1, 1, 1,
3.069525, -0.2518587, 1.628862, 1, 1, 1, 1, 1
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
var radius = 9.220507;
var distance = 32.38664;
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
mvMatrix.translate( 0.01000237, 0.3689029, 0.2763712 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.38664);
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
