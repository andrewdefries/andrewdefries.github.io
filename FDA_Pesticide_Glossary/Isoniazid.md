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
-3.095772, 1.231412, -0.4089167, 1, 0, 0, 1,
-2.578627, -0.6609679, -1.006312, 1, 0.007843138, 0, 1,
-2.539494, -0.8167246, -0.5942241, 1, 0.01176471, 0, 1,
-2.494958, -0.1899916, -2.490865, 1, 0.01960784, 0, 1,
-2.473406, -1.692671, -1.051532, 1, 0.02352941, 0, 1,
-2.395377, 0.04323879, -0.4651198, 1, 0.03137255, 0, 1,
-2.38095, -0.6900651, -1.824442, 1, 0.03529412, 0, 1,
-2.369521, -1.041869, -3.472794, 1, 0.04313726, 0, 1,
-2.303833, -0.3557916, -1.730341, 1, 0.04705882, 0, 1,
-2.233275, 1.364952, -1.030416, 1, 0.05490196, 0, 1,
-2.215059, -0.432212, -2.009272, 1, 0.05882353, 0, 1,
-2.190034, -0.1904764, -2.890687, 1, 0.06666667, 0, 1,
-2.178587, -0.7022016, -1.975117, 1, 0.07058824, 0, 1,
-2.157937, 0.8206983, -2.369059, 1, 0.07843138, 0, 1,
-2.154825, -0.5376058, -3.807234, 1, 0.08235294, 0, 1,
-2.125584, 0.4897119, -1.195893, 1, 0.09019608, 0, 1,
-2.089402, 0.2268224, -3.892318, 1, 0.09411765, 0, 1,
-2.053071, -0.3838722, -0.95735, 1, 0.1019608, 0, 1,
-2.047571, -1.988482, -2.310706, 1, 0.1098039, 0, 1,
-2.036831, -1.128782, -0.7639452, 1, 0.1137255, 0, 1,
-2.029433, 0.625073, 0.5530465, 1, 0.1215686, 0, 1,
-2.009692, 0.6196625, -0.2148472, 1, 0.1254902, 0, 1,
-2.003703, 0.9184183, -0.5767441, 1, 0.1333333, 0, 1,
-1.959985, -1.544553, -1.515132, 1, 0.1372549, 0, 1,
-1.9562, 1.752305, -0.02491619, 1, 0.145098, 0, 1,
-1.94918, 0.5952728, -2.276564, 1, 0.1490196, 0, 1,
-1.919602, 0.8148808, -1.486005, 1, 0.1568628, 0, 1,
-1.917968, -0.6667962, -2.812871, 1, 0.1607843, 0, 1,
-1.910499, 0.2169292, -1.138752, 1, 0.1686275, 0, 1,
-1.909528, -0.5767179, -3.016361, 1, 0.172549, 0, 1,
-1.904073, 0.1280108, -1.608243, 1, 0.1803922, 0, 1,
-1.893437, -0.06981396, -2.062689, 1, 0.1843137, 0, 1,
-1.891305, -2.156386, -3.462718, 1, 0.1921569, 0, 1,
-1.868987, -0.4297613, -1.522951, 1, 0.1960784, 0, 1,
-1.831056, -0.742728, -1.106452, 1, 0.2039216, 0, 1,
-1.805506, -1.613591, -3.237905, 1, 0.2117647, 0, 1,
-1.803194, 0.7469162, -2.504005, 1, 0.2156863, 0, 1,
-1.787943, -0.1574823, -0.3109901, 1, 0.2235294, 0, 1,
-1.784118, 0.8955703, 0.2204103, 1, 0.227451, 0, 1,
-1.778689, 0.9843371, -2.768176, 1, 0.2352941, 0, 1,
-1.766838, -1.291145, -3.857578, 1, 0.2392157, 0, 1,
-1.756518, -1.74863, -1.855091, 1, 0.2470588, 0, 1,
-1.739445, -0.84088, -2.848678, 1, 0.2509804, 0, 1,
-1.734517, 1.031622, -1.41496, 1, 0.2588235, 0, 1,
-1.72729, 0.7349845, -1.976623, 1, 0.2627451, 0, 1,
-1.698645, -0.9171817, -3.432995, 1, 0.2705882, 0, 1,
-1.678946, 1.225394, -2.917209, 1, 0.2745098, 0, 1,
-1.678822, -0.7966782, -2.002829, 1, 0.282353, 0, 1,
-1.672872, -0.1304203, -1.673313, 1, 0.2862745, 0, 1,
-1.672553, -0.1587352, -1.948959, 1, 0.2941177, 0, 1,
-1.669345, -0.5517254, -3.065327, 1, 0.3019608, 0, 1,
-1.661964, 0.8107357, -0.6682723, 1, 0.3058824, 0, 1,
-1.639272, -1.036647, -2.37082, 1, 0.3137255, 0, 1,
-1.630599, 0.2438109, -0.06524839, 1, 0.3176471, 0, 1,
-1.613237, -0.6383274, -2.64313, 1, 0.3254902, 0, 1,
-1.607668, 0.2780058, -0.9131061, 1, 0.3294118, 0, 1,
-1.606162, -1.077018, -3.245231, 1, 0.3372549, 0, 1,
-1.601424, -0.9945633, -0.06535355, 1, 0.3411765, 0, 1,
-1.597932, -1.193158, -4.30784, 1, 0.3490196, 0, 1,
-1.58572, 0.2555312, 0.3439247, 1, 0.3529412, 0, 1,
-1.585554, 0.2334408, -3.105453, 1, 0.3607843, 0, 1,
-1.568317, -0.487681, -1.292605, 1, 0.3647059, 0, 1,
-1.555992, -1.265266, -2.593542, 1, 0.372549, 0, 1,
-1.505232, 1.715704, -0.6645126, 1, 0.3764706, 0, 1,
-1.503684, -2.943897, -4.588277, 1, 0.3843137, 0, 1,
-1.498117, -1.821426, -1.367671, 1, 0.3882353, 0, 1,
-1.496817, 0.7089489, 0.2037539, 1, 0.3960784, 0, 1,
-1.481571, 0.9061513, -1.357958, 1, 0.4039216, 0, 1,
-1.478879, -0.9722657, -2.868664, 1, 0.4078431, 0, 1,
-1.475699, -0.7882168, -3.004833, 1, 0.4156863, 0, 1,
-1.443712, -0.32265, -2.45828, 1, 0.4196078, 0, 1,
-1.437566, 0.6932492, -1.705543, 1, 0.427451, 0, 1,
-1.430021, 1.491473, -0.8386778, 1, 0.4313726, 0, 1,
-1.426302, 2.247313, -2.361008, 1, 0.4392157, 0, 1,
-1.416062, 0.6605371, 0.703835, 1, 0.4431373, 0, 1,
-1.402921, -0.6059787, -2.413823, 1, 0.4509804, 0, 1,
-1.39861, 0.08114303, -1.140175, 1, 0.454902, 0, 1,
-1.385714, -0.3493997, -2.056604, 1, 0.4627451, 0, 1,
-1.376553, -0.1375499, -0.1111301, 1, 0.4666667, 0, 1,
-1.364513, 1.499192, -0.04608787, 1, 0.4745098, 0, 1,
-1.363381, 0.2777132, -2.536911, 1, 0.4784314, 0, 1,
-1.359572, -1.214112, -2.12226, 1, 0.4862745, 0, 1,
-1.358109, -0.3112565, -3.267197, 1, 0.4901961, 0, 1,
-1.348575, -0.004562136, -2.13865, 1, 0.4980392, 0, 1,
-1.341401, -0.1024359, -1.618727, 1, 0.5058824, 0, 1,
-1.339705, 0.9263501, -0.7688972, 1, 0.509804, 0, 1,
-1.330174, -1.876978, -1.887805, 1, 0.5176471, 0, 1,
-1.320871, 2.205476, -0.7768158, 1, 0.5215687, 0, 1,
-1.316677, -0.7158292, -2.997182, 1, 0.5294118, 0, 1,
-1.315835, -0.6417944, -1.122129, 1, 0.5333334, 0, 1,
-1.307179, 0.06203514, -1.175466, 1, 0.5411765, 0, 1,
-1.301569, 0.1170557, -0.3278831, 1, 0.5450981, 0, 1,
-1.300922, -0.009122319, -0.7012889, 1, 0.5529412, 0, 1,
-1.285103, -0.7929072, -1.727024, 1, 0.5568628, 0, 1,
-1.274592, -1.281654, -2.504141, 1, 0.5647059, 0, 1,
-1.265752, -0.3131827, -0.8015511, 1, 0.5686275, 0, 1,
-1.265485, -0.9084998, -0.95194, 1, 0.5764706, 0, 1,
-1.249134, 0.9914618, 0.7302733, 1, 0.5803922, 0, 1,
-1.247612, -1.613285, -4.047814, 1, 0.5882353, 0, 1,
-1.244098, 0.7819303, -1.368141, 1, 0.5921569, 0, 1,
-1.24273, -0.08790872, 0.7726381, 1, 0.6, 0, 1,
-1.241175, 0.01895678, -1.735895, 1, 0.6078432, 0, 1,
-1.229487, -0.1769476, -2.956578, 1, 0.6117647, 0, 1,
-1.22879, 1.262147, 0.839488, 1, 0.6196079, 0, 1,
-1.227141, -0.2461249, -3.164482, 1, 0.6235294, 0, 1,
-1.21639, 0.1278099, -1.093799, 1, 0.6313726, 0, 1,
-1.212325, 0.9033337, -1.432259, 1, 0.6352941, 0, 1,
-1.206453, -1.367184, -2.591639, 1, 0.6431373, 0, 1,
-1.205808, -0.4239858, -1.78966, 1, 0.6470588, 0, 1,
-1.205577, -1.053206, -3.636701, 1, 0.654902, 0, 1,
-1.191581, -2.386247, -1.145734, 1, 0.6588235, 0, 1,
-1.180009, 1.941257, -1.111986, 1, 0.6666667, 0, 1,
-1.17384, 1.378452, -0.3920378, 1, 0.6705883, 0, 1,
-1.172976, -0.6988765, -3.828322, 1, 0.6784314, 0, 1,
-1.171731, 1.085468, -0.09376512, 1, 0.682353, 0, 1,
-1.168271, -0.1689352, 0.6161563, 1, 0.6901961, 0, 1,
-1.161085, 0.2026054, -0.3883155, 1, 0.6941177, 0, 1,
-1.155106, -0.2160947, -4.770015, 1, 0.7019608, 0, 1,
-1.137681, 0.06705536, -1.388095, 1, 0.7098039, 0, 1,
-1.133283, -0.431916, -3.7865, 1, 0.7137255, 0, 1,
-1.1318, -0.812416, -2.071005, 1, 0.7215686, 0, 1,
-1.131492, 0.7824969, -0.6501173, 1, 0.7254902, 0, 1,
-1.130468, 1.838453, -0.1093305, 1, 0.7333333, 0, 1,
-1.128016, 1.413208, -0.2575501, 1, 0.7372549, 0, 1,
-1.125285, 0.2174351, 0.9018893, 1, 0.7450981, 0, 1,
-1.121848, 0.9351261, -1.905843, 1, 0.7490196, 0, 1,
-1.115947, 0.1172031, -0.9051949, 1, 0.7568628, 0, 1,
-1.109202, -0.06399541, -1.890266, 1, 0.7607843, 0, 1,
-1.10655, -0.8543788, -3.285053, 1, 0.7686275, 0, 1,
-1.09874, -1.154489, -1.273841, 1, 0.772549, 0, 1,
-1.095473, -1.145207, -3.309126, 1, 0.7803922, 0, 1,
-1.092986, -1.154103, -1.921924, 1, 0.7843137, 0, 1,
-1.081151, 0.8134188, -1.711871, 1, 0.7921569, 0, 1,
-1.074549, -0.8171834, -3.025169, 1, 0.7960784, 0, 1,
-1.07261, 0.9446595, -0.3294845, 1, 0.8039216, 0, 1,
-1.067244, -0.4435548, -2.663545, 1, 0.8117647, 0, 1,
-1.062427, 0.781225, -0.4335238, 1, 0.8156863, 0, 1,
-1.055553, 0.2738918, -0.3585719, 1, 0.8235294, 0, 1,
-1.049882, -0.9826601, -1.262236, 1, 0.827451, 0, 1,
-1.038151, -0.9871896, -1.657947, 1, 0.8352941, 0, 1,
-1.036627, -1.433022, -3.228211, 1, 0.8392157, 0, 1,
-1.035977, 1.334501, -1.914772, 1, 0.8470588, 0, 1,
-1.028643, 1.352254, -0.7035524, 1, 0.8509804, 0, 1,
-1.02824, 0.1842851, -3.097228, 1, 0.8588235, 0, 1,
-1.026354, -1.097322, -1.73572, 1, 0.8627451, 0, 1,
-1.025002, 0.1689189, -1.86226, 1, 0.8705882, 0, 1,
-1.020014, -0.5871901, -1.753529, 1, 0.8745098, 0, 1,
-1.014831, 1.978329, -0.5766738, 1, 0.8823529, 0, 1,
-1.014237, 1.669778, -1.211105, 1, 0.8862745, 0, 1,
-1.013027, 0.3121711, -1.05756, 1, 0.8941177, 0, 1,
-1.000811, -0.6568314, -1.675902, 1, 0.8980392, 0, 1,
-0.9899732, -0.791081, -3.833632, 1, 0.9058824, 0, 1,
-0.9878348, -0.3716307, -1.794562, 1, 0.9137255, 0, 1,
-0.9860477, -0.4545405, -2.382111, 1, 0.9176471, 0, 1,
-0.9795006, 0.3775055, -2.279353, 1, 0.9254902, 0, 1,
-0.9785414, 0.3179807, -1.120942, 1, 0.9294118, 0, 1,
-0.9747029, -0.5294584, -0.914838, 1, 0.9372549, 0, 1,
-0.9725103, 1.369163, -1.543873, 1, 0.9411765, 0, 1,
-0.9721441, 0.2030163, -1.582073, 1, 0.9490196, 0, 1,
-0.9716661, 0.871821, -0.004080127, 1, 0.9529412, 0, 1,
-0.9708133, -0.07869244, -1.228279, 1, 0.9607843, 0, 1,
-0.9585114, -0.5927341, -1.863795, 1, 0.9647059, 0, 1,
-0.942962, 1.471903, -0.7273861, 1, 0.972549, 0, 1,
-0.9419045, -0.8090004, -3.048094, 1, 0.9764706, 0, 1,
-0.9417642, -1.083063, -1.987728, 1, 0.9843137, 0, 1,
-0.9398178, -1.644524, -2.72755, 1, 0.9882353, 0, 1,
-0.9349678, 1.579183, 0.2325119, 1, 0.9960784, 0, 1,
-0.9247497, -1.390851, -3.120629, 0.9960784, 1, 0, 1,
-0.9246335, -0.6176285, -4.179068, 0.9921569, 1, 0, 1,
-0.9223928, 0.2250177, -0.1510999, 0.9843137, 1, 0, 1,
-0.9138695, 1.556264, -0.1912, 0.9803922, 1, 0, 1,
-0.9112488, -1.060715, -1.651586, 0.972549, 1, 0, 1,
-0.9050952, 0.4129551, -1.794033, 0.9686275, 1, 0, 1,
-0.9019203, -2.064456, -3.659078, 0.9607843, 1, 0, 1,
-0.8921328, -1.242494, -0.7029586, 0.9568627, 1, 0, 1,
-0.8905739, 0.8726063, -0.4290572, 0.9490196, 1, 0, 1,
-0.8881432, -1.341241, -0.321552, 0.945098, 1, 0, 1,
-0.8860066, 0.1796815, -2.561018, 0.9372549, 1, 0, 1,
-0.8859051, -0.09199958, -1.480225, 0.9333333, 1, 0, 1,
-0.8845199, 1.488437, -0.5484055, 0.9254902, 1, 0, 1,
-0.8823709, -0.6965802, -2.601171, 0.9215686, 1, 0, 1,
-0.8768585, -1.328053, -1.221661, 0.9137255, 1, 0, 1,
-0.8629912, -0.3501185, -2.79281, 0.9098039, 1, 0, 1,
-0.8629546, -0.207673, -2.226563, 0.9019608, 1, 0, 1,
-0.8620132, -1.677501, -5.225611, 0.8941177, 1, 0, 1,
-0.859955, 1.312658, -0.9877927, 0.8901961, 1, 0, 1,
-0.8559068, -2.318366, -2.558906, 0.8823529, 1, 0, 1,
-0.8543309, 0.6061611, -1.191496, 0.8784314, 1, 0, 1,
-0.8375953, 0.2211657, -1.347492, 0.8705882, 1, 0, 1,
-0.8358809, -0.8128912, -1.624666, 0.8666667, 1, 0, 1,
-0.8358212, -0.4265127, -2.91942, 0.8588235, 1, 0, 1,
-0.8342896, -0.6143214, -2.17603, 0.854902, 1, 0, 1,
-0.8319949, -0.3972669, -2.339249, 0.8470588, 1, 0, 1,
-0.8319032, 0.3227262, 0.140556, 0.8431373, 1, 0, 1,
-0.8246019, -0.4239843, -4.281179, 0.8352941, 1, 0, 1,
-0.8186187, 0.3184289, -1.627694, 0.8313726, 1, 0, 1,
-0.8157079, -1.913141, -1.149587, 0.8235294, 1, 0, 1,
-0.8137118, -1.225898, -2.709196, 0.8196079, 1, 0, 1,
-0.8028861, -0.6107166, -2.961149, 0.8117647, 1, 0, 1,
-0.8005469, 0.08875203, -2.523459, 0.8078431, 1, 0, 1,
-0.7945013, -0.04612263, -0.04461974, 0.8, 1, 0, 1,
-0.7941208, 0.9112918, -1.705855, 0.7921569, 1, 0, 1,
-0.7933413, 1.328296, 0.3046656, 0.7882353, 1, 0, 1,
-0.7918058, 0.2599172, -0.815906, 0.7803922, 1, 0, 1,
-0.7912118, 1.48621, 0.2814736, 0.7764706, 1, 0, 1,
-0.7907683, 0.285625, 0.4196276, 0.7686275, 1, 0, 1,
-0.7877358, -0.04590081, 0.1904207, 0.7647059, 1, 0, 1,
-0.7697381, -0.6841042, -0.9136056, 0.7568628, 1, 0, 1,
-0.765066, -1.558827, -2.625863, 0.7529412, 1, 0, 1,
-0.7470732, 0.2535979, -1.135017, 0.7450981, 1, 0, 1,
-0.746855, -2.142628, -2.054896, 0.7411765, 1, 0, 1,
-0.7440239, -0.4331608, -2.113519, 0.7333333, 1, 0, 1,
-0.7332906, -0.2768536, -1.343739, 0.7294118, 1, 0, 1,
-0.7331725, -0.7815111, -0.4490491, 0.7215686, 1, 0, 1,
-0.7321289, -1.277355, -1.873294, 0.7176471, 1, 0, 1,
-0.7283888, 0.4125995, -1.426021, 0.7098039, 1, 0, 1,
-0.7276078, -1.50562, -2.225009, 0.7058824, 1, 0, 1,
-0.7250975, 0.6788661, -1.722836, 0.6980392, 1, 0, 1,
-0.7224971, 0.4488601, -1.545168, 0.6901961, 1, 0, 1,
-0.7190077, 0.8787937, -0.6574299, 0.6862745, 1, 0, 1,
-0.7148675, 0.1981807, -1.240927, 0.6784314, 1, 0, 1,
-0.7148061, 0.3638157, -1.158269, 0.6745098, 1, 0, 1,
-0.7130537, 1.337252, -1.055844, 0.6666667, 1, 0, 1,
-0.7088268, 1.636885, -0.5160593, 0.6627451, 1, 0, 1,
-0.7068172, 0.127624, -1.013174, 0.654902, 1, 0, 1,
-0.6930236, -0.1733076, -2.424792, 0.6509804, 1, 0, 1,
-0.692158, 0.5076249, 0.7815116, 0.6431373, 1, 0, 1,
-0.6798417, 0.6558062, -0.3530133, 0.6392157, 1, 0, 1,
-0.6791728, -0.7766612, -2.078231, 0.6313726, 1, 0, 1,
-0.6762755, -1.018138, -3.88879, 0.627451, 1, 0, 1,
-0.6744869, 0.2692148, -0.828004, 0.6196079, 1, 0, 1,
-0.6709327, 1.719512, 0.3618162, 0.6156863, 1, 0, 1,
-0.6697548, -0.08292014, -1.302116, 0.6078432, 1, 0, 1,
-0.667291, 0.4507051, -2.629222, 0.6039216, 1, 0, 1,
-0.6670321, 0.1497656, -1.927283, 0.5960785, 1, 0, 1,
-0.6612911, -0.1045858, -2.735358, 0.5882353, 1, 0, 1,
-0.6535347, -0.2464313, -1.151105, 0.5843138, 1, 0, 1,
-0.6477084, 1.550027, -0.3305952, 0.5764706, 1, 0, 1,
-0.6476313, -0.2492955, -3.527292, 0.572549, 1, 0, 1,
-0.6422603, 1.852693, -0.2553624, 0.5647059, 1, 0, 1,
-0.6421807, 0.9632615, -0.2782829, 0.5607843, 1, 0, 1,
-0.6411412, -0.9280319, -1.354387, 0.5529412, 1, 0, 1,
-0.640313, 0.5117604, -0.8348681, 0.5490196, 1, 0, 1,
-0.6356664, 0.8156288, -0.2913013, 0.5411765, 1, 0, 1,
-0.6338978, -0.5480184, -0.9000458, 0.5372549, 1, 0, 1,
-0.6302668, -0.5523201, -0.9618065, 0.5294118, 1, 0, 1,
-0.6301154, -0.15062, -2.593685, 0.5254902, 1, 0, 1,
-0.6276988, 0.6827598, -0.5816274, 0.5176471, 1, 0, 1,
-0.6260372, 1.099274, 0.8191548, 0.5137255, 1, 0, 1,
-0.6241807, -0.2451757, -2.241944, 0.5058824, 1, 0, 1,
-0.6237886, -1.022671, -3.087713, 0.5019608, 1, 0, 1,
-0.6223091, -1.367149, -4.298372, 0.4941176, 1, 0, 1,
-0.6203808, -1.760929, -2.294686, 0.4862745, 1, 0, 1,
-0.6189749, -0.9158031, -0.9905455, 0.4823529, 1, 0, 1,
-0.6105447, 1.159449, -1.707703, 0.4745098, 1, 0, 1,
-0.609596, 0.01021599, -1.824036, 0.4705882, 1, 0, 1,
-0.6086283, -0.6401873, -2.506564, 0.4627451, 1, 0, 1,
-0.6043336, -0.4912856, -2.541711, 0.4588235, 1, 0, 1,
-0.601446, -0.3287778, -1.283556, 0.4509804, 1, 0, 1,
-0.5999229, -1.735058, -2.160972, 0.4470588, 1, 0, 1,
-0.5933285, 2.651919, 1.466337, 0.4392157, 1, 0, 1,
-0.5917658, 2.115505, 1.432957, 0.4352941, 1, 0, 1,
-0.5874829, -0.7418635, -2.42577, 0.427451, 1, 0, 1,
-0.5814064, 1.190387, 1.286855, 0.4235294, 1, 0, 1,
-0.5810708, 1.352537, -0.2183257, 0.4156863, 1, 0, 1,
-0.5770519, 0.6318509, -1.109508, 0.4117647, 1, 0, 1,
-0.5768464, -0.4945638, -1.246494, 0.4039216, 1, 0, 1,
-0.5668298, 0.173391, -2.886097, 0.3960784, 1, 0, 1,
-0.5639501, -0.6102864, -1.443044, 0.3921569, 1, 0, 1,
-0.5637695, -0.06158528, -2.063788, 0.3843137, 1, 0, 1,
-0.5637605, 0.05889058, -1.24668, 0.3803922, 1, 0, 1,
-0.5516282, -1.313276, -3.177279, 0.372549, 1, 0, 1,
-0.5465674, 1.917296, -1.696174, 0.3686275, 1, 0, 1,
-0.5457428, 0.5063481, -2.267848, 0.3607843, 1, 0, 1,
-0.5430388, 0.1826601, -0.7251149, 0.3568628, 1, 0, 1,
-0.54254, 0.6009157, -0.4622895, 0.3490196, 1, 0, 1,
-0.5354565, 0.9210423, -1.834479, 0.345098, 1, 0, 1,
-0.5317565, 0.5388852, 0.859069, 0.3372549, 1, 0, 1,
-0.5287503, 0.5669706, -0.6549576, 0.3333333, 1, 0, 1,
-0.5223511, -0.7238518, -3.417297, 0.3254902, 1, 0, 1,
-0.5201375, 0.8513803, 0.3088245, 0.3215686, 1, 0, 1,
-0.5165816, 2.029783, -0.4385356, 0.3137255, 1, 0, 1,
-0.514788, 0.4568731, -0.5867508, 0.3098039, 1, 0, 1,
-0.5142735, 1.005969, -0.2444831, 0.3019608, 1, 0, 1,
-0.5125218, 1.476942, 1.406767, 0.2941177, 1, 0, 1,
-0.5110189, 0.6724331, -2.718337, 0.2901961, 1, 0, 1,
-0.5100464, -1.962792, -2.150143, 0.282353, 1, 0, 1,
-0.5060051, -2.081424, -4.579964, 0.2784314, 1, 0, 1,
-0.5030789, -1.35105, -1.687963, 0.2705882, 1, 0, 1,
-0.5026581, -1.073043, -3.300562, 0.2666667, 1, 0, 1,
-0.5002487, -1.193902, -3.040452, 0.2588235, 1, 0, 1,
-0.5000693, -0.2133574, -2.1456, 0.254902, 1, 0, 1,
-0.4980603, -1.266695, -2.173162, 0.2470588, 1, 0, 1,
-0.4963797, -0.1309318, -1.344578, 0.2431373, 1, 0, 1,
-0.4947139, 2.789327, 0.1182779, 0.2352941, 1, 0, 1,
-0.4907738, 0.5077454, -0.3688754, 0.2313726, 1, 0, 1,
-0.4884548, 0.7282187, -1.474792, 0.2235294, 1, 0, 1,
-0.4863228, -1.483806, -2.992395, 0.2196078, 1, 0, 1,
-0.4811138, 0.2086005, -1.003689, 0.2117647, 1, 0, 1,
-0.478648, 0.01265811, -2.515904, 0.2078431, 1, 0, 1,
-0.4777987, -0.4949168, -3.142887, 0.2, 1, 0, 1,
-0.4775125, 0.06778418, -0.4697669, 0.1921569, 1, 0, 1,
-0.4748024, 0.4787883, -0.9253004, 0.1882353, 1, 0, 1,
-0.472807, 0.1404766, -2.160212, 0.1803922, 1, 0, 1,
-0.4697602, 0.2196417, -0.3727734, 0.1764706, 1, 0, 1,
-0.4692562, 1.01349, -0.550779, 0.1686275, 1, 0, 1,
-0.4638715, -0.431927, -3.273419, 0.1647059, 1, 0, 1,
-0.4617828, 0.5493195, 0.3552894, 0.1568628, 1, 0, 1,
-0.4616197, -0.03949924, -3.037047, 0.1529412, 1, 0, 1,
-0.4605105, -0.8839245, -2.970169, 0.145098, 1, 0, 1,
-0.459379, 1.495242, -1.125366, 0.1411765, 1, 0, 1,
-0.4524127, 0.2300726, -0.2170406, 0.1333333, 1, 0, 1,
-0.4504738, 2.694467, -2.219416, 0.1294118, 1, 0, 1,
-0.4500732, 0.7024434, 0.1620549, 0.1215686, 1, 0, 1,
-0.4469339, 0.1769248, -0.2709147, 0.1176471, 1, 0, 1,
-0.4466215, 0.4982275, -1.765152, 0.1098039, 1, 0, 1,
-0.4461441, 0.6959617, -1.256155, 0.1058824, 1, 0, 1,
-0.4422432, -1.254612, -3.063359, 0.09803922, 1, 0, 1,
-0.437067, -0.5410329, -0.9964904, 0.09019608, 1, 0, 1,
-0.4354005, -0.2096303, -2.932855, 0.08627451, 1, 0, 1,
-0.4353995, -0.4200154, -3.59904, 0.07843138, 1, 0, 1,
-0.435154, -1.75, -4.295114, 0.07450981, 1, 0, 1,
-0.4318908, 0.7511214, -3.286257, 0.06666667, 1, 0, 1,
-0.4271308, 0.6142929, 1.411544, 0.0627451, 1, 0, 1,
-0.4252549, -0.922206, -2.377866, 0.05490196, 1, 0, 1,
-0.4209311, -1.398495, -5.760624, 0.05098039, 1, 0, 1,
-0.4150378, -1.252276, -3.503314, 0.04313726, 1, 0, 1,
-0.4144829, 0.3486271, -1.827017, 0.03921569, 1, 0, 1,
-0.4100341, 0.04094119, -1.142887, 0.03137255, 1, 0, 1,
-0.4062683, 1.845472, 0.02960662, 0.02745098, 1, 0, 1,
-0.4059418, 1.073508, 0.4130524, 0.01960784, 1, 0, 1,
-0.4006244, -0.7812861, -1.622798, 0.01568628, 1, 0, 1,
-0.3965054, -1.020532, -2.511553, 0.007843138, 1, 0, 1,
-0.3955673, -0.9160986, -2.58813, 0.003921569, 1, 0, 1,
-0.3930134, -0.9435344, -2.014285, 0, 1, 0.003921569, 1,
-0.3901513, 0.4229898, -0.7920663, 0, 1, 0.01176471, 1,
-0.3885514, 1.527022, -0.754337, 0, 1, 0.01568628, 1,
-0.3849813, 0.3149257, -1.307575, 0, 1, 0.02352941, 1,
-0.384836, 0.5225965, -3.030813, 0, 1, 0.02745098, 1,
-0.3839843, 1.596038, 1.816054, 0, 1, 0.03529412, 1,
-0.3812248, 0.4951166, -0.3056326, 0, 1, 0.03921569, 1,
-0.3782408, 0.3579569, -1.889095, 0, 1, 0.04705882, 1,
-0.3758526, 1.170248, 0.7548754, 0, 1, 0.05098039, 1,
-0.3732301, 1.397144, -1.41521, 0, 1, 0.05882353, 1,
-0.3702177, 0.1043543, -2.181858, 0, 1, 0.0627451, 1,
-0.3644243, -0.897097, -2.665268, 0, 1, 0.07058824, 1,
-0.3607374, -0.9617415, -2.069514, 0, 1, 0.07450981, 1,
-0.3602211, 0.9354073, -0.9566112, 0, 1, 0.08235294, 1,
-0.359696, 1.682734, -1.533141, 0, 1, 0.08627451, 1,
-0.3591494, -1.090359, -1.210398, 0, 1, 0.09411765, 1,
-0.3540729, 0.5739493, 0.2238752, 0, 1, 0.1019608, 1,
-0.3536792, 0.3173339, -1.05851, 0, 1, 0.1058824, 1,
-0.3535394, 0.3366432, 0.7556899, 0, 1, 0.1137255, 1,
-0.353035, 0.4330766, -0.4559168, 0, 1, 0.1176471, 1,
-0.3509904, 0.2813866, -1.89045, 0, 1, 0.1254902, 1,
-0.3494412, -0.8128365, -0.9908336, 0, 1, 0.1294118, 1,
-0.3471586, -0.4192243, -2.050965, 0, 1, 0.1372549, 1,
-0.3458415, -0.3222747, -2.715596, 0, 1, 0.1411765, 1,
-0.3436777, -0.219081, -2.223361, 0, 1, 0.1490196, 1,
-0.3404719, 0.005717113, -1.926282, 0, 1, 0.1529412, 1,
-0.3367057, 0.2438347, -1.320596, 0, 1, 0.1607843, 1,
-0.3338195, -1.277552, -2.888775, 0, 1, 0.1647059, 1,
-0.3326736, -0.3261214, -2.48122, 0, 1, 0.172549, 1,
-0.3319258, -0.1272944, -0.1822973, 0, 1, 0.1764706, 1,
-0.3279805, -0.2756095, -2.684639, 0, 1, 0.1843137, 1,
-0.322219, -0.9059102, -3.141569, 0, 1, 0.1882353, 1,
-0.3172099, 0.5759, -1.651944, 0, 1, 0.1960784, 1,
-0.3154477, -0.5469533, -2.164764, 0, 1, 0.2039216, 1,
-0.3119885, -1.520595, -3.492228, 0, 1, 0.2078431, 1,
-0.3108611, -0.57388, -1.510829, 0, 1, 0.2156863, 1,
-0.3099637, 0.2317219, -1.308351, 0, 1, 0.2196078, 1,
-0.306049, -0.6863513, -2.250456, 0, 1, 0.227451, 1,
-0.3044233, -0.9385668, -2.372779, 0, 1, 0.2313726, 1,
-0.3023076, -0.7895789, -3.937919, 0, 1, 0.2392157, 1,
-0.2995372, -0.02521267, -2.241405, 0, 1, 0.2431373, 1,
-0.2979474, -0.2233848, -2.450608, 0, 1, 0.2509804, 1,
-0.2957643, 0.6411262, -0.7179914, 0, 1, 0.254902, 1,
-0.2941456, 0.1555012, -0.06690869, 0, 1, 0.2627451, 1,
-0.2940421, -0.2972991, -2.872515, 0, 1, 0.2666667, 1,
-0.2868353, -0.08597974, -2.482435, 0, 1, 0.2745098, 1,
-0.2865665, 0.02840861, -1.807443, 0, 1, 0.2784314, 1,
-0.282364, -0.4679843, -4.307305, 0, 1, 0.2862745, 1,
-0.2806907, 0.2941101, 0.01992967, 0, 1, 0.2901961, 1,
-0.2781096, 0.1898833, 0.3708346, 0, 1, 0.2980392, 1,
-0.2735049, -0.8716196, -3.02486, 0, 1, 0.3058824, 1,
-0.2703782, -0.2817571, -0.9768789, 0, 1, 0.3098039, 1,
-0.2691273, -0.4568382, -1.89715, 0, 1, 0.3176471, 1,
-0.2668215, -1.564013, -3.880152, 0, 1, 0.3215686, 1,
-0.2667081, -0.5481756, -4.166687, 0, 1, 0.3294118, 1,
-0.263529, 2.449561, 0.7641472, 0, 1, 0.3333333, 1,
-0.262316, -0.5656046, -3.111399, 0, 1, 0.3411765, 1,
-0.2545699, -0.385631, -2.263381, 0, 1, 0.345098, 1,
-0.253687, -1.344883, -2.172275, 0, 1, 0.3529412, 1,
-0.2476964, -0.1423531, -1.336019, 0, 1, 0.3568628, 1,
-0.245425, -0.6988987, -2.699065, 0, 1, 0.3647059, 1,
-0.243967, 0.6830562, -1.607556, 0, 1, 0.3686275, 1,
-0.2410042, -0.2082874, -2.459961, 0, 1, 0.3764706, 1,
-0.2399382, -0.520117, -1.467703, 0, 1, 0.3803922, 1,
-0.2369444, -1.68522, -4.002123, 0, 1, 0.3882353, 1,
-0.235318, -0.2788194, -2.396498, 0, 1, 0.3921569, 1,
-0.2243741, 0.3721431, 1.040127, 0, 1, 0.4, 1,
-0.2238453, 1.135746, 0.8941535, 0, 1, 0.4078431, 1,
-0.2237401, 0.3299299, 0.2294944, 0, 1, 0.4117647, 1,
-0.2185037, -0.3691352, -3.682539, 0, 1, 0.4196078, 1,
-0.2173316, 1.413791, -0.9673584, 0, 1, 0.4235294, 1,
-0.2075541, -0.2957146, -1.582313, 0, 1, 0.4313726, 1,
-0.2043016, 0.3478556, -1.039167, 0, 1, 0.4352941, 1,
-0.2035376, 0.3433748, 0.9132467, 0, 1, 0.4431373, 1,
-0.2033783, -0.9865759, -2.461673, 0, 1, 0.4470588, 1,
-0.2026146, 0.09008862, -0.6674519, 0, 1, 0.454902, 1,
-0.2009906, -1.64659, -2.432158, 0, 1, 0.4588235, 1,
-0.2002217, 1.487803, -0.4854395, 0, 1, 0.4666667, 1,
-0.2001943, 0.8104751, -0.007036229, 0, 1, 0.4705882, 1,
-0.199549, -0.8080863, -1.210291, 0, 1, 0.4784314, 1,
-0.1945277, 0.4222775, -1.092122, 0, 1, 0.4823529, 1,
-0.1933629, -0.7644115, -3.853635, 0, 1, 0.4901961, 1,
-0.1857435, -1.013356, -4.195416, 0, 1, 0.4941176, 1,
-0.1843507, 0.8823208, 0.4990277, 0, 1, 0.5019608, 1,
-0.1841424, 0.1506393, -0.8778218, 0, 1, 0.509804, 1,
-0.1838872, -1.319896, -3.771978, 0, 1, 0.5137255, 1,
-0.1772292, -0.135924, -3.104035, 0, 1, 0.5215687, 1,
-0.1747958, 1.101976, -0.003684417, 0, 1, 0.5254902, 1,
-0.174259, 1.330824, -1.219361, 0, 1, 0.5333334, 1,
-0.1690868, -1.113506, -1.237627, 0, 1, 0.5372549, 1,
-0.166075, 0.1258805, -0.1186686, 0, 1, 0.5450981, 1,
-0.1628968, 2.095327, -1.474009, 0, 1, 0.5490196, 1,
-0.155363, -0.01519041, -1.679201, 0, 1, 0.5568628, 1,
-0.1552931, 0.435749, -0.8600774, 0, 1, 0.5607843, 1,
-0.1541147, 0.2582465, -2.074637, 0, 1, 0.5686275, 1,
-0.1510986, -2.208883, -3.727983, 0, 1, 0.572549, 1,
-0.1448321, 1.133387, 0.7824997, 0, 1, 0.5803922, 1,
-0.1445213, 0.7428566, -1.1132, 0, 1, 0.5843138, 1,
-0.1412629, -2.051377, -3.738339, 0, 1, 0.5921569, 1,
-0.138898, 0.2837408, 1.159923, 0, 1, 0.5960785, 1,
-0.1364579, 1.456099, -0.03973604, 0, 1, 0.6039216, 1,
-0.1363973, -0.4366534, -3.966205, 0, 1, 0.6117647, 1,
-0.1345865, 0.2671105, 1.290336, 0, 1, 0.6156863, 1,
-0.1339206, 0.7157995, -0.4114155, 0, 1, 0.6235294, 1,
-0.1320822, -1.120445, -2.715774, 0, 1, 0.627451, 1,
-0.1280386, 0.2748617, -0.6864181, 0, 1, 0.6352941, 1,
-0.1264172, -0.3213443, -4.826715, 0, 1, 0.6392157, 1,
-0.1252793, -1.040957, -1.792252, 0, 1, 0.6470588, 1,
-0.1207176, -0.0003088281, -0.4116388, 0, 1, 0.6509804, 1,
-0.1197775, 1.528362, -0.6710255, 0, 1, 0.6588235, 1,
-0.1187995, 1.993284, -1.195604, 0, 1, 0.6627451, 1,
-0.1174997, 0.2191073, -0.6780551, 0, 1, 0.6705883, 1,
-0.1145369, -0.03558533, -2.534161, 0, 1, 0.6745098, 1,
-0.1134311, -1.398361, -4.567726, 0, 1, 0.682353, 1,
-0.1117074, 1.143106, -0.8492957, 0, 1, 0.6862745, 1,
-0.1067366, 0.2620811, 0.404384, 0, 1, 0.6941177, 1,
-0.1016582, 0.006857174, -1.715009, 0, 1, 0.7019608, 1,
-0.09678595, 1.933134, 1.00098, 0, 1, 0.7058824, 1,
-0.09634457, -1.172882, -4.201063, 0, 1, 0.7137255, 1,
-0.0942552, 0.8963357, -1.3962, 0, 1, 0.7176471, 1,
-0.09259637, -1.650635, -1.851705, 0, 1, 0.7254902, 1,
-0.09111657, -1.223387, -4.575223, 0, 1, 0.7294118, 1,
-0.08920549, 0.1840444, -0.380585, 0, 1, 0.7372549, 1,
-0.08332853, -1.273517, -2.908735, 0, 1, 0.7411765, 1,
-0.08268543, 1.3625, 0.3774514, 0, 1, 0.7490196, 1,
-0.08122245, -0.3287825, -2.903476, 0, 1, 0.7529412, 1,
-0.07847423, 0.8587759, -0.3010268, 0, 1, 0.7607843, 1,
-0.07743819, 0.2917558, 0.9921197, 0, 1, 0.7647059, 1,
-0.07652226, 0.1054654, -0.3289431, 0, 1, 0.772549, 1,
-0.07579278, -2.27889, -1.818906, 0, 1, 0.7764706, 1,
-0.07385247, -0.1239889, -2.088706, 0, 1, 0.7843137, 1,
-0.06735525, 0.06099633, 0.03846933, 0, 1, 0.7882353, 1,
-0.06538179, -0.5054629, -1.960661, 0, 1, 0.7960784, 1,
-0.06118201, -0.1997848, -3.459311, 0, 1, 0.8039216, 1,
-0.05645924, -2.317779, -5.360066, 0, 1, 0.8078431, 1,
-0.05565451, -0.280001, -4.631235, 0, 1, 0.8156863, 1,
-0.0477984, 0.7940652, -0.8146168, 0, 1, 0.8196079, 1,
-0.04669529, 1.699101, -0.2566314, 0, 1, 0.827451, 1,
-0.04435696, 0.5770175, -1.751875, 0, 1, 0.8313726, 1,
-0.04251983, 0.5146357, 0.1920817, 0, 1, 0.8392157, 1,
-0.04187967, -0.9003916, -2.758192, 0, 1, 0.8431373, 1,
-0.03977942, -0.5806378, -2.272729, 0, 1, 0.8509804, 1,
-0.0363212, -0.4782342, -2.974373, 0, 1, 0.854902, 1,
-0.03455997, -0.2934637, -3.976824, 0, 1, 0.8627451, 1,
-0.03370371, -0.5332487, -4.261024, 0, 1, 0.8666667, 1,
-0.03334958, 0.3884753, -0.5841689, 0, 1, 0.8745098, 1,
-0.03117996, -1.479325, -2.95979, 0, 1, 0.8784314, 1,
-0.03072371, -0.8761736, -1.430874, 0, 1, 0.8862745, 1,
-0.02744852, -1.957273, -4.299396, 0, 1, 0.8901961, 1,
-0.0264315, 0.05438792, -0.03990443, 0, 1, 0.8980392, 1,
-0.02329109, 1.267857, 1.884891, 0, 1, 0.9058824, 1,
-0.02299392, -0.01925029, -1.328969, 0, 1, 0.9098039, 1,
-0.01928873, -0.9415752, -2.893317, 0, 1, 0.9176471, 1,
-0.01925593, -0.4222584, -3.216096, 0, 1, 0.9215686, 1,
-0.01777977, -0.2507989, -2.649123, 0, 1, 0.9294118, 1,
-0.01440591, -0.2262389, -2.551671, 0, 1, 0.9333333, 1,
-0.01105341, -1.154579, -3.479765, 0, 1, 0.9411765, 1,
-0.01075756, 1.083275, -1.111016, 0, 1, 0.945098, 1,
-0.006104409, -1.911191, -2.326819, 0, 1, 0.9529412, 1,
-0.006099652, 0.3538632, 0.4091174, 0, 1, 0.9568627, 1,
-0.00594212, 2.738241, -1.132073, 0, 1, 0.9647059, 1,
-0.005889772, 3.18399, -0.5091346, 0, 1, 0.9686275, 1,
-0.003443533, -0.7777488, -3.09866, 0, 1, 0.9764706, 1,
-0.003350046, -0.5575742, -4.236149, 0, 1, 0.9803922, 1,
0.007712468, 0.8631121, 0.7782553, 0, 1, 0.9882353, 1,
0.01121234, -1.168973, 3.90457, 0, 1, 0.9921569, 1,
0.01262527, 0.4345472, 0.1939968, 0, 1, 1, 1,
0.0132107, -0.22968, 2.599651, 0, 0.9921569, 1, 1,
0.01784444, -0.3837948, 4.343329, 0, 0.9882353, 1, 1,
0.02710168, -1.378834, 5.479848, 0, 0.9803922, 1, 1,
0.03204106, -0.0945517, 1.597219, 0, 0.9764706, 1, 1,
0.03356623, 0.6581107, -0.1613946, 0, 0.9686275, 1, 1,
0.03676158, -0.6818033, 1.254254, 0, 0.9647059, 1, 1,
0.04069922, 0.4052879, -0.5751902, 0, 0.9568627, 1, 1,
0.04135219, -1.087676, 3.923, 0, 0.9529412, 1, 1,
0.04175097, -0.2852872, 4.247115, 0, 0.945098, 1, 1,
0.04234869, 1.255756, 0.41228, 0, 0.9411765, 1, 1,
0.04243404, -0.2517397, 3.125017, 0, 0.9333333, 1, 1,
0.04698591, 0.5105962, -1.440131, 0, 0.9294118, 1, 1,
0.04713641, -0.9826279, 3.927146, 0, 0.9215686, 1, 1,
0.04794546, -0.2327467, 2.780726, 0, 0.9176471, 1, 1,
0.04837694, 0.5495716, -1.983169, 0, 0.9098039, 1, 1,
0.05089195, 0.8921118, 0.653641, 0, 0.9058824, 1, 1,
0.05314822, 0.3334575, 1.949489, 0, 0.8980392, 1, 1,
0.05923453, 0.1722332, 1.875281, 0, 0.8901961, 1, 1,
0.06061486, -0.05859843, 2.065201, 0, 0.8862745, 1, 1,
0.06092254, 0.01460777, 2.806242, 0, 0.8784314, 1, 1,
0.06125548, 0.2739769, -0.4668991, 0, 0.8745098, 1, 1,
0.06166029, -1.512442, 4.280618, 0, 0.8666667, 1, 1,
0.06269918, -0.3906236, 2.442631, 0, 0.8627451, 1, 1,
0.06301157, 0.2045523, 0.8936505, 0, 0.854902, 1, 1,
0.06511015, 1.043131, -0.3688846, 0, 0.8509804, 1, 1,
0.06950267, 0.3541583, -0.459852, 0, 0.8431373, 1, 1,
0.07014661, -1.234797, 3.321187, 0, 0.8392157, 1, 1,
0.07574063, -0.9285711, 2.425342, 0, 0.8313726, 1, 1,
0.07575828, -1.555281, 2.424837, 0, 0.827451, 1, 1,
0.07895342, 1.142326, -1.03056, 0, 0.8196079, 1, 1,
0.07967436, 0.7248602, -0.3737572, 0, 0.8156863, 1, 1,
0.08308429, 1.734461, -0.3845376, 0, 0.8078431, 1, 1,
0.08438776, -0.6379443, 0.9645088, 0, 0.8039216, 1, 1,
0.08545627, -1.197743, 1.889182, 0, 0.7960784, 1, 1,
0.08982848, 0.8652894, 0.1621147, 0, 0.7882353, 1, 1,
0.09003362, 0.5044498, -0.04452386, 0, 0.7843137, 1, 1,
0.09222617, 1.285031, -0.7626538, 0, 0.7764706, 1, 1,
0.09384657, -0.1503958, 2.662061, 0, 0.772549, 1, 1,
0.09428228, 1.236877, -0.7841671, 0, 0.7647059, 1, 1,
0.09618265, -1.641674, 2.305693, 0, 0.7607843, 1, 1,
0.09860559, 1.222112, -0.1529851, 0, 0.7529412, 1, 1,
0.1009463, 0.1735277, -0.5672355, 0, 0.7490196, 1, 1,
0.1068868, 0.5692304, -0.3686535, 0, 0.7411765, 1, 1,
0.1087333, 0.5537397, -0.9496456, 0, 0.7372549, 1, 1,
0.1105997, 0.6720378, 1.87937, 0, 0.7294118, 1, 1,
0.1122416, -1.159694, 2.59128, 0, 0.7254902, 1, 1,
0.1131219, 1.641698, 0.328085, 0, 0.7176471, 1, 1,
0.1146647, 0.1609783, 0.6492187, 0, 0.7137255, 1, 1,
0.1166927, -0.8125582, 2.608044, 0, 0.7058824, 1, 1,
0.1170482, 0.3807589, 1.342582, 0, 0.6980392, 1, 1,
0.1261389, -0.4907727, 2.440608, 0, 0.6941177, 1, 1,
0.1261847, -0.1522332, 1.873595, 0, 0.6862745, 1, 1,
0.1301465, -2.535463, 3.78631, 0, 0.682353, 1, 1,
0.1324117, 0.1293031, -0.05451216, 0, 0.6745098, 1, 1,
0.1331634, 0.445257, -1.405254, 0, 0.6705883, 1, 1,
0.1379816, -0.7547708, 3.319852, 0, 0.6627451, 1, 1,
0.1391492, -0.286568, 0.872824, 0, 0.6588235, 1, 1,
0.1439864, -0.6533125, 1.290337, 0, 0.6509804, 1, 1,
0.1440894, -1.068797, 3.823326, 0, 0.6470588, 1, 1,
0.1481727, -0.4953632, 3.582829, 0, 0.6392157, 1, 1,
0.1483796, -0.9726355, 3.552706, 0, 0.6352941, 1, 1,
0.1486418, -1.126877, 4.149968, 0, 0.627451, 1, 1,
0.1500967, 1.687718, -0.1342917, 0, 0.6235294, 1, 1,
0.1526937, -1.303873, 3.183314, 0, 0.6156863, 1, 1,
0.1576153, 0.4041765, 0.6214343, 0, 0.6117647, 1, 1,
0.1604829, -0.1401291, 2.613319, 0, 0.6039216, 1, 1,
0.1623739, -0.7795966, 5.079834, 0, 0.5960785, 1, 1,
0.1624374, -0.393928, 2.137173, 0, 0.5921569, 1, 1,
0.166636, -0.5542325, 2.800597, 0, 0.5843138, 1, 1,
0.1669324, -0.5644204, 1.691874, 0, 0.5803922, 1, 1,
0.1697764, 0.1081982, 0.1354737, 0, 0.572549, 1, 1,
0.1711612, -2.066413, 3.708157, 0, 0.5686275, 1, 1,
0.1711893, 0.4094076, 2.057281, 0, 0.5607843, 1, 1,
0.1720989, -0.8509836, 3.730076, 0, 0.5568628, 1, 1,
0.1727977, -1.19625, 4.908915, 0, 0.5490196, 1, 1,
0.1733977, -1.033139, 2.041399, 0, 0.5450981, 1, 1,
0.1770344, -0.8215214, 3.240608, 0, 0.5372549, 1, 1,
0.1778761, 0.8504985, 0.6354136, 0, 0.5333334, 1, 1,
0.1788905, -0.7947949, 5.269781, 0, 0.5254902, 1, 1,
0.1800856, -1.451143, 3.664049, 0, 0.5215687, 1, 1,
0.1872285, 0.2245622, 2.812773, 0, 0.5137255, 1, 1,
0.1888426, -0.0947537, 1.932131, 0, 0.509804, 1, 1,
0.196939, 0.4365183, -0.7669352, 0, 0.5019608, 1, 1,
0.1986082, -0.8972059, 3.341899, 0, 0.4941176, 1, 1,
0.2060263, -0.1897974, 2.347982, 0, 0.4901961, 1, 1,
0.2086755, -0.8841262, 3.659251, 0, 0.4823529, 1, 1,
0.2091219, 0.1923474, 1.553993, 0, 0.4784314, 1, 1,
0.2126557, -0.06071842, 0.6562561, 0, 0.4705882, 1, 1,
0.2161828, 0.4456873, 2.330697, 0, 0.4666667, 1, 1,
0.2172045, 0.08901525, 3.351983, 0, 0.4588235, 1, 1,
0.2179386, 1.10593, 1.322315, 0, 0.454902, 1, 1,
0.221223, -2.839772, 2.530365, 0, 0.4470588, 1, 1,
0.2228647, 0.8618191, 0.3668384, 0, 0.4431373, 1, 1,
0.2321351, -0.8610518, 2.631224, 0, 0.4352941, 1, 1,
0.2546431, 0.8823604, 2.515658, 0, 0.4313726, 1, 1,
0.2558205, 0.04830799, 0.8151983, 0, 0.4235294, 1, 1,
0.2591167, -1.786903, 2.671297, 0, 0.4196078, 1, 1,
0.2605435, 1.143456, 1.597954, 0, 0.4117647, 1, 1,
0.2645126, 0.1021677, 1.902725, 0, 0.4078431, 1, 1,
0.2645434, 0.4110383, 0.9126205, 0, 0.4, 1, 1,
0.264723, 0.145179, -0.3642564, 0, 0.3921569, 1, 1,
0.2679647, 2.048129, 1.16325, 0, 0.3882353, 1, 1,
0.2686051, -0.3423751, 2.392693, 0, 0.3803922, 1, 1,
0.2700823, 1.496459, -1.37988, 0, 0.3764706, 1, 1,
0.2709312, 1.981179, 0.008539142, 0, 0.3686275, 1, 1,
0.2726346, -0.2449302, 2.6904, 0, 0.3647059, 1, 1,
0.2731679, 0.290314, 0.6656714, 0, 0.3568628, 1, 1,
0.2757734, -1.122223, 3.295082, 0, 0.3529412, 1, 1,
0.2820228, -0.4095504, 3.956513, 0, 0.345098, 1, 1,
0.2823927, -0.5118636, 0.8415959, 0, 0.3411765, 1, 1,
0.2870592, 0.3618348, 0.03265469, 0, 0.3333333, 1, 1,
0.2884619, 0.371498, 1.442261, 0, 0.3294118, 1, 1,
0.2887449, -0.3866319, 2.446559, 0, 0.3215686, 1, 1,
0.289284, 0.7633672, 1.521415, 0, 0.3176471, 1, 1,
0.2902196, 1.039824, -0.7519453, 0, 0.3098039, 1, 1,
0.2915767, -0.5278575, 2.447785, 0, 0.3058824, 1, 1,
0.3015174, -1.551304, 2.705713, 0, 0.2980392, 1, 1,
0.3172005, -1.37487, 2.696147, 0, 0.2901961, 1, 1,
0.31749, 0.3003507, 1.079803, 0, 0.2862745, 1, 1,
0.3182994, 0.8050026, 2.212567, 0, 0.2784314, 1, 1,
0.319201, 1.654915, -1.222508, 0, 0.2745098, 1, 1,
0.3223661, -0.4813901, 2.890083, 0, 0.2666667, 1, 1,
0.3251355, 1.605756, -1.713459, 0, 0.2627451, 1, 1,
0.3252204, -0.8497187, 2.998606, 0, 0.254902, 1, 1,
0.3290401, 1.062103, 0.1345089, 0, 0.2509804, 1, 1,
0.3305944, -0.4036678, 0.654696, 0, 0.2431373, 1, 1,
0.3368702, -0.8630819, 3.157918, 0, 0.2392157, 1, 1,
0.3385583, -0.7997072, 3.787092, 0, 0.2313726, 1, 1,
0.3420655, 0.9603267, -0.3884015, 0, 0.227451, 1, 1,
0.3444566, 0.9339988, 0.4540906, 0, 0.2196078, 1, 1,
0.346248, 0.7890918, -0.9387268, 0, 0.2156863, 1, 1,
0.352896, 0.1747626, 2.26494, 0, 0.2078431, 1, 1,
0.3556615, 0.3198453, 1.081815, 0, 0.2039216, 1, 1,
0.3566991, 0.1400817, 0.5740886, 0, 0.1960784, 1, 1,
0.3591154, 0.5261087, 0.8737484, 0, 0.1882353, 1, 1,
0.3596036, -0.596513, 4.673089, 0, 0.1843137, 1, 1,
0.3597139, 1.131958, 0.6110448, 0, 0.1764706, 1, 1,
0.3617119, 0.02655919, 0.09276739, 0, 0.172549, 1, 1,
0.3637612, 0.5835711, 1.007325, 0, 0.1647059, 1, 1,
0.365108, -0.5857546, 1.99717, 0, 0.1607843, 1, 1,
0.3693656, 0.06958782, 2.849826, 0, 0.1529412, 1, 1,
0.3756835, -0.3975776, 3.165295, 0, 0.1490196, 1, 1,
0.3783099, -0.2664936, 2.818706, 0, 0.1411765, 1, 1,
0.3784022, 0.2735363, 0.08461051, 0, 0.1372549, 1, 1,
0.3815785, 0.06988337, 1.417153, 0, 0.1294118, 1, 1,
0.383484, 0.6135507, 0.08834005, 0, 0.1254902, 1, 1,
0.3868462, -0.226668, 2.829621, 0, 0.1176471, 1, 1,
0.3946033, 0.4380829, 0.7319469, 0, 0.1137255, 1, 1,
0.4031726, 0.1671891, 1.442471, 0, 0.1058824, 1, 1,
0.4058522, 0.121655, 2.859755, 0, 0.09803922, 1, 1,
0.4080776, -2.003, 5.174018, 0, 0.09411765, 1, 1,
0.4081421, -0.5278153, 0.9850292, 0, 0.08627451, 1, 1,
0.4089305, -0.7060803, 1.275326, 0, 0.08235294, 1, 1,
0.4114459, -1.238995, 4.112807, 0, 0.07450981, 1, 1,
0.4119872, 1.072112, 1.463769, 0, 0.07058824, 1, 1,
0.4199897, 0.05614365, 0.654622, 0, 0.0627451, 1, 1,
0.4228411, -0.4281394, 1.910615, 0, 0.05882353, 1, 1,
0.4258274, 1.032022, 0.54957, 0, 0.05098039, 1, 1,
0.4286325, 0.633192, 0.2193468, 0, 0.04705882, 1, 1,
0.4288572, 0.4201016, 1.327644, 0, 0.03921569, 1, 1,
0.4326181, -0.6411965, 1.784706, 0, 0.03529412, 1, 1,
0.434035, -1.451978, 3.710022, 0, 0.02745098, 1, 1,
0.4413058, 0.7654839, -1.613708, 0, 0.02352941, 1, 1,
0.4421354, -0.1769644, 0.9497308, 0, 0.01568628, 1, 1,
0.4425502, -1.138307, 2.26502, 0, 0.01176471, 1, 1,
0.4487723, 0.04689615, 2.649059, 0, 0.003921569, 1, 1,
0.450211, 1.518406, 0.2031125, 0.003921569, 0, 1, 1,
0.4521831, 0.2904948, 2.859103, 0.007843138, 0, 1, 1,
0.4524098, 0.3595609, 0.8882861, 0.01568628, 0, 1, 1,
0.4524966, 0.2116852, 0.01908956, 0.01960784, 0, 1, 1,
0.4550985, 2.135, -0.1618864, 0.02745098, 0, 1, 1,
0.4555737, -1.762227, 1.948971, 0.03137255, 0, 1, 1,
0.4564163, -0.04090875, 0.3580858, 0.03921569, 0, 1, 1,
0.4596567, -1.808683, 1.91832, 0.04313726, 0, 1, 1,
0.4613595, -1.360305, 2.698032, 0.05098039, 0, 1, 1,
0.4627926, 0.7009451, 1.12952, 0.05490196, 0, 1, 1,
0.4672829, -0.6729564, 3.019254, 0.0627451, 0, 1, 1,
0.4694396, -0.1846795, 1.777437, 0.06666667, 0, 1, 1,
0.4696736, 1.980403, -1.513193, 0.07450981, 0, 1, 1,
0.4702134, 1.05203, 0.3210313, 0.07843138, 0, 1, 1,
0.47484, 0.5728872, -0.68729, 0.08627451, 0, 1, 1,
0.4773565, -1.755678, 2.657577, 0.09019608, 0, 1, 1,
0.4799782, 1.46787, 0.04707547, 0.09803922, 0, 1, 1,
0.4816706, -0.5114176, 2.180655, 0.1058824, 0, 1, 1,
0.4858885, 0.2322861, 0.3403009, 0.1098039, 0, 1, 1,
0.4911487, 0.6964832, 1.409822, 0.1176471, 0, 1, 1,
0.4943487, -2.356822, 1.508411, 0.1215686, 0, 1, 1,
0.4979316, -0.475228, 1.634906, 0.1294118, 0, 1, 1,
0.4984154, 0.8480572, -1.855427, 0.1333333, 0, 1, 1,
0.4987894, 1.013186, 0.09178699, 0.1411765, 0, 1, 1,
0.5059621, -1.109851, 2.336816, 0.145098, 0, 1, 1,
0.5075367, -3.271897, 3.795853, 0.1529412, 0, 1, 1,
0.5117922, -0.1650414, 0.6271781, 0.1568628, 0, 1, 1,
0.515345, 0.5550929, -0.9527563, 0.1647059, 0, 1, 1,
0.5183754, 0.03486744, 0.267683, 0.1686275, 0, 1, 1,
0.524239, -0.1818841, 2.192667, 0.1764706, 0, 1, 1,
0.5344825, 1.074137, -0.6807347, 0.1803922, 0, 1, 1,
0.5376644, 2.843613, -0.3112989, 0.1882353, 0, 1, 1,
0.5499455, 1.879121, -0.4119884, 0.1921569, 0, 1, 1,
0.5508833, 0.4254476, 3.670151, 0.2, 0, 1, 1,
0.5514432, 0.1380877, 1.527, 0.2078431, 0, 1, 1,
0.5528787, 1.230829, 0.06599988, 0.2117647, 0, 1, 1,
0.5574068, -2.816497, 3.008917, 0.2196078, 0, 1, 1,
0.5606995, 0.4254378, -1.526012, 0.2235294, 0, 1, 1,
0.5617356, 0.07379546, 2.282724, 0.2313726, 0, 1, 1,
0.5714345, -1.555246, 3.121163, 0.2352941, 0, 1, 1,
0.5755314, 1.226599, 1.95423, 0.2431373, 0, 1, 1,
0.575999, 1.187277, 1.483235, 0.2470588, 0, 1, 1,
0.5765423, -0.4118291, 2.36475, 0.254902, 0, 1, 1,
0.5782782, 1.075898, 0.2925004, 0.2588235, 0, 1, 1,
0.5802244, -1.098416, 4.091143, 0.2666667, 0, 1, 1,
0.5812333, 2.222356, 0.473812, 0.2705882, 0, 1, 1,
0.5840766, -0.5169565, 2.254775, 0.2784314, 0, 1, 1,
0.5912279, -0.8522531, 2.545501, 0.282353, 0, 1, 1,
0.5959578, -0.3250441, 0.6255015, 0.2901961, 0, 1, 1,
0.5981994, 0.7356469, 0.5051826, 0.2941177, 0, 1, 1,
0.5989257, -1.459615, 1.566422, 0.3019608, 0, 1, 1,
0.5997351, -0.276666, 3.460889, 0.3098039, 0, 1, 1,
0.6036598, 1.066718, 1.039312, 0.3137255, 0, 1, 1,
0.6085034, 0.7042672, -0.7862663, 0.3215686, 0, 1, 1,
0.6136653, 1.021741, 0.963104, 0.3254902, 0, 1, 1,
0.6141348, 0.09054141, 0.1749329, 0.3333333, 0, 1, 1,
0.6142506, 2.142649, -0.8919745, 0.3372549, 0, 1, 1,
0.6268222, 0.9803742, 0.1914222, 0.345098, 0, 1, 1,
0.635426, -0.3582913, 2.651246, 0.3490196, 0, 1, 1,
0.6396998, 1.509737, -0.5448243, 0.3568628, 0, 1, 1,
0.6467223, -0.4435243, 2.622216, 0.3607843, 0, 1, 1,
0.6488428, -0.1005088, 0.3453691, 0.3686275, 0, 1, 1,
0.6529486, -0.3079253, 3.089402, 0.372549, 0, 1, 1,
0.6553519, 0.4524038, 1.120919, 0.3803922, 0, 1, 1,
0.6556277, -1.010001, 4.475738, 0.3843137, 0, 1, 1,
0.6653617, -0.8652276, 1.0592, 0.3921569, 0, 1, 1,
0.6782139, 0.17418, 1.519117, 0.3960784, 0, 1, 1,
0.6830232, -0.9515276, 2.587245, 0.4039216, 0, 1, 1,
0.6866776, 0.7549618, 0.9053805, 0.4117647, 0, 1, 1,
0.6894057, 0.706637, 1.135763, 0.4156863, 0, 1, 1,
0.690688, 1.578967, 0.4977103, 0.4235294, 0, 1, 1,
0.6942949, -0.004384788, 0.3386515, 0.427451, 0, 1, 1,
0.6955959, 1.367229, 0.004929404, 0.4352941, 0, 1, 1,
0.6987053, -0.9597107, 0.5291138, 0.4392157, 0, 1, 1,
0.7011122, 0.7923567, 0.544289, 0.4470588, 0, 1, 1,
0.7038136, -1.729449, -0.3094445, 0.4509804, 0, 1, 1,
0.7074609, 0.03466182, 0.126118, 0.4588235, 0, 1, 1,
0.7092394, -0.4663486, 1.235788, 0.4627451, 0, 1, 1,
0.7098678, -0.3033624, 2.205503, 0.4705882, 0, 1, 1,
0.7121511, -1.038231, 1.87228, 0.4745098, 0, 1, 1,
0.7121994, -0.1192609, 2.710844, 0.4823529, 0, 1, 1,
0.717152, -0.2579997, 1.896998, 0.4862745, 0, 1, 1,
0.717195, 0.1208039, 0.3747192, 0.4941176, 0, 1, 1,
0.7175611, 0.6533482, 1.558695, 0.5019608, 0, 1, 1,
0.7183284, -0.9299228, 1.324082, 0.5058824, 0, 1, 1,
0.7198224, -0.4123587, 2.952263, 0.5137255, 0, 1, 1,
0.720443, -1.431559, 3.209209, 0.5176471, 0, 1, 1,
0.7212746, -0.02763437, 1.717301, 0.5254902, 0, 1, 1,
0.7287928, 1.823932, -0.711057, 0.5294118, 0, 1, 1,
0.730001, 0.4478039, 0.7320858, 0.5372549, 0, 1, 1,
0.7346118, 0.5947837, 0.7107849, 0.5411765, 0, 1, 1,
0.7370508, -0.04330362, 1.967248, 0.5490196, 0, 1, 1,
0.7388177, -1.042514, 2.382414, 0.5529412, 0, 1, 1,
0.7419953, 1.190361, 1.19001, 0.5607843, 0, 1, 1,
0.7436107, 0.7145503, -0.8204908, 0.5647059, 0, 1, 1,
0.7536559, -1.585824, 3.331458, 0.572549, 0, 1, 1,
0.7587159, 0.9259617, -0.08445581, 0.5764706, 0, 1, 1,
0.7622528, -0.3235494, 2.284596, 0.5843138, 0, 1, 1,
0.7686217, 1.352818, 1.5465, 0.5882353, 0, 1, 1,
0.7713408, 2.476957, 0.6300213, 0.5960785, 0, 1, 1,
0.772477, -1.270608, 0.3588412, 0.6039216, 0, 1, 1,
0.7735309, -1.108207, 2.110482, 0.6078432, 0, 1, 1,
0.7755622, 0.03844489, 2.023487, 0.6156863, 0, 1, 1,
0.7774777, 2.195702, -0.08983882, 0.6196079, 0, 1, 1,
0.7912856, -2.074042, 3.295036, 0.627451, 0, 1, 1,
0.7969676, 0.2283883, 2.807666, 0.6313726, 0, 1, 1,
0.8012228, -1.422704, 3.26003, 0.6392157, 0, 1, 1,
0.8022634, 0.2198512, 2.851968, 0.6431373, 0, 1, 1,
0.8070838, -0.09117655, 0.2968506, 0.6509804, 0, 1, 1,
0.8076701, 1.079493, 1.275677, 0.654902, 0, 1, 1,
0.8228848, -1.196825, 1.567861, 0.6627451, 0, 1, 1,
0.8289347, 0.2337978, 0.3455686, 0.6666667, 0, 1, 1,
0.8350727, 0.8093386, 2.605493, 0.6745098, 0, 1, 1,
0.8351861, 0.4696112, 1.983188, 0.6784314, 0, 1, 1,
0.8428876, 0.02073282, 2.206914, 0.6862745, 0, 1, 1,
0.8452868, 1.474374, 0.8342347, 0.6901961, 0, 1, 1,
0.8493951, -1.544032, 2.274824, 0.6980392, 0, 1, 1,
0.8497007, -0.7685534, 2.110221, 0.7058824, 0, 1, 1,
0.8580164, 0.01601797, 1.300495, 0.7098039, 0, 1, 1,
0.8591344, -0.03384205, 1.150229, 0.7176471, 0, 1, 1,
0.8611208, 1.11733, 0.5108371, 0.7215686, 0, 1, 1,
0.8617101, -1.276184, 2.82728, 0.7294118, 0, 1, 1,
0.8647159, 1.613166, 0.8568989, 0.7333333, 0, 1, 1,
0.8647628, -0.09907017, 2.131368, 0.7411765, 0, 1, 1,
0.8688046, -0.7493718, 0.9905964, 0.7450981, 0, 1, 1,
0.8689179, -0.1182245, 4.843741, 0.7529412, 0, 1, 1,
0.8717625, -0.2557425, 0.9652929, 0.7568628, 0, 1, 1,
0.8793486, 0.1095237, 2.052446, 0.7647059, 0, 1, 1,
0.8835088, -0.2456533, 1.652868, 0.7686275, 0, 1, 1,
0.8893721, -2.016516, 2.117968, 0.7764706, 0, 1, 1,
0.8931741, -0.7953981, 3.702174, 0.7803922, 0, 1, 1,
0.8936759, -0.6031345, 2.4926, 0.7882353, 0, 1, 1,
0.8993742, 0.3073575, 1.370252, 0.7921569, 0, 1, 1,
0.9003333, 0.6253192, 1.158356, 0.8, 0, 1, 1,
0.9093577, 0.8956967, 1.616413, 0.8078431, 0, 1, 1,
0.9118925, 0.5026629, -0.3349787, 0.8117647, 0, 1, 1,
0.9141957, -0.5863702, 2.981895, 0.8196079, 0, 1, 1,
0.9182045, 0.3371572, 0.6635627, 0.8235294, 0, 1, 1,
0.92294, -1.358197, 1.11456, 0.8313726, 0, 1, 1,
0.9247085, -2.483851, 1.975708, 0.8352941, 0, 1, 1,
0.9264712, -0.3843317, 3.217562, 0.8431373, 0, 1, 1,
0.927082, -0.2048723, 1.501983, 0.8470588, 0, 1, 1,
0.946636, 2.10024, 0.472861, 0.854902, 0, 1, 1,
0.9468395, 1.351665, -0.02971316, 0.8588235, 0, 1, 1,
0.9490988, 0.614822, 1.32825, 0.8666667, 0, 1, 1,
0.9502051, 0.1704938, 2.712307, 0.8705882, 0, 1, 1,
0.9634236, -1.007056, 1.325188, 0.8784314, 0, 1, 1,
0.9636779, 1.837855, -0.2471199, 0.8823529, 0, 1, 1,
0.9672557, 0.1539524, 0.7554702, 0.8901961, 0, 1, 1,
0.9725296, 0.3386294, 1.822927, 0.8941177, 0, 1, 1,
0.9746118, 1.779354, 1.261019, 0.9019608, 0, 1, 1,
0.9750225, -0.368582, 1.675482, 0.9098039, 0, 1, 1,
0.9772338, 0.4495282, 1.714184, 0.9137255, 0, 1, 1,
0.9786735, -1.008613, 3.444502, 0.9215686, 0, 1, 1,
0.9844126, 1.452326, -0.2474354, 0.9254902, 0, 1, 1,
0.9862404, 0.7437157, 1.625496, 0.9333333, 0, 1, 1,
0.9869531, 0.8656894, 0.6142175, 0.9372549, 0, 1, 1,
0.9948518, 0.8161871, 0.04531878, 0.945098, 0, 1, 1,
1.007279, -0.9134426, 1.882123, 0.9490196, 0, 1, 1,
1.01512, -0.1450235, 3.188838, 0.9568627, 0, 1, 1,
1.02106, 1.962295, -0.849825, 0.9607843, 0, 1, 1,
1.022055, 1.037356, 0.2729696, 0.9686275, 0, 1, 1,
1.022847, -0.4638858, 2.511032, 0.972549, 0, 1, 1,
1.02292, 0.4577416, 0.8494411, 0.9803922, 0, 1, 1,
1.025536, 1.325331, -0.8548375, 0.9843137, 0, 1, 1,
1.025891, 0.5304365, 1.336683, 0.9921569, 0, 1, 1,
1.032498, -1.239581, 2.764916, 0.9960784, 0, 1, 1,
1.039579, 0.6860172, -0.2285841, 1, 0, 0.9960784, 1,
1.04046, -0.850522, 1.684502, 1, 0, 0.9882353, 1,
1.04135, 0.7474161, 0.003129356, 1, 0, 0.9843137, 1,
1.049291, -0.3284285, 1.305389, 1, 0, 0.9764706, 1,
1.059748, -0.2503552, 3.479834, 1, 0, 0.972549, 1,
1.060559, 0.09934285, 1.67981, 1, 0, 0.9647059, 1,
1.060932, -0.6918645, 1.796249, 1, 0, 0.9607843, 1,
1.069549, 1.027274, 0.9995378, 1, 0, 0.9529412, 1,
1.07211, -0.8254879, 1.604055, 1, 0, 0.9490196, 1,
1.077428, -0.6651717, 1.940714, 1, 0, 0.9411765, 1,
1.077534, -1.821962, 3.200768, 1, 0, 0.9372549, 1,
1.080548, 0.624716, 2.303816, 1, 0, 0.9294118, 1,
1.102624, 0.6492328, -0.06080134, 1, 0, 0.9254902, 1,
1.102899, 1.248057, 1.413033, 1, 0, 0.9176471, 1,
1.104715, 2.263241, -0.4644336, 1, 0, 0.9137255, 1,
1.105179, -1.145645, 2.796693, 1, 0, 0.9058824, 1,
1.113787, 1.600876, 0.6021336, 1, 0, 0.9019608, 1,
1.12795, -0.2789343, 2.835693, 1, 0, 0.8941177, 1,
1.129876, 0.98119, 1.04596, 1, 0, 0.8862745, 1,
1.133983, 1.30925, 1.95465, 1, 0, 0.8823529, 1,
1.136359, 0.2267348, 1.176992, 1, 0, 0.8745098, 1,
1.142527, -1.290848, 3.387888, 1, 0, 0.8705882, 1,
1.14256, 0.09584841, 2.88331, 1, 0, 0.8627451, 1,
1.146108, 0.8370613, 2.096318, 1, 0, 0.8588235, 1,
1.158442, 0.4537266, 3.17425, 1, 0, 0.8509804, 1,
1.163838, -0.722338, 3.37331, 1, 0, 0.8470588, 1,
1.171363, 0.2776254, 3.571583, 1, 0, 0.8392157, 1,
1.172025, -0.00771778, 2.792226, 1, 0, 0.8352941, 1,
1.179181, -0.0135507, 1.852288, 1, 0, 0.827451, 1,
1.184795, 0.02349623, 2.571634, 1, 0, 0.8235294, 1,
1.190898, 1.059653, 1.025031, 1, 0, 0.8156863, 1,
1.192251, 2.069631, -0.1034844, 1, 0, 0.8117647, 1,
1.206318, -1.157007, 2.478201, 1, 0, 0.8039216, 1,
1.214671, -0.3908389, 1.501702, 1, 0, 0.7960784, 1,
1.217517, 0.8360309, 1.688247, 1, 0, 0.7921569, 1,
1.219717, 1.129266, 0.03065907, 1, 0, 0.7843137, 1,
1.222193, -0.4468611, 3.586555, 1, 0, 0.7803922, 1,
1.229545, 0.1949945, 0.7727845, 1, 0, 0.772549, 1,
1.233699, -1.664085, 2.889451, 1, 0, 0.7686275, 1,
1.235119, -0.5384886, 1.484464, 1, 0, 0.7607843, 1,
1.239963, -0.9954751, 0.1517193, 1, 0, 0.7568628, 1,
1.243666, 0.03815966, 0.7056765, 1, 0, 0.7490196, 1,
1.24477, 0.06280122, 1.009639, 1, 0, 0.7450981, 1,
1.250885, -1.744827, 2.206713, 1, 0, 0.7372549, 1,
1.253056, -1.220336, 1.658189, 1, 0, 0.7333333, 1,
1.254694, 0.6285673, 0.4571657, 1, 0, 0.7254902, 1,
1.256499, -1.889789, 2.598497, 1, 0, 0.7215686, 1,
1.260311, 0.1760325, 2.223989, 1, 0, 0.7137255, 1,
1.268178, 0.8010547, 1.189127, 1, 0, 0.7098039, 1,
1.273557, -1.011774, 1.332637, 1, 0, 0.7019608, 1,
1.282743, 0.7958107, 1.615273, 1, 0, 0.6941177, 1,
1.28388, -1.016195, 3.521276, 1, 0, 0.6901961, 1,
1.284543, -0.01101502, 1.815658, 1, 0, 0.682353, 1,
1.288481, -0.1359075, 3.403504, 1, 0, 0.6784314, 1,
1.291056, 0.6212743, 1.105845, 1, 0, 0.6705883, 1,
1.296012, -0.5873188, 4.621678, 1, 0, 0.6666667, 1,
1.296694, -1.083841, 1.403234, 1, 0, 0.6588235, 1,
1.302192, -1.297045, 0.5718437, 1, 0, 0.654902, 1,
1.304119, -0.5646327, 1.580921, 1, 0, 0.6470588, 1,
1.307984, -0.3852457, 0.9237733, 1, 0, 0.6431373, 1,
1.308201, -0.190202, 3.090945, 1, 0, 0.6352941, 1,
1.308849, -1.18489, 0.2190363, 1, 0, 0.6313726, 1,
1.314623, 0.7606551, 0.5465565, 1, 0, 0.6235294, 1,
1.338955, -1.064493, 3.636349, 1, 0, 0.6196079, 1,
1.34885, -1.197136, 1.917424, 1, 0, 0.6117647, 1,
1.357661, -0.7010024, 3.309676, 1, 0, 0.6078432, 1,
1.358268, 1.036884, -1.097634, 1, 0, 0.6, 1,
1.362982, 0.9583427, 1.591059, 1, 0, 0.5921569, 1,
1.365922, 1.593515, -0.8418882, 1, 0, 0.5882353, 1,
1.368981, -1.295383, 2.112915, 1, 0, 0.5803922, 1,
1.373385, -0.6918718, 1.945329, 1, 0, 0.5764706, 1,
1.381905, -0.2866534, 2.229965, 1, 0, 0.5686275, 1,
1.383133, -0.7756404, 2.215325, 1, 0, 0.5647059, 1,
1.38654, 1.167386, 0.5513668, 1, 0, 0.5568628, 1,
1.392817, -1.19262, 0.4647009, 1, 0, 0.5529412, 1,
1.397075, -1.269125, 1.799788, 1, 0, 0.5450981, 1,
1.398172, 0.450911, 1.09928, 1, 0, 0.5411765, 1,
1.413017, 0.2891416, 2.31355, 1, 0, 0.5333334, 1,
1.436925, 1.17091, 1.918682, 1, 0, 0.5294118, 1,
1.439314, -1.008751, 1.930685, 1, 0, 0.5215687, 1,
1.443471, 0.8564083, 0.5654305, 1, 0, 0.5176471, 1,
1.448822, 0.4808976, 2.040605, 1, 0, 0.509804, 1,
1.467047, -0.2087996, 1.541531, 1, 0, 0.5058824, 1,
1.468794, 0.5513384, 1.189321, 1, 0, 0.4980392, 1,
1.491606, -0.3752932, 3.231626, 1, 0, 0.4901961, 1,
1.493149, -2.518369, 2.641802, 1, 0, 0.4862745, 1,
1.494629, 0.6931062, 2.942787, 1, 0, 0.4784314, 1,
1.497613, -0.9551468, 0.8875692, 1, 0, 0.4745098, 1,
1.505117, -0.001791934, 1.420543, 1, 0, 0.4666667, 1,
1.512275, -1.148177, 4.923075, 1, 0, 0.4627451, 1,
1.52037, 0.9274843, -1.104704, 1, 0, 0.454902, 1,
1.520754, -0.9036502, 1.110994, 1, 0, 0.4509804, 1,
1.522555, -0.7365016, 1.094047, 1, 0, 0.4431373, 1,
1.539628, 1.828524, 0.5939469, 1, 0, 0.4392157, 1,
1.544363, -0.08515681, 3.229058, 1, 0, 0.4313726, 1,
1.54864, 0.732834, 2.826122, 1, 0, 0.427451, 1,
1.551287, 0.03717502, 1.716955, 1, 0, 0.4196078, 1,
1.553943, 0.3067123, 2.229134, 1, 0, 0.4156863, 1,
1.559373, -0.6473475, 3.594712, 1, 0, 0.4078431, 1,
1.559931, -1.051654, 0.1203407, 1, 0, 0.4039216, 1,
1.566232, -0.07184538, 0.7330082, 1, 0, 0.3960784, 1,
1.569523, -1.183451, 3.220727, 1, 0, 0.3882353, 1,
1.578161, 0.6159037, 0.9022604, 1, 0, 0.3843137, 1,
1.583651, 0.6674716, 1.293421, 1, 0, 0.3764706, 1,
1.583761, 0.8565363, 1.173989, 1, 0, 0.372549, 1,
1.594955, -0.08479746, 1.986925, 1, 0, 0.3647059, 1,
1.595083, 0.01496616, 1.186954, 1, 0, 0.3607843, 1,
1.611973, 0.8431289, 2.150644, 1, 0, 0.3529412, 1,
1.613258, 1.876702, -0.4660792, 1, 0, 0.3490196, 1,
1.616583, 2.10706, 1.374941, 1, 0, 0.3411765, 1,
1.618173, 0.683421, 1.25581, 1, 0, 0.3372549, 1,
1.629304, -1.385599, 1.768649, 1, 0, 0.3294118, 1,
1.630983, 0.5676619, 2.894, 1, 0, 0.3254902, 1,
1.637035, -2.600009, 3.200108, 1, 0, 0.3176471, 1,
1.640666, 0.8251471, 0.5589627, 1, 0, 0.3137255, 1,
1.658799, -0.9528189, 1.220696, 1, 0, 0.3058824, 1,
1.67041, 0.4747057, -0.007543806, 1, 0, 0.2980392, 1,
1.681152, 0.9604678, 3.276828, 1, 0, 0.2941177, 1,
1.701249, -2.934891, 3.904881, 1, 0, 0.2862745, 1,
1.71025, 1.400897, 0.7582758, 1, 0, 0.282353, 1,
1.729113, -1.755837, 1.926078, 1, 0, 0.2745098, 1,
1.74139, 0.7631614, 0.970864, 1, 0, 0.2705882, 1,
1.743865, -0.210382, -0.7616118, 1, 0, 0.2627451, 1,
1.754115, -0.6556561, 2.286156, 1, 0, 0.2588235, 1,
1.783887, -1.115049, 1.379713, 1, 0, 0.2509804, 1,
1.785782, -1.288007, 1.853348, 1, 0, 0.2470588, 1,
1.804729, -0.4793374, 1.992898, 1, 0, 0.2392157, 1,
1.809534, -1.219282, 2.611598, 1, 0, 0.2352941, 1,
1.824246, -1.992987, 1.734892, 1, 0, 0.227451, 1,
1.83748, -0.2533847, 2.771909, 1, 0, 0.2235294, 1,
1.847305, 0.3934959, 2.786343, 1, 0, 0.2156863, 1,
1.88201, -0.5000888, 3.373291, 1, 0, 0.2117647, 1,
1.883223, 0.5863212, 1.572195, 1, 0, 0.2039216, 1,
1.892767, 0.7576614, 0.4742137, 1, 0, 0.1960784, 1,
1.904577, -1.045442, 0.8684607, 1, 0, 0.1921569, 1,
1.913718, 2.910043, 0.250069, 1, 0, 0.1843137, 1,
1.926844, 0.3919361, 2.091137, 1, 0, 0.1803922, 1,
1.945843, 0.4424195, 2.454757, 1, 0, 0.172549, 1,
1.990268, -1.069951, 1.738966, 1, 0, 0.1686275, 1,
2.011752, -0.5899908, 2.048735, 1, 0, 0.1607843, 1,
2.056184, 0.7915829, 3.397273, 1, 0, 0.1568628, 1,
2.066365, 1.896068, 0.2157341, 1, 0, 0.1490196, 1,
2.126758, -1.413877, 3.503296, 1, 0, 0.145098, 1,
2.130329, 0.6249661, 1.240188, 1, 0, 0.1372549, 1,
2.138669, 1.178128, 2.374685, 1, 0, 0.1333333, 1,
2.175669, -1.066545, 2.941196, 1, 0, 0.1254902, 1,
2.182194, -1.260568, 2.845186, 1, 0, 0.1215686, 1,
2.194521, -0.5014172, 2.39154, 1, 0, 0.1137255, 1,
2.213232, 1.687021, 0.3948559, 1, 0, 0.1098039, 1,
2.250063, -1.699382, 1.933262, 1, 0, 0.1019608, 1,
2.267396, -1.393717, 3.681177, 1, 0, 0.09411765, 1,
2.287099, -0.378865, 2.543059, 1, 0, 0.09019608, 1,
2.316895, -0.6613007, 3.249057, 1, 0, 0.08235294, 1,
2.370711, 0.7023636, 0.9752926, 1, 0, 0.07843138, 1,
2.412443, -1.36235, 1.66087, 1, 0, 0.07058824, 1,
2.494175, -0.2900516, 3.820819, 1, 0, 0.06666667, 1,
2.510212, 1.594318, 0.4162142, 1, 0, 0.05882353, 1,
2.611054, 0.3558681, 0.6807529, 1, 0, 0.05490196, 1,
2.661671, 0.6559545, 1.516818, 1, 0, 0.04705882, 1,
2.891752, -1.370593, 2.168094, 1, 0, 0.04313726, 1,
2.984324, -0.4128943, 1.37131, 1, 0, 0.03529412, 1,
3.009113, -0.08584192, 1.102517, 1, 0, 0.03137255, 1,
3.014027, 0.6234154, 1.220311, 1, 0, 0.02352941, 1,
3.032551, 0.4663011, 1.864334, 1, 0, 0.01960784, 1,
3.089993, 0.457107, 0.8273501, 1, 0, 0.01176471, 1,
3.928415, -0.5762724, 3.620595, 1, 0, 0.007843138, 1
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
0.4163216, -4.366169, -7.665884, 0, -0.5, 0.5, 0.5,
0.4163216, -4.366169, -7.665884, 1, -0.5, 0.5, 0.5,
0.4163216, -4.366169, -7.665884, 1, 1.5, 0.5, 0.5,
0.4163216, -4.366169, -7.665884, 0, 1.5, 0.5, 0.5
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
-4.286372, -0.04395342, -7.665884, 0, -0.5, 0.5, 0.5,
-4.286372, -0.04395342, -7.665884, 1, -0.5, 0.5, 0.5,
-4.286372, -0.04395342, -7.665884, 1, 1.5, 0.5, 0.5,
-4.286372, -0.04395342, -7.665884, 0, 1.5, 0.5, 0.5
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
-4.286372, -4.366169, -0.1403878, 0, -0.5, 0.5, 0.5,
-4.286372, -4.366169, -0.1403878, 1, -0.5, 0.5, 0.5,
-4.286372, -4.366169, -0.1403878, 1, 1.5, 0.5, 0.5,
-4.286372, -4.366169, -0.1403878, 0, 1.5, 0.5, 0.5
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
-2, -3.368735, -5.929231,
2, -3.368735, -5.929231,
-2, -3.368735, -5.929231,
-2, -3.534974, -6.218673,
0, -3.368735, -5.929231,
0, -3.534974, -6.218673,
2, -3.368735, -5.929231,
2, -3.534974, -6.218673
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
-2, -3.867452, -6.797557, 0, -0.5, 0.5, 0.5,
-2, -3.867452, -6.797557, 1, -0.5, 0.5, 0.5,
-2, -3.867452, -6.797557, 1, 1.5, 0.5, 0.5,
-2, -3.867452, -6.797557, 0, 1.5, 0.5, 0.5,
0, -3.867452, -6.797557, 0, -0.5, 0.5, 0.5,
0, -3.867452, -6.797557, 1, -0.5, 0.5, 0.5,
0, -3.867452, -6.797557, 1, 1.5, 0.5, 0.5,
0, -3.867452, -6.797557, 0, 1.5, 0.5, 0.5,
2, -3.867452, -6.797557, 0, -0.5, 0.5, 0.5,
2, -3.867452, -6.797557, 1, -0.5, 0.5, 0.5,
2, -3.867452, -6.797557, 1, 1.5, 0.5, 0.5,
2, -3.867452, -6.797557, 0, 1.5, 0.5, 0.5
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
-3.201135, -3, -5.929231,
-3.201135, 3, -5.929231,
-3.201135, -3, -5.929231,
-3.382008, -3, -6.218673,
-3.201135, -2, -5.929231,
-3.382008, -2, -6.218673,
-3.201135, -1, -5.929231,
-3.382008, -1, -6.218673,
-3.201135, 0, -5.929231,
-3.382008, 0, -6.218673,
-3.201135, 1, -5.929231,
-3.382008, 1, -6.218673,
-3.201135, 2, -5.929231,
-3.382008, 2, -6.218673,
-3.201135, 3, -5.929231,
-3.382008, 3, -6.218673
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
-3.743753, -3, -6.797557, 0, -0.5, 0.5, 0.5,
-3.743753, -3, -6.797557, 1, -0.5, 0.5, 0.5,
-3.743753, -3, -6.797557, 1, 1.5, 0.5, 0.5,
-3.743753, -3, -6.797557, 0, 1.5, 0.5, 0.5,
-3.743753, -2, -6.797557, 0, -0.5, 0.5, 0.5,
-3.743753, -2, -6.797557, 1, -0.5, 0.5, 0.5,
-3.743753, -2, -6.797557, 1, 1.5, 0.5, 0.5,
-3.743753, -2, -6.797557, 0, 1.5, 0.5, 0.5,
-3.743753, -1, -6.797557, 0, -0.5, 0.5, 0.5,
-3.743753, -1, -6.797557, 1, -0.5, 0.5, 0.5,
-3.743753, -1, -6.797557, 1, 1.5, 0.5, 0.5,
-3.743753, -1, -6.797557, 0, 1.5, 0.5, 0.5,
-3.743753, 0, -6.797557, 0, -0.5, 0.5, 0.5,
-3.743753, 0, -6.797557, 1, -0.5, 0.5, 0.5,
-3.743753, 0, -6.797557, 1, 1.5, 0.5, 0.5,
-3.743753, 0, -6.797557, 0, 1.5, 0.5, 0.5,
-3.743753, 1, -6.797557, 0, -0.5, 0.5, 0.5,
-3.743753, 1, -6.797557, 1, -0.5, 0.5, 0.5,
-3.743753, 1, -6.797557, 1, 1.5, 0.5, 0.5,
-3.743753, 1, -6.797557, 0, 1.5, 0.5, 0.5,
-3.743753, 2, -6.797557, 0, -0.5, 0.5, 0.5,
-3.743753, 2, -6.797557, 1, -0.5, 0.5, 0.5,
-3.743753, 2, -6.797557, 1, 1.5, 0.5, 0.5,
-3.743753, 2, -6.797557, 0, 1.5, 0.5, 0.5,
-3.743753, 3, -6.797557, 0, -0.5, 0.5, 0.5,
-3.743753, 3, -6.797557, 1, -0.5, 0.5, 0.5,
-3.743753, 3, -6.797557, 1, 1.5, 0.5, 0.5,
-3.743753, 3, -6.797557, 0, 1.5, 0.5, 0.5
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
-3.201135, -3.368735, -4,
-3.201135, -3.368735, 4,
-3.201135, -3.368735, -4,
-3.382008, -3.534974, -4,
-3.201135, -3.368735, -2,
-3.382008, -3.534974, -2,
-3.201135, -3.368735, 0,
-3.382008, -3.534974, 0,
-3.201135, -3.368735, 2,
-3.382008, -3.534974, 2,
-3.201135, -3.368735, 4,
-3.382008, -3.534974, 4
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
-3.743753, -3.867452, -4, 0, -0.5, 0.5, 0.5,
-3.743753, -3.867452, -4, 1, -0.5, 0.5, 0.5,
-3.743753, -3.867452, -4, 1, 1.5, 0.5, 0.5,
-3.743753, -3.867452, -4, 0, 1.5, 0.5, 0.5,
-3.743753, -3.867452, -2, 0, -0.5, 0.5, 0.5,
-3.743753, -3.867452, -2, 1, -0.5, 0.5, 0.5,
-3.743753, -3.867452, -2, 1, 1.5, 0.5, 0.5,
-3.743753, -3.867452, -2, 0, 1.5, 0.5, 0.5,
-3.743753, -3.867452, 0, 0, -0.5, 0.5, 0.5,
-3.743753, -3.867452, 0, 1, -0.5, 0.5, 0.5,
-3.743753, -3.867452, 0, 1, 1.5, 0.5, 0.5,
-3.743753, -3.867452, 0, 0, 1.5, 0.5, 0.5,
-3.743753, -3.867452, 2, 0, -0.5, 0.5, 0.5,
-3.743753, -3.867452, 2, 1, -0.5, 0.5, 0.5,
-3.743753, -3.867452, 2, 1, 1.5, 0.5, 0.5,
-3.743753, -3.867452, 2, 0, 1.5, 0.5, 0.5,
-3.743753, -3.867452, 4, 0, -0.5, 0.5, 0.5,
-3.743753, -3.867452, 4, 1, -0.5, 0.5, 0.5,
-3.743753, -3.867452, 4, 1, 1.5, 0.5, 0.5,
-3.743753, -3.867452, 4, 0, 1.5, 0.5, 0.5
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
-3.201135, -3.368735, -5.929231,
-3.201135, 3.280828, -5.929231,
-3.201135, -3.368735, 5.648456,
-3.201135, 3.280828, 5.648456,
-3.201135, -3.368735, -5.929231,
-3.201135, -3.368735, 5.648456,
-3.201135, 3.280828, -5.929231,
-3.201135, 3.280828, 5.648456,
-3.201135, -3.368735, -5.929231,
4.033778, -3.368735, -5.929231,
-3.201135, -3.368735, 5.648456,
4.033778, -3.368735, 5.648456,
-3.201135, 3.280828, -5.929231,
4.033778, 3.280828, -5.929231,
-3.201135, 3.280828, 5.648456,
4.033778, 3.280828, 5.648456,
4.033778, -3.368735, -5.929231,
4.033778, 3.280828, -5.929231,
4.033778, -3.368735, 5.648456,
4.033778, 3.280828, 5.648456,
4.033778, -3.368735, -5.929231,
4.033778, -3.368735, 5.648456,
4.033778, 3.280828, -5.929231,
4.033778, 3.280828, 5.648456
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
var radius = 8.108834;
var distance = 36.07712;
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
mvMatrix.translate( -0.4163216, 0.04395342, 0.1403878 );
mvMatrix.scale( 1.211823, 1.318497, 0.7572696 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.07712);
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
Isoniazid<-read.table("Isoniazid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Isoniazid$V2
```

```
## Error in eval(expr, envir, enclos): object 'Isoniazid' not found
```

```r
y<-Isoniazid$V3
```

```
## Error in eval(expr, envir, enclos): object 'Isoniazid' not found
```

```r
z<-Isoniazid$V4
```

```
## Error in eval(expr, envir, enclos): object 'Isoniazid' not found
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
-3.095772, 1.231412, -0.4089167, 0, 0, 1, 1, 1,
-2.578627, -0.6609679, -1.006312, 1, 0, 0, 1, 1,
-2.539494, -0.8167246, -0.5942241, 1, 0, 0, 1, 1,
-2.494958, -0.1899916, -2.490865, 1, 0, 0, 1, 1,
-2.473406, -1.692671, -1.051532, 1, 0, 0, 1, 1,
-2.395377, 0.04323879, -0.4651198, 1, 0, 0, 1, 1,
-2.38095, -0.6900651, -1.824442, 0, 0, 0, 1, 1,
-2.369521, -1.041869, -3.472794, 0, 0, 0, 1, 1,
-2.303833, -0.3557916, -1.730341, 0, 0, 0, 1, 1,
-2.233275, 1.364952, -1.030416, 0, 0, 0, 1, 1,
-2.215059, -0.432212, -2.009272, 0, 0, 0, 1, 1,
-2.190034, -0.1904764, -2.890687, 0, 0, 0, 1, 1,
-2.178587, -0.7022016, -1.975117, 0, 0, 0, 1, 1,
-2.157937, 0.8206983, -2.369059, 1, 1, 1, 1, 1,
-2.154825, -0.5376058, -3.807234, 1, 1, 1, 1, 1,
-2.125584, 0.4897119, -1.195893, 1, 1, 1, 1, 1,
-2.089402, 0.2268224, -3.892318, 1, 1, 1, 1, 1,
-2.053071, -0.3838722, -0.95735, 1, 1, 1, 1, 1,
-2.047571, -1.988482, -2.310706, 1, 1, 1, 1, 1,
-2.036831, -1.128782, -0.7639452, 1, 1, 1, 1, 1,
-2.029433, 0.625073, 0.5530465, 1, 1, 1, 1, 1,
-2.009692, 0.6196625, -0.2148472, 1, 1, 1, 1, 1,
-2.003703, 0.9184183, -0.5767441, 1, 1, 1, 1, 1,
-1.959985, -1.544553, -1.515132, 1, 1, 1, 1, 1,
-1.9562, 1.752305, -0.02491619, 1, 1, 1, 1, 1,
-1.94918, 0.5952728, -2.276564, 1, 1, 1, 1, 1,
-1.919602, 0.8148808, -1.486005, 1, 1, 1, 1, 1,
-1.917968, -0.6667962, -2.812871, 1, 1, 1, 1, 1,
-1.910499, 0.2169292, -1.138752, 0, 0, 1, 1, 1,
-1.909528, -0.5767179, -3.016361, 1, 0, 0, 1, 1,
-1.904073, 0.1280108, -1.608243, 1, 0, 0, 1, 1,
-1.893437, -0.06981396, -2.062689, 1, 0, 0, 1, 1,
-1.891305, -2.156386, -3.462718, 1, 0, 0, 1, 1,
-1.868987, -0.4297613, -1.522951, 1, 0, 0, 1, 1,
-1.831056, -0.742728, -1.106452, 0, 0, 0, 1, 1,
-1.805506, -1.613591, -3.237905, 0, 0, 0, 1, 1,
-1.803194, 0.7469162, -2.504005, 0, 0, 0, 1, 1,
-1.787943, -0.1574823, -0.3109901, 0, 0, 0, 1, 1,
-1.784118, 0.8955703, 0.2204103, 0, 0, 0, 1, 1,
-1.778689, 0.9843371, -2.768176, 0, 0, 0, 1, 1,
-1.766838, -1.291145, -3.857578, 0, 0, 0, 1, 1,
-1.756518, -1.74863, -1.855091, 1, 1, 1, 1, 1,
-1.739445, -0.84088, -2.848678, 1, 1, 1, 1, 1,
-1.734517, 1.031622, -1.41496, 1, 1, 1, 1, 1,
-1.72729, 0.7349845, -1.976623, 1, 1, 1, 1, 1,
-1.698645, -0.9171817, -3.432995, 1, 1, 1, 1, 1,
-1.678946, 1.225394, -2.917209, 1, 1, 1, 1, 1,
-1.678822, -0.7966782, -2.002829, 1, 1, 1, 1, 1,
-1.672872, -0.1304203, -1.673313, 1, 1, 1, 1, 1,
-1.672553, -0.1587352, -1.948959, 1, 1, 1, 1, 1,
-1.669345, -0.5517254, -3.065327, 1, 1, 1, 1, 1,
-1.661964, 0.8107357, -0.6682723, 1, 1, 1, 1, 1,
-1.639272, -1.036647, -2.37082, 1, 1, 1, 1, 1,
-1.630599, 0.2438109, -0.06524839, 1, 1, 1, 1, 1,
-1.613237, -0.6383274, -2.64313, 1, 1, 1, 1, 1,
-1.607668, 0.2780058, -0.9131061, 1, 1, 1, 1, 1,
-1.606162, -1.077018, -3.245231, 0, 0, 1, 1, 1,
-1.601424, -0.9945633, -0.06535355, 1, 0, 0, 1, 1,
-1.597932, -1.193158, -4.30784, 1, 0, 0, 1, 1,
-1.58572, 0.2555312, 0.3439247, 1, 0, 0, 1, 1,
-1.585554, 0.2334408, -3.105453, 1, 0, 0, 1, 1,
-1.568317, -0.487681, -1.292605, 1, 0, 0, 1, 1,
-1.555992, -1.265266, -2.593542, 0, 0, 0, 1, 1,
-1.505232, 1.715704, -0.6645126, 0, 0, 0, 1, 1,
-1.503684, -2.943897, -4.588277, 0, 0, 0, 1, 1,
-1.498117, -1.821426, -1.367671, 0, 0, 0, 1, 1,
-1.496817, 0.7089489, 0.2037539, 0, 0, 0, 1, 1,
-1.481571, 0.9061513, -1.357958, 0, 0, 0, 1, 1,
-1.478879, -0.9722657, -2.868664, 0, 0, 0, 1, 1,
-1.475699, -0.7882168, -3.004833, 1, 1, 1, 1, 1,
-1.443712, -0.32265, -2.45828, 1, 1, 1, 1, 1,
-1.437566, 0.6932492, -1.705543, 1, 1, 1, 1, 1,
-1.430021, 1.491473, -0.8386778, 1, 1, 1, 1, 1,
-1.426302, 2.247313, -2.361008, 1, 1, 1, 1, 1,
-1.416062, 0.6605371, 0.703835, 1, 1, 1, 1, 1,
-1.402921, -0.6059787, -2.413823, 1, 1, 1, 1, 1,
-1.39861, 0.08114303, -1.140175, 1, 1, 1, 1, 1,
-1.385714, -0.3493997, -2.056604, 1, 1, 1, 1, 1,
-1.376553, -0.1375499, -0.1111301, 1, 1, 1, 1, 1,
-1.364513, 1.499192, -0.04608787, 1, 1, 1, 1, 1,
-1.363381, 0.2777132, -2.536911, 1, 1, 1, 1, 1,
-1.359572, -1.214112, -2.12226, 1, 1, 1, 1, 1,
-1.358109, -0.3112565, -3.267197, 1, 1, 1, 1, 1,
-1.348575, -0.004562136, -2.13865, 1, 1, 1, 1, 1,
-1.341401, -0.1024359, -1.618727, 0, 0, 1, 1, 1,
-1.339705, 0.9263501, -0.7688972, 1, 0, 0, 1, 1,
-1.330174, -1.876978, -1.887805, 1, 0, 0, 1, 1,
-1.320871, 2.205476, -0.7768158, 1, 0, 0, 1, 1,
-1.316677, -0.7158292, -2.997182, 1, 0, 0, 1, 1,
-1.315835, -0.6417944, -1.122129, 1, 0, 0, 1, 1,
-1.307179, 0.06203514, -1.175466, 0, 0, 0, 1, 1,
-1.301569, 0.1170557, -0.3278831, 0, 0, 0, 1, 1,
-1.300922, -0.009122319, -0.7012889, 0, 0, 0, 1, 1,
-1.285103, -0.7929072, -1.727024, 0, 0, 0, 1, 1,
-1.274592, -1.281654, -2.504141, 0, 0, 0, 1, 1,
-1.265752, -0.3131827, -0.8015511, 0, 0, 0, 1, 1,
-1.265485, -0.9084998, -0.95194, 0, 0, 0, 1, 1,
-1.249134, 0.9914618, 0.7302733, 1, 1, 1, 1, 1,
-1.247612, -1.613285, -4.047814, 1, 1, 1, 1, 1,
-1.244098, 0.7819303, -1.368141, 1, 1, 1, 1, 1,
-1.24273, -0.08790872, 0.7726381, 1, 1, 1, 1, 1,
-1.241175, 0.01895678, -1.735895, 1, 1, 1, 1, 1,
-1.229487, -0.1769476, -2.956578, 1, 1, 1, 1, 1,
-1.22879, 1.262147, 0.839488, 1, 1, 1, 1, 1,
-1.227141, -0.2461249, -3.164482, 1, 1, 1, 1, 1,
-1.21639, 0.1278099, -1.093799, 1, 1, 1, 1, 1,
-1.212325, 0.9033337, -1.432259, 1, 1, 1, 1, 1,
-1.206453, -1.367184, -2.591639, 1, 1, 1, 1, 1,
-1.205808, -0.4239858, -1.78966, 1, 1, 1, 1, 1,
-1.205577, -1.053206, -3.636701, 1, 1, 1, 1, 1,
-1.191581, -2.386247, -1.145734, 1, 1, 1, 1, 1,
-1.180009, 1.941257, -1.111986, 1, 1, 1, 1, 1,
-1.17384, 1.378452, -0.3920378, 0, 0, 1, 1, 1,
-1.172976, -0.6988765, -3.828322, 1, 0, 0, 1, 1,
-1.171731, 1.085468, -0.09376512, 1, 0, 0, 1, 1,
-1.168271, -0.1689352, 0.6161563, 1, 0, 0, 1, 1,
-1.161085, 0.2026054, -0.3883155, 1, 0, 0, 1, 1,
-1.155106, -0.2160947, -4.770015, 1, 0, 0, 1, 1,
-1.137681, 0.06705536, -1.388095, 0, 0, 0, 1, 1,
-1.133283, -0.431916, -3.7865, 0, 0, 0, 1, 1,
-1.1318, -0.812416, -2.071005, 0, 0, 0, 1, 1,
-1.131492, 0.7824969, -0.6501173, 0, 0, 0, 1, 1,
-1.130468, 1.838453, -0.1093305, 0, 0, 0, 1, 1,
-1.128016, 1.413208, -0.2575501, 0, 0, 0, 1, 1,
-1.125285, 0.2174351, 0.9018893, 0, 0, 0, 1, 1,
-1.121848, 0.9351261, -1.905843, 1, 1, 1, 1, 1,
-1.115947, 0.1172031, -0.9051949, 1, 1, 1, 1, 1,
-1.109202, -0.06399541, -1.890266, 1, 1, 1, 1, 1,
-1.10655, -0.8543788, -3.285053, 1, 1, 1, 1, 1,
-1.09874, -1.154489, -1.273841, 1, 1, 1, 1, 1,
-1.095473, -1.145207, -3.309126, 1, 1, 1, 1, 1,
-1.092986, -1.154103, -1.921924, 1, 1, 1, 1, 1,
-1.081151, 0.8134188, -1.711871, 1, 1, 1, 1, 1,
-1.074549, -0.8171834, -3.025169, 1, 1, 1, 1, 1,
-1.07261, 0.9446595, -0.3294845, 1, 1, 1, 1, 1,
-1.067244, -0.4435548, -2.663545, 1, 1, 1, 1, 1,
-1.062427, 0.781225, -0.4335238, 1, 1, 1, 1, 1,
-1.055553, 0.2738918, -0.3585719, 1, 1, 1, 1, 1,
-1.049882, -0.9826601, -1.262236, 1, 1, 1, 1, 1,
-1.038151, -0.9871896, -1.657947, 1, 1, 1, 1, 1,
-1.036627, -1.433022, -3.228211, 0, 0, 1, 1, 1,
-1.035977, 1.334501, -1.914772, 1, 0, 0, 1, 1,
-1.028643, 1.352254, -0.7035524, 1, 0, 0, 1, 1,
-1.02824, 0.1842851, -3.097228, 1, 0, 0, 1, 1,
-1.026354, -1.097322, -1.73572, 1, 0, 0, 1, 1,
-1.025002, 0.1689189, -1.86226, 1, 0, 0, 1, 1,
-1.020014, -0.5871901, -1.753529, 0, 0, 0, 1, 1,
-1.014831, 1.978329, -0.5766738, 0, 0, 0, 1, 1,
-1.014237, 1.669778, -1.211105, 0, 0, 0, 1, 1,
-1.013027, 0.3121711, -1.05756, 0, 0, 0, 1, 1,
-1.000811, -0.6568314, -1.675902, 0, 0, 0, 1, 1,
-0.9899732, -0.791081, -3.833632, 0, 0, 0, 1, 1,
-0.9878348, -0.3716307, -1.794562, 0, 0, 0, 1, 1,
-0.9860477, -0.4545405, -2.382111, 1, 1, 1, 1, 1,
-0.9795006, 0.3775055, -2.279353, 1, 1, 1, 1, 1,
-0.9785414, 0.3179807, -1.120942, 1, 1, 1, 1, 1,
-0.9747029, -0.5294584, -0.914838, 1, 1, 1, 1, 1,
-0.9725103, 1.369163, -1.543873, 1, 1, 1, 1, 1,
-0.9721441, 0.2030163, -1.582073, 1, 1, 1, 1, 1,
-0.9716661, 0.871821, -0.004080127, 1, 1, 1, 1, 1,
-0.9708133, -0.07869244, -1.228279, 1, 1, 1, 1, 1,
-0.9585114, -0.5927341, -1.863795, 1, 1, 1, 1, 1,
-0.942962, 1.471903, -0.7273861, 1, 1, 1, 1, 1,
-0.9419045, -0.8090004, -3.048094, 1, 1, 1, 1, 1,
-0.9417642, -1.083063, -1.987728, 1, 1, 1, 1, 1,
-0.9398178, -1.644524, -2.72755, 1, 1, 1, 1, 1,
-0.9349678, 1.579183, 0.2325119, 1, 1, 1, 1, 1,
-0.9247497, -1.390851, -3.120629, 1, 1, 1, 1, 1,
-0.9246335, -0.6176285, -4.179068, 0, 0, 1, 1, 1,
-0.9223928, 0.2250177, -0.1510999, 1, 0, 0, 1, 1,
-0.9138695, 1.556264, -0.1912, 1, 0, 0, 1, 1,
-0.9112488, -1.060715, -1.651586, 1, 0, 0, 1, 1,
-0.9050952, 0.4129551, -1.794033, 1, 0, 0, 1, 1,
-0.9019203, -2.064456, -3.659078, 1, 0, 0, 1, 1,
-0.8921328, -1.242494, -0.7029586, 0, 0, 0, 1, 1,
-0.8905739, 0.8726063, -0.4290572, 0, 0, 0, 1, 1,
-0.8881432, -1.341241, -0.321552, 0, 0, 0, 1, 1,
-0.8860066, 0.1796815, -2.561018, 0, 0, 0, 1, 1,
-0.8859051, -0.09199958, -1.480225, 0, 0, 0, 1, 1,
-0.8845199, 1.488437, -0.5484055, 0, 0, 0, 1, 1,
-0.8823709, -0.6965802, -2.601171, 0, 0, 0, 1, 1,
-0.8768585, -1.328053, -1.221661, 1, 1, 1, 1, 1,
-0.8629912, -0.3501185, -2.79281, 1, 1, 1, 1, 1,
-0.8629546, -0.207673, -2.226563, 1, 1, 1, 1, 1,
-0.8620132, -1.677501, -5.225611, 1, 1, 1, 1, 1,
-0.859955, 1.312658, -0.9877927, 1, 1, 1, 1, 1,
-0.8559068, -2.318366, -2.558906, 1, 1, 1, 1, 1,
-0.8543309, 0.6061611, -1.191496, 1, 1, 1, 1, 1,
-0.8375953, 0.2211657, -1.347492, 1, 1, 1, 1, 1,
-0.8358809, -0.8128912, -1.624666, 1, 1, 1, 1, 1,
-0.8358212, -0.4265127, -2.91942, 1, 1, 1, 1, 1,
-0.8342896, -0.6143214, -2.17603, 1, 1, 1, 1, 1,
-0.8319949, -0.3972669, -2.339249, 1, 1, 1, 1, 1,
-0.8319032, 0.3227262, 0.140556, 1, 1, 1, 1, 1,
-0.8246019, -0.4239843, -4.281179, 1, 1, 1, 1, 1,
-0.8186187, 0.3184289, -1.627694, 1, 1, 1, 1, 1,
-0.8157079, -1.913141, -1.149587, 0, 0, 1, 1, 1,
-0.8137118, -1.225898, -2.709196, 1, 0, 0, 1, 1,
-0.8028861, -0.6107166, -2.961149, 1, 0, 0, 1, 1,
-0.8005469, 0.08875203, -2.523459, 1, 0, 0, 1, 1,
-0.7945013, -0.04612263, -0.04461974, 1, 0, 0, 1, 1,
-0.7941208, 0.9112918, -1.705855, 1, 0, 0, 1, 1,
-0.7933413, 1.328296, 0.3046656, 0, 0, 0, 1, 1,
-0.7918058, 0.2599172, -0.815906, 0, 0, 0, 1, 1,
-0.7912118, 1.48621, 0.2814736, 0, 0, 0, 1, 1,
-0.7907683, 0.285625, 0.4196276, 0, 0, 0, 1, 1,
-0.7877358, -0.04590081, 0.1904207, 0, 0, 0, 1, 1,
-0.7697381, -0.6841042, -0.9136056, 0, 0, 0, 1, 1,
-0.765066, -1.558827, -2.625863, 0, 0, 0, 1, 1,
-0.7470732, 0.2535979, -1.135017, 1, 1, 1, 1, 1,
-0.746855, -2.142628, -2.054896, 1, 1, 1, 1, 1,
-0.7440239, -0.4331608, -2.113519, 1, 1, 1, 1, 1,
-0.7332906, -0.2768536, -1.343739, 1, 1, 1, 1, 1,
-0.7331725, -0.7815111, -0.4490491, 1, 1, 1, 1, 1,
-0.7321289, -1.277355, -1.873294, 1, 1, 1, 1, 1,
-0.7283888, 0.4125995, -1.426021, 1, 1, 1, 1, 1,
-0.7276078, -1.50562, -2.225009, 1, 1, 1, 1, 1,
-0.7250975, 0.6788661, -1.722836, 1, 1, 1, 1, 1,
-0.7224971, 0.4488601, -1.545168, 1, 1, 1, 1, 1,
-0.7190077, 0.8787937, -0.6574299, 1, 1, 1, 1, 1,
-0.7148675, 0.1981807, -1.240927, 1, 1, 1, 1, 1,
-0.7148061, 0.3638157, -1.158269, 1, 1, 1, 1, 1,
-0.7130537, 1.337252, -1.055844, 1, 1, 1, 1, 1,
-0.7088268, 1.636885, -0.5160593, 1, 1, 1, 1, 1,
-0.7068172, 0.127624, -1.013174, 0, 0, 1, 1, 1,
-0.6930236, -0.1733076, -2.424792, 1, 0, 0, 1, 1,
-0.692158, 0.5076249, 0.7815116, 1, 0, 0, 1, 1,
-0.6798417, 0.6558062, -0.3530133, 1, 0, 0, 1, 1,
-0.6791728, -0.7766612, -2.078231, 1, 0, 0, 1, 1,
-0.6762755, -1.018138, -3.88879, 1, 0, 0, 1, 1,
-0.6744869, 0.2692148, -0.828004, 0, 0, 0, 1, 1,
-0.6709327, 1.719512, 0.3618162, 0, 0, 0, 1, 1,
-0.6697548, -0.08292014, -1.302116, 0, 0, 0, 1, 1,
-0.667291, 0.4507051, -2.629222, 0, 0, 0, 1, 1,
-0.6670321, 0.1497656, -1.927283, 0, 0, 0, 1, 1,
-0.6612911, -0.1045858, -2.735358, 0, 0, 0, 1, 1,
-0.6535347, -0.2464313, -1.151105, 0, 0, 0, 1, 1,
-0.6477084, 1.550027, -0.3305952, 1, 1, 1, 1, 1,
-0.6476313, -0.2492955, -3.527292, 1, 1, 1, 1, 1,
-0.6422603, 1.852693, -0.2553624, 1, 1, 1, 1, 1,
-0.6421807, 0.9632615, -0.2782829, 1, 1, 1, 1, 1,
-0.6411412, -0.9280319, -1.354387, 1, 1, 1, 1, 1,
-0.640313, 0.5117604, -0.8348681, 1, 1, 1, 1, 1,
-0.6356664, 0.8156288, -0.2913013, 1, 1, 1, 1, 1,
-0.6338978, -0.5480184, -0.9000458, 1, 1, 1, 1, 1,
-0.6302668, -0.5523201, -0.9618065, 1, 1, 1, 1, 1,
-0.6301154, -0.15062, -2.593685, 1, 1, 1, 1, 1,
-0.6276988, 0.6827598, -0.5816274, 1, 1, 1, 1, 1,
-0.6260372, 1.099274, 0.8191548, 1, 1, 1, 1, 1,
-0.6241807, -0.2451757, -2.241944, 1, 1, 1, 1, 1,
-0.6237886, -1.022671, -3.087713, 1, 1, 1, 1, 1,
-0.6223091, -1.367149, -4.298372, 1, 1, 1, 1, 1,
-0.6203808, -1.760929, -2.294686, 0, 0, 1, 1, 1,
-0.6189749, -0.9158031, -0.9905455, 1, 0, 0, 1, 1,
-0.6105447, 1.159449, -1.707703, 1, 0, 0, 1, 1,
-0.609596, 0.01021599, -1.824036, 1, 0, 0, 1, 1,
-0.6086283, -0.6401873, -2.506564, 1, 0, 0, 1, 1,
-0.6043336, -0.4912856, -2.541711, 1, 0, 0, 1, 1,
-0.601446, -0.3287778, -1.283556, 0, 0, 0, 1, 1,
-0.5999229, -1.735058, -2.160972, 0, 0, 0, 1, 1,
-0.5933285, 2.651919, 1.466337, 0, 0, 0, 1, 1,
-0.5917658, 2.115505, 1.432957, 0, 0, 0, 1, 1,
-0.5874829, -0.7418635, -2.42577, 0, 0, 0, 1, 1,
-0.5814064, 1.190387, 1.286855, 0, 0, 0, 1, 1,
-0.5810708, 1.352537, -0.2183257, 0, 0, 0, 1, 1,
-0.5770519, 0.6318509, -1.109508, 1, 1, 1, 1, 1,
-0.5768464, -0.4945638, -1.246494, 1, 1, 1, 1, 1,
-0.5668298, 0.173391, -2.886097, 1, 1, 1, 1, 1,
-0.5639501, -0.6102864, -1.443044, 1, 1, 1, 1, 1,
-0.5637695, -0.06158528, -2.063788, 1, 1, 1, 1, 1,
-0.5637605, 0.05889058, -1.24668, 1, 1, 1, 1, 1,
-0.5516282, -1.313276, -3.177279, 1, 1, 1, 1, 1,
-0.5465674, 1.917296, -1.696174, 1, 1, 1, 1, 1,
-0.5457428, 0.5063481, -2.267848, 1, 1, 1, 1, 1,
-0.5430388, 0.1826601, -0.7251149, 1, 1, 1, 1, 1,
-0.54254, 0.6009157, -0.4622895, 1, 1, 1, 1, 1,
-0.5354565, 0.9210423, -1.834479, 1, 1, 1, 1, 1,
-0.5317565, 0.5388852, 0.859069, 1, 1, 1, 1, 1,
-0.5287503, 0.5669706, -0.6549576, 1, 1, 1, 1, 1,
-0.5223511, -0.7238518, -3.417297, 1, 1, 1, 1, 1,
-0.5201375, 0.8513803, 0.3088245, 0, 0, 1, 1, 1,
-0.5165816, 2.029783, -0.4385356, 1, 0, 0, 1, 1,
-0.514788, 0.4568731, -0.5867508, 1, 0, 0, 1, 1,
-0.5142735, 1.005969, -0.2444831, 1, 0, 0, 1, 1,
-0.5125218, 1.476942, 1.406767, 1, 0, 0, 1, 1,
-0.5110189, 0.6724331, -2.718337, 1, 0, 0, 1, 1,
-0.5100464, -1.962792, -2.150143, 0, 0, 0, 1, 1,
-0.5060051, -2.081424, -4.579964, 0, 0, 0, 1, 1,
-0.5030789, -1.35105, -1.687963, 0, 0, 0, 1, 1,
-0.5026581, -1.073043, -3.300562, 0, 0, 0, 1, 1,
-0.5002487, -1.193902, -3.040452, 0, 0, 0, 1, 1,
-0.5000693, -0.2133574, -2.1456, 0, 0, 0, 1, 1,
-0.4980603, -1.266695, -2.173162, 0, 0, 0, 1, 1,
-0.4963797, -0.1309318, -1.344578, 1, 1, 1, 1, 1,
-0.4947139, 2.789327, 0.1182779, 1, 1, 1, 1, 1,
-0.4907738, 0.5077454, -0.3688754, 1, 1, 1, 1, 1,
-0.4884548, 0.7282187, -1.474792, 1, 1, 1, 1, 1,
-0.4863228, -1.483806, -2.992395, 1, 1, 1, 1, 1,
-0.4811138, 0.2086005, -1.003689, 1, 1, 1, 1, 1,
-0.478648, 0.01265811, -2.515904, 1, 1, 1, 1, 1,
-0.4777987, -0.4949168, -3.142887, 1, 1, 1, 1, 1,
-0.4775125, 0.06778418, -0.4697669, 1, 1, 1, 1, 1,
-0.4748024, 0.4787883, -0.9253004, 1, 1, 1, 1, 1,
-0.472807, 0.1404766, -2.160212, 1, 1, 1, 1, 1,
-0.4697602, 0.2196417, -0.3727734, 1, 1, 1, 1, 1,
-0.4692562, 1.01349, -0.550779, 1, 1, 1, 1, 1,
-0.4638715, -0.431927, -3.273419, 1, 1, 1, 1, 1,
-0.4617828, 0.5493195, 0.3552894, 1, 1, 1, 1, 1,
-0.4616197, -0.03949924, -3.037047, 0, 0, 1, 1, 1,
-0.4605105, -0.8839245, -2.970169, 1, 0, 0, 1, 1,
-0.459379, 1.495242, -1.125366, 1, 0, 0, 1, 1,
-0.4524127, 0.2300726, -0.2170406, 1, 0, 0, 1, 1,
-0.4504738, 2.694467, -2.219416, 1, 0, 0, 1, 1,
-0.4500732, 0.7024434, 0.1620549, 1, 0, 0, 1, 1,
-0.4469339, 0.1769248, -0.2709147, 0, 0, 0, 1, 1,
-0.4466215, 0.4982275, -1.765152, 0, 0, 0, 1, 1,
-0.4461441, 0.6959617, -1.256155, 0, 0, 0, 1, 1,
-0.4422432, -1.254612, -3.063359, 0, 0, 0, 1, 1,
-0.437067, -0.5410329, -0.9964904, 0, 0, 0, 1, 1,
-0.4354005, -0.2096303, -2.932855, 0, 0, 0, 1, 1,
-0.4353995, -0.4200154, -3.59904, 0, 0, 0, 1, 1,
-0.435154, -1.75, -4.295114, 1, 1, 1, 1, 1,
-0.4318908, 0.7511214, -3.286257, 1, 1, 1, 1, 1,
-0.4271308, 0.6142929, 1.411544, 1, 1, 1, 1, 1,
-0.4252549, -0.922206, -2.377866, 1, 1, 1, 1, 1,
-0.4209311, -1.398495, -5.760624, 1, 1, 1, 1, 1,
-0.4150378, -1.252276, -3.503314, 1, 1, 1, 1, 1,
-0.4144829, 0.3486271, -1.827017, 1, 1, 1, 1, 1,
-0.4100341, 0.04094119, -1.142887, 1, 1, 1, 1, 1,
-0.4062683, 1.845472, 0.02960662, 1, 1, 1, 1, 1,
-0.4059418, 1.073508, 0.4130524, 1, 1, 1, 1, 1,
-0.4006244, -0.7812861, -1.622798, 1, 1, 1, 1, 1,
-0.3965054, -1.020532, -2.511553, 1, 1, 1, 1, 1,
-0.3955673, -0.9160986, -2.58813, 1, 1, 1, 1, 1,
-0.3930134, -0.9435344, -2.014285, 1, 1, 1, 1, 1,
-0.3901513, 0.4229898, -0.7920663, 1, 1, 1, 1, 1,
-0.3885514, 1.527022, -0.754337, 0, 0, 1, 1, 1,
-0.3849813, 0.3149257, -1.307575, 1, 0, 0, 1, 1,
-0.384836, 0.5225965, -3.030813, 1, 0, 0, 1, 1,
-0.3839843, 1.596038, 1.816054, 1, 0, 0, 1, 1,
-0.3812248, 0.4951166, -0.3056326, 1, 0, 0, 1, 1,
-0.3782408, 0.3579569, -1.889095, 1, 0, 0, 1, 1,
-0.3758526, 1.170248, 0.7548754, 0, 0, 0, 1, 1,
-0.3732301, 1.397144, -1.41521, 0, 0, 0, 1, 1,
-0.3702177, 0.1043543, -2.181858, 0, 0, 0, 1, 1,
-0.3644243, -0.897097, -2.665268, 0, 0, 0, 1, 1,
-0.3607374, -0.9617415, -2.069514, 0, 0, 0, 1, 1,
-0.3602211, 0.9354073, -0.9566112, 0, 0, 0, 1, 1,
-0.359696, 1.682734, -1.533141, 0, 0, 0, 1, 1,
-0.3591494, -1.090359, -1.210398, 1, 1, 1, 1, 1,
-0.3540729, 0.5739493, 0.2238752, 1, 1, 1, 1, 1,
-0.3536792, 0.3173339, -1.05851, 1, 1, 1, 1, 1,
-0.3535394, 0.3366432, 0.7556899, 1, 1, 1, 1, 1,
-0.353035, 0.4330766, -0.4559168, 1, 1, 1, 1, 1,
-0.3509904, 0.2813866, -1.89045, 1, 1, 1, 1, 1,
-0.3494412, -0.8128365, -0.9908336, 1, 1, 1, 1, 1,
-0.3471586, -0.4192243, -2.050965, 1, 1, 1, 1, 1,
-0.3458415, -0.3222747, -2.715596, 1, 1, 1, 1, 1,
-0.3436777, -0.219081, -2.223361, 1, 1, 1, 1, 1,
-0.3404719, 0.005717113, -1.926282, 1, 1, 1, 1, 1,
-0.3367057, 0.2438347, -1.320596, 1, 1, 1, 1, 1,
-0.3338195, -1.277552, -2.888775, 1, 1, 1, 1, 1,
-0.3326736, -0.3261214, -2.48122, 1, 1, 1, 1, 1,
-0.3319258, -0.1272944, -0.1822973, 1, 1, 1, 1, 1,
-0.3279805, -0.2756095, -2.684639, 0, 0, 1, 1, 1,
-0.322219, -0.9059102, -3.141569, 1, 0, 0, 1, 1,
-0.3172099, 0.5759, -1.651944, 1, 0, 0, 1, 1,
-0.3154477, -0.5469533, -2.164764, 1, 0, 0, 1, 1,
-0.3119885, -1.520595, -3.492228, 1, 0, 0, 1, 1,
-0.3108611, -0.57388, -1.510829, 1, 0, 0, 1, 1,
-0.3099637, 0.2317219, -1.308351, 0, 0, 0, 1, 1,
-0.306049, -0.6863513, -2.250456, 0, 0, 0, 1, 1,
-0.3044233, -0.9385668, -2.372779, 0, 0, 0, 1, 1,
-0.3023076, -0.7895789, -3.937919, 0, 0, 0, 1, 1,
-0.2995372, -0.02521267, -2.241405, 0, 0, 0, 1, 1,
-0.2979474, -0.2233848, -2.450608, 0, 0, 0, 1, 1,
-0.2957643, 0.6411262, -0.7179914, 0, 0, 0, 1, 1,
-0.2941456, 0.1555012, -0.06690869, 1, 1, 1, 1, 1,
-0.2940421, -0.2972991, -2.872515, 1, 1, 1, 1, 1,
-0.2868353, -0.08597974, -2.482435, 1, 1, 1, 1, 1,
-0.2865665, 0.02840861, -1.807443, 1, 1, 1, 1, 1,
-0.282364, -0.4679843, -4.307305, 1, 1, 1, 1, 1,
-0.2806907, 0.2941101, 0.01992967, 1, 1, 1, 1, 1,
-0.2781096, 0.1898833, 0.3708346, 1, 1, 1, 1, 1,
-0.2735049, -0.8716196, -3.02486, 1, 1, 1, 1, 1,
-0.2703782, -0.2817571, -0.9768789, 1, 1, 1, 1, 1,
-0.2691273, -0.4568382, -1.89715, 1, 1, 1, 1, 1,
-0.2668215, -1.564013, -3.880152, 1, 1, 1, 1, 1,
-0.2667081, -0.5481756, -4.166687, 1, 1, 1, 1, 1,
-0.263529, 2.449561, 0.7641472, 1, 1, 1, 1, 1,
-0.262316, -0.5656046, -3.111399, 1, 1, 1, 1, 1,
-0.2545699, -0.385631, -2.263381, 1, 1, 1, 1, 1,
-0.253687, -1.344883, -2.172275, 0, 0, 1, 1, 1,
-0.2476964, -0.1423531, -1.336019, 1, 0, 0, 1, 1,
-0.245425, -0.6988987, -2.699065, 1, 0, 0, 1, 1,
-0.243967, 0.6830562, -1.607556, 1, 0, 0, 1, 1,
-0.2410042, -0.2082874, -2.459961, 1, 0, 0, 1, 1,
-0.2399382, -0.520117, -1.467703, 1, 0, 0, 1, 1,
-0.2369444, -1.68522, -4.002123, 0, 0, 0, 1, 1,
-0.235318, -0.2788194, -2.396498, 0, 0, 0, 1, 1,
-0.2243741, 0.3721431, 1.040127, 0, 0, 0, 1, 1,
-0.2238453, 1.135746, 0.8941535, 0, 0, 0, 1, 1,
-0.2237401, 0.3299299, 0.2294944, 0, 0, 0, 1, 1,
-0.2185037, -0.3691352, -3.682539, 0, 0, 0, 1, 1,
-0.2173316, 1.413791, -0.9673584, 0, 0, 0, 1, 1,
-0.2075541, -0.2957146, -1.582313, 1, 1, 1, 1, 1,
-0.2043016, 0.3478556, -1.039167, 1, 1, 1, 1, 1,
-0.2035376, 0.3433748, 0.9132467, 1, 1, 1, 1, 1,
-0.2033783, -0.9865759, -2.461673, 1, 1, 1, 1, 1,
-0.2026146, 0.09008862, -0.6674519, 1, 1, 1, 1, 1,
-0.2009906, -1.64659, -2.432158, 1, 1, 1, 1, 1,
-0.2002217, 1.487803, -0.4854395, 1, 1, 1, 1, 1,
-0.2001943, 0.8104751, -0.007036229, 1, 1, 1, 1, 1,
-0.199549, -0.8080863, -1.210291, 1, 1, 1, 1, 1,
-0.1945277, 0.4222775, -1.092122, 1, 1, 1, 1, 1,
-0.1933629, -0.7644115, -3.853635, 1, 1, 1, 1, 1,
-0.1857435, -1.013356, -4.195416, 1, 1, 1, 1, 1,
-0.1843507, 0.8823208, 0.4990277, 1, 1, 1, 1, 1,
-0.1841424, 0.1506393, -0.8778218, 1, 1, 1, 1, 1,
-0.1838872, -1.319896, -3.771978, 1, 1, 1, 1, 1,
-0.1772292, -0.135924, -3.104035, 0, 0, 1, 1, 1,
-0.1747958, 1.101976, -0.003684417, 1, 0, 0, 1, 1,
-0.174259, 1.330824, -1.219361, 1, 0, 0, 1, 1,
-0.1690868, -1.113506, -1.237627, 1, 0, 0, 1, 1,
-0.166075, 0.1258805, -0.1186686, 1, 0, 0, 1, 1,
-0.1628968, 2.095327, -1.474009, 1, 0, 0, 1, 1,
-0.155363, -0.01519041, -1.679201, 0, 0, 0, 1, 1,
-0.1552931, 0.435749, -0.8600774, 0, 0, 0, 1, 1,
-0.1541147, 0.2582465, -2.074637, 0, 0, 0, 1, 1,
-0.1510986, -2.208883, -3.727983, 0, 0, 0, 1, 1,
-0.1448321, 1.133387, 0.7824997, 0, 0, 0, 1, 1,
-0.1445213, 0.7428566, -1.1132, 0, 0, 0, 1, 1,
-0.1412629, -2.051377, -3.738339, 0, 0, 0, 1, 1,
-0.138898, 0.2837408, 1.159923, 1, 1, 1, 1, 1,
-0.1364579, 1.456099, -0.03973604, 1, 1, 1, 1, 1,
-0.1363973, -0.4366534, -3.966205, 1, 1, 1, 1, 1,
-0.1345865, 0.2671105, 1.290336, 1, 1, 1, 1, 1,
-0.1339206, 0.7157995, -0.4114155, 1, 1, 1, 1, 1,
-0.1320822, -1.120445, -2.715774, 1, 1, 1, 1, 1,
-0.1280386, 0.2748617, -0.6864181, 1, 1, 1, 1, 1,
-0.1264172, -0.3213443, -4.826715, 1, 1, 1, 1, 1,
-0.1252793, -1.040957, -1.792252, 1, 1, 1, 1, 1,
-0.1207176, -0.0003088281, -0.4116388, 1, 1, 1, 1, 1,
-0.1197775, 1.528362, -0.6710255, 1, 1, 1, 1, 1,
-0.1187995, 1.993284, -1.195604, 1, 1, 1, 1, 1,
-0.1174997, 0.2191073, -0.6780551, 1, 1, 1, 1, 1,
-0.1145369, -0.03558533, -2.534161, 1, 1, 1, 1, 1,
-0.1134311, -1.398361, -4.567726, 1, 1, 1, 1, 1,
-0.1117074, 1.143106, -0.8492957, 0, 0, 1, 1, 1,
-0.1067366, 0.2620811, 0.404384, 1, 0, 0, 1, 1,
-0.1016582, 0.006857174, -1.715009, 1, 0, 0, 1, 1,
-0.09678595, 1.933134, 1.00098, 1, 0, 0, 1, 1,
-0.09634457, -1.172882, -4.201063, 1, 0, 0, 1, 1,
-0.0942552, 0.8963357, -1.3962, 1, 0, 0, 1, 1,
-0.09259637, -1.650635, -1.851705, 0, 0, 0, 1, 1,
-0.09111657, -1.223387, -4.575223, 0, 0, 0, 1, 1,
-0.08920549, 0.1840444, -0.380585, 0, 0, 0, 1, 1,
-0.08332853, -1.273517, -2.908735, 0, 0, 0, 1, 1,
-0.08268543, 1.3625, 0.3774514, 0, 0, 0, 1, 1,
-0.08122245, -0.3287825, -2.903476, 0, 0, 0, 1, 1,
-0.07847423, 0.8587759, -0.3010268, 0, 0, 0, 1, 1,
-0.07743819, 0.2917558, 0.9921197, 1, 1, 1, 1, 1,
-0.07652226, 0.1054654, -0.3289431, 1, 1, 1, 1, 1,
-0.07579278, -2.27889, -1.818906, 1, 1, 1, 1, 1,
-0.07385247, -0.1239889, -2.088706, 1, 1, 1, 1, 1,
-0.06735525, 0.06099633, 0.03846933, 1, 1, 1, 1, 1,
-0.06538179, -0.5054629, -1.960661, 1, 1, 1, 1, 1,
-0.06118201, -0.1997848, -3.459311, 1, 1, 1, 1, 1,
-0.05645924, -2.317779, -5.360066, 1, 1, 1, 1, 1,
-0.05565451, -0.280001, -4.631235, 1, 1, 1, 1, 1,
-0.0477984, 0.7940652, -0.8146168, 1, 1, 1, 1, 1,
-0.04669529, 1.699101, -0.2566314, 1, 1, 1, 1, 1,
-0.04435696, 0.5770175, -1.751875, 1, 1, 1, 1, 1,
-0.04251983, 0.5146357, 0.1920817, 1, 1, 1, 1, 1,
-0.04187967, -0.9003916, -2.758192, 1, 1, 1, 1, 1,
-0.03977942, -0.5806378, -2.272729, 1, 1, 1, 1, 1,
-0.0363212, -0.4782342, -2.974373, 0, 0, 1, 1, 1,
-0.03455997, -0.2934637, -3.976824, 1, 0, 0, 1, 1,
-0.03370371, -0.5332487, -4.261024, 1, 0, 0, 1, 1,
-0.03334958, 0.3884753, -0.5841689, 1, 0, 0, 1, 1,
-0.03117996, -1.479325, -2.95979, 1, 0, 0, 1, 1,
-0.03072371, -0.8761736, -1.430874, 1, 0, 0, 1, 1,
-0.02744852, -1.957273, -4.299396, 0, 0, 0, 1, 1,
-0.0264315, 0.05438792, -0.03990443, 0, 0, 0, 1, 1,
-0.02329109, 1.267857, 1.884891, 0, 0, 0, 1, 1,
-0.02299392, -0.01925029, -1.328969, 0, 0, 0, 1, 1,
-0.01928873, -0.9415752, -2.893317, 0, 0, 0, 1, 1,
-0.01925593, -0.4222584, -3.216096, 0, 0, 0, 1, 1,
-0.01777977, -0.2507989, -2.649123, 0, 0, 0, 1, 1,
-0.01440591, -0.2262389, -2.551671, 1, 1, 1, 1, 1,
-0.01105341, -1.154579, -3.479765, 1, 1, 1, 1, 1,
-0.01075756, 1.083275, -1.111016, 1, 1, 1, 1, 1,
-0.006104409, -1.911191, -2.326819, 1, 1, 1, 1, 1,
-0.006099652, 0.3538632, 0.4091174, 1, 1, 1, 1, 1,
-0.00594212, 2.738241, -1.132073, 1, 1, 1, 1, 1,
-0.005889772, 3.18399, -0.5091346, 1, 1, 1, 1, 1,
-0.003443533, -0.7777488, -3.09866, 1, 1, 1, 1, 1,
-0.003350046, -0.5575742, -4.236149, 1, 1, 1, 1, 1,
0.007712468, 0.8631121, 0.7782553, 1, 1, 1, 1, 1,
0.01121234, -1.168973, 3.90457, 1, 1, 1, 1, 1,
0.01262527, 0.4345472, 0.1939968, 1, 1, 1, 1, 1,
0.0132107, -0.22968, 2.599651, 1, 1, 1, 1, 1,
0.01784444, -0.3837948, 4.343329, 1, 1, 1, 1, 1,
0.02710168, -1.378834, 5.479848, 1, 1, 1, 1, 1,
0.03204106, -0.0945517, 1.597219, 0, 0, 1, 1, 1,
0.03356623, 0.6581107, -0.1613946, 1, 0, 0, 1, 1,
0.03676158, -0.6818033, 1.254254, 1, 0, 0, 1, 1,
0.04069922, 0.4052879, -0.5751902, 1, 0, 0, 1, 1,
0.04135219, -1.087676, 3.923, 1, 0, 0, 1, 1,
0.04175097, -0.2852872, 4.247115, 1, 0, 0, 1, 1,
0.04234869, 1.255756, 0.41228, 0, 0, 0, 1, 1,
0.04243404, -0.2517397, 3.125017, 0, 0, 0, 1, 1,
0.04698591, 0.5105962, -1.440131, 0, 0, 0, 1, 1,
0.04713641, -0.9826279, 3.927146, 0, 0, 0, 1, 1,
0.04794546, -0.2327467, 2.780726, 0, 0, 0, 1, 1,
0.04837694, 0.5495716, -1.983169, 0, 0, 0, 1, 1,
0.05089195, 0.8921118, 0.653641, 0, 0, 0, 1, 1,
0.05314822, 0.3334575, 1.949489, 1, 1, 1, 1, 1,
0.05923453, 0.1722332, 1.875281, 1, 1, 1, 1, 1,
0.06061486, -0.05859843, 2.065201, 1, 1, 1, 1, 1,
0.06092254, 0.01460777, 2.806242, 1, 1, 1, 1, 1,
0.06125548, 0.2739769, -0.4668991, 1, 1, 1, 1, 1,
0.06166029, -1.512442, 4.280618, 1, 1, 1, 1, 1,
0.06269918, -0.3906236, 2.442631, 1, 1, 1, 1, 1,
0.06301157, 0.2045523, 0.8936505, 1, 1, 1, 1, 1,
0.06511015, 1.043131, -0.3688846, 1, 1, 1, 1, 1,
0.06950267, 0.3541583, -0.459852, 1, 1, 1, 1, 1,
0.07014661, -1.234797, 3.321187, 1, 1, 1, 1, 1,
0.07574063, -0.9285711, 2.425342, 1, 1, 1, 1, 1,
0.07575828, -1.555281, 2.424837, 1, 1, 1, 1, 1,
0.07895342, 1.142326, -1.03056, 1, 1, 1, 1, 1,
0.07967436, 0.7248602, -0.3737572, 1, 1, 1, 1, 1,
0.08308429, 1.734461, -0.3845376, 0, 0, 1, 1, 1,
0.08438776, -0.6379443, 0.9645088, 1, 0, 0, 1, 1,
0.08545627, -1.197743, 1.889182, 1, 0, 0, 1, 1,
0.08982848, 0.8652894, 0.1621147, 1, 0, 0, 1, 1,
0.09003362, 0.5044498, -0.04452386, 1, 0, 0, 1, 1,
0.09222617, 1.285031, -0.7626538, 1, 0, 0, 1, 1,
0.09384657, -0.1503958, 2.662061, 0, 0, 0, 1, 1,
0.09428228, 1.236877, -0.7841671, 0, 0, 0, 1, 1,
0.09618265, -1.641674, 2.305693, 0, 0, 0, 1, 1,
0.09860559, 1.222112, -0.1529851, 0, 0, 0, 1, 1,
0.1009463, 0.1735277, -0.5672355, 0, 0, 0, 1, 1,
0.1068868, 0.5692304, -0.3686535, 0, 0, 0, 1, 1,
0.1087333, 0.5537397, -0.9496456, 0, 0, 0, 1, 1,
0.1105997, 0.6720378, 1.87937, 1, 1, 1, 1, 1,
0.1122416, -1.159694, 2.59128, 1, 1, 1, 1, 1,
0.1131219, 1.641698, 0.328085, 1, 1, 1, 1, 1,
0.1146647, 0.1609783, 0.6492187, 1, 1, 1, 1, 1,
0.1166927, -0.8125582, 2.608044, 1, 1, 1, 1, 1,
0.1170482, 0.3807589, 1.342582, 1, 1, 1, 1, 1,
0.1261389, -0.4907727, 2.440608, 1, 1, 1, 1, 1,
0.1261847, -0.1522332, 1.873595, 1, 1, 1, 1, 1,
0.1301465, -2.535463, 3.78631, 1, 1, 1, 1, 1,
0.1324117, 0.1293031, -0.05451216, 1, 1, 1, 1, 1,
0.1331634, 0.445257, -1.405254, 1, 1, 1, 1, 1,
0.1379816, -0.7547708, 3.319852, 1, 1, 1, 1, 1,
0.1391492, -0.286568, 0.872824, 1, 1, 1, 1, 1,
0.1439864, -0.6533125, 1.290337, 1, 1, 1, 1, 1,
0.1440894, -1.068797, 3.823326, 1, 1, 1, 1, 1,
0.1481727, -0.4953632, 3.582829, 0, 0, 1, 1, 1,
0.1483796, -0.9726355, 3.552706, 1, 0, 0, 1, 1,
0.1486418, -1.126877, 4.149968, 1, 0, 0, 1, 1,
0.1500967, 1.687718, -0.1342917, 1, 0, 0, 1, 1,
0.1526937, -1.303873, 3.183314, 1, 0, 0, 1, 1,
0.1576153, 0.4041765, 0.6214343, 1, 0, 0, 1, 1,
0.1604829, -0.1401291, 2.613319, 0, 0, 0, 1, 1,
0.1623739, -0.7795966, 5.079834, 0, 0, 0, 1, 1,
0.1624374, -0.393928, 2.137173, 0, 0, 0, 1, 1,
0.166636, -0.5542325, 2.800597, 0, 0, 0, 1, 1,
0.1669324, -0.5644204, 1.691874, 0, 0, 0, 1, 1,
0.1697764, 0.1081982, 0.1354737, 0, 0, 0, 1, 1,
0.1711612, -2.066413, 3.708157, 0, 0, 0, 1, 1,
0.1711893, 0.4094076, 2.057281, 1, 1, 1, 1, 1,
0.1720989, -0.8509836, 3.730076, 1, 1, 1, 1, 1,
0.1727977, -1.19625, 4.908915, 1, 1, 1, 1, 1,
0.1733977, -1.033139, 2.041399, 1, 1, 1, 1, 1,
0.1770344, -0.8215214, 3.240608, 1, 1, 1, 1, 1,
0.1778761, 0.8504985, 0.6354136, 1, 1, 1, 1, 1,
0.1788905, -0.7947949, 5.269781, 1, 1, 1, 1, 1,
0.1800856, -1.451143, 3.664049, 1, 1, 1, 1, 1,
0.1872285, 0.2245622, 2.812773, 1, 1, 1, 1, 1,
0.1888426, -0.0947537, 1.932131, 1, 1, 1, 1, 1,
0.196939, 0.4365183, -0.7669352, 1, 1, 1, 1, 1,
0.1986082, -0.8972059, 3.341899, 1, 1, 1, 1, 1,
0.2060263, -0.1897974, 2.347982, 1, 1, 1, 1, 1,
0.2086755, -0.8841262, 3.659251, 1, 1, 1, 1, 1,
0.2091219, 0.1923474, 1.553993, 1, 1, 1, 1, 1,
0.2126557, -0.06071842, 0.6562561, 0, 0, 1, 1, 1,
0.2161828, 0.4456873, 2.330697, 1, 0, 0, 1, 1,
0.2172045, 0.08901525, 3.351983, 1, 0, 0, 1, 1,
0.2179386, 1.10593, 1.322315, 1, 0, 0, 1, 1,
0.221223, -2.839772, 2.530365, 1, 0, 0, 1, 1,
0.2228647, 0.8618191, 0.3668384, 1, 0, 0, 1, 1,
0.2321351, -0.8610518, 2.631224, 0, 0, 0, 1, 1,
0.2546431, 0.8823604, 2.515658, 0, 0, 0, 1, 1,
0.2558205, 0.04830799, 0.8151983, 0, 0, 0, 1, 1,
0.2591167, -1.786903, 2.671297, 0, 0, 0, 1, 1,
0.2605435, 1.143456, 1.597954, 0, 0, 0, 1, 1,
0.2645126, 0.1021677, 1.902725, 0, 0, 0, 1, 1,
0.2645434, 0.4110383, 0.9126205, 0, 0, 0, 1, 1,
0.264723, 0.145179, -0.3642564, 1, 1, 1, 1, 1,
0.2679647, 2.048129, 1.16325, 1, 1, 1, 1, 1,
0.2686051, -0.3423751, 2.392693, 1, 1, 1, 1, 1,
0.2700823, 1.496459, -1.37988, 1, 1, 1, 1, 1,
0.2709312, 1.981179, 0.008539142, 1, 1, 1, 1, 1,
0.2726346, -0.2449302, 2.6904, 1, 1, 1, 1, 1,
0.2731679, 0.290314, 0.6656714, 1, 1, 1, 1, 1,
0.2757734, -1.122223, 3.295082, 1, 1, 1, 1, 1,
0.2820228, -0.4095504, 3.956513, 1, 1, 1, 1, 1,
0.2823927, -0.5118636, 0.8415959, 1, 1, 1, 1, 1,
0.2870592, 0.3618348, 0.03265469, 1, 1, 1, 1, 1,
0.2884619, 0.371498, 1.442261, 1, 1, 1, 1, 1,
0.2887449, -0.3866319, 2.446559, 1, 1, 1, 1, 1,
0.289284, 0.7633672, 1.521415, 1, 1, 1, 1, 1,
0.2902196, 1.039824, -0.7519453, 1, 1, 1, 1, 1,
0.2915767, -0.5278575, 2.447785, 0, 0, 1, 1, 1,
0.3015174, -1.551304, 2.705713, 1, 0, 0, 1, 1,
0.3172005, -1.37487, 2.696147, 1, 0, 0, 1, 1,
0.31749, 0.3003507, 1.079803, 1, 0, 0, 1, 1,
0.3182994, 0.8050026, 2.212567, 1, 0, 0, 1, 1,
0.319201, 1.654915, -1.222508, 1, 0, 0, 1, 1,
0.3223661, -0.4813901, 2.890083, 0, 0, 0, 1, 1,
0.3251355, 1.605756, -1.713459, 0, 0, 0, 1, 1,
0.3252204, -0.8497187, 2.998606, 0, 0, 0, 1, 1,
0.3290401, 1.062103, 0.1345089, 0, 0, 0, 1, 1,
0.3305944, -0.4036678, 0.654696, 0, 0, 0, 1, 1,
0.3368702, -0.8630819, 3.157918, 0, 0, 0, 1, 1,
0.3385583, -0.7997072, 3.787092, 0, 0, 0, 1, 1,
0.3420655, 0.9603267, -0.3884015, 1, 1, 1, 1, 1,
0.3444566, 0.9339988, 0.4540906, 1, 1, 1, 1, 1,
0.346248, 0.7890918, -0.9387268, 1, 1, 1, 1, 1,
0.352896, 0.1747626, 2.26494, 1, 1, 1, 1, 1,
0.3556615, 0.3198453, 1.081815, 1, 1, 1, 1, 1,
0.3566991, 0.1400817, 0.5740886, 1, 1, 1, 1, 1,
0.3591154, 0.5261087, 0.8737484, 1, 1, 1, 1, 1,
0.3596036, -0.596513, 4.673089, 1, 1, 1, 1, 1,
0.3597139, 1.131958, 0.6110448, 1, 1, 1, 1, 1,
0.3617119, 0.02655919, 0.09276739, 1, 1, 1, 1, 1,
0.3637612, 0.5835711, 1.007325, 1, 1, 1, 1, 1,
0.365108, -0.5857546, 1.99717, 1, 1, 1, 1, 1,
0.3693656, 0.06958782, 2.849826, 1, 1, 1, 1, 1,
0.3756835, -0.3975776, 3.165295, 1, 1, 1, 1, 1,
0.3783099, -0.2664936, 2.818706, 1, 1, 1, 1, 1,
0.3784022, 0.2735363, 0.08461051, 0, 0, 1, 1, 1,
0.3815785, 0.06988337, 1.417153, 1, 0, 0, 1, 1,
0.383484, 0.6135507, 0.08834005, 1, 0, 0, 1, 1,
0.3868462, -0.226668, 2.829621, 1, 0, 0, 1, 1,
0.3946033, 0.4380829, 0.7319469, 1, 0, 0, 1, 1,
0.4031726, 0.1671891, 1.442471, 1, 0, 0, 1, 1,
0.4058522, 0.121655, 2.859755, 0, 0, 0, 1, 1,
0.4080776, -2.003, 5.174018, 0, 0, 0, 1, 1,
0.4081421, -0.5278153, 0.9850292, 0, 0, 0, 1, 1,
0.4089305, -0.7060803, 1.275326, 0, 0, 0, 1, 1,
0.4114459, -1.238995, 4.112807, 0, 0, 0, 1, 1,
0.4119872, 1.072112, 1.463769, 0, 0, 0, 1, 1,
0.4199897, 0.05614365, 0.654622, 0, 0, 0, 1, 1,
0.4228411, -0.4281394, 1.910615, 1, 1, 1, 1, 1,
0.4258274, 1.032022, 0.54957, 1, 1, 1, 1, 1,
0.4286325, 0.633192, 0.2193468, 1, 1, 1, 1, 1,
0.4288572, 0.4201016, 1.327644, 1, 1, 1, 1, 1,
0.4326181, -0.6411965, 1.784706, 1, 1, 1, 1, 1,
0.434035, -1.451978, 3.710022, 1, 1, 1, 1, 1,
0.4413058, 0.7654839, -1.613708, 1, 1, 1, 1, 1,
0.4421354, -0.1769644, 0.9497308, 1, 1, 1, 1, 1,
0.4425502, -1.138307, 2.26502, 1, 1, 1, 1, 1,
0.4487723, 0.04689615, 2.649059, 1, 1, 1, 1, 1,
0.450211, 1.518406, 0.2031125, 1, 1, 1, 1, 1,
0.4521831, 0.2904948, 2.859103, 1, 1, 1, 1, 1,
0.4524098, 0.3595609, 0.8882861, 1, 1, 1, 1, 1,
0.4524966, 0.2116852, 0.01908956, 1, 1, 1, 1, 1,
0.4550985, 2.135, -0.1618864, 1, 1, 1, 1, 1,
0.4555737, -1.762227, 1.948971, 0, 0, 1, 1, 1,
0.4564163, -0.04090875, 0.3580858, 1, 0, 0, 1, 1,
0.4596567, -1.808683, 1.91832, 1, 0, 0, 1, 1,
0.4613595, -1.360305, 2.698032, 1, 0, 0, 1, 1,
0.4627926, 0.7009451, 1.12952, 1, 0, 0, 1, 1,
0.4672829, -0.6729564, 3.019254, 1, 0, 0, 1, 1,
0.4694396, -0.1846795, 1.777437, 0, 0, 0, 1, 1,
0.4696736, 1.980403, -1.513193, 0, 0, 0, 1, 1,
0.4702134, 1.05203, 0.3210313, 0, 0, 0, 1, 1,
0.47484, 0.5728872, -0.68729, 0, 0, 0, 1, 1,
0.4773565, -1.755678, 2.657577, 0, 0, 0, 1, 1,
0.4799782, 1.46787, 0.04707547, 0, 0, 0, 1, 1,
0.4816706, -0.5114176, 2.180655, 0, 0, 0, 1, 1,
0.4858885, 0.2322861, 0.3403009, 1, 1, 1, 1, 1,
0.4911487, 0.6964832, 1.409822, 1, 1, 1, 1, 1,
0.4943487, -2.356822, 1.508411, 1, 1, 1, 1, 1,
0.4979316, -0.475228, 1.634906, 1, 1, 1, 1, 1,
0.4984154, 0.8480572, -1.855427, 1, 1, 1, 1, 1,
0.4987894, 1.013186, 0.09178699, 1, 1, 1, 1, 1,
0.5059621, -1.109851, 2.336816, 1, 1, 1, 1, 1,
0.5075367, -3.271897, 3.795853, 1, 1, 1, 1, 1,
0.5117922, -0.1650414, 0.6271781, 1, 1, 1, 1, 1,
0.515345, 0.5550929, -0.9527563, 1, 1, 1, 1, 1,
0.5183754, 0.03486744, 0.267683, 1, 1, 1, 1, 1,
0.524239, -0.1818841, 2.192667, 1, 1, 1, 1, 1,
0.5344825, 1.074137, -0.6807347, 1, 1, 1, 1, 1,
0.5376644, 2.843613, -0.3112989, 1, 1, 1, 1, 1,
0.5499455, 1.879121, -0.4119884, 1, 1, 1, 1, 1,
0.5508833, 0.4254476, 3.670151, 0, 0, 1, 1, 1,
0.5514432, 0.1380877, 1.527, 1, 0, 0, 1, 1,
0.5528787, 1.230829, 0.06599988, 1, 0, 0, 1, 1,
0.5574068, -2.816497, 3.008917, 1, 0, 0, 1, 1,
0.5606995, 0.4254378, -1.526012, 1, 0, 0, 1, 1,
0.5617356, 0.07379546, 2.282724, 1, 0, 0, 1, 1,
0.5714345, -1.555246, 3.121163, 0, 0, 0, 1, 1,
0.5755314, 1.226599, 1.95423, 0, 0, 0, 1, 1,
0.575999, 1.187277, 1.483235, 0, 0, 0, 1, 1,
0.5765423, -0.4118291, 2.36475, 0, 0, 0, 1, 1,
0.5782782, 1.075898, 0.2925004, 0, 0, 0, 1, 1,
0.5802244, -1.098416, 4.091143, 0, 0, 0, 1, 1,
0.5812333, 2.222356, 0.473812, 0, 0, 0, 1, 1,
0.5840766, -0.5169565, 2.254775, 1, 1, 1, 1, 1,
0.5912279, -0.8522531, 2.545501, 1, 1, 1, 1, 1,
0.5959578, -0.3250441, 0.6255015, 1, 1, 1, 1, 1,
0.5981994, 0.7356469, 0.5051826, 1, 1, 1, 1, 1,
0.5989257, -1.459615, 1.566422, 1, 1, 1, 1, 1,
0.5997351, -0.276666, 3.460889, 1, 1, 1, 1, 1,
0.6036598, 1.066718, 1.039312, 1, 1, 1, 1, 1,
0.6085034, 0.7042672, -0.7862663, 1, 1, 1, 1, 1,
0.6136653, 1.021741, 0.963104, 1, 1, 1, 1, 1,
0.6141348, 0.09054141, 0.1749329, 1, 1, 1, 1, 1,
0.6142506, 2.142649, -0.8919745, 1, 1, 1, 1, 1,
0.6268222, 0.9803742, 0.1914222, 1, 1, 1, 1, 1,
0.635426, -0.3582913, 2.651246, 1, 1, 1, 1, 1,
0.6396998, 1.509737, -0.5448243, 1, 1, 1, 1, 1,
0.6467223, -0.4435243, 2.622216, 1, 1, 1, 1, 1,
0.6488428, -0.1005088, 0.3453691, 0, 0, 1, 1, 1,
0.6529486, -0.3079253, 3.089402, 1, 0, 0, 1, 1,
0.6553519, 0.4524038, 1.120919, 1, 0, 0, 1, 1,
0.6556277, -1.010001, 4.475738, 1, 0, 0, 1, 1,
0.6653617, -0.8652276, 1.0592, 1, 0, 0, 1, 1,
0.6782139, 0.17418, 1.519117, 1, 0, 0, 1, 1,
0.6830232, -0.9515276, 2.587245, 0, 0, 0, 1, 1,
0.6866776, 0.7549618, 0.9053805, 0, 0, 0, 1, 1,
0.6894057, 0.706637, 1.135763, 0, 0, 0, 1, 1,
0.690688, 1.578967, 0.4977103, 0, 0, 0, 1, 1,
0.6942949, -0.004384788, 0.3386515, 0, 0, 0, 1, 1,
0.6955959, 1.367229, 0.004929404, 0, 0, 0, 1, 1,
0.6987053, -0.9597107, 0.5291138, 0, 0, 0, 1, 1,
0.7011122, 0.7923567, 0.544289, 1, 1, 1, 1, 1,
0.7038136, -1.729449, -0.3094445, 1, 1, 1, 1, 1,
0.7074609, 0.03466182, 0.126118, 1, 1, 1, 1, 1,
0.7092394, -0.4663486, 1.235788, 1, 1, 1, 1, 1,
0.7098678, -0.3033624, 2.205503, 1, 1, 1, 1, 1,
0.7121511, -1.038231, 1.87228, 1, 1, 1, 1, 1,
0.7121994, -0.1192609, 2.710844, 1, 1, 1, 1, 1,
0.717152, -0.2579997, 1.896998, 1, 1, 1, 1, 1,
0.717195, 0.1208039, 0.3747192, 1, 1, 1, 1, 1,
0.7175611, 0.6533482, 1.558695, 1, 1, 1, 1, 1,
0.7183284, -0.9299228, 1.324082, 1, 1, 1, 1, 1,
0.7198224, -0.4123587, 2.952263, 1, 1, 1, 1, 1,
0.720443, -1.431559, 3.209209, 1, 1, 1, 1, 1,
0.7212746, -0.02763437, 1.717301, 1, 1, 1, 1, 1,
0.7287928, 1.823932, -0.711057, 1, 1, 1, 1, 1,
0.730001, 0.4478039, 0.7320858, 0, 0, 1, 1, 1,
0.7346118, 0.5947837, 0.7107849, 1, 0, 0, 1, 1,
0.7370508, -0.04330362, 1.967248, 1, 0, 0, 1, 1,
0.7388177, -1.042514, 2.382414, 1, 0, 0, 1, 1,
0.7419953, 1.190361, 1.19001, 1, 0, 0, 1, 1,
0.7436107, 0.7145503, -0.8204908, 1, 0, 0, 1, 1,
0.7536559, -1.585824, 3.331458, 0, 0, 0, 1, 1,
0.7587159, 0.9259617, -0.08445581, 0, 0, 0, 1, 1,
0.7622528, -0.3235494, 2.284596, 0, 0, 0, 1, 1,
0.7686217, 1.352818, 1.5465, 0, 0, 0, 1, 1,
0.7713408, 2.476957, 0.6300213, 0, 0, 0, 1, 1,
0.772477, -1.270608, 0.3588412, 0, 0, 0, 1, 1,
0.7735309, -1.108207, 2.110482, 0, 0, 0, 1, 1,
0.7755622, 0.03844489, 2.023487, 1, 1, 1, 1, 1,
0.7774777, 2.195702, -0.08983882, 1, 1, 1, 1, 1,
0.7912856, -2.074042, 3.295036, 1, 1, 1, 1, 1,
0.7969676, 0.2283883, 2.807666, 1, 1, 1, 1, 1,
0.8012228, -1.422704, 3.26003, 1, 1, 1, 1, 1,
0.8022634, 0.2198512, 2.851968, 1, 1, 1, 1, 1,
0.8070838, -0.09117655, 0.2968506, 1, 1, 1, 1, 1,
0.8076701, 1.079493, 1.275677, 1, 1, 1, 1, 1,
0.8228848, -1.196825, 1.567861, 1, 1, 1, 1, 1,
0.8289347, 0.2337978, 0.3455686, 1, 1, 1, 1, 1,
0.8350727, 0.8093386, 2.605493, 1, 1, 1, 1, 1,
0.8351861, 0.4696112, 1.983188, 1, 1, 1, 1, 1,
0.8428876, 0.02073282, 2.206914, 1, 1, 1, 1, 1,
0.8452868, 1.474374, 0.8342347, 1, 1, 1, 1, 1,
0.8493951, -1.544032, 2.274824, 1, 1, 1, 1, 1,
0.8497007, -0.7685534, 2.110221, 0, 0, 1, 1, 1,
0.8580164, 0.01601797, 1.300495, 1, 0, 0, 1, 1,
0.8591344, -0.03384205, 1.150229, 1, 0, 0, 1, 1,
0.8611208, 1.11733, 0.5108371, 1, 0, 0, 1, 1,
0.8617101, -1.276184, 2.82728, 1, 0, 0, 1, 1,
0.8647159, 1.613166, 0.8568989, 1, 0, 0, 1, 1,
0.8647628, -0.09907017, 2.131368, 0, 0, 0, 1, 1,
0.8688046, -0.7493718, 0.9905964, 0, 0, 0, 1, 1,
0.8689179, -0.1182245, 4.843741, 0, 0, 0, 1, 1,
0.8717625, -0.2557425, 0.9652929, 0, 0, 0, 1, 1,
0.8793486, 0.1095237, 2.052446, 0, 0, 0, 1, 1,
0.8835088, -0.2456533, 1.652868, 0, 0, 0, 1, 1,
0.8893721, -2.016516, 2.117968, 0, 0, 0, 1, 1,
0.8931741, -0.7953981, 3.702174, 1, 1, 1, 1, 1,
0.8936759, -0.6031345, 2.4926, 1, 1, 1, 1, 1,
0.8993742, 0.3073575, 1.370252, 1, 1, 1, 1, 1,
0.9003333, 0.6253192, 1.158356, 1, 1, 1, 1, 1,
0.9093577, 0.8956967, 1.616413, 1, 1, 1, 1, 1,
0.9118925, 0.5026629, -0.3349787, 1, 1, 1, 1, 1,
0.9141957, -0.5863702, 2.981895, 1, 1, 1, 1, 1,
0.9182045, 0.3371572, 0.6635627, 1, 1, 1, 1, 1,
0.92294, -1.358197, 1.11456, 1, 1, 1, 1, 1,
0.9247085, -2.483851, 1.975708, 1, 1, 1, 1, 1,
0.9264712, -0.3843317, 3.217562, 1, 1, 1, 1, 1,
0.927082, -0.2048723, 1.501983, 1, 1, 1, 1, 1,
0.946636, 2.10024, 0.472861, 1, 1, 1, 1, 1,
0.9468395, 1.351665, -0.02971316, 1, 1, 1, 1, 1,
0.9490988, 0.614822, 1.32825, 1, 1, 1, 1, 1,
0.9502051, 0.1704938, 2.712307, 0, 0, 1, 1, 1,
0.9634236, -1.007056, 1.325188, 1, 0, 0, 1, 1,
0.9636779, 1.837855, -0.2471199, 1, 0, 0, 1, 1,
0.9672557, 0.1539524, 0.7554702, 1, 0, 0, 1, 1,
0.9725296, 0.3386294, 1.822927, 1, 0, 0, 1, 1,
0.9746118, 1.779354, 1.261019, 1, 0, 0, 1, 1,
0.9750225, -0.368582, 1.675482, 0, 0, 0, 1, 1,
0.9772338, 0.4495282, 1.714184, 0, 0, 0, 1, 1,
0.9786735, -1.008613, 3.444502, 0, 0, 0, 1, 1,
0.9844126, 1.452326, -0.2474354, 0, 0, 0, 1, 1,
0.9862404, 0.7437157, 1.625496, 0, 0, 0, 1, 1,
0.9869531, 0.8656894, 0.6142175, 0, 0, 0, 1, 1,
0.9948518, 0.8161871, 0.04531878, 0, 0, 0, 1, 1,
1.007279, -0.9134426, 1.882123, 1, 1, 1, 1, 1,
1.01512, -0.1450235, 3.188838, 1, 1, 1, 1, 1,
1.02106, 1.962295, -0.849825, 1, 1, 1, 1, 1,
1.022055, 1.037356, 0.2729696, 1, 1, 1, 1, 1,
1.022847, -0.4638858, 2.511032, 1, 1, 1, 1, 1,
1.02292, 0.4577416, 0.8494411, 1, 1, 1, 1, 1,
1.025536, 1.325331, -0.8548375, 1, 1, 1, 1, 1,
1.025891, 0.5304365, 1.336683, 1, 1, 1, 1, 1,
1.032498, -1.239581, 2.764916, 1, 1, 1, 1, 1,
1.039579, 0.6860172, -0.2285841, 1, 1, 1, 1, 1,
1.04046, -0.850522, 1.684502, 1, 1, 1, 1, 1,
1.04135, 0.7474161, 0.003129356, 1, 1, 1, 1, 1,
1.049291, -0.3284285, 1.305389, 1, 1, 1, 1, 1,
1.059748, -0.2503552, 3.479834, 1, 1, 1, 1, 1,
1.060559, 0.09934285, 1.67981, 1, 1, 1, 1, 1,
1.060932, -0.6918645, 1.796249, 0, 0, 1, 1, 1,
1.069549, 1.027274, 0.9995378, 1, 0, 0, 1, 1,
1.07211, -0.8254879, 1.604055, 1, 0, 0, 1, 1,
1.077428, -0.6651717, 1.940714, 1, 0, 0, 1, 1,
1.077534, -1.821962, 3.200768, 1, 0, 0, 1, 1,
1.080548, 0.624716, 2.303816, 1, 0, 0, 1, 1,
1.102624, 0.6492328, -0.06080134, 0, 0, 0, 1, 1,
1.102899, 1.248057, 1.413033, 0, 0, 0, 1, 1,
1.104715, 2.263241, -0.4644336, 0, 0, 0, 1, 1,
1.105179, -1.145645, 2.796693, 0, 0, 0, 1, 1,
1.113787, 1.600876, 0.6021336, 0, 0, 0, 1, 1,
1.12795, -0.2789343, 2.835693, 0, 0, 0, 1, 1,
1.129876, 0.98119, 1.04596, 0, 0, 0, 1, 1,
1.133983, 1.30925, 1.95465, 1, 1, 1, 1, 1,
1.136359, 0.2267348, 1.176992, 1, 1, 1, 1, 1,
1.142527, -1.290848, 3.387888, 1, 1, 1, 1, 1,
1.14256, 0.09584841, 2.88331, 1, 1, 1, 1, 1,
1.146108, 0.8370613, 2.096318, 1, 1, 1, 1, 1,
1.158442, 0.4537266, 3.17425, 1, 1, 1, 1, 1,
1.163838, -0.722338, 3.37331, 1, 1, 1, 1, 1,
1.171363, 0.2776254, 3.571583, 1, 1, 1, 1, 1,
1.172025, -0.00771778, 2.792226, 1, 1, 1, 1, 1,
1.179181, -0.0135507, 1.852288, 1, 1, 1, 1, 1,
1.184795, 0.02349623, 2.571634, 1, 1, 1, 1, 1,
1.190898, 1.059653, 1.025031, 1, 1, 1, 1, 1,
1.192251, 2.069631, -0.1034844, 1, 1, 1, 1, 1,
1.206318, -1.157007, 2.478201, 1, 1, 1, 1, 1,
1.214671, -0.3908389, 1.501702, 1, 1, 1, 1, 1,
1.217517, 0.8360309, 1.688247, 0, 0, 1, 1, 1,
1.219717, 1.129266, 0.03065907, 1, 0, 0, 1, 1,
1.222193, -0.4468611, 3.586555, 1, 0, 0, 1, 1,
1.229545, 0.1949945, 0.7727845, 1, 0, 0, 1, 1,
1.233699, -1.664085, 2.889451, 1, 0, 0, 1, 1,
1.235119, -0.5384886, 1.484464, 1, 0, 0, 1, 1,
1.239963, -0.9954751, 0.1517193, 0, 0, 0, 1, 1,
1.243666, 0.03815966, 0.7056765, 0, 0, 0, 1, 1,
1.24477, 0.06280122, 1.009639, 0, 0, 0, 1, 1,
1.250885, -1.744827, 2.206713, 0, 0, 0, 1, 1,
1.253056, -1.220336, 1.658189, 0, 0, 0, 1, 1,
1.254694, 0.6285673, 0.4571657, 0, 0, 0, 1, 1,
1.256499, -1.889789, 2.598497, 0, 0, 0, 1, 1,
1.260311, 0.1760325, 2.223989, 1, 1, 1, 1, 1,
1.268178, 0.8010547, 1.189127, 1, 1, 1, 1, 1,
1.273557, -1.011774, 1.332637, 1, 1, 1, 1, 1,
1.282743, 0.7958107, 1.615273, 1, 1, 1, 1, 1,
1.28388, -1.016195, 3.521276, 1, 1, 1, 1, 1,
1.284543, -0.01101502, 1.815658, 1, 1, 1, 1, 1,
1.288481, -0.1359075, 3.403504, 1, 1, 1, 1, 1,
1.291056, 0.6212743, 1.105845, 1, 1, 1, 1, 1,
1.296012, -0.5873188, 4.621678, 1, 1, 1, 1, 1,
1.296694, -1.083841, 1.403234, 1, 1, 1, 1, 1,
1.302192, -1.297045, 0.5718437, 1, 1, 1, 1, 1,
1.304119, -0.5646327, 1.580921, 1, 1, 1, 1, 1,
1.307984, -0.3852457, 0.9237733, 1, 1, 1, 1, 1,
1.308201, -0.190202, 3.090945, 1, 1, 1, 1, 1,
1.308849, -1.18489, 0.2190363, 1, 1, 1, 1, 1,
1.314623, 0.7606551, 0.5465565, 0, 0, 1, 1, 1,
1.338955, -1.064493, 3.636349, 1, 0, 0, 1, 1,
1.34885, -1.197136, 1.917424, 1, 0, 0, 1, 1,
1.357661, -0.7010024, 3.309676, 1, 0, 0, 1, 1,
1.358268, 1.036884, -1.097634, 1, 0, 0, 1, 1,
1.362982, 0.9583427, 1.591059, 1, 0, 0, 1, 1,
1.365922, 1.593515, -0.8418882, 0, 0, 0, 1, 1,
1.368981, -1.295383, 2.112915, 0, 0, 0, 1, 1,
1.373385, -0.6918718, 1.945329, 0, 0, 0, 1, 1,
1.381905, -0.2866534, 2.229965, 0, 0, 0, 1, 1,
1.383133, -0.7756404, 2.215325, 0, 0, 0, 1, 1,
1.38654, 1.167386, 0.5513668, 0, 0, 0, 1, 1,
1.392817, -1.19262, 0.4647009, 0, 0, 0, 1, 1,
1.397075, -1.269125, 1.799788, 1, 1, 1, 1, 1,
1.398172, 0.450911, 1.09928, 1, 1, 1, 1, 1,
1.413017, 0.2891416, 2.31355, 1, 1, 1, 1, 1,
1.436925, 1.17091, 1.918682, 1, 1, 1, 1, 1,
1.439314, -1.008751, 1.930685, 1, 1, 1, 1, 1,
1.443471, 0.8564083, 0.5654305, 1, 1, 1, 1, 1,
1.448822, 0.4808976, 2.040605, 1, 1, 1, 1, 1,
1.467047, -0.2087996, 1.541531, 1, 1, 1, 1, 1,
1.468794, 0.5513384, 1.189321, 1, 1, 1, 1, 1,
1.491606, -0.3752932, 3.231626, 1, 1, 1, 1, 1,
1.493149, -2.518369, 2.641802, 1, 1, 1, 1, 1,
1.494629, 0.6931062, 2.942787, 1, 1, 1, 1, 1,
1.497613, -0.9551468, 0.8875692, 1, 1, 1, 1, 1,
1.505117, -0.001791934, 1.420543, 1, 1, 1, 1, 1,
1.512275, -1.148177, 4.923075, 1, 1, 1, 1, 1,
1.52037, 0.9274843, -1.104704, 0, 0, 1, 1, 1,
1.520754, -0.9036502, 1.110994, 1, 0, 0, 1, 1,
1.522555, -0.7365016, 1.094047, 1, 0, 0, 1, 1,
1.539628, 1.828524, 0.5939469, 1, 0, 0, 1, 1,
1.544363, -0.08515681, 3.229058, 1, 0, 0, 1, 1,
1.54864, 0.732834, 2.826122, 1, 0, 0, 1, 1,
1.551287, 0.03717502, 1.716955, 0, 0, 0, 1, 1,
1.553943, 0.3067123, 2.229134, 0, 0, 0, 1, 1,
1.559373, -0.6473475, 3.594712, 0, 0, 0, 1, 1,
1.559931, -1.051654, 0.1203407, 0, 0, 0, 1, 1,
1.566232, -0.07184538, 0.7330082, 0, 0, 0, 1, 1,
1.569523, -1.183451, 3.220727, 0, 0, 0, 1, 1,
1.578161, 0.6159037, 0.9022604, 0, 0, 0, 1, 1,
1.583651, 0.6674716, 1.293421, 1, 1, 1, 1, 1,
1.583761, 0.8565363, 1.173989, 1, 1, 1, 1, 1,
1.594955, -0.08479746, 1.986925, 1, 1, 1, 1, 1,
1.595083, 0.01496616, 1.186954, 1, 1, 1, 1, 1,
1.611973, 0.8431289, 2.150644, 1, 1, 1, 1, 1,
1.613258, 1.876702, -0.4660792, 1, 1, 1, 1, 1,
1.616583, 2.10706, 1.374941, 1, 1, 1, 1, 1,
1.618173, 0.683421, 1.25581, 1, 1, 1, 1, 1,
1.629304, -1.385599, 1.768649, 1, 1, 1, 1, 1,
1.630983, 0.5676619, 2.894, 1, 1, 1, 1, 1,
1.637035, -2.600009, 3.200108, 1, 1, 1, 1, 1,
1.640666, 0.8251471, 0.5589627, 1, 1, 1, 1, 1,
1.658799, -0.9528189, 1.220696, 1, 1, 1, 1, 1,
1.67041, 0.4747057, -0.007543806, 1, 1, 1, 1, 1,
1.681152, 0.9604678, 3.276828, 1, 1, 1, 1, 1,
1.701249, -2.934891, 3.904881, 0, 0, 1, 1, 1,
1.71025, 1.400897, 0.7582758, 1, 0, 0, 1, 1,
1.729113, -1.755837, 1.926078, 1, 0, 0, 1, 1,
1.74139, 0.7631614, 0.970864, 1, 0, 0, 1, 1,
1.743865, -0.210382, -0.7616118, 1, 0, 0, 1, 1,
1.754115, -0.6556561, 2.286156, 1, 0, 0, 1, 1,
1.783887, -1.115049, 1.379713, 0, 0, 0, 1, 1,
1.785782, -1.288007, 1.853348, 0, 0, 0, 1, 1,
1.804729, -0.4793374, 1.992898, 0, 0, 0, 1, 1,
1.809534, -1.219282, 2.611598, 0, 0, 0, 1, 1,
1.824246, -1.992987, 1.734892, 0, 0, 0, 1, 1,
1.83748, -0.2533847, 2.771909, 0, 0, 0, 1, 1,
1.847305, 0.3934959, 2.786343, 0, 0, 0, 1, 1,
1.88201, -0.5000888, 3.373291, 1, 1, 1, 1, 1,
1.883223, 0.5863212, 1.572195, 1, 1, 1, 1, 1,
1.892767, 0.7576614, 0.4742137, 1, 1, 1, 1, 1,
1.904577, -1.045442, 0.8684607, 1, 1, 1, 1, 1,
1.913718, 2.910043, 0.250069, 1, 1, 1, 1, 1,
1.926844, 0.3919361, 2.091137, 1, 1, 1, 1, 1,
1.945843, 0.4424195, 2.454757, 1, 1, 1, 1, 1,
1.990268, -1.069951, 1.738966, 1, 1, 1, 1, 1,
2.011752, -0.5899908, 2.048735, 1, 1, 1, 1, 1,
2.056184, 0.7915829, 3.397273, 1, 1, 1, 1, 1,
2.066365, 1.896068, 0.2157341, 1, 1, 1, 1, 1,
2.126758, -1.413877, 3.503296, 1, 1, 1, 1, 1,
2.130329, 0.6249661, 1.240188, 1, 1, 1, 1, 1,
2.138669, 1.178128, 2.374685, 1, 1, 1, 1, 1,
2.175669, -1.066545, 2.941196, 1, 1, 1, 1, 1,
2.182194, -1.260568, 2.845186, 0, 0, 1, 1, 1,
2.194521, -0.5014172, 2.39154, 1, 0, 0, 1, 1,
2.213232, 1.687021, 0.3948559, 1, 0, 0, 1, 1,
2.250063, -1.699382, 1.933262, 1, 0, 0, 1, 1,
2.267396, -1.393717, 3.681177, 1, 0, 0, 1, 1,
2.287099, -0.378865, 2.543059, 1, 0, 0, 1, 1,
2.316895, -0.6613007, 3.249057, 0, 0, 0, 1, 1,
2.370711, 0.7023636, 0.9752926, 0, 0, 0, 1, 1,
2.412443, -1.36235, 1.66087, 0, 0, 0, 1, 1,
2.494175, -0.2900516, 3.820819, 0, 0, 0, 1, 1,
2.510212, 1.594318, 0.4162142, 0, 0, 0, 1, 1,
2.611054, 0.3558681, 0.6807529, 0, 0, 0, 1, 1,
2.661671, 0.6559545, 1.516818, 0, 0, 0, 1, 1,
2.891752, -1.370593, 2.168094, 1, 1, 1, 1, 1,
2.984324, -0.4128943, 1.37131, 1, 1, 1, 1, 1,
3.009113, -0.08584192, 1.102517, 1, 1, 1, 1, 1,
3.014027, 0.6234154, 1.220311, 1, 1, 1, 1, 1,
3.032551, 0.4663011, 1.864334, 1, 1, 1, 1, 1,
3.089993, 0.457107, 0.8273501, 1, 1, 1, 1, 1,
3.928415, -0.5762724, 3.620595, 1, 1, 1, 1, 1
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
var radius = 9.96469;
var distance = 35.00055;
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
mvMatrix.translate( -0.4163218, 0.04395342, 0.1403878 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.00055);
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