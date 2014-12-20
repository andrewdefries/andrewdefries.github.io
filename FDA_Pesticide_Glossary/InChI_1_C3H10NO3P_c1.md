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
-3.152905, 0.3967917, -0.3487962, 1, 0, 0, 1,
-3.018843, -0.1519754, -2.240154, 1, 0.007843138, 0, 1,
-2.669703, -0.9269265, -4.03111, 1, 0.01176471, 0, 1,
-2.616136, 1.046107, -1.638879, 1, 0.01960784, 0, 1,
-2.522782, 0.2174416, -1.014684, 1, 0.02352941, 0, 1,
-2.433847, -1.057101, -2.093074, 1, 0.03137255, 0, 1,
-2.391615, 0.5731965, -0.2262342, 1, 0.03529412, 0, 1,
-2.376387, 0.6415963, -0.7632556, 1, 0.04313726, 0, 1,
-2.30273, 1.195368, 0.9789492, 1, 0.04705882, 0, 1,
-2.294724, -0.384768, -3.835149, 1, 0.05490196, 0, 1,
-2.27164, 1.599587, -0.5837257, 1, 0.05882353, 0, 1,
-2.205919, -1.403554, -2.124321, 1, 0.06666667, 0, 1,
-2.190805, 1.493978, -1.687539, 1, 0.07058824, 0, 1,
-2.066986, -2.206788, -2.879714, 1, 0.07843138, 0, 1,
-2.04795, -0.5647048, -1.503848, 1, 0.08235294, 0, 1,
-2.043487, -0.1536803, -1.08402, 1, 0.09019608, 0, 1,
-2.03762, -0.8245772, -3.796835, 1, 0.09411765, 0, 1,
-2.016736, 1.582098, -0.5224172, 1, 0.1019608, 0, 1,
-2.010144, -0.2929948, -1.228505, 1, 0.1098039, 0, 1,
-2.004538, 0.08587655, -2.072663, 1, 0.1137255, 0, 1,
-1.981073, 1.791413, -2.014296, 1, 0.1215686, 0, 1,
-1.947231, 0.9275396, -1.406602, 1, 0.1254902, 0, 1,
-1.933412, -1.019797, -1.234594, 1, 0.1333333, 0, 1,
-1.929765, -0.8127182, -0.4210882, 1, 0.1372549, 0, 1,
-1.919218, -0.6587036, -1.794909, 1, 0.145098, 0, 1,
-1.915643, 0.7515523, -3.309601, 1, 0.1490196, 0, 1,
-1.909149, -0.2297586, 0.05299284, 1, 0.1568628, 0, 1,
-1.873949, -0.6565961, -0.900963, 1, 0.1607843, 0, 1,
-1.868209, 1.348516, -1.099407, 1, 0.1686275, 0, 1,
-1.859367, 0.2003377, -0.8052104, 1, 0.172549, 0, 1,
-1.84808, -0.2343206, -2.312016, 1, 0.1803922, 0, 1,
-1.831572, -0.2847948, -2.982287, 1, 0.1843137, 0, 1,
-1.831389, 0.6606154, -0.245273, 1, 0.1921569, 0, 1,
-1.820785, -0.6313685, -1.847531, 1, 0.1960784, 0, 1,
-1.81192, 0.2762635, -0.9399461, 1, 0.2039216, 0, 1,
-1.786225, -0.7961435, -1.523638, 1, 0.2117647, 0, 1,
-1.778194, -0.2876134, -2.850353, 1, 0.2156863, 0, 1,
-1.770222, -0.3003535, -0.4856276, 1, 0.2235294, 0, 1,
-1.766236, -0.870528, -4.100264, 1, 0.227451, 0, 1,
-1.758375, -0.07613236, -2.070697, 1, 0.2352941, 0, 1,
-1.726047, -1.58451, -2.389436, 1, 0.2392157, 0, 1,
-1.721567, 1.631981, -1.550457, 1, 0.2470588, 0, 1,
-1.718111, 0.7731739, -1.421369, 1, 0.2509804, 0, 1,
-1.713961, -0.3261317, -2.684854, 1, 0.2588235, 0, 1,
-1.710212, -1.156028, -2.253307, 1, 0.2627451, 0, 1,
-1.692913, 0.5009832, -2.110597, 1, 0.2705882, 0, 1,
-1.688994, 0.329641, -2.124079, 1, 0.2745098, 0, 1,
-1.681302, -1.010521, -3.138005, 1, 0.282353, 0, 1,
-1.67642, -1.130343, -1.350279, 1, 0.2862745, 0, 1,
-1.674821, -0.3176316, -0.8303723, 1, 0.2941177, 0, 1,
-1.664065, -1.274782, -2.15044, 1, 0.3019608, 0, 1,
-1.653514, -1.328373, -2.295426, 1, 0.3058824, 0, 1,
-1.643184, 0.5632614, 0.1416266, 1, 0.3137255, 0, 1,
-1.628243, -0.4736241, -0.8882033, 1, 0.3176471, 0, 1,
-1.618437, 0.6969842, -1.00588, 1, 0.3254902, 0, 1,
-1.597982, -1.686128, -2.548283, 1, 0.3294118, 0, 1,
-1.594952, -2.465019, -1.667467, 1, 0.3372549, 0, 1,
-1.593517, -1.482362, -2.578651, 1, 0.3411765, 0, 1,
-1.591193, 1.825774, 0.9085498, 1, 0.3490196, 0, 1,
-1.590518, -1.397215, -3.403215, 1, 0.3529412, 0, 1,
-1.570856, -0.1944727, -1.122097, 1, 0.3607843, 0, 1,
-1.549459, -0.1634043, -1.05171, 1, 0.3647059, 0, 1,
-1.545135, 2.402865, -0.9923366, 1, 0.372549, 0, 1,
-1.543968, 1.208364, 0.5623429, 1, 0.3764706, 0, 1,
-1.536408, 0.2622794, -0.5891268, 1, 0.3843137, 0, 1,
-1.536331, -0.0208257, 1.078783, 1, 0.3882353, 0, 1,
-1.529166, -0.3926314, -1.715557, 1, 0.3960784, 0, 1,
-1.523353, -0.1964782, -2.778765, 1, 0.4039216, 0, 1,
-1.510417, 1.161263, -1.57159, 1, 0.4078431, 0, 1,
-1.502311, 0.3931174, -3.106836, 1, 0.4156863, 0, 1,
-1.493547, 1.023262, -0.575748, 1, 0.4196078, 0, 1,
-1.484943, -2.174985, -2.20915, 1, 0.427451, 0, 1,
-1.453711, 1.401667, -2.80522, 1, 0.4313726, 0, 1,
-1.451307, -0.2212619, -2.378979, 1, 0.4392157, 0, 1,
-1.446559, -1.890075, -2.715321, 1, 0.4431373, 0, 1,
-1.442382, -0.6969791, -1.379062, 1, 0.4509804, 0, 1,
-1.433635, 0.7775646, -1.566344, 1, 0.454902, 0, 1,
-1.421411, -0.5803204, -1.113838, 1, 0.4627451, 0, 1,
-1.417683, 0.09431559, -1.282119, 1, 0.4666667, 0, 1,
-1.415971, -0.459108, -1.978682, 1, 0.4745098, 0, 1,
-1.401446, 0.8511492, -1.646563, 1, 0.4784314, 0, 1,
-1.388694, 0.6331958, -1.402335, 1, 0.4862745, 0, 1,
-1.365958, 1.600436, -0.2296406, 1, 0.4901961, 0, 1,
-1.359548, 0.7913335, -0.05718295, 1, 0.4980392, 0, 1,
-1.359183, 0.121723, -0.9021206, 1, 0.5058824, 0, 1,
-1.341547, -1.06334, -1.692033, 1, 0.509804, 0, 1,
-1.338196, 0.6345581, -1.288224, 1, 0.5176471, 0, 1,
-1.336389, -0.3442225, -0.6665194, 1, 0.5215687, 0, 1,
-1.326946, -1.205223, -1.123425, 1, 0.5294118, 0, 1,
-1.322619, -0.7546271, -3.131459, 1, 0.5333334, 0, 1,
-1.320447, -1.120449, -2.489463, 1, 0.5411765, 0, 1,
-1.317941, -0.791187, -2.851006, 1, 0.5450981, 0, 1,
-1.312427, -0.7891447, -2.361013, 1, 0.5529412, 0, 1,
-1.310821, 0.3693607, -2.185883, 1, 0.5568628, 0, 1,
-1.306574, -0.2134597, -2.672355, 1, 0.5647059, 0, 1,
-1.300444, 0.7078871, -3.224822, 1, 0.5686275, 0, 1,
-1.295597, -0.1755961, -2.024308, 1, 0.5764706, 0, 1,
-1.294176, 1.119694, -1.185301, 1, 0.5803922, 0, 1,
-1.28903, -2.247812, -4.483219, 1, 0.5882353, 0, 1,
-1.279655, -1.322981, -1.271128, 1, 0.5921569, 0, 1,
-1.265067, -1.093142, -1.090428, 1, 0.6, 0, 1,
-1.260234, -1.516274, -1.754604, 1, 0.6078432, 0, 1,
-1.255798, 1.374534, 0.3629071, 1, 0.6117647, 0, 1,
-1.249008, -1.180286, -2.00086, 1, 0.6196079, 0, 1,
-1.234423, 0.1137966, -3.125376, 1, 0.6235294, 0, 1,
-1.230987, -2.405391, -1.838096, 1, 0.6313726, 0, 1,
-1.226064, -0.709242, -4.501774, 1, 0.6352941, 0, 1,
-1.22239, 0.03488615, -2.740135, 1, 0.6431373, 0, 1,
-1.206073, 1.250514, -0.1743373, 1, 0.6470588, 0, 1,
-1.203567, -1.262319, -2.887637, 1, 0.654902, 0, 1,
-1.194231, 0.01077409, -3.469177, 1, 0.6588235, 0, 1,
-1.193034, -0.7701471, -1.253517, 1, 0.6666667, 0, 1,
-1.192831, 1.220989, -0.6659594, 1, 0.6705883, 0, 1,
-1.180794, 0.6825384, -0.8281481, 1, 0.6784314, 0, 1,
-1.177822, -0.6319646, -1.813754, 1, 0.682353, 0, 1,
-1.174395, 0.8375992, -2.044615, 1, 0.6901961, 0, 1,
-1.172587, 2.088944, 0.9443969, 1, 0.6941177, 0, 1,
-1.171002, 0.1742231, -1.858362, 1, 0.7019608, 0, 1,
-1.17074, -1.048008, -1.244045, 1, 0.7098039, 0, 1,
-1.167225, -1.697715, -2.523688, 1, 0.7137255, 0, 1,
-1.167086, -2.199896, -3.318316, 1, 0.7215686, 0, 1,
-1.16533, 0.8429471, 0.4672383, 1, 0.7254902, 0, 1,
-1.162017, 0.7997828, -1.502731, 1, 0.7333333, 0, 1,
-1.148165, 1.579048, -0.04628938, 1, 0.7372549, 0, 1,
-1.146374, -0.8707304, -2.491426, 1, 0.7450981, 0, 1,
-1.143699, 0.3617095, -0.6602226, 1, 0.7490196, 0, 1,
-1.141472, -0.4418449, -1.749719, 1, 0.7568628, 0, 1,
-1.137103, 0.5259082, -2.225872, 1, 0.7607843, 0, 1,
-1.136809, -0.6964322, -1.647369, 1, 0.7686275, 0, 1,
-1.136043, 0.9921397, -0.008577949, 1, 0.772549, 0, 1,
-1.135419, -1.317874, -2.387783, 1, 0.7803922, 0, 1,
-1.1332, 0.6850893, 0.7871017, 1, 0.7843137, 0, 1,
-1.132231, -0.08684696, -3.617333, 1, 0.7921569, 0, 1,
-1.120662, 0.617154, -2.049498, 1, 0.7960784, 0, 1,
-1.119448, -0.7856684, -3.135812, 1, 0.8039216, 0, 1,
-1.118828, -0.9443189, -0.1925142, 1, 0.8117647, 0, 1,
-1.115309, -0.08786866, 0.5933707, 1, 0.8156863, 0, 1,
-1.111415, 0.269507, -1.259496, 1, 0.8235294, 0, 1,
-1.110002, -0.44374, -1.504812, 1, 0.827451, 0, 1,
-1.104077, 0.5896741, -0.3433075, 1, 0.8352941, 0, 1,
-1.103003, -0.2958373, -1.535382, 1, 0.8392157, 0, 1,
-1.087332, -0.681472, -2.524802, 1, 0.8470588, 0, 1,
-1.084077, 1.50693, -1.055401, 1, 0.8509804, 0, 1,
-1.081359, 0.3629119, -1.321504, 1, 0.8588235, 0, 1,
-1.079553, 0.693097, -1.160564, 1, 0.8627451, 0, 1,
-1.078387, 0.1460068, -1.165557, 1, 0.8705882, 0, 1,
-1.075615, 1.26237, 0.1317311, 1, 0.8745098, 0, 1,
-1.07269, 0.3897038, -1.520571, 1, 0.8823529, 0, 1,
-1.059574, -0.5558127, -2.036018, 1, 0.8862745, 0, 1,
-1.056372, -1.353485, -3.459473, 1, 0.8941177, 0, 1,
-1.054168, 0.5548493, -0.910432, 1, 0.8980392, 0, 1,
-1.051833, 0.5352164, -2.196735, 1, 0.9058824, 0, 1,
-1.050974, 0.8364869, -0.7953089, 1, 0.9137255, 0, 1,
-1.040671, 1.228252, -3.215763, 1, 0.9176471, 0, 1,
-1.038147, 0.2739924, -0.6944621, 1, 0.9254902, 0, 1,
-1.037822, -0.3496636, -1.49111, 1, 0.9294118, 0, 1,
-1.031452, -0.355369, -2.526515, 1, 0.9372549, 0, 1,
-1.021363, 2.932076, -0.8981372, 1, 0.9411765, 0, 1,
-1.00881, 1.592524, 0.7464545, 1, 0.9490196, 0, 1,
-0.9998463, 0.5096136, -2.799768, 1, 0.9529412, 0, 1,
-0.991685, 1.085015, 0.05470103, 1, 0.9607843, 0, 1,
-0.9870206, -0.3115842, -3.140465, 1, 0.9647059, 0, 1,
-0.979688, -0.3773856, -1.765349, 1, 0.972549, 0, 1,
-0.9784135, -0.05980883, -0.5362846, 1, 0.9764706, 0, 1,
-0.9778289, 0.7178091, -1.415989, 1, 0.9843137, 0, 1,
-0.9750222, 1.47065, 1.566083, 1, 0.9882353, 0, 1,
-0.9750034, -2.151578, -2.643267, 1, 0.9960784, 0, 1,
-0.9699095, -0.1352024, -1.976244, 0.9960784, 1, 0, 1,
-0.9647626, 0.5301697, -0.9729713, 0.9921569, 1, 0, 1,
-0.9478058, -0.4815522, 0.15637, 0.9843137, 1, 0, 1,
-0.9428424, -1.240615, -2.836776, 0.9803922, 1, 0, 1,
-0.940852, -0.7678257, -2.457776, 0.972549, 1, 0, 1,
-0.9348672, 0.6923457, -2.524409, 0.9686275, 1, 0, 1,
-0.9345614, 0.5733986, -0.9241614, 0.9607843, 1, 0, 1,
-0.9340206, 0.1176247, -3.054803, 0.9568627, 1, 0, 1,
-0.925526, 0.2844473, -1.639178, 0.9490196, 1, 0, 1,
-0.9248606, -0.1388277, -3.154565, 0.945098, 1, 0, 1,
-0.9190146, -0.5662833, -2.55645, 0.9372549, 1, 0, 1,
-0.9163942, -0.7326771, -1.960269, 0.9333333, 1, 0, 1,
-0.915656, 0.09579892, -2.122438, 0.9254902, 1, 0, 1,
-0.9139757, 1.145332, 0.5065147, 0.9215686, 1, 0, 1,
-0.9127537, -0.3552195, -1.218144, 0.9137255, 1, 0, 1,
-0.9119823, -0.992753, -2.369413, 0.9098039, 1, 0, 1,
-0.9084005, 0.9118336, 0.04965351, 0.9019608, 1, 0, 1,
-0.9045117, 0.5737209, -0.3866368, 0.8941177, 1, 0, 1,
-0.9031037, 2.056131, 0.2026515, 0.8901961, 1, 0, 1,
-0.8996004, -0.8604665, -1.293058, 0.8823529, 1, 0, 1,
-0.8964422, 0.2660042, -0.09940159, 0.8784314, 1, 0, 1,
-0.8959409, -0.02796311, -1.805262, 0.8705882, 1, 0, 1,
-0.8921403, -0.7997129, -3.613849, 0.8666667, 1, 0, 1,
-0.8920358, -0.2041931, -2.133377, 0.8588235, 1, 0, 1,
-0.8919406, -0.7770517, -2.483689, 0.854902, 1, 0, 1,
-0.8893828, -0.1872172, -2.178311, 0.8470588, 1, 0, 1,
-0.8870012, 0.062681, -0.724718, 0.8431373, 1, 0, 1,
-0.8854302, -0.3439811, -2.936076, 0.8352941, 1, 0, 1,
-0.8825403, -0.1735317, -1.067029, 0.8313726, 1, 0, 1,
-0.8764882, 0.3649217, 0.2525866, 0.8235294, 1, 0, 1,
-0.8762894, 0.05143302, -1.523366, 0.8196079, 1, 0, 1,
-0.8758318, -0.2482554, -1.493418, 0.8117647, 1, 0, 1,
-0.8753067, -0.8790014, -1.427504, 0.8078431, 1, 0, 1,
-0.8751413, -1.858832, -1.646068, 0.8, 1, 0, 1,
-0.8689245, 1.563405, -2.682658, 0.7921569, 1, 0, 1,
-0.8652613, -1.227791, -3.131861, 0.7882353, 1, 0, 1,
-0.862532, -0.9535324, -2.883504, 0.7803922, 1, 0, 1,
-0.8590495, 0.009013765, -1.070879, 0.7764706, 1, 0, 1,
-0.8514081, 0.1539969, -2.104929, 0.7686275, 1, 0, 1,
-0.845699, 0.1947849, -0.2592658, 0.7647059, 1, 0, 1,
-0.84519, -0.3631272, 0.08447277, 0.7568628, 1, 0, 1,
-0.8371775, -0.08158166, -0.6356229, 0.7529412, 1, 0, 1,
-0.835834, -0.3551872, -3.223666, 0.7450981, 1, 0, 1,
-0.8304868, 1.837885, -1.930071, 0.7411765, 1, 0, 1,
-0.8283224, -0.9867031, -2.872151, 0.7333333, 1, 0, 1,
-0.8268753, -1.148765, -2.886913, 0.7294118, 1, 0, 1,
-0.8262599, -0.4151514, -2.157419, 0.7215686, 1, 0, 1,
-0.8230632, 0.9602932, 0.8450093, 0.7176471, 1, 0, 1,
-0.8083308, -1.325546, -3.518611, 0.7098039, 1, 0, 1,
-0.8081136, 0.6100745, -2.477723, 0.7058824, 1, 0, 1,
-0.8075683, 0.3466816, -2.21988, 0.6980392, 1, 0, 1,
-0.806557, 0.1051258, -1.370393, 0.6901961, 1, 0, 1,
-0.7990268, -0.8209913, -0.4722176, 0.6862745, 1, 0, 1,
-0.7964824, 1.447463, -0.007996162, 0.6784314, 1, 0, 1,
-0.7897384, 0.03371825, -0.5776675, 0.6745098, 1, 0, 1,
-0.7812608, -1.671988, -4.694861, 0.6666667, 1, 0, 1,
-0.7795961, 0.7142273, -1.646361, 0.6627451, 1, 0, 1,
-0.7682735, -1.722728, -3.005287, 0.654902, 1, 0, 1,
-0.7627205, -0.516717, -1.453233, 0.6509804, 1, 0, 1,
-0.7601486, 0.7129122, -1.215293, 0.6431373, 1, 0, 1,
-0.7558309, -1.277565, -3.653592, 0.6392157, 1, 0, 1,
-0.7534313, -0.5174087, -0.6258547, 0.6313726, 1, 0, 1,
-0.7510553, 1.298288, -0.0640716, 0.627451, 1, 0, 1,
-0.7370376, -1.173579, -1.76619, 0.6196079, 1, 0, 1,
-0.7367275, 0.6842176, -1.228317, 0.6156863, 1, 0, 1,
-0.73611, 2.013179, -2.671884, 0.6078432, 1, 0, 1,
-0.7325388, 1.397396, 0.2689622, 0.6039216, 1, 0, 1,
-0.7320443, -0.6100658, -0.2340014, 0.5960785, 1, 0, 1,
-0.7296619, -0.1708536, -2.548182, 0.5882353, 1, 0, 1,
-0.7277596, -1.317046, -3.72002, 0.5843138, 1, 0, 1,
-0.7269677, -0.121515, -2.848284, 0.5764706, 1, 0, 1,
-0.7236136, -1.995331, -3.967108, 0.572549, 1, 0, 1,
-0.7179926, -1.764824, -3.108328, 0.5647059, 1, 0, 1,
-0.7162616, 0.6340122, 0.4289477, 0.5607843, 1, 0, 1,
-0.7139745, 0.248233, -1.218238, 0.5529412, 1, 0, 1,
-0.7100875, 0.8761309, -0.4557636, 0.5490196, 1, 0, 1,
-0.7062122, -0.8394034, -1.341914, 0.5411765, 1, 0, 1,
-0.702655, -0.0563432, -1.246649, 0.5372549, 1, 0, 1,
-0.6975412, 0.1298322, -1.395288, 0.5294118, 1, 0, 1,
-0.6963448, 0.6940981, -0.4451976, 0.5254902, 1, 0, 1,
-0.6938025, -0.03426182, 0.1143286, 0.5176471, 1, 0, 1,
-0.6904888, 0.05714877, -1.779301, 0.5137255, 1, 0, 1,
-0.6835726, -0.6489864, -2.670832, 0.5058824, 1, 0, 1,
-0.6826775, 1.374075, -0.05196595, 0.5019608, 1, 0, 1,
-0.6823439, 0.03477707, -2.28377, 0.4941176, 1, 0, 1,
-0.6798424, 0.6099014, -1.290326, 0.4862745, 1, 0, 1,
-0.6793976, 0.002518345, 0.1407932, 0.4823529, 1, 0, 1,
-0.6791173, 1.632817, 2.388384, 0.4745098, 1, 0, 1,
-0.6782306, 0.5548052, -1.457621, 0.4705882, 1, 0, 1,
-0.6682371, 1.749902, -0.1612724, 0.4627451, 1, 0, 1,
-0.6660656, -1.726393, -3.857209, 0.4588235, 1, 0, 1,
-0.665947, 0.4193467, -0.8174154, 0.4509804, 1, 0, 1,
-0.6628499, 0.6706301, 0.2942272, 0.4470588, 1, 0, 1,
-0.6594452, 1.671047, -0.5742449, 0.4392157, 1, 0, 1,
-0.6570262, 0.6304137, -0.7020527, 0.4352941, 1, 0, 1,
-0.6504856, 0.2213981, -0.7763864, 0.427451, 1, 0, 1,
-0.6480024, 1.16725, -0.4095457, 0.4235294, 1, 0, 1,
-0.6472248, 0.188869, -1.401638, 0.4156863, 1, 0, 1,
-0.6459113, 1.721085, 0.2242926, 0.4117647, 1, 0, 1,
-0.641655, -0.6358738, -3.093854, 0.4039216, 1, 0, 1,
-0.6307893, 0.3540746, -1.226928, 0.3960784, 1, 0, 1,
-0.6305999, -1.44171, -2.303756, 0.3921569, 1, 0, 1,
-0.6300552, -0.1219199, -1.469209, 0.3843137, 1, 0, 1,
-0.6280459, -0.07352843, -3.049834, 0.3803922, 1, 0, 1,
-0.6277275, 0.2602181, -0.4647242, 0.372549, 1, 0, 1,
-0.6267698, 0.4420658, -1.050797, 0.3686275, 1, 0, 1,
-0.6260399, 2.238461, -0.3823172, 0.3607843, 1, 0, 1,
-0.6233743, 0.7837815, -0.04437223, 0.3568628, 1, 0, 1,
-0.6186951, -0.3699104, -1.056259, 0.3490196, 1, 0, 1,
-0.6185327, 0.6912143, -0.4896583, 0.345098, 1, 0, 1,
-0.6132756, 1.669375, -2.804653, 0.3372549, 1, 0, 1,
-0.612318, 1.916085, -0.5596899, 0.3333333, 1, 0, 1,
-0.6081185, -0.5310882, -3.547529, 0.3254902, 1, 0, 1,
-0.6056316, -0.6740891, -4.976975, 0.3215686, 1, 0, 1,
-0.5978104, 1.155897, 0.8827315, 0.3137255, 1, 0, 1,
-0.5936187, -0.1661733, -1.675669, 0.3098039, 1, 0, 1,
-0.5919926, -1.699629, -4.765266, 0.3019608, 1, 0, 1,
-0.5916585, -0.493748, -2.030156, 0.2941177, 1, 0, 1,
-0.5916157, -0.5470524, -3.657077, 0.2901961, 1, 0, 1,
-0.5899262, 2.003766, 0.1133884, 0.282353, 1, 0, 1,
-0.5888456, 0.4805965, -1.297971, 0.2784314, 1, 0, 1,
-0.5873661, 0.1846242, 0.4481021, 0.2705882, 1, 0, 1,
-0.5807536, 0.57195, -1.512474, 0.2666667, 1, 0, 1,
-0.5785015, -0.2570319, -2.808663, 0.2588235, 1, 0, 1,
-0.573137, -0.6754711, -1.275148, 0.254902, 1, 0, 1,
-0.5708647, -0.6543207, -0.7585462, 0.2470588, 1, 0, 1,
-0.5678557, 0.2502074, -0.8706186, 0.2431373, 1, 0, 1,
-0.5672985, 1.128605, -0.3716482, 0.2352941, 1, 0, 1,
-0.5623046, -1.536935, -2.706294, 0.2313726, 1, 0, 1,
-0.5576428, 2.126827, -0.0158446, 0.2235294, 1, 0, 1,
-0.5540687, -1.412567, -4.162513, 0.2196078, 1, 0, 1,
-0.5522681, 0.95866, 1.794557, 0.2117647, 1, 0, 1,
-0.5511304, -0.03848984, -1.633062, 0.2078431, 1, 0, 1,
-0.5506403, -0.1870263, -2.00076, 0.2, 1, 0, 1,
-0.5485712, 0.9994315, 0.3952398, 0.1921569, 1, 0, 1,
-0.5477044, 1.639243, -0.8464383, 0.1882353, 1, 0, 1,
-0.5474815, 0.9431503, -1.312859, 0.1803922, 1, 0, 1,
-0.5389869, 0.6019836, -1.064749, 0.1764706, 1, 0, 1,
-0.536545, -1.983711, -3.411738, 0.1686275, 1, 0, 1,
-0.5325662, -1.149134, -4.781358, 0.1647059, 1, 0, 1,
-0.5311596, 0.301691, -1.409033, 0.1568628, 1, 0, 1,
-0.5310501, -1.021734, -2.436079, 0.1529412, 1, 0, 1,
-0.529827, 0.6605064, -0.4659307, 0.145098, 1, 0, 1,
-0.5195025, 0.5772343, -1.860948, 0.1411765, 1, 0, 1,
-0.518304, -0.9638875, -3.553418, 0.1333333, 1, 0, 1,
-0.5178558, -0.5542936, -2.306587, 0.1294118, 1, 0, 1,
-0.5134749, 0.6389406, -1.027165, 0.1215686, 1, 0, 1,
-0.5119949, -0.5727037, -1.703368, 0.1176471, 1, 0, 1,
-0.507042, -0.388073, -0.7013011, 0.1098039, 1, 0, 1,
-0.5061215, 0.5589449, -0.4889613, 0.1058824, 1, 0, 1,
-0.5035557, -0.47506, -2.213165, 0.09803922, 1, 0, 1,
-0.4968812, -0.9415712, -4.747732, 0.09019608, 1, 0, 1,
-0.4929253, -0.09677073, -1.688837, 0.08627451, 1, 0, 1,
-0.4920292, 0.9120219, -0.731318, 0.07843138, 1, 0, 1,
-0.4910541, -0.5264644, -3.643095, 0.07450981, 1, 0, 1,
-0.4841993, -0.6249301, -0.065424, 0.06666667, 1, 0, 1,
-0.4831465, 0.7714849, 0.4432704, 0.0627451, 1, 0, 1,
-0.4829877, 1.414086, -0.2096588, 0.05490196, 1, 0, 1,
-0.4816476, 1.537072, 0.4344186, 0.05098039, 1, 0, 1,
-0.4775392, 0.3329133, -1.877093, 0.04313726, 1, 0, 1,
-0.474028, -0.6558658, -3.042534, 0.03921569, 1, 0, 1,
-0.4730837, 1.363341, 1.311264, 0.03137255, 1, 0, 1,
-0.4711804, 0.7034796, 0.0464468, 0.02745098, 1, 0, 1,
-0.4711231, 0.2851031, -1.473632, 0.01960784, 1, 0, 1,
-0.4707576, 0.1714159, -2.765863, 0.01568628, 1, 0, 1,
-0.4616644, 1.239193, -0.05737233, 0.007843138, 1, 0, 1,
-0.4610054, -1.47816, -2.60073, 0.003921569, 1, 0, 1,
-0.459893, 1.127863, -0.6273702, 0, 1, 0.003921569, 1,
-0.4570532, 1.715427, -1.105841, 0, 1, 0.01176471, 1,
-0.4550843, 1.314439, -0.8967961, 0, 1, 0.01568628, 1,
-0.4501876, -0.4647372, -3.334794, 0, 1, 0.02352941, 1,
-0.4492221, -0.1706019, -1.342726, 0, 1, 0.02745098, 1,
-0.4431792, 0.1335834, -0.6923456, 0, 1, 0.03529412, 1,
-0.4406423, 0.8063091, -0.6802493, 0, 1, 0.03921569, 1,
-0.4400692, 2.417313, 1.002242, 0, 1, 0.04705882, 1,
-0.4340716, 0.3769432, 1.303399, 0, 1, 0.05098039, 1,
-0.4313732, -0.5978984, -2.337283, 0, 1, 0.05882353, 1,
-0.4306413, -1.008858, -1.573274, 0, 1, 0.0627451, 1,
-0.428068, -0.3079037, -1.858069, 0, 1, 0.07058824, 1,
-0.4233625, 0.7888934, -1.364595, 0, 1, 0.07450981, 1,
-0.4221106, 1.756869, -0.2932979, 0, 1, 0.08235294, 1,
-0.4188351, 0.7041067, -0.6461909, 0, 1, 0.08627451, 1,
-0.4184452, -0.9530001, -3.259911, 0, 1, 0.09411765, 1,
-0.417958, -2.379747, -1.818616, 0, 1, 0.1019608, 1,
-0.4169956, -0.6404347, -2.475237, 0, 1, 0.1058824, 1,
-0.415823, 0.3645277, -0.02781026, 0, 1, 0.1137255, 1,
-0.4112673, 1.353898, 0.5140212, 0, 1, 0.1176471, 1,
-0.4105377, -0.5197287, -3.163872, 0, 1, 0.1254902, 1,
-0.4085417, 0.9719239, -0.9256766, 0, 1, 0.1294118, 1,
-0.406445, 1.746671, 1.029817, 0, 1, 0.1372549, 1,
-0.4048487, 0.7391667, 2.062087, 0, 1, 0.1411765, 1,
-0.4008541, 0.01268376, -1.983773, 0, 1, 0.1490196, 1,
-0.3958108, 0.8063112, -0.3517147, 0, 1, 0.1529412, 1,
-0.3947224, 0.6166301, 0.6755533, 0, 1, 0.1607843, 1,
-0.3928497, 1.325544, -0.6467385, 0, 1, 0.1647059, 1,
-0.3904347, 0.2968069, -1.750045, 0, 1, 0.172549, 1,
-0.3900011, 1.702866, 0.4762177, 0, 1, 0.1764706, 1,
-0.379941, 0.4188284, 0.08896182, 0, 1, 0.1843137, 1,
-0.3793285, 1.327512, -0.04715803, 0, 1, 0.1882353, 1,
-0.3723714, 2.323178, 2.042186, 0, 1, 0.1960784, 1,
-0.3710664, -0.8935984, -1.977579, 0, 1, 0.2039216, 1,
-0.3696859, 0.2748173, -0.4514481, 0, 1, 0.2078431, 1,
-0.3622868, 1.181698, 0.03724907, 0, 1, 0.2156863, 1,
-0.3594594, -1.7623, -1.737771, 0, 1, 0.2196078, 1,
-0.3530091, 0.1350358, 0.0007973401, 0, 1, 0.227451, 1,
-0.3485577, -0.5693629, -0.3530121, 0, 1, 0.2313726, 1,
-0.3453077, -0.11424, -3.199927, 0, 1, 0.2392157, 1,
-0.3372166, 0.8201842, -0.615912, 0, 1, 0.2431373, 1,
-0.3348654, -0.7477144, -2.364236, 0, 1, 0.2509804, 1,
-0.3345884, 0.00231736, -1.897368, 0, 1, 0.254902, 1,
-0.3340569, 0.5874715, -0.001714016, 0, 1, 0.2627451, 1,
-0.333801, 1.356941, -0.1246278, 0, 1, 0.2666667, 1,
-0.330958, -1.148313, -3.444501, 0, 1, 0.2745098, 1,
-0.3287313, 0.4287522, -3.30326, 0, 1, 0.2784314, 1,
-0.3095562, -0.5075397, -2.332566, 0, 1, 0.2862745, 1,
-0.3027359, -1.64003, -4.043875, 0, 1, 0.2901961, 1,
-0.3017041, 0.9286954, 1.319003, 0, 1, 0.2980392, 1,
-0.3010372, 1.537316, 0.003620909, 0, 1, 0.3058824, 1,
-0.3004276, 0.1415317, -1.76924, 0, 1, 0.3098039, 1,
-0.2998842, -0.3741715, -1.70398, 0, 1, 0.3176471, 1,
-0.2962935, 0.6561645, 1.995277, 0, 1, 0.3215686, 1,
-0.2957639, -0.4322222, -2.420515, 0, 1, 0.3294118, 1,
-0.2945064, 0.2622007, -1.638436, 0, 1, 0.3333333, 1,
-0.2824131, 1.230897, -0.7153035, 0, 1, 0.3411765, 1,
-0.2782724, -1.1078, -1.807623, 0, 1, 0.345098, 1,
-0.2772608, 0.1004067, -1.367409, 0, 1, 0.3529412, 1,
-0.2759145, 1.170087, -0.1105675, 0, 1, 0.3568628, 1,
-0.2693217, -1.06644, -3.47246, 0, 1, 0.3647059, 1,
-0.2691021, 0.007554349, 0.7741958, 0, 1, 0.3686275, 1,
-0.2681977, 0.4809684, -1.747162, 0, 1, 0.3764706, 1,
-0.2669216, -0.6763356, -1.303977, 0, 1, 0.3803922, 1,
-0.2654074, -1.017228, -2.101342, 0, 1, 0.3882353, 1,
-0.2632194, -1.520327, -2.424961, 0, 1, 0.3921569, 1,
-0.2631674, -0.8267866, -2.770154, 0, 1, 0.4, 1,
-0.2624315, 1.111184, -1.313569, 0, 1, 0.4078431, 1,
-0.2578, -0.6132149, -1.94207, 0, 1, 0.4117647, 1,
-0.2567581, 0.8549687, 0.3913535, 0, 1, 0.4196078, 1,
-0.2562006, -0.4939323, -2.950396, 0, 1, 0.4235294, 1,
-0.2536392, -2.443352, -2.113989, 0, 1, 0.4313726, 1,
-0.2504116, 0.1111135, 0.2748461, 0, 1, 0.4352941, 1,
-0.2474128, 0.2033951, -1.286276, 0, 1, 0.4431373, 1,
-0.2465212, -0.2104222, -3.596485, 0, 1, 0.4470588, 1,
-0.2455839, 0.6550564, -0.4768, 0, 1, 0.454902, 1,
-0.2415234, -0.2622667, -1.515224, 0, 1, 0.4588235, 1,
-0.2409964, -0.6865481, -2.470001, 0, 1, 0.4666667, 1,
-0.2406506, 0.2147184, -1.156413, 0, 1, 0.4705882, 1,
-0.2381375, 0.8512257, -1.214112, 0, 1, 0.4784314, 1,
-0.2333564, -0.3130862, -2.462171, 0, 1, 0.4823529, 1,
-0.2294592, 0.08391213, -1.998559, 0, 1, 0.4901961, 1,
-0.2256581, 0.45636, 0.4091785, 0, 1, 0.4941176, 1,
-0.2236502, 1.691555, -0.5673738, 0, 1, 0.5019608, 1,
-0.2228932, -0.6347619, -3.525524, 0, 1, 0.509804, 1,
-0.2224246, -1.730586, -2.318099, 0, 1, 0.5137255, 1,
-0.2213281, 1.832678, 3.131215, 0, 1, 0.5215687, 1,
-0.218406, 0.6063193, -1.515273, 0, 1, 0.5254902, 1,
-0.2173797, -0.3847401, -2.174397, 0, 1, 0.5333334, 1,
-0.2160384, -0.6349742, -2.698294, 0, 1, 0.5372549, 1,
-0.2152255, 1.1523, -0.1170036, 0, 1, 0.5450981, 1,
-0.2151179, -0.4700035, -1.181991, 0, 1, 0.5490196, 1,
-0.2147957, 0.1573778, -2.252764, 0, 1, 0.5568628, 1,
-0.213394, -0.9792868, -3.228968, 0, 1, 0.5607843, 1,
-0.2133548, 0.09366851, -1.735949, 0, 1, 0.5686275, 1,
-0.2060869, -0.2128905, -1.787022, 0, 1, 0.572549, 1,
-0.2051126, -0.07697702, -0.925881, 0, 1, 0.5803922, 1,
-0.2037247, -0.8633822, -3.677003, 0, 1, 0.5843138, 1,
-0.2028612, -0.0349644, -1.555929, 0, 1, 0.5921569, 1,
-0.2007039, 1.018311, 1.244516, 0, 1, 0.5960785, 1,
-0.2004902, 0.6069009, -0.429967, 0, 1, 0.6039216, 1,
-0.2004458, 0.4751866, -0.390392, 0, 1, 0.6117647, 1,
-0.1991462, -1.488248, -3.213408, 0, 1, 0.6156863, 1,
-0.1978237, -1.922947, -1.425841, 0, 1, 0.6235294, 1,
-0.196144, -1.162965, -3.575149, 0, 1, 0.627451, 1,
-0.1955218, -0.6127866, -1.39047, 0, 1, 0.6352941, 1,
-0.1915971, -1.168587, -2.591033, 0, 1, 0.6392157, 1,
-0.1903504, -2.539815, -3.913946, 0, 1, 0.6470588, 1,
-0.1889495, 0.6727549, 0.5198408, 0, 1, 0.6509804, 1,
-0.1858171, 0.6645368, 0.39072, 0, 1, 0.6588235, 1,
-0.1829914, -0.6176378, -2.617544, 0, 1, 0.6627451, 1,
-0.1808376, 0.449549, 0.437112, 0, 1, 0.6705883, 1,
-0.178858, 0.9004707, -0.2557693, 0, 1, 0.6745098, 1,
-0.1768089, 1.922776, -0.3412851, 0, 1, 0.682353, 1,
-0.1744939, 0.1902388, 0.3884437, 0, 1, 0.6862745, 1,
-0.1702427, -0.1377025, -1.942704, 0, 1, 0.6941177, 1,
-0.1683523, 1.318892, -1.95494, 0, 1, 0.7019608, 1,
-0.1682868, 0.4185996, -0.4457947, 0, 1, 0.7058824, 1,
-0.1654141, -0.5730289, -3.030704, 0, 1, 0.7137255, 1,
-0.1652297, -0.04777647, -0.2848833, 0, 1, 0.7176471, 1,
-0.1638058, 2.117165, -0.4503358, 0, 1, 0.7254902, 1,
-0.158721, -0.2575959, -1.334109, 0, 1, 0.7294118, 1,
-0.1551908, 1.029074, -0.9279881, 0, 1, 0.7372549, 1,
-0.1500511, -1.132644, -4.97552, 0, 1, 0.7411765, 1,
-0.1469317, 0.2244731, -0.8174611, 0, 1, 0.7490196, 1,
-0.1427313, -2.095958, -1.367466, 0, 1, 0.7529412, 1,
-0.1417974, -0.1916388, -4.55303, 0, 1, 0.7607843, 1,
-0.1380726, 0.5035594, -0.9977521, 0, 1, 0.7647059, 1,
-0.1322548, 1.12757, 0.1045023, 0, 1, 0.772549, 1,
-0.1284321, -0.2289562, -2.258894, 0, 1, 0.7764706, 1,
-0.1267495, 2.02157, -1.314512, 0, 1, 0.7843137, 1,
-0.1240428, 0.2461842, 0.1918426, 0, 1, 0.7882353, 1,
-0.1229179, -1.170339, -1.887184, 0, 1, 0.7960784, 1,
-0.1202511, -1.475652, -1.81145, 0, 1, 0.8039216, 1,
-0.1165434, 0.8046823, 0.2415507, 0, 1, 0.8078431, 1,
-0.1155426, 1.995346, 0.9065899, 0, 1, 0.8156863, 1,
-0.1150431, -1.809638, -3.59772, 0, 1, 0.8196079, 1,
-0.1115019, 1.009582, -0.7782432, 0, 1, 0.827451, 1,
-0.105003, 1.171994, 2.119833, 0, 1, 0.8313726, 1,
-0.1042253, 1.428161, 0.3072007, 0, 1, 0.8392157, 1,
-0.1028314, -1.129918, -3.000877, 0, 1, 0.8431373, 1,
-0.09608556, 1.199579, -1.387201, 0, 1, 0.8509804, 1,
-0.09250715, -0.109175, -2.141527, 0, 1, 0.854902, 1,
-0.08882763, 0.4008415, 0.2550912, 0, 1, 0.8627451, 1,
-0.08763642, 0.327868, 0.09651292, 0, 1, 0.8666667, 1,
-0.08750314, -0.8627297, -2.373724, 0, 1, 0.8745098, 1,
-0.08744846, 1.394549, -0.06329037, 0, 1, 0.8784314, 1,
-0.08575855, -2.33993, -1.310664, 0, 1, 0.8862745, 1,
-0.08501767, -0.7753376, -2.444116, 0, 1, 0.8901961, 1,
-0.08026434, 1.072049, 0.7798182, 0, 1, 0.8980392, 1,
-0.07703865, -1.083014, -3.347624, 0, 1, 0.9058824, 1,
-0.0736017, -0.004546632, -3.193804, 0, 1, 0.9098039, 1,
-0.07352819, 0.784894, 1.483649, 0, 1, 0.9176471, 1,
-0.07226516, 0.618827, 0.3375553, 0, 1, 0.9215686, 1,
-0.0718378, -0.9554344, -0.0993086, 0, 1, 0.9294118, 1,
-0.07111141, 1.464824, -0.9432501, 0, 1, 0.9333333, 1,
-0.06994679, 0.4403163, -2.046676, 0, 1, 0.9411765, 1,
-0.06877079, -1.210315, -1.961891, 0, 1, 0.945098, 1,
-0.06714618, -0.638263, -2.291517, 0, 1, 0.9529412, 1,
-0.05998279, -0.9397348, -1.216946, 0, 1, 0.9568627, 1,
-0.05874849, -1.842541, -2.614163, 0, 1, 0.9647059, 1,
-0.0539112, -0.03339783, -3.700245, 0, 1, 0.9686275, 1,
-0.04877926, 0.1766607, -0.8768384, 0, 1, 0.9764706, 1,
-0.04589173, -0.7552805, -2.014541, 0, 1, 0.9803922, 1,
-0.04524053, -1.15394, -2.811115, 0, 1, 0.9882353, 1,
-0.04432976, -0.05119438, -3.108338, 0, 1, 0.9921569, 1,
-0.04130859, -0.1578661, -1.771464, 0, 1, 1, 1,
-0.03533344, 0.4705718, -1.041871, 0, 0.9921569, 1, 1,
-0.03145441, -0.1636929, -3.239269, 0, 0.9882353, 1, 1,
-0.03132058, 0.3225586, -0.7264069, 0, 0.9803922, 1, 1,
-0.02794868, -0.2112011, -1.906859, 0, 0.9764706, 1, 1,
-0.02024896, -0.5737615, -4.79794, 0, 0.9686275, 1, 1,
-0.01239089, -0.9379018, -1.640072, 0, 0.9647059, 1, 1,
-0.01135196, -1.307337, -1.328871, 0, 0.9568627, 1, 1,
-0.01123682, -0.01155105, -2.239676, 0, 0.9529412, 1, 1,
-0.01004797, 0.2954463, -1.077911, 0, 0.945098, 1, 1,
-0.005181263, -0.0842494, -2.614927, 0, 0.9411765, 1, 1,
-0.004089902, 0.06042376, 0.8655801, 0, 0.9333333, 1, 1,
-0.003067743, 0.4408721, 0.5775445, 0, 0.9294118, 1, 1,
-0.0006244748, 0.5556474, 1.354397, 0, 0.9215686, 1, 1,
-0.0002700401, -1.684123, -1.803228, 0, 0.9176471, 1, 1,
-0.0002024043, 0.3176452, -0.006729787, 0, 0.9098039, 1, 1,
-3.849767e-05, 0.1622638, -0.9662604, 0, 0.9058824, 1, 1,
0.0004367088, 0.1055181, -0.3880944, 0, 0.8980392, 1, 1,
0.0004622516, -0.032518, 3.117784, 0, 0.8901961, 1, 1,
0.0005191445, -0.7749047, 4.151865, 0, 0.8862745, 1, 1,
0.002094009, 1.095997, 0.2772438, 0, 0.8784314, 1, 1,
0.004694359, 0.2378325, -0.8610739, 0, 0.8745098, 1, 1,
0.01206878, 0.9439472, -1.59933, 0, 0.8666667, 1, 1,
0.0125437, 0.6072366, 1.167516, 0, 0.8627451, 1, 1,
0.01308505, -0.9171502, 3.711067, 0, 0.854902, 1, 1,
0.01402316, -0.1999119, 3.902936, 0, 0.8509804, 1, 1,
0.01584186, -1.615204, 4.052915, 0, 0.8431373, 1, 1,
0.01811607, 1.202938, 0.2803728, 0, 0.8392157, 1, 1,
0.02171675, -1.04523, 1.765154, 0, 0.8313726, 1, 1,
0.02249951, 1.044254, -1.229709, 0, 0.827451, 1, 1,
0.02360501, -0.5559998, 2.068279, 0, 0.8196079, 1, 1,
0.02459328, -0.4991977, 2.349696, 0, 0.8156863, 1, 1,
0.02727483, -0.121923, 4.88515, 0, 0.8078431, 1, 1,
0.02911196, -0.7406054, 2.949779, 0, 0.8039216, 1, 1,
0.02985875, -2.047136, 4.186479, 0, 0.7960784, 1, 1,
0.03084839, -0.3237557, 3.866795, 0, 0.7882353, 1, 1,
0.03288881, 1.253264, -1.355346, 0, 0.7843137, 1, 1,
0.03353231, 0.617893, -0.2628464, 0, 0.7764706, 1, 1,
0.03787605, -0.4266845, 4.335983, 0, 0.772549, 1, 1,
0.03967139, 0.5179759, 1.204947, 0, 0.7647059, 1, 1,
0.04251049, -1.009372, 2.92567, 0, 0.7607843, 1, 1,
0.04263816, -0.4210842, 3.879663, 0, 0.7529412, 1, 1,
0.05146676, 0.6932591, -0.05227345, 0, 0.7490196, 1, 1,
0.05437602, -0.1766321, 2.6502, 0, 0.7411765, 1, 1,
0.05778575, -0.4249129, 2.113717, 0, 0.7372549, 1, 1,
0.05808326, 1.315725, -0.7355219, 0, 0.7294118, 1, 1,
0.05940605, 1.293487, -0.2133676, 0, 0.7254902, 1, 1,
0.05959212, -0.1060463, 3.408916, 0, 0.7176471, 1, 1,
0.05974231, 0.1634578, -1.084409, 0, 0.7137255, 1, 1,
0.06571119, -0.6833403, 3.26359, 0, 0.7058824, 1, 1,
0.06758043, 0.3149211, 0.8668342, 0, 0.6980392, 1, 1,
0.06769083, -0.4314776, 3.352018, 0, 0.6941177, 1, 1,
0.0718707, -1.587604, 1.06052, 0, 0.6862745, 1, 1,
0.07292996, -0.5664984, 2.804775, 0, 0.682353, 1, 1,
0.07507909, 1.280048, -1.386966, 0, 0.6745098, 1, 1,
0.0806828, -0.9528945, 3.461905, 0, 0.6705883, 1, 1,
0.08355246, -1.456771, 3.223967, 0, 0.6627451, 1, 1,
0.08416778, -0.7077044, 3.629427, 0, 0.6588235, 1, 1,
0.08942225, 1.174444, 0.1649239, 0, 0.6509804, 1, 1,
0.09095705, -0.4458147, 2.680963, 0, 0.6470588, 1, 1,
0.09120896, 0.3876384, 0.3081867, 0, 0.6392157, 1, 1,
0.09141031, -0.682456, 3.62013, 0, 0.6352941, 1, 1,
0.09603147, 0.2966774, -0.4134057, 0, 0.627451, 1, 1,
0.09743501, 0.400564, 0.4499949, 0, 0.6235294, 1, 1,
0.09810607, 1.100687, 0.2772233, 0, 0.6156863, 1, 1,
0.1022999, 1.243242, -0.7574198, 0, 0.6117647, 1, 1,
0.1026111, 1.713745, -0.5277205, 0, 0.6039216, 1, 1,
0.1030259, 1.659676, 1.067682, 0, 0.5960785, 1, 1,
0.1076595, 0.5082007, 1.350008, 0, 0.5921569, 1, 1,
0.1096451, -0.01784269, 2.796433, 0, 0.5843138, 1, 1,
0.1110862, -0.1448905, 2.658807, 0, 0.5803922, 1, 1,
0.1121051, -0.4409893, 4.250155, 0, 0.572549, 1, 1,
0.1121799, 1.960701, -0.3145505, 0, 0.5686275, 1, 1,
0.1129631, -1.526134, 0.9126042, 0, 0.5607843, 1, 1,
0.1130791, 0.6826057, -0.01444273, 0, 0.5568628, 1, 1,
0.1152102, 1.100631, 0.8352693, 0, 0.5490196, 1, 1,
0.1193725, -0.8352333, 2.772016, 0, 0.5450981, 1, 1,
0.1267441, -0.3000222, 4.078788, 0, 0.5372549, 1, 1,
0.1284391, 0.7291079, 0.9163167, 0, 0.5333334, 1, 1,
0.1344054, 0.5407075, -1.840233, 0, 0.5254902, 1, 1,
0.1404049, -0.399106, 0.5400066, 0, 0.5215687, 1, 1,
0.142409, 0.8399161, -0.498211, 0, 0.5137255, 1, 1,
0.1450741, -1.82206, 1.078585, 0, 0.509804, 1, 1,
0.1492764, -0.5518994, 2.039749, 0, 0.5019608, 1, 1,
0.1494647, -1.333461, 1.948332, 0, 0.4941176, 1, 1,
0.1508449, 0.5738178, -0.8549843, 0, 0.4901961, 1, 1,
0.1557134, -1.130937, 2.94724, 0, 0.4823529, 1, 1,
0.1586921, -0.4272808, 2.681465, 0, 0.4784314, 1, 1,
0.1596444, -0.3023235, 1.469189, 0, 0.4705882, 1, 1,
0.1607137, -0.009592768, 1.387657, 0, 0.4666667, 1, 1,
0.1621285, 0.3363106, 0.8033404, 0, 0.4588235, 1, 1,
0.1663344, -1.543882, 3.147555, 0, 0.454902, 1, 1,
0.1672045, 0.02914699, 1.284712, 0, 0.4470588, 1, 1,
0.1696042, 0.06458376, 1.9805, 0, 0.4431373, 1, 1,
0.1705414, 1.10143, 0.542433, 0, 0.4352941, 1, 1,
0.179609, 3.137106, -2.10643, 0, 0.4313726, 1, 1,
0.1797786, 1.898907, -0.3473475, 0, 0.4235294, 1, 1,
0.180607, 0.2805894, 2.322735, 0, 0.4196078, 1, 1,
0.1860532, -1.160655, 1.646838, 0, 0.4117647, 1, 1,
0.1905831, -0.4129587, 3.66262, 0, 0.4078431, 1, 1,
0.1913958, -1.052771, 2.41241, 0, 0.4, 1, 1,
0.1915163, 2.044736, 1.246817, 0, 0.3921569, 1, 1,
0.1926004, -0.4683246, 3.239081, 0, 0.3882353, 1, 1,
0.1947701, -0.910701, 4.169145, 0, 0.3803922, 1, 1,
0.1951866, 1.672745, -0.3395601, 0, 0.3764706, 1, 1,
0.1954911, -0.9216488, 4.240075, 0, 0.3686275, 1, 1,
0.1958149, -0.1622902, 1.833492, 0, 0.3647059, 1, 1,
0.1998431, 0.6192853, 0.7452553, 0, 0.3568628, 1, 1,
0.2006238, -0.9870102, 2.961415, 0, 0.3529412, 1, 1,
0.2025009, -0.1822855, 3.337671, 0, 0.345098, 1, 1,
0.2050075, 0.09533156, -1.136787, 0, 0.3411765, 1, 1,
0.2067395, -1.158362, 1.896202, 0, 0.3333333, 1, 1,
0.2113861, -1.559988, 2.694179, 0, 0.3294118, 1, 1,
0.2145873, 0.63806, 0.01477344, 0, 0.3215686, 1, 1,
0.2197956, 1.852101, -1.400088, 0, 0.3176471, 1, 1,
0.2221065, -1.869752, 2.795876, 0, 0.3098039, 1, 1,
0.22287, 1.824062, 0.797156, 0, 0.3058824, 1, 1,
0.2247056, -0.1846396, 2.204322, 0, 0.2980392, 1, 1,
0.2248538, 2.498186, -0.2069891, 0, 0.2901961, 1, 1,
0.2285886, 0.1420297, 1.476295, 0, 0.2862745, 1, 1,
0.2392272, -1.240927, 2.463122, 0, 0.2784314, 1, 1,
0.2395691, -1.194847, 4.505411, 0, 0.2745098, 1, 1,
0.2409475, -0.2000644, 3.310557, 0, 0.2666667, 1, 1,
0.2454152, -2.164388, 1.350401, 0, 0.2627451, 1, 1,
0.2456288, -0.8517638, 2.83475, 0, 0.254902, 1, 1,
0.2508267, 0.5413675, 0.9725578, 0, 0.2509804, 1, 1,
0.2536436, 0.3863458, 2.237712, 0, 0.2431373, 1, 1,
0.2597276, -0.3330605, 2.007322, 0, 0.2392157, 1, 1,
0.2606762, -0.5171884, 3.11867, 0, 0.2313726, 1, 1,
0.2665881, 1.707213, -1.634432, 0, 0.227451, 1, 1,
0.275879, -0.2749796, 4.031828, 0, 0.2196078, 1, 1,
0.2760559, 1.451105, -1.685063, 0, 0.2156863, 1, 1,
0.277367, -0.1303434, 0.6785102, 0, 0.2078431, 1, 1,
0.277511, 1.294242, 0.2702706, 0, 0.2039216, 1, 1,
0.2779703, -0.536825, 3.652129, 0, 0.1960784, 1, 1,
0.279475, 0.2429253, 1.137653, 0, 0.1882353, 1, 1,
0.2795959, 0.2464591, 1.242455, 0, 0.1843137, 1, 1,
0.2837263, 0.4691386, -0.2754697, 0, 0.1764706, 1, 1,
0.2880152, 1.50919, -0.1283532, 0, 0.172549, 1, 1,
0.296752, 1.030841, 0.4120839, 0, 0.1647059, 1, 1,
0.2970952, -0.2806331, 2.930887, 0, 0.1607843, 1, 1,
0.2978365, 1.190899, 0.8989791, 0, 0.1529412, 1, 1,
0.2982682, -0.4053124, 2.414991, 0, 0.1490196, 1, 1,
0.2996537, -0.4975044, 2.572009, 0, 0.1411765, 1, 1,
0.3001816, -0.397384, 5.032498, 0, 0.1372549, 1, 1,
0.3007398, -1.600952, 3.861352, 0, 0.1294118, 1, 1,
0.3009906, 0.1805082, 0.9908791, 0, 0.1254902, 1, 1,
0.3053362, -1.161996, 3.92697, 0, 0.1176471, 1, 1,
0.306467, -0.9981069, 2.19932, 0, 0.1137255, 1, 1,
0.308649, -0.2472781, 1.961698, 0, 0.1058824, 1, 1,
0.3161992, 0.3567486, 0.3572784, 0, 0.09803922, 1, 1,
0.3278808, -0.640681, -0.3361265, 0, 0.09411765, 1, 1,
0.3280259, 0.6277952, 1.368148, 0, 0.08627451, 1, 1,
0.3294723, -0.01416799, 3.096207, 0, 0.08235294, 1, 1,
0.3306777, 0.5634099, 0.2946635, 0, 0.07450981, 1, 1,
0.3309662, -0.2684447, 1.913248, 0, 0.07058824, 1, 1,
0.3329737, 0.7952582, 2.595822, 0, 0.0627451, 1, 1,
0.3336894, 0.3259531, 2.169976, 0, 0.05882353, 1, 1,
0.3360966, 0.1693544, 0.8884311, 0, 0.05098039, 1, 1,
0.3368514, 0.5194072, -0.9272959, 0, 0.04705882, 1, 1,
0.3374923, 0.6650326, 0.6239755, 0, 0.03921569, 1, 1,
0.3386129, 0.8265752, -0.5783779, 0, 0.03529412, 1, 1,
0.3399696, -0.7537742, 2.70404, 0, 0.02745098, 1, 1,
0.3413135, -1.047769, 2.558736, 0, 0.02352941, 1, 1,
0.3416429, -1.172726, 2.497334, 0, 0.01568628, 1, 1,
0.3441485, 0.8618742, 1.468741, 0, 0.01176471, 1, 1,
0.3463612, -0.2997495, 1.980261, 0, 0.003921569, 1, 1,
0.3503979, 0.2316132, 0.2783503, 0.003921569, 0, 1, 1,
0.3551352, 0.7468019, 1.287266, 0.007843138, 0, 1, 1,
0.3715776, -2.005995, 3.2457, 0.01568628, 0, 1, 1,
0.3730378, -0.5290033, 1.809379, 0.01960784, 0, 1, 1,
0.3753968, 0.8964381, -0.4505614, 0.02745098, 0, 1, 1,
0.3778187, 0.7944304, -0.7171136, 0.03137255, 0, 1, 1,
0.3826972, 0.8927649, 2.691694, 0.03921569, 0, 1, 1,
0.390245, 0.2893263, 2.335161, 0.04313726, 0, 1, 1,
0.3936113, 0.5587528, 0.716835, 0.05098039, 0, 1, 1,
0.3949676, -1.367475, 3.924346, 0.05490196, 0, 1, 1,
0.4078361, 0.4965721, 1.442077, 0.0627451, 0, 1, 1,
0.4135417, -0.5742599, 2.411046, 0.06666667, 0, 1, 1,
0.4138197, 0.1490458, 0.5365676, 0.07450981, 0, 1, 1,
0.4141062, -0.4679678, 3.819122, 0.07843138, 0, 1, 1,
0.4173985, -0.2040514, 4.18937, 0.08627451, 0, 1, 1,
0.4197616, -1.127016, 2.978801, 0.09019608, 0, 1, 1,
0.4231886, -1.559612, 2.146602, 0.09803922, 0, 1, 1,
0.4291602, -0.9627168, 2.812737, 0.1058824, 0, 1, 1,
0.4313706, -1.158619, 1.086828, 0.1098039, 0, 1, 1,
0.4314433, -0.08552837, 1.902259, 0.1176471, 0, 1, 1,
0.4366325, 0.7646282, -0.3739646, 0.1215686, 0, 1, 1,
0.4433088, -0.5858871, 2.152644, 0.1294118, 0, 1, 1,
0.4433453, -0.5489726, 3.125287, 0.1333333, 0, 1, 1,
0.443891, 0.9100887, -0.8667555, 0.1411765, 0, 1, 1,
0.444968, -0.2366763, 2.943023, 0.145098, 0, 1, 1,
0.4466348, 0.4949074, 0.8116132, 0.1529412, 0, 1, 1,
0.4477893, -1.838718, 2.584976, 0.1568628, 0, 1, 1,
0.4596519, -2.161116, 3.570081, 0.1647059, 0, 1, 1,
0.4611859, -1.598868, 1.855964, 0.1686275, 0, 1, 1,
0.4664451, 0.06102391, 0.5068298, 0.1764706, 0, 1, 1,
0.4740823, 2.196401, -0.4754655, 0.1803922, 0, 1, 1,
0.4836477, -1.672334, 1.814559, 0.1882353, 0, 1, 1,
0.4853585, 0.1422411, 1.748734, 0.1921569, 0, 1, 1,
0.491754, -1.947004, 3.907308, 0.2, 0, 1, 1,
0.5014744, -1.104692, 0.9823842, 0.2078431, 0, 1, 1,
0.5064629, 2.733972, 0.5939261, 0.2117647, 0, 1, 1,
0.5082127, -0.4849128, 3.161979, 0.2196078, 0, 1, 1,
0.5121671, -0.2146923, 1.924997, 0.2235294, 0, 1, 1,
0.512487, -0.10197, 1.399741, 0.2313726, 0, 1, 1,
0.5129927, -0.268979, 1.901419, 0.2352941, 0, 1, 1,
0.5148422, 0.9468991, -2.10995, 0.2431373, 0, 1, 1,
0.5222949, -0.6179324, 2.588659, 0.2470588, 0, 1, 1,
0.52403, -0.6237448, 2.10067, 0.254902, 0, 1, 1,
0.5244727, 1.668881, -0.2300576, 0.2588235, 0, 1, 1,
0.5277556, -0.1685553, 4.448307, 0.2666667, 0, 1, 1,
0.5287828, 0.2099469, 2.11394, 0.2705882, 0, 1, 1,
0.5320108, 0.3907526, 1.193974, 0.2784314, 0, 1, 1,
0.5346902, -1.095043, 2.94708, 0.282353, 0, 1, 1,
0.5364349, -1.31375, 4.40527, 0.2901961, 0, 1, 1,
0.5433645, 0.8034284, 0.01847401, 0.2941177, 0, 1, 1,
0.5457796, 0.8576379, 1.780885, 0.3019608, 0, 1, 1,
0.5523393, 1.057912, -0.5649963, 0.3098039, 0, 1, 1,
0.5559577, 0.883064, 1.870146, 0.3137255, 0, 1, 1,
0.5664269, -2.005014, 3.106529, 0.3215686, 0, 1, 1,
0.5688922, -1.414196, 4.823112, 0.3254902, 0, 1, 1,
0.5729907, -0.4702716, 2.931624, 0.3333333, 0, 1, 1,
0.574537, -0.1950999, 2.329332, 0.3372549, 0, 1, 1,
0.5773499, -0.3516494, 4.104879, 0.345098, 0, 1, 1,
0.5785304, 1.002715, 0.409584, 0.3490196, 0, 1, 1,
0.5795108, 0.5528752, 0.09059859, 0.3568628, 0, 1, 1,
0.5804327, -0.3840547, 1.391037, 0.3607843, 0, 1, 1,
0.580994, -1.410728, 0.6355809, 0.3686275, 0, 1, 1,
0.5817874, -0.1561599, 2.442193, 0.372549, 0, 1, 1,
0.5872929, 0.01125231, 0.6924489, 0.3803922, 0, 1, 1,
0.5939248, -0.01807705, 0.9521013, 0.3843137, 0, 1, 1,
0.5941649, -1.057095, 1.439223, 0.3921569, 0, 1, 1,
0.6113691, 1.387921, 1.886331, 0.3960784, 0, 1, 1,
0.6140224, 0.8627071, 0.3948878, 0.4039216, 0, 1, 1,
0.6208308, -0.3022959, 3.663936, 0.4117647, 0, 1, 1,
0.6232198, 1.259405, -0.4440449, 0.4156863, 0, 1, 1,
0.624584, 0.3986394, 3.23708, 0.4235294, 0, 1, 1,
0.6265017, 1.58841, 0.8191627, 0.427451, 0, 1, 1,
0.6284218, 0.425291, 0.1759268, 0.4352941, 0, 1, 1,
0.6306037, -0.1865921, 2.469429, 0.4392157, 0, 1, 1,
0.6352216, 0.1224728, 1.938486, 0.4470588, 0, 1, 1,
0.6376301, 0.2028727, 1.368634, 0.4509804, 0, 1, 1,
0.6400543, 0.6057904, 1.796126, 0.4588235, 0, 1, 1,
0.6407357, 0.5923192, 1.720839, 0.4627451, 0, 1, 1,
0.6415373, -1.113372, 1.438219, 0.4705882, 0, 1, 1,
0.642947, 0.6325014, 1.625243, 0.4745098, 0, 1, 1,
0.6439151, 1.237869, 0.972596, 0.4823529, 0, 1, 1,
0.6441455, 0.236934, 3.091639, 0.4862745, 0, 1, 1,
0.6522243, 0.1995118, 1.840281, 0.4941176, 0, 1, 1,
0.6548269, 0.0150357, 0.8207939, 0.5019608, 0, 1, 1,
0.6562027, 0.9502119, 1.90327, 0.5058824, 0, 1, 1,
0.6564589, -0.2902547, 2.296945, 0.5137255, 0, 1, 1,
0.6609598, -0.7876295, 3.290503, 0.5176471, 0, 1, 1,
0.6627026, 0.3833238, 4.644556, 0.5254902, 0, 1, 1,
0.665053, 0.5700855, 1.704464, 0.5294118, 0, 1, 1,
0.6652448, -1.636356, 4.044565, 0.5372549, 0, 1, 1,
0.6672909, 0.164954, 2.016949, 0.5411765, 0, 1, 1,
0.6706917, -0.1690357, 1.952919, 0.5490196, 0, 1, 1,
0.6728992, 0.4327629, 0.3737809, 0.5529412, 0, 1, 1,
0.6747118, -0.5637012, 0.893186, 0.5607843, 0, 1, 1,
0.6768085, 0.7147623, 1.31372, 0.5647059, 0, 1, 1,
0.6782902, 0.1089655, 2.179198, 0.572549, 0, 1, 1,
0.6906613, -0.02114295, 1.539864, 0.5764706, 0, 1, 1,
0.6960301, -1.90533, 1.723076, 0.5843138, 0, 1, 1,
0.6962831, -1.117162, 2.862139, 0.5882353, 0, 1, 1,
0.7040338, 0.2165798, 2.034853, 0.5960785, 0, 1, 1,
0.7093042, 1.107103, 0.2906341, 0.6039216, 0, 1, 1,
0.7132831, -0.1564411, 2.592616, 0.6078432, 0, 1, 1,
0.7192498, 1.382177, -0.7886147, 0.6156863, 0, 1, 1,
0.7221776, 0.1625233, 1.408793, 0.6196079, 0, 1, 1,
0.7241719, -0.3549302, 1.647433, 0.627451, 0, 1, 1,
0.7282442, -0.9626535, 2.030628, 0.6313726, 0, 1, 1,
0.7341571, 0.4997388, 1.07674, 0.6392157, 0, 1, 1,
0.7343374, 0.04047083, 2.22721, 0.6431373, 0, 1, 1,
0.7397238, -0.9848856, 3.792398, 0.6509804, 0, 1, 1,
0.7404554, -0.7000573, 0.3110644, 0.654902, 0, 1, 1,
0.7430031, 0.4984406, 2.879717, 0.6627451, 0, 1, 1,
0.7463059, -0.03688633, 1.451315, 0.6666667, 0, 1, 1,
0.7482681, -0.5117072, 2.260381, 0.6745098, 0, 1, 1,
0.7488629, 1.012513, 0.2661196, 0.6784314, 0, 1, 1,
0.7517121, 1.420572, 0.4518183, 0.6862745, 0, 1, 1,
0.7539805, -1.95583, 3.241735, 0.6901961, 0, 1, 1,
0.766443, 0.4021363, 2.151209, 0.6980392, 0, 1, 1,
0.767148, 0.7723478, 1.603518, 0.7058824, 0, 1, 1,
0.7675342, -0.3853034, 2.506327, 0.7098039, 0, 1, 1,
0.7713014, -1.421575, 3.829384, 0.7176471, 0, 1, 1,
0.7713988, -0.1315797, 2.846143, 0.7215686, 0, 1, 1,
0.7765934, -0.3440208, 3.098433, 0.7294118, 0, 1, 1,
0.7821791, -1.002041, 3.181546, 0.7333333, 0, 1, 1,
0.7857099, -0.4773605, 1.601925, 0.7411765, 0, 1, 1,
0.7932997, 1.18008, 0.7575908, 0.7450981, 0, 1, 1,
0.7945085, 0.9862769, 0.3930826, 0.7529412, 0, 1, 1,
0.7992725, 0.08788259, 0.7849205, 0.7568628, 0, 1, 1,
0.8012951, 1.108379, -0.1902692, 0.7647059, 0, 1, 1,
0.8019294, -0.4827929, 0.9014122, 0.7686275, 0, 1, 1,
0.8042182, 1.734437, -0.02262835, 0.7764706, 0, 1, 1,
0.8050473, 0.2289051, 0.9999671, 0.7803922, 0, 1, 1,
0.8120825, -0.8026498, 1.865117, 0.7882353, 0, 1, 1,
0.8157124, 1.098187, 1.863422, 0.7921569, 0, 1, 1,
0.8161187, 0.9631168, 1.223453, 0.8, 0, 1, 1,
0.8244022, -1.327562, 3.121016, 0.8078431, 0, 1, 1,
0.8275452, 0.1818854, 2.543844, 0.8117647, 0, 1, 1,
0.8281448, -0.4888678, 1.526408, 0.8196079, 0, 1, 1,
0.8300685, -0.5939824, 2.939879, 0.8235294, 0, 1, 1,
0.8310072, 0.3333159, 2.269462, 0.8313726, 0, 1, 1,
0.8322385, -0.4248122, 2.762781, 0.8352941, 0, 1, 1,
0.8365573, -1.173067, 1.915032, 0.8431373, 0, 1, 1,
0.8473735, 0.9226774, -0.5380204, 0.8470588, 0, 1, 1,
0.8542734, 0.0941987, 2.116867, 0.854902, 0, 1, 1,
0.8559298, 0.151912, 3.286123, 0.8588235, 0, 1, 1,
0.8591553, -0.2916873, 1.79864, 0.8666667, 0, 1, 1,
0.8629367, 0.1501465, 1.561453, 0.8705882, 0, 1, 1,
0.87428, 0.215246, 2.71187, 0.8784314, 0, 1, 1,
0.8764262, 0.5787494, 2.164653, 0.8823529, 0, 1, 1,
0.8776944, 0.2261534, 1.00988, 0.8901961, 0, 1, 1,
0.8807696, 0.6803818, 0.1777394, 0.8941177, 0, 1, 1,
0.884571, -1.865122, 2.179586, 0.9019608, 0, 1, 1,
0.8851753, 0.5926713, 1.983938, 0.9098039, 0, 1, 1,
0.885518, 0.5993972, 0.007688166, 0.9137255, 0, 1, 1,
0.8968001, 0.5247243, -0.06085716, 0.9215686, 0, 1, 1,
0.8969047, -0.1915044, 1.100062, 0.9254902, 0, 1, 1,
0.8980795, -0.6982992, 2.66952, 0.9333333, 0, 1, 1,
0.9043811, 1.247702, -0.7050633, 0.9372549, 0, 1, 1,
0.9052876, -0.04574439, 0.8051642, 0.945098, 0, 1, 1,
0.9058164, -0.2619092, 2.004979, 0.9490196, 0, 1, 1,
0.9105921, -0.1973168, 2.568823, 0.9568627, 0, 1, 1,
0.9132018, -1.528509, 3.082202, 0.9607843, 0, 1, 1,
0.9145162, 0.0959873, -0.9338878, 0.9686275, 0, 1, 1,
0.9173924, 0.3259159, -0.2528164, 0.972549, 0, 1, 1,
0.9210208, 0.325824, 0.8953704, 0.9803922, 0, 1, 1,
0.9230895, 0.009580165, 2.277297, 0.9843137, 0, 1, 1,
0.9259346, -1.12245, 2.053191, 0.9921569, 0, 1, 1,
0.9322472, 0.1183852, 1.164008, 0.9960784, 0, 1, 1,
0.9324417, 0.468965, 1.621031, 1, 0, 0.9960784, 1,
0.9356163, -1.966665, 2.997457, 1, 0, 0.9882353, 1,
0.9373489, -2.150452, 1.770744, 1, 0, 0.9843137, 1,
0.939301, -0.7958888, 2.25128, 1, 0, 0.9764706, 1,
0.9411393, 2.04113, 0.5951013, 1, 0, 0.972549, 1,
0.9448451, -0.4442108, 1.520638, 1, 0, 0.9647059, 1,
0.9468334, -0.05315078, 1.826647, 1, 0, 0.9607843, 1,
0.9584503, 1.804493, 0.8160595, 1, 0, 0.9529412, 1,
0.9745634, -0.1016302, 3.363785, 1, 0, 0.9490196, 1,
0.9817573, -0.8482397, 1.639423, 1, 0, 0.9411765, 1,
0.9883686, 0.4381389, -0.4858807, 1, 0, 0.9372549, 1,
0.9963555, -0.2399839, 0.3629397, 1, 0, 0.9294118, 1,
0.9969357, 0.5003876, 0.7120374, 1, 0, 0.9254902, 1,
0.997309, -0.7476443, 1.769419, 1, 0, 0.9176471, 1,
0.9981465, 0.3216792, -0.4786473, 1, 0, 0.9137255, 1,
1.009911, 0.1224313, 1.682862, 1, 0, 0.9058824, 1,
1.01371, -0.9569355, 3.17537, 1, 0, 0.9019608, 1,
1.016791, -0.09461752, 0.9806049, 1, 0, 0.8941177, 1,
1.019741, -1.673335, 2.81065, 1, 0, 0.8862745, 1,
1.020746, -0.4897751, 2.046374, 1, 0, 0.8823529, 1,
1.022121, 1.214437, 1.407413, 1, 0, 0.8745098, 1,
1.024127, -1.464062, 1.81174, 1, 0, 0.8705882, 1,
1.025211, 0.5249242, 0.848491, 1, 0, 0.8627451, 1,
1.030287, -1.011983, 3.440191, 1, 0, 0.8588235, 1,
1.035089, 1.395619, 0.7731777, 1, 0, 0.8509804, 1,
1.038935, 1.311026, 2.046185, 1, 0, 0.8470588, 1,
1.044196, 0.1761539, 1.77945, 1, 0, 0.8392157, 1,
1.045237, -0.03320589, 4.295018, 1, 0, 0.8352941, 1,
1.053321, 0.3368321, 0.9659525, 1, 0, 0.827451, 1,
1.055552, 1.329021, 0.7329263, 1, 0, 0.8235294, 1,
1.062854, -0.2289545, 2.286134, 1, 0, 0.8156863, 1,
1.0659, -1.400917, 3.420872, 1, 0, 0.8117647, 1,
1.080889, 1.129049, 0.06915689, 1, 0, 0.8039216, 1,
1.082875, -0.07756876, 0.4112957, 1, 0, 0.7960784, 1,
1.084712, -0.7413481, 3.155171, 1, 0, 0.7921569, 1,
1.09505, 0.5412735, 0.1150114, 1, 0, 0.7843137, 1,
1.095057, 1.337155, 0.4581174, 1, 0, 0.7803922, 1,
1.101028, 0.6229522, 2.29802, 1, 0, 0.772549, 1,
1.101884, 0.6802611, 1.871807, 1, 0, 0.7686275, 1,
1.102889, -1.132952, 3.893554, 1, 0, 0.7607843, 1,
1.10619, -1.495868, 2.072811, 1, 0, 0.7568628, 1,
1.118236, -1.031259, 2.902849, 1, 0, 0.7490196, 1,
1.119754, 0.3419417, 2.104168, 1, 0, 0.7450981, 1,
1.121386, -0.5472648, 5.564344, 1, 0, 0.7372549, 1,
1.129905, 0.3073382, 1.275915, 1, 0, 0.7333333, 1,
1.131907, 1.103783, -1.153075, 1, 0, 0.7254902, 1,
1.132985, -0.5839145, 4.14186, 1, 0, 0.7215686, 1,
1.140212, 0.3480642, 2.314984, 1, 0, 0.7137255, 1,
1.140799, 0.548672, -0.235694, 1, 0, 0.7098039, 1,
1.147306, -1.849959, 1.635578, 1, 0, 0.7019608, 1,
1.149271, 0.001298904, 0.7744737, 1, 0, 0.6941177, 1,
1.155814, 0.05820871, 1.58465, 1, 0, 0.6901961, 1,
1.161106, -0.5275411, 2.538256, 1, 0, 0.682353, 1,
1.171857, 0.1360766, 1.079752, 1, 0, 0.6784314, 1,
1.174875, 2.009743, 0.6462193, 1, 0, 0.6705883, 1,
1.182673, 1.458771, 0.5142434, 1, 0, 0.6666667, 1,
1.190072, -0.4475188, 1.795484, 1, 0, 0.6588235, 1,
1.190318, -0.07509427, 2.939506, 1, 0, 0.654902, 1,
1.197805, 1.435141, 1.372642, 1, 0, 0.6470588, 1,
1.204414, 1.021535, 0.4753399, 1, 0, 0.6431373, 1,
1.206001, -2.222472, 1.648733, 1, 0, 0.6352941, 1,
1.206893, -0.001408361, 2.682078, 1, 0, 0.6313726, 1,
1.228974, -1.414317, 2.260442, 1, 0, 0.6235294, 1,
1.24071, -0.1780677, 2.282791, 1, 0, 0.6196079, 1,
1.259555, 0.5101962, 1.776, 1, 0, 0.6117647, 1,
1.275415, 0.4540054, 2.823063, 1, 0, 0.6078432, 1,
1.27912, -1.829106, 3.56877, 1, 0, 0.6, 1,
1.287077, 0.3749936, 0.6124033, 1, 0, 0.5921569, 1,
1.288647, 0.7449145, 1.864259, 1, 0, 0.5882353, 1,
1.288894, 0.6789406, 2.611634, 1, 0, 0.5803922, 1,
1.31051, 1.219854, 1.023696, 1, 0, 0.5764706, 1,
1.310694, -0.9208981, 2.109516, 1, 0, 0.5686275, 1,
1.312689, -2.425321, 3.881058, 1, 0, 0.5647059, 1,
1.315057, -0.4716571, 2.00612, 1, 0, 0.5568628, 1,
1.337622, 1.100622, 0.02435258, 1, 0, 0.5529412, 1,
1.340845, 0.1636044, 1.624855, 1, 0, 0.5450981, 1,
1.349789, 0.371838, 1.68993, 1, 0, 0.5411765, 1,
1.350287, -0.968527, 3.510696, 1, 0, 0.5333334, 1,
1.357092, 1.367491, 0.5837448, 1, 0, 0.5294118, 1,
1.370924, -1.738785, 3.057543, 1, 0, 0.5215687, 1,
1.37246, -0.3721829, 1.785467, 1, 0, 0.5176471, 1,
1.373553, -1.174953, 2.258169, 1, 0, 0.509804, 1,
1.377414, -0.2180937, 1.278877, 1, 0, 0.5058824, 1,
1.389627, -0.4726188, 1.415617, 1, 0, 0.4980392, 1,
1.3976, -2.078375, 2.709429, 1, 0, 0.4901961, 1,
1.399757, 1.841707, 0.03023412, 1, 0, 0.4862745, 1,
1.401551, -1.043102, 2.683288, 1, 0, 0.4784314, 1,
1.413048, 0.1493948, 1.712416, 1, 0, 0.4745098, 1,
1.413229, 0.1024281, 1.269834, 1, 0, 0.4666667, 1,
1.425806, 0.07739884, 0.3797958, 1, 0, 0.4627451, 1,
1.430663, 0.3249205, 0.9717022, 1, 0, 0.454902, 1,
1.436709, -0.01922215, 0.9917634, 1, 0, 0.4509804, 1,
1.437858, -1.140337, 1.075639, 1, 0, 0.4431373, 1,
1.440385, -1.656471, 1.87648, 1, 0, 0.4392157, 1,
1.440977, -0.6675739, 3.262624, 1, 0, 0.4313726, 1,
1.448754, 2.066187, 1.360099, 1, 0, 0.427451, 1,
1.458801, 0.2832273, 1.422692, 1, 0, 0.4196078, 1,
1.477278, -1.089307, -0.1737386, 1, 0, 0.4156863, 1,
1.491081, 0.5349414, 0.4504337, 1, 0, 0.4078431, 1,
1.494262, 2.3671, 1.103474, 1, 0, 0.4039216, 1,
1.498544, 0.3428898, 1.958633, 1, 0, 0.3960784, 1,
1.499686, 1.155596, 1.388573, 1, 0, 0.3882353, 1,
1.500469, -0.390489, 1.977521, 1, 0, 0.3843137, 1,
1.501452, 0.03997663, 0.8499679, 1, 0, 0.3764706, 1,
1.521499, 0.01731402, 2.220558, 1, 0, 0.372549, 1,
1.542665, -0.6130562, 1.151607, 1, 0, 0.3647059, 1,
1.551235, 0.881084, 2.009791, 1, 0, 0.3607843, 1,
1.555826, -0.08385278, 0.6030533, 1, 0, 0.3529412, 1,
1.559086, -2.349557, 1.062648, 1, 0, 0.3490196, 1,
1.582425, -0.542658, 0.5263473, 1, 0, 0.3411765, 1,
1.58436, 0.4974416, -0.5417726, 1, 0, 0.3372549, 1,
1.586492, -0.0941684, 1.35383, 1, 0, 0.3294118, 1,
1.593063, 0.3200802, 0.5116499, 1, 0, 0.3254902, 1,
1.639455, 0.4851909, 2.799136, 1, 0, 0.3176471, 1,
1.642102, 2.719556, -0.4421037, 1, 0, 0.3137255, 1,
1.66231, -0.492729, 0.6838836, 1, 0, 0.3058824, 1,
1.664724, -0.09516112, 0.1330681, 1, 0, 0.2980392, 1,
1.66675, 0.6326979, 1.053926, 1, 0, 0.2941177, 1,
1.66787, 1.623547, -0.8851907, 1, 0, 0.2862745, 1,
1.668228, -1.720579, 0.6849542, 1, 0, 0.282353, 1,
1.684807, -0.5738384, 2.23054, 1, 0, 0.2745098, 1,
1.696391, 0.6368107, 1.356002, 1, 0, 0.2705882, 1,
1.699458, 0.2693689, -1.230507, 1, 0, 0.2627451, 1,
1.70155, 1.179562, 2.166334, 1, 0, 0.2588235, 1,
1.724648, -0.6918353, 1.575831, 1, 0, 0.2509804, 1,
1.72787, -0.3098507, 1.831559, 1, 0, 0.2470588, 1,
1.744266, -0.6062504, 0.6853042, 1, 0, 0.2392157, 1,
1.82743, 1.888999, -0.3354665, 1, 0, 0.2352941, 1,
1.838512, -1.127758, 1.880313, 1, 0, 0.227451, 1,
1.838552, 1.107845, 0.09064285, 1, 0, 0.2235294, 1,
1.839166, 0.7970976, 3.666506, 1, 0, 0.2156863, 1,
1.854916, 1.039558, 1.204987, 1, 0, 0.2117647, 1,
1.85938, 0.1009729, 3.253692, 1, 0, 0.2039216, 1,
1.861072, 0.2750759, 1.707086, 1, 0, 0.1960784, 1,
1.864992, 0.1878481, 0.9004074, 1, 0, 0.1921569, 1,
1.868505, -1.224416, 1.345066, 1, 0, 0.1843137, 1,
1.874696, 0.072777, 1.780374, 1, 0, 0.1803922, 1,
1.902093, 0.3873151, 0.9469202, 1, 0, 0.172549, 1,
1.903198, -0.4721305, 1.438543, 1, 0, 0.1686275, 1,
1.939551, 0.8939953, 0.5925766, 1, 0, 0.1607843, 1,
1.952017, -0.51862, 2.139836, 1, 0, 0.1568628, 1,
1.953054, -0.6404376, 3.45125, 1, 0, 0.1490196, 1,
1.963248, -0.7924119, 2.834311, 1, 0, 0.145098, 1,
1.969763, 0.2646081, 0.3604111, 1, 0, 0.1372549, 1,
1.970013, 1.311097, 0.9822327, 1, 0, 0.1333333, 1,
1.986585, -0.02049971, 3.809916, 1, 0, 0.1254902, 1,
2.009356, -0.8683844, 0.9052637, 1, 0, 0.1215686, 1,
2.011424, 0.7192052, 1.607347, 1, 0, 0.1137255, 1,
2.042643, 1.299764, 1.234182, 1, 0, 0.1098039, 1,
2.04758, -0.6554519, 1.466663, 1, 0, 0.1019608, 1,
2.069147, -0.09837096, 1.930263, 1, 0, 0.09411765, 1,
2.077717, 0.08543547, 1.091753, 1, 0, 0.09019608, 1,
2.081698, -0.2401933, 1.04215, 1, 0, 0.08235294, 1,
2.085242, -0.3124396, 2.348827, 1, 0, 0.07843138, 1,
2.086403, 2.059077, 0.4415641, 1, 0, 0.07058824, 1,
2.114895, 0.2883045, 0.7218533, 1, 0, 0.06666667, 1,
2.159432, -0.1391946, 2.825506, 1, 0, 0.05882353, 1,
2.230696, -0.106315, 2.191367, 1, 0, 0.05490196, 1,
2.237327, 0.2566897, 3.340374, 1, 0, 0.04705882, 1,
2.267511, -0.6489685, 2.633921, 1, 0, 0.04313726, 1,
2.29249, 1.351417, 0.8517603, 1, 0, 0.03529412, 1,
2.315065, -1.401547, 1.587755, 1, 0, 0.03137255, 1,
2.418684, -1.230476, 1.938623, 1, 0, 0.02352941, 1,
2.573057, -0.2247361, 1.890898, 1, 0, 0.01960784, 1,
2.839995, -0.7998201, 1.998208, 1, 0, 0.01176471, 1,
3.182105, 0.3393485, 1.176673, 1, 0, 0.007843138, 1
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
0.01459968, -3.502053, -6.763729, 0, -0.5, 0.5, 0.5,
0.01459968, -3.502053, -6.763729, 1, -0.5, 0.5, 0.5,
0.01459968, -3.502053, -6.763729, 1, 1.5, 0.5, 0.5,
0.01459968, -3.502053, -6.763729, 0, 1.5, 0.5, 0.5
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
-4.22669, 0.2986456, -6.763729, 0, -0.5, 0.5, 0.5,
-4.22669, 0.2986456, -6.763729, 1, -0.5, 0.5, 0.5,
-4.22669, 0.2986456, -6.763729, 1, 1.5, 0.5, 0.5,
-4.22669, 0.2986456, -6.763729, 0, 1.5, 0.5, 0.5
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
-4.22669, -3.502053, 0.2936847, 0, -0.5, 0.5, 0.5,
-4.22669, -3.502053, 0.2936847, 1, -0.5, 0.5, 0.5,
-4.22669, -3.502053, 0.2936847, 1, 1.5, 0.5, 0.5,
-4.22669, -3.502053, 0.2936847, 0, 1.5, 0.5, 0.5
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
-3, -2.624969, -5.135095,
3, -2.624969, -5.135095,
-3, -2.624969, -5.135095,
-3, -2.771149, -5.406534,
-2, -2.624969, -5.135095,
-2, -2.771149, -5.406534,
-1, -2.624969, -5.135095,
-1, -2.771149, -5.406534,
0, -2.624969, -5.135095,
0, -2.771149, -5.406534,
1, -2.624969, -5.135095,
1, -2.771149, -5.406534,
2, -2.624969, -5.135095,
2, -2.771149, -5.406534,
3, -2.624969, -5.135095,
3, -2.771149, -5.406534
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
-3, -3.063511, -5.949412, 0, -0.5, 0.5, 0.5,
-3, -3.063511, -5.949412, 1, -0.5, 0.5, 0.5,
-3, -3.063511, -5.949412, 1, 1.5, 0.5, 0.5,
-3, -3.063511, -5.949412, 0, 1.5, 0.5, 0.5,
-2, -3.063511, -5.949412, 0, -0.5, 0.5, 0.5,
-2, -3.063511, -5.949412, 1, -0.5, 0.5, 0.5,
-2, -3.063511, -5.949412, 1, 1.5, 0.5, 0.5,
-2, -3.063511, -5.949412, 0, 1.5, 0.5, 0.5,
-1, -3.063511, -5.949412, 0, -0.5, 0.5, 0.5,
-1, -3.063511, -5.949412, 1, -0.5, 0.5, 0.5,
-1, -3.063511, -5.949412, 1, 1.5, 0.5, 0.5,
-1, -3.063511, -5.949412, 0, 1.5, 0.5, 0.5,
0, -3.063511, -5.949412, 0, -0.5, 0.5, 0.5,
0, -3.063511, -5.949412, 1, -0.5, 0.5, 0.5,
0, -3.063511, -5.949412, 1, 1.5, 0.5, 0.5,
0, -3.063511, -5.949412, 0, 1.5, 0.5, 0.5,
1, -3.063511, -5.949412, 0, -0.5, 0.5, 0.5,
1, -3.063511, -5.949412, 1, -0.5, 0.5, 0.5,
1, -3.063511, -5.949412, 1, 1.5, 0.5, 0.5,
1, -3.063511, -5.949412, 0, 1.5, 0.5, 0.5,
2, -3.063511, -5.949412, 0, -0.5, 0.5, 0.5,
2, -3.063511, -5.949412, 1, -0.5, 0.5, 0.5,
2, -3.063511, -5.949412, 1, 1.5, 0.5, 0.5,
2, -3.063511, -5.949412, 0, 1.5, 0.5, 0.5,
3, -3.063511, -5.949412, 0, -0.5, 0.5, 0.5,
3, -3.063511, -5.949412, 1, -0.5, 0.5, 0.5,
3, -3.063511, -5.949412, 1, 1.5, 0.5, 0.5,
3, -3.063511, -5.949412, 0, 1.5, 0.5, 0.5
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
-3.247931, -2, -5.135095,
-3.247931, 3, -5.135095,
-3.247931, -2, -5.135095,
-3.411057, -2, -5.406534,
-3.247931, -1, -5.135095,
-3.411057, -1, -5.406534,
-3.247931, 0, -5.135095,
-3.411057, 0, -5.406534,
-3.247931, 1, -5.135095,
-3.411057, 1, -5.406534,
-3.247931, 2, -5.135095,
-3.411057, 2, -5.406534,
-3.247931, 3, -5.135095,
-3.411057, 3, -5.406534
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
-3.73731, -2, -5.949412, 0, -0.5, 0.5, 0.5,
-3.73731, -2, -5.949412, 1, -0.5, 0.5, 0.5,
-3.73731, -2, -5.949412, 1, 1.5, 0.5, 0.5,
-3.73731, -2, -5.949412, 0, 1.5, 0.5, 0.5,
-3.73731, -1, -5.949412, 0, -0.5, 0.5, 0.5,
-3.73731, -1, -5.949412, 1, -0.5, 0.5, 0.5,
-3.73731, -1, -5.949412, 1, 1.5, 0.5, 0.5,
-3.73731, -1, -5.949412, 0, 1.5, 0.5, 0.5,
-3.73731, 0, -5.949412, 0, -0.5, 0.5, 0.5,
-3.73731, 0, -5.949412, 1, -0.5, 0.5, 0.5,
-3.73731, 0, -5.949412, 1, 1.5, 0.5, 0.5,
-3.73731, 0, -5.949412, 0, 1.5, 0.5, 0.5,
-3.73731, 1, -5.949412, 0, -0.5, 0.5, 0.5,
-3.73731, 1, -5.949412, 1, -0.5, 0.5, 0.5,
-3.73731, 1, -5.949412, 1, 1.5, 0.5, 0.5,
-3.73731, 1, -5.949412, 0, 1.5, 0.5, 0.5,
-3.73731, 2, -5.949412, 0, -0.5, 0.5, 0.5,
-3.73731, 2, -5.949412, 1, -0.5, 0.5, 0.5,
-3.73731, 2, -5.949412, 1, 1.5, 0.5, 0.5,
-3.73731, 2, -5.949412, 0, 1.5, 0.5, 0.5,
-3.73731, 3, -5.949412, 0, -0.5, 0.5, 0.5,
-3.73731, 3, -5.949412, 1, -0.5, 0.5, 0.5,
-3.73731, 3, -5.949412, 1, 1.5, 0.5, 0.5,
-3.73731, 3, -5.949412, 0, 1.5, 0.5, 0.5
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
-3.247931, -2.624969, -4,
-3.247931, -2.624969, 4,
-3.247931, -2.624969, -4,
-3.411057, -2.771149, -4,
-3.247931, -2.624969, -2,
-3.411057, -2.771149, -2,
-3.247931, -2.624969, 0,
-3.411057, -2.771149, 0,
-3.247931, -2.624969, 2,
-3.411057, -2.771149, 2,
-3.247931, -2.624969, 4,
-3.411057, -2.771149, 4
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
-3.73731, -3.063511, -4, 0, -0.5, 0.5, 0.5,
-3.73731, -3.063511, -4, 1, -0.5, 0.5, 0.5,
-3.73731, -3.063511, -4, 1, 1.5, 0.5, 0.5,
-3.73731, -3.063511, -4, 0, 1.5, 0.5, 0.5,
-3.73731, -3.063511, -2, 0, -0.5, 0.5, 0.5,
-3.73731, -3.063511, -2, 1, -0.5, 0.5, 0.5,
-3.73731, -3.063511, -2, 1, 1.5, 0.5, 0.5,
-3.73731, -3.063511, -2, 0, 1.5, 0.5, 0.5,
-3.73731, -3.063511, 0, 0, -0.5, 0.5, 0.5,
-3.73731, -3.063511, 0, 1, -0.5, 0.5, 0.5,
-3.73731, -3.063511, 0, 1, 1.5, 0.5, 0.5,
-3.73731, -3.063511, 0, 0, 1.5, 0.5, 0.5,
-3.73731, -3.063511, 2, 0, -0.5, 0.5, 0.5,
-3.73731, -3.063511, 2, 1, -0.5, 0.5, 0.5,
-3.73731, -3.063511, 2, 1, 1.5, 0.5, 0.5,
-3.73731, -3.063511, 2, 0, 1.5, 0.5, 0.5,
-3.73731, -3.063511, 4, 0, -0.5, 0.5, 0.5,
-3.73731, -3.063511, 4, 1, -0.5, 0.5, 0.5,
-3.73731, -3.063511, 4, 1, 1.5, 0.5, 0.5,
-3.73731, -3.063511, 4, 0, 1.5, 0.5, 0.5
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
-3.247931, -2.624969, -5.135095,
-3.247931, 3.22226, -5.135095,
-3.247931, -2.624969, 5.722464,
-3.247931, 3.22226, 5.722464,
-3.247931, -2.624969, -5.135095,
-3.247931, -2.624969, 5.722464,
-3.247931, 3.22226, -5.135095,
-3.247931, 3.22226, 5.722464,
-3.247931, -2.624969, -5.135095,
3.27713, -2.624969, -5.135095,
-3.247931, -2.624969, 5.722464,
3.27713, -2.624969, 5.722464,
-3.247931, 3.22226, -5.135095,
3.27713, 3.22226, -5.135095,
-3.247931, 3.22226, 5.722464,
3.27713, 3.22226, 5.722464,
3.27713, -2.624969, -5.135095,
3.27713, 3.22226, -5.135095,
3.27713, -2.624969, 5.722464,
3.27713, 3.22226, 5.722464,
3.27713, -2.624969, -5.135095,
3.27713, -2.624969, 5.722464,
3.27713, 3.22226, -5.135095,
3.27713, 3.22226, 5.722464
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
var radius = 7.449997;
var distance = 33.14588;
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
mvMatrix.translate( -0.01459968, -0.2986456, -0.2936847 );
mvMatrix.scale( 1.234484, 1.37759, 0.7418871 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.14588);
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
InChI_1_C3H10NO3P_c1<-read.table("InChI_1_C3H10NO3P_c1.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1_C3H10NO3P_c1$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1_C3H10NO3P_c1' not found
```

```r
y<-InChI_1_C3H10NO3P_c1$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1_C3H10NO3P_c1' not found
```

```r
z<-InChI_1_C3H10NO3P_c1$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1_C3H10NO3P_c1' not found
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
-3.152905, 0.3967917, -0.3487962, 0, 0, 1, 1, 1,
-3.018843, -0.1519754, -2.240154, 1, 0, 0, 1, 1,
-2.669703, -0.9269265, -4.03111, 1, 0, 0, 1, 1,
-2.616136, 1.046107, -1.638879, 1, 0, 0, 1, 1,
-2.522782, 0.2174416, -1.014684, 1, 0, 0, 1, 1,
-2.433847, -1.057101, -2.093074, 1, 0, 0, 1, 1,
-2.391615, 0.5731965, -0.2262342, 0, 0, 0, 1, 1,
-2.376387, 0.6415963, -0.7632556, 0, 0, 0, 1, 1,
-2.30273, 1.195368, 0.9789492, 0, 0, 0, 1, 1,
-2.294724, -0.384768, -3.835149, 0, 0, 0, 1, 1,
-2.27164, 1.599587, -0.5837257, 0, 0, 0, 1, 1,
-2.205919, -1.403554, -2.124321, 0, 0, 0, 1, 1,
-2.190805, 1.493978, -1.687539, 0, 0, 0, 1, 1,
-2.066986, -2.206788, -2.879714, 1, 1, 1, 1, 1,
-2.04795, -0.5647048, -1.503848, 1, 1, 1, 1, 1,
-2.043487, -0.1536803, -1.08402, 1, 1, 1, 1, 1,
-2.03762, -0.8245772, -3.796835, 1, 1, 1, 1, 1,
-2.016736, 1.582098, -0.5224172, 1, 1, 1, 1, 1,
-2.010144, -0.2929948, -1.228505, 1, 1, 1, 1, 1,
-2.004538, 0.08587655, -2.072663, 1, 1, 1, 1, 1,
-1.981073, 1.791413, -2.014296, 1, 1, 1, 1, 1,
-1.947231, 0.9275396, -1.406602, 1, 1, 1, 1, 1,
-1.933412, -1.019797, -1.234594, 1, 1, 1, 1, 1,
-1.929765, -0.8127182, -0.4210882, 1, 1, 1, 1, 1,
-1.919218, -0.6587036, -1.794909, 1, 1, 1, 1, 1,
-1.915643, 0.7515523, -3.309601, 1, 1, 1, 1, 1,
-1.909149, -0.2297586, 0.05299284, 1, 1, 1, 1, 1,
-1.873949, -0.6565961, -0.900963, 1, 1, 1, 1, 1,
-1.868209, 1.348516, -1.099407, 0, 0, 1, 1, 1,
-1.859367, 0.2003377, -0.8052104, 1, 0, 0, 1, 1,
-1.84808, -0.2343206, -2.312016, 1, 0, 0, 1, 1,
-1.831572, -0.2847948, -2.982287, 1, 0, 0, 1, 1,
-1.831389, 0.6606154, -0.245273, 1, 0, 0, 1, 1,
-1.820785, -0.6313685, -1.847531, 1, 0, 0, 1, 1,
-1.81192, 0.2762635, -0.9399461, 0, 0, 0, 1, 1,
-1.786225, -0.7961435, -1.523638, 0, 0, 0, 1, 1,
-1.778194, -0.2876134, -2.850353, 0, 0, 0, 1, 1,
-1.770222, -0.3003535, -0.4856276, 0, 0, 0, 1, 1,
-1.766236, -0.870528, -4.100264, 0, 0, 0, 1, 1,
-1.758375, -0.07613236, -2.070697, 0, 0, 0, 1, 1,
-1.726047, -1.58451, -2.389436, 0, 0, 0, 1, 1,
-1.721567, 1.631981, -1.550457, 1, 1, 1, 1, 1,
-1.718111, 0.7731739, -1.421369, 1, 1, 1, 1, 1,
-1.713961, -0.3261317, -2.684854, 1, 1, 1, 1, 1,
-1.710212, -1.156028, -2.253307, 1, 1, 1, 1, 1,
-1.692913, 0.5009832, -2.110597, 1, 1, 1, 1, 1,
-1.688994, 0.329641, -2.124079, 1, 1, 1, 1, 1,
-1.681302, -1.010521, -3.138005, 1, 1, 1, 1, 1,
-1.67642, -1.130343, -1.350279, 1, 1, 1, 1, 1,
-1.674821, -0.3176316, -0.8303723, 1, 1, 1, 1, 1,
-1.664065, -1.274782, -2.15044, 1, 1, 1, 1, 1,
-1.653514, -1.328373, -2.295426, 1, 1, 1, 1, 1,
-1.643184, 0.5632614, 0.1416266, 1, 1, 1, 1, 1,
-1.628243, -0.4736241, -0.8882033, 1, 1, 1, 1, 1,
-1.618437, 0.6969842, -1.00588, 1, 1, 1, 1, 1,
-1.597982, -1.686128, -2.548283, 1, 1, 1, 1, 1,
-1.594952, -2.465019, -1.667467, 0, 0, 1, 1, 1,
-1.593517, -1.482362, -2.578651, 1, 0, 0, 1, 1,
-1.591193, 1.825774, 0.9085498, 1, 0, 0, 1, 1,
-1.590518, -1.397215, -3.403215, 1, 0, 0, 1, 1,
-1.570856, -0.1944727, -1.122097, 1, 0, 0, 1, 1,
-1.549459, -0.1634043, -1.05171, 1, 0, 0, 1, 1,
-1.545135, 2.402865, -0.9923366, 0, 0, 0, 1, 1,
-1.543968, 1.208364, 0.5623429, 0, 0, 0, 1, 1,
-1.536408, 0.2622794, -0.5891268, 0, 0, 0, 1, 1,
-1.536331, -0.0208257, 1.078783, 0, 0, 0, 1, 1,
-1.529166, -0.3926314, -1.715557, 0, 0, 0, 1, 1,
-1.523353, -0.1964782, -2.778765, 0, 0, 0, 1, 1,
-1.510417, 1.161263, -1.57159, 0, 0, 0, 1, 1,
-1.502311, 0.3931174, -3.106836, 1, 1, 1, 1, 1,
-1.493547, 1.023262, -0.575748, 1, 1, 1, 1, 1,
-1.484943, -2.174985, -2.20915, 1, 1, 1, 1, 1,
-1.453711, 1.401667, -2.80522, 1, 1, 1, 1, 1,
-1.451307, -0.2212619, -2.378979, 1, 1, 1, 1, 1,
-1.446559, -1.890075, -2.715321, 1, 1, 1, 1, 1,
-1.442382, -0.6969791, -1.379062, 1, 1, 1, 1, 1,
-1.433635, 0.7775646, -1.566344, 1, 1, 1, 1, 1,
-1.421411, -0.5803204, -1.113838, 1, 1, 1, 1, 1,
-1.417683, 0.09431559, -1.282119, 1, 1, 1, 1, 1,
-1.415971, -0.459108, -1.978682, 1, 1, 1, 1, 1,
-1.401446, 0.8511492, -1.646563, 1, 1, 1, 1, 1,
-1.388694, 0.6331958, -1.402335, 1, 1, 1, 1, 1,
-1.365958, 1.600436, -0.2296406, 1, 1, 1, 1, 1,
-1.359548, 0.7913335, -0.05718295, 1, 1, 1, 1, 1,
-1.359183, 0.121723, -0.9021206, 0, 0, 1, 1, 1,
-1.341547, -1.06334, -1.692033, 1, 0, 0, 1, 1,
-1.338196, 0.6345581, -1.288224, 1, 0, 0, 1, 1,
-1.336389, -0.3442225, -0.6665194, 1, 0, 0, 1, 1,
-1.326946, -1.205223, -1.123425, 1, 0, 0, 1, 1,
-1.322619, -0.7546271, -3.131459, 1, 0, 0, 1, 1,
-1.320447, -1.120449, -2.489463, 0, 0, 0, 1, 1,
-1.317941, -0.791187, -2.851006, 0, 0, 0, 1, 1,
-1.312427, -0.7891447, -2.361013, 0, 0, 0, 1, 1,
-1.310821, 0.3693607, -2.185883, 0, 0, 0, 1, 1,
-1.306574, -0.2134597, -2.672355, 0, 0, 0, 1, 1,
-1.300444, 0.7078871, -3.224822, 0, 0, 0, 1, 1,
-1.295597, -0.1755961, -2.024308, 0, 0, 0, 1, 1,
-1.294176, 1.119694, -1.185301, 1, 1, 1, 1, 1,
-1.28903, -2.247812, -4.483219, 1, 1, 1, 1, 1,
-1.279655, -1.322981, -1.271128, 1, 1, 1, 1, 1,
-1.265067, -1.093142, -1.090428, 1, 1, 1, 1, 1,
-1.260234, -1.516274, -1.754604, 1, 1, 1, 1, 1,
-1.255798, 1.374534, 0.3629071, 1, 1, 1, 1, 1,
-1.249008, -1.180286, -2.00086, 1, 1, 1, 1, 1,
-1.234423, 0.1137966, -3.125376, 1, 1, 1, 1, 1,
-1.230987, -2.405391, -1.838096, 1, 1, 1, 1, 1,
-1.226064, -0.709242, -4.501774, 1, 1, 1, 1, 1,
-1.22239, 0.03488615, -2.740135, 1, 1, 1, 1, 1,
-1.206073, 1.250514, -0.1743373, 1, 1, 1, 1, 1,
-1.203567, -1.262319, -2.887637, 1, 1, 1, 1, 1,
-1.194231, 0.01077409, -3.469177, 1, 1, 1, 1, 1,
-1.193034, -0.7701471, -1.253517, 1, 1, 1, 1, 1,
-1.192831, 1.220989, -0.6659594, 0, 0, 1, 1, 1,
-1.180794, 0.6825384, -0.8281481, 1, 0, 0, 1, 1,
-1.177822, -0.6319646, -1.813754, 1, 0, 0, 1, 1,
-1.174395, 0.8375992, -2.044615, 1, 0, 0, 1, 1,
-1.172587, 2.088944, 0.9443969, 1, 0, 0, 1, 1,
-1.171002, 0.1742231, -1.858362, 1, 0, 0, 1, 1,
-1.17074, -1.048008, -1.244045, 0, 0, 0, 1, 1,
-1.167225, -1.697715, -2.523688, 0, 0, 0, 1, 1,
-1.167086, -2.199896, -3.318316, 0, 0, 0, 1, 1,
-1.16533, 0.8429471, 0.4672383, 0, 0, 0, 1, 1,
-1.162017, 0.7997828, -1.502731, 0, 0, 0, 1, 1,
-1.148165, 1.579048, -0.04628938, 0, 0, 0, 1, 1,
-1.146374, -0.8707304, -2.491426, 0, 0, 0, 1, 1,
-1.143699, 0.3617095, -0.6602226, 1, 1, 1, 1, 1,
-1.141472, -0.4418449, -1.749719, 1, 1, 1, 1, 1,
-1.137103, 0.5259082, -2.225872, 1, 1, 1, 1, 1,
-1.136809, -0.6964322, -1.647369, 1, 1, 1, 1, 1,
-1.136043, 0.9921397, -0.008577949, 1, 1, 1, 1, 1,
-1.135419, -1.317874, -2.387783, 1, 1, 1, 1, 1,
-1.1332, 0.6850893, 0.7871017, 1, 1, 1, 1, 1,
-1.132231, -0.08684696, -3.617333, 1, 1, 1, 1, 1,
-1.120662, 0.617154, -2.049498, 1, 1, 1, 1, 1,
-1.119448, -0.7856684, -3.135812, 1, 1, 1, 1, 1,
-1.118828, -0.9443189, -0.1925142, 1, 1, 1, 1, 1,
-1.115309, -0.08786866, 0.5933707, 1, 1, 1, 1, 1,
-1.111415, 0.269507, -1.259496, 1, 1, 1, 1, 1,
-1.110002, -0.44374, -1.504812, 1, 1, 1, 1, 1,
-1.104077, 0.5896741, -0.3433075, 1, 1, 1, 1, 1,
-1.103003, -0.2958373, -1.535382, 0, 0, 1, 1, 1,
-1.087332, -0.681472, -2.524802, 1, 0, 0, 1, 1,
-1.084077, 1.50693, -1.055401, 1, 0, 0, 1, 1,
-1.081359, 0.3629119, -1.321504, 1, 0, 0, 1, 1,
-1.079553, 0.693097, -1.160564, 1, 0, 0, 1, 1,
-1.078387, 0.1460068, -1.165557, 1, 0, 0, 1, 1,
-1.075615, 1.26237, 0.1317311, 0, 0, 0, 1, 1,
-1.07269, 0.3897038, -1.520571, 0, 0, 0, 1, 1,
-1.059574, -0.5558127, -2.036018, 0, 0, 0, 1, 1,
-1.056372, -1.353485, -3.459473, 0, 0, 0, 1, 1,
-1.054168, 0.5548493, -0.910432, 0, 0, 0, 1, 1,
-1.051833, 0.5352164, -2.196735, 0, 0, 0, 1, 1,
-1.050974, 0.8364869, -0.7953089, 0, 0, 0, 1, 1,
-1.040671, 1.228252, -3.215763, 1, 1, 1, 1, 1,
-1.038147, 0.2739924, -0.6944621, 1, 1, 1, 1, 1,
-1.037822, -0.3496636, -1.49111, 1, 1, 1, 1, 1,
-1.031452, -0.355369, -2.526515, 1, 1, 1, 1, 1,
-1.021363, 2.932076, -0.8981372, 1, 1, 1, 1, 1,
-1.00881, 1.592524, 0.7464545, 1, 1, 1, 1, 1,
-0.9998463, 0.5096136, -2.799768, 1, 1, 1, 1, 1,
-0.991685, 1.085015, 0.05470103, 1, 1, 1, 1, 1,
-0.9870206, -0.3115842, -3.140465, 1, 1, 1, 1, 1,
-0.979688, -0.3773856, -1.765349, 1, 1, 1, 1, 1,
-0.9784135, -0.05980883, -0.5362846, 1, 1, 1, 1, 1,
-0.9778289, 0.7178091, -1.415989, 1, 1, 1, 1, 1,
-0.9750222, 1.47065, 1.566083, 1, 1, 1, 1, 1,
-0.9750034, -2.151578, -2.643267, 1, 1, 1, 1, 1,
-0.9699095, -0.1352024, -1.976244, 1, 1, 1, 1, 1,
-0.9647626, 0.5301697, -0.9729713, 0, 0, 1, 1, 1,
-0.9478058, -0.4815522, 0.15637, 1, 0, 0, 1, 1,
-0.9428424, -1.240615, -2.836776, 1, 0, 0, 1, 1,
-0.940852, -0.7678257, -2.457776, 1, 0, 0, 1, 1,
-0.9348672, 0.6923457, -2.524409, 1, 0, 0, 1, 1,
-0.9345614, 0.5733986, -0.9241614, 1, 0, 0, 1, 1,
-0.9340206, 0.1176247, -3.054803, 0, 0, 0, 1, 1,
-0.925526, 0.2844473, -1.639178, 0, 0, 0, 1, 1,
-0.9248606, -0.1388277, -3.154565, 0, 0, 0, 1, 1,
-0.9190146, -0.5662833, -2.55645, 0, 0, 0, 1, 1,
-0.9163942, -0.7326771, -1.960269, 0, 0, 0, 1, 1,
-0.915656, 0.09579892, -2.122438, 0, 0, 0, 1, 1,
-0.9139757, 1.145332, 0.5065147, 0, 0, 0, 1, 1,
-0.9127537, -0.3552195, -1.218144, 1, 1, 1, 1, 1,
-0.9119823, -0.992753, -2.369413, 1, 1, 1, 1, 1,
-0.9084005, 0.9118336, 0.04965351, 1, 1, 1, 1, 1,
-0.9045117, 0.5737209, -0.3866368, 1, 1, 1, 1, 1,
-0.9031037, 2.056131, 0.2026515, 1, 1, 1, 1, 1,
-0.8996004, -0.8604665, -1.293058, 1, 1, 1, 1, 1,
-0.8964422, 0.2660042, -0.09940159, 1, 1, 1, 1, 1,
-0.8959409, -0.02796311, -1.805262, 1, 1, 1, 1, 1,
-0.8921403, -0.7997129, -3.613849, 1, 1, 1, 1, 1,
-0.8920358, -0.2041931, -2.133377, 1, 1, 1, 1, 1,
-0.8919406, -0.7770517, -2.483689, 1, 1, 1, 1, 1,
-0.8893828, -0.1872172, -2.178311, 1, 1, 1, 1, 1,
-0.8870012, 0.062681, -0.724718, 1, 1, 1, 1, 1,
-0.8854302, -0.3439811, -2.936076, 1, 1, 1, 1, 1,
-0.8825403, -0.1735317, -1.067029, 1, 1, 1, 1, 1,
-0.8764882, 0.3649217, 0.2525866, 0, 0, 1, 1, 1,
-0.8762894, 0.05143302, -1.523366, 1, 0, 0, 1, 1,
-0.8758318, -0.2482554, -1.493418, 1, 0, 0, 1, 1,
-0.8753067, -0.8790014, -1.427504, 1, 0, 0, 1, 1,
-0.8751413, -1.858832, -1.646068, 1, 0, 0, 1, 1,
-0.8689245, 1.563405, -2.682658, 1, 0, 0, 1, 1,
-0.8652613, -1.227791, -3.131861, 0, 0, 0, 1, 1,
-0.862532, -0.9535324, -2.883504, 0, 0, 0, 1, 1,
-0.8590495, 0.009013765, -1.070879, 0, 0, 0, 1, 1,
-0.8514081, 0.1539969, -2.104929, 0, 0, 0, 1, 1,
-0.845699, 0.1947849, -0.2592658, 0, 0, 0, 1, 1,
-0.84519, -0.3631272, 0.08447277, 0, 0, 0, 1, 1,
-0.8371775, -0.08158166, -0.6356229, 0, 0, 0, 1, 1,
-0.835834, -0.3551872, -3.223666, 1, 1, 1, 1, 1,
-0.8304868, 1.837885, -1.930071, 1, 1, 1, 1, 1,
-0.8283224, -0.9867031, -2.872151, 1, 1, 1, 1, 1,
-0.8268753, -1.148765, -2.886913, 1, 1, 1, 1, 1,
-0.8262599, -0.4151514, -2.157419, 1, 1, 1, 1, 1,
-0.8230632, 0.9602932, 0.8450093, 1, 1, 1, 1, 1,
-0.8083308, -1.325546, -3.518611, 1, 1, 1, 1, 1,
-0.8081136, 0.6100745, -2.477723, 1, 1, 1, 1, 1,
-0.8075683, 0.3466816, -2.21988, 1, 1, 1, 1, 1,
-0.806557, 0.1051258, -1.370393, 1, 1, 1, 1, 1,
-0.7990268, -0.8209913, -0.4722176, 1, 1, 1, 1, 1,
-0.7964824, 1.447463, -0.007996162, 1, 1, 1, 1, 1,
-0.7897384, 0.03371825, -0.5776675, 1, 1, 1, 1, 1,
-0.7812608, -1.671988, -4.694861, 1, 1, 1, 1, 1,
-0.7795961, 0.7142273, -1.646361, 1, 1, 1, 1, 1,
-0.7682735, -1.722728, -3.005287, 0, 0, 1, 1, 1,
-0.7627205, -0.516717, -1.453233, 1, 0, 0, 1, 1,
-0.7601486, 0.7129122, -1.215293, 1, 0, 0, 1, 1,
-0.7558309, -1.277565, -3.653592, 1, 0, 0, 1, 1,
-0.7534313, -0.5174087, -0.6258547, 1, 0, 0, 1, 1,
-0.7510553, 1.298288, -0.0640716, 1, 0, 0, 1, 1,
-0.7370376, -1.173579, -1.76619, 0, 0, 0, 1, 1,
-0.7367275, 0.6842176, -1.228317, 0, 0, 0, 1, 1,
-0.73611, 2.013179, -2.671884, 0, 0, 0, 1, 1,
-0.7325388, 1.397396, 0.2689622, 0, 0, 0, 1, 1,
-0.7320443, -0.6100658, -0.2340014, 0, 0, 0, 1, 1,
-0.7296619, -0.1708536, -2.548182, 0, 0, 0, 1, 1,
-0.7277596, -1.317046, -3.72002, 0, 0, 0, 1, 1,
-0.7269677, -0.121515, -2.848284, 1, 1, 1, 1, 1,
-0.7236136, -1.995331, -3.967108, 1, 1, 1, 1, 1,
-0.7179926, -1.764824, -3.108328, 1, 1, 1, 1, 1,
-0.7162616, 0.6340122, 0.4289477, 1, 1, 1, 1, 1,
-0.7139745, 0.248233, -1.218238, 1, 1, 1, 1, 1,
-0.7100875, 0.8761309, -0.4557636, 1, 1, 1, 1, 1,
-0.7062122, -0.8394034, -1.341914, 1, 1, 1, 1, 1,
-0.702655, -0.0563432, -1.246649, 1, 1, 1, 1, 1,
-0.6975412, 0.1298322, -1.395288, 1, 1, 1, 1, 1,
-0.6963448, 0.6940981, -0.4451976, 1, 1, 1, 1, 1,
-0.6938025, -0.03426182, 0.1143286, 1, 1, 1, 1, 1,
-0.6904888, 0.05714877, -1.779301, 1, 1, 1, 1, 1,
-0.6835726, -0.6489864, -2.670832, 1, 1, 1, 1, 1,
-0.6826775, 1.374075, -0.05196595, 1, 1, 1, 1, 1,
-0.6823439, 0.03477707, -2.28377, 1, 1, 1, 1, 1,
-0.6798424, 0.6099014, -1.290326, 0, 0, 1, 1, 1,
-0.6793976, 0.002518345, 0.1407932, 1, 0, 0, 1, 1,
-0.6791173, 1.632817, 2.388384, 1, 0, 0, 1, 1,
-0.6782306, 0.5548052, -1.457621, 1, 0, 0, 1, 1,
-0.6682371, 1.749902, -0.1612724, 1, 0, 0, 1, 1,
-0.6660656, -1.726393, -3.857209, 1, 0, 0, 1, 1,
-0.665947, 0.4193467, -0.8174154, 0, 0, 0, 1, 1,
-0.6628499, 0.6706301, 0.2942272, 0, 0, 0, 1, 1,
-0.6594452, 1.671047, -0.5742449, 0, 0, 0, 1, 1,
-0.6570262, 0.6304137, -0.7020527, 0, 0, 0, 1, 1,
-0.6504856, 0.2213981, -0.7763864, 0, 0, 0, 1, 1,
-0.6480024, 1.16725, -0.4095457, 0, 0, 0, 1, 1,
-0.6472248, 0.188869, -1.401638, 0, 0, 0, 1, 1,
-0.6459113, 1.721085, 0.2242926, 1, 1, 1, 1, 1,
-0.641655, -0.6358738, -3.093854, 1, 1, 1, 1, 1,
-0.6307893, 0.3540746, -1.226928, 1, 1, 1, 1, 1,
-0.6305999, -1.44171, -2.303756, 1, 1, 1, 1, 1,
-0.6300552, -0.1219199, -1.469209, 1, 1, 1, 1, 1,
-0.6280459, -0.07352843, -3.049834, 1, 1, 1, 1, 1,
-0.6277275, 0.2602181, -0.4647242, 1, 1, 1, 1, 1,
-0.6267698, 0.4420658, -1.050797, 1, 1, 1, 1, 1,
-0.6260399, 2.238461, -0.3823172, 1, 1, 1, 1, 1,
-0.6233743, 0.7837815, -0.04437223, 1, 1, 1, 1, 1,
-0.6186951, -0.3699104, -1.056259, 1, 1, 1, 1, 1,
-0.6185327, 0.6912143, -0.4896583, 1, 1, 1, 1, 1,
-0.6132756, 1.669375, -2.804653, 1, 1, 1, 1, 1,
-0.612318, 1.916085, -0.5596899, 1, 1, 1, 1, 1,
-0.6081185, -0.5310882, -3.547529, 1, 1, 1, 1, 1,
-0.6056316, -0.6740891, -4.976975, 0, 0, 1, 1, 1,
-0.5978104, 1.155897, 0.8827315, 1, 0, 0, 1, 1,
-0.5936187, -0.1661733, -1.675669, 1, 0, 0, 1, 1,
-0.5919926, -1.699629, -4.765266, 1, 0, 0, 1, 1,
-0.5916585, -0.493748, -2.030156, 1, 0, 0, 1, 1,
-0.5916157, -0.5470524, -3.657077, 1, 0, 0, 1, 1,
-0.5899262, 2.003766, 0.1133884, 0, 0, 0, 1, 1,
-0.5888456, 0.4805965, -1.297971, 0, 0, 0, 1, 1,
-0.5873661, 0.1846242, 0.4481021, 0, 0, 0, 1, 1,
-0.5807536, 0.57195, -1.512474, 0, 0, 0, 1, 1,
-0.5785015, -0.2570319, -2.808663, 0, 0, 0, 1, 1,
-0.573137, -0.6754711, -1.275148, 0, 0, 0, 1, 1,
-0.5708647, -0.6543207, -0.7585462, 0, 0, 0, 1, 1,
-0.5678557, 0.2502074, -0.8706186, 1, 1, 1, 1, 1,
-0.5672985, 1.128605, -0.3716482, 1, 1, 1, 1, 1,
-0.5623046, -1.536935, -2.706294, 1, 1, 1, 1, 1,
-0.5576428, 2.126827, -0.0158446, 1, 1, 1, 1, 1,
-0.5540687, -1.412567, -4.162513, 1, 1, 1, 1, 1,
-0.5522681, 0.95866, 1.794557, 1, 1, 1, 1, 1,
-0.5511304, -0.03848984, -1.633062, 1, 1, 1, 1, 1,
-0.5506403, -0.1870263, -2.00076, 1, 1, 1, 1, 1,
-0.5485712, 0.9994315, 0.3952398, 1, 1, 1, 1, 1,
-0.5477044, 1.639243, -0.8464383, 1, 1, 1, 1, 1,
-0.5474815, 0.9431503, -1.312859, 1, 1, 1, 1, 1,
-0.5389869, 0.6019836, -1.064749, 1, 1, 1, 1, 1,
-0.536545, -1.983711, -3.411738, 1, 1, 1, 1, 1,
-0.5325662, -1.149134, -4.781358, 1, 1, 1, 1, 1,
-0.5311596, 0.301691, -1.409033, 1, 1, 1, 1, 1,
-0.5310501, -1.021734, -2.436079, 0, 0, 1, 1, 1,
-0.529827, 0.6605064, -0.4659307, 1, 0, 0, 1, 1,
-0.5195025, 0.5772343, -1.860948, 1, 0, 0, 1, 1,
-0.518304, -0.9638875, -3.553418, 1, 0, 0, 1, 1,
-0.5178558, -0.5542936, -2.306587, 1, 0, 0, 1, 1,
-0.5134749, 0.6389406, -1.027165, 1, 0, 0, 1, 1,
-0.5119949, -0.5727037, -1.703368, 0, 0, 0, 1, 1,
-0.507042, -0.388073, -0.7013011, 0, 0, 0, 1, 1,
-0.5061215, 0.5589449, -0.4889613, 0, 0, 0, 1, 1,
-0.5035557, -0.47506, -2.213165, 0, 0, 0, 1, 1,
-0.4968812, -0.9415712, -4.747732, 0, 0, 0, 1, 1,
-0.4929253, -0.09677073, -1.688837, 0, 0, 0, 1, 1,
-0.4920292, 0.9120219, -0.731318, 0, 0, 0, 1, 1,
-0.4910541, -0.5264644, -3.643095, 1, 1, 1, 1, 1,
-0.4841993, -0.6249301, -0.065424, 1, 1, 1, 1, 1,
-0.4831465, 0.7714849, 0.4432704, 1, 1, 1, 1, 1,
-0.4829877, 1.414086, -0.2096588, 1, 1, 1, 1, 1,
-0.4816476, 1.537072, 0.4344186, 1, 1, 1, 1, 1,
-0.4775392, 0.3329133, -1.877093, 1, 1, 1, 1, 1,
-0.474028, -0.6558658, -3.042534, 1, 1, 1, 1, 1,
-0.4730837, 1.363341, 1.311264, 1, 1, 1, 1, 1,
-0.4711804, 0.7034796, 0.0464468, 1, 1, 1, 1, 1,
-0.4711231, 0.2851031, -1.473632, 1, 1, 1, 1, 1,
-0.4707576, 0.1714159, -2.765863, 1, 1, 1, 1, 1,
-0.4616644, 1.239193, -0.05737233, 1, 1, 1, 1, 1,
-0.4610054, -1.47816, -2.60073, 1, 1, 1, 1, 1,
-0.459893, 1.127863, -0.6273702, 1, 1, 1, 1, 1,
-0.4570532, 1.715427, -1.105841, 1, 1, 1, 1, 1,
-0.4550843, 1.314439, -0.8967961, 0, 0, 1, 1, 1,
-0.4501876, -0.4647372, -3.334794, 1, 0, 0, 1, 1,
-0.4492221, -0.1706019, -1.342726, 1, 0, 0, 1, 1,
-0.4431792, 0.1335834, -0.6923456, 1, 0, 0, 1, 1,
-0.4406423, 0.8063091, -0.6802493, 1, 0, 0, 1, 1,
-0.4400692, 2.417313, 1.002242, 1, 0, 0, 1, 1,
-0.4340716, 0.3769432, 1.303399, 0, 0, 0, 1, 1,
-0.4313732, -0.5978984, -2.337283, 0, 0, 0, 1, 1,
-0.4306413, -1.008858, -1.573274, 0, 0, 0, 1, 1,
-0.428068, -0.3079037, -1.858069, 0, 0, 0, 1, 1,
-0.4233625, 0.7888934, -1.364595, 0, 0, 0, 1, 1,
-0.4221106, 1.756869, -0.2932979, 0, 0, 0, 1, 1,
-0.4188351, 0.7041067, -0.6461909, 0, 0, 0, 1, 1,
-0.4184452, -0.9530001, -3.259911, 1, 1, 1, 1, 1,
-0.417958, -2.379747, -1.818616, 1, 1, 1, 1, 1,
-0.4169956, -0.6404347, -2.475237, 1, 1, 1, 1, 1,
-0.415823, 0.3645277, -0.02781026, 1, 1, 1, 1, 1,
-0.4112673, 1.353898, 0.5140212, 1, 1, 1, 1, 1,
-0.4105377, -0.5197287, -3.163872, 1, 1, 1, 1, 1,
-0.4085417, 0.9719239, -0.9256766, 1, 1, 1, 1, 1,
-0.406445, 1.746671, 1.029817, 1, 1, 1, 1, 1,
-0.4048487, 0.7391667, 2.062087, 1, 1, 1, 1, 1,
-0.4008541, 0.01268376, -1.983773, 1, 1, 1, 1, 1,
-0.3958108, 0.8063112, -0.3517147, 1, 1, 1, 1, 1,
-0.3947224, 0.6166301, 0.6755533, 1, 1, 1, 1, 1,
-0.3928497, 1.325544, -0.6467385, 1, 1, 1, 1, 1,
-0.3904347, 0.2968069, -1.750045, 1, 1, 1, 1, 1,
-0.3900011, 1.702866, 0.4762177, 1, 1, 1, 1, 1,
-0.379941, 0.4188284, 0.08896182, 0, 0, 1, 1, 1,
-0.3793285, 1.327512, -0.04715803, 1, 0, 0, 1, 1,
-0.3723714, 2.323178, 2.042186, 1, 0, 0, 1, 1,
-0.3710664, -0.8935984, -1.977579, 1, 0, 0, 1, 1,
-0.3696859, 0.2748173, -0.4514481, 1, 0, 0, 1, 1,
-0.3622868, 1.181698, 0.03724907, 1, 0, 0, 1, 1,
-0.3594594, -1.7623, -1.737771, 0, 0, 0, 1, 1,
-0.3530091, 0.1350358, 0.0007973401, 0, 0, 0, 1, 1,
-0.3485577, -0.5693629, -0.3530121, 0, 0, 0, 1, 1,
-0.3453077, -0.11424, -3.199927, 0, 0, 0, 1, 1,
-0.3372166, 0.8201842, -0.615912, 0, 0, 0, 1, 1,
-0.3348654, -0.7477144, -2.364236, 0, 0, 0, 1, 1,
-0.3345884, 0.00231736, -1.897368, 0, 0, 0, 1, 1,
-0.3340569, 0.5874715, -0.001714016, 1, 1, 1, 1, 1,
-0.333801, 1.356941, -0.1246278, 1, 1, 1, 1, 1,
-0.330958, -1.148313, -3.444501, 1, 1, 1, 1, 1,
-0.3287313, 0.4287522, -3.30326, 1, 1, 1, 1, 1,
-0.3095562, -0.5075397, -2.332566, 1, 1, 1, 1, 1,
-0.3027359, -1.64003, -4.043875, 1, 1, 1, 1, 1,
-0.3017041, 0.9286954, 1.319003, 1, 1, 1, 1, 1,
-0.3010372, 1.537316, 0.003620909, 1, 1, 1, 1, 1,
-0.3004276, 0.1415317, -1.76924, 1, 1, 1, 1, 1,
-0.2998842, -0.3741715, -1.70398, 1, 1, 1, 1, 1,
-0.2962935, 0.6561645, 1.995277, 1, 1, 1, 1, 1,
-0.2957639, -0.4322222, -2.420515, 1, 1, 1, 1, 1,
-0.2945064, 0.2622007, -1.638436, 1, 1, 1, 1, 1,
-0.2824131, 1.230897, -0.7153035, 1, 1, 1, 1, 1,
-0.2782724, -1.1078, -1.807623, 1, 1, 1, 1, 1,
-0.2772608, 0.1004067, -1.367409, 0, 0, 1, 1, 1,
-0.2759145, 1.170087, -0.1105675, 1, 0, 0, 1, 1,
-0.2693217, -1.06644, -3.47246, 1, 0, 0, 1, 1,
-0.2691021, 0.007554349, 0.7741958, 1, 0, 0, 1, 1,
-0.2681977, 0.4809684, -1.747162, 1, 0, 0, 1, 1,
-0.2669216, -0.6763356, -1.303977, 1, 0, 0, 1, 1,
-0.2654074, -1.017228, -2.101342, 0, 0, 0, 1, 1,
-0.2632194, -1.520327, -2.424961, 0, 0, 0, 1, 1,
-0.2631674, -0.8267866, -2.770154, 0, 0, 0, 1, 1,
-0.2624315, 1.111184, -1.313569, 0, 0, 0, 1, 1,
-0.2578, -0.6132149, -1.94207, 0, 0, 0, 1, 1,
-0.2567581, 0.8549687, 0.3913535, 0, 0, 0, 1, 1,
-0.2562006, -0.4939323, -2.950396, 0, 0, 0, 1, 1,
-0.2536392, -2.443352, -2.113989, 1, 1, 1, 1, 1,
-0.2504116, 0.1111135, 0.2748461, 1, 1, 1, 1, 1,
-0.2474128, 0.2033951, -1.286276, 1, 1, 1, 1, 1,
-0.2465212, -0.2104222, -3.596485, 1, 1, 1, 1, 1,
-0.2455839, 0.6550564, -0.4768, 1, 1, 1, 1, 1,
-0.2415234, -0.2622667, -1.515224, 1, 1, 1, 1, 1,
-0.2409964, -0.6865481, -2.470001, 1, 1, 1, 1, 1,
-0.2406506, 0.2147184, -1.156413, 1, 1, 1, 1, 1,
-0.2381375, 0.8512257, -1.214112, 1, 1, 1, 1, 1,
-0.2333564, -0.3130862, -2.462171, 1, 1, 1, 1, 1,
-0.2294592, 0.08391213, -1.998559, 1, 1, 1, 1, 1,
-0.2256581, 0.45636, 0.4091785, 1, 1, 1, 1, 1,
-0.2236502, 1.691555, -0.5673738, 1, 1, 1, 1, 1,
-0.2228932, -0.6347619, -3.525524, 1, 1, 1, 1, 1,
-0.2224246, -1.730586, -2.318099, 1, 1, 1, 1, 1,
-0.2213281, 1.832678, 3.131215, 0, 0, 1, 1, 1,
-0.218406, 0.6063193, -1.515273, 1, 0, 0, 1, 1,
-0.2173797, -0.3847401, -2.174397, 1, 0, 0, 1, 1,
-0.2160384, -0.6349742, -2.698294, 1, 0, 0, 1, 1,
-0.2152255, 1.1523, -0.1170036, 1, 0, 0, 1, 1,
-0.2151179, -0.4700035, -1.181991, 1, 0, 0, 1, 1,
-0.2147957, 0.1573778, -2.252764, 0, 0, 0, 1, 1,
-0.213394, -0.9792868, -3.228968, 0, 0, 0, 1, 1,
-0.2133548, 0.09366851, -1.735949, 0, 0, 0, 1, 1,
-0.2060869, -0.2128905, -1.787022, 0, 0, 0, 1, 1,
-0.2051126, -0.07697702, -0.925881, 0, 0, 0, 1, 1,
-0.2037247, -0.8633822, -3.677003, 0, 0, 0, 1, 1,
-0.2028612, -0.0349644, -1.555929, 0, 0, 0, 1, 1,
-0.2007039, 1.018311, 1.244516, 1, 1, 1, 1, 1,
-0.2004902, 0.6069009, -0.429967, 1, 1, 1, 1, 1,
-0.2004458, 0.4751866, -0.390392, 1, 1, 1, 1, 1,
-0.1991462, -1.488248, -3.213408, 1, 1, 1, 1, 1,
-0.1978237, -1.922947, -1.425841, 1, 1, 1, 1, 1,
-0.196144, -1.162965, -3.575149, 1, 1, 1, 1, 1,
-0.1955218, -0.6127866, -1.39047, 1, 1, 1, 1, 1,
-0.1915971, -1.168587, -2.591033, 1, 1, 1, 1, 1,
-0.1903504, -2.539815, -3.913946, 1, 1, 1, 1, 1,
-0.1889495, 0.6727549, 0.5198408, 1, 1, 1, 1, 1,
-0.1858171, 0.6645368, 0.39072, 1, 1, 1, 1, 1,
-0.1829914, -0.6176378, -2.617544, 1, 1, 1, 1, 1,
-0.1808376, 0.449549, 0.437112, 1, 1, 1, 1, 1,
-0.178858, 0.9004707, -0.2557693, 1, 1, 1, 1, 1,
-0.1768089, 1.922776, -0.3412851, 1, 1, 1, 1, 1,
-0.1744939, 0.1902388, 0.3884437, 0, 0, 1, 1, 1,
-0.1702427, -0.1377025, -1.942704, 1, 0, 0, 1, 1,
-0.1683523, 1.318892, -1.95494, 1, 0, 0, 1, 1,
-0.1682868, 0.4185996, -0.4457947, 1, 0, 0, 1, 1,
-0.1654141, -0.5730289, -3.030704, 1, 0, 0, 1, 1,
-0.1652297, -0.04777647, -0.2848833, 1, 0, 0, 1, 1,
-0.1638058, 2.117165, -0.4503358, 0, 0, 0, 1, 1,
-0.158721, -0.2575959, -1.334109, 0, 0, 0, 1, 1,
-0.1551908, 1.029074, -0.9279881, 0, 0, 0, 1, 1,
-0.1500511, -1.132644, -4.97552, 0, 0, 0, 1, 1,
-0.1469317, 0.2244731, -0.8174611, 0, 0, 0, 1, 1,
-0.1427313, -2.095958, -1.367466, 0, 0, 0, 1, 1,
-0.1417974, -0.1916388, -4.55303, 0, 0, 0, 1, 1,
-0.1380726, 0.5035594, -0.9977521, 1, 1, 1, 1, 1,
-0.1322548, 1.12757, 0.1045023, 1, 1, 1, 1, 1,
-0.1284321, -0.2289562, -2.258894, 1, 1, 1, 1, 1,
-0.1267495, 2.02157, -1.314512, 1, 1, 1, 1, 1,
-0.1240428, 0.2461842, 0.1918426, 1, 1, 1, 1, 1,
-0.1229179, -1.170339, -1.887184, 1, 1, 1, 1, 1,
-0.1202511, -1.475652, -1.81145, 1, 1, 1, 1, 1,
-0.1165434, 0.8046823, 0.2415507, 1, 1, 1, 1, 1,
-0.1155426, 1.995346, 0.9065899, 1, 1, 1, 1, 1,
-0.1150431, -1.809638, -3.59772, 1, 1, 1, 1, 1,
-0.1115019, 1.009582, -0.7782432, 1, 1, 1, 1, 1,
-0.105003, 1.171994, 2.119833, 1, 1, 1, 1, 1,
-0.1042253, 1.428161, 0.3072007, 1, 1, 1, 1, 1,
-0.1028314, -1.129918, -3.000877, 1, 1, 1, 1, 1,
-0.09608556, 1.199579, -1.387201, 1, 1, 1, 1, 1,
-0.09250715, -0.109175, -2.141527, 0, 0, 1, 1, 1,
-0.08882763, 0.4008415, 0.2550912, 1, 0, 0, 1, 1,
-0.08763642, 0.327868, 0.09651292, 1, 0, 0, 1, 1,
-0.08750314, -0.8627297, -2.373724, 1, 0, 0, 1, 1,
-0.08744846, 1.394549, -0.06329037, 1, 0, 0, 1, 1,
-0.08575855, -2.33993, -1.310664, 1, 0, 0, 1, 1,
-0.08501767, -0.7753376, -2.444116, 0, 0, 0, 1, 1,
-0.08026434, 1.072049, 0.7798182, 0, 0, 0, 1, 1,
-0.07703865, -1.083014, -3.347624, 0, 0, 0, 1, 1,
-0.0736017, -0.004546632, -3.193804, 0, 0, 0, 1, 1,
-0.07352819, 0.784894, 1.483649, 0, 0, 0, 1, 1,
-0.07226516, 0.618827, 0.3375553, 0, 0, 0, 1, 1,
-0.0718378, -0.9554344, -0.0993086, 0, 0, 0, 1, 1,
-0.07111141, 1.464824, -0.9432501, 1, 1, 1, 1, 1,
-0.06994679, 0.4403163, -2.046676, 1, 1, 1, 1, 1,
-0.06877079, -1.210315, -1.961891, 1, 1, 1, 1, 1,
-0.06714618, -0.638263, -2.291517, 1, 1, 1, 1, 1,
-0.05998279, -0.9397348, -1.216946, 1, 1, 1, 1, 1,
-0.05874849, -1.842541, -2.614163, 1, 1, 1, 1, 1,
-0.0539112, -0.03339783, -3.700245, 1, 1, 1, 1, 1,
-0.04877926, 0.1766607, -0.8768384, 1, 1, 1, 1, 1,
-0.04589173, -0.7552805, -2.014541, 1, 1, 1, 1, 1,
-0.04524053, -1.15394, -2.811115, 1, 1, 1, 1, 1,
-0.04432976, -0.05119438, -3.108338, 1, 1, 1, 1, 1,
-0.04130859, -0.1578661, -1.771464, 1, 1, 1, 1, 1,
-0.03533344, 0.4705718, -1.041871, 1, 1, 1, 1, 1,
-0.03145441, -0.1636929, -3.239269, 1, 1, 1, 1, 1,
-0.03132058, 0.3225586, -0.7264069, 1, 1, 1, 1, 1,
-0.02794868, -0.2112011, -1.906859, 0, 0, 1, 1, 1,
-0.02024896, -0.5737615, -4.79794, 1, 0, 0, 1, 1,
-0.01239089, -0.9379018, -1.640072, 1, 0, 0, 1, 1,
-0.01135196, -1.307337, -1.328871, 1, 0, 0, 1, 1,
-0.01123682, -0.01155105, -2.239676, 1, 0, 0, 1, 1,
-0.01004797, 0.2954463, -1.077911, 1, 0, 0, 1, 1,
-0.005181263, -0.0842494, -2.614927, 0, 0, 0, 1, 1,
-0.004089902, 0.06042376, 0.8655801, 0, 0, 0, 1, 1,
-0.003067743, 0.4408721, 0.5775445, 0, 0, 0, 1, 1,
-0.0006244748, 0.5556474, 1.354397, 0, 0, 0, 1, 1,
-0.0002700401, -1.684123, -1.803228, 0, 0, 0, 1, 1,
-0.0002024043, 0.3176452, -0.006729787, 0, 0, 0, 1, 1,
-3.849767e-05, 0.1622638, -0.9662604, 0, 0, 0, 1, 1,
0.0004367088, 0.1055181, -0.3880944, 1, 1, 1, 1, 1,
0.0004622516, -0.032518, 3.117784, 1, 1, 1, 1, 1,
0.0005191445, -0.7749047, 4.151865, 1, 1, 1, 1, 1,
0.002094009, 1.095997, 0.2772438, 1, 1, 1, 1, 1,
0.004694359, 0.2378325, -0.8610739, 1, 1, 1, 1, 1,
0.01206878, 0.9439472, -1.59933, 1, 1, 1, 1, 1,
0.0125437, 0.6072366, 1.167516, 1, 1, 1, 1, 1,
0.01308505, -0.9171502, 3.711067, 1, 1, 1, 1, 1,
0.01402316, -0.1999119, 3.902936, 1, 1, 1, 1, 1,
0.01584186, -1.615204, 4.052915, 1, 1, 1, 1, 1,
0.01811607, 1.202938, 0.2803728, 1, 1, 1, 1, 1,
0.02171675, -1.04523, 1.765154, 1, 1, 1, 1, 1,
0.02249951, 1.044254, -1.229709, 1, 1, 1, 1, 1,
0.02360501, -0.5559998, 2.068279, 1, 1, 1, 1, 1,
0.02459328, -0.4991977, 2.349696, 1, 1, 1, 1, 1,
0.02727483, -0.121923, 4.88515, 0, 0, 1, 1, 1,
0.02911196, -0.7406054, 2.949779, 1, 0, 0, 1, 1,
0.02985875, -2.047136, 4.186479, 1, 0, 0, 1, 1,
0.03084839, -0.3237557, 3.866795, 1, 0, 0, 1, 1,
0.03288881, 1.253264, -1.355346, 1, 0, 0, 1, 1,
0.03353231, 0.617893, -0.2628464, 1, 0, 0, 1, 1,
0.03787605, -0.4266845, 4.335983, 0, 0, 0, 1, 1,
0.03967139, 0.5179759, 1.204947, 0, 0, 0, 1, 1,
0.04251049, -1.009372, 2.92567, 0, 0, 0, 1, 1,
0.04263816, -0.4210842, 3.879663, 0, 0, 0, 1, 1,
0.05146676, 0.6932591, -0.05227345, 0, 0, 0, 1, 1,
0.05437602, -0.1766321, 2.6502, 0, 0, 0, 1, 1,
0.05778575, -0.4249129, 2.113717, 0, 0, 0, 1, 1,
0.05808326, 1.315725, -0.7355219, 1, 1, 1, 1, 1,
0.05940605, 1.293487, -0.2133676, 1, 1, 1, 1, 1,
0.05959212, -0.1060463, 3.408916, 1, 1, 1, 1, 1,
0.05974231, 0.1634578, -1.084409, 1, 1, 1, 1, 1,
0.06571119, -0.6833403, 3.26359, 1, 1, 1, 1, 1,
0.06758043, 0.3149211, 0.8668342, 1, 1, 1, 1, 1,
0.06769083, -0.4314776, 3.352018, 1, 1, 1, 1, 1,
0.0718707, -1.587604, 1.06052, 1, 1, 1, 1, 1,
0.07292996, -0.5664984, 2.804775, 1, 1, 1, 1, 1,
0.07507909, 1.280048, -1.386966, 1, 1, 1, 1, 1,
0.0806828, -0.9528945, 3.461905, 1, 1, 1, 1, 1,
0.08355246, -1.456771, 3.223967, 1, 1, 1, 1, 1,
0.08416778, -0.7077044, 3.629427, 1, 1, 1, 1, 1,
0.08942225, 1.174444, 0.1649239, 1, 1, 1, 1, 1,
0.09095705, -0.4458147, 2.680963, 1, 1, 1, 1, 1,
0.09120896, 0.3876384, 0.3081867, 0, 0, 1, 1, 1,
0.09141031, -0.682456, 3.62013, 1, 0, 0, 1, 1,
0.09603147, 0.2966774, -0.4134057, 1, 0, 0, 1, 1,
0.09743501, 0.400564, 0.4499949, 1, 0, 0, 1, 1,
0.09810607, 1.100687, 0.2772233, 1, 0, 0, 1, 1,
0.1022999, 1.243242, -0.7574198, 1, 0, 0, 1, 1,
0.1026111, 1.713745, -0.5277205, 0, 0, 0, 1, 1,
0.1030259, 1.659676, 1.067682, 0, 0, 0, 1, 1,
0.1076595, 0.5082007, 1.350008, 0, 0, 0, 1, 1,
0.1096451, -0.01784269, 2.796433, 0, 0, 0, 1, 1,
0.1110862, -0.1448905, 2.658807, 0, 0, 0, 1, 1,
0.1121051, -0.4409893, 4.250155, 0, 0, 0, 1, 1,
0.1121799, 1.960701, -0.3145505, 0, 0, 0, 1, 1,
0.1129631, -1.526134, 0.9126042, 1, 1, 1, 1, 1,
0.1130791, 0.6826057, -0.01444273, 1, 1, 1, 1, 1,
0.1152102, 1.100631, 0.8352693, 1, 1, 1, 1, 1,
0.1193725, -0.8352333, 2.772016, 1, 1, 1, 1, 1,
0.1267441, -0.3000222, 4.078788, 1, 1, 1, 1, 1,
0.1284391, 0.7291079, 0.9163167, 1, 1, 1, 1, 1,
0.1344054, 0.5407075, -1.840233, 1, 1, 1, 1, 1,
0.1404049, -0.399106, 0.5400066, 1, 1, 1, 1, 1,
0.142409, 0.8399161, -0.498211, 1, 1, 1, 1, 1,
0.1450741, -1.82206, 1.078585, 1, 1, 1, 1, 1,
0.1492764, -0.5518994, 2.039749, 1, 1, 1, 1, 1,
0.1494647, -1.333461, 1.948332, 1, 1, 1, 1, 1,
0.1508449, 0.5738178, -0.8549843, 1, 1, 1, 1, 1,
0.1557134, -1.130937, 2.94724, 1, 1, 1, 1, 1,
0.1586921, -0.4272808, 2.681465, 1, 1, 1, 1, 1,
0.1596444, -0.3023235, 1.469189, 0, 0, 1, 1, 1,
0.1607137, -0.009592768, 1.387657, 1, 0, 0, 1, 1,
0.1621285, 0.3363106, 0.8033404, 1, 0, 0, 1, 1,
0.1663344, -1.543882, 3.147555, 1, 0, 0, 1, 1,
0.1672045, 0.02914699, 1.284712, 1, 0, 0, 1, 1,
0.1696042, 0.06458376, 1.9805, 1, 0, 0, 1, 1,
0.1705414, 1.10143, 0.542433, 0, 0, 0, 1, 1,
0.179609, 3.137106, -2.10643, 0, 0, 0, 1, 1,
0.1797786, 1.898907, -0.3473475, 0, 0, 0, 1, 1,
0.180607, 0.2805894, 2.322735, 0, 0, 0, 1, 1,
0.1860532, -1.160655, 1.646838, 0, 0, 0, 1, 1,
0.1905831, -0.4129587, 3.66262, 0, 0, 0, 1, 1,
0.1913958, -1.052771, 2.41241, 0, 0, 0, 1, 1,
0.1915163, 2.044736, 1.246817, 1, 1, 1, 1, 1,
0.1926004, -0.4683246, 3.239081, 1, 1, 1, 1, 1,
0.1947701, -0.910701, 4.169145, 1, 1, 1, 1, 1,
0.1951866, 1.672745, -0.3395601, 1, 1, 1, 1, 1,
0.1954911, -0.9216488, 4.240075, 1, 1, 1, 1, 1,
0.1958149, -0.1622902, 1.833492, 1, 1, 1, 1, 1,
0.1998431, 0.6192853, 0.7452553, 1, 1, 1, 1, 1,
0.2006238, -0.9870102, 2.961415, 1, 1, 1, 1, 1,
0.2025009, -0.1822855, 3.337671, 1, 1, 1, 1, 1,
0.2050075, 0.09533156, -1.136787, 1, 1, 1, 1, 1,
0.2067395, -1.158362, 1.896202, 1, 1, 1, 1, 1,
0.2113861, -1.559988, 2.694179, 1, 1, 1, 1, 1,
0.2145873, 0.63806, 0.01477344, 1, 1, 1, 1, 1,
0.2197956, 1.852101, -1.400088, 1, 1, 1, 1, 1,
0.2221065, -1.869752, 2.795876, 1, 1, 1, 1, 1,
0.22287, 1.824062, 0.797156, 0, 0, 1, 1, 1,
0.2247056, -0.1846396, 2.204322, 1, 0, 0, 1, 1,
0.2248538, 2.498186, -0.2069891, 1, 0, 0, 1, 1,
0.2285886, 0.1420297, 1.476295, 1, 0, 0, 1, 1,
0.2392272, -1.240927, 2.463122, 1, 0, 0, 1, 1,
0.2395691, -1.194847, 4.505411, 1, 0, 0, 1, 1,
0.2409475, -0.2000644, 3.310557, 0, 0, 0, 1, 1,
0.2454152, -2.164388, 1.350401, 0, 0, 0, 1, 1,
0.2456288, -0.8517638, 2.83475, 0, 0, 0, 1, 1,
0.2508267, 0.5413675, 0.9725578, 0, 0, 0, 1, 1,
0.2536436, 0.3863458, 2.237712, 0, 0, 0, 1, 1,
0.2597276, -0.3330605, 2.007322, 0, 0, 0, 1, 1,
0.2606762, -0.5171884, 3.11867, 0, 0, 0, 1, 1,
0.2665881, 1.707213, -1.634432, 1, 1, 1, 1, 1,
0.275879, -0.2749796, 4.031828, 1, 1, 1, 1, 1,
0.2760559, 1.451105, -1.685063, 1, 1, 1, 1, 1,
0.277367, -0.1303434, 0.6785102, 1, 1, 1, 1, 1,
0.277511, 1.294242, 0.2702706, 1, 1, 1, 1, 1,
0.2779703, -0.536825, 3.652129, 1, 1, 1, 1, 1,
0.279475, 0.2429253, 1.137653, 1, 1, 1, 1, 1,
0.2795959, 0.2464591, 1.242455, 1, 1, 1, 1, 1,
0.2837263, 0.4691386, -0.2754697, 1, 1, 1, 1, 1,
0.2880152, 1.50919, -0.1283532, 1, 1, 1, 1, 1,
0.296752, 1.030841, 0.4120839, 1, 1, 1, 1, 1,
0.2970952, -0.2806331, 2.930887, 1, 1, 1, 1, 1,
0.2978365, 1.190899, 0.8989791, 1, 1, 1, 1, 1,
0.2982682, -0.4053124, 2.414991, 1, 1, 1, 1, 1,
0.2996537, -0.4975044, 2.572009, 1, 1, 1, 1, 1,
0.3001816, -0.397384, 5.032498, 0, 0, 1, 1, 1,
0.3007398, -1.600952, 3.861352, 1, 0, 0, 1, 1,
0.3009906, 0.1805082, 0.9908791, 1, 0, 0, 1, 1,
0.3053362, -1.161996, 3.92697, 1, 0, 0, 1, 1,
0.306467, -0.9981069, 2.19932, 1, 0, 0, 1, 1,
0.308649, -0.2472781, 1.961698, 1, 0, 0, 1, 1,
0.3161992, 0.3567486, 0.3572784, 0, 0, 0, 1, 1,
0.3278808, -0.640681, -0.3361265, 0, 0, 0, 1, 1,
0.3280259, 0.6277952, 1.368148, 0, 0, 0, 1, 1,
0.3294723, -0.01416799, 3.096207, 0, 0, 0, 1, 1,
0.3306777, 0.5634099, 0.2946635, 0, 0, 0, 1, 1,
0.3309662, -0.2684447, 1.913248, 0, 0, 0, 1, 1,
0.3329737, 0.7952582, 2.595822, 0, 0, 0, 1, 1,
0.3336894, 0.3259531, 2.169976, 1, 1, 1, 1, 1,
0.3360966, 0.1693544, 0.8884311, 1, 1, 1, 1, 1,
0.3368514, 0.5194072, -0.9272959, 1, 1, 1, 1, 1,
0.3374923, 0.6650326, 0.6239755, 1, 1, 1, 1, 1,
0.3386129, 0.8265752, -0.5783779, 1, 1, 1, 1, 1,
0.3399696, -0.7537742, 2.70404, 1, 1, 1, 1, 1,
0.3413135, -1.047769, 2.558736, 1, 1, 1, 1, 1,
0.3416429, -1.172726, 2.497334, 1, 1, 1, 1, 1,
0.3441485, 0.8618742, 1.468741, 1, 1, 1, 1, 1,
0.3463612, -0.2997495, 1.980261, 1, 1, 1, 1, 1,
0.3503979, 0.2316132, 0.2783503, 1, 1, 1, 1, 1,
0.3551352, 0.7468019, 1.287266, 1, 1, 1, 1, 1,
0.3715776, -2.005995, 3.2457, 1, 1, 1, 1, 1,
0.3730378, -0.5290033, 1.809379, 1, 1, 1, 1, 1,
0.3753968, 0.8964381, -0.4505614, 1, 1, 1, 1, 1,
0.3778187, 0.7944304, -0.7171136, 0, 0, 1, 1, 1,
0.3826972, 0.8927649, 2.691694, 1, 0, 0, 1, 1,
0.390245, 0.2893263, 2.335161, 1, 0, 0, 1, 1,
0.3936113, 0.5587528, 0.716835, 1, 0, 0, 1, 1,
0.3949676, -1.367475, 3.924346, 1, 0, 0, 1, 1,
0.4078361, 0.4965721, 1.442077, 1, 0, 0, 1, 1,
0.4135417, -0.5742599, 2.411046, 0, 0, 0, 1, 1,
0.4138197, 0.1490458, 0.5365676, 0, 0, 0, 1, 1,
0.4141062, -0.4679678, 3.819122, 0, 0, 0, 1, 1,
0.4173985, -0.2040514, 4.18937, 0, 0, 0, 1, 1,
0.4197616, -1.127016, 2.978801, 0, 0, 0, 1, 1,
0.4231886, -1.559612, 2.146602, 0, 0, 0, 1, 1,
0.4291602, -0.9627168, 2.812737, 0, 0, 0, 1, 1,
0.4313706, -1.158619, 1.086828, 1, 1, 1, 1, 1,
0.4314433, -0.08552837, 1.902259, 1, 1, 1, 1, 1,
0.4366325, 0.7646282, -0.3739646, 1, 1, 1, 1, 1,
0.4433088, -0.5858871, 2.152644, 1, 1, 1, 1, 1,
0.4433453, -0.5489726, 3.125287, 1, 1, 1, 1, 1,
0.443891, 0.9100887, -0.8667555, 1, 1, 1, 1, 1,
0.444968, -0.2366763, 2.943023, 1, 1, 1, 1, 1,
0.4466348, 0.4949074, 0.8116132, 1, 1, 1, 1, 1,
0.4477893, -1.838718, 2.584976, 1, 1, 1, 1, 1,
0.4596519, -2.161116, 3.570081, 1, 1, 1, 1, 1,
0.4611859, -1.598868, 1.855964, 1, 1, 1, 1, 1,
0.4664451, 0.06102391, 0.5068298, 1, 1, 1, 1, 1,
0.4740823, 2.196401, -0.4754655, 1, 1, 1, 1, 1,
0.4836477, -1.672334, 1.814559, 1, 1, 1, 1, 1,
0.4853585, 0.1422411, 1.748734, 1, 1, 1, 1, 1,
0.491754, -1.947004, 3.907308, 0, 0, 1, 1, 1,
0.5014744, -1.104692, 0.9823842, 1, 0, 0, 1, 1,
0.5064629, 2.733972, 0.5939261, 1, 0, 0, 1, 1,
0.5082127, -0.4849128, 3.161979, 1, 0, 0, 1, 1,
0.5121671, -0.2146923, 1.924997, 1, 0, 0, 1, 1,
0.512487, -0.10197, 1.399741, 1, 0, 0, 1, 1,
0.5129927, -0.268979, 1.901419, 0, 0, 0, 1, 1,
0.5148422, 0.9468991, -2.10995, 0, 0, 0, 1, 1,
0.5222949, -0.6179324, 2.588659, 0, 0, 0, 1, 1,
0.52403, -0.6237448, 2.10067, 0, 0, 0, 1, 1,
0.5244727, 1.668881, -0.2300576, 0, 0, 0, 1, 1,
0.5277556, -0.1685553, 4.448307, 0, 0, 0, 1, 1,
0.5287828, 0.2099469, 2.11394, 0, 0, 0, 1, 1,
0.5320108, 0.3907526, 1.193974, 1, 1, 1, 1, 1,
0.5346902, -1.095043, 2.94708, 1, 1, 1, 1, 1,
0.5364349, -1.31375, 4.40527, 1, 1, 1, 1, 1,
0.5433645, 0.8034284, 0.01847401, 1, 1, 1, 1, 1,
0.5457796, 0.8576379, 1.780885, 1, 1, 1, 1, 1,
0.5523393, 1.057912, -0.5649963, 1, 1, 1, 1, 1,
0.5559577, 0.883064, 1.870146, 1, 1, 1, 1, 1,
0.5664269, -2.005014, 3.106529, 1, 1, 1, 1, 1,
0.5688922, -1.414196, 4.823112, 1, 1, 1, 1, 1,
0.5729907, -0.4702716, 2.931624, 1, 1, 1, 1, 1,
0.574537, -0.1950999, 2.329332, 1, 1, 1, 1, 1,
0.5773499, -0.3516494, 4.104879, 1, 1, 1, 1, 1,
0.5785304, 1.002715, 0.409584, 1, 1, 1, 1, 1,
0.5795108, 0.5528752, 0.09059859, 1, 1, 1, 1, 1,
0.5804327, -0.3840547, 1.391037, 1, 1, 1, 1, 1,
0.580994, -1.410728, 0.6355809, 0, 0, 1, 1, 1,
0.5817874, -0.1561599, 2.442193, 1, 0, 0, 1, 1,
0.5872929, 0.01125231, 0.6924489, 1, 0, 0, 1, 1,
0.5939248, -0.01807705, 0.9521013, 1, 0, 0, 1, 1,
0.5941649, -1.057095, 1.439223, 1, 0, 0, 1, 1,
0.6113691, 1.387921, 1.886331, 1, 0, 0, 1, 1,
0.6140224, 0.8627071, 0.3948878, 0, 0, 0, 1, 1,
0.6208308, -0.3022959, 3.663936, 0, 0, 0, 1, 1,
0.6232198, 1.259405, -0.4440449, 0, 0, 0, 1, 1,
0.624584, 0.3986394, 3.23708, 0, 0, 0, 1, 1,
0.6265017, 1.58841, 0.8191627, 0, 0, 0, 1, 1,
0.6284218, 0.425291, 0.1759268, 0, 0, 0, 1, 1,
0.6306037, -0.1865921, 2.469429, 0, 0, 0, 1, 1,
0.6352216, 0.1224728, 1.938486, 1, 1, 1, 1, 1,
0.6376301, 0.2028727, 1.368634, 1, 1, 1, 1, 1,
0.6400543, 0.6057904, 1.796126, 1, 1, 1, 1, 1,
0.6407357, 0.5923192, 1.720839, 1, 1, 1, 1, 1,
0.6415373, -1.113372, 1.438219, 1, 1, 1, 1, 1,
0.642947, 0.6325014, 1.625243, 1, 1, 1, 1, 1,
0.6439151, 1.237869, 0.972596, 1, 1, 1, 1, 1,
0.6441455, 0.236934, 3.091639, 1, 1, 1, 1, 1,
0.6522243, 0.1995118, 1.840281, 1, 1, 1, 1, 1,
0.6548269, 0.0150357, 0.8207939, 1, 1, 1, 1, 1,
0.6562027, 0.9502119, 1.90327, 1, 1, 1, 1, 1,
0.6564589, -0.2902547, 2.296945, 1, 1, 1, 1, 1,
0.6609598, -0.7876295, 3.290503, 1, 1, 1, 1, 1,
0.6627026, 0.3833238, 4.644556, 1, 1, 1, 1, 1,
0.665053, 0.5700855, 1.704464, 1, 1, 1, 1, 1,
0.6652448, -1.636356, 4.044565, 0, 0, 1, 1, 1,
0.6672909, 0.164954, 2.016949, 1, 0, 0, 1, 1,
0.6706917, -0.1690357, 1.952919, 1, 0, 0, 1, 1,
0.6728992, 0.4327629, 0.3737809, 1, 0, 0, 1, 1,
0.6747118, -0.5637012, 0.893186, 1, 0, 0, 1, 1,
0.6768085, 0.7147623, 1.31372, 1, 0, 0, 1, 1,
0.6782902, 0.1089655, 2.179198, 0, 0, 0, 1, 1,
0.6906613, -0.02114295, 1.539864, 0, 0, 0, 1, 1,
0.6960301, -1.90533, 1.723076, 0, 0, 0, 1, 1,
0.6962831, -1.117162, 2.862139, 0, 0, 0, 1, 1,
0.7040338, 0.2165798, 2.034853, 0, 0, 0, 1, 1,
0.7093042, 1.107103, 0.2906341, 0, 0, 0, 1, 1,
0.7132831, -0.1564411, 2.592616, 0, 0, 0, 1, 1,
0.7192498, 1.382177, -0.7886147, 1, 1, 1, 1, 1,
0.7221776, 0.1625233, 1.408793, 1, 1, 1, 1, 1,
0.7241719, -0.3549302, 1.647433, 1, 1, 1, 1, 1,
0.7282442, -0.9626535, 2.030628, 1, 1, 1, 1, 1,
0.7341571, 0.4997388, 1.07674, 1, 1, 1, 1, 1,
0.7343374, 0.04047083, 2.22721, 1, 1, 1, 1, 1,
0.7397238, -0.9848856, 3.792398, 1, 1, 1, 1, 1,
0.7404554, -0.7000573, 0.3110644, 1, 1, 1, 1, 1,
0.7430031, 0.4984406, 2.879717, 1, 1, 1, 1, 1,
0.7463059, -0.03688633, 1.451315, 1, 1, 1, 1, 1,
0.7482681, -0.5117072, 2.260381, 1, 1, 1, 1, 1,
0.7488629, 1.012513, 0.2661196, 1, 1, 1, 1, 1,
0.7517121, 1.420572, 0.4518183, 1, 1, 1, 1, 1,
0.7539805, -1.95583, 3.241735, 1, 1, 1, 1, 1,
0.766443, 0.4021363, 2.151209, 1, 1, 1, 1, 1,
0.767148, 0.7723478, 1.603518, 0, 0, 1, 1, 1,
0.7675342, -0.3853034, 2.506327, 1, 0, 0, 1, 1,
0.7713014, -1.421575, 3.829384, 1, 0, 0, 1, 1,
0.7713988, -0.1315797, 2.846143, 1, 0, 0, 1, 1,
0.7765934, -0.3440208, 3.098433, 1, 0, 0, 1, 1,
0.7821791, -1.002041, 3.181546, 1, 0, 0, 1, 1,
0.7857099, -0.4773605, 1.601925, 0, 0, 0, 1, 1,
0.7932997, 1.18008, 0.7575908, 0, 0, 0, 1, 1,
0.7945085, 0.9862769, 0.3930826, 0, 0, 0, 1, 1,
0.7992725, 0.08788259, 0.7849205, 0, 0, 0, 1, 1,
0.8012951, 1.108379, -0.1902692, 0, 0, 0, 1, 1,
0.8019294, -0.4827929, 0.9014122, 0, 0, 0, 1, 1,
0.8042182, 1.734437, -0.02262835, 0, 0, 0, 1, 1,
0.8050473, 0.2289051, 0.9999671, 1, 1, 1, 1, 1,
0.8120825, -0.8026498, 1.865117, 1, 1, 1, 1, 1,
0.8157124, 1.098187, 1.863422, 1, 1, 1, 1, 1,
0.8161187, 0.9631168, 1.223453, 1, 1, 1, 1, 1,
0.8244022, -1.327562, 3.121016, 1, 1, 1, 1, 1,
0.8275452, 0.1818854, 2.543844, 1, 1, 1, 1, 1,
0.8281448, -0.4888678, 1.526408, 1, 1, 1, 1, 1,
0.8300685, -0.5939824, 2.939879, 1, 1, 1, 1, 1,
0.8310072, 0.3333159, 2.269462, 1, 1, 1, 1, 1,
0.8322385, -0.4248122, 2.762781, 1, 1, 1, 1, 1,
0.8365573, -1.173067, 1.915032, 1, 1, 1, 1, 1,
0.8473735, 0.9226774, -0.5380204, 1, 1, 1, 1, 1,
0.8542734, 0.0941987, 2.116867, 1, 1, 1, 1, 1,
0.8559298, 0.151912, 3.286123, 1, 1, 1, 1, 1,
0.8591553, -0.2916873, 1.79864, 1, 1, 1, 1, 1,
0.8629367, 0.1501465, 1.561453, 0, 0, 1, 1, 1,
0.87428, 0.215246, 2.71187, 1, 0, 0, 1, 1,
0.8764262, 0.5787494, 2.164653, 1, 0, 0, 1, 1,
0.8776944, 0.2261534, 1.00988, 1, 0, 0, 1, 1,
0.8807696, 0.6803818, 0.1777394, 1, 0, 0, 1, 1,
0.884571, -1.865122, 2.179586, 1, 0, 0, 1, 1,
0.8851753, 0.5926713, 1.983938, 0, 0, 0, 1, 1,
0.885518, 0.5993972, 0.007688166, 0, 0, 0, 1, 1,
0.8968001, 0.5247243, -0.06085716, 0, 0, 0, 1, 1,
0.8969047, -0.1915044, 1.100062, 0, 0, 0, 1, 1,
0.8980795, -0.6982992, 2.66952, 0, 0, 0, 1, 1,
0.9043811, 1.247702, -0.7050633, 0, 0, 0, 1, 1,
0.9052876, -0.04574439, 0.8051642, 0, 0, 0, 1, 1,
0.9058164, -0.2619092, 2.004979, 1, 1, 1, 1, 1,
0.9105921, -0.1973168, 2.568823, 1, 1, 1, 1, 1,
0.9132018, -1.528509, 3.082202, 1, 1, 1, 1, 1,
0.9145162, 0.0959873, -0.9338878, 1, 1, 1, 1, 1,
0.9173924, 0.3259159, -0.2528164, 1, 1, 1, 1, 1,
0.9210208, 0.325824, 0.8953704, 1, 1, 1, 1, 1,
0.9230895, 0.009580165, 2.277297, 1, 1, 1, 1, 1,
0.9259346, -1.12245, 2.053191, 1, 1, 1, 1, 1,
0.9322472, 0.1183852, 1.164008, 1, 1, 1, 1, 1,
0.9324417, 0.468965, 1.621031, 1, 1, 1, 1, 1,
0.9356163, -1.966665, 2.997457, 1, 1, 1, 1, 1,
0.9373489, -2.150452, 1.770744, 1, 1, 1, 1, 1,
0.939301, -0.7958888, 2.25128, 1, 1, 1, 1, 1,
0.9411393, 2.04113, 0.5951013, 1, 1, 1, 1, 1,
0.9448451, -0.4442108, 1.520638, 1, 1, 1, 1, 1,
0.9468334, -0.05315078, 1.826647, 0, 0, 1, 1, 1,
0.9584503, 1.804493, 0.8160595, 1, 0, 0, 1, 1,
0.9745634, -0.1016302, 3.363785, 1, 0, 0, 1, 1,
0.9817573, -0.8482397, 1.639423, 1, 0, 0, 1, 1,
0.9883686, 0.4381389, -0.4858807, 1, 0, 0, 1, 1,
0.9963555, -0.2399839, 0.3629397, 1, 0, 0, 1, 1,
0.9969357, 0.5003876, 0.7120374, 0, 0, 0, 1, 1,
0.997309, -0.7476443, 1.769419, 0, 0, 0, 1, 1,
0.9981465, 0.3216792, -0.4786473, 0, 0, 0, 1, 1,
1.009911, 0.1224313, 1.682862, 0, 0, 0, 1, 1,
1.01371, -0.9569355, 3.17537, 0, 0, 0, 1, 1,
1.016791, -0.09461752, 0.9806049, 0, 0, 0, 1, 1,
1.019741, -1.673335, 2.81065, 0, 0, 0, 1, 1,
1.020746, -0.4897751, 2.046374, 1, 1, 1, 1, 1,
1.022121, 1.214437, 1.407413, 1, 1, 1, 1, 1,
1.024127, -1.464062, 1.81174, 1, 1, 1, 1, 1,
1.025211, 0.5249242, 0.848491, 1, 1, 1, 1, 1,
1.030287, -1.011983, 3.440191, 1, 1, 1, 1, 1,
1.035089, 1.395619, 0.7731777, 1, 1, 1, 1, 1,
1.038935, 1.311026, 2.046185, 1, 1, 1, 1, 1,
1.044196, 0.1761539, 1.77945, 1, 1, 1, 1, 1,
1.045237, -0.03320589, 4.295018, 1, 1, 1, 1, 1,
1.053321, 0.3368321, 0.9659525, 1, 1, 1, 1, 1,
1.055552, 1.329021, 0.7329263, 1, 1, 1, 1, 1,
1.062854, -0.2289545, 2.286134, 1, 1, 1, 1, 1,
1.0659, -1.400917, 3.420872, 1, 1, 1, 1, 1,
1.080889, 1.129049, 0.06915689, 1, 1, 1, 1, 1,
1.082875, -0.07756876, 0.4112957, 1, 1, 1, 1, 1,
1.084712, -0.7413481, 3.155171, 0, 0, 1, 1, 1,
1.09505, 0.5412735, 0.1150114, 1, 0, 0, 1, 1,
1.095057, 1.337155, 0.4581174, 1, 0, 0, 1, 1,
1.101028, 0.6229522, 2.29802, 1, 0, 0, 1, 1,
1.101884, 0.6802611, 1.871807, 1, 0, 0, 1, 1,
1.102889, -1.132952, 3.893554, 1, 0, 0, 1, 1,
1.10619, -1.495868, 2.072811, 0, 0, 0, 1, 1,
1.118236, -1.031259, 2.902849, 0, 0, 0, 1, 1,
1.119754, 0.3419417, 2.104168, 0, 0, 0, 1, 1,
1.121386, -0.5472648, 5.564344, 0, 0, 0, 1, 1,
1.129905, 0.3073382, 1.275915, 0, 0, 0, 1, 1,
1.131907, 1.103783, -1.153075, 0, 0, 0, 1, 1,
1.132985, -0.5839145, 4.14186, 0, 0, 0, 1, 1,
1.140212, 0.3480642, 2.314984, 1, 1, 1, 1, 1,
1.140799, 0.548672, -0.235694, 1, 1, 1, 1, 1,
1.147306, -1.849959, 1.635578, 1, 1, 1, 1, 1,
1.149271, 0.001298904, 0.7744737, 1, 1, 1, 1, 1,
1.155814, 0.05820871, 1.58465, 1, 1, 1, 1, 1,
1.161106, -0.5275411, 2.538256, 1, 1, 1, 1, 1,
1.171857, 0.1360766, 1.079752, 1, 1, 1, 1, 1,
1.174875, 2.009743, 0.6462193, 1, 1, 1, 1, 1,
1.182673, 1.458771, 0.5142434, 1, 1, 1, 1, 1,
1.190072, -0.4475188, 1.795484, 1, 1, 1, 1, 1,
1.190318, -0.07509427, 2.939506, 1, 1, 1, 1, 1,
1.197805, 1.435141, 1.372642, 1, 1, 1, 1, 1,
1.204414, 1.021535, 0.4753399, 1, 1, 1, 1, 1,
1.206001, -2.222472, 1.648733, 1, 1, 1, 1, 1,
1.206893, -0.001408361, 2.682078, 1, 1, 1, 1, 1,
1.228974, -1.414317, 2.260442, 0, 0, 1, 1, 1,
1.24071, -0.1780677, 2.282791, 1, 0, 0, 1, 1,
1.259555, 0.5101962, 1.776, 1, 0, 0, 1, 1,
1.275415, 0.4540054, 2.823063, 1, 0, 0, 1, 1,
1.27912, -1.829106, 3.56877, 1, 0, 0, 1, 1,
1.287077, 0.3749936, 0.6124033, 1, 0, 0, 1, 1,
1.288647, 0.7449145, 1.864259, 0, 0, 0, 1, 1,
1.288894, 0.6789406, 2.611634, 0, 0, 0, 1, 1,
1.31051, 1.219854, 1.023696, 0, 0, 0, 1, 1,
1.310694, -0.9208981, 2.109516, 0, 0, 0, 1, 1,
1.312689, -2.425321, 3.881058, 0, 0, 0, 1, 1,
1.315057, -0.4716571, 2.00612, 0, 0, 0, 1, 1,
1.337622, 1.100622, 0.02435258, 0, 0, 0, 1, 1,
1.340845, 0.1636044, 1.624855, 1, 1, 1, 1, 1,
1.349789, 0.371838, 1.68993, 1, 1, 1, 1, 1,
1.350287, -0.968527, 3.510696, 1, 1, 1, 1, 1,
1.357092, 1.367491, 0.5837448, 1, 1, 1, 1, 1,
1.370924, -1.738785, 3.057543, 1, 1, 1, 1, 1,
1.37246, -0.3721829, 1.785467, 1, 1, 1, 1, 1,
1.373553, -1.174953, 2.258169, 1, 1, 1, 1, 1,
1.377414, -0.2180937, 1.278877, 1, 1, 1, 1, 1,
1.389627, -0.4726188, 1.415617, 1, 1, 1, 1, 1,
1.3976, -2.078375, 2.709429, 1, 1, 1, 1, 1,
1.399757, 1.841707, 0.03023412, 1, 1, 1, 1, 1,
1.401551, -1.043102, 2.683288, 1, 1, 1, 1, 1,
1.413048, 0.1493948, 1.712416, 1, 1, 1, 1, 1,
1.413229, 0.1024281, 1.269834, 1, 1, 1, 1, 1,
1.425806, 0.07739884, 0.3797958, 1, 1, 1, 1, 1,
1.430663, 0.3249205, 0.9717022, 0, 0, 1, 1, 1,
1.436709, -0.01922215, 0.9917634, 1, 0, 0, 1, 1,
1.437858, -1.140337, 1.075639, 1, 0, 0, 1, 1,
1.440385, -1.656471, 1.87648, 1, 0, 0, 1, 1,
1.440977, -0.6675739, 3.262624, 1, 0, 0, 1, 1,
1.448754, 2.066187, 1.360099, 1, 0, 0, 1, 1,
1.458801, 0.2832273, 1.422692, 0, 0, 0, 1, 1,
1.477278, -1.089307, -0.1737386, 0, 0, 0, 1, 1,
1.491081, 0.5349414, 0.4504337, 0, 0, 0, 1, 1,
1.494262, 2.3671, 1.103474, 0, 0, 0, 1, 1,
1.498544, 0.3428898, 1.958633, 0, 0, 0, 1, 1,
1.499686, 1.155596, 1.388573, 0, 0, 0, 1, 1,
1.500469, -0.390489, 1.977521, 0, 0, 0, 1, 1,
1.501452, 0.03997663, 0.8499679, 1, 1, 1, 1, 1,
1.521499, 0.01731402, 2.220558, 1, 1, 1, 1, 1,
1.542665, -0.6130562, 1.151607, 1, 1, 1, 1, 1,
1.551235, 0.881084, 2.009791, 1, 1, 1, 1, 1,
1.555826, -0.08385278, 0.6030533, 1, 1, 1, 1, 1,
1.559086, -2.349557, 1.062648, 1, 1, 1, 1, 1,
1.582425, -0.542658, 0.5263473, 1, 1, 1, 1, 1,
1.58436, 0.4974416, -0.5417726, 1, 1, 1, 1, 1,
1.586492, -0.0941684, 1.35383, 1, 1, 1, 1, 1,
1.593063, 0.3200802, 0.5116499, 1, 1, 1, 1, 1,
1.639455, 0.4851909, 2.799136, 1, 1, 1, 1, 1,
1.642102, 2.719556, -0.4421037, 1, 1, 1, 1, 1,
1.66231, -0.492729, 0.6838836, 1, 1, 1, 1, 1,
1.664724, -0.09516112, 0.1330681, 1, 1, 1, 1, 1,
1.66675, 0.6326979, 1.053926, 1, 1, 1, 1, 1,
1.66787, 1.623547, -0.8851907, 0, 0, 1, 1, 1,
1.668228, -1.720579, 0.6849542, 1, 0, 0, 1, 1,
1.684807, -0.5738384, 2.23054, 1, 0, 0, 1, 1,
1.696391, 0.6368107, 1.356002, 1, 0, 0, 1, 1,
1.699458, 0.2693689, -1.230507, 1, 0, 0, 1, 1,
1.70155, 1.179562, 2.166334, 1, 0, 0, 1, 1,
1.724648, -0.6918353, 1.575831, 0, 0, 0, 1, 1,
1.72787, -0.3098507, 1.831559, 0, 0, 0, 1, 1,
1.744266, -0.6062504, 0.6853042, 0, 0, 0, 1, 1,
1.82743, 1.888999, -0.3354665, 0, 0, 0, 1, 1,
1.838512, -1.127758, 1.880313, 0, 0, 0, 1, 1,
1.838552, 1.107845, 0.09064285, 0, 0, 0, 1, 1,
1.839166, 0.7970976, 3.666506, 0, 0, 0, 1, 1,
1.854916, 1.039558, 1.204987, 1, 1, 1, 1, 1,
1.85938, 0.1009729, 3.253692, 1, 1, 1, 1, 1,
1.861072, 0.2750759, 1.707086, 1, 1, 1, 1, 1,
1.864992, 0.1878481, 0.9004074, 1, 1, 1, 1, 1,
1.868505, -1.224416, 1.345066, 1, 1, 1, 1, 1,
1.874696, 0.072777, 1.780374, 1, 1, 1, 1, 1,
1.902093, 0.3873151, 0.9469202, 1, 1, 1, 1, 1,
1.903198, -0.4721305, 1.438543, 1, 1, 1, 1, 1,
1.939551, 0.8939953, 0.5925766, 1, 1, 1, 1, 1,
1.952017, -0.51862, 2.139836, 1, 1, 1, 1, 1,
1.953054, -0.6404376, 3.45125, 1, 1, 1, 1, 1,
1.963248, -0.7924119, 2.834311, 1, 1, 1, 1, 1,
1.969763, 0.2646081, 0.3604111, 1, 1, 1, 1, 1,
1.970013, 1.311097, 0.9822327, 1, 1, 1, 1, 1,
1.986585, -0.02049971, 3.809916, 1, 1, 1, 1, 1,
2.009356, -0.8683844, 0.9052637, 0, 0, 1, 1, 1,
2.011424, 0.7192052, 1.607347, 1, 0, 0, 1, 1,
2.042643, 1.299764, 1.234182, 1, 0, 0, 1, 1,
2.04758, -0.6554519, 1.466663, 1, 0, 0, 1, 1,
2.069147, -0.09837096, 1.930263, 1, 0, 0, 1, 1,
2.077717, 0.08543547, 1.091753, 1, 0, 0, 1, 1,
2.081698, -0.2401933, 1.04215, 0, 0, 0, 1, 1,
2.085242, -0.3124396, 2.348827, 0, 0, 0, 1, 1,
2.086403, 2.059077, 0.4415641, 0, 0, 0, 1, 1,
2.114895, 0.2883045, 0.7218533, 0, 0, 0, 1, 1,
2.159432, -0.1391946, 2.825506, 0, 0, 0, 1, 1,
2.230696, -0.106315, 2.191367, 0, 0, 0, 1, 1,
2.237327, 0.2566897, 3.340374, 0, 0, 0, 1, 1,
2.267511, -0.6489685, 2.633921, 1, 1, 1, 1, 1,
2.29249, 1.351417, 0.8517603, 1, 1, 1, 1, 1,
2.315065, -1.401547, 1.587755, 1, 1, 1, 1, 1,
2.418684, -1.230476, 1.938623, 1, 1, 1, 1, 1,
2.573057, -0.2247361, 1.890898, 1, 1, 1, 1, 1,
2.839995, -0.7998201, 1.998208, 1, 1, 1, 1, 1,
3.182105, 0.3393485, 1.176673, 1, 1, 1, 1, 1
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
var radius = 9.296338;
var distance = 32.65299;
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
mvMatrix.translate( -0.0145998, -0.2986456, -0.2936847 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.65299);
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
