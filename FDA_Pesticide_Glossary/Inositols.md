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
-3.200421, -1.710444, -0.1990895, 1, 0, 0, 1,
-2.884628, 0.6987691, -0.3456212, 1, 0.007843138, 0, 1,
-2.834396, 2.116158, -1.494932, 1, 0.01176471, 0, 1,
-2.772035, -0.2140167, -2.950306, 1, 0.01960784, 0, 1,
-2.694115, 1.318554, -1.96505, 1, 0.02352941, 0, 1,
-2.645643, -0.6257325, -2.859952, 1, 0.03137255, 0, 1,
-2.588365, -1.45326, -2.253765, 1, 0.03529412, 0, 1,
-2.565493, 0.4701529, -1.186298, 1, 0.04313726, 0, 1,
-2.526794, 0.1348727, -3.584771, 1, 0.04705882, 0, 1,
-2.477481, -0.4708719, -1.317326, 1, 0.05490196, 0, 1,
-2.465312, 0.2872844, 1.09363, 1, 0.05882353, 0, 1,
-2.338667, 0.7297353, -2.166566, 1, 0.06666667, 0, 1,
-2.333363, 0.2396282, -2.869267, 1, 0.07058824, 0, 1,
-2.29263, -0.2294286, -1.270908, 1, 0.07843138, 0, 1,
-2.275448, -0.5184919, -1.427538, 1, 0.08235294, 0, 1,
-2.259244, 0.4439468, 1.340719, 1, 0.09019608, 0, 1,
-2.226288, 0.8278825, -1.283025, 1, 0.09411765, 0, 1,
-2.100556, 0.9099347, 0.2146966, 1, 0.1019608, 0, 1,
-2.054876, 0.5013647, -2.577142, 1, 0.1098039, 0, 1,
-2.01327, 0.6075164, -1.454793, 1, 0.1137255, 0, 1,
-2.003361, -0.4106572, -2.193648, 1, 0.1215686, 0, 1,
-1.960386, -1.754612, -0.9433889, 1, 0.1254902, 0, 1,
-1.938042, -1.805903, -2.630185, 1, 0.1333333, 0, 1,
-1.93753, -0.1689945, -3.049455, 1, 0.1372549, 0, 1,
-1.927179, -1.964912, -1.777648, 1, 0.145098, 0, 1,
-1.92638, -1.584647, -3.764642, 1, 0.1490196, 0, 1,
-1.925605, -0.4910777, -2.263638, 1, 0.1568628, 0, 1,
-1.91962, 1.23705, -0.7245569, 1, 0.1607843, 0, 1,
-1.916481, -0.3094803, -1.226317, 1, 0.1686275, 0, 1,
-1.916263, -0.5459431, -2.156949, 1, 0.172549, 0, 1,
-1.907236, 0.7769243, -0.7796823, 1, 0.1803922, 0, 1,
-1.901541, -0.7966122, -1.744428, 1, 0.1843137, 0, 1,
-1.899958, -0.1439586, -0.5948171, 1, 0.1921569, 0, 1,
-1.891537, 0.3650782, -0.4381541, 1, 0.1960784, 0, 1,
-1.875865, -0.2928381, -3.862823, 1, 0.2039216, 0, 1,
-1.863583, -1.985255, -2.485674, 1, 0.2117647, 0, 1,
-1.857527, 0.1509583, -2.119037, 1, 0.2156863, 0, 1,
-1.855185, -0.9465012, -0.9822438, 1, 0.2235294, 0, 1,
-1.840281, -0.9861462, -1.566337, 1, 0.227451, 0, 1,
-1.837994, -0.7057318, -1.388877, 1, 0.2352941, 0, 1,
-1.833542, -0.586391, -1.66285, 1, 0.2392157, 0, 1,
-1.822238, 0.4381886, -1.205963, 1, 0.2470588, 0, 1,
-1.798585, -0.7820947, -3.063153, 1, 0.2509804, 0, 1,
-1.786182, -0.75401, -1.100268, 1, 0.2588235, 0, 1,
-1.780746, 0.2612073, -2.348051, 1, 0.2627451, 0, 1,
-1.77827, -0.9552273, -1.869429, 1, 0.2705882, 0, 1,
-1.774592, 0.6285747, -1.2966, 1, 0.2745098, 0, 1,
-1.764346, -0.5216416, -1.276785, 1, 0.282353, 0, 1,
-1.744218, 1.301746, -0.3278663, 1, 0.2862745, 0, 1,
-1.742188, -0.2536321, -1.541878, 1, 0.2941177, 0, 1,
-1.717296, 0.8109471, 0.7866597, 1, 0.3019608, 0, 1,
-1.713886, 0.6423189, -1.845757, 1, 0.3058824, 0, 1,
-1.703891, 0.9773241, 0.25646, 1, 0.3137255, 0, 1,
-1.668241, 1.306836, -0.3720108, 1, 0.3176471, 0, 1,
-1.657763, 0.4214114, -2.422168, 1, 0.3254902, 0, 1,
-1.651024, -0.7160137, -0.7904842, 1, 0.3294118, 0, 1,
-1.648693, -1.688014, -1.174582, 1, 0.3372549, 0, 1,
-1.620613, -1.055294, -2.875637, 1, 0.3411765, 0, 1,
-1.595254, 1.348116, -2.032836, 1, 0.3490196, 0, 1,
-1.593075, -0.2405438, -2.086232, 1, 0.3529412, 0, 1,
-1.588191, 0.4362225, -2.570707, 1, 0.3607843, 0, 1,
-1.583502, 1.869663, -0.3633447, 1, 0.3647059, 0, 1,
-1.565773, 1.493863, -1.892981, 1, 0.372549, 0, 1,
-1.557724, -1.156879, -3.80667, 1, 0.3764706, 0, 1,
-1.554324, -1.027047, -1.726333, 1, 0.3843137, 0, 1,
-1.552049, 0.6607014, -1.486267, 1, 0.3882353, 0, 1,
-1.54404, 0.004355899, -0.008027563, 1, 0.3960784, 0, 1,
-1.534968, -0.6638878, -2.212512, 1, 0.4039216, 0, 1,
-1.525637, -0.06163488, -2.134293, 1, 0.4078431, 0, 1,
-1.516062, 1.155012, 0.2842363, 1, 0.4156863, 0, 1,
-1.513717, 0.8495087, -2.668431, 1, 0.4196078, 0, 1,
-1.512098, 0.2163246, -2.561179, 1, 0.427451, 0, 1,
-1.511921, 0.06154955, -2.089352, 1, 0.4313726, 0, 1,
-1.507132, 0.6194947, -2.583098, 1, 0.4392157, 0, 1,
-1.503022, -1.797599, -3.891503, 1, 0.4431373, 0, 1,
-1.478806, 0.5365051, 0.9229956, 1, 0.4509804, 0, 1,
-1.465169, -0.6488019, -0.922857, 1, 0.454902, 0, 1,
-1.462587, -1.46035, -2.131456, 1, 0.4627451, 0, 1,
-1.45938, -0.1340159, -0.4120983, 1, 0.4666667, 0, 1,
-1.446609, 0.5875961, -1.080267, 1, 0.4745098, 0, 1,
-1.444278, 0.5309235, -1.440031, 1, 0.4784314, 0, 1,
-1.443634, 0.3232147, -2.581074, 1, 0.4862745, 0, 1,
-1.441936, -1.459679, -2.068245, 1, 0.4901961, 0, 1,
-1.429346, -1.820672, -2.824553, 1, 0.4980392, 0, 1,
-1.417266, 2.053791, -0.1897783, 1, 0.5058824, 0, 1,
-1.405756, 0.8364749, 0.5206373, 1, 0.509804, 0, 1,
-1.404075, -1.200954, -3.485619, 1, 0.5176471, 0, 1,
-1.401739, 0.6182132, -0.6889936, 1, 0.5215687, 0, 1,
-1.399746, 1.087999, -1.64281, 1, 0.5294118, 0, 1,
-1.37862, 2.062381, -1.938798, 1, 0.5333334, 0, 1,
-1.373395, 1.003224, -0.5373197, 1, 0.5411765, 0, 1,
-1.37067, -0.06033146, -1.975562, 1, 0.5450981, 0, 1,
-1.36002, -0.3914256, -1.857878, 1, 0.5529412, 0, 1,
-1.345493, 0.3307799, -0.9351236, 1, 0.5568628, 0, 1,
-1.344179, 1.848253, -1.084932, 1, 0.5647059, 0, 1,
-1.33858, 2.140467, 0.702611, 1, 0.5686275, 0, 1,
-1.334538, -2.148076, -2.918756, 1, 0.5764706, 0, 1,
-1.323407, 0.9390236, -0.6599975, 1, 0.5803922, 0, 1,
-1.321335, 1.140493, -0.3986617, 1, 0.5882353, 0, 1,
-1.317701, -0.3012336, -1.618701, 1, 0.5921569, 0, 1,
-1.31325, 0.4249517, -3.103591, 1, 0.6, 0, 1,
-1.302044, 0.3438071, -0.4223714, 1, 0.6078432, 0, 1,
-1.294385, -1.320574, -3.26268, 1, 0.6117647, 0, 1,
-1.28289, 2.429454, -1.794347, 1, 0.6196079, 0, 1,
-1.27929, 1.22523, -1.152391, 1, 0.6235294, 0, 1,
-1.266332, 1.404954, -1.758414, 1, 0.6313726, 0, 1,
-1.260964, 0.7918077, 0.1331853, 1, 0.6352941, 0, 1,
-1.257117, -0.1277905, -1.72986, 1, 0.6431373, 0, 1,
-1.255792, -0.8297926, -3.53207, 1, 0.6470588, 0, 1,
-1.253463, 0.06471578, -3.102282, 1, 0.654902, 0, 1,
-1.251514, -0.2880203, -2.572152, 1, 0.6588235, 0, 1,
-1.246409, -0.2458992, -2.323175, 1, 0.6666667, 0, 1,
-1.234784, 1.781209, -2.562751, 1, 0.6705883, 0, 1,
-1.222646, 1.414008, -2.024271, 1, 0.6784314, 0, 1,
-1.222301, 1.232117, -0.4364141, 1, 0.682353, 0, 1,
-1.221741, 0.9372123, -0.7286462, 1, 0.6901961, 0, 1,
-1.197289, -0.1186673, -3.294679, 1, 0.6941177, 0, 1,
-1.197202, 0.1911954, -2.169485, 1, 0.7019608, 0, 1,
-1.193003, 0.81555, -1.704285, 1, 0.7098039, 0, 1,
-1.192519, -0.2361101, -2.086722, 1, 0.7137255, 0, 1,
-1.187682, -0.5764782, -3.415261, 1, 0.7215686, 0, 1,
-1.184053, 0.5401438, -1.498646, 1, 0.7254902, 0, 1,
-1.183023, 0.5986914, -0.9327505, 1, 0.7333333, 0, 1,
-1.181927, -0.6669609, -1.643724, 1, 0.7372549, 0, 1,
-1.179611, -0.2249442, -1.721327, 1, 0.7450981, 0, 1,
-1.177604, 0.2086809, 0.7104716, 1, 0.7490196, 0, 1,
-1.17455, -0.4581199, -0.6419367, 1, 0.7568628, 0, 1,
-1.17126, -1.244786, -0.4755052, 1, 0.7607843, 0, 1,
-1.166297, -0.1897908, -2.380982, 1, 0.7686275, 0, 1,
-1.164888, -0.4555693, -1.629439, 1, 0.772549, 0, 1,
-1.162097, -0.5896408, -1.558847, 1, 0.7803922, 0, 1,
-1.159695, -0.4005659, -1.476804, 1, 0.7843137, 0, 1,
-1.157567, 0.2854569, -0.292034, 1, 0.7921569, 0, 1,
-1.157198, -0.07179418, -1.34173, 1, 0.7960784, 0, 1,
-1.153013, -1.137601, -2.087791, 1, 0.8039216, 0, 1,
-1.151744, -1.077942, -2.010119, 1, 0.8117647, 0, 1,
-1.151742, 0.3252612, -1.892817, 1, 0.8156863, 0, 1,
-1.139333, 0.3960321, -1.519687, 1, 0.8235294, 0, 1,
-1.139296, -0.07098689, -2.204744, 1, 0.827451, 0, 1,
-1.137011, -0.5683446, -3.522817, 1, 0.8352941, 0, 1,
-1.135651, 0.3227669, -1.397676, 1, 0.8392157, 0, 1,
-1.133435, 1.571392, -2.213415, 1, 0.8470588, 0, 1,
-1.126395, -0.6733916, -2.649594, 1, 0.8509804, 0, 1,
-1.124278, -0.9595202, -1.866019, 1, 0.8588235, 0, 1,
-1.119297, 0.4283647, -0.8625909, 1, 0.8627451, 0, 1,
-1.118185, -1.12908, -1.358491, 1, 0.8705882, 0, 1,
-1.11797, -0.6045089, -2.922032, 1, 0.8745098, 0, 1,
-1.110666, 1.520983, -0.7885646, 1, 0.8823529, 0, 1,
-1.108382, -0.8701428, -2.31128, 1, 0.8862745, 0, 1,
-1.105829, -0.00509569, 0.5289053, 1, 0.8941177, 0, 1,
-1.104375, 0.09328874, -1.270832, 1, 0.8980392, 0, 1,
-1.101194, -0.8247945, -0.8338657, 1, 0.9058824, 0, 1,
-1.095991, 0.8991442, 0.1962398, 1, 0.9137255, 0, 1,
-1.080923, 1.025025, 0.04183435, 1, 0.9176471, 0, 1,
-1.079544, -0.991073, -1.218428, 1, 0.9254902, 0, 1,
-1.073872, 0.9634603, -1.31437, 1, 0.9294118, 0, 1,
-1.071102, -0.798891, -1.760993, 1, 0.9372549, 0, 1,
-1.068382, 0.3331975, -1.530224, 1, 0.9411765, 0, 1,
-1.061588, 0.9546099, 0.101732, 1, 0.9490196, 0, 1,
-1.0598, -0.6465061, -1.624023, 1, 0.9529412, 0, 1,
-1.050456, -0.04946279, -2.103021, 1, 0.9607843, 0, 1,
-1.046929, -2.753142, -3.134528, 1, 0.9647059, 0, 1,
-1.044642, -0.9252391, -3.179508, 1, 0.972549, 0, 1,
-1.04232, -0.7408553, -1.27908, 1, 0.9764706, 0, 1,
-1.041364, -0.3636261, -0.9435779, 1, 0.9843137, 0, 1,
-1.032881, -0.4763249, -1.943822, 1, 0.9882353, 0, 1,
-1.023559, 0.3025734, -1.770737, 1, 0.9960784, 0, 1,
-1.020554, -1.795787, -2.024229, 0.9960784, 1, 0, 1,
-1.017642, 0.2327805, 0.1957508, 0.9921569, 1, 0, 1,
-1.017322, 0.6598806, -1.468308, 0.9843137, 1, 0, 1,
-1.010729, 0.5952887, -2.995916, 0.9803922, 1, 0, 1,
-1.00991, 0.3272585, -4.104108, 0.972549, 1, 0, 1,
-1.008289, 0.4411916, -0.9164651, 0.9686275, 1, 0, 1,
-1.006383, -0.8132081, -0.7485111, 0.9607843, 1, 0, 1,
-0.995954, -1.570722, -0.6971461, 0.9568627, 1, 0, 1,
-0.9954255, 0.9631792, 0.358631, 0.9490196, 1, 0, 1,
-0.9866713, 0.9712633, -0.2426569, 0.945098, 1, 0, 1,
-0.9770986, 1.073682, -0.6056401, 0.9372549, 1, 0, 1,
-0.9627705, -0.8767011, -2.180293, 0.9333333, 1, 0, 1,
-0.9623001, -1.287141, -3.285474, 0.9254902, 1, 0, 1,
-0.9618964, 0.5953161, -0.93945, 0.9215686, 1, 0, 1,
-0.9586165, -0.7235599, -2.697885, 0.9137255, 1, 0, 1,
-0.9579222, 0.7415861, -2.389599, 0.9098039, 1, 0, 1,
-0.9569454, -0.3160617, -3.660353, 0.9019608, 1, 0, 1,
-0.9562119, 0.898142, -0.7598379, 0.8941177, 1, 0, 1,
-0.9557771, -0.8559635, -2.036502, 0.8901961, 1, 0, 1,
-0.9534151, -1.412547, -3.104199, 0.8823529, 1, 0, 1,
-0.9490055, -1.166532, -1.155684, 0.8784314, 1, 0, 1,
-0.9465968, -1.876756, -1.363852, 0.8705882, 1, 0, 1,
-0.9434929, 0.1937145, 0.6694867, 0.8666667, 1, 0, 1,
-0.9377305, 0.1674078, -0.9470395, 0.8588235, 1, 0, 1,
-0.9318495, 0.7038292, -1.225793, 0.854902, 1, 0, 1,
-0.9277174, -0.3179961, -0.08126052, 0.8470588, 1, 0, 1,
-0.9241977, 0.9431966, -0.3898243, 0.8431373, 1, 0, 1,
-0.9226291, -0.2634691, -1.43072, 0.8352941, 1, 0, 1,
-0.9204845, 1.39026, -0.156965, 0.8313726, 1, 0, 1,
-0.9152926, 0.2375531, -0.7291016, 0.8235294, 1, 0, 1,
-0.9143496, -0.1705388, -2.620291, 0.8196079, 1, 0, 1,
-0.9135714, 1.817814, 0.2150805, 0.8117647, 1, 0, 1,
-0.9132527, -0.450721, -1.913539, 0.8078431, 1, 0, 1,
-0.9094373, -1.859888, -3.111121, 0.8, 1, 0, 1,
-0.9060836, 0.2164398, -2.225244, 0.7921569, 1, 0, 1,
-0.9048206, -0.3990582, -1.251564, 0.7882353, 1, 0, 1,
-0.9008206, -1.719141, -3.338665, 0.7803922, 1, 0, 1,
-0.8967257, -0.9655796, -2.315614, 0.7764706, 1, 0, 1,
-0.8939217, -1.254938, -2.148813, 0.7686275, 1, 0, 1,
-0.8925453, 0.3976122, -0.9476203, 0.7647059, 1, 0, 1,
-0.8879731, 1.523668, -0.6870543, 0.7568628, 1, 0, 1,
-0.882164, -1.188243, -1.760865, 0.7529412, 1, 0, 1,
-0.8598587, 0.6757452, -3.725328, 0.7450981, 1, 0, 1,
-0.858709, -0.1348851, -2.519126, 0.7411765, 1, 0, 1,
-0.8580491, -0.7733773, -1.771203, 0.7333333, 1, 0, 1,
-0.853204, 0.3689362, -1.988517, 0.7294118, 1, 0, 1,
-0.8516041, 0.1011962, -1.582777, 0.7215686, 1, 0, 1,
-0.8497893, -1.605103, -3.261333, 0.7176471, 1, 0, 1,
-0.8477665, 0.1889471, -1.312952, 0.7098039, 1, 0, 1,
-0.84266, -0.7995148, -1.386962, 0.7058824, 1, 0, 1,
-0.8408014, 0.7218832, -1.171181, 0.6980392, 1, 0, 1,
-0.8339543, -0.7173283, -4.195221, 0.6901961, 1, 0, 1,
-0.8291513, -0.8332445, -1.674392, 0.6862745, 1, 0, 1,
-0.828782, 1.283565, 0.78971, 0.6784314, 1, 0, 1,
-0.8275826, -0.3667911, -1.49991, 0.6745098, 1, 0, 1,
-0.8249764, -0.3114006, -2.957277, 0.6666667, 1, 0, 1,
-0.8244526, 0.5278554, 0.2022066, 0.6627451, 1, 0, 1,
-0.8232738, 1.214658, -1.366472, 0.654902, 1, 0, 1,
-0.8220934, -0.9260673, -2.15149, 0.6509804, 1, 0, 1,
-0.8217019, 0.5564775, -0.5475764, 0.6431373, 1, 0, 1,
-0.8215178, -0.1915677, -1.360551, 0.6392157, 1, 0, 1,
-0.8176103, -1.772418, -1.603758, 0.6313726, 1, 0, 1,
-0.8164817, -0.1670693, -3.726886, 0.627451, 1, 0, 1,
-0.8113102, 0.2319017, -1.16473, 0.6196079, 1, 0, 1,
-0.8100829, 0.1315151, -1.329398, 0.6156863, 1, 0, 1,
-0.8062133, 0.3884549, -2.822888, 0.6078432, 1, 0, 1,
-0.7991287, -0.9828464, -3.047191, 0.6039216, 1, 0, 1,
-0.7958354, 0.2916345, -1.322376, 0.5960785, 1, 0, 1,
-0.7885429, -0.3559109, -2.791008, 0.5882353, 1, 0, 1,
-0.773551, 1.289436, -1.013678, 0.5843138, 1, 0, 1,
-0.7687315, -0.5202447, -0.1598664, 0.5764706, 1, 0, 1,
-0.7661151, 1.736236, -0.007148245, 0.572549, 1, 0, 1,
-0.7649907, 1.323846, -1.377769, 0.5647059, 1, 0, 1,
-0.7587363, -0.363232, -2.834337, 0.5607843, 1, 0, 1,
-0.7537565, 0.7250351, -2.059399, 0.5529412, 1, 0, 1,
-0.7533222, 0.6225902, 0.08419423, 0.5490196, 1, 0, 1,
-0.7529028, -0.7986627, -0.3095195, 0.5411765, 1, 0, 1,
-0.7522135, 0.1134565, -1.617621, 0.5372549, 1, 0, 1,
-0.7507009, 0.08895714, -0.1912736, 0.5294118, 1, 0, 1,
-0.7446256, -1.641071, -2.391155, 0.5254902, 1, 0, 1,
-0.7369223, -0.1456082, -1.990677, 0.5176471, 1, 0, 1,
-0.7338724, 1.459322, -1.240686, 0.5137255, 1, 0, 1,
-0.7327362, -0.5069513, -0.7802612, 0.5058824, 1, 0, 1,
-0.7297671, 1.066063, -2.452937, 0.5019608, 1, 0, 1,
-0.7280491, 0.1010436, 0.2317263, 0.4941176, 1, 0, 1,
-0.724415, -1.494547, -4.097747, 0.4862745, 1, 0, 1,
-0.7163352, -0.9833267, -1.94439, 0.4823529, 1, 0, 1,
-0.7119451, 0.8223424, -0.8628432, 0.4745098, 1, 0, 1,
-0.7103918, 0.3938209, -2.407524, 0.4705882, 1, 0, 1,
-0.7094793, 0.7129923, -0.2985156, 0.4627451, 1, 0, 1,
-0.7060373, 1.091255, -0.6206864, 0.4588235, 1, 0, 1,
-0.7051302, -1.570997, -2.477775, 0.4509804, 1, 0, 1,
-0.7031629, -1.223869, -2.503472, 0.4470588, 1, 0, 1,
-0.6996247, -0.5649769, -3.237473, 0.4392157, 1, 0, 1,
-0.6994441, -1.203671, -2.780426, 0.4352941, 1, 0, 1,
-0.697126, 1.135876, 0.2536229, 0.427451, 1, 0, 1,
-0.6969291, -0.2884866, -2.889137, 0.4235294, 1, 0, 1,
-0.6934389, 1.686366, 1.315546, 0.4156863, 1, 0, 1,
-0.6900998, -0.86785, 0.3040096, 0.4117647, 1, 0, 1,
-0.6891565, -1.586987, -2.094254, 0.4039216, 1, 0, 1,
-0.6874341, 0.9105124, -1.213896, 0.3960784, 1, 0, 1,
-0.68716, 0.2345659, -2.103889, 0.3921569, 1, 0, 1,
-0.6862003, 0.3525364, -0.9248459, 0.3843137, 1, 0, 1,
-0.6855888, -0.7151929, -1.65697, 0.3803922, 1, 0, 1,
-0.684328, -0.03652304, -1.215486, 0.372549, 1, 0, 1,
-0.6805907, -0.189234, -2.559596, 0.3686275, 1, 0, 1,
-0.671548, 2.600996, -0.5696822, 0.3607843, 1, 0, 1,
-0.6699539, 1.485861, 0.9092913, 0.3568628, 1, 0, 1,
-0.6679595, -0.4788187, -0.7642837, 0.3490196, 1, 0, 1,
-0.6646925, 0.9318249, -2.136191, 0.345098, 1, 0, 1,
-0.6569567, 0.5845454, -0.4679339, 0.3372549, 1, 0, 1,
-0.6512046, -0.9046915, -2.202456, 0.3333333, 1, 0, 1,
-0.6497421, -0.5009906, -2.012794, 0.3254902, 1, 0, 1,
-0.6494805, -1.123514, -1.194239, 0.3215686, 1, 0, 1,
-0.6494131, -0.06419884, -1.602311, 0.3137255, 1, 0, 1,
-0.6493568, -0.5938863, -0.770999, 0.3098039, 1, 0, 1,
-0.6475242, -0.4483915, -1.978273, 0.3019608, 1, 0, 1,
-0.6474128, -0.5740885, -2.096434, 0.2941177, 1, 0, 1,
-0.6460754, -0.2559445, -3.015941, 0.2901961, 1, 0, 1,
-0.6457526, 0.1417117, -1.245489, 0.282353, 1, 0, 1,
-0.6447783, -0.2012659, -2.557645, 0.2784314, 1, 0, 1,
-0.6426349, -0.1622166, -2.092277, 0.2705882, 1, 0, 1,
-0.6389477, 0.564141, -1.489562, 0.2666667, 1, 0, 1,
-0.6344788, -0.1509954, -2.643135, 0.2588235, 1, 0, 1,
-0.6340839, -1.148867, -1.045274, 0.254902, 1, 0, 1,
-0.6339749, 0.4307563, -1.073614, 0.2470588, 1, 0, 1,
-0.6253215, 0.8336495, 0.194449, 0.2431373, 1, 0, 1,
-0.6242735, -0.1114828, -4.880182, 0.2352941, 1, 0, 1,
-0.6198664, 0.2905857, -1.474409, 0.2313726, 1, 0, 1,
-0.6191233, -0.2071136, 0.4522275, 0.2235294, 1, 0, 1,
-0.6105758, 0.3111156, -0.6274893, 0.2196078, 1, 0, 1,
-0.6080859, 1.980807, -1.019977, 0.2117647, 1, 0, 1,
-0.6060988, -0.01425583, -2.259866, 0.2078431, 1, 0, 1,
-0.6058166, -0.4315699, -2.331743, 0.2, 1, 0, 1,
-0.6037093, 0.2704302, 0.9288486, 0.1921569, 1, 0, 1,
-0.6025071, 1.187899, 1.687018, 0.1882353, 1, 0, 1,
-0.5967358, 0.1895598, -1.224917, 0.1803922, 1, 0, 1,
-0.5957422, -0.1604935, -1.750428, 0.1764706, 1, 0, 1,
-0.5912625, -0.01464946, -1.549454, 0.1686275, 1, 0, 1,
-0.5886432, 1.115284, 0.5932078, 0.1647059, 1, 0, 1,
-0.5810459, 0.1735998, 0.1569758, 0.1568628, 1, 0, 1,
-0.577598, 0.01018222, -3.200943, 0.1529412, 1, 0, 1,
-0.5733587, 0.1110765, -0.4805724, 0.145098, 1, 0, 1,
-0.5681725, -0.8100685, -3.223368, 0.1411765, 1, 0, 1,
-0.5658014, 1.486901, -0.7737866, 0.1333333, 1, 0, 1,
-0.5596996, -0.5887552, -1.70474, 0.1294118, 1, 0, 1,
-0.5590196, -1.594348, -1.463591, 0.1215686, 1, 0, 1,
-0.5573583, -0.6336765, -0.9517446, 0.1176471, 1, 0, 1,
-0.5560334, 1.386581, 0.2560654, 0.1098039, 1, 0, 1,
-0.5559875, -0.876654, -1.299426, 0.1058824, 1, 0, 1,
-0.5471634, 0.8636243, -1.272136, 0.09803922, 1, 0, 1,
-0.5326829, 1.004257, -0.549717, 0.09019608, 1, 0, 1,
-0.5294046, -0.4467103, -1.086048, 0.08627451, 1, 0, 1,
-0.5247766, -1.15214, -2.947794, 0.07843138, 1, 0, 1,
-0.5240018, 1.046624, -0.9762543, 0.07450981, 1, 0, 1,
-0.5147707, -0.9677995, -3.445098, 0.06666667, 1, 0, 1,
-0.5097494, -0.8142337, -2.806135, 0.0627451, 1, 0, 1,
-0.5073239, -0.9519358, -1.779859, 0.05490196, 1, 0, 1,
-0.4973183, -0.1981153, -1.143378, 0.05098039, 1, 0, 1,
-0.4964686, 0.80736, -1.72757, 0.04313726, 1, 0, 1,
-0.4904127, -1.862001, -4.472103, 0.03921569, 1, 0, 1,
-0.4829568, 0.4310001, -0.3289691, 0.03137255, 1, 0, 1,
-0.4800986, 0.4469849, 0.3625182, 0.02745098, 1, 0, 1,
-0.4751128, 1.149684, -1.626385, 0.01960784, 1, 0, 1,
-0.4692712, -1.082739, -1.804437, 0.01568628, 1, 0, 1,
-0.46628, -0.08490017, -1.5497, 0.007843138, 1, 0, 1,
-0.4563638, -1.517155, -1.684828, 0.003921569, 1, 0, 1,
-0.4514917, 0.2032638, -0.58806, 0, 1, 0.003921569, 1,
-0.451362, 1.609809, -1.496148, 0, 1, 0.01176471, 1,
-0.4424927, -0.5343424, -0.1124764, 0, 1, 0.01568628, 1,
-0.4408079, -0.6991171, -2.584423, 0, 1, 0.02352941, 1,
-0.4390017, 0.03343622, -1.679054, 0, 1, 0.02745098, 1,
-0.4365714, 1.129182, -1.557726, 0, 1, 0.03529412, 1,
-0.4347252, -0.8673108, -4.909716, 0, 1, 0.03921569, 1,
-0.4343581, 0.2342188, -2.126944, 0, 1, 0.04705882, 1,
-0.4335841, 1.650483, -2.001487, 0, 1, 0.05098039, 1,
-0.433469, -0.08199951, -2.107948, 0, 1, 0.05882353, 1,
-0.4307306, -0.5142175, -3.443362, 0, 1, 0.0627451, 1,
-0.4249963, 0.9114186, -0.3774726, 0, 1, 0.07058824, 1,
-0.4129239, 0.4649513, -2.001252, 0, 1, 0.07450981, 1,
-0.4115924, 0.3319796, -0.304887, 0, 1, 0.08235294, 1,
-0.4079442, -1.081957, -3.783545, 0, 1, 0.08627451, 1,
-0.4057334, 1.013867, -0.3802764, 0, 1, 0.09411765, 1,
-0.4016661, 0.9547406, -0.3453313, 0, 1, 0.1019608, 1,
-0.3992562, 0.5524944, -1.590738, 0, 1, 0.1058824, 1,
-0.3991686, 0.3130113, -2.794181, 0, 1, 0.1137255, 1,
-0.3949313, 0.2512576, -1.465043, 0, 1, 0.1176471, 1,
-0.3917069, 1.490227, -0.4015374, 0, 1, 0.1254902, 1,
-0.3910393, 0.1763181, -3.487768, 0, 1, 0.1294118, 1,
-0.3897145, 1.444164, -0.4081591, 0, 1, 0.1372549, 1,
-0.3877774, -1.367285, -4.018043, 0, 1, 0.1411765, 1,
-0.3790314, 0.09743313, 0.1344899, 0, 1, 0.1490196, 1,
-0.3785622, -1.555623, -3.874077, 0, 1, 0.1529412, 1,
-0.3764501, -1.099393, -3.365655, 0, 1, 0.1607843, 1,
-0.3763225, 0.1710689, -1.152336, 0, 1, 0.1647059, 1,
-0.3709454, -0.4717642, -3.05251, 0, 1, 0.172549, 1,
-0.3645261, 0.6154916, -0.2283172, 0, 1, 0.1764706, 1,
-0.3616448, 2.21429, -1.221124, 0, 1, 0.1843137, 1,
-0.355007, 1.165717, -0.8887658, 0, 1, 0.1882353, 1,
-0.3492121, 0.7331917, -0.3779477, 0, 1, 0.1960784, 1,
-0.3453894, -0.3732215, 0.200172, 0, 1, 0.2039216, 1,
-0.3443457, 2.782233, 0.2544811, 0, 1, 0.2078431, 1,
-0.3350784, 0.5978113, -1.345677, 0, 1, 0.2156863, 1,
-0.3283621, 0.9191973, -1.339955, 0, 1, 0.2196078, 1,
-0.3276131, 1.183818, 0.08163392, 0, 1, 0.227451, 1,
-0.3266543, -0.3123753, -1.922881, 0, 1, 0.2313726, 1,
-0.3257494, 0.3804939, -2.934245, 0, 1, 0.2392157, 1,
-0.3227747, 0.6354686, -0.6116286, 0, 1, 0.2431373, 1,
-0.3212302, -1.787108, -1.803942, 0, 1, 0.2509804, 1,
-0.3193194, 1.324378, -0.340794, 0, 1, 0.254902, 1,
-0.3148363, 0.6084448, -0.9187356, 0, 1, 0.2627451, 1,
-0.3144724, -0.4059597, -4.651888, 0, 1, 0.2666667, 1,
-0.311561, -0.231427, -0.6173291, 0, 1, 0.2745098, 1,
-0.3113845, 0.2736803, -1.001435, 0, 1, 0.2784314, 1,
-0.3107703, 2.136735, -0.001541673, 0, 1, 0.2862745, 1,
-0.3068004, 0.3068949, -0.4252984, 0, 1, 0.2901961, 1,
-0.3048683, -0.3025177, -2.103356, 0, 1, 0.2980392, 1,
-0.3005123, -1.062352, -2.678293, 0, 1, 0.3058824, 1,
-0.29916, -0.5731195, -0.5525863, 0, 1, 0.3098039, 1,
-0.2975232, -0.2861178, -2.712364, 0, 1, 0.3176471, 1,
-0.2966328, 0.6625488, 0.6413094, 0, 1, 0.3215686, 1,
-0.2880934, -0.9908559, -4.124714, 0, 1, 0.3294118, 1,
-0.2846077, -0.6227606, -4.155637, 0, 1, 0.3333333, 1,
-0.2842077, 0.7774608, -0.6418427, 0, 1, 0.3411765, 1,
-0.2820685, -0.680004, -2.751841, 0, 1, 0.345098, 1,
-0.2787013, 0.3940905, -1.501652, 0, 1, 0.3529412, 1,
-0.270783, -1.181075, -3.121499, 0, 1, 0.3568628, 1,
-0.2672441, 0.1577531, -1.642945, 0, 1, 0.3647059, 1,
-0.2606847, 0.6933437, -0.2757418, 0, 1, 0.3686275, 1,
-0.2591088, 2.163209, -0.6958348, 0, 1, 0.3764706, 1,
-0.2561001, 1.728816, 0.4062571, 0, 1, 0.3803922, 1,
-0.2515513, 0.7917492, -0.799028, 0, 1, 0.3882353, 1,
-0.251141, 0.342078, -1.339824, 0, 1, 0.3921569, 1,
-0.2493799, -1.956109, -4.106692, 0, 1, 0.4, 1,
-0.24738, 1.777298, -0.8196179, 0, 1, 0.4078431, 1,
-0.2460252, 1.239536, -1.052694, 0, 1, 0.4117647, 1,
-0.2452269, 1.101716, -1.029115, 0, 1, 0.4196078, 1,
-0.2444982, 0.6268141, -1.269431, 0, 1, 0.4235294, 1,
-0.243993, -0.1069013, -4.004081, 0, 1, 0.4313726, 1,
-0.2436606, -1.446922, -2.600184, 0, 1, 0.4352941, 1,
-0.2418292, 0.4525343, -1.647714, 0, 1, 0.4431373, 1,
-0.2401537, -0.2366546, -2.866835, 0, 1, 0.4470588, 1,
-0.2392594, 0.5405374, -0.5724683, 0, 1, 0.454902, 1,
-0.2335474, 1.057777, 0.9888456, 0, 1, 0.4588235, 1,
-0.2324415, -0.523868, -1.052044, 0, 1, 0.4666667, 1,
-0.2310332, -0.3057348, -3.465142, 0, 1, 0.4705882, 1,
-0.2305986, 0.9753293, -0.371366, 0, 1, 0.4784314, 1,
-0.2262102, 1.399272, 0.7713018, 0, 1, 0.4823529, 1,
-0.2208429, -0.411036, -3.520342, 0, 1, 0.4901961, 1,
-0.2140739, 1.880177, 0.3710919, 0, 1, 0.4941176, 1,
-0.2023909, -2.058477, -2.777373, 0, 1, 0.5019608, 1,
-0.2013819, 1.169261, -1.500627, 0, 1, 0.509804, 1,
-0.194449, 0.9545186, -0.9505622, 0, 1, 0.5137255, 1,
-0.1919859, -0.9159604, -3.563649, 0, 1, 0.5215687, 1,
-0.1893777, 0.06272858, -1.474442, 0, 1, 0.5254902, 1,
-0.1878112, 0.2354878, -0.7260134, 0, 1, 0.5333334, 1,
-0.1874456, -0.33433, -1.047017, 0, 1, 0.5372549, 1,
-0.1861919, 0.01748797, -2.774295, 0, 1, 0.5450981, 1,
-0.1827593, -0.07921425, -2.263272, 0, 1, 0.5490196, 1,
-0.1799742, -0.4158608, -2.224598, 0, 1, 0.5568628, 1,
-0.1783237, -1.16699, -1.904788, 0, 1, 0.5607843, 1,
-0.1781645, -0.8365174, -3.203565, 0, 1, 0.5686275, 1,
-0.1778281, -1.107777, -2.424576, 0, 1, 0.572549, 1,
-0.1651135, -0.6823239, -2.152367, 0, 1, 0.5803922, 1,
-0.1643724, 1.182021, 0.5226656, 0, 1, 0.5843138, 1,
-0.1641551, -2.051137, -4.038391, 0, 1, 0.5921569, 1,
-0.1638039, 0.4285467, 1.644794, 0, 1, 0.5960785, 1,
-0.1620902, -0.80292, -3.303885, 0, 1, 0.6039216, 1,
-0.1617035, -0.02276796, -2.082042, 0, 1, 0.6117647, 1,
-0.1612851, -2.076875, -1.813017, 0, 1, 0.6156863, 1,
-0.153969, -0.2317942, -4.643033, 0, 1, 0.6235294, 1,
-0.1524588, 0.7452406, -0.4369558, 0, 1, 0.627451, 1,
-0.1478411, 0.857244, 1.068907, 0, 1, 0.6352941, 1,
-0.140796, 0.3679546, -0.9944736, 0, 1, 0.6392157, 1,
-0.1399937, 0.2571629, -0.2849925, 0, 1, 0.6470588, 1,
-0.1379354, 1.168534, -0.2997443, 0, 1, 0.6509804, 1,
-0.1373781, 0.5017314, -0.08882846, 0, 1, 0.6588235, 1,
-0.1327466, -1.894061, -4.327414, 0, 1, 0.6627451, 1,
-0.127434, 0.6419786, -0.3366005, 0, 1, 0.6705883, 1,
-0.1274122, 0.05846528, -1.376655, 0, 1, 0.6745098, 1,
-0.1261377, -1.624201, -2.619201, 0, 1, 0.682353, 1,
-0.1259511, 0.642484, -0.2418033, 0, 1, 0.6862745, 1,
-0.1220218, -1.226161, -3.337513, 0, 1, 0.6941177, 1,
-0.1212353, -2.731958, -3.102037, 0, 1, 0.7019608, 1,
-0.119438, -1.059482, -4.491421, 0, 1, 0.7058824, 1,
-0.1180406, 1.803527, 1.35612, 0, 1, 0.7137255, 1,
-0.1179415, 0.5505039, -1.026781, 0, 1, 0.7176471, 1,
-0.1143855, -0.04814567, -1.365415, 0, 1, 0.7254902, 1,
-0.1119177, 0.5882975, -1.157985, 0, 1, 0.7294118, 1,
-0.1106002, -1.332368, -1.413314, 0, 1, 0.7372549, 1,
-0.1090549, 0.2906045, -0.8633536, 0, 1, 0.7411765, 1,
-0.1068614, -2.102272, -2.837423, 0, 1, 0.7490196, 1,
-0.1044474, -1.485965, -3.214784, 0, 1, 0.7529412, 1,
-0.09947906, -1.888174, -4.344976, 0, 1, 0.7607843, 1,
-0.09683512, 0.2417028, -1.340958, 0, 1, 0.7647059, 1,
-0.09273506, -0.6831189, -3.514672, 0, 1, 0.772549, 1,
-0.09148686, 0.1357003, -1.195871, 0, 1, 0.7764706, 1,
-0.09099371, -0.4778296, -4.023363, 0, 1, 0.7843137, 1,
-0.08008811, 1.147559, 0.4307393, 0, 1, 0.7882353, 1,
-0.07957695, 0.8167679, -0.618527, 0, 1, 0.7960784, 1,
-0.07939831, -1.168557, -2.889246, 0, 1, 0.8039216, 1,
-0.07780688, 0.1738554, -1.287726, 0, 1, 0.8078431, 1,
-0.07568339, 0.5335182, 1.819239, 0, 1, 0.8156863, 1,
-0.06925011, -0.1859865, -3.32501, 0, 1, 0.8196079, 1,
-0.06924202, -1.295071, -1.551548, 0, 1, 0.827451, 1,
-0.06783011, -0.2979683, -3.156835, 0, 1, 0.8313726, 1,
-0.06568495, -0.03044579, -1.256302, 0, 1, 0.8392157, 1,
-0.06328464, -0.4679971, -1.36525, 0, 1, 0.8431373, 1,
-0.06259382, 1.129545, -0.5694664, 0, 1, 0.8509804, 1,
-0.06126752, -0.5633474, -1.791889, 0, 1, 0.854902, 1,
-0.06112888, 0.940739, 1.825857, 0, 1, 0.8627451, 1,
-0.06090437, -0.5602659, -1.810916, 0, 1, 0.8666667, 1,
-0.05956577, -1.261986, -1.421614, 0, 1, 0.8745098, 1,
-0.05936664, 0.6219298, 0.6475186, 0, 1, 0.8784314, 1,
-0.05753454, -0.404548, -3.775389, 0, 1, 0.8862745, 1,
-0.05326929, -0.953935, -3.42428, 0, 1, 0.8901961, 1,
-0.05001609, -0.2843498, -1.553585, 0, 1, 0.8980392, 1,
-0.04818048, -1.050367, -3.730292, 0, 1, 0.9058824, 1,
-0.0368791, -0.6719163, -2.546554, 0, 1, 0.9098039, 1,
-0.03605116, -0.3004707, -3.958778, 0, 1, 0.9176471, 1,
-0.03602171, 1.342224, -0.2790689, 0, 1, 0.9215686, 1,
-0.03401614, 0.4915054, -0.720401, 0, 1, 0.9294118, 1,
-0.03358201, 1.266019, 1.551576, 0, 1, 0.9333333, 1,
-0.03147764, 0.04586668, -1.243833, 0, 1, 0.9411765, 1,
-0.03053387, -0.4291634, -3.399003, 0, 1, 0.945098, 1,
-0.02947913, 0.6073087, 0.723971, 0, 1, 0.9529412, 1,
-0.02817393, 0.9833376, 1.362985, 0, 1, 0.9568627, 1,
-0.02724801, 0.3853431, -1.216214, 0, 1, 0.9647059, 1,
-0.01982162, -1.417213, -3.317085, 0, 1, 0.9686275, 1,
-0.009826182, 1.771324, -2.091285, 0, 1, 0.9764706, 1,
-0.008123509, 0.2181696, 0.5785826, 0, 1, 0.9803922, 1,
0.0009839393, -1.005288, 3.219936, 0, 1, 0.9882353, 1,
0.002619349, -1.145192, 2.001963, 0, 1, 0.9921569, 1,
0.007788694, 1.416545, -1.300269, 0, 1, 1, 1,
0.008574477, -0.4056861, 5.423523, 0, 0.9921569, 1, 1,
0.008848651, 0.8003933, 0.03178798, 0, 0.9882353, 1, 1,
0.01019099, 0.5511724, -0.8614734, 0, 0.9803922, 1, 1,
0.01593886, -1.586825, 2.52474, 0, 0.9764706, 1, 1,
0.02079035, 1.413886, 0.09839262, 0, 0.9686275, 1, 1,
0.02788016, 0.9582274, 1.312952, 0, 0.9647059, 1, 1,
0.03038288, 0.5217378, 0.3298163, 0, 0.9568627, 1, 1,
0.0311724, -0.6918463, 4.607067, 0, 0.9529412, 1, 1,
0.0314121, 0.3139885, -0.6977946, 0, 0.945098, 1, 1,
0.03569829, -0.3994263, 3.160649, 0, 0.9411765, 1, 1,
0.03979523, 0.03828711, -0.2974105, 0, 0.9333333, 1, 1,
0.03985427, 0.02611791, 3.070172, 0, 0.9294118, 1, 1,
0.04089133, 0.3345824, -0.1982318, 0, 0.9215686, 1, 1,
0.04093837, -1.55706, 3.975617, 0, 0.9176471, 1, 1,
0.0429677, 0.8088355, 1.284455, 0, 0.9098039, 1, 1,
0.04383978, -0.6997244, 2.520738, 0, 0.9058824, 1, 1,
0.04399625, -1.215129, 3.370621, 0, 0.8980392, 1, 1,
0.05060902, -0.516745, 1.982733, 0, 0.8901961, 1, 1,
0.05286067, -0.681935, 2.79767, 0, 0.8862745, 1, 1,
0.06207833, -0.7968708, 2.040824, 0, 0.8784314, 1, 1,
0.06228806, 0.8099076, 0.03849515, 0, 0.8745098, 1, 1,
0.06330568, -0.4110807, 3.060456, 0, 0.8666667, 1, 1,
0.06416928, 1.245712, 0.0389469, 0, 0.8627451, 1, 1,
0.07126881, -0.009269209, 1.333827, 0, 0.854902, 1, 1,
0.07212105, 0.215739, 0.05574293, 0, 0.8509804, 1, 1,
0.07218746, 0.5783998, -2.022318, 0, 0.8431373, 1, 1,
0.074858, 0.07065805, 0.778111, 0, 0.8392157, 1, 1,
0.07612562, 1.371312, -0.4339273, 0, 0.8313726, 1, 1,
0.07706719, -0.09680893, 2.24227, 0, 0.827451, 1, 1,
0.08366939, 1.796788, -0.07593512, 0, 0.8196079, 1, 1,
0.08734292, 1.016629, -0.1033206, 0, 0.8156863, 1, 1,
0.08910159, 0.7681373, -0.2746527, 0, 0.8078431, 1, 1,
0.09244838, 1.332839, -0.3390505, 0, 0.8039216, 1, 1,
0.09468976, -1.184948, 4.69506, 0, 0.7960784, 1, 1,
0.0950615, -0.2637463, -0.4615873, 0, 0.7882353, 1, 1,
0.09513492, 0.4676977, -1.101726, 0, 0.7843137, 1, 1,
0.09540936, 1.040474, 1.344507, 0, 0.7764706, 1, 1,
0.0966409, 0.3205599, 1.666475, 0, 0.772549, 1, 1,
0.101931, -0.8616953, 2.217215, 0, 0.7647059, 1, 1,
0.1021771, -0.2958258, 3.595812, 0, 0.7607843, 1, 1,
0.1037605, 0.2739748, 2.691918, 0, 0.7529412, 1, 1,
0.1051269, -0.3266194, 3.163823, 0, 0.7490196, 1, 1,
0.105799, 0.6691853, 1.460234, 0, 0.7411765, 1, 1,
0.110013, -1.168089, 2.710412, 0, 0.7372549, 1, 1,
0.1127541, 0.5162688, 1.063115, 0, 0.7294118, 1, 1,
0.11366, -2.071848, 2.879927, 0, 0.7254902, 1, 1,
0.1160234, -0.6916355, 2.162947, 0, 0.7176471, 1, 1,
0.1192214, 0.2823331, -0.3137081, 0, 0.7137255, 1, 1,
0.1249269, -0.8341556, 3.021212, 0, 0.7058824, 1, 1,
0.1263143, -1.236213, 3.484387, 0, 0.6980392, 1, 1,
0.1268216, -0.8643767, 4.061284, 0, 0.6941177, 1, 1,
0.1273227, -0.7731982, 5.119438, 0, 0.6862745, 1, 1,
0.1311006, -0.2592736, 3.158134, 0, 0.682353, 1, 1,
0.1326064, -0.174178, 2.506424, 0, 0.6745098, 1, 1,
0.1381723, -2.603167, 1.283547, 0, 0.6705883, 1, 1,
0.1387487, 0.9130946, 0.8976802, 0, 0.6627451, 1, 1,
0.1411864, -1.308804, 4.666166, 0, 0.6588235, 1, 1,
0.1416068, 0.333771, 1.172936, 0, 0.6509804, 1, 1,
0.1455015, 0.6026552, -0.574202, 0, 0.6470588, 1, 1,
0.1469102, 0.9716508, -0.5789857, 0, 0.6392157, 1, 1,
0.1490245, 0.902409, 0.2423377, 0, 0.6352941, 1, 1,
0.1493864, -0.08835683, 1.027979, 0, 0.627451, 1, 1,
0.1505328, -2.238218, 1.627719, 0, 0.6235294, 1, 1,
0.1527573, 1.081862, 0.3848773, 0, 0.6156863, 1, 1,
0.159189, 0.9479643, -0.06824198, 0, 0.6117647, 1, 1,
0.1604375, 0.04662881, -0.4352463, 0, 0.6039216, 1, 1,
0.160621, 0.3184562, -1.168216, 0, 0.5960785, 1, 1,
0.1607138, -2.094848, 4.231225, 0, 0.5921569, 1, 1,
0.1647266, 0.6904501, -0.7581486, 0, 0.5843138, 1, 1,
0.1674865, 0.872057, 2.137912, 0, 0.5803922, 1, 1,
0.1684296, -0.04508303, 1.90118, 0, 0.572549, 1, 1,
0.1701726, 0.7551852, 0.3117204, 0, 0.5686275, 1, 1,
0.1717366, 1.269377, 1.381284, 0, 0.5607843, 1, 1,
0.1723061, 0.6600697, 0.9225203, 0, 0.5568628, 1, 1,
0.1740411, -0.4267609, 3.240832, 0, 0.5490196, 1, 1,
0.1875592, 0.3133751, 0.684667, 0, 0.5450981, 1, 1,
0.1910216, 0.4589699, 0.5590071, 0, 0.5372549, 1, 1,
0.1916326, 0.1524835, 0.7186144, 0, 0.5333334, 1, 1,
0.1932987, -0.6698968, 1.578712, 0, 0.5254902, 1, 1,
0.1968165, 0.8160162, -0.2828425, 0, 0.5215687, 1, 1,
0.1999256, -0.01494811, 2.538166, 0, 0.5137255, 1, 1,
0.2021168, 1.050036, 0.4890583, 0, 0.509804, 1, 1,
0.2032533, -0.7656093, 1.477357, 0, 0.5019608, 1, 1,
0.2057533, 0.4093704, 0.5920763, 0, 0.4941176, 1, 1,
0.2067367, 1.05492, 0.5068925, 0, 0.4901961, 1, 1,
0.2073624, 0.6388537, 1.037155, 0, 0.4823529, 1, 1,
0.208285, 0.07796312, 1.001381, 0, 0.4784314, 1, 1,
0.2144132, 1.79242, -0.2279496, 0, 0.4705882, 1, 1,
0.2194682, -0.7940645, 3.140135, 0, 0.4666667, 1, 1,
0.2240051, 1.037297, -0.4139805, 0, 0.4588235, 1, 1,
0.2261737, -0.2811024, 2.570218, 0, 0.454902, 1, 1,
0.2347128, -1.703633, 3.125699, 0, 0.4470588, 1, 1,
0.2402055, -0.04230518, 1.417488, 0, 0.4431373, 1, 1,
0.2454034, -2.744089, 1.744962, 0, 0.4352941, 1, 1,
0.2540871, -0.8145326, 2.69486, 0, 0.4313726, 1, 1,
0.2553589, -0.2280771, 1.939617, 0, 0.4235294, 1, 1,
0.2563495, 0.3503734, 0.4045854, 0, 0.4196078, 1, 1,
0.2584215, 0.7335277, 0.2507678, 0, 0.4117647, 1, 1,
0.2602906, 0.4446498, 1.736199, 0, 0.4078431, 1, 1,
0.2604967, 0.860449, 0.8615685, 0, 0.4, 1, 1,
0.2613881, 1.520557, 0.5289952, 0, 0.3921569, 1, 1,
0.262426, 1.126989, 0.4861447, 0, 0.3882353, 1, 1,
0.2636801, -1.173258, 2.89514, 0, 0.3803922, 1, 1,
0.2706776, 2.545926, 1.280246, 0, 0.3764706, 1, 1,
0.2738235, 1.254746, 0.8026595, 0, 0.3686275, 1, 1,
0.2759674, 0.8561451, -0.08015043, 0, 0.3647059, 1, 1,
0.281214, 1.139671, -1.339089, 0, 0.3568628, 1, 1,
0.2843894, 0.9977486, 0.2249124, 0, 0.3529412, 1, 1,
0.2901896, 0.2524421, 0.2761608, 0, 0.345098, 1, 1,
0.2909819, 3.502406, -0.1018841, 0, 0.3411765, 1, 1,
0.2914349, 0.3775145, 2.938455, 0, 0.3333333, 1, 1,
0.291703, -0.2611774, 0.06989941, 0, 0.3294118, 1, 1,
0.2924651, -0.7734703, 3.617629, 0, 0.3215686, 1, 1,
0.2958974, -0.8118862, 2.615687, 0, 0.3176471, 1, 1,
0.2990433, -0.5293738, 1.139107, 0, 0.3098039, 1, 1,
0.300146, -0.1436119, 2.603704, 0, 0.3058824, 1, 1,
0.3020853, 0.3380377, 0.4452975, 0, 0.2980392, 1, 1,
0.3042585, -1.789619, 3.485882, 0, 0.2901961, 1, 1,
0.3092763, 1.62914, 1.472622, 0, 0.2862745, 1, 1,
0.3136646, 0.9890839, 0.7865738, 0, 0.2784314, 1, 1,
0.3145671, 0.06805336, 1.197501, 0, 0.2745098, 1, 1,
0.3172554, -1.113492, 2.572569, 0, 0.2666667, 1, 1,
0.3202814, 1.008844, -0.405319, 0, 0.2627451, 1, 1,
0.3204335, -3.204785, 2.016527, 0, 0.254902, 1, 1,
0.3227155, 0.8930004, 0.7597291, 0, 0.2509804, 1, 1,
0.3255874, 0.4095023, -0.008423732, 0, 0.2431373, 1, 1,
0.3270616, -1.292387, 2.802968, 0, 0.2392157, 1, 1,
0.329495, 0.1080891, 1.369597, 0, 0.2313726, 1, 1,
0.3336701, -1.152693, 3.259653, 0, 0.227451, 1, 1,
0.3421428, -1.336218, 2.911263, 0, 0.2196078, 1, 1,
0.3440642, 1.001049, 0.7213111, 0, 0.2156863, 1, 1,
0.3453777, -0.0883243, 2.447282, 0, 0.2078431, 1, 1,
0.3469437, -0.3118504, 3.078803, 0, 0.2039216, 1, 1,
0.3477754, 2.290789, 0.6509115, 0, 0.1960784, 1, 1,
0.3478762, 1.478297, -2.421193, 0, 0.1882353, 1, 1,
0.3484529, 0.6283206, 1.155137, 0, 0.1843137, 1, 1,
0.3532957, -0.8946595, 4.257134, 0, 0.1764706, 1, 1,
0.3584799, -0.3519853, 3.695558, 0, 0.172549, 1, 1,
0.3627548, -0.3334683, 3.130004, 0, 0.1647059, 1, 1,
0.3667108, 0.8765484, 0.330816, 0, 0.1607843, 1, 1,
0.367501, 0.09034859, -0.2063418, 0, 0.1529412, 1, 1,
0.371293, 0.07697912, 1.092916, 0, 0.1490196, 1, 1,
0.3717499, 0.4590898, 1.192309, 0, 0.1411765, 1, 1,
0.3724916, -0.04669517, 0.2872599, 0, 0.1372549, 1, 1,
0.3725237, -0.1930474, 1.981495, 0, 0.1294118, 1, 1,
0.3733316, -0.2131144, 2.170714, 0, 0.1254902, 1, 1,
0.3743331, 0.5331105, 2.311059, 0, 0.1176471, 1, 1,
0.3781946, 0.6905276, 0.3784777, 0, 0.1137255, 1, 1,
0.3795367, -2.398821, 1.44458, 0, 0.1058824, 1, 1,
0.3879696, 0.206521, 1.18133, 0, 0.09803922, 1, 1,
0.3888248, -0.06439939, 1.742648, 0, 0.09411765, 1, 1,
0.3898349, 0.4189167, 0.6224388, 0, 0.08627451, 1, 1,
0.3986878, 1.005296, 0.1397454, 0, 0.08235294, 1, 1,
0.4020846, 1.06568, -0.1156208, 0, 0.07450981, 1, 1,
0.4047104, -0.1358529, 3.417128, 0, 0.07058824, 1, 1,
0.4153291, 0.8884957, -0.8890722, 0, 0.0627451, 1, 1,
0.417385, -0.1231871, 2.280421, 0, 0.05882353, 1, 1,
0.4198136, -0.4531944, 2.313967, 0, 0.05098039, 1, 1,
0.4216184, -0.2673317, 1.060735, 0, 0.04705882, 1, 1,
0.4226806, -1.863497, 4.696874, 0, 0.03921569, 1, 1,
0.4251908, -0.2564385, 2.438066, 0, 0.03529412, 1, 1,
0.425346, -0.7197576, 1.675965, 0, 0.02745098, 1, 1,
0.4317617, -0.237649, 1.49913, 0, 0.02352941, 1, 1,
0.4342265, -1.798925, 1.683267, 0, 0.01568628, 1, 1,
0.4365779, 2.352845, -0.3959979, 0, 0.01176471, 1, 1,
0.4379132, -0.3425184, 1.298075, 0, 0.003921569, 1, 1,
0.439935, 0.02043413, 1.677179, 0.003921569, 0, 1, 1,
0.4466564, -1.121018, 2.638742, 0.007843138, 0, 1, 1,
0.4469217, -1.890324, 3.905246, 0.01568628, 0, 1, 1,
0.4538346, 1.287485, 1.285292, 0.01960784, 0, 1, 1,
0.4538482, 1.320038, 0.4575494, 0.02745098, 0, 1, 1,
0.4590659, 0.360938, 1.21388, 0.03137255, 0, 1, 1,
0.4591022, 0.6387718, 1.320365, 0.03921569, 0, 1, 1,
0.4595447, -0.1079457, 1.630439, 0.04313726, 0, 1, 1,
0.461272, 0.4100062, -0.05128694, 0.05098039, 0, 1, 1,
0.4613042, 0.6650348, 0.5686202, 0.05490196, 0, 1, 1,
0.4614285, 1.159152, -0.5285366, 0.0627451, 0, 1, 1,
0.4676158, -0.4021401, 1.884661, 0.06666667, 0, 1, 1,
0.4681121, -1.319026, 2.539484, 0.07450981, 0, 1, 1,
0.4698338, 1.796861, 0.03329921, 0.07843138, 0, 1, 1,
0.4723087, 0.5807796, -0.1647336, 0.08627451, 0, 1, 1,
0.4770877, 0.0112204, 1.447761, 0.09019608, 0, 1, 1,
0.4782472, -0.1694774, 1.770949, 0.09803922, 0, 1, 1,
0.4794669, -0.894726, 2.755443, 0.1058824, 0, 1, 1,
0.4805587, 1.082141, 1.415534, 0.1098039, 0, 1, 1,
0.4874699, -1.940562, 3.703054, 0.1176471, 0, 1, 1,
0.4882278, 0.122874, 1.178087, 0.1215686, 0, 1, 1,
0.4887338, 2.587254, -2.220605, 0.1294118, 0, 1, 1,
0.493865, -0.5207424, 2.235502, 0.1333333, 0, 1, 1,
0.4962821, 1.116891, -0.6605112, 0.1411765, 0, 1, 1,
0.496382, 0.8454931, 1.359231, 0.145098, 0, 1, 1,
0.5019544, 1.021247, 0.2275405, 0.1529412, 0, 1, 1,
0.502978, 0.4470425, 1.348514, 0.1568628, 0, 1, 1,
0.5082752, -0.05085404, 0.9282067, 0.1647059, 0, 1, 1,
0.5096964, -0.7188561, 1.171084, 0.1686275, 0, 1, 1,
0.5124835, -1.203213, 4.650947, 0.1764706, 0, 1, 1,
0.5137112, -1.335548, 2.042125, 0.1803922, 0, 1, 1,
0.5139997, -1.754426, 3.420496, 0.1882353, 0, 1, 1,
0.5160193, 1.830343, -0.0899324, 0.1921569, 0, 1, 1,
0.5161789, 0.1804775, 0.5137917, 0.2, 0, 1, 1,
0.51809, 0.0512952, -1.228912, 0.2078431, 0, 1, 1,
0.520395, -0.9412612, 3.457921, 0.2117647, 0, 1, 1,
0.5205667, -1.175916, 2.091137, 0.2196078, 0, 1, 1,
0.5214971, 0.6375003, -0.1832207, 0.2235294, 0, 1, 1,
0.5215495, -1.742384, 2.771174, 0.2313726, 0, 1, 1,
0.5230286, 0.605042, 1.11297, 0.2352941, 0, 1, 1,
0.5255932, -1.464871, 3.371773, 0.2431373, 0, 1, 1,
0.5294726, 1.316042, -0.3055307, 0.2470588, 0, 1, 1,
0.5362936, 1.720119, -0.8223348, 0.254902, 0, 1, 1,
0.5401884, 0.9768831, 1.664108, 0.2588235, 0, 1, 1,
0.5471135, 1.83409, 0.5461549, 0.2666667, 0, 1, 1,
0.5478382, 0.2111977, 2.825059, 0.2705882, 0, 1, 1,
0.5496864, 0.2586186, 2.440686, 0.2784314, 0, 1, 1,
0.5586759, -2.150912, 2.986526, 0.282353, 0, 1, 1,
0.5593039, -0.166901, 1.312012, 0.2901961, 0, 1, 1,
0.5599014, -1.312445, 2.98689, 0.2941177, 0, 1, 1,
0.5628088, 0.6043462, -0.1032351, 0.3019608, 0, 1, 1,
0.5673031, -1.393225, 0.4949642, 0.3098039, 0, 1, 1,
0.5711279, 0.8822917, 1.683419, 0.3137255, 0, 1, 1,
0.5752363, 1.03754, 2.147127, 0.3215686, 0, 1, 1,
0.5811189, -0.6961708, 1.840876, 0.3254902, 0, 1, 1,
0.5849135, -0.6292573, 1.303911, 0.3333333, 0, 1, 1,
0.5931548, -0.7805714, 4.24582, 0.3372549, 0, 1, 1,
0.5955601, 0.4987612, -0.6163049, 0.345098, 0, 1, 1,
0.5974839, -0.6883144, 0.5726545, 0.3490196, 0, 1, 1,
0.5999545, 1.493425, 0.5461686, 0.3568628, 0, 1, 1,
0.6011584, -0.4175012, 1.74439, 0.3607843, 0, 1, 1,
0.6013285, -0.8134718, 1.769269, 0.3686275, 0, 1, 1,
0.6110651, 0.2591531, 0.7026252, 0.372549, 0, 1, 1,
0.6141069, -1.524926, 2.981478, 0.3803922, 0, 1, 1,
0.6169442, 0.7298911, 1.372874, 0.3843137, 0, 1, 1,
0.6182958, 0.1864149, 0.9182498, 0.3921569, 0, 1, 1,
0.6239371, 0.2814384, 2.610654, 0.3960784, 0, 1, 1,
0.6290475, 0.7358112, 0.6466619, 0.4039216, 0, 1, 1,
0.6302752, -0.6058254, 1.287448, 0.4117647, 0, 1, 1,
0.6331902, -1.331711, 1.985805, 0.4156863, 0, 1, 1,
0.6334381, 0.4662251, 0.645986, 0.4235294, 0, 1, 1,
0.6346003, -2.103512, 2.756086, 0.427451, 0, 1, 1,
0.6420035, -0.1548513, 2.603721, 0.4352941, 0, 1, 1,
0.6425409, 0.2335202, 2.59995, 0.4392157, 0, 1, 1,
0.6479225, -1.515313, 0.8628291, 0.4470588, 0, 1, 1,
0.6514868, 0.5607677, 0.5275394, 0.4509804, 0, 1, 1,
0.6654763, -0.163731, 3.075594, 0.4588235, 0, 1, 1,
0.6666486, 0.6292782, 1.753084, 0.4627451, 0, 1, 1,
0.6680125, -0.3652504, -0.3511036, 0.4705882, 0, 1, 1,
0.6682781, 1.009077, -0.2594643, 0.4745098, 0, 1, 1,
0.6724566, -0.2199079, 1.076141, 0.4823529, 0, 1, 1,
0.6783276, 1.984149, 2.525981, 0.4862745, 0, 1, 1,
0.6841059, -1.2172, 3.066571, 0.4941176, 0, 1, 1,
0.6846977, 0.1586812, 1.605554, 0.5019608, 0, 1, 1,
0.685234, -0.727757, 3.359442, 0.5058824, 0, 1, 1,
0.6877142, 1.159567, 1.7777, 0.5137255, 0, 1, 1,
0.6894814, -0.4515253, 2.134241, 0.5176471, 0, 1, 1,
0.690037, 0.724001, 0.6661947, 0.5254902, 0, 1, 1,
0.6900964, -1.516917, 3.088238, 0.5294118, 0, 1, 1,
0.6905292, 0.4384278, 0.167606, 0.5372549, 0, 1, 1,
0.6934952, 0.2886793, 1.479185, 0.5411765, 0, 1, 1,
0.6984747, 2.003633, 0.9096677, 0.5490196, 0, 1, 1,
0.6986324, -1.133829, 2.303822, 0.5529412, 0, 1, 1,
0.7086456, 0.8524157, 1.411616, 0.5607843, 0, 1, 1,
0.710721, -0.1378277, 2.824404, 0.5647059, 0, 1, 1,
0.7168121, -0.6133314, 2.508792, 0.572549, 0, 1, 1,
0.7381999, -1.026952, 1.688405, 0.5764706, 0, 1, 1,
0.7400183, -0.08118877, 0.2577575, 0.5843138, 0, 1, 1,
0.7436913, 1.707547, 0.1748235, 0.5882353, 0, 1, 1,
0.7462127, -1.900941, 2.817106, 0.5960785, 0, 1, 1,
0.7467031, -0.3708743, 0.7531202, 0.6039216, 0, 1, 1,
0.7499284, -0.2725629, 2.652143, 0.6078432, 0, 1, 1,
0.7519271, 1.238441, 0.5680495, 0.6156863, 0, 1, 1,
0.7560482, 0.3378448, -0.1749867, 0.6196079, 0, 1, 1,
0.758792, 0.4020941, 1.516761, 0.627451, 0, 1, 1,
0.7610797, -1.362554, 2.712538, 0.6313726, 0, 1, 1,
0.7662396, 2.276188, -0.3230377, 0.6392157, 0, 1, 1,
0.7693321, -0.0340419, 1.325036, 0.6431373, 0, 1, 1,
0.7728311, -1.153645, 0.8557372, 0.6509804, 0, 1, 1,
0.7735007, 1.27194, 2.395934, 0.654902, 0, 1, 1,
0.7756324, 0.2141911, 2.438902, 0.6627451, 0, 1, 1,
0.7811617, 2.476108, 1.129664, 0.6666667, 0, 1, 1,
0.7814194, 1.287984, 0.4651718, 0.6745098, 0, 1, 1,
0.7818194, -0.2783948, 1.407035, 0.6784314, 0, 1, 1,
0.7858537, -1.351327, 2.626528, 0.6862745, 0, 1, 1,
0.7912644, 2.643106, 0.9567434, 0.6901961, 0, 1, 1,
0.7928134, -2.131916, 1.24465, 0.6980392, 0, 1, 1,
0.7930509, 0.2219827, 1.812455, 0.7058824, 0, 1, 1,
0.7948093, 0.6529425, 0.8017775, 0.7098039, 0, 1, 1,
0.7969974, 1.320632, 0.9152359, 0.7176471, 0, 1, 1,
0.7971901, 0.05006706, 2.069396, 0.7215686, 0, 1, 1,
0.8001853, -0.4189788, 1.980051, 0.7294118, 0, 1, 1,
0.8035387, 1.113673, 3.200496, 0.7333333, 0, 1, 1,
0.8046243, -0.14523, 0.3643097, 0.7411765, 0, 1, 1,
0.8059865, 0.359388, 1.88329, 0.7450981, 0, 1, 1,
0.8095517, -1.138472, 0.09985062, 0.7529412, 0, 1, 1,
0.8124222, -0.9485067, 1.336815, 0.7568628, 0, 1, 1,
0.8126329, 2.552302, 0.5598395, 0.7647059, 0, 1, 1,
0.8169057, 1.375874, 2.190185, 0.7686275, 0, 1, 1,
0.8210744, 0.8714788, 0.4574358, 0.7764706, 0, 1, 1,
0.8212513, 0.1358567, 1.187153, 0.7803922, 0, 1, 1,
0.8243597, -0.08145181, 0.8277942, 0.7882353, 0, 1, 1,
0.8260956, 0.364343, 3.338307, 0.7921569, 0, 1, 1,
0.8298996, 1.973885, 0.353404, 0.8, 0, 1, 1,
0.8305436, 1.532013, 0.06107528, 0.8078431, 0, 1, 1,
0.8316799, 1.014456, -0.815491, 0.8117647, 0, 1, 1,
0.8387436, 2.594199, 1.212525, 0.8196079, 0, 1, 1,
0.8396107, -0.7775849, 1.804533, 0.8235294, 0, 1, 1,
0.8428286, 0.8751941, 0.1616555, 0.8313726, 0, 1, 1,
0.8450288, -1.24642, 2.348659, 0.8352941, 0, 1, 1,
0.8512536, 2.162009, 0.5088547, 0.8431373, 0, 1, 1,
0.8545967, 3.329354, -1.189886, 0.8470588, 0, 1, 1,
0.8551424, 0.7581413, -0.765016, 0.854902, 0, 1, 1,
0.8565635, 0.3182616, 1.026067, 0.8588235, 0, 1, 1,
0.8592345, -0.03249445, 1.077041, 0.8666667, 0, 1, 1,
0.8599087, -1.615894, 2.845316, 0.8705882, 0, 1, 1,
0.8603605, -0.8356922, 1.078197, 0.8784314, 0, 1, 1,
0.8645086, 1.613104, 1.537267, 0.8823529, 0, 1, 1,
0.8687322, -0.1267938, 0.7128599, 0.8901961, 0, 1, 1,
0.8699375, 0.108633, 0.8258876, 0.8941177, 0, 1, 1,
0.8707034, 0.5267685, 2.346242, 0.9019608, 0, 1, 1,
0.8747275, -0.431919, 2.655779, 0.9098039, 0, 1, 1,
0.8809019, 1.048833, 0.0736523, 0.9137255, 0, 1, 1,
0.888027, 0.1128169, 2.927538, 0.9215686, 0, 1, 1,
0.8890445, -0.3901832, 2.256742, 0.9254902, 0, 1, 1,
0.8897758, 1.697962, 0.6209976, 0.9333333, 0, 1, 1,
0.8916754, 0.7285409, 1.422392, 0.9372549, 0, 1, 1,
0.8952744, -1.180539, 1.098913, 0.945098, 0, 1, 1,
0.8978657, -0.7724661, 3.695592, 0.9490196, 0, 1, 1,
0.8990102, -0.4763049, 0.9181024, 0.9568627, 0, 1, 1,
0.9102719, -0.5200166, 2.062416, 0.9607843, 0, 1, 1,
0.9145835, -1.112512, 1.942087, 0.9686275, 0, 1, 1,
0.9149648, 0.3051903, -0.1519943, 0.972549, 0, 1, 1,
0.9152631, 0.001230879, 2.076797, 0.9803922, 0, 1, 1,
0.9163887, 0.1519964, 1.983538, 0.9843137, 0, 1, 1,
0.9192578, 0.6543769, 1.325843, 0.9921569, 0, 1, 1,
0.9233477, -0.3779382, -0.1711704, 0.9960784, 0, 1, 1,
0.9356751, -1.01769, 2.703997, 1, 0, 0.9960784, 1,
0.9359195, 0.7585143, 0.9821679, 1, 0, 0.9882353, 1,
0.9421285, -0.7180888, 1.521144, 1, 0, 0.9843137, 1,
0.9461444, 0.2607136, 1.402144, 1, 0, 0.9764706, 1,
0.9489107, 1.509868, 0.6349066, 1, 0, 0.972549, 1,
0.9593937, 1.20409, 0.03631782, 1, 0, 0.9647059, 1,
0.964862, -0.3144813, 1.274684, 1, 0, 0.9607843, 1,
0.9649656, -0.6875533, 2.528444, 1, 0, 0.9529412, 1,
0.9675472, 0.05864055, 1.12944, 1, 0, 0.9490196, 1,
0.9677173, -0.06191941, 1.098299, 1, 0, 0.9411765, 1,
0.9700873, -0.6405026, 0.933418, 1, 0, 0.9372549, 1,
0.9774765, -1.520919, 2.210852, 1, 0, 0.9294118, 1,
0.9806655, -1.463869, 3.373485, 1, 0, 0.9254902, 1,
0.9846269, 0.2025788, 0.4035075, 1, 0, 0.9176471, 1,
0.9855286, 0.06885154, -0.249755, 1, 0, 0.9137255, 1,
0.9873813, -1.86961, 2.042814, 1, 0, 0.9058824, 1,
0.9879493, 0.7256768, 1.673015, 1, 0, 0.9019608, 1,
0.9887374, 0.428821, 0.6473623, 1, 0, 0.8941177, 1,
0.9926838, -0.8699667, 2.980325, 1, 0, 0.8862745, 1,
1.005631, 2.14713, 1.01862, 1, 0, 0.8823529, 1,
1.006741, 1.465565, 1.887292, 1, 0, 0.8745098, 1,
1.011347, -0.714141, 4.14291, 1, 0, 0.8705882, 1,
1.017667, -0.6186203, 3.455253, 1, 0, 0.8627451, 1,
1.036693, 0.2586993, 1.085387, 1, 0, 0.8588235, 1,
1.040391, 1.00722, 0.8522385, 1, 0, 0.8509804, 1,
1.04388, -0.0900914, 1.484889, 1, 0, 0.8470588, 1,
1.055228, 0.8231331, 0.6835114, 1, 0, 0.8392157, 1,
1.058165, -0.203494, 1.717036, 1, 0, 0.8352941, 1,
1.05957, -0.1361851, 3.094562, 1, 0, 0.827451, 1,
1.070125, -1.848656, 4.983294, 1, 0, 0.8235294, 1,
1.071218, 1.494759, 0.2441153, 1, 0, 0.8156863, 1,
1.071907, 0.301526, -0.01134168, 1, 0, 0.8117647, 1,
1.071968, 0.3677419, 1.791365, 1, 0, 0.8039216, 1,
1.07518, -1.148488, 3.324406, 1, 0, 0.7960784, 1,
1.085705, 1.02167, 1.758468, 1, 0, 0.7921569, 1,
1.0863, -0.5440778, 1.207295, 1, 0, 0.7843137, 1,
1.088246, 0.6449178, -0.152319, 1, 0, 0.7803922, 1,
1.091664, -1.474726, 1.57071, 1, 0, 0.772549, 1,
1.093915, -2.317514, 3.432313, 1, 0, 0.7686275, 1,
1.097985, 2.521243, -1.071522, 1, 0, 0.7607843, 1,
1.103557, -0.09603391, 1.582515, 1, 0, 0.7568628, 1,
1.104832, -1.34424, 2.29918, 1, 0, 0.7490196, 1,
1.106351, 0.1677759, 2.070403, 1, 0, 0.7450981, 1,
1.113967, 0.5688199, 0.5638584, 1, 0, 0.7372549, 1,
1.119907, -0.605135, 1.595853, 1, 0, 0.7333333, 1,
1.12475, -0.5322673, 2.993578, 1, 0, 0.7254902, 1,
1.126997, 1.275418, -0.7491086, 1, 0, 0.7215686, 1,
1.133563, -0.1028481, -0.693992, 1, 0, 0.7137255, 1,
1.142078, -1.728708, 2.32005, 1, 0, 0.7098039, 1,
1.149969, 1.052668, 0.8127456, 1, 0, 0.7019608, 1,
1.153654, 0.3366162, 1.174608, 1, 0, 0.6941177, 1,
1.156447, -1.066035, 1.66546, 1, 0, 0.6901961, 1,
1.157023, 0.6100656, 1.572189, 1, 0, 0.682353, 1,
1.161913, -1.571123, 2.454313, 1, 0, 0.6784314, 1,
1.163357, -0.9839036, 2.59163, 1, 0, 0.6705883, 1,
1.165536, -2.023519, 3.423025, 1, 0, 0.6666667, 1,
1.168659, -0.3556398, 1.516314, 1, 0, 0.6588235, 1,
1.183188, 0.4998406, 0.3632307, 1, 0, 0.654902, 1,
1.189693, 0.05608135, 1.255567, 1, 0, 0.6470588, 1,
1.199368, 1.827814, 0.9173135, 1, 0, 0.6431373, 1,
1.19943, -1.074899, 2.724749, 1, 0, 0.6352941, 1,
1.201141, -0.5576732, 2.144581, 1, 0, 0.6313726, 1,
1.204395, -0.4685672, 2.066434, 1, 0, 0.6235294, 1,
1.217816, 0.3062891, 0.2471106, 1, 0, 0.6196079, 1,
1.218079, -0.7489021, 2.127802, 1, 0, 0.6117647, 1,
1.221196, -0.3571163, 1.815898, 1, 0, 0.6078432, 1,
1.225554, -1.992514, 0.557121, 1, 0, 0.6, 1,
1.234233, 2.682616, -0.1208241, 1, 0, 0.5921569, 1,
1.236732, 1.538994, 0.5735121, 1, 0, 0.5882353, 1,
1.250759, -0.4183773, 2.501293, 1, 0, 0.5803922, 1,
1.257539, -0.8285602, 1.137516, 1, 0, 0.5764706, 1,
1.264059, -0.7900305, 2.409018, 1, 0, 0.5686275, 1,
1.264325, 0.2015132, 2.299744, 1, 0, 0.5647059, 1,
1.264952, 0.2603806, 2.997027, 1, 0, 0.5568628, 1,
1.269871, 1.062096, 0.4544854, 1, 0, 0.5529412, 1,
1.278501, 0.2101973, 2.13359, 1, 0, 0.5450981, 1,
1.280199, 1.085492, 0.2940565, 1, 0, 0.5411765, 1,
1.280619, 0.06430822, 2.444989, 1, 0, 0.5333334, 1,
1.295181, -1.444051, 2.335776, 1, 0, 0.5294118, 1,
1.301062, -0.7958993, 1.065103, 1, 0, 0.5215687, 1,
1.302585, -0.06288935, 1.991746, 1, 0, 0.5176471, 1,
1.309144, -0.7189155, 1.069723, 1, 0, 0.509804, 1,
1.323478, 1.604295, -0.7543396, 1, 0, 0.5058824, 1,
1.326669, 0.5459412, 3.253088, 1, 0, 0.4980392, 1,
1.340637, -0.58634, 3.22092, 1, 0, 0.4901961, 1,
1.351148, 0.3797964, 1.99454, 1, 0, 0.4862745, 1,
1.352459, -0.4427635, 2.086282, 1, 0, 0.4784314, 1,
1.366017, 0.8048185, 0.05509482, 1, 0, 0.4745098, 1,
1.377425, 0.02878176, 1.137495, 1, 0, 0.4666667, 1,
1.382388, -0.5518372, 0.2134074, 1, 0, 0.4627451, 1,
1.405274, -0.6811497, 2.418125, 1, 0, 0.454902, 1,
1.411971, 0.3055836, 1.084987, 1, 0, 0.4509804, 1,
1.414505, 0.7378671, 0.9648058, 1, 0, 0.4431373, 1,
1.422155, 0.157281, 0.3756769, 1, 0, 0.4392157, 1,
1.425476, -0.7293127, 3.488385, 1, 0, 0.4313726, 1,
1.428818, 0.1470502, 2.169555, 1, 0, 0.427451, 1,
1.438468, 0.9501456, 2.386917, 1, 0, 0.4196078, 1,
1.452415, -0.2738049, 2.477026, 1, 0, 0.4156863, 1,
1.461561, -0.04988913, 1.923261, 1, 0, 0.4078431, 1,
1.464671, 0.2728071, 0.9276024, 1, 0, 0.4039216, 1,
1.468378, -2.088531, 2.82847, 1, 0, 0.3960784, 1,
1.469731, -0.3578171, 1.260995, 1, 0, 0.3882353, 1,
1.472743, 0.2304866, 1.831612, 1, 0, 0.3843137, 1,
1.475667, -2.004587, 2.854592, 1, 0, 0.3764706, 1,
1.477572, 0.2159862, 1.446916, 1, 0, 0.372549, 1,
1.478363, -0.3766648, 1.391883, 1, 0, 0.3647059, 1,
1.480313, 0.735893, 1.410711, 1, 0, 0.3607843, 1,
1.489321, 0.9241497, 0.8534957, 1, 0, 0.3529412, 1,
1.49365, -0.5473461, 2.485733, 1, 0, 0.3490196, 1,
1.53336, 1.677869, 1.035989, 1, 0, 0.3411765, 1,
1.538721, -0.0313979, 1.72956, 1, 0, 0.3372549, 1,
1.539834, -0.9486371, 0.8041406, 1, 0, 0.3294118, 1,
1.553336, 1.688481, 1.879854, 1, 0, 0.3254902, 1,
1.583096, -0.1726747, 0.895688, 1, 0, 0.3176471, 1,
1.608089, -1.132614, 3.394554, 1, 0, 0.3137255, 1,
1.612945, 0.9420936, 0.515871, 1, 0, 0.3058824, 1,
1.62685, -0.2746992, 1.908851, 1, 0, 0.2980392, 1,
1.629681, -0.9811004, 3.663684, 1, 0, 0.2941177, 1,
1.64929, 1.881798, 0.824819, 1, 0, 0.2862745, 1,
1.651087, 0.3494566, 0.9367896, 1, 0, 0.282353, 1,
1.652888, 1.199971, 0.7071822, 1, 0, 0.2745098, 1,
1.661739, -3.202453, 3.213943, 1, 0, 0.2705882, 1,
1.685934, -1.492511, 2.214604, 1, 0, 0.2627451, 1,
1.754362, -1.528868, 3.468694, 1, 0, 0.2588235, 1,
1.759359, 1.005566, 0.6726761, 1, 0, 0.2509804, 1,
1.761179, 0.6723632, -0.7683116, 1, 0, 0.2470588, 1,
1.761788, 2.096201, 1.228654, 1, 0, 0.2392157, 1,
1.770999, 0.06536165, 1.744824, 1, 0, 0.2352941, 1,
1.774837, -0.0721094, 1.464491, 1, 0, 0.227451, 1,
1.775584, -0.04857655, 2.057583, 1, 0, 0.2235294, 1,
1.787459, -1.320651, 1.176329, 1, 0, 0.2156863, 1,
1.801136, -1.573689, 0.9427237, 1, 0, 0.2117647, 1,
1.835328, 1.568434, 1.406089, 1, 0, 0.2039216, 1,
1.845359, -0.4206313, 1.020629, 1, 0, 0.1960784, 1,
1.851814, 0.07057225, -0.08793241, 1, 0, 0.1921569, 1,
1.87988, 0.7871071, 0.360725, 1, 0, 0.1843137, 1,
1.886977, 2.242606, 1.243435, 1, 0, 0.1803922, 1,
1.892347, 2.177347, -0.5529567, 1, 0, 0.172549, 1,
1.917028, -0.6283295, 1.833664, 1, 0, 0.1686275, 1,
1.919166, 3.028367, 0.8382404, 1, 0, 0.1607843, 1,
1.932413, -0.6248035, 1.069227, 1, 0, 0.1568628, 1,
1.944708, 0.2459683, 1.185977, 1, 0, 0.1490196, 1,
1.999632, 1.192201, 0.3216421, 1, 0, 0.145098, 1,
2.018761, -0.7837661, 0.6589754, 1, 0, 0.1372549, 1,
2.032903, -0.3188489, 1.22388, 1, 0, 0.1333333, 1,
2.036035, -0.8654454, 2.650998, 1, 0, 0.1254902, 1,
2.084456, -0.1420108, 1.490214, 1, 0, 0.1215686, 1,
2.143666, 1.004985, 1.557691, 1, 0, 0.1137255, 1,
2.166579, 1.359319, 0.6993917, 1, 0, 0.1098039, 1,
2.198233, -0.4695138, 1.179668, 1, 0, 0.1019608, 1,
2.222032, 0.3654301, 1.140188, 1, 0, 0.09411765, 1,
2.24612, -0.1139871, -0.2423583, 1, 0, 0.09019608, 1,
2.269987, -1.469938, 1.569409, 1, 0, 0.08235294, 1,
2.275061, 0.4900488, 1.763296, 1, 0, 0.07843138, 1,
2.316484, -0.6194934, 1.816861, 1, 0, 0.07058824, 1,
2.339465, 1.847283, 1.847517, 1, 0, 0.06666667, 1,
2.357454, 0.07837231, 0.4635448, 1, 0, 0.05882353, 1,
2.455345, -1.648918, 1.48693, 1, 0, 0.05490196, 1,
2.463337, -1.286374, 1.640738, 1, 0, 0.04705882, 1,
2.586712, 0.05843904, 0.9922916, 1, 0, 0.04313726, 1,
2.613886, 0.03002874, 2.227856, 1, 0, 0.03529412, 1,
2.659149, 1.256176, 1.033799, 1, 0, 0.03137255, 1,
2.820868, -0.1118232, 2.107522, 1, 0, 0.02352941, 1,
2.829812, -0.4488019, 1.814313, 1, 0, 0.01960784, 1,
2.974365, -0.8122833, 3.299883, 1, 0, 0.01176471, 1,
3.037465, 0.5503314, 1.107259, 1, 0, 0.007843138, 1
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
-0.08147788, -4.341654, -6.6612, 0, -0.5, 0.5, 0.5,
-0.08147788, -4.341654, -6.6612, 1, -0.5, 0.5, 0.5,
-0.08147788, -4.341654, -6.6612, 1, 1.5, 0.5, 0.5,
-0.08147788, -4.341654, -6.6612, 0, 1.5, 0.5, 0.5
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
-4.257743, 0.1488104, -6.6612, 0, -0.5, 0.5, 0.5,
-4.257743, 0.1488104, -6.6612, 1, -0.5, 0.5, 0.5,
-4.257743, 0.1488104, -6.6612, 1, 1.5, 0.5, 0.5,
-4.257743, 0.1488104, -6.6612, 0, 1.5, 0.5, 0.5
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
-4.257743, -4.341654, 0.2569034, 0, -0.5, 0.5, 0.5,
-4.257743, -4.341654, 0.2569034, 1, -0.5, 0.5, 0.5,
-4.257743, -4.341654, 0.2569034, 1, 1.5, 0.5, 0.5,
-4.257743, -4.341654, 0.2569034, 0, 1.5, 0.5, 0.5
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
-3, -3.305393, -5.064715,
3, -3.305393, -5.064715,
-3, -3.305393, -5.064715,
-3, -3.478103, -5.330796,
-2, -3.305393, -5.064715,
-2, -3.478103, -5.330796,
-1, -3.305393, -5.064715,
-1, -3.478103, -5.330796,
0, -3.305393, -5.064715,
0, -3.478103, -5.330796,
1, -3.305393, -5.064715,
1, -3.478103, -5.330796,
2, -3.305393, -5.064715,
2, -3.478103, -5.330796,
3, -3.305393, -5.064715,
3, -3.478103, -5.330796
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
-3, -3.823524, -5.862957, 0, -0.5, 0.5, 0.5,
-3, -3.823524, -5.862957, 1, -0.5, 0.5, 0.5,
-3, -3.823524, -5.862957, 1, 1.5, 0.5, 0.5,
-3, -3.823524, -5.862957, 0, 1.5, 0.5, 0.5,
-2, -3.823524, -5.862957, 0, -0.5, 0.5, 0.5,
-2, -3.823524, -5.862957, 1, -0.5, 0.5, 0.5,
-2, -3.823524, -5.862957, 1, 1.5, 0.5, 0.5,
-2, -3.823524, -5.862957, 0, 1.5, 0.5, 0.5,
-1, -3.823524, -5.862957, 0, -0.5, 0.5, 0.5,
-1, -3.823524, -5.862957, 1, -0.5, 0.5, 0.5,
-1, -3.823524, -5.862957, 1, 1.5, 0.5, 0.5,
-1, -3.823524, -5.862957, 0, 1.5, 0.5, 0.5,
0, -3.823524, -5.862957, 0, -0.5, 0.5, 0.5,
0, -3.823524, -5.862957, 1, -0.5, 0.5, 0.5,
0, -3.823524, -5.862957, 1, 1.5, 0.5, 0.5,
0, -3.823524, -5.862957, 0, 1.5, 0.5, 0.5,
1, -3.823524, -5.862957, 0, -0.5, 0.5, 0.5,
1, -3.823524, -5.862957, 1, -0.5, 0.5, 0.5,
1, -3.823524, -5.862957, 1, 1.5, 0.5, 0.5,
1, -3.823524, -5.862957, 0, 1.5, 0.5, 0.5,
2, -3.823524, -5.862957, 0, -0.5, 0.5, 0.5,
2, -3.823524, -5.862957, 1, -0.5, 0.5, 0.5,
2, -3.823524, -5.862957, 1, 1.5, 0.5, 0.5,
2, -3.823524, -5.862957, 0, 1.5, 0.5, 0.5,
3, -3.823524, -5.862957, 0, -0.5, 0.5, 0.5,
3, -3.823524, -5.862957, 1, -0.5, 0.5, 0.5,
3, -3.823524, -5.862957, 1, 1.5, 0.5, 0.5,
3, -3.823524, -5.862957, 0, 1.5, 0.5, 0.5
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
-3.293989, -3, -5.064715,
-3.293989, 3, -5.064715,
-3.293989, -3, -5.064715,
-3.454615, -3, -5.330796,
-3.293989, -2, -5.064715,
-3.454615, -2, -5.330796,
-3.293989, -1, -5.064715,
-3.454615, -1, -5.330796,
-3.293989, 0, -5.064715,
-3.454615, 0, -5.330796,
-3.293989, 1, -5.064715,
-3.454615, 1, -5.330796,
-3.293989, 2, -5.064715,
-3.454615, 2, -5.330796,
-3.293989, 3, -5.064715,
-3.454615, 3, -5.330796
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
-3.775866, -3, -5.862957, 0, -0.5, 0.5, 0.5,
-3.775866, -3, -5.862957, 1, -0.5, 0.5, 0.5,
-3.775866, -3, -5.862957, 1, 1.5, 0.5, 0.5,
-3.775866, -3, -5.862957, 0, 1.5, 0.5, 0.5,
-3.775866, -2, -5.862957, 0, -0.5, 0.5, 0.5,
-3.775866, -2, -5.862957, 1, -0.5, 0.5, 0.5,
-3.775866, -2, -5.862957, 1, 1.5, 0.5, 0.5,
-3.775866, -2, -5.862957, 0, 1.5, 0.5, 0.5,
-3.775866, -1, -5.862957, 0, -0.5, 0.5, 0.5,
-3.775866, -1, -5.862957, 1, -0.5, 0.5, 0.5,
-3.775866, -1, -5.862957, 1, 1.5, 0.5, 0.5,
-3.775866, -1, -5.862957, 0, 1.5, 0.5, 0.5,
-3.775866, 0, -5.862957, 0, -0.5, 0.5, 0.5,
-3.775866, 0, -5.862957, 1, -0.5, 0.5, 0.5,
-3.775866, 0, -5.862957, 1, 1.5, 0.5, 0.5,
-3.775866, 0, -5.862957, 0, 1.5, 0.5, 0.5,
-3.775866, 1, -5.862957, 0, -0.5, 0.5, 0.5,
-3.775866, 1, -5.862957, 1, -0.5, 0.5, 0.5,
-3.775866, 1, -5.862957, 1, 1.5, 0.5, 0.5,
-3.775866, 1, -5.862957, 0, 1.5, 0.5, 0.5,
-3.775866, 2, -5.862957, 0, -0.5, 0.5, 0.5,
-3.775866, 2, -5.862957, 1, -0.5, 0.5, 0.5,
-3.775866, 2, -5.862957, 1, 1.5, 0.5, 0.5,
-3.775866, 2, -5.862957, 0, 1.5, 0.5, 0.5,
-3.775866, 3, -5.862957, 0, -0.5, 0.5, 0.5,
-3.775866, 3, -5.862957, 1, -0.5, 0.5, 0.5,
-3.775866, 3, -5.862957, 1, 1.5, 0.5, 0.5,
-3.775866, 3, -5.862957, 0, 1.5, 0.5, 0.5
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
-3.293989, -3.305393, -4,
-3.293989, -3.305393, 4,
-3.293989, -3.305393, -4,
-3.454615, -3.478103, -4,
-3.293989, -3.305393, -2,
-3.454615, -3.478103, -2,
-3.293989, -3.305393, 0,
-3.454615, -3.478103, 0,
-3.293989, -3.305393, 2,
-3.454615, -3.478103, 2,
-3.293989, -3.305393, 4,
-3.454615, -3.478103, 4
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
-3.775866, -3.823524, -4, 0, -0.5, 0.5, 0.5,
-3.775866, -3.823524, -4, 1, -0.5, 0.5, 0.5,
-3.775866, -3.823524, -4, 1, 1.5, 0.5, 0.5,
-3.775866, -3.823524, -4, 0, 1.5, 0.5, 0.5,
-3.775866, -3.823524, -2, 0, -0.5, 0.5, 0.5,
-3.775866, -3.823524, -2, 1, -0.5, 0.5, 0.5,
-3.775866, -3.823524, -2, 1, 1.5, 0.5, 0.5,
-3.775866, -3.823524, -2, 0, 1.5, 0.5, 0.5,
-3.775866, -3.823524, 0, 0, -0.5, 0.5, 0.5,
-3.775866, -3.823524, 0, 1, -0.5, 0.5, 0.5,
-3.775866, -3.823524, 0, 1, 1.5, 0.5, 0.5,
-3.775866, -3.823524, 0, 0, 1.5, 0.5, 0.5,
-3.775866, -3.823524, 2, 0, -0.5, 0.5, 0.5,
-3.775866, -3.823524, 2, 1, -0.5, 0.5, 0.5,
-3.775866, -3.823524, 2, 1, 1.5, 0.5, 0.5,
-3.775866, -3.823524, 2, 0, 1.5, 0.5, 0.5,
-3.775866, -3.823524, 4, 0, -0.5, 0.5, 0.5,
-3.775866, -3.823524, 4, 1, -0.5, 0.5, 0.5,
-3.775866, -3.823524, 4, 1, 1.5, 0.5, 0.5,
-3.775866, -3.823524, 4, 0, 1.5, 0.5, 0.5
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
-3.293989, -3.305393, -5.064715,
-3.293989, 3.603014, -5.064715,
-3.293989, -3.305393, 5.578522,
-3.293989, 3.603014, 5.578522,
-3.293989, -3.305393, -5.064715,
-3.293989, -3.305393, 5.578522,
-3.293989, 3.603014, -5.064715,
-3.293989, 3.603014, 5.578522,
-3.293989, -3.305393, -5.064715,
3.131034, -3.305393, -5.064715,
-3.293989, -3.305393, 5.578522,
3.131034, -3.305393, 5.578522,
-3.293989, 3.603014, -5.064715,
3.131034, 3.603014, -5.064715,
-3.293989, 3.603014, 5.578522,
3.131034, 3.603014, 5.578522,
3.131034, -3.305393, -5.064715,
3.131034, 3.603014, -5.064715,
3.131034, -3.305393, 5.578522,
3.131034, 3.603014, 5.578522,
3.131034, -3.305393, -5.064715,
3.131034, -3.305393, 5.578522,
3.131034, 3.603014, -5.064715,
3.131034, 3.603014, 5.578522
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
var radius = 7.594651;
var distance = 33.78946;
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
mvMatrix.translate( 0.08147788, -0.1488104, -0.2569034 );
mvMatrix.scale( 1.278048, 1.188622, 0.7715215 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.78946);
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
Inositols<-read.table("Inositols.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Inositols$V2
```

```
## Error in eval(expr, envir, enclos): object 'Inositols' not found
```

```r
y<-Inositols$V3
```

```
## Error in eval(expr, envir, enclos): object 'Inositols' not found
```

```r
z<-Inositols$V4
```

```
## Error in eval(expr, envir, enclos): object 'Inositols' not found
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
-3.200421, -1.710444, -0.1990895, 0, 0, 1, 1, 1,
-2.884628, 0.6987691, -0.3456212, 1, 0, 0, 1, 1,
-2.834396, 2.116158, -1.494932, 1, 0, 0, 1, 1,
-2.772035, -0.2140167, -2.950306, 1, 0, 0, 1, 1,
-2.694115, 1.318554, -1.96505, 1, 0, 0, 1, 1,
-2.645643, -0.6257325, -2.859952, 1, 0, 0, 1, 1,
-2.588365, -1.45326, -2.253765, 0, 0, 0, 1, 1,
-2.565493, 0.4701529, -1.186298, 0, 0, 0, 1, 1,
-2.526794, 0.1348727, -3.584771, 0, 0, 0, 1, 1,
-2.477481, -0.4708719, -1.317326, 0, 0, 0, 1, 1,
-2.465312, 0.2872844, 1.09363, 0, 0, 0, 1, 1,
-2.338667, 0.7297353, -2.166566, 0, 0, 0, 1, 1,
-2.333363, 0.2396282, -2.869267, 0, 0, 0, 1, 1,
-2.29263, -0.2294286, -1.270908, 1, 1, 1, 1, 1,
-2.275448, -0.5184919, -1.427538, 1, 1, 1, 1, 1,
-2.259244, 0.4439468, 1.340719, 1, 1, 1, 1, 1,
-2.226288, 0.8278825, -1.283025, 1, 1, 1, 1, 1,
-2.100556, 0.9099347, 0.2146966, 1, 1, 1, 1, 1,
-2.054876, 0.5013647, -2.577142, 1, 1, 1, 1, 1,
-2.01327, 0.6075164, -1.454793, 1, 1, 1, 1, 1,
-2.003361, -0.4106572, -2.193648, 1, 1, 1, 1, 1,
-1.960386, -1.754612, -0.9433889, 1, 1, 1, 1, 1,
-1.938042, -1.805903, -2.630185, 1, 1, 1, 1, 1,
-1.93753, -0.1689945, -3.049455, 1, 1, 1, 1, 1,
-1.927179, -1.964912, -1.777648, 1, 1, 1, 1, 1,
-1.92638, -1.584647, -3.764642, 1, 1, 1, 1, 1,
-1.925605, -0.4910777, -2.263638, 1, 1, 1, 1, 1,
-1.91962, 1.23705, -0.7245569, 1, 1, 1, 1, 1,
-1.916481, -0.3094803, -1.226317, 0, 0, 1, 1, 1,
-1.916263, -0.5459431, -2.156949, 1, 0, 0, 1, 1,
-1.907236, 0.7769243, -0.7796823, 1, 0, 0, 1, 1,
-1.901541, -0.7966122, -1.744428, 1, 0, 0, 1, 1,
-1.899958, -0.1439586, -0.5948171, 1, 0, 0, 1, 1,
-1.891537, 0.3650782, -0.4381541, 1, 0, 0, 1, 1,
-1.875865, -0.2928381, -3.862823, 0, 0, 0, 1, 1,
-1.863583, -1.985255, -2.485674, 0, 0, 0, 1, 1,
-1.857527, 0.1509583, -2.119037, 0, 0, 0, 1, 1,
-1.855185, -0.9465012, -0.9822438, 0, 0, 0, 1, 1,
-1.840281, -0.9861462, -1.566337, 0, 0, 0, 1, 1,
-1.837994, -0.7057318, -1.388877, 0, 0, 0, 1, 1,
-1.833542, -0.586391, -1.66285, 0, 0, 0, 1, 1,
-1.822238, 0.4381886, -1.205963, 1, 1, 1, 1, 1,
-1.798585, -0.7820947, -3.063153, 1, 1, 1, 1, 1,
-1.786182, -0.75401, -1.100268, 1, 1, 1, 1, 1,
-1.780746, 0.2612073, -2.348051, 1, 1, 1, 1, 1,
-1.77827, -0.9552273, -1.869429, 1, 1, 1, 1, 1,
-1.774592, 0.6285747, -1.2966, 1, 1, 1, 1, 1,
-1.764346, -0.5216416, -1.276785, 1, 1, 1, 1, 1,
-1.744218, 1.301746, -0.3278663, 1, 1, 1, 1, 1,
-1.742188, -0.2536321, -1.541878, 1, 1, 1, 1, 1,
-1.717296, 0.8109471, 0.7866597, 1, 1, 1, 1, 1,
-1.713886, 0.6423189, -1.845757, 1, 1, 1, 1, 1,
-1.703891, 0.9773241, 0.25646, 1, 1, 1, 1, 1,
-1.668241, 1.306836, -0.3720108, 1, 1, 1, 1, 1,
-1.657763, 0.4214114, -2.422168, 1, 1, 1, 1, 1,
-1.651024, -0.7160137, -0.7904842, 1, 1, 1, 1, 1,
-1.648693, -1.688014, -1.174582, 0, 0, 1, 1, 1,
-1.620613, -1.055294, -2.875637, 1, 0, 0, 1, 1,
-1.595254, 1.348116, -2.032836, 1, 0, 0, 1, 1,
-1.593075, -0.2405438, -2.086232, 1, 0, 0, 1, 1,
-1.588191, 0.4362225, -2.570707, 1, 0, 0, 1, 1,
-1.583502, 1.869663, -0.3633447, 1, 0, 0, 1, 1,
-1.565773, 1.493863, -1.892981, 0, 0, 0, 1, 1,
-1.557724, -1.156879, -3.80667, 0, 0, 0, 1, 1,
-1.554324, -1.027047, -1.726333, 0, 0, 0, 1, 1,
-1.552049, 0.6607014, -1.486267, 0, 0, 0, 1, 1,
-1.54404, 0.004355899, -0.008027563, 0, 0, 0, 1, 1,
-1.534968, -0.6638878, -2.212512, 0, 0, 0, 1, 1,
-1.525637, -0.06163488, -2.134293, 0, 0, 0, 1, 1,
-1.516062, 1.155012, 0.2842363, 1, 1, 1, 1, 1,
-1.513717, 0.8495087, -2.668431, 1, 1, 1, 1, 1,
-1.512098, 0.2163246, -2.561179, 1, 1, 1, 1, 1,
-1.511921, 0.06154955, -2.089352, 1, 1, 1, 1, 1,
-1.507132, 0.6194947, -2.583098, 1, 1, 1, 1, 1,
-1.503022, -1.797599, -3.891503, 1, 1, 1, 1, 1,
-1.478806, 0.5365051, 0.9229956, 1, 1, 1, 1, 1,
-1.465169, -0.6488019, -0.922857, 1, 1, 1, 1, 1,
-1.462587, -1.46035, -2.131456, 1, 1, 1, 1, 1,
-1.45938, -0.1340159, -0.4120983, 1, 1, 1, 1, 1,
-1.446609, 0.5875961, -1.080267, 1, 1, 1, 1, 1,
-1.444278, 0.5309235, -1.440031, 1, 1, 1, 1, 1,
-1.443634, 0.3232147, -2.581074, 1, 1, 1, 1, 1,
-1.441936, -1.459679, -2.068245, 1, 1, 1, 1, 1,
-1.429346, -1.820672, -2.824553, 1, 1, 1, 1, 1,
-1.417266, 2.053791, -0.1897783, 0, 0, 1, 1, 1,
-1.405756, 0.8364749, 0.5206373, 1, 0, 0, 1, 1,
-1.404075, -1.200954, -3.485619, 1, 0, 0, 1, 1,
-1.401739, 0.6182132, -0.6889936, 1, 0, 0, 1, 1,
-1.399746, 1.087999, -1.64281, 1, 0, 0, 1, 1,
-1.37862, 2.062381, -1.938798, 1, 0, 0, 1, 1,
-1.373395, 1.003224, -0.5373197, 0, 0, 0, 1, 1,
-1.37067, -0.06033146, -1.975562, 0, 0, 0, 1, 1,
-1.36002, -0.3914256, -1.857878, 0, 0, 0, 1, 1,
-1.345493, 0.3307799, -0.9351236, 0, 0, 0, 1, 1,
-1.344179, 1.848253, -1.084932, 0, 0, 0, 1, 1,
-1.33858, 2.140467, 0.702611, 0, 0, 0, 1, 1,
-1.334538, -2.148076, -2.918756, 0, 0, 0, 1, 1,
-1.323407, 0.9390236, -0.6599975, 1, 1, 1, 1, 1,
-1.321335, 1.140493, -0.3986617, 1, 1, 1, 1, 1,
-1.317701, -0.3012336, -1.618701, 1, 1, 1, 1, 1,
-1.31325, 0.4249517, -3.103591, 1, 1, 1, 1, 1,
-1.302044, 0.3438071, -0.4223714, 1, 1, 1, 1, 1,
-1.294385, -1.320574, -3.26268, 1, 1, 1, 1, 1,
-1.28289, 2.429454, -1.794347, 1, 1, 1, 1, 1,
-1.27929, 1.22523, -1.152391, 1, 1, 1, 1, 1,
-1.266332, 1.404954, -1.758414, 1, 1, 1, 1, 1,
-1.260964, 0.7918077, 0.1331853, 1, 1, 1, 1, 1,
-1.257117, -0.1277905, -1.72986, 1, 1, 1, 1, 1,
-1.255792, -0.8297926, -3.53207, 1, 1, 1, 1, 1,
-1.253463, 0.06471578, -3.102282, 1, 1, 1, 1, 1,
-1.251514, -0.2880203, -2.572152, 1, 1, 1, 1, 1,
-1.246409, -0.2458992, -2.323175, 1, 1, 1, 1, 1,
-1.234784, 1.781209, -2.562751, 0, 0, 1, 1, 1,
-1.222646, 1.414008, -2.024271, 1, 0, 0, 1, 1,
-1.222301, 1.232117, -0.4364141, 1, 0, 0, 1, 1,
-1.221741, 0.9372123, -0.7286462, 1, 0, 0, 1, 1,
-1.197289, -0.1186673, -3.294679, 1, 0, 0, 1, 1,
-1.197202, 0.1911954, -2.169485, 1, 0, 0, 1, 1,
-1.193003, 0.81555, -1.704285, 0, 0, 0, 1, 1,
-1.192519, -0.2361101, -2.086722, 0, 0, 0, 1, 1,
-1.187682, -0.5764782, -3.415261, 0, 0, 0, 1, 1,
-1.184053, 0.5401438, -1.498646, 0, 0, 0, 1, 1,
-1.183023, 0.5986914, -0.9327505, 0, 0, 0, 1, 1,
-1.181927, -0.6669609, -1.643724, 0, 0, 0, 1, 1,
-1.179611, -0.2249442, -1.721327, 0, 0, 0, 1, 1,
-1.177604, 0.2086809, 0.7104716, 1, 1, 1, 1, 1,
-1.17455, -0.4581199, -0.6419367, 1, 1, 1, 1, 1,
-1.17126, -1.244786, -0.4755052, 1, 1, 1, 1, 1,
-1.166297, -0.1897908, -2.380982, 1, 1, 1, 1, 1,
-1.164888, -0.4555693, -1.629439, 1, 1, 1, 1, 1,
-1.162097, -0.5896408, -1.558847, 1, 1, 1, 1, 1,
-1.159695, -0.4005659, -1.476804, 1, 1, 1, 1, 1,
-1.157567, 0.2854569, -0.292034, 1, 1, 1, 1, 1,
-1.157198, -0.07179418, -1.34173, 1, 1, 1, 1, 1,
-1.153013, -1.137601, -2.087791, 1, 1, 1, 1, 1,
-1.151744, -1.077942, -2.010119, 1, 1, 1, 1, 1,
-1.151742, 0.3252612, -1.892817, 1, 1, 1, 1, 1,
-1.139333, 0.3960321, -1.519687, 1, 1, 1, 1, 1,
-1.139296, -0.07098689, -2.204744, 1, 1, 1, 1, 1,
-1.137011, -0.5683446, -3.522817, 1, 1, 1, 1, 1,
-1.135651, 0.3227669, -1.397676, 0, 0, 1, 1, 1,
-1.133435, 1.571392, -2.213415, 1, 0, 0, 1, 1,
-1.126395, -0.6733916, -2.649594, 1, 0, 0, 1, 1,
-1.124278, -0.9595202, -1.866019, 1, 0, 0, 1, 1,
-1.119297, 0.4283647, -0.8625909, 1, 0, 0, 1, 1,
-1.118185, -1.12908, -1.358491, 1, 0, 0, 1, 1,
-1.11797, -0.6045089, -2.922032, 0, 0, 0, 1, 1,
-1.110666, 1.520983, -0.7885646, 0, 0, 0, 1, 1,
-1.108382, -0.8701428, -2.31128, 0, 0, 0, 1, 1,
-1.105829, -0.00509569, 0.5289053, 0, 0, 0, 1, 1,
-1.104375, 0.09328874, -1.270832, 0, 0, 0, 1, 1,
-1.101194, -0.8247945, -0.8338657, 0, 0, 0, 1, 1,
-1.095991, 0.8991442, 0.1962398, 0, 0, 0, 1, 1,
-1.080923, 1.025025, 0.04183435, 1, 1, 1, 1, 1,
-1.079544, -0.991073, -1.218428, 1, 1, 1, 1, 1,
-1.073872, 0.9634603, -1.31437, 1, 1, 1, 1, 1,
-1.071102, -0.798891, -1.760993, 1, 1, 1, 1, 1,
-1.068382, 0.3331975, -1.530224, 1, 1, 1, 1, 1,
-1.061588, 0.9546099, 0.101732, 1, 1, 1, 1, 1,
-1.0598, -0.6465061, -1.624023, 1, 1, 1, 1, 1,
-1.050456, -0.04946279, -2.103021, 1, 1, 1, 1, 1,
-1.046929, -2.753142, -3.134528, 1, 1, 1, 1, 1,
-1.044642, -0.9252391, -3.179508, 1, 1, 1, 1, 1,
-1.04232, -0.7408553, -1.27908, 1, 1, 1, 1, 1,
-1.041364, -0.3636261, -0.9435779, 1, 1, 1, 1, 1,
-1.032881, -0.4763249, -1.943822, 1, 1, 1, 1, 1,
-1.023559, 0.3025734, -1.770737, 1, 1, 1, 1, 1,
-1.020554, -1.795787, -2.024229, 1, 1, 1, 1, 1,
-1.017642, 0.2327805, 0.1957508, 0, 0, 1, 1, 1,
-1.017322, 0.6598806, -1.468308, 1, 0, 0, 1, 1,
-1.010729, 0.5952887, -2.995916, 1, 0, 0, 1, 1,
-1.00991, 0.3272585, -4.104108, 1, 0, 0, 1, 1,
-1.008289, 0.4411916, -0.9164651, 1, 0, 0, 1, 1,
-1.006383, -0.8132081, -0.7485111, 1, 0, 0, 1, 1,
-0.995954, -1.570722, -0.6971461, 0, 0, 0, 1, 1,
-0.9954255, 0.9631792, 0.358631, 0, 0, 0, 1, 1,
-0.9866713, 0.9712633, -0.2426569, 0, 0, 0, 1, 1,
-0.9770986, 1.073682, -0.6056401, 0, 0, 0, 1, 1,
-0.9627705, -0.8767011, -2.180293, 0, 0, 0, 1, 1,
-0.9623001, -1.287141, -3.285474, 0, 0, 0, 1, 1,
-0.9618964, 0.5953161, -0.93945, 0, 0, 0, 1, 1,
-0.9586165, -0.7235599, -2.697885, 1, 1, 1, 1, 1,
-0.9579222, 0.7415861, -2.389599, 1, 1, 1, 1, 1,
-0.9569454, -0.3160617, -3.660353, 1, 1, 1, 1, 1,
-0.9562119, 0.898142, -0.7598379, 1, 1, 1, 1, 1,
-0.9557771, -0.8559635, -2.036502, 1, 1, 1, 1, 1,
-0.9534151, -1.412547, -3.104199, 1, 1, 1, 1, 1,
-0.9490055, -1.166532, -1.155684, 1, 1, 1, 1, 1,
-0.9465968, -1.876756, -1.363852, 1, 1, 1, 1, 1,
-0.9434929, 0.1937145, 0.6694867, 1, 1, 1, 1, 1,
-0.9377305, 0.1674078, -0.9470395, 1, 1, 1, 1, 1,
-0.9318495, 0.7038292, -1.225793, 1, 1, 1, 1, 1,
-0.9277174, -0.3179961, -0.08126052, 1, 1, 1, 1, 1,
-0.9241977, 0.9431966, -0.3898243, 1, 1, 1, 1, 1,
-0.9226291, -0.2634691, -1.43072, 1, 1, 1, 1, 1,
-0.9204845, 1.39026, -0.156965, 1, 1, 1, 1, 1,
-0.9152926, 0.2375531, -0.7291016, 0, 0, 1, 1, 1,
-0.9143496, -0.1705388, -2.620291, 1, 0, 0, 1, 1,
-0.9135714, 1.817814, 0.2150805, 1, 0, 0, 1, 1,
-0.9132527, -0.450721, -1.913539, 1, 0, 0, 1, 1,
-0.9094373, -1.859888, -3.111121, 1, 0, 0, 1, 1,
-0.9060836, 0.2164398, -2.225244, 1, 0, 0, 1, 1,
-0.9048206, -0.3990582, -1.251564, 0, 0, 0, 1, 1,
-0.9008206, -1.719141, -3.338665, 0, 0, 0, 1, 1,
-0.8967257, -0.9655796, -2.315614, 0, 0, 0, 1, 1,
-0.8939217, -1.254938, -2.148813, 0, 0, 0, 1, 1,
-0.8925453, 0.3976122, -0.9476203, 0, 0, 0, 1, 1,
-0.8879731, 1.523668, -0.6870543, 0, 0, 0, 1, 1,
-0.882164, -1.188243, -1.760865, 0, 0, 0, 1, 1,
-0.8598587, 0.6757452, -3.725328, 1, 1, 1, 1, 1,
-0.858709, -0.1348851, -2.519126, 1, 1, 1, 1, 1,
-0.8580491, -0.7733773, -1.771203, 1, 1, 1, 1, 1,
-0.853204, 0.3689362, -1.988517, 1, 1, 1, 1, 1,
-0.8516041, 0.1011962, -1.582777, 1, 1, 1, 1, 1,
-0.8497893, -1.605103, -3.261333, 1, 1, 1, 1, 1,
-0.8477665, 0.1889471, -1.312952, 1, 1, 1, 1, 1,
-0.84266, -0.7995148, -1.386962, 1, 1, 1, 1, 1,
-0.8408014, 0.7218832, -1.171181, 1, 1, 1, 1, 1,
-0.8339543, -0.7173283, -4.195221, 1, 1, 1, 1, 1,
-0.8291513, -0.8332445, -1.674392, 1, 1, 1, 1, 1,
-0.828782, 1.283565, 0.78971, 1, 1, 1, 1, 1,
-0.8275826, -0.3667911, -1.49991, 1, 1, 1, 1, 1,
-0.8249764, -0.3114006, -2.957277, 1, 1, 1, 1, 1,
-0.8244526, 0.5278554, 0.2022066, 1, 1, 1, 1, 1,
-0.8232738, 1.214658, -1.366472, 0, 0, 1, 1, 1,
-0.8220934, -0.9260673, -2.15149, 1, 0, 0, 1, 1,
-0.8217019, 0.5564775, -0.5475764, 1, 0, 0, 1, 1,
-0.8215178, -0.1915677, -1.360551, 1, 0, 0, 1, 1,
-0.8176103, -1.772418, -1.603758, 1, 0, 0, 1, 1,
-0.8164817, -0.1670693, -3.726886, 1, 0, 0, 1, 1,
-0.8113102, 0.2319017, -1.16473, 0, 0, 0, 1, 1,
-0.8100829, 0.1315151, -1.329398, 0, 0, 0, 1, 1,
-0.8062133, 0.3884549, -2.822888, 0, 0, 0, 1, 1,
-0.7991287, -0.9828464, -3.047191, 0, 0, 0, 1, 1,
-0.7958354, 0.2916345, -1.322376, 0, 0, 0, 1, 1,
-0.7885429, -0.3559109, -2.791008, 0, 0, 0, 1, 1,
-0.773551, 1.289436, -1.013678, 0, 0, 0, 1, 1,
-0.7687315, -0.5202447, -0.1598664, 1, 1, 1, 1, 1,
-0.7661151, 1.736236, -0.007148245, 1, 1, 1, 1, 1,
-0.7649907, 1.323846, -1.377769, 1, 1, 1, 1, 1,
-0.7587363, -0.363232, -2.834337, 1, 1, 1, 1, 1,
-0.7537565, 0.7250351, -2.059399, 1, 1, 1, 1, 1,
-0.7533222, 0.6225902, 0.08419423, 1, 1, 1, 1, 1,
-0.7529028, -0.7986627, -0.3095195, 1, 1, 1, 1, 1,
-0.7522135, 0.1134565, -1.617621, 1, 1, 1, 1, 1,
-0.7507009, 0.08895714, -0.1912736, 1, 1, 1, 1, 1,
-0.7446256, -1.641071, -2.391155, 1, 1, 1, 1, 1,
-0.7369223, -0.1456082, -1.990677, 1, 1, 1, 1, 1,
-0.7338724, 1.459322, -1.240686, 1, 1, 1, 1, 1,
-0.7327362, -0.5069513, -0.7802612, 1, 1, 1, 1, 1,
-0.7297671, 1.066063, -2.452937, 1, 1, 1, 1, 1,
-0.7280491, 0.1010436, 0.2317263, 1, 1, 1, 1, 1,
-0.724415, -1.494547, -4.097747, 0, 0, 1, 1, 1,
-0.7163352, -0.9833267, -1.94439, 1, 0, 0, 1, 1,
-0.7119451, 0.8223424, -0.8628432, 1, 0, 0, 1, 1,
-0.7103918, 0.3938209, -2.407524, 1, 0, 0, 1, 1,
-0.7094793, 0.7129923, -0.2985156, 1, 0, 0, 1, 1,
-0.7060373, 1.091255, -0.6206864, 1, 0, 0, 1, 1,
-0.7051302, -1.570997, -2.477775, 0, 0, 0, 1, 1,
-0.7031629, -1.223869, -2.503472, 0, 0, 0, 1, 1,
-0.6996247, -0.5649769, -3.237473, 0, 0, 0, 1, 1,
-0.6994441, -1.203671, -2.780426, 0, 0, 0, 1, 1,
-0.697126, 1.135876, 0.2536229, 0, 0, 0, 1, 1,
-0.6969291, -0.2884866, -2.889137, 0, 0, 0, 1, 1,
-0.6934389, 1.686366, 1.315546, 0, 0, 0, 1, 1,
-0.6900998, -0.86785, 0.3040096, 1, 1, 1, 1, 1,
-0.6891565, -1.586987, -2.094254, 1, 1, 1, 1, 1,
-0.6874341, 0.9105124, -1.213896, 1, 1, 1, 1, 1,
-0.68716, 0.2345659, -2.103889, 1, 1, 1, 1, 1,
-0.6862003, 0.3525364, -0.9248459, 1, 1, 1, 1, 1,
-0.6855888, -0.7151929, -1.65697, 1, 1, 1, 1, 1,
-0.684328, -0.03652304, -1.215486, 1, 1, 1, 1, 1,
-0.6805907, -0.189234, -2.559596, 1, 1, 1, 1, 1,
-0.671548, 2.600996, -0.5696822, 1, 1, 1, 1, 1,
-0.6699539, 1.485861, 0.9092913, 1, 1, 1, 1, 1,
-0.6679595, -0.4788187, -0.7642837, 1, 1, 1, 1, 1,
-0.6646925, 0.9318249, -2.136191, 1, 1, 1, 1, 1,
-0.6569567, 0.5845454, -0.4679339, 1, 1, 1, 1, 1,
-0.6512046, -0.9046915, -2.202456, 1, 1, 1, 1, 1,
-0.6497421, -0.5009906, -2.012794, 1, 1, 1, 1, 1,
-0.6494805, -1.123514, -1.194239, 0, 0, 1, 1, 1,
-0.6494131, -0.06419884, -1.602311, 1, 0, 0, 1, 1,
-0.6493568, -0.5938863, -0.770999, 1, 0, 0, 1, 1,
-0.6475242, -0.4483915, -1.978273, 1, 0, 0, 1, 1,
-0.6474128, -0.5740885, -2.096434, 1, 0, 0, 1, 1,
-0.6460754, -0.2559445, -3.015941, 1, 0, 0, 1, 1,
-0.6457526, 0.1417117, -1.245489, 0, 0, 0, 1, 1,
-0.6447783, -0.2012659, -2.557645, 0, 0, 0, 1, 1,
-0.6426349, -0.1622166, -2.092277, 0, 0, 0, 1, 1,
-0.6389477, 0.564141, -1.489562, 0, 0, 0, 1, 1,
-0.6344788, -0.1509954, -2.643135, 0, 0, 0, 1, 1,
-0.6340839, -1.148867, -1.045274, 0, 0, 0, 1, 1,
-0.6339749, 0.4307563, -1.073614, 0, 0, 0, 1, 1,
-0.6253215, 0.8336495, 0.194449, 1, 1, 1, 1, 1,
-0.6242735, -0.1114828, -4.880182, 1, 1, 1, 1, 1,
-0.6198664, 0.2905857, -1.474409, 1, 1, 1, 1, 1,
-0.6191233, -0.2071136, 0.4522275, 1, 1, 1, 1, 1,
-0.6105758, 0.3111156, -0.6274893, 1, 1, 1, 1, 1,
-0.6080859, 1.980807, -1.019977, 1, 1, 1, 1, 1,
-0.6060988, -0.01425583, -2.259866, 1, 1, 1, 1, 1,
-0.6058166, -0.4315699, -2.331743, 1, 1, 1, 1, 1,
-0.6037093, 0.2704302, 0.9288486, 1, 1, 1, 1, 1,
-0.6025071, 1.187899, 1.687018, 1, 1, 1, 1, 1,
-0.5967358, 0.1895598, -1.224917, 1, 1, 1, 1, 1,
-0.5957422, -0.1604935, -1.750428, 1, 1, 1, 1, 1,
-0.5912625, -0.01464946, -1.549454, 1, 1, 1, 1, 1,
-0.5886432, 1.115284, 0.5932078, 1, 1, 1, 1, 1,
-0.5810459, 0.1735998, 0.1569758, 1, 1, 1, 1, 1,
-0.577598, 0.01018222, -3.200943, 0, 0, 1, 1, 1,
-0.5733587, 0.1110765, -0.4805724, 1, 0, 0, 1, 1,
-0.5681725, -0.8100685, -3.223368, 1, 0, 0, 1, 1,
-0.5658014, 1.486901, -0.7737866, 1, 0, 0, 1, 1,
-0.5596996, -0.5887552, -1.70474, 1, 0, 0, 1, 1,
-0.5590196, -1.594348, -1.463591, 1, 0, 0, 1, 1,
-0.5573583, -0.6336765, -0.9517446, 0, 0, 0, 1, 1,
-0.5560334, 1.386581, 0.2560654, 0, 0, 0, 1, 1,
-0.5559875, -0.876654, -1.299426, 0, 0, 0, 1, 1,
-0.5471634, 0.8636243, -1.272136, 0, 0, 0, 1, 1,
-0.5326829, 1.004257, -0.549717, 0, 0, 0, 1, 1,
-0.5294046, -0.4467103, -1.086048, 0, 0, 0, 1, 1,
-0.5247766, -1.15214, -2.947794, 0, 0, 0, 1, 1,
-0.5240018, 1.046624, -0.9762543, 1, 1, 1, 1, 1,
-0.5147707, -0.9677995, -3.445098, 1, 1, 1, 1, 1,
-0.5097494, -0.8142337, -2.806135, 1, 1, 1, 1, 1,
-0.5073239, -0.9519358, -1.779859, 1, 1, 1, 1, 1,
-0.4973183, -0.1981153, -1.143378, 1, 1, 1, 1, 1,
-0.4964686, 0.80736, -1.72757, 1, 1, 1, 1, 1,
-0.4904127, -1.862001, -4.472103, 1, 1, 1, 1, 1,
-0.4829568, 0.4310001, -0.3289691, 1, 1, 1, 1, 1,
-0.4800986, 0.4469849, 0.3625182, 1, 1, 1, 1, 1,
-0.4751128, 1.149684, -1.626385, 1, 1, 1, 1, 1,
-0.4692712, -1.082739, -1.804437, 1, 1, 1, 1, 1,
-0.46628, -0.08490017, -1.5497, 1, 1, 1, 1, 1,
-0.4563638, -1.517155, -1.684828, 1, 1, 1, 1, 1,
-0.4514917, 0.2032638, -0.58806, 1, 1, 1, 1, 1,
-0.451362, 1.609809, -1.496148, 1, 1, 1, 1, 1,
-0.4424927, -0.5343424, -0.1124764, 0, 0, 1, 1, 1,
-0.4408079, -0.6991171, -2.584423, 1, 0, 0, 1, 1,
-0.4390017, 0.03343622, -1.679054, 1, 0, 0, 1, 1,
-0.4365714, 1.129182, -1.557726, 1, 0, 0, 1, 1,
-0.4347252, -0.8673108, -4.909716, 1, 0, 0, 1, 1,
-0.4343581, 0.2342188, -2.126944, 1, 0, 0, 1, 1,
-0.4335841, 1.650483, -2.001487, 0, 0, 0, 1, 1,
-0.433469, -0.08199951, -2.107948, 0, 0, 0, 1, 1,
-0.4307306, -0.5142175, -3.443362, 0, 0, 0, 1, 1,
-0.4249963, 0.9114186, -0.3774726, 0, 0, 0, 1, 1,
-0.4129239, 0.4649513, -2.001252, 0, 0, 0, 1, 1,
-0.4115924, 0.3319796, -0.304887, 0, 0, 0, 1, 1,
-0.4079442, -1.081957, -3.783545, 0, 0, 0, 1, 1,
-0.4057334, 1.013867, -0.3802764, 1, 1, 1, 1, 1,
-0.4016661, 0.9547406, -0.3453313, 1, 1, 1, 1, 1,
-0.3992562, 0.5524944, -1.590738, 1, 1, 1, 1, 1,
-0.3991686, 0.3130113, -2.794181, 1, 1, 1, 1, 1,
-0.3949313, 0.2512576, -1.465043, 1, 1, 1, 1, 1,
-0.3917069, 1.490227, -0.4015374, 1, 1, 1, 1, 1,
-0.3910393, 0.1763181, -3.487768, 1, 1, 1, 1, 1,
-0.3897145, 1.444164, -0.4081591, 1, 1, 1, 1, 1,
-0.3877774, -1.367285, -4.018043, 1, 1, 1, 1, 1,
-0.3790314, 0.09743313, 0.1344899, 1, 1, 1, 1, 1,
-0.3785622, -1.555623, -3.874077, 1, 1, 1, 1, 1,
-0.3764501, -1.099393, -3.365655, 1, 1, 1, 1, 1,
-0.3763225, 0.1710689, -1.152336, 1, 1, 1, 1, 1,
-0.3709454, -0.4717642, -3.05251, 1, 1, 1, 1, 1,
-0.3645261, 0.6154916, -0.2283172, 1, 1, 1, 1, 1,
-0.3616448, 2.21429, -1.221124, 0, 0, 1, 1, 1,
-0.355007, 1.165717, -0.8887658, 1, 0, 0, 1, 1,
-0.3492121, 0.7331917, -0.3779477, 1, 0, 0, 1, 1,
-0.3453894, -0.3732215, 0.200172, 1, 0, 0, 1, 1,
-0.3443457, 2.782233, 0.2544811, 1, 0, 0, 1, 1,
-0.3350784, 0.5978113, -1.345677, 1, 0, 0, 1, 1,
-0.3283621, 0.9191973, -1.339955, 0, 0, 0, 1, 1,
-0.3276131, 1.183818, 0.08163392, 0, 0, 0, 1, 1,
-0.3266543, -0.3123753, -1.922881, 0, 0, 0, 1, 1,
-0.3257494, 0.3804939, -2.934245, 0, 0, 0, 1, 1,
-0.3227747, 0.6354686, -0.6116286, 0, 0, 0, 1, 1,
-0.3212302, -1.787108, -1.803942, 0, 0, 0, 1, 1,
-0.3193194, 1.324378, -0.340794, 0, 0, 0, 1, 1,
-0.3148363, 0.6084448, -0.9187356, 1, 1, 1, 1, 1,
-0.3144724, -0.4059597, -4.651888, 1, 1, 1, 1, 1,
-0.311561, -0.231427, -0.6173291, 1, 1, 1, 1, 1,
-0.3113845, 0.2736803, -1.001435, 1, 1, 1, 1, 1,
-0.3107703, 2.136735, -0.001541673, 1, 1, 1, 1, 1,
-0.3068004, 0.3068949, -0.4252984, 1, 1, 1, 1, 1,
-0.3048683, -0.3025177, -2.103356, 1, 1, 1, 1, 1,
-0.3005123, -1.062352, -2.678293, 1, 1, 1, 1, 1,
-0.29916, -0.5731195, -0.5525863, 1, 1, 1, 1, 1,
-0.2975232, -0.2861178, -2.712364, 1, 1, 1, 1, 1,
-0.2966328, 0.6625488, 0.6413094, 1, 1, 1, 1, 1,
-0.2880934, -0.9908559, -4.124714, 1, 1, 1, 1, 1,
-0.2846077, -0.6227606, -4.155637, 1, 1, 1, 1, 1,
-0.2842077, 0.7774608, -0.6418427, 1, 1, 1, 1, 1,
-0.2820685, -0.680004, -2.751841, 1, 1, 1, 1, 1,
-0.2787013, 0.3940905, -1.501652, 0, 0, 1, 1, 1,
-0.270783, -1.181075, -3.121499, 1, 0, 0, 1, 1,
-0.2672441, 0.1577531, -1.642945, 1, 0, 0, 1, 1,
-0.2606847, 0.6933437, -0.2757418, 1, 0, 0, 1, 1,
-0.2591088, 2.163209, -0.6958348, 1, 0, 0, 1, 1,
-0.2561001, 1.728816, 0.4062571, 1, 0, 0, 1, 1,
-0.2515513, 0.7917492, -0.799028, 0, 0, 0, 1, 1,
-0.251141, 0.342078, -1.339824, 0, 0, 0, 1, 1,
-0.2493799, -1.956109, -4.106692, 0, 0, 0, 1, 1,
-0.24738, 1.777298, -0.8196179, 0, 0, 0, 1, 1,
-0.2460252, 1.239536, -1.052694, 0, 0, 0, 1, 1,
-0.2452269, 1.101716, -1.029115, 0, 0, 0, 1, 1,
-0.2444982, 0.6268141, -1.269431, 0, 0, 0, 1, 1,
-0.243993, -0.1069013, -4.004081, 1, 1, 1, 1, 1,
-0.2436606, -1.446922, -2.600184, 1, 1, 1, 1, 1,
-0.2418292, 0.4525343, -1.647714, 1, 1, 1, 1, 1,
-0.2401537, -0.2366546, -2.866835, 1, 1, 1, 1, 1,
-0.2392594, 0.5405374, -0.5724683, 1, 1, 1, 1, 1,
-0.2335474, 1.057777, 0.9888456, 1, 1, 1, 1, 1,
-0.2324415, -0.523868, -1.052044, 1, 1, 1, 1, 1,
-0.2310332, -0.3057348, -3.465142, 1, 1, 1, 1, 1,
-0.2305986, 0.9753293, -0.371366, 1, 1, 1, 1, 1,
-0.2262102, 1.399272, 0.7713018, 1, 1, 1, 1, 1,
-0.2208429, -0.411036, -3.520342, 1, 1, 1, 1, 1,
-0.2140739, 1.880177, 0.3710919, 1, 1, 1, 1, 1,
-0.2023909, -2.058477, -2.777373, 1, 1, 1, 1, 1,
-0.2013819, 1.169261, -1.500627, 1, 1, 1, 1, 1,
-0.194449, 0.9545186, -0.9505622, 1, 1, 1, 1, 1,
-0.1919859, -0.9159604, -3.563649, 0, 0, 1, 1, 1,
-0.1893777, 0.06272858, -1.474442, 1, 0, 0, 1, 1,
-0.1878112, 0.2354878, -0.7260134, 1, 0, 0, 1, 1,
-0.1874456, -0.33433, -1.047017, 1, 0, 0, 1, 1,
-0.1861919, 0.01748797, -2.774295, 1, 0, 0, 1, 1,
-0.1827593, -0.07921425, -2.263272, 1, 0, 0, 1, 1,
-0.1799742, -0.4158608, -2.224598, 0, 0, 0, 1, 1,
-0.1783237, -1.16699, -1.904788, 0, 0, 0, 1, 1,
-0.1781645, -0.8365174, -3.203565, 0, 0, 0, 1, 1,
-0.1778281, -1.107777, -2.424576, 0, 0, 0, 1, 1,
-0.1651135, -0.6823239, -2.152367, 0, 0, 0, 1, 1,
-0.1643724, 1.182021, 0.5226656, 0, 0, 0, 1, 1,
-0.1641551, -2.051137, -4.038391, 0, 0, 0, 1, 1,
-0.1638039, 0.4285467, 1.644794, 1, 1, 1, 1, 1,
-0.1620902, -0.80292, -3.303885, 1, 1, 1, 1, 1,
-0.1617035, -0.02276796, -2.082042, 1, 1, 1, 1, 1,
-0.1612851, -2.076875, -1.813017, 1, 1, 1, 1, 1,
-0.153969, -0.2317942, -4.643033, 1, 1, 1, 1, 1,
-0.1524588, 0.7452406, -0.4369558, 1, 1, 1, 1, 1,
-0.1478411, 0.857244, 1.068907, 1, 1, 1, 1, 1,
-0.140796, 0.3679546, -0.9944736, 1, 1, 1, 1, 1,
-0.1399937, 0.2571629, -0.2849925, 1, 1, 1, 1, 1,
-0.1379354, 1.168534, -0.2997443, 1, 1, 1, 1, 1,
-0.1373781, 0.5017314, -0.08882846, 1, 1, 1, 1, 1,
-0.1327466, -1.894061, -4.327414, 1, 1, 1, 1, 1,
-0.127434, 0.6419786, -0.3366005, 1, 1, 1, 1, 1,
-0.1274122, 0.05846528, -1.376655, 1, 1, 1, 1, 1,
-0.1261377, -1.624201, -2.619201, 1, 1, 1, 1, 1,
-0.1259511, 0.642484, -0.2418033, 0, 0, 1, 1, 1,
-0.1220218, -1.226161, -3.337513, 1, 0, 0, 1, 1,
-0.1212353, -2.731958, -3.102037, 1, 0, 0, 1, 1,
-0.119438, -1.059482, -4.491421, 1, 0, 0, 1, 1,
-0.1180406, 1.803527, 1.35612, 1, 0, 0, 1, 1,
-0.1179415, 0.5505039, -1.026781, 1, 0, 0, 1, 1,
-0.1143855, -0.04814567, -1.365415, 0, 0, 0, 1, 1,
-0.1119177, 0.5882975, -1.157985, 0, 0, 0, 1, 1,
-0.1106002, -1.332368, -1.413314, 0, 0, 0, 1, 1,
-0.1090549, 0.2906045, -0.8633536, 0, 0, 0, 1, 1,
-0.1068614, -2.102272, -2.837423, 0, 0, 0, 1, 1,
-0.1044474, -1.485965, -3.214784, 0, 0, 0, 1, 1,
-0.09947906, -1.888174, -4.344976, 0, 0, 0, 1, 1,
-0.09683512, 0.2417028, -1.340958, 1, 1, 1, 1, 1,
-0.09273506, -0.6831189, -3.514672, 1, 1, 1, 1, 1,
-0.09148686, 0.1357003, -1.195871, 1, 1, 1, 1, 1,
-0.09099371, -0.4778296, -4.023363, 1, 1, 1, 1, 1,
-0.08008811, 1.147559, 0.4307393, 1, 1, 1, 1, 1,
-0.07957695, 0.8167679, -0.618527, 1, 1, 1, 1, 1,
-0.07939831, -1.168557, -2.889246, 1, 1, 1, 1, 1,
-0.07780688, 0.1738554, -1.287726, 1, 1, 1, 1, 1,
-0.07568339, 0.5335182, 1.819239, 1, 1, 1, 1, 1,
-0.06925011, -0.1859865, -3.32501, 1, 1, 1, 1, 1,
-0.06924202, -1.295071, -1.551548, 1, 1, 1, 1, 1,
-0.06783011, -0.2979683, -3.156835, 1, 1, 1, 1, 1,
-0.06568495, -0.03044579, -1.256302, 1, 1, 1, 1, 1,
-0.06328464, -0.4679971, -1.36525, 1, 1, 1, 1, 1,
-0.06259382, 1.129545, -0.5694664, 1, 1, 1, 1, 1,
-0.06126752, -0.5633474, -1.791889, 0, 0, 1, 1, 1,
-0.06112888, 0.940739, 1.825857, 1, 0, 0, 1, 1,
-0.06090437, -0.5602659, -1.810916, 1, 0, 0, 1, 1,
-0.05956577, -1.261986, -1.421614, 1, 0, 0, 1, 1,
-0.05936664, 0.6219298, 0.6475186, 1, 0, 0, 1, 1,
-0.05753454, -0.404548, -3.775389, 1, 0, 0, 1, 1,
-0.05326929, -0.953935, -3.42428, 0, 0, 0, 1, 1,
-0.05001609, -0.2843498, -1.553585, 0, 0, 0, 1, 1,
-0.04818048, -1.050367, -3.730292, 0, 0, 0, 1, 1,
-0.0368791, -0.6719163, -2.546554, 0, 0, 0, 1, 1,
-0.03605116, -0.3004707, -3.958778, 0, 0, 0, 1, 1,
-0.03602171, 1.342224, -0.2790689, 0, 0, 0, 1, 1,
-0.03401614, 0.4915054, -0.720401, 0, 0, 0, 1, 1,
-0.03358201, 1.266019, 1.551576, 1, 1, 1, 1, 1,
-0.03147764, 0.04586668, -1.243833, 1, 1, 1, 1, 1,
-0.03053387, -0.4291634, -3.399003, 1, 1, 1, 1, 1,
-0.02947913, 0.6073087, 0.723971, 1, 1, 1, 1, 1,
-0.02817393, 0.9833376, 1.362985, 1, 1, 1, 1, 1,
-0.02724801, 0.3853431, -1.216214, 1, 1, 1, 1, 1,
-0.01982162, -1.417213, -3.317085, 1, 1, 1, 1, 1,
-0.009826182, 1.771324, -2.091285, 1, 1, 1, 1, 1,
-0.008123509, 0.2181696, 0.5785826, 1, 1, 1, 1, 1,
0.0009839393, -1.005288, 3.219936, 1, 1, 1, 1, 1,
0.002619349, -1.145192, 2.001963, 1, 1, 1, 1, 1,
0.007788694, 1.416545, -1.300269, 1, 1, 1, 1, 1,
0.008574477, -0.4056861, 5.423523, 1, 1, 1, 1, 1,
0.008848651, 0.8003933, 0.03178798, 1, 1, 1, 1, 1,
0.01019099, 0.5511724, -0.8614734, 1, 1, 1, 1, 1,
0.01593886, -1.586825, 2.52474, 0, 0, 1, 1, 1,
0.02079035, 1.413886, 0.09839262, 1, 0, 0, 1, 1,
0.02788016, 0.9582274, 1.312952, 1, 0, 0, 1, 1,
0.03038288, 0.5217378, 0.3298163, 1, 0, 0, 1, 1,
0.0311724, -0.6918463, 4.607067, 1, 0, 0, 1, 1,
0.0314121, 0.3139885, -0.6977946, 1, 0, 0, 1, 1,
0.03569829, -0.3994263, 3.160649, 0, 0, 0, 1, 1,
0.03979523, 0.03828711, -0.2974105, 0, 0, 0, 1, 1,
0.03985427, 0.02611791, 3.070172, 0, 0, 0, 1, 1,
0.04089133, 0.3345824, -0.1982318, 0, 0, 0, 1, 1,
0.04093837, -1.55706, 3.975617, 0, 0, 0, 1, 1,
0.0429677, 0.8088355, 1.284455, 0, 0, 0, 1, 1,
0.04383978, -0.6997244, 2.520738, 0, 0, 0, 1, 1,
0.04399625, -1.215129, 3.370621, 1, 1, 1, 1, 1,
0.05060902, -0.516745, 1.982733, 1, 1, 1, 1, 1,
0.05286067, -0.681935, 2.79767, 1, 1, 1, 1, 1,
0.06207833, -0.7968708, 2.040824, 1, 1, 1, 1, 1,
0.06228806, 0.8099076, 0.03849515, 1, 1, 1, 1, 1,
0.06330568, -0.4110807, 3.060456, 1, 1, 1, 1, 1,
0.06416928, 1.245712, 0.0389469, 1, 1, 1, 1, 1,
0.07126881, -0.009269209, 1.333827, 1, 1, 1, 1, 1,
0.07212105, 0.215739, 0.05574293, 1, 1, 1, 1, 1,
0.07218746, 0.5783998, -2.022318, 1, 1, 1, 1, 1,
0.074858, 0.07065805, 0.778111, 1, 1, 1, 1, 1,
0.07612562, 1.371312, -0.4339273, 1, 1, 1, 1, 1,
0.07706719, -0.09680893, 2.24227, 1, 1, 1, 1, 1,
0.08366939, 1.796788, -0.07593512, 1, 1, 1, 1, 1,
0.08734292, 1.016629, -0.1033206, 1, 1, 1, 1, 1,
0.08910159, 0.7681373, -0.2746527, 0, 0, 1, 1, 1,
0.09244838, 1.332839, -0.3390505, 1, 0, 0, 1, 1,
0.09468976, -1.184948, 4.69506, 1, 0, 0, 1, 1,
0.0950615, -0.2637463, -0.4615873, 1, 0, 0, 1, 1,
0.09513492, 0.4676977, -1.101726, 1, 0, 0, 1, 1,
0.09540936, 1.040474, 1.344507, 1, 0, 0, 1, 1,
0.0966409, 0.3205599, 1.666475, 0, 0, 0, 1, 1,
0.101931, -0.8616953, 2.217215, 0, 0, 0, 1, 1,
0.1021771, -0.2958258, 3.595812, 0, 0, 0, 1, 1,
0.1037605, 0.2739748, 2.691918, 0, 0, 0, 1, 1,
0.1051269, -0.3266194, 3.163823, 0, 0, 0, 1, 1,
0.105799, 0.6691853, 1.460234, 0, 0, 0, 1, 1,
0.110013, -1.168089, 2.710412, 0, 0, 0, 1, 1,
0.1127541, 0.5162688, 1.063115, 1, 1, 1, 1, 1,
0.11366, -2.071848, 2.879927, 1, 1, 1, 1, 1,
0.1160234, -0.6916355, 2.162947, 1, 1, 1, 1, 1,
0.1192214, 0.2823331, -0.3137081, 1, 1, 1, 1, 1,
0.1249269, -0.8341556, 3.021212, 1, 1, 1, 1, 1,
0.1263143, -1.236213, 3.484387, 1, 1, 1, 1, 1,
0.1268216, -0.8643767, 4.061284, 1, 1, 1, 1, 1,
0.1273227, -0.7731982, 5.119438, 1, 1, 1, 1, 1,
0.1311006, -0.2592736, 3.158134, 1, 1, 1, 1, 1,
0.1326064, -0.174178, 2.506424, 1, 1, 1, 1, 1,
0.1381723, -2.603167, 1.283547, 1, 1, 1, 1, 1,
0.1387487, 0.9130946, 0.8976802, 1, 1, 1, 1, 1,
0.1411864, -1.308804, 4.666166, 1, 1, 1, 1, 1,
0.1416068, 0.333771, 1.172936, 1, 1, 1, 1, 1,
0.1455015, 0.6026552, -0.574202, 1, 1, 1, 1, 1,
0.1469102, 0.9716508, -0.5789857, 0, 0, 1, 1, 1,
0.1490245, 0.902409, 0.2423377, 1, 0, 0, 1, 1,
0.1493864, -0.08835683, 1.027979, 1, 0, 0, 1, 1,
0.1505328, -2.238218, 1.627719, 1, 0, 0, 1, 1,
0.1527573, 1.081862, 0.3848773, 1, 0, 0, 1, 1,
0.159189, 0.9479643, -0.06824198, 1, 0, 0, 1, 1,
0.1604375, 0.04662881, -0.4352463, 0, 0, 0, 1, 1,
0.160621, 0.3184562, -1.168216, 0, 0, 0, 1, 1,
0.1607138, -2.094848, 4.231225, 0, 0, 0, 1, 1,
0.1647266, 0.6904501, -0.7581486, 0, 0, 0, 1, 1,
0.1674865, 0.872057, 2.137912, 0, 0, 0, 1, 1,
0.1684296, -0.04508303, 1.90118, 0, 0, 0, 1, 1,
0.1701726, 0.7551852, 0.3117204, 0, 0, 0, 1, 1,
0.1717366, 1.269377, 1.381284, 1, 1, 1, 1, 1,
0.1723061, 0.6600697, 0.9225203, 1, 1, 1, 1, 1,
0.1740411, -0.4267609, 3.240832, 1, 1, 1, 1, 1,
0.1875592, 0.3133751, 0.684667, 1, 1, 1, 1, 1,
0.1910216, 0.4589699, 0.5590071, 1, 1, 1, 1, 1,
0.1916326, 0.1524835, 0.7186144, 1, 1, 1, 1, 1,
0.1932987, -0.6698968, 1.578712, 1, 1, 1, 1, 1,
0.1968165, 0.8160162, -0.2828425, 1, 1, 1, 1, 1,
0.1999256, -0.01494811, 2.538166, 1, 1, 1, 1, 1,
0.2021168, 1.050036, 0.4890583, 1, 1, 1, 1, 1,
0.2032533, -0.7656093, 1.477357, 1, 1, 1, 1, 1,
0.2057533, 0.4093704, 0.5920763, 1, 1, 1, 1, 1,
0.2067367, 1.05492, 0.5068925, 1, 1, 1, 1, 1,
0.2073624, 0.6388537, 1.037155, 1, 1, 1, 1, 1,
0.208285, 0.07796312, 1.001381, 1, 1, 1, 1, 1,
0.2144132, 1.79242, -0.2279496, 0, 0, 1, 1, 1,
0.2194682, -0.7940645, 3.140135, 1, 0, 0, 1, 1,
0.2240051, 1.037297, -0.4139805, 1, 0, 0, 1, 1,
0.2261737, -0.2811024, 2.570218, 1, 0, 0, 1, 1,
0.2347128, -1.703633, 3.125699, 1, 0, 0, 1, 1,
0.2402055, -0.04230518, 1.417488, 1, 0, 0, 1, 1,
0.2454034, -2.744089, 1.744962, 0, 0, 0, 1, 1,
0.2540871, -0.8145326, 2.69486, 0, 0, 0, 1, 1,
0.2553589, -0.2280771, 1.939617, 0, 0, 0, 1, 1,
0.2563495, 0.3503734, 0.4045854, 0, 0, 0, 1, 1,
0.2584215, 0.7335277, 0.2507678, 0, 0, 0, 1, 1,
0.2602906, 0.4446498, 1.736199, 0, 0, 0, 1, 1,
0.2604967, 0.860449, 0.8615685, 0, 0, 0, 1, 1,
0.2613881, 1.520557, 0.5289952, 1, 1, 1, 1, 1,
0.262426, 1.126989, 0.4861447, 1, 1, 1, 1, 1,
0.2636801, -1.173258, 2.89514, 1, 1, 1, 1, 1,
0.2706776, 2.545926, 1.280246, 1, 1, 1, 1, 1,
0.2738235, 1.254746, 0.8026595, 1, 1, 1, 1, 1,
0.2759674, 0.8561451, -0.08015043, 1, 1, 1, 1, 1,
0.281214, 1.139671, -1.339089, 1, 1, 1, 1, 1,
0.2843894, 0.9977486, 0.2249124, 1, 1, 1, 1, 1,
0.2901896, 0.2524421, 0.2761608, 1, 1, 1, 1, 1,
0.2909819, 3.502406, -0.1018841, 1, 1, 1, 1, 1,
0.2914349, 0.3775145, 2.938455, 1, 1, 1, 1, 1,
0.291703, -0.2611774, 0.06989941, 1, 1, 1, 1, 1,
0.2924651, -0.7734703, 3.617629, 1, 1, 1, 1, 1,
0.2958974, -0.8118862, 2.615687, 1, 1, 1, 1, 1,
0.2990433, -0.5293738, 1.139107, 1, 1, 1, 1, 1,
0.300146, -0.1436119, 2.603704, 0, 0, 1, 1, 1,
0.3020853, 0.3380377, 0.4452975, 1, 0, 0, 1, 1,
0.3042585, -1.789619, 3.485882, 1, 0, 0, 1, 1,
0.3092763, 1.62914, 1.472622, 1, 0, 0, 1, 1,
0.3136646, 0.9890839, 0.7865738, 1, 0, 0, 1, 1,
0.3145671, 0.06805336, 1.197501, 1, 0, 0, 1, 1,
0.3172554, -1.113492, 2.572569, 0, 0, 0, 1, 1,
0.3202814, 1.008844, -0.405319, 0, 0, 0, 1, 1,
0.3204335, -3.204785, 2.016527, 0, 0, 0, 1, 1,
0.3227155, 0.8930004, 0.7597291, 0, 0, 0, 1, 1,
0.3255874, 0.4095023, -0.008423732, 0, 0, 0, 1, 1,
0.3270616, -1.292387, 2.802968, 0, 0, 0, 1, 1,
0.329495, 0.1080891, 1.369597, 0, 0, 0, 1, 1,
0.3336701, -1.152693, 3.259653, 1, 1, 1, 1, 1,
0.3421428, -1.336218, 2.911263, 1, 1, 1, 1, 1,
0.3440642, 1.001049, 0.7213111, 1, 1, 1, 1, 1,
0.3453777, -0.0883243, 2.447282, 1, 1, 1, 1, 1,
0.3469437, -0.3118504, 3.078803, 1, 1, 1, 1, 1,
0.3477754, 2.290789, 0.6509115, 1, 1, 1, 1, 1,
0.3478762, 1.478297, -2.421193, 1, 1, 1, 1, 1,
0.3484529, 0.6283206, 1.155137, 1, 1, 1, 1, 1,
0.3532957, -0.8946595, 4.257134, 1, 1, 1, 1, 1,
0.3584799, -0.3519853, 3.695558, 1, 1, 1, 1, 1,
0.3627548, -0.3334683, 3.130004, 1, 1, 1, 1, 1,
0.3667108, 0.8765484, 0.330816, 1, 1, 1, 1, 1,
0.367501, 0.09034859, -0.2063418, 1, 1, 1, 1, 1,
0.371293, 0.07697912, 1.092916, 1, 1, 1, 1, 1,
0.3717499, 0.4590898, 1.192309, 1, 1, 1, 1, 1,
0.3724916, -0.04669517, 0.2872599, 0, 0, 1, 1, 1,
0.3725237, -0.1930474, 1.981495, 1, 0, 0, 1, 1,
0.3733316, -0.2131144, 2.170714, 1, 0, 0, 1, 1,
0.3743331, 0.5331105, 2.311059, 1, 0, 0, 1, 1,
0.3781946, 0.6905276, 0.3784777, 1, 0, 0, 1, 1,
0.3795367, -2.398821, 1.44458, 1, 0, 0, 1, 1,
0.3879696, 0.206521, 1.18133, 0, 0, 0, 1, 1,
0.3888248, -0.06439939, 1.742648, 0, 0, 0, 1, 1,
0.3898349, 0.4189167, 0.6224388, 0, 0, 0, 1, 1,
0.3986878, 1.005296, 0.1397454, 0, 0, 0, 1, 1,
0.4020846, 1.06568, -0.1156208, 0, 0, 0, 1, 1,
0.4047104, -0.1358529, 3.417128, 0, 0, 0, 1, 1,
0.4153291, 0.8884957, -0.8890722, 0, 0, 0, 1, 1,
0.417385, -0.1231871, 2.280421, 1, 1, 1, 1, 1,
0.4198136, -0.4531944, 2.313967, 1, 1, 1, 1, 1,
0.4216184, -0.2673317, 1.060735, 1, 1, 1, 1, 1,
0.4226806, -1.863497, 4.696874, 1, 1, 1, 1, 1,
0.4251908, -0.2564385, 2.438066, 1, 1, 1, 1, 1,
0.425346, -0.7197576, 1.675965, 1, 1, 1, 1, 1,
0.4317617, -0.237649, 1.49913, 1, 1, 1, 1, 1,
0.4342265, -1.798925, 1.683267, 1, 1, 1, 1, 1,
0.4365779, 2.352845, -0.3959979, 1, 1, 1, 1, 1,
0.4379132, -0.3425184, 1.298075, 1, 1, 1, 1, 1,
0.439935, 0.02043413, 1.677179, 1, 1, 1, 1, 1,
0.4466564, -1.121018, 2.638742, 1, 1, 1, 1, 1,
0.4469217, -1.890324, 3.905246, 1, 1, 1, 1, 1,
0.4538346, 1.287485, 1.285292, 1, 1, 1, 1, 1,
0.4538482, 1.320038, 0.4575494, 1, 1, 1, 1, 1,
0.4590659, 0.360938, 1.21388, 0, 0, 1, 1, 1,
0.4591022, 0.6387718, 1.320365, 1, 0, 0, 1, 1,
0.4595447, -0.1079457, 1.630439, 1, 0, 0, 1, 1,
0.461272, 0.4100062, -0.05128694, 1, 0, 0, 1, 1,
0.4613042, 0.6650348, 0.5686202, 1, 0, 0, 1, 1,
0.4614285, 1.159152, -0.5285366, 1, 0, 0, 1, 1,
0.4676158, -0.4021401, 1.884661, 0, 0, 0, 1, 1,
0.4681121, -1.319026, 2.539484, 0, 0, 0, 1, 1,
0.4698338, 1.796861, 0.03329921, 0, 0, 0, 1, 1,
0.4723087, 0.5807796, -0.1647336, 0, 0, 0, 1, 1,
0.4770877, 0.0112204, 1.447761, 0, 0, 0, 1, 1,
0.4782472, -0.1694774, 1.770949, 0, 0, 0, 1, 1,
0.4794669, -0.894726, 2.755443, 0, 0, 0, 1, 1,
0.4805587, 1.082141, 1.415534, 1, 1, 1, 1, 1,
0.4874699, -1.940562, 3.703054, 1, 1, 1, 1, 1,
0.4882278, 0.122874, 1.178087, 1, 1, 1, 1, 1,
0.4887338, 2.587254, -2.220605, 1, 1, 1, 1, 1,
0.493865, -0.5207424, 2.235502, 1, 1, 1, 1, 1,
0.4962821, 1.116891, -0.6605112, 1, 1, 1, 1, 1,
0.496382, 0.8454931, 1.359231, 1, 1, 1, 1, 1,
0.5019544, 1.021247, 0.2275405, 1, 1, 1, 1, 1,
0.502978, 0.4470425, 1.348514, 1, 1, 1, 1, 1,
0.5082752, -0.05085404, 0.9282067, 1, 1, 1, 1, 1,
0.5096964, -0.7188561, 1.171084, 1, 1, 1, 1, 1,
0.5124835, -1.203213, 4.650947, 1, 1, 1, 1, 1,
0.5137112, -1.335548, 2.042125, 1, 1, 1, 1, 1,
0.5139997, -1.754426, 3.420496, 1, 1, 1, 1, 1,
0.5160193, 1.830343, -0.0899324, 1, 1, 1, 1, 1,
0.5161789, 0.1804775, 0.5137917, 0, 0, 1, 1, 1,
0.51809, 0.0512952, -1.228912, 1, 0, 0, 1, 1,
0.520395, -0.9412612, 3.457921, 1, 0, 0, 1, 1,
0.5205667, -1.175916, 2.091137, 1, 0, 0, 1, 1,
0.5214971, 0.6375003, -0.1832207, 1, 0, 0, 1, 1,
0.5215495, -1.742384, 2.771174, 1, 0, 0, 1, 1,
0.5230286, 0.605042, 1.11297, 0, 0, 0, 1, 1,
0.5255932, -1.464871, 3.371773, 0, 0, 0, 1, 1,
0.5294726, 1.316042, -0.3055307, 0, 0, 0, 1, 1,
0.5362936, 1.720119, -0.8223348, 0, 0, 0, 1, 1,
0.5401884, 0.9768831, 1.664108, 0, 0, 0, 1, 1,
0.5471135, 1.83409, 0.5461549, 0, 0, 0, 1, 1,
0.5478382, 0.2111977, 2.825059, 0, 0, 0, 1, 1,
0.5496864, 0.2586186, 2.440686, 1, 1, 1, 1, 1,
0.5586759, -2.150912, 2.986526, 1, 1, 1, 1, 1,
0.5593039, -0.166901, 1.312012, 1, 1, 1, 1, 1,
0.5599014, -1.312445, 2.98689, 1, 1, 1, 1, 1,
0.5628088, 0.6043462, -0.1032351, 1, 1, 1, 1, 1,
0.5673031, -1.393225, 0.4949642, 1, 1, 1, 1, 1,
0.5711279, 0.8822917, 1.683419, 1, 1, 1, 1, 1,
0.5752363, 1.03754, 2.147127, 1, 1, 1, 1, 1,
0.5811189, -0.6961708, 1.840876, 1, 1, 1, 1, 1,
0.5849135, -0.6292573, 1.303911, 1, 1, 1, 1, 1,
0.5931548, -0.7805714, 4.24582, 1, 1, 1, 1, 1,
0.5955601, 0.4987612, -0.6163049, 1, 1, 1, 1, 1,
0.5974839, -0.6883144, 0.5726545, 1, 1, 1, 1, 1,
0.5999545, 1.493425, 0.5461686, 1, 1, 1, 1, 1,
0.6011584, -0.4175012, 1.74439, 1, 1, 1, 1, 1,
0.6013285, -0.8134718, 1.769269, 0, 0, 1, 1, 1,
0.6110651, 0.2591531, 0.7026252, 1, 0, 0, 1, 1,
0.6141069, -1.524926, 2.981478, 1, 0, 0, 1, 1,
0.6169442, 0.7298911, 1.372874, 1, 0, 0, 1, 1,
0.6182958, 0.1864149, 0.9182498, 1, 0, 0, 1, 1,
0.6239371, 0.2814384, 2.610654, 1, 0, 0, 1, 1,
0.6290475, 0.7358112, 0.6466619, 0, 0, 0, 1, 1,
0.6302752, -0.6058254, 1.287448, 0, 0, 0, 1, 1,
0.6331902, -1.331711, 1.985805, 0, 0, 0, 1, 1,
0.6334381, 0.4662251, 0.645986, 0, 0, 0, 1, 1,
0.6346003, -2.103512, 2.756086, 0, 0, 0, 1, 1,
0.6420035, -0.1548513, 2.603721, 0, 0, 0, 1, 1,
0.6425409, 0.2335202, 2.59995, 0, 0, 0, 1, 1,
0.6479225, -1.515313, 0.8628291, 1, 1, 1, 1, 1,
0.6514868, 0.5607677, 0.5275394, 1, 1, 1, 1, 1,
0.6654763, -0.163731, 3.075594, 1, 1, 1, 1, 1,
0.6666486, 0.6292782, 1.753084, 1, 1, 1, 1, 1,
0.6680125, -0.3652504, -0.3511036, 1, 1, 1, 1, 1,
0.6682781, 1.009077, -0.2594643, 1, 1, 1, 1, 1,
0.6724566, -0.2199079, 1.076141, 1, 1, 1, 1, 1,
0.6783276, 1.984149, 2.525981, 1, 1, 1, 1, 1,
0.6841059, -1.2172, 3.066571, 1, 1, 1, 1, 1,
0.6846977, 0.1586812, 1.605554, 1, 1, 1, 1, 1,
0.685234, -0.727757, 3.359442, 1, 1, 1, 1, 1,
0.6877142, 1.159567, 1.7777, 1, 1, 1, 1, 1,
0.6894814, -0.4515253, 2.134241, 1, 1, 1, 1, 1,
0.690037, 0.724001, 0.6661947, 1, 1, 1, 1, 1,
0.6900964, -1.516917, 3.088238, 1, 1, 1, 1, 1,
0.6905292, 0.4384278, 0.167606, 0, 0, 1, 1, 1,
0.6934952, 0.2886793, 1.479185, 1, 0, 0, 1, 1,
0.6984747, 2.003633, 0.9096677, 1, 0, 0, 1, 1,
0.6986324, -1.133829, 2.303822, 1, 0, 0, 1, 1,
0.7086456, 0.8524157, 1.411616, 1, 0, 0, 1, 1,
0.710721, -0.1378277, 2.824404, 1, 0, 0, 1, 1,
0.7168121, -0.6133314, 2.508792, 0, 0, 0, 1, 1,
0.7381999, -1.026952, 1.688405, 0, 0, 0, 1, 1,
0.7400183, -0.08118877, 0.2577575, 0, 0, 0, 1, 1,
0.7436913, 1.707547, 0.1748235, 0, 0, 0, 1, 1,
0.7462127, -1.900941, 2.817106, 0, 0, 0, 1, 1,
0.7467031, -0.3708743, 0.7531202, 0, 0, 0, 1, 1,
0.7499284, -0.2725629, 2.652143, 0, 0, 0, 1, 1,
0.7519271, 1.238441, 0.5680495, 1, 1, 1, 1, 1,
0.7560482, 0.3378448, -0.1749867, 1, 1, 1, 1, 1,
0.758792, 0.4020941, 1.516761, 1, 1, 1, 1, 1,
0.7610797, -1.362554, 2.712538, 1, 1, 1, 1, 1,
0.7662396, 2.276188, -0.3230377, 1, 1, 1, 1, 1,
0.7693321, -0.0340419, 1.325036, 1, 1, 1, 1, 1,
0.7728311, -1.153645, 0.8557372, 1, 1, 1, 1, 1,
0.7735007, 1.27194, 2.395934, 1, 1, 1, 1, 1,
0.7756324, 0.2141911, 2.438902, 1, 1, 1, 1, 1,
0.7811617, 2.476108, 1.129664, 1, 1, 1, 1, 1,
0.7814194, 1.287984, 0.4651718, 1, 1, 1, 1, 1,
0.7818194, -0.2783948, 1.407035, 1, 1, 1, 1, 1,
0.7858537, -1.351327, 2.626528, 1, 1, 1, 1, 1,
0.7912644, 2.643106, 0.9567434, 1, 1, 1, 1, 1,
0.7928134, -2.131916, 1.24465, 1, 1, 1, 1, 1,
0.7930509, 0.2219827, 1.812455, 0, 0, 1, 1, 1,
0.7948093, 0.6529425, 0.8017775, 1, 0, 0, 1, 1,
0.7969974, 1.320632, 0.9152359, 1, 0, 0, 1, 1,
0.7971901, 0.05006706, 2.069396, 1, 0, 0, 1, 1,
0.8001853, -0.4189788, 1.980051, 1, 0, 0, 1, 1,
0.8035387, 1.113673, 3.200496, 1, 0, 0, 1, 1,
0.8046243, -0.14523, 0.3643097, 0, 0, 0, 1, 1,
0.8059865, 0.359388, 1.88329, 0, 0, 0, 1, 1,
0.8095517, -1.138472, 0.09985062, 0, 0, 0, 1, 1,
0.8124222, -0.9485067, 1.336815, 0, 0, 0, 1, 1,
0.8126329, 2.552302, 0.5598395, 0, 0, 0, 1, 1,
0.8169057, 1.375874, 2.190185, 0, 0, 0, 1, 1,
0.8210744, 0.8714788, 0.4574358, 0, 0, 0, 1, 1,
0.8212513, 0.1358567, 1.187153, 1, 1, 1, 1, 1,
0.8243597, -0.08145181, 0.8277942, 1, 1, 1, 1, 1,
0.8260956, 0.364343, 3.338307, 1, 1, 1, 1, 1,
0.8298996, 1.973885, 0.353404, 1, 1, 1, 1, 1,
0.8305436, 1.532013, 0.06107528, 1, 1, 1, 1, 1,
0.8316799, 1.014456, -0.815491, 1, 1, 1, 1, 1,
0.8387436, 2.594199, 1.212525, 1, 1, 1, 1, 1,
0.8396107, -0.7775849, 1.804533, 1, 1, 1, 1, 1,
0.8428286, 0.8751941, 0.1616555, 1, 1, 1, 1, 1,
0.8450288, -1.24642, 2.348659, 1, 1, 1, 1, 1,
0.8512536, 2.162009, 0.5088547, 1, 1, 1, 1, 1,
0.8545967, 3.329354, -1.189886, 1, 1, 1, 1, 1,
0.8551424, 0.7581413, -0.765016, 1, 1, 1, 1, 1,
0.8565635, 0.3182616, 1.026067, 1, 1, 1, 1, 1,
0.8592345, -0.03249445, 1.077041, 1, 1, 1, 1, 1,
0.8599087, -1.615894, 2.845316, 0, 0, 1, 1, 1,
0.8603605, -0.8356922, 1.078197, 1, 0, 0, 1, 1,
0.8645086, 1.613104, 1.537267, 1, 0, 0, 1, 1,
0.8687322, -0.1267938, 0.7128599, 1, 0, 0, 1, 1,
0.8699375, 0.108633, 0.8258876, 1, 0, 0, 1, 1,
0.8707034, 0.5267685, 2.346242, 1, 0, 0, 1, 1,
0.8747275, -0.431919, 2.655779, 0, 0, 0, 1, 1,
0.8809019, 1.048833, 0.0736523, 0, 0, 0, 1, 1,
0.888027, 0.1128169, 2.927538, 0, 0, 0, 1, 1,
0.8890445, -0.3901832, 2.256742, 0, 0, 0, 1, 1,
0.8897758, 1.697962, 0.6209976, 0, 0, 0, 1, 1,
0.8916754, 0.7285409, 1.422392, 0, 0, 0, 1, 1,
0.8952744, -1.180539, 1.098913, 0, 0, 0, 1, 1,
0.8978657, -0.7724661, 3.695592, 1, 1, 1, 1, 1,
0.8990102, -0.4763049, 0.9181024, 1, 1, 1, 1, 1,
0.9102719, -0.5200166, 2.062416, 1, 1, 1, 1, 1,
0.9145835, -1.112512, 1.942087, 1, 1, 1, 1, 1,
0.9149648, 0.3051903, -0.1519943, 1, 1, 1, 1, 1,
0.9152631, 0.001230879, 2.076797, 1, 1, 1, 1, 1,
0.9163887, 0.1519964, 1.983538, 1, 1, 1, 1, 1,
0.9192578, 0.6543769, 1.325843, 1, 1, 1, 1, 1,
0.9233477, -0.3779382, -0.1711704, 1, 1, 1, 1, 1,
0.9356751, -1.01769, 2.703997, 1, 1, 1, 1, 1,
0.9359195, 0.7585143, 0.9821679, 1, 1, 1, 1, 1,
0.9421285, -0.7180888, 1.521144, 1, 1, 1, 1, 1,
0.9461444, 0.2607136, 1.402144, 1, 1, 1, 1, 1,
0.9489107, 1.509868, 0.6349066, 1, 1, 1, 1, 1,
0.9593937, 1.20409, 0.03631782, 1, 1, 1, 1, 1,
0.964862, -0.3144813, 1.274684, 0, 0, 1, 1, 1,
0.9649656, -0.6875533, 2.528444, 1, 0, 0, 1, 1,
0.9675472, 0.05864055, 1.12944, 1, 0, 0, 1, 1,
0.9677173, -0.06191941, 1.098299, 1, 0, 0, 1, 1,
0.9700873, -0.6405026, 0.933418, 1, 0, 0, 1, 1,
0.9774765, -1.520919, 2.210852, 1, 0, 0, 1, 1,
0.9806655, -1.463869, 3.373485, 0, 0, 0, 1, 1,
0.9846269, 0.2025788, 0.4035075, 0, 0, 0, 1, 1,
0.9855286, 0.06885154, -0.249755, 0, 0, 0, 1, 1,
0.9873813, -1.86961, 2.042814, 0, 0, 0, 1, 1,
0.9879493, 0.7256768, 1.673015, 0, 0, 0, 1, 1,
0.9887374, 0.428821, 0.6473623, 0, 0, 0, 1, 1,
0.9926838, -0.8699667, 2.980325, 0, 0, 0, 1, 1,
1.005631, 2.14713, 1.01862, 1, 1, 1, 1, 1,
1.006741, 1.465565, 1.887292, 1, 1, 1, 1, 1,
1.011347, -0.714141, 4.14291, 1, 1, 1, 1, 1,
1.017667, -0.6186203, 3.455253, 1, 1, 1, 1, 1,
1.036693, 0.2586993, 1.085387, 1, 1, 1, 1, 1,
1.040391, 1.00722, 0.8522385, 1, 1, 1, 1, 1,
1.04388, -0.0900914, 1.484889, 1, 1, 1, 1, 1,
1.055228, 0.8231331, 0.6835114, 1, 1, 1, 1, 1,
1.058165, -0.203494, 1.717036, 1, 1, 1, 1, 1,
1.05957, -0.1361851, 3.094562, 1, 1, 1, 1, 1,
1.070125, -1.848656, 4.983294, 1, 1, 1, 1, 1,
1.071218, 1.494759, 0.2441153, 1, 1, 1, 1, 1,
1.071907, 0.301526, -0.01134168, 1, 1, 1, 1, 1,
1.071968, 0.3677419, 1.791365, 1, 1, 1, 1, 1,
1.07518, -1.148488, 3.324406, 1, 1, 1, 1, 1,
1.085705, 1.02167, 1.758468, 0, 0, 1, 1, 1,
1.0863, -0.5440778, 1.207295, 1, 0, 0, 1, 1,
1.088246, 0.6449178, -0.152319, 1, 0, 0, 1, 1,
1.091664, -1.474726, 1.57071, 1, 0, 0, 1, 1,
1.093915, -2.317514, 3.432313, 1, 0, 0, 1, 1,
1.097985, 2.521243, -1.071522, 1, 0, 0, 1, 1,
1.103557, -0.09603391, 1.582515, 0, 0, 0, 1, 1,
1.104832, -1.34424, 2.29918, 0, 0, 0, 1, 1,
1.106351, 0.1677759, 2.070403, 0, 0, 0, 1, 1,
1.113967, 0.5688199, 0.5638584, 0, 0, 0, 1, 1,
1.119907, -0.605135, 1.595853, 0, 0, 0, 1, 1,
1.12475, -0.5322673, 2.993578, 0, 0, 0, 1, 1,
1.126997, 1.275418, -0.7491086, 0, 0, 0, 1, 1,
1.133563, -0.1028481, -0.693992, 1, 1, 1, 1, 1,
1.142078, -1.728708, 2.32005, 1, 1, 1, 1, 1,
1.149969, 1.052668, 0.8127456, 1, 1, 1, 1, 1,
1.153654, 0.3366162, 1.174608, 1, 1, 1, 1, 1,
1.156447, -1.066035, 1.66546, 1, 1, 1, 1, 1,
1.157023, 0.6100656, 1.572189, 1, 1, 1, 1, 1,
1.161913, -1.571123, 2.454313, 1, 1, 1, 1, 1,
1.163357, -0.9839036, 2.59163, 1, 1, 1, 1, 1,
1.165536, -2.023519, 3.423025, 1, 1, 1, 1, 1,
1.168659, -0.3556398, 1.516314, 1, 1, 1, 1, 1,
1.183188, 0.4998406, 0.3632307, 1, 1, 1, 1, 1,
1.189693, 0.05608135, 1.255567, 1, 1, 1, 1, 1,
1.199368, 1.827814, 0.9173135, 1, 1, 1, 1, 1,
1.19943, -1.074899, 2.724749, 1, 1, 1, 1, 1,
1.201141, -0.5576732, 2.144581, 1, 1, 1, 1, 1,
1.204395, -0.4685672, 2.066434, 0, 0, 1, 1, 1,
1.217816, 0.3062891, 0.2471106, 1, 0, 0, 1, 1,
1.218079, -0.7489021, 2.127802, 1, 0, 0, 1, 1,
1.221196, -0.3571163, 1.815898, 1, 0, 0, 1, 1,
1.225554, -1.992514, 0.557121, 1, 0, 0, 1, 1,
1.234233, 2.682616, -0.1208241, 1, 0, 0, 1, 1,
1.236732, 1.538994, 0.5735121, 0, 0, 0, 1, 1,
1.250759, -0.4183773, 2.501293, 0, 0, 0, 1, 1,
1.257539, -0.8285602, 1.137516, 0, 0, 0, 1, 1,
1.264059, -0.7900305, 2.409018, 0, 0, 0, 1, 1,
1.264325, 0.2015132, 2.299744, 0, 0, 0, 1, 1,
1.264952, 0.2603806, 2.997027, 0, 0, 0, 1, 1,
1.269871, 1.062096, 0.4544854, 0, 0, 0, 1, 1,
1.278501, 0.2101973, 2.13359, 1, 1, 1, 1, 1,
1.280199, 1.085492, 0.2940565, 1, 1, 1, 1, 1,
1.280619, 0.06430822, 2.444989, 1, 1, 1, 1, 1,
1.295181, -1.444051, 2.335776, 1, 1, 1, 1, 1,
1.301062, -0.7958993, 1.065103, 1, 1, 1, 1, 1,
1.302585, -0.06288935, 1.991746, 1, 1, 1, 1, 1,
1.309144, -0.7189155, 1.069723, 1, 1, 1, 1, 1,
1.323478, 1.604295, -0.7543396, 1, 1, 1, 1, 1,
1.326669, 0.5459412, 3.253088, 1, 1, 1, 1, 1,
1.340637, -0.58634, 3.22092, 1, 1, 1, 1, 1,
1.351148, 0.3797964, 1.99454, 1, 1, 1, 1, 1,
1.352459, -0.4427635, 2.086282, 1, 1, 1, 1, 1,
1.366017, 0.8048185, 0.05509482, 1, 1, 1, 1, 1,
1.377425, 0.02878176, 1.137495, 1, 1, 1, 1, 1,
1.382388, -0.5518372, 0.2134074, 1, 1, 1, 1, 1,
1.405274, -0.6811497, 2.418125, 0, 0, 1, 1, 1,
1.411971, 0.3055836, 1.084987, 1, 0, 0, 1, 1,
1.414505, 0.7378671, 0.9648058, 1, 0, 0, 1, 1,
1.422155, 0.157281, 0.3756769, 1, 0, 0, 1, 1,
1.425476, -0.7293127, 3.488385, 1, 0, 0, 1, 1,
1.428818, 0.1470502, 2.169555, 1, 0, 0, 1, 1,
1.438468, 0.9501456, 2.386917, 0, 0, 0, 1, 1,
1.452415, -0.2738049, 2.477026, 0, 0, 0, 1, 1,
1.461561, -0.04988913, 1.923261, 0, 0, 0, 1, 1,
1.464671, 0.2728071, 0.9276024, 0, 0, 0, 1, 1,
1.468378, -2.088531, 2.82847, 0, 0, 0, 1, 1,
1.469731, -0.3578171, 1.260995, 0, 0, 0, 1, 1,
1.472743, 0.2304866, 1.831612, 0, 0, 0, 1, 1,
1.475667, -2.004587, 2.854592, 1, 1, 1, 1, 1,
1.477572, 0.2159862, 1.446916, 1, 1, 1, 1, 1,
1.478363, -0.3766648, 1.391883, 1, 1, 1, 1, 1,
1.480313, 0.735893, 1.410711, 1, 1, 1, 1, 1,
1.489321, 0.9241497, 0.8534957, 1, 1, 1, 1, 1,
1.49365, -0.5473461, 2.485733, 1, 1, 1, 1, 1,
1.53336, 1.677869, 1.035989, 1, 1, 1, 1, 1,
1.538721, -0.0313979, 1.72956, 1, 1, 1, 1, 1,
1.539834, -0.9486371, 0.8041406, 1, 1, 1, 1, 1,
1.553336, 1.688481, 1.879854, 1, 1, 1, 1, 1,
1.583096, -0.1726747, 0.895688, 1, 1, 1, 1, 1,
1.608089, -1.132614, 3.394554, 1, 1, 1, 1, 1,
1.612945, 0.9420936, 0.515871, 1, 1, 1, 1, 1,
1.62685, -0.2746992, 1.908851, 1, 1, 1, 1, 1,
1.629681, -0.9811004, 3.663684, 1, 1, 1, 1, 1,
1.64929, 1.881798, 0.824819, 0, 0, 1, 1, 1,
1.651087, 0.3494566, 0.9367896, 1, 0, 0, 1, 1,
1.652888, 1.199971, 0.7071822, 1, 0, 0, 1, 1,
1.661739, -3.202453, 3.213943, 1, 0, 0, 1, 1,
1.685934, -1.492511, 2.214604, 1, 0, 0, 1, 1,
1.754362, -1.528868, 3.468694, 1, 0, 0, 1, 1,
1.759359, 1.005566, 0.6726761, 0, 0, 0, 1, 1,
1.761179, 0.6723632, -0.7683116, 0, 0, 0, 1, 1,
1.761788, 2.096201, 1.228654, 0, 0, 0, 1, 1,
1.770999, 0.06536165, 1.744824, 0, 0, 0, 1, 1,
1.774837, -0.0721094, 1.464491, 0, 0, 0, 1, 1,
1.775584, -0.04857655, 2.057583, 0, 0, 0, 1, 1,
1.787459, -1.320651, 1.176329, 0, 0, 0, 1, 1,
1.801136, -1.573689, 0.9427237, 1, 1, 1, 1, 1,
1.835328, 1.568434, 1.406089, 1, 1, 1, 1, 1,
1.845359, -0.4206313, 1.020629, 1, 1, 1, 1, 1,
1.851814, 0.07057225, -0.08793241, 1, 1, 1, 1, 1,
1.87988, 0.7871071, 0.360725, 1, 1, 1, 1, 1,
1.886977, 2.242606, 1.243435, 1, 1, 1, 1, 1,
1.892347, 2.177347, -0.5529567, 1, 1, 1, 1, 1,
1.917028, -0.6283295, 1.833664, 1, 1, 1, 1, 1,
1.919166, 3.028367, 0.8382404, 1, 1, 1, 1, 1,
1.932413, -0.6248035, 1.069227, 1, 1, 1, 1, 1,
1.944708, 0.2459683, 1.185977, 1, 1, 1, 1, 1,
1.999632, 1.192201, 0.3216421, 1, 1, 1, 1, 1,
2.018761, -0.7837661, 0.6589754, 1, 1, 1, 1, 1,
2.032903, -0.3188489, 1.22388, 1, 1, 1, 1, 1,
2.036035, -0.8654454, 2.650998, 1, 1, 1, 1, 1,
2.084456, -0.1420108, 1.490214, 0, 0, 1, 1, 1,
2.143666, 1.004985, 1.557691, 1, 0, 0, 1, 1,
2.166579, 1.359319, 0.6993917, 1, 0, 0, 1, 1,
2.198233, -0.4695138, 1.179668, 1, 0, 0, 1, 1,
2.222032, 0.3654301, 1.140188, 1, 0, 0, 1, 1,
2.24612, -0.1139871, -0.2423583, 1, 0, 0, 1, 1,
2.269987, -1.469938, 1.569409, 0, 0, 0, 1, 1,
2.275061, 0.4900488, 1.763296, 0, 0, 0, 1, 1,
2.316484, -0.6194934, 1.816861, 0, 0, 0, 1, 1,
2.339465, 1.847283, 1.847517, 0, 0, 0, 1, 1,
2.357454, 0.07837231, 0.4635448, 0, 0, 0, 1, 1,
2.455345, -1.648918, 1.48693, 0, 0, 0, 1, 1,
2.463337, -1.286374, 1.640738, 0, 0, 0, 1, 1,
2.586712, 0.05843904, 0.9922916, 1, 1, 1, 1, 1,
2.613886, 0.03002874, 2.227856, 1, 1, 1, 1, 1,
2.659149, 1.256176, 1.033799, 1, 1, 1, 1, 1,
2.820868, -0.1118232, 2.107522, 1, 1, 1, 1, 1,
2.829812, -0.4488019, 1.814313, 1, 1, 1, 1, 1,
2.974365, -0.8122833, 3.299883, 1, 1, 1, 1, 1,
3.037465, 0.5503314, 1.107259, 1, 1, 1, 1, 1
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
var radius = 9.459148;
var distance = 33.22486;
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
mvMatrix.translate( 0.08147812, -0.1488104, -0.2569034 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22486);
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
