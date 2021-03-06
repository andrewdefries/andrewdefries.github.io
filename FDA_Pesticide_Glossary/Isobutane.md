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
-3.654233, 1.322356, -2.0737, 1, 0, 0, 1,
-3.322046, -0.9176713, -0.9259399, 1, 0.007843138, 0, 1,
-2.929291, -0.06005351, -1.202728, 1, 0.01176471, 0, 1,
-2.855019, -0.07794182, -0.9904844, 1, 0.01960784, 0, 1,
-2.607949, 0.3048698, -3.055807, 1, 0.02352941, 0, 1,
-2.599601, 0.9076408, -1.008507, 1, 0.03137255, 0, 1,
-2.575964, 0.7536238, -2.67321, 1, 0.03529412, 0, 1,
-2.370906, -0.2109627, -2.064925, 1, 0.04313726, 0, 1,
-2.325852, 0.6081105, -0.7300637, 1, 0.04705882, 0, 1,
-2.282017, -2.068768, -2.615451, 1, 0.05490196, 0, 1,
-2.233926, 0.4621084, -0.1503435, 1, 0.05882353, 0, 1,
-2.232125, -0.1521486, -2.226955, 1, 0.06666667, 0, 1,
-2.219417, -0.782604, -2.661062, 1, 0.07058824, 0, 1,
-2.217957, -1.02109, -0.9546577, 1, 0.07843138, 0, 1,
-2.19529, -1.526001, -1.695037, 1, 0.08235294, 0, 1,
-2.188202, -2.325044, -2.853018, 1, 0.09019608, 0, 1,
-2.175805, 0.8471967, -0.5673335, 1, 0.09411765, 0, 1,
-2.146319, 0.07844429, -2.851094, 1, 0.1019608, 0, 1,
-2.142591, 0.6550366, -2.238561, 1, 0.1098039, 0, 1,
-2.073379, 1.188574, -1.803224, 1, 0.1137255, 0, 1,
-2.050133, 0.3464787, -0.4658868, 1, 0.1215686, 0, 1,
-2.035896, -0.392232, -1.972177, 1, 0.1254902, 0, 1,
-1.96994, 0.645624, -2.388578, 1, 0.1333333, 0, 1,
-1.962729, 0.08105979, -2.888098, 1, 0.1372549, 0, 1,
-1.957228, -0.4049504, -0.1261695, 1, 0.145098, 0, 1,
-1.929694, 1.509216, 0.8725851, 1, 0.1490196, 0, 1,
-1.925374, 0.1505564, -0.1202237, 1, 0.1568628, 0, 1,
-1.920655, -2.143294, -1.786497, 1, 0.1607843, 0, 1,
-1.91679, -0.4018807, -2.195443, 1, 0.1686275, 0, 1,
-1.904881, -0.3097329, -1.964594, 1, 0.172549, 0, 1,
-1.903099, 0.5472251, -0.6775073, 1, 0.1803922, 0, 1,
-1.902384, -0.1706856, -0.2234834, 1, 0.1843137, 0, 1,
-1.898799, -0.9953294, -1.3135, 1, 0.1921569, 0, 1,
-1.874878, -0.7915279, -1.383392, 1, 0.1960784, 0, 1,
-1.862829, 0.2180094, -2.194921, 1, 0.2039216, 0, 1,
-1.84876, 1.0183, -0.3007404, 1, 0.2117647, 0, 1,
-1.806138, -1.636494, -2.365641, 1, 0.2156863, 0, 1,
-1.793781, -0.3537971, -2.024133, 1, 0.2235294, 0, 1,
-1.789248, -0.7548262, -1.749231, 1, 0.227451, 0, 1,
-1.774673, -0.6764547, -2.231058, 1, 0.2352941, 0, 1,
-1.76507, 0.7195249, -3.376381, 1, 0.2392157, 0, 1,
-1.756432, 1.12979, -0.5812278, 1, 0.2470588, 0, 1,
-1.754686, 1.372992, 0.494146, 1, 0.2509804, 0, 1,
-1.742756, -0.5589793, -1.785453, 1, 0.2588235, 0, 1,
-1.71948, -0.5817041, -0.5496042, 1, 0.2627451, 0, 1,
-1.716199, -0.05816498, -0.782103, 1, 0.2705882, 0, 1,
-1.713275, -1.578227, -1.722042, 1, 0.2745098, 0, 1,
-1.703471, 0.2905482, -2.15019, 1, 0.282353, 0, 1,
-1.699536, 0.7296222, -0.680269, 1, 0.2862745, 0, 1,
-1.690399, 0.8718413, -3.003931, 1, 0.2941177, 0, 1,
-1.687686, 0.2136893, -2.943123, 1, 0.3019608, 0, 1,
-1.676756, -0.8096559, 0.1125982, 1, 0.3058824, 0, 1,
-1.665004, -0.3139293, -1.799092, 1, 0.3137255, 0, 1,
-1.648002, 1.214093, -1.694691, 1, 0.3176471, 0, 1,
-1.63719, -1.160651, -0.9856929, 1, 0.3254902, 0, 1,
-1.632295, -1.750176, -1.155824, 1, 0.3294118, 0, 1,
-1.620796, 1.956561, 0.3424052, 1, 0.3372549, 0, 1,
-1.619558, -1.771861, -4.008014, 1, 0.3411765, 0, 1,
-1.617013, 0.2571748, -1.153225, 1, 0.3490196, 0, 1,
-1.594345, -0.4549752, -1.916699, 1, 0.3529412, 0, 1,
-1.585513, 0.2339876, -0.3839009, 1, 0.3607843, 0, 1,
-1.56833, -0.9662362, -1.772694, 1, 0.3647059, 0, 1,
-1.565567, -0.7247061, -1.328165, 1, 0.372549, 0, 1,
-1.552912, 0.2921325, -1.61659, 1, 0.3764706, 0, 1,
-1.552846, 0.3830914, -1.671115, 1, 0.3843137, 0, 1,
-1.550891, 0.2359535, -1.413425, 1, 0.3882353, 0, 1,
-1.547051, -0.7483937, -2.20125, 1, 0.3960784, 0, 1,
-1.543114, 0.4597552, -1.157608, 1, 0.4039216, 0, 1,
-1.536159, -0.4726489, -1.707518, 1, 0.4078431, 0, 1,
-1.525787, -0.2960744, -1.894861, 1, 0.4156863, 0, 1,
-1.500983, 0.003982211, -2.148826, 1, 0.4196078, 0, 1,
-1.498567, -1.885893, -1.293236, 1, 0.427451, 0, 1,
-1.498504, 0.10489, -1.756836, 1, 0.4313726, 0, 1,
-1.494965, -0.8388489, -2.339539, 1, 0.4392157, 0, 1,
-1.492112, 0.8282167, -1.40175, 1, 0.4431373, 0, 1,
-1.484013, -0.3223636, -0.02529057, 1, 0.4509804, 0, 1,
-1.481086, -1.331437, -3.39057, 1, 0.454902, 0, 1,
-1.46332, 0.8710526, -0.8576087, 1, 0.4627451, 0, 1,
-1.460083, -0.8472954, -3.505341, 1, 0.4666667, 0, 1,
-1.450691, -0.2389229, -0.7833672, 1, 0.4745098, 0, 1,
-1.440976, 0.6585947, -0.9133635, 1, 0.4784314, 0, 1,
-1.423791, -0.9198847, -2.071078, 1, 0.4862745, 0, 1,
-1.422212, 0.05066567, -2.023754, 1, 0.4901961, 0, 1,
-1.422157, 1.242199, -0.05199145, 1, 0.4980392, 0, 1,
-1.408064, 1.307214, -3.1494, 1, 0.5058824, 0, 1,
-1.403897, -0.4715886, -1.859681, 1, 0.509804, 0, 1,
-1.401454, -1.868468, -3.419686, 1, 0.5176471, 0, 1,
-1.389408, -0.1420214, -2.433648, 1, 0.5215687, 0, 1,
-1.382011, 0.4899724, -1.337518, 1, 0.5294118, 0, 1,
-1.379466, -0.4257293, -2.155726, 1, 0.5333334, 0, 1,
-1.364556, -0.4928442, -0.9666533, 1, 0.5411765, 0, 1,
-1.350136, -1.650751, -3.562275, 1, 0.5450981, 0, 1,
-1.345904, 0.06660359, -1.001237, 1, 0.5529412, 0, 1,
-1.342245, -0.1423537, -2.100877, 1, 0.5568628, 0, 1,
-1.329808, 1.430405, 0.7149585, 1, 0.5647059, 0, 1,
-1.325519, 0.2856499, -1.01157, 1, 0.5686275, 0, 1,
-1.324277, -0.2561006, 0.115789, 1, 0.5764706, 0, 1,
-1.315772, -0.1102888, -1.811451, 1, 0.5803922, 0, 1,
-1.31485, -1.067093, -1.555837, 1, 0.5882353, 0, 1,
-1.313736, -0.4082883, -0.84643, 1, 0.5921569, 0, 1,
-1.310404, 0.1701573, -2.376888, 1, 0.6, 0, 1,
-1.309659, 0.2546901, -0.1996493, 1, 0.6078432, 0, 1,
-1.301728, -1.189183, -3.080619, 1, 0.6117647, 0, 1,
-1.280946, -0.6954391, -2.608261, 1, 0.6196079, 0, 1,
-1.268782, 0.03861252, -1.824419, 1, 0.6235294, 0, 1,
-1.260362, -1.931326, -3.148323, 1, 0.6313726, 0, 1,
-1.258014, 1.496843, -0.04573695, 1, 0.6352941, 0, 1,
-1.257935, 0.9139567, 0.1131239, 1, 0.6431373, 0, 1,
-1.252167, 0.1912795, -1.592708, 1, 0.6470588, 0, 1,
-1.251141, -0.7365758, -0.1737863, 1, 0.654902, 0, 1,
-1.244141, 0.1361435, -0.7011169, 1, 0.6588235, 0, 1,
-1.242324, -0.2546408, -1.574167, 1, 0.6666667, 0, 1,
-1.239, -2.738664, -1.560733, 1, 0.6705883, 0, 1,
-1.234929, 1.085632, -0.5483849, 1, 0.6784314, 0, 1,
-1.230182, -1.020321, -2.101543, 1, 0.682353, 0, 1,
-1.229589, 1.249519, -2.46122, 1, 0.6901961, 0, 1,
-1.227187, 1.512978, -1.453593, 1, 0.6941177, 0, 1,
-1.223957, 0.2934579, -1.204718, 1, 0.7019608, 0, 1,
-1.222892, -2.072554, -1.086447, 1, 0.7098039, 0, 1,
-1.220536, -1.469028, -3.332803, 1, 0.7137255, 0, 1,
-1.217281, 0.3038104, -1.166128, 1, 0.7215686, 0, 1,
-1.213994, -1.415311, -4.403836, 1, 0.7254902, 0, 1,
-1.213803, -0.8078699, -1.534432, 1, 0.7333333, 0, 1,
-1.205971, -0.1589355, -1.897922, 1, 0.7372549, 0, 1,
-1.2009, -1.811563, -3.890971, 1, 0.7450981, 0, 1,
-1.200655, -1.132411, -2.714171, 1, 0.7490196, 0, 1,
-1.183841, -1.385005, -4.413555, 1, 0.7568628, 0, 1,
-1.178903, -0.004420164, -1.364336, 1, 0.7607843, 0, 1,
-1.167582, 1.056255, -1.598901, 1, 0.7686275, 0, 1,
-1.167484, 2.189973, -2.233672, 1, 0.772549, 0, 1,
-1.157701, -0.9303034, -3.153903, 1, 0.7803922, 0, 1,
-1.157439, -2.062232, -1.718473, 1, 0.7843137, 0, 1,
-1.149396, -0.04516635, -1.375404, 1, 0.7921569, 0, 1,
-1.146502, 1.675609, 1.578396, 1, 0.7960784, 0, 1,
-1.134514, 0.7118277, 0.6253837, 1, 0.8039216, 0, 1,
-1.132111, 0.6566618, -1.579336, 1, 0.8117647, 0, 1,
-1.129921, 0.235009, -0.1295351, 1, 0.8156863, 0, 1,
-1.12885, 0.8849046, -1.13362, 1, 0.8235294, 0, 1,
-1.126912, 0.09391224, -2.769496, 1, 0.827451, 0, 1,
-1.124821, -0.3081295, -1.782651, 1, 0.8352941, 0, 1,
-1.119001, -0.2417571, -2.959893, 1, 0.8392157, 0, 1,
-1.118316, -1.627136, -3.213577, 1, 0.8470588, 0, 1,
-1.115017, 0.7596021, -0.1334485, 1, 0.8509804, 0, 1,
-1.111519, -0.1627827, -2.369613, 1, 0.8588235, 0, 1,
-1.110508, -0.0004643504, -0.7465456, 1, 0.8627451, 0, 1,
-1.110236, 1.393336, -1.645285, 1, 0.8705882, 0, 1,
-1.108819, -1.406753, -1.134901, 1, 0.8745098, 0, 1,
-1.097722, -1.062744, -2.315903, 1, 0.8823529, 0, 1,
-1.094233, -0.9724414, -1.994407, 1, 0.8862745, 0, 1,
-1.086813, 0.1967498, -0.1652318, 1, 0.8941177, 0, 1,
-1.083678, -0.5174966, -1.784111, 1, 0.8980392, 0, 1,
-1.075214, -0.287508, -0.2788078, 1, 0.9058824, 0, 1,
-1.073521, -0.9155414, -1.016202, 1, 0.9137255, 0, 1,
-1.071709, 0.5119792, -0.3961321, 1, 0.9176471, 0, 1,
-1.063345, 1.367867, -1.275714, 1, 0.9254902, 0, 1,
-1.060803, 0.6603875, -1.132856, 1, 0.9294118, 0, 1,
-1.059104, 1.334892, 0.5147385, 1, 0.9372549, 0, 1,
-1.058734, 0.2395304, -2.298427, 1, 0.9411765, 0, 1,
-1.058079, 0.1777432, -1.744278, 1, 0.9490196, 0, 1,
-1.043265, 0.09128509, -1.010633, 1, 0.9529412, 0, 1,
-1.039305, -0.9278745, -1.491444, 1, 0.9607843, 0, 1,
-1.038855, -1.943206, -2.639298, 1, 0.9647059, 0, 1,
-1.023074, -1.0707, -0.4825325, 1, 0.972549, 0, 1,
-1.020357, 0.1719556, -1.861669, 1, 0.9764706, 0, 1,
-1.018345, 0.2042462, -0.6726577, 1, 0.9843137, 0, 1,
-1.012541, -0.3385098, -2.592046, 1, 0.9882353, 0, 1,
-1.012282, -0.2382015, -0.8434431, 1, 0.9960784, 0, 1,
-1.01126, 1.053677, -0.2773598, 0.9960784, 1, 0, 1,
-1.006047, -0.5714567, -1.106751, 0.9921569, 1, 0, 1,
-0.9981182, 0.4401135, -1.001226, 0.9843137, 1, 0, 1,
-0.9980422, -0.3814164, -3.060921, 0.9803922, 1, 0, 1,
-0.9976624, -1.523405, -1.250536, 0.972549, 1, 0, 1,
-0.9937248, -1.231509, -2.746408, 0.9686275, 1, 0, 1,
-0.9919357, 0.2182115, -0.2014694, 0.9607843, 1, 0, 1,
-0.9869666, -0.1830712, -3.701603, 0.9568627, 1, 0, 1,
-0.9868692, 0.8080704, -0.7004606, 0.9490196, 1, 0, 1,
-0.9850032, -0.4520197, -3.530233, 0.945098, 1, 0, 1,
-0.9784254, 0.339741, -2.557399, 0.9372549, 1, 0, 1,
-0.9767512, 0.7032264, -1.260706, 0.9333333, 1, 0, 1,
-0.9765955, 0.2414326, -0.6493001, 0.9254902, 1, 0, 1,
-0.968133, 1.095525, 1.993591, 0.9215686, 1, 0, 1,
-0.9672067, -0.2597781, -2.62747, 0.9137255, 1, 0, 1,
-0.948414, 0.5500119, -0.9736519, 0.9098039, 1, 0, 1,
-0.9419322, 0.07526902, -2.755731, 0.9019608, 1, 0, 1,
-0.9380584, -0.7278327, -2.002036, 0.8941177, 1, 0, 1,
-0.9375355, -0.1624162, -0.7412609, 0.8901961, 1, 0, 1,
-0.9343167, -1.53687, -4.843043, 0.8823529, 1, 0, 1,
-0.9321014, -1.376561, -0.5827971, 0.8784314, 1, 0, 1,
-0.9280692, 1.166526, -0.8060505, 0.8705882, 1, 0, 1,
-0.9231026, -1.583755, -2.232266, 0.8666667, 1, 0, 1,
-0.9215874, -0.2613577, -2.59109, 0.8588235, 1, 0, 1,
-0.9131984, -0.08440584, -0.9400215, 0.854902, 1, 0, 1,
-0.9094949, -1.680987, -2.095853, 0.8470588, 1, 0, 1,
-0.9085447, -0.1716457, -1.549152, 0.8431373, 1, 0, 1,
-0.9074588, -0.559941, -1.612814, 0.8352941, 1, 0, 1,
-0.9009081, 0.4165065, -0.9948961, 0.8313726, 1, 0, 1,
-0.8974965, 0.2715865, -3.124924, 0.8235294, 1, 0, 1,
-0.8973817, -0.7793328, -1.085321, 0.8196079, 1, 0, 1,
-0.8951015, 0.3384781, -0.4594918, 0.8117647, 1, 0, 1,
-0.893746, -1.296205, -3.461132, 0.8078431, 1, 0, 1,
-0.8936434, -0.2391508, -2.39201, 0.8, 1, 0, 1,
-0.892396, -0.1435467, -3.436309, 0.7921569, 1, 0, 1,
-0.8918669, 0.6114482, 0.6382455, 0.7882353, 1, 0, 1,
-0.8887896, -0.8616729, -4.627293, 0.7803922, 1, 0, 1,
-0.878996, -0.5313542, -1.159892, 0.7764706, 1, 0, 1,
-0.8754818, 1.0243, -1.398973, 0.7686275, 1, 0, 1,
-0.8752427, -0.2379495, -1.297527, 0.7647059, 1, 0, 1,
-0.8747944, -0.6483881, -1.905983, 0.7568628, 1, 0, 1,
-0.8710909, 0.2882366, 0.03980189, 0.7529412, 1, 0, 1,
-0.8661155, 0.6918557, -0.3992611, 0.7450981, 1, 0, 1,
-0.8629515, -0.1991175, -0.5779583, 0.7411765, 1, 0, 1,
-0.8573329, -0.1388374, -2.153691, 0.7333333, 1, 0, 1,
-0.8570827, 1.925908, -1.321464, 0.7294118, 1, 0, 1,
-0.8464833, 1.876823, -1.387062, 0.7215686, 1, 0, 1,
-0.8405623, -0.8689611, -3.665169, 0.7176471, 1, 0, 1,
-0.8353245, 0.3355129, -1.114228, 0.7098039, 1, 0, 1,
-0.8260545, 0.736162, -1.579888, 0.7058824, 1, 0, 1,
-0.8217578, 0.4762457, -1.216084, 0.6980392, 1, 0, 1,
-0.8159972, 1.164231, -2.570377, 0.6901961, 1, 0, 1,
-0.8099052, 0.1583539, -2.311334, 0.6862745, 1, 0, 1,
-0.8071631, 0.8035923, -0.5664117, 0.6784314, 1, 0, 1,
-0.7999014, 0.5768573, -1.170904, 0.6745098, 1, 0, 1,
-0.7990039, 0.7302532, -0.3536871, 0.6666667, 1, 0, 1,
-0.7931244, -0.2784174, -2.368887, 0.6627451, 1, 0, 1,
-0.7810332, -1.379812, -2.559441, 0.654902, 1, 0, 1,
-0.7804818, -0.8493078, -2.868038, 0.6509804, 1, 0, 1,
-0.7800097, -0.7137703, -0.4999265, 0.6431373, 1, 0, 1,
-0.780003, 0.05403831, -0.1714112, 0.6392157, 1, 0, 1,
-0.7796661, 1.790203, -0.04987589, 0.6313726, 1, 0, 1,
-0.7796206, -0.9586996, -2.126593, 0.627451, 1, 0, 1,
-0.7765546, -0.5253164, -2.677191, 0.6196079, 1, 0, 1,
-0.7758167, 0.07229147, -0.9488085, 0.6156863, 1, 0, 1,
-0.7754084, -0.7232242, -3.929698, 0.6078432, 1, 0, 1,
-0.7739994, 0.9496315, -1.147681, 0.6039216, 1, 0, 1,
-0.7676893, -2.013652, -1.646998, 0.5960785, 1, 0, 1,
-0.767259, 0.3517428, -1.89996, 0.5882353, 1, 0, 1,
-0.7560315, 1.242321, -0.6599907, 0.5843138, 1, 0, 1,
-0.7531102, 0.920632, -1.646043, 0.5764706, 1, 0, 1,
-0.7438203, 0.6229763, -2.118662, 0.572549, 1, 0, 1,
-0.739034, 0.2592179, -0.9965929, 0.5647059, 1, 0, 1,
-0.7312046, 1.779101, -0.4224068, 0.5607843, 1, 0, 1,
-0.7212119, 0.1050752, -0.6606081, 0.5529412, 1, 0, 1,
-0.7209364, 1.977946, -0.1670091, 0.5490196, 1, 0, 1,
-0.7197606, 1.289098, -1.957974, 0.5411765, 1, 0, 1,
-0.7196044, -1.0972, -2.072667, 0.5372549, 1, 0, 1,
-0.7132066, 0.8416958, -0.02021171, 0.5294118, 1, 0, 1,
-0.7063277, -0.3284003, -1.282761, 0.5254902, 1, 0, 1,
-0.7048715, -0.2239358, -1.334053, 0.5176471, 1, 0, 1,
-0.7043305, -0.5007344, -1.006442, 0.5137255, 1, 0, 1,
-0.7013552, -0.5660166, -2.328896, 0.5058824, 1, 0, 1,
-0.7004099, -2.382972, -3.060361, 0.5019608, 1, 0, 1,
-0.695775, -2.48757, -2.784989, 0.4941176, 1, 0, 1,
-0.6942801, -0.7974994, -3.747321, 0.4862745, 1, 0, 1,
-0.6932364, -0.6787876, -2.165884, 0.4823529, 1, 0, 1,
-0.6878612, 0.4710936, -1.533385, 0.4745098, 1, 0, 1,
-0.6871015, -1.924769, -3.745476, 0.4705882, 1, 0, 1,
-0.6858368, -1.983099, -5.369267, 0.4627451, 1, 0, 1,
-0.6839889, 1.413256, 0.4703848, 0.4588235, 1, 0, 1,
-0.6831802, 0.560375, -0.7205859, 0.4509804, 1, 0, 1,
-0.6764347, 1.481756, 1.484958, 0.4470588, 1, 0, 1,
-0.6763531, 0.8877844, -0.6719427, 0.4392157, 1, 0, 1,
-0.6692389, 1.511735, 1.072039, 0.4352941, 1, 0, 1,
-0.6691849, -1.075074, -3.481567, 0.427451, 1, 0, 1,
-0.6685494, -1.244147, -3.005411, 0.4235294, 1, 0, 1,
-0.662302, -0.03904121, -1.746356, 0.4156863, 1, 0, 1,
-0.6605222, -0.6983893, -4.83884, 0.4117647, 1, 0, 1,
-0.6574793, -0.8125002, -0.8850791, 0.4039216, 1, 0, 1,
-0.6527949, 0.8919359, -1.179001, 0.3960784, 1, 0, 1,
-0.6524115, -0.03663839, -3.086783, 0.3921569, 1, 0, 1,
-0.6395679, 0.4302287, -3.289879, 0.3843137, 1, 0, 1,
-0.6375428, 2.420096, -0.9105792, 0.3803922, 1, 0, 1,
-0.6349177, 0.4073005, -1.008895, 0.372549, 1, 0, 1,
-0.631555, -0.8693652, -0.4738452, 0.3686275, 1, 0, 1,
-0.627489, 1.446119, 0.4997578, 0.3607843, 1, 0, 1,
-0.6254445, 1.025425, -1.790688, 0.3568628, 1, 0, 1,
-0.6219714, 0.2044788, -1.950987, 0.3490196, 1, 0, 1,
-0.6167841, 1.116462, 0.4836468, 0.345098, 1, 0, 1,
-0.6097402, -0.6340563, -1.455024, 0.3372549, 1, 0, 1,
-0.6061761, -0.2646419, -1.742786, 0.3333333, 1, 0, 1,
-0.6036116, -0.0898399, -1.70677, 0.3254902, 1, 0, 1,
-0.5986765, -1.937563, -1.776344, 0.3215686, 1, 0, 1,
-0.5946546, -1.822956, -2.942869, 0.3137255, 1, 0, 1,
-0.5943957, 2.059835, 0.8134055, 0.3098039, 1, 0, 1,
-0.5921749, -0.29116, -0.6104693, 0.3019608, 1, 0, 1,
-0.5903813, -0.250274, -4.224793, 0.2941177, 1, 0, 1,
-0.5903676, 0.07930892, -1.24909, 0.2901961, 1, 0, 1,
-0.5895794, -0.4644665, -1.742756, 0.282353, 1, 0, 1,
-0.5812541, -0.8828502, -3.25131, 0.2784314, 1, 0, 1,
-0.5794857, -1.503985, -2.022777, 0.2705882, 1, 0, 1,
-0.5784691, -1.238641, -2.723927, 0.2666667, 1, 0, 1,
-0.5720685, -0.9871925, -3.407331, 0.2588235, 1, 0, 1,
-0.5686669, 0.8682197, 0.2869005, 0.254902, 1, 0, 1,
-0.5682828, 0.6572405, 0.7442853, 0.2470588, 1, 0, 1,
-0.56719, 1.321084, -0.8664789, 0.2431373, 1, 0, 1,
-0.5656035, -0.1647336, -2.658441, 0.2352941, 1, 0, 1,
-0.5632103, -0.54274, -2.797592, 0.2313726, 1, 0, 1,
-0.555204, -0.7990336, -3.922004, 0.2235294, 1, 0, 1,
-0.5539861, 1.13021, -2.041066, 0.2196078, 1, 0, 1,
-0.5528734, -0.04589117, -2.788771, 0.2117647, 1, 0, 1,
-0.5487592, 1.053258, -1.319129, 0.2078431, 1, 0, 1,
-0.546737, -0.1294395, -1.032643, 0.2, 1, 0, 1,
-0.5409358, -1.10998, -3.271569, 0.1921569, 1, 0, 1,
-0.5403085, -0.1084027, -0.6841478, 0.1882353, 1, 0, 1,
-0.5380523, -0.223025, -1.921832, 0.1803922, 1, 0, 1,
-0.5235367, 0.6059182, -1.351206, 0.1764706, 1, 0, 1,
-0.5223714, 1.024099, -0.7744657, 0.1686275, 1, 0, 1,
-0.520818, -1.37862, -1.944891, 0.1647059, 1, 0, 1,
-0.5203692, -0.2210711, -1.644301, 0.1568628, 1, 0, 1,
-0.5201338, 1.393283, -1.177195, 0.1529412, 1, 0, 1,
-0.5122077, -0.928097, -3.095411, 0.145098, 1, 0, 1,
-0.5120885, 1.24565, -0.5446345, 0.1411765, 1, 0, 1,
-0.5082768, 0.4373485, -0.08891971, 0.1333333, 1, 0, 1,
-0.5054981, 0.1290595, -1.955091, 0.1294118, 1, 0, 1,
-0.501334, 1.716218, 0.4611214, 0.1215686, 1, 0, 1,
-0.5011178, -0.5801373, -0.3954065, 0.1176471, 1, 0, 1,
-0.4995456, 0.770124, -0.03962626, 0.1098039, 1, 0, 1,
-0.4977282, -0.5036604, -1.689103, 0.1058824, 1, 0, 1,
-0.4973687, 0.3315552, 0.04707937, 0.09803922, 1, 0, 1,
-0.4941712, -0.6888872, -2.923409, 0.09019608, 1, 0, 1,
-0.4938775, 0.6633774, -2.94882, 0.08627451, 1, 0, 1,
-0.4906309, 1.130345, 0.2904747, 0.07843138, 1, 0, 1,
-0.4895167, 0.8524318, 0.2861937, 0.07450981, 1, 0, 1,
-0.4894484, -0.3638861, -1.393851, 0.06666667, 1, 0, 1,
-0.4893178, -0.09471456, -1.512172, 0.0627451, 1, 0, 1,
-0.4821876, -0.6712217, -1.777825, 0.05490196, 1, 0, 1,
-0.4806513, 0.2074046, -0.2906934, 0.05098039, 1, 0, 1,
-0.4783176, -0.1937394, -1.689697, 0.04313726, 1, 0, 1,
-0.4780385, -0.8576303, -2.849313, 0.03921569, 1, 0, 1,
-0.4763386, -0.1471068, -3.675306, 0.03137255, 1, 0, 1,
-0.4757782, 0.2756797, -0.6358883, 0.02745098, 1, 0, 1,
-0.4747028, 2.446029, -0.9767694, 0.01960784, 1, 0, 1,
-0.4734939, 0.4340895, -0.006508539, 0.01568628, 1, 0, 1,
-0.4732907, 0.6603371, -0.5385774, 0.007843138, 1, 0, 1,
-0.4693733, -1.201538, -3.711825, 0.003921569, 1, 0, 1,
-0.4625902, 0.516901, 0.8917374, 0, 1, 0.003921569, 1,
-0.4620368, -0.07856291, -1.638902, 0, 1, 0.01176471, 1,
-0.461258, -0.5144391, -2.954842, 0, 1, 0.01568628, 1,
-0.4554601, 0.2110038, -0.978612, 0, 1, 0.02352941, 1,
-0.45065, 1.385131, -2.407668, 0, 1, 0.02745098, 1,
-0.4495143, -0.2708891, -2.145567, 0, 1, 0.03529412, 1,
-0.4432644, 1.025385, 0.7104245, 0, 1, 0.03921569, 1,
-0.4431445, 0.4827709, -1.016551, 0, 1, 0.04705882, 1,
-0.439362, 0.8237453, -0.4152081, 0, 1, 0.05098039, 1,
-0.4376235, 0.1867737, -2.413114, 0, 1, 0.05882353, 1,
-0.4367689, 1.078958, -0.601432, 0, 1, 0.0627451, 1,
-0.4356075, 0.5835134, -0.2005901, 0, 1, 0.07058824, 1,
-0.4311331, -0.6498074, -2.912688, 0, 1, 0.07450981, 1,
-0.424613, -0.5967501, -3.588977, 0, 1, 0.08235294, 1,
-0.4244388, -1.617833, -4.524014, 0, 1, 0.08627451, 1,
-0.4243196, -2.347862, -3.842645, 0, 1, 0.09411765, 1,
-0.4224209, -0.07692728, -0.8135513, 0, 1, 0.1019608, 1,
-0.4179284, 1.397912, -0.5123898, 0, 1, 0.1058824, 1,
-0.41787, 0.8646274, -0.8809457, 0, 1, 0.1137255, 1,
-0.4178659, -0.1310678, -0.9791254, 0, 1, 0.1176471, 1,
-0.4145086, 0.05623758, -2.066, 0, 1, 0.1254902, 1,
-0.4106561, 0.6063169, -2.544951, 0, 1, 0.1294118, 1,
-0.4099004, 0.491642, -1.016803, 0, 1, 0.1372549, 1,
-0.40807, 0.02906983, -0.5175666, 0, 1, 0.1411765, 1,
-0.4071859, -0.1102648, -1.985404, 0, 1, 0.1490196, 1,
-0.4047661, -1.217843, -4.134506, 0, 1, 0.1529412, 1,
-0.4037615, -1.711075, -2.975557, 0, 1, 0.1607843, 1,
-0.4036779, -0.08589989, -2.249909, 0, 1, 0.1647059, 1,
-0.4031848, -1.505857, -3.328854, 0, 1, 0.172549, 1,
-0.4029838, 0.4643016, -0.8286891, 0, 1, 0.1764706, 1,
-0.4015916, 0.8043717, 0.2668375, 0, 1, 0.1843137, 1,
-0.4015733, -0.3804478, -1.730098, 0, 1, 0.1882353, 1,
-0.3999, -0.5649228, -1.523326, 0, 1, 0.1960784, 1,
-0.3944191, 0.2294531, -1.637178, 0, 1, 0.2039216, 1,
-0.3840178, -1.840401, -2.748636, 0, 1, 0.2078431, 1,
-0.3784057, 0.994638, -0.7337999, 0, 1, 0.2156863, 1,
-0.3741635, 1.98336, -0.4837822, 0, 1, 0.2196078, 1,
-0.3734537, 1.619023, -0.7950264, 0, 1, 0.227451, 1,
-0.371552, 0.3112786, -0.1812443, 0, 1, 0.2313726, 1,
-0.3675185, 0.09380472, -1.381747, 0, 1, 0.2392157, 1,
-0.364326, 0.9038519, -1.512828, 0, 1, 0.2431373, 1,
-0.3607104, 0.4123168, 1.470225, 0, 1, 0.2509804, 1,
-0.3606094, 0.5600684, 0.2993505, 0, 1, 0.254902, 1,
-0.347614, 0.8149022, 1.835548, 0, 1, 0.2627451, 1,
-0.3468637, 1.831819, -1.273244, 0, 1, 0.2666667, 1,
-0.3421437, -0.4254379, -3.597604, 0, 1, 0.2745098, 1,
-0.3386051, 0.3046516, -0.8386125, 0, 1, 0.2784314, 1,
-0.3367462, 0.5013828, -0.5208101, 0, 1, 0.2862745, 1,
-0.3352249, 0.7649614, -1.026603, 0, 1, 0.2901961, 1,
-0.331729, 0.5083653, -0.06420574, 0, 1, 0.2980392, 1,
-0.3291287, -0.2089518, 0.4673708, 0, 1, 0.3058824, 1,
-0.3235978, -2.31546, -2.727577, 0, 1, 0.3098039, 1,
-0.3230268, -0.5806972, -2.005337, 0, 1, 0.3176471, 1,
-0.3224601, -0.00257065, -0.4102125, 0, 1, 0.3215686, 1,
-0.3203901, 0.7282988, 1.220276, 0, 1, 0.3294118, 1,
-0.3190606, 0.3153886, -2.062155, 0, 1, 0.3333333, 1,
-0.317169, -0.2584243, -0.9983221, 0, 1, 0.3411765, 1,
-0.3110949, 2.126279, -1.094916, 0, 1, 0.345098, 1,
-0.3024707, 1.429397, -2.141117, 0, 1, 0.3529412, 1,
-0.296442, 0.2117551, 0.07233533, 0, 1, 0.3568628, 1,
-0.2953488, 0.07256149, -2.832717, 0, 1, 0.3647059, 1,
-0.2932789, -1.283912, 0.1320856, 0, 1, 0.3686275, 1,
-0.2923973, -0.9059394, -1.227787, 0, 1, 0.3764706, 1,
-0.2895615, 0.6373104, -0.5806322, 0, 1, 0.3803922, 1,
-0.2891492, 0.2397562, -0.642921, 0, 1, 0.3882353, 1,
-0.2891192, -0.07497835, -2.23882, 0, 1, 0.3921569, 1,
-0.2885166, -0.07194217, -1.444956, 0, 1, 0.4, 1,
-0.2865618, -1.075642, -3.238246, 0, 1, 0.4078431, 1,
-0.2822023, -2.221243, -4.175842, 0, 1, 0.4117647, 1,
-0.2810237, 1.864744, -0.6710373, 0, 1, 0.4196078, 1,
-0.2768975, 0.3807377, -0.3614885, 0, 1, 0.4235294, 1,
-0.2725722, -0.5240962, -3.052649, 0, 1, 0.4313726, 1,
-0.2715349, -0.5869483, -0.6047602, 0, 1, 0.4352941, 1,
-0.2704632, 0.5533685, 1.871289, 0, 1, 0.4431373, 1,
-0.2689215, 1.020729, 0.1001502, 0, 1, 0.4470588, 1,
-0.2655786, 2.176467, -1.213308, 0, 1, 0.454902, 1,
-0.2637933, 0.3589279, 0.5667607, 0, 1, 0.4588235, 1,
-0.2619149, -0.05594692, -0.1358277, 0, 1, 0.4666667, 1,
-0.2608739, -0.6006283, -2.262068, 0, 1, 0.4705882, 1,
-0.2589479, 0.6350783, -1.079289, 0, 1, 0.4784314, 1,
-0.2576657, -1.289346, -2.279621, 0, 1, 0.4823529, 1,
-0.2565929, 0.9838436, 0.1609861, 0, 1, 0.4901961, 1,
-0.2498708, -2.030121, -3.626148, 0, 1, 0.4941176, 1,
-0.2457957, -0.4499335, -1.723071, 0, 1, 0.5019608, 1,
-0.24363, 2.021127, -0.4146855, 0, 1, 0.509804, 1,
-0.2421722, -1.501653, -2.501648, 0, 1, 0.5137255, 1,
-0.2402782, 0.9056579, -0.5717485, 0, 1, 0.5215687, 1,
-0.2396781, 0.4163673, -0.5494762, 0, 1, 0.5254902, 1,
-0.2391706, 1.495133, 0.2772324, 0, 1, 0.5333334, 1,
-0.2377251, -0.6416986, -2.813252, 0, 1, 0.5372549, 1,
-0.2367496, -0.6975687, -1.636322, 0, 1, 0.5450981, 1,
-0.236307, 0.5778907, 1.206329, 0, 1, 0.5490196, 1,
-0.2321721, 0.1555966, -1.360578, 0, 1, 0.5568628, 1,
-0.2315715, 1.004733, -2.346984, 0, 1, 0.5607843, 1,
-0.2273412, 0.0745261, 0.322809, 0, 1, 0.5686275, 1,
-0.2258046, 1.916312, -0.8775128, 0, 1, 0.572549, 1,
-0.2232291, -0.1983853, -3.055096, 0, 1, 0.5803922, 1,
-0.2220871, 0.1487796, -1.112638, 0, 1, 0.5843138, 1,
-0.21416, -0.5298913, -2.028289, 0, 1, 0.5921569, 1,
-0.2122809, 1.285016, 1.252211, 0, 1, 0.5960785, 1,
-0.2056732, -0.1649286, -2.010383, 0, 1, 0.6039216, 1,
-0.2004916, -0.8293881, -3.262427, 0, 1, 0.6117647, 1,
-0.1997073, -0.3709361, -4.827318, 0, 1, 0.6156863, 1,
-0.1888098, -1.340263, -2.370884, 0, 1, 0.6235294, 1,
-0.1882335, 0.05255766, -1.704751, 0, 1, 0.627451, 1,
-0.1863371, 0.6047541, -0.5162155, 0, 1, 0.6352941, 1,
-0.1812791, 0.8959067, -3.237575, 0, 1, 0.6392157, 1,
-0.1802659, -0.5149139, -3.714749, 0, 1, 0.6470588, 1,
-0.1772569, -0.1403597, -2.496994, 0, 1, 0.6509804, 1,
-0.1755608, -1.725221, -2.361193, 0, 1, 0.6588235, 1,
-0.1741047, -1.514022, -2.905152, 0, 1, 0.6627451, 1,
-0.1511213, -1.0264, -4.058915, 0, 1, 0.6705883, 1,
-0.1510349, 0.5289347, -0.4966464, 0, 1, 0.6745098, 1,
-0.1477758, -0.03204459, 1.603766, 0, 1, 0.682353, 1,
-0.1476981, 0.7011882, -0.3365759, 0, 1, 0.6862745, 1,
-0.1404044, -1.580914, -0.6241273, 0, 1, 0.6941177, 1,
-0.140171, 0.5708313, 0.3862695, 0, 1, 0.7019608, 1,
-0.1373242, -1.363451, -1.79365, 0, 1, 0.7058824, 1,
-0.1364734, 0.652146, -2.356826, 0, 1, 0.7137255, 1,
-0.1362903, -1.5614, -2.841593, 0, 1, 0.7176471, 1,
-0.1328683, -0.07217274, -1.733647, 0, 1, 0.7254902, 1,
-0.1320102, -1.030651, -2.969673, 0, 1, 0.7294118, 1,
-0.1264893, 0.6068462, 0.7829951, 0, 1, 0.7372549, 1,
-0.1211458, -0.1564155, 0.4071591, 0, 1, 0.7411765, 1,
-0.1197127, 1.005502, 0.06550831, 0, 1, 0.7490196, 1,
-0.1164697, 0.7314154, -0.03251905, 0, 1, 0.7529412, 1,
-0.1163899, 0.6676887, 2.04136, 0, 1, 0.7607843, 1,
-0.1143149, -1.733967, -3.332614, 0, 1, 0.7647059, 1,
-0.1099163, -1.19978, -3.109104, 0, 1, 0.772549, 1,
-0.1064089, 1.078317, -1.157681, 0, 1, 0.7764706, 1,
-0.1063772, -0.07151603, -2.388319, 0, 1, 0.7843137, 1,
-0.1054833, -1.819655, -4.871774, 0, 1, 0.7882353, 1,
-0.1054706, 0.5947593, 1.099206, 0, 1, 0.7960784, 1,
-0.1036861, -0.5342222, -3.336175, 0, 1, 0.8039216, 1,
-0.1022004, 0.8530094, -0.7031668, 0, 1, 0.8078431, 1,
-0.09995373, -0.8576684, -2.433772, 0, 1, 0.8156863, 1,
-0.0997135, -0.1335394, -3.428775, 0, 1, 0.8196079, 1,
-0.09967601, -1.0868, -1.999564, 0, 1, 0.827451, 1,
-0.09923973, -0.1774326, -0.3643347, 0, 1, 0.8313726, 1,
-0.0973457, -1.288233, -2.653817, 0, 1, 0.8392157, 1,
-0.08647545, 0.7774601, 1.879562, 0, 1, 0.8431373, 1,
-0.08571254, 0.08809271, -3.11109, 0, 1, 0.8509804, 1,
-0.08527877, -0.1985751, -4.341578, 0, 1, 0.854902, 1,
-0.08509304, -0.2592977, -4.625241, 0, 1, 0.8627451, 1,
-0.07821678, 2.067745, 0.2376425, 0, 1, 0.8666667, 1,
-0.07807404, 1.339101, 0.890712, 0, 1, 0.8745098, 1,
-0.07743213, 0.1178776, 0.3022072, 0, 1, 0.8784314, 1,
-0.07729907, -0.4427839, -2.453346, 0, 1, 0.8862745, 1,
-0.0743266, -0.1763431, -1.501, 0, 1, 0.8901961, 1,
-0.06669272, 0.8021422, -1.154981, 0, 1, 0.8980392, 1,
-0.06405795, 0.8376725, -0.07229822, 0, 1, 0.9058824, 1,
-0.06135995, 0.06415391, -1.341276, 0, 1, 0.9098039, 1,
-0.06081209, -0.2264273, -1.554731, 0, 1, 0.9176471, 1,
-0.0599527, 1.058906, -1.049585, 0, 1, 0.9215686, 1,
-0.05922423, -0.6831291, -4.744395, 0, 1, 0.9294118, 1,
-0.05810144, 0.7843783, -0.348469, 0, 1, 0.9333333, 1,
-0.05512306, -1.521476, -4.268391, 0, 1, 0.9411765, 1,
-0.0547854, -1.157408, -4.493202, 0, 1, 0.945098, 1,
-0.05441848, 0.4022611, -0.877525, 0, 1, 0.9529412, 1,
-0.05416266, 0.4610579, -0.09887697, 0, 1, 0.9568627, 1,
-0.05108375, -0.3943915, -2.019265, 0, 1, 0.9647059, 1,
-0.04052135, -1.029742, -2.732747, 0, 1, 0.9686275, 1,
-0.0381452, -0.1269072, -3.309875, 0, 1, 0.9764706, 1,
-0.03497288, -0.209617, -2.912645, 0, 1, 0.9803922, 1,
-0.03320567, -0.1963558, -1.210739, 0, 1, 0.9882353, 1,
-0.02990178, -1.430021, -2.248068, 0, 1, 0.9921569, 1,
-0.02873693, 0.7432161, -0.09373403, 0, 1, 1, 1,
-0.02447325, -0.4937927, -1.953141, 0, 0.9921569, 1, 1,
-0.02396679, -1.058115, -4.662971, 0, 0.9882353, 1, 1,
-0.01906291, -0.2109673, -4.249134, 0, 0.9803922, 1, 1,
-0.01757426, 2.249405, -1.684419, 0, 0.9764706, 1, 1,
-0.0109264, 0.06995658, 1.852378, 0, 0.9686275, 1, 1,
-0.0103212, 2.827784, 0.5884074, 0, 0.9647059, 1, 1,
-0.0100893, -1.077614, -3.380948, 0, 0.9568627, 1, 1,
-0.008462778, 1.019414, 0.6180279, 0, 0.9529412, 1, 1,
-0.001379823, -0.08721353, -4.745045, 0, 0.945098, 1, 1,
0.002986834, -1.143056, 4.431703, 0, 0.9411765, 1, 1,
0.00366246, -0.7182943, 4.293164, 0, 0.9333333, 1, 1,
0.004385338, -1.631268, 3.424787, 0, 0.9294118, 1, 1,
0.004565822, 0.3692359, -1.061754, 0, 0.9215686, 1, 1,
0.01038862, -0.690681, 2.344401, 0, 0.9176471, 1, 1,
0.01044248, -0.3419721, 2.775709, 0, 0.9098039, 1, 1,
0.01152327, -0.4379317, 5.150626, 0, 0.9058824, 1, 1,
0.01222426, -1.800575, 4.016608, 0, 0.8980392, 1, 1,
0.01684983, -0.7950746, 3.786858, 0, 0.8901961, 1, 1,
0.01820151, 0.1335485, 2.438619, 0, 0.8862745, 1, 1,
0.0199007, 1.289294, 0.5720434, 0, 0.8784314, 1, 1,
0.02210706, -0.2183035, 3.289898, 0, 0.8745098, 1, 1,
0.02308961, -1.431304, 4.446487, 0, 0.8666667, 1, 1,
0.02884569, -1.641064, 0.7837275, 0, 0.8627451, 1, 1,
0.03007812, -1.07911, 3.795142, 0, 0.854902, 1, 1,
0.03370703, 0.15957, -0.4345584, 0, 0.8509804, 1, 1,
0.03421778, 0.4369516, 0.04791939, 0, 0.8431373, 1, 1,
0.03579547, -0.3210673, 4.183785, 0, 0.8392157, 1, 1,
0.03739956, -0.6423271, 4.265165, 0, 0.8313726, 1, 1,
0.04386033, 0.6206208, 0.1497261, 0, 0.827451, 1, 1,
0.04505373, 0.1874628, -0.1999214, 0, 0.8196079, 1, 1,
0.04635028, 1.238014, -0.672257, 0, 0.8156863, 1, 1,
0.0504066, 0.3868832, 1.131036, 0, 0.8078431, 1, 1,
0.05285386, -0.2065722, 2.948887, 0, 0.8039216, 1, 1,
0.05509935, 0.6393496, -0.2120783, 0, 0.7960784, 1, 1,
0.0563431, 0.3067418, 0.118957, 0, 0.7882353, 1, 1,
0.05703893, -0.1541242, 1.993737, 0, 0.7843137, 1, 1,
0.05842497, 1.385746, 0.8260897, 0, 0.7764706, 1, 1,
0.05878159, 0.4067133, -0.4252712, 0, 0.772549, 1, 1,
0.06058723, 2.06206, 0.6618885, 0, 0.7647059, 1, 1,
0.06635631, 0.08125381, 2.591974, 0, 0.7607843, 1, 1,
0.06658784, -0.3111409, 3.698764, 0, 0.7529412, 1, 1,
0.06672279, 0.6218047, -0.5368335, 0, 0.7490196, 1, 1,
0.06721675, 0.1177829, 1.788118, 0, 0.7411765, 1, 1,
0.06771895, 0.9664763, 0.748626, 0, 0.7372549, 1, 1,
0.06934688, 0.0544175, -0.831834, 0, 0.7294118, 1, 1,
0.06964064, -2.046331, 2.444224, 0, 0.7254902, 1, 1,
0.06976496, -1.802499, 3.332286, 0, 0.7176471, 1, 1,
0.07093342, -0.4342828, 4.566995, 0, 0.7137255, 1, 1,
0.07179326, -0.7272903, 2.354741, 0, 0.7058824, 1, 1,
0.0721155, 0.6557412, 0.7797664, 0, 0.6980392, 1, 1,
0.07253374, 0.04528366, 1.066674, 0, 0.6941177, 1, 1,
0.07891606, -1.943211, 4.605361, 0, 0.6862745, 1, 1,
0.08297437, 0.6315026, 0.4250131, 0, 0.682353, 1, 1,
0.08870316, 0.06712894, 1.109274, 0, 0.6745098, 1, 1,
0.09431182, -2.161323, 0.7001386, 0, 0.6705883, 1, 1,
0.0943776, 0.9250768, 0.6911346, 0, 0.6627451, 1, 1,
0.09637533, 1.171928, -0.1183042, 0, 0.6588235, 1, 1,
0.09774958, -0.3356677, 4.346121, 0, 0.6509804, 1, 1,
0.09910244, 0.789207, -0.6069193, 0, 0.6470588, 1, 1,
0.1008224, -1.941074, 2.438874, 0, 0.6392157, 1, 1,
0.102767, -0.9890069, 2.947255, 0, 0.6352941, 1, 1,
0.1037489, -1.276782, 3.827869, 0, 0.627451, 1, 1,
0.1056873, 0.3467341, 0.9358463, 0, 0.6235294, 1, 1,
0.1067082, 0.8690153, 0.7960529, 0, 0.6156863, 1, 1,
0.110262, -1.720809, 1.351413, 0, 0.6117647, 1, 1,
0.1116254, 1.486103, -0.7962446, 0, 0.6039216, 1, 1,
0.1120012, 1.334336, -0.8410649, 0, 0.5960785, 1, 1,
0.1191758, -0.6268793, 3.196915, 0, 0.5921569, 1, 1,
0.1217361, -1.360186, 3.365847, 0, 0.5843138, 1, 1,
0.1221928, 0.7539722, 1.454428, 0, 0.5803922, 1, 1,
0.12568, -1.996076, 2.811297, 0, 0.572549, 1, 1,
0.1334826, 0.2379515, -0.7662699, 0, 0.5686275, 1, 1,
0.1419966, 0.5015513, 1.626121, 0, 0.5607843, 1, 1,
0.1505587, -0.9670829, 2.99234, 0, 0.5568628, 1, 1,
0.1584733, 1.033868, -1.634665, 0, 0.5490196, 1, 1,
0.1631942, -0.8320609, 4.997904, 0, 0.5450981, 1, 1,
0.1645291, 0.5745484, 2.142981, 0, 0.5372549, 1, 1,
0.1646585, -0.9990479, 4.607484, 0, 0.5333334, 1, 1,
0.1649204, 0.4419, -1.697947, 0, 0.5254902, 1, 1,
0.1685197, 1.620543, 0.9911769, 0, 0.5215687, 1, 1,
0.1694039, 0.151182, 0.7804269, 0, 0.5137255, 1, 1,
0.1759709, 0.3685538, 1.310992, 0, 0.509804, 1, 1,
0.1778627, 0.9130758, -0.4239671, 0, 0.5019608, 1, 1,
0.1787387, -0.1078218, 1.66516, 0, 0.4941176, 1, 1,
0.1820376, 0.5150337, 0.8888723, 0, 0.4901961, 1, 1,
0.1866222, -0.6987073, 4.145802, 0, 0.4823529, 1, 1,
0.187519, -2.334043, 3.54821, 0, 0.4784314, 1, 1,
0.1897302, -0.5963641, 2.589129, 0, 0.4705882, 1, 1,
0.1906329, 1.055476, -1.317538, 0, 0.4666667, 1, 1,
0.191635, 1.141144, -1.030018, 0, 0.4588235, 1, 1,
0.1945641, 0.4439462, 1.438206, 0, 0.454902, 1, 1,
0.1962125, -0.6762127, 3.64633, 0, 0.4470588, 1, 1,
0.2012827, -0.3929237, 3.119066, 0, 0.4431373, 1, 1,
0.2023894, -0.9563321, 4.846755, 0, 0.4352941, 1, 1,
0.2027247, -0.02913952, 0.7220629, 0, 0.4313726, 1, 1,
0.2039023, 0.4106939, 1.48635, 0, 0.4235294, 1, 1,
0.205124, -1.378346, 3.768599, 0, 0.4196078, 1, 1,
0.2076465, 1.787063, -1.509392, 0, 0.4117647, 1, 1,
0.2079849, 0.5678133, 0.4825062, 0, 0.4078431, 1, 1,
0.2121248, 0.1085753, 1.357025, 0, 0.4, 1, 1,
0.2121924, 0.3812945, -0.8455509, 0, 0.3921569, 1, 1,
0.217865, 2.002862, 1.414851, 0, 0.3882353, 1, 1,
0.2193839, -0.009534377, 1.350105, 0, 0.3803922, 1, 1,
0.2199336, -0.5065157, 3.999556, 0, 0.3764706, 1, 1,
0.2214863, 0.8780277, 0.2722298, 0, 0.3686275, 1, 1,
0.2330742, 0.02158033, 2.381537, 0, 0.3647059, 1, 1,
0.2350548, 0.6971756, -0.1661141, 0, 0.3568628, 1, 1,
0.2385805, -0.007361129, 3.69386, 0, 0.3529412, 1, 1,
0.2443829, -0.752228, 1.924975, 0, 0.345098, 1, 1,
0.2537903, -1.347994, 4.494821, 0, 0.3411765, 1, 1,
0.2557463, 0.04464343, 1.969837, 0, 0.3333333, 1, 1,
0.2562031, -1.059489, 4.464677, 0, 0.3294118, 1, 1,
0.2566244, 0.5855603, -1.193027, 0, 0.3215686, 1, 1,
0.2658193, 1.784611, -0.566121, 0, 0.3176471, 1, 1,
0.2711826, 0.07321414, 1.934065, 0, 0.3098039, 1, 1,
0.2714558, 0.09508298, 0.4741263, 0, 0.3058824, 1, 1,
0.2714634, 0.2204586, 1.323296, 0, 0.2980392, 1, 1,
0.2723876, 0.2459271, 0.8140334, 0, 0.2901961, 1, 1,
0.2741974, 0.09327625, 0.8498457, 0, 0.2862745, 1, 1,
0.2806664, 0.987789, 0.6871388, 0, 0.2784314, 1, 1,
0.2807652, -0.1107561, 1.116837, 0, 0.2745098, 1, 1,
0.2832266, 0.7921509, 1.087585, 0, 0.2666667, 1, 1,
0.2874131, -0.2948969, 1.127307, 0, 0.2627451, 1, 1,
0.29051, -0.7592666, 1.572928, 0, 0.254902, 1, 1,
0.2940266, 1.122091, 1.461713, 0, 0.2509804, 1, 1,
0.2940446, -0.02542379, 1.94828, 0, 0.2431373, 1, 1,
0.296312, -0.6716888, 1.280289, 0, 0.2392157, 1, 1,
0.2968386, 2.027301, 0.02240204, 0, 0.2313726, 1, 1,
0.2971134, 1.318272, 0.5703555, 0, 0.227451, 1, 1,
0.3020811, -0.1275231, 2.074639, 0, 0.2196078, 1, 1,
0.3033661, 1.637515, 1.335381, 0, 0.2156863, 1, 1,
0.306853, 0.5887325, -0.3836518, 0, 0.2078431, 1, 1,
0.3089853, 0.4379047, -0.9547929, 0, 0.2039216, 1, 1,
0.3095475, -0.7463412, 1.717496, 0, 0.1960784, 1, 1,
0.3096728, 2.538818, -2.135253, 0, 0.1882353, 1, 1,
0.311192, 1.253553, 1.103362, 0, 0.1843137, 1, 1,
0.3119591, -0.1296584, 2.883318, 0, 0.1764706, 1, 1,
0.3148693, -0.9014424, 1.962688, 0, 0.172549, 1, 1,
0.3149975, 0.2825486, 2.23987, 0, 0.1647059, 1, 1,
0.3180704, 1.090931, -1.346575, 0, 0.1607843, 1, 1,
0.3234849, 0.649377, 1.053496, 0, 0.1529412, 1, 1,
0.3245801, 1.432805, -0.2544107, 0, 0.1490196, 1, 1,
0.3254511, -0.08638708, 3.144762, 0, 0.1411765, 1, 1,
0.3261932, -0.9099934, 3.322265, 0, 0.1372549, 1, 1,
0.330901, -0.7577951, 1.60357, 0, 0.1294118, 1, 1,
0.3316735, -2.619387, 2.457835, 0, 0.1254902, 1, 1,
0.3330388, -0.01036224, 1.034117, 0, 0.1176471, 1, 1,
0.3353917, -0.03794888, 2.080363, 0, 0.1137255, 1, 1,
0.3384695, 1.642545, 0.2122186, 0, 0.1058824, 1, 1,
0.3400565, -1.188574, 2.199226, 0, 0.09803922, 1, 1,
0.3430676, 0.9595523, 1.129762, 0, 0.09411765, 1, 1,
0.3467619, -0.9712989, 4.358116, 0, 0.08627451, 1, 1,
0.3498859, 0.6612466, 1.045415, 0, 0.08235294, 1, 1,
0.3547064, -1.649526, 1.678193, 0, 0.07450981, 1, 1,
0.357163, -1.126337, 2.259232, 0, 0.07058824, 1, 1,
0.3576514, -0.9283741, 2.163753, 0, 0.0627451, 1, 1,
0.3579865, -0.3777427, 2.274346, 0, 0.05882353, 1, 1,
0.3616465, 0.4131686, 1.461244, 0, 0.05098039, 1, 1,
0.3666161, -1.459995, 3.280641, 0, 0.04705882, 1, 1,
0.368198, 0.1383021, 2.260711, 0, 0.03921569, 1, 1,
0.3694817, 2.598983, 0.9114208, 0, 0.03529412, 1, 1,
0.3701268, -0.08453982, 1.801298, 0, 0.02745098, 1, 1,
0.3792116, -1.133797, 3.166651, 0, 0.02352941, 1, 1,
0.3896494, -0.4557222, 0.8995646, 0, 0.01568628, 1, 1,
0.3898089, -0.8630242, 3.89993, 0, 0.01176471, 1, 1,
0.3969828, -1.044919, 1.496903, 0, 0.003921569, 1, 1,
0.3984194, 0.3989635, 0.06828468, 0.003921569, 0, 1, 1,
0.4023321, 0.866996, -1.702675, 0.007843138, 0, 1, 1,
0.4061612, 0.4602752, 1.549605, 0.01568628, 0, 1, 1,
0.4123421, 0.770214, 0.3739438, 0.01960784, 0, 1, 1,
0.4166002, -1.229868, 3.703994, 0.02745098, 0, 1, 1,
0.4167294, -0.6854891, 2.313039, 0.03137255, 0, 1, 1,
0.4208628, 0.05264457, 2.766499, 0.03921569, 0, 1, 1,
0.4263331, 0.4715473, 1.446079, 0.04313726, 0, 1, 1,
0.4277013, 0.03531753, 1.479389, 0.05098039, 0, 1, 1,
0.4285532, 0.8521792, 0.6434807, 0.05490196, 0, 1, 1,
0.4308531, -0.7491453, 3.193978, 0.0627451, 0, 1, 1,
0.4358508, 1.42596, 0.3093214, 0.06666667, 0, 1, 1,
0.4367208, 0.0578745, 1.56893, 0.07450981, 0, 1, 1,
0.4371121, -0.5037044, 2.406358, 0.07843138, 0, 1, 1,
0.4397201, -0.7035795, 2.27352, 0.08627451, 0, 1, 1,
0.4459932, -0.0008166544, 1.515132, 0.09019608, 0, 1, 1,
0.4475004, 0.2912174, 1.066341, 0.09803922, 0, 1, 1,
0.447517, -0.6677323, 1.826628, 0.1058824, 0, 1, 1,
0.4481993, -1.145205, 2.132399, 0.1098039, 0, 1, 1,
0.4492099, -2.700326, 3.53901, 0.1176471, 0, 1, 1,
0.4505878, -1.460154, 2.757921, 0.1215686, 0, 1, 1,
0.4542841, 0.6239684, 2.219166, 0.1294118, 0, 1, 1,
0.454462, 0.9579788, 0.8885093, 0.1333333, 0, 1, 1,
0.4555648, 0.779011, 0.2099935, 0.1411765, 0, 1, 1,
0.4584892, -1.429789, 2.926911, 0.145098, 0, 1, 1,
0.4621473, 1.653131, 2.673568, 0.1529412, 0, 1, 1,
0.4624146, 0.2649121, -0.05821303, 0.1568628, 0, 1, 1,
0.4642743, 0.8072266, 1.150919, 0.1647059, 0, 1, 1,
0.4741799, -0.1001843, 3.399943, 0.1686275, 0, 1, 1,
0.4780243, -0.2466431, 0.1765647, 0.1764706, 0, 1, 1,
0.4879633, 0.7754059, -0.4108408, 0.1803922, 0, 1, 1,
0.4945982, -1.056437, 1.146133, 0.1882353, 0, 1, 1,
0.4973944, -0.828113, 2.677234, 0.1921569, 0, 1, 1,
0.4982111, -1.470698, 1.364575, 0.2, 0, 1, 1,
0.5108044, -2.590042, 3.904964, 0.2078431, 0, 1, 1,
0.5124017, 0.6162729, 2.414665, 0.2117647, 0, 1, 1,
0.51487, 0.7008384, -1.246926, 0.2196078, 0, 1, 1,
0.5180249, 1.191327, 1.14391, 0.2235294, 0, 1, 1,
0.522245, -0.01567343, 2.091754, 0.2313726, 0, 1, 1,
0.5241618, 0.3607068, 2.361719, 0.2352941, 0, 1, 1,
0.5248836, -0.322634, 0.3765064, 0.2431373, 0, 1, 1,
0.5284058, 0.6176953, 0.6928709, 0.2470588, 0, 1, 1,
0.5316849, -1.857934, 0.6969689, 0.254902, 0, 1, 1,
0.5390512, 1.075205, 1.377736, 0.2588235, 0, 1, 1,
0.542168, -0.8283705, 1.952244, 0.2666667, 0, 1, 1,
0.5627081, 0.02732407, 2.786089, 0.2705882, 0, 1, 1,
0.5628539, -0.2297304, 2.208457, 0.2784314, 0, 1, 1,
0.563695, -1.113494, 3.687018, 0.282353, 0, 1, 1,
0.5665789, -1.286026, 3.242137, 0.2901961, 0, 1, 1,
0.5666621, -0.3923421, 3.93469, 0.2941177, 0, 1, 1,
0.5684527, -0.5883568, 4.572529, 0.3019608, 0, 1, 1,
0.5700043, -0.5190572, 0.9885902, 0.3098039, 0, 1, 1,
0.5710824, 1.856097, 0.5220338, 0.3137255, 0, 1, 1,
0.5780675, -1.432884, 2.443396, 0.3215686, 0, 1, 1,
0.583438, 0.6134574, -0.201875, 0.3254902, 0, 1, 1,
0.5850805, -0.4395328, 2.902423, 0.3333333, 0, 1, 1,
0.5856071, -0.9364319, 0.7235187, 0.3372549, 0, 1, 1,
0.5866066, 0.04185263, 2.025945, 0.345098, 0, 1, 1,
0.5871468, -0.9978533, 4.260971, 0.3490196, 0, 1, 1,
0.5880613, -0.04737178, 0.8435655, 0.3568628, 0, 1, 1,
0.5909792, -1.179144, 4.867303, 0.3607843, 0, 1, 1,
0.5920219, -0.9890606, 1.686301, 0.3686275, 0, 1, 1,
0.5923798, -1.824555, 2.960305, 0.372549, 0, 1, 1,
0.5942468, 0.1836059, 0.2649566, 0.3803922, 0, 1, 1,
0.5961834, 0.09158452, 1.426332, 0.3843137, 0, 1, 1,
0.5992256, -1.208598, 2.03646, 0.3921569, 0, 1, 1,
0.605048, 0.6000836, -0.4175503, 0.3960784, 0, 1, 1,
0.606457, -1.35895, 1.906668, 0.4039216, 0, 1, 1,
0.6072679, 0.516623, 2.429075, 0.4117647, 0, 1, 1,
0.613124, -0.4696669, 1.480683, 0.4156863, 0, 1, 1,
0.6205833, 2.47002, 0.5249285, 0.4235294, 0, 1, 1,
0.62153, 1.195699, -0.06783745, 0.427451, 0, 1, 1,
0.6255344, 0.6576685, 0.4508692, 0.4352941, 0, 1, 1,
0.6295558, 0.9348527, 1.196613, 0.4392157, 0, 1, 1,
0.6324705, -0.624128, 1.719025, 0.4470588, 0, 1, 1,
0.6327912, -0.4540729, 1.368545, 0.4509804, 0, 1, 1,
0.6343395, 0.2468872, 1.975923, 0.4588235, 0, 1, 1,
0.6367049, 1.622284, 1.502079, 0.4627451, 0, 1, 1,
0.6382161, 0.8910351, -0.3385548, 0.4705882, 0, 1, 1,
0.6482568, -1.369771, 4.229568, 0.4745098, 0, 1, 1,
0.650254, 0.2908807, 1.873111, 0.4823529, 0, 1, 1,
0.6512063, 0.655424, 1.737035, 0.4862745, 0, 1, 1,
0.651996, -0.6395923, 1.499553, 0.4941176, 0, 1, 1,
0.6547214, 0.8890671, 0.1338171, 0.5019608, 0, 1, 1,
0.6584363, 0.8126941, 0.2396393, 0.5058824, 0, 1, 1,
0.6612297, 0.248274, 0.1533077, 0.5137255, 0, 1, 1,
0.6618122, 1.102969, 0.2258426, 0.5176471, 0, 1, 1,
0.6641241, 0.608955, 1.05238, 0.5254902, 0, 1, 1,
0.6671637, -0.1204122, 1.018514, 0.5294118, 0, 1, 1,
0.6673657, -0.0445028, 0.5912589, 0.5372549, 0, 1, 1,
0.6688972, -0.2226645, 3.022783, 0.5411765, 0, 1, 1,
0.6711213, -1.471404, 2.542953, 0.5490196, 0, 1, 1,
0.6769638, 0.2036585, 1.099745, 0.5529412, 0, 1, 1,
0.6780205, 0.2578573, 0.9089164, 0.5607843, 0, 1, 1,
0.6786672, 1.817213, 0.8075868, 0.5647059, 0, 1, 1,
0.6822816, -0.267665, 1.440039, 0.572549, 0, 1, 1,
0.6883349, -0.0004459549, 1.282245, 0.5764706, 0, 1, 1,
0.6936275, 1.540897, -0.4992743, 0.5843138, 0, 1, 1,
0.6941422, -1.644481, 3.301037, 0.5882353, 0, 1, 1,
0.6989122, 0.9752647, 0.9622234, 0.5960785, 0, 1, 1,
0.7104026, 1.147548, 0.3449815, 0.6039216, 0, 1, 1,
0.7136244, -0.03565632, 2.886041, 0.6078432, 0, 1, 1,
0.7145544, 0.8483003, -0.8952851, 0.6156863, 0, 1, 1,
0.7275043, -0.1137243, 2.061127, 0.6196079, 0, 1, 1,
0.7351343, 0.5487607, -0.01294332, 0.627451, 0, 1, 1,
0.7366614, -0.6284653, 1.831312, 0.6313726, 0, 1, 1,
0.7393591, -1.414644, 3.153521, 0.6392157, 0, 1, 1,
0.7446856, 0.7202311, 1.427905, 0.6431373, 0, 1, 1,
0.7455916, 0.09069663, 1.965397, 0.6509804, 0, 1, 1,
0.7472334, 0.528314, 1.249097, 0.654902, 0, 1, 1,
0.7548356, -0.1880987, 3.384466, 0.6627451, 0, 1, 1,
0.7577871, -1.758196, 2.248376, 0.6666667, 0, 1, 1,
0.763935, -0.6959951, 2.252944, 0.6745098, 0, 1, 1,
0.7716027, -0.2360909, 3.528895, 0.6784314, 0, 1, 1,
0.7720158, -1.86325, 1.857543, 0.6862745, 0, 1, 1,
0.7738462, -0.9784029, 3.175073, 0.6901961, 0, 1, 1,
0.7806188, -2.311909, 0.6184117, 0.6980392, 0, 1, 1,
0.7835246, -1.211483, 4.328641, 0.7058824, 0, 1, 1,
0.7868024, -0.3741891, 1.394035, 0.7098039, 0, 1, 1,
0.787384, 0.0808284, 2.248414, 0.7176471, 0, 1, 1,
0.7936763, -0.9049107, 1.29435, 0.7215686, 0, 1, 1,
0.7995569, 1.979687, -0.2814078, 0.7294118, 0, 1, 1,
0.8003528, 1.143858, -0.2590696, 0.7333333, 0, 1, 1,
0.8007125, 0.1907981, -0.08045538, 0.7411765, 0, 1, 1,
0.8119734, -0.8948426, 1.515311, 0.7450981, 0, 1, 1,
0.8131557, 0.1974489, 2.124056, 0.7529412, 0, 1, 1,
0.819617, -0.9326269, 2.967274, 0.7568628, 0, 1, 1,
0.821989, -1.335182, 2.99354, 0.7647059, 0, 1, 1,
0.8238522, -0.1430913, 0.7496374, 0.7686275, 0, 1, 1,
0.824084, 0.4769732, 0.4364335, 0.7764706, 0, 1, 1,
0.8248069, -0.1791519, 1.652897, 0.7803922, 0, 1, 1,
0.8276532, -0.07774807, 2.551061, 0.7882353, 0, 1, 1,
0.8291408, 1.074945, 0.8037236, 0.7921569, 0, 1, 1,
0.8307202, 0.953666, 1.629919, 0.8, 0, 1, 1,
0.8399747, 0.2993018, 0.3625207, 0.8078431, 0, 1, 1,
0.8412579, -1.672657, 2.709121, 0.8117647, 0, 1, 1,
0.8425055, 2.657604, 1.995816, 0.8196079, 0, 1, 1,
0.8525937, 0.05563065, 2.225531, 0.8235294, 0, 1, 1,
0.8533806, -0.8009947, 2.755501, 0.8313726, 0, 1, 1,
0.8555915, -0.1699581, 3.260101, 0.8352941, 0, 1, 1,
0.8562765, -0.5173178, 3.50446, 0.8431373, 0, 1, 1,
0.8573391, -2.245356, 4.373622, 0.8470588, 0, 1, 1,
0.8608627, -0.7858214, 2.669622, 0.854902, 0, 1, 1,
0.8620921, 0.1102377, 0.8223512, 0.8588235, 0, 1, 1,
0.8621503, -1.358302, 1.244332, 0.8666667, 0, 1, 1,
0.8655562, -0.6772546, 0.1122965, 0.8705882, 0, 1, 1,
0.8716702, -1.140602, 1.65825, 0.8784314, 0, 1, 1,
0.8754658, 0.3900989, 2.316584, 0.8823529, 0, 1, 1,
0.8767677, 1.034512, -0.0432943, 0.8901961, 0, 1, 1,
0.8774297, 0.5546596, 1.831363, 0.8941177, 0, 1, 1,
0.8781282, 0.6351104, 0.2447125, 0.9019608, 0, 1, 1,
0.8794686, -1.207276, 1.365519, 0.9098039, 0, 1, 1,
0.8807652, 0.7341256, 0.1877603, 0.9137255, 0, 1, 1,
0.8857937, -1.271154, 1.752414, 0.9215686, 0, 1, 1,
0.8927873, -2.519874, 2.430839, 0.9254902, 0, 1, 1,
0.8949393, -1.27144, 3.411041, 0.9333333, 0, 1, 1,
0.8996154, 0.1862305, 1.247756, 0.9372549, 0, 1, 1,
0.9073118, -1.048127, 1.395061, 0.945098, 0, 1, 1,
0.9124425, -0.989296, 1.33318, 0.9490196, 0, 1, 1,
0.9139017, 0.8381287, 0.5455723, 0.9568627, 0, 1, 1,
0.9169325, -0.2580297, 2.075375, 0.9607843, 0, 1, 1,
0.9229912, -1.5763, 2.717666, 0.9686275, 0, 1, 1,
0.9232115, 0.4698323, 2.460544, 0.972549, 0, 1, 1,
0.9258949, 1.385625, 0.8268726, 0.9803922, 0, 1, 1,
0.9267719, 2.620341, -0.2100087, 0.9843137, 0, 1, 1,
0.9292017, -1.081766, 2.73871, 0.9921569, 0, 1, 1,
0.9373859, -0.07765044, -0.103207, 0.9960784, 0, 1, 1,
0.9723821, 0.6575355, -1.080275, 1, 0, 0.9960784, 1,
0.974718, -1.130004, 2.134046, 1, 0, 0.9882353, 1,
0.9753875, 0.786994, 0.4811707, 1, 0, 0.9843137, 1,
0.9812642, 0.9418492, 1.418564, 1, 0, 0.9764706, 1,
0.9826451, -0.1230426, 1.711154, 1, 0, 0.972549, 1,
0.9903091, 0.9826685, 0.04553549, 1, 0, 0.9647059, 1,
0.9939565, 2.230095, -1.752016, 1, 0, 0.9607843, 1,
0.9961296, 1.400598, 1.409199, 1, 0, 0.9529412, 1,
1.003886, -0.2203617, 0.8785855, 1, 0, 0.9490196, 1,
1.004861, 0.7168553, -0.5716265, 1, 0, 0.9411765, 1,
1.005561, -1.7143, 3.824082, 1, 0, 0.9372549, 1,
1.022227, -0.08905745, 2.828497, 1, 0, 0.9294118, 1,
1.022227, -1.897286, 3.501979, 1, 0, 0.9254902, 1,
1.02613, 1.86518, 0.6925012, 1, 0, 0.9176471, 1,
1.032216, -0.6464061, 2.452006, 1, 0, 0.9137255, 1,
1.034575, 2.200367, -0.09386156, 1, 0, 0.9058824, 1,
1.039574, -1.939038, 3.029623, 1, 0, 0.9019608, 1,
1.044767, -1.358648, 3.619639, 1, 0, 0.8941177, 1,
1.04552, 0.6357884, 0.4516484, 1, 0, 0.8862745, 1,
1.049791, 0.9956369, 3.026111, 1, 0, 0.8823529, 1,
1.050481, 1.422289, 1.556604, 1, 0, 0.8745098, 1,
1.056067, 0.6931879, 2.144876, 1, 0, 0.8705882, 1,
1.072588, -1.005218, 0.4179271, 1, 0, 0.8627451, 1,
1.0748, 0.6793479, 0.8790472, 1, 0, 0.8588235, 1,
1.075353, -0.7781958, 2.865459, 1, 0, 0.8509804, 1,
1.080842, 1.098427, 0.04745015, 1, 0, 0.8470588, 1,
1.088336, 0.1961247, 1.988748, 1, 0, 0.8392157, 1,
1.091682, -1.319793, 0.9683862, 1, 0, 0.8352941, 1,
1.094618, 0.4679355, 2.481626, 1, 0, 0.827451, 1,
1.095212, -1.021706, 2.767167, 1, 0, 0.8235294, 1,
1.111945, 2.161976, 0.7192619, 1, 0, 0.8156863, 1,
1.132839, -0.6574101, 3.016423, 1, 0, 0.8117647, 1,
1.13831, -0.3640225, 0.2273508, 1, 0, 0.8039216, 1,
1.139311, -0.08562203, 1.625184, 1, 0, 0.7960784, 1,
1.13966, -0.5266775, 1.562151, 1, 0, 0.7921569, 1,
1.142779, 0.4347694, -0.328325, 1, 0, 0.7843137, 1,
1.143839, 0.4962673, -0.07206674, 1, 0, 0.7803922, 1,
1.149378, -1.775779, 3.525627, 1, 0, 0.772549, 1,
1.151533, -0.9201385, 1.787614, 1, 0, 0.7686275, 1,
1.152233, 0.5905534, 0.1531645, 1, 0, 0.7607843, 1,
1.153773, -0.3121771, 0.658002, 1, 0, 0.7568628, 1,
1.155033, 2.455926, -0.4298303, 1, 0, 0.7490196, 1,
1.16282, -0.5067282, 1.693146, 1, 0, 0.7450981, 1,
1.165655, -0.1738045, 2.550284, 1, 0, 0.7372549, 1,
1.166856, -1.260482, 2.905842, 1, 0, 0.7333333, 1,
1.171662, 1.018197, 0.8500813, 1, 0, 0.7254902, 1,
1.173913, -1.184321, 1.760588, 1, 0, 0.7215686, 1,
1.188067, 0.1496914, 2.882984, 1, 0, 0.7137255, 1,
1.188096, 0.4116811, 0.9023648, 1, 0, 0.7098039, 1,
1.191119, 1.233732, 2.780127, 1, 0, 0.7019608, 1,
1.191266, 1.622367, 1.406024, 1, 0, 0.6941177, 1,
1.192128, 1.076889, 1.75612, 1, 0, 0.6901961, 1,
1.198509, -0.6383421, 2.94327, 1, 0, 0.682353, 1,
1.210994, -0.5471109, 3.378412, 1, 0, 0.6784314, 1,
1.217999, 0.2585436, 1.286631, 1, 0, 0.6705883, 1,
1.221037, 1.145778, 0.1581897, 1, 0, 0.6666667, 1,
1.222323, -0.5014265, 2.641672, 1, 0, 0.6588235, 1,
1.225363, -0.2412397, 0.3486636, 1, 0, 0.654902, 1,
1.237822, -1.157127, 2.887839, 1, 0, 0.6470588, 1,
1.248336, -0.3477842, 3.793198, 1, 0, 0.6431373, 1,
1.249349, 0.3319279, 0.6760622, 1, 0, 0.6352941, 1,
1.27734, 0.7838715, 0.04131644, 1, 0, 0.6313726, 1,
1.285985, 0.05645066, 0.01691444, 1, 0, 0.6235294, 1,
1.290812, 1.035836, 3.930152, 1, 0, 0.6196079, 1,
1.309654, 1.118993, -0.7829789, 1, 0, 0.6117647, 1,
1.310075, 1.18439, 2.279923, 1, 0, 0.6078432, 1,
1.312035, -0.1527841, 0.1767956, 1, 0, 0.6, 1,
1.318963, -0.5590603, 1.513388, 1, 0, 0.5921569, 1,
1.319672, -0.1001627, 2.303533, 1, 0, 0.5882353, 1,
1.322934, -0.2344583, 2.127464, 1, 0, 0.5803922, 1,
1.330606, -0.488966, 3.565508, 1, 0, 0.5764706, 1,
1.33434, 0.4613693, 1.775625, 1, 0, 0.5686275, 1,
1.34431, -0.1156228, 0.8304194, 1, 0, 0.5647059, 1,
1.344629, -0.1887532, 1.361981, 1, 0, 0.5568628, 1,
1.344681, -2.067169, 1.52247, 1, 0, 0.5529412, 1,
1.351707, -0.9934782, 1.792191, 1, 0, 0.5450981, 1,
1.353674, 0.1216941, 1.850227, 1, 0, 0.5411765, 1,
1.354523, 0.6917448, 0.9577351, 1, 0, 0.5333334, 1,
1.356534, -0.6484751, 2.731298, 1, 0, 0.5294118, 1,
1.36033, 0.3705913, 1.389754, 1, 0, 0.5215687, 1,
1.368106, -0.5954951, 1.122996, 1, 0, 0.5176471, 1,
1.370987, -0.6262184, 2.254427, 1, 0, 0.509804, 1,
1.379409, 0.9781532, -0.5391124, 1, 0, 0.5058824, 1,
1.379627, 0.7420222, 1.776616, 1, 0, 0.4980392, 1,
1.381831, 0.7878168, 0.5169266, 1, 0, 0.4901961, 1,
1.386108, -1.141399, 1.367528, 1, 0, 0.4862745, 1,
1.405752, -1.918432, 3.809233, 1, 0, 0.4784314, 1,
1.414567, 2.700039, -0.5806721, 1, 0, 0.4745098, 1,
1.416376, 0.2396278, 1.366954, 1, 0, 0.4666667, 1,
1.422902, 0.8400765, 2.470354, 1, 0, 0.4627451, 1,
1.435729, -0.7400983, 2.489079, 1, 0, 0.454902, 1,
1.454339, -0.9394001, 2.034735, 1, 0, 0.4509804, 1,
1.460035, -1.19891, 2.309928, 1, 0, 0.4431373, 1,
1.461773, 0.9548722, 1.580962, 1, 0, 0.4392157, 1,
1.46802, 0.04639155, 1.080696, 1, 0, 0.4313726, 1,
1.474602, 0.1378179, 1.460576, 1, 0, 0.427451, 1,
1.475887, 0.5225233, -0.06046471, 1, 0, 0.4196078, 1,
1.48185, 0.8179566, 1.56394, 1, 0, 0.4156863, 1,
1.487437, 0.5059151, 0.9864352, 1, 0, 0.4078431, 1,
1.498269, -1.134911, 1.539106, 1, 0, 0.4039216, 1,
1.502147, 0.05002595, 1.059744, 1, 0, 0.3960784, 1,
1.509582, -0.0862359, 3.410068, 1, 0, 0.3882353, 1,
1.524003, -0.9387386, 3.739372, 1, 0, 0.3843137, 1,
1.538735, 0.8780894, 0.5861787, 1, 0, 0.3764706, 1,
1.540797, -1.469653, 0.7391435, 1, 0, 0.372549, 1,
1.547233, 1.413602, -0.4457391, 1, 0, 0.3647059, 1,
1.550763, -0.5971601, 0.2928122, 1, 0, 0.3607843, 1,
1.554352, -0.1809342, 0.9111231, 1, 0, 0.3529412, 1,
1.579979, -0.02973405, 1.129814, 1, 0, 0.3490196, 1,
1.59036, -0.7966304, 1.220592, 1, 0, 0.3411765, 1,
1.593566, -0.09005999, 1.265987, 1, 0, 0.3372549, 1,
1.59567, 0.662474, 1.02011, 1, 0, 0.3294118, 1,
1.608214, -0.2107636, 2.217806, 1, 0, 0.3254902, 1,
1.621747, -0.1378351, -0.3546247, 1, 0, 0.3176471, 1,
1.622671, 2.300606, 0.5619581, 1, 0, 0.3137255, 1,
1.626988, -0.8306894, 1.478108, 1, 0, 0.3058824, 1,
1.633881, 0.6258562, 0.3950198, 1, 0, 0.2980392, 1,
1.653292, -0.555985, 3.706916, 1, 0, 0.2941177, 1,
1.660708, -0.4746798, 1.876444, 1, 0, 0.2862745, 1,
1.663047, -0.5026446, 1.626719, 1, 0, 0.282353, 1,
1.675852, -0.1151573, 2.138292, 1, 0, 0.2745098, 1,
1.67985, 0.4072433, 1.624816, 1, 0, 0.2705882, 1,
1.691041, 0.755251, 0.5619565, 1, 0, 0.2627451, 1,
1.699201, -1.073287, 1.238353, 1, 0, 0.2588235, 1,
1.710366, 0.1757394, 0.1442012, 1, 0, 0.2509804, 1,
1.711244, 0.141674, 0.9444667, 1, 0, 0.2470588, 1,
1.730312, -0.2880235, 1.117442, 1, 0, 0.2392157, 1,
1.748929, 0.6320688, 2.400029, 1, 0, 0.2352941, 1,
1.757018, 1.324377, 0.9599422, 1, 0, 0.227451, 1,
1.757025, 1.43871, 0.5383681, 1, 0, 0.2235294, 1,
1.777257, 1.307599, 1.903914, 1, 0, 0.2156863, 1,
1.810715, -2.254721, 3.561198, 1, 0, 0.2117647, 1,
1.835195, -0.1751055, 2.212322, 1, 0, 0.2039216, 1,
1.864425, -0.3163028, 2.030444, 1, 0, 0.1960784, 1,
1.892763, -0.1549673, 2.158996, 1, 0, 0.1921569, 1,
1.898552, 0.5676789, 2.276735, 1, 0, 0.1843137, 1,
1.912228, 1.632805, 0.8443026, 1, 0, 0.1803922, 1,
1.926886, -0.3048735, 2.385461, 1, 0, 0.172549, 1,
1.927281, 0.3969588, 0.929502, 1, 0, 0.1686275, 1,
1.929341, 1.174624, 0.6058767, 1, 0, 0.1607843, 1,
1.951732, 0.0001673683, 2.238283, 1, 0, 0.1568628, 1,
1.984065, 0.4976856, 2.52964, 1, 0, 0.1490196, 1,
1.998917, -0.2811539, 1.156477, 1, 0, 0.145098, 1,
2.010667, -0.7313049, 3.244577, 1, 0, 0.1372549, 1,
2.013979, -0.2932201, 3.398986, 1, 0, 0.1333333, 1,
2.056319, 1.026714, 1.20464, 1, 0, 0.1254902, 1,
2.150094, 0.2133287, 1.260618, 1, 0, 0.1215686, 1,
2.188465, 1.817399, 0.4644937, 1, 0, 0.1137255, 1,
2.191342, -0.1072699, 3.255465, 1, 0, 0.1098039, 1,
2.25988, 1.282273, 1.499481, 1, 0, 0.1019608, 1,
2.315925, -1.073438, 1.711887, 1, 0, 0.09411765, 1,
2.390975, 1.714766, 0.2321003, 1, 0, 0.09019608, 1,
2.405893, -1.198446, 1.0831, 1, 0, 0.08235294, 1,
2.554806, -0.6130665, 1.832852, 1, 0, 0.07843138, 1,
2.600463, 1.16561, 3.122813, 1, 0, 0.07058824, 1,
2.62542, 0.63261, 0.5835314, 1, 0, 0.06666667, 1,
2.641829, 0.7874231, 0.149207, 1, 0, 0.05882353, 1,
2.725385, -0.6956772, 2.882177, 1, 0, 0.05490196, 1,
2.732145, -0.4135451, 1.237069, 1, 0, 0.04705882, 1,
2.900175, -0.964708, 1.356571, 1, 0, 0.04313726, 1,
2.910433, 0.79892, 1.053809, 1, 0, 0.03529412, 1,
2.932283, -1.528792, 2.650467, 1, 0, 0.03137255, 1,
2.935882, 2.045159, -0.7446651, 1, 0, 0.02352941, 1,
2.946792, 0.9590028, -0.9591401, 1, 0, 0.01960784, 1,
3.054741, -1.512967, 1.74677, 1, 0, 0.01176471, 1,
3.359014, -2.055639, 2.752799, 1, 0, 0.007843138, 1
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
-0.1476095, -3.682177, -7.152389, 0, -0.5, 0.5, 0.5,
-0.1476095, -3.682177, -7.152389, 1, -0.5, 0.5, 0.5,
-0.1476095, -3.682177, -7.152389, 1, 1.5, 0.5, 0.5,
-0.1476095, -3.682177, -7.152389, 0, 1.5, 0.5, 0.5
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
-4.842978, 0.04455996, -7.152389, 0, -0.5, 0.5, 0.5,
-4.842978, 0.04455996, -7.152389, 1, -0.5, 0.5, 0.5,
-4.842978, 0.04455996, -7.152389, 1, 1.5, 0.5, 0.5,
-4.842978, 0.04455996, -7.152389, 0, 1.5, 0.5, 0.5
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
-4.842978, -3.682177, -0.1093206, 0, -0.5, 0.5, 0.5,
-4.842978, -3.682177, -0.1093206, 1, -0.5, 0.5, 0.5,
-4.842978, -3.682177, -0.1093206, 1, 1.5, 0.5, 0.5,
-4.842978, -3.682177, -0.1093206, 0, 1.5, 0.5, 0.5
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
-2, -2.822161, -5.527065,
2, -2.822161, -5.527065,
-2, -2.822161, -5.527065,
-2, -2.965497, -5.797953,
0, -2.822161, -5.527065,
0, -2.965497, -5.797953,
2, -2.822161, -5.527065,
2, -2.965497, -5.797953
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
"0",
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
-2, -3.252169, -6.339727, 0, -0.5, 0.5, 0.5,
-2, -3.252169, -6.339727, 1, -0.5, 0.5, 0.5,
-2, -3.252169, -6.339727, 1, 1.5, 0.5, 0.5,
-2, -3.252169, -6.339727, 0, 1.5, 0.5, 0.5,
0, -3.252169, -6.339727, 0, -0.5, 0.5, 0.5,
0, -3.252169, -6.339727, 1, -0.5, 0.5, 0.5,
0, -3.252169, -6.339727, 1, 1.5, 0.5, 0.5,
0, -3.252169, -6.339727, 0, 1.5, 0.5, 0.5,
2, -3.252169, -6.339727, 0, -0.5, 0.5, 0.5,
2, -3.252169, -6.339727, 1, -0.5, 0.5, 0.5,
2, -3.252169, -6.339727, 1, 1.5, 0.5, 0.5,
2, -3.252169, -6.339727, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.759432, -2, -5.527065,
-3.759432, 2, -5.527065,
-3.759432, -2, -5.527065,
-3.940023, -2, -5.797953,
-3.759432, -1, -5.527065,
-3.940023, -1, -5.797953,
-3.759432, 0, -5.527065,
-3.940023, 0, -5.797953,
-3.759432, 1, -5.527065,
-3.940023, 1, -5.797953,
-3.759432, 2, -5.527065,
-3.940023, 2, -5.797953
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
-4.301205, -2, -6.339727, 0, -0.5, 0.5, 0.5,
-4.301205, -2, -6.339727, 1, -0.5, 0.5, 0.5,
-4.301205, -2, -6.339727, 1, 1.5, 0.5, 0.5,
-4.301205, -2, -6.339727, 0, 1.5, 0.5, 0.5,
-4.301205, -1, -6.339727, 0, -0.5, 0.5, 0.5,
-4.301205, -1, -6.339727, 1, -0.5, 0.5, 0.5,
-4.301205, -1, -6.339727, 1, 1.5, 0.5, 0.5,
-4.301205, -1, -6.339727, 0, 1.5, 0.5, 0.5,
-4.301205, 0, -6.339727, 0, -0.5, 0.5, 0.5,
-4.301205, 0, -6.339727, 1, -0.5, 0.5, 0.5,
-4.301205, 0, -6.339727, 1, 1.5, 0.5, 0.5,
-4.301205, 0, -6.339727, 0, 1.5, 0.5, 0.5,
-4.301205, 1, -6.339727, 0, -0.5, 0.5, 0.5,
-4.301205, 1, -6.339727, 1, -0.5, 0.5, 0.5,
-4.301205, 1, -6.339727, 1, 1.5, 0.5, 0.5,
-4.301205, 1, -6.339727, 0, 1.5, 0.5, 0.5,
-4.301205, 2, -6.339727, 0, -0.5, 0.5, 0.5,
-4.301205, 2, -6.339727, 1, -0.5, 0.5, 0.5,
-4.301205, 2, -6.339727, 1, 1.5, 0.5, 0.5,
-4.301205, 2, -6.339727, 0, 1.5, 0.5, 0.5
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
-3.759432, -2.822161, -4,
-3.759432, -2.822161, 4,
-3.759432, -2.822161, -4,
-3.940023, -2.965497, -4,
-3.759432, -2.822161, -2,
-3.940023, -2.965497, -2,
-3.759432, -2.822161, 0,
-3.940023, -2.965497, 0,
-3.759432, -2.822161, 2,
-3.940023, -2.965497, 2,
-3.759432, -2.822161, 4,
-3.940023, -2.965497, 4
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
-4.301205, -3.252169, -4, 0, -0.5, 0.5, 0.5,
-4.301205, -3.252169, -4, 1, -0.5, 0.5, 0.5,
-4.301205, -3.252169, -4, 1, 1.5, 0.5, 0.5,
-4.301205, -3.252169, -4, 0, 1.5, 0.5, 0.5,
-4.301205, -3.252169, -2, 0, -0.5, 0.5, 0.5,
-4.301205, -3.252169, -2, 1, -0.5, 0.5, 0.5,
-4.301205, -3.252169, -2, 1, 1.5, 0.5, 0.5,
-4.301205, -3.252169, -2, 0, 1.5, 0.5, 0.5,
-4.301205, -3.252169, 0, 0, -0.5, 0.5, 0.5,
-4.301205, -3.252169, 0, 1, -0.5, 0.5, 0.5,
-4.301205, -3.252169, 0, 1, 1.5, 0.5, 0.5,
-4.301205, -3.252169, 0, 0, 1.5, 0.5, 0.5,
-4.301205, -3.252169, 2, 0, -0.5, 0.5, 0.5,
-4.301205, -3.252169, 2, 1, -0.5, 0.5, 0.5,
-4.301205, -3.252169, 2, 1, 1.5, 0.5, 0.5,
-4.301205, -3.252169, 2, 0, 1.5, 0.5, 0.5,
-4.301205, -3.252169, 4, 0, -0.5, 0.5, 0.5,
-4.301205, -3.252169, 4, 1, -0.5, 0.5, 0.5,
-4.301205, -3.252169, 4, 1, 1.5, 0.5, 0.5,
-4.301205, -3.252169, 4, 0, 1.5, 0.5, 0.5
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
-3.759432, -2.822161, -5.527065,
-3.759432, 2.911281, -5.527065,
-3.759432, -2.822161, 5.308424,
-3.759432, 2.911281, 5.308424,
-3.759432, -2.822161, -5.527065,
-3.759432, -2.822161, 5.308424,
-3.759432, 2.911281, -5.527065,
-3.759432, 2.911281, 5.308424,
-3.759432, -2.822161, -5.527065,
3.464213, -2.822161, -5.527065,
-3.759432, -2.822161, 5.308424,
3.464213, -2.822161, 5.308424,
-3.759432, 2.911281, -5.527065,
3.464213, 2.911281, -5.527065,
-3.759432, 2.911281, 5.308424,
3.464213, 2.911281, 5.308424,
3.464213, -2.822161, -5.527065,
3.464213, 2.911281, -5.527065,
3.464213, -2.822161, 5.308424,
3.464213, 2.911281, 5.308424,
3.464213, -2.822161, -5.527065,
3.464213, -2.822161, 5.308424,
3.464213, 2.911281, -5.527065,
3.464213, 2.911281, 5.308424
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
var radius = 7.59795;
var distance = 33.80413;
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
mvMatrix.translate( 0.1476095, -0.04455996, 0.1093206 );
mvMatrix.scale( 1.137245, 1.432831, 0.7581616 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.80413);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Isobutane<-read.table("Isobutane.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Isobutane$V2
```

```
## Error in eval(expr, envir, enclos): object 'Isobutane' not found
```

```r
y<-Isobutane$V3
```

```
## Error in eval(expr, envir, enclos): object 'Isobutane' not found
```

```r
z<-Isobutane$V4
```

```
## Error in eval(expr, envir, enclos): object 'Isobutane' not found
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
-3.654233, 1.322356, -2.0737, 0, 0, 1, 1, 1,
-3.322046, -0.9176713, -0.9259399, 1, 0, 0, 1, 1,
-2.929291, -0.06005351, -1.202728, 1, 0, 0, 1, 1,
-2.855019, -0.07794182, -0.9904844, 1, 0, 0, 1, 1,
-2.607949, 0.3048698, -3.055807, 1, 0, 0, 1, 1,
-2.599601, 0.9076408, -1.008507, 1, 0, 0, 1, 1,
-2.575964, 0.7536238, -2.67321, 0, 0, 0, 1, 1,
-2.370906, -0.2109627, -2.064925, 0, 0, 0, 1, 1,
-2.325852, 0.6081105, -0.7300637, 0, 0, 0, 1, 1,
-2.282017, -2.068768, -2.615451, 0, 0, 0, 1, 1,
-2.233926, 0.4621084, -0.1503435, 0, 0, 0, 1, 1,
-2.232125, -0.1521486, -2.226955, 0, 0, 0, 1, 1,
-2.219417, -0.782604, -2.661062, 0, 0, 0, 1, 1,
-2.217957, -1.02109, -0.9546577, 1, 1, 1, 1, 1,
-2.19529, -1.526001, -1.695037, 1, 1, 1, 1, 1,
-2.188202, -2.325044, -2.853018, 1, 1, 1, 1, 1,
-2.175805, 0.8471967, -0.5673335, 1, 1, 1, 1, 1,
-2.146319, 0.07844429, -2.851094, 1, 1, 1, 1, 1,
-2.142591, 0.6550366, -2.238561, 1, 1, 1, 1, 1,
-2.073379, 1.188574, -1.803224, 1, 1, 1, 1, 1,
-2.050133, 0.3464787, -0.4658868, 1, 1, 1, 1, 1,
-2.035896, -0.392232, -1.972177, 1, 1, 1, 1, 1,
-1.96994, 0.645624, -2.388578, 1, 1, 1, 1, 1,
-1.962729, 0.08105979, -2.888098, 1, 1, 1, 1, 1,
-1.957228, -0.4049504, -0.1261695, 1, 1, 1, 1, 1,
-1.929694, 1.509216, 0.8725851, 1, 1, 1, 1, 1,
-1.925374, 0.1505564, -0.1202237, 1, 1, 1, 1, 1,
-1.920655, -2.143294, -1.786497, 1, 1, 1, 1, 1,
-1.91679, -0.4018807, -2.195443, 0, 0, 1, 1, 1,
-1.904881, -0.3097329, -1.964594, 1, 0, 0, 1, 1,
-1.903099, 0.5472251, -0.6775073, 1, 0, 0, 1, 1,
-1.902384, -0.1706856, -0.2234834, 1, 0, 0, 1, 1,
-1.898799, -0.9953294, -1.3135, 1, 0, 0, 1, 1,
-1.874878, -0.7915279, -1.383392, 1, 0, 0, 1, 1,
-1.862829, 0.2180094, -2.194921, 0, 0, 0, 1, 1,
-1.84876, 1.0183, -0.3007404, 0, 0, 0, 1, 1,
-1.806138, -1.636494, -2.365641, 0, 0, 0, 1, 1,
-1.793781, -0.3537971, -2.024133, 0, 0, 0, 1, 1,
-1.789248, -0.7548262, -1.749231, 0, 0, 0, 1, 1,
-1.774673, -0.6764547, -2.231058, 0, 0, 0, 1, 1,
-1.76507, 0.7195249, -3.376381, 0, 0, 0, 1, 1,
-1.756432, 1.12979, -0.5812278, 1, 1, 1, 1, 1,
-1.754686, 1.372992, 0.494146, 1, 1, 1, 1, 1,
-1.742756, -0.5589793, -1.785453, 1, 1, 1, 1, 1,
-1.71948, -0.5817041, -0.5496042, 1, 1, 1, 1, 1,
-1.716199, -0.05816498, -0.782103, 1, 1, 1, 1, 1,
-1.713275, -1.578227, -1.722042, 1, 1, 1, 1, 1,
-1.703471, 0.2905482, -2.15019, 1, 1, 1, 1, 1,
-1.699536, 0.7296222, -0.680269, 1, 1, 1, 1, 1,
-1.690399, 0.8718413, -3.003931, 1, 1, 1, 1, 1,
-1.687686, 0.2136893, -2.943123, 1, 1, 1, 1, 1,
-1.676756, -0.8096559, 0.1125982, 1, 1, 1, 1, 1,
-1.665004, -0.3139293, -1.799092, 1, 1, 1, 1, 1,
-1.648002, 1.214093, -1.694691, 1, 1, 1, 1, 1,
-1.63719, -1.160651, -0.9856929, 1, 1, 1, 1, 1,
-1.632295, -1.750176, -1.155824, 1, 1, 1, 1, 1,
-1.620796, 1.956561, 0.3424052, 0, 0, 1, 1, 1,
-1.619558, -1.771861, -4.008014, 1, 0, 0, 1, 1,
-1.617013, 0.2571748, -1.153225, 1, 0, 0, 1, 1,
-1.594345, -0.4549752, -1.916699, 1, 0, 0, 1, 1,
-1.585513, 0.2339876, -0.3839009, 1, 0, 0, 1, 1,
-1.56833, -0.9662362, -1.772694, 1, 0, 0, 1, 1,
-1.565567, -0.7247061, -1.328165, 0, 0, 0, 1, 1,
-1.552912, 0.2921325, -1.61659, 0, 0, 0, 1, 1,
-1.552846, 0.3830914, -1.671115, 0, 0, 0, 1, 1,
-1.550891, 0.2359535, -1.413425, 0, 0, 0, 1, 1,
-1.547051, -0.7483937, -2.20125, 0, 0, 0, 1, 1,
-1.543114, 0.4597552, -1.157608, 0, 0, 0, 1, 1,
-1.536159, -0.4726489, -1.707518, 0, 0, 0, 1, 1,
-1.525787, -0.2960744, -1.894861, 1, 1, 1, 1, 1,
-1.500983, 0.003982211, -2.148826, 1, 1, 1, 1, 1,
-1.498567, -1.885893, -1.293236, 1, 1, 1, 1, 1,
-1.498504, 0.10489, -1.756836, 1, 1, 1, 1, 1,
-1.494965, -0.8388489, -2.339539, 1, 1, 1, 1, 1,
-1.492112, 0.8282167, -1.40175, 1, 1, 1, 1, 1,
-1.484013, -0.3223636, -0.02529057, 1, 1, 1, 1, 1,
-1.481086, -1.331437, -3.39057, 1, 1, 1, 1, 1,
-1.46332, 0.8710526, -0.8576087, 1, 1, 1, 1, 1,
-1.460083, -0.8472954, -3.505341, 1, 1, 1, 1, 1,
-1.450691, -0.2389229, -0.7833672, 1, 1, 1, 1, 1,
-1.440976, 0.6585947, -0.9133635, 1, 1, 1, 1, 1,
-1.423791, -0.9198847, -2.071078, 1, 1, 1, 1, 1,
-1.422212, 0.05066567, -2.023754, 1, 1, 1, 1, 1,
-1.422157, 1.242199, -0.05199145, 1, 1, 1, 1, 1,
-1.408064, 1.307214, -3.1494, 0, 0, 1, 1, 1,
-1.403897, -0.4715886, -1.859681, 1, 0, 0, 1, 1,
-1.401454, -1.868468, -3.419686, 1, 0, 0, 1, 1,
-1.389408, -0.1420214, -2.433648, 1, 0, 0, 1, 1,
-1.382011, 0.4899724, -1.337518, 1, 0, 0, 1, 1,
-1.379466, -0.4257293, -2.155726, 1, 0, 0, 1, 1,
-1.364556, -0.4928442, -0.9666533, 0, 0, 0, 1, 1,
-1.350136, -1.650751, -3.562275, 0, 0, 0, 1, 1,
-1.345904, 0.06660359, -1.001237, 0, 0, 0, 1, 1,
-1.342245, -0.1423537, -2.100877, 0, 0, 0, 1, 1,
-1.329808, 1.430405, 0.7149585, 0, 0, 0, 1, 1,
-1.325519, 0.2856499, -1.01157, 0, 0, 0, 1, 1,
-1.324277, -0.2561006, 0.115789, 0, 0, 0, 1, 1,
-1.315772, -0.1102888, -1.811451, 1, 1, 1, 1, 1,
-1.31485, -1.067093, -1.555837, 1, 1, 1, 1, 1,
-1.313736, -0.4082883, -0.84643, 1, 1, 1, 1, 1,
-1.310404, 0.1701573, -2.376888, 1, 1, 1, 1, 1,
-1.309659, 0.2546901, -0.1996493, 1, 1, 1, 1, 1,
-1.301728, -1.189183, -3.080619, 1, 1, 1, 1, 1,
-1.280946, -0.6954391, -2.608261, 1, 1, 1, 1, 1,
-1.268782, 0.03861252, -1.824419, 1, 1, 1, 1, 1,
-1.260362, -1.931326, -3.148323, 1, 1, 1, 1, 1,
-1.258014, 1.496843, -0.04573695, 1, 1, 1, 1, 1,
-1.257935, 0.9139567, 0.1131239, 1, 1, 1, 1, 1,
-1.252167, 0.1912795, -1.592708, 1, 1, 1, 1, 1,
-1.251141, -0.7365758, -0.1737863, 1, 1, 1, 1, 1,
-1.244141, 0.1361435, -0.7011169, 1, 1, 1, 1, 1,
-1.242324, -0.2546408, -1.574167, 1, 1, 1, 1, 1,
-1.239, -2.738664, -1.560733, 0, 0, 1, 1, 1,
-1.234929, 1.085632, -0.5483849, 1, 0, 0, 1, 1,
-1.230182, -1.020321, -2.101543, 1, 0, 0, 1, 1,
-1.229589, 1.249519, -2.46122, 1, 0, 0, 1, 1,
-1.227187, 1.512978, -1.453593, 1, 0, 0, 1, 1,
-1.223957, 0.2934579, -1.204718, 1, 0, 0, 1, 1,
-1.222892, -2.072554, -1.086447, 0, 0, 0, 1, 1,
-1.220536, -1.469028, -3.332803, 0, 0, 0, 1, 1,
-1.217281, 0.3038104, -1.166128, 0, 0, 0, 1, 1,
-1.213994, -1.415311, -4.403836, 0, 0, 0, 1, 1,
-1.213803, -0.8078699, -1.534432, 0, 0, 0, 1, 1,
-1.205971, -0.1589355, -1.897922, 0, 0, 0, 1, 1,
-1.2009, -1.811563, -3.890971, 0, 0, 0, 1, 1,
-1.200655, -1.132411, -2.714171, 1, 1, 1, 1, 1,
-1.183841, -1.385005, -4.413555, 1, 1, 1, 1, 1,
-1.178903, -0.004420164, -1.364336, 1, 1, 1, 1, 1,
-1.167582, 1.056255, -1.598901, 1, 1, 1, 1, 1,
-1.167484, 2.189973, -2.233672, 1, 1, 1, 1, 1,
-1.157701, -0.9303034, -3.153903, 1, 1, 1, 1, 1,
-1.157439, -2.062232, -1.718473, 1, 1, 1, 1, 1,
-1.149396, -0.04516635, -1.375404, 1, 1, 1, 1, 1,
-1.146502, 1.675609, 1.578396, 1, 1, 1, 1, 1,
-1.134514, 0.7118277, 0.6253837, 1, 1, 1, 1, 1,
-1.132111, 0.6566618, -1.579336, 1, 1, 1, 1, 1,
-1.129921, 0.235009, -0.1295351, 1, 1, 1, 1, 1,
-1.12885, 0.8849046, -1.13362, 1, 1, 1, 1, 1,
-1.126912, 0.09391224, -2.769496, 1, 1, 1, 1, 1,
-1.124821, -0.3081295, -1.782651, 1, 1, 1, 1, 1,
-1.119001, -0.2417571, -2.959893, 0, 0, 1, 1, 1,
-1.118316, -1.627136, -3.213577, 1, 0, 0, 1, 1,
-1.115017, 0.7596021, -0.1334485, 1, 0, 0, 1, 1,
-1.111519, -0.1627827, -2.369613, 1, 0, 0, 1, 1,
-1.110508, -0.0004643504, -0.7465456, 1, 0, 0, 1, 1,
-1.110236, 1.393336, -1.645285, 1, 0, 0, 1, 1,
-1.108819, -1.406753, -1.134901, 0, 0, 0, 1, 1,
-1.097722, -1.062744, -2.315903, 0, 0, 0, 1, 1,
-1.094233, -0.9724414, -1.994407, 0, 0, 0, 1, 1,
-1.086813, 0.1967498, -0.1652318, 0, 0, 0, 1, 1,
-1.083678, -0.5174966, -1.784111, 0, 0, 0, 1, 1,
-1.075214, -0.287508, -0.2788078, 0, 0, 0, 1, 1,
-1.073521, -0.9155414, -1.016202, 0, 0, 0, 1, 1,
-1.071709, 0.5119792, -0.3961321, 1, 1, 1, 1, 1,
-1.063345, 1.367867, -1.275714, 1, 1, 1, 1, 1,
-1.060803, 0.6603875, -1.132856, 1, 1, 1, 1, 1,
-1.059104, 1.334892, 0.5147385, 1, 1, 1, 1, 1,
-1.058734, 0.2395304, -2.298427, 1, 1, 1, 1, 1,
-1.058079, 0.1777432, -1.744278, 1, 1, 1, 1, 1,
-1.043265, 0.09128509, -1.010633, 1, 1, 1, 1, 1,
-1.039305, -0.9278745, -1.491444, 1, 1, 1, 1, 1,
-1.038855, -1.943206, -2.639298, 1, 1, 1, 1, 1,
-1.023074, -1.0707, -0.4825325, 1, 1, 1, 1, 1,
-1.020357, 0.1719556, -1.861669, 1, 1, 1, 1, 1,
-1.018345, 0.2042462, -0.6726577, 1, 1, 1, 1, 1,
-1.012541, -0.3385098, -2.592046, 1, 1, 1, 1, 1,
-1.012282, -0.2382015, -0.8434431, 1, 1, 1, 1, 1,
-1.01126, 1.053677, -0.2773598, 1, 1, 1, 1, 1,
-1.006047, -0.5714567, -1.106751, 0, 0, 1, 1, 1,
-0.9981182, 0.4401135, -1.001226, 1, 0, 0, 1, 1,
-0.9980422, -0.3814164, -3.060921, 1, 0, 0, 1, 1,
-0.9976624, -1.523405, -1.250536, 1, 0, 0, 1, 1,
-0.9937248, -1.231509, -2.746408, 1, 0, 0, 1, 1,
-0.9919357, 0.2182115, -0.2014694, 1, 0, 0, 1, 1,
-0.9869666, -0.1830712, -3.701603, 0, 0, 0, 1, 1,
-0.9868692, 0.8080704, -0.7004606, 0, 0, 0, 1, 1,
-0.9850032, -0.4520197, -3.530233, 0, 0, 0, 1, 1,
-0.9784254, 0.339741, -2.557399, 0, 0, 0, 1, 1,
-0.9767512, 0.7032264, -1.260706, 0, 0, 0, 1, 1,
-0.9765955, 0.2414326, -0.6493001, 0, 0, 0, 1, 1,
-0.968133, 1.095525, 1.993591, 0, 0, 0, 1, 1,
-0.9672067, -0.2597781, -2.62747, 1, 1, 1, 1, 1,
-0.948414, 0.5500119, -0.9736519, 1, 1, 1, 1, 1,
-0.9419322, 0.07526902, -2.755731, 1, 1, 1, 1, 1,
-0.9380584, -0.7278327, -2.002036, 1, 1, 1, 1, 1,
-0.9375355, -0.1624162, -0.7412609, 1, 1, 1, 1, 1,
-0.9343167, -1.53687, -4.843043, 1, 1, 1, 1, 1,
-0.9321014, -1.376561, -0.5827971, 1, 1, 1, 1, 1,
-0.9280692, 1.166526, -0.8060505, 1, 1, 1, 1, 1,
-0.9231026, -1.583755, -2.232266, 1, 1, 1, 1, 1,
-0.9215874, -0.2613577, -2.59109, 1, 1, 1, 1, 1,
-0.9131984, -0.08440584, -0.9400215, 1, 1, 1, 1, 1,
-0.9094949, -1.680987, -2.095853, 1, 1, 1, 1, 1,
-0.9085447, -0.1716457, -1.549152, 1, 1, 1, 1, 1,
-0.9074588, -0.559941, -1.612814, 1, 1, 1, 1, 1,
-0.9009081, 0.4165065, -0.9948961, 1, 1, 1, 1, 1,
-0.8974965, 0.2715865, -3.124924, 0, 0, 1, 1, 1,
-0.8973817, -0.7793328, -1.085321, 1, 0, 0, 1, 1,
-0.8951015, 0.3384781, -0.4594918, 1, 0, 0, 1, 1,
-0.893746, -1.296205, -3.461132, 1, 0, 0, 1, 1,
-0.8936434, -0.2391508, -2.39201, 1, 0, 0, 1, 1,
-0.892396, -0.1435467, -3.436309, 1, 0, 0, 1, 1,
-0.8918669, 0.6114482, 0.6382455, 0, 0, 0, 1, 1,
-0.8887896, -0.8616729, -4.627293, 0, 0, 0, 1, 1,
-0.878996, -0.5313542, -1.159892, 0, 0, 0, 1, 1,
-0.8754818, 1.0243, -1.398973, 0, 0, 0, 1, 1,
-0.8752427, -0.2379495, -1.297527, 0, 0, 0, 1, 1,
-0.8747944, -0.6483881, -1.905983, 0, 0, 0, 1, 1,
-0.8710909, 0.2882366, 0.03980189, 0, 0, 0, 1, 1,
-0.8661155, 0.6918557, -0.3992611, 1, 1, 1, 1, 1,
-0.8629515, -0.1991175, -0.5779583, 1, 1, 1, 1, 1,
-0.8573329, -0.1388374, -2.153691, 1, 1, 1, 1, 1,
-0.8570827, 1.925908, -1.321464, 1, 1, 1, 1, 1,
-0.8464833, 1.876823, -1.387062, 1, 1, 1, 1, 1,
-0.8405623, -0.8689611, -3.665169, 1, 1, 1, 1, 1,
-0.8353245, 0.3355129, -1.114228, 1, 1, 1, 1, 1,
-0.8260545, 0.736162, -1.579888, 1, 1, 1, 1, 1,
-0.8217578, 0.4762457, -1.216084, 1, 1, 1, 1, 1,
-0.8159972, 1.164231, -2.570377, 1, 1, 1, 1, 1,
-0.8099052, 0.1583539, -2.311334, 1, 1, 1, 1, 1,
-0.8071631, 0.8035923, -0.5664117, 1, 1, 1, 1, 1,
-0.7999014, 0.5768573, -1.170904, 1, 1, 1, 1, 1,
-0.7990039, 0.7302532, -0.3536871, 1, 1, 1, 1, 1,
-0.7931244, -0.2784174, -2.368887, 1, 1, 1, 1, 1,
-0.7810332, -1.379812, -2.559441, 0, 0, 1, 1, 1,
-0.7804818, -0.8493078, -2.868038, 1, 0, 0, 1, 1,
-0.7800097, -0.7137703, -0.4999265, 1, 0, 0, 1, 1,
-0.780003, 0.05403831, -0.1714112, 1, 0, 0, 1, 1,
-0.7796661, 1.790203, -0.04987589, 1, 0, 0, 1, 1,
-0.7796206, -0.9586996, -2.126593, 1, 0, 0, 1, 1,
-0.7765546, -0.5253164, -2.677191, 0, 0, 0, 1, 1,
-0.7758167, 0.07229147, -0.9488085, 0, 0, 0, 1, 1,
-0.7754084, -0.7232242, -3.929698, 0, 0, 0, 1, 1,
-0.7739994, 0.9496315, -1.147681, 0, 0, 0, 1, 1,
-0.7676893, -2.013652, -1.646998, 0, 0, 0, 1, 1,
-0.767259, 0.3517428, -1.89996, 0, 0, 0, 1, 1,
-0.7560315, 1.242321, -0.6599907, 0, 0, 0, 1, 1,
-0.7531102, 0.920632, -1.646043, 1, 1, 1, 1, 1,
-0.7438203, 0.6229763, -2.118662, 1, 1, 1, 1, 1,
-0.739034, 0.2592179, -0.9965929, 1, 1, 1, 1, 1,
-0.7312046, 1.779101, -0.4224068, 1, 1, 1, 1, 1,
-0.7212119, 0.1050752, -0.6606081, 1, 1, 1, 1, 1,
-0.7209364, 1.977946, -0.1670091, 1, 1, 1, 1, 1,
-0.7197606, 1.289098, -1.957974, 1, 1, 1, 1, 1,
-0.7196044, -1.0972, -2.072667, 1, 1, 1, 1, 1,
-0.7132066, 0.8416958, -0.02021171, 1, 1, 1, 1, 1,
-0.7063277, -0.3284003, -1.282761, 1, 1, 1, 1, 1,
-0.7048715, -0.2239358, -1.334053, 1, 1, 1, 1, 1,
-0.7043305, -0.5007344, -1.006442, 1, 1, 1, 1, 1,
-0.7013552, -0.5660166, -2.328896, 1, 1, 1, 1, 1,
-0.7004099, -2.382972, -3.060361, 1, 1, 1, 1, 1,
-0.695775, -2.48757, -2.784989, 1, 1, 1, 1, 1,
-0.6942801, -0.7974994, -3.747321, 0, 0, 1, 1, 1,
-0.6932364, -0.6787876, -2.165884, 1, 0, 0, 1, 1,
-0.6878612, 0.4710936, -1.533385, 1, 0, 0, 1, 1,
-0.6871015, -1.924769, -3.745476, 1, 0, 0, 1, 1,
-0.6858368, -1.983099, -5.369267, 1, 0, 0, 1, 1,
-0.6839889, 1.413256, 0.4703848, 1, 0, 0, 1, 1,
-0.6831802, 0.560375, -0.7205859, 0, 0, 0, 1, 1,
-0.6764347, 1.481756, 1.484958, 0, 0, 0, 1, 1,
-0.6763531, 0.8877844, -0.6719427, 0, 0, 0, 1, 1,
-0.6692389, 1.511735, 1.072039, 0, 0, 0, 1, 1,
-0.6691849, -1.075074, -3.481567, 0, 0, 0, 1, 1,
-0.6685494, -1.244147, -3.005411, 0, 0, 0, 1, 1,
-0.662302, -0.03904121, -1.746356, 0, 0, 0, 1, 1,
-0.6605222, -0.6983893, -4.83884, 1, 1, 1, 1, 1,
-0.6574793, -0.8125002, -0.8850791, 1, 1, 1, 1, 1,
-0.6527949, 0.8919359, -1.179001, 1, 1, 1, 1, 1,
-0.6524115, -0.03663839, -3.086783, 1, 1, 1, 1, 1,
-0.6395679, 0.4302287, -3.289879, 1, 1, 1, 1, 1,
-0.6375428, 2.420096, -0.9105792, 1, 1, 1, 1, 1,
-0.6349177, 0.4073005, -1.008895, 1, 1, 1, 1, 1,
-0.631555, -0.8693652, -0.4738452, 1, 1, 1, 1, 1,
-0.627489, 1.446119, 0.4997578, 1, 1, 1, 1, 1,
-0.6254445, 1.025425, -1.790688, 1, 1, 1, 1, 1,
-0.6219714, 0.2044788, -1.950987, 1, 1, 1, 1, 1,
-0.6167841, 1.116462, 0.4836468, 1, 1, 1, 1, 1,
-0.6097402, -0.6340563, -1.455024, 1, 1, 1, 1, 1,
-0.6061761, -0.2646419, -1.742786, 1, 1, 1, 1, 1,
-0.6036116, -0.0898399, -1.70677, 1, 1, 1, 1, 1,
-0.5986765, -1.937563, -1.776344, 0, 0, 1, 1, 1,
-0.5946546, -1.822956, -2.942869, 1, 0, 0, 1, 1,
-0.5943957, 2.059835, 0.8134055, 1, 0, 0, 1, 1,
-0.5921749, -0.29116, -0.6104693, 1, 0, 0, 1, 1,
-0.5903813, -0.250274, -4.224793, 1, 0, 0, 1, 1,
-0.5903676, 0.07930892, -1.24909, 1, 0, 0, 1, 1,
-0.5895794, -0.4644665, -1.742756, 0, 0, 0, 1, 1,
-0.5812541, -0.8828502, -3.25131, 0, 0, 0, 1, 1,
-0.5794857, -1.503985, -2.022777, 0, 0, 0, 1, 1,
-0.5784691, -1.238641, -2.723927, 0, 0, 0, 1, 1,
-0.5720685, -0.9871925, -3.407331, 0, 0, 0, 1, 1,
-0.5686669, 0.8682197, 0.2869005, 0, 0, 0, 1, 1,
-0.5682828, 0.6572405, 0.7442853, 0, 0, 0, 1, 1,
-0.56719, 1.321084, -0.8664789, 1, 1, 1, 1, 1,
-0.5656035, -0.1647336, -2.658441, 1, 1, 1, 1, 1,
-0.5632103, -0.54274, -2.797592, 1, 1, 1, 1, 1,
-0.555204, -0.7990336, -3.922004, 1, 1, 1, 1, 1,
-0.5539861, 1.13021, -2.041066, 1, 1, 1, 1, 1,
-0.5528734, -0.04589117, -2.788771, 1, 1, 1, 1, 1,
-0.5487592, 1.053258, -1.319129, 1, 1, 1, 1, 1,
-0.546737, -0.1294395, -1.032643, 1, 1, 1, 1, 1,
-0.5409358, -1.10998, -3.271569, 1, 1, 1, 1, 1,
-0.5403085, -0.1084027, -0.6841478, 1, 1, 1, 1, 1,
-0.5380523, -0.223025, -1.921832, 1, 1, 1, 1, 1,
-0.5235367, 0.6059182, -1.351206, 1, 1, 1, 1, 1,
-0.5223714, 1.024099, -0.7744657, 1, 1, 1, 1, 1,
-0.520818, -1.37862, -1.944891, 1, 1, 1, 1, 1,
-0.5203692, -0.2210711, -1.644301, 1, 1, 1, 1, 1,
-0.5201338, 1.393283, -1.177195, 0, 0, 1, 1, 1,
-0.5122077, -0.928097, -3.095411, 1, 0, 0, 1, 1,
-0.5120885, 1.24565, -0.5446345, 1, 0, 0, 1, 1,
-0.5082768, 0.4373485, -0.08891971, 1, 0, 0, 1, 1,
-0.5054981, 0.1290595, -1.955091, 1, 0, 0, 1, 1,
-0.501334, 1.716218, 0.4611214, 1, 0, 0, 1, 1,
-0.5011178, -0.5801373, -0.3954065, 0, 0, 0, 1, 1,
-0.4995456, 0.770124, -0.03962626, 0, 0, 0, 1, 1,
-0.4977282, -0.5036604, -1.689103, 0, 0, 0, 1, 1,
-0.4973687, 0.3315552, 0.04707937, 0, 0, 0, 1, 1,
-0.4941712, -0.6888872, -2.923409, 0, 0, 0, 1, 1,
-0.4938775, 0.6633774, -2.94882, 0, 0, 0, 1, 1,
-0.4906309, 1.130345, 0.2904747, 0, 0, 0, 1, 1,
-0.4895167, 0.8524318, 0.2861937, 1, 1, 1, 1, 1,
-0.4894484, -0.3638861, -1.393851, 1, 1, 1, 1, 1,
-0.4893178, -0.09471456, -1.512172, 1, 1, 1, 1, 1,
-0.4821876, -0.6712217, -1.777825, 1, 1, 1, 1, 1,
-0.4806513, 0.2074046, -0.2906934, 1, 1, 1, 1, 1,
-0.4783176, -0.1937394, -1.689697, 1, 1, 1, 1, 1,
-0.4780385, -0.8576303, -2.849313, 1, 1, 1, 1, 1,
-0.4763386, -0.1471068, -3.675306, 1, 1, 1, 1, 1,
-0.4757782, 0.2756797, -0.6358883, 1, 1, 1, 1, 1,
-0.4747028, 2.446029, -0.9767694, 1, 1, 1, 1, 1,
-0.4734939, 0.4340895, -0.006508539, 1, 1, 1, 1, 1,
-0.4732907, 0.6603371, -0.5385774, 1, 1, 1, 1, 1,
-0.4693733, -1.201538, -3.711825, 1, 1, 1, 1, 1,
-0.4625902, 0.516901, 0.8917374, 1, 1, 1, 1, 1,
-0.4620368, -0.07856291, -1.638902, 1, 1, 1, 1, 1,
-0.461258, -0.5144391, -2.954842, 0, 0, 1, 1, 1,
-0.4554601, 0.2110038, -0.978612, 1, 0, 0, 1, 1,
-0.45065, 1.385131, -2.407668, 1, 0, 0, 1, 1,
-0.4495143, -0.2708891, -2.145567, 1, 0, 0, 1, 1,
-0.4432644, 1.025385, 0.7104245, 1, 0, 0, 1, 1,
-0.4431445, 0.4827709, -1.016551, 1, 0, 0, 1, 1,
-0.439362, 0.8237453, -0.4152081, 0, 0, 0, 1, 1,
-0.4376235, 0.1867737, -2.413114, 0, 0, 0, 1, 1,
-0.4367689, 1.078958, -0.601432, 0, 0, 0, 1, 1,
-0.4356075, 0.5835134, -0.2005901, 0, 0, 0, 1, 1,
-0.4311331, -0.6498074, -2.912688, 0, 0, 0, 1, 1,
-0.424613, -0.5967501, -3.588977, 0, 0, 0, 1, 1,
-0.4244388, -1.617833, -4.524014, 0, 0, 0, 1, 1,
-0.4243196, -2.347862, -3.842645, 1, 1, 1, 1, 1,
-0.4224209, -0.07692728, -0.8135513, 1, 1, 1, 1, 1,
-0.4179284, 1.397912, -0.5123898, 1, 1, 1, 1, 1,
-0.41787, 0.8646274, -0.8809457, 1, 1, 1, 1, 1,
-0.4178659, -0.1310678, -0.9791254, 1, 1, 1, 1, 1,
-0.4145086, 0.05623758, -2.066, 1, 1, 1, 1, 1,
-0.4106561, 0.6063169, -2.544951, 1, 1, 1, 1, 1,
-0.4099004, 0.491642, -1.016803, 1, 1, 1, 1, 1,
-0.40807, 0.02906983, -0.5175666, 1, 1, 1, 1, 1,
-0.4071859, -0.1102648, -1.985404, 1, 1, 1, 1, 1,
-0.4047661, -1.217843, -4.134506, 1, 1, 1, 1, 1,
-0.4037615, -1.711075, -2.975557, 1, 1, 1, 1, 1,
-0.4036779, -0.08589989, -2.249909, 1, 1, 1, 1, 1,
-0.4031848, -1.505857, -3.328854, 1, 1, 1, 1, 1,
-0.4029838, 0.4643016, -0.8286891, 1, 1, 1, 1, 1,
-0.4015916, 0.8043717, 0.2668375, 0, 0, 1, 1, 1,
-0.4015733, -0.3804478, -1.730098, 1, 0, 0, 1, 1,
-0.3999, -0.5649228, -1.523326, 1, 0, 0, 1, 1,
-0.3944191, 0.2294531, -1.637178, 1, 0, 0, 1, 1,
-0.3840178, -1.840401, -2.748636, 1, 0, 0, 1, 1,
-0.3784057, 0.994638, -0.7337999, 1, 0, 0, 1, 1,
-0.3741635, 1.98336, -0.4837822, 0, 0, 0, 1, 1,
-0.3734537, 1.619023, -0.7950264, 0, 0, 0, 1, 1,
-0.371552, 0.3112786, -0.1812443, 0, 0, 0, 1, 1,
-0.3675185, 0.09380472, -1.381747, 0, 0, 0, 1, 1,
-0.364326, 0.9038519, -1.512828, 0, 0, 0, 1, 1,
-0.3607104, 0.4123168, 1.470225, 0, 0, 0, 1, 1,
-0.3606094, 0.5600684, 0.2993505, 0, 0, 0, 1, 1,
-0.347614, 0.8149022, 1.835548, 1, 1, 1, 1, 1,
-0.3468637, 1.831819, -1.273244, 1, 1, 1, 1, 1,
-0.3421437, -0.4254379, -3.597604, 1, 1, 1, 1, 1,
-0.3386051, 0.3046516, -0.8386125, 1, 1, 1, 1, 1,
-0.3367462, 0.5013828, -0.5208101, 1, 1, 1, 1, 1,
-0.3352249, 0.7649614, -1.026603, 1, 1, 1, 1, 1,
-0.331729, 0.5083653, -0.06420574, 1, 1, 1, 1, 1,
-0.3291287, -0.2089518, 0.4673708, 1, 1, 1, 1, 1,
-0.3235978, -2.31546, -2.727577, 1, 1, 1, 1, 1,
-0.3230268, -0.5806972, -2.005337, 1, 1, 1, 1, 1,
-0.3224601, -0.00257065, -0.4102125, 1, 1, 1, 1, 1,
-0.3203901, 0.7282988, 1.220276, 1, 1, 1, 1, 1,
-0.3190606, 0.3153886, -2.062155, 1, 1, 1, 1, 1,
-0.317169, -0.2584243, -0.9983221, 1, 1, 1, 1, 1,
-0.3110949, 2.126279, -1.094916, 1, 1, 1, 1, 1,
-0.3024707, 1.429397, -2.141117, 0, 0, 1, 1, 1,
-0.296442, 0.2117551, 0.07233533, 1, 0, 0, 1, 1,
-0.2953488, 0.07256149, -2.832717, 1, 0, 0, 1, 1,
-0.2932789, -1.283912, 0.1320856, 1, 0, 0, 1, 1,
-0.2923973, -0.9059394, -1.227787, 1, 0, 0, 1, 1,
-0.2895615, 0.6373104, -0.5806322, 1, 0, 0, 1, 1,
-0.2891492, 0.2397562, -0.642921, 0, 0, 0, 1, 1,
-0.2891192, -0.07497835, -2.23882, 0, 0, 0, 1, 1,
-0.2885166, -0.07194217, -1.444956, 0, 0, 0, 1, 1,
-0.2865618, -1.075642, -3.238246, 0, 0, 0, 1, 1,
-0.2822023, -2.221243, -4.175842, 0, 0, 0, 1, 1,
-0.2810237, 1.864744, -0.6710373, 0, 0, 0, 1, 1,
-0.2768975, 0.3807377, -0.3614885, 0, 0, 0, 1, 1,
-0.2725722, -0.5240962, -3.052649, 1, 1, 1, 1, 1,
-0.2715349, -0.5869483, -0.6047602, 1, 1, 1, 1, 1,
-0.2704632, 0.5533685, 1.871289, 1, 1, 1, 1, 1,
-0.2689215, 1.020729, 0.1001502, 1, 1, 1, 1, 1,
-0.2655786, 2.176467, -1.213308, 1, 1, 1, 1, 1,
-0.2637933, 0.3589279, 0.5667607, 1, 1, 1, 1, 1,
-0.2619149, -0.05594692, -0.1358277, 1, 1, 1, 1, 1,
-0.2608739, -0.6006283, -2.262068, 1, 1, 1, 1, 1,
-0.2589479, 0.6350783, -1.079289, 1, 1, 1, 1, 1,
-0.2576657, -1.289346, -2.279621, 1, 1, 1, 1, 1,
-0.2565929, 0.9838436, 0.1609861, 1, 1, 1, 1, 1,
-0.2498708, -2.030121, -3.626148, 1, 1, 1, 1, 1,
-0.2457957, -0.4499335, -1.723071, 1, 1, 1, 1, 1,
-0.24363, 2.021127, -0.4146855, 1, 1, 1, 1, 1,
-0.2421722, -1.501653, -2.501648, 1, 1, 1, 1, 1,
-0.2402782, 0.9056579, -0.5717485, 0, 0, 1, 1, 1,
-0.2396781, 0.4163673, -0.5494762, 1, 0, 0, 1, 1,
-0.2391706, 1.495133, 0.2772324, 1, 0, 0, 1, 1,
-0.2377251, -0.6416986, -2.813252, 1, 0, 0, 1, 1,
-0.2367496, -0.6975687, -1.636322, 1, 0, 0, 1, 1,
-0.236307, 0.5778907, 1.206329, 1, 0, 0, 1, 1,
-0.2321721, 0.1555966, -1.360578, 0, 0, 0, 1, 1,
-0.2315715, 1.004733, -2.346984, 0, 0, 0, 1, 1,
-0.2273412, 0.0745261, 0.322809, 0, 0, 0, 1, 1,
-0.2258046, 1.916312, -0.8775128, 0, 0, 0, 1, 1,
-0.2232291, -0.1983853, -3.055096, 0, 0, 0, 1, 1,
-0.2220871, 0.1487796, -1.112638, 0, 0, 0, 1, 1,
-0.21416, -0.5298913, -2.028289, 0, 0, 0, 1, 1,
-0.2122809, 1.285016, 1.252211, 1, 1, 1, 1, 1,
-0.2056732, -0.1649286, -2.010383, 1, 1, 1, 1, 1,
-0.2004916, -0.8293881, -3.262427, 1, 1, 1, 1, 1,
-0.1997073, -0.3709361, -4.827318, 1, 1, 1, 1, 1,
-0.1888098, -1.340263, -2.370884, 1, 1, 1, 1, 1,
-0.1882335, 0.05255766, -1.704751, 1, 1, 1, 1, 1,
-0.1863371, 0.6047541, -0.5162155, 1, 1, 1, 1, 1,
-0.1812791, 0.8959067, -3.237575, 1, 1, 1, 1, 1,
-0.1802659, -0.5149139, -3.714749, 1, 1, 1, 1, 1,
-0.1772569, -0.1403597, -2.496994, 1, 1, 1, 1, 1,
-0.1755608, -1.725221, -2.361193, 1, 1, 1, 1, 1,
-0.1741047, -1.514022, -2.905152, 1, 1, 1, 1, 1,
-0.1511213, -1.0264, -4.058915, 1, 1, 1, 1, 1,
-0.1510349, 0.5289347, -0.4966464, 1, 1, 1, 1, 1,
-0.1477758, -0.03204459, 1.603766, 1, 1, 1, 1, 1,
-0.1476981, 0.7011882, -0.3365759, 0, 0, 1, 1, 1,
-0.1404044, -1.580914, -0.6241273, 1, 0, 0, 1, 1,
-0.140171, 0.5708313, 0.3862695, 1, 0, 0, 1, 1,
-0.1373242, -1.363451, -1.79365, 1, 0, 0, 1, 1,
-0.1364734, 0.652146, -2.356826, 1, 0, 0, 1, 1,
-0.1362903, -1.5614, -2.841593, 1, 0, 0, 1, 1,
-0.1328683, -0.07217274, -1.733647, 0, 0, 0, 1, 1,
-0.1320102, -1.030651, -2.969673, 0, 0, 0, 1, 1,
-0.1264893, 0.6068462, 0.7829951, 0, 0, 0, 1, 1,
-0.1211458, -0.1564155, 0.4071591, 0, 0, 0, 1, 1,
-0.1197127, 1.005502, 0.06550831, 0, 0, 0, 1, 1,
-0.1164697, 0.7314154, -0.03251905, 0, 0, 0, 1, 1,
-0.1163899, 0.6676887, 2.04136, 0, 0, 0, 1, 1,
-0.1143149, -1.733967, -3.332614, 1, 1, 1, 1, 1,
-0.1099163, -1.19978, -3.109104, 1, 1, 1, 1, 1,
-0.1064089, 1.078317, -1.157681, 1, 1, 1, 1, 1,
-0.1063772, -0.07151603, -2.388319, 1, 1, 1, 1, 1,
-0.1054833, -1.819655, -4.871774, 1, 1, 1, 1, 1,
-0.1054706, 0.5947593, 1.099206, 1, 1, 1, 1, 1,
-0.1036861, -0.5342222, -3.336175, 1, 1, 1, 1, 1,
-0.1022004, 0.8530094, -0.7031668, 1, 1, 1, 1, 1,
-0.09995373, -0.8576684, -2.433772, 1, 1, 1, 1, 1,
-0.0997135, -0.1335394, -3.428775, 1, 1, 1, 1, 1,
-0.09967601, -1.0868, -1.999564, 1, 1, 1, 1, 1,
-0.09923973, -0.1774326, -0.3643347, 1, 1, 1, 1, 1,
-0.0973457, -1.288233, -2.653817, 1, 1, 1, 1, 1,
-0.08647545, 0.7774601, 1.879562, 1, 1, 1, 1, 1,
-0.08571254, 0.08809271, -3.11109, 1, 1, 1, 1, 1,
-0.08527877, -0.1985751, -4.341578, 0, 0, 1, 1, 1,
-0.08509304, -0.2592977, -4.625241, 1, 0, 0, 1, 1,
-0.07821678, 2.067745, 0.2376425, 1, 0, 0, 1, 1,
-0.07807404, 1.339101, 0.890712, 1, 0, 0, 1, 1,
-0.07743213, 0.1178776, 0.3022072, 1, 0, 0, 1, 1,
-0.07729907, -0.4427839, -2.453346, 1, 0, 0, 1, 1,
-0.0743266, -0.1763431, -1.501, 0, 0, 0, 1, 1,
-0.06669272, 0.8021422, -1.154981, 0, 0, 0, 1, 1,
-0.06405795, 0.8376725, -0.07229822, 0, 0, 0, 1, 1,
-0.06135995, 0.06415391, -1.341276, 0, 0, 0, 1, 1,
-0.06081209, -0.2264273, -1.554731, 0, 0, 0, 1, 1,
-0.0599527, 1.058906, -1.049585, 0, 0, 0, 1, 1,
-0.05922423, -0.6831291, -4.744395, 0, 0, 0, 1, 1,
-0.05810144, 0.7843783, -0.348469, 1, 1, 1, 1, 1,
-0.05512306, -1.521476, -4.268391, 1, 1, 1, 1, 1,
-0.0547854, -1.157408, -4.493202, 1, 1, 1, 1, 1,
-0.05441848, 0.4022611, -0.877525, 1, 1, 1, 1, 1,
-0.05416266, 0.4610579, -0.09887697, 1, 1, 1, 1, 1,
-0.05108375, -0.3943915, -2.019265, 1, 1, 1, 1, 1,
-0.04052135, -1.029742, -2.732747, 1, 1, 1, 1, 1,
-0.0381452, -0.1269072, -3.309875, 1, 1, 1, 1, 1,
-0.03497288, -0.209617, -2.912645, 1, 1, 1, 1, 1,
-0.03320567, -0.1963558, -1.210739, 1, 1, 1, 1, 1,
-0.02990178, -1.430021, -2.248068, 1, 1, 1, 1, 1,
-0.02873693, 0.7432161, -0.09373403, 1, 1, 1, 1, 1,
-0.02447325, -0.4937927, -1.953141, 1, 1, 1, 1, 1,
-0.02396679, -1.058115, -4.662971, 1, 1, 1, 1, 1,
-0.01906291, -0.2109673, -4.249134, 1, 1, 1, 1, 1,
-0.01757426, 2.249405, -1.684419, 0, 0, 1, 1, 1,
-0.0109264, 0.06995658, 1.852378, 1, 0, 0, 1, 1,
-0.0103212, 2.827784, 0.5884074, 1, 0, 0, 1, 1,
-0.0100893, -1.077614, -3.380948, 1, 0, 0, 1, 1,
-0.008462778, 1.019414, 0.6180279, 1, 0, 0, 1, 1,
-0.001379823, -0.08721353, -4.745045, 1, 0, 0, 1, 1,
0.002986834, -1.143056, 4.431703, 0, 0, 0, 1, 1,
0.00366246, -0.7182943, 4.293164, 0, 0, 0, 1, 1,
0.004385338, -1.631268, 3.424787, 0, 0, 0, 1, 1,
0.004565822, 0.3692359, -1.061754, 0, 0, 0, 1, 1,
0.01038862, -0.690681, 2.344401, 0, 0, 0, 1, 1,
0.01044248, -0.3419721, 2.775709, 0, 0, 0, 1, 1,
0.01152327, -0.4379317, 5.150626, 0, 0, 0, 1, 1,
0.01222426, -1.800575, 4.016608, 1, 1, 1, 1, 1,
0.01684983, -0.7950746, 3.786858, 1, 1, 1, 1, 1,
0.01820151, 0.1335485, 2.438619, 1, 1, 1, 1, 1,
0.0199007, 1.289294, 0.5720434, 1, 1, 1, 1, 1,
0.02210706, -0.2183035, 3.289898, 1, 1, 1, 1, 1,
0.02308961, -1.431304, 4.446487, 1, 1, 1, 1, 1,
0.02884569, -1.641064, 0.7837275, 1, 1, 1, 1, 1,
0.03007812, -1.07911, 3.795142, 1, 1, 1, 1, 1,
0.03370703, 0.15957, -0.4345584, 1, 1, 1, 1, 1,
0.03421778, 0.4369516, 0.04791939, 1, 1, 1, 1, 1,
0.03579547, -0.3210673, 4.183785, 1, 1, 1, 1, 1,
0.03739956, -0.6423271, 4.265165, 1, 1, 1, 1, 1,
0.04386033, 0.6206208, 0.1497261, 1, 1, 1, 1, 1,
0.04505373, 0.1874628, -0.1999214, 1, 1, 1, 1, 1,
0.04635028, 1.238014, -0.672257, 1, 1, 1, 1, 1,
0.0504066, 0.3868832, 1.131036, 0, 0, 1, 1, 1,
0.05285386, -0.2065722, 2.948887, 1, 0, 0, 1, 1,
0.05509935, 0.6393496, -0.2120783, 1, 0, 0, 1, 1,
0.0563431, 0.3067418, 0.118957, 1, 0, 0, 1, 1,
0.05703893, -0.1541242, 1.993737, 1, 0, 0, 1, 1,
0.05842497, 1.385746, 0.8260897, 1, 0, 0, 1, 1,
0.05878159, 0.4067133, -0.4252712, 0, 0, 0, 1, 1,
0.06058723, 2.06206, 0.6618885, 0, 0, 0, 1, 1,
0.06635631, 0.08125381, 2.591974, 0, 0, 0, 1, 1,
0.06658784, -0.3111409, 3.698764, 0, 0, 0, 1, 1,
0.06672279, 0.6218047, -0.5368335, 0, 0, 0, 1, 1,
0.06721675, 0.1177829, 1.788118, 0, 0, 0, 1, 1,
0.06771895, 0.9664763, 0.748626, 0, 0, 0, 1, 1,
0.06934688, 0.0544175, -0.831834, 1, 1, 1, 1, 1,
0.06964064, -2.046331, 2.444224, 1, 1, 1, 1, 1,
0.06976496, -1.802499, 3.332286, 1, 1, 1, 1, 1,
0.07093342, -0.4342828, 4.566995, 1, 1, 1, 1, 1,
0.07179326, -0.7272903, 2.354741, 1, 1, 1, 1, 1,
0.0721155, 0.6557412, 0.7797664, 1, 1, 1, 1, 1,
0.07253374, 0.04528366, 1.066674, 1, 1, 1, 1, 1,
0.07891606, -1.943211, 4.605361, 1, 1, 1, 1, 1,
0.08297437, 0.6315026, 0.4250131, 1, 1, 1, 1, 1,
0.08870316, 0.06712894, 1.109274, 1, 1, 1, 1, 1,
0.09431182, -2.161323, 0.7001386, 1, 1, 1, 1, 1,
0.0943776, 0.9250768, 0.6911346, 1, 1, 1, 1, 1,
0.09637533, 1.171928, -0.1183042, 1, 1, 1, 1, 1,
0.09774958, -0.3356677, 4.346121, 1, 1, 1, 1, 1,
0.09910244, 0.789207, -0.6069193, 1, 1, 1, 1, 1,
0.1008224, -1.941074, 2.438874, 0, 0, 1, 1, 1,
0.102767, -0.9890069, 2.947255, 1, 0, 0, 1, 1,
0.1037489, -1.276782, 3.827869, 1, 0, 0, 1, 1,
0.1056873, 0.3467341, 0.9358463, 1, 0, 0, 1, 1,
0.1067082, 0.8690153, 0.7960529, 1, 0, 0, 1, 1,
0.110262, -1.720809, 1.351413, 1, 0, 0, 1, 1,
0.1116254, 1.486103, -0.7962446, 0, 0, 0, 1, 1,
0.1120012, 1.334336, -0.8410649, 0, 0, 0, 1, 1,
0.1191758, -0.6268793, 3.196915, 0, 0, 0, 1, 1,
0.1217361, -1.360186, 3.365847, 0, 0, 0, 1, 1,
0.1221928, 0.7539722, 1.454428, 0, 0, 0, 1, 1,
0.12568, -1.996076, 2.811297, 0, 0, 0, 1, 1,
0.1334826, 0.2379515, -0.7662699, 0, 0, 0, 1, 1,
0.1419966, 0.5015513, 1.626121, 1, 1, 1, 1, 1,
0.1505587, -0.9670829, 2.99234, 1, 1, 1, 1, 1,
0.1584733, 1.033868, -1.634665, 1, 1, 1, 1, 1,
0.1631942, -0.8320609, 4.997904, 1, 1, 1, 1, 1,
0.1645291, 0.5745484, 2.142981, 1, 1, 1, 1, 1,
0.1646585, -0.9990479, 4.607484, 1, 1, 1, 1, 1,
0.1649204, 0.4419, -1.697947, 1, 1, 1, 1, 1,
0.1685197, 1.620543, 0.9911769, 1, 1, 1, 1, 1,
0.1694039, 0.151182, 0.7804269, 1, 1, 1, 1, 1,
0.1759709, 0.3685538, 1.310992, 1, 1, 1, 1, 1,
0.1778627, 0.9130758, -0.4239671, 1, 1, 1, 1, 1,
0.1787387, -0.1078218, 1.66516, 1, 1, 1, 1, 1,
0.1820376, 0.5150337, 0.8888723, 1, 1, 1, 1, 1,
0.1866222, -0.6987073, 4.145802, 1, 1, 1, 1, 1,
0.187519, -2.334043, 3.54821, 1, 1, 1, 1, 1,
0.1897302, -0.5963641, 2.589129, 0, 0, 1, 1, 1,
0.1906329, 1.055476, -1.317538, 1, 0, 0, 1, 1,
0.191635, 1.141144, -1.030018, 1, 0, 0, 1, 1,
0.1945641, 0.4439462, 1.438206, 1, 0, 0, 1, 1,
0.1962125, -0.6762127, 3.64633, 1, 0, 0, 1, 1,
0.2012827, -0.3929237, 3.119066, 1, 0, 0, 1, 1,
0.2023894, -0.9563321, 4.846755, 0, 0, 0, 1, 1,
0.2027247, -0.02913952, 0.7220629, 0, 0, 0, 1, 1,
0.2039023, 0.4106939, 1.48635, 0, 0, 0, 1, 1,
0.205124, -1.378346, 3.768599, 0, 0, 0, 1, 1,
0.2076465, 1.787063, -1.509392, 0, 0, 0, 1, 1,
0.2079849, 0.5678133, 0.4825062, 0, 0, 0, 1, 1,
0.2121248, 0.1085753, 1.357025, 0, 0, 0, 1, 1,
0.2121924, 0.3812945, -0.8455509, 1, 1, 1, 1, 1,
0.217865, 2.002862, 1.414851, 1, 1, 1, 1, 1,
0.2193839, -0.009534377, 1.350105, 1, 1, 1, 1, 1,
0.2199336, -0.5065157, 3.999556, 1, 1, 1, 1, 1,
0.2214863, 0.8780277, 0.2722298, 1, 1, 1, 1, 1,
0.2330742, 0.02158033, 2.381537, 1, 1, 1, 1, 1,
0.2350548, 0.6971756, -0.1661141, 1, 1, 1, 1, 1,
0.2385805, -0.007361129, 3.69386, 1, 1, 1, 1, 1,
0.2443829, -0.752228, 1.924975, 1, 1, 1, 1, 1,
0.2537903, -1.347994, 4.494821, 1, 1, 1, 1, 1,
0.2557463, 0.04464343, 1.969837, 1, 1, 1, 1, 1,
0.2562031, -1.059489, 4.464677, 1, 1, 1, 1, 1,
0.2566244, 0.5855603, -1.193027, 1, 1, 1, 1, 1,
0.2658193, 1.784611, -0.566121, 1, 1, 1, 1, 1,
0.2711826, 0.07321414, 1.934065, 1, 1, 1, 1, 1,
0.2714558, 0.09508298, 0.4741263, 0, 0, 1, 1, 1,
0.2714634, 0.2204586, 1.323296, 1, 0, 0, 1, 1,
0.2723876, 0.2459271, 0.8140334, 1, 0, 0, 1, 1,
0.2741974, 0.09327625, 0.8498457, 1, 0, 0, 1, 1,
0.2806664, 0.987789, 0.6871388, 1, 0, 0, 1, 1,
0.2807652, -0.1107561, 1.116837, 1, 0, 0, 1, 1,
0.2832266, 0.7921509, 1.087585, 0, 0, 0, 1, 1,
0.2874131, -0.2948969, 1.127307, 0, 0, 0, 1, 1,
0.29051, -0.7592666, 1.572928, 0, 0, 0, 1, 1,
0.2940266, 1.122091, 1.461713, 0, 0, 0, 1, 1,
0.2940446, -0.02542379, 1.94828, 0, 0, 0, 1, 1,
0.296312, -0.6716888, 1.280289, 0, 0, 0, 1, 1,
0.2968386, 2.027301, 0.02240204, 0, 0, 0, 1, 1,
0.2971134, 1.318272, 0.5703555, 1, 1, 1, 1, 1,
0.3020811, -0.1275231, 2.074639, 1, 1, 1, 1, 1,
0.3033661, 1.637515, 1.335381, 1, 1, 1, 1, 1,
0.306853, 0.5887325, -0.3836518, 1, 1, 1, 1, 1,
0.3089853, 0.4379047, -0.9547929, 1, 1, 1, 1, 1,
0.3095475, -0.7463412, 1.717496, 1, 1, 1, 1, 1,
0.3096728, 2.538818, -2.135253, 1, 1, 1, 1, 1,
0.311192, 1.253553, 1.103362, 1, 1, 1, 1, 1,
0.3119591, -0.1296584, 2.883318, 1, 1, 1, 1, 1,
0.3148693, -0.9014424, 1.962688, 1, 1, 1, 1, 1,
0.3149975, 0.2825486, 2.23987, 1, 1, 1, 1, 1,
0.3180704, 1.090931, -1.346575, 1, 1, 1, 1, 1,
0.3234849, 0.649377, 1.053496, 1, 1, 1, 1, 1,
0.3245801, 1.432805, -0.2544107, 1, 1, 1, 1, 1,
0.3254511, -0.08638708, 3.144762, 1, 1, 1, 1, 1,
0.3261932, -0.9099934, 3.322265, 0, 0, 1, 1, 1,
0.330901, -0.7577951, 1.60357, 1, 0, 0, 1, 1,
0.3316735, -2.619387, 2.457835, 1, 0, 0, 1, 1,
0.3330388, -0.01036224, 1.034117, 1, 0, 0, 1, 1,
0.3353917, -0.03794888, 2.080363, 1, 0, 0, 1, 1,
0.3384695, 1.642545, 0.2122186, 1, 0, 0, 1, 1,
0.3400565, -1.188574, 2.199226, 0, 0, 0, 1, 1,
0.3430676, 0.9595523, 1.129762, 0, 0, 0, 1, 1,
0.3467619, -0.9712989, 4.358116, 0, 0, 0, 1, 1,
0.3498859, 0.6612466, 1.045415, 0, 0, 0, 1, 1,
0.3547064, -1.649526, 1.678193, 0, 0, 0, 1, 1,
0.357163, -1.126337, 2.259232, 0, 0, 0, 1, 1,
0.3576514, -0.9283741, 2.163753, 0, 0, 0, 1, 1,
0.3579865, -0.3777427, 2.274346, 1, 1, 1, 1, 1,
0.3616465, 0.4131686, 1.461244, 1, 1, 1, 1, 1,
0.3666161, -1.459995, 3.280641, 1, 1, 1, 1, 1,
0.368198, 0.1383021, 2.260711, 1, 1, 1, 1, 1,
0.3694817, 2.598983, 0.9114208, 1, 1, 1, 1, 1,
0.3701268, -0.08453982, 1.801298, 1, 1, 1, 1, 1,
0.3792116, -1.133797, 3.166651, 1, 1, 1, 1, 1,
0.3896494, -0.4557222, 0.8995646, 1, 1, 1, 1, 1,
0.3898089, -0.8630242, 3.89993, 1, 1, 1, 1, 1,
0.3969828, -1.044919, 1.496903, 1, 1, 1, 1, 1,
0.3984194, 0.3989635, 0.06828468, 1, 1, 1, 1, 1,
0.4023321, 0.866996, -1.702675, 1, 1, 1, 1, 1,
0.4061612, 0.4602752, 1.549605, 1, 1, 1, 1, 1,
0.4123421, 0.770214, 0.3739438, 1, 1, 1, 1, 1,
0.4166002, -1.229868, 3.703994, 1, 1, 1, 1, 1,
0.4167294, -0.6854891, 2.313039, 0, 0, 1, 1, 1,
0.4208628, 0.05264457, 2.766499, 1, 0, 0, 1, 1,
0.4263331, 0.4715473, 1.446079, 1, 0, 0, 1, 1,
0.4277013, 0.03531753, 1.479389, 1, 0, 0, 1, 1,
0.4285532, 0.8521792, 0.6434807, 1, 0, 0, 1, 1,
0.4308531, -0.7491453, 3.193978, 1, 0, 0, 1, 1,
0.4358508, 1.42596, 0.3093214, 0, 0, 0, 1, 1,
0.4367208, 0.0578745, 1.56893, 0, 0, 0, 1, 1,
0.4371121, -0.5037044, 2.406358, 0, 0, 0, 1, 1,
0.4397201, -0.7035795, 2.27352, 0, 0, 0, 1, 1,
0.4459932, -0.0008166544, 1.515132, 0, 0, 0, 1, 1,
0.4475004, 0.2912174, 1.066341, 0, 0, 0, 1, 1,
0.447517, -0.6677323, 1.826628, 0, 0, 0, 1, 1,
0.4481993, -1.145205, 2.132399, 1, 1, 1, 1, 1,
0.4492099, -2.700326, 3.53901, 1, 1, 1, 1, 1,
0.4505878, -1.460154, 2.757921, 1, 1, 1, 1, 1,
0.4542841, 0.6239684, 2.219166, 1, 1, 1, 1, 1,
0.454462, 0.9579788, 0.8885093, 1, 1, 1, 1, 1,
0.4555648, 0.779011, 0.2099935, 1, 1, 1, 1, 1,
0.4584892, -1.429789, 2.926911, 1, 1, 1, 1, 1,
0.4621473, 1.653131, 2.673568, 1, 1, 1, 1, 1,
0.4624146, 0.2649121, -0.05821303, 1, 1, 1, 1, 1,
0.4642743, 0.8072266, 1.150919, 1, 1, 1, 1, 1,
0.4741799, -0.1001843, 3.399943, 1, 1, 1, 1, 1,
0.4780243, -0.2466431, 0.1765647, 1, 1, 1, 1, 1,
0.4879633, 0.7754059, -0.4108408, 1, 1, 1, 1, 1,
0.4945982, -1.056437, 1.146133, 1, 1, 1, 1, 1,
0.4973944, -0.828113, 2.677234, 1, 1, 1, 1, 1,
0.4982111, -1.470698, 1.364575, 0, 0, 1, 1, 1,
0.5108044, -2.590042, 3.904964, 1, 0, 0, 1, 1,
0.5124017, 0.6162729, 2.414665, 1, 0, 0, 1, 1,
0.51487, 0.7008384, -1.246926, 1, 0, 0, 1, 1,
0.5180249, 1.191327, 1.14391, 1, 0, 0, 1, 1,
0.522245, -0.01567343, 2.091754, 1, 0, 0, 1, 1,
0.5241618, 0.3607068, 2.361719, 0, 0, 0, 1, 1,
0.5248836, -0.322634, 0.3765064, 0, 0, 0, 1, 1,
0.5284058, 0.6176953, 0.6928709, 0, 0, 0, 1, 1,
0.5316849, -1.857934, 0.6969689, 0, 0, 0, 1, 1,
0.5390512, 1.075205, 1.377736, 0, 0, 0, 1, 1,
0.542168, -0.8283705, 1.952244, 0, 0, 0, 1, 1,
0.5627081, 0.02732407, 2.786089, 0, 0, 0, 1, 1,
0.5628539, -0.2297304, 2.208457, 1, 1, 1, 1, 1,
0.563695, -1.113494, 3.687018, 1, 1, 1, 1, 1,
0.5665789, -1.286026, 3.242137, 1, 1, 1, 1, 1,
0.5666621, -0.3923421, 3.93469, 1, 1, 1, 1, 1,
0.5684527, -0.5883568, 4.572529, 1, 1, 1, 1, 1,
0.5700043, -0.5190572, 0.9885902, 1, 1, 1, 1, 1,
0.5710824, 1.856097, 0.5220338, 1, 1, 1, 1, 1,
0.5780675, -1.432884, 2.443396, 1, 1, 1, 1, 1,
0.583438, 0.6134574, -0.201875, 1, 1, 1, 1, 1,
0.5850805, -0.4395328, 2.902423, 1, 1, 1, 1, 1,
0.5856071, -0.9364319, 0.7235187, 1, 1, 1, 1, 1,
0.5866066, 0.04185263, 2.025945, 1, 1, 1, 1, 1,
0.5871468, -0.9978533, 4.260971, 1, 1, 1, 1, 1,
0.5880613, -0.04737178, 0.8435655, 1, 1, 1, 1, 1,
0.5909792, -1.179144, 4.867303, 1, 1, 1, 1, 1,
0.5920219, -0.9890606, 1.686301, 0, 0, 1, 1, 1,
0.5923798, -1.824555, 2.960305, 1, 0, 0, 1, 1,
0.5942468, 0.1836059, 0.2649566, 1, 0, 0, 1, 1,
0.5961834, 0.09158452, 1.426332, 1, 0, 0, 1, 1,
0.5992256, -1.208598, 2.03646, 1, 0, 0, 1, 1,
0.605048, 0.6000836, -0.4175503, 1, 0, 0, 1, 1,
0.606457, -1.35895, 1.906668, 0, 0, 0, 1, 1,
0.6072679, 0.516623, 2.429075, 0, 0, 0, 1, 1,
0.613124, -0.4696669, 1.480683, 0, 0, 0, 1, 1,
0.6205833, 2.47002, 0.5249285, 0, 0, 0, 1, 1,
0.62153, 1.195699, -0.06783745, 0, 0, 0, 1, 1,
0.6255344, 0.6576685, 0.4508692, 0, 0, 0, 1, 1,
0.6295558, 0.9348527, 1.196613, 0, 0, 0, 1, 1,
0.6324705, -0.624128, 1.719025, 1, 1, 1, 1, 1,
0.6327912, -0.4540729, 1.368545, 1, 1, 1, 1, 1,
0.6343395, 0.2468872, 1.975923, 1, 1, 1, 1, 1,
0.6367049, 1.622284, 1.502079, 1, 1, 1, 1, 1,
0.6382161, 0.8910351, -0.3385548, 1, 1, 1, 1, 1,
0.6482568, -1.369771, 4.229568, 1, 1, 1, 1, 1,
0.650254, 0.2908807, 1.873111, 1, 1, 1, 1, 1,
0.6512063, 0.655424, 1.737035, 1, 1, 1, 1, 1,
0.651996, -0.6395923, 1.499553, 1, 1, 1, 1, 1,
0.6547214, 0.8890671, 0.1338171, 1, 1, 1, 1, 1,
0.6584363, 0.8126941, 0.2396393, 1, 1, 1, 1, 1,
0.6612297, 0.248274, 0.1533077, 1, 1, 1, 1, 1,
0.6618122, 1.102969, 0.2258426, 1, 1, 1, 1, 1,
0.6641241, 0.608955, 1.05238, 1, 1, 1, 1, 1,
0.6671637, -0.1204122, 1.018514, 1, 1, 1, 1, 1,
0.6673657, -0.0445028, 0.5912589, 0, 0, 1, 1, 1,
0.6688972, -0.2226645, 3.022783, 1, 0, 0, 1, 1,
0.6711213, -1.471404, 2.542953, 1, 0, 0, 1, 1,
0.6769638, 0.2036585, 1.099745, 1, 0, 0, 1, 1,
0.6780205, 0.2578573, 0.9089164, 1, 0, 0, 1, 1,
0.6786672, 1.817213, 0.8075868, 1, 0, 0, 1, 1,
0.6822816, -0.267665, 1.440039, 0, 0, 0, 1, 1,
0.6883349, -0.0004459549, 1.282245, 0, 0, 0, 1, 1,
0.6936275, 1.540897, -0.4992743, 0, 0, 0, 1, 1,
0.6941422, -1.644481, 3.301037, 0, 0, 0, 1, 1,
0.6989122, 0.9752647, 0.9622234, 0, 0, 0, 1, 1,
0.7104026, 1.147548, 0.3449815, 0, 0, 0, 1, 1,
0.7136244, -0.03565632, 2.886041, 0, 0, 0, 1, 1,
0.7145544, 0.8483003, -0.8952851, 1, 1, 1, 1, 1,
0.7275043, -0.1137243, 2.061127, 1, 1, 1, 1, 1,
0.7351343, 0.5487607, -0.01294332, 1, 1, 1, 1, 1,
0.7366614, -0.6284653, 1.831312, 1, 1, 1, 1, 1,
0.7393591, -1.414644, 3.153521, 1, 1, 1, 1, 1,
0.7446856, 0.7202311, 1.427905, 1, 1, 1, 1, 1,
0.7455916, 0.09069663, 1.965397, 1, 1, 1, 1, 1,
0.7472334, 0.528314, 1.249097, 1, 1, 1, 1, 1,
0.7548356, -0.1880987, 3.384466, 1, 1, 1, 1, 1,
0.7577871, -1.758196, 2.248376, 1, 1, 1, 1, 1,
0.763935, -0.6959951, 2.252944, 1, 1, 1, 1, 1,
0.7716027, -0.2360909, 3.528895, 1, 1, 1, 1, 1,
0.7720158, -1.86325, 1.857543, 1, 1, 1, 1, 1,
0.7738462, -0.9784029, 3.175073, 1, 1, 1, 1, 1,
0.7806188, -2.311909, 0.6184117, 1, 1, 1, 1, 1,
0.7835246, -1.211483, 4.328641, 0, 0, 1, 1, 1,
0.7868024, -0.3741891, 1.394035, 1, 0, 0, 1, 1,
0.787384, 0.0808284, 2.248414, 1, 0, 0, 1, 1,
0.7936763, -0.9049107, 1.29435, 1, 0, 0, 1, 1,
0.7995569, 1.979687, -0.2814078, 1, 0, 0, 1, 1,
0.8003528, 1.143858, -0.2590696, 1, 0, 0, 1, 1,
0.8007125, 0.1907981, -0.08045538, 0, 0, 0, 1, 1,
0.8119734, -0.8948426, 1.515311, 0, 0, 0, 1, 1,
0.8131557, 0.1974489, 2.124056, 0, 0, 0, 1, 1,
0.819617, -0.9326269, 2.967274, 0, 0, 0, 1, 1,
0.821989, -1.335182, 2.99354, 0, 0, 0, 1, 1,
0.8238522, -0.1430913, 0.7496374, 0, 0, 0, 1, 1,
0.824084, 0.4769732, 0.4364335, 0, 0, 0, 1, 1,
0.8248069, -0.1791519, 1.652897, 1, 1, 1, 1, 1,
0.8276532, -0.07774807, 2.551061, 1, 1, 1, 1, 1,
0.8291408, 1.074945, 0.8037236, 1, 1, 1, 1, 1,
0.8307202, 0.953666, 1.629919, 1, 1, 1, 1, 1,
0.8399747, 0.2993018, 0.3625207, 1, 1, 1, 1, 1,
0.8412579, -1.672657, 2.709121, 1, 1, 1, 1, 1,
0.8425055, 2.657604, 1.995816, 1, 1, 1, 1, 1,
0.8525937, 0.05563065, 2.225531, 1, 1, 1, 1, 1,
0.8533806, -0.8009947, 2.755501, 1, 1, 1, 1, 1,
0.8555915, -0.1699581, 3.260101, 1, 1, 1, 1, 1,
0.8562765, -0.5173178, 3.50446, 1, 1, 1, 1, 1,
0.8573391, -2.245356, 4.373622, 1, 1, 1, 1, 1,
0.8608627, -0.7858214, 2.669622, 1, 1, 1, 1, 1,
0.8620921, 0.1102377, 0.8223512, 1, 1, 1, 1, 1,
0.8621503, -1.358302, 1.244332, 1, 1, 1, 1, 1,
0.8655562, -0.6772546, 0.1122965, 0, 0, 1, 1, 1,
0.8716702, -1.140602, 1.65825, 1, 0, 0, 1, 1,
0.8754658, 0.3900989, 2.316584, 1, 0, 0, 1, 1,
0.8767677, 1.034512, -0.0432943, 1, 0, 0, 1, 1,
0.8774297, 0.5546596, 1.831363, 1, 0, 0, 1, 1,
0.8781282, 0.6351104, 0.2447125, 1, 0, 0, 1, 1,
0.8794686, -1.207276, 1.365519, 0, 0, 0, 1, 1,
0.8807652, 0.7341256, 0.1877603, 0, 0, 0, 1, 1,
0.8857937, -1.271154, 1.752414, 0, 0, 0, 1, 1,
0.8927873, -2.519874, 2.430839, 0, 0, 0, 1, 1,
0.8949393, -1.27144, 3.411041, 0, 0, 0, 1, 1,
0.8996154, 0.1862305, 1.247756, 0, 0, 0, 1, 1,
0.9073118, -1.048127, 1.395061, 0, 0, 0, 1, 1,
0.9124425, -0.989296, 1.33318, 1, 1, 1, 1, 1,
0.9139017, 0.8381287, 0.5455723, 1, 1, 1, 1, 1,
0.9169325, -0.2580297, 2.075375, 1, 1, 1, 1, 1,
0.9229912, -1.5763, 2.717666, 1, 1, 1, 1, 1,
0.9232115, 0.4698323, 2.460544, 1, 1, 1, 1, 1,
0.9258949, 1.385625, 0.8268726, 1, 1, 1, 1, 1,
0.9267719, 2.620341, -0.2100087, 1, 1, 1, 1, 1,
0.9292017, -1.081766, 2.73871, 1, 1, 1, 1, 1,
0.9373859, -0.07765044, -0.103207, 1, 1, 1, 1, 1,
0.9723821, 0.6575355, -1.080275, 1, 1, 1, 1, 1,
0.974718, -1.130004, 2.134046, 1, 1, 1, 1, 1,
0.9753875, 0.786994, 0.4811707, 1, 1, 1, 1, 1,
0.9812642, 0.9418492, 1.418564, 1, 1, 1, 1, 1,
0.9826451, -0.1230426, 1.711154, 1, 1, 1, 1, 1,
0.9903091, 0.9826685, 0.04553549, 1, 1, 1, 1, 1,
0.9939565, 2.230095, -1.752016, 0, 0, 1, 1, 1,
0.9961296, 1.400598, 1.409199, 1, 0, 0, 1, 1,
1.003886, -0.2203617, 0.8785855, 1, 0, 0, 1, 1,
1.004861, 0.7168553, -0.5716265, 1, 0, 0, 1, 1,
1.005561, -1.7143, 3.824082, 1, 0, 0, 1, 1,
1.022227, -0.08905745, 2.828497, 1, 0, 0, 1, 1,
1.022227, -1.897286, 3.501979, 0, 0, 0, 1, 1,
1.02613, 1.86518, 0.6925012, 0, 0, 0, 1, 1,
1.032216, -0.6464061, 2.452006, 0, 0, 0, 1, 1,
1.034575, 2.200367, -0.09386156, 0, 0, 0, 1, 1,
1.039574, -1.939038, 3.029623, 0, 0, 0, 1, 1,
1.044767, -1.358648, 3.619639, 0, 0, 0, 1, 1,
1.04552, 0.6357884, 0.4516484, 0, 0, 0, 1, 1,
1.049791, 0.9956369, 3.026111, 1, 1, 1, 1, 1,
1.050481, 1.422289, 1.556604, 1, 1, 1, 1, 1,
1.056067, 0.6931879, 2.144876, 1, 1, 1, 1, 1,
1.072588, -1.005218, 0.4179271, 1, 1, 1, 1, 1,
1.0748, 0.6793479, 0.8790472, 1, 1, 1, 1, 1,
1.075353, -0.7781958, 2.865459, 1, 1, 1, 1, 1,
1.080842, 1.098427, 0.04745015, 1, 1, 1, 1, 1,
1.088336, 0.1961247, 1.988748, 1, 1, 1, 1, 1,
1.091682, -1.319793, 0.9683862, 1, 1, 1, 1, 1,
1.094618, 0.4679355, 2.481626, 1, 1, 1, 1, 1,
1.095212, -1.021706, 2.767167, 1, 1, 1, 1, 1,
1.111945, 2.161976, 0.7192619, 1, 1, 1, 1, 1,
1.132839, -0.6574101, 3.016423, 1, 1, 1, 1, 1,
1.13831, -0.3640225, 0.2273508, 1, 1, 1, 1, 1,
1.139311, -0.08562203, 1.625184, 1, 1, 1, 1, 1,
1.13966, -0.5266775, 1.562151, 0, 0, 1, 1, 1,
1.142779, 0.4347694, -0.328325, 1, 0, 0, 1, 1,
1.143839, 0.4962673, -0.07206674, 1, 0, 0, 1, 1,
1.149378, -1.775779, 3.525627, 1, 0, 0, 1, 1,
1.151533, -0.9201385, 1.787614, 1, 0, 0, 1, 1,
1.152233, 0.5905534, 0.1531645, 1, 0, 0, 1, 1,
1.153773, -0.3121771, 0.658002, 0, 0, 0, 1, 1,
1.155033, 2.455926, -0.4298303, 0, 0, 0, 1, 1,
1.16282, -0.5067282, 1.693146, 0, 0, 0, 1, 1,
1.165655, -0.1738045, 2.550284, 0, 0, 0, 1, 1,
1.166856, -1.260482, 2.905842, 0, 0, 0, 1, 1,
1.171662, 1.018197, 0.8500813, 0, 0, 0, 1, 1,
1.173913, -1.184321, 1.760588, 0, 0, 0, 1, 1,
1.188067, 0.1496914, 2.882984, 1, 1, 1, 1, 1,
1.188096, 0.4116811, 0.9023648, 1, 1, 1, 1, 1,
1.191119, 1.233732, 2.780127, 1, 1, 1, 1, 1,
1.191266, 1.622367, 1.406024, 1, 1, 1, 1, 1,
1.192128, 1.076889, 1.75612, 1, 1, 1, 1, 1,
1.198509, -0.6383421, 2.94327, 1, 1, 1, 1, 1,
1.210994, -0.5471109, 3.378412, 1, 1, 1, 1, 1,
1.217999, 0.2585436, 1.286631, 1, 1, 1, 1, 1,
1.221037, 1.145778, 0.1581897, 1, 1, 1, 1, 1,
1.222323, -0.5014265, 2.641672, 1, 1, 1, 1, 1,
1.225363, -0.2412397, 0.3486636, 1, 1, 1, 1, 1,
1.237822, -1.157127, 2.887839, 1, 1, 1, 1, 1,
1.248336, -0.3477842, 3.793198, 1, 1, 1, 1, 1,
1.249349, 0.3319279, 0.6760622, 1, 1, 1, 1, 1,
1.27734, 0.7838715, 0.04131644, 1, 1, 1, 1, 1,
1.285985, 0.05645066, 0.01691444, 0, 0, 1, 1, 1,
1.290812, 1.035836, 3.930152, 1, 0, 0, 1, 1,
1.309654, 1.118993, -0.7829789, 1, 0, 0, 1, 1,
1.310075, 1.18439, 2.279923, 1, 0, 0, 1, 1,
1.312035, -0.1527841, 0.1767956, 1, 0, 0, 1, 1,
1.318963, -0.5590603, 1.513388, 1, 0, 0, 1, 1,
1.319672, -0.1001627, 2.303533, 0, 0, 0, 1, 1,
1.322934, -0.2344583, 2.127464, 0, 0, 0, 1, 1,
1.330606, -0.488966, 3.565508, 0, 0, 0, 1, 1,
1.33434, 0.4613693, 1.775625, 0, 0, 0, 1, 1,
1.34431, -0.1156228, 0.8304194, 0, 0, 0, 1, 1,
1.344629, -0.1887532, 1.361981, 0, 0, 0, 1, 1,
1.344681, -2.067169, 1.52247, 0, 0, 0, 1, 1,
1.351707, -0.9934782, 1.792191, 1, 1, 1, 1, 1,
1.353674, 0.1216941, 1.850227, 1, 1, 1, 1, 1,
1.354523, 0.6917448, 0.9577351, 1, 1, 1, 1, 1,
1.356534, -0.6484751, 2.731298, 1, 1, 1, 1, 1,
1.36033, 0.3705913, 1.389754, 1, 1, 1, 1, 1,
1.368106, -0.5954951, 1.122996, 1, 1, 1, 1, 1,
1.370987, -0.6262184, 2.254427, 1, 1, 1, 1, 1,
1.379409, 0.9781532, -0.5391124, 1, 1, 1, 1, 1,
1.379627, 0.7420222, 1.776616, 1, 1, 1, 1, 1,
1.381831, 0.7878168, 0.5169266, 1, 1, 1, 1, 1,
1.386108, -1.141399, 1.367528, 1, 1, 1, 1, 1,
1.405752, -1.918432, 3.809233, 1, 1, 1, 1, 1,
1.414567, 2.700039, -0.5806721, 1, 1, 1, 1, 1,
1.416376, 0.2396278, 1.366954, 1, 1, 1, 1, 1,
1.422902, 0.8400765, 2.470354, 1, 1, 1, 1, 1,
1.435729, -0.7400983, 2.489079, 0, 0, 1, 1, 1,
1.454339, -0.9394001, 2.034735, 1, 0, 0, 1, 1,
1.460035, -1.19891, 2.309928, 1, 0, 0, 1, 1,
1.461773, 0.9548722, 1.580962, 1, 0, 0, 1, 1,
1.46802, 0.04639155, 1.080696, 1, 0, 0, 1, 1,
1.474602, 0.1378179, 1.460576, 1, 0, 0, 1, 1,
1.475887, 0.5225233, -0.06046471, 0, 0, 0, 1, 1,
1.48185, 0.8179566, 1.56394, 0, 0, 0, 1, 1,
1.487437, 0.5059151, 0.9864352, 0, 0, 0, 1, 1,
1.498269, -1.134911, 1.539106, 0, 0, 0, 1, 1,
1.502147, 0.05002595, 1.059744, 0, 0, 0, 1, 1,
1.509582, -0.0862359, 3.410068, 0, 0, 0, 1, 1,
1.524003, -0.9387386, 3.739372, 0, 0, 0, 1, 1,
1.538735, 0.8780894, 0.5861787, 1, 1, 1, 1, 1,
1.540797, -1.469653, 0.7391435, 1, 1, 1, 1, 1,
1.547233, 1.413602, -0.4457391, 1, 1, 1, 1, 1,
1.550763, -0.5971601, 0.2928122, 1, 1, 1, 1, 1,
1.554352, -0.1809342, 0.9111231, 1, 1, 1, 1, 1,
1.579979, -0.02973405, 1.129814, 1, 1, 1, 1, 1,
1.59036, -0.7966304, 1.220592, 1, 1, 1, 1, 1,
1.593566, -0.09005999, 1.265987, 1, 1, 1, 1, 1,
1.59567, 0.662474, 1.02011, 1, 1, 1, 1, 1,
1.608214, -0.2107636, 2.217806, 1, 1, 1, 1, 1,
1.621747, -0.1378351, -0.3546247, 1, 1, 1, 1, 1,
1.622671, 2.300606, 0.5619581, 1, 1, 1, 1, 1,
1.626988, -0.8306894, 1.478108, 1, 1, 1, 1, 1,
1.633881, 0.6258562, 0.3950198, 1, 1, 1, 1, 1,
1.653292, -0.555985, 3.706916, 1, 1, 1, 1, 1,
1.660708, -0.4746798, 1.876444, 0, 0, 1, 1, 1,
1.663047, -0.5026446, 1.626719, 1, 0, 0, 1, 1,
1.675852, -0.1151573, 2.138292, 1, 0, 0, 1, 1,
1.67985, 0.4072433, 1.624816, 1, 0, 0, 1, 1,
1.691041, 0.755251, 0.5619565, 1, 0, 0, 1, 1,
1.699201, -1.073287, 1.238353, 1, 0, 0, 1, 1,
1.710366, 0.1757394, 0.1442012, 0, 0, 0, 1, 1,
1.711244, 0.141674, 0.9444667, 0, 0, 0, 1, 1,
1.730312, -0.2880235, 1.117442, 0, 0, 0, 1, 1,
1.748929, 0.6320688, 2.400029, 0, 0, 0, 1, 1,
1.757018, 1.324377, 0.9599422, 0, 0, 0, 1, 1,
1.757025, 1.43871, 0.5383681, 0, 0, 0, 1, 1,
1.777257, 1.307599, 1.903914, 0, 0, 0, 1, 1,
1.810715, -2.254721, 3.561198, 1, 1, 1, 1, 1,
1.835195, -0.1751055, 2.212322, 1, 1, 1, 1, 1,
1.864425, -0.3163028, 2.030444, 1, 1, 1, 1, 1,
1.892763, -0.1549673, 2.158996, 1, 1, 1, 1, 1,
1.898552, 0.5676789, 2.276735, 1, 1, 1, 1, 1,
1.912228, 1.632805, 0.8443026, 1, 1, 1, 1, 1,
1.926886, -0.3048735, 2.385461, 1, 1, 1, 1, 1,
1.927281, 0.3969588, 0.929502, 1, 1, 1, 1, 1,
1.929341, 1.174624, 0.6058767, 1, 1, 1, 1, 1,
1.951732, 0.0001673683, 2.238283, 1, 1, 1, 1, 1,
1.984065, 0.4976856, 2.52964, 1, 1, 1, 1, 1,
1.998917, -0.2811539, 1.156477, 1, 1, 1, 1, 1,
2.010667, -0.7313049, 3.244577, 1, 1, 1, 1, 1,
2.013979, -0.2932201, 3.398986, 1, 1, 1, 1, 1,
2.056319, 1.026714, 1.20464, 1, 1, 1, 1, 1,
2.150094, 0.2133287, 1.260618, 0, 0, 1, 1, 1,
2.188465, 1.817399, 0.4644937, 1, 0, 0, 1, 1,
2.191342, -0.1072699, 3.255465, 1, 0, 0, 1, 1,
2.25988, 1.282273, 1.499481, 1, 0, 0, 1, 1,
2.315925, -1.073438, 1.711887, 1, 0, 0, 1, 1,
2.390975, 1.714766, 0.2321003, 1, 0, 0, 1, 1,
2.405893, -1.198446, 1.0831, 0, 0, 0, 1, 1,
2.554806, -0.6130665, 1.832852, 0, 0, 0, 1, 1,
2.600463, 1.16561, 3.122813, 0, 0, 0, 1, 1,
2.62542, 0.63261, 0.5835314, 0, 0, 0, 1, 1,
2.641829, 0.7874231, 0.149207, 0, 0, 0, 1, 1,
2.725385, -0.6956772, 2.882177, 0, 0, 0, 1, 1,
2.732145, -0.4135451, 1.237069, 0, 0, 0, 1, 1,
2.900175, -0.964708, 1.356571, 1, 1, 1, 1, 1,
2.910433, 0.79892, 1.053809, 1, 1, 1, 1, 1,
2.932283, -1.528792, 2.650467, 1, 1, 1, 1, 1,
2.935882, 2.045159, -0.7446651, 1, 1, 1, 1, 1,
2.946792, 0.9590028, -0.9591401, 1, 1, 1, 1, 1,
3.054741, -1.512967, 1.74677, 1, 1, 1, 1, 1,
3.359014, -2.055639, 2.752799, 1, 1, 1, 1, 1
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
var radius = 9.450362;
var distance = 33.194;
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
mvMatrix.translate( 0.1476092, -0.04455996, 0.1093206 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.194);
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
