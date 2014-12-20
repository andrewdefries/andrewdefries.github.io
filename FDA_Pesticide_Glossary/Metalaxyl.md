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
-2.768088, 1.515663, -1.367092, 1, 0, 0, 1,
-2.542625, -1.475541, -1.460239, 1, 0.007843138, 0, 1,
-2.442433, 0.2827192, -0.1854747, 1, 0.01176471, 0, 1,
-2.403478, -1.512126, -1.66753, 1, 0.01960784, 0, 1,
-2.288928, -1.373684, -1.505218, 1, 0.02352941, 0, 1,
-2.267312, 1.782733, -2.129418, 1, 0.03137255, 0, 1,
-2.234151, 0.1865046, -1.015648, 1, 0.03529412, 0, 1,
-2.084988, 0.6313415, -1.598347, 1, 0.04313726, 0, 1,
-2.056981, -0.9620042, -1.839931, 1, 0.04705882, 0, 1,
-1.992854, 0.0368912, -1.208906, 1, 0.05490196, 0, 1,
-1.977374, 0.9291586, -1.01015, 1, 0.05882353, 0, 1,
-1.95313, 0.4078776, -0.7959693, 1, 0.06666667, 0, 1,
-1.932431, -1.739202, -2.351474, 1, 0.07058824, 0, 1,
-1.926881, 0.4200614, -2.634778, 1, 0.07843138, 0, 1,
-1.91819, 0.2912807, -2.28496, 1, 0.08235294, 0, 1,
-1.91703, 0.3613999, -2.791065, 1, 0.09019608, 0, 1,
-1.914182, 0.2663538, -2.706707, 1, 0.09411765, 0, 1,
-1.845772, 0.3667166, -0.2858269, 1, 0.1019608, 0, 1,
-1.84574, 0.03688741, -2.103238, 1, 0.1098039, 0, 1,
-1.838638, 1.071907, -1.348325, 1, 0.1137255, 0, 1,
-1.812559, -1.653832, -2.620629, 1, 0.1215686, 0, 1,
-1.757785, 1.130752, 0.3182033, 1, 0.1254902, 0, 1,
-1.755021, 0.8030183, -2.941976, 1, 0.1333333, 0, 1,
-1.748852, -1.257937, -1.218032, 1, 0.1372549, 0, 1,
-1.747724, 1.696452, 0.1029284, 1, 0.145098, 0, 1,
-1.697067, 1.754797, -1.627659, 1, 0.1490196, 0, 1,
-1.69611, 0.5346271, -0.2751509, 1, 0.1568628, 0, 1,
-1.695499, 0.4615885, -1.068101, 1, 0.1607843, 0, 1,
-1.67127, 0.8845579, -2.072089, 1, 0.1686275, 0, 1,
-1.638621, -1.780464, -2.253598, 1, 0.172549, 0, 1,
-1.632307, -0.2023728, -1.267556, 1, 0.1803922, 0, 1,
-1.623273, 0.3329946, -1.715633, 1, 0.1843137, 0, 1,
-1.603117, -0.1113326, -1.308978, 1, 0.1921569, 0, 1,
-1.598798, 1.223211, -0.02601632, 1, 0.1960784, 0, 1,
-1.588529, 0.3410606, -0.1754702, 1, 0.2039216, 0, 1,
-1.584491, -0.1742344, -1.234106, 1, 0.2117647, 0, 1,
-1.566997, 0.4370406, -0.01389758, 1, 0.2156863, 0, 1,
-1.563473, 1.272736, -1.494325, 1, 0.2235294, 0, 1,
-1.55578, 1.617906, -0.5786959, 1, 0.227451, 0, 1,
-1.546406, -1.201156, -1.562948, 1, 0.2352941, 0, 1,
-1.528565, 0.7018073, -2.448731, 1, 0.2392157, 0, 1,
-1.526692, 0.4012847, -1.23503, 1, 0.2470588, 0, 1,
-1.515525, 0.2986178, -2.82201, 1, 0.2509804, 0, 1,
-1.509172, -0.05610248, 0.2079114, 1, 0.2588235, 0, 1,
-1.497019, -2.475631, -1.422652, 1, 0.2627451, 0, 1,
-1.479508, 0.5645472, -0.07848479, 1, 0.2705882, 0, 1,
-1.4648, -0.6999995, -2.038968, 1, 0.2745098, 0, 1,
-1.457905, 1.187434, -0.828248, 1, 0.282353, 0, 1,
-1.456783, 0.6926742, -1.341248, 1, 0.2862745, 0, 1,
-1.448325, 0.5115058, -0.2872304, 1, 0.2941177, 0, 1,
-1.448002, -0.8105783, -0.7673811, 1, 0.3019608, 0, 1,
-1.446555, -1.567145, -3.508558, 1, 0.3058824, 0, 1,
-1.438486, -0.3693015, -1.823155, 1, 0.3137255, 0, 1,
-1.438461, 1.955533, -0.3079323, 1, 0.3176471, 0, 1,
-1.431913, -0.6863369, -2.412449, 1, 0.3254902, 0, 1,
-1.431291, -0.3792316, -0.3300076, 1, 0.3294118, 0, 1,
-1.401221, -0.6040035, -2.066607, 1, 0.3372549, 0, 1,
-1.394862, 1.219945, -0.3916138, 1, 0.3411765, 0, 1,
-1.379747, -0.3849205, -1.65404, 1, 0.3490196, 0, 1,
-1.377159, 0.5994281, -2.025666, 1, 0.3529412, 0, 1,
-1.376413, 0.2322737, -2.538695, 1, 0.3607843, 0, 1,
-1.375427, 0.9261503, -2.12962, 1, 0.3647059, 0, 1,
-1.373531, 1.896249, -0.5971974, 1, 0.372549, 0, 1,
-1.367272, 0.4602779, -2.776495, 1, 0.3764706, 0, 1,
-1.34484, -0.2549045, -2.437161, 1, 0.3843137, 0, 1,
-1.344407, 0.238441, -1.263358, 1, 0.3882353, 0, 1,
-1.332663, 1.28784, -0.1201376, 1, 0.3960784, 0, 1,
-1.329924, -2.06466, -4.392941, 1, 0.4039216, 0, 1,
-1.327648, -0.5626802, -1.442738, 1, 0.4078431, 0, 1,
-1.324705, 0.2102342, -0.876444, 1, 0.4156863, 0, 1,
-1.323053, 0.4635849, -1.935787, 1, 0.4196078, 0, 1,
-1.314499, 1.832359, -2.001215, 1, 0.427451, 0, 1,
-1.310459, 0.4392655, -2.505305, 1, 0.4313726, 0, 1,
-1.308997, 1.338546, -0.7256373, 1, 0.4392157, 0, 1,
-1.304609, -0.1266389, -3.696529, 1, 0.4431373, 0, 1,
-1.304362, -0.03825489, -0.7115396, 1, 0.4509804, 0, 1,
-1.303211, -2.075927, -1.867895, 1, 0.454902, 0, 1,
-1.297716, -0.08101199, -1.275078, 1, 0.4627451, 0, 1,
-1.287825, 0.9070683, -0.9115448, 1, 0.4666667, 0, 1,
-1.287794, -1.191653, -4.166417, 1, 0.4745098, 0, 1,
-1.286102, -1.359132, -3.006651, 1, 0.4784314, 0, 1,
-1.272421, -1.13689, -3.680229, 1, 0.4862745, 0, 1,
-1.270851, 0.5484077, -0.8735051, 1, 0.4901961, 0, 1,
-1.270282, -1.143822, -3.437284, 1, 0.4980392, 0, 1,
-1.260438, 0.6319488, -1.186648, 1, 0.5058824, 0, 1,
-1.249848, 1.024429, -2.526466, 1, 0.509804, 0, 1,
-1.247968, -0.6979885, -1.351542, 1, 0.5176471, 0, 1,
-1.243544, 0.3867893, -0.9272845, 1, 0.5215687, 0, 1,
-1.218703, 0.8269733, -0.1442935, 1, 0.5294118, 0, 1,
-1.218058, -0.1969952, -0.1214289, 1, 0.5333334, 0, 1,
-1.217509, 0.8469219, -0.5216665, 1, 0.5411765, 0, 1,
-1.216422, 1.36383, 0.1845632, 1, 0.5450981, 0, 1,
-1.215995, -0.212622, -4.269446, 1, 0.5529412, 0, 1,
-1.205434, 0.8789522, -0.9800611, 1, 0.5568628, 0, 1,
-1.205016, -0.104802, -1.085907, 1, 0.5647059, 0, 1,
-1.20259, -1.254482, -2.103355, 1, 0.5686275, 0, 1,
-1.201997, -0.3233182, -1.771589, 1, 0.5764706, 0, 1,
-1.190392, -0.05216594, -0.8077443, 1, 0.5803922, 0, 1,
-1.184138, -0.4376553, -4.093161, 1, 0.5882353, 0, 1,
-1.183692, -0.5702055, -2.940249, 1, 0.5921569, 0, 1,
-1.180107, -2.473197, -1.623001, 1, 0.6, 0, 1,
-1.178117, 1.93246, -2.415771, 1, 0.6078432, 0, 1,
-1.168064, 2.491915, 0.3534386, 1, 0.6117647, 0, 1,
-1.164002, -0.181688, -2.654616, 1, 0.6196079, 0, 1,
-1.158716, -0.2236087, -2.388918, 1, 0.6235294, 0, 1,
-1.157331, -0.06611837, -0.6077155, 1, 0.6313726, 0, 1,
-1.1469, -0.1423467, -2.706058, 1, 0.6352941, 0, 1,
-1.146099, -0.1085923, -2.417069, 1, 0.6431373, 0, 1,
-1.139573, 0.7207455, -1.395899, 1, 0.6470588, 0, 1,
-1.13836, -1.340581, -2.983386, 1, 0.654902, 0, 1,
-1.124435, -0.8366251, -0.6762531, 1, 0.6588235, 0, 1,
-1.119619, -0.4051152, -1.378932, 1, 0.6666667, 0, 1,
-1.115443, -0.01507932, -2.228712, 1, 0.6705883, 0, 1,
-1.112317, 0.007727078, -0.6874605, 1, 0.6784314, 0, 1,
-1.109611, 0.3817353, -1.203231, 1, 0.682353, 0, 1,
-1.106299, -0.8739296, -1.064592, 1, 0.6901961, 0, 1,
-1.10335, 0.2231262, -2.034182, 1, 0.6941177, 0, 1,
-1.101364, -1.091382, -0.7640999, 1, 0.7019608, 0, 1,
-1.096752, -0.5786982, -2.201672, 1, 0.7098039, 0, 1,
-1.095801, -1.03445, -3.029666, 1, 0.7137255, 0, 1,
-1.095322, -1.4066, -0.7728896, 1, 0.7215686, 0, 1,
-1.094754, 0.0576516, -1.943346, 1, 0.7254902, 0, 1,
-1.091487, 0.8665372, -0.7472184, 1, 0.7333333, 0, 1,
-1.090513, 1.285037, -2.230682, 1, 0.7372549, 0, 1,
-1.089491, 1.082912, -0.2437877, 1, 0.7450981, 0, 1,
-1.076764, 0.9335838, -1.502133, 1, 0.7490196, 0, 1,
-1.075732, 0.7590436, -1.734938, 1, 0.7568628, 0, 1,
-1.069421, 0.3463437, -1.867872, 1, 0.7607843, 0, 1,
-1.067882, -0.2825391, -0.3918378, 1, 0.7686275, 0, 1,
-1.062596, 0.4850512, -1.211846, 1, 0.772549, 0, 1,
-1.061733, 1.309048, -0.5910553, 1, 0.7803922, 0, 1,
-1.05524, 0.8331933, -0.274474, 1, 0.7843137, 0, 1,
-1.054663, 0.3826469, 0.6023337, 1, 0.7921569, 0, 1,
-1.042686, -1.101081, -2.533706, 1, 0.7960784, 0, 1,
-1.031627, -0.3394532, -0.8182243, 1, 0.8039216, 0, 1,
-1.024425, 0.2167977, -0.305438, 1, 0.8117647, 0, 1,
-1.017506, -0.3316903, -2.335227, 1, 0.8156863, 0, 1,
-1.017078, 0.3804386, -0.1489946, 1, 0.8235294, 0, 1,
-1.016325, -0.3662497, -0.4582349, 1, 0.827451, 0, 1,
-1.013493, -1.117557, -2.436582, 1, 0.8352941, 0, 1,
-0.9929031, -0.7961087, -2.149717, 1, 0.8392157, 0, 1,
-0.9897109, -0.7104273, -1.882002, 1, 0.8470588, 0, 1,
-0.9891729, -1.012253, -0.605082, 1, 0.8509804, 0, 1,
-0.9881141, 0.7066599, -0.1462361, 1, 0.8588235, 0, 1,
-0.981747, 0.5663488, -3.730659, 1, 0.8627451, 0, 1,
-0.9762686, 0.5112255, -0.7384241, 1, 0.8705882, 0, 1,
-0.9761441, -0.4254495, -1.166178, 1, 0.8745098, 0, 1,
-0.9756877, -0.375124, -1.576301, 1, 0.8823529, 0, 1,
-0.9734529, -0.2880932, -1.785788, 1, 0.8862745, 0, 1,
-0.9701649, -0.06856094, -0.9888057, 1, 0.8941177, 0, 1,
-0.9672757, -0.9761618, -2.536546, 1, 0.8980392, 0, 1,
-0.9592948, -0.2896151, -2.933366, 1, 0.9058824, 0, 1,
-0.9491725, -1.53485, -4.224816, 1, 0.9137255, 0, 1,
-0.943403, 0.2026901, -2.03492, 1, 0.9176471, 0, 1,
-0.9355059, 0.2159068, -1.706856, 1, 0.9254902, 0, 1,
-0.9316047, 0.403468, -0.4641567, 1, 0.9294118, 0, 1,
-0.9299675, -1.251919, -3.891662, 1, 0.9372549, 0, 1,
-0.9196624, 1.398946, -2.156508, 1, 0.9411765, 0, 1,
-0.9155015, 1.141392, 0.8182167, 1, 0.9490196, 0, 1,
-0.9066267, -0.5924824, -0.9883183, 1, 0.9529412, 0, 1,
-0.9014474, -2.525313, -2.614048, 1, 0.9607843, 0, 1,
-0.8886091, 0.9028198, -2.278529, 1, 0.9647059, 0, 1,
-0.8835048, -0.8278475, -2.925292, 1, 0.972549, 0, 1,
-0.8671078, -0.4483112, -0.04166045, 1, 0.9764706, 0, 1,
-0.8660092, -0.8332902, -2.026515, 1, 0.9843137, 0, 1,
-0.863249, 1.533811, -0.2703461, 1, 0.9882353, 0, 1,
-0.8622311, -0.5727991, -2.890151, 1, 0.9960784, 0, 1,
-0.8535082, 0.3912129, 0.8904939, 0.9960784, 1, 0, 1,
-0.8515238, 0.4137185, -1.100879, 0.9921569, 1, 0, 1,
-0.8494044, -0.1033803, -3.614807, 0.9843137, 1, 0, 1,
-0.8401147, 0.8123084, -0.9678774, 0.9803922, 1, 0, 1,
-0.8367335, 1.150559, -1.365938, 0.972549, 1, 0, 1,
-0.8318825, -0.8231963, -3.084341, 0.9686275, 1, 0, 1,
-0.8146045, -0.1811458, -2.031014, 0.9607843, 1, 0, 1,
-0.8140287, 0.6066253, -0.735851, 0.9568627, 1, 0, 1,
-0.8105004, 1.349195, -1.067128, 0.9490196, 1, 0, 1,
-0.8094001, 0.6034611, 0.461352, 0.945098, 1, 0, 1,
-0.8076758, -1.33397, -3.767036, 0.9372549, 1, 0, 1,
-0.8067965, -0.6017314, -0.2289077, 0.9333333, 1, 0, 1,
-0.8048876, 0.827745, 0.4950494, 0.9254902, 1, 0, 1,
-0.8013066, -0.5728766, -2.185005, 0.9215686, 1, 0, 1,
-0.7997066, -1.414515, -4.188675, 0.9137255, 1, 0, 1,
-0.7988851, -1.560437, -2.379488, 0.9098039, 1, 0, 1,
-0.7960035, 0.8327706, -1.876406, 0.9019608, 1, 0, 1,
-0.792105, 0.703603, -1.475953, 0.8941177, 1, 0, 1,
-0.7890639, -0.02939905, -1.17906, 0.8901961, 1, 0, 1,
-0.7871462, 0.6506936, -0.5231362, 0.8823529, 1, 0, 1,
-0.777272, -0.1111185, 0.6799371, 0.8784314, 1, 0, 1,
-0.771506, 0.09050619, -0.1093662, 0.8705882, 1, 0, 1,
-0.7713129, 1.168122, -1.597086, 0.8666667, 1, 0, 1,
-0.7687189, -0.01794085, 0.1513236, 0.8588235, 1, 0, 1,
-0.7653733, 2.286896, -1.367215, 0.854902, 1, 0, 1,
-0.76432, -0.2435758, -1.723942, 0.8470588, 1, 0, 1,
-0.7611614, -1.432203, -1.518316, 0.8431373, 1, 0, 1,
-0.7592989, -0.3736741, -1.968372, 0.8352941, 1, 0, 1,
-0.7587446, 0.7587836, -2.31056, 0.8313726, 1, 0, 1,
-0.7552361, -0.1740908, -1.276343, 0.8235294, 1, 0, 1,
-0.7546597, -0.3917679, -2.516606, 0.8196079, 1, 0, 1,
-0.7539071, -1.263672, -2.605181, 0.8117647, 1, 0, 1,
-0.7506204, 0.5220342, -0.6447876, 0.8078431, 1, 0, 1,
-0.7452843, 0.1650658, -0.07717194, 0.8, 1, 0, 1,
-0.7430881, -0.7062676, -3.196495, 0.7921569, 1, 0, 1,
-0.7429842, -1.142244, -2.513306, 0.7882353, 1, 0, 1,
-0.7380008, 0.2685373, -2.430044, 0.7803922, 1, 0, 1,
-0.737842, 2.427257, 1.059618, 0.7764706, 1, 0, 1,
-0.7328547, 0.2354461, 0.5043844, 0.7686275, 1, 0, 1,
-0.7315534, 1.040202, -1.487837, 0.7647059, 1, 0, 1,
-0.7245858, 1.917537, -0.9157923, 0.7568628, 1, 0, 1,
-0.7234476, -0.6060978, 0.6640015, 0.7529412, 1, 0, 1,
-0.7210867, 0.5045847, -0.5886607, 0.7450981, 1, 0, 1,
-0.7164331, 0.1569988, -3.13396, 0.7411765, 1, 0, 1,
-0.71327, -0.7253811, -3.453816, 0.7333333, 1, 0, 1,
-0.7070746, -0.8983118, -4.028809, 0.7294118, 1, 0, 1,
-0.7019666, 1.271999, -0.6994187, 0.7215686, 1, 0, 1,
-0.700538, -1.408003, -3.451161, 0.7176471, 1, 0, 1,
-0.6992966, 0.6246054, 0.1395163, 0.7098039, 1, 0, 1,
-0.6973035, 0.5788174, -2.165713, 0.7058824, 1, 0, 1,
-0.6942919, -0.2687989, -1.320687, 0.6980392, 1, 0, 1,
-0.6924432, 0.3006022, -4.166775, 0.6901961, 1, 0, 1,
-0.6865427, -0.2420322, -0.7808784, 0.6862745, 1, 0, 1,
-0.6864018, -1.473452, -4.680587, 0.6784314, 1, 0, 1,
-0.6804107, -0.1187215, -0.4025024, 0.6745098, 1, 0, 1,
-0.6795375, 0.1440496, -0.5201498, 0.6666667, 1, 0, 1,
-0.6783785, -0.3178878, -1.412246, 0.6627451, 1, 0, 1,
-0.6783456, -1.036441, -2.403621, 0.654902, 1, 0, 1,
-0.6750684, 0.4225352, -0.5139143, 0.6509804, 1, 0, 1,
-0.6746171, -0.278627, -2.632423, 0.6431373, 1, 0, 1,
-0.6745011, -0.2090404, -2.167867, 0.6392157, 1, 0, 1,
-0.6710702, 0.4851082, -1.853648, 0.6313726, 1, 0, 1,
-0.6701711, -0.08359283, -2.809272, 0.627451, 1, 0, 1,
-0.6695635, -0.05355381, -1.08602, 0.6196079, 1, 0, 1,
-0.6677851, -0.8209161, -1.977207, 0.6156863, 1, 0, 1,
-0.6657156, 0.9269608, 0.2699221, 0.6078432, 1, 0, 1,
-0.6645559, -1.947681, -2.134942, 0.6039216, 1, 0, 1,
-0.6609012, 1.816733, -0.9563729, 0.5960785, 1, 0, 1,
-0.6597576, -0.7892424, -1.117364, 0.5882353, 1, 0, 1,
-0.6573086, -0.2049715, -0.9227878, 0.5843138, 1, 0, 1,
-0.6553792, 1.146273, -1.423676, 0.5764706, 1, 0, 1,
-0.6540604, 1.449679, -2.068925, 0.572549, 1, 0, 1,
-0.649982, 0.3441445, 0.07907627, 0.5647059, 1, 0, 1,
-0.647363, -1.046363, -2.944399, 0.5607843, 1, 0, 1,
-0.6411909, -1.275142, -2.436653, 0.5529412, 1, 0, 1,
-0.6396163, 1.130252, 0.9144002, 0.5490196, 1, 0, 1,
-0.6386875, -0.05217092, -1.473799, 0.5411765, 1, 0, 1,
-0.6321705, 0.7624112, -1.069804, 0.5372549, 1, 0, 1,
-0.6243478, -0.7156725, -2.544641, 0.5294118, 1, 0, 1,
-0.6238256, 0.08019681, -3.154221, 0.5254902, 1, 0, 1,
-0.6228511, 0.2793127, -0.981666, 0.5176471, 1, 0, 1,
-0.6224598, 0.215075, -1.712541, 0.5137255, 1, 0, 1,
-0.619599, -0.10972, -1.064756, 0.5058824, 1, 0, 1,
-0.6182205, 1.240909, -0.8742168, 0.5019608, 1, 0, 1,
-0.6177757, -1.791184, -3.365494, 0.4941176, 1, 0, 1,
-0.6166515, -1.233518, -3.434957, 0.4862745, 1, 0, 1,
-0.6147722, -0.194695, -4.788084, 0.4823529, 1, 0, 1,
-0.6100785, 0.3575548, -1.668877, 0.4745098, 1, 0, 1,
-0.6094429, -1.08323, -1.025617, 0.4705882, 1, 0, 1,
-0.6073472, 1.162269, -1.000414, 0.4627451, 1, 0, 1,
-0.6054265, 0.6351237, 0.2242766, 0.4588235, 1, 0, 1,
-0.6034461, 1.258126, -1.073134, 0.4509804, 1, 0, 1,
-0.6028901, -1.152066, -2.307012, 0.4470588, 1, 0, 1,
-0.6014993, 2.016749, -0.9932, 0.4392157, 1, 0, 1,
-0.5992387, 0.5715568, -0.6020686, 0.4352941, 1, 0, 1,
-0.5942037, -0.5730653, -1.343634, 0.427451, 1, 0, 1,
-0.5941479, 0.2178088, -2.53363, 0.4235294, 1, 0, 1,
-0.5918867, 1.351986, -0.1545005, 0.4156863, 1, 0, 1,
-0.5853283, -0.7784547, -2.270032, 0.4117647, 1, 0, 1,
-0.5801323, -0.08113439, -2.392088, 0.4039216, 1, 0, 1,
-0.5799552, -0.5585679, -3.934995, 0.3960784, 1, 0, 1,
-0.5797953, -1.414007, -3.341107, 0.3921569, 1, 0, 1,
-0.5777187, 0.04231627, -1.282107, 0.3843137, 1, 0, 1,
-0.5769828, -1.544258, -2.068727, 0.3803922, 1, 0, 1,
-0.5766067, 0.5202999, -0.4122679, 0.372549, 1, 0, 1,
-0.5765253, -0.8525044, -4.283315, 0.3686275, 1, 0, 1,
-0.5725408, -0.2303295, -2.724387, 0.3607843, 1, 0, 1,
-0.5668685, -0.316636, -2.513038, 0.3568628, 1, 0, 1,
-0.564866, -2.010353, -3.643546, 0.3490196, 1, 0, 1,
-0.5518132, 1.418111, 1.477508, 0.345098, 1, 0, 1,
-0.5498816, 0.313334, -1.48243, 0.3372549, 1, 0, 1,
-0.5486825, 0.6902912, 0.225383, 0.3333333, 1, 0, 1,
-0.5482908, 0.6082481, -1.778478, 0.3254902, 1, 0, 1,
-0.5468085, -0.1383143, -0.4351361, 0.3215686, 1, 0, 1,
-0.5446299, 0.7469043, -1.566808, 0.3137255, 1, 0, 1,
-0.5373164, 0.7231948, -0.5293851, 0.3098039, 1, 0, 1,
-0.537073, -0.4618272, -0.9171592, 0.3019608, 1, 0, 1,
-0.5370245, 1.204808, -0.4980281, 0.2941177, 1, 0, 1,
-0.5343589, 0.3149201, -1.016947, 0.2901961, 1, 0, 1,
-0.5233048, -1.13761, -1.799548, 0.282353, 1, 0, 1,
-0.5230562, -0.2791913, -2.981656, 0.2784314, 1, 0, 1,
-0.518585, 1.200526, -1.380568, 0.2705882, 1, 0, 1,
-0.5137701, -1.379834, -3.682291, 0.2666667, 1, 0, 1,
-0.5092284, 0.4996519, -1.79208, 0.2588235, 1, 0, 1,
-0.5090252, -1.287343, -2.820301, 0.254902, 1, 0, 1,
-0.5022919, -1.304718, -3.276867, 0.2470588, 1, 0, 1,
-0.5021745, 0.347711, -1.391367, 0.2431373, 1, 0, 1,
-0.5020355, 0.9028947, -0.3847903, 0.2352941, 1, 0, 1,
-0.501398, 0.007871346, -1.755017, 0.2313726, 1, 0, 1,
-0.4987167, -0.6329047, -2.517918, 0.2235294, 1, 0, 1,
-0.4950231, -0.397886, -1.599911, 0.2196078, 1, 0, 1,
-0.4935032, -0.5432919, -3.671555, 0.2117647, 1, 0, 1,
-0.4912827, 0.1993755, -0.8308105, 0.2078431, 1, 0, 1,
-0.4832827, 0.08048008, -2.363397, 0.2, 1, 0, 1,
-0.4793338, 1.285142, -1.960041, 0.1921569, 1, 0, 1,
-0.4738867, -1.710237, -3.62703, 0.1882353, 1, 0, 1,
-0.4730537, -1.646304, -1.820671, 0.1803922, 1, 0, 1,
-0.4694179, -0.9723603, -1.913257, 0.1764706, 1, 0, 1,
-0.4693802, 0.2224959, -0.6915542, 0.1686275, 1, 0, 1,
-0.4655581, -0.3485659, -1.797871, 0.1647059, 1, 0, 1,
-0.4620399, -0.2900518, -2.600806, 0.1568628, 1, 0, 1,
-0.4511864, -0.3971992, -2.190885, 0.1529412, 1, 0, 1,
-0.4499378, -0.6199685, -4.339294, 0.145098, 1, 0, 1,
-0.4478186, -0.1520275, -1.832141, 0.1411765, 1, 0, 1,
-0.4400912, 0.4444927, -0.2905587, 0.1333333, 1, 0, 1,
-0.438092, -0.06697165, -1.198512, 0.1294118, 1, 0, 1,
-0.4373153, -0.3165354, -2.570197, 0.1215686, 1, 0, 1,
-0.4357907, 1.866086, 0.7659544, 0.1176471, 1, 0, 1,
-0.4350179, -0.8850702, -1.688819, 0.1098039, 1, 0, 1,
-0.4347825, 0.7896193, 0.431906, 0.1058824, 1, 0, 1,
-0.4339381, -0.3019426, -2.649427, 0.09803922, 1, 0, 1,
-0.4311462, 0.3770214, -2.313179, 0.09019608, 1, 0, 1,
-0.4259635, 1.758575, -0.5292163, 0.08627451, 1, 0, 1,
-0.4253194, 0.4027422, -1.674956, 0.07843138, 1, 0, 1,
-0.4213206, -1.698819, -2.632231, 0.07450981, 1, 0, 1,
-0.4161934, 0.8989202, -2.52932, 0.06666667, 1, 0, 1,
-0.4143546, 1.968965, -0.3276216, 0.0627451, 1, 0, 1,
-0.411785, 0.2815633, -1.813346, 0.05490196, 1, 0, 1,
-0.4115513, -1.053419, -2.840591, 0.05098039, 1, 0, 1,
-0.4115393, -0.5666695, -3.747616, 0.04313726, 1, 0, 1,
-0.4104515, -0.3474412, -4.084811, 0.03921569, 1, 0, 1,
-0.4074331, -0.5536719, -3.70642, 0.03137255, 1, 0, 1,
-0.4069204, -1.262443, -2.440531, 0.02745098, 1, 0, 1,
-0.4059571, 1.358696, 1.562886, 0.01960784, 1, 0, 1,
-0.4059538, -0.5230832, -2.15241, 0.01568628, 1, 0, 1,
-0.4039235, -1.671433, -3.746671, 0.007843138, 1, 0, 1,
-0.4011061, 0.5681835, -1.306968, 0.003921569, 1, 0, 1,
-0.4009743, -0.2946736, -2.268663, 0, 1, 0.003921569, 1,
-0.3986495, -1.059487, -3.893727, 0, 1, 0.01176471, 1,
-0.3977293, -1.865165, -3.496984, 0, 1, 0.01568628, 1,
-0.3975607, 0.3997145, 0.8259168, 0, 1, 0.02352941, 1,
-0.3909639, 0.3102541, -1.467592, 0, 1, 0.02745098, 1,
-0.3906574, 0.2116548, -0.3808366, 0, 1, 0.03529412, 1,
-0.3875926, 0.2538799, -1.547674, 0, 1, 0.03921569, 1,
-0.3815171, 1.908436, -0.0183952, 0, 1, 0.04705882, 1,
-0.3780353, -0.3409878, -1.005861, 0, 1, 0.05098039, 1,
-0.377763, -0.1223292, -3.016921, 0, 1, 0.05882353, 1,
-0.3742534, 1.207359, 0.368762, 0, 1, 0.0627451, 1,
-0.3735227, 1.60007, 1.524115, 0, 1, 0.07058824, 1,
-0.3658006, -0.450022, -2.926635, 0, 1, 0.07450981, 1,
-0.3628882, 0.5860741, -0.8866193, 0, 1, 0.08235294, 1,
-0.3616323, 1.861951, 0.5828341, 0, 1, 0.08627451, 1,
-0.3600903, 1.318599, 1.797099, 0, 1, 0.09411765, 1,
-0.3577346, 0.1110239, -3.358773, 0, 1, 0.1019608, 1,
-0.3516198, 1.212208, 1.305106, 0, 1, 0.1058824, 1,
-0.3502632, 0.6777282, -0.1271187, 0, 1, 0.1137255, 1,
-0.3498628, 0.2596747, -1.254294, 0, 1, 0.1176471, 1,
-0.3484877, -0.6251149, -3.67737, 0, 1, 0.1254902, 1,
-0.3479138, -0.7289859, -4.457793, 0, 1, 0.1294118, 1,
-0.344662, -0.8059037, -3.797487, 0, 1, 0.1372549, 1,
-0.3423168, 1.957678, -1.296202, 0, 1, 0.1411765, 1,
-0.3418748, 0.4489275, -2.172343, 0, 1, 0.1490196, 1,
-0.3332695, -0.0361918, -1.52755, 0, 1, 0.1529412, 1,
-0.3309881, 0.9789373, -0.8232516, 0, 1, 0.1607843, 1,
-0.3285509, 1.596597, -0.5044764, 0, 1, 0.1647059, 1,
-0.3277171, -0.2188677, -0.9833928, 0, 1, 0.172549, 1,
-0.3266039, 1.083574, 0.6565182, 0, 1, 0.1764706, 1,
-0.3194872, 1.800778, -0.5916303, 0, 1, 0.1843137, 1,
-0.3115051, -1.13284, -1.951506, 0, 1, 0.1882353, 1,
-0.3109371, -0.3304364, -1.106825, 0, 1, 0.1960784, 1,
-0.303488, -0.3394374, -2.61972, 0, 1, 0.2039216, 1,
-0.3030615, -0.248739, -1.560937, 0, 1, 0.2078431, 1,
-0.2996758, 2.210642, -1.506862, 0, 1, 0.2156863, 1,
-0.2953848, -1.574722, -3.362914, 0, 1, 0.2196078, 1,
-0.2952757, 0.7443438, -0.7438794, 0, 1, 0.227451, 1,
-0.2940606, -0.1762183, -3.436176, 0, 1, 0.2313726, 1,
-0.2909215, 1.392425, -1.016235, 0, 1, 0.2392157, 1,
-0.2876067, -1.00348, -1.715303, 0, 1, 0.2431373, 1,
-0.284277, 0.1045425, -0.376096, 0, 1, 0.2509804, 1,
-0.2812683, 0.8974495, 0.03082759, 0, 1, 0.254902, 1,
-0.2805831, -1.199069, -1.321474, 0, 1, 0.2627451, 1,
-0.2781316, -2.852419, -3.93008, 0, 1, 0.2666667, 1,
-0.2756557, 1.657977, -0.08736911, 0, 1, 0.2745098, 1,
-0.2747748, 0.8108559, -0.2597333, 0, 1, 0.2784314, 1,
-0.2738435, -0.3743827, -0.6093484, 0, 1, 0.2862745, 1,
-0.2733611, -0.9309967, -2.565615, 0, 1, 0.2901961, 1,
-0.272679, -1.023809, -2.725585, 0, 1, 0.2980392, 1,
-0.2716095, -0.3041507, -1.652543, 0, 1, 0.3058824, 1,
-0.2700979, 0.8333781, -0.3654145, 0, 1, 0.3098039, 1,
-0.2700172, -0.7275267, -2.368933, 0, 1, 0.3176471, 1,
-0.2663708, 0.6301624, -0.825726, 0, 1, 0.3215686, 1,
-0.2643255, -0.1113736, -1.386928, 0, 1, 0.3294118, 1,
-0.2624626, 0.4037123, -0.1818601, 0, 1, 0.3333333, 1,
-0.2507012, 0.5510138, -1.119015, 0, 1, 0.3411765, 1,
-0.2494157, -0.2787529, -4.08309, 0, 1, 0.345098, 1,
-0.2475289, 0.7129771, 0.4164718, 0, 1, 0.3529412, 1,
-0.2459803, 1.604204, 3.362173, 0, 1, 0.3568628, 1,
-0.2448174, -0.2076774, -1.752019, 0, 1, 0.3647059, 1,
-0.2436744, 0.0298933, -1.65164, 0, 1, 0.3686275, 1,
-0.2433621, -0.3744962, -2.320232, 0, 1, 0.3764706, 1,
-0.2361913, 2.121561, 0.01660097, 0, 1, 0.3803922, 1,
-0.2336186, -1.519551, -3.572891, 0, 1, 0.3882353, 1,
-0.2321965, -0.1426553, -2.822004, 0, 1, 0.3921569, 1,
-0.2290899, -1.09647, -4.165253, 0, 1, 0.4, 1,
-0.2272878, 0.4261194, -2.435144, 0, 1, 0.4078431, 1,
-0.2267089, -0.2312642, -2.018883, 0, 1, 0.4117647, 1,
-0.2249808, 0.5645316, -1.631049, 0, 1, 0.4196078, 1,
-0.2122476, 0.8163497, 0.4699737, 0, 1, 0.4235294, 1,
-0.2087705, -0.754699, -1.99285, 0, 1, 0.4313726, 1,
-0.2076209, 1.898178, 0.02052218, 0, 1, 0.4352941, 1,
-0.2067683, 0.1317849, 0.3651837, 0, 1, 0.4431373, 1,
-0.2065228, 0.08327914, -0.3627795, 0, 1, 0.4470588, 1,
-0.2053833, -1.716488, -2.932696, 0, 1, 0.454902, 1,
-0.2041628, 0.4696348, 0.2853479, 0, 1, 0.4588235, 1,
-0.2017238, 1.288451, 1.621945, 0, 1, 0.4666667, 1,
-0.2012551, 0.9757876, 0.7579409, 0, 1, 0.4705882, 1,
-0.1999898, -0.3039204, -2.787064, 0, 1, 0.4784314, 1,
-0.1989819, -1.547403, -3.625367, 0, 1, 0.4823529, 1,
-0.188204, 0.2479954, -0.3989403, 0, 1, 0.4901961, 1,
-0.183934, 1.540293, -0.8912598, 0, 1, 0.4941176, 1,
-0.1809969, 0.02027977, -1.632665, 0, 1, 0.5019608, 1,
-0.1793075, 0.01118625, -0.5011926, 0, 1, 0.509804, 1,
-0.1791467, 0.3088166, -1.182762, 0, 1, 0.5137255, 1,
-0.1780135, 0.6073997, 0.2427428, 0, 1, 0.5215687, 1,
-0.176374, -1.001584, -2.11259, 0, 1, 0.5254902, 1,
-0.1715674, 1.663, -0.3005132, 0, 1, 0.5333334, 1,
-0.1705847, -0.3506104, -3.6293, 0, 1, 0.5372549, 1,
-0.1672036, -2.37572, -1.791717, 0, 1, 0.5450981, 1,
-0.1613622, -0.6128619, -2.424817, 0, 1, 0.5490196, 1,
-0.1597589, 1.315377, 1.224533, 0, 1, 0.5568628, 1,
-0.1580472, 2.506754, -0.3494127, 0, 1, 0.5607843, 1,
-0.153652, 0.314843, 0.8325251, 0, 1, 0.5686275, 1,
-0.1511692, -0.729871, -3.040881, 0, 1, 0.572549, 1,
-0.1475561, -0.2116375, -2.89652, 0, 1, 0.5803922, 1,
-0.1474331, 0.6224669, -1.214575, 0, 1, 0.5843138, 1,
-0.1465463, 0.06559099, -1.649695, 0, 1, 0.5921569, 1,
-0.1416541, -0.3069726, -4.009604, 0, 1, 0.5960785, 1,
-0.140102, 0.7421579, -1.913249, 0, 1, 0.6039216, 1,
-0.1390412, -0.2937053, -3.263016, 0, 1, 0.6117647, 1,
-0.1378863, -0.08100864, -1.678572, 0, 1, 0.6156863, 1,
-0.1339051, -0.5145073, -2.308407, 0, 1, 0.6235294, 1,
-0.1296427, -2.148618, -2.332387, 0, 1, 0.627451, 1,
-0.1263577, 1.587783, -0.770558, 0, 1, 0.6352941, 1,
-0.126316, -0.3084752, -2.565586, 0, 1, 0.6392157, 1,
-0.1240429, 0.2499122, -0.3799716, 0, 1, 0.6470588, 1,
-0.1230722, -0.7857274, -2.749401, 0, 1, 0.6509804, 1,
-0.119373, -0.2004566, -2.130909, 0, 1, 0.6588235, 1,
-0.1185667, 0.08577178, -0.7522235, 0, 1, 0.6627451, 1,
-0.1144273, 0.9145622, 0.3079918, 0, 1, 0.6705883, 1,
-0.1132465, 0.5595101, 0.6415635, 0, 1, 0.6745098, 1,
-0.1131282, -0.395198, -2.144262, 0, 1, 0.682353, 1,
-0.1102694, 2.506139, -0.1121975, 0, 1, 0.6862745, 1,
-0.1096872, -1.872173, -2.462683, 0, 1, 0.6941177, 1,
-0.1094049, 1.410807, 0.3999457, 0, 1, 0.7019608, 1,
-0.108694, 2.332185, -0.1515959, 0, 1, 0.7058824, 1,
-0.106889, 0.4432505, -0.1572355, 0, 1, 0.7137255, 1,
-0.1040387, 0.2991134, -1.547405, 0, 1, 0.7176471, 1,
-0.1012379, -0.07552363, -1.338893, 0, 1, 0.7254902, 1,
-0.0984493, 0.06452202, -0.4154581, 0, 1, 0.7294118, 1,
-0.09806985, -0.1523652, -1.997678, 0, 1, 0.7372549, 1,
-0.09730121, 0.04171653, -0.970719, 0, 1, 0.7411765, 1,
-0.09725653, 1.097409, -0.8148506, 0, 1, 0.7490196, 1,
-0.09300963, -0.7539865, -2.576038, 0, 1, 0.7529412, 1,
-0.09267266, 0.3000727, 0.7609704, 0, 1, 0.7607843, 1,
-0.09250944, 2.5662, 0.2164775, 0, 1, 0.7647059, 1,
-0.09006103, 0.07053652, 0.03882619, 0, 1, 0.772549, 1,
-0.08789772, -0.1190668, -3.530023, 0, 1, 0.7764706, 1,
-0.08740044, -1.625561, -4.696588, 0, 1, 0.7843137, 1,
-0.08660649, 3.079454, 1.048981, 0, 1, 0.7882353, 1,
-0.08268429, 0.3130246, -0.6028211, 0, 1, 0.7960784, 1,
-0.07679284, -1.181268, -3.156735, 0, 1, 0.8039216, 1,
-0.07670893, -0.8759115, -2.398909, 0, 1, 0.8078431, 1,
-0.07664438, 0.5532983, -0.4396268, 0, 1, 0.8156863, 1,
-0.07502762, 0.9026664, -1.264988, 0, 1, 0.8196079, 1,
-0.07331385, 0.7646351, -0.298636, 0, 1, 0.827451, 1,
-0.06671129, -0.6578501, -4.547439, 0, 1, 0.8313726, 1,
-0.06270587, -0.9227733, -4.420722, 0, 1, 0.8392157, 1,
-0.06032933, -0.5693611, -3.516207, 0, 1, 0.8431373, 1,
-0.05563965, -1.282714, -3.098251, 0, 1, 0.8509804, 1,
-0.05327403, -0.09351106, -1.523341, 0, 1, 0.854902, 1,
-0.05074983, 1.200994, 0.3823742, 0, 1, 0.8627451, 1,
-0.04989405, -0.509545, -1.680117, 0, 1, 0.8666667, 1,
-0.04081858, -0.2791529, -3.891803, 0, 1, 0.8745098, 1,
-0.03712347, -0.2406841, -1.832749, 0, 1, 0.8784314, 1,
-0.03339441, 0.4696351, -1.593767, 0, 1, 0.8862745, 1,
-0.03033837, -3.463111, -4.428759, 0, 1, 0.8901961, 1,
-0.02743171, 0.2332706, -0.5615898, 0, 1, 0.8980392, 1,
-0.02611032, -0.04749182, -2.530089, 0, 1, 0.9058824, 1,
-0.02344186, -2.517104, -0.9255645, 0, 1, 0.9098039, 1,
-0.02075496, -0.1533893, -1.324013, 0, 1, 0.9176471, 1,
-0.01757465, -0.5324783, -4.844948, 0, 1, 0.9215686, 1,
-0.01511058, -0.5186573, -2.433177, 0, 1, 0.9294118, 1,
-0.01435974, 0.8954986, 0.243771, 0, 1, 0.9333333, 1,
-0.01180988, 0.6324221, -0.3890147, 0, 1, 0.9411765, 1,
-0.006280591, 1.759759, -1.72968, 0, 1, 0.945098, 1,
-0.005934094, -0.4369674, -1.91589, 0, 1, 0.9529412, 1,
-0.0002329057, -1.724847, -1.077467, 0, 1, 0.9568627, 1,
0.003499978, -0.6027405, 5.084559, 0, 1, 0.9647059, 1,
0.003949965, 0.5621594, 0.1458667, 0, 1, 0.9686275, 1,
0.006671684, -0.2288424, 3.468958, 0, 1, 0.9764706, 1,
0.007009249, -1.464915, 2.776674, 0, 1, 0.9803922, 1,
0.008278051, 0.5460561, 0.5503535, 0, 1, 0.9882353, 1,
0.01203439, -0.3997789, 2.859869, 0, 1, 0.9921569, 1,
0.01957435, 2.489741, 0.9456012, 0, 1, 1, 1,
0.02182629, 1.021881, -0.7189864, 0, 0.9921569, 1, 1,
0.02438161, 0.4937404, 0.1371022, 0, 0.9882353, 1, 1,
0.02530133, 0.288009, -0.4659223, 0, 0.9803922, 1, 1,
0.04284611, -0.6463928, 3.525485, 0, 0.9764706, 1, 1,
0.04642031, 1.5589, -0.5359878, 0, 0.9686275, 1, 1,
0.04841802, 1.002919, -0.1673996, 0, 0.9647059, 1, 1,
0.0513964, -0.8377615, 4.763202, 0, 0.9568627, 1, 1,
0.05562683, -0.592149, 3.7305, 0, 0.9529412, 1, 1,
0.05568562, 0.2471418, 1.363922, 0, 0.945098, 1, 1,
0.05760739, 0.6557572, 0.215386, 0, 0.9411765, 1, 1,
0.0585634, 1.058802, 0.4366193, 0, 0.9333333, 1, 1,
0.0610304, 0.1003234, 1.773124, 0, 0.9294118, 1, 1,
0.06154394, -0.4869728, 3.008044, 0, 0.9215686, 1, 1,
0.06778294, -0.3581929, 2.900423, 0, 0.9176471, 1, 1,
0.06850103, 0.4112257, 0.7958364, 0, 0.9098039, 1, 1,
0.07113084, 0.1861037, 1.83775, 0, 0.9058824, 1, 1,
0.07487217, -0.8470877, 3.194064, 0, 0.8980392, 1, 1,
0.07833413, 0.1137158, 0.4696852, 0, 0.8901961, 1, 1,
0.08058097, 0.6559677, 0.983584, 0, 0.8862745, 1, 1,
0.09215453, 0.7797235, -1.205066, 0, 0.8784314, 1, 1,
0.09267101, 0.6573356, -0.8611635, 0, 0.8745098, 1, 1,
0.09393319, 0.6817008, -0.9030211, 0, 0.8666667, 1, 1,
0.09789072, -0.9427301, 1.538266, 0, 0.8627451, 1, 1,
0.10173, -0.6995645, 3.599976, 0, 0.854902, 1, 1,
0.102668, -2.431727, 3.498254, 0, 0.8509804, 1, 1,
0.1092904, -0.004934738, 0.3413948, 0, 0.8431373, 1, 1,
0.1123969, 0.7315543, 1.389598, 0, 0.8392157, 1, 1,
0.1165883, -0.1053636, 1.843455, 0, 0.8313726, 1, 1,
0.1174191, -0.1879075, 1.218051, 0, 0.827451, 1, 1,
0.1180676, -1.790273, 3.550916, 0, 0.8196079, 1, 1,
0.1191038, -0.5686105, 2.849488, 0, 0.8156863, 1, 1,
0.1271176, -1.75944, -0.1466163, 0, 0.8078431, 1, 1,
0.1276611, -0.3504108, 2.918944, 0, 0.8039216, 1, 1,
0.1319991, 0.6152681, 1.117526, 0, 0.7960784, 1, 1,
0.1324244, -1.165936, 4.101905, 0, 0.7882353, 1, 1,
0.1330795, -0.6991993, 2.660834, 0, 0.7843137, 1, 1,
0.1370311, -0.05132383, 3.508895, 0, 0.7764706, 1, 1,
0.1447606, -0.1167785, 1.545771, 0, 0.772549, 1, 1,
0.1474462, 1.336433, 2.645054, 0, 0.7647059, 1, 1,
0.1481953, -1.316825, 4.380507, 0, 0.7607843, 1, 1,
0.1482469, -0.1496521, 1.526484, 0, 0.7529412, 1, 1,
0.1492945, -0.2033665, 2.104778, 0, 0.7490196, 1, 1,
0.150658, -0.6951548, 2.220053, 0, 0.7411765, 1, 1,
0.151493, -0.182245, 2.512616, 0, 0.7372549, 1, 1,
0.1517757, -1.775205, 3.178546, 0, 0.7294118, 1, 1,
0.1556118, 0.9306054, -0.2843695, 0, 0.7254902, 1, 1,
0.1582692, 1.526893, 0.1500064, 0, 0.7176471, 1, 1,
0.161594, -1.060867, 3.43372, 0, 0.7137255, 1, 1,
0.1623578, -0.621154, 2.508579, 0, 0.7058824, 1, 1,
0.1669398, 0.3165437, 0.6020624, 0, 0.6980392, 1, 1,
0.1673117, -1.284632, 3.350228, 0, 0.6941177, 1, 1,
0.1673425, 0.4563684, 1.608051, 0, 0.6862745, 1, 1,
0.1802991, 0.8562537, 0.9894856, 0, 0.682353, 1, 1,
0.1803367, -2.035247, 3.292095, 0, 0.6745098, 1, 1,
0.1806569, 0.8639086, -1.312648, 0, 0.6705883, 1, 1,
0.1807977, 0.4026045, 0.05942065, 0, 0.6627451, 1, 1,
0.1825361, 0.2058575, 0.6581452, 0, 0.6588235, 1, 1,
0.1829851, -3.095394, 3.599063, 0, 0.6509804, 1, 1,
0.1834386, 0.5175695, 0.4832588, 0, 0.6470588, 1, 1,
0.184732, 0.9664392, 1.051726, 0, 0.6392157, 1, 1,
0.1982005, 1.946211, -0.902378, 0, 0.6352941, 1, 1,
0.2000322, -0.50853, 3.145406, 0, 0.627451, 1, 1,
0.2032936, -0.2252886, 2.069305, 0, 0.6235294, 1, 1,
0.2036835, -0.171812, 3.436663, 0, 0.6156863, 1, 1,
0.2039782, -0.8380245, 3.217347, 0, 0.6117647, 1, 1,
0.2041005, 0.5043384, 0.09575529, 0, 0.6039216, 1, 1,
0.2071304, 0.7875088, -1.360544, 0, 0.5960785, 1, 1,
0.2095369, 0.7263731, -0.7963411, 0, 0.5921569, 1, 1,
0.2128669, 0.3617277, -0.4236062, 0, 0.5843138, 1, 1,
0.2186522, 0.7610543, 0.497087, 0, 0.5803922, 1, 1,
0.22571, -0.8608292, 2.876564, 0, 0.572549, 1, 1,
0.2262131, -1.95315, 1.17972, 0, 0.5686275, 1, 1,
0.2315169, -0.8186532, 4.362628, 0, 0.5607843, 1, 1,
0.2338465, -0.614293, 3.684854, 0, 0.5568628, 1, 1,
0.2368127, 1.380455, 1.370672, 0, 0.5490196, 1, 1,
0.2374443, -0.07819529, 2.338825, 0, 0.5450981, 1, 1,
0.2388182, -0.8983563, 4.040267, 0, 0.5372549, 1, 1,
0.2391233, -1.173822, 4.311719, 0, 0.5333334, 1, 1,
0.2418583, 0.8932488, -0.542897, 0, 0.5254902, 1, 1,
0.2430596, -0.5885823, 3.665489, 0, 0.5215687, 1, 1,
0.246304, -0.172058, 0.6120249, 0, 0.5137255, 1, 1,
0.2551328, 0.9259446, 0.9366697, 0, 0.509804, 1, 1,
0.2568024, 0.59145, -1.076904, 0, 0.5019608, 1, 1,
0.2582653, -0.0482692, 2.505562, 0, 0.4941176, 1, 1,
0.2592464, 0.3667945, 0.7424157, 0, 0.4901961, 1, 1,
0.263502, 0.3592872, -0.8208723, 0, 0.4823529, 1, 1,
0.2640376, 0.4379159, -0.06397991, 0, 0.4784314, 1, 1,
0.2642753, -1.117319, 3.464783, 0, 0.4705882, 1, 1,
0.2713998, -0.04051442, 3.006421, 0, 0.4666667, 1, 1,
0.2716188, -0.2934694, 2.209211, 0, 0.4588235, 1, 1,
0.2732615, 0.8180746, 0.8859823, 0, 0.454902, 1, 1,
0.2783115, 0.807102, 0.4231436, 0, 0.4470588, 1, 1,
0.2794822, -0.4082424, 2.681828, 0, 0.4431373, 1, 1,
0.2807232, -1.286237, 2.156775, 0, 0.4352941, 1, 1,
0.289363, -1.361133, 3.000468, 0, 0.4313726, 1, 1,
0.2938264, 0.4285698, 2.038281, 0, 0.4235294, 1, 1,
0.2940905, -0.7598203, 2.864226, 0, 0.4196078, 1, 1,
0.2965073, -1.755532, 2.234393, 0, 0.4117647, 1, 1,
0.2996943, 1.21452, 0.6843669, 0, 0.4078431, 1, 1,
0.3014018, 0.2772852, 0.131263, 0, 0.4, 1, 1,
0.3021068, 0.2115431, 0.1577562, 0, 0.3921569, 1, 1,
0.310279, -0.6766151, 3.209401, 0, 0.3882353, 1, 1,
0.3131237, 1.121505, 0.1781055, 0, 0.3803922, 1, 1,
0.3237762, -0.9238033, 1.370542, 0, 0.3764706, 1, 1,
0.325126, -1.032462, 3.085854, 0, 0.3686275, 1, 1,
0.3272485, -0.4032964, 2.542846, 0, 0.3647059, 1, 1,
0.3309387, -0.9601277, 4.965724, 0, 0.3568628, 1, 1,
0.3341539, -0.03437817, 0.5121567, 0, 0.3529412, 1, 1,
0.3357566, -0.4078457, 1.359546, 0, 0.345098, 1, 1,
0.3387819, 1.016304, 1.041109, 0, 0.3411765, 1, 1,
0.3411044, 0.6013899, -0.008958439, 0, 0.3333333, 1, 1,
0.3418777, -0.326615, 3.46316, 0, 0.3294118, 1, 1,
0.3462852, 0.5914568, -1.804954, 0, 0.3215686, 1, 1,
0.3490064, -0.561538, 1.112723, 0, 0.3176471, 1, 1,
0.3581713, 0.3110445, -0.03207138, 0, 0.3098039, 1, 1,
0.3582716, -1.310963, 3.458734, 0, 0.3058824, 1, 1,
0.359926, -1.665495, 1.660109, 0, 0.2980392, 1, 1,
0.3611363, 0.612767, 0.7145723, 0, 0.2901961, 1, 1,
0.3624872, 0.3993255, -0.8779887, 0, 0.2862745, 1, 1,
0.3667593, 1.210444, 0.3026881, 0, 0.2784314, 1, 1,
0.3683455, 0.4740197, 0.3524678, 0, 0.2745098, 1, 1,
0.3731457, -0.09040507, 0.5674815, 0, 0.2666667, 1, 1,
0.3748737, -0.1628716, 0.93349, 0, 0.2627451, 1, 1,
0.3760282, -1.082966, 2.205849, 0, 0.254902, 1, 1,
0.3762021, -0.008539838, 2.169761, 0, 0.2509804, 1, 1,
0.3797192, -1.815582, 2.650334, 0, 0.2431373, 1, 1,
0.384924, 0.6038803, 1.026015, 0, 0.2392157, 1, 1,
0.3865781, 0.07990469, 1.975424, 0, 0.2313726, 1, 1,
0.3897293, -1.065595, 2.112151, 0, 0.227451, 1, 1,
0.3920748, 2.546563, 0.6668513, 0, 0.2196078, 1, 1,
0.3971138, 1.012817, 0.846598, 0, 0.2156863, 1, 1,
0.3978175, 1.683667, -1.07221, 0, 0.2078431, 1, 1,
0.4006547, 0.9137317, -0.3185625, 0, 0.2039216, 1, 1,
0.4024521, -0.4048415, 2.131282, 0, 0.1960784, 1, 1,
0.4025765, 0.00161446, 2.965429, 0, 0.1882353, 1, 1,
0.4089301, 1.173105, -0.2177535, 0, 0.1843137, 1, 1,
0.4102807, -1.496371, 2.227392, 0, 0.1764706, 1, 1,
0.4110822, 0.2024906, 1.739318, 0, 0.172549, 1, 1,
0.411558, -0.5543198, 1.856981, 0, 0.1647059, 1, 1,
0.4156492, 2.018497, 0.2265215, 0, 0.1607843, 1, 1,
0.415876, -0.5321172, 2.494021, 0, 0.1529412, 1, 1,
0.4165081, 0.5490251, 0.08111, 0, 0.1490196, 1, 1,
0.4189074, 0.2933766, 0.3919495, 0, 0.1411765, 1, 1,
0.4192516, -0.9581823, 2.900732, 0, 0.1372549, 1, 1,
0.4244636, -0.1386584, 2.525021, 0, 0.1294118, 1, 1,
0.4279287, 0.02556594, 1.84583, 0, 0.1254902, 1, 1,
0.4288041, 1.883363, 0.143033, 0, 0.1176471, 1, 1,
0.4300022, 0.03113929, 2.36082, 0, 0.1137255, 1, 1,
0.4332619, 0.01330916, 1.871894, 0, 0.1058824, 1, 1,
0.4367829, 1.246643, 0.3178239, 0, 0.09803922, 1, 1,
0.4427598, -0.6177936, 4.019043, 0, 0.09411765, 1, 1,
0.4428603, -1.24449, 4.431307, 0, 0.08627451, 1, 1,
0.4443487, 0.6803825, 0.2988259, 0, 0.08235294, 1, 1,
0.4449719, -1.777523, 2.67656, 0, 0.07450981, 1, 1,
0.450138, -1.23074, 1.142315, 0, 0.07058824, 1, 1,
0.4544124, -0.7022347, 4.262464, 0, 0.0627451, 1, 1,
0.4558074, -0.4888609, 2.507527, 0, 0.05882353, 1, 1,
0.4591216, -1.069341, 3.595219, 0, 0.05098039, 1, 1,
0.4610295, 0.2483119, 0.5678837, 0, 0.04705882, 1, 1,
0.4634325, 0.1009678, 0.344236, 0, 0.03921569, 1, 1,
0.4716251, 0.7179519, 0.749387, 0, 0.03529412, 1, 1,
0.4735771, -0.3189892, 2.155428, 0, 0.02745098, 1, 1,
0.4773013, 1.327607, 0.1591729, 0, 0.02352941, 1, 1,
0.477585, -0.4190937, 2.044747, 0, 0.01568628, 1, 1,
0.4776044, -1.33244, 3.804161, 0, 0.01176471, 1, 1,
0.4786948, 0.1532691, 1.483295, 0, 0.003921569, 1, 1,
0.4796777, -0.5176207, 1.663933, 0.003921569, 0, 1, 1,
0.480897, 0.5919283, 0.7190747, 0.007843138, 0, 1, 1,
0.4848592, 1.228908, -0.2527272, 0.01568628, 0, 1, 1,
0.4861556, 1.142913, 0.15401, 0.01960784, 0, 1, 1,
0.4901441, -1.875296, 2.456403, 0.02745098, 0, 1, 1,
0.4954363, 0.4178917, 1.953312, 0.03137255, 0, 1, 1,
0.5059117, 0.1816269, 3.163107, 0.03921569, 0, 1, 1,
0.5065724, -0.7176591, 2.380578, 0.04313726, 0, 1, 1,
0.5086578, -0.2571425, 1.441166, 0.05098039, 0, 1, 1,
0.5101138, 0.2721224, 1.343093, 0.05490196, 0, 1, 1,
0.510987, 0.7782515, 0.0389831, 0.0627451, 0, 1, 1,
0.5142534, 0.1473945, 2.391941, 0.06666667, 0, 1, 1,
0.516796, 1.235297, 1.003785, 0.07450981, 0, 1, 1,
0.5225453, 0.6893623, -0.04099287, 0.07843138, 0, 1, 1,
0.5232994, -0.9770286, 2.171494, 0.08627451, 0, 1, 1,
0.527739, 0.2697215, 1.287444, 0.09019608, 0, 1, 1,
0.5288416, -1.452812, 3.321624, 0.09803922, 0, 1, 1,
0.5318896, -0.3217311, -0.5804496, 0.1058824, 0, 1, 1,
0.5385438, 2.088212, -1.340194, 0.1098039, 0, 1, 1,
0.5406553, 1.132323, 0.3965788, 0.1176471, 0, 1, 1,
0.5475852, -0.1425443, 2.427208, 0.1215686, 0, 1, 1,
0.5494612, 0.5744039, -1.46018, 0.1294118, 0, 1, 1,
0.5504228, -0.4703668, 2.095294, 0.1333333, 0, 1, 1,
0.5506196, 0.05598425, 3.703298, 0.1411765, 0, 1, 1,
0.5521303, 0.6380317, 0.8036113, 0.145098, 0, 1, 1,
0.5526234, 0.3039194, 0.9945322, 0.1529412, 0, 1, 1,
0.5532074, -0.4551589, 2.098753, 0.1568628, 0, 1, 1,
0.5577001, 1.155635, -0.5438773, 0.1647059, 0, 1, 1,
0.5593266, 0.2803406, 2.226274, 0.1686275, 0, 1, 1,
0.5606897, 1.549666, 0.1575857, 0.1764706, 0, 1, 1,
0.5626798, 0.5400741, 1.334014, 0.1803922, 0, 1, 1,
0.5674216, -0.258309, 1.602785, 0.1882353, 0, 1, 1,
0.5697017, -2.551113, 3.439775, 0.1921569, 0, 1, 1,
0.5717559, 0.3400597, 0.9236578, 0.2, 0, 1, 1,
0.5754538, -0.7229648, 2.586836, 0.2078431, 0, 1, 1,
0.5764794, 1.427927, 1.756056, 0.2117647, 0, 1, 1,
0.5771017, 0.4866492, 2.625942, 0.2196078, 0, 1, 1,
0.5782895, 0.3189217, 1.489917, 0.2235294, 0, 1, 1,
0.5793032, 0.8197496, 0.4198892, 0.2313726, 0, 1, 1,
0.5798991, 0.6452221, 1.158102, 0.2352941, 0, 1, 1,
0.5820384, -1.478629, 2.070672, 0.2431373, 0, 1, 1,
0.5823594, -0.4849875, 2.311238, 0.2470588, 0, 1, 1,
0.5853441, 0.7135128, -0.6262904, 0.254902, 0, 1, 1,
0.5900975, 0.8166509, 0.5471647, 0.2588235, 0, 1, 1,
0.5911942, -0.09729875, 1.598215, 0.2666667, 0, 1, 1,
0.5914676, -0.7730882, 1.655275, 0.2705882, 0, 1, 1,
0.592837, -1.289821, 2.251789, 0.2784314, 0, 1, 1,
0.5933405, 1.419308, -1.057098, 0.282353, 0, 1, 1,
0.5958737, 0.4933399, 0.263991, 0.2901961, 0, 1, 1,
0.5992962, -0.03747077, 0.9677449, 0.2941177, 0, 1, 1,
0.6032888, -0.04926227, 0.6778961, 0.3019608, 0, 1, 1,
0.6038663, -0.8699577, 3.454342, 0.3098039, 0, 1, 1,
0.6075385, 1.122215, -1.221596, 0.3137255, 0, 1, 1,
0.6078559, -0.03034385, 2.148378, 0.3215686, 0, 1, 1,
0.6095143, -0.1780195, 1.327214, 0.3254902, 0, 1, 1,
0.6109641, -1.888836, 4.028981, 0.3333333, 0, 1, 1,
0.6150433, 0.5522075, -0.4209664, 0.3372549, 0, 1, 1,
0.6155618, 1.237003, -0.1668575, 0.345098, 0, 1, 1,
0.6175069, 1.096433, -0.2375212, 0.3490196, 0, 1, 1,
0.6194615, -1.604159, 2.348812, 0.3568628, 0, 1, 1,
0.6221116, 0.858945, 1.263027, 0.3607843, 0, 1, 1,
0.6282056, 0.1277863, 2.199434, 0.3686275, 0, 1, 1,
0.6294355, -0.1468219, -0.2060544, 0.372549, 0, 1, 1,
0.6360022, -1.436852, 2.796785, 0.3803922, 0, 1, 1,
0.6360949, -0.02747582, 1.790126, 0.3843137, 0, 1, 1,
0.6392674, 1.480555, 0.2576139, 0.3921569, 0, 1, 1,
0.6436866, -0.7789726, 1.754515, 0.3960784, 0, 1, 1,
0.6447372, 2.057267, 0.5342059, 0.4039216, 0, 1, 1,
0.6454817, 0.3508304, 1.925538, 0.4117647, 0, 1, 1,
0.6503996, -0.02214998, 0.06886569, 0.4156863, 0, 1, 1,
0.6507087, 1.626425, 0.5524156, 0.4235294, 0, 1, 1,
0.6558424, 0.0370469, 1.83886, 0.427451, 0, 1, 1,
0.6560793, -1.235968, 2.849329, 0.4352941, 0, 1, 1,
0.6565337, -0.725623, 1.749275, 0.4392157, 0, 1, 1,
0.6598299, -0.01311822, 1.674554, 0.4470588, 0, 1, 1,
0.6600436, 0.6028822, -0.055783, 0.4509804, 0, 1, 1,
0.6614009, -1.343518, 4.712184, 0.4588235, 0, 1, 1,
0.6626948, 0.4541638, 0.9713985, 0.4627451, 0, 1, 1,
0.6728805, -0.5452049, 2.908716, 0.4705882, 0, 1, 1,
0.6750754, -1.777057, 4.048792, 0.4745098, 0, 1, 1,
0.6795705, -0.3712484, 1.855321, 0.4823529, 0, 1, 1,
0.6798763, 0.4921475, 0.194687, 0.4862745, 0, 1, 1,
0.679995, 1.087195, 0.2294898, 0.4941176, 0, 1, 1,
0.680602, -1.746479, 2.317639, 0.5019608, 0, 1, 1,
0.6835451, 0.05139231, 2.265733, 0.5058824, 0, 1, 1,
0.6963227, 0.0484133, 1.082878, 0.5137255, 0, 1, 1,
0.7154329, -1.209047, 1.592946, 0.5176471, 0, 1, 1,
0.7158182, 0.06007621, 1.288336, 0.5254902, 0, 1, 1,
0.7186885, 0.0608292, 2.246006, 0.5294118, 0, 1, 1,
0.7207967, 0.4802063, 0.904431, 0.5372549, 0, 1, 1,
0.7277461, -0.4810471, 1.943362, 0.5411765, 0, 1, 1,
0.74016, 0.5051003, 0.7822603, 0.5490196, 0, 1, 1,
0.7431642, 1.10297, 0.9771854, 0.5529412, 0, 1, 1,
0.7477924, 1.249247, -1.115824, 0.5607843, 0, 1, 1,
0.7493141, -0.1635967, 4.052726, 0.5647059, 0, 1, 1,
0.7512553, 1.135649, 1.204083, 0.572549, 0, 1, 1,
0.7615354, -1.214588, 2.521425, 0.5764706, 0, 1, 1,
0.7655053, 0.1197149, -0.3308496, 0.5843138, 0, 1, 1,
0.7721805, 0.8876358, -0.7275836, 0.5882353, 0, 1, 1,
0.7735054, 2.223381, -1.765214, 0.5960785, 0, 1, 1,
0.7825326, -0.1495893, 2.167712, 0.6039216, 0, 1, 1,
0.7838801, -0.4307152, 3.433101, 0.6078432, 0, 1, 1,
0.7842818, 0.4220538, 0.384946, 0.6156863, 0, 1, 1,
0.7865872, 0.2072771, 3.195927, 0.6196079, 0, 1, 1,
0.7918283, -0.4618273, 1.168146, 0.627451, 0, 1, 1,
0.7921329, 0.5190639, 1.835614, 0.6313726, 0, 1, 1,
0.7939209, -0.5246485, 0.7055312, 0.6392157, 0, 1, 1,
0.7940469, 1.605853, -0.3669384, 0.6431373, 0, 1, 1,
0.7952159, -0.3902205, 1.713832, 0.6509804, 0, 1, 1,
0.7959803, -1.811639, 3.184142, 0.654902, 0, 1, 1,
0.7979932, -1.887444, 1.469882, 0.6627451, 0, 1, 1,
0.8003808, -1.485018, 2.077954, 0.6666667, 0, 1, 1,
0.813144, -0.2537131, 0.7584078, 0.6745098, 0, 1, 1,
0.8148946, -0.5315946, 0.6479145, 0.6784314, 0, 1, 1,
0.8218476, -0.7467502, 1.57689, 0.6862745, 0, 1, 1,
0.8330931, 0.9391043, -1.092912, 0.6901961, 0, 1, 1,
0.8339091, 0.9196754, 2.232233, 0.6980392, 0, 1, 1,
0.8370411, 1.112702, 0.7838062, 0.7058824, 0, 1, 1,
0.841653, 1.7776, 0.8888954, 0.7098039, 0, 1, 1,
0.8444985, 0.5839434, 1.915277, 0.7176471, 0, 1, 1,
0.8575462, 0.1806042, 1.741333, 0.7215686, 0, 1, 1,
0.8625927, -0.1846641, 2.334309, 0.7294118, 0, 1, 1,
0.8643394, 0.2912356, 1.251474, 0.7333333, 0, 1, 1,
0.8728447, 2.141457, -1.438903, 0.7411765, 0, 1, 1,
0.8744648, -0.7716084, 1.663792, 0.7450981, 0, 1, 1,
0.8759055, 0.5803238, 0.0442291, 0.7529412, 0, 1, 1,
0.876734, -0.2672669, 2.848102, 0.7568628, 0, 1, 1,
0.8793936, -0.5656486, 2.5805, 0.7647059, 0, 1, 1,
0.8797599, -0.2427016, 3.435094, 0.7686275, 0, 1, 1,
0.8827081, -0.9817808, 2.605476, 0.7764706, 0, 1, 1,
0.8850269, -1.038271, -0.1024194, 0.7803922, 0, 1, 1,
0.8866547, 0.6648491, 0.5133095, 0.7882353, 0, 1, 1,
0.8877798, 0.003204499, -0.05833942, 0.7921569, 0, 1, 1,
0.8899177, 0.610436, 0.9960259, 0.8, 0, 1, 1,
0.8958109, 0.1353401, -0.02743246, 0.8078431, 0, 1, 1,
0.8969476, 0.4422468, 0.9980197, 0.8117647, 0, 1, 1,
0.8985044, -0.6907237, 2.224881, 0.8196079, 0, 1, 1,
0.8992783, 0.175948, -0.2026172, 0.8235294, 0, 1, 1,
0.9049091, 0.6923606, 1.761875, 0.8313726, 0, 1, 1,
0.9072024, 1.538131, 0.3476601, 0.8352941, 0, 1, 1,
0.9083905, -0.3995974, 2.818927, 0.8431373, 0, 1, 1,
0.911235, -0.003876774, 3.023635, 0.8470588, 0, 1, 1,
0.915738, -0.03895719, 0.829944, 0.854902, 0, 1, 1,
0.9158592, -0.5763721, 1.969541, 0.8588235, 0, 1, 1,
0.918561, -1.35236, 2.163305, 0.8666667, 0, 1, 1,
0.9215782, -0.5150889, 2.349841, 0.8705882, 0, 1, 1,
0.9236633, -0.9366807, 1.957518, 0.8784314, 0, 1, 1,
0.9240589, -1.579304, 4.127073, 0.8823529, 0, 1, 1,
0.927238, -0.02446197, 1.964877, 0.8901961, 0, 1, 1,
0.9443925, -0.6183751, 3.372643, 0.8941177, 0, 1, 1,
0.9492734, -1.154913, 2.335836, 0.9019608, 0, 1, 1,
0.9506373, 0.5801795, 0.504839, 0.9098039, 0, 1, 1,
0.958331, -0.4229413, 2.198866, 0.9137255, 0, 1, 1,
0.9669266, -0.6347895, 3.71664, 0.9215686, 0, 1, 1,
0.9681453, 0.8290492, 1.111612, 0.9254902, 0, 1, 1,
0.9701671, -0.6825756, 2.264876, 0.9333333, 0, 1, 1,
0.9765785, 1.842878, -0.1526003, 0.9372549, 0, 1, 1,
0.9985118, 0.1298354, 1.952869, 0.945098, 0, 1, 1,
1.00582, 1.225543, 1.453188, 0.9490196, 0, 1, 1,
1.008349, 0.2247687, 1.584777, 0.9568627, 0, 1, 1,
1.013448, -0.2460755, 2.58958, 0.9607843, 0, 1, 1,
1.015393, 1.250395, -1.284967, 0.9686275, 0, 1, 1,
1.028315, 0.1113971, 0.8027539, 0.972549, 0, 1, 1,
1.030742, -0.2752657, 1.507374, 0.9803922, 0, 1, 1,
1.03175, -0.890167, 1.913746, 0.9843137, 0, 1, 1,
1.0321, -0.7148646, 0.187608, 0.9921569, 0, 1, 1,
1.033103, -0.3812392, 3.390487, 0.9960784, 0, 1, 1,
1.035991, 0.435638, 2.131891, 1, 0, 0.9960784, 1,
1.041774, -0.6119208, 1.177983, 1, 0, 0.9882353, 1,
1.047519, 0.3970268, 2.801866, 1, 0, 0.9843137, 1,
1.048486, 0.6718407, 2.075899, 1, 0, 0.9764706, 1,
1.065235, 0.8774658, 2.363571, 1, 0, 0.972549, 1,
1.076685, 0.6441149, 1.107323, 1, 0, 0.9647059, 1,
1.077288, -0.2825907, 2.337844, 1, 0, 0.9607843, 1,
1.078762, 0.3561769, 0.6823229, 1, 0, 0.9529412, 1,
1.081911, -0.8230426, 2.135846, 1, 0, 0.9490196, 1,
1.086385, -0.3572358, 1.007831, 1, 0, 0.9411765, 1,
1.086447, 1.413059, 1.480383, 1, 0, 0.9372549, 1,
1.087292, -1.685091, 2.480966, 1, 0, 0.9294118, 1,
1.088308, -0.478727, 3.321843, 1, 0, 0.9254902, 1,
1.090908, 0.1706745, 2.939539, 1, 0, 0.9176471, 1,
1.093512, -0.04674424, 3.128875, 1, 0, 0.9137255, 1,
1.097804, 0.9123253, 0.8368424, 1, 0, 0.9058824, 1,
1.099941, 1.360111, 2.069319, 1, 0, 0.9019608, 1,
1.10544, -0.3486538, 2.604486, 1, 0, 0.8941177, 1,
1.110578, -1.583856, 2.2557, 1, 0, 0.8862745, 1,
1.131101, -0.004149351, 0.8148636, 1, 0, 0.8823529, 1,
1.131297, 1.492293, -0.9695665, 1, 0, 0.8745098, 1,
1.132072, -0.617226, 1.283444, 1, 0, 0.8705882, 1,
1.13372, 0.4376965, 3.209981, 1, 0, 0.8627451, 1,
1.13399, 1.354335, 1.835272, 1, 0, 0.8588235, 1,
1.137872, 0.6822819, 1.224377, 1, 0, 0.8509804, 1,
1.142906, 0.4571066, 3.381048, 1, 0, 0.8470588, 1,
1.148219, -1.027673, 3.807335, 1, 0, 0.8392157, 1,
1.152224, 0.5825374, 0.006691732, 1, 0, 0.8352941, 1,
1.163033, -0.02421896, 1.287213, 1, 0, 0.827451, 1,
1.165917, -2.166762, 1.111121, 1, 0, 0.8235294, 1,
1.168558, 0.08947601, -0.287571, 1, 0, 0.8156863, 1,
1.169269, 2.438002, 1.193303, 1, 0, 0.8117647, 1,
1.169635, -0.4530472, 0.862052, 1, 0, 0.8039216, 1,
1.17189, 0.0755733, 0.9962217, 1, 0, 0.7960784, 1,
1.173014, 0.6099865, 1.256602, 1, 0, 0.7921569, 1,
1.173766, 1.238961, 1.628915, 1, 0, 0.7843137, 1,
1.175684, 1.737908, 3.47156, 1, 0, 0.7803922, 1,
1.18253, -0.1969352, 1.636207, 1, 0, 0.772549, 1,
1.184701, 0.4211875, 1.717225, 1, 0, 0.7686275, 1,
1.18551, -0.8127536, 1.790495, 1, 0, 0.7607843, 1,
1.200101, 0.1468905, 2.312534, 1, 0, 0.7568628, 1,
1.2034, 0.3155342, 1.721559, 1, 0, 0.7490196, 1,
1.204297, 0.8544574, -0.5592931, 1, 0, 0.7450981, 1,
1.209186, 0.3392486, 0.725455, 1, 0, 0.7372549, 1,
1.212427, -0.1530979, 3.953112, 1, 0, 0.7333333, 1,
1.215554, -0.1261618, 0.1859044, 1, 0, 0.7254902, 1,
1.215881, -0.7461014, 3.654538, 1, 0, 0.7215686, 1,
1.21822, -0.794515, 2.027416, 1, 0, 0.7137255, 1,
1.219182, -1.108066, 2.50541, 1, 0, 0.7098039, 1,
1.229346, -0.008819711, 1.513732, 1, 0, 0.7019608, 1,
1.243222, 0.3726234, 0.6375032, 1, 0, 0.6941177, 1,
1.248511, 1.328191, 0.5676816, 1, 0, 0.6901961, 1,
1.256385, -0.9959956, 3.172888, 1, 0, 0.682353, 1,
1.262059, 0.02480958, 1.817787, 1, 0, 0.6784314, 1,
1.264812, -0.7396802, 3.361417, 1, 0, 0.6705883, 1,
1.266297, 1.292034, 1.420171, 1, 0, 0.6666667, 1,
1.281726, -0.8610309, 2.184423, 1, 0, 0.6588235, 1,
1.29286, -0.5256436, 3.301857, 1, 0, 0.654902, 1,
1.29527, -0.2299711, 3.395139, 1, 0, 0.6470588, 1,
1.301932, -1.703794, 3.673617, 1, 0, 0.6431373, 1,
1.311087, 1.338158, 0.6811757, 1, 0, 0.6352941, 1,
1.31329, 0.09448136, 2.042482, 1, 0, 0.6313726, 1,
1.318085, 0.8403198, 1.774138, 1, 0, 0.6235294, 1,
1.32201, 0.7317593, 2.46919, 1, 0, 0.6196079, 1,
1.346261, -0.04050496, 1.113729, 1, 0, 0.6117647, 1,
1.347394, 0.5304649, 1.864447, 1, 0, 0.6078432, 1,
1.358989, 0.01052451, 0.4772527, 1, 0, 0.6, 1,
1.367029, -0.8522538, 2.264562, 1, 0, 0.5921569, 1,
1.369847, -0.5133599, 1.521218, 1, 0, 0.5882353, 1,
1.372124, -2.552036, 1.578887, 1, 0, 0.5803922, 1,
1.378257, -1.813933, 2.470224, 1, 0, 0.5764706, 1,
1.37987, 0.2711145, 0.3659829, 1, 0, 0.5686275, 1,
1.395889, -0.427106, 1.242295, 1, 0, 0.5647059, 1,
1.400663, -1.182178, 3.835907, 1, 0, 0.5568628, 1,
1.401524, 0.6266461, 0.9262118, 1, 0, 0.5529412, 1,
1.41756, 0.07687151, 0.9649065, 1, 0, 0.5450981, 1,
1.41761, -1.479671, 0.006769015, 1, 0, 0.5411765, 1,
1.424557, -2.027685, 2.472069, 1, 0, 0.5333334, 1,
1.435113, -0.1266652, 2.681643, 1, 0, 0.5294118, 1,
1.435204, 0.8866015, 0.5061442, 1, 0, 0.5215687, 1,
1.439519, 0.37132, 1.696671, 1, 0, 0.5176471, 1,
1.441322, -1.573547, 2.378135, 1, 0, 0.509804, 1,
1.445001, 2.287396, 0.4089195, 1, 0, 0.5058824, 1,
1.450332, 0.931201, 1.704388, 1, 0, 0.4980392, 1,
1.454112, 0.2657687, 1.637481, 1, 0, 0.4901961, 1,
1.459005, 0.8620049, -1.379771, 1, 0, 0.4862745, 1,
1.464967, 0.7401274, 1.035475, 1, 0, 0.4784314, 1,
1.468235, -0.07003559, 0.7698187, 1, 0, 0.4745098, 1,
1.475825, 0.8002442, -0.2016031, 1, 0, 0.4666667, 1,
1.479553, 0.02562636, 1.423703, 1, 0, 0.4627451, 1,
1.481332, 0.5015619, 2.625572, 1, 0, 0.454902, 1,
1.495764, -0.3668178, 1.056089, 1, 0, 0.4509804, 1,
1.508235, 1.173785, 0.7717899, 1, 0, 0.4431373, 1,
1.510772, -0.02094554, 1.406544, 1, 0, 0.4392157, 1,
1.513568, -2.543576, 2.83905, 1, 0, 0.4313726, 1,
1.513612, -1.471581, 3.690816, 1, 0, 0.427451, 1,
1.517488, -0.4916114, 2.811076, 1, 0, 0.4196078, 1,
1.517914, -0.2223361, 5.241667, 1, 0, 0.4156863, 1,
1.519846, -0.7570926, 1.022931, 1, 0, 0.4078431, 1,
1.535403, 2.240116, 0.2667122, 1, 0, 0.4039216, 1,
1.53585, -0.5142411, 1.687932, 1, 0, 0.3960784, 1,
1.54098, 0.5060475, 1.784281, 1, 0, 0.3882353, 1,
1.549311, 0.3726754, 1.281918, 1, 0, 0.3843137, 1,
1.567209, -0.9215627, 0.9206997, 1, 0, 0.3764706, 1,
1.571515, -0.2507407, 0.9978838, 1, 0, 0.372549, 1,
1.582187, -0.08830015, 2.309347, 1, 0, 0.3647059, 1,
1.583576, 0.5047666, 3.384136, 1, 0, 0.3607843, 1,
1.591682, 0.4061757, 0.9048722, 1, 0, 0.3529412, 1,
1.598601, 0.2007829, 1.323, 1, 0, 0.3490196, 1,
1.601085, 0.6810022, 1.348872, 1, 0, 0.3411765, 1,
1.60501, 0.4776791, -0.781431, 1, 0, 0.3372549, 1,
1.609321, 0.04405198, 0.5832888, 1, 0, 0.3294118, 1,
1.625564, 0.3348157, 0.6891753, 1, 0, 0.3254902, 1,
1.629239, -0.3690396, 3.042871, 1, 0, 0.3176471, 1,
1.662118, -0.3682259, 2.158438, 1, 0, 0.3137255, 1,
1.67476, 1.135717, 0.8058878, 1, 0, 0.3058824, 1,
1.679552, -0.9946856, 2.921978, 1, 0, 0.2980392, 1,
1.686275, -1.370367, 4.044535, 1, 0, 0.2941177, 1,
1.689218, -0.5989329, 2.569621, 1, 0, 0.2862745, 1,
1.697174, -0.3117498, 0.4221485, 1, 0, 0.282353, 1,
1.701965, -0.2982688, 0.3802029, 1, 0, 0.2745098, 1,
1.702627, 0.3887741, 1.184001, 1, 0, 0.2705882, 1,
1.710766, -0.8752979, 2.015122, 1, 0, 0.2627451, 1,
1.714528, 0.652293, 0.2519907, 1, 0, 0.2588235, 1,
1.717701, -0.6310423, 3.638366, 1, 0, 0.2509804, 1,
1.717751, 0.4844845, 1.573942, 1, 0, 0.2470588, 1,
1.719295, 0.9868774, 0.7437338, 1, 0, 0.2392157, 1,
1.728618, -1.595551, 2.870495, 1, 0, 0.2352941, 1,
1.73181, -0.3770754, 1.611464, 1, 0, 0.227451, 1,
1.735808, -1.296158, 1.624838, 1, 0, 0.2235294, 1,
1.738875, 0.04461065, 0.1170044, 1, 0, 0.2156863, 1,
1.754847, -0.8488421, 3.950132, 1, 0, 0.2117647, 1,
1.757428, -1.022769, 0.3731249, 1, 0, 0.2039216, 1,
1.7674, 0.4137869, 2.801851, 1, 0, 0.1960784, 1,
1.86495, -0.68723, 1.119297, 1, 0, 0.1921569, 1,
1.867173, -2.221095, 1.934232, 1, 0, 0.1843137, 1,
1.867563, -0.3863344, 1.25751, 1, 0, 0.1803922, 1,
1.870886, -1.24764, 1.232992, 1, 0, 0.172549, 1,
1.896856, -2.396536, 2.601484, 1, 0, 0.1686275, 1,
1.899227, -0.4686763, 3.219225, 1, 0, 0.1607843, 1,
1.94945, -1.261677, 0.689894, 1, 0, 0.1568628, 1,
1.958154, 0.3078187, 1.703851, 1, 0, 0.1490196, 1,
2.015471, 1.626945, -0.39544, 1, 0, 0.145098, 1,
2.016805, 0.141179, 2.869658, 1, 0, 0.1372549, 1,
2.021747, 1.542557, 1.722032, 1, 0, 0.1333333, 1,
2.149208, -0.01378385, 2.884997, 1, 0, 0.1254902, 1,
2.179476, 0.8473412, 2.568775, 1, 0, 0.1215686, 1,
2.190504, 1.832893, 1.192345, 1, 0, 0.1137255, 1,
2.19062, -0.1555924, 2.868377, 1, 0, 0.1098039, 1,
2.203293, -1.5768, 1.987774, 1, 0, 0.1019608, 1,
2.20901, 0.1677625, 0.6548926, 1, 0, 0.09411765, 1,
2.219157, 0.9884806, 3.17739, 1, 0, 0.09019608, 1,
2.235976, 1.930849, -1.256431, 1, 0, 0.08235294, 1,
2.244705, -0.9950237, 1.450636, 1, 0, 0.07843138, 1,
2.333717, -0.1632521, 0.6550992, 1, 0, 0.07058824, 1,
2.441681, 0.4139545, -0.7186596, 1, 0, 0.06666667, 1,
2.574318, 0.6048917, -0.4381141, 1, 0, 0.05882353, 1,
2.580149, 0.1791973, 3.541987, 1, 0, 0.05490196, 1,
2.649215, -0.07699257, 2.943642, 1, 0, 0.04705882, 1,
2.752997, 1.446096, 1.068849, 1, 0, 0.04313726, 1,
2.783931, 2.392261, 0.2607567, 1, 0, 0.03529412, 1,
2.81376, -0.08683639, 1.494327, 1, 0, 0.03137255, 1,
2.876673, -1.216763, 1.442006, 1, 0, 0.02352941, 1,
2.946577, 0.6322538, 1.89776, 1, 0, 0.01960784, 1,
3.051511, 0.2793593, -0.07782426, 1, 0, 0.01176471, 1,
3.144248, 0.5272499, 1.375231, 1, 0, 0.007843138, 1
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
0.18808, -4.572076, -6.554629, 0, -0.5, 0.5, 0.5,
0.18808, -4.572076, -6.554629, 1, -0.5, 0.5, 0.5,
0.18808, -4.572076, -6.554629, 1, 1.5, 0.5, 0.5,
0.18808, -4.572076, -6.554629, 0, 1.5, 0.5, 0.5
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
-3.770229, -0.1918287, -6.554629, 0, -0.5, 0.5, 0.5,
-3.770229, -0.1918287, -6.554629, 1, -0.5, 0.5, 0.5,
-3.770229, -0.1918287, -6.554629, 1, 1.5, 0.5, 0.5,
-3.770229, -0.1918287, -6.554629, 0, 1.5, 0.5, 0.5
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
-3.770229, -4.572076, 0.1983595, 0, -0.5, 0.5, 0.5,
-3.770229, -4.572076, 0.1983595, 1, -0.5, 0.5, 0.5,
-3.770229, -4.572076, 0.1983595, 1, 1.5, 0.5, 0.5,
-3.770229, -4.572076, 0.1983595, 0, 1.5, 0.5, 0.5
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
-2, -3.56125, -4.996247,
3, -3.56125, -4.996247,
-2, -3.56125, -4.996247,
-2, -3.729721, -5.255977,
-1, -3.56125, -4.996247,
-1, -3.729721, -5.255977,
0, -3.56125, -4.996247,
0, -3.729721, -5.255977,
1, -3.56125, -4.996247,
1, -3.729721, -5.255977,
2, -3.56125, -4.996247,
2, -3.729721, -5.255977,
3, -3.56125, -4.996247,
3, -3.729721, -5.255977
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
-2, -4.066663, -5.775438, 0, -0.5, 0.5, 0.5,
-2, -4.066663, -5.775438, 1, -0.5, 0.5, 0.5,
-2, -4.066663, -5.775438, 1, 1.5, 0.5, 0.5,
-2, -4.066663, -5.775438, 0, 1.5, 0.5, 0.5,
-1, -4.066663, -5.775438, 0, -0.5, 0.5, 0.5,
-1, -4.066663, -5.775438, 1, -0.5, 0.5, 0.5,
-1, -4.066663, -5.775438, 1, 1.5, 0.5, 0.5,
-1, -4.066663, -5.775438, 0, 1.5, 0.5, 0.5,
0, -4.066663, -5.775438, 0, -0.5, 0.5, 0.5,
0, -4.066663, -5.775438, 1, -0.5, 0.5, 0.5,
0, -4.066663, -5.775438, 1, 1.5, 0.5, 0.5,
0, -4.066663, -5.775438, 0, 1.5, 0.5, 0.5,
1, -4.066663, -5.775438, 0, -0.5, 0.5, 0.5,
1, -4.066663, -5.775438, 1, -0.5, 0.5, 0.5,
1, -4.066663, -5.775438, 1, 1.5, 0.5, 0.5,
1, -4.066663, -5.775438, 0, 1.5, 0.5, 0.5,
2, -4.066663, -5.775438, 0, -0.5, 0.5, 0.5,
2, -4.066663, -5.775438, 1, -0.5, 0.5, 0.5,
2, -4.066663, -5.775438, 1, 1.5, 0.5, 0.5,
2, -4.066663, -5.775438, 0, 1.5, 0.5, 0.5,
3, -4.066663, -5.775438, 0, -0.5, 0.5, 0.5,
3, -4.066663, -5.775438, 1, -0.5, 0.5, 0.5,
3, -4.066663, -5.775438, 1, 1.5, 0.5, 0.5,
3, -4.066663, -5.775438, 0, 1.5, 0.5, 0.5
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
-2.856773, -3, -4.996247,
-2.856773, 3, -4.996247,
-2.856773, -3, -4.996247,
-3.009016, -3, -5.255977,
-2.856773, -2, -4.996247,
-3.009016, -2, -5.255977,
-2.856773, -1, -4.996247,
-3.009016, -1, -5.255977,
-2.856773, 0, -4.996247,
-3.009016, 0, -5.255977,
-2.856773, 1, -4.996247,
-3.009016, 1, -5.255977,
-2.856773, 2, -4.996247,
-3.009016, 2, -5.255977,
-2.856773, 3, -4.996247,
-3.009016, 3, -5.255977
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
-3.313501, -3, -5.775438, 0, -0.5, 0.5, 0.5,
-3.313501, -3, -5.775438, 1, -0.5, 0.5, 0.5,
-3.313501, -3, -5.775438, 1, 1.5, 0.5, 0.5,
-3.313501, -3, -5.775438, 0, 1.5, 0.5, 0.5,
-3.313501, -2, -5.775438, 0, -0.5, 0.5, 0.5,
-3.313501, -2, -5.775438, 1, -0.5, 0.5, 0.5,
-3.313501, -2, -5.775438, 1, 1.5, 0.5, 0.5,
-3.313501, -2, -5.775438, 0, 1.5, 0.5, 0.5,
-3.313501, -1, -5.775438, 0, -0.5, 0.5, 0.5,
-3.313501, -1, -5.775438, 1, -0.5, 0.5, 0.5,
-3.313501, -1, -5.775438, 1, 1.5, 0.5, 0.5,
-3.313501, -1, -5.775438, 0, 1.5, 0.5, 0.5,
-3.313501, 0, -5.775438, 0, -0.5, 0.5, 0.5,
-3.313501, 0, -5.775438, 1, -0.5, 0.5, 0.5,
-3.313501, 0, -5.775438, 1, 1.5, 0.5, 0.5,
-3.313501, 0, -5.775438, 0, 1.5, 0.5, 0.5,
-3.313501, 1, -5.775438, 0, -0.5, 0.5, 0.5,
-3.313501, 1, -5.775438, 1, -0.5, 0.5, 0.5,
-3.313501, 1, -5.775438, 1, 1.5, 0.5, 0.5,
-3.313501, 1, -5.775438, 0, 1.5, 0.5, 0.5,
-3.313501, 2, -5.775438, 0, -0.5, 0.5, 0.5,
-3.313501, 2, -5.775438, 1, -0.5, 0.5, 0.5,
-3.313501, 2, -5.775438, 1, 1.5, 0.5, 0.5,
-3.313501, 2, -5.775438, 0, 1.5, 0.5, 0.5,
-3.313501, 3, -5.775438, 0, -0.5, 0.5, 0.5,
-3.313501, 3, -5.775438, 1, -0.5, 0.5, 0.5,
-3.313501, 3, -5.775438, 1, 1.5, 0.5, 0.5,
-3.313501, 3, -5.775438, 0, 1.5, 0.5, 0.5
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
-2.856773, -3.56125, -4,
-2.856773, -3.56125, 4,
-2.856773, -3.56125, -4,
-3.009016, -3.729721, -4,
-2.856773, -3.56125, -2,
-3.009016, -3.729721, -2,
-2.856773, -3.56125, 0,
-3.009016, -3.729721, 0,
-2.856773, -3.56125, 2,
-3.009016, -3.729721, 2,
-2.856773, -3.56125, 4,
-3.009016, -3.729721, 4
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
-3.313501, -4.066663, -4, 0, -0.5, 0.5, 0.5,
-3.313501, -4.066663, -4, 1, -0.5, 0.5, 0.5,
-3.313501, -4.066663, -4, 1, 1.5, 0.5, 0.5,
-3.313501, -4.066663, -4, 0, 1.5, 0.5, 0.5,
-3.313501, -4.066663, -2, 0, -0.5, 0.5, 0.5,
-3.313501, -4.066663, -2, 1, -0.5, 0.5, 0.5,
-3.313501, -4.066663, -2, 1, 1.5, 0.5, 0.5,
-3.313501, -4.066663, -2, 0, 1.5, 0.5, 0.5,
-3.313501, -4.066663, 0, 0, -0.5, 0.5, 0.5,
-3.313501, -4.066663, 0, 1, -0.5, 0.5, 0.5,
-3.313501, -4.066663, 0, 1, 1.5, 0.5, 0.5,
-3.313501, -4.066663, 0, 0, 1.5, 0.5, 0.5,
-3.313501, -4.066663, 2, 0, -0.5, 0.5, 0.5,
-3.313501, -4.066663, 2, 1, -0.5, 0.5, 0.5,
-3.313501, -4.066663, 2, 1, 1.5, 0.5, 0.5,
-3.313501, -4.066663, 2, 0, 1.5, 0.5, 0.5,
-3.313501, -4.066663, 4, 0, -0.5, 0.5, 0.5,
-3.313501, -4.066663, 4, 1, -0.5, 0.5, 0.5,
-3.313501, -4.066663, 4, 1, 1.5, 0.5, 0.5,
-3.313501, -4.066663, 4, 0, 1.5, 0.5, 0.5
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
-2.856773, -3.56125, -4.996247,
-2.856773, 3.177593, -4.996247,
-2.856773, -3.56125, 5.392966,
-2.856773, 3.177593, 5.392966,
-2.856773, -3.56125, -4.996247,
-2.856773, -3.56125, 5.392966,
-2.856773, 3.177593, -4.996247,
-2.856773, 3.177593, 5.392966,
-2.856773, -3.56125, -4.996247,
3.232933, -3.56125, -4.996247,
-2.856773, -3.56125, 5.392966,
3.232933, -3.56125, 5.392966,
-2.856773, 3.177593, -4.996247,
3.232933, 3.177593, -4.996247,
-2.856773, 3.177593, 5.392966,
3.232933, 3.177593, 5.392966,
3.232933, -3.56125, -4.996247,
3.232933, 3.177593, -4.996247,
3.232933, -3.56125, 5.392966,
3.232933, 3.177593, 5.392966,
3.232933, -3.56125, -4.996247,
3.232933, -3.56125, 5.392966,
3.232933, 3.177593, -4.996247,
3.232933, 3.177593, 5.392966
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
var radius = 7.368783;
var distance = 32.78455;
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
mvMatrix.translate( -0.18808, 0.1918287, -0.1983595 );
mvMatrix.scale( 1.308318, 1.182291, 0.7668793 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.78455);
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
Metalaxyl<-read.table("Metalaxyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Metalaxyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Metalaxyl' not found
```

```r
y<-Metalaxyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Metalaxyl' not found
```

```r
z<-Metalaxyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Metalaxyl' not found
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
-2.768088, 1.515663, -1.367092, 0, 0, 1, 1, 1,
-2.542625, -1.475541, -1.460239, 1, 0, 0, 1, 1,
-2.442433, 0.2827192, -0.1854747, 1, 0, 0, 1, 1,
-2.403478, -1.512126, -1.66753, 1, 0, 0, 1, 1,
-2.288928, -1.373684, -1.505218, 1, 0, 0, 1, 1,
-2.267312, 1.782733, -2.129418, 1, 0, 0, 1, 1,
-2.234151, 0.1865046, -1.015648, 0, 0, 0, 1, 1,
-2.084988, 0.6313415, -1.598347, 0, 0, 0, 1, 1,
-2.056981, -0.9620042, -1.839931, 0, 0, 0, 1, 1,
-1.992854, 0.0368912, -1.208906, 0, 0, 0, 1, 1,
-1.977374, 0.9291586, -1.01015, 0, 0, 0, 1, 1,
-1.95313, 0.4078776, -0.7959693, 0, 0, 0, 1, 1,
-1.932431, -1.739202, -2.351474, 0, 0, 0, 1, 1,
-1.926881, 0.4200614, -2.634778, 1, 1, 1, 1, 1,
-1.91819, 0.2912807, -2.28496, 1, 1, 1, 1, 1,
-1.91703, 0.3613999, -2.791065, 1, 1, 1, 1, 1,
-1.914182, 0.2663538, -2.706707, 1, 1, 1, 1, 1,
-1.845772, 0.3667166, -0.2858269, 1, 1, 1, 1, 1,
-1.84574, 0.03688741, -2.103238, 1, 1, 1, 1, 1,
-1.838638, 1.071907, -1.348325, 1, 1, 1, 1, 1,
-1.812559, -1.653832, -2.620629, 1, 1, 1, 1, 1,
-1.757785, 1.130752, 0.3182033, 1, 1, 1, 1, 1,
-1.755021, 0.8030183, -2.941976, 1, 1, 1, 1, 1,
-1.748852, -1.257937, -1.218032, 1, 1, 1, 1, 1,
-1.747724, 1.696452, 0.1029284, 1, 1, 1, 1, 1,
-1.697067, 1.754797, -1.627659, 1, 1, 1, 1, 1,
-1.69611, 0.5346271, -0.2751509, 1, 1, 1, 1, 1,
-1.695499, 0.4615885, -1.068101, 1, 1, 1, 1, 1,
-1.67127, 0.8845579, -2.072089, 0, 0, 1, 1, 1,
-1.638621, -1.780464, -2.253598, 1, 0, 0, 1, 1,
-1.632307, -0.2023728, -1.267556, 1, 0, 0, 1, 1,
-1.623273, 0.3329946, -1.715633, 1, 0, 0, 1, 1,
-1.603117, -0.1113326, -1.308978, 1, 0, 0, 1, 1,
-1.598798, 1.223211, -0.02601632, 1, 0, 0, 1, 1,
-1.588529, 0.3410606, -0.1754702, 0, 0, 0, 1, 1,
-1.584491, -0.1742344, -1.234106, 0, 0, 0, 1, 1,
-1.566997, 0.4370406, -0.01389758, 0, 0, 0, 1, 1,
-1.563473, 1.272736, -1.494325, 0, 0, 0, 1, 1,
-1.55578, 1.617906, -0.5786959, 0, 0, 0, 1, 1,
-1.546406, -1.201156, -1.562948, 0, 0, 0, 1, 1,
-1.528565, 0.7018073, -2.448731, 0, 0, 0, 1, 1,
-1.526692, 0.4012847, -1.23503, 1, 1, 1, 1, 1,
-1.515525, 0.2986178, -2.82201, 1, 1, 1, 1, 1,
-1.509172, -0.05610248, 0.2079114, 1, 1, 1, 1, 1,
-1.497019, -2.475631, -1.422652, 1, 1, 1, 1, 1,
-1.479508, 0.5645472, -0.07848479, 1, 1, 1, 1, 1,
-1.4648, -0.6999995, -2.038968, 1, 1, 1, 1, 1,
-1.457905, 1.187434, -0.828248, 1, 1, 1, 1, 1,
-1.456783, 0.6926742, -1.341248, 1, 1, 1, 1, 1,
-1.448325, 0.5115058, -0.2872304, 1, 1, 1, 1, 1,
-1.448002, -0.8105783, -0.7673811, 1, 1, 1, 1, 1,
-1.446555, -1.567145, -3.508558, 1, 1, 1, 1, 1,
-1.438486, -0.3693015, -1.823155, 1, 1, 1, 1, 1,
-1.438461, 1.955533, -0.3079323, 1, 1, 1, 1, 1,
-1.431913, -0.6863369, -2.412449, 1, 1, 1, 1, 1,
-1.431291, -0.3792316, -0.3300076, 1, 1, 1, 1, 1,
-1.401221, -0.6040035, -2.066607, 0, 0, 1, 1, 1,
-1.394862, 1.219945, -0.3916138, 1, 0, 0, 1, 1,
-1.379747, -0.3849205, -1.65404, 1, 0, 0, 1, 1,
-1.377159, 0.5994281, -2.025666, 1, 0, 0, 1, 1,
-1.376413, 0.2322737, -2.538695, 1, 0, 0, 1, 1,
-1.375427, 0.9261503, -2.12962, 1, 0, 0, 1, 1,
-1.373531, 1.896249, -0.5971974, 0, 0, 0, 1, 1,
-1.367272, 0.4602779, -2.776495, 0, 0, 0, 1, 1,
-1.34484, -0.2549045, -2.437161, 0, 0, 0, 1, 1,
-1.344407, 0.238441, -1.263358, 0, 0, 0, 1, 1,
-1.332663, 1.28784, -0.1201376, 0, 0, 0, 1, 1,
-1.329924, -2.06466, -4.392941, 0, 0, 0, 1, 1,
-1.327648, -0.5626802, -1.442738, 0, 0, 0, 1, 1,
-1.324705, 0.2102342, -0.876444, 1, 1, 1, 1, 1,
-1.323053, 0.4635849, -1.935787, 1, 1, 1, 1, 1,
-1.314499, 1.832359, -2.001215, 1, 1, 1, 1, 1,
-1.310459, 0.4392655, -2.505305, 1, 1, 1, 1, 1,
-1.308997, 1.338546, -0.7256373, 1, 1, 1, 1, 1,
-1.304609, -0.1266389, -3.696529, 1, 1, 1, 1, 1,
-1.304362, -0.03825489, -0.7115396, 1, 1, 1, 1, 1,
-1.303211, -2.075927, -1.867895, 1, 1, 1, 1, 1,
-1.297716, -0.08101199, -1.275078, 1, 1, 1, 1, 1,
-1.287825, 0.9070683, -0.9115448, 1, 1, 1, 1, 1,
-1.287794, -1.191653, -4.166417, 1, 1, 1, 1, 1,
-1.286102, -1.359132, -3.006651, 1, 1, 1, 1, 1,
-1.272421, -1.13689, -3.680229, 1, 1, 1, 1, 1,
-1.270851, 0.5484077, -0.8735051, 1, 1, 1, 1, 1,
-1.270282, -1.143822, -3.437284, 1, 1, 1, 1, 1,
-1.260438, 0.6319488, -1.186648, 0, 0, 1, 1, 1,
-1.249848, 1.024429, -2.526466, 1, 0, 0, 1, 1,
-1.247968, -0.6979885, -1.351542, 1, 0, 0, 1, 1,
-1.243544, 0.3867893, -0.9272845, 1, 0, 0, 1, 1,
-1.218703, 0.8269733, -0.1442935, 1, 0, 0, 1, 1,
-1.218058, -0.1969952, -0.1214289, 1, 0, 0, 1, 1,
-1.217509, 0.8469219, -0.5216665, 0, 0, 0, 1, 1,
-1.216422, 1.36383, 0.1845632, 0, 0, 0, 1, 1,
-1.215995, -0.212622, -4.269446, 0, 0, 0, 1, 1,
-1.205434, 0.8789522, -0.9800611, 0, 0, 0, 1, 1,
-1.205016, -0.104802, -1.085907, 0, 0, 0, 1, 1,
-1.20259, -1.254482, -2.103355, 0, 0, 0, 1, 1,
-1.201997, -0.3233182, -1.771589, 0, 0, 0, 1, 1,
-1.190392, -0.05216594, -0.8077443, 1, 1, 1, 1, 1,
-1.184138, -0.4376553, -4.093161, 1, 1, 1, 1, 1,
-1.183692, -0.5702055, -2.940249, 1, 1, 1, 1, 1,
-1.180107, -2.473197, -1.623001, 1, 1, 1, 1, 1,
-1.178117, 1.93246, -2.415771, 1, 1, 1, 1, 1,
-1.168064, 2.491915, 0.3534386, 1, 1, 1, 1, 1,
-1.164002, -0.181688, -2.654616, 1, 1, 1, 1, 1,
-1.158716, -0.2236087, -2.388918, 1, 1, 1, 1, 1,
-1.157331, -0.06611837, -0.6077155, 1, 1, 1, 1, 1,
-1.1469, -0.1423467, -2.706058, 1, 1, 1, 1, 1,
-1.146099, -0.1085923, -2.417069, 1, 1, 1, 1, 1,
-1.139573, 0.7207455, -1.395899, 1, 1, 1, 1, 1,
-1.13836, -1.340581, -2.983386, 1, 1, 1, 1, 1,
-1.124435, -0.8366251, -0.6762531, 1, 1, 1, 1, 1,
-1.119619, -0.4051152, -1.378932, 1, 1, 1, 1, 1,
-1.115443, -0.01507932, -2.228712, 0, 0, 1, 1, 1,
-1.112317, 0.007727078, -0.6874605, 1, 0, 0, 1, 1,
-1.109611, 0.3817353, -1.203231, 1, 0, 0, 1, 1,
-1.106299, -0.8739296, -1.064592, 1, 0, 0, 1, 1,
-1.10335, 0.2231262, -2.034182, 1, 0, 0, 1, 1,
-1.101364, -1.091382, -0.7640999, 1, 0, 0, 1, 1,
-1.096752, -0.5786982, -2.201672, 0, 0, 0, 1, 1,
-1.095801, -1.03445, -3.029666, 0, 0, 0, 1, 1,
-1.095322, -1.4066, -0.7728896, 0, 0, 0, 1, 1,
-1.094754, 0.0576516, -1.943346, 0, 0, 0, 1, 1,
-1.091487, 0.8665372, -0.7472184, 0, 0, 0, 1, 1,
-1.090513, 1.285037, -2.230682, 0, 0, 0, 1, 1,
-1.089491, 1.082912, -0.2437877, 0, 0, 0, 1, 1,
-1.076764, 0.9335838, -1.502133, 1, 1, 1, 1, 1,
-1.075732, 0.7590436, -1.734938, 1, 1, 1, 1, 1,
-1.069421, 0.3463437, -1.867872, 1, 1, 1, 1, 1,
-1.067882, -0.2825391, -0.3918378, 1, 1, 1, 1, 1,
-1.062596, 0.4850512, -1.211846, 1, 1, 1, 1, 1,
-1.061733, 1.309048, -0.5910553, 1, 1, 1, 1, 1,
-1.05524, 0.8331933, -0.274474, 1, 1, 1, 1, 1,
-1.054663, 0.3826469, 0.6023337, 1, 1, 1, 1, 1,
-1.042686, -1.101081, -2.533706, 1, 1, 1, 1, 1,
-1.031627, -0.3394532, -0.8182243, 1, 1, 1, 1, 1,
-1.024425, 0.2167977, -0.305438, 1, 1, 1, 1, 1,
-1.017506, -0.3316903, -2.335227, 1, 1, 1, 1, 1,
-1.017078, 0.3804386, -0.1489946, 1, 1, 1, 1, 1,
-1.016325, -0.3662497, -0.4582349, 1, 1, 1, 1, 1,
-1.013493, -1.117557, -2.436582, 1, 1, 1, 1, 1,
-0.9929031, -0.7961087, -2.149717, 0, 0, 1, 1, 1,
-0.9897109, -0.7104273, -1.882002, 1, 0, 0, 1, 1,
-0.9891729, -1.012253, -0.605082, 1, 0, 0, 1, 1,
-0.9881141, 0.7066599, -0.1462361, 1, 0, 0, 1, 1,
-0.981747, 0.5663488, -3.730659, 1, 0, 0, 1, 1,
-0.9762686, 0.5112255, -0.7384241, 1, 0, 0, 1, 1,
-0.9761441, -0.4254495, -1.166178, 0, 0, 0, 1, 1,
-0.9756877, -0.375124, -1.576301, 0, 0, 0, 1, 1,
-0.9734529, -0.2880932, -1.785788, 0, 0, 0, 1, 1,
-0.9701649, -0.06856094, -0.9888057, 0, 0, 0, 1, 1,
-0.9672757, -0.9761618, -2.536546, 0, 0, 0, 1, 1,
-0.9592948, -0.2896151, -2.933366, 0, 0, 0, 1, 1,
-0.9491725, -1.53485, -4.224816, 0, 0, 0, 1, 1,
-0.943403, 0.2026901, -2.03492, 1, 1, 1, 1, 1,
-0.9355059, 0.2159068, -1.706856, 1, 1, 1, 1, 1,
-0.9316047, 0.403468, -0.4641567, 1, 1, 1, 1, 1,
-0.9299675, -1.251919, -3.891662, 1, 1, 1, 1, 1,
-0.9196624, 1.398946, -2.156508, 1, 1, 1, 1, 1,
-0.9155015, 1.141392, 0.8182167, 1, 1, 1, 1, 1,
-0.9066267, -0.5924824, -0.9883183, 1, 1, 1, 1, 1,
-0.9014474, -2.525313, -2.614048, 1, 1, 1, 1, 1,
-0.8886091, 0.9028198, -2.278529, 1, 1, 1, 1, 1,
-0.8835048, -0.8278475, -2.925292, 1, 1, 1, 1, 1,
-0.8671078, -0.4483112, -0.04166045, 1, 1, 1, 1, 1,
-0.8660092, -0.8332902, -2.026515, 1, 1, 1, 1, 1,
-0.863249, 1.533811, -0.2703461, 1, 1, 1, 1, 1,
-0.8622311, -0.5727991, -2.890151, 1, 1, 1, 1, 1,
-0.8535082, 0.3912129, 0.8904939, 1, 1, 1, 1, 1,
-0.8515238, 0.4137185, -1.100879, 0, 0, 1, 1, 1,
-0.8494044, -0.1033803, -3.614807, 1, 0, 0, 1, 1,
-0.8401147, 0.8123084, -0.9678774, 1, 0, 0, 1, 1,
-0.8367335, 1.150559, -1.365938, 1, 0, 0, 1, 1,
-0.8318825, -0.8231963, -3.084341, 1, 0, 0, 1, 1,
-0.8146045, -0.1811458, -2.031014, 1, 0, 0, 1, 1,
-0.8140287, 0.6066253, -0.735851, 0, 0, 0, 1, 1,
-0.8105004, 1.349195, -1.067128, 0, 0, 0, 1, 1,
-0.8094001, 0.6034611, 0.461352, 0, 0, 0, 1, 1,
-0.8076758, -1.33397, -3.767036, 0, 0, 0, 1, 1,
-0.8067965, -0.6017314, -0.2289077, 0, 0, 0, 1, 1,
-0.8048876, 0.827745, 0.4950494, 0, 0, 0, 1, 1,
-0.8013066, -0.5728766, -2.185005, 0, 0, 0, 1, 1,
-0.7997066, -1.414515, -4.188675, 1, 1, 1, 1, 1,
-0.7988851, -1.560437, -2.379488, 1, 1, 1, 1, 1,
-0.7960035, 0.8327706, -1.876406, 1, 1, 1, 1, 1,
-0.792105, 0.703603, -1.475953, 1, 1, 1, 1, 1,
-0.7890639, -0.02939905, -1.17906, 1, 1, 1, 1, 1,
-0.7871462, 0.6506936, -0.5231362, 1, 1, 1, 1, 1,
-0.777272, -0.1111185, 0.6799371, 1, 1, 1, 1, 1,
-0.771506, 0.09050619, -0.1093662, 1, 1, 1, 1, 1,
-0.7713129, 1.168122, -1.597086, 1, 1, 1, 1, 1,
-0.7687189, -0.01794085, 0.1513236, 1, 1, 1, 1, 1,
-0.7653733, 2.286896, -1.367215, 1, 1, 1, 1, 1,
-0.76432, -0.2435758, -1.723942, 1, 1, 1, 1, 1,
-0.7611614, -1.432203, -1.518316, 1, 1, 1, 1, 1,
-0.7592989, -0.3736741, -1.968372, 1, 1, 1, 1, 1,
-0.7587446, 0.7587836, -2.31056, 1, 1, 1, 1, 1,
-0.7552361, -0.1740908, -1.276343, 0, 0, 1, 1, 1,
-0.7546597, -0.3917679, -2.516606, 1, 0, 0, 1, 1,
-0.7539071, -1.263672, -2.605181, 1, 0, 0, 1, 1,
-0.7506204, 0.5220342, -0.6447876, 1, 0, 0, 1, 1,
-0.7452843, 0.1650658, -0.07717194, 1, 0, 0, 1, 1,
-0.7430881, -0.7062676, -3.196495, 1, 0, 0, 1, 1,
-0.7429842, -1.142244, -2.513306, 0, 0, 0, 1, 1,
-0.7380008, 0.2685373, -2.430044, 0, 0, 0, 1, 1,
-0.737842, 2.427257, 1.059618, 0, 0, 0, 1, 1,
-0.7328547, 0.2354461, 0.5043844, 0, 0, 0, 1, 1,
-0.7315534, 1.040202, -1.487837, 0, 0, 0, 1, 1,
-0.7245858, 1.917537, -0.9157923, 0, 0, 0, 1, 1,
-0.7234476, -0.6060978, 0.6640015, 0, 0, 0, 1, 1,
-0.7210867, 0.5045847, -0.5886607, 1, 1, 1, 1, 1,
-0.7164331, 0.1569988, -3.13396, 1, 1, 1, 1, 1,
-0.71327, -0.7253811, -3.453816, 1, 1, 1, 1, 1,
-0.7070746, -0.8983118, -4.028809, 1, 1, 1, 1, 1,
-0.7019666, 1.271999, -0.6994187, 1, 1, 1, 1, 1,
-0.700538, -1.408003, -3.451161, 1, 1, 1, 1, 1,
-0.6992966, 0.6246054, 0.1395163, 1, 1, 1, 1, 1,
-0.6973035, 0.5788174, -2.165713, 1, 1, 1, 1, 1,
-0.6942919, -0.2687989, -1.320687, 1, 1, 1, 1, 1,
-0.6924432, 0.3006022, -4.166775, 1, 1, 1, 1, 1,
-0.6865427, -0.2420322, -0.7808784, 1, 1, 1, 1, 1,
-0.6864018, -1.473452, -4.680587, 1, 1, 1, 1, 1,
-0.6804107, -0.1187215, -0.4025024, 1, 1, 1, 1, 1,
-0.6795375, 0.1440496, -0.5201498, 1, 1, 1, 1, 1,
-0.6783785, -0.3178878, -1.412246, 1, 1, 1, 1, 1,
-0.6783456, -1.036441, -2.403621, 0, 0, 1, 1, 1,
-0.6750684, 0.4225352, -0.5139143, 1, 0, 0, 1, 1,
-0.6746171, -0.278627, -2.632423, 1, 0, 0, 1, 1,
-0.6745011, -0.2090404, -2.167867, 1, 0, 0, 1, 1,
-0.6710702, 0.4851082, -1.853648, 1, 0, 0, 1, 1,
-0.6701711, -0.08359283, -2.809272, 1, 0, 0, 1, 1,
-0.6695635, -0.05355381, -1.08602, 0, 0, 0, 1, 1,
-0.6677851, -0.8209161, -1.977207, 0, 0, 0, 1, 1,
-0.6657156, 0.9269608, 0.2699221, 0, 0, 0, 1, 1,
-0.6645559, -1.947681, -2.134942, 0, 0, 0, 1, 1,
-0.6609012, 1.816733, -0.9563729, 0, 0, 0, 1, 1,
-0.6597576, -0.7892424, -1.117364, 0, 0, 0, 1, 1,
-0.6573086, -0.2049715, -0.9227878, 0, 0, 0, 1, 1,
-0.6553792, 1.146273, -1.423676, 1, 1, 1, 1, 1,
-0.6540604, 1.449679, -2.068925, 1, 1, 1, 1, 1,
-0.649982, 0.3441445, 0.07907627, 1, 1, 1, 1, 1,
-0.647363, -1.046363, -2.944399, 1, 1, 1, 1, 1,
-0.6411909, -1.275142, -2.436653, 1, 1, 1, 1, 1,
-0.6396163, 1.130252, 0.9144002, 1, 1, 1, 1, 1,
-0.6386875, -0.05217092, -1.473799, 1, 1, 1, 1, 1,
-0.6321705, 0.7624112, -1.069804, 1, 1, 1, 1, 1,
-0.6243478, -0.7156725, -2.544641, 1, 1, 1, 1, 1,
-0.6238256, 0.08019681, -3.154221, 1, 1, 1, 1, 1,
-0.6228511, 0.2793127, -0.981666, 1, 1, 1, 1, 1,
-0.6224598, 0.215075, -1.712541, 1, 1, 1, 1, 1,
-0.619599, -0.10972, -1.064756, 1, 1, 1, 1, 1,
-0.6182205, 1.240909, -0.8742168, 1, 1, 1, 1, 1,
-0.6177757, -1.791184, -3.365494, 1, 1, 1, 1, 1,
-0.6166515, -1.233518, -3.434957, 0, 0, 1, 1, 1,
-0.6147722, -0.194695, -4.788084, 1, 0, 0, 1, 1,
-0.6100785, 0.3575548, -1.668877, 1, 0, 0, 1, 1,
-0.6094429, -1.08323, -1.025617, 1, 0, 0, 1, 1,
-0.6073472, 1.162269, -1.000414, 1, 0, 0, 1, 1,
-0.6054265, 0.6351237, 0.2242766, 1, 0, 0, 1, 1,
-0.6034461, 1.258126, -1.073134, 0, 0, 0, 1, 1,
-0.6028901, -1.152066, -2.307012, 0, 0, 0, 1, 1,
-0.6014993, 2.016749, -0.9932, 0, 0, 0, 1, 1,
-0.5992387, 0.5715568, -0.6020686, 0, 0, 0, 1, 1,
-0.5942037, -0.5730653, -1.343634, 0, 0, 0, 1, 1,
-0.5941479, 0.2178088, -2.53363, 0, 0, 0, 1, 1,
-0.5918867, 1.351986, -0.1545005, 0, 0, 0, 1, 1,
-0.5853283, -0.7784547, -2.270032, 1, 1, 1, 1, 1,
-0.5801323, -0.08113439, -2.392088, 1, 1, 1, 1, 1,
-0.5799552, -0.5585679, -3.934995, 1, 1, 1, 1, 1,
-0.5797953, -1.414007, -3.341107, 1, 1, 1, 1, 1,
-0.5777187, 0.04231627, -1.282107, 1, 1, 1, 1, 1,
-0.5769828, -1.544258, -2.068727, 1, 1, 1, 1, 1,
-0.5766067, 0.5202999, -0.4122679, 1, 1, 1, 1, 1,
-0.5765253, -0.8525044, -4.283315, 1, 1, 1, 1, 1,
-0.5725408, -0.2303295, -2.724387, 1, 1, 1, 1, 1,
-0.5668685, -0.316636, -2.513038, 1, 1, 1, 1, 1,
-0.564866, -2.010353, -3.643546, 1, 1, 1, 1, 1,
-0.5518132, 1.418111, 1.477508, 1, 1, 1, 1, 1,
-0.5498816, 0.313334, -1.48243, 1, 1, 1, 1, 1,
-0.5486825, 0.6902912, 0.225383, 1, 1, 1, 1, 1,
-0.5482908, 0.6082481, -1.778478, 1, 1, 1, 1, 1,
-0.5468085, -0.1383143, -0.4351361, 0, 0, 1, 1, 1,
-0.5446299, 0.7469043, -1.566808, 1, 0, 0, 1, 1,
-0.5373164, 0.7231948, -0.5293851, 1, 0, 0, 1, 1,
-0.537073, -0.4618272, -0.9171592, 1, 0, 0, 1, 1,
-0.5370245, 1.204808, -0.4980281, 1, 0, 0, 1, 1,
-0.5343589, 0.3149201, -1.016947, 1, 0, 0, 1, 1,
-0.5233048, -1.13761, -1.799548, 0, 0, 0, 1, 1,
-0.5230562, -0.2791913, -2.981656, 0, 0, 0, 1, 1,
-0.518585, 1.200526, -1.380568, 0, 0, 0, 1, 1,
-0.5137701, -1.379834, -3.682291, 0, 0, 0, 1, 1,
-0.5092284, 0.4996519, -1.79208, 0, 0, 0, 1, 1,
-0.5090252, -1.287343, -2.820301, 0, 0, 0, 1, 1,
-0.5022919, -1.304718, -3.276867, 0, 0, 0, 1, 1,
-0.5021745, 0.347711, -1.391367, 1, 1, 1, 1, 1,
-0.5020355, 0.9028947, -0.3847903, 1, 1, 1, 1, 1,
-0.501398, 0.007871346, -1.755017, 1, 1, 1, 1, 1,
-0.4987167, -0.6329047, -2.517918, 1, 1, 1, 1, 1,
-0.4950231, -0.397886, -1.599911, 1, 1, 1, 1, 1,
-0.4935032, -0.5432919, -3.671555, 1, 1, 1, 1, 1,
-0.4912827, 0.1993755, -0.8308105, 1, 1, 1, 1, 1,
-0.4832827, 0.08048008, -2.363397, 1, 1, 1, 1, 1,
-0.4793338, 1.285142, -1.960041, 1, 1, 1, 1, 1,
-0.4738867, -1.710237, -3.62703, 1, 1, 1, 1, 1,
-0.4730537, -1.646304, -1.820671, 1, 1, 1, 1, 1,
-0.4694179, -0.9723603, -1.913257, 1, 1, 1, 1, 1,
-0.4693802, 0.2224959, -0.6915542, 1, 1, 1, 1, 1,
-0.4655581, -0.3485659, -1.797871, 1, 1, 1, 1, 1,
-0.4620399, -0.2900518, -2.600806, 1, 1, 1, 1, 1,
-0.4511864, -0.3971992, -2.190885, 0, 0, 1, 1, 1,
-0.4499378, -0.6199685, -4.339294, 1, 0, 0, 1, 1,
-0.4478186, -0.1520275, -1.832141, 1, 0, 0, 1, 1,
-0.4400912, 0.4444927, -0.2905587, 1, 0, 0, 1, 1,
-0.438092, -0.06697165, -1.198512, 1, 0, 0, 1, 1,
-0.4373153, -0.3165354, -2.570197, 1, 0, 0, 1, 1,
-0.4357907, 1.866086, 0.7659544, 0, 0, 0, 1, 1,
-0.4350179, -0.8850702, -1.688819, 0, 0, 0, 1, 1,
-0.4347825, 0.7896193, 0.431906, 0, 0, 0, 1, 1,
-0.4339381, -0.3019426, -2.649427, 0, 0, 0, 1, 1,
-0.4311462, 0.3770214, -2.313179, 0, 0, 0, 1, 1,
-0.4259635, 1.758575, -0.5292163, 0, 0, 0, 1, 1,
-0.4253194, 0.4027422, -1.674956, 0, 0, 0, 1, 1,
-0.4213206, -1.698819, -2.632231, 1, 1, 1, 1, 1,
-0.4161934, 0.8989202, -2.52932, 1, 1, 1, 1, 1,
-0.4143546, 1.968965, -0.3276216, 1, 1, 1, 1, 1,
-0.411785, 0.2815633, -1.813346, 1, 1, 1, 1, 1,
-0.4115513, -1.053419, -2.840591, 1, 1, 1, 1, 1,
-0.4115393, -0.5666695, -3.747616, 1, 1, 1, 1, 1,
-0.4104515, -0.3474412, -4.084811, 1, 1, 1, 1, 1,
-0.4074331, -0.5536719, -3.70642, 1, 1, 1, 1, 1,
-0.4069204, -1.262443, -2.440531, 1, 1, 1, 1, 1,
-0.4059571, 1.358696, 1.562886, 1, 1, 1, 1, 1,
-0.4059538, -0.5230832, -2.15241, 1, 1, 1, 1, 1,
-0.4039235, -1.671433, -3.746671, 1, 1, 1, 1, 1,
-0.4011061, 0.5681835, -1.306968, 1, 1, 1, 1, 1,
-0.4009743, -0.2946736, -2.268663, 1, 1, 1, 1, 1,
-0.3986495, -1.059487, -3.893727, 1, 1, 1, 1, 1,
-0.3977293, -1.865165, -3.496984, 0, 0, 1, 1, 1,
-0.3975607, 0.3997145, 0.8259168, 1, 0, 0, 1, 1,
-0.3909639, 0.3102541, -1.467592, 1, 0, 0, 1, 1,
-0.3906574, 0.2116548, -0.3808366, 1, 0, 0, 1, 1,
-0.3875926, 0.2538799, -1.547674, 1, 0, 0, 1, 1,
-0.3815171, 1.908436, -0.0183952, 1, 0, 0, 1, 1,
-0.3780353, -0.3409878, -1.005861, 0, 0, 0, 1, 1,
-0.377763, -0.1223292, -3.016921, 0, 0, 0, 1, 1,
-0.3742534, 1.207359, 0.368762, 0, 0, 0, 1, 1,
-0.3735227, 1.60007, 1.524115, 0, 0, 0, 1, 1,
-0.3658006, -0.450022, -2.926635, 0, 0, 0, 1, 1,
-0.3628882, 0.5860741, -0.8866193, 0, 0, 0, 1, 1,
-0.3616323, 1.861951, 0.5828341, 0, 0, 0, 1, 1,
-0.3600903, 1.318599, 1.797099, 1, 1, 1, 1, 1,
-0.3577346, 0.1110239, -3.358773, 1, 1, 1, 1, 1,
-0.3516198, 1.212208, 1.305106, 1, 1, 1, 1, 1,
-0.3502632, 0.6777282, -0.1271187, 1, 1, 1, 1, 1,
-0.3498628, 0.2596747, -1.254294, 1, 1, 1, 1, 1,
-0.3484877, -0.6251149, -3.67737, 1, 1, 1, 1, 1,
-0.3479138, -0.7289859, -4.457793, 1, 1, 1, 1, 1,
-0.344662, -0.8059037, -3.797487, 1, 1, 1, 1, 1,
-0.3423168, 1.957678, -1.296202, 1, 1, 1, 1, 1,
-0.3418748, 0.4489275, -2.172343, 1, 1, 1, 1, 1,
-0.3332695, -0.0361918, -1.52755, 1, 1, 1, 1, 1,
-0.3309881, 0.9789373, -0.8232516, 1, 1, 1, 1, 1,
-0.3285509, 1.596597, -0.5044764, 1, 1, 1, 1, 1,
-0.3277171, -0.2188677, -0.9833928, 1, 1, 1, 1, 1,
-0.3266039, 1.083574, 0.6565182, 1, 1, 1, 1, 1,
-0.3194872, 1.800778, -0.5916303, 0, 0, 1, 1, 1,
-0.3115051, -1.13284, -1.951506, 1, 0, 0, 1, 1,
-0.3109371, -0.3304364, -1.106825, 1, 0, 0, 1, 1,
-0.303488, -0.3394374, -2.61972, 1, 0, 0, 1, 1,
-0.3030615, -0.248739, -1.560937, 1, 0, 0, 1, 1,
-0.2996758, 2.210642, -1.506862, 1, 0, 0, 1, 1,
-0.2953848, -1.574722, -3.362914, 0, 0, 0, 1, 1,
-0.2952757, 0.7443438, -0.7438794, 0, 0, 0, 1, 1,
-0.2940606, -0.1762183, -3.436176, 0, 0, 0, 1, 1,
-0.2909215, 1.392425, -1.016235, 0, 0, 0, 1, 1,
-0.2876067, -1.00348, -1.715303, 0, 0, 0, 1, 1,
-0.284277, 0.1045425, -0.376096, 0, 0, 0, 1, 1,
-0.2812683, 0.8974495, 0.03082759, 0, 0, 0, 1, 1,
-0.2805831, -1.199069, -1.321474, 1, 1, 1, 1, 1,
-0.2781316, -2.852419, -3.93008, 1, 1, 1, 1, 1,
-0.2756557, 1.657977, -0.08736911, 1, 1, 1, 1, 1,
-0.2747748, 0.8108559, -0.2597333, 1, 1, 1, 1, 1,
-0.2738435, -0.3743827, -0.6093484, 1, 1, 1, 1, 1,
-0.2733611, -0.9309967, -2.565615, 1, 1, 1, 1, 1,
-0.272679, -1.023809, -2.725585, 1, 1, 1, 1, 1,
-0.2716095, -0.3041507, -1.652543, 1, 1, 1, 1, 1,
-0.2700979, 0.8333781, -0.3654145, 1, 1, 1, 1, 1,
-0.2700172, -0.7275267, -2.368933, 1, 1, 1, 1, 1,
-0.2663708, 0.6301624, -0.825726, 1, 1, 1, 1, 1,
-0.2643255, -0.1113736, -1.386928, 1, 1, 1, 1, 1,
-0.2624626, 0.4037123, -0.1818601, 1, 1, 1, 1, 1,
-0.2507012, 0.5510138, -1.119015, 1, 1, 1, 1, 1,
-0.2494157, -0.2787529, -4.08309, 1, 1, 1, 1, 1,
-0.2475289, 0.7129771, 0.4164718, 0, 0, 1, 1, 1,
-0.2459803, 1.604204, 3.362173, 1, 0, 0, 1, 1,
-0.2448174, -0.2076774, -1.752019, 1, 0, 0, 1, 1,
-0.2436744, 0.0298933, -1.65164, 1, 0, 0, 1, 1,
-0.2433621, -0.3744962, -2.320232, 1, 0, 0, 1, 1,
-0.2361913, 2.121561, 0.01660097, 1, 0, 0, 1, 1,
-0.2336186, -1.519551, -3.572891, 0, 0, 0, 1, 1,
-0.2321965, -0.1426553, -2.822004, 0, 0, 0, 1, 1,
-0.2290899, -1.09647, -4.165253, 0, 0, 0, 1, 1,
-0.2272878, 0.4261194, -2.435144, 0, 0, 0, 1, 1,
-0.2267089, -0.2312642, -2.018883, 0, 0, 0, 1, 1,
-0.2249808, 0.5645316, -1.631049, 0, 0, 0, 1, 1,
-0.2122476, 0.8163497, 0.4699737, 0, 0, 0, 1, 1,
-0.2087705, -0.754699, -1.99285, 1, 1, 1, 1, 1,
-0.2076209, 1.898178, 0.02052218, 1, 1, 1, 1, 1,
-0.2067683, 0.1317849, 0.3651837, 1, 1, 1, 1, 1,
-0.2065228, 0.08327914, -0.3627795, 1, 1, 1, 1, 1,
-0.2053833, -1.716488, -2.932696, 1, 1, 1, 1, 1,
-0.2041628, 0.4696348, 0.2853479, 1, 1, 1, 1, 1,
-0.2017238, 1.288451, 1.621945, 1, 1, 1, 1, 1,
-0.2012551, 0.9757876, 0.7579409, 1, 1, 1, 1, 1,
-0.1999898, -0.3039204, -2.787064, 1, 1, 1, 1, 1,
-0.1989819, -1.547403, -3.625367, 1, 1, 1, 1, 1,
-0.188204, 0.2479954, -0.3989403, 1, 1, 1, 1, 1,
-0.183934, 1.540293, -0.8912598, 1, 1, 1, 1, 1,
-0.1809969, 0.02027977, -1.632665, 1, 1, 1, 1, 1,
-0.1793075, 0.01118625, -0.5011926, 1, 1, 1, 1, 1,
-0.1791467, 0.3088166, -1.182762, 1, 1, 1, 1, 1,
-0.1780135, 0.6073997, 0.2427428, 0, 0, 1, 1, 1,
-0.176374, -1.001584, -2.11259, 1, 0, 0, 1, 1,
-0.1715674, 1.663, -0.3005132, 1, 0, 0, 1, 1,
-0.1705847, -0.3506104, -3.6293, 1, 0, 0, 1, 1,
-0.1672036, -2.37572, -1.791717, 1, 0, 0, 1, 1,
-0.1613622, -0.6128619, -2.424817, 1, 0, 0, 1, 1,
-0.1597589, 1.315377, 1.224533, 0, 0, 0, 1, 1,
-0.1580472, 2.506754, -0.3494127, 0, 0, 0, 1, 1,
-0.153652, 0.314843, 0.8325251, 0, 0, 0, 1, 1,
-0.1511692, -0.729871, -3.040881, 0, 0, 0, 1, 1,
-0.1475561, -0.2116375, -2.89652, 0, 0, 0, 1, 1,
-0.1474331, 0.6224669, -1.214575, 0, 0, 0, 1, 1,
-0.1465463, 0.06559099, -1.649695, 0, 0, 0, 1, 1,
-0.1416541, -0.3069726, -4.009604, 1, 1, 1, 1, 1,
-0.140102, 0.7421579, -1.913249, 1, 1, 1, 1, 1,
-0.1390412, -0.2937053, -3.263016, 1, 1, 1, 1, 1,
-0.1378863, -0.08100864, -1.678572, 1, 1, 1, 1, 1,
-0.1339051, -0.5145073, -2.308407, 1, 1, 1, 1, 1,
-0.1296427, -2.148618, -2.332387, 1, 1, 1, 1, 1,
-0.1263577, 1.587783, -0.770558, 1, 1, 1, 1, 1,
-0.126316, -0.3084752, -2.565586, 1, 1, 1, 1, 1,
-0.1240429, 0.2499122, -0.3799716, 1, 1, 1, 1, 1,
-0.1230722, -0.7857274, -2.749401, 1, 1, 1, 1, 1,
-0.119373, -0.2004566, -2.130909, 1, 1, 1, 1, 1,
-0.1185667, 0.08577178, -0.7522235, 1, 1, 1, 1, 1,
-0.1144273, 0.9145622, 0.3079918, 1, 1, 1, 1, 1,
-0.1132465, 0.5595101, 0.6415635, 1, 1, 1, 1, 1,
-0.1131282, -0.395198, -2.144262, 1, 1, 1, 1, 1,
-0.1102694, 2.506139, -0.1121975, 0, 0, 1, 1, 1,
-0.1096872, -1.872173, -2.462683, 1, 0, 0, 1, 1,
-0.1094049, 1.410807, 0.3999457, 1, 0, 0, 1, 1,
-0.108694, 2.332185, -0.1515959, 1, 0, 0, 1, 1,
-0.106889, 0.4432505, -0.1572355, 1, 0, 0, 1, 1,
-0.1040387, 0.2991134, -1.547405, 1, 0, 0, 1, 1,
-0.1012379, -0.07552363, -1.338893, 0, 0, 0, 1, 1,
-0.0984493, 0.06452202, -0.4154581, 0, 0, 0, 1, 1,
-0.09806985, -0.1523652, -1.997678, 0, 0, 0, 1, 1,
-0.09730121, 0.04171653, -0.970719, 0, 0, 0, 1, 1,
-0.09725653, 1.097409, -0.8148506, 0, 0, 0, 1, 1,
-0.09300963, -0.7539865, -2.576038, 0, 0, 0, 1, 1,
-0.09267266, 0.3000727, 0.7609704, 0, 0, 0, 1, 1,
-0.09250944, 2.5662, 0.2164775, 1, 1, 1, 1, 1,
-0.09006103, 0.07053652, 0.03882619, 1, 1, 1, 1, 1,
-0.08789772, -0.1190668, -3.530023, 1, 1, 1, 1, 1,
-0.08740044, -1.625561, -4.696588, 1, 1, 1, 1, 1,
-0.08660649, 3.079454, 1.048981, 1, 1, 1, 1, 1,
-0.08268429, 0.3130246, -0.6028211, 1, 1, 1, 1, 1,
-0.07679284, -1.181268, -3.156735, 1, 1, 1, 1, 1,
-0.07670893, -0.8759115, -2.398909, 1, 1, 1, 1, 1,
-0.07664438, 0.5532983, -0.4396268, 1, 1, 1, 1, 1,
-0.07502762, 0.9026664, -1.264988, 1, 1, 1, 1, 1,
-0.07331385, 0.7646351, -0.298636, 1, 1, 1, 1, 1,
-0.06671129, -0.6578501, -4.547439, 1, 1, 1, 1, 1,
-0.06270587, -0.9227733, -4.420722, 1, 1, 1, 1, 1,
-0.06032933, -0.5693611, -3.516207, 1, 1, 1, 1, 1,
-0.05563965, -1.282714, -3.098251, 1, 1, 1, 1, 1,
-0.05327403, -0.09351106, -1.523341, 0, 0, 1, 1, 1,
-0.05074983, 1.200994, 0.3823742, 1, 0, 0, 1, 1,
-0.04989405, -0.509545, -1.680117, 1, 0, 0, 1, 1,
-0.04081858, -0.2791529, -3.891803, 1, 0, 0, 1, 1,
-0.03712347, -0.2406841, -1.832749, 1, 0, 0, 1, 1,
-0.03339441, 0.4696351, -1.593767, 1, 0, 0, 1, 1,
-0.03033837, -3.463111, -4.428759, 0, 0, 0, 1, 1,
-0.02743171, 0.2332706, -0.5615898, 0, 0, 0, 1, 1,
-0.02611032, -0.04749182, -2.530089, 0, 0, 0, 1, 1,
-0.02344186, -2.517104, -0.9255645, 0, 0, 0, 1, 1,
-0.02075496, -0.1533893, -1.324013, 0, 0, 0, 1, 1,
-0.01757465, -0.5324783, -4.844948, 0, 0, 0, 1, 1,
-0.01511058, -0.5186573, -2.433177, 0, 0, 0, 1, 1,
-0.01435974, 0.8954986, 0.243771, 1, 1, 1, 1, 1,
-0.01180988, 0.6324221, -0.3890147, 1, 1, 1, 1, 1,
-0.006280591, 1.759759, -1.72968, 1, 1, 1, 1, 1,
-0.005934094, -0.4369674, -1.91589, 1, 1, 1, 1, 1,
-0.0002329057, -1.724847, -1.077467, 1, 1, 1, 1, 1,
0.003499978, -0.6027405, 5.084559, 1, 1, 1, 1, 1,
0.003949965, 0.5621594, 0.1458667, 1, 1, 1, 1, 1,
0.006671684, -0.2288424, 3.468958, 1, 1, 1, 1, 1,
0.007009249, -1.464915, 2.776674, 1, 1, 1, 1, 1,
0.008278051, 0.5460561, 0.5503535, 1, 1, 1, 1, 1,
0.01203439, -0.3997789, 2.859869, 1, 1, 1, 1, 1,
0.01957435, 2.489741, 0.9456012, 1, 1, 1, 1, 1,
0.02182629, 1.021881, -0.7189864, 1, 1, 1, 1, 1,
0.02438161, 0.4937404, 0.1371022, 1, 1, 1, 1, 1,
0.02530133, 0.288009, -0.4659223, 1, 1, 1, 1, 1,
0.04284611, -0.6463928, 3.525485, 0, 0, 1, 1, 1,
0.04642031, 1.5589, -0.5359878, 1, 0, 0, 1, 1,
0.04841802, 1.002919, -0.1673996, 1, 0, 0, 1, 1,
0.0513964, -0.8377615, 4.763202, 1, 0, 0, 1, 1,
0.05562683, -0.592149, 3.7305, 1, 0, 0, 1, 1,
0.05568562, 0.2471418, 1.363922, 1, 0, 0, 1, 1,
0.05760739, 0.6557572, 0.215386, 0, 0, 0, 1, 1,
0.0585634, 1.058802, 0.4366193, 0, 0, 0, 1, 1,
0.0610304, 0.1003234, 1.773124, 0, 0, 0, 1, 1,
0.06154394, -0.4869728, 3.008044, 0, 0, 0, 1, 1,
0.06778294, -0.3581929, 2.900423, 0, 0, 0, 1, 1,
0.06850103, 0.4112257, 0.7958364, 0, 0, 0, 1, 1,
0.07113084, 0.1861037, 1.83775, 0, 0, 0, 1, 1,
0.07487217, -0.8470877, 3.194064, 1, 1, 1, 1, 1,
0.07833413, 0.1137158, 0.4696852, 1, 1, 1, 1, 1,
0.08058097, 0.6559677, 0.983584, 1, 1, 1, 1, 1,
0.09215453, 0.7797235, -1.205066, 1, 1, 1, 1, 1,
0.09267101, 0.6573356, -0.8611635, 1, 1, 1, 1, 1,
0.09393319, 0.6817008, -0.9030211, 1, 1, 1, 1, 1,
0.09789072, -0.9427301, 1.538266, 1, 1, 1, 1, 1,
0.10173, -0.6995645, 3.599976, 1, 1, 1, 1, 1,
0.102668, -2.431727, 3.498254, 1, 1, 1, 1, 1,
0.1092904, -0.004934738, 0.3413948, 1, 1, 1, 1, 1,
0.1123969, 0.7315543, 1.389598, 1, 1, 1, 1, 1,
0.1165883, -0.1053636, 1.843455, 1, 1, 1, 1, 1,
0.1174191, -0.1879075, 1.218051, 1, 1, 1, 1, 1,
0.1180676, -1.790273, 3.550916, 1, 1, 1, 1, 1,
0.1191038, -0.5686105, 2.849488, 1, 1, 1, 1, 1,
0.1271176, -1.75944, -0.1466163, 0, 0, 1, 1, 1,
0.1276611, -0.3504108, 2.918944, 1, 0, 0, 1, 1,
0.1319991, 0.6152681, 1.117526, 1, 0, 0, 1, 1,
0.1324244, -1.165936, 4.101905, 1, 0, 0, 1, 1,
0.1330795, -0.6991993, 2.660834, 1, 0, 0, 1, 1,
0.1370311, -0.05132383, 3.508895, 1, 0, 0, 1, 1,
0.1447606, -0.1167785, 1.545771, 0, 0, 0, 1, 1,
0.1474462, 1.336433, 2.645054, 0, 0, 0, 1, 1,
0.1481953, -1.316825, 4.380507, 0, 0, 0, 1, 1,
0.1482469, -0.1496521, 1.526484, 0, 0, 0, 1, 1,
0.1492945, -0.2033665, 2.104778, 0, 0, 0, 1, 1,
0.150658, -0.6951548, 2.220053, 0, 0, 0, 1, 1,
0.151493, -0.182245, 2.512616, 0, 0, 0, 1, 1,
0.1517757, -1.775205, 3.178546, 1, 1, 1, 1, 1,
0.1556118, 0.9306054, -0.2843695, 1, 1, 1, 1, 1,
0.1582692, 1.526893, 0.1500064, 1, 1, 1, 1, 1,
0.161594, -1.060867, 3.43372, 1, 1, 1, 1, 1,
0.1623578, -0.621154, 2.508579, 1, 1, 1, 1, 1,
0.1669398, 0.3165437, 0.6020624, 1, 1, 1, 1, 1,
0.1673117, -1.284632, 3.350228, 1, 1, 1, 1, 1,
0.1673425, 0.4563684, 1.608051, 1, 1, 1, 1, 1,
0.1802991, 0.8562537, 0.9894856, 1, 1, 1, 1, 1,
0.1803367, -2.035247, 3.292095, 1, 1, 1, 1, 1,
0.1806569, 0.8639086, -1.312648, 1, 1, 1, 1, 1,
0.1807977, 0.4026045, 0.05942065, 1, 1, 1, 1, 1,
0.1825361, 0.2058575, 0.6581452, 1, 1, 1, 1, 1,
0.1829851, -3.095394, 3.599063, 1, 1, 1, 1, 1,
0.1834386, 0.5175695, 0.4832588, 1, 1, 1, 1, 1,
0.184732, 0.9664392, 1.051726, 0, 0, 1, 1, 1,
0.1982005, 1.946211, -0.902378, 1, 0, 0, 1, 1,
0.2000322, -0.50853, 3.145406, 1, 0, 0, 1, 1,
0.2032936, -0.2252886, 2.069305, 1, 0, 0, 1, 1,
0.2036835, -0.171812, 3.436663, 1, 0, 0, 1, 1,
0.2039782, -0.8380245, 3.217347, 1, 0, 0, 1, 1,
0.2041005, 0.5043384, 0.09575529, 0, 0, 0, 1, 1,
0.2071304, 0.7875088, -1.360544, 0, 0, 0, 1, 1,
0.2095369, 0.7263731, -0.7963411, 0, 0, 0, 1, 1,
0.2128669, 0.3617277, -0.4236062, 0, 0, 0, 1, 1,
0.2186522, 0.7610543, 0.497087, 0, 0, 0, 1, 1,
0.22571, -0.8608292, 2.876564, 0, 0, 0, 1, 1,
0.2262131, -1.95315, 1.17972, 0, 0, 0, 1, 1,
0.2315169, -0.8186532, 4.362628, 1, 1, 1, 1, 1,
0.2338465, -0.614293, 3.684854, 1, 1, 1, 1, 1,
0.2368127, 1.380455, 1.370672, 1, 1, 1, 1, 1,
0.2374443, -0.07819529, 2.338825, 1, 1, 1, 1, 1,
0.2388182, -0.8983563, 4.040267, 1, 1, 1, 1, 1,
0.2391233, -1.173822, 4.311719, 1, 1, 1, 1, 1,
0.2418583, 0.8932488, -0.542897, 1, 1, 1, 1, 1,
0.2430596, -0.5885823, 3.665489, 1, 1, 1, 1, 1,
0.246304, -0.172058, 0.6120249, 1, 1, 1, 1, 1,
0.2551328, 0.9259446, 0.9366697, 1, 1, 1, 1, 1,
0.2568024, 0.59145, -1.076904, 1, 1, 1, 1, 1,
0.2582653, -0.0482692, 2.505562, 1, 1, 1, 1, 1,
0.2592464, 0.3667945, 0.7424157, 1, 1, 1, 1, 1,
0.263502, 0.3592872, -0.8208723, 1, 1, 1, 1, 1,
0.2640376, 0.4379159, -0.06397991, 1, 1, 1, 1, 1,
0.2642753, -1.117319, 3.464783, 0, 0, 1, 1, 1,
0.2713998, -0.04051442, 3.006421, 1, 0, 0, 1, 1,
0.2716188, -0.2934694, 2.209211, 1, 0, 0, 1, 1,
0.2732615, 0.8180746, 0.8859823, 1, 0, 0, 1, 1,
0.2783115, 0.807102, 0.4231436, 1, 0, 0, 1, 1,
0.2794822, -0.4082424, 2.681828, 1, 0, 0, 1, 1,
0.2807232, -1.286237, 2.156775, 0, 0, 0, 1, 1,
0.289363, -1.361133, 3.000468, 0, 0, 0, 1, 1,
0.2938264, 0.4285698, 2.038281, 0, 0, 0, 1, 1,
0.2940905, -0.7598203, 2.864226, 0, 0, 0, 1, 1,
0.2965073, -1.755532, 2.234393, 0, 0, 0, 1, 1,
0.2996943, 1.21452, 0.6843669, 0, 0, 0, 1, 1,
0.3014018, 0.2772852, 0.131263, 0, 0, 0, 1, 1,
0.3021068, 0.2115431, 0.1577562, 1, 1, 1, 1, 1,
0.310279, -0.6766151, 3.209401, 1, 1, 1, 1, 1,
0.3131237, 1.121505, 0.1781055, 1, 1, 1, 1, 1,
0.3237762, -0.9238033, 1.370542, 1, 1, 1, 1, 1,
0.325126, -1.032462, 3.085854, 1, 1, 1, 1, 1,
0.3272485, -0.4032964, 2.542846, 1, 1, 1, 1, 1,
0.3309387, -0.9601277, 4.965724, 1, 1, 1, 1, 1,
0.3341539, -0.03437817, 0.5121567, 1, 1, 1, 1, 1,
0.3357566, -0.4078457, 1.359546, 1, 1, 1, 1, 1,
0.3387819, 1.016304, 1.041109, 1, 1, 1, 1, 1,
0.3411044, 0.6013899, -0.008958439, 1, 1, 1, 1, 1,
0.3418777, -0.326615, 3.46316, 1, 1, 1, 1, 1,
0.3462852, 0.5914568, -1.804954, 1, 1, 1, 1, 1,
0.3490064, -0.561538, 1.112723, 1, 1, 1, 1, 1,
0.3581713, 0.3110445, -0.03207138, 1, 1, 1, 1, 1,
0.3582716, -1.310963, 3.458734, 0, 0, 1, 1, 1,
0.359926, -1.665495, 1.660109, 1, 0, 0, 1, 1,
0.3611363, 0.612767, 0.7145723, 1, 0, 0, 1, 1,
0.3624872, 0.3993255, -0.8779887, 1, 0, 0, 1, 1,
0.3667593, 1.210444, 0.3026881, 1, 0, 0, 1, 1,
0.3683455, 0.4740197, 0.3524678, 1, 0, 0, 1, 1,
0.3731457, -0.09040507, 0.5674815, 0, 0, 0, 1, 1,
0.3748737, -0.1628716, 0.93349, 0, 0, 0, 1, 1,
0.3760282, -1.082966, 2.205849, 0, 0, 0, 1, 1,
0.3762021, -0.008539838, 2.169761, 0, 0, 0, 1, 1,
0.3797192, -1.815582, 2.650334, 0, 0, 0, 1, 1,
0.384924, 0.6038803, 1.026015, 0, 0, 0, 1, 1,
0.3865781, 0.07990469, 1.975424, 0, 0, 0, 1, 1,
0.3897293, -1.065595, 2.112151, 1, 1, 1, 1, 1,
0.3920748, 2.546563, 0.6668513, 1, 1, 1, 1, 1,
0.3971138, 1.012817, 0.846598, 1, 1, 1, 1, 1,
0.3978175, 1.683667, -1.07221, 1, 1, 1, 1, 1,
0.4006547, 0.9137317, -0.3185625, 1, 1, 1, 1, 1,
0.4024521, -0.4048415, 2.131282, 1, 1, 1, 1, 1,
0.4025765, 0.00161446, 2.965429, 1, 1, 1, 1, 1,
0.4089301, 1.173105, -0.2177535, 1, 1, 1, 1, 1,
0.4102807, -1.496371, 2.227392, 1, 1, 1, 1, 1,
0.4110822, 0.2024906, 1.739318, 1, 1, 1, 1, 1,
0.411558, -0.5543198, 1.856981, 1, 1, 1, 1, 1,
0.4156492, 2.018497, 0.2265215, 1, 1, 1, 1, 1,
0.415876, -0.5321172, 2.494021, 1, 1, 1, 1, 1,
0.4165081, 0.5490251, 0.08111, 1, 1, 1, 1, 1,
0.4189074, 0.2933766, 0.3919495, 1, 1, 1, 1, 1,
0.4192516, -0.9581823, 2.900732, 0, 0, 1, 1, 1,
0.4244636, -0.1386584, 2.525021, 1, 0, 0, 1, 1,
0.4279287, 0.02556594, 1.84583, 1, 0, 0, 1, 1,
0.4288041, 1.883363, 0.143033, 1, 0, 0, 1, 1,
0.4300022, 0.03113929, 2.36082, 1, 0, 0, 1, 1,
0.4332619, 0.01330916, 1.871894, 1, 0, 0, 1, 1,
0.4367829, 1.246643, 0.3178239, 0, 0, 0, 1, 1,
0.4427598, -0.6177936, 4.019043, 0, 0, 0, 1, 1,
0.4428603, -1.24449, 4.431307, 0, 0, 0, 1, 1,
0.4443487, 0.6803825, 0.2988259, 0, 0, 0, 1, 1,
0.4449719, -1.777523, 2.67656, 0, 0, 0, 1, 1,
0.450138, -1.23074, 1.142315, 0, 0, 0, 1, 1,
0.4544124, -0.7022347, 4.262464, 0, 0, 0, 1, 1,
0.4558074, -0.4888609, 2.507527, 1, 1, 1, 1, 1,
0.4591216, -1.069341, 3.595219, 1, 1, 1, 1, 1,
0.4610295, 0.2483119, 0.5678837, 1, 1, 1, 1, 1,
0.4634325, 0.1009678, 0.344236, 1, 1, 1, 1, 1,
0.4716251, 0.7179519, 0.749387, 1, 1, 1, 1, 1,
0.4735771, -0.3189892, 2.155428, 1, 1, 1, 1, 1,
0.4773013, 1.327607, 0.1591729, 1, 1, 1, 1, 1,
0.477585, -0.4190937, 2.044747, 1, 1, 1, 1, 1,
0.4776044, -1.33244, 3.804161, 1, 1, 1, 1, 1,
0.4786948, 0.1532691, 1.483295, 1, 1, 1, 1, 1,
0.4796777, -0.5176207, 1.663933, 1, 1, 1, 1, 1,
0.480897, 0.5919283, 0.7190747, 1, 1, 1, 1, 1,
0.4848592, 1.228908, -0.2527272, 1, 1, 1, 1, 1,
0.4861556, 1.142913, 0.15401, 1, 1, 1, 1, 1,
0.4901441, -1.875296, 2.456403, 1, 1, 1, 1, 1,
0.4954363, 0.4178917, 1.953312, 0, 0, 1, 1, 1,
0.5059117, 0.1816269, 3.163107, 1, 0, 0, 1, 1,
0.5065724, -0.7176591, 2.380578, 1, 0, 0, 1, 1,
0.5086578, -0.2571425, 1.441166, 1, 0, 0, 1, 1,
0.5101138, 0.2721224, 1.343093, 1, 0, 0, 1, 1,
0.510987, 0.7782515, 0.0389831, 1, 0, 0, 1, 1,
0.5142534, 0.1473945, 2.391941, 0, 0, 0, 1, 1,
0.516796, 1.235297, 1.003785, 0, 0, 0, 1, 1,
0.5225453, 0.6893623, -0.04099287, 0, 0, 0, 1, 1,
0.5232994, -0.9770286, 2.171494, 0, 0, 0, 1, 1,
0.527739, 0.2697215, 1.287444, 0, 0, 0, 1, 1,
0.5288416, -1.452812, 3.321624, 0, 0, 0, 1, 1,
0.5318896, -0.3217311, -0.5804496, 0, 0, 0, 1, 1,
0.5385438, 2.088212, -1.340194, 1, 1, 1, 1, 1,
0.5406553, 1.132323, 0.3965788, 1, 1, 1, 1, 1,
0.5475852, -0.1425443, 2.427208, 1, 1, 1, 1, 1,
0.5494612, 0.5744039, -1.46018, 1, 1, 1, 1, 1,
0.5504228, -0.4703668, 2.095294, 1, 1, 1, 1, 1,
0.5506196, 0.05598425, 3.703298, 1, 1, 1, 1, 1,
0.5521303, 0.6380317, 0.8036113, 1, 1, 1, 1, 1,
0.5526234, 0.3039194, 0.9945322, 1, 1, 1, 1, 1,
0.5532074, -0.4551589, 2.098753, 1, 1, 1, 1, 1,
0.5577001, 1.155635, -0.5438773, 1, 1, 1, 1, 1,
0.5593266, 0.2803406, 2.226274, 1, 1, 1, 1, 1,
0.5606897, 1.549666, 0.1575857, 1, 1, 1, 1, 1,
0.5626798, 0.5400741, 1.334014, 1, 1, 1, 1, 1,
0.5674216, -0.258309, 1.602785, 1, 1, 1, 1, 1,
0.5697017, -2.551113, 3.439775, 1, 1, 1, 1, 1,
0.5717559, 0.3400597, 0.9236578, 0, 0, 1, 1, 1,
0.5754538, -0.7229648, 2.586836, 1, 0, 0, 1, 1,
0.5764794, 1.427927, 1.756056, 1, 0, 0, 1, 1,
0.5771017, 0.4866492, 2.625942, 1, 0, 0, 1, 1,
0.5782895, 0.3189217, 1.489917, 1, 0, 0, 1, 1,
0.5793032, 0.8197496, 0.4198892, 1, 0, 0, 1, 1,
0.5798991, 0.6452221, 1.158102, 0, 0, 0, 1, 1,
0.5820384, -1.478629, 2.070672, 0, 0, 0, 1, 1,
0.5823594, -0.4849875, 2.311238, 0, 0, 0, 1, 1,
0.5853441, 0.7135128, -0.6262904, 0, 0, 0, 1, 1,
0.5900975, 0.8166509, 0.5471647, 0, 0, 0, 1, 1,
0.5911942, -0.09729875, 1.598215, 0, 0, 0, 1, 1,
0.5914676, -0.7730882, 1.655275, 0, 0, 0, 1, 1,
0.592837, -1.289821, 2.251789, 1, 1, 1, 1, 1,
0.5933405, 1.419308, -1.057098, 1, 1, 1, 1, 1,
0.5958737, 0.4933399, 0.263991, 1, 1, 1, 1, 1,
0.5992962, -0.03747077, 0.9677449, 1, 1, 1, 1, 1,
0.6032888, -0.04926227, 0.6778961, 1, 1, 1, 1, 1,
0.6038663, -0.8699577, 3.454342, 1, 1, 1, 1, 1,
0.6075385, 1.122215, -1.221596, 1, 1, 1, 1, 1,
0.6078559, -0.03034385, 2.148378, 1, 1, 1, 1, 1,
0.6095143, -0.1780195, 1.327214, 1, 1, 1, 1, 1,
0.6109641, -1.888836, 4.028981, 1, 1, 1, 1, 1,
0.6150433, 0.5522075, -0.4209664, 1, 1, 1, 1, 1,
0.6155618, 1.237003, -0.1668575, 1, 1, 1, 1, 1,
0.6175069, 1.096433, -0.2375212, 1, 1, 1, 1, 1,
0.6194615, -1.604159, 2.348812, 1, 1, 1, 1, 1,
0.6221116, 0.858945, 1.263027, 1, 1, 1, 1, 1,
0.6282056, 0.1277863, 2.199434, 0, 0, 1, 1, 1,
0.6294355, -0.1468219, -0.2060544, 1, 0, 0, 1, 1,
0.6360022, -1.436852, 2.796785, 1, 0, 0, 1, 1,
0.6360949, -0.02747582, 1.790126, 1, 0, 0, 1, 1,
0.6392674, 1.480555, 0.2576139, 1, 0, 0, 1, 1,
0.6436866, -0.7789726, 1.754515, 1, 0, 0, 1, 1,
0.6447372, 2.057267, 0.5342059, 0, 0, 0, 1, 1,
0.6454817, 0.3508304, 1.925538, 0, 0, 0, 1, 1,
0.6503996, -0.02214998, 0.06886569, 0, 0, 0, 1, 1,
0.6507087, 1.626425, 0.5524156, 0, 0, 0, 1, 1,
0.6558424, 0.0370469, 1.83886, 0, 0, 0, 1, 1,
0.6560793, -1.235968, 2.849329, 0, 0, 0, 1, 1,
0.6565337, -0.725623, 1.749275, 0, 0, 0, 1, 1,
0.6598299, -0.01311822, 1.674554, 1, 1, 1, 1, 1,
0.6600436, 0.6028822, -0.055783, 1, 1, 1, 1, 1,
0.6614009, -1.343518, 4.712184, 1, 1, 1, 1, 1,
0.6626948, 0.4541638, 0.9713985, 1, 1, 1, 1, 1,
0.6728805, -0.5452049, 2.908716, 1, 1, 1, 1, 1,
0.6750754, -1.777057, 4.048792, 1, 1, 1, 1, 1,
0.6795705, -0.3712484, 1.855321, 1, 1, 1, 1, 1,
0.6798763, 0.4921475, 0.194687, 1, 1, 1, 1, 1,
0.679995, 1.087195, 0.2294898, 1, 1, 1, 1, 1,
0.680602, -1.746479, 2.317639, 1, 1, 1, 1, 1,
0.6835451, 0.05139231, 2.265733, 1, 1, 1, 1, 1,
0.6963227, 0.0484133, 1.082878, 1, 1, 1, 1, 1,
0.7154329, -1.209047, 1.592946, 1, 1, 1, 1, 1,
0.7158182, 0.06007621, 1.288336, 1, 1, 1, 1, 1,
0.7186885, 0.0608292, 2.246006, 1, 1, 1, 1, 1,
0.7207967, 0.4802063, 0.904431, 0, 0, 1, 1, 1,
0.7277461, -0.4810471, 1.943362, 1, 0, 0, 1, 1,
0.74016, 0.5051003, 0.7822603, 1, 0, 0, 1, 1,
0.7431642, 1.10297, 0.9771854, 1, 0, 0, 1, 1,
0.7477924, 1.249247, -1.115824, 1, 0, 0, 1, 1,
0.7493141, -0.1635967, 4.052726, 1, 0, 0, 1, 1,
0.7512553, 1.135649, 1.204083, 0, 0, 0, 1, 1,
0.7615354, -1.214588, 2.521425, 0, 0, 0, 1, 1,
0.7655053, 0.1197149, -0.3308496, 0, 0, 0, 1, 1,
0.7721805, 0.8876358, -0.7275836, 0, 0, 0, 1, 1,
0.7735054, 2.223381, -1.765214, 0, 0, 0, 1, 1,
0.7825326, -0.1495893, 2.167712, 0, 0, 0, 1, 1,
0.7838801, -0.4307152, 3.433101, 0, 0, 0, 1, 1,
0.7842818, 0.4220538, 0.384946, 1, 1, 1, 1, 1,
0.7865872, 0.2072771, 3.195927, 1, 1, 1, 1, 1,
0.7918283, -0.4618273, 1.168146, 1, 1, 1, 1, 1,
0.7921329, 0.5190639, 1.835614, 1, 1, 1, 1, 1,
0.7939209, -0.5246485, 0.7055312, 1, 1, 1, 1, 1,
0.7940469, 1.605853, -0.3669384, 1, 1, 1, 1, 1,
0.7952159, -0.3902205, 1.713832, 1, 1, 1, 1, 1,
0.7959803, -1.811639, 3.184142, 1, 1, 1, 1, 1,
0.7979932, -1.887444, 1.469882, 1, 1, 1, 1, 1,
0.8003808, -1.485018, 2.077954, 1, 1, 1, 1, 1,
0.813144, -0.2537131, 0.7584078, 1, 1, 1, 1, 1,
0.8148946, -0.5315946, 0.6479145, 1, 1, 1, 1, 1,
0.8218476, -0.7467502, 1.57689, 1, 1, 1, 1, 1,
0.8330931, 0.9391043, -1.092912, 1, 1, 1, 1, 1,
0.8339091, 0.9196754, 2.232233, 1, 1, 1, 1, 1,
0.8370411, 1.112702, 0.7838062, 0, 0, 1, 1, 1,
0.841653, 1.7776, 0.8888954, 1, 0, 0, 1, 1,
0.8444985, 0.5839434, 1.915277, 1, 0, 0, 1, 1,
0.8575462, 0.1806042, 1.741333, 1, 0, 0, 1, 1,
0.8625927, -0.1846641, 2.334309, 1, 0, 0, 1, 1,
0.8643394, 0.2912356, 1.251474, 1, 0, 0, 1, 1,
0.8728447, 2.141457, -1.438903, 0, 0, 0, 1, 1,
0.8744648, -0.7716084, 1.663792, 0, 0, 0, 1, 1,
0.8759055, 0.5803238, 0.0442291, 0, 0, 0, 1, 1,
0.876734, -0.2672669, 2.848102, 0, 0, 0, 1, 1,
0.8793936, -0.5656486, 2.5805, 0, 0, 0, 1, 1,
0.8797599, -0.2427016, 3.435094, 0, 0, 0, 1, 1,
0.8827081, -0.9817808, 2.605476, 0, 0, 0, 1, 1,
0.8850269, -1.038271, -0.1024194, 1, 1, 1, 1, 1,
0.8866547, 0.6648491, 0.5133095, 1, 1, 1, 1, 1,
0.8877798, 0.003204499, -0.05833942, 1, 1, 1, 1, 1,
0.8899177, 0.610436, 0.9960259, 1, 1, 1, 1, 1,
0.8958109, 0.1353401, -0.02743246, 1, 1, 1, 1, 1,
0.8969476, 0.4422468, 0.9980197, 1, 1, 1, 1, 1,
0.8985044, -0.6907237, 2.224881, 1, 1, 1, 1, 1,
0.8992783, 0.175948, -0.2026172, 1, 1, 1, 1, 1,
0.9049091, 0.6923606, 1.761875, 1, 1, 1, 1, 1,
0.9072024, 1.538131, 0.3476601, 1, 1, 1, 1, 1,
0.9083905, -0.3995974, 2.818927, 1, 1, 1, 1, 1,
0.911235, -0.003876774, 3.023635, 1, 1, 1, 1, 1,
0.915738, -0.03895719, 0.829944, 1, 1, 1, 1, 1,
0.9158592, -0.5763721, 1.969541, 1, 1, 1, 1, 1,
0.918561, -1.35236, 2.163305, 1, 1, 1, 1, 1,
0.9215782, -0.5150889, 2.349841, 0, 0, 1, 1, 1,
0.9236633, -0.9366807, 1.957518, 1, 0, 0, 1, 1,
0.9240589, -1.579304, 4.127073, 1, 0, 0, 1, 1,
0.927238, -0.02446197, 1.964877, 1, 0, 0, 1, 1,
0.9443925, -0.6183751, 3.372643, 1, 0, 0, 1, 1,
0.9492734, -1.154913, 2.335836, 1, 0, 0, 1, 1,
0.9506373, 0.5801795, 0.504839, 0, 0, 0, 1, 1,
0.958331, -0.4229413, 2.198866, 0, 0, 0, 1, 1,
0.9669266, -0.6347895, 3.71664, 0, 0, 0, 1, 1,
0.9681453, 0.8290492, 1.111612, 0, 0, 0, 1, 1,
0.9701671, -0.6825756, 2.264876, 0, 0, 0, 1, 1,
0.9765785, 1.842878, -0.1526003, 0, 0, 0, 1, 1,
0.9985118, 0.1298354, 1.952869, 0, 0, 0, 1, 1,
1.00582, 1.225543, 1.453188, 1, 1, 1, 1, 1,
1.008349, 0.2247687, 1.584777, 1, 1, 1, 1, 1,
1.013448, -0.2460755, 2.58958, 1, 1, 1, 1, 1,
1.015393, 1.250395, -1.284967, 1, 1, 1, 1, 1,
1.028315, 0.1113971, 0.8027539, 1, 1, 1, 1, 1,
1.030742, -0.2752657, 1.507374, 1, 1, 1, 1, 1,
1.03175, -0.890167, 1.913746, 1, 1, 1, 1, 1,
1.0321, -0.7148646, 0.187608, 1, 1, 1, 1, 1,
1.033103, -0.3812392, 3.390487, 1, 1, 1, 1, 1,
1.035991, 0.435638, 2.131891, 1, 1, 1, 1, 1,
1.041774, -0.6119208, 1.177983, 1, 1, 1, 1, 1,
1.047519, 0.3970268, 2.801866, 1, 1, 1, 1, 1,
1.048486, 0.6718407, 2.075899, 1, 1, 1, 1, 1,
1.065235, 0.8774658, 2.363571, 1, 1, 1, 1, 1,
1.076685, 0.6441149, 1.107323, 1, 1, 1, 1, 1,
1.077288, -0.2825907, 2.337844, 0, 0, 1, 1, 1,
1.078762, 0.3561769, 0.6823229, 1, 0, 0, 1, 1,
1.081911, -0.8230426, 2.135846, 1, 0, 0, 1, 1,
1.086385, -0.3572358, 1.007831, 1, 0, 0, 1, 1,
1.086447, 1.413059, 1.480383, 1, 0, 0, 1, 1,
1.087292, -1.685091, 2.480966, 1, 0, 0, 1, 1,
1.088308, -0.478727, 3.321843, 0, 0, 0, 1, 1,
1.090908, 0.1706745, 2.939539, 0, 0, 0, 1, 1,
1.093512, -0.04674424, 3.128875, 0, 0, 0, 1, 1,
1.097804, 0.9123253, 0.8368424, 0, 0, 0, 1, 1,
1.099941, 1.360111, 2.069319, 0, 0, 0, 1, 1,
1.10544, -0.3486538, 2.604486, 0, 0, 0, 1, 1,
1.110578, -1.583856, 2.2557, 0, 0, 0, 1, 1,
1.131101, -0.004149351, 0.8148636, 1, 1, 1, 1, 1,
1.131297, 1.492293, -0.9695665, 1, 1, 1, 1, 1,
1.132072, -0.617226, 1.283444, 1, 1, 1, 1, 1,
1.13372, 0.4376965, 3.209981, 1, 1, 1, 1, 1,
1.13399, 1.354335, 1.835272, 1, 1, 1, 1, 1,
1.137872, 0.6822819, 1.224377, 1, 1, 1, 1, 1,
1.142906, 0.4571066, 3.381048, 1, 1, 1, 1, 1,
1.148219, -1.027673, 3.807335, 1, 1, 1, 1, 1,
1.152224, 0.5825374, 0.006691732, 1, 1, 1, 1, 1,
1.163033, -0.02421896, 1.287213, 1, 1, 1, 1, 1,
1.165917, -2.166762, 1.111121, 1, 1, 1, 1, 1,
1.168558, 0.08947601, -0.287571, 1, 1, 1, 1, 1,
1.169269, 2.438002, 1.193303, 1, 1, 1, 1, 1,
1.169635, -0.4530472, 0.862052, 1, 1, 1, 1, 1,
1.17189, 0.0755733, 0.9962217, 1, 1, 1, 1, 1,
1.173014, 0.6099865, 1.256602, 0, 0, 1, 1, 1,
1.173766, 1.238961, 1.628915, 1, 0, 0, 1, 1,
1.175684, 1.737908, 3.47156, 1, 0, 0, 1, 1,
1.18253, -0.1969352, 1.636207, 1, 0, 0, 1, 1,
1.184701, 0.4211875, 1.717225, 1, 0, 0, 1, 1,
1.18551, -0.8127536, 1.790495, 1, 0, 0, 1, 1,
1.200101, 0.1468905, 2.312534, 0, 0, 0, 1, 1,
1.2034, 0.3155342, 1.721559, 0, 0, 0, 1, 1,
1.204297, 0.8544574, -0.5592931, 0, 0, 0, 1, 1,
1.209186, 0.3392486, 0.725455, 0, 0, 0, 1, 1,
1.212427, -0.1530979, 3.953112, 0, 0, 0, 1, 1,
1.215554, -0.1261618, 0.1859044, 0, 0, 0, 1, 1,
1.215881, -0.7461014, 3.654538, 0, 0, 0, 1, 1,
1.21822, -0.794515, 2.027416, 1, 1, 1, 1, 1,
1.219182, -1.108066, 2.50541, 1, 1, 1, 1, 1,
1.229346, -0.008819711, 1.513732, 1, 1, 1, 1, 1,
1.243222, 0.3726234, 0.6375032, 1, 1, 1, 1, 1,
1.248511, 1.328191, 0.5676816, 1, 1, 1, 1, 1,
1.256385, -0.9959956, 3.172888, 1, 1, 1, 1, 1,
1.262059, 0.02480958, 1.817787, 1, 1, 1, 1, 1,
1.264812, -0.7396802, 3.361417, 1, 1, 1, 1, 1,
1.266297, 1.292034, 1.420171, 1, 1, 1, 1, 1,
1.281726, -0.8610309, 2.184423, 1, 1, 1, 1, 1,
1.29286, -0.5256436, 3.301857, 1, 1, 1, 1, 1,
1.29527, -0.2299711, 3.395139, 1, 1, 1, 1, 1,
1.301932, -1.703794, 3.673617, 1, 1, 1, 1, 1,
1.311087, 1.338158, 0.6811757, 1, 1, 1, 1, 1,
1.31329, 0.09448136, 2.042482, 1, 1, 1, 1, 1,
1.318085, 0.8403198, 1.774138, 0, 0, 1, 1, 1,
1.32201, 0.7317593, 2.46919, 1, 0, 0, 1, 1,
1.346261, -0.04050496, 1.113729, 1, 0, 0, 1, 1,
1.347394, 0.5304649, 1.864447, 1, 0, 0, 1, 1,
1.358989, 0.01052451, 0.4772527, 1, 0, 0, 1, 1,
1.367029, -0.8522538, 2.264562, 1, 0, 0, 1, 1,
1.369847, -0.5133599, 1.521218, 0, 0, 0, 1, 1,
1.372124, -2.552036, 1.578887, 0, 0, 0, 1, 1,
1.378257, -1.813933, 2.470224, 0, 0, 0, 1, 1,
1.37987, 0.2711145, 0.3659829, 0, 0, 0, 1, 1,
1.395889, -0.427106, 1.242295, 0, 0, 0, 1, 1,
1.400663, -1.182178, 3.835907, 0, 0, 0, 1, 1,
1.401524, 0.6266461, 0.9262118, 0, 0, 0, 1, 1,
1.41756, 0.07687151, 0.9649065, 1, 1, 1, 1, 1,
1.41761, -1.479671, 0.006769015, 1, 1, 1, 1, 1,
1.424557, -2.027685, 2.472069, 1, 1, 1, 1, 1,
1.435113, -0.1266652, 2.681643, 1, 1, 1, 1, 1,
1.435204, 0.8866015, 0.5061442, 1, 1, 1, 1, 1,
1.439519, 0.37132, 1.696671, 1, 1, 1, 1, 1,
1.441322, -1.573547, 2.378135, 1, 1, 1, 1, 1,
1.445001, 2.287396, 0.4089195, 1, 1, 1, 1, 1,
1.450332, 0.931201, 1.704388, 1, 1, 1, 1, 1,
1.454112, 0.2657687, 1.637481, 1, 1, 1, 1, 1,
1.459005, 0.8620049, -1.379771, 1, 1, 1, 1, 1,
1.464967, 0.7401274, 1.035475, 1, 1, 1, 1, 1,
1.468235, -0.07003559, 0.7698187, 1, 1, 1, 1, 1,
1.475825, 0.8002442, -0.2016031, 1, 1, 1, 1, 1,
1.479553, 0.02562636, 1.423703, 1, 1, 1, 1, 1,
1.481332, 0.5015619, 2.625572, 0, 0, 1, 1, 1,
1.495764, -0.3668178, 1.056089, 1, 0, 0, 1, 1,
1.508235, 1.173785, 0.7717899, 1, 0, 0, 1, 1,
1.510772, -0.02094554, 1.406544, 1, 0, 0, 1, 1,
1.513568, -2.543576, 2.83905, 1, 0, 0, 1, 1,
1.513612, -1.471581, 3.690816, 1, 0, 0, 1, 1,
1.517488, -0.4916114, 2.811076, 0, 0, 0, 1, 1,
1.517914, -0.2223361, 5.241667, 0, 0, 0, 1, 1,
1.519846, -0.7570926, 1.022931, 0, 0, 0, 1, 1,
1.535403, 2.240116, 0.2667122, 0, 0, 0, 1, 1,
1.53585, -0.5142411, 1.687932, 0, 0, 0, 1, 1,
1.54098, 0.5060475, 1.784281, 0, 0, 0, 1, 1,
1.549311, 0.3726754, 1.281918, 0, 0, 0, 1, 1,
1.567209, -0.9215627, 0.9206997, 1, 1, 1, 1, 1,
1.571515, -0.2507407, 0.9978838, 1, 1, 1, 1, 1,
1.582187, -0.08830015, 2.309347, 1, 1, 1, 1, 1,
1.583576, 0.5047666, 3.384136, 1, 1, 1, 1, 1,
1.591682, 0.4061757, 0.9048722, 1, 1, 1, 1, 1,
1.598601, 0.2007829, 1.323, 1, 1, 1, 1, 1,
1.601085, 0.6810022, 1.348872, 1, 1, 1, 1, 1,
1.60501, 0.4776791, -0.781431, 1, 1, 1, 1, 1,
1.609321, 0.04405198, 0.5832888, 1, 1, 1, 1, 1,
1.625564, 0.3348157, 0.6891753, 1, 1, 1, 1, 1,
1.629239, -0.3690396, 3.042871, 1, 1, 1, 1, 1,
1.662118, -0.3682259, 2.158438, 1, 1, 1, 1, 1,
1.67476, 1.135717, 0.8058878, 1, 1, 1, 1, 1,
1.679552, -0.9946856, 2.921978, 1, 1, 1, 1, 1,
1.686275, -1.370367, 4.044535, 1, 1, 1, 1, 1,
1.689218, -0.5989329, 2.569621, 0, 0, 1, 1, 1,
1.697174, -0.3117498, 0.4221485, 1, 0, 0, 1, 1,
1.701965, -0.2982688, 0.3802029, 1, 0, 0, 1, 1,
1.702627, 0.3887741, 1.184001, 1, 0, 0, 1, 1,
1.710766, -0.8752979, 2.015122, 1, 0, 0, 1, 1,
1.714528, 0.652293, 0.2519907, 1, 0, 0, 1, 1,
1.717701, -0.6310423, 3.638366, 0, 0, 0, 1, 1,
1.717751, 0.4844845, 1.573942, 0, 0, 0, 1, 1,
1.719295, 0.9868774, 0.7437338, 0, 0, 0, 1, 1,
1.728618, -1.595551, 2.870495, 0, 0, 0, 1, 1,
1.73181, -0.3770754, 1.611464, 0, 0, 0, 1, 1,
1.735808, -1.296158, 1.624838, 0, 0, 0, 1, 1,
1.738875, 0.04461065, 0.1170044, 0, 0, 0, 1, 1,
1.754847, -0.8488421, 3.950132, 1, 1, 1, 1, 1,
1.757428, -1.022769, 0.3731249, 1, 1, 1, 1, 1,
1.7674, 0.4137869, 2.801851, 1, 1, 1, 1, 1,
1.86495, -0.68723, 1.119297, 1, 1, 1, 1, 1,
1.867173, -2.221095, 1.934232, 1, 1, 1, 1, 1,
1.867563, -0.3863344, 1.25751, 1, 1, 1, 1, 1,
1.870886, -1.24764, 1.232992, 1, 1, 1, 1, 1,
1.896856, -2.396536, 2.601484, 1, 1, 1, 1, 1,
1.899227, -0.4686763, 3.219225, 1, 1, 1, 1, 1,
1.94945, -1.261677, 0.689894, 1, 1, 1, 1, 1,
1.958154, 0.3078187, 1.703851, 1, 1, 1, 1, 1,
2.015471, 1.626945, -0.39544, 1, 1, 1, 1, 1,
2.016805, 0.141179, 2.869658, 1, 1, 1, 1, 1,
2.021747, 1.542557, 1.722032, 1, 1, 1, 1, 1,
2.149208, -0.01378385, 2.884997, 1, 1, 1, 1, 1,
2.179476, 0.8473412, 2.568775, 0, 0, 1, 1, 1,
2.190504, 1.832893, 1.192345, 1, 0, 0, 1, 1,
2.19062, -0.1555924, 2.868377, 1, 0, 0, 1, 1,
2.203293, -1.5768, 1.987774, 1, 0, 0, 1, 1,
2.20901, 0.1677625, 0.6548926, 1, 0, 0, 1, 1,
2.219157, 0.9884806, 3.17739, 1, 0, 0, 1, 1,
2.235976, 1.930849, -1.256431, 0, 0, 0, 1, 1,
2.244705, -0.9950237, 1.450636, 0, 0, 0, 1, 1,
2.333717, -0.1632521, 0.6550992, 0, 0, 0, 1, 1,
2.441681, 0.4139545, -0.7186596, 0, 0, 0, 1, 1,
2.574318, 0.6048917, -0.4381141, 0, 0, 0, 1, 1,
2.580149, 0.1791973, 3.541987, 0, 0, 0, 1, 1,
2.649215, -0.07699257, 2.943642, 0, 0, 0, 1, 1,
2.752997, 1.446096, 1.068849, 1, 1, 1, 1, 1,
2.783931, 2.392261, 0.2607567, 1, 1, 1, 1, 1,
2.81376, -0.08683639, 1.494327, 1, 1, 1, 1, 1,
2.876673, -1.216763, 1.442006, 1, 1, 1, 1, 1,
2.946577, 0.6322538, 1.89776, 1, 1, 1, 1, 1,
3.051511, 0.2793593, -0.07782426, 1, 1, 1, 1, 1,
3.144248, 0.5272499, 1.375231, 1, 1, 1, 1, 1
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
var radius = 9.230612;
var distance = 32.42213;
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
mvMatrix.translate( -0.1880798, 0.1918287, -0.1983595 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.42213);
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
