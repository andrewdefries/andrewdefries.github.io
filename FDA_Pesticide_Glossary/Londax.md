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
-3.916114, -0.2425995, 0.2591841, 1, 0, 0, 1,
-3.057737, 1.577455, -0.3730568, 1, 0.007843138, 0, 1,
-2.928944, -0.3849584, 0.4841968, 1, 0.01176471, 0, 1,
-2.910895, -0.1650376, -1.303415, 1, 0.01960784, 0, 1,
-2.856605, -0.5527118, -2.272609, 1, 0.02352941, 0, 1,
-2.852301, 0.03838043, -3.92864, 1, 0.03137255, 0, 1,
-2.60535, 0.5065194, -0.6645992, 1, 0.03529412, 0, 1,
-2.476198, 0.3568519, -0.7166393, 1, 0.04313726, 0, 1,
-2.393693, 0.8427362, -1.017023, 1, 0.04705882, 0, 1,
-2.390259, 0.6376657, -2.001177, 1, 0.05490196, 0, 1,
-2.36145, -0.06470721, -1.208218, 1, 0.05882353, 0, 1,
-2.350397, -1.689982, -3.030233, 1, 0.06666667, 0, 1,
-2.203521, 0.5606692, -1.039005, 1, 0.07058824, 0, 1,
-2.184615, -0.9794964, -2.942177, 1, 0.07843138, 0, 1,
-2.166435, -2.030622, -1.645413, 1, 0.08235294, 0, 1,
-2.115522, -2.846141, -4.022146, 1, 0.09019608, 0, 1,
-2.11262, 1.335352, -1.175753, 1, 0.09411765, 0, 1,
-2.105841, -1.312802, -1.113076, 1, 0.1019608, 0, 1,
-2.066828, 1.529385, -1.891508, 1, 0.1098039, 0, 1,
-2.047075, 1.370737, -0.1766946, 1, 0.1137255, 0, 1,
-1.969322, -1.92289, -2.809624, 1, 0.1215686, 0, 1,
-1.950953, -0.3374041, -1.13262, 1, 0.1254902, 0, 1,
-1.924991, -0.7574431, -2.12821, 1, 0.1333333, 0, 1,
-1.922534, -0.2129537, -2.194197, 1, 0.1372549, 0, 1,
-1.915896, -0.9834216, -1.491837, 1, 0.145098, 0, 1,
-1.91461, 0.4282425, -0.8244147, 1, 0.1490196, 0, 1,
-1.909036, 2.418284, 0.9848332, 1, 0.1568628, 0, 1,
-1.890717, -0.08736237, -2.796541, 1, 0.1607843, 0, 1,
-1.851821, 0.3547522, -1.899994, 1, 0.1686275, 0, 1,
-1.832559, -0.1420282, -0.5353938, 1, 0.172549, 0, 1,
-1.828065, -0.8702923, -1.490062, 1, 0.1803922, 0, 1,
-1.806259, 0.2795999, -0.3230461, 1, 0.1843137, 0, 1,
-1.79345, 0.491747, -0.05563147, 1, 0.1921569, 0, 1,
-1.792994, -0.6364939, -1.673987, 1, 0.1960784, 0, 1,
-1.763234, -0.2467182, -0.8451356, 1, 0.2039216, 0, 1,
-1.760257, -0.5340558, -1.146055, 1, 0.2117647, 0, 1,
-1.759854, 2.110263, -0.8526797, 1, 0.2156863, 0, 1,
-1.74776, -0.1178243, -0.4495413, 1, 0.2235294, 0, 1,
-1.743877, 1.973721, -0.8133345, 1, 0.227451, 0, 1,
-1.741932, 0.7260737, -1.06499, 1, 0.2352941, 0, 1,
-1.722351, 1.451523, -0.7486259, 1, 0.2392157, 0, 1,
-1.719139, 0.7209867, -1.461323, 1, 0.2470588, 0, 1,
-1.711321, -1.646468, -3.835735, 1, 0.2509804, 0, 1,
-1.694991, 0.4700717, -0.1687019, 1, 0.2588235, 0, 1,
-1.66786, 0.1309542, -2.292903, 1, 0.2627451, 0, 1,
-1.656644, 0.7776307, 0.8630523, 1, 0.2705882, 0, 1,
-1.645395, 1.127184, -1.448442, 1, 0.2745098, 0, 1,
-1.630386, -0.9497266, -1.935123, 1, 0.282353, 0, 1,
-1.627222, -0.3687685, -1.761857, 1, 0.2862745, 0, 1,
-1.59981, 2.466172, 0.9264811, 1, 0.2941177, 0, 1,
-1.575721, -0.934344, -1.353739, 1, 0.3019608, 0, 1,
-1.569916, 0.2251614, -2.180622, 1, 0.3058824, 0, 1,
-1.560386, -1.168652, -4.010347, 1, 0.3137255, 0, 1,
-1.556823, -0.006456678, -2.465084, 1, 0.3176471, 0, 1,
-1.540452, 1.024472, -1.39951, 1, 0.3254902, 0, 1,
-1.518367, 0.2669935, -1.66708, 1, 0.3294118, 0, 1,
-1.499702, -1.102525, -2.654798, 1, 0.3372549, 0, 1,
-1.485285, 1.458877, -0.4565943, 1, 0.3411765, 0, 1,
-1.484067, 0.164263, 0.6427419, 1, 0.3490196, 0, 1,
-1.481727, -0.529269, -2.091481, 1, 0.3529412, 0, 1,
-1.478725, 1.60006, -0.152548, 1, 0.3607843, 0, 1,
-1.465328, 0.4549057, -3.286264, 1, 0.3647059, 0, 1,
-1.458524, -1.019727, -2.820804, 1, 0.372549, 0, 1,
-1.456972, -0.2300764, -0.8815184, 1, 0.3764706, 0, 1,
-1.431419, 0.06894611, -2.336866, 1, 0.3843137, 0, 1,
-1.42443, -0.4875587, -0.9731681, 1, 0.3882353, 0, 1,
-1.424256, 0.4081155, -2.177445, 1, 0.3960784, 0, 1,
-1.423954, -0.1659688, -0.5127004, 1, 0.4039216, 0, 1,
-1.423593, -0.9706612, -3.714527, 1, 0.4078431, 0, 1,
-1.422162, 0.4321855, -0.7447648, 1, 0.4156863, 0, 1,
-1.417978, 0.4093743, -0.1891431, 1, 0.4196078, 0, 1,
-1.405455, -0.2114846, -3.259733, 1, 0.427451, 0, 1,
-1.404357, 1.24911, -0.7277868, 1, 0.4313726, 0, 1,
-1.397409, -1.057395, -1.971166, 1, 0.4392157, 0, 1,
-1.396176, -1.285407, -1.156779, 1, 0.4431373, 0, 1,
-1.391942, -0.9696308, -2.071961, 1, 0.4509804, 0, 1,
-1.374744, -0.9737244, -1.69068, 1, 0.454902, 0, 1,
-1.373295, 0.9100586, 1.014722, 1, 0.4627451, 0, 1,
-1.372919, 0.7087733, -0.3991549, 1, 0.4666667, 0, 1,
-1.345299, -0.7981633, -1.720857, 1, 0.4745098, 0, 1,
-1.343318, 2.075761, -0.3506041, 1, 0.4784314, 0, 1,
-1.337118, 1.344871, -1.389372, 1, 0.4862745, 0, 1,
-1.335128, 1.16274, -1.132346, 1, 0.4901961, 0, 1,
-1.333785, -0.15684, -1.875235, 1, 0.4980392, 0, 1,
-1.325464, 0.02567671, -3.839415, 1, 0.5058824, 0, 1,
-1.323249, 1.790272, -1.311374, 1, 0.509804, 0, 1,
-1.309228, -0.09224623, -0.9931324, 1, 0.5176471, 0, 1,
-1.308419, -0.1575365, -1.088973, 1, 0.5215687, 0, 1,
-1.305493, -0.70735, -2.338267, 1, 0.5294118, 0, 1,
-1.300764, -0.6875245, -1.523291, 1, 0.5333334, 0, 1,
-1.296628, 0.5699918, -2.088345, 1, 0.5411765, 0, 1,
-1.294193, -0.6303415, -0.2864392, 1, 0.5450981, 0, 1,
-1.291299, 0.8848137, 0.175957, 1, 0.5529412, 0, 1,
-1.291073, -0.4627036, -2.271822, 1, 0.5568628, 0, 1,
-1.286846, -0.647938, -0.3436284, 1, 0.5647059, 0, 1,
-1.285411, -0.7991425, -2.295557, 1, 0.5686275, 0, 1,
-1.278642, -0.4436384, -0.2702683, 1, 0.5764706, 0, 1,
-1.267999, -0.1673537, -3.17822, 1, 0.5803922, 0, 1,
-1.266993, -0.2540363, -2.60699, 1, 0.5882353, 0, 1,
-1.264476, 1.353808, -0.7892023, 1, 0.5921569, 0, 1,
-1.258347, 0.05399586, -0.01911617, 1, 0.6, 0, 1,
-1.250774, -0.583625, -1.706314, 1, 0.6078432, 0, 1,
-1.248662, -0.6506853, 0.1625108, 1, 0.6117647, 0, 1,
-1.244416, -1.349835, -1.865067, 1, 0.6196079, 0, 1,
-1.240486, 0.2559789, 0.4011559, 1, 0.6235294, 0, 1,
-1.221046, 1.159998, -0.07361303, 1, 0.6313726, 0, 1,
-1.217352, 0.7792705, -0.4934189, 1, 0.6352941, 0, 1,
-1.21001, 2.177855, 0.6255476, 1, 0.6431373, 0, 1,
-1.186447, -1.378345, -2.771414, 1, 0.6470588, 0, 1,
-1.180694, -0.142648, -3.400935, 1, 0.654902, 0, 1,
-1.167421, -0.6029967, -1.053259, 1, 0.6588235, 0, 1,
-1.16735, 0.4309802, -0.4149299, 1, 0.6666667, 0, 1,
-1.16425, -1.024348, -2.870663, 1, 0.6705883, 0, 1,
-1.16414, 0.4785541, -0.4919591, 1, 0.6784314, 0, 1,
-1.162523, 0.4978489, -1.326459, 1, 0.682353, 0, 1,
-1.16079, 0.9023304, 0.5658858, 1, 0.6901961, 0, 1,
-1.152529, 1.317111, -0.4982066, 1, 0.6941177, 0, 1,
-1.128726, -0.6986213, -1.969316, 1, 0.7019608, 0, 1,
-1.126842, -0.7709817, -1.974405, 1, 0.7098039, 0, 1,
-1.126123, 0.9573742, -0.1033012, 1, 0.7137255, 0, 1,
-1.124189, 0.4605618, -1.923185, 1, 0.7215686, 0, 1,
-1.122304, -0.5169556, -3.1389, 1, 0.7254902, 0, 1,
-1.116983, 1.630425, -1.016711, 1, 0.7333333, 0, 1,
-1.116486, -1.14143, -2.176442, 1, 0.7372549, 0, 1,
-1.113729, 0.9973359, -1.777974, 1, 0.7450981, 0, 1,
-1.110247, -0.8866255, -2.42647, 1, 0.7490196, 0, 1,
-1.106229, -1.120618, -0.5929804, 1, 0.7568628, 0, 1,
-1.098293, 0.4751139, -2.7403, 1, 0.7607843, 0, 1,
-1.096586, -0.5173965, -1.772416, 1, 0.7686275, 0, 1,
-1.0956, 0.04997799, 0.9808934, 1, 0.772549, 0, 1,
-1.09269, -0.3310148, -2.490232, 1, 0.7803922, 0, 1,
-1.092181, -0.4854054, -1.013256, 1, 0.7843137, 0, 1,
-1.09121, -0.3871153, -2.418327, 1, 0.7921569, 0, 1,
-1.080387, 1.277686, -1.26852, 1, 0.7960784, 0, 1,
-1.075308, -1.111923, -2.640254, 1, 0.8039216, 0, 1,
-1.07435, -1.476156, -2.840833, 1, 0.8117647, 0, 1,
-1.070404, 2.051923, -0.8844528, 1, 0.8156863, 0, 1,
-1.068091, -0.3478262, -1.318332, 1, 0.8235294, 0, 1,
-1.067184, 0.8672937, 0.2544719, 1, 0.827451, 0, 1,
-1.063903, 0.9409436, -0.7369335, 1, 0.8352941, 0, 1,
-1.055404, 0.9560165, 1.087268, 1, 0.8392157, 0, 1,
-1.051808, 0.1090968, -2.571748, 1, 0.8470588, 0, 1,
-1.051543, 2.110937, -1.050547, 1, 0.8509804, 0, 1,
-1.049781, 0.01347245, -0.8616291, 1, 0.8588235, 0, 1,
-1.047274, -1.871188, -1.691623, 1, 0.8627451, 0, 1,
-1.046978, -1.170919, -2.351421, 1, 0.8705882, 0, 1,
-1.046745, 0.09914904, -2.83262, 1, 0.8745098, 0, 1,
-1.044942, 0.1310723, -0.8424775, 1, 0.8823529, 0, 1,
-1.03849, 0.999112, 1.839404, 1, 0.8862745, 0, 1,
-1.037008, -0.1416232, -0.3709845, 1, 0.8941177, 0, 1,
-1.03494, 0.3166273, -2.256918, 1, 0.8980392, 0, 1,
-1.030935, -0.8673113, -3.309057, 1, 0.9058824, 0, 1,
-1.029552, -0.0114391, -0.8010501, 1, 0.9137255, 0, 1,
-1.022442, -1.012162, -3.469252, 1, 0.9176471, 0, 1,
-1.019472, -0.3918854, -0.8011542, 1, 0.9254902, 0, 1,
-1.010832, 0.8753892, -0.2284206, 1, 0.9294118, 0, 1,
-1.007646, -1.320716, -2.274737, 1, 0.9372549, 0, 1,
-1.001505, 0.1918813, -2.099551, 1, 0.9411765, 0, 1,
-0.9995341, -1.492548, -1.992993, 1, 0.9490196, 0, 1,
-0.9993605, -0.8004141, -1.89513, 1, 0.9529412, 0, 1,
-0.9915329, -0.201485, -3.147593, 1, 0.9607843, 0, 1,
-0.9867157, -0.5386096, -2.650454, 1, 0.9647059, 0, 1,
-0.9853337, 1.764758, -0.1513827, 1, 0.972549, 0, 1,
-0.9845103, -1.210105, -3.507453, 1, 0.9764706, 0, 1,
-0.9806776, -0.474658, -2.017699, 1, 0.9843137, 0, 1,
-0.9744558, 1.441721, -0.1731652, 1, 0.9882353, 0, 1,
-0.9742844, 0.8242221, 0.3279013, 1, 0.9960784, 0, 1,
-0.9727115, 0.1559328, -2.849596, 0.9960784, 1, 0, 1,
-0.9661149, -0.06043247, -1.638939, 0.9921569, 1, 0, 1,
-0.9658833, 3.442956, 0.245608, 0.9843137, 1, 0, 1,
-0.9547942, 0.8382069, -1.889915, 0.9803922, 1, 0, 1,
-0.9501594, -0.9927812, -3.049839, 0.972549, 1, 0, 1,
-0.9478384, -3.047498, -2.426093, 0.9686275, 1, 0, 1,
-0.9469296, 0.4297313, -2.499174, 0.9607843, 1, 0, 1,
-0.9409512, 0.3275178, -4.008845, 0.9568627, 1, 0, 1,
-0.9338513, 0.8173665, -0.6111707, 0.9490196, 1, 0, 1,
-0.9296805, 0.2556474, -0.4795492, 0.945098, 1, 0, 1,
-0.9244705, 1.779545, -0.009634521, 0.9372549, 1, 0, 1,
-0.9118617, 0.8645349, -0.5994121, 0.9333333, 1, 0, 1,
-0.9086809, 0.476174, -1.113544, 0.9254902, 1, 0, 1,
-0.8995368, -1.009097, -2.295255, 0.9215686, 1, 0, 1,
-0.8941879, -1.538994, -2.391536, 0.9137255, 1, 0, 1,
-0.8927016, -0.05647286, -1.387458, 0.9098039, 1, 0, 1,
-0.8870059, -0.3691062, -2.067904, 0.9019608, 1, 0, 1,
-0.8799757, 0.4310732, -0.6454864, 0.8941177, 1, 0, 1,
-0.8734113, 0.9299609, -0.2772358, 0.8901961, 1, 0, 1,
-0.8722118, 0.5232977, -0.6440701, 0.8823529, 1, 0, 1,
-0.8661796, 0.4622313, 0.2911751, 0.8784314, 1, 0, 1,
-0.8599718, 0.6018575, 0.1331557, 0.8705882, 1, 0, 1,
-0.8521003, 0.08405322, 0.201856, 0.8666667, 1, 0, 1,
-0.8507615, 1.031532, -2.807068, 0.8588235, 1, 0, 1,
-0.848468, 0.2581827, -2.006799, 0.854902, 1, 0, 1,
-0.8444241, 0.4469674, -1.804118, 0.8470588, 1, 0, 1,
-0.8442829, 0.9276569, -0.9255294, 0.8431373, 1, 0, 1,
-0.8433528, 0.5833833, -1.092534, 0.8352941, 1, 0, 1,
-0.8426864, 0.1803247, -1.860751, 0.8313726, 1, 0, 1,
-0.8417066, -0.9991311, -3.378682, 0.8235294, 1, 0, 1,
-0.8402526, 1.110496, 0.3924709, 0.8196079, 1, 0, 1,
-0.8385785, -0.2046267, -1.731435, 0.8117647, 1, 0, 1,
-0.8350287, -1.026692, -2.160208, 0.8078431, 1, 0, 1,
-0.8316692, -0.1237816, -0.6055903, 0.8, 1, 0, 1,
-0.8291514, 0.4852133, -1.55602, 0.7921569, 1, 0, 1,
-0.8210647, 0.1777757, -1.478767, 0.7882353, 1, 0, 1,
-0.8161878, 0.009187184, -3.931708, 0.7803922, 1, 0, 1,
-0.8125614, 0.753347, 1.081736, 0.7764706, 1, 0, 1,
-0.8103355, 0.1295786, -0.01649521, 0.7686275, 1, 0, 1,
-0.8100744, 0.04786347, -1.641879, 0.7647059, 1, 0, 1,
-0.8002855, 0.9767752, 0.3149545, 0.7568628, 1, 0, 1,
-0.7862231, 0.294356, -1.879851, 0.7529412, 1, 0, 1,
-0.7859088, 0.800415, -0.7728795, 0.7450981, 1, 0, 1,
-0.7816578, -0.9094807, -0.5464054, 0.7411765, 1, 0, 1,
-0.7706457, -0.03748303, -1.148458, 0.7333333, 1, 0, 1,
-0.7673103, -0.320437, -2.48436, 0.7294118, 1, 0, 1,
-0.7647458, -0.02616132, -2.419457, 0.7215686, 1, 0, 1,
-0.7630096, -1.235123, -1.175321, 0.7176471, 1, 0, 1,
-0.7587472, -1.539709, -2.446875, 0.7098039, 1, 0, 1,
-0.7463176, -0.3275833, -2.331439, 0.7058824, 1, 0, 1,
-0.7440366, -1.897484, -3.203712, 0.6980392, 1, 0, 1,
-0.7439596, -1.295982, -3.842649, 0.6901961, 1, 0, 1,
-0.743838, 0.5196933, -1.537146, 0.6862745, 1, 0, 1,
-0.736172, -0.2393404, -2.908103, 0.6784314, 1, 0, 1,
-0.7313835, 1.402823, 0.2977917, 0.6745098, 1, 0, 1,
-0.7261977, 1.447842, 0.5266128, 0.6666667, 1, 0, 1,
-0.7231711, 0.9449546, -0.9435945, 0.6627451, 1, 0, 1,
-0.7192048, -0.6200605, -2.586767, 0.654902, 1, 0, 1,
-0.7178888, -0.7977082, -3.24376, 0.6509804, 1, 0, 1,
-0.7137901, 1.129001, -1.387853, 0.6431373, 1, 0, 1,
-0.7130199, 0.8197772, -2.042382, 0.6392157, 1, 0, 1,
-0.7081418, -0.9943313, -3.159261, 0.6313726, 1, 0, 1,
-0.7071319, -0.5758992, -1.693429, 0.627451, 1, 0, 1,
-0.7038919, 0.9090695, -1.970775, 0.6196079, 1, 0, 1,
-0.7018169, 0.8270169, -1.106043, 0.6156863, 1, 0, 1,
-0.6970057, -0.5475437, -2.292327, 0.6078432, 1, 0, 1,
-0.6903751, 1.109034, -1.415695, 0.6039216, 1, 0, 1,
-0.6873438, 0.8242068, -0.09766387, 0.5960785, 1, 0, 1,
-0.6847808, 1.575325, -0.4152482, 0.5882353, 1, 0, 1,
-0.6841661, 0.6119173, -3.19106, 0.5843138, 1, 0, 1,
-0.6780874, -0.5945745, -2.202689, 0.5764706, 1, 0, 1,
-0.6767749, 0.5112871, -0.1258521, 0.572549, 1, 0, 1,
-0.6725708, 1.023294, 0.9222732, 0.5647059, 1, 0, 1,
-0.6705442, 1.396568, -0.2175965, 0.5607843, 1, 0, 1,
-0.6661354, -0.3450657, -1.825325, 0.5529412, 1, 0, 1,
-0.666054, -1.198593, -0.7866209, 0.5490196, 1, 0, 1,
-0.6655074, -0.2525994, -1.936633, 0.5411765, 1, 0, 1,
-0.6631554, 1.910129, -1.611134, 0.5372549, 1, 0, 1,
-0.6610092, -1.038433, -2.984036, 0.5294118, 1, 0, 1,
-0.6560301, 0.2365917, 0.05960412, 0.5254902, 1, 0, 1,
-0.6509929, -0.399756, -3.387167, 0.5176471, 1, 0, 1,
-0.6497314, -0.6627168, -2.877763, 0.5137255, 1, 0, 1,
-0.6471835, -1.476659, -2.46285, 0.5058824, 1, 0, 1,
-0.640187, 0.2074661, -0.8237438, 0.5019608, 1, 0, 1,
-0.6395943, -1.63096, -2.014184, 0.4941176, 1, 0, 1,
-0.6387299, 0.4571549, -1.391041, 0.4862745, 1, 0, 1,
-0.6374895, -0.2696685, -0.3811837, 0.4823529, 1, 0, 1,
-0.6348912, -0.05213929, -1.628374, 0.4745098, 1, 0, 1,
-0.6342463, -2.11637, -3.492235, 0.4705882, 1, 0, 1,
-0.6255742, -0.9794034, -2.835075, 0.4627451, 1, 0, 1,
-0.6248131, -0.2677907, -3.304153, 0.4588235, 1, 0, 1,
-0.617341, 1.015596, -1.282199, 0.4509804, 1, 0, 1,
-0.6140544, -0.812328, -2.222416, 0.4470588, 1, 0, 1,
-0.6119464, 0.4536697, -0.505913, 0.4392157, 1, 0, 1,
-0.6080307, 0.3094474, -1.152411, 0.4352941, 1, 0, 1,
-0.6074288, -0.5258942, -1.638263, 0.427451, 1, 0, 1,
-0.606822, -1.071882, -2.73925, 0.4235294, 1, 0, 1,
-0.6055732, -0.0357397, -1.890804, 0.4156863, 1, 0, 1,
-0.6037913, -1.143587, -2.725221, 0.4117647, 1, 0, 1,
-0.6026397, -0.2690147, -2.989824, 0.4039216, 1, 0, 1,
-0.6013749, -0.4746324, -2.810464, 0.3960784, 1, 0, 1,
-0.6013707, -0.175646, -2.70989, 0.3921569, 1, 0, 1,
-0.5949146, -0.06492645, -1.536224, 0.3843137, 1, 0, 1,
-0.5942445, 0.8859193, -1.398157, 0.3803922, 1, 0, 1,
-0.5939867, -0.7628462, -2.049352, 0.372549, 1, 0, 1,
-0.5912148, -2.419497, -3.63667, 0.3686275, 1, 0, 1,
-0.5874113, -0.3104777, -1.983446, 0.3607843, 1, 0, 1,
-0.5872558, -0.388211, -2.478143, 0.3568628, 1, 0, 1,
-0.5841069, 0.8638344, 1.060206, 0.3490196, 1, 0, 1,
-0.5834746, 1.193324, -0.4253802, 0.345098, 1, 0, 1,
-0.5829521, -0.1494041, -4.475715, 0.3372549, 1, 0, 1,
-0.5731596, -0.7955052, -3.21823, 0.3333333, 1, 0, 1,
-0.5724293, -0.6495068, -1.046303, 0.3254902, 1, 0, 1,
-0.5700144, 0.2865755, 0.3124446, 0.3215686, 1, 0, 1,
-0.5691044, 0.1513897, -1.594376, 0.3137255, 1, 0, 1,
-0.5687166, -1.997325, -3.230624, 0.3098039, 1, 0, 1,
-0.5656898, -0.902556, -2.712188, 0.3019608, 1, 0, 1,
-0.5631862, 1.281724, 0.06700818, 0.2941177, 1, 0, 1,
-0.562906, -1.518616, -3.275806, 0.2901961, 1, 0, 1,
-0.5593596, -0.4471893, -2.199774, 0.282353, 1, 0, 1,
-0.5467641, -0.04755765, -0.2475094, 0.2784314, 1, 0, 1,
-0.5403782, -1.710533, -3.582513, 0.2705882, 1, 0, 1,
-0.5382817, 0.05087741, -2.101053, 0.2666667, 1, 0, 1,
-0.5349574, 0.5704008, 0.07989832, 0.2588235, 1, 0, 1,
-0.5336106, -0.02933496, -3.349713, 0.254902, 1, 0, 1,
-0.53272, -0.1754166, -0.3794554, 0.2470588, 1, 0, 1,
-0.5292445, 0.2159908, -1.332117, 0.2431373, 1, 0, 1,
-0.5291595, 0.8518129, 1.099373, 0.2352941, 1, 0, 1,
-0.528284, -0.6726609, -2.827661, 0.2313726, 1, 0, 1,
-0.5261699, -1.171263, -4.860442, 0.2235294, 1, 0, 1,
-0.5217881, 0.721394, 0.8967807, 0.2196078, 1, 0, 1,
-0.5207294, 1.685567, -0.9794695, 0.2117647, 1, 0, 1,
-0.5190122, -0.1795212, -2.125712, 0.2078431, 1, 0, 1,
-0.5179667, 0.3691521, -0.3290229, 0.2, 1, 0, 1,
-0.5144773, 1.747425, -1.831231, 0.1921569, 1, 0, 1,
-0.5058068, 0.3416478, -2.224951, 0.1882353, 1, 0, 1,
-0.504416, 0.09532459, -2.178665, 0.1803922, 1, 0, 1,
-0.5041788, -0.5390967, -0.04094144, 0.1764706, 1, 0, 1,
-0.5022304, -1.074713, -3.790836, 0.1686275, 1, 0, 1,
-0.4992827, -0.5223438, -1.102618, 0.1647059, 1, 0, 1,
-0.4938037, -1.13583, -1.913302, 0.1568628, 1, 0, 1,
-0.4936917, 0.6310916, -3.184724, 0.1529412, 1, 0, 1,
-0.492343, 0.338265, -1.085093, 0.145098, 1, 0, 1,
-0.4903069, 0.990109, 0.3932768, 0.1411765, 1, 0, 1,
-0.4885669, -0.4263225, -2.336206, 0.1333333, 1, 0, 1,
-0.4860384, 1.393226, -1.360512, 0.1294118, 1, 0, 1,
-0.4847051, -0.981342, -0.4958647, 0.1215686, 1, 0, 1,
-0.4841913, -0.3545218, -3.638134, 0.1176471, 1, 0, 1,
-0.4831468, -0.5947095, -1.991211, 0.1098039, 1, 0, 1,
-0.4818048, -0.9383044, -2.86734, 0.1058824, 1, 0, 1,
-0.4801572, -1.007614, -3.561066, 0.09803922, 1, 0, 1,
-0.4703911, 1.811886, -0.08428317, 0.09019608, 1, 0, 1,
-0.4681286, -0.9308325, -1.821037, 0.08627451, 1, 0, 1,
-0.4679386, 1.678216, 0.6043212, 0.07843138, 1, 0, 1,
-0.4675163, -0.6195735, -4.238251, 0.07450981, 1, 0, 1,
-0.4651175, 0.1569366, -2.001302, 0.06666667, 1, 0, 1,
-0.4610072, -0.3278326, -1.143037, 0.0627451, 1, 0, 1,
-0.4594616, -0.4256005, -1.438154, 0.05490196, 1, 0, 1,
-0.4577254, 1.885931, -1.998084, 0.05098039, 1, 0, 1,
-0.4530607, 0.3150025, -0.6034572, 0.04313726, 1, 0, 1,
-0.4518664, -0.7064808, -2.843649, 0.03921569, 1, 0, 1,
-0.4493501, -0.1905555, -1.1418, 0.03137255, 1, 0, 1,
-0.4466242, -0.5448071, -2.383754, 0.02745098, 1, 0, 1,
-0.4461681, -0.9907941, -0.3985956, 0.01960784, 1, 0, 1,
-0.4442248, 1.820235, -0.3173176, 0.01568628, 1, 0, 1,
-0.4416468, 0.1987656, -0.588016, 0.007843138, 1, 0, 1,
-0.4393664, 1.417986, -0.4400838, 0.003921569, 1, 0, 1,
-0.4386916, -2.173724, -2.068141, 0, 1, 0.003921569, 1,
-0.4384277, 1.746192, -0.1178554, 0, 1, 0.01176471, 1,
-0.4359169, -0.1424938, -1.508929, 0, 1, 0.01568628, 1,
-0.4307952, 1.984939, -2.282185, 0, 1, 0.02352941, 1,
-0.4290526, -0.1087605, -3.366835, 0, 1, 0.02745098, 1,
-0.427025, -0.4434478, -2.494371, 0, 1, 0.03529412, 1,
-0.4269747, -0.008341988, -1.111364, 0, 1, 0.03921569, 1,
-0.4263609, -1.923384, -0.9366214, 0, 1, 0.04705882, 1,
-0.4213474, -1.371459, -2.190428, 0, 1, 0.05098039, 1,
-0.4203708, 0.8079497, 1.796583, 0, 1, 0.05882353, 1,
-0.4196076, 0.1544403, -1.275201, 0, 1, 0.0627451, 1,
-0.4169309, -0.1995889, -1.481732, 0, 1, 0.07058824, 1,
-0.4168174, 0.818947, -2.188056, 0, 1, 0.07450981, 1,
-0.413571, 1.380252, 0.7195924, 0, 1, 0.08235294, 1,
-0.4134918, -1.411495, -3.138526, 0, 1, 0.08627451, 1,
-0.4101006, 1.136649, 1.286975, 0, 1, 0.09411765, 1,
-0.4097517, 2.54738, 0.5568538, 0, 1, 0.1019608, 1,
-0.4089276, -0.262594, -1.296937, 0, 1, 0.1058824, 1,
-0.4080634, -2.072667, -3.37481, 0, 1, 0.1137255, 1,
-0.3977477, -0.3151121, -3.024809, 0, 1, 0.1176471, 1,
-0.3915528, -0.5542387, -2.945583, 0, 1, 0.1254902, 1,
-0.3915438, 1.058535, 0.04118447, 0, 1, 0.1294118, 1,
-0.3908891, 0.03590563, -2.908978, 0, 1, 0.1372549, 1,
-0.3888346, 0.5608659, -1.342636, 0, 1, 0.1411765, 1,
-0.385864, -0.3156789, -2.89615, 0, 1, 0.1490196, 1,
-0.3842592, -1.608578, -3.080366, 0, 1, 0.1529412, 1,
-0.3738218, 1.17191, 0.12075, 0, 1, 0.1607843, 1,
-0.3730701, 0.9438842, -0.2646928, 0, 1, 0.1647059, 1,
-0.3633793, -0.216274, -1.946827, 0, 1, 0.172549, 1,
-0.3622848, 0.5804424, -0.2221086, 0, 1, 0.1764706, 1,
-0.3571909, 0.9695777, -0.8696128, 0, 1, 0.1843137, 1,
-0.3565514, 0.566856, -0.4704461, 0, 1, 0.1882353, 1,
-0.356362, 1.570354, 0.09871761, 0, 1, 0.1960784, 1,
-0.3525386, -1.643625, -3.860818, 0, 1, 0.2039216, 1,
-0.3489359, 0.3227772, -1.18019, 0, 1, 0.2078431, 1,
-0.3435819, 0.5135284, -0.4670056, 0, 1, 0.2156863, 1,
-0.3389473, -1.179972, -2.422726, 0, 1, 0.2196078, 1,
-0.3381846, -0.6415871, -1.932086, 0, 1, 0.227451, 1,
-0.327987, -0.4216218, -0.8568001, 0, 1, 0.2313726, 1,
-0.3229322, 0.3663543, -0.3052463, 0, 1, 0.2392157, 1,
-0.3211792, -0.116234, -2.985486, 0, 1, 0.2431373, 1,
-0.3103604, 0.3143437, -1.91456, 0, 1, 0.2509804, 1,
-0.3094299, 0.4694604, -0.9754136, 0, 1, 0.254902, 1,
-0.3090847, 0.2565429, -0.1991959, 0, 1, 0.2627451, 1,
-0.3071738, -0.8874446, -2.951926, 0, 1, 0.2666667, 1,
-0.2976676, 0.05055513, -0.6605133, 0, 1, 0.2745098, 1,
-0.2959231, 1.171194, -0.3390808, 0, 1, 0.2784314, 1,
-0.2952048, -0.2307869, -1.799582, 0, 1, 0.2862745, 1,
-0.2835085, -2.731563, -2.073343, 0, 1, 0.2901961, 1,
-0.2829224, 1.616457, -1.649261, 0, 1, 0.2980392, 1,
-0.2823816, -0.8946619, -2.336012, 0, 1, 0.3058824, 1,
-0.2815303, 1.018251, 0.1441011, 0, 1, 0.3098039, 1,
-0.2776406, 0.1527323, -2.434456, 0, 1, 0.3176471, 1,
-0.2775739, -0.4374307, -2.34315, 0, 1, 0.3215686, 1,
-0.2771376, -1.621808, -3.08322, 0, 1, 0.3294118, 1,
-0.2742012, 0.2601253, -2.486125, 0, 1, 0.3333333, 1,
-0.2665068, -1.580408, -2.830076, 0, 1, 0.3411765, 1,
-0.2612364, -0.8222253, -3.973396, 0, 1, 0.345098, 1,
-0.2603491, 0.1052875, -1.040821, 0, 1, 0.3529412, 1,
-0.2583304, -0.3904017, -1.256338, 0, 1, 0.3568628, 1,
-0.258074, 0.9907743, -1.582595, 0, 1, 0.3647059, 1,
-0.2560711, 2.230662, -1.225934, 0, 1, 0.3686275, 1,
-0.2512963, 0.9966469, -1.951875, 0, 1, 0.3764706, 1,
-0.2470091, -1.232222, -4.118946, 0, 1, 0.3803922, 1,
-0.2466173, -0.9959151, -3.640878, 0, 1, 0.3882353, 1,
-0.2458532, -1.126574, -3.278599, 0, 1, 0.3921569, 1,
-0.2444474, 0.7390534, 0.7201852, 0, 1, 0.4, 1,
-0.2399167, 0.165807, 1.30287, 0, 1, 0.4078431, 1,
-0.2387802, -0.8092669, -4.353761, 0, 1, 0.4117647, 1,
-0.2363259, 0.4226128, 0.4358763, 0, 1, 0.4196078, 1,
-0.2313349, -0.3699756, -4.958097, 0, 1, 0.4235294, 1,
-0.22887, 1.517653, 0.5388375, 0, 1, 0.4313726, 1,
-0.2271125, 1.186509, -0.6276879, 0, 1, 0.4352941, 1,
-0.2251199, -0.2402719, -1.47235, 0, 1, 0.4431373, 1,
-0.2230604, -0.4380362, -1.805218, 0, 1, 0.4470588, 1,
-0.220539, 0.2406862, -0.1670844, 0, 1, 0.454902, 1,
-0.2141296, -0.3315148, -3.623996, 0, 1, 0.4588235, 1,
-0.2127275, -1.189224, -2.122748, 0, 1, 0.4666667, 1,
-0.2103432, 0.1993236, -1.184925, 0, 1, 0.4705882, 1,
-0.2089138, -0.4348692, -0.9929883, 0, 1, 0.4784314, 1,
-0.2023445, -0.1306833, -1.483965, 0, 1, 0.4823529, 1,
-0.2022555, 1.21559, -0.8919475, 0, 1, 0.4901961, 1,
-0.1991074, 2.003043, 1.609823, 0, 1, 0.4941176, 1,
-0.1950947, 0.7706513, -1.582927, 0, 1, 0.5019608, 1,
-0.1927392, 0.816538, 0.9409643, 0, 1, 0.509804, 1,
-0.1884666, 1.162764, 1.835792, 0, 1, 0.5137255, 1,
-0.1869321, -2.202077, -3.567723, 0, 1, 0.5215687, 1,
-0.1868164, 0.9582949, 0.6308021, 0, 1, 0.5254902, 1,
-0.1843896, 0.2864372, -0.09909823, 0, 1, 0.5333334, 1,
-0.1839658, 0.8391424, -0.0275181, 0, 1, 0.5372549, 1,
-0.1822411, 0.743946, 0.4970216, 0, 1, 0.5450981, 1,
-0.1813659, -0.5263282, -2.331584, 0, 1, 0.5490196, 1,
-0.1786067, 0.7782786, -0.4286446, 0, 1, 0.5568628, 1,
-0.1745384, 1.422904, -1.151568, 0, 1, 0.5607843, 1,
-0.1732286, 2.804806, -1.968261, 0, 1, 0.5686275, 1,
-0.1680713, 0.3560128, -0.1172644, 0, 1, 0.572549, 1,
-0.1613151, 1.528069, 0.2337729, 0, 1, 0.5803922, 1,
-0.1544467, -0.351493, -1.903892, 0, 1, 0.5843138, 1,
-0.1543856, 0.9212794, 0.2840152, 0, 1, 0.5921569, 1,
-0.1512481, 1.79641, 0.88724, 0, 1, 0.5960785, 1,
-0.1486643, 0.7720438, 0.6080698, 0, 1, 0.6039216, 1,
-0.140809, -0.5409913, -3.277229, 0, 1, 0.6117647, 1,
-0.1405033, -1.763549, -2.574186, 0, 1, 0.6156863, 1,
-0.1366674, 1.689284, -0.3237079, 0, 1, 0.6235294, 1,
-0.1355297, -0.1846318, -0.9377978, 0, 1, 0.627451, 1,
-0.1340004, -0.7688501, -0.8175045, 0, 1, 0.6352941, 1,
-0.130089, 1.835668, 0.6619805, 0, 1, 0.6392157, 1,
-0.1274222, -1.222284, -4.076854, 0, 1, 0.6470588, 1,
-0.1271778, 0.1119473, -0.6950312, 0, 1, 0.6509804, 1,
-0.1268531, 0.724371, -1.391897, 0, 1, 0.6588235, 1,
-0.125104, 0.5851027, 1.243584, 0, 1, 0.6627451, 1,
-0.1231574, -0.0887257, -2.619441, 0, 1, 0.6705883, 1,
-0.1201035, 1.709663, -0.1215117, 0, 1, 0.6745098, 1,
-0.1186922, -0.3366593, -4.026998, 0, 1, 0.682353, 1,
-0.1166596, -1.932011, -3.837249, 0, 1, 0.6862745, 1,
-0.1159939, 2.724281, 1.347413, 0, 1, 0.6941177, 1,
-0.1157904, -2.709101, -3.286895, 0, 1, 0.7019608, 1,
-0.1153664, 0.9218612, -0.5107936, 0, 1, 0.7058824, 1,
-0.1143658, 0.5388513, -0.2333235, 0, 1, 0.7137255, 1,
-0.1114994, -0.9838115, -1.298593, 0, 1, 0.7176471, 1,
-0.1111071, -1.224208, -2.747007, 0, 1, 0.7254902, 1,
-0.1056696, -0.1566482, -3.156203, 0, 1, 0.7294118, 1,
-0.1052546, 0.861235, 1.642773, 0, 1, 0.7372549, 1,
-0.1052147, 1.253184, -0.5296098, 0, 1, 0.7411765, 1,
-0.1036233, 0.5715055, 1.441569, 0, 1, 0.7490196, 1,
-0.09700358, -1.235815, -2.125763, 0, 1, 0.7529412, 1,
-0.09675999, 1.399087, -0.3924499, 0, 1, 0.7607843, 1,
-0.09452335, -1.04906, -2.014347, 0, 1, 0.7647059, 1,
-0.09347323, 0.7038718, 0.9451773, 0, 1, 0.772549, 1,
-0.09329256, -0.4377115, -2.639171, 0, 1, 0.7764706, 1,
-0.09314217, -0.9516538, -2.970147, 0, 1, 0.7843137, 1,
-0.08654854, -3.296526, -1.262537, 0, 1, 0.7882353, 1,
-0.08483655, 0.514899, -2.036339, 0, 1, 0.7960784, 1,
-0.08063047, 0.0969784, 0.7260358, 0, 1, 0.8039216, 1,
-0.07809352, -1.438047, -3.448206, 0, 1, 0.8078431, 1,
-0.07699581, -1.140216, -2.096857, 0, 1, 0.8156863, 1,
-0.07055182, 1.046556, -1.881607, 0, 1, 0.8196079, 1,
-0.07022578, -0.6196315, -2.524068, 0, 1, 0.827451, 1,
-0.06857698, -0.2263602, -2.48733, 0, 1, 0.8313726, 1,
-0.06599849, 0.6668475, 0.2457725, 0, 1, 0.8392157, 1,
-0.06127597, 1.054286, 0.9235247, 0, 1, 0.8431373, 1,
-0.06063543, -0.952315, -2.793828, 0, 1, 0.8509804, 1,
-0.05919029, -0.348964, -1.495733, 0, 1, 0.854902, 1,
-0.05863514, -1.837924, -1.632684, 0, 1, 0.8627451, 1,
-0.05851408, -1.673503, -2.687477, 0, 1, 0.8666667, 1,
-0.05728829, -0.2903716, -3.781104, 0, 1, 0.8745098, 1,
-0.05500419, 0.4939508, -1.923143, 0, 1, 0.8784314, 1,
-0.0549301, 0.1729241, -0.134711, 0, 1, 0.8862745, 1,
-0.05449975, 0.3375778, 0.2540096, 0, 1, 0.8901961, 1,
-0.05294132, -2.123954, -3.34855, 0, 1, 0.8980392, 1,
-0.04902688, -1.404066, -3.647108, 0, 1, 0.9058824, 1,
-0.04697959, 0.5131096, 1.515327, 0, 1, 0.9098039, 1,
-0.04188802, 0.506842, -1.826623, 0, 1, 0.9176471, 1,
-0.0371537, 0.3116643, 0.19255, 0, 1, 0.9215686, 1,
-0.03283131, -0.02558379, -3.504473, 0, 1, 0.9294118, 1,
-0.02548915, -1.215214, -4.051301, 0, 1, 0.9333333, 1,
-0.02393701, 0.4639883, -0.3478896, 0, 1, 0.9411765, 1,
-0.02205626, -0.9448378, -3.308847, 0, 1, 0.945098, 1,
-0.0202556, 0.2729874, -0.1590118, 0, 1, 0.9529412, 1,
-0.02004317, -0.403819, -2.614556, 0, 1, 0.9568627, 1,
-0.01753546, -0.1500509, -5.288068, 0, 1, 0.9647059, 1,
-0.01740829, -1.409592, -2.443389, 0, 1, 0.9686275, 1,
-0.01430065, 0.6709358, 0.3347024, 0, 1, 0.9764706, 1,
-0.01110562, -0.1448868, -4.047729, 0, 1, 0.9803922, 1,
-0.01087604, -0.2082937, -4.169472, 0, 1, 0.9882353, 1,
-0.004038836, -0.7110143, -3.383164, 0, 1, 0.9921569, 1,
-0.002414833, -0.1427534, -3.625479, 0, 1, 1, 1,
0.003136359, 1.146127, 0.4297141, 0, 0.9921569, 1, 1,
0.003624342, -1.495442, 3.861992, 0, 0.9882353, 1, 1,
0.01404737, -0.9084831, 2.688521, 0, 0.9803922, 1, 1,
0.01439868, -0.6441951, 2.901513, 0, 0.9764706, 1, 1,
0.01985319, -0.519287, 2.775439, 0, 0.9686275, 1, 1,
0.02323703, -0.1510789, 4.114431, 0, 0.9647059, 1, 1,
0.02614911, -0.1169055, 3.227891, 0, 0.9568627, 1, 1,
0.03011221, -0.651521, 4.284779, 0, 0.9529412, 1, 1,
0.03230018, -1.192918, 3.345048, 0, 0.945098, 1, 1,
0.04116846, 1.555687, 0.0872358, 0, 0.9411765, 1, 1,
0.04275674, 2.409788, -0.3394814, 0, 0.9333333, 1, 1,
0.04555502, 0.7236525, 1.048581, 0, 0.9294118, 1, 1,
0.04975531, -1.250475, 2.82574, 0, 0.9215686, 1, 1,
0.05277698, 1.633884, -1.412405, 0, 0.9176471, 1, 1,
0.05626029, 0.702804, 0.7724576, 0, 0.9098039, 1, 1,
0.06628315, -0.1226104, 3.322276, 0, 0.9058824, 1, 1,
0.06698798, 0.5089192, -0.1928779, 0, 0.8980392, 1, 1,
0.07063407, 2.123771, 1.013505, 0, 0.8901961, 1, 1,
0.07100172, 0.1604172, -0.5851475, 0, 0.8862745, 1, 1,
0.07479402, 1.028059, 1.39182, 0, 0.8784314, 1, 1,
0.07640143, 0.3396305, 0.6147413, 0, 0.8745098, 1, 1,
0.07871047, -0.4836343, 2.463622, 0, 0.8666667, 1, 1,
0.07909186, 1.242481, -0.007889822, 0, 0.8627451, 1, 1,
0.0798217, 0.2214843, 0.6440722, 0, 0.854902, 1, 1,
0.08231059, -1.081635, 3.721409, 0, 0.8509804, 1, 1,
0.0833692, 0.1376075, -0.4924549, 0, 0.8431373, 1, 1,
0.08607144, -0.9838496, 1.670594, 0, 0.8392157, 1, 1,
0.08686703, 0.4213186, -0.4009084, 0, 0.8313726, 1, 1,
0.0914322, -1.86552, 2.009354, 0, 0.827451, 1, 1,
0.09792919, -0.5981408, 3.787587, 0, 0.8196079, 1, 1,
0.09918758, -0.4169161, 3.777758, 0, 0.8156863, 1, 1,
0.1016395, 0.2368575, 1.830541, 0, 0.8078431, 1, 1,
0.1026359, -0.6694914, 3.458259, 0, 0.8039216, 1, 1,
0.1035042, -0.2045863, 1.772136, 0, 0.7960784, 1, 1,
0.1063672, 0.5054025, 1.200417, 0, 0.7882353, 1, 1,
0.1067763, -0.458726, 3.102716, 0, 0.7843137, 1, 1,
0.1072267, -1.298799, 1.432787, 0, 0.7764706, 1, 1,
0.108938, -1.133121, 4.076125, 0, 0.772549, 1, 1,
0.1156691, 0.5419785, -0.3503422, 0, 0.7647059, 1, 1,
0.1189413, 0.5185506, -0.3197756, 0, 0.7607843, 1, 1,
0.1254737, 1.827731, 0.1704182, 0, 0.7529412, 1, 1,
0.126257, 0.008520656, 1.322146, 0, 0.7490196, 1, 1,
0.1276961, -1.833014, 3.113422, 0, 0.7411765, 1, 1,
0.1328744, -0.4452471, 2.224396, 0, 0.7372549, 1, 1,
0.1340319, 0.7153087, -0.3034394, 0, 0.7294118, 1, 1,
0.140727, -0.0205719, 1.4753, 0, 0.7254902, 1, 1,
0.1407289, -1.786912, 3.942975, 0, 0.7176471, 1, 1,
0.1450423, -0.7840455, 1.774192, 0, 0.7137255, 1, 1,
0.1576265, -1.567748, 3.91348, 0, 0.7058824, 1, 1,
0.1664851, 0.255683, 0.1461557, 0, 0.6980392, 1, 1,
0.1665397, -1.034278, 4.909384, 0, 0.6941177, 1, 1,
0.1670498, 1.193103, -0.541098, 0, 0.6862745, 1, 1,
0.169349, 0.5937893, 1.024836, 0, 0.682353, 1, 1,
0.1747278, 1.84695, 1.113337, 0, 0.6745098, 1, 1,
0.1747613, 1.191949, -1.154455, 0, 0.6705883, 1, 1,
0.1768228, -1.712896, 3.111583, 0, 0.6627451, 1, 1,
0.1772556, -0.6042837, 3.299379, 0, 0.6588235, 1, 1,
0.1776592, -0.4851099, 2.212977, 0, 0.6509804, 1, 1,
0.1793614, -0.2195828, 3.69154, 0, 0.6470588, 1, 1,
0.1806601, -0.07926682, 3.184188, 0, 0.6392157, 1, 1,
0.1811145, 1.186966, 0.2162339, 0, 0.6352941, 1, 1,
0.18205, -0.7087383, 3.749525, 0, 0.627451, 1, 1,
0.1842379, 0.2593985, 0.2950023, 0, 0.6235294, 1, 1,
0.1842848, 0.4578183, 1.086877, 0, 0.6156863, 1, 1,
0.184569, -1.573564, 3.291226, 0, 0.6117647, 1, 1,
0.1871995, -0.4460183, 2.506233, 0, 0.6039216, 1, 1,
0.1890975, 1.906024, 0.4336722, 0, 0.5960785, 1, 1,
0.1914057, 0.6326993, -0.2832604, 0, 0.5921569, 1, 1,
0.1970639, 0.00381672, 1.162702, 0, 0.5843138, 1, 1,
0.1980288, 0.4487215, -0.3767498, 0, 0.5803922, 1, 1,
0.2013363, 0.5336532, -1.807686, 0, 0.572549, 1, 1,
0.2063027, 0.329715, 2.024548, 0, 0.5686275, 1, 1,
0.2078075, 0.5061362, -0.1668022, 0, 0.5607843, 1, 1,
0.2105457, -2.270395, 1.457093, 0, 0.5568628, 1, 1,
0.2142191, 0.7041813, -0.3791171, 0, 0.5490196, 1, 1,
0.219392, -1.307042, 3.964885, 0, 0.5450981, 1, 1,
0.2195327, 0.6539804, -0.7990053, 0, 0.5372549, 1, 1,
0.2204462, -1.867937, 4.009312, 0, 0.5333334, 1, 1,
0.2259759, 1.45807, 0.1020913, 0, 0.5254902, 1, 1,
0.2265198, -0.9020378, 4.12452, 0, 0.5215687, 1, 1,
0.2286415, 0.7353857, 0.4521379, 0, 0.5137255, 1, 1,
0.2316946, -1.04366, 3.227808, 0, 0.509804, 1, 1,
0.2340105, 1.001594, -0.1533629, 0, 0.5019608, 1, 1,
0.241321, 0.6553688, 1.190747, 0, 0.4941176, 1, 1,
0.2422735, 0.9682387, 0.2721935, 0, 0.4901961, 1, 1,
0.2435278, 0.1693149, 1.000315, 0, 0.4823529, 1, 1,
0.2483562, -1.482711, 1.934808, 0, 0.4784314, 1, 1,
0.2508334, -0.7751418, 2.96104, 0, 0.4705882, 1, 1,
0.2516579, 0.2026286, 0.4493271, 0, 0.4666667, 1, 1,
0.2531484, -0.7976891, 2.751801, 0, 0.4588235, 1, 1,
0.2544416, 0.2584816, 3.341512, 0, 0.454902, 1, 1,
0.2548009, -1.038924, 2.780586, 0, 0.4470588, 1, 1,
0.2586125, 0.1085135, 2.491983, 0, 0.4431373, 1, 1,
0.2589983, -1.192109, 4.861013, 0, 0.4352941, 1, 1,
0.2626834, -1.118085, 3.97808, 0, 0.4313726, 1, 1,
0.263781, -1.003927, 4.846934, 0, 0.4235294, 1, 1,
0.2637912, 0.5057636, 0.1058124, 0, 0.4196078, 1, 1,
0.265405, -0.1922341, 2.201982, 0, 0.4117647, 1, 1,
0.2659359, -0.4045761, 2.601019, 0, 0.4078431, 1, 1,
0.2719569, 0.2390594, 2.314868, 0, 0.4, 1, 1,
0.276021, 1.106535, -1.037719, 0, 0.3921569, 1, 1,
0.2798821, 1.43229, -1.190715, 0, 0.3882353, 1, 1,
0.2874057, -0.1451019, 2.123396, 0, 0.3803922, 1, 1,
0.2933783, -0.292557, 3.723251, 0, 0.3764706, 1, 1,
0.2992847, -1.546739, 3.348324, 0, 0.3686275, 1, 1,
0.3017699, 1.787929, -0.46997, 0, 0.3647059, 1, 1,
0.3053145, -0.2398165, 3.209187, 0, 0.3568628, 1, 1,
0.3056464, -1.68829, 3.54767, 0, 0.3529412, 1, 1,
0.3096139, 0.7108957, 0.9568511, 0, 0.345098, 1, 1,
0.3102787, -0.7177863, 2.871611, 0, 0.3411765, 1, 1,
0.3135031, 0.1755847, 1.570237, 0, 0.3333333, 1, 1,
0.3159772, 0.6486681, 1.862922, 0, 0.3294118, 1, 1,
0.3194237, -0.05894445, -0.03534122, 0, 0.3215686, 1, 1,
0.3235444, -0.1386168, 1.696726, 0, 0.3176471, 1, 1,
0.3236591, -1.072459, 3.808027, 0, 0.3098039, 1, 1,
0.3247763, -0.7960564, 2.273344, 0, 0.3058824, 1, 1,
0.325645, 1.389207, 1.066456, 0, 0.2980392, 1, 1,
0.3270014, -1.097295, 1.84117, 0, 0.2901961, 1, 1,
0.3314578, -0.5683352, 2.598532, 0, 0.2862745, 1, 1,
0.3321692, 0.4843914, 0.8628721, 0, 0.2784314, 1, 1,
0.3372109, -0.7853608, 4.161413, 0, 0.2745098, 1, 1,
0.3373729, 0.8198566, 0.7862441, 0, 0.2666667, 1, 1,
0.3374324, 0.05737315, 1.11354, 0, 0.2627451, 1, 1,
0.3394671, 0.7458143, 0.2648119, 0, 0.254902, 1, 1,
0.3419589, 0.6603532, 0.8111893, 0, 0.2509804, 1, 1,
0.3461119, -0.433333, 2.68785, 0, 0.2431373, 1, 1,
0.3463243, -1.006872, 2.432175, 0, 0.2392157, 1, 1,
0.3505811, -0.1865326, 2.588458, 0, 0.2313726, 1, 1,
0.3509955, 0.3062914, 0.07946109, 0, 0.227451, 1, 1,
0.3515524, -1.199433, 2.986567, 0, 0.2196078, 1, 1,
0.3515957, -0.1682721, 3.727064, 0, 0.2156863, 1, 1,
0.3565002, 1.815916, -1.189487, 0, 0.2078431, 1, 1,
0.3572715, -1.414216, 2.880486, 0, 0.2039216, 1, 1,
0.3591969, 0.7335053, -1.246057, 0, 0.1960784, 1, 1,
0.3625646, -0.5135462, 2.760548, 0, 0.1882353, 1, 1,
0.3647511, 0.6928315, -0.8218562, 0, 0.1843137, 1, 1,
0.3657464, -0.5360861, 2.928892, 0, 0.1764706, 1, 1,
0.373653, -1.472706, 1.848652, 0, 0.172549, 1, 1,
0.3756063, -0.628548, 3.471646, 0, 0.1647059, 1, 1,
0.3829578, -1.43967, 1.833178, 0, 0.1607843, 1, 1,
0.3914035, 2.150341, 0.6077076, 0, 0.1529412, 1, 1,
0.3928837, 0.2168427, 0.560037, 0, 0.1490196, 1, 1,
0.3934602, -1.897951, 4.075534, 0, 0.1411765, 1, 1,
0.4005838, 0.6881124, -0.1745339, 0, 0.1372549, 1, 1,
0.4008974, -0.5587739, 2.072555, 0, 0.1294118, 1, 1,
0.4023392, -1.847663, 1.681652, 0, 0.1254902, 1, 1,
0.4035327, 1.263709, -0.5053961, 0, 0.1176471, 1, 1,
0.4057662, 0.8459857, -0.7340788, 0, 0.1137255, 1, 1,
0.4061666, 0.2306301, -0.1711467, 0, 0.1058824, 1, 1,
0.4070674, 2.527813, 1.637723, 0, 0.09803922, 1, 1,
0.4079987, -1.537834, 3.566992, 0, 0.09411765, 1, 1,
0.408693, 0.8929359, 0.01179625, 0, 0.08627451, 1, 1,
0.4089374, 1.008022, -0.1247681, 0, 0.08235294, 1, 1,
0.4165453, 1.142341, 0.03586194, 0, 0.07450981, 1, 1,
0.4209674, -0.6595706, 2.306271, 0, 0.07058824, 1, 1,
0.4234577, -0.346778, 3.552601, 0, 0.0627451, 1, 1,
0.4326523, -0.2534316, 0.4774899, 0, 0.05882353, 1, 1,
0.4370175, -0.1860086, 2.533245, 0, 0.05098039, 1, 1,
0.4445055, -1.461459, 2.691044, 0, 0.04705882, 1, 1,
0.445367, -0.1809244, 1.119731, 0, 0.03921569, 1, 1,
0.4475363, -1.725987, 3.278305, 0, 0.03529412, 1, 1,
0.4488112, -1.950129, 2.68232, 0, 0.02745098, 1, 1,
0.4489301, 0.02933085, 1.760691, 0, 0.02352941, 1, 1,
0.4496397, 0.08371016, 1.713924, 0, 0.01568628, 1, 1,
0.4530006, -1.183122, 4.840976, 0, 0.01176471, 1, 1,
0.4536523, 2.588473, 0.7670059, 0, 0.003921569, 1, 1,
0.4550134, -0.5497586, 1.561821, 0.003921569, 0, 1, 1,
0.4550191, 0.3591042, 0.7130139, 0.007843138, 0, 1, 1,
0.4551221, -0.9388232, 1.585485, 0.01568628, 0, 1, 1,
0.4556389, 0.06630269, -1.724106, 0.01960784, 0, 1, 1,
0.4569641, -0.4810425, 1.363842, 0.02745098, 0, 1, 1,
0.4573549, 0.3043883, 0.632852, 0.03137255, 0, 1, 1,
0.4626933, 1.081409, -1.384419, 0.03921569, 0, 1, 1,
0.4716812, -1.279675, 3.145044, 0.04313726, 0, 1, 1,
0.4718422, 0.07568623, 1.729655, 0.05098039, 0, 1, 1,
0.4810224, 1.267564, 1.730021, 0.05490196, 0, 1, 1,
0.4899322, -0.265224, 1.806419, 0.0627451, 0, 1, 1,
0.4916955, -0.0402994, 0.8341852, 0.06666667, 0, 1, 1,
0.4928704, -0.6127523, 3.934939, 0.07450981, 0, 1, 1,
0.4939045, 0.4191012, 0.6742312, 0.07843138, 0, 1, 1,
0.4949004, -1.049803, 1.414922, 0.08627451, 0, 1, 1,
0.4982006, -0.7319812, 2.307071, 0.09019608, 0, 1, 1,
0.49867, 0.250113, 1.894698, 0.09803922, 0, 1, 1,
0.5009155, -0.4137335, 3.577188, 0.1058824, 0, 1, 1,
0.501512, 0.1101553, 1.651237, 0.1098039, 0, 1, 1,
0.504069, -0.03750501, -0.5336617, 0.1176471, 0, 1, 1,
0.511027, -2.726119, 2.187655, 0.1215686, 0, 1, 1,
0.516605, 1.307497, 2.210641, 0.1294118, 0, 1, 1,
0.5170253, 1.584437, -0.4902312, 0.1333333, 0, 1, 1,
0.5175174, -1.228877, 2.998489, 0.1411765, 0, 1, 1,
0.5224239, 0.1612819, -0.6114987, 0.145098, 0, 1, 1,
0.5295697, -0.4429079, 1.052007, 0.1529412, 0, 1, 1,
0.5316706, -1.866291, 2.818101, 0.1568628, 0, 1, 1,
0.5360506, 0.5225251, 1.07315, 0.1647059, 0, 1, 1,
0.5445995, -0.01202106, 2.510911, 0.1686275, 0, 1, 1,
0.5468464, -0.1251776, 2.431356, 0.1764706, 0, 1, 1,
0.5488037, 1.260367, 0.473564, 0.1803922, 0, 1, 1,
0.5497155, -0.7483218, 2.423974, 0.1882353, 0, 1, 1,
0.5503033, -0.7468085, 1.65932, 0.1921569, 0, 1, 1,
0.5509544, 0.6507508, 1.060613, 0.2, 0, 1, 1,
0.5510552, 1.051682, 1.621555, 0.2078431, 0, 1, 1,
0.5533721, -0.01481986, 1.233297, 0.2117647, 0, 1, 1,
0.5622894, 0.1977683, 2.664486, 0.2196078, 0, 1, 1,
0.5626722, 1.839649, -0.9181329, 0.2235294, 0, 1, 1,
0.5636672, -0.06630002, 2.688814, 0.2313726, 0, 1, 1,
0.5641441, -2.406163, 2.001942, 0.2352941, 0, 1, 1,
0.5672309, 0.02291107, 2.364314, 0.2431373, 0, 1, 1,
0.5678531, 0.4175861, 2.065944, 0.2470588, 0, 1, 1,
0.5714002, 1.805644, -0.06406897, 0.254902, 0, 1, 1,
0.5777201, 1.348191, -0.2587608, 0.2588235, 0, 1, 1,
0.5779164, 0.4209239, -0.5022798, 0.2666667, 0, 1, 1,
0.5802938, -0.6077911, 1.795763, 0.2705882, 0, 1, 1,
0.5891597, -0.1376407, 1.2269, 0.2784314, 0, 1, 1,
0.5900141, 0.6616679, 1.263514, 0.282353, 0, 1, 1,
0.6000113, -0.9576127, 2.830551, 0.2901961, 0, 1, 1,
0.602383, -0.0417828, 2.191283, 0.2941177, 0, 1, 1,
0.6088033, -1.775654, 3.832246, 0.3019608, 0, 1, 1,
0.6097825, 0.06903978, 1.632071, 0.3098039, 0, 1, 1,
0.6127944, 0.2242644, 0.4190129, 0.3137255, 0, 1, 1,
0.6131667, 0.4110871, 0.7449484, 0.3215686, 0, 1, 1,
0.6137248, -0.7298636, 2.995556, 0.3254902, 0, 1, 1,
0.613789, -0.05868726, 0.4105971, 0.3333333, 0, 1, 1,
0.6164606, 0.6182861, 1.533248, 0.3372549, 0, 1, 1,
0.617062, 1.468856, 0.5862812, 0.345098, 0, 1, 1,
0.6178398, 0.07856891, 3.214329, 0.3490196, 0, 1, 1,
0.6216937, 2.315492, 0.8590434, 0.3568628, 0, 1, 1,
0.6273934, -2.024062, 2.928698, 0.3607843, 0, 1, 1,
0.6283174, -0.3017898, 2.389526, 0.3686275, 0, 1, 1,
0.6319894, 0.7568431, -0.1089469, 0.372549, 0, 1, 1,
0.6396464, 0.7491547, 2.230018, 0.3803922, 0, 1, 1,
0.6458716, 1.755768, 0.9542717, 0.3843137, 0, 1, 1,
0.6528323, 1.356146, 0.7206504, 0.3921569, 0, 1, 1,
0.658789, -0.5639173, 2.358635, 0.3960784, 0, 1, 1,
0.6592062, -0.007779504, 2.978134, 0.4039216, 0, 1, 1,
0.6594908, 0.1513678, 1.203268, 0.4117647, 0, 1, 1,
0.660349, -1.227443, 1.249082, 0.4156863, 0, 1, 1,
0.6626873, -0.7661299, 0.911508, 0.4235294, 0, 1, 1,
0.6631122, 0.4816334, 0.2912986, 0.427451, 0, 1, 1,
0.6728544, -0.4824255, 2.964013, 0.4352941, 0, 1, 1,
0.6761589, 0.4790892, 0.2132993, 0.4392157, 0, 1, 1,
0.6872124, -1.012821, 2.929632, 0.4470588, 0, 1, 1,
0.6897524, 1.521455, 1.995764, 0.4509804, 0, 1, 1,
0.6897821, 0.001017135, 1.325553, 0.4588235, 0, 1, 1,
0.6976829, 1.583312, -0.7696566, 0.4627451, 0, 1, 1,
0.7037152, 0.8431544, -0.3299031, 0.4705882, 0, 1, 1,
0.7045705, 0.6091986, -0.4086883, 0.4745098, 0, 1, 1,
0.7093938, 1.042867, 1.881235, 0.4823529, 0, 1, 1,
0.7134861, 1.432084, -0.5114673, 0.4862745, 0, 1, 1,
0.7154331, -1.589422, 3.08619, 0.4941176, 0, 1, 1,
0.7235349, -0.2776735, -0.3756099, 0.5019608, 0, 1, 1,
0.7244683, -0.7862345, 3.032713, 0.5058824, 0, 1, 1,
0.725744, 1.097324, 1.728505, 0.5137255, 0, 1, 1,
0.7296274, 1.297029, -0.7143041, 0.5176471, 0, 1, 1,
0.7323573, 0.2775666, -0.2571508, 0.5254902, 0, 1, 1,
0.733287, -0.4588044, 1.468752, 0.5294118, 0, 1, 1,
0.7353582, -0.2011951, 1.391554, 0.5372549, 0, 1, 1,
0.735841, -0.7749267, 2.285257, 0.5411765, 0, 1, 1,
0.7373109, -1.860304, 3.769643, 0.5490196, 0, 1, 1,
0.7383491, 0.03795866, 1.886914, 0.5529412, 0, 1, 1,
0.7402451, 0.7997316, 1.306038, 0.5607843, 0, 1, 1,
0.7412797, -0.3045249, 3.588492, 0.5647059, 0, 1, 1,
0.7440859, 2.021713, 1.15617, 0.572549, 0, 1, 1,
0.7467689, -1.436428, 4.948854, 0.5764706, 0, 1, 1,
0.7473562, -0.5753888, 2.975607, 0.5843138, 0, 1, 1,
0.7476744, -0.1895406, 0.889136, 0.5882353, 0, 1, 1,
0.7506762, -0.2485128, 1.842725, 0.5960785, 0, 1, 1,
0.7534465, 0.7846895, -0.008501857, 0.6039216, 0, 1, 1,
0.7562393, 0.3844608, 0.1977248, 0.6078432, 0, 1, 1,
0.7563371, 0.3194954, 1.689631, 0.6156863, 0, 1, 1,
0.7577648, 0.9295056, -0.1517445, 0.6196079, 0, 1, 1,
0.7581992, -0.8819058, 3.097491, 0.627451, 0, 1, 1,
0.7601526, -0.4579276, 0.8626705, 0.6313726, 0, 1, 1,
0.7629374, -0.3309861, 1.385877, 0.6392157, 0, 1, 1,
0.7816516, -0.3136334, 0.4647003, 0.6431373, 0, 1, 1,
0.7828586, 1.123156, 1.771618, 0.6509804, 0, 1, 1,
0.783325, 1.636734, 0.8153808, 0.654902, 0, 1, 1,
0.784933, 1.150219, -0.711261, 0.6627451, 0, 1, 1,
0.7849557, 0.6874429, 2.032487, 0.6666667, 0, 1, 1,
0.7854351, -0.6112973, 0.4312928, 0.6745098, 0, 1, 1,
0.7855242, 0.2295759, 1.893769, 0.6784314, 0, 1, 1,
0.787771, -0.2958874, 2.200012, 0.6862745, 0, 1, 1,
0.7972775, -1.268974, 1.762254, 0.6901961, 0, 1, 1,
0.8020498, 0.3087979, 0.6497366, 0.6980392, 0, 1, 1,
0.8039533, 0.9274652, 0.7412652, 0.7058824, 0, 1, 1,
0.8081351, -0.6124594, 1.811781, 0.7098039, 0, 1, 1,
0.8106233, -2.760632, 3.959231, 0.7176471, 0, 1, 1,
0.8151576, -0.07009917, 1.16195, 0.7215686, 0, 1, 1,
0.8155715, 0.343996, 2.71382, 0.7294118, 0, 1, 1,
0.8198892, 0.9432063, 1.411851, 0.7333333, 0, 1, 1,
0.8215404, 0.2888366, 2.687274, 0.7411765, 0, 1, 1,
0.8236361, 0.08027604, 0.9303485, 0.7450981, 0, 1, 1,
0.8265862, -0.6179842, 1.768226, 0.7529412, 0, 1, 1,
0.8284501, -0.8313796, 3.762628, 0.7568628, 0, 1, 1,
0.8295943, 0.9385183, 1.027707, 0.7647059, 0, 1, 1,
0.8358425, -1.72112, 2.037126, 0.7686275, 0, 1, 1,
0.8370905, 1.305373, 1.258233, 0.7764706, 0, 1, 1,
0.8404823, -0.04762057, 1.812621, 0.7803922, 0, 1, 1,
0.8426373, 0.4115173, 1.49481, 0.7882353, 0, 1, 1,
0.8471201, 0.03776084, 0.2470803, 0.7921569, 0, 1, 1,
0.8476295, 0.9689214, -0.2669221, 0.8, 0, 1, 1,
0.848936, 2.317374, -0.3188327, 0.8078431, 0, 1, 1,
0.8497931, -0.6518145, 1.704843, 0.8117647, 0, 1, 1,
0.8545414, -1.205515, 1.525205, 0.8196079, 0, 1, 1,
0.8669334, 1.584152, -0.1679824, 0.8235294, 0, 1, 1,
0.8690498, 0.897767, -0.1000935, 0.8313726, 0, 1, 1,
0.890102, -1.620739, 3.710831, 0.8352941, 0, 1, 1,
0.8907773, -0.7761539, 2.848228, 0.8431373, 0, 1, 1,
0.897611, 0.3621802, 1.381691, 0.8470588, 0, 1, 1,
0.9021002, -0.7031485, 2.320539, 0.854902, 0, 1, 1,
0.9022424, 0.5934149, 0.1581452, 0.8588235, 0, 1, 1,
0.9060428, -2.103125, 2.446848, 0.8666667, 0, 1, 1,
0.9071284, 0.1496323, 1.706977, 0.8705882, 0, 1, 1,
0.9127579, 1.062468, 1.291362, 0.8784314, 0, 1, 1,
0.9193342, 2.192034, 2.508552, 0.8823529, 0, 1, 1,
0.9247125, -1.504228, 2.280428, 0.8901961, 0, 1, 1,
0.9286648, 1.065858, -0.3792295, 0.8941177, 0, 1, 1,
0.9317346, 0.09937343, 2.86513, 0.9019608, 0, 1, 1,
0.9350193, 1.16278, -1.002177, 0.9098039, 0, 1, 1,
0.9454985, -1.288463, 2.299578, 0.9137255, 0, 1, 1,
0.9544541, -0.6639935, 0.9928874, 0.9215686, 0, 1, 1,
0.9545793, -0.2538735, 2.182218, 0.9254902, 0, 1, 1,
0.9564061, 0.7013903, 1.977552, 0.9333333, 0, 1, 1,
0.9569088, 0.8313416, 0.6335239, 0.9372549, 0, 1, 1,
0.958375, -1.626532, 4.422059, 0.945098, 0, 1, 1,
0.9625848, -0.5724869, 1.816106, 0.9490196, 0, 1, 1,
0.9675608, -0.230069, 3.456303, 0.9568627, 0, 1, 1,
0.9689232, 1.208431, 1.102278, 0.9607843, 0, 1, 1,
0.970859, -0.0119585, 2.556102, 0.9686275, 0, 1, 1,
0.980375, 0.3847867, 1.847414, 0.972549, 0, 1, 1,
0.986196, 1.208966, 1.251366, 0.9803922, 0, 1, 1,
0.98771, -0.575253, 0.9735816, 0.9843137, 0, 1, 1,
0.9880357, -1.282136, 2.534776, 0.9921569, 0, 1, 1,
0.9908452, 0.7128913, 3.826877, 0.9960784, 0, 1, 1,
0.9960427, -0.8964956, 2.580325, 1, 0, 0.9960784, 1,
0.9970946, -0.8125495, 3.12559, 1, 0, 0.9882353, 1,
1.003147, -1.405604, 1.582122, 1, 0, 0.9843137, 1,
1.003765, 0.05581066, 1.652362, 1, 0, 0.9764706, 1,
1.012137, -0.7931337, 0.521587, 1, 0, 0.972549, 1,
1.013141, 0.1728619, 1.852029, 1, 0, 0.9647059, 1,
1.014959, -2.137199, 2.353943, 1, 0, 0.9607843, 1,
1.01857, 0.772139, 0.3096108, 1, 0, 0.9529412, 1,
1.028463, 2.998824, -1.353147, 1, 0, 0.9490196, 1,
1.034534, 0.9995456, 0.5518104, 1, 0, 0.9411765, 1,
1.042809, -0.3746887, 1.939993, 1, 0, 0.9372549, 1,
1.044987, 1.948579, 0.8770061, 1, 0, 0.9294118, 1,
1.047618, -1.930603, 4.318802, 1, 0, 0.9254902, 1,
1.049656, -0.3944431, 1.999037, 1, 0, 0.9176471, 1,
1.05271, -0.2336492, 1.236711, 1, 0, 0.9137255, 1,
1.057073, 0.8913392, 2.083496, 1, 0, 0.9058824, 1,
1.060697, 1.363577, 0.3974354, 1, 0, 0.9019608, 1,
1.06282, 0.4825106, 1.269386, 1, 0, 0.8941177, 1,
1.06435, 0.2598977, 2.320873, 1, 0, 0.8862745, 1,
1.069675, 0.3208137, 0.6368691, 1, 0, 0.8823529, 1,
1.070009, 1.094094, 1.236076, 1, 0, 0.8745098, 1,
1.07361, 0.1120608, -0.3834423, 1, 0, 0.8705882, 1,
1.074526, 0.8121443, 1.106548, 1, 0, 0.8627451, 1,
1.091894, 0.8436634, -0.3006328, 1, 0, 0.8588235, 1,
1.095478, -0.5183765, 1.12166, 1, 0, 0.8509804, 1,
1.097423, 0.6662567, 1.079818, 1, 0, 0.8470588, 1,
1.100189, 0.6558991, 0.977955, 1, 0, 0.8392157, 1,
1.101046, -0.1987349, 1.133795, 1, 0, 0.8352941, 1,
1.104525, -1.776762, 2.67613, 1, 0, 0.827451, 1,
1.10546, 0.7105958, -0.697743, 1, 0, 0.8235294, 1,
1.107481, 1.68467, 1.380035, 1, 0, 0.8156863, 1,
1.116071, -1.818026, 3.53527, 1, 0, 0.8117647, 1,
1.116085, 0.2437296, 3.07674, 1, 0, 0.8039216, 1,
1.116217, -0.5781615, 2.948049, 1, 0, 0.7960784, 1,
1.117988, -0.8273481, 2.169157, 1, 0, 0.7921569, 1,
1.118411, 0.06834693, 1.809801, 1, 0, 0.7843137, 1,
1.122154, 1.952413, 0.2402854, 1, 0, 0.7803922, 1,
1.124992, 0.6357235, -0.2236224, 1, 0, 0.772549, 1,
1.130576, 0.2829686, 1.97617, 1, 0, 0.7686275, 1,
1.137628, 0.3809776, 0.6127423, 1, 0, 0.7607843, 1,
1.14466, 1.693678, 0.09575199, 1, 0, 0.7568628, 1,
1.145165, -0.4267899, 2.363267, 1, 0, 0.7490196, 1,
1.146474, -2.642228, 4.302385, 1, 0, 0.7450981, 1,
1.150155, 0.6482818, 0.4358831, 1, 0, 0.7372549, 1,
1.151168, 0.6400269, 0.6798458, 1, 0, 0.7333333, 1,
1.154541, 0.1919704, 0.09065091, 1, 0, 0.7254902, 1,
1.154579, -0.919912, 4.081191, 1, 0, 0.7215686, 1,
1.158943, 0.2381273, 0.5900747, 1, 0, 0.7137255, 1,
1.162319, -1.941958, 2.982589, 1, 0, 0.7098039, 1,
1.16442, -1.483192, 1.36044, 1, 0, 0.7019608, 1,
1.164608, -0.2530225, 1.388726, 1, 0, 0.6941177, 1,
1.180864, 1.015547, 0.9133453, 1, 0, 0.6901961, 1,
1.186484, 0.813856, 0.4084489, 1, 0, 0.682353, 1,
1.189234, 0.0277525, -0.1086565, 1, 0, 0.6784314, 1,
1.193346, 0.1334405, 1.654821, 1, 0, 0.6705883, 1,
1.21054, -0.317902, 0.8491875, 1, 0, 0.6666667, 1,
1.214511, 0.9856015, 0.7695258, 1, 0, 0.6588235, 1,
1.216837, 0.04578269, 0.9445933, 1, 0, 0.654902, 1,
1.223813, -0.4889252, 1.757662, 1, 0, 0.6470588, 1,
1.224702, -0.3911522, 2.118468, 1, 0, 0.6431373, 1,
1.227222, -0.7476993, 3.106519, 1, 0, 0.6352941, 1,
1.251281, 0.005346333, 1.699251, 1, 0, 0.6313726, 1,
1.252325, -0.1323059, 0.3432287, 1, 0, 0.6235294, 1,
1.25496, -1.63313, 2.197049, 1, 0, 0.6196079, 1,
1.257323, -0.3085271, 0.9904604, 1, 0, 0.6117647, 1,
1.259364, 2.034757, 0.575919, 1, 0, 0.6078432, 1,
1.263293, -1.789186, 2.809981, 1, 0, 0.6, 1,
1.272481, -0.5846913, 1.177236, 1, 0, 0.5921569, 1,
1.273762, -0.6399126, 2.512076, 1, 0, 0.5882353, 1,
1.282509, -0.4113318, -0.6285771, 1, 0, 0.5803922, 1,
1.293727, -0.3600396, -0.2756025, 1, 0, 0.5764706, 1,
1.298792, -1.470929, 3.162779, 1, 0, 0.5686275, 1,
1.303262, -0.7550868, 2.730356, 1, 0, 0.5647059, 1,
1.306475, 1.772863, 2.480566, 1, 0, 0.5568628, 1,
1.306931, -0.08999138, -0.7638611, 1, 0, 0.5529412, 1,
1.309183, -1.482185, 3.514074, 1, 0, 0.5450981, 1,
1.312823, -0.1839141, 3.298636, 1, 0, 0.5411765, 1,
1.315358, -0.1287279, 0.2724803, 1, 0, 0.5333334, 1,
1.320334, 0.05155307, 1.618343, 1, 0, 0.5294118, 1,
1.325577, -1.322515, 1.16241, 1, 0, 0.5215687, 1,
1.337054, 0.3358319, -0.4382708, 1, 0, 0.5176471, 1,
1.339993, 0.8856055, 0.9397566, 1, 0, 0.509804, 1,
1.35597, 0.4917959, 3.133604, 1, 0, 0.5058824, 1,
1.357682, 0.145366, 2.394164, 1, 0, 0.4980392, 1,
1.365083, -0.5814227, 2.939642, 1, 0, 0.4901961, 1,
1.380704, 0.03128788, 2.379804, 1, 0, 0.4862745, 1,
1.389509, -0.009968469, 1.351719, 1, 0, 0.4784314, 1,
1.391029, -0.2766071, 0.8261267, 1, 0, 0.4745098, 1,
1.39451, -0.4608977, 1.98539, 1, 0, 0.4666667, 1,
1.396969, 0.9987001, 0.9081158, 1, 0, 0.4627451, 1,
1.399111, 0.4239199, 0.7272282, 1, 0, 0.454902, 1,
1.401637, 1.576672, -0.3160048, 1, 0, 0.4509804, 1,
1.40569, 1.360728, 2.41542, 1, 0, 0.4431373, 1,
1.408809, -1.003116, 1.945975, 1, 0, 0.4392157, 1,
1.418108, -0.4013188, 1.65173, 1, 0, 0.4313726, 1,
1.440168, -0.620062, 1.889871, 1, 0, 0.427451, 1,
1.470221, 0.3719502, 2.779327, 1, 0, 0.4196078, 1,
1.50018, -0.7701538, 1.278025, 1, 0, 0.4156863, 1,
1.501345, 0.4965238, 1.105673, 1, 0, 0.4078431, 1,
1.506888, -0.3518114, 1.155284, 1, 0, 0.4039216, 1,
1.506904, -0.1705643, 0.7579066, 1, 0, 0.3960784, 1,
1.527183, -0.4172997, 0.9771349, 1, 0, 0.3882353, 1,
1.562413, 0.7386127, 0.6222206, 1, 0, 0.3843137, 1,
1.573596, 0.817484, 2.095669, 1, 0, 0.3764706, 1,
1.576626, -0.08137091, 0.7423227, 1, 0, 0.372549, 1,
1.588581, 0.8432975, 1.022656, 1, 0, 0.3647059, 1,
1.598483, 0.04170456, -0.5994822, 1, 0, 0.3607843, 1,
1.609732, 1.526975, 0.415924, 1, 0, 0.3529412, 1,
1.627236, 1.752358, 0.965219, 1, 0, 0.3490196, 1,
1.628343, -0.8020759, 1.467075, 1, 0, 0.3411765, 1,
1.636337, -0.1123016, 1.2966, 1, 0, 0.3372549, 1,
1.656288, 1.567967, 0.254395, 1, 0, 0.3294118, 1,
1.65732, 0.3859971, 1.591357, 1, 0, 0.3254902, 1,
1.70502, -1.993193, 1.745255, 1, 0, 0.3176471, 1,
1.708826, 1.069703, -0.8342128, 1, 0, 0.3137255, 1,
1.710423, 2.224336, -0.3833723, 1, 0, 0.3058824, 1,
1.719216, -1.796095, 4.023242, 1, 0, 0.2980392, 1,
1.729933, 0.06824951, 2.939157, 1, 0, 0.2941177, 1,
1.749435, -1.010157, 2.211738, 1, 0, 0.2862745, 1,
1.754244, -0.2330429, 1.836654, 1, 0, 0.282353, 1,
1.754395, 1.128187, 0.9909179, 1, 0, 0.2745098, 1,
1.770009, 1.077418, 0.07765545, 1, 0, 0.2705882, 1,
1.770425, 0.4454887, 0.2565701, 1, 0, 0.2627451, 1,
1.779855, 0.3516377, 1.91458, 1, 0, 0.2588235, 1,
1.781388, -1.27065, 1.077199, 1, 0, 0.2509804, 1,
1.793916, 0.7788808, 1.227275, 1, 0, 0.2470588, 1,
1.801685, -0.4837215, 2.122523, 1, 0, 0.2392157, 1,
1.806513, -0.2740134, -0.1382326, 1, 0, 0.2352941, 1,
1.810218, 0.5418585, 1.664529, 1, 0, 0.227451, 1,
1.835164, -0.06614086, 1.437053, 1, 0, 0.2235294, 1,
1.848447, 0.5331796, -0.4826182, 1, 0, 0.2156863, 1,
1.855684, 0.3987548, 2.120166, 1, 0, 0.2117647, 1,
1.856786, -0.1342392, -0.2456238, 1, 0, 0.2039216, 1,
1.872648, -0.1088987, 0.2175765, 1, 0, 0.1960784, 1,
1.875178, -0.7993976, 1.7379, 1, 0, 0.1921569, 1,
1.878675, 0.8459519, -0.09403112, 1, 0, 0.1843137, 1,
1.886098, -0.5115338, 2.611637, 1, 0, 0.1803922, 1,
1.886119, 0.7499674, 1.087636, 1, 0, 0.172549, 1,
1.893488, 0.08093875, 1.976001, 1, 0, 0.1686275, 1,
1.91652, 1.748528, -0.3233424, 1, 0, 0.1607843, 1,
1.91759, 1.13734, 1.848014, 1, 0, 0.1568628, 1,
1.963214, 0.1146383, 3.094332, 1, 0, 0.1490196, 1,
1.978781, 0.8574775, 2.166092, 1, 0, 0.145098, 1,
1.984717, -0.872117, 1.924279, 1, 0, 0.1372549, 1,
2.055861, -0.08422689, 1.218348, 1, 0, 0.1333333, 1,
2.093436, 0.2359949, 2.350608, 1, 0, 0.1254902, 1,
2.103569, -2.073761, 2.408022, 1, 0, 0.1215686, 1,
2.233552, 0.5757122, 2.033711, 1, 0, 0.1137255, 1,
2.249847, -0.269108, 0.9166664, 1, 0, 0.1098039, 1,
2.269529, -0.6432637, 2.078723, 1, 0, 0.1019608, 1,
2.272362, -2.68335, 2.409453, 1, 0, 0.09411765, 1,
2.277126, -0.6127354, 2.85399, 1, 0, 0.09019608, 1,
2.308829, 0.5022266, 0.488159, 1, 0, 0.08235294, 1,
2.338394, 0.4661964, 1.922243, 1, 0, 0.07843138, 1,
2.362344, -1.241659, 0.2634203, 1, 0, 0.07058824, 1,
2.371305, 0.7901513, 1.23895, 1, 0, 0.06666667, 1,
2.394965, 0.091258, 2.287838, 1, 0, 0.05882353, 1,
2.420006, -0.7596246, 2.612683, 1, 0, 0.05490196, 1,
2.426099, 0.2237459, 0.6383299, 1, 0, 0.04705882, 1,
2.450916, -2.296786, 0.3937794, 1, 0, 0.04313726, 1,
2.538751, 0.418065, 1.182436, 1, 0, 0.03529412, 1,
2.576932, 0.230872, 1.564591, 1, 0, 0.03137255, 1,
2.701825, 1.110804, 1.854097, 1, 0, 0.02352941, 1,
2.702757, 0.7962709, 1.041781, 1, 0, 0.01960784, 1,
2.726207, 0.9274456, 1.29573, 1, 0, 0.01176471, 1,
2.849148, 0.4869254, 2.280211, 1, 0, 0.007843138, 1
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
-0.5334829, -4.438868, -7.023226, 0, -0.5, 0.5, 0.5,
-0.5334829, -4.438868, -7.023226, 1, -0.5, 0.5, 0.5,
-0.5334829, -4.438868, -7.023226, 1, 1.5, 0.5, 0.5,
-0.5334829, -4.438868, -7.023226, 0, 1.5, 0.5, 0.5
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
-5.062826, 0.07321525, -7.023226, 0, -0.5, 0.5, 0.5,
-5.062826, 0.07321525, -7.023226, 1, -0.5, 0.5, 0.5,
-5.062826, 0.07321525, -7.023226, 1, 1.5, 0.5, 0.5,
-5.062826, 0.07321525, -7.023226, 0, 1.5, 0.5, 0.5
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
-5.062826, -4.438868, -0.1696069, 0, -0.5, 0.5, 0.5,
-5.062826, -4.438868, -0.1696069, 1, -0.5, 0.5, 0.5,
-5.062826, -4.438868, -0.1696069, 1, 1.5, 0.5, 0.5,
-5.062826, -4.438868, -0.1696069, 0, 1.5, 0.5, 0.5
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
-3, -3.397618, -5.441622,
2, -3.397618, -5.441622,
-3, -3.397618, -5.441622,
-3, -3.57116, -5.705223,
-2, -3.397618, -5.441622,
-2, -3.57116, -5.705223,
-1, -3.397618, -5.441622,
-1, -3.57116, -5.705223,
0, -3.397618, -5.441622,
0, -3.57116, -5.705223,
1, -3.397618, -5.441622,
1, -3.57116, -5.705223,
2, -3.397618, -5.441622,
2, -3.57116, -5.705223
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
-3, -3.918243, -6.232424, 0, -0.5, 0.5, 0.5,
-3, -3.918243, -6.232424, 1, -0.5, 0.5, 0.5,
-3, -3.918243, -6.232424, 1, 1.5, 0.5, 0.5,
-3, -3.918243, -6.232424, 0, 1.5, 0.5, 0.5,
-2, -3.918243, -6.232424, 0, -0.5, 0.5, 0.5,
-2, -3.918243, -6.232424, 1, -0.5, 0.5, 0.5,
-2, -3.918243, -6.232424, 1, 1.5, 0.5, 0.5,
-2, -3.918243, -6.232424, 0, 1.5, 0.5, 0.5,
-1, -3.918243, -6.232424, 0, -0.5, 0.5, 0.5,
-1, -3.918243, -6.232424, 1, -0.5, 0.5, 0.5,
-1, -3.918243, -6.232424, 1, 1.5, 0.5, 0.5,
-1, -3.918243, -6.232424, 0, 1.5, 0.5, 0.5,
0, -3.918243, -6.232424, 0, -0.5, 0.5, 0.5,
0, -3.918243, -6.232424, 1, -0.5, 0.5, 0.5,
0, -3.918243, -6.232424, 1, 1.5, 0.5, 0.5,
0, -3.918243, -6.232424, 0, 1.5, 0.5, 0.5,
1, -3.918243, -6.232424, 0, -0.5, 0.5, 0.5,
1, -3.918243, -6.232424, 1, -0.5, 0.5, 0.5,
1, -3.918243, -6.232424, 1, 1.5, 0.5, 0.5,
1, -3.918243, -6.232424, 0, 1.5, 0.5, 0.5,
2, -3.918243, -6.232424, 0, -0.5, 0.5, 0.5,
2, -3.918243, -6.232424, 1, -0.5, 0.5, 0.5,
2, -3.918243, -6.232424, 1, 1.5, 0.5, 0.5,
2, -3.918243, -6.232424, 0, 1.5, 0.5, 0.5
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
-4.017593, -3, -5.441622,
-4.017593, 3, -5.441622,
-4.017593, -3, -5.441622,
-4.191799, -3, -5.705223,
-4.017593, -2, -5.441622,
-4.191799, -2, -5.705223,
-4.017593, -1, -5.441622,
-4.191799, -1, -5.705223,
-4.017593, 0, -5.441622,
-4.191799, 0, -5.705223,
-4.017593, 1, -5.441622,
-4.191799, 1, -5.705223,
-4.017593, 2, -5.441622,
-4.191799, 2, -5.705223,
-4.017593, 3, -5.441622,
-4.191799, 3, -5.705223
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
-4.54021, -3, -6.232424, 0, -0.5, 0.5, 0.5,
-4.54021, -3, -6.232424, 1, -0.5, 0.5, 0.5,
-4.54021, -3, -6.232424, 1, 1.5, 0.5, 0.5,
-4.54021, -3, -6.232424, 0, 1.5, 0.5, 0.5,
-4.54021, -2, -6.232424, 0, -0.5, 0.5, 0.5,
-4.54021, -2, -6.232424, 1, -0.5, 0.5, 0.5,
-4.54021, -2, -6.232424, 1, 1.5, 0.5, 0.5,
-4.54021, -2, -6.232424, 0, 1.5, 0.5, 0.5,
-4.54021, -1, -6.232424, 0, -0.5, 0.5, 0.5,
-4.54021, -1, -6.232424, 1, -0.5, 0.5, 0.5,
-4.54021, -1, -6.232424, 1, 1.5, 0.5, 0.5,
-4.54021, -1, -6.232424, 0, 1.5, 0.5, 0.5,
-4.54021, 0, -6.232424, 0, -0.5, 0.5, 0.5,
-4.54021, 0, -6.232424, 1, -0.5, 0.5, 0.5,
-4.54021, 0, -6.232424, 1, 1.5, 0.5, 0.5,
-4.54021, 0, -6.232424, 0, 1.5, 0.5, 0.5,
-4.54021, 1, -6.232424, 0, -0.5, 0.5, 0.5,
-4.54021, 1, -6.232424, 1, -0.5, 0.5, 0.5,
-4.54021, 1, -6.232424, 1, 1.5, 0.5, 0.5,
-4.54021, 1, -6.232424, 0, 1.5, 0.5, 0.5,
-4.54021, 2, -6.232424, 0, -0.5, 0.5, 0.5,
-4.54021, 2, -6.232424, 1, -0.5, 0.5, 0.5,
-4.54021, 2, -6.232424, 1, 1.5, 0.5, 0.5,
-4.54021, 2, -6.232424, 0, 1.5, 0.5, 0.5,
-4.54021, 3, -6.232424, 0, -0.5, 0.5, 0.5,
-4.54021, 3, -6.232424, 1, -0.5, 0.5, 0.5,
-4.54021, 3, -6.232424, 1, 1.5, 0.5, 0.5,
-4.54021, 3, -6.232424, 0, 1.5, 0.5, 0.5
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
-4.017593, -3.397618, -4,
-4.017593, -3.397618, 4,
-4.017593, -3.397618, -4,
-4.191799, -3.57116, -4,
-4.017593, -3.397618, -2,
-4.191799, -3.57116, -2,
-4.017593, -3.397618, 0,
-4.191799, -3.57116, 0,
-4.017593, -3.397618, 2,
-4.191799, -3.57116, 2,
-4.017593, -3.397618, 4,
-4.191799, -3.57116, 4
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
-4.54021, -3.918243, -4, 0, -0.5, 0.5, 0.5,
-4.54021, -3.918243, -4, 1, -0.5, 0.5, 0.5,
-4.54021, -3.918243, -4, 1, 1.5, 0.5, 0.5,
-4.54021, -3.918243, -4, 0, 1.5, 0.5, 0.5,
-4.54021, -3.918243, -2, 0, -0.5, 0.5, 0.5,
-4.54021, -3.918243, -2, 1, -0.5, 0.5, 0.5,
-4.54021, -3.918243, -2, 1, 1.5, 0.5, 0.5,
-4.54021, -3.918243, -2, 0, 1.5, 0.5, 0.5,
-4.54021, -3.918243, 0, 0, -0.5, 0.5, 0.5,
-4.54021, -3.918243, 0, 1, -0.5, 0.5, 0.5,
-4.54021, -3.918243, 0, 1, 1.5, 0.5, 0.5,
-4.54021, -3.918243, 0, 0, 1.5, 0.5, 0.5,
-4.54021, -3.918243, 2, 0, -0.5, 0.5, 0.5,
-4.54021, -3.918243, 2, 1, -0.5, 0.5, 0.5,
-4.54021, -3.918243, 2, 1, 1.5, 0.5, 0.5,
-4.54021, -3.918243, 2, 0, 1.5, 0.5, 0.5,
-4.54021, -3.918243, 4, 0, -0.5, 0.5, 0.5,
-4.54021, -3.918243, 4, 1, -0.5, 0.5, 0.5,
-4.54021, -3.918243, 4, 1, 1.5, 0.5, 0.5,
-4.54021, -3.918243, 4, 0, 1.5, 0.5, 0.5
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
-4.017593, -3.397618, -5.441622,
-4.017593, 3.544049, -5.441622,
-4.017593, -3.397618, 5.102408,
-4.017593, 3.544049, 5.102408,
-4.017593, -3.397618, -5.441622,
-4.017593, -3.397618, 5.102408,
-4.017593, 3.544049, -5.441622,
-4.017593, 3.544049, 5.102408,
-4.017593, -3.397618, -5.441622,
2.950627, -3.397618, -5.441622,
-4.017593, -3.397618, 5.102408,
2.950627, -3.397618, 5.102408,
-4.017593, 3.544049, -5.441622,
2.950627, 3.544049, -5.441622,
-4.017593, 3.544049, 5.102408,
2.950627, 3.544049, 5.102408,
2.950627, -3.397618, -5.441622,
2.950627, 3.544049, -5.441622,
2.950627, -3.397618, 5.102408,
2.950627, 3.544049, 5.102408,
2.950627, -3.397618, -5.441622,
2.950627, -3.397618, 5.102408,
2.950627, 3.544049, -5.441622,
2.950627, 3.544049, 5.102408
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
var radius = 7.699685;
var distance = 34.25677;
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
mvMatrix.translate( 0.5334829, -0.07321525, 0.1696069 );
mvMatrix.scale( 1.194717, 1.199287, 0.7895511 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.25677);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Londax<-read.table("Londax.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Londax$V2
```

```
## Error in eval(expr, envir, enclos): object 'Londax' not found
```

```r
y<-Londax$V3
```

```
## Error in eval(expr, envir, enclos): object 'Londax' not found
```

```r
z<-Londax$V4
```

```
## Error in eval(expr, envir, enclos): object 'Londax' not found
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
-3.916114, -0.2425995, 0.2591841, 0, 0, 1, 1, 1,
-3.057737, 1.577455, -0.3730568, 1, 0, 0, 1, 1,
-2.928944, -0.3849584, 0.4841968, 1, 0, 0, 1, 1,
-2.910895, -0.1650376, -1.303415, 1, 0, 0, 1, 1,
-2.856605, -0.5527118, -2.272609, 1, 0, 0, 1, 1,
-2.852301, 0.03838043, -3.92864, 1, 0, 0, 1, 1,
-2.60535, 0.5065194, -0.6645992, 0, 0, 0, 1, 1,
-2.476198, 0.3568519, -0.7166393, 0, 0, 0, 1, 1,
-2.393693, 0.8427362, -1.017023, 0, 0, 0, 1, 1,
-2.390259, 0.6376657, -2.001177, 0, 0, 0, 1, 1,
-2.36145, -0.06470721, -1.208218, 0, 0, 0, 1, 1,
-2.350397, -1.689982, -3.030233, 0, 0, 0, 1, 1,
-2.203521, 0.5606692, -1.039005, 0, 0, 0, 1, 1,
-2.184615, -0.9794964, -2.942177, 1, 1, 1, 1, 1,
-2.166435, -2.030622, -1.645413, 1, 1, 1, 1, 1,
-2.115522, -2.846141, -4.022146, 1, 1, 1, 1, 1,
-2.11262, 1.335352, -1.175753, 1, 1, 1, 1, 1,
-2.105841, -1.312802, -1.113076, 1, 1, 1, 1, 1,
-2.066828, 1.529385, -1.891508, 1, 1, 1, 1, 1,
-2.047075, 1.370737, -0.1766946, 1, 1, 1, 1, 1,
-1.969322, -1.92289, -2.809624, 1, 1, 1, 1, 1,
-1.950953, -0.3374041, -1.13262, 1, 1, 1, 1, 1,
-1.924991, -0.7574431, -2.12821, 1, 1, 1, 1, 1,
-1.922534, -0.2129537, -2.194197, 1, 1, 1, 1, 1,
-1.915896, -0.9834216, -1.491837, 1, 1, 1, 1, 1,
-1.91461, 0.4282425, -0.8244147, 1, 1, 1, 1, 1,
-1.909036, 2.418284, 0.9848332, 1, 1, 1, 1, 1,
-1.890717, -0.08736237, -2.796541, 1, 1, 1, 1, 1,
-1.851821, 0.3547522, -1.899994, 0, 0, 1, 1, 1,
-1.832559, -0.1420282, -0.5353938, 1, 0, 0, 1, 1,
-1.828065, -0.8702923, -1.490062, 1, 0, 0, 1, 1,
-1.806259, 0.2795999, -0.3230461, 1, 0, 0, 1, 1,
-1.79345, 0.491747, -0.05563147, 1, 0, 0, 1, 1,
-1.792994, -0.6364939, -1.673987, 1, 0, 0, 1, 1,
-1.763234, -0.2467182, -0.8451356, 0, 0, 0, 1, 1,
-1.760257, -0.5340558, -1.146055, 0, 0, 0, 1, 1,
-1.759854, 2.110263, -0.8526797, 0, 0, 0, 1, 1,
-1.74776, -0.1178243, -0.4495413, 0, 0, 0, 1, 1,
-1.743877, 1.973721, -0.8133345, 0, 0, 0, 1, 1,
-1.741932, 0.7260737, -1.06499, 0, 0, 0, 1, 1,
-1.722351, 1.451523, -0.7486259, 0, 0, 0, 1, 1,
-1.719139, 0.7209867, -1.461323, 1, 1, 1, 1, 1,
-1.711321, -1.646468, -3.835735, 1, 1, 1, 1, 1,
-1.694991, 0.4700717, -0.1687019, 1, 1, 1, 1, 1,
-1.66786, 0.1309542, -2.292903, 1, 1, 1, 1, 1,
-1.656644, 0.7776307, 0.8630523, 1, 1, 1, 1, 1,
-1.645395, 1.127184, -1.448442, 1, 1, 1, 1, 1,
-1.630386, -0.9497266, -1.935123, 1, 1, 1, 1, 1,
-1.627222, -0.3687685, -1.761857, 1, 1, 1, 1, 1,
-1.59981, 2.466172, 0.9264811, 1, 1, 1, 1, 1,
-1.575721, -0.934344, -1.353739, 1, 1, 1, 1, 1,
-1.569916, 0.2251614, -2.180622, 1, 1, 1, 1, 1,
-1.560386, -1.168652, -4.010347, 1, 1, 1, 1, 1,
-1.556823, -0.006456678, -2.465084, 1, 1, 1, 1, 1,
-1.540452, 1.024472, -1.39951, 1, 1, 1, 1, 1,
-1.518367, 0.2669935, -1.66708, 1, 1, 1, 1, 1,
-1.499702, -1.102525, -2.654798, 0, 0, 1, 1, 1,
-1.485285, 1.458877, -0.4565943, 1, 0, 0, 1, 1,
-1.484067, 0.164263, 0.6427419, 1, 0, 0, 1, 1,
-1.481727, -0.529269, -2.091481, 1, 0, 0, 1, 1,
-1.478725, 1.60006, -0.152548, 1, 0, 0, 1, 1,
-1.465328, 0.4549057, -3.286264, 1, 0, 0, 1, 1,
-1.458524, -1.019727, -2.820804, 0, 0, 0, 1, 1,
-1.456972, -0.2300764, -0.8815184, 0, 0, 0, 1, 1,
-1.431419, 0.06894611, -2.336866, 0, 0, 0, 1, 1,
-1.42443, -0.4875587, -0.9731681, 0, 0, 0, 1, 1,
-1.424256, 0.4081155, -2.177445, 0, 0, 0, 1, 1,
-1.423954, -0.1659688, -0.5127004, 0, 0, 0, 1, 1,
-1.423593, -0.9706612, -3.714527, 0, 0, 0, 1, 1,
-1.422162, 0.4321855, -0.7447648, 1, 1, 1, 1, 1,
-1.417978, 0.4093743, -0.1891431, 1, 1, 1, 1, 1,
-1.405455, -0.2114846, -3.259733, 1, 1, 1, 1, 1,
-1.404357, 1.24911, -0.7277868, 1, 1, 1, 1, 1,
-1.397409, -1.057395, -1.971166, 1, 1, 1, 1, 1,
-1.396176, -1.285407, -1.156779, 1, 1, 1, 1, 1,
-1.391942, -0.9696308, -2.071961, 1, 1, 1, 1, 1,
-1.374744, -0.9737244, -1.69068, 1, 1, 1, 1, 1,
-1.373295, 0.9100586, 1.014722, 1, 1, 1, 1, 1,
-1.372919, 0.7087733, -0.3991549, 1, 1, 1, 1, 1,
-1.345299, -0.7981633, -1.720857, 1, 1, 1, 1, 1,
-1.343318, 2.075761, -0.3506041, 1, 1, 1, 1, 1,
-1.337118, 1.344871, -1.389372, 1, 1, 1, 1, 1,
-1.335128, 1.16274, -1.132346, 1, 1, 1, 1, 1,
-1.333785, -0.15684, -1.875235, 1, 1, 1, 1, 1,
-1.325464, 0.02567671, -3.839415, 0, 0, 1, 1, 1,
-1.323249, 1.790272, -1.311374, 1, 0, 0, 1, 1,
-1.309228, -0.09224623, -0.9931324, 1, 0, 0, 1, 1,
-1.308419, -0.1575365, -1.088973, 1, 0, 0, 1, 1,
-1.305493, -0.70735, -2.338267, 1, 0, 0, 1, 1,
-1.300764, -0.6875245, -1.523291, 1, 0, 0, 1, 1,
-1.296628, 0.5699918, -2.088345, 0, 0, 0, 1, 1,
-1.294193, -0.6303415, -0.2864392, 0, 0, 0, 1, 1,
-1.291299, 0.8848137, 0.175957, 0, 0, 0, 1, 1,
-1.291073, -0.4627036, -2.271822, 0, 0, 0, 1, 1,
-1.286846, -0.647938, -0.3436284, 0, 0, 0, 1, 1,
-1.285411, -0.7991425, -2.295557, 0, 0, 0, 1, 1,
-1.278642, -0.4436384, -0.2702683, 0, 0, 0, 1, 1,
-1.267999, -0.1673537, -3.17822, 1, 1, 1, 1, 1,
-1.266993, -0.2540363, -2.60699, 1, 1, 1, 1, 1,
-1.264476, 1.353808, -0.7892023, 1, 1, 1, 1, 1,
-1.258347, 0.05399586, -0.01911617, 1, 1, 1, 1, 1,
-1.250774, -0.583625, -1.706314, 1, 1, 1, 1, 1,
-1.248662, -0.6506853, 0.1625108, 1, 1, 1, 1, 1,
-1.244416, -1.349835, -1.865067, 1, 1, 1, 1, 1,
-1.240486, 0.2559789, 0.4011559, 1, 1, 1, 1, 1,
-1.221046, 1.159998, -0.07361303, 1, 1, 1, 1, 1,
-1.217352, 0.7792705, -0.4934189, 1, 1, 1, 1, 1,
-1.21001, 2.177855, 0.6255476, 1, 1, 1, 1, 1,
-1.186447, -1.378345, -2.771414, 1, 1, 1, 1, 1,
-1.180694, -0.142648, -3.400935, 1, 1, 1, 1, 1,
-1.167421, -0.6029967, -1.053259, 1, 1, 1, 1, 1,
-1.16735, 0.4309802, -0.4149299, 1, 1, 1, 1, 1,
-1.16425, -1.024348, -2.870663, 0, 0, 1, 1, 1,
-1.16414, 0.4785541, -0.4919591, 1, 0, 0, 1, 1,
-1.162523, 0.4978489, -1.326459, 1, 0, 0, 1, 1,
-1.16079, 0.9023304, 0.5658858, 1, 0, 0, 1, 1,
-1.152529, 1.317111, -0.4982066, 1, 0, 0, 1, 1,
-1.128726, -0.6986213, -1.969316, 1, 0, 0, 1, 1,
-1.126842, -0.7709817, -1.974405, 0, 0, 0, 1, 1,
-1.126123, 0.9573742, -0.1033012, 0, 0, 0, 1, 1,
-1.124189, 0.4605618, -1.923185, 0, 0, 0, 1, 1,
-1.122304, -0.5169556, -3.1389, 0, 0, 0, 1, 1,
-1.116983, 1.630425, -1.016711, 0, 0, 0, 1, 1,
-1.116486, -1.14143, -2.176442, 0, 0, 0, 1, 1,
-1.113729, 0.9973359, -1.777974, 0, 0, 0, 1, 1,
-1.110247, -0.8866255, -2.42647, 1, 1, 1, 1, 1,
-1.106229, -1.120618, -0.5929804, 1, 1, 1, 1, 1,
-1.098293, 0.4751139, -2.7403, 1, 1, 1, 1, 1,
-1.096586, -0.5173965, -1.772416, 1, 1, 1, 1, 1,
-1.0956, 0.04997799, 0.9808934, 1, 1, 1, 1, 1,
-1.09269, -0.3310148, -2.490232, 1, 1, 1, 1, 1,
-1.092181, -0.4854054, -1.013256, 1, 1, 1, 1, 1,
-1.09121, -0.3871153, -2.418327, 1, 1, 1, 1, 1,
-1.080387, 1.277686, -1.26852, 1, 1, 1, 1, 1,
-1.075308, -1.111923, -2.640254, 1, 1, 1, 1, 1,
-1.07435, -1.476156, -2.840833, 1, 1, 1, 1, 1,
-1.070404, 2.051923, -0.8844528, 1, 1, 1, 1, 1,
-1.068091, -0.3478262, -1.318332, 1, 1, 1, 1, 1,
-1.067184, 0.8672937, 0.2544719, 1, 1, 1, 1, 1,
-1.063903, 0.9409436, -0.7369335, 1, 1, 1, 1, 1,
-1.055404, 0.9560165, 1.087268, 0, 0, 1, 1, 1,
-1.051808, 0.1090968, -2.571748, 1, 0, 0, 1, 1,
-1.051543, 2.110937, -1.050547, 1, 0, 0, 1, 1,
-1.049781, 0.01347245, -0.8616291, 1, 0, 0, 1, 1,
-1.047274, -1.871188, -1.691623, 1, 0, 0, 1, 1,
-1.046978, -1.170919, -2.351421, 1, 0, 0, 1, 1,
-1.046745, 0.09914904, -2.83262, 0, 0, 0, 1, 1,
-1.044942, 0.1310723, -0.8424775, 0, 0, 0, 1, 1,
-1.03849, 0.999112, 1.839404, 0, 0, 0, 1, 1,
-1.037008, -0.1416232, -0.3709845, 0, 0, 0, 1, 1,
-1.03494, 0.3166273, -2.256918, 0, 0, 0, 1, 1,
-1.030935, -0.8673113, -3.309057, 0, 0, 0, 1, 1,
-1.029552, -0.0114391, -0.8010501, 0, 0, 0, 1, 1,
-1.022442, -1.012162, -3.469252, 1, 1, 1, 1, 1,
-1.019472, -0.3918854, -0.8011542, 1, 1, 1, 1, 1,
-1.010832, 0.8753892, -0.2284206, 1, 1, 1, 1, 1,
-1.007646, -1.320716, -2.274737, 1, 1, 1, 1, 1,
-1.001505, 0.1918813, -2.099551, 1, 1, 1, 1, 1,
-0.9995341, -1.492548, -1.992993, 1, 1, 1, 1, 1,
-0.9993605, -0.8004141, -1.89513, 1, 1, 1, 1, 1,
-0.9915329, -0.201485, -3.147593, 1, 1, 1, 1, 1,
-0.9867157, -0.5386096, -2.650454, 1, 1, 1, 1, 1,
-0.9853337, 1.764758, -0.1513827, 1, 1, 1, 1, 1,
-0.9845103, -1.210105, -3.507453, 1, 1, 1, 1, 1,
-0.9806776, -0.474658, -2.017699, 1, 1, 1, 1, 1,
-0.9744558, 1.441721, -0.1731652, 1, 1, 1, 1, 1,
-0.9742844, 0.8242221, 0.3279013, 1, 1, 1, 1, 1,
-0.9727115, 0.1559328, -2.849596, 1, 1, 1, 1, 1,
-0.9661149, -0.06043247, -1.638939, 0, 0, 1, 1, 1,
-0.9658833, 3.442956, 0.245608, 1, 0, 0, 1, 1,
-0.9547942, 0.8382069, -1.889915, 1, 0, 0, 1, 1,
-0.9501594, -0.9927812, -3.049839, 1, 0, 0, 1, 1,
-0.9478384, -3.047498, -2.426093, 1, 0, 0, 1, 1,
-0.9469296, 0.4297313, -2.499174, 1, 0, 0, 1, 1,
-0.9409512, 0.3275178, -4.008845, 0, 0, 0, 1, 1,
-0.9338513, 0.8173665, -0.6111707, 0, 0, 0, 1, 1,
-0.9296805, 0.2556474, -0.4795492, 0, 0, 0, 1, 1,
-0.9244705, 1.779545, -0.009634521, 0, 0, 0, 1, 1,
-0.9118617, 0.8645349, -0.5994121, 0, 0, 0, 1, 1,
-0.9086809, 0.476174, -1.113544, 0, 0, 0, 1, 1,
-0.8995368, -1.009097, -2.295255, 0, 0, 0, 1, 1,
-0.8941879, -1.538994, -2.391536, 1, 1, 1, 1, 1,
-0.8927016, -0.05647286, -1.387458, 1, 1, 1, 1, 1,
-0.8870059, -0.3691062, -2.067904, 1, 1, 1, 1, 1,
-0.8799757, 0.4310732, -0.6454864, 1, 1, 1, 1, 1,
-0.8734113, 0.9299609, -0.2772358, 1, 1, 1, 1, 1,
-0.8722118, 0.5232977, -0.6440701, 1, 1, 1, 1, 1,
-0.8661796, 0.4622313, 0.2911751, 1, 1, 1, 1, 1,
-0.8599718, 0.6018575, 0.1331557, 1, 1, 1, 1, 1,
-0.8521003, 0.08405322, 0.201856, 1, 1, 1, 1, 1,
-0.8507615, 1.031532, -2.807068, 1, 1, 1, 1, 1,
-0.848468, 0.2581827, -2.006799, 1, 1, 1, 1, 1,
-0.8444241, 0.4469674, -1.804118, 1, 1, 1, 1, 1,
-0.8442829, 0.9276569, -0.9255294, 1, 1, 1, 1, 1,
-0.8433528, 0.5833833, -1.092534, 1, 1, 1, 1, 1,
-0.8426864, 0.1803247, -1.860751, 1, 1, 1, 1, 1,
-0.8417066, -0.9991311, -3.378682, 0, 0, 1, 1, 1,
-0.8402526, 1.110496, 0.3924709, 1, 0, 0, 1, 1,
-0.8385785, -0.2046267, -1.731435, 1, 0, 0, 1, 1,
-0.8350287, -1.026692, -2.160208, 1, 0, 0, 1, 1,
-0.8316692, -0.1237816, -0.6055903, 1, 0, 0, 1, 1,
-0.8291514, 0.4852133, -1.55602, 1, 0, 0, 1, 1,
-0.8210647, 0.1777757, -1.478767, 0, 0, 0, 1, 1,
-0.8161878, 0.009187184, -3.931708, 0, 0, 0, 1, 1,
-0.8125614, 0.753347, 1.081736, 0, 0, 0, 1, 1,
-0.8103355, 0.1295786, -0.01649521, 0, 0, 0, 1, 1,
-0.8100744, 0.04786347, -1.641879, 0, 0, 0, 1, 1,
-0.8002855, 0.9767752, 0.3149545, 0, 0, 0, 1, 1,
-0.7862231, 0.294356, -1.879851, 0, 0, 0, 1, 1,
-0.7859088, 0.800415, -0.7728795, 1, 1, 1, 1, 1,
-0.7816578, -0.9094807, -0.5464054, 1, 1, 1, 1, 1,
-0.7706457, -0.03748303, -1.148458, 1, 1, 1, 1, 1,
-0.7673103, -0.320437, -2.48436, 1, 1, 1, 1, 1,
-0.7647458, -0.02616132, -2.419457, 1, 1, 1, 1, 1,
-0.7630096, -1.235123, -1.175321, 1, 1, 1, 1, 1,
-0.7587472, -1.539709, -2.446875, 1, 1, 1, 1, 1,
-0.7463176, -0.3275833, -2.331439, 1, 1, 1, 1, 1,
-0.7440366, -1.897484, -3.203712, 1, 1, 1, 1, 1,
-0.7439596, -1.295982, -3.842649, 1, 1, 1, 1, 1,
-0.743838, 0.5196933, -1.537146, 1, 1, 1, 1, 1,
-0.736172, -0.2393404, -2.908103, 1, 1, 1, 1, 1,
-0.7313835, 1.402823, 0.2977917, 1, 1, 1, 1, 1,
-0.7261977, 1.447842, 0.5266128, 1, 1, 1, 1, 1,
-0.7231711, 0.9449546, -0.9435945, 1, 1, 1, 1, 1,
-0.7192048, -0.6200605, -2.586767, 0, 0, 1, 1, 1,
-0.7178888, -0.7977082, -3.24376, 1, 0, 0, 1, 1,
-0.7137901, 1.129001, -1.387853, 1, 0, 0, 1, 1,
-0.7130199, 0.8197772, -2.042382, 1, 0, 0, 1, 1,
-0.7081418, -0.9943313, -3.159261, 1, 0, 0, 1, 1,
-0.7071319, -0.5758992, -1.693429, 1, 0, 0, 1, 1,
-0.7038919, 0.9090695, -1.970775, 0, 0, 0, 1, 1,
-0.7018169, 0.8270169, -1.106043, 0, 0, 0, 1, 1,
-0.6970057, -0.5475437, -2.292327, 0, 0, 0, 1, 1,
-0.6903751, 1.109034, -1.415695, 0, 0, 0, 1, 1,
-0.6873438, 0.8242068, -0.09766387, 0, 0, 0, 1, 1,
-0.6847808, 1.575325, -0.4152482, 0, 0, 0, 1, 1,
-0.6841661, 0.6119173, -3.19106, 0, 0, 0, 1, 1,
-0.6780874, -0.5945745, -2.202689, 1, 1, 1, 1, 1,
-0.6767749, 0.5112871, -0.1258521, 1, 1, 1, 1, 1,
-0.6725708, 1.023294, 0.9222732, 1, 1, 1, 1, 1,
-0.6705442, 1.396568, -0.2175965, 1, 1, 1, 1, 1,
-0.6661354, -0.3450657, -1.825325, 1, 1, 1, 1, 1,
-0.666054, -1.198593, -0.7866209, 1, 1, 1, 1, 1,
-0.6655074, -0.2525994, -1.936633, 1, 1, 1, 1, 1,
-0.6631554, 1.910129, -1.611134, 1, 1, 1, 1, 1,
-0.6610092, -1.038433, -2.984036, 1, 1, 1, 1, 1,
-0.6560301, 0.2365917, 0.05960412, 1, 1, 1, 1, 1,
-0.6509929, -0.399756, -3.387167, 1, 1, 1, 1, 1,
-0.6497314, -0.6627168, -2.877763, 1, 1, 1, 1, 1,
-0.6471835, -1.476659, -2.46285, 1, 1, 1, 1, 1,
-0.640187, 0.2074661, -0.8237438, 1, 1, 1, 1, 1,
-0.6395943, -1.63096, -2.014184, 1, 1, 1, 1, 1,
-0.6387299, 0.4571549, -1.391041, 0, 0, 1, 1, 1,
-0.6374895, -0.2696685, -0.3811837, 1, 0, 0, 1, 1,
-0.6348912, -0.05213929, -1.628374, 1, 0, 0, 1, 1,
-0.6342463, -2.11637, -3.492235, 1, 0, 0, 1, 1,
-0.6255742, -0.9794034, -2.835075, 1, 0, 0, 1, 1,
-0.6248131, -0.2677907, -3.304153, 1, 0, 0, 1, 1,
-0.617341, 1.015596, -1.282199, 0, 0, 0, 1, 1,
-0.6140544, -0.812328, -2.222416, 0, 0, 0, 1, 1,
-0.6119464, 0.4536697, -0.505913, 0, 0, 0, 1, 1,
-0.6080307, 0.3094474, -1.152411, 0, 0, 0, 1, 1,
-0.6074288, -0.5258942, -1.638263, 0, 0, 0, 1, 1,
-0.606822, -1.071882, -2.73925, 0, 0, 0, 1, 1,
-0.6055732, -0.0357397, -1.890804, 0, 0, 0, 1, 1,
-0.6037913, -1.143587, -2.725221, 1, 1, 1, 1, 1,
-0.6026397, -0.2690147, -2.989824, 1, 1, 1, 1, 1,
-0.6013749, -0.4746324, -2.810464, 1, 1, 1, 1, 1,
-0.6013707, -0.175646, -2.70989, 1, 1, 1, 1, 1,
-0.5949146, -0.06492645, -1.536224, 1, 1, 1, 1, 1,
-0.5942445, 0.8859193, -1.398157, 1, 1, 1, 1, 1,
-0.5939867, -0.7628462, -2.049352, 1, 1, 1, 1, 1,
-0.5912148, -2.419497, -3.63667, 1, 1, 1, 1, 1,
-0.5874113, -0.3104777, -1.983446, 1, 1, 1, 1, 1,
-0.5872558, -0.388211, -2.478143, 1, 1, 1, 1, 1,
-0.5841069, 0.8638344, 1.060206, 1, 1, 1, 1, 1,
-0.5834746, 1.193324, -0.4253802, 1, 1, 1, 1, 1,
-0.5829521, -0.1494041, -4.475715, 1, 1, 1, 1, 1,
-0.5731596, -0.7955052, -3.21823, 1, 1, 1, 1, 1,
-0.5724293, -0.6495068, -1.046303, 1, 1, 1, 1, 1,
-0.5700144, 0.2865755, 0.3124446, 0, 0, 1, 1, 1,
-0.5691044, 0.1513897, -1.594376, 1, 0, 0, 1, 1,
-0.5687166, -1.997325, -3.230624, 1, 0, 0, 1, 1,
-0.5656898, -0.902556, -2.712188, 1, 0, 0, 1, 1,
-0.5631862, 1.281724, 0.06700818, 1, 0, 0, 1, 1,
-0.562906, -1.518616, -3.275806, 1, 0, 0, 1, 1,
-0.5593596, -0.4471893, -2.199774, 0, 0, 0, 1, 1,
-0.5467641, -0.04755765, -0.2475094, 0, 0, 0, 1, 1,
-0.5403782, -1.710533, -3.582513, 0, 0, 0, 1, 1,
-0.5382817, 0.05087741, -2.101053, 0, 0, 0, 1, 1,
-0.5349574, 0.5704008, 0.07989832, 0, 0, 0, 1, 1,
-0.5336106, -0.02933496, -3.349713, 0, 0, 0, 1, 1,
-0.53272, -0.1754166, -0.3794554, 0, 0, 0, 1, 1,
-0.5292445, 0.2159908, -1.332117, 1, 1, 1, 1, 1,
-0.5291595, 0.8518129, 1.099373, 1, 1, 1, 1, 1,
-0.528284, -0.6726609, -2.827661, 1, 1, 1, 1, 1,
-0.5261699, -1.171263, -4.860442, 1, 1, 1, 1, 1,
-0.5217881, 0.721394, 0.8967807, 1, 1, 1, 1, 1,
-0.5207294, 1.685567, -0.9794695, 1, 1, 1, 1, 1,
-0.5190122, -0.1795212, -2.125712, 1, 1, 1, 1, 1,
-0.5179667, 0.3691521, -0.3290229, 1, 1, 1, 1, 1,
-0.5144773, 1.747425, -1.831231, 1, 1, 1, 1, 1,
-0.5058068, 0.3416478, -2.224951, 1, 1, 1, 1, 1,
-0.504416, 0.09532459, -2.178665, 1, 1, 1, 1, 1,
-0.5041788, -0.5390967, -0.04094144, 1, 1, 1, 1, 1,
-0.5022304, -1.074713, -3.790836, 1, 1, 1, 1, 1,
-0.4992827, -0.5223438, -1.102618, 1, 1, 1, 1, 1,
-0.4938037, -1.13583, -1.913302, 1, 1, 1, 1, 1,
-0.4936917, 0.6310916, -3.184724, 0, 0, 1, 1, 1,
-0.492343, 0.338265, -1.085093, 1, 0, 0, 1, 1,
-0.4903069, 0.990109, 0.3932768, 1, 0, 0, 1, 1,
-0.4885669, -0.4263225, -2.336206, 1, 0, 0, 1, 1,
-0.4860384, 1.393226, -1.360512, 1, 0, 0, 1, 1,
-0.4847051, -0.981342, -0.4958647, 1, 0, 0, 1, 1,
-0.4841913, -0.3545218, -3.638134, 0, 0, 0, 1, 1,
-0.4831468, -0.5947095, -1.991211, 0, 0, 0, 1, 1,
-0.4818048, -0.9383044, -2.86734, 0, 0, 0, 1, 1,
-0.4801572, -1.007614, -3.561066, 0, 0, 0, 1, 1,
-0.4703911, 1.811886, -0.08428317, 0, 0, 0, 1, 1,
-0.4681286, -0.9308325, -1.821037, 0, 0, 0, 1, 1,
-0.4679386, 1.678216, 0.6043212, 0, 0, 0, 1, 1,
-0.4675163, -0.6195735, -4.238251, 1, 1, 1, 1, 1,
-0.4651175, 0.1569366, -2.001302, 1, 1, 1, 1, 1,
-0.4610072, -0.3278326, -1.143037, 1, 1, 1, 1, 1,
-0.4594616, -0.4256005, -1.438154, 1, 1, 1, 1, 1,
-0.4577254, 1.885931, -1.998084, 1, 1, 1, 1, 1,
-0.4530607, 0.3150025, -0.6034572, 1, 1, 1, 1, 1,
-0.4518664, -0.7064808, -2.843649, 1, 1, 1, 1, 1,
-0.4493501, -0.1905555, -1.1418, 1, 1, 1, 1, 1,
-0.4466242, -0.5448071, -2.383754, 1, 1, 1, 1, 1,
-0.4461681, -0.9907941, -0.3985956, 1, 1, 1, 1, 1,
-0.4442248, 1.820235, -0.3173176, 1, 1, 1, 1, 1,
-0.4416468, 0.1987656, -0.588016, 1, 1, 1, 1, 1,
-0.4393664, 1.417986, -0.4400838, 1, 1, 1, 1, 1,
-0.4386916, -2.173724, -2.068141, 1, 1, 1, 1, 1,
-0.4384277, 1.746192, -0.1178554, 1, 1, 1, 1, 1,
-0.4359169, -0.1424938, -1.508929, 0, 0, 1, 1, 1,
-0.4307952, 1.984939, -2.282185, 1, 0, 0, 1, 1,
-0.4290526, -0.1087605, -3.366835, 1, 0, 0, 1, 1,
-0.427025, -0.4434478, -2.494371, 1, 0, 0, 1, 1,
-0.4269747, -0.008341988, -1.111364, 1, 0, 0, 1, 1,
-0.4263609, -1.923384, -0.9366214, 1, 0, 0, 1, 1,
-0.4213474, -1.371459, -2.190428, 0, 0, 0, 1, 1,
-0.4203708, 0.8079497, 1.796583, 0, 0, 0, 1, 1,
-0.4196076, 0.1544403, -1.275201, 0, 0, 0, 1, 1,
-0.4169309, -0.1995889, -1.481732, 0, 0, 0, 1, 1,
-0.4168174, 0.818947, -2.188056, 0, 0, 0, 1, 1,
-0.413571, 1.380252, 0.7195924, 0, 0, 0, 1, 1,
-0.4134918, -1.411495, -3.138526, 0, 0, 0, 1, 1,
-0.4101006, 1.136649, 1.286975, 1, 1, 1, 1, 1,
-0.4097517, 2.54738, 0.5568538, 1, 1, 1, 1, 1,
-0.4089276, -0.262594, -1.296937, 1, 1, 1, 1, 1,
-0.4080634, -2.072667, -3.37481, 1, 1, 1, 1, 1,
-0.3977477, -0.3151121, -3.024809, 1, 1, 1, 1, 1,
-0.3915528, -0.5542387, -2.945583, 1, 1, 1, 1, 1,
-0.3915438, 1.058535, 0.04118447, 1, 1, 1, 1, 1,
-0.3908891, 0.03590563, -2.908978, 1, 1, 1, 1, 1,
-0.3888346, 0.5608659, -1.342636, 1, 1, 1, 1, 1,
-0.385864, -0.3156789, -2.89615, 1, 1, 1, 1, 1,
-0.3842592, -1.608578, -3.080366, 1, 1, 1, 1, 1,
-0.3738218, 1.17191, 0.12075, 1, 1, 1, 1, 1,
-0.3730701, 0.9438842, -0.2646928, 1, 1, 1, 1, 1,
-0.3633793, -0.216274, -1.946827, 1, 1, 1, 1, 1,
-0.3622848, 0.5804424, -0.2221086, 1, 1, 1, 1, 1,
-0.3571909, 0.9695777, -0.8696128, 0, 0, 1, 1, 1,
-0.3565514, 0.566856, -0.4704461, 1, 0, 0, 1, 1,
-0.356362, 1.570354, 0.09871761, 1, 0, 0, 1, 1,
-0.3525386, -1.643625, -3.860818, 1, 0, 0, 1, 1,
-0.3489359, 0.3227772, -1.18019, 1, 0, 0, 1, 1,
-0.3435819, 0.5135284, -0.4670056, 1, 0, 0, 1, 1,
-0.3389473, -1.179972, -2.422726, 0, 0, 0, 1, 1,
-0.3381846, -0.6415871, -1.932086, 0, 0, 0, 1, 1,
-0.327987, -0.4216218, -0.8568001, 0, 0, 0, 1, 1,
-0.3229322, 0.3663543, -0.3052463, 0, 0, 0, 1, 1,
-0.3211792, -0.116234, -2.985486, 0, 0, 0, 1, 1,
-0.3103604, 0.3143437, -1.91456, 0, 0, 0, 1, 1,
-0.3094299, 0.4694604, -0.9754136, 0, 0, 0, 1, 1,
-0.3090847, 0.2565429, -0.1991959, 1, 1, 1, 1, 1,
-0.3071738, -0.8874446, -2.951926, 1, 1, 1, 1, 1,
-0.2976676, 0.05055513, -0.6605133, 1, 1, 1, 1, 1,
-0.2959231, 1.171194, -0.3390808, 1, 1, 1, 1, 1,
-0.2952048, -0.2307869, -1.799582, 1, 1, 1, 1, 1,
-0.2835085, -2.731563, -2.073343, 1, 1, 1, 1, 1,
-0.2829224, 1.616457, -1.649261, 1, 1, 1, 1, 1,
-0.2823816, -0.8946619, -2.336012, 1, 1, 1, 1, 1,
-0.2815303, 1.018251, 0.1441011, 1, 1, 1, 1, 1,
-0.2776406, 0.1527323, -2.434456, 1, 1, 1, 1, 1,
-0.2775739, -0.4374307, -2.34315, 1, 1, 1, 1, 1,
-0.2771376, -1.621808, -3.08322, 1, 1, 1, 1, 1,
-0.2742012, 0.2601253, -2.486125, 1, 1, 1, 1, 1,
-0.2665068, -1.580408, -2.830076, 1, 1, 1, 1, 1,
-0.2612364, -0.8222253, -3.973396, 1, 1, 1, 1, 1,
-0.2603491, 0.1052875, -1.040821, 0, 0, 1, 1, 1,
-0.2583304, -0.3904017, -1.256338, 1, 0, 0, 1, 1,
-0.258074, 0.9907743, -1.582595, 1, 0, 0, 1, 1,
-0.2560711, 2.230662, -1.225934, 1, 0, 0, 1, 1,
-0.2512963, 0.9966469, -1.951875, 1, 0, 0, 1, 1,
-0.2470091, -1.232222, -4.118946, 1, 0, 0, 1, 1,
-0.2466173, -0.9959151, -3.640878, 0, 0, 0, 1, 1,
-0.2458532, -1.126574, -3.278599, 0, 0, 0, 1, 1,
-0.2444474, 0.7390534, 0.7201852, 0, 0, 0, 1, 1,
-0.2399167, 0.165807, 1.30287, 0, 0, 0, 1, 1,
-0.2387802, -0.8092669, -4.353761, 0, 0, 0, 1, 1,
-0.2363259, 0.4226128, 0.4358763, 0, 0, 0, 1, 1,
-0.2313349, -0.3699756, -4.958097, 0, 0, 0, 1, 1,
-0.22887, 1.517653, 0.5388375, 1, 1, 1, 1, 1,
-0.2271125, 1.186509, -0.6276879, 1, 1, 1, 1, 1,
-0.2251199, -0.2402719, -1.47235, 1, 1, 1, 1, 1,
-0.2230604, -0.4380362, -1.805218, 1, 1, 1, 1, 1,
-0.220539, 0.2406862, -0.1670844, 1, 1, 1, 1, 1,
-0.2141296, -0.3315148, -3.623996, 1, 1, 1, 1, 1,
-0.2127275, -1.189224, -2.122748, 1, 1, 1, 1, 1,
-0.2103432, 0.1993236, -1.184925, 1, 1, 1, 1, 1,
-0.2089138, -0.4348692, -0.9929883, 1, 1, 1, 1, 1,
-0.2023445, -0.1306833, -1.483965, 1, 1, 1, 1, 1,
-0.2022555, 1.21559, -0.8919475, 1, 1, 1, 1, 1,
-0.1991074, 2.003043, 1.609823, 1, 1, 1, 1, 1,
-0.1950947, 0.7706513, -1.582927, 1, 1, 1, 1, 1,
-0.1927392, 0.816538, 0.9409643, 1, 1, 1, 1, 1,
-0.1884666, 1.162764, 1.835792, 1, 1, 1, 1, 1,
-0.1869321, -2.202077, -3.567723, 0, 0, 1, 1, 1,
-0.1868164, 0.9582949, 0.6308021, 1, 0, 0, 1, 1,
-0.1843896, 0.2864372, -0.09909823, 1, 0, 0, 1, 1,
-0.1839658, 0.8391424, -0.0275181, 1, 0, 0, 1, 1,
-0.1822411, 0.743946, 0.4970216, 1, 0, 0, 1, 1,
-0.1813659, -0.5263282, -2.331584, 1, 0, 0, 1, 1,
-0.1786067, 0.7782786, -0.4286446, 0, 0, 0, 1, 1,
-0.1745384, 1.422904, -1.151568, 0, 0, 0, 1, 1,
-0.1732286, 2.804806, -1.968261, 0, 0, 0, 1, 1,
-0.1680713, 0.3560128, -0.1172644, 0, 0, 0, 1, 1,
-0.1613151, 1.528069, 0.2337729, 0, 0, 0, 1, 1,
-0.1544467, -0.351493, -1.903892, 0, 0, 0, 1, 1,
-0.1543856, 0.9212794, 0.2840152, 0, 0, 0, 1, 1,
-0.1512481, 1.79641, 0.88724, 1, 1, 1, 1, 1,
-0.1486643, 0.7720438, 0.6080698, 1, 1, 1, 1, 1,
-0.140809, -0.5409913, -3.277229, 1, 1, 1, 1, 1,
-0.1405033, -1.763549, -2.574186, 1, 1, 1, 1, 1,
-0.1366674, 1.689284, -0.3237079, 1, 1, 1, 1, 1,
-0.1355297, -0.1846318, -0.9377978, 1, 1, 1, 1, 1,
-0.1340004, -0.7688501, -0.8175045, 1, 1, 1, 1, 1,
-0.130089, 1.835668, 0.6619805, 1, 1, 1, 1, 1,
-0.1274222, -1.222284, -4.076854, 1, 1, 1, 1, 1,
-0.1271778, 0.1119473, -0.6950312, 1, 1, 1, 1, 1,
-0.1268531, 0.724371, -1.391897, 1, 1, 1, 1, 1,
-0.125104, 0.5851027, 1.243584, 1, 1, 1, 1, 1,
-0.1231574, -0.0887257, -2.619441, 1, 1, 1, 1, 1,
-0.1201035, 1.709663, -0.1215117, 1, 1, 1, 1, 1,
-0.1186922, -0.3366593, -4.026998, 1, 1, 1, 1, 1,
-0.1166596, -1.932011, -3.837249, 0, 0, 1, 1, 1,
-0.1159939, 2.724281, 1.347413, 1, 0, 0, 1, 1,
-0.1157904, -2.709101, -3.286895, 1, 0, 0, 1, 1,
-0.1153664, 0.9218612, -0.5107936, 1, 0, 0, 1, 1,
-0.1143658, 0.5388513, -0.2333235, 1, 0, 0, 1, 1,
-0.1114994, -0.9838115, -1.298593, 1, 0, 0, 1, 1,
-0.1111071, -1.224208, -2.747007, 0, 0, 0, 1, 1,
-0.1056696, -0.1566482, -3.156203, 0, 0, 0, 1, 1,
-0.1052546, 0.861235, 1.642773, 0, 0, 0, 1, 1,
-0.1052147, 1.253184, -0.5296098, 0, 0, 0, 1, 1,
-0.1036233, 0.5715055, 1.441569, 0, 0, 0, 1, 1,
-0.09700358, -1.235815, -2.125763, 0, 0, 0, 1, 1,
-0.09675999, 1.399087, -0.3924499, 0, 0, 0, 1, 1,
-0.09452335, -1.04906, -2.014347, 1, 1, 1, 1, 1,
-0.09347323, 0.7038718, 0.9451773, 1, 1, 1, 1, 1,
-0.09329256, -0.4377115, -2.639171, 1, 1, 1, 1, 1,
-0.09314217, -0.9516538, -2.970147, 1, 1, 1, 1, 1,
-0.08654854, -3.296526, -1.262537, 1, 1, 1, 1, 1,
-0.08483655, 0.514899, -2.036339, 1, 1, 1, 1, 1,
-0.08063047, 0.0969784, 0.7260358, 1, 1, 1, 1, 1,
-0.07809352, -1.438047, -3.448206, 1, 1, 1, 1, 1,
-0.07699581, -1.140216, -2.096857, 1, 1, 1, 1, 1,
-0.07055182, 1.046556, -1.881607, 1, 1, 1, 1, 1,
-0.07022578, -0.6196315, -2.524068, 1, 1, 1, 1, 1,
-0.06857698, -0.2263602, -2.48733, 1, 1, 1, 1, 1,
-0.06599849, 0.6668475, 0.2457725, 1, 1, 1, 1, 1,
-0.06127597, 1.054286, 0.9235247, 1, 1, 1, 1, 1,
-0.06063543, -0.952315, -2.793828, 1, 1, 1, 1, 1,
-0.05919029, -0.348964, -1.495733, 0, 0, 1, 1, 1,
-0.05863514, -1.837924, -1.632684, 1, 0, 0, 1, 1,
-0.05851408, -1.673503, -2.687477, 1, 0, 0, 1, 1,
-0.05728829, -0.2903716, -3.781104, 1, 0, 0, 1, 1,
-0.05500419, 0.4939508, -1.923143, 1, 0, 0, 1, 1,
-0.0549301, 0.1729241, -0.134711, 1, 0, 0, 1, 1,
-0.05449975, 0.3375778, 0.2540096, 0, 0, 0, 1, 1,
-0.05294132, -2.123954, -3.34855, 0, 0, 0, 1, 1,
-0.04902688, -1.404066, -3.647108, 0, 0, 0, 1, 1,
-0.04697959, 0.5131096, 1.515327, 0, 0, 0, 1, 1,
-0.04188802, 0.506842, -1.826623, 0, 0, 0, 1, 1,
-0.0371537, 0.3116643, 0.19255, 0, 0, 0, 1, 1,
-0.03283131, -0.02558379, -3.504473, 0, 0, 0, 1, 1,
-0.02548915, -1.215214, -4.051301, 1, 1, 1, 1, 1,
-0.02393701, 0.4639883, -0.3478896, 1, 1, 1, 1, 1,
-0.02205626, -0.9448378, -3.308847, 1, 1, 1, 1, 1,
-0.0202556, 0.2729874, -0.1590118, 1, 1, 1, 1, 1,
-0.02004317, -0.403819, -2.614556, 1, 1, 1, 1, 1,
-0.01753546, -0.1500509, -5.288068, 1, 1, 1, 1, 1,
-0.01740829, -1.409592, -2.443389, 1, 1, 1, 1, 1,
-0.01430065, 0.6709358, 0.3347024, 1, 1, 1, 1, 1,
-0.01110562, -0.1448868, -4.047729, 1, 1, 1, 1, 1,
-0.01087604, -0.2082937, -4.169472, 1, 1, 1, 1, 1,
-0.004038836, -0.7110143, -3.383164, 1, 1, 1, 1, 1,
-0.002414833, -0.1427534, -3.625479, 1, 1, 1, 1, 1,
0.003136359, 1.146127, 0.4297141, 1, 1, 1, 1, 1,
0.003624342, -1.495442, 3.861992, 1, 1, 1, 1, 1,
0.01404737, -0.9084831, 2.688521, 1, 1, 1, 1, 1,
0.01439868, -0.6441951, 2.901513, 0, 0, 1, 1, 1,
0.01985319, -0.519287, 2.775439, 1, 0, 0, 1, 1,
0.02323703, -0.1510789, 4.114431, 1, 0, 0, 1, 1,
0.02614911, -0.1169055, 3.227891, 1, 0, 0, 1, 1,
0.03011221, -0.651521, 4.284779, 1, 0, 0, 1, 1,
0.03230018, -1.192918, 3.345048, 1, 0, 0, 1, 1,
0.04116846, 1.555687, 0.0872358, 0, 0, 0, 1, 1,
0.04275674, 2.409788, -0.3394814, 0, 0, 0, 1, 1,
0.04555502, 0.7236525, 1.048581, 0, 0, 0, 1, 1,
0.04975531, -1.250475, 2.82574, 0, 0, 0, 1, 1,
0.05277698, 1.633884, -1.412405, 0, 0, 0, 1, 1,
0.05626029, 0.702804, 0.7724576, 0, 0, 0, 1, 1,
0.06628315, -0.1226104, 3.322276, 0, 0, 0, 1, 1,
0.06698798, 0.5089192, -0.1928779, 1, 1, 1, 1, 1,
0.07063407, 2.123771, 1.013505, 1, 1, 1, 1, 1,
0.07100172, 0.1604172, -0.5851475, 1, 1, 1, 1, 1,
0.07479402, 1.028059, 1.39182, 1, 1, 1, 1, 1,
0.07640143, 0.3396305, 0.6147413, 1, 1, 1, 1, 1,
0.07871047, -0.4836343, 2.463622, 1, 1, 1, 1, 1,
0.07909186, 1.242481, -0.007889822, 1, 1, 1, 1, 1,
0.0798217, 0.2214843, 0.6440722, 1, 1, 1, 1, 1,
0.08231059, -1.081635, 3.721409, 1, 1, 1, 1, 1,
0.0833692, 0.1376075, -0.4924549, 1, 1, 1, 1, 1,
0.08607144, -0.9838496, 1.670594, 1, 1, 1, 1, 1,
0.08686703, 0.4213186, -0.4009084, 1, 1, 1, 1, 1,
0.0914322, -1.86552, 2.009354, 1, 1, 1, 1, 1,
0.09792919, -0.5981408, 3.787587, 1, 1, 1, 1, 1,
0.09918758, -0.4169161, 3.777758, 1, 1, 1, 1, 1,
0.1016395, 0.2368575, 1.830541, 0, 0, 1, 1, 1,
0.1026359, -0.6694914, 3.458259, 1, 0, 0, 1, 1,
0.1035042, -0.2045863, 1.772136, 1, 0, 0, 1, 1,
0.1063672, 0.5054025, 1.200417, 1, 0, 0, 1, 1,
0.1067763, -0.458726, 3.102716, 1, 0, 0, 1, 1,
0.1072267, -1.298799, 1.432787, 1, 0, 0, 1, 1,
0.108938, -1.133121, 4.076125, 0, 0, 0, 1, 1,
0.1156691, 0.5419785, -0.3503422, 0, 0, 0, 1, 1,
0.1189413, 0.5185506, -0.3197756, 0, 0, 0, 1, 1,
0.1254737, 1.827731, 0.1704182, 0, 0, 0, 1, 1,
0.126257, 0.008520656, 1.322146, 0, 0, 0, 1, 1,
0.1276961, -1.833014, 3.113422, 0, 0, 0, 1, 1,
0.1328744, -0.4452471, 2.224396, 0, 0, 0, 1, 1,
0.1340319, 0.7153087, -0.3034394, 1, 1, 1, 1, 1,
0.140727, -0.0205719, 1.4753, 1, 1, 1, 1, 1,
0.1407289, -1.786912, 3.942975, 1, 1, 1, 1, 1,
0.1450423, -0.7840455, 1.774192, 1, 1, 1, 1, 1,
0.1576265, -1.567748, 3.91348, 1, 1, 1, 1, 1,
0.1664851, 0.255683, 0.1461557, 1, 1, 1, 1, 1,
0.1665397, -1.034278, 4.909384, 1, 1, 1, 1, 1,
0.1670498, 1.193103, -0.541098, 1, 1, 1, 1, 1,
0.169349, 0.5937893, 1.024836, 1, 1, 1, 1, 1,
0.1747278, 1.84695, 1.113337, 1, 1, 1, 1, 1,
0.1747613, 1.191949, -1.154455, 1, 1, 1, 1, 1,
0.1768228, -1.712896, 3.111583, 1, 1, 1, 1, 1,
0.1772556, -0.6042837, 3.299379, 1, 1, 1, 1, 1,
0.1776592, -0.4851099, 2.212977, 1, 1, 1, 1, 1,
0.1793614, -0.2195828, 3.69154, 1, 1, 1, 1, 1,
0.1806601, -0.07926682, 3.184188, 0, 0, 1, 1, 1,
0.1811145, 1.186966, 0.2162339, 1, 0, 0, 1, 1,
0.18205, -0.7087383, 3.749525, 1, 0, 0, 1, 1,
0.1842379, 0.2593985, 0.2950023, 1, 0, 0, 1, 1,
0.1842848, 0.4578183, 1.086877, 1, 0, 0, 1, 1,
0.184569, -1.573564, 3.291226, 1, 0, 0, 1, 1,
0.1871995, -0.4460183, 2.506233, 0, 0, 0, 1, 1,
0.1890975, 1.906024, 0.4336722, 0, 0, 0, 1, 1,
0.1914057, 0.6326993, -0.2832604, 0, 0, 0, 1, 1,
0.1970639, 0.00381672, 1.162702, 0, 0, 0, 1, 1,
0.1980288, 0.4487215, -0.3767498, 0, 0, 0, 1, 1,
0.2013363, 0.5336532, -1.807686, 0, 0, 0, 1, 1,
0.2063027, 0.329715, 2.024548, 0, 0, 0, 1, 1,
0.2078075, 0.5061362, -0.1668022, 1, 1, 1, 1, 1,
0.2105457, -2.270395, 1.457093, 1, 1, 1, 1, 1,
0.2142191, 0.7041813, -0.3791171, 1, 1, 1, 1, 1,
0.219392, -1.307042, 3.964885, 1, 1, 1, 1, 1,
0.2195327, 0.6539804, -0.7990053, 1, 1, 1, 1, 1,
0.2204462, -1.867937, 4.009312, 1, 1, 1, 1, 1,
0.2259759, 1.45807, 0.1020913, 1, 1, 1, 1, 1,
0.2265198, -0.9020378, 4.12452, 1, 1, 1, 1, 1,
0.2286415, 0.7353857, 0.4521379, 1, 1, 1, 1, 1,
0.2316946, -1.04366, 3.227808, 1, 1, 1, 1, 1,
0.2340105, 1.001594, -0.1533629, 1, 1, 1, 1, 1,
0.241321, 0.6553688, 1.190747, 1, 1, 1, 1, 1,
0.2422735, 0.9682387, 0.2721935, 1, 1, 1, 1, 1,
0.2435278, 0.1693149, 1.000315, 1, 1, 1, 1, 1,
0.2483562, -1.482711, 1.934808, 1, 1, 1, 1, 1,
0.2508334, -0.7751418, 2.96104, 0, 0, 1, 1, 1,
0.2516579, 0.2026286, 0.4493271, 1, 0, 0, 1, 1,
0.2531484, -0.7976891, 2.751801, 1, 0, 0, 1, 1,
0.2544416, 0.2584816, 3.341512, 1, 0, 0, 1, 1,
0.2548009, -1.038924, 2.780586, 1, 0, 0, 1, 1,
0.2586125, 0.1085135, 2.491983, 1, 0, 0, 1, 1,
0.2589983, -1.192109, 4.861013, 0, 0, 0, 1, 1,
0.2626834, -1.118085, 3.97808, 0, 0, 0, 1, 1,
0.263781, -1.003927, 4.846934, 0, 0, 0, 1, 1,
0.2637912, 0.5057636, 0.1058124, 0, 0, 0, 1, 1,
0.265405, -0.1922341, 2.201982, 0, 0, 0, 1, 1,
0.2659359, -0.4045761, 2.601019, 0, 0, 0, 1, 1,
0.2719569, 0.2390594, 2.314868, 0, 0, 0, 1, 1,
0.276021, 1.106535, -1.037719, 1, 1, 1, 1, 1,
0.2798821, 1.43229, -1.190715, 1, 1, 1, 1, 1,
0.2874057, -0.1451019, 2.123396, 1, 1, 1, 1, 1,
0.2933783, -0.292557, 3.723251, 1, 1, 1, 1, 1,
0.2992847, -1.546739, 3.348324, 1, 1, 1, 1, 1,
0.3017699, 1.787929, -0.46997, 1, 1, 1, 1, 1,
0.3053145, -0.2398165, 3.209187, 1, 1, 1, 1, 1,
0.3056464, -1.68829, 3.54767, 1, 1, 1, 1, 1,
0.3096139, 0.7108957, 0.9568511, 1, 1, 1, 1, 1,
0.3102787, -0.7177863, 2.871611, 1, 1, 1, 1, 1,
0.3135031, 0.1755847, 1.570237, 1, 1, 1, 1, 1,
0.3159772, 0.6486681, 1.862922, 1, 1, 1, 1, 1,
0.3194237, -0.05894445, -0.03534122, 1, 1, 1, 1, 1,
0.3235444, -0.1386168, 1.696726, 1, 1, 1, 1, 1,
0.3236591, -1.072459, 3.808027, 1, 1, 1, 1, 1,
0.3247763, -0.7960564, 2.273344, 0, 0, 1, 1, 1,
0.325645, 1.389207, 1.066456, 1, 0, 0, 1, 1,
0.3270014, -1.097295, 1.84117, 1, 0, 0, 1, 1,
0.3314578, -0.5683352, 2.598532, 1, 0, 0, 1, 1,
0.3321692, 0.4843914, 0.8628721, 1, 0, 0, 1, 1,
0.3372109, -0.7853608, 4.161413, 1, 0, 0, 1, 1,
0.3373729, 0.8198566, 0.7862441, 0, 0, 0, 1, 1,
0.3374324, 0.05737315, 1.11354, 0, 0, 0, 1, 1,
0.3394671, 0.7458143, 0.2648119, 0, 0, 0, 1, 1,
0.3419589, 0.6603532, 0.8111893, 0, 0, 0, 1, 1,
0.3461119, -0.433333, 2.68785, 0, 0, 0, 1, 1,
0.3463243, -1.006872, 2.432175, 0, 0, 0, 1, 1,
0.3505811, -0.1865326, 2.588458, 0, 0, 0, 1, 1,
0.3509955, 0.3062914, 0.07946109, 1, 1, 1, 1, 1,
0.3515524, -1.199433, 2.986567, 1, 1, 1, 1, 1,
0.3515957, -0.1682721, 3.727064, 1, 1, 1, 1, 1,
0.3565002, 1.815916, -1.189487, 1, 1, 1, 1, 1,
0.3572715, -1.414216, 2.880486, 1, 1, 1, 1, 1,
0.3591969, 0.7335053, -1.246057, 1, 1, 1, 1, 1,
0.3625646, -0.5135462, 2.760548, 1, 1, 1, 1, 1,
0.3647511, 0.6928315, -0.8218562, 1, 1, 1, 1, 1,
0.3657464, -0.5360861, 2.928892, 1, 1, 1, 1, 1,
0.373653, -1.472706, 1.848652, 1, 1, 1, 1, 1,
0.3756063, -0.628548, 3.471646, 1, 1, 1, 1, 1,
0.3829578, -1.43967, 1.833178, 1, 1, 1, 1, 1,
0.3914035, 2.150341, 0.6077076, 1, 1, 1, 1, 1,
0.3928837, 0.2168427, 0.560037, 1, 1, 1, 1, 1,
0.3934602, -1.897951, 4.075534, 1, 1, 1, 1, 1,
0.4005838, 0.6881124, -0.1745339, 0, 0, 1, 1, 1,
0.4008974, -0.5587739, 2.072555, 1, 0, 0, 1, 1,
0.4023392, -1.847663, 1.681652, 1, 0, 0, 1, 1,
0.4035327, 1.263709, -0.5053961, 1, 0, 0, 1, 1,
0.4057662, 0.8459857, -0.7340788, 1, 0, 0, 1, 1,
0.4061666, 0.2306301, -0.1711467, 1, 0, 0, 1, 1,
0.4070674, 2.527813, 1.637723, 0, 0, 0, 1, 1,
0.4079987, -1.537834, 3.566992, 0, 0, 0, 1, 1,
0.408693, 0.8929359, 0.01179625, 0, 0, 0, 1, 1,
0.4089374, 1.008022, -0.1247681, 0, 0, 0, 1, 1,
0.4165453, 1.142341, 0.03586194, 0, 0, 0, 1, 1,
0.4209674, -0.6595706, 2.306271, 0, 0, 0, 1, 1,
0.4234577, -0.346778, 3.552601, 0, 0, 0, 1, 1,
0.4326523, -0.2534316, 0.4774899, 1, 1, 1, 1, 1,
0.4370175, -0.1860086, 2.533245, 1, 1, 1, 1, 1,
0.4445055, -1.461459, 2.691044, 1, 1, 1, 1, 1,
0.445367, -0.1809244, 1.119731, 1, 1, 1, 1, 1,
0.4475363, -1.725987, 3.278305, 1, 1, 1, 1, 1,
0.4488112, -1.950129, 2.68232, 1, 1, 1, 1, 1,
0.4489301, 0.02933085, 1.760691, 1, 1, 1, 1, 1,
0.4496397, 0.08371016, 1.713924, 1, 1, 1, 1, 1,
0.4530006, -1.183122, 4.840976, 1, 1, 1, 1, 1,
0.4536523, 2.588473, 0.7670059, 1, 1, 1, 1, 1,
0.4550134, -0.5497586, 1.561821, 1, 1, 1, 1, 1,
0.4550191, 0.3591042, 0.7130139, 1, 1, 1, 1, 1,
0.4551221, -0.9388232, 1.585485, 1, 1, 1, 1, 1,
0.4556389, 0.06630269, -1.724106, 1, 1, 1, 1, 1,
0.4569641, -0.4810425, 1.363842, 1, 1, 1, 1, 1,
0.4573549, 0.3043883, 0.632852, 0, 0, 1, 1, 1,
0.4626933, 1.081409, -1.384419, 1, 0, 0, 1, 1,
0.4716812, -1.279675, 3.145044, 1, 0, 0, 1, 1,
0.4718422, 0.07568623, 1.729655, 1, 0, 0, 1, 1,
0.4810224, 1.267564, 1.730021, 1, 0, 0, 1, 1,
0.4899322, -0.265224, 1.806419, 1, 0, 0, 1, 1,
0.4916955, -0.0402994, 0.8341852, 0, 0, 0, 1, 1,
0.4928704, -0.6127523, 3.934939, 0, 0, 0, 1, 1,
0.4939045, 0.4191012, 0.6742312, 0, 0, 0, 1, 1,
0.4949004, -1.049803, 1.414922, 0, 0, 0, 1, 1,
0.4982006, -0.7319812, 2.307071, 0, 0, 0, 1, 1,
0.49867, 0.250113, 1.894698, 0, 0, 0, 1, 1,
0.5009155, -0.4137335, 3.577188, 0, 0, 0, 1, 1,
0.501512, 0.1101553, 1.651237, 1, 1, 1, 1, 1,
0.504069, -0.03750501, -0.5336617, 1, 1, 1, 1, 1,
0.511027, -2.726119, 2.187655, 1, 1, 1, 1, 1,
0.516605, 1.307497, 2.210641, 1, 1, 1, 1, 1,
0.5170253, 1.584437, -0.4902312, 1, 1, 1, 1, 1,
0.5175174, -1.228877, 2.998489, 1, 1, 1, 1, 1,
0.5224239, 0.1612819, -0.6114987, 1, 1, 1, 1, 1,
0.5295697, -0.4429079, 1.052007, 1, 1, 1, 1, 1,
0.5316706, -1.866291, 2.818101, 1, 1, 1, 1, 1,
0.5360506, 0.5225251, 1.07315, 1, 1, 1, 1, 1,
0.5445995, -0.01202106, 2.510911, 1, 1, 1, 1, 1,
0.5468464, -0.1251776, 2.431356, 1, 1, 1, 1, 1,
0.5488037, 1.260367, 0.473564, 1, 1, 1, 1, 1,
0.5497155, -0.7483218, 2.423974, 1, 1, 1, 1, 1,
0.5503033, -0.7468085, 1.65932, 1, 1, 1, 1, 1,
0.5509544, 0.6507508, 1.060613, 0, 0, 1, 1, 1,
0.5510552, 1.051682, 1.621555, 1, 0, 0, 1, 1,
0.5533721, -0.01481986, 1.233297, 1, 0, 0, 1, 1,
0.5622894, 0.1977683, 2.664486, 1, 0, 0, 1, 1,
0.5626722, 1.839649, -0.9181329, 1, 0, 0, 1, 1,
0.5636672, -0.06630002, 2.688814, 1, 0, 0, 1, 1,
0.5641441, -2.406163, 2.001942, 0, 0, 0, 1, 1,
0.5672309, 0.02291107, 2.364314, 0, 0, 0, 1, 1,
0.5678531, 0.4175861, 2.065944, 0, 0, 0, 1, 1,
0.5714002, 1.805644, -0.06406897, 0, 0, 0, 1, 1,
0.5777201, 1.348191, -0.2587608, 0, 0, 0, 1, 1,
0.5779164, 0.4209239, -0.5022798, 0, 0, 0, 1, 1,
0.5802938, -0.6077911, 1.795763, 0, 0, 0, 1, 1,
0.5891597, -0.1376407, 1.2269, 1, 1, 1, 1, 1,
0.5900141, 0.6616679, 1.263514, 1, 1, 1, 1, 1,
0.6000113, -0.9576127, 2.830551, 1, 1, 1, 1, 1,
0.602383, -0.0417828, 2.191283, 1, 1, 1, 1, 1,
0.6088033, -1.775654, 3.832246, 1, 1, 1, 1, 1,
0.6097825, 0.06903978, 1.632071, 1, 1, 1, 1, 1,
0.6127944, 0.2242644, 0.4190129, 1, 1, 1, 1, 1,
0.6131667, 0.4110871, 0.7449484, 1, 1, 1, 1, 1,
0.6137248, -0.7298636, 2.995556, 1, 1, 1, 1, 1,
0.613789, -0.05868726, 0.4105971, 1, 1, 1, 1, 1,
0.6164606, 0.6182861, 1.533248, 1, 1, 1, 1, 1,
0.617062, 1.468856, 0.5862812, 1, 1, 1, 1, 1,
0.6178398, 0.07856891, 3.214329, 1, 1, 1, 1, 1,
0.6216937, 2.315492, 0.8590434, 1, 1, 1, 1, 1,
0.6273934, -2.024062, 2.928698, 1, 1, 1, 1, 1,
0.6283174, -0.3017898, 2.389526, 0, 0, 1, 1, 1,
0.6319894, 0.7568431, -0.1089469, 1, 0, 0, 1, 1,
0.6396464, 0.7491547, 2.230018, 1, 0, 0, 1, 1,
0.6458716, 1.755768, 0.9542717, 1, 0, 0, 1, 1,
0.6528323, 1.356146, 0.7206504, 1, 0, 0, 1, 1,
0.658789, -0.5639173, 2.358635, 1, 0, 0, 1, 1,
0.6592062, -0.007779504, 2.978134, 0, 0, 0, 1, 1,
0.6594908, 0.1513678, 1.203268, 0, 0, 0, 1, 1,
0.660349, -1.227443, 1.249082, 0, 0, 0, 1, 1,
0.6626873, -0.7661299, 0.911508, 0, 0, 0, 1, 1,
0.6631122, 0.4816334, 0.2912986, 0, 0, 0, 1, 1,
0.6728544, -0.4824255, 2.964013, 0, 0, 0, 1, 1,
0.6761589, 0.4790892, 0.2132993, 0, 0, 0, 1, 1,
0.6872124, -1.012821, 2.929632, 1, 1, 1, 1, 1,
0.6897524, 1.521455, 1.995764, 1, 1, 1, 1, 1,
0.6897821, 0.001017135, 1.325553, 1, 1, 1, 1, 1,
0.6976829, 1.583312, -0.7696566, 1, 1, 1, 1, 1,
0.7037152, 0.8431544, -0.3299031, 1, 1, 1, 1, 1,
0.7045705, 0.6091986, -0.4086883, 1, 1, 1, 1, 1,
0.7093938, 1.042867, 1.881235, 1, 1, 1, 1, 1,
0.7134861, 1.432084, -0.5114673, 1, 1, 1, 1, 1,
0.7154331, -1.589422, 3.08619, 1, 1, 1, 1, 1,
0.7235349, -0.2776735, -0.3756099, 1, 1, 1, 1, 1,
0.7244683, -0.7862345, 3.032713, 1, 1, 1, 1, 1,
0.725744, 1.097324, 1.728505, 1, 1, 1, 1, 1,
0.7296274, 1.297029, -0.7143041, 1, 1, 1, 1, 1,
0.7323573, 0.2775666, -0.2571508, 1, 1, 1, 1, 1,
0.733287, -0.4588044, 1.468752, 1, 1, 1, 1, 1,
0.7353582, -0.2011951, 1.391554, 0, 0, 1, 1, 1,
0.735841, -0.7749267, 2.285257, 1, 0, 0, 1, 1,
0.7373109, -1.860304, 3.769643, 1, 0, 0, 1, 1,
0.7383491, 0.03795866, 1.886914, 1, 0, 0, 1, 1,
0.7402451, 0.7997316, 1.306038, 1, 0, 0, 1, 1,
0.7412797, -0.3045249, 3.588492, 1, 0, 0, 1, 1,
0.7440859, 2.021713, 1.15617, 0, 0, 0, 1, 1,
0.7467689, -1.436428, 4.948854, 0, 0, 0, 1, 1,
0.7473562, -0.5753888, 2.975607, 0, 0, 0, 1, 1,
0.7476744, -0.1895406, 0.889136, 0, 0, 0, 1, 1,
0.7506762, -0.2485128, 1.842725, 0, 0, 0, 1, 1,
0.7534465, 0.7846895, -0.008501857, 0, 0, 0, 1, 1,
0.7562393, 0.3844608, 0.1977248, 0, 0, 0, 1, 1,
0.7563371, 0.3194954, 1.689631, 1, 1, 1, 1, 1,
0.7577648, 0.9295056, -0.1517445, 1, 1, 1, 1, 1,
0.7581992, -0.8819058, 3.097491, 1, 1, 1, 1, 1,
0.7601526, -0.4579276, 0.8626705, 1, 1, 1, 1, 1,
0.7629374, -0.3309861, 1.385877, 1, 1, 1, 1, 1,
0.7816516, -0.3136334, 0.4647003, 1, 1, 1, 1, 1,
0.7828586, 1.123156, 1.771618, 1, 1, 1, 1, 1,
0.783325, 1.636734, 0.8153808, 1, 1, 1, 1, 1,
0.784933, 1.150219, -0.711261, 1, 1, 1, 1, 1,
0.7849557, 0.6874429, 2.032487, 1, 1, 1, 1, 1,
0.7854351, -0.6112973, 0.4312928, 1, 1, 1, 1, 1,
0.7855242, 0.2295759, 1.893769, 1, 1, 1, 1, 1,
0.787771, -0.2958874, 2.200012, 1, 1, 1, 1, 1,
0.7972775, -1.268974, 1.762254, 1, 1, 1, 1, 1,
0.8020498, 0.3087979, 0.6497366, 1, 1, 1, 1, 1,
0.8039533, 0.9274652, 0.7412652, 0, 0, 1, 1, 1,
0.8081351, -0.6124594, 1.811781, 1, 0, 0, 1, 1,
0.8106233, -2.760632, 3.959231, 1, 0, 0, 1, 1,
0.8151576, -0.07009917, 1.16195, 1, 0, 0, 1, 1,
0.8155715, 0.343996, 2.71382, 1, 0, 0, 1, 1,
0.8198892, 0.9432063, 1.411851, 1, 0, 0, 1, 1,
0.8215404, 0.2888366, 2.687274, 0, 0, 0, 1, 1,
0.8236361, 0.08027604, 0.9303485, 0, 0, 0, 1, 1,
0.8265862, -0.6179842, 1.768226, 0, 0, 0, 1, 1,
0.8284501, -0.8313796, 3.762628, 0, 0, 0, 1, 1,
0.8295943, 0.9385183, 1.027707, 0, 0, 0, 1, 1,
0.8358425, -1.72112, 2.037126, 0, 0, 0, 1, 1,
0.8370905, 1.305373, 1.258233, 0, 0, 0, 1, 1,
0.8404823, -0.04762057, 1.812621, 1, 1, 1, 1, 1,
0.8426373, 0.4115173, 1.49481, 1, 1, 1, 1, 1,
0.8471201, 0.03776084, 0.2470803, 1, 1, 1, 1, 1,
0.8476295, 0.9689214, -0.2669221, 1, 1, 1, 1, 1,
0.848936, 2.317374, -0.3188327, 1, 1, 1, 1, 1,
0.8497931, -0.6518145, 1.704843, 1, 1, 1, 1, 1,
0.8545414, -1.205515, 1.525205, 1, 1, 1, 1, 1,
0.8669334, 1.584152, -0.1679824, 1, 1, 1, 1, 1,
0.8690498, 0.897767, -0.1000935, 1, 1, 1, 1, 1,
0.890102, -1.620739, 3.710831, 1, 1, 1, 1, 1,
0.8907773, -0.7761539, 2.848228, 1, 1, 1, 1, 1,
0.897611, 0.3621802, 1.381691, 1, 1, 1, 1, 1,
0.9021002, -0.7031485, 2.320539, 1, 1, 1, 1, 1,
0.9022424, 0.5934149, 0.1581452, 1, 1, 1, 1, 1,
0.9060428, -2.103125, 2.446848, 1, 1, 1, 1, 1,
0.9071284, 0.1496323, 1.706977, 0, 0, 1, 1, 1,
0.9127579, 1.062468, 1.291362, 1, 0, 0, 1, 1,
0.9193342, 2.192034, 2.508552, 1, 0, 0, 1, 1,
0.9247125, -1.504228, 2.280428, 1, 0, 0, 1, 1,
0.9286648, 1.065858, -0.3792295, 1, 0, 0, 1, 1,
0.9317346, 0.09937343, 2.86513, 1, 0, 0, 1, 1,
0.9350193, 1.16278, -1.002177, 0, 0, 0, 1, 1,
0.9454985, -1.288463, 2.299578, 0, 0, 0, 1, 1,
0.9544541, -0.6639935, 0.9928874, 0, 0, 0, 1, 1,
0.9545793, -0.2538735, 2.182218, 0, 0, 0, 1, 1,
0.9564061, 0.7013903, 1.977552, 0, 0, 0, 1, 1,
0.9569088, 0.8313416, 0.6335239, 0, 0, 0, 1, 1,
0.958375, -1.626532, 4.422059, 0, 0, 0, 1, 1,
0.9625848, -0.5724869, 1.816106, 1, 1, 1, 1, 1,
0.9675608, -0.230069, 3.456303, 1, 1, 1, 1, 1,
0.9689232, 1.208431, 1.102278, 1, 1, 1, 1, 1,
0.970859, -0.0119585, 2.556102, 1, 1, 1, 1, 1,
0.980375, 0.3847867, 1.847414, 1, 1, 1, 1, 1,
0.986196, 1.208966, 1.251366, 1, 1, 1, 1, 1,
0.98771, -0.575253, 0.9735816, 1, 1, 1, 1, 1,
0.9880357, -1.282136, 2.534776, 1, 1, 1, 1, 1,
0.9908452, 0.7128913, 3.826877, 1, 1, 1, 1, 1,
0.9960427, -0.8964956, 2.580325, 1, 1, 1, 1, 1,
0.9970946, -0.8125495, 3.12559, 1, 1, 1, 1, 1,
1.003147, -1.405604, 1.582122, 1, 1, 1, 1, 1,
1.003765, 0.05581066, 1.652362, 1, 1, 1, 1, 1,
1.012137, -0.7931337, 0.521587, 1, 1, 1, 1, 1,
1.013141, 0.1728619, 1.852029, 1, 1, 1, 1, 1,
1.014959, -2.137199, 2.353943, 0, 0, 1, 1, 1,
1.01857, 0.772139, 0.3096108, 1, 0, 0, 1, 1,
1.028463, 2.998824, -1.353147, 1, 0, 0, 1, 1,
1.034534, 0.9995456, 0.5518104, 1, 0, 0, 1, 1,
1.042809, -0.3746887, 1.939993, 1, 0, 0, 1, 1,
1.044987, 1.948579, 0.8770061, 1, 0, 0, 1, 1,
1.047618, -1.930603, 4.318802, 0, 0, 0, 1, 1,
1.049656, -0.3944431, 1.999037, 0, 0, 0, 1, 1,
1.05271, -0.2336492, 1.236711, 0, 0, 0, 1, 1,
1.057073, 0.8913392, 2.083496, 0, 0, 0, 1, 1,
1.060697, 1.363577, 0.3974354, 0, 0, 0, 1, 1,
1.06282, 0.4825106, 1.269386, 0, 0, 0, 1, 1,
1.06435, 0.2598977, 2.320873, 0, 0, 0, 1, 1,
1.069675, 0.3208137, 0.6368691, 1, 1, 1, 1, 1,
1.070009, 1.094094, 1.236076, 1, 1, 1, 1, 1,
1.07361, 0.1120608, -0.3834423, 1, 1, 1, 1, 1,
1.074526, 0.8121443, 1.106548, 1, 1, 1, 1, 1,
1.091894, 0.8436634, -0.3006328, 1, 1, 1, 1, 1,
1.095478, -0.5183765, 1.12166, 1, 1, 1, 1, 1,
1.097423, 0.6662567, 1.079818, 1, 1, 1, 1, 1,
1.100189, 0.6558991, 0.977955, 1, 1, 1, 1, 1,
1.101046, -0.1987349, 1.133795, 1, 1, 1, 1, 1,
1.104525, -1.776762, 2.67613, 1, 1, 1, 1, 1,
1.10546, 0.7105958, -0.697743, 1, 1, 1, 1, 1,
1.107481, 1.68467, 1.380035, 1, 1, 1, 1, 1,
1.116071, -1.818026, 3.53527, 1, 1, 1, 1, 1,
1.116085, 0.2437296, 3.07674, 1, 1, 1, 1, 1,
1.116217, -0.5781615, 2.948049, 1, 1, 1, 1, 1,
1.117988, -0.8273481, 2.169157, 0, 0, 1, 1, 1,
1.118411, 0.06834693, 1.809801, 1, 0, 0, 1, 1,
1.122154, 1.952413, 0.2402854, 1, 0, 0, 1, 1,
1.124992, 0.6357235, -0.2236224, 1, 0, 0, 1, 1,
1.130576, 0.2829686, 1.97617, 1, 0, 0, 1, 1,
1.137628, 0.3809776, 0.6127423, 1, 0, 0, 1, 1,
1.14466, 1.693678, 0.09575199, 0, 0, 0, 1, 1,
1.145165, -0.4267899, 2.363267, 0, 0, 0, 1, 1,
1.146474, -2.642228, 4.302385, 0, 0, 0, 1, 1,
1.150155, 0.6482818, 0.4358831, 0, 0, 0, 1, 1,
1.151168, 0.6400269, 0.6798458, 0, 0, 0, 1, 1,
1.154541, 0.1919704, 0.09065091, 0, 0, 0, 1, 1,
1.154579, -0.919912, 4.081191, 0, 0, 0, 1, 1,
1.158943, 0.2381273, 0.5900747, 1, 1, 1, 1, 1,
1.162319, -1.941958, 2.982589, 1, 1, 1, 1, 1,
1.16442, -1.483192, 1.36044, 1, 1, 1, 1, 1,
1.164608, -0.2530225, 1.388726, 1, 1, 1, 1, 1,
1.180864, 1.015547, 0.9133453, 1, 1, 1, 1, 1,
1.186484, 0.813856, 0.4084489, 1, 1, 1, 1, 1,
1.189234, 0.0277525, -0.1086565, 1, 1, 1, 1, 1,
1.193346, 0.1334405, 1.654821, 1, 1, 1, 1, 1,
1.21054, -0.317902, 0.8491875, 1, 1, 1, 1, 1,
1.214511, 0.9856015, 0.7695258, 1, 1, 1, 1, 1,
1.216837, 0.04578269, 0.9445933, 1, 1, 1, 1, 1,
1.223813, -0.4889252, 1.757662, 1, 1, 1, 1, 1,
1.224702, -0.3911522, 2.118468, 1, 1, 1, 1, 1,
1.227222, -0.7476993, 3.106519, 1, 1, 1, 1, 1,
1.251281, 0.005346333, 1.699251, 1, 1, 1, 1, 1,
1.252325, -0.1323059, 0.3432287, 0, 0, 1, 1, 1,
1.25496, -1.63313, 2.197049, 1, 0, 0, 1, 1,
1.257323, -0.3085271, 0.9904604, 1, 0, 0, 1, 1,
1.259364, 2.034757, 0.575919, 1, 0, 0, 1, 1,
1.263293, -1.789186, 2.809981, 1, 0, 0, 1, 1,
1.272481, -0.5846913, 1.177236, 1, 0, 0, 1, 1,
1.273762, -0.6399126, 2.512076, 0, 0, 0, 1, 1,
1.282509, -0.4113318, -0.6285771, 0, 0, 0, 1, 1,
1.293727, -0.3600396, -0.2756025, 0, 0, 0, 1, 1,
1.298792, -1.470929, 3.162779, 0, 0, 0, 1, 1,
1.303262, -0.7550868, 2.730356, 0, 0, 0, 1, 1,
1.306475, 1.772863, 2.480566, 0, 0, 0, 1, 1,
1.306931, -0.08999138, -0.7638611, 0, 0, 0, 1, 1,
1.309183, -1.482185, 3.514074, 1, 1, 1, 1, 1,
1.312823, -0.1839141, 3.298636, 1, 1, 1, 1, 1,
1.315358, -0.1287279, 0.2724803, 1, 1, 1, 1, 1,
1.320334, 0.05155307, 1.618343, 1, 1, 1, 1, 1,
1.325577, -1.322515, 1.16241, 1, 1, 1, 1, 1,
1.337054, 0.3358319, -0.4382708, 1, 1, 1, 1, 1,
1.339993, 0.8856055, 0.9397566, 1, 1, 1, 1, 1,
1.35597, 0.4917959, 3.133604, 1, 1, 1, 1, 1,
1.357682, 0.145366, 2.394164, 1, 1, 1, 1, 1,
1.365083, -0.5814227, 2.939642, 1, 1, 1, 1, 1,
1.380704, 0.03128788, 2.379804, 1, 1, 1, 1, 1,
1.389509, -0.009968469, 1.351719, 1, 1, 1, 1, 1,
1.391029, -0.2766071, 0.8261267, 1, 1, 1, 1, 1,
1.39451, -0.4608977, 1.98539, 1, 1, 1, 1, 1,
1.396969, 0.9987001, 0.9081158, 1, 1, 1, 1, 1,
1.399111, 0.4239199, 0.7272282, 0, 0, 1, 1, 1,
1.401637, 1.576672, -0.3160048, 1, 0, 0, 1, 1,
1.40569, 1.360728, 2.41542, 1, 0, 0, 1, 1,
1.408809, -1.003116, 1.945975, 1, 0, 0, 1, 1,
1.418108, -0.4013188, 1.65173, 1, 0, 0, 1, 1,
1.440168, -0.620062, 1.889871, 1, 0, 0, 1, 1,
1.470221, 0.3719502, 2.779327, 0, 0, 0, 1, 1,
1.50018, -0.7701538, 1.278025, 0, 0, 0, 1, 1,
1.501345, 0.4965238, 1.105673, 0, 0, 0, 1, 1,
1.506888, -0.3518114, 1.155284, 0, 0, 0, 1, 1,
1.506904, -0.1705643, 0.7579066, 0, 0, 0, 1, 1,
1.527183, -0.4172997, 0.9771349, 0, 0, 0, 1, 1,
1.562413, 0.7386127, 0.6222206, 0, 0, 0, 1, 1,
1.573596, 0.817484, 2.095669, 1, 1, 1, 1, 1,
1.576626, -0.08137091, 0.7423227, 1, 1, 1, 1, 1,
1.588581, 0.8432975, 1.022656, 1, 1, 1, 1, 1,
1.598483, 0.04170456, -0.5994822, 1, 1, 1, 1, 1,
1.609732, 1.526975, 0.415924, 1, 1, 1, 1, 1,
1.627236, 1.752358, 0.965219, 1, 1, 1, 1, 1,
1.628343, -0.8020759, 1.467075, 1, 1, 1, 1, 1,
1.636337, -0.1123016, 1.2966, 1, 1, 1, 1, 1,
1.656288, 1.567967, 0.254395, 1, 1, 1, 1, 1,
1.65732, 0.3859971, 1.591357, 1, 1, 1, 1, 1,
1.70502, -1.993193, 1.745255, 1, 1, 1, 1, 1,
1.708826, 1.069703, -0.8342128, 1, 1, 1, 1, 1,
1.710423, 2.224336, -0.3833723, 1, 1, 1, 1, 1,
1.719216, -1.796095, 4.023242, 1, 1, 1, 1, 1,
1.729933, 0.06824951, 2.939157, 1, 1, 1, 1, 1,
1.749435, -1.010157, 2.211738, 0, 0, 1, 1, 1,
1.754244, -0.2330429, 1.836654, 1, 0, 0, 1, 1,
1.754395, 1.128187, 0.9909179, 1, 0, 0, 1, 1,
1.770009, 1.077418, 0.07765545, 1, 0, 0, 1, 1,
1.770425, 0.4454887, 0.2565701, 1, 0, 0, 1, 1,
1.779855, 0.3516377, 1.91458, 1, 0, 0, 1, 1,
1.781388, -1.27065, 1.077199, 0, 0, 0, 1, 1,
1.793916, 0.7788808, 1.227275, 0, 0, 0, 1, 1,
1.801685, -0.4837215, 2.122523, 0, 0, 0, 1, 1,
1.806513, -0.2740134, -0.1382326, 0, 0, 0, 1, 1,
1.810218, 0.5418585, 1.664529, 0, 0, 0, 1, 1,
1.835164, -0.06614086, 1.437053, 0, 0, 0, 1, 1,
1.848447, 0.5331796, -0.4826182, 0, 0, 0, 1, 1,
1.855684, 0.3987548, 2.120166, 1, 1, 1, 1, 1,
1.856786, -0.1342392, -0.2456238, 1, 1, 1, 1, 1,
1.872648, -0.1088987, 0.2175765, 1, 1, 1, 1, 1,
1.875178, -0.7993976, 1.7379, 1, 1, 1, 1, 1,
1.878675, 0.8459519, -0.09403112, 1, 1, 1, 1, 1,
1.886098, -0.5115338, 2.611637, 1, 1, 1, 1, 1,
1.886119, 0.7499674, 1.087636, 1, 1, 1, 1, 1,
1.893488, 0.08093875, 1.976001, 1, 1, 1, 1, 1,
1.91652, 1.748528, -0.3233424, 1, 1, 1, 1, 1,
1.91759, 1.13734, 1.848014, 1, 1, 1, 1, 1,
1.963214, 0.1146383, 3.094332, 1, 1, 1, 1, 1,
1.978781, 0.8574775, 2.166092, 1, 1, 1, 1, 1,
1.984717, -0.872117, 1.924279, 1, 1, 1, 1, 1,
2.055861, -0.08422689, 1.218348, 1, 1, 1, 1, 1,
2.093436, 0.2359949, 2.350608, 1, 1, 1, 1, 1,
2.103569, -2.073761, 2.408022, 0, 0, 1, 1, 1,
2.233552, 0.5757122, 2.033711, 1, 0, 0, 1, 1,
2.249847, -0.269108, 0.9166664, 1, 0, 0, 1, 1,
2.269529, -0.6432637, 2.078723, 1, 0, 0, 1, 1,
2.272362, -2.68335, 2.409453, 1, 0, 0, 1, 1,
2.277126, -0.6127354, 2.85399, 1, 0, 0, 1, 1,
2.308829, 0.5022266, 0.488159, 0, 0, 0, 1, 1,
2.338394, 0.4661964, 1.922243, 0, 0, 0, 1, 1,
2.362344, -1.241659, 0.2634203, 0, 0, 0, 1, 1,
2.371305, 0.7901513, 1.23895, 0, 0, 0, 1, 1,
2.394965, 0.091258, 2.287838, 0, 0, 0, 1, 1,
2.420006, -0.7596246, 2.612683, 0, 0, 0, 1, 1,
2.426099, 0.2237459, 0.6383299, 0, 0, 0, 1, 1,
2.450916, -2.296786, 0.3937794, 1, 1, 1, 1, 1,
2.538751, 0.418065, 1.182436, 1, 1, 1, 1, 1,
2.576932, 0.230872, 1.564591, 1, 1, 1, 1, 1,
2.701825, 1.110804, 1.854097, 1, 1, 1, 1, 1,
2.702757, 0.7962709, 1.041781, 1, 1, 1, 1, 1,
2.726207, 0.9274456, 1.29573, 1, 1, 1, 1, 1,
2.849148, 0.4869254, 2.280211, 1, 1, 1, 1, 1
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
var radius = 9.573012;
var distance = 33.6248;
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
mvMatrix.translate( 0.5334828, -0.07321501, 0.1696069 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.6248);
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
