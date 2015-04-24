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
-3.613387, 0.8940461, -1.95106, 1, 0, 0, 1,
-3.413084, 0.8383085, -1.782373, 1, 0.007843138, 0, 1,
-2.95081, -0.5574669, -0.7709052, 1, 0.01176471, 0, 1,
-2.866996, -0.8380568, -1.367799, 1, 0.01960784, 0, 1,
-2.721598, 1.098868, -2.275587, 1, 0.02352941, 0, 1,
-2.711619, -0.8021867, -1.939406, 1, 0.03137255, 0, 1,
-2.6041, 0.07872363, -1.091211, 1, 0.03529412, 0, 1,
-2.39326, -1.4373, -2.601559, 1, 0.04313726, 0, 1,
-2.3607, -0.1152902, -1.576148, 1, 0.04705882, 0, 1,
-2.344556, -0.8702417, -1.38886, 1, 0.05490196, 0, 1,
-2.317083, 1.383344, 0.7535337, 1, 0.05882353, 0, 1,
-2.292306, -1.557131, -0.2285852, 1, 0.06666667, 0, 1,
-2.24504, -0.6209045, -2.294273, 1, 0.07058824, 0, 1,
-2.223759, 0.2865405, -1.979255, 1, 0.07843138, 0, 1,
-2.199465, -0.978452, -2.559995, 1, 0.08235294, 0, 1,
-2.146013, 0.6326198, -2.246876, 1, 0.09019608, 0, 1,
-2.141288, -2.11364, -3.598498, 1, 0.09411765, 0, 1,
-2.130958, 0.1160044, -0.6054035, 1, 0.1019608, 0, 1,
-2.128215, -1.363042, -2.676972, 1, 0.1098039, 0, 1,
-2.110424, 0.4584412, -0.6778414, 1, 0.1137255, 0, 1,
-2.024492, -0.1938893, -1.845659, 1, 0.1215686, 0, 1,
-2.001922, 0.1455493, -0.8196939, 1, 0.1254902, 0, 1,
-1.992419, 1.785586, -0.3713323, 1, 0.1333333, 0, 1,
-1.982038, -1.126096, -0.8273763, 1, 0.1372549, 0, 1,
-1.964483, 0.5582457, -0.5342792, 1, 0.145098, 0, 1,
-1.95396, -0.4369735, -1.023996, 1, 0.1490196, 0, 1,
-1.9471, 1.394171, -1.132124, 1, 0.1568628, 0, 1,
-1.930724, -1.460185, -0.1948378, 1, 0.1607843, 0, 1,
-1.928668, -0.1477365, -0.06144913, 1, 0.1686275, 0, 1,
-1.908866, 0.5847685, -1.4248, 1, 0.172549, 0, 1,
-1.895071, 0.3235466, -1.029564, 1, 0.1803922, 0, 1,
-1.828574, 0.7577109, -0.4496063, 1, 0.1843137, 0, 1,
-1.820487, -0.7950568, -0.430981, 1, 0.1921569, 0, 1,
-1.810124, 1.196846, 0.8922439, 1, 0.1960784, 0, 1,
-1.794024, 0.3890063, -2.222983, 1, 0.2039216, 0, 1,
-1.747634, -0.3491707, -3.672751, 1, 0.2117647, 0, 1,
-1.738789, -1.08721, -3.778351, 1, 0.2156863, 0, 1,
-1.730646, -0.2403042, -2.238719, 1, 0.2235294, 0, 1,
-1.715443, -0.9504895, -2.656338, 1, 0.227451, 0, 1,
-1.70213, -0.4018474, -2.803761, 1, 0.2352941, 0, 1,
-1.675977, -0.6542852, -1.89589, 1, 0.2392157, 0, 1,
-1.662079, -0.6259856, -4.662398, 1, 0.2470588, 0, 1,
-1.661667, 0.6911303, -1.807014, 1, 0.2509804, 0, 1,
-1.640571, 0.7267109, -1.564037, 1, 0.2588235, 0, 1,
-1.629619, 0.4897777, -2.03912, 1, 0.2627451, 0, 1,
-1.620453, -1.600564, -2.855103, 1, 0.2705882, 0, 1,
-1.616874, 0.1626854, -0.8922176, 1, 0.2745098, 0, 1,
-1.605591, 1.572959, -1.606493, 1, 0.282353, 0, 1,
-1.597651, 2.443779, -0.9961343, 1, 0.2862745, 0, 1,
-1.592742, 0.1538262, -2.206754, 1, 0.2941177, 0, 1,
-1.589896, -1.867322, -4.094451, 1, 0.3019608, 0, 1,
-1.587095, -1.956125, -3.149214, 1, 0.3058824, 0, 1,
-1.571839, -1.067018, -1.000516, 1, 0.3137255, 0, 1,
-1.551057, 1.674047, -1.638537, 1, 0.3176471, 0, 1,
-1.543427, 0.8835399, -1.150525, 1, 0.3254902, 0, 1,
-1.53542, -0.255878, -2.11837, 1, 0.3294118, 0, 1,
-1.533157, -0.3120621, -1.471499, 1, 0.3372549, 0, 1,
-1.526581, 1.420988, 0.537441, 1, 0.3411765, 0, 1,
-1.525339, 0.05989682, -1.326464, 1, 0.3490196, 0, 1,
-1.518552, -0.7089371, -2.332662, 1, 0.3529412, 0, 1,
-1.508035, -1.165566, -1.609832, 1, 0.3607843, 0, 1,
-1.506018, -1.1302, -2.74387, 1, 0.3647059, 0, 1,
-1.499327, 0.5386063, -1.633471, 1, 0.372549, 0, 1,
-1.492683, 0.3986353, -0.5119079, 1, 0.3764706, 0, 1,
-1.48987, -0.5438297, -1.650131, 1, 0.3843137, 0, 1,
-1.489233, -1.549974, -2.611098, 1, 0.3882353, 0, 1,
-1.480169, -0.7826015, -1.297366, 1, 0.3960784, 0, 1,
-1.475345, -0.6632981, -1.157338, 1, 0.4039216, 0, 1,
-1.470109, -0.859894, -1.957282, 1, 0.4078431, 0, 1,
-1.4571, -0.4970774, -0.5052326, 1, 0.4156863, 0, 1,
-1.450882, -0.3379316, -0.8190179, 1, 0.4196078, 0, 1,
-1.442433, 0.9719456, -1.056063, 1, 0.427451, 0, 1,
-1.437675, -0.460118, -1.787328, 1, 0.4313726, 0, 1,
-1.437389, -0.09355586, -3.532633, 1, 0.4392157, 0, 1,
-1.432262, 0.3375207, -0.2014737, 1, 0.4431373, 0, 1,
-1.408404, -0.08142037, -0.5720073, 1, 0.4509804, 0, 1,
-1.408026, 0.07738759, -1.893024, 1, 0.454902, 0, 1,
-1.407616, -1.394863, -1.731106, 1, 0.4627451, 0, 1,
-1.407521, 1.322503, -0.6461218, 1, 0.4666667, 0, 1,
-1.399669, -0.2396942, -0.2993881, 1, 0.4745098, 0, 1,
-1.389729, 0.4862587, -3.207655, 1, 0.4784314, 0, 1,
-1.380479, -0.6981114, -1.326678, 1, 0.4862745, 0, 1,
-1.378668, 1.414345, -0.3196895, 1, 0.4901961, 0, 1,
-1.372732, 1.937965, -0.9882801, 1, 0.4980392, 0, 1,
-1.357977, -0.276042, 0.9150882, 1, 0.5058824, 0, 1,
-1.356366, -1.818826, -3.176568, 1, 0.509804, 0, 1,
-1.354523, -1.179269, -2.476356, 1, 0.5176471, 0, 1,
-1.35308, -0.009218051, -0.5211561, 1, 0.5215687, 0, 1,
-1.349977, 0.2727963, -1.901183, 1, 0.5294118, 0, 1,
-1.346625, -0.3072881, -2.558491, 1, 0.5333334, 0, 1,
-1.343788, 1.751493, 1.391571, 1, 0.5411765, 0, 1,
-1.338655, 0.6022796, -2.291278, 1, 0.5450981, 0, 1,
-1.327748, -1.376121, -2.082621, 1, 0.5529412, 0, 1,
-1.322423, -0.5870869, -2.082958, 1, 0.5568628, 0, 1,
-1.310748, -0.1762522, -2.053482, 1, 0.5647059, 0, 1,
-1.309614, 0.3895625, -1.954772, 1, 0.5686275, 0, 1,
-1.307901, -0.2716435, -2.746967, 1, 0.5764706, 0, 1,
-1.304816, -0.8929795, -2.402393, 1, 0.5803922, 0, 1,
-1.291818, -0.08871984, -0.8000681, 1, 0.5882353, 0, 1,
-1.287791, -0.1295705, -1.364641, 1, 0.5921569, 0, 1,
-1.279369, -0.939437, -1.822437, 1, 0.6, 0, 1,
-1.276405, -1.106863, -2.397252, 1, 0.6078432, 0, 1,
-1.270143, -0.7982678, -3.182191, 1, 0.6117647, 0, 1,
-1.269819, -0.980714, -3.749969, 1, 0.6196079, 0, 1,
-1.264344, 1.686092, -1.260623, 1, 0.6235294, 0, 1,
-1.262204, 0.1908031, -0.3672364, 1, 0.6313726, 0, 1,
-1.262153, 1.47789, -0.2943983, 1, 0.6352941, 0, 1,
-1.262002, -1.579505, -3.318302, 1, 0.6431373, 0, 1,
-1.261597, 0.3412205, -0.8760892, 1, 0.6470588, 0, 1,
-1.261198, -0.9235363, -1.725129, 1, 0.654902, 0, 1,
-1.259447, 1.078708, -0.9630532, 1, 0.6588235, 0, 1,
-1.257579, 2.0683, 0.8992192, 1, 0.6666667, 0, 1,
-1.256011, 0.5493817, -2.176344, 1, 0.6705883, 0, 1,
-1.241117, -0.05593568, -1.255902, 1, 0.6784314, 0, 1,
-1.233717, 0.3954396, -0.2290702, 1, 0.682353, 0, 1,
-1.223291, 0.4889979, -0.04107965, 1, 0.6901961, 0, 1,
-1.218876, 1.588204, -0.3957422, 1, 0.6941177, 0, 1,
-1.21874, 1.348809, -2.07061, 1, 0.7019608, 0, 1,
-1.212388, -0.5232794, -2.045949, 1, 0.7098039, 0, 1,
-1.201235, -0.7978587, -1.579868, 1, 0.7137255, 0, 1,
-1.196689, 0.8024427, -1.660595, 1, 0.7215686, 0, 1,
-1.189201, -2.049613, -2.978714, 1, 0.7254902, 0, 1,
-1.183076, -0.6843287, -2.64099, 1, 0.7333333, 0, 1,
-1.178296, -2.066268, -2.065905, 1, 0.7372549, 0, 1,
-1.176116, 1.21848, -1.01496, 1, 0.7450981, 0, 1,
-1.171418, -1.112157, -3.461831, 1, 0.7490196, 0, 1,
-1.159437, -0.6024792, -1.163203, 1, 0.7568628, 0, 1,
-1.156966, -0.4958637, -2.575802, 1, 0.7607843, 0, 1,
-1.141629, 0.3327785, -2.122902, 1, 0.7686275, 0, 1,
-1.138864, -0.3074632, -1.085601, 1, 0.772549, 0, 1,
-1.138776, 0.7557856, -0.09293897, 1, 0.7803922, 0, 1,
-1.12903, -1.407415, -1.247267, 1, 0.7843137, 0, 1,
-1.105824, 0.2404094, -1.843839, 1, 0.7921569, 0, 1,
-1.104892, 0.4977769, -2.635752, 1, 0.7960784, 0, 1,
-1.102544, -0.01491091, -1.57154, 1, 0.8039216, 0, 1,
-1.101548, -0.6791064, -1.576835, 1, 0.8117647, 0, 1,
-1.098173, -1.077942, -1.26622, 1, 0.8156863, 0, 1,
-1.097857, -0.3363552, -1.843361, 1, 0.8235294, 0, 1,
-1.090979, 0.9337725, -1.605601, 1, 0.827451, 0, 1,
-1.090706, -1.155079, -2.821859, 1, 0.8352941, 0, 1,
-1.089879, 0.4239465, -1.645337, 1, 0.8392157, 0, 1,
-1.089766, -0.5339098, -2.119998, 1, 0.8470588, 0, 1,
-1.0843, 0.8165756, 0.5431741, 1, 0.8509804, 0, 1,
-1.083412, 1.401487, -2.334298, 1, 0.8588235, 0, 1,
-1.078507, 0.5469714, -1.367604, 1, 0.8627451, 0, 1,
-1.073145, -0.2329872, -1.812956, 1, 0.8705882, 0, 1,
-1.072597, -3.67309, -1.609185, 1, 0.8745098, 0, 1,
-1.070947, -0.03740438, -1.132895, 1, 0.8823529, 0, 1,
-1.069384, -2.141828, -2.95879, 1, 0.8862745, 0, 1,
-1.066259, -1.954145, -2.633024, 1, 0.8941177, 0, 1,
-1.041612, -0.2672089, -2.533864, 1, 0.8980392, 0, 1,
-1.04001, -1.197087, -2.317286, 1, 0.9058824, 0, 1,
-1.034886, 1.179924, -0.4078004, 1, 0.9137255, 0, 1,
-1.034658, 1.262515, -0.83959, 1, 0.9176471, 0, 1,
-1.034441, -0.4405435, -2.803288, 1, 0.9254902, 0, 1,
-1.028217, -0.05408434, -2.763807, 1, 0.9294118, 0, 1,
-1.018657, 0.5643699, -1.309304, 1, 0.9372549, 0, 1,
-1.016781, -2.441016, -3.19955, 1, 0.9411765, 0, 1,
-1.010455, 0.8404657, -0.3342775, 1, 0.9490196, 0, 1,
-1.006212, -1.422959, -2.445341, 1, 0.9529412, 0, 1,
-1.000712, -3.150415, -2.032349, 1, 0.9607843, 0, 1,
-0.9985418, 1.712131, 1.494206, 1, 0.9647059, 0, 1,
-0.9956651, 0.254279, -0.6721337, 1, 0.972549, 0, 1,
-0.9699438, -0.9909977, -2.2185, 1, 0.9764706, 0, 1,
-0.9625114, -1.240125, -2.462812, 1, 0.9843137, 0, 1,
-0.9590577, -2.294455, -3.510847, 1, 0.9882353, 0, 1,
-0.9572796, 0.5876216, -1.381312, 1, 0.9960784, 0, 1,
-0.9569701, 0.6141079, 0.4955156, 0.9960784, 1, 0, 1,
-0.9568961, -0.4374586, -1.353266, 0.9921569, 1, 0, 1,
-0.956104, -1.204052, -3.394829, 0.9843137, 1, 0, 1,
-0.9549, -1.191979, -0.9315481, 0.9803922, 1, 0, 1,
-0.9532595, 0.08412336, -1.748238, 0.972549, 1, 0, 1,
-0.9489517, -0.1147068, -1.344596, 0.9686275, 1, 0, 1,
-0.9469818, 0.284896, -1.672066, 0.9607843, 1, 0, 1,
-0.9382079, 2.755915, -0.3662037, 0.9568627, 1, 0, 1,
-0.9370773, -1.630778, -2.550238, 0.9490196, 1, 0, 1,
-0.9359052, -0.9335896, -1.93738, 0.945098, 1, 0, 1,
-0.9293751, -1.784765, -4.504533, 0.9372549, 1, 0, 1,
-0.9290713, -1.528308, -4.55195, 0.9333333, 1, 0, 1,
-0.9287853, -1.052598, -3.537913, 0.9254902, 1, 0, 1,
-0.9283413, -0.6191034, -2.941787, 0.9215686, 1, 0, 1,
-0.9262555, 0.1767878, -2.770788, 0.9137255, 1, 0, 1,
-0.9170948, 0.2133981, -2.388954, 0.9098039, 1, 0, 1,
-0.9125363, 1.896224, -1.265242, 0.9019608, 1, 0, 1,
-0.9092593, -0.0915828, -2.725534, 0.8941177, 1, 0, 1,
-0.9092203, 0.3045482, -1.914383, 0.8901961, 1, 0, 1,
-0.9003792, -0.5879658, -3.36963, 0.8823529, 1, 0, 1,
-0.8952088, 0.7355313, -0.2980943, 0.8784314, 1, 0, 1,
-0.8815426, -0.1568431, -1.105519, 0.8705882, 1, 0, 1,
-0.8764477, -0.8625727, -2.269765, 0.8666667, 1, 0, 1,
-0.8745371, -1.107951, -3.036579, 0.8588235, 1, 0, 1,
-0.8723044, -1.548538, -2.056857, 0.854902, 1, 0, 1,
-0.8708597, -0.09221345, -1.700195, 0.8470588, 1, 0, 1,
-0.8694116, 0.2030021, -2.567905, 0.8431373, 1, 0, 1,
-0.8654147, -0.1746985, -1.118415, 0.8352941, 1, 0, 1,
-0.8651834, 0.5077826, 0.5579125, 0.8313726, 1, 0, 1,
-0.8628602, -0.4663153, -2.169832, 0.8235294, 1, 0, 1,
-0.8597959, -0.706295, -0.683131, 0.8196079, 1, 0, 1,
-0.8570499, 2.414077, -2.280397, 0.8117647, 1, 0, 1,
-0.8509672, -0.8478975, -2.044672, 0.8078431, 1, 0, 1,
-0.8477633, -0.9116753, -3.181345, 0.8, 1, 0, 1,
-0.8459123, -0.3768279, -1.804284, 0.7921569, 1, 0, 1,
-0.8457238, 0.1126101, -2.537993, 0.7882353, 1, 0, 1,
-0.8417408, 1.070263, -1.502235, 0.7803922, 1, 0, 1,
-0.8406295, -1.1816, -1.752888, 0.7764706, 1, 0, 1,
-0.8402099, -0.3111345, -0.2890458, 0.7686275, 1, 0, 1,
-0.8304357, 1.221585, -0.359663, 0.7647059, 1, 0, 1,
-0.8273, -0.1254935, -1.960616, 0.7568628, 1, 0, 1,
-0.8265556, -2.563244, -2.434123, 0.7529412, 1, 0, 1,
-0.8238682, 1.52922, -2.487866, 0.7450981, 1, 0, 1,
-0.8221216, 0.6026704, -1.241276, 0.7411765, 1, 0, 1,
-0.8185935, 0.1852415, -0.24079, 0.7333333, 1, 0, 1,
-0.8110929, 0.4356817, -0.698279, 0.7294118, 1, 0, 1,
-0.8108046, -0.4635703, -1.995489, 0.7215686, 1, 0, 1,
-0.8094123, -0.2039718, -1.735741, 0.7176471, 1, 0, 1,
-0.8018818, 1.962072, -1.56163, 0.7098039, 1, 0, 1,
-0.7947156, 0.5098129, -0.1803417, 0.7058824, 1, 0, 1,
-0.7910743, -0.3985799, -2.742665, 0.6980392, 1, 0, 1,
-0.7910681, 0.04952585, -1.214585, 0.6901961, 1, 0, 1,
-0.7898504, 0.445934, -0.2654095, 0.6862745, 1, 0, 1,
-0.7881082, -0.3535143, -3.344727, 0.6784314, 1, 0, 1,
-0.7807686, -0.2957051, -3.834659, 0.6745098, 1, 0, 1,
-0.7780148, 1.040348, -1.351167, 0.6666667, 1, 0, 1,
-0.7779222, 1.422199, -0.6814884, 0.6627451, 1, 0, 1,
-0.7621256, 1.161177, -1.481169, 0.654902, 1, 0, 1,
-0.7579765, 0.6701248, -1.57542, 0.6509804, 1, 0, 1,
-0.7562117, 0.4644804, -1.090548, 0.6431373, 1, 0, 1,
-0.7541127, -0.09843311, -1.118758, 0.6392157, 1, 0, 1,
-0.749213, -0.1201175, -1.17549, 0.6313726, 1, 0, 1,
-0.7454504, 0.2506272, -0.4563151, 0.627451, 1, 0, 1,
-0.7449996, 0.4150262, -0.008634609, 0.6196079, 1, 0, 1,
-0.7390551, 0.8182709, -2.73503, 0.6156863, 1, 0, 1,
-0.734799, -0.7381126, -1.445691, 0.6078432, 1, 0, 1,
-0.7338941, 0.7064426, -1.756859, 0.6039216, 1, 0, 1,
-0.7290887, 1.229874, -0.6794542, 0.5960785, 1, 0, 1,
-0.7217727, 0.3222716, -0.497015, 0.5882353, 1, 0, 1,
-0.7213384, -0.2777438, -1.042408, 0.5843138, 1, 0, 1,
-0.7177889, -0.3503769, -0.5674808, 0.5764706, 1, 0, 1,
-0.7109441, -0.066607, -3.005448, 0.572549, 1, 0, 1,
-0.7094259, 0.6494496, -0.4452825, 0.5647059, 1, 0, 1,
-0.7006532, 1.0346, -0.002339427, 0.5607843, 1, 0, 1,
-0.6957511, 1.021371, -0.7869035, 0.5529412, 1, 0, 1,
-0.6940975, -0.2341731, -1.305832, 0.5490196, 1, 0, 1,
-0.6917667, -0.05214646, -2.160261, 0.5411765, 1, 0, 1,
-0.6907095, 0.04001474, -1.003793, 0.5372549, 1, 0, 1,
-0.6888707, -2.603872, -2.308943, 0.5294118, 1, 0, 1,
-0.6864108, 0.0347821, -0.8622783, 0.5254902, 1, 0, 1,
-0.6846496, -1.205379, -2.668918, 0.5176471, 1, 0, 1,
-0.6831674, 1.50561, 0.2939005, 0.5137255, 1, 0, 1,
-0.6720241, 1.178438, -0.466925, 0.5058824, 1, 0, 1,
-0.6715485, -0.01245541, 0.7762771, 0.5019608, 1, 0, 1,
-0.6657867, 1.687304, 0.337292, 0.4941176, 1, 0, 1,
-0.6567106, -0.8751302, -1.970712, 0.4862745, 1, 0, 1,
-0.6551695, -0.2832898, -0.600279, 0.4823529, 1, 0, 1,
-0.6529669, -0.8805872, -1.790674, 0.4745098, 1, 0, 1,
-0.6527817, -0.77352, -1.601633, 0.4705882, 1, 0, 1,
-0.637881, -0.1770997, -0.9881485, 0.4627451, 1, 0, 1,
-0.6373767, -0.9450697, -2.090834, 0.4588235, 1, 0, 1,
-0.6366264, -1.121677, -4.03932, 0.4509804, 1, 0, 1,
-0.6361235, 1.291425, 0.3669649, 0.4470588, 1, 0, 1,
-0.6356588, 2.004116, 0.6142028, 0.4392157, 1, 0, 1,
-0.6284842, -0.4782504, -3.269096, 0.4352941, 1, 0, 1,
-0.6260997, 0.2585818, -2.433253, 0.427451, 1, 0, 1,
-0.6260424, 0.9602405, -1.302052, 0.4235294, 1, 0, 1,
-0.6237659, -0.5973947, -3.391523, 0.4156863, 1, 0, 1,
-0.620441, -1.175526, -2.1178, 0.4117647, 1, 0, 1,
-0.6190605, 0.9324182, 0.5666215, 0.4039216, 1, 0, 1,
-0.6190521, -1.949177, -4.315772, 0.3960784, 1, 0, 1,
-0.6186723, 0.2966789, -1.990072, 0.3921569, 1, 0, 1,
-0.6165643, -0.4191657, -0.8088337, 0.3843137, 1, 0, 1,
-0.6145388, 0.937409, -1.093602, 0.3803922, 1, 0, 1,
-0.6121601, -0.2108798, -0.1057449, 0.372549, 1, 0, 1,
-0.6120567, 1.241089, 0.424228, 0.3686275, 1, 0, 1,
-0.609675, -0.3856788, -2.20606, 0.3607843, 1, 0, 1,
-0.6022041, -0.01950432, -3.526843, 0.3568628, 1, 0, 1,
-0.5975392, 0.07815307, -2.065064, 0.3490196, 1, 0, 1,
-0.5973634, 0.1811308, -1.866912, 0.345098, 1, 0, 1,
-0.5915307, 1.14823, -0.7743722, 0.3372549, 1, 0, 1,
-0.5880584, -0.525852, -2.41742, 0.3333333, 1, 0, 1,
-0.5878871, 0.6314226, -1.294141, 0.3254902, 1, 0, 1,
-0.5859619, -0.5806857, -3.162292, 0.3215686, 1, 0, 1,
-0.5857369, 1.658005, 0.8149637, 0.3137255, 1, 0, 1,
-0.5834166, -0.4411046, -2.111373, 0.3098039, 1, 0, 1,
-0.5803839, -0.9302949, -1.09197, 0.3019608, 1, 0, 1,
-0.5743209, 1.68539, -0.4723922, 0.2941177, 1, 0, 1,
-0.5739463, -0.8537623, -1.469506, 0.2901961, 1, 0, 1,
-0.573751, -0.08183677, -1.269019, 0.282353, 1, 0, 1,
-0.5700389, -0.2151656, 0.6815499, 0.2784314, 1, 0, 1,
-0.5691788, 0.537452, -1.266317, 0.2705882, 1, 0, 1,
-0.5669078, 0.4457005, 0.02071371, 0.2666667, 1, 0, 1,
-0.5619065, 0.2474657, -1.565827, 0.2588235, 1, 0, 1,
-0.5510164, 0.4964657, -0.2135951, 0.254902, 1, 0, 1,
-0.5491253, -0.5960289, -2.623149, 0.2470588, 1, 0, 1,
-0.5490583, 0.2874845, -0.7973534, 0.2431373, 1, 0, 1,
-0.5479334, -1.203786, -2.045992, 0.2352941, 1, 0, 1,
-0.5464489, -0.4805032, -3.063946, 0.2313726, 1, 0, 1,
-0.5334362, -1.8742, -1.275515, 0.2235294, 1, 0, 1,
-0.5332046, -0.7894674, -3.26276, 0.2196078, 1, 0, 1,
-0.5288529, -2.211204, -3.745214, 0.2117647, 1, 0, 1,
-0.5271316, 1.303702, -0.2153548, 0.2078431, 1, 0, 1,
-0.5270768, -0.7671721, -3.002285, 0.2, 1, 0, 1,
-0.5221319, -1.155691, -5.73193, 0.1921569, 1, 0, 1,
-0.5208033, 0.8063308, -1.127319, 0.1882353, 1, 0, 1,
-0.5203242, 1.135252, -0.2188078, 0.1803922, 1, 0, 1,
-0.5197636, 0.4868878, -1.438306, 0.1764706, 1, 0, 1,
-0.5182112, 0.4301991, -0.8988166, 0.1686275, 1, 0, 1,
-0.5181385, -0.333412, 0.2211057, 0.1647059, 1, 0, 1,
-0.5166742, 1.053627, -0.4969893, 0.1568628, 1, 0, 1,
-0.5049387, -1.067253, -2.8031, 0.1529412, 1, 0, 1,
-0.5046333, 0.1755851, 0.05956612, 0.145098, 1, 0, 1,
-0.5041342, -0.8658188, -2.679411, 0.1411765, 1, 0, 1,
-0.4955267, -0.08610373, -3.384778, 0.1333333, 1, 0, 1,
-0.4943779, -1.370763, -4.70099, 0.1294118, 1, 0, 1,
-0.4925218, -0.4796423, -1.782669, 0.1215686, 1, 0, 1,
-0.4898954, -0.2972254, -2.113609, 0.1176471, 1, 0, 1,
-0.4889615, -0.9913868, -0.6804901, 0.1098039, 1, 0, 1,
-0.4861046, -0.9420612, -1.528748, 0.1058824, 1, 0, 1,
-0.4805619, -0.2210775, -4.04434, 0.09803922, 1, 0, 1,
-0.4796665, -1.513953, -3.775092, 0.09019608, 1, 0, 1,
-0.4790708, 0.3213567, -1.333017, 0.08627451, 1, 0, 1,
-0.4773487, 1.211729, -1.02647, 0.07843138, 1, 0, 1,
-0.4715745, 0.8625072, 0.106708, 0.07450981, 1, 0, 1,
-0.4712979, 1.102424, -0.2265081, 0.06666667, 1, 0, 1,
-0.4704084, -0.2037309, -2.173091, 0.0627451, 1, 0, 1,
-0.4688756, -1.231043, -2.552976, 0.05490196, 1, 0, 1,
-0.4687984, 1.349567, -0.794255, 0.05098039, 1, 0, 1,
-0.4602146, 0.9610534, -0.9045297, 0.04313726, 1, 0, 1,
-0.459284, -1.070858, -3.886775, 0.03921569, 1, 0, 1,
-0.4587569, -0.03382594, -0.9687516, 0.03137255, 1, 0, 1,
-0.4573317, 0.01808789, -1.953438, 0.02745098, 1, 0, 1,
-0.4527182, -1.072987, -1.9812, 0.01960784, 1, 0, 1,
-0.4514436, -1.816333, -4.024795, 0.01568628, 1, 0, 1,
-0.4504732, -1.373344, -2.164946, 0.007843138, 1, 0, 1,
-0.4410934, -1.116889, -4.097212, 0.003921569, 1, 0, 1,
-0.4353047, 1.18516, 0.3239052, 0, 1, 0.003921569, 1,
-0.4323408, -0.4107375, -1.538849, 0, 1, 0.01176471, 1,
-0.4323203, 0.7168556, -0.03333568, 0, 1, 0.01568628, 1,
-0.4314503, -0.473751, -2.552529, 0, 1, 0.02352941, 1,
-0.4298592, 0.9406469, 0.2746694, 0, 1, 0.02745098, 1,
-0.426158, -0.4335292, -2.492495, 0, 1, 0.03529412, 1,
-0.4260721, -0.3227089, -2.2559, 0, 1, 0.03921569, 1,
-0.4210801, -0.460781, -0.6510867, 0, 1, 0.04705882, 1,
-0.4145152, -1.137397, -2.073846, 0, 1, 0.05098039, 1,
-0.4084509, 0.2132682, -0.7549854, 0, 1, 0.05882353, 1,
-0.4053616, 0.6856159, 0.7322965, 0, 1, 0.0627451, 1,
-0.4050905, 1.773392, -1.40392, 0, 1, 0.07058824, 1,
-0.401961, 0.1611526, -0.7692849, 0, 1, 0.07450981, 1,
-0.4019344, -0.2271662, -2.137979, 0, 1, 0.08235294, 1,
-0.3964209, 0.06347356, -2.818814, 0, 1, 0.08627451, 1,
-0.3941846, -0.5555162, -2.177906, 0, 1, 0.09411765, 1,
-0.3920495, -1.488627, -0.9793558, 0, 1, 0.1019608, 1,
-0.3908412, -0.5381248, -2.737606, 0, 1, 0.1058824, 1,
-0.3855362, 0.6391346, 0.4696787, 0, 1, 0.1137255, 1,
-0.3850489, 1.492088, -0.2503422, 0, 1, 0.1176471, 1,
-0.3833948, 1.018132, -0.6859199, 0, 1, 0.1254902, 1,
-0.3780374, 0.7152891, -0.2563144, 0, 1, 0.1294118, 1,
-0.3746229, 1.147326, -2.754012, 0, 1, 0.1372549, 1,
-0.3743477, 0.6678216, -1.456076, 0, 1, 0.1411765, 1,
-0.3713638, -0.1073212, -4.060204, 0, 1, 0.1490196, 1,
-0.370281, -0.5997617, -1.55119, 0, 1, 0.1529412, 1,
-0.3702468, 1.116479, -0.4708723, 0, 1, 0.1607843, 1,
-0.3636226, -1.252847, -3.080558, 0, 1, 0.1647059, 1,
-0.3624851, -0.5148533, -3.254895, 0, 1, 0.172549, 1,
-0.3574601, 0.3108999, 0.7448116, 0, 1, 0.1764706, 1,
-0.3573356, 0.8689064, 0.05085243, 0, 1, 0.1843137, 1,
-0.3518844, 1.00874, -0.7330504, 0, 1, 0.1882353, 1,
-0.3511189, 0.8707426, -1.133329, 0, 1, 0.1960784, 1,
-0.3493151, -0.9118539, -3.613635, 0, 1, 0.2039216, 1,
-0.3488226, -1.096025, -2.443697, 0, 1, 0.2078431, 1,
-0.3412147, -0.9050857, -2.021137, 0, 1, 0.2156863, 1,
-0.3378776, 0.5917823, -0.3940826, 0, 1, 0.2196078, 1,
-0.3377038, 0.3963553, 0.9627007, 0, 1, 0.227451, 1,
-0.3338484, -0.1074372, -0.7028083, 0, 1, 0.2313726, 1,
-0.3278776, -0.6178102, -2.476447, 0, 1, 0.2392157, 1,
-0.3261929, -0.9149417, -2.374435, 0, 1, 0.2431373, 1,
-0.3216479, -0.1070315, -1.140777, 0, 1, 0.2509804, 1,
-0.3215207, 1.722202, -0.8766094, 0, 1, 0.254902, 1,
-0.3194427, -0.3924935, -2.584923, 0, 1, 0.2627451, 1,
-0.3151295, 1.066673, -0.9907327, 0, 1, 0.2666667, 1,
-0.3127468, -1.401857, -4.150071, 0, 1, 0.2745098, 1,
-0.3107433, 0.4170038, -0.0869863, 0, 1, 0.2784314, 1,
-0.3098404, -0.9066879, -1.603254, 0, 1, 0.2862745, 1,
-0.3074876, -0.4650762, -3.513637, 0, 1, 0.2901961, 1,
-0.3061439, 0.3489372, -0.837199, 0, 1, 0.2980392, 1,
-0.3043449, -0.2858202, -4.028965, 0, 1, 0.3058824, 1,
-0.3021321, -0.6276624, -1.202713, 0, 1, 0.3098039, 1,
-0.2979621, 0.9315017, -2.426524, 0, 1, 0.3176471, 1,
-0.29791, -0.1357642, -2.010638, 0, 1, 0.3215686, 1,
-0.2969598, 1.449432, -0.8815218, 0, 1, 0.3294118, 1,
-0.2953442, 1.564919, -0.8883017, 0, 1, 0.3333333, 1,
-0.2894656, 1.02762, -2.339144, 0, 1, 0.3411765, 1,
-0.2855015, 1.376663, 0.5334914, 0, 1, 0.345098, 1,
-0.2846, 0.2020098, -0.9348783, 0, 1, 0.3529412, 1,
-0.2831143, 0.6148251, -3.46529, 0, 1, 0.3568628, 1,
-0.2822074, 1.406262, 2.19463, 0, 1, 0.3647059, 1,
-0.2819555, -0.7652002, -2.060363, 0, 1, 0.3686275, 1,
-0.2788377, -1.173512, -2.676404, 0, 1, 0.3764706, 1,
-0.2759593, -0.3196679, -0.9083115, 0, 1, 0.3803922, 1,
-0.275279, -0.9544994, -2.956649, 0, 1, 0.3882353, 1,
-0.2743558, 0.3157063, -0.4339426, 0, 1, 0.3921569, 1,
-0.2736909, -0.09274871, -1.171143, 0, 1, 0.4, 1,
-0.2722265, -2.020974, -3.1429, 0, 1, 0.4078431, 1,
-0.2713994, 0.1278872, 0.4583978, 0, 1, 0.4117647, 1,
-0.2700043, 1.298287, 0.02986616, 0, 1, 0.4196078, 1,
-0.2674314, -0.1944651, -3.545227, 0, 1, 0.4235294, 1,
-0.2659355, -0.6912787, -2.929583, 0, 1, 0.4313726, 1,
-0.2651766, -1.338838, -3.147571, 0, 1, 0.4352941, 1,
-0.2645785, 1.743085, -0.9917566, 0, 1, 0.4431373, 1,
-0.2641601, 0.1990089, -2.484888, 0, 1, 0.4470588, 1,
-0.2640767, 1.187077, 0.2956697, 0, 1, 0.454902, 1,
-0.2631379, -0.3711339, -4.516302, 0, 1, 0.4588235, 1,
-0.2604507, -1.368545, -1.951348, 0, 1, 0.4666667, 1,
-0.258999, 0.2805015, -1.410104, 0, 1, 0.4705882, 1,
-0.2534748, -0.7026471, -1.829853, 0, 1, 0.4784314, 1,
-0.2515036, 2.199171, 1.222852, 0, 1, 0.4823529, 1,
-0.2493359, 1.314182, -0.7201471, 0, 1, 0.4901961, 1,
-0.2493309, 0.1004277, -0.08931289, 0, 1, 0.4941176, 1,
-0.2463494, -0.178603, -2.296352, 0, 1, 0.5019608, 1,
-0.2457866, -0.9666075, -3.234473, 0, 1, 0.509804, 1,
-0.2385297, -0.7492321, -3.291251, 0, 1, 0.5137255, 1,
-0.234894, -0.6922333, -3.330056, 0, 1, 0.5215687, 1,
-0.2347062, -1.507877, -1.464807, 0, 1, 0.5254902, 1,
-0.2344527, 0.6884735, -0.316311, 0, 1, 0.5333334, 1,
-0.2325139, -1.039773, -3.708722, 0, 1, 0.5372549, 1,
-0.2318142, -2.15055, -3.099665, 0, 1, 0.5450981, 1,
-0.2267833, -0.8968093, -2.84972, 0, 1, 0.5490196, 1,
-0.2250421, 0.8161809, 0.7312536, 0, 1, 0.5568628, 1,
-0.221448, -0.1995508, -2.552642, 0, 1, 0.5607843, 1,
-0.2173079, -1.197115, -4.196161, 0, 1, 0.5686275, 1,
-0.2136868, 0.07597364, -1.425863, 0, 1, 0.572549, 1,
-0.2124201, 0.3136441, -0.975405, 0, 1, 0.5803922, 1,
-0.2072545, 0.08291362, -0.03138704, 0, 1, 0.5843138, 1,
-0.206718, 0.9292197, -1.128556, 0, 1, 0.5921569, 1,
-0.2048033, 2.042107, 1.978765, 0, 1, 0.5960785, 1,
-0.2045393, -0.3020416, -2.686255, 0, 1, 0.6039216, 1,
-0.1976187, 0.8563571, -1.641634, 0, 1, 0.6117647, 1,
-0.1951971, 0.670262, 0.1480536, 0, 1, 0.6156863, 1,
-0.1938316, -1.304872, -3.161514, 0, 1, 0.6235294, 1,
-0.1899194, 0.690908, -0.1726739, 0, 1, 0.627451, 1,
-0.1895054, 1.114064, -1.074693, 0, 1, 0.6352941, 1,
-0.1857285, -0.7258129, -4.079465, 0, 1, 0.6392157, 1,
-0.1852621, 0.7181353, 0.2525684, 0, 1, 0.6470588, 1,
-0.1851163, 0.1268964, -0.00589601, 0, 1, 0.6509804, 1,
-0.1826101, 0.9180016, 0.1180939, 0, 1, 0.6588235, 1,
-0.1797619, 0.01649664, -0.9537184, 0, 1, 0.6627451, 1,
-0.1774145, -1.686298, -3.954373, 0, 1, 0.6705883, 1,
-0.1733666, -0.8146471, -4.115307, 0, 1, 0.6745098, 1,
-0.1692767, -0.5377502, -4.802841, 0, 1, 0.682353, 1,
-0.1679397, 0.06133994, -1.641818, 0, 1, 0.6862745, 1,
-0.166412, 0.8437608, 1.013858, 0, 1, 0.6941177, 1,
-0.1657868, -0.8414467, -3.78704, 0, 1, 0.7019608, 1,
-0.16257, 0.2926632, -0.2389029, 0, 1, 0.7058824, 1,
-0.1625603, 1.088565, 0.3408116, 0, 1, 0.7137255, 1,
-0.1558007, 0.8425415, -0.4357375, 0, 1, 0.7176471, 1,
-0.1544038, 0.3590944, -0.7280472, 0, 1, 0.7254902, 1,
-0.1494819, -0.1175127, 1.075385, 0, 1, 0.7294118, 1,
-0.1410901, 0.6749696, 0.7137299, 0, 1, 0.7372549, 1,
-0.1356242, -0.6796425, -1.621451, 0, 1, 0.7411765, 1,
-0.1351805, -2.115789, -2.203213, 0, 1, 0.7490196, 1,
-0.1336727, -0.4001878, -2.105996, 0, 1, 0.7529412, 1,
-0.1291519, -0.9278947, -2.638611, 0, 1, 0.7607843, 1,
-0.1266715, 0.5848809, -2.631195, 0, 1, 0.7647059, 1,
-0.1215091, -1.865206, -2.335273, 0, 1, 0.772549, 1,
-0.1211152, -0.5352131, -2.532039, 0, 1, 0.7764706, 1,
-0.1163881, -0.2313363, -1.956127, 0, 1, 0.7843137, 1,
-0.1082212, -0.3970656, -3.030244, 0, 1, 0.7882353, 1,
-0.1068957, 0.6789335, 0.08485219, 0, 1, 0.7960784, 1,
-0.1001962, 0.4682246, -0.1293713, 0, 1, 0.8039216, 1,
-0.09833909, -1.734226, -1.996478, 0, 1, 0.8078431, 1,
-0.09403346, 0.04047513, -1.890252, 0, 1, 0.8156863, 1,
-0.09087226, 0.04300532, -0.9723223, 0, 1, 0.8196079, 1,
-0.08930874, -0.5287852, -5.68319, 0, 1, 0.827451, 1,
-0.0804107, 0.2503502, 2.366784, 0, 1, 0.8313726, 1,
-0.07713564, 1.31215, 0.9027705, 0, 1, 0.8392157, 1,
-0.07092801, -0.844003, -2.435264, 0, 1, 0.8431373, 1,
-0.06989156, -1.438564, -3.35756, 0, 1, 0.8509804, 1,
-0.06802937, -2.121957, -1.278283, 0, 1, 0.854902, 1,
-0.06738497, -0.4440896, -1.788465, 0, 1, 0.8627451, 1,
-0.06494062, -0.7501014, -3.241922, 0, 1, 0.8666667, 1,
-0.06476321, 0.6611732, -0.7602446, 0, 1, 0.8745098, 1,
-0.06460957, -0.6684763, -2.021521, 0, 1, 0.8784314, 1,
-0.06311223, 1.738234, -0.7985314, 0, 1, 0.8862745, 1,
-0.06101114, 0.1027977, -1.306721, 0, 1, 0.8901961, 1,
-0.05839572, 0.7871506, 0.3068847, 0, 1, 0.8980392, 1,
-0.05811681, 0.8311653, 1.296756, 0, 1, 0.9058824, 1,
-0.0566013, 0.3189161, 0.366588, 0, 1, 0.9098039, 1,
-0.05575396, 0.760547, 1.648562, 0, 1, 0.9176471, 1,
-0.05361278, 0.1066166, -0.1664756, 0, 1, 0.9215686, 1,
-0.05038614, 1.215923, 0.6371214, 0, 1, 0.9294118, 1,
-0.0483507, -0.6416555, -4.160464, 0, 1, 0.9333333, 1,
-0.04507179, 1.957733, 0.7810959, 0, 1, 0.9411765, 1,
-0.04384617, 0.09100521, 0.3080006, 0, 1, 0.945098, 1,
-0.04146704, -0.5721595, -2.65706, 0, 1, 0.9529412, 1,
-0.03814581, 1.222513, 1.498529, 0, 1, 0.9568627, 1,
-0.03794688, -0.5897454, -4.048278, 0, 1, 0.9647059, 1,
-0.03749472, -0.4542556, -2.564092, 0, 1, 0.9686275, 1,
-0.03338044, 0.105406, -1.450256, 0, 1, 0.9764706, 1,
-0.03000808, 0.2373815, -1.665204, 0, 1, 0.9803922, 1,
-0.02957441, 1.299188, 0.5555794, 0, 1, 0.9882353, 1,
-0.02836463, 0.3555172, 0.2061487, 0, 1, 0.9921569, 1,
-0.02704188, -1.166364, -3.869341, 0, 1, 1, 1,
-0.02508795, -0.9811695, -3.760882, 0, 0.9921569, 1, 1,
-0.02189844, -0.6097668, -2.60905, 0, 0.9882353, 1, 1,
-0.02033446, 0.1522357, 0.2162739, 0, 0.9803922, 1, 1,
-0.01389263, 1.521373, -0.4459485, 0, 0.9764706, 1, 1,
-0.01170113, 0.5506468, 1.530506, 0, 0.9686275, 1, 1,
-0.01103588, -0.6646119, -4.266144, 0, 0.9647059, 1, 1,
-0.005826047, -1.313341, -2.323326, 0, 0.9568627, 1, 1,
-0.00314542, -0.9397489, -3.323583, 0, 0.9529412, 1, 1,
0.004939542, -0.2215677, 4.088177, 0, 0.945098, 1, 1,
0.006443381, 0.8058712, -0.893433, 0, 0.9411765, 1, 1,
0.01135885, -1.863637, 3.67563, 0, 0.9333333, 1, 1,
0.01390459, -0.1754891, 3.672501, 0, 0.9294118, 1, 1,
0.0157188, 0.6631619, -0.4874848, 0, 0.9215686, 1, 1,
0.01901749, 0.4638945, 0.5216504, 0, 0.9176471, 1, 1,
0.01961626, -1.907003, 4.113376, 0, 0.9098039, 1, 1,
0.03388399, 1.435173, -0.2825736, 0, 0.9058824, 1, 1,
0.0339419, -1.289225, 2.539379, 0, 0.8980392, 1, 1,
0.03546265, -1.811871, 3.283239, 0, 0.8901961, 1, 1,
0.03591159, -1.642951, 2.980164, 0, 0.8862745, 1, 1,
0.03597368, -0.357538, 2.632247, 0, 0.8784314, 1, 1,
0.03966668, -1.256602, 3.475875, 0, 0.8745098, 1, 1,
0.03989004, -0.02627532, 0.821877, 0, 0.8666667, 1, 1,
0.04047612, -1.133987, 3.851618, 0, 0.8627451, 1, 1,
0.04263268, -0.7628449, 3.251183, 0, 0.854902, 1, 1,
0.04622183, 0.3060992, 1.602504, 0, 0.8509804, 1, 1,
0.04663438, 0.4322798, -0.3872328, 0, 0.8431373, 1, 1,
0.04851037, 0.0120266, 0.2988717, 0, 0.8392157, 1, 1,
0.05246114, -0.7955893, 4.069654, 0, 0.8313726, 1, 1,
0.05739458, 0.04190454, -0.2954953, 0, 0.827451, 1, 1,
0.0580451, 1.424515, 0.01226881, 0, 0.8196079, 1, 1,
0.05964725, -1.388635, 1.707949, 0, 0.8156863, 1, 1,
0.06191498, -1.642178, 4.319796, 0, 0.8078431, 1, 1,
0.06825282, 0.1166458, 0.8052914, 0, 0.8039216, 1, 1,
0.07050439, 0.1656866, 0.4331939, 0, 0.7960784, 1, 1,
0.07333207, 1.056317, -0.2905057, 0, 0.7882353, 1, 1,
0.07797515, -0.3944111, 2.525251, 0, 0.7843137, 1, 1,
0.08045377, -1.636876, 3.052356, 0, 0.7764706, 1, 1,
0.08382046, -0.9630338, 4.814733, 0, 0.772549, 1, 1,
0.08848187, 1.093516, 1.043238, 0, 0.7647059, 1, 1,
0.09376303, 0.6753466, 0.3088857, 0, 0.7607843, 1, 1,
0.09553211, 0.6603984, -0.322047, 0, 0.7529412, 1, 1,
0.1028239, 0.3100632, -0.597963, 0, 0.7490196, 1, 1,
0.1043701, 2.039833, 0.01138894, 0, 0.7411765, 1, 1,
0.1102444, 1.751805, -0.2161072, 0, 0.7372549, 1, 1,
0.1144926, -1.286131, 2.552783, 0, 0.7294118, 1, 1,
0.1146879, -1.23717, 3.71769, 0, 0.7254902, 1, 1,
0.1173507, -0.6252515, 4.09107, 0, 0.7176471, 1, 1,
0.1180277, 0.145359, 2.260798, 0, 0.7137255, 1, 1,
0.1197482, 2.249452, 1.183067, 0, 0.7058824, 1, 1,
0.1221623, 1.063526, -0.2286735, 0, 0.6980392, 1, 1,
0.1377173, -0.01507072, 0.3183775, 0, 0.6941177, 1, 1,
0.1382802, 0.05995084, 2.312378, 0, 0.6862745, 1, 1,
0.1405156, 0.4392038, -0.8033655, 0, 0.682353, 1, 1,
0.1409904, 1.119286, -0.9539028, 0, 0.6745098, 1, 1,
0.1441471, 0.1244313, 0.140797, 0, 0.6705883, 1, 1,
0.1496773, 0.3850335, 0.4443661, 0, 0.6627451, 1, 1,
0.1520351, -1.885447, 3.300022, 0, 0.6588235, 1, 1,
0.1535282, 2.023853, -1.169041, 0, 0.6509804, 1, 1,
0.1557417, 2.074646, 1.64204, 0, 0.6470588, 1, 1,
0.1587041, -0.5759143, 2.995595, 0, 0.6392157, 1, 1,
0.1619186, 1.075162, 0.6529439, 0, 0.6352941, 1, 1,
0.1619596, -0.03837795, 2.708035, 0, 0.627451, 1, 1,
0.1620593, -0.837036, 2.135824, 0, 0.6235294, 1, 1,
0.1671464, 0.9255541, -1.491041, 0, 0.6156863, 1, 1,
0.1674499, 0.0006433947, 1.393118, 0, 0.6117647, 1, 1,
0.1702773, -1.470459, 2.931675, 0, 0.6039216, 1, 1,
0.1713721, -1.011726, 3.403949, 0, 0.5960785, 1, 1,
0.1729465, 0.687327, 0.9756426, 0, 0.5921569, 1, 1,
0.178854, -0.3222166, 1.457082, 0, 0.5843138, 1, 1,
0.1803358, 1.290543, -0.5128502, 0, 0.5803922, 1, 1,
0.1824838, -0.7198473, 2.165744, 0, 0.572549, 1, 1,
0.1891531, -0.8876535, 3.128615, 0, 0.5686275, 1, 1,
0.1903311, 1.169173, -0.3207623, 0, 0.5607843, 1, 1,
0.1909752, -0.5113828, 2.526071, 0, 0.5568628, 1, 1,
0.1919007, -0.5621669, 2.893823, 0, 0.5490196, 1, 1,
0.1931664, -1.372679, 3.992186, 0, 0.5450981, 1, 1,
0.1982256, -0.8877064, 1.376017, 0, 0.5372549, 1, 1,
0.1991765, 0.2253983, 0.7534789, 0, 0.5333334, 1, 1,
0.2002012, -0.5976047, 4.380029, 0, 0.5254902, 1, 1,
0.2024284, 0.1508375, 1.591027, 0, 0.5215687, 1, 1,
0.2032811, 1.874961, -1.17969, 0, 0.5137255, 1, 1,
0.2038949, -0.8856218, 3.051887, 0, 0.509804, 1, 1,
0.2040432, 1.682918, -0.9621266, 0, 0.5019608, 1, 1,
0.2152304, 0.7674815, 0.1766935, 0, 0.4941176, 1, 1,
0.219572, -0.1913847, 2.085593, 0, 0.4901961, 1, 1,
0.2214447, 0.4001039, -0.03111995, 0, 0.4823529, 1, 1,
0.2223465, 1.679546, -0.3383911, 0, 0.4784314, 1, 1,
0.2245041, 0.6823878, 0.1184954, 0, 0.4705882, 1, 1,
0.2261065, -0.07395153, 1.632294, 0, 0.4666667, 1, 1,
0.2268424, 0.8503429, 0.4820207, 0, 0.4588235, 1, 1,
0.2275735, 0.5294797, -1.32352, 0, 0.454902, 1, 1,
0.2280409, -0.4699813, 3.925912, 0, 0.4470588, 1, 1,
0.2307142, -0.2040664, 1.325571, 0, 0.4431373, 1, 1,
0.231264, -0.9401848, 1.755671, 0, 0.4352941, 1, 1,
0.2347777, 0.09284563, 1.056222, 0, 0.4313726, 1, 1,
0.2488733, -0.370989, 1.442851, 0, 0.4235294, 1, 1,
0.2551687, -2.504121, 2.915607, 0, 0.4196078, 1, 1,
0.2558411, 0.2806569, 2.119286, 0, 0.4117647, 1, 1,
0.2603391, 0.01480207, 2.988882, 0, 0.4078431, 1, 1,
0.2621403, 1.376129, 0.834226, 0, 0.4, 1, 1,
0.2638321, -2.342608, 3.746504, 0, 0.3921569, 1, 1,
0.2659177, -0.3957699, 1.855858, 0, 0.3882353, 1, 1,
0.272001, -0.7752942, 1.963786, 0, 0.3803922, 1, 1,
0.2737957, -1.693645, 2.095535, 0, 0.3764706, 1, 1,
0.2827807, 0.2360402, 0.3555877, 0, 0.3686275, 1, 1,
0.2902158, 0.6376561, 0.2871518, 0, 0.3647059, 1, 1,
0.2935304, 1.606814, 3.122514, 0, 0.3568628, 1, 1,
0.2935671, -1.435878, 3.910237, 0, 0.3529412, 1, 1,
0.2967143, 0.8573194, -0.611744, 0, 0.345098, 1, 1,
0.2979208, -0.4061092, 0.2261124, 0, 0.3411765, 1, 1,
0.2999093, 1.886477, 1.941733, 0, 0.3333333, 1, 1,
0.300813, 1.623886, 0.9586766, 0, 0.3294118, 1, 1,
0.3060227, -0.3767164, 3.88545, 0, 0.3215686, 1, 1,
0.3064387, 0.1044961, -0.457595, 0, 0.3176471, 1, 1,
0.3087241, 1.371874, -0.6326948, 0, 0.3098039, 1, 1,
0.3103226, 2.112508, 1.944072, 0, 0.3058824, 1, 1,
0.3109798, -0.3052936, 1.680758, 0, 0.2980392, 1, 1,
0.3118791, -0.6233292, 3.114311, 0, 0.2901961, 1, 1,
0.31204, -0.4906138, 2.921927, 0, 0.2862745, 1, 1,
0.315493, 0.2255572, 1.219815, 0, 0.2784314, 1, 1,
0.3159786, 1.866435, 1.293783, 0, 0.2745098, 1, 1,
0.3202667, 0.7189115, 0.6063643, 0, 0.2666667, 1, 1,
0.3239048, 0.8154476, 2.077745, 0, 0.2627451, 1, 1,
0.3270959, -0.4091526, 3.154587, 0, 0.254902, 1, 1,
0.3282714, 1.642511, 0.07912612, 0, 0.2509804, 1, 1,
0.3306597, 1.134154, -0.246329, 0, 0.2431373, 1, 1,
0.3389659, -1.491548, 1.145752, 0, 0.2392157, 1, 1,
0.3454015, -1.813569, 0.3831307, 0, 0.2313726, 1, 1,
0.3459562, -0.2399305, 3.072513, 0, 0.227451, 1, 1,
0.3474302, 1.092548, -0.3254993, 0, 0.2196078, 1, 1,
0.3482269, -0.7459629, 1.470888, 0, 0.2156863, 1, 1,
0.3486889, -0.2038762, 1.636354, 0, 0.2078431, 1, 1,
0.3506662, -0.5054427, 1.203563, 0, 0.2039216, 1, 1,
0.3524201, -0.311434, 3.391791, 0, 0.1960784, 1, 1,
0.3543388, -1.561823, 2.833298, 0, 0.1882353, 1, 1,
0.3587606, -0.4859987, 2.600084, 0, 0.1843137, 1, 1,
0.3598911, -1.519686, 2.028814, 0, 0.1764706, 1, 1,
0.3621376, 1.134354, -1.467954, 0, 0.172549, 1, 1,
0.3650837, 0.114647, 2.427291, 0, 0.1647059, 1, 1,
0.3666637, 0.5591982, 0.8981882, 0, 0.1607843, 1, 1,
0.3703266, 0.08974002, 1.602104, 0, 0.1529412, 1, 1,
0.3742082, -0.2645715, 2.347837, 0, 0.1490196, 1, 1,
0.3770669, 0.3859136, 1.363164, 0, 0.1411765, 1, 1,
0.3777629, 0.339521, 1.105021, 0, 0.1372549, 1, 1,
0.3835514, 0.422576, 0.469875, 0, 0.1294118, 1, 1,
0.3867086, -1.473748, 2.139354, 0, 0.1254902, 1, 1,
0.3900145, 0.7883457, 2.156487, 0, 0.1176471, 1, 1,
0.390355, 0.371594, 1.717168, 0, 0.1137255, 1, 1,
0.3921942, -1.299482, 2.84824, 0, 0.1058824, 1, 1,
0.3925351, -0.423579, 0.4250108, 0, 0.09803922, 1, 1,
0.3927084, 0.3443904, -0.09957182, 0, 0.09411765, 1, 1,
0.3967499, -0.8678223, 4.693826, 0, 0.08627451, 1, 1,
0.3967556, 0.5895424, 0.401698, 0, 0.08235294, 1, 1,
0.4060337, -0.9517515, 2.961987, 0, 0.07450981, 1, 1,
0.415053, -0.4646513, 2.909585, 0, 0.07058824, 1, 1,
0.4165667, -0.4027394, 1.438788, 0, 0.0627451, 1, 1,
0.4192214, 0.3745512, -0.6250908, 0, 0.05882353, 1, 1,
0.4224435, -0.4014637, 3.871726, 0, 0.05098039, 1, 1,
0.4226212, -0.8965234, 3.319693, 0, 0.04705882, 1, 1,
0.4316829, -0.7403035, 3.151109, 0, 0.03921569, 1, 1,
0.4332477, -0.2378864, 1.547266, 0, 0.03529412, 1, 1,
0.4337358, -0.9230102, 3.469283, 0, 0.02745098, 1, 1,
0.4423417, -1.747486, 2.22724, 0, 0.02352941, 1, 1,
0.4469612, -1.042333, 3.644097, 0, 0.01568628, 1, 1,
0.4470779, 0.6046155, 1.031487, 0, 0.01176471, 1, 1,
0.4517701, 1.636261, -1.160362, 0, 0.003921569, 1, 1,
0.4520392, -0.3777573, 2.787818, 0.003921569, 0, 1, 1,
0.4523326, 0.0657731, 1.934179, 0.007843138, 0, 1, 1,
0.453965, 0.08754376, -0.9169224, 0.01568628, 0, 1, 1,
0.4556311, -0.04457881, 1.199971, 0.01960784, 0, 1, 1,
0.4568996, -1.195979, 4.882209, 0.02745098, 0, 1, 1,
0.4575393, 0.6335407, -0.3012052, 0.03137255, 0, 1, 1,
0.4584594, 0.1387377, -0.1731507, 0.03921569, 0, 1, 1,
0.4599741, 0.1461194, 0.6085207, 0.04313726, 0, 1, 1,
0.4601398, 1.442539, 1.182562, 0.05098039, 0, 1, 1,
0.463717, 1.385417, 1.743276, 0.05490196, 0, 1, 1,
0.4655347, -0.4979706, 0.7410187, 0.0627451, 0, 1, 1,
0.4659453, -0.8907119, 3.258242, 0.06666667, 0, 1, 1,
0.4666999, -0.2135084, 0.7073332, 0.07450981, 0, 1, 1,
0.4667569, -0.9364724, 1.80012, 0.07843138, 0, 1, 1,
0.4826543, 0.253364, 1.568384, 0.08627451, 0, 1, 1,
0.4901366, 1.565978, -0.03582169, 0.09019608, 0, 1, 1,
0.4909333, 1.487584, 0.3435461, 0.09803922, 0, 1, 1,
0.493834, -0.6026052, 1.957527, 0.1058824, 0, 1, 1,
0.4961251, -0.6852714, 2.010151, 0.1098039, 0, 1, 1,
0.4992077, 0.1121193, 1.822656, 0.1176471, 0, 1, 1,
0.4997837, -1.556119, 4.121074, 0.1215686, 0, 1, 1,
0.5020834, 1.295356, 0.1923908, 0.1294118, 0, 1, 1,
0.5023778, -1.092555, 3.665124, 0.1333333, 0, 1, 1,
0.5035466, 0.1386158, 2.390212, 0.1411765, 0, 1, 1,
0.5069395, 1.690199, -1.948464, 0.145098, 0, 1, 1,
0.5078197, 0.6745948, 0.2389829, 0.1529412, 0, 1, 1,
0.5086628, -0.9733865, 1.128066, 0.1568628, 0, 1, 1,
0.5087113, 1.183241, 0.007606424, 0.1647059, 0, 1, 1,
0.5202225, 0.1542698, 2.816271, 0.1686275, 0, 1, 1,
0.5248715, 1.226957, 0.2224108, 0.1764706, 0, 1, 1,
0.5287184, -0.3925185, 3.884267, 0.1803922, 0, 1, 1,
0.5288658, 0.5680531, -0.221792, 0.1882353, 0, 1, 1,
0.5305095, -0.184398, 0.9646959, 0.1921569, 0, 1, 1,
0.5341789, 1.924793, -1.485653, 0.2, 0, 1, 1,
0.5354, 0.7402306, 0.8299176, 0.2078431, 0, 1, 1,
0.5387473, 0.4001953, -0.001228986, 0.2117647, 0, 1, 1,
0.5492234, 1.666572, 1.11912, 0.2196078, 0, 1, 1,
0.5560387, 0.8792342, -0.3310132, 0.2235294, 0, 1, 1,
0.5566358, 0.03195176, 1.331311, 0.2313726, 0, 1, 1,
0.557174, -0.9081512, 3.73572, 0.2352941, 0, 1, 1,
0.5575661, 1.359867, 1.284526, 0.2431373, 0, 1, 1,
0.5595002, 0.4026555, 1.057903, 0.2470588, 0, 1, 1,
0.5605741, -0.03797893, 2.642384, 0.254902, 0, 1, 1,
0.5620272, 0.9689043, 0.6711255, 0.2588235, 0, 1, 1,
0.5627697, -0.901193, 3.416339, 0.2666667, 0, 1, 1,
0.5645798, -0.4711086, 2.45065, 0.2705882, 0, 1, 1,
0.5669679, -0.1718029, 2.265086, 0.2784314, 0, 1, 1,
0.5696164, -1.221566, 2.940183, 0.282353, 0, 1, 1,
0.5717459, -0.5132821, 3.212495, 0.2901961, 0, 1, 1,
0.5846127, -0.1770061, 1.177996, 0.2941177, 0, 1, 1,
0.586056, -0.7953916, 1.391418, 0.3019608, 0, 1, 1,
0.5914901, 0.2877635, 1.124545, 0.3098039, 0, 1, 1,
0.5935406, 0.7463979, 0.2708606, 0.3137255, 0, 1, 1,
0.5936533, 1.282578, 1.982144, 0.3215686, 0, 1, 1,
0.5997522, 0.7442198, -0.03871034, 0.3254902, 0, 1, 1,
0.5998901, -1.192896, 3.354265, 0.3333333, 0, 1, 1,
0.6008237, -0.4980782, 3.826378, 0.3372549, 0, 1, 1,
0.6099606, -0.1523083, 3.563385, 0.345098, 0, 1, 1,
0.6131822, -2.159897, 0.7554353, 0.3490196, 0, 1, 1,
0.6136832, -1.367143, 1.736588, 0.3568628, 0, 1, 1,
0.6140937, -0.73164, 2.532557, 0.3607843, 0, 1, 1,
0.6173458, 0.5271914, -0.1478718, 0.3686275, 0, 1, 1,
0.6195559, -1.266967, 2.640911, 0.372549, 0, 1, 1,
0.6210818, -0.02371607, 2.692205, 0.3803922, 0, 1, 1,
0.6229015, 0.1757081, -0.09373578, 0.3843137, 0, 1, 1,
0.6276289, 0.437259, -0.2492725, 0.3921569, 0, 1, 1,
0.6386136, -0.5667405, 3.367148, 0.3960784, 0, 1, 1,
0.6403053, 0.4630492, 2.270436, 0.4039216, 0, 1, 1,
0.6425076, 0.7533146, 2.727588, 0.4117647, 0, 1, 1,
0.6432635, -0.8862578, 3.34132, 0.4156863, 0, 1, 1,
0.6455481, -1.039454, 1.46263, 0.4235294, 0, 1, 1,
0.6506472, 0.1899548, 0.9219257, 0.427451, 0, 1, 1,
0.6636775, -0.5292888, 2.465941, 0.4352941, 0, 1, 1,
0.6661744, 0.1705767, 1.369164, 0.4392157, 0, 1, 1,
0.6688177, -2.090109, 3.971948, 0.4470588, 0, 1, 1,
0.6709644, -0.4986203, 2.504611, 0.4509804, 0, 1, 1,
0.6728788, -1.848186, 2.809824, 0.4588235, 0, 1, 1,
0.6762772, -0.5079309, 2.103127, 0.4627451, 0, 1, 1,
0.676412, 0.769138, 1.881515, 0.4705882, 0, 1, 1,
0.6769423, -0.1861189, 2.364894, 0.4745098, 0, 1, 1,
0.6783802, -1.981592, 2.99544, 0.4823529, 0, 1, 1,
0.6797155, -0.3275036, 0.1208307, 0.4862745, 0, 1, 1,
0.6818383, 0.01518056, 1.353506, 0.4941176, 0, 1, 1,
0.6842386, 0.5539852, 0.7052267, 0.5019608, 0, 1, 1,
0.6843016, 0.3303168, 0.3994735, 0.5058824, 0, 1, 1,
0.6855071, 0.6852984, 0.5439757, 0.5137255, 0, 1, 1,
0.6912848, 0.1609911, 2.662664, 0.5176471, 0, 1, 1,
0.6941074, 1.89403, -1.111092, 0.5254902, 0, 1, 1,
0.6958737, -0.1486675, 2.558658, 0.5294118, 0, 1, 1,
0.7077146, 0.005587757, 2.346926, 0.5372549, 0, 1, 1,
0.7082918, -1.641272, 3.394908, 0.5411765, 0, 1, 1,
0.7121506, -0.752084, 4.493322, 0.5490196, 0, 1, 1,
0.7130088, -0.1793253, 3.512615, 0.5529412, 0, 1, 1,
0.7179882, 1.67458, 0.2740121, 0.5607843, 0, 1, 1,
0.7210464, -0.7244473, 1.969966, 0.5647059, 0, 1, 1,
0.7249405, -0.2397707, 1.544814, 0.572549, 0, 1, 1,
0.7260547, 0.8732341, 0.3950709, 0.5764706, 0, 1, 1,
0.7279434, -0.922047, 2.854447, 0.5843138, 0, 1, 1,
0.7325534, -0.5018073, 2.29253, 0.5882353, 0, 1, 1,
0.7368014, -0.5382164, 2.201194, 0.5960785, 0, 1, 1,
0.7463135, 0.4270039, 0.01940848, 0.6039216, 0, 1, 1,
0.7544253, -0.4343932, 3.059379, 0.6078432, 0, 1, 1,
0.7577499, -1.75023, 2.149892, 0.6156863, 0, 1, 1,
0.7583345, 1.636375, 1.063558, 0.6196079, 0, 1, 1,
0.7624823, 1.533479, 0.8683072, 0.627451, 0, 1, 1,
0.7704928, -0.7382859, 3.941599, 0.6313726, 0, 1, 1,
0.7739851, 0.5152244, 1.340246, 0.6392157, 0, 1, 1,
0.7801858, 0.8656389, 1.644169, 0.6431373, 0, 1, 1,
0.7839528, -1.785409, 2.186648, 0.6509804, 0, 1, 1,
0.7870815, 0.5631972, -0.3821029, 0.654902, 0, 1, 1,
0.793821, -0.6665842, 0.884837, 0.6627451, 0, 1, 1,
0.7955953, -0.7951666, 2.317586, 0.6666667, 0, 1, 1,
0.7969691, 0.5916233, 0.3618575, 0.6745098, 0, 1, 1,
0.7993813, -1.505768, 2.975387, 0.6784314, 0, 1, 1,
0.8004134, -0.08675274, 2.870039, 0.6862745, 0, 1, 1,
0.8018956, -1.599395, 1.952758, 0.6901961, 0, 1, 1,
0.804134, 1.453324, 0.1683219, 0.6980392, 0, 1, 1,
0.8066623, 1.334961, 1.071949, 0.7058824, 0, 1, 1,
0.8085594, -1.063654, 2.133957, 0.7098039, 0, 1, 1,
0.8105715, 0.5166919, -1.452857, 0.7176471, 0, 1, 1,
0.8149903, -0.9593642, 3.02234, 0.7215686, 0, 1, 1,
0.8159997, -0.259789, 1.879375, 0.7294118, 0, 1, 1,
0.8199221, -1.185581, 2.067843, 0.7333333, 0, 1, 1,
0.8290039, -0.2040569, 3.331192, 0.7411765, 0, 1, 1,
0.829486, -0.9291541, 2.846714, 0.7450981, 0, 1, 1,
0.8335953, -0.2879709, 1.526274, 0.7529412, 0, 1, 1,
0.8370517, 0.3849188, 2.496674, 0.7568628, 0, 1, 1,
0.8375468, 0.7072847, -0.301376, 0.7647059, 0, 1, 1,
0.8383954, -0.3222338, 2.703056, 0.7686275, 0, 1, 1,
0.8395066, -0.5148647, 3.890595, 0.7764706, 0, 1, 1,
0.8400244, 0.6521361, 1.749242, 0.7803922, 0, 1, 1,
0.8404933, 1.551204, 0.3564076, 0.7882353, 0, 1, 1,
0.8433179, 0.3728125, 0.377012, 0.7921569, 0, 1, 1,
0.8436371, 0.7176957, 1.911654, 0.8, 0, 1, 1,
0.8503579, 0.9203976, 0.9469514, 0.8078431, 0, 1, 1,
0.8548965, -0.9834976, 1.482507, 0.8117647, 0, 1, 1,
0.8549964, 2.900003, 1.577545, 0.8196079, 0, 1, 1,
0.8568615, 0.5862036, 0.2438409, 0.8235294, 0, 1, 1,
0.8617914, -0.5192348, 0.832886, 0.8313726, 0, 1, 1,
0.8631091, -0.02896901, 2.51601, 0.8352941, 0, 1, 1,
0.8643816, 0.3755336, 1.440451, 0.8431373, 0, 1, 1,
0.8696656, 0.5354962, -0.04491944, 0.8470588, 0, 1, 1,
0.8734102, -0.2841885, 1.966774, 0.854902, 0, 1, 1,
0.8779806, 0.2061537, 1.195398, 0.8588235, 0, 1, 1,
0.8798928, 0.9468091, -0.637171, 0.8666667, 0, 1, 1,
0.8803518, 0.2195032, 2.073935, 0.8705882, 0, 1, 1,
0.8807327, -1.361462, 1.746014, 0.8784314, 0, 1, 1,
0.8809084, 1.010073, 0.6715252, 0.8823529, 0, 1, 1,
0.8820975, 1.394971, 1.201398, 0.8901961, 0, 1, 1,
0.9003063, -0.1612401, 1.813148, 0.8941177, 0, 1, 1,
0.9088824, 0.1386044, 2.357757, 0.9019608, 0, 1, 1,
0.9103528, -0.2090428, 1.115039, 0.9098039, 0, 1, 1,
0.9151305, -1.90969, 1.945212, 0.9137255, 0, 1, 1,
0.9234601, 0.0791669, 3.157256, 0.9215686, 0, 1, 1,
0.929413, -0.8079043, 3.195984, 0.9254902, 0, 1, 1,
0.9332395, -0.2240613, 0.9034653, 0.9333333, 0, 1, 1,
0.9340406, 0.7596142, -1.513021, 0.9372549, 0, 1, 1,
0.9370637, 0.3236471, 2.288422, 0.945098, 0, 1, 1,
0.9406228, -0.6431601, 0.5497732, 0.9490196, 0, 1, 1,
0.9487774, 1.525326, 0.83528, 0.9568627, 0, 1, 1,
0.9570443, 1.459566, -0.1277801, 0.9607843, 0, 1, 1,
0.9576843, 0.564929, 2.140218, 0.9686275, 0, 1, 1,
0.9583967, -1.060395, 2.189803, 0.972549, 0, 1, 1,
0.9680228, 0.2526835, -1.003936, 0.9803922, 0, 1, 1,
0.9707487, -0.739216, 2.018986, 0.9843137, 0, 1, 1,
0.97147, -1.342322, 2.477163, 0.9921569, 0, 1, 1,
0.9722507, 0.7385622, 0.6113999, 0.9960784, 0, 1, 1,
0.9739617, -0.2862574, 0.8080072, 1, 0, 0.9960784, 1,
0.9750912, 0.8131208, 0.6814476, 1, 0, 0.9882353, 1,
0.9756778, -1.481522, 2.510194, 1, 0, 0.9843137, 1,
0.9816621, -0.2231726, 1.225674, 1, 0, 0.9764706, 1,
0.9819563, 0.5001696, 1.368626, 1, 0, 0.972549, 1,
0.9883672, -0.2041517, 0.3019264, 1, 0, 0.9647059, 1,
0.9895131, -0.1354133, 3.283858, 1, 0, 0.9607843, 1,
0.9923136, 1.185491, 1.017686, 1, 0, 0.9529412, 1,
1.008359, -2.590965, 4.209973, 1, 0, 0.9490196, 1,
1.014561, 1.724377, -1.366196, 1, 0, 0.9411765, 1,
1.015045, 0.04014495, 0.806039, 1, 0, 0.9372549, 1,
1.018968, -0.3740059, 0.5008188, 1, 0, 0.9294118, 1,
1.02062, 0.5700411, 0.7234144, 1, 0, 0.9254902, 1,
1.024139, -0.1801456, 1.955543, 1, 0, 0.9176471, 1,
1.030473, -0.5559979, 1.979606, 1, 0, 0.9137255, 1,
1.030571, -1.01027, 3.173767, 1, 0, 0.9058824, 1,
1.031754, 0.9129921, 2.04865, 1, 0, 0.9019608, 1,
1.033915, 0.6287134, 2.072547, 1, 0, 0.8941177, 1,
1.039284, -0.5059006, 0.2412719, 1, 0, 0.8862745, 1,
1.04359, 1.423898, 1.780485, 1, 0, 0.8823529, 1,
1.045039, 0.1938454, 0.1655969, 1, 0, 0.8745098, 1,
1.045047, -1.520639, 3.501837, 1, 0, 0.8705882, 1,
1.048362, -0.6641834, 2.465782, 1, 0, 0.8627451, 1,
1.052506, -1.208167, 1.771441, 1, 0, 0.8588235, 1,
1.066629, 0.4991671, 0.01625136, 1, 0, 0.8509804, 1,
1.068558, 0.5559383, 0.4087212, 1, 0, 0.8470588, 1,
1.071833, -1.413892, 2.260884, 1, 0, 0.8392157, 1,
1.075902, -0.6359271, 3.470395, 1, 0, 0.8352941, 1,
1.076692, -0.3695847, 1.623526, 1, 0, 0.827451, 1,
1.08312, -0.7955981, 2.63952, 1, 0, 0.8235294, 1,
1.085267, -0.612983, 1.295961, 1, 0, 0.8156863, 1,
1.086978, -0.6585087, 2.04785, 1, 0, 0.8117647, 1,
1.089195, -0.5154694, 3.805444, 1, 0, 0.8039216, 1,
1.095592, 1.273791, 2.622594, 1, 0, 0.7960784, 1,
1.099184, 0.5514359, 1.599225, 1, 0, 0.7921569, 1,
1.099481, -0.1122402, -0.4618509, 1, 0, 0.7843137, 1,
1.101161, -1.323997, 3.0472, 1, 0, 0.7803922, 1,
1.106099, 1.783849, 1.067332, 1, 0, 0.772549, 1,
1.107859, 0.8562822, 1.702478, 1, 0, 0.7686275, 1,
1.110719, -0.7298543, 1.691878, 1, 0, 0.7607843, 1,
1.110924, -0.1399501, 2.149048, 1, 0, 0.7568628, 1,
1.111847, -0.1548257, 3.097027, 1, 0, 0.7490196, 1,
1.115602, -1.210395, 3.067104, 1, 0, 0.7450981, 1,
1.129202, 0.8523505, 0.3027585, 1, 0, 0.7372549, 1,
1.153325, -1.004036, 2.997037, 1, 0, 0.7333333, 1,
1.158953, 1.904606, 2.232075, 1, 0, 0.7254902, 1,
1.159959, 1.662703, 0.7540089, 1, 0, 0.7215686, 1,
1.160027, 1.671291, 0.2634643, 1, 0, 0.7137255, 1,
1.161535, -0.08080529, 2.335257, 1, 0, 0.7098039, 1,
1.162025, -3.04355, 3.027864, 1, 0, 0.7019608, 1,
1.165533, 0.9534971, 0.5141061, 1, 0, 0.6941177, 1,
1.168482, 0.06384572, 1.120806, 1, 0, 0.6901961, 1,
1.172268, -1.138457, 2.441396, 1, 0, 0.682353, 1,
1.179376, 0.3011979, 1.016768, 1, 0, 0.6784314, 1,
1.180142, -1.516795, 2.145284, 1, 0, 0.6705883, 1,
1.181141, -0.5363003, 3.769282, 1, 0, 0.6666667, 1,
1.182035, 0.8158648, 0.8067551, 1, 0, 0.6588235, 1,
1.187572, -0.2046954, 2.311472, 1, 0, 0.654902, 1,
1.188046, -0.9363111, 0.2567897, 1, 0, 0.6470588, 1,
1.199952, 0.8256403, -1.093687, 1, 0, 0.6431373, 1,
1.203503, -0.02933286, 0.7919096, 1, 0, 0.6352941, 1,
1.217213, -0.6920004, 2.650415, 1, 0, 0.6313726, 1,
1.217709, -1.738822, 1.884446, 1, 0, 0.6235294, 1,
1.222704, -0.8538488, 3.262958, 1, 0, 0.6196079, 1,
1.259146, 1.288523, 1.170851, 1, 0, 0.6117647, 1,
1.262015, 1.025817, 1.311796, 1, 0, 0.6078432, 1,
1.267418, 0.8027978, 1.117691, 1, 0, 0.6, 1,
1.267905, -0.01959164, 1.814768, 1, 0, 0.5921569, 1,
1.272586, -0.2510413, 2.95741, 1, 0, 0.5882353, 1,
1.279457, 0.3112655, 0.1051161, 1, 0, 0.5803922, 1,
1.296445, 1.698168, 0.1427022, 1, 0, 0.5764706, 1,
1.302009, -0.8923027, 2.708598, 1, 0, 0.5686275, 1,
1.306915, 0.2359162, 1.509195, 1, 0, 0.5647059, 1,
1.310044, -1.583907, 2.27604, 1, 0, 0.5568628, 1,
1.313483, 0.5037511, 2.821956, 1, 0, 0.5529412, 1,
1.317064, 1.451036, -0.5897342, 1, 0, 0.5450981, 1,
1.325338, 0.4156358, 1.712351, 1, 0, 0.5411765, 1,
1.326593, 1.555794, -0.1018861, 1, 0, 0.5333334, 1,
1.32686, -0.5582448, 1.585396, 1, 0, 0.5294118, 1,
1.33624, 1.179184, 1.078413, 1, 0, 0.5215687, 1,
1.342037, -0.7127339, 2.47888, 1, 0, 0.5176471, 1,
1.35084, 0.1002838, 3.206667, 1, 0, 0.509804, 1,
1.359192, -2.001143, 1.50649, 1, 0, 0.5058824, 1,
1.361051, 0.1226926, 2.004433, 1, 0, 0.4980392, 1,
1.367829, -0.004462434, -0.5180509, 1, 0, 0.4901961, 1,
1.37666, -0.9359608, 0.4749324, 1, 0, 0.4862745, 1,
1.386681, -0.2288117, 3.40567, 1, 0, 0.4784314, 1,
1.393686, -1.399518, 2.105568, 1, 0, 0.4745098, 1,
1.405001, -0.7884773, 1.887337, 1, 0, 0.4666667, 1,
1.420572, -1.30771, 1.18021, 1, 0, 0.4627451, 1,
1.440305, -0.3113942, 1.799614, 1, 0, 0.454902, 1,
1.443431, 0.1662677, 0.6489899, 1, 0, 0.4509804, 1,
1.454442, -0.1019488, 2.558904, 1, 0, 0.4431373, 1,
1.470637, -0.2987702, 1.99885, 1, 0, 0.4392157, 1,
1.512969, 1.555614, 0.9682662, 1, 0, 0.4313726, 1,
1.52113, -1.88948, 2.443706, 1, 0, 0.427451, 1,
1.526149, -1.048828, 3.484356, 1, 0, 0.4196078, 1,
1.530371, 1.065167, 0.02751389, 1, 0, 0.4156863, 1,
1.553014, -1.476018, 2.380597, 1, 0, 0.4078431, 1,
1.56462, 0.7761729, 1.341279, 1, 0, 0.4039216, 1,
1.565163, -1.361544, 1.554817, 1, 0, 0.3960784, 1,
1.57228, -0.01792115, 2.300309, 1, 0, 0.3882353, 1,
1.577784, 0.6544074, 2.026371, 1, 0, 0.3843137, 1,
1.591918, -0.8256009, 3.243139, 1, 0, 0.3764706, 1,
1.614333, -0.4437374, 1.277099, 1, 0, 0.372549, 1,
1.615499, 0.09766999, 0.007268605, 1, 0, 0.3647059, 1,
1.622829, -0.2559397, 2.29358, 1, 0, 0.3607843, 1,
1.623905, 0.6114123, 0.9288182, 1, 0, 0.3529412, 1,
1.628182, 0.5466442, 0.3399753, 1, 0, 0.3490196, 1,
1.637512, 0.8390087, 1.154493, 1, 0, 0.3411765, 1,
1.646325, 0.2042348, 1.545559, 1, 0, 0.3372549, 1,
1.655464, 0.2673596, 0.6873805, 1, 0, 0.3294118, 1,
1.685193, 0.8248329, 0.2759652, 1, 0, 0.3254902, 1,
1.693368, 1.376065, 0.3525856, 1, 0, 0.3176471, 1,
1.700882, -1.324866, 2.849021, 1, 0, 0.3137255, 1,
1.709595, -0.05227754, 2.200113, 1, 0, 0.3058824, 1,
1.72199, -0.5582457, 0.6709443, 1, 0, 0.2980392, 1,
1.72585, 0.1046527, 0.7169269, 1, 0, 0.2941177, 1,
1.761726, 1.838987, 0.7674171, 1, 0, 0.2862745, 1,
1.772313, 1.874565, 0.7940663, 1, 0, 0.282353, 1,
1.778126, -0.02329234, 2.644246, 1, 0, 0.2745098, 1,
1.778612, -0.0970155, 0.8882081, 1, 0, 0.2705882, 1,
1.779583, -1.427376, 1.724303, 1, 0, 0.2627451, 1,
1.792946, -0.2265357, 1.985338, 1, 0, 0.2588235, 1,
1.801127, -0.05966383, 1.679328, 1, 0, 0.2509804, 1,
1.815824, -1.098216, 1.813042, 1, 0, 0.2470588, 1,
1.816584, 0.5110288, 1.534125, 1, 0, 0.2392157, 1,
1.830853, 0.1167467, 0.6439286, 1, 0, 0.2352941, 1,
1.840474, -0.0969833, 1.171112, 1, 0, 0.227451, 1,
1.845002, 0.4472601, 3.425552, 1, 0, 0.2235294, 1,
1.867972, 0.5146114, 2.191758, 1, 0, 0.2156863, 1,
1.871639, 1.354545, -0.006163993, 1, 0, 0.2117647, 1,
1.879894, 0.7906184, 1.329615, 1, 0, 0.2039216, 1,
1.898736, -0.01929852, 1.265914, 1, 0, 0.1960784, 1,
1.920496, -1.673676, 2.841334, 1, 0, 0.1921569, 1,
1.951226, 0.1075542, 1.185161, 1, 0, 0.1843137, 1,
1.952001, 0.3116324, 1.263671, 1, 0, 0.1803922, 1,
2.003078, 1.21161, 1.713587, 1, 0, 0.172549, 1,
2.026376, 0.07182597, 1.879847, 1, 0, 0.1686275, 1,
2.045777, 1.85682, 2.894611, 1, 0, 0.1607843, 1,
2.066185, 1.213234, -0.2626266, 1, 0, 0.1568628, 1,
2.092686, -0.6967066, 3.040451, 1, 0, 0.1490196, 1,
2.135786, -0.2460715, 0.9652813, 1, 0, 0.145098, 1,
2.146019, -0.2702672, 3.118959, 1, 0, 0.1372549, 1,
2.151349, 0.7960435, 0.8912496, 1, 0, 0.1333333, 1,
2.175934, -0.421749, 1.742719, 1, 0, 0.1254902, 1,
2.184237, 0.3130992, 1.940732, 1, 0, 0.1215686, 1,
2.198405, -0.497272, 1.564701, 1, 0, 0.1137255, 1,
2.203582, -0.1453118, 1.24463, 1, 0, 0.1098039, 1,
2.208758, 0.1954162, 2.217822, 1, 0, 0.1019608, 1,
2.251856, -0.5173942, 2.130476, 1, 0, 0.09411765, 1,
2.286611, 0.6393667, 0.7645773, 1, 0, 0.09019608, 1,
2.302618, 1.191061, 2.069572, 1, 0, 0.08235294, 1,
2.312228, -1.343222, 1.115358, 1, 0, 0.07843138, 1,
2.336053, 0.06202593, -0.6514027, 1, 0, 0.07058824, 1,
2.452909, -0.4641604, 1.050313, 1, 0, 0.06666667, 1,
2.469476, -0.09067615, 2.626914, 1, 0, 0.05882353, 1,
2.469751, 1.677529, 1.314656, 1, 0, 0.05490196, 1,
2.501317, 1.607765, 1.327507, 1, 0, 0.04705882, 1,
2.559582, 0.5344878, 0.5121478, 1, 0, 0.04313726, 1,
2.587346, 0.5615779, 3.105459, 1, 0, 0.03529412, 1,
2.615345, 0.1673543, 3.437276, 1, 0, 0.03137255, 1,
2.698138, 1.591519, 0.8743221, 1, 0, 0.02352941, 1,
2.747108, 0.2915711, 2.067147, 1, 0, 0.01960784, 1,
2.866248, -0.5827075, 3.416979, 1, 0, 0.01176471, 1,
3.083203, -0.3960247, 0.6265777, 1, 0, 0.007843138, 1
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
-0.265092, -4.78723, -7.531027, 0, -0.5, 0.5, 0.5,
-0.265092, -4.78723, -7.531027, 1, -0.5, 0.5, 0.5,
-0.265092, -4.78723, -7.531027, 1, 1.5, 0.5, 0.5,
-0.265092, -4.78723, -7.531027, 0, 1.5, 0.5, 0.5
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
-4.748459, -0.3865439, -7.531027, 0, -0.5, 0.5, 0.5,
-4.748459, -0.3865439, -7.531027, 1, -0.5, 0.5, 0.5,
-4.748459, -0.3865439, -7.531027, 1, 1.5, 0.5, 0.5,
-4.748459, -0.3865439, -7.531027, 0, 1.5, 0.5, 0.5
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
-4.748459, -4.78723, -0.4248605, 0, -0.5, 0.5, 0.5,
-4.748459, -4.78723, -0.4248605, 1, -0.5, 0.5, 0.5,
-4.748459, -4.78723, -0.4248605, 1, 1.5, 0.5, 0.5,
-4.748459, -4.78723, -0.4248605, 0, 1.5, 0.5, 0.5
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
-3, -3.771687, -5.891142,
3, -3.771687, -5.891142,
-3, -3.771687, -5.891142,
-3, -3.940944, -6.164456,
-2, -3.771687, -5.891142,
-2, -3.940944, -6.164456,
-1, -3.771687, -5.891142,
-1, -3.940944, -6.164456,
0, -3.771687, -5.891142,
0, -3.940944, -6.164456,
1, -3.771687, -5.891142,
1, -3.940944, -6.164456,
2, -3.771687, -5.891142,
2, -3.940944, -6.164456,
3, -3.771687, -5.891142,
3, -3.940944, -6.164456
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
-3, -4.279459, -6.711085, 0, -0.5, 0.5, 0.5,
-3, -4.279459, -6.711085, 1, -0.5, 0.5, 0.5,
-3, -4.279459, -6.711085, 1, 1.5, 0.5, 0.5,
-3, -4.279459, -6.711085, 0, 1.5, 0.5, 0.5,
-2, -4.279459, -6.711085, 0, -0.5, 0.5, 0.5,
-2, -4.279459, -6.711085, 1, -0.5, 0.5, 0.5,
-2, -4.279459, -6.711085, 1, 1.5, 0.5, 0.5,
-2, -4.279459, -6.711085, 0, 1.5, 0.5, 0.5,
-1, -4.279459, -6.711085, 0, -0.5, 0.5, 0.5,
-1, -4.279459, -6.711085, 1, -0.5, 0.5, 0.5,
-1, -4.279459, -6.711085, 1, 1.5, 0.5, 0.5,
-1, -4.279459, -6.711085, 0, 1.5, 0.5, 0.5,
0, -4.279459, -6.711085, 0, -0.5, 0.5, 0.5,
0, -4.279459, -6.711085, 1, -0.5, 0.5, 0.5,
0, -4.279459, -6.711085, 1, 1.5, 0.5, 0.5,
0, -4.279459, -6.711085, 0, 1.5, 0.5, 0.5,
1, -4.279459, -6.711085, 0, -0.5, 0.5, 0.5,
1, -4.279459, -6.711085, 1, -0.5, 0.5, 0.5,
1, -4.279459, -6.711085, 1, 1.5, 0.5, 0.5,
1, -4.279459, -6.711085, 0, 1.5, 0.5, 0.5,
2, -4.279459, -6.711085, 0, -0.5, 0.5, 0.5,
2, -4.279459, -6.711085, 1, -0.5, 0.5, 0.5,
2, -4.279459, -6.711085, 1, 1.5, 0.5, 0.5,
2, -4.279459, -6.711085, 0, 1.5, 0.5, 0.5,
3, -4.279459, -6.711085, 0, -0.5, 0.5, 0.5,
3, -4.279459, -6.711085, 1, -0.5, 0.5, 0.5,
3, -4.279459, -6.711085, 1, 1.5, 0.5, 0.5,
3, -4.279459, -6.711085, 0, 1.5, 0.5, 0.5
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
-3.713836, -3, -5.891142,
-3.713836, 2, -5.891142,
-3.713836, -3, -5.891142,
-3.886273, -3, -6.164456,
-3.713836, -2, -5.891142,
-3.886273, -2, -6.164456,
-3.713836, -1, -5.891142,
-3.886273, -1, -6.164456,
-3.713836, 0, -5.891142,
-3.886273, 0, -6.164456,
-3.713836, 1, -5.891142,
-3.886273, 1, -6.164456,
-3.713836, 2, -5.891142,
-3.886273, 2, -6.164456
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
-4.231147, -3, -6.711085, 0, -0.5, 0.5, 0.5,
-4.231147, -3, -6.711085, 1, -0.5, 0.5, 0.5,
-4.231147, -3, -6.711085, 1, 1.5, 0.5, 0.5,
-4.231147, -3, -6.711085, 0, 1.5, 0.5, 0.5,
-4.231147, -2, -6.711085, 0, -0.5, 0.5, 0.5,
-4.231147, -2, -6.711085, 1, -0.5, 0.5, 0.5,
-4.231147, -2, -6.711085, 1, 1.5, 0.5, 0.5,
-4.231147, -2, -6.711085, 0, 1.5, 0.5, 0.5,
-4.231147, -1, -6.711085, 0, -0.5, 0.5, 0.5,
-4.231147, -1, -6.711085, 1, -0.5, 0.5, 0.5,
-4.231147, -1, -6.711085, 1, 1.5, 0.5, 0.5,
-4.231147, -1, -6.711085, 0, 1.5, 0.5, 0.5,
-4.231147, 0, -6.711085, 0, -0.5, 0.5, 0.5,
-4.231147, 0, -6.711085, 1, -0.5, 0.5, 0.5,
-4.231147, 0, -6.711085, 1, 1.5, 0.5, 0.5,
-4.231147, 0, -6.711085, 0, 1.5, 0.5, 0.5,
-4.231147, 1, -6.711085, 0, -0.5, 0.5, 0.5,
-4.231147, 1, -6.711085, 1, -0.5, 0.5, 0.5,
-4.231147, 1, -6.711085, 1, 1.5, 0.5, 0.5,
-4.231147, 1, -6.711085, 0, 1.5, 0.5, 0.5,
-4.231147, 2, -6.711085, 0, -0.5, 0.5, 0.5,
-4.231147, 2, -6.711085, 1, -0.5, 0.5, 0.5,
-4.231147, 2, -6.711085, 1, 1.5, 0.5, 0.5,
-4.231147, 2, -6.711085, 0, 1.5, 0.5, 0.5
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
-3.713836, -3.771687, -4,
-3.713836, -3.771687, 4,
-3.713836, -3.771687, -4,
-3.886273, -3.940944, -4,
-3.713836, -3.771687, -2,
-3.886273, -3.940944, -2,
-3.713836, -3.771687, 0,
-3.886273, -3.940944, 0,
-3.713836, -3.771687, 2,
-3.886273, -3.940944, 2,
-3.713836, -3.771687, 4,
-3.886273, -3.940944, 4
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
-4.231147, -4.279459, -4, 0, -0.5, 0.5, 0.5,
-4.231147, -4.279459, -4, 1, -0.5, 0.5, 0.5,
-4.231147, -4.279459, -4, 1, 1.5, 0.5, 0.5,
-4.231147, -4.279459, -4, 0, 1.5, 0.5, 0.5,
-4.231147, -4.279459, -2, 0, -0.5, 0.5, 0.5,
-4.231147, -4.279459, -2, 1, -0.5, 0.5, 0.5,
-4.231147, -4.279459, -2, 1, 1.5, 0.5, 0.5,
-4.231147, -4.279459, -2, 0, 1.5, 0.5, 0.5,
-4.231147, -4.279459, 0, 0, -0.5, 0.5, 0.5,
-4.231147, -4.279459, 0, 1, -0.5, 0.5, 0.5,
-4.231147, -4.279459, 0, 1, 1.5, 0.5, 0.5,
-4.231147, -4.279459, 0, 0, 1.5, 0.5, 0.5,
-4.231147, -4.279459, 2, 0, -0.5, 0.5, 0.5,
-4.231147, -4.279459, 2, 1, -0.5, 0.5, 0.5,
-4.231147, -4.279459, 2, 1, 1.5, 0.5, 0.5,
-4.231147, -4.279459, 2, 0, 1.5, 0.5, 0.5,
-4.231147, -4.279459, 4, 0, -0.5, 0.5, 0.5,
-4.231147, -4.279459, 4, 1, -0.5, 0.5, 0.5,
-4.231147, -4.279459, 4, 1, 1.5, 0.5, 0.5,
-4.231147, -4.279459, 4, 0, 1.5, 0.5, 0.5
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
-3.713836, -3.771687, -5.891142,
-3.713836, 2.998599, -5.891142,
-3.713836, -3.771687, 5.041421,
-3.713836, 2.998599, 5.041421,
-3.713836, -3.771687, -5.891142,
-3.713836, -3.771687, 5.041421,
-3.713836, 2.998599, -5.891142,
-3.713836, 2.998599, 5.041421,
-3.713836, -3.771687, -5.891142,
3.183652, -3.771687, -5.891142,
-3.713836, -3.771687, 5.041421,
3.183652, -3.771687, 5.041421,
-3.713836, 2.998599, -5.891142,
3.183652, 2.998599, -5.891142,
-3.713836, 2.998599, 5.041421,
3.183652, 2.998599, 5.041421,
3.183652, -3.771687, -5.891142,
3.183652, 2.998599, -5.891142,
3.183652, -3.771687, 5.041421,
3.183652, 2.998599, 5.041421,
3.183652, -3.771687, -5.891142,
3.183652, -3.771687, 5.041421,
3.183652, 2.998599, -5.891142,
3.183652, 2.998599, 5.041421
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
var radius = 7.791965;
var distance = 34.66734;
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
mvMatrix.translate( 0.265092, 0.3865439, 0.4248605 );
mvMatrix.scale( 1.221434, 1.244383, 0.7706175 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.66734);
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
Koban<-read.table("Koban.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Koban$V2
```

```
## Error in eval(expr, envir, enclos): object 'Koban' not found
```

```r
y<-Koban$V3
```

```
## Error in eval(expr, envir, enclos): object 'Koban' not found
```

```r
z<-Koban$V4
```

```
## Error in eval(expr, envir, enclos): object 'Koban' not found
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
-3.613387, 0.8940461, -1.95106, 0, 0, 1, 1, 1,
-3.413084, 0.8383085, -1.782373, 1, 0, 0, 1, 1,
-2.95081, -0.5574669, -0.7709052, 1, 0, 0, 1, 1,
-2.866996, -0.8380568, -1.367799, 1, 0, 0, 1, 1,
-2.721598, 1.098868, -2.275587, 1, 0, 0, 1, 1,
-2.711619, -0.8021867, -1.939406, 1, 0, 0, 1, 1,
-2.6041, 0.07872363, -1.091211, 0, 0, 0, 1, 1,
-2.39326, -1.4373, -2.601559, 0, 0, 0, 1, 1,
-2.3607, -0.1152902, -1.576148, 0, 0, 0, 1, 1,
-2.344556, -0.8702417, -1.38886, 0, 0, 0, 1, 1,
-2.317083, 1.383344, 0.7535337, 0, 0, 0, 1, 1,
-2.292306, -1.557131, -0.2285852, 0, 0, 0, 1, 1,
-2.24504, -0.6209045, -2.294273, 0, 0, 0, 1, 1,
-2.223759, 0.2865405, -1.979255, 1, 1, 1, 1, 1,
-2.199465, -0.978452, -2.559995, 1, 1, 1, 1, 1,
-2.146013, 0.6326198, -2.246876, 1, 1, 1, 1, 1,
-2.141288, -2.11364, -3.598498, 1, 1, 1, 1, 1,
-2.130958, 0.1160044, -0.6054035, 1, 1, 1, 1, 1,
-2.128215, -1.363042, -2.676972, 1, 1, 1, 1, 1,
-2.110424, 0.4584412, -0.6778414, 1, 1, 1, 1, 1,
-2.024492, -0.1938893, -1.845659, 1, 1, 1, 1, 1,
-2.001922, 0.1455493, -0.8196939, 1, 1, 1, 1, 1,
-1.992419, 1.785586, -0.3713323, 1, 1, 1, 1, 1,
-1.982038, -1.126096, -0.8273763, 1, 1, 1, 1, 1,
-1.964483, 0.5582457, -0.5342792, 1, 1, 1, 1, 1,
-1.95396, -0.4369735, -1.023996, 1, 1, 1, 1, 1,
-1.9471, 1.394171, -1.132124, 1, 1, 1, 1, 1,
-1.930724, -1.460185, -0.1948378, 1, 1, 1, 1, 1,
-1.928668, -0.1477365, -0.06144913, 0, 0, 1, 1, 1,
-1.908866, 0.5847685, -1.4248, 1, 0, 0, 1, 1,
-1.895071, 0.3235466, -1.029564, 1, 0, 0, 1, 1,
-1.828574, 0.7577109, -0.4496063, 1, 0, 0, 1, 1,
-1.820487, -0.7950568, -0.430981, 1, 0, 0, 1, 1,
-1.810124, 1.196846, 0.8922439, 1, 0, 0, 1, 1,
-1.794024, 0.3890063, -2.222983, 0, 0, 0, 1, 1,
-1.747634, -0.3491707, -3.672751, 0, 0, 0, 1, 1,
-1.738789, -1.08721, -3.778351, 0, 0, 0, 1, 1,
-1.730646, -0.2403042, -2.238719, 0, 0, 0, 1, 1,
-1.715443, -0.9504895, -2.656338, 0, 0, 0, 1, 1,
-1.70213, -0.4018474, -2.803761, 0, 0, 0, 1, 1,
-1.675977, -0.6542852, -1.89589, 0, 0, 0, 1, 1,
-1.662079, -0.6259856, -4.662398, 1, 1, 1, 1, 1,
-1.661667, 0.6911303, -1.807014, 1, 1, 1, 1, 1,
-1.640571, 0.7267109, -1.564037, 1, 1, 1, 1, 1,
-1.629619, 0.4897777, -2.03912, 1, 1, 1, 1, 1,
-1.620453, -1.600564, -2.855103, 1, 1, 1, 1, 1,
-1.616874, 0.1626854, -0.8922176, 1, 1, 1, 1, 1,
-1.605591, 1.572959, -1.606493, 1, 1, 1, 1, 1,
-1.597651, 2.443779, -0.9961343, 1, 1, 1, 1, 1,
-1.592742, 0.1538262, -2.206754, 1, 1, 1, 1, 1,
-1.589896, -1.867322, -4.094451, 1, 1, 1, 1, 1,
-1.587095, -1.956125, -3.149214, 1, 1, 1, 1, 1,
-1.571839, -1.067018, -1.000516, 1, 1, 1, 1, 1,
-1.551057, 1.674047, -1.638537, 1, 1, 1, 1, 1,
-1.543427, 0.8835399, -1.150525, 1, 1, 1, 1, 1,
-1.53542, -0.255878, -2.11837, 1, 1, 1, 1, 1,
-1.533157, -0.3120621, -1.471499, 0, 0, 1, 1, 1,
-1.526581, 1.420988, 0.537441, 1, 0, 0, 1, 1,
-1.525339, 0.05989682, -1.326464, 1, 0, 0, 1, 1,
-1.518552, -0.7089371, -2.332662, 1, 0, 0, 1, 1,
-1.508035, -1.165566, -1.609832, 1, 0, 0, 1, 1,
-1.506018, -1.1302, -2.74387, 1, 0, 0, 1, 1,
-1.499327, 0.5386063, -1.633471, 0, 0, 0, 1, 1,
-1.492683, 0.3986353, -0.5119079, 0, 0, 0, 1, 1,
-1.48987, -0.5438297, -1.650131, 0, 0, 0, 1, 1,
-1.489233, -1.549974, -2.611098, 0, 0, 0, 1, 1,
-1.480169, -0.7826015, -1.297366, 0, 0, 0, 1, 1,
-1.475345, -0.6632981, -1.157338, 0, 0, 0, 1, 1,
-1.470109, -0.859894, -1.957282, 0, 0, 0, 1, 1,
-1.4571, -0.4970774, -0.5052326, 1, 1, 1, 1, 1,
-1.450882, -0.3379316, -0.8190179, 1, 1, 1, 1, 1,
-1.442433, 0.9719456, -1.056063, 1, 1, 1, 1, 1,
-1.437675, -0.460118, -1.787328, 1, 1, 1, 1, 1,
-1.437389, -0.09355586, -3.532633, 1, 1, 1, 1, 1,
-1.432262, 0.3375207, -0.2014737, 1, 1, 1, 1, 1,
-1.408404, -0.08142037, -0.5720073, 1, 1, 1, 1, 1,
-1.408026, 0.07738759, -1.893024, 1, 1, 1, 1, 1,
-1.407616, -1.394863, -1.731106, 1, 1, 1, 1, 1,
-1.407521, 1.322503, -0.6461218, 1, 1, 1, 1, 1,
-1.399669, -0.2396942, -0.2993881, 1, 1, 1, 1, 1,
-1.389729, 0.4862587, -3.207655, 1, 1, 1, 1, 1,
-1.380479, -0.6981114, -1.326678, 1, 1, 1, 1, 1,
-1.378668, 1.414345, -0.3196895, 1, 1, 1, 1, 1,
-1.372732, 1.937965, -0.9882801, 1, 1, 1, 1, 1,
-1.357977, -0.276042, 0.9150882, 0, 0, 1, 1, 1,
-1.356366, -1.818826, -3.176568, 1, 0, 0, 1, 1,
-1.354523, -1.179269, -2.476356, 1, 0, 0, 1, 1,
-1.35308, -0.009218051, -0.5211561, 1, 0, 0, 1, 1,
-1.349977, 0.2727963, -1.901183, 1, 0, 0, 1, 1,
-1.346625, -0.3072881, -2.558491, 1, 0, 0, 1, 1,
-1.343788, 1.751493, 1.391571, 0, 0, 0, 1, 1,
-1.338655, 0.6022796, -2.291278, 0, 0, 0, 1, 1,
-1.327748, -1.376121, -2.082621, 0, 0, 0, 1, 1,
-1.322423, -0.5870869, -2.082958, 0, 0, 0, 1, 1,
-1.310748, -0.1762522, -2.053482, 0, 0, 0, 1, 1,
-1.309614, 0.3895625, -1.954772, 0, 0, 0, 1, 1,
-1.307901, -0.2716435, -2.746967, 0, 0, 0, 1, 1,
-1.304816, -0.8929795, -2.402393, 1, 1, 1, 1, 1,
-1.291818, -0.08871984, -0.8000681, 1, 1, 1, 1, 1,
-1.287791, -0.1295705, -1.364641, 1, 1, 1, 1, 1,
-1.279369, -0.939437, -1.822437, 1, 1, 1, 1, 1,
-1.276405, -1.106863, -2.397252, 1, 1, 1, 1, 1,
-1.270143, -0.7982678, -3.182191, 1, 1, 1, 1, 1,
-1.269819, -0.980714, -3.749969, 1, 1, 1, 1, 1,
-1.264344, 1.686092, -1.260623, 1, 1, 1, 1, 1,
-1.262204, 0.1908031, -0.3672364, 1, 1, 1, 1, 1,
-1.262153, 1.47789, -0.2943983, 1, 1, 1, 1, 1,
-1.262002, -1.579505, -3.318302, 1, 1, 1, 1, 1,
-1.261597, 0.3412205, -0.8760892, 1, 1, 1, 1, 1,
-1.261198, -0.9235363, -1.725129, 1, 1, 1, 1, 1,
-1.259447, 1.078708, -0.9630532, 1, 1, 1, 1, 1,
-1.257579, 2.0683, 0.8992192, 1, 1, 1, 1, 1,
-1.256011, 0.5493817, -2.176344, 0, 0, 1, 1, 1,
-1.241117, -0.05593568, -1.255902, 1, 0, 0, 1, 1,
-1.233717, 0.3954396, -0.2290702, 1, 0, 0, 1, 1,
-1.223291, 0.4889979, -0.04107965, 1, 0, 0, 1, 1,
-1.218876, 1.588204, -0.3957422, 1, 0, 0, 1, 1,
-1.21874, 1.348809, -2.07061, 1, 0, 0, 1, 1,
-1.212388, -0.5232794, -2.045949, 0, 0, 0, 1, 1,
-1.201235, -0.7978587, -1.579868, 0, 0, 0, 1, 1,
-1.196689, 0.8024427, -1.660595, 0, 0, 0, 1, 1,
-1.189201, -2.049613, -2.978714, 0, 0, 0, 1, 1,
-1.183076, -0.6843287, -2.64099, 0, 0, 0, 1, 1,
-1.178296, -2.066268, -2.065905, 0, 0, 0, 1, 1,
-1.176116, 1.21848, -1.01496, 0, 0, 0, 1, 1,
-1.171418, -1.112157, -3.461831, 1, 1, 1, 1, 1,
-1.159437, -0.6024792, -1.163203, 1, 1, 1, 1, 1,
-1.156966, -0.4958637, -2.575802, 1, 1, 1, 1, 1,
-1.141629, 0.3327785, -2.122902, 1, 1, 1, 1, 1,
-1.138864, -0.3074632, -1.085601, 1, 1, 1, 1, 1,
-1.138776, 0.7557856, -0.09293897, 1, 1, 1, 1, 1,
-1.12903, -1.407415, -1.247267, 1, 1, 1, 1, 1,
-1.105824, 0.2404094, -1.843839, 1, 1, 1, 1, 1,
-1.104892, 0.4977769, -2.635752, 1, 1, 1, 1, 1,
-1.102544, -0.01491091, -1.57154, 1, 1, 1, 1, 1,
-1.101548, -0.6791064, -1.576835, 1, 1, 1, 1, 1,
-1.098173, -1.077942, -1.26622, 1, 1, 1, 1, 1,
-1.097857, -0.3363552, -1.843361, 1, 1, 1, 1, 1,
-1.090979, 0.9337725, -1.605601, 1, 1, 1, 1, 1,
-1.090706, -1.155079, -2.821859, 1, 1, 1, 1, 1,
-1.089879, 0.4239465, -1.645337, 0, 0, 1, 1, 1,
-1.089766, -0.5339098, -2.119998, 1, 0, 0, 1, 1,
-1.0843, 0.8165756, 0.5431741, 1, 0, 0, 1, 1,
-1.083412, 1.401487, -2.334298, 1, 0, 0, 1, 1,
-1.078507, 0.5469714, -1.367604, 1, 0, 0, 1, 1,
-1.073145, -0.2329872, -1.812956, 1, 0, 0, 1, 1,
-1.072597, -3.67309, -1.609185, 0, 0, 0, 1, 1,
-1.070947, -0.03740438, -1.132895, 0, 0, 0, 1, 1,
-1.069384, -2.141828, -2.95879, 0, 0, 0, 1, 1,
-1.066259, -1.954145, -2.633024, 0, 0, 0, 1, 1,
-1.041612, -0.2672089, -2.533864, 0, 0, 0, 1, 1,
-1.04001, -1.197087, -2.317286, 0, 0, 0, 1, 1,
-1.034886, 1.179924, -0.4078004, 0, 0, 0, 1, 1,
-1.034658, 1.262515, -0.83959, 1, 1, 1, 1, 1,
-1.034441, -0.4405435, -2.803288, 1, 1, 1, 1, 1,
-1.028217, -0.05408434, -2.763807, 1, 1, 1, 1, 1,
-1.018657, 0.5643699, -1.309304, 1, 1, 1, 1, 1,
-1.016781, -2.441016, -3.19955, 1, 1, 1, 1, 1,
-1.010455, 0.8404657, -0.3342775, 1, 1, 1, 1, 1,
-1.006212, -1.422959, -2.445341, 1, 1, 1, 1, 1,
-1.000712, -3.150415, -2.032349, 1, 1, 1, 1, 1,
-0.9985418, 1.712131, 1.494206, 1, 1, 1, 1, 1,
-0.9956651, 0.254279, -0.6721337, 1, 1, 1, 1, 1,
-0.9699438, -0.9909977, -2.2185, 1, 1, 1, 1, 1,
-0.9625114, -1.240125, -2.462812, 1, 1, 1, 1, 1,
-0.9590577, -2.294455, -3.510847, 1, 1, 1, 1, 1,
-0.9572796, 0.5876216, -1.381312, 1, 1, 1, 1, 1,
-0.9569701, 0.6141079, 0.4955156, 1, 1, 1, 1, 1,
-0.9568961, -0.4374586, -1.353266, 0, 0, 1, 1, 1,
-0.956104, -1.204052, -3.394829, 1, 0, 0, 1, 1,
-0.9549, -1.191979, -0.9315481, 1, 0, 0, 1, 1,
-0.9532595, 0.08412336, -1.748238, 1, 0, 0, 1, 1,
-0.9489517, -0.1147068, -1.344596, 1, 0, 0, 1, 1,
-0.9469818, 0.284896, -1.672066, 1, 0, 0, 1, 1,
-0.9382079, 2.755915, -0.3662037, 0, 0, 0, 1, 1,
-0.9370773, -1.630778, -2.550238, 0, 0, 0, 1, 1,
-0.9359052, -0.9335896, -1.93738, 0, 0, 0, 1, 1,
-0.9293751, -1.784765, -4.504533, 0, 0, 0, 1, 1,
-0.9290713, -1.528308, -4.55195, 0, 0, 0, 1, 1,
-0.9287853, -1.052598, -3.537913, 0, 0, 0, 1, 1,
-0.9283413, -0.6191034, -2.941787, 0, 0, 0, 1, 1,
-0.9262555, 0.1767878, -2.770788, 1, 1, 1, 1, 1,
-0.9170948, 0.2133981, -2.388954, 1, 1, 1, 1, 1,
-0.9125363, 1.896224, -1.265242, 1, 1, 1, 1, 1,
-0.9092593, -0.0915828, -2.725534, 1, 1, 1, 1, 1,
-0.9092203, 0.3045482, -1.914383, 1, 1, 1, 1, 1,
-0.9003792, -0.5879658, -3.36963, 1, 1, 1, 1, 1,
-0.8952088, 0.7355313, -0.2980943, 1, 1, 1, 1, 1,
-0.8815426, -0.1568431, -1.105519, 1, 1, 1, 1, 1,
-0.8764477, -0.8625727, -2.269765, 1, 1, 1, 1, 1,
-0.8745371, -1.107951, -3.036579, 1, 1, 1, 1, 1,
-0.8723044, -1.548538, -2.056857, 1, 1, 1, 1, 1,
-0.8708597, -0.09221345, -1.700195, 1, 1, 1, 1, 1,
-0.8694116, 0.2030021, -2.567905, 1, 1, 1, 1, 1,
-0.8654147, -0.1746985, -1.118415, 1, 1, 1, 1, 1,
-0.8651834, 0.5077826, 0.5579125, 1, 1, 1, 1, 1,
-0.8628602, -0.4663153, -2.169832, 0, 0, 1, 1, 1,
-0.8597959, -0.706295, -0.683131, 1, 0, 0, 1, 1,
-0.8570499, 2.414077, -2.280397, 1, 0, 0, 1, 1,
-0.8509672, -0.8478975, -2.044672, 1, 0, 0, 1, 1,
-0.8477633, -0.9116753, -3.181345, 1, 0, 0, 1, 1,
-0.8459123, -0.3768279, -1.804284, 1, 0, 0, 1, 1,
-0.8457238, 0.1126101, -2.537993, 0, 0, 0, 1, 1,
-0.8417408, 1.070263, -1.502235, 0, 0, 0, 1, 1,
-0.8406295, -1.1816, -1.752888, 0, 0, 0, 1, 1,
-0.8402099, -0.3111345, -0.2890458, 0, 0, 0, 1, 1,
-0.8304357, 1.221585, -0.359663, 0, 0, 0, 1, 1,
-0.8273, -0.1254935, -1.960616, 0, 0, 0, 1, 1,
-0.8265556, -2.563244, -2.434123, 0, 0, 0, 1, 1,
-0.8238682, 1.52922, -2.487866, 1, 1, 1, 1, 1,
-0.8221216, 0.6026704, -1.241276, 1, 1, 1, 1, 1,
-0.8185935, 0.1852415, -0.24079, 1, 1, 1, 1, 1,
-0.8110929, 0.4356817, -0.698279, 1, 1, 1, 1, 1,
-0.8108046, -0.4635703, -1.995489, 1, 1, 1, 1, 1,
-0.8094123, -0.2039718, -1.735741, 1, 1, 1, 1, 1,
-0.8018818, 1.962072, -1.56163, 1, 1, 1, 1, 1,
-0.7947156, 0.5098129, -0.1803417, 1, 1, 1, 1, 1,
-0.7910743, -0.3985799, -2.742665, 1, 1, 1, 1, 1,
-0.7910681, 0.04952585, -1.214585, 1, 1, 1, 1, 1,
-0.7898504, 0.445934, -0.2654095, 1, 1, 1, 1, 1,
-0.7881082, -0.3535143, -3.344727, 1, 1, 1, 1, 1,
-0.7807686, -0.2957051, -3.834659, 1, 1, 1, 1, 1,
-0.7780148, 1.040348, -1.351167, 1, 1, 1, 1, 1,
-0.7779222, 1.422199, -0.6814884, 1, 1, 1, 1, 1,
-0.7621256, 1.161177, -1.481169, 0, 0, 1, 1, 1,
-0.7579765, 0.6701248, -1.57542, 1, 0, 0, 1, 1,
-0.7562117, 0.4644804, -1.090548, 1, 0, 0, 1, 1,
-0.7541127, -0.09843311, -1.118758, 1, 0, 0, 1, 1,
-0.749213, -0.1201175, -1.17549, 1, 0, 0, 1, 1,
-0.7454504, 0.2506272, -0.4563151, 1, 0, 0, 1, 1,
-0.7449996, 0.4150262, -0.008634609, 0, 0, 0, 1, 1,
-0.7390551, 0.8182709, -2.73503, 0, 0, 0, 1, 1,
-0.734799, -0.7381126, -1.445691, 0, 0, 0, 1, 1,
-0.7338941, 0.7064426, -1.756859, 0, 0, 0, 1, 1,
-0.7290887, 1.229874, -0.6794542, 0, 0, 0, 1, 1,
-0.7217727, 0.3222716, -0.497015, 0, 0, 0, 1, 1,
-0.7213384, -0.2777438, -1.042408, 0, 0, 0, 1, 1,
-0.7177889, -0.3503769, -0.5674808, 1, 1, 1, 1, 1,
-0.7109441, -0.066607, -3.005448, 1, 1, 1, 1, 1,
-0.7094259, 0.6494496, -0.4452825, 1, 1, 1, 1, 1,
-0.7006532, 1.0346, -0.002339427, 1, 1, 1, 1, 1,
-0.6957511, 1.021371, -0.7869035, 1, 1, 1, 1, 1,
-0.6940975, -0.2341731, -1.305832, 1, 1, 1, 1, 1,
-0.6917667, -0.05214646, -2.160261, 1, 1, 1, 1, 1,
-0.6907095, 0.04001474, -1.003793, 1, 1, 1, 1, 1,
-0.6888707, -2.603872, -2.308943, 1, 1, 1, 1, 1,
-0.6864108, 0.0347821, -0.8622783, 1, 1, 1, 1, 1,
-0.6846496, -1.205379, -2.668918, 1, 1, 1, 1, 1,
-0.6831674, 1.50561, 0.2939005, 1, 1, 1, 1, 1,
-0.6720241, 1.178438, -0.466925, 1, 1, 1, 1, 1,
-0.6715485, -0.01245541, 0.7762771, 1, 1, 1, 1, 1,
-0.6657867, 1.687304, 0.337292, 1, 1, 1, 1, 1,
-0.6567106, -0.8751302, -1.970712, 0, 0, 1, 1, 1,
-0.6551695, -0.2832898, -0.600279, 1, 0, 0, 1, 1,
-0.6529669, -0.8805872, -1.790674, 1, 0, 0, 1, 1,
-0.6527817, -0.77352, -1.601633, 1, 0, 0, 1, 1,
-0.637881, -0.1770997, -0.9881485, 1, 0, 0, 1, 1,
-0.6373767, -0.9450697, -2.090834, 1, 0, 0, 1, 1,
-0.6366264, -1.121677, -4.03932, 0, 0, 0, 1, 1,
-0.6361235, 1.291425, 0.3669649, 0, 0, 0, 1, 1,
-0.6356588, 2.004116, 0.6142028, 0, 0, 0, 1, 1,
-0.6284842, -0.4782504, -3.269096, 0, 0, 0, 1, 1,
-0.6260997, 0.2585818, -2.433253, 0, 0, 0, 1, 1,
-0.6260424, 0.9602405, -1.302052, 0, 0, 0, 1, 1,
-0.6237659, -0.5973947, -3.391523, 0, 0, 0, 1, 1,
-0.620441, -1.175526, -2.1178, 1, 1, 1, 1, 1,
-0.6190605, 0.9324182, 0.5666215, 1, 1, 1, 1, 1,
-0.6190521, -1.949177, -4.315772, 1, 1, 1, 1, 1,
-0.6186723, 0.2966789, -1.990072, 1, 1, 1, 1, 1,
-0.6165643, -0.4191657, -0.8088337, 1, 1, 1, 1, 1,
-0.6145388, 0.937409, -1.093602, 1, 1, 1, 1, 1,
-0.6121601, -0.2108798, -0.1057449, 1, 1, 1, 1, 1,
-0.6120567, 1.241089, 0.424228, 1, 1, 1, 1, 1,
-0.609675, -0.3856788, -2.20606, 1, 1, 1, 1, 1,
-0.6022041, -0.01950432, -3.526843, 1, 1, 1, 1, 1,
-0.5975392, 0.07815307, -2.065064, 1, 1, 1, 1, 1,
-0.5973634, 0.1811308, -1.866912, 1, 1, 1, 1, 1,
-0.5915307, 1.14823, -0.7743722, 1, 1, 1, 1, 1,
-0.5880584, -0.525852, -2.41742, 1, 1, 1, 1, 1,
-0.5878871, 0.6314226, -1.294141, 1, 1, 1, 1, 1,
-0.5859619, -0.5806857, -3.162292, 0, 0, 1, 1, 1,
-0.5857369, 1.658005, 0.8149637, 1, 0, 0, 1, 1,
-0.5834166, -0.4411046, -2.111373, 1, 0, 0, 1, 1,
-0.5803839, -0.9302949, -1.09197, 1, 0, 0, 1, 1,
-0.5743209, 1.68539, -0.4723922, 1, 0, 0, 1, 1,
-0.5739463, -0.8537623, -1.469506, 1, 0, 0, 1, 1,
-0.573751, -0.08183677, -1.269019, 0, 0, 0, 1, 1,
-0.5700389, -0.2151656, 0.6815499, 0, 0, 0, 1, 1,
-0.5691788, 0.537452, -1.266317, 0, 0, 0, 1, 1,
-0.5669078, 0.4457005, 0.02071371, 0, 0, 0, 1, 1,
-0.5619065, 0.2474657, -1.565827, 0, 0, 0, 1, 1,
-0.5510164, 0.4964657, -0.2135951, 0, 0, 0, 1, 1,
-0.5491253, -0.5960289, -2.623149, 0, 0, 0, 1, 1,
-0.5490583, 0.2874845, -0.7973534, 1, 1, 1, 1, 1,
-0.5479334, -1.203786, -2.045992, 1, 1, 1, 1, 1,
-0.5464489, -0.4805032, -3.063946, 1, 1, 1, 1, 1,
-0.5334362, -1.8742, -1.275515, 1, 1, 1, 1, 1,
-0.5332046, -0.7894674, -3.26276, 1, 1, 1, 1, 1,
-0.5288529, -2.211204, -3.745214, 1, 1, 1, 1, 1,
-0.5271316, 1.303702, -0.2153548, 1, 1, 1, 1, 1,
-0.5270768, -0.7671721, -3.002285, 1, 1, 1, 1, 1,
-0.5221319, -1.155691, -5.73193, 1, 1, 1, 1, 1,
-0.5208033, 0.8063308, -1.127319, 1, 1, 1, 1, 1,
-0.5203242, 1.135252, -0.2188078, 1, 1, 1, 1, 1,
-0.5197636, 0.4868878, -1.438306, 1, 1, 1, 1, 1,
-0.5182112, 0.4301991, -0.8988166, 1, 1, 1, 1, 1,
-0.5181385, -0.333412, 0.2211057, 1, 1, 1, 1, 1,
-0.5166742, 1.053627, -0.4969893, 1, 1, 1, 1, 1,
-0.5049387, -1.067253, -2.8031, 0, 0, 1, 1, 1,
-0.5046333, 0.1755851, 0.05956612, 1, 0, 0, 1, 1,
-0.5041342, -0.8658188, -2.679411, 1, 0, 0, 1, 1,
-0.4955267, -0.08610373, -3.384778, 1, 0, 0, 1, 1,
-0.4943779, -1.370763, -4.70099, 1, 0, 0, 1, 1,
-0.4925218, -0.4796423, -1.782669, 1, 0, 0, 1, 1,
-0.4898954, -0.2972254, -2.113609, 0, 0, 0, 1, 1,
-0.4889615, -0.9913868, -0.6804901, 0, 0, 0, 1, 1,
-0.4861046, -0.9420612, -1.528748, 0, 0, 0, 1, 1,
-0.4805619, -0.2210775, -4.04434, 0, 0, 0, 1, 1,
-0.4796665, -1.513953, -3.775092, 0, 0, 0, 1, 1,
-0.4790708, 0.3213567, -1.333017, 0, 0, 0, 1, 1,
-0.4773487, 1.211729, -1.02647, 0, 0, 0, 1, 1,
-0.4715745, 0.8625072, 0.106708, 1, 1, 1, 1, 1,
-0.4712979, 1.102424, -0.2265081, 1, 1, 1, 1, 1,
-0.4704084, -0.2037309, -2.173091, 1, 1, 1, 1, 1,
-0.4688756, -1.231043, -2.552976, 1, 1, 1, 1, 1,
-0.4687984, 1.349567, -0.794255, 1, 1, 1, 1, 1,
-0.4602146, 0.9610534, -0.9045297, 1, 1, 1, 1, 1,
-0.459284, -1.070858, -3.886775, 1, 1, 1, 1, 1,
-0.4587569, -0.03382594, -0.9687516, 1, 1, 1, 1, 1,
-0.4573317, 0.01808789, -1.953438, 1, 1, 1, 1, 1,
-0.4527182, -1.072987, -1.9812, 1, 1, 1, 1, 1,
-0.4514436, -1.816333, -4.024795, 1, 1, 1, 1, 1,
-0.4504732, -1.373344, -2.164946, 1, 1, 1, 1, 1,
-0.4410934, -1.116889, -4.097212, 1, 1, 1, 1, 1,
-0.4353047, 1.18516, 0.3239052, 1, 1, 1, 1, 1,
-0.4323408, -0.4107375, -1.538849, 1, 1, 1, 1, 1,
-0.4323203, 0.7168556, -0.03333568, 0, 0, 1, 1, 1,
-0.4314503, -0.473751, -2.552529, 1, 0, 0, 1, 1,
-0.4298592, 0.9406469, 0.2746694, 1, 0, 0, 1, 1,
-0.426158, -0.4335292, -2.492495, 1, 0, 0, 1, 1,
-0.4260721, -0.3227089, -2.2559, 1, 0, 0, 1, 1,
-0.4210801, -0.460781, -0.6510867, 1, 0, 0, 1, 1,
-0.4145152, -1.137397, -2.073846, 0, 0, 0, 1, 1,
-0.4084509, 0.2132682, -0.7549854, 0, 0, 0, 1, 1,
-0.4053616, 0.6856159, 0.7322965, 0, 0, 0, 1, 1,
-0.4050905, 1.773392, -1.40392, 0, 0, 0, 1, 1,
-0.401961, 0.1611526, -0.7692849, 0, 0, 0, 1, 1,
-0.4019344, -0.2271662, -2.137979, 0, 0, 0, 1, 1,
-0.3964209, 0.06347356, -2.818814, 0, 0, 0, 1, 1,
-0.3941846, -0.5555162, -2.177906, 1, 1, 1, 1, 1,
-0.3920495, -1.488627, -0.9793558, 1, 1, 1, 1, 1,
-0.3908412, -0.5381248, -2.737606, 1, 1, 1, 1, 1,
-0.3855362, 0.6391346, 0.4696787, 1, 1, 1, 1, 1,
-0.3850489, 1.492088, -0.2503422, 1, 1, 1, 1, 1,
-0.3833948, 1.018132, -0.6859199, 1, 1, 1, 1, 1,
-0.3780374, 0.7152891, -0.2563144, 1, 1, 1, 1, 1,
-0.3746229, 1.147326, -2.754012, 1, 1, 1, 1, 1,
-0.3743477, 0.6678216, -1.456076, 1, 1, 1, 1, 1,
-0.3713638, -0.1073212, -4.060204, 1, 1, 1, 1, 1,
-0.370281, -0.5997617, -1.55119, 1, 1, 1, 1, 1,
-0.3702468, 1.116479, -0.4708723, 1, 1, 1, 1, 1,
-0.3636226, -1.252847, -3.080558, 1, 1, 1, 1, 1,
-0.3624851, -0.5148533, -3.254895, 1, 1, 1, 1, 1,
-0.3574601, 0.3108999, 0.7448116, 1, 1, 1, 1, 1,
-0.3573356, 0.8689064, 0.05085243, 0, 0, 1, 1, 1,
-0.3518844, 1.00874, -0.7330504, 1, 0, 0, 1, 1,
-0.3511189, 0.8707426, -1.133329, 1, 0, 0, 1, 1,
-0.3493151, -0.9118539, -3.613635, 1, 0, 0, 1, 1,
-0.3488226, -1.096025, -2.443697, 1, 0, 0, 1, 1,
-0.3412147, -0.9050857, -2.021137, 1, 0, 0, 1, 1,
-0.3378776, 0.5917823, -0.3940826, 0, 0, 0, 1, 1,
-0.3377038, 0.3963553, 0.9627007, 0, 0, 0, 1, 1,
-0.3338484, -0.1074372, -0.7028083, 0, 0, 0, 1, 1,
-0.3278776, -0.6178102, -2.476447, 0, 0, 0, 1, 1,
-0.3261929, -0.9149417, -2.374435, 0, 0, 0, 1, 1,
-0.3216479, -0.1070315, -1.140777, 0, 0, 0, 1, 1,
-0.3215207, 1.722202, -0.8766094, 0, 0, 0, 1, 1,
-0.3194427, -0.3924935, -2.584923, 1, 1, 1, 1, 1,
-0.3151295, 1.066673, -0.9907327, 1, 1, 1, 1, 1,
-0.3127468, -1.401857, -4.150071, 1, 1, 1, 1, 1,
-0.3107433, 0.4170038, -0.0869863, 1, 1, 1, 1, 1,
-0.3098404, -0.9066879, -1.603254, 1, 1, 1, 1, 1,
-0.3074876, -0.4650762, -3.513637, 1, 1, 1, 1, 1,
-0.3061439, 0.3489372, -0.837199, 1, 1, 1, 1, 1,
-0.3043449, -0.2858202, -4.028965, 1, 1, 1, 1, 1,
-0.3021321, -0.6276624, -1.202713, 1, 1, 1, 1, 1,
-0.2979621, 0.9315017, -2.426524, 1, 1, 1, 1, 1,
-0.29791, -0.1357642, -2.010638, 1, 1, 1, 1, 1,
-0.2969598, 1.449432, -0.8815218, 1, 1, 1, 1, 1,
-0.2953442, 1.564919, -0.8883017, 1, 1, 1, 1, 1,
-0.2894656, 1.02762, -2.339144, 1, 1, 1, 1, 1,
-0.2855015, 1.376663, 0.5334914, 1, 1, 1, 1, 1,
-0.2846, 0.2020098, -0.9348783, 0, 0, 1, 1, 1,
-0.2831143, 0.6148251, -3.46529, 1, 0, 0, 1, 1,
-0.2822074, 1.406262, 2.19463, 1, 0, 0, 1, 1,
-0.2819555, -0.7652002, -2.060363, 1, 0, 0, 1, 1,
-0.2788377, -1.173512, -2.676404, 1, 0, 0, 1, 1,
-0.2759593, -0.3196679, -0.9083115, 1, 0, 0, 1, 1,
-0.275279, -0.9544994, -2.956649, 0, 0, 0, 1, 1,
-0.2743558, 0.3157063, -0.4339426, 0, 0, 0, 1, 1,
-0.2736909, -0.09274871, -1.171143, 0, 0, 0, 1, 1,
-0.2722265, -2.020974, -3.1429, 0, 0, 0, 1, 1,
-0.2713994, 0.1278872, 0.4583978, 0, 0, 0, 1, 1,
-0.2700043, 1.298287, 0.02986616, 0, 0, 0, 1, 1,
-0.2674314, -0.1944651, -3.545227, 0, 0, 0, 1, 1,
-0.2659355, -0.6912787, -2.929583, 1, 1, 1, 1, 1,
-0.2651766, -1.338838, -3.147571, 1, 1, 1, 1, 1,
-0.2645785, 1.743085, -0.9917566, 1, 1, 1, 1, 1,
-0.2641601, 0.1990089, -2.484888, 1, 1, 1, 1, 1,
-0.2640767, 1.187077, 0.2956697, 1, 1, 1, 1, 1,
-0.2631379, -0.3711339, -4.516302, 1, 1, 1, 1, 1,
-0.2604507, -1.368545, -1.951348, 1, 1, 1, 1, 1,
-0.258999, 0.2805015, -1.410104, 1, 1, 1, 1, 1,
-0.2534748, -0.7026471, -1.829853, 1, 1, 1, 1, 1,
-0.2515036, 2.199171, 1.222852, 1, 1, 1, 1, 1,
-0.2493359, 1.314182, -0.7201471, 1, 1, 1, 1, 1,
-0.2493309, 0.1004277, -0.08931289, 1, 1, 1, 1, 1,
-0.2463494, -0.178603, -2.296352, 1, 1, 1, 1, 1,
-0.2457866, -0.9666075, -3.234473, 1, 1, 1, 1, 1,
-0.2385297, -0.7492321, -3.291251, 1, 1, 1, 1, 1,
-0.234894, -0.6922333, -3.330056, 0, 0, 1, 1, 1,
-0.2347062, -1.507877, -1.464807, 1, 0, 0, 1, 1,
-0.2344527, 0.6884735, -0.316311, 1, 0, 0, 1, 1,
-0.2325139, -1.039773, -3.708722, 1, 0, 0, 1, 1,
-0.2318142, -2.15055, -3.099665, 1, 0, 0, 1, 1,
-0.2267833, -0.8968093, -2.84972, 1, 0, 0, 1, 1,
-0.2250421, 0.8161809, 0.7312536, 0, 0, 0, 1, 1,
-0.221448, -0.1995508, -2.552642, 0, 0, 0, 1, 1,
-0.2173079, -1.197115, -4.196161, 0, 0, 0, 1, 1,
-0.2136868, 0.07597364, -1.425863, 0, 0, 0, 1, 1,
-0.2124201, 0.3136441, -0.975405, 0, 0, 0, 1, 1,
-0.2072545, 0.08291362, -0.03138704, 0, 0, 0, 1, 1,
-0.206718, 0.9292197, -1.128556, 0, 0, 0, 1, 1,
-0.2048033, 2.042107, 1.978765, 1, 1, 1, 1, 1,
-0.2045393, -0.3020416, -2.686255, 1, 1, 1, 1, 1,
-0.1976187, 0.8563571, -1.641634, 1, 1, 1, 1, 1,
-0.1951971, 0.670262, 0.1480536, 1, 1, 1, 1, 1,
-0.1938316, -1.304872, -3.161514, 1, 1, 1, 1, 1,
-0.1899194, 0.690908, -0.1726739, 1, 1, 1, 1, 1,
-0.1895054, 1.114064, -1.074693, 1, 1, 1, 1, 1,
-0.1857285, -0.7258129, -4.079465, 1, 1, 1, 1, 1,
-0.1852621, 0.7181353, 0.2525684, 1, 1, 1, 1, 1,
-0.1851163, 0.1268964, -0.00589601, 1, 1, 1, 1, 1,
-0.1826101, 0.9180016, 0.1180939, 1, 1, 1, 1, 1,
-0.1797619, 0.01649664, -0.9537184, 1, 1, 1, 1, 1,
-0.1774145, -1.686298, -3.954373, 1, 1, 1, 1, 1,
-0.1733666, -0.8146471, -4.115307, 1, 1, 1, 1, 1,
-0.1692767, -0.5377502, -4.802841, 1, 1, 1, 1, 1,
-0.1679397, 0.06133994, -1.641818, 0, 0, 1, 1, 1,
-0.166412, 0.8437608, 1.013858, 1, 0, 0, 1, 1,
-0.1657868, -0.8414467, -3.78704, 1, 0, 0, 1, 1,
-0.16257, 0.2926632, -0.2389029, 1, 0, 0, 1, 1,
-0.1625603, 1.088565, 0.3408116, 1, 0, 0, 1, 1,
-0.1558007, 0.8425415, -0.4357375, 1, 0, 0, 1, 1,
-0.1544038, 0.3590944, -0.7280472, 0, 0, 0, 1, 1,
-0.1494819, -0.1175127, 1.075385, 0, 0, 0, 1, 1,
-0.1410901, 0.6749696, 0.7137299, 0, 0, 0, 1, 1,
-0.1356242, -0.6796425, -1.621451, 0, 0, 0, 1, 1,
-0.1351805, -2.115789, -2.203213, 0, 0, 0, 1, 1,
-0.1336727, -0.4001878, -2.105996, 0, 0, 0, 1, 1,
-0.1291519, -0.9278947, -2.638611, 0, 0, 0, 1, 1,
-0.1266715, 0.5848809, -2.631195, 1, 1, 1, 1, 1,
-0.1215091, -1.865206, -2.335273, 1, 1, 1, 1, 1,
-0.1211152, -0.5352131, -2.532039, 1, 1, 1, 1, 1,
-0.1163881, -0.2313363, -1.956127, 1, 1, 1, 1, 1,
-0.1082212, -0.3970656, -3.030244, 1, 1, 1, 1, 1,
-0.1068957, 0.6789335, 0.08485219, 1, 1, 1, 1, 1,
-0.1001962, 0.4682246, -0.1293713, 1, 1, 1, 1, 1,
-0.09833909, -1.734226, -1.996478, 1, 1, 1, 1, 1,
-0.09403346, 0.04047513, -1.890252, 1, 1, 1, 1, 1,
-0.09087226, 0.04300532, -0.9723223, 1, 1, 1, 1, 1,
-0.08930874, -0.5287852, -5.68319, 1, 1, 1, 1, 1,
-0.0804107, 0.2503502, 2.366784, 1, 1, 1, 1, 1,
-0.07713564, 1.31215, 0.9027705, 1, 1, 1, 1, 1,
-0.07092801, -0.844003, -2.435264, 1, 1, 1, 1, 1,
-0.06989156, -1.438564, -3.35756, 1, 1, 1, 1, 1,
-0.06802937, -2.121957, -1.278283, 0, 0, 1, 1, 1,
-0.06738497, -0.4440896, -1.788465, 1, 0, 0, 1, 1,
-0.06494062, -0.7501014, -3.241922, 1, 0, 0, 1, 1,
-0.06476321, 0.6611732, -0.7602446, 1, 0, 0, 1, 1,
-0.06460957, -0.6684763, -2.021521, 1, 0, 0, 1, 1,
-0.06311223, 1.738234, -0.7985314, 1, 0, 0, 1, 1,
-0.06101114, 0.1027977, -1.306721, 0, 0, 0, 1, 1,
-0.05839572, 0.7871506, 0.3068847, 0, 0, 0, 1, 1,
-0.05811681, 0.8311653, 1.296756, 0, 0, 0, 1, 1,
-0.0566013, 0.3189161, 0.366588, 0, 0, 0, 1, 1,
-0.05575396, 0.760547, 1.648562, 0, 0, 0, 1, 1,
-0.05361278, 0.1066166, -0.1664756, 0, 0, 0, 1, 1,
-0.05038614, 1.215923, 0.6371214, 0, 0, 0, 1, 1,
-0.0483507, -0.6416555, -4.160464, 1, 1, 1, 1, 1,
-0.04507179, 1.957733, 0.7810959, 1, 1, 1, 1, 1,
-0.04384617, 0.09100521, 0.3080006, 1, 1, 1, 1, 1,
-0.04146704, -0.5721595, -2.65706, 1, 1, 1, 1, 1,
-0.03814581, 1.222513, 1.498529, 1, 1, 1, 1, 1,
-0.03794688, -0.5897454, -4.048278, 1, 1, 1, 1, 1,
-0.03749472, -0.4542556, -2.564092, 1, 1, 1, 1, 1,
-0.03338044, 0.105406, -1.450256, 1, 1, 1, 1, 1,
-0.03000808, 0.2373815, -1.665204, 1, 1, 1, 1, 1,
-0.02957441, 1.299188, 0.5555794, 1, 1, 1, 1, 1,
-0.02836463, 0.3555172, 0.2061487, 1, 1, 1, 1, 1,
-0.02704188, -1.166364, -3.869341, 1, 1, 1, 1, 1,
-0.02508795, -0.9811695, -3.760882, 1, 1, 1, 1, 1,
-0.02189844, -0.6097668, -2.60905, 1, 1, 1, 1, 1,
-0.02033446, 0.1522357, 0.2162739, 1, 1, 1, 1, 1,
-0.01389263, 1.521373, -0.4459485, 0, 0, 1, 1, 1,
-0.01170113, 0.5506468, 1.530506, 1, 0, 0, 1, 1,
-0.01103588, -0.6646119, -4.266144, 1, 0, 0, 1, 1,
-0.005826047, -1.313341, -2.323326, 1, 0, 0, 1, 1,
-0.00314542, -0.9397489, -3.323583, 1, 0, 0, 1, 1,
0.004939542, -0.2215677, 4.088177, 1, 0, 0, 1, 1,
0.006443381, 0.8058712, -0.893433, 0, 0, 0, 1, 1,
0.01135885, -1.863637, 3.67563, 0, 0, 0, 1, 1,
0.01390459, -0.1754891, 3.672501, 0, 0, 0, 1, 1,
0.0157188, 0.6631619, -0.4874848, 0, 0, 0, 1, 1,
0.01901749, 0.4638945, 0.5216504, 0, 0, 0, 1, 1,
0.01961626, -1.907003, 4.113376, 0, 0, 0, 1, 1,
0.03388399, 1.435173, -0.2825736, 0, 0, 0, 1, 1,
0.0339419, -1.289225, 2.539379, 1, 1, 1, 1, 1,
0.03546265, -1.811871, 3.283239, 1, 1, 1, 1, 1,
0.03591159, -1.642951, 2.980164, 1, 1, 1, 1, 1,
0.03597368, -0.357538, 2.632247, 1, 1, 1, 1, 1,
0.03966668, -1.256602, 3.475875, 1, 1, 1, 1, 1,
0.03989004, -0.02627532, 0.821877, 1, 1, 1, 1, 1,
0.04047612, -1.133987, 3.851618, 1, 1, 1, 1, 1,
0.04263268, -0.7628449, 3.251183, 1, 1, 1, 1, 1,
0.04622183, 0.3060992, 1.602504, 1, 1, 1, 1, 1,
0.04663438, 0.4322798, -0.3872328, 1, 1, 1, 1, 1,
0.04851037, 0.0120266, 0.2988717, 1, 1, 1, 1, 1,
0.05246114, -0.7955893, 4.069654, 1, 1, 1, 1, 1,
0.05739458, 0.04190454, -0.2954953, 1, 1, 1, 1, 1,
0.0580451, 1.424515, 0.01226881, 1, 1, 1, 1, 1,
0.05964725, -1.388635, 1.707949, 1, 1, 1, 1, 1,
0.06191498, -1.642178, 4.319796, 0, 0, 1, 1, 1,
0.06825282, 0.1166458, 0.8052914, 1, 0, 0, 1, 1,
0.07050439, 0.1656866, 0.4331939, 1, 0, 0, 1, 1,
0.07333207, 1.056317, -0.2905057, 1, 0, 0, 1, 1,
0.07797515, -0.3944111, 2.525251, 1, 0, 0, 1, 1,
0.08045377, -1.636876, 3.052356, 1, 0, 0, 1, 1,
0.08382046, -0.9630338, 4.814733, 0, 0, 0, 1, 1,
0.08848187, 1.093516, 1.043238, 0, 0, 0, 1, 1,
0.09376303, 0.6753466, 0.3088857, 0, 0, 0, 1, 1,
0.09553211, 0.6603984, -0.322047, 0, 0, 0, 1, 1,
0.1028239, 0.3100632, -0.597963, 0, 0, 0, 1, 1,
0.1043701, 2.039833, 0.01138894, 0, 0, 0, 1, 1,
0.1102444, 1.751805, -0.2161072, 0, 0, 0, 1, 1,
0.1144926, -1.286131, 2.552783, 1, 1, 1, 1, 1,
0.1146879, -1.23717, 3.71769, 1, 1, 1, 1, 1,
0.1173507, -0.6252515, 4.09107, 1, 1, 1, 1, 1,
0.1180277, 0.145359, 2.260798, 1, 1, 1, 1, 1,
0.1197482, 2.249452, 1.183067, 1, 1, 1, 1, 1,
0.1221623, 1.063526, -0.2286735, 1, 1, 1, 1, 1,
0.1377173, -0.01507072, 0.3183775, 1, 1, 1, 1, 1,
0.1382802, 0.05995084, 2.312378, 1, 1, 1, 1, 1,
0.1405156, 0.4392038, -0.8033655, 1, 1, 1, 1, 1,
0.1409904, 1.119286, -0.9539028, 1, 1, 1, 1, 1,
0.1441471, 0.1244313, 0.140797, 1, 1, 1, 1, 1,
0.1496773, 0.3850335, 0.4443661, 1, 1, 1, 1, 1,
0.1520351, -1.885447, 3.300022, 1, 1, 1, 1, 1,
0.1535282, 2.023853, -1.169041, 1, 1, 1, 1, 1,
0.1557417, 2.074646, 1.64204, 1, 1, 1, 1, 1,
0.1587041, -0.5759143, 2.995595, 0, 0, 1, 1, 1,
0.1619186, 1.075162, 0.6529439, 1, 0, 0, 1, 1,
0.1619596, -0.03837795, 2.708035, 1, 0, 0, 1, 1,
0.1620593, -0.837036, 2.135824, 1, 0, 0, 1, 1,
0.1671464, 0.9255541, -1.491041, 1, 0, 0, 1, 1,
0.1674499, 0.0006433947, 1.393118, 1, 0, 0, 1, 1,
0.1702773, -1.470459, 2.931675, 0, 0, 0, 1, 1,
0.1713721, -1.011726, 3.403949, 0, 0, 0, 1, 1,
0.1729465, 0.687327, 0.9756426, 0, 0, 0, 1, 1,
0.178854, -0.3222166, 1.457082, 0, 0, 0, 1, 1,
0.1803358, 1.290543, -0.5128502, 0, 0, 0, 1, 1,
0.1824838, -0.7198473, 2.165744, 0, 0, 0, 1, 1,
0.1891531, -0.8876535, 3.128615, 0, 0, 0, 1, 1,
0.1903311, 1.169173, -0.3207623, 1, 1, 1, 1, 1,
0.1909752, -0.5113828, 2.526071, 1, 1, 1, 1, 1,
0.1919007, -0.5621669, 2.893823, 1, 1, 1, 1, 1,
0.1931664, -1.372679, 3.992186, 1, 1, 1, 1, 1,
0.1982256, -0.8877064, 1.376017, 1, 1, 1, 1, 1,
0.1991765, 0.2253983, 0.7534789, 1, 1, 1, 1, 1,
0.2002012, -0.5976047, 4.380029, 1, 1, 1, 1, 1,
0.2024284, 0.1508375, 1.591027, 1, 1, 1, 1, 1,
0.2032811, 1.874961, -1.17969, 1, 1, 1, 1, 1,
0.2038949, -0.8856218, 3.051887, 1, 1, 1, 1, 1,
0.2040432, 1.682918, -0.9621266, 1, 1, 1, 1, 1,
0.2152304, 0.7674815, 0.1766935, 1, 1, 1, 1, 1,
0.219572, -0.1913847, 2.085593, 1, 1, 1, 1, 1,
0.2214447, 0.4001039, -0.03111995, 1, 1, 1, 1, 1,
0.2223465, 1.679546, -0.3383911, 1, 1, 1, 1, 1,
0.2245041, 0.6823878, 0.1184954, 0, 0, 1, 1, 1,
0.2261065, -0.07395153, 1.632294, 1, 0, 0, 1, 1,
0.2268424, 0.8503429, 0.4820207, 1, 0, 0, 1, 1,
0.2275735, 0.5294797, -1.32352, 1, 0, 0, 1, 1,
0.2280409, -0.4699813, 3.925912, 1, 0, 0, 1, 1,
0.2307142, -0.2040664, 1.325571, 1, 0, 0, 1, 1,
0.231264, -0.9401848, 1.755671, 0, 0, 0, 1, 1,
0.2347777, 0.09284563, 1.056222, 0, 0, 0, 1, 1,
0.2488733, -0.370989, 1.442851, 0, 0, 0, 1, 1,
0.2551687, -2.504121, 2.915607, 0, 0, 0, 1, 1,
0.2558411, 0.2806569, 2.119286, 0, 0, 0, 1, 1,
0.2603391, 0.01480207, 2.988882, 0, 0, 0, 1, 1,
0.2621403, 1.376129, 0.834226, 0, 0, 0, 1, 1,
0.2638321, -2.342608, 3.746504, 1, 1, 1, 1, 1,
0.2659177, -0.3957699, 1.855858, 1, 1, 1, 1, 1,
0.272001, -0.7752942, 1.963786, 1, 1, 1, 1, 1,
0.2737957, -1.693645, 2.095535, 1, 1, 1, 1, 1,
0.2827807, 0.2360402, 0.3555877, 1, 1, 1, 1, 1,
0.2902158, 0.6376561, 0.2871518, 1, 1, 1, 1, 1,
0.2935304, 1.606814, 3.122514, 1, 1, 1, 1, 1,
0.2935671, -1.435878, 3.910237, 1, 1, 1, 1, 1,
0.2967143, 0.8573194, -0.611744, 1, 1, 1, 1, 1,
0.2979208, -0.4061092, 0.2261124, 1, 1, 1, 1, 1,
0.2999093, 1.886477, 1.941733, 1, 1, 1, 1, 1,
0.300813, 1.623886, 0.9586766, 1, 1, 1, 1, 1,
0.3060227, -0.3767164, 3.88545, 1, 1, 1, 1, 1,
0.3064387, 0.1044961, -0.457595, 1, 1, 1, 1, 1,
0.3087241, 1.371874, -0.6326948, 1, 1, 1, 1, 1,
0.3103226, 2.112508, 1.944072, 0, 0, 1, 1, 1,
0.3109798, -0.3052936, 1.680758, 1, 0, 0, 1, 1,
0.3118791, -0.6233292, 3.114311, 1, 0, 0, 1, 1,
0.31204, -0.4906138, 2.921927, 1, 0, 0, 1, 1,
0.315493, 0.2255572, 1.219815, 1, 0, 0, 1, 1,
0.3159786, 1.866435, 1.293783, 1, 0, 0, 1, 1,
0.3202667, 0.7189115, 0.6063643, 0, 0, 0, 1, 1,
0.3239048, 0.8154476, 2.077745, 0, 0, 0, 1, 1,
0.3270959, -0.4091526, 3.154587, 0, 0, 0, 1, 1,
0.3282714, 1.642511, 0.07912612, 0, 0, 0, 1, 1,
0.3306597, 1.134154, -0.246329, 0, 0, 0, 1, 1,
0.3389659, -1.491548, 1.145752, 0, 0, 0, 1, 1,
0.3454015, -1.813569, 0.3831307, 0, 0, 0, 1, 1,
0.3459562, -0.2399305, 3.072513, 1, 1, 1, 1, 1,
0.3474302, 1.092548, -0.3254993, 1, 1, 1, 1, 1,
0.3482269, -0.7459629, 1.470888, 1, 1, 1, 1, 1,
0.3486889, -0.2038762, 1.636354, 1, 1, 1, 1, 1,
0.3506662, -0.5054427, 1.203563, 1, 1, 1, 1, 1,
0.3524201, -0.311434, 3.391791, 1, 1, 1, 1, 1,
0.3543388, -1.561823, 2.833298, 1, 1, 1, 1, 1,
0.3587606, -0.4859987, 2.600084, 1, 1, 1, 1, 1,
0.3598911, -1.519686, 2.028814, 1, 1, 1, 1, 1,
0.3621376, 1.134354, -1.467954, 1, 1, 1, 1, 1,
0.3650837, 0.114647, 2.427291, 1, 1, 1, 1, 1,
0.3666637, 0.5591982, 0.8981882, 1, 1, 1, 1, 1,
0.3703266, 0.08974002, 1.602104, 1, 1, 1, 1, 1,
0.3742082, -0.2645715, 2.347837, 1, 1, 1, 1, 1,
0.3770669, 0.3859136, 1.363164, 1, 1, 1, 1, 1,
0.3777629, 0.339521, 1.105021, 0, 0, 1, 1, 1,
0.3835514, 0.422576, 0.469875, 1, 0, 0, 1, 1,
0.3867086, -1.473748, 2.139354, 1, 0, 0, 1, 1,
0.3900145, 0.7883457, 2.156487, 1, 0, 0, 1, 1,
0.390355, 0.371594, 1.717168, 1, 0, 0, 1, 1,
0.3921942, -1.299482, 2.84824, 1, 0, 0, 1, 1,
0.3925351, -0.423579, 0.4250108, 0, 0, 0, 1, 1,
0.3927084, 0.3443904, -0.09957182, 0, 0, 0, 1, 1,
0.3967499, -0.8678223, 4.693826, 0, 0, 0, 1, 1,
0.3967556, 0.5895424, 0.401698, 0, 0, 0, 1, 1,
0.4060337, -0.9517515, 2.961987, 0, 0, 0, 1, 1,
0.415053, -0.4646513, 2.909585, 0, 0, 0, 1, 1,
0.4165667, -0.4027394, 1.438788, 0, 0, 0, 1, 1,
0.4192214, 0.3745512, -0.6250908, 1, 1, 1, 1, 1,
0.4224435, -0.4014637, 3.871726, 1, 1, 1, 1, 1,
0.4226212, -0.8965234, 3.319693, 1, 1, 1, 1, 1,
0.4316829, -0.7403035, 3.151109, 1, 1, 1, 1, 1,
0.4332477, -0.2378864, 1.547266, 1, 1, 1, 1, 1,
0.4337358, -0.9230102, 3.469283, 1, 1, 1, 1, 1,
0.4423417, -1.747486, 2.22724, 1, 1, 1, 1, 1,
0.4469612, -1.042333, 3.644097, 1, 1, 1, 1, 1,
0.4470779, 0.6046155, 1.031487, 1, 1, 1, 1, 1,
0.4517701, 1.636261, -1.160362, 1, 1, 1, 1, 1,
0.4520392, -0.3777573, 2.787818, 1, 1, 1, 1, 1,
0.4523326, 0.0657731, 1.934179, 1, 1, 1, 1, 1,
0.453965, 0.08754376, -0.9169224, 1, 1, 1, 1, 1,
0.4556311, -0.04457881, 1.199971, 1, 1, 1, 1, 1,
0.4568996, -1.195979, 4.882209, 1, 1, 1, 1, 1,
0.4575393, 0.6335407, -0.3012052, 0, 0, 1, 1, 1,
0.4584594, 0.1387377, -0.1731507, 1, 0, 0, 1, 1,
0.4599741, 0.1461194, 0.6085207, 1, 0, 0, 1, 1,
0.4601398, 1.442539, 1.182562, 1, 0, 0, 1, 1,
0.463717, 1.385417, 1.743276, 1, 0, 0, 1, 1,
0.4655347, -0.4979706, 0.7410187, 1, 0, 0, 1, 1,
0.4659453, -0.8907119, 3.258242, 0, 0, 0, 1, 1,
0.4666999, -0.2135084, 0.7073332, 0, 0, 0, 1, 1,
0.4667569, -0.9364724, 1.80012, 0, 0, 0, 1, 1,
0.4826543, 0.253364, 1.568384, 0, 0, 0, 1, 1,
0.4901366, 1.565978, -0.03582169, 0, 0, 0, 1, 1,
0.4909333, 1.487584, 0.3435461, 0, 0, 0, 1, 1,
0.493834, -0.6026052, 1.957527, 0, 0, 0, 1, 1,
0.4961251, -0.6852714, 2.010151, 1, 1, 1, 1, 1,
0.4992077, 0.1121193, 1.822656, 1, 1, 1, 1, 1,
0.4997837, -1.556119, 4.121074, 1, 1, 1, 1, 1,
0.5020834, 1.295356, 0.1923908, 1, 1, 1, 1, 1,
0.5023778, -1.092555, 3.665124, 1, 1, 1, 1, 1,
0.5035466, 0.1386158, 2.390212, 1, 1, 1, 1, 1,
0.5069395, 1.690199, -1.948464, 1, 1, 1, 1, 1,
0.5078197, 0.6745948, 0.2389829, 1, 1, 1, 1, 1,
0.5086628, -0.9733865, 1.128066, 1, 1, 1, 1, 1,
0.5087113, 1.183241, 0.007606424, 1, 1, 1, 1, 1,
0.5202225, 0.1542698, 2.816271, 1, 1, 1, 1, 1,
0.5248715, 1.226957, 0.2224108, 1, 1, 1, 1, 1,
0.5287184, -0.3925185, 3.884267, 1, 1, 1, 1, 1,
0.5288658, 0.5680531, -0.221792, 1, 1, 1, 1, 1,
0.5305095, -0.184398, 0.9646959, 1, 1, 1, 1, 1,
0.5341789, 1.924793, -1.485653, 0, 0, 1, 1, 1,
0.5354, 0.7402306, 0.8299176, 1, 0, 0, 1, 1,
0.5387473, 0.4001953, -0.001228986, 1, 0, 0, 1, 1,
0.5492234, 1.666572, 1.11912, 1, 0, 0, 1, 1,
0.5560387, 0.8792342, -0.3310132, 1, 0, 0, 1, 1,
0.5566358, 0.03195176, 1.331311, 1, 0, 0, 1, 1,
0.557174, -0.9081512, 3.73572, 0, 0, 0, 1, 1,
0.5575661, 1.359867, 1.284526, 0, 0, 0, 1, 1,
0.5595002, 0.4026555, 1.057903, 0, 0, 0, 1, 1,
0.5605741, -0.03797893, 2.642384, 0, 0, 0, 1, 1,
0.5620272, 0.9689043, 0.6711255, 0, 0, 0, 1, 1,
0.5627697, -0.901193, 3.416339, 0, 0, 0, 1, 1,
0.5645798, -0.4711086, 2.45065, 0, 0, 0, 1, 1,
0.5669679, -0.1718029, 2.265086, 1, 1, 1, 1, 1,
0.5696164, -1.221566, 2.940183, 1, 1, 1, 1, 1,
0.5717459, -0.5132821, 3.212495, 1, 1, 1, 1, 1,
0.5846127, -0.1770061, 1.177996, 1, 1, 1, 1, 1,
0.586056, -0.7953916, 1.391418, 1, 1, 1, 1, 1,
0.5914901, 0.2877635, 1.124545, 1, 1, 1, 1, 1,
0.5935406, 0.7463979, 0.2708606, 1, 1, 1, 1, 1,
0.5936533, 1.282578, 1.982144, 1, 1, 1, 1, 1,
0.5997522, 0.7442198, -0.03871034, 1, 1, 1, 1, 1,
0.5998901, -1.192896, 3.354265, 1, 1, 1, 1, 1,
0.6008237, -0.4980782, 3.826378, 1, 1, 1, 1, 1,
0.6099606, -0.1523083, 3.563385, 1, 1, 1, 1, 1,
0.6131822, -2.159897, 0.7554353, 1, 1, 1, 1, 1,
0.6136832, -1.367143, 1.736588, 1, 1, 1, 1, 1,
0.6140937, -0.73164, 2.532557, 1, 1, 1, 1, 1,
0.6173458, 0.5271914, -0.1478718, 0, 0, 1, 1, 1,
0.6195559, -1.266967, 2.640911, 1, 0, 0, 1, 1,
0.6210818, -0.02371607, 2.692205, 1, 0, 0, 1, 1,
0.6229015, 0.1757081, -0.09373578, 1, 0, 0, 1, 1,
0.6276289, 0.437259, -0.2492725, 1, 0, 0, 1, 1,
0.6386136, -0.5667405, 3.367148, 1, 0, 0, 1, 1,
0.6403053, 0.4630492, 2.270436, 0, 0, 0, 1, 1,
0.6425076, 0.7533146, 2.727588, 0, 0, 0, 1, 1,
0.6432635, -0.8862578, 3.34132, 0, 0, 0, 1, 1,
0.6455481, -1.039454, 1.46263, 0, 0, 0, 1, 1,
0.6506472, 0.1899548, 0.9219257, 0, 0, 0, 1, 1,
0.6636775, -0.5292888, 2.465941, 0, 0, 0, 1, 1,
0.6661744, 0.1705767, 1.369164, 0, 0, 0, 1, 1,
0.6688177, -2.090109, 3.971948, 1, 1, 1, 1, 1,
0.6709644, -0.4986203, 2.504611, 1, 1, 1, 1, 1,
0.6728788, -1.848186, 2.809824, 1, 1, 1, 1, 1,
0.6762772, -0.5079309, 2.103127, 1, 1, 1, 1, 1,
0.676412, 0.769138, 1.881515, 1, 1, 1, 1, 1,
0.6769423, -0.1861189, 2.364894, 1, 1, 1, 1, 1,
0.6783802, -1.981592, 2.99544, 1, 1, 1, 1, 1,
0.6797155, -0.3275036, 0.1208307, 1, 1, 1, 1, 1,
0.6818383, 0.01518056, 1.353506, 1, 1, 1, 1, 1,
0.6842386, 0.5539852, 0.7052267, 1, 1, 1, 1, 1,
0.6843016, 0.3303168, 0.3994735, 1, 1, 1, 1, 1,
0.6855071, 0.6852984, 0.5439757, 1, 1, 1, 1, 1,
0.6912848, 0.1609911, 2.662664, 1, 1, 1, 1, 1,
0.6941074, 1.89403, -1.111092, 1, 1, 1, 1, 1,
0.6958737, -0.1486675, 2.558658, 1, 1, 1, 1, 1,
0.7077146, 0.005587757, 2.346926, 0, 0, 1, 1, 1,
0.7082918, -1.641272, 3.394908, 1, 0, 0, 1, 1,
0.7121506, -0.752084, 4.493322, 1, 0, 0, 1, 1,
0.7130088, -0.1793253, 3.512615, 1, 0, 0, 1, 1,
0.7179882, 1.67458, 0.2740121, 1, 0, 0, 1, 1,
0.7210464, -0.7244473, 1.969966, 1, 0, 0, 1, 1,
0.7249405, -0.2397707, 1.544814, 0, 0, 0, 1, 1,
0.7260547, 0.8732341, 0.3950709, 0, 0, 0, 1, 1,
0.7279434, -0.922047, 2.854447, 0, 0, 0, 1, 1,
0.7325534, -0.5018073, 2.29253, 0, 0, 0, 1, 1,
0.7368014, -0.5382164, 2.201194, 0, 0, 0, 1, 1,
0.7463135, 0.4270039, 0.01940848, 0, 0, 0, 1, 1,
0.7544253, -0.4343932, 3.059379, 0, 0, 0, 1, 1,
0.7577499, -1.75023, 2.149892, 1, 1, 1, 1, 1,
0.7583345, 1.636375, 1.063558, 1, 1, 1, 1, 1,
0.7624823, 1.533479, 0.8683072, 1, 1, 1, 1, 1,
0.7704928, -0.7382859, 3.941599, 1, 1, 1, 1, 1,
0.7739851, 0.5152244, 1.340246, 1, 1, 1, 1, 1,
0.7801858, 0.8656389, 1.644169, 1, 1, 1, 1, 1,
0.7839528, -1.785409, 2.186648, 1, 1, 1, 1, 1,
0.7870815, 0.5631972, -0.3821029, 1, 1, 1, 1, 1,
0.793821, -0.6665842, 0.884837, 1, 1, 1, 1, 1,
0.7955953, -0.7951666, 2.317586, 1, 1, 1, 1, 1,
0.7969691, 0.5916233, 0.3618575, 1, 1, 1, 1, 1,
0.7993813, -1.505768, 2.975387, 1, 1, 1, 1, 1,
0.8004134, -0.08675274, 2.870039, 1, 1, 1, 1, 1,
0.8018956, -1.599395, 1.952758, 1, 1, 1, 1, 1,
0.804134, 1.453324, 0.1683219, 1, 1, 1, 1, 1,
0.8066623, 1.334961, 1.071949, 0, 0, 1, 1, 1,
0.8085594, -1.063654, 2.133957, 1, 0, 0, 1, 1,
0.8105715, 0.5166919, -1.452857, 1, 0, 0, 1, 1,
0.8149903, -0.9593642, 3.02234, 1, 0, 0, 1, 1,
0.8159997, -0.259789, 1.879375, 1, 0, 0, 1, 1,
0.8199221, -1.185581, 2.067843, 1, 0, 0, 1, 1,
0.8290039, -0.2040569, 3.331192, 0, 0, 0, 1, 1,
0.829486, -0.9291541, 2.846714, 0, 0, 0, 1, 1,
0.8335953, -0.2879709, 1.526274, 0, 0, 0, 1, 1,
0.8370517, 0.3849188, 2.496674, 0, 0, 0, 1, 1,
0.8375468, 0.7072847, -0.301376, 0, 0, 0, 1, 1,
0.8383954, -0.3222338, 2.703056, 0, 0, 0, 1, 1,
0.8395066, -0.5148647, 3.890595, 0, 0, 0, 1, 1,
0.8400244, 0.6521361, 1.749242, 1, 1, 1, 1, 1,
0.8404933, 1.551204, 0.3564076, 1, 1, 1, 1, 1,
0.8433179, 0.3728125, 0.377012, 1, 1, 1, 1, 1,
0.8436371, 0.7176957, 1.911654, 1, 1, 1, 1, 1,
0.8503579, 0.9203976, 0.9469514, 1, 1, 1, 1, 1,
0.8548965, -0.9834976, 1.482507, 1, 1, 1, 1, 1,
0.8549964, 2.900003, 1.577545, 1, 1, 1, 1, 1,
0.8568615, 0.5862036, 0.2438409, 1, 1, 1, 1, 1,
0.8617914, -0.5192348, 0.832886, 1, 1, 1, 1, 1,
0.8631091, -0.02896901, 2.51601, 1, 1, 1, 1, 1,
0.8643816, 0.3755336, 1.440451, 1, 1, 1, 1, 1,
0.8696656, 0.5354962, -0.04491944, 1, 1, 1, 1, 1,
0.8734102, -0.2841885, 1.966774, 1, 1, 1, 1, 1,
0.8779806, 0.2061537, 1.195398, 1, 1, 1, 1, 1,
0.8798928, 0.9468091, -0.637171, 1, 1, 1, 1, 1,
0.8803518, 0.2195032, 2.073935, 0, 0, 1, 1, 1,
0.8807327, -1.361462, 1.746014, 1, 0, 0, 1, 1,
0.8809084, 1.010073, 0.6715252, 1, 0, 0, 1, 1,
0.8820975, 1.394971, 1.201398, 1, 0, 0, 1, 1,
0.9003063, -0.1612401, 1.813148, 1, 0, 0, 1, 1,
0.9088824, 0.1386044, 2.357757, 1, 0, 0, 1, 1,
0.9103528, -0.2090428, 1.115039, 0, 0, 0, 1, 1,
0.9151305, -1.90969, 1.945212, 0, 0, 0, 1, 1,
0.9234601, 0.0791669, 3.157256, 0, 0, 0, 1, 1,
0.929413, -0.8079043, 3.195984, 0, 0, 0, 1, 1,
0.9332395, -0.2240613, 0.9034653, 0, 0, 0, 1, 1,
0.9340406, 0.7596142, -1.513021, 0, 0, 0, 1, 1,
0.9370637, 0.3236471, 2.288422, 0, 0, 0, 1, 1,
0.9406228, -0.6431601, 0.5497732, 1, 1, 1, 1, 1,
0.9487774, 1.525326, 0.83528, 1, 1, 1, 1, 1,
0.9570443, 1.459566, -0.1277801, 1, 1, 1, 1, 1,
0.9576843, 0.564929, 2.140218, 1, 1, 1, 1, 1,
0.9583967, -1.060395, 2.189803, 1, 1, 1, 1, 1,
0.9680228, 0.2526835, -1.003936, 1, 1, 1, 1, 1,
0.9707487, -0.739216, 2.018986, 1, 1, 1, 1, 1,
0.97147, -1.342322, 2.477163, 1, 1, 1, 1, 1,
0.9722507, 0.7385622, 0.6113999, 1, 1, 1, 1, 1,
0.9739617, -0.2862574, 0.8080072, 1, 1, 1, 1, 1,
0.9750912, 0.8131208, 0.6814476, 1, 1, 1, 1, 1,
0.9756778, -1.481522, 2.510194, 1, 1, 1, 1, 1,
0.9816621, -0.2231726, 1.225674, 1, 1, 1, 1, 1,
0.9819563, 0.5001696, 1.368626, 1, 1, 1, 1, 1,
0.9883672, -0.2041517, 0.3019264, 1, 1, 1, 1, 1,
0.9895131, -0.1354133, 3.283858, 0, 0, 1, 1, 1,
0.9923136, 1.185491, 1.017686, 1, 0, 0, 1, 1,
1.008359, -2.590965, 4.209973, 1, 0, 0, 1, 1,
1.014561, 1.724377, -1.366196, 1, 0, 0, 1, 1,
1.015045, 0.04014495, 0.806039, 1, 0, 0, 1, 1,
1.018968, -0.3740059, 0.5008188, 1, 0, 0, 1, 1,
1.02062, 0.5700411, 0.7234144, 0, 0, 0, 1, 1,
1.024139, -0.1801456, 1.955543, 0, 0, 0, 1, 1,
1.030473, -0.5559979, 1.979606, 0, 0, 0, 1, 1,
1.030571, -1.01027, 3.173767, 0, 0, 0, 1, 1,
1.031754, 0.9129921, 2.04865, 0, 0, 0, 1, 1,
1.033915, 0.6287134, 2.072547, 0, 0, 0, 1, 1,
1.039284, -0.5059006, 0.2412719, 0, 0, 0, 1, 1,
1.04359, 1.423898, 1.780485, 1, 1, 1, 1, 1,
1.045039, 0.1938454, 0.1655969, 1, 1, 1, 1, 1,
1.045047, -1.520639, 3.501837, 1, 1, 1, 1, 1,
1.048362, -0.6641834, 2.465782, 1, 1, 1, 1, 1,
1.052506, -1.208167, 1.771441, 1, 1, 1, 1, 1,
1.066629, 0.4991671, 0.01625136, 1, 1, 1, 1, 1,
1.068558, 0.5559383, 0.4087212, 1, 1, 1, 1, 1,
1.071833, -1.413892, 2.260884, 1, 1, 1, 1, 1,
1.075902, -0.6359271, 3.470395, 1, 1, 1, 1, 1,
1.076692, -0.3695847, 1.623526, 1, 1, 1, 1, 1,
1.08312, -0.7955981, 2.63952, 1, 1, 1, 1, 1,
1.085267, -0.612983, 1.295961, 1, 1, 1, 1, 1,
1.086978, -0.6585087, 2.04785, 1, 1, 1, 1, 1,
1.089195, -0.5154694, 3.805444, 1, 1, 1, 1, 1,
1.095592, 1.273791, 2.622594, 1, 1, 1, 1, 1,
1.099184, 0.5514359, 1.599225, 0, 0, 1, 1, 1,
1.099481, -0.1122402, -0.4618509, 1, 0, 0, 1, 1,
1.101161, -1.323997, 3.0472, 1, 0, 0, 1, 1,
1.106099, 1.783849, 1.067332, 1, 0, 0, 1, 1,
1.107859, 0.8562822, 1.702478, 1, 0, 0, 1, 1,
1.110719, -0.7298543, 1.691878, 1, 0, 0, 1, 1,
1.110924, -0.1399501, 2.149048, 0, 0, 0, 1, 1,
1.111847, -0.1548257, 3.097027, 0, 0, 0, 1, 1,
1.115602, -1.210395, 3.067104, 0, 0, 0, 1, 1,
1.129202, 0.8523505, 0.3027585, 0, 0, 0, 1, 1,
1.153325, -1.004036, 2.997037, 0, 0, 0, 1, 1,
1.158953, 1.904606, 2.232075, 0, 0, 0, 1, 1,
1.159959, 1.662703, 0.7540089, 0, 0, 0, 1, 1,
1.160027, 1.671291, 0.2634643, 1, 1, 1, 1, 1,
1.161535, -0.08080529, 2.335257, 1, 1, 1, 1, 1,
1.162025, -3.04355, 3.027864, 1, 1, 1, 1, 1,
1.165533, 0.9534971, 0.5141061, 1, 1, 1, 1, 1,
1.168482, 0.06384572, 1.120806, 1, 1, 1, 1, 1,
1.172268, -1.138457, 2.441396, 1, 1, 1, 1, 1,
1.179376, 0.3011979, 1.016768, 1, 1, 1, 1, 1,
1.180142, -1.516795, 2.145284, 1, 1, 1, 1, 1,
1.181141, -0.5363003, 3.769282, 1, 1, 1, 1, 1,
1.182035, 0.8158648, 0.8067551, 1, 1, 1, 1, 1,
1.187572, -0.2046954, 2.311472, 1, 1, 1, 1, 1,
1.188046, -0.9363111, 0.2567897, 1, 1, 1, 1, 1,
1.199952, 0.8256403, -1.093687, 1, 1, 1, 1, 1,
1.203503, -0.02933286, 0.7919096, 1, 1, 1, 1, 1,
1.217213, -0.6920004, 2.650415, 1, 1, 1, 1, 1,
1.217709, -1.738822, 1.884446, 0, 0, 1, 1, 1,
1.222704, -0.8538488, 3.262958, 1, 0, 0, 1, 1,
1.259146, 1.288523, 1.170851, 1, 0, 0, 1, 1,
1.262015, 1.025817, 1.311796, 1, 0, 0, 1, 1,
1.267418, 0.8027978, 1.117691, 1, 0, 0, 1, 1,
1.267905, -0.01959164, 1.814768, 1, 0, 0, 1, 1,
1.272586, -0.2510413, 2.95741, 0, 0, 0, 1, 1,
1.279457, 0.3112655, 0.1051161, 0, 0, 0, 1, 1,
1.296445, 1.698168, 0.1427022, 0, 0, 0, 1, 1,
1.302009, -0.8923027, 2.708598, 0, 0, 0, 1, 1,
1.306915, 0.2359162, 1.509195, 0, 0, 0, 1, 1,
1.310044, -1.583907, 2.27604, 0, 0, 0, 1, 1,
1.313483, 0.5037511, 2.821956, 0, 0, 0, 1, 1,
1.317064, 1.451036, -0.5897342, 1, 1, 1, 1, 1,
1.325338, 0.4156358, 1.712351, 1, 1, 1, 1, 1,
1.326593, 1.555794, -0.1018861, 1, 1, 1, 1, 1,
1.32686, -0.5582448, 1.585396, 1, 1, 1, 1, 1,
1.33624, 1.179184, 1.078413, 1, 1, 1, 1, 1,
1.342037, -0.7127339, 2.47888, 1, 1, 1, 1, 1,
1.35084, 0.1002838, 3.206667, 1, 1, 1, 1, 1,
1.359192, -2.001143, 1.50649, 1, 1, 1, 1, 1,
1.361051, 0.1226926, 2.004433, 1, 1, 1, 1, 1,
1.367829, -0.004462434, -0.5180509, 1, 1, 1, 1, 1,
1.37666, -0.9359608, 0.4749324, 1, 1, 1, 1, 1,
1.386681, -0.2288117, 3.40567, 1, 1, 1, 1, 1,
1.393686, -1.399518, 2.105568, 1, 1, 1, 1, 1,
1.405001, -0.7884773, 1.887337, 1, 1, 1, 1, 1,
1.420572, -1.30771, 1.18021, 1, 1, 1, 1, 1,
1.440305, -0.3113942, 1.799614, 0, 0, 1, 1, 1,
1.443431, 0.1662677, 0.6489899, 1, 0, 0, 1, 1,
1.454442, -0.1019488, 2.558904, 1, 0, 0, 1, 1,
1.470637, -0.2987702, 1.99885, 1, 0, 0, 1, 1,
1.512969, 1.555614, 0.9682662, 1, 0, 0, 1, 1,
1.52113, -1.88948, 2.443706, 1, 0, 0, 1, 1,
1.526149, -1.048828, 3.484356, 0, 0, 0, 1, 1,
1.530371, 1.065167, 0.02751389, 0, 0, 0, 1, 1,
1.553014, -1.476018, 2.380597, 0, 0, 0, 1, 1,
1.56462, 0.7761729, 1.341279, 0, 0, 0, 1, 1,
1.565163, -1.361544, 1.554817, 0, 0, 0, 1, 1,
1.57228, -0.01792115, 2.300309, 0, 0, 0, 1, 1,
1.577784, 0.6544074, 2.026371, 0, 0, 0, 1, 1,
1.591918, -0.8256009, 3.243139, 1, 1, 1, 1, 1,
1.614333, -0.4437374, 1.277099, 1, 1, 1, 1, 1,
1.615499, 0.09766999, 0.007268605, 1, 1, 1, 1, 1,
1.622829, -0.2559397, 2.29358, 1, 1, 1, 1, 1,
1.623905, 0.6114123, 0.9288182, 1, 1, 1, 1, 1,
1.628182, 0.5466442, 0.3399753, 1, 1, 1, 1, 1,
1.637512, 0.8390087, 1.154493, 1, 1, 1, 1, 1,
1.646325, 0.2042348, 1.545559, 1, 1, 1, 1, 1,
1.655464, 0.2673596, 0.6873805, 1, 1, 1, 1, 1,
1.685193, 0.8248329, 0.2759652, 1, 1, 1, 1, 1,
1.693368, 1.376065, 0.3525856, 1, 1, 1, 1, 1,
1.700882, -1.324866, 2.849021, 1, 1, 1, 1, 1,
1.709595, -0.05227754, 2.200113, 1, 1, 1, 1, 1,
1.72199, -0.5582457, 0.6709443, 1, 1, 1, 1, 1,
1.72585, 0.1046527, 0.7169269, 1, 1, 1, 1, 1,
1.761726, 1.838987, 0.7674171, 0, 0, 1, 1, 1,
1.772313, 1.874565, 0.7940663, 1, 0, 0, 1, 1,
1.778126, -0.02329234, 2.644246, 1, 0, 0, 1, 1,
1.778612, -0.0970155, 0.8882081, 1, 0, 0, 1, 1,
1.779583, -1.427376, 1.724303, 1, 0, 0, 1, 1,
1.792946, -0.2265357, 1.985338, 1, 0, 0, 1, 1,
1.801127, -0.05966383, 1.679328, 0, 0, 0, 1, 1,
1.815824, -1.098216, 1.813042, 0, 0, 0, 1, 1,
1.816584, 0.5110288, 1.534125, 0, 0, 0, 1, 1,
1.830853, 0.1167467, 0.6439286, 0, 0, 0, 1, 1,
1.840474, -0.0969833, 1.171112, 0, 0, 0, 1, 1,
1.845002, 0.4472601, 3.425552, 0, 0, 0, 1, 1,
1.867972, 0.5146114, 2.191758, 0, 0, 0, 1, 1,
1.871639, 1.354545, -0.006163993, 1, 1, 1, 1, 1,
1.879894, 0.7906184, 1.329615, 1, 1, 1, 1, 1,
1.898736, -0.01929852, 1.265914, 1, 1, 1, 1, 1,
1.920496, -1.673676, 2.841334, 1, 1, 1, 1, 1,
1.951226, 0.1075542, 1.185161, 1, 1, 1, 1, 1,
1.952001, 0.3116324, 1.263671, 1, 1, 1, 1, 1,
2.003078, 1.21161, 1.713587, 1, 1, 1, 1, 1,
2.026376, 0.07182597, 1.879847, 1, 1, 1, 1, 1,
2.045777, 1.85682, 2.894611, 1, 1, 1, 1, 1,
2.066185, 1.213234, -0.2626266, 1, 1, 1, 1, 1,
2.092686, -0.6967066, 3.040451, 1, 1, 1, 1, 1,
2.135786, -0.2460715, 0.9652813, 1, 1, 1, 1, 1,
2.146019, -0.2702672, 3.118959, 1, 1, 1, 1, 1,
2.151349, 0.7960435, 0.8912496, 1, 1, 1, 1, 1,
2.175934, -0.421749, 1.742719, 1, 1, 1, 1, 1,
2.184237, 0.3130992, 1.940732, 0, 0, 1, 1, 1,
2.198405, -0.497272, 1.564701, 1, 0, 0, 1, 1,
2.203582, -0.1453118, 1.24463, 1, 0, 0, 1, 1,
2.208758, 0.1954162, 2.217822, 1, 0, 0, 1, 1,
2.251856, -0.5173942, 2.130476, 1, 0, 0, 1, 1,
2.286611, 0.6393667, 0.7645773, 1, 0, 0, 1, 1,
2.302618, 1.191061, 2.069572, 0, 0, 0, 1, 1,
2.312228, -1.343222, 1.115358, 0, 0, 0, 1, 1,
2.336053, 0.06202593, -0.6514027, 0, 0, 0, 1, 1,
2.452909, -0.4641604, 1.050313, 0, 0, 0, 1, 1,
2.469476, -0.09067615, 2.626914, 0, 0, 0, 1, 1,
2.469751, 1.677529, 1.314656, 0, 0, 0, 1, 1,
2.501317, 1.607765, 1.327507, 0, 0, 0, 1, 1,
2.559582, 0.5344878, 0.5121478, 1, 1, 1, 1, 1,
2.587346, 0.5615779, 3.105459, 1, 1, 1, 1, 1,
2.615345, 0.1673543, 3.437276, 1, 1, 1, 1, 1,
2.698138, 1.591519, 0.8743221, 1, 1, 1, 1, 1,
2.747108, 0.2915711, 2.067147, 1, 1, 1, 1, 1,
2.866248, -0.5827075, 3.416979, 1, 1, 1, 1, 1,
3.083203, -0.3960247, 0.6265777, 1, 1, 1, 1, 1
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
var radius = 9.656301;
var distance = 33.91735;
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
mvMatrix.translate( 0.2650921, 0.3865439, 0.4248605 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.91735);
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