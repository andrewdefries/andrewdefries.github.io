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
-3.631116, -0.2766314, -1.87828, 1, 0, 0, 1,
-3.060225, -1.51481, -2.188779, 1, 0.007843138, 0, 1,
-2.626867, 1.087777, -2.296846, 1, 0.01176471, 0, 1,
-2.471905, 0.6530805, -1.366686, 1, 0.01960784, 0, 1,
-2.434904, -0.9742311, -2.157549, 1, 0.02352941, 0, 1,
-2.380879, -1.01024, -1.758807, 1, 0.03137255, 0, 1,
-2.330514, 1.319027, -1.108103, 1, 0.03529412, 0, 1,
-2.265756, -0.4864283, -1.506443, 1, 0.04313726, 0, 1,
-2.248986, -1.849712, -0.6831434, 1, 0.04705882, 0, 1,
-2.211325, -0.3316419, -2.269928, 1, 0.05490196, 0, 1,
-2.184361, -0.3367089, -2.003738, 1, 0.05882353, 0, 1,
-2.168505, -0.9614239, -1.755264, 1, 0.06666667, 0, 1,
-2.15796, 1.119287, -2.36914, 1, 0.07058824, 0, 1,
-2.128211, -0.5978332, -2.987319, 1, 0.07843138, 0, 1,
-2.124591, -0.3840284, 0.1310957, 1, 0.08235294, 0, 1,
-2.100197, 1.260321, -1.123736, 1, 0.09019608, 0, 1,
-2.039261, -2.332641, -2.316649, 1, 0.09411765, 0, 1,
-2.016841, 0.3866439, -1.469176, 1, 0.1019608, 0, 1,
-2.010828, 0.2333919, 0.5675287, 1, 0.1098039, 0, 1,
-2.007657, 0.3452454, -0.403426, 1, 0.1137255, 0, 1,
-2.002384, 0.9027504, -0.8013471, 1, 0.1215686, 0, 1,
-1.98237, 0.8832675, -1.615739, 1, 0.1254902, 0, 1,
-1.973403, -0.7736439, -3.104222, 1, 0.1333333, 0, 1,
-1.972773, 0.6800945, -1.864048, 1, 0.1372549, 0, 1,
-1.951608, 0.9187801, -1.289332, 1, 0.145098, 0, 1,
-1.950173, 0.7091523, 0.5285466, 1, 0.1490196, 0, 1,
-1.893371, 1.255483, -0.8120272, 1, 0.1568628, 0, 1,
-1.888956, -0.2925475, -1.919938, 1, 0.1607843, 0, 1,
-1.860646, 0.915065, -0.4319719, 1, 0.1686275, 0, 1,
-1.849332, 1.513805, -1.1115, 1, 0.172549, 0, 1,
-1.831557, -1.792894, -0.8848631, 1, 0.1803922, 0, 1,
-1.829513, -1.859816, -3.135482, 1, 0.1843137, 0, 1,
-1.815607, 0.2404531, -0.3768389, 1, 0.1921569, 0, 1,
-1.809102, 0.6093941, -1.245615, 1, 0.1960784, 0, 1,
-1.76407, -0.7405728, -1.236116, 1, 0.2039216, 0, 1,
-1.736089, -0.9840699, -3.001305, 1, 0.2117647, 0, 1,
-1.730424, 0.8933101, -1.915116, 1, 0.2156863, 0, 1,
-1.725118, 0.2528452, -2.459863, 1, 0.2235294, 0, 1,
-1.713126, 2.192273, -1.940837, 1, 0.227451, 0, 1,
-1.710985, -1.258146, -3.508135, 1, 0.2352941, 0, 1,
-1.697964, -1.356729, -1.952068, 1, 0.2392157, 0, 1,
-1.697528, -1.065101, -2.66873, 1, 0.2470588, 0, 1,
-1.697477, -0.9309091, -3.953418, 1, 0.2509804, 0, 1,
-1.67209, 1.185056, -0.5421348, 1, 0.2588235, 0, 1,
-1.648504, -1.951442, -2.630015, 1, 0.2627451, 0, 1,
-1.647349, 1.452563, 0.4901229, 1, 0.2705882, 0, 1,
-1.642043, -1.271548, -2.203259, 1, 0.2745098, 0, 1,
-1.619013, 0.3225229, -1.001124, 1, 0.282353, 0, 1,
-1.61872, -0.08022068, 0.8969262, 1, 0.2862745, 0, 1,
-1.617246, -1.521367, -2.388854, 1, 0.2941177, 0, 1,
-1.613775, -0.1079501, -1.30337, 1, 0.3019608, 0, 1,
-1.610217, -1.661713, -2.823454, 1, 0.3058824, 0, 1,
-1.606781, 0.3464242, -2.981326, 1, 0.3137255, 0, 1,
-1.590823, -1.20906, -1.061564, 1, 0.3176471, 0, 1,
-1.577723, 0.7466264, -1.837088, 1, 0.3254902, 0, 1,
-1.575481, -2.007678, -2.635664, 1, 0.3294118, 0, 1,
-1.57201, -0.2890576, -0.711793, 1, 0.3372549, 0, 1,
-1.570876, 2.336461, -2.540447, 1, 0.3411765, 0, 1,
-1.558759, -0.3998175, -0.672878, 1, 0.3490196, 0, 1,
-1.558162, 2.134167, -1.127114, 1, 0.3529412, 0, 1,
-1.544799, 0.2961898, -0.629445, 1, 0.3607843, 0, 1,
-1.535887, -1.041716, -2.078357, 1, 0.3647059, 0, 1,
-1.530626, 0.3933783, -1.437353, 1, 0.372549, 0, 1,
-1.510159, -0.5169615, -2.295401, 1, 0.3764706, 0, 1,
-1.508867, -1.427234, -2.464619, 1, 0.3843137, 0, 1,
-1.502603, 0.6785069, -1.433712, 1, 0.3882353, 0, 1,
-1.500859, 0.3068354, -3.339903, 1, 0.3960784, 0, 1,
-1.499202, -1.116569, -3.992791, 1, 0.4039216, 0, 1,
-1.496054, 2.13311, -0.3064554, 1, 0.4078431, 0, 1,
-1.490602, 0.1200248, -3.721521, 1, 0.4156863, 0, 1,
-1.473235, -0.03409474, -1.0606, 1, 0.4196078, 0, 1,
-1.472079, 0.7903814, -0.1719715, 1, 0.427451, 0, 1,
-1.467744, -0.3542604, -2.038156, 1, 0.4313726, 0, 1,
-1.45407, -2.082761, -1.901561, 1, 0.4392157, 0, 1,
-1.411517, -1.079644, -3.662836, 1, 0.4431373, 0, 1,
-1.408845, -1.079379, -4.213477, 1, 0.4509804, 0, 1,
-1.4055, -0.9645701, -1.289281, 1, 0.454902, 0, 1,
-1.401843, -0.3041116, -1.535904, 1, 0.4627451, 0, 1,
-1.39804, -0.8584728, -2.524719, 1, 0.4666667, 0, 1,
-1.3929, -1.027438, -2.590272, 1, 0.4745098, 0, 1,
-1.384368, -0.09861764, -1.589772, 1, 0.4784314, 0, 1,
-1.381696, 1.181784, -0.1640994, 1, 0.4862745, 0, 1,
-1.370046, 0.4462576, -1.767772, 1, 0.4901961, 0, 1,
-1.357862, -1.411365, -2.831914, 1, 0.4980392, 0, 1,
-1.339872, 3.545368, 0.5130893, 1, 0.5058824, 0, 1,
-1.332632, 0.6033961, 0.4265308, 1, 0.509804, 0, 1,
-1.324747, -0.4998269, -1.766852, 1, 0.5176471, 0, 1,
-1.316796, 0.5949203, -1.436711, 1, 0.5215687, 0, 1,
-1.314406, 0.6169205, -0.7168085, 1, 0.5294118, 0, 1,
-1.313709, -0.5486174, -3.715649, 1, 0.5333334, 0, 1,
-1.310261, 0.1583631, -2.242846, 1, 0.5411765, 0, 1,
-1.30679, 0.7451886, -1.094356, 1, 0.5450981, 0, 1,
-1.296234, 0.6770524, -1.302608, 1, 0.5529412, 0, 1,
-1.294815, 1.843891, -0.1623891, 1, 0.5568628, 0, 1,
-1.290066, 0.03168071, -2.624824, 1, 0.5647059, 0, 1,
-1.276518, 0.321488, -0.9022421, 1, 0.5686275, 0, 1,
-1.275658, 0.2327552, -0.6417062, 1, 0.5764706, 0, 1,
-1.2742, -1.234364, -2.475376, 1, 0.5803922, 0, 1,
-1.272314, -0.4954807, -2.373574, 1, 0.5882353, 0, 1,
-1.271037, 0.5224302, -2.910733, 1, 0.5921569, 0, 1,
-1.265474, 1.200467, -0.4308678, 1, 0.6, 0, 1,
-1.263241, 0.2108682, -1.392956, 1, 0.6078432, 0, 1,
-1.262016, 0.34801, 0.5302649, 1, 0.6117647, 0, 1,
-1.247863, -1.062277, -1.939963, 1, 0.6196079, 0, 1,
-1.246663, 0.3758637, -0.381597, 1, 0.6235294, 0, 1,
-1.245448, 2.189444, -0.08749891, 1, 0.6313726, 0, 1,
-1.234551, 1.514417, -4.172306, 1, 0.6352941, 0, 1,
-1.223902, 1.387393, 0.8360294, 1, 0.6431373, 0, 1,
-1.223167, 0.895389, -0.2347192, 1, 0.6470588, 0, 1,
-1.21542, -0.7304535, -3.402715, 1, 0.654902, 0, 1,
-1.215385, -1.749529, -3.637543, 1, 0.6588235, 0, 1,
-1.184071, -0.2200339, -0.9776974, 1, 0.6666667, 0, 1,
-1.183363, 0.7736207, -0.3685498, 1, 0.6705883, 0, 1,
-1.175706, 0.4566258, -1.203006, 1, 0.6784314, 0, 1,
-1.173169, -0.3348975, -1.757753, 1, 0.682353, 0, 1,
-1.170106, 0.8343654, -1.492087, 1, 0.6901961, 0, 1,
-1.159437, 0.02438133, -2.312744, 1, 0.6941177, 0, 1,
-1.143869, 0.1397867, -1.43013, 1, 0.7019608, 0, 1,
-1.142648, 0.4058921, -1.121612, 1, 0.7098039, 0, 1,
-1.136523, -0.5148984, -2.346956, 1, 0.7137255, 0, 1,
-1.135977, -0.3157681, -1.09732, 1, 0.7215686, 0, 1,
-1.132788, 1.135521, 0.7572739, 1, 0.7254902, 0, 1,
-1.129255, 1.498142, -0.8301272, 1, 0.7333333, 0, 1,
-1.122161, -0.02283426, -0.6864781, 1, 0.7372549, 0, 1,
-1.119532, 0.4984522, -0.4129817, 1, 0.7450981, 0, 1,
-1.109704, -1.893829, -2.251691, 1, 0.7490196, 0, 1,
-1.101741, -1.603774, -3.121544, 1, 0.7568628, 0, 1,
-1.097231, 1.046255, -1.068788, 1, 0.7607843, 0, 1,
-1.093404, 0.7247695, -1.176095, 1, 0.7686275, 0, 1,
-1.091748, 0.02220672, -0.1671879, 1, 0.772549, 0, 1,
-1.087356, -0.1402931, -0.8031309, 1, 0.7803922, 0, 1,
-1.084047, 0.2775118, -1.407514, 1, 0.7843137, 0, 1,
-1.083279, 0.2833122, -1.985062, 1, 0.7921569, 0, 1,
-1.07106, -0.4319293, -3.058663, 1, 0.7960784, 0, 1,
-1.070397, 0.6737938, -1.025723, 1, 0.8039216, 0, 1,
-1.068956, 1.787931, -0.2631047, 1, 0.8117647, 0, 1,
-1.061978, 0.5959494, 1.100912, 1, 0.8156863, 0, 1,
-1.05871, -0.1041051, -2.444349, 1, 0.8235294, 0, 1,
-1.057983, -0.2913841, -2.147423, 1, 0.827451, 0, 1,
-1.057971, 1.860811, -0.2355755, 1, 0.8352941, 0, 1,
-1.057047, 0.1160292, -1.266729, 1, 0.8392157, 0, 1,
-1.046455, 0.2395387, -0.5779996, 1, 0.8470588, 0, 1,
-1.045578, -0.2040385, -1.265694, 1, 0.8509804, 0, 1,
-1.044587, 0.2174027, -0.2323112, 1, 0.8588235, 0, 1,
-1.042808, 0.6154895, -0.3902916, 1, 0.8627451, 0, 1,
-1.027695, -0.3554493, -2.678114, 1, 0.8705882, 0, 1,
-1.025256, -0.3746695, -0.5741463, 1, 0.8745098, 0, 1,
-1.025253, -0.09809808, -1.989384, 1, 0.8823529, 0, 1,
-1.019746, 0.6902161, -1.864555, 1, 0.8862745, 0, 1,
-1.009496, -1.794173, -2.6287, 1, 0.8941177, 0, 1,
-1.002587, -0.4619327, -0.2514833, 1, 0.8980392, 0, 1,
-0.9990484, -0.009613791, -1.016126, 1, 0.9058824, 0, 1,
-0.9913673, -0.6023845, -2.387746, 1, 0.9137255, 0, 1,
-0.9886734, -2.422908, -1.562134, 1, 0.9176471, 0, 1,
-0.9881193, 0.06122897, -2.000697, 1, 0.9254902, 0, 1,
-0.9789347, -1.295905, -1.222883, 1, 0.9294118, 0, 1,
-0.9715143, -0.06558463, -3.629788, 1, 0.9372549, 0, 1,
-0.9704816, 0.1753814, -1.065053, 1, 0.9411765, 0, 1,
-0.9695308, 1.484981, -0.9904025, 1, 0.9490196, 0, 1,
-0.9647895, 0.9562463, -0.6351762, 1, 0.9529412, 0, 1,
-0.9612212, 2.075879, -2.620253, 1, 0.9607843, 0, 1,
-0.9569401, -0.04319256, -1.542379, 1, 0.9647059, 0, 1,
-0.9562415, -0.348986, -0.3389463, 1, 0.972549, 0, 1,
-0.9553203, 1.074972, 0.622451, 1, 0.9764706, 0, 1,
-0.9541151, 0.3974649, -1.806491, 1, 0.9843137, 0, 1,
-0.9476275, -0.09935848, -2.238804, 1, 0.9882353, 0, 1,
-0.9393381, 0.1606497, -1.382501, 1, 0.9960784, 0, 1,
-0.9364572, 0.2917665, -4.004099, 0.9960784, 1, 0, 1,
-0.9255548, -0.1037232, -0.8405222, 0.9921569, 1, 0, 1,
-0.9219984, -0.5900623, -2.807517, 0.9843137, 1, 0, 1,
-0.9217262, -1.200605, -1.960946, 0.9803922, 1, 0, 1,
-0.9170824, 0.7103158, -3.278011, 0.972549, 1, 0, 1,
-0.9159436, -0.1504838, -1.051214, 0.9686275, 1, 0, 1,
-0.9119616, -0.02928928, -0.06350396, 0.9607843, 1, 0, 1,
-0.9084391, -0.5994171, -1.338786, 0.9568627, 1, 0, 1,
-0.9001506, -0.8585775, -2.249594, 0.9490196, 1, 0, 1,
-0.8963351, 0.6979229, 0.3841349, 0.945098, 1, 0, 1,
-0.8942472, -0.4926562, -2.043967, 0.9372549, 1, 0, 1,
-0.8907107, 0.3095378, -0.5967144, 0.9333333, 1, 0, 1,
-0.8844301, 0.2615773, -2.957687, 0.9254902, 1, 0, 1,
-0.8843036, 0.5927206, 0.4544746, 0.9215686, 1, 0, 1,
-0.8801093, -0.01171094, -2.384104, 0.9137255, 1, 0, 1,
-0.878974, 1.468058, -2.244914, 0.9098039, 1, 0, 1,
-0.8762851, -1.251068, -3.784534, 0.9019608, 1, 0, 1,
-0.8706896, -2.467396, -4.634344, 0.8941177, 1, 0, 1,
-0.8585716, -1.26598, -2.519159, 0.8901961, 1, 0, 1,
-0.8565821, -1.478094, -2.107643, 0.8823529, 1, 0, 1,
-0.8564635, -0.2158789, -2.958151, 0.8784314, 1, 0, 1,
-0.8504884, -0.3598946, -4.431649, 0.8705882, 1, 0, 1,
-0.850342, -1.957358, -2.232146, 0.8666667, 1, 0, 1,
-0.8485953, 0.3530809, -2.982571, 0.8588235, 1, 0, 1,
-0.8485939, -0.7162291, -2.059878, 0.854902, 1, 0, 1,
-0.8452337, 0.04895504, -2.885911, 0.8470588, 1, 0, 1,
-0.8396383, -1.302648, -1.347715, 0.8431373, 1, 0, 1,
-0.835438, 0.5810546, -0.5755898, 0.8352941, 1, 0, 1,
-0.8236842, 1.722034, 1.235576, 0.8313726, 1, 0, 1,
-0.8128161, 0.8428579, -0.9136298, 0.8235294, 1, 0, 1,
-0.8127403, -1.566014, -2.299444, 0.8196079, 1, 0, 1,
-0.8088623, -0.6066452, -3.20055, 0.8117647, 1, 0, 1,
-0.7961079, 0.8829074, -2.141035, 0.8078431, 1, 0, 1,
-0.7960068, 1.806054, -1.073274, 0.8, 1, 0, 1,
-0.7956917, 1.003217, -0.0003840942, 0.7921569, 1, 0, 1,
-0.7951758, -0.5455326, -1.809699, 0.7882353, 1, 0, 1,
-0.7901276, 0.4645244, 0.6465319, 0.7803922, 1, 0, 1,
-0.7898049, 2.054616, -1.862805, 0.7764706, 1, 0, 1,
-0.7890776, 0.1482274, -0.585187, 0.7686275, 1, 0, 1,
-0.7854137, -0.2894226, -2.18258, 0.7647059, 1, 0, 1,
-0.7842617, -0.3211263, -1.994938, 0.7568628, 1, 0, 1,
-0.7829134, -0.6929327, -1.755954, 0.7529412, 1, 0, 1,
-0.7828371, -3.336788, -3.349491, 0.7450981, 1, 0, 1,
-0.7800713, 0.1162814, -2.279701, 0.7411765, 1, 0, 1,
-0.7779611, 0.9249539, -0.5268413, 0.7333333, 1, 0, 1,
-0.7755011, 1.133014, -1.570851, 0.7294118, 1, 0, 1,
-0.772128, -0.2624081, -2.760522, 0.7215686, 1, 0, 1,
-0.7718785, -0.9803882, -2.846857, 0.7176471, 1, 0, 1,
-0.7707243, 1.85616, 0.03342889, 0.7098039, 1, 0, 1,
-0.7689893, -0.6593436, -2.776921, 0.7058824, 1, 0, 1,
-0.7684768, 1.56751, 0.5625519, 0.6980392, 1, 0, 1,
-0.7684087, 0.5850006, 0.09389337, 0.6901961, 1, 0, 1,
-0.7631146, 0.1805718, -1.557922, 0.6862745, 1, 0, 1,
-0.7573931, 2.02009, -1.09936, 0.6784314, 1, 0, 1,
-0.7540249, 0.7646134, -0.2160724, 0.6745098, 1, 0, 1,
-0.7489201, 1.761175, -0.3682628, 0.6666667, 1, 0, 1,
-0.7397006, 0.9537224, -0.1116778, 0.6627451, 1, 0, 1,
-0.7287532, -0.7446278, -2.019267, 0.654902, 1, 0, 1,
-0.7213857, 0.3675303, -1.816024, 0.6509804, 1, 0, 1,
-0.7197121, 0.1333468, -2.407885, 0.6431373, 1, 0, 1,
-0.7166952, -0.8589517, -1.627892, 0.6392157, 1, 0, 1,
-0.7039522, 1.399279, -0.1204302, 0.6313726, 1, 0, 1,
-0.7026605, 1.42886, 0.2698197, 0.627451, 1, 0, 1,
-0.6987824, -1.225674, -3.684273, 0.6196079, 1, 0, 1,
-0.6963128, -1.035829, -2.935234, 0.6156863, 1, 0, 1,
-0.692942, -0.5281886, -3.539144, 0.6078432, 1, 0, 1,
-0.6876523, 1.216665, -0.4436413, 0.6039216, 1, 0, 1,
-0.6870218, 0.6616891, 0.1887422, 0.5960785, 1, 0, 1,
-0.6793897, -0.6849167, -2.925181, 0.5882353, 1, 0, 1,
-0.6761793, -1.703342, -3.114067, 0.5843138, 1, 0, 1,
-0.674321, 0.3724325, -0.6581053, 0.5764706, 1, 0, 1,
-0.6722273, 0.1039799, 0.7483045, 0.572549, 1, 0, 1,
-0.6702152, 1.552692, -1.198928, 0.5647059, 1, 0, 1,
-0.6687199, -0.2217256, -2.274418, 0.5607843, 1, 0, 1,
-0.6599969, -0.01940545, -1.760664, 0.5529412, 1, 0, 1,
-0.6579354, -0.05207632, -1.633422, 0.5490196, 1, 0, 1,
-0.6562174, -1.268544, -1.848352, 0.5411765, 1, 0, 1,
-0.6531809, 1.167235, -2.206826, 0.5372549, 1, 0, 1,
-0.6526929, -1.136938, -1.059964, 0.5294118, 1, 0, 1,
-0.6518188, -0.1310369, -1.046307, 0.5254902, 1, 0, 1,
-0.649247, -0.9550884, -4.652534, 0.5176471, 1, 0, 1,
-0.6488243, -1.098687, -1.901083, 0.5137255, 1, 0, 1,
-0.6479753, 1.657574, -1.045151, 0.5058824, 1, 0, 1,
-0.6479396, -0.9030225, 0.252098, 0.5019608, 1, 0, 1,
-0.6477186, -0.2378906, 1.037601, 0.4941176, 1, 0, 1,
-0.6449125, -0.8821504, -3.042825, 0.4862745, 1, 0, 1,
-0.6445557, -0.6965721, -4.058506, 0.4823529, 1, 0, 1,
-0.6425019, -0.3882461, -2.852321, 0.4745098, 1, 0, 1,
-0.6402496, -1.249035, -1.271706, 0.4705882, 1, 0, 1,
-0.637782, 0.2639977, -1.687524, 0.4627451, 1, 0, 1,
-0.6231076, 1.168454, -2.329716, 0.4588235, 1, 0, 1,
-0.6206409, -1.172817, -3.096164, 0.4509804, 1, 0, 1,
-0.6181837, 1.000768, -1.496522, 0.4470588, 1, 0, 1,
-0.6123461, 0.224094, -1.613812, 0.4392157, 1, 0, 1,
-0.6115325, -1.565811, -2.364967, 0.4352941, 1, 0, 1,
-0.6099198, 0.005774059, -1.461538, 0.427451, 1, 0, 1,
-0.608071, -0.9973361, -4.19803, 0.4235294, 1, 0, 1,
-0.6060182, -1.343112, -2.500392, 0.4156863, 1, 0, 1,
-0.604598, 0.4315353, -0.6990394, 0.4117647, 1, 0, 1,
-0.6024897, -1.884972, -2.507124, 0.4039216, 1, 0, 1,
-0.5970352, 0.6676301, 0.4689096, 0.3960784, 1, 0, 1,
-0.5954683, -1.586453, -1.950911, 0.3921569, 1, 0, 1,
-0.5934517, 0.6652927, -3.809657, 0.3843137, 1, 0, 1,
-0.5865473, -1.084365, -3.271213, 0.3803922, 1, 0, 1,
-0.5849351, -0.1405551, -3.155323, 0.372549, 1, 0, 1,
-0.582572, 0.4937544, -0.8157696, 0.3686275, 1, 0, 1,
-0.5815468, -1.096638, -3.429205, 0.3607843, 1, 0, 1,
-0.5791122, -2.097996, -3.326915, 0.3568628, 1, 0, 1,
-0.5762313, -0.8861826, -2.881185, 0.3490196, 1, 0, 1,
-0.5726871, -0.6807057, -1.990775, 0.345098, 1, 0, 1,
-0.5704961, -0.08779529, -1.602734, 0.3372549, 1, 0, 1,
-0.5702035, 0.5984803, -0.05096937, 0.3333333, 1, 0, 1,
-0.5681155, 1.462737, -1.23654, 0.3254902, 1, 0, 1,
-0.564467, -1.024155, -2.325992, 0.3215686, 1, 0, 1,
-0.5592859, -0.02252272, -1.143744, 0.3137255, 1, 0, 1,
-0.5591658, 0.1202134, -1.071285, 0.3098039, 1, 0, 1,
-0.5572038, 0.3955616, -1.666624, 0.3019608, 1, 0, 1,
-0.5562071, 0.3833499, -0.04256656, 0.2941177, 1, 0, 1,
-0.5553985, -1.341586, -3.344964, 0.2901961, 1, 0, 1,
-0.5452846, -0.2533478, -2.525458, 0.282353, 1, 0, 1,
-0.5450686, 0.1925514, -2.673537, 0.2784314, 1, 0, 1,
-0.5434756, -0.9413109, -3.413582, 0.2705882, 1, 0, 1,
-0.5377485, 0.5774252, -0.2790211, 0.2666667, 1, 0, 1,
-0.535706, 0.1858971, -1.562133, 0.2588235, 1, 0, 1,
-0.5354711, 1.786269, -1.025031, 0.254902, 1, 0, 1,
-0.535301, 1.4777, -1.45784, 0.2470588, 1, 0, 1,
-0.5326076, -1.329575, -4.413604, 0.2431373, 1, 0, 1,
-0.5323963, -1.215809, -2.499365, 0.2352941, 1, 0, 1,
-0.5230587, -2.619186, -2.42452, 0.2313726, 1, 0, 1,
-0.5221912, -0.5325451, -2.095047, 0.2235294, 1, 0, 1,
-0.5193278, -0.3115144, -1.688236, 0.2196078, 1, 0, 1,
-0.5174565, -1.217039, -2.751998, 0.2117647, 1, 0, 1,
-0.5150518, 0.7903307, 0.2051697, 0.2078431, 1, 0, 1,
-0.5150475, 1.376383, -0.209464, 0.2, 1, 0, 1,
-0.5109304, 0.6151598, -0.5955064, 0.1921569, 1, 0, 1,
-0.5094642, 2.312061, -2.171316, 0.1882353, 1, 0, 1,
-0.5078455, -1.642797, -3.230722, 0.1803922, 1, 0, 1,
-0.5043458, 1.890328, 0.9573355, 0.1764706, 1, 0, 1,
-0.5008842, -1.104558, -1.322242, 0.1686275, 1, 0, 1,
-0.4983027, -1.371561, -1.586451, 0.1647059, 1, 0, 1,
-0.4917375, 0.3530042, -1.983123, 0.1568628, 1, 0, 1,
-0.4819644, -1.244403, -2.552789, 0.1529412, 1, 0, 1,
-0.4800565, 0.4069252, -1.54471, 0.145098, 1, 0, 1,
-0.4744247, 1.345755, -0.5938966, 0.1411765, 1, 0, 1,
-0.4558311, -1.312572, -3.275893, 0.1333333, 1, 0, 1,
-0.4556068, 0.3408311, -0.04929342, 0.1294118, 1, 0, 1,
-0.4535351, 1.055153, -0.9219586, 0.1215686, 1, 0, 1,
-0.4534871, -1.607302, -3.792671, 0.1176471, 1, 0, 1,
-0.4444594, -0.3110325, -1.347325, 0.1098039, 1, 0, 1,
-0.4422292, -0.6349456, -2.344797, 0.1058824, 1, 0, 1,
-0.4401572, 0.3390354, -0.1330786, 0.09803922, 1, 0, 1,
-0.4395733, -0.5295647, -0.9225131, 0.09019608, 1, 0, 1,
-0.4382722, -0.8904141, -3.148906, 0.08627451, 1, 0, 1,
-0.4346701, 1.007672, -0.5443191, 0.07843138, 1, 0, 1,
-0.4336935, 1.318375, 0.1417188, 0.07450981, 1, 0, 1,
-0.4335211, 0.8255574, 1.437514, 0.06666667, 1, 0, 1,
-0.4295752, -0.4725594, -0.6775642, 0.0627451, 1, 0, 1,
-0.423236, -1.99216, -1.496172, 0.05490196, 1, 0, 1,
-0.4213785, -1.190103, -2.013994, 0.05098039, 1, 0, 1,
-0.4210117, 1.161461, 0.3633626, 0.04313726, 1, 0, 1,
-0.4202597, 0.1607388, -2.031675, 0.03921569, 1, 0, 1,
-0.4166767, 0.8189749, -1.255912, 0.03137255, 1, 0, 1,
-0.4155058, 0.6586424, -0.8226371, 0.02745098, 1, 0, 1,
-0.4112503, -1.443598, -2.341177, 0.01960784, 1, 0, 1,
-0.4049534, 1.098131, -0.7382277, 0.01568628, 1, 0, 1,
-0.4006177, -0.555118, -2.797204, 0.007843138, 1, 0, 1,
-0.4004453, 0.6706841, -2.981313, 0.003921569, 1, 0, 1,
-0.3963269, -0.7948421, -2.702255, 0, 1, 0.003921569, 1,
-0.3914928, 1.031668, -0.852673, 0, 1, 0.01176471, 1,
-0.391302, 1.308821, -0.4181859, 0, 1, 0.01568628, 1,
-0.3906229, 1.137948, 0.4263723, 0, 1, 0.02352941, 1,
-0.3828186, 0.5311208, -3.81338, 0, 1, 0.02745098, 1,
-0.3814374, 2.066556, -0.2499046, 0, 1, 0.03529412, 1,
-0.3809947, 0.9794634, -0.872412, 0, 1, 0.03921569, 1,
-0.3807156, -0.8509325, -3.198856, 0, 1, 0.04705882, 1,
-0.3795833, -1.345773, -3.338985, 0, 1, 0.05098039, 1,
-0.3793843, 0.87091, -0.5315103, 0, 1, 0.05882353, 1,
-0.372852, 0.7731422, 0.3025656, 0, 1, 0.0627451, 1,
-0.3703808, -1.412191, -2.714842, 0, 1, 0.07058824, 1,
-0.3671055, 2.383103, -0.7589054, 0, 1, 0.07450981, 1,
-0.3665268, -0.252748, -2.87842, 0, 1, 0.08235294, 1,
-0.3643598, -0.6319898, -1.744813, 0, 1, 0.08627451, 1,
-0.3612506, -0.01186256, -2.48792, 0, 1, 0.09411765, 1,
-0.3580818, 0.9666642, -0.9459859, 0, 1, 0.1019608, 1,
-0.3540129, -0.06425965, -2.364357, 0, 1, 0.1058824, 1,
-0.3524867, -0.6865425, -2.620682, 0, 1, 0.1137255, 1,
-0.3524416, -0.7287638, -2.298852, 0, 1, 0.1176471, 1,
-0.3506072, -0.2867347, -2.260756, 0, 1, 0.1254902, 1,
-0.3482969, 0.5000653, -0.5116565, 0, 1, 0.1294118, 1,
-0.3422809, -0.3214549, -3.289496, 0, 1, 0.1372549, 1,
-0.3395578, 0.7345073, -1.313783, 0, 1, 0.1411765, 1,
-0.3320206, 0.6264817, -1.263561, 0, 1, 0.1490196, 1,
-0.3307274, -0.4693056, -2.82371, 0, 1, 0.1529412, 1,
-0.3245742, -0.6441403, -2.949486, 0, 1, 0.1607843, 1,
-0.3243363, 0.07489017, -1.177549, 0, 1, 0.1647059, 1,
-0.3193939, -1.703164, -2.209391, 0, 1, 0.172549, 1,
-0.3192598, 1.054255, -0.00360158, 0, 1, 0.1764706, 1,
-0.3173265, -0.2291619, -3.201702, 0, 1, 0.1843137, 1,
-0.3160548, 0.3262808, -0.128205, 0, 1, 0.1882353, 1,
-0.3080848, 0.2150248, -0.3765157, 0, 1, 0.1960784, 1,
-0.3074877, -1.096477, -3.821975, 0, 1, 0.2039216, 1,
-0.307044, -0.5196303, -4.250093, 0, 1, 0.2078431, 1,
-0.2982409, 1.183319, -1.20265, 0, 1, 0.2156863, 1,
-0.2958554, -0.1705011, -0.7794142, 0, 1, 0.2196078, 1,
-0.2946366, 0.721386, -2.464219, 0, 1, 0.227451, 1,
-0.2942227, -1.543982, -3.929042, 0, 1, 0.2313726, 1,
-0.2929535, 0.6895581, 0.7684808, 0, 1, 0.2392157, 1,
-0.2880014, 0.777832, -1.242312, 0, 1, 0.2431373, 1,
-0.2877366, 0.231387, -0.3741403, 0, 1, 0.2509804, 1,
-0.2856908, -0.9445249, -3.040899, 0, 1, 0.254902, 1,
-0.2855602, 1.679617, -0.2409059, 0, 1, 0.2627451, 1,
-0.2828429, 0.7706204, -0.7140275, 0, 1, 0.2666667, 1,
-0.2797595, 0.1583554, -0.9628087, 0, 1, 0.2745098, 1,
-0.2766915, -1.202499, -3.461858, 0, 1, 0.2784314, 1,
-0.2755723, -2.595633, -3.183348, 0, 1, 0.2862745, 1,
-0.2755453, -1.900111, -2.610834, 0, 1, 0.2901961, 1,
-0.2746224, -1.551473, -2.45201, 0, 1, 0.2980392, 1,
-0.273773, -1.088161, -2.379363, 0, 1, 0.3058824, 1,
-0.2698062, -0.04904525, -1.763744, 0, 1, 0.3098039, 1,
-0.2673751, -0.4396591, -3.001692, 0, 1, 0.3176471, 1,
-0.2665465, 0.3822185, 0.1567071, 0, 1, 0.3215686, 1,
-0.2640111, 0.6687939, 0.02793843, 0, 1, 0.3294118, 1,
-0.2630282, 1.160864, -0.4326406, 0, 1, 0.3333333, 1,
-0.2621074, -0.3032417, -0.6947826, 0, 1, 0.3411765, 1,
-0.2603636, -0.9973761, -4.908129, 0, 1, 0.345098, 1,
-0.2601535, -1.059967, -1.253439, 0, 1, 0.3529412, 1,
-0.255239, 1.076273, -0.01007385, 0, 1, 0.3568628, 1,
-0.2527332, 0.1929159, 0.3694684, 0, 1, 0.3647059, 1,
-0.2525439, -0.996431, -3.725586, 0, 1, 0.3686275, 1,
-0.250747, 0.4910744, -1.172272, 0, 1, 0.3764706, 1,
-0.249974, -0.2759991, -1.849875, 0, 1, 0.3803922, 1,
-0.2470149, 0.5819329, -0.8355197, 0, 1, 0.3882353, 1,
-0.2446869, 1.441255, -0.7166049, 0, 1, 0.3921569, 1,
-0.242021, -0.9837701, -2.204091, 0, 1, 0.4, 1,
-0.240681, 0.2271644, -2.137331, 0, 1, 0.4078431, 1,
-0.2397844, 1.259164, 0.3676566, 0, 1, 0.4117647, 1,
-0.2378337, 0.8024407, 0.4501135, 0, 1, 0.4196078, 1,
-0.2365178, 2.159566, -0.3936112, 0, 1, 0.4235294, 1,
-0.2352348, -0.2798213, -2.880968, 0, 1, 0.4313726, 1,
-0.233584, -0.2251323, -2.429395, 0, 1, 0.4352941, 1,
-0.2309246, -0.4081395, -2.461986, 0, 1, 0.4431373, 1,
-0.2299571, 1.187243, -0.2733435, 0, 1, 0.4470588, 1,
-0.2282087, 0.4726686, -1.011274, 0, 1, 0.454902, 1,
-0.2274809, 0.8032266, 1.11097, 0, 1, 0.4588235, 1,
-0.2246441, -1.497882, -1.759643, 0, 1, 0.4666667, 1,
-0.2242712, 0.8577658, 0.01187277, 0, 1, 0.4705882, 1,
-0.2235854, 0.8837349, 1.116403, 0, 1, 0.4784314, 1,
-0.2225257, 0.7265297, 0.7103223, 0, 1, 0.4823529, 1,
-0.2200577, 0.1928044, -0.4122565, 0, 1, 0.4901961, 1,
-0.2170898, 0.7351926, -0.3709684, 0, 1, 0.4941176, 1,
-0.2159105, -0.09733336, -1.672184, 0, 1, 0.5019608, 1,
-0.2118925, -0.278186, -0.6118092, 0, 1, 0.509804, 1,
-0.2104196, 0.2995256, -1.660804, 0, 1, 0.5137255, 1,
-0.2101011, -0.1950537, -1.750773, 0, 1, 0.5215687, 1,
-0.2099636, -0.4655846, -2.562862, 0, 1, 0.5254902, 1,
-0.2094245, 0.3921211, -1.486003, 0, 1, 0.5333334, 1,
-0.2044543, -0.4775623, -4.833819, 0, 1, 0.5372549, 1,
-0.2044163, 2.651727, 2.609925, 0, 1, 0.5450981, 1,
-0.2008471, 0.4996124, -0.06262677, 0, 1, 0.5490196, 1,
-0.1962741, 0.715629, -0.1963279, 0, 1, 0.5568628, 1,
-0.1959211, -0.1733408, -2.596091, 0, 1, 0.5607843, 1,
-0.1958594, -0.00587845, -1.646266, 0, 1, 0.5686275, 1,
-0.1908051, 0.1628799, 0.1899905, 0, 1, 0.572549, 1,
-0.1863082, 1.762262, 0.09172261, 0, 1, 0.5803922, 1,
-0.180969, 0.04762507, -1.733363, 0, 1, 0.5843138, 1,
-0.1788934, 0.4692551, -1.062688, 0, 1, 0.5921569, 1,
-0.1728924, -0.9382587, -3.337709, 0, 1, 0.5960785, 1,
-0.1725984, -0.9164799, -3.300133, 0, 1, 0.6039216, 1,
-0.1678082, 1.433533, 0.5537132, 0, 1, 0.6117647, 1,
-0.1667007, -0.9093081, -1.194104, 0, 1, 0.6156863, 1,
-0.1608005, 1.17402, -0.8358364, 0, 1, 0.6235294, 1,
-0.1599375, -0.8262188, -4.312479, 0, 1, 0.627451, 1,
-0.1557553, -0.3620239, -5.745653, 0, 1, 0.6352941, 1,
-0.1541222, 1.017231, 1.112576, 0, 1, 0.6392157, 1,
-0.135523, 0.5233815, 0.2251522, 0, 1, 0.6470588, 1,
-0.1350801, -0.2000456, -2.214081, 0, 1, 0.6509804, 1,
-0.1344984, 1.945385, 1.173994, 0, 1, 0.6588235, 1,
-0.1323315, -0.8008629, -2.432842, 0, 1, 0.6627451, 1,
-0.1313964, 0.7204996, -0.1956581, 0, 1, 0.6705883, 1,
-0.1287364, 1.005015, 2.10357, 0, 1, 0.6745098, 1,
-0.1273347, 0.3569793, -1.962358, 0, 1, 0.682353, 1,
-0.1235813, -0.08416136, -3.459749, 0, 1, 0.6862745, 1,
-0.1233121, 0.4424539, 0.8938859, 0, 1, 0.6941177, 1,
-0.123221, -1.857048, -3.106339, 0, 1, 0.7019608, 1,
-0.1208931, -0.1581471, -1.696298, 0, 1, 0.7058824, 1,
-0.1194363, 0.2382369, -0.6092765, 0, 1, 0.7137255, 1,
-0.1170435, 0.6319155, -0.8297791, 0, 1, 0.7176471, 1,
-0.1120485, 3.189214, 1.706586, 0, 1, 0.7254902, 1,
-0.1113906, 0.637569, 0.8607065, 0, 1, 0.7294118, 1,
-0.1092668, -0.7324141, -2.099548, 0, 1, 0.7372549, 1,
-0.1083307, 1.136716, 0.3608781, 0, 1, 0.7411765, 1,
-0.1079765, 0.006227187, -2.378243, 0, 1, 0.7490196, 1,
-0.1050053, -1.995816, -3.097689, 0, 1, 0.7529412, 1,
-0.1011231, -0.8769879, -2.661807, 0, 1, 0.7607843, 1,
-0.09797935, 0.6369265, -0.009886076, 0, 1, 0.7647059, 1,
-0.09757131, -0.4392005, -6.160989, 0, 1, 0.772549, 1,
-0.09697128, 1.191446, -0.7012075, 0, 1, 0.7764706, 1,
-0.09108052, -0.05172868, -1.895501, 0, 1, 0.7843137, 1,
-0.09044416, 0.9420055, -1.138801, 0, 1, 0.7882353, 1,
-0.08757513, -0.5184922, -3.291707, 0, 1, 0.7960784, 1,
-0.08539671, -1.294682, -2.560958, 0, 1, 0.8039216, 1,
-0.08040895, -1.872118, -2.311502, 0, 1, 0.8078431, 1,
-0.07485446, 1.609067, -1.312312, 0, 1, 0.8156863, 1,
-0.06739029, 0.4443289, 0.2167496, 0, 1, 0.8196079, 1,
-0.05899365, -1.155116, -4.539994, 0, 1, 0.827451, 1,
-0.0572109, -1.019048, -3.752156, 0, 1, 0.8313726, 1,
-0.05617954, 0.3729942, -1.633243, 0, 1, 0.8392157, 1,
-0.05599029, 0.6295865, 0.07447942, 0, 1, 0.8431373, 1,
-0.05555563, -1.744669, -4.219038, 0, 1, 0.8509804, 1,
-0.05516341, -0.2817299, -2.003216, 0, 1, 0.854902, 1,
-0.05094378, 0.6460369, -1.303552, 0, 1, 0.8627451, 1,
-0.05030199, 1.395126, 0.1108824, 0, 1, 0.8666667, 1,
-0.04949234, -0.3496401, -3.319467, 0, 1, 0.8745098, 1,
-0.04750023, -1.418256, -2.442946, 0, 1, 0.8784314, 1,
-0.04461443, -0.841111, -2.990108, 0, 1, 0.8862745, 1,
-0.04142344, -1.451376, -4.229613, 0, 1, 0.8901961, 1,
-0.03937348, -0.4539002, -3.08986, 0, 1, 0.8980392, 1,
-0.03322985, -0.9531364, -3.373323, 0, 1, 0.9058824, 1,
-0.02703589, 1.33451, -1.520067, 0, 1, 0.9098039, 1,
-0.02323078, -0.8093774, -2.606909, 0, 1, 0.9176471, 1,
-0.02256637, -0.1581918, -1.848589, 0, 1, 0.9215686, 1,
-0.02083341, 0.1683492, 0.8071713, 0, 1, 0.9294118, 1,
-0.01958538, -0.1499483, -4.639163, 0, 1, 0.9333333, 1,
-0.0129904, -0.1227312, -4.950714, 0, 1, 0.9411765, 1,
-0.01035656, 0.6793904, 0.5709647, 0, 1, 0.945098, 1,
-0.006304772, -0.2405895, -2.449219, 0, 1, 0.9529412, 1,
-0.002652257, -1.123297, -1.422966, 0, 1, 0.9568627, 1,
0.001430089, -0.4477842, 2.396139, 0, 1, 0.9647059, 1,
0.003741371, 1.059875, 1.303257, 0, 1, 0.9686275, 1,
0.004390252, -0.2908565, 2.549372, 0, 1, 0.9764706, 1,
0.007856566, 0.566565, 0.5637657, 0, 1, 0.9803922, 1,
0.008691947, -1.680363, 2.85026, 0, 1, 0.9882353, 1,
0.008739612, -0.5663215, 3.254623, 0, 1, 0.9921569, 1,
0.01425986, 0.0428271, 2.124759, 0, 1, 1, 1,
0.01564226, -1.17876, 4.442166, 0, 0.9921569, 1, 1,
0.01817004, -0.9313405, 4.282218, 0, 0.9882353, 1, 1,
0.01967769, 0.6079247, -0.04584733, 0, 0.9803922, 1, 1,
0.02024098, -0.2399101, 3.117072, 0, 0.9764706, 1, 1,
0.02147713, -0.2603433, 2.062225, 0, 0.9686275, 1, 1,
0.02164018, 0.5281367, -1.728695, 0, 0.9647059, 1, 1,
0.02181152, -0.6876256, 2.864224, 0, 0.9568627, 1, 1,
0.0220548, -0.5137987, 2.957053, 0, 0.9529412, 1, 1,
0.02554052, -0.5435459, 2.210322, 0, 0.945098, 1, 1,
0.03194623, 0.4796128, -0.4799706, 0, 0.9411765, 1, 1,
0.03761397, 1.346765, -1.185619, 0, 0.9333333, 1, 1,
0.0394266, 0.3883963, 2.337117, 0, 0.9294118, 1, 1,
0.04435701, -0.6323155, 3.600826, 0, 0.9215686, 1, 1,
0.05492492, -0.9063872, 3.975544, 0, 0.9176471, 1, 1,
0.0570514, -0.7709627, 2.842248, 0, 0.9098039, 1, 1,
0.05817414, 0.9277165, 1.141973, 0, 0.9058824, 1, 1,
0.07076516, -2.266463, 1.767038, 0, 0.8980392, 1, 1,
0.07236217, 1.782385, -0.8768017, 0, 0.8901961, 1, 1,
0.07764534, -0.6797959, 2.320924, 0, 0.8862745, 1, 1,
0.07789122, -0.6267996, 3.036165, 0, 0.8784314, 1, 1,
0.0788335, 0.459261, -0.7702042, 0, 0.8745098, 1, 1,
0.07989983, 1.089005, -0.3124681, 0, 0.8666667, 1, 1,
0.08036491, 1.778374, -0.2725205, 0, 0.8627451, 1, 1,
0.08101949, -0.1216097, 2.606133, 0, 0.854902, 1, 1,
0.08883218, 0.2018551, 0.03473327, 0, 0.8509804, 1, 1,
0.1018857, 3.62098, 1.808983, 0, 0.8431373, 1, 1,
0.102635, -2.138448, 4.494366, 0, 0.8392157, 1, 1,
0.1034796, 0.8141307, 1.021308, 0, 0.8313726, 1, 1,
0.1062494, 1.001271, -2.036446, 0, 0.827451, 1, 1,
0.1074367, 0.04166672, 0.8045594, 0, 0.8196079, 1, 1,
0.1088047, 0.3670858, 0.1354159, 0, 0.8156863, 1, 1,
0.1093617, -0.5134809, 2.207432, 0, 0.8078431, 1, 1,
0.1095985, 0.081098, -0.8599992, 0, 0.8039216, 1, 1,
0.1101034, 1.62882, -0.5517882, 0, 0.7960784, 1, 1,
0.1107848, 0.486926, 1.844932, 0, 0.7882353, 1, 1,
0.1148527, 0.5729461, 0.2625358, 0, 0.7843137, 1, 1,
0.1177989, -0.5134946, 2.673966, 0, 0.7764706, 1, 1,
0.1181276, -1.161736, 3.585219, 0, 0.772549, 1, 1,
0.1202298, -0.6400973, 4.693099, 0, 0.7647059, 1, 1,
0.1209383, -0.1392498, 2.92818, 0, 0.7607843, 1, 1,
0.1215967, -0.1316633, 0.4667761, 0, 0.7529412, 1, 1,
0.1252683, 0.8807878, -0.6473767, 0, 0.7490196, 1, 1,
0.1299123, -1.303126, 3.158358, 0, 0.7411765, 1, 1,
0.1312447, -0.7078649, 1.568324, 0, 0.7372549, 1, 1,
0.1320963, -0.7645736, 3.753836, 0, 0.7294118, 1, 1,
0.1366692, -0.01809485, 3.736544, 0, 0.7254902, 1, 1,
0.1368137, -0.1061146, 1.160024, 0, 0.7176471, 1, 1,
0.136866, -1.237688, 4.641267, 0, 0.7137255, 1, 1,
0.1386224, -0.6997949, 3.850909, 0, 0.7058824, 1, 1,
0.1485144, -0.5349905, 0.4161878, 0, 0.6980392, 1, 1,
0.1515689, -1.997863, 1.447195, 0, 0.6941177, 1, 1,
0.1520146, 1.110635, 0.8718311, 0, 0.6862745, 1, 1,
0.1542283, -0.5192872, 2.74605, 0, 0.682353, 1, 1,
0.1663542, 0.4463654, 1.343136, 0, 0.6745098, 1, 1,
0.1669905, 0.362466, 0.3568162, 0, 0.6705883, 1, 1,
0.1703733, 0.01739956, 1.984527, 0, 0.6627451, 1, 1,
0.1737858, -1.285533, 3.165301, 0, 0.6588235, 1, 1,
0.1762296, 1.322136, 0.9294137, 0, 0.6509804, 1, 1,
0.1804634, 0.3575171, 0.9227257, 0, 0.6470588, 1, 1,
0.1811246, 1.155533, 0.6217989, 0, 0.6392157, 1, 1,
0.1832485, 0.8783942, 0.3835427, 0, 0.6352941, 1, 1,
0.1857588, 0.1495217, 0.7781901, 0, 0.627451, 1, 1,
0.1935325, -0.7912921, 2.384478, 0, 0.6235294, 1, 1,
0.1946931, 0.7236364, 0.8350385, 0, 0.6156863, 1, 1,
0.1979042, 2.115255, -0.2343218, 0, 0.6117647, 1, 1,
0.1986254, -0.3782046, 1.415731, 0, 0.6039216, 1, 1,
0.1991396, -0.2852792, 2.289532, 0, 0.5960785, 1, 1,
0.2000438, -0.7741979, 3.554095, 0, 0.5921569, 1, 1,
0.2055375, -0.9950042, 4.043402, 0, 0.5843138, 1, 1,
0.2070132, 0.2942991, -0.03277332, 0, 0.5803922, 1, 1,
0.2113355, 0.7393125, 1.163588, 0, 0.572549, 1, 1,
0.2128092, -2.239958, 2.033153, 0, 0.5686275, 1, 1,
0.2133466, 1.750468, 1.745906, 0, 0.5607843, 1, 1,
0.215323, -2.16195, 2.055583, 0, 0.5568628, 1, 1,
0.2161384, -1.14445, 1.58876, 0, 0.5490196, 1, 1,
0.2187581, 0.5739007, 1.407493, 0, 0.5450981, 1, 1,
0.2222627, -1.613346, 1.723253, 0, 0.5372549, 1, 1,
0.2234903, -0.3825842, -0.03278144, 0, 0.5333334, 1, 1,
0.2235093, 1.340712, -1.767092, 0, 0.5254902, 1, 1,
0.2284615, -1.043733, 3.976473, 0, 0.5215687, 1, 1,
0.2290689, -0.9399964, 1.681172, 0, 0.5137255, 1, 1,
0.2297498, 0.5864362, -0.3960844, 0, 0.509804, 1, 1,
0.229762, -0.5792395, 3.765302, 0, 0.5019608, 1, 1,
0.2359081, 0.3335587, 0.3495556, 0, 0.4941176, 1, 1,
0.2363737, -1.02501, 1.889189, 0, 0.4901961, 1, 1,
0.2420308, 2.092457, -1.397333, 0, 0.4823529, 1, 1,
0.2435996, -0.6410981, 2.105831, 0, 0.4784314, 1, 1,
0.2491826, -0.3118625, 2.060554, 0, 0.4705882, 1, 1,
0.2505694, -0.06369911, 1.358811, 0, 0.4666667, 1, 1,
0.2533994, -0.192051, 3.239432, 0, 0.4588235, 1, 1,
0.2558005, 0.6096175, -0.3555022, 0, 0.454902, 1, 1,
0.2562898, -0.3910644, 1.541555, 0, 0.4470588, 1, 1,
0.2566922, -1.05111, 2.987425, 0, 0.4431373, 1, 1,
0.2587299, -0.7037343, 3.169696, 0, 0.4352941, 1, 1,
0.2598496, 1.166591, 0.9842589, 0, 0.4313726, 1, 1,
0.26099, 0.1202161, 2.28738, 0, 0.4235294, 1, 1,
0.2614729, 0.03888664, 2.055023, 0, 0.4196078, 1, 1,
0.2646916, 0.1475944, 0.6409625, 0, 0.4117647, 1, 1,
0.2653915, 0.312217, 0.3301541, 0, 0.4078431, 1, 1,
0.2659281, 0.3447877, 0.771163, 0, 0.4, 1, 1,
0.2660679, 0.2990643, -0.09458525, 0, 0.3921569, 1, 1,
0.2677148, 0.5886807, 0.8860759, 0, 0.3882353, 1, 1,
0.268976, -0.1247066, 3.098782, 0, 0.3803922, 1, 1,
0.2696467, 0.3166859, 0.2813507, 0, 0.3764706, 1, 1,
0.2697107, 0.8739378, -0.5513773, 0, 0.3686275, 1, 1,
0.2746125, -0.1047199, 3.598528, 0, 0.3647059, 1, 1,
0.2752123, -0.2700222, 1.82956, 0, 0.3568628, 1, 1,
0.2864673, 0.7193547, 0.408292, 0, 0.3529412, 1, 1,
0.2881212, -0.4967285, 3.955198, 0, 0.345098, 1, 1,
0.288753, -0.4404701, 2.335311, 0, 0.3411765, 1, 1,
0.2921394, -0.128928, 1.114604, 0, 0.3333333, 1, 1,
0.2957093, -0.6331603, 0.8649979, 0, 0.3294118, 1, 1,
0.298662, -0.4337832, 2.640551, 0, 0.3215686, 1, 1,
0.3004787, -0.1155983, 1.80493, 0, 0.3176471, 1, 1,
0.3056814, 2.205372, 0.4505524, 0, 0.3098039, 1, 1,
0.3079082, -0.9991452, 3.142798, 0, 0.3058824, 1, 1,
0.31005, 1.44266, 0.5206042, 0, 0.2980392, 1, 1,
0.3110301, -1.097444, 1.789678, 0, 0.2901961, 1, 1,
0.3264086, 2.567307, 0.4606284, 0, 0.2862745, 1, 1,
0.3267885, -0.9838154, 3.196867, 0, 0.2784314, 1, 1,
0.3276077, 1.052723, -0.0743927, 0, 0.2745098, 1, 1,
0.3340637, 0.5234699, 3.144023, 0, 0.2666667, 1, 1,
0.3354418, 0.007550028, 1.586405, 0, 0.2627451, 1, 1,
0.3395731, 1.362786, -1.117934, 0, 0.254902, 1, 1,
0.3426374, 0.7720882, 1.039889, 0, 0.2509804, 1, 1,
0.3481766, -0.2893067, 0.7218528, 0, 0.2431373, 1, 1,
0.3529632, -1.384949, 4.630149, 0, 0.2392157, 1, 1,
0.359105, -0.9675274, 3.234846, 0, 0.2313726, 1, 1,
0.362066, -2.534726, 2.108562, 0, 0.227451, 1, 1,
0.3670726, -0.1102376, 1.587288, 0, 0.2196078, 1, 1,
0.3780231, 1.683619, 0.8947571, 0, 0.2156863, 1, 1,
0.3786471, -0.324435, 2.329173, 0, 0.2078431, 1, 1,
0.3858351, 0.7329734, -0.2938606, 0, 0.2039216, 1, 1,
0.3863397, -0.5936111, 2.522317, 0, 0.1960784, 1, 1,
0.3892049, -1.241281, 2.371488, 0, 0.1882353, 1, 1,
0.389895, -0.5010859, 1.203939, 0, 0.1843137, 1, 1,
0.3926893, 0.4025055, 1.674457, 0, 0.1764706, 1, 1,
0.3947231, 1.341766, 1.122614, 0, 0.172549, 1, 1,
0.3977843, 0.5858617, 1.836675, 0, 0.1647059, 1, 1,
0.3987559, 0.6781929, 1.522171, 0, 0.1607843, 1, 1,
0.4014736, 0.1185083, 0.3776195, 0, 0.1529412, 1, 1,
0.4044291, -1.090597, 3.117323, 0, 0.1490196, 1, 1,
0.4045681, 0.6715866, 1.722638, 0, 0.1411765, 1, 1,
0.4050778, -0.07662907, 2.331987, 0, 0.1372549, 1, 1,
0.4100389, 0.4338294, 0.02998942, 0, 0.1294118, 1, 1,
0.4104432, 0.06713568, 3.163452, 0, 0.1254902, 1, 1,
0.4149497, -0.2362406, 2.463573, 0, 0.1176471, 1, 1,
0.4162489, -0.2178881, 3.240362, 0, 0.1137255, 1, 1,
0.4173596, -0.6674094, 1.753807, 0, 0.1058824, 1, 1,
0.4237021, 0.6060109, 1.93026, 0, 0.09803922, 1, 1,
0.4254963, 0.898187, -0.3214958, 0, 0.09411765, 1, 1,
0.429725, -0.05556922, 1.340009, 0, 0.08627451, 1, 1,
0.4311154, -0.7140259, 2.463068, 0, 0.08235294, 1, 1,
0.4313864, -0.004605152, 3.110755, 0, 0.07450981, 1, 1,
0.4344063, -1.04963, 3.04335, 0, 0.07058824, 1, 1,
0.4344843, -0.3232639, 3.379333, 0, 0.0627451, 1, 1,
0.4463305, 1.169189, 1.703525, 0, 0.05882353, 1, 1,
0.4463734, 1.08363, 0.2634585, 0, 0.05098039, 1, 1,
0.4466163, 0.6543851, 1.359811, 0, 0.04705882, 1, 1,
0.4479606, -0.2154511, 1.14491, 0, 0.03921569, 1, 1,
0.4484318, 1.610711, 0.4356056, 0, 0.03529412, 1, 1,
0.4527982, 1.752819, 0.3112332, 0, 0.02745098, 1, 1,
0.4585178, 0.3829284, -1.097931, 0, 0.02352941, 1, 1,
0.460165, -1.057957, 1.120274, 0, 0.01568628, 1, 1,
0.4623966, 1.369767, 0.9450743, 0, 0.01176471, 1, 1,
0.4670754, -0.7706627, 2.626338, 0, 0.003921569, 1, 1,
0.4693764, 0.9495277, -1.404121, 0.003921569, 0, 1, 1,
0.4748438, 1.265363, -1.750758, 0.007843138, 0, 1, 1,
0.4777991, 1.381412, -0.3741158, 0.01568628, 0, 1, 1,
0.4858795, 1.419827, 2.347264, 0.01960784, 0, 1, 1,
0.4860591, 0.5093893, -0.5683764, 0.02745098, 0, 1, 1,
0.4895411, -0.6515468, 3.012323, 0.03137255, 0, 1, 1,
0.4926183, 0.9023098, 2.253728, 0.03921569, 0, 1, 1,
0.4958704, -1.878811, 3.153486, 0.04313726, 0, 1, 1,
0.4981945, 0.05232911, 1.386222, 0.05098039, 0, 1, 1,
0.5019091, -1.004909, 3.263862, 0.05490196, 0, 1, 1,
0.5025738, 0.01604188, -0.05557036, 0.0627451, 0, 1, 1,
0.5107167, -0.03513738, 0.976905, 0.06666667, 0, 1, 1,
0.5130786, 0.1256196, 2.810222, 0.07450981, 0, 1, 1,
0.5177031, 1.783811, -0.2827405, 0.07843138, 0, 1, 1,
0.5185406, -0.6484154, 2.810805, 0.08627451, 0, 1, 1,
0.5219852, -1.887421, 3.112853, 0.09019608, 0, 1, 1,
0.5220395, -0.238843, 1.742449, 0.09803922, 0, 1, 1,
0.5239822, 0.2378823, 0.4338624, 0.1058824, 0, 1, 1,
0.5320191, 0.7189895, -1.113135, 0.1098039, 0, 1, 1,
0.5321456, 0.07955468, 0.9280239, 0.1176471, 0, 1, 1,
0.5345489, -1.193265, 3.061665, 0.1215686, 0, 1, 1,
0.5347124, 0.4981091, 1.118483, 0.1294118, 0, 1, 1,
0.5392449, -0.6637239, 0.4366613, 0.1333333, 0, 1, 1,
0.5398484, -2.003631, 4.230748, 0.1411765, 0, 1, 1,
0.5439855, -0.3518519, 2.147043, 0.145098, 0, 1, 1,
0.550399, -0.2240683, 2.167388, 0.1529412, 0, 1, 1,
0.5538595, -0.798333, 2.578108, 0.1568628, 0, 1, 1,
0.5540989, 0.01539632, 2.156218, 0.1647059, 0, 1, 1,
0.5552922, 1.886683, 0.6557015, 0.1686275, 0, 1, 1,
0.5581775, -0.5789194, 2.216435, 0.1764706, 0, 1, 1,
0.5622967, 1.513177, 0.4854638, 0.1803922, 0, 1, 1,
0.5634001, 0.59817, 0.9673968, 0.1882353, 0, 1, 1,
0.5636347, -0.3448378, 0.7001796, 0.1921569, 0, 1, 1,
0.5646447, -0.2761453, 1.403224, 0.2, 0, 1, 1,
0.5665739, -0.3667326, 1.817596, 0.2078431, 0, 1, 1,
0.568294, -0.5220637, 0.956435, 0.2117647, 0, 1, 1,
0.5717384, -1.003954, 1.610849, 0.2196078, 0, 1, 1,
0.5737161, -1.625646, 3.347091, 0.2235294, 0, 1, 1,
0.5738043, -1.066494, 3.873201, 0.2313726, 0, 1, 1,
0.5740696, 0.2242242, 1.077573, 0.2352941, 0, 1, 1,
0.5780966, 0.6198041, 0.9134645, 0.2431373, 0, 1, 1,
0.5800126, -0.2199212, 1.580824, 0.2470588, 0, 1, 1,
0.586189, 1.792248, 1.232335, 0.254902, 0, 1, 1,
0.5902216, -0.1206412, 1.718814, 0.2588235, 0, 1, 1,
0.5946886, -1.010154, 2.071591, 0.2666667, 0, 1, 1,
0.5972186, -0.2582514, 2.832579, 0.2705882, 0, 1, 1,
0.5972648, 0.3451489, 0.6365329, 0.2784314, 0, 1, 1,
0.5988376, -1.743897, 2.586452, 0.282353, 0, 1, 1,
0.5993454, 0.545856, -0.2728894, 0.2901961, 0, 1, 1,
0.6001303, 1.205032, 0.8445945, 0.2941177, 0, 1, 1,
0.6003261, -2.283822, 3.702758, 0.3019608, 0, 1, 1,
0.6042045, -0.4481835, 2.357975, 0.3098039, 0, 1, 1,
0.6077645, -0.9317339, 1.970531, 0.3137255, 0, 1, 1,
0.6125314, 0.9848575, -0.1846737, 0.3215686, 0, 1, 1,
0.6468374, 1.349447, -0.001760617, 0.3254902, 0, 1, 1,
0.6487607, -0.6488145, 1.818988, 0.3333333, 0, 1, 1,
0.6503412, -1.214497, 2.495552, 0.3372549, 0, 1, 1,
0.6536022, -0.6665534, 2.244111, 0.345098, 0, 1, 1,
0.6544395, 0.3605112, 1.187542, 0.3490196, 0, 1, 1,
0.6553066, -1.157067, 2.575418, 0.3568628, 0, 1, 1,
0.6577691, -1.953099, 3.261067, 0.3607843, 0, 1, 1,
0.6587625, 0.7024224, -0.1031822, 0.3686275, 0, 1, 1,
0.6609128, 0.3657409, 1.033189, 0.372549, 0, 1, 1,
0.662285, -1.188417, 3.449253, 0.3803922, 0, 1, 1,
0.6670181, -1.082138, 1.461431, 0.3843137, 0, 1, 1,
0.6671864, 0.4960802, 1.497122, 0.3921569, 0, 1, 1,
0.6693337, 0.4529009, 0.9017043, 0.3960784, 0, 1, 1,
0.6703036, 0.7975876, 0.1795112, 0.4039216, 0, 1, 1,
0.6780225, 0.1571873, 1.886559, 0.4117647, 0, 1, 1,
0.683539, -1.266803, 2.327832, 0.4156863, 0, 1, 1,
0.6847229, -0.1241048, -0.03166212, 0.4235294, 0, 1, 1,
0.6995092, -0.2898926, 1.267967, 0.427451, 0, 1, 1,
0.7003601, -1.274939, 2.381964, 0.4352941, 0, 1, 1,
0.7008634, 1.429006, -0.1032693, 0.4392157, 0, 1, 1,
0.7051588, 1.976388, -0.5240238, 0.4470588, 0, 1, 1,
0.7081918, 1.431768, 1.407725, 0.4509804, 0, 1, 1,
0.7113162, -0.1381889, 3.359477, 0.4588235, 0, 1, 1,
0.7193056, 0.5165159, 1.932876, 0.4627451, 0, 1, 1,
0.7196227, -0.3184413, 2.601852, 0.4705882, 0, 1, 1,
0.7216129, -0.6549573, 2.034847, 0.4745098, 0, 1, 1,
0.7320214, -0.150641, 1.103146, 0.4823529, 0, 1, 1,
0.7331279, 0.7514954, 0.6520377, 0.4862745, 0, 1, 1,
0.7383888, 0.1412691, 1.629828, 0.4941176, 0, 1, 1,
0.7396429, -1.302849, 2.077174, 0.5019608, 0, 1, 1,
0.749012, -0.7033026, 2.394666, 0.5058824, 0, 1, 1,
0.7512014, 1.249974, 0.27219, 0.5137255, 0, 1, 1,
0.7580825, -0.793415, 0.9510934, 0.5176471, 0, 1, 1,
0.7605801, 0.204831, 0.7747993, 0.5254902, 0, 1, 1,
0.7706183, -1.760968, 2.806511, 0.5294118, 0, 1, 1,
0.7707234, -1.626302, 3.009485, 0.5372549, 0, 1, 1,
0.7715181, 0.2044455, 2.359925, 0.5411765, 0, 1, 1,
0.7738538, 1.289182, -0.1960109, 0.5490196, 0, 1, 1,
0.7741492, -0.09510381, 2.235357, 0.5529412, 0, 1, 1,
0.7773008, 1.260266, -0.06785619, 0.5607843, 0, 1, 1,
0.7782091, -0.3193628, 2.450638, 0.5647059, 0, 1, 1,
0.779205, -1.514987, 2.607886, 0.572549, 0, 1, 1,
0.7818272, -0.314984, 1.794001, 0.5764706, 0, 1, 1,
0.7855317, -0.6191905, 2.469383, 0.5843138, 0, 1, 1,
0.7896733, -0.2338336, 3.155865, 0.5882353, 0, 1, 1,
0.7921809, -0.2653762, 0.4682384, 0.5960785, 0, 1, 1,
0.7924108, 1.175462, 0.4761286, 0.6039216, 0, 1, 1,
0.7930275, -0.3769462, 2.492681, 0.6078432, 0, 1, 1,
0.7931989, -0.4522309, 1.432829, 0.6156863, 0, 1, 1,
0.7939626, -1.130566, 0.5157318, 0.6196079, 0, 1, 1,
0.8018727, -0.7055767, 3.219672, 0.627451, 0, 1, 1,
0.8034247, -0.421277, 2.118188, 0.6313726, 0, 1, 1,
0.8044466, -1.522638, 0.5641339, 0.6392157, 0, 1, 1,
0.8108658, 0.2139965, 0.2841069, 0.6431373, 0, 1, 1,
0.8120137, 0.9849365, 1.303042, 0.6509804, 0, 1, 1,
0.8185229, -0.1776459, 0.8615524, 0.654902, 0, 1, 1,
0.8281644, 0.05027907, 1.240407, 0.6627451, 0, 1, 1,
0.8283678, 0.5937567, 1.216217, 0.6666667, 0, 1, 1,
0.8284681, 0.4267603, 0.2210192, 0.6745098, 0, 1, 1,
0.8295672, -0.8293494, 1.911596, 0.6784314, 0, 1, 1,
0.8361509, -1.738479, 2.477249, 0.6862745, 0, 1, 1,
0.8373504, 0.0374437, 2.433889, 0.6901961, 0, 1, 1,
0.8376378, -0.1741608, 0.2411607, 0.6980392, 0, 1, 1,
0.8393924, 0.7493669, 2.28731, 0.7058824, 0, 1, 1,
0.8395985, -0.08870519, 0.9891163, 0.7098039, 0, 1, 1,
0.8480607, -1.869796, 2.54519, 0.7176471, 0, 1, 1,
0.8488736, 0.04362763, 2.181424, 0.7215686, 0, 1, 1,
0.8541441, -0.5766788, 3.17542, 0.7294118, 0, 1, 1,
0.8543589, -1.290105, 3.406203, 0.7333333, 0, 1, 1,
0.8600484, -0.1662287, 1.0919, 0.7411765, 0, 1, 1,
0.8660898, 0.5713613, 0.8378685, 0.7450981, 0, 1, 1,
0.8682016, 0.0888827, 0.5834052, 0.7529412, 0, 1, 1,
0.8816226, -0.5200538, 2.500779, 0.7568628, 0, 1, 1,
0.8817406, 0.39218, 1.191194, 0.7647059, 0, 1, 1,
0.8947451, -1.202765, 2.932562, 0.7686275, 0, 1, 1,
0.8950009, -0.5055752, 2.183559, 0.7764706, 0, 1, 1,
0.8971926, -0.9935855, 4.495187, 0.7803922, 0, 1, 1,
0.9001942, 0.2436063, 0.8232716, 0.7882353, 0, 1, 1,
0.9011736, 0.4939395, 1.244874, 0.7921569, 0, 1, 1,
0.9048121, -1.606943, 2.808847, 0.8, 0, 1, 1,
0.9050314, -0.7154452, 1.963213, 0.8078431, 0, 1, 1,
0.937871, -0.809753, 1.222978, 0.8117647, 0, 1, 1,
0.9386644, 0.1193773, -0.3317334, 0.8196079, 0, 1, 1,
0.9479589, 0.215944, 1.5549, 0.8235294, 0, 1, 1,
0.9510806, 0.5374546, 1.658221, 0.8313726, 0, 1, 1,
0.9526572, 0.2610624, 1.184069, 0.8352941, 0, 1, 1,
0.959579, -1.759436, 2.134557, 0.8431373, 0, 1, 1,
0.9646614, -1.661408, 2.581761, 0.8470588, 0, 1, 1,
0.9654962, 2.42104, -0.2066432, 0.854902, 0, 1, 1,
0.9665989, -1.231021, 2.685823, 0.8588235, 0, 1, 1,
0.9752606, -1.640389, 3.144573, 0.8666667, 0, 1, 1,
0.9878318, -0.07544185, 3.224329, 0.8705882, 0, 1, 1,
0.9945146, -0.9540136, 3.145845, 0.8784314, 0, 1, 1,
0.9972813, 0.5817271, 2.699832, 0.8823529, 0, 1, 1,
0.9982358, 0.9585078, 0.04326153, 0.8901961, 0, 1, 1,
0.9990168, -0.03237464, 1.144413, 0.8941177, 0, 1, 1,
0.9999586, 1.729538, 1.431357, 0.9019608, 0, 1, 1,
1.000432, 0.2693824, 1.375463, 0.9098039, 0, 1, 1,
1.007338, 1.291929, 0.6504413, 0.9137255, 0, 1, 1,
1.012764, -0.6740184, 2.419598, 0.9215686, 0, 1, 1,
1.017108, 1.632308, -0.6591119, 0.9254902, 0, 1, 1,
1.023116, 0.1516626, 2.616116, 0.9333333, 0, 1, 1,
1.02778, -0.2402527, 3.956449, 0.9372549, 0, 1, 1,
1.031202, -0.4279587, 2.393357, 0.945098, 0, 1, 1,
1.037115, 0.6426234, 1.031248, 0.9490196, 0, 1, 1,
1.047816, 0.5606489, 0.7504289, 0.9568627, 0, 1, 1,
1.048301, -1.485101, 2.729893, 0.9607843, 0, 1, 1,
1.04855, -2.217096, 1.981364, 0.9686275, 0, 1, 1,
1.050927, -0.858754, 2.231006, 0.972549, 0, 1, 1,
1.056266, 0.4567737, 1.827215, 0.9803922, 0, 1, 1,
1.059718, 0.2669318, 3.501332, 0.9843137, 0, 1, 1,
1.062962, 0.2645974, 0.398755, 0.9921569, 0, 1, 1,
1.063879, -0.02641072, 2.919771, 0.9960784, 0, 1, 1,
1.064782, 1.791518, 0.5464368, 1, 0, 0.9960784, 1,
1.067147, -1.466948, 4.677306, 1, 0, 0.9882353, 1,
1.074124, 0.4680167, 0.5400764, 1, 0, 0.9843137, 1,
1.07422, 0.9595065, -0.228344, 1, 0, 0.9764706, 1,
1.080117, -1.420855, 3.56378, 1, 0, 0.972549, 1,
1.085205, -1.177969, 2.195234, 1, 0, 0.9647059, 1,
1.090783, 1.221505, -0.3687852, 1, 0, 0.9607843, 1,
1.094262, 1.024262, 0.4742752, 1, 0, 0.9529412, 1,
1.102827, 0.7623963, 2.40709, 1, 0, 0.9490196, 1,
1.104285, 0.01283756, 2.998005, 1, 0, 0.9411765, 1,
1.105132, -0.6308125, 1.132409, 1, 0, 0.9372549, 1,
1.105866, -1.199458, 2.573878, 1, 0, 0.9294118, 1,
1.107663, -0.4473177, 1.853747, 1, 0, 0.9254902, 1,
1.114069, 0.5874159, 2.150762, 1, 0, 0.9176471, 1,
1.114496, 0.5545928, 0.1280691, 1, 0, 0.9137255, 1,
1.120935, 1.179097, 0.1260197, 1, 0, 0.9058824, 1,
1.125849, 0.5588636, 2.627481, 1, 0, 0.9019608, 1,
1.127235, -0.6307633, 1.062567, 1, 0, 0.8941177, 1,
1.127247, -0.3861223, 3.684443, 1, 0, 0.8862745, 1,
1.128353, -0.3730021, 1.225683, 1, 0, 0.8823529, 1,
1.128713, 0.4728757, 0.7945243, 1, 0, 0.8745098, 1,
1.131324, 0.9730442, 1.189603, 1, 0, 0.8705882, 1,
1.134147, -0.4088342, 1.095319, 1, 0, 0.8627451, 1,
1.139, -0.4291188, 1.411845, 1, 0, 0.8588235, 1,
1.146071, 1.72409, 1.27678, 1, 0, 0.8509804, 1,
1.150318, 0.9456443, 1.531501, 1, 0, 0.8470588, 1,
1.153781, 1.76524, 0.856207, 1, 0, 0.8392157, 1,
1.156117, -0.4649236, 1.039586, 1, 0, 0.8352941, 1,
1.156961, -0.3699529, 2.287135, 1, 0, 0.827451, 1,
1.159824, 0.05283286, 2.798802, 1, 0, 0.8235294, 1,
1.160365, -0.1949689, 2.703857, 1, 0, 0.8156863, 1,
1.162616, 0.05294317, 0.3957392, 1, 0, 0.8117647, 1,
1.168182, -0.382428, 2.321684, 1, 0, 0.8039216, 1,
1.17439, 1.045682, 0.7808348, 1, 0, 0.7960784, 1,
1.180347, -0.3794995, 1.460405, 1, 0, 0.7921569, 1,
1.182429, 0.7239538, 1.007846, 1, 0, 0.7843137, 1,
1.184911, -0.105254, 1.785582, 1, 0, 0.7803922, 1,
1.191965, -0.1458176, 3.196444, 1, 0, 0.772549, 1,
1.197442, -0.7917967, 2.512488, 1, 0, 0.7686275, 1,
1.207859, -0.7375841, 2.815598, 1, 0, 0.7607843, 1,
1.208218, -0.1831405, 0.9513243, 1, 0, 0.7568628, 1,
1.212244, -0.1889334, 3.659895, 1, 0, 0.7490196, 1,
1.213485, 0.7504308, 3.444561, 1, 0, 0.7450981, 1,
1.214413, -1.024586, 1.357689, 1, 0, 0.7372549, 1,
1.214785, -2.547526, 4.066269, 1, 0, 0.7333333, 1,
1.224992, -0.1922828, 1.229348, 1, 0, 0.7254902, 1,
1.225726, -0.9425195, 1.924042, 1, 0, 0.7215686, 1,
1.226596, 0.2714574, 1.462935, 1, 0, 0.7137255, 1,
1.228171, -0.4155937, 1.424399, 1, 0, 0.7098039, 1,
1.240059, -1.129532, 3.658569, 1, 0, 0.7019608, 1,
1.242172, 0.08998664, 1.075531, 1, 0, 0.6941177, 1,
1.242302, -0.6554316, 1.877695, 1, 0, 0.6901961, 1,
1.246119, 2.630693, 0.543018, 1, 0, 0.682353, 1,
1.250353, -0.06245136, 0.207297, 1, 0, 0.6784314, 1,
1.259121, 0.6089969, 1.579956, 1, 0, 0.6705883, 1,
1.263823, -0.2672794, 1.584335, 1, 0, 0.6666667, 1,
1.269877, -0.5514745, 2.670992, 1, 0, 0.6588235, 1,
1.270308, -0.7121687, 2.618441, 1, 0, 0.654902, 1,
1.280073, 0.3633334, 2.100038, 1, 0, 0.6470588, 1,
1.28021, -0.6111524, 2.967532, 1, 0, 0.6431373, 1,
1.282529, -0.5078463, 2.133518, 1, 0, 0.6352941, 1,
1.287678, 1.846946, 0.9856571, 1, 0, 0.6313726, 1,
1.303644, 0.4797273, 1.634458, 1, 0, 0.6235294, 1,
1.318948, 0.4882416, 0.6692833, 1, 0, 0.6196079, 1,
1.320607, 1.004533, 0.1499054, 1, 0, 0.6117647, 1,
1.323665, 0.1047873, 0.02222254, 1, 0, 0.6078432, 1,
1.325675, -1.014785, 1.967715, 1, 0, 0.6, 1,
1.332564, 0.2480473, 2.574244, 1, 0, 0.5921569, 1,
1.335763, 0.05816985, 1.816257, 1, 0, 0.5882353, 1,
1.341776, 0.02826226, 0.893169, 1, 0, 0.5803922, 1,
1.349404, 0.1328318, 0.7087065, 1, 0, 0.5764706, 1,
1.354712, -1.970682, 1.884578, 1, 0, 0.5686275, 1,
1.358604, -1.320715, 2.12045, 1, 0, 0.5647059, 1,
1.366713, 1.768658, 0.1437048, 1, 0, 0.5568628, 1,
1.368146, 0.5723111, 1.910851, 1, 0, 0.5529412, 1,
1.370317, -0.09803493, 1.643328, 1, 0, 0.5450981, 1,
1.373145, -0.03860774, 1.284124, 1, 0, 0.5411765, 1,
1.379864, 0.8606964, 1.165848, 1, 0, 0.5333334, 1,
1.386411, -1.494339, 1.778192, 1, 0, 0.5294118, 1,
1.389943, -0.5973799, 2.949134, 1, 0, 0.5215687, 1,
1.3935, -0.2887269, 0.2101045, 1, 0, 0.5176471, 1,
1.394412, 0.4300087, 0.2552043, 1, 0, 0.509804, 1,
1.401807, -0.2273082, 0.2172091, 1, 0, 0.5058824, 1,
1.403294, -0.02856248, 1.314762, 1, 0, 0.4980392, 1,
1.411787, -0.6445378, 1.401729, 1, 0, 0.4901961, 1,
1.412403, -0.5879534, 0.2415738, 1, 0, 0.4862745, 1,
1.412799, -1.407158, 1.69318, 1, 0, 0.4784314, 1,
1.429784, 0.953761, -0.0115919, 1, 0, 0.4745098, 1,
1.444809, 0.2529162, 1.762888, 1, 0, 0.4666667, 1,
1.448591, -2.365947, 2.837166, 1, 0, 0.4627451, 1,
1.450009, -1.31487, 1.505028, 1, 0, 0.454902, 1,
1.457677, -0.1409798, 1.087981, 1, 0, 0.4509804, 1,
1.465323, 0.5591701, 2.28317, 1, 0, 0.4431373, 1,
1.465531, -0.06000292, 1.545929, 1, 0, 0.4392157, 1,
1.480447, -0.383476, 2.446891, 1, 0, 0.4313726, 1,
1.489134, 1.024375, 1.309265, 1, 0, 0.427451, 1,
1.490564, -1.736402, 3.249514, 1, 0, 0.4196078, 1,
1.50279, -0.7428918, 2.312598, 1, 0, 0.4156863, 1,
1.525369, -0.09832009, 0.9139805, 1, 0, 0.4078431, 1,
1.528881, 1.061431, 1.042182, 1, 0, 0.4039216, 1,
1.533015, 0.6903167, 0.1556609, 1, 0, 0.3960784, 1,
1.539897, -0.6026017, 2.637536, 1, 0, 0.3882353, 1,
1.555793, -1.101352, 2.436619, 1, 0, 0.3843137, 1,
1.562163, 0.4824561, -1.122162, 1, 0, 0.3764706, 1,
1.562539, -0.4918316, 2.762476, 1, 0, 0.372549, 1,
1.568397, -0.2979877, 3.473158, 1, 0, 0.3647059, 1,
1.571899, -0.7711297, 1.565105, 1, 0, 0.3607843, 1,
1.575328, 0.3138826, 0.3756748, 1, 0, 0.3529412, 1,
1.575721, 2.205066, -0.3566169, 1, 0, 0.3490196, 1,
1.584195, -0.7635397, 0.8755366, 1, 0, 0.3411765, 1,
1.58893, 2.800704, 1.521132, 1, 0, 0.3372549, 1,
1.58954, 0.01422146, 1.73663, 1, 0, 0.3294118, 1,
1.58985, 1.895032, 1.506393, 1, 0, 0.3254902, 1,
1.6021, 0.2757737, 2.111769, 1, 0, 0.3176471, 1,
1.611971, 1.008765, 2.12699, 1, 0, 0.3137255, 1,
1.61697, 1.00055, -0.234014, 1, 0, 0.3058824, 1,
1.623046, -0.7568469, 1.862903, 1, 0, 0.2980392, 1,
1.64224, -0.2596286, 2.225252, 1, 0, 0.2941177, 1,
1.642479, -0.3480685, 0.8987039, 1, 0, 0.2862745, 1,
1.643882, 0.9616876, 1.456476, 1, 0, 0.282353, 1,
1.65901, -0.7197585, 0.4421438, 1, 0, 0.2745098, 1,
1.676926, -1.458902, 2.478516, 1, 0, 0.2705882, 1,
1.690908, -0.9163204, 2.292641, 1, 0, 0.2627451, 1,
1.722715, -0.7346749, 1.347451, 1, 0, 0.2588235, 1,
1.750669, -1.255359, 1.48424, 1, 0, 0.2509804, 1,
1.769351, 0.4092734, 1.132051, 1, 0, 0.2470588, 1,
1.772254, 1.615726, 1.136364, 1, 0, 0.2392157, 1,
1.799823, 0.320885, 0.2019855, 1, 0, 0.2352941, 1,
1.806331, -0.1437144, 1.887027, 1, 0, 0.227451, 1,
1.809331, 0.8763383, 1.731012, 1, 0, 0.2235294, 1,
1.853241, 0.2721167, 1.251536, 1, 0, 0.2156863, 1,
1.853412, 1.458979, 1.340967, 1, 0, 0.2117647, 1,
1.871882, 0.4901341, 0.106205, 1, 0, 0.2039216, 1,
1.880231, 0.4197801, 0.3766856, 1, 0, 0.1960784, 1,
1.88927, 0.8369252, 1.395433, 1, 0, 0.1921569, 1,
1.899759, 0.5874791, 0.4316401, 1, 0, 0.1843137, 1,
1.910108, 1.549988, 1.470345, 1, 0, 0.1803922, 1,
1.923852, 0.4561285, 1.188759, 1, 0, 0.172549, 1,
1.956005, 0.9718987, 0.6500229, 1, 0, 0.1686275, 1,
2.001607, 0.8365326, 1.224545, 1, 0, 0.1607843, 1,
2.010714, 1.35788, 0.5760276, 1, 0, 0.1568628, 1,
2.013412, -0.4746765, 3.560407, 1, 0, 0.1490196, 1,
2.016532, -0.4311723, 2.744763, 1, 0, 0.145098, 1,
2.085133, -0.2259806, 1.692126, 1, 0, 0.1372549, 1,
2.089048, -1.417132, 2.320371, 1, 0, 0.1333333, 1,
2.091506, 1.924644, 1.341359, 1, 0, 0.1254902, 1,
2.120684, -1.839445, 2.499827, 1, 0, 0.1215686, 1,
2.145471, 2.503547, -1.48151, 1, 0, 0.1137255, 1,
2.205501, -0.9444571, 2.042402, 1, 0, 0.1098039, 1,
2.223583, 0.969106, -0.1825401, 1, 0, 0.1019608, 1,
2.225175, 0.03493597, 2.602994, 1, 0, 0.09411765, 1,
2.232925, -0.6130856, 1.304274, 1, 0, 0.09019608, 1,
2.234251, -0.2719723, 1.931193, 1, 0, 0.08235294, 1,
2.238703, -2.523571, 1.76187, 1, 0, 0.07843138, 1,
2.240788, -0.8337736, 2.1073, 1, 0, 0.07058824, 1,
2.258879, -0.537647, 1.542141, 1, 0, 0.06666667, 1,
2.262713, 0.3147706, 1.547397, 1, 0, 0.05882353, 1,
2.294609, -0.2043004, 0.0744991, 1, 0, 0.05490196, 1,
2.297397, 0.07429332, 1.274955, 1, 0, 0.04705882, 1,
2.336259, -1.365487, 1.827121, 1, 0, 0.04313726, 1,
2.423559, -0.7843637, 0.8401942, 1, 0, 0.03529412, 1,
2.507799, 2.184154, 1.450614, 1, 0, 0.03137255, 1,
2.695571, -1.206146, 2.222104, 1, 0, 0.02352941, 1,
2.930302, 0.6350011, 4.200896, 1, 0, 0.01960784, 1,
2.964419, -0.9283074, 2.042999, 1, 0, 0.01176471, 1,
3.157004, -1.616564, 2.418663, 1, 0, 0.007843138, 1
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
-0.2370563, -4.51613, -8.000756, 0, -0.5, 0.5, 0.5,
-0.2370563, -4.51613, -8.000756, 1, -0.5, 0.5, 0.5,
-0.2370563, -4.51613, -8.000756, 1, 1.5, 0.5, 0.5,
-0.2370563, -4.51613, -8.000756, 0, 1.5, 0.5, 0.5
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
-4.781703, 0.1420958, -8.000756, 0, -0.5, 0.5, 0.5,
-4.781703, 0.1420958, -8.000756, 1, -0.5, 0.5, 0.5,
-4.781703, 0.1420958, -8.000756, 1, 1.5, 0.5, 0.5,
-4.781703, 0.1420958, -8.000756, 0, 1.5, 0.5, 0.5
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
-4.781703, -4.51613, -0.7339449, 0, -0.5, 0.5, 0.5,
-4.781703, -4.51613, -0.7339449, 1, -0.5, 0.5, 0.5,
-4.781703, -4.51613, -0.7339449, 1, 1.5, 0.5, 0.5,
-4.781703, -4.51613, -0.7339449, 0, 1.5, 0.5, 0.5
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
-3, -3.441155, -6.3238,
3, -3.441155, -6.3238,
-3, -3.441155, -6.3238,
-3, -3.620317, -6.603293,
-2, -3.441155, -6.3238,
-2, -3.620317, -6.603293,
-1, -3.441155, -6.3238,
-1, -3.620317, -6.603293,
0, -3.441155, -6.3238,
0, -3.620317, -6.603293,
1, -3.441155, -6.3238,
1, -3.620317, -6.603293,
2, -3.441155, -6.3238,
2, -3.620317, -6.603293,
3, -3.441155, -6.3238,
3, -3.620317, -6.603293
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
-3, -3.978642, -7.162278, 0, -0.5, 0.5, 0.5,
-3, -3.978642, -7.162278, 1, -0.5, 0.5, 0.5,
-3, -3.978642, -7.162278, 1, 1.5, 0.5, 0.5,
-3, -3.978642, -7.162278, 0, 1.5, 0.5, 0.5,
-2, -3.978642, -7.162278, 0, -0.5, 0.5, 0.5,
-2, -3.978642, -7.162278, 1, -0.5, 0.5, 0.5,
-2, -3.978642, -7.162278, 1, 1.5, 0.5, 0.5,
-2, -3.978642, -7.162278, 0, 1.5, 0.5, 0.5,
-1, -3.978642, -7.162278, 0, -0.5, 0.5, 0.5,
-1, -3.978642, -7.162278, 1, -0.5, 0.5, 0.5,
-1, -3.978642, -7.162278, 1, 1.5, 0.5, 0.5,
-1, -3.978642, -7.162278, 0, 1.5, 0.5, 0.5,
0, -3.978642, -7.162278, 0, -0.5, 0.5, 0.5,
0, -3.978642, -7.162278, 1, -0.5, 0.5, 0.5,
0, -3.978642, -7.162278, 1, 1.5, 0.5, 0.5,
0, -3.978642, -7.162278, 0, 1.5, 0.5, 0.5,
1, -3.978642, -7.162278, 0, -0.5, 0.5, 0.5,
1, -3.978642, -7.162278, 1, -0.5, 0.5, 0.5,
1, -3.978642, -7.162278, 1, 1.5, 0.5, 0.5,
1, -3.978642, -7.162278, 0, 1.5, 0.5, 0.5,
2, -3.978642, -7.162278, 0, -0.5, 0.5, 0.5,
2, -3.978642, -7.162278, 1, -0.5, 0.5, 0.5,
2, -3.978642, -7.162278, 1, 1.5, 0.5, 0.5,
2, -3.978642, -7.162278, 0, 1.5, 0.5, 0.5,
3, -3.978642, -7.162278, 0, -0.5, 0.5, 0.5,
3, -3.978642, -7.162278, 1, -0.5, 0.5, 0.5,
3, -3.978642, -7.162278, 1, 1.5, 0.5, 0.5,
3, -3.978642, -7.162278, 0, 1.5, 0.5, 0.5
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
-3.732938, -3, -6.3238,
-3.732938, 3, -6.3238,
-3.732938, -3, -6.3238,
-3.907732, -3, -6.603293,
-3.732938, -2, -6.3238,
-3.907732, -2, -6.603293,
-3.732938, -1, -6.3238,
-3.907732, -1, -6.603293,
-3.732938, 0, -6.3238,
-3.907732, 0, -6.603293,
-3.732938, 1, -6.3238,
-3.907732, 1, -6.603293,
-3.732938, 2, -6.3238,
-3.907732, 2, -6.603293,
-3.732938, 3, -6.3238,
-3.907732, 3, -6.603293
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
-4.25732, -3, -7.162278, 0, -0.5, 0.5, 0.5,
-4.25732, -3, -7.162278, 1, -0.5, 0.5, 0.5,
-4.25732, -3, -7.162278, 1, 1.5, 0.5, 0.5,
-4.25732, -3, -7.162278, 0, 1.5, 0.5, 0.5,
-4.25732, -2, -7.162278, 0, -0.5, 0.5, 0.5,
-4.25732, -2, -7.162278, 1, -0.5, 0.5, 0.5,
-4.25732, -2, -7.162278, 1, 1.5, 0.5, 0.5,
-4.25732, -2, -7.162278, 0, 1.5, 0.5, 0.5,
-4.25732, -1, -7.162278, 0, -0.5, 0.5, 0.5,
-4.25732, -1, -7.162278, 1, -0.5, 0.5, 0.5,
-4.25732, -1, -7.162278, 1, 1.5, 0.5, 0.5,
-4.25732, -1, -7.162278, 0, 1.5, 0.5, 0.5,
-4.25732, 0, -7.162278, 0, -0.5, 0.5, 0.5,
-4.25732, 0, -7.162278, 1, -0.5, 0.5, 0.5,
-4.25732, 0, -7.162278, 1, 1.5, 0.5, 0.5,
-4.25732, 0, -7.162278, 0, 1.5, 0.5, 0.5,
-4.25732, 1, -7.162278, 0, -0.5, 0.5, 0.5,
-4.25732, 1, -7.162278, 1, -0.5, 0.5, 0.5,
-4.25732, 1, -7.162278, 1, 1.5, 0.5, 0.5,
-4.25732, 1, -7.162278, 0, 1.5, 0.5, 0.5,
-4.25732, 2, -7.162278, 0, -0.5, 0.5, 0.5,
-4.25732, 2, -7.162278, 1, -0.5, 0.5, 0.5,
-4.25732, 2, -7.162278, 1, 1.5, 0.5, 0.5,
-4.25732, 2, -7.162278, 0, 1.5, 0.5, 0.5,
-4.25732, 3, -7.162278, 0, -0.5, 0.5, 0.5,
-4.25732, 3, -7.162278, 1, -0.5, 0.5, 0.5,
-4.25732, 3, -7.162278, 1, 1.5, 0.5, 0.5,
-4.25732, 3, -7.162278, 0, 1.5, 0.5, 0.5
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
-3.732938, -3.441155, -6,
-3.732938, -3.441155, 4,
-3.732938, -3.441155, -6,
-3.907732, -3.620317, -6,
-3.732938, -3.441155, -4,
-3.907732, -3.620317, -4,
-3.732938, -3.441155, -2,
-3.907732, -3.620317, -2,
-3.732938, -3.441155, 0,
-3.907732, -3.620317, 0,
-3.732938, -3.441155, 2,
-3.907732, -3.620317, 2,
-3.732938, -3.441155, 4,
-3.907732, -3.620317, 4
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
-4.25732, -3.978642, -6, 0, -0.5, 0.5, 0.5,
-4.25732, -3.978642, -6, 1, -0.5, 0.5, 0.5,
-4.25732, -3.978642, -6, 1, 1.5, 0.5, 0.5,
-4.25732, -3.978642, -6, 0, 1.5, 0.5, 0.5,
-4.25732, -3.978642, -4, 0, -0.5, 0.5, 0.5,
-4.25732, -3.978642, -4, 1, -0.5, 0.5, 0.5,
-4.25732, -3.978642, -4, 1, 1.5, 0.5, 0.5,
-4.25732, -3.978642, -4, 0, 1.5, 0.5, 0.5,
-4.25732, -3.978642, -2, 0, -0.5, 0.5, 0.5,
-4.25732, -3.978642, -2, 1, -0.5, 0.5, 0.5,
-4.25732, -3.978642, -2, 1, 1.5, 0.5, 0.5,
-4.25732, -3.978642, -2, 0, 1.5, 0.5, 0.5,
-4.25732, -3.978642, 0, 0, -0.5, 0.5, 0.5,
-4.25732, -3.978642, 0, 1, -0.5, 0.5, 0.5,
-4.25732, -3.978642, 0, 1, 1.5, 0.5, 0.5,
-4.25732, -3.978642, 0, 0, 1.5, 0.5, 0.5,
-4.25732, -3.978642, 2, 0, -0.5, 0.5, 0.5,
-4.25732, -3.978642, 2, 1, -0.5, 0.5, 0.5,
-4.25732, -3.978642, 2, 1, 1.5, 0.5, 0.5,
-4.25732, -3.978642, 2, 0, 1.5, 0.5, 0.5,
-4.25732, -3.978642, 4, 0, -0.5, 0.5, 0.5,
-4.25732, -3.978642, 4, 1, -0.5, 0.5, 0.5,
-4.25732, -3.978642, 4, 1, 1.5, 0.5, 0.5,
-4.25732, -3.978642, 4, 0, 1.5, 0.5, 0.5
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
-3.732938, -3.441155, -6.3238,
-3.732938, 3.725347, -6.3238,
-3.732938, -3.441155, 4.85591,
-3.732938, 3.725347, 4.85591,
-3.732938, -3.441155, -6.3238,
-3.732938, -3.441155, 4.85591,
-3.732938, 3.725347, -6.3238,
-3.732938, 3.725347, 4.85591,
-3.732938, -3.441155, -6.3238,
3.258826, -3.441155, -6.3238,
-3.732938, -3.441155, 4.85591,
3.258826, -3.441155, 4.85591,
-3.732938, 3.725347, -6.3238,
3.258826, 3.725347, -6.3238,
-3.732938, 3.725347, 4.85591,
3.258826, 3.725347, 4.85591,
3.258826, -3.441155, -6.3238,
3.258826, 3.725347, -6.3238,
3.258826, -3.441155, 4.85591,
3.258826, 3.725347, 4.85591,
3.258826, -3.441155, -6.3238,
3.258826, -3.441155, 4.85591,
3.258826, 3.725347, -6.3238,
3.258826, 3.725347, 4.85591
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
var radius = 8.013791;
var distance = 35.65426;
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
mvMatrix.translate( 0.2370563, -0.1420958, 0.7339449 );
mvMatrix.scale( 1.239268, 1.209051, 0.7750351 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.65426);
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
Mancozeb<-read.table("Mancozeb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Mancozeb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Mancozeb' not found
```

```r
y<-Mancozeb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Mancozeb' not found
```

```r
z<-Mancozeb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Mancozeb' not found
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
-3.631116, -0.2766314, -1.87828, 0, 0, 1, 1, 1,
-3.060225, -1.51481, -2.188779, 1, 0, 0, 1, 1,
-2.626867, 1.087777, -2.296846, 1, 0, 0, 1, 1,
-2.471905, 0.6530805, -1.366686, 1, 0, 0, 1, 1,
-2.434904, -0.9742311, -2.157549, 1, 0, 0, 1, 1,
-2.380879, -1.01024, -1.758807, 1, 0, 0, 1, 1,
-2.330514, 1.319027, -1.108103, 0, 0, 0, 1, 1,
-2.265756, -0.4864283, -1.506443, 0, 0, 0, 1, 1,
-2.248986, -1.849712, -0.6831434, 0, 0, 0, 1, 1,
-2.211325, -0.3316419, -2.269928, 0, 0, 0, 1, 1,
-2.184361, -0.3367089, -2.003738, 0, 0, 0, 1, 1,
-2.168505, -0.9614239, -1.755264, 0, 0, 0, 1, 1,
-2.15796, 1.119287, -2.36914, 0, 0, 0, 1, 1,
-2.128211, -0.5978332, -2.987319, 1, 1, 1, 1, 1,
-2.124591, -0.3840284, 0.1310957, 1, 1, 1, 1, 1,
-2.100197, 1.260321, -1.123736, 1, 1, 1, 1, 1,
-2.039261, -2.332641, -2.316649, 1, 1, 1, 1, 1,
-2.016841, 0.3866439, -1.469176, 1, 1, 1, 1, 1,
-2.010828, 0.2333919, 0.5675287, 1, 1, 1, 1, 1,
-2.007657, 0.3452454, -0.403426, 1, 1, 1, 1, 1,
-2.002384, 0.9027504, -0.8013471, 1, 1, 1, 1, 1,
-1.98237, 0.8832675, -1.615739, 1, 1, 1, 1, 1,
-1.973403, -0.7736439, -3.104222, 1, 1, 1, 1, 1,
-1.972773, 0.6800945, -1.864048, 1, 1, 1, 1, 1,
-1.951608, 0.9187801, -1.289332, 1, 1, 1, 1, 1,
-1.950173, 0.7091523, 0.5285466, 1, 1, 1, 1, 1,
-1.893371, 1.255483, -0.8120272, 1, 1, 1, 1, 1,
-1.888956, -0.2925475, -1.919938, 1, 1, 1, 1, 1,
-1.860646, 0.915065, -0.4319719, 0, 0, 1, 1, 1,
-1.849332, 1.513805, -1.1115, 1, 0, 0, 1, 1,
-1.831557, -1.792894, -0.8848631, 1, 0, 0, 1, 1,
-1.829513, -1.859816, -3.135482, 1, 0, 0, 1, 1,
-1.815607, 0.2404531, -0.3768389, 1, 0, 0, 1, 1,
-1.809102, 0.6093941, -1.245615, 1, 0, 0, 1, 1,
-1.76407, -0.7405728, -1.236116, 0, 0, 0, 1, 1,
-1.736089, -0.9840699, -3.001305, 0, 0, 0, 1, 1,
-1.730424, 0.8933101, -1.915116, 0, 0, 0, 1, 1,
-1.725118, 0.2528452, -2.459863, 0, 0, 0, 1, 1,
-1.713126, 2.192273, -1.940837, 0, 0, 0, 1, 1,
-1.710985, -1.258146, -3.508135, 0, 0, 0, 1, 1,
-1.697964, -1.356729, -1.952068, 0, 0, 0, 1, 1,
-1.697528, -1.065101, -2.66873, 1, 1, 1, 1, 1,
-1.697477, -0.9309091, -3.953418, 1, 1, 1, 1, 1,
-1.67209, 1.185056, -0.5421348, 1, 1, 1, 1, 1,
-1.648504, -1.951442, -2.630015, 1, 1, 1, 1, 1,
-1.647349, 1.452563, 0.4901229, 1, 1, 1, 1, 1,
-1.642043, -1.271548, -2.203259, 1, 1, 1, 1, 1,
-1.619013, 0.3225229, -1.001124, 1, 1, 1, 1, 1,
-1.61872, -0.08022068, 0.8969262, 1, 1, 1, 1, 1,
-1.617246, -1.521367, -2.388854, 1, 1, 1, 1, 1,
-1.613775, -0.1079501, -1.30337, 1, 1, 1, 1, 1,
-1.610217, -1.661713, -2.823454, 1, 1, 1, 1, 1,
-1.606781, 0.3464242, -2.981326, 1, 1, 1, 1, 1,
-1.590823, -1.20906, -1.061564, 1, 1, 1, 1, 1,
-1.577723, 0.7466264, -1.837088, 1, 1, 1, 1, 1,
-1.575481, -2.007678, -2.635664, 1, 1, 1, 1, 1,
-1.57201, -0.2890576, -0.711793, 0, 0, 1, 1, 1,
-1.570876, 2.336461, -2.540447, 1, 0, 0, 1, 1,
-1.558759, -0.3998175, -0.672878, 1, 0, 0, 1, 1,
-1.558162, 2.134167, -1.127114, 1, 0, 0, 1, 1,
-1.544799, 0.2961898, -0.629445, 1, 0, 0, 1, 1,
-1.535887, -1.041716, -2.078357, 1, 0, 0, 1, 1,
-1.530626, 0.3933783, -1.437353, 0, 0, 0, 1, 1,
-1.510159, -0.5169615, -2.295401, 0, 0, 0, 1, 1,
-1.508867, -1.427234, -2.464619, 0, 0, 0, 1, 1,
-1.502603, 0.6785069, -1.433712, 0, 0, 0, 1, 1,
-1.500859, 0.3068354, -3.339903, 0, 0, 0, 1, 1,
-1.499202, -1.116569, -3.992791, 0, 0, 0, 1, 1,
-1.496054, 2.13311, -0.3064554, 0, 0, 0, 1, 1,
-1.490602, 0.1200248, -3.721521, 1, 1, 1, 1, 1,
-1.473235, -0.03409474, -1.0606, 1, 1, 1, 1, 1,
-1.472079, 0.7903814, -0.1719715, 1, 1, 1, 1, 1,
-1.467744, -0.3542604, -2.038156, 1, 1, 1, 1, 1,
-1.45407, -2.082761, -1.901561, 1, 1, 1, 1, 1,
-1.411517, -1.079644, -3.662836, 1, 1, 1, 1, 1,
-1.408845, -1.079379, -4.213477, 1, 1, 1, 1, 1,
-1.4055, -0.9645701, -1.289281, 1, 1, 1, 1, 1,
-1.401843, -0.3041116, -1.535904, 1, 1, 1, 1, 1,
-1.39804, -0.8584728, -2.524719, 1, 1, 1, 1, 1,
-1.3929, -1.027438, -2.590272, 1, 1, 1, 1, 1,
-1.384368, -0.09861764, -1.589772, 1, 1, 1, 1, 1,
-1.381696, 1.181784, -0.1640994, 1, 1, 1, 1, 1,
-1.370046, 0.4462576, -1.767772, 1, 1, 1, 1, 1,
-1.357862, -1.411365, -2.831914, 1, 1, 1, 1, 1,
-1.339872, 3.545368, 0.5130893, 0, 0, 1, 1, 1,
-1.332632, 0.6033961, 0.4265308, 1, 0, 0, 1, 1,
-1.324747, -0.4998269, -1.766852, 1, 0, 0, 1, 1,
-1.316796, 0.5949203, -1.436711, 1, 0, 0, 1, 1,
-1.314406, 0.6169205, -0.7168085, 1, 0, 0, 1, 1,
-1.313709, -0.5486174, -3.715649, 1, 0, 0, 1, 1,
-1.310261, 0.1583631, -2.242846, 0, 0, 0, 1, 1,
-1.30679, 0.7451886, -1.094356, 0, 0, 0, 1, 1,
-1.296234, 0.6770524, -1.302608, 0, 0, 0, 1, 1,
-1.294815, 1.843891, -0.1623891, 0, 0, 0, 1, 1,
-1.290066, 0.03168071, -2.624824, 0, 0, 0, 1, 1,
-1.276518, 0.321488, -0.9022421, 0, 0, 0, 1, 1,
-1.275658, 0.2327552, -0.6417062, 0, 0, 0, 1, 1,
-1.2742, -1.234364, -2.475376, 1, 1, 1, 1, 1,
-1.272314, -0.4954807, -2.373574, 1, 1, 1, 1, 1,
-1.271037, 0.5224302, -2.910733, 1, 1, 1, 1, 1,
-1.265474, 1.200467, -0.4308678, 1, 1, 1, 1, 1,
-1.263241, 0.2108682, -1.392956, 1, 1, 1, 1, 1,
-1.262016, 0.34801, 0.5302649, 1, 1, 1, 1, 1,
-1.247863, -1.062277, -1.939963, 1, 1, 1, 1, 1,
-1.246663, 0.3758637, -0.381597, 1, 1, 1, 1, 1,
-1.245448, 2.189444, -0.08749891, 1, 1, 1, 1, 1,
-1.234551, 1.514417, -4.172306, 1, 1, 1, 1, 1,
-1.223902, 1.387393, 0.8360294, 1, 1, 1, 1, 1,
-1.223167, 0.895389, -0.2347192, 1, 1, 1, 1, 1,
-1.21542, -0.7304535, -3.402715, 1, 1, 1, 1, 1,
-1.215385, -1.749529, -3.637543, 1, 1, 1, 1, 1,
-1.184071, -0.2200339, -0.9776974, 1, 1, 1, 1, 1,
-1.183363, 0.7736207, -0.3685498, 0, 0, 1, 1, 1,
-1.175706, 0.4566258, -1.203006, 1, 0, 0, 1, 1,
-1.173169, -0.3348975, -1.757753, 1, 0, 0, 1, 1,
-1.170106, 0.8343654, -1.492087, 1, 0, 0, 1, 1,
-1.159437, 0.02438133, -2.312744, 1, 0, 0, 1, 1,
-1.143869, 0.1397867, -1.43013, 1, 0, 0, 1, 1,
-1.142648, 0.4058921, -1.121612, 0, 0, 0, 1, 1,
-1.136523, -0.5148984, -2.346956, 0, 0, 0, 1, 1,
-1.135977, -0.3157681, -1.09732, 0, 0, 0, 1, 1,
-1.132788, 1.135521, 0.7572739, 0, 0, 0, 1, 1,
-1.129255, 1.498142, -0.8301272, 0, 0, 0, 1, 1,
-1.122161, -0.02283426, -0.6864781, 0, 0, 0, 1, 1,
-1.119532, 0.4984522, -0.4129817, 0, 0, 0, 1, 1,
-1.109704, -1.893829, -2.251691, 1, 1, 1, 1, 1,
-1.101741, -1.603774, -3.121544, 1, 1, 1, 1, 1,
-1.097231, 1.046255, -1.068788, 1, 1, 1, 1, 1,
-1.093404, 0.7247695, -1.176095, 1, 1, 1, 1, 1,
-1.091748, 0.02220672, -0.1671879, 1, 1, 1, 1, 1,
-1.087356, -0.1402931, -0.8031309, 1, 1, 1, 1, 1,
-1.084047, 0.2775118, -1.407514, 1, 1, 1, 1, 1,
-1.083279, 0.2833122, -1.985062, 1, 1, 1, 1, 1,
-1.07106, -0.4319293, -3.058663, 1, 1, 1, 1, 1,
-1.070397, 0.6737938, -1.025723, 1, 1, 1, 1, 1,
-1.068956, 1.787931, -0.2631047, 1, 1, 1, 1, 1,
-1.061978, 0.5959494, 1.100912, 1, 1, 1, 1, 1,
-1.05871, -0.1041051, -2.444349, 1, 1, 1, 1, 1,
-1.057983, -0.2913841, -2.147423, 1, 1, 1, 1, 1,
-1.057971, 1.860811, -0.2355755, 1, 1, 1, 1, 1,
-1.057047, 0.1160292, -1.266729, 0, 0, 1, 1, 1,
-1.046455, 0.2395387, -0.5779996, 1, 0, 0, 1, 1,
-1.045578, -0.2040385, -1.265694, 1, 0, 0, 1, 1,
-1.044587, 0.2174027, -0.2323112, 1, 0, 0, 1, 1,
-1.042808, 0.6154895, -0.3902916, 1, 0, 0, 1, 1,
-1.027695, -0.3554493, -2.678114, 1, 0, 0, 1, 1,
-1.025256, -0.3746695, -0.5741463, 0, 0, 0, 1, 1,
-1.025253, -0.09809808, -1.989384, 0, 0, 0, 1, 1,
-1.019746, 0.6902161, -1.864555, 0, 0, 0, 1, 1,
-1.009496, -1.794173, -2.6287, 0, 0, 0, 1, 1,
-1.002587, -0.4619327, -0.2514833, 0, 0, 0, 1, 1,
-0.9990484, -0.009613791, -1.016126, 0, 0, 0, 1, 1,
-0.9913673, -0.6023845, -2.387746, 0, 0, 0, 1, 1,
-0.9886734, -2.422908, -1.562134, 1, 1, 1, 1, 1,
-0.9881193, 0.06122897, -2.000697, 1, 1, 1, 1, 1,
-0.9789347, -1.295905, -1.222883, 1, 1, 1, 1, 1,
-0.9715143, -0.06558463, -3.629788, 1, 1, 1, 1, 1,
-0.9704816, 0.1753814, -1.065053, 1, 1, 1, 1, 1,
-0.9695308, 1.484981, -0.9904025, 1, 1, 1, 1, 1,
-0.9647895, 0.9562463, -0.6351762, 1, 1, 1, 1, 1,
-0.9612212, 2.075879, -2.620253, 1, 1, 1, 1, 1,
-0.9569401, -0.04319256, -1.542379, 1, 1, 1, 1, 1,
-0.9562415, -0.348986, -0.3389463, 1, 1, 1, 1, 1,
-0.9553203, 1.074972, 0.622451, 1, 1, 1, 1, 1,
-0.9541151, 0.3974649, -1.806491, 1, 1, 1, 1, 1,
-0.9476275, -0.09935848, -2.238804, 1, 1, 1, 1, 1,
-0.9393381, 0.1606497, -1.382501, 1, 1, 1, 1, 1,
-0.9364572, 0.2917665, -4.004099, 1, 1, 1, 1, 1,
-0.9255548, -0.1037232, -0.8405222, 0, 0, 1, 1, 1,
-0.9219984, -0.5900623, -2.807517, 1, 0, 0, 1, 1,
-0.9217262, -1.200605, -1.960946, 1, 0, 0, 1, 1,
-0.9170824, 0.7103158, -3.278011, 1, 0, 0, 1, 1,
-0.9159436, -0.1504838, -1.051214, 1, 0, 0, 1, 1,
-0.9119616, -0.02928928, -0.06350396, 1, 0, 0, 1, 1,
-0.9084391, -0.5994171, -1.338786, 0, 0, 0, 1, 1,
-0.9001506, -0.8585775, -2.249594, 0, 0, 0, 1, 1,
-0.8963351, 0.6979229, 0.3841349, 0, 0, 0, 1, 1,
-0.8942472, -0.4926562, -2.043967, 0, 0, 0, 1, 1,
-0.8907107, 0.3095378, -0.5967144, 0, 0, 0, 1, 1,
-0.8844301, 0.2615773, -2.957687, 0, 0, 0, 1, 1,
-0.8843036, 0.5927206, 0.4544746, 0, 0, 0, 1, 1,
-0.8801093, -0.01171094, -2.384104, 1, 1, 1, 1, 1,
-0.878974, 1.468058, -2.244914, 1, 1, 1, 1, 1,
-0.8762851, -1.251068, -3.784534, 1, 1, 1, 1, 1,
-0.8706896, -2.467396, -4.634344, 1, 1, 1, 1, 1,
-0.8585716, -1.26598, -2.519159, 1, 1, 1, 1, 1,
-0.8565821, -1.478094, -2.107643, 1, 1, 1, 1, 1,
-0.8564635, -0.2158789, -2.958151, 1, 1, 1, 1, 1,
-0.8504884, -0.3598946, -4.431649, 1, 1, 1, 1, 1,
-0.850342, -1.957358, -2.232146, 1, 1, 1, 1, 1,
-0.8485953, 0.3530809, -2.982571, 1, 1, 1, 1, 1,
-0.8485939, -0.7162291, -2.059878, 1, 1, 1, 1, 1,
-0.8452337, 0.04895504, -2.885911, 1, 1, 1, 1, 1,
-0.8396383, -1.302648, -1.347715, 1, 1, 1, 1, 1,
-0.835438, 0.5810546, -0.5755898, 1, 1, 1, 1, 1,
-0.8236842, 1.722034, 1.235576, 1, 1, 1, 1, 1,
-0.8128161, 0.8428579, -0.9136298, 0, 0, 1, 1, 1,
-0.8127403, -1.566014, -2.299444, 1, 0, 0, 1, 1,
-0.8088623, -0.6066452, -3.20055, 1, 0, 0, 1, 1,
-0.7961079, 0.8829074, -2.141035, 1, 0, 0, 1, 1,
-0.7960068, 1.806054, -1.073274, 1, 0, 0, 1, 1,
-0.7956917, 1.003217, -0.0003840942, 1, 0, 0, 1, 1,
-0.7951758, -0.5455326, -1.809699, 0, 0, 0, 1, 1,
-0.7901276, 0.4645244, 0.6465319, 0, 0, 0, 1, 1,
-0.7898049, 2.054616, -1.862805, 0, 0, 0, 1, 1,
-0.7890776, 0.1482274, -0.585187, 0, 0, 0, 1, 1,
-0.7854137, -0.2894226, -2.18258, 0, 0, 0, 1, 1,
-0.7842617, -0.3211263, -1.994938, 0, 0, 0, 1, 1,
-0.7829134, -0.6929327, -1.755954, 0, 0, 0, 1, 1,
-0.7828371, -3.336788, -3.349491, 1, 1, 1, 1, 1,
-0.7800713, 0.1162814, -2.279701, 1, 1, 1, 1, 1,
-0.7779611, 0.9249539, -0.5268413, 1, 1, 1, 1, 1,
-0.7755011, 1.133014, -1.570851, 1, 1, 1, 1, 1,
-0.772128, -0.2624081, -2.760522, 1, 1, 1, 1, 1,
-0.7718785, -0.9803882, -2.846857, 1, 1, 1, 1, 1,
-0.7707243, 1.85616, 0.03342889, 1, 1, 1, 1, 1,
-0.7689893, -0.6593436, -2.776921, 1, 1, 1, 1, 1,
-0.7684768, 1.56751, 0.5625519, 1, 1, 1, 1, 1,
-0.7684087, 0.5850006, 0.09389337, 1, 1, 1, 1, 1,
-0.7631146, 0.1805718, -1.557922, 1, 1, 1, 1, 1,
-0.7573931, 2.02009, -1.09936, 1, 1, 1, 1, 1,
-0.7540249, 0.7646134, -0.2160724, 1, 1, 1, 1, 1,
-0.7489201, 1.761175, -0.3682628, 1, 1, 1, 1, 1,
-0.7397006, 0.9537224, -0.1116778, 1, 1, 1, 1, 1,
-0.7287532, -0.7446278, -2.019267, 0, 0, 1, 1, 1,
-0.7213857, 0.3675303, -1.816024, 1, 0, 0, 1, 1,
-0.7197121, 0.1333468, -2.407885, 1, 0, 0, 1, 1,
-0.7166952, -0.8589517, -1.627892, 1, 0, 0, 1, 1,
-0.7039522, 1.399279, -0.1204302, 1, 0, 0, 1, 1,
-0.7026605, 1.42886, 0.2698197, 1, 0, 0, 1, 1,
-0.6987824, -1.225674, -3.684273, 0, 0, 0, 1, 1,
-0.6963128, -1.035829, -2.935234, 0, 0, 0, 1, 1,
-0.692942, -0.5281886, -3.539144, 0, 0, 0, 1, 1,
-0.6876523, 1.216665, -0.4436413, 0, 0, 0, 1, 1,
-0.6870218, 0.6616891, 0.1887422, 0, 0, 0, 1, 1,
-0.6793897, -0.6849167, -2.925181, 0, 0, 0, 1, 1,
-0.6761793, -1.703342, -3.114067, 0, 0, 0, 1, 1,
-0.674321, 0.3724325, -0.6581053, 1, 1, 1, 1, 1,
-0.6722273, 0.1039799, 0.7483045, 1, 1, 1, 1, 1,
-0.6702152, 1.552692, -1.198928, 1, 1, 1, 1, 1,
-0.6687199, -0.2217256, -2.274418, 1, 1, 1, 1, 1,
-0.6599969, -0.01940545, -1.760664, 1, 1, 1, 1, 1,
-0.6579354, -0.05207632, -1.633422, 1, 1, 1, 1, 1,
-0.6562174, -1.268544, -1.848352, 1, 1, 1, 1, 1,
-0.6531809, 1.167235, -2.206826, 1, 1, 1, 1, 1,
-0.6526929, -1.136938, -1.059964, 1, 1, 1, 1, 1,
-0.6518188, -0.1310369, -1.046307, 1, 1, 1, 1, 1,
-0.649247, -0.9550884, -4.652534, 1, 1, 1, 1, 1,
-0.6488243, -1.098687, -1.901083, 1, 1, 1, 1, 1,
-0.6479753, 1.657574, -1.045151, 1, 1, 1, 1, 1,
-0.6479396, -0.9030225, 0.252098, 1, 1, 1, 1, 1,
-0.6477186, -0.2378906, 1.037601, 1, 1, 1, 1, 1,
-0.6449125, -0.8821504, -3.042825, 0, 0, 1, 1, 1,
-0.6445557, -0.6965721, -4.058506, 1, 0, 0, 1, 1,
-0.6425019, -0.3882461, -2.852321, 1, 0, 0, 1, 1,
-0.6402496, -1.249035, -1.271706, 1, 0, 0, 1, 1,
-0.637782, 0.2639977, -1.687524, 1, 0, 0, 1, 1,
-0.6231076, 1.168454, -2.329716, 1, 0, 0, 1, 1,
-0.6206409, -1.172817, -3.096164, 0, 0, 0, 1, 1,
-0.6181837, 1.000768, -1.496522, 0, 0, 0, 1, 1,
-0.6123461, 0.224094, -1.613812, 0, 0, 0, 1, 1,
-0.6115325, -1.565811, -2.364967, 0, 0, 0, 1, 1,
-0.6099198, 0.005774059, -1.461538, 0, 0, 0, 1, 1,
-0.608071, -0.9973361, -4.19803, 0, 0, 0, 1, 1,
-0.6060182, -1.343112, -2.500392, 0, 0, 0, 1, 1,
-0.604598, 0.4315353, -0.6990394, 1, 1, 1, 1, 1,
-0.6024897, -1.884972, -2.507124, 1, 1, 1, 1, 1,
-0.5970352, 0.6676301, 0.4689096, 1, 1, 1, 1, 1,
-0.5954683, -1.586453, -1.950911, 1, 1, 1, 1, 1,
-0.5934517, 0.6652927, -3.809657, 1, 1, 1, 1, 1,
-0.5865473, -1.084365, -3.271213, 1, 1, 1, 1, 1,
-0.5849351, -0.1405551, -3.155323, 1, 1, 1, 1, 1,
-0.582572, 0.4937544, -0.8157696, 1, 1, 1, 1, 1,
-0.5815468, -1.096638, -3.429205, 1, 1, 1, 1, 1,
-0.5791122, -2.097996, -3.326915, 1, 1, 1, 1, 1,
-0.5762313, -0.8861826, -2.881185, 1, 1, 1, 1, 1,
-0.5726871, -0.6807057, -1.990775, 1, 1, 1, 1, 1,
-0.5704961, -0.08779529, -1.602734, 1, 1, 1, 1, 1,
-0.5702035, 0.5984803, -0.05096937, 1, 1, 1, 1, 1,
-0.5681155, 1.462737, -1.23654, 1, 1, 1, 1, 1,
-0.564467, -1.024155, -2.325992, 0, 0, 1, 1, 1,
-0.5592859, -0.02252272, -1.143744, 1, 0, 0, 1, 1,
-0.5591658, 0.1202134, -1.071285, 1, 0, 0, 1, 1,
-0.5572038, 0.3955616, -1.666624, 1, 0, 0, 1, 1,
-0.5562071, 0.3833499, -0.04256656, 1, 0, 0, 1, 1,
-0.5553985, -1.341586, -3.344964, 1, 0, 0, 1, 1,
-0.5452846, -0.2533478, -2.525458, 0, 0, 0, 1, 1,
-0.5450686, 0.1925514, -2.673537, 0, 0, 0, 1, 1,
-0.5434756, -0.9413109, -3.413582, 0, 0, 0, 1, 1,
-0.5377485, 0.5774252, -0.2790211, 0, 0, 0, 1, 1,
-0.535706, 0.1858971, -1.562133, 0, 0, 0, 1, 1,
-0.5354711, 1.786269, -1.025031, 0, 0, 0, 1, 1,
-0.535301, 1.4777, -1.45784, 0, 0, 0, 1, 1,
-0.5326076, -1.329575, -4.413604, 1, 1, 1, 1, 1,
-0.5323963, -1.215809, -2.499365, 1, 1, 1, 1, 1,
-0.5230587, -2.619186, -2.42452, 1, 1, 1, 1, 1,
-0.5221912, -0.5325451, -2.095047, 1, 1, 1, 1, 1,
-0.5193278, -0.3115144, -1.688236, 1, 1, 1, 1, 1,
-0.5174565, -1.217039, -2.751998, 1, 1, 1, 1, 1,
-0.5150518, 0.7903307, 0.2051697, 1, 1, 1, 1, 1,
-0.5150475, 1.376383, -0.209464, 1, 1, 1, 1, 1,
-0.5109304, 0.6151598, -0.5955064, 1, 1, 1, 1, 1,
-0.5094642, 2.312061, -2.171316, 1, 1, 1, 1, 1,
-0.5078455, -1.642797, -3.230722, 1, 1, 1, 1, 1,
-0.5043458, 1.890328, 0.9573355, 1, 1, 1, 1, 1,
-0.5008842, -1.104558, -1.322242, 1, 1, 1, 1, 1,
-0.4983027, -1.371561, -1.586451, 1, 1, 1, 1, 1,
-0.4917375, 0.3530042, -1.983123, 1, 1, 1, 1, 1,
-0.4819644, -1.244403, -2.552789, 0, 0, 1, 1, 1,
-0.4800565, 0.4069252, -1.54471, 1, 0, 0, 1, 1,
-0.4744247, 1.345755, -0.5938966, 1, 0, 0, 1, 1,
-0.4558311, -1.312572, -3.275893, 1, 0, 0, 1, 1,
-0.4556068, 0.3408311, -0.04929342, 1, 0, 0, 1, 1,
-0.4535351, 1.055153, -0.9219586, 1, 0, 0, 1, 1,
-0.4534871, -1.607302, -3.792671, 0, 0, 0, 1, 1,
-0.4444594, -0.3110325, -1.347325, 0, 0, 0, 1, 1,
-0.4422292, -0.6349456, -2.344797, 0, 0, 0, 1, 1,
-0.4401572, 0.3390354, -0.1330786, 0, 0, 0, 1, 1,
-0.4395733, -0.5295647, -0.9225131, 0, 0, 0, 1, 1,
-0.4382722, -0.8904141, -3.148906, 0, 0, 0, 1, 1,
-0.4346701, 1.007672, -0.5443191, 0, 0, 0, 1, 1,
-0.4336935, 1.318375, 0.1417188, 1, 1, 1, 1, 1,
-0.4335211, 0.8255574, 1.437514, 1, 1, 1, 1, 1,
-0.4295752, -0.4725594, -0.6775642, 1, 1, 1, 1, 1,
-0.423236, -1.99216, -1.496172, 1, 1, 1, 1, 1,
-0.4213785, -1.190103, -2.013994, 1, 1, 1, 1, 1,
-0.4210117, 1.161461, 0.3633626, 1, 1, 1, 1, 1,
-0.4202597, 0.1607388, -2.031675, 1, 1, 1, 1, 1,
-0.4166767, 0.8189749, -1.255912, 1, 1, 1, 1, 1,
-0.4155058, 0.6586424, -0.8226371, 1, 1, 1, 1, 1,
-0.4112503, -1.443598, -2.341177, 1, 1, 1, 1, 1,
-0.4049534, 1.098131, -0.7382277, 1, 1, 1, 1, 1,
-0.4006177, -0.555118, -2.797204, 1, 1, 1, 1, 1,
-0.4004453, 0.6706841, -2.981313, 1, 1, 1, 1, 1,
-0.3963269, -0.7948421, -2.702255, 1, 1, 1, 1, 1,
-0.3914928, 1.031668, -0.852673, 1, 1, 1, 1, 1,
-0.391302, 1.308821, -0.4181859, 0, 0, 1, 1, 1,
-0.3906229, 1.137948, 0.4263723, 1, 0, 0, 1, 1,
-0.3828186, 0.5311208, -3.81338, 1, 0, 0, 1, 1,
-0.3814374, 2.066556, -0.2499046, 1, 0, 0, 1, 1,
-0.3809947, 0.9794634, -0.872412, 1, 0, 0, 1, 1,
-0.3807156, -0.8509325, -3.198856, 1, 0, 0, 1, 1,
-0.3795833, -1.345773, -3.338985, 0, 0, 0, 1, 1,
-0.3793843, 0.87091, -0.5315103, 0, 0, 0, 1, 1,
-0.372852, 0.7731422, 0.3025656, 0, 0, 0, 1, 1,
-0.3703808, -1.412191, -2.714842, 0, 0, 0, 1, 1,
-0.3671055, 2.383103, -0.7589054, 0, 0, 0, 1, 1,
-0.3665268, -0.252748, -2.87842, 0, 0, 0, 1, 1,
-0.3643598, -0.6319898, -1.744813, 0, 0, 0, 1, 1,
-0.3612506, -0.01186256, -2.48792, 1, 1, 1, 1, 1,
-0.3580818, 0.9666642, -0.9459859, 1, 1, 1, 1, 1,
-0.3540129, -0.06425965, -2.364357, 1, 1, 1, 1, 1,
-0.3524867, -0.6865425, -2.620682, 1, 1, 1, 1, 1,
-0.3524416, -0.7287638, -2.298852, 1, 1, 1, 1, 1,
-0.3506072, -0.2867347, -2.260756, 1, 1, 1, 1, 1,
-0.3482969, 0.5000653, -0.5116565, 1, 1, 1, 1, 1,
-0.3422809, -0.3214549, -3.289496, 1, 1, 1, 1, 1,
-0.3395578, 0.7345073, -1.313783, 1, 1, 1, 1, 1,
-0.3320206, 0.6264817, -1.263561, 1, 1, 1, 1, 1,
-0.3307274, -0.4693056, -2.82371, 1, 1, 1, 1, 1,
-0.3245742, -0.6441403, -2.949486, 1, 1, 1, 1, 1,
-0.3243363, 0.07489017, -1.177549, 1, 1, 1, 1, 1,
-0.3193939, -1.703164, -2.209391, 1, 1, 1, 1, 1,
-0.3192598, 1.054255, -0.00360158, 1, 1, 1, 1, 1,
-0.3173265, -0.2291619, -3.201702, 0, 0, 1, 1, 1,
-0.3160548, 0.3262808, -0.128205, 1, 0, 0, 1, 1,
-0.3080848, 0.2150248, -0.3765157, 1, 0, 0, 1, 1,
-0.3074877, -1.096477, -3.821975, 1, 0, 0, 1, 1,
-0.307044, -0.5196303, -4.250093, 1, 0, 0, 1, 1,
-0.2982409, 1.183319, -1.20265, 1, 0, 0, 1, 1,
-0.2958554, -0.1705011, -0.7794142, 0, 0, 0, 1, 1,
-0.2946366, 0.721386, -2.464219, 0, 0, 0, 1, 1,
-0.2942227, -1.543982, -3.929042, 0, 0, 0, 1, 1,
-0.2929535, 0.6895581, 0.7684808, 0, 0, 0, 1, 1,
-0.2880014, 0.777832, -1.242312, 0, 0, 0, 1, 1,
-0.2877366, 0.231387, -0.3741403, 0, 0, 0, 1, 1,
-0.2856908, -0.9445249, -3.040899, 0, 0, 0, 1, 1,
-0.2855602, 1.679617, -0.2409059, 1, 1, 1, 1, 1,
-0.2828429, 0.7706204, -0.7140275, 1, 1, 1, 1, 1,
-0.2797595, 0.1583554, -0.9628087, 1, 1, 1, 1, 1,
-0.2766915, -1.202499, -3.461858, 1, 1, 1, 1, 1,
-0.2755723, -2.595633, -3.183348, 1, 1, 1, 1, 1,
-0.2755453, -1.900111, -2.610834, 1, 1, 1, 1, 1,
-0.2746224, -1.551473, -2.45201, 1, 1, 1, 1, 1,
-0.273773, -1.088161, -2.379363, 1, 1, 1, 1, 1,
-0.2698062, -0.04904525, -1.763744, 1, 1, 1, 1, 1,
-0.2673751, -0.4396591, -3.001692, 1, 1, 1, 1, 1,
-0.2665465, 0.3822185, 0.1567071, 1, 1, 1, 1, 1,
-0.2640111, 0.6687939, 0.02793843, 1, 1, 1, 1, 1,
-0.2630282, 1.160864, -0.4326406, 1, 1, 1, 1, 1,
-0.2621074, -0.3032417, -0.6947826, 1, 1, 1, 1, 1,
-0.2603636, -0.9973761, -4.908129, 1, 1, 1, 1, 1,
-0.2601535, -1.059967, -1.253439, 0, 0, 1, 1, 1,
-0.255239, 1.076273, -0.01007385, 1, 0, 0, 1, 1,
-0.2527332, 0.1929159, 0.3694684, 1, 0, 0, 1, 1,
-0.2525439, -0.996431, -3.725586, 1, 0, 0, 1, 1,
-0.250747, 0.4910744, -1.172272, 1, 0, 0, 1, 1,
-0.249974, -0.2759991, -1.849875, 1, 0, 0, 1, 1,
-0.2470149, 0.5819329, -0.8355197, 0, 0, 0, 1, 1,
-0.2446869, 1.441255, -0.7166049, 0, 0, 0, 1, 1,
-0.242021, -0.9837701, -2.204091, 0, 0, 0, 1, 1,
-0.240681, 0.2271644, -2.137331, 0, 0, 0, 1, 1,
-0.2397844, 1.259164, 0.3676566, 0, 0, 0, 1, 1,
-0.2378337, 0.8024407, 0.4501135, 0, 0, 0, 1, 1,
-0.2365178, 2.159566, -0.3936112, 0, 0, 0, 1, 1,
-0.2352348, -0.2798213, -2.880968, 1, 1, 1, 1, 1,
-0.233584, -0.2251323, -2.429395, 1, 1, 1, 1, 1,
-0.2309246, -0.4081395, -2.461986, 1, 1, 1, 1, 1,
-0.2299571, 1.187243, -0.2733435, 1, 1, 1, 1, 1,
-0.2282087, 0.4726686, -1.011274, 1, 1, 1, 1, 1,
-0.2274809, 0.8032266, 1.11097, 1, 1, 1, 1, 1,
-0.2246441, -1.497882, -1.759643, 1, 1, 1, 1, 1,
-0.2242712, 0.8577658, 0.01187277, 1, 1, 1, 1, 1,
-0.2235854, 0.8837349, 1.116403, 1, 1, 1, 1, 1,
-0.2225257, 0.7265297, 0.7103223, 1, 1, 1, 1, 1,
-0.2200577, 0.1928044, -0.4122565, 1, 1, 1, 1, 1,
-0.2170898, 0.7351926, -0.3709684, 1, 1, 1, 1, 1,
-0.2159105, -0.09733336, -1.672184, 1, 1, 1, 1, 1,
-0.2118925, -0.278186, -0.6118092, 1, 1, 1, 1, 1,
-0.2104196, 0.2995256, -1.660804, 1, 1, 1, 1, 1,
-0.2101011, -0.1950537, -1.750773, 0, 0, 1, 1, 1,
-0.2099636, -0.4655846, -2.562862, 1, 0, 0, 1, 1,
-0.2094245, 0.3921211, -1.486003, 1, 0, 0, 1, 1,
-0.2044543, -0.4775623, -4.833819, 1, 0, 0, 1, 1,
-0.2044163, 2.651727, 2.609925, 1, 0, 0, 1, 1,
-0.2008471, 0.4996124, -0.06262677, 1, 0, 0, 1, 1,
-0.1962741, 0.715629, -0.1963279, 0, 0, 0, 1, 1,
-0.1959211, -0.1733408, -2.596091, 0, 0, 0, 1, 1,
-0.1958594, -0.00587845, -1.646266, 0, 0, 0, 1, 1,
-0.1908051, 0.1628799, 0.1899905, 0, 0, 0, 1, 1,
-0.1863082, 1.762262, 0.09172261, 0, 0, 0, 1, 1,
-0.180969, 0.04762507, -1.733363, 0, 0, 0, 1, 1,
-0.1788934, 0.4692551, -1.062688, 0, 0, 0, 1, 1,
-0.1728924, -0.9382587, -3.337709, 1, 1, 1, 1, 1,
-0.1725984, -0.9164799, -3.300133, 1, 1, 1, 1, 1,
-0.1678082, 1.433533, 0.5537132, 1, 1, 1, 1, 1,
-0.1667007, -0.9093081, -1.194104, 1, 1, 1, 1, 1,
-0.1608005, 1.17402, -0.8358364, 1, 1, 1, 1, 1,
-0.1599375, -0.8262188, -4.312479, 1, 1, 1, 1, 1,
-0.1557553, -0.3620239, -5.745653, 1, 1, 1, 1, 1,
-0.1541222, 1.017231, 1.112576, 1, 1, 1, 1, 1,
-0.135523, 0.5233815, 0.2251522, 1, 1, 1, 1, 1,
-0.1350801, -0.2000456, -2.214081, 1, 1, 1, 1, 1,
-0.1344984, 1.945385, 1.173994, 1, 1, 1, 1, 1,
-0.1323315, -0.8008629, -2.432842, 1, 1, 1, 1, 1,
-0.1313964, 0.7204996, -0.1956581, 1, 1, 1, 1, 1,
-0.1287364, 1.005015, 2.10357, 1, 1, 1, 1, 1,
-0.1273347, 0.3569793, -1.962358, 1, 1, 1, 1, 1,
-0.1235813, -0.08416136, -3.459749, 0, 0, 1, 1, 1,
-0.1233121, 0.4424539, 0.8938859, 1, 0, 0, 1, 1,
-0.123221, -1.857048, -3.106339, 1, 0, 0, 1, 1,
-0.1208931, -0.1581471, -1.696298, 1, 0, 0, 1, 1,
-0.1194363, 0.2382369, -0.6092765, 1, 0, 0, 1, 1,
-0.1170435, 0.6319155, -0.8297791, 1, 0, 0, 1, 1,
-0.1120485, 3.189214, 1.706586, 0, 0, 0, 1, 1,
-0.1113906, 0.637569, 0.8607065, 0, 0, 0, 1, 1,
-0.1092668, -0.7324141, -2.099548, 0, 0, 0, 1, 1,
-0.1083307, 1.136716, 0.3608781, 0, 0, 0, 1, 1,
-0.1079765, 0.006227187, -2.378243, 0, 0, 0, 1, 1,
-0.1050053, -1.995816, -3.097689, 0, 0, 0, 1, 1,
-0.1011231, -0.8769879, -2.661807, 0, 0, 0, 1, 1,
-0.09797935, 0.6369265, -0.009886076, 1, 1, 1, 1, 1,
-0.09757131, -0.4392005, -6.160989, 1, 1, 1, 1, 1,
-0.09697128, 1.191446, -0.7012075, 1, 1, 1, 1, 1,
-0.09108052, -0.05172868, -1.895501, 1, 1, 1, 1, 1,
-0.09044416, 0.9420055, -1.138801, 1, 1, 1, 1, 1,
-0.08757513, -0.5184922, -3.291707, 1, 1, 1, 1, 1,
-0.08539671, -1.294682, -2.560958, 1, 1, 1, 1, 1,
-0.08040895, -1.872118, -2.311502, 1, 1, 1, 1, 1,
-0.07485446, 1.609067, -1.312312, 1, 1, 1, 1, 1,
-0.06739029, 0.4443289, 0.2167496, 1, 1, 1, 1, 1,
-0.05899365, -1.155116, -4.539994, 1, 1, 1, 1, 1,
-0.0572109, -1.019048, -3.752156, 1, 1, 1, 1, 1,
-0.05617954, 0.3729942, -1.633243, 1, 1, 1, 1, 1,
-0.05599029, 0.6295865, 0.07447942, 1, 1, 1, 1, 1,
-0.05555563, -1.744669, -4.219038, 1, 1, 1, 1, 1,
-0.05516341, -0.2817299, -2.003216, 0, 0, 1, 1, 1,
-0.05094378, 0.6460369, -1.303552, 1, 0, 0, 1, 1,
-0.05030199, 1.395126, 0.1108824, 1, 0, 0, 1, 1,
-0.04949234, -0.3496401, -3.319467, 1, 0, 0, 1, 1,
-0.04750023, -1.418256, -2.442946, 1, 0, 0, 1, 1,
-0.04461443, -0.841111, -2.990108, 1, 0, 0, 1, 1,
-0.04142344, -1.451376, -4.229613, 0, 0, 0, 1, 1,
-0.03937348, -0.4539002, -3.08986, 0, 0, 0, 1, 1,
-0.03322985, -0.9531364, -3.373323, 0, 0, 0, 1, 1,
-0.02703589, 1.33451, -1.520067, 0, 0, 0, 1, 1,
-0.02323078, -0.8093774, -2.606909, 0, 0, 0, 1, 1,
-0.02256637, -0.1581918, -1.848589, 0, 0, 0, 1, 1,
-0.02083341, 0.1683492, 0.8071713, 0, 0, 0, 1, 1,
-0.01958538, -0.1499483, -4.639163, 1, 1, 1, 1, 1,
-0.0129904, -0.1227312, -4.950714, 1, 1, 1, 1, 1,
-0.01035656, 0.6793904, 0.5709647, 1, 1, 1, 1, 1,
-0.006304772, -0.2405895, -2.449219, 1, 1, 1, 1, 1,
-0.002652257, -1.123297, -1.422966, 1, 1, 1, 1, 1,
0.001430089, -0.4477842, 2.396139, 1, 1, 1, 1, 1,
0.003741371, 1.059875, 1.303257, 1, 1, 1, 1, 1,
0.004390252, -0.2908565, 2.549372, 1, 1, 1, 1, 1,
0.007856566, 0.566565, 0.5637657, 1, 1, 1, 1, 1,
0.008691947, -1.680363, 2.85026, 1, 1, 1, 1, 1,
0.008739612, -0.5663215, 3.254623, 1, 1, 1, 1, 1,
0.01425986, 0.0428271, 2.124759, 1, 1, 1, 1, 1,
0.01564226, -1.17876, 4.442166, 1, 1, 1, 1, 1,
0.01817004, -0.9313405, 4.282218, 1, 1, 1, 1, 1,
0.01967769, 0.6079247, -0.04584733, 1, 1, 1, 1, 1,
0.02024098, -0.2399101, 3.117072, 0, 0, 1, 1, 1,
0.02147713, -0.2603433, 2.062225, 1, 0, 0, 1, 1,
0.02164018, 0.5281367, -1.728695, 1, 0, 0, 1, 1,
0.02181152, -0.6876256, 2.864224, 1, 0, 0, 1, 1,
0.0220548, -0.5137987, 2.957053, 1, 0, 0, 1, 1,
0.02554052, -0.5435459, 2.210322, 1, 0, 0, 1, 1,
0.03194623, 0.4796128, -0.4799706, 0, 0, 0, 1, 1,
0.03761397, 1.346765, -1.185619, 0, 0, 0, 1, 1,
0.0394266, 0.3883963, 2.337117, 0, 0, 0, 1, 1,
0.04435701, -0.6323155, 3.600826, 0, 0, 0, 1, 1,
0.05492492, -0.9063872, 3.975544, 0, 0, 0, 1, 1,
0.0570514, -0.7709627, 2.842248, 0, 0, 0, 1, 1,
0.05817414, 0.9277165, 1.141973, 0, 0, 0, 1, 1,
0.07076516, -2.266463, 1.767038, 1, 1, 1, 1, 1,
0.07236217, 1.782385, -0.8768017, 1, 1, 1, 1, 1,
0.07764534, -0.6797959, 2.320924, 1, 1, 1, 1, 1,
0.07789122, -0.6267996, 3.036165, 1, 1, 1, 1, 1,
0.0788335, 0.459261, -0.7702042, 1, 1, 1, 1, 1,
0.07989983, 1.089005, -0.3124681, 1, 1, 1, 1, 1,
0.08036491, 1.778374, -0.2725205, 1, 1, 1, 1, 1,
0.08101949, -0.1216097, 2.606133, 1, 1, 1, 1, 1,
0.08883218, 0.2018551, 0.03473327, 1, 1, 1, 1, 1,
0.1018857, 3.62098, 1.808983, 1, 1, 1, 1, 1,
0.102635, -2.138448, 4.494366, 1, 1, 1, 1, 1,
0.1034796, 0.8141307, 1.021308, 1, 1, 1, 1, 1,
0.1062494, 1.001271, -2.036446, 1, 1, 1, 1, 1,
0.1074367, 0.04166672, 0.8045594, 1, 1, 1, 1, 1,
0.1088047, 0.3670858, 0.1354159, 1, 1, 1, 1, 1,
0.1093617, -0.5134809, 2.207432, 0, 0, 1, 1, 1,
0.1095985, 0.081098, -0.8599992, 1, 0, 0, 1, 1,
0.1101034, 1.62882, -0.5517882, 1, 0, 0, 1, 1,
0.1107848, 0.486926, 1.844932, 1, 0, 0, 1, 1,
0.1148527, 0.5729461, 0.2625358, 1, 0, 0, 1, 1,
0.1177989, -0.5134946, 2.673966, 1, 0, 0, 1, 1,
0.1181276, -1.161736, 3.585219, 0, 0, 0, 1, 1,
0.1202298, -0.6400973, 4.693099, 0, 0, 0, 1, 1,
0.1209383, -0.1392498, 2.92818, 0, 0, 0, 1, 1,
0.1215967, -0.1316633, 0.4667761, 0, 0, 0, 1, 1,
0.1252683, 0.8807878, -0.6473767, 0, 0, 0, 1, 1,
0.1299123, -1.303126, 3.158358, 0, 0, 0, 1, 1,
0.1312447, -0.7078649, 1.568324, 0, 0, 0, 1, 1,
0.1320963, -0.7645736, 3.753836, 1, 1, 1, 1, 1,
0.1366692, -0.01809485, 3.736544, 1, 1, 1, 1, 1,
0.1368137, -0.1061146, 1.160024, 1, 1, 1, 1, 1,
0.136866, -1.237688, 4.641267, 1, 1, 1, 1, 1,
0.1386224, -0.6997949, 3.850909, 1, 1, 1, 1, 1,
0.1485144, -0.5349905, 0.4161878, 1, 1, 1, 1, 1,
0.1515689, -1.997863, 1.447195, 1, 1, 1, 1, 1,
0.1520146, 1.110635, 0.8718311, 1, 1, 1, 1, 1,
0.1542283, -0.5192872, 2.74605, 1, 1, 1, 1, 1,
0.1663542, 0.4463654, 1.343136, 1, 1, 1, 1, 1,
0.1669905, 0.362466, 0.3568162, 1, 1, 1, 1, 1,
0.1703733, 0.01739956, 1.984527, 1, 1, 1, 1, 1,
0.1737858, -1.285533, 3.165301, 1, 1, 1, 1, 1,
0.1762296, 1.322136, 0.9294137, 1, 1, 1, 1, 1,
0.1804634, 0.3575171, 0.9227257, 1, 1, 1, 1, 1,
0.1811246, 1.155533, 0.6217989, 0, 0, 1, 1, 1,
0.1832485, 0.8783942, 0.3835427, 1, 0, 0, 1, 1,
0.1857588, 0.1495217, 0.7781901, 1, 0, 0, 1, 1,
0.1935325, -0.7912921, 2.384478, 1, 0, 0, 1, 1,
0.1946931, 0.7236364, 0.8350385, 1, 0, 0, 1, 1,
0.1979042, 2.115255, -0.2343218, 1, 0, 0, 1, 1,
0.1986254, -0.3782046, 1.415731, 0, 0, 0, 1, 1,
0.1991396, -0.2852792, 2.289532, 0, 0, 0, 1, 1,
0.2000438, -0.7741979, 3.554095, 0, 0, 0, 1, 1,
0.2055375, -0.9950042, 4.043402, 0, 0, 0, 1, 1,
0.2070132, 0.2942991, -0.03277332, 0, 0, 0, 1, 1,
0.2113355, 0.7393125, 1.163588, 0, 0, 0, 1, 1,
0.2128092, -2.239958, 2.033153, 0, 0, 0, 1, 1,
0.2133466, 1.750468, 1.745906, 1, 1, 1, 1, 1,
0.215323, -2.16195, 2.055583, 1, 1, 1, 1, 1,
0.2161384, -1.14445, 1.58876, 1, 1, 1, 1, 1,
0.2187581, 0.5739007, 1.407493, 1, 1, 1, 1, 1,
0.2222627, -1.613346, 1.723253, 1, 1, 1, 1, 1,
0.2234903, -0.3825842, -0.03278144, 1, 1, 1, 1, 1,
0.2235093, 1.340712, -1.767092, 1, 1, 1, 1, 1,
0.2284615, -1.043733, 3.976473, 1, 1, 1, 1, 1,
0.2290689, -0.9399964, 1.681172, 1, 1, 1, 1, 1,
0.2297498, 0.5864362, -0.3960844, 1, 1, 1, 1, 1,
0.229762, -0.5792395, 3.765302, 1, 1, 1, 1, 1,
0.2359081, 0.3335587, 0.3495556, 1, 1, 1, 1, 1,
0.2363737, -1.02501, 1.889189, 1, 1, 1, 1, 1,
0.2420308, 2.092457, -1.397333, 1, 1, 1, 1, 1,
0.2435996, -0.6410981, 2.105831, 1, 1, 1, 1, 1,
0.2491826, -0.3118625, 2.060554, 0, 0, 1, 1, 1,
0.2505694, -0.06369911, 1.358811, 1, 0, 0, 1, 1,
0.2533994, -0.192051, 3.239432, 1, 0, 0, 1, 1,
0.2558005, 0.6096175, -0.3555022, 1, 0, 0, 1, 1,
0.2562898, -0.3910644, 1.541555, 1, 0, 0, 1, 1,
0.2566922, -1.05111, 2.987425, 1, 0, 0, 1, 1,
0.2587299, -0.7037343, 3.169696, 0, 0, 0, 1, 1,
0.2598496, 1.166591, 0.9842589, 0, 0, 0, 1, 1,
0.26099, 0.1202161, 2.28738, 0, 0, 0, 1, 1,
0.2614729, 0.03888664, 2.055023, 0, 0, 0, 1, 1,
0.2646916, 0.1475944, 0.6409625, 0, 0, 0, 1, 1,
0.2653915, 0.312217, 0.3301541, 0, 0, 0, 1, 1,
0.2659281, 0.3447877, 0.771163, 0, 0, 0, 1, 1,
0.2660679, 0.2990643, -0.09458525, 1, 1, 1, 1, 1,
0.2677148, 0.5886807, 0.8860759, 1, 1, 1, 1, 1,
0.268976, -0.1247066, 3.098782, 1, 1, 1, 1, 1,
0.2696467, 0.3166859, 0.2813507, 1, 1, 1, 1, 1,
0.2697107, 0.8739378, -0.5513773, 1, 1, 1, 1, 1,
0.2746125, -0.1047199, 3.598528, 1, 1, 1, 1, 1,
0.2752123, -0.2700222, 1.82956, 1, 1, 1, 1, 1,
0.2864673, 0.7193547, 0.408292, 1, 1, 1, 1, 1,
0.2881212, -0.4967285, 3.955198, 1, 1, 1, 1, 1,
0.288753, -0.4404701, 2.335311, 1, 1, 1, 1, 1,
0.2921394, -0.128928, 1.114604, 1, 1, 1, 1, 1,
0.2957093, -0.6331603, 0.8649979, 1, 1, 1, 1, 1,
0.298662, -0.4337832, 2.640551, 1, 1, 1, 1, 1,
0.3004787, -0.1155983, 1.80493, 1, 1, 1, 1, 1,
0.3056814, 2.205372, 0.4505524, 1, 1, 1, 1, 1,
0.3079082, -0.9991452, 3.142798, 0, 0, 1, 1, 1,
0.31005, 1.44266, 0.5206042, 1, 0, 0, 1, 1,
0.3110301, -1.097444, 1.789678, 1, 0, 0, 1, 1,
0.3264086, 2.567307, 0.4606284, 1, 0, 0, 1, 1,
0.3267885, -0.9838154, 3.196867, 1, 0, 0, 1, 1,
0.3276077, 1.052723, -0.0743927, 1, 0, 0, 1, 1,
0.3340637, 0.5234699, 3.144023, 0, 0, 0, 1, 1,
0.3354418, 0.007550028, 1.586405, 0, 0, 0, 1, 1,
0.3395731, 1.362786, -1.117934, 0, 0, 0, 1, 1,
0.3426374, 0.7720882, 1.039889, 0, 0, 0, 1, 1,
0.3481766, -0.2893067, 0.7218528, 0, 0, 0, 1, 1,
0.3529632, -1.384949, 4.630149, 0, 0, 0, 1, 1,
0.359105, -0.9675274, 3.234846, 0, 0, 0, 1, 1,
0.362066, -2.534726, 2.108562, 1, 1, 1, 1, 1,
0.3670726, -0.1102376, 1.587288, 1, 1, 1, 1, 1,
0.3780231, 1.683619, 0.8947571, 1, 1, 1, 1, 1,
0.3786471, -0.324435, 2.329173, 1, 1, 1, 1, 1,
0.3858351, 0.7329734, -0.2938606, 1, 1, 1, 1, 1,
0.3863397, -0.5936111, 2.522317, 1, 1, 1, 1, 1,
0.3892049, -1.241281, 2.371488, 1, 1, 1, 1, 1,
0.389895, -0.5010859, 1.203939, 1, 1, 1, 1, 1,
0.3926893, 0.4025055, 1.674457, 1, 1, 1, 1, 1,
0.3947231, 1.341766, 1.122614, 1, 1, 1, 1, 1,
0.3977843, 0.5858617, 1.836675, 1, 1, 1, 1, 1,
0.3987559, 0.6781929, 1.522171, 1, 1, 1, 1, 1,
0.4014736, 0.1185083, 0.3776195, 1, 1, 1, 1, 1,
0.4044291, -1.090597, 3.117323, 1, 1, 1, 1, 1,
0.4045681, 0.6715866, 1.722638, 1, 1, 1, 1, 1,
0.4050778, -0.07662907, 2.331987, 0, 0, 1, 1, 1,
0.4100389, 0.4338294, 0.02998942, 1, 0, 0, 1, 1,
0.4104432, 0.06713568, 3.163452, 1, 0, 0, 1, 1,
0.4149497, -0.2362406, 2.463573, 1, 0, 0, 1, 1,
0.4162489, -0.2178881, 3.240362, 1, 0, 0, 1, 1,
0.4173596, -0.6674094, 1.753807, 1, 0, 0, 1, 1,
0.4237021, 0.6060109, 1.93026, 0, 0, 0, 1, 1,
0.4254963, 0.898187, -0.3214958, 0, 0, 0, 1, 1,
0.429725, -0.05556922, 1.340009, 0, 0, 0, 1, 1,
0.4311154, -0.7140259, 2.463068, 0, 0, 0, 1, 1,
0.4313864, -0.004605152, 3.110755, 0, 0, 0, 1, 1,
0.4344063, -1.04963, 3.04335, 0, 0, 0, 1, 1,
0.4344843, -0.3232639, 3.379333, 0, 0, 0, 1, 1,
0.4463305, 1.169189, 1.703525, 1, 1, 1, 1, 1,
0.4463734, 1.08363, 0.2634585, 1, 1, 1, 1, 1,
0.4466163, 0.6543851, 1.359811, 1, 1, 1, 1, 1,
0.4479606, -0.2154511, 1.14491, 1, 1, 1, 1, 1,
0.4484318, 1.610711, 0.4356056, 1, 1, 1, 1, 1,
0.4527982, 1.752819, 0.3112332, 1, 1, 1, 1, 1,
0.4585178, 0.3829284, -1.097931, 1, 1, 1, 1, 1,
0.460165, -1.057957, 1.120274, 1, 1, 1, 1, 1,
0.4623966, 1.369767, 0.9450743, 1, 1, 1, 1, 1,
0.4670754, -0.7706627, 2.626338, 1, 1, 1, 1, 1,
0.4693764, 0.9495277, -1.404121, 1, 1, 1, 1, 1,
0.4748438, 1.265363, -1.750758, 1, 1, 1, 1, 1,
0.4777991, 1.381412, -0.3741158, 1, 1, 1, 1, 1,
0.4858795, 1.419827, 2.347264, 1, 1, 1, 1, 1,
0.4860591, 0.5093893, -0.5683764, 1, 1, 1, 1, 1,
0.4895411, -0.6515468, 3.012323, 0, 0, 1, 1, 1,
0.4926183, 0.9023098, 2.253728, 1, 0, 0, 1, 1,
0.4958704, -1.878811, 3.153486, 1, 0, 0, 1, 1,
0.4981945, 0.05232911, 1.386222, 1, 0, 0, 1, 1,
0.5019091, -1.004909, 3.263862, 1, 0, 0, 1, 1,
0.5025738, 0.01604188, -0.05557036, 1, 0, 0, 1, 1,
0.5107167, -0.03513738, 0.976905, 0, 0, 0, 1, 1,
0.5130786, 0.1256196, 2.810222, 0, 0, 0, 1, 1,
0.5177031, 1.783811, -0.2827405, 0, 0, 0, 1, 1,
0.5185406, -0.6484154, 2.810805, 0, 0, 0, 1, 1,
0.5219852, -1.887421, 3.112853, 0, 0, 0, 1, 1,
0.5220395, -0.238843, 1.742449, 0, 0, 0, 1, 1,
0.5239822, 0.2378823, 0.4338624, 0, 0, 0, 1, 1,
0.5320191, 0.7189895, -1.113135, 1, 1, 1, 1, 1,
0.5321456, 0.07955468, 0.9280239, 1, 1, 1, 1, 1,
0.5345489, -1.193265, 3.061665, 1, 1, 1, 1, 1,
0.5347124, 0.4981091, 1.118483, 1, 1, 1, 1, 1,
0.5392449, -0.6637239, 0.4366613, 1, 1, 1, 1, 1,
0.5398484, -2.003631, 4.230748, 1, 1, 1, 1, 1,
0.5439855, -0.3518519, 2.147043, 1, 1, 1, 1, 1,
0.550399, -0.2240683, 2.167388, 1, 1, 1, 1, 1,
0.5538595, -0.798333, 2.578108, 1, 1, 1, 1, 1,
0.5540989, 0.01539632, 2.156218, 1, 1, 1, 1, 1,
0.5552922, 1.886683, 0.6557015, 1, 1, 1, 1, 1,
0.5581775, -0.5789194, 2.216435, 1, 1, 1, 1, 1,
0.5622967, 1.513177, 0.4854638, 1, 1, 1, 1, 1,
0.5634001, 0.59817, 0.9673968, 1, 1, 1, 1, 1,
0.5636347, -0.3448378, 0.7001796, 1, 1, 1, 1, 1,
0.5646447, -0.2761453, 1.403224, 0, 0, 1, 1, 1,
0.5665739, -0.3667326, 1.817596, 1, 0, 0, 1, 1,
0.568294, -0.5220637, 0.956435, 1, 0, 0, 1, 1,
0.5717384, -1.003954, 1.610849, 1, 0, 0, 1, 1,
0.5737161, -1.625646, 3.347091, 1, 0, 0, 1, 1,
0.5738043, -1.066494, 3.873201, 1, 0, 0, 1, 1,
0.5740696, 0.2242242, 1.077573, 0, 0, 0, 1, 1,
0.5780966, 0.6198041, 0.9134645, 0, 0, 0, 1, 1,
0.5800126, -0.2199212, 1.580824, 0, 0, 0, 1, 1,
0.586189, 1.792248, 1.232335, 0, 0, 0, 1, 1,
0.5902216, -0.1206412, 1.718814, 0, 0, 0, 1, 1,
0.5946886, -1.010154, 2.071591, 0, 0, 0, 1, 1,
0.5972186, -0.2582514, 2.832579, 0, 0, 0, 1, 1,
0.5972648, 0.3451489, 0.6365329, 1, 1, 1, 1, 1,
0.5988376, -1.743897, 2.586452, 1, 1, 1, 1, 1,
0.5993454, 0.545856, -0.2728894, 1, 1, 1, 1, 1,
0.6001303, 1.205032, 0.8445945, 1, 1, 1, 1, 1,
0.6003261, -2.283822, 3.702758, 1, 1, 1, 1, 1,
0.6042045, -0.4481835, 2.357975, 1, 1, 1, 1, 1,
0.6077645, -0.9317339, 1.970531, 1, 1, 1, 1, 1,
0.6125314, 0.9848575, -0.1846737, 1, 1, 1, 1, 1,
0.6468374, 1.349447, -0.001760617, 1, 1, 1, 1, 1,
0.6487607, -0.6488145, 1.818988, 1, 1, 1, 1, 1,
0.6503412, -1.214497, 2.495552, 1, 1, 1, 1, 1,
0.6536022, -0.6665534, 2.244111, 1, 1, 1, 1, 1,
0.6544395, 0.3605112, 1.187542, 1, 1, 1, 1, 1,
0.6553066, -1.157067, 2.575418, 1, 1, 1, 1, 1,
0.6577691, -1.953099, 3.261067, 1, 1, 1, 1, 1,
0.6587625, 0.7024224, -0.1031822, 0, 0, 1, 1, 1,
0.6609128, 0.3657409, 1.033189, 1, 0, 0, 1, 1,
0.662285, -1.188417, 3.449253, 1, 0, 0, 1, 1,
0.6670181, -1.082138, 1.461431, 1, 0, 0, 1, 1,
0.6671864, 0.4960802, 1.497122, 1, 0, 0, 1, 1,
0.6693337, 0.4529009, 0.9017043, 1, 0, 0, 1, 1,
0.6703036, 0.7975876, 0.1795112, 0, 0, 0, 1, 1,
0.6780225, 0.1571873, 1.886559, 0, 0, 0, 1, 1,
0.683539, -1.266803, 2.327832, 0, 0, 0, 1, 1,
0.6847229, -0.1241048, -0.03166212, 0, 0, 0, 1, 1,
0.6995092, -0.2898926, 1.267967, 0, 0, 0, 1, 1,
0.7003601, -1.274939, 2.381964, 0, 0, 0, 1, 1,
0.7008634, 1.429006, -0.1032693, 0, 0, 0, 1, 1,
0.7051588, 1.976388, -0.5240238, 1, 1, 1, 1, 1,
0.7081918, 1.431768, 1.407725, 1, 1, 1, 1, 1,
0.7113162, -0.1381889, 3.359477, 1, 1, 1, 1, 1,
0.7193056, 0.5165159, 1.932876, 1, 1, 1, 1, 1,
0.7196227, -0.3184413, 2.601852, 1, 1, 1, 1, 1,
0.7216129, -0.6549573, 2.034847, 1, 1, 1, 1, 1,
0.7320214, -0.150641, 1.103146, 1, 1, 1, 1, 1,
0.7331279, 0.7514954, 0.6520377, 1, 1, 1, 1, 1,
0.7383888, 0.1412691, 1.629828, 1, 1, 1, 1, 1,
0.7396429, -1.302849, 2.077174, 1, 1, 1, 1, 1,
0.749012, -0.7033026, 2.394666, 1, 1, 1, 1, 1,
0.7512014, 1.249974, 0.27219, 1, 1, 1, 1, 1,
0.7580825, -0.793415, 0.9510934, 1, 1, 1, 1, 1,
0.7605801, 0.204831, 0.7747993, 1, 1, 1, 1, 1,
0.7706183, -1.760968, 2.806511, 1, 1, 1, 1, 1,
0.7707234, -1.626302, 3.009485, 0, 0, 1, 1, 1,
0.7715181, 0.2044455, 2.359925, 1, 0, 0, 1, 1,
0.7738538, 1.289182, -0.1960109, 1, 0, 0, 1, 1,
0.7741492, -0.09510381, 2.235357, 1, 0, 0, 1, 1,
0.7773008, 1.260266, -0.06785619, 1, 0, 0, 1, 1,
0.7782091, -0.3193628, 2.450638, 1, 0, 0, 1, 1,
0.779205, -1.514987, 2.607886, 0, 0, 0, 1, 1,
0.7818272, -0.314984, 1.794001, 0, 0, 0, 1, 1,
0.7855317, -0.6191905, 2.469383, 0, 0, 0, 1, 1,
0.7896733, -0.2338336, 3.155865, 0, 0, 0, 1, 1,
0.7921809, -0.2653762, 0.4682384, 0, 0, 0, 1, 1,
0.7924108, 1.175462, 0.4761286, 0, 0, 0, 1, 1,
0.7930275, -0.3769462, 2.492681, 0, 0, 0, 1, 1,
0.7931989, -0.4522309, 1.432829, 1, 1, 1, 1, 1,
0.7939626, -1.130566, 0.5157318, 1, 1, 1, 1, 1,
0.8018727, -0.7055767, 3.219672, 1, 1, 1, 1, 1,
0.8034247, -0.421277, 2.118188, 1, 1, 1, 1, 1,
0.8044466, -1.522638, 0.5641339, 1, 1, 1, 1, 1,
0.8108658, 0.2139965, 0.2841069, 1, 1, 1, 1, 1,
0.8120137, 0.9849365, 1.303042, 1, 1, 1, 1, 1,
0.8185229, -0.1776459, 0.8615524, 1, 1, 1, 1, 1,
0.8281644, 0.05027907, 1.240407, 1, 1, 1, 1, 1,
0.8283678, 0.5937567, 1.216217, 1, 1, 1, 1, 1,
0.8284681, 0.4267603, 0.2210192, 1, 1, 1, 1, 1,
0.8295672, -0.8293494, 1.911596, 1, 1, 1, 1, 1,
0.8361509, -1.738479, 2.477249, 1, 1, 1, 1, 1,
0.8373504, 0.0374437, 2.433889, 1, 1, 1, 1, 1,
0.8376378, -0.1741608, 0.2411607, 1, 1, 1, 1, 1,
0.8393924, 0.7493669, 2.28731, 0, 0, 1, 1, 1,
0.8395985, -0.08870519, 0.9891163, 1, 0, 0, 1, 1,
0.8480607, -1.869796, 2.54519, 1, 0, 0, 1, 1,
0.8488736, 0.04362763, 2.181424, 1, 0, 0, 1, 1,
0.8541441, -0.5766788, 3.17542, 1, 0, 0, 1, 1,
0.8543589, -1.290105, 3.406203, 1, 0, 0, 1, 1,
0.8600484, -0.1662287, 1.0919, 0, 0, 0, 1, 1,
0.8660898, 0.5713613, 0.8378685, 0, 0, 0, 1, 1,
0.8682016, 0.0888827, 0.5834052, 0, 0, 0, 1, 1,
0.8816226, -0.5200538, 2.500779, 0, 0, 0, 1, 1,
0.8817406, 0.39218, 1.191194, 0, 0, 0, 1, 1,
0.8947451, -1.202765, 2.932562, 0, 0, 0, 1, 1,
0.8950009, -0.5055752, 2.183559, 0, 0, 0, 1, 1,
0.8971926, -0.9935855, 4.495187, 1, 1, 1, 1, 1,
0.9001942, 0.2436063, 0.8232716, 1, 1, 1, 1, 1,
0.9011736, 0.4939395, 1.244874, 1, 1, 1, 1, 1,
0.9048121, -1.606943, 2.808847, 1, 1, 1, 1, 1,
0.9050314, -0.7154452, 1.963213, 1, 1, 1, 1, 1,
0.937871, -0.809753, 1.222978, 1, 1, 1, 1, 1,
0.9386644, 0.1193773, -0.3317334, 1, 1, 1, 1, 1,
0.9479589, 0.215944, 1.5549, 1, 1, 1, 1, 1,
0.9510806, 0.5374546, 1.658221, 1, 1, 1, 1, 1,
0.9526572, 0.2610624, 1.184069, 1, 1, 1, 1, 1,
0.959579, -1.759436, 2.134557, 1, 1, 1, 1, 1,
0.9646614, -1.661408, 2.581761, 1, 1, 1, 1, 1,
0.9654962, 2.42104, -0.2066432, 1, 1, 1, 1, 1,
0.9665989, -1.231021, 2.685823, 1, 1, 1, 1, 1,
0.9752606, -1.640389, 3.144573, 1, 1, 1, 1, 1,
0.9878318, -0.07544185, 3.224329, 0, 0, 1, 1, 1,
0.9945146, -0.9540136, 3.145845, 1, 0, 0, 1, 1,
0.9972813, 0.5817271, 2.699832, 1, 0, 0, 1, 1,
0.9982358, 0.9585078, 0.04326153, 1, 0, 0, 1, 1,
0.9990168, -0.03237464, 1.144413, 1, 0, 0, 1, 1,
0.9999586, 1.729538, 1.431357, 1, 0, 0, 1, 1,
1.000432, 0.2693824, 1.375463, 0, 0, 0, 1, 1,
1.007338, 1.291929, 0.6504413, 0, 0, 0, 1, 1,
1.012764, -0.6740184, 2.419598, 0, 0, 0, 1, 1,
1.017108, 1.632308, -0.6591119, 0, 0, 0, 1, 1,
1.023116, 0.1516626, 2.616116, 0, 0, 0, 1, 1,
1.02778, -0.2402527, 3.956449, 0, 0, 0, 1, 1,
1.031202, -0.4279587, 2.393357, 0, 0, 0, 1, 1,
1.037115, 0.6426234, 1.031248, 1, 1, 1, 1, 1,
1.047816, 0.5606489, 0.7504289, 1, 1, 1, 1, 1,
1.048301, -1.485101, 2.729893, 1, 1, 1, 1, 1,
1.04855, -2.217096, 1.981364, 1, 1, 1, 1, 1,
1.050927, -0.858754, 2.231006, 1, 1, 1, 1, 1,
1.056266, 0.4567737, 1.827215, 1, 1, 1, 1, 1,
1.059718, 0.2669318, 3.501332, 1, 1, 1, 1, 1,
1.062962, 0.2645974, 0.398755, 1, 1, 1, 1, 1,
1.063879, -0.02641072, 2.919771, 1, 1, 1, 1, 1,
1.064782, 1.791518, 0.5464368, 1, 1, 1, 1, 1,
1.067147, -1.466948, 4.677306, 1, 1, 1, 1, 1,
1.074124, 0.4680167, 0.5400764, 1, 1, 1, 1, 1,
1.07422, 0.9595065, -0.228344, 1, 1, 1, 1, 1,
1.080117, -1.420855, 3.56378, 1, 1, 1, 1, 1,
1.085205, -1.177969, 2.195234, 1, 1, 1, 1, 1,
1.090783, 1.221505, -0.3687852, 0, 0, 1, 1, 1,
1.094262, 1.024262, 0.4742752, 1, 0, 0, 1, 1,
1.102827, 0.7623963, 2.40709, 1, 0, 0, 1, 1,
1.104285, 0.01283756, 2.998005, 1, 0, 0, 1, 1,
1.105132, -0.6308125, 1.132409, 1, 0, 0, 1, 1,
1.105866, -1.199458, 2.573878, 1, 0, 0, 1, 1,
1.107663, -0.4473177, 1.853747, 0, 0, 0, 1, 1,
1.114069, 0.5874159, 2.150762, 0, 0, 0, 1, 1,
1.114496, 0.5545928, 0.1280691, 0, 0, 0, 1, 1,
1.120935, 1.179097, 0.1260197, 0, 0, 0, 1, 1,
1.125849, 0.5588636, 2.627481, 0, 0, 0, 1, 1,
1.127235, -0.6307633, 1.062567, 0, 0, 0, 1, 1,
1.127247, -0.3861223, 3.684443, 0, 0, 0, 1, 1,
1.128353, -0.3730021, 1.225683, 1, 1, 1, 1, 1,
1.128713, 0.4728757, 0.7945243, 1, 1, 1, 1, 1,
1.131324, 0.9730442, 1.189603, 1, 1, 1, 1, 1,
1.134147, -0.4088342, 1.095319, 1, 1, 1, 1, 1,
1.139, -0.4291188, 1.411845, 1, 1, 1, 1, 1,
1.146071, 1.72409, 1.27678, 1, 1, 1, 1, 1,
1.150318, 0.9456443, 1.531501, 1, 1, 1, 1, 1,
1.153781, 1.76524, 0.856207, 1, 1, 1, 1, 1,
1.156117, -0.4649236, 1.039586, 1, 1, 1, 1, 1,
1.156961, -0.3699529, 2.287135, 1, 1, 1, 1, 1,
1.159824, 0.05283286, 2.798802, 1, 1, 1, 1, 1,
1.160365, -0.1949689, 2.703857, 1, 1, 1, 1, 1,
1.162616, 0.05294317, 0.3957392, 1, 1, 1, 1, 1,
1.168182, -0.382428, 2.321684, 1, 1, 1, 1, 1,
1.17439, 1.045682, 0.7808348, 1, 1, 1, 1, 1,
1.180347, -0.3794995, 1.460405, 0, 0, 1, 1, 1,
1.182429, 0.7239538, 1.007846, 1, 0, 0, 1, 1,
1.184911, -0.105254, 1.785582, 1, 0, 0, 1, 1,
1.191965, -0.1458176, 3.196444, 1, 0, 0, 1, 1,
1.197442, -0.7917967, 2.512488, 1, 0, 0, 1, 1,
1.207859, -0.7375841, 2.815598, 1, 0, 0, 1, 1,
1.208218, -0.1831405, 0.9513243, 0, 0, 0, 1, 1,
1.212244, -0.1889334, 3.659895, 0, 0, 0, 1, 1,
1.213485, 0.7504308, 3.444561, 0, 0, 0, 1, 1,
1.214413, -1.024586, 1.357689, 0, 0, 0, 1, 1,
1.214785, -2.547526, 4.066269, 0, 0, 0, 1, 1,
1.224992, -0.1922828, 1.229348, 0, 0, 0, 1, 1,
1.225726, -0.9425195, 1.924042, 0, 0, 0, 1, 1,
1.226596, 0.2714574, 1.462935, 1, 1, 1, 1, 1,
1.228171, -0.4155937, 1.424399, 1, 1, 1, 1, 1,
1.240059, -1.129532, 3.658569, 1, 1, 1, 1, 1,
1.242172, 0.08998664, 1.075531, 1, 1, 1, 1, 1,
1.242302, -0.6554316, 1.877695, 1, 1, 1, 1, 1,
1.246119, 2.630693, 0.543018, 1, 1, 1, 1, 1,
1.250353, -0.06245136, 0.207297, 1, 1, 1, 1, 1,
1.259121, 0.6089969, 1.579956, 1, 1, 1, 1, 1,
1.263823, -0.2672794, 1.584335, 1, 1, 1, 1, 1,
1.269877, -0.5514745, 2.670992, 1, 1, 1, 1, 1,
1.270308, -0.7121687, 2.618441, 1, 1, 1, 1, 1,
1.280073, 0.3633334, 2.100038, 1, 1, 1, 1, 1,
1.28021, -0.6111524, 2.967532, 1, 1, 1, 1, 1,
1.282529, -0.5078463, 2.133518, 1, 1, 1, 1, 1,
1.287678, 1.846946, 0.9856571, 1, 1, 1, 1, 1,
1.303644, 0.4797273, 1.634458, 0, 0, 1, 1, 1,
1.318948, 0.4882416, 0.6692833, 1, 0, 0, 1, 1,
1.320607, 1.004533, 0.1499054, 1, 0, 0, 1, 1,
1.323665, 0.1047873, 0.02222254, 1, 0, 0, 1, 1,
1.325675, -1.014785, 1.967715, 1, 0, 0, 1, 1,
1.332564, 0.2480473, 2.574244, 1, 0, 0, 1, 1,
1.335763, 0.05816985, 1.816257, 0, 0, 0, 1, 1,
1.341776, 0.02826226, 0.893169, 0, 0, 0, 1, 1,
1.349404, 0.1328318, 0.7087065, 0, 0, 0, 1, 1,
1.354712, -1.970682, 1.884578, 0, 0, 0, 1, 1,
1.358604, -1.320715, 2.12045, 0, 0, 0, 1, 1,
1.366713, 1.768658, 0.1437048, 0, 0, 0, 1, 1,
1.368146, 0.5723111, 1.910851, 0, 0, 0, 1, 1,
1.370317, -0.09803493, 1.643328, 1, 1, 1, 1, 1,
1.373145, -0.03860774, 1.284124, 1, 1, 1, 1, 1,
1.379864, 0.8606964, 1.165848, 1, 1, 1, 1, 1,
1.386411, -1.494339, 1.778192, 1, 1, 1, 1, 1,
1.389943, -0.5973799, 2.949134, 1, 1, 1, 1, 1,
1.3935, -0.2887269, 0.2101045, 1, 1, 1, 1, 1,
1.394412, 0.4300087, 0.2552043, 1, 1, 1, 1, 1,
1.401807, -0.2273082, 0.2172091, 1, 1, 1, 1, 1,
1.403294, -0.02856248, 1.314762, 1, 1, 1, 1, 1,
1.411787, -0.6445378, 1.401729, 1, 1, 1, 1, 1,
1.412403, -0.5879534, 0.2415738, 1, 1, 1, 1, 1,
1.412799, -1.407158, 1.69318, 1, 1, 1, 1, 1,
1.429784, 0.953761, -0.0115919, 1, 1, 1, 1, 1,
1.444809, 0.2529162, 1.762888, 1, 1, 1, 1, 1,
1.448591, -2.365947, 2.837166, 1, 1, 1, 1, 1,
1.450009, -1.31487, 1.505028, 0, 0, 1, 1, 1,
1.457677, -0.1409798, 1.087981, 1, 0, 0, 1, 1,
1.465323, 0.5591701, 2.28317, 1, 0, 0, 1, 1,
1.465531, -0.06000292, 1.545929, 1, 0, 0, 1, 1,
1.480447, -0.383476, 2.446891, 1, 0, 0, 1, 1,
1.489134, 1.024375, 1.309265, 1, 0, 0, 1, 1,
1.490564, -1.736402, 3.249514, 0, 0, 0, 1, 1,
1.50279, -0.7428918, 2.312598, 0, 0, 0, 1, 1,
1.525369, -0.09832009, 0.9139805, 0, 0, 0, 1, 1,
1.528881, 1.061431, 1.042182, 0, 0, 0, 1, 1,
1.533015, 0.6903167, 0.1556609, 0, 0, 0, 1, 1,
1.539897, -0.6026017, 2.637536, 0, 0, 0, 1, 1,
1.555793, -1.101352, 2.436619, 0, 0, 0, 1, 1,
1.562163, 0.4824561, -1.122162, 1, 1, 1, 1, 1,
1.562539, -0.4918316, 2.762476, 1, 1, 1, 1, 1,
1.568397, -0.2979877, 3.473158, 1, 1, 1, 1, 1,
1.571899, -0.7711297, 1.565105, 1, 1, 1, 1, 1,
1.575328, 0.3138826, 0.3756748, 1, 1, 1, 1, 1,
1.575721, 2.205066, -0.3566169, 1, 1, 1, 1, 1,
1.584195, -0.7635397, 0.8755366, 1, 1, 1, 1, 1,
1.58893, 2.800704, 1.521132, 1, 1, 1, 1, 1,
1.58954, 0.01422146, 1.73663, 1, 1, 1, 1, 1,
1.58985, 1.895032, 1.506393, 1, 1, 1, 1, 1,
1.6021, 0.2757737, 2.111769, 1, 1, 1, 1, 1,
1.611971, 1.008765, 2.12699, 1, 1, 1, 1, 1,
1.61697, 1.00055, -0.234014, 1, 1, 1, 1, 1,
1.623046, -0.7568469, 1.862903, 1, 1, 1, 1, 1,
1.64224, -0.2596286, 2.225252, 1, 1, 1, 1, 1,
1.642479, -0.3480685, 0.8987039, 0, 0, 1, 1, 1,
1.643882, 0.9616876, 1.456476, 1, 0, 0, 1, 1,
1.65901, -0.7197585, 0.4421438, 1, 0, 0, 1, 1,
1.676926, -1.458902, 2.478516, 1, 0, 0, 1, 1,
1.690908, -0.9163204, 2.292641, 1, 0, 0, 1, 1,
1.722715, -0.7346749, 1.347451, 1, 0, 0, 1, 1,
1.750669, -1.255359, 1.48424, 0, 0, 0, 1, 1,
1.769351, 0.4092734, 1.132051, 0, 0, 0, 1, 1,
1.772254, 1.615726, 1.136364, 0, 0, 0, 1, 1,
1.799823, 0.320885, 0.2019855, 0, 0, 0, 1, 1,
1.806331, -0.1437144, 1.887027, 0, 0, 0, 1, 1,
1.809331, 0.8763383, 1.731012, 0, 0, 0, 1, 1,
1.853241, 0.2721167, 1.251536, 0, 0, 0, 1, 1,
1.853412, 1.458979, 1.340967, 1, 1, 1, 1, 1,
1.871882, 0.4901341, 0.106205, 1, 1, 1, 1, 1,
1.880231, 0.4197801, 0.3766856, 1, 1, 1, 1, 1,
1.88927, 0.8369252, 1.395433, 1, 1, 1, 1, 1,
1.899759, 0.5874791, 0.4316401, 1, 1, 1, 1, 1,
1.910108, 1.549988, 1.470345, 1, 1, 1, 1, 1,
1.923852, 0.4561285, 1.188759, 1, 1, 1, 1, 1,
1.956005, 0.9718987, 0.6500229, 1, 1, 1, 1, 1,
2.001607, 0.8365326, 1.224545, 1, 1, 1, 1, 1,
2.010714, 1.35788, 0.5760276, 1, 1, 1, 1, 1,
2.013412, -0.4746765, 3.560407, 1, 1, 1, 1, 1,
2.016532, -0.4311723, 2.744763, 1, 1, 1, 1, 1,
2.085133, -0.2259806, 1.692126, 1, 1, 1, 1, 1,
2.089048, -1.417132, 2.320371, 1, 1, 1, 1, 1,
2.091506, 1.924644, 1.341359, 1, 1, 1, 1, 1,
2.120684, -1.839445, 2.499827, 0, 0, 1, 1, 1,
2.145471, 2.503547, -1.48151, 1, 0, 0, 1, 1,
2.205501, -0.9444571, 2.042402, 1, 0, 0, 1, 1,
2.223583, 0.969106, -0.1825401, 1, 0, 0, 1, 1,
2.225175, 0.03493597, 2.602994, 1, 0, 0, 1, 1,
2.232925, -0.6130856, 1.304274, 1, 0, 0, 1, 1,
2.234251, -0.2719723, 1.931193, 0, 0, 0, 1, 1,
2.238703, -2.523571, 1.76187, 0, 0, 0, 1, 1,
2.240788, -0.8337736, 2.1073, 0, 0, 0, 1, 1,
2.258879, -0.537647, 1.542141, 0, 0, 0, 1, 1,
2.262713, 0.3147706, 1.547397, 0, 0, 0, 1, 1,
2.294609, -0.2043004, 0.0744991, 0, 0, 0, 1, 1,
2.297397, 0.07429332, 1.274955, 0, 0, 0, 1, 1,
2.336259, -1.365487, 1.827121, 1, 1, 1, 1, 1,
2.423559, -0.7843637, 0.8401942, 1, 1, 1, 1, 1,
2.507799, 2.184154, 1.450614, 1, 1, 1, 1, 1,
2.695571, -1.206146, 2.222104, 1, 1, 1, 1, 1,
2.930302, 0.6350011, 4.200896, 1, 1, 1, 1, 1,
2.964419, -0.9283074, 2.042999, 1, 1, 1, 1, 1,
3.157004, -1.616564, 2.418663, 1, 1, 1, 1, 1
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
var radius = 9.880123;
var distance = 34.70351;
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
mvMatrix.translate( 0.2370563, -0.142096, 0.7339449 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.70351);
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
