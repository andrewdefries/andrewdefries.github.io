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
-2.875816, 0.8617828, -3.138212, 1, 0, 0, 1,
-2.811218, -1.447701, -1.359114, 1, 0.007843138, 0, 1,
-2.761766, -0.1196821, -2.003391, 1, 0.01176471, 0, 1,
-2.72549, 0.8210522, -2.407488, 1, 0.01960784, 0, 1,
-2.702199, 0.5822722, -0.8812237, 1, 0.02352941, 0, 1,
-2.524112, -2.230707, -2.500532, 1, 0.03137255, 0, 1,
-2.503517, -0.8502737, -1.37061, 1, 0.03529412, 0, 1,
-2.453623, -1.726248, -2.932217, 1, 0.04313726, 0, 1,
-2.348206, -0.303331, -2.563487, 1, 0.04705882, 0, 1,
-2.307479, 0.8821895, -0.7467827, 1, 0.05490196, 0, 1,
-2.302026, -0.7561221, -1.36426, 1, 0.05882353, 0, 1,
-2.262717, -0.7058284, -1.55954, 1, 0.06666667, 0, 1,
-2.18425, -0.6472055, -0.9769871, 1, 0.07058824, 0, 1,
-2.138224, -0.1345088, -1.508615, 1, 0.07843138, 0, 1,
-2.088866, 0.6464598, -0.9342396, 1, 0.08235294, 0, 1,
-2.074524, -0.08505616, -1.425338, 1, 0.09019608, 0, 1,
-2.038007, 0.4080469, -3.416914, 1, 0.09411765, 0, 1,
-2.019627, 0.7419829, 0.5353009, 1, 0.1019608, 0, 1,
-2.006313, 0.5801563, -2.48941, 1, 0.1098039, 0, 1,
-2.001982, 0.2330362, -3.137354, 1, 0.1137255, 0, 1,
-2.001315, 1.689955, -1.987493, 1, 0.1215686, 0, 1,
-1.99553, -0.1872983, -0.910223, 1, 0.1254902, 0, 1,
-1.983285, -1.623697, -2.590335, 1, 0.1333333, 0, 1,
-1.981803, -0.3872517, -1.020694, 1, 0.1372549, 0, 1,
-1.978445, -0.7189791, -1.417661, 1, 0.145098, 0, 1,
-1.971868, -0.9682559, -3.897243, 1, 0.1490196, 0, 1,
-1.954291, 1.612236, -1.698742, 1, 0.1568628, 0, 1,
-1.94027, 0.8901168, -1.318333, 1, 0.1607843, 0, 1,
-1.930082, 0.8005421, -0.8883656, 1, 0.1686275, 0, 1,
-1.905842, -3.018665, -2.899832, 1, 0.172549, 0, 1,
-1.892301, 0.1038602, -2.531101, 1, 0.1803922, 0, 1,
-1.881535, 0.7596135, -2.030984, 1, 0.1843137, 0, 1,
-1.839873, -1.63695, -1.596597, 1, 0.1921569, 0, 1,
-1.828977, -1.025852, -2.192153, 1, 0.1960784, 0, 1,
-1.824158, -1.214102, -1.444684, 1, 0.2039216, 0, 1,
-1.819813, 1.067949, 0.2494784, 1, 0.2117647, 0, 1,
-1.812288, 0.8681451, -2.337297, 1, 0.2156863, 0, 1,
-1.79661, 1.407339, -2.526089, 1, 0.2235294, 0, 1,
-1.783632, 0.1853573, -2.075115, 1, 0.227451, 0, 1,
-1.767612, -0.09598948, -2.110497, 1, 0.2352941, 0, 1,
-1.765536, 1.063329, -1.261395, 1, 0.2392157, 0, 1,
-1.754984, 1.335163, -1.529001, 1, 0.2470588, 0, 1,
-1.712087, 1.003466, -1.638538, 1, 0.2509804, 0, 1,
-1.70614, -1.31127, -1.927432, 1, 0.2588235, 0, 1,
-1.701097, -1.048221, -3.091508, 1, 0.2627451, 0, 1,
-1.694416, 0.5708741, -1.413698, 1, 0.2705882, 0, 1,
-1.689088, -0.9489368, -1.60033, 1, 0.2745098, 0, 1,
-1.686172, 1.991434, -1.176745, 1, 0.282353, 0, 1,
-1.647467, -1.180038, -2.422129, 1, 0.2862745, 0, 1,
-1.630978, -0.8093501, 0.4440909, 1, 0.2941177, 0, 1,
-1.615043, 1.454303, 1.058058, 1, 0.3019608, 0, 1,
-1.595445, 1.572468, -1.381471, 1, 0.3058824, 0, 1,
-1.591618, 0.7107216, -0.8248867, 1, 0.3137255, 0, 1,
-1.591075, -0.7748587, -3.744068, 1, 0.3176471, 0, 1,
-1.580355, 0.2730439, -2.114536, 1, 0.3254902, 0, 1,
-1.580297, -1.525921, -1.41309, 1, 0.3294118, 0, 1,
-1.577242, -0.2504864, -1.04427, 1, 0.3372549, 0, 1,
-1.56932, 0.1055455, -0.2024493, 1, 0.3411765, 0, 1,
-1.567977, -1.495426, -2.671262, 1, 0.3490196, 0, 1,
-1.562552, 0.1916286, -1.76712, 1, 0.3529412, 0, 1,
-1.544051, -0.1018346, -0.2099827, 1, 0.3607843, 0, 1,
-1.531393, -0.05771896, -1.661951, 1, 0.3647059, 0, 1,
-1.520642, 2.10238, 1.959098, 1, 0.372549, 0, 1,
-1.519367, -0.9857937, -2.145161, 1, 0.3764706, 0, 1,
-1.517985, 1.650987, -0.06156034, 1, 0.3843137, 0, 1,
-1.509545, -0.7374426, -2.360764, 1, 0.3882353, 0, 1,
-1.507261, 0.7282503, -1.356291, 1, 0.3960784, 0, 1,
-1.47403, 0.3102068, -2.524241, 1, 0.4039216, 0, 1,
-1.466638, 0.236503, -1.813135, 1, 0.4078431, 0, 1,
-1.457581, 0.8466466, -0.8304141, 1, 0.4156863, 0, 1,
-1.454589, 0.4416101, -0.9039785, 1, 0.4196078, 0, 1,
-1.452384, -0.317376, -2.299549, 1, 0.427451, 0, 1,
-1.440523, -0.146841, -2.930571, 1, 0.4313726, 0, 1,
-1.437834, 0.1407303, -2.331954, 1, 0.4392157, 0, 1,
-1.432237, 1.246114, -1.225103, 1, 0.4431373, 0, 1,
-1.418546, 0.5954548, -1.754502, 1, 0.4509804, 0, 1,
-1.413129, 1.039372, 1.30726, 1, 0.454902, 0, 1,
-1.398915, -0.0960917, -0.9683646, 1, 0.4627451, 0, 1,
-1.39291, 0.1359255, -3.087724, 1, 0.4666667, 0, 1,
-1.386287, -1.789263, -1.496099, 1, 0.4745098, 0, 1,
-1.38362, -1.173884, -2.212502, 1, 0.4784314, 0, 1,
-1.382415, 0.7679753, -0.6522263, 1, 0.4862745, 0, 1,
-1.380273, -0.1430919, -1.544212, 1, 0.4901961, 0, 1,
-1.379622, -0.5815578, -0.9698036, 1, 0.4980392, 0, 1,
-1.376204, -0.7766301, -2.008799, 1, 0.5058824, 0, 1,
-1.350983, 0.03761812, -1.080971, 1, 0.509804, 0, 1,
-1.345185, 1.199375, -0.8512766, 1, 0.5176471, 0, 1,
-1.324474, 0.3938838, -1.361225, 1, 0.5215687, 0, 1,
-1.322682, 0.4374838, -1.128189, 1, 0.5294118, 0, 1,
-1.322628, 0.2037499, -1.674498, 1, 0.5333334, 0, 1,
-1.322164, 0.5614687, -1.209982, 1, 0.5411765, 0, 1,
-1.310206, -0.8063427, -1.754359, 1, 0.5450981, 0, 1,
-1.299594, -0.4009273, -2.841566, 1, 0.5529412, 0, 1,
-1.279887, -1.369875, -2.448175, 1, 0.5568628, 0, 1,
-1.278535, 0.3186355, 0.4613101, 1, 0.5647059, 0, 1,
-1.266797, 0.3096727, -1.772623, 1, 0.5686275, 0, 1,
-1.265814, -2.041553, -2.474623, 1, 0.5764706, 0, 1,
-1.265433, 1.245661, 0.8213099, 1, 0.5803922, 0, 1,
-1.26456, -0.8654249, -1.578403, 1, 0.5882353, 0, 1,
-1.255698, -0.67505, -1.526048, 1, 0.5921569, 0, 1,
-1.255339, -0.1250544, 0.8853495, 1, 0.6, 0, 1,
-1.248185, 0.3182531, -1.913276, 1, 0.6078432, 0, 1,
-1.247223, 0.5151473, 1.376202, 1, 0.6117647, 0, 1,
-1.233297, 1.687244, -1.935985, 1, 0.6196079, 0, 1,
-1.22922, 1.050792, -2.283197, 1, 0.6235294, 0, 1,
-1.225232, -0.8392889, -2.344337, 1, 0.6313726, 0, 1,
-1.221963, -0.8624147, -2.949303, 1, 0.6352941, 0, 1,
-1.217927, -1.645388, -2.860624, 1, 0.6431373, 0, 1,
-1.216257, -0.7974503, -3.558118, 1, 0.6470588, 0, 1,
-1.20082, 0.8178126, -1.771751, 1, 0.654902, 0, 1,
-1.192178, -0.9318376, -1.942975, 1, 0.6588235, 0, 1,
-1.182162, -1.368565, -1.741327, 1, 0.6666667, 0, 1,
-1.179787, 1.067655, -2.678851, 1, 0.6705883, 0, 1,
-1.176299, 1.542925, -1.139341, 1, 0.6784314, 0, 1,
-1.163944, -0.3945079, -1.033431, 1, 0.682353, 0, 1,
-1.16312, 0.4949901, -1.452579, 1, 0.6901961, 0, 1,
-1.157967, 0.1269547, -3.381569, 1, 0.6941177, 0, 1,
-1.14181, 0.7599672, -3.57743, 1, 0.7019608, 0, 1,
-1.135665, 0.2418365, 0.03892202, 1, 0.7098039, 0, 1,
-1.11841, 2.642832, 0.3561855, 1, 0.7137255, 0, 1,
-1.114474, -1.025129, -2.223763, 1, 0.7215686, 0, 1,
-1.113544, -0.2254824, -1.87826, 1, 0.7254902, 0, 1,
-1.110209, 0.6277995, 0.477766, 1, 0.7333333, 0, 1,
-1.103546, 0.6806831, -1.454839, 1, 0.7372549, 0, 1,
-1.102824, -0.9453675, -2.322097, 1, 0.7450981, 0, 1,
-1.10021, -0.158469, -0.6221784, 1, 0.7490196, 0, 1,
-1.09736, 0.005568193, -2.65938, 1, 0.7568628, 0, 1,
-1.095785, -0.1423773, -2.094531, 1, 0.7607843, 0, 1,
-1.094749, 0.06772655, -2.40816, 1, 0.7686275, 0, 1,
-1.092946, -0.9853933, -1.683637, 1, 0.772549, 0, 1,
-1.08932, -0.1365285, -0.7182431, 1, 0.7803922, 0, 1,
-1.086779, -0.3873828, -1.928072, 1, 0.7843137, 0, 1,
-1.085648, -1.06401, -2.229674, 1, 0.7921569, 0, 1,
-1.085343, 0.7689763, -1.567906, 1, 0.7960784, 0, 1,
-1.070456, -0.6876845, -1.853165, 1, 0.8039216, 0, 1,
-1.065653, -0.6191791, -0.9787666, 1, 0.8117647, 0, 1,
-1.060257, 1.382801, -1.747205, 1, 0.8156863, 0, 1,
-1.06018, 0.5635101, -2.839611, 1, 0.8235294, 0, 1,
-1.053304, 0.4764282, -2.639215, 1, 0.827451, 0, 1,
-1.053216, 1.611043, -1.052105, 1, 0.8352941, 0, 1,
-1.052286, 0.1895492, -0.7958286, 1, 0.8392157, 0, 1,
-1.050298, 0.5994546, -2.014598, 1, 0.8470588, 0, 1,
-1.049735, -2.106889, -2.515708, 1, 0.8509804, 0, 1,
-1.049049, -0.3189816, -2.999296, 1, 0.8588235, 0, 1,
-1.045555, 0.6983262, -0.1983595, 1, 0.8627451, 0, 1,
-1.03285, 0.6543877, 0.02883406, 1, 0.8705882, 0, 1,
-1.032141, -0.2844632, -2.997987, 1, 0.8745098, 0, 1,
-1.026352, -0.02009317, -0.9733624, 1, 0.8823529, 0, 1,
-1.025118, 0.9328577, -1.644789, 1, 0.8862745, 0, 1,
-1.023322, 0.500468, -1.67689, 1, 0.8941177, 0, 1,
-1.017706, 1.023563, -0.5061463, 1, 0.8980392, 0, 1,
-1.013778, 0.5644473, 0.1658411, 1, 0.9058824, 0, 1,
-1.009615, -0.5514882, -1.810917, 1, 0.9137255, 0, 1,
-1.001588, -2.060989, -3.782002, 1, 0.9176471, 0, 1,
-1.000627, -0.6781032, -1.906243, 1, 0.9254902, 0, 1,
-0.9964662, 1.115848, -1.321265, 1, 0.9294118, 0, 1,
-0.996228, 0.6413146, 0.2773059, 1, 0.9372549, 0, 1,
-0.9951507, 2.42627, 0.8112457, 1, 0.9411765, 0, 1,
-0.9848129, 1.168307, -1.034581, 1, 0.9490196, 0, 1,
-0.9842487, 0.3857444, -1.743771, 1, 0.9529412, 0, 1,
-0.9796616, -0.2073759, -1.256888, 1, 0.9607843, 0, 1,
-0.9786538, -0.8736696, -2.794612, 1, 0.9647059, 0, 1,
-0.9756854, 0.1299991, -2.601556, 1, 0.972549, 0, 1,
-0.9736394, 1.33081, 0.08502421, 1, 0.9764706, 0, 1,
-0.9725325, -0.5344371, -0.9326859, 1, 0.9843137, 0, 1,
-0.9713196, -0.4858972, -2.004354, 1, 0.9882353, 0, 1,
-0.9649953, 0.7339971, -1.969452, 1, 0.9960784, 0, 1,
-0.960886, 1.317568, -0.4803879, 0.9960784, 1, 0, 1,
-0.9587744, -0.9522424, -2.893656, 0.9921569, 1, 0, 1,
-0.9545816, 0.578555, -0.8997816, 0.9843137, 1, 0, 1,
-0.9544933, 0.8803136, -0.5188502, 0.9803922, 1, 0, 1,
-0.9487967, -1.06957, -1.15837, 0.972549, 1, 0, 1,
-0.9468135, 1.431188, 0.2624681, 0.9686275, 1, 0, 1,
-0.944841, -0.8844184, -3.522554, 0.9607843, 1, 0, 1,
-0.9371706, 0.2830203, 0.136927, 0.9568627, 1, 0, 1,
-0.9352811, 0.006397175, -2.428694, 0.9490196, 1, 0, 1,
-0.9311544, 0.922906, -0.7271475, 0.945098, 1, 0, 1,
-0.9283479, 1.406368, -0.01831366, 0.9372549, 1, 0, 1,
-0.9240683, -0.009068179, -1.010679, 0.9333333, 1, 0, 1,
-0.9161025, -0.4737899, -2.068419, 0.9254902, 1, 0, 1,
-0.9037675, 2.273713, 0.9565181, 0.9215686, 1, 0, 1,
-0.9019681, -0.02448469, -0.6523065, 0.9137255, 1, 0, 1,
-0.9013074, -0.5500849, -2.705787, 0.9098039, 1, 0, 1,
-0.9006496, 1.628515, -2.743946, 0.9019608, 1, 0, 1,
-0.9005271, -1.299383, -2.631696, 0.8941177, 1, 0, 1,
-0.8990826, 0.8320906, 0.0580544, 0.8901961, 1, 0, 1,
-0.8976872, -0.5589416, -2.421116, 0.8823529, 1, 0, 1,
-0.8946906, 0.4853739, -2.984717, 0.8784314, 1, 0, 1,
-0.8931677, -2.879884, -2.608284, 0.8705882, 1, 0, 1,
-0.8871022, -0.04255578, -0.414851, 0.8666667, 1, 0, 1,
-0.8870065, 1.493471, -0.7852712, 0.8588235, 1, 0, 1,
-0.8811765, 1.262518, 0.5542674, 0.854902, 1, 0, 1,
-0.8769983, 0.07747342, -2.496821, 0.8470588, 1, 0, 1,
-0.863045, 1.119594, -1.181283, 0.8431373, 1, 0, 1,
-0.8613223, 1.75961, -1.089034, 0.8352941, 1, 0, 1,
-0.8565766, 1.072178, -2.036613, 0.8313726, 1, 0, 1,
-0.8541036, 1.703346, -1.020441, 0.8235294, 1, 0, 1,
-0.852516, 0.4785709, -1.447202, 0.8196079, 1, 0, 1,
-0.8519376, -1.066003, -2.498705, 0.8117647, 1, 0, 1,
-0.8516838, -0.7925153, -2.258885, 0.8078431, 1, 0, 1,
-0.8484651, 2.576944, 0.01466018, 0.8, 1, 0, 1,
-0.8481727, 0.7116224, 0.01797457, 0.7921569, 1, 0, 1,
-0.8455284, 1.197782, 0.3420918, 0.7882353, 1, 0, 1,
-0.8437392, 1.635284, -1.196258, 0.7803922, 1, 0, 1,
-0.8436652, 1.515264, -2.024637, 0.7764706, 1, 0, 1,
-0.8404378, 0.6614879, -0.3149609, 0.7686275, 1, 0, 1,
-0.8380342, 0.4174784, -1.530221, 0.7647059, 1, 0, 1,
-0.8379388, -0.4345369, -2.002325, 0.7568628, 1, 0, 1,
-0.8296432, -2.049129, -3.017554, 0.7529412, 1, 0, 1,
-0.8278763, 0.5721501, -0.9115416, 0.7450981, 1, 0, 1,
-0.827275, -1.803948, -2.216914, 0.7411765, 1, 0, 1,
-0.8262795, 1.589453, -0.9282699, 0.7333333, 1, 0, 1,
-0.8238835, -0.06710056, -2.045392, 0.7294118, 1, 0, 1,
-0.8149853, 0.8508798, -0.7613239, 0.7215686, 1, 0, 1,
-0.8147902, 0.2561593, -3.483161, 0.7176471, 1, 0, 1,
-0.8111895, 0.6040841, -0.8832619, 0.7098039, 1, 0, 1,
-0.8070267, 1.360976, -0.8231708, 0.7058824, 1, 0, 1,
-0.8026962, -0.08571611, -1.432149, 0.6980392, 1, 0, 1,
-0.7915258, -0.04002636, -1.883872, 0.6901961, 1, 0, 1,
-0.7898032, -0.5188823, -2.004235, 0.6862745, 1, 0, 1,
-0.7874937, 0.9146676, 0.1300947, 0.6784314, 1, 0, 1,
-0.784919, 2.45131, 0.3253101, 0.6745098, 1, 0, 1,
-0.784756, 0.4199693, 0.3988832, 0.6666667, 1, 0, 1,
-0.7805831, 0.7529875, -1.141255, 0.6627451, 1, 0, 1,
-0.7748467, 0.07223029, -1.441167, 0.654902, 1, 0, 1,
-0.7734086, -0.7677614, -2.173252, 0.6509804, 1, 0, 1,
-0.7684185, -0.8391307, -3.464762, 0.6431373, 1, 0, 1,
-0.7682025, -1.82791, -3.110877, 0.6392157, 1, 0, 1,
-0.7676962, 1.373659, -1.529655, 0.6313726, 1, 0, 1,
-0.7654811, -0.04839071, -0.5651942, 0.627451, 1, 0, 1,
-0.7618876, -0.8740117, -2.138079, 0.6196079, 1, 0, 1,
-0.7582047, 0.4882668, 1.207062, 0.6156863, 1, 0, 1,
-0.7581959, 0.0742099, -0.2700387, 0.6078432, 1, 0, 1,
-0.7565725, 0.01699536, -0.8964342, 0.6039216, 1, 0, 1,
-0.7533992, 0.732056, -0.5885068, 0.5960785, 1, 0, 1,
-0.7519611, -0.08439442, -1.056603, 0.5882353, 1, 0, 1,
-0.7499123, -0.6550071, -1.687481, 0.5843138, 1, 0, 1,
-0.7488708, 0.655121, -1.265804, 0.5764706, 1, 0, 1,
-0.7419913, 0.7877975, -1.459672, 0.572549, 1, 0, 1,
-0.7402522, 1.616643, 1.152852, 0.5647059, 1, 0, 1,
-0.7369934, 1.926924, -1.455969, 0.5607843, 1, 0, 1,
-0.732861, 2.1071, 0.4000367, 0.5529412, 1, 0, 1,
-0.7318221, 1.257289, -1.190971, 0.5490196, 1, 0, 1,
-0.7305601, -1.715992, -1.408619, 0.5411765, 1, 0, 1,
-0.7229686, -0.8662209, -1.631623, 0.5372549, 1, 0, 1,
-0.7204497, 0.9538964, 0.5432951, 0.5294118, 1, 0, 1,
-0.7195015, 0.5664759, -1.354884, 0.5254902, 1, 0, 1,
-0.718397, -1.083794, -2.486482, 0.5176471, 1, 0, 1,
-0.7171137, -2.017225, -3.832436, 0.5137255, 1, 0, 1,
-0.7117711, -1.218438, -3.319885, 0.5058824, 1, 0, 1,
-0.7114241, -0.8971508, -4.237679, 0.5019608, 1, 0, 1,
-0.7076005, -0.4112977, -3.233336, 0.4941176, 1, 0, 1,
-0.7009469, -0.0090704, -1.437644, 0.4862745, 1, 0, 1,
-0.6998063, -0.7972932, -0.7875142, 0.4823529, 1, 0, 1,
-0.6982957, -0.4318632, -3.393579, 0.4745098, 1, 0, 1,
-0.6919051, -1.072793, -1.528998, 0.4705882, 1, 0, 1,
-0.6886502, 1.684829, -0.2240075, 0.4627451, 1, 0, 1,
-0.6824282, 0.5322946, -1.032917, 0.4588235, 1, 0, 1,
-0.6797419, -2.294226, -2.743272, 0.4509804, 1, 0, 1,
-0.671371, 0.36375, -0.9446287, 0.4470588, 1, 0, 1,
-0.6655465, 0.253628, 2.240722, 0.4392157, 1, 0, 1,
-0.657175, 1.516681, -1.335018, 0.4352941, 1, 0, 1,
-0.6549992, 0.5256626, -0.7102029, 0.427451, 1, 0, 1,
-0.6526498, -0.8079276, -1.335236, 0.4235294, 1, 0, 1,
-0.6515541, -0.7542138, -2.283273, 0.4156863, 1, 0, 1,
-0.6514937, 0.6168905, -0.3419852, 0.4117647, 1, 0, 1,
-0.651069, -0.7629232, -2.962986, 0.4039216, 1, 0, 1,
-0.648963, -0.4381067, -1.787305, 0.3960784, 1, 0, 1,
-0.6440518, 1.123719, -0.7802129, 0.3921569, 1, 0, 1,
-0.6378201, -0.1937352, -2.780638, 0.3843137, 1, 0, 1,
-0.6325968, -0.3789495, -2.873156, 0.3803922, 1, 0, 1,
-0.6325667, -0.3840666, -1.646549, 0.372549, 1, 0, 1,
-0.6295096, 0.6879354, 0.7925982, 0.3686275, 1, 0, 1,
-0.6281464, 0.9392769, 0.3988541, 0.3607843, 1, 0, 1,
-0.6177319, 0.1599768, -1.083403, 0.3568628, 1, 0, 1,
-0.6142158, 1.10886, -1.556234, 0.3490196, 1, 0, 1,
-0.6133659, 1.143283, -1.424146, 0.345098, 1, 0, 1,
-0.6129157, -1.281469, -2.647164, 0.3372549, 1, 0, 1,
-0.6107827, -0.2286332, -2.190113, 0.3333333, 1, 0, 1,
-0.6088892, 2.177415, -0.2147488, 0.3254902, 1, 0, 1,
-0.6060545, 0.6844895, 0.09661897, 0.3215686, 1, 0, 1,
-0.6041963, 1.84579, 1.547071, 0.3137255, 1, 0, 1,
-0.6025443, 1.062319, 0.4277334, 0.3098039, 1, 0, 1,
-0.6002025, 0.2468035, -3.577904, 0.3019608, 1, 0, 1,
-0.5989801, -0.4331927, -1.558322, 0.2941177, 1, 0, 1,
-0.5977993, -0.07176124, -1.249394, 0.2901961, 1, 0, 1,
-0.5931419, -1.701421, -4.692675, 0.282353, 1, 0, 1,
-0.5928531, 1.587182, 0.4119042, 0.2784314, 1, 0, 1,
-0.5917315, -0.4983176, 0.0562445, 0.2705882, 1, 0, 1,
-0.5916536, 1.012889, -1.149087, 0.2666667, 1, 0, 1,
-0.5896383, 1.642954, -0.8095896, 0.2588235, 1, 0, 1,
-0.588303, 2.787936, -2.131917, 0.254902, 1, 0, 1,
-0.586328, -3.142047, -2.747121, 0.2470588, 1, 0, 1,
-0.5860159, 0.4268417, -1.363151, 0.2431373, 1, 0, 1,
-0.5747862, 1.099803, -0.658054, 0.2352941, 1, 0, 1,
-0.5744079, -0.9196165, -2.466016, 0.2313726, 1, 0, 1,
-0.5715082, -0.2770762, -2.498406, 0.2235294, 1, 0, 1,
-0.5708454, -0.7586928, -2.202014, 0.2196078, 1, 0, 1,
-0.5673769, 0.8165585, -1.01937, 0.2117647, 1, 0, 1,
-0.5662774, 1.360926, -2.28057, 0.2078431, 1, 0, 1,
-0.5643584, -1.018546, -2.911852, 0.2, 1, 0, 1,
-0.562296, -1.55124, -1.439979, 0.1921569, 1, 0, 1,
-0.5603389, 0.2296094, -2.482916, 0.1882353, 1, 0, 1,
-0.5596971, -0.2051117, -2.988944, 0.1803922, 1, 0, 1,
-0.5481955, 0.4088751, -1.63183, 0.1764706, 1, 0, 1,
-0.5454494, 1.396361, 1.479248, 0.1686275, 1, 0, 1,
-0.5393333, 0.4303099, -1.842387, 0.1647059, 1, 0, 1,
-0.5388603, -0.8229867, -1.889603, 0.1568628, 1, 0, 1,
-0.5378743, -1.189538, -3.116641, 0.1529412, 1, 0, 1,
-0.5370176, 1.018665, -0.523667, 0.145098, 1, 0, 1,
-0.5331097, 0.06785396, -1.869606, 0.1411765, 1, 0, 1,
-0.531807, -0.3210945, -2.454685, 0.1333333, 1, 0, 1,
-0.5311687, 0.3458061, -2.466555, 0.1294118, 1, 0, 1,
-0.5267919, 0.3890372, -1.567602, 0.1215686, 1, 0, 1,
-0.5265592, 1.673998, 0.221359, 0.1176471, 1, 0, 1,
-0.5235479, -1.674722, -0.7594086, 0.1098039, 1, 0, 1,
-0.5220966, 0.2440397, -0.8739971, 0.1058824, 1, 0, 1,
-0.5192495, -0.7080016, -0.8399006, 0.09803922, 1, 0, 1,
-0.5184659, -0.8867307, -3.651716, 0.09019608, 1, 0, 1,
-0.5175727, -2.201645, -1.48149, 0.08627451, 1, 0, 1,
-0.5123504, 0.2511753, -0.4095272, 0.07843138, 1, 0, 1,
-0.5107391, 0.1585007, -2.151609, 0.07450981, 1, 0, 1,
-0.5085576, 0.6334534, -0.3807457, 0.06666667, 1, 0, 1,
-0.5029464, 0.310384, -1.745893, 0.0627451, 1, 0, 1,
-0.4936791, -0.8870733, -4.169057, 0.05490196, 1, 0, 1,
-0.4904386, -0.1827096, -2.077011, 0.05098039, 1, 0, 1,
-0.4875664, -0.7306901, -2.40521, 0.04313726, 1, 0, 1,
-0.4870787, 1.249928, -0.9788678, 0.03921569, 1, 0, 1,
-0.4861479, 0.05778512, -3.516555, 0.03137255, 1, 0, 1,
-0.4844576, 0.6572945, 0.3374929, 0.02745098, 1, 0, 1,
-0.4832961, -0.9653488, -3.577796, 0.01960784, 1, 0, 1,
-0.4813644, -0.762338, -4.557196, 0.01568628, 1, 0, 1,
-0.4790991, -0.3768518, -3.041256, 0.007843138, 1, 0, 1,
-0.4779994, -0.3329049, -2.548599, 0.003921569, 1, 0, 1,
-0.4779873, -0.5989226, -1.743906, 0, 1, 0.003921569, 1,
-0.4770142, 0.6880028, -2.531109, 0, 1, 0.01176471, 1,
-0.4741984, 0.3943355, -1.925146, 0, 1, 0.01568628, 1,
-0.4723656, -1.497542, -1.005187, 0, 1, 0.02352941, 1,
-0.472234, -0.395379, -3.080092, 0, 1, 0.02745098, 1,
-0.4650956, -0.007026538, 0.4572052, 0, 1, 0.03529412, 1,
-0.4603127, -1.282553, -3.716909, 0, 1, 0.03921569, 1,
-0.4602346, 0.5748659, 1.216072, 0, 1, 0.04705882, 1,
-0.4601735, 1.037389, -0.9321228, 0, 1, 0.05098039, 1,
-0.4594313, 0.1958337, 0.005105702, 0, 1, 0.05882353, 1,
-0.4590996, 0.2057705, -0.3476419, 0, 1, 0.0627451, 1,
-0.4533789, 1.023689, -0.4332028, 0, 1, 0.07058824, 1,
-0.4502786, 0.5428454, -0.4808181, 0, 1, 0.07450981, 1,
-0.4483938, 0.1349359, -2.250833, 0, 1, 0.08235294, 1,
-0.4480464, 0.476656, 0.2276401, 0, 1, 0.08627451, 1,
-0.4449283, 0.2410271, -1.861049, 0, 1, 0.09411765, 1,
-0.4313979, 1.911571, -0.887704, 0, 1, 0.1019608, 1,
-0.4290745, 0.05254913, -2.046251, 0, 1, 0.1058824, 1,
-0.4235963, -0.532462, -3.416128, 0, 1, 0.1137255, 1,
-0.4213515, -3.201737, -3.082592, 0, 1, 0.1176471, 1,
-0.4208151, 0.2035877, -1.430552, 0, 1, 0.1254902, 1,
-0.4193179, 2.009917, -1.209987, 0, 1, 0.1294118, 1,
-0.4192635, 0.7473263, -0.4616043, 0, 1, 0.1372549, 1,
-0.4162672, 0.1161257, -1.580194, 0, 1, 0.1411765, 1,
-0.4118311, 2.32458, -0.1850215, 0, 1, 0.1490196, 1,
-0.4118083, 0.4648027, -0.5580819, 0, 1, 0.1529412, 1,
-0.4113201, 1.306183, -1.970472, 0, 1, 0.1607843, 1,
-0.4096063, 0.1784441, -1.088945, 0, 1, 0.1647059, 1,
-0.407121, -0.5759403, -3.212089, 0, 1, 0.172549, 1,
-0.3978997, -0.8278631, -2.058046, 0, 1, 0.1764706, 1,
-0.3953052, 0.2052597, -1.754431, 0, 1, 0.1843137, 1,
-0.3918085, -0.222343, -2.293504, 0, 1, 0.1882353, 1,
-0.3894022, 0.8642878, -0.6587167, 0, 1, 0.1960784, 1,
-0.384448, -0.5170051, -3.106011, 0, 1, 0.2039216, 1,
-0.3791537, 1.717324, -0.477836, 0, 1, 0.2078431, 1,
-0.3781524, 1.476821, -0.1720051, 0, 1, 0.2156863, 1,
-0.3773133, -1.470119, -1.59511, 0, 1, 0.2196078, 1,
-0.3766012, -0.6790158, -2.147956, 0, 1, 0.227451, 1,
-0.3685962, -0.1585883, -3.916135, 0, 1, 0.2313726, 1,
-0.3679617, -0.1958196, -2.72311, 0, 1, 0.2392157, 1,
-0.3644334, -0.522965, -3.016325, 0, 1, 0.2431373, 1,
-0.3624392, -0.569539, -0.8787092, 0, 1, 0.2509804, 1,
-0.3596576, -0.600888, -5.403688, 0, 1, 0.254902, 1,
-0.3580907, -0.6383306, -2.200025, 0, 1, 0.2627451, 1,
-0.3575552, 1.054815, 0.5048764, 0, 1, 0.2666667, 1,
-0.3562214, -0.1555337, -2.386883, 0, 1, 0.2745098, 1,
-0.3514122, 0.2535192, -2.168802, 0, 1, 0.2784314, 1,
-0.3512143, 1.899199, 1.143225, 0, 1, 0.2862745, 1,
-0.3502667, 0.1711198, -2.65904, 0, 1, 0.2901961, 1,
-0.3477643, -1.901586, -1.765025, 0, 1, 0.2980392, 1,
-0.3473473, -0.3507496, -1.950731, 0, 1, 0.3058824, 1,
-0.3433872, -0.4218429, -1.482323, 0, 1, 0.3098039, 1,
-0.3421272, 0.2871992, -1.072795, 0, 1, 0.3176471, 1,
-0.3348977, -0.8941527, -3.098603, 0, 1, 0.3215686, 1,
-0.3335045, -0.7994483, -3.70116, 0, 1, 0.3294118, 1,
-0.3316411, 0.1198577, 0.1080841, 0, 1, 0.3333333, 1,
-0.3276147, -0.1662846, -2.595111, 0, 1, 0.3411765, 1,
-0.3272896, -0.9015498, -1.595521, 0, 1, 0.345098, 1,
-0.3240287, 0.9686674, 0.07421542, 0, 1, 0.3529412, 1,
-0.3203766, -1.571623, -2.299757, 0, 1, 0.3568628, 1,
-0.3182722, -0.9811295, -3.209488, 0, 1, 0.3647059, 1,
-0.3159542, 1.006013, 0.501515, 0, 1, 0.3686275, 1,
-0.3111139, -0.9629772, -2.878247, 0, 1, 0.3764706, 1,
-0.3096465, -0.8171536, -2.542598, 0, 1, 0.3803922, 1,
-0.3095109, 0.9744451, -0.06769781, 0, 1, 0.3882353, 1,
-0.3059342, 0.005849189, -1.243963, 0, 1, 0.3921569, 1,
-0.3058185, -1.174924, -1.225302, 0, 1, 0.4, 1,
-0.2983432, -0.8368862, -4.396103, 0, 1, 0.4078431, 1,
-0.295546, -0.3828453, -2.179602, 0, 1, 0.4117647, 1,
-0.2951771, -0.6375223, -4.241219, 0, 1, 0.4196078, 1,
-0.2929235, 0.02471671, -2.162577, 0, 1, 0.4235294, 1,
-0.2899684, -0.9059933, -4.121614, 0, 1, 0.4313726, 1,
-0.2893271, -0.7671291, -3.064033, 0, 1, 0.4352941, 1,
-0.2892458, 0.1971133, -2.366014, 0, 1, 0.4431373, 1,
-0.2883719, -0.198623, -2.629026, 0, 1, 0.4470588, 1,
-0.2847852, -0.8477776, -4.357464, 0, 1, 0.454902, 1,
-0.2839764, 0.6206169, -0.6325283, 0, 1, 0.4588235, 1,
-0.2809075, 0.4345481, -0.4563546, 0, 1, 0.4666667, 1,
-0.2752177, -2.712321, -2.722314, 0, 1, 0.4705882, 1,
-0.2641632, -1.453118, -1.036892, 0, 1, 0.4784314, 1,
-0.263829, -1.349869, -2.457817, 0, 1, 0.4823529, 1,
-0.2564066, -1.729387, -1.937737, 0, 1, 0.4901961, 1,
-0.2561592, 0.9075024, -0.07657593, 0, 1, 0.4941176, 1,
-0.2522455, -0.8768596, -1.803319, 0, 1, 0.5019608, 1,
-0.2507936, 1.057454, -2.183476, 0, 1, 0.509804, 1,
-0.2446523, -0.6623204, -3.603006, 0, 1, 0.5137255, 1,
-0.2397742, 0.1002922, -2.941086, 0, 1, 0.5215687, 1,
-0.2349294, 0.866976, 0.2058214, 0, 1, 0.5254902, 1,
-0.2342622, 2.054389, -1.004597, 0, 1, 0.5333334, 1,
-0.2318746, 0.0414977, -2.040374, 0, 1, 0.5372549, 1,
-0.229617, -0.08011909, -3.432668, 0, 1, 0.5450981, 1,
-0.2278624, -0.2939665, -1.979155, 0, 1, 0.5490196, 1,
-0.227541, 1.053698, 0.3003006, 0, 1, 0.5568628, 1,
-0.2227374, 0.02790197, -1.72323, 0, 1, 0.5607843, 1,
-0.2215307, 0.8853417, 0.3932535, 0, 1, 0.5686275, 1,
-0.2197514, 0.7711928, 0.3680776, 0, 1, 0.572549, 1,
-0.213816, 0.6182579, -0.4287562, 0, 1, 0.5803922, 1,
-0.2119066, 1.025469, 1.778017, 0, 1, 0.5843138, 1,
-0.2109751, 1.334701, 0.4673605, 0, 1, 0.5921569, 1,
-0.2101779, -1.464981, -1.002369, 0, 1, 0.5960785, 1,
-0.2071559, 0.6395294, -1.038036, 0, 1, 0.6039216, 1,
-0.2012402, -0.5316913, -1.618445, 0, 1, 0.6117647, 1,
-0.2001168, 0.5107985, -0.5852267, 0, 1, 0.6156863, 1,
-0.1942728, 0.4473246, -0.8491523, 0, 1, 0.6235294, 1,
-0.1904375, -1.371178, -2.761302, 0, 1, 0.627451, 1,
-0.1880373, 0.7633243, -0.2034116, 0, 1, 0.6352941, 1,
-0.1876773, 0.6486022, 1.895694, 0, 1, 0.6392157, 1,
-0.1872382, -1.44417, -3.829312, 0, 1, 0.6470588, 1,
-0.1857571, 0.2016245, 0.3523905, 0, 1, 0.6509804, 1,
-0.175111, -2.116722, -2.565607, 0, 1, 0.6588235, 1,
-0.1696054, -0.9162323, -1.590119, 0, 1, 0.6627451, 1,
-0.169055, 1.63156, 1.019492, 0, 1, 0.6705883, 1,
-0.1670751, -0.8715189, -4.751879, 0, 1, 0.6745098, 1,
-0.1635676, -0.09559981, -2.25631, 0, 1, 0.682353, 1,
-0.1617442, 1.125871, 0.4751668, 0, 1, 0.6862745, 1,
-0.1608856, -1.483042, -3.363806, 0, 1, 0.6941177, 1,
-0.1518008, -0.4684273, -2.165885, 0, 1, 0.7019608, 1,
-0.1509266, 1.749228, 0.3923819, 0, 1, 0.7058824, 1,
-0.1467384, -1.291669, -4.093925, 0, 1, 0.7137255, 1,
-0.1457514, 0.1283873, 1.551662, 0, 1, 0.7176471, 1,
-0.1453759, 0.03936312, -1.200973, 0, 1, 0.7254902, 1,
-0.145321, -0.090903, -4.996215, 0, 1, 0.7294118, 1,
-0.144772, -1.779825, -4.42506, 0, 1, 0.7372549, 1,
-0.1436545, -0.8415574, -3.509797, 0, 1, 0.7411765, 1,
-0.1430037, 0.9228581, -0.5036676, 0, 1, 0.7490196, 1,
-0.1403413, -1.417492, -2.306133, 0, 1, 0.7529412, 1,
-0.139904, 0.4237297, 0.02767929, 0, 1, 0.7607843, 1,
-0.1306226, 1.470378, -0.7318151, 0, 1, 0.7647059, 1,
-0.129664, 0.3337398, -0.08929453, 0, 1, 0.772549, 1,
-0.1294965, -0.6450119, -3.035159, 0, 1, 0.7764706, 1,
-0.1288947, 1.001533, -0.6098593, 0, 1, 0.7843137, 1,
-0.1275651, -0.587677, -3.262424, 0, 1, 0.7882353, 1,
-0.1248204, 0.06375736, 0.1134625, 0, 1, 0.7960784, 1,
-0.1226322, -0.4395434, -3.987474, 0, 1, 0.8039216, 1,
-0.1174314, 0.4506115, 0.6903759, 0, 1, 0.8078431, 1,
-0.114083, -1.203939, -3.489765, 0, 1, 0.8156863, 1,
-0.1075767, -1.233416, -2.030371, 0, 1, 0.8196079, 1,
-0.104688, 0.806715, 0.4283643, 0, 1, 0.827451, 1,
-0.09921026, -0.4767853, -3.664209, 0, 1, 0.8313726, 1,
-0.09311256, -0.6249021, -2.612883, 0, 1, 0.8392157, 1,
-0.08565202, -1.172265, -2.662278, 0, 1, 0.8431373, 1,
-0.08561181, 1.48157, 1.151455, 0, 1, 0.8509804, 1,
-0.08437712, -1.232621, -3.340922, 0, 1, 0.854902, 1,
-0.08376724, 0.3244472, 0.4998043, 0, 1, 0.8627451, 1,
-0.0802146, 0.3293977, 0.6130896, 0, 1, 0.8666667, 1,
-0.07954913, 2.151448, 0.8063313, 0, 1, 0.8745098, 1,
-0.07809924, -1.081522, -6.154966, 0, 1, 0.8784314, 1,
-0.07382433, 0.3635253, -1.366205, 0, 1, 0.8862745, 1,
-0.07100303, 1.335053, 0.02021089, 0, 1, 0.8901961, 1,
-0.0709057, -0.1832107, -3.155272, 0, 1, 0.8980392, 1,
-0.07080992, -0.2731856, -2.652333, 0, 1, 0.9058824, 1,
-0.07011382, 1.202017, -0.1784216, 0, 1, 0.9098039, 1,
-0.06631427, -0.1409001, -2.878349, 0, 1, 0.9176471, 1,
-0.06556647, 0.9378519, 1.527101, 0, 1, 0.9215686, 1,
-0.06551245, -0.4203743, -3.661488, 0, 1, 0.9294118, 1,
-0.06285901, -0.8187693, -2.594677, 0, 1, 0.9333333, 1,
-0.05881844, -0.3423495, -3.808131, 0, 1, 0.9411765, 1,
-0.05703739, 0.3546388, 0.542138, 0, 1, 0.945098, 1,
-0.05593061, 0.8903161, 0.9151784, 0, 1, 0.9529412, 1,
-0.05588666, 1.815122, 0.05673416, 0, 1, 0.9568627, 1,
-0.05338633, -0.5359013, -2.426182, 0, 1, 0.9647059, 1,
-0.04728565, -0.188616, -1.269314, 0, 1, 0.9686275, 1,
-0.04437348, -0.5801942, -2.859356, 0, 1, 0.9764706, 1,
-0.0387881, -0.2293964, -4.898567, 0, 1, 0.9803922, 1,
-0.03851106, 0.9425021, -0.6010292, 0, 1, 0.9882353, 1,
-0.03793169, -0.05430368, -3.475506, 0, 1, 0.9921569, 1,
-0.03776986, 1.032016, -0.7791793, 0, 1, 1, 1,
-0.03687555, -0.5443112, -4.527355, 0, 0.9921569, 1, 1,
-0.03604352, 0.7011486, 0.1969341, 0, 0.9882353, 1, 1,
-0.03517827, -0.9302205, -4.393061, 0, 0.9803922, 1, 1,
-0.03322157, 1.035721, -1.044985, 0, 0.9764706, 1, 1,
-0.03228888, 0.4695356, -0.9517935, 0, 0.9686275, 1, 1,
-0.02666646, 0.04681945, -1.742996, 0, 0.9647059, 1, 1,
-0.02292895, 0.2005808, 0.4665412, 0, 0.9568627, 1, 1,
-0.02195833, -1.320183, -4.669872, 0, 0.9529412, 1, 1,
-0.01776746, -1.013029, -3.576392, 0, 0.945098, 1, 1,
-0.01661317, 0.08223889, 0.2247457, 0, 0.9411765, 1, 1,
-0.01517661, 0.8718439, 0.5985823, 0, 0.9333333, 1, 1,
-0.01033625, 0.8335162, -0.6487564, 0, 0.9294118, 1, 1,
-0.01023923, -0.5568653, -2.113903, 0, 0.9215686, 1, 1,
-0.01015964, 0.1624792, 0.6133317, 0, 0.9176471, 1, 1,
-0.008566148, 1.846065, -0.04003597, 0, 0.9098039, 1, 1,
-0.006480062, 0.4578983, 0.7151682, 0, 0.9058824, 1, 1,
-0.006269258, -0.02665667, -3.907008, 0, 0.8980392, 1, 1,
-0.005776933, -0.9093969, -4.247346, 0, 0.8901961, 1, 1,
-0.002451202, -0.5736545, -1.57137, 0, 0.8862745, 1, 1,
0.001720026, -2.538006, 3.861411, 0, 0.8784314, 1, 1,
0.002797529, 1.252029, 0.5006631, 0, 0.8745098, 1, 1,
0.00755968, -0.1742198, 2.884197, 0, 0.8666667, 1, 1,
0.01226954, 1.960078, 1.35749, 0, 0.8627451, 1, 1,
0.01519065, 0.7914551, 0.8658348, 0, 0.854902, 1, 1,
0.01688558, 0.7711639, 1.843995, 0, 0.8509804, 1, 1,
0.02043776, 0.3232394, 0.1886082, 0, 0.8431373, 1, 1,
0.02433223, -0.4556164, 3.052122, 0, 0.8392157, 1, 1,
0.02642461, 0.2261378, 0.4333455, 0, 0.8313726, 1, 1,
0.02692998, -1.30506, 3.646935, 0, 0.827451, 1, 1,
0.02727497, 0.03362337, -0.03528602, 0, 0.8196079, 1, 1,
0.03027494, 0.9408594, -0.3822729, 0, 0.8156863, 1, 1,
0.0330633, 0.8344033, -0.2982765, 0, 0.8078431, 1, 1,
0.03768945, 0.713856, -1.082078, 0, 0.8039216, 1, 1,
0.03769976, 1.029621, -1.948948, 0, 0.7960784, 1, 1,
0.03901371, 0.4155306, 1.223439, 0, 0.7882353, 1, 1,
0.04050011, 3.09325, 0.8287352, 0, 0.7843137, 1, 1,
0.04636895, 0.2926855, -1.084371, 0, 0.7764706, 1, 1,
0.05147026, -1.471594, 2.803632, 0, 0.772549, 1, 1,
0.05153592, -2.29362, 2.673663, 0, 0.7647059, 1, 1,
0.05220219, 0.1921391, 0.009515312, 0, 0.7607843, 1, 1,
0.05593852, -0.1648103, 1.411251, 0, 0.7529412, 1, 1,
0.05755109, -1.084982, 2.471, 0, 0.7490196, 1, 1,
0.05784136, -1.650941, 3.408867, 0, 0.7411765, 1, 1,
0.05841707, 0.7456424, -0.3116836, 0, 0.7372549, 1, 1,
0.05929783, 0.7813866, 0.02152567, 0, 0.7294118, 1, 1,
0.05934361, -1.767816, 3.191091, 0, 0.7254902, 1, 1,
0.06132913, -1.10882, 3.08901, 0, 0.7176471, 1, 1,
0.06433268, -0.4080392, 2.284928, 0, 0.7137255, 1, 1,
0.06454856, 0.5673961, -1.077933, 0, 0.7058824, 1, 1,
0.06514307, -0.033065, 1.912459, 0, 0.6980392, 1, 1,
0.06605091, 0.3279045, -0.1615214, 0, 0.6941177, 1, 1,
0.06690079, -0.8618062, 3.364637, 0, 0.6862745, 1, 1,
0.06691646, 0.7407712, 2.495991, 0, 0.682353, 1, 1,
0.07008513, 0.8201151, 1.515939, 0, 0.6745098, 1, 1,
0.07438365, 0.8846691, -0.9181475, 0, 0.6705883, 1, 1,
0.07454783, -1.942914, 4.699004, 0, 0.6627451, 1, 1,
0.0780801, 0.7547609, 0.7960069, 0, 0.6588235, 1, 1,
0.0796039, -0.8713435, 2.245857, 0, 0.6509804, 1, 1,
0.08247567, -1.145158, 3.534841, 0, 0.6470588, 1, 1,
0.08700334, -1.768532, 4.831355, 0, 0.6392157, 1, 1,
0.09138452, -0.8129677, 3.242126, 0, 0.6352941, 1, 1,
0.09559104, 0.4148677, 1.113182, 0, 0.627451, 1, 1,
0.09990701, 0.09494634, 2.244927, 0, 0.6235294, 1, 1,
0.100949, -1.049995, 4.157517, 0, 0.6156863, 1, 1,
0.1022727, -0.1736769, 3.819168, 0, 0.6117647, 1, 1,
0.1028282, -1.322867, 3.123744, 0, 0.6039216, 1, 1,
0.1064842, -0.4548258, 3.949084, 0, 0.5960785, 1, 1,
0.1069605, -1.02778, 2.246974, 0, 0.5921569, 1, 1,
0.1131025, 0.05081339, 2.817414, 0, 0.5843138, 1, 1,
0.114461, 2.76004, -1.736021, 0, 0.5803922, 1, 1,
0.1145691, -0.3587682, 2.603607, 0, 0.572549, 1, 1,
0.1156623, -0.6711786, 2.761487, 0, 0.5686275, 1, 1,
0.1191474, -1.530906, 2.401644, 0, 0.5607843, 1, 1,
0.1202935, -1.871536, 3.934857, 0, 0.5568628, 1, 1,
0.1231788, 0.1068796, -0.5437927, 0, 0.5490196, 1, 1,
0.1238059, 0.5883901, 2.889746, 0, 0.5450981, 1, 1,
0.1260669, -0.4141855, 2.223352, 0, 0.5372549, 1, 1,
0.1269237, 0.9809822, 0.8972404, 0, 0.5333334, 1, 1,
0.1272048, -0.1152689, 1.720799, 0, 0.5254902, 1, 1,
0.1311315, -0.1261204, 2.644649, 0, 0.5215687, 1, 1,
0.134995, 0.419218, -0.921089, 0, 0.5137255, 1, 1,
0.1351962, 1.032725, -0.6162101, 0, 0.509804, 1, 1,
0.1365275, 0.2804441, 1.624929, 0, 0.5019608, 1, 1,
0.1374258, -0.5433184, 3.034959, 0, 0.4941176, 1, 1,
0.145661, -0.1757383, 1.850092, 0, 0.4901961, 1, 1,
0.1504244, -0.03204666, 2.329618, 0, 0.4823529, 1, 1,
0.1601618, -1.157907, 2.897859, 0, 0.4784314, 1, 1,
0.1664328, -0.9109929, 2.263592, 0, 0.4705882, 1, 1,
0.1667188, 0.3429175, 1.455994, 0, 0.4666667, 1, 1,
0.1709412, -0.1716205, 4.007435, 0, 0.4588235, 1, 1,
0.1739342, -0.814894, 2.386919, 0, 0.454902, 1, 1,
0.1741874, -0.2360273, 1.545907, 0, 0.4470588, 1, 1,
0.1766014, -0.5427579, 1.730795, 0, 0.4431373, 1, 1,
0.1784249, -0.845756, 4.825677, 0, 0.4352941, 1, 1,
0.1787875, -0.1261392, 1.732863, 0, 0.4313726, 1, 1,
0.1794208, -0.05334323, 2.39963, 0, 0.4235294, 1, 1,
0.1796845, 0.1455558, -0.3983538, 0, 0.4196078, 1, 1,
0.1827282, -1.487193, 3.961237, 0, 0.4117647, 1, 1,
0.1897907, -0.02279875, 2.617385, 0, 0.4078431, 1, 1,
0.1905619, -0.5311525, 1.969995, 0, 0.4, 1, 1,
0.1929315, -1.100385, 1.161294, 0, 0.3921569, 1, 1,
0.197971, 0.3953443, -0.8577558, 0, 0.3882353, 1, 1,
0.198832, -2.344396, 2.72825, 0, 0.3803922, 1, 1,
0.2039774, -0.5984939, 4.874384, 0, 0.3764706, 1, 1,
0.2071966, -1.396761, 3.069577, 0, 0.3686275, 1, 1,
0.2084769, 0.06118893, -0.1519636, 0, 0.3647059, 1, 1,
0.2151828, 1.719521, -1.249908, 0, 0.3568628, 1, 1,
0.2166875, 0.003944074, 2.432745, 0, 0.3529412, 1, 1,
0.2181393, -0.2470884, 2.107928, 0, 0.345098, 1, 1,
0.2211346, 0.1932393, -0.1902643, 0, 0.3411765, 1, 1,
0.2223893, -0.9218686, 2.708967, 0, 0.3333333, 1, 1,
0.2272586, -0.7345124, 1.646617, 0, 0.3294118, 1, 1,
0.228723, -0.3839046, 1.852653, 0, 0.3215686, 1, 1,
0.2308236, 0.675359, 0.7060821, 0, 0.3176471, 1, 1,
0.2310665, 0.5753904, 0.1231133, 0, 0.3098039, 1, 1,
0.2320866, -1.492525, 1.583866, 0, 0.3058824, 1, 1,
0.2334583, -1.461633, 5.004003, 0, 0.2980392, 1, 1,
0.2371848, 1.441448, -0.5551538, 0, 0.2901961, 1, 1,
0.240472, -0.01334565, 0.2807367, 0, 0.2862745, 1, 1,
0.2426653, -1.571531, 1.897812, 0, 0.2784314, 1, 1,
0.2451904, 1.248549, 0.8192313, 0, 0.2745098, 1, 1,
0.2481361, 0.06929197, 0.6442784, 0, 0.2666667, 1, 1,
0.2510514, -0.1395137, 1.095354, 0, 0.2627451, 1, 1,
0.2541268, -1.401567, 1.901119, 0, 0.254902, 1, 1,
0.2593054, -1.337181, 2.802488, 0, 0.2509804, 1, 1,
0.2600155, 0.8716888, -1.524642, 0, 0.2431373, 1, 1,
0.2601499, -0.4654648, 2.355153, 0, 0.2392157, 1, 1,
0.264679, 0.8759049, 1.152727, 0, 0.2313726, 1, 1,
0.2671095, 0.5837072, 0.8724977, 0, 0.227451, 1, 1,
0.2763079, -1.209505, 2.403295, 0, 0.2196078, 1, 1,
0.277055, -0.7451778, 1.668573, 0, 0.2156863, 1, 1,
0.2818037, -0.4189941, 2.919457, 0, 0.2078431, 1, 1,
0.2826845, 0.7304395, 0.0971233, 0, 0.2039216, 1, 1,
0.2842484, 1.28052, 1.21437, 0, 0.1960784, 1, 1,
0.2870293, 0.1847165, 0.8673281, 0, 0.1882353, 1, 1,
0.289022, 0.7948608, 0.05638584, 0, 0.1843137, 1, 1,
0.2929669, 1.61919, -0.2990295, 0, 0.1764706, 1, 1,
0.2938334, -0.7103949, 2.429399, 0, 0.172549, 1, 1,
0.293887, 1.787554, -0.7918302, 0, 0.1647059, 1, 1,
0.2949665, 0.336582, 0.6963053, 0, 0.1607843, 1, 1,
0.2974563, -1.303439, 3.391846, 0, 0.1529412, 1, 1,
0.2978686, -0.4873448, 2.652381, 0, 0.1490196, 1, 1,
0.2981609, -2.563692, 3.316366, 0, 0.1411765, 1, 1,
0.3029476, 0.724877, 0.1408935, 0, 0.1372549, 1, 1,
0.3051884, -0.8737787, 3.567587, 0, 0.1294118, 1, 1,
0.3053913, -2.363722, 1.178088, 0, 0.1254902, 1, 1,
0.3062522, 0.7143205, -0.3829674, 0, 0.1176471, 1, 1,
0.3069064, 1.463211, 3.154275, 0, 0.1137255, 1, 1,
0.3095871, -0.9044115, 2.101942, 0, 0.1058824, 1, 1,
0.3118154, 2.077187, 0.6105991, 0, 0.09803922, 1, 1,
0.3126726, 1.297451, 0.3526426, 0, 0.09411765, 1, 1,
0.3310831, -0.204928, 2.588696, 0, 0.08627451, 1, 1,
0.3416607, -1.092884, 2.02676, 0, 0.08235294, 1, 1,
0.3473122, 0.1890061, 0.9399287, 0, 0.07450981, 1, 1,
0.347708, -0.3586964, 1.564717, 0, 0.07058824, 1, 1,
0.3498252, -0.8868831, 3.952627, 0, 0.0627451, 1, 1,
0.3522185, 2.751091, 0.8963795, 0, 0.05882353, 1, 1,
0.3537374, 0.8707848, 0.8254756, 0, 0.05098039, 1, 1,
0.3549379, 1.329035, 1.694114, 0, 0.04705882, 1, 1,
0.3593205, 1.771505, 1.885333, 0, 0.03921569, 1, 1,
0.3645058, 1.396798, -1.089425, 0, 0.03529412, 1, 1,
0.3659083, -0.1532182, 2.738442, 0, 0.02745098, 1, 1,
0.3663002, -0.2045672, 1.388179, 0, 0.02352941, 1, 1,
0.3673854, -0.2342518, 3.56818, 0, 0.01568628, 1, 1,
0.3691618, 2.684813, 0.662719, 0, 0.01176471, 1, 1,
0.372583, -1.477044, 3.249662, 0, 0.003921569, 1, 1,
0.3729248, 0.6097762, 0.1049655, 0.003921569, 0, 1, 1,
0.3746008, -0.5997957, 0.8238407, 0.007843138, 0, 1, 1,
0.3770738, 0.958369, 2.628504, 0.01568628, 0, 1, 1,
0.3795778, 1.59144, -0.1848592, 0.01960784, 0, 1, 1,
0.3798642, -1.44173, 3.79843, 0.02745098, 0, 1, 1,
0.3817706, -0.05441894, 0.8768528, 0.03137255, 0, 1, 1,
0.3828106, -0.8095192, 3.440308, 0.03921569, 0, 1, 1,
0.385489, -0.06088911, 0.7563287, 0.04313726, 0, 1, 1,
0.3860399, -1.165494, 4.530555, 0.05098039, 0, 1, 1,
0.3866779, -1.218508, 2.104716, 0.05490196, 0, 1, 1,
0.3869995, 0.3271132, 2.537102, 0.0627451, 0, 1, 1,
0.3909309, 1.009493, 0.9122604, 0.06666667, 0, 1, 1,
0.3930342, -0.9899616, 3.945076, 0.07450981, 0, 1, 1,
0.3953791, 0.4342267, 2.391231, 0.07843138, 0, 1, 1,
0.4090044, 0.6561382, 2.345091, 0.08627451, 0, 1, 1,
0.4105636, -1.120676, 3.356376, 0.09019608, 0, 1, 1,
0.4110342, -2.242075, 3.735334, 0.09803922, 0, 1, 1,
0.4138493, 1.303997, -0.6187784, 0.1058824, 0, 1, 1,
0.4142377, -0.5062532, 2.602274, 0.1098039, 0, 1, 1,
0.4181318, -0.5412813, 3.151212, 0.1176471, 0, 1, 1,
0.4189353, -0.7299165, 0.5324327, 0.1215686, 0, 1, 1,
0.424927, -0.04313498, -0.03358702, 0.1294118, 0, 1, 1,
0.4286976, -1.145989, 3.055017, 0.1333333, 0, 1, 1,
0.429309, -1.257443, 2.956029, 0.1411765, 0, 1, 1,
0.4331326, 1.428719, 0.9444527, 0.145098, 0, 1, 1,
0.4336934, 0.2992352, 1.178961, 0.1529412, 0, 1, 1,
0.4371362, 0.6298163, 1.50287, 0.1568628, 0, 1, 1,
0.437247, 0.6336128, 0.3224438, 0.1647059, 0, 1, 1,
0.4375544, -0.1726679, 1.189189, 0.1686275, 0, 1, 1,
0.4390207, 0.8784382, -0.956504, 0.1764706, 0, 1, 1,
0.4416682, 0.4808265, 2.386896, 0.1803922, 0, 1, 1,
0.4501265, -0.04898576, 1.573563, 0.1882353, 0, 1, 1,
0.4521883, 0.8258181, 1.130563, 0.1921569, 0, 1, 1,
0.4534944, -0.2824715, 2.661503, 0.2, 0, 1, 1,
0.4572773, -0.4566712, 3.203787, 0.2078431, 0, 1, 1,
0.4578803, -0.04108978, 1.674728, 0.2117647, 0, 1, 1,
0.4579998, 1.611423, 0.7209341, 0.2196078, 0, 1, 1,
0.4621116, 1.133955, -0.7962687, 0.2235294, 0, 1, 1,
0.4654707, 1.982979, 0.7537968, 0.2313726, 0, 1, 1,
0.4699487, 0.3244045, 0.241267, 0.2352941, 0, 1, 1,
0.4707975, -1.922654, 3.690543, 0.2431373, 0, 1, 1,
0.4726511, -0.1716129, 1.694869, 0.2470588, 0, 1, 1,
0.4738932, 0.7949302, -0.2066562, 0.254902, 0, 1, 1,
0.4741011, -1.212467, 2.050855, 0.2588235, 0, 1, 1,
0.4757408, -0.8125832, 2.848562, 0.2666667, 0, 1, 1,
0.4790509, 0.3627522, 1.115811, 0.2705882, 0, 1, 1,
0.4830176, -1.669943, 2.383996, 0.2784314, 0, 1, 1,
0.4838146, -1.173272, 3.579739, 0.282353, 0, 1, 1,
0.4847651, -0.5015449, 3.294863, 0.2901961, 0, 1, 1,
0.4856853, 1.122414, -0.7979085, 0.2941177, 0, 1, 1,
0.4857937, -1.200238, 2.565244, 0.3019608, 0, 1, 1,
0.4861359, 1.227109, 0.6776125, 0.3098039, 0, 1, 1,
0.494104, -0.6477619, 1.661868, 0.3137255, 0, 1, 1,
0.4966974, 0.04567226, 2.094267, 0.3215686, 0, 1, 1,
0.5005953, -0.4920553, 3.803027, 0.3254902, 0, 1, 1,
0.5027815, -0.6474016, 5.130772, 0.3333333, 0, 1, 1,
0.5096514, -0.5331821, 2.173478, 0.3372549, 0, 1, 1,
0.5119206, 0.4551016, 1.203911, 0.345098, 0, 1, 1,
0.5134882, 0.1386923, -0.4382186, 0.3490196, 0, 1, 1,
0.5152162, 1.641758, -0.1541492, 0.3568628, 0, 1, 1,
0.5185745, -1.027593, 3.240833, 0.3607843, 0, 1, 1,
0.5192814, -0.4593967, 1.570501, 0.3686275, 0, 1, 1,
0.5252337, 0.04019926, 0.8109058, 0.372549, 0, 1, 1,
0.5280793, -1.454745, 2.446726, 0.3803922, 0, 1, 1,
0.530044, -0.639339, 0.7755108, 0.3843137, 0, 1, 1,
0.5394437, 1.369076, 0.452213, 0.3921569, 0, 1, 1,
0.540898, 0.01535406, 0.3676069, 0.3960784, 0, 1, 1,
0.5440156, 0.4003159, 0.834658, 0.4039216, 0, 1, 1,
0.5457444, -0.09793596, 1.608202, 0.4117647, 0, 1, 1,
0.5477114, 0.4526003, 0.3344917, 0.4156863, 0, 1, 1,
0.5533621, -0.7178082, 3.226182, 0.4235294, 0, 1, 1,
0.5545794, 1.915707, -0.2930362, 0.427451, 0, 1, 1,
0.5579079, 0.3919773, 0.2075969, 0.4352941, 0, 1, 1,
0.5617816, 0.7113603, -1.998339, 0.4392157, 0, 1, 1,
0.5675718, 1.315383, 1.256788, 0.4470588, 0, 1, 1,
0.5874456, 1.057256, 0.8422455, 0.4509804, 0, 1, 1,
0.5988536, -0.3119588, 2.614966, 0.4588235, 0, 1, 1,
0.6007313, -0.05881229, 2.907433, 0.4627451, 0, 1, 1,
0.6042714, -0.1330421, 1.204927, 0.4705882, 0, 1, 1,
0.6060694, -0.7682288, 2.790098, 0.4745098, 0, 1, 1,
0.6078779, 0.006754773, 3.319764, 0.4823529, 0, 1, 1,
0.6095887, -0.15668, 3.337065, 0.4862745, 0, 1, 1,
0.621211, 1.144365, -0.6606535, 0.4941176, 0, 1, 1,
0.6258233, -1.376226, 2.32846, 0.5019608, 0, 1, 1,
0.6270384, -0.2452468, 2.343667, 0.5058824, 0, 1, 1,
0.6309664, -0.4801634, 2.86221, 0.5137255, 0, 1, 1,
0.6393521, -0.3882324, 1.217434, 0.5176471, 0, 1, 1,
0.6455482, 1.472581, 3.152928, 0.5254902, 0, 1, 1,
0.6472114, -0.009539229, 2.77291, 0.5294118, 0, 1, 1,
0.6559767, -0.5260212, 0.8379499, 0.5372549, 0, 1, 1,
0.6567423, -1.28933, 3.177564, 0.5411765, 0, 1, 1,
0.6587404, -1.076306, 1.899501, 0.5490196, 0, 1, 1,
0.6589502, 1.472001, 0.1242935, 0.5529412, 0, 1, 1,
0.6810387, -0.1512578, 2.319469, 0.5607843, 0, 1, 1,
0.6849791, -0.5601967, 2.517356, 0.5647059, 0, 1, 1,
0.6911934, 0.8555867, -1.464195, 0.572549, 0, 1, 1,
0.6954455, -1.125931, 1.777281, 0.5764706, 0, 1, 1,
0.6969638, 1.503666, -0.5534814, 0.5843138, 0, 1, 1,
0.7025133, 1.325011, 2.41494, 0.5882353, 0, 1, 1,
0.7041613, -0.6646317, 2.856942, 0.5960785, 0, 1, 1,
0.7058752, -0.06794346, 1.403173, 0.6039216, 0, 1, 1,
0.7101892, -1.467237, 1.986466, 0.6078432, 0, 1, 1,
0.7177124, 1.895755, -1.156844, 0.6156863, 0, 1, 1,
0.7202167, -0.6122285, 3.259247, 0.6196079, 0, 1, 1,
0.7210035, 0.8299006, 1.749244, 0.627451, 0, 1, 1,
0.7233742, 0.9465148, 0.6213875, 0.6313726, 0, 1, 1,
0.7233853, -1.985196, 2.469504, 0.6392157, 0, 1, 1,
0.727372, 1.248858, -0.6690038, 0.6431373, 0, 1, 1,
0.7296641, 0.3496369, 0.6314297, 0.6509804, 0, 1, 1,
0.731517, -0.09603807, 0.9860324, 0.654902, 0, 1, 1,
0.7339669, -2.630643, 1.450167, 0.6627451, 0, 1, 1,
0.7396399, 0.05543991, 1.019759, 0.6666667, 0, 1, 1,
0.7433331, -0.1596829, 1.397573, 0.6745098, 0, 1, 1,
0.7453039, 1.031577, -0.04414862, 0.6784314, 0, 1, 1,
0.7461228, 1.363657, 2.451195, 0.6862745, 0, 1, 1,
0.7471431, 1.170899, -0.1475399, 0.6901961, 0, 1, 1,
0.7497568, 0.2290972, 0.2080721, 0.6980392, 0, 1, 1,
0.7521377, -0.4258295, 3.59823, 0.7058824, 0, 1, 1,
0.7536943, 0.6143627, 2.179834, 0.7098039, 0, 1, 1,
0.7586738, -0.02063076, 0.8538294, 0.7176471, 0, 1, 1,
0.7680945, -0.1409212, 0.6763792, 0.7215686, 0, 1, 1,
0.7712694, -0.893094, 1.675431, 0.7294118, 0, 1, 1,
0.7722025, -0.7048244, 1.30295, 0.7333333, 0, 1, 1,
0.7766095, -0.3788421, 2.063828, 0.7411765, 0, 1, 1,
0.7866847, -0.4748073, 0.02646467, 0.7450981, 0, 1, 1,
0.7902374, 0.4335377, 1.289919, 0.7529412, 0, 1, 1,
0.7935809, 0.6107743, -0.200867, 0.7568628, 0, 1, 1,
0.7950332, -0.704008, 1.830562, 0.7647059, 0, 1, 1,
0.7972342, 1.432198, 0.9551995, 0.7686275, 0, 1, 1,
0.7994696, 0.7545398, 0.8396382, 0.7764706, 0, 1, 1,
0.8004887, 1.132061, -0.593897, 0.7803922, 0, 1, 1,
0.8021412, -0.3111922, 1.118643, 0.7882353, 0, 1, 1,
0.8073094, -2.639706, 3.719558, 0.7921569, 0, 1, 1,
0.8076862, 0.462275, 1.907537, 0.8, 0, 1, 1,
0.8137621, -1.61072, 2.795215, 0.8078431, 0, 1, 1,
0.8173192, 0.3193024, 0.287609, 0.8117647, 0, 1, 1,
0.8194043, 1.083206, -0.02937072, 0.8196079, 0, 1, 1,
0.8257079, -1.530405, 3.666742, 0.8235294, 0, 1, 1,
0.8297097, 0.1364845, 2.531977, 0.8313726, 0, 1, 1,
0.8302151, 3.472397, -2.383254, 0.8352941, 0, 1, 1,
0.8340747, 0.5817161, 1.492123, 0.8431373, 0, 1, 1,
0.8355525, 1.596775, 1.110673, 0.8470588, 0, 1, 1,
0.835728, -0.4687623, -0.8847901, 0.854902, 0, 1, 1,
0.8393745, 0.4070079, 0.8134869, 0.8588235, 0, 1, 1,
0.839968, 1.101527, 1.612149, 0.8666667, 0, 1, 1,
0.8471019, 0.3878112, 1.040612, 0.8705882, 0, 1, 1,
0.8515292, 0.04124238, 1.833991, 0.8784314, 0, 1, 1,
0.8542646, -1.328035, 2.373495, 0.8823529, 0, 1, 1,
0.8568309, 0.32412, 2.905431, 0.8901961, 0, 1, 1,
0.8629448, 0.7336838, 0.6175731, 0.8941177, 0, 1, 1,
0.8661678, -1.295658, 1.383259, 0.9019608, 0, 1, 1,
0.8676951, -1.52096, 2.485471, 0.9098039, 0, 1, 1,
0.8719762, 1.796307, -0.4123697, 0.9137255, 0, 1, 1,
0.8720351, -1.008784, 0.9241692, 0.9215686, 0, 1, 1,
0.8791201, 1.352199, 1.763246, 0.9254902, 0, 1, 1,
0.8810485, -0.4024903, 2.345964, 0.9333333, 0, 1, 1,
0.8832985, -0.9379333, 1.215566, 0.9372549, 0, 1, 1,
0.8893984, 0.3280711, 1.884248, 0.945098, 0, 1, 1,
0.8983842, 0.3089377, 2.149321, 0.9490196, 0, 1, 1,
0.8986763, 1.233155, 0.7276973, 0.9568627, 0, 1, 1,
0.8998049, -1.553641, 3.076706, 0.9607843, 0, 1, 1,
0.9009928, -1.304632, 3.715567, 0.9686275, 0, 1, 1,
0.9103724, -0.4621699, 1.406394, 0.972549, 0, 1, 1,
0.9111086, -0.5982888, 1.335057, 0.9803922, 0, 1, 1,
0.9115041, -1.286115, 2.758221, 0.9843137, 0, 1, 1,
0.9167286, 0.2566694, 1.245871, 0.9921569, 0, 1, 1,
0.9192143, -0.06242399, 2.494413, 0.9960784, 0, 1, 1,
0.9196725, -0.7405033, 2.222806, 1, 0, 0.9960784, 1,
0.9311761, 0.3160903, 0.6420189, 1, 0, 0.9882353, 1,
0.9330267, -0.4445924, 2.889574, 1, 0, 0.9843137, 1,
0.9355286, 0.9333205, -0.2020066, 1, 0, 0.9764706, 1,
0.9461803, -1.120037, 2.548728, 1, 0, 0.972549, 1,
0.9499012, 0.1696109, 1.181378, 1, 0, 0.9647059, 1,
0.9565319, 1.909141, 1.645776, 1, 0, 0.9607843, 1,
0.9877787, 0.8726242, 1.47151, 1, 0, 0.9529412, 1,
0.9898593, -0.6038082, 1.937805, 1, 0, 0.9490196, 1,
0.990754, 1.813712, 2.101254, 1, 0, 0.9411765, 1,
0.9971846, 0.5148331, 1.112418, 1, 0, 0.9372549, 1,
0.9999043, -0.3714053, 1.32972, 1, 0, 0.9294118, 1,
1.013861, 0.9872913, 0.8607584, 1, 0, 0.9254902, 1,
1.030661, -0.6997901, 2.119235, 1, 0, 0.9176471, 1,
1.035306, 0.4076265, 1.04535, 1, 0, 0.9137255, 1,
1.036872, -0.5083098, 2.532807, 1, 0, 0.9058824, 1,
1.0462, -1.436749, 2.039095, 1, 0, 0.9019608, 1,
1.049462, 0.1004261, 1.532981, 1, 0, 0.8941177, 1,
1.053059, 0.5578862, 1.391111, 1, 0, 0.8862745, 1,
1.053896, -1.602172, 4.595422, 1, 0, 0.8823529, 1,
1.055415, 1.433075, 0.818568, 1, 0, 0.8745098, 1,
1.055533, 1.210056, 3.358252, 1, 0, 0.8705882, 1,
1.065736, 1.294829, -0.111192, 1, 0, 0.8627451, 1,
1.076031, -0.5042447, 2.044409, 1, 0, 0.8588235, 1,
1.080943, 1.344472, 0.3912439, 1, 0, 0.8509804, 1,
1.08131, -0.3838685, 2.972005, 1, 0, 0.8470588, 1,
1.092514, 0.1198864, -0.1535093, 1, 0, 0.8392157, 1,
1.093373, -0.6337534, 1.376518, 1, 0, 0.8352941, 1,
1.098178, -0.3361252, 1.364527, 1, 0, 0.827451, 1,
1.109314, -0.7410456, 1.647393, 1, 0, 0.8235294, 1,
1.112131, 1.617861, 0.9815403, 1, 0, 0.8156863, 1,
1.119727, 1.09823, 0.2332042, 1, 0, 0.8117647, 1,
1.119736, -0.195169, 2.927048, 1, 0, 0.8039216, 1,
1.121671, -0.3230942, 0.7482325, 1, 0, 0.7960784, 1,
1.127818, -1.473991, 2.209177, 1, 0, 0.7921569, 1,
1.129809, 0.1833419, 1.769583, 1, 0, 0.7843137, 1,
1.136242, 0.3620259, 3.217441, 1, 0, 0.7803922, 1,
1.145867, 0.4058927, 0.595817, 1, 0, 0.772549, 1,
1.149411, 1.410577, 3.39498, 1, 0, 0.7686275, 1,
1.152358, 0.2646616, 1.47027, 1, 0, 0.7607843, 1,
1.154803, -2.075728, 1.45052, 1, 0, 0.7568628, 1,
1.155485, -1.471798, 1.041684, 1, 0, 0.7490196, 1,
1.160679, -0.3793703, 0.3874359, 1, 0, 0.7450981, 1,
1.161015, 1.139697, 0.9138141, 1, 0, 0.7372549, 1,
1.163519, 1.3077, 0.7370386, 1, 0, 0.7333333, 1,
1.1663, -0.2777183, 1.317405, 1, 0, 0.7254902, 1,
1.174364, -0.1375909, 3.661967, 1, 0, 0.7215686, 1,
1.179127, -1.136557, 3.067358, 1, 0, 0.7137255, 1,
1.181083, 0.2001609, 2.590848, 1, 0, 0.7098039, 1,
1.182962, 0.8210973, 0.293989, 1, 0, 0.7019608, 1,
1.182993, -1.383248, 2.124704, 1, 0, 0.6941177, 1,
1.183951, 0.3098458, 1.25708, 1, 0, 0.6901961, 1,
1.184564, 0.6117898, 1.773499, 1, 0, 0.682353, 1,
1.196978, -1.697805, 2.809451, 1, 0, 0.6784314, 1,
1.205333, -0.5589129, 1.459517, 1, 0, 0.6705883, 1,
1.208298, -0.6721298, 0.3476666, 1, 0, 0.6666667, 1,
1.214524, 0.999724, 0.9851452, 1, 0, 0.6588235, 1,
1.216638, 0.8693095, 0.9854124, 1, 0, 0.654902, 1,
1.231923, 1.594457, 0.5734695, 1, 0, 0.6470588, 1,
1.235457, -0.2915293, 0.317861, 1, 0, 0.6431373, 1,
1.238672, 0.9148688, -0.01058069, 1, 0, 0.6352941, 1,
1.240691, -0.2529261, 2.281886, 1, 0, 0.6313726, 1,
1.241175, -0.9357576, 3.522327, 1, 0, 0.6235294, 1,
1.252038, 1.021227, -1.097377, 1, 0, 0.6196079, 1,
1.256894, 3.160238, -0.4278603, 1, 0, 0.6117647, 1,
1.262355, -1.068471, 3.789434, 1, 0, 0.6078432, 1,
1.265963, 2.069385, -1.013248, 1, 0, 0.6, 1,
1.271475, -0.3985983, 0.2411726, 1, 0, 0.5921569, 1,
1.314463, -1.59174, 2.94997, 1, 0, 0.5882353, 1,
1.316201, -0.452481, 1.784149, 1, 0, 0.5803922, 1,
1.327801, -0.1652915, 1.308397, 1, 0, 0.5764706, 1,
1.331914, 1.274861, 0.5740415, 1, 0, 0.5686275, 1,
1.3376, 1.340879, 1.39027, 1, 0, 0.5647059, 1,
1.340546, 1.260187, 0.2105038, 1, 0, 0.5568628, 1,
1.342833, -0.4565016, 2.661488, 1, 0, 0.5529412, 1,
1.344887, 1.705261, -0.08818934, 1, 0, 0.5450981, 1,
1.35098, -1.124521, 3.57205, 1, 0, 0.5411765, 1,
1.373798, 0.1948577, 0.9153924, 1, 0, 0.5333334, 1,
1.377141, 1.196325, 2.852539, 1, 0, 0.5294118, 1,
1.384876, 2.810999, 1.414113, 1, 0, 0.5215687, 1,
1.385003, -1.14652, 2.640355, 1, 0, 0.5176471, 1,
1.38575, 0.8834152, 2.984356, 1, 0, 0.509804, 1,
1.386691, -0.06404985, 0.9682974, 1, 0, 0.5058824, 1,
1.38741, -0.4380553, 1.067823, 1, 0, 0.4980392, 1,
1.390885, -0.8952028, 1.597698, 1, 0, 0.4901961, 1,
1.395251, 0.971844, 2.330237, 1, 0, 0.4862745, 1,
1.408116, 1.366137, 1.700003, 1, 0, 0.4784314, 1,
1.409359, 0.6788937, 0.1717662, 1, 0, 0.4745098, 1,
1.410285, 1.213839, 3.009941, 1, 0, 0.4666667, 1,
1.410586, 1.448072, 1.794822, 1, 0, 0.4627451, 1,
1.418121, -0.1449408, 3.499756, 1, 0, 0.454902, 1,
1.427851, 0.9036243, -0.2048749, 1, 0, 0.4509804, 1,
1.428234, 0.1126044, 0.4193199, 1, 0, 0.4431373, 1,
1.441619, -0.742992, 2.333828, 1, 0, 0.4392157, 1,
1.452543, 0.00456888, 1.447573, 1, 0, 0.4313726, 1,
1.456845, -0.5963548, 2.657055, 1, 0, 0.427451, 1,
1.457726, -1.680832, 1.405485, 1, 0, 0.4196078, 1,
1.460979, 0.3531983, 2.094986, 1, 0, 0.4156863, 1,
1.46382, -0.2663167, 2.132483, 1, 0, 0.4078431, 1,
1.508273, 0.4138522, -0.4087773, 1, 0, 0.4039216, 1,
1.514004, 2.095621, 0.4247382, 1, 0, 0.3960784, 1,
1.520987, 0.4379986, 1.316868, 1, 0, 0.3882353, 1,
1.52179, 0.3973347, 1.698363, 1, 0, 0.3843137, 1,
1.531585, 0.433098, -0.7181883, 1, 0, 0.3764706, 1,
1.539147, 1.399965, 0.07924404, 1, 0, 0.372549, 1,
1.559236, -0.8146213, 2.905694, 1, 0, 0.3647059, 1,
1.560882, -0.2543234, 2.974859, 1, 0, 0.3607843, 1,
1.567858, -0.840388, 0.7011598, 1, 0, 0.3529412, 1,
1.575826, -0.1202177, 1.781854, 1, 0, 0.3490196, 1,
1.577486, -1.066728, 1.106727, 1, 0, 0.3411765, 1,
1.579689, 0.1663787, 1.12631, 1, 0, 0.3372549, 1,
1.585773, -0.4423139, 2.089964, 1, 0, 0.3294118, 1,
1.602764, 0.09453091, 1.446079, 1, 0, 0.3254902, 1,
1.607243, -0.05136904, 1.837988, 1, 0, 0.3176471, 1,
1.633729, 1.264135, 0.9265461, 1, 0, 0.3137255, 1,
1.639599, -0.8316075, 0.9362895, 1, 0, 0.3058824, 1,
1.650813, -0.4831853, 1.465277, 1, 0, 0.2980392, 1,
1.661832, 0.6337148, 1.205547, 1, 0, 0.2941177, 1,
1.664921, 0.27028, 1.081992, 1, 0, 0.2862745, 1,
1.668382, 0.6228708, 1.709133, 1, 0, 0.282353, 1,
1.691434, 0.417311, 1.199312, 1, 0, 0.2745098, 1,
1.706233, 0.668129, 1.147774, 1, 0, 0.2705882, 1,
1.742652, 0.6158702, 0.6430626, 1, 0, 0.2627451, 1,
1.742901, -0.9965219, 2.599509, 1, 0, 0.2588235, 1,
1.763926, 0.9687459, 2.549392, 1, 0, 0.2509804, 1,
1.774725, -0.2858527, 1.711982, 1, 0, 0.2470588, 1,
1.786455, -0.4550707, 1.043172, 1, 0, 0.2392157, 1,
1.788124, 0.2578744, 0.3665103, 1, 0, 0.2352941, 1,
1.794636, -0.1658144, 2.962013, 1, 0, 0.227451, 1,
1.79801, 0.2409767, 2.787219, 1, 0, 0.2235294, 1,
1.798036, -0.08312771, 1.298637, 1, 0, 0.2156863, 1,
1.825612, 0.1084481, 0.09448357, 1, 0, 0.2117647, 1,
1.859319, 1.264609, 0.1022328, 1, 0, 0.2039216, 1,
1.86105, -2.35954, 3.587569, 1, 0, 0.1960784, 1,
1.869101, -0.637417, 2.254061, 1, 0, 0.1921569, 1,
1.875931, -1.477282, -0.09750977, 1, 0, 0.1843137, 1,
1.891395, -0.4916917, 1.015039, 1, 0, 0.1803922, 1,
1.911754, 1.274909, -0.6687524, 1, 0, 0.172549, 1,
1.912663, 1.069617, -0.6209158, 1, 0, 0.1686275, 1,
1.922551, -0.4768748, 1.947052, 1, 0, 0.1607843, 1,
1.931788, 0.4089722, -0.1447766, 1, 0, 0.1568628, 1,
1.948113, -0.6074429, 2.312366, 1, 0, 0.1490196, 1,
1.955066, 0.7642169, 0.5010315, 1, 0, 0.145098, 1,
1.963435, 0.4331691, 3.44381, 1, 0, 0.1372549, 1,
1.987078, -0.08772449, 1.307392, 1, 0, 0.1333333, 1,
1.996039, 0.7009382, 0.4690276, 1, 0, 0.1254902, 1,
2.041098, -1.119406, 1.315468, 1, 0, 0.1215686, 1,
2.049445, 1.218922, 2.575778, 1, 0, 0.1137255, 1,
2.053312, -1.153175, 2.653463, 1, 0, 0.1098039, 1,
2.116726, 0.04907349, 0.09155577, 1, 0, 0.1019608, 1,
2.128298, -1.389279, 1.194631, 1, 0, 0.09411765, 1,
2.139803, -0.810663, 0.408093, 1, 0, 0.09019608, 1,
2.147892, -3.434239, 1.173804, 1, 0, 0.08235294, 1,
2.19232, -0.711058, 2.592966, 1, 0, 0.07843138, 1,
2.270535, 0.4312276, 1.99314, 1, 0, 0.07058824, 1,
2.333413, 0.903002, 1.121948, 1, 0, 0.06666667, 1,
2.341156, 0.3042161, 1.304251, 1, 0, 0.05882353, 1,
2.345372, 0.6885641, -0.3119337, 1, 0, 0.05490196, 1,
2.371803, 0.3330918, 0.2978747, 1, 0, 0.04705882, 1,
2.437278, 0.1224874, 0.6860276, 1, 0, 0.04313726, 1,
2.464603, 1.906821, -0.02590606, 1, 0, 0.03529412, 1,
2.550543, -0.3398844, 1.886763, 1, 0, 0.03137255, 1,
2.843812, 1.291348, -0.5249427, 1, 0, 0.02352941, 1,
2.988963, -1.824345, 1.69587, 1, 0, 0.01960784, 1,
3.209373, -0.8091715, 1.21625, 1, 0, 0.01176471, 1,
3.439035, 0.9897083, 1.09296, 1, 0, 0.007843138, 1
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
0.2816097, -4.604913, -8.067899, 0, -0.5, 0.5, 0.5,
0.2816097, -4.604913, -8.067899, 1, -0.5, 0.5, 0.5,
0.2816097, -4.604913, -8.067899, 1, 1.5, 0.5, 0.5,
0.2816097, -4.604913, -8.067899, 0, 1.5, 0.5, 0.5
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
-3.946183, 0.01907921, -8.067899, 0, -0.5, 0.5, 0.5,
-3.946183, 0.01907921, -8.067899, 1, -0.5, 0.5, 0.5,
-3.946183, 0.01907921, -8.067899, 1, 1.5, 0.5, 0.5,
-3.946183, 0.01907921, -8.067899, 0, 1.5, 0.5, 0.5
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
-3.946183, -4.604913, -0.5120969, 0, -0.5, 0.5, 0.5,
-3.946183, -4.604913, -0.5120969, 1, -0.5, 0.5, 0.5,
-3.946183, -4.604913, -0.5120969, 1, 1.5, 0.5, 0.5,
-3.946183, -4.604913, -0.5120969, 0, 1.5, 0.5, 0.5
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
-2, -3.537838, -6.324252,
3, -3.537838, -6.324252,
-2, -3.537838, -6.324252,
-2, -3.715684, -6.61486,
-1, -3.537838, -6.324252,
-1, -3.715684, -6.61486,
0, -3.537838, -6.324252,
0, -3.715684, -6.61486,
1, -3.537838, -6.324252,
1, -3.715684, -6.61486,
2, -3.537838, -6.324252,
2, -3.715684, -6.61486,
3, -3.537838, -6.324252,
3, -3.715684, -6.61486
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
-2, -4.071376, -7.196075, 0, -0.5, 0.5, 0.5,
-2, -4.071376, -7.196075, 1, -0.5, 0.5, 0.5,
-2, -4.071376, -7.196075, 1, 1.5, 0.5, 0.5,
-2, -4.071376, -7.196075, 0, 1.5, 0.5, 0.5,
-1, -4.071376, -7.196075, 0, -0.5, 0.5, 0.5,
-1, -4.071376, -7.196075, 1, -0.5, 0.5, 0.5,
-1, -4.071376, -7.196075, 1, 1.5, 0.5, 0.5,
-1, -4.071376, -7.196075, 0, 1.5, 0.5, 0.5,
0, -4.071376, -7.196075, 0, -0.5, 0.5, 0.5,
0, -4.071376, -7.196075, 1, -0.5, 0.5, 0.5,
0, -4.071376, -7.196075, 1, 1.5, 0.5, 0.5,
0, -4.071376, -7.196075, 0, 1.5, 0.5, 0.5,
1, -4.071376, -7.196075, 0, -0.5, 0.5, 0.5,
1, -4.071376, -7.196075, 1, -0.5, 0.5, 0.5,
1, -4.071376, -7.196075, 1, 1.5, 0.5, 0.5,
1, -4.071376, -7.196075, 0, 1.5, 0.5, 0.5,
2, -4.071376, -7.196075, 0, -0.5, 0.5, 0.5,
2, -4.071376, -7.196075, 1, -0.5, 0.5, 0.5,
2, -4.071376, -7.196075, 1, 1.5, 0.5, 0.5,
2, -4.071376, -7.196075, 0, 1.5, 0.5, 0.5,
3, -4.071376, -7.196075, 0, -0.5, 0.5, 0.5,
3, -4.071376, -7.196075, 1, -0.5, 0.5, 0.5,
3, -4.071376, -7.196075, 1, 1.5, 0.5, 0.5,
3, -4.071376, -7.196075, 0, 1.5, 0.5, 0.5
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
-2.970538, -3, -6.324252,
-2.970538, 3, -6.324252,
-2.970538, -3, -6.324252,
-3.133146, -3, -6.61486,
-2.970538, -2, -6.324252,
-3.133146, -2, -6.61486,
-2.970538, -1, -6.324252,
-3.133146, -1, -6.61486,
-2.970538, 0, -6.324252,
-3.133146, 0, -6.61486,
-2.970538, 1, -6.324252,
-3.133146, 1, -6.61486,
-2.970538, 2, -6.324252,
-3.133146, 2, -6.61486,
-2.970538, 3, -6.324252,
-3.133146, 3, -6.61486
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
-3.458361, -3, -7.196075, 0, -0.5, 0.5, 0.5,
-3.458361, -3, -7.196075, 1, -0.5, 0.5, 0.5,
-3.458361, -3, -7.196075, 1, 1.5, 0.5, 0.5,
-3.458361, -3, -7.196075, 0, 1.5, 0.5, 0.5,
-3.458361, -2, -7.196075, 0, -0.5, 0.5, 0.5,
-3.458361, -2, -7.196075, 1, -0.5, 0.5, 0.5,
-3.458361, -2, -7.196075, 1, 1.5, 0.5, 0.5,
-3.458361, -2, -7.196075, 0, 1.5, 0.5, 0.5,
-3.458361, -1, -7.196075, 0, -0.5, 0.5, 0.5,
-3.458361, -1, -7.196075, 1, -0.5, 0.5, 0.5,
-3.458361, -1, -7.196075, 1, 1.5, 0.5, 0.5,
-3.458361, -1, -7.196075, 0, 1.5, 0.5, 0.5,
-3.458361, 0, -7.196075, 0, -0.5, 0.5, 0.5,
-3.458361, 0, -7.196075, 1, -0.5, 0.5, 0.5,
-3.458361, 0, -7.196075, 1, 1.5, 0.5, 0.5,
-3.458361, 0, -7.196075, 0, 1.5, 0.5, 0.5,
-3.458361, 1, -7.196075, 0, -0.5, 0.5, 0.5,
-3.458361, 1, -7.196075, 1, -0.5, 0.5, 0.5,
-3.458361, 1, -7.196075, 1, 1.5, 0.5, 0.5,
-3.458361, 1, -7.196075, 0, 1.5, 0.5, 0.5,
-3.458361, 2, -7.196075, 0, -0.5, 0.5, 0.5,
-3.458361, 2, -7.196075, 1, -0.5, 0.5, 0.5,
-3.458361, 2, -7.196075, 1, 1.5, 0.5, 0.5,
-3.458361, 2, -7.196075, 0, 1.5, 0.5, 0.5,
-3.458361, 3, -7.196075, 0, -0.5, 0.5, 0.5,
-3.458361, 3, -7.196075, 1, -0.5, 0.5, 0.5,
-3.458361, 3, -7.196075, 1, 1.5, 0.5, 0.5,
-3.458361, 3, -7.196075, 0, 1.5, 0.5, 0.5
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
-2.970538, -3.537838, -6,
-2.970538, -3.537838, 4,
-2.970538, -3.537838, -6,
-3.133146, -3.715684, -6,
-2.970538, -3.537838, -4,
-3.133146, -3.715684, -4,
-2.970538, -3.537838, -2,
-3.133146, -3.715684, -2,
-2.970538, -3.537838, 0,
-3.133146, -3.715684, 0,
-2.970538, -3.537838, 2,
-3.133146, -3.715684, 2,
-2.970538, -3.537838, 4,
-3.133146, -3.715684, 4
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
"-6",
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
-3.458361, -4.071376, -6, 0, -0.5, 0.5, 0.5,
-3.458361, -4.071376, -6, 1, -0.5, 0.5, 0.5,
-3.458361, -4.071376, -6, 1, 1.5, 0.5, 0.5,
-3.458361, -4.071376, -6, 0, 1.5, 0.5, 0.5,
-3.458361, -4.071376, -4, 0, -0.5, 0.5, 0.5,
-3.458361, -4.071376, -4, 1, -0.5, 0.5, 0.5,
-3.458361, -4.071376, -4, 1, 1.5, 0.5, 0.5,
-3.458361, -4.071376, -4, 0, 1.5, 0.5, 0.5,
-3.458361, -4.071376, -2, 0, -0.5, 0.5, 0.5,
-3.458361, -4.071376, -2, 1, -0.5, 0.5, 0.5,
-3.458361, -4.071376, -2, 1, 1.5, 0.5, 0.5,
-3.458361, -4.071376, -2, 0, 1.5, 0.5, 0.5,
-3.458361, -4.071376, 0, 0, -0.5, 0.5, 0.5,
-3.458361, -4.071376, 0, 1, -0.5, 0.5, 0.5,
-3.458361, -4.071376, 0, 1, 1.5, 0.5, 0.5,
-3.458361, -4.071376, 0, 0, 1.5, 0.5, 0.5,
-3.458361, -4.071376, 2, 0, -0.5, 0.5, 0.5,
-3.458361, -4.071376, 2, 1, -0.5, 0.5, 0.5,
-3.458361, -4.071376, 2, 1, 1.5, 0.5, 0.5,
-3.458361, -4.071376, 2, 0, 1.5, 0.5, 0.5,
-3.458361, -4.071376, 4, 0, -0.5, 0.5, 0.5,
-3.458361, -4.071376, 4, 1, -0.5, 0.5, 0.5,
-3.458361, -4.071376, 4, 1, 1.5, 0.5, 0.5,
-3.458361, -4.071376, 4, 0, 1.5, 0.5, 0.5
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
-2.970538, -3.537838, -6.324252,
-2.970538, 3.575997, -6.324252,
-2.970538, -3.537838, 5.300058,
-2.970538, 3.575997, 5.300058,
-2.970538, -3.537838, -6.324252,
-2.970538, -3.537838, 5.300058,
-2.970538, 3.575997, -6.324252,
-2.970538, 3.575997, 5.300058,
-2.970538, -3.537838, -6.324252,
3.533758, -3.537838, -6.324252,
-2.970538, -3.537838, 5.300058,
3.533758, -3.537838, 5.300058,
-2.970538, 3.575997, -6.324252,
3.533758, 3.575997, -6.324252,
-2.970538, 3.575997, 5.300058,
3.533758, 3.575997, 5.300058,
3.533758, -3.537838, -6.324252,
3.533758, 3.575997, -6.324252,
3.533758, -3.537838, 5.300058,
3.533758, 3.575997, 5.300058,
3.533758, -3.537838, -6.324252,
3.533758, -3.537838, 5.300058,
3.533758, 3.575997, -6.324252,
3.533758, 3.575997, 5.300058
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
var radius = 8.063586;
var distance = 35.8758;
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
mvMatrix.translate( -0.2816097, -0.01907921, 0.5120969 );
mvMatrix.scale( 1.340423, 1.225571, 0.7500236 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.8758);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Karathane<-read.table("Karathane.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Karathane$V2
```

```
## Error in eval(expr, envir, enclos): object 'Karathane' not found
```

```r
y<-Karathane$V3
```

```
## Error in eval(expr, envir, enclos): object 'Karathane' not found
```

```r
z<-Karathane$V4
```

```
## Error in eval(expr, envir, enclos): object 'Karathane' not found
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
-2.875816, 0.8617828, -3.138212, 0, 0, 1, 1, 1,
-2.811218, -1.447701, -1.359114, 1, 0, 0, 1, 1,
-2.761766, -0.1196821, -2.003391, 1, 0, 0, 1, 1,
-2.72549, 0.8210522, -2.407488, 1, 0, 0, 1, 1,
-2.702199, 0.5822722, -0.8812237, 1, 0, 0, 1, 1,
-2.524112, -2.230707, -2.500532, 1, 0, 0, 1, 1,
-2.503517, -0.8502737, -1.37061, 0, 0, 0, 1, 1,
-2.453623, -1.726248, -2.932217, 0, 0, 0, 1, 1,
-2.348206, -0.303331, -2.563487, 0, 0, 0, 1, 1,
-2.307479, 0.8821895, -0.7467827, 0, 0, 0, 1, 1,
-2.302026, -0.7561221, -1.36426, 0, 0, 0, 1, 1,
-2.262717, -0.7058284, -1.55954, 0, 0, 0, 1, 1,
-2.18425, -0.6472055, -0.9769871, 0, 0, 0, 1, 1,
-2.138224, -0.1345088, -1.508615, 1, 1, 1, 1, 1,
-2.088866, 0.6464598, -0.9342396, 1, 1, 1, 1, 1,
-2.074524, -0.08505616, -1.425338, 1, 1, 1, 1, 1,
-2.038007, 0.4080469, -3.416914, 1, 1, 1, 1, 1,
-2.019627, 0.7419829, 0.5353009, 1, 1, 1, 1, 1,
-2.006313, 0.5801563, -2.48941, 1, 1, 1, 1, 1,
-2.001982, 0.2330362, -3.137354, 1, 1, 1, 1, 1,
-2.001315, 1.689955, -1.987493, 1, 1, 1, 1, 1,
-1.99553, -0.1872983, -0.910223, 1, 1, 1, 1, 1,
-1.983285, -1.623697, -2.590335, 1, 1, 1, 1, 1,
-1.981803, -0.3872517, -1.020694, 1, 1, 1, 1, 1,
-1.978445, -0.7189791, -1.417661, 1, 1, 1, 1, 1,
-1.971868, -0.9682559, -3.897243, 1, 1, 1, 1, 1,
-1.954291, 1.612236, -1.698742, 1, 1, 1, 1, 1,
-1.94027, 0.8901168, -1.318333, 1, 1, 1, 1, 1,
-1.930082, 0.8005421, -0.8883656, 0, 0, 1, 1, 1,
-1.905842, -3.018665, -2.899832, 1, 0, 0, 1, 1,
-1.892301, 0.1038602, -2.531101, 1, 0, 0, 1, 1,
-1.881535, 0.7596135, -2.030984, 1, 0, 0, 1, 1,
-1.839873, -1.63695, -1.596597, 1, 0, 0, 1, 1,
-1.828977, -1.025852, -2.192153, 1, 0, 0, 1, 1,
-1.824158, -1.214102, -1.444684, 0, 0, 0, 1, 1,
-1.819813, 1.067949, 0.2494784, 0, 0, 0, 1, 1,
-1.812288, 0.8681451, -2.337297, 0, 0, 0, 1, 1,
-1.79661, 1.407339, -2.526089, 0, 0, 0, 1, 1,
-1.783632, 0.1853573, -2.075115, 0, 0, 0, 1, 1,
-1.767612, -0.09598948, -2.110497, 0, 0, 0, 1, 1,
-1.765536, 1.063329, -1.261395, 0, 0, 0, 1, 1,
-1.754984, 1.335163, -1.529001, 1, 1, 1, 1, 1,
-1.712087, 1.003466, -1.638538, 1, 1, 1, 1, 1,
-1.70614, -1.31127, -1.927432, 1, 1, 1, 1, 1,
-1.701097, -1.048221, -3.091508, 1, 1, 1, 1, 1,
-1.694416, 0.5708741, -1.413698, 1, 1, 1, 1, 1,
-1.689088, -0.9489368, -1.60033, 1, 1, 1, 1, 1,
-1.686172, 1.991434, -1.176745, 1, 1, 1, 1, 1,
-1.647467, -1.180038, -2.422129, 1, 1, 1, 1, 1,
-1.630978, -0.8093501, 0.4440909, 1, 1, 1, 1, 1,
-1.615043, 1.454303, 1.058058, 1, 1, 1, 1, 1,
-1.595445, 1.572468, -1.381471, 1, 1, 1, 1, 1,
-1.591618, 0.7107216, -0.8248867, 1, 1, 1, 1, 1,
-1.591075, -0.7748587, -3.744068, 1, 1, 1, 1, 1,
-1.580355, 0.2730439, -2.114536, 1, 1, 1, 1, 1,
-1.580297, -1.525921, -1.41309, 1, 1, 1, 1, 1,
-1.577242, -0.2504864, -1.04427, 0, 0, 1, 1, 1,
-1.56932, 0.1055455, -0.2024493, 1, 0, 0, 1, 1,
-1.567977, -1.495426, -2.671262, 1, 0, 0, 1, 1,
-1.562552, 0.1916286, -1.76712, 1, 0, 0, 1, 1,
-1.544051, -0.1018346, -0.2099827, 1, 0, 0, 1, 1,
-1.531393, -0.05771896, -1.661951, 1, 0, 0, 1, 1,
-1.520642, 2.10238, 1.959098, 0, 0, 0, 1, 1,
-1.519367, -0.9857937, -2.145161, 0, 0, 0, 1, 1,
-1.517985, 1.650987, -0.06156034, 0, 0, 0, 1, 1,
-1.509545, -0.7374426, -2.360764, 0, 0, 0, 1, 1,
-1.507261, 0.7282503, -1.356291, 0, 0, 0, 1, 1,
-1.47403, 0.3102068, -2.524241, 0, 0, 0, 1, 1,
-1.466638, 0.236503, -1.813135, 0, 0, 0, 1, 1,
-1.457581, 0.8466466, -0.8304141, 1, 1, 1, 1, 1,
-1.454589, 0.4416101, -0.9039785, 1, 1, 1, 1, 1,
-1.452384, -0.317376, -2.299549, 1, 1, 1, 1, 1,
-1.440523, -0.146841, -2.930571, 1, 1, 1, 1, 1,
-1.437834, 0.1407303, -2.331954, 1, 1, 1, 1, 1,
-1.432237, 1.246114, -1.225103, 1, 1, 1, 1, 1,
-1.418546, 0.5954548, -1.754502, 1, 1, 1, 1, 1,
-1.413129, 1.039372, 1.30726, 1, 1, 1, 1, 1,
-1.398915, -0.0960917, -0.9683646, 1, 1, 1, 1, 1,
-1.39291, 0.1359255, -3.087724, 1, 1, 1, 1, 1,
-1.386287, -1.789263, -1.496099, 1, 1, 1, 1, 1,
-1.38362, -1.173884, -2.212502, 1, 1, 1, 1, 1,
-1.382415, 0.7679753, -0.6522263, 1, 1, 1, 1, 1,
-1.380273, -0.1430919, -1.544212, 1, 1, 1, 1, 1,
-1.379622, -0.5815578, -0.9698036, 1, 1, 1, 1, 1,
-1.376204, -0.7766301, -2.008799, 0, 0, 1, 1, 1,
-1.350983, 0.03761812, -1.080971, 1, 0, 0, 1, 1,
-1.345185, 1.199375, -0.8512766, 1, 0, 0, 1, 1,
-1.324474, 0.3938838, -1.361225, 1, 0, 0, 1, 1,
-1.322682, 0.4374838, -1.128189, 1, 0, 0, 1, 1,
-1.322628, 0.2037499, -1.674498, 1, 0, 0, 1, 1,
-1.322164, 0.5614687, -1.209982, 0, 0, 0, 1, 1,
-1.310206, -0.8063427, -1.754359, 0, 0, 0, 1, 1,
-1.299594, -0.4009273, -2.841566, 0, 0, 0, 1, 1,
-1.279887, -1.369875, -2.448175, 0, 0, 0, 1, 1,
-1.278535, 0.3186355, 0.4613101, 0, 0, 0, 1, 1,
-1.266797, 0.3096727, -1.772623, 0, 0, 0, 1, 1,
-1.265814, -2.041553, -2.474623, 0, 0, 0, 1, 1,
-1.265433, 1.245661, 0.8213099, 1, 1, 1, 1, 1,
-1.26456, -0.8654249, -1.578403, 1, 1, 1, 1, 1,
-1.255698, -0.67505, -1.526048, 1, 1, 1, 1, 1,
-1.255339, -0.1250544, 0.8853495, 1, 1, 1, 1, 1,
-1.248185, 0.3182531, -1.913276, 1, 1, 1, 1, 1,
-1.247223, 0.5151473, 1.376202, 1, 1, 1, 1, 1,
-1.233297, 1.687244, -1.935985, 1, 1, 1, 1, 1,
-1.22922, 1.050792, -2.283197, 1, 1, 1, 1, 1,
-1.225232, -0.8392889, -2.344337, 1, 1, 1, 1, 1,
-1.221963, -0.8624147, -2.949303, 1, 1, 1, 1, 1,
-1.217927, -1.645388, -2.860624, 1, 1, 1, 1, 1,
-1.216257, -0.7974503, -3.558118, 1, 1, 1, 1, 1,
-1.20082, 0.8178126, -1.771751, 1, 1, 1, 1, 1,
-1.192178, -0.9318376, -1.942975, 1, 1, 1, 1, 1,
-1.182162, -1.368565, -1.741327, 1, 1, 1, 1, 1,
-1.179787, 1.067655, -2.678851, 0, 0, 1, 1, 1,
-1.176299, 1.542925, -1.139341, 1, 0, 0, 1, 1,
-1.163944, -0.3945079, -1.033431, 1, 0, 0, 1, 1,
-1.16312, 0.4949901, -1.452579, 1, 0, 0, 1, 1,
-1.157967, 0.1269547, -3.381569, 1, 0, 0, 1, 1,
-1.14181, 0.7599672, -3.57743, 1, 0, 0, 1, 1,
-1.135665, 0.2418365, 0.03892202, 0, 0, 0, 1, 1,
-1.11841, 2.642832, 0.3561855, 0, 0, 0, 1, 1,
-1.114474, -1.025129, -2.223763, 0, 0, 0, 1, 1,
-1.113544, -0.2254824, -1.87826, 0, 0, 0, 1, 1,
-1.110209, 0.6277995, 0.477766, 0, 0, 0, 1, 1,
-1.103546, 0.6806831, -1.454839, 0, 0, 0, 1, 1,
-1.102824, -0.9453675, -2.322097, 0, 0, 0, 1, 1,
-1.10021, -0.158469, -0.6221784, 1, 1, 1, 1, 1,
-1.09736, 0.005568193, -2.65938, 1, 1, 1, 1, 1,
-1.095785, -0.1423773, -2.094531, 1, 1, 1, 1, 1,
-1.094749, 0.06772655, -2.40816, 1, 1, 1, 1, 1,
-1.092946, -0.9853933, -1.683637, 1, 1, 1, 1, 1,
-1.08932, -0.1365285, -0.7182431, 1, 1, 1, 1, 1,
-1.086779, -0.3873828, -1.928072, 1, 1, 1, 1, 1,
-1.085648, -1.06401, -2.229674, 1, 1, 1, 1, 1,
-1.085343, 0.7689763, -1.567906, 1, 1, 1, 1, 1,
-1.070456, -0.6876845, -1.853165, 1, 1, 1, 1, 1,
-1.065653, -0.6191791, -0.9787666, 1, 1, 1, 1, 1,
-1.060257, 1.382801, -1.747205, 1, 1, 1, 1, 1,
-1.06018, 0.5635101, -2.839611, 1, 1, 1, 1, 1,
-1.053304, 0.4764282, -2.639215, 1, 1, 1, 1, 1,
-1.053216, 1.611043, -1.052105, 1, 1, 1, 1, 1,
-1.052286, 0.1895492, -0.7958286, 0, 0, 1, 1, 1,
-1.050298, 0.5994546, -2.014598, 1, 0, 0, 1, 1,
-1.049735, -2.106889, -2.515708, 1, 0, 0, 1, 1,
-1.049049, -0.3189816, -2.999296, 1, 0, 0, 1, 1,
-1.045555, 0.6983262, -0.1983595, 1, 0, 0, 1, 1,
-1.03285, 0.6543877, 0.02883406, 1, 0, 0, 1, 1,
-1.032141, -0.2844632, -2.997987, 0, 0, 0, 1, 1,
-1.026352, -0.02009317, -0.9733624, 0, 0, 0, 1, 1,
-1.025118, 0.9328577, -1.644789, 0, 0, 0, 1, 1,
-1.023322, 0.500468, -1.67689, 0, 0, 0, 1, 1,
-1.017706, 1.023563, -0.5061463, 0, 0, 0, 1, 1,
-1.013778, 0.5644473, 0.1658411, 0, 0, 0, 1, 1,
-1.009615, -0.5514882, -1.810917, 0, 0, 0, 1, 1,
-1.001588, -2.060989, -3.782002, 1, 1, 1, 1, 1,
-1.000627, -0.6781032, -1.906243, 1, 1, 1, 1, 1,
-0.9964662, 1.115848, -1.321265, 1, 1, 1, 1, 1,
-0.996228, 0.6413146, 0.2773059, 1, 1, 1, 1, 1,
-0.9951507, 2.42627, 0.8112457, 1, 1, 1, 1, 1,
-0.9848129, 1.168307, -1.034581, 1, 1, 1, 1, 1,
-0.9842487, 0.3857444, -1.743771, 1, 1, 1, 1, 1,
-0.9796616, -0.2073759, -1.256888, 1, 1, 1, 1, 1,
-0.9786538, -0.8736696, -2.794612, 1, 1, 1, 1, 1,
-0.9756854, 0.1299991, -2.601556, 1, 1, 1, 1, 1,
-0.9736394, 1.33081, 0.08502421, 1, 1, 1, 1, 1,
-0.9725325, -0.5344371, -0.9326859, 1, 1, 1, 1, 1,
-0.9713196, -0.4858972, -2.004354, 1, 1, 1, 1, 1,
-0.9649953, 0.7339971, -1.969452, 1, 1, 1, 1, 1,
-0.960886, 1.317568, -0.4803879, 1, 1, 1, 1, 1,
-0.9587744, -0.9522424, -2.893656, 0, 0, 1, 1, 1,
-0.9545816, 0.578555, -0.8997816, 1, 0, 0, 1, 1,
-0.9544933, 0.8803136, -0.5188502, 1, 0, 0, 1, 1,
-0.9487967, -1.06957, -1.15837, 1, 0, 0, 1, 1,
-0.9468135, 1.431188, 0.2624681, 1, 0, 0, 1, 1,
-0.944841, -0.8844184, -3.522554, 1, 0, 0, 1, 1,
-0.9371706, 0.2830203, 0.136927, 0, 0, 0, 1, 1,
-0.9352811, 0.006397175, -2.428694, 0, 0, 0, 1, 1,
-0.9311544, 0.922906, -0.7271475, 0, 0, 0, 1, 1,
-0.9283479, 1.406368, -0.01831366, 0, 0, 0, 1, 1,
-0.9240683, -0.009068179, -1.010679, 0, 0, 0, 1, 1,
-0.9161025, -0.4737899, -2.068419, 0, 0, 0, 1, 1,
-0.9037675, 2.273713, 0.9565181, 0, 0, 0, 1, 1,
-0.9019681, -0.02448469, -0.6523065, 1, 1, 1, 1, 1,
-0.9013074, -0.5500849, -2.705787, 1, 1, 1, 1, 1,
-0.9006496, 1.628515, -2.743946, 1, 1, 1, 1, 1,
-0.9005271, -1.299383, -2.631696, 1, 1, 1, 1, 1,
-0.8990826, 0.8320906, 0.0580544, 1, 1, 1, 1, 1,
-0.8976872, -0.5589416, -2.421116, 1, 1, 1, 1, 1,
-0.8946906, 0.4853739, -2.984717, 1, 1, 1, 1, 1,
-0.8931677, -2.879884, -2.608284, 1, 1, 1, 1, 1,
-0.8871022, -0.04255578, -0.414851, 1, 1, 1, 1, 1,
-0.8870065, 1.493471, -0.7852712, 1, 1, 1, 1, 1,
-0.8811765, 1.262518, 0.5542674, 1, 1, 1, 1, 1,
-0.8769983, 0.07747342, -2.496821, 1, 1, 1, 1, 1,
-0.863045, 1.119594, -1.181283, 1, 1, 1, 1, 1,
-0.8613223, 1.75961, -1.089034, 1, 1, 1, 1, 1,
-0.8565766, 1.072178, -2.036613, 1, 1, 1, 1, 1,
-0.8541036, 1.703346, -1.020441, 0, 0, 1, 1, 1,
-0.852516, 0.4785709, -1.447202, 1, 0, 0, 1, 1,
-0.8519376, -1.066003, -2.498705, 1, 0, 0, 1, 1,
-0.8516838, -0.7925153, -2.258885, 1, 0, 0, 1, 1,
-0.8484651, 2.576944, 0.01466018, 1, 0, 0, 1, 1,
-0.8481727, 0.7116224, 0.01797457, 1, 0, 0, 1, 1,
-0.8455284, 1.197782, 0.3420918, 0, 0, 0, 1, 1,
-0.8437392, 1.635284, -1.196258, 0, 0, 0, 1, 1,
-0.8436652, 1.515264, -2.024637, 0, 0, 0, 1, 1,
-0.8404378, 0.6614879, -0.3149609, 0, 0, 0, 1, 1,
-0.8380342, 0.4174784, -1.530221, 0, 0, 0, 1, 1,
-0.8379388, -0.4345369, -2.002325, 0, 0, 0, 1, 1,
-0.8296432, -2.049129, -3.017554, 0, 0, 0, 1, 1,
-0.8278763, 0.5721501, -0.9115416, 1, 1, 1, 1, 1,
-0.827275, -1.803948, -2.216914, 1, 1, 1, 1, 1,
-0.8262795, 1.589453, -0.9282699, 1, 1, 1, 1, 1,
-0.8238835, -0.06710056, -2.045392, 1, 1, 1, 1, 1,
-0.8149853, 0.8508798, -0.7613239, 1, 1, 1, 1, 1,
-0.8147902, 0.2561593, -3.483161, 1, 1, 1, 1, 1,
-0.8111895, 0.6040841, -0.8832619, 1, 1, 1, 1, 1,
-0.8070267, 1.360976, -0.8231708, 1, 1, 1, 1, 1,
-0.8026962, -0.08571611, -1.432149, 1, 1, 1, 1, 1,
-0.7915258, -0.04002636, -1.883872, 1, 1, 1, 1, 1,
-0.7898032, -0.5188823, -2.004235, 1, 1, 1, 1, 1,
-0.7874937, 0.9146676, 0.1300947, 1, 1, 1, 1, 1,
-0.784919, 2.45131, 0.3253101, 1, 1, 1, 1, 1,
-0.784756, 0.4199693, 0.3988832, 1, 1, 1, 1, 1,
-0.7805831, 0.7529875, -1.141255, 1, 1, 1, 1, 1,
-0.7748467, 0.07223029, -1.441167, 0, 0, 1, 1, 1,
-0.7734086, -0.7677614, -2.173252, 1, 0, 0, 1, 1,
-0.7684185, -0.8391307, -3.464762, 1, 0, 0, 1, 1,
-0.7682025, -1.82791, -3.110877, 1, 0, 0, 1, 1,
-0.7676962, 1.373659, -1.529655, 1, 0, 0, 1, 1,
-0.7654811, -0.04839071, -0.5651942, 1, 0, 0, 1, 1,
-0.7618876, -0.8740117, -2.138079, 0, 0, 0, 1, 1,
-0.7582047, 0.4882668, 1.207062, 0, 0, 0, 1, 1,
-0.7581959, 0.0742099, -0.2700387, 0, 0, 0, 1, 1,
-0.7565725, 0.01699536, -0.8964342, 0, 0, 0, 1, 1,
-0.7533992, 0.732056, -0.5885068, 0, 0, 0, 1, 1,
-0.7519611, -0.08439442, -1.056603, 0, 0, 0, 1, 1,
-0.7499123, -0.6550071, -1.687481, 0, 0, 0, 1, 1,
-0.7488708, 0.655121, -1.265804, 1, 1, 1, 1, 1,
-0.7419913, 0.7877975, -1.459672, 1, 1, 1, 1, 1,
-0.7402522, 1.616643, 1.152852, 1, 1, 1, 1, 1,
-0.7369934, 1.926924, -1.455969, 1, 1, 1, 1, 1,
-0.732861, 2.1071, 0.4000367, 1, 1, 1, 1, 1,
-0.7318221, 1.257289, -1.190971, 1, 1, 1, 1, 1,
-0.7305601, -1.715992, -1.408619, 1, 1, 1, 1, 1,
-0.7229686, -0.8662209, -1.631623, 1, 1, 1, 1, 1,
-0.7204497, 0.9538964, 0.5432951, 1, 1, 1, 1, 1,
-0.7195015, 0.5664759, -1.354884, 1, 1, 1, 1, 1,
-0.718397, -1.083794, -2.486482, 1, 1, 1, 1, 1,
-0.7171137, -2.017225, -3.832436, 1, 1, 1, 1, 1,
-0.7117711, -1.218438, -3.319885, 1, 1, 1, 1, 1,
-0.7114241, -0.8971508, -4.237679, 1, 1, 1, 1, 1,
-0.7076005, -0.4112977, -3.233336, 1, 1, 1, 1, 1,
-0.7009469, -0.0090704, -1.437644, 0, 0, 1, 1, 1,
-0.6998063, -0.7972932, -0.7875142, 1, 0, 0, 1, 1,
-0.6982957, -0.4318632, -3.393579, 1, 0, 0, 1, 1,
-0.6919051, -1.072793, -1.528998, 1, 0, 0, 1, 1,
-0.6886502, 1.684829, -0.2240075, 1, 0, 0, 1, 1,
-0.6824282, 0.5322946, -1.032917, 1, 0, 0, 1, 1,
-0.6797419, -2.294226, -2.743272, 0, 0, 0, 1, 1,
-0.671371, 0.36375, -0.9446287, 0, 0, 0, 1, 1,
-0.6655465, 0.253628, 2.240722, 0, 0, 0, 1, 1,
-0.657175, 1.516681, -1.335018, 0, 0, 0, 1, 1,
-0.6549992, 0.5256626, -0.7102029, 0, 0, 0, 1, 1,
-0.6526498, -0.8079276, -1.335236, 0, 0, 0, 1, 1,
-0.6515541, -0.7542138, -2.283273, 0, 0, 0, 1, 1,
-0.6514937, 0.6168905, -0.3419852, 1, 1, 1, 1, 1,
-0.651069, -0.7629232, -2.962986, 1, 1, 1, 1, 1,
-0.648963, -0.4381067, -1.787305, 1, 1, 1, 1, 1,
-0.6440518, 1.123719, -0.7802129, 1, 1, 1, 1, 1,
-0.6378201, -0.1937352, -2.780638, 1, 1, 1, 1, 1,
-0.6325968, -0.3789495, -2.873156, 1, 1, 1, 1, 1,
-0.6325667, -0.3840666, -1.646549, 1, 1, 1, 1, 1,
-0.6295096, 0.6879354, 0.7925982, 1, 1, 1, 1, 1,
-0.6281464, 0.9392769, 0.3988541, 1, 1, 1, 1, 1,
-0.6177319, 0.1599768, -1.083403, 1, 1, 1, 1, 1,
-0.6142158, 1.10886, -1.556234, 1, 1, 1, 1, 1,
-0.6133659, 1.143283, -1.424146, 1, 1, 1, 1, 1,
-0.6129157, -1.281469, -2.647164, 1, 1, 1, 1, 1,
-0.6107827, -0.2286332, -2.190113, 1, 1, 1, 1, 1,
-0.6088892, 2.177415, -0.2147488, 1, 1, 1, 1, 1,
-0.6060545, 0.6844895, 0.09661897, 0, 0, 1, 1, 1,
-0.6041963, 1.84579, 1.547071, 1, 0, 0, 1, 1,
-0.6025443, 1.062319, 0.4277334, 1, 0, 0, 1, 1,
-0.6002025, 0.2468035, -3.577904, 1, 0, 0, 1, 1,
-0.5989801, -0.4331927, -1.558322, 1, 0, 0, 1, 1,
-0.5977993, -0.07176124, -1.249394, 1, 0, 0, 1, 1,
-0.5931419, -1.701421, -4.692675, 0, 0, 0, 1, 1,
-0.5928531, 1.587182, 0.4119042, 0, 0, 0, 1, 1,
-0.5917315, -0.4983176, 0.0562445, 0, 0, 0, 1, 1,
-0.5916536, 1.012889, -1.149087, 0, 0, 0, 1, 1,
-0.5896383, 1.642954, -0.8095896, 0, 0, 0, 1, 1,
-0.588303, 2.787936, -2.131917, 0, 0, 0, 1, 1,
-0.586328, -3.142047, -2.747121, 0, 0, 0, 1, 1,
-0.5860159, 0.4268417, -1.363151, 1, 1, 1, 1, 1,
-0.5747862, 1.099803, -0.658054, 1, 1, 1, 1, 1,
-0.5744079, -0.9196165, -2.466016, 1, 1, 1, 1, 1,
-0.5715082, -0.2770762, -2.498406, 1, 1, 1, 1, 1,
-0.5708454, -0.7586928, -2.202014, 1, 1, 1, 1, 1,
-0.5673769, 0.8165585, -1.01937, 1, 1, 1, 1, 1,
-0.5662774, 1.360926, -2.28057, 1, 1, 1, 1, 1,
-0.5643584, -1.018546, -2.911852, 1, 1, 1, 1, 1,
-0.562296, -1.55124, -1.439979, 1, 1, 1, 1, 1,
-0.5603389, 0.2296094, -2.482916, 1, 1, 1, 1, 1,
-0.5596971, -0.2051117, -2.988944, 1, 1, 1, 1, 1,
-0.5481955, 0.4088751, -1.63183, 1, 1, 1, 1, 1,
-0.5454494, 1.396361, 1.479248, 1, 1, 1, 1, 1,
-0.5393333, 0.4303099, -1.842387, 1, 1, 1, 1, 1,
-0.5388603, -0.8229867, -1.889603, 1, 1, 1, 1, 1,
-0.5378743, -1.189538, -3.116641, 0, 0, 1, 1, 1,
-0.5370176, 1.018665, -0.523667, 1, 0, 0, 1, 1,
-0.5331097, 0.06785396, -1.869606, 1, 0, 0, 1, 1,
-0.531807, -0.3210945, -2.454685, 1, 0, 0, 1, 1,
-0.5311687, 0.3458061, -2.466555, 1, 0, 0, 1, 1,
-0.5267919, 0.3890372, -1.567602, 1, 0, 0, 1, 1,
-0.5265592, 1.673998, 0.221359, 0, 0, 0, 1, 1,
-0.5235479, -1.674722, -0.7594086, 0, 0, 0, 1, 1,
-0.5220966, 0.2440397, -0.8739971, 0, 0, 0, 1, 1,
-0.5192495, -0.7080016, -0.8399006, 0, 0, 0, 1, 1,
-0.5184659, -0.8867307, -3.651716, 0, 0, 0, 1, 1,
-0.5175727, -2.201645, -1.48149, 0, 0, 0, 1, 1,
-0.5123504, 0.2511753, -0.4095272, 0, 0, 0, 1, 1,
-0.5107391, 0.1585007, -2.151609, 1, 1, 1, 1, 1,
-0.5085576, 0.6334534, -0.3807457, 1, 1, 1, 1, 1,
-0.5029464, 0.310384, -1.745893, 1, 1, 1, 1, 1,
-0.4936791, -0.8870733, -4.169057, 1, 1, 1, 1, 1,
-0.4904386, -0.1827096, -2.077011, 1, 1, 1, 1, 1,
-0.4875664, -0.7306901, -2.40521, 1, 1, 1, 1, 1,
-0.4870787, 1.249928, -0.9788678, 1, 1, 1, 1, 1,
-0.4861479, 0.05778512, -3.516555, 1, 1, 1, 1, 1,
-0.4844576, 0.6572945, 0.3374929, 1, 1, 1, 1, 1,
-0.4832961, -0.9653488, -3.577796, 1, 1, 1, 1, 1,
-0.4813644, -0.762338, -4.557196, 1, 1, 1, 1, 1,
-0.4790991, -0.3768518, -3.041256, 1, 1, 1, 1, 1,
-0.4779994, -0.3329049, -2.548599, 1, 1, 1, 1, 1,
-0.4779873, -0.5989226, -1.743906, 1, 1, 1, 1, 1,
-0.4770142, 0.6880028, -2.531109, 1, 1, 1, 1, 1,
-0.4741984, 0.3943355, -1.925146, 0, 0, 1, 1, 1,
-0.4723656, -1.497542, -1.005187, 1, 0, 0, 1, 1,
-0.472234, -0.395379, -3.080092, 1, 0, 0, 1, 1,
-0.4650956, -0.007026538, 0.4572052, 1, 0, 0, 1, 1,
-0.4603127, -1.282553, -3.716909, 1, 0, 0, 1, 1,
-0.4602346, 0.5748659, 1.216072, 1, 0, 0, 1, 1,
-0.4601735, 1.037389, -0.9321228, 0, 0, 0, 1, 1,
-0.4594313, 0.1958337, 0.005105702, 0, 0, 0, 1, 1,
-0.4590996, 0.2057705, -0.3476419, 0, 0, 0, 1, 1,
-0.4533789, 1.023689, -0.4332028, 0, 0, 0, 1, 1,
-0.4502786, 0.5428454, -0.4808181, 0, 0, 0, 1, 1,
-0.4483938, 0.1349359, -2.250833, 0, 0, 0, 1, 1,
-0.4480464, 0.476656, 0.2276401, 0, 0, 0, 1, 1,
-0.4449283, 0.2410271, -1.861049, 1, 1, 1, 1, 1,
-0.4313979, 1.911571, -0.887704, 1, 1, 1, 1, 1,
-0.4290745, 0.05254913, -2.046251, 1, 1, 1, 1, 1,
-0.4235963, -0.532462, -3.416128, 1, 1, 1, 1, 1,
-0.4213515, -3.201737, -3.082592, 1, 1, 1, 1, 1,
-0.4208151, 0.2035877, -1.430552, 1, 1, 1, 1, 1,
-0.4193179, 2.009917, -1.209987, 1, 1, 1, 1, 1,
-0.4192635, 0.7473263, -0.4616043, 1, 1, 1, 1, 1,
-0.4162672, 0.1161257, -1.580194, 1, 1, 1, 1, 1,
-0.4118311, 2.32458, -0.1850215, 1, 1, 1, 1, 1,
-0.4118083, 0.4648027, -0.5580819, 1, 1, 1, 1, 1,
-0.4113201, 1.306183, -1.970472, 1, 1, 1, 1, 1,
-0.4096063, 0.1784441, -1.088945, 1, 1, 1, 1, 1,
-0.407121, -0.5759403, -3.212089, 1, 1, 1, 1, 1,
-0.3978997, -0.8278631, -2.058046, 1, 1, 1, 1, 1,
-0.3953052, 0.2052597, -1.754431, 0, 0, 1, 1, 1,
-0.3918085, -0.222343, -2.293504, 1, 0, 0, 1, 1,
-0.3894022, 0.8642878, -0.6587167, 1, 0, 0, 1, 1,
-0.384448, -0.5170051, -3.106011, 1, 0, 0, 1, 1,
-0.3791537, 1.717324, -0.477836, 1, 0, 0, 1, 1,
-0.3781524, 1.476821, -0.1720051, 1, 0, 0, 1, 1,
-0.3773133, -1.470119, -1.59511, 0, 0, 0, 1, 1,
-0.3766012, -0.6790158, -2.147956, 0, 0, 0, 1, 1,
-0.3685962, -0.1585883, -3.916135, 0, 0, 0, 1, 1,
-0.3679617, -0.1958196, -2.72311, 0, 0, 0, 1, 1,
-0.3644334, -0.522965, -3.016325, 0, 0, 0, 1, 1,
-0.3624392, -0.569539, -0.8787092, 0, 0, 0, 1, 1,
-0.3596576, -0.600888, -5.403688, 0, 0, 0, 1, 1,
-0.3580907, -0.6383306, -2.200025, 1, 1, 1, 1, 1,
-0.3575552, 1.054815, 0.5048764, 1, 1, 1, 1, 1,
-0.3562214, -0.1555337, -2.386883, 1, 1, 1, 1, 1,
-0.3514122, 0.2535192, -2.168802, 1, 1, 1, 1, 1,
-0.3512143, 1.899199, 1.143225, 1, 1, 1, 1, 1,
-0.3502667, 0.1711198, -2.65904, 1, 1, 1, 1, 1,
-0.3477643, -1.901586, -1.765025, 1, 1, 1, 1, 1,
-0.3473473, -0.3507496, -1.950731, 1, 1, 1, 1, 1,
-0.3433872, -0.4218429, -1.482323, 1, 1, 1, 1, 1,
-0.3421272, 0.2871992, -1.072795, 1, 1, 1, 1, 1,
-0.3348977, -0.8941527, -3.098603, 1, 1, 1, 1, 1,
-0.3335045, -0.7994483, -3.70116, 1, 1, 1, 1, 1,
-0.3316411, 0.1198577, 0.1080841, 1, 1, 1, 1, 1,
-0.3276147, -0.1662846, -2.595111, 1, 1, 1, 1, 1,
-0.3272896, -0.9015498, -1.595521, 1, 1, 1, 1, 1,
-0.3240287, 0.9686674, 0.07421542, 0, 0, 1, 1, 1,
-0.3203766, -1.571623, -2.299757, 1, 0, 0, 1, 1,
-0.3182722, -0.9811295, -3.209488, 1, 0, 0, 1, 1,
-0.3159542, 1.006013, 0.501515, 1, 0, 0, 1, 1,
-0.3111139, -0.9629772, -2.878247, 1, 0, 0, 1, 1,
-0.3096465, -0.8171536, -2.542598, 1, 0, 0, 1, 1,
-0.3095109, 0.9744451, -0.06769781, 0, 0, 0, 1, 1,
-0.3059342, 0.005849189, -1.243963, 0, 0, 0, 1, 1,
-0.3058185, -1.174924, -1.225302, 0, 0, 0, 1, 1,
-0.2983432, -0.8368862, -4.396103, 0, 0, 0, 1, 1,
-0.295546, -0.3828453, -2.179602, 0, 0, 0, 1, 1,
-0.2951771, -0.6375223, -4.241219, 0, 0, 0, 1, 1,
-0.2929235, 0.02471671, -2.162577, 0, 0, 0, 1, 1,
-0.2899684, -0.9059933, -4.121614, 1, 1, 1, 1, 1,
-0.2893271, -0.7671291, -3.064033, 1, 1, 1, 1, 1,
-0.2892458, 0.1971133, -2.366014, 1, 1, 1, 1, 1,
-0.2883719, -0.198623, -2.629026, 1, 1, 1, 1, 1,
-0.2847852, -0.8477776, -4.357464, 1, 1, 1, 1, 1,
-0.2839764, 0.6206169, -0.6325283, 1, 1, 1, 1, 1,
-0.2809075, 0.4345481, -0.4563546, 1, 1, 1, 1, 1,
-0.2752177, -2.712321, -2.722314, 1, 1, 1, 1, 1,
-0.2641632, -1.453118, -1.036892, 1, 1, 1, 1, 1,
-0.263829, -1.349869, -2.457817, 1, 1, 1, 1, 1,
-0.2564066, -1.729387, -1.937737, 1, 1, 1, 1, 1,
-0.2561592, 0.9075024, -0.07657593, 1, 1, 1, 1, 1,
-0.2522455, -0.8768596, -1.803319, 1, 1, 1, 1, 1,
-0.2507936, 1.057454, -2.183476, 1, 1, 1, 1, 1,
-0.2446523, -0.6623204, -3.603006, 1, 1, 1, 1, 1,
-0.2397742, 0.1002922, -2.941086, 0, 0, 1, 1, 1,
-0.2349294, 0.866976, 0.2058214, 1, 0, 0, 1, 1,
-0.2342622, 2.054389, -1.004597, 1, 0, 0, 1, 1,
-0.2318746, 0.0414977, -2.040374, 1, 0, 0, 1, 1,
-0.229617, -0.08011909, -3.432668, 1, 0, 0, 1, 1,
-0.2278624, -0.2939665, -1.979155, 1, 0, 0, 1, 1,
-0.227541, 1.053698, 0.3003006, 0, 0, 0, 1, 1,
-0.2227374, 0.02790197, -1.72323, 0, 0, 0, 1, 1,
-0.2215307, 0.8853417, 0.3932535, 0, 0, 0, 1, 1,
-0.2197514, 0.7711928, 0.3680776, 0, 0, 0, 1, 1,
-0.213816, 0.6182579, -0.4287562, 0, 0, 0, 1, 1,
-0.2119066, 1.025469, 1.778017, 0, 0, 0, 1, 1,
-0.2109751, 1.334701, 0.4673605, 0, 0, 0, 1, 1,
-0.2101779, -1.464981, -1.002369, 1, 1, 1, 1, 1,
-0.2071559, 0.6395294, -1.038036, 1, 1, 1, 1, 1,
-0.2012402, -0.5316913, -1.618445, 1, 1, 1, 1, 1,
-0.2001168, 0.5107985, -0.5852267, 1, 1, 1, 1, 1,
-0.1942728, 0.4473246, -0.8491523, 1, 1, 1, 1, 1,
-0.1904375, -1.371178, -2.761302, 1, 1, 1, 1, 1,
-0.1880373, 0.7633243, -0.2034116, 1, 1, 1, 1, 1,
-0.1876773, 0.6486022, 1.895694, 1, 1, 1, 1, 1,
-0.1872382, -1.44417, -3.829312, 1, 1, 1, 1, 1,
-0.1857571, 0.2016245, 0.3523905, 1, 1, 1, 1, 1,
-0.175111, -2.116722, -2.565607, 1, 1, 1, 1, 1,
-0.1696054, -0.9162323, -1.590119, 1, 1, 1, 1, 1,
-0.169055, 1.63156, 1.019492, 1, 1, 1, 1, 1,
-0.1670751, -0.8715189, -4.751879, 1, 1, 1, 1, 1,
-0.1635676, -0.09559981, -2.25631, 1, 1, 1, 1, 1,
-0.1617442, 1.125871, 0.4751668, 0, 0, 1, 1, 1,
-0.1608856, -1.483042, -3.363806, 1, 0, 0, 1, 1,
-0.1518008, -0.4684273, -2.165885, 1, 0, 0, 1, 1,
-0.1509266, 1.749228, 0.3923819, 1, 0, 0, 1, 1,
-0.1467384, -1.291669, -4.093925, 1, 0, 0, 1, 1,
-0.1457514, 0.1283873, 1.551662, 1, 0, 0, 1, 1,
-0.1453759, 0.03936312, -1.200973, 0, 0, 0, 1, 1,
-0.145321, -0.090903, -4.996215, 0, 0, 0, 1, 1,
-0.144772, -1.779825, -4.42506, 0, 0, 0, 1, 1,
-0.1436545, -0.8415574, -3.509797, 0, 0, 0, 1, 1,
-0.1430037, 0.9228581, -0.5036676, 0, 0, 0, 1, 1,
-0.1403413, -1.417492, -2.306133, 0, 0, 0, 1, 1,
-0.139904, 0.4237297, 0.02767929, 0, 0, 0, 1, 1,
-0.1306226, 1.470378, -0.7318151, 1, 1, 1, 1, 1,
-0.129664, 0.3337398, -0.08929453, 1, 1, 1, 1, 1,
-0.1294965, -0.6450119, -3.035159, 1, 1, 1, 1, 1,
-0.1288947, 1.001533, -0.6098593, 1, 1, 1, 1, 1,
-0.1275651, -0.587677, -3.262424, 1, 1, 1, 1, 1,
-0.1248204, 0.06375736, 0.1134625, 1, 1, 1, 1, 1,
-0.1226322, -0.4395434, -3.987474, 1, 1, 1, 1, 1,
-0.1174314, 0.4506115, 0.6903759, 1, 1, 1, 1, 1,
-0.114083, -1.203939, -3.489765, 1, 1, 1, 1, 1,
-0.1075767, -1.233416, -2.030371, 1, 1, 1, 1, 1,
-0.104688, 0.806715, 0.4283643, 1, 1, 1, 1, 1,
-0.09921026, -0.4767853, -3.664209, 1, 1, 1, 1, 1,
-0.09311256, -0.6249021, -2.612883, 1, 1, 1, 1, 1,
-0.08565202, -1.172265, -2.662278, 1, 1, 1, 1, 1,
-0.08561181, 1.48157, 1.151455, 1, 1, 1, 1, 1,
-0.08437712, -1.232621, -3.340922, 0, 0, 1, 1, 1,
-0.08376724, 0.3244472, 0.4998043, 1, 0, 0, 1, 1,
-0.0802146, 0.3293977, 0.6130896, 1, 0, 0, 1, 1,
-0.07954913, 2.151448, 0.8063313, 1, 0, 0, 1, 1,
-0.07809924, -1.081522, -6.154966, 1, 0, 0, 1, 1,
-0.07382433, 0.3635253, -1.366205, 1, 0, 0, 1, 1,
-0.07100303, 1.335053, 0.02021089, 0, 0, 0, 1, 1,
-0.0709057, -0.1832107, -3.155272, 0, 0, 0, 1, 1,
-0.07080992, -0.2731856, -2.652333, 0, 0, 0, 1, 1,
-0.07011382, 1.202017, -0.1784216, 0, 0, 0, 1, 1,
-0.06631427, -0.1409001, -2.878349, 0, 0, 0, 1, 1,
-0.06556647, 0.9378519, 1.527101, 0, 0, 0, 1, 1,
-0.06551245, -0.4203743, -3.661488, 0, 0, 0, 1, 1,
-0.06285901, -0.8187693, -2.594677, 1, 1, 1, 1, 1,
-0.05881844, -0.3423495, -3.808131, 1, 1, 1, 1, 1,
-0.05703739, 0.3546388, 0.542138, 1, 1, 1, 1, 1,
-0.05593061, 0.8903161, 0.9151784, 1, 1, 1, 1, 1,
-0.05588666, 1.815122, 0.05673416, 1, 1, 1, 1, 1,
-0.05338633, -0.5359013, -2.426182, 1, 1, 1, 1, 1,
-0.04728565, -0.188616, -1.269314, 1, 1, 1, 1, 1,
-0.04437348, -0.5801942, -2.859356, 1, 1, 1, 1, 1,
-0.0387881, -0.2293964, -4.898567, 1, 1, 1, 1, 1,
-0.03851106, 0.9425021, -0.6010292, 1, 1, 1, 1, 1,
-0.03793169, -0.05430368, -3.475506, 1, 1, 1, 1, 1,
-0.03776986, 1.032016, -0.7791793, 1, 1, 1, 1, 1,
-0.03687555, -0.5443112, -4.527355, 1, 1, 1, 1, 1,
-0.03604352, 0.7011486, 0.1969341, 1, 1, 1, 1, 1,
-0.03517827, -0.9302205, -4.393061, 1, 1, 1, 1, 1,
-0.03322157, 1.035721, -1.044985, 0, 0, 1, 1, 1,
-0.03228888, 0.4695356, -0.9517935, 1, 0, 0, 1, 1,
-0.02666646, 0.04681945, -1.742996, 1, 0, 0, 1, 1,
-0.02292895, 0.2005808, 0.4665412, 1, 0, 0, 1, 1,
-0.02195833, -1.320183, -4.669872, 1, 0, 0, 1, 1,
-0.01776746, -1.013029, -3.576392, 1, 0, 0, 1, 1,
-0.01661317, 0.08223889, 0.2247457, 0, 0, 0, 1, 1,
-0.01517661, 0.8718439, 0.5985823, 0, 0, 0, 1, 1,
-0.01033625, 0.8335162, -0.6487564, 0, 0, 0, 1, 1,
-0.01023923, -0.5568653, -2.113903, 0, 0, 0, 1, 1,
-0.01015964, 0.1624792, 0.6133317, 0, 0, 0, 1, 1,
-0.008566148, 1.846065, -0.04003597, 0, 0, 0, 1, 1,
-0.006480062, 0.4578983, 0.7151682, 0, 0, 0, 1, 1,
-0.006269258, -0.02665667, -3.907008, 1, 1, 1, 1, 1,
-0.005776933, -0.9093969, -4.247346, 1, 1, 1, 1, 1,
-0.002451202, -0.5736545, -1.57137, 1, 1, 1, 1, 1,
0.001720026, -2.538006, 3.861411, 1, 1, 1, 1, 1,
0.002797529, 1.252029, 0.5006631, 1, 1, 1, 1, 1,
0.00755968, -0.1742198, 2.884197, 1, 1, 1, 1, 1,
0.01226954, 1.960078, 1.35749, 1, 1, 1, 1, 1,
0.01519065, 0.7914551, 0.8658348, 1, 1, 1, 1, 1,
0.01688558, 0.7711639, 1.843995, 1, 1, 1, 1, 1,
0.02043776, 0.3232394, 0.1886082, 1, 1, 1, 1, 1,
0.02433223, -0.4556164, 3.052122, 1, 1, 1, 1, 1,
0.02642461, 0.2261378, 0.4333455, 1, 1, 1, 1, 1,
0.02692998, -1.30506, 3.646935, 1, 1, 1, 1, 1,
0.02727497, 0.03362337, -0.03528602, 1, 1, 1, 1, 1,
0.03027494, 0.9408594, -0.3822729, 1, 1, 1, 1, 1,
0.0330633, 0.8344033, -0.2982765, 0, 0, 1, 1, 1,
0.03768945, 0.713856, -1.082078, 1, 0, 0, 1, 1,
0.03769976, 1.029621, -1.948948, 1, 0, 0, 1, 1,
0.03901371, 0.4155306, 1.223439, 1, 0, 0, 1, 1,
0.04050011, 3.09325, 0.8287352, 1, 0, 0, 1, 1,
0.04636895, 0.2926855, -1.084371, 1, 0, 0, 1, 1,
0.05147026, -1.471594, 2.803632, 0, 0, 0, 1, 1,
0.05153592, -2.29362, 2.673663, 0, 0, 0, 1, 1,
0.05220219, 0.1921391, 0.009515312, 0, 0, 0, 1, 1,
0.05593852, -0.1648103, 1.411251, 0, 0, 0, 1, 1,
0.05755109, -1.084982, 2.471, 0, 0, 0, 1, 1,
0.05784136, -1.650941, 3.408867, 0, 0, 0, 1, 1,
0.05841707, 0.7456424, -0.3116836, 0, 0, 0, 1, 1,
0.05929783, 0.7813866, 0.02152567, 1, 1, 1, 1, 1,
0.05934361, -1.767816, 3.191091, 1, 1, 1, 1, 1,
0.06132913, -1.10882, 3.08901, 1, 1, 1, 1, 1,
0.06433268, -0.4080392, 2.284928, 1, 1, 1, 1, 1,
0.06454856, 0.5673961, -1.077933, 1, 1, 1, 1, 1,
0.06514307, -0.033065, 1.912459, 1, 1, 1, 1, 1,
0.06605091, 0.3279045, -0.1615214, 1, 1, 1, 1, 1,
0.06690079, -0.8618062, 3.364637, 1, 1, 1, 1, 1,
0.06691646, 0.7407712, 2.495991, 1, 1, 1, 1, 1,
0.07008513, 0.8201151, 1.515939, 1, 1, 1, 1, 1,
0.07438365, 0.8846691, -0.9181475, 1, 1, 1, 1, 1,
0.07454783, -1.942914, 4.699004, 1, 1, 1, 1, 1,
0.0780801, 0.7547609, 0.7960069, 1, 1, 1, 1, 1,
0.0796039, -0.8713435, 2.245857, 1, 1, 1, 1, 1,
0.08247567, -1.145158, 3.534841, 1, 1, 1, 1, 1,
0.08700334, -1.768532, 4.831355, 0, 0, 1, 1, 1,
0.09138452, -0.8129677, 3.242126, 1, 0, 0, 1, 1,
0.09559104, 0.4148677, 1.113182, 1, 0, 0, 1, 1,
0.09990701, 0.09494634, 2.244927, 1, 0, 0, 1, 1,
0.100949, -1.049995, 4.157517, 1, 0, 0, 1, 1,
0.1022727, -0.1736769, 3.819168, 1, 0, 0, 1, 1,
0.1028282, -1.322867, 3.123744, 0, 0, 0, 1, 1,
0.1064842, -0.4548258, 3.949084, 0, 0, 0, 1, 1,
0.1069605, -1.02778, 2.246974, 0, 0, 0, 1, 1,
0.1131025, 0.05081339, 2.817414, 0, 0, 0, 1, 1,
0.114461, 2.76004, -1.736021, 0, 0, 0, 1, 1,
0.1145691, -0.3587682, 2.603607, 0, 0, 0, 1, 1,
0.1156623, -0.6711786, 2.761487, 0, 0, 0, 1, 1,
0.1191474, -1.530906, 2.401644, 1, 1, 1, 1, 1,
0.1202935, -1.871536, 3.934857, 1, 1, 1, 1, 1,
0.1231788, 0.1068796, -0.5437927, 1, 1, 1, 1, 1,
0.1238059, 0.5883901, 2.889746, 1, 1, 1, 1, 1,
0.1260669, -0.4141855, 2.223352, 1, 1, 1, 1, 1,
0.1269237, 0.9809822, 0.8972404, 1, 1, 1, 1, 1,
0.1272048, -0.1152689, 1.720799, 1, 1, 1, 1, 1,
0.1311315, -0.1261204, 2.644649, 1, 1, 1, 1, 1,
0.134995, 0.419218, -0.921089, 1, 1, 1, 1, 1,
0.1351962, 1.032725, -0.6162101, 1, 1, 1, 1, 1,
0.1365275, 0.2804441, 1.624929, 1, 1, 1, 1, 1,
0.1374258, -0.5433184, 3.034959, 1, 1, 1, 1, 1,
0.145661, -0.1757383, 1.850092, 1, 1, 1, 1, 1,
0.1504244, -0.03204666, 2.329618, 1, 1, 1, 1, 1,
0.1601618, -1.157907, 2.897859, 1, 1, 1, 1, 1,
0.1664328, -0.9109929, 2.263592, 0, 0, 1, 1, 1,
0.1667188, 0.3429175, 1.455994, 1, 0, 0, 1, 1,
0.1709412, -0.1716205, 4.007435, 1, 0, 0, 1, 1,
0.1739342, -0.814894, 2.386919, 1, 0, 0, 1, 1,
0.1741874, -0.2360273, 1.545907, 1, 0, 0, 1, 1,
0.1766014, -0.5427579, 1.730795, 1, 0, 0, 1, 1,
0.1784249, -0.845756, 4.825677, 0, 0, 0, 1, 1,
0.1787875, -0.1261392, 1.732863, 0, 0, 0, 1, 1,
0.1794208, -0.05334323, 2.39963, 0, 0, 0, 1, 1,
0.1796845, 0.1455558, -0.3983538, 0, 0, 0, 1, 1,
0.1827282, -1.487193, 3.961237, 0, 0, 0, 1, 1,
0.1897907, -0.02279875, 2.617385, 0, 0, 0, 1, 1,
0.1905619, -0.5311525, 1.969995, 0, 0, 0, 1, 1,
0.1929315, -1.100385, 1.161294, 1, 1, 1, 1, 1,
0.197971, 0.3953443, -0.8577558, 1, 1, 1, 1, 1,
0.198832, -2.344396, 2.72825, 1, 1, 1, 1, 1,
0.2039774, -0.5984939, 4.874384, 1, 1, 1, 1, 1,
0.2071966, -1.396761, 3.069577, 1, 1, 1, 1, 1,
0.2084769, 0.06118893, -0.1519636, 1, 1, 1, 1, 1,
0.2151828, 1.719521, -1.249908, 1, 1, 1, 1, 1,
0.2166875, 0.003944074, 2.432745, 1, 1, 1, 1, 1,
0.2181393, -0.2470884, 2.107928, 1, 1, 1, 1, 1,
0.2211346, 0.1932393, -0.1902643, 1, 1, 1, 1, 1,
0.2223893, -0.9218686, 2.708967, 1, 1, 1, 1, 1,
0.2272586, -0.7345124, 1.646617, 1, 1, 1, 1, 1,
0.228723, -0.3839046, 1.852653, 1, 1, 1, 1, 1,
0.2308236, 0.675359, 0.7060821, 1, 1, 1, 1, 1,
0.2310665, 0.5753904, 0.1231133, 1, 1, 1, 1, 1,
0.2320866, -1.492525, 1.583866, 0, 0, 1, 1, 1,
0.2334583, -1.461633, 5.004003, 1, 0, 0, 1, 1,
0.2371848, 1.441448, -0.5551538, 1, 0, 0, 1, 1,
0.240472, -0.01334565, 0.2807367, 1, 0, 0, 1, 1,
0.2426653, -1.571531, 1.897812, 1, 0, 0, 1, 1,
0.2451904, 1.248549, 0.8192313, 1, 0, 0, 1, 1,
0.2481361, 0.06929197, 0.6442784, 0, 0, 0, 1, 1,
0.2510514, -0.1395137, 1.095354, 0, 0, 0, 1, 1,
0.2541268, -1.401567, 1.901119, 0, 0, 0, 1, 1,
0.2593054, -1.337181, 2.802488, 0, 0, 0, 1, 1,
0.2600155, 0.8716888, -1.524642, 0, 0, 0, 1, 1,
0.2601499, -0.4654648, 2.355153, 0, 0, 0, 1, 1,
0.264679, 0.8759049, 1.152727, 0, 0, 0, 1, 1,
0.2671095, 0.5837072, 0.8724977, 1, 1, 1, 1, 1,
0.2763079, -1.209505, 2.403295, 1, 1, 1, 1, 1,
0.277055, -0.7451778, 1.668573, 1, 1, 1, 1, 1,
0.2818037, -0.4189941, 2.919457, 1, 1, 1, 1, 1,
0.2826845, 0.7304395, 0.0971233, 1, 1, 1, 1, 1,
0.2842484, 1.28052, 1.21437, 1, 1, 1, 1, 1,
0.2870293, 0.1847165, 0.8673281, 1, 1, 1, 1, 1,
0.289022, 0.7948608, 0.05638584, 1, 1, 1, 1, 1,
0.2929669, 1.61919, -0.2990295, 1, 1, 1, 1, 1,
0.2938334, -0.7103949, 2.429399, 1, 1, 1, 1, 1,
0.293887, 1.787554, -0.7918302, 1, 1, 1, 1, 1,
0.2949665, 0.336582, 0.6963053, 1, 1, 1, 1, 1,
0.2974563, -1.303439, 3.391846, 1, 1, 1, 1, 1,
0.2978686, -0.4873448, 2.652381, 1, 1, 1, 1, 1,
0.2981609, -2.563692, 3.316366, 1, 1, 1, 1, 1,
0.3029476, 0.724877, 0.1408935, 0, 0, 1, 1, 1,
0.3051884, -0.8737787, 3.567587, 1, 0, 0, 1, 1,
0.3053913, -2.363722, 1.178088, 1, 0, 0, 1, 1,
0.3062522, 0.7143205, -0.3829674, 1, 0, 0, 1, 1,
0.3069064, 1.463211, 3.154275, 1, 0, 0, 1, 1,
0.3095871, -0.9044115, 2.101942, 1, 0, 0, 1, 1,
0.3118154, 2.077187, 0.6105991, 0, 0, 0, 1, 1,
0.3126726, 1.297451, 0.3526426, 0, 0, 0, 1, 1,
0.3310831, -0.204928, 2.588696, 0, 0, 0, 1, 1,
0.3416607, -1.092884, 2.02676, 0, 0, 0, 1, 1,
0.3473122, 0.1890061, 0.9399287, 0, 0, 0, 1, 1,
0.347708, -0.3586964, 1.564717, 0, 0, 0, 1, 1,
0.3498252, -0.8868831, 3.952627, 0, 0, 0, 1, 1,
0.3522185, 2.751091, 0.8963795, 1, 1, 1, 1, 1,
0.3537374, 0.8707848, 0.8254756, 1, 1, 1, 1, 1,
0.3549379, 1.329035, 1.694114, 1, 1, 1, 1, 1,
0.3593205, 1.771505, 1.885333, 1, 1, 1, 1, 1,
0.3645058, 1.396798, -1.089425, 1, 1, 1, 1, 1,
0.3659083, -0.1532182, 2.738442, 1, 1, 1, 1, 1,
0.3663002, -0.2045672, 1.388179, 1, 1, 1, 1, 1,
0.3673854, -0.2342518, 3.56818, 1, 1, 1, 1, 1,
0.3691618, 2.684813, 0.662719, 1, 1, 1, 1, 1,
0.372583, -1.477044, 3.249662, 1, 1, 1, 1, 1,
0.3729248, 0.6097762, 0.1049655, 1, 1, 1, 1, 1,
0.3746008, -0.5997957, 0.8238407, 1, 1, 1, 1, 1,
0.3770738, 0.958369, 2.628504, 1, 1, 1, 1, 1,
0.3795778, 1.59144, -0.1848592, 1, 1, 1, 1, 1,
0.3798642, -1.44173, 3.79843, 1, 1, 1, 1, 1,
0.3817706, -0.05441894, 0.8768528, 0, 0, 1, 1, 1,
0.3828106, -0.8095192, 3.440308, 1, 0, 0, 1, 1,
0.385489, -0.06088911, 0.7563287, 1, 0, 0, 1, 1,
0.3860399, -1.165494, 4.530555, 1, 0, 0, 1, 1,
0.3866779, -1.218508, 2.104716, 1, 0, 0, 1, 1,
0.3869995, 0.3271132, 2.537102, 1, 0, 0, 1, 1,
0.3909309, 1.009493, 0.9122604, 0, 0, 0, 1, 1,
0.3930342, -0.9899616, 3.945076, 0, 0, 0, 1, 1,
0.3953791, 0.4342267, 2.391231, 0, 0, 0, 1, 1,
0.4090044, 0.6561382, 2.345091, 0, 0, 0, 1, 1,
0.4105636, -1.120676, 3.356376, 0, 0, 0, 1, 1,
0.4110342, -2.242075, 3.735334, 0, 0, 0, 1, 1,
0.4138493, 1.303997, -0.6187784, 0, 0, 0, 1, 1,
0.4142377, -0.5062532, 2.602274, 1, 1, 1, 1, 1,
0.4181318, -0.5412813, 3.151212, 1, 1, 1, 1, 1,
0.4189353, -0.7299165, 0.5324327, 1, 1, 1, 1, 1,
0.424927, -0.04313498, -0.03358702, 1, 1, 1, 1, 1,
0.4286976, -1.145989, 3.055017, 1, 1, 1, 1, 1,
0.429309, -1.257443, 2.956029, 1, 1, 1, 1, 1,
0.4331326, 1.428719, 0.9444527, 1, 1, 1, 1, 1,
0.4336934, 0.2992352, 1.178961, 1, 1, 1, 1, 1,
0.4371362, 0.6298163, 1.50287, 1, 1, 1, 1, 1,
0.437247, 0.6336128, 0.3224438, 1, 1, 1, 1, 1,
0.4375544, -0.1726679, 1.189189, 1, 1, 1, 1, 1,
0.4390207, 0.8784382, -0.956504, 1, 1, 1, 1, 1,
0.4416682, 0.4808265, 2.386896, 1, 1, 1, 1, 1,
0.4501265, -0.04898576, 1.573563, 1, 1, 1, 1, 1,
0.4521883, 0.8258181, 1.130563, 1, 1, 1, 1, 1,
0.4534944, -0.2824715, 2.661503, 0, 0, 1, 1, 1,
0.4572773, -0.4566712, 3.203787, 1, 0, 0, 1, 1,
0.4578803, -0.04108978, 1.674728, 1, 0, 0, 1, 1,
0.4579998, 1.611423, 0.7209341, 1, 0, 0, 1, 1,
0.4621116, 1.133955, -0.7962687, 1, 0, 0, 1, 1,
0.4654707, 1.982979, 0.7537968, 1, 0, 0, 1, 1,
0.4699487, 0.3244045, 0.241267, 0, 0, 0, 1, 1,
0.4707975, -1.922654, 3.690543, 0, 0, 0, 1, 1,
0.4726511, -0.1716129, 1.694869, 0, 0, 0, 1, 1,
0.4738932, 0.7949302, -0.2066562, 0, 0, 0, 1, 1,
0.4741011, -1.212467, 2.050855, 0, 0, 0, 1, 1,
0.4757408, -0.8125832, 2.848562, 0, 0, 0, 1, 1,
0.4790509, 0.3627522, 1.115811, 0, 0, 0, 1, 1,
0.4830176, -1.669943, 2.383996, 1, 1, 1, 1, 1,
0.4838146, -1.173272, 3.579739, 1, 1, 1, 1, 1,
0.4847651, -0.5015449, 3.294863, 1, 1, 1, 1, 1,
0.4856853, 1.122414, -0.7979085, 1, 1, 1, 1, 1,
0.4857937, -1.200238, 2.565244, 1, 1, 1, 1, 1,
0.4861359, 1.227109, 0.6776125, 1, 1, 1, 1, 1,
0.494104, -0.6477619, 1.661868, 1, 1, 1, 1, 1,
0.4966974, 0.04567226, 2.094267, 1, 1, 1, 1, 1,
0.5005953, -0.4920553, 3.803027, 1, 1, 1, 1, 1,
0.5027815, -0.6474016, 5.130772, 1, 1, 1, 1, 1,
0.5096514, -0.5331821, 2.173478, 1, 1, 1, 1, 1,
0.5119206, 0.4551016, 1.203911, 1, 1, 1, 1, 1,
0.5134882, 0.1386923, -0.4382186, 1, 1, 1, 1, 1,
0.5152162, 1.641758, -0.1541492, 1, 1, 1, 1, 1,
0.5185745, -1.027593, 3.240833, 1, 1, 1, 1, 1,
0.5192814, -0.4593967, 1.570501, 0, 0, 1, 1, 1,
0.5252337, 0.04019926, 0.8109058, 1, 0, 0, 1, 1,
0.5280793, -1.454745, 2.446726, 1, 0, 0, 1, 1,
0.530044, -0.639339, 0.7755108, 1, 0, 0, 1, 1,
0.5394437, 1.369076, 0.452213, 1, 0, 0, 1, 1,
0.540898, 0.01535406, 0.3676069, 1, 0, 0, 1, 1,
0.5440156, 0.4003159, 0.834658, 0, 0, 0, 1, 1,
0.5457444, -0.09793596, 1.608202, 0, 0, 0, 1, 1,
0.5477114, 0.4526003, 0.3344917, 0, 0, 0, 1, 1,
0.5533621, -0.7178082, 3.226182, 0, 0, 0, 1, 1,
0.5545794, 1.915707, -0.2930362, 0, 0, 0, 1, 1,
0.5579079, 0.3919773, 0.2075969, 0, 0, 0, 1, 1,
0.5617816, 0.7113603, -1.998339, 0, 0, 0, 1, 1,
0.5675718, 1.315383, 1.256788, 1, 1, 1, 1, 1,
0.5874456, 1.057256, 0.8422455, 1, 1, 1, 1, 1,
0.5988536, -0.3119588, 2.614966, 1, 1, 1, 1, 1,
0.6007313, -0.05881229, 2.907433, 1, 1, 1, 1, 1,
0.6042714, -0.1330421, 1.204927, 1, 1, 1, 1, 1,
0.6060694, -0.7682288, 2.790098, 1, 1, 1, 1, 1,
0.6078779, 0.006754773, 3.319764, 1, 1, 1, 1, 1,
0.6095887, -0.15668, 3.337065, 1, 1, 1, 1, 1,
0.621211, 1.144365, -0.6606535, 1, 1, 1, 1, 1,
0.6258233, -1.376226, 2.32846, 1, 1, 1, 1, 1,
0.6270384, -0.2452468, 2.343667, 1, 1, 1, 1, 1,
0.6309664, -0.4801634, 2.86221, 1, 1, 1, 1, 1,
0.6393521, -0.3882324, 1.217434, 1, 1, 1, 1, 1,
0.6455482, 1.472581, 3.152928, 1, 1, 1, 1, 1,
0.6472114, -0.009539229, 2.77291, 1, 1, 1, 1, 1,
0.6559767, -0.5260212, 0.8379499, 0, 0, 1, 1, 1,
0.6567423, -1.28933, 3.177564, 1, 0, 0, 1, 1,
0.6587404, -1.076306, 1.899501, 1, 0, 0, 1, 1,
0.6589502, 1.472001, 0.1242935, 1, 0, 0, 1, 1,
0.6810387, -0.1512578, 2.319469, 1, 0, 0, 1, 1,
0.6849791, -0.5601967, 2.517356, 1, 0, 0, 1, 1,
0.6911934, 0.8555867, -1.464195, 0, 0, 0, 1, 1,
0.6954455, -1.125931, 1.777281, 0, 0, 0, 1, 1,
0.6969638, 1.503666, -0.5534814, 0, 0, 0, 1, 1,
0.7025133, 1.325011, 2.41494, 0, 0, 0, 1, 1,
0.7041613, -0.6646317, 2.856942, 0, 0, 0, 1, 1,
0.7058752, -0.06794346, 1.403173, 0, 0, 0, 1, 1,
0.7101892, -1.467237, 1.986466, 0, 0, 0, 1, 1,
0.7177124, 1.895755, -1.156844, 1, 1, 1, 1, 1,
0.7202167, -0.6122285, 3.259247, 1, 1, 1, 1, 1,
0.7210035, 0.8299006, 1.749244, 1, 1, 1, 1, 1,
0.7233742, 0.9465148, 0.6213875, 1, 1, 1, 1, 1,
0.7233853, -1.985196, 2.469504, 1, 1, 1, 1, 1,
0.727372, 1.248858, -0.6690038, 1, 1, 1, 1, 1,
0.7296641, 0.3496369, 0.6314297, 1, 1, 1, 1, 1,
0.731517, -0.09603807, 0.9860324, 1, 1, 1, 1, 1,
0.7339669, -2.630643, 1.450167, 1, 1, 1, 1, 1,
0.7396399, 0.05543991, 1.019759, 1, 1, 1, 1, 1,
0.7433331, -0.1596829, 1.397573, 1, 1, 1, 1, 1,
0.7453039, 1.031577, -0.04414862, 1, 1, 1, 1, 1,
0.7461228, 1.363657, 2.451195, 1, 1, 1, 1, 1,
0.7471431, 1.170899, -0.1475399, 1, 1, 1, 1, 1,
0.7497568, 0.2290972, 0.2080721, 1, 1, 1, 1, 1,
0.7521377, -0.4258295, 3.59823, 0, 0, 1, 1, 1,
0.7536943, 0.6143627, 2.179834, 1, 0, 0, 1, 1,
0.7586738, -0.02063076, 0.8538294, 1, 0, 0, 1, 1,
0.7680945, -0.1409212, 0.6763792, 1, 0, 0, 1, 1,
0.7712694, -0.893094, 1.675431, 1, 0, 0, 1, 1,
0.7722025, -0.7048244, 1.30295, 1, 0, 0, 1, 1,
0.7766095, -0.3788421, 2.063828, 0, 0, 0, 1, 1,
0.7866847, -0.4748073, 0.02646467, 0, 0, 0, 1, 1,
0.7902374, 0.4335377, 1.289919, 0, 0, 0, 1, 1,
0.7935809, 0.6107743, -0.200867, 0, 0, 0, 1, 1,
0.7950332, -0.704008, 1.830562, 0, 0, 0, 1, 1,
0.7972342, 1.432198, 0.9551995, 0, 0, 0, 1, 1,
0.7994696, 0.7545398, 0.8396382, 0, 0, 0, 1, 1,
0.8004887, 1.132061, -0.593897, 1, 1, 1, 1, 1,
0.8021412, -0.3111922, 1.118643, 1, 1, 1, 1, 1,
0.8073094, -2.639706, 3.719558, 1, 1, 1, 1, 1,
0.8076862, 0.462275, 1.907537, 1, 1, 1, 1, 1,
0.8137621, -1.61072, 2.795215, 1, 1, 1, 1, 1,
0.8173192, 0.3193024, 0.287609, 1, 1, 1, 1, 1,
0.8194043, 1.083206, -0.02937072, 1, 1, 1, 1, 1,
0.8257079, -1.530405, 3.666742, 1, 1, 1, 1, 1,
0.8297097, 0.1364845, 2.531977, 1, 1, 1, 1, 1,
0.8302151, 3.472397, -2.383254, 1, 1, 1, 1, 1,
0.8340747, 0.5817161, 1.492123, 1, 1, 1, 1, 1,
0.8355525, 1.596775, 1.110673, 1, 1, 1, 1, 1,
0.835728, -0.4687623, -0.8847901, 1, 1, 1, 1, 1,
0.8393745, 0.4070079, 0.8134869, 1, 1, 1, 1, 1,
0.839968, 1.101527, 1.612149, 1, 1, 1, 1, 1,
0.8471019, 0.3878112, 1.040612, 0, 0, 1, 1, 1,
0.8515292, 0.04124238, 1.833991, 1, 0, 0, 1, 1,
0.8542646, -1.328035, 2.373495, 1, 0, 0, 1, 1,
0.8568309, 0.32412, 2.905431, 1, 0, 0, 1, 1,
0.8629448, 0.7336838, 0.6175731, 1, 0, 0, 1, 1,
0.8661678, -1.295658, 1.383259, 1, 0, 0, 1, 1,
0.8676951, -1.52096, 2.485471, 0, 0, 0, 1, 1,
0.8719762, 1.796307, -0.4123697, 0, 0, 0, 1, 1,
0.8720351, -1.008784, 0.9241692, 0, 0, 0, 1, 1,
0.8791201, 1.352199, 1.763246, 0, 0, 0, 1, 1,
0.8810485, -0.4024903, 2.345964, 0, 0, 0, 1, 1,
0.8832985, -0.9379333, 1.215566, 0, 0, 0, 1, 1,
0.8893984, 0.3280711, 1.884248, 0, 0, 0, 1, 1,
0.8983842, 0.3089377, 2.149321, 1, 1, 1, 1, 1,
0.8986763, 1.233155, 0.7276973, 1, 1, 1, 1, 1,
0.8998049, -1.553641, 3.076706, 1, 1, 1, 1, 1,
0.9009928, -1.304632, 3.715567, 1, 1, 1, 1, 1,
0.9103724, -0.4621699, 1.406394, 1, 1, 1, 1, 1,
0.9111086, -0.5982888, 1.335057, 1, 1, 1, 1, 1,
0.9115041, -1.286115, 2.758221, 1, 1, 1, 1, 1,
0.9167286, 0.2566694, 1.245871, 1, 1, 1, 1, 1,
0.9192143, -0.06242399, 2.494413, 1, 1, 1, 1, 1,
0.9196725, -0.7405033, 2.222806, 1, 1, 1, 1, 1,
0.9311761, 0.3160903, 0.6420189, 1, 1, 1, 1, 1,
0.9330267, -0.4445924, 2.889574, 1, 1, 1, 1, 1,
0.9355286, 0.9333205, -0.2020066, 1, 1, 1, 1, 1,
0.9461803, -1.120037, 2.548728, 1, 1, 1, 1, 1,
0.9499012, 0.1696109, 1.181378, 1, 1, 1, 1, 1,
0.9565319, 1.909141, 1.645776, 0, 0, 1, 1, 1,
0.9877787, 0.8726242, 1.47151, 1, 0, 0, 1, 1,
0.9898593, -0.6038082, 1.937805, 1, 0, 0, 1, 1,
0.990754, 1.813712, 2.101254, 1, 0, 0, 1, 1,
0.9971846, 0.5148331, 1.112418, 1, 0, 0, 1, 1,
0.9999043, -0.3714053, 1.32972, 1, 0, 0, 1, 1,
1.013861, 0.9872913, 0.8607584, 0, 0, 0, 1, 1,
1.030661, -0.6997901, 2.119235, 0, 0, 0, 1, 1,
1.035306, 0.4076265, 1.04535, 0, 0, 0, 1, 1,
1.036872, -0.5083098, 2.532807, 0, 0, 0, 1, 1,
1.0462, -1.436749, 2.039095, 0, 0, 0, 1, 1,
1.049462, 0.1004261, 1.532981, 0, 0, 0, 1, 1,
1.053059, 0.5578862, 1.391111, 0, 0, 0, 1, 1,
1.053896, -1.602172, 4.595422, 1, 1, 1, 1, 1,
1.055415, 1.433075, 0.818568, 1, 1, 1, 1, 1,
1.055533, 1.210056, 3.358252, 1, 1, 1, 1, 1,
1.065736, 1.294829, -0.111192, 1, 1, 1, 1, 1,
1.076031, -0.5042447, 2.044409, 1, 1, 1, 1, 1,
1.080943, 1.344472, 0.3912439, 1, 1, 1, 1, 1,
1.08131, -0.3838685, 2.972005, 1, 1, 1, 1, 1,
1.092514, 0.1198864, -0.1535093, 1, 1, 1, 1, 1,
1.093373, -0.6337534, 1.376518, 1, 1, 1, 1, 1,
1.098178, -0.3361252, 1.364527, 1, 1, 1, 1, 1,
1.109314, -0.7410456, 1.647393, 1, 1, 1, 1, 1,
1.112131, 1.617861, 0.9815403, 1, 1, 1, 1, 1,
1.119727, 1.09823, 0.2332042, 1, 1, 1, 1, 1,
1.119736, -0.195169, 2.927048, 1, 1, 1, 1, 1,
1.121671, -0.3230942, 0.7482325, 1, 1, 1, 1, 1,
1.127818, -1.473991, 2.209177, 0, 0, 1, 1, 1,
1.129809, 0.1833419, 1.769583, 1, 0, 0, 1, 1,
1.136242, 0.3620259, 3.217441, 1, 0, 0, 1, 1,
1.145867, 0.4058927, 0.595817, 1, 0, 0, 1, 1,
1.149411, 1.410577, 3.39498, 1, 0, 0, 1, 1,
1.152358, 0.2646616, 1.47027, 1, 0, 0, 1, 1,
1.154803, -2.075728, 1.45052, 0, 0, 0, 1, 1,
1.155485, -1.471798, 1.041684, 0, 0, 0, 1, 1,
1.160679, -0.3793703, 0.3874359, 0, 0, 0, 1, 1,
1.161015, 1.139697, 0.9138141, 0, 0, 0, 1, 1,
1.163519, 1.3077, 0.7370386, 0, 0, 0, 1, 1,
1.1663, -0.2777183, 1.317405, 0, 0, 0, 1, 1,
1.174364, -0.1375909, 3.661967, 0, 0, 0, 1, 1,
1.179127, -1.136557, 3.067358, 1, 1, 1, 1, 1,
1.181083, 0.2001609, 2.590848, 1, 1, 1, 1, 1,
1.182962, 0.8210973, 0.293989, 1, 1, 1, 1, 1,
1.182993, -1.383248, 2.124704, 1, 1, 1, 1, 1,
1.183951, 0.3098458, 1.25708, 1, 1, 1, 1, 1,
1.184564, 0.6117898, 1.773499, 1, 1, 1, 1, 1,
1.196978, -1.697805, 2.809451, 1, 1, 1, 1, 1,
1.205333, -0.5589129, 1.459517, 1, 1, 1, 1, 1,
1.208298, -0.6721298, 0.3476666, 1, 1, 1, 1, 1,
1.214524, 0.999724, 0.9851452, 1, 1, 1, 1, 1,
1.216638, 0.8693095, 0.9854124, 1, 1, 1, 1, 1,
1.231923, 1.594457, 0.5734695, 1, 1, 1, 1, 1,
1.235457, -0.2915293, 0.317861, 1, 1, 1, 1, 1,
1.238672, 0.9148688, -0.01058069, 1, 1, 1, 1, 1,
1.240691, -0.2529261, 2.281886, 1, 1, 1, 1, 1,
1.241175, -0.9357576, 3.522327, 0, 0, 1, 1, 1,
1.252038, 1.021227, -1.097377, 1, 0, 0, 1, 1,
1.256894, 3.160238, -0.4278603, 1, 0, 0, 1, 1,
1.262355, -1.068471, 3.789434, 1, 0, 0, 1, 1,
1.265963, 2.069385, -1.013248, 1, 0, 0, 1, 1,
1.271475, -0.3985983, 0.2411726, 1, 0, 0, 1, 1,
1.314463, -1.59174, 2.94997, 0, 0, 0, 1, 1,
1.316201, -0.452481, 1.784149, 0, 0, 0, 1, 1,
1.327801, -0.1652915, 1.308397, 0, 0, 0, 1, 1,
1.331914, 1.274861, 0.5740415, 0, 0, 0, 1, 1,
1.3376, 1.340879, 1.39027, 0, 0, 0, 1, 1,
1.340546, 1.260187, 0.2105038, 0, 0, 0, 1, 1,
1.342833, -0.4565016, 2.661488, 0, 0, 0, 1, 1,
1.344887, 1.705261, -0.08818934, 1, 1, 1, 1, 1,
1.35098, -1.124521, 3.57205, 1, 1, 1, 1, 1,
1.373798, 0.1948577, 0.9153924, 1, 1, 1, 1, 1,
1.377141, 1.196325, 2.852539, 1, 1, 1, 1, 1,
1.384876, 2.810999, 1.414113, 1, 1, 1, 1, 1,
1.385003, -1.14652, 2.640355, 1, 1, 1, 1, 1,
1.38575, 0.8834152, 2.984356, 1, 1, 1, 1, 1,
1.386691, -0.06404985, 0.9682974, 1, 1, 1, 1, 1,
1.38741, -0.4380553, 1.067823, 1, 1, 1, 1, 1,
1.390885, -0.8952028, 1.597698, 1, 1, 1, 1, 1,
1.395251, 0.971844, 2.330237, 1, 1, 1, 1, 1,
1.408116, 1.366137, 1.700003, 1, 1, 1, 1, 1,
1.409359, 0.6788937, 0.1717662, 1, 1, 1, 1, 1,
1.410285, 1.213839, 3.009941, 1, 1, 1, 1, 1,
1.410586, 1.448072, 1.794822, 1, 1, 1, 1, 1,
1.418121, -0.1449408, 3.499756, 0, 0, 1, 1, 1,
1.427851, 0.9036243, -0.2048749, 1, 0, 0, 1, 1,
1.428234, 0.1126044, 0.4193199, 1, 0, 0, 1, 1,
1.441619, -0.742992, 2.333828, 1, 0, 0, 1, 1,
1.452543, 0.00456888, 1.447573, 1, 0, 0, 1, 1,
1.456845, -0.5963548, 2.657055, 1, 0, 0, 1, 1,
1.457726, -1.680832, 1.405485, 0, 0, 0, 1, 1,
1.460979, 0.3531983, 2.094986, 0, 0, 0, 1, 1,
1.46382, -0.2663167, 2.132483, 0, 0, 0, 1, 1,
1.508273, 0.4138522, -0.4087773, 0, 0, 0, 1, 1,
1.514004, 2.095621, 0.4247382, 0, 0, 0, 1, 1,
1.520987, 0.4379986, 1.316868, 0, 0, 0, 1, 1,
1.52179, 0.3973347, 1.698363, 0, 0, 0, 1, 1,
1.531585, 0.433098, -0.7181883, 1, 1, 1, 1, 1,
1.539147, 1.399965, 0.07924404, 1, 1, 1, 1, 1,
1.559236, -0.8146213, 2.905694, 1, 1, 1, 1, 1,
1.560882, -0.2543234, 2.974859, 1, 1, 1, 1, 1,
1.567858, -0.840388, 0.7011598, 1, 1, 1, 1, 1,
1.575826, -0.1202177, 1.781854, 1, 1, 1, 1, 1,
1.577486, -1.066728, 1.106727, 1, 1, 1, 1, 1,
1.579689, 0.1663787, 1.12631, 1, 1, 1, 1, 1,
1.585773, -0.4423139, 2.089964, 1, 1, 1, 1, 1,
1.602764, 0.09453091, 1.446079, 1, 1, 1, 1, 1,
1.607243, -0.05136904, 1.837988, 1, 1, 1, 1, 1,
1.633729, 1.264135, 0.9265461, 1, 1, 1, 1, 1,
1.639599, -0.8316075, 0.9362895, 1, 1, 1, 1, 1,
1.650813, -0.4831853, 1.465277, 1, 1, 1, 1, 1,
1.661832, 0.6337148, 1.205547, 1, 1, 1, 1, 1,
1.664921, 0.27028, 1.081992, 0, 0, 1, 1, 1,
1.668382, 0.6228708, 1.709133, 1, 0, 0, 1, 1,
1.691434, 0.417311, 1.199312, 1, 0, 0, 1, 1,
1.706233, 0.668129, 1.147774, 1, 0, 0, 1, 1,
1.742652, 0.6158702, 0.6430626, 1, 0, 0, 1, 1,
1.742901, -0.9965219, 2.599509, 1, 0, 0, 1, 1,
1.763926, 0.9687459, 2.549392, 0, 0, 0, 1, 1,
1.774725, -0.2858527, 1.711982, 0, 0, 0, 1, 1,
1.786455, -0.4550707, 1.043172, 0, 0, 0, 1, 1,
1.788124, 0.2578744, 0.3665103, 0, 0, 0, 1, 1,
1.794636, -0.1658144, 2.962013, 0, 0, 0, 1, 1,
1.79801, 0.2409767, 2.787219, 0, 0, 0, 1, 1,
1.798036, -0.08312771, 1.298637, 0, 0, 0, 1, 1,
1.825612, 0.1084481, 0.09448357, 1, 1, 1, 1, 1,
1.859319, 1.264609, 0.1022328, 1, 1, 1, 1, 1,
1.86105, -2.35954, 3.587569, 1, 1, 1, 1, 1,
1.869101, -0.637417, 2.254061, 1, 1, 1, 1, 1,
1.875931, -1.477282, -0.09750977, 1, 1, 1, 1, 1,
1.891395, -0.4916917, 1.015039, 1, 1, 1, 1, 1,
1.911754, 1.274909, -0.6687524, 1, 1, 1, 1, 1,
1.912663, 1.069617, -0.6209158, 1, 1, 1, 1, 1,
1.922551, -0.4768748, 1.947052, 1, 1, 1, 1, 1,
1.931788, 0.4089722, -0.1447766, 1, 1, 1, 1, 1,
1.948113, -0.6074429, 2.312366, 1, 1, 1, 1, 1,
1.955066, 0.7642169, 0.5010315, 1, 1, 1, 1, 1,
1.963435, 0.4331691, 3.44381, 1, 1, 1, 1, 1,
1.987078, -0.08772449, 1.307392, 1, 1, 1, 1, 1,
1.996039, 0.7009382, 0.4690276, 1, 1, 1, 1, 1,
2.041098, -1.119406, 1.315468, 0, 0, 1, 1, 1,
2.049445, 1.218922, 2.575778, 1, 0, 0, 1, 1,
2.053312, -1.153175, 2.653463, 1, 0, 0, 1, 1,
2.116726, 0.04907349, 0.09155577, 1, 0, 0, 1, 1,
2.128298, -1.389279, 1.194631, 1, 0, 0, 1, 1,
2.139803, -0.810663, 0.408093, 1, 0, 0, 1, 1,
2.147892, -3.434239, 1.173804, 0, 0, 0, 1, 1,
2.19232, -0.711058, 2.592966, 0, 0, 0, 1, 1,
2.270535, 0.4312276, 1.99314, 0, 0, 0, 1, 1,
2.333413, 0.903002, 1.121948, 0, 0, 0, 1, 1,
2.341156, 0.3042161, 1.304251, 0, 0, 0, 1, 1,
2.345372, 0.6885641, -0.3119337, 0, 0, 0, 1, 1,
2.371803, 0.3330918, 0.2978747, 0, 0, 0, 1, 1,
2.437278, 0.1224874, 0.6860276, 1, 1, 1, 1, 1,
2.464603, 1.906821, -0.02590606, 1, 1, 1, 1, 1,
2.550543, -0.3398844, 1.886763, 1, 1, 1, 1, 1,
2.843812, 1.291348, -0.5249427, 1, 1, 1, 1, 1,
2.988963, -1.824345, 1.69587, 1, 1, 1, 1, 1,
3.209373, -0.8091715, 1.21625, 1, 1, 1, 1, 1,
3.439035, 0.9897083, 1.09296, 1, 1, 1, 1, 1
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
var radius = 9.914896;
var distance = 34.82565;
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
mvMatrix.translate( -0.2816097, -0.01907921, 0.5120969 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.82565);
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
