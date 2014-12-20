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
-3.603082, -1.36586, -2.232049, 1, 0, 0, 1,
-3.371925, -0.06727134, -1.608593, 1, 0.007843138, 0, 1,
-2.984997, 0.8578488, -1.512068, 1, 0.01176471, 0, 1,
-2.732231, 0.1925233, -1.678375, 1, 0.01960784, 0, 1,
-2.596834, 0.617772, -0.7671813, 1, 0.02352941, 0, 1,
-2.591333, -1.191462, -0.6778125, 1, 0.03137255, 0, 1,
-2.526893, 1.185082, -0.8885228, 1, 0.03529412, 0, 1,
-2.52564, 0.3603906, -1.82521, 1, 0.04313726, 0, 1,
-2.466703, 0.2710858, -1.570504, 1, 0.04705882, 0, 1,
-2.464901, 0.5203452, -1.354598, 1, 0.05490196, 0, 1,
-2.457145, 0.1024033, 0.2278548, 1, 0.05882353, 0, 1,
-2.32779, -0.593302, -0.9513564, 1, 0.06666667, 0, 1,
-2.325189, 0.6360992, -1.687861, 1, 0.07058824, 0, 1,
-2.26546, -0.6243008, -0.9293271, 1, 0.07843138, 0, 1,
-2.190943, 1.281675, -0.4681011, 1, 0.08235294, 0, 1,
-2.160477, -0.946839, -1.187139, 1, 0.09019608, 0, 1,
-2.147869, -0.6371, -0.5177754, 1, 0.09411765, 0, 1,
-2.096244, 0.6011826, 0.03895609, 1, 0.1019608, 0, 1,
-2.095212, 0.5481756, -0.444373, 1, 0.1098039, 0, 1,
-2.070106, -0.2337295, -1.67355, 1, 0.1137255, 0, 1,
-2.044034, -0.1480798, -1.796213, 1, 0.1215686, 0, 1,
-1.974867, -2.46968, -2.795346, 1, 0.1254902, 0, 1,
-1.968474, 0.07181357, -2.712826, 1, 0.1333333, 0, 1,
-1.937662, 0.6064041, -0.8750717, 1, 0.1372549, 0, 1,
-1.937045, -0.7974625, -2.881007, 1, 0.145098, 0, 1,
-1.846696, 0.4746466, -0.6421613, 1, 0.1490196, 0, 1,
-1.823437, 0.1347348, -2.433551, 1, 0.1568628, 0, 1,
-1.817075, -0.5864294, -2.931292, 1, 0.1607843, 0, 1,
-1.796909, -0.5084349, -0.3820099, 1, 0.1686275, 0, 1,
-1.789605, -1.384338, -2.951597, 1, 0.172549, 0, 1,
-1.780012, -0.36265, -0.9500865, 1, 0.1803922, 0, 1,
-1.774124, 1.772722, -0.9578133, 1, 0.1843137, 0, 1,
-1.771517, -0.0480368, -0.9205912, 1, 0.1921569, 0, 1,
-1.767571, 0.1376933, -3.015389, 1, 0.1960784, 0, 1,
-1.76756, 1.48151, -1.160329, 1, 0.2039216, 0, 1,
-1.767219, 1.484343, 0.5318478, 1, 0.2117647, 0, 1,
-1.760821, 0.2403525, -0.3788729, 1, 0.2156863, 0, 1,
-1.727297, 0.904597, -0.8193887, 1, 0.2235294, 0, 1,
-1.727093, 0.9343081, -1.70676, 1, 0.227451, 0, 1,
-1.70819, 0.6770447, 0.0359758, 1, 0.2352941, 0, 1,
-1.698827, -1.043427, -1.032285, 1, 0.2392157, 0, 1,
-1.671201, -0.02110366, 0.5045419, 1, 0.2470588, 0, 1,
-1.612729, 0.04359721, -2.484411, 1, 0.2509804, 0, 1,
-1.612606, 1.076429, 1.708209, 1, 0.2588235, 0, 1,
-1.610158, 0.6939241, 0.2900641, 1, 0.2627451, 0, 1,
-1.60652, 0.4960873, 0.4172443, 1, 0.2705882, 0, 1,
-1.599413, -0.9434838, -2.6978, 1, 0.2745098, 0, 1,
-1.584721, 0.03736578, -2.634079, 1, 0.282353, 0, 1,
-1.584659, 0.9955445, -1.580403, 1, 0.2862745, 0, 1,
-1.579572, -1.057087, -1.657147, 1, 0.2941177, 0, 1,
-1.571903, -0.1460391, -0.8827154, 1, 0.3019608, 0, 1,
-1.536212, -0.9204612, -2.427008, 1, 0.3058824, 0, 1,
-1.531107, -0.2964203, -0.5736322, 1, 0.3137255, 0, 1,
-1.52389, 1.098475, -1.718445, 1, 0.3176471, 0, 1,
-1.520679, -0.7390193, 0.7917525, 1, 0.3254902, 0, 1,
-1.506512, 0.7391213, -0.355174, 1, 0.3294118, 0, 1,
-1.505382, 0.7711303, -1.444514, 1, 0.3372549, 0, 1,
-1.504048, 1.442379, -1.402371, 1, 0.3411765, 0, 1,
-1.494305, -2.350658, -2.295155, 1, 0.3490196, 0, 1,
-1.478934, -0.6279833, -2.460155, 1, 0.3529412, 0, 1,
-1.474662, 1.335584, 0.3524705, 1, 0.3607843, 0, 1,
-1.462535, -0.4790458, -2.636142, 1, 0.3647059, 0, 1,
-1.452128, -0.1959542, -2.495823, 1, 0.372549, 0, 1,
-1.447801, 0.3402584, -1.386088, 1, 0.3764706, 0, 1,
-1.447717, 0.1390597, -2.84933, 1, 0.3843137, 0, 1,
-1.439718, 1.316026, -0.3029303, 1, 0.3882353, 0, 1,
-1.43631, -1.297914, -0.6322388, 1, 0.3960784, 0, 1,
-1.427541, -1.612201, -2.246068, 1, 0.4039216, 0, 1,
-1.422309, 0.7540438, -1.246155, 1, 0.4078431, 0, 1,
-1.417609, 0.5399029, 0.3242754, 1, 0.4156863, 0, 1,
-1.417005, 0.05898087, 0.1860681, 1, 0.4196078, 0, 1,
-1.412896, 0.5974971, -1.710024, 1, 0.427451, 0, 1,
-1.410243, -0.4290655, -2.083615, 1, 0.4313726, 0, 1,
-1.408913, -0.01679233, -1.546638, 1, 0.4392157, 0, 1,
-1.406237, -0.3471774, -4.998054, 1, 0.4431373, 0, 1,
-1.398283, -0.9526955, -3.222091, 1, 0.4509804, 0, 1,
-1.394365, 2.140036, 0.01900103, 1, 0.454902, 0, 1,
-1.382941, 1.153723, -1.040077, 1, 0.4627451, 0, 1,
-1.382789, 1.129696, -1.001462, 1, 0.4666667, 0, 1,
-1.381828, -1.017195, -2.389209, 1, 0.4745098, 0, 1,
-1.373077, -0.3231686, -1.425972, 1, 0.4784314, 0, 1,
-1.369652, -0.5887274, -1.582813, 1, 0.4862745, 0, 1,
-1.366721, -0.8465428, -1.759473, 1, 0.4901961, 0, 1,
-1.36665, -0.1408958, -0.01517729, 1, 0.4980392, 0, 1,
-1.364704, 1.537902, -0.2022786, 1, 0.5058824, 0, 1,
-1.361277, 1.986402, -1.544318, 1, 0.509804, 0, 1,
-1.356766, -1.026694, -1.037976, 1, 0.5176471, 0, 1,
-1.350152, -0.568962, -1.632657, 1, 0.5215687, 0, 1,
-1.347703, -0.1669209, -0.9749623, 1, 0.5294118, 0, 1,
-1.346689, 0.3940355, -0.8919772, 1, 0.5333334, 0, 1,
-1.331795, -0.9356809, -3.110344, 1, 0.5411765, 0, 1,
-1.328876, 0.4719629, 1.034718, 1, 0.5450981, 0, 1,
-1.315091, 0.9379982, -1.203686, 1, 0.5529412, 0, 1,
-1.312557, -0.4404693, -2.086251, 1, 0.5568628, 0, 1,
-1.309306, 1.932851, -1.488004, 1, 0.5647059, 0, 1,
-1.307776, -0.2975199, 0.5440816, 1, 0.5686275, 0, 1,
-1.29939, 2.052397, -1.6907, 1, 0.5764706, 0, 1,
-1.295402, -0.5988265, -2.773847, 1, 0.5803922, 0, 1,
-1.291838, -1.289223, -1.876256, 1, 0.5882353, 0, 1,
-1.288359, -0.2953037, -2.681087, 1, 0.5921569, 0, 1,
-1.287112, 0.2628131, -0.3102414, 1, 0.6, 0, 1,
-1.286349, 0.2463719, -2.539555, 1, 0.6078432, 0, 1,
-1.28347, -0.7053167, -2.997986, 1, 0.6117647, 0, 1,
-1.281236, 0.4294223, 0.5977645, 1, 0.6196079, 0, 1,
-1.273042, 1.189379, -0.005090081, 1, 0.6235294, 0, 1,
-1.270137, 0.2322783, 0.09523705, 1, 0.6313726, 0, 1,
-1.268071, -0.4104143, -3.726166, 1, 0.6352941, 0, 1,
-1.258525, 0.9329847, -2.414235, 1, 0.6431373, 0, 1,
-1.254284, 0.1509677, -1.241742, 1, 0.6470588, 0, 1,
-1.242583, 1.323491, -1.133686, 1, 0.654902, 0, 1,
-1.235305, 0.7670004, -0.5157683, 1, 0.6588235, 0, 1,
-1.231759, 0.7172932, 0.723149, 1, 0.6666667, 0, 1,
-1.229306, -1.793706, -4.37633, 1, 0.6705883, 0, 1,
-1.222194, -0.6298074, -0.8601309, 1, 0.6784314, 0, 1,
-1.222095, 0.03503013, -2.024219, 1, 0.682353, 0, 1,
-1.207103, 1.046901, -0.2348225, 1, 0.6901961, 0, 1,
-1.206175, 0.5917044, 0.1070663, 1, 0.6941177, 0, 1,
-1.20491, -1.79881, -2.654197, 1, 0.7019608, 0, 1,
-1.192943, 0.04295792, 0.007967465, 1, 0.7098039, 0, 1,
-1.191657, 0.9956242, -1.469824, 1, 0.7137255, 0, 1,
-1.191176, -0.3205136, -1.61005, 1, 0.7215686, 0, 1,
-1.190848, 0.3001089, -2.232816, 1, 0.7254902, 0, 1,
-1.186228, 0.3943005, -0.9328639, 1, 0.7333333, 0, 1,
-1.18229, 0.5180913, -0.3376885, 1, 0.7372549, 0, 1,
-1.161937, 0.8371335, -2.114634, 1, 0.7450981, 0, 1,
-1.161207, -0.7287486, -3.864165, 1, 0.7490196, 0, 1,
-1.145067, 0.3289158, 0.2356951, 1, 0.7568628, 0, 1,
-1.138261, 1.776678, -1.166265, 1, 0.7607843, 0, 1,
-1.13721, 0.8812862, -1.751217, 1, 0.7686275, 0, 1,
-1.137012, 0.4184991, 0.3665162, 1, 0.772549, 0, 1,
-1.134082, 1.233382, -0.08233607, 1, 0.7803922, 0, 1,
-1.133976, -0.01594969, -2.210324, 1, 0.7843137, 0, 1,
-1.132503, 0.8137904, -1.419255, 1, 0.7921569, 0, 1,
-1.110767, -1.170639, -2.706363, 1, 0.7960784, 0, 1,
-1.110252, 0.1120012, -1.136501, 1, 0.8039216, 0, 1,
-1.098039, 0.3963892, 0.9276239, 1, 0.8117647, 0, 1,
-1.093286, -0.4321945, -2.075638, 1, 0.8156863, 0, 1,
-1.087563, -1.321553, -2.354907, 1, 0.8235294, 0, 1,
-1.085221, 0.6026477, -2.370234, 1, 0.827451, 0, 1,
-1.081209, -0.448785, -3.150213, 1, 0.8352941, 0, 1,
-1.079141, -0.6516096, -3.342368, 1, 0.8392157, 0, 1,
-1.072298, 0.1355119, -1.021726, 1, 0.8470588, 0, 1,
-1.057576, 0.9064916, -2.241233, 1, 0.8509804, 0, 1,
-1.057083, -1.879144, -1.989026, 1, 0.8588235, 0, 1,
-1.056541, 2.576667, -0.9471064, 1, 0.8627451, 0, 1,
-1.05301, 0.5053474, -0.6051916, 1, 0.8705882, 0, 1,
-1.045131, -0.4544869, -2.357503, 1, 0.8745098, 0, 1,
-1.041653, 0.9550866, -0.8312785, 1, 0.8823529, 0, 1,
-1.039153, 0.6780344, -0.4194561, 1, 0.8862745, 0, 1,
-1.037482, -0.253393, -2.397545, 1, 0.8941177, 0, 1,
-1.017476, 0.6943328, -0.7084594, 1, 0.8980392, 0, 1,
-1.00874, 1.604352, -1.325942, 1, 0.9058824, 0, 1,
-1.008606, 0.7887878, 0.8219999, 1, 0.9137255, 0, 1,
-1.007668, 0.6237098, -0.4399646, 1, 0.9176471, 0, 1,
-1.006628, 0.9921806, -0.8951671, 1, 0.9254902, 0, 1,
-1.005093, -0.1670705, -1.405964, 1, 0.9294118, 0, 1,
-0.9932232, 0.4672346, -0.7761602, 1, 0.9372549, 0, 1,
-0.9838444, -0.009339002, -1.467568, 1, 0.9411765, 0, 1,
-0.978102, 0.1575862, -2.219183, 1, 0.9490196, 0, 1,
-0.9702016, -0.4930723, -2.915759, 1, 0.9529412, 0, 1,
-0.9680248, -0.3347674, -3.339, 1, 0.9607843, 0, 1,
-0.9671294, 1.632037, -1.397419, 1, 0.9647059, 0, 1,
-0.9663139, 0.4715291, -0.9912554, 1, 0.972549, 0, 1,
-0.9657015, -0.1925052, -2.010103, 1, 0.9764706, 0, 1,
-0.9606196, 0.05912565, -0.2632126, 1, 0.9843137, 0, 1,
-0.9581165, 1.521709, -0.9039247, 1, 0.9882353, 0, 1,
-0.957126, 0.3077614, -1.40207, 1, 0.9960784, 0, 1,
-0.9535376, 0.06080213, -2.067915, 0.9960784, 1, 0, 1,
-0.9526107, -0.6560549, -2.51198, 0.9921569, 1, 0, 1,
-0.9454126, -1.989264, -3.140885, 0.9843137, 1, 0, 1,
-0.9407692, 1.248625, -0.9106194, 0.9803922, 1, 0, 1,
-0.9327956, -0.09227057, -1.910403, 0.972549, 1, 0, 1,
-0.9264619, -0.05657617, -2.323404, 0.9686275, 1, 0, 1,
-0.926183, 0.9036199, 0.06899282, 0.9607843, 1, 0, 1,
-0.9243509, 0.104714, -1.093005, 0.9568627, 1, 0, 1,
-0.9138457, 1.462778, 0.0990188, 0.9490196, 1, 0, 1,
-0.9115529, 1.118984, -1.434309, 0.945098, 1, 0, 1,
-0.9079056, 0.8855753, -0.05784756, 0.9372549, 1, 0, 1,
-0.9037873, 0.2294782, -2.945167, 0.9333333, 1, 0, 1,
-0.9012723, -1.3699, -0.9676642, 0.9254902, 1, 0, 1,
-0.8994791, 0.8901253, -1.154555, 0.9215686, 1, 0, 1,
-0.8957282, -0.3153022, -2.151361, 0.9137255, 1, 0, 1,
-0.8926114, 2.635961, -0.1099924, 0.9098039, 1, 0, 1,
-0.8877739, -1.712354, -3.020607, 0.9019608, 1, 0, 1,
-0.8778955, -0.1293267, -1.439214, 0.8941177, 1, 0, 1,
-0.8764529, -0.9171664, -0.6242158, 0.8901961, 1, 0, 1,
-0.8754873, 0.6241503, -1.134958, 0.8823529, 1, 0, 1,
-0.8747888, -0.2032731, -2.728937, 0.8784314, 1, 0, 1,
-0.8739482, -2.128138, -3.336862, 0.8705882, 1, 0, 1,
-0.8704122, 0.4358128, -0.5282629, 0.8666667, 1, 0, 1,
-0.8701095, -1.779032, -4.428143, 0.8588235, 1, 0, 1,
-0.8690326, 0.7387237, -1.798819, 0.854902, 1, 0, 1,
-0.8647251, 1.937316, -2.398927, 0.8470588, 1, 0, 1,
-0.8611689, 0.3207681, -1.915154, 0.8431373, 1, 0, 1,
-0.8610527, -0.948045, -1.069227, 0.8352941, 1, 0, 1,
-0.8580381, 0.4571812, -0.7965698, 0.8313726, 1, 0, 1,
-0.8490638, -1.109315, -2.874419, 0.8235294, 1, 0, 1,
-0.848233, 0.05113064, 0.1557421, 0.8196079, 1, 0, 1,
-0.8459691, 0.6447672, -1.313476, 0.8117647, 1, 0, 1,
-0.8363853, 0.935258, 0.7044232, 0.8078431, 1, 0, 1,
-0.8363576, 0.1102225, -0.5829192, 0.8, 1, 0, 1,
-0.8329284, 0.195892, -2.377472, 0.7921569, 1, 0, 1,
-0.8325196, 1.098495, 0.04623119, 0.7882353, 1, 0, 1,
-0.8302839, -1.284524, -0.9072301, 0.7803922, 1, 0, 1,
-0.8290673, 1.506809, 1.461804, 0.7764706, 1, 0, 1,
-0.8265483, -0.0754554, -1.741619, 0.7686275, 1, 0, 1,
-0.8224595, 0.4319739, -0.8990175, 0.7647059, 1, 0, 1,
-0.8213624, 1.452381, -2.050278, 0.7568628, 1, 0, 1,
-0.8076558, 0.6625478, 1.299833, 0.7529412, 1, 0, 1,
-0.803255, 0.9661183, -1.895714, 0.7450981, 1, 0, 1,
-0.8030907, 0.1551261, -1.27491, 0.7411765, 1, 0, 1,
-0.7976051, 1.058824, -0.6086546, 0.7333333, 1, 0, 1,
-0.7844186, 0.4866426, -1.632849, 0.7294118, 1, 0, 1,
-0.7822499, 1.768838, -0.5330435, 0.7215686, 1, 0, 1,
-0.777989, 0.009864472, -0.3703103, 0.7176471, 1, 0, 1,
-0.7686055, 0.5988805, 2.170256, 0.7098039, 1, 0, 1,
-0.7665721, 0.5510545, -0.3064156, 0.7058824, 1, 0, 1,
-0.7635726, -1.343709, -3.162555, 0.6980392, 1, 0, 1,
-0.7592641, 0.811242, -1.769345, 0.6901961, 1, 0, 1,
-0.7583115, 2.058967, -0.7951353, 0.6862745, 1, 0, 1,
-0.7567486, -0.2379808, -1.82609, 0.6784314, 1, 0, 1,
-0.7517109, -0.1365384, -3.449393, 0.6745098, 1, 0, 1,
-0.7506479, -0.6787327, -3.261076, 0.6666667, 1, 0, 1,
-0.7500034, 0.7118785, -0.09594154, 0.6627451, 1, 0, 1,
-0.7495684, 0.6563743, -0.8446354, 0.654902, 1, 0, 1,
-0.7464515, 1.760436, 0.3144546, 0.6509804, 1, 0, 1,
-0.746169, 0.6638477, -1.859643, 0.6431373, 1, 0, 1,
-0.7454953, 0.03112872, -0.7487765, 0.6392157, 1, 0, 1,
-0.7452129, 1.469801, -0.5555081, 0.6313726, 1, 0, 1,
-0.7447186, -1.736001, -2.898756, 0.627451, 1, 0, 1,
-0.7414629, 1.446335, -2.161087, 0.6196079, 1, 0, 1,
-0.7406896, -1.182201, -1.904546, 0.6156863, 1, 0, 1,
-0.7386915, -0.5792027, -2.220699, 0.6078432, 1, 0, 1,
-0.7374563, -0.001282834, -4.162604, 0.6039216, 1, 0, 1,
-0.7362162, -0.1704393, -2.296006, 0.5960785, 1, 0, 1,
-0.734224, -1.371724, -0.8945458, 0.5882353, 1, 0, 1,
-0.7304898, -0.7387282, -3.274286, 0.5843138, 1, 0, 1,
-0.7273378, 1.262485, -0.9527999, 0.5764706, 1, 0, 1,
-0.7249183, -0.4012912, -2.213986, 0.572549, 1, 0, 1,
-0.7226145, 0.6371793, -0.1917884, 0.5647059, 1, 0, 1,
-0.7177023, -0.8616098, -0.722165, 0.5607843, 1, 0, 1,
-0.7137061, -1.074933, -3.746422, 0.5529412, 1, 0, 1,
-0.7097612, 0.4248686, -0.5522281, 0.5490196, 1, 0, 1,
-0.7073154, -0.1340987, -1.895132, 0.5411765, 1, 0, 1,
-0.7021313, 0.7318038, -2.2595, 0.5372549, 1, 0, 1,
-0.6888175, -0.4020517, -3.177144, 0.5294118, 1, 0, 1,
-0.6885486, 0.7359909, -0.3007404, 0.5254902, 1, 0, 1,
-0.6880874, -0.3664725, -2.967109, 0.5176471, 1, 0, 1,
-0.6844954, -0.3169065, -1.551869, 0.5137255, 1, 0, 1,
-0.6757884, 0.09598571, -1.645206, 0.5058824, 1, 0, 1,
-0.6740697, -0.3525177, -3.066002, 0.5019608, 1, 0, 1,
-0.6722413, 0.1582541, 0.45912, 0.4941176, 1, 0, 1,
-0.6716099, 0.7734322, -0.500766, 0.4862745, 1, 0, 1,
-0.6647898, -1.435195, -3.529215, 0.4823529, 1, 0, 1,
-0.6645761, 0.1954948, -0.5798255, 0.4745098, 1, 0, 1,
-0.6590811, 0.8956431, 0.4353047, 0.4705882, 1, 0, 1,
-0.6579472, 0.007034805, -1.306055, 0.4627451, 1, 0, 1,
-0.6550726, -0.3863013, -0.4457808, 0.4588235, 1, 0, 1,
-0.654656, -2.059504, -3.557025, 0.4509804, 1, 0, 1,
-0.6528375, 1.507792, 1.701048, 0.4470588, 1, 0, 1,
-0.652582, 0.7458061, -0.6095886, 0.4392157, 1, 0, 1,
-0.6516133, 2.01769, -1.347132, 0.4352941, 1, 0, 1,
-0.6503335, 0.4975533, -0.8467528, 0.427451, 1, 0, 1,
-0.6477838, 1.228784, 0.6590025, 0.4235294, 1, 0, 1,
-0.6462737, 0.199985, -2.494491, 0.4156863, 1, 0, 1,
-0.6402189, 0.7121959, 0.3421561, 0.4117647, 1, 0, 1,
-0.6339988, 0.002769226, -0.6707634, 0.4039216, 1, 0, 1,
-0.6294473, 0.6625513, -0.9146886, 0.3960784, 1, 0, 1,
-0.6263101, -1.650889, -1.940105, 0.3921569, 1, 0, 1,
-0.6217478, -0.769595, -0.9106735, 0.3843137, 1, 0, 1,
-0.6176037, 0.2392663, -1.801513, 0.3803922, 1, 0, 1,
-0.6147949, 0.2204167, -0.5258678, 0.372549, 1, 0, 1,
-0.6127093, 1.110402, 0.03787781, 0.3686275, 1, 0, 1,
-0.6086163, -0.5141183, -0.1845838, 0.3607843, 1, 0, 1,
-0.6012176, 1.386369, -1.553361, 0.3568628, 1, 0, 1,
-0.6004472, 0.4433933, -0.2835548, 0.3490196, 1, 0, 1,
-0.5946651, 0.2902551, -1.694179, 0.345098, 1, 0, 1,
-0.5925681, -0.1705721, -1.254645, 0.3372549, 1, 0, 1,
-0.5923156, -1.242369, -1.605404, 0.3333333, 1, 0, 1,
-0.5897622, -0.3683217, -4.077843, 0.3254902, 1, 0, 1,
-0.5857182, -0.4768926, -1.352013, 0.3215686, 1, 0, 1,
-0.5848913, 0.3352164, -0.7737429, 0.3137255, 1, 0, 1,
-0.5784142, -0.3603509, -2.239869, 0.3098039, 1, 0, 1,
-0.5766226, -1.552403, -3.082795, 0.3019608, 1, 0, 1,
-0.5701728, -0.1429384, -0.340717, 0.2941177, 1, 0, 1,
-0.5698082, 0.7566831, -1.218982, 0.2901961, 1, 0, 1,
-0.5692914, 0.1839062, -0.9017408, 0.282353, 1, 0, 1,
-0.5648044, 0.7217656, 0.7712814, 0.2784314, 1, 0, 1,
-0.5640756, -1.236179, -2.952353, 0.2705882, 1, 0, 1,
-0.5624522, 1.405153, -0.5435556, 0.2666667, 1, 0, 1,
-0.5560767, -0.7279761, -2.701569, 0.2588235, 1, 0, 1,
-0.5478147, -0.03478637, -1.128473, 0.254902, 1, 0, 1,
-0.5472143, 0.5288963, 0.1806135, 0.2470588, 1, 0, 1,
-0.5439671, -0.006228342, -2.825191, 0.2431373, 1, 0, 1,
-0.5409866, 2.010971, -1.164501, 0.2352941, 1, 0, 1,
-0.5395619, -0.9977, -2.318451, 0.2313726, 1, 0, 1,
-0.5328429, 1.176743, -1.308236, 0.2235294, 1, 0, 1,
-0.5321928, 0.5831137, -0.009960783, 0.2196078, 1, 0, 1,
-0.5287675, -0.03824889, -1.985803, 0.2117647, 1, 0, 1,
-0.5274745, 1.348619, -1.406925, 0.2078431, 1, 0, 1,
-0.5190142, -1.211619, -3.952433, 0.2, 1, 0, 1,
-0.5187094, 0.7667371, -1.424804, 0.1921569, 1, 0, 1,
-0.5111331, -0.4034827, -3.398347, 0.1882353, 1, 0, 1,
-0.5061085, -0.4894733, -2.865598, 0.1803922, 1, 0, 1,
-0.5058566, 0.2647907, -1.052745, 0.1764706, 1, 0, 1,
-0.5039376, -1.245807, -2.036204, 0.1686275, 1, 0, 1,
-0.4972226, -0.1786363, -2.176579, 0.1647059, 1, 0, 1,
-0.4971925, -1.203512, -1.921272, 0.1568628, 1, 0, 1,
-0.4966614, 0.5496351, 0.6391454, 0.1529412, 1, 0, 1,
-0.4927472, -0.9963605, -2.7712, 0.145098, 1, 0, 1,
-0.489979, 0.9042975, 1.261997, 0.1411765, 1, 0, 1,
-0.4834594, -0.4721362, -2.908259, 0.1333333, 1, 0, 1,
-0.4831574, -1.285594, -2.495975, 0.1294118, 1, 0, 1,
-0.4786485, -0.2030805, -2.58204, 0.1215686, 1, 0, 1,
-0.4740325, 1.440366, -0.2194384, 0.1176471, 1, 0, 1,
-0.4721853, 0.6725282, -0.8712372, 0.1098039, 1, 0, 1,
-0.4687539, -0.2828146, -0.9770986, 0.1058824, 1, 0, 1,
-0.4651428, 0.01725127, -2.505584, 0.09803922, 1, 0, 1,
-0.4645462, 0.5068941, -0.1029806, 0.09019608, 1, 0, 1,
-0.4616838, -0.5192212, -0.1811723, 0.08627451, 1, 0, 1,
-0.4540994, -0.6158957, -2.51323, 0.07843138, 1, 0, 1,
-0.4529515, 0.4790209, -0.5540686, 0.07450981, 1, 0, 1,
-0.452797, 1.034092, 0.852793, 0.06666667, 1, 0, 1,
-0.4514818, -1.55584, -3.627011, 0.0627451, 1, 0, 1,
-0.4394812, -0.9602017, -3.401231, 0.05490196, 1, 0, 1,
-0.4371624, 1.333958, -0.2059884, 0.05098039, 1, 0, 1,
-0.4345667, -0.1900936, -1.011235, 0.04313726, 1, 0, 1,
-0.4343541, -0.8786215, -1.88225, 0.03921569, 1, 0, 1,
-0.4339529, -0.01892675, -1.613431, 0.03137255, 1, 0, 1,
-0.4337511, 0.2548107, -1.033426, 0.02745098, 1, 0, 1,
-0.4320349, 0.008113679, -1.888068, 0.01960784, 1, 0, 1,
-0.4294134, -0.220254, -2.041888, 0.01568628, 1, 0, 1,
-0.4285545, -1.387462, -4.583225, 0.007843138, 1, 0, 1,
-0.4265925, -0.05043344, -0.9254254, 0.003921569, 1, 0, 1,
-0.4204557, 0.1447044, -1.447005, 0, 1, 0.003921569, 1,
-0.414275, 0.5429044, -0.2058527, 0, 1, 0.01176471, 1,
-0.4108173, -1.249919, -3.869643, 0, 1, 0.01568628, 1,
-0.406466, 1.131907, -0.07267609, 0, 1, 0.02352941, 1,
-0.4022767, -1.837056, -0.6993728, 0, 1, 0.02745098, 1,
-0.3987055, -1.015035, -2.681694, 0, 1, 0.03529412, 1,
-0.3962394, 0.2628289, -3.168696, 0, 1, 0.03921569, 1,
-0.3933736, -0.9231187, -3.020598, 0, 1, 0.04705882, 1,
-0.3924719, -0.001871133, -1.565992, 0, 1, 0.05098039, 1,
-0.3890403, 2.189673, -0.2716701, 0, 1, 0.05882353, 1,
-0.3868689, -1.651126, -4.299126, 0, 1, 0.0627451, 1,
-0.3868676, -0.3947301, -3.166067, 0, 1, 0.07058824, 1,
-0.3802498, 1.932442, -0.1324509, 0, 1, 0.07450981, 1,
-0.376317, 1.25013, -1.568597, 0, 1, 0.08235294, 1,
-0.3757193, -1.195742, -2.470204, 0, 1, 0.08627451, 1,
-0.374687, -1.153029, -4.946051, 0, 1, 0.09411765, 1,
-0.3740151, 0.9016908, -1.455263, 0, 1, 0.1019608, 1,
-0.3710148, 1.431278, -0.08169073, 0, 1, 0.1058824, 1,
-0.3696324, -0.05607003, -2.094438, 0, 1, 0.1137255, 1,
-0.3683436, 0.5418426, -0.8578284, 0, 1, 0.1176471, 1,
-0.3654833, -0.1362296, -3.759292, 0, 1, 0.1254902, 1,
-0.3629585, 2.254982, -0.173436, 0, 1, 0.1294118, 1,
-0.3629007, 2.728745, 1.65325, 0, 1, 0.1372549, 1,
-0.3608471, -1.288849, -2.182323, 0, 1, 0.1411765, 1,
-0.3564609, 0.493771, -0.2513364, 0, 1, 0.1490196, 1,
-0.3508771, -0.04682096, -3.674905, 0, 1, 0.1529412, 1,
-0.3505891, -0.6919637, -3.258579, 0, 1, 0.1607843, 1,
-0.3471808, -1.484207, -1.796373, 0, 1, 0.1647059, 1,
-0.3423432, -0.1770339, -2.50865, 0, 1, 0.172549, 1,
-0.337867, -0.3005873, -0.5569612, 0, 1, 0.1764706, 1,
-0.3377664, -0.2598505, -3.740157, 0, 1, 0.1843137, 1,
-0.3374505, -0.6084779, -1.966656, 0, 1, 0.1882353, 1,
-0.3355232, 0.8287427, -2.525966, 0, 1, 0.1960784, 1,
-0.3224893, 0.3411604, -1.610274, 0, 1, 0.2039216, 1,
-0.3186172, 1.156525, 0.3517476, 0, 1, 0.2078431, 1,
-0.3154405, -2.680338, -3.065389, 0, 1, 0.2156863, 1,
-0.3135227, -0.3914161, -2.996768, 0, 1, 0.2196078, 1,
-0.3132277, 0.3334559, -0.07221362, 0, 1, 0.227451, 1,
-0.3006369, 1.424711, -0.3698851, 0, 1, 0.2313726, 1,
-0.2975713, -1.249199, -1.194825, 0, 1, 0.2392157, 1,
-0.2960312, 0.4111997, -0.5468954, 0, 1, 0.2431373, 1,
-0.2927527, 0.9356654, -0.1283496, 0, 1, 0.2509804, 1,
-0.291092, -0.9039432, -3.289833, 0, 1, 0.254902, 1,
-0.2896917, -0.3230698, -2.153942, 0, 1, 0.2627451, 1,
-0.2865226, 0.140515, -0.8044903, 0, 1, 0.2666667, 1,
-0.285946, -0.7585179, -3.573095, 0, 1, 0.2745098, 1,
-0.285253, -1.212569, -3.483679, 0, 1, 0.2784314, 1,
-0.2814098, -1.49817, -1.039538, 0, 1, 0.2862745, 1,
-0.2808363, 1.692792, -1.389458, 0, 1, 0.2901961, 1,
-0.2803001, -0.08727024, -2.022716, 0, 1, 0.2980392, 1,
-0.2754491, 0.9916891, 0.7292769, 0, 1, 0.3058824, 1,
-0.2750151, 0.1294146, 0.07814686, 0, 1, 0.3098039, 1,
-0.2749912, 0.961919, 0.3627749, 0, 1, 0.3176471, 1,
-0.2745786, -1.825483, -2.789688, 0, 1, 0.3215686, 1,
-0.2715956, 0.9582296, 0.6903809, 0, 1, 0.3294118, 1,
-0.2646388, -0.5651169, -2.483754, 0, 1, 0.3333333, 1,
-0.262143, 0.893972, 0.2530818, 0, 1, 0.3411765, 1,
-0.2530105, -1.692921, -2.024501, 0, 1, 0.345098, 1,
-0.2446656, 0.8193949, 0.9141124, 0, 1, 0.3529412, 1,
-0.2435007, -0.3519565, -2.709821, 0, 1, 0.3568628, 1,
-0.2394957, -0.622967, -2.370572, 0, 1, 0.3647059, 1,
-0.2364495, -1.460648, -2.608093, 0, 1, 0.3686275, 1,
-0.2353419, -0.7067727, -2.588482, 0, 1, 0.3764706, 1,
-0.23419, -0.660035, -3.394041, 0, 1, 0.3803922, 1,
-0.2335359, 0.714757, -0.8074316, 0, 1, 0.3882353, 1,
-0.2310912, 1.312258, 1.434948, 0, 1, 0.3921569, 1,
-0.2274899, -0.09530976, -4.090868, 0, 1, 0.4, 1,
-0.2192616, -0.247898, -1.731562, 0, 1, 0.4078431, 1,
-0.2191405, 0.9654579, -0.180873, 0, 1, 0.4117647, 1,
-0.2110118, -0.1344356, -3.321265, 0, 1, 0.4196078, 1,
-0.2109281, 0.9741859, -2.355094, 0, 1, 0.4235294, 1,
-0.2108792, 0.6015356, -0.6429442, 0, 1, 0.4313726, 1,
-0.2101049, -1.821987, -2.039022, 0, 1, 0.4352941, 1,
-0.2043916, -1.928502, -2.214697, 0, 1, 0.4431373, 1,
-0.2018853, -0.6383455, -3.621036, 0, 1, 0.4470588, 1,
-0.1992301, 0.9912621, 0.666346, 0, 1, 0.454902, 1,
-0.1978488, 2.011973, -2.168358, 0, 1, 0.4588235, 1,
-0.1968854, -1.541806, -3.750063, 0, 1, 0.4666667, 1,
-0.1937151, 2.741952, -0.2205551, 0, 1, 0.4705882, 1,
-0.1931108, 1.956111, 0.03928009, 0, 1, 0.4784314, 1,
-0.190169, 1.226223, -0.7950626, 0, 1, 0.4823529, 1,
-0.187398, 0.3750634, 0.8361889, 0, 1, 0.4901961, 1,
-0.1866661, -0.9514651, -1.318052, 0, 1, 0.4941176, 1,
-0.1826631, 0.8743182, 1.910999, 0, 1, 0.5019608, 1,
-0.180322, -1.163859, -3.626582, 0, 1, 0.509804, 1,
-0.17578, -0.4227745, -3.13223, 0, 1, 0.5137255, 1,
-0.1739826, -0.8331195, -2.015637, 0, 1, 0.5215687, 1,
-0.1730547, 0.4389428, 1.014064, 0, 1, 0.5254902, 1,
-0.1693673, 0.2245492, -0.8412899, 0, 1, 0.5333334, 1,
-0.1651739, 0.1323537, -1.089864, 0, 1, 0.5372549, 1,
-0.16366, 1.017088, -1.811652, 0, 1, 0.5450981, 1,
-0.1634168, 0.2567312, -0.6163423, 0, 1, 0.5490196, 1,
-0.1631974, -0.7352182, -1.776291, 0, 1, 0.5568628, 1,
-0.1608258, 1.590353, -1.008255, 0, 1, 0.5607843, 1,
-0.1554711, -1.806101, -3.034289, 0, 1, 0.5686275, 1,
-0.1513391, 0.392942, -1.124118, 0, 1, 0.572549, 1,
-0.1506152, 0.7346179, -1.86834, 0, 1, 0.5803922, 1,
-0.149804, 1.939047, -0.6954548, 0, 1, 0.5843138, 1,
-0.1493798, -1.086887, -2.282544, 0, 1, 0.5921569, 1,
-0.1430165, 0.03635853, -1.506468, 0, 1, 0.5960785, 1,
-0.1408737, 0.7198952, 1.019268, 0, 1, 0.6039216, 1,
-0.1387291, -0.7148982, -1.067073, 0, 1, 0.6117647, 1,
-0.133353, -0.8654181, -3.607411, 0, 1, 0.6156863, 1,
-0.1308758, -1.252828, -3.403997, 0, 1, 0.6235294, 1,
-0.1294675, -0.03321313, -1.677283, 0, 1, 0.627451, 1,
-0.1291556, 1.920185, 0.4526556, 0, 1, 0.6352941, 1,
-0.1279258, -0.3041071, -2.894416, 0, 1, 0.6392157, 1,
-0.1251203, -0.6250985, -3.233659, 0, 1, 0.6470588, 1,
-0.1239512, -0.08832702, -1.794255, 0, 1, 0.6509804, 1,
-0.1206837, -0.0493166, -3.623523, 0, 1, 0.6588235, 1,
-0.1191672, 0.2603443, -1.900505, 0, 1, 0.6627451, 1,
-0.118752, -0.1543801, -3.604893, 0, 1, 0.6705883, 1,
-0.1185799, 1.885192, -0.2426573, 0, 1, 0.6745098, 1,
-0.1136356, 0.5414348, 0.4374485, 0, 1, 0.682353, 1,
-0.1127688, 0.8646418, 0.765536, 0, 1, 0.6862745, 1,
-0.110167, -0.8657307, -2.070371, 0, 1, 0.6941177, 1,
-0.1063385, 0.9219407, -0.4377005, 0, 1, 0.7019608, 1,
-0.1017441, 1.751214, -0.7224277, 0, 1, 0.7058824, 1,
-0.09985866, 0.7895037, 1.684984, 0, 1, 0.7137255, 1,
-0.09960193, 0.4254817, 1.095035, 0, 1, 0.7176471, 1,
-0.09884151, 0.2160515, 0.2785563, 0, 1, 0.7254902, 1,
-0.09770934, -1.118836, -3.956724, 0, 1, 0.7294118, 1,
-0.09678043, 1.740008, 1.511787, 0, 1, 0.7372549, 1,
-0.09591693, 1.519783, -1.996428, 0, 1, 0.7411765, 1,
-0.09444106, -1.270117, -2.85912, 0, 1, 0.7490196, 1,
-0.09047531, 1.410948, 1.546741, 0, 1, 0.7529412, 1,
-0.0850101, 1.198, -1.196029, 0, 1, 0.7607843, 1,
-0.08419236, 1.968131, -1.281386, 0, 1, 0.7647059, 1,
-0.08290984, -0.5492972, -1.818664, 0, 1, 0.772549, 1,
-0.07887411, 0.2745357, 0.3362309, 0, 1, 0.7764706, 1,
-0.07823878, -2.194918, -2.480159, 0, 1, 0.7843137, 1,
-0.07569103, 0.4489234, -2.238456, 0, 1, 0.7882353, 1,
-0.07381627, 1.011111, -0.7212526, 0, 1, 0.7960784, 1,
-0.06263319, -0.2799405, -1.867314, 0, 1, 0.8039216, 1,
-0.06109569, -2.252995, -3.684235, 0, 1, 0.8078431, 1,
-0.05346898, 0.126401, -0.9064698, 0, 1, 0.8156863, 1,
-0.05022765, 0.2093362, -2.452267, 0, 1, 0.8196079, 1,
-0.04891931, 0.9443185, 1.443327, 0, 1, 0.827451, 1,
-0.04727995, -0.8350623, -4.140367, 0, 1, 0.8313726, 1,
-0.04282817, -0.2944853, -3.756188, 0, 1, 0.8392157, 1,
-0.03441451, 0.6188542, -2.625691, 0, 1, 0.8431373, 1,
-0.03132479, -1.050879, -2.66759, 0, 1, 0.8509804, 1,
-0.02605713, 0.4577428, 0.6963577, 0, 1, 0.854902, 1,
-0.02533822, -0.4544797, -2.570026, 0, 1, 0.8627451, 1,
-0.0241958, -0.08973962, -3.167422, 0, 1, 0.8666667, 1,
-0.02078733, -0.5907831, -2.504839, 0, 1, 0.8745098, 1,
-0.0154302, 0.4241036, 0.9354033, 0, 1, 0.8784314, 1,
-0.01449851, -1.340466, -2.841701, 0, 1, 0.8862745, 1,
-0.01382308, 1.019364, 0.05528278, 0, 1, 0.8901961, 1,
-0.01287384, 0.3477981, -1.269655, 0, 1, 0.8980392, 1,
-0.009282545, 0.2146951, 0.01944726, 0, 1, 0.9058824, 1,
-0.007398368, 0.6738003, -0.8436406, 0, 1, 0.9098039, 1,
-0.002815671, -0.48238, -2.772762, 0, 1, 0.9176471, 1,
0.0003898415, 1.074048, -0.6209037, 0, 1, 0.9215686, 1,
0.001244002, 1.196776, 0.08294071, 0, 1, 0.9294118, 1,
0.002830432, 0.04131666, -0.6386538, 0, 1, 0.9333333, 1,
0.005739194, -0.9268748, 2.591308, 0, 1, 0.9411765, 1,
0.005796663, -0.504123, 1.511252, 0, 1, 0.945098, 1,
0.006564631, -0.44344, 1.419761, 0, 1, 0.9529412, 1,
0.008622684, -1.416776, 5.799499, 0, 1, 0.9568627, 1,
0.009537241, -1.165646, 3.978319, 0, 1, 0.9647059, 1,
0.01259322, 0.9685888, 0.4749314, 0, 1, 0.9686275, 1,
0.01359825, -0.8966737, 3.554117, 0, 1, 0.9764706, 1,
0.01723256, -0.6666531, 3.027231, 0, 1, 0.9803922, 1,
0.02123972, -0.8740891, 1.876026, 0, 1, 0.9882353, 1,
0.02162359, -0.5020923, 3.747642, 0, 1, 0.9921569, 1,
0.02398591, 0.2364291, -0.5528071, 0, 1, 1, 1,
0.02574428, -0.7704269, 4.638468, 0, 0.9921569, 1, 1,
0.02843124, 0.3789116, -1.566873, 0, 0.9882353, 1, 1,
0.03180115, 0.2582754, -0.2873519, 0, 0.9803922, 1, 1,
0.03208088, 0.6122571, -0.3656864, 0, 0.9764706, 1, 1,
0.03652335, -1.101149, 4.148339, 0, 0.9686275, 1, 1,
0.03957466, 0.8276299, 0.1972561, 0, 0.9647059, 1, 1,
0.04127686, -2.634268, 3.624202, 0, 0.9568627, 1, 1,
0.04485819, -0.103668, 1.841569, 0, 0.9529412, 1, 1,
0.04802222, 0.4226101, 0.08508154, 0, 0.945098, 1, 1,
0.05353002, 0.7630294, 0.2040279, 0, 0.9411765, 1, 1,
0.05560654, -1.195378, 2.338712, 0, 0.9333333, 1, 1,
0.05677287, 0.0220911, 1.677686, 0, 0.9294118, 1, 1,
0.06053811, 1.682867, 1.200134, 0, 0.9215686, 1, 1,
0.06181603, -1.577412, 1.724934, 0, 0.9176471, 1, 1,
0.06286219, 0.1147126, 0.524999, 0, 0.9098039, 1, 1,
0.06347494, 0.545905, -1.184, 0, 0.9058824, 1, 1,
0.06848146, -0.4494886, 4.294425, 0, 0.8980392, 1, 1,
0.07035854, 0.1520195, 1.568606, 0, 0.8901961, 1, 1,
0.07148103, -0.1817532, 3.971381, 0, 0.8862745, 1, 1,
0.07319636, 0.02313844, 0.4197829, 0, 0.8784314, 1, 1,
0.07379986, 1.314498, -1.456048, 0, 0.8745098, 1, 1,
0.07497223, -0.6164623, 3.33321, 0, 0.8666667, 1, 1,
0.07585262, 1.494046, -0.06669167, 0, 0.8627451, 1, 1,
0.08373448, -0.2114083, 2.488531, 0, 0.854902, 1, 1,
0.08468131, -0.3152759, 3.055802, 0, 0.8509804, 1, 1,
0.09143308, -0.5574141, 4.11968, 0, 0.8431373, 1, 1,
0.09365272, -0.9982165, 2.924488, 0, 0.8392157, 1, 1,
0.09451065, 0.1146683, 0.4056853, 0, 0.8313726, 1, 1,
0.09557865, 0.7842526, -0.699735, 0, 0.827451, 1, 1,
0.09779343, 0.5487006, 1.963633, 0, 0.8196079, 1, 1,
0.1003619, -1.366177, 3.222688, 0, 0.8156863, 1, 1,
0.1005312, -0.1283921, 2.512222, 0, 0.8078431, 1, 1,
0.1011885, -1.411753, 3.479257, 0, 0.8039216, 1, 1,
0.102566, 0.4591657, -1.105783, 0, 0.7960784, 1, 1,
0.1084028, 1.458038, -1.916111, 0, 0.7882353, 1, 1,
0.1104974, -1.285696, 3.371573, 0, 0.7843137, 1, 1,
0.1106634, -1.036236, 1.607162, 0, 0.7764706, 1, 1,
0.1171054, 0.482025, -0.7003238, 0, 0.772549, 1, 1,
0.1205887, -0.5848055, 4.286104, 0, 0.7647059, 1, 1,
0.1208166, 1.844894, -1.089666, 0, 0.7607843, 1, 1,
0.1224862, 1.099881, 0.9630774, 0, 0.7529412, 1, 1,
0.1236499, 1.093494, -1.730373, 0, 0.7490196, 1, 1,
0.1246501, -0.4019249, 3.653859, 0, 0.7411765, 1, 1,
0.1260839, -1.331574, 1.259699, 0, 0.7372549, 1, 1,
0.1261494, -0.04602991, 3.033353, 0, 0.7294118, 1, 1,
0.1292536, -0.1650896, 2.240346, 0, 0.7254902, 1, 1,
0.1314982, 1.441284, -0.324602, 0, 0.7176471, 1, 1,
0.131987, 0.2145109, 0.6503395, 0, 0.7137255, 1, 1,
0.1384381, -0.9532891, 4.111717, 0, 0.7058824, 1, 1,
0.1388551, -0.7631062, 3.740452, 0, 0.6980392, 1, 1,
0.1392604, -0.5789385, 2.573751, 0, 0.6941177, 1, 1,
0.140524, -0.1805952, 3.415539, 0, 0.6862745, 1, 1,
0.1423197, -0.6355029, 3.560786, 0, 0.682353, 1, 1,
0.1441505, -1.164421, 2.20588, 0, 0.6745098, 1, 1,
0.1446472, -1.210772, 2.48179, 0, 0.6705883, 1, 1,
0.1456187, 0.1160636, 1.670411, 0, 0.6627451, 1, 1,
0.1470438, 0.6476649, -1.581649, 0, 0.6588235, 1, 1,
0.1509094, -1.921546, 1.785379, 0, 0.6509804, 1, 1,
0.1519884, -0.1586302, 1.865936, 0, 0.6470588, 1, 1,
0.1607557, 0.7380876, 1.717925, 0, 0.6392157, 1, 1,
0.160791, 1.325491, 1.776372, 0, 0.6352941, 1, 1,
0.1630092, 0.1675514, 1.892908, 0, 0.627451, 1, 1,
0.1631604, -0.1753753, 1.619362, 0, 0.6235294, 1, 1,
0.1638841, 1.498029, 1.520203, 0, 0.6156863, 1, 1,
0.1649926, -1.180069, 3.163743, 0, 0.6117647, 1, 1,
0.1683522, -0.9937704, 2.098891, 0, 0.6039216, 1, 1,
0.1690881, -1.099759, 1.364504, 0, 0.5960785, 1, 1,
0.1760065, 0.6232214, 2.257514, 0, 0.5921569, 1, 1,
0.1802872, 0.133603, 2.522101, 0, 0.5843138, 1, 1,
0.1826577, 0.8928286, -0.6259558, 0, 0.5803922, 1, 1,
0.1860467, 0.28379, 1.122367, 0, 0.572549, 1, 1,
0.1896408, -0.4784728, 3.731873, 0, 0.5686275, 1, 1,
0.191344, 0.180411, 1.019134, 0, 0.5607843, 1, 1,
0.1947301, -0.3754184, 0.6989549, 0, 0.5568628, 1, 1,
0.196096, -0.4521134, 1.853163, 0, 0.5490196, 1, 1,
0.1983801, -0.1598245, 4.216515, 0, 0.5450981, 1, 1,
0.2028347, -0.1559833, 0.7784972, 0, 0.5372549, 1, 1,
0.2047406, 1.158618, 1.09587, 0, 0.5333334, 1, 1,
0.2068972, 1.512737, -1.079804, 0, 0.5254902, 1, 1,
0.2076629, 0.6125255, -1.682289, 0, 0.5215687, 1, 1,
0.2090683, 1.673407, -0.3278162, 0, 0.5137255, 1, 1,
0.2100977, -1.33082, 3.399394, 0, 0.509804, 1, 1,
0.2103674, -0.5431744, 3.316276, 0, 0.5019608, 1, 1,
0.2112573, 0.8586736, 1.207627, 0, 0.4941176, 1, 1,
0.2123806, 0.4737805, -0.05913384, 0, 0.4901961, 1, 1,
0.2173998, 1.067386, -2.126357, 0, 0.4823529, 1, 1,
0.2201219, 0.6458709, -1.50138, 0, 0.4784314, 1, 1,
0.2202989, 0.6664228, 0.6982846, 0, 0.4705882, 1, 1,
0.2258096, -0.1676384, 1.669466, 0, 0.4666667, 1, 1,
0.229966, -1.950628, 1.333388, 0, 0.4588235, 1, 1,
0.2320224, 0.09230287, 0.6758426, 0, 0.454902, 1, 1,
0.2360727, -1.251971, 2.208411, 0, 0.4470588, 1, 1,
0.2373211, 1.412243, -0.2401394, 0, 0.4431373, 1, 1,
0.2393242, 1.017031, 0.6763326, 0, 0.4352941, 1, 1,
0.2394584, 0.7477157, 0.03402158, 0, 0.4313726, 1, 1,
0.2399485, 1.841625, 0.5146948, 0, 0.4235294, 1, 1,
0.242775, -0.6146755, 3.256804, 0, 0.4196078, 1, 1,
0.2434043, -0.2483902, 2.930244, 0, 0.4117647, 1, 1,
0.2460508, -0.1647968, 2.054372, 0, 0.4078431, 1, 1,
0.2497374, -0.8540205, 0.469262, 0, 0.4, 1, 1,
0.2521833, -0.2029156, 2.287296, 0, 0.3921569, 1, 1,
0.2534523, 1.115952, 1.160929, 0, 0.3882353, 1, 1,
0.2540321, 1.939678, -0.2563159, 0, 0.3803922, 1, 1,
0.2565202, 1.320793, 0.1227967, 0, 0.3764706, 1, 1,
0.258744, 1.089871, 1.19912, 0, 0.3686275, 1, 1,
0.2592049, 1.053728, 1.059777, 0, 0.3647059, 1, 1,
0.2594293, 1.369357, 1.885316, 0, 0.3568628, 1, 1,
0.2599083, 0.183871, 0.3297448, 0, 0.3529412, 1, 1,
0.2605868, 1.86366, 0.007307413, 0, 0.345098, 1, 1,
0.2622656, -1.958676, 2.49212, 0, 0.3411765, 1, 1,
0.2646694, -1.96508, 3.858594, 0, 0.3333333, 1, 1,
0.2758777, -0.4664985, 0.5148571, 0, 0.3294118, 1, 1,
0.2786101, -0.4384078, 1.444222, 0, 0.3215686, 1, 1,
0.2826133, 0.9577582, -2.190753, 0, 0.3176471, 1, 1,
0.284761, -0.284376, 1.479214, 0, 0.3098039, 1, 1,
0.2863, -0.03530401, 1.536988, 0, 0.3058824, 1, 1,
0.2893729, -0.9429039, 4.524022, 0, 0.2980392, 1, 1,
0.2994228, 0.4718336, 1.723782, 0, 0.2901961, 1, 1,
0.300395, 0.8110731, -0.3881428, 0, 0.2862745, 1, 1,
0.3004277, 1.024039, 0.01540797, 0, 0.2784314, 1, 1,
0.3049085, -1.012563, 2.796209, 0, 0.2745098, 1, 1,
0.3117508, -1.133772, 3.500444, 0, 0.2666667, 1, 1,
0.3135058, -0.1352966, 1.947127, 0, 0.2627451, 1, 1,
0.3190973, -0.7161819, 1.269452, 0, 0.254902, 1, 1,
0.3201156, 0.345349, -0.6346959, 0, 0.2509804, 1, 1,
0.3223128, 0.9803416, 0.6255648, 0, 0.2431373, 1, 1,
0.3246229, 0.4007456, 1.223417, 0, 0.2392157, 1, 1,
0.3305315, 0.3898825, 1.051275, 0, 0.2313726, 1, 1,
0.3328402, -0.3698983, 2.880148, 0, 0.227451, 1, 1,
0.3353428, -0.9270027, 2.782354, 0, 0.2196078, 1, 1,
0.335889, -1.276303, 2.447308, 0, 0.2156863, 1, 1,
0.3361521, 0.5421603, 0.3491101, 0, 0.2078431, 1, 1,
0.3418625, -0.3742431, 2.875975, 0, 0.2039216, 1, 1,
0.3430492, -3.258215, 2.139677, 0, 0.1960784, 1, 1,
0.3484558, -0.7155619, 2.998709, 0, 0.1882353, 1, 1,
0.3503817, 0.9484793, 1.962376, 0, 0.1843137, 1, 1,
0.3540786, -1.979381, 4.70282, 0, 0.1764706, 1, 1,
0.3541003, 0.6286876, -0.005920527, 0, 0.172549, 1, 1,
0.3556417, -0.8040752, 2.096375, 0, 0.1647059, 1, 1,
0.3579283, -2.480509, 4.705732, 0, 0.1607843, 1, 1,
0.3592773, -0.4719139, 2.529851, 0, 0.1529412, 1, 1,
0.3737375, 0.7403427, 1.01455, 0, 0.1490196, 1, 1,
0.3757869, -0.629509, 2.865131, 0, 0.1411765, 1, 1,
0.3822685, 0.2812779, 2.42389, 0, 0.1372549, 1, 1,
0.3888272, -0.944266, 2.753035, 0, 0.1294118, 1, 1,
0.3901246, 0.3485571, 0.8457313, 0, 0.1254902, 1, 1,
0.3928292, -2.212873, 0.5267654, 0, 0.1176471, 1, 1,
0.394704, -0.9847412, 3.724448, 0, 0.1137255, 1, 1,
0.3953878, 0.8768043, -0.7153298, 0, 0.1058824, 1, 1,
0.3955928, 1.011683, 0.4098759, 0, 0.09803922, 1, 1,
0.3956518, -0.499527, 2.59995, 0, 0.09411765, 1, 1,
0.3990065, 1.118187, 1.167089, 0, 0.08627451, 1, 1,
0.3991078, 0.8158819, 1.734228, 0, 0.08235294, 1, 1,
0.3992141, 0.2433401, -0.3045309, 0, 0.07450981, 1, 1,
0.4001425, -2.495902, 3.1633, 0, 0.07058824, 1, 1,
0.40177, -0.6734275, 1.764349, 0, 0.0627451, 1, 1,
0.402185, -1.528131, 4.1243, 0, 0.05882353, 1, 1,
0.4058273, -0.435415, 3.46341, 0, 0.05098039, 1, 1,
0.4067412, -1.16847, 1.539586, 0, 0.04705882, 1, 1,
0.4101502, -0.2830707, 1.905868, 0, 0.03921569, 1, 1,
0.4109336, 0.1399628, 0.5254358, 0, 0.03529412, 1, 1,
0.4115898, -0.4564418, 1.414427, 0, 0.02745098, 1, 1,
0.4184899, -0.07066013, 1.586664, 0, 0.02352941, 1, 1,
0.4219248, -0.02489123, 0.04835005, 0, 0.01568628, 1, 1,
0.4247349, 0.6557443, 1.431575, 0, 0.01176471, 1, 1,
0.4255562, 0.09276865, 1.113653, 0, 0.003921569, 1, 1,
0.4281895, -0.7428896, 3.651444, 0.003921569, 0, 1, 1,
0.4311077, -0.6530704, 4.056191, 0.007843138, 0, 1, 1,
0.4330186, 0.1510308, 1.088258, 0.01568628, 0, 1, 1,
0.4378253, -0.07752892, 1.610325, 0.01960784, 0, 1, 1,
0.4391596, 0.1891683, 0.565649, 0.02745098, 0, 1, 1,
0.4447279, -0.7690023, 3.680619, 0.03137255, 0, 1, 1,
0.4457655, -0.1436649, 1.512909, 0.03921569, 0, 1, 1,
0.4520444, -0.7183674, 2.366452, 0.04313726, 0, 1, 1,
0.455917, 1.995701, 2.346798, 0.05098039, 0, 1, 1,
0.4588057, 0.2794795, 0.9975143, 0.05490196, 0, 1, 1,
0.4603876, -0.5424015, 2.327094, 0.0627451, 0, 1, 1,
0.4634027, -0.5965247, 3.657234, 0.06666667, 0, 1, 1,
0.4655469, -0.9884698, 1.857471, 0.07450981, 0, 1, 1,
0.468292, 1.478967, 0.7182157, 0.07843138, 0, 1, 1,
0.4691129, -1.028008, 2.902179, 0.08627451, 0, 1, 1,
0.4703991, 1.035319, 0.4894798, 0.09019608, 0, 1, 1,
0.4726438, -1.385921, 2.051908, 0.09803922, 0, 1, 1,
0.475923, 0.2790305, 2.458997, 0.1058824, 0, 1, 1,
0.4762719, -0.4628267, 1.520079, 0.1098039, 0, 1, 1,
0.4800906, 0.1451785, 2.171205, 0.1176471, 0, 1, 1,
0.4905854, 0.9198949, -0.1771748, 0.1215686, 0, 1, 1,
0.4971454, -0.250252, 4.32438, 0.1294118, 0, 1, 1,
0.5027553, -0.624488, 1.523403, 0.1333333, 0, 1, 1,
0.5079305, -2.49188, 3.562248, 0.1411765, 0, 1, 1,
0.5106487, -0.8571556, 0.349327, 0.145098, 0, 1, 1,
0.5139005, 0.8123628, 0.3948155, 0.1529412, 0, 1, 1,
0.5233924, -2.46308, 3.956975, 0.1568628, 0, 1, 1,
0.5252621, 0.6945871, 1.25881, 0.1647059, 0, 1, 1,
0.5291938, -1.274887, 2.868138, 0.1686275, 0, 1, 1,
0.5337042, 1.376343, 0.2902061, 0.1764706, 0, 1, 1,
0.5367592, -1.216214, 2.365712, 0.1803922, 0, 1, 1,
0.5372779, -1.155267, 1.769744, 0.1882353, 0, 1, 1,
0.5419907, -0.6957389, 1.855001, 0.1921569, 0, 1, 1,
0.5426596, 1.254313, 0.2002501, 0.2, 0, 1, 1,
0.544563, -0.4349157, 1.717297, 0.2078431, 0, 1, 1,
0.5460472, -0.02281499, 2.001707, 0.2117647, 0, 1, 1,
0.5477395, -0.963331, 2.031613, 0.2196078, 0, 1, 1,
0.5506299, 0.4528455, -0.6043954, 0.2235294, 0, 1, 1,
0.5537039, 1.232746, -1.756059, 0.2313726, 0, 1, 1,
0.5566329, 0.2298414, 2.842792, 0.2352941, 0, 1, 1,
0.5591251, -1.284611, 3.038915, 0.2431373, 0, 1, 1,
0.5594621, 0.162973, 2.810049, 0.2470588, 0, 1, 1,
0.5606908, 1.363901, 0.6961796, 0.254902, 0, 1, 1,
0.561603, 0.3768147, 0.6318729, 0.2588235, 0, 1, 1,
0.5682034, -0.2905822, 1.794078, 0.2666667, 0, 1, 1,
0.570228, 0.6309016, 1.970567, 0.2705882, 0, 1, 1,
0.5732317, 0.3484221, 1.59315, 0.2784314, 0, 1, 1,
0.5761563, 0.4745872, 1.624824, 0.282353, 0, 1, 1,
0.5766492, 0.2874371, 2.407668, 0.2901961, 0, 1, 1,
0.5888672, 1.408872, 1.719612, 0.2941177, 0, 1, 1,
0.5922756, -1.532454, 3.613681, 0.3019608, 0, 1, 1,
0.593515, 0.1840944, 1.61853, 0.3098039, 0, 1, 1,
0.6014321, -0.150498, 3.420379, 0.3137255, 0, 1, 1,
0.6037541, -1.559803, 2.026694, 0.3215686, 0, 1, 1,
0.6049128, -1.296171, 1.589637, 0.3254902, 0, 1, 1,
0.6078179, -0.8274076, 1.334869, 0.3333333, 0, 1, 1,
0.610078, -1.493867, 3.104346, 0.3372549, 0, 1, 1,
0.6118597, 0.171069, 1.671362, 0.345098, 0, 1, 1,
0.6124224, -0.7832068, 3.166254, 0.3490196, 0, 1, 1,
0.6132511, 0.4947166, 0.4529373, 0.3568628, 0, 1, 1,
0.6185535, 1.012365, -0.233806, 0.3607843, 0, 1, 1,
0.6185581, -1.02836, 2.648116, 0.3686275, 0, 1, 1,
0.6198568, -0.5294981, 3.533213, 0.372549, 0, 1, 1,
0.6341313, -1.074261, 1.149577, 0.3803922, 0, 1, 1,
0.6355655, -0.3192598, -1.189625, 0.3843137, 0, 1, 1,
0.6356635, -0.8713707, 2.933742, 0.3921569, 0, 1, 1,
0.637355, 1.106562, -0.8102937, 0.3960784, 0, 1, 1,
0.6375615, -1.675507, 1.901922, 0.4039216, 0, 1, 1,
0.6386098, 0.4220231, 1.035999, 0.4117647, 0, 1, 1,
0.6439207, -1.372519, 3.507402, 0.4156863, 0, 1, 1,
0.6457203, -1.541651, 1.771918, 0.4235294, 0, 1, 1,
0.6507146, -1.119309, 2.418677, 0.427451, 0, 1, 1,
0.6507789, 0.5836918, 0.1429197, 0.4352941, 0, 1, 1,
0.6567144, -0.4804577, 2.098563, 0.4392157, 0, 1, 1,
0.658929, -0.8884407, 3.901553, 0.4470588, 0, 1, 1,
0.6633801, -1.614611, 1.775566, 0.4509804, 0, 1, 1,
0.6699154, -0.02410745, 1.438345, 0.4588235, 0, 1, 1,
0.6701527, -0.5455927, 3.525607, 0.4627451, 0, 1, 1,
0.6702692, -0.9104218, 0.3460091, 0.4705882, 0, 1, 1,
0.6758558, 1.658283, -0.317093, 0.4745098, 0, 1, 1,
0.6770073, 0.09842293, 0.1994765, 0.4823529, 0, 1, 1,
0.680182, -0.2518262, 0.6446225, 0.4862745, 0, 1, 1,
0.6807445, -0.9441144, 3.943948, 0.4941176, 0, 1, 1,
0.6808038, 1.445179, 0.1421853, 0.5019608, 0, 1, 1,
0.680955, -0.7024359, 2.936337, 0.5058824, 0, 1, 1,
0.6864514, 0.3750237, 0.2359044, 0.5137255, 0, 1, 1,
0.6867391, -0.6333894, 3.452713, 0.5176471, 0, 1, 1,
0.6882574, 1.754496, 1.412297, 0.5254902, 0, 1, 1,
0.6886052, -0.8710892, 2.830353, 0.5294118, 0, 1, 1,
0.7012672, -0.9859276, 3.027126, 0.5372549, 0, 1, 1,
0.7056988, -0.8067194, 1.590181, 0.5411765, 0, 1, 1,
0.7071903, -0.1630971, 0.7724863, 0.5490196, 0, 1, 1,
0.7079209, 0.9687943, -0.8865176, 0.5529412, 0, 1, 1,
0.7124796, -1.091646, 0.683149, 0.5607843, 0, 1, 1,
0.7126202, 0.2432692, 0.8348598, 0.5647059, 0, 1, 1,
0.7153311, -1.140384, -0.1765687, 0.572549, 0, 1, 1,
0.7162065, -2.211823, 3.445096, 0.5764706, 0, 1, 1,
0.7204233, -0.8297323, 0.8102093, 0.5843138, 0, 1, 1,
0.7208661, 1.497135, 2.118943, 0.5882353, 0, 1, 1,
0.7256818, 0.3895181, 4.032189, 0.5960785, 0, 1, 1,
0.7277308, 1.477336, 0.3567623, 0.6039216, 0, 1, 1,
0.7320006, -0.4310643, 1.861236, 0.6078432, 0, 1, 1,
0.7321113, -0.357513, 3.600434, 0.6156863, 0, 1, 1,
0.7424328, -0.3483269, 2.589158, 0.6196079, 0, 1, 1,
0.7432273, 1.723532, 2.0438, 0.627451, 0, 1, 1,
0.7513345, -0.3184528, 2.230127, 0.6313726, 0, 1, 1,
0.7518103, -1.791612, 2.95605, 0.6392157, 0, 1, 1,
0.7535464, -0.4440763, 1.913253, 0.6431373, 0, 1, 1,
0.7552335, -0.1957225, 1.473576, 0.6509804, 0, 1, 1,
0.7589809, -0.1694428, 2.885729, 0.654902, 0, 1, 1,
0.7632656, 1.530876, 0.7160836, 0.6627451, 0, 1, 1,
0.7696311, -0.2161344, 0.8034526, 0.6666667, 0, 1, 1,
0.778198, -0.8337473, 2.013314, 0.6745098, 0, 1, 1,
0.7872462, -0.8025381, 2.783687, 0.6784314, 0, 1, 1,
0.7879662, 0.02685377, 0.6461309, 0.6862745, 0, 1, 1,
0.7925912, 0.4291431, 1.640115, 0.6901961, 0, 1, 1,
0.7961905, 0.6932272, 0.454855, 0.6980392, 0, 1, 1,
0.7969602, 0.4625848, 0.3674362, 0.7058824, 0, 1, 1,
0.7995133, -0.4929414, 3.237027, 0.7098039, 0, 1, 1,
0.8020593, -0.3517208, 2.423835, 0.7176471, 0, 1, 1,
0.808311, 0.4828793, 0.9199842, 0.7215686, 0, 1, 1,
0.8085161, -0.4924717, 2.21022, 0.7294118, 0, 1, 1,
0.815625, -0.3645059, 0.9860211, 0.7333333, 0, 1, 1,
0.8156565, -0.7848076, 2.467477, 0.7411765, 0, 1, 1,
0.8159612, -1.000543, 3.237985, 0.7450981, 0, 1, 1,
0.8180246, 0.8356032, 0.4271285, 0.7529412, 0, 1, 1,
0.8183362, -2.795432, 2.101467, 0.7568628, 0, 1, 1,
0.819612, -0.4691898, 2.141744, 0.7647059, 0, 1, 1,
0.8206142, -1.192447, 3.598014, 0.7686275, 0, 1, 1,
0.8315594, -1.419647, 1.913886, 0.7764706, 0, 1, 1,
0.8353677, 1.637477, -1.087407, 0.7803922, 0, 1, 1,
0.8372077, -0.03054227, 0.6473578, 0.7882353, 0, 1, 1,
0.8436357, 1.246885, -0.1066764, 0.7921569, 0, 1, 1,
0.8455092, -1.205823, 1.89764, 0.8, 0, 1, 1,
0.8463796, 0.871651, 0.4529539, 0.8078431, 0, 1, 1,
0.8463882, 1.376438, 1.610257, 0.8117647, 0, 1, 1,
0.8508232, -0.3293904, 2.097601, 0.8196079, 0, 1, 1,
0.8719558, -0.8238127, 1.996348, 0.8235294, 0, 1, 1,
0.8744431, 0.7173858, 2.512363, 0.8313726, 0, 1, 1,
0.8790345, 1.592366, -1.420477, 0.8352941, 0, 1, 1,
0.8797925, 2.502249, -0.06818639, 0.8431373, 0, 1, 1,
0.8802255, -1.067493, 2.638173, 0.8470588, 0, 1, 1,
0.8804442, 0.9017694, 1.78687, 0.854902, 0, 1, 1,
0.8815748, -0.6125439, 1.238739, 0.8588235, 0, 1, 1,
0.8829693, -1.68929, 3.228993, 0.8666667, 0, 1, 1,
0.8830513, -0.7994149, 1.451952, 0.8705882, 0, 1, 1,
0.8925903, -0.2726452, 1.774545, 0.8784314, 0, 1, 1,
0.9005358, 0.5158555, 0.9433659, 0.8823529, 0, 1, 1,
0.9009029, -1.239276, 0.7005399, 0.8901961, 0, 1, 1,
0.9121673, 1.425635, 0.8274603, 0.8941177, 0, 1, 1,
0.9135509, 1.183443, 0.02892202, 0.9019608, 0, 1, 1,
0.9138266, 1.403475, 0.7549693, 0.9098039, 0, 1, 1,
0.9159531, 0.1318888, 1.674358, 0.9137255, 0, 1, 1,
0.9188977, 1.138762, -1.299316, 0.9215686, 0, 1, 1,
0.9189519, 0.6708617, 0.347365, 0.9254902, 0, 1, 1,
0.9191041, -1.114632, -0.1454479, 0.9333333, 0, 1, 1,
0.9197388, -0.5285598, 1.812227, 0.9372549, 0, 1, 1,
0.9201163, 2.420109, -0.4256534, 0.945098, 0, 1, 1,
0.9218628, -0.01481218, 1.702794, 0.9490196, 0, 1, 1,
0.9232572, -0.2201722, 2.37916, 0.9568627, 0, 1, 1,
0.9237925, -0.3542109, 0.4440598, 0.9607843, 0, 1, 1,
0.9241453, -1.610566, 2.632128, 0.9686275, 0, 1, 1,
0.9286577, -0.4085802, 2.713391, 0.972549, 0, 1, 1,
0.9305798, -0.6983525, 2.155552, 0.9803922, 0, 1, 1,
0.9310363, -0.7903875, 1.926545, 0.9843137, 0, 1, 1,
0.9328994, -1.030098, 3.181623, 0.9921569, 0, 1, 1,
0.9345077, -0.4257712, 4.035774, 0.9960784, 0, 1, 1,
0.9377748, -1.234573, 3.385147, 1, 0, 0.9960784, 1,
0.9420117, 0.2180517, 0.4948173, 1, 0, 0.9882353, 1,
0.9467936, 0.1519311, 2.873757, 1, 0, 0.9843137, 1,
0.9515569, -1.19751, 3.169926, 1, 0, 0.9764706, 1,
0.9546436, -0.4959665, 0.7418562, 1, 0, 0.972549, 1,
0.9571545, 1.790577, 0.5409698, 1, 0, 0.9647059, 1,
0.9571684, -0.4602565, 0.4687986, 1, 0, 0.9607843, 1,
0.9602522, -1.50786, 4.281956, 1, 0, 0.9529412, 1,
0.9645917, 2.741306, -0.2367023, 1, 0, 0.9490196, 1,
0.9674361, -0.2062743, 1.231895, 1, 0, 0.9411765, 1,
0.9680977, -1.004386, 1.132513, 1, 0, 0.9372549, 1,
0.9681904, -0.3665725, 1.310791, 1, 0, 0.9294118, 1,
0.9770396, 0.1558034, -0.9388093, 1, 0, 0.9254902, 1,
0.9849415, -0.320751, 1.11682, 1, 0, 0.9176471, 1,
0.9851322, -0.6648949, 2.736485, 1, 0, 0.9137255, 1,
0.9941353, -0.6759683, 2.324121, 1, 0, 0.9058824, 1,
0.9949922, -0.3613847, 2.146551, 1, 0, 0.9019608, 1,
0.9989738, 0.5581037, -0.04724738, 1, 0, 0.8941177, 1,
1.002941, -1.705248, 3.600322, 1, 0, 0.8862745, 1,
1.003735, 0.7706782, -0.6767998, 1, 0, 0.8823529, 1,
1.006018, 1.311517, 0.7545927, 1, 0, 0.8745098, 1,
1.009034, -1.036957, 1.839679, 1, 0, 0.8705882, 1,
1.02167, 0.267791, 2.761186, 1, 0, 0.8627451, 1,
1.023574, 1.391443, -0.2392363, 1, 0, 0.8588235, 1,
1.02398, -0.8108549, 2.497176, 1, 0, 0.8509804, 1,
1.024409, -1.045971, 2.700642, 1, 0, 0.8470588, 1,
1.029099, -0.217116, 2.64593, 1, 0, 0.8392157, 1,
1.034952, -1.567898, 2.617785, 1, 0, 0.8352941, 1,
1.037409, 0.5513623, -0.1602871, 1, 0, 0.827451, 1,
1.041603, -1.011089, 1.071373, 1, 0, 0.8235294, 1,
1.044755, 0.5621262, 2.476702, 1, 0, 0.8156863, 1,
1.049515, 0.7351668, 1.359572, 1, 0, 0.8117647, 1,
1.0546, -3.297992, 1.985732, 1, 0, 0.8039216, 1,
1.055273, 0.06618033, 3.452044, 1, 0, 0.7960784, 1,
1.070606, 0.8385469, -0.2082688, 1, 0, 0.7921569, 1,
1.073023, -1.545555, 1.568348, 1, 0, 0.7843137, 1,
1.075031, -0.5987318, 2.673679, 1, 0, 0.7803922, 1,
1.082277, 0.08861949, 0.2757836, 1, 0, 0.772549, 1,
1.082688, 0.4755139, 2.452503, 1, 0, 0.7686275, 1,
1.083508, 1.433612, 2.437074, 1, 0, 0.7607843, 1,
1.085341, -0.006024351, 2.330807, 1, 0, 0.7568628, 1,
1.089882, -0.2799576, 0.660713, 1, 0, 0.7490196, 1,
1.096982, 1.394769, -0.3277386, 1, 0, 0.7450981, 1,
1.097829, -0.9508558, 2.882447, 1, 0, 0.7372549, 1,
1.109074, -0.3586963, 2.001774, 1, 0, 0.7333333, 1,
1.112442, -0.8943647, 3.10497, 1, 0, 0.7254902, 1,
1.115363, 0.4145262, 2.286917, 1, 0, 0.7215686, 1,
1.117203, -0.4705712, 2.31695, 1, 0, 0.7137255, 1,
1.117459, -0.323917, 2.751848, 1, 0, 0.7098039, 1,
1.136043, 0.6686643, 0.5460153, 1, 0, 0.7019608, 1,
1.138397, 1.328589, 0.6605514, 1, 0, 0.6941177, 1,
1.140207, -0.1805041, 1.679004, 1, 0, 0.6901961, 1,
1.144312, 1.086116, -0.5938839, 1, 0, 0.682353, 1,
1.146375, 0.0508729, 2.010213, 1, 0, 0.6784314, 1,
1.150383, 0.4298593, 0.567904, 1, 0, 0.6705883, 1,
1.15066, 0.4643916, -0.05468682, 1, 0, 0.6666667, 1,
1.151497, -0.1774013, 2.322637, 1, 0, 0.6588235, 1,
1.16569, 1.451427, 0.6129124, 1, 0, 0.654902, 1,
1.172354, 1.74193, 0.01611754, 1, 0, 0.6470588, 1,
1.183703, 0.3410507, 0.957957, 1, 0, 0.6431373, 1,
1.185093, 1.147653, 0.4142621, 1, 0, 0.6352941, 1,
1.193037, -0.6124667, 1.383696, 1, 0, 0.6313726, 1,
1.198073, -0.2659776, 3.397107, 1, 0, 0.6235294, 1,
1.199212, -0.6161571, 1.165262, 1, 0, 0.6196079, 1,
1.215599, -0.5538967, 3.496881, 1, 0, 0.6117647, 1,
1.220181, -1.612508, 3.079118, 1, 0, 0.6078432, 1,
1.220741, 0.06583448, 1.428393, 1, 0, 0.6, 1,
1.224126, 0.1483287, 2.822449, 1, 0, 0.5921569, 1,
1.224878, 0.9842063, 0.09070947, 1, 0, 0.5882353, 1,
1.231533, -0.6550903, 1.122281, 1, 0, 0.5803922, 1,
1.240912, 0.02410023, -0.08102691, 1, 0, 0.5764706, 1,
1.241754, -0.4789397, 1.756759, 1, 0, 0.5686275, 1,
1.25297, -0.5605891, 2.579647, 1, 0, 0.5647059, 1,
1.255059, -0.270631, 1.314234, 1, 0, 0.5568628, 1,
1.256677, -0.64234, -0.3486771, 1, 0, 0.5529412, 1,
1.272411, 0.08724065, 0.6466771, 1, 0, 0.5450981, 1,
1.27831, -0.8692982, 2.103031, 1, 0, 0.5411765, 1,
1.290857, -3.150079, 3.888644, 1, 0, 0.5333334, 1,
1.300894, -1.400564, -0.2017116, 1, 0, 0.5294118, 1,
1.301509, -0.431609, 0.0538242, 1, 0, 0.5215687, 1,
1.303226, -0.1557308, 2.043889, 1, 0, 0.5176471, 1,
1.308667, -1.031825, 0.3784508, 1, 0, 0.509804, 1,
1.334649, 0.5824184, 0.4995902, 1, 0, 0.5058824, 1,
1.341495, 0.3100298, -0.05986667, 1, 0, 0.4980392, 1,
1.344566, -0.5547064, 3.006385, 1, 0, 0.4901961, 1,
1.362142, 2.547041, -0.5686682, 1, 0, 0.4862745, 1,
1.363048, 2.269086, 1.667929, 1, 0, 0.4784314, 1,
1.370807, -0.7519894, 1.245294, 1, 0, 0.4745098, 1,
1.371092, -1.329421, 2.351652, 1, 0, 0.4666667, 1,
1.372653, 1.832794, -0.08794239, 1, 0, 0.4627451, 1,
1.386735, 0.06684487, 1.345624, 1, 0, 0.454902, 1,
1.387739, 0.7738332, 1.221829, 1, 0, 0.4509804, 1,
1.391697, -0.6148152, 1.548212, 1, 0, 0.4431373, 1,
1.392239, -0.3891797, 1.920434, 1, 0, 0.4392157, 1,
1.394453, -1.152388, 1.178486, 1, 0, 0.4313726, 1,
1.402247, 0.6807659, 0.184021, 1, 0, 0.427451, 1,
1.417149, 1.590195, 0.9303897, 1, 0, 0.4196078, 1,
1.420434, -0.2080087, 1.365447, 1, 0, 0.4156863, 1,
1.422435, 0.5837335, 0.1998184, 1, 0, 0.4078431, 1,
1.431698, -0.1185786, 0.6136342, 1, 0, 0.4039216, 1,
1.438606, -0.497553, 1.052644, 1, 0, 0.3960784, 1,
1.439945, -0.09816373, 0.3506434, 1, 0, 0.3882353, 1,
1.441406, -1.85911, 3.196696, 1, 0, 0.3843137, 1,
1.452142, -0.6061752, 1.378235, 1, 0, 0.3764706, 1,
1.457256, 2.140154, 0.9616826, 1, 0, 0.372549, 1,
1.473864, 0.07610257, 1.894226, 1, 0, 0.3647059, 1,
1.504091, -1.390208, 3.217403, 1, 0, 0.3607843, 1,
1.506296, -0.9481077, 3.392531, 1, 0, 0.3529412, 1,
1.509805, -1.021632, 1.75549, 1, 0, 0.3490196, 1,
1.510613, 1.507217, 1.08626, 1, 0, 0.3411765, 1,
1.513831, 0.4876032, 1.436663, 1, 0, 0.3372549, 1,
1.52133, 0.2984175, 2.174054, 1, 0, 0.3294118, 1,
1.522364, -0.1527643, 2.259408, 1, 0, 0.3254902, 1,
1.540551, 0.2255705, 2.426658, 1, 0, 0.3176471, 1,
1.559471, -0.4579284, 2.41268, 1, 0, 0.3137255, 1,
1.574644, 1.085348, -1.38566, 1, 0, 0.3058824, 1,
1.579362, -0.2677109, 1.783749, 1, 0, 0.2980392, 1,
1.583484, 1.710861, 0.4659615, 1, 0, 0.2941177, 1,
1.586118, 0.3178271, -0.1728891, 1, 0, 0.2862745, 1,
1.615246, -0.6766763, 2.926044, 1, 0, 0.282353, 1,
1.633168, -1.976285, 2.483091, 1, 0, 0.2745098, 1,
1.649881, 1.24156, 3.038161, 1, 0, 0.2705882, 1,
1.656438, 1.034764, 0.8720794, 1, 0, 0.2627451, 1,
1.681407, 0.6403452, -0.1041058, 1, 0, 0.2588235, 1,
1.691252, -0.9891945, 1.180202, 1, 0, 0.2509804, 1,
1.695145, 0.4770623, 1.865565, 1, 0, 0.2470588, 1,
1.716548, 1.201192, 1.838461, 1, 0, 0.2392157, 1,
1.725051, -0.0522664, 0.7648187, 1, 0, 0.2352941, 1,
1.761046, -1.495671, 2.642071, 1, 0, 0.227451, 1,
1.762352, 0.3745101, 0.568449, 1, 0, 0.2235294, 1,
1.777453, -1.546894, 3.285113, 1, 0, 0.2156863, 1,
1.812946, 0.2739444, 0.8954757, 1, 0, 0.2117647, 1,
1.820371, -1.326638, 2.091401, 1, 0, 0.2039216, 1,
1.828233, 1.281711, 1.910867, 1, 0, 0.1960784, 1,
1.842344, 0.3275805, 1.390963, 1, 0, 0.1921569, 1,
1.850085, 0.9660127, 0.644833, 1, 0, 0.1843137, 1,
1.897308, -1.11215, 1.459286, 1, 0, 0.1803922, 1,
1.903271, -0.7740085, 3.129202, 1, 0, 0.172549, 1,
1.912288, -0.1219493, 1.643644, 1, 0, 0.1686275, 1,
1.92799, 0.9299009, 2.546192, 1, 0, 0.1607843, 1,
1.947245, -0.5278012, 1.927421, 1, 0, 0.1568628, 1,
1.954795, -0.1679094, 0.919571, 1, 0, 0.1490196, 1,
1.955669, -0.7653691, 1.346578, 1, 0, 0.145098, 1,
1.969193, 0.278522, 2.668485, 1, 0, 0.1372549, 1,
1.989142, -0.332448, 1.705401, 1, 0, 0.1333333, 1,
1.99913, -1.164011, 1.927395, 1, 0, 0.1254902, 1,
2.060612, -1.192722, 1.577732, 1, 0, 0.1215686, 1,
2.079031, -0.05066146, 1.377007, 1, 0, 0.1137255, 1,
2.079709, 1.701672, 2.409953, 1, 0, 0.1098039, 1,
2.089323, 0.04961473, 1.442503, 1, 0, 0.1019608, 1,
2.099345, 1.255372, -0.4240752, 1, 0, 0.09411765, 1,
2.107448, 0.1098315, 1.27506, 1, 0, 0.09019608, 1,
2.137027, -0.808913, 2.364941, 1, 0, 0.08235294, 1,
2.146514, 0.2480572, 1.702307, 1, 0, 0.07843138, 1,
2.178654, 0.755865, 1.351013, 1, 0, 0.07058824, 1,
2.185177, 0.4689162, 0.6160826, 1, 0, 0.06666667, 1,
2.194271, 2.020543, 0.4939713, 1, 0, 0.05882353, 1,
2.206515, -0.70025, 0.7409012, 1, 0, 0.05490196, 1,
2.228957, -0.4896498, 3.237991, 1, 0, 0.04705882, 1,
2.241024, 1.232905, -0.004574822, 1, 0, 0.04313726, 1,
2.250314, -1.083002, 1.431111, 1, 0, 0.03529412, 1,
2.267071, 1.104918, 2.7037, 1, 0, 0.03137255, 1,
2.342921, 0.764819, 0.3123929, 1, 0, 0.02352941, 1,
2.345737, 0.0988555, 2.297992, 1, 0, 0.01960784, 1,
2.349031, -0.2310901, 1.55049, 1, 0, 0.01176471, 1,
2.540464, 1.275386, -0.3219273, 1, 0, 0.007843138, 1
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
-0.5313092, -4.321763, -6.828238, 0, -0.5, 0.5, 0.5,
-0.5313092, -4.321763, -6.828238, 1, -0.5, 0.5, 0.5,
-0.5313092, -4.321763, -6.828238, 1, 1.5, 0.5, 0.5,
-0.5313092, -4.321763, -6.828238, 0, 1.5, 0.5, 0.5
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
-4.644413, -0.2780198, -6.828238, 0, -0.5, 0.5, 0.5,
-4.644413, -0.2780198, -6.828238, 1, -0.5, 0.5, 0.5,
-4.644413, -0.2780198, -6.828238, 1, 1.5, 0.5, 0.5,
-4.644413, -0.2780198, -6.828238, 0, 1.5, 0.5, 0.5
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
-4.644413, -4.321763, 0.4007225, 0, -0.5, 0.5, 0.5,
-4.644413, -4.321763, 0.4007225, 1, -0.5, 0.5, 0.5,
-4.644413, -4.321763, 0.4007225, 1, 1.5, 0.5, 0.5,
-4.644413, -4.321763, 0.4007225, 0, 1.5, 0.5, 0.5
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
-3, -3.388591, -5.160017,
2, -3.388591, -5.160017,
-3, -3.388591, -5.160017,
-3, -3.54412, -5.438054,
-2, -3.388591, -5.160017,
-2, -3.54412, -5.438054,
-1, -3.388591, -5.160017,
-1, -3.54412, -5.438054,
0, -3.388591, -5.160017,
0, -3.54412, -5.438054,
1, -3.388591, -5.160017,
1, -3.54412, -5.438054,
2, -3.388591, -5.160017,
2, -3.54412, -5.438054
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
-3, -3.855177, -5.994128, 0, -0.5, 0.5, 0.5,
-3, -3.855177, -5.994128, 1, -0.5, 0.5, 0.5,
-3, -3.855177, -5.994128, 1, 1.5, 0.5, 0.5,
-3, -3.855177, -5.994128, 0, 1.5, 0.5, 0.5,
-2, -3.855177, -5.994128, 0, -0.5, 0.5, 0.5,
-2, -3.855177, -5.994128, 1, -0.5, 0.5, 0.5,
-2, -3.855177, -5.994128, 1, 1.5, 0.5, 0.5,
-2, -3.855177, -5.994128, 0, 1.5, 0.5, 0.5,
-1, -3.855177, -5.994128, 0, -0.5, 0.5, 0.5,
-1, -3.855177, -5.994128, 1, -0.5, 0.5, 0.5,
-1, -3.855177, -5.994128, 1, 1.5, 0.5, 0.5,
-1, -3.855177, -5.994128, 0, 1.5, 0.5, 0.5,
0, -3.855177, -5.994128, 0, -0.5, 0.5, 0.5,
0, -3.855177, -5.994128, 1, -0.5, 0.5, 0.5,
0, -3.855177, -5.994128, 1, 1.5, 0.5, 0.5,
0, -3.855177, -5.994128, 0, 1.5, 0.5, 0.5,
1, -3.855177, -5.994128, 0, -0.5, 0.5, 0.5,
1, -3.855177, -5.994128, 1, -0.5, 0.5, 0.5,
1, -3.855177, -5.994128, 1, 1.5, 0.5, 0.5,
1, -3.855177, -5.994128, 0, 1.5, 0.5, 0.5,
2, -3.855177, -5.994128, 0, -0.5, 0.5, 0.5,
2, -3.855177, -5.994128, 1, -0.5, 0.5, 0.5,
2, -3.855177, -5.994128, 1, 1.5, 0.5, 0.5,
2, -3.855177, -5.994128, 0, 1.5, 0.5, 0.5
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
-3.695235, -3, -5.160017,
-3.695235, 2, -5.160017,
-3.695235, -3, -5.160017,
-3.853432, -3, -5.438054,
-3.695235, -2, -5.160017,
-3.853432, -2, -5.438054,
-3.695235, -1, -5.160017,
-3.853432, -1, -5.438054,
-3.695235, 0, -5.160017,
-3.853432, 0, -5.438054,
-3.695235, 1, -5.160017,
-3.853432, 1, -5.438054,
-3.695235, 2, -5.160017,
-3.853432, 2, -5.438054
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
-4.169824, -3, -5.994128, 0, -0.5, 0.5, 0.5,
-4.169824, -3, -5.994128, 1, -0.5, 0.5, 0.5,
-4.169824, -3, -5.994128, 1, 1.5, 0.5, 0.5,
-4.169824, -3, -5.994128, 0, 1.5, 0.5, 0.5,
-4.169824, -2, -5.994128, 0, -0.5, 0.5, 0.5,
-4.169824, -2, -5.994128, 1, -0.5, 0.5, 0.5,
-4.169824, -2, -5.994128, 1, 1.5, 0.5, 0.5,
-4.169824, -2, -5.994128, 0, 1.5, 0.5, 0.5,
-4.169824, -1, -5.994128, 0, -0.5, 0.5, 0.5,
-4.169824, -1, -5.994128, 1, -0.5, 0.5, 0.5,
-4.169824, -1, -5.994128, 1, 1.5, 0.5, 0.5,
-4.169824, -1, -5.994128, 0, 1.5, 0.5, 0.5,
-4.169824, 0, -5.994128, 0, -0.5, 0.5, 0.5,
-4.169824, 0, -5.994128, 1, -0.5, 0.5, 0.5,
-4.169824, 0, -5.994128, 1, 1.5, 0.5, 0.5,
-4.169824, 0, -5.994128, 0, 1.5, 0.5, 0.5,
-4.169824, 1, -5.994128, 0, -0.5, 0.5, 0.5,
-4.169824, 1, -5.994128, 1, -0.5, 0.5, 0.5,
-4.169824, 1, -5.994128, 1, 1.5, 0.5, 0.5,
-4.169824, 1, -5.994128, 0, 1.5, 0.5, 0.5,
-4.169824, 2, -5.994128, 0, -0.5, 0.5, 0.5,
-4.169824, 2, -5.994128, 1, -0.5, 0.5, 0.5,
-4.169824, 2, -5.994128, 1, 1.5, 0.5, 0.5,
-4.169824, 2, -5.994128, 0, 1.5, 0.5, 0.5
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
-3.695235, -3.388591, -4,
-3.695235, -3.388591, 4,
-3.695235, -3.388591, -4,
-3.853432, -3.54412, -4,
-3.695235, -3.388591, -2,
-3.853432, -3.54412, -2,
-3.695235, -3.388591, 0,
-3.853432, -3.54412, 0,
-3.695235, -3.388591, 2,
-3.853432, -3.54412, 2,
-3.695235, -3.388591, 4,
-3.853432, -3.54412, 4
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
-4.169824, -3.855177, -4, 0, -0.5, 0.5, 0.5,
-4.169824, -3.855177, -4, 1, -0.5, 0.5, 0.5,
-4.169824, -3.855177, -4, 1, 1.5, 0.5, 0.5,
-4.169824, -3.855177, -4, 0, 1.5, 0.5, 0.5,
-4.169824, -3.855177, -2, 0, -0.5, 0.5, 0.5,
-4.169824, -3.855177, -2, 1, -0.5, 0.5, 0.5,
-4.169824, -3.855177, -2, 1, 1.5, 0.5, 0.5,
-4.169824, -3.855177, -2, 0, 1.5, 0.5, 0.5,
-4.169824, -3.855177, 0, 0, -0.5, 0.5, 0.5,
-4.169824, -3.855177, 0, 1, -0.5, 0.5, 0.5,
-4.169824, -3.855177, 0, 1, 1.5, 0.5, 0.5,
-4.169824, -3.855177, 0, 0, 1.5, 0.5, 0.5,
-4.169824, -3.855177, 2, 0, -0.5, 0.5, 0.5,
-4.169824, -3.855177, 2, 1, -0.5, 0.5, 0.5,
-4.169824, -3.855177, 2, 1, 1.5, 0.5, 0.5,
-4.169824, -3.855177, 2, 0, 1.5, 0.5, 0.5,
-4.169824, -3.855177, 4, 0, -0.5, 0.5, 0.5,
-4.169824, -3.855177, 4, 1, -0.5, 0.5, 0.5,
-4.169824, -3.855177, 4, 1, 1.5, 0.5, 0.5,
-4.169824, -3.855177, 4, 0, 1.5, 0.5, 0.5
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
-3.695235, -3.388591, -5.160017,
-3.695235, 2.832551, -5.160017,
-3.695235, -3.388591, 5.961462,
-3.695235, 2.832551, 5.961462,
-3.695235, -3.388591, -5.160017,
-3.695235, -3.388591, 5.961462,
-3.695235, 2.832551, -5.160017,
-3.695235, 2.832551, 5.961462,
-3.695235, -3.388591, -5.160017,
2.632617, -3.388591, -5.160017,
-3.695235, -3.388591, 5.961462,
2.632617, -3.388591, 5.961462,
-3.695235, 2.832551, -5.160017,
2.632617, 2.832551, -5.160017,
-3.695235, 2.832551, 5.961462,
2.632617, 2.832551, 5.961462,
2.632617, -3.388591, -5.160017,
2.632617, 2.832551, -5.160017,
2.632617, -3.388591, 5.961462,
2.632617, 2.832551, 5.961462,
2.632617, -3.388591, -5.160017,
2.632617, -3.388591, 5.961462,
2.632617, 2.832551, -5.160017,
2.632617, 2.832551, 5.961462
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
var radius = 7.597394;
var distance = 33.80166;
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
mvMatrix.translate( 0.5313092, 0.2780198, -0.4007225 );
mvMatrix.scale( 1.298142, 1.320409, 0.7386114 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.80166);
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
Jasmolin_II<-read.table("Jasmolin_II.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Jasmolin_II$V2
```

```
## Error in eval(expr, envir, enclos): object 'Jasmolin_II' not found
```

```r
y<-Jasmolin_II$V3
```

```
## Error in eval(expr, envir, enclos): object 'Jasmolin_II' not found
```

```r
z<-Jasmolin_II$V4
```

```
## Error in eval(expr, envir, enclos): object 'Jasmolin_II' not found
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
-3.603082, -1.36586, -2.232049, 0, 0, 1, 1, 1,
-3.371925, -0.06727134, -1.608593, 1, 0, 0, 1, 1,
-2.984997, 0.8578488, -1.512068, 1, 0, 0, 1, 1,
-2.732231, 0.1925233, -1.678375, 1, 0, 0, 1, 1,
-2.596834, 0.617772, -0.7671813, 1, 0, 0, 1, 1,
-2.591333, -1.191462, -0.6778125, 1, 0, 0, 1, 1,
-2.526893, 1.185082, -0.8885228, 0, 0, 0, 1, 1,
-2.52564, 0.3603906, -1.82521, 0, 0, 0, 1, 1,
-2.466703, 0.2710858, -1.570504, 0, 0, 0, 1, 1,
-2.464901, 0.5203452, -1.354598, 0, 0, 0, 1, 1,
-2.457145, 0.1024033, 0.2278548, 0, 0, 0, 1, 1,
-2.32779, -0.593302, -0.9513564, 0, 0, 0, 1, 1,
-2.325189, 0.6360992, -1.687861, 0, 0, 0, 1, 1,
-2.26546, -0.6243008, -0.9293271, 1, 1, 1, 1, 1,
-2.190943, 1.281675, -0.4681011, 1, 1, 1, 1, 1,
-2.160477, -0.946839, -1.187139, 1, 1, 1, 1, 1,
-2.147869, -0.6371, -0.5177754, 1, 1, 1, 1, 1,
-2.096244, 0.6011826, 0.03895609, 1, 1, 1, 1, 1,
-2.095212, 0.5481756, -0.444373, 1, 1, 1, 1, 1,
-2.070106, -0.2337295, -1.67355, 1, 1, 1, 1, 1,
-2.044034, -0.1480798, -1.796213, 1, 1, 1, 1, 1,
-1.974867, -2.46968, -2.795346, 1, 1, 1, 1, 1,
-1.968474, 0.07181357, -2.712826, 1, 1, 1, 1, 1,
-1.937662, 0.6064041, -0.8750717, 1, 1, 1, 1, 1,
-1.937045, -0.7974625, -2.881007, 1, 1, 1, 1, 1,
-1.846696, 0.4746466, -0.6421613, 1, 1, 1, 1, 1,
-1.823437, 0.1347348, -2.433551, 1, 1, 1, 1, 1,
-1.817075, -0.5864294, -2.931292, 1, 1, 1, 1, 1,
-1.796909, -0.5084349, -0.3820099, 0, 0, 1, 1, 1,
-1.789605, -1.384338, -2.951597, 1, 0, 0, 1, 1,
-1.780012, -0.36265, -0.9500865, 1, 0, 0, 1, 1,
-1.774124, 1.772722, -0.9578133, 1, 0, 0, 1, 1,
-1.771517, -0.0480368, -0.9205912, 1, 0, 0, 1, 1,
-1.767571, 0.1376933, -3.015389, 1, 0, 0, 1, 1,
-1.76756, 1.48151, -1.160329, 0, 0, 0, 1, 1,
-1.767219, 1.484343, 0.5318478, 0, 0, 0, 1, 1,
-1.760821, 0.2403525, -0.3788729, 0, 0, 0, 1, 1,
-1.727297, 0.904597, -0.8193887, 0, 0, 0, 1, 1,
-1.727093, 0.9343081, -1.70676, 0, 0, 0, 1, 1,
-1.70819, 0.6770447, 0.0359758, 0, 0, 0, 1, 1,
-1.698827, -1.043427, -1.032285, 0, 0, 0, 1, 1,
-1.671201, -0.02110366, 0.5045419, 1, 1, 1, 1, 1,
-1.612729, 0.04359721, -2.484411, 1, 1, 1, 1, 1,
-1.612606, 1.076429, 1.708209, 1, 1, 1, 1, 1,
-1.610158, 0.6939241, 0.2900641, 1, 1, 1, 1, 1,
-1.60652, 0.4960873, 0.4172443, 1, 1, 1, 1, 1,
-1.599413, -0.9434838, -2.6978, 1, 1, 1, 1, 1,
-1.584721, 0.03736578, -2.634079, 1, 1, 1, 1, 1,
-1.584659, 0.9955445, -1.580403, 1, 1, 1, 1, 1,
-1.579572, -1.057087, -1.657147, 1, 1, 1, 1, 1,
-1.571903, -0.1460391, -0.8827154, 1, 1, 1, 1, 1,
-1.536212, -0.9204612, -2.427008, 1, 1, 1, 1, 1,
-1.531107, -0.2964203, -0.5736322, 1, 1, 1, 1, 1,
-1.52389, 1.098475, -1.718445, 1, 1, 1, 1, 1,
-1.520679, -0.7390193, 0.7917525, 1, 1, 1, 1, 1,
-1.506512, 0.7391213, -0.355174, 1, 1, 1, 1, 1,
-1.505382, 0.7711303, -1.444514, 0, 0, 1, 1, 1,
-1.504048, 1.442379, -1.402371, 1, 0, 0, 1, 1,
-1.494305, -2.350658, -2.295155, 1, 0, 0, 1, 1,
-1.478934, -0.6279833, -2.460155, 1, 0, 0, 1, 1,
-1.474662, 1.335584, 0.3524705, 1, 0, 0, 1, 1,
-1.462535, -0.4790458, -2.636142, 1, 0, 0, 1, 1,
-1.452128, -0.1959542, -2.495823, 0, 0, 0, 1, 1,
-1.447801, 0.3402584, -1.386088, 0, 0, 0, 1, 1,
-1.447717, 0.1390597, -2.84933, 0, 0, 0, 1, 1,
-1.439718, 1.316026, -0.3029303, 0, 0, 0, 1, 1,
-1.43631, -1.297914, -0.6322388, 0, 0, 0, 1, 1,
-1.427541, -1.612201, -2.246068, 0, 0, 0, 1, 1,
-1.422309, 0.7540438, -1.246155, 0, 0, 0, 1, 1,
-1.417609, 0.5399029, 0.3242754, 1, 1, 1, 1, 1,
-1.417005, 0.05898087, 0.1860681, 1, 1, 1, 1, 1,
-1.412896, 0.5974971, -1.710024, 1, 1, 1, 1, 1,
-1.410243, -0.4290655, -2.083615, 1, 1, 1, 1, 1,
-1.408913, -0.01679233, -1.546638, 1, 1, 1, 1, 1,
-1.406237, -0.3471774, -4.998054, 1, 1, 1, 1, 1,
-1.398283, -0.9526955, -3.222091, 1, 1, 1, 1, 1,
-1.394365, 2.140036, 0.01900103, 1, 1, 1, 1, 1,
-1.382941, 1.153723, -1.040077, 1, 1, 1, 1, 1,
-1.382789, 1.129696, -1.001462, 1, 1, 1, 1, 1,
-1.381828, -1.017195, -2.389209, 1, 1, 1, 1, 1,
-1.373077, -0.3231686, -1.425972, 1, 1, 1, 1, 1,
-1.369652, -0.5887274, -1.582813, 1, 1, 1, 1, 1,
-1.366721, -0.8465428, -1.759473, 1, 1, 1, 1, 1,
-1.36665, -0.1408958, -0.01517729, 1, 1, 1, 1, 1,
-1.364704, 1.537902, -0.2022786, 0, 0, 1, 1, 1,
-1.361277, 1.986402, -1.544318, 1, 0, 0, 1, 1,
-1.356766, -1.026694, -1.037976, 1, 0, 0, 1, 1,
-1.350152, -0.568962, -1.632657, 1, 0, 0, 1, 1,
-1.347703, -0.1669209, -0.9749623, 1, 0, 0, 1, 1,
-1.346689, 0.3940355, -0.8919772, 1, 0, 0, 1, 1,
-1.331795, -0.9356809, -3.110344, 0, 0, 0, 1, 1,
-1.328876, 0.4719629, 1.034718, 0, 0, 0, 1, 1,
-1.315091, 0.9379982, -1.203686, 0, 0, 0, 1, 1,
-1.312557, -0.4404693, -2.086251, 0, 0, 0, 1, 1,
-1.309306, 1.932851, -1.488004, 0, 0, 0, 1, 1,
-1.307776, -0.2975199, 0.5440816, 0, 0, 0, 1, 1,
-1.29939, 2.052397, -1.6907, 0, 0, 0, 1, 1,
-1.295402, -0.5988265, -2.773847, 1, 1, 1, 1, 1,
-1.291838, -1.289223, -1.876256, 1, 1, 1, 1, 1,
-1.288359, -0.2953037, -2.681087, 1, 1, 1, 1, 1,
-1.287112, 0.2628131, -0.3102414, 1, 1, 1, 1, 1,
-1.286349, 0.2463719, -2.539555, 1, 1, 1, 1, 1,
-1.28347, -0.7053167, -2.997986, 1, 1, 1, 1, 1,
-1.281236, 0.4294223, 0.5977645, 1, 1, 1, 1, 1,
-1.273042, 1.189379, -0.005090081, 1, 1, 1, 1, 1,
-1.270137, 0.2322783, 0.09523705, 1, 1, 1, 1, 1,
-1.268071, -0.4104143, -3.726166, 1, 1, 1, 1, 1,
-1.258525, 0.9329847, -2.414235, 1, 1, 1, 1, 1,
-1.254284, 0.1509677, -1.241742, 1, 1, 1, 1, 1,
-1.242583, 1.323491, -1.133686, 1, 1, 1, 1, 1,
-1.235305, 0.7670004, -0.5157683, 1, 1, 1, 1, 1,
-1.231759, 0.7172932, 0.723149, 1, 1, 1, 1, 1,
-1.229306, -1.793706, -4.37633, 0, 0, 1, 1, 1,
-1.222194, -0.6298074, -0.8601309, 1, 0, 0, 1, 1,
-1.222095, 0.03503013, -2.024219, 1, 0, 0, 1, 1,
-1.207103, 1.046901, -0.2348225, 1, 0, 0, 1, 1,
-1.206175, 0.5917044, 0.1070663, 1, 0, 0, 1, 1,
-1.20491, -1.79881, -2.654197, 1, 0, 0, 1, 1,
-1.192943, 0.04295792, 0.007967465, 0, 0, 0, 1, 1,
-1.191657, 0.9956242, -1.469824, 0, 0, 0, 1, 1,
-1.191176, -0.3205136, -1.61005, 0, 0, 0, 1, 1,
-1.190848, 0.3001089, -2.232816, 0, 0, 0, 1, 1,
-1.186228, 0.3943005, -0.9328639, 0, 0, 0, 1, 1,
-1.18229, 0.5180913, -0.3376885, 0, 0, 0, 1, 1,
-1.161937, 0.8371335, -2.114634, 0, 0, 0, 1, 1,
-1.161207, -0.7287486, -3.864165, 1, 1, 1, 1, 1,
-1.145067, 0.3289158, 0.2356951, 1, 1, 1, 1, 1,
-1.138261, 1.776678, -1.166265, 1, 1, 1, 1, 1,
-1.13721, 0.8812862, -1.751217, 1, 1, 1, 1, 1,
-1.137012, 0.4184991, 0.3665162, 1, 1, 1, 1, 1,
-1.134082, 1.233382, -0.08233607, 1, 1, 1, 1, 1,
-1.133976, -0.01594969, -2.210324, 1, 1, 1, 1, 1,
-1.132503, 0.8137904, -1.419255, 1, 1, 1, 1, 1,
-1.110767, -1.170639, -2.706363, 1, 1, 1, 1, 1,
-1.110252, 0.1120012, -1.136501, 1, 1, 1, 1, 1,
-1.098039, 0.3963892, 0.9276239, 1, 1, 1, 1, 1,
-1.093286, -0.4321945, -2.075638, 1, 1, 1, 1, 1,
-1.087563, -1.321553, -2.354907, 1, 1, 1, 1, 1,
-1.085221, 0.6026477, -2.370234, 1, 1, 1, 1, 1,
-1.081209, -0.448785, -3.150213, 1, 1, 1, 1, 1,
-1.079141, -0.6516096, -3.342368, 0, 0, 1, 1, 1,
-1.072298, 0.1355119, -1.021726, 1, 0, 0, 1, 1,
-1.057576, 0.9064916, -2.241233, 1, 0, 0, 1, 1,
-1.057083, -1.879144, -1.989026, 1, 0, 0, 1, 1,
-1.056541, 2.576667, -0.9471064, 1, 0, 0, 1, 1,
-1.05301, 0.5053474, -0.6051916, 1, 0, 0, 1, 1,
-1.045131, -0.4544869, -2.357503, 0, 0, 0, 1, 1,
-1.041653, 0.9550866, -0.8312785, 0, 0, 0, 1, 1,
-1.039153, 0.6780344, -0.4194561, 0, 0, 0, 1, 1,
-1.037482, -0.253393, -2.397545, 0, 0, 0, 1, 1,
-1.017476, 0.6943328, -0.7084594, 0, 0, 0, 1, 1,
-1.00874, 1.604352, -1.325942, 0, 0, 0, 1, 1,
-1.008606, 0.7887878, 0.8219999, 0, 0, 0, 1, 1,
-1.007668, 0.6237098, -0.4399646, 1, 1, 1, 1, 1,
-1.006628, 0.9921806, -0.8951671, 1, 1, 1, 1, 1,
-1.005093, -0.1670705, -1.405964, 1, 1, 1, 1, 1,
-0.9932232, 0.4672346, -0.7761602, 1, 1, 1, 1, 1,
-0.9838444, -0.009339002, -1.467568, 1, 1, 1, 1, 1,
-0.978102, 0.1575862, -2.219183, 1, 1, 1, 1, 1,
-0.9702016, -0.4930723, -2.915759, 1, 1, 1, 1, 1,
-0.9680248, -0.3347674, -3.339, 1, 1, 1, 1, 1,
-0.9671294, 1.632037, -1.397419, 1, 1, 1, 1, 1,
-0.9663139, 0.4715291, -0.9912554, 1, 1, 1, 1, 1,
-0.9657015, -0.1925052, -2.010103, 1, 1, 1, 1, 1,
-0.9606196, 0.05912565, -0.2632126, 1, 1, 1, 1, 1,
-0.9581165, 1.521709, -0.9039247, 1, 1, 1, 1, 1,
-0.957126, 0.3077614, -1.40207, 1, 1, 1, 1, 1,
-0.9535376, 0.06080213, -2.067915, 1, 1, 1, 1, 1,
-0.9526107, -0.6560549, -2.51198, 0, 0, 1, 1, 1,
-0.9454126, -1.989264, -3.140885, 1, 0, 0, 1, 1,
-0.9407692, 1.248625, -0.9106194, 1, 0, 0, 1, 1,
-0.9327956, -0.09227057, -1.910403, 1, 0, 0, 1, 1,
-0.9264619, -0.05657617, -2.323404, 1, 0, 0, 1, 1,
-0.926183, 0.9036199, 0.06899282, 1, 0, 0, 1, 1,
-0.9243509, 0.104714, -1.093005, 0, 0, 0, 1, 1,
-0.9138457, 1.462778, 0.0990188, 0, 0, 0, 1, 1,
-0.9115529, 1.118984, -1.434309, 0, 0, 0, 1, 1,
-0.9079056, 0.8855753, -0.05784756, 0, 0, 0, 1, 1,
-0.9037873, 0.2294782, -2.945167, 0, 0, 0, 1, 1,
-0.9012723, -1.3699, -0.9676642, 0, 0, 0, 1, 1,
-0.8994791, 0.8901253, -1.154555, 0, 0, 0, 1, 1,
-0.8957282, -0.3153022, -2.151361, 1, 1, 1, 1, 1,
-0.8926114, 2.635961, -0.1099924, 1, 1, 1, 1, 1,
-0.8877739, -1.712354, -3.020607, 1, 1, 1, 1, 1,
-0.8778955, -0.1293267, -1.439214, 1, 1, 1, 1, 1,
-0.8764529, -0.9171664, -0.6242158, 1, 1, 1, 1, 1,
-0.8754873, 0.6241503, -1.134958, 1, 1, 1, 1, 1,
-0.8747888, -0.2032731, -2.728937, 1, 1, 1, 1, 1,
-0.8739482, -2.128138, -3.336862, 1, 1, 1, 1, 1,
-0.8704122, 0.4358128, -0.5282629, 1, 1, 1, 1, 1,
-0.8701095, -1.779032, -4.428143, 1, 1, 1, 1, 1,
-0.8690326, 0.7387237, -1.798819, 1, 1, 1, 1, 1,
-0.8647251, 1.937316, -2.398927, 1, 1, 1, 1, 1,
-0.8611689, 0.3207681, -1.915154, 1, 1, 1, 1, 1,
-0.8610527, -0.948045, -1.069227, 1, 1, 1, 1, 1,
-0.8580381, 0.4571812, -0.7965698, 1, 1, 1, 1, 1,
-0.8490638, -1.109315, -2.874419, 0, 0, 1, 1, 1,
-0.848233, 0.05113064, 0.1557421, 1, 0, 0, 1, 1,
-0.8459691, 0.6447672, -1.313476, 1, 0, 0, 1, 1,
-0.8363853, 0.935258, 0.7044232, 1, 0, 0, 1, 1,
-0.8363576, 0.1102225, -0.5829192, 1, 0, 0, 1, 1,
-0.8329284, 0.195892, -2.377472, 1, 0, 0, 1, 1,
-0.8325196, 1.098495, 0.04623119, 0, 0, 0, 1, 1,
-0.8302839, -1.284524, -0.9072301, 0, 0, 0, 1, 1,
-0.8290673, 1.506809, 1.461804, 0, 0, 0, 1, 1,
-0.8265483, -0.0754554, -1.741619, 0, 0, 0, 1, 1,
-0.8224595, 0.4319739, -0.8990175, 0, 0, 0, 1, 1,
-0.8213624, 1.452381, -2.050278, 0, 0, 0, 1, 1,
-0.8076558, 0.6625478, 1.299833, 0, 0, 0, 1, 1,
-0.803255, 0.9661183, -1.895714, 1, 1, 1, 1, 1,
-0.8030907, 0.1551261, -1.27491, 1, 1, 1, 1, 1,
-0.7976051, 1.058824, -0.6086546, 1, 1, 1, 1, 1,
-0.7844186, 0.4866426, -1.632849, 1, 1, 1, 1, 1,
-0.7822499, 1.768838, -0.5330435, 1, 1, 1, 1, 1,
-0.777989, 0.009864472, -0.3703103, 1, 1, 1, 1, 1,
-0.7686055, 0.5988805, 2.170256, 1, 1, 1, 1, 1,
-0.7665721, 0.5510545, -0.3064156, 1, 1, 1, 1, 1,
-0.7635726, -1.343709, -3.162555, 1, 1, 1, 1, 1,
-0.7592641, 0.811242, -1.769345, 1, 1, 1, 1, 1,
-0.7583115, 2.058967, -0.7951353, 1, 1, 1, 1, 1,
-0.7567486, -0.2379808, -1.82609, 1, 1, 1, 1, 1,
-0.7517109, -0.1365384, -3.449393, 1, 1, 1, 1, 1,
-0.7506479, -0.6787327, -3.261076, 1, 1, 1, 1, 1,
-0.7500034, 0.7118785, -0.09594154, 1, 1, 1, 1, 1,
-0.7495684, 0.6563743, -0.8446354, 0, 0, 1, 1, 1,
-0.7464515, 1.760436, 0.3144546, 1, 0, 0, 1, 1,
-0.746169, 0.6638477, -1.859643, 1, 0, 0, 1, 1,
-0.7454953, 0.03112872, -0.7487765, 1, 0, 0, 1, 1,
-0.7452129, 1.469801, -0.5555081, 1, 0, 0, 1, 1,
-0.7447186, -1.736001, -2.898756, 1, 0, 0, 1, 1,
-0.7414629, 1.446335, -2.161087, 0, 0, 0, 1, 1,
-0.7406896, -1.182201, -1.904546, 0, 0, 0, 1, 1,
-0.7386915, -0.5792027, -2.220699, 0, 0, 0, 1, 1,
-0.7374563, -0.001282834, -4.162604, 0, 0, 0, 1, 1,
-0.7362162, -0.1704393, -2.296006, 0, 0, 0, 1, 1,
-0.734224, -1.371724, -0.8945458, 0, 0, 0, 1, 1,
-0.7304898, -0.7387282, -3.274286, 0, 0, 0, 1, 1,
-0.7273378, 1.262485, -0.9527999, 1, 1, 1, 1, 1,
-0.7249183, -0.4012912, -2.213986, 1, 1, 1, 1, 1,
-0.7226145, 0.6371793, -0.1917884, 1, 1, 1, 1, 1,
-0.7177023, -0.8616098, -0.722165, 1, 1, 1, 1, 1,
-0.7137061, -1.074933, -3.746422, 1, 1, 1, 1, 1,
-0.7097612, 0.4248686, -0.5522281, 1, 1, 1, 1, 1,
-0.7073154, -0.1340987, -1.895132, 1, 1, 1, 1, 1,
-0.7021313, 0.7318038, -2.2595, 1, 1, 1, 1, 1,
-0.6888175, -0.4020517, -3.177144, 1, 1, 1, 1, 1,
-0.6885486, 0.7359909, -0.3007404, 1, 1, 1, 1, 1,
-0.6880874, -0.3664725, -2.967109, 1, 1, 1, 1, 1,
-0.6844954, -0.3169065, -1.551869, 1, 1, 1, 1, 1,
-0.6757884, 0.09598571, -1.645206, 1, 1, 1, 1, 1,
-0.6740697, -0.3525177, -3.066002, 1, 1, 1, 1, 1,
-0.6722413, 0.1582541, 0.45912, 1, 1, 1, 1, 1,
-0.6716099, 0.7734322, -0.500766, 0, 0, 1, 1, 1,
-0.6647898, -1.435195, -3.529215, 1, 0, 0, 1, 1,
-0.6645761, 0.1954948, -0.5798255, 1, 0, 0, 1, 1,
-0.6590811, 0.8956431, 0.4353047, 1, 0, 0, 1, 1,
-0.6579472, 0.007034805, -1.306055, 1, 0, 0, 1, 1,
-0.6550726, -0.3863013, -0.4457808, 1, 0, 0, 1, 1,
-0.654656, -2.059504, -3.557025, 0, 0, 0, 1, 1,
-0.6528375, 1.507792, 1.701048, 0, 0, 0, 1, 1,
-0.652582, 0.7458061, -0.6095886, 0, 0, 0, 1, 1,
-0.6516133, 2.01769, -1.347132, 0, 0, 0, 1, 1,
-0.6503335, 0.4975533, -0.8467528, 0, 0, 0, 1, 1,
-0.6477838, 1.228784, 0.6590025, 0, 0, 0, 1, 1,
-0.6462737, 0.199985, -2.494491, 0, 0, 0, 1, 1,
-0.6402189, 0.7121959, 0.3421561, 1, 1, 1, 1, 1,
-0.6339988, 0.002769226, -0.6707634, 1, 1, 1, 1, 1,
-0.6294473, 0.6625513, -0.9146886, 1, 1, 1, 1, 1,
-0.6263101, -1.650889, -1.940105, 1, 1, 1, 1, 1,
-0.6217478, -0.769595, -0.9106735, 1, 1, 1, 1, 1,
-0.6176037, 0.2392663, -1.801513, 1, 1, 1, 1, 1,
-0.6147949, 0.2204167, -0.5258678, 1, 1, 1, 1, 1,
-0.6127093, 1.110402, 0.03787781, 1, 1, 1, 1, 1,
-0.6086163, -0.5141183, -0.1845838, 1, 1, 1, 1, 1,
-0.6012176, 1.386369, -1.553361, 1, 1, 1, 1, 1,
-0.6004472, 0.4433933, -0.2835548, 1, 1, 1, 1, 1,
-0.5946651, 0.2902551, -1.694179, 1, 1, 1, 1, 1,
-0.5925681, -0.1705721, -1.254645, 1, 1, 1, 1, 1,
-0.5923156, -1.242369, -1.605404, 1, 1, 1, 1, 1,
-0.5897622, -0.3683217, -4.077843, 1, 1, 1, 1, 1,
-0.5857182, -0.4768926, -1.352013, 0, 0, 1, 1, 1,
-0.5848913, 0.3352164, -0.7737429, 1, 0, 0, 1, 1,
-0.5784142, -0.3603509, -2.239869, 1, 0, 0, 1, 1,
-0.5766226, -1.552403, -3.082795, 1, 0, 0, 1, 1,
-0.5701728, -0.1429384, -0.340717, 1, 0, 0, 1, 1,
-0.5698082, 0.7566831, -1.218982, 1, 0, 0, 1, 1,
-0.5692914, 0.1839062, -0.9017408, 0, 0, 0, 1, 1,
-0.5648044, 0.7217656, 0.7712814, 0, 0, 0, 1, 1,
-0.5640756, -1.236179, -2.952353, 0, 0, 0, 1, 1,
-0.5624522, 1.405153, -0.5435556, 0, 0, 0, 1, 1,
-0.5560767, -0.7279761, -2.701569, 0, 0, 0, 1, 1,
-0.5478147, -0.03478637, -1.128473, 0, 0, 0, 1, 1,
-0.5472143, 0.5288963, 0.1806135, 0, 0, 0, 1, 1,
-0.5439671, -0.006228342, -2.825191, 1, 1, 1, 1, 1,
-0.5409866, 2.010971, -1.164501, 1, 1, 1, 1, 1,
-0.5395619, -0.9977, -2.318451, 1, 1, 1, 1, 1,
-0.5328429, 1.176743, -1.308236, 1, 1, 1, 1, 1,
-0.5321928, 0.5831137, -0.009960783, 1, 1, 1, 1, 1,
-0.5287675, -0.03824889, -1.985803, 1, 1, 1, 1, 1,
-0.5274745, 1.348619, -1.406925, 1, 1, 1, 1, 1,
-0.5190142, -1.211619, -3.952433, 1, 1, 1, 1, 1,
-0.5187094, 0.7667371, -1.424804, 1, 1, 1, 1, 1,
-0.5111331, -0.4034827, -3.398347, 1, 1, 1, 1, 1,
-0.5061085, -0.4894733, -2.865598, 1, 1, 1, 1, 1,
-0.5058566, 0.2647907, -1.052745, 1, 1, 1, 1, 1,
-0.5039376, -1.245807, -2.036204, 1, 1, 1, 1, 1,
-0.4972226, -0.1786363, -2.176579, 1, 1, 1, 1, 1,
-0.4971925, -1.203512, -1.921272, 1, 1, 1, 1, 1,
-0.4966614, 0.5496351, 0.6391454, 0, 0, 1, 1, 1,
-0.4927472, -0.9963605, -2.7712, 1, 0, 0, 1, 1,
-0.489979, 0.9042975, 1.261997, 1, 0, 0, 1, 1,
-0.4834594, -0.4721362, -2.908259, 1, 0, 0, 1, 1,
-0.4831574, -1.285594, -2.495975, 1, 0, 0, 1, 1,
-0.4786485, -0.2030805, -2.58204, 1, 0, 0, 1, 1,
-0.4740325, 1.440366, -0.2194384, 0, 0, 0, 1, 1,
-0.4721853, 0.6725282, -0.8712372, 0, 0, 0, 1, 1,
-0.4687539, -0.2828146, -0.9770986, 0, 0, 0, 1, 1,
-0.4651428, 0.01725127, -2.505584, 0, 0, 0, 1, 1,
-0.4645462, 0.5068941, -0.1029806, 0, 0, 0, 1, 1,
-0.4616838, -0.5192212, -0.1811723, 0, 0, 0, 1, 1,
-0.4540994, -0.6158957, -2.51323, 0, 0, 0, 1, 1,
-0.4529515, 0.4790209, -0.5540686, 1, 1, 1, 1, 1,
-0.452797, 1.034092, 0.852793, 1, 1, 1, 1, 1,
-0.4514818, -1.55584, -3.627011, 1, 1, 1, 1, 1,
-0.4394812, -0.9602017, -3.401231, 1, 1, 1, 1, 1,
-0.4371624, 1.333958, -0.2059884, 1, 1, 1, 1, 1,
-0.4345667, -0.1900936, -1.011235, 1, 1, 1, 1, 1,
-0.4343541, -0.8786215, -1.88225, 1, 1, 1, 1, 1,
-0.4339529, -0.01892675, -1.613431, 1, 1, 1, 1, 1,
-0.4337511, 0.2548107, -1.033426, 1, 1, 1, 1, 1,
-0.4320349, 0.008113679, -1.888068, 1, 1, 1, 1, 1,
-0.4294134, -0.220254, -2.041888, 1, 1, 1, 1, 1,
-0.4285545, -1.387462, -4.583225, 1, 1, 1, 1, 1,
-0.4265925, -0.05043344, -0.9254254, 1, 1, 1, 1, 1,
-0.4204557, 0.1447044, -1.447005, 1, 1, 1, 1, 1,
-0.414275, 0.5429044, -0.2058527, 1, 1, 1, 1, 1,
-0.4108173, -1.249919, -3.869643, 0, 0, 1, 1, 1,
-0.406466, 1.131907, -0.07267609, 1, 0, 0, 1, 1,
-0.4022767, -1.837056, -0.6993728, 1, 0, 0, 1, 1,
-0.3987055, -1.015035, -2.681694, 1, 0, 0, 1, 1,
-0.3962394, 0.2628289, -3.168696, 1, 0, 0, 1, 1,
-0.3933736, -0.9231187, -3.020598, 1, 0, 0, 1, 1,
-0.3924719, -0.001871133, -1.565992, 0, 0, 0, 1, 1,
-0.3890403, 2.189673, -0.2716701, 0, 0, 0, 1, 1,
-0.3868689, -1.651126, -4.299126, 0, 0, 0, 1, 1,
-0.3868676, -0.3947301, -3.166067, 0, 0, 0, 1, 1,
-0.3802498, 1.932442, -0.1324509, 0, 0, 0, 1, 1,
-0.376317, 1.25013, -1.568597, 0, 0, 0, 1, 1,
-0.3757193, -1.195742, -2.470204, 0, 0, 0, 1, 1,
-0.374687, -1.153029, -4.946051, 1, 1, 1, 1, 1,
-0.3740151, 0.9016908, -1.455263, 1, 1, 1, 1, 1,
-0.3710148, 1.431278, -0.08169073, 1, 1, 1, 1, 1,
-0.3696324, -0.05607003, -2.094438, 1, 1, 1, 1, 1,
-0.3683436, 0.5418426, -0.8578284, 1, 1, 1, 1, 1,
-0.3654833, -0.1362296, -3.759292, 1, 1, 1, 1, 1,
-0.3629585, 2.254982, -0.173436, 1, 1, 1, 1, 1,
-0.3629007, 2.728745, 1.65325, 1, 1, 1, 1, 1,
-0.3608471, -1.288849, -2.182323, 1, 1, 1, 1, 1,
-0.3564609, 0.493771, -0.2513364, 1, 1, 1, 1, 1,
-0.3508771, -0.04682096, -3.674905, 1, 1, 1, 1, 1,
-0.3505891, -0.6919637, -3.258579, 1, 1, 1, 1, 1,
-0.3471808, -1.484207, -1.796373, 1, 1, 1, 1, 1,
-0.3423432, -0.1770339, -2.50865, 1, 1, 1, 1, 1,
-0.337867, -0.3005873, -0.5569612, 1, 1, 1, 1, 1,
-0.3377664, -0.2598505, -3.740157, 0, 0, 1, 1, 1,
-0.3374505, -0.6084779, -1.966656, 1, 0, 0, 1, 1,
-0.3355232, 0.8287427, -2.525966, 1, 0, 0, 1, 1,
-0.3224893, 0.3411604, -1.610274, 1, 0, 0, 1, 1,
-0.3186172, 1.156525, 0.3517476, 1, 0, 0, 1, 1,
-0.3154405, -2.680338, -3.065389, 1, 0, 0, 1, 1,
-0.3135227, -0.3914161, -2.996768, 0, 0, 0, 1, 1,
-0.3132277, 0.3334559, -0.07221362, 0, 0, 0, 1, 1,
-0.3006369, 1.424711, -0.3698851, 0, 0, 0, 1, 1,
-0.2975713, -1.249199, -1.194825, 0, 0, 0, 1, 1,
-0.2960312, 0.4111997, -0.5468954, 0, 0, 0, 1, 1,
-0.2927527, 0.9356654, -0.1283496, 0, 0, 0, 1, 1,
-0.291092, -0.9039432, -3.289833, 0, 0, 0, 1, 1,
-0.2896917, -0.3230698, -2.153942, 1, 1, 1, 1, 1,
-0.2865226, 0.140515, -0.8044903, 1, 1, 1, 1, 1,
-0.285946, -0.7585179, -3.573095, 1, 1, 1, 1, 1,
-0.285253, -1.212569, -3.483679, 1, 1, 1, 1, 1,
-0.2814098, -1.49817, -1.039538, 1, 1, 1, 1, 1,
-0.2808363, 1.692792, -1.389458, 1, 1, 1, 1, 1,
-0.2803001, -0.08727024, -2.022716, 1, 1, 1, 1, 1,
-0.2754491, 0.9916891, 0.7292769, 1, 1, 1, 1, 1,
-0.2750151, 0.1294146, 0.07814686, 1, 1, 1, 1, 1,
-0.2749912, 0.961919, 0.3627749, 1, 1, 1, 1, 1,
-0.2745786, -1.825483, -2.789688, 1, 1, 1, 1, 1,
-0.2715956, 0.9582296, 0.6903809, 1, 1, 1, 1, 1,
-0.2646388, -0.5651169, -2.483754, 1, 1, 1, 1, 1,
-0.262143, 0.893972, 0.2530818, 1, 1, 1, 1, 1,
-0.2530105, -1.692921, -2.024501, 1, 1, 1, 1, 1,
-0.2446656, 0.8193949, 0.9141124, 0, 0, 1, 1, 1,
-0.2435007, -0.3519565, -2.709821, 1, 0, 0, 1, 1,
-0.2394957, -0.622967, -2.370572, 1, 0, 0, 1, 1,
-0.2364495, -1.460648, -2.608093, 1, 0, 0, 1, 1,
-0.2353419, -0.7067727, -2.588482, 1, 0, 0, 1, 1,
-0.23419, -0.660035, -3.394041, 1, 0, 0, 1, 1,
-0.2335359, 0.714757, -0.8074316, 0, 0, 0, 1, 1,
-0.2310912, 1.312258, 1.434948, 0, 0, 0, 1, 1,
-0.2274899, -0.09530976, -4.090868, 0, 0, 0, 1, 1,
-0.2192616, -0.247898, -1.731562, 0, 0, 0, 1, 1,
-0.2191405, 0.9654579, -0.180873, 0, 0, 0, 1, 1,
-0.2110118, -0.1344356, -3.321265, 0, 0, 0, 1, 1,
-0.2109281, 0.9741859, -2.355094, 0, 0, 0, 1, 1,
-0.2108792, 0.6015356, -0.6429442, 1, 1, 1, 1, 1,
-0.2101049, -1.821987, -2.039022, 1, 1, 1, 1, 1,
-0.2043916, -1.928502, -2.214697, 1, 1, 1, 1, 1,
-0.2018853, -0.6383455, -3.621036, 1, 1, 1, 1, 1,
-0.1992301, 0.9912621, 0.666346, 1, 1, 1, 1, 1,
-0.1978488, 2.011973, -2.168358, 1, 1, 1, 1, 1,
-0.1968854, -1.541806, -3.750063, 1, 1, 1, 1, 1,
-0.1937151, 2.741952, -0.2205551, 1, 1, 1, 1, 1,
-0.1931108, 1.956111, 0.03928009, 1, 1, 1, 1, 1,
-0.190169, 1.226223, -0.7950626, 1, 1, 1, 1, 1,
-0.187398, 0.3750634, 0.8361889, 1, 1, 1, 1, 1,
-0.1866661, -0.9514651, -1.318052, 1, 1, 1, 1, 1,
-0.1826631, 0.8743182, 1.910999, 1, 1, 1, 1, 1,
-0.180322, -1.163859, -3.626582, 1, 1, 1, 1, 1,
-0.17578, -0.4227745, -3.13223, 1, 1, 1, 1, 1,
-0.1739826, -0.8331195, -2.015637, 0, 0, 1, 1, 1,
-0.1730547, 0.4389428, 1.014064, 1, 0, 0, 1, 1,
-0.1693673, 0.2245492, -0.8412899, 1, 0, 0, 1, 1,
-0.1651739, 0.1323537, -1.089864, 1, 0, 0, 1, 1,
-0.16366, 1.017088, -1.811652, 1, 0, 0, 1, 1,
-0.1634168, 0.2567312, -0.6163423, 1, 0, 0, 1, 1,
-0.1631974, -0.7352182, -1.776291, 0, 0, 0, 1, 1,
-0.1608258, 1.590353, -1.008255, 0, 0, 0, 1, 1,
-0.1554711, -1.806101, -3.034289, 0, 0, 0, 1, 1,
-0.1513391, 0.392942, -1.124118, 0, 0, 0, 1, 1,
-0.1506152, 0.7346179, -1.86834, 0, 0, 0, 1, 1,
-0.149804, 1.939047, -0.6954548, 0, 0, 0, 1, 1,
-0.1493798, -1.086887, -2.282544, 0, 0, 0, 1, 1,
-0.1430165, 0.03635853, -1.506468, 1, 1, 1, 1, 1,
-0.1408737, 0.7198952, 1.019268, 1, 1, 1, 1, 1,
-0.1387291, -0.7148982, -1.067073, 1, 1, 1, 1, 1,
-0.133353, -0.8654181, -3.607411, 1, 1, 1, 1, 1,
-0.1308758, -1.252828, -3.403997, 1, 1, 1, 1, 1,
-0.1294675, -0.03321313, -1.677283, 1, 1, 1, 1, 1,
-0.1291556, 1.920185, 0.4526556, 1, 1, 1, 1, 1,
-0.1279258, -0.3041071, -2.894416, 1, 1, 1, 1, 1,
-0.1251203, -0.6250985, -3.233659, 1, 1, 1, 1, 1,
-0.1239512, -0.08832702, -1.794255, 1, 1, 1, 1, 1,
-0.1206837, -0.0493166, -3.623523, 1, 1, 1, 1, 1,
-0.1191672, 0.2603443, -1.900505, 1, 1, 1, 1, 1,
-0.118752, -0.1543801, -3.604893, 1, 1, 1, 1, 1,
-0.1185799, 1.885192, -0.2426573, 1, 1, 1, 1, 1,
-0.1136356, 0.5414348, 0.4374485, 1, 1, 1, 1, 1,
-0.1127688, 0.8646418, 0.765536, 0, 0, 1, 1, 1,
-0.110167, -0.8657307, -2.070371, 1, 0, 0, 1, 1,
-0.1063385, 0.9219407, -0.4377005, 1, 0, 0, 1, 1,
-0.1017441, 1.751214, -0.7224277, 1, 0, 0, 1, 1,
-0.09985866, 0.7895037, 1.684984, 1, 0, 0, 1, 1,
-0.09960193, 0.4254817, 1.095035, 1, 0, 0, 1, 1,
-0.09884151, 0.2160515, 0.2785563, 0, 0, 0, 1, 1,
-0.09770934, -1.118836, -3.956724, 0, 0, 0, 1, 1,
-0.09678043, 1.740008, 1.511787, 0, 0, 0, 1, 1,
-0.09591693, 1.519783, -1.996428, 0, 0, 0, 1, 1,
-0.09444106, -1.270117, -2.85912, 0, 0, 0, 1, 1,
-0.09047531, 1.410948, 1.546741, 0, 0, 0, 1, 1,
-0.0850101, 1.198, -1.196029, 0, 0, 0, 1, 1,
-0.08419236, 1.968131, -1.281386, 1, 1, 1, 1, 1,
-0.08290984, -0.5492972, -1.818664, 1, 1, 1, 1, 1,
-0.07887411, 0.2745357, 0.3362309, 1, 1, 1, 1, 1,
-0.07823878, -2.194918, -2.480159, 1, 1, 1, 1, 1,
-0.07569103, 0.4489234, -2.238456, 1, 1, 1, 1, 1,
-0.07381627, 1.011111, -0.7212526, 1, 1, 1, 1, 1,
-0.06263319, -0.2799405, -1.867314, 1, 1, 1, 1, 1,
-0.06109569, -2.252995, -3.684235, 1, 1, 1, 1, 1,
-0.05346898, 0.126401, -0.9064698, 1, 1, 1, 1, 1,
-0.05022765, 0.2093362, -2.452267, 1, 1, 1, 1, 1,
-0.04891931, 0.9443185, 1.443327, 1, 1, 1, 1, 1,
-0.04727995, -0.8350623, -4.140367, 1, 1, 1, 1, 1,
-0.04282817, -0.2944853, -3.756188, 1, 1, 1, 1, 1,
-0.03441451, 0.6188542, -2.625691, 1, 1, 1, 1, 1,
-0.03132479, -1.050879, -2.66759, 1, 1, 1, 1, 1,
-0.02605713, 0.4577428, 0.6963577, 0, 0, 1, 1, 1,
-0.02533822, -0.4544797, -2.570026, 1, 0, 0, 1, 1,
-0.0241958, -0.08973962, -3.167422, 1, 0, 0, 1, 1,
-0.02078733, -0.5907831, -2.504839, 1, 0, 0, 1, 1,
-0.0154302, 0.4241036, 0.9354033, 1, 0, 0, 1, 1,
-0.01449851, -1.340466, -2.841701, 1, 0, 0, 1, 1,
-0.01382308, 1.019364, 0.05528278, 0, 0, 0, 1, 1,
-0.01287384, 0.3477981, -1.269655, 0, 0, 0, 1, 1,
-0.009282545, 0.2146951, 0.01944726, 0, 0, 0, 1, 1,
-0.007398368, 0.6738003, -0.8436406, 0, 0, 0, 1, 1,
-0.002815671, -0.48238, -2.772762, 0, 0, 0, 1, 1,
0.0003898415, 1.074048, -0.6209037, 0, 0, 0, 1, 1,
0.001244002, 1.196776, 0.08294071, 0, 0, 0, 1, 1,
0.002830432, 0.04131666, -0.6386538, 1, 1, 1, 1, 1,
0.005739194, -0.9268748, 2.591308, 1, 1, 1, 1, 1,
0.005796663, -0.504123, 1.511252, 1, 1, 1, 1, 1,
0.006564631, -0.44344, 1.419761, 1, 1, 1, 1, 1,
0.008622684, -1.416776, 5.799499, 1, 1, 1, 1, 1,
0.009537241, -1.165646, 3.978319, 1, 1, 1, 1, 1,
0.01259322, 0.9685888, 0.4749314, 1, 1, 1, 1, 1,
0.01359825, -0.8966737, 3.554117, 1, 1, 1, 1, 1,
0.01723256, -0.6666531, 3.027231, 1, 1, 1, 1, 1,
0.02123972, -0.8740891, 1.876026, 1, 1, 1, 1, 1,
0.02162359, -0.5020923, 3.747642, 1, 1, 1, 1, 1,
0.02398591, 0.2364291, -0.5528071, 1, 1, 1, 1, 1,
0.02574428, -0.7704269, 4.638468, 1, 1, 1, 1, 1,
0.02843124, 0.3789116, -1.566873, 1, 1, 1, 1, 1,
0.03180115, 0.2582754, -0.2873519, 1, 1, 1, 1, 1,
0.03208088, 0.6122571, -0.3656864, 0, 0, 1, 1, 1,
0.03652335, -1.101149, 4.148339, 1, 0, 0, 1, 1,
0.03957466, 0.8276299, 0.1972561, 1, 0, 0, 1, 1,
0.04127686, -2.634268, 3.624202, 1, 0, 0, 1, 1,
0.04485819, -0.103668, 1.841569, 1, 0, 0, 1, 1,
0.04802222, 0.4226101, 0.08508154, 1, 0, 0, 1, 1,
0.05353002, 0.7630294, 0.2040279, 0, 0, 0, 1, 1,
0.05560654, -1.195378, 2.338712, 0, 0, 0, 1, 1,
0.05677287, 0.0220911, 1.677686, 0, 0, 0, 1, 1,
0.06053811, 1.682867, 1.200134, 0, 0, 0, 1, 1,
0.06181603, -1.577412, 1.724934, 0, 0, 0, 1, 1,
0.06286219, 0.1147126, 0.524999, 0, 0, 0, 1, 1,
0.06347494, 0.545905, -1.184, 0, 0, 0, 1, 1,
0.06848146, -0.4494886, 4.294425, 1, 1, 1, 1, 1,
0.07035854, 0.1520195, 1.568606, 1, 1, 1, 1, 1,
0.07148103, -0.1817532, 3.971381, 1, 1, 1, 1, 1,
0.07319636, 0.02313844, 0.4197829, 1, 1, 1, 1, 1,
0.07379986, 1.314498, -1.456048, 1, 1, 1, 1, 1,
0.07497223, -0.6164623, 3.33321, 1, 1, 1, 1, 1,
0.07585262, 1.494046, -0.06669167, 1, 1, 1, 1, 1,
0.08373448, -0.2114083, 2.488531, 1, 1, 1, 1, 1,
0.08468131, -0.3152759, 3.055802, 1, 1, 1, 1, 1,
0.09143308, -0.5574141, 4.11968, 1, 1, 1, 1, 1,
0.09365272, -0.9982165, 2.924488, 1, 1, 1, 1, 1,
0.09451065, 0.1146683, 0.4056853, 1, 1, 1, 1, 1,
0.09557865, 0.7842526, -0.699735, 1, 1, 1, 1, 1,
0.09779343, 0.5487006, 1.963633, 1, 1, 1, 1, 1,
0.1003619, -1.366177, 3.222688, 1, 1, 1, 1, 1,
0.1005312, -0.1283921, 2.512222, 0, 0, 1, 1, 1,
0.1011885, -1.411753, 3.479257, 1, 0, 0, 1, 1,
0.102566, 0.4591657, -1.105783, 1, 0, 0, 1, 1,
0.1084028, 1.458038, -1.916111, 1, 0, 0, 1, 1,
0.1104974, -1.285696, 3.371573, 1, 0, 0, 1, 1,
0.1106634, -1.036236, 1.607162, 1, 0, 0, 1, 1,
0.1171054, 0.482025, -0.7003238, 0, 0, 0, 1, 1,
0.1205887, -0.5848055, 4.286104, 0, 0, 0, 1, 1,
0.1208166, 1.844894, -1.089666, 0, 0, 0, 1, 1,
0.1224862, 1.099881, 0.9630774, 0, 0, 0, 1, 1,
0.1236499, 1.093494, -1.730373, 0, 0, 0, 1, 1,
0.1246501, -0.4019249, 3.653859, 0, 0, 0, 1, 1,
0.1260839, -1.331574, 1.259699, 0, 0, 0, 1, 1,
0.1261494, -0.04602991, 3.033353, 1, 1, 1, 1, 1,
0.1292536, -0.1650896, 2.240346, 1, 1, 1, 1, 1,
0.1314982, 1.441284, -0.324602, 1, 1, 1, 1, 1,
0.131987, 0.2145109, 0.6503395, 1, 1, 1, 1, 1,
0.1384381, -0.9532891, 4.111717, 1, 1, 1, 1, 1,
0.1388551, -0.7631062, 3.740452, 1, 1, 1, 1, 1,
0.1392604, -0.5789385, 2.573751, 1, 1, 1, 1, 1,
0.140524, -0.1805952, 3.415539, 1, 1, 1, 1, 1,
0.1423197, -0.6355029, 3.560786, 1, 1, 1, 1, 1,
0.1441505, -1.164421, 2.20588, 1, 1, 1, 1, 1,
0.1446472, -1.210772, 2.48179, 1, 1, 1, 1, 1,
0.1456187, 0.1160636, 1.670411, 1, 1, 1, 1, 1,
0.1470438, 0.6476649, -1.581649, 1, 1, 1, 1, 1,
0.1509094, -1.921546, 1.785379, 1, 1, 1, 1, 1,
0.1519884, -0.1586302, 1.865936, 1, 1, 1, 1, 1,
0.1607557, 0.7380876, 1.717925, 0, 0, 1, 1, 1,
0.160791, 1.325491, 1.776372, 1, 0, 0, 1, 1,
0.1630092, 0.1675514, 1.892908, 1, 0, 0, 1, 1,
0.1631604, -0.1753753, 1.619362, 1, 0, 0, 1, 1,
0.1638841, 1.498029, 1.520203, 1, 0, 0, 1, 1,
0.1649926, -1.180069, 3.163743, 1, 0, 0, 1, 1,
0.1683522, -0.9937704, 2.098891, 0, 0, 0, 1, 1,
0.1690881, -1.099759, 1.364504, 0, 0, 0, 1, 1,
0.1760065, 0.6232214, 2.257514, 0, 0, 0, 1, 1,
0.1802872, 0.133603, 2.522101, 0, 0, 0, 1, 1,
0.1826577, 0.8928286, -0.6259558, 0, 0, 0, 1, 1,
0.1860467, 0.28379, 1.122367, 0, 0, 0, 1, 1,
0.1896408, -0.4784728, 3.731873, 0, 0, 0, 1, 1,
0.191344, 0.180411, 1.019134, 1, 1, 1, 1, 1,
0.1947301, -0.3754184, 0.6989549, 1, 1, 1, 1, 1,
0.196096, -0.4521134, 1.853163, 1, 1, 1, 1, 1,
0.1983801, -0.1598245, 4.216515, 1, 1, 1, 1, 1,
0.2028347, -0.1559833, 0.7784972, 1, 1, 1, 1, 1,
0.2047406, 1.158618, 1.09587, 1, 1, 1, 1, 1,
0.2068972, 1.512737, -1.079804, 1, 1, 1, 1, 1,
0.2076629, 0.6125255, -1.682289, 1, 1, 1, 1, 1,
0.2090683, 1.673407, -0.3278162, 1, 1, 1, 1, 1,
0.2100977, -1.33082, 3.399394, 1, 1, 1, 1, 1,
0.2103674, -0.5431744, 3.316276, 1, 1, 1, 1, 1,
0.2112573, 0.8586736, 1.207627, 1, 1, 1, 1, 1,
0.2123806, 0.4737805, -0.05913384, 1, 1, 1, 1, 1,
0.2173998, 1.067386, -2.126357, 1, 1, 1, 1, 1,
0.2201219, 0.6458709, -1.50138, 1, 1, 1, 1, 1,
0.2202989, 0.6664228, 0.6982846, 0, 0, 1, 1, 1,
0.2258096, -0.1676384, 1.669466, 1, 0, 0, 1, 1,
0.229966, -1.950628, 1.333388, 1, 0, 0, 1, 1,
0.2320224, 0.09230287, 0.6758426, 1, 0, 0, 1, 1,
0.2360727, -1.251971, 2.208411, 1, 0, 0, 1, 1,
0.2373211, 1.412243, -0.2401394, 1, 0, 0, 1, 1,
0.2393242, 1.017031, 0.6763326, 0, 0, 0, 1, 1,
0.2394584, 0.7477157, 0.03402158, 0, 0, 0, 1, 1,
0.2399485, 1.841625, 0.5146948, 0, 0, 0, 1, 1,
0.242775, -0.6146755, 3.256804, 0, 0, 0, 1, 1,
0.2434043, -0.2483902, 2.930244, 0, 0, 0, 1, 1,
0.2460508, -0.1647968, 2.054372, 0, 0, 0, 1, 1,
0.2497374, -0.8540205, 0.469262, 0, 0, 0, 1, 1,
0.2521833, -0.2029156, 2.287296, 1, 1, 1, 1, 1,
0.2534523, 1.115952, 1.160929, 1, 1, 1, 1, 1,
0.2540321, 1.939678, -0.2563159, 1, 1, 1, 1, 1,
0.2565202, 1.320793, 0.1227967, 1, 1, 1, 1, 1,
0.258744, 1.089871, 1.19912, 1, 1, 1, 1, 1,
0.2592049, 1.053728, 1.059777, 1, 1, 1, 1, 1,
0.2594293, 1.369357, 1.885316, 1, 1, 1, 1, 1,
0.2599083, 0.183871, 0.3297448, 1, 1, 1, 1, 1,
0.2605868, 1.86366, 0.007307413, 1, 1, 1, 1, 1,
0.2622656, -1.958676, 2.49212, 1, 1, 1, 1, 1,
0.2646694, -1.96508, 3.858594, 1, 1, 1, 1, 1,
0.2758777, -0.4664985, 0.5148571, 1, 1, 1, 1, 1,
0.2786101, -0.4384078, 1.444222, 1, 1, 1, 1, 1,
0.2826133, 0.9577582, -2.190753, 1, 1, 1, 1, 1,
0.284761, -0.284376, 1.479214, 1, 1, 1, 1, 1,
0.2863, -0.03530401, 1.536988, 0, 0, 1, 1, 1,
0.2893729, -0.9429039, 4.524022, 1, 0, 0, 1, 1,
0.2994228, 0.4718336, 1.723782, 1, 0, 0, 1, 1,
0.300395, 0.8110731, -0.3881428, 1, 0, 0, 1, 1,
0.3004277, 1.024039, 0.01540797, 1, 0, 0, 1, 1,
0.3049085, -1.012563, 2.796209, 1, 0, 0, 1, 1,
0.3117508, -1.133772, 3.500444, 0, 0, 0, 1, 1,
0.3135058, -0.1352966, 1.947127, 0, 0, 0, 1, 1,
0.3190973, -0.7161819, 1.269452, 0, 0, 0, 1, 1,
0.3201156, 0.345349, -0.6346959, 0, 0, 0, 1, 1,
0.3223128, 0.9803416, 0.6255648, 0, 0, 0, 1, 1,
0.3246229, 0.4007456, 1.223417, 0, 0, 0, 1, 1,
0.3305315, 0.3898825, 1.051275, 0, 0, 0, 1, 1,
0.3328402, -0.3698983, 2.880148, 1, 1, 1, 1, 1,
0.3353428, -0.9270027, 2.782354, 1, 1, 1, 1, 1,
0.335889, -1.276303, 2.447308, 1, 1, 1, 1, 1,
0.3361521, 0.5421603, 0.3491101, 1, 1, 1, 1, 1,
0.3418625, -0.3742431, 2.875975, 1, 1, 1, 1, 1,
0.3430492, -3.258215, 2.139677, 1, 1, 1, 1, 1,
0.3484558, -0.7155619, 2.998709, 1, 1, 1, 1, 1,
0.3503817, 0.9484793, 1.962376, 1, 1, 1, 1, 1,
0.3540786, -1.979381, 4.70282, 1, 1, 1, 1, 1,
0.3541003, 0.6286876, -0.005920527, 1, 1, 1, 1, 1,
0.3556417, -0.8040752, 2.096375, 1, 1, 1, 1, 1,
0.3579283, -2.480509, 4.705732, 1, 1, 1, 1, 1,
0.3592773, -0.4719139, 2.529851, 1, 1, 1, 1, 1,
0.3737375, 0.7403427, 1.01455, 1, 1, 1, 1, 1,
0.3757869, -0.629509, 2.865131, 1, 1, 1, 1, 1,
0.3822685, 0.2812779, 2.42389, 0, 0, 1, 1, 1,
0.3888272, -0.944266, 2.753035, 1, 0, 0, 1, 1,
0.3901246, 0.3485571, 0.8457313, 1, 0, 0, 1, 1,
0.3928292, -2.212873, 0.5267654, 1, 0, 0, 1, 1,
0.394704, -0.9847412, 3.724448, 1, 0, 0, 1, 1,
0.3953878, 0.8768043, -0.7153298, 1, 0, 0, 1, 1,
0.3955928, 1.011683, 0.4098759, 0, 0, 0, 1, 1,
0.3956518, -0.499527, 2.59995, 0, 0, 0, 1, 1,
0.3990065, 1.118187, 1.167089, 0, 0, 0, 1, 1,
0.3991078, 0.8158819, 1.734228, 0, 0, 0, 1, 1,
0.3992141, 0.2433401, -0.3045309, 0, 0, 0, 1, 1,
0.4001425, -2.495902, 3.1633, 0, 0, 0, 1, 1,
0.40177, -0.6734275, 1.764349, 0, 0, 0, 1, 1,
0.402185, -1.528131, 4.1243, 1, 1, 1, 1, 1,
0.4058273, -0.435415, 3.46341, 1, 1, 1, 1, 1,
0.4067412, -1.16847, 1.539586, 1, 1, 1, 1, 1,
0.4101502, -0.2830707, 1.905868, 1, 1, 1, 1, 1,
0.4109336, 0.1399628, 0.5254358, 1, 1, 1, 1, 1,
0.4115898, -0.4564418, 1.414427, 1, 1, 1, 1, 1,
0.4184899, -0.07066013, 1.586664, 1, 1, 1, 1, 1,
0.4219248, -0.02489123, 0.04835005, 1, 1, 1, 1, 1,
0.4247349, 0.6557443, 1.431575, 1, 1, 1, 1, 1,
0.4255562, 0.09276865, 1.113653, 1, 1, 1, 1, 1,
0.4281895, -0.7428896, 3.651444, 1, 1, 1, 1, 1,
0.4311077, -0.6530704, 4.056191, 1, 1, 1, 1, 1,
0.4330186, 0.1510308, 1.088258, 1, 1, 1, 1, 1,
0.4378253, -0.07752892, 1.610325, 1, 1, 1, 1, 1,
0.4391596, 0.1891683, 0.565649, 1, 1, 1, 1, 1,
0.4447279, -0.7690023, 3.680619, 0, 0, 1, 1, 1,
0.4457655, -0.1436649, 1.512909, 1, 0, 0, 1, 1,
0.4520444, -0.7183674, 2.366452, 1, 0, 0, 1, 1,
0.455917, 1.995701, 2.346798, 1, 0, 0, 1, 1,
0.4588057, 0.2794795, 0.9975143, 1, 0, 0, 1, 1,
0.4603876, -0.5424015, 2.327094, 1, 0, 0, 1, 1,
0.4634027, -0.5965247, 3.657234, 0, 0, 0, 1, 1,
0.4655469, -0.9884698, 1.857471, 0, 0, 0, 1, 1,
0.468292, 1.478967, 0.7182157, 0, 0, 0, 1, 1,
0.4691129, -1.028008, 2.902179, 0, 0, 0, 1, 1,
0.4703991, 1.035319, 0.4894798, 0, 0, 0, 1, 1,
0.4726438, -1.385921, 2.051908, 0, 0, 0, 1, 1,
0.475923, 0.2790305, 2.458997, 0, 0, 0, 1, 1,
0.4762719, -0.4628267, 1.520079, 1, 1, 1, 1, 1,
0.4800906, 0.1451785, 2.171205, 1, 1, 1, 1, 1,
0.4905854, 0.9198949, -0.1771748, 1, 1, 1, 1, 1,
0.4971454, -0.250252, 4.32438, 1, 1, 1, 1, 1,
0.5027553, -0.624488, 1.523403, 1, 1, 1, 1, 1,
0.5079305, -2.49188, 3.562248, 1, 1, 1, 1, 1,
0.5106487, -0.8571556, 0.349327, 1, 1, 1, 1, 1,
0.5139005, 0.8123628, 0.3948155, 1, 1, 1, 1, 1,
0.5233924, -2.46308, 3.956975, 1, 1, 1, 1, 1,
0.5252621, 0.6945871, 1.25881, 1, 1, 1, 1, 1,
0.5291938, -1.274887, 2.868138, 1, 1, 1, 1, 1,
0.5337042, 1.376343, 0.2902061, 1, 1, 1, 1, 1,
0.5367592, -1.216214, 2.365712, 1, 1, 1, 1, 1,
0.5372779, -1.155267, 1.769744, 1, 1, 1, 1, 1,
0.5419907, -0.6957389, 1.855001, 1, 1, 1, 1, 1,
0.5426596, 1.254313, 0.2002501, 0, 0, 1, 1, 1,
0.544563, -0.4349157, 1.717297, 1, 0, 0, 1, 1,
0.5460472, -0.02281499, 2.001707, 1, 0, 0, 1, 1,
0.5477395, -0.963331, 2.031613, 1, 0, 0, 1, 1,
0.5506299, 0.4528455, -0.6043954, 1, 0, 0, 1, 1,
0.5537039, 1.232746, -1.756059, 1, 0, 0, 1, 1,
0.5566329, 0.2298414, 2.842792, 0, 0, 0, 1, 1,
0.5591251, -1.284611, 3.038915, 0, 0, 0, 1, 1,
0.5594621, 0.162973, 2.810049, 0, 0, 0, 1, 1,
0.5606908, 1.363901, 0.6961796, 0, 0, 0, 1, 1,
0.561603, 0.3768147, 0.6318729, 0, 0, 0, 1, 1,
0.5682034, -0.2905822, 1.794078, 0, 0, 0, 1, 1,
0.570228, 0.6309016, 1.970567, 0, 0, 0, 1, 1,
0.5732317, 0.3484221, 1.59315, 1, 1, 1, 1, 1,
0.5761563, 0.4745872, 1.624824, 1, 1, 1, 1, 1,
0.5766492, 0.2874371, 2.407668, 1, 1, 1, 1, 1,
0.5888672, 1.408872, 1.719612, 1, 1, 1, 1, 1,
0.5922756, -1.532454, 3.613681, 1, 1, 1, 1, 1,
0.593515, 0.1840944, 1.61853, 1, 1, 1, 1, 1,
0.6014321, -0.150498, 3.420379, 1, 1, 1, 1, 1,
0.6037541, -1.559803, 2.026694, 1, 1, 1, 1, 1,
0.6049128, -1.296171, 1.589637, 1, 1, 1, 1, 1,
0.6078179, -0.8274076, 1.334869, 1, 1, 1, 1, 1,
0.610078, -1.493867, 3.104346, 1, 1, 1, 1, 1,
0.6118597, 0.171069, 1.671362, 1, 1, 1, 1, 1,
0.6124224, -0.7832068, 3.166254, 1, 1, 1, 1, 1,
0.6132511, 0.4947166, 0.4529373, 1, 1, 1, 1, 1,
0.6185535, 1.012365, -0.233806, 1, 1, 1, 1, 1,
0.6185581, -1.02836, 2.648116, 0, 0, 1, 1, 1,
0.6198568, -0.5294981, 3.533213, 1, 0, 0, 1, 1,
0.6341313, -1.074261, 1.149577, 1, 0, 0, 1, 1,
0.6355655, -0.3192598, -1.189625, 1, 0, 0, 1, 1,
0.6356635, -0.8713707, 2.933742, 1, 0, 0, 1, 1,
0.637355, 1.106562, -0.8102937, 1, 0, 0, 1, 1,
0.6375615, -1.675507, 1.901922, 0, 0, 0, 1, 1,
0.6386098, 0.4220231, 1.035999, 0, 0, 0, 1, 1,
0.6439207, -1.372519, 3.507402, 0, 0, 0, 1, 1,
0.6457203, -1.541651, 1.771918, 0, 0, 0, 1, 1,
0.6507146, -1.119309, 2.418677, 0, 0, 0, 1, 1,
0.6507789, 0.5836918, 0.1429197, 0, 0, 0, 1, 1,
0.6567144, -0.4804577, 2.098563, 0, 0, 0, 1, 1,
0.658929, -0.8884407, 3.901553, 1, 1, 1, 1, 1,
0.6633801, -1.614611, 1.775566, 1, 1, 1, 1, 1,
0.6699154, -0.02410745, 1.438345, 1, 1, 1, 1, 1,
0.6701527, -0.5455927, 3.525607, 1, 1, 1, 1, 1,
0.6702692, -0.9104218, 0.3460091, 1, 1, 1, 1, 1,
0.6758558, 1.658283, -0.317093, 1, 1, 1, 1, 1,
0.6770073, 0.09842293, 0.1994765, 1, 1, 1, 1, 1,
0.680182, -0.2518262, 0.6446225, 1, 1, 1, 1, 1,
0.6807445, -0.9441144, 3.943948, 1, 1, 1, 1, 1,
0.6808038, 1.445179, 0.1421853, 1, 1, 1, 1, 1,
0.680955, -0.7024359, 2.936337, 1, 1, 1, 1, 1,
0.6864514, 0.3750237, 0.2359044, 1, 1, 1, 1, 1,
0.6867391, -0.6333894, 3.452713, 1, 1, 1, 1, 1,
0.6882574, 1.754496, 1.412297, 1, 1, 1, 1, 1,
0.6886052, -0.8710892, 2.830353, 1, 1, 1, 1, 1,
0.7012672, -0.9859276, 3.027126, 0, 0, 1, 1, 1,
0.7056988, -0.8067194, 1.590181, 1, 0, 0, 1, 1,
0.7071903, -0.1630971, 0.7724863, 1, 0, 0, 1, 1,
0.7079209, 0.9687943, -0.8865176, 1, 0, 0, 1, 1,
0.7124796, -1.091646, 0.683149, 1, 0, 0, 1, 1,
0.7126202, 0.2432692, 0.8348598, 1, 0, 0, 1, 1,
0.7153311, -1.140384, -0.1765687, 0, 0, 0, 1, 1,
0.7162065, -2.211823, 3.445096, 0, 0, 0, 1, 1,
0.7204233, -0.8297323, 0.8102093, 0, 0, 0, 1, 1,
0.7208661, 1.497135, 2.118943, 0, 0, 0, 1, 1,
0.7256818, 0.3895181, 4.032189, 0, 0, 0, 1, 1,
0.7277308, 1.477336, 0.3567623, 0, 0, 0, 1, 1,
0.7320006, -0.4310643, 1.861236, 0, 0, 0, 1, 1,
0.7321113, -0.357513, 3.600434, 1, 1, 1, 1, 1,
0.7424328, -0.3483269, 2.589158, 1, 1, 1, 1, 1,
0.7432273, 1.723532, 2.0438, 1, 1, 1, 1, 1,
0.7513345, -0.3184528, 2.230127, 1, 1, 1, 1, 1,
0.7518103, -1.791612, 2.95605, 1, 1, 1, 1, 1,
0.7535464, -0.4440763, 1.913253, 1, 1, 1, 1, 1,
0.7552335, -0.1957225, 1.473576, 1, 1, 1, 1, 1,
0.7589809, -0.1694428, 2.885729, 1, 1, 1, 1, 1,
0.7632656, 1.530876, 0.7160836, 1, 1, 1, 1, 1,
0.7696311, -0.2161344, 0.8034526, 1, 1, 1, 1, 1,
0.778198, -0.8337473, 2.013314, 1, 1, 1, 1, 1,
0.7872462, -0.8025381, 2.783687, 1, 1, 1, 1, 1,
0.7879662, 0.02685377, 0.6461309, 1, 1, 1, 1, 1,
0.7925912, 0.4291431, 1.640115, 1, 1, 1, 1, 1,
0.7961905, 0.6932272, 0.454855, 1, 1, 1, 1, 1,
0.7969602, 0.4625848, 0.3674362, 0, 0, 1, 1, 1,
0.7995133, -0.4929414, 3.237027, 1, 0, 0, 1, 1,
0.8020593, -0.3517208, 2.423835, 1, 0, 0, 1, 1,
0.808311, 0.4828793, 0.9199842, 1, 0, 0, 1, 1,
0.8085161, -0.4924717, 2.21022, 1, 0, 0, 1, 1,
0.815625, -0.3645059, 0.9860211, 1, 0, 0, 1, 1,
0.8156565, -0.7848076, 2.467477, 0, 0, 0, 1, 1,
0.8159612, -1.000543, 3.237985, 0, 0, 0, 1, 1,
0.8180246, 0.8356032, 0.4271285, 0, 0, 0, 1, 1,
0.8183362, -2.795432, 2.101467, 0, 0, 0, 1, 1,
0.819612, -0.4691898, 2.141744, 0, 0, 0, 1, 1,
0.8206142, -1.192447, 3.598014, 0, 0, 0, 1, 1,
0.8315594, -1.419647, 1.913886, 0, 0, 0, 1, 1,
0.8353677, 1.637477, -1.087407, 1, 1, 1, 1, 1,
0.8372077, -0.03054227, 0.6473578, 1, 1, 1, 1, 1,
0.8436357, 1.246885, -0.1066764, 1, 1, 1, 1, 1,
0.8455092, -1.205823, 1.89764, 1, 1, 1, 1, 1,
0.8463796, 0.871651, 0.4529539, 1, 1, 1, 1, 1,
0.8463882, 1.376438, 1.610257, 1, 1, 1, 1, 1,
0.8508232, -0.3293904, 2.097601, 1, 1, 1, 1, 1,
0.8719558, -0.8238127, 1.996348, 1, 1, 1, 1, 1,
0.8744431, 0.7173858, 2.512363, 1, 1, 1, 1, 1,
0.8790345, 1.592366, -1.420477, 1, 1, 1, 1, 1,
0.8797925, 2.502249, -0.06818639, 1, 1, 1, 1, 1,
0.8802255, -1.067493, 2.638173, 1, 1, 1, 1, 1,
0.8804442, 0.9017694, 1.78687, 1, 1, 1, 1, 1,
0.8815748, -0.6125439, 1.238739, 1, 1, 1, 1, 1,
0.8829693, -1.68929, 3.228993, 1, 1, 1, 1, 1,
0.8830513, -0.7994149, 1.451952, 0, 0, 1, 1, 1,
0.8925903, -0.2726452, 1.774545, 1, 0, 0, 1, 1,
0.9005358, 0.5158555, 0.9433659, 1, 0, 0, 1, 1,
0.9009029, -1.239276, 0.7005399, 1, 0, 0, 1, 1,
0.9121673, 1.425635, 0.8274603, 1, 0, 0, 1, 1,
0.9135509, 1.183443, 0.02892202, 1, 0, 0, 1, 1,
0.9138266, 1.403475, 0.7549693, 0, 0, 0, 1, 1,
0.9159531, 0.1318888, 1.674358, 0, 0, 0, 1, 1,
0.9188977, 1.138762, -1.299316, 0, 0, 0, 1, 1,
0.9189519, 0.6708617, 0.347365, 0, 0, 0, 1, 1,
0.9191041, -1.114632, -0.1454479, 0, 0, 0, 1, 1,
0.9197388, -0.5285598, 1.812227, 0, 0, 0, 1, 1,
0.9201163, 2.420109, -0.4256534, 0, 0, 0, 1, 1,
0.9218628, -0.01481218, 1.702794, 1, 1, 1, 1, 1,
0.9232572, -0.2201722, 2.37916, 1, 1, 1, 1, 1,
0.9237925, -0.3542109, 0.4440598, 1, 1, 1, 1, 1,
0.9241453, -1.610566, 2.632128, 1, 1, 1, 1, 1,
0.9286577, -0.4085802, 2.713391, 1, 1, 1, 1, 1,
0.9305798, -0.6983525, 2.155552, 1, 1, 1, 1, 1,
0.9310363, -0.7903875, 1.926545, 1, 1, 1, 1, 1,
0.9328994, -1.030098, 3.181623, 1, 1, 1, 1, 1,
0.9345077, -0.4257712, 4.035774, 1, 1, 1, 1, 1,
0.9377748, -1.234573, 3.385147, 1, 1, 1, 1, 1,
0.9420117, 0.2180517, 0.4948173, 1, 1, 1, 1, 1,
0.9467936, 0.1519311, 2.873757, 1, 1, 1, 1, 1,
0.9515569, -1.19751, 3.169926, 1, 1, 1, 1, 1,
0.9546436, -0.4959665, 0.7418562, 1, 1, 1, 1, 1,
0.9571545, 1.790577, 0.5409698, 1, 1, 1, 1, 1,
0.9571684, -0.4602565, 0.4687986, 0, 0, 1, 1, 1,
0.9602522, -1.50786, 4.281956, 1, 0, 0, 1, 1,
0.9645917, 2.741306, -0.2367023, 1, 0, 0, 1, 1,
0.9674361, -0.2062743, 1.231895, 1, 0, 0, 1, 1,
0.9680977, -1.004386, 1.132513, 1, 0, 0, 1, 1,
0.9681904, -0.3665725, 1.310791, 1, 0, 0, 1, 1,
0.9770396, 0.1558034, -0.9388093, 0, 0, 0, 1, 1,
0.9849415, -0.320751, 1.11682, 0, 0, 0, 1, 1,
0.9851322, -0.6648949, 2.736485, 0, 0, 0, 1, 1,
0.9941353, -0.6759683, 2.324121, 0, 0, 0, 1, 1,
0.9949922, -0.3613847, 2.146551, 0, 0, 0, 1, 1,
0.9989738, 0.5581037, -0.04724738, 0, 0, 0, 1, 1,
1.002941, -1.705248, 3.600322, 0, 0, 0, 1, 1,
1.003735, 0.7706782, -0.6767998, 1, 1, 1, 1, 1,
1.006018, 1.311517, 0.7545927, 1, 1, 1, 1, 1,
1.009034, -1.036957, 1.839679, 1, 1, 1, 1, 1,
1.02167, 0.267791, 2.761186, 1, 1, 1, 1, 1,
1.023574, 1.391443, -0.2392363, 1, 1, 1, 1, 1,
1.02398, -0.8108549, 2.497176, 1, 1, 1, 1, 1,
1.024409, -1.045971, 2.700642, 1, 1, 1, 1, 1,
1.029099, -0.217116, 2.64593, 1, 1, 1, 1, 1,
1.034952, -1.567898, 2.617785, 1, 1, 1, 1, 1,
1.037409, 0.5513623, -0.1602871, 1, 1, 1, 1, 1,
1.041603, -1.011089, 1.071373, 1, 1, 1, 1, 1,
1.044755, 0.5621262, 2.476702, 1, 1, 1, 1, 1,
1.049515, 0.7351668, 1.359572, 1, 1, 1, 1, 1,
1.0546, -3.297992, 1.985732, 1, 1, 1, 1, 1,
1.055273, 0.06618033, 3.452044, 1, 1, 1, 1, 1,
1.070606, 0.8385469, -0.2082688, 0, 0, 1, 1, 1,
1.073023, -1.545555, 1.568348, 1, 0, 0, 1, 1,
1.075031, -0.5987318, 2.673679, 1, 0, 0, 1, 1,
1.082277, 0.08861949, 0.2757836, 1, 0, 0, 1, 1,
1.082688, 0.4755139, 2.452503, 1, 0, 0, 1, 1,
1.083508, 1.433612, 2.437074, 1, 0, 0, 1, 1,
1.085341, -0.006024351, 2.330807, 0, 0, 0, 1, 1,
1.089882, -0.2799576, 0.660713, 0, 0, 0, 1, 1,
1.096982, 1.394769, -0.3277386, 0, 0, 0, 1, 1,
1.097829, -0.9508558, 2.882447, 0, 0, 0, 1, 1,
1.109074, -0.3586963, 2.001774, 0, 0, 0, 1, 1,
1.112442, -0.8943647, 3.10497, 0, 0, 0, 1, 1,
1.115363, 0.4145262, 2.286917, 0, 0, 0, 1, 1,
1.117203, -0.4705712, 2.31695, 1, 1, 1, 1, 1,
1.117459, -0.323917, 2.751848, 1, 1, 1, 1, 1,
1.136043, 0.6686643, 0.5460153, 1, 1, 1, 1, 1,
1.138397, 1.328589, 0.6605514, 1, 1, 1, 1, 1,
1.140207, -0.1805041, 1.679004, 1, 1, 1, 1, 1,
1.144312, 1.086116, -0.5938839, 1, 1, 1, 1, 1,
1.146375, 0.0508729, 2.010213, 1, 1, 1, 1, 1,
1.150383, 0.4298593, 0.567904, 1, 1, 1, 1, 1,
1.15066, 0.4643916, -0.05468682, 1, 1, 1, 1, 1,
1.151497, -0.1774013, 2.322637, 1, 1, 1, 1, 1,
1.16569, 1.451427, 0.6129124, 1, 1, 1, 1, 1,
1.172354, 1.74193, 0.01611754, 1, 1, 1, 1, 1,
1.183703, 0.3410507, 0.957957, 1, 1, 1, 1, 1,
1.185093, 1.147653, 0.4142621, 1, 1, 1, 1, 1,
1.193037, -0.6124667, 1.383696, 1, 1, 1, 1, 1,
1.198073, -0.2659776, 3.397107, 0, 0, 1, 1, 1,
1.199212, -0.6161571, 1.165262, 1, 0, 0, 1, 1,
1.215599, -0.5538967, 3.496881, 1, 0, 0, 1, 1,
1.220181, -1.612508, 3.079118, 1, 0, 0, 1, 1,
1.220741, 0.06583448, 1.428393, 1, 0, 0, 1, 1,
1.224126, 0.1483287, 2.822449, 1, 0, 0, 1, 1,
1.224878, 0.9842063, 0.09070947, 0, 0, 0, 1, 1,
1.231533, -0.6550903, 1.122281, 0, 0, 0, 1, 1,
1.240912, 0.02410023, -0.08102691, 0, 0, 0, 1, 1,
1.241754, -0.4789397, 1.756759, 0, 0, 0, 1, 1,
1.25297, -0.5605891, 2.579647, 0, 0, 0, 1, 1,
1.255059, -0.270631, 1.314234, 0, 0, 0, 1, 1,
1.256677, -0.64234, -0.3486771, 0, 0, 0, 1, 1,
1.272411, 0.08724065, 0.6466771, 1, 1, 1, 1, 1,
1.27831, -0.8692982, 2.103031, 1, 1, 1, 1, 1,
1.290857, -3.150079, 3.888644, 1, 1, 1, 1, 1,
1.300894, -1.400564, -0.2017116, 1, 1, 1, 1, 1,
1.301509, -0.431609, 0.0538242, 1, 1, 1, 1, 1,
1.303226, -0.1557308, 2.043889, 1, 1, 1, 1, 1,
1.308667, -1.031825, 0.3784508, 1, 1, 1, 1, 1,
1.334649, 0.5824184, 0.4995902, 1, 1, 1, 1, 1,
1.341495, 0.3100298, -0.05986667, 1, 1, 1, 1, 1,
1.344566, -0.5547064, 3.006385, 1, 1, 1, 1, 1,
1.362142, 2.547041, -0.5686682, 1, 1, 1, 1, 1,
1.363048, 2.269086, 1.667929, 1, 1, 1, 1, 1,
1.370807, -0.7519894, 1.245294, 1, 1, 1, 1, 1,
1.371092, -1.329421, 2.351652, 1, 1, 1, 1, 1,
1.372653, 1.832794, -0.08794239, 1, 1, 1, 1, 1,
1.386735, 0.06684487, 1.345624, 0, 0, 1, 1, 1,
1.387739, 0.7738332, 1.221829, 1, 0, 0, 1, 1,
1.391697, -0.6148152, 1.548212, 1, 0, 0, 1, 1,
1.392239, -0.3891797, 1.920434, 1, 0, 0, 1, 1,
1.394453, -1.152388, 1.178486, 1, 0, 0, 1, 1,
1.402247, 0.6807659, 0.184021, 1, 0, 0, 1, 1,
1.417149, 1.590195, 0.9303897, 0, 0, 0, 1, 1,
1.420434, -0.2080087, 1.365447, 0, 0, 0, 1, 1,
1.422435, 0.5837335, 0.1998184, 0, 0, 0, 1, 1,
1.431698, -0.1185786, 0.6136342, 0, 0, 0, 1, 1,
1.438606, -0.497553, 1.052644, 0, 0, 0, 1, 1,
1.439945, -0.09816373, 0.3506434, 0, 0, 0, 1, 1,
1.441406, -1.85911, 3.196696, 0, 0, 0, 1, 1,
1.452142, -0.6061752, 1.378235, 1, 1, 1, 1, 1,
1.457256, 2.140154, 0.9616826, 1, 1, 1, 1, 1,
1.473864, 0.07610257, 1.894226, 1, 1, 1, 1, 1,
1.504091, -1.390208, 3.217403, 1, 1, 1, 1, 1,
1.506296, -0.9481077, 3.392531, 1, 1, 1, 1, 1,
1.509805, -1.021632, 1.75549, 1, 1, 1, 1, 1,
1.510613, 1.507217, 1.08626, 1, 1, 1, 1, 1,
1.513831, 0.4876032, 1.436663, 1, 1, 1, 1, 1,
1.52133, 0.2984175, 2.174054, 1, 1, 1, 1, 1,
1.522364, -0.1527643, 2.259408, 1, 1, 1, 1, 1,
1.540551, 0.2255705, 2.426658, 1, 1, 1, 1, 1,
1.559471, -0.4579284, 2.41268, 1, 1, 1, 1, 1,
1.574644, 1.085348, -1.38566, 1, 1, 1, 1, 1,
1.579362, -0.2677109, 1.783749, 1, 1, 1, 1, 1,
1.583484, 1.710861, 0.4659615, 1, 1, 1, 1, 1,
1.586118, 0.3178271, -0.1728891, 0, 0, 1, 1, 1,
1.615246, -0.6766763, 2.926044, 1, 0, 0, 1, 1,
1.633168, -1.976285, 2.483091, 1, 0, 0, 1, 1,
1.649881, 1.24156, 3.038161, 1, 0, 0, 1, 1,
1.656438, 1.034764, 0.8720794, 1, 0, 0, 1, 1,
1.681407, 0.6403452, -0.1041058, 1, 0, 0, 1, 1,
1.691252, -0.9891945, 1.180202, 0, 0, 0, 1, 1,
1.695145, 0.4770623, 1.865565, 0, 0, 0, 1, 1,
1.716548, 1.201192, 1.838461, 0, 0, 0, 1, 1,
1.725051, -0.0522664, 0.7648187, 0, 0, 0, 1, 1,
1.761046, -1.495671, 2.642071, 0, 0, 0, 1, 1,
1.762352, 0.3745101, 0.568449, 0, 0, 0, 1, 1,
1.777453, -1.546894, 3.285113, 0, 0, 0, 1, 1,
1.812946, 0.2739444, 0.8954757, 1, 1, 1, 1, 1,
1.820371, -1.326638, 2.091401, 1, 1, 1, 1, 1,
1.828233, 1.281711, 1.910867, 1, 1, 1, 1, 1,
1.842344, 0.3275805, 1.390963, 1, 1, 1, 1, 1,
1.850085, 0.9660127, 0.644833, 1, 1, 1, 1, 1,
1.897308, -1.11215, 1.459286, 1, 1, 1, 1, 1,
1.903271, -0.7740085, 3.129202, 1, 1, 1, 1, 1,
1.912288, -0.1219493, 1.643644, 1, 1, 1, 1, 1,
1.92799, 0.9299009, 2.546192, 1, 1, 1, 1, 1,
1.947245, -0.5278012, 1.927421, 1, 1, 1, 1, 1,
1.954795, -0.1679094, 0.919571, 1, 1, 1, 1, 1,
1.955669, -0.7653691, 1.346578, 1, 1, 1, 1, 1,
1.969193, 0.278522, 2.668485, 1, 1, 1, 1, 1,
1.989142, -0.332448, 1.705401, 1, 1, 1, 1, 1,
1.99913, -1.164011, 1.927395, 1, 1, 1, 1, 1,
2.060612, -1.192722, 1.577732, 0, 0, 1, 1, 1,
2.079031, -0.05066146, 1.377007, 1, 0, 0, 1, 1,
2.079709, 1.701672, 2.409953, 1, 0, 0, 1, 1,
2.089323, 0.04961473, 1.442503, 1, 0, 0, 1, 1,
2.099345, 1.255372, -0.4240752, 1, 0, 0, 1, 1,
2.107448, 0.1098315, 1.27506, 1, 0, 0, 1, 1,
2.137027, -0.808913, 2.364941, 0, 0, 0, 1, 1,
2.146514, 0.2480572, 1.702307, 0, 0, 0, 1, 1,
2.178654, 0.755865, 1.351013, 0, 0, 0, 1, 1,
2.185177, 0.4689162, 0.6160826, 0, 0, 0, 1, 1,
2.194271, 2.020543, 0.4939713, 0, 0, 0, 1, 1,
2.206515, -0.70025, 0.7409012, 0, 0, 0, 1, 1,
2.228957, -0.4896498, 3.237991, 0, 0, 0, 1, 1,
2.241024, 1.232905, -0.004574822, 1, 1, 1, 1, 1,
2.250314, -1.083002, 1.431111, 1, 1, 1, 1, 1,
2.267071, 1.104918, 2.7037, 1, 1, 1, 1, 1,
2.342921, 0.764819, 0.3123929, 1, 1, 1, 1, 1,
2.345737, 0.0988555, 2.297992, 1, 1, 1, 1, 1,
2.349031, -0.2310901, 1.55049, 1, 1, 1, 1, 1,
2.540464, 1.275386, -0.3219273, 1, 1, 1, 1, 1
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
var radius = 9.442322;
var distance = 33.16576;
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
mvMatrix.translate( 0.5313092, 0.2780197, -0.4007225 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.16576);
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
