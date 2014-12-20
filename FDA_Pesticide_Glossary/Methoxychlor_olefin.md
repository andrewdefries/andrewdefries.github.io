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
-3.643648, 1.135882, -1.93047, 1, 0, 0, 1,
-3.09005, 0.5220511, -1.266281, 1, 0.007843138, 0, 1,
-2.901909, -0.611784, -0.4823899, 1, 0.01176471, 0, 1,
-2.716476, 0.8640098, -1.638602, 1, 0.01960784, 0, 1,
-2.638347, 0.4127867, -0.9241297, 1, 0.02352941, 0, 1,
-2.60828, 0.5239833, -0.5637423, 1, 0.03137255, 0, 1,
-2.58199, -2.016552, -1.820856, 1, 0.03529412, 0, 1,
-2.531718, 0.6400687, 0.2766931, 1, 0.04313726, 0, 1,
-2.525527, -1.054663, -1.601716, 1, 0.04705882, 0, 1,
-2.520817, 0.9393779, -1.11515, 1, 0.05490196, 0, 1,
-2.449483, 0.4922031, -0.8091545, 1, 0.05882353, 0, 1,
-2.425711, -0.8776234, -2.257056, 1, 0.06666667, 0, 1,
-2.260491, 0.1930577, -1.635231, 1, 0.07058824, 0, 1,
-2.24478, 0.354344, -1.298874, 1, 0.07843138, 0, 1,
-2.219163, 0.1150924, -2.964878, 1, 0.08235294, 0, 1,
-2.21489, 0.7393381, -4.424315, 1, 0.09019608, 0, 1,
-2.180911, 0.02125896, -3.395226, 1, 0.09411765, 0, 1,
-2.17541, 0.745457, -4.521826, 1, 0.1019608, 0, 1,
-2.162606, -1.325, -3.932842, 1, 0.1098039, 0, 1,
-2.120054, 1.164479, -1.306611, 1, 0.1137255, 0, 1,
-2.070344, 0.518612, -1.99585, 1, 0.1215686, 0, 1,
-1.986939, -0.9989182, -0.8025699, 1, 0.1254902, 0, 1,
-1.977083, 0.4306662, -1.192577, 1, 0.1333333, 0, 1,
-1.898757, -0.8402638, -0.9535801, 1, 0.1372549, 0, 1,
-1.887493, -0.8161971, -1.874883, 1, 0.145098, 0, 1,
-1.884716, 0.0529927, -0.8816652, 1, 0.1490196, 0, 1,
-1.877396, 0.4000657, -2.883103, 1, 0.1568628, 0, 1,
-1.870615, -0.6264533, -0.06279711, 1, 0.1607843, 0, 1,
-1.87036, 1.35614, -1.264322, 1, 0.1686275, 0, 1,
-1.847531, -0.009484073, -1.263408, 1, 0.172549, 0, 1,
-1.847452, 1.679901, 0.5185916, 1, 0.1803922, 0, 1,
-1.829338, -1.19465, -1.607327, 1, 0.1843137, 0, 1,
-1.819397, -0.6548836, -0.2699295, 1, 0.1921569, 0, 1,
-1.816708, -1.37596, -2.869824, 1, 0.1960784, 0, 1,
-1.816245, -1.206053, -2.953036, 1, 0.2039216, 0, 1,
-1.814094, 0.1535465, -3.193672, 1, 0.2117647, 0, 1,
-1.791237, -0.8456566, -3.242639, 1, 0.2156863, 0, 1,
-1.782525, -0.1077987, -1.507202, 1, 0.2235294, 0, 1,
-1.747416, 2.701653, -2.422718, 1, 0.227451, 0, 1,
-1.715368, -0.8416713, -4.310843, 1, 0.2352941, 0, 1,
-1.710795, -0.5917103, -1.599889, 1, 0.2392157, 0, 1,
-1.708589, -1.16451, -0.7902002, 1, 0.2470588, 0, 1,
-1.689553, 2.320789, -0.3443321, 1, 0.2509804, 0, 1,
-1.677303, -0.9173572, -1.8736, 1, 0.2588235, 0, 1,
-1.674946, 0.7234864, -1.785978, 1, 0.2627451, 0, 1,
-1.668366, -0.4636945, -3.120863, 1, 0.2705882, 0, 1,
-1.664785, 1.252646, -1.249883, 1, 0.2745098, 0, 1,
-1.663255, -0.3595809, -1.1051, 1, 0.282353, 0, 1,
-1.644038, -1.184416, -3.907315, 1, 0.2862745, 0, 1,
-1.643411, -1.680734, -3.085319, 1, 0.2941177, 0, 1,
-1.619788, 0.4495543, -1.17398, 1, 0.3019608, 0, 1,
-1.617841, 0.4128572, 0.1277428, 1, 0.3058824, 0, 1,
-1.61217, -0.6226077, -0.1828793, 1, 0.3137255, 0, 1,
-1.60442, 0.06636231, -2.948292, 1, 0.3176471, 0, 1,
-1.601899, 0.1245322, -2.050759, 1, 0.3254902, 0, 1,
-1.588117, -0.2672493, -1.670304, 1, 0.3294118, 0, 1,
-1.584289, 1.346453, -0.8766108, 1, 0.3372549, 0, 1,
-1.580307, 0.08629852, -1.970048, 1, 0.3411765, 0, 1,
-1.557561, 1.631237, -0.8454109, 1, 0.3490196, 0, 1,
-1.556128, -0.1150549, -3.882541, 1, 0.3529412, 0, 1,
-1.549263, 0.3235013, -2.016062, 1, 0.3607843, 0, 1,
-1.542403, 0.482521, -1.200008, 1, 0.3647059, 0, 1,
-1.496989, 0.3422429, -3.098535, 1, 0.372549, 0, 1,
-1.496248, 1.04849, -1.217155, 1, 0.3764706, 0, 1,
-1.483918, -0.3503301, -1.745012, 1, 0.3843137, 0, 1,
-1.472972, -0.7277853, -3.170355, 1, 0.3882353, 0, 1,
-1.444182, 0.6308719, -0.3489361, 1, 0.3960784, 0, 1,
-1.442209, 0.7290564, -0.4484372, 1, 0.4039216, 0, 1,
-1.441993, -0.4247732, -1.099789, 1, 0.4078431, 0, 1,
-1.432757, 1.195651, -0.4308135, 1, 0.4156863, 0, 1,
-1.432022, 0.7348253, -0.4011034, 1, 0.4196078, 0, 1,
-1.431044, 0.8144705, -0.3938783, 1, 0.427451, 0, 1,
-1.427907, 0.3275954, -2.258262, 1, 0.4313726, 0, 1,
-1.426416, 0.7585956, -1.603878, 1, 0.4392157, 0, 1,
-1.424694, -0.8868995, -2.200963, 1, 0.4431373, 0, 1,
-1.410612, -0.9628972, -2.699095, 1, 0.4509804, 0, 1,
-1.400648, -0.4471004, -2.209095, 1, 0.454902, 0, 1,
-1.399819, -0.7384326, -2.593225, 1, 0.4627451, 0, 1,
-1.396324, 0.1786532, -1.475678, 1, 0.4666667, 0, 1,
-1.395797, -0.4644608, -2.16003, 1, 0.4745098, 0, 1,
-1.394916, -0.5304572, -0.8840411, 1, 0.4784314, 0, 1,
-1.384338, 0.9122273, -1.038896, 1, 0.4862745, 0, 1,
-1.38068, 0.1962063, -0.2240887, 1, 0.4901961, 0, 1,
-1.363207, -0.5037841, -1.867586, 1, 0.4980392, 0, 1,
-1.358392, -0.7640025, -1.087471, 1, 0.5058824, 0, 1,
-1.352687, -1.494349, -2.229246, 1, 0.509804, 0, 1,
-1.349804, 0.2974479, -2.014258, 1, 0.5176471, 0, 1,
-1.343573, -1.236052, -2.884322, 1, 0.5215687, 0, 1,
-1.340275, -0.2832691, -2.768058, 1, 0.5294118, 0, 1,
-1.334457, 0.2428862, -1.822101, 1, 0.5333334, 0, 1,
-1.334019, 0.3127978, -1.070242, 1, 0.5411765, 0, 1,
-1.332568, 0.05284981, -1.364378, 1, 0.5450981, 0, 1,
-1.323756, -0.7969233, -3.172264, 1, 0.5529412, 0, 1,
-1.311861, 0.7290972, -1.264324, 1, 0.5568628, 0, 1,
-1.308257, -0.7439957, -0.7318819, 1, 0.5647059, 0, 1,
-1.287473, -0.763191, -0.4632173, 1, 0.5686275, 0, 1,
-1.282585, 0.4842515, -2.683633, 1, 0.5764706, 0, 1,
-1.279047, 1.518845, -0.2352087, 1, 0.5803922, 0, 1,
-1.268751, 0.9991608, -0.6582378, 1, 0.5882353, 0, 1,
-1.267892, 1.253807, -2.05604, 1, 0.5921569, 0, 1,
-1.266334, 1.541085, -0.9024789, 1, 0.6, 0, 1,
-1.261871, 0.41418, -0.3723665, 1, 0.6078432, 0, 1,
-1.252336, 0.659328, -2.541847, 1, 0.6117647, 0, 1,
-1.235463, -0.3073506, -2.697412, 1, 0.6196079, 0, 1,
-1.234125, -1.324341, -1.578484, 1, 0.6235294, 0, 1,
-1.228583, 0.7190754, -1.986669, 1, 0.6313726, 0, 1,
-1.222236, -0.5037927, 0.01220264, 1, 0.6352941, 0, 1,
-1.221165, 0.07343386, -3.835612, 1, 0.6431373, 0, 1,
-1.210727, 0.5471059, -0.031845, 1, 0.6470588, 0, 1,
-1.201399, 0.5105596, -2.059154, 1, 0.654902, 0, 1,
-1.186379, 2.521393, -0.2390056, 1, 0.6588235, 0, 1,
-1.184303, -1.396325, -2.971631, 1, 0.6666667, 0, 1,
-1.175354, 0.8789647, -1.003559, 1, 0.6705883, 0, 1,
-1.171326, -0.7773296, -1.397503, 1, 0.6784314, 0, 1,
-1.166685, 0.03609464, -0.3406046, 1, 0.682353, 0, 1,
-1.156129, -0.7469347, -3.359277, 1, 0.6901961, 0, 1,
-1.155953, 0.08622887, -0.9339967, 1, 0.6941177, 0, 1,
-1.153547, 1.275359, -0.595105, 1, 0.7019608, 0, 1,
-1.150949, -0.7517427, -2.728396, 1, 0.7098039, 0, 1,
-1.144857, 0.86715, -0.6804962, 1, 0.7137255, 0, 1,
-1.14374, -2.155551, -5.621459, 1, 0.7215686, 0, 1,
-1.139019, -0.2443267, -2.848422, 1, 0.7254902, 0, 1,
-1.134884, 1.415654, 0.6842105, 1, 0.7333333, 0, 1,
-1.122992, -1.691489, -2.376816, 1, 0.7372549, 0, 1,
-1.11798, 1.532061, 0.334084, 1, 0.7450981, 0, 1,
-1.116133, -0.8642238, -2.323663, 1, 0.7490196, 0, 1,
-1.115379, 0.4725928, -1.600491, 1, 0.7568628, 0, 1,
-1.112929, -0.06477288, -2.216768, 1, 0.7607843, 0, 1,
-1.110754, 0.8864465, 0.8154683, 1, 0.7686275, 0, 1,
-1.106743, -0.5786902, -2.854451, 1, 0.772549, 0, 1,
-1.10086, -1.469712, -0.9126726, 1, 0.7803922, 0, 1,
-1.099984, 0.4460223, -0.3581388, 1, 0.7843137, 0, 1,
-1.098644, 0.8781347, -1.053927, 1, 0.7921569, 0, 1,
-1.097331, 0.4460636, -1.004148, 1, 0.7960784, 0, 1,
-1.096658, -0.4615213, -2.611546, 1, 0.8039216, 0, 1,
-1.083782, 1.230774, -1.944776, 1, 0.8117647, 0, 1,
-1.078846, -1.19349, -2.611968, 1, 0.8156863, 0, 1,
-1.074479, -2.027089, -0.6932299, 1, 0.8235294, 0, 1,
-1.070295, -0.1301988, -1.362076, 1, 0.827451, 0, 1,
-1.063567, 0.1050124, 0.1192767, 1, 0.8352941, 0, 1,
-1.056972, -0.4959339, -1.063883, 1, 0.8392157, 0, 1,
-1.050884, 0.642779, -0.3181088, 1, 0.8470588, 0, 1,
-1.04574, 0.1695008, -2.140423, 1, 0.8509804, 0, 1,
-1.045694, 1.00441, -0.2428319, 1, 0.8588235, 0, 1,
-1.045515, 0.8258758, 0.7475961, 1, 0.8627451, 0, 1,
-1.043183, -0.09441774, -1.251666, 1, 0.8705882, 0, 1,
-1.036511, 1.614776, -1.039472, 1, 0.8745098, 0, 1,
-1.035835, -1.594914, -3.439976, 1, 0.8823529, 0, 1,
-1.023968, 1.453616, -1.09349, 1, 0.8862745, 0, 1,
-1.023826, 0.2978026, -1.374423, 1, 0.8941177, 0, 1,
-1.022163, 0.83947, -1.571236, 1, 0.8980392, 0, 1,
-1.019601, 1.154166, -0.1357986, 1, 0.9058824, 0, 1,
-1.018983, 0.3883244, -0.1678082, 1, 0.9137255, 0, 1,
-1.010462, -0.7342925, 0.09227513, 1, 0.9176471, 0, 1,
-1.010233, 0.8978727, -1.465638, 1, 0.9254902, 0, 1,
-1.008447, -0.3430943, -3.555851, 1, 0.9294118, 0, 1,
-1.007559, 0.7201877, -1.556427, 1, 0.9372549, 0, 1,
-1.002181, 1.795074, -1.068216, 1, 0.9411765, 0, 1,
-0.992725, 0.6222593, 0.5795572, 1, 0.9490196, 0, 1,
-0.9878309, -1.45082, -3.507668, 1, 0.9529412, 0, 1,
-0.9836752, 0.8173095, -1.857543, 1, 0.9607843, 0, 1,
-0.9835451, 0.3861932, -0.7697046, 1, 0.9647059, 0, 1,
-0.9828357, -2.896877, -0.6029854, 1, 0.972549, 0, 1,
-0.968281, 1.238934, -0.1689983, 1, 0.9764706, 0, 1,
-0.9657208, -0.7471652, -3.135771, 1, 0.9843137, 0, 1,
-0.964983, -0.07014736, -1.020843, 1, 0.9882353, 0, 1,
-0.9513478, -0.0597164, -3.742584, 1, 0.9960784, 0, 1,
-0.9506531, -0.08899861, -0.7285047, 0.9960784, 1, 0, 1,
-0.9479648, -0.7135508, -2.157312, 0.9921569, 1, 0, 1,
-0.9416038, -0.7044189, -3.073335, 0.9843137, 1, 0, 1,
-0.9389469, -0.8610304, -1.947561, 0.9803922, 1, 0, 1,
-0.9378328, 0.6444678, -2.530431, 0.972549, 1, 0, 1,
-0.9342231, -0.7434731, -3.627329, 0.9686275, 1, 0, 1,
-0.9301652, -0.8282861, -2.389476, 0.9607843, 1, 0, 1,
-0.9244794, 0.7613942, -1.522305, 0.9568627, 1, 0, 1,
-0.9240678, 1.730245, -1.649338, 0.9490196, 1, 0, 1,
-0.9190558, -1.745158, -0.9692, 0.945098, 1, 0, 1,
-0.9173415, -0.5734689, -1.259953, 0.9372549, 1, 0, 1,
-0.9167286, 1.329198, -0.6571494, 0.9333333, 1, 0, 1,
-0.9110706, -0.2199421, -0.9372676, 0.9254902, 1, 0, 1,
-0.9088432, 1.374023, 0.7984087, 0.9215686, 1, 0, 1,
-0.9074296, 2.037639, -0.7557518, 0.9137255, 1, 0, 1,
-0.9060683, -0.7097064, -1.116671, 0.9098039, 1, 0, 1,
-0.8974141, 1.323959, -0.8610611, 0.9019608, 1, 0, 1,
-0.8964539, -0.9625247, -3.472087, 0.8941177, 1, 0, 1,
-0.8945215, 1.191343, -1.350466, 0.8901961, 1, 0, 1,
-0.8893374, -1.0901, -1.349099, 0.8823529, 1, 0, 1,
-0.8883183, -0.6018952, -3.632027, 0.8784314, 1, 0, 1,
-0.8843071, 0.3003321, -2.705866, 0.8705882, 1, 0, 1,
-0.882612, -0.5385091, -1.891546, 0.8666667, 1, 0, 1,
-0.8816006, 0.836611, -0.4120913, 0.8588235, 1, 0, 1,
-0.8706547, 2.517828, -0.2989041, 0.854902, 1, 0, 1,
-0.8649387, 0.07201997, -2.371569, 0.8470588, 1, 0, 1,
-0.8632445, -0.8771701, -1.240748, 0.8431373, 1, 0, 1,
-0.8622228, 0.03204829, -1.507724, 0.8352941, 1, 0, 1,
-0.8604187, 0.8676951, -0.5374501, 0.8313726, 1, 0, 1,
-0.8452581, -1.238708, -3.314232, 0.8235294, 1, 0, 1,
-0.8438184, 1.706018, -0.3094851, 0.8196079, 1, 0, 1,
-0.8436674, 0.3723479, -1.033953, 0.8117647, 1, 0, 1,
-0.8358759, -0.6693374, -4.366877, 0.8078431, 1, 0, 1,
-0.8328889, 0.7355989, -1.897644, 0.8, 1, 0, 1,
-0.8312938, -1.489411, -2.486656, 0.7921569, 1, 0, 1,
-0.8210974, 1.082698, -0.5312566, 0.7882353, 1, 0, 1,
-0.8176814, 1.603653, -0.3061454, 0.7803922, 1, 0, 1,
-0.8068024, -1.73655, -3.143775, 0.7764706, 1, 0, 1,
-0.8061717, 0.098288, -0.9782175, 0.7686275, 1, 0, 1,
-0.8059542, -0.07322076, -0.9821396, 0.7647059, 1, 0, 1,
-0.8016864, -0.2655642, -2.990573, 0.7568628, 1, 0, 1,
-0.7980563, 0.4611524, -1.594016, 0.7529412, 1, 0, 1,
-0.7977653, 1.169427, -0.03865403, 0.7450981, 1, 0, 1,
-0.7973135, 0.6043884, -0.4004278, 0.7411765, 1, 0, 1,
-0.7969522, 0.8330417, -1.578259, 0.7333333, 1, 0, 1,
-0.793832, 1.442607, -0.9087554, 0.7294118, 1, 0, 1,
-0.7908454, -0.4112238, -1.86358, 0.7215686, 1, 0, 1,
-0.7829896, -0.3974971, 0.3940216, 0.7176471, 1, 0, 1,
-0.7792288, 0.9483225, -0.8588877, 0.7098039, 1, 0, 1,
-0.7745566, 0.4741724, -1.586659, 0.7058824, 1, 0, 1,
-0.7690084, -1.025691, -2.82632, 0.6980392, 1, 0, 1,
-0.7687183, -0.9414629, -4.307578, 0.6901961, 1, 0, 1,
-0.7627696, -0.6064241, -1.701429, 0.6862745, 1, 0, 1,
-0.7603732, 1.014777, 0.4987053, 0.6784314, 1, 0, 1,
-0.759905, 0.1065691, -0.5629576, 0.6745098, 1, 0, 1,
-0.7589583, 1.031425, -1.481677, 0.6666667, 1, 0, 1,
-0.7567129, -0.0360985, -2.778636, 0.6627451, 1, 0, 1,
-0.7492949, -0.8157375, -2.585815, 0.654902, 1, 0, 1,
-0.7486143, 1.246361, -0.5686408, 0.6509804, 1, 0, 1,
-0.7425898, -1.217357, -2.703132, 0.6431373, 1, 0, 1,
-0.7268097, 1.269029, -1.739085, 0.6392157, 1, 0, 1,
-0.7251894, -1.232774, -3.47485, 0.6313726, 1, 0, 1,
-0.7213627, 0.09475418, -1.656976, 0.627451, 1, 0, 1,
-0.7197262, 0.6942628, -0.4357431, 0.6196079, 1, 0, 1,
-0.7166974, 0.5080861, -0.5264693, 0.6156863, 1, 0, 1,
-0.7118468, 0.04256926, 0.2687623, 0.6078432, 1, 0, 1,
-0.7078229, 0.1206762, -0.8560155, 0.6039216, 1, 0, 1,
-0.7035496, 1.047997, 0.3863094, 0.5960785, 1, 0, 1,
-0.7034888, -1.33645, -3.673862, 0.5882353, 1, 0, 1,
-0.6986517, 1.241397, -0.9935007, 0.5843138, 1, 0, 1,
-0.6938032, -0.3995501, -3.261654, 0.5764706, 1, 0, 1,
-0.6922275, 1.124655, 0.4534356, 0.572549, 1, 0, 1,
-0.6830154, 0.3223623, -1.840562, 0.5647059, 1, 0, 1,
-0.6828145, -0.4089912, -2.393664, 0.5607843, 1, 0, 1,
-0.6813785, 0.3234438, -1.027534, 0.5529412, 1, 0, 1,
-0.6790755, 1.66528, -0.4876887, 0.5490196, 1, 0, 1,
-0.6748473, -1.729998, -3.312523, 0.5411765, 1, 0, 1,
-0.6741392, -1.820258, -2.321165, 0.5372549, 1, 0, 1,
-0.6655009, -0.5092843, -4.554845, 0.5294118, 1, 0, 1,
-0.6599714, 1.308575, -0.008300102, 0.5254902, 1, 0, 1,
-0.6570226, 0.6246713, -0.1086085, 0.5176471, 1, 0, 1,
-0.6550491, 0.3251557, -1.109921, 0.5137255, 1, 0, 1,
-0.6546412, -0.4502386, -0.8933765, 0.5058824, 1, 0, 1,
-0.654148, 0.9863615, -0.8832858, 0.5019608, 1, 0, 1,
-0.6520373, 0.4088342, -0.0797108, 0.4941176, 1, 0, 1,
-0.6468589, 0.431106, -1.374374, 0.4862745, 1, 0, 1,
-0.6460325, -0.9662448, -2.792992, 0.4823529, 1, 0, 1,
-0.6432159, -2.749784, -2.622202, 0.4745098, 1, 0, 1,
-0.6426353, 0.3216616, -0.1599096, 0.4705882, 1, 0, 1,
-0.6348479, 0.8208435, -1.141691, 0.4627451, 1, 0, 1,
-0.6331565, -1.251371, -4.379215, 0.4588235, 1, 0, 1,
-0.6298188, 1.624539, 1.729674, 0.4509804, 1, 0, 1,
-0.6295372, -0.5611553, -1.211927, 0.4470588, 1, 0, 1,
-0.6286829, -0.8342693, -2.037802, 0.4392157, 1, 0, 1,
-0.6257197, 0.7521876, 1.139081, 0.4352941, 1, 0, 1,
-0.6239833, 1.072984, -1.546232, 0.427451, 1, 0, 1,
-0.6218055, -0.6464442, -3.057055, 0.4235294, 1, 0, 1,
-0.6198691, 0.01287489, -2.333722, 0.4156863, 1, 0, 1,
-0.6144619, 0.1287828, -2.090215, 0.4117647, 1, 0, 1,
-0.6086992, 2.295852, 0.2728338, 0.4039216, 1, 0, 1,
-0.6082552, 0.7125325, -0.3746244, 0.3960784, 1, 0, 1,
-0.6069155, 0.03852331, -0.5277735, 0.3921569, 1, 0, 1,
-0.605562, 0.3314277, -2.258706, 0.3843137, 1, 0, 1,
-0.5987946, 0.6946673, 0.3728991, 0.3803922, 1, 0, 1,
-0.5963671, 1.03313, 1.126344, 0.372549, 1, 0, 1,
-0.5897436, 0.9863079, -0.7148622, 0.3686275, 1, 0, 1,
-0.5885403, 0.7864647, -0.9704362, 0.3607843, 1, 0, 1,
-0.5849998, -1.394577, -3.280045, 0.3568628, 1, 0, 1,
-0.5849427, 0.6208299, -1.304763, 0.3490196, 1, 0, 1,
-0.5801536, 1.687387, -1.33477, 0.345098, 1, 0, 1,
-0.5784662, -0.9677405, -2.849665, 0.3372549, 1, 0, 1,
-0.5746003, 1.047642, 0.5660882, 0.3333333, 1, 0, 1,
-0.5731279, 0.1134045, -0.006039185, 0.3254902, 1, 0, 1,
-0.570936, 0.3519106, 0.5463872, 0.3215686, 1, 0, 1,
-0.570486, 2.083199, 0.3159898, 0.3137255, 1, 0, 1,
-0.5692748, -1.418477, -2.157208, 0.3098039, 1, 0, 1,
-0.5611594, -0.2576146, -1.80783, 0.3019608, 1, 0, 1,
-0.558441, 0.9322858, -0.4020531, 0.2941177, 1, 0, 1,
-0.556955, 0.1590173, -0.5682273, 0.2901961, 1, 0, 1,
-0.5554066, 0.1821345, -1.276378, 0.282353, 1, 0, 1,
-0.5510867, 0.002413607, -0.05739342, 0.2784314, 1, 0, 1,
-0.5505126, 0.05829014, -1.065986, 0.2705882, 1, 0, 1,
-0.5497929, -1.527361, -3.316488, 0.2666667, 1, 0, 1,
-0.5492743, -0.1606175, -4.312749, 0.2588235, 1, 0, 1,
-0.5451061, 0.02576971, 0.08955886, 0.254902, 1, 0, 1,
-0.5432197, -1.920803, -2.158486, 0.2470588, 1, 0, 1,
-0.5389578, -0.1538127, -2.45336, 0.2431373, 1, 0, 1,
-0.5377984, 0.9415131, 0.213652, 0.2352941, 1, 0, 1,
-0.5278032, 1.735835, -0.9471548, 0.2313726, 1, 0, 1,
-0.524348, -2.820186, -3.222669, 0.2235294, 1, 0, 1,
-0.5188077, 0.9825582, 0.8363129, 0.2196078, 1, 0, 1,
-0.5173724, -1.21287, -3.683748, 0.2117647, 1, 0, 1,
-0.5155464, 0.3569513, 2.10452, 0.2078431, 1, 0, 1,
-0.5094374, -2.464787, -1.645687, 0.2, 1, 0, 1,
-0.5078792, 0.4164553, -0.342332, 0.1921569, 1, 0, 1,
-0.5073336, 0.1409101, -2.286944, 0.1882353, 1, 0, 1,
-0.5062798, 0.8810081, -1.474058, 0.1803922, 1, 0, 1,
-0.5008988, 0.08086789, -1.647174, 0.1764706, 1, 0, 1,
-0.4933823, -0.6877826, -3.586963, 0.1686275, 1, 0, 1,
-0.4929788, -0.1623334, -2.327838, 0.1647059, 1, 0, 1,
-0.49276, -1.034022, -0.6885331, 0.1568628, 1, 0, 1,
-0.4909799, 0.137811, -1.11857, 0.1529412, 1, 0, 1,
-0.487611, -1.266413, -2.982371, 0.145098, 1, 0, 1,
-0.4804711, 0.4700486, -2.695516, 0.1411765, 1, 0, 1,
-0.4782612, -0.1534545, -1.586789, 0.1333333, 1, 0, 1,
-0.4757433, 0.2940117, -0.2850428, 0.1294118, 1, 0, 1,
-0.4713049, 0.4405435, -0.371615, 0.1215686, 1, 0, 1,
-0.4712603, 0.2798295, -0.1870914, 0.1176471, 1, 0, 1,
-0.4708784, 0.1903564, 0.2145116, 0.1098039, 1, 0, 1,
-0.4686426, 1.169755, -0.7969007, 0.1058824, 1, 0, 1,
-0.4658818, -0.4415728, -2.217752, 0.09803922, 1, 0, 1,
-0.4651961, 0.5614136, 1.1681, 0.09019608, 1, 0, 1,
-0.4630969, -0.7598806, -2.555276, 0.08627451, 1, 0, 1,
-0.4621918, 0.9782471, -0.4343678, 0.07843138, 1, 0, 1,
-0.4595714, -0.1092154, 0.164732, 0.07450981, 1, 0, 1,
-0.4589707, -1.6258, -3.562593, 0.06666667, 1, 0, 1,
-0.4572457, -0.5754661, -2.015181, 0.0627451, 1, 0, 1,
-0.4549339, -1.071349, -2.938108, 0.05490196, 1, 0, 1,
-0.4533231, 2.093914, 1.071507, 0.05098039, 1, 0, 1,
-0.4511507, -0.001477922, -2.36474, 0.04313726, 1, 0, 1,
-0.450157, -0.140968, -2.212486, 0.03921569, 1, 0, 1,
-0.4489983, 0.3347389, -3.027868, 0.03137255, 1, 0, 1,
-0.4476881, -0.8519423, -1.395621, 0.02745098, 1, 0, 1,
-0.4439142, -0.8703441, -2.00078, 0.01960784, 1, 0, 1,
-0.4407667, 0.1332626, -0.7557086, 0.01568628, 1, 0, 1,
-0.4391491, -0.1097716, -1.066152, 0.007843138, 1, 0, 1,
-0.4363478, -1.465125, -2.722077, 0.003921569, 1, 0, 1,
-0.432253, -0.4333724, -2.087053, 0, 1, 0.003921569, 1,
-0.4317758, -1.207106, -0.5847575, 0, 1, 0.01176471, 1,
-0.4291943, 0.04007003, 0.2738738, 0, 1, 0.01568628, 1,
-0.4277637, -0.1097084, -1.939423, 0, 1, 0.02352941, 1,
-0.4276763, -0.06402642, -5.053528, 0, 1, 0.02745098, 1,
-0.4245571, 1.775684, -1.06453, 0, 1, 0.03529412, 1,
-0.4243009, 1.563295, -0.6202872, 0, 1, 0.03921569, 1,
-0.4174915, -0.1073724, -1.165271, 0, 1, 0.04705882, 1,
-0.3984753, -1.303033, -1.787667, 0, 1, 0.05098039, 1,
-0.3965733, -0.3006993, -3.70383, 0, 1, 0.05882353, 1,
-0.3936691, -0.9061264, -2.76571, 0, 1, 0.0627451, 1,
-0.3872197, 0.4806004, 0.3644215, 0, 1, 0.07058824, 1,
-0.3830778, 1.208942, -0.04757194, 0, 1, 0.07450981, 1,
-0.3826408, -0.4777171, -2.370929, 0, 1, 0.08235294, 1,
-0.3808978, -0.4238374, -0.8541073, 0, 1, 0.08627451, 1,
-0.3767456, 0.8255557, -1.033628, 0, 1, 0.09411765, 1,
-0.3760982, -1.125482, -2.84636, 0, 1, 0.1019608, 1,
-0.3701892, 0.8361568, -0.2513558, 0, 1, 0.1058824, 1,
-0.3677332, -0.4927897, -3.210577, 0, 1, 0.1137255, 1,
-0.366423, -0.7009404, -2.590791, 0, 1, 0.1176471, 1,
-0.3661857, -1.931731, -4.071766, 0, 1, 0.1254902, 1,
-0.3620954, 0.6294628, -1.836397, 0, 1, 0.1294118, 1,
-0.3613283, 0.8872325, -0.203518, 0, 1, 0.1372549, 1,
-0.3571859, -0.9817703, -1.971839, 0, 1, 0.1411765, 1,
-0.3520096, 0.9332509, 0.215783, 0, 1, 0.1490196, 1,
-0.3503018, -0.01073651, -1.527424, 0, 1, 0.1529412, 1,
-0.3490278, 0.3614359, -0.3299291, 0, 1, 0.1607843, 1,
-0.3474379, -0.1513752, -1.364718, 0, 1, 0.1647059, 1,
-0.3459808, -0.4657887, -3.073397, 0, 1, 0.172549, 1,
-0.3300315, -0.2735647, -2.04969, 0, 1, 0.1764706, 1,
-0.3293219, -0.620945, -4.028267, 0, 1, 0.1843137, 1,
-0.3288606, -0.008378854, -1.248939, 0, 1, 0.1882353, 1,
-0.3248579, -2.022718, -3.358145, 0, 1, 0.1960784, 1,
-0.3233227, 0.6444159, -1.117048, 0, 1, 0.2039216, 1,
-0.3200768, 0.03522814, -1.307009, 0, 1, 0.2078431, 1,
-0.3191918, 1.042153, 0.1766978, 0, 1, 0.2156863, 1,
-0.3167875, -0.6839543, -1.802758, 0, 1, 0.2196078, 1,
-0.3153329, -1.073217, -2.802661, 0, 1, 0.227451, 1,
-0.3126699, 0.144534, -1.782074, 0, 1, 0.2313726, 1,
-0.3086477, 0.3881704, -1.689843, 0, 1, 0.2392157, 1,
-0.3037378, 0.1020206, -1.165151, 0, 1, 0.2431373, 1,
-0.3026189, -0.7347061, -2.271642, 0, 1, 0.2509804, 1,
-0.3006248, 0.1942049, -0.6799957, 0, 1, 0.254902, 1,
-0.2952412, 1.362324, -0.3527072, 0, 1, 0.2627451, 1,
-0.2884544, -0.1623104, -2.813805, 0, 1, 0.2666667, 1,
-0.2846788, 0.4413074, -1.623471, 0, 1, 0.2745098, 1,
-0.2747798, -0.9495528, -3.75337, 0, 1, 0.2784314, 1,
-0.2743869, -1.135635, -3.21833, 0, 1, 0.2862745, 1,
-0.2693723, -2.213598, -4.613429, 0, 1, 0.2901961, 1,
-0.2666601, 1.937028, -0.7435678, 0, 1, 0.2980392, 1,
-0.2607169, 0.3863632, -1.149592, 0, 1, 0.3058824, 1,
-0.2600158, -2.154057, -3.311443, 0, 1, 0.3098039, 1,
-0.2592241, -1.401176, -4.103818, 0, 1, 0.3176471, 1,
-0.2588356, -0.03188483, -0.04954551, 0, 1, 0.3215686, 1,
-0.2587159, -1.417887, -3.500389, 0, 1, 0.3294118, 1,
-0.2508794, -0.0293531, -1.156824, 0, 1, 0.3333333, 1,
-0.2456879, -0.2227347, -2.929004, 0, 1, 0.3411765, 1,
-0.2455067, 0.5881758, -1.079357, 0, 1, 0.345098, 1,
-0.2440485, -0.6416667, -3.074053, 0, 1, 0.3529412, 1,
-0.2286929, 0.2932496, -2.321037, 0, 1, 0.3568628, 1,
-0.2280653, 0.4141599, 0.7097851, 0, 1, 0.3647059, 1,
-0.2217798, -0.4581259, -4.150234, 0, 1, 0.3686275, 1,
-0.219761, -1.23562, -3.723947, 0, 1, 0.3764706, 1,
-0.2181623, 0.4162585, 0.1924466, 0, 1, 0.3803922, 1,
-0.216922, 1.608059, -0.05884003, 0, 1, 0.3882353, 1,
-0.215644, 0.02594458, -1.645656, 0, 1, 0.3921569, 1,
-0.2146784, 0.4366272, -1.326148, 0, 1, 0.4, 1,
-0.2126113, 0.01297302, -1.679105, 0, 1, 0.4078431, 1,
-0.2119203, 0.2870938, 0.4772413, 0, 1, 0.4117647, 1,
-0.2111479, 0.09459639, -2.550722, 0, 1, 0.4196078, 1,
-0.2056702, 1.181639, -0.630978, 0, 1, 0.4235294, 1,
-0.204594, 1.030984, -0.1393535, 0, 1, 0.4313726, 1,
-0.1938505, 0.9997537, -1.134336, 0, 1, 0.4352941, 1,
-0.192945, 1.091036, -1.371823, 0, 1, 0.4431373, 1,
-0.1895956, 0.5706427, -1.75493, 0, 1, 0.4470588, 1,
-0.1857843, -1.662052, -3.8756, 0, 1, 0.454902, 1,
-0.1837938, -0.717028, -4.772773, 0, 1, 0.4588235, 1,
-0.1789556, 0.4714198, -0.6967683, 0, 1, 0.4666667, 1,
-0.1724672, -2.161688, -3.686189, 0, 1, 0.4705882, 1,
-0.1629095, -0.7173019, -3.3513, 0, 1, 0.4784314, 1,
-0.1611793, -0.8025724, -3.573046, 0, 1, 0.4823529, 1,
-0.1596142, 1.125784, 0.3338556, 0, 1, 0.4901961, 1,
-0.1583364, -0.2678532, -2.690336, 0, 1, 0.4941176, 1,
-0.1536087, -0.8953743, -3.736784, 0, 1, 0.5019608, 1,
-0.153189, -0.4532192, -3.038555, 0, 1, 0.509804, 1,
-0.1525723, 1.01652, -0.5463365, 0, 1, 0.5137255, 1,
-0.1471277, 0.01808425, -1.640861, 0, 1, 0.5215687, 1,
-0.1465152, 0.8378449, -1.425191, 0, 1, 0.5254902, 1,
-0.1455022, -0.4357348, -2.263569, 0, 1, 0.5333334, 1,
-0.1353651, 0.08680043, -1.546512, 0, 1, 0.5372549, 1,
-0.1316828, 0.914069, 0.1272499, 0, 1, 0.5450981, 1,
-0.1310027, 0.1815434, -1.087205, 0, 1, 0.5490196, 1,
-0.1276329, -1.052256, -3.58122, 0, 1, 0.5568628, 1,
-0.1265948, -0.2870123, -3.732549, 0, 1, 0.5607843, 1,
-0.121701, 1.222697, 0.1205006, 0, 1, 0.5686275, 1,
-0.1210679, 0.2538874, -0.8935906, 0, 1, 0.572549, 1,
-0.1205694, -0.6538121, -1.896265, 0, 1, 0.5803922, 1,
-0.118959, -0.8715047, -3.885439, 0, 1, 0.5843138, 1,
-0.1184372, -0.1198155, -2.102296, 0, 1, 0.5921569, 1,
-0.11782, -0.6331223, -2.279107, 0, 1, 0.5960785, 1,
-0.1122283, 0.7636234, -0.4844492, 0, 1, 0.6039216, 1,
-0.1102313, 0.3848858, -0.5675734, 0, 1, 0.6117647, 1,
-0.1025658, -1.278248, -2.417603, 0, 1, 0.6156863, 1,
-0.09987205, -0.7372019, -5.035697, 0, 1, 0.6235294, 1,
-0.09219353, -0.9237546, -3.459926, 0, 1, 0.627451, 1,
-0.08563138, -0.03636543, -2.254721, 0, 1, 0.6352941, 1,
-0.08375127, -0.8827544, -2.258716, 0, 1, 0.6392157, 1,
-0.07271567, -0.4166742, -2.853107, 0, 1, 0.6470588, 1,
-0.07188568, -0.5997399, -0.5861574, 0, 1, 0.6509804, 1,
-0.07173919, -0.5283151, -2.562207, 0, 1, 0.6588235, 1,
-0.06530816, -1.220323, -2.703124, 0, 1, 0.6627451, 1,
-0.06374089, -0.04160436, -1.31711, 0, 1, 0.6705883, 1,
-0.06045657, 2.607539, -1.102656, 0, 1, 0.6745098, 1,
-0.05330017, 0.1613358, 0.9716998, 0, 1, 0.682353, 1,
-0.05228451, 1.040208, 1.618643, 0, 1, 0.6862745, 1,
-0.04802135, -0.1721955, -4.109656, 0, 1, 0.6941177, 1,
-0.04692308, -1.156818, -4.015095, 0, 1, 0.7019608, 1,
-0.04528608, -0.3378714, -1.753067, 0, 1, 0.7058824, 1,
-0.0429449, 2.819046, 0.4520793, 0, 1, 0.7137255, 1,
-0.04290853, -0.5975934, -2.771901, 0, 1, 0.7176471, 1,
-0.03933723, -0.5081993, -3.083424, 0, 1, 0.7254902, 1,
-0.03768866, -0.7981698, -4.472987, 0, 1, 0.7294118, 1,
-0.03453243, -2.429139, -2.801517, 0, 1, 0.7372549, 1,
-0.02901611, -0.1366389, -3.674538, 0, 1, 0.7411765, 1,
-0.02791296, -0.4830803, -3.219497, 0, 1, 0.7490196, 1,
-0.02774963, -0.9052073, -2.168673, 0, 1, 0.7529412, 1,
-0.02610882, 0.04446291, -1.127439, 0, 1, 0.7607843, 1,
-0.0258932, -0.05085358, -2.488328, 0, 1, 0.7647059, 1,
-0.02398094, -0.0799801, -2.822887, 0, 1, 0.772549, 1,
-0.02300339, -0.5197814, -2.124107, 0, 1, 0.7764706, 1,
-0.02218397, -0.8638169, -2.863325, 0, 1, 0.7843137, 1,
-0.01831289, -0.8443788, -2.619853, 0, 1, 0.7882353, 1,
-0.01514008, -0.03240237, -2.528577, 0, 1, 0.7960784, 1,
-0.0142375, -1.371686, -2.159574, 0, 1, 0.8039216, 1,
-0.01243336, 0.1966798, -0.2938968, 0, 1, 0.8078431, 1,
-0.01094726, -0.6478939, -2.2417, 0, 1, 0.8156863, 1,
-0.01019885, -0.09231924, -4.590438, 0, 1, 0.8196079, 1,
-0.008205882, -0.4938098, -4.993527, 0, 1, 0.827451, 1,
-0.002182868, 0.9060771, -0.4025287, 0, 1, 0.8313726, 1,
0.008016638, 0.1534012, 0.0475191, 0, 1, 0.8392157, 1,
0.009925552, 1.128898, 0.7544552, 0, 1, 0.8431373, 1,
0.01118514, -0.1482169, 4.30536, 0, 1, 0.8509804, 1,
0.01544826, 1.874152, -0.5576399, 0, 1, 0.854902, 1,
0.01616825, -1.670717, 3.987305, 0, 1, 0.8627451, 1,
0.01630523, -0.119534, 4.582303, 0, 1, 0.8666667, 1,
0.01692631, 1.341913, 0.1304832, 0, 1, 0.8745098, 1,
0.01832315, 0.6555902, -0.7595091, 0, 1, 0.8784314, 1,
0.0200614, 0.753718, -0.1181054, 0, 1, 0.8862745, 1,
0.02165193, 1.219383, 0.8545204, 0, 1, 0.8901961, 1,
0.0232325, -0.2715968, 3.79635, 0, 1, 0.8980392, 1,
0.0232491, -0.2248308, 1.674099, 0, 1, 0.9058824, 1,
0.02463596, 0.2027948, -0.6408175, 0, 1, 0.9098039, 1,
0.02694714, 0.558113, -0.3351915, 0, 1, 0.9176471, 1,
0.02800086, -0.8331408, 4.140877, 0, 1, 0.9215686, 1,
0.02860247, -1.113645, 3.700596, 0, 1, 0.9294118, 1,
0.02892492, -0.1243414, 2.794382, 0, 1, 0.9333333, 1,
0.03035956, 0.02309566, 0.8705518, 0, 1, 0.9411765, 1,
0.03129523, -0.1560285, 3.953341, 0, 1, 0.945098, 1,
0.03821129, 0.563919, -0.2029033, 0, 1, 0.9529412, 1,
0.03918422, 1.714758, 0.9335299, 0, 1, 0.9568627, 1,
0.0407571, -0.8104727, 4.674079, 0, 1, 0.9647059, 1,
0.04247129, -1.269043, 3.540801, 0, 1, 0.9686275, 1,
0.04665835, 0.6064365, 0.03039346, 0, 1, 0.9764706, 1,
0.05016605, 0.2706546, -1.662526, 0, 1, 0.9803922, 1,
0.05344764, 1.085867, 0.9734348, 0, 1, 0.9882353, 1,
0.05471664, -0.4332224, 3.674926, 0, 1, 0.9921569, 1,
0.05532304, -1.345618, 2.427105, 0, 1, 1, 1,
0.05858443, 0.01280256, 1.963038, 0, 0.9921569, 1, 1,
0.06298619, -0.2438295, 2.797742, 0, 0.9882353, 1, 1,
0.06512929, -0.2601048, 3.35287, 0, 0.9803922, 1, 1,
0.06935174, -1.652945, 0.7500312, 0, 0.9764706, 1, 1,
0.0720628, -1.111744, 3.581536, 0, 0.9686275, 1, 1,
0.07298721, 0.564084, -0.2039346, 0, 0.9647059, 1, 1,
0.07538364, 1.239075, 0.07858521, 0, 0.9568627, 1, 1,
0.0778801, 2.507941, -0.9963709, 0, 0.9529412, 1, 1,
0.08089866, -0.3495269, 3.340787, 0, 0.945098, 1, 1,
0.08091789, 0.8399168, -0.1298303, 0, 0.9411765, 1, 1,
0.0861438, 0.9541338, -1.16216, 0, 0.9333333, 1, 1,
0.08751372, 0.3214282, -1.585008, 0, 0.9294118, 1, 1,
0.09031653, -0.9473057, 2.254759, 0, 0.9215686, 1, 1,
0.09376812, 1.475652, -0.3962491, 0, 0.9176471, 1, 1,
0.09673229, 0.4681513, 1.523724, 0, 0.9098039, 1, 1,
0.102169, 0.9344245, -1.431571, 0, 0.9058824, 1, 1,
0.1057794, 0.2062785, 0.1698915, 0, 0.8980392, 1, 1,
0.1058638, 2.059619, 0.1520896, 0, 0.8901961, 1, 1,
0.1070962, -0.0344676, 1.476205, 0, 0.8862745, 1, 1,
0.1079914, -1.874523, 1.653007, 0, 0.8784314, 1, 1,
0.1085157, 1.473729, 0.5698029, 0, 0.8745098, 1, 1,
0.1087864, 1.753367, -1.099787, 0, 0.8666667, 1, 1,
0.1126336, 1.123052, -1.286828, 0, 0.8627451, 1, 1,
0.11381, -1.564907, 3.72543, 0, 0.854902, 1, 1,
0.1170952, -0.9395908, 2.303077, 0, 0.8509804, 1, 1,
0.1178471, -0.8993954, 1.233519, 0, 0.8431373, 1, 1,
0.1179807, -0.1981252, 2.438541, 0, 0.8392157, 1, 1,
0.1223244, 0.358443, -0.09804247, 0, 0.8313726, 1, 1,
0.1226318, -1.354244, 2.701251, 0, 0.827451, 1, 1,
0.1226521, 0.111615, -0.3787564, 0, 0.8196079, 1, 1,
0.1280668, -1.137895, 3.543779, 0, 0.8156863, 1, 1,
0.1282975, -0.9532005, 4.100933, 0, 0.8078431, 1, 1,
0.1363237, 0.5846474, 0.07154562, 0, 0.8039216, 1, 1,
0.1363577, -0.7774261, 3.604972, 0, 0.7960784, 1, 1,
0.1400505, 0.3120231, -1.861254, 0, 0.7882353, 1, 1,
0.1456333, -0.4335965, 2.638706, 0, 0.7843137, 1, 1,
0.1481497, 0.8269358, 0.2404369, 0, 0.7764706, 1, 1,
0.1515341, 0.7460639, -1.538782, 0, 0.772549, 1, 1,
0.1532396, 0.4412787, 0.906419, 0, 0.7647059, 1, 1,
0.1558517, 0.7630186, -0.2161886, 0, 0.7607843, 1, 1,
0.1569144, 0.1534964, 2.240445, 0, 0.7529412, 1, 1,
0.1595183, -0.9823539, 3.119822, 0, 0.7490196, 1, 1,
0.1625837, 0.3393089, 2.316437, 0, 0.7411765, 1, 1,
0.1629087, -1.61601, 3.101942, 0, 0.7372549, 1, 1,
0.1654884, 0.8816829, 1.204241, 0, 0.7294118, 1, 1,
0.1737997, 1.655505, -1.228212, 0, 0.7254902, 1, 1,
0.1746339, 0.4661853, 1.512325, 0, 0.7176471, 1, 1,
0.1748109, 0.1570265, 0.4386734, 0, 0.7137255, 1, 1,
0.1770076, 0.5775424, 0.5675587, 0, 0.7058824, 1, 1,
0.1806816, -2.173418, 4.52919, 0, 0.6980392, 1, 1,
0.1824131, -1.062628, 3.50552, 0, 0.6941177, 1, 1,
0.18245, 0.3935148, 2.346364, 0, 0.6862745, 1, 1,
0.1834967, -1.024441, 3.687245, 0, 0.682353, 1, 1,
0.1835885, -0.2743093, 2.368846, 0, 0.6745098, 1, 1,
0.1855962, 0.1972242, 0.07767326, 0, 0.6705883, 1, 1,
0.1866229, 1.127719, -0.7450211, 0, 0.6627451, 1, 1,
0.1872997, -0.6454552, 3.04273, 0, 0.6588235, 1, 1,
0.1876689, 0.4452232, 0.2920141, 0, 0.6509804, 1, 1,
0.1938402, -1.354058, 2.824366, 0, 0.6470588, 1, 1,
0.1943648, -0.3914916, 3.408494, 0, 0.6392157, 1, 1,
0.195004, 0.2011888, -0.3002805, 0, 0.6352941, 1, 1,
0.1955393, -0.5522857, 1.443204, 0, 0.627451, 1, 1,
0.1985562, 0.8655333, -0.9929979, 0, 0.6235294, 1, 1,
0.2054572, -0.7240169, 4.373124, 0, 0.6156863, 1, 1,
0.2057341, -0.5798353, 2.146528, 0, 0.6117647, 1, 1,
0.2087345, 0.9874838, -0.1619421, 0, 0.6039216, 1, 1,
0.2090512, -0.4547783, 1.778756, 0, 0.5960785, 1, 1,
0.2091219, 0.5214619, 1.145333, 0, 0.5921569, 1, 1,
0.210266, -0.6825504, 3.634119, 0, 0.5843138, 1, 1,
0.2142938, -1.273812, 2.161475, 0, 0.5803922, 1, 1,
0.2155782, 0.8212798, 2.242577, 0, 0.572549, 1, 1,
0.2174321, 1.539575, 0.2119764, 0, 0.5686275, 1, 1,
0.2284881, 0.07831759, 0.6987903, 0, 0.5607843, 1, 1,
0.2320162, -0.920379, 3.42568, 0, 0.5568628, 1, 1,
0.2327039, -1.088232, 4.188872, 0, 0.5490196, 1, 1,
0.2334037, -1.799946, 4.549433, 0, 0.5450981, 1, 1,
0.2338177, 1.08329, -0.857749, 0, 0.5372549, 1, 1,
0.2379582, -0.2647398, 2.28243, 0, 0.5333334, 1, 1,
0.2398783, -0.6238626, 0.9984494, 0, 0.5254902, 1, 1,
0.2421892, 0.2736193, 0.4554952, 0, 0.5215687, 1, 1,
0.2555061, -0.07542586, 2.062222, 0, 0.5137255, 1, 1,
0.2599461, -0.008839332, 2.963445, 0, 0.509804, 1, 1,
0.2623246, -0.3973145, 2.568558, 0, 0.5019608, 1, 1,
0.2644728, 1.271896, 0.7409469, 0, 0.4941176, 1, 1,
0.2682826, -0.01246644, 0.7186385, 0, 0.4901961, 1, 1,
0.2816266, 0.422358, 0.008960507, 0, 0.4823529, 1, 1,
0.2821599, 1.140589, 1.370594, 0, 0.4784314, 1, 1,
0.2901892, 1.126155, 0.6454259, 0, 0.4705882, 1, 1,
0.2909599, -0.9426588, 3.000629, 0, 0.4666667, 1, 1,
0.292163, 0.7607315, 0.2893804, 0, 0.4588235, 1, 1,
0.292244, 0.7391159, -0.06414636, 0, 0.454902, 1, 1,
0.2979479, -1.479268, 3.511575, 0, 0.4470588, 1, 1,
0.3047391, -1.706906, 3.794325, 0, 0.4431373, 1, 1,
0.3069296, 0.8480457, 1.665104, 0, 0.4352941, 1, 1,
0.3135302, -1.106097, 2.649931, 0, 0.4313726, 1, 1,
0.3137493, -0.4121645, 2.623399, 0, 0.4235294, 1, 1,
0.31388, -0.1736043, 1.990397, 0, 0.4196078, 1, 1,
0.3147769, -2.310468, 3.087974, 0, 0.4117647, 1, 1,
0.3157366, 0.3281132, -0.1650331, 0, 0.4078431, 1, 1,
0.3158983, -1.804215, 2.777333, 0, 0.4, 1, 1,
0.3185535, -0.1987077, 1.304134, 0, 0.3921569, 1, 1,
0.3223736, 0.5772556, 1.545022, 0, 0.3882353, 1, 1,
0.3281122, -0.01009329, 0.7503908, 0, 0.3803922, 1, 1,
0.3282726, 0.4985864, -0.09729756, 0, 0.3764706, 1, 1,
0.330583, -0.4733348, 2.867626, 0, 0.3686275, 1, 1,
0.3315724, 1.610864, -0.2556857, 0, 0.3647059, 1, 1,
0.3342218, -2.317589, 2.410721, 0, 0.3568628, 1, 1,
0.3366832, 0.9661196, -0.1948301, 0, 0.3529412, 1, 1,
0.3368132, -1.117569, 0.7086921, 0, 0.345098, 1, 1,
0.3397433, 1.074719, 0.2619171, 0, 0.3411765, 1, 1,
0.3415701, 0.1676925, -0.2030443, 0, 0.3333333, 1, 1,
0.3442105, -0.276161, 2.989807, 0, 0.3294118, 1, 1,
0.3465879, 1.669336, 0.3925343, 0, 0.3215686, 1, 1,
0.3481893, -0.2467449, 1.883108, 0, 0.3176471, 1, 1,
0.3506742, -0.3712969, 1.181592, 0, 0.3098039, 1, 1,
0.3508649, -0.6202397, 3.430076, 0, 0.3058824, 1, 1,
0.3528895, 0.8589972, -0.1236383, 0, 0.2980392, 1, 1,
0.3545979, -0.2816063, 1.743485, 0, 0.2901961, 1, 1,
0.358932, -1.038426, 2.126512, 0, 0.2862745, 1, 1,
0.3611681, 0.1135622, -1.701239, 0, 0.2784314, 1, 1,
0.3618318, -0.09377861, 1.990519, 0, 0.2745098, 1, 1,
0.3621214, -0.3773535, 3.571172, 0, 0.2666667, 1, 1,
0.3637784, 0.6111918, 1.273142, 0, 0.2627451, 1, 1,
0.3693417, 0.6928263, 1.399393, 0, 0.254902, 1, 1,
0.3694953, 0.5500624, 0.634044, 0, 0.2509804, 1, 1,
0.3802322, 0.5003731, 0.6700256, 0, 0.2431373, 1, 1,
0.3833579, -0.3810531, 1.642662, 0, 0.2392157, 1, 1,
0.3874006, 0.6587655, -0.3401461, 0, 0.2313726, 1, 1,
0.3939802, 0.09719363, 1.685944, 0, 0.227451, 1, 1,
0.3988159, -1.343449, 3.778792, 0, 0.2196078, 1, 1,
0.4055647, -0.2210741, 3.207014, 0, 0.2156863, 1, 1,
0.4080188, -0.2603557, 1.470409, 0, 0.2078431, 1, 1,
0.4094218, -0.5252559, 3.072697, 0, 0.2039216, 1, 1,
0.4094475, 0.09758188, 2.270716, 0, 0.1960784, 1, 1,
0.410098, 0.5637795, -0.6378946, 0, 0.1882353, 1, 1,
0.4106645, -1.279957, 2.328274, 0, 0.1843137, 1, 1,
0.4148783, -0.2290004, 3.455574, 0, 0.1764706, 1, 1,
0.4170505, 0.4836025, 0.4196023, 0, 0.172549, 1, 1,
0.4179412, -1.267306, 2.965393, 0, 0.1647059, 1, 1,
0.4204801, -0.1535151, 0.7639464, 0, 0.1607843, 1, 1,
0.4210994, -0.5267208, 2.093004, 0, 0.1529412, 1, 1,
0.4234403, 0.08766703, 2.227217, 0, 0.1490196, 1, 1,
0.4269423, -0.2146566, 2.489006, 0, 0.1411765, 1, 1,
0.4281615, 0.8162306, 0.08060653, 0, 0.1372549, 1, 1,
0.4295567, -0.3992507, 2.931176, 0, 0.1294118, 1, 1,
0.4305901, -0.02367388, 0.08615929, 0, 0.1254902, 1, 1,
0.4306133, 1.48055, 0.4254937, 0, 0.1176471, 1, 1,
0.4337985, -0.7611058, 3.410213, 0, 0.1137255, 1, 1,
0.4431225, 0.2472671, 1.709632, 0, 0.1058824, 1, 1,
0.4437332, -0.6418162, 1.647494, 0, 0.09803922, 1, 1,
0.4443631, 0.2633895, -0.6194301, 0, 0.09411765, 1, 1,
0.4475625, -0.6484406, 1.644272, 0, 0.08627451, 1, 1,
0.4482117, 0.2685361, 0.7917521, 0, 0.08235294, 1, 1,
0.4508849, 0.9934714, 3.334408, 0, 0.07450981, 1, 1,
0.4509734, 0.5194434, -0.6035723, 0, 0.07058824, 1, 1,
0.4527136, -0.8167674, 1.723795, 0, 0.0627451, 1, 1,
0.459156, 0.01065814, 1.620349, 0, 0.05882353, 1, 1,
0.4664038, 1.421701, 0.8269267, 0, 0.05098039, 1, 1,
0.4673679, -2.566999, 4.277485, 0, 0.04705882, 1, 1,
0.4686382, -0.008052885, 2.071745, 0, 0.03921569, 1, 1,
0.4721841, -1.777002, 1.051367, 0, 0.03529412, 1, 1,
0.4753409, 0.6302609, 0.0938658, 0, 0.02745098, 1, 1,
0.4773363, -0.1225713, 2.387105, 0, 0.02352941, 1, 1,
0.4839466, -1.800963, 4.40903, 0, 0.01568628, 1, 1,
0.485613, 1.230411, 1.242725, 0, 0.01176471, 1, 1,
0.4866422, 0.4947027, 1.457959, 0, 0.003921569, 1, 1,
0.4883981, 0.4932747, -1.237822, 0.003921569, 0, 1, 1,
0.493126, -0.7754068, -0.3495509, 0.007843138, 0, 1, 1,
0.4939172, -0.5563364, 1.846324, 0.01568628, 0, 1, 1,
0.5007853, -0.542143, 2.342918, 0.01960784, 0, 1, 1,
0.5033118, 0.2430289, 1.846883, 0.02745098, 0, 1, 1,
0.5042347, 1.500351, 0.959552, 0.03137255, 0, 1, 1,
0.5050157, -0.5484508, 1.723459, 0.03921569, 0, 1, 1,
0.5062714, 0.8342364, -0.6183571, 0.04313726, 0, 1, 1,
0.5138066, 1.177238, -0.1745399, 0.05098039, 0, 1, 1,
0.5150918, 0.08130369, 1.007425, 0.05490196, 0, 1, 1,
0.5187567, 0.9387453, 0.2931924, 0.0627451, 0, 1, 1,
0.5214405, -3.070305, 3.259137, 0.06666667, 0, 1, 1,
0.5220408, 1.233035, 0.4435198, 0.07450981, 0, 1, 1,
0.523424, -0.3018709, 1.919904, 0.07843138, 0, 1, 1,
0.528587, -0.1678577, 1.328689, 0.08627451, 0, 1, 1,
0.5290356, -0.2011167, 3.008651, 0.09019608, 0, 1, 1,
0.5322029, 0.2601212, 0.7145879, 0.09803922, 0, 1, 1,
0.5329172, -1.427815, 3.065421, 0.1058824, 0, 1, 1,
0.5392253, -1.499402, 4.34596, 0.1098039, 0, 1, 1,
0.5397124, 0.805088, 3.006389, 0.1176471, 0, 1, 1,
0.5485892, -1.332175, 3.169134, 0.1215686, 0, 1, 1,
0.5518264, 0.2391296, 2.846262, 0.1294118, 0, 1, 1,
0.5560517, 1.065804, 1.521154, 0.1333333, 0, 1, 1,
0.5574512, 0.03592706, 0.9295505, 0.1411765, 0, 1, 1,
0.5656096, 1.15157, -1.346657, 0.145098, 0, 1, 1,
0.5676654, -0.06814795, 0.8403576, 0.1529412, 0, 1, 1,
0.5742507, 0.4841882, 0.4948457, 0.1568628, 0, 1, 1,
0.5744423, -1.172086, 4.080367, 0.1647059, 0, 1, 1,
0.5746745, -0.5493407, 2.626504, 0.1686275, 0, 1, 1,
0.5781618, -0.03323562, 2.276651, 0.1764706, 0, 1, 1,
0.5815905, -0.3398403, 1.825723, 0.1803922, 0, 1, 1,
0.5833692, 0.9263428, 0.612421, 0.1882353, 0, 1, 1,
0.5836654, 1.177647, -0.2177669, 0.1921569, 0, 1, 1,
0.5875923, 0.7388331, 1.4922, 0.2, 0, 1, 1,
0.5911368, -1.607012, 1.924543, 0.2078431, 0, 1, 1,
0.5912637, -0.3215204, 2.861916, 0.2117647, 0, 1, 1,
0.5914354, -0.4085225, 2.525914, 0.2196078, 0, 1, 1,
0.5958441, -1.435389, 2.397965, 0.2235294, 0, 1, 1,
0.5963497, -0.2153301, 2.009748, 0.2313726, 0, 1, 1,
0.5982293, -0.8534642, 4.007495, 0.2352941, 0, 1, 1,
0.5987234, 0.9699809, 0.1975101, 0.2431373, 0, 1, 1,
0.6010237, -0.2670532, 2.474285, 0.2470588, 0, 1, 1,
0.6027617, -0.004347714, 1.543399, 0.254902, 0, 1, 1,
0.6042352, -0.932954, 0.4201795, 0.2588235, 0, 1, 1,
0.6072574, 0.8004026, 1.583388, 0.2666667, 0, 1, 1,
0.6096085, 0.6146994, -1.219861, 0.2705882, 0, 1, 1,
0.6101577, -0.2910968, 0.4670234, 0.2784314, 0, 1, 1,
0.6112767, -0.7106349, 3.867056, 0.282353, 0, 1, 1,
0.6222106, -0.7889394, 2.15598, 0.2901961, 0, 1, 1,
0.6256307, 0.04613765, 1.505284, 0.2941177, 0, 1, 1,
0.6282727, -0.08184946, 0.7244136, 0.3019608, 0, 1, 1,
0.6293845, 0.7318648, 0.05631499, 0.3098039, 0, 1, 1,
0.6302928, 1.031159, 0.7732153, 0.3137255, 0, 1, 1,
0.6327693, 0.8475813, 1.251029, 0.3215686, 0, 1, 1,
0.6343383, -0.5189372, 1.748623, 0.3254902, 0, 1, 1,
0.6407813, 0.3344519, -0.784455, 0.3333333, 0, 1, 1,
0.643738, -0.7165288, 2.774097, 0.3372549, 0, 1, 1,
0.6450678, -0.4233445, 1.996169, 0.345098, 0, 1, 1,
0.6526567, 0.1305291, 1.934357, 0.3490196, 0, 1, 1,
0.6568882, 0.6712309, 1.84608, 0.3568628, 0, 1, 1,
0.6584813, -0.5089919, 2.668934, 0.3607843, 0, 1, 1,
0.66181, 2.163482, -0.2814708, 0.3686275, 0, 1, 1,
0.669241, -0.8122969, 2.343345, 0.372549, 0, 1, 1,
0.6709954, -0.8291923, 2.891009, 0.3803922, 0, 1, 1,
0.6722735, -1.445486, 2.633911, 0.3843137, 0, 1, 1,
0.6793293, 0.3566383, 0.484291, 0.3921569, 0, 1, 1,
0.6845426, -0.3537382, 2.768951, 0.3960784, 0, 1, 1,
0.6865422, 0.8376793, -2.073046, 0.4039216, 0, 1, 1,
0.6900591, 1.505311, 2.035747, 0.4117647, 0, 1, 1,
0.6905564, -1.952728, 1.92507, 0.4156863, 0, 1, 1,
0.6909428, 1.541495, -0.01501037, 0.4235294, 0, 1, 1,
0.6964404, 0.1624802, 0.1416886, 0.427451, 0, 1, 1,
0.6974223, -0.512805, 1.35668, 0.4352941, 0, 1, 1,
0.6984001, -1.91577, 2.165797, 0.4392157, 0, 1, 1,
0.7002443, 0.9776177, -0.6014318, 0.4470588, 0, 1, 1,
0.7012397, -0.02488511, 0.6318675, 0.4509804, 0, 1, 1,
0.7013252, 0.07420696, 1.984632, 0.4588235, 0, 1, 1,
0.7024277, 1.204104, 1.375071, 0.4627451, 0, 1, 1,
0.7030919, 1.027246, 0.8722169, 0.4705882, 0, 1, 1,
0.7045873, -1.295212, 1.741392, 0.4745098, 0, 1, 1,
0.7046553, 0.01668996, 1.847439, 0.4823529, 0, 1, 1,
0.7077309, -0.09393256, 1.07033, 0.4862745, 0, 1, 1,
0.7178102, 0.09992304, 2.690595, 0.4941176, 0, 1, 1,
0.7189217, 0.5449553, -1.389117, 0.5019608, 0, 1, 1,
0.7196568, -1.442249, 3.248323, 0.5058824, 0, 1, 1,
0.7216597, -1.431181, 2.803253, 0.5137255, 0, 1, 1,
0.7257906, 0.7596332, 0.1921357, 0.5176471, 0, 1, 1,
0.7297437, -0.5692945, 2.665096, 0.5254902, 0, 1, 1,
0.7353505, 0.6217955, 1.943244, 0.5294118, 0, 1, 1,
0.7355683, 1.433316, -1.102102, 0.5372549, 0, 1, 1,
0.7362562, -1.500872, 1.860098, 0.5411765, 0, 1, 1,
0.7372829, -0.9425605, 2.354046, 0.5490196, 0, 1, 1,
0.7526128, -1.204293, 3.898143, 0.5529412, 0, 1, 1,
0.7558669, 0.8890339, 0.9028804, 0.5607843, 0, 1, 1,
0.7578557, -0.8002242, 1.784325, 0.5647059, 0, 1, 1,
0.7620859, -0.7583493, 1.456883, 0.572549, 0, 1, 1,
0.7647694, 0.4241293, 1.228178, 0.5764706, 0, 1, 1,
0.7658831, -1.989443, 3.269553, 0.5843138, 0, 1, 1,
0.7714699, 0.3017016, 1.848201, 0.5882353, 0, 1, 1,
0.7714782, -1.870393, 4.732085, 0.5960785, 0, 1, 1,
0.7716457, -0.003223479, 3.341447, 0.6039216, 0, 1, 1,
0.7732889, 0.6658782, 1.069069, 0.6078432, 0, 1, 1,
0.7742029, 1.766826, -1.558528, 0.6156863, 0, 1, 1,
0.7785895, -0.9421206, 2.774256, 0.6196079, 0, 1, 1,
0.7797126, 1.23241, 0.7458683, 0.627451, 0, 1, 1,
0.7832792, 0.08791501, 1.63894, 0.6313726, 0, 1, 1,
0.7842199, -1.415665, 1.795532, 0.6392157, 0, 1, 1,
0.7917519, 0.7530662, 0.3624685, 0.6431373, 0, 1, 1,
0.7921055, 2.075961, -0.07252945, 0.6509804, 0, 1, 1,
0.7950476, 0.5280188, 3.227998, 0.654902, 0, 1, 1,
0.7954147, 0.2556134, 0.8088242, 0.6627451, 0, 1, 1,
0.7972236, 0.574424, 2.120854, 0.6666667, 0, 1, 1,
0.797357, 0.4433181, 0.514301, 0.6745098, 0, 1, 1,
0.7984222, 0.1837149, -1.017174, 0.6784314, 0, 1, 1,
0.8020694, 0.6333597, 1.427548, 0.6862745, 0, 1, 1,
0.8076677, -0.2605961, 2.058188, 0.6901961, 0, 1, 1,
0.8095604, 1.185716, 1.334913, 0.6980392, 0, 1, 1,
0.8134158, -1.05816, 2.631725, 0.7058824, 0, 1, 1,
0.8196714, -1.450024, 2.923454, 0.7098039, 0, 1, 1,
0.825036, -0.6854299, 1.277119, 0.7176471, 0, 1, 1,
0.8254907, 0.5225987, 0.630635, 0.7215686, 0, 1, 1,
0.8286199, -0.5943559, 1.374154, 0.7294118, 0, 1, 1,
0.8289205, -0.1843757, 1.395435, 0.7333333, 0, 1, 1,
0.830061, 1.211557, 1.288846, 0.7411765, 0, 1, 1,
0.8364428, 0.5074047, -0.04191595, 0.7450981, 0, 1, 1,
0.8454248, 0.2834826, 1.025729, 0.7529412, 0, 1, 1,
0.8482554, -1.824028, 3.217273, 0.7568628, 0, 1, 1,
0.8512878, 0.6125172, 0.3303713, 0.7647059, 0, 1, 1,
0.8583913, -0.3930449, 3.034221, 0.7686275, 0, 1, 1,
0.8603736, 0.4025279, 1.676379, 0.7764706, 0, 1, 1,
0.8607214, 1.199531, -0.1110362, 0.7803922, 0, 1, 1,
0.8650619, 0.6961116, 0.9205055, 0.7882353, 0, 1, 1,
0.8674775, -0.548048, 3.362416, 0.7921569, 0, 1, 1,
0.8705651, 0.06588636, 0.4788163, 0.8, 0, 1, 1,
0.8735962, -0.04131847, 1.432492, 0.8078431, 0, 1, 1,
0.8793586, -0.4425775, 3.212998, 0.8117647, 0, 1, 1,
0.8799859, 0.1044267, 2.88606, 0.8196079, 0, 1, 1,
0.8814755, 1.358383, 0.7753536, 0.8235294, 0, 1, 1,
0.8819605, 1.066758, -0.2272594, 0.8313726, 0, 1, 1,
0.8849863, -0.5391105, 2.553703, 0.8352941, 0, 1, 1,
0.8896449, -2.197662, 1.957888, 0.8431373, 0, 1, 1,
0.8932568, 0.4733344, -0.3433437, 0.8470588, 0, 1, 1,
0.9081625, -0.7227381, 2.23628, 0.854902, 0, 1, 1,
0.917279, -0.7754019, 2.083117, 0.8588235, 0, 1, 1,
0.922699, 0.4133902, 0.3545149, 0.8666667, 0, 1, 1,
0.9242985, -0.8834401, 2.575478, 0.8705882, 0, 1, 1,
0.9263482, -0.8935171, 1.581264, 0.8784314, 0, 1, 1,
0.9298463, -1.156958, 3.68614, 0.8823529, 0, 1, 1,
0.9299492, -1.282134, 2.693383, 0.8901961, 0, 1, 1,
0.9303779, 0.06987498, 0.5069531, 0.8941177, 0, 1, 1,
0.9357272, -0.6495507, 2.765111, 0.9019608, 0, 1, 1,
0.9386771, -0.04932974, 2.094094, 0.9098039, 0, 1, 1,
0.9465678, 0.6981869, -1.115994, 0.9137255, 0, 1, 1,
0.9539312, 0.2317134, 0.8637207, 0.9215686, 0, 1, 1,
0.9709777, -1.028116, 1.355694, 0.9254902, 0, 1, 1,
0.9715575, -1.334291, 3.509528, 0.9333333, 0, 1, 1,
0.9725546, 0.8503765, -1.166582, 0.9372549, 0, 1, 1,
0.9738398, -0.8403856, 2.002547, 0.945098, 0, 1, 1,
0.9815546, 0.413967, -0.1296851, 0.9490196, 0, 1, 1,
0.9891097, 1.720296, 1.209482, 0.9568627, 0, 1, 1,
0.9908895, -0.2238763, 1.915515, 0.9607843, 0, 1, 1,
1.002836, 0.5263824, 1.014602, 0.9686275, 0, 1, 1,
1.009232, -1.51012, 2.576842, 0.972549, 0, 1, 1,
1.009795, -0.04039419, 1.236675, 0.9803922, 0, 1, 1,
1.011038, -0.5426148, 0.4443513, 0.9843137, 0, 1, 1,
1.016866, 0.2565646, 0.6985866, 0.9921569, 0, 1, 1,
1.025066, 0.1828344, 1.619329, 0.9960784, 0, 1, 1,
1.028474, -0.08337332, 2.727068, 1, 0, 0.9960784, 1,
1.033158, 0.01530424, 1.258929, 1, 0, 0.9882353, 1,
1.036776, -0.1422431, 1.751224, 1, 0, 0.9843137, 1,
1.038038, 0.4901723, 1.33744, 1, 0, 0.9764706, 1,
1.039481, -0.1101155, 0.374655, 1, 0, 0.972549, 1,
1.047264, 1.47829, -0.4914722, 1, 0, 0.9647059, 1,
1.047559, -1.290352, 1.634085, 1, 0, 0.9607843, 1,
1.054956, 0.2476405, 1.743573, 1, 0, 0.9529412, 1,
1.057172, -1.021125, 1.941743, 1, 0, 0.9490196, 1,
1.065851, 1.74433, 1.22838, 1, 0, 0.9411765, 1,
1.068866, -0.5474945, 2.577343, 1, 0, 0.9372549, 1,
1.07011, -1.064993, 2.303632, 1, 0, 0.9294118, 1,
1.073099, -2.301294, 2.971236, 1, 0, 0.9254902, 1,
1.076457, -0.7007683, 3.072967, 1, 0, 0.9176471, 1,
1.079334, -0.1146359, -0.1180528, 1, 0, 0.9137255, 1,
1.082233, 0.7059187, -1.348577, 1, 0, 0.9058824, 1,
1.086362, -1.582542, 3.173154, 1, 0, 0.9019608, 1,
1.09426, -0.7744439, 2.558551, 1, 0, 0.8941177, 1,
1.099234, -0.02200587, 1.299267, 1, 0, 0.8862745, 1,
1.099774, 0.9549001, 1.883685, 1, 0, 0.8823529, 1,
1.104717, 0.4786775, 3.198744, 1, 0, 0.8745098, 1,
1.105409, 0.4734998, 1.609553, 1, 0, 0.8705882, 1,
1.106654, 0.003164038, 1.155617, 1, 0, 0.8627451, 1,
1.107315, 0.7687147, 1.288623, 1, 0, 0.8588235, 1,
1.108971, -0.909261, 1.311985, 1, 0, 0.8509804, 1,
1.111398, 0.06493449, 1.460834, 1, 0, 0.8470588, 1,
1.11405, -0.432681, 2.108598, 1, 0, 0.8392157, 1,
1.115009, 0.0208333, 3.090334, 1, 0, 0.8352941, 1,
1.117844, 1.892387, 0.3522505, 1, 0, 0.827451, 1,
1.119686, -0.4093188, 2.11655, 1, 0, 0.8235294, 1,
1.123355, -0.8328008, 1.44972, 1, 0, 0.8156863, 1,
1.123992, 1.384121, -0.07546467, 1, 0, 0.8117647, 1,
1.128918, 0.2674898, -0.06829765, 1, 0, 0.8039216, 1,
1.130832, 1.057386, 2.207095, 1, 0, 0.7960784, 1,
1.135799, -0.4916857, 2.458596, 1, 0, 0.7921569, 1,
1.142027, -0.4292672, 2.451313, 1, 0, 0.7843137, 1,
1.145734, 1.245341, 0.09357348, 1, 0, 0.7803922, 1,
1.151023, -0.9083139, 1.955987, 1, 0, 0.772549, 1,
1.152966, -1.089325, 4.079501, 1, 0, 0.7686275, 1,
1.153362, -1.482682, 2.230063, 1, 0, 0.7607843, 1,
1.155749, -0.5868519, 2.115444, 1, 0, 0.7568628, 1,
1.160458, 0.4354545, 2.112659, 1, 0, 0.7490196, 1,
1.164724, -0.3598295, 1.055483, 1, 0, 0.7450981, 1,
1.165528, 1.576651, 0.06020732, 1, 0, 0.7372549, 1,
1.16588, 0.02793457, 2.821029, 1, 0, 0.7333333, 1,
1.166044, -0.7331106, 2.417378, 1, 0, 0.7254902, 1,
1.170253, 0.5534225, 1.056589, 1, 0, 0.7215686, 1,
1.179352, 0.2038771, 2.093404, 1, 0, 0.7137255, 1,
1.186616, 1.109992, 3.370793, 1, 0, 0.7098039, 1,
1.20077, -1.53312, 1.824867, 1, 0, 0.7019608, 1,
1.203187, -0.4322674, 2.347528, 1, 0, 0.6941177, 1,
1.210696, -0.09371035, 1.432457, 1, 0, 0.6901961, 1,
1.213203, 1.093662, 0.9464907, 1, 0, 0.682353, 1,
1.215835, -1.69088, 3.367797, 1, 0, 0.6784314, 1,
1.216043, 2.099883, -1.045045, 1, 0, 0.6705883, 1,
1.224985, 1.308207, 1.328124, 1, 0, 0.6666667, 1,
1.242437, -0.269606, 3.155214, 1, 0, 0.6588235, 1,
1.244188, 0.9928262, 0.3205532, 1, 0, 0.654902, 1,
1.253732, 0.6116267, -0.878412, 1, 0, 0.6470588, 1,
1.267814, 0.7230122, 1.801654, 1, 0, 0.6431373, 1,
1.296208, -0.5254607, 1.992885, 1, 0, 0.6352941, 1,
1.297508, -0.422194, 1.080825, 1, 0, 0.6313726, 1,
1.304994, -0.3591048, 2.638886, 1, 0, 0.6235294, 1,
1.309011, 0.3975761, 0.4685024, 1, 0, 0.6196079, 1,
1.311423, 0.7368865, -0.8548885, 1, 0, 0.6117647, 1,
1.312024, 0.8246583, 1.068637, 1, 0, 0.6078432, 1,
1.312377, 0.2683501, 1.306819, 1, 0, 0.6, 1,
1.321373, -0.3937939, 2.480863, 1, 0, 0.5921569, 1,
1.323513, 0.3422233, 0.7189845, 1, 0, 0.5882353, 1,
1.328256, -0.2644587, 0.969614, 1, 0, 0.5803922, 1,
1.329438, 0.8475875, 1.345771, 1, 0, 0.5764706, 1,
1.331564, -0.3449417, 2.559012, 1, 0, 0.5686275, 1,
1.350602, -1.060626, 1.364398, 1, 0, 0.5647059, 1,
1.36482, 0.1385162, 1.982633, 1, 0, 0.5568628, 1,
1.379137, 0.7625866, -0.02217169, 1, 0, 0.5529412, 1,
1.380714, -0.4637892, 1.438558, 1, 0, 0.5450981, 1,
1.381662, -0.8962391, 1.98382, 1, 0, 0.5411765, 1,
1.384477, 0.08209344, 0.8732513, 1, 0, 0.5333334, 1,
1.385293, -0.8610601, 2.552188, 1, 0, 0.5294118, 1,
1.386341, 0.6003894, 0.7870163, 1, 0, 0.5215687, 1,
1.387414, -1.693057, 3.197075, 1, 0, 0.5176471, 1,
1.393431, 0.5453314, 1.146736, 1, 0, 0.509804, 1,
1.40062, -0.2869293, 1.749326, 1, 0, 0.5058824, 1,
1.407053, -2.051667, 1.594664, 1, 0, 0.4980392, 1,
1.407937, -0.4461253, 1.343195, 1, 0, 0.4901961, 1,
1.412561, 1.429044, -0.4888751, 1, 0, 0.4862745, 1,
1.416336, 1.407748, 2.359541, 1, 0, 0.4784314, 1,
1.418942, -0.3278763, 2.220418, 1, 0, 0.4745098, 1,
1.43913, -2.146974, 0.969455, 1, 0, 0.4666667, 1,
1.472068, -1.75746, 1.386021, 1, 0, 0.4627451, 1,
1.474423, 0.5835879, 1.702369, 1, 0, 0.454902, 1,
1.480582, 1.59007, 1.453219, 1, 0, 0.4509804, 1,
1.500102, -1.451914, 2.21067, 1, 0, 0.4431373, 1,
1.519441, 0.7112179, 2.655013, 1, 0, 0.4392157, 1,
1.523745, 1.579219, -0.9717113, 1, 0, 0.4313726, 1,
1.543636, 0.03772439, 1.659031, 1, 0, 0.427451, 1,
1.548733, -0.6986371, 2.420509, 1, 0, 0.4196078, 1,
1.554803, -0.1306118, 2.431873, 1, 0, 0.4156863, 1,
1.574578, 0.1770832, 2.684436, 1, 0, 0.4078431, 1,
1.580418, -0.7996867, 3.093331, 1, 0, 0.4039216, 1,
1.591594, -0.4323927, 1.762477, 1, 0, 0.3960784, 1,
1.602039, -0.5397149, 1.186356, 1, 0, 0.3882353, 1,
1.606727, -0.09781842, 2.917582, 1, 0, 0.3843137, 1,
1.61666, 0.1746351, -0.2427638, 1, 0, 0.3764706, 1,
1.616947, 0.4292429, 4.021737, 1, 0, 0.372549, 1,
1.64254, 0.129991, 1.364332, 1, 0, 0.3647059, 1,
1.64834, -0.270736, 0.0500516, 1, 0, 0.3607843, 1,
1.648382, 3.117158, -2.095532, 1, 0, 0.3529412, 1,
1.658788, 0.6671898, 1.864333, 1, 0, 0.3490196, 1,
1.669416, 1.198677, 0.6038975, 1, 0, 0.3411765, 1,
1.671886, 0.9364297, 2.317966, 1, 0, 0.3372549, 1,
1.679399, 0.8641422, 0.2117934, 1, 0, 0.3294118, 1,
1.67944, -0.5023791, -0.5500666, 1, 0, 0.3254902, 1,
1.680592, 1.948835, 1.409005, 1, 0, 0.3176471, 1,
1.699639, 0.5481911, 1.657206, 1, 0, 0.3137255, 1,
1.706181, 0.6471183, 1.358275, 1, 0, 0.3058824, 1,
1.717152, 0.2188718, 2.628835, 1, 0, 0.2980392, 1,
1.731928, -0.516485, 1.922615, 1, 0, 0.2941177, 1,
1.738312, -0.08198912, 1.727485, 1, 0, 0.2862745, 1,
1.747621, -1.229773, 2.813945, 1, 0, 0.282353, 1,
1.775614, 0.7496483, 0.4478424, 1, 0, 0.2745098, 1,
1.798803, -0.5793362, 2.271582, 1, 0, 0.2705882, 1,
1.809512, -1.079958, 2.03763, 1, 0, 0.2627451, 1,
1.8288, 0.338929, 2.329159, 1, 0, 0.2588235, 1,
1.838324, -0.09129194, 2.934248, 1, 0, 0.2509804, 1,
1.843409, -1.081329, 1.567328, 1, 0, 0.2470588, 1,
1.862718, -0.5938235, 2.950008, 1, 0, 0.2392157, 1,
1.866478, 0.9094656, 2.360003, 1, 0, 0.2352941, 1,
1.866872, 1.118625, 0.7886328, 1, 0, 0.227451, 1,
1.886323, -0.8859768, 2.594958, 1, 0, 0.2235294, 1,
1.887739, -0.7749929, 1.588456, 1, 0, 0.2156863, 1,
1.889171, 0.8686531, 0.6003832, 1, 0, 0.2117647, 1,
1.896343, 0.5853503, 1.164525, 1, 0, 0.2039216, 1,
1.940665, -0.1505869, 0.6992316, 1, 0, 0.1960784, 1,
1.950694, -0.4450248, 0.9701436, 1, 0, 0.1921569, 1,
1.952144, -0.2679431, 2.819761, 1, 0, 0.1843137, 1,
1.952255, -1.577354, 2.41352, 1, 0, 0.1803922, 1,
1.964757, 1.035545, 1.674583, 1, 0, 0.172549, 1,
1.980213, -1.448703, 2.951684, 1, 0, 0.1686275, 1,
1.986314, -1.082115, 0.708086, 1, 0, 0.1607843, 1,
1.99144, 0.5572025, 1.949235, 1, 0, 0.1568628, 1,
1.994309, -0.5817348, 1.582257, 1, 0, 0.1490196, 1,
2.025007, -1.62681, 1.55022, 1, 0, 0.145098, 1,
2.033396, -0.4650663, 1.055643, 1, 0, 0.1372549, 1,
2.063984, -1.087596, 3.627785, 1, 0, 0.1333333, 1,
2.074186, 0.1271529, 0.2815791, 1, 0, 0.1254902, 1,
2.076374, -0.6744491, 2.525219, 1, 0, 0.1215686, 1,
2.077188, -0.7830468, 1.573397, 1, 0, 0.1137255, 1,
2.07757, -1.145263, 1.681118, 1, 0, 0.1098039, 1,
2.114913, -1.408378, 1.358378, 1, 0, 0.1019608, 1,
2.143621, -0.336057, 2.547895, 1, 0, 0.09411765, 1,
2.165523, 0.8359369, 0.5972174, 1, 0, 0.09019608, 1,
2.189347, -0.3912602, 1.603128, 1, 0, 0.08235294, 1,
2.196464, -1.852406, 1.592639, 1, 0, 0.07843138, 1,
2.22917, 0.7716196, 0.4666004, 1, 0, 0.07058824, 1,
2.305078, 0.685785, 0.8365311, 1, 0, 0.06666667, 1,
2.359726, 1.228288, 2.104862, 1, 0, 0.05882353, 1,
2.371447, 0.8990527, 1.476363, 1, 0, 0.05490196, 1,
2.435732, 0.4419569, 1.38252, 1, 0, 0.04705882, 1,
2.528093, -0.5888618, 1.430482, 1, 0, 0.04313726, 1,
2.605904, -1.45556, 1.927712, 1, 0, 0.03529412, 1,
2.648404, -0.575882, 1.453713, 1, 0, 0.03137255, 1,
2.738952, -0.8612257, 1.400761, 1, 0, 0.02352941, 1,
2.77337, 0.2105623, 1.812903, 1, 0, 0.01960784, 1,
2.836112, 1.97468, 1.595875, 1, 0, 0.01176471, 1,
2.951699, -0.2783626, 1.092423, 1, 0, 0.007843138, 1
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
-0.3459748, -4.11908, -7.376385, 0, -0.5, 0.5, 0.5,
-0.3459748, -4.11908, -7.376385, 1, -0.5, 0.5, 0.5,
-0.3459748, -4.11908, -7.376385, 1, 1.5, 0.5, 0.5,
-0.3459748, -4.11908, -7.376385, 0, 1.5, 0.5, 0.5
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
-4.76156, 0.02342689, -7.376385, 0, -0.5, 0.5, 0.5,
-4.76156, 0.02342689, -7.376385, 1, -0.5, 0.5, 0.5,
-4.76156, 0.02342689, -7.376385, 1, 1.5, 0.5, 0.5,
-4.76156, 0.02342689, -7.376385, 0, 1.5, 0.5, 0.5
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
-4.76156, -4.11908, -0.4446874, 0, -0.5, 0.5, 0.5,
-4.76156, -4.11908, -0.4446874, 1, -0.5, 0.5, 0.5,
-4.76156, -4.11908, -0.4446874, 1, 1.5, 0.5, 0.5,
-4.76156, -4.11908, -0.4446874, 0, 1.5, 0.5, 0.5
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
-3, -3.163117, -5.776762,
2, -3.163117, -5.776762,
-3, -3.163117, -5.776762,
-3, -3.322444, -6.043366,
-2, -3.163117, -5.776762,
-2, -3.322444, -6.043366,
-1, -3.163117, -5.776762,
-1, -3.322444, -6.043366,
0, -3.163117, -5.776762,
0, -3.322444, -6.043366,
1, -3.163117, -5.776762,
1, -3.322444, -6.043366,
2, -3.163117, -5.776762,
2, -3.322444, -6.043366
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
-3, -3.641098, -6.576574, 0, -0.5, 0.5, 0.5,
-3, -3.641098, -6.576574, 1, -0.5, 0.5, 0.5,
-3, -3.641098, -6.576574, 1, 1.5, 0.5, 0.5,
-3, -3.641098, -6.576574, 0, 1.5, 0.5, 0.5,
-2, -3.641098, -6.576574, 0, -0.5, 0.5, 0.5,
-2, -3.641098, -6.576574, 1, -0.5, 0.5, 0.5,
-2, -3.641098, -6.576574, 1, 1.5, 0.5, 0.5,
-2, -3.641098, -6.576574, 0, 1.5, 0.5, 0.5,
-1, -3.641098, -6.576574, 0, -0.5, 0.5, 0.5,
-1, -3.641098, -6.576574, 1, -0.5, 0.5, 0.5,
-1, -3.641098, -6.576574, 1, 1.5, 0.5, 0.5,
-1, -3.641098, -6.576574, 0, 1.5, 0.5, 0.5,
0, -3.641098, -6.576574, 0, -0.5, 0.5, 0.5,
0, -3.641098, -6.576574, 1, -0.5, 0.5, 0.5,
0, -3.641098, -6.576574, 1, 1.5, 0.5, 0.5,
0, -3.641098, -6.576574, 0, 1.5, 0.5, 0.5,
1, -3.641098, -6.576574, 0, -0.5, 0.5, 0.5,
1, -3.641098, -6.576574, 1, -0.5, 0.5, 0.5,
1, -3.641098, -6.576574, 1, 1.5, 0.5, 0.5,
1, -3.641098, -6.576574, 0, 1.5, 0.5, 0.5,
2, -3.641098, -6.576574, 0, -0.5, 0.5, 0.5,
2, -3.641098, -6.576574, 1, -0.5, 0.5, 0.5,
2, -3.641098, -6.576574, 1, 1.5, 0.5, 0.5,
2, -3.641098, -6.576574, 0, 1.5, 0.5, 0.5
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
-3.742579, -3, -5.776762,
-3.742579, 3, -5.776762,
-3.742579, -3, -5.776762,
-3.912409, -3, -6.043366,
-3.742579, -2, -5.776762,
-3.912409, -2, -6.043366,
-3.742579, -1, -5.776762,
-3.912409, -1, -6.043366,
-3.742579, 0, -5.776762,
-3.912409, 0, -6.043366,
-3.742579, 1, -5.776762,
-3.912409, 1, -6.043366,
-3.742579, 2, -5.776762,
-3.912409, 2, -6.043366,
-3.742579, 3, -5.776762,
-3.912409, 3, -6.043366
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
-4.252069, -3, -6.576574, 0, -0.5, 0.5, 0.5,
-4.252069, -3, -6.576574, 1, -0.5, 0.5, 0.5,
-4.252069, -3, -6.576574, 1, 1.5, 0.5, 0.5,
-4.252069, -3, -6.576574, 0, 1.5, 0.5, 0.5,
-4.252069, -2, -6.576574, 0, -0.5, 0.5, 0.5,
-4.252069, -2, -6.576574, 1, -0.5, 0.5, 0.5,
-4.252069, -2, -6.576574, 1, 1.5, 0.5, 0.5,
-4.252069, -2, -6.576574, 0, 1.5, 0.5, 0.5,
-4.252069, -1, -6.576574, 0, -0.5, 0.5, 0.5,
-4.252069, -1, -6.576574, 1, -0.5, 0.5, 0.5,
-4.252069, -1, -6.576574, 1, 1.5, 0.5, 0.5,
-4.252069, -1, -6.576574, 0, 1.5, 0.5, 0.5,
-4.252069, 0, -6.576574, 0, -0.5, 0.5, 0.5,
-4.252069, 0, -6.576574, 1, -0.5, 0.5, 0.5,
-4.252069, 0, -6.576574, 1, 1.5, 0.5, 0.5,
-4.252069, 0, -6.576574, 0, 1.5, 0.5, 0.5,
-4.252069, 1, -6.576574, 0, -0.5, 0.5, 0.5,
-4.252069, 1, -6.576574, 1, -0.5, 0.5, 0.5,
-4.252069, 1, -6.576574, 1, 1.5, 0.5, 0.5,
-4.252069, 1, -6.576574, 0, 1.5, 0.5, 0.5,
-4.252069, 2, -6.576574, 0, -0.5, 0.5, 0.5,
-4.252069, 2, -6.576574, 1, -0.5, 0.5, 0.5,
-4.252069, 2, -6.576574, 1, 1.5, 0.5, 0.5,
-4.252069, 2, -6.576574, 0, 1.5, 0.5, 0.5,
-4.252069, 3, -6.576574, 0, -0.5, 0.5, 0.5,
-4.252069, 3, -6.576574, 1, -0.5, 0.5, 0.5,
-4.252069, 3, -6.576574, 1, 1.5, 0.5, 0.5,
-4.252069, 3, -6.576574, 0, 1.5, 0.5, 0.5
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
-3.742579, -3.163117, -4,
-3.742579, -3.163117, 4,
-3.742579, -3.163117, -4,
-3.912409, -3.322444, -4,
-3.742579, -3.163117, -2,
-3.912409, -3.322444, -2,
-3.742579, -3.163117, 0,
-3.912409, -3.322444, 0,
-3.742579, -3.163117, 2,
-3.912409, -3.322444, 2,
-3.742579, -3.163117, 4,
-3.912409, -3.322444, 4
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
-4.252069, -3.641098, -4, 0, -0.5, 0.5, 0.5,
-4.252069, -3.641098, -4, 1, -0.5, 0.5, 0.5,
-4.252069, -3.641098, -4, 1, 1.5, 0.5, 0.5,
-4.252069, -3.641098, -4, 0, 1.5, 0.5, 0.5,
-4.252069, -3.641098, -2, 0, -0.5, 0.5, 0.5,
-4.252069, -3.641098, -2, 1, -0.5, 0.5, 0.5,
-4.252069, -3.641098, -2, 1, 1.5, 0.5, 0.5,
-4.252069, -3.641098, -2, 0, 1.5, 0.5, 0.5,
-4.252069, -3.641098, 0, 0, -0.5, 0.5, 0.5,
-4.252069, -3.641098, 0, 1, -0.5, 0.5, 0.5,
-4.252069, -3.641098, 0, 1, 1.5, 0.5, 0.5,
-4.252069, -3.641098, 0, 0, 1.5, 0.5, 0.5,
-4.252069, -3.641098, 2, 0, -0.5, 0.5, 0.5,
-4.252069, -3.641098, 2, 1, -0.5, 0.5, 0.5,
-4.252069, -3.641098, 2, 1, 1.5, 0.5, 0.5,
-4.252069, -3.641098, 2, 0, 1.5, 0.5, 0.5,
-4.252069, -3.641098, 4, 0, -0.5, 0.5, 0.5,
-4.252069, -3.641098, 4, 1, -0.5, 0.5, 0.5,
-4.252069, -3.641098, 4, 1, 1.5, 0.5, 0.5,
-4.252069, -3.641098, 4, 0, 1.5, 0.5, 0.5
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
-3.742579, -3.163117, -5.776762,
-3.742579, 3.20997, -5.776762,
-3.742579, -3.163117, 4.887388,
-3.742579, 3.20997, 4.887388,
-3.742579, -3.163117, -5.776762,
-3.742579, -3.163117, 4.887388,
-3.742579, 3.20997, -5.776762,
-3.742579, 3.20997, 4.887388,
-3.742579, -3.163117, -5.776762,
3.050629, -3.163117, -5.776762,
-3.742579, -3.163117, 4.887388,
3.050629, -3.163117, 4.887388,
-3.742579, 3.20997, -5.776762,
3.050629, 3.20997, -5.776762,
-3.742579, 3.20997, 4.887388,
3.050629, 3.20997, 4.887388,
3.050629, -3.163117, -5.776762,
3.050629, 3.20997, -5.776762,
3.050629, -3.163117, 4.887388,
3.050629, 3.20997, 4.887388,
3.050629, -3.163117, -5.776762,
3.050629, -3.163117, 4.887388,
3.050629, 3.20997, -5.776762,
3.050629, 3.20997, 4.887388
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
var radius = 7.560833;
var distance = 33.639;
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
mvMatrix.translate( 0.3459748, -0.02342689, 0.4446874 );
mvMatrix.scale( 1.203396, 1.282726, 0.7665797 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.639);
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
Methoxychlor_olefin<-read.table("Methoxychlor_olefin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methoxychlor_olefin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methoxychlor_olefin' not found
```

```r
y<-Methoxychlor_olefin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methoxychlor_olefin' not found
```

```r
z<-Methoxychlor_olefin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methoxychlor_olefin' not found
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
-3.643648, 1.135882, -1.93047, 0, 0, 1, 1, 1,
-3.09005, 0.5220511, -1.266281, 1, 0, 0, 1, 1,
-2.901909, -0.611784, -0.4823899, 1, 0, 0, 1, 1,
-2.716476, 0.8640098, -1.638602, 1, 0, 0, 1, 1,
-2.638347, 0.4127867, -0.9241297, 1, 0, 0, 1, 1,
-2.60828, 0.5239833, -0.5637423, 1, 0, 0, 1, 1,
-2.58199, -2.016552, -1.820856, 0, 0, 0, 1, 1,
-2.531718, 0.6400687, 0.2766931, 0, 0, 0, 1, 1,
-2.525527, -1.054663, -1.601716, 0, 0, 0, 1, 1,
-2.520817, 0.9393779, -1.11515, 0, 0, 0, 1, 1,
-2.449483, 0.4922031, -0.8091545, 0, 0, 0, 1, 1,
-2.425711, -0.8776234, -2.257056, 0, 0, 0, 1, 1,
-2.260491, 0.1930577, -1.635231, 0, 0, 0, 1, 1,
-2.24478, 0.354344, -1.298874, 1, 1, 1, 1, 1,
-2.219163, 0.1150924, -2.964878, 1, 1, 1, 1, 1,
-2.21489, 0.7393381, -4.424315, 1, 1, 1, 1, 1,
-2.180911, 0.02125896, -3.395226, 1, 1, 1, 1, 1,
-2.17541, 0.745457, -4.521826, 1, 1, 1, 1, 1,
-2.162606, -1.325, -3.932842, 1, 1, 1, 1, 1,
-2.120054, 1.164479, -1.306611, 1, 1, 1, 1, 1,
-2.070344, 0.518612, -1.99585, 1, 1, 1, 1, 1,
-1.986939, -0.9989182, -0.8025699, 1, 1, 1, 1, 1,
-1.977083, 0.4306662, -1.192577, 1, 1, 1, 1, 1,
-1.898757, -0.8402638, -0.9535801, 1, 1, 1, 1, 1,
-1.887493, -0.8161971, -1.874883, 1, 1, 1, 1, 1,
-1.884716, 0.0529927, -0.8816652, 1, 1, 1, 1, 1,
-1.877396, 0.4000657, -2.883103, 1, 1, 1, 1, 1,
-1.870615, -0.6264533, -0.06279711, 1, 1, 1, 1, 1,
-1.87036, 1.35614, -1.264322, 0, 0, 1, 1, 1,
-1.847531, -0.009484073, -1.263408, 1, 0, 0, 1, 1,
-1.847452, 1.679901, 0.5185916, 1, 0, 0, 1, 1,
-1.829338, -1.19465, -1.607327, 1, 0, 0, 1, 1,
-1.819397, -0.6548836, -0.2699295, 1, 0, 0, 1, 1,
-1.816708, -1.37596, -2.869824, 1, 0, 0, 1, 1,
-1.816245, -1.206053, -2.953036, 0, 0, 0, 1, 1,
-1.814094, 0.1535465, -3.193672, 0, 0, 0, 1, 1,
-1.791237, -0.8456566, -3.242639, 0, 0, 0, 1, 1,
-1.782525, -0.1077987, -1.507202, 0, 0, 0, 1, 1,
-1.747416, 2.701653, -2.422718, 0, 0, 0, 1, 1,
-1.715368, -0.8416713, -4.310843, 0, 0, 0, 1, 1,
-1.710795, -0.5917103, -1.599889, 0, 0, 0, 1, 1,
-1.708589, -1.16451, -0.7902002, 1, 1, 1, 1, 1,
-1.689553, 2.320789, -0.3443321, 1, 1, 1, 1, 1,
-1.677303, -0.9173572, -1.8736, 1, 1, 1, 1, 1,
-1.674946, 0.7234864, -1.785978, 1, 1, 1, 1, 1,
-1.668366, -0.4636945, -3.120863, 1, 1, 1, 1, 1,
-1.664785, 1.252646, -1.249883, 1, 1, 1, 1, 1,
-1.663255, -0.3595809, -1.1051, 1, 1, 1, 1, 1,
-1.644038, -1.184416, -3.907315, 1, 1, 1, 1, 1,
-1.643411, -1.680734, -3.085319, 1, 1, 1, 1, 1,
-1.619788, 0.4495543, -1.17398, 1, 1, 1, 1, 1,
-1.617841, 0.4128572, 0.1277428, 1, 1, 1, 1, 1,
-1.61217, -0.6226077, -0.1828793, 1, 1, 1, 1, 1,
-1.60442, 0.06636231, -2.948292, 1, 1, 1, 1, 1,
-1.601899, 0.1245322, -2.050759, 1, 1, 1, 1, 1,
-1.588117, -0.2672493, -1.670304, 1, 1, 1, 1, 1,
-1.584289, 1.346453, -0.8766108, 0, 0, 1, 1, 1,
-1.580307, 0.08629852, -1.970048, 1, 0, 0, 1, 1,
-1.557561, 1.631237, -0.8454109, 1, 0, 0, 1, 1,
-1.556128, -0.1150549, -3.882541, 1, 0, 0, 1, 1,
-1.549263, 0.3235013, -2.016062, 1, 0, 0, 1, 1,
-1.542403, 0.482521, -1.200008, 1, 0, 0, 1, 1,
-1.496989, 0.3422429, -3.098535, 0, 0, 0, 1, 1,
-1.496248, 1.04849, -1.217155, 0, 0, 0, 1, 1,
-1.483918, -0.3503301, -1.745012, 0, 0, 0, 1, 1,
-1.472972, -0.7277853, -3.170355, 0, 0, 0, 1, 1,
-1.444182, 0.6308719, -0.3489361, 0, 0, 0, 1, 1,
-1.442209, 0.7290564, -0.4484372, 0, 0, 0, 1, 1,
-1.441993, -0.4247732, -1.099789, 0, 0, 0, 1, 1,
-1.432757, 1.195651, -0.4308135, 1, 1, 1, 1, 1,
-1.432022, 0.7348253, -0.4011034, 1, 1, 1, 1, 1,
-1.431044, 0.8144705, -0.3938783, 1, 1, 1, 1, 1,
-1.427907, 0.3275954, -2.258262, 1, 1, 1, 1, 1,
-1.426416, 0.7585956, -1.603878, 1, 1, 1, 1, 1,
-1.424694, -0.8868995, -2.200963, 1, 1, 1, 1, 1,
-1.410612, -0.9628972, -2.699095, 1, 1, 1, 1, 1,
-1.400648, -0.4471004, -2.209095, 1, 1, 1, 1, 1,
-1.399819, -0.7384326, -2.593225, 1, 1, 1, 1, 1,
-1.396324, 0.1786532, -1.475678, 1, 1, 1, 1, 1,
-1.395797, -0.4644608, -2.16003, 1, 1, 1, 1, 1,
-1.394916, -0.5304572, -0.8840411, 1, 1, 1, 1, 1,
-1.384338, 0.9122273, -1.038896, 1, 1, 1, 1, 1,
-1.38068, 0.1962063, -0.2240887, 1, 1, 1, 1, 1,
-1.363207, -0.5037841, -1.867586, 1, 1, 1, 1, 1,
-1.358392, -0.7640025, -1.087471, 0, 0, 1, 1, 1,
-1.352687, -1.494349, -2.229246, 1, 0, 0, 1, 1,
-1.349804, 0.2974479, -2.014258, 1, 0, 0, 1, 1,
-1.343573, -1.236052, -2.884322, 1, 0, 0, 1, 1,
-1.340275, -0.2832691, -2.768058, 1, 0, 0, 1, 1,
-1.334457, 0.2428862, -1.822101, 1, 0, 0, 1, 1,
-1.334019, 0.3127978, -1.070242, 0, 0, 0, 1, 1,
-1.332568, 0.05284981, -1.364378, 0, 0, 0, 1, 1,
-1.323756, -0.7969233, -3.172264, 0, 0, 0, 1, 1,
-1.311861, 0.7290972, -1.264324, 0, 0, 0, 1, 1,
-1.308257, -0.7439957, -0.7318819, 0, 0, 0, 1, 1,
-1.287473, -0.763191, -0.4632173, 0, 0, 0, 1, 1,
-1.282585, 0.4842515, -2.683633, 0, 0, 0, 1, 1,
-1.279047, 1.518845, -0.2352087, 1, 1, 1, 1, 1,
-1.268751, 0.9991608, -0.6582378, 1, 1, 1, 1, 1,
-1.267892, 1.253807, -2.05604, 1, 1, 1, 1, 1,
-1.266334, 1.541085, -0.9024789, 1, 1, 1, 1, 1,
-1.261871, 0.41418, -0.3723665, 1, 1, 1, 1, 1,
-1.252336, 0.659328, -2.541847, 1, 1, 1, 1, 1,
-1.235463, -0.3073506, -2.697412, 1, 1, 1, 1, 1,
-1.234125, -1.324341, -1.578484, 1, 1, 1, 1, 1,
-1.228583, 0.7190754, -1.986669, 1, 1, 1, 1, 1,
-1.222236, -0.5037927, 0.01220264, 1, 1, 1, 1, 1,
-1.221165, 0.07343386, -3.835612, 1, 1, 1, 1, 1,
-1.210727, 0.5471059, -0.031845, 1, 1, 1, 1, 1,
-1.201399, 0.5105596, -2.059154, 1, 1, 1, 1, 1,
-1.186379, 2.521393, -0.2390056, 1, 1, 1, 1, 1,
-1.184303, -1.396325, -2.971631, 1, 1, 1, 1, 1,
-1.175354, 0.8789647, -1.003559, 0, 0, 1, 1, 1,
-1.171326, -0.7773296, -1.397503, 1, 0, 0, 1, 1,
-1.166685, 0.03609464, -0.3406046, 1, 0, 0, 1, 1,
-1.156129, -0.7469347, -3.359277, 1, 0, 0, 1, 1,
-1.155953, 0.08622887, -0.9339967, 1, 0, 0, 1, 1,
-1.153547, 1.275359, -0.595105, 1, 0, 0, 1, 1,
-1.150949, -0.7517427, -2.728396, 0, 0, 0, 1, 1,
-1.144857, 0.86715, -0.6804962, 0, 0, 0, 1, 1,
-1.14374, -2.155551, -5.621459, 0, 0, 0, 1, 1,
-1.139019, -0.2443267, -2.848422, 0, 0, 0, 1, 1,
-1.134884, 1.415654, 0.6842105, 0, 0, 0, 1, 1,
-1.122992, -1.691489, -2.376816, 0, 0, 0, 1, 1,
-1.11798, 1.532061, 0.334084, 0, 0, 0, 1, 1,
-1.116133, -0.8642238, -2.323663, 1, 1, 1, 1, 1,
-1.115379, 0.4725928, -1.600491, 1, 1, 1, 1, 1,
-1.112929, -0.06477288, -2.216768, 1, 1, 1, 1, 1,
-1.110754, 0.8864465, 0.8154683, 1, 1, 1, 1, 1,
-1.106743, -0.5786902, -2.854451, 1, 1, 1, 1, 1,
-1.10086, -1.469712, -0.9126726, 1, 1, 1, 1, 1,
-1.099984, 0.4460223, -0.3581388, 1, 1, 1, 1, 1,
-1.098644, 0.8781347, -1.053927, 1, 1, 1, 1, 1,
-1.097331, 0.4460636, -1.004148, 1, 1, 1, 1, 1,
-1.096658, -0.4615213, -2.611546, 1, 1, 1, 1, 1,
-1.083782, 1.230774, -1.944776, 1, 1, 1, 1, 1,
-1.078846, -1.19349, -2.611968, 1, 1, 1, 1, 1,
-1.074479, -2.027089, -0.6932299, 1, 1, 1, 1, 1,
-1.070295, -0.1301988, -1.362076, 1, 1, 1, 1, 1,
-1.063567, 0.1050124, 0.1192767, 1, 1, 1, 1, 1,
-1.056972, -0.4959339, -1.063883, 0, 0, 1, 1, 1,
-1.050884, 0.642779, -0.3181088, 1, 0, 0, 1, 1,
-1.04574, 0.1695008, -2.140423, 1, 0, 0, 1, 1,
-1.045694, 1.00441, -0.2428319, 1, 0, 0, 1, 1,
-1.045515, 0.8258758, 0.7475961, 1, 0, 0, 1, 1,
-1.043183, -0.09441774, -1.251666, 1, 0, 0, 1, 1,
-1.036511, 1.614776, -1.039472, 0, 0, 0, 1, 1,
-1.035835, -1.594914, -3.439976, 0, 0, 0, 1, 1,
-1.023968, 1.453616, -1.09349, 0, 0, 0, 1, 1,
-1.023826, 0.2978026, -1.374423, 0, 0, 0, 1, 1,
-1.022163, 0.83947, -1.571236, 0, 0, 0, 1, 1,
-1.019601, 1.154166, -0.1357986, 0, 0, 0, 1, 1,
-1.018983, 0.3883244, -0.1678082, 0, 0, 0, 1, 1,
-1.010462, -0.7342925, 0.09227513, 1, 1, 1, 1, 1,
-1.010233, 0.8978727, -1.465638, 1, 1, 1, 1, 1,
-1.008447, -0.3430943, -3.555851, 1, 1, 1, 1, 1,
-1.007559, 0.7201877, -1.556427, 1, 1, 1, 1, 1,
-1.002181, 1.795074, -1.068216, 1, 1, 1, 1, 1,
-0.992725, 0.6222593, 0.5795572, 1, 1, 1, 1, 1,
-0.9878309, -1.45082, -3.507668, 1, 1, 1, 1, 1,
-0.9836752, 0.8173095, -1.857543, 1, 1, 1, 1, 1,
-0.9835451, 0.3861932, -0.7697046, 1, 1, 1, 1, 1,
-0.9828357, -2.896877, -0.6029854, 1, 1, 1, 1, 1,
-0.968281, 1.238934, -0.1689983, 1, 1, 1, 1, 1,
-0.9657208, -0.7471652, -3.135771, 1, 1, 1, 1, 1,
-0.964983, -0.07014736, -1.020843, 1, 1, 1, 1, 1,
-0.9513478, -0.0597164, -3.742584, 1, 1, 1, 1, 1,
-0.9506531, -0.08899861, -0.7285047, 1, 1, 1, 1, 1,
-0.9479648, -0.7135508, -2.157312, 0, 0, 1, 1, 1,
-0.9416038, -0.7044189, -3.073335, 1, 0, 0, 1, 1,
-0.9389469, -0.8610304, -1.947561, 1, 0, 0, 1, 1,
-0.9378328, 0.6444678, -2.530431, 1, 0, 0, 1, 1,
-0.9342231, -0.7434731, -3.627329, 1, 0, 0, 1, 1,
-0.9301652, -0.8282861, -2.389476, 1, 0, 0, 1, 1,
-0.9244794, 0.7613942, -1.522305, 0, 0, 0, 1, 1,
-0.9240678, 1.730245, -1.649338, 0, 0, 0, 1, 1,
-0.9190558, -1.745158, -0.9692, 0, 0, 0, 1, 1,
-0.9173415, -0.5734689, -1.259953, 0, 0, 0, 1, 1,
-0.9167286, 1.329198, -0.6571494, 0, 0, 0, 1, 1,
-0.9110706, -0.2199421, -0.9372676, 0, 0, 0, 1, 1,
-0.9088432, 1.374023, 0.7984087, 0, 0, 0, 1, 1,
-0.9074296, 2.037639, -0.7557518, 1, 1, 1, 1, 1,
-0.9060683, -0.7097064, -1.116671, 1, 1, 1, 1, 1,
-0.8974141, 1.323959, -0.8610611, 1, 1, 1, 1, 1,
-0.8964539, -0.9625247, -3.472087, 1, 1, 1, 1, 1,
-0.8945215, 1.191343, -1.350466, 1, 1, 1, 1, 1,
-0.8893374, -1.0901, -1.349099, 1, 1, 1, 1, 1,
-0.8883183, -0.6018952, -3.632027, 1, 1, 1, 1, 1,
-0.8843071, 0.3003321, -2.705866, 1, 1, 1, 1, 1,
-0.882612, -0.5385091, -1.891546, 1, 1, 1, 1, 1,
-0.8816006, 0.836611, -0.4120913, 1, 1, 1, 1, 1,
-0.8706547, 2.517828, -0.2989041, 1, 1, 1, 1, 1,
-0.8649387, 0.07201997, -2.371569, 1, 1, 1, 1, 1,
-0.8632445, -0.8771701, -1.240748, 1, 1, 1, 1, 1,
-0.8622228, 0.03204829, -1.507724, 1, 1, 1, 1, 1,
-0.8604187, 0.8676951, -0.5374501, 1, 1, 1, 1, 1,
-0.8452581, -1.238708, -3.314232, 0, 0, 1, 1, 1,
-0.8438184, 1.706018, -0.3094851, 1, 0, 0, 1, 1,
-0.8436674, 0.3723479, -1.033953, 1, 0, 0, 1, 1,
-0.8358759, -0.6693374, -4.366877, 1, 0, 0, 1, 1,
-0.8328889, 0.7355989, -1.897644, 1, 0, 0, 1, 1,
-0.8312938, -1.489411, -2.486656, 1, 0, 0, 1, 1,
-0.8210974, 1.082698, -0.5312566, 0, 0, 0, 1, 1,
-0.8176814, 1.603653, -0.3061454, 0, 0, 0, 1, 1,
-0.8068024, -1.73655, -3.143775, 0, 0, 0, 1, 1,
-0.8061717, 0.098288, -0.9782175, 0, 0, 0, 1, 1,
-0.8059542, -0.07322076, -0.9821396, 0, 0, 0, 1, 1,
-0.8016864, -0.2655642, -2.990573, 0, 0, 0, 1, 1,
-0.7980563, 0.4611524, -1.594016, 0, 0, 0, 1, 1,
-0.7977653, 1.169427, -0.03865403, 1, 1, 1, 1, 1,
-0.7973135, 0.6043884, -0.4004278, 1, 1, 1, 1, 1,
-0.7969522, 0.8330417, -1.578259, 1, 1, 1, 1, 1,
-0.793832, 1.442607, -0.9087554, 1, 1, 1, 1, 1,
-0.7908454, -0.4112238, -1.86358, 1, 1, 1, 1, 1,
-0.7829896, -0.3974971, 0.3940216, 1, 1, 1, 1, 1,
-0.7792288, 0.9483225, -0.8588877, 1, 1, 1, 1, 1,
-0.7745566, 0.4741724, -1.586659, 1, 1, 1, 1, 1,
-0.7690084, -1.025691, -2.82632, 1, 1, 1, 1, 1,
-0.7687183, -0.9414629, -4.307578, 1, 1, 1, 1, 1,
-0.7627696, -0.6064241, -1.701429, 1, 1, 1, 1, 1,
-0.7603732, 1.014777, 0.4987053, 1, 1, 1, 1, 1,
-0.759905, 0.1065691, -0.5629576, 1, 1, 1, 1, 1,
-0.7589583, 1.031425, -1.481677, 1, 1, 1, 1, 1,
-0.7567129, -0.0360985, -2.778636, 1, 1, 1, 1, 1,
-0.7492949, -0.8157375, -2.585815, 0, 0, 1, 1, 1,
-0.7486143, 1.246361, -0.5686408, 1, 0, 0, 1, 1,
-0.7425898, -1.217357, -2.703132, 1, 0, 0, 1, 1,
-0.7268097, 1.269029, -1.739085, 1, 0, 0, 1, 1,
-0.7251894, -1.232774, -3.47485, 1, 0, 0, 1, 1,
-0.7213627, 0.09475418, -1.656976, 1, 0, 0, 1, 1,
-0.7197262, 0.6942628, -0.4357431, 0, 0, 0, 1, 1,
-0.7166974, 0.5080861, -0.5264693, 0, 0, 0, 1, 1,
-0.7118468, 0.04256926, 0.2687623, 0, 0, 0, 1, 1,
-0.7078229, 0.1206762, -0.8560155, 0, 0, 0, 1, 1,
-0.7035496, 1.047997, 0.3863094, 0, 0, 0, 1, 1,
-0.7034888, -1.33645, -3.673862, 0, 0, 0, 1, 1,
-0.6986517, 1.241397, -0.9935007, 0, 0, 0, 1, 1,
-0.6938032, -0.3995501, -3.261654, 1, 1, 1, 1, 1,
-0.6922275, 1.124655, 0.4534356, 1, 1, 1, 1, 1,
-0.6830154, 0.3223623, -1.840562, 1, 1, 1, 1, 1,
-0.6828145, -0.4089912, -2.393664, 1, 1, 1, 1, 1,
-0.6813785, 0.3234438, -1.027534, 1, 1, 1, 1, 1,
-0.6790755, 1.66528, -0.4876887, 1, 1, 1, 1, 1,
-0.6748473, -1.729998, -3.312523, 1, 1, 1, 1, 1,
-0.6741392, -1.820258, -2.321165, 1, 1, 1, 1, 1,
-0.6655009, -0.5092843, -4.554845, 1, 1, 1, 1, 1,
-0.6599714, 1.308575, -0.008300102, 1, 1, 1, 1, 1,
-0.6570226, 0.6246713, -0.1086085, 1, 1, 1, 1, 1,
-0.6550491, 0.3251557, -1.109921, 1, 1, 1, 1, 1,
-0.6546412, -0.4502386, -0.8933765, 1, 1, 1, 1, 1,
-0.654148, 0.9863615, -0.8832858, 1, 1, 1, 1, 1,
-0.6520373, 0.4088342, -0.0797108, 1, 1, 1, 1, 1,
-0.6468589, 0.431106, -1.374374, 0, 0, 1, 1, 1,
-0.6460325, -0.9662448, -2.792992, 1, 0, 0, 1, 1,
-0.6432159, -2.749784, -2.622202, 1, 0, 0, 1, 1,
-0.6426353, 0.3216616, -0.1599096, 1, 0, 0, 1, 1,
-0.6348479, 0.8208435, -1.141691, 1, 0, 0, 1, 1,
-0.6331565, -1.251371, -4.379215, 1, 0, 0, 1, 1,
-0.6298188, 1.624539, 1.729674, 0, 0, 0, 1, 1,
-0.6295372, -0.5611553, -1.211927, 0, 0, 0, 1, 1,
-0.6286829, -0.8342693, -2.037802, 0, 0, 0, 1, 1,
-0.6257197, 0.7521876, 1.139081, 0, 0, 0, 1, 1,
-0.6239833, 1.072984, -1.546232, 0, 0, 0, 1, 1,
-0.6218055, -0.6464442, -3.057055, 0, 0, 0, 1, 1,
-0.6198691, 0.01287489, -2.333722, 0, 0, 0, 1, 1,
-0.6144619, 0.1287828, -2.090215, 1, 1, 1, 1, 1,
-0.6086992, 2.295852, 0.2728338, 1, 1, 1, 1, 1,
-0.6082552, 0.7125325, -0.3746244, 1, 1, 1, 1, 1,
-0.6069155, 0.03852331, -0.5277735, 1, 1, 1, 1, 1,
-0.605562, 0.3314277, -2.258706, 1, 1, 1, 1, 1,
-0.5987946, 0.6946673, 0.3728991, 1, 1, 1, 1, 1,
-0.5963671, 1.03313, 1.126344, 1, 1, 1, 1, 1,
-0.5897436, 0.9863079, -0.7148622, 1, 1, 1, 1, 1,
-0.5885403, 0.7864647, -0.9704362, 1, 1, 1, 1, 1,
-0.5849998, -1.394577, -3.280045, 1, 1, 1, 1, 1,
-0.5849427, 0.6208299, -1.304763, 1, 1, 1, 1, 1,
-0.5801536, 1.687387, -1.33477, 1, 1, 1, 1, 1,
-0.5784662, -0.9677405, -2.849665, 1, 1, 1, 1, 1,
-0.5746003, 1.047642, 0.5660882, 1, 1, 1, 1, 1,
-0.5731279, 0.1134045, -0.006039185, 1, 1, 1, 1, 1,
-0.570936, 0.3519106, 0.5463872, 0, 0, 1, 1, 1,
-0.570486, 2.083199, 0.3159898, 1, 0, 0, 1, 1,
-0.5692748, -1.418477, -2.157208, 1, 0, 0, 1, 1,
-0.5611594, -0.2576146, -1.80783, 1, 0, 0, 1, 1,
-0.558441, 0.9322858, -0.4020531, 1, 0, 0, 1, 1,
-0.556955, 0.1590173, -0.5682273, 1, 0, 0, 1, 1,
-0.5554066, 0.1821345, -1.276378, 0, 0, 0, 1, 1,
-0.5510867, 0.002413607, -0.05739342, 0, 0, 0, 1, 1,
-0.5505126, 0.05829014, -1.065986, 0, 0, 0, 1, 1,
-0.5497929, -1.527361, -3.316488, 0, 0, 0, 1, 1,
-0.5492743, -0.1606175, -4.312749, 0, 0, 0, 1, 1,
-0.5451061, 0.02576971, 0.08955886, 0, 0, 0, 1, 1,
-0.5432197, -1.920803, -2.158486, 0, 0, 0, 1, 1,
-0.5389578, -0.1538127, -2.45336, 1, 1, 1, 1, 1,
-0.5377984, 0.9415131, 0.213652, 1, 1, 1, 1, 1,
-0.5278032, 1.735835, -0.9471548, 1, 1, 1, 1, 1,
-0.524348, -2.820186, -3.222669, 1, 1, 1, 1, 1,
-0.5188077, 0.9825582, 0.8363129, 1, 1, 1, 1, 1,
-0.5173724, -1.21287, -3.683748, 1, 1, 1, 1, 1,
-0.5155464, 0.3569513, 2.10452, 1, 1, 1, 1, 1,
-0.5094374, -2.464787, -1.645687, 1, 1, 1, 1, 1,
-0.5078792, 0.4164553, -0.342332, 1, 1, 1, 1, 1,
-0.5073336, 0.1409101, -2.286944, 1, 1, 1, 1, 1,
-0.5062798, 0.8810081, -1.474058, 1, 1, 1, 1, 1,
-0.5008988, 0.08086789, -1.647174, 1, 1, 1, 1, 1,
-0.4933823, -0.6877826, -3.586963, 1, 1, 1, 1, 1,
-0.4929788, -0.1623334, -2.327838, 1, 1, 1, 1, 1,
-0.49276, -1.034022, -0.6885331, 1, 1, 1, 1, 1,
-0.4909799, 0.137811, -1.11857, 0, 0, 1, 1, 1,
-0.487611, -1.266413, -2.982371, 1, 0, 0, 1, 1,
-0.4804711, 0.4700486, -2.695516, 1, 0, 0, 1, 1,
-0.4782612, -0.1534545, -1.586789, 1, 0, 0, 1, 1,
-0.4757433, 0.2940117, -0.2850428, 1, 0, 0, 1, 1,
-0.4713049, 0.4405435, -0.371615, 1, 0, 0, 1, 1,
-0.4712603, 0.2798295, -0.1870914, 0, 0, 0, 1, 1,
-0.4708784, 0.1903564, 0.2145116, 0, 0, 0, 1, 1,
-0.4686426, 1.169755, -0.7969007, 0, 0, 0, 1, 1,
-0.4658818, -0.4415728, -2.217752, 0, 0, 0, 1, 1,
-0.4651961, 0.5614136, 1.1681, 0, 0, 0, 1, 1,
-0.4630969, -0.7598806, -2.555276, 0, 0, 0, 1, 1,
-0.4621918, 0.9782471, -0.4343678, 0, 0, 0, 1, 1,
-0.4595714, -0.1092154, 0.164732, 1, 1, 1, 1, 1,
-0.4589707, -1.6258, -3.562593, 1, 1, 1, 1, 1,
-0.4572457, -0.5754661, -2.015181, 1, 1, 1, 1, 1,
-0.4549339, -1.071349, -2.938108, 1, 1, 1, 1, 1,
-0.4533231, 2.093914, 1.071507, 1, 1, 1, 1, 1,
-0.4511507, -0.001477922, -2.36474, 1, 1, 1, 1, 1,
-0.450157, -0.140968, -2.212486, 1, 1, 1, 1, 1,
-0.4489983, 0.3347389, -3.027868, 1, 1, 1, 1, 1,
-0.4476881, -0.8519423, -1.395621, 1, 1, 1, 1, 1,
-0.4439142, -0.8703441, -2.00078, 1, 1, 1, 1, 1,
-0.4407667, 0.1332626, -0.7557086, 1, 1, 1, 1, 1,
-0.4391491, -0.1097716, -1.066152, 1, 1, 1, 1, 1,
-0.4363478, -1.465125, -2.722077, 1, 1, 1, 1, 1,
-0.432253, -0.4333724, -2.087053, 1, 1, 1, 1, 1,
-0.4317758, -1.207106, -0.5847575, 1, 1, 1, 1, 1,
-0.4291943, 0.04007003, 0.2738738, 0, 0, 1, 1, 1,
-0.4277637, -0.1097084, -1.939423, 1, 0, 0, 1, 1,
-0.4276763, -0.06402642, -5.053528, 1, 0, 0, 1, 1,
-0.4245571, 1.775684, -1.06453, 1, 0, 0, 1, 1,
-0.4243009, 1.563295, -0.6202872, 1, 0, 0, 1, 1,
-0.4174915, -0.1073724, -1.165271, 1, 0, 0, 1, 1,
-0.3984753, -1.303033, -1.787667, 0, 0, 0, 1, 1,
-0.3965733, -0.3006993, -3.70383, 0, 0, 0, 1, 1,
-0.3936691, -0.9061264, -2.76571, 0, 0, 0, 1, 1,
-0.3872197, 0.4806004, 0.3644215, 0, 0, 0, 1, 1,
-0.3830778, 1.208942, -0.04757194, 0, 0, 0, 1, 1,
-0.3826408, -0.4777171, -2.370929, 0, 0, 0, 1, 1,
-0.3808978, -0.4238374, -0.8541073, 0, 0, 0, 1, 1,
-0.3767456, 0.8255557, -1.033628, 1, 1, 1, 1, 1,
-0.3760982, -1.125482, -2.84636, 1, 1, 1, 1, 1,
-0.3701892, 0.8361568, -0.2513558, 1, 1, 1, 1, 1,
-0.3677332, -0.4927897, -3.210577, 1, 1, 1, 1, 1,
-0.366423, -0.7009404, -2.590791, 1, 1, 1, 1, 1,
-0.3661857, -1.931731, -4.071766, 1, 1, 1, 1, 1,
-0.3620954, 0.6294628, -1.836397, 1, 1, 1, 1, 1,
-0.3613283, 0.8872325, -0.203518, 1, 1, 1, 1, 1,
-0.3571859, -0.9817703, -1.971839, 1, 1, 1, 1, 1,
-0.3520096, 0.9332509, 0.215783, 1, 1, 1, 1, 1,
-0.3503018, -0.01073651, -1.527424, 1, 1, 1, 1, 1,
-0.3490278, 0.3614359, -0.3299291, 1, 1, 1, 1, 1,
-0.3474379, -0.1513752, -1.364718, 1, 1, 1, 1, 1,
-0.3459808, -0.4657887, -3.073397, 1, 1, 1, 1, 1,
-0.3300315, -0.2735647, -2.04969, 1, 1, 1, 1, 1,
-0.3293219, -0.620945, -4.028267, 0, 0, 1, 1, 1,
-0.3288606, -0.008378854, -1.248939, 1, 0, 0, 1, 1,
-0.3248579, -2.022718, -3.358145, 1, 0, 0, 1, 1,
-0.3233227, 0.6444159, -1.117048, 1, 0, 0, 1, 1,
-0.3200768, 0.03522814, -1.307009, 1, 0, 0, 1, 1,
-0.3191918, 1.042153, 0.1766978, 1, 0, 0, 1, 1,
-0.3167875, -0.6839543, -1.802758, 0, 0, 0, 1, 1,
-0.3153329, -1.073217, -2.802661, 0, 0, 0, 1, 1,
-0.3126699, 0.144534, -1.782074, 0, 0, 0, 1, 1,
-0.3086477, 0.3881704, -1.689843, 0, 0, 0, 1, 1,
-0.3037378, 0.1020206, -1.165151, 0, 0, 0, 1, 1,
-0.3026189, -0.7347061, -2.271642, 0, 0, 0, 1, 1,
-0.3006248, 0.1942049, -0.6799957, 0, 0, 0, 1, 1,
-0.2952412, 1.362324, -0.3527072, 1, 1, 1, 1, 1,
-0.2884544, -0.1623104, -2.813805, 1, 1, 1, 1, 1,
-0.2846788, 0.4413074, -1.623471, 1, 1, 1, 1, 1,
-0.2747798, -0.9495528, -3.75337, 1, 1, 1, 1, 1,
-0.2743869, -1.135635, -3.21833, 1, 1, 1, 1, 1,
-0.2693723, -2.213598, -4.613429, 1, 1, 1, 1, 1,
-0.2666601, 1.937028, -0.7435678, 1, 1, 1, 1, 1,
-0.2607169, 0.3863632, -1.149592, 1, 1, 1, 1, 1,
-0.2600158, -2.154057, -3.311443, 1, 1, 1, 1, 1,
-0.2592241, -1.401176, -4.103818, 1, 1, 1, 1, 1,
-0.2588356, -0.03188483, -0.04954551, 1, 1, 1, 1, 1,
-0.2587159, -1.417887, -3.500389, 1, 1, 1, 1, 1,
-0.2508794, -0.0293531, -1.156824, 1, 1, 1, 1, 1,
-0.2456879, -0.2227347, -2.929004, 1, 1, 1, 1, 1,
-0.2455067, 0.5881758, -1.079357, 1, 1, 1, 1, 1,
-0.2440485, -0.6416667, -3.074053, 0, 0, 1, 1, 1,
-0.2286929, 0.2932496, -2.321037, 1, 0, 0, 1, 1,
-0.2280653, 0.4141599, 0.7097851, 1, 0, 0, 1, 1,
-0.2217798, -0.4581259, -4.150234, 1, 0, 0, 1, 1,
-0.219761, -1.23562, -3.723947, 1, 0, 0, 1, 1,
-0.2181623, 0.4162585, 0.1924466, 1, 0, 0, 1, 1,
-0.216922, 1.608059, -0.05884003, 0, 0, 0, 1, 1,
-0.215644, 0.02594458, -1.645656, 0, 0, 0, 1, 1,
-0.2146784, 0.4366272, -1.326148, 0, 0, 0, 1, 1,
-0.2126113, 0.01297302, -1.679105, 0, 0, 0, 1, 1,
-0.2119203, 0.2870938, 0.4772413, 0, 0, 0, 1, 1,
-0.2111479, 0.09459639, -2.550722, 0, 0, 0, 1, 1,
-0.2056702, 1.181639, -0.630978, 0, 0, 0, 1, 1,
-0.204594, 1.030984, -0.1393535, 1, 1, 1, 1, 1,
-0.1938505, 0.9997537, -1.134336, 1, 1, 1, 1, 1,
-0.192945, 1.091036, -1.371823, 1, 1, 1, 1, 1,
-0.1895956, 0.5706427, -1.75493, 1, 1, 1, 1, 1,
-0.1857843, -1.662052, -3.8756, 1, 1, 1, 1, 1,
-0.1837938, -0.717028, -4.772773, 1, 1, 1, 1, 1,
-0.1789556, 0.4714198, -0.6967683, 1, 1, 1, 1, 1,
-0.1724672, -2.161688, -3.686189, 1, 1, 1, 1, 1,
-0.1629095, -0.7173019, -3.3513, 1, 1, 1, 1, 1,
-0.1611793, -0.8025724, -3.573046, 1, 1, 1, 1, 1,
-0.1596142, 1.125784, 0.3338556, 1, 1, 1, 1, 1,
-0.1583364, -0.2678532, -2.690336, 1, 1, 1, 1, 1,
-0.1536087, -0.8953743, -3.736784, 1, 1, 1, 1, 1,
-0.153189, -0.4532192, -3.038555, 1, 1, 1, 1, 1,
-0.1525723, 1.01652, -0.5463365, 1, 1, 1, 1, 1,
-0.1471277, 0.01808425, -1.640861, 0, 0, 1, 1, 1,
-0.1465152, 0.8378449, -1.425191, 1, 0, 0, 1, 1,
-0.1455022, -0.4357348, -2.263569, 1, 0, 0, 1, 1,
-0.1353651, 0.08680043, -1.546512, 1, 0, 0, 1, 1,
-0.1316828, 0.914069, 0.1272499, 1, 0, 0, 1, 1,
-0.1310027, 0.1815434, -1.087205, 1, 0, 0, 1, 1,
-0.1276329, -1.052256, -3.58122, 0, 0, 0, 1, 1,
-0.1265948, -0.2870123, -3.732549, 0, 0, 0, 1, 1,
-0.121701, 1.222697, 0.1205006, 0, 0, 0, 1, 1,
-0.1210679, 0.2538874, -0.8935906, 0, 0, 0, 1, 1,
-0.1205694, -0.6538121, -1.896265, 0, 0, 0, 1, 1,
-0.118959, -0.8715047, -3.885439, 0, 0, 0, 1, 1,
-0.1184372, -0.1198155, -2.102296, 0, 0, 0, 1, 1,
-0.11782, -0.6331223, -2.279107, 1, 1, 1, 1, 1,
-0.1122283, 0.7636234, -0.4844492, 1, 1, 1, 1, 1,
-0.1102313, 0.3848858, -0.5675734, 1, 1, 1, 1, 1,
-0.1025658, -1.278248, -2.417603, 1, 1, 1, 1, 1,
-0.09987205, -0.7372019, -5.035697, 1, 1, 1, 1, 1,
-0.09219353, -0.9237546, -3.459926, 1, 1, 1, 1, 1,
-0.08563138, -0.03636543, -2.254721, 1, 1, 1, 1, 1,
-0.08375127, -0.8827544, -2.258716, 1, 1, 1, 1, 1,
-0.07271567, -0.4166742, -2.853107, 1, 1, 1, 1, 1,
-0.07188568, -0.5997399, -0.5861574, 1, 1, 1, 1, 1,
-0.07173919, -0.5283151, -2.562207, 1, 1, 1, 1, 1,
-0.06530816, -1.220323, -2.703124, 1, 1, 1, 1, 1,
-0.06374089, -0.04160436, -1.31711, 1, 1, 1, 1, 1,
-0.06045657, 2.607539, -1.102656, 1, 1, 1, 1, 1,
-0.05330017, 0.1613358, 0.9716998, 1, 1, 1, 1, 1,
-0.05228451, 1.040208, 1.618643, 0, 0, 1, 1, 1,
-0.04802135, -0.1721955, -4.109656, 1, 0, 0, 1, 1,
-0.04692308, -1.156818, -4.015095, 1, 0, 0, 1, 1,
-0.04528608, -0.3378714, -1.753067, 1, 0, 0, 1, 1,
-0.0429449, 2.819046, 0.4520793, 1, 0, 0, 1, 1,
-0.04290853, -0.5975934, -2.771901, 1, 0, 0, 1, 1,
-0.03933723, -0.5081993, -3.083424, 0, 0, 0, 1, 1,
-0.03768866, -0.7981698, -4.472987, 0, 0, 0, 1, 1,
-0.03453243, -2.429139, -2.801517, 0, 0, 0, 1, 1,
-0.02901611, -0.1366389, -3.674538, 0, 0, 0, 1, 1,
-0.02791296, -0.4830803, -3.219497, 0, 0, 0, 1, 1,
-0.02774963, -0.9052073, -2.168673, 0, 0, 0, 1, 1,
-0.02610882, 0.04446291, -1.127439, 0, 0, 0, 1, 1,
-0.0258932, -0.05085358, -2.488328, 1, 1, 1, 1, 1,
-0.02398094, -0.0799801, -2.822887, 1, 1, 1, 1, 1,
-0.02300339, -0.5197814, -2.124107, 1, 1, 1, 1, 1,
-0.02218397, -0.8638169, -2.863325, 1, 1, 1, 1, 1,
-0.01831289, -0.8443788, -2.619853, 1, 1, 1, 1, 1,
-0.01514008, -0.03240237, -2.528577, 1, 1, 1, 1, 1,
-0.0142375, -1.371686, -2.159574, 1, 1, 1, 1, 1,
-0.01243336, 0.1966798, -0.2938968, 1, 1, 1, 1, 1,
-0.01094726, -0.6478939, -2.2417, 1, 1, 1, 1, 1,
-0.01019885, -0.09231924, -4.590438, 1, 1, 1, 1, 1,
-0.008205882, -0.4938098, -4.993527, 1, 1, 1, 1, 1,
-0.002182868, 0.9060771, -0.4025287, 1, 1, 1, 1, 1,
0.008016638, 0.1534012, 0.0475191, 1, 1, 1, 1, 1,
0.009925552, 1.128898, 0.7544552, 1, 1, 1, 1, 1,
0.01118514, -0.1482169, 4.30536, 1, 1, 1, 1, 1,
0.01544826, 1.874152, -0.5576399, 0, 0, 1, 1, 1,
0.01616825, -1.670717, 3.987305, 1, 0, 0, 1, 1,
0.01630523, -0.119534, 4.582303, 1, 0, 0, 1, 1,
0.01692631, 1.341913, 0.1304832, 1, 0, 0, 1, 1,
0.01832315, 0.6555902, -0.7595091, 1, 0, 0, 1, 1,
0.0200614, 0.753718, -0.1181054, 1, 0, 0, 1, 1,
0.02165193, 1.219383, 0.8545204, 0, 0, 0, 1, 1,
0.0232325, -0.2715968, 3.79635, 0, 0, 0, 1, 1,
0.0232491, -0.2248308, 1.674099, 0, 0, 0, 1, 1,
0.02463596, 0.2027948, -0.6408175, 0, 0, 0, 1, 1,
0.02694714, 0.558113, -0.3351915, 0, 0, 0, 1, 1,
0.02800086, -0.8331408, 4.140877, 0, 0, 0, 1, 1,
0.02860247, -1.113645, 3.700596, 0, 0, 0, 1, 1,
0.02892492, -0.1243414, 2.794382, 1, 1, 1, 1, 1,
0.03035956, 0.02309566, 0.8705518, 1, 1, 1, 1, 1,
0.03129523, -0.1560285, 3.953341, 1, 1, 1, 1, 1,
0.03821129, 0.563919, -0.2029033, 1, 1, 1, 1, 1,
0.03918422, 1.714758, 0.9335299, 1, 1, 1, 1, 1,
0.0407571, -0.8104727, 4.674079, 1, 1, 1, 1, 1,
0.04247129, -1.269043, 3.540801, 1, 1, 1, 1, 1,
0.04665835, 0.6064365, 0.03039346, 1, 1, 1, 1, 1,
0.05016605, 0.2706546, -1.662526, 1, 1, 1, 1, 1,
0.05344764, 1.085867, 0.9734348, 1, 1, 1, 1, 1,
0.05471664, -0.4332224, 3.674926, 1, 1, 1, 1, 1,
0.05532304, -1.345618, 2.427105, 1, 1, 1, 1, 1,
0.05858443, 0.01280256, 1.963038, 1, 1, 1, 1, 1,
0.06298619, -0.2438295, 2.797742, 1, 1, 1, 1, 1,
0.06512929, -0.2601048, 3.35287, 1, 1, 1, 1, 1,
0.06935174, -1.652945, 0.7500312, 0, 0, 1, 1, 1,
0.0720628, -1.111744, 3.581536, 1, 0, 0, 1, 1,
0.07298721, 0.564084, -0.2039346, 1, 0, 0, 1, 1,
0.07538364, 1.239075, 0.07858521, 1, 0, 0, 1, 1,
0.0778801, 2.507941, -0.9963709, 1, 0, 0, 1, 1,
0.08089866, -0.3495269, 3.340787, 1, 0, 0, 1, 1,
0.08091789, 0.8399168, -0.1298303, 0, 0, 0, 1, 1,
0.0861438, 0.9541338, -1.16216, 0, 0, 0, 1, 1,
0.08751372, 0.3214282, -1.585008, 0, 0, 0, 1, 1,
0.09031653, -0.9473057, 2.254759, 0, 0, 0, 1, 1,
0.09376812, 1.475652, -0.3962491, 0, 0, 0, 1, 1,
0.09673229, 0.4681513, 1.523724, 0, 0, 0, 1, 1,
0.102169, 0.9344245, -1.431571, 0, 0, 0, 1, 1,
0.1057794, 0.2062785, 0.1698915, 1, 1, 1, 1, 1,
0.1058638, 2.059619, 0.1520896, 1, 1, 1, 1, 1,
0.1070962, -0.0344676, 1.476205, 1, 1, 1, 1, 1,
0.1079914, -1.874523, 1.653007, 1, 1, 1, 1, 1,
0.1085157, 1.473729, 0.5698029, 1, 1, 1, 1, 1,
0.1087864, 1.753367, -1.099787, 1, 1, 1, 1, 1,
0.1126336, 1.123052, -1.286828, 1, 1, 1, 1, 1,
0.11381, -1.564907, 3.72543, 1, 1, 1, 1, 1,
0.1170952, -0.9395908, 2.303077, 1, 1, 1, 1, 1,
0.1178471, -0.8993954, 1.233519, 1, 1, 1, 1, 1,
0.1179807, -0.1981252, 2.438541, 1, 1, 1, 1, 1,
0.1223244, 0.358443, -0.09804247, 1, 1, 1, 1, 1,
0.1226318, -1.354244, 2.701251, 1, 1, 1, 1, 1,
0.1226521, 0.111615, -0.3787564, 1, 1, 1, 1, 1,
0.1280668, -1.137895, 3.543779, 1, 1, 1, 1, 1,
0.1282975, -0.9532005, 4.100933, 0, 0, 1, 1, 1,
0.1363237, 0.5846474, 0.07154562, 1, 0, 0, 1, 1,
0.1363577, -0.7774261, 3.604972, 1, 0, 0, 1, 1,
0.1400505, 0.3120231, -1.861254, 1, 0, 0, 1, 1,
0.1456333, -0.4335965, 2.638706, 1, 0, 0, 1, 1,
0.1481497, 0.8269358, 0.2404369, 1, 0, 0, 1, 1,
0.1515341, 0.7460639, -1.538782, 0, 0, 0, 1, 1,
0.1532396, 0.4412787, 0.906419, 0, 0, 0, 1, 1,
0.1558517, 0.7630186, -0.2161886, 0, 0, 0, 1, 1,
0.1569144, 0.1534964, 2.240445, 0, 0, 0, 1, 1,
0.1595183, -0.9823539, 3.119822, 0, 0, 0, 1, 1,
0.1625837, 0.3393089, 2.316437, 0, 0, 0, 1, 1,
0.1629087, -1.61601, 3.101942, 0, 0, 0, 1, 1,
0.1654884, 0.8816829, 1.204241, 1, 1, 1, 1, 1,
0.1737997, 1.655505, -1.228212, 1, 1, 1, 1, 1,
0.1746339, 0.4661853, 1.512325, 1, 1, 1, 1, 1,
0.1748109, 0.1570265, 0.4386734, 1, 1, 1, 1, 1,
0.1770076, 0.5775424, 0.5675587, 1, 1, 1, 1, 1,
0.1806816, -2.173418, 4.52919, 1, 1, 1, 1, 1,
0.1824131, -1.062628, 3.50552, 1, 1, 1, 1, 1,
0.18245, 0.3935148, 2.346364, 1, 1, 1, 1, 1,
0.1834967, -1.024441, 3.687245, 1, 1, 1, 1, 1,
0.1835885, -0.2743093, 2.368846, 1, 1, 1, 1, 1,
0.1855962, 0.1972242, 0.07767326, 1, 1, 1, 1, 1,
0.1866229, 1.127719, -0.7450211, 1, 1, 1, 1, 1,
0.1872997, -0.6454552, 3.04273, 1, 1, 1, 1, 1,
0.1876689, 0.4452232, 0.2920141, 1, 1, 1, 1, 1,
0.1938402, -1.354058, 2.824366, 1, 1, 1, 1, 1,
0.1943648, -0.3914916, 3.408494, 0, 0, 1, 1, 1,
0.195004, 0.2011888, -0.3002805, 1, 0, 0, 1, 1,
0.1955393, -0.5522857, 1.443204, 1, 0, 0, 1, 1,
0.1985562, 0.8655333, -0.9929979, 1, 0, 0, 1, 1,
0.2054572, -0.7240169, 4.373124, 1, 0, 0, 1, 1,
0.2057341, -0.5798353, 2.146528, 1, 0, 0, 1, 1,
0.2087345, 0.9874838, -0.1619421, 0, 0, 0, 1, 1,
0.2090512, -0.4547783, 1.778756, 0, 0, 0, 1, 1,
0.2091219, 0.5214619, 1.145333, 0, 0, 0, 1, 1,
0.210266, -0.6825504, 3.634119, 0, 0, 0, 1, 1,
0.2142938, -1.273812, 2.161475, 0, 0, 0, 1, 1,
0.2155782, 0.8212798, 2.242577, 0, 0, 0, 1, 1,
0.2174321, 1.539575, 0.2119764, 0, 0, 0, 1, 1,
0.2284881, 0.07831759, 0.6987903, 1, 1, 1, 1, 1,
0.2320162, -0.920379, 3.42568, 1, 1, 1, 1, 1,
0.2327039, -1.088232, 4.188872, 1, 1, 1, 1, 1,
0.2334037, -1.799946, 4.549433, 1, 1, 1, 1, 1,
0.2338177, 1.08329, -0.857749, 1, 1, 1, 1, 1,
0.2379582, -0.2647398, 2.28243, 1, 1, 1, 1, 1,
0.2398783, -0.6238626, 0.9984494, 1, 1, 1, 1, 1,
0.2421892, 0.2736193, 0.4554952, 1, 1, 1, 1, 1,
0.2555061, -0.07542586, 2.062222, 1, 1, 1, 1, 1,
0.2599461, -0.008839332, 2.963445, 1, 1, 1, 1, 1,
0.2623246, -0.3973145, 2.568558, 1, 1, 1, 1, 1,
0.2644728, 1.271896, 0.7409469, 1, 1, 1, 1, 1,
0.2682826, -0.01246644, 0.7186385, 1, 1, 1, 1, 1,
0.2816266, 0.422358, 0.008960507, 1, 1, 1, 1, 1,
0.2821599, 1.140589, 1.370594, 1, 1, 1, 1, 1,
0.2901892, 1.126155, 0.6454259, 0, 0, 1, 1, 1,
0.2909599, -0.9426588, 3.000629, 1, 0, 0, 1, 1,
0.292163, 0.7607315, 0.2893804, 1, 0, 0, 1, 1,
0.292244, 0.7391159, -0.06414636, 1, 0, 0, 1, 1,
0.2979479, -1.479268, 3.511575, 1, 0, 0, 1, 1,
0.3047391, -1.706906, 3.794325, 1, 0, 0, 1, 1,
0.3069296, 0.8480457, 1.665104, 0, 0, 0, 1, 1,
0.3135302, -1.106097, 2.649931, 0, 0, 0, 1, 1,
0.3137493, -0.4121645, 2.623399, 0, 0, 0, 1, 1,
0.31388, -0.1736043, 1.990397, 0, 0, 0, 1, 1,
0.3147769, -2.310468, 3.087974, 0, 0, 0, 1, 1,
0.3157366, 0.3281132, -0.1650331, 0, 0, 0, 1, 1,
0.3158983, -1.804215, 2.777333, 0, 0, 0, 1, 1,
0.3185535, -0.1987077, 1.304134, 1, 1, 1, 1, 1,
0.3223736, 0.5772556, 1.545022, 1, 1, 1, 1, 1,
0.3281122, -0.01009329, 0.7503908, 1, 1, 1, 1, 1,
0.3282726, 0.4985864, -0.09729756, 1, 1, 1, 1, 1,
0.330583, -0.4733348, 2.867626, 1, 1, 1, 1, 1,
0.3315724, 1.610864, -0.2556857, 1, 1, 1, 1, 1,
0.3342218, -2.317589, 2.410721, 1, 1, 1, 1, 1,
0.3366832, 0.9661196, -0.1948301, 1, 1, 1, 1, 1,
0.3368132, -1.117569, 0.7086921, 1, 1, 1, 1, 1,
0.3397433, 1.074719, 0.2619171, 1, 1, 1, 1, 1,
0.3415701, 0.1676925, -0.2030443, 1, 1, 1, 1, 1,
0.3442105, -0.276161, 2.989807, 1, 1, 1, 1, 1,
0.3465879, 1.669336, 0.3925343, 1, 1, 1, 1, 1,
0.3481893, -0.2467449, 1.883108, 1, 1, 1, 1, 1,
0.3506742, -0.3712969, 1.181592, 1, 1, 1, 1, 1,
0.3508649, -0.6202397, 3.430076, 0, 0, 1, 1, 1,
0.3528895, 0.8589972, -0.1236383, 1, 0, 0, 1, 1,
0.3545979, -0.2816063, 1.743485, 1, 0, 0, 1, 1,
0.358932, -1.038426, 2.126512, 1, 0, 0, 1, 1,
0.3611681, 0.1135622, -1.701239, 1, 0, 0, 1, 1,
0.3618318, -0.09377861, 1.990519, 1, 0, 0, 1, 1,
0.3621214, -0.3773535, 3.571172, 0, 0, 0, 1, 1,
0.3637784, 0.6111918, 1.273142, 0, 0, 0, 1, 1,
0.3693417, 0.6928263, 1.399393, 0, 0, 0, 1, 1,
0.3694953, 0.5500624, 0.634044, 0, 0, 0, 1, 1,
0.3802322, 0.5003731, 0.6700256, 0, 0, 0, 1, 1,
0.3833579, -0.3810531, 1.642662, 0, 0, 0, 1, 1,
0.3874006, 0.6587655, -0.3401461, 0, 0, 0, 1, 1,
0.3939802, 0.09719363, 1.685944, 1, 1, 1, 1, 1,
0.3988159, -1.343449, 3.778792, 1, 1, 1, 1, 1,
0.4055647, -0.2210741, 3.207014, 1, 1, 1, 1, 1,
0.4080188, -0.2603557, 1.470409, 1, 1, 1, 1, 1,
0.4094218, -0.5252559, 3.072697, 1, 1, 1, 1, 1,
0.4094475, 0.09758188, 2.270716, 1, 1, 1, 1, 1,
0.410098, 0.5637795, -0.6378946, 1, 1, 1, 1, 1,
0.4106645, -1.279957, 2.328274, 1, 1, 1, 1, 1,
0.4148783, -0.2290004, 3.455574, 1, 1, 1, 1, 1,
0.4170505, 0.4836025, 0.4196023, 1, 1, 1, 1, 1,
0.4179412, -1.267306, 2.965393, 1, 1, 1, 1, 1,
0.4204801, -0.1535151, 0.7639464, 1, 1, 1, 1, 1,
0.4210994, -0.5267208, 2.093004, 1, 1, 1, 1, 1,
0.4234403, 0.08766703, 2.227217, 1, 1, 1, 1, 1,
0.4269423, -0.2146566, 2.489006, 1, 1, 1, 1, 1,
0.4281615, 0.8162306, 0.08060653, 0, 0, 1, 1, 1,
0.4295567, -0.3992507, 2.931176, 1, 0, 0, 1, 1,
0.4305901, -0.02367388, 0.08615929, 1, 0, 0, 1, 1,
0.4306133, 1.48055, 0.4254937, 1, 0, 0, 1, 1,
0.4337985, -0.7611058, 3.410213, 1, 0, 0, 1, 1,
0.4431225, 0.2472671, 1.709632, 1, 0, 0, 1, 1,
0.4437332, -0.6418162, 1.647494, 0, 0, 0, 1, 1,
0.4443631, 0.2633895, -0.6194301, 0, 0, 0, 1, 1,
0.4475625, -0.6484406, 1.644272, 0, 0, 0, 1, 1,
0.4482117, 0.2685361, 0.7917521, 0, 0, 0, 1, 1,
0.4508849, 0.9934714, 3.334408, 0, 0, 0, 1, 1,
0.4509734, 0.5194434, -0.6035723, 0, 0, 0, 1, 1,
0.4527136, -0.8167674, 1.723795, 0, 0, 0, 1, 1,
0.459156, 0.01065814, 1.620349, 1, 1, 1, 1, 1,
0.4664038, 1.421701, 0.8269267, 1, 1, 1, 1, 1,
0.4673679, -2.566999, 4.277485, 1, 1, 1, 1, 1,
0.4686382, -0.008052885, 2.071745, 1, 1, 1, 1, 1,
0.4721841, -1.777002, 1.051367, 1, 1, 1, 1, 1,
0.4753409, 0.6302609, 0.0938658, 1, 1, 1, 1, 1,
0.4773363, -0.1225713, 2.387105, 1, 1, 1, 1, 1,
0.4839466, -1.800963, 4.40903, 1, 1, 1, 1, 1,
0.485613, 1.230411, 1.242725, 1, 1, 1, 1, 1,
0.4866422, 0.4947027, 1.457959, 1, 1, 1, 1, 1,
0.4883981, 0.4932747, -1.237822, 1, 1, 1, 1, 1,
0.493126, -0.7754068, -0.3495509, 1, 1, 1, 1, 1,
0.4939172, -0.5563364, 1.846324, 1, 1, 1, 1, 1,
0.5007853, -0.542143, 2.342918, 1, 1, 1, 1, 1,
0.5033118, 0.2430289, 1.846883, 1, 1, 1, 1, 1,
0.5042347, 1.500351, 0.959552, 0, 0, 1, 1, 1,
0.5050157, -0.5484508, 1.723459, 1, 0, 0, 1, 1,
0.5062714, 0.8342364, -0.6183571, 1, 0, 0, 1, 1,
0.5138066, 1.177238, -0.1745399, 1, 0, 0, 1, 1,
0.5150918, 0.08130369, 1.007425, 1, 0, 0, 1, 1,
0.5187567, 0.9387453, 0.2931924, 1, 0, 0, 1, 1,
0.5214405, -3.070305, 3.259137, 0, 0, 0, 1, 1,
0.5220408, 1.233035, 0.4435198, 0, 0, 0, 1, 1,
0.523424, -0.3018709, 1.919904, 0, 0, 0, 1, 1,
0.528587, -0.1678577, 1.328689, 0, 0, 0, 1, 1,
0.5290356, -0.2011167, 3.008651, 0, 0, 0, 1, 1,
0.5322029, 0.2601212, 0.7145879, 0, 0, 0, 1, 1,
0.5329172, -1.427815, 3.065421, 0, 0, 0, 1, 1,
0.5392253, -1.499402, 4.34596, 1, 1, 1, 1, 1,
0.5397124, 0.805088, 3.006389, 1, 1, 1, 1, 1,
0.5485892, -1.332175, 3.169134, 1, 1, 1, 1, 1,
0.5518264, 0.2391296, 2.846262, 1, 1, 1, 1, 1,
0.5560517, 1.065804, 1.521154, 1, 1, 1, 1, 1,
0.5574512, 0.03592706, 0.9295505, 1, 1, 1, 1, 1,
0.5656096, 1.15157, -1.346657, 1, 1, 1, 1, 1,
0.5676654, -0.06814795, 0.8403576, 1, 1, 1, 1, 1,
0.5742507, 0.4841882, 0.4948457, 1, 1, 1, 1, 1,
0.5744423, -1.172086, 4.080367, 1, 1, 1, 1, 1,
0.5746745, -0.5493407, 2.626504, 1, 1, 1, 1, 1,
0.5781618, -0.03323562, 2.276651, 1, 1, 1, 1, 1,
0.5815905, -0.3398403, 1.825723, 1, 1, 1, 1, 1,
0.5833692, 0.9263428, 0.612421, 1, 1, 1, 1, 1,
0.5836654, 1.177647, -0.2177669, 1, 1, 1, 1, 1,
0.5875923, 0.7388331, 1.4922, 0, 0, 1, 1, 1,
0.5911368, -1.607012, 1.924543, 1, 0, 0, 1, 1,
0.5912637, -0.3215204, 2.861916, 1, 0, 0, 1, 1,
0.5914354, -0.4085225, 2.525914, 1, 0, 0, 1, 1,
0.5958441, -1.435389, 2.397965, 1, 0, 0, 1, 1,
0.5963497, -0.2153301, 2.009748, 1, 0, 0, 1, 1,
0.5982293, -0.8534642, 4.007495, 0, 0, 0, 1, 1,
0.5987234, 0.9699809, 0.1975101, 0, 0, 0, 1, 1,
0.6010237, -0.2670532, 2.474285, 0, 0, 0, 1, 1,
0.6027617, -0.004347714, 1.543399, 0, 0, 0, 1, 1,
0.6042352, -0.932954, 0.4201795, 0, 0, 0, 1, 1,
0.6072574, 0.8004026, 1.583388, 0, 0, 0, 1, 1,
0.6096085, 0.6146994, -1.219861, 0, 0, 0, 1, 1,
0.6101577, -0.2910968, 0.4670234, 1, 1, 1, 1, 1,
0.6112767, -0.7106349, 3.867056, 1, 1, 1, 1, 1,
0.6222106, -0.7889394, 2.15598, 1, 1, 1, 1, 1,
0.6256307, 0.04613765, 1.505284, 1, 1, 1, 1, 1,
0.6282727, -0.08184946, 0.7244136, 1, 1, 1, 1, 1,
0.6293845, 0.7318648, 0.05631499, 1, 1, 1, 1, 1,
0.6302928, 1.031159, 0.7732153, 1, 1, 1, 1, 1,
0.6327693, 0.8475813, 1.251029, 1, 1, 1, 1, 1,
0.6343383, -0.5189372, 1.748623, 1, 1, 1, 1, 1,
0.6407813, 0.3344519, -0.784455, 1, 1, 1, 1, 1,
0.643738, -0.7165288, 2.774097, 1, 1, 1, 1, 1,
0.6450678, -0.4233445, 1.996169, 1, 1, 1, 1, 1,
0.6526567, 0.1305291, 1.934357, 1, 1, 1, 1, 1,
0.6568882, 0.6712309, 1.84608, 1, 1, 1, 1, 1,
0.6584813, -0.5089919, 2.668934, 1, 1, 1, 1, 1,
0.66181, 2.163482, -0.2814708, 0, 0, 1, 1, 1,
0.669241, -0.8122969, 2.343345, 1, 0, 0, 1, 1,
0.6709954, -0.8291923, 2.891009, 1, 0, 0, 1, 1,
0.6722735, -1.445486, 2.633911, 1, 0, 0, 1, 1,
0.6793293, 0.3566383, 0.484291, 1, 0, 0, 1, 1,
0.6845426, -0.3537382, 2.768951, 1, 0, 0, 1, 1,
0.6865422, 0.8376793, -2.073046, 0, 0, 0, 1, 1,
0.6900591, 1.505311, 2.035747, 0, 0, 0, 1, 1,
0.6905564, -1.952728, 1.92507, 0, 0, 0, 1, 1,
0.6909428, 1.541495, -0.01501037, 0, 0, 0, 1, 1,
0.6964404, 0.1624802, 0.1416886, 0, 0, 0, 1, 1,
0.6974223, -0.512805, 1.35668, 0, 0, 0, 1, 1,
0.6984001, -1.91577, 2.165797, 0, 0, 0, 1, 1,
0.7002443, 0.9776177, -0.6014318, 1, 1, 1, 1, 1,
0.7012397, -0.02488511, 0.6318675, 1, 1, 1, 1, 1,
0.7013252, 0.07420696, 1.984632, 1, 1, 1, 1, 1,
0.7024277, 1.204104, 1.375071, 1, 1, 1, 1, 1,
0.7030919, 1.027246, 0.8722169, 1, 1, 1, 1, 1,
0.7045873, -1.295212, 1.741392, 1, 1, 1, 1, 1,
0.7046553, 0.01668996, 1.847439, 1, 1, 1, 1, 1,
0.7077309, -0.09393256, 1.07033, 1, 1, 1, 1, 1,
0.7178102, 0.09992304, 2.690595, 1, 1, 1, 1, 1,
0.7189217, 0.5449553, -1.389117, 1, 1, 1, 1, 1,
0.7196568, -1.442249, 3.248323, 1, 1, 1, 1, 1,
0.7216597, -1.431181, 2.803253, 1, 1, 1, 1, 1,
0.7257906, 0.7596332, 0.1921357, 1, 1, 1, 1, 1,
0.7297437, -0.5692945, 2.665096, 1, 1, 1, 1, 1,
0.7353505, 0.6217955, 1.943244, 1, 1, 1, 1, 1,
0.7355683, 1.433316, -1.102102, 0, 0, 1, 1, 1,
0.7362562, -1.500872, 1.860098, 1, 0, 0, 1, 1,
0.7372829, -0.9425605, 2.354046, 1, 0, 0, 1, 1,
0.7526128, -1.204293, 3.898143, 1, 0, 0, 1, 1,
0.7558669, 0.8890339, 0.9028804, 1, 0, 0, 1, 1,
0.7578557, -0.8002242, 1.784325, 1, 0, 0, 1, 1,
0.7620859, -0.7583493, 1.456883, 0, 0, 0, 1, 1,
0.7647694, 0.4241293, 1.228178, 0, 0, 0, 1, 1,
0.7658831, -1.989443, 3.269553, 0, 0, 0, 1, 1,
0.7714699, 0.3017016, 1.848201, 0, 0, 0, 1, 1,
0.7714782, -1.870393, 4.732085, 0, 0, 0, 1, 1,
0.7716457, -0.003223479, 3.341447, 0, 0, 0, 1, 1,
0.7732889, 0.6658782, 1.069069, 0, 0, 0, 1, 1,
0.7742029, 1.766826, -1.558528, 1, 1, 1, 1, 1,
0.7785895, -0.9421206, 2.774256, 1, 1, 1, 1, 1,
0.7797126, 1.23241, 0.7458683, 1, 1, 1, 1, 1,
0.7832792, 0.08791501, 1.63894, 1, 1, 1, 1, 1,
0.7842199, -1.415665, 1.795532, 1, 1, 1, 1, 1,
0.7917519, 0.7530662, 0.3624685, 1, 1, 1, 1, 1,
0.7921055, 2.075961, -0.07252945, 1, 1, 1, 1, 1,
0.7950476, 0.5280188, 3.227998, 1, 1, 1, 1, 1,
0.7954147, 0.2556134, 0.8088242, 1, 1, 1, 1, 1,
0.7972236, 0.574424, 2.120854, 1, 1, 1, 1, 1,
0.797357, 0.4433181, 0.514301, 1, 1, 1, 1, 1,
0.7984222, 0.1837149, -1.017174, 1, 1, 1, 1, 1,
0.8020694, 0.6333597, 1.427548, 1, 1, 1, 1, 1,
0.8076677, -0.2605961, 2.058188, 1, 1, 1, 1, 1,
0.8095604, 1.185716, 1.334913, 1, 1, 1, 1, 1,
0.8134158, -1.05816, 2.631725, 0, 0, 1, 1, 1,
0.8196714, -1.450024, 2.923454, 1, 0, 0, 1, 1,
0.825036, -0.6854299, 1.277119, 1, 0, 0, 1, 1,
0.8254907, 0.5225987, 0.630635, 1, 0, 0, 1, 1,
0.8286199, -0.5943559, 1.374154, 1, 0, 0, 1, 1,
0.8289205, -0.1843757, 1.395435, 1, 0, 0, 1, 1,
0.830061, 1.211557, 1.288846, 0, 0, 0, 1, 1,
0.8364428, 0.5074047, -0.04191595, 0, 0, 0, 1, 1,
0.8454248, 0.2834826, 1.025729, 0, 0, 0, 1, 1,
0.8482554, -1.824028, 3.217273, 0, 0, 0, 1, 1,
0.8512878, 0.6125172, 0.3303713, 0, 0, 0, 1, 1,
0.8583913, -0.3930449, 3.034221, 0, 0, 0, 1, 1,
0.8603736, 0.4025279, 1.676379, 0, 0, 0, 1, 1,
0.8607214, 1.199531, -0.1110362, 1, 1, 1, 1, 1,
0.8650619, 0.6961116, 0.9205055, 1, 1, 1, 1, 1,
0.8674775, -0.548048, 3.362416, 1, 1, 1, 1, 1,
0.8705651, 0.06588636, 0.4788163, 1, 1, 1, 1, 1,
0.8735962, -0.04131847, 1.432492, 1, 1, 1, 1, 1,
0.8793586, -0.4425775, 3.212998, 1, 1, 1, 1, 1,
0.8799859, 0.1044267, 2.88606, 1, 1, 1, 1, 1,
0.8814755, 1.358383, 0.7753536, 1, 1, 1, 1, 1,
0.8819605, 1.066758, -0.2272594, 1, 1, 1, 1, 1,
0.8849863, -0.5391105, 2.553703, 1, 1, 1, 1, 1,
0.8896449, -2.197662, 1.957888, 1, 1, 1, 1, 1,
0.8932568, 0.4733344, -0.3433437, 1, 1, 1, 1, 1,
0.9081625, -0.7227381, 2.23628, 1, 1, 1, 1, 1,
0.917279, -0.7754019, 2.083117, 1, 1, 1, 1, 1,
0.922699, 0.4133902, 0.3545149, 1, 1, 1, 1, 1,
0.9242985, -0.8834401, 2.575478, 0, 0, 1, 1, 1,
0.9263482, -0.8935171, 1.581264, 1, 0, 0, 1, 1,
0.9298463, -1.156958, 3.68614, 1, 0, 0, 1, 1,
0.9299492, -1.282134, 2.693383, 1, 0, 0, 1, 1,
0.9303779, 0.06987498, 0.5069531, 1, 0, 0, 1, 1,
0.9357272, -0.6495507, 2.765111, 1, 0, 0, 1, 1,
0.9386771, -0.04932974, 2.094094, 0, 0, 0, 1, 1,
0.9465678, 0.6981869, -1.115994, 0, 0, 0, 1, 1,
0.9539312, 0.2317134, 0.8637207, 0, 0, 0, 1, 1,
0.9709777, -1.028116, 1.355694, 0, 0, 0, 1, 1,
0.9715575, -1.334291, 3.509528, 0, 0, 0, 1, 1,
0.9725546, 0.8503765, -1.166582, 0, 0, 0, 1, 1,
0.9738398, -0.8403856, 2.002547, 0, 0, 0, 1, 1,
0.9815546, 0.413967, -0.1296851, 1, 1, 1, 1, 1,
0.9891097, 1.720296, 1.209482, 1, 1, 1, 1, 1,
0.9908895, -0.2238763, 1.915515, 1, 1, 1, 1, 1,
1.002836, 0.5263824, 1.014602, 1, 1, 1, 1, 1,
1.009232, -1.51012, 2.576842, 1, 1, 1, 1, 1,
1.009795, -0.04039419, 1.236675, 1, 1, 1, 1, 1,
1.011038, -0.5426148, 0.4443513, 1, 1, 1, 1, 1,
1.016866, 0.2565646, 0.6985866, 1, 1, 1, 1, 1,
1.025066, 0.1828344, 1.619329, 1, 1, 1, 1, 1,
1.028474, -0.08337332, 2.727068, 1, 1, 1, 1, 1,
1.033158, 0.01530424, 1.258929, 1, 1, 1, 1, 1,
1.036776, -0.1422431, 1.751224, 1, 1, 1, 1, 1,
1.038038, 0.4901723, 1.33744, 1, 1, 1, 1, 1,
1.039481, -0.1101155, 0.374655, 1, 1, 1, 1, 1,
1.047264, 1.47829, -0.4914722, 1, 1, 1, 1, 1,
1.047559, -1.290352, 1.634085, 0, 0, 1, 1, 1,
1.054956, 0.2476405, 1.743573, 1, 0, 0, 1, 1,
1.057172, -1.021125, 1.941743, 1, 0, 0, 1, 1,
1.065851, 1.74433, 1.22838, 1, 0, 0, 1, 1,
1.068866, -0.5474945, 2.577343, 1, 0, 0, 1, 1,
1.07011, -1.064993, 2.303632, 1, 0, 0, 1, 1,
1.073099, -2.301294, 2.971236, 0, 0, 0, 1, 1,
1.076457, -0.7007683, 3.072967, 0, 0, 0, 1, 1,
1.079334, -0.1146359, -0.1180528, 0, 0, 0, 1, 1,
1.082233, 0.7059187, -1.348577, 0, 0, 0, 1, 1,
1.086362, -1.582542, 3.173154, 0, 0, 0, 1, 1,
1.09426, -0.7744439, 2.558551, 0, 0, 0, 1, 1,
1.099234, -0.02200587, 1.299267, 0, 0, 0, 1, 1,
1.099774, 0.9549001, 1.883685, 1, 1, 1, 1, 1,
1.104717, 0.4786775, 3.198744, 1, 1, 1, 1, 1,
1.105409, 0.4734998, 1.609553, 1, 1, 1, 1, 1,
1.106654, 0.003164038, 1.155617, 1, 1, 1, 1, 1,
1.107315, 0.7687147, 1.288623, 1, 1, 1, 1, 1,
1.108971, -0.909261, 1.311985, 1, 1, 1, 1, 1,
1.111398, 0.06493449, 1.460834, 1, 1, 1, 1, 1,
1.11405, -0.432681, 2.108598, 1, 1, 1, 1, 1,
1.115009, 0.0208333, 3.090334, 1, 1, 1, 1, 1,
1.117844, 1.892387, 0.3522505, 1, 1, 1, 1, 1,
1.119686, -0.4093188, 2.11655, 1, 1, 1, 1, 1,
1.123355, -0.8328008, 1.44972, 1, 1, 1, 1, 1,
1.123992, 1.384121, -0.07546467, 1, 1, 1, 1, 1,
1.128918, 0.2674898, -0.06829765, 1, 1, 1, 1, 1,
1.130832, 1.057386, 2.207095, 1, 1, 1, 1, 1,
1.135799, -0.4916857, 2.458596, 0, 0, 1, 1, 1,
1.142027, -0.4292672, 2.451313, 1, 0, 0, 1, 1,
1.145734, 1.245341, 0.09357348, 1, 0, 0, 1, 1,
1.151023, -0.9083139, 1.955987, 1, 0, 0, 1, 1,
1.152966, -1.089325, 4.079501, 1, 0, 0, 1, 1,
1.153362, -1.482682, 2.230063, 1, 0, 0, 1, 1,
1.155749, -0.5868519, 2.115444, 0, 0, 0, 1, 1,
1.160458, 0.4354545, 2.112659, 0, 0, 0, 1, 1,
1.164724, -0.3598295, 1.055483, 0, 0, 0, 1, 1,
1.165528, 1.576651, 0.06020732, 0, 0, 0, 1, 1,
1.16588, 0.02793457, 2.821029, 0, 0, 0, 1, 1,
1.166044, -0.7331106, 2.417378, 0, 0, 0, 1, 1,
1.170253, 0.5534225, 1.056589, 0, 0, 0, 1, 1,
1.179352, 0.2038771, 2.093404, 1, 1, 1, 1, 1,
1.186616, 1.109992, 3.370793, 1, 1, 1, 1, 1,
1.20077, -1.53312, 1.824867, 1, 1, 1, 1, 1,
1.203187, -0.4322674, 2.347528, 1, 1, 1, 1, 1,
1.210696, -0.09371035, 1.432457, 1, 1, 1, 1, 1,
1.213203, 1.093662, 0.9464907, 1, 1, 1, 1, 1,
1.215835, -1.69088, 3.367797, 1, 1, 1, 1, 1,
1.216043, 2.099883, -1.045045, 1, 1, 1, 1, 1,
1.224985, 1.308207, 1.328124, 1, 1, 1, 1, 1,
1.242437, -0.269606, 3.155214, 1, 1, 1, 1, 1,
1.244188, 0.9928262, 0.3205532, 1, 1, 1, 1, 1,
1.253732, 0.6116267, -0.878412, 1, 1, 1, 1, 1,
1.267814, 0.7230122, 1.801654, 1, 1, 1, 1, 1,
1.296208, -0.5254607, 1.992885, 1, 1, 1, 1, 1,
1.297508, -0.422194, 1.080825, 1, 1, 1, 1, 1,
1.304994, -0.3591048, 2.638886, 0, 0, 1, 1, 1,
1.309011, 0.3975761, 0.4685024, 1, 0, 0, 1, 1,
1.311423, 0.7368865, -0.8548885, 1, 0, 0, 1, 1,
1.312024, 0.8246583, 1.068637, 1, 0, 0, 1, 1,
1.312377, 0.2683501, 1.306819, 1, 0, 0, 1, 1,
1.321373, -0.3937939, 2.480863, 1, 0, 0, 1, 1,
1.323513, 0.3422233, 0.7189845, 0, 0, 0, 1, 1,
1.328256, -0.2644587, 0.969614, 0, 0, 0, 1, 1,
1.329438, 0.8475875, 1.345771, 0, 0, 0, 1, 1,
1.331564, -0.3449417, 2.559012, 0, 0, 0, 1, 1,
1.350602, -1.060626, 1.364398, 0, 0, 0, 1, 1,
1.36482, 0.1385162, 1.982633, 0, 0, 0, 1, 1,
1.379137, 0.7625866, -0.02217169, 0, 0, 0, 1, 1,
1.380714, -0.4637892, 1.438558, 1, 1, 1, 1, 1,
1.381662, -0.8962391, 1.98382, 1, 1, 1, 1, 1,
1.384477, 0.08209344, 0.8732513, 1, 1, 1, 1, 1,
1.385293, -0.8610601, 2.552188, 1, 1, 1, 1, 1,
1.386341, 0.6003894, 0.7870163, 1, 1, 1, 1, 1,
1.387414, -1.693057, 3.197075, 1, 1, 1, 1, 1,
1.393431, 0.5453314, 1.146736, 1, 1, 1, 1, 1,
1.40062, -0.2869293, 1.749326, 1, 1, 1, 1, 1,
1.407053, -2.051667, 1.594664, 1, 1, 1, 1, 1,
1.407937, -0.4461253, 1.343195, 1, 1, 1, 1, 1,
1.412561, 1.429044, -0.4888751, 1, 1, 1, 1, 1,
1.416336, 1.407748, 2.359541, 1, 1, 1, 1, 1,
1.418942, -0.3278763, 2.220418, 1, 1, 1, 1, 1,
1.43913, -2.146974, 0.969455, 1, 1, 1, 1, 1,
1.472068, -1.75746, 1.386021, 1, 1, 1, 1, 1,
1.474423, 0.5835879, 1.702369, 0, 0, 1, 1, 1,
1.480582, 1.59007, 1.453219, 1, 0, 0, 1, 1,
1.500102, -1.451914, 2.21067, 1, 0, 0, 1, 1,
1.519441, 0.7112179, 2.655013, 1, 0, 0, 1, 1,
1.523745, 1.579219, -0.9717113, 1, 0, 0, 1, 1,
1.543636, 0.03772439, 1.659031, 1, 0, 0, 1, 1,
1.548733, -0.6986371, 2.420509, 0, 0, 0, 1, 1,
1.554803, -0.1306118, 2.431873, 0, 0, 0, 1, 1,
1.574578, 0.1770832, 2.684436, 0, 0, 0, 1, 1,
1.580418, -0.7996867, 3.093331, 0, 0, 0, 1, 1,
1.591594, -0.4323927, 1.762477, 0, 0, 0, 1, 1,
1.602039, -0.5397149, 1.186356, 0, 0, 0, 1, 1,
1.606727, -0.09781842, 2.917582, 0, 0, 0, 1, 1,
1.61666, 0.1746351, -0.2427638, 1, 1, 1, 1, 1,
1.616947, 0.4292429, 4.021737, 1, 1, 1, 1, 1,
1.64254, 0.129991, 1.364332, 1, 1, 1, 1, 1,
1.64834, -0.270736, 0.0500516, 1, 1, 1, 1, 1,
1.648382, 3.117158, -2.095532, 1, 1, 1, 1, 1,
1.658788, 0.6671898, 1.864333, 1, 1, 1, 1, 1,
1.669416, 1.198677, 0.6038975, 1, 1, 1, 1, 1,
1.671886, 0.9364297, 2.317966, 1, 1, 1, 1, 1,
1.679399, 0.8641422, 0.2117934, 1, 1, 1, 1, 1,
1.67944, -0.5023791, -0.5500666, 1, 1, 1, 1, 1,
1.680592, 1.948835, 1.409005, 1, 1, 1, 1, 1,
1.699639, 0.5481911, 1.657206, 1, 1, 1, 1, 1,
1.706181, 0.6471183, 1.358275, 1, 1, 1, 1, 1,
1.717152, 0.2188718, 2.628835, 1, 1, 1, 1, 1,
1.731928, -0.516485, 1.922615, 1, 1, 1, 1, 1,
1.738312, -0.08198912, 1.727485, 0, 0, 1, 1, 1,
1.747621, -1.229773, 2.813945, 1, 0, 0, 1, 1,
1.775614, 0.7496483, 0.4478424, 1, 0, 0, 1, 1,
1.798803, -0.5793362, 2.271582, 1, 0, 0, 1, 1,
1.809512, -1.079958, 2.03763, 1, 0, 0, 1, 1,
1.8288, 0.338929, 2.329159, 1, 0, 0, 1, 1,
1.838324, -0.09129194, 2.934248, 0, 0, 0, 1, 1,
1.843409, -1.081329, 1.567328, 0, 0, 0, 1, 1,
1.862718, -0.5938235, 2.950008, 0, 0, 0, 1, 1,
1.866478, 0.9094656, 2.360003, 0, 0, 0, 1, 1,
1.866872, 1.118625, 0.7886328, 0, 0, 0, 1, 1,
1.886323, -0.8859768, 2.594958, 0, 0, 0, 1, 1,
1.887739, -0.7749929, 1.588456, 0, 0, 0, 1, 1,
1.889171, 0.8686531, 0.6003832, 1, 1, 1, 1, 1,
1.896343, 0.5853503, 1.164525, 1, 1, 1, 1, 1,
1.940665, -0.1505869, 0.6992316, 1, 1, 1, 1, 1,
1.950694, -0.4450248, 0.9701436, 1, 1, 1, 1, 1,
1.952144, -0.2679431, 2.819761, 1, 1, 1, 1, 1,
1.952255, -1.577354, 2.41352, 1, 1, 1, 1, 1,
1.964757, 1.035545, 1.674583, 1, 1, 1, 1, 1,
1.980213, -1.448703, 2.951684, 1, 1, 1, 1, 1,
1.986314, -1.082115, 0.708086, 1, 1, 1, 1, 1,
1.99144, 0.5572025, 1.949235, 1, 1, 1, 1, 1,
1.994309, -0.5817348, 1.582257, 1, 1, 1, 1, 1,
2.025007, -1.62681, 1.55022, 1, 1, 1, 1, 1,
2.033396, -0.4650663, 1.055643, 1, 1, 1, 1, 1,
2.063984, -1.087596, 3.627785, 1, 1, 1, 1, 1,
2.074186, 0.1271529, 0.2815791, 1, 1, 1, 1, 1,
2.076374, -0.6744491, 2.525219, 0, 0, 1, 1, 1,
2.077188, -0.7830468, 1.573397, 1, 0, 0, 1, 1,
2.07757, -1.145263, 1.681118, 1, 0, 0, 1, 1,
2.114913, -1.408378, 1.358378, 1, 0, 0, 1, 1,
2.143621, -0.336057, 2.547895, 1, 0, 0, 1, 1,
2.165523, 0.8359369, 0.5972174, 1, 0, 0, 1, 1,
2.189347, -0.3912602, 1.603128, 0, 0, 0, 1, 1,
2.196464, -1.852406, 1.592639, 0, 0, 0, 1, 1,
2.22917, 0.7716196, 0.4666004, 0, 0, 0, 1, 1,
2.305078, 0.685785, 0.8365311, 0, 0, 0, 1, 1,
2.359726, 1.228288, 2.104862, 0, 0, 0, 1, 1,
2.371447, 0.8990527, 1.476363, 0, 0, 0, 1, 1,
2.435732, 0.4419569, 1.38252, 0, 0, 0, 1, 1,
2.528093, -0.5888618, 1.430482, 1, 1, 1, 1, 1,
2.605904, -1.45556, 1.927712, 1, 1, 1, 1, 1,
2.648404, -0.575882, 1.453713, 1, 1, 1, 1, 1,
2.738952, -0.8612257, 1.400761, 1, 1, 1, 1, 1,
2.77337, 0.2105623, 1.812903, 1, 1, 1, 1, 1,
2.836112, 1.97468, 1.595875, 1, 1, 1, 1, 1,
2.951699, -0.2783626, 1.092423, 1, 1, 1, 1, 1
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
var radius = 9.422908;
var distance = 33.09756;
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
mvMatrix.translate( 0.3459747, -0.02342677, 0.4446874 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.09756);
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
