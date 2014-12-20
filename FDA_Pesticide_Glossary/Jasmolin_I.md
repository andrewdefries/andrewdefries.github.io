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
-3.603652, -1.560638, -1.286175, 1, 0, 0, 1,
-3.012177, 0.9706782, -0.737146, 1, 0.007843138, 0, 1,
-2.925101, 0.5549039, -0.7009298, 1, 0.01176471, 0, 1,
-2.75389, -1.291262, -3.00302, 1, 0.01960784, 0, 1,
-2.73734, 0.1006746, -2.929746, 1, 0.02352941, 0, 1,
-2.640926, -0.6601471, -4.107721, 1, 0.03137255, 0, 1,
-2.576678, -1.016426, -2.605445, 1, 0.03529412, 0, 1,
-2.480846, -0.9650448, 0.05244989, 1, 0.04313726, 0, 1,
-2.381866, -0.7998637, -1.240108, 1, 0.04705882, 0, 1,
-2.365844, -0.8137872, -1.546754, 1, 0.05490196, 0, 1,
-2.312079, -0.8369705, -1.011264, 1, 0.05882353, 0, 1,
-2.309319, -0.5629167, -4.003705, 1, 0.06666667, 0, 1,
-2.277998, -1.120853, -2.556151, 1, 0.07058824, 0, 1,
-2.234842, 0.6873793, -0.1614468, 1, 0.07843138, 0, 1,
-2.202012, 0.2837906, -1.522093, 1, 0.08235294, 0, 1,
-2.18943, 0.8390805, -2.631871, 1, 0.09019608, 0, 1,
-2.167323, 0.5461168, -1.638584, 1, 0.09411765, 0, 1,
-2.156423, 0.5731103, -2.015399, 1, 0.1019608, 0, 1,
-2.144045, -0.297057, -0.8381, 1, 0.1098039, 0, 1,
-2.080609, 0.2322998, -3.736558, 1, 0.1137255, 0, 1,
-2.065751, 0.3347182, -1.033731, 1, 0.1215686, 0, 1,
-2.054262, 2.203538, 0.30658, 1, 0.1254902, 0, 1,
-1.994614, -0.08618495, -3.266592, 1, 0.1333333, 0, 1,
-1.985561, -0.3271532, -0.2792239, 1, 0.1372549, 0, 1,
-1.963333, 0.8068873, -0.6208821, 1, 0.145098, 0, 1,
-1.959302, -0.157912, -1.783296, 1, 0.1490196, 0, 1,
-1.900204, 1.675679, -2.424417, 1, 0.1568628, 0, 1,
-1.840649, -0.3828554, -1.221993, 1, 0.1607843, 0, 1,
-1.832356, 0.7472499, -0.4212107, 1, 0.1686275, 0, 1,
-1.817799, -0.006968422, -0.2085578, 1, 0.172549, 0, 1,
-1.816884, 0.6667128, -1.028983, 1, 0.1803922, 0, 1,
-1.806472, -0.5497045, -2.470883, 1, 0.1843137, 0, 1,
-1.776063, 0.04654997, -1.83889, 1, 0.1921569, 0, 1,
-1.756573, 0.163571, -1.122634, 1, 0.1960784, 0, 1,
-1.752501, -0.6849258, -2.096532, 1, 0.2039216, 0, 1,
-1.731029, 0.444282, -0.9340971, 1, 0.2117647, 0, 1,
-1.723448, 0.9167189, -1.76609, 1, 0.2156863, 0, 1,
-1.710681, 0.01900703, -1.636067, 1, 0.2235294, 0, 1,
-1.685159, 0.1631112, -1.193847, 1, 0.227451, 0, 1,
-1.683727, 2.129337, -3.315143, 1, 0.2352941, 0, 1,
-1.67837, -0.1787792, -0.1402448, 1, 0.2392157, 0, 1,
-1.666517, 0.6628746, -1.176129, 1, 0.2470588, 0, 1,
-1.666073, -0.7260838, -2.304148, 1, 0.2509804, 0, 1,
-1.659544, -1.199215, -3.385039, 1, 0.2588235, 0, 1,
-1.641423, -0.8108426, -3.184118, 1, 0.2627451, 0, 1,
-1.632012, -0.4380138, 0.05960088, 1, 0.2705882, 0, 1,
-1.612052, 0.6783375, -0.9118648, 1, 0.2745098, 0, 1,
-1.598664, 0.05071004, -1.200808, 1, 0.282353, 0, 1,
-1.585894, 1.449213, -1.744739, 1, 0.2862745, 0, 1,
-1.575969, 0.5498485, -2.087812, 1, 0.2941177, 0, 1,
-1.548519, 0.5879335, -0.3886777, 1, 0.3019608, 0, 1,
-1.535507, -0.7223971, -2.486015, 1, 0.3058824, 0, 1,
-1.516116, 0.2745305, -2.304134, 1, 0.3137255, 0, 1,
-1.486805, 0.00132058, -2.385259, 1, 0.3176471, 0, 1,
-1.477904, -0.4614851, -1.98489, 1, 0.3254902, 0, 1,
-1.476274, 0.5707457, -0.2705452, 1, 0.3294118, 0, 1,
-1.474994, 0.08886001, -0.5338531, 1, 0.3372549, 0, 1,
-1.46905, -0.4258114, -0.9354489, 1, 0.3411765, 0, 1,
-1.468849, 1.849185, 0.2987561, 1, 0.3490196, 0, 1,
-1.464723, 0.2072958, -1.056035, 1, 0.3529412, 0, 1,
-1.462155, -0.3141956, -3.973298, 1, 0.3607843, 0, 1,
-1.449315, -0.4805576, -0.9586618, 1, 0.3647059, 0, 1,
-1.447241, 0.2330962, -0.686521, 1, 0.372549, 0, 1,
-1.445244, -0.3470043, -3.423554, 1, 0.3764706, 0, 1,
-1.438569, 0.2040168, -4.331586, 1, 0.3843137, 0, 1,
-1.43787, 1.472112, 0.2684159, 1, 0.3882353, 0, 1,
-1.416735, 1.180765, -0.808436, 1, 0.3960784, 0, 1,
-1.394528, -2.590714, -4.411237, 1, 0.4039216, 0, 1,
-1.391255, -0.801672, -2.749862, 1, 0.4078431, 0, 1,
-1.386319, 0.6892832, 1.465974, 1, 0.4156863, 0, 1,
-1.383348, 0.9521697, -0.5688379, 1, 0.4196078, 0, 1,
-1.371064, 1.065437, -0.2991049, 1, 0.427451, 0, 1,
-1.342463, -0.2329789, -2.321267, 1, 0.4313726, 0, 1,
-1.334005, -0.2228468, -0.9106575, 1, 0.4392157, 0, 1,
-1.316164, -0.4196691, -2.31716, 1, 0.4431373, 0, 1,
-1.315907, -1.759286, -1.308318, 1, 0.4509804, 0, 1,
-1.288461, -0.1662802, -1.864762, 1, 0.454902, 0, 1,
-1.282542, 0.1506884, -1.233583, 1, 0.4627451, 0, 1,
-1.280209, 0.7547252, -0.1902199, 1, 0.4666667, 0, 1,
-1.274143, -0.1966134, -2.223022, 1, 0.4745098, 0, 1,
-1.273963, 0.08069057, -0.2053249, 1, 0.4784314, 0, 1,
-1.273417, -1.083152, -2.980298, 1, 0.4862745, 0, 1,
-1.272179, 0.6391917, -2.183744, 1, 0.4901961, 0, 1,
-1.271063, 0.4325733, -0.9110315, 1, 0.4980392, 0, 1,
-1.270358, 0.2733152, -1.699412, 1, 0.5058824, 0, 1,
-1.266615, -0.5952756, -1.385613, 1, 0.509804, 0, 1,
-1.264565, -0.3905346, -0.5434373, 1, 0.5176471, 0, 1,
-1.261142, -0.01886313, -0.7072559, 1, 0.5215687, 0, 1,
-1.259698, -3.123639, -2.159219, 1, 0.5294118, 0, 1,
-1.259059, 1.0574, -0.4560949, 1, 0.5333334, 0, 1,
-1.256373, -0.9741456, -2.297137, 1, 0.5411765, 0, 1,
-1.246649, -1.218761, -1.764964, 1, 0.5450981, 0, 1,
-1.242693, -0.7622199, -2.535927, 1, 0.5529412, 0, 1,
-1.241933, -0.6730173, -1.456601, 1, 0.5568628, 0, 1,
-1.240528, -0.2245032, -1.608899, 1, 0.5647059, 0, 1,
-1.239979, 0.503415, -2.886575, 1, 0.5686275, 0, 1,
-1.236632, 0.4734324, -1.072067, 1, 0.5764706, 0, 1,
-1.220497, -0.7527843, -3.119148, 1, 0.5803922, 0, 1,
-1.219245, -0.2654215, -1.924721, 1, 0.5882353, 0, 1,
-1.213853, 0.7303652, -0.2260163, 1, 0.5921569, 0, 1,
-1.21244, -0.00831962, 0.09390689, 1, 0.6, 0, 1,
-1.210678, -1.956951, -2.211712, 1, 0.6078432, 0, 1,
-1.209975, 0.08210547, -1.497679, 1, 0.6117647, 0, 1,
-1.198715, 1.60994, -1.642505, 1, 0.6196079, 0, 1,
-1.194285, -1.124636, -2.522305, 1, 0.6235294, 0, 1,
-1.191068, 1.253063, -1.900865, 1, 0.6313726, 0, 1,
-1.177352, 1.246715, 1.189898, 1, 0.6352941, 0, 1,
-1.172265, 1.061633, -1.77859, 1, 0.6431373, 0, 1,
-1.160787, -0.4967562, -3.345869, 1, 0.6470588, 0, 1,
-1.158579, -0.880309, -2.706512, 1, 0.654902, 0, 1,
-1.153718, -0.1910272, -1.820545, 1, 0.6588235, 0, 1,
-1.139144, -0.7895814, -1.918507, 1, 0.6666667, 0, 1,
-1.137639, 1.100774, 0.9934205, 1, 0.6705883, 0, 1,
-1.135602, -1.43888, -1.029266, 1, 0.6784314, 0, 1,
-1.125229, 1.036658, -0.4910346, 1, 0.682353, 0, 1,
-1.119256, -0.5217698, -2.466952, 1, 0.6901961, 0, 1,
-1.102217, -0.4343, -3.141062, 1, 0.6941177, 0, 1,
-1.099445, -0.07927205, -0.1367502, 1, 0.7019608, 0, 1,
-1.093372, -0.6102818, -1.215852, 1, 0.7098039, 0, 1,
-1.093245, 0.4021006, -0.07123793, 1, 0.7137255, 0, 1,
-1.084087, -0.2448612, -0.7714791, 1, 0.7215686, 0, 1,
-1.080656, 0.9746358, 0.2696791, 1, 0.7254902, 0, 1,
-1.080598, -0.7437493, -1.141918, 1, 0.7333333, 0, 1,
-1.077584, -0.1425504, -0.6855177, 1, 0.7372549, 0, 1,
-1.077294, -2.196045, -3.294531, 1, 0.7450981, 0, 1,
-1.071282, -0.9200995, -3.715757, 1, 0.7490196, 0, 1,
-1.061212, 0.6150851, -1.726124, 1, 0.7568628, 0, 1,
-1.060913, -0.9504905, -2.363957, 1, 0.7607843, 0, 1,
-1.055893, -0.4793597, -0.1052481, 1, 0.7686275, 0, 1,
-1.054114, 0.8187632, -2.99649, 1, 0.772549, 0, 1,
-1.05348, 0.4940733, -1.633831, 1, 0.7803922, 0, 1,
-1.037273, -0.05259403, -1.012526, 1, 0.7843137, 0, 1,
-1.027742, 0.6015425, -0.04211889, 1, 0.7921569, 0, 1,
-1.024399, 0.1910285, -1.258807, 1, 0.7960784, 0, 1,
-1.014217, -1.341189, -3.504678, 1, 0.8039216, 0, 1,
-1.011528, 1.409366, 0.01599473, 1, 0.8117647, 0, 1,
-1.002068, 1.599476, 0.6934603, 1, 0.8156863, 0, 1,
-1.000964, 0.8783801, -1.911441, 1, 0.8235294, 0, 1,
-1.000684, -0.1233082, -3.326952, 1, 0.827451, 0, 1,
-0.9975799, 1.797516, -0.3334731, 1, 0.8352941, 0, 1,
-0.995134, 0.7085332, -0.5405377, 1, 0.8392157, 0, 1,
-0.9932997, -1.288038, -2.713321, 1, 0.8470588, 0, 1,
-0.9889088, 0.6822934, 0.2440049, 1, 0.8509804, 0, 1,
-0.9793559, -0.3888156, -1.935089, 1, 0.8588235, 0, 1,
-0.9791508, 1.374648, -1.335717, 1, 0.8627451, 0, 1,
-0.9737979, -0.1704174, -2.145389, 1, 0.8705882, 0, 1,
-0.9704686, 1.068174, -0.8250533, 1, 0.8745098, 0, 1,
-0.9689061, 0.5025446, -1.292994, 1, 0.8823529, 0, 1,
-0.9674886, 0.9904155, 0.3395916, 1, 0.8862745, 0, 1,
-0.9574913, -0.2956764, -0.3439435, 1, 0.8941177, 0, 1,
-0.9507999, -0.6875864, -2.879648, 1, 0.8980392, 0, 1,
-0.9504648, -0.9030027, -3.248236, 1, 0.9058824, 0, 1,
-0.948565, 0.07877322, -2.862129, 1, 0.9137255, 0, 1,
-0.9482518, 1.737424, -1.210002, 1, 0.9176471, 0, 1,
-0.946439, 0.07858548, -2.730106, 1, 0.9254902, 0, 1,
-0.9433964, 1.058173, -0.2813093, 1, 0.9294118, 0, 1,
-0.9413146, -0.8207552, -3.868851, 1, 0.9372549, 0, 1,
-0.9377714, 1.934458, -1.317788, 1, 0.9411765, 0, 1,
-0.9217523, -0.1784481, -3.323554, 1, 0.9490196, 0, 1,
-0.9168941, -0.691019, -0.9093187, 1, 0.9529412, 0, 1,
-0.916234, 0.6564102, -0.8359189, 1, 0.9607843, 0, 1,
-0.9144103, 1.224865, -2.066697, 1, 0.9647059, 0, 1,
-0.8990934, -0.003452393, -1.339207, 1, 0.972549, 0, 1,
-0.8949389, -0.131688, 0.227883, 1, 0.9764706, 0, 1,
-0.8926151, 0.9421276, -1.442102, 1, 0.9843137, 0, 1,
-0.8915617, 0.8550088, 0.1233319, 1, 0.9882353, 0, 1,
-0.8912038, -1.049791, -3.310167, 1, 0.9960784, 0, 1,
-0.8849531, 2.594596, 0.03333589, 0.9960784, 1, 0, 1,
-0.8840203, 1.642433, 0.3411066, 0.9921569, 1, 0, 1,
-0.8793076, 0.1867031, -1.537315, 0.9843137, 1, 0, 1,
-0.8772141, 0.8911095, -0.2098503, 0.9803922, 1, 0, 1,
-0.8717896, 1.47327, -1.827563, 0.972549, 1, 0, 1,
-0.8683394, -1.589946, -3.780725, 0.9686275, 1, 0, 1,
-0.8651478, 0.3296134, -0.3193711, 0.9607843, 1, 0, 1,
-0.8645034, 0.1265709, -1.851628, 0.9568627, 1, 0, 1,
-0.862112, -0.5016517, -1.795062, 0.9490196, 1, 0, 1,
-0.8605487, 1.422769, -1.156412, 0.945098, 1, 0, 1,
-0.8585995, -0.5617693, -3.773415, 0.9372549, 1, 0, 1,
-0.8554489, 0.9067904, -1.285222, 0.9333333, 1, 0, 1,
-0.8543926, -0.692614, -3.608295, 0.9254902, 1, 0, 1,
-0.849879, -0.0809849, -2.073844, 0.9215686, 1, 0, 1,
-0.8461875, -0.4838781, -3.19978, 0.9137255, 1, 0, 1,
-0.8398025, -1.157737, -2.592619, 0.9098039, 1, 0, 1,
-0.8377219, 1.279003, -1.090781, 0.9019608, 1, 0, 1,
-0.829881, 0.2785079, -1.172073, 0.8941177, 1, 0, 1,
-0.8280502, -0.0496306, -2.16294, 0.8901961, 1, 0, 1,
-0.8202757, 0.3633778, -1.019663, 0.8823529, 1, 0, 1,
-0.8202313, -1.154285, -2.512127, 0.8784314, 1, 0, 1,
-0.8159707, 0.7207177, -1.098107, 0.8705882, 1, 0, 1,
-0.8118523, -1.394661, -2.058357, 0.8666667, 1, 0, 1,
-0.8103398, 1.019714, -0.2578943, 0.8588235, 1, 0, 1,
-0.8061337, -0.01775249, -2.309195, 0.854902, 1, 0, 1,
-0.8019159, -1.744459, -3.472585, 0.8470588, 1, 0, 1,
-0.7998628, -1.534473, -1.136357, 0.8431373, 1, 0, 1,
-0.7988697, -0.113672, 0.4620552, 0.8352941, 1, 0, 1,
-0.7947613, 0.4157506, -0.8139228, 0.8313726, 1, 0, 1,
-0.7890642, -0.2676466, -2.569856, 0.8235294, 1, 0, 1,
-0.787938, 1.271375, -0.01878513, 0.8196079, 1, 0, 1,
-0.7878168, 1.443467, 1.288633, 0.8117647, 1, 0, 1,
-0.7839869, 0.5677835, -0.436092, 0.8078431, 1, 0, 1,
-0.7734091, 0.04497043, -1.394076, 0.8, 1, 0, 1,
-0.7714584, 0.9171667, -0.6377932, 0.7921569, 1, 0, 1,
-0.7699697, 0.7835348, -0.9250402, 0.7882353, 1, 0, 1,
-0.7689157, -1.124112, -2.497157, 0.7803922, 1, 0, 1,
-0.7623874, -0.5209693, -1.629834, 0.7764706, 1, 0, 1,
-0.7604175, -1.803766, -2.763349, 0.7686275, 1, 0, 1,
-0.7585847, 1.069209, -0.4374774, 0.7647059, 1, 0, 1,
-0.757324, -0.3535171, -2.75073, 0.7568628, 1, 0, 1,
-0.7504273, 0.6909876, 1.134687, 0.7529412, 1, 0, 1,
-0.7495275, -0.006697496, -0.9792833, 0.7450981, 1, 0, 1,
-0.7422194, -0.6529034, -2.063422, 0.7411765, 1, 0, 1,
-0.7369502, 0.1243548, 0.05184924, 0.7333333, 1, 0, 1,
-0.7363142, -0.3822184, -3.927186, 0.7294118, 1, 0, 1,
-0.732265, 0.9501562, -0.4724365, 0.7215686, 1, 0, 1,
-0.7320008, 0.4387137, -1.155042, 0.7176471, 1, 0, 1,
-0.7315954, -0.5036775, -1.029129, 0.7098039, 1, 0, 1,
-0.7313479, -1.207695, -0.8897455, 0.7058824, 1, 0, 1,
-0.7271539, -0.5430547, -2.040016, 0.6980392, 1, 0, 1,
-0.7250465, -1.137871, -4.327983, 0.6901961, 1, 0, 1,
-0.7145234, 0.4656325, -0.3133956, 0.6862745, 1, 0, 1,
-0.7098999, 0.7004741, -0.6644228, 0.6784314, 1, 0, 1,
-0.7012513, -0.1093981, -2.083247, 0.6745098, 1, 0, 1,
-0.6994017, -1.227852, -1.255542, 0.6666667, 1, 0, 1,
-0.6969548, 0.7737523, -0.2805927, 0.6627451, 1, 0, 1,
-0.6853763, -1.257084, -3.435882, 0.654902, 1, 0, 1,
-0.6831302, 1.203719, -1.076527, 0.6509804, 1, 0, 1,
-0.6803614, 0.9034814, -1.614872, 0.6431373, 1, 0, 1,
-0.6788285, 0.6809825, -1.189728, 0.6392157, 1, 0, 1,
-0.6733355, 0.7625149, 0.7083328, 0.6313726, 1, 0, 1,
-0.6661103, 0.3924536, -1.431969, 0.627451, 1, 0, 1,
-0.6642573, -0.02791397, -0.7888409, 0.6196079, 1, 0, 1,
-0.6609889, -0.7461132, -1.787136, 0.6156863, 1, 0, 1,
-0.6598486, -1.400214, -2.493433, 0.6078432, 1, 0, 1,
-0.6597204, -2.145005, -2.297556, 0.6039216, 1, 0, 1,
-0.6557699, 1.692982, 0.9871755, 0.5960785, 1, 0, 1,
-0.653899, 0.5848314, -1.531458, 0.5882353, 1, 0, 1,
-0.649976, 0.1073138, -2.979993, 0.5843138, 1, 0, 1,
-0.6430987, 0.1664893, -2.498083, 0.5764706, 1, 0, 1,
-0.6416813, -1.392103, -3.043468, 0.572549, 1, 0, 1,
-0.6409244, -0.7136493, -3.37442, 0.5647059, 1, 0, 1,
-0.6407171, 1.157477, -0.3076544, 0.5607843, 1, 0, 1,
-0.6398031, -2.158122, -4.843, 0.5529412, 1, 0, 1,
-0.6387122, 0.4378967, -2.892516, 0.5490196, 1, 0, 1,
-0.633644, -1.318405, -3.092102, 0.5411765, 1, 0, 1,
-0.6261398, 0.471369, -1.236894, 0.5372549, 1, 0, 1,
-0.624195, -0.10392, -0.464098, 0.5294118, 1, 0, 1,
-0.6193257, 1.83711, -0.3797898, 0.5254902, 1, 0, 1,
-0.613033, -0.0317012, 0.102697, 0.5176471, 1, 0, 1,
-0.6115847, 0.1786546, -1.575236, 0.5137255, 1, 0, 1,
-0.6052894, 0.6837486, -1.342641, 0.5058824, 1, 0, 1,
-0.5954463, 0.1460321, -1.845722, 0.5019608, 1, 0, 1,
-0.5927491, -0.82274, -1.795048, 0.4941176, 1, 0, 1,
-0.5890412, -1.419436, -0.9679939, 0.4862745, 1, 0, 1,
-0.5865605, 2.053282, -0.5348344, 0.4823529, 1, 0, 1,
-0.5863452, -0.8387687, -2.104946, 0.4745098, 1, 0, 1,
-0.5839518, -0.2842548, -1.840418, 0.4705882, 1, 0, 1,
-0.5832216, -1.76711, -3.732884, 0.4627451, 1, 0, 1,
-0.5788622, 0.6183853, 0.06423589, 0.4588235, 1, 0, 1,
-0.5785601, 0.601016, -1.030398, 0.4509804, 1, 0, 1,
-0.5749952, -0.5629508, -0.603236, 0.4470588, 1, 0, 1,
-0.5684145, 2.485538, -0.8211868, 0.4392157, 1, 0, 1,
-0.5671899, 0.3293912, -0.956665, 0.4352941, 1, 0, 1,
-0.5669651, 0.9640834, -0.6441765, 0.427451, 1, 0, 1,
-0.5617416, 0.7627428, -0.1101521, 0.4235294, 1, 0, 1,
-0.5617037, -0.208362, -1.005136, 0.4156863, 1, 0, 1,
-0.5502813, 0.7459131, -2.1907, 0.4117647, 1, 0, 1,
-0.5473679, -0.04087591, -1.957621, 0.4039216, 1, 0, 1,
-0.5446404, 1.480527, 0.4728051, 0.3960784, 1, 0, 1,
-0.5382593, -0.9112805, -1.629061, 0.3921569, 1, 0, 1,
-0.5376112, -1.442937, -2.929484, 0.3843137, 1, 0, 1,
-0.5374567, 0.3234433, -1.100605, 0.3803922, 1, 0, 1,
-0.5373345, 1.149646, -0.214043, 0.372549, 1, 0, 1,
-0.5361775, 0.4678603, -1.130245, 0.3686275, 1, 0, 1,
-0.5335379, -0.4010934, -1.444367, 0.3607843, 1, 0, 1,
-0.5326405, 0.7226902, -1.233926, 0.3568628, 1, 0, 1,
-0.5299848, 0.6185604, 0.5033557, 0.3490196, 1, 0, 1,
-0.527787, 0.764941, -0.5969871, 0.345098, 1, 0, 1,
-0.5222222, -0.3452519, -1.725118, 0.3372549, 1, 0, 1,
-0.5212964, -0.9357554, -3.904493, 0.3333333, 1, 0, 1,
-0.519886, -0.9907292, -1.197969, 0.3254902, 1, 0, 1,
-0.5160482, -0.09337951, -2.584594, 0.3215686, 1, 0, 1,
-0.5156436, 0.6159157, -0.9754535, 0.3137255, 1, 0, 1,
-0.5140877, -0.1840907, 0.4632779, 0.3098039, 1, 0, 1,
-0.5128219, -1.540569, -1.764274, 0.3019608, 1, 0, 1,
-0.5112328, 0.1982209, -1.837534, 0.2941177, 1, 0, 1,
-0.5033113, 0.04435619, -1.103906, 0.2901961, 1, 0, 1,
-0.5016447, -1.679568, -2.779874, 0.282353, 1, 0, 1,
-0.4999633, 0.08777656, -2.843894, 0.2784314, 1, 0, 1,
-0.4991656, -0.08903839, -1.596889, 0.2705882, 1, 0, 1,
-0.4936566, 0.8864779, -0.3129757, 0.2666667, 1, 0, 1,
-0.490934, -0.6084234, -2.950172, 0.2588235, 1, 0, 1,
-0.4906444, 1.286461, -1.059428, 0.254902, 1, 0, 1,
-0.4849137, 0.8809596, -1.042884, 0.2470588, 1, 0, 1,
-0.4821188, -1.353652, -2.29218, 0.2431373, 1, 0, 1,
-0.4799475, 0.7010677, -1.119228, 0.2352941, 1, 0, 1,
-0.4711526, -0.2761261, -1.991279, 0.2313726, 1, 0, 1,
-0.4673278, 0.420504, -0.5975731, 0.2235294, 1, 0, 1,
-0.4646406, -0.3812903, -1.402274, 0.2196078, 1, 0, 1,
-0.460264, -1.281239, -2.186447, 0.2117647, 1, 0, 1,
-0.4539614, -1.305094, -3.960676, 0.2078431, 1, 0, 1,
-0.4531616, -0.2596676, -1.678595, 0.2, 1, 0, 1,
-0.4530781, 1.221157, -0.6576008, 0.1921569, 1, 0, 1,
-0.4491743, 0.8327244, 0.8686901, 0.1882353, 1, 0, 1,
-0.4440535, 0.4321772, -1.303005, 0.1803922, 1, 0, 1,
-0.441851, 2.067189, -0.7852784, 0.1764706, 1, 0, 1,
-0.4402529, -1.681426, -2.269526, 0.1686275, 1, 0, 1,
-0.440128, 0.9925272, -0.52524, 0.1647059, 1, 0, 1,
-0.4358324, -0.5460701, -2.445656, 0.1568628, 1, 0, 1,
-0.4318383, 1.810216, 0.111825, 0.1529412, 1, 0, 1,
-0.4308003, 0.3338853, 1.642362, 0.145098, 1, 0, 1,
-0.4261014, 0.3127317, -0.04247689, 0.1411765, 1, 0, 1,
-0.4259369, -1.379976, -3.747375, 0.1333333, 1, 0, 1,
-0.4195449, 0.4945857, -2.824192, 0.1294118, 1, 0, 1,
-0.416027, 0.9700997, -0.3768567, 0.1215686, 1, 0, 1,
-0.4149947, 0.5960041, -0.9297755, 0.1176471, 1, 0, 1,
-0.4142797, 0.9914113, -0.5424217, 0.1098039, 1, 0, 1,
-0.4127727, -1.7896, -3.412209, 0.1058824, 1, 0, 1,
-0.4119806, -3.271891, -3.472112, 0.09803922, 1, 0, 1,
-0.4082772, -1.518865, -0.7876755, 0.09019608, 1, 0, 1,
-0.4070781, -0.8146147, -3.704722, 0.08627451, 1, 0, 1,
-0.4055541, 0.1177587, -0.7022743, 0.07843138, 1, 0, 1,
-0.4052958, -0.5185766, -1.613919, 0.07450981, 1, 0, 1,
-0.4008954, -0.2346894, -1.324582, 0.06666667, 1, 0, 1,
-0.3986168, 1.22371, 0.2214365, 0.0627451, 1, 0, 1,
-0.3944965, 0.7034225, 0.4094505, 0.05490196, 1, 0, 1,
-0.3944751, -0.9677348, -1.90662, 0.05098039, 1, 0, 1,
-0.381501, -2.409868, -4.78571, 0.04313726, 1, 0, 1,
-0.3797151, 0.3990577, 0.367997, 0.03921569, 1, 0, 1,
-0.3770869, -1.901898, -3.402292, 0.03137255, 1, 0, 1,
-0.3647864, 0.3173025, -1.100847, 0.02745098, 1, 0, 1,
-0.3645037, 0.3002626, -0.7593368, 0.01960784, 1, 0, 1,
-0.3601111, 0.1872143, -1.241989, 0.01568628, 1, 0, 1,
-0.3589716, -0.3268714, -2.603775, 0.007843138, 1, 0, 1,
-0.3563084, -0.4544771, -3.771955, 0.003921569, 1, 0, 1,
-0.3541574, -0.6628323, -1.55482, 0, 1, 0.003921569, 1,
-0.3530224, 0.8824819, 0.1221552, 0, 1, 0.01176471, 1,
-0.3505342, -0.8368558, -3.406127, 0, 1, 0.01568628, 1,
-0.3482919, -0.6515285, -3.338669, 0, 1, 0.02352941, 1,
-0.3465087, -0.5450583, -3.961427, 0, 1, 0.02745098, 1,
-0.3460117, 0.2640806, -1.529587, 0, 1, 0.03529412, 1,
-0.3422244, 1.328986, 1.019018, 0, 1, 0.03921569, 1,
-0.3386885, 0.9612136, -2.758573, 0, 1, 0.04705882, 1,
-0.3344041, -0.2988984, -2.580992, 0, 1, 0.05098039, 1,
-0.333015, -1.690447, -3.425309, 0, 1, 0.05882353, 1,
-0.3304468, 1.444869, 1.134857, 0, 1, 0.0627451, 1,
-0.3284998, -0.286728, -2.046022, 0, 1, 0.07058824, 1,
-0.3277351, -0.3126474, -2.761028, 0, 1, 0.07450981, 1,
-0.3268614, 0.4689318, -0.4840939, 0, 1, 0.08235294, 1,
-0.3260236, -0.6779259, -2.33216, 0, 1, 0.08627451, 1,
-0.3246029, 0.7813427, -1.391116, 0, 1, 0.09411765, 1,
-0.3241051, 0.9588287, 1.085233, 0, 1, 0.1019608, 1,
-0.3212668, -0.525183, -1.960895, 0, 1, 0.1058824, 1,
-0.3211423, -0.5517132, -0.977696, 0, 1, 0.1137255, 1,
-0.3165662, 0.9299883, -0.1215109, 0, 1, 0.1176471, 1,
-0.3119196, 0.7806373, -0.7401563, 0, 1, 0.1254902, 1,
-0.3073235, 0.4665273, -1.450166, 0, 1, 0.1294118, 1,
-0.3072746, -0.7228308, -2.535693, 0, 1, 0.1372549, 1,
-0.3027821, 0.167951, -1.448782, 0, 1, 0.1411765, 1,
-0.3022101, 0.7737255, 0.2253176, 0, 1, 0.1490196, 1,
-0.3013392, 0.8299702, -0.3846681, 0, 1, 0.1529412, 1,
-0.2984109, 0.3004056, 0.1230997, 0, 1, 0.1607843, 1,
-0.2959963, 0.08606874, -0.645321, 0, 1, 0.1647059, 1,
-0.2936393, -0.6453705, -4.119771, 0, 1, 0.172549, 1,
-0.2900455, 0.5320023, -1.337595, 0, 1, 0.1764706, 1,
-0.289502, 0.7252886, 0.8290575, 0, 1, 0.1843137, 1,
-0.2892119, 0.8224149, 1.054173, 0, 1, 0.1882353, 1,
-0.2875424, 0.7726473, -0.9201456, 0, 1, 0.1960784, 1,
-0.287118, -0.08726777, -0.3876477, 0, 1, 0.2039216, 1,
-0.2856632, -0.7926696, -3.23957, 0, 1, 0.2078431, 1,
-0.2809249, 0.4785701, 0.4363375, 0, 1, 0.2156863, 1,
-0.2764001, -0.9732404, -3.92011, 0, 1, 0.2196078, 1,
-0.2758735, 0.09985859, -2.859007, 0, 1, 0.227451, 1,
-0.2754869, 2.306485, -1.180958, 0, 1, 0.2313726, 1,
-0.2751384, -1.590351, -3.130392, 0, 1, 0.2392157, 1,
-0.2736956, 1.791035, -0.8207322, 0, 1, 0.2431373, 1,
-0.2725041, -1.373067, -2.442601, 0, 1, 0.2509804, 1,
-0.2707342, 1.891845, 0.03357296, 0, 1, 0.254902, 1,
-0.2701558, 0.6304504, -0.8922505, 0, 1, 0.2627451, 1,
-0.2687069, 0.1530459, -1.626902, 0, 1, 0.2666667, 1,
-0.2645613, 0.03888069, -1.204472, 0, 1, 0.2745098, 1,
-0.2567771, 0.9088143, -0.133923, 0, 1, 0.2784314, 1,
-0.2530526, -2.633069, -2.817872, 0, 1, 0.2862745, 1,
-0.2522408, 0.7391565, 0.714177, 0, 1, 0.2901961, 1,
-0.2517641, -1.063891, -4.193418, 0, 1, 0.2980392, 1,
-0.2449248, 0.1778396, -0.6433416, 0, 1, 0.3058824, 1,
-0.244561, -1.377341, -1.609188, 0, 1, 0.3098039, 1,
-0.243218, -0.7012144, -1.788045, 0, 1, 0.3176471, 1,
-0.2425124, 1.036884, 0.3407296, 0, 1, 0.3215686, 1,
-0.2411369, -0.1950241, -2.40636, 0, 1, 0.3294118, 1,
-0.2409784, 0.2133479, 0.4476977, 0, 1, 0.3333333, 1,
-0.2358683, 1.632007, -0.1720195, 0, 1, 0.3411765, 1,
-0.2347415, -0.1799567, -1.777002, 0, 1, 0.345098, 1,
-0.230425, 0.6729875, -1.288157, 0, 1, 0.3529412, 1,
-0.2287405, 0.5420965, -1.310966, 0, 1, 0.3568628, 1,
-0.2278989, -0.6699601, -1.539749, 0, 1, 0.3647059, 1,
-0.2259701, -0.04767092, -0.5385147, 0, 1, 0.3686275, 1,
-0.2235211, -0.9962516, -2.393624, 0, 1, 0.3764706, 1,
-0.2223807, -1.053271, -4.881665, 0, 1, 0.3803922, 1,
-0.2200818, 1.18082, -0.006693921, 0, 1, 0.3882353, 1,
-0.2182611, -0.7247671, -4.118758, 0, 1, 0.3921569, 1,
-0.2163032, -0.6189448, -3.249532, 0, 1, 0.4, 1,
-0.2159033, 1.730917, -1.647993, 0, 1, 0.4078431, 1,
-0.2101363, -0.8218758, -3.090961, 0, 1, 0.4117647, 1,
-0.2045348, 0.523612, -0.06128758, 0, 1, 0.4196078, 1,
-0.2015368, -0.4147678, -2.399002, 0, 1, 0.4235294, 1,
-0.1996545, 1.060038, -0.4844141, 0, 1, 0.4313726, 1,
-0.1973621, -0.07165661, -2.401796, 0, 1, 0.4352941, 1,
-0.197188, -0.1346119, -1.259033, 0, 1, 0.4431373, 1,
-0.1942913, 0.8629395, 1.268976, 0, 1, 0.4470588, 1,
-0.1940989, 2.074901, 0.9636971, 0, 1, 0.454902, 1,
-0.1907594, 0.1874928, -0.4673604, 0, 1, 0.4588235, 1,
-0.1883027, 1.033511, -0.9731765, 0, 1, 0.4666667, 1,
-0.1865885, -0.3907329, -2.115205, 0, 1, 0.4705882, 1,
-0.1838804, -0.7005266, -2.958673, 0, 1, 0.4784314, 1,
-0.1835535, 0.02890418, -1.236613, 0, 1, 0.4823529, 1,
-0.1818105, 1.723476, -0.151027, 0, 1, 0.4901961, 1,
-0.1765867, -0.2105343, -1.134112, 0, 1, 0.4941176, 1,
-0.1745554, -1.237076, -4.096962, 0, 1, 0.5019608, 1,
-0.1720587, 0.06299653, -2.927758, 0, 1, 0.509804, 1,
-0.1717608, 0.3209166, -0.9332755, 0, 1, 0.5137255, 1,
-0.1688917, 0.02595541, -2.081167, 0, 1, 0.5215687, 1,
-0.1664667, 0.6740438, 0.4642565, 0, 1, 0.5254902, 1,
-0.1656069, 0.111076, -2.068485, 0, 1, 0.5333334, 1,
-0.1648446, -0.9512485, -4.130842, 0, 1, 0.5372549, 1,
-0.1643824, -0.2938011, -0.9267586, 0, 1, 0.5450981, 1,
-0.1638557, -1.289043, -2.356924, 0, 1, 0.5490196, 1,
-0.1632983, 0.8933559, -0.6777685, 0, 1, 0.5568628, 1,
-0.1560872, -0.9223756, -2.799319, 0, 1, 0.5607843, 1,
-0.1514066, 0.1824306, 3.216341, 0, 1, 0.5686275, 1,
-0.1490854, -0.1893165, -1.871886, 0, 1, 0.572549, 1,
-0.1375504, -1.564344, -2.483089, 0, 1, 0.5803922, 1,
-0.1362685, -1.599395, -1.695989, 0, 1, 0.5843138, 1,
-0.1322451, -0.9511556, -1.195137, 0, 1, 0.5921569, 1,
-0.1321864, -1.283535, -0.5167392, 0, 1, 0.5960785, 1,
-0.1308513, 0.3495604, 0.8549442, 0, 1, 0.6039216, 1,
-0.1275072, -1.392199, -4.392856, 0, 1, 0.6117647, 1,
-0.1270627, -0.3713209, -4.238457, 0, 1, 0.6156863, 1,
-0.1254114, -0.8216887, -4.237026, 0, 1, 0.6235294, 1,
-0.1224315, -1.101623, -2.942238, 0, 1, 0.627451, 1,
-0.1219305, 0.312728, -0.591632, 0, 1, 0.6352941, 1,
-0.118056, 0.7401484, -1.731043, 0, 1, 0.6392157, 1,
-0.1158972, 1.916022, 1.242138, 0, 1, 0.6470588, 1,
-0.1149499, -1.510616, -2.28997, 0, 1, 0.6509804, 1,
-0.1107808, 0.7890485, -0.3629771, 0, 1, 0.6588235, 1,
-0.1079021, -0.3811711, -2.142784, 0, 1, 0.6627451, 1,
-0.1069247, 2.241448, -0.4845566, 0, 1, 0.6705883, 1,
-0.1059364, 0.3659639, -0.468139, 0, 1, 0.6745098, 1,
-0.1059313, -0.1682683, -2.241761, 0, 1, 0.682353, 1,
-0.1043921, -0.1526881, -3.4411, 0, 1, 0.6862745, 1,
-0.102591, -0.06568995, -0.4378735, 0, 1, 0.6941177, 1,
-0.09681571, -0.2689963, -5.278988, 0, 1, 0.7019608, 1,
-0.09620472, 3.142039, -0.589851, 0, 1, 0.7058824, 1,
-0.09494395, -0.5684279, -3.359307, 0, 1, 0.7137255, 1,
-0.09180056, -0.5312415, -3.604963, 0, 1, 0.7176471, 1,
-0.08964022, 1.879379, -1.599366, 0, 1, 0.7254902, 1,
-0.0839141, 0.08218219, -2.07583, 0, 1, 0.7294118, 1,
-0.08177286, 0.5557967, -0.1977062, 0, 1, 0.7372549, 1,
-0.07136761, -1.397156, -3.264816, 0, 1, 0.7411765, 1,
-0.07025811, 0.1003195, -1.722253, 0, 1, 0.7490196, 1,
-0.06614928, 1.029516, 0.3379843, 0, 1, 0.7529412, 1,
-0.06598689, 1.581089, -0.7324467, 0, 1, 0.7607843, 1,
-0.06519123, -0.2000549, -1.735366, 0, 1, 0.7647059, 1,
-0.06437428, 0.3434254, 1.023648, 0, 1, 0.772549, 1,
-0.05957594, 0.8832497, -0.4397586, 0, 1, 0.7764706, 1,
-0.05177716, 0.01959676, -2.672031, 0, 1, 0.7843137, 1,
-0.04292516, 0.7862825, -0.07569761, 0, 1, 0.7882353, 1,
-0.04270682, 2.075096, -0.6345171, 0, 1, 0.7960784, 1,
-0.04085681, 1.218062, -1.072812, 0, 1, 0.8039216, 1,
-0.03241243, 0.1358166, -0.3177776, 0, 1, 0.8078431, 1,
-0.03207846, 0.0374385, -0.5925449, 0, 1, 0.8156863, 1,
-0.02324, 1.371127, -1.489661, 0, 1, 0.8196079, 1,
-0.02285598, -0.3119532, -3.552048, 0, 1, 0.827451, 1,
-0.01845139, 2.18696, -0.220663, 0, 1, 0.8313726, 1,
-0.01821912, 0.1913961, 0.2810726, 0, 1, 0.8392157, 1,
-0.01683764, 0.9797746, -0.3503653, 0, 1, 0.8431373, 1,
-0.0141574, -0.4254821, -2.861057, 0, 1, 0.8509804, 1,
-0.01252723, 0.5575195, 0.1759177, 0, 1, 0.854902, 1,
-0.01157519, 0.634586, -1.077126, 0, 1, 0.8627451, 1,
-0.007150003, -1.056934, -2.293024, 0, 1, 0.8666667, 1,
-0.006657487, 0.6122739, -0.01696623, 0, 1, 0.8745098, 1,
-0.005458424, 0.175929, 0.971761, 0, 1, 0.8784314, 1,
0.0005328448, -1.026875, 1.565531, 0, 1, 0.8862745, 1,
0.002096512, -0.8413029, 2.558585, 0, 1, 0.8901961, 1,
0.007813546, 0.5389768, -1.431383, 0, 1, 0.8980392, 1,
0.01285148, -0.393894, 4.266475, 0, 1, 0.9058824, 1,
0.01728335, 1.02195, 0.6450203, 0, 1, 0.9098039, 1,
0.02062418, -0.5443758, 3.661186, 0, 1, 0.9176471, 1,
0.02156762, -1.429577, 3.342505, 0, 1, 0.9215686, 1,
0.0218858, -0.3412378, 1.270453, 0, 1, 0.9294118, 1,
0.02900943, 2.289433, -0.02527128, 0, 1, 0.9333333, 1,
0.03292074, 0.833764, -0.2612448, 0, 1, 0.9411765, 1,
0.03668534, -1.136711, 1.966441, 0, 1, 0.945098, 1,
0.03918435, -0.9825737, 1.806488, 0, 1, 0.9529412, 1,
0.04093565, 1.469569, 0.608915, 0, 1, 0.9568627, 1,
0.04328774, 1.496996, -0.7040156, 0, 1, 0.9647059, 1,
0.04395732, -0.9306108, 2.903349, 0, 1, 0.9686275, 1,
0.04811629, -0.202852, 2.271119, 0, 1, 0.9764706, 1,
0.04892434, -1.571641, 4.67429, 0, 1, 0.9803922, 1,
0.05590675, -0.2010046, 2.725237, 0, 1, 0.9882353, 1,
0.05665519, 0.3088303, 0.4677874, 0, 1, 0.9921569, 1,
0.05681788, 0.3554337, -0.1243771, 0, 1, 1, 1,
0.05717403, 0.6134916, -1.894098, 0, 0.9921569, 1, 1,
0.05725086, 1.57819, 0.7828078, 0, 0.9882353, 1, 1,
0.06313365, -0.2769949, 2.232043, 0, 0.9803922, 1, 1,
0.06336237, 0.3336781, -0.1227641, 0, 0.9764706, 1, 1,
0.06365727, 0.9023318, 0.1572435, 0, 0.9686275, 1, 1,
0.06842937, -1.122091, 1.831511, 0, 0.9647059, 1, 1,
0.06857465, 0.7307026, 1.760469, 0, 0.9568627, 1, 1,
0.07045539, 1.568936, -1.054966, 0, 0.9529412, 1, 1,
0.07499911, -1.288523, 2.244371, 0, 0.945098, 1, 1,
0.07809171, -0.009626104, 2.95786, 0, 0.9411765, 1, 1,
0.07927136, 0.4657526, 0.03296453, 0, 0.9333333, 1, 1,
0.07951608, 0.578485, 0.7180971, 0, 0.9294118, 1, 1,
0.0799001, -0.6348975, 2.935462, 0, 0.9215686, 1, 1,
0.08068014, -0.9161607, 4.362656, 0, 0.9176471, 1, 1,
0.08131777, -1.108917, 0.7730306, 0, 0.9098039, 1, 1,
0.08384287, 0.5211482, 0.7845186, 0, 0.9058824, 1, 1,
0.08457307, 1.462736, 2.140421, 0, 0.8980392, 1, 1,
0.08679958, 0.4481873, -0.7269284, 0, 0.8901961, 1, 1,
0.08692583, -1.2806, 2.716572, 0, 0.8862745, 1, 1,
0.08880956, 1.447157, -0.6532775, 0, 0.8784314, 1, 1,
0.09133067, -1.223101, 2.019948, 0, 0.8745098, 1, 1,
0.09202702, -1.445773, 3.539467, 0, 0.8666667, 1, 1,
0.09321033, -0.65289, 2.17377, 0, 0.8627451, 1, 1,
0.09348799, -1.904851, 3.240338, 0, 0.854902, 1, 1,
0.1010285, 1.96514, 1.356441, 0, 0.8509804, 1, 1,
0.1015265, -0.4718193, 1.469217, 0, 0.8431373, 1, 1,
0.1023441, 2.862437, 1.440926, 0, 0.8392157, 1, 1,
0.1035603, -0.4796599, 1.886959, 0, 0.8313726, 1, 1,
0.1044225, -0.5603031, 3.011271, 0, 0.827451, 1, 1,
0.1048302, -2.453508, 2.670008, 0, 0.8196079, 1, 1,
0.1057845, -0.3610481, 4.604926, 0, 0.8156863, 1, 1,
0.1070518, 0.05907637, 1.406151, 0, 0.8078431, 1, 1,
0.1166293, -0.597663, 1.888052, 0, 0.8039216, 1, 1,
0.1169395, -2.608427, 3.537694, 0, 0.7960784, 1, 1,
0.1175957, 0.6407558, 2.265479, 0, 0.7882353, 1, 1,
0.1198974, -0.1293834, 3.501088, 0, 0.7843137, 1, 1,
0.1199573, -0.4019942, 2.603193, 0, 0.7764706, 1, 1,
0.1230467, 1.353954, -1.813153, 0, 0.772549, 1, 1,
0.1251067, -0.02403078, 1.094464, 0, 0.7647059, 1, 1,
0.1254512, -0.8092765, 2.845576, 0, 0.7607843, 1, 1,
0.1295833, 0.9865674, 0.2648864, 0, 0.7529412, 1, 1,
0.130267, 0.7490039, 0.3605682, 0, 0.7490196, 1, 1,
0.1352681, 0.6927213, 0.3354155, 0, 0.7411765, 1, 1,
0.138483, -2.036978, 5.197001, 0, 0.7372549, 1, 1,
0.1389948, 0.4684374, 1.546305, 0, 0.7294118, 1, 1,
0.1483682, 0.6482975, -0.7368287, 0, 0.7254902, 1, 1,
0.1524711, 1.457651, 1.671547, 0, 0.7176471, 1, 1,
0.1528927, -0.1271959, 2.643936, 0, 0.7137255, 1, 1,
0.1530087, 0.9706777, -0.3733962, 0, 0.7058824, 1, 1,
0.1530778, 0.2067967, 0.6311693, 0, 0.6980392, 1, 1,
0.1532742, -0.08642706, 2.889401, 0, 0.6941177, 1, 1,
0.1623166, 0.3462796, 0.8593493, 0, 0.6862745, 1, 1,
0.1654765, -1.538042, 3.043622, 0, 0.682353, 1, 1,
0.1687628, -0.3462979, 2.8146, 0, 0.6745098, 1, 1,
0.1723238, -0.1677392, 1.452559, 0, 0.6705883, 1, 1,
0.1726032, -0.4542368, 2.339088, 0, 0.6627451, 1, 1,
0.1773744, 2.109078, 1.156764, 0, 0.6588235, 1, 1,
0.1814684, -1.485923, 3.389241, 0, 0.6509804, 1, 1,
0.1818245, 2.977164, 0.5615745, 0, 0.6470588, 1, 1,
0.1820172, 1.902032, 0.3123523, 0, 0.6392157, 1, 1,
0.1831533, -0.8261898, 2.291152, 0, 0.6352941, 1, 1,
0.1843096, 1.177147, -0.2100349, 0, 0.627451, 1, 1,
0.1921607, 0.4374274, 1.510994, 0, 0.6235294, 1, 1,
0.1953905, 1.015541, -0.7818308, 0, 0.6156863, 1, 1,
0.1971676, -0.470068, 2.779393, 0, 0.6117647, 1, 1,
0.2002928, 0.2957854, 0.9779856, 0, 0.6039216, 1, 1,
0.2029, 0.7853543, -0.6817095, 0, 0.5960785, 1, 1,
0.2071305, 0.1907115, 0.8315009, 0, 0.5921569, 1, 1,
0.2080817, 0.7226045, 0.9294318, 0, 0.5843138, 1, 1,
0.208559, 0.4489028, 0.09554098, 0, 0.5803922, 1, 1,
0.2130887, -1.260605, 3.878048, 0, 0.572549, 1, 1,
0.2157684, 0.8719687, -0.2051479, 0, 0.5686275, 1, 1,
0.2211111, -0.4101506, 1.946693, 0, 0.5607843, 1, 1,
0.2226049, 0.427285, 0.5034765, 0, 0.5568628, 1, 1,
0.2241153, 0.8722134, 1.766654, 0, 0.5490196, 1, 1,
0.2243274, -0.1714584, 2.684722, 0, 0.5450981, 1, 1,
0.2294765, 0.06784053, 1.601954, 0, 0.5372549, 1, 1,
0.233072, 0.2312119, -0.7661643, 0, 0.5333334, 1, 1,
0.2418761, -0.02516384, 2.209127, 0, 0.5254902, 1, 1,
0.2426742, -0.4803693, 2.976959, 0, 0.5215687, 1, 1,
0.2448347, -0.3875618, 2.328598, 0, 0.5137255, 1, 1,
0.2479199, -1.50273, 2.078836, 0, 0.509804, 1, 1,
0.2538904, -0.2075483, 3.329861, 0, 0.5019608, 1, 1,
0.2548797, 0.03596695, 0.2122063, 0, 0.4941176, 1, 1,
0.2549456, -1.026985, 5.398971, 0, 0.4901961, 1, 1,
0.2561625, -0.607092, 2.542434, 0, 0.4823529, 1, 1,
0.2611876, 0.4249419, -0.5404387, 0, 0.4784314, 1, 1,
0.2612541, 0.2327221, -0.8175908, 0, 0.4705882, 1, 1,
0.2650925, -0.8055912, 2.108446, 0, 0.4666667, 1, 1,
0.2684174, 0.3574846, -0.9137564, 0, 0.4588235, 1, 1,
0.2693939, 0.4527906, 1.769145, 0, 0.454902, 1, 1,
0.2706901, 0.4653823, -0.2850968, 0, 0.4470588, 1, 1,
0.2729965, -0.7490517, 3.417688, 0, 0.4431373, 1, 1,
0.2730762, -1.295286, 3.164414, 0, 0.4352941, 1, 1,
0.274682, 0.5569249, 0.3153628, 0, 0.4313726, 1, 1,
0.2750752, -0.5168283, 1.763995, 0, 0.4235294, 1, 1,
0.2790233, -0.09205214, 2.890906, 0, 0.4196078, 1, 1,
0.2791317, -0.9569803, 1.664171, 0, 0.4117647, 1, 1,
0.2860509, 0.8057217, 1.53591, 0, 0.4078431, 1, 1,
0.290225, -1.200065, 1.632194, 0, 0.4, 1, 1,
0.2948059, -0.6454163, 2.189475, 0, 0.3921569, 1, 1,
0.2950771, -0.3854271, 1.801553, 0, 0.3882353, 1, 1,
0.2976416, -0.447116, 1.945031, 0, 0.3803922, 1, 1,
0.2978486, 0.1694248, 0.2468034, 0, 0.3764706, 1, 1,
0.3026406, 0.2979454, 0.8635821, 0, 0.3686275, 1, 1,
0.3041325, 0.6754437, -0.2957477, 0, 0.3647059, 1, 1,
0.3088403, -1.422737, 4.173461, 0, 0.3568628, 1, 1,
0.3088548, -0.6727607, 3.258098, 0, 0.3529412, 1, 1,
0.3150504, 1.271999, 1.284162, 0, 0.345098, 1, 1,
0.317377, -0.007232973, -0.02346597, 0, 0.3411765, 1, 1,
0.3229662, -0.6641143, 3.153677, 0, 0.3333333, 1, 1,
0.3255139, -0.1198729, 1.711534, 0, 0.3294118, 1, 1,
0.3261522, 0.9684784, 0.1443771, 0, 0.3215686, 1, 1,
0.3272273, 0.7021276, -1.716177, 0, 0.3176471, 1, 1,
0.3275122, 0.7476221, 1.38931, 0, 0.3098039, 1, 1,
0.329078, -1.182563, 3.628205, 0, 0.3058824, 1, 1,
0.3292958, -1.381756, 4.561806, 0, 0.2980392, 1, 1,
0.3320637, 0.5507212, 1.736564, 0, 0.2901961, 1, 1,
0.3343506, -0.6764818, 4.153391, 0, 0.2862745, 1, 1,
0.3344324, 0.2510909, -0.3148892, 0, 0.2784314, 1, 1,
0.33512, -0.745605, 2.815999, 0, 0.2745098, 1, 1,
0.3378301, -0.6759253, 3.614166, 0, 0.2666667, 1, 1,
0.3391047, -0.2416497, 3.356547, 0, 0.2627451, 1, 1,
0.3467782, 0.1199017, 2.581628, 0, 0.254902, 1, 1,
0.355011, 0.5596598, 0.02898258, 0, 0.2509804, 1, 1,
0.3585035, 0.2848429, 0.01489666, 0, 0.2431373, 1, 1,
0.3642589, -0.5756891, 2.723669, 0, 0.2392157, 1, 1,
0.3659369, -0.5729649, 2.845055, 0, 0.2313726, 1, 1,
0.3769985, 0.07669083, 3.668186, 0, 0.227451, 1, 1,
0.3777621, 0.5474682, -0.1564488, 0, 0.2196078, 1, 1,
0.3810984, 0.5394334, 0.8168088, 0, 0.2156863, 1, 1,
0.3853386, 0.739902, 1.093705, 0, 0.2078431, 1, 1,
0.3863079, 1.208857, 0.8444725, 0, 0.2039216, 1, 1,
0.3864502, -1.824016, 2.354237, 0, 0.1960784, 1, 1,
0.3865379, -1.125313, 4.370858, 0, 0.1882353, 1, 1,
0.3932592, -0.4535477, 2.731733, 0, 0.1843137, 1, 1,
0.3948166, -2.408397, 1.438156, 0, 0.1764706, 1, 1,
0.3950656, 0.928978, 0.7483525, 0, 0.172549, 1, 1,
0.4012142, 0.06065864, 2.348911, 0, 0.1647059, 1, 1,
0.4034612, -0.1899203, 1.650971, 0, 0.1607843, 1, 1,
0.4046666, -1.658638, 1.023499, 0, 0.1529412, 1, 1,
0.4101506, -0.7092568, 3.478018, 0, 0.1490196, 1, 1,
0.4117858, -0.1835815, 0.9253174, 0, 0.1411765, 1, 1,
0.4142837, -0.31082, 2.64752, 0, 0.1372549, 1, 1,
0.4157536, -0.9139382, 4.111388, 0, 0.1294118, 1, 1,
0.4192837, 2.83739, 0.6503733, 0, 0.1254902, 1, 1,
0.4277804, 1.349888, 2.339761, 0, 0.1176471, 1, 1,
0.4375066, 0.8820527, -0.8870085, 0, 0.1137255, 1, 1,
0.4379533, -0.4565238, 3.119778, 0, 0.1058824, 1, 1,
0.4448134, -0.6901162, 1.699631, 0, 0.09803922, 1, 1,
0.4489187, -0.7718837, 1.711536, 0, 0.09411765, 1, 1,
0.4495088, -0.6034737, 2.897045, 0, 0.08627451, 1, 1,
0.4500974, 0.4453095, 1.383121, 0, 0.08235294, 1, 1,
0.4504578, 0.4449018, 1.455847, 0, 0.07450981, 1, 1,
0.4515446, 2.483732, 1.565503, 0, 0.07058824, 1, 1,
0.4526331, 0.17052, 2.90851, 0, 0.0627451, 1, 1,
0.4564187, -0.6583441, 2.939593, 0, 0.05882353, 1, 1,
0.4572405, 0.1725573, 2.190738, 0, 0.05098039, 1, 1,
0.4586127, -0.5325868, 1.68309, 0, 0.04705882, 1, 1,
0.4607853, 0.5998379, 0.00806844, 0, 0.03921569, 1, 1,
0.4656198, -0.6775521, 1.551768, 0, 0.03529412, 1, 1,
0.4668516, -0.3095716, 1.732706, 0, 0.02745098, 1, 1,
0.4675734, -0.8989324, 2.079589, 0, 0.02352941, 1, 1,
0.4709264, -1.436118, 2.632599, 0, 0.01568628, 1, 1,
0.4735602, -0.9238518, 1.433194, 0, 0.01176471, 1, 1,
0.4740024, -1.635714, 2.968303, 0, 0.003921569, 1, 1,
0.4743484, -0.6112336, 1.432487, 0.003921569, 0, 1, 1,
0.4791473, 0.5008067, 0.2858731, 0.007843138, 0, 1, 1,
0.4857717, 1.265384, 1.024295, 0.01568628, 0, 1, 1,
0.4864832, -0.352367, 2.499962, 0.01960784, 0, 1, 1,
0.4879183, -0.2729994, 0.9142584, 0.02745098, 0, 1, 1,
0.4892322, -0.3251614, 3.506645, 0.03137255, 0, 1, 1,
0.4907773, 0.04472788, 0.6602375, 0.03921569, 0, 1, 1,
0.4989457, 0.3017243, 0.02577956, 0.04313726, 0, 1, 1,
0.5012594, 0.6313101, -0.09455179, 0.05098039, 0, 1, 1,
0.5021461, 0.3674971, 1.033971, 0.05490196, 0, 1, 1,
0.503086, 0.585648, 0.8840488, 0.0627451, 0, 1, 1,
0.5034362, 1.238979, -0.2590642, 0.06666667, 0, 1, 1,
0.5045683, 0.3152418, 1.79257, 0.07450981, 0, 1, 1,
0.5052062, -0.1959774, 1.935811, 0.07843138, 0, 1, 1,
0.5081426, -0.3814739, 3.067463, 0.08627451, 0, 1, 1,
0.5103498, -0.8139346, 2.895983, 0.09019608, 0, 1, 1,
0.5181118, -1.538835, 3.827946, 0.09803922, 0, 1, 1,
0.5234273, -0.2051123, 0.9153284, 0.1058824, 0, 1, 1,
0.525088, 0.1447414, 1.951103, 0.1098039, 0, 1, 1,
0.5274031, 0.7815554, 0.6843696, 0.1176471, 0, 1, 1,
0.527521, -1.2681, 3.276429, 0.1215686, 0, 1, 1,
0.5292177, 0.02884644, 0.9791155, 0.1294118, 0, 1, 1,
0.5299798, -0.1119071, 2.994872, 0.1333333, 0, 1, 1,
0.5335749, -1.077195, 3.419212, 0.1411765, 0, 1, 1,
0.5364141, 0.3194443, 1.060513, 0.145098, 0, 1, 1,
0.5386039, 1.281678, -1.523668, 0.1529412, 0, 1, 1,
0.5401365, 1.456822, -0.6825719, 0.1568628, 0, 1, 1,
0.541659, 1.746955, 2.450805, 0.1647059, 0, 1, 1,
0.5448487, -0.3968155, 3.920491, 0.1686275, 0, 1, 1,
0.556577, 0.4594668, 1.41222, 0.1764706, 0, 1, 1,
0.5568864, -1.341636, 1.732597, 0.1803922, 0, 1, 1,
0.5599648, -0.7471631, 3.185866, 0.1882353, 0, 1, 1,
0.5660283, -0.04624522, 2.521784, 0.1921569, 0, 1, 1,
0.5668627, 1.43454, 0.1636971, 0.2, 0, 1, 1,
0.5693158, 0.61725, 1.237199, 0.2078431, 0, 1, 1,
0.569416, 0.05156566, 2.687808, 0.2117647, 0, 1, 1,
0.5840632, -0.9026977, 4.070419, 0.2196078, 0, 1, 1,
0.5870392, -2.108783, 1.871935, 0.2235294, 0, 1, 1,
0.5929701, -0.3119711, 2.449057, 0.2313726, 0, 1, 1,
0.5976157, -0.3455859, 1.174278, 0.2352941, 0, 1, 1,
0.6014074, 0.2875902, 0.9298918, 0.2431373, 0, 1, 1,
0.6041003, -2.035935, 2.865159, 0.2470588, 0, 1, 1,
0.6050144, 0.349508, 0.8365834, 0.254902, 0, 1, 1,
0.6115428, 0.5890426, -0.04275535, 0.2588235, 0, 1, 1,
0.6150945, 1.289208, -0.645714, 0.2666667, 0, 1, 1,
0.6164223, 1.245844, 1.198442, 0.2705882, 0, 1, 1,
0.6203179, 1.424394, 1.304227, 0.2784314, 0, 1, 1,
0.6208646, -0.9694957, 1.868424, 0.282353, 0, 1, 1,
0.6252212, -0.2327995, 1.778401, 0.2901961, 0, 1, 1,
0.6343986, 0.3337055, 0.230643, 0.2941177, 0, 1, 1,
0.6368497, -1.232219, 2.554143, 0.3019608, 0, 1, 1,
0.6428794, -2.785009, 2.096884, 0.3098039, 0, 1, 1,
0.6446411, 2.340636, 1.445764, 0.3137255, 0, 1, 1,
0.6456151, -0.07688301, 0.4318242, 0.3215686, 0, 1, 1,
0.6469596, -0.6622334, 3.639893, 0.3254902, 0, 1, 1,
0.6527589, 0.2073486, 1.453059, 0.3333333, 0, 1, 1,
0.654399, -0.4593721, 3.99887, 0.3372549, 0, 1, 1,
0.6555315, -1.390549, 2.435903, 0.345098, 0, 1, 1,
0.6563985, -1.338391, 3.851888, 0.3490196, 0, 1, 1,
0.6578621, 0.5030763, -0.6477242, 0.3568628, 0, 1, 1,
0.6583368, 0.9614958, 0.947566, 0.3607843, 0, 1, 1,
0.6599467, 0.339568, 1.578072, 0.3686275, 0, 1, 1,
0.6661607, 0.988264, 0.6008119, 0.372549, 0, 1, 1,
0.6679555, -1.808397, 3.133249, 0.3803922, 0, 1, 1,
0.6718043, 0.3431635, -0.6375504, 0.3843137, 0, 1, 1,
0.6744351, -1.196503, 2.704405, 0.3921569, 0, 1, 1,
0.6771109, 1.594693, 0.407298, 0.3960784, 0, 1, 1,
0.6772626, 1.707542, 0.6967506, 0.4039216, 0, 1, 1,
0.678925, 0.6716582, -0.5901954, 0.4117647, 0, 1, 1,
0.6844098, -1.66939, 4.03848, 0.4156863, 0, 1, 1,
0.6868785, -0.2218857, 2.059756, 0.4235294, 0, 1, 1,
0.6885098, -0.8392748, 2.556802, 0.427451, 0, 1, 1,
0.6886055, 0.1829105, 1.701783, 0.4352941, 0, 1, 1,
0.6894415, -0.1982002, 0.9627562, 0.4392157, 0, 1, 1,
0.692263, 0.8753518, 0.9418107, 0.4470588, 0, 1, 1,
0.6926137, -0.02094855, -0.05098169, 0.4509804, 0, 1, 1,
0.6964201, -0.2056574, 2.796975, 0.4588235, 0, 1, 1,
0.701683, 0.6261293, 1.526272, 0.4627451, 0, 1, 1,
0.7032207, -0.1530453, 3.99607, 0.4705882, 0, 1, 1,
0.7087452, -0.5396938, 2.473001, 0.4745098, 0, 1, 1,
0.7120553, 0.02945169, -1.14179, 0.4823529, 0, 1, 1,
0.7128522, 1.198343, 2.038646, 0.4862745, 0, 1, 1,
0.7244866, -0.6037868, 2.921355, 0.4941176, 0, 1, 1,
0.7266992, 0.4308776, 0.5356436, 0.5019608, 0, 1, 1,
0.7305122, -1.620557, 4.447694, 0.5058824, 0, 1, 1,
0.738568, 1.339635, 0.7407892, 0.5137255, 0, 1, 1,
0.7386065, -1.894697, 1.97786, 0.5176471, 0, 1, 1,
0.7409089, -0.6768491, 2.163872, 0.5254902, 0, 1, 1,
0.7435959, -0.1348033, 2.594795, 0.5294118, 0, 1, 1,
0.7446781, 1.344938, 0.7918698, 0.5372549, 0, 1, 1,
0.7449133, -0.1250543, 0.172488, 0.5411765, 0, 1, 1,
0.7489172, 0.238454, 1.410713, 0.5490196, 0, 1, 1,
0.7595271, -0.144275, 1.942796, 0.5529412, 0, 1, 1,
0.7618199, -0.6619201, 2.933005, 0.5607843, 0, 1, 1,
0.7639785, -0.3911904, 2.521621, 0.5647059, 0, 1, 1,
0.768452, 0.3365821, 0.2238142, 0.572549, 0, 1, 1,
0.7685949, 0.6876645, 0.7709942, 0.5764706, 0, 1, 1,
0.7687017, 1.269404, 0.1033845, 0.5843138, 0, 1, 1,
0.769482, 2.524646, 0.1627221, 0.5882353, 0, 1, 1,
0.7783996, 1.067575, 2.19335, 0.5960785, 0, 1, 1,
0.783968, 0.8273613, -0.2600127, 0.6039216, 0, 1, 1,
0.7842214, 0.2983859, 0.1374433, 0.6078432, 0, 1, 1,
0.78495, -0.4946737, 0.447056, 0.6156863, 0, 1, 1,
0.7871353, -2.01404, 2.091147, 0.6196079, 0, 1, 1,
0.7887844, 0.1389649, 0.07710238, 0.627451, 0, 1, 1,
0.7912269, 0.5059994, 1.50329, 0.6313726, 0, 1, 1,
0.7930652, -1.717126, 2.672039, 0.6392157, 0, 1, 1,
0.7959602, -0.06811298, 1.262118, 0.6431373, 0, 1, 1,
0.7974553, 0.7927211, -0.3923483, 0.6509804, 0, 1, 1,
0.8065677, -1.23379, 3.525863, 0.654902, 0, 1, 1,
0.8074502, 0.5459755, 1.199588, 0.6627451, 0, 1, 1,
0.8092659, -0.8182247, 3.291964, 0.6666667, 0, 1, 1,
0.8102733, 0.7036256, 0.4305968, 0.6745098, 0, 1, 1,
0.8126781, 0.6379182, 1.577644, 0.6784314, 0, 1, 1,
0.8131281, -1.046112, 2.569177, 0.6862745, 0, 1, 1,
0.8159692, 0.7983326, 2.217246, 0.6901961, 0, 1, 1,
0.8210813, 0.08836918, 0.9764313, 0.6980392, 0, 1, 1,
0.8221538, -0.4194705, 0.7986222, 0.7058824, 0, 1, 1,
0.8239115, -0.056371, 0.6262941, 0.7098039, 0, 1, 1,
0.8267516, -0.3091502, 1.824765, 0.7176471, 0, 1, 1,
0.829379, 1.748223, 0.7587922, 0.7215686, 0, 1, 1,
0.8298113, -0.6251836, 1.363063, 0.7294118, 0, 1, 1,
0.8338207, 1.885439, 1.225711, 0.7333333, 0, 1, 1,
0.8414105, -0.05526621, 2.502832, 0.7411765, 0, 1, 1,
0.8432164, 0.8859326, 0.117572, 0.7450981, 0, 1, 1,
0.8472109, -1.145649, 3.425598, 0.7529412, 0, 1, 1,
0.8494155, 0.5717715, 2.129875, 0.7568628, 0, 1, 1,
0.8507096, -0.7698699, 1.362015, 0.7647059, 0, 1, 1,
0.8514566, 1.704247, 1.863056, 0.7686275, 0, 1, 1,
0.8587888, 0.1762765, 1.975457, 0.7764706, 0, 1, 1,
0.8612569, 0.4420904, 1.172596, 0.7803922, 0, 1, 1,
0.8617967, 0.3994625, 2.114823, 0.7882353, 0, 1, 1,
0.8640125, -1.566684, 4.766317, 0.7921569, 0, 1, 1,
0.8750774, -0.7856078, 3.596952, 0.8, 0, 1, 1,
0.8844097, -1.744794, 2.135171, 0.8078431, 0, 1, 1,
0.887189, -0.2985098, 1.777463, 0.8117647, 0, 1, 1,
0.8994516, -2.130482, 1.14862, 0.8196079, 0, 1, 1,
0.901311, 2.004371, 0.01330742, 0.8235294, 0, 1, 1,
0.9058222, 1.057115, -0.2149783, 0.8313726, 0, 1, 1,
0.9120962, -0.9841666, 2.923311, 0.8352941, 0, 1, 1,
0.9134347, -0.3761408, 1.709682, 0.8431373, 0, 1, 1,
0.9165519, -0.3761219, 1.492641, 0.8470588, 0, 1, 1,
0.9171836, 1.001628, 1.151721, 0.854902, 0, 1, 1,
0.9180719, 0.2314682, 1.93136, 0.8588235, 0, 1, 1,
0.9184107, 0.8383447, 0.6733985, 0.8666667, 0, 1, 1,
0.9208118, 0.5938413, -0.2592572, 0.8705882, 0, 1, 1,
0.9242533, 0.9915448, 0.1520949, 0.8784314, 0, 1, 1,
0.9314612, -0.6453069, 3.935198, 0.8823529, 0, 1, 1,
0.9320467, 0.3720382, 0.8929301, 0.8901961, 0, 1, 1,
0.9524642, 0.4968563, 2.018798, 0.8941177, 0, 1, 1,
0.9571625, 0.3907427, 1.314108, 0.9019608, 0, 1, 1,
0.9604933, 0.3175854, 3.222815, 0.9098039, 0, 1, 1,
0.9711751, -0.8886027, 3.030959, 0.9137255, 0, 1, 1,
0.9737077, 0.7726467, 0.02825058, 0.9215686, 0, 1, 1,
0.9880618, 0.3150368, 0.8874407, 0.9254902, 0, 1, 1,
0.9944699, -0.9509, 3.618726, 0.9333333, 0, 1, 1,
0.9956594, -0.5139796, 1.83064, 0.9372549, 0, 1, 1,
0.9962485, -0.5673449, 1.973923, 0.945098, 0, 1, 1,
1.014592, -0.1935057, 0.6647467, 0.9490196, 0, 1, 1,
1.01729, -0.4172736, 0.3210192, 0.9568627, 0, 1, 1,
1.018685, 1.013654, 3.196526, 0.9607843, 0, 1, 1,
1.021219, -0.2164304, 0.878445, 0.9686275, 0, 1, 1,
1.02906, 0.9686756, 0.5964634, 0.972549, 0, 1, 1,
1.034868, 1.263774, 0.7216291, 0.9803922, 0, 1, 1,
1.043901, -0.4250255, 4.20296, 0.9843137, 0, 1, 1,
1.048362, 0.8638836, 0.9385926, 0.9921569, 0, 1, 1,
1.051371, -1.306069, 1.666522, 0.9960784, 0, 1, 1,
1.052133, -0.3418707, 3.285369, 1, 0, 0.9960784, 1,
1.053864, -1.182738, 2.469846, 1, 0, 0.9882353, 1,
1.056597, 1.102335, 0.2439865, 1, 0, 0.9843137, 1,
1.056815, 0.173664, 2.758521, 1, 0, 0.9764706, 1,
1.070166, 0.6367951, 0.5262787, 1, 0, 0.972549, 1,
1.079579, -0.2444533, 2.023987, 1, 0, 0.9647059, 1,
1.081564, 0.7638059, 0.2619872, 1, 0, 0.9607843, 1,
1.083979, 0.6750947, 0.03737459, 1, 0, 0.9529412, 1,
1.084705, -0.3125124, 2.76106, 1, 0, 0.9490196, 1,
1.087299, 0.8048277, 2.379255, 1, 0, 0.9411765, 1,
1.087778, 0.08457696, 0.9287168, 1, 0, 0.9372549, 1,
1.088421, 0.7929531, 1.265336, 1, 0, 0.9294118, 1,
1.089059, -1.22324, 2.858893, 1, 0, 0.9254902, 1,
1.089795, 0.1903532, 1.529571, 1, 0, 0.9176471, 1,
1.092333, 0.007060539, 1.711487, 1, 0, 0.9137255, 1,
1.098229, 1.181616, 0.2663353, 1, 0, 0.9058824, 1,
1.10313, -0.9769016, 1.728309, 1, 0, 0.9019608, 1,
1.117912, -0.3421577, 2.149807, 1, 0, 0.8941177, 1,
1.123424, -0.6625963, 1.90627, 1, 0, 0.8862745, 1,
1.128563, -1.796412, 3.267582, 1, 0, 0.8823529, 1,
1.128916, -0.8076326, 1.1621, 1, 0, 0.8745098, 1,
1.138021, -0.2833051, 0.007791887, 1, 0, 0.8705882, 1,
1.153786, 1.705092, 1.09458, 1, 0, 0.8627451, 1,
1.15912, -0.02137903, 0.7872168, 1, 0, 0.8588235, 1,
1.164472, -0.9579681, 0.8550513, 1, 0, 0.8509804, 1,
1.170542, 0.1622361, 1.988429, 1, 0, 0.8470588, 1,
1.170844, 0.9440644, 2.027408, 1, 0, 0.8392157, 1,
1.172027, 0.2860213, 0.8536332, 1, 0, 0.8352941, 1,
1.172714, -2.19126, 3.103709, 1, 0, 0.827451, 1,
1.17465, -0.6635948, 1.580871, 1, 0, 0.8235294, 1,
1.177031, 0.8094059, 0.9145753, 1, 0, 0.8156863, 1,
1.185451, 1.904822, 1.140165, 1, 0, 0.8117647, 1,
1.192672, 1.503409, 1.799198, 1, 0, 0.8039216, 1,
1.20259, 0.08484324, 1.123002, 1, 0, 0.7960784, 1,
1.21233, -0.5116913, 1.272236, 1, 0, 0.7921569, 1,
1.216551, -1.489774, 1.241833, 1, 0, 0.7843137, 1,
1.220047, -1.358344, 0.1324847, 1, 0, 0.7803922, 1,
1.220356, -1.480692, 1.093758, 1, 0, 0.772549, 1,
1.222166, -0.752696, 3.404031, 1, 0, 0.7686275, 1,
1.229675, -0.5614685, 3.754114, 1, 0, 0.7607843, 1,
1.233978, -0.5715855, 0.8965645, 1, 0, 0.7568628, 1,
1.234468, -0.3677597, 0.3673012, 1, 0, 0.7490196, 1,
1.242192, 1.350793, 0.7194707, 1, 0, 0.7450981, 1,
1.246493, -1.188235, 3.24543, 1, 0, 0.7372549, 1,
1.247255, -0.8240488, 1.278126, 1, 0, 0.7333333, 1,
1.248628, 0.211268, 2.446726, 1, 0, 0.7254902, 1,
1.249228, 0.5420798, 1.697469, 1, 0, 0.7215686, 1,
1.249344, 0.9270768, 1.166175, 1, 0, 0.7137255, 1,
1.250167, 0.1663068, 1.771609, 1, 0, 0.7098039, 1,
1.257405, -1.110586, 2.179077, 1, 0, 0.7019608, 1,
1.258295, -0.1370998, 1.617222, 1, 0, 0.6941177, 1,
1.268857, -1.124211, 2.949371, 1, 0, 0.6901961, 1,
1.27066, -0.1997642, 1.586451, 1, 0, 0.682353, 1,
1.280277, -1.977771, 1.336691, 1, 0, 0.6784314, 1,
1.306472, -1.178436, 2.15572, 1, 0, 0.6705883, 1,
1.30741, 0.2726607, 1.753265, 1, 0, 0.6666667, 1,
1.307895, -0.1528146, 2.221239, 1, 0, 0.6588235, 1,
1.309968, -0.2586468, 1.541904, 1, 0, 0.654902, 1,
1.315008, 2.359918, 0.06796848, 1, 0, 0.6470588, 1,
1.316163, -1.10379, 2.085551, 1, 0, 0.6431373, 1,
1.317545, 0.6155343, -0.6016493, 1, 0, 0.6352941, 1,
1.323904, 1.219622, 0.7559158, 1, 0, 0.6313726, 1,
1.325898, 0.6378763, 1.055094, 1, 0, 0.6235294, 1,
1.346467, -1.054848, 1.802164, 1, 0, 0.6196079, 1,
1.348708, 2.367408, -1.280635, 1, 0, 0.6117647, 1,
1.350247, 0.0001441315, 2.85947, 1, 0, 0.6078432, 1,
1.351854, -0.981568, 2.384094, 1, 0, 0.6, 1,
1.357246, -1.802718, 2.302083, 1, 0, 0.5921569, 1,
1.373592, 0.1198724, 2.083382, 1, 0, 0.5882353, 1,
1.405021, 0.3421406, 2.497052, 1, 0, 0.5803922, 1,
1.410276, 1.505869, 1.50286, 1, 0, 0.5764706, 1,
1.410284, -0.6656905, 1.525535, 1, 0, 0.5686275, 1,
1.410523, 0.5061897, 1.308675, 1, 0, 0.5647059, 1,
1.412594, 0.2631907, 0.1302073, 1, 0, 0.5568628, 1,
1.426342, 0.9097646, 1.687891, 1, 0, 0.5529412, 1,
1.435518, -0.2190401, 3.28116, 1, 0, 0.5450981, 1,
1.442437, -0.2287322, 1.114473, 1, 0, 0.5411765, 1,
1.450858, 0.2145658, 1.810313, 1, 0, 0.5333334, 1,
1.451685, -1.969496, 4.591911, 1, 0, 0.5294118, 1,
1.453366, -1.738826, 1.733836, 1, 0, 0.5215687, 1,
1.454577, -0.5703644, 2.582185, 1, 0, 0.5176471, 1,
1.458253, -0.02023161, 1.150161, 1, 0, 0.509804, 1,
1.458843, 0.5865726, 0.9859313, 1, 0, 0.5058824, 1,
1.462293, -1.926767, 2.38465, 1, 0, 0.4980392, 1,
1.474593, 1.341398, 1.694784, 1, 0, 0.4901961, 1,
1.478704, 0.160554, 1.465993, 1, 0, 0.4862745, 1,
1.482915, -0.002280221, 0.275235, 1, 0, 0.4784314, 1,
1.486927, 1.292807, 2.490967, 1, 0, 0.4745098, 1,
1.487324, 0.6264548, 1.456495, 1, 0, 0.4666667, 1,
1.500371, -0.3236523, 0.8697771, 1, 0, 0.4627451, 1,
1.501819, -0.4104027, 2.41479, 1, 0, 0.454902, 1,
1.507446, 0.122491, 1.248608, 1, 0, 0.4509804, 1,
1.512458, 0.4504319, 2.052778, 1, 0, 0.4431373, 1,
1.516928, 1.956519, 0.5944743, 1, 0, 0.4392157, 1,
1.526486, 0.5204432, 2.196306, 1, 0, 0.4313726, 1,
1.527532, 0.6390444, 2.393594, 1, 0, 0.427451, 1,
1.527639, -1.732167, 1.209902, 1, 0, 0.4196078, 1,
1.529815, -0.6884411, 2.033703, 1, 0, 0.4156863, 1,
1.536401, 0.9066595, 0.3113344, 1, 0, 0.4078431, 1,
1.538193, 0.001172013, 3.237534, 1, 0, 0.4039216, 1,
1.540597, 1.137699, 2.874518, 1, 0, 0.3960784, 1,
1.540798, -1.038771, 0.3691932, 1, 0, 0.3882353, 1,
1.544404, 0.06612022, 2.88816, 1, 0, 0.3843137, 1,
1.544539, 0.589782, 0.01310488, 1, 0, 0.3764706, 1,
1.549369, 0.6861432, 3.090264, 1, 0, 0.372549, 1,
1.551005, 0.3733855, 2.438306, 1, 0, 0.3647059, 1,
1.555878, -0.8650424, 1.394449, 1, 0, 0.3607843, 1,
1.564407, -1.827544, 2.165026, 1, 0, 0.3529412, 1,
1.565004, 0.006572548, -0.02708622, 1, 0, 0.3490196, 1,
1.571846, -1.396088, 3.066684, 1, 0, 0.3411765, 1,
1.573924, -0.7871996, 2.264178, 1, 0, 0.3372549, 1,
1.601829, 0.2079581, 0.2641455, 1, 0, 0.3294118, 1,
1.607366, -0.4584709, 1.617013, 1, 0, 0.3254902, 1,
1.630263, 2.288788, 1.445741, 1, 0, 0.3176471, 1,
1.642439, -0.331303, 0.5511785, 1, 0, 0.3137255, 1,
1.642696, -0.9096764, 3.106592, 1, 0, 0.3058824, 1,
1.661676, -0.1608652, 3.399597, 1, 0, 0.2980392, 1,
1.661775, -0.6868479, 1.475137, 1, 0, 0.2941177, 1,
1.671379, 0.8318843, 1.961766, 1, 0, 0.2862745, 1,
1.672851, 0.5453689, 1.682176, 1, 0, 0.282353, 1,
1.67836, -0.7677569, 1.998602, 1, 0, 0.2745098, 1,
1.679873, -3.072659, 3.491874, 1, 0, 0.2705882, 1,
1.712613, 0.7441558, 0.9126589, 1, 0, 0.2627451, 1,
1.720515, -0.2266627, 1.996653, 1, 0, 0.2588235, 1,
1.726346, 1.626309, -1.782373, 1, 0, 0.2509804, 1,
1.732117, 0.9172265, 0.6602514, 1, 0, 0.2470588, 1,
1.733102, -0.9157911, 3.873653, 1, 0, 0.2392157, 1,
1.733434, 0.2352928, 2.6614, 1, 0, 0.2352941, 1,
1.738904, -0.1219821, 2.009028, 1, 0, 0.227451, 1,
1.753002, 1.911171, 0.5248689, 1, 0, 0.2235294, 1,
1.758502, 0.2372994, 1.446963, 1, 0, 0.2156863, 1,
1.773094, 0.666824, 1.453287, 1, 0, 0.2117647, 1,
1.782162, -0.2424622, 3.200135, 1, 0, 0.2039216, 1,
1.78728, -0.8810917, 0.8451191, 1, 0, 0.1960784, 1,
1.794701, 0.1038244, 3.020549, 1, 0, 0.1921569, 1,
1.830552, 0.1622207, 2.229567, 1, 0, 0.1843137, 1,
1.834395, -2.12825, 1.174646, 1, 0, 0.1803922, 1,
1.868293, 0.2023016, 0.9072929, 1, 0, 0.172549, 1,
1.892674, -1.441167, 2.201825, 1, 0, 0.1686275, 1,
1.899924, -0.5310904, 1.18168, 1, 0, 0.1607843, 1,
1.908586, -0.9381067, 2.671602, 1, 0, 0.1568628, 1,
1.918695, 0.3135643, 1.971572, 1, 0, 0.1490196, 1,
1.91952, -1.165697, 1.567101, 1, 0, 0.145098, 1,
1.991953, -0.7352435, 1.699358, 1, 0, 0.1372549, 1,
2.015403, -0.9912462, 1.176054, 1, 0, 0.1333333, 1,
2.027701, 0.5005211, 0.1020483, 1, 0, 0.1254902, 1,
2.050702, -1.076183, 3.270318, 1, 0, 0.1215686, 1,
2.061343, -0.639825, 3.699612, 1, 0, 0.1137255, 1,
2.075978, 0.2404759, 1.332145, 1, 0, 0.1098039, 1,
2.106228, -0.9294857, 3.253747, 1, 0, 0.1019608, 1,
2.114709, 0.9553995, -0.3639735, 1, 0, 0.09411765, 1,
2.198082, 0.7636164, 1.509971, 1, 0, 0.09019608, 1,
2.316463, 0.4623873, 3.217978, 1, 0, 0.08235294, 1,
2.330218, 0.505785, 0.8070397, 1, 0, 0.07843138, 1,
2.356496, 0.1375369, 1.3457, 1, 0, 0.07058824, 1,
2.422376, -1.446286, 0.8108834, 1, 0, 0.06666667, 1,
2.441059, -0.1308516, 1.489069, 1, 0, 0.05882353, 1,
2.570156, -0.3747049, 2.486409, 1, 0, 0.05490196, 1,
2.610197, 0.1785899, 1.554727, 1, 0, 0.04705882, 1,
2.675188, -2.010266, 1.980966, 1, 0, 0.04313726, 1,
2.743039, 2.016742, 1.663976, 1, 0, 0.03529412, 1,
2.776943, -1.273545, 0.8054851, 1, 0, 0.03137255, 1,
2.919218, -1.810275, 2.382566, 1, 0, 0.02352941, 1,
3.058055, 0.03295233, 0.4874297, 1, 0, 0.01960784, 1,
3.112802, -1.311136, 2.610233, 1, 0, 0.01176471, 1,
3.124651, 0.348009, 2.843492, 1, 0, 0.007843138, 1
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
-0.2395006, -4.359052, -7.088902, 0, -0.5, 0.5, 0.5,
-0.2395006, -4.359052, -7.088902, 1, -0.5, 0.5, 0.5,
-0.2395006, -4.359052, -7.088902, 1, 1.5, 0.5, 0.5,
-0.2395006, -4.359052, -7.088902, 0, 1.5, 0.5, 0.5
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
-4.7441, -0.06492591, -7.088902, 0, -0.5, 0.5, 0.5,
-4.7441, -0.06492591, -7.088902, 1, -0.5, 0.5, 0.5,
-4.7441, -0.06492591, -7.088902, 1, 1.5, 0.5, 0.5,
-4.7441, -0.06492591, -7.088902, 0, 1.5, 0.5, 0.5
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
-4.7441, -4.359052, 0.05999112, 0, -0.5, 0.5, 0.5,
-4.7441, -4.359052, 0.05999112, 1, -0.5, 0.5, 0.5,
-4.7441, -4.359052, 0.05999112, 1, 1.5, 0.5, 0.5,
-4.7441, -4.359052, 0.05999112, 0, 1.5, 0.5, 0.5
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
-3, -3.3681, -5.439158,
3, -3.3681, -5.439158,
-3, -3.3681, -5.439158,
-3, -3.533259, -5.714115,
-2, -3.3681, -5.439158,
-2, -3.533259, -5.714115,
-1, -3.3681, -5.439158,
-1, -3.533259, -5.714115,
0, -3.3681, -5.439158,
0, -3.533259, -5.714115,
1, -3.3681, -5.439158,
1, -3.533259, -5.714115,
2, -3.3681, -5.439158,
2, -3.533259, -5.714115,
3, -3.3681, -5.439158,
3, -3.533259, -5.714115
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
-3, -3.863576, -6.26403, 0, -0.5, 0.5, 0.5,
-3, -3.863576, -6.26403, 1, -0.5, 0.5, 0.5,
-3, -3.863576, -6.26403, 1, 1.5, 0.5, 0.5,
-3, -3.863576, -6.26403, 0, 1.5, 0.5, 0.5,
-2, -3.863576, -6.26403, 0, -0.5, 0.5, 0.5,
-2, -3.863576, -6.26403, 1, -0.5, 0.5, 0.5,
-2, -3.863576, -6.26403, 1, 1.5, 0.5, 0.5,
-2, -3.863576, -6.26403, 0, 1.5, 0.5, 0.5,
-1, -3.863576, -6.26403, 0, -0.5, 0.5, 0.5,
-1, -3.863576, -6.26403, 1, -0.5, 0.5, 0.5,
-1, -3.863576, -6.26403, 1, 1.5, 0.5, 0.5,
-1, -3.863576, -6.26403, 0, 1.5, 0.5, 0.5,
0, -3.863576, -6.26403, 0, -0.5, 0.5, 0.5,
0, -3.863576, -6.26403, 1, -0.5, 0.5, 0.5,
0, -3.863576, -6.26403, 1, 1.5, 0.5, 0.5,
0, -3.863576, -6.26403, 0, 1.5, 0.5, 0.5,
1, -3.863576, -6.26403, 0, -0.5, 0.5, 0.5,
1, -3.863576, -6.26403, 1, -0.5, 0.5, 0.5,
1, -3.863576, -6.26403, 1, 1.5, 0.5, 0.5,
1, -3.863576, -6.26403, 0, 1.5, 0.5, 0.5,
2, -3.863576, -6.26403, 0, -0.5, 0.5, 0.5,
2, -3.863576, -6.26403, 1, -0.5, 0.5, 0.5,
2, -3.863576, -6.26403, 1, 1.5, 0.5, 0.5,
2, -3.863576, -6.26403, 0, 1.5, 0.5, 0.5,
3, -3.863576, -6.26403, 0, -0.5, 0.5, 0.5,
3, -3.863576, -6.26403, 1, -0.5, 0.5, 0.5,
3, -3.863576, -6.26403, 1, 1.5, 0.5, 0.5,
3, -3.863576, -6.26403, 0, 1.5, 0.5, 0.5
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
-3.704577, -3, -5.439158,
-3.704577, 3, -5.439158,
-3.704577, -3, -5.439158,
-3.877831, -3, -5.714115,
-3.704577, -2, -5.439158,
-3.877831, -2, -5.714115,
-3.704577, -1, -5.439158,
-3.877831, -1, -5.714115,
-3.704577, 0, -5.439158,
-3.877831, 0, -5.714115,
-3.704577, 1, -5.439158,
-3.877831, 1, -5.714115,
-3.704577, 2, -5.439158,
-3.877831, 2, -5.714115,
-3.704577, 3, -5.439158,
-3.877831, 3, -5.714115
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
-4.224338, -3, -6.26403, 0, -0.5, 0.5, 0.5,
-4.224338, -3, -6.26403, 1, -0.5, 0.5, 0.5,
-4.224338, -3, -6.26403, 1, 1.5, 0.5, 0.5,
-4.224338, -3, -6.26403, 0, 1.5, 0.5, 0.5,
-4.224338, -2, -6.26403, 0, -0.5, 0.5, 0.5,
-4.224338, -2, -6.26403, 1, -0.5, 0.5, 0.5,
-4.224338, -2, -6.26403, 1, 1.5, 0.5, 0.5,
-4.224338, -2, -6.26403, 0, 1.5, 0.5, 0.5,
-4.224338, -1, -6.26403, 0, -0.5, 0.5, 0.5,
-4.224338, -1, -6.26403, 1, -0.5, 0.5, 0.5,
-4.224338, -1, -6.26403, 1, 1.5, 0.5, 0.5,
-4.224338, -1, -6.26403, 0, 1.5, 0.5, 0.5,
-4.224338, 0, -6.26403, 0, -0.5, 0.5, 0.5,
-4.224338, 0, -6.26403, 1, -0.5, 0.5, 0.5,
-4.224338, 0, -6.26403, 1, 1.5, 0.5, 0.5,
-4.224338, 0, -6.26403, 0, 1.5, 0.5, 0.5,
-4.224338, 1, -6.26403, 0, -0.5, 0.5, 0.5,
-4.224338, 1, -6.26403, 1, -0.5, 0.5, 0.5,
-4.224338, 1, -6.26403, 1, 1.5, 0.5, 0.5,
-4.224338, 1, -6.26403, 0, 1.5, 0.5, 0.5,
-4.224338, 2, -6.26403, 0, -0.5, 0.5, 0.5,
-4.224338, 2, -6.26403, 1, -0.5, 0.5, 0.5,
-4.224338, 2, -6.26403, 1, 1.5, 0.5, 0.5,
-4.224338, 2, -6.26403, 0, 1.5, 0.5, 0.5,
-4.224338, 3, -6.26403, 0, -0.5, 0.5, 0.5,
-4.224338, 3, -6.26403, 1, -0.5, 0.5, 0.5,
-4.224338, 3, -6.26403, 1, 1.5, 0.5, 0.5,
-4.224338, 3, -6.26403, 0, 1.5, 0.5, 0.5
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
-3.704577, -3.3681, -4,
-3.704577, -3.3681, 4,
-3.704577, -3.3681, -4,
-3.877831, -3.533259, -4,
-3.704577, -3.3681, -2,
-3.877831, -3.533259, -2,
-3.704577, -3.3681, 0,
-3.877831, -3.533259, 0,
-3.704577, -3.3681, 2,
-3.877831, -3.533259, 2,
-3.704577, -3.3681, 4,
-3.877831, -3.533259, 4
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
-4.224338, -3.863576, -4, 0, -0.5, 0.5, 0.5,
-4.224338, -3.863576, -4, 1, -0.5, 0.5, 0.5,
-4.224338, -3.863576, -4, 1, 1.5, 0.5, 0.5,
-4.224338, -3.863576, -4, 0, 1.5, 0.5, 0.5,
-4.224338, -3.863576, -2, 0, -0.5, 0.5, 0.5,
-4.224338, -3.863576, -2, 1, -0.5, 0.5, 0.5,
-4.224338, -3.863576, -2, 1, 1.5, 0.5, 0.5,
-4.224338, -3.863576, -2, 0, 1.5, 0.5, 0.5,
-4.224338, -3.863576, 0, 0, -0.5, 0.5, 0.5,
-4.224338, -3.863576, 0, 1, -0.5, 0.5, 0.5,
-4.224338, -3.863576, 0, 1, 1.5, 0.5, 0.5,
-4.224338, -3.863576, 0, 0, 1.5, 0.5, 0.5,
-4.224338, -3.863576, 2, 0, -0.5, 0.5, 0.5,
-4.224338, -3.863576, 2, 1, -0.5, 0.5, 0.5,
-4.224338, -3.863576, 2, 1, 1.5, 0.5, 0.5,
-4.224338, -3.863576, 2, 0, 1.5, 0.5, 0.5,
-4.224338, -3.863576, 4, 0, -0.5, 0.5, 0.5,
-4.224338, -3.863576, 4, 1, -0.5, 0.5, 0.5,
-4.224338, -3.863576, 4, 1, 1.5, 0.5, 0.5,
-4.224338, -3.863576, 4, 0, 1.5, 0.5, 0.5
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
-3.704577, -3.3681, -5.439158,
-3.704577, 3.238248, -5.439158,
-3.704577, -3.3681, 5.55914,
-3.704577, 3.238248, 5.55914,
-3.704577, -3.3681, -5.439158,
-3.704577, -3.3681, 5.55914,
-3.704577, 3.238248, -5.439158,
-3.704577, 3.238248, 5.55914,
-3.704577, -3.3681, -5.439158,
3.225575, -3.3681, -5.439158,
-3.704577, -3.3681, 5.55914,
3.225575, -3.3681, 5.55914,
-3.704577, 3.238248, -5.439158,
3.225575, 3.238248, -5.439158,
-3.704577, 3.238248, 5.55914,
3.225575, 3.238248, 5.55914,
3.225575, -3.3681, -5.439158,
3.225575, 3.238248, -5.439158,
3.225575, -3.3681, 5.55914,
3.225575, 3.238248, 5.55914,
3.225575, -3.3681, -5.439158,
3.225575, -3.3681, 5.55914,
3.225575, 3.238248, -5.439158,
3.225575, 3.238248, 5.55914
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
var radius = 7.786481;
var distance = 34.64293;
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
mvMatrix.translate( 0.2395006, 0.06492591, -0.05999112 );
mvMatrix.scale( 1.214821, 1.274364, 0.7654726 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.64293);
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
Jasmolin_I<-read.table("Jasmolin_I.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Jasmolin_I$V2
```

```
## Error in eval(expr, envir, enclos): object 'Jasmolin_I' not found
```

```r
y<-Jasmolin_I$V3
```

```
## Error in eval(expr, envir, enclos): object 'Jasmolin_I' not found
```

```r
z<-Jasmolin_I$V4
```

```
## Error in eval(expr, envir, enclos): object 'Jasmolin_I' not found
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
-3.603652, -1.560638, -1.286175, 0, 0, 1, 1, 1,
-3.012177, 0.9706782, -0.737146, 1, 0, 0, 1, 1,
-2.925101, 0.5549039, -0.7009298, 1, 0, 0, 1, 1,
-2.75389, -1.291262, -3.00302, 1, 0, 0, 1, 1,
-2.73734, 0.1006746, -2.929746, 1, 0, 0, 1, 1,
-2.640926, -0.6601471, -4.107721, 1, 0, 0, 1, 1,
-2.576678, -1.016426, -2.605445, 0, 0, 0, 1, 1,
-2.480846, -0.9650448, 0.05244989, 0, 0, 0, 1, 1,
-2.381866, -0.7998637, -1.240108, 0, 0, 0, 1, 1,
-2.365844, -0.8137872, -1.546754, 0, 0, 0, 1, 1,
-2.312079, -0.8369705, -1.011264, 0, 0, 0, 1, 1,
-2.309319, -0.5629167, -4.003705, 0, 0, 0, 1, 1,
-2.277998, -1.120853, -2.556151, 0, 0, 0, 1, 1,
-2.234842, 0.6873793, -0.1614468, 1, 1, 1, 1, 1,
-2.202012, 0.2837906, -1.522093, 1, 1, 1, 1, 1,
-2.18943, 0.8390805, -2.631871, 1, 1, 1, 1, 1,
-2.167323, 0.5461168, -1.638584, 1, 1, 1, 1, 1,
-2.156423, 0.5731103, -2.015399, 1, 1, 1, 1, 1,
-2.144045, -0.297057, -0.8381, 1, 1, 1, 1, 1,
-2.080609, 0.2322998, -3.736558, 1, 1, 1, 1, 1,
-2.065751, 0.3347182, -1.033731, 1, 1, 1, 1, 1,
-2.054262, 2.203538, 0.30658, 1, 1, 1, 1, 1,
-1.994614, -0.08618495, -3.266592, 1, 1, 1, 1, 1,
-1.985561, -0.3271532, -0.2792239, 1, 1, 1, 1, 1,
-1.963333, 0.8068873, -0.6208821, 1, 1, 1, 1, 1,
-1.959302, -0.157912, -1.783296, 1, 1, 1, 1, 1,
-1.900204, 1.675679, -2.424417, 1, 1, 1, 1, 1,
-1.840649, -0.3828554, -1.221993, 1, 1, 1, 1, 1,
-1.832356, 0.7472499, -0.4212107, 0, 0, 1, 1, 1,
-1.817799, -0.006968422, -0.2085578, 1, 0, 0, 1, 1,
-1.816884, 0.6667128, -1.028983, 1, 0, 0, 1, 1,
-1.806472, -0.5497045, -2.470883, 1, 0, 0, 1, 1,
-1.776063, 0.04654997, -1.83889, 1, 0, 0, 1, 1,
-1.756573, 0.163571, -1.122634, 1, 0, 0, 1, 1,
-1.752501, -0.6849258, -2.096532, 0, 0, 0, 1, 1,
-1.731029, 0.444282, -0.9340971, 0, 0, 0, 1, 1,
-1.723448, 0.9167189, -1.76609, 0, 0, 0, 1, 1,
-1.710681, 0.01900703, -1.636067, 0, 0, 0, 1, 1,
-1.685159, 0.1631112, -1.193847, 0, 0, 0, 1, 1,
-1.683727, 2.129337, -3.315143, 0, 0, 0, 1, 1,
-1.67837, -0.1787792, -0.1402448, 0, 0, 0, 1, 1,
-1.666517, 0.6628746, -1.176129, 1, 1, 1, 1, 1,
-1.666073, -0.7260838, -2.304148, 1, 1, 1, 1, 1,
-1.659544, -1.199215, -3.385039, 1, 1, 1, 1, 1,
-1.641423, -0.8108426, -3.184118, 1, 1, 1, 1, 1,
-1.632012, -0.4380138, 0.05960088, 1, 1, 1, 1, 1,
-1.612052, 0.6783375, -0.9118648, 1, 1, 1, 1, 1,
-1.598664, 0.05071004, -1.200808, 1, 1, 1, 1, 1,
-1.585894, 1.449213, -1.744739, 1, 1, 1, 1, 1,
-1.575969, 0.5498485, -2.087812, 1, 1, 1, 1, 1,
-1.548519, 0.5879335, -0.3886777, 1, 1, 1, 1, 1,
-1.535507, -0.7223971, -2.486015, 1, 1, 1, 1, 1,
-1.516116, 0.2745305, -2.304134, 1, 1, 1, 1, 1,
-1.486805, 0.00132058, -2.385259, 1, 1, 1, 1, 1,
-1.477904, -0.4614851, -1.98489, 1, 1, 1, 1, 1,
-1.476274, 0.5707457, -0.2705452, 1, 1, 1, 1, 1,
-1.474994, 0.08886001, -0.5338531, 0, 0, 1, 1, 1,
-1.46905, -0.4258114, -0.9354489, 1, 0, 0, 1, 1,
-1.468849, 1.849185, 0.2987561, 1, 0, 0, 1, 1,
-1.464723, 0.2072958, -1.056035, 1, 0, 0, 1, 1,
-1.462155, -0.3141956, -3.973298, 1, 0, 0, 1, 1,
-1.449315, -0.4805576, -0.9586618, 1, 0, 0, 1, 1,
-1.447241, 0.2330962, -0.686521, 0, 0, 0, 1, 1,
-1.445244, -0.3470043, -3.423554, 0, 0, 0, 1, 1,
-1.438569, 0.2040168, -4.331586, 0, 0, 0, 1, 1,
-1.43787, 1.472112, 0.2684159, 0, 0, 0, 1, 1,
-1.416735, 1.180765, -0.808436, 0, 0, 0, 1, 1,
-1.394528, -2.590714, -4.411237, 0, 0, 0, 1, 1,
-1.391255, -0.801672, -2.749862, 0, 0, 0, 1, 1,
-1.386319, 0.6892832, 1.465974, 1, 1, 1, 1, 1,
-1.383348, 0.9521697, -0.5688379, 1, 1, 1, 1, 1,
-1.371064, 1.065437, -0.2991049, 1, 1, 1, 1, 1,
-1.342463, -0.2329789, -2.321267, 1, 1, 1, 1, 1,
-1.334005, -0.2228468, -0.9106575, 1, 1, 1, 1, 1,
-1.316164, -0.4196691, -2.31716, 1, 1, 1, 1, 1,
-1.315907, -1.759286, -1.308318, 1, 1, 1, 1, 1,
-1.288461, -0.1662802, -1.864762, 1, 1, 1, 1, 1,
-1.282542, 0.1506884, -1.233583, 1, 1, 1, 1, 1,
-1.280209, 0.7547252, -0.1902199, 1, 1, 1, 1, 1,
-1.274143, -0.1966134, -2.223022, 1, 1, 1, 1, 1,
-1.273963, 0.08069057, -0.2053249, 1, 1, 1, 1, 1,
-1.273417, -1.083152, -2.980298, 1, 1, 1, 1, 1,
-1.272179, 0.6391917, -2.183744, 1, 1, 1, 1, 1,
-1.271063, 0.4325733, -0.9110315, 1, 1, 1, 1, 1,
-1.270358, 0.2733152, -1.699412, 0, 0, 1, 1, 1,
-1.266615, -0.5952756, -1.385613, 1, 0, 0, 1, 1,
-1.264565, -0.3905346, -0.5434373, 1, 0, 0, 1, 1,
-1.261142, -0.01886313, -0.7072559, 1, 0, 0, 1, 1,
-1.259698, -3.123639, -2.159219, 1, 0, 0, 1, 1,
-1.259059, 1.0574, -0.4560949, 1, 0, 0, 1, 1,
-1.256373, -0.9741456, -2.297137, 0, 0, 0, 1, 1,
-1.246649, -1.218761, -1.764964, 0, 0, 0, 1, 1,
-1.242693, -0.7622199, -2.535927, 0, 0, 0, 1, 1,
-1.241933, -0.6730173, -1.456601, 0, 0, 0, 1, 1,
-1.240528, -0.2245032, -1.608899, 0, 0, 0, 1, 1,
-1.239979, 0.503415, -2.886575, 0, 0, 0, 1, 1,
-1.236632, 0.4734324, -1.072067, 0, 0, 0, 1, 1,
-1.220497, -0.7527843, -3.119148, 1, 1, 1, 1, 1,
-1.219245, -0.2654215, -1.924721, 1, 1, 1, 1, 1,
-1.213853, 0.7303652, -0.2260163, 1, 1, 1, 1, 1,
-1.21244, -0.00831962, 0.09390689, 1, 1, 1, 1, 1,
-1.210678, -1.956951, -2.211712, 1, 1, 1, 1, 1,
-1.209975, 0.08210547, -1.497679, 1, 1, 1, 1, 1,
-1.198715, 1.60994, -1.642505, 1, 1, 1, 1, 1,
-1.194285, -1.124636, -2.522305, 1, 1, 1, 1, 1,
-1.191068, 1.253063, -1.900865, 1, 1, 1, 1, 1,
-1.177352, 1.246715, 1.189898, 1, 1, 1, 1, 1,
-1.172265, 1.061633, -1.77859, 1, 1, 1, 1, 1,
-1.160787, -0.4967562, -3.345869, 1, 1, 1, 1, 1,
-1.158579, -0.880309, -2.706512, 1, 1, 1, 1, 1,
-1.153718, -0.1910272, -1.820545, 1, 1, 1, 1, 1,
-1.139144, -0.7895814, -1.918507, 1, 1, 1, 1, 1,
-1.137639, 1.100774, 0.9934205, 0, 0, 1, 1, 1,
-1.135602, -1.43888, -1.029266, 1, 0, 0, 1, 1,
-1.125229, 1.036658, -0.4910346, 1, 0, 0, 1, 1,
-1.119256, -0.5217698, -2.466952, 1, 0, 0, 1, 1,
-1.102217, -0.4343, -3.141062, 1, 0, 0, 1, 1,
-1.099445, -0.07927205, -0.1367502, 1, 0, 0, 1, 1,
-1.093372, -0.6102818, -1.215852, 0, 0, 0, 1, 1,
-1.093245, 0.4021006, -0.07123793, 0, 0, 0, 1, 1,
-1.084087, -0.2448612, -0.7714791, 0, 0, 0, 1, 1,
-1.080656, 0.9746358, 0.2696791, 0, 0, 0, 1, 1,
-1.080598, -0.7437493, -1.141918, 0, 0, 0, 1, 1,
-1.077584, -0.1425504, -0.6855177, 0, 0, 0, 1, 1,
-1.077294, -2.196045, -3.294531, 0, 0, 0, 1, 1,
-1.071282, -0.9200995, -3.715757, 1, 1, 1, 1, 1,
-1.061212, 0.6150851, -1.726124, 1, 1, 1, 1, 1,
-1.060913, -0.9504905, -2.363957, 1, 1, 1, 1, 1,
-1.055893, -0.4793597, -0.1052481, 1, 1, 1, 1, 1,
-1.054114, 0.8187632, -2.99649, 1, 1, 1, 1, 1,
-1.05348, 0.4940733, -1.633831, 1, 1, 1, 1, 1,
-1.037273, -0.05259403, -1.012526, 1, 1, 1, 1, 1,
-1.027742, 0.6015425, -0.04211889, 1, 1, 1, 1, 1,
-1.024399, 0.1910285, -1.258807, 1, 1, 1, 1, 1,
-1.014217, -1.341189, -3.504678, 1, 1, 1, 1, 1,
-1.011528, 1.409366, 0.01599473, 1, 1, 1, 1, 1,
-1.002068, 1.599476, 0.6934603, 1, 1, 1, 1, 1,
-1.000964, 0.8783801, -1.911441, 1, 1, 1, 1, 1,
-1.000684, -0.1233082, -3.326952, 1, 1, 1, 1, 1,
-0.9975799, 1.797516, -0.3334731, 1, 1, 1, 1, 1,
-0.995134, 0.7085332, -0.5405377, 0, 0, 1, 1, 1,
-0.9932997, -1.288038, -2.713321, 1, 0, 0, 1, 1,
-0.9889088, 0.6822934, 0.2440049, 1, 0, 0, 1, 1,
-0.9793559, -0.3888156, -1.935089, 1, 0, 0, 1, 1,
-0.9791508, 1.374648, -1.335717, 1, 0, 0, 1, 1,
-0.9737979, -0.1704174, -2.145389, 1, 0, 0, 1, 1,
-0.9704686, 1.068174, -0.8250533, 0, 0, 0, 1, 1,
-0.9689061, 0.5025446, -1.292994, 0, 0, 0, 1, 1,
-0.9674886, 0.9904155, 0.3395916, 0, 0, 0, 1, 1,
-0.9574913, -0.2956764, -0.3439435, 0, 0, 0, 1, 1,
-0.9507999, -0.6875864, -2.879648, 0, 0, 0, 1, 1,
-0.9504648, -0.9030027, -3.248236, 0, 0, 0, 1, 1,
-0.948565, 0.07877322, -2.862129, 0, 0, 0, 1, 1,
-0.9482518, 1.737424, -1.210002, 1, 1, 1, 1, 1,
-0.946439, 0.07858548, -2.730106, 1, 1, 1, 1, 1,
-0.9433964, 1.058173, -0.2813093, 1, 1, 1, 1, 1,
-0.9413146, -0.8207552, -3.868851, 1, 1, 1, 1, 1,
-0.9377714, 1.934458, -1.317788, 1, 1, 1, 1, 1,
-0.9217523, -0.1784481, -3.323554, 1, 1, 1, 1, 1,
-0.9168941, -0.691019, -0.9093187, 1, 1, 1, 1, 1,
-0.916234, 0.6564102, -0.8359189, 1, 1, 1, 1, 1,
-0.9144103, 1.224865, -2.066697, 1, 1, 1, 1, 1,
-0.8990934, -0.003452393, -1.339207, 1, 1, 1, 1, 1,
-0.8949389, -0.131688, 0.227883, 1, 1, 1, 1, 1,
-0.8926151, 0.9421276, -1.442102, 1, 1, 1, 1, 1,
-0.8915617, 0.8550088, 0.1233319, 1, 1, 1, 1, 1,
-0.8912038, -1.049791, -3.310167, 1, 1, 1, 1, 1,
-0.8849531, 2.594596, 0.03333589, 1, 1, 1, 1, 1,
-0.8840203, 1.642433, 0.3411066, 0, 0, 1, 1, 1,
-0.8793076, 0.1867031, -1.537315, 1, 0, 0, 1, 1,
-0.8772141, 0.8911095, -0.2098503, 1, 0, 0, 1, 1,
-0.8717896, 1.47327, -1.827563, 1, 0, 0, 1, 1,
-0.8683394, -1.589946, -3.780725, 1, 0, 0, 1, 1,
-0.8651478, 0.3296134, -0.3193711, 1, 0, 0, 1, 1,
-0.8645034, 0.1265709, -1.851628, 0, 0, 0, 1, 1,
-0.862112, -0.5016517, -1.795062, 0, 0, 0, 1, 1,
-0.8605487, 1.422769, -1.156412, 0, 0, 0, 1, 1,
-0.8585995, -0.5617693, -3.773415, 0, 0, 0, 1, 1,
-0.8554489, 0.9067904, -1.285222, 0, 0, 0, 1, 1,
-0.8543926, -0.692614, -3.608295, 0, 0, 0, 1, 1,
-0.849879, -0.0809849, -2.073844, 0, 0, 0, 1, 1,
-0.8461875, -0.4838781, -3.19978, 1, 1, 1, 1, 1,
-0.8398025, -1.157737, -2.592619, 1, 1, 1, 1, 1,
-0.8377219, 1.279003, -1.090781, 1, 1, 1, 1, 1,
-0.829881, 0.2785079, -1.172073, 1, 1, 1, 1, 1,
-0.8280502, -0.0496306, -2.16294, 1, 1, 1, 1, 1,
-0.8202757, 0.3633778, -1.019663, 1, 1, 1, 1, 1,
-0.8202313, -1.154285, -2.512127, 1, 1, 1, 1, 1,
-0.8159707, 0.7207177, -1.098107, 1, 1, 1, 1, 1,
-0.8118523, -1.394661, -2.058357, 1, 1, 1, 1, 1,
-0.8103398, 1.019714, -0.2578943, 1, 1, 1, 1, 1,
-0.8061337, -0.01775249, -2.309195, 1, 1, 1, 1, 1,
-0.8019159, -1.744459, -3.472585, 1, 1, 1, 1, 1,
-0.7998628, -1.534473, -1.136357, 1, 1, 1, 1, 1,
-0.7988697, -0.113672, 0.4620552, 1, 1, 1, 1, 1,
-0.7947613, 0.4157506, -0.8139228, 1, 1, 1, 1, 1,
-0.7890642, -0.2676466, -2.569856, 0, 0, 1, 1, 1,
-0.787938, 1.271375, -0.01878513, 1, 0, 0, 1, 1,
-0.7878168, 1.443467, 1.288633, 1, 0, 0, 1, 1,
-0.7839869, 0.5677835, -0.436092, 1, 0, 0, 1, 1,
-0.7734091, 0.04497043, -1.394076, 1, 0, 0, 1, 1,
-0.7714584, 0.9171667, -0.6377932, 1, 0, 0, 1, 1,
-0.7699697, 0.7835348, -0.9250402, 0, 0, 0, 1, 1,
-0.7689157, -1.124112, -2.497157, 0, 0, 0, 1, 1,
-0.7623874, -0.5209693, -1.629834, 0, 0, 0, 1, 1,
-0.7604175, -1.803766, -2.763349, 0, 0, 0, 1, 1,
-0.7585847, 1.069209, -0.4374774, 0, 0, 0, 1, 1,
-0.757324, -0.3535171, -2.75073, 0, 0, 0, 1, 1,
-0.7504273, 0.6909876, 1.134687, 0, 0, 0, 1, 1,
-0.7495275, -0.006697496, -0.9792833, 1, 1, 1, 1, 1,
-0.7422194, -0.6529034, -2.063422, 1, 1, 1, 1, 1,
-0.7369502, 0.1243548, 0.05184924, 1, 1, 1, 1, 1,
-0.7363142, -0.3822184, -3.927186, 1, 1, 1, 1, 1,
-0.732265, 0.9501562, -0.4724365, 1, 1, 1, 1, 1,
-0.7320008, 0.4387137, -1.155042, 1, 1, 1, 1, 1,
-0.7315954, -0.5036775, -1.029129, 1, 1, 1, 1, 1,
-0.7313479, -1.207695, -0.8897455, 1, 1, 1, 1, 1,
-0.7271539, -0.5430547, -2.040016, 1, 1, 1, 1, 1,
-0.7250465, -1.137871, -4.327983, 1, 1, 1, 1, 1,
-0.7145234, 0.4656325, -0.3133956, 1, 1, 1, 1, 1,
-0.7098999, 0.7004741, -0.6644228, 1, 1, 1, 1, 1,
-0.7012513, -0.1093981, -2.083247, 1, 1, 1, 1, 1,
-0.6994017, -1.227852, -1.255542, 1, 1, 1, 1, 1,
-0.6969548, 0.7737523, -0.2805927, 1, 1, 1, 1, 1,
-0.6853763, -1.257084, -3.435882, 0, 0, 1, 1, 1,
-0.6831302, 1.203719, -1.076527, 1, 0, 0, 1, 1,
-0.6803614, 0.9034814, -1.614872, 1, 0, 0, 1, 1,
-0.6788285, 0.6809825, -1.189728, 1, 0, 0, 1, 1,
-0.6733355, 0.7625149, 0.7083328, 1, 0, 0, 1, 1,
-0.6661103, 0.3924536, -1.431969, 1, 0, 0, 1, 1,
-0.6642573, -0.02791397, -0.7888409, 0, 0, 0, 1, 1,
-0.6609889, -0.7461132, -1.787136, 0, 0, 0, 1, 1,
-0.6598486, -1.400214, -2.493433, 0, 0, 0, 1, 1,
-0.6597204, -2.145005, -2.297556, 0, 0, 0, 1, 1,
-0.6557699, 1.692982, 0.9871755, 0, 0, 0, 1, 1,
-0.653899, 0.5848314, -1.531458, 0, 0, 0, 1, 1,
-0.649976, 0.1073138, -2.979993, 0, 0, 0, 1, 1,
-0.6430987, 0.1664893, -2.498083, 1, 1, 1, 1, 1,
-0.6416813, -1.392103, -3.043468, 1, 1, 1, 1, 1,
-0.6409244, -0.7136493, -3.37442, 1, 1, 1, 1, 1,
-0.6407171, 1.157477, -0.3076544, 1, 1, 1, 1, 1,
-0.6398031, -2.158122, -4.843, 1, 1, 1, 1, 1,
-0.6387122, 0.4378967, -2.892516, 1, 1, 1, 1, 1,
-0.633644, -1.318405, -3.092102, 1, 1, 1, 1, 1,
-0.6261398, 0.471369, -1.236894, 1, 1, 1, 1, 1,
-0.624195, -0.10392, -0.464098, 1, 1, 1, 1, 1,
-0.6193257, 1.83711, -0.3797898, 1, 1, 1, 1, 1,
-0.613033, -0.0317012, 0.102697, 1, 1, 1, 1, 1,
-0.6115847, 0.1786546, -1.575236, 1, 1, 1, 1, 1,
-0.6052894, 0.6837486, -1.342641, 1, 1, 1, 1, 1,
-0.5954463, 0.1460321, -1.845722, 1, 1, 1, 1, 1,
-0.5927491, -0.82274, -1.795048, 1, 1, 1, 1, 1,
-0.5890412, -1.419436, -0.9679939, 0, 0, 1, 1, 1,
-0.5865605, 2.053282, -0.5348344, 1, 0, 0, 1, 1,
-0.5863452, -0.8387687, -2.104946, 1, 0, 0, 1, 1,
-0.5839518, -0.2842548, -1.840418, 1, 0, 0, 1, 1,
-0.5832216, -1.76711, -3.732884, 1, 0, 0, 1, 1,
-0.5788622, 0.6183853, 0.06423589, 1, 0, 0, 1, 1,
-0.5785601, 0.601016, -1.030398, 0, 0, 0, 1, 1,
-0.5749952, -0.5629508, -0.603236, 0, 0, 0, 1, 1,
-0.5684145, 2.485538, -0.8211868, 0, 0, 0, 1, 1,
-0.5671899, 0.3293912, -0.956665, 0, 0, 0, 1, 1,
-0.5669651, 0.9640834, -0.6441765, 0, 0, 0, 1, 1,
-0.5617416, 0.7627428, -0.1101521, 0, 0, 0, 1, 1,
-0.5617037, -0.208362, -1.005136, 0, 0, 0, 1, 1,
-0.5502813, 0.7459131, -2.1907, 1, 1, 1, 1, 1,
-0.5473679, -0.04087591, -1.957621, 1, 1, 1, 1, 1,
-0.5446404, 1.480527, 0.4728051, 1, 1, 1, 1, 1,
-0.5382593, -0.9112805, -1.629061, 1, 1, 1, 1, 1,
-0.5376112, -1.442937, -2.929484, 1, 1, 1, 1, 1,
-0.5374567, 0.3234433, -1.100605, 1, 1, 1, 1, 1,
-0.5373345, 1.149646, -0.214043, 1, 1, 1, 1, 1,
-0.5361775, 0.4678603, -1.130245, 1, 1, 1, 1, 1,
-0.5335379, -0.4010934, -1.444367, 1, 1, 1, 1, 1,
-0.5326405, 0.7226902, -1.233926, 1, 1, 1, 1, 1,
-0.5299848, 0.6185604, 0.5033557, 1, 1, 1, 1, 1,
-0.527787, 0.764941, -0.5969871, 1, 1, 1, 1, 1,
-0.5222222, -0.3452519, -1.725118, 1, 1, 1, 1, 1,
-0.5212964, -0.9357554, -3.904493, 1, 1, 1, 1, 1,
-0.519886, -0.9907292, -1.197969, 1, 1, 1, 1, 1,
-0.5160482, -0.09337951, -2.584594, 0, 0, 1, 1, 1,
-0.5156436, 0.6159157, -0.9754535, 1, 0, 0, 1, 1,
-0.5140877, -0.1840907, 0.4632779, 1, 0, 0, 1, 1,
-0.5128219, -1.540569, -1.764274, 1, 0, 0, 1, 1,
-0.5112328, 0.1982209, -1.837534, 1, 0, 0, 1, 1,
-0.5033113, 0.04435619, -1.103906, 1, 0, 0, 1, 1,
-0.5016447, -1.679568, -2.779874, 0, 0, 0, 1, 1,
-0.4999633, 0.08777656, -2.843894, 0, 0, 0, 1, 1,
-0.4991656, -0.08903839, -1.596889, 0, 0, 0, 1, 1,
-0.4936566, 0.8864779, -0.3129757, 0, 0, 0, 1, 1,
-0.490934, -0.6084234, -2.950172, 0, 0, 0, 1, 1,
-0.4906444, 1.286461, -1.059428, 0, 0, 0, 1, 1,
-0.4849137, 0.8809596, -1.042884, 0, 0, 0, 1, 1,
-0.4821188, -1.353652, -2.29218, 1, 1, 1, 1, 1,
-0.4799475, 0.7010677, -1.119228, 1, 1, 1, 1, 1,
-0.4711526, -0.2761261, -1.991279, 1, 1, 1, 1, 1,
-0.4673278, 0.420504, -0.5975731, 1, 1, 1, 1, 1,
-0.4646406, -0.3812903, -1.402274, 1, 1, 1, 1, 1,
-0.460264, -1.281239, -2.186447, 1, 1, 1, 1, 1,
-0.4539614, -1.305094, -3.960676, 1, 1, 1, 1, 1,
-0.4531616, -0.2596676, -1.678595, 1, 1, 1, 1, 1,
-0.4530781, 1.221157, -0.6576008, 1, 1, 1, 1, 1,
-0.4491743, 0.8327244, 0.8686901, 1, 1, 1, 1, 1,
-0.4440535, 0.4321772, -1.303005, 1, 1, 1, 1, 1,
-0.441851, 2.067189, -0.7852784, 1, 1, 1, 1, 1,
-0.4402529, -1.681426, -2.269526, 1, 1, 1, 1, 1,
-0.440128, 0.9925272, -0.52524, 1, 1, 1, 1, 1,
-0.4358324, -0.5460701, -2.445656, 1, 1, 1, 1, 1,
-0.4318383, 1.810216, 0.111825, 0, 0, 1, 1, 1,
-0.4308003, 0.3338853, 1.642362, 1, 0, 0, 1, 1,
-0.4261014, 0.3127317, -0.04247689, 1, 0, 0, 1, 1,
-0.4259369, -1.379976, -3.747375, 1, 0, 0, 1, 1,
-0.4195449, 0.4945857, -2.824192, 1, 0, 0, 1, 1,
-0.416027, 0.9700997, -0.3768567, 1, 0, 0, 1, 1,
-0.4149947, 0.5960041, -0.9297755, 0, 0, 0, 1, 1,
-0.4142797, 0.9914113, -0.5424217, 0, 0, 0, 1, 1,
-0.4127727, -1.7896, -3.412209, 0, 0, 0, 1, 1,
-0.4119806, -3.271891, -3.472112, 0, 0, 0, 1, 1,
-0.4082772, -1.518865, -0.7876755, 0, 0, 0, 1, 1,
-0.4070781, -0.8146147, -3.704722, 0, 0, 0, 1, 1,
-0.4055541, 0.1177587, -0.7022743, 0, 0, 0, 1, 1,
-0.4052958, -0.5185766, -1.613919, 1, 1, 1, 1, 1,
-0.4008954, -0.2346894, -1.324582, 1, 1, 1, 1, 1,
-0.3986168, 1.22371, 0.2214365, 1, 1, 1, 1, 1,
-0.3944965, 0.7034225, 0.4094505, 1, 1, 1, 1, 1,
-0.3944751, -0.9677348, -1.90662, 1, 1, 1, 1, 1,
-0.381501, -2.409868, -4.78571, 1, 1, 1, 1, 1,
-0.3797151, 0.3990577, 0.367997, 1, 1, 1, 1, 1,
-0.3770869, -1.901898, -3.402292, 1, 1, 1, 1, 1,
-0.3647864, 0.3173025, -1.100847, 1, 1, 1, 1, 1,
-0.3645037, 0.3002626, -0.7593368, 1, 1, 1, 1, 1,
-0.3601111, 0.1872143, -1.241989, 1, 1, 1, 1, 1,
-0.3589716, -0.3268714, -2.603775, 1, 1, 1, 1, 1,
-0.3563084, -0.4544771, -3.771955, 1, 1, 1, 1, 1,
-0.3541574, -0.6628323, -1.55482, 1, 1, 1, 1, 1,
-0.3530224, 0.8824819, 0.1221552, 1, 1, 1, 1, 1,
-0.3505342, -0.8368558, -3.406127, 0, 0, 1, 1, 1,
-0.3482919, -0.6515285, -3.338669, 1, 0, 0, 1, 1,
-0.3465087, -0.5450583, -3.961427, 1, 0, 0, 1, 1,
-0.3460117, 0.2640806, -1.529587, 1, 0, 0, 1, 1,
-0.3422244, 1.328986, 1.019018, 1, 0, 0, 1, 1,
-0.3386885, 0.9612136, -2.758573, 1, 0, 0, 1, 1,
-0.3344041, -0.2988984, -2.580992, 0, 0, 0, 1, 1,
-0.333015, -1.690447, -3.425309, 0, 0, 0, 1, 1,
-0.3304468, 1.444869, 1.134857, 0, 0, 0, 1, 1,
-0.3284998, -0.286728, -2.046022, 0, 0, 0, 1, 1,
-0.3277351, -0.3126474, -2.761028, 0, 0, 0, 1, 1,
-0.3268614, 0.4689318, -0.4840939, 0, 0, 0, 1, 1,
-0.3260236, -0.6779259, -2.33216, 0, 0, 0, 1, 1,
-0.3246029, 0.7813427, -1.391116, 1, 1, 1, 1, 1,
-0.3241051, 0.9588287, 1.085233, 1, 1, 1, 1, 1,
-0.3212668, -0.525183, -1.960895, 1, 1, 1, 1, 1,
-0.3211423, -0.5517132, -0.977696, 1, 1, 1, 1, 1,
-0.3165662, 0.9299883, -0.1215109, 1, 1, 1, 1, 1,
-0.3119196, 0.7806373, -0.7401563, 1, 1, 1, 1, 1,
-0.3073235, 0.4665273, -1.450166, 1, 1, 1, 1, 1,
-0.3072746, -0.7228308, -2.535693, 1, 1, 1, 1, 1,
-0.3027821, 0.167951, -1.448782, 1, 1, 1, 1, 1,
-0.3022101, 0.7737255, 0.2253176, 1, 1, 1, 1, 1,
-0.3013392, 0.8299702, -0.3846681, 1, 1, 1, 1, 1,
-0.2984109, 0.3004056, 0.1230997, 1, 1, 1, 1, 1,
-0.2959963, 0.08606874, -0.645321, 1, 1, 1, 1, 1,
-0.2936393, -0.6453705, -4.119771, 1, 1, 1, 1, 1,
-0.2900455, 0.5320023, -1.337595, 1, 1, 1, 1, 1,
-0.289502, 0.7252886, 0.8290575, 0, 0, 1, 1, 1,
-0.2892119, 0.8224149, 1.054173, 1, 0, 0, 1, 1,
-0.2875424, 0.7726473, -0.9201456, 1, 0, 0, 1, 1,
-0.287118, -0.08726777, -0.3876477, 1, 0, 0, 1, 1,
-0.2856632, -0.7926696, -3.23957, 1, 0, 0, 1, 1,
-0.2809249, 0.4785701, 0.4363375, 1, 0, 0, 1, 1,
-0.2764001, -0.9732404, -3.92011, 0, 0, 0, 1, 1,
-0.2758735, 0.09985859, -2.859007, 0, 0, 0, 1, 1,
-0.2754869, 2.306485, -1.180958, 0, 0, 0, 1, 1,
-0.2751384, -1.590351, -3.130392, 0, 0, 0, 1, 1,
-0.2736956, 1.791035, -0.8207322, 0, 0, 0, 1, 1,
-0.2725041, -1.373067, -2.442601, 0, 0, 0, 1, 1,
-0.2707342, 1.891845, 0.03357296, 0, 0, 0, 1, 1,
-0.2701558, 0.6304504, -0.8922505, 1, 1, 1, 1, 1,
-0.2687069, 0.1530459, -1.626902, 1, 1, 1, 1, 1,
-0.2645613, 0.03888069, -1.204472, 1, 1, 1, 1, 1,
-0.2567771, 0.9088143, -0.133923, 1, 1, 1, 1, 1,
-0.2530526, -2.633069, -2.817872, 1, 1, 1, 1, 1,
-0.2522408, 0.7391565, 0.714177, 1, 1, 1, 1, 1,
-0.2517641, -1.063891, -4.193418, 1, 1, 1, 1, 1,
-0.2449248, 0.1778396, -0.6433416, 1, 1, 1, 1, 1,
-0.244561, -1.377341, -1.609188, 1, 1, 1, 1, 1,
-0.243218, -0.7012144, -1.788045, 1, 1, 1, 1, 1,
-0.2425124, 1.036884, 0.3407296, 1, 1, 1, 1, 1,
-0.2411369, -0.1950241, -2.40636, 1, 1, 1, 1, 1,
-0.2409784, 0.2133479, 0.4476977, 1, 1, 1, 1, 1,
-0.2358683, 1.632007, -0.1720195, 1, 1, 1, 1, 1,
-0.2347415, -0.1799567, -1.777002, 1, 1, 1, 1, 1,
-0.230425, 0.6729875, -1.288157, 0, 0, 1, 1, 1,
-0.2287405, 0.5420965, -1.310966, 1, 0, 0, 1, 1,
-0.2278989, -0.6699601, -1.539749, 1, 0, 0, 1, 1,
-0.2259701, -0.04767092, -0.5385147, 1, 0, 0, 1, 1,
-0.2235211, -0.9962516, -2.393624, 1, 0, 0, 1, 1,
-0.2223807, -1.053271, -4.881665, 1, 0, 0, 1, 1,
-0.2200818, 1.18082, -0.006693921, 0, 0, 0, 1, 1,
-0.2182611, -0.7247671, -4.118758, 0, 0, 0, 1, 1,
-0.2163032, -0.6189448, -3.249532, 0, 0, 0, 1, 1,
-0.2159033, 1.730917, -1.647993, 0, 0, 0, 1, 1,
-0.2101363, -0.8218758, -3.090961, 0, 0, 0, 1, 1,
-0.2045348, 0.523612, -0.06128758, 0, 0, 0, 1, 1,
-0.2015368, -0.4147678, -2.399002, 0, 0, 0, 1, 1,
-0.1996545, 1.060038, -0.4844141, 1, 1, 1, 1, 1,
-0.1973621, -0.07165661, -2.401796, 1, 1, 1, 1, 1,
-0.197188, -0.1346119, -1.259033, 1, 1, 1, 1, 1,
-0.1942913, 0.8629395, 1.268976, 1, 1, 1, 1, 1,
-0.1940989, 2.074901, 0.9636971, 1, 1, 1, 1, 1,
-0.1907594, 0.1874928, -0.4673604, 1, 1, 1, 1, 1,
-0.1883027, 1.033511, -0.9731765, 1, 1, 1, 1, 1,
-0.1865885, -0.3907329, -2.115205, 1, 1, 1, 1, 1,
-0.1838804, -0.7005266, -2.958673, 1, 1, 1, 1, 1,
-0.1835535, 0.02890418, -1.236613, 1, 1, 1, 1, 1,
-0.1818105, 1.723476, -0.151027, 1, 1, 1, 1, 1,
-0.1765867, -0.2105343, -1.134112, 1, 1, 1, 1, 1,
-0.1745554, -1.237076, -4.096962, 1, 1, 1, 1, 1,
-0.1720587, 0.06299653, -2.927758, 1, 1, 1, 1, 1,
-0.1717608, 0.3209166, -0.9332755, 1, 1, 1, 1, 1,
-0.1688917, 0.02595541, -2.081167, 0, 0, 1, 1, 1,
-0.1664667, 0.6740438, 0.4642565, 1, 0, 0, 1, 1,
-0.1656069, 0.111076, -2.068485, 1, 0, 0, 1, 1,
-0.1648446, -0.9512485, -4.130842, 1, 0, 0, 1, 1,
-0.1643824, -0.2938011, -0.9267586, 1, 0, 0, 1, 1,
-0.1638557, -1.289043, -2.356924, 1, 0, 0, 1, 1,
-0.1632983, 0.8933559, -0.6777685, 0, 0, 0, 1, 1,
-0.1560872, -0.9223756, -2.799319, 0, 0, 0, 1, 1,
-0.1514066, 0.1824306, 3.216341, 0, 0, 0, 1, 1,
-0.1490854, -0.1893165, -1.871886, 0, 0, 0, 1, 1,
-0.1375504, -1.564344, -2.483089, 0, 0, 0, 1, 1,
-0.1362685, -1.599395, -1.695989, 0, 0, 0, 1, 1,
-0.1322451, -0.9511556, -1.195137, 0, 0, 0, 1, 1,
-0.1321864, -1.283535, -0.5167392, 1, 1, 1, 1, 1,
-0.1308513, 0.3495604, 0.8549442, 1, 1, 1, 1, 1,
-0.1275072, -1.392199, -4.392856, 1, 1, 1, 1, 1,
-0.1270627, -0.3713209, -4.238457, 1, 1, 1, 1, 1,
-0.1254114, -0.8216887, -4.237026, 1, 1, 1, 1, 1,
-0.1224315, -1.101623, -2.942238, 1, 1, 1, 1, 1,
-0.1219305, 0.312728, -0.591632, 1, 1, 1, 1, 1,
-0.118056, 0.7401484, -1.731043, 1, 1, 1, 1, 1,
-0.1158972, 1.916022, 1.242138, 1, 1, 1, 1, 1,
-0.1149499, -1.510616, -2.28997, 1, 1, 1, 1, 1,
-0.1107808, 0.7890485, -0.3629771, 1, 1, 1, 1, 1,
-0.1079021, -0.3811711, -2.142784, 1, 1, 1, 1, 1,
-0.1069247, 2.241448, -0.4845566, 1, 1, 1, 1, 1,
-0.1059364, 0.3659639, -0.468139, 1, 1, 1, 1, 1,
-0.1059313, -0.1682683, -2.241761, 1, 1, 1, 1, 1,
-0.1043921, -0.1526881, -3.4411, 0, 0, 1, 1, 1,
-0.102591, -0.06568995, -0.4378735, 1, 0, 0, 1, 1,
-0.09681571, -0.2689963, -5.278988, 1, 0, 0, 1, 1,
-0.09620472, 3.142039, -0.589851, 1, 0, 0, 1, 1,
-0.09494395, -0.5684279, -3.359307, 1, 0, 0, 1, 1,
-0.09180056, -0.5312415, -3.604963, 1, 0, 0, 1, 1,
-0.08964022, 1.879379, -1.599366, 0, 0, 0, 1, 1,
-0.0839141, 0.08218219, -2.07583, 0, 0, 0, 1, 1,
-0.08177286, 0.5557967, -0.1977062, 0, 0, 0, 1, 1,
-0.07136761, -1.397156, -3.264816, 0, 0, 0, 1, 1,
-0.07025811, 0.1003195, -1.722253, 0, 0, 0, 1, 1,
-0.06614928, 1.029516, 0.3379843, 0, 0, 0, 1, 1,
-0.06598689, 1.581089, -0.7324467, 0, 0, 0, 1, 1,
-0.06519123, -0.2000549, -1.735366, 1, 1, 1, 1, 1,
-0.06437428, 0.3434254, 1.023648, 1, 1, 1, 1, 1,
-0.05957594, 0.8832497, -0.4397586, 1, 1, 1, 1, 1,
-0.05177716, 0.01959676, -2.672031, 1, 1, 1, 1, 1,
-0.04292516, 0.7862825, -0.07569761, 1, 1, 1, 1, 1,
-0.04270682, 2.075096, -0.6345171, 1, 1, 1, 1, 1,
-0.04085681, 1.218062, -1.072812, 1, 1, 1, 1, 1,
-0.03241243, 0.1358166, -0.3177776, 1, 1, 1, 1, 1,
-0.03207846, 0.0374385, -0.5925449, 1, 1, 1, 1, 1,
-0.02324, 1.371127, -1.489661, 1, 1, 1, 1, 1,
-0.02285598, -0.3119532, -3.552048, 1, 1, 1, 1, 1,
-0.01845139, 2.18696, -0.220663, 1, 1, 1, 1, 1,
-0.01821912, 0.1913961, 0.2810726, 1, 1, 1, 1, 1,
-0.01683764, 0.9797746, -0.3503653, 1, 1, 1, 1, 1,
-0.0141574, -0.4254821, -2.861057, 1, 1, 1, 1, 1,
-0.01252723, 0.5575195, 0.1759177, 0, 0, 1, 1, 1,
-0.01157519, 0.634586, -1.077126, 1, 0, 0, 1, 1,
-0.007150003, -1.056934, -2.293024, 1, 0, 0, 1, 1,
-0.006657487, 0.6122739, -0.01696623, 1, 0, 0, 1, 1,
-0.005458424, 0.175929, 0.971761, 1, 0, 0, 1, 1,
0.0005328448, -1.026875, 1.565531, 1, 0, 0, 1, 1,
0.002096512, -0.8413029, 2.558585, 0, 0, 0, 1, 1,
0.007813546, 0.5389768, -1.431383, 0, 0, 0, 1, 1,
0.01285148, -0.393894, 4.266475, 0, 0, 0, 1, 1,
0.01728335, 1.02195, 0.6450203, 0, 0, 0, 1, 1,
0.02062418, -0.5443758, 3.661186, 0, 0, 0, 1, 1,
0.02156762, -1.429577, 3.342505, 0, 0, 0, 1, 1,
0.0218858, -0.3412378, 1.270453, 0, 0, 0, 1, 1,
0.02900943, 2.289433, -0.02527128, 1, 1, 1, 1, 1,
0.03292074, 0.833764, -0.2612448, 1, 1, 1, 1, 1,
0.03668534, -1.136711, 1.966441, 1, 1, 1, 1, 1,
0.03918435, -0.9825737, 1.806488, 1, 1, 1, 1, 1,
0.04093565, 1.469569, 0.608915, 1, 1, 1, 1, 1,
0.04328774, 1.496996, -0.7040156, 1, 1, 1, 1, 1,
0.04395732, -0.9306108, 2.903349, 1, 1, 1, 1, 1,
0.04811629, -0.202852, 2.271119, 1, 1, 1, 1, 1,
0.04892434, -1.571641, 4.67429, 1, 1, 1, 1, 1,
0.05590675, -0.2010046, 2.725237, 1, 1, 1, 1, 1,
0.05665519, 0.3088303, 0.4677874, 1, 1, 1, 1, 1,
0.05681788, 0.3554337, -0.1243771, 1, 1, 1, 1, 1,
0.05717403, 0.6134916, -1.894098, 1, 1, 1, 1, 1,
0.05725086, 1.57819, 0.7828078, 1, 1, 1, 1, 1,
0.06313365, -0.2769949, 2.232043, 1, 1, 1, 1, 1,
0.06336237, 0.3336781, -0.1227641, 0, 0, 1, 1, 1,
0.06365727, 0.9023318, 0.1572435, 1, 0, 0, 1, 1,
0.06842937, -1.122091, 1.831511, 1, 0, 0, 1, 1,
0.06857465, 0.7307026, 1.760469, 1, 0, 0, 1, 1,
0.07045539, 1.568936, -1.054966, 1, 0, 0, 1, 1,
0.07499911, -1.288523, 2.244371, 1, 0, 0, 1, 1,
0.07809171, -0.009626104, 2.95786, 0, 0, 0, 1, 1,
0.07927136, 0.4657526, 0.03296453, 0, 0, 0, 1, 1,
0.07951608, 0.578485, 0.7180971, 0, 0, 0, 1, 1,
0.0799001, -0.6348975, 2.935462, 0, 0, 0, 1, 1,
0.08068014, -0.9161607, 4.362656, 0, 0, 0, 1, 1,
0.08131777, -1.108917, 0.7730306, 0, 0, 0, 1, 1,
0.08384287, 0.5211482, 0.7845186, 0, 0, 0, 1, 1,
0.08457307, 1.462736, 2.140421, 1, 1, 1, 1, 1,
0.08679958, 0.4481873, -0.7269284, 1, 1, 1, 1, 1,
0.08692583, -1.2806, 2.716572, 1, 1, 1, 1, 1,
0.08880956, 1.447157, -0.6532775, 1, 1, 1, 1, 1,
0.09133067, -1.223101, 2.019948, 1, 1, 1, 1, 1,
0.09202702, -1.445773, 3.539467, 1, 1, 1, 1, 1,
0.09321033, -0.65289, 2.17377, 1, 1, 1, 1, 1,
0.09348799, -1.904851, 3.240338, 1, 1, 1, 1, 1,
0.1010285, 1.96514, 1.356441, 1, 1, 1, 1, 1,
0.1015265, -0.4718193, 1.469217, 1, 1, 1, 1, 1,
0.1023441, 2.862437, 1.440926, 1, 1, 1, 1, 1,
0.1035603, -0.4796599, 1.886959, 1, 1, 1, 1, 1,
0.1044225, -0.5603031, 3.011271, 1, 1, 1, 1, 1,
0.1048302, -2.453508, 2.670008, 1, 1, 1, 1, 1,
0.1057845, -0.3610481, 4.604926, 1, 1, 1, 1, 1,
0.1070518, 0.05907637, 1.406151, 0, 0, 1, 1, 1,
0.1166293, -0.597663, 1.888052, 1, 0, 0, 1, 1,
0.1169395, -2.608427, 3.537694, 1, 0, 0, 1, 1,
0.1175957, 0.6407558, 2.265479, 1, 0, 0, 1, 1,
0.1198974, -0.1293834, 3.501088, 1, 0, 0, 1, 1,
0.1199573, -0.4019942, 2.603193, 1, 0, 0, 1, 1,
0.1230467, 1.353954, -1.813153, 0, 0, 0, 1, 1,
0.1251067, -0.02403078, 1.094464, 0, 0, 0, 1, 1,
0.1254512, -0.8092765, 2.845576, 0, 0, 0, 1, 1,
0.1295833, 0.9865674, 0.2648864, 0, 0, 0, 1, 1,
0.130267, 0.7490039, 0.3605682, 0, 0, 0, 1, 1,
0.1352681, 0.6927213, 0.3354155, 0, 0, 0, 1, 1,
0.138483, -2.036978, 5.197001, 0, 0, 0, 1, 1,
0.1389948, 0.4684374, 1.546305, 1, 1, 1, 1, 1,
0.1483682, 0.6482975, -0.7368287, 1, 1, 1, 1, 1,
0.1524711, 1.457651, 1.671547, 1, 1, 1, 1, 1,
0.1528927, -0.1271959, 2.643936, 1, 1, 1, 1, 1,
0.1530087, 0.9706777, -0.3733962, 1, 1, 1, 1, 1,
0.1530778, 0.2067967, 0.6311693, 1, 1, 1, 1, 1,
0.1532742, -0.08642706, 2.889401, 1, 1, 1, 1, 1,
0.1623166, 0.3462796, 0.8593493, 1, 1, 1, 1, 1,
0.1654765, -1.538042, 3.043622, 1, 1, 1, 1, 1,
0.1687628, -0.3462979, 2.8146, 1, 1, 1, 1, 1,
0.1723238, -0.1677392, 1.452559, 1, 1, 1, 1, 1,
0.1726032, -0.4542368, 2.339088, 1, 1, 1, 1, 1,
0.1773744, 2.109078, 1.156764, 1, 1, 1, 1, 1,
0.1814684, -1.485923, 3.389241, 1, 1, 1, 1, 1,
0.1818245, 2.977164, 0.5615745, 1, 1, 1, 1, 1,
0.1820172, 1.902032, 0.3123523, 0, 0, 1, 1, 1,
0.1831533, -0.8261898, 2.291152, 1, 0, 0, 1, 1,
0.1843096, 1.177147, -0.2100349, 1, 0, 0, 1, 1,
0.1921607, 0.4374274, 1.510994, 1, 0, 0, 1, 1,
0.1953905, 1.015541, -0.7818308, 1, 0, 0, 1, 1,
0.1971676, -0.470068, 2.779393, 1, 0, 0, 1, 1,
0.2002928, 0.2957854, 0.9779856, 0, 0, 0, 1, 1,
0.2029, 0.7853543, -0.6817095, 0, 0, 0, 1, 1,
0.2071305, 0.1907115, 0.8315009, 0, 0, 0, 1, 1,
0.2080817, 0.7226045, 0.9294318, 0, 0, 0, 1, 1,
0.208559, 0.4489028, 0.09554098, 0, 0, 0, 1, 1,
0.2130887, -1.260605, 3.878048, 0, 0, 0, 1, 1,
0.2157684, 0.8719687, -0.2051479, 0, 0, 0, 1, 1,
0.2211111, -0.4101506, 1.946693, 1, 1, 1, 1, 1,
0.2226049, 0.427285, 0.5034765, 1, 1, 1, 1, 1,
0.2241153, 0.8722134, 1.766654, 1, 1, 1, 1, 1,
0.2243274, -0.1714584, 2.684722, 1, 1, 1, 1, 1,
0.2294765, 0.06784053, 1.601954, 1, 1, 1, 1, 1,
0.233072, 0.2312119, -0.7661643, 1, 1, 1, 1, 1,
0.2418761, -0.02516384, 2.209127, 1, 1, 1, 1, 1,
0.2426742, -0.4803693, 2.976959, 1, 1, 1, 1, 1,
0.2448347, -0.3875618, 2.328598, 1, 1, 1, 1, 1,
0.2479199, -1.50273, 2.078836, 1, 1, 1, 1, 1,
0.2538904, -0.2075483, 3.329861, 1, 1, 1, 1, 1,
0.2548797, 0.03596695, 0.2122063, 1, 1, 1, 1, 1,
0.2549456, -1.026985, 5.398971, 1, 1, 1, 1, 1,
0.2561625, -0.607092, 2.542434, 1, 1, 1, 1, 1,
0.2611876, 0.4249419, -0.5404387, 1, 1, 1, 1, 1,
0.2612541, 0.2327221, -0.8175908, 0, 0, 1, 1, 1,
0.2650925, -0.8055912, 2.108446, 1, 0, 0, 1, 1,
0.2684174, 0.3574846, -0.9137564, 1, 0, 0, 1, 1,
0.2693939, 0.4527906, 1.769145, 1, 0, 0, 1, 1,
0.2706901, 0.4653823, -0.2850968, 1, 0, 0, 1, 1,
0.2729965, -0.7490517, 3.417688, 1, 0, 0, 1, 1,
0.2730762, -1.295286, 3.164414, 0, 0, 0, 1, 1,
0.274682, 0.5569249, 0.3153628, 0, 0, 0, 1, 1,
0.2750752, -0.5168283, 1.763995, 0, 0, 0, 1, 1,
0.2790233, -0.09205214, 2.890906, 0, 0, 0, 1, 1,
0.2791317, -0.9569803, 1.664171, 0, 0, 0, 1, 1,
0.2860509, 0.8057217, 1.53591, 0, 0, 0, 1, 1,
0.290225, -1.200065, 1.632194, 0, 0, 0, 1, 1,
0.2948059, -0.6454163, 2.189475, 1, 1, 1, 1, 1,
0.2950771, -0.3854271, 1.801553, 1, 1, 1, 1, 1,
0.2976416, -0.447116, 1.945031, 1, 1, 1, 1, 1,
0.2978486, 0.1694248, 0.2468034, 1, 1, 1, 1, 1,
0.3026406, 0.2979454, 0.8635821, 1, 1, 1, 1, 1,
0.3041325, 0.6754437, -0.2957477, 1, 1, 1, 1, 1,
0.3088403, -1.422737, 4.173461, 1, 1, 1, 1, 1,
0.3088548, -0.6727607, 3.258098, 1, 1, 1, 1, 1,
0.3150504, 1.271999, 1.284162, 1, 1, 1, 1, 1,
0.317377, -0.007232973, -0.02346597, 1, 1, 1, 1, 1,
0.3229662, -0.6641143, 3.153677, 1, 1, 1, 1, 1,
0.3255139, -0.1198729, 1.711534, 1, 1, 1, 1, 1,
0.3261522, 0.9684784, 0.1443771, 1, 1, 1, 1, 1,
0.3272273, 0.7021276, -1.716177, 1, 1, 1, 1, 1,
0.3275122, 0.7476221, 1.38931, 1, 1, 1, 1, 1,
0.329078, -1.182563, 3.628205, 0, 0, 1, 1, 1,
0.3292958, -1.381756, 4.561806, 1, 0, 0, 1, 1,
0.3320637, 0.5507212, 1.736564, 1, 0, 0, 1, 1,
0.3343506, -0.6764818, 4.153391, 1, 0, 0, 1, 1,
0.3344324, 0.2510909, -0.3148892, 1, 0, 0, 1, 1,
0.33512, -0.745605, 2.815999, 1, 0, 0, 1, 1,
0.3378301, -0.6759253, 3.614166, 0, 0, 0, 1, 1,
0.3391047, -0.2416497, 3.356547, 0, 0, 0, 1, 1,
0.3467782, 0.1199017, 2.581628, 0, 0, 0, 1, 1,
0.355011, 0.5596598, 0.02898258, 0, 0, 0, 1, 1,
0.3585035, 0.2848429, 0.01489666, 0, 0, 0, 1, 1,
0.3642589, -0.5756891, 2.723669, 0, 0, 0, 1, 1,
0.3659369, -0.5729649, 2.845055, 0, 0, 0, 1, 1,
0.3769985, 0.07669083, 3.668186, 1, 1, 1, 1, 1,
0.3777621, 0.5474682, -0.1564488, 1, 1, 1, 1, 1,
0.3810984, 0.5394334, 0.8168088, 1, 1, 1, 1, 1,
0.3853386, 0.739902, 1.093705, 1, 1, 1, 1, 1,
0.3863079, 1.208857, 0.8444725, 1, 1, 1, 1, 1,
0.3864502, -1.824016, 2.354237, 1, 1, 1, 1, 1,
0.3865379, -1.125313, 4.370858, 1, 1, 1, 1, 1,
0.3932592, -0.4535477, 2.731733, 1, 1, 1, 1, 1,
0.3948166, -2.408397, 1.438156, 1, 1, 1, 1, 1,
0.3950656, 0.928978, 0.7483525, 1, 1, 1, 1, 1,
0.4012142, 0.06065864, 2.348911, 1, 1, 1, 1, 1,
0.4034612, -0.1899203, 1.650971, 1, 1, 1, 1, 1,
0.4046666, -1.658638, 1.023499, 1, 1, 1, 1, 1,
0.4101506, -0.7092568, 3.478018, 1, 1, 1, 1, 1,
0.4117858, -0.1835815, 0.9253174, 1, 1, 1, 1, 1,
0.4142837, -0.31082, 2.64752, 0, 0, 1, 1, 1,
0.4157536, -0.9139382, 4.111388, 1, 0, 0, 1, 1,
0.4192837, 2.83739, 0.6503733, 1, 0, 0, 1, 1,
0.4277804, 1.349888, 2.339761, 1, 0, 0, 1, 1,
0.4375066, 0.8820527, -0.8870085, 1, 0, 0, 1, 1,
0.4379533, -0.4565238, 3.119778, 1, 0, 0, 1, 1,
0.4448134, -0.6901162, 1.699631, 0, 0, 0, 1, 1,
0.4489187, -0.7718837, 1.711536, 0, 0, 0, 1, 1,
0.4495088, -0.6034737, 2.897045, 0, 0, 0, 1, 1,
0.4500974, 0.4453095, 1.383121, 0, 0, 0, 1, 1,
0.4504578, 0.4449018, 1.455847, 0, 0, 0, 1, 1,
0.4515446, 2.483732, 1.565503, 0, 0, 0, 1, 1,
0.4526331, 0.17052, 2.90851, 0, 0, 0, 1, 1,
0.4564187, -0.6583441, 2.939593, 1, 1, 1, 1, 1,
0.4572405, 0.1725573, 2.190738, 1, 1, 1, 1, 1,
0.4586127, -0.5325868, 1.68309, 1, 1, 1, 1, 1,
0.4607853, 0.5998379, 0.00806844, 1, 1, 1, 1, 1,
0.4656198, -0.6775521, 1.551768, 1, 1, 1, 1, 1,
0.4668516, -0.3095716, 1.732706, 1, 1, 1, 1, 1,
0.4675734, -0.8989324, 2.079589, 1, 1, 1, 1, 1,
0.4709264, -1.436118, 2.632599, 1, 1, 1, 1, 1,
0.4735602, -0.9238518, 1.433194, 1, 1, 1, 1, 1,
0.4740024, -1.635714, 2.968303, 1, 1, 1, 1, 1,
0.4743484, -0.6112336, 1.432487, 1, 1, 1, 1, 1,
0.4791473, 0.5008067, 0.2858731, 1, 1, 1, 1, 1,
0.4857717, 1.265384, 1.024295, 1, 1, 1, 1, 1,
0.4864832, -0.352367, 2.499962, 1, 1, 1, 1, 1,
0.4879183, -0.2729994, 0.9142584, 1, 1, 1, 1, 1,
0.4892322, -0.3251614, 3.506645, 0, 0, 1, 1, 1,
0.4907773, 0.04472788, 0.6602375, 1, 0, 0, 1, 1,
0.4989457, 0.3017243, 0.02577956, 1, 0, 0, 1, 1,
0.5012594, 0.6313101, -0.09455179, 1, 0, 0, 1, 1,
0.5021461, 0.3674971, 1.033971, 1, 0, 0, 1, 1,
0.503086, 0.585648, 0.8840488, 1, 0, 0, 1, 1,
0.5034362, 1.238979, -0.2590642, 0, 0, 0, 1, 1,
0.5045683, 0.3152418, 1.79257, 0, 0, 0, 1, 1,
0.5052062, -0.1959774, 1.935811, 0, 0, 0, 1, 1,
0.5081426, -0.3814739, 3.067463, 0, 0, 0, 1, 1,
0.5103498, -0.8139346, 2.895983, 0, 0, 0, 1, 1,
0.5181118, -1.538835, 3.827946, 0, 0, 0, 1, 1,
0.5234273, -0.2051123, 0.9153284, 0, 0, 0, 1, 1,
0.525088, 0.1447414, 1.951103, 1, 1, 1, 1, 1,
0.5274031, 0.7815554, 0.6843696, 1, 1, 1, 1, 1,
0.527521, -1.2681, 3.276429, 1, 1, 1, 1, 1,
0.5292177, 0.02884644, 0.9791155, 1, 1, 1, 1, 1,
0.5299798, -0.1119071, 2.994872, 1, 1, 1, 1, 1,
0.5335749, -1.077195, 3.419212, 1, 1, 1, 1, 1,
0.5364141, 0.3194443, 1.060513, 1, 1, 1, 1, 1,
0.5386039, 1.281678, -1.523668, 1, 1, 1, 1, 1,
0.5401365, 1.456822, -0.6825719, 1, 1, 1, 1, 1,
0.541659, 1.746955, 2.450805, 1, 1, 1, 1, 1,
0.5448487, -0.3968155, 3.920491, 1, 1, 1, 1, 1,
0.556577, 0.4594668, 1.41222, 1, 1, 1, 1, 1,
0.5568864, -1.341636, 1.732597, 1, 1, 1, 1, 1,
0.5599648, -0.7471631, 3.185866, 1, 1, 1, 1, 1,
0.5660283, -0.04624522, 2.521784, 1, 1, 1, 1, 1,
0.5668627, 1.43454, 0.1636971, 0, 0, 1, 1, 1,
0.5693158, 0.61725, 1.237199, 1, 0, 0, 1, 1,
0.569416, 0.05156566, 2.687808, 1, 0, 0, 1, 1,
0.5840632, -0.9026977, 4.070419, 1, 0, 0, 1, 1,
0.5870392, -2.108783, 1.871935, 1, 0, 0, 1, 1,
0.5929701, -0.3119711, 2.449057, 1, 0, 0, 1, 1,
0.5976157, -0.3455859, 1.174278, 0, 0, 0, 1, 1,
0.6014074, 0.2875902, 0.9298918, 0, 0, 0, 1, 1,
0.6041003, -2.035935, 2.865159, 0, 0, 0, 1, 1,
0.6050144, 0.349508, 0.8365834, 0, 0, 0, 1, 1,
0.6115428, 0.5890426, -0.04275535, 0, 0, 0, 1, 1,
0.6150945, 1.289208, -0.645714, 0, 0, 0, 1, 1,
0.6164223, 1.245844, 1.198442, 0, 0, 0, 1, 1,
0.6203179, 1.424394, 1.304227, 1, 1, 1, 1, 1,
0.6208646, -0.9694957, 1.868424, 1, 1, 1, 1, 1,
0.6252212, -0.2327995, 1.778401, 1, 1, 1, 1, 1,
0.6343986, 0.3337055, 0.230643, 1, 1, 1, 1, 1,
0.6368497, -1.232219, 2.554143, 1, 1, 1, 1, 1,
0.6428794, -2.785009, 2.096884, 1, 1, 1, 1, 1,
0.6446411, 2.340636, 1.445764, 1, 1, 1, 1, 1,
0.6456151, -0.07688301, 0.4318242, 1, 1, 1, 1, 1,
0.6469596, -0.6622334, 3.639893, 1, 1, 1, 1, 1,
0.6527589, 0.2073486, 1.453059, 1, 1, 1, 1, 1,
0.654399, -0.4593721, 3.99887, 1, 1, 1, 1, 1,
0.6555315, -1.390549, 2.435903, 1, 1, 1, 1, 1,
0.6563985, -1.338391, 3.851888, 1, 1, 1, 1, 1,
0.6578621, 0.5030763, -0.6477242, 1, 1, 1, 1, 1,
0.6583368, 0.9614958, 0.947566, 1, 1, 1, 1, 1,
0.6599467, 0.339568, 1.578072, 0, 0, 1, 1, 1,
0.6661607, 0.988264, 0.6008119, 1, 0, 0, 1, 1,
0.6679555, -1.808397, 3.133249, 1, 0, 0, 1, 1,
0.6718043, 0.3431635, -0.6375504, 1, 0, 0, 1, 1,
0.6744351, -1.196503, 2.704405, 1, 0, 0, 1, 1,
0.6771109, 1.594693, 0.407298, 1, 0, 0, 1, 1,
0.6772626, 1.707542, 0.6967506, 0, 0, 0, 1, 1,
0.678925, 0.6716582, -0.5901954, 0, 0, 0, 1, 1,
0.6844098, -1.66939, 4.03848, 0, 0, 0, 1, 1,
0.6868785, -0.2218857, 2.059756, 0, 0, 0, 1, 1,
0.6885098, -0.8392748, 2.556802, 0, 0, 0, 1, 1,
0.6886055, 0.1829105, 1.701783, 0, 0, 0, 1, 1,
0.6894415, -0.1982002, 0.9627562, 0, 0, 0, 1, 1,
0.692263, 0.8753518, 0.9418107, 1, 1, 1, 1, 1,
0.6926137, -0.02094855, -0.05098169, 1, 1, 1, 1, 1,
0.6964201, -0.2056574, 2.796975, 1, 1, 1, 1, 1,
0.701683, 0.6261293, 1.526272, 1, 1, 1, 1, 1,
0.7032207, -0.1530453, 3.99607, 1, 1, 1, 1, 1,
0.7087452, -0.5396938, 2.473001, 1, 1, 1, 1, 1,
0.7120553, 0.02945169, -1.14179, 1, 1, 1, 1, 1,
0.7128522, 1.198343, 2.038646, 1, 1, 1, 1, 1,
0.7244866, -0.6037868, 2.921355, 1, 1, 1, 1, 1,
0.7266992, 0.4308776, 0.5356436, 1, 1, 1, 1, 1,
0.7305122, -1.620557, 4.447694, 1, 1, 1, 1, 1,
0.738568, 1.339635, 0.7407892, 1, 1, 1, 1, 1,
0.7386065, -1.894697, 1.97786, 1, 1, 1, 1, 1,
0.7409089, -0.6768491, 2.163872, 1, 1, 1, 1, 1,
0.7435959, -0.1348033, 2.594795, 1, 1, 1, 1, 1,
0.7446781, 1.344938, 0.7918698, 0, 0, 1, 1, 1,
0.7449133, -0.1250543, 0.172488, 1, 0, 0, 1, 1,
0.7489172, 0.238454, 1.410713, 1, 0, 0, 1, 1,
0.7595271, -0.144275, 1.942796, 1, 0, 0, 1, 1,
0.7618199, -0.6619201, 2.933005, 1, 0, 0, 1, 1,
0.7639785, -0.3911904, 2.521621, 1, 0, 0, 1, 1,
0.768452, 0.3365821, 0.2238142, 0, 0, 0, 1, 1,
0.7685949, 0.6876645, 0.7709942, 0, 0, 0, 1, 1,
0.7687017, 1.269404, 0.1033845, 0, 0, 0, 1, 1,
0.769482, 2.524646, 0.1627221, 0, 0, 0, 1, 1,
0.7783996, 1.067575, 2.19335, 0, 0, 0, 1, 1,
0.783968, 0.8273613, -0.2600127, 0, 0, 0, 1, 1,
0.7842214, 0.2983859, 0.1374433, 0, 0, 0, 1, 1,
0.78495, -0.4946737, 0.447056, 1, 1, 1, 1, 1,
0.7871353, -2.01404, 2.091147, 1, 1, 1, 1, 1,
0.7887844, 0.1389649, 0.07710238, 1, 1, 1, 1, 1,
0.7912269, 0.5059994, 1.50329, 1, 1, 1, 1, 1,
0.7930652, -1.717126, 2.672039, 1, 1, 1, 1, 1,
0.7959602, -0.06811298, 1.262118, 1, 1, 1, 1, 1,
0.7974553, 0.7927211, -0.3923483, 1, 1, 1, 1, 1,
0.8065677, -1.23379, 3.525863, 1, 1, 1, 1, 1,
0.8074502, 0.5459755, 1.199588, 1, 1, 1, 1, 1,
0.8092659, -0.8182247, 3.291964, 1, 1, 1, 1, 1,
0.8102733, 0.7036256, 0.4305968, 1, 1, 1, 1, 1,
0.8126781, 0.6379182, 1.577644, 1, 1, 1, 1, 1,
0.8131281, -1.046112, 2.569177, 1, 1, 1, 1, 1,
0.8159692, 0.7983326, 2.217246, 1, 1, 1, 1, 1,
0.8210813, 0.08836918, 0.9764313, 1, 1, 1, 1, 1,
0.8221538, -0.4194705, 0.7986222, 0, 0, 1, 1, 1,
0.8239115, -0.056371, 0.6262941, 1, 0, 0, 1, 1,
0.8267516, -0.3091502, 1.824765, 1, 0, 0, 1, 1,
0.829379, 1.748223, 0.7587922, 1, 0, 0, 1, 1,
0.8298113, -0.6251836, 1.363063, 1, 0, 0, 1, 1,
0.8338207, 1.885439, 1.225711, 1, 0, 0, 1, 1,
0.8414105, -0.05526621, 2.502832, 0, 0, 0, 1, 1,
0.8432164, 0.8859326, 0.117572, 0, 0, 0, 1, 1,
0.8472109, -1.145649, 3.425598, 0, 0, 0, 1, 1,
0.8494155, 0.5717715, 2.129875, 0, 0, 0, 1, 1,
0.8507096, -0.7698699, 1.362015, 0, 0, 0, 1, 1,
0.8514566, 1.704247, 1.863056, 0, 0, 0, 1, 1,
0.8587888, 0.1762765, 1.975457, 0, 0, 0, 1, 1,
0.8612569, 0.4420904, 1.172596, 1, 1, 1, 1, 1,
0.8617967, 0.3994625, 2.114823, 1, 1, 1, 1, 1,
0.8640125, -1.566684, 4.766317, 1, 1, 1, 1, 1,
0.8750774, -0.7856078, 3.596952, 1, 1, 1, 1, 1,
0.8844097, -1.744794, 2.135171, 1, 1, 1, 1, 1,
0.887189, -0.2985098, 1.777463, 1, 1, 1, 1, 1,
0.8994516, -2.130482, 1.14862, 1, 1, 1, 1, 1,
0.901311, 2.004371, 0.01330742, 1, 1, 1, 1, 1,
0.9058222, 1.057115, -0.2149783, 1, 1, 1, 1, 1,
0.9120962, -0.9841666, 2.923311, 1, 1, 1, 1, 1,
0.9134347, -0.3761408, 1.709682, 1, 1, 1, 1, 1,
0.9165519, -0.3761219, 1.492641, 1, 1, 1, 1, 1,
0.9171836, 1.001628, 1.151721, 1, 1, 1, 1, 1,
0.9180719, 0.2314682, 1.93136, 1, 1, 1, 1, 1,
0.9184107, 0.8383447, 0.6733985, 1, 1, 1, 1, 1,
0.9208118, 0.5938413, -0.2592572, 0, 0, 1, 1, 1,
0.9242533, 0.9915448, 0.1520949, 1, 0, 0, 1, 1,
0.9314612, -0.6453069, 3.935198, 1, 0, 0, 1, 1,
0.9320467, 0.3720382, 0.8929301, 1, 0, 0, 1, 1,
0.9524642, 0.4968563, 2.018798, 1, 0, 0, 1, 1,
0.9571625, 0.3907427, 1.314108, 1, 0, 0, 1, 1,
0.9604933, 0.3175854, 3.222815, 0, 0, 0, 1, 1,
0.9711751, -0.8886027, 3.030959, 0, 0, 0, 1, 1,
0.9737077, 0.7726467, 0.02825058, 0, 0, 0, 1, 1,
0.9880618, 0.3150368, 0.8874407, 0, 0, 0, 1, 1,
0.9944699, -0.9509, 3.618726, 0, 0, 0, 1, 1,
0.9956594, -0.5139796, 1.83064, 0, 0, 0, 1, 1,
0.9962485, -0.5673449, 1.973923, 0, 0, 0, 1, 1,
1.014592, -0.1935057, 0.6647467, 1, 1, 1, 1, 1,
1.01729, -0.4172736, 0.3210192, 1, 1, 1, 1, 1,
1.018685, 1.013654, 3.196526, 1, 1, 1, 1, 1,
1.021219, -0.2164304, 0.878445, 1, 1, 1, 1, 1,
1.02906, 0.9686756, 0.5964634, 1, 1, 1, 1, 1,
1.034868, 1.263774, 0.7216291, 1, 1, 1, 1, 1,
1.043901, -0.4250255, 4.20296, 1, 1, 1, 1, 1,
1.048362, 0.8638836, 0.9385926, 1, 1, 1, 1, 1,
1.051371, -1.306069, 1.666522, 1, 1, 1, 1, 1,
1.052133, -0.3418707, 3.285369, 1, 1, 1, 1, 1,
1.053864, -1.182738, 2.469846, 1, 1, 1, 1, 1,
1.056597, 1.102335, 0.2439865, 1, 1, 1, 1, 1,
1.056815, 0.173664, 2.758521, 1, 1, 1, 1, 1,
1.070166, 0.6367951, 0.5262787, 1, 1, 1, 1, 1,
1.079579, -0.2444533, 2.023987, 1, 1, 1, 1, 1,
1.081564, 0.7638059, 0.2619872, 0, 0, 1, 1, 1,
1.083979, 0.6750947, 0.03737459, 1, 0, 0, 1, 1,
1.084705, -0.3125124, 2.76106, 1, 0, 0, 1, 1,
1.087299, 0.8048277, 2.379255, 1, 0, 0, 1, 1,
1.087778, 0.08457696, 0.9287168, 1, 0, 0, 1, 1,
1.088421, 0.7929531, 1.265336, 1, 0, 0, 1, 1,
1.089059, -1.22324, 2.858893, 0, 0, 0, 1, 1,
1.089795, 0.1903532, 1.529571, 0, 0, 0, 1, 1,
1.092333, 0.007060539, 1.711487, 0, 0, 0, 1, 1,
1.098229, 1.181616, 0.2663353, 0, 0, 0, 1, 1,
1.10313, -0.9769016, 1.728309, 0, 0, 0, 1, 1,
1.117912, -0.3421577, 2.149807, 0, 0, 0, 1, 1,
1.123424, -0.6625963, 1.90627, 0, 0, 0, 1, 1,
1.128563, -1.796412, 3.267582, 1, 1, 1, 1, 1,
1.128916, -0.8076326, 1.1621, 1, 1, 1, 1, 1,
1.138021, -0.2833051, 0.007791887, 1, 1, 1, 1, 1,
1.153786, 1.705092, 1.09458, 1, 1, 1, 1, 1,
1.15912, -0.02137903, 0.7872168, 1, 1, 1, 1, 1,
1.164472, -0.9579681, 0.8550513, 1, 1, 1, 1, 1,
1.170542, 0.1622361, 1.988429, 1, 1, 1, 1, 1,
1.170844, 0.9440644, 2.027408, 1, 1, 1, 1, 1,
1.172027, 0.2860213, 0.8536332, 1, 1, 1, 1, 1,
1.172714, -2.19126, 3.103709, 1, 1, 1, 1, 1,
1.17465, -0.6635948, 1.580871, 1, 1, 1, 1, 1,
1.177031, 0.8094059, 0.9145753, 1, 1, 1, 1, 1,
1.185451, 1.904822, 1.140165, 1, 1, 1, 1, 1,
1.192672, 1.503409, 1.799198, 1, 1, 1, 1, 1,
1.20259, 0.08484324, 1.123002, 1, 1, 1, 1, 1,
1.21233, -0.5116913, 1.272236, 0, 0, 1, 1, 1,
1.216551, -1.489774, 1.241833, 1, 0, 0, 1, 1,
1.220047, -1.358344, 0.1324847, 1, 0, 0, 1, 1,
1.220356, -1.480692, 1.093758, 1, 0, 0, 1, 1,
1.222166, -0.752696, 3.404031, 1, 0, 0, 1, 1,
1.229675, -0.5614685, 3.754114, 1, 0, 0, 1, 1,
1.233978, -0.5715855, 0.8965645, 0, 0, 0, 1, 1,
1.234468, -0.3677597, 0.3673012, 0, 0, 0, 1, 1,
1.242192, 1.350793, 0.7194707, 0, 0, 0, 1, 1,
1.246493, -1.188235, 3.24543, 0, 0, 0, 1, 1,
1.247255, -0.8240488, 1.278126, 0, 0, 0, 1, 1,
1.248628, 0.211268, 2.446726, 0, 0, 0, 1, 1,
1.249228, 0.5420798, 1.697469, 0, 0, 0, 1, 1,
1.249344, 0.9270768, 1.166175, 1, 1, 1, 1, 1,
1.250167, 0.1663068, 1.771609, 1, 1, 1, 1, 1,
1.257405, -1.110586, 2.179077, 1, 1, 1, 1, 1,
1.258295, -0.1370998, 1.617222, 1, 1, 1, 1, 1,
1.268857, -1.124211, 2.949371, 1, 1, 1, 1, 1,
1.27066, -0.1997642, 1.586451, 1, 1, 1, 1, 1,
1.280277, -1.977771, 1.336691, 1, 1, 1, 1, 1,
1.306472, -1.178436, 2.15572, 1, 1, 1, 1, 1,
1.30741, 0.2726607, 1.753265, 1, 1, 1, 1, 1,
1.307895, -0.1528146, 2.221239, 1, 1, 1, 1, 1,
1.309968, -0.2586468, 1.541904, 1, 1, 1, 1, 1,
1.315008, 2.359918, 0.06796848, 1, 1, 1, 1, 1,
1.316163, -1.10379, 2.085551, 1, 1, 1, 1, 1,
1.317545, 0.6155343, -0.6016493, 1, 1, 1, 1, 1,
1.323904, 1.219622, 0.7559158, 1, 1, 1, 1, 1,
1.325898, 0.6378763, 1.055094, 0, 0, 1, 1, 1,
1.346467, -1.054848, 1.802164, 1, 0, 0, 1, 1,
1.348708, 2.367408, -1.280635, 1, 0, 0, 1, 1,
1.350247, 0.0001441315, 2.85947, 1, 0, 0, 1, 1,
1.351854, -0.981568, 2.384094, 1, 0, 0, 1, 1,
1.357246, -1.802718, 2.302083, 1, 0, 0, 1, 1,
1.373592, 0.1198724, 2.083382, 0, 0, 0, 1, 1,
1.405021, 0.3421406, 2.497052, 0, 0, 0, 1, 1,
1.410276, 1.505869, 1.50286, 0, 0, 0, 1, 1,
1.410284, -0.6656905, 1.525535, 0, 0, 0, 1, 1,
1.410523, 0.5061897, 1.308675, 0, 0, 0, 1, 1,
1.412594, 0.2631907, 0.1302073, 0, 0, 0, 1, 1,
1.426342, 0.9097646, 1.687891, 0, 0, 0, 1, 1,
1.435518, -0.2190401, 3.28116, 1, 1, 1, 1, 1,
1.442437, -0.2287322, 1.114473, 1, 1, 1, 1, 1,
1.450858, 0.2145658, 1.810313, 1, 1, 1, 1, 1,
1.451685, -1.969496, 4.591911, 1, 1, 1, 1, 1,
1.453366, -1.738826, 1.733836, 1, 1, 1, 1, 1,
1.454577, -0.5703644, 2.582185, 1, 1, 1, 1, 1,
1.458253, -0.02023161, 1.150161, 1, 1, 1, 1, 1,
1.458843, 0.5865726, 0.9859313, 1, 1, 1, 1, 1,
1.462293, -1.926767, 2.38465, 1, 1, 1, 1, 1,
1.474593, 1.341398, 1.694784, 1, 1, 1, 1, 1,
1.478704, 0.160554, 1.465993, 1, 1, 1, 1, 1,
1.482915, -0.002280221, 0.275235, 1, 1, 1, 1, 1,
1.486927, 1.292807, 2.490967, 1, 1, 1, 1, 1,
1.487324, 0.6264548, 1.456495, 1, 1, 1, 1, 1,
1.500371, -0.3236523, 0.8697771, 1, 1, 1, 1, 1,
1.501819, -0.4104027, 2.41479, 0, 0, 1, 1, 1,
1.507446, 0.122491, 1.248608, 1, 0, 0, 1, 1,
1.512458, 0.4504319, 2.052778, 1, 0, 0, 1, 1,
1.516928, 1.956519, 0.5944743, 1, 0, 0, 1, 1,
1.526486, 0.5204432, 2.196306, 1, 0, 0, 1, 1,
1.527532, 0.6390444, 2.393594, 1, 0, 0, 1, 1,
1.527639, -1.732167, 1.209902, 0, 0, 0, 1, 1,
1.529815, -0.6884411, 2.033703, 0, 0, 0, 1, 1,
1.536401, 0.9066595, 0.3113344, 0, 0, 0, 1, 1,
1.538193, 0.001172013, 3.237534, 0, 0, 0, 1, 1,
1.540597, 1.137699, 2.874518, 0, 0, 0, 1, 1,
1.540798, -1.038771, 0.3691932, 0, 0, 0, 1, 1,
1.544404, 0.06612022, 2.88816, 0, 0, 0, 1, 1,
1.544539, 0.589782, 0.01310488, 1, 1, 1, 1, 1,
1.549369, 0.6861432, 3.090264, 1, 1, 1, 1, 1,
1.551005, 0.3733855, 2.438306, 1, 1, 1, 1, 1,
1.555878, -0.8650424, 1.394449, 1, 1, 1, 1, 1,
1.564407, -1.827544, 2.165026, 1, 1, 1, 1, 1,
1.565004, 0.006572548, -0.02708622, 1, 1, 1, 1, 1,
1.571846, -1.396088, 3.066684, 1, 1, 1, 1, 1,
1.573924, -0.7871996, 2.264178, 1, 1, 1, 1, 1,
1.601829, 0.2079581, 0.2641455, 1, 1, 1, 1, 1,
1.607366, -0.4584709, 1.617013, 1, 1, 1, 1, 1,
1.630263, 2.288788, 1.445741, 1, 1, 1, 1, 1,
1.642439, -0.331303, 0.5511785, 1, 1, 1, 1, 1,
1.642696, -0.9096764, 3.106592, 1, 1, 1, 1, 1,
1.661676, -0.1608652, 3.399597, 1, 1, 1, 1, 1,
1.661775, -0.6868479, 1.475137, 1, 1, 1, 1, 1,
1.671379, 0.8318843, 1.961766, 0, 0, 1, 1, 1,
1.672851, 0.5453689, 1.682176, 1, 0, 0, 1, 1,
1.67836, -0.7677569, 1.998602, 1, 0, 0, 1, 1,
1.679873, -3.072659, 3.491874, 1, 0, 0, 1, 1,
1.712613, 0.7441558, 0.9126589, 1, 0, 0, 1, 1,
1.720515, -0.2266627, 1.996653, 1, 0, 0, 1, 1,
1.726346, 1.626309, -1.782373, 0, 0, 0, 1, 1,
1.732117, 0.9172265, 0.6602514, 0, 0, 0, 1, 1,
1.733102, -0.9157911, 3.873653, 0, 0, 0, 1, 1,
1.733434, 0.2352928, 2.6614, 0, 0, 0, 1, 1,
1.738904, -0.1219821, 2.009028, 0, 0, 0, 1, 1,
1.753002, 1.911171, 0.5248689, 0, 0, 0, 1, 1,
1.758502, 0.2372994, 1.446963, 0, 0, 0, 1, 1,
1.773094, 0.666824, 1.453287, 1, 1, 1, 1, 1,
1.782162, -0.2424622, 3.200135, 1, 1, 1, 1, 1,
1.78728, -0.8810917, 0.8451191, 1, 1, 1, 1, 1,
1.794701, 0.1038244, 3.020549, 1, 1, 1, 1, 1,
1.830552, 0.1622207, 2.229567, 1, 1, 1, 1, 1,
1.834395, -2.12825, 1.174646, 1, 1, 1, 1, 1,
1.868293, 0.2023016, 0.9072929, 1, 1, 1, 1, 1,
1.892674, -1.441167, 2.201825, 1, 1, 1, 1, 1,
1.899924, -0.5310904, 1.18168, 1, 1, 1, 1, 1,
1.908586, -0.9381067, 2.671602, 1, 1, 1, 1, 1,
1.918695, 0.3135643, 1.971572, 1, 1, 1, 1, 1,
1.91952, -1.165697, 1.567101, 1, 1, 1, 1, 1,
1.991953, -0.7352435, 1.699358, 1, 1, 1, 1, 1,
2.015403, -0.9912462, 1.176054, 1, 1, 1, 1, 1,
2.027701, 0.5005211, 0.1020483, 1, 1, 1, 1, 1,
2.050702, -1.076183, 3.270318, 0, 0, 1, 1, 1,
2.061343, -0.639825, 3.699612, 1, 0, 0, 1, 1,
2.075978, 0.2404759, 1.332145, 1, 0, 0, 1, 1,
2.106228, -0.9294857, 3.253747, 1, 0, 0, 1, 1,
2.114709, 0.9553995, -0.3639735, 1, 0, 0, 1, 1,
2.198082, 0.7636164, 1.509971, 1, 0, 0, 1, 1,
2.316463, 0.4623873, 3.217978, 0, 0, 0, 1, 1,
2.330218, 0.505785, 0.8070397, 0, 0, 0, 1, 1,
2.356496, 0.1375369, 1.3457, 0, 0, 0, 1, 1,
2.422376, -1.446286, 0.8108834, 0, 0, 0, 1, 1,
2.441059, -0.1308516, 1.489069, 0, 0, 0, 1, 1,
2.570156, -0.3747049, 2.486409, 0, 0, 0, 1, 1,
2.610197, 0.1785899, 1.554727, 0, 0, 0, 1, 1,
2.675188, -2.010266, 1.980966, 1, 1, 1, 1, 1,
2.743039, 2.016742, 1.663976, 1, 1, 1, 1, 1,
2.776943, -1.273545, 0.8054851, 1, 1, 1, 1, 1,
2.919218, -1.810275, 2.382566, 1, 1, 1, 1, 1,
3.058055, 0.03295233, 0.4874297, 1, 1, 1, 1, 1,
3.112802, -1.311136, 2.610233, 1, 1, 1, 1, 1,
3.124651, 0.348009, 2.843492, 1, 1, 1, 1, 1
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
var radius = 9.647886;
var distance = 33.88779;
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
mvMatrix.translate( 0.2395005, 0.06492591, -0.05999112 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.88779);
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
