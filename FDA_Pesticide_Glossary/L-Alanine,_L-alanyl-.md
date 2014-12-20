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
-3.533141, -1.323088, -1.59164, 1, 0, 0, 1,
-3.180009, -0.1567252, -0.9153578, 1, 0.007843138, 0, 1,
-2.993066, 1.223707, -2.195344, 1, 0.01176471, 0, 1,
-2.733541, 0.635275, -2.877099, 1, 0.01960784, 0, 1,
-2.662933, 0.5266234, -2.17398, 1, 0.02352941, 0, 1,
-2.645025, -0.7103515, -1.229519, 1, 0.03137255, 0, 1,
-2.638229, 2.424714, 0.6395503, 1, 0.03529412, 0, 1,
-2.597848, -0.2084077, -2.360869, 1, 0.04313726, 0, 1,
-2.531055, -0.9077609, -3.200787, 1, 0.04705882, 0, 1,
-2.47906, -1.331584, -1.910732, 1, 0.05490196, 0, 1,
-2.474472, 0.03785076, -1.390775, 1, 0.05882353, 0, 1,
-2.443181, 0.3036999, -0.9764056, 1, 0.06666667, 0, 1,
-2.342705, -0.08212355, -1.104515, 1, 0.07058824, 0, 1,
-2.322183, 2.906106, -1.43733, 1, 0.07843138, 0, 1,
-2.318719, -0.8382549, -1.836096, 1, 0.08235294, 0, 1,
-2.318558, 1.77654, -0.5102662, 1, 0.09019608, 0, 1,
-2.269115, -0.325095, -2.668765, 1, 0.09411765, 0, 1,
-2.208253, -0.7009416, -2.141785, 1, 0.1019608, 0, 1,
-2.149785, 0.8536537, -1.504658, 1, 0.1098039, 0, 1,
-2.116289, 0.07230093, -0.3985654, 1, 0.1137255, 0, 1,
-2.116193, 1.668526, -0.1589602, 1, 0.1215686, 0, 1,
-2.101048, -0.2936318, -0.9132222, 1, 0.1254902, 0, 1,
-2.05954, -0.2090862, -1.021053, 1, 0.1333333, 0, 1,
-2.039969, -0.8352502, -1.685578, 1, 0.1372549, 0, 1,
-2.011849, 0.3981669, -0.4462721, 1, 0.145098, 0, 1,
-2.005787, -0.6484532, -0.112573, 1, 0.1490196, 0, 1,
-2.005077, 0.5809377, -0.1195536, 1, 0.1568628, 0, 1,
-1.985748, -0.7810286, -1.922251, 1, 0.1607843, 0, 1,
-1.974281, -0.5010241, -1.052317, 1, 0.1686275, 0, 1,
-1.93978, -0.5648603, -1.93788, 1, 0.172549, 0, 1,
-1.898591, -0.5696876, -1.994715, 1, 0.1803922, 0, 1,
-1.8858, -0.1646469, -2.006636, 1, 0.1843137, 0, 1,
-1.877383, 1.742082, 0.8779486, 1, 0.1921569, 0, 1,
-1.83884, -0.5672314, -2.324035, 1, 0.1960784, 0, 1,
-1.829212, 1.601506, -0.2534388, 1, 0.2039216, 0, 1,
-1.828375, 0.6792158, -0.06315631, 1, 0.2117647, 0, 1,
-1.828211, -0.6616271, -1.971725, 1, 0.2156863, 0, 1,
-1.82776, -0.3977216, -1.355773, 1, 0.2235294, 0, 1,
-1.816074, -0.3424475, -1.161225, 1, 0.227451, 0, 1,
-1.805067, 0.01625473, -1.601622, 1, 0.2352941, 0, 1,
-1.792219, -0.3657381, -2.78191, 1, 0.2392157, 0, 1,
-1.790956, 1.277813, -0.6956041, 1, 0.2470588, 0, 1,
-1.772693, 0.7516035, 1.710138, 1, 0.2509804, 0, 1,
-1.765448, 0.2557953, -1.131971, 1, 0.2588235, 0, 1,
-1.749652, -1.592095, -1.891138, 1, 0.2627451, 0, 1,
-1.746343, -0.9239981, -1.789223, 1, 0.2705882, 0, 1,
-1.740729, -0.6224511, -2.034699, 1, 0.2745098, 0, 1,
-1.740138, -0.04487573, -1.094486, 1, 0.282353, 0, 1,
-1.738574, 1.420691, -0.3817334, 1, 0.2862745, 0, 1,
-1.731135, 1.087144, 0.06835069, 1, 0.2941177, 0, 1,
-1.725714, 2.282618, 1.583439, 1, 0.3019608, 0, 1,
-1.723393, 0.5692166, -2.869348, 1, 0.3058824, 0, 1,
-1.723093, 0.6721547, -2.190551, 1, 0.3137255, 0, 1,
-1.717142, 0.1032699, -2.020864, 1, 0.3176471, 0, 1,
-1.707431, 0.2184917, -0.4806364, 1, 0.3254902, 0, 1,
-1.690232, 0.15336, -2.721097, 1, 0.3294118, 0, 1,
-1.689141, 2.543404, 0.1882708, 1, 0.3372549, 0, 1,
-1.68478, 1.873579, -0.9124408, 1, 0.3411765, 0, 1,
-1.662309, 0.8197829, 0.1965398, 1, 0.3490196, 0, 1,
-1.661771, -0.7183159, 0.3836248, 1, 0.3529412, 0, 1,
-1.660854, -0.3083135, -0.8939708, 1, 0.3607843, 0, 1,
-1.660607, 1.847367, -0.8312655, 1, 0.3647059, 0, 1,
-1.653092, 1.105867, -0.9550784, 1, 0.372549, 0, 1,
-1.64125, 0.1174994, -1.748972, 1, 0.3764706, 0, 1,
-1.63648, 0.5254191, -1.869831, 1, 0.3843137, 0, 1,
-1.608549, 1.133884, -1.74, 1, 0.3882353, 0, 1,
-1.602494, -0.1510169, -0.4780033, 1, 0.3960784, 0, 1,
-1.588887, 1.020272, -2.405052, 1, 0.4039216, 0, 1,
-1.572596, 0.3439873, -1.537885, 1, 0.4078431, 0, 1,
-1.560973, 0.8118503, 0.1434025, 1, 0.4156863, 0, 1,
-1.530924, 1.423023, -0.3207836, 1, 0.4196078, 0, 1,
-1.530101, 0.2436333, -1.768552, 1, 0.427451, 0, 1,
-1.526396, -0.7306018, -2.463031, 1, 0.4313726, 0, 1,
-1.514961, -0.05618463, -1.481405, 1, 0.4392157, 0, 1,
-1.514483, -0.06401833, -2.655373, 1, 0.4431373, 0, 1,
-1.506927, 1.49193, -0.8672914, 1, 0.4509804, 0, 1,
-1.49939, 0.6842501, -1.367244, 1, 0.454902, 0, 1,
-1.492498, 0.3608499, -0.8211252, 1, 0.4627451, 0, 1,
-1.482928, 0.08227846, -2.026935, 1, 0.4666667, 0, 1,
-1.475441, 0.1613123, -2.105418, 1, 0.4745098, 0, 1,
-1.473543, -1.390041, -1.29434, 1, 0.4784314, 0, 1,
-1.468762, -0.006891856, -3.129138, 1, 0.4862745, 0, 1,
-1.459635, -0.7906528, -3.04932, 1, 0.4901961, 0, 1,
-1.456749, 1.037126, -1.860589, 1, 0.4980392, 0, 1,
-1.456726, -0.9328559, -2.679464, 1, 0.5058824, 0, 1,
-1.453278, 0.02013299, -0.8487917, 1, 0.509804, 0, 1,
-1.433454, 0.6369227, -1.815957, 1, 0.5176471, 0, 1,
-1.43198, 0.9888858, -1.726968, 1, 0.5215687, 0, 1,
-1.43048, 0.3272947, -1.978446, 1, 0.5294118, 0, 1,
-1.410499, 1.017585, -0.9033459, 1, 0.5333334, 0, 1,
-1.40349, -1.765347, -3.715312, 1, 0.5411765, 0, 1,
-1.38883, -0.3178959, -3.199581, 1, 0.5450981, 0, 1,
-1.388489, -0.2336326, -3.009731, 1, 0.5529412, 0, 1,
-1.385885, 0.8737901, -1.942798, 1, 0.5568628, 0, 1,
-1.379916, -0.9781718, -1.660039, 1, 0.5647059, 0, 1,
-1.378732, -1.55242, -2.901485, 1, 0.5686275, 0, 1,
-1.375596, -0.768188, -1.404043, 1, 0.5764706, 0, 1,
-1.375232, -0.367804, -1.91428, 1, 0.5803922, 0, 1,
-1.358864, 0.6576948, -0.6820855, 1, 0.5882353, 0, 1,
-1.357298, 0.8634235, -0.06681234, 1, 0.5921569, 0, 1,
-1.354702, 0.4721587, -1.84278, 1, 0.6, 0, 1,
-1.348483, -0.4392464, -2.389625, 1, 0.6078432, 0, 1,
-1.338687, 1.176573, -1.494414, 1, 0.6117647, 0, 1,
-1.324491, 0.5844243, -0.1457447, 1, 0.6196079, 0, 1,
-1.319274, 0.8690045, -1.829955, 1, 0.6235294, 0, 1,
-1.315903, 1.523642, 1.053896, 1, 0.6313726, 0, 1,
-1.312614, 1.766436, 0.6342121, 1, 0.6352941, 0, 1,
-1.3044, 1.619183, -0.9827957, 1, 0.6431373, 0, 1,
-1.302772, -1.902678, -2.213321, 1, 0.6470588, 0, 1,
-1.297115, 0.09911775, -3.866616, 1, 0.654902, 0, 1,
-1.294579, 1.579361, -0.8373186, 1, 0.6588235, 0, 1,
-1.279134, 0.4030025, -0.2812229, 1, 0.6666667, 0, 1,
-1.277964, -0.5888947, -0.9698325, 1, 0.6705883, 0, 1,
-1.266984, 1.99045, -0.7698588, 1, 0.6784314, 0, 1,
-1.26311, 0.1749637, -2.224821, 1, 0.682353, 0, 1,
-1.259451, -0.1518501, -1.900952, 1, 0.6901961, 0, 1,
-1.258783, 0.5724829, -1.554143, 1, 0.6941177, 0, 1,
-1.258585, -1.436688, -2.264041, 1, 0.7019608, 0, 1,
-1.252585, 2.484442, -1.774424, 1, 0.7098039, 0, 1,
-1.242926, 0.9637846, -1.550873, 1, 0.7137255, 0, 1,
-1.241595, -0.03622509, -2.301239, 1, 0.7215686, 0, 1,
-1.238144, 1.03838, -0.1961383, 1, 0.7254902, 0, 1,
-1.235701, -0.2200329, -1.651588, 1, 0.7333333, 0, 1,
-1.233929, -1.084251, -2.450417, 1, 0.7372549, 0, 1,
-1.221633, 0.7115653, -2.113922, 1, 0.7450981, 0, 1,
-1.210001, 1.893233, -0.02346496, 1, 0.7490196, 0, 1,
-1.206213, -0.1624939, -1.792347, 1, 0.7568628, 0, 1,
-1.205666, 1.671872, -0.6728569, 1, 0.7607843, 0, 1,
-1.202918, 0.1410936, -0.8482715, 1, 0.7686275, 0, 1,
-1.201227, 0.7938662, -0.1895744, 1, 0.772549, 0, 1,
-1.197999, 1.403618, -0.6987712, 1, 0.7803922, 0, 1,
-1.191646, 0.3415822, -1.38302, 1, 0.7843137, 0, 1,
-1.189922, -0.1020448, -1.107516, 1, 0.7921569, 0, 1,
-1.188121, 1.158399, -0.415198, 1, 0.7960784, 0, 1,
-1.174224, 1.499856, -2.581002, 1, 0.8039216, 0, 1,
-1.171932, -0.9011633, -2.607392, 1, 0.8117647, 0, 1,
-1.171147, -0.3859915, -0.6567672, 1, 0.8156863, 0, 1,
-1.164748, 0.4045954, -0.2548348, 1, 0.8235294, 0, 1,
-1.156723, 0.2341928, -1.843652, 1, 0.827451, 0, 1,
-1.155233, 0.9121395, -1.822531, 1, 0.8352941, 0, 1,
-1.15136, -0.03796102, -1.459428, 1, 0.8392157, 0, 1,
-1.145552, 0.775905, -0.08464932, 1, 0.8470588, 0, 1,
-1.143449, -1.132358, -1.546933, 1, 0.8509804, 0, 1,
-1.142994, 1.010054, 0.9429819, 1, 0.8588235, 0, 1,
-1.142635, -0.9364368, -1.679231, 1, 0.8627451, 0, 1,
-1.139986, 0.03662755, -0.5738774, 1, 0.8705882, 0, 1,
-1.136677, 1.379288, -2.12941, 1, 0.8745098, 0, 1,
-1.135294, 0.07720125, -1.191738, 1, 0.8823529, 0, 1,
-1.133432, 0.5435966, -2.274571, 1, 0.8862745, 0, 1,
-1.115823, -0.7336192, -1.811936, 1, 0.8941177, 0, 1,
-1.114004, -0.966885, -1.470844, 1, 0.8980392, 0, 1,
-1.113442, -0.6003628, -2.139015, 1, 0.9058824, 0, 1,
-1.101479, -0.7146496, -2.287575, 1, 0.9137255, 0, 1,
-1.074633, -1.404793, -2.305368, 1, 0.9176471, 0, 1,
-1.073611, 0.8489619, -1.693552, 1, 0.9254902, 0, 1,
-1.0696, 1.258236, -0.9127375, 1, 0.9294118, 0, 1,
-1.066172, 0.5055321, -1.928059, 1, 0.9372549, 0, 1,
-1.063683, -0.5362561, -2.172387, 1, 0.9411765, 0, 1,
-1.046835, 0.5008472, -0.3325653, 1, 0.9490196, 0, 1,
-1.045464, -1.224743, -1.565691, 1, 0.9529412, 0, 1,
-1.043598, -0.5274684, -1.501009, 1, 0.9607843, 0, 1,
-1.036029, 1.182605, -2.607163, 1, 0.9647059, 0, 1,
-1.033622, 1.183199, -0.6157074, 1, 0.972549, 0, 1,
-1.020507, -0.2763774, -3.57673, 1, 0.9764706, 0, 1,
-1.006457, -0.2528427, -2.701883, 1, 0.9843137, 0, 1,
-1.005253, 0.9906076, -1.115693, 1, 0.9882353, 0, 1,
-0.9952099, -0.6611033, -2.105008, 1, 0.9960784, 0, 1,
-0.9913355, -1.273177, -2.917014, 0.9960784, 1, 0, 1,
-0.9901643, 0.1996867, -2.499933, 0.9921569, 1, 0, 1,
-0.9883862, -0.7260261, -2.930454, 0.9843137, 1, 0, 1,
-0.9787042, -0.8561118, -4.147954, 0.9803922, 1, 0, 1,
-0.9710985, -0.8686007, -1.378512, 0.972549, 1, 0, 1,
-0.9651011, 1.348533, -1.300211, 0.9686275, 1, 0, 1,
-0.951842, 0.4385113, 0.09786279, 0.9607843, 1, 0, 1,
-0.9504861, -0.9440894, -3.466757, 0.9568627, 1, 0, 1,
-0.9482954, 1.592446, 0.2758602, 0.9490196, 1, 0, 1,
-0.9465479, -1.02043, -0.9282683, 0.945098, 1, 0, 1,
-0.9378233, 0.6723657, -1.136974, 0.9372549, 1, 0, 1,
-0.9330958, 0.7854639, -2.001667, 0.9333333, 1, 0, 1,
-0.9326839, -1.443766, -3.604672, 0.9254902, 1, 0, 1,
-0.92575, -0.5174522, 0.1438633, 0.9215686, 1, 0, 1,
-0.925251, -0.06469461, -1.420904, 0.9137255, 1, 0, 1,
-0.9243076, -1.985554, -1.879248, 0.9098039, 1, 0, 1,
-0.920372, -1.555424, -4.301387, 0.9019608, 1, 0, 1,
-0.9054451, 1.116246, -0.9847637, 0.8941177, 1, 0, 1,
-0.9042516, -1.084299, -2.737345, 0.8901961, 1, 0, 1,
-0.9039245, 0.05778704, -1.323927, 0.8823529, 1, 0, 1,
-0.9027539, 0.9436557, -1.671742, 0.8784314, 1, 0, 1,
-0.8983275, 0.5773617, -0.8206851, 0.8705882, 1, 0, 1,
-0.8925181, -0.09516581, -1.320397, 0.8666667, 1, 0, 1,
-0.8871415, 0.0455193, -3.163038, 0.8588235, 1, 0, 1,
-0.8852347, 0.06977087, -1.238726, 0.854902, 1, 0, 1,
-0.8804073, 0.584345, -0.005024252, 0.8470588, 1, 0, 1,
-0.8719552, 1.224631, -0.7821099, 0.8431373, 1, 0, 1,
-0.8684412, -0.3107904, -1.816155, 0.8352941, 1, 0, 1,
-0.8637339, 1.979246, -0.9133085, 0.8313726, 1, 0, 1,
-0.859755, -1.467224, -1.688315, 0.8235294, 1, 0, 1,
-0.8567476, -0.7350214, -2.836903, 0.8196079, 1, 0, 1,
-0.8530722, 1.13517, 0.5787495, 0.8117647, 1, 0, 1,
-0.8458647, -0.5127617, -3.974672, 0.8078431, 1, 0, 1,
-0.8449826, 0.1727108, -2.417343, 0.8, 1, 0, 1,
-0.8445446, 0.4956421, 0.6142868, 0.7921569, 1, 0, 1,
-0.8375447, -0.2373672, -1.545497, 0.7882353, 1, 0, 1,
-0.832727, -1.724216, -2.330465, 0.7803922, 1, 0, 1,
-0.8282979, -0.7029149, -1.463705, 0.7764706, 1, 0, 1,
-0.8269905, 1.415239, -0.4497959, 0.7686275, 1, 0, 1,
-0.8250394, -0.2207851, -2.447819, 0.7647059, 1, 0, 1,
-0.8181338, 0.1402397, -1.966325, 0.7568628, 1, 0, 1,
-0.8039508, 0.5500482, -3.429175, 0.7529412, 1, 0, 1,
-0.7982321, 0.1653116, -0.5269993, 0.7450981, 1, 0, 1,
-0.7979322, 2.107087, -0.0638002, 0.7411765, 1, 0, 1,
-0.7958705, 1.09339, -1.950273, 0.7333333, 1, 0, 1,
-0.771568, 0.04623812, -2.715613, 0.7294118, 1, 0, 1,
-0.7653634, -0.9057031, -3.810674, 0.7215686, 1, 0, 1,
-0.7633765, -0.291053, -2.80466, 0.7176471, 1, 0, 1,
-0.7626554, -0.1329702, -1.82384, 0.7098039, 1, 0, 1,
-0.7589345, 0.5392009, -0.845358, 0.7058824, 1, 0, 1,
-0.7557209, 0.5877208, 0.4746951, 0.6980392, 1, 0, 1,
-0.7518348, 0.09757109, -1.670475, 0.6901961, 1, 0, 1,
-0.7499205, -0.3789828, -0.9517208, 0.6862745, 1, 0, 1,
-0.7438902, -0.3561193, -2.034624, 0.6784314, 1, 0, 1,
-0.7428184, -0.07467677, 0.2662489, 0.6745098, 1, 0, 1,
-0.7425655, -0.7854216, -2.331695, 0.6666667, 1, 0, 1,
-0.7415951, -0.7589999, -1.998156, 0.6627451, 1, 0, 1,
-0.7401809, 1.536735, -0.1829744, 0.654902, 1, 0, 1,
-0.737853, -0.5980129, -1.113016, 0.6509804, 1, 0, 1,
-0.7355424, -1.178066, -3.331907, 0.6431373, 1, 0, 1,
-0.7324694, -0.7643104, -2.443341, 0.6392157, 1, 0, 1,
-0.730629, -0.0290955, -1.972344, 0.6313726, 1, 0, 1,
-0.7252452, -0.08262124, -2.554703, 0.627451, 1, 0, 1,
-0.7213483, 1.666131, -0.4226686, 0.6196079, 1, 0, 1,
-0.7209215, 1.36934, -0.02457726, 0.6156863, 1, 0, 1,
-0.7195925, 0.3672055, -1.655894, 0.6078432, 1, 0, 1,
-0.7165026, -2.11493, -3.112027, 0.6039216, 1, 0, 1,
-0.7162216, -0.3836049, -1.940475, 0.5960785, 1, 0, 1,
-0.7107326, 0.7077938, -0.06833691, 0.5882353, 1, 0, 1,
-0.7091606, 1.104777, -1.001024, 0.5843138, 1, 0, 1,
-0.7077069, -0.8079678, -1.121802, 0.5764706, 1, 0, 1,
-0.6947855, -1.31935, -0.8261437, 0.572549, 1, 0, 1,
-0.6924642, 0.9747052, -1.445773, 0.5647059, 1, 0, 1,
-0.690992, -1.152531, -4.690978, 0.5607843, 1, 0, 1,
-0.6904693, -0.2594463, -2.8493, 0.5529412, 1, 0, 1,
-0.6873557, -0.09104518, -2.387461, 0.5490196, 1, 0, 1,
-0.6871263, -1.413008, -1.866878, 0.5411765, 1, 0, 1,
-0.6862947, -0.5036644, -3.189976, 0.5372549, 1, 0, 1,
-0.6833075, -1.692272, -2.732824, 0.5294118, 1, 0, 1,
-0.6765949, -0.3842988, -2.434229, 0.5254902, 1, 0, 1,
-0.671015, 0.1669513, -2.208481, 0.5176471, 1, 0, 1,
-0.6642932, -0.001434725, -2.282609, 0.5137255, 1, 0, 1,
-0.6588941, 0.8116234, 0.9898595, 0.5058824, 1, 0, 1,
-0.6577668, 0.207277, -2.272629, 0.5019608, 1, 0, 1,
-0.6577351, 0.07991165, -0.8502072, 0.4941176, 1, 0, 1,
-0.6533515, -0.2992824, -1.718126, 0.4862745, 1, 0, 1,
-0.6520481, 1.362475, 1.588611, 0.4823529, 1, 0, 1,
-0.6505522, 0.3595664, -1.172957, 0.4745098, 1, 0, 1,
-0.6498165, 0.9388523, 0.03730989, 0.4705882, 1, 0, 1,
-0.6473089, -0.5773141, -2.439003, 0.4627451, 1, 0, 1,
-0.6455315, 0.1015047, -1.865687, 0.4588235, 1, 0, 1,
-0.6443697, -0.5772718, -1.863102, 0.4509804, 1, 0, 1,
-0.643528, -0.05161027, -0.5957983, 0.4470588, 1, 0, 1,
-0.6413556, -0.9818593, -2.736687, 0.4392157, 1, 0, 1,
-0.6391178, 0.8164176, 1.067183, 0.4352941, 1, 0, 1,
-0.6385387, -1.368134, -2.431881, 0.427451, 1, 0, 1,
-0.6289538, 0.7622548, -1.379691, 0.4235294, 1, 0, 1,
-0.6278325, 0.1189401, -2.484141, 0.4156863, 1, 0, 1,
-0.6244234, -2.400947, -2.913098, 0.4117647, 1, 0, 1,
-0.6188976, -0.4998714, -2.667815, 0.4039216, 1, 0, 1,
-0.6178402, -0.8331257, -2.216507, 0.3960784, 1, 0, 1,
-0.6124253, 0.4477198, -1.030755, 0.3921569, 1, 0, 1,
-0.6094342, 1.118739, -1.059962, 0.3843137, 1, 0, 1,
-0.6081528, 1.930911, 0.08434065, 0.3803922, 1, 0, 1,
-0.6072307, 0.08081084, -2.570536, 0.372549, 1, 0, 1,
-0.6027492, 0.6034312, -1.685443, 0.3686275, 1, 0, 1,
-0.5981125, 1.66125, -0.316898, 0.3607843, 1, 0, 1,
-0.5970023, -1.2495, -3.373306, 0.3568628, 1, 0, 1,
-0.5957628, -0.4202921, -0.7299939, 0.3490196, 1, 0, 1,
-0.5936061, -0.001839872, -0.7593406, 0.345098, 1, 0, 1,
-0.5931311, 1.468108, -1.065543, 0.3372549, 1, 0, 1,
-0.5888268, 0.9792424, 1.147886, 0.3333333, 1, 0, 1,
-0.5870852, 0.6013035, -1.707671, 0.3254902, 1, 0, 1,
-0.5840726, 0.7266636, -0.6758823, 0.3215686, 1, 0, 1,
-0.5816698, 0.5638956, -0.5587034, 0.3137255, 1, 0, 1,
-0.5746795, 0.2535387, -1.033704, 0.3098039, 1, 0, 1,
-0.5733892, -1.087108, -3.876282, 0.3019608, 1, 0, 1,
-0.5727158, -0.2784211, -1.036597, 0.2941177, 1, 0, 1,
-0.5721735, 0.6842275, 1.294561, 0.2901961, 1, 0, 1,
-0.5696337, 1.133223, 0.2444353, 0.282353, 1, 0, 1,
-0.5690349, -1.207714, -2.385752, 0.2784314, 1, 0, 1,
-0.5624164, -0.4962078, 0.07362016, 0.2705882, 1, 0, 1,
-0.561682, 1.938756, 0.1747226, 0.2666667, 1, 0, 1,
-0.5568578, 0.06455807, -0.7936745, 0.2588235, 1, 0, 1,
-0.5536429, 1.212087, -0.8252752, 0.254902, 1, 0, 1,
-0.5531715, -1.246095, -2.732565, 0.2470588, 1, 0, 1,
-0.5493746, 0.2473559, 0.1363818, 0.2431373, 1, 0, 1,
-0.5452931, -1.950802, -3.938993, 0.2352941, 1, 0, 1,
-0.5416667, -0.4320802, -4.179248, 0.2313726, 1, 0, 1,
-0.5395504, 1.080488, -1.762541, 0.2235294, 1, 0, 1,
-0.5353261, -0.7356652, -3.252023, 0.2196078, 1, 0, 1,
-0.5322309, -2.189722, -3.282513, 0.2117647, 1, 0, 1,
-0.5275745, 0.1901437, -1.471849, 0.2078431, 1, 0, 1,
-0.5238186, -2.382585, -2.909189, 0.2, 1, 0, 1,
-0.5225459, -1.610602, -3.311975, 0.1921569, 1, 0, 1,
-0.5212821, -0.9084055, -3.888309, 0.1882353, 1, 0, 1,
-0.5211136, -0.0467205, -2.158943, 0.1803922, 1, 0, 1,
-0.5210898, 0.8371894, -0.5894388, 0.1764706, 1, 0, 1,
-0.520473, -1.902051, -1.387862, 0.1686275, 1, 0, 1,
-0.5198025, -0.9949557, -2.136684, 0.1647059, 1, 0, 1,
-0.5171517, 0.9429784, -2.407808, 0.1568628, 1, 0, 1,
-0.5158662, 0.1988775, 0.7064821, 0.1529412, 1, 0, 1,
-0.5103488, 0.709759, -1.41205, 0.145098, 1, 0, 1,
-0.5086054, 0.5077682, -0.01724926, 0.1411765, 1, 0, 1,
-0.507901, 0.5488636, 0.09023132, 0.1333333, 1, 0, 1,
-0.5070565, 0.5671789, -2.717583, 0.1294118, 1, 0, 1,
-0.5030662, 1.73857, -2.658973, 0.1215686, 1, 0, 1,
-0.5008002, -1.152014, -4.549298, 0.1176471, 1, 0, 1,
-0.4990104, -0.5046992, -4.560585, 0.1098039, 1, 0, 1,
-0.4966988, -0.4489595, -2.822634, 0.1058824, 1, 0, 1,
-0.4963458, -0.2082145, -1.287912, 0.09803922, 1, 0, 1,
-0.4887032, -0.323941, -1.249615, 0.09019608, 1, 0, 1,
-0.4884008, 0.3610165, -0.6858833, 0.08627451, 1, 0, 1,
-0.4868572, -0.2362267, -0.378965, 0.07843138, 1, 0, 1,
-0.4824169, -1.095056, -2.849322, 0.07450981, 1, 0, 1,
-0.4814379, 0.3966471, -1.546749, 0.06666667, 1, 0, 1,
-0.4769569, -0.3154319, -1.683467, 0.0627451, 1, 0, 1,
-0.4759814, -1.045988, -1.419478, 0.05490196, 1, 0, 1,
-0.4705757, 1.781797, -0.3340583, 0.05098039, 1, 0, 1,
-0.4702287, -2.084879, -4.877021, 0.04313726, 1, 0, 1,
-0.4672183, -0.1672096, -2.632797, 0.03921569, 1, 0, 1,
-0.4625395, -0.4367489, -2.054543, 0.03137255, 1, 0, 1,
-0.4581647, 0.3784246, 0.2034735, 0.02745098, 1, 0, 1,
-0.4575773, 1.239223, -2.157678, 0.01960784, 1, 0, 1,
-0.4558159, 1.088533, -0.2049476, 0.01568628, 1, 0, 1,
-0.4556251, 0.5753163, -1.646613, 0.007843138, 1, 0, 1,
-0.4551901, -0.3606938, -2.220504, 0.003921569, 1, 0, 1,
-0.4523325, 0.6381916, -1.643996, 0, 1, 0.003921569, 1,
-0.4517238, 0.9882224, -0.8695093, 0, 1, 0.01176471, 1,
-0.4494437, 1.821792, -0.3331874, 0, 1, 0.01568628, 1,
-0.4400509, -0.5863879, -2.721061, 0, 1, 0.02352941, 1,
-0.4323282, 0.2080469, -0.5563038, 0, 1, 0.02745098, 1,
-0.4311568, 1.034211, -1.122866, 0, 1, 0.03529412, 1,
-0.4270762, 1.974803, 0.328844, 0, 1, 0.03921569, 1,
-0.4241356, -0.03080012, -0.8152708, 0, 1, 0.04705882, 1,
-0.4233601, -0.1599161, -1.319149, 0, 1, 0.05098039, 1,
-0.4219702, 1.254021, 0.8133672, 0, 1, 0.05882353, 1,
-0.420421, 0.868222, -1.233662, 0, 1, 0.0627451, 1,
-0.4176046, -1.770734, -2.664471, 0, 1, 0.07058824, 1,
-0.4151846, 0.3864543, -1.471322, 0, 1, 0.07450981, 1,
-0.4145784, -0.6835653, -3.938594, 0, 1, 0.08235294, 1,
-0.4069297, 0.08670276, -1.756832, 0, 1, 0.08627451, 1,
-0.4056328, 0.385189, 1.34802, 0, 1, 0.09411765, 1,
-0.4013365, -0.2046922, -0.9918728, 0, 1, 0.1019608, 1,
-0.3980743, -1.257733, -3.294942, 0, 1, 0.1058824, 1,
-0.3951082, 0.5001489, -0.1354649, 0, 1, 0.1137255, 1,
-0.392845, 0.2924328, -0.3325789, 0, 1, 0.1176471, 1,
-0.3880383, -0.4621588, -3.242154, 0, 1, 0.1254902, 1,
-0.3823542, 0.6855694, -0.7801828, 0, 1, 0.1294118, 1,
-0.3823264, -0.6497049, -3.93721, 0, 1, 0.1372549, 1,
-0.3814703, 1.504416, 0.3117211, 0, 1, 0.1411765, 1,
-0.3806881, -0.2677242, -2.44205, 0, 1, 0.1490196, 1,
-0.3624969, 0.686141, -0.5292415, 0, 1, 0.1529412, 1,
-0.3598838, -1.663881, -2.700302, 0, 1, 0.1607843, 1,
-0.3572356, 1.310963, -1.397201, 0, 1, 0.1647059, 1,
-0.355696, -0.05946048, -4.427802, 0, 1, 0.172549, 1,
-0.3548935, -1.501903, -2.741117, 0, 1, 0.1764706, 1,
-0.3530421, -0.8838288, -2.441438, 0, 1, 0.1843137, 1,
-0.3519341, -0.4272715, -3.954919, 0, 1, 0.1882353, 1,
-0.3517711, -0.879144, -2.66044, 0, 1, 0.1960784, 1,
-0.3483845, 0.6652857, -1.919146, 0, 1, 0.2039216, 1,
-0.3483514, -0.9685643, -2.913805, 0, 1, 0.2078431, 1,
-0.3482751, 0.8674531, -3.007129, 0, 1, 0.2156863, 1,
-0.3476875, 0.03294019, -2.402347, 0, 1, 0.2196078, 1,
-0.3476162, 0.4170393, -2.114412, 0, 1, 0.227451, 1,
-0.3458454, -0.9555316, -2.689973, 0, 1, 0.2313726, 1,
-0.3457507, 2.230822, -0.7089546, 0, 1, 0.2392157, 1,
-0.3448043, -0.1992865, -1.675447, 0, 1, 0.2431373, 1,
-0.3405831, -0.3396774, -1.721668, 0, 1, 0.2509804, 1,
-0.3382014, -0.9098179, -5.082814, 0, 1, 0.254902, 1,
-0.333858, 0.7223508, -0.6435046, 0, 1, 0.2627451, 1,
-0.3295036, 0.3781693, -0.5542392, 0, 1, 0.2666667, 1,
-0.3293071, 0.4643476, -2.125913, 0, 1, 0.2745098, 1,
-0.3173541, -0.4185059, -1.341118, 0, 1, 0.2784314, 1,
-0.3054923, -1.423927, -2.72955, 0, 1, 0.2862745, 1,
-0.2968693, -0.1056985, -1.833452, 0, 1, 0.2901961, 1,
-0.2901627, -0.3310404, -2.336151, 0, 1, 0.2980392, 1,
-0.2896657, 0.6763493, 1.318269, 0, 1, 0.3058824, 1,
-0.286165, 0.2515346, -1.021616, 0, 1, 0.3098039, 1,
-0.2860968, 0.5100544, -0.1431905, 0, 1, 0.3176471, 1,
-0.283961, 1.067318, 0.06312395, 0, 1, 0.3215686, 1,
-0.2835873, -0.2063544, -2.213651, 0, 1, 0.3294118, 1,
-0.2809932, 1.061293, -1.327209, 0, 1, 0.3333333, 1,
-0.275265, -1.066993, -1.303543, 0, 1, 0.3411765, 1,
-0.2648719, 0.5835516, -2.383925, 0, 1, 0.345098, 1,
-0.2598091, -0.2102485, -0.5254232, 0, 1, 0.3529412, 1,
-0.2562007, -0.3546617, -2.311939, 0, 1, 0.3568628, 1,
-0.2403883, -0.4202303, -3.93173, 0, 1, 0.3647059, 1,
-0.2388054, -1.491023, -2.98117, 0, 1, 0.3686275, 1,
-0.2377779, 0.9340659, -0.9527342, 0, 1, 0.3764706, 1,
-0.2364014, -1.302207, -2.88064, 0, 1, 0.3803922, 1,
-0.2342733, -0.2382132, -2.760784, 0, 1, 0.3882353, 1,
-0.2291225, 0.6086322, -1.064961, 0, 1, 0.3921569, 1,
-0.2272214, 0.4513401, -1.475049, 0, 1, 0.4, 1,
-0.2246456, -1.442605, -1.896196, 0, 1, 0.4078431, 1,
-0.2243727, 0.7570422, -0.6303783, 0, 1, 0.4117647, 1,
-0.2207178, -0.0009596244, -1.036946, 0, 1, 0.4196078, 1,
-0.2110806, -0.5580772, -3.268237, 0, 1, 0.4235294, 1,
-0.2103423, 0.537176, -1.541817, 0, 1, 0.4313726, 1,
-0.2096966, -0.09663978, -2.415289, 0, 1, 0.4352941, 1,
-0.209228, 0.1511888, -0.9048219, 0, 1, 0.4431373, 1,
-0.2045138, 1.343503, 0.696829, 0, 1, 0.4470588, 1,
-0.200284, -1.445738, -2.643423, 0, 1, 0.454902, 1,
-0.1971337, 1.517068, -1.191629, 0, 1, 0.4588235, 1,
-0.1964879, -0.801353, -3.077141, 0, 1, 0.4666667, 1,
-0.1954904, -1.560379, -2.800586, 0, 1, 0.4705882, 1,
-0.1936433, 0.6196725, -1.574615, 0, 1, 0.4784314, 1,
-0.191038, 0.2834042, -0.4502808, 0, 1, 0.4823529, 1,
-0.1876538, -1.891647, -3.39526, 0, 1, 0.4901961, 1,
-0.18584, 1.735409, 0.1661573, 0, 1, 0.4941176, 1,
-0.1845487, -0.5195981, -2.104866, 0, 1, 0.5019608, 1,
-0.1789633, -0.2939668, -2.249949, 0, 1, 0.509804, 1,
-0.1769946, -0.00933479, -2.551009, 0, 1, 0.5137255, 1,
-0.1757569, -3.072973, -3.861886, 0, 1, 0.5215687, 1,
-0.17543, 0.3996339, 1.133432, 0, 1, 0.5254902, 1,
-0.1745137, -0.675675, -2.544065, 0, 1, 0.5333334, 1,
-0.1721293, 0.1960684, -0.4856701, 0, 1, 0.5372549, 1,
-0.1717135, -0.3023237, -0.6391663, 0, 1, 0.5450981, 1,
-0.1681573, -0.1489049, -1.4943, 0, 1, 0.5490196, 1,
-0.1639937, 0.5582861, -0.3027013, 0, 1, 0.5568628, 1,
-0.1628113, -0.09535686, -0.7739862, 0, 1, 0.5607843, 1,
-0.1612764, -1.231558, -2.871226, 0, 1, 0.5686275, 1,
-0.1587579, 0.4305783, 1.489306, 0, 1, 0.572549, 1,
-0.1530567, 1.225963, 0.549592, 0, 1, 0.5803922, 1,
-0.1530346, -1.482196, -2.625437, 0, 1, 0.5843138, 1,
-0.1518351, -0.3231688, -2.553906, 0, 1, 0.5921569, 1,
-0.1507519, -0.6608993, -3.824096, 0, 1, 0.5960785, 1,
-0.1505487, 0.09161168, -1.15206, 0, 1, 0.6039216, 1,
-0.1488105, 2.002691, 0.3225439, 0, 1, 0.6117647, 1,
-0.1483829, 0.9374592, 0.1648275, 0, 1, 0.6156863, 1,
-0.1469466, 0.1968838, -1.380527, 0, 1, 0.6235294, 1,
-0.1444147, -1.439035, -3.594428, 0, 1, 0.627451, 1,
-0.1441141, 0.05851318, -1.447066, 0, 1, 0.6352941, 1,
-0.139873, 1.258451, 0.003763411, 0, 1, 0.6392157, 1,
-0.1373097, 0.9081836, -0.1262381, 0, 1, 0.6470588, 1,
-0.1355043, 1.538473, -2.024017, 0, 1, 0.6509804, 1,
-0.1352537, -0.3422193, -2.356124, 0, 1, 0.6588235, 1,
-0.134339, 0.08294984, -1.742916, 0, 1, 0.6627451, 1,
-0.1339268, -0.5383203, -2.662005, 0, 1, 0.6705883, 1,
-0.1334917, -1.133553, -3.283786, 0, 1, 0.6745098, 1,
-0.1322884, 0.1311636, -2.703708, 0, 1, 0.682353, 1,
-0.1320721, 0.1702204, 0.4286791, 0, 1, 0.6862745, 1,
-0.1305527, -0.3596675, -3.831494, 0, 1, 0.6941177, 1,
-0.1296296, 2.541953, 0.6152731, 0, 1, 0.7019608, 1,
-0.1223363, -0.4314835, -1.159832, 0, 1, 0.7058824, 1,
-0.1198401, -1.540687, -2.074553, 0, 1, 0.7137255, 1,
-0.1181, -1.294189, -2.404152, 0, 1, 0.7176471, 1,
-0.1162244, -1.005432, -3.419181, 0, 1, 0.7254902, 1,
-0.1156744, 1.495607, 0.478428, 0, 1, 0.7294118, 1,
-0.1144333, 0.9090068, -0.1306563, 0, 1, 0.7372549, 1,
-0.1124918, 1.036174, -0.54028, 0, 1, 0.7411765, 1,
-0.1082431, -0.08223794, -1.390919, 0, 1, 0.7490196, 1,
-0.1056325, 2.415783, -1.418349, 0, 1, 0.7529412, 1,
-0.1032887, 0.958047, -0.7212387, 0, 1, 0.7607843, 1,
-0.1007772, 0.7973458, 0.4385259, 0, 1, 0.7647059, 1,
-0.09391058, -0.4435499, -2.700955, 0, 1, 0.772549, 1,
-0.08996978, 1.734901, -0.7661015, 0, 1, 0.7764706, 1,
-0.08902998, 1.639882, 1.001949, 0, 1, 0.7843137, 1,
-0.08812372, -0.5427184, -3.744977, 0, 1, 0.7882353, 1,
-0.07565255, 0.169891, -0.3211305, 0, 1, 0.7960784, 1,
-0.07347149, 2.11161, -2.047989, 0, 1, 0.8039216, 1,
-0.07000265, -1.781583, -2.011236, 0, 1, 0.8078431, 1,
-0.06961647, 3.408839, 1.582689, 0, 1, 0.8156863, 1,
-0.06785603, 1.488287, 0.9397885, 0, 1, 0.8196079, 1,
-0.0672281, -0.5279486, -2.107328, 0, 1, 0.827451, 1,
-0.06504566, -1.18426, -2.869169, 0, 1, 0.8313726, 1,
-0.06045631, -0.1262511, -4.404806, 0, 1, 0.8392157, 1,
-0.05921765, 0.1157011, -0.7903749, 0, 1, 0.8431373, 1,
-0.05799652, -1.26319, -3.747052, 0, 1, 0.8509804, 1,
-0.05750405, -0.7349846, -1.890568, 0, 1, 0.854902, 1,
-0.05576213, -1.052023, -3.930048, 0, 1, 0.8627451, 1,
-0.05435123, 0.2114735, 0.9827667, 0, 1, 0.8666667, 1,
-0.05362105, -0.3928694, -3.702767, 0, 1, 0.8745098, 1,
-0.05155133, 1.098313, -0.4290162, 0, 1, 0.8784314, 1,
-0.05024654, -0.08453906, -4.178165, 0, 1, 0.8862745, 1,
-0.04838761, 0.7724824, -1.7044, 0, 1, 0.8901961, 1,
-0.04725603, 0.6535116, 1.539304, 0, 1, 0.8980392, 1,
-0.04614128, 0.2021661, -0.8745716, 0, 1, 0.9058824, 1,
-0.03686168, -0.01295628, -0.8862444, 0, 1, 0.9098039, 1,
-0.03562237, 1.806831, -0.8437179, 0, 1, 0.9176471, 1,
-0.03391735, 0.7436947, 0.3972078, 0, 1, 0.9215686, 1,
-0.03136097, -0.5386514, -3.484904, 0, 1, 0.9294118, 1,
-0.03087046, -0.6448306, -3.273301, 0, 1, 0.9333333, 1,
-0.02393387, 1.116697, -2.134668, 0, 1, 0.9411765, 1,
-0.02214268, -0.3710994, -1.716338, 0, 1, 0.945098, 1,
-0.01544149, 0.3182075, 0.1917303, 0, 1, 0.9529412, 1,
-0.01399039, 1.12095, 1.75739, 0, 1, 0.9568627, 1,
-0.01231671, -0.5830953, -1.664571, 0, 1, 0.9647059, 1,
-0.01123159, -0.3031876, -3.266877, 0, 1, 0.9686275, 1,
-0.009906625, -0.3898862, -4.451418, 0, 1, 0.9764706, 1,
-0.005702351, -0.6153941, -3.908918, 0, 1, 0.9803922, 1,
-0.00020029, -0.2805677, -2.624387, 0, 1, 0.9882353, 1,
0.002490451, 0.09899029, -0.002700305, 0, 1, 0.9921569, 1,
0.003893475, -0.07140759, 3.446515, 0, 1, 1, 1,
0.005807108, -0.8847586, 2.033415, 0, 0.9921569, 1, 1,
0.006995156, -0.1353586, 2.266667, 0, 0.9882353, 1, 1,
0.007532461, 2.411748, -0.7666845, 0, 0.9803922, 1, 1,
0.009066, -0.6265309, 3.758869, 0, 0.9764706, 1, 1,
0.01130971, -1.181556, 3.200883, 0, 0.9686275, 1, 1,
0.0122958, -0.05577611, 2.927275, 0, 0.9647059, 1, 1,
0.01334181, -1.088461, 1.902376, 0, 0.9568627, 1, 1,
0.01617619, -0.1941281, 2.619734, 0, 0.9529412, 1, 1,
0.01657906, 1.53531, -1.256191, 0, 0.945098, 1, 1,
0.01685679, 0.5318559, -0.9511881, 0, 0.9411765, 1, 1,
0.01833336, -0.3280265, 3.44777, 0, 0.9333333, 1, 1,
0.01956927, 0.2028623, 1.337359, 0, 0.9294118, 1, 1,
0.02068656, 0.5375901, -0.5406158, 0, 0.9215686, 1, 1,
0.02509888, 1.250317, 0.6283479, 0, 0.9176471, 1, 1,
0.0252354, -2.435, 2.172832, 0, 0.9098039, 1, 1,
0.02543296, 0.5054998, 1.601098, 0, 0.9058824, 1, 1,
0.02593774, 0.9085684, -0.3933771, 0, 0.8980392, 1, 1,
0.03405732, -1.117017, 1.478426, 0, 0.8901961, 1, 1,
0.04192337, -0.4991814, 2.176921, 0, 0.8862745, 1, 1,
0.04219917, 0.2675023, 0.298529, 0, 0.8784314, 1, 1,
0.04688124, -0.5265922, 4.240488, 0, 0.8745098, 1, 1,
0.04853154, -1.350356, 4.359655, 0, 0.8666667, 1, 1,
0.05080039, -0.9003575, 1.92893, 0, 0.8627451, 1, 1,
0.05154444, 0.5119964, -0.120646, 0, 0.854902, 1, 1,
0.05260626, -1.147703, 2.670764, 0, 0.8509804, 1, 1,
0.05615507, -0.4980267, 3.696412, 0, 0.8431373, 1, 1,
0.05903627, 0.1027865, 0.04027178, 0, 0.8392157, 1, 1,
0.06018859, 0.6968741, -0.155515, 0, 0.8313726, 1, 1,
0.06373946, 1.845576, -0.8203813, 0, 0.827451, 1, 1,
0.06411385, -2.66873, 4.991887, 0, 0.8196079, 1, 1,
0.07095648, -0.596051, 4.170227, 0, 0.8156863, 1, 1,
0.0712832, -1.625901, 2.014673, 0, 0.8078431, 1, 1,
0.07254774, -0.7902793, 4.477495, 0, 0.8039216, 1, 1,
0.07583831, -1.108032, 1.98306, 0, 0.7960784, 1, 1,
0.07670131, 0.5677968, -0.7059919, 0, 0.7882353, 1, 1,
0.07749835, 0.4767104, -2.174828, 0, 0.7843137, 1, 1,
0.08108681, -2.699682, 2.308886, 0, 0.7764706, 1, 1,
0.08250445, -1.114584, 2.66449, 0, 0.772549, 1, 1,
0.08566797, -1.325456, 2.33356, 0, 0.7647059, 1, 1,
0.08568244, 1.379333, -1.786036, 0, 0.7607843, 1, 1,
0.08900565, -0.01885614, 1.53413, 0, 0.7529412, 1, 1,
0.08948024, -0.931898, 2.201963, 0, 0.7490196, 1, 1,
0.0898398, 0.003775329, 1.590349, 0, 0.7411765, 1, 1,
0.09064447, 0.76004, 1.39938, 0, 0.7372549, 1, 1,
0.09155002, 0.8884557, 0.8789368, 0, 0.7294118, 1, 1,
0.09204581, -0.2443994, 1.632929, 0, 0.7254902, 1, 1,
0.09488276, -0.03866939, 2.815834, 0, 0.7176471, 1, 1,
0.09501726, 2.727981, 2.036632, 0, 0.7137255, 1, 1,
0.1007538, -0.4799138, 1.653813, 0, 0.7058824, 1, 1,
0.1011865, -0.04648195, 1.002619, 0, 0.6980392, 1, 1,
0.1013086, 1.295931, 0.7111062, 0, 0.6941177, 1, 1,
0.1015874, -1.306873, 2.091654, 0, 0.6862745, 1, 1,
0.1030331, -0.4356773, 2.917575, 0, 0.682353, 1, 1,
0.1062889, -0.390779, 3.942471, 0, 0.6745098, 1, 1,
0.1064026, -2.118442, 2.628707, 0, 0.6705883, 1, 1,
0.1087104, -0.7319148, 1.668691, 0, 0.6627451, 1, 1,
0.1098802, 1.167156, -1.051845, 0, 0.6588235, 1, 1,
0.1104274, 1.027403, -0.8069035, 0, 0.6509804, 1, 1,
0.1190616, -1.834165, 3.342577, 0, 0.6470588, 1, 1,
0.1193483, -0.04562519, 1.964279, 0, 0.6392157, 1, 1,
0.1279328, 1.575544, -0.7580321, 0, 0.6352941, 1, 1,
0.1303729, -2.289301, 1.637377, 0, 0.627451, 1, 1,
0.1359234, -0.005433531, 1.973802, 0, 0.6235294, 1, 1,
0.1371686, -1.000719, 4.060187, 0, 0.6156863, 1, 1,
0.1395524, -0.2617501, 2.539615, 0, 0.6117647, 1, 1,
0.141253, 0.3364963, 0.1368526, 0, 0.6039216, 1, 1,
0.1421728, 0.1948799, 1.779215, 0, 0.5960785, 1, 1,
0.1464077, -1.462439, 2.915271, 0, 0.5921569, 1, 1,
0.152243, 1.423441, 2.056653, 0, 0.5843138, 1, 1,
0.1554406, -2.276709, 3.627275, 0, 0.5803922, 1, 1,
0.159037, 1.029796, 1.566059, 0, 0.572549, 1, 1,
0.1599987, 0.9054049, 1.34578, 0, 0.5686275, 1, 1,
0.1664421, -0.6070053, 2.626443, 0, 0.5607843, 1, 1,
0.17441, 0.4093647, -0.6603302, 0, 0.5568628, 1, 1,
0.1772411, -0.1076409, 0.8807369, 0, 0.5490196, 1, 1,
0.1773325, -0.5816236, 1.845099, 0, 0.5450981, 1, 1,
0.1786407, 0.7325292, 0.310286, 0, 0.5372549, 1, 1,
0.183502, 0.4348524, -0.3662512, 0, 0.5333334, 1, 1,
0.1835233, -2.377219, 2.517984, 0, 0.5254902, 1, 1,
0.1836277, 0.7086921, -0.5199872, 0, 0.5215687, 1, 1,
0.185344, -2.291224, 3.882914, 0, 0.5137255, 1, 1,
0.1897543, -0.7752654, 2.109069, 0, 0.509804, 1, 1,
0.1909036, 0.2069893, -1.206885, 0, 0.5019608, 1, 1,
0.1935316, -0.115366, 1.304792, 0, 0.4941176, 1, 1,
0.1977672, -1.631925, 0.8059124, 0, 0.4901961, 1, 1,
0.2009586, -0.6721776, 1.734848, 0, 0.4823529, 1, 1,
0.2057297, -1.723505, 2.655815, 0, 0.4784314, 1, 1,
0.2069223, -0.3722413, 2.907762, 0, 0.4705882, 1, 1,
0.2100676, 0.1232782, -0.2868781, 0, 0.4666667, 1, 1,
0.2173915, -0.4517199, 3.044538, 0, 0.4588235, 1, 1,
0.2178068, -1.521384, 4.317574, 0, 0.454902, 1, 1,
0.2207466, 0.99545, -0.4220973, 0, 0.4470588, 1, 1,
0.2232387, 0.6537826, 1.27186, 0, 0.4431373, 1, 1,
0.2265375, 0.3972225, 1.876741, 0, 0.4352941, 1, 1,
0.2278471, -0.8297554, 2.948529, 0, 0.4313726, 1, 1,
0.2280712, 1.125157, -0.4965181, 0, 0.4235294, 1, 1,
0.2288215, -0.4915713, 3.440059, 0, 0.4196078, 1, 1,
0.2320104, -1.761419, 2.008964, 0, 0.4117647, 1, 1,
0.2326328, 0.04977055, 3.101436, 0, 0.4078431, 1, 1,
0.2331081, -1.203818, 4.03383, 0, 0.4, 1, 1,
0.2364893, 0.5726551, 2.335966, 0, 0.3921569, 1, 1,
0.24241, 0.7475241, 1.726695, 0, 0.3882353, 1, 1,
0.2425162, 0.8891856, 1.085765, 0, 0.3803922, 1, 1,
0.2444516, 0.1745319, 3.127885, 0, 0.3764706, 1, 1,
0.2462865, -0.4685627, 2.06649, 0, 0.3686275, 1, 1,
0.2466485, 1.153077, 0.2001156, 0, 0.3647059, 1, 1,
0.2506012, -0.121061, 1.628556, 0, 0.3568628, 1, 1,
0.2536758, 0.7750524, -0.232926, 0, 0.3529412, 1, 1,
0.2615543, -0.06740542, 1.394183, 0, 0.345098, 1, 1,
0.2667736, 0.7065384, 0.2899434, 0, 0.3411765, 1, 1,
0.2683164, 0.6834966, 0.0551814, 0, 0.3333333, 1, 1,
0.2716562, 1.007951, -0.339306, 0, 0.3294118, 1, 1,
0.2718267, -0.2749978, 3.470511, 0, 0.3215686, 1, 1,
0.2741967, -1.490603, 2.183025, 0, 0.3176471, 1, 1,
0.2751241, 0.2359849, 0.2379934, 0, 0.3098039, 1, 1,
0.2764158, -0.6568583, 1.96213, 0, 0.3058824, 1, 1,
0.2780377, -1.320346, 2.781774, 0, 0.2980392, 1, 1,
0.2782447, 0.2240792, 1.479399, 0, 0.2901961, 1, 1,
0.2800274, 0.8340893, -1.075902, 0, 0.2862745, 1, 1,
0.2801285, 1.053804, -0.01464565, 0, 0.2784314, 1, 1,
0.2820278, 0.8520749, -0.5199862, 0, 0.2745098, 1, 1,
0.2844443, 0.302041, 1.718394, 0, 0.2666667, 1, 1,
0.2849347, -0.3044662, 1.223849, 0, 0.2627451, 1, 1,
0.2858565, -1.647908, 4.582366, 0, 0.254902, 1, 1,
0.2890672, 1.360578, -1.176188, 0, 0.2509804, 1, 1,
0.2901527, 0.07520597, -0.3182, 0, 0.2431373, 1, 1,
0.2953056, -0.8255593, 4.463744, 0, 0.2392157, 1, 1,
0.2957045, 0.9072987, 0.6784539, 0, 0.2313726, 1, 1,
0.2958747, 0.6401395, 0.7311921, 0, 0.227451, 1, 1,
0.2985603, 0.1248901, 2.20155, 0, 0.2196078, 1, 1,
0.2993412, 2.075907, 0.4270456, 0, 0.2156863, 1, 1,
0.3001499, -0.8135017, 3.496666, 0, 0.2078431, 1, 1,
0.3043563, 2.234421, 0.6746959, 0, 0.2039216, 1, 1,
0.3058868, -0.2030553, 2.122481, 0, 0.1960784, 1, 1,
0.3059629, 0.2191524, -0.9239087, 0, 0.1882353, 1, 1,
0.3064382, -0.8045869, 3.792705, 0, 0.1843137, 1, 1,
0.3094848, -0.4875719, 3.553356, 0, 0.1764706, 1, 1,
0.313104, -0.5543436, 2.533831, 0, 0.172549, 1, 1,
0.3136701, 0.9362695, 1.772372, 0, 0.1647059, 1, 1,
0.3197409, -1.289062, 4.082894, 0, 0.1607843, 1, 1,
0.3199827, -0.3596134, 2.648026, 0, 0.1529412, 1, 1,
0.3241998, 0.2330024, 1.359942, 0, 0.1490196, 1, 1,
0.3308564, 0.5427498, 0.1996344, 0, 0.1411765, 1, 1,
0.3340001, -0.4399652, 1.816756, 0, 0.1372549, 1, 1,
0.3366064, -1.685277, 3.072545, 0, 0.1294118, 1, 1,
0.3391138, -0.2251072, 1.72067, 0, 0.1254902, 1, 1,
0.344419, -0.3819527, 1.674587, 0, 0.1176471, 1, 1,
0.3448166, 0.3382305, 0.5618345, 0, 0.1137255, 1, 1,
0.3476326, -0.5494657, 2.030209, 0, 0.1058824, 1, 1,
0.3517101, 2.035895, 0.7119682, 0, 0.09803922, 1, 1,
0.3527972, 0.9441882, -0.2485781, 0, 0.09411765, 1, 1,
0.356666, -0.3127558, 3.437377, 0, 0.08627451, 1, 1,
0.358964, 0.3548933, -1.066243, 0, 0.08235294, 1, 1,
0.3593697, -0.9366026, 3.850217, 0, 0.07450981, 1, 1,
0.3619241, -0.5511165, 3.295363, 0, 0.07058824, 1, 1,
0.3621747, -0.2054421, 2.976561, 0, 0.0627451, 1, 1,
0.3655925, -0.8722773, 3.152761, 0, 0.05882353, 1, 1,
0.3690706, -1.244453, 1.128942, 0, 0.05098039, 1, 1,
0.3710389, -1.089172, 2.533825, 0, 0.04705882, 1, 1,
0.3731104, -0.8771234, 3.569089, 0, 0.03921569, 1, 1,
0.3752719, 0.1412199, 1.896234, 0, 0.03529412, 1, 1,
0.3769898, 0.3014191, 1.404935, 0, 0.02745098, 1, 1,
0.3786072, 0.9340866, -0.1946953, 0, 0.02352941, 1, 1,
0.3802889, -0.166065, -0.156764, 0, 0.01568628, 1, 1,
0.3866814, -1.89426, 2.366294, 0, 0.01176471, 1, 1,
0.3989319, 0.2498244, 0.7901813, 0, 0.003921569, 1, 1,
0.4008358, -0.6644191, 2.234141, 0.003921569, 0, 1, 1,
0.4030237, -0.2319237, 1.921581, 0.007843138, 0, 1, 1,
0.4061504, 0.5492699, -0.05250321, 0.01568628, 0, 1, 1,
0.4106792, -0.4116977, 2.348649, 0.01960784, 0, 1, 1,
0.4109751, 1.354482, 0.8040001, 0.02745098, 0, 1, 1,
0.4119461, -1.805039, 4.433435, 0.03137255, 0, 1, 1,
0.4120213, -0.6521131, 3.030236, 0.03921569, 0, 1, 1,
0.4136046, -0.8499045, 3.650016, 0.04313726, 0, 1, 1,
0.4217429, 0.09337727, 1.903553, 0.05098039, 0, 1, 1,
0.4218689, -0.662533, 1.846428, 0.05490196, 0, 1, 1,
0.4247293, 1.793719, 2.334371, 0.0627451, 0, 1, 1,
0.428049, -0.3227604, 2.551879, 0.06666667, 0, 1, 1,
0.4305777, -0.1989306, 2.299358, 0.07450981, 0, 1, 1,
0.438639, 1.438088, 0.1157563, 0.07843138, 0, 1, 1,
0.4393375, 0.4825262, 0.2926716, 0.08627451, 0, 1, 1,
0.4432049, -0.4042819, 1.749799, 0.09019608, 0, 1, 1,
0.448753, 0.5680446, 2.758905, 0.09803922, 0, 1, 1,
0.4504326, 1.115982, -0.6823986, 0.1058824, 0, 1, 1,
0.4516163, 0.6785768, -0.54911, 0.1098039, 0, 1, 1,
0.4528734, 2.290875, -0.4864101, 0.1176471, 0, 1, 1,
0.4551299, -0.9998628, 5.401796, 0.1215686, 0, 1, 1,
0.4557385, -0.671318, 1.943094, 0.1294118, 0, 1, 1,
0.4564889, -0.4863423, 1.683527, 0.1333333, 0, 1, 1,
0.45785, 1.538139, -0.548614, 0.1411765, 0, 1, 1,
0.4592082, -1.686548, 1.849721, 0.145098, 0, 1, 1,
0.4599834, -1.640901, 3.004275, 0.1529412, 0, 1, 1,
0.4604619, 1.548633, -0.3910396, 0.1568628, 0, 1, 1,
0.4619863, 0.3135579, 3.044123, 0.1647059, 0, 1, 1,
0.4633872, 0.6476052, 0.8942294, 0.1686275, 0, 1, 1,
0.4718908, -0.9036909, 1.924089, 0.1764706, 0, 1, 1,
0.4769355, 1.624021, 1.803856, 0.1803922, 0, 1, 1,
0.4790135, 0.4811234, 3.036211, 0.1882353, 0, 1, 1,
0.4895368, 0.3959014, 0.2326696, 0.1921569, 0, 1, 1,
0.4915091, -0.659841, 3.319721, 0.2, 0, 1, 1,
0.4993941, 0.3402086, 1.091753, 0.2078431, 0, 1, 1,
0.500045, 1.512308, 0.8697568, 0.2117647, 0, 1, 1,
0.5119066, -0.005926678, -0.466624, 0.2196078, 0, 1, 1,
0.5121297, -0.01750033, 1.799259, 0.2235294, 0, 1, 1,
0.5126082, -0.5649112, 3.002617, 0.2313726, 0, 1, 1,
0.515584, -0.2410374, 3.101172, 0.2352941, 0, 1, 1,
0.5171137, -0.1485741, 2.800776, 0.2431373, 0, 1, 1,
0.5239202, 0.7703176, -0.03472928, 0.2470588, 0, 1, 1,
0.52706, -0.184765, 3.710156, 0.254902, 0, 1, 1,
0.5319007, -0.1829431, 0.7402121, 0.2588235, 0, 1, 1,
0.535291, -1.191608, 3.53804, 0.2666667, 0, 1, 1,
0.5360325, 0.2806067, 0.2078374, 0.2705882, 0, 1, 1,
0.5365925, -1.945909, 3.552525, 0.2784314, 0, 1, 1,
0.5366921, 1.817782, -0.3411776, 0.282353, 0, 1, 1,
0.5401662, -0.1727545, 3.082202, 0.2901961, 0, 1, 1,
0.5426766, 1.284649, 0.1551971, 0.2941177, 0, 1, 1,
0.5509073, 0.6758038, -0.5173939, 0.3019608, 0, 1, 1,
0.5540457, -1.00414, 2.234082, 0.3098039, 0, 1, 1,
0.5547162, -1.141312, 2.963319, 0.3137255, 0, 1, 1,
0.5570748, -1.828125, 2.996061, 0.3215686, 0, 1, 1,
0.5605519, -0.1182136, 0.6424125, 0.3254902, 0, 1, 1,
0.5608386, 0.6887041, 1.247243, 0.3333333, 0, 1, 1,
0.562822, -0.6842508, 1.222669, 0.3372549, 0, 1, 1,
0.5631846, 1.533638, 0.6790721, 0.345098, 0, 1, 1,
0.5648287, -0.3975794, 2.327854, 0.3490196, 0, 1, 1,
0.5658087, -0.6897328, 2.990453, 0.3568628, 0, 1, 1,
0.5692678, 0.5753837, 1.496386, 0.3607843, 0, 1, 1,
0.5694678, 0.7404816, 1.882719, 0.3686275, 0, 1, 1,
0.573015, 1.643564, 0.8866895, 0.372549, 0, 1, 1,
0.5741543, -1.148621, 1.994066, 0.3803922, 0, 1, 1,
0.5860643, -0.6249617, 2.301151, 0.3843137, 0, 1, 1,
0.587581, -0.417306, 3.743048, 0.3921569, 0, 1, 1,
0.5951831, -1.618979, 2.389826, 0.3960784, 0, 1, 1,
0.6026105, -0.08851583, 1.702456, 0.4039216, 0, 1, 1,
0.6052918, 0.722435, 1.916361, 0.4117647, 0, 1, 1,
0.6065067, 2.053813, 1.885876, 0.4156863, 0, 1, 1,
0.6116458, 0.6689245, 1.010469, 0.4235294, 0, 1, 1,
0.6174196, 0.5630211, 0.6706387, 0.427451, 0, 1, 1,
0.6260468, 0.3935479, 0.9189246, 0.4352941, 0, 1, 1,
0.6313729, 0.134255, 2.313044, 0.4392157, 0, 1, 1,
0.6342748, 2.649724, -0.4427092, 0.4470588, 0, 1, 1,
0.6344461, 2.394547, -1.096453, 0.4509804, 0, 1, 1,
0.6384425, 0.2448067, 2.550819, 0.4588235, 0, 1, 1,
0.6401125, -1.253305, 2.45979, 0.4627451, 0, 1, 1,
0.6490533, 1.005015, 0.7277086, 0.4705882, 0, 1, 1,
0.652621, 1.16989, 0.1463437, 0.4745098, 0, 1, 1,
0.6612931, 2.643031, 1.439238, 0.4823529, 0, 1, 1,
0.6623582, 0.6940392, 1.002297, 0.4862745, 0, 1, 1,
0.6639329, 0.606104, 3.725363, 0.4941176, 0, 1, 1,
0.6652548, -1.19339, 2.658843, 0.5019608, 0, 1, 1,
0.666326, -0.8853641, 3.467847, 0.5058824, 0, 1, 1,
0.6676561, -1.712012, 1.432649, 0.5137255, 0, 1, 1,
0.6695206, 0.3212964, 0.04507384, 0.5176471, 0, 1, 1,
0.6703338, -0.8972638, 2.151543, 0.5254902, 0, 1, 1,
0.6711207, -1.26616, 1.905916, 0.5294118, 0, 1, 1,
0.6802297, 0.4616733, 1.162385, 0.5372549, 0, 1, 1,
0.6833457, -1.219676, 2.588982, 0.5411765, 0, 1, 1,
0.6841057, 0.9407466, 2.579365, 0.5490196, 0, 1, 1,
0.6889102, 1.46046, 1.636177, 0.5529412, 0, 1, 1,
0.6893073, 0.6139653, 2.07575, 0.5607843, 0, 1, 1,
0.6997299, 0.1399237, 2.014334, 0.5647059, 0, 1, 1,
0.7083167, 1.129144, 1.71212, 0.572549, 0, 1, 1,
0.7115886, 1.230618, 1.867469, 0.5764706, 0, 1, 1,
0.7222033, 2.410037, 0.8949976, 0.5843138, 0, 1, 1,
0.7256506, 1.095743, 0.4126052, 0.5882353, 0, 1, 1,
0.7281286, -0.3091144, 3.247869, 0.5960785, 0, 1, 1,
0.7308324, -0.4030569, 2.357144, 0.6039216, 0, 1, 1,
0.7368208, 0.8443842, 1.602064, 0.6078432, 0, 1, 1,
0.7368684, 0.64621, 1.444032, 0.6156863, 0, 1, 1,
0.7370216, -0.3528834, 0.8549142, 0.6196079, 0, 1, 1,
0.737922, -1.334196, 3.23193, 0.627451, 0, 1, 1,
0.7415989, -0.5991948, 2.505097, 0.6313726, 0, 1, 1,
0.7460299, 1.796831, 1.106833, 0.6392157, 0, 1, 1,
0.7468866, 1.225994, 1.979001, 0.6431373, 0, 1, 1,
0.7489609, 2.652753, 0.8311734, 0.6509804, 0, 1, 1,
0.7511066, 0.260925, 1.981379, 0.654902, 0, 1, 1,
0.7522221, 0.3468708, 1.359291, 0.6627451, 0, 1, 1,
0.7522721, -2.53239, 3.032242, 0.6666667, 0, 1, 1,
0.7640169, 0.2994881, 1.452153, 0.6745098, 0, 1, 1,
0.7647966, -1.159738, 3.307999, 0.6784314, 0, 1, 1,
0.7671651, 0.4779763, 2.000401, 0.6862745, 0, 1, 1,
0.773415, -0.1377492, 0.898186, 0.6901961, 0, 1, 1,
0.7816828, -1.694664, 1.263951, 0.6980392, 0, 1, 1,
0.786501, 0.2524485, 0.3039375, 0.7058824, 0, 1, 1,
0.787168, -1.696549, 2.648692, 0.7098039, 0, 1, 1,
0.7913762, -0.5524555, 1.449198, 0.7176471, 0, 1, 1,
0.7960219, 0.08716209, 1.608362, 0.7215686, 0, 1, 1,
0.7972919, -0.1152233, 1.45093, 0.7294118, 0, 1, 1,
0.797385, 0.571484, 1.446259, 0.7333333, 0, 1, 1,
0.8003146, 0.881534, 1.533445, 0.7411765, 0, 1, 1,
0.8081703, -0.5567997, 2.534772, 0.7450981, 0, 1, 1,
0.8109988, -0.5391548, 0.2212526, 0.7529412, 0, 1, 1,
0.8144938, -1.014049, 1.916789, 0.7568628, 0, 1, 1,
0.8182325, 1.302302, 2.244646, 0.7647059, 0, 1, 1,
0.8189939, -1.216484, 1.247143, 0.7686275, 0, 1, 1,
0.8217636, -1.428746, 2.409215, 0.7764706, 0, 1, 1,
0.8222884, -0.002373356, 0.3292539, 0.7803922, 0, 1, 1,
0.8222999, -1.048304, 1.155959, 0.7882353, 0, 1, 1,
0.822418, 0.6751674, 2.408863, 0.7921569, 0, 1, 1,
0.824009, 0.3344977, 2.111556, 0.8, 0, 1, 1,
0.824238, 0.516534, 1.543019, 0.8078431, 0, 1, 1,
0.8265497, 0.2113256, 0.4212494, 0.8117647, 0, 1, 1,
0.834819, 1.44435, 1.083056, 0.8196079, 0, 1, 1,
0.8383738, 1.236925, 1.260733, 0.8235294, 0, 1, 1,
0.8399181, 0.05865238, 0.7762113, 0.8313726, 0, 1, 1,
0.8401537, 0.04639878, -0.7486075, 0.8352941, 0, 1, 1,
0.8406364, -0.1660157, 1.880216, 0.8431373, 0, 1, 1,
0.8415774, 0.07693396, 1.595991, 0.8470588, 0, 1, 1,
0.8442113, 0.2359764, 1.515692, 0.854902, 0, 1, 1,
0.8468902, 0.5229327, 1.681944, 0.8588235, 0, 1, 1,
0.8494275, -0.8999974, 2.347196, 0.8666667, 0, 1, 1,
0.8508621, -0.7822822, 2.144763, 0.8705882, 0, 1, 1,
0.8541496, 1.345821, 1.688817, 0.8784314, 0, 1, 1,
0.8600313, -0.06513038, 1.832813, 0.8823529, 0, 1, 1,
0.8672137, -0.5397841, 2.827041, 0.8901961, 0, 1, 1,
0.8773037, 0.7518533, -0.3893414, 0.8941177, 0, 1, 1,
0.8783386, -1.711286, 1.804472, 0.9019608, 0, 1, 1,
0.8829169, -0.1177937, 1.64721, 0.9098039, 0, 1, 1,
0.8954176, -1.568851, 3.428857, 0.9137255, 0, 1, 1,
0.9006476, -0.116122, 0.601007, 0.9215686, 0, 1, 1,
0.9102727, -1.207075, 2.125603, 0.9254902, 0, 1, 1,
0.9140601, 2.093105, 0.2090876, 0.9333333, 0, 1, 1,
0.9158085, 1.415137, 0.2224149, 0.9372549, 0, 1, 1,
0.9160711, -0.2564847, 1.14318, 0.945098, 0, 1, 1,
0.9173611, 0.7623278, 2.422394, 0.9490196, 0, 1, 1,
0.921872, 0.4697982, 1.118726, 0.9568627, 0, 1, 1,
0.9281601, 0.7603239, -0.3560069, 0.9607843, 0, 1, 1,
0.9406862, -0.0003191722, 0.2582522, 0.9686275, 0, 1, 1,
0.9417216, -0.3834617, 1.930264, 0.972549, 0, 1, 1,
0.9480848, -1.138464, 2.863781, 0.9803922, 0, 1, 1,
0.9486497, -0.4112332, 0.9228513, 0.9843137, 0, 1, 1,
0.9505354, 2.319248, -0.5035314, 0.9921569, 0, 1, 1,
0.962282, 0.2104583, 1.463468, 0.9960784, 0, 1, 1,
0.967035, 1.149308, 1.261968, 1, 0, 0.9960784, 1,
0.9698558, -1.185318, 2.027235, 1, 0, 0.9882353, 1,
0.9776141, 0.5896535, 3.156809, 1, 0, 0.9843137, 1,
0.9842589, -0.1485736, 1.170583, 1, 0, 0.9764706, 1,
0.9888345, -0.3790065, 2.268244, 1, 0, 0.972549, 1,
1.000263, -0.4990138, 3.438387, 1, 0, 0.9647059, 1,
1.000705, 0.109249, 0.04345921, 1, 0, 0.9607843, 1,
1.004612, 0.03600974, 0.5878012, 1, 0, 0.9529412, 1,
1.011778, 1.480725, -0.7774067, 1, 0, 0.9490196, 1,
1.028599, 0.8627176, 1.475916, 1, 0, 0.9411765, 1,
1.029176, -0.05462046, -0.01812053, 1, 0, 0.9372549, 1,
1.034148, 0.6002846, 2.086441, 1, 0, 0.9294118, 1,
1.034719, -0.9341761, 2.394845, 1, 0, 0.9254902, 1,
1.03687, 0.04939779, 0.8542651, 1, 0, 0.9176471, 1,
1.039621, -1.453046, 2.283424, 1, 0, 0.9137255, 1,
1.04332, -1.460669, 1.138977, 1, 0, 0.9058824, 1,
1.04389, 0.8645185, 1.137992, 1, 0, 0.9019608, 1,
1.044414, 0.1302529, 1.805071, 1, 0, 0.8941177, 1,
1.051461, 1.791677, 0.8520232, 1, 0, 0.8862745, 1,
1.05922, 0.06707519, 1.346183, 1, 0, 0.8823529, 1,
1.062066, 0.05320399, 1.17433, 1, 0, 0.8745098, 1,
1.062254, 0.08515199, 2.048387, 1, 0, 0.8705882, 1,
1.06383, -0.4427209, 4.484897, 1, 0, 0.8627451, 1,
1.091772, -0.3395452, 2.679252, 1, 0, 0.8588235, 1,
1.100252, -1.144347, 2.011703, 1, 0, 0.8509804, 1,
1.102505, -1.354294, 3.284244, 1, 0, 0.8470588, 1,
1.107067, 0.8329691, -0.6707101, 1, 0, 0.8392157, 1,
1.112776, -0.4741367, 2.09795, 1, 0, 0.8352941, 1,
1.120363, -0.7403649, 1.852967, 1, 0, 0.827451, 1,
1.133696, -0.7136506, 2.360565, 1, 0, 0.8235294, 1,
1.134771, -1.013426, 2.25878, 1, 0, 0.8156863, 1,
1.148357, 2.114871, -0.03489295, 1, 0, 0.8117647, 1,
1.152088, 1.0157, 2.03243, 1, 0, 0.8039216, 1,
1.161474, 0.4062413, 0.6435199, 1, 0, 0.7960784, 1,
1.165928, 0.446846, 1.495055, 1, 0, 0.7921569, 1,
1.172349, -0.1058348, 0.534263, 1, 0, 0.7843137, 1,
1.172407, -1.585995, 1.410197, 1, 0, 0.7803922, 1,
1.173336, 0.7029296, -1.265767, 1, 0, 0.772549, 1,
1.174741, -0.989041, 3.442706, 1, 0, 0.7686275, 1,
1.17558, -0.8826889, 2.156704, 1, 0, 0.7607843, 1,
1.176199, -0.1644693, 3.544616, 1, 0, 0.7568628, 1,
1.179555, -0.460193, 2.031492, 1, 0, 0.7490196, 1,
1.182427, 0.5643466, 2.740582, 1, 0, 0.7450981, 1,
1.187814, -1.687264, 0.6572809, 1, 0, 0.7372549, 1,
1.188802, 0.4729384, -1.163271, 1, 0, 0.7333333, 1,
1.194781, 0.7579477, 0.9624792, 1, 0, 0.7254902, 1,
1.198337, -0.7693716, 2.471958, 1, 0, 0.7215686, 1,
1.201285, -0.1182295, 1.873482, 1, 0, 0.7137255, 1,
1.205487, 1.599174, 1.019699, 1, 0, 0.7098039, 1,
1.218436, 0.9171195, 0.8310347, 1, 0, 0.7019608, 1,
1.219927, -0.5636936, 1.386974, 1, 0, 0.6941177, 1,
1.222763, -1.07178, 3.933563, 1, 0, 0.6901961, 1,
1.224014, 0.01913251, 0.5964785, 1, 0, 0.682353, 1,
1.237713, -0.7004429, 2.382757, 1, 0, 0.6784314, 1,
1.238607, -1.484294, 1.783709, 1, 0, 0.6705883, 1,
1.248292, 0.496319, 0.9674336, 1, 0, 0.6666667, 1,
1.251611, -0.5471861, 1.997094, 1, 0, 0.6588235, 1,
1.259802, -2.661271, 2.609981, 1, 0, 0.654902, 1,
1.261064, -0.6117276, 2.773027, 1, 0, 0.6470588, 1,
1.261481, -1.605933, 3.080391, 1, 0, 0.6431373, 1,
1.275747, -0.5541472, 0.9497087, 1, 0, 0.6352941, 1,
1.276373, -0.7281082, 2.862281, 1, 0, 0.6313726, 1,
1.278518, 0.3148112, 1.898277, 1, 0, 0.6235294, 1,
1.28327, 0.2590547, 2.40851, 1, 0, 0.6196079, 1,
1.28497, 1.07546, 1.924513, 1, 0, 0.6117647, 1,
1.289564, -0.5601972, 2.153613, 1, 0, 0.6078432, 1,
1.293721, -1.672118, 2.537368, 1, 0, 0.6, 1,
1.296875, 0.74488, 0.9173602, 1, 0, 0.5921569, 1,
1.303282, -0.5653954, 2.241442, 1, 0, 0.5882353, 1,
1.306279, 0.3857551, 0.3960404, 1, 0, 0.5803922, 1,
1.309637, -0.0316552, 2.064318, 1, 0, 0.5764706, 1,
1.31073, -0.4180499, 3.744771, 1, 0, 0.5686275, 1,
1.314209, 1.012697, 1.488805, 1, 0, 0.5647059, 1,
1.321501, -2.270401, 2.353236, 1, 0, 0.5568628, 1,
1.341717, 1.822296, 1.967908, 1, 0, 0.5529412, 1,
1.34698, -1.276448, 2.202183, 1, 0, 0.5450981, 1,
1.347559, 2.964796, 1.639575, 1, 0, 0.5411765, 1,
1.351434, -0.796736, 2.359721, 1, 0, 0.5333334, 1,
1.351764, 0.4083247, -0.2647002, 1, 0, 0.5294118, 1,
1.363964, 0.7569797, 1.892755, 1, 0, 0.5215687, 1,
1.370771, -1.168967, 2.773153, 1, 0, 0.5176471, 1,
1.38691, 0.9040794, -0.5264825, 1, 0, 0.509804, 1,
1.392947, -1.407915, 1.743628, 1, 0, 0.5058824, 1,
1.402877, 0.7188556, 1.361886, 1, 0, 0.4980392, 1,
1.405558, -0.614183, 2.19757, 1, 0, 0.4901961, 1,
1.405878, 0.5475613, 1.795363, 1, 0, 0.4862745, 1,
1.409997, -1.671531, 1.497428, 1, 0, 0.4784314, 1,
1.410244, 0.02655053, 1.281096, 1, 0, 0.4745098, 1,
1.41818, 0.07434191, 1.631922, 1, 0, 0.4666667, 1,
1.422178, -0.8629285, 0.568448, 1, 0, 0.4627451, 1,
1.427758, 1.013808, 1.606037, 1, 0, 0.454902, 1,
1.429621, -1.756638, 4.742315, 1, 0, 0.4509804, 1,
1.432355, 1.405214, 0.3537323, 1, 0, 0.4431373, 1,
1.44248, -1.500874, 0.4970278, 1, 0, 0.4392157, 1,
1.44289, -1.695403, 2.251074, 1, 0, 0.4313726, 1,
1.465432, 2.309741, 0.02548579, 1, 0, 0.427451, 1,
1.468886, -1.306026, 1.596552, 1, 0, 0.4196078, 1,
1.478012, -2.853861, 3.653989, 1, 0, 0.4156863, 1,
1.488663, -0.2484584, 2.484757, 1, 0, 0.4078431, 1,
1.503973, -1.563314, 2.584543, 1, 0, 0.4039216, 1,
1.511016, -0.2907608, 1.242195, 1, 0, 0.3960784, 1,
1.511222, 0.2439285, 1.072629, 1, 0, 0.3882353, 1,
1.526352, 0.08392344, 0.5385239, 1, 0, 0.3843137, 1,
1.530798, -0.7244396, 0.3766271, 1, 0, 0.3764706, 1,
1.532187, -0.8483648, 1.827676, 1, 0, 0.372549, 1,
1.541283, -0.4262815, 1.568702, 1, 0, 0.3647059, 1,
1.557799, -0.4422105, 2.117767, 1, 0, 0.3607843, 1,
1.558698, -1.443719, 1.689735, 1, 0, 0.3529412, 1,
1.561832, 0.1191639, 0.5603663, 1, 0, 0.3490196, 1,
1.570474, 0.8942426, 0.7086731, 1, 0, 0.3411765, 1,
1.591728, -1.23893, 1.637293, 1, 0, 0.3372549, 1,
1.599081, 2.269107, 1.078919, 1, 0, 0.3294118, 1,
1.611876, 2.370604, 0.5843185, 1, 0, 0.3254902, 1,
1.635426, -1.413777, 0.3409213, 1, 0, 0.3176471, 1,
1.639828, 0.9551044, 2.256778, 1, 0, 0.3137255, 1,
1.643808, 2.031653, -0.3861142, 1, 0, 0.3058824, 1,
1.648787, 0.5065678, 1.592522, 1, 0, 0.2980392, 1,
1.649896, -0.4179382, 1.171689, 1, 0, 0.2941177, 1,
1.67061, -0.4374197, 2.434123, 1, 0, 0.2862745, 1,
1.670843, -0.7393146, 3.163909, 1, 0, 0.282353, 1,
1.672562, -0.05521223, 0.6280621, 1, 0, 0.2745098, 1,
1.71965, -2.177947, 1.94668, 1, 0, 0.2705882, 1,
1.744162, 0.6361657, 1.406802, 1, 0, 0.2627451, 1,
1.780892, 0.3501318, 2.554974, 1, 0, 0.2588235, 1,
1.783524, -0.2704111, -0.8052992, 1, 0, 0.2509804, 1,
1.795806, -1.025949, 3.481448, 1, 0, 0.2470588, 1,
1.808281, 1.648076, -0.5499499, 1, 0, 0.2392157, 1,
1.839789, 0.1190392, 2.790016, 1, 0, 0.2352941, 1,
1.842351, 0.7675508, -1.557449, 1, 0, 0.227451, 1,
1.850057, 1.468197, -1.008726, 1, 0, 0.2235294, 1,
1.859241, -0.8633938, 2.126517, 1, 0, 0.2156863, 1,
1.8741, 0.7122127, -0.8451145, 1, 0, 0.2117647, 1,
1.879296, -1.045772, 2.324377, 1, 0, 0.2039216, 1,
1.88318, -0.2376259, 3.579083, 1, 0, 0.1960784, 1,
1.88592, 1.443725, 0.5401006, 1, 0, 0.1921569, 1,
1.886776, -0.3955732, 0.5673842, 1, 0, 0.1843137, 1,
1.895543, -1.214687, 3.7729, 1, 0, 0.1803922, 1,
1.895884, 2.418835, 0.9571587, 1, 0, 0.172549, 1,
1.902535, -1.260118, 2.618862, 1, 0, 0.1686275, 1,
1.904668, -0.7953519, 2.189253, 1, 0, 0.1607843, 1,
1.9082, -2.011337, 1.55483, 1, 0, 0.1568628, 1,
1.921275, 1.616207, 1.221342, 1, 0, 0.1490196, 1,
1.944546, -1.118148, 1.91125, 1, 0, 0.145098, 1,
1.970645, 0.06582422, -0.2008429, 1, 0, 0.1372549, 1,
1.97919, -1.249916, 2.397625, 1, 0, 0.1333333, 1,
1.979693, 1.128965, 2.438026, 1, 0, 0.1254902, 1,
2.001485, -0.4864945, 2.54816, 1, 0, 0.1215686, 1,
2.008604, 0.3562619, 1.867998, 1, 0, 0.1137255, 1,
2.010914, -0.18299, 1.227837, 1, 0, 0.1098039, 1,
2.013687, 0.6551132, 1.779319, 1, 0, 0.1019608, 1,
2.015774, 0.3366483, 1.927077, 1, 0, 0.09411765, 1,
2.034703, -0.3028208, 3.038622, 1, 0, 0.09019608, 1,
2.067614, -0.4344609, 2.745529, 1, 0, 0.08235294, 1,
2.093733, 1.075781, 1.925473, 1, 0, 0.07843138, 1,
2.114141, 0.7891795, 2.465454, 1, 0, 0.07058824, 1,
2.223341, 0.176927, 1.755483, 1, 0, 0.06666667, 1,
2.242247, -1.574749, 2.411071, 1, 0, 0.05882353, 1,
2.287386, -1.809584, 1.485307, 1, 0, 0.05490196, 1,
2.312048, 0.552677, 1.969053, 1, 0, 0.04705882, 1,
2.421102, 0.7895952, 1.135163, 1, 0, 0.04313726, 1,
2.448697, -1.508071, 2.101949, 1, 0, 0.03529412, 1,
2.555023, 1.247438, 1.306745, 1, 0, 0.03137255, 1,
2.621665, 0.6061794, 0.1255242, 1, 0, 0.02352941, 1,
2.730241, 0.2388774, 0.2744738, 1, 0, 0.01960784, 1,
2.881511, -0.9505035, 0.7418538, 1, 0, 0.01176471, 1,
2.887872, -0.5076866, 2.609869, 1, 0, 0.007843138, 1
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
-0.3226348, -4.17164, -6.859955, 0, -0.5, 0.5, 0.5,
-0.3226348, -4.17164, -6.859955, 1, -0.5, 0.5, 0.5,
-0.3226348, -4.17164, -6.859955, 1, 1.5, 0.5, 0.5,
-0.3226348, -4.17164, -6.859955, 0, 1.5, 0.5, 0.5
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
-4.621503, 0.1679331, -6.859955, 0, -0.5, 0.5, 0.5,
-4.621503, 0.1679331, -6.859955, 1, -0.5, 0.5, 0.5,
-4.621503, 0.1679331, -6.859955, 1, 1.5, 0.5, 0.5,
-4.621503, 0.1679331, -6.859955, 0, 1.5, 0.5, 0.5
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
-4.621503, -4.17164, 0.1594913, 0, -0.5, 0.5, 0.5,
-4.621503, -4.17164, 0.1594913, 1, -0.5, 0.5, 0.5,
-4.621503, -4.17164, 0.1594913, 1, 1.5, 0.5, 0.5,
-4.621503, -4.17164, 0.1594913, 0, 1.5, 0.5, 0.5
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
-3, -3.1702, -5.240083,
2, -3.1702, -5.240083,
-3, -3.1702, -5.240083,
-3, -3.337107, -5.510062,
-2, -3.1702, -5.240083,
-2, -3.337107, -5.510062,
-1, -3.1702, -5.240083,
-1, -3.337107, -5.510062,
0, -3.1702, -5.240083,
0, -3.337107, -5.510062,
1, -3.1702, -5.240083,
1, -3.337107, -5.510062,
2, -3.1702, -5.240083,
2, -3.337107, -5.510062
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
-3, -3.67092, -6.050019, 0, -0.5, 0.5, 0.5,
-3, -3.67092, -6.050019, 1, -0.5, 0.5, 0.5,
-3, -3.67092, -6.050019, 1, 1.5, 0.5, 0.5,
-3, -3.67092, -6.050019, 0, 1.5, 0.5, 0.5,
-2, -3.67092, -6.050019, 0, -0.5, 0.5, 0.5,
-2, -3.67092, -6.050019, 1, -0.5, 0.5, 0.5,
-2, -3.67092, -6.050019, 1, 1.5, 0.5, 0.5,
-2, -3.67092, -6.050019, 0, 1.5, 0.5, 0.5,
-1, -3.67092, -6.050019, 0, -0.5, 0.5, 0.5,
-1, -3.67092, -6.050019, 1, -0.5, 0.5, 0.5,
-1, -3.67092, -6.050019, 1, 1.5, 0.5, 0.5,
-1, -3.67092, -6.050019, 0, 1.5, 0.5, 0.5,
0, -3.67092, -6.050019, 0, -0.5, 0.5, 0.5,
0, -3.67092, -6.050019, 1, -0.5, 0.5, 0.5,
0, -3.67092, -6.050019, 1, 1.5, 0.5, 0.5,
0, -3.67092, -6.050019, 0, 1.5, 0.5, 0.5,
1, -3.67092, -6.050019, 0, -0.5, 0.5, 0.5,
1, -3.67092, -6.050019, 1, -0.5, 0.5, 0.5,
1, -3.67092, -6.050019, 1, 1.5, 0.5, 0.5,
1, -3.67092, -6.050019, 0, 1.5, 0.5, 0.5,
2, -3.67092, -6.050019, 0, -0.5, 0.5, 0.5,
2, -3.67092, -6.050019, 1, -0.5, 0.5, 0.5,
2, -3.67092, -6.050019, 1, 1.5, 0.5, 0.5,
2, -3.67092, -6.050019, 0, 1.5, 0.5, 0.5
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
-3.629456, -3, -5.240083,
-3.629456, 3, -5.240083,
-3.629456, -3, -5.240083,
-3.794797, -3, -5.510062,
-3.629456, -2, -5.240083,
-3.794797, -2, -5.510062,
-3.629456, -1, -5.240083,
-3.794797, -1, -5.510062,
-3.629456, 0, -5.240083,
-3.794797, 0, -5.510062,
-3.629456, 1, -5.240083,
-3.794797, 1, -5.510062,
-3.629456, 2, -5.240083,
-3.794797, 2, -5.510062,
-3.629456, 3, -5.240083,
-3.794797, 3, -5.510062
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
-4.12548, -3, -6.050019, 0, -0.5, 0.5, 0.5,
-4.12548, -3, -6.050019, 1, -0.5, 0.5, 0.5,
-4.12548, -3, -6.050019, 1, 1.5, 0.5, 0.5,
-4.12548, -3, -6.050019, 0, 1.5, 0.5, 0.5,
-4.12548, -2, -6.050019, 0, -0.5, 0.5, 0.5,
-4.12548, -2, -6.050019, 1, -0.5, 0.5, 0.5,
-4.12548, -2, -6.050019, 1, 1.5, 0.5, 0.5,
-4.12548, -2, -6.050019, 0, 1.5, 0.5, 0.5,
-4.12548, -1, -6.050019, 0, -0.5, 0.5, 0.5,
-4.12548, -1, -6.050019, 1, -0.5, 0.5, 0.5,
-4.12548, -1, -6.050019, 1, 1.5, 0.5, 0.5,
-4.12548, -1, -6.050019, 0, 1.5, 0.5, 0.5,
-4.12548, 0, -6.050019, 0, -0.5, 0.5, 0.5,
-4.12548, 0, -6.050019, 1, -0.5, 0.5, 0.5,
-4.12548, 0, -6.050019, 1, 1.5, 0.5, 0.5,
-4.12548, 0, -6.050019, 0, 1.5, 0.5, 0.5,
-4.12548, 1, -6.050019, 0, -0.5, 0.5, 0.5,
-4.12548, 1, -6.050019, 1, -0.5, 0.5, 0.5,
-4.12548, 1, -6.050019, 1, 1.5, 0.5, 0.5,
-4.12548, 1, -6.050019, 0, 1.5, 0.5, 0.5,
-4.12548, 2, -6.050019, 0, -0.5, 0.5, 0.5,
-4.12548, 2, -6.050019, 1, -0.5, 0.5, 0.5,
-4.12548, 2, -6.050019, 1, 1.5, 0.5, 0.5,
-4.12548, 2, -6.050019, 0, 1.5, 0.5, 0.5,
-4.12548, 3, -6.050019, 0, -0.5, 0.5, 0.5,
-4.12548, 3, -6.050019, 1, -0.5, 0.5, 0.5,
-4.12548, 3, -6.050019, 1, 1.5, 0.5, 0.5,
-4.12548, 3, -6.050019, 0, 1.5, 0.5, 0.5
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
-3.629456, -3.1702, -4,
-3.629456, -3.1702, 4,
-3.629456, -3.1702, -4,
-3.794797, -3.337107, -4,
-3.629456, -3.1702, -2,
-3.794797, -3.337107, -2,
-3.629456, -3.1702, 0,
-3.794797, -3.337107, 0,
-3.629456, -3.1702, 2,
-3.794797, -3.337107, 2,
-3.629456, -3.1702, 4,
-3.794797, -3.337107, 4
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
-4.12548, -3.67092, -4, 0, -0.5, 0.5, 0.5,
-4.12548, -3.67092, -4, 1, -0.5, 0.5, 0.5,
-4.12548, -3.67092, -4, 1, 1.5, 0.5, 0.5,
-4.12548, -3.67092, -4, 0, 1.5, 0.5, 0.5,
-4.12548, -3.67092, -2, 0, -0.5, 0.5, 0.5,
-4.12548, -3.67092, -2, 1, -0.5, 0.5, 0.5,
-4.12548, -3.67092, -2, 1, 1.5, 0.5, 0.5,
-4.12548, -3.67092, -2, 0, 1.5, 0.5, 0.5,
-4.12548, -3.67092, 0, 0, -0.5, 0.5, 0.5,
-4.12548, -3.67092, 0, 1, -0.5, 0.5, 0.5,
-4.12548, -3.67092, 0, 1, 1.5, 0.5, 0.5,
-4.12548, -3.67092, 0, 0, 1.5, 0.5, 0.5,
-4.12548, -3.67092, 2, 0, -0.5, 0.5, 0.5,
-4.12548, -3.67092, 2, 1, -0.5, 0.5, 0.5,
-4.12548, -3.67092, 2, 1, 1.5, 0.5, 0.5,
-4.12548, -3.67092, 2, 0, 1.5, 0.5, 0.5,
-4.12548, -3.67092, 4, 0, -0.5, 0.5, 0.5,
-4.12548, -3.67092, 4, 1, -0.5, 0.5, 0.5,
-4.12548, -3.67092, 4, 1, 1.5, 0.5, 0.5,
-4.12548, -3.67092, 4, 0, 1.5, 0.5, 0.5
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
-3.629456, -3.1702, -5.240083,
-3.629456, 3.506066, -5.240083,
-3.629456, -3.1702, 5.559065,
-3.629456, 3.506066, 5.559065,
-3.629456, -3.1702, -5.240083,
-3.629456, -3.1702, 5.559065,
-3.629456, 3.506066, -5.240083,
-3.629456, 3.506066, 5.559065,
-3.629456, -3.1702, -5.240083,
2.984187, -3.1702, -5.240083,
-3.629456, -3.1702, 5.559065,
2.984187, -3.1702, 5.559065,
-3.629456, 3.506066, -5.240083,
2.984187, 3.506066, -5.240083,
-3.629456, 3.506066, 5.559065,
2.984187, 3.506066, 5.559065,
2.984187, -3.1702, -5.240083,
2.984187, 3.506066, -5.240083,
2.984187, -3.1702, 5.559065,
2.984187, 3.506066, 5.559065,
2.984187, -3.1702, -5.240083,
2.984187, -3.1702, 5.559065,
2.984187, 3.506066, -5.240083,
2.984187, 3.506066, 5.559065
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
var radius = 7.644215;
var distance = 34.00998;
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
mvMatrix.translate( 0.3226348, -0.1679331, -0.1594913 );
mvMatrix.scale( 1.249701, 1.237979, 0.7653451 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.00998);
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


