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
-3.470635, 0.9601693, -1.721377, 1, 0, 0, 1,
-3.287514, -0.2799845, -1.59242, 1, 0.007843138, 0, 1,
-2.594682, 0.04460074, -1.490797, 1, 0.01176471, 0, 1,
-2.493163, -2.153, -2.365787, 1, 0.01960784, 0, 1,
-2.468393, -0.06622071, 1.479671, 1, 0.02352941, 0, 1,
-2.425809, 0.5033753, -2.206594, 1, 0.03137255, 0, 1,
-2.345244, -0.9707174, -1.204005, 1, 0.03529412, 0, 1,
-2.28263, -1.035724, -3.607162, 1, 0.04313726, 0, 1,
-2.282087, -0.8230165, -1.389586, 1, 0.04705882, 0, 1,
-2.266579, 2.737605, -1.410521, 1, 0.05490196, 0, 1,
-2.254375, 0.7300898, -1.776515, 1, 0.05882353, 0, 1,
-2.219639, 0.02254085, -0.9795454, 1, 0.06666667, 0, 1,
-2.205156, 0.3092134, -1.940219, 1, 0.07058824, 0, 1,
-2.183252, -0.520896, -0.6132582, 1, 0.07843138, 0, 1,
-2.181046, 0.2556317, -3.135889, 1, 0.08235294, 0, 1,
-2.173938, -0.3769708, -0.9272789, 1, 0.09019608, 0, 1,
-2.159867, -0.05539665, -0.6440419, 1, 0.09411765, 0, 1,
-2.158607, 1.809938, -1.894958, 1, 0.1019608, 0, 1,
-2.132619, 0.2042643, -0.9645433, 1, 0.1098039, 0, 1,
-2.111139, -0.3791149, -0.6767803, 1, 0.1137255, 0, 1,
-2.09857, -1.238788, -1.691015, 1, 0.1215686, 0, 1,
-2.082427, -0.2025999, -2.380811, 1, 0.1254902, 0, 1,
-2.060663, 0.4364105, -1.045923, 1, 0.1333333, 0, 1,
-2.053299, -0.6678622, -1.062175, 1, 0.1372549, 0, 1,
-2.045263, -0.7058222, -2.189162, 1, 0.145098, 0, 1,
-2.043036, 1.019166, -0.6777142, 1, 0.1490196, 0, 1,
-2.019791, 1.545665, 0.619987, 1, 0.1568628, 0, 1,
-1.995432, 0.3781937, -2.121453, 1, 0.1607843, 0, 1,
-1.989871, 1.416234, -2.667764, 1, 0.1686275, 0, 1,
-1.959278, -1.028789, -1.819442, 1, 0.172549, 0, 1,
-1.926727, 0.304518, -2.957138, 1, 0.1803922, 0, 1,
-1.90316, -0.5565073, -2.002859, 1, 0.1843137, 0, 1,
-1.901606, -0.5472794, -0.4011525, 1, 0.1921569, 0, 1,
-1.882674, -1.128472, -2.0226, 1, 0.1960784, 0, 1,
-1.878383, -0.3190541, -2.421809, 1, 0.2039216, 0, 1,
-1.817746, -0.5657809, -3.786438, 1, 0.2117647, 0, 1,
-1.797992, -0.6356829, -0.9194826, 1, 0.2156863, 0, 1,
-1.782867, -0.2490516, -0.9409027, 1, 0.2235294, 0, 1,
-1.782673, 1.238237, -1.222552, 1, 0.227451, 0, 1,
-1.775654, -0.5472135, -1.730599, 1, 0.2352941, 0, 1,
-1.753189, 0.3378759, -1.493679, 1, 0.2392157, 0, 1,
-1.749782, -0.9133254, -0.7069459, 1, 0.2470588, 0, 1,
-1.74724, -0.774062, -2.746888, 1, 0.2509804, 0, 1,
-1.743617, 0.7824226, -1.000944, 1, 0.2588235, 0, 1,
-1.729056, 1.177154, -1.151183, 1, 0.2627451, 0, 1,
-1.725837, -0.05041777, -0.4724613, 1, 0.2705882, 0, 1,
-1.701375, 1.247772, 1.09269, 1, 0.2745098, 0, 1,
-1.697865, -0.5876522, -3.343339, 1, 0.282353, 0, 1,
-1.685111, 0.2259114, -2.147615, 1, 0.2862745, 0, 1,
-1.682394, 1.099673, -0.5074931, 1, 0.2941177, 0, 1,
-1.675499, 0.2339276, -0.2485705, 1, 0.3019608, 0, 1,
-1.660265, -0.754307, -2.880764, 1, 0.3058824, 0, 1,
-1.659528, 0.5517213, 0.3834119, 1, 0.3137255, 0, 1,
-1.657718, 0.3547537, -2.092228, 1, 0.3176471, 0, 1,
-1.608853, -0.8825247, -1.612298, 1, 0.3254902, 0, 1,
-1.60254, 0.994923, -2.107292, 1, 0.3294118, 0, 1,
-1.585704, 0.3248372, -1.537444, 1, 0.3372549, 0, 1,
-1.583452, -1.865512, -1.391029, 1, 0.3411765, 0, 1,
-1.571856, -0.5961592, -2.275741, 1, 0.3490196, 0, 1,
-1.566489, 1.259219, -0.6683837, 1, 0.3529412, 0, 1,
-1.533082, 1.177062, -0.5396905, 1, 0.3607843, 0, 1,
-1.528476, -1.262934, -3.005323, 1, 0.3647059, 0, 1,
-1.521405, -2.433053, -2.258384, 1, 0.372549, 0, 1,
-1.509258, -0.9509643, -2.689862, 1, 0.3764706, 0, 1,
-1.497224, -0.9177122, -3.709191, 1, 0.3843137, 0, 1,
-1.494189, -0.3421853, -1.779013, 1, 0.3882353, 0, 1,
-1.483963, 1.307466, -1.319114, 1, 0.3960784, 0, 1,
-1.464576, -1.250695, -0.9807547, 1, 0.4039216, 0, 1,
-1.45076, -0.3923212, -0.3015712, 1, 0.4078431, 0, 1,
-1.440225, -0.2781972, -2.705691, 1, 0.4156863, 0, 1,
-1.430108, 0.7701876, -0.105245, 1, 0.4196078, 0, 1,
-1.412097, 1.213987, -1.581412, 1, 0.427451, 0, 1,
-1.411685, -0.2338073, -2.477382, 1, 0.4313726, 0, 1,
-1.411036, -1.200331, -2.455401, 1, 0.4392157, 0, 1,
-1.40782, -2.130398, -3.837212, 1, 0.4431373, 0, 1,
-1.404834, -1.261493, -1.219829, 1, 0.4509804, 0, 1,
-1.398153, 1.36232, 1.270441, 1, 0.454902, 0, 1,
-1.37897, 0.4419302, -1.553693, 1, 0.4627451, 0, 1,
-1.370498, 2.240525, -1.530561, 1, 0.4666667, 0, 1,
-1.363168, -1.02206, -1.276615, 1, 0.4745098, 0, 1,
-1.354714, -0.3766523, -0.0914613, 1, 0.4784314, 0, 1,
-1.351011, 0.771028, -1.467381, 1, 0.4862745, 0, 1,
-1.35068, -0.6104323, -1.554174, 1, 0.4901961, 0, 1,
-1.347059, 0.931449, -0.9921907, 1, 0.4980392, 0, 1,
-1.344244, -0.6163555, -2.31942, 1, 0.5058824, 0, 1,
-1.320104, 0.7256351, 0.09866331, 1, 0.509804, 0, 1,
-1.318641, 0.06270714, -2.583293, 1, 0.5176471, 0, 1,
-1.313353, -1.431, -1.850066, 1, 0.5215687, 0, 1,
-1.310316, 0.9300017, -2.260346, 1, 0.5294118, 0, 1,
-1.293056, -0.7503158, -1.547401, 1, 0.5333334, 0, 1,
-1.281222, 0.8042849, 0.4891866, 1, 0.5411765, 0, 1,
-1.27586, -0.4585785, -2.202723, 1, 0.5450981, 0, 1,
-1.275365, -0.7686464, -1.596077, 1, 0.5529412, 0, 1,
-1.27012, -0.0516492, -0.6173519, 1, 0.5568628, 0, 1,
-1.266562, 0.2676669, -2.178796, 1, 0.5647059, 0, 1,
-1.256018, -1.212003, -2.926505, 1, 0.5686275, 0, 1,
-1.250437, 1.359606, -0.7596337, 1, 0.5764706, 0, 1,
-1.24838, -0.3097864, -1.423777, 1, 0.5803922, 0, 1,
-1.245258, -2.658016, -2.142917, 1, 0.5882353, 0, 1,
-1.241448, 0.4681822, -1.56964, 1, 0.5921569, 0, 1,
-1.227495, -1.646887, -2.003607, 1, 0.6, 0, 1,
-1.226148, 0.5717271, -1.249317, 1, 0.6078432, 0, 1,
-1.225028, -1.027048, -3.133355, 1, 0.6117647, 0, 1,
-1.221254, 0.3956597, -0.5239249, 1, 0.6196079, 0, 1,
-1.219475, 0.8474295, -2.349291, 1, 0.6235294, 0, 1,
-1.218325, -0.8148258, -4.582036, 1, 0.6313726, 0, 1,
-1.214704, 1.422421, -0.1579624, 1, 0.6352941, 0, 1,
-1.212423, 0.8223423, 0.4175306, 1, 0.6431373, 0, 1,
-1.208797, -0.007724202, -2.216465, 1, 0.6470588, 0, 1,
-1.204541, 0.2933353, -0.7317116, 1, 0.654902, 0, 1,
-1.198977, 0.7610887, -0.01168182, 1, 0.6588235, 0, 1,
-1.197619, -0.2829144, -1.686183, 1, 0.6666667, 0, 1,
-1.19733, 0.3121813, -0.87571, 1, 0.6705883, 0, 1,
-1.196198, -0.9444982, -2.240415, 1, 0.6784314, 0, 1,
-1.195402, -2.009474, -2.923819, 1, 0.682353, 0, 1,
-1.188909, 2.05304, -2.027057, 1, 0.6901961, 0, 1,
-1.188087, 0.5119594, -2.428778, 1, 0.6941177, 0, 1,
-1.187691, 0.2063336, -2.075191, 1, 0.7019608, 0, 1,
-1.184013, -1.0511, -2.702993, 1, 0.7098039, 0, 1,
-1.173314, 0.07881548, -1.845886, 1, 0.7137255, 0, 1,
-1.172707, -1.403778, -1.253581, 1, 0.7215686, 0, 1,
-1.172513, -0.9950172, -1.44163, 1, 0.7254902, 0, 1,
-1.153002, 0.8272669, -1.597753, 1, 0.7333333, 0, 1,
-1.150121, 0.04695411, -0.9775636, 1, 0.7372549, 0, 1,
-1.146314, 1.287597, 0.574712, 1, 0.7450981, 0, 1,
-1.140509, -0.7632397, -2.787699, 1, 0.7490196, 0, 1,
-1.139857, -1.077742, -2.816934, 1, 0.7568628, 0, 1,
-1.133242, 0.2180415, -3.957849, 1, 0.7607843, 0, 1,
-1.13133, 2.026695, -0.7893206, 1, 0.7686275, 0, 1,
-1.122907, -1.376006, -1.061887, 1, 0.772549, 0, 1,
-1.117864, -1.1834, -2.851062, 1, 0.7803922, 0, 1,
-1.097592, 0.853964, -0.9111977, 1, 0.7843137, 0, 1,
-1.091724, 0.3550164, -1.685301, 1, 0.7921569, 0, 1,
-1.091225, 1.069405, 0.867874, 1, 0.7960784, 0, 1,
-1.079162, -0.4862532, -2.793034, 1, 0.8039216, 0, 1,
-1.07897, 1.476804, -2.083903, 1, 0.8117647, 0, 1,
-1.070433, 1.368434, -1.254705, 1, 0.8156863, 0, 1,
-1.065055, -0.4603574, -2.423223, 1, 0.8235294, 0, 1,
-1.063344, -0.9217882, -2.752476, 1, 0.827451, 0, 1,
-1.061826, 0.1490298, 0.2329731, 1, 0.8352941, 0, 1,
-1.030767, 0.774856, -0.1337887, 1, 0.8392157, 0, 1,
-1.028765, 0.7805182, -0.9797809, 1, 0.8470588, 0, 1,
-1.01753, 0.6181614, -0.8786945, 1, 0.8509804, 0, 1,
-1.017199, -1.366558, -3.761496, 1, 0.8588235, 0, 1,
-1.01708, -0.6068034, -2.722524, 1, 0.8627451, 0, 1,
-1.013082, 0.2954779, -1.674588, 1, 0.8705882, 0, 1,
-1.010609, 0.08616555, -0.3458145, 1, 0.8745098, 0, 1,
-1.008458, -1.360258, -3.488588, 1, 0.8823529, 0, 1,
-1.008148, 0.7057537, -0.3795395, 1, 0.8862745, 0, 1,
-1.007556, -0.5570115, -0.9618271, 1, 0.8941177, 0, 1,
-1.007255, 0.7900845, -2.049174, 1, 0.8980392, 0, 1,
-1.004752, -0.6699081, -1.564611, 1, 0.9058824, 0, 1,
-0.994459, -2.094179, -3.257748, 1, 0.9137255, 0, 1,
-0.9862018, -0.2656768, -2.840888, 1, 0.9176471, 0, 1,
-0.9751225, 0.4601992, -0.4728889, 1, 0.9254902, 0, 1,
-0.9719759, -0.3395396, -2.853541, 1, 0.9294118, 0, 1,
-0.9565312, -0.7131169, -1.059075, 1, 0.9372549, 0, 1,
-0.9563637, 1.478247, 0.658785, 1, 0.9411765, 0, 1,
-0.9554646, 0.1584661, -1.665384, 1, 0.9490196, 0, 1,
-0.953253, 0.6244743, 0.2199052, 1, 0.9529412, 0, 1,
-0.9468498, 0.3754925, -0.8219586, 1, 0.9607843, 0, 1,
-0.9429734, -0.3649013, -2.970863, 1, 0.9647059, 0, 1,
-0.934884, 0.3034321, -0.8677394, 1, 0.972549, 0, 1,
-0.9325397, 0.682092, -0.6240622, 1, 0.9764706, 0, 1,
-0.9305522, 0.6138264, -1.719639, 1, 0.9843137, 0, 1,
-0.9279485, 1.059915, 0.6102738, 1, 0.9882353, 0, 1,
-0.9226075, -0.1310967, -3.417352, 1, 0.9960784, 0, 1,
-0.9194224, 1.155907, -0.01029679, 0.9960784, 1, 0, 1,
-0.9192785, -1.103115, -2.570185, 0.9921569, 1, 0, 1,
-0.914123, 0.5855769, 1.434849, 0.9843137, 1, 0, 1,
-0.9100372, 0.4620309, -0.7325991, 0.9803922, 1, 0, 1,
-0.9072337, 0.9695397, -1.587052, 0.972549, 1, 0, 1,
-0.9053425, 1.418016, 1.641877, 0.9686275, 1, 0, 1,
-0.894095, 1.370223, -1.256319, 0.9607843, 1, 0, 1,
-0.8898594, 0.1051445, -2.417662, 0.9568627, 1, 0, 1,
-0.8895896, 0.2096192, -0.6750311, 0.9490196, 1, 0, 1,
-0.8847699, -0.9034221, -3.012461, 0.945098, 1, 0, 1,
-0.8824465, 0.7486863, 0.4524913, 0.9372549, 1, 0, 1,
-0.8770629, 0.07868609, -1.283452, 0.9333333, 1, 0, 1,
-0.8652889, 0.7107005, -0.6244643, 0.9254902, 1, 0, 1,
-0.8647928, 0.9682159, -0.2332156, 0.9215686, 1, 0, 1,
-0.8637785, -0.03079112, -3.276957, 0.9137255, 1, 0, 1,
-0.8618, -2.073201, -2.043651, 0.9098039, 1, 0, 1,
-0.8589404, -0.1234522, -2.872902, 0.9019608, 1, 0, 1,
-0.8524135, -0.4547374, -2.2674, 0.8941177, 1, 0, 1,
-0.8516372, 0.6607245, -1.533185, 0.8901961, 1, 0, 1,
-0.843457, 1.611428, 1.066687, 0.8823529, 1, 0, 1,
-0.8360929, 0.6788736, -1.160777, 0.8784314, 1, 0, 1,
-0.8351345, 0.4292324, -0.8049893, 0.8705882, 1, 0, 1,
-0.8318647, 0.0746742, -2.614516, 0.8666667, 1, 0, 1,
-0.8315756, 0.4923641, -0.2363839, 0.8588235, 1, 0, 1,
-0.830094, -1.644713, -4.161209, 0.854902, 1, 0, 1,
-0.8272234, 0.1980715, -1.424238, 0.8470588, 1, 0, 1,
-0.8235958, 0.04759143, -2.585405, 0.8431373, 1, 0, 1,
-0.8227629, 0.4238822, -0.254597, 0.8352941, 1, 0, 1,
-0.8156455, -0.4003094, -1.774686, 0.8313726, 1, 0, 1,
-0.8146481, 0.701283, 0.5282896, 0.8235294, 1, 0, 1,
-0.811487, 1.259046, -1.347165, 0.8196079, 1, 0, 1,
-0.8098248, 3.371557, -0.04418977, 0.8117647, 1, 0, 1,
-0.8063251, -0.06125593, 0.03940742, 0.8078431, 1, 0, 1,
-0.8055792, -0.4654378, -3.133834, 0.8, 1, 0, 1,
-0.8006617, 1.284709, 1.230366, 0.7921569, 1, 0, 1,
-0.7993127, 0.4558041, -0.864113, 0.7882353, 1, 0, 1,
-0.797957, -0.3515913, -0.8206068, 0.7803922, 1, 0, 1,
-0.7931926, -0.9888743, -2.32859, 0.7764706, 1, 0, 1,
-0.7913725, 0.02396193, -0.4070481, 0.7686275, 1, 0, 1,
-0.7907945, -0.02256458, 0.9412088, 0.7647059, 1, 0, 1,
-0.781777, 1.050378, -1.083567, 0.7568628, 1, 0, 1,
-0.7804232, -0.7076525, -2.414728, 0.7529412, 1, 0, 1,
-0.7753125, 1.796709, -0.9645495, 0.7450981, 1, 0, 1,
-0.7747315, -0.3410736, -2.861338, 0.7411765, 1, 0, 1,
-0.7740507, 0.08554035, -0.4052534, 0.7333333, 1, 0, 1,
-0.7644833, -0.8891488, 0.3381768, 0.7294118, 1, 0, 1,
-0.7626565, -1.086619, -4.014582, 0.7215686, 1, 0, 1,
-0.7623321, -0.2503359, -3.532538, 0.7176471, 1, 0, 1,
-0.7518935, -1.124227, -2.40688, 0.7098039, 1, 0, 1,
-0.7463888, 0.8444168, 0.06783409, 0.7058824, 1, 0, 1,
-0.7461905, 0.6060238, -0.5891104, 0.6980392, 1, 0, 1,
-0.7461047, 0.5018377, -1.938838, 0.6901961, 1, 0, 1,
-0.7355989, -1.606435, -3.484861, 0.6862745, 1, 0, 1,
-0.7300655, 1.784972, -0.12851, 0.6784314, 1, 0, 1,
-0.7228345, -0.2324956, -2.158815, 0.6745098, 1, 0, 1,
-0.7216126, 0.07857585, -1.812003, 0.6666667, 1, 0, 1,
-0.7200834, -0.9858242, -2.582425, 0.6627451, 1, 0, 1,
-0.7197883, 0.948991, 0.4957398, 0.654902, 1, 0, 1,
-0.7151147, -2.341557, -3.553589, 0.6509804, 1, 0, 1,
-0.7092913, -1.644152, -2.741904, 0.6431373, 1, 0, 1,
-0.708831, -1.162549, -2.289994, 0.6392157, 1, 0, 1,
-0.7061215, 1.005478, 0.5419829, 0.6313726, 1, 0, 1,
-0.7049085, -0.1656705, -4.190127, 0.627451, 1, 0, 1,
-0.7029071, -1.50544, -2.012913, 0.6196079, 1, 0, 1,
-0.7007064, 0.6820639, -1.667666, 0.6156863, 1, 0, 1,
-0.6981205, -1.655293, -4.636551, 0.6078432, 1, 0, 1,
-0.6958685, -0.2560679, -2.353928, 0.6039216, 1, 0, 1,
-0.6947852, -0.04405334, -1.243151, 0.5960785, 1, 0, 1,
-0.693854, 1.238705, -1.198539, 0.5882353, 1, 0, 1,
-0.6904956, -0.9904062, -0.7976313, 0.5843138, 1, 0, 1,
-0.6900135, 0.2356625, -3.560953, 0.5764706, 1, 0, 1,
-0.6870059, -0.3013602, -3.441106, 0.572549, 1, 0, 1,
-0.6857578, 1.151797, -0.6182268, 0.5647059, 1, 0, 1,
-0.6791163, -0.04571886, -1.100467, 0.5607843, 1, 0, 1,
-0.6741898, -1.042614, -0.1951165, 0.5529412, 1, 0, 1,
-0.6712095, 1.717624, 0.5777378, 0.5490196, 1, 0, 1,
-0.6677412, 1.58689, -0.2245162, 0.5411765, 1, 0, 1,
-0.6626892, -0.6786535, -1.562033, 0.5372549, 1, 0, 1,
-0.6623119, 0.2017074, -1.347442, 0.5294118, 1, 0, 1,
-0.6542122, 0.4322349, -1.396446, 0.5254902, 1, 0, 1,
-0.6447963, -0.2907312, -1.236887, 0.5176471, 1, 0, 1,
-0.6444819, 0.3439001, -1.193556, 0.5137255, 1, 0, 1,
-0.6438225, 1.284263, -2.103446, 0.5058824, 1, 0, 1,
-0.6401829, -1.026245, -3.556462, 0.5019608, 1, 0, 1,
-0.6380212, 0.2468176, -2.844227, 0.4941176, 1, 0, 1,
-0.6368138, 1.204525, 0.07447763, 0.4862745, 1, 0, 1,
-0.6363444, 0.3553371, -0.6264837, 0.4823529, 1, 0, 1,
-0.6343918, 1.021451, 0.8759443, 0.4745098, 1, 0, 1,
-0.6322389, -1.620542, -2.952313, 0.4705882, 1, 0, 1,
-0.6315137, -0.5475572, -1.277036, 0.4627451, 1, 0, 1,
-0.6313968, 2.808461, -0.9094267, 0.4588235, 1, 0, 1,
-0.6302936, -0.1247637, -0.7004516, 0.4509804, 1, 0, 1,
-0.6284881, -0.9878537, -2.939071, 0.4470588, 1, 0, 1,
-0.6284437, 0.1374054, -1.486884, 0.4392157, 1, 0, 1,
-0.6151577, -2.326394, -4.194726, 0.4352941, 1, 0, 1,
-0.6034415, -0.1499532, -1.06554, 0.427451, 1, 0, 1,
-0.5946172, -1.710924, -0.6664195, 0.4235294, 1, 0, 1,
-0.5942867, 1.059094, -0.5407701, 0.4156863, 1, 0, 1,
-0.5830522, 0.7243115, -0.710807, 0.4117647, 1, 0, 1,
-0.577075, -0.6031699, -1.323754, 0.4039216, 1, 0, 1,
-0.5733562, -0.8512315, -3.616048, 0.3960784, 1, 0, 1,
-0.5712896, -0.06667716, -0.953217, 0.3921569, 1, 0, 1,
-0.5712322, -1.866159, -2.819823, 0.3843137, 1, 0, 1,
-0.5662904, 1.935917, -1.353872, 0.3803922, 1, 0, 1,
-0.5639099, -0.241846, -2.385874, 0.372549, 1, 0, 1,
-0.5616838, 0.9507081, -0.637659, 0.3686275, 1, 0, 1,
-0.5584285, 0.847724, -1.820142, 0.3607843, 1, 0, 1,
-0.5578238, -0.7617865, -2.98304, 0.3568628, 1, 0, 1,
-0.5573034, 1.199101, -0.5838993, 0.3490196, 1, 0, 1,
-0.5550338, -0.5536029, -1.808148, 0.345098, 1, 0, 1,
-0.5539899, -1.471396, -1.529944, 0.3372549, 1, 0, 1,
-0.5537288, 0.5669342, -1.111636, 0.3333333, 1, 0, 1,
-0.5515049, -1.075484, -1.457012, 0.3254902, 1, 0, 1,
-0.5511049, 0.1755058, 0.015403, 0.3215686, 1, 0, 1,
-0.5480189, 0.1894155, -1.947549, 0.3137255, 1, 0, 1,
-0.545612, -0.001141681, -0.4067934, 0.3098039, 1, 0, 1,
-0.5454195, 0.7894451, -0.9809031, 0.3019608, 1, 0, 1,
-0.544148, 1.09975, 1.07115, 0.2941177, 1, 0, 1,
-0.5369989, 1.226117, -1.1537, 0.2901961, 1, 0, 1,
-0.5356057, -0.4213857, -1.562075, 0.282353, 1, 0, 1,
-0.5346372, -0.8033637, -1.832639, 0.2784314, 1, 0, 1,
-0.5207546, 1.409925, 0.9874896, 0.2705882, 1, 0, 1,
-0.5195477, 0.5707265, -0.4000024, 0.2666667, 1, 0, 1,
-0.5175133, -0.1661141, -2.279609, 0.2588235, 1, 0, 1,
-0.5172412, -0.8016697, -1.807583, 0.254902, 1, 0, 1,
-0.5150635, -0.7699441, -4.066442, 0.2470588, 1, 0, 1,
-0.5141333, 0.5293742, -0.2162454, 0.2431373, 1, 0, 1,
-0.5129976, -0.3314179, -1.49469, 0.2352941, 1, 0, 1,
-0.5106074, 1.14763, 0.1260385, 0.2313726, 1, 0, 1,
-0.5078837, 0.5711535, -3.000454, 0.2235294, 1, 0, 1,
-0.5068144, 1.285447, -0.2144292, 0.2196078, 1, 0, 1,
-0.5055379, 1.346073, -0.7131816, 0.2117647, 1, 0, 1,
-0.5045077, -1.649054, -4.060543, 0.2078431, 1, 0, 1,
-0.5028524, 0.1320764, -0.1157771, 0.2, 1, 0, 1,
-0.5027636, 0.5352578, -1.270064, 0.1921569, 1, 0, 1,
-0.4988707, 0.9886533, -0.4536099, 0.1882353, 1, 0, 1,
-0.4914869, -0.09910112, -3.037748, 0.1803922, 1, 0, 1,
-0.4897651, -0.243288, -1.411032, 0.1764706, 1, 0, 1,
-0.4893578, 1.490953, 1.254832, 0.1686275, 1, 0, 1,
-0.4882965, -1.415583, -4.37584, 0.1647059, 1, 0, 1,
-0.4853299, -0.02082597, -1.74334, 0.1568628, 1, 0, 1,
-0.4821713, 0.1962887, -0.6881092, 0.1529412, 1, 0, 1,
-0.4766906, 1.303824, 0.6159658, 0.145098, 1, 0, 1,
-0.4766841, 1.635703, 0.1983848, 0.1411765, 1, 0, 1,
-0.4766821, 0.5254374, -3.206859, 0.1333333, 1, 0, 1,
-0.4754944, -0.338227, -0.9485396, 0.1294118, 1, 0, 1,
-0.474944, -2.040857, -2.181014, 0.1215686, 1, 0, 1,
-0.4680362, 0.9565279, -0.05288785, 0.1176471, 1, 0, 1,
-0.4679936, 0.1038268, -2.177386, 0.1098039, 1, 0, 1,
-0.4660847, -1.7439, -2.709615, 0.1058824, 1, 0, 1,
-0.4605854, -0.2744379, -1.735256, 0.09803922, 1, 0, 1,
-0.4556761, 1.163686, -2.783495, 0.09019608, 1, 0, 1,
-0.4534563, -0.3161572, -2.61693, 0.08627451, 1, 0, 1,
-0.4528907, -1.000335, -1.589953, 0.07843138, 1, 0, 1,
-0.4513542, 1.991164, 1.098853, 0.07450981, 1, 0, 1,
-0.4481176, -0.7139707, -1.47504, 0.06666667, 1, 0, 1,
-0.4424527, 0.1050469, -2.063918, 0.0627451, 1, 0, 1,
-0.431117, 1.271378, 0.1337071, 0.05490196, 1, 0, 1,
-0.4305196, -0.3605, -3.063938, 0.05098039, 1, 0, 1,
-0.4287935, -0.08284915, -2.440487, 0.04313726, 1, 0, 1,
-0.4228815, 1.022006, -0.09425178, 0.03921569, 1, 0, 1,
-0.4205564, 1.312921, 0.01998074, 0.03137255, 1, 0, 1,
-0.4200177, -3.303094, -2.916481, 0.02745098, 1, 0, 1,
-0.4197742, 0.1606481, -2.020566, 0.01960784, 1, 0, 1,
-0.4171579, -0.9978195, -2.164441, 0.01568628, 1, 0, 1,
-0.416787, -0.3676262, -3.321453, 0.007843138, 1, 0, 1,
-0.4093438, 0.3077531, -0.1891582, 0.003921569, 1, 0, 1,
-0.4051626, 0.05139428, -2.095454, 0, 1, 0.003921569, 1,
-0.4042256, 0.01482661, -2.480218, 0, 1, 0.01176471, 1,
-0.4007606, -0.5609009, -3.575317, 0, 1, 0.01568628, 1,
-0.4005062, -1.581781, -1.685128, 0, 1, 0.02352941, 1,
-0.3995678, 0.8215732, -0.09081089, 0, 1, 0.02745098, 1,
-0.3993617, 0.8967922, -0.03751096, 0, 1, 0.03529412, 1,
-0.3976133, -0.7894934, -2.366248, 0, 1, 0.03921569, 1,
-0.3972111, -1.241243, -4.031198, 0, 1, 0.04705882, 1,
-0.3968792, 0.4567954, -0.07693871, 0, 1, 0.05098039, 1,
-0.3949785, -0.4631222, -3.527548, 0, 1, 0.05882353, 1,
-0.3948576, -0.1446909, -1.298176, 0, 1, 0.0627451, 1,
-0.3920047, -0.5410373, -4.503479, 0, 1, 0.07058824, 1,
-0.3915913, -0.04812275, -2.439908, 0, 1, 0.07450981, 1,
-0.3911354, -0.03287803, -2.033839, 0, 1, 0.08235294, 1,
-0.3903633, 0.6402225, -2.04459, 0, 1, 0.08627451, 1,
-0.3903578, -0.6281908, -2.1043, 0, 1, 0.09411765, 1,
-0.3849243, 1.172215, -2.786156, 0, 1, 0.1019608, 1,
-0.3839003, 0.9401107, -0.6619159, 0, 1, 0.1058824, 1,
-0.3824643, 0.5021657, -0.2497713, 0, 1, 0.1137255, 1,
-0.3741451, -0.3742009, -1.545851, 0, 1, 0.1176471, 1,
-0.3736215, -1.485587, -4.299746, 0, 1, 0.1254902, 1,
-0.3670084, 0.7957994, -1.76647, 0, 1, 0.1294118, 1,
-0.3661117, 0.1201447, -2.26935, 0, 1, 0.1372549, 1,
-0.3660663, 0.8206119, -0.3079564, 0, 1, 0.1411765, 1,
-0.3655994, 1.327717, -3.091753, 0, 1, 0.1490196, 1,
-0.3633624, -1.016149, -2.045848, 0, 1, 0.1529412, 1,
-0.3616279, 0.8877146, -0.1812566, 0, 1, 0.1607843, 1,
-0.3551118, 0.4696457, 0.5734148, 0, 1, 0.1647059, 1,
-0.3545997, 0.2488433, -1.093731, 0, 1, 0.172549, 1,
-0.354253, 0.7141518, -1.038286, 0, 1, 0.1764706, 1,
-0.3536831, 0.6412693, 1.039209, 0, 1, 0.1843137, 1,
-0.3521057, 0.4944793, -0.9594758, 0, 1, 0.1882353, 1,
-0.3518972, 0.9690884, -1.357654, 0, 1, 0.1960784, 1,
-0.3510843, 0.5818442, 1.177279, 0, 1, 0.2039216, 1,
-0.3476355, 0.6494054, -0.7464558, 0, 1, 0.2078431, 1,
-0.3474855, -0.9911268, -3.877378, 0, 1, 0.2156863, 1,
-0.3411347, -0.5895492, -1.484053, 0, 1, 0.2196078, 1,
-0.3375854, -0.793614, -2.999975, 0, 1, 0.227451, 1,
-0.3372905, 1.443649, -0.4206316, 0, 1, 0.2313726, 1,
-0.3366234, 0.6047519, -1.58665, 0, 1, 0.2392157, 1,
-0.3301852, -0.5387715, -2.397006, 0, 1, 0.2431373, 1,
-0.329846, 0.1301632, -3.148014, 0, 1, 0.2509804, 1,
-0.3286875, 0.0922796, -0.8615119, 0, 1, 0.254902, 1,
-0.3163883, -0.1859716, -1.786904, 0, 1, 0.2627451, 1,
-0.3118193, 1.052877, -0.7189505, 0, 1, 0.2666667, 1,
-0.3106321, -0.2635226, -3.373535, 0, 1, 0.2745098, 1,
-0.3044191, -0.5677363, -1.900457, 0, 1, 0.2784314, 1,
-0.3031712, 1.031501, -0.3497007, 0, 1, 0.2862745, 1,
-0.295298, -0.5744268, -3.745427, 0, 1, 0.2901961, 1,
-0.2951937, -1.235996, -5.042098, 0, 1, 0.2980392, 1,
-0.2941408, 0.4376219, -0.5473173, 0, 1, 0.3058824, 1,
-0.2878986, -1.476425, -3.194813, 0, 1, 0.3098039, 1,
-0.2792945, -1.633757, -3.691699, 0, 1, 0.3176471, 1,
-0.2779733, 0.7449628, -1.393126, 0, 1, 0.3215686, 1,
-0.2704858, -1.922628, -2.885467, 0, 1, 0.3294118, 1,
-0.2633629, 1.725857, 0.4797613, 0, 1, 0.3333333, 1,
-0.2631632, -0.3022383, -1.496595, 0, 1, 0.3411765, 1,
-0.2622871, 1.143074, 0.05301219, 0, 1, 0.345098, 1,
-0.2574387, 0.09731876, -3.403701, 0, 1, 0.3529412, 1,
-0.2571655, -1.296062, -3.242176, 0, 1, 0.3568628, 1,
-0.2553281, -0.2005334, -2.293001, 0, 1, 0.3647059, 1,
-0.2521372, 0.4919609, 0.7556802, 0, 1, 0.3686275, 1,
-0.251998, -3.02994, -4.581965, 0, 1, 0.3764706, 1,
-0.2457453, -0.9891499, -4.465513, 0, 1, 0.3803922, 1,
-0.2452735, -0.6475837, -2.764757, 0, 1, 0.3882353, 1,
-0.241023, 0.9955224, -1.166648, 0, 1, 0.3921569, 1,
-0.2406233, -0.9902809, -2.890301, 0, 1, 0.4, 1,
-0.2374609, -1.985846, -3.365974, 0, 1, 0.4078431, 1,
-0.2262118, -0.6009262, -3.314313, 0, 1, 0.4117647, 1,
-0.2235011, -1.328835, -3.100274, 0, 1, 0.4196078, 1,
-0.2230701, 1.521885, 1.420848, 0, 1, 0.4235294, 1,
-0.2206118, -1.012925, -2.323446, 0, 1, 0.4313726, 1,
-0.2167203, -0.422555, -2.582926, 0, 1, 0.4352941, 1,
-0.2158374, 1.120243, 0.8812774, 0, 1, 0.4431373, 1,
-0.2053051, 1.163507, -0.2488928, 0, 1, 0.4470588, 1,
-0.204689, 2.298388, -0.9598137, 0, 1, 0.454902, 1,
-0.2000178, -0.05933282, -4.958264, 0, 1, 0.4588235, 1,
-0.199465, 0.4320619, -1.263396, 0, 1, 0.4666667, 1,
-0.198629, 0.6970829, -1.458168, 0, 1, 0.4705882, 1,
-0.1985954, -0.1116842, -2.591299, 0, 1, 0.4784314, 1,
-0.1883772, 0.8307806, 0.7425735, 0, 1, 0.4823529, 1,
-0.1822699, 1.808078, -1.122199, 0, 1, 0.4901961, 1,
-0.1810098, -2.089331, -1.830386, 0, 1, 0.4941176, 1,
-0.1801032, 0.0859879, -2.977007, 0, 1, 0.5019608, 1,
-0.1780906, 1.196055, 1.704209, 0, 1, 0.509804, 1,
-0.1778329, -0.3250717, -2.183381, 0, 1, 0.5137255, 1,
-0.1739011, 1.690359, -2.120172, 0, 1, 0.5215687, 1,
-0.1733666, -0.8858571, -4.160834, 0, 1, 0.5254902, 1,
-0.1709606, 1.072908, -1.161548, 0, 1, 0.5333334, 1,
-0.1708646, -2.784655, -2.993153, 0, 1, 0.5372549, 1,
-0.1687416, -0.4921626, -4.42283, 0, 1, 0.5450981, 1,
-0.1598869, 0.1241902, -1.661362, 0, 1, 0.5490196, 1,
-0.1589578, -0.06478763, -3.081947, 0, 1, 0.5568628, 1,
-0.1579966, 1.500695, -0.9586571, 0, 1, 0.5607843, 1,
-0.1576462, 0.5660579, 0.3939054, 0, 1, 0.5686275, 1,
-0.1510319, 0.1076209, -0.9993939, 0, 1, 0.572549, 1,
-0.1451531, -0.7841287, -2.724661, 0, 1, 0.5803922, 1,
-0.1425737, 0.6400926, -1.178625, 0, 1, 0.5843138, 1,
-0.1393732, -0.01501067, -2.792381, 0, 1, 0.5921569, 1,
-0.1387985, -0.9455315, -1.169661, 0, 1, 0.5960785, 1,
-0.1369418, 0.9177784, 0.6002638, 0, 1, 0.6039216, 1,
-0.1154375, 2.120311, -0.01213942, 0, 1, 0.6117647, 1,
-0.1121714, -0.1316047, -2.386882, 0, 1, 0.6156863, 1,
-0.1025526, 0.6044576, -1.456566, 0, 1, 0.6235294, 1,
-0.1015076, 0.1295424, -1.783013, 0, 1, 0.627451, 1,
-0.09853577, 0.2404454, -0.2815968, 0, 1, 0.6352941, 1,
-0.09800147, 0.2895482, 1.354254, 0, 1, 0.6392157, 1,
-0.09758293, -0.6011039, -2.916124, 0, 1, 0.6470588, 1,
-0.09065265, -0.8281249, -2.612034, 0, 1, 0.6509804, 1,
-0.08719495, 0.8361284, 1.535778, 0, 1, 0.6588235, 1,
-0.086352, 0.134002, -2.418026, 0, 1, 0.6627451, 1,
-0.08564106, -1.230725, -3.53308, 0, 1, 0.6705883, 1,
-0.08500322, 0.2132381, -0.6799232, 0, 1, 0.6745098, 1,
-0.08344731, -0.08857109, -4.065221, 0, 1, 0.682353, 1,
-0.0815268, 0.720908, 0.7569176, 0, 1, 0.6862745, 1,
-0.07954285, 1.097536, -0.2871415, 0, 1, 0.6941177, 1,
-0.07805319, 0.04849539, -0.819694, 0, 1, 0.7019608, 1,
-0.07418765, 0.9871258, -1.540469, 0, 1, 0.7058824, 1,
-0.07375849, 0.3524117, -1.137925, 0, 1, 0.7137255, 1,
-0.07281397, 0.9469597, -1.315328, 0, 1, 0.7176471, 1,
-0.07024001, 0.7329007, 1.61193, 0, 1, 0.7254902, 1,
-0.06728922, 0.3595753, 0.3425119, 0, 1, 0.7294118, 1,
-0.06727593, 0.7195784, 0.5149931, 0, 1, 0.7372549, 1,
-0.05884913, 0.4229704, -0.7371712, 0, 1, 0.7411765, 1,
-0.05136905, -0.7052798, -4.572683, 0, 1, 0.7490196, 1,
-0.04881714, -0.3692194, -2.413429, 0, 1, 0.7529412, 1,
-0.04483754, 0.5683007, 0.008374549, 0, 1, 0.7607843, 1,
-0.04359245, -0.4420021, -1.465792, 0, 1, 0.7647059, 1,
-0.04026227, -0.7951245, -2.660629, 0, 1, 0.772549, 1,
-0.03653948, -0.2784012, -4.270273, 0, 1, 0.7764706, 1,
-0.02960561, 0.8171768, 1.1719, 0, 1, 0.7843137, 1,
-0.02788769, -0.6599324, -1.131673, 0, 1, 0.7882353, 1,
-0.0198692, -1.399412, -4.703739, 0, 1, 0.7960784, 1,
-0.01575593, 0.9665995, 0.1452896, 0, 1, 0.8039216, 1,
-0.01429325, -0.5894155, -3.03233, 0, 1, 0.8078431, 1,
-0.01297129, -0.4179619, -2.760541, 0, 1, 0.8156863, 1,
-0.007835831, -0.741486, -2.977285, 0, 1, 0.8196079, 1,
-0.007794636, 2.351411, -0.8952997, 0, 1, 0.827451, 1,
-0.007607266, 0.9592395, 1.700624, 0, 1, 0.8313726, 1,
-0.00546805, 0.06736103, -0.3714699, 0, 1, 0.8392157, 1,
-0.00478036, -0.8704818, -3.445072, 0, 1, 0.8431373, 1,
-0.003663205, -1.066744, -2.703433, 0, 1, 0.8509804, 1,
-0.002286524, -0.146901, -3.157775, 0, 1, 0.854902, 1,
0.001665416, -0.6074931, 5.647679, 0, 1, 0.8627451, 1,
0.007951956, -0.5502419, 3.449489, 0, 1, 0.8666667, 1,
0.01389567, -0.3308529, 4.365137, 0, 1, 0.8745098, 1,
0.01581446, -0.8243507, 2.58737, 0, 1, 0.8784314, 1,
0.01968649, 0.3070873, -0.4196826, 0, 1, 0.8862745, 1,
0.02288474, 1.140071, 0.4742817, 0, 1, 0.8901961, 1,
0.02622321, -0.8153008, 3.077046, 0, 1, 0.8980392, 1,
0.02737594, 0.3430332, 0.1181064, 0, 1, 0.9058824, 1,
0.03115107, -1.410169, 1.865871, 0, 1, 0.9098039, 1,
0.03263768, 1.547928, -0.4665855, 0, 1, 0.9176471, 1,
0.03370779, -0.5086895, 4.365585, 0, 1, 0.9215686, 1,
0.0341529, 1.988608, -2.247907, 0, 1, 0.9294118, 1,
0.03426088, 1.688727, -0.7200719, 0, 1, 0.9333333, 1,
0.03610578, 0.7214503, -0.6218449, 0, 1, 0.9411765, 1,
0.03638235, -0.02850324, 0.8847556, 0, 1, 0.945098, 1,
0.03868369, -1.372656, 1.472268, 0, 1, 0.9529412, 1,
0.04049441, -0.7378774, 3.559477, 0, 1, 0.9568627, 1,
0.04154767, -1.114707, 3.486756, 0, 1, 0.9647059, 1,
0.04258492, 1.648969, 0.4209426, 0, 1, 0.9686275, 1,
0.04525101, -0.02994125, 1.231412, 0, 1, 0.9764706, 1,
0.045862, 0.3303834, 1.166558, 0, 1, 0.9803922, 1,
0.0463323, 0.7927002, -1.122398, 0, 1, 0.9882353, 1,
0.04860677, -0.9612371, 3.465944, 0, 1, 0.9921569, 1,
0.04915059, 0.6252087, -0.8139176, 0, 1, 1, 1,
0.04930948, 0.97632, 1.139061, 0, 0.9921569, 1, 1,
0.04993495, -0.3499786, 3.700072, 0, 0.9882353, 1, 1,
0.05029986, 0.7082778, -1.534206, 0, 0.9803922, 1, 1,
0.05059134, 0.4839604, -0.5740687, 0, 0.9764706, 1, 1,
0.06155236, -0.2445074, 4.164876, 0, 0.9686275, 1, 1,
0.06231159, -1.790026, 0.836742, 0, 0.9647059, 1, 1,
0.07243886, 0.08078125, 0.4833173, 0, 0.9568627, 1, 1,
0.07290643, 0.702617, 1.261097, 0, 0.9529412, 1, 1,
0.07402646, -0.3214515, 3.21176, 0, 0.945098, 1, 1,
0.07577107, 0.5375376, -1.003533, 0, 0.9411765, 1, 1,
0.07930443, -0.02225877, 2.095284, 0, 0.9333333, 1, 1,
0.08399318, -2.111376, 1.912834, 0, 0.9294118, 1, 1,
0.08401736, 1.580438, -0.4011697, 0, 0.9215686, 1, 1,
0.09247203, 1.460045, -0.6423109, 0, 0.9176471, 1, 1,
0.09283774, -2.61773, 3.833132, 0, 0.9098039, 1, 1,
0.09583794, 1.625703, -0.4382659, 0, 0.9058824, 1, 1,
0.09606525, -0.6978596, 4.834408, 0, 0.8980392, 1, 1,
0.09965275, -0.3812156, 5.322031, 0, 0.8901961, 1, 1,
0.1013213, 1.087519, 0.7494079, 0, 0.8862745, 1, 1,
0.1030786, -0.1124451, 3.625314, 0, 0.8784314, 1, 1,
0.1046264, -0.4574399, 1.614798, 0, 0.8745098, 1, 1,
0.1105461, -1.306687, 1.993956, 0, 0.8666667, 1, 1,
0.1124769, 1.239202, -0.1903856, 0, 0.8627451, 1, 1,
0.1129903, 1.202357, -1.133263, 0, 0.854902, 1, 1,
0.1157548, 0.865249, -1.434701, 0, 0.8509804, 1, 1,
0.1166507, 2.290256, 0.1879046, 0, 0.8431373, 1, 1,
0.1170552, -0.1324633, 4.138255, 0, 0.8392157, 1, 1,
0.117953, -0.9880965, 2.497673, 0, 0.8313726, 1, 1,
0.118057, -1.740847, 1.920785, 0, 0.827451, 1, 1,
0.1194726, -0.6929697, 2.405388, 0, 0.8196079, 1, 1,
0.1204065, 1.571796, 2.164174, 0, 0.8156863, 1, 1,
0.1274407, 0.4005015, -0.4151555, 0, 0.8078431, 1, 1,
0.1277982, -0.9057503, 5.160554, 0, 0.8039216, 1, 1,
0.1323458, 1.451171, -0.4872974, 0, 0.7960784, 1, 1,
0.135904, -0.4242543, 1.656219, 0, 0.7882353, 1, 1,
0.1401679, -1.125234, 5.044407, 0, 0.7843137, 1, 1,
0.1445176, -0.537742, 2.59652, 0, 0.7764706, 1, 1,
0.1577738, -0.8039885, 3.194184, 0, 0.772549, 1, 1,
0.15977, 1.178325, -0.8683844, 0, 0.7647059, 1, 1,
0.1620205, 0.6055398, 0.3050607, 0, 0.7607843, 1, 1,
0.1663679, -0.5644608, 1.819284, 0, 0.7529412, 1, 1,
0.1755815, 1.730418, -0.8178523, 0, 0.7490196, 1, 1,
0.176161, -1.195195, 3.34463, 0, 0.7411765, 1, 1,
0.1782364, 0.5996207, -1.558573, 0, 0.7372549, 1, 1,
0.1784379, 1.40493, 1.066535, 0, 0.7294118, 1, 1,
0.1835458, 1.318316, 0.8124613, 0, 0.7254902, 1, 1,
0.1837402, -0.1405878, 0.2881748, 0, 0.7176471, 1, 1,
0.1846372, -0.8768926, 4.193016, 0, 0.7137255, 1, 1,
0.1871714, -2.204184, 2.876992, 0, 0.7058824, 1, 1,
0.1874442, 0.1581343, 0.4150012, 0, 0.6980392, 1, 1,
0.1921162, 0.2911974, 1.680965, 0, 0.6941177, 1, 1,
0.1939715, 1.927912, 0.9852725, 0, 0.6862745, 1, 1,
0.1953098, -0.801213, 1.951922, 0, 0.682353, 1, 1,
0.1986904, 0.1364936, -0.553198, 0, 0.6745098, 1, 1,
0.2006208, 1.605971, -1.901762, 0, 0.6705883, 1, 1,
0.2044108, 0.8109476, -0.2903549, 0, 0.6627451, 1, 1,
0.2048571, 0.5187525, -0.9848074, 0, 0.6588235, 1, 1,
0.2050101, -0.04107533, 2.093413, 0, 0.6509804, 1, 1,
0.2053941, -0.2575591, 2.649445, 0, 0.6470588, 1, 1,
0.2061948, -0.3388342, 4.801702, 0, 0.6392157, 1, 1,
0.2062266, 0.9522558, 0.1850783, 0, 0.6352941, 1, 1,
0.2089306, -0.4541552, 2.977005, 0, 0.627451, 1, 1,
0.2096851, -0.7345736, 3.923965, 0, 0.6235294, 1, 1,
0.2131725, 0.5145235, 0.8158858, 0, 0.6156863, 1, 1,
0.2185818, 1.006188, -0.8126026, 0, 0.6117647, 1, 1,
0.225836, -1.989339, 3.349694, 0, 0.6039216, 1, 1,
0.2311981, -0.2524598, 2.124654, 0, 0.5960785, 1, 1,
0.2328722, 1.278667, -0.7183391, 0, 0.5921569, 1, 1,
0.2371161, -0.7263981, 3.310737, 0, 0.5843138, 1, 1,
0.2376924, 1.051119, -0.4864046, 0, 0.5803922, 1, 1,
0.2384128, 1.556575, 0.8812226, 0, 0.572549, 1, 1,
0.2400823, -0.9249704, 2.885775, 0, 0.5686275, 1, 1,
0.2413539, 0.1940706, 2.653497, 0, 0.5607843, 1, 1,
0.2418072, 0.05152534, 2.997779, 0, 0.5568628, 1, 1,
0.2470295, 2.260193, -0.2359638, 0, 0.5490196, 1, 1,
0.2539917, 0.001451658, 0.4232354, 0, 0.5450981, 1, 1,
0.2551194, 0.003127234, 2.052534, 0, 0.5372549, 1, 1,
0.2568794, 0.3605546, 0.1538632, 0, 0.5333334, 1, 1,
0.2580465, -0.05931096, 1.643305, 0, 0.5254902, 1, 1,
0.2581276, -0.300995, 3.66578, 0, 0.5215687, 1, 1,
0.2586964, -0.8576598, 3.376134, 0, 0.5137255, 1, 1,
0.262101, -0.1096709, 1.927546, 0, 0.509804, 1, 1,
0.2624919, -1.448376, 2.667056, 0, 0.5019608, 1, 1,
0.2656057, -0.2612447, 3.255941, 0, 0.4941176, 1, 1,
0.2660616, 0.6056753, 2.210179, 0, 0.4901961, 1, 1,
0.2676902, -0.1849007, 3.008278, 0, 0.4823529, 1, 1,
0.2678526, 0.02748928, 2.393887, 0, 0.4784314, 1, 1,
0.2691286, -0.4436418, 2.849804, 0, 0.4705882, 1, 1,
0.2704656, 0.1194664, 2.342172, 0, 0.4666667, 1, 1,
0.2744411, 2.119729, 0.7596402, 0, 0.4588235, 1, 1,
0.2746044, 0.7404838, 1.849929, 0, 0.454902, 1, 1,
0.2748051, -0.9725682, 1.956406, 0, 0.4470588, 1, 1,
0.2757039, 1.517154, 0.6248813, 0, 0.4431373, 1, 1,
0.2762253, -0.2852032, 3.984692, 0, 0.4352941, 1, 1,
0.2784378, -0.5213339, 3.329851, 0, 0.4313726, 1, 1,
0.2791366, 0.9025646, -0.338598, 0, 0.4235294, 1, 1,
0.2800789, 1.443522, -0.1830744, 0, 0.4196078, 1, 1,
0.2845429, 0.3221458, 1.53187, 0, 0.4117647, 1, 1,
0.2846344, 1.151335, 0.1891376, 0, 0.4078431, 1, 1,
0.2898967, -0.3194425, 0.547045, 0, 0.4, 1, 1,
0.2916187, 0.7740101, 0.2788835, 0, 0.3921569, 1, 1,
0.2936821, -1.151043, 2.782818, 0, 0.3882353, 1, 1,
0.2938445, -0.9623259, 3.646328, 0, 0.3803922, 1, 1,
0.2963344, 0.1923685, 0.7291437, 0, 0.3764706, 1, 1,
0.297609, 0.8589888, 1.271741, 0, 0.3686275, 1, 1,
0.3003306, 0.08633579, 1.499329, 0, 0.3647059, 1, 1,
0.3092033, -0.8637016, 1.95108, 0, 0.3568628, 1, 1,
0.3094823, -1.460341, 2.399926, 0, 0.3529412, 1, 1,
0.3109384, -0.000719677, 1.523815, 0, 0.345098, 1, 1,
0.3172233, 0.2766771, 1.4013, 0, 0.3411765, 1, 1,
0.3172908, 0.9719664, 0.9950376, 0, 0.3333333, 1, 1,
0.3186125, -1.454031, 4.137458, 0, 0.3294118, 1, 1,
0.3186153, 0.6154708, 0.9047801, 0, 0.3215686, 1, 1,
0.318848, 0.01670364, 1.874702, 0, 0.3176471, 1, 1,
0.3229613, -0.4066068, 3.789822, 0, 0.3098039, 1, 1,
0.3257012, -0.04129586, 1.113831, 0, 0.3058824, 1, 1,
0.3279372, 0.4009942, 0.4089174, 0, 0.2980392, 1, 1,
0.3293078, 0.1675338, 1.45874, 0, 0.2901961, 1, 1,
0.3315024, 0.240235, -0.006994462, 0, 0.2862745, 1, 1,
0.3407339, -0.06630643, 3.55935, 0, 0.2784314, 1, 1,
0.3465055, -1.611322, 4.000709, 0, 0.2745098, 1, 1,
0.3479422, 0.8530556, 0.1433213, 0, 0.2666667, 1, 1,
0.3491151, -2.505039, 3.414876, 0, 0.2627451, 1, 1,
0.351724, -0.1950483, 1.339705, 0, 0.254902, 1, 1,
0.3537672, -0.513536, 1.887485, 0, 0.2509804, 1, 1,
0.3540502, 0.6487067, 0.924149, 0, 0.2431373, 1, 1,
0.36435, -0.5078557, 3.980806, 0, 0.2392157, 1, 1,
0.3667638, 0.7765772, 0.2593126, 0, 0.2313726, 1, 1,
0.3676304, -0.9677045, 2.762937, 0, 0.227451, 1, 1,
0.3734201, -0.2028607, 3.486378, 0, 0.2196078, 1, 1,
0.375404, -0.2833555, 4.828733, 0, 0.2156863, 1, 1,
0.3785251, -0.02224729, 1.145836, 0, 0.2078431, 1, 1,
0.3831565, -1.894482, 2.165034, 0, 0.2039216, 1, 1,
0.3841182, -0.275467, 1.856123, 0, 0.1960784, 1, 1,
0.391615, 1.924424, -0.5330228, 0, 0.1882353, 1, 1,
0.3919111, 1.66633, 0.8912169, 0, 0.1843137, 1, 1,
0.3924949, -0.203737, 0.9757075, 0, 0.1764706, 1, 1,
0.3928874, -0.17161, 1.209898, 0, 0.172549, 1, 1,
0.3936158, 1.195347, 1.334645, 0, 0.1647059, 1, 1,
0.3978017, 1.175504, 1.331516, 0, 0.1607843, 1, 1,
0.3984643, 1.077517, 0.2453266, 0, 0.1529412, 1, 1,
0.4009616, 0.7079087, 0.7790079, 0, 0.1490196, 1, 1,
0.4016451, -0.5078735, 1.211226, 0, 0.1411765, 1, 1,
0.4026523, 0.9152601, 1.081296, 0, 0.1372549, 1, 1,
0.4027411, 0.3095202, 2.259846, 0, 0.1294118, 1, 1,
0.4036838, -0.5616222, 3.398491, 0, 0.1254902, 1, 1,
0.4065249, -0.8845975, 2.662671, 0, 0.1176471, 1, 1,
0.4079819, 1.665284, -0.7633185, 0, 0.1137255, 1, 1,
0.4151857, -0.2700948, 1.070293, 0, 0.1058824, 1, 1,
0.4180854, -0.8820388, 3.189221, 0, 0.09803922, 1, 1,
0.4197937, 0.4483985, 0.2547444, 0, 0.09411765, 1, 1,
0.4262316, 0.1050609, 0.3852983, 0, 0.08627451, 1, 1,
0.4275032, -3.413304, 1.537021, 0, 0.08235294, 1, 1,
0.4298275, 0.6234171, 0.5505338, 0, 0.07450981, 1, 1,
0.4305316, -1.226909, 2.802415, 0, 0.07058824, 1, 1,
0.433112, -0.7436391, 2.020262, 0, 0.0627451, 1, 1,
0.433511, -1.506861, 3.054319, 0, 0.05882353, 1, 1,
0.440589, -1.343126, 3.447873, 0, 0.05098039, 1, 1,
0.4423468, -0.3064802, 0.5846218, 0, 0.04705882, 1, 1,
0.4450993, 0.8065745, -0.1519761, 0, 0.03921569, 1, 1,
0.4477279, -0.1395661, -0.6064354, 0, 0.03529412, 1, 1,
0.4516282, 0.7498103, 2.258608, 0, 0.02745098, 1, 1,
0.4661933, 0.9092926, -1.487329, 0, 0.02352941, 1, 1,
0.4715472, -0.4162297, 2.795774, 0, 0.01568628, 1, 1,
0.4748278, -1.158748, 2.50219, 0, 0.01176471, 1, 1,
0.4786745, -1.163372, -0.09914893, 0, 0.003921569, 1, 1,
0.4827079, 1.346471, 0.5889823, 0.003921569, 0, 1, 1,
0.4870189, -0.9172516, 2.880254, 0.007843138, 0, 1, 1,
0.4882061, 1.213405, -0.7608881, 0.01568628, 0, 1, 1,
0.4948882, 0.5009044, 1.050005, 0.01960784, 0, 1, 1,
0.4957702, 0.5047399, -0.3609022, 0.02745098, 0, 1, 1,
0.4993474, 0.5859047, 2.217715, 0.03137255, 0, 1, 1,
0.5049575, 0.689536, -0.0556941, 0.03921569, 0, 1, 1,
0.5051783, -0.2421775, 1.1157, 0.04313726, 0, 1, 1,
0.5067484, 1.756668, -1.012695, 0.05098039, 0, 1, 1,
0.5082926, -0.2532462, 2.752094, 0.05490196, 0, 1, 1,
0.5088701, 0.5437062, -0.5933646, 0.0627451, 0, 1, 1,
0.5137895, 1.548775, 1.084545, 0.06666667, 0, 1, 1,
0.5181668, -0.082192, 1.995962, 0.07450981, 0, 1, 1,
0.5222275, -1.605981, 2.346855, 0.07843138, 0, 1, 1,
0.536666, 0.08696964, 0.6060119, 0.08627451, 0, 1, 1,
0.5378999, 0.4790185, 1.148245, 0.09019608, 0, 1, 1,
0.5424266, -0.05279287, 0.6403546, 0.09803922, 0, 1, 1,
0.5432814, 1.04234, 1.358802, 0.1058824, 0, 1, 1,
0.5464051, -0.3728685, 1.624827, 0.1098039, 0, 1, 1,
0.5466731, -0.04048151, 1.294019, 0.1176471, 0, 1, 1,
0.5469919, 0.2719058, 1.170318, 0.1215686, 0, 1, 1,
0.5477055, -0.9297733, 0.5555699, 0.1294118, 0, 1, 1,
0.550788, -1.004463, 3.558265, 0.1333333, 0, 1, 1,
0.5512015, -0.008961059, 1.869884, 0.1411765, 0, 1, 1,
0.5527692, -1.415607, 3.383526, 0.145098, 0, 1, 1,
0.5528691, -0.6007789, 3.829448, 0.1529412, 0, 1, 1,
0.5534279, -0.8104181, 2.4, 0.1568628, 0, 1, 1,
0.5542679, 0.1820688, 1.630378, 0.1647059, 0, 1, 1,
0.5578139, 0.5667325, 0.8011248, 0.1686275, 0, 1, 1,
0.5592261, -0.739356, 2.849692, 0.1764706, 0, 1, 1,
0.5601621, 1.010933, 1.02886, 0.1803922, 0, 1, 1,
0.5664262, -1.07466, 3.102034, 0.1882353, 0, 1, 1,
0.5671547, 1.166222, 0.008626701, 0.1921569, 0, 1, 1,
0.5672634, -1.593543, 1.985317, 0.2, 0, 1, 1,
0.568733, -1.335992, 2.885927, 0.2078431, 0, 1, 1,
0.5693872, -1.836707, 2.351248, 0.2117647, 0, 1, 1,
0.5740359, 1.785852, 1.138949, 0.2196078, 0, 1, 1,
0.5745313, 0.2082303, 0.3396494, 0.2235294, 0, 1, 1,
0.5759166, -0.01333794, 0.3662898, 0.2313726, 0, 1, 1,
0.5856509, 1.281248, 1.502874, 0.2352941, 0, 1, 1,
0.587085, -1.4048, 2.636875, 0.2431373, 0, 1, 1,
0.5885786, -0.6718561, 2.773269, 0.2470588, 0, 1, 1,
0.5931951, -0.02627234, 2.800557, 0.254902, 0, 1, 1,
0.5948681, -0.4897443, 2.49839, 0.2588235, 0, 1, 1,
0.6090614, -1.795067, 2.097302, 0.2666667, 0, 1, 1,
0.6112912, 1.651083, 2.037664, 0.2705882, 0, 1, 1,
0.6134293, -0.4086467, 1.541382, 0.2784314, 0, 1, 1,
0.6201187, 0.7823353, 0.9990137, 0.282353, 0, 1, 1,
0.6235835, 0.341196, 1.190376, 0.2901961, 0, 1, 1,
0.6319401, -0.1640976, 2.046923, 0.2941177, 0, 1, 1,
0.631959, 0.3512402, 2.164435, 0.3019608, 0, 1, 1,
0.6360331, 1.083837, -0.8402893, 0.3098039, 0, 1, 1,
0.6430786, -0.8011237, 3.026113, 0.3137255, 0, 1, 1,
0.6438103, -0.6353462, 2.122254, 0.3215686, 0, 1, 1,
0.6451181, -0.89445, 3.836508, 0.3254902, 0, 1, 1,
0.647084, -1.115672, 1.370818, 0.3333333, 0, 1, 1,
0.6489334, 1.867068, 0.865163, 0.3372549, 0, 1, 1,
0.6587086, -1.062479, 3.296973, 0.345098, 0, 1, 1,
0.6609356, 0.1709558, -0.1085294, 0.3490196, 0, 1, 1,
0.6702295, -0.7159321, 1.032919, 0.3568628, 0, 1, 1,
0.672131, -0.7598855, 1.450079, 0.3607843, 0, 1, 1,
0.673517, -0.7595418, 2.131868, 0.3686275, 0, 1, 1,
0.6743961, 0.179329, 1.570808, 0.372549, 0, 1, 1,
0.6747486, 2.451485, 0.212194, 0.3803922, 0, 1, 1,
0.6755138, -0.6219264, 1.594979, 0.3843137, 0, 1, 1,
0.6756112, 0.9686168, -0.08778131, 0.3921569, 0, 1, 1,
0.68454, -0.08950797, 3.38471, 0.3960784, 0, 1, 1,
0.6875522, -0.1977652, 2.615328, 0.4039216, 0, 1, 1,
0.6908898, -0.2586553, 2.199264, 0.4117647, 0, 1, 1,
0.6914969, 1.02056, 1.559084, 0.4156863, 0, 1, 1,
0.6927193, -0.1808585, 3.177384, 0.4235294, 0, 1, 1,
0.6939807, -0.6584026, 2.821457, 0.427451, 0, 1, 1,
0.6947563, 1.184818, 0.7420971, 0.4352941, 0, 1, 1,
0.6974947, 0.4012049, 0.9678786, 0.4392157, 0, 1, 1,
0.6991163, -1.249313, 3.255633, 0.4470588, 0, 1, 1,
0.7014471, -1.040758, 2.55679, 0.4509804, 0, 1, 1,
0.701516, -1.22482, 1.670889, 0.4588235, 0, 1, 1,
0.7023773, -0.7228065, 4.079705, 0.4627451, 0, 1, 1,
0.7045391, -0.9094216, 2.801369, 0.4705882, 0, 1, 1,
0.7117129, 0.3550845, 1.176632, 0.4745098, 0, 1, 1,
0.7119787, -1.224445, 3.216058, 0.4823529, 0, 1, 1,
0.7146034, -0.4680599, 0.7163364, 0.4862745, 0, 1, 1,
0.7152786, -1.141864, 5.206038, 0.4941176, 0, 1, 1,
0.7156578, 0.762445, 0.3493643, 0.5019608, 0, 1, 1,
0.719045, 0.6249273, 0.7252123, 0.5058824, 0, 1, 1,
0.7208033, 0.725005, 0.5520592, 0.5137255, 0, 1, 1,
0.7210793, -0.2425895, -0.2064343, 0.5176471, 0, 1, 1,
0.7247277, -0.4086302, 0.2263004, 0.5254902, 0, 1, 1,
0.7317237, -0.09492316, 0.7546514, 0.5294118, 0, 1, 1,
0.7358822, -0.3668977, 1.214302, 0.5372549, 0, 1, 1,
0.7385197, 1.981204, -0.5679842, 0.5411765, 0, 1, 1,
0.7413167, -1.39836, 2.364797, 0.5490196, 0, 1, 1,
0.7413229, -0.9739956, 2.099219, 0.5529412, 0, 1, 1,
0.7486318, 1.087521, 1.186845, 0.5607843, 0, 1, 1,
0.7499827, 0.7853225, -0.6672757, 0.5647059, 0, 1, 1,
0.7525905, 0.6531298, 1.01823, 0.572549, 0, 1, 1,
0.7570719, 0.8019786, 1.587339, 0.5764706, 0, 1, 1,
0.7575579, 0.3292374, 1.660451, 0.5843138, 0, 1, 1,
0.7610918, 0.4813566, 0.6506802, 0.5882353, 0, 1, 1,
0.7642493, 0.3953549, -0.3448056, 0.5960785, 0, 1, 1,
0.7650868, -0.06810048, 2.456424, 0.6039216, 0, 1, 1,
0.7704152, -0.1366548, -0.5918224, 0.6078432, 0, 1, 1,
0.7795967, 1.252003, -0.9909311, 0.6156863, 0, 1, 1,
0.7805653, -0.105308, 1.815256, 0.6196079, 0, 1, 1,
0.7825704, -0.6159194, 2.186849, 0.627451, 0, 1, 1,
0.7834044, -0.1417199, 1.870269, 0.6313726, 0, 1, 1,
0.7867084, -0.7936714, 2.41935, 0.6392157, 0, 1, 1,
0.7873729, -0.6161089, 2.511404, 0.6431373, 0, 1, 1,
0.7904176, -1.435305, 2.669709, 0.6509804, 0, 1, 1,
0.7952371, -0.4849621, 1.419778, 0.654902, 0, 1, 1,
0.7974133, -0.2201075, 0.4194375, 0.6627451, 0, 1, 1,
0.8079863, -1.69271, 4.548656, 0.6666667, 0, 1, 1,
0.8082781, -1.77044, 2.371894, 0.6745098, 0, 1, 1,
0.8120044, 0.837839, 1.426958, 0.6784314, 0, 1, 1,
0.8142311, -0.7128249, 2.32118, 0.6862745, 0, 1, 1,
0.8154118, 1.939685, 1.607568, 0.6901961, 0, 1, 1,
0.8158833, 0.01212607, 3.507319, 0.6980392, 0, 1, 1,
0.8197774, 0.41024, 0.7606929, 0.7058824, 0, 1, 1,
0.8242583, -2.35638, 3.086024, 0.7098039, 0, 1, 1,
0.8270062, 0.4161552, 1.681538, 0.7176471, 0, 1, 1,
0.8294638, -1.265573, 3.514444, 0.7215686, 0, 1, 1,
0.8299832, -1.168929, 1.792297, 0.7294118, 0, 1, 1,
0.8319291, 0.9972374, 2.87917, 0.7333333, 0, 1, 1,
0.8359603, -0.2769436, 1.747342, 0.7411765, 0, 1, 1,
0.8361577, 0.4337526, 1.694814, 0.7450981, 0, 1, 1,
0.8375616, 0.6429961, -0.1372223, 0.7529412, 0, 1, 1,
0.8407822, -1.400577, 2.582567, 0.7568628, 0, 1, 1,
0.849928, -0.08870251, 2.479361, 0.7647059, 0, 1, 1,
0.8508688, -1.306285, 1.547188, 0.7686275, 0, 1, 1,
0.8509129, 1.045883, 0.3637114, 0.7764706, 0, 1, 1,
0.8590648, -0.688512, 1.526695, 0.7803922, 0, 1, 1,
0.8602177, 0.1326896, 2.607197, 0.7882353, 0, 1, 1,
0.866506, 0.7008227, 1.562748, 0.7921569, 0, 1, 1,
0.8674288, 0.7157967, -0.3450333, 0.8, 0, 1, 1,
0.8681555, -0.2899983, 2.451653, 0.8078431, 0, 1, 1,
0.8702797, 0.5278037, 0.6172638, 0.8117647, 0, 1, 1,
0.871725, 0.1248001, -1.185861, 0.8196079, 0, 1, 1,
0.8761132, 1.0573, -0.9294342, 0.8235294, 0, 1, 1,
0.8762108, -0.06055417, 1.18436, 0.8313726, 0, 1, 1,
0.8777843, 2.422319, 2.887453, 0.8352941, 0, 1, 1,
0.8780722, -0.3884311, 1.175045, 0.8431373, 0, 1, 1,
0.8805547, -0.7696341, 2.535493, 0.8470588, 0, 1, 1,
0.8849685, -0.7689207, 2.04346, 0.854902, 0, 1, 1,
0.8860198, 0.3489023, -0.4838395, 0.8588235, 0, 1, 1,
0.8910126, 0.4462385, 2.700723, 0.8666667, 0, 1, 1,
0.8945837, 0.4506849, 1.189372, 0.8705882, 0, 1, 1,
0.8984161, 0.2783072, 0.3711492, 0.8784314, 0, 1, 1,
0.8991675, 0.3473917, 0.9763787, 0.8823529, 0, 1, 1,
0.9012417, 1.170294, 0.1594735, 0.8901961, 0, 1, 1,
0.9050573, 1.477263, 1.130974, 0.8941177, 0, 1, 1,
0.9056109, -0.4070223, 2.092908, 0.9019608, 0, 1, 1,
0.905618, 0.1489669, 0.5807165, 0.9098039, 0, 1, 1,
0.9092194, 1.172158, 2.724926, 0.9137255, 0, 1, 1,
0.913952, -0.51757, 3.185508, 0.9215686, 0, 1, 1,
0.9172706, -0.9140697, 2.259981, 0.9254902, 0, 1, 1,
0.9218332, 0.349582, 1.378147, 0.9333333, 0, 1, 1,
0.9223706, 2.050668, 1.639693, 0.9372549, 0, 1, 1,
0.9226054, 1.591343, 0.1352623, 0.945098, 0, 1, 1,
0.9285557, -0.3355132, 2.395607, 0.9490196, 0, 1, 1,
0.9298353, 2.220383, 0.04744746, 0.9568627, 0, 1, 1,
0.9339349, 1.378207, -0.3479636, 0.9607843, 0, 1, 1,
0.9347962, -0.4305154, 1.420345, 0.9686275, 0, 1, 1,
0.9416751, -0.8187488, 2.398299, 0.972549, 0, 1, 1,
0.944682, 1.076483, 1.722391, 0.9803922, 0, 1, 1,
0.9471771, -0.6431223, 1.488354, 0.9843137, 0, 1, 1,
0.9481333, -2.438009, 2.006607, 0.9921569, 0, 1, 1,
0.9538248, 0.2512636, -0.9116982, 0.9960784, 0, 1, 1,
0.9596404, -0.5466557, 1.220398, 1, 0, 0.9960784, 1,
0.9608731, -0.8815926, 0.6791194, 1, 0, 0.9882353, 1,
0.970538, 0.1599751, 1.180065, 1, 0, 0.9843137, 1,
0.973547, -1.235602, 1.574309, 1, 0, 0.9764706, 1,
0.9756478, 1.719646, 3.054964, 1, 0, 0.972549, 1,
0.9796226, 0.9456443, 2.060933, 1, 0, 0.9647059, 1,
1.001339, -0.3991693, 2.327586, 1, 0, 0.9607843, 1,
1.003891, -1.1576, 4.637872, 1, 0, 0.9529412, 1,
1.012329, -0.2308191, 1.974364, 1, 0, 0.9490196, 1,
1.015894, 0.3707702, 0.5115255, 1, 0, 0.9411765, 1,
1.018476, -0.168174, 1.744671, 1, 0, 0.9372549, 1,
1.024042, 2.641296, 0.7815644, 1, 0, 0.9294118, 1,
1.031002, -0.09172529, 1.618317, 1, 0, 0.9254902, 1,
1.031908, -0.946971, 2.326302, 1, 0, 0.9176471, 1,
1.03502, -1.10865, 2.350315, 1, 0, 0.9137255, 1,
1.049006, 1.273339, 0.337987, 1, 0, 0.9058824, 1,
1.051969, -1.732572, 3.728343, 1, 0, 0.9019608, 1,
1.060807, 0.3344458, 1.760911, 1, 0, 0.8941177, 1,
1.063844, 0.1784292, 2.757017, 1, 0, 0.8862745, 1,
1.06949, -0.9217777, 5.471599, 1, 0, 0.8823529, 1,
1.069625, -0.3542723, 2.044727, 1, 0, 0.8745098, 1,
1.077267, 0.4161085, 2.271365, 1, 0, 0.8705882, 1,
1.080482, 0.8808901, 1.361102, 1, 0, 0.8627451, 1,
1.082788, -0.5906639, -0.1617985, 1, 0, 0.8588235, 1,
1.083892, 0.1089572, 3.115763, 1, 0, 0.8509804, 1,
1.084889, 0.04277506, 2.222992, 1, 0, 0.8470588, 1,
1.091169, -0.6208428, 1.358889, 1, 0, 0.8392157, 1,
1.091797, -0.1833982, 1.064982, 1, 0, 0.8352941, 1,
1.097878, -0.008569873, 2.879614, 1, 0, 0.827451, 1,
1.101336, 1.631843, 1.190893, 1, 0, 0.8235294, 1,
1.104349, 0.6596114, 0.221438, 1, 0, 0.8156863, 1,
1.111748, 1.199588, -0.1878089, 1, 0, 0.8117647, 1,
1.118165, -0.2108118, -0.8407286, 1, 0, 0.8039216, 1,
1.118631, 2.179944, -0.1081023, 1, 0, 0.7960784, 1,
1.128677, 0.2220739, 1.789679, 1, 0, 0.7921569, 1,
1.128869, 0.7811348, 2.403409, 1, 0, 0.7843137, 1,
1.12973, -1.175526, 0.4774038, 1, 0, 0.7803922, 1,
1.131479, 0.781875, 1.48308, 1, 0, 0.772549, 1,
1.14127, 0.6801372, 2.143912, 1, 0, 0.7686275, 1,
1.146366, -0.2348569, 0.9532173, 1, 0, 0.7607843, 1,
1.147043, -0.5129008, 0.4888114, 1, 0, 0.7568628, 1,
1.147454, -1.115292, 1.788201, 1, 0, 0.7490196, 1,
1.159622, -1.25405, 1.606435, 1, 0, 0.7450981, 1,
1.164433, -0.5035201, 1.971844, 1, 0, 0.7372549, 1,
1.172195, 1.727923, 1.292036, 1, 0, 0.7333333, 1,
1.201229, 0.28883, 0.5806861, 1, 0, 0.7254902, 1,
1.202382, -0.2569822, 3.60267, 1, 0, 0.7215686, 1,
1.202413, 0.7024532, 1.926664, 1, 0, 0.7137255, 1,
1.210238, 0.3380241, 0.4113451, 1, 0, 0.7098039, 1,
1.210276, -1.385311, 3.705333, 1, 0, 0.7019608, 1,
1.210359, -0.4366622, 2.335315, 1, 0, 0.6941177, 1,
1.220503, 0.4621692, 0.2073952, 1, 0, 0.6901961, 1,
1.225391, -0.8383374, 3.165125, 1, 0, 0.682353, 1,
1.24512, 0.6026092, -0.2548474, 1, 0, 0.6784314, 1,
1.245435, 0.5154756, 3.132341, 1, 0, 0.6705883, 1,
1.250105, -0.8342204, 2.012488, 1, 0, 0.6666667, 1,
1.252387, -0.7543374, 0.4853651, 1, 0, 0.6588235, 1,
1.253516, -0.5998206, 0.7462341, 1, 0, 0.654902, 1,
1.253908, 2.492941, 1.296023, 1, 0, 0.6470588, 1,
1.255434, 0.7066563, -0.7243815, 1, 0, 0.6431373, 1,
1.259705, -0.9422307, 4.943513, 1, 0, 0.6352941, 1,
1.261207, -0.07262702, 2.48115, 1, 0, 0.6313726, 1,
1.261683, 1.166028, -1.383084, 1, 0, 0.6235294, 1,
1.262549, -0.1406675, 1.880035, 1, 0, 0.6196079, 1,
1.271965, -0.4690817, 1.246156, 1, 0, 0.6117647, 1,
1.277763, -0.6079997, 2.108935, 1, 0, 0.6078432, 1,
1.279096, -0.1539535, 2.132912, 1, 0, 0.6, 1,
1.281448, 1.206461, -0.4466115, 1, 0, 0.5921569, 1,
1.282451, 0.7663565, 1.293458, 1, 0, 0.5882353, 1,
1.283558, 1.734538, -0.2859448, 1, 0, 0.5803922, 1,
1.291878, 0.2517336, 1.837802, 1, 0, 0.5764706, 1,
1.293086, -0.03068336, 1.57816, 1, 0, 0.5686275, 1,
1.294617, 0.02414975, 2.306552, 1, 0, 0.5647059, 1,
1.303492, 0.6617576, 0.9965014, 1, 0, 0.5568628, 1,
1.318145, -1.452504, 1.164704, 1, 0, 0.5529412, 1,
1.324325, -1.616565, 3.727453, 1, 0, 0.5450981, 1,
1.334244, 0.2203173, 1.040755, 1, 0, 0.5411765, 1,
1.337357, 0.3100432, 1.119076, 1, 0, 0.5333334, 1,
1.345937, 0.9373651, 0.5088504, 1, 0, 0.5294118, 1,
1.350237, -0.3178741, 0.01817088, 1, 0, 0.5215687, 1,
1.351645, 1.858323, 0.8740566, 1, 0, 0.5176471, 1,
1.353394, -0.5955551, 1.050905, 1, 0, 0.509804, 1,
1.356303, -1.015002, 2.356471, 1, 0, 0.5058824, 1,
1.360297, 0.2609338, 2.119181, 1, 0, 0.4980392, 1,
1.361574, -0.4224993, 2.969507, 1, 0, 0.4901961, 1,
1.376747, -0.6577907, 0.7656084, 1, 0, 0.4862745, 1,
1.389721, -1.525046, 1.941423, 1, 0, 0.4784314, 1,
1.39023, 0.8828371, 0.9686208, 1, 0, 0.4745098, 1,
1.395346, -0.6810354, 3.025022, 1, 0, 0.4666667, 1,
1.395349, 1.563481, 0.6049454, 1, 0, 0.4627451, 1,
1.398507, 0.08566322, 2.299747, 1, 0, 0.454902, 1,
1.399814, 0.06766135, 1.818198, 1, 0, 0.4509804, 1,
1.416293, 0.8705659, 1.224921, 1, 0, 0.4431373, 1,
1.430626, -0.1942893, 2.292631, 1, 0, 0.4392157, 1,
1.431473, 0.8439352, -0.02735851, 1, 0, 0.4313726, 1,
1.431928, -1.214943, 3.532406, 1, 0, 0.427451, 1,
1.434536, 1.122954, 0.6809467, 1, 0, 0.4196078, 1,
1.437389, 0.2718746, 3.473628, 1, 0, 0.4156863, 1,
1.452834, 0.8491017, 1.655497, 1, 0, 0.4078431, 1,
1.454066, -3.3205, 1.641312, 1, 0, 0.4039216, 1,
1.467455, -0.5653605, 2.905532, 1, 0, 0.3960784, 1,
1.471514, -0.3493931, 1.282106, 1, 0, 0.3882353, 1,
1.472473, 0.31444, 1.190005, 1, 0, 0.3843137, 1,
1.481321, 0.224052, 2.597642, 1, 0, 0.3764706, 1,
1.487552, -0.08839478, 3.363532, 1, 0, 0.372549, 1,
1.506183, 0.02402123, -0.7408072, 1, 0, 0.3647059, 1,
1.507259, 0.7127278, 2.23327, 1, 0, 0.3607843, 1,
1.545263, 0.3713446, 0.2781867, 1, 0, 0.3529412, 1,
1.551341, -0.2907553, 2.02497, 1, 0, 0.3490196, 1,
1.563419, -0.821914, 0.008595548, 1, 0, 0.3411765, 1,
1.578977, 0.8295365, 1.875166, 1, 0, 0.3372549, 1,
1.579093, -0.3231834, 1.170861, 1, 0, 0.3294118, 1,
1.586724, 0.1073931, 0.638671, 1, 0, 0.3254902, 1,
1.617257, 0.7010341, 1.772232, 1, 0, 0.3176471, 1,
1.637954, -1.787398, 3.532214, 1, 0, 0.3137255, 1,
1.674451, -2.41476, 2.404503, 1, 0, 0.3058824, 1,
1.674759, -1.45155, 1.937703, 1, 0, 0.2980392, 1,
1.677963, 0.1027953, 1.359266, 1, 0, 0.2941177, 1,
1.68697, 1.405696, 1.006188, 1, 0, 0.2862745, 1,
1.706577, -0.2453113, 2.34747, 1, 0, 0.282353, 1,
1.709906, 0.06252877, 1.22646, 1, 0, 0.2745098, 1,
1.712167, -0.01539674, -0.1014547, 1, 0, 0.2705882, 1,
1.712989, -0.5215201, 3.314628, 1, 0, 0.2627451, 1,
1.7152, -0.8646837, 1.418232, 1, 0, 0.2588235, 1,
1.724472, -0.133964, -0.1426865, 1, 0, 0.2509804, 1,
1.725336, -0.4544797, 2.141985, 1, 0, 0.2470588, 1,
1.747288, -1.405623, 2.160622, 1, 0, 0.2392157, 1,
1.752844, 0.6538528, 1.382568, 1, 0, 0.2352941, 1,
1.75409, 0.1884548, 2.619449, 1, 0, 0.227451, 1,
1.79074, 0.5606753, 1.135983, 1, 0, 0.2235294, 1,
1.799751, -1.269774, 0.6072955, 1, 0, 0.2156863, 1,
1.823598, 2.460545, 1.002702, 1, 0, 0.2117647, 1,
1.846537, 0.2314113, 1.102354, 1, 0, 0.2039216, 1,
1.866461, 0.553194, 4.239782, 1, 0, 0.1960784, 1,
1.891909, 1.150304, 0.3883928, 1, 0, 0.1921569, 1,
1.900036, -1.488976, 3.469078, 1, 0, 0.1843137, 1,
1.908318, -0.5275662, 2.656381, 1, 0, 0.1803922, 1,
1.913538, 0.02729201, 0.5737993, 1, 0, 0.172549, 1,
1.913959, -0.3798246, 2.323698, 1, 0, 0.1686275, 1,
1.91425, 0.4346312, 0.7754607, 1, 0, 0.1607843, 1,
1.934054, 0.232024, 4.379778, 1, 0, 0.1568628, 1,
1.940038, -0.09493298, 0.6883647, 1, 0, 0.1490196, 1,
1.9408, -1.715975, 2.729749, 1, 0, 0.145098, 1,
1.940943, 0.04226724, 2.21057, 1, 0, 0.1372549, 1,
1.941897, 0.5192052, -0.3580576, 1, 0, 0.1333333, 1,
1.967548, -1.58434, 2.995698, 1, 0, 0.1254902, 1,
1.989592, 0.04721237, 2.424994, 1, 0, 0.1215686, 1,
2.023942, 1.434884, 0.1633578, 1, 0, 0.1137255, 1,
2.039946, -0.2172511, 1.051223, 1, 0, 0.1098039, 1,
2.074281, -1.368195, 2.138487, 1, 0, 0.1019608, 1,
2.079364, 0.5391977, 1.394128, 1, 0, 0.09411765, 1,
2.094363, -0.8256537, 1.682645, 1, 0, 0.09019608, 1,
2.102786, 0.8078955, 0.5706121, 1, 0, 0.08235294, 1,
2.126914, 1.373028, 0.8439908, 1, 0, 0.07843138, 1,
2.18954, -0.3601402, 0.6591888, 1, 0, 0.07058824, 1,
2.217066, 0.5222653, 0.569199, 1, 0, 0.06666667, 1,
2.296735, 0.5740403, 0.441291, 1, 0, 0.05882353, 1,
2.30081, -0.3493321, 0.4344333, 1, 0, 0.05490196, 1,
2.388318, -1.203868, 1.890731, 1, 0, 0.04705882, 1,
2.397384, 0.5117651, 1.906545, 1, 0, 0.04313726, 1,
2.454385, -0.9147093, 2.341294, 1, 0, 0.03529412, 1,
2.45919, -0.04291678, 0.9624054, 1, 0, 0.03137255, 1,
2.477266, -0.6911657, 2.855365, 1, 0, 0.02352941, 1,
2.815832, -0.1764817, 3.135452, 1, 0, 0.01960784, 1,
3.007239, -0.3465725, 1.980801, 1, 0, 0.01176471, 1,
4.022039, -0.5146282, 0.8521733, 1, 0, 0.007843138, 1
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
0.2757019, -4.563338, -6.854015, 0, -0.5, 0.5, 0.5,
0.2757019, -4.563338, -6.854015, 1, -0.5, 0.5, 0.5,
0.2757019, -4.563338, -6.854015, 1, 1.5, 0.5, 0.5,
0.2757019, -4.563338, -6.854015, 0, 1.5, 0.5, 0.5
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
-4.740644, -0.02087379, -6.854015, 0, -0.5, 0.5, 0.5,
-4.740644, -0.02087379, -6.854015, 1, -0.5, 0.5, 0.5,
-4.740644, -0.02087379, -6.854015, 1, 1.5, 0.5, 0.5,
-4.740644, -0.02087379, -6.854015, 0, 1.5, 0.5, 0.5
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
-4.740644, -4.563338, 0.3027909, 0, -0.5, 0.5, 0.5,
-4.740644, -4.563338, 0.3027909, 1, -0.5, 0.5, 0.5,
-4.740644, -4.563338, 0.3027909, 1, 1.5, 0.5, 0.5,
-4.740644, -4.563338, 0.3027909, 0, 1.5, 0.5, 0.5
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
-2, -3.515077, -5.202444,
4, -3.515077, -5.202444,
-2, -3.515077, -5.202444,
-2, -3.689787, -5.477706,
0, -3.515077, -5.202444,
0, -3.689787, -5.477706,
2, -3.515077, -5.202444,
2, -3.689787, -5.477706,
4, -3.515077, -5.202444,
4, -3.689787, -5.477706
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
"0",
"2",
"4"
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
-2, -4.039208, -6.02823, 0, -0.5, 0.5, 0.5,
-2, -4.039208, -6.02823, 1, -0.5, 0.5, 0.5,
-2, -4.039208, -6.02823, 1, 1.5, 0.5, 0.5,
-2, -4.039208, -6.02823, 0, 1.5, 0.5, 0.5,
0, -4.039208, -6.02823, 0, -0.5, 0.5, 0.5,
0, -4.039208, -6.02823, 1, -0.5, 0.5, 0.5,
0, -4.039208, -6.02823, 1, 1.5, 0.5, 0.5,
0, -4.039208, -6.02823, 0, 1.5, 0.5, 0.5,
2, -4.039208, -6.02823, 0, -0.5, 0.5, 0.5,
2, -4.039208, -6.02823, 1, -0.5, 0.5, 0.5,
2, -4.039208, -6.02823, 1, 1.5, 0.5, 0.5,
2, -4.039208, -6.02823, 0, 1.5, 0.5, 0.5,
4, -4.039208, -6.02823, 0, -0.5, 0.5, 0.5,
4, -4.039208, -6.02823, 1, -0.5, 0.5, 0.5,
4, -4.039208, -6.02823, 1, 1.5, 0.5, 0.5,
4, -4.039208, -6.02823, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.583025, -3, -5.202444,
-3.583025, 3, -5.202444,
-3.583025, -3, -5.202444,
-3.775962, -3, -5.477706,
-3.583025, -2, -5.202444,
-3.775962, -2, -5.477706,
-3.583025, -1, -5.202444,
-3.775962, -1, -5.477706,
-3.583025, 0, -5.202444,
-3.775962, 0, -5.477706,
-3.583025, 1, -5.202444,
-3.775962, 1, -5.477706,
-3.583025, 2, -5.202444,
-3.775962, 2, -5.477706,
-3.583025, 3, -5.202444,
-3.775962, 3, -5.477706
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
-4.161834, -3, -6.02823, 0, -0.5, 0.5, 0.5,
-4.161834, -3, -6.02823, 1, -0.5, 0.5, 0.5,
-4.161834, -3, -6.02823, 1, 1.5, 0.5, 0.5,
-4.161834, -3, -6.02823, 0, 1.5, 0.5, 0.5,
-4.161834, -2, -6.02823, 0, -0.5, 0.5, 0.5,
-4.161834, -2, -6.02823, 1, -0.5, 0.5, 0.5,
-4.161834, -2, -6.02823, 1, 1.5, 0.5, 0.5,
-4.161834, -2, -6.02823, 0, 1.5, 0.5, 0.5,
-4.161834, -1, -6.02823, 0, -0.5, 0.5, 0.5,
-4.161834, -1, -6.02823, 1, -0.5, 0.5, 0.5,
-4.161834, -1, -6.02823, 1, 1.5, 0.5, 0.5,
-4.161834, -1, -6.02823, 0, 1.5, 0.5, 0.5,
-4.161834, 0, -6.02823, 0, -0.5, 0.5, 0.5,
-4.161834, 0, -6.02823, 1, -0.5, 0.5, 0.5,
-4.161834, 0, -6.02823, 1, 1.5, 0.5, 0.5,
-4.161834, 0, -6.02823, 0, 1.5, 0.5, 0.5,
-4.161834, 1, -6.02823, 0, -0.5, 0.5, 0.5,
-4.161834, 1, -6.02823, 1, -0.5, 0.5, 0.5,
-4.161834, 1, -6.02823, 1, 1.5, 0.5, 0.5,
-4.161834, 1, -6.02823, 0, 1.5, 0.5, 0.5,
-4.161834, 2, -6.02823, 0, -0.5, 0.5, 0.5,
-4.161834, 2, -6.02823, 1, -0.5, 0.5, 0.5,
-4.161834, 2, -6.02823, 1, 1.5, 0.5, 0.5,
-4.161834, 2, -6.02823, 0, 1.5, 0.5, 0.5,
-4.161834, 3, -6.02823, 0, -0.5, 0.5, 0.5,
-4.161834, 3, -6.02823, 1, -0.5, 0.5, 0.5,
-4.161834, 3, -6.02823, 1, 1.5, 0.5, 0.5,
-4.161834, 3, -6.02823, 0, 1.5, 0.5, 0.5
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
-3.583025, -3.515077, -4,
-3.583025, -3.515077, 4,
-3.583025, -3.515077, -4,
-3.775962, -3.689787, -4,
-3.583025, -3.515077, -2,
-3.775962, -3.689787, -2,
-3.583025, -3.515077, 0,
-3.775962, -3.689787, 0,
-3.583025, -3.515077, 2,
-3.775962, -3.689787, 2,
-3.583025, -3.515077, 4,
-3.775962, -3.689787, 4
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
-4.161834, -4.039208, -4, 0, -0.5, 0.5, 0.5,
-4.161834, -4.039208, -4, 1, -0.5, 0.5, 0.5,
-4.161834, -4.039208, -4, 1, 1.5, 0.5, 0.5,
-4.161834, -4.039208, -4, 0, 1.5, 0.5, 0.5,
-4.161834, -4.039208, -2, 0, -0.5, 0.5, 0.5,
-4.161834, -4.039208, -2, 1, -0.5, 0.5, 0.5,
-4.161834, -4.039208, -2, 1, 1.5, 0.5, 0.5,
-4.161834, -4.039208, -2, 0, 1.5, 0.5, 0.5,
-4.161834, -4.039208, 0, 0, -0.5, 0.5, 0.5,
-4.161834, -4.039208, 0, 1, -0.5, 0.5, 0.5,
-4.161834, -4.039208, 0, 1, 1.5, 0.5, 0.5,
-4.161834, -4.039208, 0, 0, 1.5, 0.5, 0.5,
-4.161834, -4.039208, 2, 0, -0.5, 0.5, 0.5,
-4.161834, -4.039208, 2, 1, -0.5, 0.5, 0.5,
-4.161834, -4.039208, 2, 1, 1.5, 0.5, 0.5,
-4.161834, -4.039208, 2, 0, 1.5, 0.5, 0.5,
-4.161834, -4.039208, 4, 0, -0.5, 0.5, 0.5,
-4.161834, -4.039208, 4, 1, -0.5, 0.5, 0.5,
-4.161834, -4.039208, 4, 1, 1.5, 0.5, 0.5,
-4.161834, -4.039208, 4, 0, 1.5, 0.5, 0.5
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
-3.583025, -3.515077, -5.202444,
-3.583025, 3.47333, -5.202444,
-3.583025, -3.515077, 5.808026,
-3.583025, 3.47333, 5.808026,
-3.583025, -3.515077, -5.202444,
-3.583025, -3.515077, 5.808026,
-3.583025, 3.47333, -5.202444,
-3.583025, 3.47333, 5.808026,
-3.583025, -3.515077, -5.202444,
4.134429, -3.515077, -5.202444,
-3.583025, -3.515077, 5.808026,
4.134429, -3.515077, 5.808026,
-3.583025, 3.47333, -5.202444,
4.134429, 3.47333, -5.202444,
-3.583025, 3.47333, 5.808026,
4.134429, 3.47333, 5.808026,
4.134429, -3.515077, -5.202444,
4.134429, 3.47333, -5.202444,
4.134429, -3.515077, 5.808026,
4.134429, 3.47333, 5.808026,
4.134429, -3.515077, -5.202444,
4.134429, -3.515077, 5.808026,
4.134429, 3.47333, -5.202444,
4.134429, 3.47333, 5.808026
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
var radius = 8.091654;
var distance = 36.00068;
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
mvMatrix.translate( -0.2757019, 0.02087379, -0.3027909 );
mvMatrix.scale( 1.133645, 1.25191, 0.7945941 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.00068);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Methidathion<-read.table("Methidathion.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methidathion$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methidathion' not found
```

```r
y<-Methidathion$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methidathion' not found
```

```r
z<-Methidathion$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methidathion' not found
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
-3.470635, 0.9601693, -1.721377, 0, 0, 1, 1, 1,
-3.287514, -0.2799845, -1.59242, 1, 0, 0, 1, 1,
-2.594682, 0.04460074, -1.490797, 1, 0, 0, 1, 1,
-2.493163, -2.153, -2.365787, 1, 0, 0, 1, 1,
-2.468393, -0.06622071, 1.479671, 1, 0, 0, 1, 1,
-2.425809, 0.5033753, -2.206594, 1, 0, 0, 1, 1,
-2.345244, -0.9707174, -1.204005, 0, 0, 0, 1, 1,
-2.28263, -1.035724, -3.607162, 0, 0, 0, 1, 1,
-2.282087, -0.8230165, -1.389586, 0, 0, 0, 1, 1,
-2.266579, 2.737605, -1.410521, 0, 0, 0, 1, 1,
-2.254375, 0.7300898, -1.776515, 0, 0, 0, 1, 1,
-2.219639, 0.02254085, -0.9795454, 0, 0, 0, 1, 1,
-2.205156, 0.3092134, -1.940219, 0, 0, 0, 1, 1,
-2.183252, -0.520896, -0.6132582, 1, 1, 1, 1, 1,
-2.181046, 0.2556317, -3.135889, 1, 1, 1, 1, 1,
-2.173938, -0.3769708, -0.9272789, 1, 1, 1, 1, 1,
-2.159867, -0.05539665, -0.6440419, 1, 1, 1, 1, 1,
-2.158607, 1.809938, -1.894958, 1, 1, 1, 1, 1,
-2.132619, 0.2042643, -0.9645433, 1, 1, 1, 1, 1,
-2.111139, -0.3791149, -0.6767803, 1, 1, 1, 1, 1,
-2.09857, -1.238788, -1.691015, 1, 1, 1, 1, 1,
-2.082427, -0.2025999, -2.380811, 1, 1, 1, 1, 1,
-2.060663, 0.4364105, -1.045923, 1, 1, 1, 1, 1,
-2.053299, -0.6678622, -1.062175, 1, 1, 1, 1, 1,
-2.045263, -0.7058222, -2.189162, 1, 1, 1, 1, 1,
-2.043036, 1.019166, -0.6777142, 1, 1, 1, 1, 1,
-2.019791, 1.545665, 0.619987, 1, 1, 1, 1, 1,
-1.995432, 0.3781937, -2.121453, 1, 1, 1, 1, 1,
-1.989871, 1.416234, -2.667764, 0, 0, 1, 1, 1,
-1.959278, -1.028789, -1.819442, 1, 0, 0, 1, 1,
-1.926727, 0.304518, -2.957138, 1, 0, 0, 1, 1,
-1.90316, -0.5565073, -2.002859, 1, 0, 0, 1, 1,
-1.901606, -0.5472794, -0.4011525, 1, 0, 0, 1, 1,
-1.882674, -1.128472, -2.0226, 1, 0, 0, 1, 1,
-1.878383, -0.3190541, -2.421809, 0, 0, 0, 1, 1,
-1.817746, -0.5657809, -3.786438, 0, 0, 0, 1, 1,
-1.797992, -0.6356829, -0.9194826, 0, 0, 0, 1, 1,
-1.782867, -0.2490516, -0.9409027, 0, 0, 0, 1, 1,
-1.782673, 1.238237, -1.222552, 0, 0, 0, 1, 1,
-1.775654, -0.5472135, -1.730599, 0, 0, 0, 1, 1,
-1.753189, 0.3378759, -1.493679, 0, 0, 0, 1, 1,
-1.749782, -0.9133254, -0.7069459, 1, 1, 1, 1, 1,
-1.74724, -0.774062, -2.746888, 1, 1, 1, 1, 1,
-1.743617, 0.7824226, -1.000944, 1, 1, 1, 1, 1,
-1.729056, 1.177154, -1.151183, 1, 1, 1, 1, 1,
-1.725837, -0.05041777, -0.4724613, 1, 1, 1, 1, 1,
-1.701375, 1.247772, 1.09269, 1, 1, 1, 1, 1,
-1.697865, -0.5876522, -3.343339, 1, 1, 1, 1, 1,
-1.685111, 0.2259114, -2.147615, 1, 1, 1, 1, 1,
-1.682394, 1.099673, -0.5074931, 1, 1, 1, 1, 1,
-1.675499, 0.2339276, -0.2485705, 1, 1, 1, 1, 1,
-1.660265, -0.754307, -2.880764, 1, 1, 1, 1, 1,
-1.659528, 0.5517213, 0.3834119, 1, 1, 1, 1, 1,
-1.657718, 0.3547537, -2.092228, 1, 1, 1, 1, 1,
-1.608853, -0.8825247, -1.612298, 1, 1, 1, 1, 1,
-1.60254, 0.994923, -2.107292, 1, 1, 1, 1, 1,
-1.585704, 0.3248372, -1.537444, 0, 0, 1, 1, 1,
-1.583452, -1.865512, -1.391029, 1, 0, 0, 1, 1,
-1.571856, -0.5961592, -2.275741, 1, 0, 0, 1, 1,
-1.566489, 1.259219, -0.6683837, 1, 0, 0, 1, 1,
-1.533082, 1.177062, -0.5396905, 1, 0, 0, 1, 1,
-1.528476, -1.262934, -3.005323, 1, 0, 0, 1, 1,
-1.521405, -2.433053, -2.258384, 0, 0, 0, 1, 1,
-1.509258, -0.9509643, -2.689862, 0, 0, 0, 1, 1,
-1.497224, -0.9177122, -3.709191, 0, 0, 0, 1, 1,
-1.494189, -0.3421853, -1.779013, 0, 0, 0, 1, 1,
-1.483963, 1.307466, -1.319114, 0, 0, 0, 1, 1,
-1.464576, -1.250695, -0.9807547, 0, 0, 0, 1, 1,
-1.45076, -0.3923212, -0.3015712, 0, 0, 0, 1, 1,
-1.440225, -0.2781972, -2.705691, 1, 1, 1, 1, 1,
-1.430108, 0.7701876, -0.105245, 1, 1, 1, 1, 1,
-1.412097, 1.213987, -1.581412, 1, 1, 1, 1, 1,
-1.411685, -0.2338073, -2.477382, 1, 1, 1, 1, 1,
-1.411036, -1.200331, -2.455401, 1, 1, 1, 1, 1,
-1.40782, -2.130398, -3.837212, 1, 1, 1, 1, 1,
-1.404834, -1.261493, -1.219829, 1, 1, 1, 1, 1,
-1.398153, 1.36232, 1.270441, 1, 1, 1, 1, 1,
-1.37897, 0.4419302, -1.553693, 1, 1, 1, 1, 1,
-1.370498, 2.240525, -1.530561, 1, 1, 1, 1, 1,
-1.363168, -1.02206, -1.276615, 1, 1, 1, 1, 1,
-1.354714, -0.3766523, -0.0914613, 1, 1, 1, 1, 1,
-1.351011, 0.771028, -1.467381, 1, 1, 1, 1, 1,
-1.35068, -0.6104323, -1.554174, 1, 1, 1, 1, 1,
-1.347059, 0.931449, -0.9921907, 1, 1, 1, 1, 1,
-1.344244, -0.6163555, -2.31942, 0, 0, 1, 1, 1,
-1.320104, 0.7256351, 0.09866331, 1, 0, 0, 1, 1,
-1.318641, 0.06270714, -2.583293, 1, 0, 0, 1, 1,
-1.313353, -1.431, -1.850066, 1, 0, 0, 1, 1,
-1.310316, 0.9300017, -2.260346, 1, 0, 0, 1, 1,
-1.293056, -0.7503158, -1.547401, 1, 0, 0, 1, 1,
-1.281222, 0.8042849, 0.4891866, 0, 0, 0, 1, 1,
-1.27586, -0.4585785, -2.202723, 0, 0, 0, 1, 1,
-1.275365, -0.7686464, -1.596077, 0, 0, 0, 1, 1,
-1.27012, -0.0516492, -0.6173519, 0, 0, 0, 1, 1,
-1.266562, 0.2676669, -2.178796, 0, 0, 0, 1, 1,
-1.256018, -1.212003, -2.926505, 0, 0, 0, 1, 1,
-1.250437, 1.359606, -0.7596337, 0, 0, 0, 1, 1,
-1.24838, -0.3097864, -1.423777, 1, 1, 1, 1, 1,
-1.245258, -2.658016, -2.142917, 1, 1, 1, 1, 1,
-1.241448, 0.4681822, -1.56964, 1, 1, 1, 1, 1,
-1.227495, -1.646887, -2.003607, 1, 1, 1, 1, 1,
-1.226148, 0.5717271, -1.249317, 1, 1, 1, 1, 1,
-1.225028, -1.027048, -3.133355, 1, 1, 1, 1, 1,
-1.221254, 0.3956597, -0.5239249, 1, 1, 1, 1, 1,
-1.219475, 0.8474295, -2.349291, 1, 1, 1, 1, 1,
-1.218325, -0.8148258, -4.582036, 1, 1, 1, 1, 1,
-1.214704, 1.422421, -0.1579624, 1, 1, 1, 1, 1,
-1.212423, 0.8223423, 0.4175306, 1, 1, 1, 1, 1,
-1.208797, -0.007724202, -2.216465, 1, 1, 1, 1, 1,
-1.204541, 0.2933353, -0.7317116, 1, 1, 1, 1, 1,
-1.198977, 0.7610887, -0.01168182, 1, 1, 1, 1, 1,
-1.197619, -0.2829144, -1.686183, 1, 1, 1, 1, 1,
-1.19733, 0.3121813, -0.87571, 0, 0, 1, 1, 1,
-1.196198, -0.9444982, -2.240415, 1, 0, 0, 1, 1,
-1.195402, -2.009474, -2.923819, 1, 0, 0, 1, 1,
-1.188909, 2.05304, -2.027057, 1, 0, 0, 1, 1,
-1.188087, 0.5119594, -2.428778, 1, 0, 0, 1, 1,
-1.187691, 0.2063336, -2.075191, 1, 0, 0, 1, 1,
-1.184013, -1.0511, -2.702993, 0, 0, 0, 1, 1,
-1.173314, 0.07881548, -1.845886, 0, 0, 0, 1, 1,
-1.172707, -1.403778, -1.253581, 0, 0, 0, 1, 1,
-1.172513, -0.9950172, -1.44163, 0, 0, 0, 1, 1,
-1.153002, 0.8272669, -1.597753, 0, 0, 0, 1, 1,
-1.150121, 0.04695411, -0.9775636, 0, 0, 0, 1, 1,
-1.146314, 1.287597, 0.574712, 0, 0, 0, 1, 1,
-1.140509, -0.7632397, -2.787699, 1, 1, 1, 1, 1,
-1.139857, -1.077742, -2.816934, 1, 1, 1, 1, 1,
-1.133242, 0.2180415, -3.957849, 1, 1, 1, 1, 1,
-1.13133, 2.026695, -0.7893206, 1, 1, 1, 1, 1,
-1.122907, -1.376006, -1.061887, 1, 1, 1, 1, 1,
-1.117864, -1.1834, -2.851062, 1, 1, 1, 1, 1,
-1.097592, 0.853964, -0.9111977, 1, 1, 1, 1, 1,
-1.091724, 0.3550164, -1.685301, 1, 1, 1, 1, 1,
-1.091225, 1.069405, 0.867874, 1, 1, 1, 1, 1,
-1.079162, -0.4862532, -2.793034, 1, 1, 1, 1, 1,
-1.07897, 1.476804, -2.083903, 1, 1, 1, 1, 1,
-1.070433, 1.368434, -1.254705, 1, 1, 1, 1, 1,
-1.065055, -0.4603574, -2.423223, 1, 1, 1, 1, 1,
-1.063344, -0.9217882, -2.752476, 1, 1, 1, 1, 1,
-1.061826, 0.1490298, 0.2329731, 1, 1, 1, 1, 1,
-1.030767, 0.774856, -0.1337887, 0, 0, 1, 1, 1,
-1.028765, 0.7805182, -0.9797809, 1, 0, 0, 1, 1,
-1.01753, 0.6181614, -0.8786945, 1, 0, 0, 1, 1,
-1.017199, -1.366558, -3.761496, 1, 0, 0, 1, 1,
-1.01708, -0.6068034, -2.722524, 1, 0, 0, 1, 1,
-1.013082, 0.2954779, -1.674588, 1, 0, 0, 1, 1,
-1.010609, 0.08616555, -0.3458145, 0, 0, 0, 1, 1,
-1.008458, -1.360258, -3.488588, 0, 0, 0, 1, 1,
-1.008148, 0.7057537, -0.3795395, 0, 0, 0, 1, 1,
-1.007556, -0.5570115, -0.9618271, 0, 0, 0, 1, 1,
-1.007255, 0.7900845, -2.049174, 0, 0, 0, 1, 1,
-1.004752, -0.6699081, -1.564611, 0, 0, 0, 1, 1,
-0.994459, -2.094179, -3.257748, 0, 0, 0, 1, 1,
-0.9862018, -0.2656768, -2.840888, 1, 1, 1, 1, 1,
-0.9751225, 0.4601992, -0.4728889, 1, 1, 1, 1, 1,
-0.9719759, -0.3395396, -2.853541, 1, 1, 1, 1, 1,
-0.9565312, -0.7131169, -1.059075, 1, 1, 1, 1, 1,
-0.9563637, 1.478247, 0.658785, 1, 1, 1, 1, 1,
-0.9554646, 0.1584661, -1.665384, 1, 1, 1, 1, 1,
-0.953253, 0.6244743, 0.2199052, 1, 1, 1, 1, 1,
-0.9468498, 0.3754925, -0.8219586, 1, 1, 1, 1, 1,
-0.9429734, -0.3649013, -2.970863, 1, 1, 1, 1, 1,
-0.934884, 0.3034321, -0.8677394, 1, 1, 1, 1, 1,
-0.9325397, 0.682092, -0.6240622, 1, 1, 1, 1, 1,
-0.9305522, 0.6138264, -1.719639, 1, 1, 1, 1, 1,
-0.9279485, 1.059915, 0.6102738, 1, 1, 1, 1, 1,
-0.9226075, -0.1310967, -3.417352, 1, 1, 1, 1, 1,
-0.9194224, 1.155907, -0.01029679, 1, 1, 1, 1, 1,
-0.9192785, -1.103115, -2.570185, 0, 0, 1, 1, 1,
-0.914123, 0.5855769, 1.434849, 1, 0, 0, 1, 1,
-0.9100372, 0.4620309, -0.7325991, 1, 0, 0, 1, 1,
-0.9072337, 0.9695397, -1.587052, 1, 0, 0, 1, 1,
-0.9053425, 1.418016, 1.641877, 1, 0, 0, 1, 1,
-0.894095, 1.370223, -1.256319, 1, 0, 0, 1, 1,
-0.8898594, 0.1051445, -2.417662, 0, 0, 0, 1, 1,
-0.8895896, 0.2096192, -0.6750311, 0, 0, 0, 1, 1,
-0.8847699, -0.9034221, -3.012461, 0, 0, 0, 1, 1,
-0.8824465, 0.7486863, 0.4524913, 0, 0, 0, 1, 1,
-0.8770629, 0.07868609, -1.283452, 0, 0, 0, 1, 1,
-0.8652889, 0.7107005, -0.6244643, 0, 0, 0, 1, 1,
-0.8647928, 0.9682159, -0.2332156, 0, 0, 0, 1, 1,
-0.8637785, -0.03079112, -3.276957, 1, 1, 1, 1, 1,
-0.8618, -2.073201, -2.043651, 1, 1, 1, 1, 1,
-0.8589404, -0.1234522, -2.872902, 1, 1, 1, 1, 1,
-0.8524135, -0.4547374, -2.2674, 1, 1, 1, 1, 1,
-0.8516372, 0.6607245, -1.533185, 1, 1, 1, 1, 1,
-0.843457, 1.611428, 1.066687, 1, 1, 1, 1, 1,
-0.8360929, 0.6788736, -1.160777, 1, 1, 1, 1, 1,
-0.8351345, 0.4292324, -0.8049893, 1, 1, 1, 1, 1,
-0.8318647, 0.0746742, -2.614516, 1, 1, 1, 1, 1,
-0.8315756, 0.4923641, -0.2363839, 1, 1, 1, 1, 1,
-0.830094, -1.644713, -4.161209, 1, 1, 1, 1, 1,
-0.8272234, 0.1980715, -1.424238, 1, 1, 1, 1, 1,
-0.8235958, 0.04759143, -2.585405, 1, 1, 1, 1, 1,
-0.8227629, 0.4238822, -0.254597, 1, 1, 1, 1, 1,
-0.8156455, -0.4003094, -1.774686, 1, 1, 1, 1, 1,
-0.8146481, 0.701283, 0.5282896, 0, 0, 1, 1, 1,
-0.811487, 1.259046, -1.347165, 1, 0, 0, 1, 1,
-0.8098248, 3.371557, -0.04418977, 1, 0, 0, 1, 1,
-0.8063251, -0.06125593, 0.03940742, 1, 0, 0, 1, 1,
-0.8055792, -0.4654378, -3.133834, 1, 0, 0, 1, 1,
-0.8006617, 1.284709, 1.230366, 1, 0, 0, 1, 1,
-0.7993127, 0.4558041, -0.864113, 0, 0, 0, 1, 1,
-0.797957, -0.3515913, -0.8206068, 0, 0, 0, 1, 1,
-0.7931926, -0.9888743, -2.32859, 0, 0, 0, 1, 1,
-0.7913725, 0.02396193, -0.4070481, 0, 0, 0, 1, 1,
-0.7907945, -0.02256458, 0.9412088, 0, 0, 0, 1, 1,
-0.781777, 1.050378, -1.083567, 0, 0, 0, 1, 1,
-0.7804232, -0.7076525, -2.414728, 0, 0, 0, 1, 1,
-0.7753125, 1.796709, -0.9645495, 1, 1, 1, 1, 1,
-0.7747315, -0.3410736, -2.861338, 1, 1, 1, 1, 1,
-0.7740507, 0.08554035, -0.4052534, 1, 1, 1, 1, 1,
-0.7644833, -0.8891488, 0.3381768, 1, 1, 1, 1, 1,
-0.7626565, -1.086619, -4.014582, 1, 1, 1, 1, 1,
-0.7623321, -0.2503359, -3.532538, 1, 1, 1, 1, 1,
-0.7518935, -1.124227, -2.40688, 1, 1, 1, 1, 1,
-0.7463888, 0.8444168, 0.06783409, 1, 1, 1, 1, 1,
-0.7461905, 0.6060238, -0.5891104, 1, 1, 1, 1, 1,
-0.7461047, 0.5018377, -1.938838, 1, 1, 1, 1, 1,
-0.7355989, -1.606435, -3.484861, 1, 1, 1, 1, 1,
-0.7300655, 1.784972, -0.12851, 1, 1, 1, 1, 1,
-0.7228345, -0.2324956, -2.158815, 1, 1, 1, 1, 1,
-0.7216126, 0.07857585, -1.812003, 1, 1, 1, 1, 1,
-0.7200834, -0.9858242, -2.582425, 1, 1, 1, 1, 1,
-0.7197883, 0.948991, 0.4957398, 0, 0, 1, 1, 1,
-0.7151147, -2.341557, -3.553589, 1, 0, 0, 1, 1,
-0.7092913, -1.644152, -2.741904, 1, 0, 0, 1, 1,
-0.708831, -1.162549, -2.289994, 1, 0, 0, 1, 1,
-0.7061215, 1.005478, 0.5419829, 1, 0, 0, 1, 1,
-0.7049085, -0.1656705, -4.190127, 1, 0, 0, 1, 1,
-0.7029071, -1.50544, -2.012913, 0, 0, 0, 1, 1,
-0.7007064, 0.6820639, -1.667666, 0, 0, 0, 1, 1,
-0.6981205, -1.655293, -4.636551, 0, 0, 0, 1, 1,
-0.6958685, -0.2560679, -2.353928, 0, 0, 0, 1, 1,
-0.6947852, -0.04405334, -1.243151, 0, 0, 0, 1, 1,
-0.693854, 1.238705, -1.198539, 0, 0, 0, 1, 1,
-0.6904956, -0.9904062, -0.7976313, 0, 0, 0, 1, 1,
-0.6900135, 0.2356625, -3.560953, 1, 1, 1, 1, 1,
-0.6870059, -0.3013602, -3.441106, 1, 1, 1, 1, 1,
-0.6857578, 1.151797, -0.6182268, 1, 1, 1, 1, 1,
-0.6791163, -0.04571886, -1.100467, 1, 1, 1, 1, 1,
-0.6741898, -1.042614, -0.1951165, 1, 1, 1, 1, 1,
-0.6712095, 1.717624, 0.5777378, 1, 1, 1, 1, 1,
-0.6677412, 1.58689, -0.2245162, 1, 1, 1, 1, 1,
-0.6626892, -0.6786535, -1.562033, 1, 1, 1, 1, 1,
-0.6623119, 0.2017074, -1.347442, 1, 1, 1, 1, 1,
-0.6542122, 0.4322349, -1.396446, 1, 1, 1, 1, 1,
-0.6447963, -0.2907312, -1.236887, 1, 1, 1, 1, 1,
-0.6444819, 0.3439001, -1.193556, 1, 1, 1, 1, 1,
-0.6438225, 1.284263, -2.103446, 1, 1, 1, 1, 1,
-0.6401829, -1.026245, -3.556462, 1, 1, 1, 1, 1,
-0.6380212, 0.2468176, -2.844227, 1, 1, 1, 1, 1,
-0.6368138, 1.204525, 0.07447763, 0, 0, 1, 1, 1,
-0.6363444, 0.3553371, -0.6264837, 1, 0, 0, 1, 1,
-0.6343918, 1.021451, 0.8759443, 1, 0, 0, 1, 1,
-0.6322389, -1.620542, -2.952313, 1, 0, 0, 1, 1,
-0.6315137, -0.5475572, -1.277036, 1, 0, 0, 1, 1,
-0.6313968, 2.808461, -0.9094267, 1, 0, 0, 1, 1,
-0.6302936, -0.1247637, -0.7004516, 0, 0, 0, 1, 1,
-0.6284881, -0.9878537, -2.939071, 0, 0, 0, 1, 1,
-0.6284437, 0.1374054, -1.486884, 0, 0, 0, 1, 1,
-0.6151577, -2.326394, -4.194726, 0, 0, 0, 1, 1,
-0.6034415, -0.1499532, -1.06554, 0, 0, 0, 1, 1,
-0.5946172, -1.710924, -0.6664195, 0, 0, 0, 1, 1,
-0.5942867, 1.059094, -0.5407701, 0, 0, 0, 1, 1,
-0.5830522, 0.7243115, -0.710807, 1, 1, 1, 1, 1,
-0.577075, -0.6031699, -1.323754, 1, 1, 1, 1, 1,
-0.5733562, -0.8512315, -3.616048, 1, 1, 1, 1, 1,
-0.5712896, -0.06667716, -0.953217, 1, 1, 1, 1, 1,
-0.5712322, -1.866159, -2.819823, 1, 1, 1, 1, 1,
-0.5662904, 1.935917, -1.353872, 1, 1, 1, 1, 1,
-0.5639099, -0.241846, -2.385874, 1, 1, 1, 1, 1,
-0.5616838, 0.9507081, -0.637659, 1, 1, 1, 1, 1,
-0.5584285, 0.847724, -1.820142, 1, 1, 1, 1, 1,
-0.5578238, -0.7617865, -2.98304, 1, 1, 1, 1, 1,
-0.5573034, 1.199101, -0.5838993, 1, 1, 1, 1, 1,
-0.5550338, -0.5536029, -1.808148, 1, 1, 1, 1, 1,
-0.5539899, -1.471396, -1.529944, 1, 1, 1, 1, 1,
-0.5537288, 0.5669342, -1.111636, 1, 1, 1, 1, 1,
-0.5515049, -1.075484, -1.457012, 1, 1, 1, 1, 1,
-0.5511049, 0.1755058, 0.015403, 0, 0, 1, 1, 1,
-0.5480189, 0.1894155, -1.947549, 1, 0, 0, 1, 1,
-0.545612, -0.001141681, -0.4067934, 1, 0, 0, 1, 1,
-0.5454195, 0.7894451, -0.9809031, 1, 0, 0, 1, 1,
-0.544148, 1.09975, 1.07115, 1, 0, 0, 1, 1,
-0.5369989, 1.226117, -1.1537, 1, 0, 0, 1, 1,
-0.5356057, -0.4213857, -1.562075, 0, 0, 0, 1, 1,
-0.5346372, -0.8033637, -1.832639, 0, 0, 0, 1, 1,
-0.5207546, 1.409925, 0.9874896, 0, 0, 0, 1, 1,
-0.5195477, 0.5707265, -0.4000024, 0, 0, 0, 1, 1,
-0.5175133, -0.1661141, -2.279609, 0, 0, 0, 1, 1,
-0.5172412, -0.8016697, -1.807583, 0, 0, 0, 1, 1,
-0.5150635, -0.7699441, -4.066442, 0, 0, 0, 1, 1,
-0.5141333, 0.5293742, -0.2162454, 1, 1, 1, 1, 1,
-0.5129976, -0.3314179, -1.49469, 1, 1, 1, 1, 1,
-0.5106074, 1.14763, 0.1260385, 1, 1, 1, 1, 1,
-0.5078837, 0.5711535, -3.000454, 1, 1, 1, 1, 1,
-0.5068144, 1.285447, -0.2144292, 1, 1, 1, 1, 1,
-0.5055379, 1.346073, -0.7131816, 1, 1, 1, 1, 1,
-0.5045077, -1.649054, -4.060543, 1, 1, 1, 1, 1,
-0.5028524, 0.1320764, -0.1157771, 1, 1, 1, 1, 1,
-0.5027636, 0.5352578, -1.270064, 1, 1, 1, 1, 1,
-0.4988707, 0.9886533, -0.4536099, 1, 1, 1, 1, 1,
-0.4914869, -0.09910112, -3.037748, 1, 1, 1, 1, 1,
-0.4897651, -0.243288, -1.411032, 1, 1, 1, 1, 1,
-0.4893578, 1.490953, 1.254832, 1, 1, 1, 1, 1,
-0.4882965, -1.415583, -4.37584, 1, 1, 1, 1, 1,
-0.4853299, -0.02082597, -1.74334, 1, 1, 1, 1, 1,
-0.4821713, 0.1962887, -0.6881092, 0, 0, 1, 1, 1,
-0.4766906, 1.303824, 0.6159658, 1, 0, 0, 1, 1,
-0.4766841, 1.635703, 0.1983848, 1, 0, 0, 1, 1,
-0.4766821, 0.5254374, -3.206859, 1, 0, 0, 1, 1,
-0.4754944, -0.338227, -0.9485396, 1, 0, 0, 1, 1,
-0.474944, -2.040857, -2.181014, 1, 0, 0, 1, 1,
-0.4680362, 0.9565279, -0.05288785, 0, 0, 0, 1, 1,
-0.4679936, 0.1038268, -2.177386, 0, 0, 0, 1, 1,
-0.4660847, -1.7439, -2.709615, 0, 0, 0, 1, 1,
-0.4605854, -0.2744379, -1.735256, 0, 0, 0, 1, 1,
-0.4556761, 1.163686, -2.783495, 0, 0, 0, 1, 1,
-0.4534563, -0.3161572, -2.61693, 0, 0, 0, 1, 1,
-0.4528907, -1.000335, -1.589953, 0, 0, 0, 1, 1,
-0.4513542, 1.991164, 1.098853, 1, 1, 1, 1, 1,
-0.4481176, -0.7139707, -1.47504, 1, 1, 1, 1, 1,
-0.4424527, 0.1050469, -2.063918, 1, 1, 1, 1, 1,
-0.431117, 1.271378, 0.1337071, 1, 1, 1, 1, 1,
-0.4305196, -0.3605, -3.063938, 1, 1, 1, 1, 1,
-0.4287935, -0.08284915, -2.440487, 1, 1, 1, 1, 1,
-0.4228815, 1.022006, -0.09425178, 1, 1, 1, 1, 1,
-0.4205564, 1.312921, 0.01998074, 1, 1, 1, 1, 1,
-0.4200177, -3.303094, -2.916481, 1, 1, 1, 1, 1,
-0.4197742, 0.1606481, -2.020566, 1, 1, 1, 1, 1,
-0.4171579, -0.9978195, -2.164441, 1, 1, 1, 1, 1,
-0.416787, -0.3676262, -3.321453, 1, 1, 1, 1, 1,
-0.4093438, 0.3077531, -0.1891582, 1, 1, 1, 1, 1,
-0.4051626, 0.05139428, -2.095454, 1, 1, 1, 1, 1,
-0.4042256, 0.01482661, -2.480218, 1, 1, 1, 1, 1,
-0.4007606, -0.5609009, -3.575317, 0, 0, 1, 1, 1,
-0.4005062, -1.581781, -1.685128, 1, 0, 0, 1, 1,
-0.3995678, 0.8215732, -0.09081089, 1, 0, 0, 1, 1,
-0.3993617, 0.8967922, -0.03751096, 1, 0, 0, 1, 1,
-0.3976133, -0.7894934, -2.366248, 1, 0, 0, 1, 1,
-0.3972111, -1.241243, -4.031198, 1, 0, 0, 1, 1,
-0.3968792, 0.4567954, -0.07693871, 0, 0, 0, 1, 1,
-0.3949785, -0.4631222, -3.527548, 0, 0, 0, 1, 1,
-0.3948576, -0.1446909, -1.298176, 0, 0, 0, 1, 1,
-0.3920047, -0.5410373, -4.503479, 0, 0, 0, 1, 1,
-0.3915913, -0.04812275, -2.439908, 0, 0, 0, 1, 1,
-0.3911354, -0.03287803, -2.033839, 0, 0, 0, 1, 1,
-0.3903633, 0.6402225, -2.04459, 0, 0, 0, 1, 1,
-0.3903578, -0.6281908, -2.1043, 1, 1, 1, 1, 1,
-0.3849243, 1.172215, -2.786156, 1, 1, 1, 1, 1,
-0.3839003, 0.9401107, -0.6619159, 1, 1, 1, 1, 1,
-0.3824643, 0.5021657, -0.2497713, 1, 1, 1, 1, 1,
-0.3741451, -0.3742009, -1.545851, 1, 1, 1, 1, 1,
-0.3736215, -1.485587, -4.299746, 1, 1, 1, 1, 1,
-0.3670084, 0.7957994, -1.76647, 1, 1, 1, 1, 1,
-0.3661117, 0.1201447, -2.26935, 1, 1, 1, 1, 1,
-0.3660663, 0.8206119, -0.3079564, 1, 1, 1, 1, 1,
-0.3655994, 1.327717, -3.091753, 1, 1, 1, 1, 1,
-0.3633624, -1.016149, -2.045848, 1, 1, 1, 1, 1,
-0.3616279, 0.8877146, -0.1812566, 1, 1, 1, 1, 1,
-0.3551118, 0.4696457, 0.5734148, 1, 1, 1, 1, 1,
-0.3545997, 0.2488433, -1.093731, 1, 1, 1, 1, 1,
-0.354253, 0.7141518, -1.038286, 1, 1, 1, 1, 1,
-0.3536831, 0.6412693, 1.039209, 0, 0, 1, 1, 1,
-0.3521057, 0.4944793, -0.9594758, 1, 0, 0, 1, 1,
-0.3518972, 0.9690884, -1.357654, 1, 0, 0, 1, 1,
-0.3510843, 0.5818442, 1.177279, 1, 0, 0, 1, 1,
-0.3476355, 0.6494054, -0.7464558, 1, 0, 0, 1, 1,
-0.3474855, -0.9911268, -3.877378, 1, 0, 0, 1, 1,
-0.3411347, -0.5895492, -1.484053, 0, 0, 0, 1, 1,
-0.3375854, -0.793614, -2.999975, 0, 0, 0, 1, 1,
-0.3372905, 1.443649, -0.4206316, 0, 0, 0, 1, 1,
-0.3366234, 0.6047519, -1.58665, 0, 0, 0, 1, 1,
-0.3301852, -0.5387715, -2.397006, 0, 0, 0, 1, 1,
-0.329846, 0.1301632, -3.148014, 0, 0, 0, 1, 1,
-0.3286875, 0.0922796, -0.8615119, 0, 0, 0, 1, 1,
-0.3163883, -0.1859716, -1.786904, 1, 1, 1, 1, 1,
-0.3118193, 1.052877, -0.7189505, 1, 1, 1, 1, 1,
-0.3106321, -0.2635226, -3.373535, 1, 1, 1, 1, 1,
-0.3044191, -0.5677363, -1.900457, 1, 1, 1, 1, 1,
-0.3031712, 1.031501, -0.3497007, 1, 1, 1, 1, 1,
-0.295298, -0.5744268, -3.745427, 1, 1, 1, 1, 1,
-0.2951937, -1.235996, -5.042098, 1, 1, 1, 1, 1,
-0.2941408, 0.4376219, -0.5473173, 1, 1, 1, 1, 1,
-0.2878986, -1.476425, -3.194813, 1, 1, 1, 1, 1,
-0.2792945, -1.633757, -3.691699, 1, 1, 1, 1, 1,
-0.2779733, 0.7449628, -1.393126, 1, 1, 1, 1, 1,
-0.2704858, -1.922628, -2.885467, 1, 1, 1, 1, 1,
-0.2633629, 1.725857, 0.4797613, 1, 1, 1, 1, 1,
-0.2631632, -0.3022383, -1.496595, 1, 1, 1, 1, 1,
-0.2622871, 1.143074, 0.05301219, 1, 1, 1, 1, 1,
-0.2574387, 0.09731876, -3.403701, 0, 0, 1, 1, 1,
-0.2571655, -1.296062, -3.242176, 1, 0, 0, 1, 1,
-0.2553281, -0.2005334, -2.293001, 1, 0, 0, 1, 1,
-0.2521372, 0.4919609, 0.7556802, 1, 0, 0, 1, 1,
-0.251998, -3.02994, -4.581965, 1, 0, 0, 1, 1,
-0.2457453, -0.9891499, -4.465513, 1, 0, 0, 1, 1,
-0.2452735, -0.6475837, -2.764757, 0, 0, 0, 1, 1,
-0.241023, 0.9955224, -1.166648, 0, 0, 0, 1, 1,
-0.2406233, -0.9902809, -2.890301, 0, 0, 0, 1, 1,
-0.2374609, -1.985846, -3.365974, 0, 0, 0, 1, 1,
-0.2262118, -0.6009262, -3.314313, 0, 0, 0, 1, 1,
-0.2235011, -1.328835, -3.100274, 0, 0, 0, 1, 1,
-0.2230701, 1.521885, 1.420848, 0, 0, 0, 1, 1,
-0.2206118, -1.012925, -2.323446, 1, 1, 1, 1, 1,
-0.2167203, -0.422555, -2.582926, 1, 1, 1, 1, 1,
-0.2158374, 1.120243, 0.8812774, 1, 1, 1, 1, 1,
-0.2053051, 1.163507, -0.2488928, 1, 1, 1, 1, 1,
-0.204689, 2.298388, -0.9598137, 1, 1, 1, 1, 1,
-0.2000178, -0.05933282, -4.958264, 1, 1, 1, 1, 1,
-0.199465, 0.4320619, -1.263396, 1, 1, 1, 1, 1,
-0.198629, 0.6970829, -1.458168, 1, 1, 1, 1, 1,
-0.1985954, -0.1116842, -2.591299, 1, 1, 1, 1, 1,
-0.1883772, 0.8307806, 0.7425735, 1, 1, 1, 1, 1,
-0.1822699, 1.808078, -1.122199, 1, 1, 1, 1, 1,
-0.1810098, -2.089331, -1.830386, 1, 1, 1, 1, 1,
-0.1801032, 0.0859879, -2.977007, 1, 1, 1, 1, 1,
-0.1780906, 1.196055, 1.704209, 1, 1, 1, 1, 1,
-0.1778329, -0.3250717, -2.183381, 1, 1, 1, 1, 1,
-0.1739011, 1.690359, -2.120172, 0, 0, 1, 1, 1,
-0.1733666, -0.8858571, -4.160834, 1, 0, 0, 1, 1,
-0.1709606, 1.072908, -1.161548, 1, 0, 0, 1, 1,
-0.1708646, -2.784655, -2.993153, 1, 0, 0, 1, 1,
-0.1687416, -0.4921626, -4.42283, 1, 0, 0, 1, 1,
-0.1598869, 0.1241902, -1.661362, 1, 0, 0, 1, 1,
-0.1589578, -0.06478763, -3.081947, 0, 0, 0, 1, 1,
-0.1579966, 1.500695, -0.9586571, 0, 0, 0, 1, 1,
-0.1576462, 0.5660579, 0.3939054, 0, 0, 0, 1, 1,
-0.1510319, 0.1076209, -0.9993939, 0, 0, 0, 1, 1,
-0.1451531, -0.7841287, -2.724661, 0, 0, 0, 1, 1,
-0.1425737, 0.6400926, -1.178625, 0, 0, 0, 1, 1,
-0.1393732, -0.01501067, -2.792381, 0, 0, 0, 1, 1,
-0.1387985, -0.9455315, -1.169661, 1, 1, 1, 1, 1,
-0.1369418, 0.9177784, 0.6002638, 1, 1, 1, 1, 1,
-0.1154375, 2.120311, -0.01213942, 1, 1, 1, 1, 1,
-0.1121714, -0.1316047, -2.386882, 1, 1, 1, 1, 1,
-0.1025526, 0.6044576, -1.456566, 1, 1, 1, 1, 1,
-0.1015076, 0.1295424, -1.783013, 1, 1, 1, 1, 1,
-0.09853577, 0.2404454, -0.2815968, 1, 1, 1, 1, 1,
-0.09800147, 0.2895482, 1.354254, 1, 1, 1, 1, 1,
-0.09758293, -0.6011039, -2.916124, 1, 1, 1, 1, 1,
-0.09065265, -0.8281249, -2.612034, 1, 1, 1, 1, 1,
-0.08719495, 0.8361284, 1.535778, 1, 1, 1, 1, 1,
-0.086352, 0.134002, -2.418026, 1, 1, 1, 1, 1,
-0.08564106, -1.230725, -3.53308, 1, 1, 1, 1, 1,
-0.08500322, 0.2132381, -0.6799232, 1, 1, 1, 1, 1,
-0.08344731, -0.08857109, -4.065221, 1, 1, 1, 1, 1,
-0.0815268, 0.720908, 0.7569176, 0, 0, 1, 1, 1,
-0.07954285, 1.097536, -0.2871415, 1, 0, 0, 1, 1,
-0.07805319, 0.04849539, -0.819694, 1, 0, 0, 1, 1,
-0.07418765, 0.9871258, -1.540469, 1, 0, 0, 1, 1,
-0.07375849, 0.3524117, -1.137925, 1, 0, 0, 1, 1,
-0.07281397, 0.9469597, -1.315328, 1, 0, 0, 1, 1,
-0.07024001, 0.7329007, 1.61193, 0, 0, 0, 1, 1,
-0.06728922, 0.3595753, 0.3425119, 0, 0, 0, 1, 1,
-0.06727593, 0.7195784, 0.5149931, 0, 0, 0, 1, 1,
-0.05884913, 0.4229704, -0.7371712, 0, 0, 0, 1, 1,
-0.05136905, -0.7052798, -4.572683, 0, 0, 0, 1, 1,
-0.04881714, -0.3692194, -2.413429, 0, 0, 0, 1, 1,
-0.04483754, 0.5683007, 0.008374549, 0, 0, 0, 1, 1,
-0.04359245, -0.4420021, -1.465792, 1, 1, 1, 1, 1,
-0.04026227, -0.7951245, -2.660629, 1, 1, 1, 1, 1,
-0.03653948, -0.2784012, -4.270273, 1, 1, 1, 1, 1,
-0.02960561, 0.8171768, 1.1719, 1, 1, 1, 1, 1,
-0.02788769, -0.6599324, -1.131673, 1, 1, 1, 1, 1,
-0.0198692, -1.399412, -4.703739, 1, 1, 1, 1, 1,
-0.01575593, 0.9665995, 0.1452896, 1, 1, 1, 1, 1,
-0.01429325, -0.5894155, -3.03233, 1, 1, 1, 1, 1,
-0.01297129, -0.4179619, -2.760541, 1, 1, 1, 1, 1,
-0.007835831, -0.741486, -2.977285, 1, 1, 1, 1, 1,
-0.007794636, 2.351411, -0.8952997, 1, 1, 1, 1, 1,
-0.007607266, 0.9592395, 1.700624, 1, 1, 1, 1, 1,
-0.00546805, 0.06736103, -0.3714699, 1, 1, 1, 1, 1,
-0.00478036, -0.8704818, -3.445072, 1, 1, 1, 1, 1,
-0.003663205, -1.066744, -2.703433, 1, 1, 1, 1, 1,
-0.002286524, -0.146901, -3.157775, 0, 0, 1, 1, 1,
0.001665416, -0.6074931, 5.647679, 1, 0, 0, 1, 1,
0.007951956, -0.5502419, 3.449489, 1, 0, 0, 1, 1,
0.01389567, -0.3308529, 4.365137, 1, 0, 0, 1, 1,
0.01581446, -0.8243507, 2.58737, 1, 0, 0, 1, 1,
0.01968649, 0.3070873, -0.4196826, 1, 0, 0, 1, 1,
0.02288474, 1.140071, 0.4742817, 0, 0, 0, 1, 1,
0.02622321, -0.8153008, 3.077046, 0, 0, 0, 1, 1,
0.02737594, 0.3430332, 0.1181064, 0, 0, 0, 1, 1,
0.03115107, -1.410169, 1.865871, 0, 0, 0, 1, 1,
0.03263768, 1.547928, -0.4665855, 0, 0, 0, 1, 1,
0.03370779, -0.5086895, 4.365585, 0, 0, 0, 1, 1,
0.0341529, 1.988608, -2.247907, 0, 0, 0, 1, 1,
0.03426088, 1.688727, -0.7200719, 1, 1, 1, 1, 1,
0.03610578, 0.7214503, -0.6218449, 1, 1, 1, 1, 1,
0.03638235, -0.02850324, 0.8847556, 1, 1, 1, 1, 1,
0.03868369, -1.372656, 1.472268, 1, 1, 1, 1, 1,
0.04049441, -0.7378774, 3.559477, 1, 1, 1, 1, 1,
0.04154767, -1.114707, 3.486756, 1, 1, 1, 1, 1,
0.04258492, 1.648969, 0.4209426, 1, 1, 1, 1, 1,
0.04525101, -0.02994125, 1.231412, 1, 1, 1, 1, 1,
0.045862, 0.3303834, 1.166558, 1, 1, 1, 1, 1,
0.0463323, 0.7927002, -1.122398, 1, 1, 1, 1, 1,
0.04860677, -0.9612371, 3.465944, 1, 1, 1, 1, 1,
0.04915059, 0.6252087, -0.8139176, 1, 1, 1, 1, 1,
0.04930948, 0.97632, 1.139061, 1, 1, 1, 1, 1,
0.04993495, -0.3499786, 3.700072, 1, 1, 1, 1, 1,
0.05029986, 0.7082778, -1.534206, 1, 1, 1, 1, 1,
0.05059134, 0.4839604, -0.5740687, 0, 0, 1, 1, 1,
0.06155236, -0.2445074, 4.164876, 1, 0, 0, 1, 1,
0.06231159, -1.790026, 0.836742, 1, 0, 0, 1, 1,
0.07243886, 0.08078125, 0.4833173, 1, 0, 0, 1, 1,
0.07290643, 0.702617, 1.261097, 1, 0, 0, 1, 1,
0.07402646, -0.3214515, 3.21176, 1, 0, 0, 1, 1,
0.07577107, 0.5375376, -1.003533, 0, 0, 0, 1, 1,
0.07930443, -0.02225877, 2.095284, 0, 0, 0, 1, 1,
0.08399318, -2.111376, 1.912834, 0, 0, 0, 1, 1,
0.08401736, 1.580438, -0.4011697, 0, 0, 0, 1, 1,
0.09247203, 1.460045, -0.6423109, 0, 0, 0, 1, 1,
0.09283774, -2.61773, 3.833132, 0, 0, 0, 1, 1,
0.09583794, 1.625703, -0.4382659, 0, 0, 0, 1, 1,
0.09606525, -0.6978596, 4.834408, 1, 1, 1, 1, 1,
0.09965275, -0.3812156, 5.322031, 1, 1, 1, 1, 1,
0.1013213, 1.087519, 0.7494079, 1, 1, 1, 1, 1,
0.1030786, -0.1124451, 3.625314, 1, 1, 1, 1, 1,
0.1046264, -0.4574399, 1.614798, 1, 1, 1, 1, 1,
0.1105461, -1.306687, 1.993956, 1, 1, 1, 1, 1,
0.1124769, 1.239202, -0.1903856, 1, 1, 1, 1, 1,
0.1129903, 1.202357, -1.133263, 1, 1, 1, 1, 1,
0.1157548, 0.865249, -1.434701, 1, 1, 1, 1, 1,
0.1166507, 2.290256, 0.1879046, 1, 1, 1, 1, 1,
0.1170552, -0.1324633, 4.138255, 1, 1, 1, 1, 1,
0.117953, -0.9880965, 2.497673, 1, 1, 1, 1, 1,
0.118057, -1.740847, 1.920785, 1, 1, 1, 1, 1,
0.1194726, -0.6929697, 2.405388, 1, 1, 1, 1, 1,
0.1204065, 1.571796, 2.164174, 1, 1, 1, 1, 1,
0.1274407, 0.4005015, -0.4151555, 0, 0, 1, 1, 1,
0.1277982, -0.9057503, 5.160554, 1, 0, 0, 1, 1,
0.1323458, 1.451171, -0.4872974, 1, 0, 0, 1, 1,
0.135904, -0.4242543, 1.656219, 1, 0, 0, 1, 1,
0.1401679, -1.125234, 5.044407, 1, 0, 0, 1, 1,
0.1445176, -0.537742, 2.59652, 1, 0, 0, 1, 1,
0.1577738, -0.8039885, 3.194184, 0, 0, 0, 1, 1,
0.15977, 1.178325, -0.8683844, 0, 0, 0, 1, 1,
0.1620205, 0.6055398, 0.3050607, 0, 0, 0, 1, 1,
0.1663679, -0.5644608, 1.819284, 0, 0, 0, 1, 1,
0.1755815, 1.730418, -0.8178523, 0, 0, 0, 1, 1,
0.176161, -1.195195, 3.34463, 0, 0, 0, 1, 1,
0.1782364, 0.5996207, -1.558573, 0, 0, 0, 1, 1,
0.1784379, 1.40493, 1.066535, 1, 1, 1, 1, 1,
0.1835458, 1.318316, 0.8124613, 1, 1, 1, 1, 1,
0.1837402, -0.1405878, 0.2881748, 1, 1, 1, 1, 1,
0.1846372, -0.8768926, 4.193016, 1, 1, 1, 1, 1,
0.1871714, -2.204184, 2.876992, 1, 1, 1, 1, 1,
0.1874442, 0.1581343, 0.4150012, 1, 1, 1, 1, 1,
0.1921162, 0.2911974, 1.680965, 1, 1, 1, 1, 1,
0.1939715, 1.927912, 0.9852725, 1, 1, 1, 1, 1,
0.1953098, -0.801213, 1.951922, 1, 1, 1, 1, 1,
0.1986904, 0.1364936, -0.553198, 1, 1, 1, 1, 1,
0.2006208, 1.605971, -1.901762, 1, 1, 1, 1, 1,
0.2044108, 0.8109476, -0.2903549, 1, 1, 1, 1, 1,
0.2048571, 0.5187525, -0.9848074, 1, 1, 1, 1, 1,
0.2050101, -0.04107533, 2.093413, 1, 1, 1, 1, 1,
0.2053941, -0.2575591, 2.649445, 1, 1, 1, 1, 1,
0.2061948, -0.3388342, 4.801702, 0, 0, 1, 1, 1,
0.2062266, 0.9522558, 0.1850783, 1, 0, 0, 1, 1,
0.2089306, -0.4541552, 2.977005, 1, 0, 0, 1, 1,
0.2096851, -0.7345736, 3.923965, 1, 0, 0, 1, 1,
0.2131725, 0.5145235, 0.8158858, 1, 0, 0, 1, 1,
0.2185818, 1.006188, -0.8126026, 1, 0, 0, 1, 1,
0.225836, -1.989339, 3.349694, 0, 0, 0, 1, 1,
0.2311981, -0.2524598, 2.124654, 0, 0, 0, 1, 1,
0.2328722, 1.278667, -0.7183391, 0, 0, 0, 1, 1,
0.2371161, -0.7263981, 3.310737, 0, 0, 0, 1, 1,
0.2376924, 1.051119, -0.4864046, 0, 0, 0, 1, 1,
0.2384128, 1.556575, 0.8812226, 0, 0, 0, 1, 1,
0.2400823, -0.9249704, 2.885775, 0, 0, 0, 1, 1,
0.2413539, 0.1940706, 2.653497, 1, 1, 1, 1, 1,
0.2418072, 0.05152534, 2.997779, 1, 1, 1, 1, 1,
0.2470295, 2.260193, -0.2359638, 1, 1, 1, 1, 1,
0.2539917, 0.001451658, 0.4232354, 1, 1, 1, 1, 1,
0.2551194, 0.003127234, 2.052534, 1, 1, 1, 1, 1,
0.2568794, 0.3605546, 0.1538632, 1, 1, 1, 1, 1,
0.2580465, -0.05931096, 1.643305, 1, 1, 1, 1, 1,
0.2581276, -0.300995, 3.66578, 1, 1, 1, 1, 1,
0.2586964, -0.8576598, 3.376134, 1, 1, 1, 1, 1,
0.262101, -0.1096709, 1.927546, 1, 1, 1, 1, 1,
0.2624919, -1.448376, 2.667056, 1, 1, 1, 1, 1,
0.2656057, -0.2612447, 3.255941, 1, 1, 1, 1, 1,
0.2660616, 0.6056753, 2.210179, 1, 1, 1, 1, 1,
0.2676902, -0.1849007, 3.008278, 1, 1, 1, 1, 1,
0.2678526, 0.02748928, 2.393887, 1, 1, 1, 1, 1,
0.2691286, -0.4436418, 2.849804, 0, 0, 1, 1, 1,
0.2704656, 0.1194664, 2.342172, 1, 0, 0, 1, 1,
0.2744411, 2.119729, 0.7596402, 1, 0, 0, 1, 1,
0.2746044, 0.7404838, 1.849929, 1, 0, 0, 1, 1,
0.2748051, -0.9725682, 1.956406, 1, 0, 0, 1, 1,
0.2757039, 1.517154, 0.6248813, 1, 0, 0, 1, 1,
0.2762253, -0.2852032, 3.984692, 0, 0, 0, 1, 1,
0.2784378, -0.5213339, 3.329851, 0, 0, 0, 1, 1,
0.2791366, 0.9025646, -0.338598, 0, 0, 0, 1, 1,
0.2800789, 1.443522, -0.1830744, 0, 0, 0, 1, 1,
0.2845429, 0.3221458, 1.53187, 0, 0, 0, 1, 1,
0.2846344, 1.151335, 0.1891376, 0, 0, 0, 1, 1,
0.2898967, -0.3194425, 0.547045, 0, 0, 0, 1, 1,
0.2916187, 0.7740101, 0.2788835, 1, 1, 1, 1, 1,
0.2936821, -1.151043, 2.782818, 1, 1, 1, 1, 1,
0.2938445, -0.9623259, 3.646328, 1, 1, 1, 1, 1,
0.2963344, 0.1923685, 0.7291437, 1, 1, 1, 1, 1,
0.297609, 0.8589888, 1.271741, 1, 1, 1, 1, 1,
0.3003306, 0.08633579, 1.499329, 1, 1, 1, 1, 1,
0.3092033, -0.8637016, 1.95108, 1, 1, 1, 1, 1,
0.3094823, -1.460341, 2.399926, 1, 1, 1, 1, 1,
0.3109384, -0.000719677, 1.523815, 1, 1, 1, 1, 1,
0.3172233, 0.2766771, 1.4013, 1, 1, 1, 1, 1,
0.3172908, 0.9719664, 0.9950376, 1, 1, 1, 1, 1,
0.3186125, -1.454031, 4.137458, 1, 1, 1, 1, 1,
0.3186153, 0.6154708, 0.9047801, 1, 1, 1, 1, 1,
0.318848, 0.01670364, 1.874702, 1, 1, 1, 1, 1,
0.3229613, -0.4066068, 3.789822, 1, 1, 1, 1, 1,
0.3257012, -0.04129586, 1.113831, 0, 0, 1, 1, 1,
0.3279372, 0.4009942, 0.4089174, 1, 0, 0, 1, 1,
0.3293078, 0.1675338, 1.45874, 1, 0, 0, 1, 1,
0.3315024, 0.240235, -0.006994462, 1, 0, 0, 1, 1,
0.3407339, -0.06630643, 3.55935, 1, 0, 0, 1, 1,
0.3465055, -1.611322, 4.000709, 1, 0, 0, 1, 1,
0.3479422, 0.8530556, 0.1433213, 0, 0, 0, 1, 1,
0.3491151, -2.505039, 3.414876, 0, 0, 0, 1, 1,
0.351724, -0.1950483, 1.339705, 0, 0, 0, 1, 1,
0.3537672, -0.513536, 1.887485, 0, 0, 0, 1, 1,
0.3540502, 0.6487067, 0.924149, 0, 0, 0, 1, 1,
0.36435, -0.5078557, 3.980806, 0, 0, 0, 1, 1,
0.3667638, 0.7765772, 0.2593126, 0, 0, 0, 1, 1,
0.3676304, -0.9677045, 2.762937, 1, 1, 1, 1, 1,
0.3734201, -0.2028607, 3.486378, 1, 1, 1, 1, 1,
0.375404, -0.2833555, 4.828733, 1, 1, 1, 1, 1,
0.3785251, -0.02224729, 1.145836, 1, 1, 1, 1, 1,
0.3831565, -1.894482, 2.165034, 1, 1, 1, 1, 1,
0.3841182, -0.275467, 1.856123, 1, 1, 1, 1, 1,
0.391615, 1.924424, -0.5330228, 1, 1, 1, 1, 1,
0.3919111, 1.66633, 0.8912169, 1, 1, 1, 1, 1,
0.3924949, -0.203737, 0.9757075, 1, 1, 1, 1, 1,
0.3928874, -0.17161, 1.209898, 1, 1, 1, 1, 1,
0.3936158, 1.195347, 1.334645, 1, 1, 1, 1, 1,
0.3978017, 1.175504, 1.331516, 1, 1, 1, 1, 1,
0.3984643, 1.077517, 0.2453266, 1, 1, 1, 1, 1,
0.4009616, 0.7079087, 0.7790079, 1, 1, 1, 1, 1,
0.4016451, -0.5078735, 1.211226, 1, 1, 1, 1, 1,
0.4026523, 0.9152601, 1.081296, 0, 0, 1, 1, 1,
0.4027411, 0.3095202, 2.259846, 1, 0, 0, 1, 1,
0.4036838, -0.5616222, 3.398491, 1, 0, 0, 1, 1,
0.4065249, -0.8845975, 2.662671, 1, 0, 0, 1, 1,
0.4079819, 1.665284, -0.7633185, 1, 0, 0, 1, 1,
0.4151857, -0.2700948, 1.070293, 1, 0, 0, 1, 1,
0.4180854, -0.8820388, 3.189221, 0, 0, 0, 1, 1,
0.4197937, 0.4483985, 0.2547444, 0, 0, 0, 1, 1,
0.4262316, 0.1050609, 0.3852983, 0, 0, 0, 1, 1,
0.4275032, -3.413304, 1.537021, 0, 0, 0, 1, 1,
0.4298275, 0.6234171, 0.5505338, 0, 0, 0, 1, 1,
0.4305316, -1.226909, 2.802415, 0, 0, 0, 1, 1,
0.433112, -0.7436391, 2.020262, 0, 0, 0, 1, 1,
0.433511, -1.506861, 3.054319, 1, 1, 1, 1, 1,
0.440589, -1.343126, 3.447873, 1, 1, 1, 1, 1,
0.4423468, -0.3064802, 0.5846218, 1, 1, 1, 1, 1,
0.4450993, 0.8065745, -0.1519761, 1, 1, 1, 1, 1,
0.4477279, -0.1395661, -0.6064354, 1, 1, 1, 1, 1,
0.4516282, 0.7498103, 2.258608, 1, 1, 1, 1, 1,
0.4661933, 0.9092926, -1.487329, 1, 1, 1, 1, 1,
0.4715472, -0.4162297, 2.795774, 1, 1, 1, 1, 1,
0.4748278, -1.158748, 2.50219, 1, 1, 1, 1, 1,
0.4786745, -1.163372, -0.09914893, 1, 1, 1, 1, 1,
0.4827079, 1.346471, 0.5889823, 1, 1, 1, 1, 1,
0.4870189, -0.9172516, 2.880254, 1, 1, 1, 1, 1,
0.4882061, 1.213405, -0.7608881, 1, 1, 1, 1, 1,
0.4948882, 0.5009044, 1.050005, 1, 1, 1, 1, 1,
0.4957702, 0.5047399, -0.3609022, 1, 1, 1, 1, 1,
0.4993474, 0.5859047, 2.217715, 0, 0, 1, 1, 1,
0.5049575, 0.689536, -0.0556941, 1, 0, 0, 1, 1,
0.5051783, -0.2421775, 1.1157, 1, 0, 0, 1, 1,
0.5067484, 1.756668, -1.012695, 1, 0, 0, 1, 1,
0.5082926, -0.2532462, 2.752094, 1, 0, 0, 1, 1,
0.5088701, 0.5437062, -0.5933646, 1, 0, 0, 1, 1,
0.5137895, 1.548775, 1.084545, 0, 0, 0, 1, 1,
0.5181668, -0.082192, 1.995962, 0, 0, 0, 1, 1,
0.5222275, -1.605981, 2.346855, 0, 0, 0, 1, 1,
0.536666, 0.08696964, 0.6060119, 0, 0, 0, 1, 1,
0.5378999, 0.4790185, 1.148245, 0, 0, 0, 1, 1,
0.5424266, -0.05279287, 0.6403546, 0, 0, 0, 1, 1,
0.5432814, 1.04234, 1.358802, 0, 0, 0, 1, 1,
0.5464051, -0.3728685, 1.624827, 1, 1, 1, 1, 1,
0.5466731, -0.04048151, 1.294019, 1, 1, 1, 1, 1,
0.5469919, 0.2719058, 1.170318, 1, 1, 1, 1, 1,
0.5477055, -0.9297733, 0.5555699, 1, 1, 1, 1, 1,
0.550788, -1.004463, 3.558265, 1, 1, 1, 1, 1,
0.5512015, -0.008961059, 1.869884, 1, 1, 1, 1, 1,
0.5527692, -1.415607, 3.383526, 1, 1, 1, 1, 1,
0.5528691, -0.6007789, 3.829448, 1, 1, 1, 1, 1,
0.5534279, -0.8104181, 2.4, 1, 1, 1, 1, 1,
0.5542679, 0.1820688, 1.630378, 1, 1, 1, 1, 1,
0.5578139, 0.5667325, 0.8011248, 1, 1, 1, 1, 1,
0.5592261, -0.739356, 2.849692, 1, 1, 1, 1, 1,
0.5601621, 1.010933, 1.02886, 1, 1, 1, 1, 1,
0.5664262, -1.07466, 3.102034, 1, 1, 1, 1, 1,
0.5671547, 1.166222, 0.008626701, 1, 1, 1, 1, 1,
0.5672634, -1.593543, 1.985317, 0, 0, 1, 1, 1,
0.568733, -1.335992, 2.885927, 1, 0, 0, 1, 1,
0.5693872, -1.836707, 2.351248, 1, 0, 0, 1, 1,
0.5740359, 1.785852, 1.138949, 1, 0, 0, 1, 1,
0.5745313, 0.2082303, 0.3396494, 1, 0, 0, 1, 1,
0.5759166, -0.01333794, 0.3662898, 1, 0, 0, 1, 1,
0.5856509, 1.281248, 1.502874, 0, 0, 0, 1, 1,
0.587085, -1.4048, 2.636875, 0, 0, 0, 1, 1,
0.5885786, -0.6718561, 2.773269, 0, 0, 0, 1, 1,
0.5931951, -0.02627234, 2.800557, 0, 0, 0, 1, 1,
0.5948681, -0.4897443, 2.49839, 0, 0, 0, 1, 1,
0.6090614, -1.795067, 2.097302, 0, 0, 0, 1, 1,
0.6112912, 1.651083, 2.037664, 0, 0, 0, 1, 1,
0.6134293, -0.4086467, 1.541382, 1, 1, 1, 1, 1,
0.6201187, 0.7823353, 0.9990137, 1, 1, 1, 1, 1,
0.6235835, 0.341196, 1.190376, 1, 1, 1, 1, 1,
0.6319401, -0.1640976, 2.046923, 1, 1, 1, 1, 1,
0.631959, 0.3512402, 2.164435, 1, 1, 1, 1, 1,
0.6360331, 1.083837, -0.8402893, 1, 1, 1, 1, 1,
0.6430786, -0.8011237, 3.026113, 1, 1, 1, 1, 1,
0.6438103, -0.6353462, 2.122254, 1, 1, 1, 1, 1,
0.6451181, -0.89445, 3.836508, 1, 1, 1, 1, 1,
0.647084, -1.115672, 1.370818, 1, 1, 1, 1, 1,
0.6489334, 1.867068, 0.865163, 1, 1, 1, 1, 1,
0.6587086, -1.062479, 3.296973, 1, 1, 1, 1, 1,
0.6609356, 0.1709558, -0.1085294, 1, 1, 1, 1, 1,
0.6702295, -0.7159321, 1.032919, 1, 1, 1, 1, 1,
0.672131, -0.7598855, 1.450079, 1, 1, 1, 1, 1,
0.673517, -0.7595418, 2.131868, 0, 0, 1, 1, 1,
0.6743961, 0.179329, 1.570808, 1, 0, 0, 1, 1,
0.6747486, 2.451485, 0.212194, 1, 0, 0, 1, 1,
0.6755138, -0.6219264, 1.594979, 1, 0, 0, 1, 1,
0.6756112, 0.9686168, -0.08778131, 1, 0, 0, 1, 1,
0.68454, -0.08950797, 3.38471, 1, 0, 0, 1, 1,
0.6875522, -0.1977652, 2.615328, 0, 0, 0, 1, 1,
0.6908898, -0.2586553, 2.199264, 0, 0, 0, 1, 1,
0.6914969, 1.02056, 1.559084, 0, 0, 0, 1, 1,
0.6927193, -0.1808585, 3.177384, 0, 0, 0, 1, 1,
0.6939807, -0.6584026, 2.821457, 0, 0, 0, 1, 1,
0.6947563, 1.184818, 0.7420971, 0, 0, 0, 1, 1,
0.6974947, 0.4012049, 0.9678786, 0, 0, 0, 1, 1,
0.6991163, -1.249313, 3.255633, 1, 1, 1, 1, 1,
0.7014471, -1.040758, 2.55679, 1, 1, 1, 1, 1,
0.701516, -1.22482, 1.670889, 1, 1, 1, 1, 1,
0.7023773, -0.7228065, 4.079705, 1, 1, 1, 1, 1,
0.7045391, -0.9094216, 2.801369, 1, 1, 1, 1, 1,
0.7117129, 0.3550845, 1.176632, 1, 1, 1, 1, 1,
0.7119787, -1.224445, 3.216058, 1, 1, 1, 1, 1,
0.7146034, -0.4680599, 0.7163364, 1, 1, 1, 1, 1,
0.7152786, -1.141864, 5.206038, 1, 1, 1, 1, 1,
0.7156578, 0.762445, 0.3493643, 1, 1, 1, 1, 1,
0.719045, 0.6249273, 0.7252123, 1, 1, 1, 1, 1,
0.7208033, 0.725005, 0.5520592, 1, 1, 1, 1, 1,
0.7210793, -0.2425895, -0.2064343, 1, 1, 1, 1, 1,
0.7247277, -0.4086302, 0.2263004, 1, 1, 1, 1, 1,
0.7317237, -0.09492316, 0.7546514, 1, 1, 1, 1, 1,
0.7358822, -0.3668977, 1.214302, 0, 0, 1, 1, 1,
0.7385197, 1.981204, -0.5679842, 1, 0, 0, 1, 1,
0.7413167, -1.39836, 2.364797, 1, 0, 0, 1, 1,
0.7413229, -0.9739956, 2.099219, 1, 0, 0, 1, 1,
0.7486318, 1.087521, 1.186845, 1, 0, 0, 1, 1,
0.7499827, 0.7853225, -0.6672757, 1, 0, 0, 1, 1,
0.7525905, 0.6531298, 1.01823, 0, 0, 0, 1, 1,
0.7570719, 0.8019786, 1.587339, 0, 0, 0, 1, 1,
0.7575579, 0.3292374, 1.660451, 0, 0, 0, 1, 1,
0.7610918, 0.4813566, 0.6506802, 0, 0, 0, 1, 1,
0.7642493, 0.3953549, -0.3448056, 0, 0, 0, 1, 1,
0.7650868, -0.06810048, 2.456424, 0, 0, 0, 1, 1,
0.7704152, -0.1366548, -0.5918224, 0, 0, 0, 1, 1,
0.7795967, 1.252003, -0.9909311, 1, 1, 1, 1, 1,
0.7805653, -0.105308, 1.815256, 1, 1, 1, 1, 1,
0.7825704, -0.6159194, 2.186849, 1, 1, 1, 1, 1,
0.7834044, -0.1417199, 1.870269, 1, 1, 1, 1, 1,
0.7867084, -0.7936714, 2.41935, 1, 1, 1, 1, 1,
0.7873729, -0.6161089, 2.511404, 1, 1, 1, 1, 1,
0.7904176, -1.435305, 2.669709, 1, 1, 1, 1, 1,
0.7952371, -0.4849621, 1.419778, 1, 1, 1, 1, 1,
0.7974133, -0.2201075, 0.4194375, 1, 1, 1, 1, 1,
0.8079863, -1.69271, 4.548656, 1, 1, 1, 1, 1,
0.8082781, -1.77044, 2.371894, 1, 1, 1, 1, 1,
0.8120044, 0.837839, 1.426958, 1, 1, 1, 1, 1,
0.8142311, -0.7128249, 2.32118, 1, 1, 1, 1, 1,
0.8154118, 1.939685, 1.607568, 1, 1, 1, 1, 1,
0.8158833, 0.01212607, 3.507319, 1, 1, 1, 1, 1,
0.8197774, 0.41024, 0.7606929, 0, 0, 1, 1, 1,
0.8242583, -2.35638, 3.086024, 1, 0, 0, 1, 1,
0.8270062, 0.4161552, 1.681538, 1, 0, 0, 1, 1,
0.8294638, -1.265573, 3.514444, 1, 0, 0, 1, 1,
0.8299832, -1.168929, 1.792297, 1, 0, 0, 1, 1,
0.8319291, 0.9972374, 2.87917, 1, 0, 0, 1, 1,
0.8359603, -0.2769436, 1.747342, 0, 0, 0, 1, 1,
0.8361577, 0.4337526, 1.694814, 0, 0, 0, 1, 1,
0.8375616, 0.6429961, -0.1372223, 0, 0, 0, 1, 1,
0.8407822, -1.400577, 2.582567, 0, 0, 0, 1, 1,
0.849928, -0.08870251, 2.479361, 0, 0, 0, 1, 1,
0.8508688, -1.306285, 1.547188, 0, 0, 0, 1, 1,
0.8509129, 1.045883, 0.3637114, 0, 0, 0, 1, 1,
0.8590648, -0.688512, 1.526695, 1, 1, 1, 1, 1,
0.8602177, 0.1326896, 2.607197, 1, 1, 1, 1, 1,
0.866506, 0.7008227, 1.562748, 1, 1, 1, 1, 1,
0.8674288, 0.7157967, -0.3450333, 1, 1, 1, 1, 1,
0.8681555, -0.2899983, 2.451653, 1, 1, 1, 1, 1,
0.8702797, 0.5278037, 0.6172638, 1, 1, 1, 1, 1,
0.871725, 0.1248001, -1.185861, 1, 1, 1, 1, 1,
0.8761132, 1.0573, -0.9294342, 1, 1, 1, 1, 1,
0.8762108, -0.06055417, 1.18436, 1, 1, 1, 1, 1,
0.8777843, 2.422319, 2.887453, 1, 1, 1, 1, 1,
0.8780722, -0.3884311, 1.175045, 1, 1, 1, 1, 1,
0.8805547, -0.7696341, 2.535493, 1, 1, 1, 1, 1,
0.8849685, -0.7689207, 2.04346, 1, 1, 1, 1, 1,
0.8860198, 0.3489023, -0.4838395, 1, 1, 1, 1, 1,
0.8910126, 0.4462385, 2.700723, 1, 1, 1, 1, 1,
0.8945837, 0.4506849, 1.189372, 0, 0, 1, 1, 1,
0.8984161, 0.2783072, 0.3711492, 1, 0, 0, 1, 1,
0.8991675, 0.3473917, 0.9763787, 1, 0, 0, 1, 1,
0.9012417, 1.170294, 0.1594735, 1, 0, 0, 1, 1,
0.9050573, 1.477263, 1.130974, 1, 0, 0, 1, 1,
0.9056109, -0.4070223, 2.092908, 1, 0, 0, 1, 1,
0.905618, 0.1489669, 0.5807165, 0, 0, 0, 1, 1,
0.9092194, 1.172158, 2.724926, 0, 0, 0, 1, 1,
0.913952, -0.51757, 3.185508, 0, 0, 0, 1, 1,
0.9172706, -0.9140697, 2.259981, 0, 0, 0, 1, 1,
0.9218332, 0.349582, 1.378147, 0, 0, 0, 1, 1,
0.9223706, 2.050668, 1.639693, 0, 0, 0, 1, 1,
0.9226054, 1.591343, 0.1352623, 0, 0, 0, 1, 1,
0.9285557, -0.3355132, 2.395607, 1, 1, 1, 1, 1,
0.9298353, 2.220383, 0.04744746, 1, 1, 1, 1, 1,
0.9339349, 1.378207, -0.3479636, 1, 1, 1, 1, 1,
0.9347962, -0.4305154, 1.420345, 1, 1, 1, 1, 1,
0.9416751, -0.8187488, 2.398299, 1, 1, 1, 1, 1,
0.944682, 1.076483, 1.722391, 1, 1, 1, 1, 1,
0.9471771, -0.6431223, 1.488354, 1, 1, 1, 1, 1,
0.9481333, -2.438009, 2.006607, 1, 1, 1, 1, 1,
0.9538248, 0.2512636, -0.9116982, 1, 1, 1, 1, 1,
0.9596404, -0.5466557, 1.220398, 1, 1, 1, 1, 1,
0.9608731, -0.8815926, 0.6791194, 1, 1, 1, 1, 1,
0.970538, 0.1599751, 1.180065, 1, 1, 1, 1, 1,
0.973547, -1.235602, 1.574309, 1, 1, 1, 1, 1,
0.9756478, 1.719646, 3.054964, 1, 1, 1, 1, 1,
0.9796226, 0.9456443, 2.060933, 1, 1, 1, 1, 1,
1.001339, -0.3991693, 2.327586, 0, 0, 1, 1, 1,
1.003891, -1.1576, 4.637872, 1, 0, 0, 1, 1,
1.012329, -0.2308191, 1.974364, 1, 0, 0, 1, 1,
1.015894, 0.3707702, 0.5115255, 1, 0, 0, 1, 1,
1.018476, -0.168174, 1.744671, 1, 0, 0, 1, 1,
1.024042, 2.641296, 0.7815644, 1, 0, 0, 1, 1,
1.031002, -0.09172529, 1.618317, 0, 0, 0, 1, 1,
1.031908, -0.946971, 2.326302, 0, 0, 0, 1, 1,
1.03502, -1.10865, 2.350315, 0, 0, 0, 1, 1,
1.049006, 1.273339, 0.337987, 0, 0, 0, 1, 1,
1.051969, -1.732572, 3.728343, 0, 0, 0, 1, 1,
1.060807, 0.3344458, 1.760911, 0, 0, 0, 1, 1,
1.063844, 0.1784292, 2.757017, 0, 0, 0, 1, 1,
1.06949, -0.9217777, 5.471599, 1, 1, 1, 1, 1,
1.069625, -0.3542723, 2.044727, 1, 1, 1, 1, 1,
1.077267, 0.4161085, 2.271365, 1, 1, 1, 1, 1,
1.080482, 0.8808901, 1.361102, 1, 1, 1, 1, 1,
1.082788, -0.5906639, -0.1617985, 1, 1, 1, 1, 1,
1.083892, 0.1089572, 3.115763, 1, 1, 1, 1, 1,
1.084889, 0.04277506, 2.222992, 1, 1, 1, 1, 1,
1.091169, -0.6208428, 1.358889, 1, 1, 1, 1, 1,
1.091797, -0.1833982, 1.064982, 1, 1, 1, 1, 1,
1.097878, -0.008569873, 2.879614, 1, 1, 1, 1, 1,
1.101336, 1.631843, 1.190893, 1, 1, 1, 1, 1,
1.104349, 0.6596114, 0.221438, 1, 1, 1, 1, 1,
1.111748, 1.199588, -0.1878089, 1, 1, 1, 1, 1,
1.118165, -0.2108118, -0.8407286, 1, 1, 1, 1, 1,
1.118631, 2.179944, -0.1081023, 1, 1, 1, 1, 1,
1.128677, 0.2220739, 1.789679, 0, 0, 1, 1, 1,
1.128869, 0.7811348, 2.403409, 1, 0, 0, 1, 1,
1.12973, -1.175526, 0.4774038, 1, 0, 0, 1, 1,
1.131479, 0.781875, 1.48308, 1, 0, 0, 1, 1,
1.14127, 0.6801372, 2.143912, 1, 0, 0, 1, 1,
1.146366, -0.2348569, 0.9532173, 1, 0, 0, 1, 1,
1.147043, -0.5129008, 0.4888114, 0, 0, 0, 1, 1,
1.147454, -1.115292, 1.788201, 0, 0, 0, 1, 1,
1.159622, -1.25405, 1.606435, 0, 0, 0, 1, 1,
1.164433, -0.5035201, 1.971844, 0, 0, 0, 1, 1,
1.172195, 1.727923, 1.292036, 0, 0, 0, 1, 1,
1.201229, 0.28883, 0.5806861, 0, 0, 0, 1, 1,
1.202382, -0.2569822, 3.60267, 0, 0, 0, 1, 1,
1.202413, 0.7024532, 1.926664, 1, 1, 1, 1, 1,
1.210238, 0.3380241, 0.4113451, 1, 1, 1, 1, 1,
1.210276, -1.385311, 3.705333, 1, 1, 1, 1, 1,
1.210359, -0.4366622, 2.335315, 1, 1, 1, 1, 1,
1.220503, 0.4621692, 0.2073952, 1, 1, 1, 1, 1,
1.225391, -0.8383374, 3.165125, 1, 1, 1, 1, 1,
1.24512, 0.6026092, -0.2548474, 1, 1, 1, 1, 1,
1.245435, 0.5154756, 3.132341, 1, 1, 1, 1, 1,
1.250105, -0.8342204, 2.012488, 1, 1, 1, 1, 1,
1.252387, -0.7543374, 0.4853651, 1, 1, 1, 1, 1,
1.253516, -0.5998206, 0.7462341, 1, 1, 1, 1, 1,
1.253908, 2.492941, 1.296023, 1, 1, 1, 1, 1,
1.255434, 0.7066563, -0.7243815, 1, 1, 1, 1, 1,
1.259705, -0.9422307, 4.943513, 1, 1, 1, 1, 1,
1.261207, -0.07262702, 2.48115, 1, 1, 1, 1, 1,
1.261683, 1.166028, -1.383084, 0, 0, 1, 1, 1,
1.262549, -0.1406675, 1.880035, 1, 0, 0, 1, 1,
1.271965, -0.4690817, 1.246156, 1, 0, 0, 1, 1,
1.277763, -0.6079997, 2.108935, 1, 0, 0, 1, 1,
1.279096, -0.1539535, 2.132912, 1, 0, 0, 1, 1,
1.281448, 1.206461, -0.4466115, 1, 0, 0, 1, 1,
1.282451, 0.7663565, 1.293458, 0, 0, 0, 1, 1,
1.283558, 1.734538, -0.2859448, 0, 0, 0, 1, 1,
1.291878, 0.2517336, 1.837802, 0, 0, 0, 1, 1,
1.293086, -0.03068336, 1.57816, 0, 0, 0, 1, 1,
1.294617, 0.02414975, 2.306552, 0, 0, 0, 1, 1,
1.303492, 0.6617576, 0.9965014, 0, 0, 0, 1, 1,
1.318145, -1.452504, 1.164704, 0, 0, 0, 1, 1,
1.324325, -1.616565, 3.727453, 1, 1, 1, 1, 1,
1.334244, 0.2203173, 1.040755, 1, 1, 1, 1, 1,
1.337357, 0.3100432, 1.119076, 1, 1, 1, 1, 1,
1.345937, 0.9373651, 0.5088504, 1, 1, 1, 1, 1,
1.350237, -0.3178741, 0.01817088, 1, 1, 1, 1, 1,
1.351645, 1.858323, 0.8740566, 1, 1, 1, 1, 1,
1.353394, -0.5955551, 1.050905, 1, 1, 1, 1, 1,
1.356303, -1.015002, 2.356471, 1, 1, 1, 1, 1,
1.360297, 0.2609338, 2.119181, 1, 1, 1, 1, 1,
1.361574, -0.4224993, 2.969507, 1, 1, 1, 1, 1,
1.376747, -0.6577907, 0.7656084, 1, 1, 1, 1, 1,
1.389721, -1.525046, 1.941423, 1, 1, 1, 1, 1,
1.39023, 0.8828371, 0.9686208, 1, 1, 1, 1, 1,
1.395346, -0.6810354, 3.025022, 1, 1, 1, 1, 1,
1.395349, 1.563481, 0.6049454, 1, 1, 1, 1, 1,
1.398507, 0.08566322, 2.299747, 0, 0, 1, 1, 1,
1.399814, 0.06766135, 1.818198, 1, 0, 0, 1, 1,
1.416293, 0.8705659, 1.224921, 1, 0, 0, 1, 1,
1.430626, -0.1942893, 2.292631, 1, 0, 0, 1, 1,
1.431473, 0.8439352, -0.02735851, 1, 0, 0, 1, 1,
1.431928, -1.214943, 3.532406, 1, 0, 0, 1, 1,
1.434536, 1.122954, 0.6809467, 0, 0, 0, 1, 1,
1.437389, 0.2718746, 3.473628, 0, 0, 0, 1, 1,
1.452834, 0.8491017, 1.655497, 0, 0, 0, 1, 1,
1.454066, -3.3205, 1.641312, 0, 0, 0, 1, 1,
1.467455, -0.5653605, 2.905532, 0, 0, 0, 1, 1,
1.471514, -0.3493931, 1.282106, 0, 0, 0, 1, 1,
1.472473, 0.31444, 1.190005, 0, 0, 0, 1, 1,
1.481321, 0.224052, 2.597642, 1, 1, 1, 1, 1,
1.487552, -0.08839478, 3.363532, 1, 1, 1, 1, 1,
1.506183, 0.02402123, -0.7408072, 1, 1, 1, 1, 1,
1.507259, 0.7127278, 2.23327, 1, 1, 1, 1, 1,
1.545263, 0.3713446, 0.2781867, 1, 1, 1, 1, 1,
1.551341, -0.2907553, 2.02497, 1, 1, 1, 1, 1,
1.563419, -0.821914, 0.008595548, 1, 1, 1, 1, 1,
1.578977, 0.8295365, 1.875166, 1, 1, 1, 1, 1,
1.579093, -0.3231834, 1.170861, 1, 1, 1, 1, 1,
1.586724, 0.1073931, 0.638671, 1, 1, 1, 1, 1,
1.617257, 0.7010341, 1.772232, 1, 1, 1, 1, 1,
1.637954, -1.787398, 3.532214, 1, 1, 1, 1, 1,
1.674451, -2.41476, 2.404503, 1, 1, 1, 1, 1,
1.674759, -1.45155, 1.937703, 1, 1, 1, 1, 1,
1.677963, 0.1027953, 1.359266, 1, 1, 1, 1, 1,
1.68697, 1.405696, 1.006188, 0, 0, 1, 1, 1,
1.706577, -0.2453113, 2.34747, 1, 0, 0, 1, 1,
1.709906, 0.06252877, 1.22646, 1, 0, 0, 1, 1,
1.712167, -0.01539674, -0.1014547, 1, 0, 0, 1, 1,
1.712989, -0.5215201, 3.314628, 1, 0, 0, 1, 1,
1.7152, -0.8646837, 1.418232, 1, 0, 0, 1, 1,
1.724472, -0.133964, -0.1426865, 0, 0, 0, 1, 1,
1.725336, -0.4544797, 2.141985, 0, 0, 0, 1, 1,
1.747288, -1.405623, 2.160622, 0, 0, 0, 1, 1,
1.752844, 0.6538528, 1.382568, 0, 0, 0, 1, 1,
1.75409, 0.1884548, 2.619449, 0, 0, 0, 1, 1,
1.79074, 0.5606753, 1.135983, 0, 0, 0, 1, 1,
1.799751, -1.269774, 0.6072955, 0, 0, 0, 1, 1,
1.823598, 2.460545, 1.002702, 1, 1, 1, 1, 1,
1.846537, 0.2314113, 1.102354, 1, 1, 1, 1, 1,
1.866461, 0.553194, 4.239782, 1, 1, 1, 1, 1,
1.891909, 1.150304, 0.3883928, 1, 1, 1, 1, 1,
1.900036, -1.488976, 3.469078, 1, 1, 1, 1, 1,
1.908318, -0.5275662, 2.656381, 1, 1, 1, 1, 1,
1.913538, 0.02729201, 0.5737993, 1, 1, 1, 1, 1,
1.913959, -0.3798246, 2.323698, 1, 1, 1, 1, 1,
1.91425, 0.4346312, 0.7754607, 1, 1, 1, 1, 1,
1.934054, 0.232024, 4.379778, 1, 1, 1, 1, 1,
1.940038, -0.09493298, 0.6883647, 1, 1, 1, 1, 1,
1.9408, -1.715975, 2.729749, 1, 1, 1, 1, 1,
1.940943, 0.04226724, 2.21057, 1, 1, 1, 1, 1,
1.941897, 0.5192052, -0.3580576, 1, 1, 1, 1, 1,
1.967548, -1.58434, 2.995698, 1, 1, 1, 1, 1,
1.989592, 0.04721237, 2.424994, 0, 0, 1, 1, 1,
2.023942, 1.434884, 0.1633578, 1, 0, 0, 1, 1,
2.039946, -0.2172511, 1.051223, 1, 0, 0, 1, 1,
2.074281, -1.368195, 2.138487, 1, 0, 0, 1, 1,
2.079364, 0.5391977, 1.394128, 1, 0, 0, 1, 1,
2.094363, -0.8256537, 1.682645, 1, 0, 0, 1, 1,
2.102786, 0.8078955, 0.5706121, 0, 0, 0, 1, 1,
2.126914, 1.373028, 0.8439908, 0, 0, 0, 1, 1,
2.18954, -0.3601402, 0.6591888, 0, 0, 0, 1, 1,
2.217066, 0.5222653, 0.569199, 0, 0, 0, 1, 1,
2.296735, 0.5740403, 0.441291, 0, 0, 0, 1, 1,
2.30081, -0.3493321, 0.4344333, 0, 0, 0, 1, 1,
2.388318, -1.203868, 1.890731, 0, 0, 0, 1, 1,
2.397384, 0.5117651, 1.906545, 1, 1, 1, 1, 1,
2.454385, -0.9147093, 2.341294, 1, 1, 1, 1, 1,
2.45919, -0.04291678, 0.9624054, 1, 1, 1, 1, 1,
2.477266, -0.6911657, 2.855365, 1, 1, 1, 1, 1,
2.815832, -0.1764817, 3.135452, 1, 1, 1, 1, 1,
3.007239, -0.3465725, 1.980801, 1, 1, 1, 1, 1,
4.022039, -0.5146282, 0.8521733, 1, 1, 1, 1, 1
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
var radius = 9.965707;
var distance = 35.00412;
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
mvMatrix.translate( -0.2757018, 0.02087379, -0.3027909 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.00412);
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
