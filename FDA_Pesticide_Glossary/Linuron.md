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
-3.082064, 0.1450471, -2.05239, 1, 0, 0, 1,
-2.901199, 0.62413, -2.349774, 1, 0.007843138, 0, 1,
-2.643745, 0.281881, -0.3324496, 1, 0.01176471, 0, 1,
-2.628766, -0.7894363, -3.506085, 1, 0.01960784, 0, 1,
-2.609761, 1.589367, -0.7386978, 1, 0.02352941, 0, 1,
-2.437526, -0.667776, -2.393591, 1, 0.03137255, 0, 1,
-2.366096, -0.1394813, -0.4180872, 1, 0.03529412, 0, 1,
-2.337314, 0.06439736, -1.637127, 1, 0.04313726, 0, 1,
-2.285873, -0.2581345, -2.171285, 1, 0.04705882, 0, 1,
-2.234833, 0.5935233, -1.914453, 1, 0.05490196, 0, 1,
-2.152252, 0.5511248, -0.7182224, 1, 0.05882353, 0, 1,
-2.148481, 0.4627173, -0.2810945, 1, 0.06666667, 0, 1,
-2.021064, -0.05899508, -4.037213, 1, 0.07058824, 0, 1,
-2.012635, -0.8026707, -2.059751, 1, 0.07843138, 0, 1,
-2.004797, -1.254262, -1.543575, 1, 0.08235294, 0, 1,
-2.004575, 0.4378744, -2.443531, 1, 0.09019608, 0, 1,
-1.997118, -0.4570161, -2.239607, 1, 0.09411765, 0, 1,
-1.983213, 0.1356232, -1.329, 1, 0.1019608, 0, 1,
-1.964693, -0.4951203, -1.300743, 1, 0.1098039, 0, 1,
-1.95811, 0.7751991, -1.680593, 1, 0.1137255, 0, 1,
-1.953658, -0.1748065, -1.557934, 1, 0.1215686, 0, 1,
-1.946928, -0.2089135, -1.909892, 1, 0.1254902, 0, 1,
-1.935219, -0.8933933, -1.35739, 1, 0.1333333, 0, 1,
-1.92716, -1.295963, -3.617668, 1, 0.1372549, 0, 1,
-1.92512, 1.925132, -0.926092, 1, 0.145098, 0, 1,
-1.891017, 0.1367306, -2.685356, 1, 0.1490196, 0, 1,
-1.88549, -1.767012, -2.212988, 1, 0.1568628, 0, 1,
-1.85187, 0.01395219, -3.836262, 1, 0.1607843, 0, 1,
-1.845639, 0.6465065, -0.1956706, 1, 0.1686275, 0, 1,
-1.819883, 0.1523174, -0.806031, 1, 0.172549, 0, 1,
-1.819862, -0.6834297, -1.598758, 1, 0.1803922, 0, 1,
-1.808763, -0.2609549, -0.8433953, 1, 0.1843137, 0, 1,
-1.786033, 1.87422, -2.029432, 1, 0.1921569, 0, 1,
-1.781627, -0.3702014, -1.649573, 1, 0.1960784, 0, 1,
-1.769015, 0.6185495, -1.697379, 1, 0.2039216, 0, 1,
-1.752579, 1.141366, -0.2394554, 1, 0.2117647, 0, 1,
-1.750525, -2.124383, -2.884472, 1, 0.2156863, 0, 1,
-1.742574, -1.360147, -4.253052, 1, 0.2235294, 0, 1,
-1.735018, 1.903829, 0.06282988, 1, 0.227451, 0, 1,
-1.715963, -1.37165, -3.268454, 1, 0.2352941, 0, 1,
-1.704857, 0.2507285, -0.8219405, 1, 0.2392157, 0, 1,
-1.693754, 0.382522, -0.8975596, 1, 0.2470588, 0, 1,
-1.666628, 0.4417627, -0.8459499, 1, 0.2509804, 0, 1,
-1.666298, 2.695002, -1.722448, 1, 0.2588235, 0, 1,
-1.663581, 0.009307681, -0.6410075, 1, 0.2627451, 0, 1,
-1.662893, -0.2785968, -2.741952, 1, 0.2705882, 0, 1,
-1.660955, 0.06822368, -3.998044, 1, 0.2745098, 0, 1,
-1.654596, 0.2658535, -1.192748, 1, 0.282353, 0, 1,
-1.650671, 1.684205, -2.553818, 1, 0.2862745, 0, 1,
-1.649031, 0.752292, -0.684459, 1, 0.2941177, 0, 1,
-1.643854, -0.7073057, -1.300655, 1, 0.3019608, 0, 1,
-1.63827, 0.2242308, -1.322682, 1, 0.3058824, 0, 1,
-1.631806, 1.712499, 0.1674458, 1, 0.3137255, 0, 1,
-1.628056, -0.7775954, -2.169396, 1, 0.3176471, 0, 1,
-1.62686, 1.346953, -2.559284, 1, 0.3254902, 0, 1,
-1.619245, -0.5145749, -2.520815, 1, 0.3294118, 0, 1,
-1.606781, 0.4974018, -0.7255666, 1, 0.3372549, 0, 1,
-1.605636, -1.442357, -2.126488, 1, 0.3411765, 0, 1,
-1.593937, 0.5112391, -2.544914, 1, 0.3490196, 0, 1,
-1.589026, -0.1122608, -0.4572974, 1, 0.3529412, 0, 1,
-1.584925, 0.8020267, -0.8401192, 1, 0.3607843, 0, 1,
-1.581669, -0.6057819, -2.848147, 1, 0.3647059, 0, 1,
-1.581012, -0.07381314, -3.77085, 1, 0.372549, 0, 1,
-1.573568, -0.9608513, -2.01936, 1, 0.3764706, 0, 1,
-1.554306, 0.4413889, -0.5540982, 1, 0.3843137, 0, 1,
-1.554204, -0.04479001, -2.944036, 1, 0.3882353, 0, 1,
-1.541957, 0.2245114, -1.167437, 1, 0.3960784, 0, 1,
-1.522621, 0.2077117, 0.08739232, 1, 0.4039216, 0, 1,
-1.518875, 0.7531208, -0.2081927, 1, 0.4078431, 0, 1,
-1.517954, -0.4902796, -2.813353, 1, 0.4156863, 0, 1,
-1.512045, -0.4281411, -2.79461, 1, 0.4196078, 0, 1,
-1.494049, 0.6575966, -1.445864, 1, 0.427451, 0, 1,
-1.484822, -0.9078867, -3.336821, 1, 0.4313726, 0, 1,
-1.470314, -1.478385, -0.2955098, 1, 0.4392157, 0, 1,
-1.465531, -0.1503421, -0.9001046, 1, 0.4431373, 0, 1,
-1.465351, -0.4406047, -4.417239, 1, 0.4509804, 0, 1,
-1.460226, 0.6014705, -0.9315864, 1, 0.454902, 0, 1,
-1.458695, -0.3665067, -1.226925, 1, 0.4627451, 0, 1,
-1.4504, 2.051739, 0.8853948, 1, 0.4666667, 0, 1,
-1.440957, -0.1392971, -2.781257, 1, 0.4745098, 0, 1,
-1.435388, 0.3750478, 1.750094, 1, 0.4784314, 0, 1,
-1.429666, -2.361185, -4.200577, 1, 0.4862745, 0, 1,
-1.425313, 2.397408, -0.239954, 1, 0.4901961, 0, 1,
-1.415734, 1.59807, -0.1005476, 1, 0.4980392, 0, 1,
-1.410665, 1.028826, -0.7079023, 1, 0.5058824, 0, 1,
-1.409346, -1.805491, -0.7264134, 1, 0.509804, 0, 1,
-1.408661, 0.6235715, -0.6453182, 1, 0.5176471, 0, 1,
-1.407671, -0.8757437, -3.203334, 1, 0.5215687, 0, 1,
-1.396744, 0.7292314, 0.2602841, 1, 0.5294118, 0, 1,
-1.39493, -2.43358, -1.867097, 1, 0.5333334, 0, 1,
-1.389453, -1.602135, -1.771597, 1, 0.5411765, 0, 1,
-1.375019, -0.9990218, -3.440203, 1, 0.5450981, 0, 1,
-1.37122, -0.6488569, -2.017074, 1, 0.5529412, 0, 1,
-1.369604, -0.2396357, 0.11187, 1, 0.5568628, 0, 1,
-1.368081, 0.9571837, -0.4866608, 1, 0.5647059, 0, 1,
-1.362992, 0.4874302, -2.727292, 1, 0.5686275, 0, 1,
-1.359387, -1.399942, -2.00696, 1, 0.5764706, 0, 1,
-1.352363, 1.248949, -0.005066046, 1, 0.5803922, 0, 1,
-1.345398, 0.1731653, -1.861835, 1, 0.5882353, 0, 1,
-1.342439, 1.564308, -0.296164, 1, 0.5921569, 0, 1,
-1.341517, -0.3569058, -0.5931846, 1, 0.6, 0, 1,
-1.338987, 0.6379886, -1.221145, 1, 0.6078432, 0, 1,
-1.332916, -1.691315, -2.516924, 1, 0.6117647, 0, 1,
-1.326718, -0.3979216, -4.098698, 1, 0.6196079, 0, 1,
-1.325368, 0.446042, -0.5539485, 1, 0.6235294, 0, 1,
-1.324789, -0.2435939, -0.5758249, 1, 0.6313726, 0, 1,
-1.310092, 1.003071, -0.7720205, 1, 0.6352941, 0, 1,
-1.308764, 0.1438742, -1.65659, 1, 0.6431373, 0, 1,
-1.304514, -1.574, -3.216919, 1, 0.6470588, 0, 1,
-1.302091, -0.9139898, -4.007294, 1, 0.654902, 0, 1,
-1.301485, -1.673253, -1.217582, 1, 0.6588235, 0, 1,
-1.294001, -0.3570723, -2.655748, 1, 0.6666667, 0, 1,
-1.291118, 0.5670146, -1.490399, 1, 0.6705883, 0, 1,
-1.288826, 1.026852, -2.284549, 1, 0.6784314, 0, 1,
-1.28523, -0.9239338, -2.119435, 1, 0.682353, 0, 1,
-1.284514, 0.02919732, -0.9574187, 1, 0.6901961, 0, 1,
-1.268018, -0.1533682, -0.7020336, 1, 0.6941177, 0, 1,
-1.262455, -0.7710897, -1.968165, 1, 0.7019608, 0, 1,
-1.261979, 0.5321667, -2.158075, 1, 0.7098039, 0, 1,
-1.258259, 1.811711, 0.2364229, 1, 0.7137255, 0, 1,
-1.255322, -1.254561, -4.876053, 1, 0.7215686, 0, 1,
-1.253745, -1.4284, -3.608765, 1, 0.7254902, 0, 1,
-1.251599, 0.2792221, -2.018874, 1, 0.7333333, 0, 1,
-1.247998, 1.968441, -1.085293, 1, 0.7372549, 0, 1,
-1.236335, 1.534235, -0.2314752, 1, 0.7450981, 0, 1,
-1.233453, 0.5136363, -4.036549, 1, 0.7490196, 0, 1,
-1.231971, 0.6989793, -0.1836178, 1, 0.7568628, 0, 1,
-1.228852, -0.3024828, -0.5100989, 1, 0.7607843, 0, 1,
-1.228001, 0.4474082, -0.9975812, 1, 0.7686275, 0, 1,
-1.227457, 1.150769, -0.02971136, 1, 0.772549, 0, 1,
-1.222609, -0.7384229, -1.302132, 1, 0.7803922, 0, 1,
-1.220385, -0.232976, -2.421069, 1, 0.7843137, 0, 1,
-1.21923, 2.544561, -0.02764207, 1, 0.7921569, 0, 1,
-1.210152, -0.560324, -2.638185, 1, 0.7960784, 0, 1,
-1.209845, 1.622051, -1.301312, 1, 0.8039216, 0, 1,
-1.202146, -1.489629, -2.683236, 1, 0.8117647, 0, 1,
-1.202095, 0.07681718, -1.974408, 1, 0.8156863, 0, 1,
-1.197147, -1.507747, -2.174304, 1, 0.8235294, 0, 1,
-1.196461, 1.267871, -1.406977, 1, 0.827451, 0, 1,
-1.194155, -2.519918, -1.937698, 1, 0.8352941, 0, 1,
-1.187194, -0.1466659, -3.662275, 1, 0.8392157, 0, 1,
-1.184852, -0.1416722, -2.42312, 1, 0.8470588, 0, 1,
-1.181352, -0.5491131, -2.249783, 1, 0.8509804, 0, 1,
-1.174544, 1.123846, -1.287885, 1, 0.8588235, 0, 1,
-1.17109, 0.563122, -0.6993932, 1, 0.8627451, 0, 1,
-1.168808, 0.1897647, -1.472899, 1, 0.8705882, 0, 1,
-1.167087, -0.02820689, -1.040487, 1, 0.8745098, 0, 1,
-1.165522, -0.1704043, -0.5022964, 1, 0.8823529, 0, 1,
-1.165034, -2.255575, -2.779575, 1, 0.8862745, 0, 1,
-1.162693, -2.286471, -1.801834, 1, 0.8941177, 0, 1,
-1.160314, -0.0811959, -2.204898, 1, 0.8980392, 0, 1,
-1.158247, -1.393876, -3.895562, 1, 0.9058824, 0, 1,
-1.157822, 1.637969, 0.7655603, 1, 0.9137255, 0, 1,
-1.157338, -0.6137676, -2.276225, 1, 0.9176471, 0, 1,
-1.157065, 0.9111438, -0.1069876, 1, 0.9254902, 0, 1,
-1.156074, -0.8528211, -1.435241, 1, 0.9294118, 0, 1,
-1.140882, 0.3188663, -0.6185569, 1, 0.9372549, 0, 1,
-1.13528, -0.3134907, -1.767727, 1, 0.9411765, 0, 1,
-1.134541, -0.9239194, -1.820257, 1, 0.9490196, 0, 1,
-1.133275, -1.111087, -2.827209, 1, 0.9529412, 0, 1,
-1.131015, 0.321323, -1.584087, 1, 0.9607843, 0, 1,
-1.126027, 0.8965708, -0.1232521, 1, 0.9647059, 0, 1,
-1.120168, 0.07478409, -0.3534719, 1, 0.972549, 0, 1,
-1.117342, 2.258782, -2.44719, 1, 0.9764706, 0, 1,
-1.112148, -0.0004103079, -1.642254, 1, 0.9843137, 0, 1,
-1.109236, 0.1134629, -0.7923478, 1, 0.9882353, 0, 1,
-1.10848, -0.2099474, -2.024216, 1, 0.9960784, 0, 1,
-1.107611, -0.6082658, -0.9755359, 0.9960784, 1, 0, 1,
-1.105348, -0.9845111, -1.071947, 0.9921569, 1, 0, 1,
-1.10078, 0.2292231, -0.1076528, 0.9843137, 1, 0, 1,
-1.09297, 0.6982206, -1.317251, 0.9803922, 1, 0, 1,
-1.091496, 0.3779068, -0.4708208, 0.972549, 1, 0, 1,
-1.091285, -1.929305, -2.190535, 0.9686275, 1, 0, 1,
-1.089064, -0.2766466, -0.5156897, 0.9607843, 1, 0, 1,
-1.08663, 1.003504, -1.825432, 0.9568627, 1, 0, 1,
-1.070617, -0.8634613, -2.261013, 0.9490196, 1, 0, 1,
-1.070598, 0.923542, -0.3906989, 0.945098, 1, 0, 1,
-1.058463, -0.09173542, -0.5265684, 0.9372549, 1, 0, 1,
-1.05458, 0.4698949, -1.468468, 0.9333333, 1, 0, 1,
-1.051889, 1.803544, -0.08325275, 0.9254902, 1, 0, 1,
-1.051187, -1.930088, -3.666333, 0.9215686, 1, 0, 1,
-1.045203, -0.9698598, -1.651052, 0.9137255, 1, 0, 1,
-1.025833, -1.451026, -2.134569, 0.9098039, 1, 0, 1,
-1.025583, 1.608388, 1.234051, 0.9019608, 1, 0, 1,
-1.024007, 1.088301, -0.0971728, 0.8941177, 1, 0, 1,
-1.023454, -0.00273998, -0.9749007, 0.8901961, 1, 0, 1,
-1.021123, 2.433117, -1.148914, 0.8823529, 1, 0, 1,
-1.011826, 1.527761, -2.019848, 0.8784314, 1, 0, 1,
-1.009444, -0.7039832, -2.422326, 0.8705882, 1, 0, 1,
-1.008153, 0.5056469, 0.96704, 0.8666667, 1, 0, 1,
-1.007173, 0.7816928, -0.1646179, 0.8588235, 1, 0, 1,
-1.003547, -0.1815643, 0.349343, 0.854902, 1, 0, 1,
-0.9977223, 0.7729141, -0.3423769, 0.8470588, 1, 0, 1,
-0.9962092, -0.9217502, -2.470721, 0.8431373, 1, 0, 1,
-0.9937186, 1.329772, -0.4048324, 0.8352941, 1, 0, 1,
-0.9931321, -0.1252452, -1.556508, 0.8313726, 1, 0, 1,
-0.9923685, -0.905172, -2.275756, 0.8235294, 1, 0, 1,
-0.9885234, -0.7265417, -3.526626, 0.8196079, 1, 0, 1,
-0.9821747, 0.2640826, -2.723386, 0.8117647, 1, 0, 1,
-0.9738338, -0.2805836, -2.479849, 0.8078431, 1, 0, 1,
-0.9708083, 0.3701355, 0.514787, 0.8, 1, 0, 1,
-0.9706737, 0.2727342, -2.135561, 0.7921569, 1, 0, 1,
-0.970547, -0.2778593, -2.917091, 0.7882353, 1, 0, 1,
-0.970009, 1.183187, 1.189394, 0.7803922, 1, 0, 1,
-0.9600506, -2.235467, -3.169543, 0.7764706, 1, 0, 1,
-0.9554893, -2.360173, -3.087696, 0.7686275, 1, 0, 1,
-0.9512442, -0.8307841, -3.044383, 0.7647059, 1, 0, 1,
-0.9487751, 0.02005201, -0.8491855, 0.7568628, 1, 0, 1,
-0.9482272, -0.1527625, -1.849252, 0.7529412, 1, 0, 1,
-0.938369, -0.9029232, -0.3847572, 0.7450981, 1, 0, 1,
-0.9285815, 0.5761708, -1.107252, 0.7411765, 1, 0, 1,
-0.9263238, 0.9385563, -0.8241564, 0.7333333, 1, 0, 1,
-0.9229239, -0.04147412, -1.365429, 0.7294118, 1, 0, 1,
-0.9164659, 0.1082287, -1.202107, 0.7215686, 1, 0, 1,
-0.914983, -0.884308, -0.56764, 0.7176471, 1, 0, 1,
-0.9137454, -0.1854259, -0.6769282, 0.7098039, 1, 0, 1,
-0.91002, 0.7559618, 1.010927, 0.7058824, 1, 0, 1,
-0.9076081, -0.7474576, -2.131066, 0.6980392, 1, 0, 1,
-0.9062023, 0.3578582, -2.133566, 0.6901961, 1, 0, 1,
-0.9055874, 0.2802255, -1.060481, 0.6862745, 1, 0, 1,
-0.9012948, 0.174346, -1.186228, 0.6784314, 1, 0, 1,
-0.8971872, 0.4112409, -2.928934, 0.6745098, 1, 0, 1,
-0.8894272, -0.5114094, -1.590952, 0.6666667, 1, 0, 1,
-0.8813103, 0.4052422, -2.275763, 0.6627451, 1, 0, 1,
-0.8764369, 1.662397, -0.5530394, 0.654902, 1, 0, 1,
-0.8732796, -0.007291127, -1.45585, 0.6509804, 1, 0, 1,
-0.866227, 3.024106, -1.09854, 0.6431373, 1, 0, 1,
-0.8645658, 0.8523599, 0.1882265, 0.6392157, 1, 0, 1,
-0.864413, -0.8342273, -1.284329, 0.6313726, 1, 0, 1,
-0.8577381, 0.4278453, -2.792461, 0.627451, 1, 0, 1,
-0.8492282, 0.5303235, -2.138573, 0.6196079, 1, 0, 1,
-0.8470437, -0.1077147, -2.176011, 0.6156863, 1, 0, 1,
-0.8420566, -0.6124166, -3.276256, 0.6078432, 1, 0, 1,
-0.8400011, 0.6858242, -0.4181278, 0.6039216, 1, 0, 1,
-0.8377161, -0.2579576, 0.6875709, 0.5960785, 1, 0, 1,
-0.8362884, 0.4287542, -1.848421, 0.5882353, 1, 0, 1,
-0.8299457, -1.096484, -3.889407, 0.5843138, 1, 0, 1,
-0.8297655, 1.11214, -0.2659481, 0.5764706, 1, 0, 1,
-0.8284035, 0.7158682, 0.7018229, 0.572549, 1, 0, 1,
-0.8248546, -0.08164737, -1.50158, 0.5647059, 1, 0, 1,
-0.8227499, -0.9738293, -2.922706, 0.5607843, 1, 0, 1,
-0.8209909, -0.1239215, -1.703606, 0.5529412, 1, 0, 1,
-0.8158357, -0.2574689, -2.44757, 0.5490196, 1, 0, 1,
-0.8115666, 1.267105, -0.2866009, 0.5411765, 1, 0, 1,
-0.8071879, -0.7564869, -2.007748, 0.5372549, 1, 0, 1,
-0.8064562, 0.5340794, -1.180434, 0.5294118, 1, 0, 1,
-0.8001394, 1.488979, 1.35506, 0.5254902, 1, 0, 1,
-0.7982635, 2.420706, -2.32475, 0.5176471, 1, 0, 1,
-0.7940019, -0.3583654, -3.804397, 0.5137255, 1, 0, 1,
-0.7800301, 1.170139, -1.390577, 0.5058824, 1, 0, 1,
-0.7791649, -1.265633, -0.5736035, 0.5019608, 1, 0, 1,
-0.7778099, -0.7016048, -1.624121, 0.4941176, 1, 0, 1,
-0.7774912, -1.333227, -0.7064691, 0.4862745, 1, 0, 1,
-0.7675959, -0.4821481, -0.749615, 0.4823529, 1, 0, 1,
-0.7591677, 0.1476213, -0.3382977, 0.4745098, 1, 0, 1,
-0.747033, 0.3490081, 0.5031295, 0.4705882, 1, 0, 1,
-0.7233135, -0.4439902, -1.319236, 0.4627451, 1, 0, 1,
-0.7132649, -0.4035731, -0.6370609, 0.4588235, 1, 0, 1,
-0.7097735, 0.8322197, -1.076943, 0.4509804, 1, 0, 1,
-0.7065533, -0.03006659, -2.146286, 0.4470588, 1, 0, 1,
-0.7058607, 0.2277945, -1.224806, 0.4392157, 1, 0, 1,
-0.7029962, -2.155423, -2.754979, 0.4352941, 1, 0, 1,
-0.7023305, -0.3395556, -0.7657414, 0.427451, 1, 0, 1,
-0.692311, 1.871144, 0.9937538, 0.4235294, 1, 0, 1,
-0.690518, -0.07491022, -2.10135, 0.4156863, 1, 0, 1,
-0.6806037, 0.9232467, -0.6786701, 0.4117647, 1, 0, 1,
-0.6772304, -0.5565454, 0.3290824, 0.4039216, 1, 0, 1,
-0.6630605, -0.3440042, -1.495652, 0.3960784, 1, 0, 1,
-0.6579306, -0.03782908, -0.3465353, 0.3921569, 1, 0, 1,
-0.6467924, -0.3610228, -3.745779, 0.3843137, 1, 0, 1,
-0.6444707, -1.257377, -3.179889, 0.3803922, 1, 0, 1,
-0.6411769, 0.8418889, -0.2102609, 0.372549, 1, 0, 1,
-0.6401115, 0.4152598, -0.8950779, 0.3686275, 1, 0, 1,
-0.6361147, 1.328278, -0.8834732, 0.3607843, 1, 0, 1,
-0.6348552, 2.942716, 1.745265, 0.3568628, 1, 0, 1,
-0.6331819, -0.3669351, -4.178561, 0.3490196, 1, 0, 1,
-0.6275515, -0.5205179, -1.612965, 0.345098, 1, 0, 1,
-0.6205859, 0.5384592, -1.680817, 0.3372549, 1, 0, 1,
-0.6099332, -0.8704858, -5.044423, 0.3333333, 1, 0, 1,
-0.6066825, -0.2839388, -3.275026, 0.3254902, 1, 0, 1,
-0.5996674, 1.964973, 0.3622095, 0.3215686, 1, 0, 1,
-0.5991511, 0.6814991, 0.2211913, 0.3137255, 1, 0, 1,
-0.5990588, -2.353154, -2.072079, 0.3098039, 1, 0, 1,
-0.5980834, -0.7225179, -2.083522, 0.3019608, 1, 0, 1,
-0.5966476, -1.118031, -3.610173, 0.2941177, 1, 0, 1,
-0.5922943, 1.682157, -0.9327491, 0.2901961, 1, 0, 1,
-0.5899329, -0.6981168, -1.912419, 0.282353, 1, 0, 1,
-0.5879607, 1.044047, -1.297157, 0.2784314, 1, 0, 1,
-0.5804952, 0.3426648, -0.6360915, 0.2705882, 1, 0, 1,
-0.5775563, 1.336959, 0.6015018, 0.2666667, 1, 0, 1,
-0.5748471, -0.872419, -3.403105, 0.2588235, 1, 0, 1,
-0.5726147, 0.05184662, -0.7384307, 0.254902, 1, 0, 1,
-0.5722903, -0.251854, -0.9261011, 0.2470588, 1, 0, 1,
-0.5707, -0.3224492, -2.682618, 0.2431373, 1, 0, 1,
-0.5700589, -0.09007793, -2.256003, 0.2352941, 1, 0, 1,
-0.5687757, -0.901784, -3.954953, 0.2313726, 1, 0, 1,
-0.5653476, -0.0446303, -1.680665, 0.2235294, 1, 0, 1,
-0.559275, -0.8427759, -3.662912, 0.2196078, 1, 0, 1,
-0.5592448, 0.2208783, -1.743084, 0.2117647, 1, 0, 1,
-0.5528744, 0.8763623, -0.9881573, 0.2078431, 1, 0, 1,
-0.5459207, -0.01622288, -0.2296846, 0.2, 1, 0, 1,
-0.545293, 1.550116, -0.6742732, 0.1921569, 1, 0, 1,
-0.5451853, -0.5138213, -1.382336, 0.1882353, 1, 0, 1,
-0.5344438, -0.4696088, -2.195932, 0.1803922, 1, 0, 1,
-0.5320809, 0.6560056, -2.147937, 0.1764706, 1, 0, 1,
-0.5317239, -1.112841, -5.080067, 0.1686275, 1, 0, 1,
-0.5315049, -0.7950842, -1.834895, 0.1647059, 1, 0, 1,
-0.531443, -0.3944263, -4.19814, 0.1568628, 1, 0, 1,
-0.5291009, -1.062201, -2.86073, 0.1529412, 1, 0, 1,
-0.527779, -0.4513741, -2.111389, 0.145098, 1, 0, 1,
-0.5272504, -1.413627, -2.817994, 0.1411765, 1, 0, 1,
-0.5272327, -0.236528, -1.707159, 0.1333333, 1, 0, 1,
-0.5204717, 0.8445337, -1.845516, 0.1294118, 1, 0, 1,
-0.5190951, -1.610911, -3.213919, 0.1215686, 1, 0, 1,
-0.5189077, 0.8105279, -0.6670123, 0.1176471, 1, 0, 1,
-0.5182024, -0.9045997, -1.796237, 0.1098039, 1, 0, 1,
-0.5173387, 0.3019738, -0.1699477, 0.1058824, 1, 0, 1,
-0.5143354, 1.409031, -0.2056659, 0.09803922, 1, 0, 1,
-0.5112354, -1.348472, -2.511807, 0.09019608, 1, 0, 1,
-0.5092335, -1.485972, -0.4082395, 0.08627451, 1, 0, 1,
-0.508291, 0.8491671, -0.3034995, 0.07843138, 1, 0, 1,
-0.5074073, 1.374039, -0.7866265, 0.07450981, 1, 0, 1,
-0.5058879, -1.402947, -1.923896, 0.06666667, 1, 0, 1,
-0.5047839, -1.106566, -2.666758, 0.0627451, 1, 0, 1,
-0.502309, -0.4872763, -1.726287, 0.05490196, 1, 0, 1,
-0.4989921, -0.8610857, -3.731345, 0.05098039, 1, 0, 1,
-0.4986401, 0.3099547, -1.979069, 0.04313726, 1, 0, 1,
-0.4984893, 0.6381154, 0.1011304, 0.03921569, 1, 0, 1,
-0.4935287, 0.9826016, 0.220956, 0.03137255, 1, 0, 1,
-0.4857919, -0.4468316, -2.250277, 0.02745098, 1, 0, 1,
-0.4812577, -0.0009092294, -2.580115, 0.01960784, 1, 0, 1,
-0.4792898, -1.923417, -1.248157, 0.01568628, 1, 0, 1,
-0.4734583, -1.06044, -1.761195, 0.007843138, 1, 0, 1,
-0.4693694, 1.220355, -0.6635609, 0.003921569, 1, 0, 1,
-0.4631622, 0.6422725, -0.6920226, 0, 1, 0.003921569, 1,
-0.4589411, -0.01490737, -2.745263, 0, 1, 0.01176471, 1,
-0.4574008, -0.0769847, -0.9761537, 0, 1, 0.01568628, 1,
-0.4550535, -0.3038269, -3.964956, 0, 1, 0.02352941, 1,
-0.4536594, 0.8113665, -2.206938, 0, 1, 0.02745098, 1,
-0.4524484, 0.1357047, -4.337195, 0, 1, 0.03529412, 1,
-0.4492082, 0.1152689, -1.916845, 0, 1, 0.03921569, 1,
-0.4478822, -0.02549043, -1.346009, 0, 1, 0.04705882, 1,
-0.4435323, -1.018229, -2.152659, 0, 1, 0.05098039, 1,
-0.4431643, -0.6466088, -1.214998, 0, 1, 0.05882353, 1,
-0.4426518, 0.5956331, -0.4293909, 0, 1, 0.0627451, 1,
-0.4408997, 0.7609885, -0.5050458, 0, 1, 0.07058824, 1,
-0.438787, -1.534185, -2.673991, 0, 1, 0.07450981, 1,
-0.4385063, 0.5761512, -2.80609, 0, 1, 0.08235294, 1,
-0.4367553, 0.5188442, 1.565943, 0, 1, 0.08627451, 1,
-0.4229591, -1.694484, -3.970891, 0, 1, 0.09411765, 1,
-0.4229275, 1.235165, 0.03530319, 0, 1, 0.1019608, 1,
-0.4159576, -0.7370124, -1.351205, 0, 1, 0.1058824, 1,
-0.4098678, -0.4127516, -4.604025, 0, 1, 0.1137255, 1,
-0.4087511, 0.08229286, -3.454206, 0, 1, 0.1176471, 1,
-0.4087157, 0.776661, 1.997978, 0, 1, 0.1254902, 1,
-0.4069195, -1.588196, -3.253414, 0, 1, 0.1294118, 1,
-0.4042856, -1.546746, -3.067688, 0, 1, 0.1372549, 1,
-0.4016316, -0.324535, -0.569742, 0, 1, 0.1411765, 1,
-0.4002038, -0.3838942, -1.115667, 0, 1, 0.1490196, 1,
-0.397677, 0.8230515, 0.1338692, 0, 1, 0.1529412, 1,
-0.3932539, -0.6386271, -2.692262, 0, 1, 0.1607843, 1,
-0.3928565, -1.147946, -3.742927, 0, 1, 0.1647059, 1,
-0.3897877, 0.8384014, -1.114708, 0, 1, 0.172549, 1,
-0.3863119, 0.5509043, -1.900032, 0, 1, 0.1764706, 1,
-0.3842958, -0.4752093, -2.802833, 0, 1, 0.1843137, 1,
-0.382535, -0.309628, -2.818366, 0, 1, 0.1882353, 1,
-0.3815039, 0.9467716, -0.5438012, 0, 1, 0.1960784, 1,
-0.3775416, 0.5681998, -0.3254856, 0, 1, 0.2039216, 1,
-0.3730424, 0.5472077, -1.428505, 0, 1, 0.2078431, 1,
-0.3695486, -0.09521786, -1.232367, 0, 1, 0.2156863, 1,
-0.3687218, 1.268914, -1.425283, 0, 1, 0.2196078, 1,
-0.3662742, 0.9423181, -1.107842, 0, 1, 0.227451, 1,
-0.3656794, 0.5991857, -1.434618, 0, 1, 0.2313726, 1,
-0.3634762, 1.902295, 1.713395, 0, 1, 0.2392157, 1,
-0.3632553, 1.047267, 1.41554, 0, 1, 0.2431373, 1,
-0.362691, 0.8665844, 0.3261434, 0, 1, 0.2509804, 1,
-0.3625562, -0.009526956, -1.82431, 0, 1, 0.254902, 1,
-0.3619209, 1.290904, 1.269803, 0, 1, 0.2627451, 1,
-0.3606714, -2.076725, -3.341596, 0, 1, 0.2666667, 1,
-0.3576359, -1.158317, -2.071358, 0, 1, 0.2745098, 1,
-0.3574371, -0.4543176, -2.683216, 0, 1, 0.2784314, 1,
-0.3529229, -0.5522149, -1.419108, 0, 1, 0.2862745, 1,
-0.3463764, 1.478592, -0.4365347, 0, 1, 0.2901961, 1,
-0.3461435, -1.205955, -2.789416, 0, 1, 0.2980392, 1,
-0.3449039, -0.576589, -2.479649, 0, 1, 0.3058824, 1,
-0.3394876, -2.248608, -2.312003, 0, 1, 0.3098039, 1,
-0.3379337, -1.389088, -3.557687, 0, 1, 0.3176471, 1,
-0.3372105, 1.257383, 0.6721509, 0, 1, 0.3215686, 1,
-0.3353062, 0.4447868, -1.194581, 0, 1, 0.3294118, 1,
-0.3311812, 1.784497, 1.049507, 0, 1, 0.3333333, 1,
-0.324791, -1.149744, -3.208528, 0, 1, 0.3411765, 1,
-0.3195539, -0.2610799, -3.832504, 0, 1, 0.345098, 1,
-0.3153585, -0.3513554, -2.062963, 0, 1, 0.3529412, 1,
-0.3146107, 0.06682048, -1.217267, 0, 1, 0.3568628, 1,
-0.3107769, -0.6436288, -2.726981, 0, 1, 0.3647059, 1,
-0.30877, -0.9229094, -2.76131, 0, 1, 0.3686275, 1,
-0.3078882, 0.8056037, -0.4289485, 0, 1, 0.3764706, 1,
-0.306262, -1.511509, -3.687772, 0, 1, 0.3803922, 1,
-0.3047948, -0.7435327, -1.152515, 0, 1, 0.3882353, 1,
-0.3022648, 0.03134222, -1.426229, 0, 1, 0.3921569, 1,
-0.3013057, -2.080009, -4.628845, 0, 1, 0.4, 1,
-0.2963122, -0.5866291, -2.566874, 0, 1, 0.4078431, 1,
-0.2941786, 0.02159075, -1.408417, 0, 1, 0.4117647, 1,
-0.2931856, 0.7105356, -0.7095509, 0, 1, 0.4196078, 1,
-0.2921251, 0.8044707, 1.000992, 0, 1, 0.4235294, 1,
-0.2887972, 0.2139767, -1.381777, 0, 1, 0.4313726, 1,
-0.2789626, -1.207174, -1.079569, 0, 1, 0.4352941, 1,
-0.277075, -0.7942293, -1.363012, 0, 1, 0.4431373, 1,
-0.2748473, 2.054903, -0.8550757, 0, 1, 0.4470588, 1,
-0.2718188, 0.6949008, -0.976766, 0, 1, 0.454902, 1,
-0.269247, -0.5296156, -3.895033, 0, 1, 0.4588235, 1,
-0.2661904, -0.5986626, -1.984957, 0, 1, 0.4666667, 1,
-0.2640959, 0.3536528, -0.2882503, 0, 1, 0.4705882, 1,
-0.2624153, 0.6077865, -0.9169149, 0, 1, 0.4784314, 1,
-0.2598752, -0.6985476, -3.627979, 0, 1, 0.4823529, 1,
-0.2594265, 0.4032059, -0.2072171, 0, 1, 0.4901961, 1,
-0.2581483, 0.06848259, -1.175247, 0, 1, 0.4941176, 1,
-0.2557409, 0.3680476, -0.3665839, 0, 1, 0.5019608, 1,
-0.2555408, -0.9172422, -3.417531, 0, 1, 0.509804, 1,
-0.2494434, -1.74846, -4.095073, 0, 1, 0.5137255, 1,
-0.2457373, -0.1861368, -2.974427, 0, 1, 0.5215687, 1,
-0.24504, 0.4015795, 1.408307, 0, 1, 0.5254902, 1,
-0.2383119, -0.7955109, -1.678652, 0, 1, 0.5333334, 1,
-0.2359675, -0.757277, -0.444189, 0, 1, 0.5372549, 1,
-0.2353605, 0.681103, 0.6033805, 0, 1, 0.5450981, 1,
-0.2342487, 0.3631333, -1.110062, 0, 1, 0.5490196, 1,
-0.2339478, -0.1559409, -2.263269, 0, 1, 0.5568628, 1,
-0.233129, 1.603602, 0.3330862, 0, 1, 0.5607843, 1,
-0.2306984, 0.1453993, -1.147047, 0, 1, 0.5686275, 1,
-0.2250546, 0.08259684, 0.5179918, 0, 1, 0.572549, 1,
-0.2242817, -2.018055, -2.194016, 0, 1, 0.5803922, 1,
-0.2226683, -0.1054158, -2.172044, 0, 1, 0.5843138, 1,
-0.2209908, 0.06890014, -0.6569033, 0, 1, 0.5921569, 1,
-0.2207702, -0.8690506, -2.517224, 0, 1, 0.5960785, 1,
-0.2083238, 0.3499257, 0.3016891, 0, 1, 0.6039216, 1,
-0.2082282, 1.053345, -0.7526715, 0, 1, 0.6117647, 1,
-0.2061298, -0.8569548, -1.154689, 0, 1, 0.6156863, 1,
-0.2048172, -1.412041, -3.350189, 0, 1, 0.6235294, 1,
-0.1992752, 0.8733046, 0.2701517, 0, 1, 0.627451, 1,
-0.1975714, 2.041837, -1.417657, 0, 1, 0.6352941, 1,
-0.1939883, -0.5882742, -3.323598, 0, 1, 0.6392157, 1,
-0.1934858, -0.3596639, -3.271273, 0, 1, 0.6470588, 1,
-0.1922684, -1.548535, -2.95279, 0, 1, 0.6509804, 1,
-0.1860858, -0.9675679, -2.760957, 0, 1, 0.6588235, 1,
-0.1810509, -0.8924314, -4.469237, 0, 1, 0.6627451, 1,
-0.1801621, -0.01362564, -1.559428, 0, 1, 0.6705883, 1,
-0.1792512, 0.485492, -1.699834, 0, 1, 0.6745098, 1,
-0.1776632, -0.06538065, -0.7484948, 0, 1, 0.682353, 1,
-0.1750569, 0.1785848, 1.181938, 0, 1, 0.6862745, 1,
-0.1745054, -1.40107, -4.929021, 0, 1, 0.6941177, 1,
-0.1731973, -0.5439139, -3.824235, 0, 1, 0.7019608, 1,
-0.1725409, 0.2438562, 0.1489644, 0, 1, 0.7058824, 1,
-0.1704611, -0.5381751, -0.6529589, 0, 1, 0.7137255, 1,
-0.1689132, 2.246266, -0.245944, 0, 1, 0.7176471, 1,
-0.1624509, -0.1129679, -4.78826, 0, 1, 0.7254902, 1,
-0.1618484, -2.572552, -4.92781, 0, 1, 0.7294118, 1,
-0.1602953, -0.2979959, -2.769109, 0, 1, 0.7372549, 1,
-0.1570975, 1.63977, -0.6818051, 0, 1, 0.7411765, 1,
-0.1560595, 1.906117, -0.8940426, 0, 1, 0.7490196, 1,
-0.1555323, -1.059676, -2.614367, 0, 1, 0.7529412, 1,
-0.1546277, 0.9312345, 1.639477, 0, 1, 0.7607843, 1,
-0.1423119, 0.6014266, 0.4184783, 0, 1, 0.7647059, 1,
-0.1378607, 0.09724528, -0.08692376, 0, 1, 0.772549, 1,
-0.1333174, -0.1717067, -3.219116, 0, 1, 0.7764706, 1,
-0.1286545, 0.05937829, -1.977328, 0, 1, 0.7843137, 1,
-0.1278757, -0.6852852, -2.985256, 0, 1, 0.7882353, 1,
-0.1265209, -0.9709367, -1.328574, 0, 1, 0.7960784, 1,
-0.1261521, -1.541083, -2.167003, 0, 1, 0.8039216, 1,
-0.1239731, 0.6571516, -1.799796, 0, 1, 0.8078431, 1,
-0.1217647, -0.6740378, -4.860549, 0, 1, 0.8156863, 1,
-0.1192685, -1.132824, -4.350256, 0, 1, 0.8196079, 1,
-0.115127, -0.1994984, -3.418947, 0, 1, 0.827451, 1,
-0.1128928, -0.7138136, -4.781305, 0, 1, 0.8313726, 1,
-0.1100749, -1.727293, -2.316178, 0, 1, 0.8392157, 1,
-0.109812, -0.1772808, -2.39593, 0, 1, 0.8431373, 1,
-0.1095824, -0.8897822, -2.994563, 0, 1, 0.8509804, 1,
-0.1082835, -1.147086, -1.654125, 0, 1, 0.854902, 1,
-0.1049766, 0.9226088, 0.6530498, 0, 1, 0.8627451, 1,
-0.1015785, 0.5490282, -0.1237123, 0, 1, 0.8666667, 1,
-0.09282429, 0.5942914, 0.603535, 0, 1, 0.8745098, 1,
-0.09207151, 0.892055, -1.368443, 0, 1, 0.8784314, 1,
-0.08863766, -1.417733, -4.362813, 0, 1, 0.8862745, 1,
-0.08539657, -1.039501, -2.157922, 0, 1, 0.8901961, 1,
-0.08538816, 1.800439, -0.7465838, 0, 1, 0.8980392, 1,
-0.08317521, 0.127169, -0.9670965, 0, 1, 0.9058824, 1,
-0.07537242, -0.7153968, -0.7237741, 0, 1, 0.9098039, 1,
-0.07471607, -0.2952541, -2.472056, 0, 1, 0.9176471, 1,
-0.07038042, -0.9725781, -2.989499, 0, 1, 0.9215686, 1,
-0.06930866, 0.6331763, -1.541642, 0, 1, 0.9294118, 1,
-0.06603696, -0.5010849, -2.378639, 0, 1, 0.9333333, 1,
-0.06489427, -1.323074, -4.182553, 0, 1, 0.9411765, 1,
-0.06311424, 0.845431, 0.8736566, 0, 1, 0.945098, 1,
-0.06303542, -0.851759, -3.332389, 0, 1, 0.9529412, 1,
-0.05784035, 0.4066727, -0.1300616, 0, 1, 0.9568627, 1,
-0.05697859, 1.249874, 1.478152, 0, 1, 0.9647059, 1,
-0.05633148, 2.4166, -0.2796965, 0, 1, 0.9686275, 1,
-0.04934546, -0.8615101, -3.25672, 0, 1, 0.9764706, 1,
-0.04872951, -0.8217814, -2.9627, 0, 1, 0.9803922, 1,
-0.04616098, 0.3617189, 0.6165864, 0, 1, 0.9882353, 1,
-0.0448911, 0.02111979, -0.7595049, 0, 1, 0.9921569, 1,
-0.04410191, 2.032683, 1.455454, 0, 1, 1, 1,
-0.04292623, 1.164126, -0.7313878, 0, 0.9921569, 1, 1,
-0.04209807, -3.020313, -2.67195, 0, 0.9882353, 1, 1,
-0.04179006, 0.4524437, -0.429729, 0, 0.9803922, 1, 1,
-0.03700732, -0.3911742, -3.381805, 0, 0.9764706, 1, 1,
-0.03377657, 0.3304491, -1.469667, 0, 0.9686275, 1, 1,
-0.03135923, 0.9025235, -0.8170399, 0, 0.9647059, 1, 1,
-0.03049891, 1.281684, -0.4562523, 0, 0.9568627, 1, 1,
-0.02819706, 0.4472536, -0.8355594, 0, 0.9529412, 1, 1,
-0.01880562, -0.04267842, -4.549391, 0, 0.945098, 1, 1,
-0.01715385, -0.7189856, -1.934211, 0, 0.9411765, 1, 1,
-0.01172962, -0.08268639, -4.677486, 0, 0.9333333, 1, 1,
-0.007879994, -0.3433275, -4.305776, 0, 0.9294118, 1, 1,
-0.002106056, -0.2592461, -3.491699, 0, 0.9215686, 1, 1,
-0.001046495, 0.3035188, 1.561202, 0, 0.9176471, 1, 1,
0.001246032, -0.3160687, 2.738707, 0, 0.9098039, 1, 1,
0.002475607, 0.2135736, 0.825718, 0, 0.9058824, 1, 1,
0.01116835, 0.2045997, 0.1769657, 0, 0.8980392, 1, 1,
0.01121186, -0.2010645, 5.171439, 0, 0.8901961, 1, 1,
0.01422798, -1.333769, 3.131152, 0, 0.8862745, 1, 1,
0.01631473, 1.793827, 0.7602907, 0, 0.8784314, 1, 1,
0.01638885, -0.5100993, 3.419738, 0, 0.8745098, 1, 1,
0.01912718, 1.161009, 1.251627, 0, 0.8666667, 1, 1,
0.02123796, -0.3524974, 3.559351, 0, 0.8627451, 1, 1,
0.02252707, -2.437678, 3.395451, 0, 0.854902, 1, 1,
0.02869043, -2.844961, 4.449295, 0, 0.8509804, 1, 1,
0.02955163, 0.6974204, 0.914435, 0, 0.8431373, 1, 1,
0.03066551, -0.5252595, 2.669996, 0, 0.8392157, 1, 1,
0.0361352, 0.180752, 1.557797, 0, 0.8313726, 1, 1,
0.03617105, 0.3602583, -0.8618677, 0, 0.827451, 1, 1,
0.03661048, 0.2577823, 0.1415692, 0, 0.8196079, 1, 1,
0.03718106, 1.271992, 0.3195666, 0, 0.8156863, 1, 1,
0.0410447, 1.650117, 0.4772122, 0, 0.8078431, 1, 1,
0.04196977, 0.02685336, 1.830139, 0, 0.8039216, 1, 1,
0.04262211, -0.8606101, 4.127816, 0, 0.7960784, 1, 1,
0.05075661, 0.6531882, -0.1006477, 0, 0.7882353, 1, 1,
0.05523119, -0.4746243, 3.776618, 0, 0.7843137, 1, 1,
0.05586822, -1.21394, 2.778378, 0, 0.7764706, 1, 1,
0.06148786, -1.163693, 2.167797, 0, 0.772549, 1, 1,
0.06845947, 0.8843381, -1.012043, 0, 0.7647059, 1, 1,
0.07207271, 3.181943, -1.424768, 0, 0.7607843, 1, 1,
0.07309949, 1.156814, -0.4766157, 0, 0.7529412, 1, 1,
0.07742685, -0.6850942, 4.022283, 0, 0.7490196, 1, 1,
0.0785402, 1.094968, -0.7314689, 0, 0.7411765, 1, 1,
0.07933465, 0.7076409, 0.6573238, 0, 0.7372549, 1, 1,
0.08049614, 0.08365279, 1.199211, 0, 0.7294118, 1, 1,
0.08077846, 1.859872, 0.02736472, 0, 0.7254902, 1, 1,
0.08265194, -0.2728476, 2.615986, 0, 0.7176471, 1, 1,
0.08406935, -0.9664871, 2.206652, 0, 0.7137255, 1, 1,
0.08485283, -0.4203945, 3.052197, 0, 0.7058824, 1, 1,
0.08585658, -0.3960223, 2.244433, 0, 0.6980392, 1, 1,
0.08663039, -2.117322, 4.015549, 0, 0.6941177, 1, 1,
0.08771409, 0.02988099, 0.3220447, 0, 0.6862745, 1, 1,
0.08963607, 0.9333253, 0.7977816, 0, 0.682353, 1, 1,
0.09088369, -1.092729, 1.819461, 0, 0.6745098, 1, 1,
0.09093741, 0.4752717, 0.07446946, 0, 0.6705883, 1, 1,
0.09590191, -1.479577, 2.671392, 0, 0.6627451, 1, 1,
0.09969211, 0.4433264, 0.7260336, 0, 0.6588235, 1, 1,
0.1081196, -0.7254583, 3.343483, 0, 0.6509804, 1, 1,
0.1104964, 1.044049, 0.565307, 0, 0.6470588, 1, 1,
0.1135089, -0.1787101, 2.162421, 0, 0.6392157, 1, 1,
0.1182855, -0.9939774, 3.845425, 0, 0.6352941, 1, 1,
0.1217929, 1.293182, 0.03626553, 0, 0.627451, 1, 1,
0.1232492, -0.2322534, 1.509918, 0, 0.6235294, 1, 1,
0.1240926, -1.279473, 3.789865, 0, 0.6156863, 1, 1,
0.1251172, -0.09057209, 2.29916, 0, 0.6117647, 1, 1,
0.1275857, -0.2844254, 2.311648, 0, 0.6039216, 1, 1,
0.1319805, -0.9374083, 4.050633, 0, 0.5960785, 1, 1,
0.1334663, 0.7178424, 0.9459314, 0, 0.5921569, 1, 1,
0.1418556, 0.1355487, 0.3229627, 0, 0.5843138, 1, 1,
0.1427415, -1.017453, 4.342079, 0, 0.5803922, 1, 1,
0.147643, -2.193134, 2.125522, 0, 0.572549, 1, 1,
0.1501109, -2.90028, 3.059538, 0, 0.5686275, 1, 1,
0.1591693, -0.4854907, 2.873524, 0, 0.5607843, 1, 1,
0.1641514, -0.4632043, 3.28943, 0, 0.5568628, 1, 1,
0.1649792, -1.705499, 4.099704, 0, 0.5490196, 1, 1,
0.1688248, -1.422927, 3.130991, 0, 0.5450981, 1, 1,
0.1703389, 0.07935344, 0.8250028, 0, 0.5372549, 1, 1,
0.1712438, -2.050464, 1.383903, 0, 0.5333334, 1, 1,
0.1787065, 1.056652, 0.4311723, 0, 0.5254902, 1, 1,
0.1806179, -0.4169453, 4.144868, 0, 0.5215687, 1, 1,
0.1861136, 1.038645, 0.9752446, 0, 0.5137255, 1, 1,
0.1880923, -0.07088383, 1.397329, 0, 0.509804, 1, 1,
0.1916417, -2.353408, 3.430815, 0, 0.5019608, 1, 1,
0.191661, -0.08605871, 2.026798, 0, 0.4941176, 1, 1,
0.1930329, 0.388126, 0.4452913, 0, 0.4901961, 1, 1,
0.1956049, -1.601857, 2.43834, 0, 0.4823529, 1, 1,
0.1966304, -0.6354254, 2.588855, 0, 0.4784314, 1, 1,
0.1993737, -0.8974009, 2.807796, 0, 0.4705882, 1, 1,
0.2022872, -2.212158, 2.599348, 0, 0.4666667, 1, 1,
0.2050784, 0.6559323, 0.4621665, 0, 0.4588235, 1, 1,
0.2065208, -0.3468761, 4.382616, 0, 0.454902, 1, 1,
0.2111418, -0.04101814, 0.9102566, 0, 0.4470588, 1, 1,
0.2112312, 0.5035294, 0.08587816, 0, 0.4431373, 1, 1,
0.2132448, 0.8244962, 0.9115032, 0, 0.4352941, 1, 1,
0.2156837, -1.403657, 2.733047, 0, 0.4313726, 1, 1,
0.2164485, 0.04572797, -0.9430542, 0, 0.4235294, 1, 1,
0.2323634, 0.1254837, 1.346187, 0, 0.4196078, 1, 1,
0.2369604, 0.3862164, 1.958416, 0, 0.4117647, 1, 1,
0.2401322, 0.9108896, 1.002799, 0, 0.4078431, 1, 1,
0.2420781, 1.429992, -0.09036206, 0, 0.4, 1, 1,
0.2424021, -0.02326305, 1.926711, 0, 0.3921569, 1, 1,
0.2464525, -1.063633, 3.270281, 0, 0.3882353, 1, 1,
0.2471979, 1.069084, -0.7670085, 0, 0.3803922, 1, 1,
0.2486491, 0.6446728, 0.09206736, 0, 0.3764706, 1, 1,
0.2526978, -0.3220159, 2.671784, 0, 0.3686275, 1, 1,
0.2538498, -1.247347, 2.213865, 0, 0.3647059, 1, 1,
0.2581553, 0.9746394, 1.048467, 0, 0.3568628, 1, 1,
0.2585073, -1.688448, 3.581359, 0, 0.3529412, 1, 1,
0.2597545, -0.4532909, 4.566942, 0, 0.345098, 1, 1,
0.2606327, 1.718843, -0.7696198, 0, 0.3411765, 1, 1,
0.2609045, 2.498379, 0.6597075, 0, 0.3333333, 1, 1,
0.2642964, -0.4746081, 2.826666, 0, 0.3294118, 1, 1,
0.2660079, -0.02904437, 2.497033, 0, 0.3215686, 1, 1,
0.2668359, 1.026004, -0.6588121, 0, 0.3176471, 1, 1,
0.2698275, 0.6174537, -0.3182181, 0, 0.3098039, 1, 1,
0.2714474, -0.1395649, 2.039333, 0, 0.3058824, 1, 1,
0.2716215, -0.2311951, 2.890562, 0, 0.2980392, 1, 1,
0.2725613, -0.2836611, 1.802642, 0, 0.2901961, 1, 1,
0.2730826, 0.1069515, 0.4139231, 0, 0.2862745, 1, 1,
0.2768214, -1.525601, 3.647338, 0, 0.2784314, 1, 1,
0.2786644, 0.2046756, 0.9371099, 0, 0.2745098, 1, 1,
0.2792666, 0.4802561, 0.2220858, 0, 0.2666667, 1, 1,
0.2823455, 0.6297531, -0.4716159, 0, 0.2627451, 1, 1,
0.2894813, -1.151202, 3.013334, 0, 0.254902, 1, 1,
0.2900217, -0.8258238, 2.864702, 0, 0.2509804, 1, 1,
0.2975603, 0.383955, -0.5188025, 0, 0.2431373, 1, 1,
0.3011457, -0.2040188, 1.789727, 0, 0.2392157, 1, 1,
0.3044081, -1.08231, 3.913114, 0, 0.2313726, 1, 1,
0.311902, 0.4011924, -0.2162351, 0, 0.227451, 1, 1,
0.3144594, -1.520443, 4.317607, 0, 0.2196078, 1, 1,
0.3160004, 0.320915, 1.418708, 0, 0.2156863, 1, 1,
0.3171875, -0.2796539, 1.0661, 0, 0.2078431, 1, 1,
0.3183141, 2.705274, 0.6722019, 0, 0.2039216, 1, 1,
0.3260605, 0.9103287, 1.232512, 0, 0.1960784, 1, 1,
0.3282586, 0.7992268, 0.6072635, 0, 0.1882353, 1, 1,
0.3313886, 0.4956135, -0.2212888, 0, 0.1843137, 1, 1,
0.3333261, 1.304523, 0.9531732, 0, 0.1764706, 1, 1,
0.3347009, 1.230792, 0.6862243, 0, 0.172549, 1, 1,
0.335377, -0.1483092, 3.265298, 0, 0.1647059, 1, 1,
0.3479207, -1.328304, 2.315165, 0, 0.1607843, 1, 1,
0.3551013, 1.459787, 0.5103818, 0, 0.1529412, 1, 1,
0.3564826, 0.4757802, 1.710799, 0, 0.1490196, 1, 1,
0.3705627, 1.042163, 1.117062, 0, 0.1411765, 1, 1,
0.3716971, -0.8607621, 2.482571, 0, 0.1372549, 1, 1,
0.3722976, 0.4796835, 1.358584, 0, 0.1294118, 1, 1,
0.3734159, 0.009743751, 1.433003, 0, 0.1254902, 1, 1,
0.3757284, 0.05996742, 1.554133, 0, 0.1176471, 1, 1,
0.3810025, 0.2620481, -0.05888668, 0, 0.1137255, 1, 1,
0.3812726, 1.971359, 0.856621, 0, 0.1058824, 1, 1,
0.3860005, -0.122099, 0.8342258, 0, 0.09803922, 1, 1,
0.3869878, -0.5631298, 2.517218, 0, 0.09411765, 1, 1,
0.3880159, 0.3788182, -0.3003172, 0, 0.08627451, 1, 1,
0.389892, 1.186363, 1.023696, 0, 0.08235294, 1, 1,
0.3904665, 0.05039245, -0.4023161, 0, 0.07450981, 1, 1,
0.397541, -1.142606, 3.151491, 0, 0.07058824, 1, 1,
0.3993486, 1.906643, 1.517381, 0, 0.0627451, 1, 1,
0.3999451, 1.594168, 0.6283114, 0, 0.05882353, 1, 1,
0.402787, 0.2176398, 0.7147588, 0, 0.05098039, 1, 1,
0.4053829, -0.1308912, 1.575928, 0, 0.04705882, 1, 1,
0.4104016, -0.8493764, 3.433393, 0, 0.03921569, 1, 1,
0.4113563, 1.14867, -0.7594632, 0, 0.03529412, 1, 1,
0.4116196, 0.648267, 0.2116227, 0, 0.02745098, 1, 1,
0.4137423, -1.50864, 1.866802, 0, 0.02352941, 1, 1,
0.4143152, -1.464659, 3.712745, 0, 0.01568628, 1, 1,
0.4191201, 0.8373301, 1.099162, 0, 0.01176471, 1, 1,
0.4231528, -0.05103917, 0.9458867, 0, 0.003921569, 1, 1,
0.4240213, -0.9485506, 2.798009, 0.003921569, 0, 1, 1,
0.4249081, -0.4114965, 3.334713, 0.007843138, 0, 1, 1,
0.4293645, -0.3221878, 1.42397, 0.01568628, 0, 1, 1,
0.4364639, -0.7101215, 2.449072, 0.01960784, 0, 1, 1,
0.4377111, 0.8744736, 0.1463443, 0.02745098, 0, 1, 1,
0.4377683, 2.454386, -0.3109385, 0.03137255, 0, 1, 1,
0.4452385, -0.5051638, 2.10951, 0.03921569, 0, 1, 1,
0.4501627, 0.2825038, 0.6645049, 0.04313726, 0, 1, 1,
0.45355, -1.731367, 1.320276, 0.05098039, 0, 1, 1,
0.4544583, -0.2254474, 3.813965, 0.05490196, 0, 1, 1,
0.4638151, -0.8102314, 3.184686, 0.0627451, 0, 1, 1,
0.4671472, -0.3163265, 3.047853, 0.06666667, 0, 1, 1,
0.4695345, -1.736874, 4.072163, 0.07450981, 0, 1, 1,
0.4754375, 1.935784, 0.7952235, 0.07843138, 0, 1, 1,
0.4783079, 1.162315, 1.318601, 0.08627451, 0, 1, 1,
0.4797529, 0.6925903, 0.9710201, 0.09019608, 0, 1, 1,
0.4819892, -1.433089, 2.05351, 0.09803922, 0, 1, 1,
0.4821596, -0.001019518, 3.580316, 0.1058824, 0, 1, 1,
0.4825491, 1.413485, -0.8279989, 0.1098039, 0, 1, 1,
0.4847237, -0.04028112, 2.087605, 0.1176471, 0, 1, 1,
0.4955739, 0.3039737, -0.1713161, 0.1215686, 0, 1, 1,
0.4997174, -0.07137897, 0.1296568, 0.1294118, 0, 1, 1,
0.5019979, 1.098397, -0.5413094, 0.1333333, 0, 1, 1,
0.5021716, -1.24511, 2.314102, 0.1411765, 0, 1, 1,
0.5024418, 1.340527, 0.8087687, 0.145098, 0, 1, 1,
0.5036685, -1.196726, 2.672051, 0.1529412, 0, 1, 1,
0.5057658, -2.07934, 1.829814, 0.1568628, 0, 1, 1,
0.5103124, -1.243129, 3.319487, 0.1647059, 0, 1, 1,
0.5156314, 0.8346744, 0.8145821, 0.1686275, 0, 1, 1,
0.521894, 0.7235404, 0.8698883, 0.1764706, 0, 1, 1,
0.5221571, 1.175653, 0.9814349, 0.1803922, 0, 1, 1,
0.524363, 1.032988, -0.1940089, 0.1882353, 0, 1, 1,
0.5283009, 0.02035076, 0.860722, 0.1921569, 0, 1, 1,
0.5309001, 0.6365818, 1.31572, 0.2, 0, 1, 1,
0.5345805, 0.3364618, 2.041837, 0.2078431, 0, 1, 1,
0.5355151, 0.978888, 0.0224303, 0.2117647, 0, 1, 1,
0.535897, -0.7292717, 1.940755, 0.2196078, 0, 1, 1,
0.5396662, 1.070017, 0.7744173, 0.2235294, 0, 1, 1,
0.5462362, -2.39954, 3.191168, 0.2313726, 0, 1, 1,
0.5498725, 0.5424387, 2.045065, 0.2352941, 0, 1, 1,
0.5541515, -1.892683, 2.2427, 0.2431373, 0, 1, 1,
0.5552139, -0.1258018, 2.306251, 0.2470588, 0, 1, 1,
0.5580697, -0.00652585, 0.7212288, 0.254902, 0, 1, 1,
0.5586103, 1.570427, 1.662405, 0.2588235, 0, 1, 1,
0.5613235, -1.824918, 3.914309, 0.2666667, 0, 1, 1,
0.5628014, -1.525142, 2.389589, 0.2705882, 0, 1, 1,
0.5636883, 1.381644, -0.7107068, 0.2784314, 0, 1, 1,
0.5639746, 0.07679251, 2.135715, 0.282353, 0, 1, 1,
0.5664518, 1.295778, 1.031886, 0.2901961, 0, 1, 1,
0.5717878, 0.8264805, 0.6671113, 0.2941177, 0, 1, 1,
0.5747846, 0.2101101, 0.699604, 0.3019608, 0, 1, 1,
0.5791752, -0.3543602, 1.786338, 0.3098039, 0, 1, 1,
0.5797822, 0.8657004, 1.362761, 0.3137255, 0, 1, 1,
0.5847969, 0.6744013, 0.1092011, 0.3215686, 0, 1, 1,
0.5873693, -1.651181, 2.638961, 0.3254902, 0, 1, 1,
0.588502, -1.49693, 2.463817, 0.3333333, 0, 1, 1,
0.5886798, 0.7389324, -1.666094, 0.3372549, 0, 1, 1,
0.5921619, -0.7400114, 2.452624, 0.345098, 0, 1, 1,
0.5925696, -1.533068, 3.1214, 0.3490196, 0, 1, 1,
0.5945509, 0.1724082, 2.425034, 0.3568628, 0, 1, 1,
0.6162241, 1.100346, -0.6608881, 0.3607843, 0, 1, 1,
0.6186149, -0.7502298, 2.770707, 0.3686275, 0, 1, 1,
0.6195198, 0.2342099, 1.111607, 0.372549, 0, 1, 1,
0.6228422, 1.641116, -0.3435365, 0.3803922, 0, 1, 1,
0.6319873, -0.5172538, 2.509391, 0.3843137, 0, 1, 1,
0.6321271, 0.3779882, -0.9120054, 0.3921569, 0, 1, 1,
0.6330985, -0.001403553, 4.681936, 0.3960784, 0, 1, 1,
0.6374734, 0.02717345, 0.566815, 0.4039216, 0, 1, 1,
0.6412655, 0.2589757, 1.080276, 0.4117647, 0, 1, 1,
0.6456565, -0.901147, 3.145559, 0.4156863, 0, 1, 1,
0.6518379, 1.475338, 0.8982894, 0.4235294, 0, 1, 1,
0.6537579, -1.073795, 2.505174, 0.427451, 0, 1, 1,
0.6573489, -0.8607947, 2.512795, 0.4352941, 0, 1, 1,
0.6583579, -0.3268328, 3.301194, 0.4392157, 0, 1, 1,
0.6663765, 0.03439136, 1.553955, 0.4470588, 0, 1, 1,
0.6695952, -1.230255, 1.947622, 0.4509804, 0, 1, 1,
0.6699562, -1.265357, 2.163259, 0.4588235, 0, 1, 1,
0.6709397, -1.513293, 2.886653, 0.4627451, 0, 1, 1,
0.6721378, -0.8930747, 4.342857, 0.4705882, 0, 1, 1,
0.6724012, 1.153782, -0.5964605, 0.4745098, 0, 1, 1,
0.676452, -1.375626, 3.112901, 0.4823529, 0, 1, 1,
0.6779394, 1.731272, 0.373927, 0.4862745, 0, 1, 1,
0.6822788, -1.8454, 3.267816, 0.4941176, 0, 1, 1,
0.6835606, -1.24504, 3.959952, 0.5019608, 0, 1, 1,
0.6842615, 0.1192148, 1.052107, 0.5058824, 0, 1, 1,
0.6882111, 1.325621, 2.188629, 0.5137255, 0, 1, 1,
0.6882964, -0.1850814, 2.071919, 0.5176471, 0, 1, 1,
0.6989774, -0.1084073, 3.13705, 0.5254902, 0, 1, 1,
0.6990489, 0.2822222, 1.267948, 0.5294118, 0, 1, 1,
0.6996904, 2.547965, 0.9952129, 0.5372549, 0, 1, 1,
0.7026817, -1.544074, 2.284695, 0.5411765, 0, 1, 1,
0.7043179, -0.294851, 2.501727, 0.5490196, 0, 1, 1,
0.7052752, 0.6191131, 0.7956465, 0.5529412, 0, 1, 1,
0.7067711, -1.406149, 3.944103, 0.5607843, 0, 1, 1,
0.7073738, 0.5993604, 1.661426, 0.5647059, 0, 1, 1,
0.7109817, -0.4724984, 2.485831, 0.572549, 0, 1, 1,
0.711875, 0.7729295, 0.9569504, 0.5764706, 0, 1, 1,
0.7122471, -2.04204, 1.306102, 0.5843138, 0, 1, 1,
0.7177364, -0.2905693, 2.015337, 0.5882353, 0, 1, 1,
0.7179938, -0.6689957, 2.273181, 0.5960785, 0, 1, 1,
0.7224129, -0.8960407, 3.238917, 0.6039216, 0, 1, 1,
0.7244058, -1.612134, 2.426084, 0.6078432, 0, 1, 1,
0.7253826, 1.108563, -1.570203, 0.6156863, 0, 1, 1,
0.7255488, 0.4824886, 3.402714, 0.6196079, 0, 1, 1,
0.7284158, -1.220233, 2.590836, 0.627451, 0, 1, 1,
0.7298098, 0.9485853, 1.960786, 0.6313726, 0, 1, 1,
0.7372023, 0.4043482, 0.7135651, 0.6392157, 0, 1, 1,
0.7410226, 1.877655, 0.6151198, 0.6431373, 0, 1, 1,
0.7432868, -0.902848, 2.435125, 0.6509804, 0, 1, 1,
0.744742, 0.136905, 0.2245908, 0.654902, 0, 1, 1,
0.7449656, 0.4365953, 1.360225, 0.6627451, 0, 1, 1,
0.7454055, 2.047779, 1.404389, 0.6666667, 0, 1, 1,
0.7455254, -0.5885054, 1.708391, 0.6745098, 0, 1, 1,
0.7457414, -0.2395538, 1.447242, 0.6784314, 0, 1, 1,
0.7490733, -1.80081, 5.041031, 0.6862745, 0, 1, 1,
0.7538085, -0.5610673, 1.347884, 0.6901961, 0, 1, 1,
0.7610556, -0.7163386, 4.569896, 0.6980392, 0, 1, 1,
0.7627155, -0.9627026, 3.399247, 0.7058824, 0, 1, 1,
0.7724837, 0.9813871, -0.9987205, 0.7098039, 0, 1, 1,
0.7725745, 0.3945671, 0.8440346, 0.7176471, 0, 1, 1,
0.7762373, -1.631213, 4.106986, 0.7215686, 0, 1, 1,
0.7777116, 0.0196542, 2.355681, 0.7294118, 0, 1, 1,
0.7790349, 0.2969277, 1.379805, 0.7333333, 0, 1, 1,
0.7841358, 0.2827482, 0.2176633, 0.7411765, 0, 1, 1,
0.788721, 0.4134918, 1.167045, 0.7450981, 0, 1, 1,
0.7893423, -0.2635732, 3.16309, 0.7529412, 0, 1, 1,
0.7919173, 1.001179, 1.352351, 0.7568628, 0, 1, 1,
0.7925383, 0.2524554, 1.201848, 0.7647059, 0, 1, 1,
0.7955866, 1.737735, 2.034271, 0.7686275, 0, 1, 1,
0.8002124, -0.8513795, 2.594452, 0.7764706, 0, 1, 1,
0.8131878, 0.9306105, 1.783982, 0.7803922, 0, 1, 1,
0.8198798, -0.3997911, 1.886896, 0.7882353, 0, 1, 1,
0.8199518, 1.294879, 1.457455, 0.7921569, 0, 1, 1,
0.8201736, 0.8089219, 1.154768, 0.8, 0, 1, 1,
0.8251724, -0.7542239, 2.873977, 0.8078431, 0, 1, 1,
0.8279846, 1.000238, 1.334974, 0.8117647, 0, 1, 1,
0.8280133, 0.3354533, 1.438259, 0.8196079, 0, 1, 1,
0.8303447, 0.424231, -1.293248, 0.8235294, 0, 1, 1,
0.8327287, 1.006005, -0.3111875, 0.8313726, 0, 1, 1,
0.8332043, -1.880931, 3.423803, 0.8352941, 0, 1, 1,
0.83723, 0.1071256, 2.299808, 0.8431373, 0, 1, 1,
0.8376345, 0.6628842, -0.07635504, 0.8470588, 0, 1, 1,
0.8383599, 1.426355, 1.823287, 0.854902, 0, 1, 1,
0.8385265, 0.6147459, 0.3679531, 0.8588235, 0, 1, 1,
0.8428283, -0.2113837, 1.852202, 0.8666667, 0, 1, 1,
0.8524299, 1.879654, -0.3402166, 0.8705882, 0, 1, 1,
0.8579112, -0.4473059, 2.821749, 0.8784314, 0, 1, 1,
0.8586534, 0.0829473, 1.797037, 0.8823529, 0, 1, 1,
0.8592291, -0.6336568, 2.53889, 0.8901961, 0, 1, 1,
0.8606128, 0.04573396, 1.774934, 0.8941177, 0, 1, 1,
0.8619475, -0.4820673, 0.6899475, 0.9019608, 0, 1, 1,
0.8619897, 0.978501, 0.6302376, 0.9098039, 0, 1, 1,
0.8622917, -0.5042319, -0.5845808, 0.9137255, 0, 1, 1,
0.8632751, -0.7584185, 4.239068, 0.9215686, 0, 1, 1,
0.8723837, -0.1004955, 0.6799852, 0.9254902, 0, 1, 1,
0.8726432, 1.69478, 0.397703, 0.9333333, 0, 1, 1,
0.8786247, 0.4209011, 2.961866, 0.9372549, 0, 1, 1,
0.8842204, 0.1400501, 0.7821282, 0.945098, 0, 1, 1,
0.8854102, -0.24443, 2.905914, 0.9490196, 0, 1, 1,
0.8887845, -1.752766, 3.079298, 0.9568627, 0, 1, 1,
0.8895063, -0.2901352, 1.047379, 0.9607843, 0, 1, 1,
0.8928043, -0.1238779, 2.687582, 0.9686275, 0, 1, 1,
0.8975745, 1.028976, 0.6416444, 0.972549, 0, 1, 1,
0.8997918, 0.4782152, 0.9599679, 0.9803922, 0, 1, 1,
0.901266, -0.5652476, 2.530438, 0.9843137, 0, 1, 1,
0.902282, 0.634786, 0.4478893, 0.9921569, 0, 1, 1,
0.9045654, 0.4832246, 0.1021478, 0.9960784, 0, 1, 1,
0.9057875, 0.05182219, 2.479299, 1, 0, 0.9960784, 1,
0.9096267, -1.125666, 3.386007, 1, 0, 0.9882353, 1,
0.9146746, 0.2969984, 0.878642, 1, 0, 0.9843137, 1,
0.9156014, -0.3273888, 2.730219, 1, 0, 0.9764706, 1,
0.9229777, 0.02208176, 0.2582938, 1, 0, 0.972549, 1,
0.9320816, 0.7105484, 4.441121, 1, 0, 0.9647059, 1,
0.9339119, -0.1250547, 4.22487, 1, 0, 0.9607843, 1,
0.9381769, 0.2872002, 1.195605, 1, 0, 0.9529412, 1,
0.9384729, -0.0694209, 0.07556569, 1, 0, 0.9490196, 1,
0.9393839, -0.1372961, 1.284502, 1, 0, 0.9411765, 1,
0.9396492, 0.1867234, 3.641727, 1, 0, 0.9372549, 1,
0.9440048, 1.085271, -0.3192201, 1, 0, 0.9294118, 1,
0.9450315, -1.220169, 2.938205, 1, 0, 0.9254902, 1,
0.9461707, 1.30921, 0.04929441, 1, 0, 0.9176471, 1,
0.9543152, 0.06348535, 4.014682, 1, 0, 0.9137255, 1,
0.956546, 0.1941637, 3.855813, 1, 0, 0.9058824, 1,
0.9572464, -0.7334362, 1.411765, 1, 0, 0.9019608, 1,
0.9590419, -0.9428363, 1.92893, 1, 0, 0.8941177, 1,
0.9885603, 1.94343, -0.5582003, 1, 0, 0.8862745, 1,
0.989417, -0.5893964, 1.455502, 1, 0, 0.8823529, 1,
0.989713, 0.03825843, -0.5358655, 1, 0, 0.8745098, 1,
0.9929907, 0.650847, 0.611614, 1, 0, 0.8705882, 1,
0.9943858, -0.7537526, 1.555879, 1, 0, 0.8627451, 1,
1.010304, -0.1044115, 0.845706, 1, 0, 0.8588235, 1,
1.011414, -0.9415068, 2.280603, 1, 0, 0.8509804, 1,
1.025162, -0.3819145, 3.630646, 1, 0, 0.8470588, 1,
1.025749, -0.5512578, 3.482812, 1, 0, 0.8392157, 1,
1.026577, -0.8804538, 1.196376, 1, 0, 0.8352941, 1,
1.028935, 1.097467, 0.7814779, 1, 0, 0.827451, 1,
1.031235, 1.207401, 2.411872, 1, 0, 0.8235294, 1,
1.036162, -0.3797581, -0.1681035, 1, 0, 0.8156863, 1,
1.037434, 0.442911, 2.249071, 1, 0, 0.8117647, 1,
1.039848, -0.9296026, 2.369979, 1, 0, 0.8039216, 1,
1.052441, 0.6016627, 1.611472, 1, 0, 0.7960784, 1,
1.056847, -2.148517, 1.449089, 1, 0, 0.7921569, 1,
1.068406, -0.5822678, 3.415986, 1, 0, 0.7843137, 1,
1.071044, -0.1634469, 0.03409369, 1, 0, 0.7803922, 1,
1.075526, -0.1181252, 1.01879, 1, 0, 0.772549, 1,
1.083886, -0.2622254, 1.389994, 1, 0, 0.7686275, 1,
1.135061, 1.418976, -1.294771, 1, 0, 0.7607843, 1,
1.15697, -0.8014053, 3.300001, 1, 0, 0.7568628, 1,
1.160429, 0.646684, 2.929181, 1, 0, 0.7490196, 1,
1.170044, -0.9365531, 2.051019, 1, 0, 0.7450981, 1,
1.170552, 1.458643, 0.1197558, 1, 0, 0.7372549, 1,
1.190533, -0.7188933, 1.670058, 1, 0, 0.7333333, 1,
1.198324, 0.05164028, 2.336497, 1, 0, 0.7254902, 1,
1.201472, -0.6176655, 3.458144, 1, 0, 0.7215686, 1,
1.206643, 0.7892739, 2.435116, 1, 0, 0.7137255, 1,
1.210086, 0.08842251, 0.2904443, 1, 0, 0.7098039, 1,
1.210088, 2.180014, 1.899143, 1, 0, 0.7019608, 1,
1.212744, 0.5464889, 2.177958, 1, 0, 0.6941177, 1,
1.21812, 0.0001019335, -0.04294772, 1, 0, 0.6901961, 1,
1.220672, 0.5539934, 2.674598, 1, 0, 0.682353, 1,
1.223428, -0.3791965, 1.469734, 1, 0, 0.6784314, 1,
1.223973, -0.6592253, 1.727468, 1, 0, 0.6705883, 1,
1.229126, 1.60165, -1.292237, 1, 0, 0.6666667, 1,
1.257844, 0.1011418, 3.321902, 1, 0, 0.6588235, 1,
1.269437, 1.64574, -0.4856691, 1, 0, 0.654902, 1,
1.270389, -0.07932308, 2.571908, 1, 0, 0.6470588, 1,
1.278326, 0.7464817, 0.2503026, 1, 0, 0.6431373, 1,
1.280463, 1.071292, -0.2276467, 1, 0, 0.6352941, 1,
1.287319, 0.2841018, 2.238606, 1, 0, 0.6313726, 1,
1.304411, 0.01768287, 2.62534, 1, 0, 0.6235294, 1,
1.304822, 1.588775, 0.3009178, 1, 0, 0.6196079, 1,
1.30811, -2.930733, 4.160885, 1, 0, 0.6117647, 1,
1.309343, 2.262563, 1.425135, 1, 0, 0.6078432, 1,
1.313198, -0.008927473, 1.714826, 1, 0, 0.6, 1,
1.318859, -0.7547629, 3.392508, 1, 0, 0.5921569, 1,
1.319098, -0.3229666, 3.3372, 1, 0, 0.5882353, 1,
1.332482, -0.7041734, 1.607057, 1, 0, 0.5803922, 1,
1.335426, -1.333219, 3.255157, 1, 0, 0.5764706, 1,
1.342554, 1.266204, 2.432844, 1, 0, 0.5686275, 1,
1.349789, -1.601739, 2.808731, 1, 0, 0.5647059, 1,
1.354426, 0.5939552, 2.158284, 1, 0, 0.5568628, 1,
1.362948, 1.351535, 1.338748, 1, 0, 0.5529412, 1,
1.370446, 0.7873526, -1.126132, 1, 0, 0.5450981, 1,
1.37926, 1.917751, -1.365703, 1, 0, 0.5411765, 1,
1.382895, 1.03051, 1.54303, 1, 0, 0.5333334, 1,
1.392327, -0.06701779, 2.463859, 1, 0, 0.5294118, 1,
1.402839, -0.1420439, 0.5554578, 1, 0, 0.5215687, 1,
1.405813, 1.042589, 0.01169858, 1, 0, 0.5176471, 1,
1.405965, -0.983341, 2.062006, 1, 0, 0.509804, 1,
1.407013, 1.64167, 1.892513, 1, 0, 0.5058824, 1,
1.411056, -2.072114, 2.578751, 1, 0, 0.4980392, 1,
1.411225, -1.772709, 2.935627, 1, 0, 0.4901961, 1,
1.41242, -0.1042303, 0.7537799, 1, 0, 0.4862745, 1,
1.413908, 0.06213537, 2.527629, 1, 0, 0.4784314, 1,
1.420255, -0.8215564, 2.255011, 1, 0, 0.4745098, 1,
1.427051, 0.3337483, 2.743389, 1, 0, 0.4666667, 1,
1.431632, 0.4172923, 1.961491, 1, 0, 0.4627451, 1,
1.441116, 1.254462, 2.618574, 1, 0, 0.454902, 1,
1.443146, 1.366907, -0.8110914, 1, 0, 0.4509804, 1,
1.443344, 1.90713, 0.5014696, 1, 0, 0.4431373, 1,
1.456726, 1.368315, -0.3492828, 1, 0, 0.4392157, 1,
1.462652, 1.895781, -0.01875778, 1, 0, 0.4313726, 1,
1.462836, -1.643411, 1.00818, 1, 0, 0.427451, 1,
1.470707, 0.5772329, 1.07734, 1, 0, 0.4196078, 1,
1.470955, -0.5744101, 1.553516, 1, 0, 0.4156863, 1,
1.503088, 0.1643138, 1.552416, 1, 0, 0.4078431, 1,
1.505381, 0.467564, 0.5141643, 1, 0, 0.4039216, 1,
1.516607, 0.9340606, 1.585163, 1, 0, 0.3960784, 1,
1.536069, 1.491339, 1.589113, 1, 0, 0.3882353, 1,
1.547297, -1.91341, 1.906466, 1, 0, 0.3843137, 1,
1.547702, 0.5033931, -0.778028, 1, 0, 0.3764706, 1,
1.550305, 0.2440183, 2.469029, 1, 0, 0.372549, 1,
1.552585, -0.2814138, 1.684715, 1, 0, 0.3647059, 1,
1.560237, -0.5546819, 3.146431, 1, 0, 0.3607843, 1,
1.566446, -0.2908402, 1.525094, 1, 0, 0.3529412, 1,
1.58663, -0.1699958, 4.81278, 1, 0, 0.3490196, 1,
1.587672, 0.2609669, 0.4222787, 1, 0, 0.3411765, 1,
1.589392, -0.7416112, 0.6907183, 1, 0, 0.3372549, 1,
1.59192, 0.6014987, 0.3592705, 1, 0, 0.3294118, 1,
1.594181, 1.945057, -0.2327948, 1, 0, 0.3254902, 1,
1.607043, 1.52946, 1.047629, 1, 0, 0.3176471, 1,
1.610518, -1.558572, 2.674225, 1, 0, 0.3137255, 1,
1.618894, 0.3556437, 0.1587463, 1, 0, 0.3058824, 1,
1.650589, 0.9428934, 3.81878, 1, 0, 0.2980392, 1,
1.671663, 1.224558, 0.1232982, 1, 0, 0.2941177, 1,
1.683636, -1.135878, 2.918571, 1, 0, 0.2862745, 1,
1.705665, 0.5459508, 0.7174506, 1, 0, 0.282353, 1,
1.70871, 0.1891547, 1.741771, 1, 0, 0.2745098, 1,
1.709478, -0.7018661, 1.018595, 1, 0, 0.2705882, 1,
1.730199, -0.497712, 1.079854, 1, 0, 0.2627451, 1,
1.731458, -0.2885383, 1.158856, 1, 0, 0.2588235, 1,
1.742318, 0.09393542, 0.0363232, 1, 0, 0.2509804, 1,
1.763456, 0.4270922, 0.4286995, 1, 0, 0.2470588, 1,
1.772328, 0.3046904, 3.499985, 1, 0, 0.2392157, 1,
1.774644, -2.433096, 1.692742, 1, 0, 0.2352941, 1,
1.775986, -1.18865, 4.331848, 1, 0, 0.227451, 1,
1.778352, 0.5053592, 2.646985, 1, 0, 0.2235294, 1,
1.783783, 0.4545786, 1.404925, 1, 0, 0.2156863, 1,
1.784778, 0.6392258, 0.838829, 1, 0, 0.2117647, 1,
1.789153, 1.898763, -1.423953, 1, 0, 0.2039216, 1,
1.79233, 1.43986, -0.4424143, 1, 0, 0.1960784, 1,
1.792488, -0.8877152, 1.61025, 1, 0, 0.1921569, 1,
1.817362, -0.9005246, 1.682963, 1, 0, 0.1843137, 1,
1.821935, -0.6563852, 3.32899, 1, 0, 0.1803922, 1,
1.825452, 0.6459627, 1.266954, 1, 0, 0.172549, 1,
1.84138, -0.3931596, -0.06964875, 1, 0, 0.1686275, 1,
1.84408, 1.331007, -0.3026542, 1, 0, 0.1607843, 1,
1.854952, -0.1924074, 3.127272, 1, 0, 0.1568628, 1,
1.908553, -0.3848337, 1.965216, 1, 0, 0.1490196, 1,
1.961763, 1.554933, 1.688025, 1, 0, 0.145098, 1,
1.97081, 0.4267144, 1.924738, 1, 0, 0.1372549, 1,
1.984922, -1.181305, 1.67208, 1, 0, 0.1333333, 1,
2.002546, -0.7427878, -0.3337228, 1, 0, 0.1254902, 1,
2.022248, -0.6155497, 2.011358, 1, 0, 0.1215686, 1,
2.027662, -0.3942187, 1.488085, 1, 0, 0.1137255, 1,
2.033881, -1.050596, 2.64883, 1, 0, 0.1098039, 1,
2.08786, -0.508462, 1.33917, 1, 0, 0.1019608, 1,
2.11549, 1.216753, 0.9236141, 1, 0, 0.09411765, 1,
2.157994, 0.1732881, 1.453339, 1, 0, 0.09019608, 1,
2.17791, 0.562296, 0.1364103, 1, 0, 0.08235294, 1,
2.21074, -0.9672114, 3.303543, 1, 0, 0.07843138, 1,
2.352787, -1.759464, 0.7083958, 1, 0, 0.07058824, 1,
2.370646, -0.02551197, 1.27896, 1, 0, 0.06666667, 1,
2.418056, 0.2709838, 0.9804174, 1, 0, 0.05882353, 1,
2.418866, 0.2402069, 1.981648, 1, 0, 0.05490196, 1,
2.421088, 0.2643857, 3.155273, 1, 0, 0.04705882, 1,
2.522672, 0.9801674, 1.275129, 1, 0, 0.04313726, 1,
2.599731, -0.2867499, 2.303095, 1, 0, 0.03529412, 1,
2.642105, -0.5143554, 1.851007, 1, 0, 0.03137255, 1,
2.648755, -0.1267886, -0.7029898, 1, 0, 0.02352941, 1,
2.994086, 0.6897258, 2.861527, 1, 0, 0.01960784, 1,
3.167033, -1.119102, 1.684548, 1, 0, 0.01176471, 1,
3.45102, 0.3147674, 1.826282, 1, 0, 0.007843138, 1
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
0.1844777, -4.071596, -6.817697, 0, -0.5, 0.5, 0.5,
0.1844777, -4.071596, -6.817697, 1, -0.5, 0.5, 0.5,
0.1844777, -4.071596, -6.817697, 1, 1.5, 0.5, 0.5,
0.1844777, -4.071596, -6.817697, 0, 1.5, 0.5, 0.5
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
-4.189422, 0.08081508, -6.817697, 0, -0.5, 0.5, 0.5,
-4.189422, 0.08081508, -6.817697, 1, -0.5, 0.5, 0.5,
-4.189422, 0.08081508, -6.817697, 1, 1.5, 0.5, 0.5,
-4.189422, 0.08081508, -6.817697, 0, 1.5, 0.5, 0.5
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
-4.189422, -4.071596, 0.04568624, 0, -0.5, 0.5, 0.5,
-4.189422, -4.071596, 0.04568624, 1, -0.5, 0.5, 0.5,
-4.189422, -4.071596, 0.04568624, 1, 1.5, 0.5, 0.5,
-4.189422, -4.071596, 0.04568624, 0, 1.5, 0.5, 0.5
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
-3, -3.113347, -5.233839,
3, -3.113347, -5.233839,
-3, -3.113347, -5.233839,
-3, -3.273055, -5.497816,
-2, -3.113347, -5.233839,
-2, -3.273055, -5.497816,
-1, -3.113347, -5.233839,
-1, -3.273055, -5.497816,
0, -3.113347, -5.233839,
0, -3.273055, -5.497816,
1, -3.113347, -5.233839,
1, -3.273055, -5.497816,
2, -3.113347, -5.233839,
2, -3.273055, -5.497816,
3, -3.113347, -5.233839,
3, -3.273055, -5.497816
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
-3, -3.592471, -6.025768, 0, -0.5, 0.5, 0.5,
-3, -3.592471, -6.025768, 1, -0.5, 0.5, 0.5,
-3, -3.592471, -6.025768, 1, 1.5, 0.5, 0.5,
-3, -3.592471, -6.025768, 0, 1.5, 0.5, 0.5,
-2, -3.592471, -6.025768, 0, -0.5, 0.5, 0.5,
-2, -3.592471, -6.025768, 1, -0.5, 0.5, 0.5,
-2, -3.592471, -6.025768, 1, 1.5, 0.5, 0.5,
-2, -3.592471, -6.025768, 0, 1.5, 0.5, 0.5,
-1, -3.592471, -6.025768, 0, -0.5, 0.5, 0.5,
-1, -3.592471, -6.025768, 1, -0.5, 0.5, 0.5,
-1, -3.592471, -6.025768, 1, 1.5, 0.5, 0.5,
-1, -3.592471, -6.025768, 0, 1.5, 0.5, 0.5,
0, -3.592471, -6.025768, 0, -0.5, 0.5, 0.5,
0, -3.592471, -6.025768, 1, -0.5, 0.5, 0.5,
0, -3.592471, -6.025768, 1, 1.5, 0.5, 0.5,
0, -3.592471, -6.025768, 0, 1.5, 0.5, 0.5,
1, -3.592471, -6.025768, 0, -0.5, 0.5, 0.5,
1, -3.592471, -6.025768, 1, -0.5, 0.5, 0.5,
1, -3.592471, -6.025768, 1, 1.5, 0.5, 0.5,
1, -3.592471, -6.025768, 0, 1.5, 0.5, 0.5,
2, -3.592471, -6.025768, 0, -0.5, 0.5, 0.5,
2, -3.592471, -6.025768, 1, -0.5, 0.5, 0.5,
2, -3.592471, -6.025768, 1, 1.5, 0.5, 0.5,
2, -3.592471, -6.025768, 0, 1.5, 0.5, 0.5,
3, -3.592471, -6.025768, 0, -0.5, 0.5, 0.5,
3, -3.592471, -6.025768, 1, -0.5, 0.5, 0.5,
3, -3.592471, -6.025768, 1, 1.5, 0.5, 0.5,
3, -3.592471, -6.025768, 0, 1.5, 0.5, 0.5
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
-3.180061, -3, -5.233839,
-3.180061, 3, -5.233839,
-3.180061, -3, -5.233839,
-3.348288, -3, -5.497816,
-3.180061, -2, -5.233839,
-3.348288, -2, -5.497816,
-3.180061, -1, -5.233839,
-3.348288, -1, -5.497816,
-3.180061, 0, -5.233839,
-3.348288, 0, -5.497816,
-3.180061, 1, -5.233839,
-3.348288, 1, -5.497816,
-3.180061, 2, -5.233839,
-3.348288, 2, -5.497816,
-3.180061, 3, -5.233839,
-3.348288, 3, -5.497816
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
-3.684741, -3, -6.025768, 0, -0.5, 0.5, 0.5,
-3.684741, -3, -6.025768, 1, -0.5, 0.5, 0.5,
-3.684741, -3, -6.025768, 1, 1.5, 0.5, 0.5,
-3.684741, -3, -6.025768, 0, 1.5, 0.5, 0.5,
-3.684741, -2, -6.025768, 0, -0.5, 0.5, 0.5,
-3.684741, -2, -6.025768, 1, -0.5, 0.5, 0.5,
-3.684741, -2, -6.025768, 1, 1.5, 0.5, 0.5,
-3.684741, -2, -6.025768, 0, 1.5, 0.5, 0.5,
-3.684741, -1, -6.025768, 0, -0.5, 0.5, 0.5,
-3.684741, -1, -6.025768, 1, -0.5, 0.5, 0.5,
-3.684741, -1, -6.025768, 1, 1.5, 0.5, 0.5,
-3.684741, -1, -6.025768, 0, 1.5, 0.5, 0.5,
-3.684741, 0, -6.025768, 0, -0.5, 0.5, 0.5,
-3.684741, 0, -6.025768, 1, -0.5, 0.5, 0.5,
-3.684741, 0, -6.025768, 1, 1.5, 0.5, 0.5,
-3.684741, 0, -6.025768, 0, 1.5, 0.5, 0.5,
-3.684741, 1, -6.025768, 0, -0.5, 0.5, 0.5,
-3.684741, 1, -6.025768, 1, -0.5, 0.5, 0.5,
-3.684741, 1, -6.025768, 1, 1.5, 0.5, 0.5,
-3.684741, 1, -6.025768, 0, 1.5, 0.5, 0.5,
-3.684741, 2, -6.025768, 0, -0.5, 0.5, 0.5,
-3.684741, 2, -6.025768, 1, -0.5, 0.5, 0.5,
-3.684741, 2, -6.025768, 1, 1.5, 0.5, 0.5,
-3.684741, 2, -6.025768, 0, 1.5, 0.5, 0.5,
-3.684741, 3, -6.025768, 0, -0.5, 0.5, 0.5,
-3.684741, 3, -6.025768, 1, -0.5, 0.5, 0.5,
-3.684741, 3, -6.025768, 1, 1.5, 0.5, 0.5,
-3.684741, 3, -6.025768, 0, 1.5, 0.5, 0.5
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
-3.180061, -3.113347, -4,
-3.180061, -3.113347, 4,
-3.180061, -3.113347, -4,
-3.348288, -3.273055, -4,
-3.180061, -3.113347, -2,
-3.348288, -3.273055, -2,
-3.180061, -3.113347, 0,
-3.348288, -3.273055, 0,
-3.180061, -3.113347, 2,
-3.348288, -3.273055, 2,
-3.180061, -3.113347, 4,
-3.348288, -3.273055, 4
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
-3.684741, -3.592471, -4, 0, -0.5, 0.5, 0.5,
-3.684741, -3.592471, -4, 1, -0.5, 0.5, 0.5,
-3.684741, -3.592471, -4, 1, 1.5, 0.5, 0.5,
-3.684741, -3.592471, -4, 0, 1.5, 0.5, 0.5,
-3.684741, -3.592471, -2, 0, -0.5, 0.5, 0.5,
-3.684741, -3.592471, -2, 1, -0.5, 0.5, 0.5,
-3.684741, -3.592471, -2, 1, 1.5, 0.5, 0.5,
-3.684741, -3.592471, -2, 0, 1.5, 0.5, 0.5,
-3.684741, -3.592471, 0, 0, -0.5, 0.5, 0.5,
-3.684741, -3.592471, 0, 1, -0.5, 0.5, 0.5,
-3.684741, -3.592471, 0, 1, 1.5, 0.5, 0.5,
-3.684741, -3.592471, 0, 0, 1.5, 0.5, 0.5,
-3.684741, -3.592471, 2, 0, -0.5, 0.5, 0.5,
-3.684741, -3.592471, 2, 1, -0.5, 0.5, 0.5,
-3.684741, -3.592471, 2, 1, 1.5, 0.5, 0.5,
-3.684741, -3.592471, 2, 0, 1.5, 0.5, 0.5,
-3.684741, -3.592471, 4, 0, -0.5, 0.5, 0.5,
-3.684741, -3.592471, 4, 1, -0.5, 0.5, 0.5,
-3.684741, -3.592471, 4, 1, 1.5, 0.5, 0.5,
-3.684741, -3.592471, 4, 0, 1.5, 0.5, 0.5
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
-3.180061, -3.113347, -5.233839,
-3.180061, 3.274977, -5.233839,
-3.180061, -3.113347, 5.325212,
-3.180061, 3.274977, 5.325212,
-3.180061, -3.113347, -5.233839,
-3.180061, -3.113347, 5.325212,
-3.180061, 3.274977, -5.233839,
-3.180061, 3.274977, 5.325212,
-3.180061, -3.113347, -5.233839,
3.549016, -3.113347, -5.233839,
-3.180061, -3.113347, 5.325212,
3.549016, -3.113347, 5.325212,
-3.180061, 3.274977, -5.233839,
3.549016, 3.274977, -5.233839,
-3.180061, 3.274977, 5.325212,
3.549016, 3.274977, 5.325212,
3.549016, -3.113347, -5.233839,
3.549016, 3.274977, -5.233839,
3.549016, -3.113347, 5.325212,
3.549016, 3.274977, 5.325212,
3.549016, -3.113347, -5.233839,
3.549016, -3.113347, 5.325212,
3.549016, 3.274977, -5.233839,
3.549016, 3.274977, 5.325212
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
var radius = 7.505889;
var distance = 33.39455;
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
mvMatrix.translate( -0.1844777, -0.08081508, -0.04568624 );
mvMatrix.scale( 1.206037, 1.270367, 0.7685837 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.39455);
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
Linuron<-read.table("Linuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Linuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'Linuron' not found
```

```r
y<-Linuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'Linuron' not found
```

```r
z<-Linuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'Linuron' not found
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
-3.082064, 0.1450471, -2.05239, 0, 0, 1, 1, 1,
-2.901199, 0.62413, -2.349774, 1, 0, 0, 1, 1,
-2.643745, 0.281881, -0.3324496, 1, 0, 0, 1, 1,
-2.628766, -0.7894363, -3.506085, 1, 0, 0, 1, 1,
-2.609761, 1.589367, -0.7386978, 1, 0, 0, 1, 1,
-2.437526, -0.667776, -2.393591, 1, 0, 0, 1, 1,
-2.366096, -0.1394813, -0.4180872, 0, 0, 0, 1, 1,
-2.337314, 0.06439736, -1.637127, 0, 0, 0, 1, 1,
-2.285873, -0.2581345, -2.171285, 0, 0, 0, 1, 1,
-2.234833, 0.5935233, -1.914453, 0, 0, 0, 1, 1,
-2.152252, 0.5511248, -0.7182224, 0, 0, 0, 1, 1,
-2.148481, 0.4627173, -0.2810945, 0, 0, 0, 1, 1,
-2.021064, -0.05899508, -4.037213, 0, 0, 0, 1, 1,
-2.012635, -0.8026707, -2.059751, 1, 1, 1, 1, 1,
-2.004797, -1.254262, -1.543575, 1, 1, 1, 1, 1,
-2.004575, 0.4378744, -2.443531, 1, 1, 1, 1, 1,
-1.997118, -0.4570161, -2.239607, 1, 1, 1, 1, 1,
-1.983213, 0.1356232, -1.329, 1, 1, 1, 1, 1,
-1.964693, -0.4951203, -1.300743, 1, 1, 1, 1, 1,
-1.95811, 0.7751991, -1.680593, 1, 1, 1, 1, 1,
-1.953658, -0.1748065, -1.557934, 1, 1, 1, 1, 1,
-1.946928, -0.2089135, -1.909892, 1, 1, 1, 1, 1,
-1.935219, -0.8933933, -1.35739, 1, 1, 1, 1, 1,
-1.92716, -1.295963, -3.617668, 1, 1, 1, 1, 1,
-1.92512, 1.925132, -0.926092, 1, 1, 1, 1, 1,
-1.891017, 0.1367306, -2.685356, 1, 1, 1, 1, 1,
-1.88549, -1.767012, -2.212988, 1, 1, 1, 1, 1,
-1.85187, 0.01395219, -3.836262, 1, 1, 1, 1, 1,
-1.845639, 0.6465065, -0.1956706, 0, 0, 1, 1, 1,
-1.819883, 0.1523174, -0.806031, 1, 0, 0, 1, 1,
-1.819862, -0.6834297, -1.598758, 1, 0, 0, 1, 1,
-1.808763, -0.2609549, -0.8433953, 1, 0, 0, 1, 1,
-1.786033, 1.87422, -2.029432, 1, 0, 0, 1, 1,
-1.781627, -0.3702014, -1.649573, 1, 0, 0, 1, 1,
-1.769015, 0.6185495, -1.697379, 0, 0, 0, 1, 1,
-1.752579, 1.141366, -0.2394554, 0, 0, 0, 1, 1,
-1.750525, -2.124383, -2.884472, 0, 0, 0, 1, 1,
-1.742574, -1.360147, -4.253052, 0, 0, 0, 1, 1,
-1.735018, 1.903829, 0.06282988, 0, 0, 0, 1, 1,
-1.715963, -1.37165, -3.268454, 0, 0, 0, 1, 1,
-1.704857, 0.2507285, -0.8219405, 0, 0, 0, 1, 1,
-1.693754, 0.382522, -0.8975596, 1, 1, 1, 1, 1,
-1.666628, 0.4417627, -0.8459499, 1, 1, 1, 1, 1,
-1.666298, 2.695002, -1.722448, 1, 1, 1, 1, 1,
-1.663581, 0.009307681, -0.6410075, 1, 1, 1, 1, 1,
-1.662893, -0.2785968, -2.741952, 1, 1, 1, 1, 1,
-1.660955, 0.06822368, -3.998044, 1, 1, 1, 1, 1,
-1.654596, 0.2658535, -1.192748, 1, 1, 1, 1, 1,
-1.650671, 1.684205, -2.553818, 1, 1, 1, 1, 1,
-1.649031, 0.752292, -0.684459, 1, 1, 1, 1, 1,
-1.643854, -0.7073057, -1.300655, 1, 1, 1, 1, 1,
-1.63827, 0.2242308, -1.322682, 1, 1, 1, 1, 1,
-1.631806, 1.712499, 0.1674458, 1, 1, 1, 1, 1,
-1.628056, -0.7775954, -2.169396, 1, 1, 1, 1, 1,
-1.62686, 1.346953, -2.559284, 1, 1, 1, 1, 1,
-1.619245, -0.5145749, -2.520815, 1, 1, 1, 1, 1,
-1.606781, 0.4974018, -0.7255666, 0, 0, 1, 1, 1,
-1.605636, -1.442357, -2.126488, 1, 0, 0, 1, 1,
-1.593937, 0.5112391, -2.544914, 1, 0, 0, 1, 1,
-1.589026, -0.1122608, -0.4572974, 1, 0, 0, 1, 1,
-1.584925, 0.8020267, -0.8401192, 1, 0, 0, 1, 1,
-1.581669, -0.6057819, -2.848147, 1, 0, 0, 1, 1,
-1.581012, -0.07381314, -3.77085, 0, 0, 0, 1, 1,
-1.573568, -0.9608513, -2.01936, 0, 0, 0, 1, 1,
-1.554306, 0.4413889, -0.5540982, 0, 0, 0, 1, 1,
-1.554204, -0.04479001, -2.944036, 0, 0, 0, 1, 1,
-1.541957, 0.2245114, -1.167437, 0, 0, 0, 1, 1,
-1.522621, 0.2077117, 0.08739232, 0, 0, 0, 1, 1,
-1.518875, 0.7531208, -0.2081927, 0, 0, 0, 1, 1,
-1.517954, -0.4902796, -2.813353, 1, 1, 1, 1, 1,
-1.512045, -0.4281411, -2.79461, 1, 1, 1, 1, 1,
-1.494049, 0.6575966, -1.445864, 1, 1, 1, 1, 1,
-1.484822, -0.9078867, -3.336821, 1, 1, 1, 1, 1,
-1.470314, -1.478385, -0.2955098, 1, 1, 1, 1, 1,
-1.465531, -0.1503421, -0.9001046, 1, 1, 1, 1, 1,
-1.465351, -0.4406047, -4.417239, 1, 1, 1, 1, 1,
-1.460226, 0.6014705, -0.9315864, 1, 1, 1, 1, 1,
-1.458695, -0.3665067, -1.226925, 1, 1, 1, 1, 1,
-1.4504, 2.051739, 0.8853948, 1, 1, 1, 1, 1,
-1.440957, -0.1392971, -2.781257, 1, 1, 1, 1, 1,
-1.435388, 0.3750478, 1.750094, 1, 1, 1, 1, 1,
-1.429666, -2.361185, -4.200577, 1, 1, 1, 1, 1,
-1.425313, 2.397408, -0.239954, 1, 1, 1, 1, 1,
-1.415734, 1.59807, -0.1005476, 1, 1, 1, 1, 1,
-1.410665, 1.028826, -0.7079023, 0, 0, 1, 1, 1,
-1.409346, -1.805491, -0.7264134, 1, 0, 0, 1, 1,
-1.408661, 0.6235715, -0.6453182, 1, 0, 0, 1, 1,
-1.407671, -0.8757437, -3.203334, 1, 0, 0, 1, 1,
-1.396744, 0.7292314, 0.2602841, 1, 0, 0, 1, 1,
-1.39493, -2.43358, -1.867097, 1, 0, 0, 1, 1,
-1.389453, -1.602135, -1.771597, 0, 0, 0, 1, 1,
-1.375019, -0.9990218, -3.440203, 0, 0, 0, 1, 1,
-1.37122, -0.6488569, -2.017074, 0, 0, 0, 1, 1,
-1.369604, -0.2396357, 0.11187, 0, 0, 0, 1, 1,
-1.368081, 0.9571837, -0.4866608, 0, 0, 0, 1, 1,
-1.362992, 0.4874302, -2.727292, 0, 0, 0, 1, 1,
-1.359387, -1.399942, -2.00696, 0, 0, 0, 1, 1,
-1.352363, 1.248949, -0.005066046, 1, 1, 1, 1, 1,
-1.345398, 0.1731653, -1.861835, 1, 1, 1, 1, 1,
-1.342439, 1.564308, -0.296164, 1, 1, 1, 1, 1,
-1.341517, -0.3569058, -0.5931846, 1, 1, 1, 1, 1,
-1.338987, 0.6379886, -1.221145, 1, 1, 1, 1, 1,
-1.332916, -1.691315, -2.516924, 1, 1, 1, 1, 1,
-1.326718, -0.3979216, -4.098698, 1, 1, 1, 1, 1,
-1.325368, 0.446042, -0.5539485, 1, 1, 1, 1, 1,
-1.324789, -0.2435939, -0.5758249, 1, 1, 1, 1, 1,
-1.310092, 1.003071, -0.7720205, 1, 1, 1, 1, 1,
-1.308764, 0.1438742, -1.65659, 1, 1, 1, 1, 1,
-1.304514, -1.574, -3.216919, 1, 1, 1, 1, 1,
-1.302091, -0.9139898, -4.007294, 1, 1, 1, 1, 1,
-1.301485, -1.673253, -1.217582, 1, 1, 1, 1, 1,
-1.294001, -0.3570723, -2.655748, 1, 1, 1, 1, 1,
-1.291118, 0.5670146, -1.490399, 0, 0, 1, 1, 1,
-1.288826, 1.026852, -2.284549, 1, 0, 0, 1, 1,
-1.28523, -0.9239338, -2.119435, 1, 0, 0, 1, 1,
-1.284514, 0.02919732, -0.9574187, 1, 0, 0, 1, 1,
-1.268018, -0.1533682, -0.7020336, 1, 0, 0, 1, 1,
-1.262455, -0.7710897, -1.968165, 1, 0, 0, 1, 1,
-1.261979, 0.5321667, -2.158075, 0, 0, 0, 1, 1,
-1.258259, 1.811711, 0.2364229, 0, 0, 0, 1, 1,
-1.255322, -1.254561, -4.876053, 0, 0, 0, 1, 1,
-1.253745, -1.4284, -3.608765, 0, 0, 0, 1, 1,
-1.251599, 0.2792221, -2.018874, 0, 0, 0, 1, 1,
-1.247998, 1.968441, -1.085293, 0, 0, 0, 1, 1,
-1.236335, 1.534235, -0.2314752, 0, 0, 0, 1, 1,
-1.233453, 0.5136363, -4.036549, 1, 1, 1, 1, 1,
-1.231971, 0.6989793, -0.1836178, 1, 1, 1, 1, 1,
-1.228852, -0.3024828, -0.5100989, 1, 1, 1, 1, 1,
-1.228001, 0.4474082, -0.9975812, 1, 1, 1, 1, 1,
-1.227457, 1.150769, -0.02971136, 1, 1, 1, 1, 1,
-1.222609, -0.7384229, -1.302132, 1, 1, 1, 1, 1,
-1.220385, -0.232976, -2.421069, 1, 1, 1, 1, 1,
-1.21923, 2.544561, -0.02764207, 1, 1, 1, 1, 1,
-1.210152, -0.560324, -2.638185, 1, 1, 1, 1, 1,
-1.209845, 1.622051, -1.301312, 1, 1, 1, 1, 1,
-1.202146, -1.489629, -2.683236, 1, 1, 1, 1, 1,
-1.202095, 0.07681718, -1.974408, 1, 1, 1, 1, 1,
-1.197147, -1.507747, -2.174304, 1, 1, 1, 1, 1,
-1.196461, 1.267871, -1.406977, 1, 1, 1, 1, 1,
-1.194155, -2.519918, -1.937698, 1, 1, 1, 1, 1,
-1.187194, -0.1466659, -3.662275, 0, 0, 1, 1, 1,
-1.184852, -0.1416722, -2.42312, 1, 0, 0, 1, 1,
-1.181352, -0.5491131, -2.249783, 1, 0, 0, 1, 1,
-1.174544, 1.123846, -1.287885, 1, 0, 0, 1, 1,
-1.17109, 0.563122, -0.6993932, 1, 0, 0, 1, 1,
-1.168808, 0.1897647, -1.472899, 1, 0, 0, 1, 1,
-1.167087, -0.02820689, -1.040487, 0, 0, 0, 1, 1,
-1.165522, -0.1704043, -0.5022964, 0, 0, 0, 1, 1,
-1.165034, -2.255575, -2.779575, 0, 0, 0, 1, 1,
-1.162693, -2.286471, -1.801834, 0, 0, 0, 1, 1,
-1.160314, -0.0811959, -2.204898, 0, 0, 0, 1, 1,
-1.158247, -1.393876, -3.895562, 0, 0, 0, 1, 1,
-1.157822, 1.637969, 0.7655603, 0, 0, 0, 1, 1,
-1.157338, -0.6137676, -2.276225, 1, 1, 1, 1, 1,
-1.157065, 0.9111438, -0.1069876, 1, 1, 1, 1, 1,
-1.156074, -0.8528211, -1.435241, 1, 1, 1, 1, 1,
-1.140882, 0.3188663, -0.6185569, 1, 1, 1, 1, 1,
-1.13528, -0.3134907, -1.767727, 1, 1, 1, 1, 1,
-1.134541, -0.9239194, -1.820257, 1, 1, 1, 1, 1,
-1.133275, -1.111087, -2.827209, 1, 1, 1, 1, 1,
-1.131015, 0.321323, -1.584087, 1, 1, 1, 1, 1,
-1.126027, 0.8965708, -0.1232521, 1, 1, 1, 1, 1,
-1.120168, 0.07478409, -0.3534719, 1, 1, 1, 1, 1,
-1.117342, 2.258782, -2.44719, 1, 1, 1, 1, 1,
-1.112148, -0.0004103079, -1.642254, 1, 1, 1, 1, 1,
-1.109236, 0.1134629, -0.7923478, 1, 1, 1, 1, 1,
-1.10848, -0.2099474, -2.024216, 1, 1, 1, 1, 1,
-1.107611, -0.6082658, -0.9755359, 1, 1, 1, 1, 1,
-1.105348, -0.9845111, -1.071947, 0, 0, 1, 1, 1,
-1.10078, 0.2292231, -0.1076528, 1, 0, 0, 1, 1,
-1.09297, 0.6982206, -1.317251, 1, 0, 0, 1, 1,
-1.091496, 0.3779068, -0.4708208, 1, 0, 0, 1, 1,
-1.091285, -1.929305, -2.190535, 1, 0, 0, 1, 1,
-1.089064, -0.2766466, -0.5156897, 1, 0, 0, 1, 1,
-1.08663, 1.003504, -1.825432, 0, 0, 0, 1, 1,
-1.070617, -0.8634613, -2.261013, 0, 0, 0, 1, 1,
-1.070598, 0.923542, -0.3906989, 0, 0, 0, 1, 1,
-1.058463, -0.09173542, -0.5265684, 0, 0, 0, 1, 1,
-1.05458, 0.4698949, -1.468468, 0, 0, 0, 1, 1,
-1.051889, 1.803544, -0.08325275, 0, 0, 0, 1, 1,
-1.051187, -1.930088, -3.666333, 0, 0, 0, 1, 1,
-1.045203, -0.9698598, -1.651052, 1, 1, 1, 1, 1,
-1.025833, -1.451026, -2.134569, 1, 1, 1, 1, 1,
-1.025583, 1.608388, 1.234051, 1, 1, 1, 1, 1,
-1.024007, 1.088301, -0.0971728, 1, 1, 1, 1, 1,
-1.023454, -0.00273998, -0.9749007, 1, 1, 1, 1, 1,
-1.021123, 2.433117, -1.148914, 1, 1, 1, 1, 1,
-1.011826, 1.527761, -2.019848, 1, 1, 1, 1, 1,
-1.009444, -0.7039832, -2.422326, 1, 1, 1, 1, 1,
-1.008153, 0.5056469, 0.96704, 1, 1, 1, 1, 1,
-1.007173, 0.7816928, -0.1646179, 1, 1, 1, 1, 1,
-1.003547, -0.1815643, 0.349343, 1, 1, 1, 1, 1,
-0.9977223, 0.7729141, -0.3423769, 1, 1, 1, 1, 1,
-0.9962092, -0.9217502, -2.470721, 1, 1, 1, 1, 1,
-0.9937186, 1.329772, -0.4048324, 1, 1, 1, 1, 1,
-0.9931321, -0.1252452, -1.556508, 1, 1, 1, 1, 1,
-0.9923685, -0.905172, -2.275756, 0, 0, 1, 1, 1,
-0.9885234, -0.7265417, -3.526626, 1, 0, 0, 1, 1,
-0.9821747, 0.2640826, -2.723386, 1, 0, 0, 1, 1,
-0.9738338, -0.2805836, -2.479849, 1, 0, 0, 1, 1,
-0.9708083, 0.3701355, 0.514787, 1, 0, 0, 1, 1,
-0.9706737, 0.2727342, -2.135561, 1, 0, 0, 1, 1,
-0.970547, -0.2778593, -2.917091, 0, 0, 0, 1, 1,
-0.970009, 1.183187, 1.189394, 0, 0, 0, 1, 1,
-0.9600506, -2.235467, -3.169543, 0, 0, 0, 1, 1,
-0.9554893, -2.360173, -3.087696, 0, 0, 0, 1, 1,
-0.9512442, -0.8307841, -3.044383, 0, 0, 0, 1, 1,
-0.9487751, 0.02005201, -0.8491855, 0, 0, 0, 1, 1,
-0.9482272, -0.1527625, -1.849252, 0, 0, 0, 1, 1,
-0.938369, -0.9029232, -0.3847572, 1, 1, 1, 1, 1,
-0.9285815, 0.5761708, -1.107252, 1, 1, 1, 1, 1,
-0.9263238, 0.9385563, -0.8241564, 1, 1, 1, 1, 1,
-0.9229239, -0.04147412, -1.365429, 1, 1, 1, 1, 1,
-0.9164659, 0.1082287, -1.202107, 1, 1, 1, 1, 1,
-0.914983, -0.884308, -0.56764, 1, 1, 1, 1, 1,
-0.9137454, -0.1854259, -0.6769282, 1, 1, 1, 1, 1,
-0.91002, 0.7559618, 1.010927, 1, 1, 1, 1, 1,
-0.9076081, -0.7474576, -2.131066, 1, 1, 1, 1, 1,
-0.9062023, 0.3578582, -2.133566, 1, 1, 1, 1, 1,
-0.9055874, 0.2802255, -1.060481, 1, 1, 1, 1, 1,
-0.9012948, 0.174346, -1.186228, 1, 1, 1, 1, 1,
-0.8971872, 0.4112409, -2.928934, 1, 1, 1, 1, 1,
-0.8894272, -0.5114094, -1.590952, 1, 1, 1, 1, 1,
-0.8813103, 0.4052422, -2.275763, 1, 1, 1, 1, 1,
-0.8764369, 1.662397, -0.5530394, 0, 0, 1, 1, 1,
-0.8732796, -0.007291127, -1.45585, 1, 0, 0, 1, 1,
-0.866227, 3.024106, -1.09854, 1, 0, 0, 1, 1,
-0.8645658, 0.8523599, 0.1882265, 1, 0, 0, 1, 1,
-0.864413, -0.8342273, -1.284329, 1, 0, 0, 1, 1,
-0.8577381, 0.4278453, -2.792461, 1, 0, 0, 1, 1,
-0.8492282, 0.5303235, -2.138573, 0, 0, 0, 1, 1,
-0.8470437, -0.1077147, -2.176011, 0, 0, 0, 1, 1,
-0.8420566, -0.6124166, -3.276256, 0, 0, 0, 1, 1,
-0.8400011, 0.6858242, -0.4181278, 0, 0, 0, 1, 1,
-0.8377161, -0.2579576, 0.6875709, 0, 0, 0, 1, 1,
-0.8362884, 0.4287542, -1.848421, 0, 0, 0, 1, 1,
-0.8299457, -1.096484, -3.889407, 0, 0, 0, 1, 1,
-0.8297655, 1.11214, -0.2659481, 1, 1, 1, 1, 1,
-0.8284035, 0.7158682, 0.7018229, 1, 1, 1, 1, 1,
-0.8248546, -0.08164737, -1.50158, 1, 1, 1, 1, 1,
-0.8227499, -0.9738293, -2.922706, 1, 1, 1, 1, 1,
-0.8209909, -0.1239215, -1.703606, 1, 1, 1, 1, 1,
-0.8158357, -0.2574689, -2.44757, 1, 1, 1, 1, 1,
-0.8115666, 1.267105, -0.2866009, 1, 1, 1, 1, 1,
-0.8071879, -0.7564869, -2.007748, 1, 1, 1, 1, 1,
-0.8064562, 0.5340794, -1.180434, 1, 1, 1, 1, 1,
-0.8001394, 1.488979, 1.35506, 1, 1, 1, 1, 1,
-0.7982635, 2.420706, -2.32475, 1, 1, 1, 1, 1,
-0.7940019, -0.3583654, -3.804397, 1, 1, 1, 1, 1,
-0.7800301, 1.170139, -1.390577, 1, 1, 1, 1, 1,
-0.7791649, -1.265633, -0.5736035, 1, 1, 1, 1, 1,
-0.7778099, -0.7016048, -1.624121, 1, 1, 1, 1, 1,
-0.7774912, -1.333227, -0.7064691, 0, 0, 1, 1, 1,
-0.7675959, -0.4821481, -0.749615, 1, 0, 0, 1, 1,
-0.7591677, 0.1476213, -0.3382977, 1, 0, 0, 1, 1,
-0.747033, 0.3490081, 0.5031295, 1, 0, 0, 1, 1,
-0.7233135, -0.4439902, -1.319236, 1, 0, 0, 1, 1,
-0.7132649, -0.4035731, -0.6370609, 1, 0, 0, 1, 1,
-0.7097735, 0.8322197, -1.076943, 0, 0, 0, 1, 1,
-0.7065533, -0.03006659, -2.146286, 0, 0, 0, 1, 1,
-0.7058607, 0.2277945, -1.224806, 0, 0, 0, 1, 1,
-0.7029962, -2.155423, -2.754979, 0, 0, 0, 1, 1,
-0.7023305, -0.3395556, -0.7657414, 0, 0, 0, 1, 1,
-0.692311, 1.871144, 0.9937538, 0, 0, 0, 1, 1,
-0.690518, -0.07491022, -2.10135, 0, 0, 0, 1, 1,
-0.6806037, 0.9232467, -0.6786701, 1, 1, 1, 1, 1,
-0.6772304, -0.5565454, 0.3290824, 1, 1, 1, 1, 1,
-0.6630605, -0.3440042, -1.495652, 1, 1, 1, 1, 1,
-0.6579306, -0.03782908, -0.3465353, 1, 1, 1, 1, 1,
-0.6467924, -0.3610228, -3.745779, 1, 1, 1, 1, 1,
-0.6444707, -1.257377, -3.179889, 1, 1, 1, 1, 1,
-0.6411769, 0.8418889, -0.2102609, 1, 1, 1, 1, 1,
-0.6401115, 0.4152598, -0.8950779, 1, 1, 1, 1, 1,
-0.6361147, 1.328278, -0.8834732, 1, 1, 1, 1, 1,
-0.6348552, 2.942716, 1.745265, 1, 1, 1, 1, 1,
-0.6331819, -0.3669351, -4.178561, 1, 1, 1, 1, 1,
-0.6275515, -0.5205179, -1.612965, 1, 1, 1, 1, 1,
-0.6205859, 0.5384592, -1.680817, 1, 1, 1, 1, 1,
-0.6099332, -0.8704858, -5.044423, 1, 1, 1, 1, 1,
-0.6066825, -0.2839388, -3.275026, 1, 1, 1, 1, 1,
-0.5996674, 1.964973, 0.3622095, 0, 0, 1, 1, 1,
-0.5991511, 0.6814991, 0.2211913, 1, 0, 0, 1, 1,
-0.5990588, -2.353154, -2.072079, 1, 0, 0, 1, 1,
-0.5980834, -0.7225179, -2.083522, 1, 0, 0, 1, 1,
-0.5966476, -1.118031, -3.610173, 1, 0, 0, 1, 1,
-0.5922943, 1.682157, -0.9327491, 1, 0, 0, 1, 1,
-0.5899329, -0.6981168, -1.912419, 0, 0, 0, 1, 1,
-0.5879607, 1.044047, -1.297157, 0, 0, 0, 1, 1,
-0.5804952, 0.3426648, -0.6360915, 0, 0, 0, 1, 1,
-0.5775563, 1.336959, 0.6015018, 0, 0, 0, 1, 1,
-0.5748471, -0.872419, -3.403105, 0, 0, 0, 1, 1,
-0.5726147, 0.05184662, -0.7384307, 0, 0, 0, 1, 1,
-0.5722903, -0.251854, -0.9261011, 0, 0, 0, 1, 1,
-0.5707, -0.3224492, -2.682618, 1, 1, 1, 1, 1,
-0.5700589, -0.09007793, -2.256003, 1, 1, 1, 1, 1,
-0.5687757, -0.901784, -3.954953, 1, 1, 1, 1, 1,
-0.5653476, -0.0446303, -1.680665, 1, 1, 1, 1, 1,
-0.559275, -0.8427759, -3.662912, 1, 1, 1, 1, 1,
-0.5592448, 0.2208783, -1.743084, 1, 1, 1, 1, 1,
-0.5528744, 0.8763623, -0.9881573, 1, 1, 1, 1, 1,
-0.5459207, -0.01622288, -0.2296846, 1, 1, 1, 1, 1,
-0.545293, 1.550116, -0.6742732, 1, 1, 1, 1, 1,
-0.5451853, -0.5138213, -1.382336, 1, 1, 1, 1, 1,
-0.5344438, -0.4696088, -2.195932, 1, 1, 1, 1, 1,
-0.5320809, 0.6560056, -2.147937, 1, 1, 1, 1, 1,
-0.5317239, -1.112841, -5.080067, 1, 1, 1, 1, 1,
-0.5315049, -0.7950842, -1.834895, 1, 1, 1, 1, 1,
-0.531443, -0.3944263, -4.19814, 1, 1, 1, 1, 1,
-0.5291009, -1.062201, -2.86073, 0, 0, 1, 1, 1,
-0.527779, -0.4513741, -2.111389, 1, 0, 0, 1, 1,
-0.5272504, -1.413627, -2.817994, 1, 0, 0, 1, 1,
-0.5272327, -0.236528, -1.707159, 1, 0, 0, 1, 1,
-0.5204717, 0.8445337, -1.845516, 1, 0, 0, 1, 1,
-0.5190951, -1.610911, -3.213919, 1, 0, 0, 1, 1,
-0.5189077, 0.8105279, -0.6670123, 0, 0, 0, 1, 1,
-0.5182024, -0.9045997, -1.796237, 0, 0, 0, 1, 1,
-0.5173387, 0.3019738, -0.1699477, 0, 0, 0, 1, 1,
-0.5143354, 1.409031, -0.2056659, 0, 0, 0, 1, 1,
-0.5112354, -1.348472, -2.511807, 0, 0, 0, 1, 1,
-0.5092335, -1.485972, -0.4082395, 0, 0, 0, 1, 1,
-0.508291, 0.8491671, -0.3034995, 0, 0, 0, 1, 1,
-0.5074073, 1.374039, -0.7866265, 1, 1, 1, 1, 1,
-0.5058879, -1.402947, -1.923896, 1, 1, 1, 1, 1,
-0.5047839, -1.106566, -2.666758, 1, 1, 1, 1, 1,
-0.502309, -0.4872763, -1.726287, 1, 1, 1, 1, 1,
-0.4989921, -0.8610857, -3.731345, 1, 1, 1, 1, 1,
-0.4986401, 0.3099547, -1.979069, 1, 1, 1, 1, 1,
-0.4984893, 0.6381154, 0.1011304, 1, 1, 1, 1, 1,
-0.4935287, 0.9826016, 0.220956, 1, 1, 1, 1, 1,
-0.4857919, -0.4468316, -2.250277, 1, 1, 1, 1, 1,
-0.4812577, -0.0009092294, -2.580115, 1, 1, 1, 1, 1,
-0.4792898, -1.923417, -1.248157, 1, 1, 1, 1, 1,
-0.4734583, -1.06044, -1.761195, 1, 1, 1, 1, 1,
-0.4693694, 1.220355, -0.6635609, 1, 1, 1, 1, 1,
-0.4631622, 0.6422725, -0.6920226, 1, 1, 1, 1, 1,
-0.4589411, -0.01490737, -2.745263, 1, 1, 1, 1, 1,
-0.4574008, -0.0769847, -0.9761537, 0, 0, 1, 1, 1,
-0.4550535, -0.3038269, -3.964956, 1, 0, 0, 1, 1,
-0.4536594, 0.8113665, -2.206938, 1, 0, 0, 1, 1,
-0.4524484, 0.1357047, -4.337195, 1, 0, 0, 1, 1,
-0.4492082, 0.1152689, -1.916845, 1, 0, 0, 1, 1,
-0.4478822, -0.02549043, -1.346009, 1, 0, 0, 1, 1,
-0.4435323, -1.018229, -2.152659, 0, 0, 0, 1, 1,
-0.4431643, -0.6466088, -1.214998, 0, 0, 0, 1, 1,
-0.4426518, 0.5956331, -0.4293909, 0, 0, 0, 1, 1,
-0.4408997, 0.7609885, -0.5050458, 0, 0, 0, 1, 1,
-0.438787, -1.534185, -2.673991, 0, 0, 0, 1, 1,
-0.4385063, 0.5761512, -2.80609, 0, 0, 0, 1, 1,
-0.4367553, 0.5188442, 1.565943, 0, 0, 0, 1, 1,
-0.4229591, -1.694484, -3.970891, 1, 1, 1, 1, 1,
-0.4229275, 1.235165, 0.03530319, 1, 1, 1, 1, 1,
-0.4159576, -0.7370124, -1.351205, 1, 1, 1, 1, 1,
-0.4098678, -0.4127516, -4.604025, 1, 1, 1, 1, 1,
-0.4087511, 0.08229286, -3.454206, 1, 1, 1, 1, 1,
-0.4087157, 0.776661, 1.997978, 1, 1, 1, 1, 1,
-0.4069195, -1.588196, -3.253414, 1, 1, 1, 1, 1,
-0.4042856, -1.546746, -3.067688, 1, 1, 1, 1, 1,
-0.4016316, -0.324535, -0.569742, 1, 1, 1, 1, 1,
-0.4002038, -0.3838942, -1.115667, 1, 1, 1, 1, 1,
-0.397677, 0.8230515, 0.1338692, 1, 1, 1, 1, 1,
-0.3932539, -0.6386271, -2.692262, 1, 1, 1, 1, 1,
-0.3928565, -1.147946, -3.742927, 1, 1, 1, 1, 1,
-0.3897877, 0.8384014, -1.114708, 1, 1, 1, 1, 1,
-0.3863119, 0.5509043, -1.900032, 1, 1, 1, 1, 1,
-0.3842958, -0.4752093, -2.802833, 0, 0, 1, 1, 1,
-0.382535, -0.309628, -2.818366, 1, 0, 0, 1, 1,
-0.3815039, 0.9467716, -0.5438012, 1, 0, 0, 1, 1,
-0.3775416, 0.5681998, -0.3254856, 1, 0, 0, 1, 1,
-0.3730424, 0.5472077, -1.428505, 1, 0, 0, 1, 1,
-0.3695486, -0.09521786, -1.232367, 1, 0, 0, 1, 1,
-0.3687218, 1.268914, -1.425283, 0, 0, 0, 1, 1,
-0.3662742, 0.9423181, -1.107842, 0, 0, 0, 1, 1,
-0.3656794, 0.5991857, -1.434618, 0, 0, 0, 1, 1,
-0.3634762, 1.902295, 1.713395, 0, 0, 0, 1, 1,
-0.3632553, 1.047267, 1.41554, 0, 0, 0, 1, 1,
-0.362691, 0.8665844, 0.3261434, 0, 0, 0, 1, 1,
-0.3625562, -0.009526956, -1.82431, 0, 0, 0, 1, 1,
-0.3619209, 1.290904, 1.269803, 1, 1, 1, 1, 1,
-0.3606714, -2.076725, -3.341596, 1, 1, 1, 1, 1,
-0.3576359, -1.158317, -2.071358, 1, 1, 1, 1, 1,
-0.3574371, -0.4543176, -2.683216, 1, 1, 1, 1, 1,
-0.3529229, -0.5522149, -1.419108, 1, 1, 1, 1, 1,
-0.3463764, 1.478592, -0.4365347, 1, 1, 1, 1, 1,
-0.3461435, -1.205955, -2.789416, 1, 1, 1, 1, 1,
-0.3449039, -0.576589, -2.479649, 1, 1, 1, 1, 1,
-0.3394876, -2.248608, -2.312003, 1, 1, 1, 1, 1,
-0.3379337, -1.389088, -3.557687, 1, 1, 1, 1, 1,
-0.3372105, 1.257383, 0.6721509, 1, 1, 1, 1, 1,
-0.3353062, 0.4447868, -1.194581, 1, 1, 1, 1, 1,
-0.3311812, 1.784497, 1.049507, 1, 1, 1, 1, 1,
-0.324791, -1.149744, -3.208528, 1, 1, 1, 1, 1,
-0.3195539, -0.2610799, -3.832504, 1, 1, 1, 1, 1,
-0.3153585, -0.3513554, -2.062963, 0, 0, 1, 1, 1,
-0.3146107, 0.06682048, -1.217267, 1, 0, 0, 1, 1,
-0.3107769, -0.6436288, -2.726981, 1, 0, 0, 1, 1,
-0.30877, -0.9229094, -2.76131, 1, 0, 0, 1, 1,
-0.3078882, 0.8056037, -0.4289485, 1, 0, 0, 1, 1,
-0.306262, -1.511509, -3.687772, 1, 0, 0, 1, 1,
-0.3047948, -0.7435327, -1.152515, 0, 0, 0, 1, 1,
-0.3022648, 0.03134222, -1.426229, 0, 0, 0, 1, 1,
-0.3013057, -2.080009, -4.628845, 0, 0, 0, 1, 1,
-0.2963122, -0.5866291, -2.566874, 0, 0, 0, 1, 1,
-0.2941786, 0.02159075, -1.408417, 0, 0, 0, 1, 1,
-0.2931856, 0.7105356, -0.7095509, 0, 0, 0, 1, 1,
-0.2921251, 0.8044707, 1.000992, 0, 0, 0, 1, 1,
-0.2887972, 0.2139767, -1.381777, 1, 1, 1, 1, 1,
-0.2789626, -1.207174, -1.079569, 1, 1, 1, 1, 1,
-0.277075, -0.7942293, -1.363012, 1, 1, 1, 1, 1,
-0.2748473, 2.054903, -0.8550757, 1, 1, 1, 1, 1,
-0.2718188, 0.6949008, -0.976766, 1, 1, 1, 1, 1,
-0.269247, -0.5296156, -3.895033, 1, 1, 1, 1, 1,
-0.2661904, -0.5986626, -1.984957, 1, 1, 1, 1, 1,
-0.2640959, 0.3536528, -0.2882503, 1, 1, 1, 1, 1,
-0.2624153, 0.6077865, -0.9169149, 1, 1, 1, 1, 1,
-0.2598752, -0.6985476, -3.627979, 1, 1, 1, 1, 1,
-0.2594265, 0.4032059, -0.2072171, 1, 1, 1, 1, 1,
-0.2581483, 0.06848259, -1.175247, 1, 1, 1, 1, 1,
-0.2557409, 0.3680476, -0.3665839, 1, 1, 1, 1, 1,
-0.2555408, -0.9172422, -3.417531, 1, 1, 1, 1, 1,
-0.2494434, -1.74846, -4.095073, 1, 1, 1, 1, 1,
-0.2457373, -0.1861368, -2.974427, 0, 0, 1, 1, 1,
-0.24504, 0.4015795, 1.408307, 1, 0, 0, 1, 1,
-0.2383119, -0.7955109, -1.678652, 1, 0, 0, 1, 1,
-0.2359675, -0.757277, -0.444189, 1, 0, 0, 1, 1,
-0.2353605, 0.681103, 0.6033805, 1, 0, 0, 1, 1,
-0.2342487, 0.3631333, -1.110062, 1, 0, 0, 1, 1,
-0.2339478, -0.1559409, -2.263269, 0, 0, 0, 1, 1,
-0.233129, 1.603602, 0.3330862, 0, 0, 0, 1, 1,
-0.2306984, 0.1453993, -1.147047, 0, 0, 0, 1, 1,
-0.2250546, 0.08259684, 0.5179918, 0, 0, 0, 1, 1,
-0.2242817, -2.018055, -2.194016, 0, 0, 0, 1, 1,
-0.2226683, -0.1054158, -2.172044, 0, 0, 0, 1, 1,
-0.2209908, 0.06890014, -0.6569033, 0, 0, 0, 1, 1,
-0.2207702, -0.8690506, -2.517224, 1, 1, 1, 1, 1,
-0.2083238, 0.3499257, 0.3016891, 1, 1, 1, 1, 1,
-0.2082282, 1.053345, -0.7526715, 1, 1, 1, 1, 1,
-0.2061298, -0.8569548, -1.154689, 1, 1, 1, 1, 1,
-0.2048172, -1.412041, -3.350189, 1, 1, 1, 1, 1,
-0.1992752, 0.8733046, 0.2701517, 1, 1, 1, 1, 1,
-0.1975714, 2.041837, -1.417657, 1, 1, 1, 1, 1,
-0.1939883, -0.5882742, -3.323598, 1, 1, 1, 1, 1,
-0.1934858, -0.3596639, -3.271273, 1, 1, 1, 1, 1,
-0.1922684, -1.548535, -2.95279, 1, 1, 1, 1, 1,
-0.1860858, -0.9675679, -2.760957, 1, 1, 1, 1, 1,
-0.1810509, -0.8924314, -4.469237, 1, 1, 1, 1, 1,
-0.1801621, -0.01362564, -1.559428, 1, 1, 1, 1, 1,
-0.1792512, 0.485492, -1.699834, 1, 1, 1, 1, 1,
-0.1776632, -0.06538065, -0.7484948, 1, 1, 1, 1, 1,
-0.1750569, 0.1785848, 1.181938, 0, 0, 1, 1, 1,
-0.1745054, -1.40107, -4.929021, 1, 0, 0, 1, 1,
-0.1731973, -0.5439139, -3.824235, 1, 0, 0, 1, 1,
-0.1725409, 0.2438562, 0.1489644, 1, 0, 0, 1, 1,
-0.1704611, -0.5381751, -0.6529589, 1, 0, 0, 1, 1,
-0.1689132, 2.246266, -0.245944, 1, 0, 0, 1, 1,
-0.1624509, -0.1129679, -4.78826, 0, 0, 0, 1, 1,
-0.1618484, -2.572552, -4.92781, 0, 0, 0, 1, 1,
-0.1602953, -0.2979959, -2.769109, 0, 0, 0, 1, 1,
-0.1570975, 1.63977, -0.6818051, 0, 0, 0, 1, 1,
-0.1560595, 1.906117, -0.8940426, 0, 0, 0, 1, 1,
-0.1555323, -1.059676, -2.614367, 0, 0, 0, 1, 1,
-0.1546277, 0.9312345, 1.639477, 0, 0, 0, 1, 1,
-0.1423119, 0.6014266, 0.4184783, 1, 1, 1, 1, 1,
-0.1378607, 0.09724528, -0.08692376, 1, 1, 1, 1, 1,
-0.1333174, -0.1717067, -3.219116, 1, 1, 1, 1, 1,
-0.1286545, 0.05937829, -1.977328, 1, 1, 1, 1, 1,
-0.1278757, -0.6852852, -2.985256, 1, 1, 1, 1, 1,
-0.1265209, -0.9709367, -1.328574, 1, 1, 1, 1, 1,
-0.1261521, -1.541083, -2.167003, 1, 1, 1, 1, 1,
-0.1239731, 0.6571516, -1.799796, 1, 1, 1, 1, 1,
-0.1217647, -0.6740378, -4.860549, 1, 1, 1, 1, 1,
-0.1192685, -1.132824, -4.350256, 1, 1, 1, 1, 1,
-0.115127, -0.1994984, -3.418947, 1, 1, 1, 1, 1,
-0.1128928, -0.7138136, -4.781305, 1, 1, 1, 1, 1,
-0.1100749, -1.727293, -2.316178, 1, 1, 1, 1, 1,
-0.109812, -0.1772808, -2.39593, 1, 1, 1, 1, 1,
-0.1095824, -0.8897822, -2.994563, 1, 1, 1, 1, 1,
-0.1082835, -1.147086, -1.654125, 0, 0, 1, 1, 1,
-0.1049766, 0.9226088, 0.6530498, 1, 0, 0, 1, 1,
-0.1015785, 0.5490282, -0.1237123, 1, 0, 0, 1, 1,
-0.09282429, 0.5942914, 0.603535, 1, 0, 0, 1, 1,
-0.09207151, 0.892055, -1.368443, 1, 0, 0, 1, 1,
-0.08863766, -1.417733, -4.362813, 1, 0, 0, 1, 1,
-0.08539657, -1.039501, -2.157922, 0, 0, 0, 1, 1,
-0.08538816, 1.800439, -0.7465838, 0, 0, 0, 1, 1,
-0.08317521, 0.127169, -0.9670965, 0, 0, 0, 1, 1,
-0.07537242, -0.7153968, -0.7237741, 0, 0, 0, 1, 1,
-0.07471607, -0.2952541, -2.472056, 0, 0, 0, 1, 1,
-0.07038042, -0.9725781, -2.989499, 0, 0, 0, 1, 1,
-0.06930866, 0.6331763, -1.541642, 0, 0, 0, 1, 1,
-0.06603696, -0.5010849, -2.378639, 1, 1, 1, 1, 1,
-0.06489427, -1.323074, -4.182553, 1, 1, 1, 1, 1,
-0.06311424, 0.845431, 0.8736566, 1, 1, 1, 1, 1,
-0.06303542, -0.851759, -3.332389, 1, 1, 1, 1, 1,
-0.05784035, 0.4066727, -0.1300616, 1, 1, 1, 1, 1,
-0.05697859, 1.249874, 1.478152, 1, 1, 1, 1, 1,
-0.05633148, 2.4166, -0.2796965, 1, 1, 1, 1, 1,
-0.04934546, -0.8615101, -3.25672, 1, 1, 1, 1, 1,
-0.04872951, -0.8217814, -2.9627, 1, 1, 1, 1, 1,
-0.04616098, 0.3617189, 0.6165864, 1, 1, 1, 1, 1,
-0.0448911, 0.02111979, -0.7595049, 1, 1, 1, 1, 1,
-0.04410191, 2.032683, 1.455454, 1, 1, 1, 1, 1,
-0.04292623, 1.164126, -0.7313878, 1, 1, 1, 1, 1,
-0.04209807, -3.020313, -2.67195, 1, 1, 1, 1, 1,
-0.04179006, 0.4524437, -0.429729, 1, 1, 1, 1, 1,
-0.03700732, -0.3911742, -3.381805, 0, 0, 1, 1, 1,
-0.03377657, 0.3304491, -1.469667, 1, 0, 0, 1, 1,
-0.03135923, 0.9025235, -0.8170399, 1, 0, 0, 1, 1,
-0.03049891, 1.281684, -0.4562523, 1, 0, 0, 1, 1,
-0.02819706, 0.4472536, -0.8355594, 1, 0, 0, 1, 1,
-0.01880562, -0.04267842, -4.549391, 1, 0, 0, 1, 1,
-0.01715385, -0.7189856, -1.934211, 0, 0, 0, 1, 1,
-0.01172962, -0.08268639, -4.677486, 0, 0, 0, 1, 1,
-0.007879994, -0.3433275, -4.305776, 0, 0, 0, 1, 1,
-0.002106056, -0.2592461, -3.491699, 0, 0, 0, 1, 1,
-0.001046495, 0.3035188, 1.561202, 0, 0, 0, 1, 1,
0.001246032, -0.3160687, 2.738707, 0, 0, 0, 1, 1,
0.002475607, 0.2135736, 0.825718, 0, 0, 0, 1, 1,
0.01116835, 0.2045997, 0.1769657, 1, 1, 1, 1, 1,
0.01121186, -0.2010645, 5.171439, 1, 1, 1, 1, 1,
0.01422798, -1.333769, 3.131152, 1, 1, 1, 1, 1,
0.01631473, 1.793827, 0.7602907, 1, 1, 1, 1, 1,
0.01638885, -0.5100993, 3.419738, 1, 1, 1, 1, 1,
0.01912718, 1.161009, 1.251627, 1, 1, 1, 1, 1,
0.02123796, -0.3524974, 3.559351, 1, 1, 1, 1, 1,
0.02252707, -2.437678, 3.395451, 1, 1, 1, 1, 1,
0.02869043, -2.844961, 4.449295, 1, 1, 1, 1, 1,
0.02955163, 0.6974204, 0.914435, 1, 1, 1, 1, 1,
0.03066551, -0.5252595, 2.669996, 1, 1, 1, 1, 1,
0.0361352, 0.180752, 1.557797, 1, 1, 1, 1, 1,
0.03617105, 0.3602583, -0.8618677, 1, 1, 1, 1, 1,
0.03661048, 0.2577823, 0.1415692, 1, 1, 1, 1, 1,
0.03718106, 1.271992, 0.3195666, 1, 1, 1, 1, 1,
0.0410447, 1.650117, 0.4772122, 0, 0, 1, 1, 1,
0.04196977, 0.02685336, 1.830139, 1, 0, 0, 1, 1,
0.04262211, -0.8606101, 4.127816, 1, 0, 0, 1, 1,
0.05075661, 0.6531882, -0.1006477, 1, 0, 0, 1, 1,
0.05523119, -0.4746243, 3.776618, 1, 0, 0, 1, 1,
0.05586822, -1.21394, 2.778378, 1, 0, 0, 1, 1,
0.06148786, -1.163693, 2.167797, 0, 0, 0, 1, 1,
0.06845947, 0.8843381, -1.012043, 0, 0, 0, 1, 1,
0.07207271, 3.181943, -1.424768, 0, 0, 0, 1, 1,
0.07309949, 1.156814, -0.4766157, 0, 0, 0, 1, 1,
0.07742685, -0.6850942, 4.022283, 0, 0, 0, 1, 1,
0.0785402, 1.094968, -0.7314689, 0, 0, 0, 1, 1,
0.07933465, 0.7076409, 0.6573238, 0, 0, 0, 1, 1,
0.08049614, 0.08365279, 1.199211, 1, 1, 1, 1, 1,
0.08077846, 1.859872, 0.02736472, 1, 1, 1, 1, 1,
0.08265194, -0.2728476, 2.615986, 1, 1, 1, 1, 1,
0.08406935, -0.9664871, 2.206652, 1, 1, 1, 1, 1,
0.08485283, -0.4203945, 3.052197, 1, 1, 1, 1, 1,
0.08585658, -0.3960223, 2.244433, 1, 1, 1, 1, 1,
0.08663039, -2.117322, 4.015549, 1, 1, 1, 1, 1,
0.08771409, 0.02988099, 0.3220447, 1, 1, 1, 1, 1,
0.08963607, 0.9333253, 0.7977816, 1, 1, 1, 1, 1,
0.09088369, -1.092729, 1.819461, 1, 1, 1, 1, 1,
0.09093741, 0.4752717, 0.07446946, 1, 1, 1, 1, 1,
0.09590191, -1.479577, 2.671392, 1, 1, 1, 1, 1,
0.09969211, 0.4433264, 0.7260336, 1, 1, 1, 1, 1,
0.1081196, -0.7254583, 3.343483, 1, 1, 1, 1, 1,
0.1104964, 1.044049, 0.565307, 1, 1, 1, 1, 1,
0.1135089, -0.1787101, 2.162421, 0, 0, 1, 1, 1,
0.1182855, -0.9939774, 3.845425, 1, 0, 0, 1, 1,
0.1217929, 1.293182, 0.03626553, 1, 0, 0, 1, 1,
0.1232492, -0.2322534, 1.509918, 1, 0, 0, 1, 1,
0.1240926, -1.279473, 3.789865, 1, 0, 0, 1, 1,
0.1251172, -0.09057209, 2.29916, 1, 0, 0, 1, 1,
0.1275857, -0.2844254, 2.311648, 0, 0, 0, 1, 1,
0.1319805, -0.9374083, 4.050633, 0, 0, 0, 1, 1,
0.1334663, 0.7178424, 0.9459314, 0, 0, 0, 1, 1,
0.1418556, 0.1355487, 0.3229627, 0, 0, 0, 1, 1,
0.1427415, -1.017453, 4.342079, 0, 0, 0, 1, 1,
0.147643, -2.193134, 2.125522, 0, 0, 0, 1, 1,
0.1501109, -2.90028, 3.059538, 0, 0, 0, 1, 1,
0.1591693, -0.4854907, 2.873524, 1, 1, 1, 1, 1,
0.1641514, -0.4632043, 3.28943, 1, 1, 1, 1, 1,
0.1649792, -1.705499, 4.099704, 1, 1, 1, 1, 1,
0.1688248, -1.422927, 3.130991, 1, 1, 1, 1, 1,
0.1703389, 0.07935344, 0.8250028, 1, 1, 1, 1, 1,
0.1712438, -2.050464, 1.383903, 1, 1, 1, 1, 1,
0.1787065, 1.056652, 0.4311723, 1, 1, 1, 1, 1,
0.1806179, -0.4169453, 4.144868, 1, 1, 1, 1, 1,
0.1861136, 1.038645, 0.9752446, 1, 1, 1, 1, 1,
0.1880923, -0.07088383, 1.397329, 1, 1, 1, 1, 1,
0.1916417, -2.353408, 3.430815, 1, 1, 1, 1, 1,
0.191661, -0.08605871, 2.026798, 1, 1, 1, 1, 1,
0.1930329, 0.388126, 0.4452913, 1, 1, 1, 1, 1,
0.1956049, -1.601857, 2.43834, 1, 1, 1, 1, 1,
0.1966304, -0.6354254, 2.588855, 1, 1, 1, 1, 1,
0.1993737, -0.8974009, 2.807796, 0, 0, 1, 1, 1,
0.2022872, -2.212158, 2.599348, 1, 0, 0, 1, 1,
0.2050784, 0.6559323, 0.4621665, 1, 0, 0, 1, 1,
0.2065208, -0.3468761, 4.382616, 1, 0, 0, 1, 1,
0.2111418, -0.04101814, 0.9102566, 1, 0, 0, 1, 1,
0.2112312, 0.5035294, 0.08587816, 1, 0, 0, 1, 1,
0.2132448, 0.8244962, 0.9115032, 0, 0, 0, 1, 1,
0.2156837, -1.403657, 2.733047, 0, 0, 0, 1, 1,
0.2164485, 0.04572797, -0.9430542, 0, 0, 0, 1, 1,
0.2323634, 0.1254837, 1.346187, 0, 0, 0, 1, 1,
0.2369604, 0.3862164, 1.958416, 0, 0, 0, 1, 1,
0.2401322, 0.9108896, 1.002799, 0, 0, 0, 1, 1,
0.2420781, 1.429992, -0.09036206, 0, 0, 0, 1, 1,
0.2424021, -0.02326305, 1.926711, 1, 1, 1, 1, 1,
0.2464525, -1.063633, 3.270281, 1, 1, 1, 1, 1,
0.2471979, 1.069084, -0.7670085, 1, 1, 1, 1, 1,
0.2486491, 0.6446728, 0.09206736, 1, 1, 1, 1, 1,
0.2526978, -0.3220159, 2.671784, 1, 1, 1, 1, 1,
0.2538498, -1.247347, 2.213865, 1, 1, 1, 1, 1,
0.2581553, 0.9746394, 1.048467, 1, 1, 1, 1, 1,
0.2585073, -1.688448, 3.581359, 1, 1, 1, 1, 1,
0.2597545, -0.4532909, 4.566942, 1, 1, 1, 1, 1,
0.2606327, 1.718843, -0.7696198, 1, 1, 1, 1, 1,
0.2609045, 2.498379, 0.6597075, 1, 1, 1, 1, 1,
0.2642964, -0.4746081, 2.826666, 1, 1, 1, 1, 1,
0.2660079, -0.02904437, 2.497033, 1, 1, 1, 1, 1,
0.2668359, 1.026004, -0.6588121, 1, 1, 1, 1, 1,
0.2698275, 0.6174537, -0.3182181, 1, 1, 1, 1, 1,
0.2714474, -0.1395649, 2.039333, 0, 0, 1, 1, 1,
0.2716215, -0.2311951, 2.890562, 1, 0, 0, 1, 1,
0.2725613, -0.2836611, 1.802642, 1, 0, 0, 1, 1,
0.2730826, 0.1069515, 0.4139231, 1, 0, 0, 1, 1,
0.2768214, -1.525601, 3.647338, 1, 0, 0, 1, 1,
0.2786644, 0.2046756, 0.9371099, 1, 0, 0, 1, 1,
0.2792666, 0.4802561, 0.2220858, 0, 0, 0, 1, 1,
0.2823455, 0.6297531, -0.4716159, 0, 0, 0, 1, 1,
0.2894813, -1.151202, 3.013334, 0, 0, 0, 1, 1,
0.2900217, -0.8258238, 2.864702, 0, 0, 0, 1, 1,
0.2975603, 0.383955, -0.5188025, 0, 0, 0, 1, 1,
0.3011457, -0.2040188, 1.789727, 0, 0, 0, 1, 1,
0.3044081, -1.08231, 3.913114, 0, 0, 0, 1, 1,
0.311902, 0.4011924, -0.2162351, 1, 1, 1, 1, 1,
0.3144594, -1.520443, 4.317607, 1, 1, 1, 1, 1,
0.3160004, 0.320915, 1.418708, 1, 1, 1, 1, 1,
0.3171875, -0.2796539, 1.0661, 1, 1, 1, 1, 1,
0.3183141, 2.705274, 0.6722019, 1, 1, 1, 1, 1,
0.3260605, 0.9103287, 1.232512, 1, 1, 1, 1, 1,
0.3282586, 0.7992268, 0.6072635, 1, 1, 1, 1, 1,
0.3313886, 0.4956135, -0.2212888, 1, 1, 1, 1, 1,
0.3333261, 1.304523, 0.9531732, 1, 1, 1, 1, 1,
0.3347009, 1.230792, 0.6862243, 1, 1, 1, 1, 1,
0.335377, -0.1483092, 3.265298, 1, 1, 1, 1, 1,
0.3479207, -1.328304, 2.315165, 1, 1, 1, 1, 1,
0.3551013, 1.459787, 0.5103818, 1, 1, 1, 1, 1,
0.3564826, 0.4757802, 1.710799, 1, 1, 1, 1, 1,
0.3705627, 1.042163, 1.117062, 1, 1, 1, 1, 1,
0.3716971, -0.8607621, 2.482571, 0, 0, 1, 1, 1,
0.3722976, 0.4796835, 1.358584, 1, 0, 0, 1, 1,
0.3734159, 0.009743751, 1.433003, 1, 0, 0, 1, 1,
0.3757284, 0.05996742, 1.554133, 1, 0, 0, 1, 1,
0.3810025, 0.2620481, -0.05888668, 1, 0, 0, 1, 1,
0.3812726, 1.971359, 0.856621, 1, 0, 0, 1, 1,
0.3860005, -0.122099, 0.8342258, 0, 0, 0, 1, 1,
0.3869878, -0.5631298, 2.517218, 0, 0, 0, 1, 1,
0.3880159, 0.3788182, -0.3003172, 0, 0, 0, 1, 1,
0.389892, 1.186363, 1.023696, 0, 0, 0, 1, 1,
0.3904665, 0.05039245, -0.4023161, 0, 0, 0, 1, 1,
0.397541, -1.142606, 3.151491, 0, 0, 0, 1, 1,
0.3993486, 1.906643, 1.517381, 0, 0, 0, 1, 1,
0.3999451, 1.594168, 0.6283114, 1, 1, 1, 1, 1,
0.402787, 0.2176398, 0.7147588, 1, 1, 1, 1, 1,
0.4053829, -0.1308912, 1.575928, 1, 1, 1, 1, 1,
0.4104016, -0.8493764, 3.433393, 1, 1, 1, 1, 1,
0.4113563, 1.14867, -0.7594632, 1, 1, 1, 1, 1,
0.4116196, 0.648267, 0.2116227, 1, 1, 1, 1, 1,
0.4137423, -1.50864, 1.866802, 1, 1, 1, 1, 1,
0.4143152, -1.464659, 3.712745, 1, 1, 1, 1, 1,
0.4191201, 0.8373301, 1.099162, 1, 1, 1, 1, 1,
0.4231528, -0.05103917, 0.9458867, 1, 1, 1, 1, 1,
0.4240213, -0.9485506, 2.798009, 1, 1, 1, 1, 1,
0.4249081, -0.4114965, 3.334713, 1, 1, 1, 1, 1,
0.4293645, -0.3221878, 1.42397, 1, 1, 1, 1, 1,
0.4364639, -0.7101215, 2.449072, 1, 1, 1, 1, 1,
0.4377111, 0.8744736, 0.1463443, 1, 1, 1, 1, 1,
0.4377683, 2.454386, -0.3109385, 0, 0, 1, 1, 1,
0.4452385, -0.5051638, 2.10951, 1, 0, 0, 1, 1,
0.4501627, 0.2825038, 0.6645049, 1, 0, 0, 1, 1,
0.45355, -1.731367, 1.320276, 1, 0, 0, 1, 1,
0.4544583, -0.2254474, 3.813965, 1, 0, 0, 1, 1,
0.4638151, -0.8102314, 3.184686, 1, 0, 0, 1, 1,
0.4671472, -0.3163265, 3.047853, 0, 0, 0, 1, 1,
0.4695345, -1.736874, 4.072163, 0, 0, 0, 1, 1,
0.4754375, 1.935784, 0.7952235, 0, 0, 0, 1, 1,
0.4783079, 1.162315, 1.318601, 0, 0, 0, 1, 1,
0.4797529, 0.6925903, 0.9710201, 0, 0, 0, 1, 1,
0.4819892, -1.433089, 2.05351, 0, 0, 0, 1, 1,
0.4821596, -0.001019518, 3.580316, 0, 0, 0, 1, 1,
0.4825491, 1.413485, -0.8279989, 1, 1, 1, 1, 1,
0.4847237, -0.04028112, 2.087605, 1, 1, 1, 1, 1,
0.4955739, 0.3039737, -0.1713161, 1, 1, 1, 1, 1,
0.4997174, -0.07137897, 0.1296568, 1, 1, 1, 1, 1,
0.5019979, 1.098397, -0.5413094, 1, 1, 1, 1, 1,
0.5021716, -1.24511, 2.314102, 1, 1, 1, 1, 1,
0.5024418, 1.340527, 0.8087687, 1, 1, 1, 1, 1,
0.5036685, -1.196726, 2.672051, 1, 1, 1, 1, 1,
0.5057658, -2.07934, 1.829814, 1, 1, 1, 1, 1,
0.5103124, -1.243129, 3.319487, 1, 1, 1, 1, 1,
0.5156314, 0.8346744, 0.8145821, 1, 1, 1, 1, 1,
0.521894, 0.7235404, 0.8698883, 1, 1, 1, 1, 1,
0.5221571, 1.175653, 0.9814349, 1, 1, 1, 1, 1,
0.524363, 1.032988, -0.1940089, 1, 1, 1, 1, 1,
0.5283009, 0.02035076, 0.860722, 1, 1, 1, 1, 1,
0.5309001, 0.6365818, 1.31572, 0, 0, 1, 1, 1,
0.5345805, 0.3364618, 2.041837, 1, 0, 0, 1, 1,
0.5355151, 0.978888, 0.0224303, 1, 0, 0, 1, 1,
0.535897, -0.7292717, 1.940755, 1, 0, 0, 1, 1,
0.5396662, 1.070017, 0.7744173, 1, 0, 0, 1, 1,
0.5462362, -2.39954, 3.191168, 1, 0, 0, 1, 1,
0.5498725, 0.5424387, 2.045065, 0, 0, 0, 1, 1,
0.5541515, -1.892683, 2.2427, 0, 0, 0, 1, 1,
0.5552139, -0.1258018, 2.306251, 0, 0, 0, 1, 1,
0.5580697, -0.00652585, 0.7212288, 0, 0, 0, 1, 1,
0.5586103, 1.570427, 1.662405, 0, 0, 0, 1, 1,
0.5613235, -1.824918, 3.914309, 0, 0, 0, 1, 1,
0.5628014, -1.525142, 2.389589, 0, 0, 0, 1, 1,
0.5636883, 1.381644, -0.7107068, 1, 1, 1, 1, 1,
0.5639746, 0.07679251, 2.135715, 1, 1, 1, 1, 1,
0.5664518, 1.295778, 1.031886, 1, 1, 1, 1, 1,
0.5717878, 0.8264805, 0.6671113, 1, 1, 1, 1, 1,
0.5747846, 0.2101101, 0.699604, 1, 1, 1, 1, 1,
0.5791752, -0.3543602, 1.786338, 1, 1, 1, 1, 1,
0.5797822, 0.8657004, 1.362761, 1, 1, 1, 1, 1,
0.5847969, 0.6744013, 0.1092011, 1, 1, 1, 1, 1,
0.5873693, -1.651181, 2.638961, 1, 1, 1, 1, 1,
0.588502, -1.49693, 2.463817, 1, 1, 1, 1, 1,
0.5886798, 0.7389324, -1.666094, 1, 1, 1, 1, 1,
0.5921619, -0.7400114, 2.452624, 1, 1, 1, 1, 1,
0.5925696, -1.533068, 3.1214, 1, 1, 1, 1, 1,
0.5945509, 0.1724082, 2.425034, 1, 1, 1, 1, 1,
0.6162241, 1.100346, -0.6608881, 1, 1, 1, 1, 1,
0.6186149, -0.7502298, 2.770707, 0, 0, 1, 1, 1,
0.6195198, 0.2342099, 1.111607, 1, 0, 0, 1, 1,
0.6228422, 1.641116, -0.3435365, 1, 0, 0, 1, 1,
0.6319873, -0.5172538, 2.509391, 1, 0, 0, 1, 1,
0.6321271, 0.3779882, -0.9120054, 1, 0, 0, 1, 1,
0.6330985, -0.001403553, 4.681936, 1, 0, 0, 1, 1,
0.6374734, 0.02717345, 0.566815, 0, 0, 0, 1, 1,
0.6412655, 0.2589757, 1.080276, 0, 0, 0, 1, 1,
0.6456565, -0.901147, 3.145559, 0, 0, 0, 1, 1,
0.6518379, 1.475338, 0.8982894, 0, 0, 0, 1, 1,
0.6537579, -1.073795, 2.505174, 0, 0, 0, 1, 1,
0.6573489, -0.8607947, 2.512795, 0, 0, 0, 1, 1,
0.6583579, -0.3268328, 3.301194, 0, 0, 0, 1, 1,
0.6663765, 0.03439136, 1.553955, 1, 1, 1, 1, 1,
0.6695952, -1.230255, 1.947622, 1, 1, 1, 1, 1,
0.6699562, -1.265357, 2.163259, 1, 1, 1, 1, 1,
0.6709397, -1.513293, 2.886653, 1, 1, 1, 1, 1,
0.6721378, -0.8930747, 4.342857, 1, 1, 1, 1, 1,
0.6724012, 1.153782, -0.5964605, 1, 1, 1, 1, 1,
0.676452, -1.375626, 3.112901, 1, 1, 1, 1, 1,
0.6779394, 1.731272, 0.373927, 1, 1, 1, 1, 1,
0.6822788, -1.8454, 3.267816, 1, 1, 1, 1, 1,
0.6835606, -1.24504, 3.959952, 1, 1, 1, 1, 1,
0.6842615, 0.1192148, 1.052107, 1, 1, 1, 1, 1,
0.6882111, 1.325621, 2.188629, 1, 1, 1, 1, 1,
0.6882964, -0.1850814, 2.071919, 1, 1, 1, 1, 1,
0.6989774, -0.1084073, 3.13705, 1, 1, 1, 1, 1,
0.6990489, 0.2822222, 1.267948, 1, 1, 1, 1, 1,
0.6996904, 2.547965, 0.9952129, 0, 0, 1, 1, 1,
0.7026817, -1.544074, 2.284695, 1, 0, 0, 1, 1,
0.7043179, -0.294851, 2.501727, 1, 0, 0, 1, 1,
0.7052752, 0.6191131, 0.7956465, 1, 0, 0, 1, 1,
0.7067711, -1.406149, 3.944103, 1, 0, 0, 1, 1,
0.7073738, 0.5993604, 1.661426, 1, 0, 0, 1, 1,
0.7109817, -0.4724984, 2.485831, 0, 0, 0, 1, 1,
0.711875, 0.7729295, 0.9569504, 0, 0, 0, 1, 1,
0.7122471, -2.04204, 1.306102, 0, 0, 0, 1, 1,
0.7177364, -0.2905693, 2.015337, 0, 0, 0, 1, 1,
0.7179938, -0.6689957, 2.273181, 0, 0, 0, 1, 1,
0.7224129, -0.8960407, 3.238917, 0, 0, 0, 1, 1,
0.7244058, -1.612134, 2.426084, 0, 0, 0, 1, 1,
0.7253826, 1.108563, -1.570203, 1, 1, 1, 1, 1,
0.7255488, 0.4824886, 3.402714, 1, 1, 1, 1, 1,
0.7284158, -1.220233, 2.590836, 1, 1, 1, 1, 1,
0.7298098, 0.9485853, 1.960786, 1, 1, 1, 1, 1,
0.7372023, 0.4043482, 0.7135651, 1, 1, 1, 1, 1,
0.7410226, 1.877655, 0.6151198, 1, 1, 1, 1, 1,
0.7432868, -0.902848, 2.435125, 1, 1, 1, 1, 1,
0.744742, 0.136905, 0.2245908, 1, 1, 1, 1, 1,
0.7449656, 0.4365953, 1.360225, 1, 1, 1, 1, 1,
0.7454055, 2.047779, 1.404389, 1, 1, 1, 1, 1,
0.7455254, -0.5885054, 1.708391, 1, 1, 1, 1, 1,
0.7457414, -0.2395538, 1.447242, 1, 1, 1, 1, 1,
0.7490733, -1.80081, 5.041031, 1, 1, 1, 1, 1,
0.7538085, -0.5610673, 1.347884, 1, 1, 1, 1, 1,
0.7610556, -0.7163386, 4.569896, 1, 1, 1, 1, 1,
0.7627155, -0.9627026, 3.399247, 0, 0, 1, 1, 1,
0.7724837, 0.9813871, -0.9987205, 1, 0, 0, 1, 1,
0.7725745, 0.3945671, 0.8440346, 1, 0, 0, 1, 1,
0.7762373, -1.631213, 4.106986, 1, 0, 0, 1, 1,
0.7777116, 0.0196542, 2.355681, 1, 0, 0, 1, 1,
0.7790349, 0.2969277, 1.379805, 1, 0, 0, 1, 1,
0.7841358, 0.2827482, 0.2176633, 0, 0, 0, 1, 1,
0.788721, 0.4134918, 1.167045, 0, 0, 0, 1, 1,
0.7893423, -0.2635732, 3.16309, 0, 0, 0, 1, 1,
0.7919173, 1.001179, 1.352351, 0, 0, 0, 1, 1,
0.7925383, 0.2524554, 1.201848, 0, 0, 0, 1, 1,
0.7955866, 1.737735, 2.034271, 0, 0, 0, 1, 1,
0.8002124, -0.8513795, 2.594452, 0, 0, 0, 1, 1,
0.8131878, 0.9306105, 1.783982, 1, 1, 1, 1, 1,
0.8198798, -0.3997911, 1.886896, 1, 1, 1, 1, 1,
0.8199518, 1.294879, 1.457455, 1, 1, 1, 1, 1,
0.8201736, 0.8089219, 1.154768, 1, 1, 1, 1, 1,
0.8251724, -0.7542239, 2.873977, 1, 1, 1, 1, 1,
0.8279846, 1.000238, 1.334974, 1, 1, 1, 1, 1,
0.8280133, 0.3354533, 1.438259, 1, 1, 1, 1, 1,
0.8303447, 0.424231, -1.293248, 1, 1, 1, 1, 1,
0.8327287, 1.006005, -0.3111875, 1, 1, 1, 1, 1,
0.8332043, -1.880931, 3.423803, 1, 1, 1, 1, 1,
0.83723, 0.1071256, 2.299808, 1, 1, 1, 1, 1,
0.8376345, 0.6628842, -0.07635504, 1, 1, 1, 1, 1,
0.8383599, 1.426355, 1.823287, 1, 1, 1, 1, 1,
0.8385265, 0.6147459, 0.3679531, 1, 1, 1, 1, 1,
0.8428283, -0.2113837, 1.852202, 1, 1, 1, 1, 1,
0.8524299, 1.879654, -0.3402166, 0, 0, 1, 1, 1,
0.8579112, -0.4473059, 2.821749, 1, 0, 0, 1, 1,
0.8586534, 0.0829473, 1.797037, 1, 0, 0, 1, 1,
0.8592291, -0.6336568, 2.53889, 1, 0, 0, 1, 1,
0.8606128, 0.04573396, 1.774934, 1, 0, 0, 1, 1,
0.8619475, -0.4820673, 0.6899475, 1, 0, 0, 1, 1,
0.8619897, 0.978501, 0.6302376, 0, 0, 0, 1, 1,
0.8622917, -0.5042319, -0.5845808, 0, 0, 0, 1, 1,
0.8632751, -0.7584185, 4.239068, 0, 0, 0, 1, 1,
0.8723837, -0.1004955, 0.6799852, 0, 0, 0, 1, 1,
0.8726432, 1.69478, 0.397703, 0, 0, 0, 1, 1,
0.8786247, 0.4209011, 2.961866, 0, 0, 0, 1, 1,
0.8842204, 0.1400501, 0.7821282, 0, 0, 0, 1, 1,
0.8854102, -0.24443, 2.905914, 1, 1, 1, 1, 1,
0.8887845, -1.752766, 3.079298, 1, 1, 1, 1, 1,
0.8895063, -0.2901352, 1.047379, 1, 1, 1, 1, 1,
0.8928043, -0.1238779, 2.687582, 1, 1, 1, 1, 1,
0.8975745, 1.028976, 0.6416444, 1, 1, 1, 1, 1,
0.8997918, 0.4782152, 0.9599679, 1, 1, 1, 1, 1,
0.901266, -0.5652476, 2.530438, 1, 1, 1, 1, 1,
0.902282, 0.634786, 0.4478893, 1, 1, 1, 1, 1,
0.9045654, 0.4832246, 0.1021478, 1, 1, 1, 1, 1,
0.9057875, 0.05182219, 2.479299, 1, 1, 1, 1, 1,
0.9096267, -1.125666, 3.386007, 1, 1, 1, 1, 1,
0.9146746, 0.2969984, 0.878642, 1, 1, 1, 1, 1,
0.9156014, -0.3273888, 2.730219, 1, 1, 1, 1, 1,
0.9229777, 0.02208176, 0.2582938, 1, 1, 1, 1, 1,
0.9320816, 0.7105484, 4.441121, 1, 1, 1, 1, 1,
0.9339119, -0.1250547, 4.22487, 0, 0, 1, 1, 1,
0.9381769, 0.2872002, 1.195605, 1, 0, 0, 1, 1,
0.9384729, -0.0694209, 0.07556569, 1, 0, 0, 1, 1,
0.9393839, -0.1372961, 1.284502, 1, 0, 0, 1, 1,
0.9396492, 0.1867234, 3.641727, 1, 0, 0, 1, 1,
0.9440048, 1.085271, -0.3192201, 1, 0, 0, 1, 1,
0.9450315, -1.220169, 2.938205, 0, 0, 0, 1, 1,
0.9461707, 1.30921, 0.04929441, 0, 0, 0, 1, 1,
0.9543152, 0.06348535, 4.014682, 0, 0, 0, 1, 1,
0.956546, 0.1941637, 3.855813, 0, 0, 0, 1, 1,
0.9572464, -0.7334362, 1.411765, 0, 0, 0, 1, 1,
0.9590419, -0.9428363, 1.92893, 0, 0, 0, 1, 1,
0.9885603, 1.94343, -0.5582003, 0, 0, 0, 1, 1,
0.989417, -0.5893964, 1.455502, 1, 1, 1, 1, 1,
0.989713, 0.03825843, -0.5358655, 1, 1, 1, 1, 1,
0.9929907, 0.650847, 0.611614, 1, 1, 1, 1, 1,
0.9943858, -0.7537526, 1.555879, 1, 1, 1, 1, 1,
1.010304, -0.1044115, 0.845706, 1, 1, 1, 1, 1,
1.011414, -0.9415068, 2.280603, 1, 1, 1, 1, 1,
1.025162, -0.3819145, 3.630646, 1, 1, 1, 1, 1,
1.025749, -0.5512578, 3.482812, 1, 1, 1, 1, 1,
1.026577, -0.8804538, 1.196376, 1, 1, 1, 1, 1,
1.028935, 1.097467, 0.7814779, 1, 1, 1, 1, 1,
1.031235, 1.207401, 2.411872, 1, 1, 1, 1, 1,
1.036162, -0.3797581, -0.1681035, 1, 1, 1, 1, 1,
1.037434, 0.442911, 2.249071, 1, 1, 1, 1, 1,
1.039848, -0.9296026, 2.369979, 1, 1, 1, 1, 1,
1.052441, 0.6016627, 1.611472, 1, 1, 1, 1, 1,
1.056847, -2.148517, 1.449089, 0, 0, 1, 1, 1,
1.068406, -0.5822678, 3.415986, 1, 0, 0, 1, 1,
1.071044, -0.1634469, 0.03409369, 1, 0, 0, 1, 1,
1.075526, -0.1181252, 1.01879, 1, 0, 0, 1, 1,
1.083886, -0.2622254, 1.389994, 1, 0, 0, 1, 1,
1.135061, 1.418976, -1.294771, 1, 0, 0, 1, 1,
1.15697, -0.8014053, 3.300001, 0, 0, 0, 1, 1,
1.160429, 0.646684, 2.929181, 0, 0, 0, 1, 1,
1.170044, -0.9365531, 2.051019, 0, 0, 0, 1, 1,
1.170552, 1.458643, 0.1197558, 0, 0, 0, 1, 1,
1.190533, -0.7188933, 1.670058, 0, 0, 0, 1, 1,
1.198324, 0.05164028, 2.336497, 0, 0, 0, 1, 1,
1.201472, -0.6176655, 3.458144, 0, 0, 0, 1, 1,
1.206643, 0.7892739, 2.435116, 1, 1, 1, 1, 1,
1.210086, 0.08842251, 0.2904443, 1, 1, 1, 1, 1,
1.210088, 2.180014, 1.899143, 1, 1, 1, 1, 1,
1.212744, 0.5464889, 2.177958, 1, 1, 1, 1, 1,
1.21812, 0.0001019335, -0.04294772, 1, 1, 1, 1, 1,
1.220672, 0.5539934, 2.674598, 1, 1, 1, 1, 1,
1.223428, -0.3791965, 1.469734, 1, 1, 1, 1, 1,
1.223973, -0.6592253, 1.727468, 1, 1, 1, 1, 1,
1.229126, 1.60165, -1.292237, 1, 1, 1, 1, 1,
1.257844, 0.1011418, 3.321902, 1, 1, 1, 1, 1,
1.269437, 1.64574, -0.4856691, 1, 1, 1, 1, 1,
1.270389, -0.07932308, 2.571908, 1, 1, 1, 1, 1,
1.278326, 0.7464817, 0.2503026, 1, 1, 1, 1, 1,
1.280463, 1.071292, -0.2276467, 1, 1, 1, 1, 1,
1.287319, 0.2841018, 2.238606, 1, 1, 1, 1, 1,
1.304411, 0.01768287, 2.62534, 0, 0, 1, 1, 1,
1.304822, 1.588775, 0.3009178, 1, 0, 0, 1, 1,
1.30811, -2.930733, 4.160885, 1, 0, 0, 1, 1,
1.309343, 2.262563, 1.425135, 1, 0, 0, 1, 1,
1.313198, -0.008927473, 1.714826, 1, 0, 0, 1, 1,
1.318859, -0.7547629, 3.392508, 1, 0, 0, 1, 1,
1.319098, -0.3229666, 3.3372, 0, 0, 0, 1, 1,
1.332482, -0.7041734, 1.607057, 0, 0, 0, 1, 1,
1.335426, -1.333219, 3.255157, 0, 0, 0, 1, 1,
1.342554, 1.266204, 2.432844, 0, 0, 0, 1, 1,
1.349789, -1.601739, 2.808731, 0, 0, 0, 1, 1,
1.354426, 0.5939552, 2.158284, 0, 0, 0, 1, 1,
1.362948, 1.351535, 1.338748, 0, 0, 0, 1, 1,
1.370446, 0.7873526, -1.126132, 1, 1, 1, 1, 1,
1.37926, 1.917751, -1.365703, 1, 1, 1, 1, 1,
1.382895, 1.03051, 1.54303, 1, 1, 1, 1, 1,
1.392327, -0.06701779, 2.463859, 1, 1, 1, 1, 1,
1.402839, -0.1420439, 0.5554578, 1, 1, 1, 1, 1,
1.405813, 1.042589, 0.01169858, 1, 1, 1, 1, 1,
1.405965, -0.983341, 2.062006, 1, 1, 1, 1, 1,
1.407013, 1.64167, 1.892513, 1, 1, 1, 1, 1,
1.411056, -2.072114, 2.578751, 1, 1, 1, 1, 1,
1.411225, -1.772709, 2.935627, 1, 1, 1, 1, 1,
1.41242, -0.1042303, 0.7537799, 1, 1, 1, 1, 1,
1.413908, 0.06213537, 2.527629, 1, 1, 1, 1, 1,
1.420255, -0.8215564, 2.255011, 1, 1, 1, 1, 1,
1.427051, 0.3337483, 2.743389, 1, 1, 1, 1, 1,
1.431632, 0.4172923, 1.961491, 1, 1, 1, 1, 1,
1.441116, 1.254462, 2.618574, 0, 0, 1, 1, 1,
1.443146, 1.366907, -0.8110914, 1, 0, 0, 1, 1,
1.443344, 1.90713, 0.5014696, 1, 0, 0, 1, 1,
1.456726, 1.368315, -0.3492828, 1, 0, 0, 1, 1,
1.462652, 1.895781, -0.01875778, 1, 0, 0, 1, 1,
1.462836, -1.643411, 1.00818, 1, 0, 0, 1, 1,
1.470707, 0.5772329, 1.07734, 0, 0, 0, 1, 1,
1.470955, -0.5744101, 1.553516, 0, 0, 0, 1, 1,
1.503088, 0.1643138, 1.552416, 0, 0, 0, 1, 1,
1.505381, 0.467564, 0.5141643, 0, 0, 0, 1, 1,
1.516607, 0.9340606, 1.585163, 0, 0, 0, 1, 1,
1.536069, 1.491339, 1.589113, 0, 0, 0, 1, 1,
1.547297, -1.91341, 1.906466, 0, 0, 0, 1, 1,
1.547702, 0.5033931, -0.778028, 1, 1, 1, 1, 1,
1.550305, 0.2440183, 2.469029, 1, 1, 1, 1, 1,
1.552585, -0.2814138, 1.684715, 1, 1, 1, 1, 1,
1.560237, -0.5546819, 3.146431, 1, 1, 1, 1, 1,
1.566446, -0.2908402, 1.525094, 1, 1, 1, 1, 1,
1.58663, -0.1699958, 4.81278, 1, 1, 1, 1, 1,
1.587672, 0.2609669, 0.4222787, 1, 1, 1, 1, 1,
1.589392, -0.7416112, 0.6907183, 1, 1, 1, 1, 1,
1.59192, 0.6014987, 0.3592705, 1, 1, 1, 1, 1,
1.594181, 1.945057, -0.2327948, 1, 1, 1, 1, 1,
1.607043, 1.52946, 1.047629, 1, 1, 1, 1, 1,
1.610518, -1.558572, 2.674225, 1, 1, 1, 1, 1,
1.618894, 0.3556437, 0.1587463, 1, 1, 1, 1, 1,
1.650589, 0.9428934, 3.81878, 1, 1, 1, 1, 1,
1.671663, 1.224558, 0.1232982, 1, 1, 1, 1, 1,
1.683636, -1.135878, 2.918571, 0, 0, 1, 1, 1,
1.705665, 0.5459508, 0.7174506, 1, 0, 0, 1, 1,
1.70871, 0.1891547, 1.741771, 1, 0, 0, 1, 1,
1.709478, -0.7018661, 1.018595, 1, 0, 0, 1, 1,
1.730199, -0.497712, 1.079854, 1, 0, 0, 1, 1,
1.731458, -0.2885383, 1.158856, 1, 0, 0, 1, 1,
1.742318, 0.09393542, 0.0363232, 0, 0, 0, 1, 1,
1.763456, 0.4270922, 0.4286995, 0, 0, 0, 1, 1,
1.772328, 0.3046904, 3.499985, 0, 0, 0, 1, 1,
1.774644, -2.433096, 1.692742, 0, 0, 0, 1, 1,
1.775986, -1.18865, 4.331848, 0, 0, 0, 1, 1,
1.778352, 0.5053592, 2.646985, 0, 0, 0, 1, 1,
1.783783, 0.4545786, 1.404925, 0, 0, 0, 1, 1,
1.784778, 0.6392258, 0.838829, 1, 1, 1, 1, 1,
1.789153, 1.898763, -1.423953, 1, 1, 1, 1, 1,
1.79233, 1.43986, -0.4424143, 1, 1, 1, 1, 1,
1.792488, -0.8877152, 1.61025, 1, 1, 1, 1, 1,
1.817362, -0.9005246, 1.682963, 1, 1, 1, 1, 1,
1.821935, -0.6563852, 3.32899, 1, 1, 1, 1, 1,
1.825452, 0.6459627, 1.266954, 1, 1, 1, 1, 1,
1.84138, -0.3931596, -0.06964875, 1, 1, 1, 1, 1,
1.84408, 1.331007, -0.3026542, 1, 1, 1, 1, 1,
1.854952, -0.1924074, 3.127272, 1, 1, 1, 1, 1,
1.908553, -0.3848337, 1.965216, 1, 1, 1, 1, 1,
1.961763, 1.554933, 1.688025, 1, 1, 1, 1, 1,
1.97081, 0.4267144, 1.924738, 1, 1, 1, 1, 1,
1.984922, -1.181305, 1.67208, 1, 1, 1, 1, 1,
2.002546, -0.7427878, -0.3337228, 1, 1, 1, 1, 1,
2.022248, -0.6155497, 2.011358, 0, 0, 1, 1, 1,
2.027662, -0.3942187, 1.488085, 1, 0, 0, 1, 1,
2.033881, -1.050596, 2.64883, 1, 0, 0, 1, 1,
2.08786, -0.508462, 1.33917, 1, 0, 0, 1, 1,
2.11549, 1.216753, 0.9236141, 1, 0, 0, 1, 1,
2.157994, 0.1732881, 1.453339, 1, 0, 0, 1, 1,
2.17791, 0.562296, 0.1364103, 0, 0, 0, 1, 1,
2.21074, -0.9672114, 3.303543, 0, 0, 0, 1, 1,
2.352787, -1.759464, 0.7083958, 0, 0, 0, 1, 1,
2.370646, -0.02551197, 1.27896, 0, 0, 0, 1, 1,
2.418056, 0.2709838, 0.9804174, 0, 0, 0, 1, 1,
2.418866, 0.2402069, 1.981648, 0, 0, 0, 1, 1,
2.421088, 0.2643857, 3.155273, 0, 0, 0, 1, 1,
2.522672, 0.9801674, 1.275129, 1, 1, 1, 1, 1,
2.599731, -0.2867499, 2.303095, 1, 1, 1, 1, 1,
2.642105, -0.5143554, 1.851007, 1, 1, 1, 1, 1,
2.648755, -0.1267886, -0.7029898, 1, 1, 1, 1, 1,
2.994086, 0.6897258, 2.861527, 1, 1, 1, 1, 1,
3.167033, -1.119102, 1.684548, 1, 1, 1, 1, 1,
3.45102, 0.3147674, 1.826282, 1, 1, 1, 1, 1
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
var radius = 9.369229;
var distance = 32.90902;
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
mvMatrix.translate( -0.1844776, -0.08081484, -0.04568624 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.90902);
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