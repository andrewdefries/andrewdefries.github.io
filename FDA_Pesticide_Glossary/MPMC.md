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
-3.114526, -0.2493635, -3.296487, 1, 0, 0, 1,
-2.852781, -1.981883, -2.35575, 1, 0.007843138, 0, 1,
-2.818939, -0.5278878, -0.5613381, 1, 0.01176471, 0, 1,
-2.732533, 0.6540807, -1.069024, 1, 0.01960784, 0, 1,
-2.597736, -1.14987, -2.230404, 1, 0.02352941, 0, 1,
-2.419946, -0.1775189, -1.879326, 1, 0.03137255, 0, 1,
-2.389128, -1.51097, -1.242983, 1, 0.03529412, 0, 1,
-2.384535, 0.1153614, -1.832341, 1, 0.04313726, 0, 1,
-2.372325, 1.159592, -2.270651, 1, 0.04705882, 0, 1,
-2.361753, 0.1009086, -1.231337, 1, 0.05490196, 0, 1,
-2.320274, -1.805932, -0.3834734, 1, 0.05882353, 0, 1,
-2.234664, -0.3729711, -1.946085, 1, 0.06666667, 0, 1,
-2.225507, -0.2753461, -1.353224, 1, 0.07058824, 0, 1,
-2.222102, -1.171392, -3.331483, 1, 0.07843138, 0, 1,
-2.195224, 0.9041085, -0.918228, 1, 0.08235294, 0, 1,
-2.153936, 1.270216, 1.036978, 1, 0.09019608, 0, 1,
-2.129703, -0.6459934, -2.261139, 1, 0.09411765, 0, 1,
-2.111926, 0.3158711, -2.238998, 1, 0.1019608, 0, 1,
-2.102858, -0.7452939, -0.8872972, 1, 0.1098039, 0, 1,
-2.095716, 0.2287584, -1.166528, 1, 0.1137255, 0, 1,
-2.074431, 0.6327497, -0.01165801, 1, 0.1215686, 0, 1,
-2.054045, 0.8019707, -1.40311, 1, 0.1254902, 0, 1,
-2.031426, 0.2320924, 0.03902706, 1, 0.1333333, 0, 1,
-2.020677, -0.8133368, -1.513315, 1, 0.1372549, 0, 1,
-2.019678, 0.3638521, -0.5718042, 1, 0.145098, 0, 1,
-2.011135, -0.4806995, -2.020355, 1, 0.1490196, 0, 1,
-1.99694, -0.4266373, -2.892082, 1, 0.1568628, 0, 1,
-1.987892, -1.682022, -2.775743, 1, 0.1607843, 0, 1,
-1.974823, 0.9073063, -1.615519, 1, 0.1686275, 0, 1,
-1.972788, -1.48456, -4.550695, 1, 0.172549, 0, 1,
-1.963054, -0.3238006, -2.534363, 1, 0.1803922, 0, 1,
-1.944427, 0.7602308, -1.512395, 1, 0.1843137, 0, 1,
-1.942248, -2.399727, -1.719817, 1, 0.1921569, 0, 1,
-1.936912, -0.5907871, -0.6066658, 1, 0.1960784, 0, 1,
-1.931625, -1.381533, -0.1133898, 1, 0.2039216, 0, 1,
-1.931334, -0.4378324, -1.708398, 1, 0.2117647, 0, 1,
-1.928296, -1.239808, -2.824299, 1, 0.2156863, 0, 1,
-1.908516, -0.0241843, -2.786067, 1, 0.2235294, 0, 1,
-1.900281, -1.742407, 0.5981195, 1, 0.227451, 0, 1,
-1.865366, 0.6783224, -2.829426, 1, 0.2352941, 0, 1,
-1.854861, -0.3000439, -2.155473, 1, 0.2392157, 0, 1,
-1.842744, -0.804855, -2.050848, 1, 0.2470588, 0, 1,
-1.842266, -0.01998445, -2.006972, 1, 0.2509804, 0, 1,
-1.826102, -0.4386391, -2.581503, 1, 0.2588235, 0, 1,
-1.81661, 0.09954356, -1.629266, 1, 0.2627451, 0, 1,
-1.807111, -1.507194, -3.770759, 1, 0.2705882, 0, 1,
-1.802147, 0.123461, -2.041896, 1, 0.2745098, 0, 1,
-1.800358, -0.136539, -2.398661, 1, 0.282353, 0, 1,
-1.798781, -1.387207, -2.256783, 1, 0.2862745, 0, 1,
-1.790067, 0.08782319, -2.267124, 1, 0.2941177, 0, 1,
-1.783868, 1.578617, 0.08754326, 1, 0.3019608, 0, 1,
-1.783443, -0.8681287, -1.176944, 1, 0.3058824, 0, 1,
-1.764567, -1.4049, -0.5811554, 1, 0.3137255, 0, 1,
-1.753882, -0.6684762, -2.082757, 1, 0.3176471, 0, 1,
-1.7448, -0.3109073, -1.76956, 1, 0.3254902, 0, 1,
-1.721208, -0.9992228, -1.800395, 1, 0.3294118, 0, 1,
-1.719238, 1.863398, -1.603072, 1, 0.3372549, 0, 1,
-1.715805, 0.6250713, -1.85061, 1, 0.3411765, 0, 1,
-1.715487, 1.697302, -0.02013236, 1, 0.3490196, 0, 1,
-1.71373, 0.6373891, 0.1264618, 1, 0.3529412, 0, 1,
-1.695725, -0.6595758, -2.952875, 1, 0.3607843, 0, 1,
-1.694133, 0.345017, -0.588947, 1, 0.3647059, 0, 1,
-1.686111, 3.063928, 0.6194727, 1, 0.372549, 0, 1,
-1.684298, 0.3848439, -1.058847, 1, 0.3764706, 0, 1,
-1.677333, 0.407486, -1.913991, 1, 0.3843137, 0, 1,
-1.676128, -1.399601, -2.157045, 1, 0.3882353, 0, 1,
-1.669589, 1.272235, 0.03162413, 1, 0.3960784, 0, 1,
-1.669388, 0.5324306, -1.005457, 1, 0.4039216, 0, 1,
-1.663129, 0.3360462, -0.7553638, 1, 0.4078431, 0, 1,
-1.656265, -1.433936, -2.25028, 1, 0.4156863, 0, 1,
-1.651827, -0.5023149, -1.206928, 1, 0.4196078, 0, 1,
-1.651323, 0.5473145, -2.168284, 1, 0.427451, 0, 1,
-1.637332, 0.09147822, -2.960617, 1, 0.4313726, 0, 1,
-1.621478, 1.345021, 0.0906424, 1, 0.4392157, 0, 1,
-1.618676, -0.0234709, -1.320985, 1, 0.4431373, 0, 1,
-1.599616, 1.614143, -0.483981, 1, 0.4509804, 0, 1,
-1.598939, -0.01388798, -2.397208, 1, 0.454902, 0, 1,
-1.591078, -0.7387592, -3.207091, 1, 0.4627451, 0, 1,
-1.587646, -1.154155, -1.982911, 1, 0.4666667, 0, 1,
-1.585942, -0.989381, -1.175145, 1, 0.4745098, 0, 1,
-1.579331, 1.951073, 0.9596999, 1, 0.4784314, 0, 1,
-1.578401, -0.762165, -2.375264, 1, 0.4862745, 0, 1,
-1.549511, 0.1070012, -1.314883, 1, 0.4901961, 0, 1,
-1.544412, 0.5543652, -0.9647023, 1, 0.4980392, 0, 1,
-1.538132, -1.132461, -3.541192, 1, 0.5058824, 0, 1,
-1.533902, 0.7137887, -0.560173, 1, 0.509804, 0, 1,
-1.502861, -1.487115, -1.102065, 1, 0.5176471, 0, 1,
-1.500568, 0.8424811, -1.72922, 1, 0.5215687, 0, 1,
-1.491451, 1.036456, -1.735523, 1, 0.5294118, 0, 1,
-1.479064, 0.5689819, 1.681127, 1, 0.5333334, 0, 1,
-1.468897, -1.680986, -2.360133, 1, 0.5411765, 0, 1,
-1.45791, -0.1741674, -2.952195, 1, 0.5450981, 0, 1,
-1.456132, 0.248627, -2.264409, 1, 0.5529412, 0, 1,
-1.455325, 0.9528108, -0.8275552, 1, 0.5568628, 0, 1,
-1.448129, 1.13889, -0.6551744, 1, 0.5647059, 0, 1,
-1.447844, 0.2305561, -1.13097, 1, 0.5686275, 0, 1,
-1.434356, 0.7968513, -2.211765, 1, 0.5764706, 0, 1,
-1.430603, 0.7162713, -1.899698, 1, 0.5803922, 0, 1,
-1.420393, -1.259623, -1.540101, 1, 0.5882353, 0, 1,
-1.408324, -1.097321, -1.173103, 1, 0.5921569, 0, 1,
-1.397706, -0.7457057, -2.317253, 1, 0.6, 0, 1,
-1.397517, 0.9829531, -2.196913, 1, 0.6078432, 0, 1,
-1.394101, -0.2582201, -2.470523, 1, 0.6117647, 0, 1,
-1.378263, 0.8854584, -1.019302, 1, 0.6196079, 0, 1,
-1.365898, 1.029537, -0.02113956, 1, 0.6235294, 0, 1,
-1.363613, 3.001866, -0.7928965, 1, 0.6313726, 0, 1,
-1.35869, -1.652371, -3.051289, 1, 0.6352941, 0, 1,
-1.357965, 1.581077, -0.7444386, 1, 0.6431373, 0, 1,
-1.351505, -1.997824, -2.585841, 1, 0.6470588, 0, 1,
-1.338291, -0.5453755, -1.225492, 1, 0.654902, 0, 1,
-1.333996, 1.30185, -2.661176, 1, 0.6588235, 0, 1,
-1.332963, 1.475773, -0.8190181, 1, 0.6666667, 0, 1,
-1.329542, -1.602746, -2.558975, 1, 0.6705883, 0, 1,
-1.328806, -1.5595, -5.297578, 1, 0.6784314, 0, 1,
-1.321413, 0.3771246, -0.908567, 1, 0.682353, 0, 1,
-1.315785, -0.6986441, -2.359435, 1, 0.6901961, 0, 1,
-1.313012, 1.953345, 0.7053072, 1, 0.6941177, 0, 1,
-1.308464, -2.144127, -2.83145, 1, 0.7019608, 0, 1,
-1.300577, -1.438596, -1.039653, 1, 0.7098039, 0, 1,
-1.291567, 1.859761, -0.6103514, 1, 0.7137255, 0, 1,
-1.290678, 0.1153684, -2.252542, 1, 0.7215686, 0, 1,
-1.288593, -0.650054, -2.018259, 1, 0.7254902, 0, 1,
-1.271157, -0.6835456, -2.377653, 1, 0.7333333, 0, 1,
-1.268985, -0.2937638, -1.296605, 1, 0.7372549, 0, 1,
-1.266884, 0.2119052, -0.4652194, 1, 0.7450981, 0, 1,
-1.260864, -0.26534, -1.113015, 1, 0.7490196, 0, 1,
-1.256571, -0.6646536, -2.371331, 1, 0.7568628, 0, 1,
-1.246295, -0.7970906, -0.3047304, 1, 0.7607843, 0, 1,
-1.245705, -1.415165, -3.237875, 1, 0.7686275, 0, 1,
-1.234297, -1.653862, -2.950437, 1, 0.772549, 0, 1,
-1.234221, 1.111724, -0.3483309, 1, 0.7803922, 0, 1,
-1.219026, -1.380653, -2.545458, 1, 0.7843137, 0, 1,
-1.216533, 0.2027795, -1.279665, 1, 0.7921569, 0, 1,
-1.206375, -1.42855, -1.394681, 1, 0.7960784, 0, 1,
-1.198159, -1.079536, -1.635013, 1, 0.8039216, 0, 1,
-1.196779, 0.09496641, -0.5326427, 1, 0.8117647, 0, 1,
-1.193805, 0.4637343, -1.59586, 1, 0.8156863, 0, 1,
-1.187326, 0.1683032, -2.993531, 1, 0.8235294, 0, 1,
-1.172923, 0.452812, -0.4425074, 1, 0.827451, 0, 1,
-1.155784, 1.602031, -1.260646, 1, 0.8352941, 0, 1,
-1.151276, -0.9543949, -2.565008, 1, 0.8392157, 0, 1,
-1.150384, -0.3582311, -2.57468, 1, 0.8470588, 0, 1,
-1.149094, 0.9180779, -0.7312223, 1, 0.8509804, 0, 1,
-1.139098, 1.338274, 0.06849391, 1, 0.8588235, 0, 1,
-1.138357, 0.9363598, 0.7560794, 1, 0.8627451, 0, 1,
-1.136307, 0.6547916, -2.077459, 1, 0.8705882, 0, 1,
-1.130606, 1.02658, -0.8862177, 1, 0.8745098, 0, 1,
-1.123698, -1.560118, -3.948732, 1, 0.8823529, 0, 1,
-1.122042, 0.2336089, -3.005841, 1, 0.8862745, 0, 1,
-1.120555, 0.5316707, 0.6790782, 1, 0.8941177, 0, 1,
-1.118315, 0.3024255, -2.623464, 1, 0.8980392, 0, 1,
-1.114023, 0.02586397, -0.6910387, 1, 0.9058824, 0, 1,
-1.108166, 0.8878027, -0.457102, 1, 0.9137255, 0, 1,
-1.105276, 0.3764081, -3.343508, 1, 0.9176471, 0, 1,
-1.101817, 0.3355087, -1.485503, 1, 0.9254902, 0, 1,
-1.096065, -1.833641, -3.981211, 1, 0.9294118, 0, 1,
-1.069884, -0.4546984, -0.3283929, 1, 0.9372549, 0, 1,
-1.068485, -0.2690578, -1.215534, 1, 0.9411765, 0, 1,
-1.068372, 0.1535572, -2.553114, 1, 0.9490196, 0, 1,
-1.05101, 0.01662208, -1.245169, 1, 0.9529412, 0, 1,
-1.04893, 0.6319613, -1.690339, 1, 0.9607843, 0, 1,
-1.045469, -0.9985852, -1.488715, 1, 0.9647059, 0, 1,
-1.038132, 1.658052, -1.821599, 1, 0.972549, 0, 1,
-1.036279, 1.194266, 0.7612465, 1, 0.9764706, 0, 1,
-1.034011, -0.2755744, -1.67592, 1, 0.9843137, 0, 1,
-1.031924, 0.851535, -2.512182, 1, 0.9882353, 0, 1,
-1.031485, -0.4255182, -2.793396, 1, 0.9960784, 0, 1,
-1.02645, -0.6656715, -1.893422, 0.9960784, 1, 0, 1,
-1.025676, -0.1075492, -2.058075, 0.9921569, 1, 0, 1,
-1.025469, 0.3661365, -1.54555, 0.9843137, 1, 0, 1,
-1.023733, 0.5376652, -0.4176125, 0.9803922, 1, 0, 1,
-1.019588, 0.6550837, -0.9747871, 0.972549, 1, 0, 1,
-1.018568, 0.3625728, -2.233008, 0.9686275, 1, 0, 1,
-1.011357, -0.5666203, -0.786448, 0.9607843, 1, 0, 1,
-1.009177, -0.2702163, -0.9426843, 0.9568627, 1, 0, 1,
-1.006887, 0.4015391, -2.161619, 0.9490196, 1, 0, 1,
-1.002794, 0.449436, -0.4827892, 0.945098, 1, 0, 1,
-1.001145, 1.457069, -0.3086655, 0.9372549, 1, 0, 1,
-0.9880316, 0.5407926, -2.232814, 0.9333333, 1, 0, 1,
-0.9875171, 0.7757834, -0.6753067, 0.9254902, 1, 0, 1,
-0.985159, -1.136399, -1.312524, 0.9215686, 1, 0, 1,
-0.9728048, -1.340796, -1.790815, 0.9137255, 1, 0, 1,
-0.9727809, 0.9926145, -0.001574885, 0.9098039, 1, 0, 1,
-0.9725795, -0.9968262, -2.041041, 0.9019608, 1, 0, 1,
-0.9648979, -0.7396048, -1.404191, 0.8941177, 1, 0, 1,
-0.9496031, -0.1046906, -2.203175, 0.8901961, 1, 0, 1,
-0.9492118, 0.4582675, -1.896424, 0.8823529, 1, 0, 1,
-0.9406639, 1.828202, -0.7698897, 0.8784314, 1, 0, 1,
-0.9355673, 0.3079659, -1.224531, 0.8705882, 1, 0, 1,
-0.9324201, 0.4802334, -0.318656, 0.8666667, 1, 0, 1,
-0.9276984, 1.519236, -0.9899282, 0.8588235, 1, 0, 1,
-0.9236768, -0.6009089, -0.8604231, 0.854902, 1, 0, 1,
-0.9227094, -1.518987, -4.877305, 0.8470588, 1, 0, 1,
-0.9224402, -0.1905403, -2.650545, 0.8431373, 1, 0, 1,
-0.9174302, -0.7914395, -4.087549, 0.8352941, 1, 0, 1,
-0.9121181, -1.394725, -2.133715, 0.8313726, 1, 0, 1,
-0.9113438, -0.5288547, -0.8669783, 0.8235294, 1, 0, 1,
-0.9069372, -0.5576947, -3.496531, 0.8196079, 1, 0, 1,
-0.9051788, -1.364098, -1.402078, 0.8117647, 1, 0, 1,
-0.8959709, 1.353108, 1.472539, 0.8078431, 1, 0, 1,
-0.892949, 0.3049591, -1.117015, 0.8, 1, 0, 1,
-0.8881449, -1.187453, -2.661187, 0.7921569, 1, 0, 1,
-0.8870011, -0.4678856, -1.173882, 0.7882353, 1, 0, 1,
-0.8838232, 1.022154, -2.374151, 0.7803922, 1, 0, 1,
-0.8827689, -0.5650648, -3.481208, 0.7764706, 1, 0, 1,
-0.8811254, 0.2213432, -1.006651, 0.7686275, 1, 0, 1,
-0.8733416, 1.439162, -0.6547444, 0.7647059, 1, 0, 1,
-0.8701223, -0.9733851, -3.531987, 0.7568628, 1, 0, 1,
-0.8686742, 0.6471358, -3.069825, 0.7529412, 1, 0, 1,
-0.8634009, -1.417817, -1.498392, 0.7450981, 1, 0, 1,
-0.8617437, -0.09181122, -3.294424, 0.7411765, 1, 0, 1,
-0.8557771, 1.307475, -1.956511, 0.7333333, 1, 0, 1,
-0.8520631, -1.238096, -0.5685059, 0.7294118, 1, 0, 1,
-0.8515625, 0.2688867, -0.9473575, 0.7215686, 1, 0, 1,
-0.8475732, -0.1400175, -2.368053, 0.7176471, 1, 0, 1,
-0.8462735, 0.9813229, -1.689347, 0.7098039, 1, 0, 1,
-0.8448288, -1.529683, -3.028311, 0.7058824, 1, 0, 1,
-0.8417161, 1.144737, -2.602607, 0.6980392, 1, 0, 1,
-0.8410042, 0.3978207, -0.9139211, 0.6901961, 1, 0, 1,
-0.8391097, 0.01211032, -1.361951, 0.6862745, 1, 0, 1,
-0.8358468, -1.605261, -3.937176, 0.6784314, 1, 0, 1,
-0.8316335, -0.2978621, -1.25186, 0.6745098, 1, 0, 1,
-0.8313689, -3.008182, -1.285983, 0.6666667, 1, 0, 1,
-0.8199262, -0.2347178, -1.426761, 0.6627451, 1, 0, 1,
-0.8192539, 0.4342438, -0.6928545, 0.654902, 1, 0, 1,
-0.8174713, 1.266234, -0.3664408, 0.6509804, 1, 0, 1,
-0.8153667, -0.5864434, -0.7428252, 0.6431373, 1, 0, 1,
-0.8083882, -0.4492857, -2.069353, 0.6392157, 1, 0, 1,
-0.8080556, -0.3609017, -3.423496, 0.6313726, 1, 0, 1,
-0.8069584, -0.7263675, -2.518051, 0.627451, 1, 0, 1,
-0.8068259, 2.376496, -0.2226576, 0.6196079, 1, 0, 1,
-0.8058786, 2.038114, -1.237585, 0.6156863, 1, 0, 1,
-0.8034817, 0.7510595, -0.1883968, 0.6078432, 1, 0, 1,
-0.8017775, 0.6912582, -1.308672, 0.6039216, 1, 0, 1,
-0.7952095, -1.151182, -2.159805, 0.5960785, 1, 0, 1,
-0.7925337, -0.396475, -4.011288, 0.5882353, 1, 0, 1,
-0.7897358, 1.67308, -0.6307764, 0.5843138, 1, 0, 1,
-0.7893718, 1.05174, -0.2324832, 0.5764706, 1, 0, 1,
-0.7876255, 0.6208207, -4.298986, 0.572549, 1, 0, 1,
-0.7839303, -0.04642188, -0.05452472, 0.5647059, 1, 0, 1,
-0.7782475, 1.139559, 0.092449, 0.5607843, 1, 0, 1,
-0.7768807, 0.1092179, 0.02895213, 0.5529412, 1, 0, 1,
-0.7677638, -0.874665, -4.459144, 0.5490196, 1, 0, 1,
-0.7610826, -1.541736, -4.513532, 0.5411765, 1, 0, 1,
-0.7570391, 0.6365097, -0.5905813, 0.5372549, 1, 0, 1,
-0.7566912, -1.103686, -2.806328, 0.5294118, 1, 0, 1,
-0.7562331, 0.260728, -1.23751, 0.5254902, 1, 0, 1,
-0.7435234, -1.761015, -3.029194, 0.5176471, 1, 0, 1,
-0.7302344, 0.2759368, -0.9972639, 0.5137255, 1, 0, 1,
-0.7238207, 1.684556, -0.01591824, 0.5058824, 1, 0, 1,
-0.718946, -0.2432827, -3.051481, 0.5019608, 1, 0, 1,
-0.7085139, 1.020395, 0.3043966, 0.4941176, 1, 0, 1,
-0.7068444, -0.2078153, -2.05165, 0.4862745, 1, 0, 1,
-0.7046536, 0.5956441, -1.89669, 0.4823529, 1, 0, 1,
-0.7006791, 1.051483, -0.2714769, 0.4745098, 1, 0, 1,
-0.6985839, -0.7690628, -2.180579, 0.4705882, 1, 0, 1,
-0.698025, -0.8152795, -3.588001, 0.4627451, 1, 0, 1,
-0.6945648, 0.9974287, -2.377769, 0.4588235, 1, 0, 1,
-0.6862352, 0.5533148, 1.26801, 0.4509804, 1, 0, 1,
-0.6793484, 0.2920058, -1.466702, 0.4470588, 1, 0, 1,
-0.6779432, 0.3393267, -0.7932935, 0.4392157, 1, 0, 1,
-0.6754308, 0.6676486, 0.1515127, 0.4352941, 1, 0, 1,
-0.6747418, 0.9127892, -0.96466, 0.427451, 1, 0, 1,
-0.6726228, -1.015237, -0.8713944, 0.4235294, 1, 0, 1,
-0.6714327, 0.09338058, -2.506737, 0.4156863, 1, 0, 1,
-0.6709609, 0.3120961, 0.1831625, 0.4117647, 1, 0, 1,
-0.6688281, 0.5240497, 1.405267, 0.4039216, 1, 0, 1,
-0.6680146, -0.1624567, 0.8238434, 0.3960784, 1, 0, 1,
-0.6670402, 0.318117, 0.1160165, 0.3921569, 1, 0, 1,
-0.663906, 0.685432, 0.4174314, 0.3843137, 1, 0, 1,
-0.6632466, -0.4687864, -0.1621077, 0.3803922, 1, 0, 1,
-0.6620889, -0.8533784, -2.670025, 0.372549, 1, 0, 1,
-0.660866, 1.083024, -0.4952482, 0.3686275, 1, 0, 1,
-0.6587386, -0.03417696, -1.692736, 0.3607843, 1, 0, 1,
-0.6573921, -0.05982243, -1.498139, 0.3568628, 1, 0, 1,
-0.6550847, -0.5842199, -2.396653, 0.3490196, 1, 0, 1,
-0.6506825, -1.301486, -4.779214, 0.345098, 1, 0, 1,
-0.6496356, 0.8360115, -2.151431, 0.3372549, 1, 0, 1,
-0.6492179, -1.400543, -2.572869, 0.3333333, 1, 0, 1,
-0.6467844, -0.9439898, -2.578387, 0.3254902, 1, 0, 1,
-0.6460536, -0.5106105, -2.170866, 0.3215686, 1, 0, 1,
-0.6400344, 0.2433198, -0.6533686, 0.3137255, 1, 0, 1,
-0.6328122, 0.7197426, -0.2914982, 0.3098039, 1, 0, 1,
-0.6267319, -0.2692575, -4.502739, 0.3019608, 1, 0, 1,
-0.6253898, 1.271486, -2.256561, 0.2941177, 1, 0, 1,
-0.6241914, 1.507115, 0.1352427, 0.2901961, 1, 0, 1,
-0.6191995, -1.708814, -1.640737, 0.282353, 1, 0, 1,
-0.6142018, -2.525258, -4.945484, 0.2784314, 1, 0, 1,
-0.612056, 0.2043492, -1.75738, 0.2705882, 1, 0, 1,
-0.6112617, -1.385083, -3.678423, 0.2666667, 1, 0, 1,
-0.6060498, 0.9143028, -1.298078, 0.2588235, 1, 0, 1,
-0.6040406, -0.5494853, -3.494439, 0.254902, 1, 0, 1,
-0.6031606, 0.1240564, -1.206836, 0.2470588, 1, 0, 1,
-0.6022978, 0.6446987, 0.1029158, 0.2431373, 1, 0, 1,
-0.6019527, 0.4277, 1.47558, 0.2352941, 1, 0, 1,
-0.5989041, -1.268282, -3.53717, 0.2313726, 1, 0, 1,
-0.590167, -0.7179091, -2.191216, 0.2235294, 1, 0, 1,
-0.5894791, -0.3535042, -1.611339, 0.2196078, 1, 0, 1,
-0.5846918, -2.898353, -2.941503, 0.2117647, 1, 0, 1,
-0.5846021, -0.8694373, -1.746978, 0.2078431, 1, 0, 1,
-0.576076, 0.976635, -1.649564, 0.2, 1, 0, 1,
-0.566242, 0.3734965, -3.162668, 0.1921569, 1, 0, 1,
-0.5645497, -1.545707, -2.938624, 0.1882353, 1, 0, 1,
-0.5624282, 0.8390723, 1.035634, 0.1803922, 1, 0, 1,
-0.5544869, 0.6126707, -2.804693, 0.1764706, 1, 0, 1,
-0.5488005, 0.7579481, 0.1607853, 0.1686275, 1, 0, 1,
-0.5479733, 0.4318588, 0.1361029, 0.1647059, 1, 0, 1,
-0.5397708, -1.337203, -3.930302, 0.1568628, 1, 0, 1,
-0.5361174, -0.7723224, 0.2145991, 0.1529412, 1, 0, 1,
-0.5344105, 1.738613, 0.530561, 0.145098, 1, 0, 1,
-0.530508, 2.470626, -0.3408828, 0.1411765, 1, 0, 1,
-0.5259694, 0.2558723, -0.664167, 0.1333333, 1, 0, 1,
-0.5259439, 0.1872711, -1.93656, 0.1294118, 1, 0, 1,
-0.5255038, 0.7175885, -0.4571144, 0.1215686, 1, 0, 1,
-0.5249874, 1.072307, 0.01890129, 0.1176471, 1, 0, 1,
-0.5229803, 0.5079102, -2.260046, 0.1098039, 1, 0, 1,
-0.5212186, 0.09177685, -1.820586, 0.1058824, 1, 0, 1,
-0.5194935, -0.6694504, -0.961917, 0.09803922, 1, 0, 1,
-0.5191382, 0.1382701, -1.768193, 0.09019608, 1, 0, 1,
-0.5186899, -0.5999432, -0.9131556, 0.08627451, 1, 0, 1,
-0.5114984, -0.9791634, -2.060961, 0.07843138, 1, 0, 1,
-0.5068372, 1.202951, -0.367829, 0.07450981, 1, 0, 1,
-0.5049453, 0.3356031, -1.386251, 0.06666667, 1, 0, 1,
-0.5022584, 0.1991458, -0.5740494, 0.0627451, 1, 0, 1,
-0.4977122, -0.5408896, -2.24201, 0.05490196, 1, 0, 1,
-0.4946277, 0.1259851, -0.9830648, 0.05098039, 1, 0, 1,
-0.4930935, 0.1097705, -0.313892, 0.04313726, 1, 0, 1,
-0.4930464, -0.5550258, -2.892092, 0.03921569, 1, 0, 1,
-0.4924757, 0.03062024, -2.04062, 0.03137255, 1, 0, 1,
-0.482988, -1.229897, -2.431936, 0.02745098, 1, 0, 1,
-0.4821854, 0.06349181, -1.934582, 0.01960784, 1, 0, 1,
-0.4716104, -0.8209515, -2.439614, 0.01568628, 1, 0, 1,
-0.4692798, -1.127417, -1.434312, 0.007843138, 1, 0, 1,
-0.458197, 1.578644, -0.2168543, 0.003921569, 1, 0, 1,
-0.4514253, -2.225583, -3.530094, 0, 1, 0.003921569, 1,
-0.4489852, -0.3774887, -0.8811988, 0, 1, 0.01176471, 1,
-0.4476491, -1.475082, -4.358712, 0, 1, 0.01568628, 1,
-0.4439438, -0.0614651, -2.133915, 0, 1, 0.02352941, 1,
-0.4439345, -1.368434, -2.48616, 0, 1, 0.02745098, 1,
-0.439738, -0.08058662, -1.522082, 0, 1, 0.03529412, 1,
-0.4393104, -0.4579838, -2.610533, 0, 1, 0.03921569, 1,
-0.4379578, -0.3964647, -1.320983, 0, 1, 0.04705882, 1,
-0.435463, 1.366083, -0.3736511, 0, 1, 0.05098039, 1,
-0.433828, -0.7082641, -3.718699, 0, 1, 0.05882353, 1,
-0.4289742, -1.02905, -2.077399, 0, 1, 0.0627451, 1,
-0.4289173, -0.7652099, -3.56071, 0, 1, 0.07058824, 1,
-0.427287, 0.5007443, -0.9812608, 0, 1, 0.07450981, 1,
-0.4230238, 0.145011, -3.787967, 0, 1, 0.08235294, 1,
-0.4202881, 1.671314, 0.8748944, 0, 1, 0.08627451, 1,
-0.418949, -0.09045045, -1.444196, 0, 1, 0.09411765, 1,
-0.4185534, -0.4810413, -0.877813, 0, 1, 0.1019608, 1,
-0.4161901, -0.659565, -2.872441, 0, 1, 0.1058824, 1,
-0.4157866, -0.4946587, -0.1905249, 0, 1, 0.1137255, 1,
-0.4075826, -1.108844, -2.896635, 0, 1, 0.1176471, 1,
-0.4063658, 1.019355, 0.3191557, 0, 1, 0.1254902, 1,
-0.4063455, -1.022523, -2.825249, 0, 1, 0.1294118, 1,
-0.4061359, 1.091727, 0.4568814, 0, 1, 0.1372549, 1,
-0.4024452, -0.7768604, -2.276925, 0, 1, 0.1411765, 1,
-0.3979437, -1.242078, -2.605222, 0, 1, 0.1490196, 1,
-0.391412, -0.08610778, -2.361983, 0, 1, 0.1529412, 1,
-0.3888938, 0.7348008, -0.5639434, 0, 1, 0.1607843, 1,
-0.3809934, 1.069568, 0.1352069, 0, 1, 0.1647059, 1,
-0.3757494, 0.6818834, -0.3475672, 0, 1, 0.172549, 1,
-0.3729263, 1.468736, -1.168764, 0, 1, 0.1764706, 1,
-0.3720647, 0.1341749, -2.413192, 0, 1, 0.1843137, 1,
-0.369951, 0.8832792, -1.056513, 0, 1, 0.1882353, 1,
-0.367172, 0.4943821, -1.045323, 0, 1, 0.1960784, 1,
-0.3659695, -0.6838484, -3.176925, 0, 1, 0.2039216, 1,
-0.3652379, -0.6403823, -1.944986, 0, 1, 0.2078431, 1,
-0.3652261, 1.257221, -0.8108925, 0, 1, 0.2156863, 1,
-0.3628153, -0.8382811, -2.051301, 0, 1, 0.2196078, 1,
-0.3597085, -0.3312018, -2.076929, 0, 1, 0.227451, 1,
-0.3572015, -0.6978611, -2.178522, 0, 1, 0.2313726, 1,
-0.3528973, 1.670743, 1.024085, 0, 1, 0.2392157, 1,
-0.3512601, 3.15439, 1.329556, 0, 1, 0.2431373, 1,
-0.3479564, -1.147201, -3.722887, 0, 1, 0.2509804, 1,
-0.347346, -0.2840364, -2.067212, 0, 1, 0.254902, 1,
-0.3469159, -0.02872135, -2.104596, 0, 1, 0.2627451, 1,
-0.3461912, -1.586252, -1.708935, 0, 1, 0.2666667, 1,
-0.3430376, -0.2950863, -2.985794, 0, 1, 0.2745098, 1,
-0.3406769, 0.7385602, -1.370432, 0, 1, 0.2784314, 1,
-0.3392427, 0.8693889, -1.092689, 0, 1, 0.2862745, 1,
-0.3375912, -0.06657006, -0.8499547, 0, 1, 0.2901961, 1,
-0.3368298, -0.1739998, -2.795223, 0, 1, 0.2980392, 1,
-0.3342746, -0.3893666, -2.867038, 0, 1, 0.3058824, 1,
-0.333733, 1.038121, -0.3389686, 0, 1, 0.3098039, 1,
-0.3331131, -0.7009285, -1.243587, 0, 1, 0.3176471, 1,
-0.332874, 0.2112596, -2.430896, 0, 1, 0.3215686, 1,
-0.3321809, -0.5509446, -4.091951, 0, 1, 0.3294118, 1,
-0.3264393, -0.7021615, -2.899402, 0, 1, 0.3333333, 1,
-0.3258753, 0.4493937, -2.002833, 0, 1, 0.3411765, 1,
-0.3257056, 2.554817, -1.876765, 0, 1, 0.345098, 1,
-0.3232423, 0.06735744, -1.383171, 0, 1, 0.3529412, 1,
-0.321911, 0.5360577, -0.8591303, 0, 1, 0.3568628, 1,
-0.3167807, -0.2940697, -2.333538, 0, 1, 0.3647059, 1,
-0.3147402, -0.8186753, -1.248802, 0, 1, 0.3686275, 1,
-0.3138704, -0.3640841, -1.817032, 0, 1, 0.3764706, 1,
-0.3128572, 1.866084, 1.230438, 0, 1, 0.3803922, 1,
-0.3112332, 1.650206, 0.8197134, 0, 1, 0.3882353, 1,
-0.3073336, 0.4199227, -1.033014, 0, 1, 0.3921569, 1,
-0.3064523, 0.9588013, -1.027017, 0, 1, 0.4, 1,
-0.3051532, 0.1847689, -0.9238534, 0, 1, 0.4078431, 1,
-0.304231, -0.773927, -1.6808, 0, 1, 0.4117647, 1,
-0.299702, 0.344521, 1.467745, 0, 1, 0.4196078, 1,
-0.2940449, 0.5689585, -0.7778749, 0, 1, 0.4235294, 1,
-0.2910244, -0.4924701, -2.671374, 0, 1, 0.4313726, 1,
-0.2898716, -0.780969, -4.471362, 0, 1, 0.4352941, 1,
-0.289256, 0.007500026, -1.629346, 0, 1, 0.4431373, 1,
-0.2859059, 0.1942882, -0.1947636, 0, 1, 0.4470588, 1,
-0.2850275, -0.6761642, -1.727918, 0, 1, 0.454902, 1,
-0.2849966, 1.246521, 1.88811, 0, 1, 0.4588235, 1,
-0.2828026, -1.87557, -3.063194, 0, 1, 0.4666667, 1,
-0.2803126, 0.3006422, -0.6436838, 0, 1, 0.4705882, 1,
-0.2780074, -0.2169727, -2.681889, 0, 1, 0.4784314, 1,
-0.2716104, 0.174064, -0.3203382, 0, 1, 0.4823529, 1,
-0.2714119, -0.9343011, -3.015693, 0, 1, 0.4901961, 1,
-0.2703867, 1.242955, 1.063798, 0, 1, 0.4941176, 1,
-0.269132, 0.5679602, -1.135075, 0, 1, 0.5019608, 1,
-0.2689398, -0.6641034, -2.697668, 0, 1, 0.509804, 1,
-0.2638018, -1.596205, -3.57995, 0, 1, 0.5137255, 1,
-0.2630731, 0.2101471, -0.4734202, 0, 1, 0.5215687, 1,
-0.2600069, -0.4031197, -2.788061, 0, 1, 0.5254902, 1,
-0.2597717, -1.266085, -4.024355, 0, 1, 0.5333334, 1,
-0.2583241, 1.174173, 0.7272297, 0, 1, 0.5372549, 1,
-0.2580693, -0.9963817, -5.681009, 0, 1, 0.5450981, 1,
-0.256825, -0.2899028, -2.66781, 0, 1, 0.5490196, 1,
-0.2557765, 1.05022, -1.063339, 0, 1, 0.5568628, 1,
-0.2497558, 2.136445, 1.216107, 0, 1, 0.5607843, 1,
-0.246565, -0.750734, -1.869833, 0, 1, 0.5686275, 1,
-0.2460542, 0.8139165, -0.8396541, 0, 1, 0.572549, 1,
-0.2448266, 0.8859208, -0.5686411, 0, 1, 0.5803922, 1,
-0.2431971, 1.271599, 0.7886039, 0, 1, 0.5843138, 1,
-0.2387667, 0.1066126, -1.352322, 0, 1, 0.5921569, 1,
-0.2370616, -0.4953615, -4.520219, 0, 1, 0.5960785, 1,
-0.2344583, -0.8717832, -1.679575, 0, 1, 0.6039216, 1,
-0.2336994, -1.745738, -3.124537, 0, 1, 0.6117647, 1,
-0.2312661, -1.288008, -1.907974, 0, 1, 0.6156863, 1,
-0.2287415, -0.7639397, -1.194596, 0, 1, 0.6235294, 1,
-0.2270758, -0.4693519, -2.2853, 0, 1, 0.627451, 1,
-0.2249769, 0.002638351, -1.094521, 0, 1, 0.6352941, 1,
-0.2242884, -0.5270293, -4.091392, 0, 1, 0.6392157, 1,
-0.2195645, -1.711675, -0.9397985, 0, 1, 0.6470588, 1,
-0.2182338, -0.1211968, -1.250682, 0, 1, 0.6509804, 1,
-0.2172873, -1.261294, -3.43621, 0, 1, 0.6588235, 1,
-0.2165758, 2.181369, -0.1232642, 0, 1, 0.6627451, 1,
-0.2080082, 0.07823835, -0.9466736, 0, 1, 0.6705883, 1,
-0.206475, 1.875084, -0.6363193, 0, 1, 0.6745098, 1,
-0.2063832, -2.047095, -2.938613, 0, 1, 0.682353, 1,
-0.2039603, 0.9010761, -0.7051648, 0, 1, 0.6862745, 1,
-0.202426, -1.415832, -0.6082932, 0, 1, 0.6941177, 1,
-0.2002248, 2.038458, -0.8041073, 0, 1, 0.7019608, 1,
-0.1974882, 0.3802854, 1.254496, 0, 1, 0.7058824, 1,
-0.1974208, 0.7170763, 0.8263065, 0, 1, 0.7137255, 1,
-0.1965774, 0.3512575, 0.005353307, 0, 1, 0.7176471, 1,
-0.1956003, 0.9310528, -0.167915, 0, 1, 0.7254902, 1,
-0.1875338, -0.6810682, -4.102746, 0, 1, 0.7294118, 1,
-0.1852676, 0.2775478, -1.957654, 0, 1, 0.7372549, 1,
-0.1848465, -1.218336, -3.609292, 0, 1, 0.7411765, 1,
-0.1834503, 0.3899942, -1.027233, 0, 1, 0.7490196, 1,
-0.1783278, -2.379592, -3.264382, 0, 1, 0.7529412, 1,
-0.1778819, 1.817305, 0.4505463, 0, 1, 0.7607843, 1,
-0.1717281, -0.9987108, -2.39278, 0, 1, 0.7647059, 1,
-0.1680796, 0.8240578, -0.4109851, 0, 1, 0.772549, 1,
-0.1672219, -0.5064725, -3.651104, 0, 1, 0.7764706, 1,
-0.1610434, -0.1676282, -1.981972, 0, 1, 0.7843137, 1,
-0.1563254, -0.8179058, -1.949438, 0, 1, 0.7882353, 1,
-0.1534698, 0.5409175, -0.6883492, 0, 1, 0.7960784, 1,
-0.1507567, 1.913305, -1.410865, 0, 1, 0.8039216, 1,
-0.1449749, -0.5492852, -2.862289, 0, 1, 0.8078431, 1,
-0.144467, -0.8104265, -3.980467, 0, 1, 0.8156863, 1,
-0.1418037, 0.06306771, 0.3500147, 0, 1, 0.8196079, 1,
-0.1416712, -1.618251, -4.103676, 0, 1, 0.827451, 1,
-0.1413347, 0.2631924, 0.3988685, 0, 1, 0.8313726, 1,
-0.1368318, 0.448994, -1.08164, 0, 1, 0.8392157, 1,
-0.1330063, -0.1195035, -3.291472, 0, 1, 0.8431373, 1,
-0.1295432, -0.9940626, -2.962258, 0, 1, 0.8509804, 1,
-0.1255215, 1.102349, -1.132575, 0, 1, 0.854902, 1,
-0.1250917, 0.8412774, -0.2051629, 0, 1, 0.8627451, 1,
-0.1247732, 0.05365704, -0.9256247, 0, 1, 0.8666667, 1,
-0.1215825, 0.2283211, 0.4314511, 0, 1, 0.8745098, 1,
-0.1196777, 0.3571897, 1.902307, 0, 1, 0.8784314, 1,
-0.1120202, -0.7351465, -3.388413, 0, 1, 0.8862745, 1,
-0.1103864, -1.568402, -3.749447, 0, 1, 0.8901961, 1,
-0.1088828, 0.3339769, 1.39754, 0, 1, 0.8980392, 1,
-0.1031852, 0.5852435, 1.217806, 0, 1, 0.9058824, 1,
-0.1008853, 0.8181956, -1.211657, 0, 1, 0.9098039, 1,
-0.09679791, 1.153645, -0.641411, 0, 1, 0.9176471, 1,
-0.09504506, -0.8778459, -4.154579, 0, 1, 0.9215686, 1,
-0.0945797, -0.5228522, -2.34381, 0, 1, 0.9294118, 1,
-0.09107374, -0.8852036, -3.227118, 0, 1, 0.9333333, 1,
-0.08938172, -1.124291, -2.557807, 0, 1, 0.9411765, 1,
-0.08809362, -1.246644, -4.346225, 0, 1, 0.945098, 1,
-0.08621427, 0.5633399, -1.420206, 0, 1, 0.9529412, 1,
-0.08172236, 0.05340729, -1.676946, 0, 1, 0.9568627, 1,
-0.07921403, -0.5894702, -1.284899, 0, 1, 0.9647059, 1,
-0.07864217, 0.3173512, -1.545459, 0, 1, 0.9686275, 1,
-0.07365391, -1.825969, -1.95978, 0, 1, 0.9764706, 1,
-0.07203332, 0.4398267, 1.505742, 0, 1, 0.9803922, 1,
-0.0671586, 0.518039, 0.9214407, 0, 1, 0.9882353, 1,
-0.0671192, -1.087055, -2.972834, 0, 1, 0.9921569, 1,
-0.0631816, 2.273372, -1.021965, 0, 1, 1, 1,
-0.06178446, -1.128859, -3.42809, 0, 0.9921569, 1, 1,
-0.05987264, -0.7734708, -1.802115, 0, 0.9882353, 1, 1,
-0.05639805, -1.335251, -2.152083, 0, 0.9803922, 1, 1,
-0.05610732, 0.2900795, -1.167394, 0, 0.9764706, 1, 1,
-0.05124238, 0.8731979, -0.0577376, 0, 0.9686275, 1, 1,
-0.0503011, -0.600574, -3.785783, 0, 0.9647059, 1, 1,
-0.04006345, -0.2245039, -4.86688, 0, 0.9568627, 1, 1,
-0.03811097, 0.7956102, -0.3885276, 0, 0.9529412, 1, 1,
-0.03759081, -0.8177441, -3.405046, 0, 0.945098, 1, 1,
-0.03539481, -0.06989072, -3.391782, 0, 0.9411765, 1, 1,
-0.02902378, -1.181256, -4.750014, 0, 0.9333333, 1, 1,
-0.02808957, -0.2261437, -3.924028, 0, 0.9294118, 1, 1,
-0.0280808, 0.9685493, -0.1504901, 0, 0.9215686, 1, 1,
-0.02793628, -1.395878, -4.347413, 0, 0.9176471, 1, 1,
-0.02756565, 0.3288715, -0.7925537, 0, 0.9098039, 1, 1,
-0.02470774, 2.11497, -0.5568818, 0, 0.9058824, 1, 1,
-0.02359872, 1.367872, -0.0464433, 0, 0.8980392, 1, 1,
-0.02303821, -1.825523, -2.548365, 0, 0.8901961, 1, 1,
-0.01886047, -0.2803338, -1.895926, 0, 0.8862745, 1, 1,
-0.01550191, -0.7080649, -3.878692, 0, 0.8784314, 1, 1,
-0.01492199, 1.986003, 0.2840568, 0, 0.8745098, 1, 1,
-0.0147761, 0.08267082, -0.2392517, 0, 0.8666667, 1, 1,
-0.01303993, -0.6297038, -2.581563, 0, 0.8627451, 1, 1,
-0.01039351, 0.5124398, 0.02309543, 0, 0.854902, 1, 1,
-0.006350519, -0.5455693, -3.703507, 0, 0.8509804, 1, 1,
-0.004201125, 0.2727824, -0.8475905, 0, 0.8431373, 1, 1,
-0.002344008, 1.689913, 0.5112485, 0, 0.8392157, 1, 1,
-0.0009993997, -1.569897, -4.276604, 0, 0.8313726, 1, 1,
0.007515763, 0.08893175, -0.1291435, 0, 0.827451, 1, 1,
0.007815097, -1.710441, 3.530411, 0, 0.8196079, 1, 1,
0.00913259, 0.6267373, -0.377555, 0, 0.8156863, 1, 1,
0.01007586, -0.7938567, 1.821405, 0, 0.8078431, 1, 1,
0.01107711, -0.3450303, 2.949799, 0, 0.8039216, 1, 1,
0.01211986, 1.14989, 1.903231, 0, 0.7960784, 1, 1,
0.01357499, -1.807491, 2.692899, 0, 0.7882353, 1, 1,
0.01529886, 0.6017746, -0.7043174, 0, 0.7843137, 1, 1,
0.01662847, 0.3947444, -0.4127954, 0, 0.7764706, 1, 1,
0.01743134, 0.5790916, -0.3553817, 0, 0.772549, 1, 1,
0.02912552, 0.5802357, -1.655091, 0, 0.7647059, 1, 1,
0.02963031, -0.4470741, 4.619927, 0, 0.7607843, 1, 1,
0.02991227, -0.4905833, 0.6392743, 0, 0.7529412, 1, 1,
0.03034808, -0.1677713, 3.364605, 0, 0.7490196, 1, 1,
0.03328266, -0.3539795, 2.875225, 0, 0.7411765, 1, 1,
0.03612238, -0.1696059, 2.528296, 0, 0.7372549, 1, 1,
0.0373356, -0.05430596, 2.915581, 0, 0.7294118, 1, 1,
0.03954135, 0.4392175, 1.544423, 0, 0.7254902, 1, 1,
0.0433629, -1.145112, 3.349146, 0, 0.7176471, 1, 1,
0.04534039, 0.4470389, 0.4581916, 0, 0.7137255, 1, 1,
0.04787254, 0.5976293, 0.05281764, 0, 0.7058824, 1, 1,
0.04995109, -0.4441873, 1.996542, 0, 0.6980392, 1, 1,
0.0541136, -0.1269981, 3.883007, 0, 0.6941177, 1, 1,
0.05670004, 0.5424185, 0.6589569, 0, 0.6862745, 1, 1,
0.05720304, -1.094101, 3.088163, 0, 0.682353, 1, 1,
0.06025013, 1.486204, -1.255089, 0, 0.6745098, 1, 1,
0.06500489, -0.9519042, 2.985155, 0, 0.6705883, 1, 1,
0.06685419, 0.2326793, -0.6825138, 0, 0.6627451, 1, 1,
0.06721463, -0.1657973, 4.326725, 0, 0.6588235, 1, 1,
0.07054748, -1.724841, 3.142684, 0, 0.6509804, 1, 1,
0.0711564, 0.7568902, 1.092203, 0, 0.6470588, 1, 1,
0.07181977, -1.293294, 4.298665, 0, 0.6392157, 1, 1,
0.08068128, 0.7727314, -1.394783, 0, 0.6352941, 1, 1,
0.08359079, 0.1991287, 1.117236, 0, 0.627451, 1, 1,
0.08529273, 0.4388263, -0.2123286, 0, 0.6235294, 1, 1,
0.08930572, -1.096465, 3.718338, 0, 0.6156863, 1, 1,
0.09177125, -2.085282, 4.97022, 0, 0.6117647, 1, 1,
0.0989709, 0.01103998, 1.006868, 0, 0.6039216, 1, 1,
0.1110387, 0.8692393, -0.1182572, 0, 0.5960785, 1, 1,
0.111656, -0.8551706, 2.044602, 0, 0.5921569, 1, 1,
0.1137186, 1.151981, 0.05561147, 0, 0.5843138, 1, 1,
0.1138435, -0.3319088, 3.51771, 0, 0.5803922, 1, 1,
0.1155529, 0.5182503, 0.04465553, 0, 0.572549, 1, 1,
0.1167837, -0.3710254, 1.947636, 0, 0.5686275, 1, 1,
0.1175441, -1.184269, 1.161056, 0, 0.5607843, 1, 1,
0.1192673, -1.763364, 3.592562, 0, 0.5568628, 1, 1,
0.1236463, -0.054621, 3.212016, 0, 0.5490196, 1, 1,
0.1261035, -0.7652587, 3.653665, 0, 0.5450981, 1, 1,
0.1279714, 0.05772819, 0.6553867, 0, 0.5372549, 1, 1,
0.137323, -0.4567602, 4.324078, 0, 0.5333334, 1, 1,
0.139503, 0.2127202, 0.3956085, 0, 0.5254902, 1, 1,
0.141461, -0.6036607, 2.18634, 0, 0.5215687, 1, 1,
0.1435772, -1.7668, 2.806061, 0, 0.5137255, 1, 1,
0.1471107, -0.9254603, 3.07622, 0, 0.509804, 1, 1,
0.147732, -0.4370508, 3.012191, 0, 0.5019608, 1, 1,
0.1508216, -1.719867, 2.52837, 0, 0.4941176, 1, 1,
0.15089, 0.5046528, 1.564052, 0, 0.4901961, 1, 1,
0.1528822, -0.208344, 1.830803, 0, 0.4823529, 1, 1,
0.1546624, -0.2741959, 1.518289, 0, 0.4784314, 1, 1,
0.1553705, -0.0546609, 2.453734, 0, 0.4705882, 1, 1,
0.1608749, -1.280957, 2.197773, 0, 0.4666667, 1, 1,
0.1624848, 1.092609, 1.537763, 0, 0.4588235, 1, 1,
0.1644127, -1.954464, 3.307716, 0, 0.454902, 1, 1,
0.1691072, 0.009761579, 1.013503, 0, 0.4470588, 1, 1,
0.1745272, 0.03615075, 0.4407514, 0, 0.4431373, 1, 1,
0.1826153, 0.172621, 0.8523295, 0, 0.4352941, 1, 1,
0.1901285, -0.3487239, 3.919083, 0, 0.4313726, 1, 1,
0.1929331, 0.5601543, -0.2884788, 0, 0.4235294, 1, 1,
0.1959523, 0.958813, -0.1444821, 0, 0.4196078, 1, 1,
0.1970999, 0.310469, 1.088368, 0, 0.4117647, 1, 1,
0.204701, -0.2841872, 2.154277, 0, 0.4078431, 1, 1,
0.2068146, -0.6568369, 3.951531, 0, 0.4, 1, 1,
0.207303, -0.01754006, 2.672237, 0, 0.3921569, 1, 1,
0.2079301, -0.1551045, 1.373631, 0, 0.3882353, 1, 1,
0.2100416, 0.1607433, 2.707943, 0, 0.3803922, 1, 1,
0.2132212, 0.5894025, 0.5771137, 0, 0.3764706, 1, 1,
0.2166982, 1.457802, 0.2612313, 0, 0.3686275, 1, 1,
0.2171607, 1.551093, 1.004961, 0, 0.3647059, 1, 1,
0.2173537, 0.2764522, 0.33194, 0, 0.3568628, 1, 1,
0.2215374, -1.005873, 4.020262, 0, 0.3529412, 1, 1,
0.2227224, -0.1124522, 1.879105, 0, 0.345098, 1, 1,
0.2267938, 0.156284, 0.1365826, 0, 0.3411765, 1, 1,
0.2268987, -0.8097116, 2.733733, 0, 0.3333333, 1, 1,
0.2274901, -0.7962572, 4.432957, 0, 0.3294118, 1, 1,
0.2277869, 0.03557106, 1.056281, 0, 0.3215686, 1, 1,
0.2328165, -1.031631, 4.469553, 0, 0.3176471, 1, 1,
0.236333, 0.4461973, 0.4747018, 0, 0.3098039, 1, 1,
0.2385807, 0.6875392, 0.2921798, 0, 0.3058824, 1, 1,
0.2386889, 0.7541928, -1.240249, 0, 0.2980392, 1, 1,
0.2426476, -0.708536, 2.471178, 0, 0.2901961, 1, 1,
0.2463245, -0.5184283, 2.073559, 0, 0.2862745, 1, 1,
0.2471251, 0.8306079, -0.6870474, 0, 0.2784314, 1, 1,
0.2476957, -0.4773057, 3.897037, 0, 0.2745098, 1, 1,
0.2485571, 1.122756, 0.02933609, 0, 0.2666667, 1, 1,
0.2567613, 0.003111624, 1.948995, 0, 0.2627451, 1, 1,
0.2571132, -0.8838205, 3.222274, 0, 0.254902, 1, 1,
0.2592719, 0.5343571, -0.2965674, 0, 0.2509804, 1, 1,
0.2597665, -1.192703, 2.90103, 0, 0.2431373, 1, 1,
0.2635697, -0.4438975, 2.535888, 0, 0.2392157, 1, 1,
0.266771, 0.3574875, 0.1878434, 0, 0.2313726, 1, 1,
0.2681287, 0.2361743, 0.1208093, 0, 0.227451, 1, 1,
0.2700348, 0.7348536, 1.015615, 0, 0.2196078, 1, 1,
0.273645, -0.8725934, 0.998528, 0, 0.2156863, 1, 1,
0.2762268, -0.8676004, 3.479209, 0, 0.2078431, 1, 1,
0.2780144, 2.032259, 0.003718321, 0, 0.2039216, 1, 1,
0.2786512, -0.2033635, 0.4418624, 0, 0.1960784, 1, 1,
0.2810551, 0.9172614, 0.6284031, 0, 0.1882353, 1, 1,
0.282254, -1.105565, 3.198901, 0, 0.1843137, 1, 1,
0.2834538, -0.5293573, 2.694443, 0, 0.1764706, 1, 1,
0.2873872, -1.171742, 1.495301, 0, 0.172549, 1, 1,
0.2882863, -0.4484985, 2.702059, 0, 0.1647059, 1, 1,
0.2906896, -1.637159, 2.978324, 0, 0.1607843, 1, 1,
0.2927515, -1.06624, 2.869179, 0, 0.1529412, 1, 1,
0.2947187, 0.02472382, 1.232758, 0, 0.1490196, 1, 1,
0.2963865, -1.329661, 1.707038, 0, 0.1411765, 1, 1,
0.2975149, 0.5004348, 2.293528, 0, 0.1372549, 1, 1,
0.3029359, -0.6594135, 2.821691, 0, 0.1294118, 1, 1,
0.3058015, 1.160903, 2.18114, 0, 0.1254902, 1, 1,
0.3124434, -2.826333, 4.717913, 0, 0.1176471, 1, 1,
0.3174708, 0.151767, 0.8093957, 0, 0.1137255, 1, 1,
0.3201522, -0.4262775, 1.991842, 0, 0.1058824, 1, 1,
0.3225838, 0.05014803, 0.5723784, 0, 0.09803922, 1, 1,
0.323112, -0.2445628, 2.4376, 0, 0.09411765, 1, 1,
0.323745, -0.791113, 2.754287, 0, 0.08627451, 1, 1,
0.3314968, 1.727243, -0.4498933, 0, 0.08235294, 1, 1,
0.3374995, -0.6646864, 1.455727, 0, 0.07450981, 1, 1,
0.338267, 0.5988994, 1.65307, 0, 0.07058824, 1, 1,
0.3411093, -0.126868, 2.279553, 0, 0.0627451, 1, 1,
0.3447255, 1.574669, 0.001407219, 0, 0.05882353, 1, 1,
0.3483022, -0.8434318, 2.902731, 0, 0.05098039, 1, 1,
0.3497792, -0.3658867, 1.510141, 0, 0.04705882, 1, 1,
0.351569, -0.1321634, 0.653547, 0, 0.03921569, 1, 1,
0.352557, -0.7836035, 3.873353, 0, 0.03529412, 1, 1,
0.3639061, -1.787821, 2.492241, 0, 0.02745098, 1, 1,
0.3679132, -0.6166256, 2.474348, 0, 0.02352941, 1, 1,
0.3810835, 0.1878795, 2.795624, 0, 0.01568628, 1, 1,
0.3845751, 0.8803094, 0.2456359, 0, 0.01176471, 1, 1,
0.3872291, -0.3645777, 3.71684, 0, 0.003921569, 1, 1,
0.3881057, 1.312652, 1.449908, 0.003921569, 0, 1, 1,
0.3891694, -0.3109881, 0.865786, 0.007843138, 0, 1, 1,
0.3891742, 0.6180478, 0.2769425, 0.01568628, 0, 1, 1,
0.3961821, 1.034058, 0.5587056, 0.01960784, 0, 1, 1,
0.3983967, 0.8628939, -0.6536865, 0.02745098, 0, 1, 1,
0.4026983, 2.146227, -0.5085199, 0.03137255, 0, 1, 1,
0.4051743, 0.3208327, 0.004069199, 0.03921569, 0, 1, 1,
0.4058048, 1.359294, 0.8026324, 0.04313726, 0, 1, 1,
0.4088583, 0.0758336, 2.980926, 0.05098039, 0, 1, 1,
0.4111872, -0.9177328, 4.24403, 0.05490196, 0, 1, 1,
0.4114706, 0.006432918, 2.24177, 0.0627451, 0, 1, 1,
0.414124, -0.09461276, 2.548118, 0.06666667, 0, 1, 1,
0.4146448, -0.3135173, 1.424488, 0.07450981, 0, 1, 1,
0.4228101, -0.1327436, 2.664259, 0.07843138, 0, 1, 1,
0.4246063, -1.096708, 3.270601, 0.08627451, 0, 1, 1,
0.4269421, -0.516229, 1.053369, 0.09019608, 0, 1, 1,
0.4324879, 0.6590593, 1.077566, 0.09803922, 0, 1, 1,
0.4370302, 1.469735, -0.7687497, 0.1058824, 0, 1, 1,
0.4404613, 2.151603, -0.8644087, 0.1098039, 0, 1, 1,
0.4458658, 0.6136286, -1.177156, 0.1176471, 0, 1, 1,
0.446756, -2.209856, 3.717051, 0.1215686, 0, 1, 1,
0.4475347, -0.556746, 1.986635, 0.1294118, 0, 1, 1,
0.4541465, -2.106215, 1.628248, 0.1333333, 0, 1, 1,
0.4551118, 1.09676, 1.272782, 0.1411765, 0, 1, 1,
0.4602719, 0.7148954, 1.256274, 0.145098, 0, 1, 1,
0.4659228, 1.29567, -1.163548, 0.1529412, 0, 1, 1,
0.4683898, 0.3566545, -0.02892285, 0.1568628, 0, 1, 1,
0.468566, 1.022329, 1.696231, 0.1647059, 0, 1, 1,
0.4701223, 0.658888, 0.5345669, 0.1686275, 0, 1, 1,
0.4702536, 0.3066591, 1.542377, 0.1764706, 0, 1, 1,
0.4723389, 1.12783, 0.3303126, 0.1803922, 0, 1, 1,
0.4741485, -0.3894975, 3.166446, 0.1882353, 0, 1, 1,
0.4809381, -0.5569946, 2.055083, 0.1921569, 0, 1, 1,
0.4836225, -0.5191395, 2.748311, 0.2, 0, 1, 1,
0.4853308, 1.308805, -0.9093891, 0.2078431, 0, 1, 1,
0.4859166, -0.9581797, 2.196771, 0.2117647, 0, 1, 1,
0.4920521, 0.6530325, -0.02679104, 0.2196078, 0, 1, 1,
0.5002103, 1.053422, 0.1356145, 0.2235294, 0, 1, 1,
0.5049501, 0.1742721, 2.275464, 0.2313726, 0, 1, 1,
0.5059429, 1.352563, -0.2615668, 0.2352941, 0, 1, 1,
0.5141341, -0.8064775, 4.375892, 0.2431373, 0, 1, 1,
0.5170066, 0.5701523, 1.730564, 0.2470588, 0, 1, 1,
0.518704, -0.3070309, 3.613047, 0.254902, 0, 1, 1,
0.5223241, 1.360038, -0.2516359, 0.2588235, 0, 1, 1,
0.5301125, 1.07787, -0.863479, 0.2666667, 0, 1, 1,
0.5380186, -0.5484809, 2.814438, 0.2705882, 0, 1, 1,
0.5417694, 0.7682544, 0.9488469, 0.2784314, 0, 1, 1,
0.542174, -0.6252974, 4.044027, 0.282353, 0, 1, 1,
0.5428045, -0.0737697, 1.185885, 0.2901961, 0, 1, 1,
0.5448927, 0.9190024, -0.05309485, 0.2941177, 0, 1, 1,
0.545734, -1.388094, 4.254906, 0.3019608, 0, 1, 1,
0.5468782, -0.7855583, 2.243857, 0.3098039, 0, 1, 1,
0.5479524, 0.06789332, 3.039072, 0.3137255, 0, 1, 1,
0.5522118, -0.6790642, 3.631411, 0.3215686, 0, 1, 1,
0.5546673, 0.4937978, 1.478344, 0.3254902, 0, 1, 1,
0.5548277, -0.2515044, 0.8685209, 0.3333333, 0, 1, 1,
0.5567617, 1.667141, -0.8806123, 0.3372549, 0, 1, 1,
0.563365, 0.4506426, 0.2263564, 0.345098, 0, 1, 1,
0.5660576, -0.3913592, 2.31549, 0.3490196, 0, 1, 1,
0.5686547, 1.908384, 0.4352837, 0.3568628, 0, 1, 1,
0.5740821, 0.8557124, 2.849691, 0.3607843, 0, 1, 1,
0.5745203, 0.2653483, 0.6432881, 0.3686275, 0, 1, 1,
0.5902815, -0.8871946, 3.108342, 0.372549, 0, 1, 1,
0.5909103, -0.6432083, 2.210532, 0.3803922, 0, 1, 1,
0.5996907, -0.8809956, 4.350742, 0.3843137, 0, 1, 1,
0.6013451, 0.3194352, 0.1680941, 0.3921569, 0, 1, 1,
0.603245, -0.6382982, 3.655501, 0.3960784, 0, 1, 1,
0.6045295, -2.434052, 1.656662, 0.4039216, 0, 1, 1,
0.6064541, -1.572392, 2.640571, 0.4117647, 0, 1, 1,
0.6100028, 1.295029, -0.122207, 0.4156863, 0, 1, 1,
0.6100467, 0.0753466, 2.888412, 0.4235294, 0, 1, 1,
0.6117929, 0.6823311, -0.09657911, 0.427451, 0, 1, 1,
0.6131359, 1.324125, -0.7803252, 0.4352941, 0, 1, 1,
0.6147826, 0.2725993, 1.704158, 0.4392157, 0, 1, 1,
0.6156121, 2.635691, 1.474397, 0.4470588, 0, 1, 1,
0.6198491, -0.4055701, 1.174918, 0.4509804, 0, 1, 1,
0.6217429, -0.36669, 1.787073, 0.4588235, 0, 1, 1,
0.6220739, 0.4390944, 1.342483, 0.4627451, 0, 1, 1,
0.6248889, -0.1894466, 2.837751, 0.4705882, 0, 1, 1,
0.6293669, -0.7157827, 0.9767021, 0.4745098, 0, 1, 1,
0.6294891, 1.154095, -0.8605667, 0.4823529, 0, 1, 1,
0.6331524, -1.933011, 1.969871, 0.4862745, 0, 1, 1,
0.6332666, -0.4363, 4.245903, 0.4941176, 0, 1, 1,
0.6354731, -0.401012, 2.140918, 0.5019608, 0, 1, 1,
0.6363453, -0.8177547, 1.266475, 0.5058824, 0, 1, 1,
0.6386375, -0.2502547, 3.267918, 0.5137255, 0, 1, 1,
0.6393958, 0.07455681, 3.901264, 0.5176471, 0, 1, 1,
0.6396689, 1.218816, 1.343933, 0.5254902, 0, 1, 1,
0.6416563, -1.470967, 4.012006, 0.5294118, 0, 1, 1,
0.6460027, -0.4773842, 2.953302, 0.5372549, 0, 1, 1,
0.6497465, 0.0625724, -0.0824541, 0.5411765, 0, 1, 1,
0.6505001, 1.048426, 0.6134092, 0.5490196, 0, 1, 1,
0.6523073, 0.9223583, 0.5991985, 0.5529412, 0, 1, 1,
0.6556289, -1.601722, 3.663691, 0.5607843, 0, 1, 1,
0.6649012, 1.71108, -1.355697, 0.5647059, 0, 1, 1,
0.6668894, -2.69635, 3.214251, 0.572549, 0, 1, 1,
0.6671308, 1.613224, 0.3910351, 0.5764706, 0, 1, 1,
0.6698894, -0.06788675, 0.2410482, 0.5843138, 0, 1, 1,
0.6723216, -1.239266, 2.281302, 0.5882353, 0, 1, 1,
0.6764025, 1.586495, -0.3665094, 0.5960785, 0, 1, 1,
0.6821738, -1.973862, 2.732543, 0.6039216, 0, 1, 1,
0.6930806, 0.01408076, 2.329399, 0.6078432, 0, 1, 1,
0.7034238, 0.09554188, 1.226105, 0.6156863, 0, 1, 1,
0.7115484, 2.644755, 1.129737, 0.6196079, 0, 1, 1,
0.713755, 0.8291768, 0.4998697, 0.627451, 0, 1, 1,
0.7163782, 0.2605479, 0.5623036, 0.6313726, 0, 1, 1,
0.7171704, 0.7473205, 1.22967, 0.6392157, 0, 1, 1,
0.7213844, 0.6813913, 0.4257433, 0.6431373, 0, 1, 1,
0.7220652, -0.4079015, 2.911574, 0.6509804, 0, 1, 1,
0.7256699, -1.252486, 2.355594, 0.654902, 0, 1, 1,
0.7284867, 1.214562, -1.646881, 0.6627451, 0, 1, 1,
0.7317337, -0.6612052, 2.055221, 0.6666667, 0, 1, 1,
0.7352058, -1.172866, 4.4088, 0.6745098, 0, 1, 1,
0.7407588, -0.2270034, 2.433344, 0.6784314, 0, 1, 1,
0.7459043, -1.336994, 4.398232, 0.6862745, 0, 1, 1,
0.7496545, 0.6551886, -0.7337916, 0.6901961, 0, 1, 1,
0.7550781, -0.5617425, 4.620696, 0.6980392, 0, 1, 1,
0.7603545, -1.192591, 3.432543, 0.7058824, 0, 1, 1,
0.7617792, 0.1705637, 3.073971, 0.7098039, 0, 1, 1,
0.7624959, 0.6643594, 0.2994862, 0.7176471, 0, 1, 1,
0.7629859, -1.104826, 2.034463, 0.7215686, 0, 1, 1,
0.7639453, 1.471391, 1.189326, 0.7294118, 0, 1, 1,
0.7705566, 0.3440716, 0.6345106, 0.7333333, 0, 1, 1,
0.7735003, -0.676957, 3.913208, 0.7411765, 0, 1, 1,
0.7760623, 0.1478532, 1.17966, 0.7450981, 0, 1, 1,
0.7791705, 0.7807556, -0.005020464, 0.7529412, 0, 1, 1,
0.7809922, -1.176824, 1.989535, 0.7568628, 0, 1, 1,
0.7839251, -0.7667258, 2.367768, 0.7647059, 0, 1, 1,
0.7890093, 0.03929408, 2.126354, 0.7686275, 0, 1, 1,
0.7919098, 0.068069, 1.192548, 0.7764706, 0, 1, 1,
0.7967166, 0.1541362, 1.806476, 0.7803922, 0, 1, 1,
0.8083079, 0.6428095, 1.370018, 0.7882353, 0, 1, 1,
0.816399, -0.7083131, 3.770866, 0.7921569, 0, 1, 1,
0.8200276, 0.3413137, -0.3182375, 0.8, 0, 1, 1,
0.8210545, -0.3416671, 3.363063, 0.8078431, 0, 1, 1,
0.8217439, -0.2376526, 2.7937, 0.8117647, 0, 1, 1,
0.8225375, -1.395553, 0.9091957, 0.8196079, 0, 1, 1,
0.8253962, 1.088248, 0.9999912, 0.8235294, 0, 1, 1,
0.8254724, 0.9645266, 0.4018085, 0.8313726, 0, 1, 1,
0.827301, -2.927287, 2.598336, 0.8352941, 0, 1, 1,
0.828979, 0.1177889, 0.6982532, 0.8431373, 0, 1, 1,
0.8314485, 0.5466923, 2.219419, 0.8470588, 0, 1, 1,
0.8393057, 1.394478, 0.2857786, 0.854902, 0, 1, 1,
0.8469733, 1.201854, -0.2111796, 0.8588235, 0, 1, 1,
0.8491468, 0.2725304, -0.9064178, 0.8666667, 0, 1, 1,
0.8544347, -1.784969, 2.368386, 0.8705882, 0, 1, 1,
0.8772399, -1.373583, 3.030048, 0.8784314, 0, 1, 1,
0.8775834, -0.396684, 1.653394, 0.8823529, 0, 1, 1,
0.8782496, -0.8341604, 3.292456, 0.8901961, 0, 1, 1,
0.8787056, 1.015425, 1.651509, 0.8941177, 0, 1, 1,
0.8796168, 0.7771616, -0.5208492, 0.9019608, 0, 1, 1,
0.8808963, -0.8187399, 1.762802, 0.9098039, 0, 1, 1,
0.8828404, -0.1106377, 1.015674, 0.9137255, 0, 1, 1,
0.8935446, 1.268929, 1.809268, 0.9215686, 0, 1, 1,
0.8949712, -1.138179, 1.663965, 0.9254902, 0, 1, 1,
0.9022651, -0.3405258, 1.666272, 0.9333333, 0, 1, 1,
0.9056575, 1.596231, 0.002434338, 0.9372549, 0, 1, 1,
0.905671, 1.049108, 1.215479, 0.945098, 0, 1, 1,
0.9122478, -2.07317, 2.557338, 0.9490196, 0, 1, 1,
0.9123354, 0.3702374, 2.213531, 0.9568627, 0, 1, 1,
0.9150686, -1.078573, 2.394815, 0.9607843, 0, 1, 1,
0.9171031, -1.096374, 4.80012, 0.9686275, 0, 1, 1,
0.9177527, 1.97695, 1.096502, 0.972549, 0, 1, 1,
0.9219046, 0.1899998, 1.096368, 0.9803922, 0, 1, 1,
0.926998, 0.6433849, 1.164219, 0.9843137, 0, 1, 1,
0.933615, 0.1064401, 1.501683, 0.9921569, 0, 1, 1,
0.9406789, 0.343859, 1.944525, 0.9960784, 0, 1, 1,
0.9442358, -0.6997351, 2.434498, 1, 0, 0.9960784, 1,
0.9497992, -0.1069716, 2.893109, 1, 0, 0.9882353, 1,
0.9500415, -0.907871, 2.789855, 1, 0, 0.9843137, 1,
0.9570654, 1.169627, 1.182518, 1, 0, 0.9764706, 1,
0.96482, -0.9683656, 1.900092, 1, 0, 0.972549, 1,
0.9707004, -1.559146, 2.81686, 1, 0, 0.9647059, 1,
0.9719946, 0.2568413, 2.32026, 1, 0, 0.9607843, 1,
0.9737366, -0.1134312, 3.004642, 1, 0, 0.9529412, 1,
0.9902053, 0.7278344, 1.002403, 1, 0, 0.9490196, 1,
0.9907118, 1.532737, 0.8626001, 1, 0, 0.9411765, 1,
0.9913945, -0.5192779, 2.458545, 1, 0, 0.9372549, 1,
0.992925, 0.61029, 0.6763898, 1, 0, 0.9294118, 1,
0.9983103, -0.01919961, 2.175262, 1, 0, 0.9254902, 1,
1.015507, 0.8335659, 0.5519594, 1, 0, 0.9176471, 1,
1.024076, 0.2917528, 2.407329, 1, 0, 0.9137255, 1,
1.033518, 0.9082419, 1.775467, 1, 0, 0.9058824, 1,
1.033855, -0.5531109, 3.155309, 1, 0, 0.9019608, 1,
1.034291, -0.2944825, 2.398156, 1, 0, 0.8941177, 1,
1.037929, 1.532731, 0.5241512, 1, 0, 0.8862745, 1,
1.043777, 0.8900845, 0.7495151, 1, 0, 0.8823529, 1,
1.048733, 0.3079518, 1.125623, 1, 0, 0.8745098, 1,
1.067779, -0.8713003, 3.379818, 1, 0, 0.8705882, 1,
1.070706, -1.22824, 1.167788, 1, 0, 0.8627451, 1,
1.070718, 1.209961, 2.338089, 1, 0, 0.8588235, 1,
1.081314, 0.08450385, 1.415916, 1, 0, 0.8509804, 1,
1.085182, 0.7394031, 2.205371, 1, 0, 0.8470588, 1,
1.086186, 0.6378748, 0.9849387, 1, 0, 0.8392157, 1,
1.088149, 1.184085, 2.596395, 1, 0, 0.8352941, 1,
1.090159, -0.182115, 2.841738, 1, 0, 0.827451, 1,
1.096113, -0.5320002, 3.535046, 1, 0, 0.8235294, 1,
1.103078, 1.487913, 0.2528976, 1, 0, 0.8156863, 1,
1.109923, -1.312248, 1.603185, 1, 0, 0.8117647, 1,
1.110681, 0.3278987, 1.846741, 1, 0, 0.8039216, 1,
1.117795, -0.7875374, 2.436423, 1, 0, 0.7960784, 1,
1.120189, -0.5203699, 2.674949, 1, 0, 0.7921569, 1,
1.121266, -1.064255, 1.835445, 1, 0, 0.7843137, 1,
1.121499, 0.553836, 2.73869, 1, 0, 0.7803922, 1,
1.122195, -0.0805532, 0.5867805, 1, 0, 0.772549, 1,
1.134738, 0.07250883, 0.5784087, 1, 0, 0.7686275, 1,
1.135687, -0.2754543, 1.020324, 1, 0, 0.7607843, 1,
1.13909, -2.337224, 4.251573, 1, 0, 0.7568628, 1,
1.140659, -1.527544, 3.074977, 1, 0, 0.7490196, 1,
1.141911, -0.4500035, 2.166803, 1, 0, 0.7450981, 1,
1.141926, 0.2232746, 0.9245942, 1, 0, 0.7372549, 1,
1.144939, -0.2486279, 2.507778, 1, 0, 0.7333333, 1,
1.148044, -0.4741394, 2.406646, 1, 0, 0.7254902, 1,
1.157424, 0.7546363, 1.036354, 1, 0, 0.7215686, 1,
1.158237, -1.640226, 1.902153, 1, 0, 0.7137255, 1,
1.160081, -0.8632551, 1.089303, 1, 0, 0.7098039, 1,
1.16668, -0.197119, 1.948057, 1, 0, 0.7019608, 1,
1.168356, 0.348446, 1.774571, 1, 0, 0.6941177, 1,
1.173841, -0.7970321, 1.84532, 1, 0, 0.6901961, 1,
1.183026, 1.05217, 1.724149, 1, 0, 0.682353, 1,
1.184669, -1.588442, 2.448538, 1, 0, 0.6784314, 1,
1.187635, -1.439857, -0.09383927, 1, 0, 0.6705883, 1,
1.189395, -1.233986, 1.64065, 1, 0, 0.6666667, 1,
1.189556, 0.3376825, 0.6309552, 1, 0, 0.6588235, 1,
1.219189, -0.4657803, 2.363888, 1, 0, 0.654902, 1,
1.222327, 0.8344744, 1.099943, 1, 0, 0.6470588, 1,
1.222743, 1.426782, 1.479745, 1, 0, 0.6431373, 1,
1.227484, 0.3124048, 1.077545, 1, 0, 0.6352941, 1,
1.235184, -0.513689, 0.5622708, 1, 0, 0.6313726, 1,
1.238252, -0.01423437, 2.62394, 1, 0, 0.6235294, 1,
1.244547, 0.7161213, 2.073252, 1, 0, 0.6196079, 1,
1.244569, -0.7868791, 2.030228, 1, 0, 0.6117647, 1,
1.245837, 0.6538622, 2.950927, 1, 0, 0.6078432, 1,
1.249166, -0.5826537, 1.46335, 1, 0, 0.6, 1,
1.259279, -0.3186105, 3.485348, 1, 0, 0.5921569, 1,
1.263442, 3.032307, 0.6345307, 1, 0, 0.5882353, 1,
1.268794, 0.09082612, 1.015493, 1, 0, 0.5803922, 1,
1.269397, 0.7974004, -0.6341094, 1, 0, 0.5764706, 1,
1.271576, 0.1317467, 1.169511, 1, 0, 0.5686275, 1,
1.271993, 0.3147231, 0.3763291, 1, 0, 0.5647059, 1,
1.2772, 0.5397521, 3.825583, 1, 0, 0.5568628, 1,
1.277686, 0.06969671, 1.797468, 1, 0, 0.5529412, 1,
1.281644, 0.3062674, 1.548961, 1, 0, 0.5450981, 1,
1.290894, 0.7105794, 0.2905773, 1, 0, 0.5411765, 1,
1.293799, -0.04177223, 0.08568935, 1, 0, 0.5333334, 1,
1.305543, 0.4394319, -0.06261235, 1, 0, 0.5294118, 1,
1.311971, 0.8058274, 2.834279, 1, 0, 0.5215687, 1,
1.314452, 1.020357, 1.102971, 1, 0, 0.5176471, 1,
1.315867, -0.7913325, 2.847293, 1, 0, 0.509804, 1,
1.32273, -1.132129, 2.458848, 1, 0, 0.5058824, 1,
1.32681, 0.4357375, 0.3316785, 1, 0, 0.4980392, 1,
1.330094, 0.05753795, 2.646458, 1, 0, 0.4901961, 1,
1.336926, -1.590697, 2.643381, 1, 0, 0.4862745, 1,
1.342112, 1.503096, 0.6084142, 1, 0, 0.4784314, 1,
1.344026, 2.193029, 0.3303421, 1, 0, 0.4745098, 1,
1.353705, -1.039509, 3.827327, 1, 0, 0.4666667, 1,
1.369024, -0.9210404, 1.537969, 1, 0, 0.4627451, 1,
1.37427, 0.9548172, 1.725426, 1, 0, 0.454902, 1,
1.379707, 0.328096, 1.369879, 1, 0, 0.4509804, 1,
1.398067, -0.2145432, 0.3055566, 1, 0, 0.4431373, 1,
1.401942, -0.4127314, 2.627512, 1, 0, 0.4392157, 1,
1.40408, -0.003449128, -0.7036791, 1, 0, 0.4313726, 1,
1.409051, 0.8762532, 1.60391, 1, 0, 0.427451, 1,
1.415327, -1.281228, 2.204097, 1, 0, 0.4196078, 1,
1.445632, 2.074658, 1.039584, 1, 0, 0.4156863, 1,
1.461387, -0.5511116, 3.262097, 1, 0, 0.4078431, 1,
1.463569, -0.5626282, 2.43024, 1, 0, 0.4039216, 1,
1.469524, -0.06758714, 0.6907852, 1, 0, 0.3960784, 1,
1.490746, 0.4768532, 2.229147, 1, 0, 0.3882353, 1,
1.490836, -0.5482059, -1.196786, 1, 0, 0.3843137, 1,
1.490962, 0.4119604, -1.459088, 1, 0, 0.3764706, 1,
1.4947, -1.22592, 2.105941, 1, 0, 0.372549, 1,
1.498732, -0.03864605, 2.630701, 1, 0, 0.3647059, 1,
1.501056, 3.055286, -0.2059436, 1, 0, 0.3607843, 1,
1.510174, -0.6733693, 1.383287, 1, 0, 0.3529412, 1,
1.514972, 0.728187, -0.5528238, 1, 0, 0.3490196, 1,
1.526768, 0.1953233, 3.325011, 1, 0, 0.3411765, 1,
1.544816, 1.979352, 2.209123, 1, 0, 0.3372549, 1,
1.558132, -1.492914, 2.504147, 1, 0, 0.3294118, 1,
1.561273, -0.2873012, 2.435305, 1, 0, 0.3254902, 1,
1.575616, 0.3479509, 1.630761, 1, 0, 0.3176471, 1,
1.582415, 0.7022802, 1.602472, 1, 0, 0.3137255, 1,
1.588077, -1.914718, 2.305277, 1, 0, 0.3058824, 1,
1.6001, 0.04455429, 2.385368, 1, 0, 0.2980392, 1,
1.605864, 0.7243626, 1.868809, 1, 0, 0.2941177, 1,
1.609159, -0.3505829, 2.991843, 1, 0, 0.2862745, 1,
1.619489, -1.151925, -0.1834159, 1, 0, 0.282353, 1,
1.625895, -0.5992076, 2.165704, 1, 0, 0.2745098, 1,
1.631273, -0.2150986, 0.1438209, 1, 0, 0.2705882, 1,
1.639223, 0.443004, 0.3748917, 1, 0, 0.2627451, 1,
1.661389, -0.8255503, 1.430867, 1, 0, 0.2588235, 1,
1.678567, -1.243875, 2.395831, 1, 0, 0.2509804, 1,
1.689529, -0.3886379, -0.02963264, 1, 0, 0.2470588, 1,
1.705471, 1.391276, 3.077388, 1, 0, 0.2392157, 1,
1.70812, -1.025818, 1.659527, 1, 0, 0.2352941, 1,
1.726964, -0.493804, 1.628811, 1, 0, 0.227451, 1,
1.72708, 0.5593387, 1.108544, 1, 0, 0.2235294, 1,
1.747616, 0.06969531, 3.198498, 1, 0, 0.2156863, 1,
1.775538, -0.2526907, 1.64432, 1, 0, 0.2117647, 1,
1.777929, 0.9117061, 0.05058841, 1, 0, 0.2039216, 1,
1.786622, -0.1757389, 3.352375, 1, 0, 0.1960784, 1,
1.803557, 0.9705631, 1.45227, 1, 0, 0.1921569, 1,
1.866301, 0.298342, 1.933228, 1, 0, 0.1843137, 1,
1.872554, 0.7426404, 0.9703946, 1, 0, 0.1803922, 1,
1.877287, -0.9311346, 1.616724, 1, 0, 0.172549, 1,
1.904244, 0.06420247, 1.307767, 1, 0, 0.1686275, 1,
1.909058, 2.690374, 0.8325317, 1, 0, 0.1607843, 1,
1.913257, 1.247319, 1.916513, 1, 0, 0.1568628, 1,
1.933108, -1.485721, 1.378522, 1, 0, 0.1490196, 1,
1.944601, 0.5680864, 0.2467607, 1, 0, 0.145098, 1,
1.954552, 1.728951, 1.331461, 1, 0, 0.1372549, 1,
1.958651, 0.6734228, 0.6214418, 1, 0, 0.1333333, 1,
1.960743, -0.8898857, 0.8978025, 1, 0, 0.1254902, 1,
1.973983, 0.886274, 0.2692112, 1, 0, 0.1215686, 1,
2.001406, -1.765267, 4.616085, 1, 0, 0.1137255, 1,
2.016412, -1.836857, 2.284611, 1, 0, 0.1098039, 1,
2.03988, 2.164177, -0.235942, 1, 0, 0.1019608, 1,
2.059038, 1.575423, 0.9524317, 1, 0, 0.09411765, 1,
2.079248, -1.415167, 1.620763, 1, 0, 0.09019608, 1,
2.11422, 1.415801, 2.17873, 1, 0, 0.08235294, 1,
2.16714, -0.7283649, 1.199271, 1, 0, 0.07843138, 1,
2.17061, -0.2463171, 1.723608, 1, 0, 0.07058824, 1,
2.208132, 0.7645786, 0.05381836, 1, 0, 0.06666667, 1,
2.214771, -1.057492, 1.960064, 1, 0, 0.05882353, 1,
2.315257, -1.517169, 0.5523658, 1, 0, 0.05490196, 1,
2.334229, 1.93361, 0.5936719, 1, 0, 0.04705882, 1,
2.385286, -0.1776466, 1.670523, 1, 0, 0.04313726, 1,
2.473318, -0.5134338, 1.078862, 1, 0, 0.03529412, 1,
2.883825, 0.1188448, -0.6425878, 1, 0, 0.03137255, 1,
2.890574, 0.5912601, 1.421563, 1, 0, 0.02352941, 1,
2.896081, -1.237229, 0.9354396, 1, 0, 0.01960784, 1,
3.251484, 0.02121521, 0.1324396, 1, 0, 0.01176471, 1,
3.431848, -1.99617, 4.985429, 1, 0, 0.007843138, 1
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
0.158661, -4.052738, -7.488971, 0, -0.5, 0.5, 0.5,
0.158661, -4.052738, -7.488971, 1, -0.5, 0.5, 0.5,
0.158661, -4.052738, -7.488971, 1, 1.5, 0.5, 0.5,
0.158661, -4.052738, -7.488971, 0, 1.5, 0.5, 0.5
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
-4.224136, 0.07310414, -7.488971, 0, -0.5, 0.5, 0.5,
-4.224136, 0.07310414, -7.488971, 1, -0.5, 0.5, 0.5,
-4.224136, 0.07310414, -7.488971, 1, 1.5, 0.5, 0.5,
-4.224136, 0.07310414, -7.488971, 0, 1.5, 0.5, 0.5
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
-4.224136, -4.052738, -0.34779, 0, -0.5, 0.5, 0.5,
-4.224136, -4.052738, -0.34779, 1, -0.5, 0.5, 0.5,
-4.224136, -4.052738, -0.34779, 1, 1.5, 0.5, 0.5,
-4.224136, -4.052738, -0.34779, 0, 1.5, 0.5, 0.5
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
-3, -3.100621, -5.841006,
3, -3.100621, -5.841006,
-3, -3.100621, -5.841006,
-3, -3.259307, -6.115667,
-2, -3.100621, -5.841006,
-2, -3.259307, -6.115667,
-1, -3.100621, -5.841006,
-1, -3.259307, -6.115667,
0, -3.100621, -5.841006,
0, -3.259307, -6.115667,
1, -3.100621, -5.841006,
1, -3.259307, -6.115667,
2, -3.100621, -5.841006,
2, -3.259307, -6.115667,
3, -3.100621, -5.841006,
3, -3.259307, -6.115667
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
-3, -3.576679, -6.664988, 0, -0.5, 0.5, 0.5,
-3, -3.576679, -6.664988, 1, -0.5, 0.5, 0.5,
-3, -3.576679, -6.664988, 1, 1.5, 0.5, 0.5,
-3, -3.576679, -6.664988, 0, 1.5, 0.5, 0.5,
-2, -3.576679, -6.664988, 0, -0.5, 0.5, 0.5,
-2, -3.576679, -6.664988, 1, -0.5, 0.5, 0.5,
-2, -3.576679, -6.664988, 1, 1.5, 0.5, 0.5,
-2, -3.576679, -6.664988, 0, 1.5, 0.5, 0.5,
-1, -3.576679, -6.664988, 0, -0.5, 0.5, 0.5,
-1, -3.576679, -6.664988, 1, -0.5, 0.5, 0.5,
-1, -3.576679, -6.664988, 1, 1.5, 0.5, 0.5,
-1, -3.576679, -6.664988, 0, 1.5, 0.5, 0.5,
0, -3.576679, -6.664988, 0, -0.5, 0.5, 0.5,
0, -3.576679, -6.664988, 1, -0.5, 0.5, 0.5,
0, -3.576679, -6.664988, 1, 1.5, 0.5, 0.5,
0, -3.576679, -6.664988, 0, 1.5, 0.5, 0.5,
1, -3.576679, -6.664988, 0, -0.5, 0.5, 0.5,
1, -3.576679, -6.664988, 1, -0.5, 0.5, 0.5,
1, -3.576679, -6.664988, 1, 1.5, 0.5, 0.5,
1, -3.576679, -6.664988, 0, 1.5, 0.5, 0.5,
2, -3.576679, -6.664988, 0, -0.5, 0.5, 0.5,
2, -3.576679, -6.664988, 1, -0.5, 0.5, 0.5,
2, -3.576679, -6.664988, 1, 1.5, 0.5, 0.5,
2, -3.576679, -6.664988, 0, 1.5, 0.5, 0.5,
3, -3.576679, -6.664988, 0, -0.5, 0.5, 0.5,
3, -3.576679, -6.664988, 1, -0.5, 0.5, 0.5,
3, -3.576679, -6.664988, 1, 1.5, 0.5, 0.5,
3, -3.576679, -6.664988, 0, 1.5, 0.5, 0.5
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
-3.212722, -3, -5.841006,
-3.212722, 3, -5.841006,
-3.212722, -3, -5.841006,
-3.381291, -3, -6.115667,
-3.212722, -2, -5.841006,
-3.381291, -2, -6.115667,
-3.212722, -1, -5.841006,
-3.381291, -1, -6.115667,
-3.212722, 0, -5.841006,
-3.381291, 0, -6.115667,
-3.212722, 1, -5.841006,
-3.381291, 1, -6.115667,
-3.212722, 2, -5.841006,
-3.381291, 2, -6.115667,
-3.212722, 3, -5.841006,
-3.381291, 3, -6.115667
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
-3.718429, -3, -6.664988, 0, -0.5, 0.5, 0.5,
-3.718429, -3, -6.664988, 1, -0.5, 0.5, 0.5,
-3.718429, -3, -6.664988, 1, 1.5, 0.5, 0.5,
-3.718429, -3, -6.664988, 0, 1.5, 0.5, 0.5,
-3.718429, -2, -6.664988, 0, -0.5, 0.5, 0.5,
-3.718429, -2, -6.664988, 1, -0.5, 0.5, 0.5,
-3.718429, -2, -6.664988, 1, 1.5, 0.5, 0.5,
-3.718429, -2, -6.664988, 0, 1.5, 0.5, 0.5,
-3.718429, -1, -6.664988, 0, -0.5, 0.5, 0.5,
-3.718429, -1, -6.664988, 1, -0.5, 0.5, 0.5,
-3.718429, -1, -6.664988, 1, 1.5, 0.5, 0.5,
-3.718429, -1, -6.664988, 0, 1.5, 0.5, 0.5,
-3.718429, 0, -6.664988, 0, -0.5, 0.5, 0.5,
-3.718429, 0, -6.664988, 1, -0.5, 0.5, 0.5,
-3.718429, 0, -6.664988, 1, 1.5, 0.5, 0.5,
-3.718429, 0, -6.664988, 0, 1.5, 0.5, 0.5,
-3.718429, 1, -6.664988, 0, -0.5, 0.5, 0.5,
-3.718429, 1, -6.664988, 1, -0.5, 0.5, 0.5,
-3.718429, 1, -6.664988, 1, 1.5, 0.5, 0.5,
-3.718429, 1, -6.664988, 0, 1.5, 0.5, 0.5,
-3.718429, 2, -6.664988, 0, -0.5, 0.5, 0.5,
-3.718429, 2, -6.664988, 1, -0.5, 0.5, 0.5,
-3.718429, 2, -6.664988, 1, 1.5, 0.5, 0.5,
-3.718429, 2, -6.664988, 0, 1.5, 0.5, 0.5,
-3.718429, 3, -6.664988, 0, -0.5, 0.5, 0.5,
-3.718429, 3, -6.664988, 1, -0.5, 0.5, 0.5,
-3.718429, 3, -6.664988, 1, 1.5, 0.5, 0.5,
-3.718429, 3, -6.664988, 0, 1.5, 0.5, 0.5
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
-3.212722, -3.100621, -4,
-3.212722, -3.100621, 4,
-3.212722, -3.100621, -4,
-3.381291, -3.259307, -4,
-3.212722, -3.100621, -2,
-3.381291, -3.259307, -2,
-3.212722, -3.100621, 0,
-3.381291, -3.259307, 0,
-3.212722, -3.100621, 2,
-3.381291, -3.259307, 2,
-3.212722, -3.100621, 4,
-3.381291, -3.259307, 4
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
-3.718429, -3.576679, -4, 0, -0.5, 0.5, 0.5,
-3.718429, -3.576679, -4, 1, -0.5, 0.5, 0.5,
-3.718429, -3.576679, -4, 1, 1.5, 0.5, 0.5,
-3.718429, -3.576679, -4, 0, 1.5, 0.5, 0.5,
-3.718429, -3.576679, -2, 0, -0.5, 0.5, 0.5,
-3.718429, -3.576679, -2, 1, -0.5, 0.5, 0.5,
-3.718429, -3.576679, -2, 1, 1.5, 0.5, 0.5,
-3.718429, -3.576679, -2, 0, 1.5, 0.5, 0.5,
-3.718429, -3.576679, 0, 0, -0.5, 0.5, 0.5,
-3.718429, -3.576679, 0, 1, -0.5, 0.5, 0.5,
-3.718429, -3.576679, 0, 1, 1.5, 0.5, 0.5,
-3.718429, -3.576679, 0, 0, 1.5, 0.5, 0.5,
-3.718429, -3.576679, 2, 0, -0.5, 0.5, 0.5,
-3.718429, -3.576679, 2, 1, -0.5, 0.5, 0.5,
-3.718429, -3.576679, 2, 1, 1.5, 0.5, 0.5,
-3.718429, -3.576679, 2, 0, 1.5, 0.5, 0.5,
-3.718429, -3.576679, 4, 0, -0.5, 0.5, 0.5,
-3.718429, -3.576679, 4, 1, -0.5, 0.5, 0.5,
-3.718429, -3.576679, 4, 1, 1.5, 0.5, 0.5,
-3.718429, -3.576679, 4, 0, 1.5, 0.5, 0.5
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
-3.212722, -3.100621, -5.841006,
-3.212722, 3.246829, -5.841006,
-3.212722, -3.100621, 5.145426,
-3.212722, 3.246829, 5.145426,
-3.212722, -3.100621, -5.841006,
-3.212722, -3.100621, 5.145426,
-3.212722, 3.246829, -5.841006,
-3.212722, 3.246829, 5.145426,
-3.212722, -3.100621, -5.841006,
3.530044, -3.100621, -5.841006,
-3.212722, -3.100621, 5.145426,
3.530044, -3.100621, 5.145426,
-3.212722, 3.246829, -5.841006,
3.530044, 3.246829, -5.841006,
-3.212722, 3.246829, 5.145426,
3.530044, 3.246829, 5.145426,
3.530044, -3.100621, -5.841006,
3.530044, 3.246829, -5.841006,
3.530044, -3.100621, 5.145426,
3.530044, 3.246829, 5.145426,
3.530044, -3.100621, -5.841006,
3.530044, -3.100621, 5.145426,
3.530044, 3.246829, -5.841006,
3.530044, 3.246829, 5.145426
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
var radius = 7.672554;
var distance = 34.13606;
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
mvMatrix.translate( -0.158661, -0.07310414, 0.34779 );
mvMatrix.scale( 1.230314, 1.306937, 0.7550873 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.13606);
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
MPMC<-read.table("MPMC.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-MPMC$V2
```

```
## Error in eval(expr, envir, enclos): object 'MPMC' not found
```

```r
y<-MPMC$V3
```

```
## Error in eval(expr, envir, enclos): object 'MPMC' not found
```

```r
z<-MPMC$V4
```

```
## Error in eval(expr, envir, enclos): object 'MPMC' not found
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
-3.114526, -0.2493635, -3.296487, 0, 0, 1, 1, 1,
-2.852781, -1.981883, -2.35575, 1, 0, 0, 1, 1,
-2.818939, -0.5278878, -0.5613381, 1, 0, 0, 1, 1,
-2.732533, 0.6540807, -1.069024, 1, 0, 0, 1, 1,
-2.597736, -1.14987, -2.230404, 1, 0, 0, 1, 1,
-2.419946, -0.1775189, -1.879326, 1, 0, 0, 1, 1,
-2.389128, -1.51097, -1.242983, 0, 0, 0, 1, 1,
-2.384535, 0.1153614, -1.832341, 0, 0, 0, 1, 1,
-2.372325, 1.159592, -2.270651, 0, 0, 0, 1, 1,
-2.361753, 0.1009086, -1.231337, 0, 0, 0, 1, 1,
-2.320274, -1.805932, -0.3834734, 0, 0, 0, 1, 1,
-2.234664, -0.3729711, -1.946085, 0, 0, 0, 1, 1,
-2.225507, -0.2753461, -1.353224, 0, 0, 0, 1, 1,
-2.222102, -1.171392, -3.331483, 1, 1, 1, 1, 1,
-2.195224, 0.9041085, -0.918228, 1, 1, 1, 1, 1,
-2.153936, 1.270216, 1.036978, 1, 1, 1, 1, 1,
-2.129703, -0.6459934, -2.261139, 1, 1, 1, 1, 1,
-2.111926, 0.3158711, -2.238998, 1, 1, 1, 1, 1,
-2.102858, -0.7452939, -0.8872972, 1, 1, 1, 1, 1,
-2.095716, 0.2287584, -1.166528, 1, 1, 1, 1, 1,
-2.074431, 0.6327497, -0.01165801, 1, 1, 1, 1, 1,
-2.054045, 0.8019707, -1.40311, 1, 1, 1, 1, 1,
-2.031426, 0.2320924, 0.03902706, 1, 1, 1, 1, 1,
-2.020677, -0.8133368, -1.513315, 1, 1, 1, 1, 1,
-2.019678, 0.3638521, -0.5718042, 1, 1, 1, 1, 1,
-2.011135, -0.4806995, -2.020355, 1, 1, 1, 1, 1,
-1.99694, -0.4266373, -2.892082, 1, 1, 1, 1, 1,
-1.987892, -1.682022, -2.775743, 1, 1, 1, 1, 1,
-1.974823, 0.9073063, -1.615519, 0, 0, 1, 1, 1,
-1.972788, -1.48456, -4.550695, 1, 0, 0, 1, 1,
-1.963054, -0.3238006, -2.534363, 1, 0, 0, 1, 1,
-1.944427, 0.7602308, -1.512395, 1, 0, 0, 1, 1,
-1.942248, -2.399727, -1.719817, 1, 0, 0, 1, 1,
-1.936912, -0.5907871, -0.6066658, 1, 0, 0, 1, 1,
-1.931625, -1.381533, -0.1133898, 0, 0, 0, 1, 1,
-1.931334, -0.4378324, -1.708398, 0, 0, 0, 1, 1,
-1.928296, -1.239808, -2.824299, 0, 0, 0, 1, 1,
-1.908516, -0.0241843, -2.786067, 0, 0, 0, 1, 1,
-1.900281, -1.742407, 0.5981195, 0, 0, 0, 1, 1,
-1.865366, 0.6783224, -2.829426, 0, 0, 0, 1, 1,
-1.854861, -0.3000439, -2.155473, 0, 0, 0, 1, 1,
-1.842744, -0.804855, -2.050848, 1, 1, 1, 1, 1,
-1.842266, -0.01998445, -2.006972, 1, 1, 1, 1, 1,
-1.826102, -0.4386391, -2.581503, 1, 1, 1, 1, 1,
-1.81661, 0.09954356, -1.629266, 1, 1, 1, 1, 1,
-1.807111, -1.507194, -3.770759, 1, 1, 1, 1, 1,
-1.802147, 0.123461, -2.041896, 1, 1, 1, 1, 1,
-1.800358, -0.136539, -2.398661, 1, 1, 1, 1, 1,
-1.798781, -1.387207, -2.256783, 1, 1, 1, 1, 1,
-1.790067, 0.08782319, -2.267124, 1, 1, 1, 1, 1,
-1.783868, 1.578617, 0.08754326, 1, 1, 1, 1, 1,
-1.783443, -0.8681287, -1.176944, 1, 1, 1, 1, 1,
-1.764567, -1.4049, -0.5811554, 1, 1, 1, 1, 1,
-1.753882, -0.6684762, -2.082757, 1, 1, 1, 1, 1,
-1.7448, -0.3109073, -1.76956, 1, 1, 1, 1, 1,
-1.721208, -0.9992228, -1.800395, 1, 1, 1, 1, 1,
-1.719238, 1.863398, -1.603072, 0, 0, 1, 1, 1,
-1.715805, 0.6250713, -1.85061, 1, 0, 0, 1, 1,
-1.715487, 1.697302, -0.02013236, 1, 0, 0, 1, 1,
-1.71373, 0.6373891, 0.1264618, 1, 0, 0, 1, 1,
-1.695725, -0.6595758, -2.952875, 1, 0, 0, 1, 1,
-1.694133, 0.345017, -0.588947, 1, 0, 0, 1, 1,
-1.686111, 3.063928, 0.6194727, 0, 0, 0, 1, 1,
-1.684298, 0.3848439, -1.058847, 0, 0, 0, 1, 1,
-1.677333, 0.407486, -1.913991, 0, 0, 0, 1, 1,
-1.676128, -1.399601, -2.157045, 0, 0, 0, 1, 1,
-1.669589, 1.272235, 0.03162413, 0, 0, 0, 1, 1,
-1.669388, 0.5324306, -1.005457, 0, 0, 0, 1, 1,
-1.663129, 0.3360462, -0.7553638, 0, 0, 0, 1, 1,
-1.656265, -1.433936, -2.25028, 1, 1, 1, 1, 1,
-1.651827, -0.5023149, -1.206928, 1, 1, 1, 1, 1,
-1.651323, 0.5473145, -2.168284, 1, 1, 1, 1, 1,
-1.637332, 0.09147822, -2.960617, 1, 1, 1, 1, 1,
-1.621478, 1.345021, 0.0906424, 1, 1, 1, 1, 1,
-1.618676, -0.0234709, -1.320985, 1, 1, 1, 1, 1,
-1.599616, 1.614143, -0.483981, 1, 1, 1, 1, 1,
-1.598939, -0.01388798, -2.397208, 1, 1, 1, 1, 1,
-1.591078, -0.7387592, -3.207091, 1, 1, 1, 1, 1,
-1.587646, -1.154155, -1.982911, 1, 1, 1, 1, 1,
-1.585942, -0.989381, -1.175145, 1, 1, 1, 1, 1,
-1.579331, 1.951073, 0.9596999, 1, 1, 1, 1, 1,
-1.578401, -0.762165, -2.375264, 1, 1, 1, 1, 1,
-1.549511, 0.1070012, -1.314883, 1, 1, 1, 1, 1,
-1.544412, 0.5543652, -0.9647023, 1, 1, 1, 1, 1,
-1.538132, -1.132461, -3.541192, 0, 0, 1, 1, 1,
-1.533902, 0.7137887, -0.560173, 1, 0, 0, 1, 1,
-1.502861, -1.487115, -1.102065, 1, 0, 0, 1, 1,
-1.500568, 0.8424811, -1.72922, 1, 0, 0, 1, 1,
-1.491451, 1.036456, -1.735523, 1, 0, 0, 1, 1,
-1.479064, 0.5689819, 1.681127, 1, 0, 0, 1, 1,
-1.468897, -1.680986, -2.360133, 0, 0, 0, 1, 1,
-1.45791, -0.1741674, -2.952195, 0, 0, 0, 1, 1,
-1.456132, 0.248627, -2.264409, 0, 0, 0, 1, 1,
-1.455325, 0.9528108, -0.8275552, 0, 0, 0, 1, 1,
-1.448129, 1.13889, -0.6551744, 0, 0, 0, 1, 1,
-1.447844, 0.2305561, -1.13097, 0, 0, 0, 1, 1,
-1.434356, 0.7968513, -2.211765, 0, 0, 0, 1, 1,
-1.430603, 0.7162713, -1.899698, 1, 1, 1, 1, 1,
-1.420393, -1.259623, -1.540101, 1, 1, 1, 1, 1,
-1.408324, -1.097321, -1.173103, 1, 1, 1, 1, 1,
-1.397706, -0.7457057, -2.317253, 1, 1, 1, 1, 1,
-1.397517, 0.9829531, -2.196913, 1, 1, 1, 1, 1,
-1.394101, -0.2582201, -2.470523, 1, 1, 1, 1, 1,
-1.378263, 0.8854584, -1.019302, 1, 1, 1, 1, 1,
-1.365898, 1.029537, -0.02113956, 1, 1, 1, 1, 1,
-1.363613, 3.001866, -0.7928965, 1, 1, 1, 1, 1,
-1.35869, -1.652371, -3.051289, 1, 1, 1, 1, 1,
-1.357965, 1.581077, -0.7444386, 1, 1, 1, 1, 1,
-1.351505, -1.997824, -2.585841, 1, 1, 1, 1, 1,
-1.338291, -0.5453755, -1.225492, 1, 1, 1, 1, 1,
-1.333996, 1.30185, -2.661176, 1, 1, 1, 1, 1,
-1.332963, 1.475773, -0.8190181, 1, 1, 1, 1, 1,
-1.329542, -1.602746, -2.558975, 0, 0, 1, 1, 1,
-1.328806, -1.5595, -5.297578, 1, 0, 0, 1, 1,
-1.321413, 0.3771246, -0.908567, 1, 0, 0, 1, 1,
-1.315785, -0.6986441, -2.359435, 1, 0, 0, 1, 1,
-1.313012, 1.953345, 0.7053072, 1, 0, 0, 1, 1,
-1.308464, -2.144127, -2.83145, 1, 0, 0, 1, 1,
-1.300577, -1.438596, -1.039653, 0, 0, 0, 1, 1,
-1.291567, 1.859761, -0.6103514, 0, 0, 0, 1, 1,
-1.290678, 0.1153684, -2.252542, 0, 0, 0, 1, 1,
-1.288593, -0.650054, -2.018259, 0, 0, 0, 1, 1,
-1.271157, -0.6835456, -2.377653, 0, 0, 0, 1, 1,
-1.268985, -0.2937638, -1.296605, 0, 0, 0, 1, 1,
-1.266884, 0.2119052, -0.4652194, 0, 0, 0, 1, 1,
-1.260864, -0.26534, -1.113015, 1, 1, 1, 1, 1,
-1.256571, -0.6646536, -2.371331, 1, 1, 1, 1, 1,
-1.246295, -0.7970906, -0.3047304, 1, 1, 1, 1, 1,
-1.245705, -1.415165, -3.237875, 1, 1, 1, 1, 1,
-1.234297, -1.653862, -2.950437, 1, 1, 1, 1, 1,
-1.234221, 1.111724, -0.3483309, 1, 1, 1, 1, 1,
-1.219026, -1.380653, -2.545458, 1, 1, 1, 1, 1,
-1.216533, 0.2027795, -1.279665, 1, 1, 1, 1, 1,
-1.206375, -1.42855, -1.394681, 1, 1, 1, 1, 1,
-1.198159, -1.079536, -1.635013, 1, 1, 1, 1, 1,
-1.196779, 0.09496641, -0.5326427, 1, 1, 1, 1, 1,
-1.193805, 0.4637343, -1.59586, 1, 1, 1, 1, 1,
-1.187326, 0.1683032, -2.993531, 1, 1, 1, 1, 1,
-1.172923, 0.452812, -0.4425074, 1, 1, 1, 1, 1,
-1.155784, 1.602031, -1.260646, 1, 1, 1, 1, 1,
-1.151276, -0.9543949, -2.565008, 0, 0, 1, 1, 1,
-1.150384, -0.3582311, -2.57468, 1, 0, 0, 1, 1,
-1.149094, 0.9180779, -0.7312223, 1, 0, 0, 1, 1,
-1.139098, 1.338274, 0.06849391, 1, 0, 0, 1, 1,
-1.138357, 0.9363598, 0.7560794, 1, 0, 0, 1, 1,
-1.136307, 0.6547916, -2.077459, 1, 0, 0, 1, 1,
-1.130606, 1.02658, -0.8862177, 0, 0, 0, 1, 1,
-1.123698, -1.560118, -3.948732, 0, 0, 0, 1, 1,
-1.122042, 0.2336089, -3.005841, 0, 0, 0, 1, 1,
-1.120555, 0.5316707, 0.6790782, 0, 0, 0, 1, 1,
-1.118315, 0.3024255, -2.623464, 0, 0, 0, 1, 1,
-1.114023, 0.02586397, -0.6910387, 0, 0, 0, 1, 1,
-1.108166, 0.8878027, -0.457102, 0, 0, 0, 1, 1,
-1.105276, 0.3764081, -3.343508, 1, 1, 1, 1, 1,
-1.101817, 0.3355087, -1.485503, 1, 1, 1, 1, 1,
-1.096065, -1.833641, -3.981211, 1, 1, 1, 1, 1,
-1.069884, -0.4546984, -0.3283929, 1, 1, 1, 1, 1,
-1.068485, -0.2690578, -1.215534, 1, 1, 1, 1, 1,
-1.068372, 0.1535572, -2.553114, 1, 1, 1, 1, 1,
-1.05101, 0.01662208, -1.245169, 1, 1, 1, 1, 1,
-1.04893, 0.6319613, -1.690339, 1, 1, 1, 1, 1,
-1.045469, -0.9985852, -1.488715, 1, 1, 1, 1, 1,
-1.038132, 1.658052, -1.821599, 1, 1, 1, 1, 1,
-1.036279, 1.194266, 0.7612465, 1, 1, 1, 1, 1,
-1.034011, -0.2755744, -1.67592, 1, 1, 1, 1, 1,
-1.031924, 0.851535, -2.512182, 1, 1, 1, 1, 1,
-1.031485, -0.4255182, -2.793396, 1, 1, 1, 1, 1,
-1.02645, -0.6656715, -1.893422, 1, 1, 1, 1, 1,
-1.025676, -0.1075492, -2.058075, 0, 0, 1, 1, 1,
-1.025469, 0.3661365, -1.54555, 1, 0, 0, 1, 1,
-1.023733, 0.5376652, -0.4176125, 1, 0, 0, 1, 1,
-1.019588, 0.6550837, -0.9747871, 1, 0, 0, 1, 1,
-1.018568, 0.3625728, -2.233008, 1, 0, 0, 1, 1,
-1.011357, -0.5666203, -0.786448, 1, 0, 0, 1, 1,
-1.009177, -0.2702163, -0.9426843, 0, 0, 0, 1, 1,
-1.006887, 0.4015391, -2.161619, 0, 0, 0, 1, 1,
-1.002794, 0.449436, -0.4827892, 0, 0, 0, 1, 1,
-1.001145, 1.457069, -0.3086655, 0, 0, 0, 1, 1,
-0.9880316, 0.5407926, -2.232814, 0, 0, 0, 1, 1,
-0.9875171, 0.7757834, -0.6753067, 0, 0, 0, 1, 1,
-0.985159, -1.136399, -1.312524, 0, 0, 0, 1, 1,
-0.9728048, -1.340796, -1.790815, 1, 1, 1, 1, 1,
-0.9727809, 0.9926145, -0.001574885, 1, 1, 1, 1, 1,
-0.9725795, -0.9968262, -2.041041, 1, 1, 1, 1, 1,
-0.9648979, -0.7396048, -1.404191, 1, 1, 1, 1, 1,
-0.9496031, -0.1046906, -2.203175, 1, 1, 1, 1, 1,
-0.9492118, 0.4582675, -1.896424, 1, 1, 1, 1, 1,
-0.9406639, 1.828202, -0.7698897, 1, 1, 1, 1, 1,
-0.9355673, 0.3079659, -1.224531, 1, 1, 1, 1, 1,
-0.9324201, 0.4802334, -0.318656, 1, 1, 1, 1, 1,
-0.9276984, 1.519236, -0.9899282, 1, 1, 1, 1, 1,
-0.9236768, -0.6009089, -0.8604231, 1, 1, 1, 1, 1,
-0.9227094, -1.518987, -4.877305, 1, 1, 1, 1, 1,
-0.9224402, -0.1905403, -2.650545, 1, 1, 1, 1, 1,
-0.9174302, -0.7914395, -4.087549, 1, 1, 1, 1, 1,
-0.9121181, -1.394725, -2.133715, 1, 1, 1, 1, 1,
-0.9113438, -0.5288547, -0.8669783, 0, 0, 1, 1, 1,
-0.9069372, -0.5576947, -3.496531, 1, 0, 0, 1, 1,
-0.9051788, -1.364098, -1.402078, 1, 0, 0, 1, 1,
-0.8959709, 1.353108, 1.472539, 1, 0, 0, 1, 1,
-0.892949, 0.3049591, -1.117015, 1, 0, 0, 1, 1,
-0.8881449, -1.187453, -2.661187, 1, 0, 0, 1, 1,
-0.8870011, -0.4678856, -1.173882, 0, 0, 0, 1, 1,
-0.8838232, 1.022154, -2.374151, 0, 0, 0, 1, 1,
-0.8827689, -0.5650648, -3.481208, 0, 0, 0, 1, 1,
-0.8811254, 0.2213432, -1.006651, 0, 0, 0, 1, 1,
-0.8733416, 1.439162, -0.6547444, 0, 0, 0, 1, 1,
-0.8701223, -0.9733851, -3.531987, 0, 0, 0, 1, 1,
-0.8686742, 0.6471358, -3.069825, 0, 0, 0, 1, 1,
-0.8634009, -1.417817, -1.498392, 1, 1, 1, 1, 1,
-0.8617437, -0.09181122, -3.294424, 1, 1, 1, 1, 1,
-0.8557771, 1.307475, -1.956511, 1, 1, 1, 1, 1,
-0.8520631, -1.238096, -0.5685059, 1, 1, 1, 1, 1,
-0.8515625, 0.2688867, -0.9473575, 1, 1, 1, 1, 1,
-0.8475732, -0.1400175, -2.368053, 1, 1, 1, 1, 1,
-0.8462735, 0.9813229, -1.689347, 1, 1, 1, 1, 1,
-0.8448288, -1.529683, -3.028311, 1, 1, 1, 1, 1,
-0.8417161, 1.144737, -2.602607, 1, 1, 1, 1, 1,
-0.8410042, 0.3978207, -0.9139211, 1, 1, 1, 1, 1,
-0.8391097, 0.01211032, -1.361951, 1, 1, 1, 1, 1,
-0.8358468, -1.605261, -3.937176, 1, 1, 1, 1, 1,
-0.8316335, -0.2978621, -1.25186, 1, 1, 1, 1, 1,
-0.8313689, -3.008182, -1.285983, 1, 1, 1, 1, 1,
-0.8199262, -0.2347178, -1.426761, 1, 1, 1, 1, 1,
-0.8192539, 0.4342438, -0.6928545, 0, 0, 1, 1, 1,
-0.8174713, 1.266234, -0.3664408, 1, 0, 0, 1, 1,
-0.8153667, -0.5864434, -0.7428252, 1, 0, 0, 1, 1,
-0.8083882, -0.4492857, -2.069353, 1, 0, 0, 1, 1,
-0.8080556, -0.3609017, -3.423496, 1, 0, 0, 1, 1,
-0.8069584, -0.7263675, -2.518051, 1, 0, 0, 1, 1,
-0.8068259, 2.376496, -0.2226576, 0, 0, 0, 1, 1,
-0.8058786, 2.038114, -1.237585, 0, 0, 0, 1, 1,
-0.8034817, 0.7510595, -0.1883968, 0, 0, 0, 1, 1,
-0.8017775, 0.6912582, -1.308672, 0, 0, 0, 1, 1,
-0.7952095, -1.151182, -2.159805, 0, 0, 0, 1, 1,
-0.7925337, -0.396475, -4.011288, 0, 0, 0, 1, 1,
-0.7897358, 1.67308, -0.6307764, 0, 0, 0, 1, 1,
-0.7893718, 1.05174, -0.2324832, 1, 1, 1, 1, 1,
-0.7876255, 0.6208207, -4.298986, 1, 1, 1, 1, 1,
-0.7839303, -0.04642188, -0.05452472, 1, 1, 1, 1, 1,
-0.7782475, 1.139559, 0.092449, 1, 1, 1, 1, 1,
-0.7768807, 0.1092179, 0.02895213, 1, 1, 1, 1, 1,
-0.7677638, -0.874665, -4.459144, 1, 1, 1, 1, 1,
-0.7610826, -1.541736, -4.513532, 1, 1, 1, 1, 1,
-0.7570391, 0.6365097, -0.5905813, 1, 1, 1, 1, 1,
-0.7566912, -1.103686, -2.806328, 1, 1, 1, 1, 1,
-0.7562331, 0.260728, -1.23751, 1, 1, 1, 1, 1,
-0.7435234, -1.761015, -3.029194, 1, 1, 1, 1, 1,
-0.7302344, 0.2759368, -0.9972639, 1, 1, 1, 1, 1,
-0.7238207, 1.684556, -0.01591824, 1, 1, 1, 1, 1,
-0.718946, -0.2432827, -3.051481, 1, 1, 1, 1, 1,
-0.7085139, 1.020395, 0.3043966, 1, 1, 1, 1, 1,
-0.7068444, -0.2078153, -2.05165, 0, 0, 1, 1, 1,
-0.7046536, 0.5956441, -1.89669, 1, 0, 0, 1, 1,
-0.7006791, 1.051483, -0.2714769, 1, 0, 0, 1, 1,
-0.6985839, -0.7690628, -2.180579, 1, 0, 0, 1, 1,
-0.698025, -0.8152795, -3.588001, 1, 0, 0, 1, 1,
-0.6945648, 0.9974287, -2.377769, 1, 0, 0, 1, 1,
-0.6862352, 0.5533148, 1.26801, 0, 0, 0, 1, 1,
-0.6793484, 0.2920058, -1.466702, 0, 0, 0, 1, 1,
-0.6779432, 0.3393267, -0.7932935, 0, 0, 0, 1, 1,
-0.6754308, 0.6676486, 0.1515127, 0, 0, 0, 1, 1,
-0.6747418, 0.9127892, -0.96466, 0, 0, 0, 1, 1,
-0.6726228, -1.015237, -0.8713944, 0, 0, 0, 1, 1,
-0.6714327, 0.09338058, -2.506737, 0, 0, 0, 1, 1,
-0.6709609, 0.3120961, 0.1831625, 1, 1, 1, 1, 1,
-0.6688281, 0.5240497, 1.405267, 1, 1, 1, 1, 1,
-0.6680146, -0.1624567, 0.8238434, 1, 1, 1, 1, 1,
-0.6670402, 0.318117, 0.1160165, 1, 1, 1, 1, 1,
-0.663906, 0.685432, 0.4174314, 1, 1, 1, 1, 1,
-0.6632466, -0.4687864, -0.1621077, 1, 1, 1, 1, 1,
-0.6620889, -0.8533784, -2.670025, 1, 1, 1, 1, 1,
-0.660866, 1.083024, -0.4952482, 1, 1, 1, 1, 1,
-0.6587386, -0.03417696, -1.692736, 1, 1, 1, 1, 1,
-0.6573921, -0.05982243, -1.498139, 1, 1, 1, 1, 1,
-0.6550847, -0.5842199, -2.396653, 1, 1, 1, 1, 1,
-0.6506825, -1.301486, -4.779214, 1, 1, 1, 1, 1,
-0.6496356, 0.8360115, -2.151431, 1, 1, 1, 1, 1,
-0.6492179, -1.400543, -2.572869, 1, 1, 1, 1, 1,
-0.6467844, -0.9439898, -2.578387, 1, 1, 1, 1, 1,
-0.6460536, -0.5106105, -2.170866, 0, 0, 1, 1, 1,
-0.6400344, 0.2433198, -0.6533686, 1, 0, 0, 1, 1,
-0.6328122, 0.7197426, -0.2914982, 1, 0, 0, 1, 1,
-0.6267319, -0.2692575, -4.502739, 1, 0, 0, 1, 1,
-0.6253898, 1.271486, -2.256561, 1, 0, 0, 1, 1,
-0.6241914, 1.507115, 0.1352427, 1, 0, 0, 1, 1,
-0.6191995, -1.708814, -1.640737, 0, 0, 0, 1, 1,
-0.6142018, -2.525258, -4.945484, 0, 0, 0, 1, 1,
-0.612056, 0.2043492, -1.75738, 0, 0, 0, 1, 1,
-0.6112617, -1.385083, -3.678423, 0, 0, 0, 1, 1,
-0.6060498, 0.9143028, -1.298078, 0, 0, 0, 1, 1,
-0.6040406, -0.5494853, -3.494439, 0, 0, 0, 1, 1,
-0.6031606, 0.1240564, -1.206836, 0, 0, 0, 1, 1,
-0.6022978, 0.6446987, 0.1029158, 1, 1, 1, 1, 1,
-0.6019527, 0.4277, 1.47558, 1, 1, 1, 1, 1,
-0.5989041, -1.268282, -3.53717, 1, 1, 1, 1, 1,
-0.590167, -0.7179091, -2.191216, 1, 1, 1, 1, 1,
-0.5894791, -0.3535042, -1.611339, 1, 1, 1, 1, 1,
-0.5846918, -2.898353, -2.941503, 1, 1, 1, 1, 1,
-0.5846021, -0.8694373, -1.746978, 1, 1, 1, 1, 1,
-0.576076, 0.976635, -1.649564, 1, 1, 1, 1, 1,
-0.566242, 0.3734965, -3.162668, 1, 1, 1, 1, 1,
-0.5645497, -1.545707, -2.938624, 1, 1, 1, 1, 1,
-0.5624282, 0.8390723, 1.035634, 1, 1, 1, 1, 1,
-0.5544869, 0.6126707, -2.804693, 1, 1, 1, 1, 1,
-0.5488005, 0.7579481, 0.1607853, 1, 1, 1, 1, 1,
-0.5479733, 0.4318588, 0.1361029, 1, 1, 1, 1, 1,
-0.5397708, -1.337203, -3.930302, 1, 1, 1, 1, 1,
-0.5361174, -0.7723224, 0.2145991, 0, 0, 1, 1, 1,
-0.5344105, 1.738613, 0.530561, 1, 0, 0, 1, 1,
-0.530508, 2.470626, -0.3408828, 1, 0, 0, 1, 1,
-0.5259694, 0.2558723, -0.664167, 1, 0, 0, 1, 1,
-0.5259439, 0.1872711, -1.93656, 1, 0, 0, 1, 1,
-0.5255038, 0.7175885, -0.4571144, 1, 0, 0, 1, 1,
-0.5249874, 1.072307, 0.01890129, 0, 0, 0, 1, 1,
-0.5229803, 0.5079102, -2.260046, 0, 0, 0, 1, 1,
-0.5212186, 0.09177685, -1.820586, 0, 0, 0, 1, 1,
-0.5194935, -0.6694504, -0.961917, 0, 0, 0, 1, 1,
-0.5191382, 0.1382701, -1.768193, 0, 0, 0, 1, 1,
-0.5186899, -0.5999432, -0.9131556, 0, 0, 0, 1, 1,
-0.5114984, -0.9791634, -2.060961, 0, 0, 0, 1, 1,
-0.5068372, 1.202951, -0.367829, 1, 1, 1, 1, 1,
-0.5049453, 0.3356031, -1.386251, 1, 1, 1, 1, 1,
-0.5022584, 0.1991458, -0.5740494, 1, 1, 1, 1, 1,
-0.4977122, -0.5408896, -2.24201, 1, 1, 1, 1, 1,
-0.4946277, 0.1259851, -0.9830648, 1, 1, 1, 1, 1,
-0.4930935, 0.1097705, -0.313892, 1, 1, 1, 1, 1,
-0.4930464, -0.5550258, -2.892092, 1, 1, 1, 1, 1,
-0.4924757, 0.03062024, -2.04062, 1, 1, 1, 1, 1,
-0.482988, -1.229897, -2.431936, 1, 1, 1, 1, 1,
-0.4821854, 0.06349181, -1.934582, 1, 1, 1, 1, 1,
-0.4716104, -0.8209515, -2.439614, 1, 1, 1, 1, 1,
-0.4692798, -1.127417, -1.434312, 1, 1, 1, 1, 1,
-0.458197, 1.578644, -0.2168543, 1, 1, 1, 1, 1,
-0.4514253, -2.225583, -3.530094, 1, 1, 1, 1, 1,
-0.4489852, -0.3774887, -0.8811988, 1, 1, 1, 1, 1,
-0.4476491, -1.475082, -4.358712, 0, 0, 1, 1, 1,
-0.4439438, -0.0614651, -2.133915, 1, 0, 0, 1, 1,
-0.4439345, -1.368434, -2.48616, 1, 0, 0, 1, 1,
-0.439738, -0.08058662, -1.522082, 1, 0, 0, 1, 1,
-0.4393104, -0.4579838, -2.610533, 1, 0, 0, 1, 1,
-0.4379578, -0.3964647, -1.320983, 1, 0, 0, 1, 1,
-0.435463, 1.366083, -0.3736511, 0, 0, 0, 1, 1,
-0.433828, -0.7082641, -3.718699, 0, 0, 0, 1, 1,
-0.4289742, -1.02905, -2.077399, 0, 0, 0, 1, 1,
-0.4289173, -0.7652099, -3.56071, 0, 0, 0, 1, 1,
-0.427287, 0.5007443, -0.9812608, 0, 0, 0, 1, 1,
-0.4230238, 0.145011, -3.787967, 0, 0, 0, 1, 1,
-0.4202881, 1.671314, 0.8748944, 0, 0, 0, 1, 1,
-0.418949, -0.09045045, -1.444196, 1, 1, 1, 1, 1,
-0.4185534, -0.4810413, -0.877813, 1, 1, 1, 1, 1,
-0.4161901, -0.659565, -2.872441, 1, 1, 1, 1, 1,
-0.4157866, -0.4946587, -0.1905249, 1, 1, 1, 1, 1,
-0.4075826, -1.108844, -2.896635, 1, 1, 1, 1, 1,
-0.4063658, 1.019355, 0.3191557, 1, 1, 1, 1, 1,
-0.4063455, -1.022523, -2.825249, 1, 1, 1, 1, 1,
-0.4061359, 1.091727, 0.4568814, 1, 1, 1, 1, 1,
-0.4024452, -0.7768604, -2.276925, 1, 1, 1, 1, 1,
-0.3979437, -1.242078, -2.605222, 1, 1, 1, 1, 1,
-0.391412, -0.08610778, -2.361983, 1, 1, 1, 1, 1,
-0.3888938, 0.7348008, -0.5639434, 1, 1, 1, 1, 1,
-0.3809934, 1.069568, 0.1352069, 1, 1, 1, 1, 1,
-0.3757494, 0.6818834, -0.3475672, 1, 1, 1, 1, 1,
-0.3729263, 1.468736, -1.168764, 1, 1, 1, 1, 1,
-0.3720647, 0.1341749, -2.413192, 0, 0, 1, 1, 1,
-0.369951, 0.8832792, -1.056513, 1, 0, 0, 1, 1,
-0.367172, 0.4943821, -1.045323, 1, 0, 0, 1, 1,
-0.3659695, -0.6838484, -3.176925, 1, 0, 0, 1, 1,
-0.3652379, -0.6403823, -1.944986, 1, 0, 0, 1, 1,
-0.3652261, 1.257221, -0.8108925, 1, 0, 0, 1, 1,
-0.3628153, -0.8382811, -2.051301, 0, 0, 0, 1, 1,
-0.3597085, -0.3312018, -2.076929, 0, 0, 0, 1, 1,
-0.3572015, -0.6978611, -2.178522, 0, 0, 0, 1, 1,
-0.3528973, 1.670743, 1.024085, 0, 0, 0, 1, 1,
-0.3512601, 3.15439, 1.329556, 0, 0, 0, 1, 1,
-0.3479564, -1.147201, -3.722887, 0, 0, 0, 1, 1,
-0.347346, -0.2840364, -2.067212, 0, 0, 0, 1, 1,
-0.3469159, -0.02872135, -2.104596, 1, 1, 1, 1, 1,
-0.3461912, -1.586252, -1.708935, 1, 1, 1, 1, 1,
-0.3430376, -0.2950863, -2.985794, 1, 1, 1, 1, 1,
-0.3406769, 0.7385602, -1.370432, 1, 1, 1, 1, 1,
-0.3392427, 0.8693889, -1.092689, 1, 1, 1, 1, 1,
-0.3375912, -0.06657006, -0.8499547, 1, 1, 1, 1, 1,
-0.3368298, -0.1739998, -2.795223, 1, 1, 1, 1, 1,
-0.3342746, -0.3893666, -2.867038, 1, 1, 1, 1, 1,
-0.333733, 1.038121, -0.3389686, 1, 1, 1, 1, 1,
-0.3331131, -0.7009285, -1.243587, 1, 1, 1, 1, 1,
-0.332874, 0.2112596, -2.430896, 1, 1, 1, 1, 1,
-0.3321809, -0.5509446, -4.091951, 1, 1, 1, 1, 1,
-0.3264393, -0.7021615, -2.899402, 1, 1, 1, 1, 1,
-0.3258753, 0.4493937, -2.002833, 1, 1, 1, 1, 1,
-0.3257056, 2.554817, -1.876765, 1, 1, 1, 1, 1,
-0.3232423, 0.06735744, -1.383171, 0, 0, 1, 1, 1,
-0.321911, 0.5360577, -0.8591303, 1, 0, 0, 1, 1,
-0.3167807, -0.2940697, -2.333538, 1, 0, 0, 1, 1,
-0.3147402, -0.8186753, -1.248802, 1, 0, 0, 1, 1,
-0.3138704, -0.3640841, -1.817032, 1, 0, 0, 1, 1,
-0.3128572, 1.866084, 1.230438, 1, 0, 0, 1, 1,
-0.3112332, 1.650206, 0.8197134, 0, 0, 0, 1, 1,
-0.3073336, 0.4199227, -1.033014, 0, 0, 0, 1, 1,
-0.3064523, 0.9588013, -1.027017, 0, 0, 0, 1, 1,
-0.3051532, 0.1847689, -0.9238534, 0, 0, 0, 1, 1,
-0.304231, -0.773927, -1.6808, 0, 0, 0, 1, 1,
-0.299702, 0.344521, 1.467745, 0, 0, 0, 1, 1,
-0.2940449, 0.5689585, -0.7778749, 0, 0, 0, 1, 1,
-0.2910244, -0.4924701, -2.671374, 1, 1, 1, 1, 1,
-0.2898716, -0.780969, -4.471362, 1, 1, 1, 1, 1,
-0.289256, 0.007500026, -1.629346, 1, 1, 1, 1, 1,
-0.2859059, 0.1942882, -0.1947636, 1, 1, 1, 1, 1,
-0.2850275, -0.6761642, -1.727918, 1, 1, 1, 1, 1,
-0.2849966, 1.246521, 1.88811, 1, 1, 1, 1, 1,
-0.2828026, -1.87557, -3.063194, 1, 1, 1, 1, 1,
-0.2803126, 0.3006422, -0.6436838, 1, 1, 1, 1, 1,
-0.2780074, -0.2169727, -2.681889, 1, 1, 1, 1, 1,
-0.2716104, 0.174064, -0.3203382, 1, 1, 1, 1, 1,
-0.2714119, -0.9343011, -3.015693, 1, 1, 1, 1, 1,
-0.2703867, 1.242955, 1.063798, 1, 1, 1, 1, 1,
-0.269132, 0.5679602, -1.135075, 1, 1, 1, 1, 1,
-0.2689398, -0.6641034, -2.697668, 1, 1, 1, 1, 1,
-0.2638018, -1.596205, -3.57995, 1, 1, 1, 1, 1,
-0.2630731, 0.2101471, -0.4734202, 0, 0, 1, 1, 1,
-0.2600069, -0.4031197, -2.788061, 1, 0, 0, 1, 1,
-0.2597717, -1.266085, -4.024355, 1, 0, 0, 1, 1,
-0.2583241, 1.174173, 0.7272297, 1, 0, 0, 1, 1,
-0.2580693, -0.9963817, -5.681009, 1, 0, 0, 1, 1,
-0.256825, -0.2899028, -2.66781, 1, 0, 0, 1, 1,
-0.2557765, 1.05022, -1.063339, 0, 0, 0, 1, 1,
-0.2497558, 2.136445, 1.216107, 0, 0, 0, 1, 1,
-0.246565, -0.750734, -1.869833, 0, 0, 0, 1, 1,
-0.2460542, 0.8139165, -0.8396541, 0, 0, 0, 1, 1,
-0.2448266, 0.8859208, -0.5686411, 0, 0, 0, 1, 1,
-0.2431971, 1.271599, 0.7886039, 0, 0, 0, 1, 1,
-0.2387667, 0.1066126, -1.352322, 0, 0, 0, 1, 1,
-0.2370616, -0.4953615, -4.520219, 1, 1, 1, 1, 1,
-0.2344583, -0.8717832, -1.679575, 1, 1, 1, 1, 1,
-0.2336994, -1.745738, -3.124537, 1, 1, 1, 1, 1,
-0.2312661, -1.288008, -1.907974, 1, 1, 1, 1, 1,
-0.2287415, -0.7639397, -1.194596, 1, 1, 1, 1, 1,
-0.2270758, -0.4693519, -2.2853, 1, 1, 1, 1, 1,
-0.2249769, 0.002638351, -1.094521, 1, 1, 1, 1, 1,
-0.2242884, -0.5270293, -4.091392, 1, 1, 1, 1, 1,
-0.2195645, -1.711675, -0.9397985, 1, 1, 1, 1, 1,
-0.2182338, -0.1211968, -1.250682, 1, 1, 1, 1, 1,
-0.2172873, -1.261294, -3.43621, 1, 1, 1, 1, 1,
-0.2165758, 2.181369, -0.1232642, 1, 1, 1, 1, 1,
-0.2080082, 0.07823835, -0.9466736, 1, 1, 1, 1, 1,
-0.206475, 1.875084, -0.6363193, 1, 1, 1, 1, 1,
-0.2063832, -2.047095, -2.938613, 1, 1, 1, 1, 1,
-0.2039603, 0.9010761, -0.7051648, 0, 0, 1, 1, 1,
-0.202426, -1.415832, -0.6082932, 1, 0, 0, 1, 1,
-0.2002248, 2.038458, -0.8041073, 1, 0, 0, 1, 1,
-0.1974882, 0.3802854, 1.254496, 1, 0, 0, 1, 1,
-0.1974208, 0.7170763, 0.8263065, 1, 0, 0, 1, 1,
-0.1965774, 0.3512575, 0.005353307, 1, 0, 0, 1, 1,
-0.1956003, 0.9310528, -0.167915, 0, 0, 0, 1, 1,
-0.1875338, -0.6810682, -4.102746, 0, 0, 0, 1, 1,
-0.1852676, 0.2775478, -1.957654, 0, 0, 0, 1, 1,
-0.1848465, -1.218336, -3.609292, 0, 0, 0, 1, 1,
-0.1834503, 0.3899942, -1.027233, 0, 0, 0, 1, 1,
-0.1783278, -2.379592, -3.264382, 0, 0, 0, 1, 1,
-0.1778819, 1.817305, 0.4505463, 0, 0, 0, 1, 1,
-0.1717281, -0.9987108, -2.39278, 1, 1, 1, 1, 1,
-0.1680796, 0.8240578, -0.4109851, 1, 1, 1, 1, 1,
-0.1672219, -0.5064725, -3.651104, 1, 1, 1, 1, 1,
-0.1610434, -0.1676282, -1.981972, 1, 1, 1, 1, 1,
-0.1563254, -0.8179058, -1.949438, 1, 1, 1, 1, 1,
-0.1534698, 0.5409175, -0.6883492, 1, 1, 1, 1, 1,
-0.1507567, 1.913305, -1.410865, 1, 1, 1, 1, 1,
-0.1449749, -0.5492852, -2.862289, 1, 1, 1, 1, 1,
-0.144467, -0.8104265, -3.980467, 1, 1, 1, 1, 1,
-0.1418037, 0.06306771, 0.3500147, 1, 1, 1, 1, 1,
-0.1416712, -1.618251, -4.103676, 1, 1, 1, 1, 1,
-0.1413347, 0.2631924, 0.3988685, 1, 1, 1, 1, 1,
-0.1368318, 0.448994, -1.08164, 1, 1, 1, 1, 1,
-0.1330063, -0.1195035, -3.291472, 1, 1, 1, 1, 1,
-0.1295432, -0.9940626, -2.962258, 1, 1, 1, 1, 1,
-0.1255215, 1.102349, -1.132575, 0, 0, 1, 1, 1,
-0.1250917, 0.8412774, -0.2051629, 1, 0, 0, 1, 1,
-0.1247732, 0.05365704, -0.9256247, 1, 0, 0, 1, 1,
-0.1215825, 0.2283211, 0.4314511, 1, 0, 0, 1, 1,
-0.1196777, 0.3571897, 1.902307, 1, 0, 0, 1, 1,
-0.1120202, -0.7351465, -3.388413, 1, 0, 0, 1, 1,
-0.1103864, -1.568402, -3.749447, 0, 0, 0, 1, 1,
-0.1088828, 0.3339769, 1.39754, 0, 0, 0, 1, 1,
-0.1031852, 0.5852435, 1.217806, 0, 0, 0, 1, 1,
-0.1008853, 0.8181956, -1.211657, 0, 0, 0, 1, 1,
-0.09679791, 1.153645, -0.641411, 0, 0, 0, 1, 1,
-0.09504506, -0.8778459, -4.154579, 0, 0, 0, 1, 1,
-0.0945797, -0.5228522, -2.34381, 0, 0, 0, 1, 1,
-0.09107374, -0.8852036, -3.227118, 1, 1, 1, 1, 1,
-0.08938172, -1.124291, -2.557807, 1, 1, 1, 1, 1,
-0.08809362, -1.246644, -4.346225, 1, 1, 1, 1, 1,
-0.08621427, 0.5633399, -1.420206, 1, 1, 1, 1, 1,
-0.08172236, 0.05340729, -1.676946, 1, 1, 1, 1, 1,
-0.07921403, -0.5894702, -1.284899, 1, 1, 1, 1, 1,
-0.07864217, 0.3173512, -1.545459, 1, 1, 1, 1, 1,
-0.07365391, -1.825969, -1.95978, 1, 1, 1, 1, 1,
-0.07203332, 0.4398267, 1.505742, 1, 1, 1, 1, 1,
-0.0671586, 0.518039, 0.9214407, 1, 1, 1, 1, 1,
-0.0671192, -1.087055, -2.972834, 1, 1, 1, 1, 1,
-0.0631816, 2.273372, -1.021965, 1, 1, 1, 1, 1,
-0.06178446, -1.128859, -3.42809, 1, 1, 1, 1, 1,
-0.05987264, -0.7734708, -1.802115, 1, 1, 1, 1, 1,
-0.05639805, -1.335251, -2.152083, 1, 1, 1, 1, 1,
-0.05610732, 0.2900795, -1.167394, 0, 0, 1, 1, 1,
-0.05124238, 0.8731979, -0.0577376, 1, 0, 0, 1, 1,
-0.0503011, -0.600574, -3.785783, 1, 0, 0, 1, 1,
-0.04006345, -0.2245039, -4.86688, 1, 0, 0, 1, 1,
-0.03811097, 0.7956102, -0.3885276, 1, 0, 0, 1, 1,
-0.03759081, -0.8177441, -3.405046, 1, 0, 0, 1, 1,
-0.03539481, -0.06989072, -3.391782, 0, 0, 0, 1, 1,
-0.02902378, -1.181256, -4.750014, 0, 0, 0, 1, 1,
-0.02808957, -0.2261437, -3.924028, 0, 0, 0, 1, 1,
-0.0280808, 0.9685493, -0.1504901, 0, 0, 0, 1, 1,
-0.02793628, -1.395878, -4.347413, 0, 0, 0, 1, 1,
-0.02756565, 0.3288715, -0.7925537, 0, 0, 0, 1, 1,
-0.02470774, 2.11497, -0.5568818, 0, 0, 0, 1, 1,
-0.02359872, 1.367872, -0.0464433, 1, 1, 1, 1, 1,
-0.02303821, -1.825523, -2.548365, 1, 1, 1, 1, 1,
-0.01886047, -0.2803338, -1.895926, 1, 1, 1, 1, 1,
-0.01550191, -0.7080649, -3.878692, 1, 1, 1, 1, 1,
-0.01492199, 1.986003, 0.2840568, 1, 1, 1, 1, 1,
-0.0147761, 0.08267082, -0.2392517, 1, 1, 1, 1, 1,
-0.01303993, -0.6297038, -2.581563, 1, 1, 1, 1, 1,
-0.01039351, 0.5124398, 0.02309543, 1, 1, 1, 1, 1,
-0.006350519, -0.5455693, -3.703507, 1, 1, 1, 1, 1,
-0.004201125, 0.2727824, -0.8475905, 1, 1, 1, 1, 1,
-0.002344008, 1.689913, 0.5112485, 1, 1, 1, 1, 1,
-0.0009993997, -1.569897, -4.276604, 1, 1, 1, 1, 1,
0.007515763, 0.08893175, -0.1291435, 1, 1, 1, 1, 1,
0.007815097, -1.710441, 3.530411, 1, 1, 1, 1, 1,
0.00913259, 0.6267373, -0.377555, 1, 1, 1, 1, 1,
0.01007586, -0.7938567, 1.821405, 0, 0, 1, 1, 1,
0.01107711, -0.3450303, 2.949799, 1, 0, 0, 1, 1,
0.01211986, 1.14989, 1.903231, 1, 0, 0, 1, 1,
0.01357499, -1.807491, 2.692899, 1, 0, 0, 1, 1,
0.01529886, 0.6017746, -0.7043174, 1, 0, 0, 1, 1,
0.01662847, 0.3947444, -0.4127954, 1, 0, 0, 1, 1,
0.01743134, 0.5790916, -0.3553817, 0, 0, 0, 1, 1,
0.02912552, 0.5802357, -1.655091, 0, 0, 0, 1, 1,
0.02963031, -0.4470741, 4.619927, 0, 0, 0, 1, 1,
0.02991227, -0.4905833, 0.6392743, 0, 0, 0, 1, 1,
0.03034808, -0.1677713, 3.364605, 0, 0, 0, 1, 1,
0.03328266, -0.3539795, 2.875225, 0, 0, 0, 1, 1,
0.03612238, -0.1696059, 2.528296, 0, 0, 0, 1, 1,
0.0373356, -0.05430596, 2.915581, 1, 1, 1, 1, 1,
0.03954135, 0.4392175, 1.544423, 1, 1, 1, 1, 1,
0.0433629, -1.145112, 3.349146, 1, 1, 1, 1, 1,
0.04534039, 0.4470389, 0.4581916, 1, 1, 1, 1, 1,
0.04787254, 0.5976293, 0.05281764, 1, 1, 1, 1, 1,
0.04995109, -0.4441873, 1.996542, 1, 1, 1, 1, 1,
0.0541136, -0.1269981, 3.883007, 1, 1, 1, 1, 1,
0.05670004, 0.5424185, 0.6589569, 1, 1, 1, 1, 1,
0.05720304, -1.094101, 3.088163, 1, 1, 1, 1, 1,
0.06025013, 1.486204, -1.255089, 1, 1, 1, 1, 1,
0.06500489, -0.9519042, 2.985155, 1, 1, 1, 1, 1,
0.06685419, 0.2326793, -0.6825138, 1, 1, 1, 1, 1,
0.06721463, -0.1657973, 4.326725, 1, 1, 1, 1, 1,
0.07054748, -1.724841, 3.142684, 1, 1, 1, 1, 1,
0.0711564, 0.7568902, 1.092203, 1, 1, 1, 1, 1,
0.07181977, -1.293294, 4.298665, 0, 0, 1, 1, 1,
0.08068128, 0.7727314, -1.394783, 1, 0, 0, 1, 1,
0.08359079, 0.1991287, 1.117236, 1, 0, 0, 1, 1,
0.08529273, 0.4388263, -0.2123286, 1, 0, 0, 1, 1,
0.08930572, -1.096465, 3.718338, 1, 0, 0, 1, 1,
0.09177125, -2.085282, 4.97022, 1, 0, 0, 1, 1,
0.0989709, 0.01103998, 1.006868, 0, 0, 0, 1, 1,
0.1110387, 0.8692393, -0.1182572, 0, 0, 0, 1, 1,
0.111656, -0.8551706, 2.044602, 0, 0, 0, 1, 1,
0.1137186, 1.151981, 0.05561147, 0, 0, 0, 1, 1,
0.1138435, -0.3319088, 3.51771, 0, 0, 0, 1, 1,
0.1155529, 0.5182503, 0.04465553, 0, 0, 0, 1, 1,
0.1167837, -0.3710254, 1.947636, 0, 0, 0, 1, 1,
0.1175441, -1.184269, 1.161056, 1, 1, 1, 1, 1,
0.1192673, -1.763364, 3.592562, 1, 1, 1, 1, 1,
0.1236463, -0.054621, 3.212016, 1, 1, 1, 1, 1,
0.1261035, -0.7652587, 3.653665, 1, 1, 1, 1, 1,
0.1279714, 0.05772819, 0.6553867, 1, 1, 1, 1, 1,
0.137323, -0.4567602, 4.324078, 1, 1, 1, 1, 1,
0.139503, 0.2127202, 0.3956085, 1, 1, 1, 1, 1,
0.141461, -0.6036607, 2.18634, 1, 1, 1, 1, 1,
0.1435772, -1.7668, 2.806061, 1, 1, 1, 1, 1,
0.1471107, -0.9254603, 3.07622, 1, 1, 1, 1, 1,
0.147732, -0.4370508, 3.012191, 1, 1, 1, 1, 1,
0.1508216, -1.719867, 2.52837, 1, 1, 1, 1, 1,
0.15089, 0.5046528, 1.564052, 1, 1, 1, 1, 1,
0.1528822, -0.208344, 1.830803, 1, 1, 1, 1, 1,
0.1546624, -0.2741959, 1.518289, 1, 1, 1, 1, 1,
0.1553705, -0.0546609, 2.453734, 0, 0, 1, 1, 1,
0.1608749, -1.280957, 2.197773, 1, 0, 0, 1, 1,
0.1624848, 1.092609, 1.537763, 1, 0, 0, 1, 1,
0.1644127, -1.954464, 3.307716, 1, 0, 0, 1, 1,
0.1691072, 0.009761579, 1.013503, 1, 0, 0, 1, 1,
0.1745272, 0.03615075, 0.4407514, 1, 0, 0, 1, 1,
0.1826153, 0.172621, 0.8523295, 0, 0, 0, 1, 1,
0.1901285, -0.3487239, 3.919083, 0, 0, 0, 1, 1,
0.1929331, 0.5601543, -0.2884788, 0, 0, 0, 1, 1,
0.1959523, 0.958813, -0.1444821, 0, 0, 0, 1, 1,
0.1970999, 0.310469, 1.088368, 0, 0, 0, 1, 1,
0.204701, -0.2841872, 2.154277, 0, 0, 0, 1, 1,
0.2068146, -0.6568369, 3.951531, 0, 0, 0, 1, 1,
0.207303, -0.01754006, 2.672237, 1, 1, 1, 1, 1,
0.2079301, -0.1551045, 1.373631, 1, 1, 1, 1, 1,
0.2100416, 0.1607433, 2.707943, 1, 1, 1, 1, 1,
0.2132212, 0.5894025, 0.5771137, 1, 1, 1, 1, 1,
0.2166982, 1.457802, 0.2612313, 1, 1, 1, 1, 1,
0.2171607, 1.551093, 1.004961, 1, 1, 1, 1, 1,
0.2173537, 0.2764522, 0.33194, 1, 1, 1, 1, 1,
0.2215374, -1.005873, 4.020262, 1, 1, 1, 1, 1,
0.2227224, -0.1124522, 1.879105, 1, 1, 1, 1, 1,
0.2267938, 0.156284, 0.1365826, 1, 1, 1, 1, 1,
0.2268987, -0.8097116, 2.733733, 1, 1, 1, 1, 1,
0.2274901, -0.7962572, 4.432957, 1, 1, 1, 1, 1,
0.2277869, 0.03557106, 1.056281, 1, 1, 1, 1, 1,
0.2328165, -1.031631, 4.469553, 1, 1, 1, 1, 1,
0.236333, 0.4461973, 0.4747018, 1, 1, 1, 1, 1,
0.2385807, 0.6875392, 0.2921798, 0, 0, 1, 1, 1,
0.2386889, 0.7541928, -1.240249, 1, 0, 0, 1, 1,
0.2426476, -0.708536, 2.471178, 1, 0, 0, 1, 1,
0.2463245, -0.5184283, 2.073559, 1, 0, 0, 1, 1,
0.2471251, 0.8306079, -0.6870474, 1, 0, 0, 1, 1,
0.2476957, -0.4773057, 3.897037, 1, 0, 0, 1, 1,
0.2485571, 1.122756, 0.02933609, 0, 0, 0, 1, 1,
0.2567613, 0.003111624, 1.948995, 0, 0, 0, 1, 1,
0.2571132, -0.8838205, 3.222274, 0, 0, 0, 1, 1,
0.2592719, 0.5343571, -0.2965674, 0, 0, 0, 1, 1,
0.2597665, -1.192703, 2.90103, 0, 0, 0, 1, 1,
0.2635697, -0.4438975, 2.535888, 0, 0, 0, 1, 1,
0.266771, 0.3574875, 0.1878434, 0, 0, 0, 1, 1,
0.2681287, 0.2361743, 0.1208093, 1, 1, 1, 1, 1,
0.2700348, 0.7348536, 1.015615, 1, 1, 1, 1, 1,
0.273645, -0.8725934, 0.998528, 1, 1, 1, 1, 1,
0.2762268, -0.8676004, 3.479209, 1, 1, 1, 1, 1,
0.2780144, 2.032259, 0.003718321, 1, 1, 1, 1, 1,
0.2786512, -0.2033635, 0.4418624, 1, 1, 1, 1, 1,
0.2810551, 0.9172614, 0.6284031, 1, 1, 1, 1, 1,
0.282254, -1.105565, 3.198901, 1, 1, 1, 1, 1,
0.2834538, -0.5293573, 2.694443, 1, 1, 1, 1, 1,
0.2873872, -1.171742, 1.495301, 1, 1, 1, 1, 1,
0.2882863, -0.4484985, 2.702059, 1, 1, 1, 1, 1,
0.2906896, -1.637159, 2.978324, 1, 1, 1, 1, 1,
0.2927515, -1.06624, 2.869179, 1, 1, 1, 1, 1,
0.2947187, 0.02472382, 1.232758, 1, 1, 1, 1, 1,
0.2963865, -1.329661, 1.707038, 1, 1, 1, 1, 1,
0.2975149, 0.5004348, 2.293528, 0, 0, 1, 1, 1,
0.3029359, -0.6594135, 2.821691, 1, 0, 0, 1, 1,
0.3058015, 1.160903, 2.18114, 1, 0, 0, 1, 1,
0.3124434, -2.826333, 4.717913, 1, 0, 0, 1, 1,
0.3174708, 0.151767, 0.8093957, 1, 0, 0, 1, 1,
0.3201522, -0.4262775, 1.991842, 1, 0, 0, 1, 1,
0.3225838, 0.05014803, 0.5723784, 0, 0, 0, 1, 1,
0.323112, -0.2445628, 2.4376, 0, 0, 0, 1, 1,
0.323745, -0.791113, 2.754287, 0, 0, 0, 1, 1,
0.3314968, 1.727243, -0.4498933, 0, 0, 0, 1, 1,
0.3374995, -0.6646864, 1.455727, 0, 0, 0, 1, 1,
0.338267, 0.5988994, 1.65307, 0, 0, 0, 1, 1,
0.3411093, -0.126868, 2.279553, 0, 0, 0, 1, 1,
0.3447255, 1.574669, 0.001407219, 1, 1, 1, 1, 1,
0.3483022, -0.8434318, 2.902731, 1, 1, 1, 1, 1,
0.3497792, -0.3658867, 1.510141, 1, 1, 1, 1, 1,
0.351569, -0.1321634, 0.653547, 1, 1, 1, 1, 1,
0.352557, -0.7836035, 3.873353, 1, 1, 1, 1, 1,
0.3639061, -1.787821, 2.492241, 1, 1, 1, 1, 1,
0.3679132, -0.6166256, 2.474348, 1, 1, 1, 1, 1,
0.3810835, 0.1878795, 2.795624, 1, 1, 1, 1, 1,
0.3845751, 0.8803094, 0.2456359, 1, 1, 1, 1, 1,
0.3872291, -0.3645777, 3.71684, 1, 1, 1, 1, 1,
0.3881057, 1.312652, 1.449908, 1, 1, 1, 1, 1,
0.3891694, -0.3109881, 0.865786, 1, 1, 1, 1, 1,
0.3891742, 0.6180478, 0.2769425, 1, 1, 1, 1, 1,
0.3961821, 1.034058, 0.5587056, 1, 1, 1, 1, 1,
0.3983967, 0.8628939, -0.6536865, 1, 1, 1, 1, 1,
0.4026983, 2.146227, -0.5085199, 0, 0, 1, 1, 1,
0.4051743, 0.3208327, 0.004069199, 1, 0, 0, 1, 1,
0.4058048, 1.359294, 0.8026324, 1, 0, 0, 1, 1,
0.4088583, 0.0758336, 2.980926, 1, 0, 0, 1, 1,
0.4111872, -0.9177328, 4.24403, 1, 0, 0, 1, 1,
0.4114706, 0.006432918, 2.24177, 1, 0, 0, 1, 1,
0.414124, -0.09461276, 2.548118, 0, 0, 0, 1, 1,
0.4146448, -0.3135173, 1.424488, 0, 0, 0, 1, 1,
0.4228101, -0.1327436, 2.664259, 0, 0, 0, 1, 1,
0.4246063, -1.096708, 3.270601, 0, 0, 0, 1, 1,
0.4269421, -0.516229, 1.053369, 0, 0, 0, 1, 1,
0.4324879, 0.6590593, 1.077566, 0, 0, 0, 1, 1,
0.4370302, 1.469735, -0.7687497, 0, 0, 0, 1, 1,
0.4404613, 2.151603, -0.8644087, 1, 1, 1, 1, 1,
0.4458658, 0.6136286, -1.177156, 1, 1, 1, 1, 1,
0.446756, -2.209856, 3.717051, 1, 1, 1, 1, 1,
0.4475347, -0.556746, 1.986635, 1, 1, 1, 1, 1,
0.4541465, -2.106215, 1.628248, 1, 1, 1, 1, 1,
0.4551118, 1.09676, 1.272782, 1, 1, 1, 1, 1,
0.4602719, 0.7148954, 1.256274, 1, 1, 1, 1, 1,
0.4659228, 1.29567, -1.163548, 1, 1, 1, 1, 1,
0.4683898, 0.3566545, -0.02892285, 1, 1, 1, 1, 1,
0.468566, 1.022329, 1.696231, 1, 1, 1, 1, 1,
0.4701223, 0.658888, 0.5345669, 1, 1, 1, 1, 1,
0.4702536, 0.3066591, 1.542377, 1, 1, 1, 1, 1,
0.4723389, 1.12783, 0.3303126, 1, 1, 1, 1, 1,
0.4741485, -0.3894975, 3.166446, 1, 1, 1, 1, 1,
0.4809381, -0.5569946, 2.055083, 1, 1, 1, 1, 1,
0.4836225, -0.5191395, 2.748311, 0, 0, 1, 1, 1,
0.4853308, 1.308805, -0.9093891, 1, 0, 0, 1, 1,
0.4859166, -0.9581797, 2.196771, 1, 0, 0, 1, 1,
0.4920521, 0.6530325, -0.02679104, 1, 0, 0, 1, 1,
0.5002103, 1.053422, 0.1356145, 1, 0, 0, 1, 1,
0.5049501, 0.1742721, 2.275464, 1, 0, 0, 1, 1,
0.5059429, 1.352563, -0.2615668, 0, 0, 0, 1, 1,
0.5141341, -0.8064775, 4.375892, 0, 0, 0, 1, 1,
0.5170066, 0.5701523, 1.730564, 0, 0, 0, 1, 1,
0.518704, -0.3070309, 3.613047, 0, 0, 0, 1, 1,
0.5223241, 1.360038, -0.2516359, 0, 0, 0, 1, 1,
0.5301125, 1.07787, -0.863479, 0, 0, 0, 1, 1,
0.5380186, -0.5484809, 2.814438, 0, 0, 0, 1, 1,
0.5417694, 0.7682544, 0.9488469, 1, 1, 1, 1, 1,
0.542174, -0.6252974, 4.044027, 1, 1, 1, 1, 1,
0.5428045, -0.0737697, 1.185885, 1, 1, 1, 1, 1,
0.5448927, 0.9190024, -0.05309485, 1, 1, 1, 1, 1,
0.545734, -1.388094, 4.254906, 1, 1, 1, 1, 1,
0.5468782, -0.7855583, 2.243857, 1, 1, 1, 1, 1,
0.5479524, 0.06789332, 3.039072, 1, 1, 1, 1, 1,
0.5522118, -0.6790642, 3.631411, 1, 1, 1, 1, 1,
0.5546673, 0.4937978, 1.478344, 1, 1, 1, 1, 1,
0.5548277, -0.2515044, 0.8685209, 1, 1, 1, 1, 1,
0.5567617, 1.667141, -0.8806123, 1, 1, 1, 1, 1,
0.563365, 0.4506426, 0.2263564, 1, 1, 1, 1, 1,
0.5660576, -0.3913592, 2.31549, 1, 1, 1, 1, 1,
0.5686547, 1.908384, 0.4352837, 1, 1, 1, 1, 1,
0.5740821, 0.8557124, 2.849691, 1, 1, 1, 1, 1,
0.5745203, 0.2653483, 0.6432881, 0, 0, 1, 1, 1,
0.5902815, -0.8871946, 3.108342, 1, 0, 0, 1, 1,
0.5909103, -0.6432083, 2.210532, 1, 0, 0, 1, 1,
0.5996907, -0.8809956, 4.350742, 1, 0, 0, 1, 1,
0.6013451, 0.3194352, 0.1680941, 1, 0, 0, 1, 1,
0.603245, -0.6382982, 3.655501, 1, 0, 0, 1, 1,
0.6045295, -2.434052, 1.656662, 0, 0, 0, 1, 1,
0.6064541, -1.572392, 2.640571, 0, 0, 0, 1, 1,
0.6100028, 1.295029, -0.122207, 0, 0, 0, 1, 1,
0.6100467, 0.0753466, 2.888412, 0, 0, 0, 1, 1,
0.6117929, 0.6823311, -0.09657911, 0, 0, 0, 1, 1,
0.6131359, 1.324125, -0.7803252, 0, 0, 0, 1, 1,
0.6147826, 0.2725993, 1.704158, 0, 0, 0, 1, 1,
0.6156121, 2.635691, 1.474397, 1, 1, 1, 1, 1,
0.6198491, -0.4055701, 1.174918, 1, 1, 1, 1, 1,
0.6217429, -0.36669, 1.787073, 1, 1, 1, 1, 1,
0.6220739, 0.4390944, 1.342483, 1, 1, 1, 1, 1,
0.6248889, -0.1894466, 2.837751, 1, 1, 1, 1, 1,
0.6293669, -0.7157827, 0.9767021, 1, 1, 1, 1, 1,
0.6294891, 1.154095, -0.8605667, 1, 1, 1, 1, 1,
0.6331524, -1.933011, 1.969871, 1, 1, 1, 1, 1,
0.6332666, -0.4363, 4.245903, 1, 1, 1, 1, 1,
0.6354731, -0.401012, 2.140918, 1, 1, 1, 1, 1,
0.6363453, -0.8177547, 1.266475, 1, 1, 1, 1, 1,
0.6386375, -0.2502547, 3.267918, 1, 1, 1, 1, 1,
0.6393958, 0.07455681, 3.901264, 1, 1, 1, 1, 1,
0.6396689, 1.218816, 1.343933, 1, 1, 1, 1, 1,
0.6416563, -1.470967, 4.012006, 1, 1, 1, 1, 1,
0.6460027, -0.4773842, 2.953302, 0, 0, 1, 1, 1,
0.6497465, 0.0625724, -0.0824541, 1, 0, 0, 1, 1,
0.6505001, 1.048426, 0.6134092, 1, 0, 0, 1, 1,
0.6523073, 0.9223583, 0.5991985, 1, 0, 0, 1, 1,
0.6556289, -1.601722, 3.663691, 1, 0, 0, 1, 1,
0.6649012, 1.71108, -1.355697, 1, 0, 0, 1, 1,
0.6668894, -2.69635, 3.214251, 0, 0, 0, 1, 1,
0.6671308, 1.613224, 0.3910351, 0, 0, 0, 1, 1,
0.6698894, -0.06788675, 0.2410482, 0, 0, 0, 1, 1,
0.6723216, -1.239266, 2.281302, 0, 0, 0, 1, 1,
0.6764025, 1.586495, -0.3665094, 0, 0, 0, 1, 1,
0.6821738, -1.973862, 2.732543, 0, 0, 0, 1, 1,
0.6930806, 0.01408076, 2.329399, 0, 0, 0, 1, 1,
0.7034238, 0.09554188, 1.226105, 1, 1, 1, 1, 1,
0.7115484, 2.644755, 1.129737, 1, 1, 1, 1, 1,
0.713755, 0.8291768, 0.4998697, 1, 1, 1, 1, 1,
0.7163782, 0.2605479, 0.5623036, 1, 1, 1, 1, 1,
0.7171704, 0.7473205, 1.22967, 1, 1, 1, 1, 1,
0.7213844, 0.6813913, 0.4257433, 1, 1, 1, 1, 1,
0.7220652, -0.4079015, 2.911574, 1, 1, 1, 1, 1,
0.7256699, -1.252486, 2.355594, 1, 1, 1, 1, 1,
0.7284867, 1.214562, -1.646881, 1, 1, 1, 1, 1,
0.7317337, -0.6612052, 2.055221, 1, 1, 1, 1, 1,
0.7352058, -1.172866, 4.4088, 1, 1, 1, 1, 1,
0.7407588, -0.2270034, 2.433344, 1, 1, 1, 1, 1,
0.7459043, -1.336994, 4.398232, 1, 1, 1, 1, 1,
0.7496545, 0.6551886, -0.7337916, 1, 1, 1, 1, 1,
0.7550781, -0.5617425, 4.620696, 1, 1, 1, 1, 1,
0.7603545, -1.192591, 3.432543, 0, 0, 1, 1, 1,
0.7617792, 0.1705637, 3.073971, 1, 0, 0, 1, 1,
0.7624959, 0.6643594, 0.2994862, 1, 0, 0, 1, 1,
0.7629859, -1.104826, 2.034463, 1, 0, 0, 1, 1,
0.7639453, 1.471391, 1.189326, 1, 0, 0, 1, 1,
0.7705566, 0.3440716, 0.6345106, 1, 0, 0, 1, 1,
0.7735003, -0.676957, 3.913208, 0, 0, 0, 1, 1,
0.7760623, 0.1478532, 1.17966, 0, 0, 0, 1, 1,
0.7791705, 0.7807556, -0.005020464, 0, 0, 0, 1, 1,
0.7809922, -1.176824, 1.989535, 0, 0, 0, 1, 1,
0.7839251, -0.7667258, 2.367768, 0, 0, 0, 1, 1,
0.7890093, 0.03929408, 2.126354, 0, 0, 0, 1, 1,
0.7919098, 0.068069, 1.192548, 0, 0, 0, 1, 1,
0.7967166, 0.1541362, 1.806476, 1, 1, 1, 1, 1,
0.8083079, 0.6428095, 1.370018, 1, 1, 1, 1, 1,
0.816399, -0.7083131, 3.770866, 1, 1, 1, 1, 1,
0.8200276, 0.3413137, -0.3182375, 1, 1, 1, 1, 1,
0.8210545, -0.3416671, 3.363063, 1, 1, 1, 1, 1,
0.8217439, -0.2376526, 2.7937, 1, 1, 1, 1, 1,
0.8225375, -1.395553, 0.9091957, 1, 1, 1, 1, 1,
0.8253962, 1.088248, 0.9999912, 1, 1, 1, 1, 1,
0.8254724, 0.9645266, 0.4018085, 1, 1, 1, 1, 1,
0.827301, -2.927287, 2.598336, 1, 1, 1, 1, 1,
0.828979, 0.1177889, 0.6982532, 1, 1, 1, 1, 1,
0.8314485, 0.5466923, 2.219419, 1, 1, 1, 1, 1,
0.8393057, 1.394478, 0.2857786, 1, 1, 1, 1, 1,
0.8469733, 1.201854, -0.2111796, 1, 1, 1, 1, 1,
0.8491468, 0.2725304, -0.9064178, 1, 1, 1, 1, 1,
0.8544347, -1.784969, 2.368386, 0, 0, 1, 1, 1,
0.8772399, -1.373583, 3.030048, 1, 0, 0, 1, 1,
0.8775834, -0.396684, 1.653394, 1, 0, 0, 1, 1,
0.8782496, -0.8341604, 3.292456, 1, 0, 0, 1, 1,
0.8787056, 1.015425, 1.651509, 1, 0, 0, 1, 1,
0.8796168, 0.7771616, -0.5208492, 1, 0, 0, 1, 1,
0.8808963, -0.8187399, 1.762802, 0, 0, 0, 1, 1,
0.8828404, -0.1106377, 1.015674, 0, 0, 0, 1, 1,
0.8935446, 1.268929, 1.809268, 0, 0, 0, 1, 1,
0.8949712, -1.138179, 1.663965, 0, 0, 0, 1, 1,
0.9022651, -0.3405258, 1.666272, 0, 0, 0, 1, 1,
0.9056575, 1.596231, 0.002434338, 0, 0, 0, 1, 1,
0.905671, 1.049108, 1.215479, 0, 0, 0, 1, 1,
0.9122478, -2.07317, 2.557338, 1, 1, 1, 1, 1,
0.9123354, 0.3702374, 2.213531, 1, 1, 1, 1, 1,
0.9150686, -1.078573, 2.394815, 1, 1, 1, 1, 1,
0.9171031, -1.096374, 4.80012, 1, 1, 1, 1, 1,
0.9177527, 1.97695, 1.096502, 1, 1, 1, 1, 1,
0.9219046, 0.1899998, 1.096368, 1, 1, 1, 1, 1,
0.926998, 0.6433849, 1.164219, 1, 1, 1, 1, 1,
0.933615, 0.1064401, 1.501683, 1, 1, 1, 1, 1,
0.9406789, 0.343859, 1.944525, 1, 1, 1, 1, 1,
0.9442358, -0.6997351, 2.434498, 1, 1, 1, 1, 1,
0.9497992, -0.1069716, 2.893109, 1, 1, 1, 1, 1,
0.9500415, -0.907871, 2.789855, 1, 1, 1, 1, 1,
0.9570654, 1.169627, 1.182518, 1, 1, 1, 1, 1,
0.96482, -0.9683656, 1.900092, 1, 1, 1, 1, 1,
0.9707004, -1.559146, 2.81686, 1, 1, 1, 1, 1,
0.9719946, 0.2568413, 2.32026, 0, 0, 1, 1, 1,
0.9737366, -0.1134312, 3.004642, 1, 0, 0, 1, 1,
0.9902053, 0.7278344, 1.002403, 1, 0, 0, 1, 1,
0.9907118, 1.532737, 0.8626001, 1, 0, 0, 1, 1,
0.9913945, -0.5192779, 2.458545, 1, 0, 0, 1, 1,
0.992925, 0.61029, 0.6763898, 1, 0, 0, 1, 1,
0.9983103, -0.01919961, 2.175262, 0, 0, 0, 1, 1,
1.015507, 0.8335659, 0.5519594, 0, 0, 0, 1, 1,
1.024076, 0.2917528, 2.407329, 0, 0, 0, 1, 1,
1.033518, 0.9082419, 1.775467, 0, 0, 0, 1, 1,
1.033855, -0.5531109, 3.155309, 0, 0, 0, 1, 1,
1.034291, -0.2944825, 2.398156, 0, 0, 0, 1, 1,
1.037929, 1.532731, 0.5241512, 0, 0, 0, 1, 1,
1.043777, 0.8900845, 0.7495151, 1, 1, 1, 1, 1,
1.048733, 0.3079518, 1.125623, 1, 1, 1, 1, 1,
1.067779, -0.8713003, 3.379818, 1, 1, 1, 1, 1,
1.070706, -1.22824, 1.167788, 1, 1, 1, 1, 1,
1.070718, 1.209961, 2.338089, 1, 1, 1, 1, 1,
1.081314, 0.08450385, 1.415916, 1, 1, 1, 1, 1,
1.085182, 0.7394031, 2.205371, 1, 1, 1, 1, 1,
1.086186, 0.6378748, 0.9849387, 1, 1, 1, 1, 1,
1.088149, 1.184085, 2.596395, 1, 1, 1, 1, 1,
1.090159, -0.182115, 2.841738, 1, 1, 1, 1, 1,
1.096113, -0.5320002, 3.535046, 1, 1, 1, 1, 1,
1.103078, 1.487913, 0.2528976, 1, 1, 1, 1, 1,
1.109923, -1.312248, 1.603185, 1, 1, 1, 1, 1,
1.110681, 0.3278987, 1.846741, 1, 1, 1, 1, 1,
1.117795, -0.7875374, 2.436423, 1, 1, 1, 1, 1,
1.120189, -0.5203699, 2.674949, 0, 0, 1, 1, 1,
1.121266, -1.064255, 1.835445, 1, 0, 0, 1, 1,
1.121499, 0.553836, 2.73869, 1, 0, 0, 1, 1,
1.122195, -0.0805532, 0.5867805, 1, 0, 0, 1, 1,
1.134738, 0.07250883, 0.5784087, 1, 0, 0, 1, 1,
1.135687, -0.2754543, 1.020324, 1, 0, 0, 1, 1,
1.13909, -2.337224, 4.251573, 0, 0, 0, 1, 1,
1.140659, -1.527544, 3.074977, 0, 0, 0, 1, 1,
1.141911, -0.4500035, 2.166803, 0, 0, 0, 1, 1,
1.141926, 0.2232746, 0.9245942, 0, 0, 0, 1, 1,
1.144939, -0.2486279, 2.507778, 0, 0, 0, 1, 1,
1.148044, -0.4741394, 2.406646, 0, 0, 0, 1, 1,
1.157424, 0.7546363, 1.036354, 0, 0, 0, 1, 1,
1.158237, -1.640226, 1.902153, 1, 1, 1, 1, 1,
1.160081, -0.8632551, 1.089303, 1, 1, 1, 1, 1,
1.16668, -0.197119, 1.948057, 1, 1, 1, 1, 1,
1.168356, 0.348446, 1.774571, 1, 1, 1, 1, 1,
1.173841, -0.7970321, 1.84532, 1, 1, 1, 1, 1,
1.183026, 1.05217, 1.724149, 1, 1, 1, 1, 1,
1.184669, -1.588442, 2.448538, 1, 1, 1, 1, 1,
1.187635, -1.439857, -0.09383927, 1, 1, 1, 1, 1,
1.189395, -1.233986, 1.64065, 1, 1, 1, 1, 1,
1.189556, 0.3376825, 0.6309552, 1, 1, 1, 1, 1,
1.219189, -0.4657803, 2.363888, 1, 1, 1, 1, 1,
1.222327, 0.8344744, 1.099943, 1, 1, 1, 1, 1,
1.222743, 1.426782, 1.479745, 1, 1, 1, 1, 1,
1.227484, 0.3124048, 1.077545, 1, 1, 1, 1, 1,
1.235184, -0.513689, 0.5622708, 1, 1, 1, 1, 1,
1.238252, -0.01423437, 2.62394, 0, 0, 1, 1, 1,
1.244547, 0.7161213, 2.073252, 1, 0, 0, 1, 1,
1.244569, -0.7868791, 2.030228, 1, 0, 0, 1, 1,
1.245837, 0.6538622, 2.950927, 1, 0, 0, 1, 1,
1.249166, -0.5826537, 1.46335, 1, 0, 0, 1, 1,
1.259279, -0.3186105, 3.485348, 1, 0, 0, 1, 1,
1.263442, 3.032307, 0.6345307, 0, 0, 0, 1, 1,
1.268794, 0.09082612, 1.015493, 0, 0, 0, 1, 1,
1.269397, 0.7974004, -0.6341094, 0, 0, 0, 1, 1,
1.271576, 0.1317467, 1.169511, 0, 0, 0, 1, 1,
1.271993, 0.3147231, 0.3763291, 0, 0, 0, 1, 1,
1.2772, 0.5397521, 3.825583, 0, 0, 0, 1, 1,
1.277686, 0.06969671, 1.797468, 0, 0, 0, 1, 1,
1.281644, 0.3062674, 1.548961, 1, 1, 1, 1, 1,
1.290894, 0.7105794, 0.2905773, 1, 1, 1, 1, 1,
1.293799, -0.04177223, 0.08568935, 1, 1, 1, 1, 1,
1.305543, 0.4394319, -0.06261235, 1, 1, 1, 1, 1,
1.311971, 0.8058274, 2.834279, 1, 1, 1, 1, 1,
1.314452, 1.020357, 1.102971, 1, 1, 1, 1, 1,
1.315867, -0.7913325, 2.847293, 1, 1, 1, 1, 1,
1.32273, -1.132129, 2.458848, 1, 1, 1, 1, 1,
1.32681, 0.4357375, 0.3316785, 1, 1, 1, 1, 1,
1.330094, 0.05753795, 2.646458, 1, 1, 1, 1, 1,
1.336926, -1.590697, 2.643381, 1, 1, 1, 1, 1,
1.342112, 1.503096, 0.6084142, 1, 1, 1, 1, 1,
1.344026, 2.193029, 0.3303421, 1, 1, 1, 1, 1,
1.353705, -1.039509, 3.827327, 1, 1, 1, 1, 1,
1.369024, -0.9210404, 1.537969, 1, 1, 1, 1, 1,
1.37427, 0.9548172, 1.725426, 0, 0, 1, 1, 1,
1.379707, 0.328096, 1.369879, 1, 0, 0, 1, 1,
1.398067, -0.2145432, 0.3055566, 1, 0, 0, 1, 1,
1.401942, -0.4127314, 2.627512, 1, 0, 0, 1, 1,
1.40408, -0.003449128, -0.7036791, 1, 0, 0, 1, 1,
1.409051, 0.8762532, 1.60391, 1, 0, 0, 1, 1,
1.415327, -1.281228, 2.204097, 0, 0, 0, 1, 1,
1.445632, 2.074658, 1.039584, 0, 0, 0, 1, 1,
1.461387, -0.5511116, 3.262097, 0, 0, 0, 1, 1,
1.463569, -0.5626282, 2.43024, 0, 0, 0, 1, 1,
1.469524, -0.06758714, 0.6907852, 0, 0, 0, 1, 1,
1.490746, 0.4768532, 2.229147, 0, 0, 0, 1, 1,
1.490836, -0.5482059, -1.196786, 0, 0, 0, 1, 1,
1.490962, 0.4119604, -1.459088, 1, 1, 1, 1, 1,
1.4947, -1.22592, 2.105941, 1, 1, 1, 1, 1,
1.498732, -0.03864605, 2.630701, 1, 1, 1, 1, 1,
1.501056, 3.055286, -0.2059436, 1, 1, 1, 1, 1,
1.510174, -0.6733693, 1.383287, 1, 1, 1, 1, 1,
1.514972, 0.728187, -0.5528238, 1, 1, 1, 1, 1,
1.526768, 0.1953233, 3.325011, 1, 1, 1, 1, 1,
1.544816, 1.979352, 2.209123, 1, 1, 1, 1, 1,
1.558132, -1.492914, 2.504147, 1, 1, 1, 1, 1,
1.561273, -0.2873012, 2.435305, 1, 1, 1, 1, 1,
1.575616, 0.3479509, 1.630761, 1, 1, 1, 1, 1,
1.582415, 0.7022802, 1.602472, 1, 1, 1, 1, 1,
1.588077, -1.914718, 2.305277, 1, 1, 1, 1, 1,
1.6001, 0.04455429, 2.385368, 1, 1, 1, 1, 1,
1.605864, 0.7243626, 1.868809, 1, 1, 1, 1, 1,
1.609159, -0.3505829, 2.991843, 0, 0, 1, 1, 1,
1.619489, -1.151925, -0.1834159, 1, 0, 0, 1, 1,
1.625895, -0.5992076, 2.165704, 1, 0, 0, 1, 1,
1.631273, -0.2150986, 0.1438209, 1, 0, 0, 1, 1,
1.639223, 0.443004, 0.3748917, 1, 0, 0, 1, 1,
1.661389, -0.8255503, 1.430867, 1, 0, 0, 1, 1,
1.678567, -1.243875, 2.395831, 0, 0, 0, 1, 1,
1.689529, -0.3886379, -0.02963264, 0, 0, 0, 1, 1,
1.705471, 1.391276, 3.077388, 0, 0, 0, 1, 1,
1.70812, -1.025818, 1.659527, 0, 0, 0, 1, 1,
1.726964, -0.493804, 1.628811, 0, 0, 0, 1, 1,
1.72708, 0.5593387, 1.108544, 0, 0, 0, 1, 1,
1.747616, 0.06969531, 3.198498, 0, 0, 0, 1, 1,
1.775538, -0.2526907, 1.64432, 1, 1, 1, 1, 1,
1.777929, 0.9117061, 0.05058841, 1, 1, 1, 1, 1,
1.786622, -0.1757389, 3.352375, 1, 1, 1, 1, 1,
1.803557, 0.9705631, 1.45227, 1, 1, 1, 1, 1,
1.866301, 0.298342, 1.933228, 1, 1, 1, 1, 1,
1.872554, 0.7426404, 0.9703946, 1, 1, 1, 1, 1,
1.877287, -0.9311346, 1.616724, 1, 1, 1, 1, 1,
1.904244, 0.06420247, 1.307767, 1, 1, 1, 1, 1,
1.909058, 2.690374, 0.8325317, 1, 1, 1, 1, 1,
1.913257, 1.247319, 1.916513, 1, 1, 1, 1, 1,
1.933108, -1.485721, 1.378522, 1, 1, 1, 1, 1,
1.944601, 0.5680864, 0.2467607, 1, 1, 1, 1, 1,
1.954552, 1.728951, 1.331461, 1, 1, 1, 1, 1,
1.958651, 0.6734228, 0.6214418, 1, 1, 1, 1, 1,
1.960743, -0.8898857, 0.8978025, 1, 1, 1, 1, 1,
1.973983, 0.886274, 0.2692112, 0, 0, 1, 1, 1,
2.001406, -1.765267, 4.616085, 1, 0, 0, 1, 1,
2.016412, -1.836857, 2.284611, 1, 0, 0, 1, 1,
2.03988, 2.164177, -0.235942, 1, 0, 0, 1, 1,
2.059038, 1.575423, 0.9524317, 1, 0, 0, 1, 1,
2.079248, -1.415167, 1.620763, 1, 0, 0, 1, 1,
2.11422, 1.415801, 2.17873, 0, 0, 0, 1, 1,
2.16714, -0.7283649, 1.199271, 0, 0, 0, 1, 1,
2.17061, -0.2463171, 1.723608, 0, 0, 0, 1, 1,
2.208132, 0.7645786, 0.05381836, 0, 0, 0, 1, 1,
2.214771, -1.057492, 1.960064, 0, 0, 0, 1, 1,
2.315257, -1.517169, 0.5523658, 0, 0, 0, 1, 1,
2.334229, 1.93361, 0.5936719, 0, 0, 0, 1, 1,
2.385286, -0.1776466, 1.670523, 1, 1, 1, 1, 1,
2.473318, -0.5134338, 1.078862, 1, 1, 1, 1, 1,
2.883825, 0.1188448, -0.6425878, 1, 1, 1, 1, 1,
2.890574, 0.5912601, 1.421563, 1, 1, 1, 1, 1,
2.896081, -1.237229, 0.9354396, 1, 1, 1, 1, 1,
3.251484, 0.02121521, 0.1324396, 1, 1, 1, 1, 1,
3.431848, -1.99617, 4.985429, 1, 1, 1, 1, 1
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
var radius = 9.527974;
var distance = 33.46661;
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
mvMatrix.translate( -0.1586611, -0.07310414, 0.34779 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.46661);
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
