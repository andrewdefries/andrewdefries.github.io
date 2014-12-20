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
-3.491147, 0.9302406, -0.8222015, 1, 0, 0, 1,
-2.858887, 0.9960385, -2.403003, 1, 0.007843138, 0, 1,
-2.84466, -1.314068, -1.628925, 1, 0.01176471, 0, 1,
-2.804277, 0.247943, -1.260433, 1, 0.01960784, 0, 1,
-2.547036, -1.197004, -1.598456, 1, 0.02352941, 0, 1,
-2.499985, -2.294645, -1.727165, 1, 0.03137255, 0, 1,
-2.411597, 0.9361032, -1.067213, 1, 0.03529412, 0, 1,
-2.306333, 0.7173029, -0.1773708, 1, 0.04313726, 0, 1,
-2.241466, -1.627733, -5.081349, 1, 0.04705882, 0, 1,
-2.241463, -2.029997, -3.289346, 1, 0.05490196, 0, 1,
-2.217218, 0.05528207, -1.223759, 1, 0.05882353, 0, 1,
-2.207426, -0.4922939, -1.915222, 1, 0.06666667, 0, 1,
-2.206984, 1.050981, -1.048614, 1, 0.07058824, 0, 1,
-2.204856, 0.7106, -2.301704, 1, 0.07843138, 0, 1,
-2.14313, 0.5313974, -1.667428, 1, 0.08235294, 0, 1,
-2.137093, -0.7143456, -2.258782, 1, 0.09019608, 0, 1,
-2.121664, 0.8351088, -2.073799, 1, 0.09411765, 0, 1,
-2.111315, 0.09316163, -0.4067675, 1, 0.1019608, 0, 1,
-2.087733, -1.122602, -1.348448, 1, 0.1098039, 0, 1,
-2.076197, -0.05224956, -2.443131, 1, 0.1137255, 0, 1,
-2.076051, -0.6366709, -1.706634, 1, 0.1215686, 0, 1,
-2.059729, -1.201593, -4.32431, 1, 0.1254902, 0, 1,
-2.027056, 1.096704, -2.033447, 1, 0.1333333, 0, 1,
-2.023748, 1.003284, -2.655571, 1, 0.1372549, 0, 1,
-2.020472, -0.4027938, -3.100222, 1, 0.145098, 0, 1,
-1.997112, 0.7932931, -0.8668242, 1, 0.1490196, 0, 1,
-1.99698, 0.9272978, 0.3463178, 1, 0.1568628, 0, 1,
-1.973608, -1.731071, -2.58534, 1, 0.1607843, 0, 1,
-1.973449, -0.7379605, -2.784184, 1, 0.1686275, 0, 1,
-1.921748, -0.2782226, -3.148384, 1, 0.172549, 0, 1,
-1.908296, -0.1437849, -0.9002149, 1, 0.1803922, 0, 1,
-1.899029, -1.031666, -2.265584, 1, 0.1843137, 0, 1,
-1.890987, -0.3656793, 0.5297891, 1, 0.1921569, 0, 1,
-1.86777, -1.020006, -0.6746624, 1, 0.1960784, 0, 1,
-1.864974, 1.05411, 0.7171368, 1, 0.2039216, 0, 1,
-1.864518, -0.04639806, -1.76854, 1, 0.2117647, 0, 1,
-1.831515, 0.6037952, -3.023405, 1, 0.2156863, 0, 1,
-1.830376, 0.4142808, -1.752012, 1, 0.2235294, 0, 1,
-1.8211, 0.3670748, -2.118026, 1, 0.227451, 0, 1,
-1.817352, 0.5504944, -2.142417, 1, 0.2352941, 0, 1,
-1.788371, 0.6719518, -0.002472543, 1, 0.2392157, 0, 1,
-1.752048, -1.442232, -2.548016, 1, 0.2470588, 0, 1,
-1.750109, 0.8989173, -2.123939, 1, 0.2509804, 0, 1,
-1.692827, 3.146065, 0.4353667, 1, 0.2588235, 0, 1,
-1.690166, 0.2462052, -1.317639, 1, 0.2627451, 0, 1,
-1.689539, -0.4659199, -3.953147, 1, 0.2705882, 0, 1,
-1.633351, 1.267252, -2.569013, 1, 0.2745098, 0, 1,
-1.6308, -1.168945, -1.723165, 1, 0.282353, 0, 1,
-1.627981, -0.494116, -1.537081, 1, 0.2862745, 0, 1,
-1.614639, -0.1584407, -2.503679, 1, 0.2941177, 0, 1,
-1.612735, 0.8526247, -1.528302, 1, 0.3019608, 0, 1,
-1.610595, 0.6935479, -0.8047215, 1, 0.3058824, 0, 1,
-1.587976, -0.3240306, -0.1765703, 1, 0.3137255, 0, 1,
-1.562458, 1.607467, -0.3804728, 1, 0.3176471, 0, 1,
-1.543304, -0.6438996, -1.641022, 1, 0.3254902, 0, 1,
-1.541943, 1.225184, 0.2512607, 1, 0.3294118, 0, 1,
-1.540457, 0.9136165, -0.6515142, 1, 0.3372549, 0, 1,
-1.515592, 0.6797833, -0.7133343, 1, 0.3411765, 0, 1,
-1.505775, -0.421483, -3.100377, 1, 0.3490196, 0, 1,
-1.474439, 0.004860518, -0.119383, 1, 0.3529412, 0, 1,
-1.462692, 1.21173, -0.9606628, 1, 0.3607843, 0, 1,
-1.448562, -0.001678531, -1.544319, 1, 0.3647059, 0, 1,
-1.439383, 1.842935, -0.4964927, 1, 0.372549, 0, 1,
-1.433342, -0.6499584, -4.18168, 1, 0.3764706, 0, 1,
-1.428639, -0.7381592, -2.459539, 1, 0.3843137, 0, 1,
-1.414667, 0.3873931, -1.326924, 1, 0.3882353, 0, 1,
-1.408152, 0.1364212, -2.487277, 1, 0.3960784, 0, 1,
-1.401985, -2.535149, -2.376373, 1, 0.4039216, 0, 1,
-1.395457, -1.467556, -1.495144, 1, 0.4078431, 0, 1,
-1.393079, -0.4596913, -1.842895, 1, 0.4156863, 0, 1,
-1.391175, -1.049752, -1.34506, 1, 0.4196078, 0, 1,
-1.38596, 0.2547316, -0.8864892, 1, 0.427451, 0, 1,
-1.385394, -0.303537, -0.8264669, 1, 0.4313726, 0, 1,
-1.382688, -0.8894041, -1.659187, 1, 0.4392157, 0, 1,
-1.372846, 0.05567539, -2.007282, 1, 0.4431373, 0, 1,
-1.36135, -1.154711, -1.881447, 1, 0.4509804, 0, 1,
-1.358721, 1.295453, -0.3438291, 1, 0.454902, 0, 1,
-1.357382, 1.302882, -3.082582, 1, 0.4627451, 0, 1,
-1.354444, 1.363289, -0.4553943, 1, 0.4666667, 0, 1,
-1.349077, 0.1463463, -1.42533, 1, 0.4745098, 0, 1,
-1.336214, 0.4096965, -1.570389, 1, 0.4784314, 0, 1,
-1.331169, 0.5023723, -1.480122, 1, 0.4862745, 0, 1,
-1.328265, 0.8783707, -1.915303, 1, 0.4901961, 0, 1,
-1.322996, -1.804106, -1.943339, 1, 0.4980392, 0, 1,
-1.315413, -0.5470841, -1.984172, 1, 0.5058824, 0, 1,
-1.31156, 0.1897432, -1.843912, 1, 0.509804, 0, 1,
-1.310829, 1.409205, 0.2838041, 1, 0.5176471, 0, 1,
-1.310227, 0.5578007, -1.180925, 1, 0.5215687, 0, 1,
-1.308151, -1.277141, -2.968353, 1, 0.5294118, 0, 1,
-1.307883, 0.8589951, -0.4851819, 1, 0.5333334, 0, 1,
-1.290497, -1.244882, -3.42665, 1, 0.5411765, 0, 1,
-1.289183, -0.9205397, -2.865162, 1, 0.5450981, 0, 1,
-1.287424, -0.1249521, -2.215683, 1, 0.5529412, 0, 1,
-1.286217, -2.718193, -5.04446, 1, 0.5568628, 0, 1,
-1.282269, -1.082141, -1.774275, 1, 0.5647059, 0, 1,
-1.281052, 1.601695, -1.940018, 1, 0.5686275, 0, 1,
-1.280524, -0.3513631, -1.378093, 1, 0.5764706, 0, 1,
-1.276943, 0.1549903, -0.2282295, 1, 0.5803922, 0, 1,
-1.273875, -0.7155872, -1.65856, 1, 0.5882353, 0, 1,
-1.265492, -0.009386398, -1.559529, 1, 0.5921569, 0, 1,
-1.260664, 0.8099953, -1.827981, 1, 0.6, 0, 1,
-1.25918, 0.8544374, -0.7788221, 1, 0.6078432, 0, 1,
-1.252682, 0.2862978, -2.084391, 1, 0.6117647, 0, 1,
-1.246595, 1.23507, -1.140439, 1, 0.6196079, 0, 1,
-1.242117, 0.3142194, -0.7321728, 1, 0.6235294, 0, 1,
-1.239104, -1.763608, -4.039675, 1, 0.6313726, 0, 1,
-1.238442, 1.213432, -0.5437037, 1, 0.6352941, 0, 1,
-1.23817, 1.491743, -1.096355, 1, 0.6431373, 0, 1,
-1.228968, -1.353037, -2.265883, 1, 0.6470588, 0, 1,
-1.221687, -0.2431993, -2.252745, 1, 0.654902, 0, 1,
-1.218965, -0.1566241, 0.2936333, 1, 0.6588235, 0, 1,
-1.215109, 0.6717778, -0.2157368, 1, 0.6666667, 0, 1,
-1.214239, 0.4707353, -0.8826152, 1, 0.6705883, 0, 1,
-1.212268, -1.022034, -3.42469, 1, 0.6784314, 0, 1,
-1.210773, 0.185094, -0.9257923, 1, 0.682353, 0, 1,
-1.202041, -0.6785757, -2.362748, 1, 0.6901961, 0, 1,
-1.201413, -1.279426, -3.480613, 1, 0.6941177, 0, 1,
-1.200444, -0.6622419, -1.550375, 1, 0.7019608, 0, 1,
-1.198813, -0.3997486, -0.844968, 1, 0.7098039, 0, 1,
-1.196517, -0.1255093, -0.4565039, 1, 0.7137255, 0, 1,
-1.183851, -0.1573417, -2.167854, 1, 0.7215686, 0, 1,
-1.175063, -0.2834309, -1.305301, 1, 0.7254902, 0, 1,
-1.174464, -1.126368, -2.314533, 1, 0.7333333, 0, 1,
-1.162485, 1.475901, -1.720267, 1, 0.7372549, 0, 1,
-1.160926, -0.5932978, -2.885764, 1, 0.7450981, 0, 1,
-1.155216, -1.136782, -0.1969565, 1, 0.7490196, 0, 1,
-1.148088, 0.1220304, -1.282799, 1, 0.7568628, 0, 1,
-1.141323, -1.977547, -2.816644, 1, 0.7607843, 0, 1,
-1.140869, -1.100024, -3.753175, 1, 0.7686275, 0, 1,
-1.140262, 0.1600954, -1.572063, 1, 0.772549, 0, 1,
-1.138554, 0.6469022, -0.8351892, 1, 0.7803922, 0, 1,
-1.129034, 0.529265, -0.232377, 1, 0.7843137, 0, 1,
-1.108608, 0.7881483, -1.310235, 1, 0.7921569, 0, 1,
-1.102813, 1.235254, -1.474136, 1, 0.7960784, 0, 1,
-1.099379, 0.3139877, -1.737971, 1, 0.8039216, 0, 1,
-1.0985, -0.6217057, -3.685931, 1, 0.8117647, 0, 1,
-1.092063, 1.089449, -1.104251, 1, 0.8156863, 0, 1,
-1.089808, -0.4122722, -1.043888, 1, 0.8235294, 0, 1,
-1.088219, 0.2286053, -0.9316715, 1, 0.827451, 0, 1,
-1.083714, 0.8146178, -1.619434, 1, 0.8352941, 0, 1,
-1.083659, 2.250849, 1.052007, 1, 0.8392157, 0, 1,
-1.079271, -0.8938989, -2.548273, 1, 0.8470588, 0, 1,
-1.072948, 1.063756, -0.3941704, 1, 0.8509804, 0, 1,
-1.071514, -1.394944, -1.791994, 1, 0.8588235, 0, 1,
-1.070076, -0.7230468, -1.28486, 1, 0.8627451, 0, 1,
-1.067993, -2.872357, -2.308228, 1, 0.8705882, 0, 1,
-1.061811, 0.1057337, -2.381962, 1, 0.8745098, 0, 1,
-1.061251, 0.174823, -1.320468, 1, 0.8823529, 0, 1,
-1.05863, 1.141425, -2.094751, 1, 0.8862745, 0, 1,
-1.04876, 0.25531, -1.105569, 1, 0.8941177, 0, 1,
-1.04527, -0.336296, -2.375649, 1, 0.8980392, 0, 1,
-1.025152, 1.030724, -2.084633, 1, 0.9058824, 0, 1,
-1.023052, 1.318051, -1.756306, 1, 0.9137255, 0, 1,
-1.022245, 1.203019, -0.160324, 1, 0.9176471, 0, 1,
-1.021177, -1.601132, -2.529509, 1, 0.9254902, 0, 1,
-1.019273, -0.2604484, -1.483241, 1, 0.9294118, 0, 1,
-1.008716, 1.08198, -1.464785, 1, 0.9372549, 0, 1,
-1.008151, -0.482242, -2.259976, 1, 0.9411765, 0, 1,
-0.9990842, 0.8799099, 0.2979741, 1, 0.9490196, 0, 1,
-0.9967778, -0.7950006, -1.40792, 1, 0.9529412, 0, 1,
-0.9854752, 0.9072236, -2.251183, 1, 0.9607843, 0, 1,
-0.9833276, 1.287361, 0.579386, 1, 0.9647059, 0, 1,
-0.9738612, 0.3264215, 0.772736, 1, 0.972549, 0, 1,
-0.969605, -0.8177554, -1.923234, 1, 0.9764706, 0, 1,
-0.9638181, -0.9917344, -3.091601, 1, 0.9843137, 0, 1,
-0.9636182, 0.9712601, -1.334325, 1, 0.9882353, 0, 1,
-0.9603615, 1.090032, -1.646293, 1, 0.9960784, 0, 1,
-0.9599404, 0.7727453, -0.4170445, 0.9960784, 1, 0, 1,
-0.958872, -0.4185057, -3.588288, 0.9921569, 1, 0, 1,
-0.9547237, 1.596282, -0.8252404, 0.9843137, 1, 0, 1,
-0.9522421, 0.4129161, 0.8567256, 0.9803922, 1, 0, 1,
-0.9517322, -0.5664679, -2.117964, 0.972549, 1, 0, 1,
-0.950595, 0.7286097, -0.9977422, 0.9686275, 1, 0, 1,
-0.9464652, -1.647813, -1.190489, 0.9607843, 1, 0, 1,
-0.9431748, -0.4787569, -3.745943, 0.9568627, 1, 0, 1,
-0.942093, -2.441569, -2.668593, 0.9490196, 1, 0, 1,
-0.9389226, -1.49926, -2.869238, 0.945098, 1, 0, 1,
-0.9380056, 0.6027793, -2.239521, 0.9372549, 1, 0, 1,
-0.9344384, -0.4090741, -0.5712969, 0.9333333, 1, 0, 1,
-0.9319214, 1.482711, 0.8220344, 0.9254902, 1, 0, 1,
-0.9302801, 1.53628, 0.730719, 0.9215686, 1, 0, 1,
-0.928484, -0.5333581, -0.4117123, 0.9137255, 1, 0, 1,
-0.9211513, 0.4921893, -0.1165162, 0.9098039, 1, 0, 1,
-0.9038939, 1.355333, 0.04869061, 0.9019608, 1, 0, 1,
-0.8986026, -0.03011798, -1.092364, 0.8941177, 1, 0, 1,
-0.8948169, -1.048682, -1.780093, 0.8901961, 1, 0, 1,
-0.8933642, 0.5153571, -1.302474, 0.8823529, 1, 0, 1,
-0.8916054, -0.4604799, -2.994011, 0.8784314, 1, 0, 1,
-0.8868971, -0.3728956, -3.055477, 0.8705882, 1, 0, 1,
-0.8861138, 1.248542, -0.6468039, 0.8666667, 1, 0, 1,
-0.8857552, -0.6836748, -2.365007, 0.8588235, 1, 0, 1,
-0.8835748, 0.3335621, -2.69294, 0.854902, 1, 0, 1,
-0.8808281, -0.2960129, -1.049408, 0.8470588, 1, 0, 1,
-0.8797663, -0.02861421, -1.857793, 0.8431373, 1, 0, 1,
-0.8742141, 0.4057911, -1.031706, 0.8352941, 1, 0, 1,
-0.8739209, 0.7326974, -1.813122, 0.8313726, 1, 0, 1,
-0.868508, -1.836125, -3.115745, 0.8235294, 1, 0, 1,
-0.8677183, -0.2328583, -1.412211, 0.8196079, 1, 0, 1,
-0.8644843, -0.0850613, -1.89072, 0.8117647, 1, 0, 1,
-0.862314, -0.3422414, -3.284502, 0.8078431, 1, 0, 1,
-0.8607038, -1.274946, -2.543971, 0.8, 1, 0, 1,
-0.8569577, 1.441594, -0.4620138, 0.7921569, 1, 0, 1,
-0.8422577, 0.3646117, -1.709407, 0.7882353, 1, 0, 1,
-0.8394228, -0.7868266, -3.647517, 0.7803922, 1, 0, 1,
-0.8361054, 0.4074286, -0.1473835, 0.7764706, 1, 0, 1,
-0.8343734, 0.7152361, 0.05693851, 0.7686275, 1, 0, 1,
-0.8338166, -0.3263628, -1.745506, 0.7647059, 1, 0, 1,
-0.8318112, 0.6803285, -1.844979, 0.7568628, 1, 0, 1,
-0.8308297, 0.2049147, -1.161989, 0.7529412, 1, 0, 1,
-0.8269454, 0.5018147, -1.988407, 0.7450981, 1, 0, 1,
-0.8172683, 0.3188323, -1.694573, 0.7411765, 1, 0, 1,
-0.8132323, -1.93177, -0.8849974, 0.7333333, 1, 0, 1,
-0.8114678, 0.8006381, -3.374061, 0.7294118, 1, 0, 1,
-0.8079389, 1.190951, -1.0917, 0.7215686, 1, 0, 1,
-0.805316, -0.1297361, -2.352625, 0.7176471, 1, 0, 1,
-0.8048365, -0.6013154, -1.216004, 0.7098039, 1, 0, 1,
-0.8021597, 0.4850484, -0.9464538, 0.7058824, 1, 0, 1,
-0.799838, 1.059207, -0.1550131, 0.6980392, 1, 0, 1,
-0.7975212, 0.5263975, -0.4678303, 0.6901961, 1, 0, 1,
-0.7972036, -0.9839121, -3.467965, 0.6862745, 1, 0, 1,
-0.7971395, 0.3327591, -0.9563591, 0.6784314, 1, 0, 1,
-0.7949091, 1.665235, -1.171983, 0.6745098, 1, 0, 1,
-0.792386, 0.8525588, 0.2203641, 0.6666667, 1, 0, 1,
-0.7857661, -1.190925, -1.963979, 0.6627451, 1, 0, 1,
-0.7851896, -1.664321, -2.685534, 0.654902, 1, 0, 1,
-0.7822707, 0.7120488, -0.8284132, 0.6509804, 1, 0, 1,
-0.7808599, 1.275041, -0.7915631, 0.6431373, 1, 0, 1,
-0.7780024, 1.626124, -1.806729, 0.6392157, 1, 0, 1,
-0.7772378, -0.2470646, -2.948493, 0.6313726, 1, 0, 1,
-0.7750664, 1.597169, 1.10785, 0.627451, 1, 0, 1,
-0.7743303, 1.213609, -0.7797391, 0.6196079, 1, 0, 1,
-0.773807, -1.031709, -2.829656, 0.6156863, 1, 0, 1,
-0.7660522, -0.4611773, -0.3361843, 0.6078432, 1, 0, 1,
-0.7639793, 0.3198128, -1.710936, 0.6039216, 1, 0, 1,
-0.7627189, 0.9359831, 0.7666751, 0.5960785, 1, 0, 1,
-0.7598696, 0.1876448, -1.731776, 0.5882353, 1, 0, 1,
-0.7583733, 0.7871289, -1.837694, 0.5843138, 1, 0, 1,
-0.7533928, 0.3414438, -2.840175, 0.5764706, 1, 0, 1,
-0.7511802, 1.807544, -0.3071489, 0.572549, 1, 0, 1,
-0.7486328, 0.1029472, -3.027015, 0.5647059, 1, 0, 1,
-0.7485728, -0.6856222, -1.478982, 0.5607843, 1, 0, 1,
-0.7476232, -0.3388112, -2.966661, 0.5529412, 1, 0, 1,
-0.7407206, -0.87007, -2.007551, 0.5490196, 1, 0, 1,
-0.7360799, -0.383071, -0.5213389, 0.5411765, 1, 0, 1,
-0.7300475, 0.5182243, -2.834746, 0.5372549, 1, 0, 1,
-0.7262773, 1.404767, 0.3482106, 0.5294118, 1, 0, 1,
-0.7251272, 0.656454, 1.307349, 0.5254902, 1, 0, 1,
-0.7251229, -1.241665, -2.851971, 0.5176471, 1, 0, 1,
-0.7223281, -1.561415, -1.193989, 0.5137255, 1, 0, 1,
-0.7219093, 0.2844488, -1.559168, 0.5058824, 1, 0, 1,
-0.7219057, 0.2927816, 0.2634178, 0.5019608, 1, 0, 1,
-0.720894, -0.9707302, -2.469456, 0.4941176, 1, 0, 1,
-0.7182046, -2.542894, -4.176117, 0.4862745, 1, 0, 1,
-0.7169069, -1.549837, -4.471262, 0.4823529, 1, 0, 1,
-0.7151014, 1.089702, -0.5081912, 0.4745098, 1, 0, 1,
-0.713326, 0.1365795, -1.304468, 0.4705882, 1, 0, 1,
-0.7087485, 0.3833439, -1.14096, 0.4627451, 1, 0, 1,
-0.7082216, -0.5499442, -1.811831, 0.4588235, 1, 0, 1,
-0.7081693, 0.3978971, -0.2985415, 0.4509804, 1, 0, 1,
-0.7065632, 1.614344, -0.09920169, 0.4470588, 1, 0, 1,
-0.7018958, -0.3382684, -3.300439, 0.4392157, 1, 0, 1,
-0.699708, -0.8046651, -2.814314, 0.4352941, 1, 0, 1,
-0.6930701, -1.576244, -2.470736, 0.427451, 1, 0, 1,
-0.6887214, -0.7261057, -2.666192, 0.4235294, 1, 0, 1,
-0.6871986, -1.373961, -2.357584, 0.4156863, 1, 0, 1,
-0.6867622, -1.639262, -2.655848, 0.4117647, 1, 0, 1,
-0.6818259, -0.8889023, -2.233263, 0.4039216, 1, 0, 1,
-0.6815808, 0.9624928, -0.2810262, 0.3960784, 1, 0, 1,
-0.6801251, 0.2628927, -0.3114715, 0.3921569, 1, 0, 1,
-0.6782441, -0.1950684, -1.676748, 0.3843137, 1, 0, 1,
-0.6752203, -2.755392, -4.2281, 0.3803922, 1, 0, 1,
-0.6689233, -1.144758, -2.691798, 0.372549, 1, 0, 1,
-0.6633452, 1.496698, -1.064803, 0.3686275, 1, 0, 1,
-0.6601397, 0.05330426, -2.12129, 0.3607843, 1, 0, 1,
-0.6580895, -1.556058, -3.51562, 0.3568628, 1, 0, 1,
-0.6512424, -0.5079875, -1.607904, 0.3490196, 1, 0, 1,
-0.6494597, 0.7125198, 0.6539875, 0.345098, 1, 0, 1,
-0.6485076, 0.1474444, -0.9171818, 0.3372549, 1, 0, 1,
-0.6470983, -0.6612988, -3.231004, 0.3333333, 1, 0, 1,
-0.6446059, -0.1377444, -1.014524, 0.3254902, 1, 0, 1,
-0.6390718, 0.4456308, -1.05767, 0.3215686, 1, 0, 1,
-0.6326035, -1.255226, -2.105814, 0.3137255, 1, 0, 1,
-0.6248604, 0.03302436, -1.046282, 0.3098039, 1, 0, 1,
-0.6205692, -0.2505316, -4.210478, 0.3019608, 1, 0, 1,
-0.6080126, 1.457895, -1.649387, 0.2941177, 1, 0, 1,
-0.6065707, -1.823194, -1.985247, 0.2901961, 1, 0, 1,
-0.6041002, 1.070252, 0.2674633, 0.282353, 1, 0, 1,
-0.602366, -0.1087884, -3.801434, 0.2784314, 1, 0, 1,
-0.5968093, -0.591656, -3.300625, 0.2705882, 1, 0, 1,
-0.5862886, 0.8676422, -0.1506217, 0.2666667, 1, 0, 1,
-0.579761, -0.7776467, -2.388498, 0.2588235, 1, 0, 1,
-0.5705909, -1.174454, -1.386813, 0.254902, 1, 0, 1,
-0.5652584, -0.4505451, -3.847526, 0.2470588, 1, 0, 1,
-0.5650498, -2.319103, -2.182928, 0.2431373, 1, 0, 1,
-0.5649495, 0.4824058, -1.726331, 0.2352941, 1, 0, 1,
-0.5590016, 1.705971, 1.004872, 0.2313726, 1, 0, 1,
-0.556514, 0.4332902, -1.464177, 0.2235294, 1, 0, 1,
-0.5409751, -0.2349979, -2.624253, 0.2196078, 1, 0, 1,
-0.540068, 1.762535, 2.034246, 0.2117647, 1, 0, 1,
-0.5355414, -1.373267, -3.378073, 0.2078431, 1, 0, 1,
-0.5327331, 0.8498566, 0.04178327, 0.2, 1, 0, 1,
-0.5325567, -0.9453207, -2.255477, 0.1921569, 1, 0, 1,
-0.530099, 1.014238, 0.4123637, 0.1882353, 1, 0, 1,
-0.5294538, 0.4278633, -0.2601029, 0.1803922, 1, 0, 1,
-0.5256159, 0.06045721, -0.710879, 0.1764706, 1, 0, 1,
-0.5233121, -0.6912141, -1.620061, 0.1686275, 1, 0, 1,
-0.5142531, 0.1694393, -2.045493, 0.1647059, 1, 0, 1,
-0.5123205, 1.994843, -1.0572, 0.1568628, 1, 0, 1,
-0.5060818, -0.5205534, -1.147827, 0.1529412, 1, 0, 1,
-0.5053285, -2.031927, -3.270083, 0.145098, 1, 0, 1,
-0.4898822, -0.9135551, -4.081869, 0.1411765, 1, 0, 1,
-0.4844369, 0.731614, 0.3120351, 0.1333333, 1, 0, 1,
-0.4797762, -0.4449564, -2.765983, 0.1294118, 1, 0, 1,
-0.4790378, 0.2881618, -0.6857295, 0.1215686, 1, 0, 1,
-0.4775759, 1.653814, -1.146411, 0.1176471, 1, 0, 1,
-0.4656865, -0.5399088, -0.7713056, 0.1098039, 1, 0, 1,
-0.4584957, -2.619382, -2.981994, 0.1058824, 1, 0, 1,
-0.4560591, 0.9662873, -2.549663, 0.09803922, 1, 0, 1,
-0.4509003, 0.2473527, -1.374073, 0.09019608, 1, 0, 1,
-0.4453725, 1.061168, 0.6088531, 0.08627451, 1, 0, 1,
-0.4449948, 1.007873, 0.5439714, 0.07843138, 1, 0, 1,
-0.4388142, -0.3725107, -3.627629, 0.07450981, 1, 0, 1,
-0.4329544, -0.8776231, -2.035792, 0.06666667, 1, 0, 1,
-0.43276, 0.4231406, 1.388094, 0.0627451, 1, 0, 1,
-0.4275415, -1.830549, -2.98618, 0.05490196, 1, 0, 1,
-0.4213687, 0.7799537, 1.175821, 0.05098039, 1, 0, 1,
-0.4169349, 0.9181479, -0.01264348, 0.04313726, 1, 0, 1,
-0.4140197, -0.1878437, -1.604365, 0.03921569, 1, 0, 1,
-0.4130773, -0.5083082, -3.289612, 0.03137255, 1, 0, 1,
-0.408468, -0.07383708, -2.200748, 0.02745098, 1, 0, 1,
-0.4030499, 0.2102337, -0.9121997, 0.01960784, 1, 0, 1,
-0.4018342, -1.414536, -3.245308, 0.01568628, 1, 0, 1,
-0.3987272, 0.6867966, -0.6861817, 0.007843138, 1, 0, 1,
-0.3896441, 0.205089, -2.318464, 0.003921569, 1, 0, 1,
-0.3893492, -0.0313135, -1.243075, 0, 1, 0.003921569, 1,
-0.3865002, -0.8681473, -3.376377, 0, 1, 0.01176471, 1,
-0.38154, 0.2335529, -1.588626, 0, 1, 0.01568628, 1,
-0.3808497, 0.1042391, -0.2119793, 0, 1, 0.02352941, 1,
-0.378911, -0.5897424, -1.007226, 0, 1, 0.02745098, 1,
-0.3728538, -1.497359, -1.98578, 0, 1, 0.03529412, 1,
-0.3712697, 0.5855759, -0.4323693, 0, 1, 0.03921569, 1,
-0.3698828, 1.161134, 1.318429, 0, 1, 0.04705882, 1,
-0.3688013, -1.092928, -3.10885, 0, 1, 0.05098039, 1,
-0.3686119, -0.8443835, -1.762014, 0, 1, 0.05882353, 1,
-0.366072, 0.3063436, -2.8129, 0, 1, 0.0627451, 1,
-0.3649703, 0.1498053, -2.328417, 0, 1, 0.07058824, 1,
-0.363263, -0.7028618, -2.923873, 0, 1, 0.07450981, 1,
-0.3608942, 0.380047, -0.04823078, 0, 1, 0.08235294, 1,
-0.3575318, 1.564175, 0.409875, 0, 1, 0.08627451, 1,
-0.3560897, -0.383077, -1.43475, 0, 1, 0.09411765, 1,
-0.3532732, -0.280365, -2.029964, 0, 1, 0.1019608, 1,
-0.3513601, -0.44328, -2.357239, 0, 1, 0.1058824, 1,
-0.3501907, -0.6796255, -0.9999611, 0, 1, 0.1137255, 1,
-0.3443744, 1.508716, -2.678367, 0, 1, 0.1176471, 1,
-0.3422426, -0.5841308, -3.328695, 0, 1, 0.1254902, 1,
-0.3400702, 0.07263168, -1.028135, 0, 1, 0.1294118, 1,
-0.3389799, 0.5554361, -1.01015, 0, 1, 0.1372549, 1,
-0.336053, -0.1741341, -1.483534, 0, 1, 0.1411765, 1,
-0.335721, -0.04530893, -2.47253, 0, 1, 0.1490196, 1,
-0.3354982, 0.5359087, 0.1455996, 0, 1, 0.1529412, 1,
-0.3351726, -0.6908528, -2.724513, 0, 1, 0.1607843, 1,
-0.3333984, 0.7194141, -1.747593, 0, 1, 0.1647059, 1,
-0.3224383, 2.035111, -1.42193, 0, 1, 0.172549, 1,
-0.3200222, 1.233117, -1.611425, 0, 1, 0.1764706, 1,
-0.3144505, -0.008299537, 1.399571, 0, 1, 0.1843137, 1,
-0.3132333, 1.233181, 0.5075312, 0, 1, 0.1882353, 1,
-0.3047026, -1.358447, -0.9798262, 0, 1, 0.1960784, 1,
-0.2982515, -1.399637, -2.405725, 0, 1, 0.2039216, 1,
-0.2978429, 0.6488286, 0.9890546, 0, 1, 0.2078431, 1,
-0.2971132, 0.6943177, -1.299394, 0, 1, 0.2156863, 1,
-0.2969072, -1.665143, -4.00079, 0, 1, 0.2196078, 1,
-0.2864289, -1.231637, -2.263556, 0, 1, 0.227451, 1,
-0.2862319, -0.5873919, -0.6254092, 0, 1, 0.2313726, 1,
-0.2849575, 0.3901296, -0.009263185, 0, 1, 0.2392157, 1,
-0.2810865, -1.383353, -3.10647, 0, 1, 0.2431373, 1,
-0.279672, -0.3742437, -2.158945, 0, 1, 0.2509804, 1,
-0.279186, 0.9909987, -0.9286948, 0, 1, 0.254902, 1,
-0.275486, -0.1371684, -3.778808, 0, 1, 0.2627451, 1,
-0.2667525, 0.5774741, -0.3677873, 0, 1, 0.2666667, 1,
-0.2611691, -0.6262388, -2.591727, 0, 1, 0.2745098, 1,
-0.2611678, -2.100319, -2.58597, 0, 1, 0.2784314, 1,
-0.2568308, 0.7468761, 0.4660067, 0, 1, 0.2862745, 1,
-0.2560579, -0.2406636, -2.13262, 0, 1, 0.2901961, 1,
-0.2535806, -0.3469363, -2.257338, 0, 1, 0.2980392, 1,
-0.2498673, 0.005181847, -2.410088, 0, 1, 0.3058824, 1,
-0.2494641, 0.0649764, -1.572947, 0, 1, 0.3098039, 1,
-0.2487631, 0.6184137, 1.414556, 0, 1, 0.3176471, 1,
-0.2482833, 0.6953115, 1.532246, 0, 1, 0.3215686, 1,
-0.2431349, -0.4511625, -3.367673, 0, 1, 0.3294118, 1,
-0.240644, -0.2963064, -1.778175, 0, 1, 0.3333333, 1,
-0.2377168, 0.2977539, -0.5491507, 0, 1, 0.3411765, 1,
-0.2345778, 0.6322133, -1.23961, 0, 1, 0.345098, 1,
-0.2321401, 3.175073, 1.041177, 0, 1, 0.3529412, 1,
-0.2309829, -0.7656105, -2.59064, 0, 1, 0.3568628, 1,
-0.230971, -1.157592, -3.840251, 0, 1, 0.3647059, 1,
-0.2307557, 2.246767, 0.2585757, 0, 1, 0.3686275, 1,
-0.2302529, -0.3450254, -3.109253, 0, 1, 0.3764706, 1,
-0.2278998, -0.6535034, -2.126179, 0, 1, 0.3803922, 1,
-0.222894, -0.5179455, -1.794854, 0, 1, 0.3882353, 1,
-0.2132057, -0.9265876, -4.791184, 0, 1, 0.3921569, 1,
-0.2127724, -0.7659316, -2.423841, 0, 1, 0.4, 1,
-0.2118905, 0.4201332, -0.4951113, 0, 1, 0.4078431, 1,
-0.2086167, 0.1616097, -1.812341, 0, 1, 0.4117647, 1,
-0.2083417, -0.007775587, -1.966875, 0, 1, 0.4196078, 1,
-0.2062385, 1.054469, -2.571146, 0, 1, 0.4235294, 1,
-0.2047553, -0.458882, -2.319695, 0, 1, 0.4313726, 1,
-0.203865, -2.530333, -0.7866981, 0, 1, 0.4352941, 1,
-0.1927514, -0.3579773, -4.059379, 0, 1, 0.4431373, 1,
-0.1923828, 0.5884596, -0.3342799, 0, 1, 0.4470588, 1,
-0.1911004, 1.028456, 0.3159344, 0, 1, 0.454902, 1,
-0.1837152, -0.5984632, -2.963217, 0, 1, 0.4588235, 1,
-0.1814639, -1.431561, -4.066868, 0, 1, 0.4666667, 1,
-0.1812081, -1.058384, -3.410542, 0, 1, 0.4705882, 1,
-0.1795258, -0.2591808, -2.717908, 0, 1, 0.4784314, 1,
-0.1775334, 2.512567, -0.475414, 0, 1, 0.4823529, 1,
-0.1770913, 1.284939, -0.09030344, 0, 1, 0.4901961, 1,
-0.1760805, 2.176659, 1.310441, 0, 1, 0.4941176, 1,
-0.1644097, 0.8202438, -0.3584508, 0, 1, 0.5019608, 1,
-0.1536855, 0.5407121, -0.7037274, 0, 1, 0.509804, 1,
-0.1514246, 1.265219, -0.3605704, 0, 1, 0.5137255, 1,
-0.1483874, -0.1730993, -1.313434, 0, 1, 0.5215687, 1,
-0.1483146, -2.097142, -3.55602, 0, 1, 0.5254902, 1,
-0.1392208, -0.2831852, -3.439162, 0, 1, 0.5333334, 1,
-0.1385912, -0.9133844, -1.665166, 0, 1, 0.5372549, 1,
-0.1368043, 1.320109, -0.617805, 0, 1, 0.5450981, 1,
-0.13195, -1.638695, -3.629413, 0, 1, 0.5490196, 1,
-0.1318541, 0.02410604, -2.636477, 0, 1, 0.5568628, 1,
-0.1302266, 0.2480672, -0.7986624, 0, 1, 0.5607843, 1,
-0.1281018, 2.868383, 0.4310454, 0, 1, 0.5686275, 1,
-0.1228804, -0.6114798, -1.307655, 0, 1, 0.572549, 1,
-0.1213858, 1.020179, -1.251273, 0, 1, 0.5803922, 1,
-0.1198301, -1.964898, -2.569357, 0, 1, 0.5843138, 1,
-0.1154657, 1.057507, -0.2672853, 0, 1, 0.5921569, 1,
-0.1145133, -0.8613989, -2.843586, 0, 1, 0.5960785, 1,
-0.1142922, 0.1510911, -2.638737, 0, 1, 0.6039216, 1,
-0.1131443, -0.3176152, -3.703078, 0, 1, 0.6117647, 1,
-0.1122326, -0.08238821, -2.869287, 0, 1, 0.6156863, 1,
-0.1115048, 0.375219, -1.509285, 0, 1, 0.6235294, 1,
-0.11088, -0.3431204, -2.797161, 0, 1, 0.627451, 1,
-0.109585, -0.5207524, -1.469503, 0, 1, 0.6352941, 1,
-0.1092726, 1.324762, 2.607303, 0, 1, 0.6392157, 1,
-0.1067495, -0.4458292, -2.996751, 0, 1, 0.6470588, 1,
-0.1061746, 0.3179452, -0.06988675, 0, 1, 0.6509804, 1,
-0.1053184, 0.6619664, -0.3385732, 0, 1, 0.6588235, 1,
-0.1037785, -1.284928, -1.922317, 0, 1, 0.6627451, 1,
-0.1023447, -0.1030515, -3.912771, 0, 1, 0.6705883, 1,
-0.09656196, 0.2901634, -1.708066, 0, 1, 0.6745098, 1,
-0.09637412, -2.377825, -2.448141, 0, 1, 0.682353, 1,
-0.09553763, -1.055465, -2.904598, 0, 1, 0.6862745, 1,
-0.09538543, 0.3431702, 0.4355133, 0, 1, 0.6941177, 1,
-0.09299029, 0.1496621, 0.6722479, 0, 1, 0.7019608, 1,
-0.09292591, -0.6862568, -3.233924, 0, 1, 0.7058824, 1,
-0.08838307, 1.08317, -0.513173, 0, 1, 0.7137255, 1,
-0.08130656, -2.703876, -1.74719, 0, 1, 0.7176471, 1,
-0.07703112, -0.2697117, -2.161598, 0, 1, 0.7254902, 1,
-0.07412406, 1.044125, 0.4201798, 0, 1, 0.7294118, 1,
-0.07361784, -0.3073732, -3.421868, 0, 1, 0.7372549, 1,
-0.06983264, 0.2841359, 1.079792, 0, 1, 0.7411765, 1,
-0.06377781, -0.2614512, -1.87171, 0, 1, 0.7490196, 1,
-0.06027254, 0.9809622, 0.7576333, 0, 1, 0.7529412, 1,
-0.05611786, 0.9817182, 0.9825448, 0, 1, 0.7607843, 1,
-0.05496825, 0.4206407, -2.190155, 0, 1, 0.7647059, 1,
-0.04965135, 0.4781154, -0.00384154, 0, 1, 0.772549, 1,
-0.0496497, -0.6649899, -3.359894, 0, 1, 0.7764706, 1,
-0.04913696, -1.522138, -3.51054, 0, 1, 0.7843137, 1,
-0.04528999, -0.7967214, -4.982991, 0, 1, 0.7882353, 1,
-0.04320659, 1.549342, -1.049561, 0, 1, 0.7960784, 1,
-0.04057543, 1.653693, -0.8089897, 0, 1, 0.8039216, 1,
-0.0376799, -0.5033052, -1.515047, 0, 1, 0.8078431, 1,
-0.03474293, 1.676414, 1.862699, 0, 1, 0.8156863, 1,
-0.03334924, 0.6239866, -1.006815, 0, 1, 0.8196079, 1,
-0.02748894, -1.423847, -3.08303, 0, 1, 0.827451, 1,
-0.02528642, 0.9168525, 0.2752351, 0, 1, 0.8313726, 1,
-0.02115084, 0.5017807, -0.6613137, 0, 1, 0.8392157, 1,
-0.01996205, 0.5729814, 0.1288442, 0, 1, 0.8431373, 1,
-0.01783315, -0.5732147, -1.699819, 0, 1, 0.8509804, 1,
-0.008769384, 0.2398757, 0.9339681, 0, 1, 0.854902, 1,
-0.005620423, -0.3922196, -2.904262, 0, 1, 0.8627451, 1,
-0.00148455, -0.2059201, -2.465408, 0, 1, 0.8666667, 1,
0.0005999171, 0.171377, 0.638557, 0, 1, 0.8745098, 1,
0.00312106, 1.069705, -0.3050965, 0, 1, 0.8784314, 1,
0.007350232, -1.119951, 3.607392, 0, 1, 0.8862745, 1,
0.01124286, -0.7079129, 1.691132, 0, 1, 0.8901961, 1,
0.01622127, 0.960015, -0.09043244, 0, 1, 0.8980392, 1,
0.01815343, -0.7765882, 2.759095, 0, 1, 0.9058824, 1,
0.01833373, 1.083136, -2.589163, 0, 1, 0.9098039, 1,
0.01949583, 0.6301091, 1.170386, 0, 1, 0.9176471, 1,
0.0196598, -0.4007218, 2.197039, 0, 1, 0.9215686, 1,
0.02302989, 0.2287469, 0.2648456, 0, 1, 0.9294118, 1,
0.02416555, 0.7027515, 0.2432918, 0, 1, 0.9333333, 1,
0.02730085, -1.419015, 2.220514, 0, 1, 0.9411765, 1,
0.02787186, 0.3723506, 0.1163646, 0, 1, 0.945098, 1,
0.02792042, 0.2635672, -0.1127493, 0, 1, 0.9529412, 1,
0.02822803, -0.4733895, 4.164534, 0, 1, 0.9568627, 1,
0.03180174, -0.7362635, 4.190464, 0, 1, 0.9647059, 1,
0.0324765, -1.469156, 4.542009, 0, 1, 0.9686275, 1,
0.03613637, -0.2685683, 3.409283, 0, 1, 0.9764706, 1,
0.03642672, -1.477487, 2.813997, 0, 1, 0.9803922, 1,
0.0373278, -0.2532763, 1.701987, 0, 1, 0.9882353, 1,
0.04082992, -0.4891454, 2.679803, 0, 1, 0.9921569, 1,
0.04306931, 0.1248548, -0.6555912, 0, 1, 1, 1,
0.0443368, 0.6936315, 0.7668236, 0, 0.9921569, 1, 1,
0.0477724, -0.5712379, 2.072877, 0, 0.9882353, 1, 1,
0.05170892, 0.3305143, 1.741806, 0, 0.9803922, 1, 1,
0.05221014, -0.6142779, 3.437354, 0, 0.9764706, 1, 1,
0.05319132, -0.5102594, 2.867237, 0, 0.9686275, 1, 1,
0.05370587, -0.7994319, 3.474186, 0, 0.9647059, 1, 1,
0.05380806, -1.074566, 4.128845, 0, 0.9568627, 1, 1,
0.05557201, -0.5818634, 3.322808, 0, 0.9529412, 1, 1,
0.05673465, -0.8739676, 3.885328, 0, 0.945098, 1, 1,
0.05717185, -0.3399101, 3.427685, 0, 0.9411765, 1, 1,
0.05733559, 0.1647307, 2.334465, 0, 0.9333333, 1, 1,
0.05913139, -0.6848009, 4.681406, 0, 0.9294118, 1, 1,
0.06434855, 0.9165868, -0.5090569, 0, 0.9215686, 1, 1,
0.06846129, -0.3611312, 2.531385, 0, 0.9176471, 1, 1,
0.07011857, -1.074641, 4.042489, 0, 0.9098039, 1, 1,
0.07379615, -0.5766871, 2.620469, 0, 0.9058824, 1, 1,
0.07414136, 0.4948157, 0.6315104, 0, 0.8980392, 1, 1,
0.0752541, 0.5137934, 0.8251601, 0, 0.8901961, 1, 1,
0.0754022, -0.4866175, 2.817279, 0, 0.8862745, 1, 1,
0.07722989, -0.6301481, 1.409827, 0, 0.8784314, 1, 1,
0.07785365, -1.294731, 4.813501, 0, 0.8745098, 1, 1,
0.07816611, 0.4456852, 0.2374109, 0, 0.8666667, 1, 1,
0.08070959, -0.7738506, 2.596424, 0, 0.8627451, 1, 1,
0.08592201, 0.8126204, -0.3116309, 0, 0.854902, 1, 1,
0.08648503, -0.8009848, 2.514244, 0, 0.8509804, 1, 1,
0.08828261, 1.281565, -0.3672156, 0, 0.8431373, 1, 1,
0.08959968, -0.836894, 3.092127, 0, 0.8392157, 1, 1,
0.0957373, 0.6571223, -0.5741115, 0, 0.8313726, 1, 1,
0.1003192, 0.5049126, -0.7531443, 0, 0.827451, 1, 1,
0.1070995, -1.654069, 3.360639, 0, 0.8196079, 1, 1,
0.1075455, 0.4157371, 0.04213938, 0, 0.8156863, 1, 1,
0.1110042, -1.906452, 4.478978, 0, 0.8078431, 1, 1,
0.1126023, -1.459988, 2.525463, 0, 0.8039216, 1, 1,
0.1156758, 1.169135, 0.3566061, 0, 0.7960784, 1, 1,
0.1164211, 0.2957124, 0.3980178, 0, 0.7882353, 1, 1,
0.1197444, 2.922073, 0.2540668, 0, 0.7843137, 1, 1,
0.1212827, -1.100137, 3.393625, 0, 0.7764706, 1, 1,
0.1214043, -2.349049, 5.638082, 0, 0.772549, 1, 1,
0.1227665, 0.1303614, 2.184369, 0, 0.7647059, 1, 1,
0.1267738, 0.3189296, 1.71421, 0, 0.7607843, 1, 1,
0.1282234, -0.46507, 4.161813, 0, 0.7529412, 1, 1,
0.1286564, 0.8665147, 2.102253, 0, 0.7490196, 1, 1,
0.1293786, -1.231457, 3.089187, 0, 0.7411765, 1, 1,
0.1315929, 0.8703511, 1.111573, 0, 0.7372549, 1, 1,
0.1318513, -0.4528093, 4.354865, 0, 0.7294118, 1, 1,
0.141317, -0.2082706, 0.8469039, 0, 0.7254902, 1, 1,
0.1425368, 0.4942172, 1.286062, 0, 0.7176471, 1, 1,
0.145555, 0.9145945, -0.4827858, 0, 0.7137255, 1, 1,
0.1483432, -0.7949502, 2.021236, 0, 0.7058824, 1, 1,
0.1483489, 0.6609138, -0.76616, 0, 0.6980392, 1, 1,
0.1507815, -0.05937665, 3.998963, 0, 0.6941177, 1, 1,
0.1513261, -1.24905, 3.049573, 0, 0.6862745, 1, 1,
0.1685283, 0.01640878, 0.5913019, 0, 0.682353, 1, 1,
0.1687673, -0.5751398, 2.704874, 0, 0.6745098, 1, 1,
0.1703838, -1.448487, 2.045626, 0, 0.6705883, 1, 1,
0.1712385, 0.1617234, 0.416714, 0, 0.6627451, 1, 1,
0.1740022, 0.2677169, 1.266123, 0, 0.6588235, 1, 1,
0.174966, 2.329479, -1.954036, 0, 0.6509804, 1, 1,
0.1751145, -0.09250481, 2.220549, 0, 0.6470588, 1, 1,
0.1790855, 0.5990469, -1.818172, 0, 0.6392157, 1, 1,
0.183693, 1.203099, 1.729095, 0, 0.6352941, 1, 1,
0.1872435, 1.250975, 3.320024, 0, 0.627451, 1, 1,
0.1889175, -0.3433719, 2.935096, 0, 0.6235294, 1, 1,
0.19271, 0.1167166, 1.834101, 0, 0.6156863, 1, 1,
0.1956889, -1.342434, 2.31601, 0, 0.6117647, 1, 1,
0.1974165, -0.6826986, 1.863924, 0, 0.6039216, 1, 1,
0.1993952, 0.3560028, 0.5617349, 0, 0.5960785, 1, 1,
0.1996143, 0.6414526, 1.048947, 0, 0.5921569, 1, 1,
0.2008776, -0.2349221, 2.2177, 0, 0.5843138, 1, 1,
0.2062707, 0.2168817, 1.838355, 0, 0.5803922, 1, 1,
0.2169889, -0.9384847, 4.664734, 0, 0.572549, 1, 1,
0.2183763, 1.975922, 1.262264, 0, 0.5686275, 1, 1,
0.2195426, 0.6409149, 0.394215, 0, 0.5607843, 1, 1,
0.2210579, 0.2066218, 2.751823, 0, 0.5568628, 1, 1,
0.2238071, -1.128001, 1.315071, 0, 0.5490196, 1, 1,
0.2265563, 0.9405199, 0.2326114, 0, 0.5450981, 1, 1,
0.2266268, 1.41551, 1.225213, 0, 0.5372549, 1, 1,
0.2297872, 0.4361247, 0.5137728, 0, 0.5333334, 1, 1,
0.2365287, 0.744503, -1.236946, 0, 0.5254902, 1, 1,
0.2378099, -0.4307021, 2.293894, 0, 0.5215687, 1, 1,
0.2408171, 1.175742, 0.3143049, 0, 0.5137255, 1, 1,
0.2418466, -0.6790382, 2.567614, 0, 0.509804, 1, 1,
0.2428993, -0.009861375, 0.3063286, 0, 0.5019608, 1, 1,
0.2432145, 1.244452, -1.581155, 0, 0.4941176, 1, 1,
0.2441582, -0.315336, 2.721732, 0, 0.4901961, 1, 1,
0.2457961, -0.7185001, 3.746294, 0, 0.4823529, 1, 1,
0.2526574, -0.2003852, 1.705674, 0, 0.4784314, 1, 1,
0.2545849, 0.4311895, -0.3772232, 0, 0.4705882, 1, 1,
0.2554011, 1.082201, -0.2775221, 0, 0.4666667, 1, 1,
0.2564209, -0.2924702, 2.909163, 0, 0.4588235, 1, 1,
0.2612031, 1.395503, 1.151069, 0, 0.454902, 1, 1,
0.2625453, -0.4050524, 2.697774, 0, 0.4470588, 1, 1,
0.2633518, -1.038714, 3.754179, 0, 0.4431373, 1, 1,
0.2648888, 0.9583597, 2.250894, 0, 0.4352941, 1, 1,
0.2678599, 1.335451, 0.1182937, 0, 0.4313726, 1, 1,
0.269006, -0.7904897, 1.88577, 0, 0.4235294, 1, 1,
0.26964, -0.3143091, 1.501339, 0, 0.4196078, 1, 1,
0.2706752, -0.2598512, 1.439085, 0, 0.4117647, 1, 1,
0.2707218, 0.5415289, 0.7273955, 0, 0.4078431, 1, 1,
0.2785705, 0.7248667, -1.052428, 0, 0.4, 1, 1,
0.280595, 0.5405729, -0.361873, 0, 0.3921569, 1, 1,
0.2846609, 0.3076723, 1.889004, 0, 0.3882353, 1, 1,
0.2847559, 0.2344282, -0.1556903, 0, 0.3803922, 1, 1,
0.2897779, -0.08856007, 2.501931, 0, 0.3764706, 1, 1,
0.2898666, 0.2700075, 0.9051919, 0, 0.3686275, 1, 1,
0.2920577, -0.5322804, 3.277994, 0, 0.3647059, 1, 1,
0.2937253, -0.04492482, 1.021886, 0, 0.3568628, 1, 1,
0.2968024, 0.6468478, 0.1040005, 0, 0.3529412, 1, 1,
0.2976575, -0.07700247, 2.030491, 0, 0.345098, 1, 1,
0.3001214, 0.08432796, 1.7822, 0, 0.3411765, 1, 1,
0.3072652, 0.9927012, -0.4392376, 0, 0.3333333, 1, 1,
0.3089842, 0.7346011, 0.2954908, 0, 0.3294118, 1, 1,
0.3128717, -1.689901, 1.743829, 0, 0.3215686, 1, 1,
0.3132258, -0.5879933, 2.348745, 0, 0.3176471, 1, 1,
0.3144385, 0.2599695, 1.891062, 0, 0.3098039, 1, 1,
0.3168792, 0.2968966, 0.5287442, 0, 0.3058824, 1, 1,
0.3173366, 0.3025026, -0.2581477, 0, 0.2980392, 1, 1,
0.3176325, 0.1337022, 3.068546, 0, 0.2901961, 1, 1,
0.3187351, 0.07601167, 1.749346, 0, 0.2862745, 1, 1,
0.3270718, -1.831886, 3.025514, 0, 0.2784314, 1, 1,
0.3306491, -1.361336, 3.826287, 0, 0.2745098, 1, 1,
0.3313116, -0.9195699, 2.101293, 0, 0.2666667, 1, 1,
0.3363173, 0.569035, -1.708518, 0, 0.2627451, 1, 1,
0.3365369, 0.01822128, 0.807516, 0, 0.254902, 1, 1,
0.3410605, -0.1620082, 0.3947607, 0, 0.2509804, 1, 1,
0.3411089, -0.7472899, 3.513164, 0, 0.2431373, 1, 1,
0.3424784, -0.3273341, 2.98597, 0, 0.2392157, 1, 1,
0.3476897, -0.5103061, 1.088001, 0, 0.2313726, 1, 1,
0.3550937, -0.2337329, 0.8153169, 0, 0.227451, 1, 1,
0.3578751, 0.5931949, 1.508073, 0, 0.2196078, 1, 1,
0.358373, 1.54015, 1.615193, 0, 0.2156863, 1, 1,
0.3591494, -0.4863792, 3.047732, 0, 0.2078431, 1, 1,
0.3617305, -0.8825291, 1.502636, 0, 0.2039216, 1, 1,
0.3671427, -0.3655827, 2.363994, 0, 0.1960784, 1, 1,
0.3717161, 0.07328172, 1.385938, 0, 0.1882353, 1, 1,
0.371847, -1.550776, 3.155687, 0, 0.1843137, 1, 1,
0.3747134, 0.1309488, 1.194245, 0, 0.1764706, 1, 1,
0.3748229, 1.601134, 1.495774, 0, 0.172549, 1, 1,
0.3769394, 0.03794637, 1.790883, 0, 0.1647059, 1, 1,
0.3802156, -0.279041, 3.021251, 0, 0.1607843, 1, 1,
0.3856747, -0.8361019, 1.931337, 0, 0.1529412, 1, 1,
0.396524, -0.3739278, 1.617044, 0, 0.1490196, 1, 1,
0.4019202, -1.438102, 3.626107, 0, 0.1411765, 1, 1,
0.4036981, 0.7615215, 1.47685, 0, 0.1372549, 1, 1,
0.4041465, 0.01506682, -0.0139175, 0, 0.1294118, 1, 1,
0.4045679, -0.9573281, 3.64148, 0, 0.1254902, 1, 1,
0.4062479, -0.504779, 2.344074, 0, 0.1176471, 1, 1,
0.4108753, -0.2616139, 2.668582, 0, 0.1137255, 1, 1,
0.4112084, 0.6100656, 2.065492, 0, 0.1058824, 1, 1,
0.4119642, 0.5378418, 0.3629927, 0, 0.09803922, 1, 1,
0.4217215, -0.1206898, 3.62521, 0, 0.09411765, 1, 1,
0.4259117, 1.146297, -0.4467583, 0, 0.08627451, 1, 1,
0.4270943, -0.9098028, 1.462157, 0, 0.08235294, 1, 1,
0.4313874, -0.7159436, 3.464668, 0, 0.07450981, 1, 1,
0.4377788, 0.5553905, 0.6025789, 0, 0.07058824, 1, 1,
0.4383046, 1.191872, -1.616045, 0, 0.0627451, 1, 1,
0.4394962, 1.241428, 0.6052613, 0, 0.05882353, 1, 1,
0.4398448, -1.406574, 1.263859, 0, 0.05098039, 1, 1,
0.4453286, -2.397444, 1.606181, 0, 0.04705882, 1, 1,
0.4472563, 2.722168, 3.309122, 0, 0.03921569, 1, 1,
0.4485877, 0.4402851, 0.1435364, 0, 0.03529412, 1, 1,
0.4499679, 0.1128312, 1.561764, 0, 0.02745098, 1, 1,
0.4537907, -1.614386, 2.978026, 0, 0.02352941, 1, 1,
0.4550904, 1.082719, -0.8798899, 0, 0.01568628, 1, 1,
0.4577705, 1.880266, 1.045713, 0, 0.01176471, 1, 1,
0.4590169, 0.285292, 1.112753, 0, 0.003921569, 1, 1,
0.4602188, -1.102843, 1.804853, 0.003921569, 0, 1, 1,
0.4603648, -1.331793, 2.995044, 0.007843138, 0, 1, 1,
0.4636433, 0.5696474, 1.7834, 0.01568628, 0, 1, 1,
0.4676206, 1.54386, 0.8947758, 0.01960784, 0, 1, 1,
0.4708882, 0.2008827, 2.727188, 0.02745098, 0, 1, 1,
0.4718898, -0.3669697, 1.970697, 0.03137255, 0, 1, 1,
0.4795918, 0.06403641, 2.065217, 0.03921569, 0, 1, 1,
0.4806471, -0.3925162, 1.096823, 0.04313726, 0, 1, 1,
0.4807654, -0.9080361, 2.113519, 0.05098039, 0, 1, 1,
0.4812197, 0.4757703, 0.9637303, 0.05490196, 0, 1, 1,
0.4881563, -1.126289, 2.539877, 0.0627451, 0, 1, 1,
0.4930275, 0.1321871, 1.235158, 0.06666667, 0, 1, 1,
0.4936011, -0.6558165, 3.564997, 0.07450981, 0, 1, 1,
0.4961439, 0.3189393, 1.456259, 0.07843138, 0, 1, 1,
0.5048416, 0.2747522, 1.214028, 0.08627451, 0, 1, 1,
0.5048992, -0.1170061, 2.577497, 0.09019608, 0, 1, 1,
0.5074459, 1.235406, -0.1195164, 0.09803922, 0, 1, 1,
0.513167, -0.1560669, 2.127133, 0.1058824, 0, 1, 1,
0.515079, -0.1797148, 3.289734, 0.1098039, 0, 1, 1,
0.5211492, -0.2753704, 0.9828779, 0.1176471, 0, 1, 1,
0.5215157, -1.271319, 3.652086, 0.1215686, 0, 1, 1,
0.5225478, -0.8185889, 2.697606, 0.1294118, 0, 1, 1,
0.5263593, 0.995474, 0.6541538, 0.1333333, 0, 1, 1,
0.5270702, -0.8317019, 1.538451, 0.1411765, 0, 1, 1,
0.5282175, -1.913012, 3.407622, 0.145098, 0, 1, 1,
0.5309212, -1.187956, 3.213317, 0.1529412, 0, 1, 1,
0.5310041, 0.06511883, 1.042672, 0.1568628, 0, 1, 1,
0.537589, -0.8197263, 1.603291, 0.1647059, 0, 1, 1,
0.538219, -0.1655917, 1.78149, 0.1686275, 0, 1, 1,
0.5387108, 0.6924149, 1.698429, 0.1764706, 0, 1, 1,
0.5391102, -1.036714, 2.303912, 0.1803922, 0, 1, 1,
0.5465789, -1.579407, 2.405935, 0.1882353, 0, 1, 1,
0.5494919, 1.467936, -0.07944607, 0.1921569, 0, 1, 1,
0.5514065, 0.2767972, 0.4191649, 0.2, 0, 1, 1,
0.5515274, -0.1509392, 3.030891, 0.2078431, 0, 1, 1,
0.5530092, -0.826013, 2.45292, 0.2117647, 0, 1, 1,
0.5667881, -1.535816, 3.77536, 0.2196078, 0, 1, 1,
0.5671788, -0.2550176, 1.411467, 0.2235294, 0, 1, 1,
0.5682994, 1.209501, 0.5519034, 0.2313726, 0, 1, 1,
0.573573, -1.895702, 1.685661, 0.2352941, 0, 1, 1,
0.5757304, 0.6945239, 2.127596, 0.2431373, 0, 1, 1,
0.5783003, 0.2212864, 0.7908239, 0.2470588, 0, 1, 1,
0.5787907, 0.7217015, 2.122797, 0.254902, 0, 1, 1,
0.5871954, -0.711002, 3.526973, 0.2588235, 0, 1, 1,
0.5912877, -1.766373, 3.279318, 0.2666667, 0, 1, 1,
0.5914066, -0.1038664, 1.999688, 0.2705882, 0, 1, 1,
0.5917861, -0.8720714, 1.621293, 0.2784314, 0, 1, 1,
0.5955061, 2.647237, 2.203323, 0.282353, 0, 1, 1,
0.5994813, -0.8516052, 3.02787, 0.2901961, 0, 1, 1,
0.6023337, 0.2392927, 2.528338, 0.2941177, 0, 1, 1,
0.6048903, -0.7722101, 3.438997, 0.3019608, 0, 1, 1,
0.6066114, 1.339783, 1.286899, 0.3098039, 0, 1, 1,
0.6076334, -0.8439712, 3.338865, 0.3137255, 0, 1, 1,
0.6090707, 0.8217399, -0.2945158, 0.3215686, 0, 1, 1,
0.6103703, 0.08138627, 0.8386038, 0.3254902, 0, 1, 1,
0.6136345, 2.131423, 0.05478372, 0.3333333, 0, 1, 1,
0.6138114, -1.008034, 2.664296, 0.3372549, 0, 1, 1,
0.6155297, 0.6417787, -0.4132024, 0.345098, 0, 1, 1,
0.6197196, -0.2543822, -1.426082, 0.3490196, 0, 1, 1,
0.6203446, -0.4335202, 2.553194, 0.3568628, 0, 1, 1,
0.6245309, -0.1394898, 2.004454, 0.3607843, 0, 1, 1,
0.6270763, 0.3803662, 1.892271, 0.3686275, 0, 1, 1,
0.6299837, 0.3672649, 1.12526, 0.372549, 0, 1, 1,
0.631991, 0.5852407, 1.760332, 0.3803922, 0, 1, 1,
0.6339856, 0.2637498, -0.07900926, 0.3843137, 0, 1, 1,
0.6395311, -1.203204, 2.054289, 0.3921569, 0, 1, 1,
0.6405772, 0.9817719, 0.8361107, 0.3960784, 0, 1, 1,
0.6463361, -1.37283, 1.480238, 0.4039216, 0, 1, 1,
0.6471919, -0.8107291, 2.292145, 0.4117647, 0, 1, 1,
0.6528147, -1.605153, 2.534776, 0.4156863, 0, 1, 1,
0.6546558, 0.5044604, 2.527138, 0.4235294, 0, 1, 1,
0.6557947, -1.008573, 1.102795, 0.427451, 0, 1, 1,
0.6563678, -0.2105507, 0.08138764, 0.4352941, 0, 1, 1,
0.6574818, 0.9061894, 2.012522, 0.4392157, 0, 1, 1,
0.6589705, 0.2700703, 1.121133, 0.4470588, 0, 1, 1,
0.6646908, -2.034826, 2.881579, 0.4509804, 0, 1, 1,
0.6652658, 0.7069305, 1.558253, 0.4588235, 0, 1, 1,
0.6664448, -1.783349, 3.086363, 0.4627451, 0, 1, 1,
0.6688237, 0.1043326, -0.2708865, 0.4705882, 0, 1, 1,
0.6733513, -0.7327314, 3.766977, 0.4745098, 0, 1, 1,
0.6778498, -1.787891, 3.421346, 0.4823529, 0, 1, 1,
0.6783704, -0.9435033, 1.380133, 0.4862745, 0, 1, 1,
0.6858341, 1.088661, -0.3343706, 0.4941176, 0, 1, 1,
0.6867802, 0.6693248, 1.084708, 0.5019608, 0, 1, 1,
0.6868655, 1.488566, 1.138827, 0.5058824, 0, 1, 1,
0.690971, -0.6194201, 1.639145, 0.5137255, 0, 1, 1,
0.6939911, -1.325095, 2.090819, 0.5176471, 0, 1, 1,
0.7055543, 0.02680668, 0.4077542, 0.5254902, 0, 1, 1,
0.7157532, 0.7326958, 1.444811, 0.5294118, 0, 1, 1,
0.7176083, 1.181982, 0.3875485, 0.5372549, 0, 1, 1,
0.7234622, -0.1754159, 1.315619, 0.5411765, 0, 1, 1,
0.7259629, -0.04378503, 2.425156, 0.5490196, 0, 1, 1,
0.7288866, -0.3140278, 0.5957921, 0.5529412, 0, 1, 1,
0.7321165, -0.9444573, 2.913364, 0.5607843, 0, 1, 1,
0.7329726, -1.286132, 1.856903, 0.5647059, 0, 1, 1,
0.74325, 0.5926929, 0.03090398, 0.572549, 0, 1, 1,
0.7448456, -0.4840588, 2.896124, 0.5764706, 0, 1, 1,
0.745706, -0.3472788, 2.575627, 0.5843138, 0, 1, 1,
0.7534747, -0.7654045, -0.06138683, 0.5882353, 0, 1, 1,
0.7663021, 0.1541514, 4.290002, 0.5960785, 0, 1, 1,
0.7667848, -0.2858213, 2.270246, 0.6039216, 0, 1, 1,
0.7721058, 0.25579, 0.6693931, 0.6078432, 0, 1, 1,
0.7747972, 0.2942139, 1.478914, 0.6156863, 0, 1, 1,
0.7799733, 0.5489722, 1.956533, 0.6196079, 0, 1, 1,
0.7853621, 1.431211, 0.09804824, 0.627451, 0, 1, 1,
0.787046, 0.5519251, 0.3250846, 0.6313726, 0, 1, 1,
0.7948789, 0.08824654, 2.295817, 0.6392157, 0, 1, 1,
0.8002654, 0.6087024, 0.6077759, 0.6431373, 0, 1, 1,
0.8012015, 1.295099, 1.610653, 0.6509804, 0, 1, 1,
0.8058618, 1.170546, 0.9965999, 0.654902, 0, 1, 1,
0.8064782, -0.317428, 2.44967, 0.6627451, 0, 1, 1,
0.8075612, -1.205762, 3.584605, 0.6666667, 0, 1, 1,
0.8086541, 0.6388212, 0.201896, 0.6745098, 0, 1, 1,
0.8096645, 0.2758749, 0.9160177, 0.6784314, 0, 1, 1,
0.8124369, -0.6376349, 2.312929, 0.6862745, 0, 1, 1,
0.8130054, 0.1517123, 0.4409874, 0.6901961, 0, 1, 1,
0.8158768, 0.3677317, -0.8377814, 0.6980392, 0, 1, 1,
0.8230129, -1.552194, 3.839471, 0.7058824, 0, 1, 1,
0.8275186, 1.129894, 0.3338051, 0.7098039, 0, 1, 1,
0.8391942, 0.2534455, 1.807524, 0.7176471, 0, 1, 1,
0.8401731, 0.7114441, 0.1777917, 0.7215686, 0, 1, 1,
0.842218, -0.7919353, 3.511822, 0.7294118, 0, 1, 1,
0.8427877, -2.843389, 3.125515, 0.7333333, 0, 1, 1,
0.8437583, -0.463899, 3.469318, 0.7411765, 0, 1, 1,
0.8444737, -0.8102415, 2.837182, 0.7450981, 0, 1, 1,
0.8457938, -0.847243, 3.766347, 0.7529412, 0, 1, 1,
0.8464626, 0.1916715, 0.6931849, 0.7568628, 0, 1, 1,
0.8479181, -0.5733076, 3.419859, 0.7647059, 0, 1, 1,
0.8514473, 1.375914, 0.8954315, 0.7686275, 0, 1, 1,
0.8537408, -0.1050668, 0.4997035, 0.7764706, 0, 1, 1,
0.8539866, -1.93977, 2.838962, 0.7803922, 0, 1, 1,
0.8565181, 0.1377028, 1.221734, 0.7882353, 0, 1, 1,
0.8586082, 1.725245, 0.9051826, 0.7921569, 0, 1, 1,
0.8602761, 0.4495728, 1.112562, 0.8, 0, 1, 1,
0.8608602, -0.7953835, 2.5753, 0.8078431, 0, 1, 1,
0.8612635, 2.069944, 0.693226, 0.8117647, 0, 1, 1,
0.8614134, 0.5085208, 2.774026, 0.8196079, 0, 1, 1,
0.8655353, 1.36701, -0.5135686, 0.8235294, 0, 1, 1,
0.8752809, -1.800369, 2.600581, 0.8313726, 0, 1, 1,
0.8841897, 0.2401385, 1.163595, 0.8352941, 0, 1, 1,
0.8852741, 1.044618, 0.8394102, 0.8431373, 0, 1, 1,
0.8885602, 0.3904083, 1.26648, 0.8470588, 0, 1, 1,
0.8889051, -1.008742, 2.191638, 0.854902, 0, 1, 1,
0.8906116, -0.9723254, -0.6610652, 0.8588235, 0, 1, 1,
0.8932859, -1.622145, 3.209485, 0.8666667, 0, 1, 1,
0.8981922, 0.5665914, 1.895955, 0.8705882, 0, 1, 1,
0.9018089, 0.1463047, 0.9203143, 0.8784314, 0, 1, 1,
0.9057354, 0.7825304, 2.466345, 0.8823529, 0, 1, 1,
0.9107051, -2.066741, 1.030393, 0.8901961, 0, 1, 1,
0.9144861, 0.9078935, 1.71504, 0.8941177, 0, 1, 1,
0.9160237, 0.5790431, 0.4857678, 0.9019608, 0, 1, 1,
0.9248888, -1.084824, 1.884721, 0.9098039, 0, 1, 1,
0.9271089, -0.8340603, 0.7137809, 0.9137255, 0, 1, 1,
0.9295648, -1.005362, 3.218233, 0.9215686, 0, 1, 1,
0.9307806, -0.7629037, 1.014064, 0.9254902, 0, 1, 1,
0.9320025, -0.01273298, 1.772407, 0.9333333, 0, 1, 1,
0.9335902, -0.697547, 3.377587, 0.9372549, 0, 1, 1,
0.9472046, 0.7885208, 1.316755, 0.945098, 0, 1, 1,
0.9558585, 1.367719, 0.5607181, 0.9490196, 0, 1, 1,
0.9568728, 0.8510484, 2.229899, 0.9568627, 0, 1, 1,
0.9570825, 0.6607949, 1.716384, 0.9607843, 0, 1, 1,
0.9591132, 1.289536, 2.140787, 0.9686275, 0, 1, 1,
0.9600006, 0.3365029, 1.931951, 0.972549, 0, 1, 1,
0.9623462, 1.979964, 1.06178, 0.9803922, 0, 1, 1,
0.9625638, 0.233079, 3.565958, 0.9843137, 0, 1, 1,
0.9703156, 0.4329971, 1.398515, 0.9921569, 0, 1, 1,
0.9720941, 0.8497822, 0.7615826, 0.9960784, 0, 1, 1,
0.9730836, -1.132622, 2.228009, 1, 0, 0.9960784, 1,
0.9870457, -0.9021945, 3.395666, 1, 0, 0.9882353, 1,
0.9942354, 0.1263627, 1.305096, 1, 0, 0.9843137, 1,
0.9955219, -0.08389368, 1.669063, 1, 0, 0.9764706, 1,
1.005915, -0.6260071, 1.94773, 1, 0, 0.972549, 1,
1.013393, -0.08251262, 1.857961, 1, 0, 0.9647059, 1,
1.014228, 0.2142023, 1.018422, 1, 0, 0.9607843, 1,
1.014954, 0.3682348, -1.382706, 1, 0, 0.9529412, 1,
1.017265, 0.06180392, 0.327014, 1, 0, 0.9490196, 1,
1.019047, -0.5026283, 0.7869129, 1, 0, 0.9411765, 1,
1.020175, 0.2596206, 1.068249, 1, 0, 0.9372549, 1,
1.031049, -0.6423254, 2.571341, 1, 0, 0.9294118, 1,
1.03338, 1.057059, 1.922923, 1, 0, 0.9254902, 1,
1.033753, 1.142917, 0.4969662, 1, 0, 0.9176471, 1,
1.046785, 0.3021155, 0.4494775, 1, 0, 0.9137255, 1,
1.048459, -0.3040442, 2.657698, 1, 0, 0.9058824, 1,
1.059786, -0.5317293, 2.805194, 1, 0, 0.9019608, 1,
1.068066, 0.4817689, 2.074566, 1, 0, 0.8941177, 1,
1.068613, -0.4409445, 0.4649889, 1, 0, 0.8862745, 1,
1.081173, 2.131571, 2.678737, 1, 0, 0.8823529, 1,
1.087113, -0.6270856, -0.1526551, 1, 0, 0.8745098, 1,
1.089841, -0.7096837, 1.7063, 1, 0, 0.8705882, 1,
1.092179, -0.3993498, 2.604061, 1, 0, 0.8627451, 1,
1.095166, -0.4972564, 0.8148404, 1, 0, 0.8588235, 1,
1.122227, 0.5728915, 1.826441, 1, 0, 0.8509804, 1,
1.122253, -0.7799084, 3.019256, 1, 0, 0.8470588, 1,
1.134884, -1.092733, 0.991578, 1, 0, 0.8392157, 1,
1.136188, -0.3887444, 2.634723, 1, 0, 0.8352941, 1,
1.13866, -1.199059, 1.706721, 1, 0, 0.827451, 1,
1.14803, 0.3195575, 0.2714088, 1, 0, 0.8235294, 1,
1.162419, -0.3906442, 2.111313, 1, 0, 0.8156863, 1,
1.162796, 0.1478807, 1.598048, 1, 0, 0.8117647, 1,
1.166048, -0.1609931, 2.183366, 1, 0, 0.8039216, 1,
1.169747, 0.2940423, 1.116252, 1, 0, 0.7960784, 1,
1.172205, 0.1483943, 0.6875879, 1, 0, 0.7921569, 1,
1.172324, 1.189566, 2.146171, 1, 0, 0.7843137, 1,
1.178499, -1.642443, 3.632496, 1, 0, 0.7803922, 1,
1.183289, 2.096241, 0.5267404, 1, 0, 0.772549, 1,
1.191008, 0.1885096, -0.2431609, 1, 0, 0.7686275, 1,
1.195005, -0.6829641, 1.173368, 1, 0, 0.7607843, 1,
1.196223, -0.1074335, 0.3674057, 1, 0, 0.7568628, 1,
1.196755, -0.5837397, 2.58253, 1, 0, 0.7490196, 1,
1.20103, 1.711174, 0.7494707, 1, 0, 0.7450981, 1,
1.204217, 0.9023792, 1.146791, 1, 0, 0.7372549, 1,
1.214654, -0.2115391, 4.395356, 1, 0, 0.7333333, 1,
1.214961, -0.3957566, 2.798085, 1, 0, 0.7254902, 1,
1.21565, 0.8633544, 0.5495237, 1, 0, 0.7215686, 1,
1.216963, 0.4099747, 0.5540711, 1, 0, 0.7137255, 1,
1.217343, -1.755685, 2.102658, 1, 0, 0.7098039, 1,
1.223983, 0.1506229, 2.474371, 1, 0, 0.7019608, 1,
1.22928, 0.2158365, 1.643628, 1, 0, 0.6941177, 1,
1.23115, -0.342479, 1.019802, 1, 0, 0.6901961, 1,
1.232937, 0.3550679, 1.494223, 1, 0, 0.682353, 1,
1.233466, 0.5108395, 1.755055, 1, 0, 0.6784314, 1,
1.236871, 1.398626, 1.085566, 1, 0, 0.6705883, 1,
1.2373, 0.5967693, 1.183743, 1, 0, 0.6666667, 1,
1.239319, -0.8166367, 1.359152, 1, 0, 0.6588235, 1,
1.2479, 0.4253066, 1.431529, 1, 0, 0.654902, 1,
1.247997, 0.3698855, 1.158462, 1, 0, 0.6470588, 1,
1.251359, 1.200238, 0.3007252, 1, 0, 0.6431373, 1,
1.26223, -0.5651736, 2.574273, 1, 0, 0.6352941, 1,
1.266361, -0.9853587, 2.172981, 1, 0, 0.6313726, 1,
1.274788, 0.2824189, 1.274504, 1, 0, 0.6235294, 1,
1.281976, 0.8027068, 1.135553, 1, 0, 0.6196079, 1,
1.289455, 0.1485833, 0.590073, 1, 0, 0.6117647, 1,
1.29676, 0.5394312, 2.337759, 1, 0, 0.6078432, 1,
1.298431, 0.3986904, 0.876501, 1, 0, 0.6, 1,
1.308455, 1.886032, 1.417471, 1, 0, 0.5921569, 1,
1.31205, 0.004685904, 1.651197, 1, 0, 0.5882353, 1,
1.321288, 1.449294, 1.942948, 1, 0, 0.5803922, 1,
1.326512, -1.322567, 1.850559, 1, 0, 0.5764706, 1,
1.344052, 0.5994987, 0.740576, 1, 0, 0.5686275, 1,
1.346668, 0.3846894, 1.029117, 1, 0, 0.5647059, 1,
1.360316, 0.6383767, 0.5657449, 1, 0, 0.5568628, 1,
1.363358, -0.5070181, 0.822391, 1, 0, 0.5529412, 1,
1.364612, 0.7919817, 2.747154, 1, 0, 0.5450981, 1,
1.365245, -1.782738, 1.425558, 1, 0, 0.5411765, 1,
1.421471, -0.03921351, 1.812635, 1, 0, 0.5333334, 1,
1.430472, 1.562722, 0.7273169, 1, 0, 0.5294118, 1,
1.431515, -0.1910311, 1.307088, 1, 0, 0.5215687, 1,
1.433594, -0.9057795, 2.448568, 1, 0, 0.5176471, 1,
1.435071, -0.4148357, -0.714907, 1, 0, 0.509804, 1,
1.435677, 1.255954, 0.9708325, 1, 0, 0.5058824, 1,
1.435932, -0.8842725, 4.087609, 1, 0, 0.4980392, 1,
1.436136, 0.3636588, 3.018523, 1, 0, 0.4901961, 1,
1.438042, 1.53406, 0.1777248, 1, 0, 0.4862745, 1,
1.462655, 0.3926618, 4.347178, 1, 0, 0.4784314, 1,
1.466614, 0.07984356, 2.197146, 1, 0, 0.4745098, 1,
1.489338, -1.327072, 2.855232, 1, 0, 0.4666667, 1,
1.495204, 0.08994913, 1.224399, 1, 0, 0.4627451, 1,
1.496029, 0.2246202, 1.313361, 1, 0, 0.454902, 1,
1.516259, -2.292485, 3.382745, 1, 0, 0.4509804, 1,
1.522978, 0.5142223, -0.1013611, 1, 0, 0.4431373, 1,
1.528784, 0.2344545, 2.462079, 1, 0, 0.4392157, 1,
1.534177, -1.56595, 2.162409, 1, 0, 0.4313726, 1,
1.536373, 0.01556296, 0.4998342, 1, 0, 0.427451, 1,
1.537016, 0.3479149, 2.581136, 1, 0, 0.4196078, 1,
1.548125, -1.255696, 0.4615286, 1, 0, 0.4156863, 1,
1.553304, -0.6007152, 1.559982, 1, 0, 0.4078431, 1,
1.560648, 1.607977, 1.057305, 1, 0, 0.4039216, 1,
1.57766, 0.2600105, 0.6659017, 1, 0, 0.3960784, 1,
1.580334, -0.9488451, 2.338379, 1, 0, 0.3882353, 1,
1.600881, -0.5548375, 3.849999, 1, 0, 0.3843137, 1,
1.611244, -1.809793, 2.087239, 1, 0, 0.3764706, 1,
1.615381, -1.408613, 1.684824, 1, 0, 0.372549, 1,
1.618749, -0.4141314, 2.484613, 1, 0, 0.3647059, 1,
1.620327, -0.84594, 0.9256932, 1, 0, 0.3607843, 1,
1.625111, -0.7943947, 3.368869, 1, 0, 0.3529412, 1,
1.626369, 0.7435579, 1.637583, 1, 0, 0.3490196, 1,
1.644095, 0.1575467, -0.00785374, 1, 0, 0.3411765, 1,
1.647626, -1.85008, 1.316351, 1, 0, 0.3372549, 1,
1.648884, -0.1973743, 3.433003, 1, 0, 0.3294118, 1,
1.650325, 0.7340571, 1.350222, 1, 0, 0.3254902, 1,
1.657892, 0.208598, 2.938246, 1, 0, 0.3176471, 1,
1.66772, -0.2220076, 2.445713, 1, 0, 0.3137255, 1,
1.680995, -0.2231077, 2.038538, 1, 0, 0.3058824, 1,
1.682692, -0.646265, 1.648657, 1, 0, 0.2980392, 1,
1.690642, 0.3125909, 1.895913, 1, 0, 0.2941177, 1,
1.697708, 0.3752207, 1.963294, 1, 0, 0.2862745, 1,
1.702994, 1.20137, 0.7676772, 1, 0, 0.282353, 1,
1.70491, 2.388865, 0.4729404, 1, 0, 0.2745098, 1,
1.712514, 0.9436938, -0.3151366, 1, 0, 0.2705882, 1,
1.719697, -1.752003, 2.529723, 1, 0, 0.2627451, 1,
1.734991, -0.3866237, 0.42796, 1, 0, 0.2588235, 1,
1.794763, 0.1127667, 0.8978156, 1, 0, 0.2509804, 1,
1.796074, 0.2920756, 1.093063, 1, 0, 0.2470588, 1,
1.814245, -1.111752, 2.151852, 1, 0, 0.2392157, 1,
1.819071, -0.5869666, -0.1114199, 1, 0, 0.2352941, 1,
1.821962, 0.7192095, 1.204504, 1, 0, 0.227451, 1,
1.822569, -0.8911908, 0.7564634, 1, 0, 0.2235294, 1,
1.828183, 0.5485417, 1.782058, 1, 0, 0.2156863, 1,
1.839601, -0.8088596, 0.3807435, 1, 0, 0.2117647, 1,
1.848631, 1.281046, 0.8984962, 1, 0, 0.2039216, 1,
1.884164, -0.2339447, 0.7677571, 1, 0, 0.1960784, 1,
1.886268, -0.3559521, 3.122204, 1, 0, 0.1921569, 1,
1.886781, -0.2189076, 1.200074, 1, 0, 0.1843137, 1,
1.893972, 1.20251, 1.399293, 1, 0, 0.1803922, 1,
1.908557, 0.9603245, 1.024194, 1, 0, 0.172549, 1,
1.926379, -0.5094327, 2.908777, 1, 0, 0.1686275, 1,
1.941366, -1.846134, 2.191282, 1, 0, 0.1607843, 1,
1.94759, -1.41028, 2.216202, 1, 0, 0.1568628, 1,
1.956413, 0.04349882, 1.249165, 1, 0, 0.1490196, 1,
1.970403, -0.05679095, 1.880907, 1, 0, 0.145098, 1,
1.981676, 1.427294, -0.9189368, 1, 0, 0.1372549, 1,
1.98582, 0.1269936, 1.650541, 1, 0, 0.1333333, 1,
1.989508, 0.7212919, 1.742335, 1, 0, 0.1254902, 1,
2.007545, 0.4545475, 2.410438, 1, 0, 0.1215686, 1,
2.009112, 0.06183683, 2.361573, 1, 0, 0.1137255, 1,
2.050339, -1.550028, 2.007941, 1, 0, 0.1098039, 1,
2.065282, -0.0957612, 1.976428, 1, 0, 0.1019608, 1,
2.101935, 0.1970527, 0.1642456, 1, 0, 0.09411765, 1,
2.102209, -0.4845469, 2.917264, 1, 0, 0.09019608, 1,
2.128247, 0.4554649, 2.515187, 1, 0, 0.08235294, 1,
2.14631, 0.393111, 1.230416, 1, 0, 0.07843138, 1,
2.206639, 0.7183267, 1.507825, 1, 0, 0.07058824, 1,
2.245364, -1.987518, 1.962886, 1, 0, 0.06666667, 1,
2.263455, -1.087768, 1.231865, 1, 0, 0.05882353, 1,
2.271646, 1.583125, -0.07866841, 1, 0, 0.05490196, 1,
2.283443, -1.160081, 1.347519, 1, 0, 0.04705882, 1,
2.324086, 0.5912547, -0.683203, 1, 0, 0.04313726, 1,
2.349575, 0.4913782, 1.538174, 1, 0, 0.03529412, 1,
2.479762, -0.08808629, 0.1471765, 1, 0, 0.03137255, 1,
2.488971, -0.8567838, 1.317192, 1, 0, 0.02352941, 1,
2.517182, 0.6689948, 0.6303612, 1, 0, 0.01960784, 1,
2.594967, 1.666572, 2.995996, 1, 0, 0.01176471, 1,
3.20391, 1.048859, 1.339416, 1, 0, 0.007843138, 1
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
-0.1436188, -3.897397, -6.898293, 0, -0.5, 0.5, 0.5,
-0.1436188, -3.897397, -6.898293, 1, -0.5, 0.5, 0.5,
-0.1436188, -3.897397, -6.898293, 1, 1.5, 0.5, 0.5,
-0.1436188, -3.897397, -6.898293, 0, 1.5, 0.5, 0.5
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
-4.625959, 0.1513578, -6.898293, 0, -0.5, 0.5, 0.5,
-4.625959, 0.1513578, -6.898293, 1, -0.5, 0.5, 0.5,
-4.625959, 0.1513578, -6.898293, 1, 1.5, 0.5, 0.5,
-4.625959, 0.1513578, -6.898293, 0, 1.5, 0.5, 0.5
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
-4.625959, -3.897397, 0.2783666, 0, -0.5, 0.5, 0.5,
-4.625959, -3.897397, 0.2783666, 1, -0.5, 0.5, 0.5,
-4.625959, -3.897397, 0.2783666, 1, 1.5, 0.5, 0.5,
-4.625959, -3.897397, 0.2783666, 0, 1.5, 0.5, 0.5
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
-3, -2.963069, -5.24214,
3, -2.963069, -5.24214,
-3, -2.963069, -5.24214,
-3, -3.11879, -5.518166,
-2, -2.963069, -5.24214,
-2, -3.11879, -5.518166,
-1, -2.963069, -5.24214,
-1, -3.11879, -5.518166,
0, -2.963069, -5.24214,
0, -3.11879, -5.518166,
1, -2.963069, -5.24214,
1, -3.11879, -5.518166,
2, -2.963069, -5.24214,
2, -3.11879, -5.518166,
3, -2.963069, -5.24214,
3, -3.11879, -5.518166
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
-3, -3.430233, -6.070216, 0, -0.5, 0.5, 0.5,
-3, -3.430233, -6.070216, 1, -0.5, 0.5, 0.5,
-3, -3.430233, -6.070216, 1, 1.5, 0.5, 0.5,
-3, -3.430233, -6.070216, 0, 1.5, 0.5, 0.5,
-2, -3.430233, -6.070216, 0, -0.5, 0.5, 0.5,
-2, -3.430233, -6.070216, 1, -0.5, 0.5, 0.5,
-2, -3.430233, -6.070216, 1, 1.5, 0.5, 0.5,
-2, -3.430233, -6.070216, 0, 1.5, 0.5, 0.5,
-1, -3.430233, -6.070216, 0, -0.5, 0.5, 0.5,
-1, -3.430233, -6.070216, 1, -0.5, 0.5, 0.5,
-1, -3.430233, -6.070216, 1, 1.5, 0.5, 0.5,
-1, -3.430233, -6.070216, 0, 1.5, 0.5, 0.5,
0, -3.430233, -6.070216, 0, -0.5, 0.5, 0.5,
0, -3.430233, -6.070216, 1, -0.5, 0.5, 0.5,
0, -3.430233, -6.070216, 1, 1.5, 0.5, 0.5,
0, -3.430233, -6.070216, 0, 1.5, 0.5, 0.5,
1, -3.430233, -6.070216, 0, -0.5, 0.5, 0.5,
1, -3.430233, -6.070216, 1, -0.5, 0.5, 0.5,
1, -3.430233, -6.070216, 1, 1.5, 0.5, 0.5,
1, -3.430233, -6.070216, 0, 1.5, 0.5, 0.5,
2, -3.430233, -6.070216, 0, -0.5, 0.5, 0.5,
2, -3.430233, -6.070216, 1, -0.5, 0.5, 0.5,
2, -3.430233, -6.070216, 1, 1.5, 0.5, 0.5,
2, -3.430233, -6.070216, 0, 1.5, 0.5, 0.5,
3, -3.430233, -6.070216, 0, -0.5, 0.5, 0.5,
3, -3.430233, -6.070216, 1, -0.5, 0.5, 0.5,
3, -3.430233, -6.070216, 1, 1.5, 0.5, 0.5,
3, -3.430233, -6.070216, 0, 1.5, 0.5, 0.5
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
-3.591573, -2, -5.24214,
-3.591573, 3, -5.24214,
-3.591573, -2, -5.24214,
-3.763971, -2, -5.518166,
-3.591573, -1, -5.24214,
-3.763971, -1, -5.518166,
-3.591573, 0, -5.24214,
-3.763971, 0, -5.518166,
-3.591573, 1, -5.24214,
-3.763971, 1, -5.518166,
-3.591573, 2, -5.24214,
-3.763971, 2, -5.518166,
-3.591573, 3, -5.24214,
-3.763971, 3, -5.518166
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
-4.108766, -2, -6.070216, 0, -0.5, 0.5, 0.5,
-4.108766, -2, -6.070216, 1, -0.5, 0.5, 0.5,
-4.108766, -2, -6.070216, 1, 1.5, 0.5, 0.5,
-4.108766, -2, -6.070216, 0, 1.5, 0.5, 0.5,
-4.108766, -1, -6.070216, 0, -0.5, 0.5, 0.5,
-4.108766, -1, -6.070216, 1, -0.5, 0.5, 0.5,
-4.108766, -1, -6.070216, 1, 1.5, 0.5, 0.5,
-4.108766, -1, -6.070216, 0, 1.5, 0.5, 0.5,
-4.108766, 0, -6.070216, 0, -0.5, 0.5, 0.5,
-4.108766, 0, -6.070216, 1, -0.5, 0.5, 0.5,
-4.108766, 0, -6.070216, 1, 1.5, 0.5, 0.5,
-4.108766, 0, -6.070216, 0, 1.5, 0.5, 0.5,
-4.108766, 1, -6.070216, 0, -0.5, 0.5, 0.5,
-4.108766, 1, -6.070216, 1, -0.5, 0.5, 0.5,
-4.108766, 1, -6.070216, 1, 1.5, 0.5, 0.5,
-4.108766, 1, -6.070216, 0, 1.5, 0.5, 0.5,
-4.108766, 2, -6.070216, 0, -0.5, 0.5, 0.5,
-4.108766, 2, -6.070216, 1, -0.5, 0.5, 0.5,
-4.108766, 2, -6.070216, 1, 1.5, 0.5, 0.5,
-4.108766, 2, -6.070216, 0, 1.5, 0.5, 0.5,
-4.108766, 3, -6.070216, 0, -0.5, 0.5, 0.5,
-4.108766, 3, -6.070216, 1, -0.5, 0.5, 0.5,
-4.108766, 3, -6.070216, 1, 1.5, 0.5, 0.5,
-4.108766, 3, -6.070216, 0, 1.5, 0.5, 0.5
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
-3.591573, -2.963069, -4,
-3.591573, -2.963069, 4,
-3.591573, -2.963069, -4,
-3.763971, -3.11879, -4,
-3.591573, -2.963069, -2,
-3.763971, -3.11879, -2,
-3.591573, -2.963069, 0,
-3.763971, -3.11879, 0,
-3.591573, -2.963069, 2,
-3.763971, -3.11879, 2,
-3.591573, -2.963069, 4,
-3.763971, -3.11879, 4
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
-4.108766, -3.430233, -4, 0, -0.5, 0.5, 0.5,
-4.108766, -3.430233, -4, 1, -0.5, 0.5, 0.5,
-4.108766, -3.430233, -4, 1, 1.5, 0.5, 0.5,
-4.108766, -3.430233, -4, 0, 1.5, 0.5, 0.5,
-4.108766, -3.430233, -2, 0, -0.5, 0.5, 0.5,
-4.108766, -3.430233, -2, 1, -0.5, 0.5, 0.5,
-4.108766, -3.430233, -2, 1, 1.5, 0.5, 0.5,
-4.108766, -3.430233, -2, 0, 1.5, 0.5, 0.5,
-4.108766, -3.430233, 0, 0, -0.5, 0.5, 0.5,
-4.108766, -3.430233, 0, 1, -0.5, 0.5, 0.5,
-4.108766, -3.430233, 0, 1, 1.5, 0.5, 0.5,
-4.108766, -3.430233, 0, 0, 1.5, 0.5, 0.5,
-4.108766, -3.430233, 2, 0, -0.5, 0.5, 0.5,
-4.108766, -3.430233, 2, 1, -0.5, 0.5, 0.5,
-4.108766, -3.430233, 2, 1, 1.5, 0.5, 0.5,
-4.108766, -3.430233, 2, 0, 1.5, 0.5, 0.5,
-4.108766, -3.430233, 4, 0, -0.5, 0.5, 0.5,
-4.108766, -3.430233, 4, 1, -0.5, 0.5, 0.5,
-4.108766, -3.430233, 4, 1, 1.5, 0.5, 0.5,
-4.108766, -3.430233, 4, 0, 1.5, 0.5, 0.5
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
-3.591573, -2.963069, -5.24214,
-3.591573, 3.265784, -5.24214,
-3.591573, -2.963069, 5.798873,
-3.591573, 3.265784, 5.798873,
-3.591573, -2.963069, -5.24214,
-3.591573, -2.963069, 5.798873,
-3.591573, 3.265784, -5.24214,
-3.591573, 3.265784, 5.798873,
-3.591573, -2.963069, -5.24214,
3.304336, -2.963069, -5.24214,
-3.591573, -2.963069, 5.798873,
3.304336, -2.963069, 5.798873,
-3.591573, 3.265784, -5.24214,
3.304336, 3.265784, -5.24214,
-3.591573, 3.265784, 5.798873,
3.304336, 3.265784, 5.798873,
3.304336, -2.963069, -5.24214,
3.304336, 3.265784, -5.24214,
3.304336, -2.963069, 5.798873,
3.304336, 3.265784, 5.798873,
3.304336, -2.963069, -5.24214,
3.304336, -2.963069, 5.798873,
3.304336, 3.265784, -5.24214,
3.304336, 3.265784, 5.798873
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
var radius = 7.705918;
var distance = 34.2845;
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
mvMatrix.translate( 0.1436188, -0.1513578, -0.2783666 );
mvMatrix.scale( 1.208222, 1.337612, 0.7546218 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.2845);
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
Isopropyl_phenylacet<-read.table("Isopropyl_phenylacet.xyz")
```

```
## Error in read.table("Isopropyl_phenylacet.xyz"): no lines available in input
```

```r
x<-Isopropyl_phenylacet$V2
```

```
## Error in eval(expr, envir, enclos): object 'Isopropyl_phenylacet' not found
```

```r
y<-Isopropyl_phenylacet$V3
```

```
## Error in eval(expr, envir, enclos): object 'Isopropyl_phenylacet' not found
```

```r
z<-Isopropyl_phenylacet$V4
```

```
## Error in eval(expr, envir, enclos): object 'Isopropyl_phenylacet' not found
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
-3.491147, 0.9302406, -0.8222015, 0, 0, 1, 1, 1,
-2.858887, 0.9960385, -2.403003, 1, 0, 0, 1, 1,
-2.84466, -1.314068, -1.628925, 1, 0, 0, 1, 1,
-2.804277, 0.247943, -1.260433, 1, 0, 0, 1, 1,
-2.547036, -1.197004, -1.598456, 1, 0, 0, 1, 1,
-2.499985, -2.294645, -1.727165, 1, 0, 0, 1, 1,
-2.411597, 0.9361032, -1.067213, 0, 0, 0, 1, 1,
-2.306333, 0.7173029, -0.1773708, 0, 0, 0, 1, 1,
-2.241466, -1.627733, -5.081349, 0, 0, 0, 1, 1,
-2.241463, -2.029997, -3.289346, 0, 0, 0, 1, 1,
-2.217218, 0.05528207, -1.223759, 0, 0, 0, 1, 1,
-2.207426, -0.4922939, -1.915222, 0, 0, 0, 1, 1,
-2.206984, 1.050981, -1.048614, 0, 0, 0, 1, 1,
-2.204856, 0.7106, -2.301704, 1, 1, 1, 1, 1,
-2.14313, 0.5313974, -1.667428, 1, 1, 1, 1, 1,
-2.137093, -0.7143456, -2.258782, 1, 1, 1, 1, 1,
-2.121664, 0.8351088, -2.073799, 1, 1, 1, 1, 1,
-2.111315, 0.09316163, -0.4067675, 1, 1, 1, 1, 1,
-2.087733, -1.122602, -1.348448, 1, 1, 1, 1, 1,
-2.076197, -0.05224956, -2.443131, 1, 1, 1, 1, 1,
-2.076051, -0.6366709, -1.706634, 1, 1, 1, 1, 1,
-2.059729, -1.201593, -4.32431, 1, 1, 1, 1, 1,
-2.027056, 1.096704, -2.033447, 1, 1, 1, 1, 1,
-2.023748, 1.003284, -2.655571, 1, 1, 1, 1, 1,
-2.020472, -0.4027938, -3.100222, 1, 1, 1, 1, 1,
-1.997112, 0.7932931, -0.8668242, 1, 1, 1, 1, 1,
-1.99698, 0.9272978, 0.3463178, 1, 1, 1, 1, 1,
-1.973608, -1.731071, -2.58534, 1, 1, 1, 1, 1,
-1.973449, -0.7379605, -2.784184, 0, 0, 1, 1, 1,
-1.921748, -0.2782226, -3.148384, 1, 0, 0, 1, 1,
-1.908296, -0.1437849, -0.9002149, 1, 0, 0, 1, 1,
-1.899029, -1.031666, -2.265584, 1, 0, 0, 1, 1,
-1.890987, -0.3656793, 0.5297891, 1, 0, 0, 1, 1,
-1.86777, -1.020006, -0.6746624, 1, 0, 0, 1, 1,
-1.864974, 1.05411, 0.7171368, 0, 0, 0, 1, 1,
-1.864518, -0.04639806, -1.76854, 0, 0, 0, 1, 1,
-1.831515, 0.6037952, -3.023405, 0, 0, 0, 1, 1,
-1.830376, 0.4142808, -1.752012, 0, 0, 0, 1, 1,
-1.8211, 0.3670748, -2.118026, 0, 0, 0, 1, 1,
-1.817352, 0.5504944, -2.142417, 0, 0, 0, 1, 1,
-1.788371, 0.6719518, -0.002472543, 0, 0, 0, 1, 1,
-1.752048, -1.442232, -2.548016, 1, 1, 1, 1, 1,
-1.750109, 0.8989173, -2.123939, 1, 1, 1, 1, 1,
-1.692827, 3.146065, 0.4353667, 1, 1, 1, 1, 1,
-1.690166, 0.2462052, -1.317639, 1, 1, 1, 1, 1,
-1.689539, -0.4659199, -3.953147, 1, 1, 1, 1, 1,
-1.633351, 1.267252, -2.569013, 1, 1, 1, 1, 1,
-1.6308, -1.168945, -1.723165, 1, 1, 1, 1, 1,
-1.627981, -0.494116, -1.537081, 1, 1, 1, 1, 1,
-1.614639, -0.1584407, -2.503679, 1, 1, 1, 1, 1,
-1.612735, 0.8526247, -1.528302, 1, 1, 1, 1, 1,
-1.610595, 0.6935479, -0.8047215, 1, 1, 1, 1, 1,
-1.587976, -0.3240306, -0.1765703, 1, 1, 1, 1, 1,
-1.562458, 1.607467, -0.3804728, 1, 1, 1, 1, 1,
-1.543304, -0.6438996, -1.641022, 1, 1, 1, 1, 1,
-1.541943, 1.225184, 0.2512607, 1, 1, 1, 1, 1,
-1.540457, 0.9136165, -0.6515142, 0, 0, 1, 1, 1,
-1.515592, 0.6797833, -0.7133343, 1, 0, 0, 1, 1,
-1.505775, -0.421483, -3.100377, 1, 0, 0, 1, 1,
-1.474439, 0.004860518, -0.119383, 1, 0, 0, 1, 1,
-1.462692, 1.21173, -0.9606628, 1, 0, 0, 1, 1,
-1.448562, -0.001678531, -1.544319, 1, 0, 0, 1, 1,
-1.439383, 1.842935, -0.4964927, 0, 0, 0, 1, 1,
-1.433342, -0.6499584, -4.18168, 0, 0, 0, 1, 1,
-1.428639, -0.7381592, -2.459539, 0, 0, 0, 1, 1,
-1.414667, 0.3873931, -1.326924, 0, 0, 0, 1, 1,
-1.408152, 0.1364212, -2.487277, 0, 0, 0, 1, 1,
-1.401985, -2.535149, -2.376373, 0, 0, 0, 1, 1,
-1.395457, -1.467556, -1.495144, 0, 0, 0, 1, 1,
-1.393079, -0.4596913, -1.842895, 1, 1, 1, 1, 1,
-1.391175, -1.049752, -1.34506, 1, 1, 1, 1, 1,
-1.38596, 0.2547316, -0.8864892, 1, 1, 1, 1, 1,
-1.385394, -0.303537, -0.8264669, 1, 1, 1, 1, 1,
-1.382688, -0.8894041, -1.659187, 1, 1, 1, 1, 1,
-1.372846, 0.05567539, -2.007282, 1, 1, 1, 1, 1,
-1.36135, -1.154711, -1.881447, 1, 1, 1, 1, 1,
-1.358721, 1.295453, -0.3438291, 1, 1, 1, 1, 1,
-1.357382, 1.302882, -3.082582, 1, 1, 1, 1, 1,
-1.354444, 1.363289, -0.4553943, 1, 1, 1, 1, 1,
-1.349077, 0.1463463, -1.42533, 1, 1, 1, 1, 1,
-1.336214, 0.4096965, -1.570389, 1, 1, 1, 1, 1,
-1.331169, 0.5023723, -1.480122, 1, 1, 1, 1, 1,
-1.328265, 0.8783707, -1.915303, 1, 1, 1, 1, 1,
-1.322996, -1.804106, -1.943339, 1, 1, 1, 1, 1,
-1.315413, -0.5470841, -1.984172, 0, 0, 1, 1, 1,
-1.31156, 0.1897432, -1.843912, 1, 0, 0, 1, 1,
-1.310829, 1.409205, 0.2838041, 1, 0, 0, 1, 1,
-1.310227, 0.5578007, -1.180925, 1, 0, 0, 1, 1,
-1.308151, -1.277141, -2.968353, 1, 0, 0, 1, 1,
-1.307883, 0.8589951, -0.4851819, 1, 0, 0, 1, 1,
-1.290497, -1.244882, -3.42665, 0, 0, 0, 1, 1,
-1.289183, -0.9205397, -2.865162, 0, 0, 0, 1, 1,
-1.287424, -0.1249521, -2.215683, 0, 0, 0, 1, 1,
-1.286217, -2.718193, -5.04446, 0, 0, 0, 1, 1,
-1.282269, -1.082141, -1.774275, 0, 0, 0, 1, 1,
-1.281052, 1.601695, -1.940018, 0, 0, 0, 1, 1,
-1.280524, -0.3513631, -1.378093, 0, 0, 0, 1, 1,
-1.276943, 0.1549903, -0.2282295, 1, 1, 1, 1, 1,
-1.273875, -0.7155872, -1.65856, 1, 1, 1, 1, 1,
-1.265492, -0.009386398, -1.559529, 1, 1, 1, 1, 1,
-1.260664, 0.8099953, -1.827981, 1, 1, 1, 1, 1,
-1.25918, 0.8544374, -0.7788221, 1, 1, 1, 1, 1,
-1.252682, 0.2862978, -2.084391, 1, 1, 1, 1, 1,
-1.246595, 1.23507, -1.140439, 1, 1, 1, 1, 1,
-1.242117, 0.3142194, -0.7321728, 1, 1, 1, 1, 1,
-1.239104, -1.763608, -4.039675, 1, 1, 1, 1, 1,
-1.238442, 1.213432, -0.5437037, 1, 1, 1, 1, 1,
-1.23817, 1.491743, -1.096355, 1, 1, 1, 1, 1,
-1.228968, -1.353037, -2.265883, 1, 1, 1, 1, 1,
-1.221687, -0.2431993, -2.252745, 1, 1, 1, 1, 1,
-1.218965, -0.1566241, 0.2936333, 1, 1, 1, 1, 1,
-1.215109, 0.6717778, -0.2157368, 1, 1, 1, 1, 1,
-1.214239, 0.4707353, -0.8826152, 0, 0, 1, 1, 1,
-1.212268, -1.022034, -3.42469, 1, 0, 0, 1, 1,
-1.210773, 0.185094, -0.9257923, 1, 0, 0, 1, 1,
-1.202041, -0.6785757, -2.362748, 1, 0, 0, 1, 1,
-1.201413, -1.279426, -3.480613, 1, 0, 0, 1, 1,
-1.200444, -0.6622419, -1.550375, 1, 0, 0, 1, 1,
-1.198813, -0.3997486, -0.844968, 0, 0, 0, 1, 1,
-1.196517, -0.1255093, -0.4565039, 0, 0, 0, 1, 1,
-1.183851, -0.1573417, -2.167854, 0, 0, 0, 1, 1,
-1.175063, -0.2834309, -1.305301, 0, 0, 0, 1, 1,
-1.174464, -1.126368, -2.314533, 0, 0, 0, 1, 1,
-1.162485, 1.475901, -1.720267, 0, 0, 0, 1, 1,
-1.160926, -0.5932978, -2.885764, 0, 0, 0, 1, 1,
-1.155216, -1.136782, -0.1969565, 1, 1, 1, 1, 1,
-1.148088, 0.1220304, -1.282799, 1, 1, 1, 1, 1,
-1.141323, -1.977547, -2.816644, 1, 1, 1, 1, 1,
-1.140869, -1.100024, -3.753175, 1, 1, 1, 1, 1,
-1.140262, 0.1600954, -1.572063, 1, 1, 1, 1, 1,
-1.138554, 0.6469022, -0.8351892, 1, 1, 1, 1, 1,
-1.129034, 0.529265, -0.232377, 1, 1, 1, 1, 1,
-1.108608, 0.7881483, -1.310235, 1, 1, 1, 1, 1,
-1.102813, 1.235254, -1.474136, 1, 1, 1, 1, 1,
-1.099379, 0.3139877, -1.737971, 1, 1, 1, 1, 1,
-1.0985, -0.6217057, -3.685931, 1, 1, 1, 1, 1,
-1.092063, 1.089449, -1.104251, 1, 1, 1, 1, 1,
-1.089808, -0.4122722, -1.043888, 1, 1, 1, 1, 1,
-1.088219, 0.2286053, -0.9316715, 1, 1, 1, 1, 1,
-1.083714, 0.8146178, -1.619434, 1, 1, 1, 1, 1,
-1.083659, 2.250849, 1.052007, 0, 0, 1, 1, 1,
-1.079271, -0.8938989, -2.548273, 1, 0, 0, 1, 1,
-1.072948, 1.063756, -0.3941704, 1, 0, 0, 1, 1,
-1.071514, -1.394944, -1.791994, 1, 0, 0, 1, 1,
-1.070076, -0.7230468, -1.28486, 1, 0, 0, 1, 1,
-1.067993, -2.872357, -2.308228, 1, 0, 0, 1, 1,
-1.061811, 0.1057337, -2.381962, 0, 0, 0, 1, 1,
-1.061251, 0.174823, -1.320468, 0, 0, 0, 1, 1,
-1.05863, 1.141425, -2.094751, 0, 0, 0, 1, 1,
-1.04876, 0.25531, -1.105569, 0, 0, 0, 1, 1,
-1.04527, -0.336296, -2.375649, 0, 0, 0, 1, 1,
-1.025152, 1.030724, -2.084633, 0, 0, 0, 1, 1,
-1.023052, 1.318051, -1.756306, 0, 0, 0, 1, 1,
-1.022245, 1.203019, -0.160324, 1, 1, 1, 1, 1,
-1.021177, -1.601132, -2.529509, 1, 1, 1, 1, 1,
-1.019273, -0.2604484, -1.483241, 1, 1, 1, 1, 1,
-1.008716, 1.08198, -1.464785, 1, 1, 1, 1, 1,
-1.008151, -0.482242, -2.259976, 1, 1, 1, 1, 1,
-0.9990842, 0.8799099, 0.2979741, 1, 1, 1, 1, 1,
-0.9967778, -0.7950006, -1.40792, 1, 1, 1, 1, 1,
-0.9854752, 0.9072236, -2.251183, 1, 1, 1, 1, 1,
-0.9833276, 1.287361, 0.579386, 1, 1, 1, 1, 1,
-0.9738612, 0.3264215, 0.772736, 1, 1, 1, 1, 1,
-0.969605, -0.8177554, -1.923234, 1, 1, 1, 1, 1,
-0.9638181, -0.9917344, -3.091601, 1, 1, 1, 1, 1,
-0.9636182, 0.9712601, -1.334325, 1, 1, 1, 1, 1,
-0.9603615, 1.090032, -1.646293, 1, 1, 1, 1, 1,
-0.9599404, 0.7727453, -0.4170445, 1, 1, 1, 1, 1,
-0.958872, -0.4185057, -3.588288, 0, 0, 1, 1, 1,
-0.9547237, 1.596282, -0.8252404, 1, 0, 0, 1, 1,
-0.9522421, 0.4129161, 0.8567256, 1, 0, 0, 1, 1,
-0.9517322, -0.5664679, -2.117964, 1, 0, 0, 1, 1,
-0.950595, 0.7286097, -0.9977422, 1, 0, 0, 1, 1,
-0.9464652, -1.647813, -1.190489, 1, 0, 0, 1, 1,
-0.9431748, -0.4787569, -3.745943, 0, 0, 0, 1, 1,
-0.942093, -2.441569, -2.668593, 0, 0, 0, 1, 1,
-0.9389226, -1.49926, -2.869238, 0, 0, 0, 1, 1,
-0.9380056, 0.6027793, -2.239521, 0, 0, 0, 1, 1,
-0.9344384, -0.4090741, -0.5712969, 0, 0, 0, 1, 1,
-0.9319214, 1.482711, 0.8220344, 0, 0, 0, 1, 1,
-0.9302801, 1.53628, 0.730719, 0, 0, 0, 1, 1,
-0.928484, -0.5333581, -0.4117123, 1, 1, 1, 1, 1,
-0.9211513, 0.4921893, -0.1165162, 1, 1, 1, 1, 1,
-0.9038939, 1.355333, 0.04869061, 1, 1, 1, 1, 1,
-0.8986026, -0.03011798, -1.092364, 1, 1, 1, 1, 1,
-0.8948169, -1.048682, -1.780093, 1, 1, 1, 1, 1,
-0.8933642, 0.5153571, -1.302474, 1, 1, 1, 1, 1,
-0.8916054, -0.4604799, -2.994011, 1, 1, 1, 1, 1,
-0.8868971, -0.3728956, -3.055477, 1, 1, 1, 1, 1,
-0.8861138, 1.248542, -0.6468039, 1, 1, 1, 1, 1,
-0.8857552, -0.6836748, -2.365007, 1, 1, 1, 1, 1,
-0.8835748, 0.3335621, -2.69294, 1, 1, 1, 1, 1,
-0.8808281, -0.2960129, -1.049408, 1, 1, 1, 1, 1,
-0.8797663, -0.02861421, -1.857793, 1, 1, 1, 1, 1,
-0.8742141, 0.4057911, -1.031706, 1, 1, 1, 1, 1,
-0.8739209, 0.7326974, -1.813122, 1, 1, 1, 1, 1,
-0.868508, -1.836125, -3.115745, 0, 0, 1, 1, 1,
-0.8677183, -0.2328583, -1.412211, 1, 0, 0, 1, 1,
-0.8644843, -0.0850613, -1.89072, 1, 0, 0, 1, 1,
-0.862314, -0.3422414, -3.284502, 1, 0, 0, 1, 1,
-0.8607038, -1.274946, -2.543971, 1, 0, 0, 1, 1,
-0.8569577, 1.441594, -0.4620138, 1, 0, 0, 1, 1,
-0.8422577, 0.3646117, -1.709407, 0, 0, 0, 1, 1,
-0.8394228, -0.7868266, -3.647517, 0, 0, 0, 1, 1,
-0.8361054, 0.4074286, -0.1473835, 0, 0, 0, 1, 1,
-0.8343734, 0.7152361, 0.05693851, 0, 0, 0, 1, 1,
-0.8338166, -0.3263628, -1.745506, 0, 0, 0, 1, 1,
-0.8318112, 0.6803285, -1.844979, 0, 0, 0, 1, 1,
-0.8308297, 0.2049147, -1.161989, 0, 0, 0, 1, 1,
-0.8269454, 0.5018147, -1.988407, 1, 1, 1, 1, 1,
-0.8172683, 0.3188323, -1.694573, 1, 1, 1, 1, 1,
-0.8132323, -1.93177, -0.8849974, 1, 1, 1, 1, 1,
-0.8114678, 0.8006381, -3.374061, 1, 1, 1, 1, 1,
-0.8079389, 1.190951, -1.0917, 1, 1, 1, 1, 1,
-0.805316, -0.1297361, -2.352625, 1, 1, 1, 1, 1,
-0.8048365, -0.6013154, -1.216004, 1, 1, 1, 1, 1,
-0.8021597, 0.4850484, -0.9464538, 1, 1, 1, 1, 1,
-0.799838, 1.059207, -0.1550131, 1, 1, 1, 1, 1,
-0.7975212, 0.5263975, -0.4678303, 1, 1, 1, 1, 1,
-0.7972036, -0.9839121, -3.467965, 1, 1, 1, 1, 1,
-0.7971395, 0.3327591, -0.9563591, 1, 1, 1, 1, 1,
-0.7949091, 1.665235, -1.171983, 1, 1, 1, 1, 1,
-0.792386, 0.8525588, 0.2203641, 1, 1, 1, 1, 1,
-0.7857661, -1.190925, -1.963979, 1, 1, 1, 1, 1,
-0.7851896, -1.664321, -2.685534, 0, 0, 1, 1, 1,
-0.7822707, 0.7120488, -0.8284132, 1, 0, 0, 1, 1,
-0.7808599, 1.275041, -0.7915631, 1, 0, 0, 1, 1,
-0.7780024, 1.626124, -1.806729, 1, 0, 0, 1, 1,
-0.7772378, -0.2470646, -2.948493, 1, 0, 0, 1, 1,
-0.7750664, 1.597169, 1.10785, 1, 0, 0, 1, 1,
-0.7743303, 1.213609, -0.7797391, 0, 0, 0, 1, 1,
-0.773807, -1.031709, -2.829656, 0, 0, 0, 1, 1,
-0.7660522, -0.4611773, -0.3361843, 0, 0, 0, 1, 1,
-0.7639793, 0.3198128, -1.710936, 0, 0, 0, 1, 1,
-0.7627189, 0.9359831, 0.7666751, 0, 0, 0, 1, 1,
-0.7598696, 0.1876448, -1.731776, 0, 0, 0, 1, 1,
-0.7583733, 0.7871289, -1.837694, 0, 0, 0, 1, 1,
-0.7533928, 0.3414438, -2.840175, 1, 1, 1, 1, 1,
-0.7511802, 1.807544, -0.3071489, 1, 1, 1, 1, 1,
-0.7486328, 0.1029472, -3.027015, 1, 1, 1, 1, 1,
-0.7485728, -0.6856222, -1.478982, 1, 1, 1, 1, 1,
-0.7476232, -0.3388112, -2.966661, 1, 1, 1, 1, 1,
-0.7407206, -0.87007, -2.007551, 1, 1, 1, 1, 1,
-0.7360799, -0.383071, -0.5213389, 1, 1, 1, 1, 1,
-0.7300475, 0.5182243, -2.834746, 1, 1, 1, 1, 1,
-0.7262773, 1.404767, 0.3482106, 1, 1, 1, 1, 1,
-0.7251272, 0.656454, 1.307349, 1, 1, 1, 1, 1,
-0.7251229, -1.241665, -2.851971, 1, 1, 1, 1, 1,
-0.7223281, -1.561415, -1.193989, 1, 1, 1, 1, 1,
-0.7219093, 0.2844488, -1.559168, 1, 1, 1, 1, 1,
-0.7219057, 0.2927816, 0.2634178, 1, 1, 1, 1, 1,
-0.720894, -0.9707302, -2.469456, 1, 1, 1, 1, 1,
-0.7182046, -2.542894, -4.176117, 0, 0, 1, 1, 1,
-0.7169069, -1.549837, -4.471262, 1, 0, 0, 1, 1,
-0.7151014, 1.089702, -0.5081912, 1, 0, 0, 1, 1,
-0.713326, 0.1365795, -1.304468, 1, 0, 0, 1, 1,
-0.7087485, 0.3833439, -1.14096, 1, 0, 0, 1, 1,
-0.7082216, -0.5499442, -1.811831, 1, 0, 0, 1, 1,
-0.7081693, 0.3978971, -0.2985415, 0, 0, 0, 1, 1,
-0.7065632, 1.614344, -0.09920169, 0, 0, 0, 1, 1,
-0.7018958, -0.3382684, -3.300439, 0, 0, 0, 1, 1,
-0.699708, -0.8046651, -2.814314, 0, 0, 0, 1, 1,
-0.6930701, -1.576244, -2.470736, 0, 0, 0, 1, 1,
-0.6887214, -0.7261057, -2.666192, 0, 0, 0, 1, 1,
-0.6871986, -1.373961, -2.357584, 0, 0, 0, 1, 1,
-0.6867622, -1.639262, -2.655848, 1, 1, 1, 1, 1,
-0.6818259, -0.8889023, -2.233263, 1, 1, 1, 1, 1,
-0.6815808, 0.9624928, -0.2810262, 1, 1, 1, 1, 1,
-0.6801251, 0.2628927, -0.3114715, 1, 1, 1, 1, 1,
-0.6782441, -0.1950684, -1.676748, 1, 1, 1, 1, 1,
-0.6752203, -2.755392, -4.2281, 1, 1, 1, 1, 1,
-0.6689233, -1.144758, -2.691798, 1, 1, 1, 1, 1,
-0.6633452, 1.496698, -1.064803, 1, 1, 1, 1, 1,
-0.6601397, 0.05330426, -2.12129, 1, 1, 1, 1, 1,
-0.6580895, -1.556058, -3.51562, 1, 1, 1, 1, 1,
-0.6512424, -0.5079875, -1.607904, 1, 1, 1, 1, 1,
-0.6494597, 0.7125198, 0.6539875, 1, 1, 1, 1, 1,
-0.6485076, 0.1474444, -0.9171818, 1, 1, 1, 1, 1,
-0.6470983, -0.6612988, -3.231004, 1, 1, 1, 1, 1,
-0.6446059, -0.1377444, -1.014524, 1, 1, 1, 1, 1,
-0.6390718, 0.4456308, -1.05767, 0, 0, 1, 1, 1,
-0.6326035, -1.255226, -2.105814, 1, 0, 0, 1, 1,
-0.6248604, 0.03302436, -1.046282, 1, 0, 0, 1, 1,
-0.6205692, -0.2505316, -4.210478, 1, 0, 0, 1, 1,
-0.6080126, 1.457895, -1.649387, 1, 0, 0, 1, 1,
-0.6065707, -1.823194, -1.985247, 1, 0, 0, 1, 1,
-0.6041002, 1.070252, 0.2674633, 0, 0, 0, 1, 1,
-0.602366, -0.1087884, -3.801434, 0, 0, 0, 1, 1,
-0.5968093, -0.591656, -3.300625, 0, 0, 0, 1, 1,
-0.5862886, 0.8676422, -0.1506217, 0, 0, 0, 1, 1,
-0.579761, -0.7776467, -2.388498, 0, 0, 0, 1, 1,
-0.5705909, -1.174454, -1.386813, 0, 0, 0, 1, 1,
-0.5652584, -0.4505451, -3.847526, 0, 0, 0, 1, 1,
-0.5650498, -2.319103, -2.182928, 1, 1, 1, 1, 1,
-0.5649495, 0.4824058, -1.726331, 1, 1, 1, 1, 1,
-0.5590016, 1.705971, 1.004872, 1, 1, 1, 1, 1,
-0.556514, 0.4332902, -1.464177, 1, 1, 1, 1, 1,
-0.5409751, -0.2349979, -2.624253, 1, 1, 1, 1, 1,
-0.540068, 1.762535, 2.034246, 1, 1, 1, 1, 1,
-0.5355414, -1.373267, -3.378073, 1, 1, 1, 1, 1,
-0.5327331, 0.8498566, 0.04178327, 1, 1, 1, 1, 1,
-0.5325567, -0.9453207, -2.255477, 1, 1, 1, 1, 1,
-0.530099, 1.014238, 0.4123637, 1, 1, 1, 1, 1,
-0.5294538, 0.4278633, -0.2601029, 1, 1, 1, 1, 1,
-0.5256159, 0.06045721, -0.710879, 1, 1, 1, 1, 1,
-0.5233121, -0.6912141, -1.620061, 1, 1, 1, 1, 1,
-0.5142531, 0.1694393, -2.045493, 1, 1, 1, 1, 1,
-0.5123205, 1.994843, -1.0572, 1, 1, 1, 1, 1,
-0.5060818, -0.5205534, -1.147827, 0, 0, 1, 1, 1,
-0.5053285, -2.031927, -3.270083, 1, 0, 0, 1, 1,
-0.4898822, -0.9135551, -4.081869, 1, 0, 0, 1, 1,
-0.4844369, 0.731614, 0.3120351, 1, 0, 0, 1, 1,
-0.4797762, -0.4449564, -2.765983, 1, 0, 0, 1, 1,
-0.4790378, 0.2881618, -0.6857295, 1, 0, 0, 1, 1,
-0.4775759, 1.653814, -1.146411, 0, 0, 0, 1, 1,
-0.4656865, -0.5399088, -0.7713056, 0, 0, 0, 1, 1,
-0.4584957, -2.619382, -2.981994, 0, 0, 0, 1, 1,
-0.4560591, 0.9662873, -2.549663, 0, 0, 0, 1, 1,
-0.4509003, 0.2473527, -1.374073, 0, 0, 0, 1, 1,
-0.4453725, 1.061168, 0.6088531, 0, 0, 0, 1, 1,
-0.4449948, 1.007873, 0.5439714, 0, 0, 0, 1, 1,
-0.4388142, -0.3725107, -3.627629, 1, 1, 1, 1, 1,
-0.4329544, -0.8776231, -2.035792, 1, 1, 1, 1, 1,
-0.43276, 0.4231406, 1.388094, 1, 1, 1, 1, 1,
-0.4275415, -1.830549, -2.98618, 1, 1, 1, 1, 1,
-0.4213687, 0.7799537, 1.175821, 1, 1, 1, 1, 1,
-0.4169349, 0.9181479, -0.01264348, 1, 1, 1, 1, 1,
-0.4140197, -0.1878437, -1.604365, 1, 1, 1, 1, 1,
-0.4130773, -0.5083082, -3.289612, 1, 1, 1, 1, 1,
-0.408468, -0.07383708, -2.200748, 1, 1, 1, 1, 1,
-0.4030499, 0.2102337, -0.9121997, 1, 1, 1, 1, 1,
-0.4018342, -1.414536, -3.245308, 1, 1, 1, 1, 1,
-0.3987272, 0.6867966, -0.6861817, 1, 1, 1, 1, 1,
-0.3896441, 0.205089, -2.318464, 1, 1, 1, 1, 1,
-0.3893492, -0.0313135, -1.243075, 1, 1, 1, 1, 1,
-0.3865002, -0.8681473, -3.376377, 1, 1, 1, 1, 1,
-0.38154, 0.2335529, -1.588626, 0, 0, 1, 1, 1,
-0.3808497, 0.1042391, -0.2119793, 1, 0, 0, 1, 1,
-0.378911, -0.5897424, -1.007226, 1, 0, 0, 1, 1,
-0.3728538, -1.497359, -1.98578, 1, 0, 0, 1, 1,
-0.3712697, 0.5855759, -0.4323693, 1, 0, 0, 1, 1,
-0.3698828, 1.161134, 1.318429, 1, 0, 0, 1, 1,
-0.3688013, -1.092928, -3.10885, 0, 0, 0, 1, 1,
-0.3686119, -0.8443835, -1.762014, 0, 0, 0, 1, 1,
-0.366072, 0.3063436, -2.8129, 0, 0, 0, 1, 1,
-0.3649703, 0.1498053, -2.328417, 0, 0, 0, 1, 1,
-0.363263, -0.7028618, -2.923873, 0, 0, 0, 1, 1,
-0.3608942, 0.380047, -0.04823078, 0, 0, 0, 1, 1,
-0.3575318, 1.564175, 0.409875, 0, 0, 0, 1, 1,
-0.3560897, -0.383077, -1.43475, 1, 1, 1, 1, 1,
-0.3532732, -0.280365, -2.029964, 1, 1, 1, 1, 1,
-0.3513601, -0.44328, -2.357239, 1, 1, 1, 1, 1,
-0.3501907, -0.6796255, -0.9999611, 1, 1, 1, 1, 1,
-0.3443744, 1.508716, -2.678367, 1, 1, 1, 1, 1,
-0.3422426, -0.5841308, -3.328695, 1, 1, 1, 1, 1,
-0.3400702, 0.07263168, -1.028135, 1, 1, 1, 1, 1,
-0.3389799, 0.5554361, -1.01015, 1, 1, 1, 1, 1,
-0.336053, -0.1741341, -1.483534, 1, 1, 1, 1, 1,
-0.335721, -0.04530893, -2.47253, 1, 1, 1, 1, 1,
-0.3354982, 0.5359087, 0.1455996, 1, 1, 1, 1, 1,
-0.3351726, -0.6908528, -2.724513, 1, 1, 1, 1, 1,
-0.3333984, 0.7194141, -1.747593, 1, 1, 1, 1, 1,
-0.3224383, 2.035111, -1.42193, 1, 1, 1, 1, 1,
-0.3200222, 1.233117, -1.611425, 1, 1, 1, 1, 1,
-0.3144505, -0.008299537, 1.399571, 0, 0, 1, 1, 1,
-0.3132333, 1.233181, 0.5075312, 1, 0, 0, 1, 1,
-0.3047026, -1.358447, -0.9798262, 1, 0, 0, 1, 1,
-0.2982515, -1.399637, -2.405725, 1, 0, 0, 1, 1,
-0.2978429, 0.6488286, 0.9890546, 1, 0, 0, 1, 1,
-0.2971132, 0.6943177, -1.299394, 1, 0, 0, 1, 1,
-0.2969072, -1.665143, -4.00079, 0, 0, 0, 1, 1,
-0.2864289, -1.231637, -2.263556, 0, 0, 0, 1, 1,
-0.2862319, -0.5873919, -0.6254092, 0, 0, 0, 1, 1,
-0.2849575, 0.3901296, -0.009263185, 0, 0, 0, 1, 1,
-0.2810865, -1.383353, -3.10647, 0, 0, 0, 1, 1,
-0.279672, -0.3742437, -2.158945, 0, 0, 0, 1, 1,
-0.279186, 0.9909987, -0.9286948, 0, 0, 0, 1, 1,
-0.275486, -0.1371684, -3.778808, 1, 1, 1, 1, 1,
-0.2667525, 0.5774741, -0.3677873, 1, 1, 1, 1, 1,
-0.2611691, -0.6262388, -2.591727, 1, 1, 1, 1, 1,
-0.2611678, -2.100319, -2.58597, 1, 1, 1, 1, 1,
-0.2568308, 0.7468761, 0.4660067, 1, 1, 1, 1, 1,
-0.2560579, -0.2406636, -2.13262, 1, 1, 1, 1, 1,
-0.2535806, -0.3469363, -2.257338, 1, 1, 1, 1, 1,
-0.2498673, 0.005181847, -2.410088, 1, 1, 1, 1, 1,
-0.2494641, 0.0649764, -1.572947, 1, 1, 1, 1, 1,
-0.2487631, 0.6184137, 1.414556, 1, 1, 1, 1, 1,
-0.2482833, 0.6953115, 1.532246, 1, 1, 1, 1, 1,
-0.2431349, -0.4511625, -3.367673, 1, 1, 1, 1, 1,
-0.240644, -0.2963064, -1.778175, 1, 1, 1, 1, 1,
-0.2377168, 0.2977539, -0.5491507, 1, 1, 1, 1, 1,
-0.2345778, 0.6322133, -1.23961, 1, 1, 1, 1, 1,
-0.2321401, 3.175073, 1.041177, 0, 0, 1, 1, 1,
-0.2309829, -0.7656105, -2.59064, 1, 0, 0, 1, 1,
-0.230971, -1.157592, -3.840251, 1, 0, 0, 1, 1,
-0.2307557, 2.246767, 0.2585757, 1, 0, 0, 1, 1,
-0.2302529, -0.3450254, -3.109253, 1, 0, 0, 1, 1,
-0.2278998, -0.6535034, -2.126179, 1, 0, 0, 1, 1,
-0.222894, -0.5179455, -1.794854, 0, 0, 0, 1, 1,
-0.2132057, -0.9265876, -4.791184, 0, 0, 0, 1, 1,
-0.2127724, -0.7659316, -2.423841, 0, 0, 0, 1, 1,
-0.2118905, 0.4201332, -0.4951113, 0, 0, 0, 1, 1,
-0.2086167, 0.1616097, -1.812341, 0, 0, 0, 1, 1,
-0.2083417, -0.007775587, -1.966875, 0, 0, 0, 1, 1,
-0.2062385, 1.054469, -2.571146, 0, 0, 0, 1, 1,
-0.2047553, -0.458882, -2.319695, 1, 1, 1, 1, 1,
-0.203865, -2.530333, -0.7866981, 1, 1, 1, 1, 1,
-0.1927514, -0.3579773, -4.059379, 1, 1, 1, 1, 1,
-0.1923828, 0.5884596, -0.3342799, 1, 1, 1, 1, 1,
-0.1911004, 1.028456, 0.3159344, 1, 1, 1, 1, 1,
-0.1837152, -0.5984632, -2.963217, 1, 1, 1, 1, 1,
-0.1814639, -1.431561, -4.066868, 1, 1, 1, 1, 1,
-0.1812081, -1.058384, -3.410542, 1, 1, 1, 1, 1,
-0.1795258, -0.2591808, -2.717908, 1, 1, 1, 1, 1,
-0.1775334, 2.512567, -0.475414, 1, 1, 1, 1, 1,
-0.1770913, 1.284939, -0.09030344, 1, 1, 1, 1, 1,
-0.1760805, 2.176659, 1.310441, 1, 1, 1, 1, 1,
-0.1644097, 0.8202438, -0.3584508, 1, 1, 1, 1, 1,
-0.1536855, 0.5407121, -0.7037274, 1, 1, 1, 1, 1,
-0.1514246, 1.265219, -0.3605704, 1, 1, 1, 1, 1,
-0.1483874, -0.1730993, -1.313434, 0, 0, 1, 1, 1,
-0.1483146, -2.097142, -3.55602, 1, 0, 0, 1, 1,
-0.1392208, -0.2831852, -3.439162, 1, 0, 0, 1, 1,
-0.1385912, -0.9133844, -1.665166, 1, 0, 0, 1, 1,
-0.1368043, 1.320109, -0.617805, 1, 0, 0, 1, 1,
-0.13195, -1.638695, -3.629413, 1, 0, 0, 1, 1,
-0.1318541, 0.02410604, -2.636477, 0, 0, 0, 1, 1,
-0.1302266, 0.2480672, -0.7986624, 0, 0, 0, 1, 1,
-0.1281018, 2.868383, 0.4310454, 0, 0, 0, 1, 1,
-0.1228804, -0.6114798, -1.307655, 0, 0, 0, 1, 1,
-0.1213858, 1.020179, -1.251273, 0, 0, 0, 1, 1,
-0.1198301, -1.964898, -2.569357, 0, 0, 0, 1, 1,
-0.1154657, 1.057507, -0.2672853, 0, 0, 0, 1, 1,
-0.1145133, -0.8613989, -2.843586, 1, 1, 1, 1, 1,
-0.1142922, 0.1510911, -2.638737, 1, 1, 1, 1, 1,
-0.1131443, -0.3176152, -3.703078, 1, 1, 1, 1, 1,
-0.1122326, -0.08238821, -2.869287, 1, 1, 1, 1, 1,
-0.1115048, 0.375219, -1.509285, 1, 1, 1, 1, 1,
-0.11088, -0.3431204, -2.797161, 1, 1, 1, 1, 1,
-0.109585, -0.5207524, -1.469503, 1, 1, 1, 1, 1,
-0.1092726, 1.324762, 2.607303, 1, 1, 1, 1, 1,
-0.1067495, -0.4458292, -2.996751, 1, 1, 1, 1, 1,
-0.1061746, 0.3179452, -0.06988675, 1, 1, 1, 1, 1,
-0.1053184, 0.6619664, -0.3385732, 1, 1, 1, 1, 1,
-0.1037785, -1.284928, -1.922317, 1, 1, 1, 1, 1,
-0.1023447, -0.1030515, -3.912771, 1, 1, 1, 1, 1,
-0.09656196, 0.2901634, -1.708066, 1, 1, 1, 1, 1,
-0.09637412, -2.377825, -2.448141, 1, 1, 1, 1, 1,
-0.09553763, -1.055465, -2.904598, 0, 0, 1, 1, 1,
-0.09538543, 0.3431702, 0.4355133, 1, 0, 0, 1, 1,
-0.09299029, 0.1496621, 0.6722479, 1, 0, 0, 1, 1,
-0.09292591, -0.6862568, -3.233924, 1, 0, 0, 1, 1,
-0.08838307, 1.08317, -0.513173, 1, 0, 0, 1, 1,
-0.08130656, -2.703876, -1.74719, 1, 0, 0, 1, 1,
-0.07703112, -0.2697117, -2.161598, 0, 0, 0, 1, 1,
-0.07412406, 1.044125, 0.4201798, 0, 0, 0, 1, 1,
-0.07361784, -0.3073732, -3.421868, 0, 0, 0, 1, 1,
-0.06983264, 0.2841359, 1.079792, 0, 0, 0, 1, 1,
-0.06377781, -0.2614512, -1.87171, 0, 0, 0, 1, 1,
-0.06027254, 0.9809622, 0.7576333, 0, 0, 0, 1, 1,
-0.05611786, 0.9817182, 0.9825448, 0, 0, 0, 1, 1,
-0.05496825, 0.4206407, -2.190155, 1, 1, 1, 1, 1,
-0.04965135, 0.4781154, -0.00384154, 1, 1, 1, 1, 1,
-0.0496497, -0.6649899, -3.359894, 1, 1, 1, 1, 1,
-0.04913696, -1.522138, -3.51054, 1, 1, 1, 1, 1,
-0.04528999, -0.7967214, -4.982991, 1, 1, 1, 1, 1,
-0.04320659, 1.549342, -1.049561, 1, 1, 1, 1, 1,
-0.04057543, 1.653693, -0.8089897, 1, 1, 1, 1, 1,
-0.0376799, -0.5033052, -1.515047, 1, 1, 1, 1, 1,
-0.03474293, 1.676414, 1.862699, 1, 1, 1, 1, 1,
-0.03334924, 0.6239866, -1.006815, 1, 1, 1, 1, 1,
-0.02748894, -1.423847, -3.08303, 1, 1, 1, 1, 1,
-0.02528642, 0.9168525, 0.2752351, 1, 1, 1, 1, 1,
-0.02115084, 0.5017807, -0.6613137, 1, 1, 1, 1, 1,
-0.01996205, 0.5729814, 0.1288442, 1, 1, 1, 1, 1,
-0.01783315, -0.5732147, -1.699819, 1, 1, 1, 1, 1,
-0.008769384, 0.2398757, 0.9339681, 0, 0, 1, 1, 1,
-0.005620423, -0.3922196, -2.904262, 1, 0, 0, 1, 1,
-0.00148455, -0.2059201, -2.465408, 1, 0, 0, 1, 1,
0.0005999171, 0.171377, 0.638557, 1, 0, 0, 1, 1,
0.00312106, 1.069705, -0.3050965, 1, 0, 0, 1, 1,
0.007350232, -1.119951, 3.607392, 1, 0, 0, 1, 1,
0.01124286, -0.7079129, 1.691132, 0, 0, 0, 1, 1,
0.01622127, 0.960015, -0.09043244, 0, 0, 0, 1, 1,
0.01815343, -0.7765882, 2.759095, 0, 0, 0, 1, 1,
0.01833373, 1.083136, -2.589163, 0, 0, 0, 1, 1,
0.01949583, 0.6301091, 1.170386, 0, 0, 0, 1, 1,
0.0196598, -0.4007218, 2.197039, 0, 0, 0, 1, 1,
0.02302989, 0.2287469, 0.2648456, 0, 0, 0, 1, 1,
0.02416555, 0.7027515, 0.2432918, 1, 1, 1, 1, 1,
0.02730085, -1.419015, 2.220514, 1, 1, 1, 1, 1,
0.02787186, 0.3723506, 0.1163646, 1, 1, 1, 1, 1,
0.02792042, 0.2635672, -0.1127493, 1, 1, 1, 1, 1,
0.02822803, -0.4733895, 4.164534, 1, 1, 1, 1, 1,
0.03180174, -0.7362635, 4.190464, 1, 1, 1, 1, 1,
0.0324765, -1.469156, 4.542009, 1, 1, 1, 1, 1,
0.03613637, -0.2685683, 3.409283, 1, 1, 1, 1, 1,
0.03642672, -1.477487, 2.813997, 1, 1, 1, 1, 1,
0.0373278, -0.2532763, 1.701987, 1, 1, 1, 1, 1,
0.04082992, -0.4891454, 2.679803, 1, 1, 1, 1, 1,
0.04306931, 0.1248548, -0.6555912, 1, 1, 1, 1, 1,
0.0443368, 0.6936315, 0.7668236, 1, 1, 1, 1, 1,
0.0477724, -0.5712379, 2.072877, 1, 1, 1, 1, 1,
0.05170892, 0.3305143, 1.741806, 1, 1, 1, 1, 1,
0.05221014, -0.6142779, 3.437354, 0, 0, 1, 1, 1,
0.05319132, -0.5102594, 2.867237, 1, 0, 0, 1, 1,
0.05370587, -0.7994319, 3.474186, 1, 0, 0, 1, 1,
0.05380806, -1.074566, 4.128845, 1, 0, 0, 1, 1,
0.05557201, -0.5818634, 3.322808, 1, 0, 0, 1, 1,
0.05673465, -0.8739676, 3.885328, 1, 0, 0, 1, 1,
0.05717185, -0.3399101, 3.427685, 0, 0, 0, 1, 1,
0.05733559, 0.1647307, 2.334465, 0, 0, 0, 1, 1,
0.05913139, -0.6848009, 4.681406, 0, 0, 0, 1, 1,
0.06434855, 0.9165868, -0.5090569, 0, 0, 0, 1, 1,
0.06846129, -0.3611312, 2.531385, 0, 0, 0, 1, 1,
0.07011857, -1.074641, 4.042489, 0, 0, 0, 1, 1,
0.07379615, -0.5766871, 2.620469, 0, 0, 0, 1, 1,
0.07414136, 0.4948157, 0.6315104, 1, 1, 1, 1, 1,
0.0752541, 0.5137934, 0.8251601, 1, 1, 1, 1, 1,
0.0754022, -0.4866175, 2.817279, 1, 1, 1, 1, 1,
0.07722989, -0.6301481, 1.409827, 1, 1, 1, 1, 1,
0.07785365, -1.294731, 4.813501, 1, 1, 1, 1, 1,
0.07816611, 0.4456852, 0.2374109, 1, 1, 1, 1, 1,
0.08070959, -0.7738506, 2.596424, 1, 1, 1, 1, 1,
0.08592201, 0.8126204, -0.3116309, 1, 1, 1, 1, 1,
0.08648503, -0.8009848, 2.514244, 1, 1, 1, 1, 1,
0.08828261, 1.281565, -0.3672156, 1, 1, 1, 1, 1,
0.08959968, -0.836894, 3.092127, 1, 1, 1, 1, 1,
0.0957373, 0.6571223, -0.5741115, 1, 1, 1, 1, 1,
0.1003192, 0.5049126, -0.7531443, 1, 1, 1, 1, 1,
0.1070995, -1.654069, 3.360639, 1, 1, 1, 1, 1,
0.1075455, 0.4157371, 0.04213938, 1, 1, 1, 1, 1,
0.1110042, -1.906452, 4.478978, 0, 0, 1, 1, 1,
0.1126023, -1.459988, 2.525463, 1, 0, 0, 1, 1,
0.1156758, 1.169135, 0.3566061, 1, 0, 0, 1, 1,
0.1164211, 0.2957124, 0.3980178, 1, 0, 0, 1, 1,
0.1197444, 2.922073, 0.2540668, 1, 0, 0, 1, 1,
0.1212827, -1.100137, 3.393625, 1, 0, 0, 1, 1,
0.1214043, -2.349049, 5.638082, 0, 0, 0, 1, 1,
0.1227665, 0.1303614, 2.184369, 0, 0, 0, 1, 1,
0.1267738, 0.3189296, 1.71421, 0, 0, 0, 1, 1,
0.1282234, -0.46507, 4.161813, 0, 0, 0, 1, 1,
0.1286564, 0.8665147, 2.102253, 0, 0, 0, 1, 1,
0.1293786, -1.231457, 3.089187, 0, 0, 0, 1, 1,
0.1315929, 0.8703511, 1.111573, 0, 0, 0, 1, 1,
0.1318513, -0.4528093, 4.354865, 1, 1, 1, 1, 1,
0.141317, -0.2082706, 0.8469039, 1, 1, 1, 1, 1,
0.1425368, 0.4942172, 1.286062, 1, 1, 1, 1, 1,
0.145555, 0.9145945, -0.4827858, 1, 1, 1, 1, 1,
0.1483432, -0.7949502, 2.021236, 1, 1, 1, 1, 1,
0.1483489, 0.6609138, -0.76616, 1, 1, 1, 1, 1,
0.1507815, -0.05937665, 3.998963, 1, 1, 1, 1, 1,
0.1513261, -1.24905, 3.049573, 1, 1, 1, 1, 1,
0.1685283, 0.01640878, 0.5913019, 1, 1, 1, 1, 1,
0.1687673, -0.5751398, 2.704874, 1, 1, 1, 1, 1,
0.1703838, -1.448487, 2.045626, 1, 1, 1, 1, 1,
0.1712385, 0.1617234, 0.416714, 1, 1, 1, 1, 1,
0.1740022, 0.2677169, 1.266123, 1, 1, 1, 1, 1,
0.174966, 2.329479, -1.954036, 1, 1, 1, 1, 1,
0.1751145, -0.09250481, 2.220549, 1, 1, 1, 1, 1,
0.1790855, 0.5990469, -1.818172, 0, 0, 1, 1, 1,
0.183693, 1.203099, 1.729095, 1, 0, 0, 1, 1,
0.1872435, 1.250975, 3.320024, 1, 0, 0, 1, 1,
0.1889175, -0.3433719, 2.935096, 1, 0, 0, 1, 1,
0.19271, 0.1167166, 1.834101, 1, 0, 0, 1, 1,
0.1956889, -1.342434, 2.31601, 1, 0, 0, 1, 1,
0.1974165, -0.6826986, 1.863924, 0, 0, 0, 1, 1,
0.1993952, 0.3560028, 0.5617349, 0, 0, 0, 1, 1,
0.1996143, 0.6414526, 1.048947, 0, 0, 0, 1, 1,
0.2008776, -0.2349221, 2.2177, 0, 0, 0, 1, 1,
0.2062707, 0.2168817, 1.838355, 0, 0, 0, 1, 1,
0.2169889, -0.9384847, 4.664734, 0, 0, 0, 1, 1,
0.2183763, 1.975922, 1.262264, 0, 0, 0, 1, 1,
0.2195426, 0.6409149, 0.394215, 1, 1, 1, 1, 1,
0.2210579, 0.2066218, 2.751823, 1, 1, 1, 1, 1,
0.2238071, -1.128001, 1.315071, 1, 1, 1, 1, 1,
0.2265563, 0.9405199, 0.2326114, 1, 1, 1, 1, 1,
0.2266268, 1.41551, 1.225213, 1, 1, 1, 1, 1,
0.2297872, 0.4361247, 0.5137728, 1, 1, 1, 1, 1,
0.2365287, 0.744503, -1.236946, 1, 1, 1, 1, 1,
0.2378099, -0.4307021, 2.293894, 1, 1, 1, 1, 1,
0.2408171, 1.175742, 0.3143049, 1, 1, 1, 1, 1,
0.2418466, -0.6790382, 2.567614, 1, 1, 1, 1, 1,
0.2428993, -0.009861375, 0.3063286, 1, 1, 1, 1, 1,
0.2432145, 1.244452, -1.581155, 1, 1, 1, 1, 1,
0.2441582, -0.315336, 2.721732, 1, 1, 1, 1, 1,
0.2457961, -0.7185001, 3.746294, 1, 1, 1, 1, 1,
0.2526574, -0.2003852, 1.705674, 1, 1, 1, 1, 1,
0.2545849, 0.4311895, -0.3772232, 0, 0, 1, 1, 1,
0.2554011, 1.082201, -0.2775221, 1, 0, 0, 1, 1,
0.2564209, -0.2924702, 2.909163, 1, 0, 0, 1, 1,
0.2612031, 1.395503, 1.151069, 1, 0, 0, 1, 1,
0.2625453, -0.4050524, 2.697774, 1, 0, 0, 1, 1,
0.2633518, -1.038714, 3.754179, 1, 0, 0, 1, 1,
0.2648888, 0.9583597, 2.250894, 0, 0, 0, 1, 1,
0.2678599, 1.335451, 0.1182937, 0, 0, 0, 1, 1,
0.269006, -0.7904897, 1.88577, 0, 0, 0, 1, 1,
0.26964, -0.3143091, 1.501339, 0, 0, 0, 1, 1,
0.2706752, -0.2598512, 1.439085, 0, 0, 0, 1, 1,
0.2707218, 0.5415289, 0.7273955, 0, 0, 0, 1, 1,
0.2785705, 0.7248667, -1.052428, 0, 0, 0, 1, 1,
0.280595, 0.5405729, -0.361873, 1, 1, 1, 1, 1,
0.2846609, 0.3076723, 1.889004, 1, 1, 1, 1, 1,
0.2847559, 0.2344282, -0.1556903, 1, 1, 1, 1, 1,
0.2897779, -0.08856007, 2.501931, 1, 1, 1, 1, 1,
0.2898666, 0.2700075, 0.9051919, 1, 1, 1, 1, 1,
0.2920577, -0.5322804, 3.277994, 1, 1, 1, 1, 1,
0.2937253, -0.04492482, 1.021886, 1, 1, 1, 1, 1,
0.2968024, 0.6468478, 0.1040005, 1, 1, 1, 1, 1,
0.2976575, -0.07700247, 2.030491, 1, 1, 1, 1, 1,
0.3001214, 0.08432796, 1.7822, 1, 1, 1, 1, 1,
0.3072652, 0.9927012, -0.4392376, 1, 1, 1, 1, 1,
0.3089842, 0.7346011, 0.2954908, 1, 1, 1, 1, 1,
0.3128717, -1.689901, 1.743829, 1, 1, 1, 1, 1,
0.3132258, -0.5879933, 2.348745, 1, 1, 1, 1, 1,
0.3144385, 0.2599695, 1.891062, 1, 1, 1, 1, 1,
0.3168792, 0.2968966, 0.5287442, 0, 0, 1, 1, 1,
0.3173366, 0.3025026, -0.2581477, 1, 0, 0, 1, 1,
0.3176325, 0.1337022, 3.068546, 1, 0, 0, 1, 1,
0.3187351, 0.07601167, 1.749346, 1, 0, 0, 1, 1,
0.3270718, -1.831886, 3.025514, 1, 0, 0, 1, 1,
0.3306491, -1.361336, 3.826287, 1, 0, 0, 1, 1,
0.3313116, -0.9195699, 2.101293, 0, 0, 0, 1, 1,
0.3363173, 0.569035, -1.708518, 0, 0, 0, 1, 1,
0.3365369, 0.01822128, 0.807516, 0, 0, 0, 1, 1,
0.3410605, -0.1620082, 0.3947607, 0, 0, 0, 1, 1,
0.3411089, -0.7472899, 3.513164, 0, 0, 0, 1, 1,
0.3424784, -0.3273341, 2.98597, 0, 0, 0, 1, 1,
0.3476897, -0.5103061, 1.088001, 0, 0, 0, 1, 1,
0.3550937, -0.2337329, 0.8153169, 1, 1, 1, 1, 1,
0.3578751, 0.5931949, 1.508073, 1, 1, 1, 1, 1,
0.358373, 1.54015, 1.615193, 1, 1, 1, 1, 1,
0.3591494, -0.4863792, 3.047732, 1, 1, 1, 1, 1,
0.3617305, -0.8825291, 1.502636, 1, 1, 1, 1, 1,
0.3671427, -0.3655827, 2.363994, 1, 1, 1, 1, 1,
0.3717161, 0.07328172, 1.385938, 1, 1, 1, 1, 1,
0.371847, -1.550776, 3.155687, 1, 1, 1, 1, 1,
0.3747134, 0.1309488, 1.194245, 1, 1, 1, 1, 1,
0.3748229, 1.601134, 1.495774, 1, 1, 1, 1, 1,
0.3769394, 0.03794637, 1.790883, 1, 1, 1, 1, 1,
0.3802156, -0.279041, 3.021251, 1, 1, 1, 1, 1,
0.3856747, -0.8361019, 1.931337, 1, 1, 1, 1, 1,
0.396524, -0.3739278, 1.617044, 1, 1, 1, 1, 1,
0.4019202, -1.438102, 3.626107, 1, 1, 1, 1, 1,
0.4036981, 0.7615215, 1.47685, 0, 0, 1, 1, 1,
0.4041465, 0.01506682, -0.0139175, 1, 0, 0, 1, 1,
0.4045679, -0.9573281, 3.64148, 1, 0, 0, 1, 1,
0.4062479, -0.504779, 2.344074, 1, 0, 0, 1, 1,
0.4108753, -0.2616139, 2.668582, 1, 0, 0, 1, 1,
0.4112084, 0.6100656, 2.065492, 1, 0, 0, 1, 1,
0.4119642, 0.5378418, 0.3629927, 0, 0, 0, 1, 1,
0.4217215, -0.1206898, 3.62521, 0, 0, 0, 1, 1,
0.4259117, 1.146297, -0.4467583, 0, 0, 0, 1, 1,
0.4270943, -0.9098028, 1.462157, 0, 0, 0, 1, 1,
0.4313874, -0.7159436, 3.464668, 0, 0, 0, 1, 1,
0.4377788, 0.5553905, 0.6025789, 0, 0, 0, 1, 1,
0.4383046, 1.191872, -1.616045, 0, 0, 0, 1, 1,
0.4394962, 1.241428, 0.6052613, 1, 1, 1, 1, 1,
0.4398448, -1.406574, 1.263859, 1, 1, 1, 1, 1,
0.4453286, -2.397444, 1.606181, 1, 1, 1, 1, 1,
0.4472563, 2.722168, 3.309122, 1, 1, 1, 1, 1,
0.4485877, 0.4402851, 0.1435364, 1, 1, 1, 1, 1,
0.4499679, 0.1128312, 1.561764, 1, 1, 1, 1, 1,
0.4537907, -1.614386, 2.978026, 1, 1, 1, 1, 1,
0.4550904, 1.082719, -0.8798899, 1, 1, 1, 1, 1,
0.4577705, 1.880266, 1.045713, 1, 1, 1, 1, 1,
0.4590169, 0.285292, 1.112753, 1, 1, 1, 1, 1,
0.4602188, -1.102843, 1.804853, 1, 1, 1, 1, 1,
0.4603648, -1.331793, 2.995044, 1, 1, 1, 1, 1,
0.4636433, 0.5696474, 1.7834, 1, 1, 1, 1, 1,
0.4676206, 1.54386, 0.8947758, 1, 1, 1, 1, 1,
0.4708882, 0.2008827, 2.727188, 1, 1, 1, 1, 1,
0.4718898, -0.3669697, 1.970697, 0, 0, 1, 1, 1,
0.4795918, 0.06403641, 2.065217, 1, 0, 0, 1, 1,
0.4806471, -0.3925162, 1.096823, 1, 0, 0, 1, 1,
0.4807654, -0.9080361, 2.113519, 1, 0, 0, 1, 1,
0.4812197, 0.4757703, 0.9637303, 1, 0, 0, 1, 1,
0.4881563, -1.126289, 2.539877, 1, 0, 0, 1, 1,
0.4930275, 0.1321871, 1.235158, 0, 0, 0, 1, 1,
0.4936011, -0.6558165, 3.564997, 0, 0, 0, 1, 1,
0.4961439, 0.3189393, 1.456259, 0, 0, 0, 1, 1,
0.5048416, 0.2747522, 1.214028, 0, 0, 0, 1, 1,
0.5048992, -0.1170061, 2.577497, 0, 0, 0, 1, 1,
0.5074459, 1.235406, -0.1195164, 0, 0, 0, 1, 1,
0.513167, -0.1560669, 2.127133, 0, 0, 0, 1, 1,
0.515079, -0.1797148, 3.289734, 1, 1, 1, 1, 1,
0.5211492, -0.2753704, 0.9828779, 1, 1, 1, 1, 1,
0.5215157, -1.271319, 3.652086, 1, 1, 1, 1, 1,
0.5225478, -0.8185889, 2.697606, 1, 1, 1, 1, 1,
0.5263593, 0.995474, 0.6541538, 1, 1, 1, 1, 1,
0.5270702, -0.8317019, 1.538451, 1, 1, 1, 1, 1,
0.5282175, -1.913012, 3.407622, 1, 1, 1, 1, 1,
0.5309212, -1.187956, 3.213317, 1, 1, 1, 1, 1,
0.5310041, 0.06511883, 1.042672, 1, 1, 1, 1, 1,
0.537589, -0.8197263, 1.603291, 1, 1, 1, 1, 1,
0.538219, -0.1655917, 1.78149, 1, 1, 1, 1, 1,
0.5387108, 0.6924149, 1.698429, 1, 1, 1, 1, 1,
0.5391102, -1.036714, 2.303912, 1, 1, 1, 1, 1,
0.5465789, -1.579407, 2.405935, 1, 1, 1, 1, 1,
0.5494919, 1.467936, -0.07944607, 1, 1, 1, 1, 1,
0.5514065, 0.2767972, 0.4191649, 0, 0, 1, 1, 1,
0.5515274, -0.1509392, 3.030891, 1, 0, 0, 1, 1,
0.5530092, -0.826013, 2.45292, 1, 0, 0, 1, 1,
0.5667881, -1.535816, 3.77536, 1, 0, 0, 1, 1,
0.5671788, -0.2550176, 1.411467, 1, 0, 0, 1, 1,
0.5682994, 1.209501, 0.5519034, 1, 0, 0, 1, 1,
0.573573, -1.895702, 1.685661, 0, 0, 0, 1, 1,
0.5757304, 0.6945239, 2.127596, 0, 0, 0, 1, 1,
0.5783003, 0.2212864, 0.7908239, 0, 0, 0, 1, 1,
0.5787907, 0.7217015, 2.122797, 0, 0, 0, 1, 1,
0.5871954, -0.711002, 3.526973, 0, 0, 0, 1, 1,
0.5912877, -1.766373, 3.279318, 0, 0, 0, 1, 1,
0.5914066, -0.1038664, 1.999688, 0, 0, 0, 1, 1,
0.5917861, -0.8720714, 1.621293, 1, 1, 1, 1, 1,
0.5955061, 2.647237, 2.203323, 1, 1, 1, 1, 1,
0.5994813, -0.8516052, 3.02787, 1, 1, 1, 1, 1,
0.6023337, 0.2392927, 2.528338, 1, 1, 1, 1, 1,
0.6048903, -0.7722101, 3.438997, 1, 1, 1, 1, 1,
0.6066114, 1.339783, 1.286899, 1, 1, 1, 1, 1,
0.6076334, -0.8439712, 3.338865, 1, 1, 1, 1, 1,
0.6090707, 0.8217399, -0.2945158, 1, 1, 1, 1, 1,
0.6103703, 0.08138627, 0.8386038, 1, 1, 1, 1, 1,
0.6136345, 2.131423, 0.05478372, 1, 1, 1, 1, 1,
0.6138114, -1.008034, 2.664296, 1, 1, 1, 1, 1,
0.6155297, 0.6417787, -0.4132024, 1, 1, 1, 1, 1,
0.6197196, -0.2543822, -1.426082, 1, 1, 1, 1, 1,
0.6203446, -0.4335202, 2.553194, 1, 1, 1, 1, 1,
0.6245309, -0.1394898, 2.004454, 1, 1, 1, 1, 1,
0.6270763, 0.3803662, 1.892271, 0, 0, 1, 1, 1,
0.6299837, 0.3672649, 1.12526, 1, 0, 0, 1, 1,
0.631991, 0.5852407, 1.760332, 1, 0, 0, 1, 1,
0.6339856, 0.2637498, -0.07900926, 1, 0, 0, 1, 1,
0.6395311, -1.203204, 2.054289, 1, 0, 0, 1, 1,
0.6405772, 0.9817719, 0.8361107, 1, 0, 0, 1, 1,
0.6463361, -1.37283, 1.480238, 0, 0, 0, 1, 1,
0.6471919, -0.8107291, 2.292145, 0, 0, 0, 1, 1,
0.6528147, -1.605153, 2.534776, 0, 0, 0, 1, 1,
0.6546558, 0.5044604, 2.527138, 0, 0, 0, 1, 1,
0.6557947, -1.008573, 1.102795, 0, 0, 0, 1, 1,
0.6563678, -0.2105507, 0.08138764, 0, 0, 0, 1, 1,
0.6574818, 0.9061894, 2.012522, 0, 0, 0, 1, 1,
0.6589705, 0.2700703, 1.121133, 1, 1, 1, 1, 1,
0.6646908, -2.034826, 2.881579, 1, 1, 1, 1, 1,
0.6652658, 0.7069305, 1.558253, 1, 1, 1, 1, 1,
0.6664448, -1.783349, 3.086363, 1, 1, 1, 1, 1,
0.6688237, 0.1043326, -0.2708865, 1, 1, 1, 1, 1,
0.6733513, -0.7327314, 3.766977, 1, 1, 1, 1, 1,
0.6778498, -1.787891, 3.421346, 1, 1, 1, 1, 1,
0.6783704, -0.9435033, 1.380133, 1, 1, 1, 1, 1,
0.6858341, 1.088661, -0.3343706, 1, 1, 1, 1, 1,
0.6867802, 0.6693248, 1.084708, 1, 1, 1, 1, 1,
0.6868655, 1.488566, 1.138827, 1, 1, 1, 1, 1,
0.690971, -0.6194201, 1.639145, 1, 1, 1, 1, 1,
0.6939911, -1.325095, 2.090819, 1, 1, 1, 1, 1,
0.7055543, 0.02680668, 0.4077542, 1, 1, 1, 1, 1,
0.7157532, 0.7326958, 1.444811, 1, 1, 1, 1, 1,
0.7176083, 1.181982, 0.3875485, 0, 0, 1, 1, 1,
0.7234622, -0.1754159, 1.315619, 1, 0, 0, 1, 1,
0.7259629, -0.04378503, 2.425156, 1, 0, 0, 1, 1,
0.7288866, -0.3140278, 0.5957921, 1, 0, 0, 1, 1,
0.7321165, -0.9444573, 2.913364, 1, 0, 0, 1, 1,
0.7329726, -1.286132, 1.856903, 1, 0, 0, 1, 1,
0.74325, 0.5926929, 0.03090398, 0, 0, 0, 1, 1,
0.7448456, -0.4840588, 2.896124, 0, 0, 0, 1, 1,
0.745706, -0.3472788, 2.575627, 0, 0, 0, 1, 1,
0.7534747, -0.7654045, -0.06138683, 0, 0, 0, 1, 1,
0.7663021, 0.1541514, 4.290002, 0, 0, 0, 1, 1,
0.7667848, -0.2858213, 2.270246, 0, 0, 0, 1, 1,
0.7721058, 0.25579, 0.6693931, 0, 0, 0, 1, 1,
0.7747972, 0.2942139, 1.478914, 1, 1, 1, 1, 1,
0.7799733, 0.5489722, 1.956533, 1, 1, 1, 1, 1,
0.7853621, 1.431211, 0.09804824, 1, 1, 1, 1, 1,
0.787046, 0.5519251, 0.3250846, 1, 1, 1, 1, 1,
0.7948789, 0.08824654, 2.295817, 1, 1, 1, 1, 1,
0.8002654, 0.6087024, 0.6077759, 1, 1, 1, 1, 1,
0.8012015, 1.295099, 1.610653, 1, 1, 1, 1, 1,
0.8058618, 1.170546, 0.9965999, 1, 1, 1, 1, 1,
0.8064782, -0.317428, 2.44967, 1, 1, 1, 1, 1,
0.8075612, -1.205762, 3.584605, 1, 1, 1, 1, 1,
0.8086541, 0.6388212, 0.201896, 1, 1, 1, 1, 1,
0.8096645, 0.2758749, 0.9160177, 1, 1, 1, 1, 1,
0.8124369, -0.6376349, 2.312929, 1, 1, 1, 1, 1,
0.8130054, 0.1517123, 0.4409874, 1, 1, 1, 1, 1,
0.8158768, 0.3677317, -0.8377814, 1, 1, 1, 1, 1,
0.8230129, -1.552194, 3.839471, 0, 0, 1, 1, 1,
0.8275186, 1.129894, 0.3338051, 1, 0, 0, 1, 1,
0.8391942, 0.2534455, 1.807524, 1, 0, 0, 1, 1,
0.8401731, 0.7114441, 0.1777917, 1, 0, 0, 1, 1,
0.842218, -0.7919353, 3.511822, 1, 0, 0, 1, 1,
0.8427877, -2.843389, 3.125515, 1, 0, 0, 1, 1,
0.8437583, -0.463899, 3.469318, 0, 0, 0, 1, 1,
0.8444737, -0.8102415, 2.837182, 0, 0, 0, 1, 1,
0.8457938, -0.847243, 3.766347, 0, 0, 0, 1, 1,
0.8464626, 0.1916715, 0.6931849, 0, 0, 0, 1, 1,
0.8479181, -0.5733076, 3.419859, 0, 0, 0, 1, 1,
0.8514473, 1.375914, 0.8954315, 0, 0, 0, 1, 1,
0.8537408, -0.1050668, 0.4997035, 0, 0, 0, 1, 1,
0.8539866, -1.93977, 2.838962, 1, 1, 1, 1, 1,
0.8565181, 0.1377028, 1.221734, 1, 1, 1, 1, 1,
0.8586082, 1.725245, 0.9051826, 1, 1, 1, 1, 1,
0.8602761, 0.4495728, 1.112562, 1, 1, 1, 1, 1,
0.8608602, -0.7953835, 2.5753, 1, 1, 1, 1, 1,
0.8612635, 2.069944, 0.693226, 1, 1, 1, 1, 1,
0.8614134, 0.5085208, 2.774026, 1, 1, 1, 1, 1,
0.8655353, 1.36701, -0.5135686, 1, 1, 1, 1, 1,
0.8752809, -1.800369, 2.600581, 1, 1, 1, 1, 1,
0.8841897, 0.2401385, 1.163595, 1, 1, 1, 1, 1,
0.8852741, 1.044618, 0.8394102, 1, 1, 1, 1, 1,
0.8885602, 0.3904083, 1.26648, 1, 1, 1, 1, 1,
0.8889051, -1.008742, 2.191638, 1, 1, 1, 1, 1,
0.8906116, -0.9723254, -0.6610652, 1, 1, 1, 1, 1,
0.8932859, -1.622145, 3.209485, 1, 1, 1, 1, 1,
0.8981922, 0.5665914, 1.895955, 0, 0, 1, 1, 1,
0.9018089, 0.1463047, 0.9203143, 1, 0, 0, 1, 1,
0.9057354, 0.7825304, 2.466345, 1, 0, 0, 1, 1,
0.9107051, -2.066741, 1.030393, 1, 0, 0, 1, 1,
0.9144861, 0.9078935, 1.71504, 1, 0, 0, 1, 1,
0.9160237, 0.5790431, 0.4857678, 1, 0, 0, 1, 1,
0.9248888, -1.084824, 1.884721, 0, 0, 0, 1, 1,
0.9271089, -0.8340603, 0.7137809, 0, 0, 0, 1, 1,
0.9295648, -1.005362, 3.218233, 0, 0, 0, 1, 1,
0.9307806, -0.7629037, 1.014064, 0, 0, 0, 1, 1,
0.9320025, -0.01273298, 1.772407, 0, 0, 0, 1, 1,
0.9335902, -0.697547, 3.377587, 0, 0, 0, 1, 1,
0.9472046, 0.7885208, 1.316755, 0, 0, 0, 1, 1,
0.9558585, 1.367719, 0.5607181, 1, 1, 1, 1, 1,
0.9568728, 0.8510484, 2.229899, 1, 1, 1, 1, 1,
0.9570825, 0.6607949, 1.716384, 1, 1, 1, 1, 1,
0.9591132, 1.289536, 2.140787, 1, 1, 1, 1, 1,
0.9600006, 0.3365029, 1.931951, 1, 1, 1, 1, 1,
0.9623462, 1.979964, 1.06178, 1, 1, 1, 1, 1,
0.9625638, 0.233079, 3.565958, 1, 1, 1, 1, 1,
0.9703156, 0.4329971, 1.398515, 1, 1, 1, 1, 1,
0.9720941, 0.8497822, 0.7615826, 1, 1, 1, 1, 1,
0.9730836, -1.132622, 2.228009, 1, 1, 1, 1, 1,
0.9870457, -0.9021945, 3.395666, 1, 1, 1, 1, 1,
0.9942354, 0.1263627, 1.305096, 1, 1, 1, 1, 1,
0.9955219, -0.08389368, 1.669063, 1, 1, 1, 1, 1,
1.005915, -0.6260071, 1.94773, 1, 1, 1, 1, 1,
1.013393, -0.08251262, 1.857961, 1, 1, 1, 1, 1,
1.014228, 0.2142023, 1.018422, 0, 0, 1, 1, 1,
1.014954, 0.3682348, -1.382706, 1, 0, 0, 1, 1,
1.017265, 0.06180392, 0.327014, 1, 0, 0, 1, 1,
1.019047, -0.5026283, 0.7869129, 1, 0, 0, 1, 1,
1.020175, 0.2596206, 1.068249, 1, 0, 0, 1, 1,
1.031049, -0.6423254, 2.571341, 1, 0, 0, 1, 1,
1.03338, 1.057059, 1.922923, 0, 0, 0, 1, 1,
1.033753, 1.142917, 0.4969662, 0, 0, 0, 1, 1,
1.046785, 0.3021155, 0.4494775, 0, 0, 0, 1, 1,
1.048459, -0.3040442, 2.657698, 0, 0, 0, 1, 1,
1.059786, -0.5317293, 2.805194, 0, 0, 0, 1, 1,
1.068066, 0.4817689, 2.074566, 0, 0, 0, 1, 1,
1.068613, -0.4409445, 0.4649889, 0, 0, 0, 1, 1,
1.081173, 2.131571, 2.678737, 1, 1, 1, 1, 1,
1.087113, -0.6270856, -0.1526551, 1, 1, 1, 1, 1,
1.089841, -0.7096837, 1.7063, 1, 1, 1, 1, 1,
1.092179, -0.3993498, 2.604061, 1, 1, 1, 1, 1,
1.095166, -0.4972564, 0.8148404, 1, 1, 1, 1, 1,
1.122227, 0.5728915, 1.826441, 1, 1, 1, 1, 1,
1.122253, -0.7799084, 3.019256, 1, 1, 1, 1, 1,
1.134884, -1.092733, 0.991578, 1, 1, 1, 1, 1,
1.136188, -0.3887444, 2.634723, 1, 1, 1, 1, 1,
1.13866, -1.199059, 1.706721, 1, 1, 1, 1, 1,
1.14803, 0.3195575, 0.2714088, 1, 1, 1, 1, 1,
1.162419, -0.3906442, 2.111313, 1, 1, 1, 1, 1,
1.162796, 0.1478807, 1.598048, 1, 1, 1, 1, 1,
1.166048, -0.1609931, 2.183366, 1, 1, 1, 1, 1,
1.169747, 0.2940423, 1.116252, 1, 1, 1, 1, 1,
1.172205, 0.1483943, 0.6875879, 0, 0, 1, 1, 1,
1.172324, 1.189566, 2.146171, 1, 0, 0, 1, 1,
1.178499, -1.642443, 3.632496, 1, 0, 0, 1, 1,
1.183289, 2.096241, 0.5267404, 1, 0, 0, 1, 1,
1.191008, 0.1885096, -0.2431609, 1, 0, 0, 1, 1,
1.195005, -0.6829641, 1.173368, 1, 0, 0, 1, 1,
1.196223, -0.1074335, 0.3674057, 0, 0, 0, 1, 1,
1.196755, -0.5837397, 2.58253, 0, 0, 0, 1, 1,
1.20103, 1.711174, 0.7494707, 0, 0, 0, 1, 1,
1.204217, 0.9023792, 1.146791, 0, 0, 0, 1, 1,
1.214654, -0.2115391, 4.395356, 0, 0, 0, 1, 1,
1.214961, -0.3957566, 2.798085, 0, 0, 0, 1, 1,
1.21565, 0.8633544, 0.5495237, 0, 0, 0, 1, 1,
1.216963, 0.4099747, 0.5540711, 1, 1, 1, 1, 1,
1.217343, -1.755685, 2.102658, 1, 1, 1, 1, 1,
1.223983, 0.1506229, 2.474371, 1, 1, 1, 1, 1,
1.22928, 0.2158365, 1.643628, 1, 1, 1, 1, 1,
1.23115, -0.342479, 1.019802, 1, 1, 1, 1, 1,
1.232937, 0.3550679, 1.494223, 1, 1, 1, 1, 1,
1.233466, 0.5108395, 1.755055, 1, 1, 1, 1, 1,
1.236871, 1.398626, 1.085566, 1, 1, 1, 1, 1,
1.2373, 0.5967693, 1.183743, 1, 1, 1, 1, 1,
1.239319, -0.8166367, 1.359152, 1, 1, 1, 1, 1,
1.2479, 0.4253066, 1.431529, 1, 1, 1, 1, 1,
1.247997, 0.3698855, 1.158462, 1, 1, 1, 1, 1,
1.251359, 1.200238, 0.3007252, 1, 1, 1, 1, 1,
1.26223, -0.5651736, 2.574273, 1, 1, 1, 1, 1,
1.266361, -0.9853587, 2.172981, 1, 1, 1, 1, 1,
1.274788, 0.2824189, 1.274504, 0, 0, 1, 1, 1,
1.281976, 0.8027068, 1.135553, 1, 0, 0, 1, 1,
1.289455, 0.1485833, 0.590073, 1, 0, 0, 1, 1,
1.29676, 0.5394312, 2.337759, 1, 0, 0, 1, 1,
1.298431, 0.3986904, 0.876501, 1, 0, 0, 1, 1,
1.308455, 1.886032, 1.417471, 1, 0, 0, 1, 1,
1.31205, 0.004685904, 1.651197, 0, 0, 0, 1, 1,
1.321288, 1.449294, 1.942948, 0, 0, 0, 1, 1,
1.326512, -1.322567, 1.850559, 0, 0, 0, 1, 1,
1.344052, 0.5994987, 0.740576, 0, 0, 0, 1, 1,
1.346668, 0.3846894, 1.029117, 0, 0, 0, 1, 1,
1.360316, 0.6383767, 0.5657449, 0, 0, 0, 1, 1,
1.363358, -0.5070181, 0.822391, 0, 0, 0, 1, 1,
1.364612, 0.7919817, 2.747154, 1, 1, 1, 1, 1,
1.365245, -1.782738, 1.425558, 1, 1, 1, 1, 1,
1.421471, -0.03921351, 1.812635, 1, 1, 1, 1, 1,
1.430472, 1.562722, 0.7273169, 1, 1, 1, 1, 1,
1.431515, -0.1910311, 1.307088, 1, 1, 1, 1, 1,
1.433594, -0.9057795, 2.448568, 1, 1, 1, 1, 1,
1.435071, -0.4148357, -0.714907, 1, 1, 1, 1, 1,
1.435677, 1.255954, 0.9708325, 1, 1, 1, 1, 1,
1.435932, -0.8842725, 4.087609, 1, 1, 1, 1, 1,
1.436136, 0.3636588, 3.018523, 1, 1, 1, 1, 1,
1.438042, 1.53406, 0.1777248, 1, 1, 1, 1, 1,
1.462655, 0.3926618, 4.347178, 1, 1, 1, 1, 1,
1.466614, 0.07984356, 2.197146, 1, 1, 1, 1, 1,
1.489338, -1.327072, 2.855232, 1, 1, 1, 1, 1,
1.495204, 0.08994913, 1.224399, 1, 1, 1, 1, 1,
1.496029, 0.2246202, 1.313361, 0, 0, 1, 1, 1,
1.516259, -2.292485, 3.382745, 1, 0, 0, 1, 1,
1.522978, 0.5142223, -0.1013611, 1, 0, 0, 1, 1,
1.528784, 0.2344545, 2.462079, 1, 0, 0, 1, 1,
1.534177, -1.56595, 2.162409, 1, 0, 0, 1, 1,
1.536373, 0.01556296, 0.4998342, 1, 0, 0, 1, 1,
1.537016, 0.3479149, 2.581136, 0, 0, 0, 1, 1,
1.548125, -1.255696, 0.4615286, 0, 0, 0, 1, 1,
1.553304, -0.6007152, 1.559982, 0, 0, 0, 1, 1,
1.560648, 1.607977, 1.057305, 0, 0, 0, 1, 1,
1.57766, 0.2600105, 0.6659017, 0, 0, 0, 1, 1,
1.580334, -0.9488451, 2.338379, 0, 0, 0, 1, 1,
1.600881, -0.5548375, 3.849999, 0, 0, 0, 1, 1,
1.611244, -1.809793, 2.087239, 1, 1, 1, 1, 1,
1.615381, -1.408613, 1.684824, 1, 1, 1, 1, 1,
1.618749, -0.4141314, 2.484613, 1, 1, 1, 1, 1,
1.620327, -0.84594, 0.9256932, 1, 1, 1, 1, 1,
1.625111, -0.7943947, 3.368869, 1, 1, 1, 1, 1,
1.626369, 0.7435579, 1.637583, 1, 1, 1, 1, 1,
1.644095, 0.1575467, -0.00785374, 1, 1, 1, 1, 1,
1.647626, -1.85008, 1.316351, 1, 1, 1, 1, 1,
1.648884, -0.1973743, 3.433003, 1, 1, 1, 1, 1,
1.650325, 0.7340571, 1.350222, 1, 1, 1, 1, 1,
1.657892, 0.208598, 2.938246, 1, 1, 1, 1, 1,
1.66772, -0.2220076, 2.445713, 1, 1, 1, 1, 1,
1.680995, -0.2231077, 2.038538, 1, 1, 1, 1, 1,
1.682692, -0.646265, 1.648657, 1, 1, 1, 1, 1,
1.690642, 0.3125909, 1.895913, 1, 1, 1, 1, 1,
1.697708, 0.3752207, 1.963294, 0, 0, 1, 1, 1,
1.702994, 1.20137, 0.7676772, 1, 0, 0, 1, 1,
1.70491, 2.388865, 0.4729404, 1, 0, 0, 1, 1,
1.712514, 0.9436938, -0.3151366, 1, 0, 0, 1, 1,
1.719697, -1.752003, 2.529723, 1, 0, 0, 1, 1,
1.734991, -0.3866237, 0.42796, 1, 0, 0, 1, 1,
1.794763, 0.1127667, 0.8978156, 0, 0, 0, 1, 1,
1.796074, 0.2920756, 1.093063, 0, 0, 0, 1, 1,
1.814245, -1.111752, 2.151852, 0, 0, 0, 1, 1,
1.819071, -0.5869666, -0.1114199, 0, 0, 0, 1, 1,
1.821962, 0.7192095, 1.204504, 0, 0, 0, 1, 1,
1.822569, -0.8911908, 0.7564634, 0, 0, 0, 1, 1,
1.828183, 0.5485417, 1.782058, 0, 0, 0, 1, 1,
1.839601, -0.8088596, 0.3807435, 1, 1, 1, 1, 1,
1.848631, 1.281046, 0.8984962, 1, 1, 1, 1, 1,
1.884164, -0.2339447, 0.7677571, 1, 1, 1, 1, 1,
1.886268, -0.3559521, 3.122204, 1, 1, 1, 1, 1,
1.886781, -0.2189076, 1.200074, 1, 1, 1, 1, 1,
1.893972, 1.20251, 1.399293, 1, 1, 1, 1, 1,
1.908557, 0.9603245, 1.024194, 1, 1, 1, 1, 1,
1.926379, -0.5094327, 2.908777, 1, 1, 1, 1, 1,
1.941366, -1.846134, 2.191282, 1, 1, 1, 1, 1,
1.94759, -1.41028, 2.216202, 1, 1, 1, 1, 1,
1.956413, 0.04349882, 1.249165, 1, 1, 1, 1, 1,
1.970403, -0.05679095, 1.880907, 1, 1, 1, 1, 1,
1.981676, 1.427294, -0.9189368, 1, 1, 1, 1, 1,
1.98582, 0.1269936, 1.650541, 1, 1, 1, 1, 1,
1.989508, 0.7212919, 1.742335, 1, 1, 1, 1, 1,
2.007545, 0.4545475, 2.410438, 0, 0, 1, 1, 1,
2.009112, 0.06183683, 2.361573, 1, 0, 0, 1, 1,
2.050339, -1.550028, 2.007941, 1, 0, 0, 1, 1,
2.065282, -0.0957612, 1.976428, 1, 0, 0, 1, 1,
2.101935, 0.1970527, 0.1642456, 1, 0, 0, 1, 1,
2.102209, -0.4845469, 2.917264, 1, 0, 0, 1, 1,
2.128247, 0.4554649, 2.515187, 0, 0, 0, 1, 1,
2.14631, 0.393111, 1.230416, 0, 0, 0, 1, 1,
2.206639, 0.7183267, 1.507825, 0, 0, 0, 1, 1,
2.245364, -1.987518, 1.962886, 0, 0, 0, 1, 1,
2.263455, -1.087768, 1.231865, 0, 0, 0, 1, 1,
2.271646, 1.583125, -0.07866841, 0, 0, 0, 1, 1,
2.283443, -1.160081, 1.347519, 0, 0, 0, 1, 1,
2.324086, 0.5912547, -0.683203, 1, 1, 1, 1, 1,
2.349575, 0.4913782, 1.538174, 1, 1, 1, 1, 1,
2.479762, -0.08808629, 0.1471765, 1, 1, 1, 1, 1,
2.488971, -0.8567838, 1.317192, 1, 1, 1, 1, 1,
2.517182, 0.6689948, 0.6303612, 1, 1, 1, 1, 1,
2.594967, 1.666572, 2.995996, 1, 1, 1, 1, 1,
3.20391, 1.048859, 1.339416, 1, 1, 1, 1, 1
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
var radius = 9.56034;
var distance = 33.58028;
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
mvMatrix.translate( 0.1436186, -0.1513577, -0.2783666 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.58028);
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
